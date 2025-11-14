

// includes, system
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <cuda.h>
#include <sys/time.h>
#include <omp.h>
#include <fcntl.h>
#include <unistd.h>

// includes, project
#include "backprop.h"

#define ABS(x)          (((x) > 0.0f) ? (x) : (-(x)))

#define fastcopy(to,from,len)      \
{                                 \
  char *_to = (char *)(to);       \
  char *_from = (char *)(from);   \
  int _l = (len);                 \
  for (int _i = 0; _i < _l; _i++) \
    *_to++ = *_from++;            \
}

int layer_size = 0;

__global__ void
bpnn_layerforward_CUDA(float *input_cuda,
	                   float *output_hidden_cuda,
			           float *input_hidden_cuda,
			           float *hidden_partial_sum,
			           int in,
			           int hid)
{
   int by = blockIdx.y;
   int tx = threadIdx.x;
   int ty = threadIdx.y;

   int index =  ( hid + 1 ) * HEIGHT * by + ( hid + 1 ) * ty + tx + 1 + ( hid + 1 ) ;

   int index_in = HEIGHT * by + ty + 1;

   // __shared__ 
   float input_node[HEIGHT];
   //  __shared__ 
   
   float weight_matrix[HEIGHT][WIDTH];


   if ( tx == 0 )
   input_node[ty] = input_cuda[index_in] ;

   // __syncthreads();

   weight_matrix[ty][tx] = input_hidden_cuda[index];

   // __syncthreads();

   weight_matrix[ty][tx] = weight_matrix[ty][tx] * input_node[ty];

   // __syncthreads();

   // Only thread ty==0 performs the reduction sequentially
   if (ty == 0) {
     for (int row = 1; row < HEIGHT; row++) {
       weight_matrix[0][tx] = weight_matrix[0][tx] + weight_matrix[row][tx];
     }
   }


   //__syncthreads();

   input_hidden_cuda[index] = weight_matrix[ty][tx];

/*
   for ( unsigned int i = 2 ; i <= HEIGHT ; i *= 2){

	   unsigned int power_two = i - 1;

	   if( (ty & power_two) == 0 ) {
		weight_matrix[ty][tx] = weight_matrix[ty][tx] + weight_matrix[ty + power_two/2][tx];
	   }

   }
   */

   // __syncthreads();

   if ( tx == 0 ) {
	   hidden_partial_sum[by * hid + ty] = weight_matrix[tx][ty];
   }

}


__global__ void bpnn_adjust_weights_cuda(float * delta,
										 int hid,
										 float * ly,
										 int in,
										 float * w,
										 float * oldw)
{


   int by = blockIdx.y;

   int tx = threadIdx.x;
   int ty = threadIdx.y;

   int index =  ( hid + 1 ) * HEIGHT * by + ( hid + 1 ) * ty + tx + 1 + ( hid + 1 ) ;
   int index_y = HEIGHT * by + ty + 1;
   int index_x = tx + 1;
   //eta = 0.3;
   //momentum = 0.3;

   w[index] += ((ETA * delta[index_x] * ly[index_y]) + (MOMENTUM * oldw[index]));
   oldw[index] = ((ETA * delta[index_x] * ly[index_y]) + (MOMENTUM * oldw[index]));


   //__syncthreads();

   if (ty == 0 && by ==0){
   w[index_x] += ((ETA * delta[index_x]) + (MOMENTUM * oldw[index_x]));
   oldw[index_x] = ((ETA * delta[index_x]) + (MOMENTUM * oldw[index_x]));
   }


}


static float drnd()
{
  return (float)rand() / (float)BIGRND;
}

static float dpn1()
{
  return (drnd() * 2.0f) - 1.0f;
}

float squash(float x)
{
  return 1.0f / (1.0f + expf(-x));
}

static float *alloc_1d_dbl(int n)
{
  float *new_mem = (float *)malloc((size_t)(n) * sizeof(float));
  if (new_mem == NULL) {
    printf("ALLOC_1D_DBL: Couldn't allocate array of floats\n");
    return NULL;
  }
  return new_mem;
}

float **alloc_2d_dbl(int m, int n)
{
  float **new_mem = (float **)malloc((size_t)(m) * sizeof(float *));
  if (new_mem == NULL) {
    printf("ALLOC_2D_DBL: Couldn't allocate array of dbl ptrs\n");
    return NULL;
  }

  for (int i = 0; i < m; i++) {
    new_mem[i] = alloc_1d_dbl(n);
  }

  return new_mem;
}

static void bpnn_randomize_weights(float **w, int m, int n)
{
  for (int i = 0; i <= m; i++) {
    for (int j = 0; j <= n; j++) {
      w[i][j] = (float)rand() / (float)RAND_MAX;
    }
  }
}

static void bpnn_randomize_row(float *w, int m)
{
  for (int i = 0; i <= m; i++) {
    w[i] = 0.1f;
  }
}

static void bpnn_zero_weights(float **w, int m, int n)
{
  for (int i = 0; i <= m; i++) {
    for (int j = 0; j <= n; j++) {
      w[i][j] = 0.0f;
    }
  }
}

void bpnn_initialize(int seed)
{
  printf("Random number generator seed: %d\n", seed);
  srand(seed);
}

static BPNN *bpnn_internal_create(int n_in, int n_hidden, int n_out)
{
  BPNN *newnet = (BPNN *)malloc(sizeof(BPNN));
  if (newnet == NULL) {
    printf("BPNN_CREATE: Couldn't allocate neural network\n");
    return NULL;
  }

  newnet->input_n = n_in;
  newnet->hidden_n = n_hidden;
  newnet->output_n = n_out;
  newnet->input_units = alloc_1d_dbl(n_in + 1);
  newnet->hidden_units = alloc_1d_dbl(n_hidden + 1);
  newnet->output_units = alloc_1d_dbl(n_out + 1);

  newnet->hidden_delta = alloc_1d_dbl(n_hidden + 1);
  newnet->output_delta = alloc_1d_dbl(n_out + 1);
  newnet->target = alloc_1d_dbl(n_out + 1);

  newnet->input_weights = alloc_2d_dbl(n_in + 1, n_hidden + 1);
  newnet->hidden_weights = alloc_2d_dbl(n_hidden + 1, n_out + 1);

  newnet->input_prev_weights = alloc_2d_dbl(n_in + 1, n_hidden + 1);
  newnet->hidden_prev_weights = alloc_2d_dbl(n_hidden + 1, n_out + 1);

  return newnet;
}

void bpnn_free(BPNN *net)
{
  if (net == NULL) {
    return;
  }

  int n1 = net->input_n;
  int n2 = net->hidden_n;

  free(net->input_units);
  free(net->hidden_units);
  free(net->output_units);

  free(net->hidden_delta);
  free(net->output_delta);
  free(net->target);

  for (int i = 0; i <= n1; i++) {
    free(net->input_weights[i]);
    free(net->input_prev_weights[i]);
  }
  free(net->input_weights);
  free(net->input_prev_weights);

  for (int i = 0; i <= n2; i++) {
    free(net->hidden_weights[i]);
    free(net->hidden_prev_weights[i]);
  }
  free(net->hidden_weights);
  free(net->hidden_prev_weights);

  free(net);
}

BPNN *bpnn_create(int n_in, int n_hidden, int n_out)
{
  BPNN *newnet = bpnn_internal_create(n_in, n_hidden, n_out);

  if (newnet == NULL) {
    return NULL;
  }

#ifdef INITZERO
  bpnn_zero_weights(newnet->input_weights, n_in, n_hidden);
#else
  bpnn_randomize_weights(newnet->input_weights, n_in, n_hidden);
#endif
  bpnn_randomize_weights(newnet->hidden_weights, n_hidden, n_out);
  bpnn_zero_weights(newnet->input_prev_weights, n_in, n_hidden);
  bpnn_zero_weights(newnet->hidden_prev_weights, n_hidden, n_out);
  bpnn_randomize_row(newnet->target, n_out);
  return newnet;
}

void bpnn_layerforward(float *l1, float *l2, float **conn, int n1, int n2)
{
  float sum;

  l1[0] = 1.0f;
#ifdef OPEN
  omp_set_num_threads(NUM_THREAD);
#pragma omp parallel for shared(conn, n1, n2, l1) private(sum) schedule(static)
#endif
  for (int j = 1; j <= n2; j++) {
    sum = 0.0f;
    for (int k = 0; k <= n1; k++) {
      sum += conn[k][j] * l1[k];
    }
    l2[j] = squash(sum);
  }
}

void bpnn_output_error(float *delta, float *target, float *output, int nj, float *err)
{
  float errsum = 0.0f;
  for (int j = 1; j <= nj; j++) {
    float o = output[j];
    float t = target[j];
    delta[j] = o * (1.0f - o) * (t - o);
    errsum += ABS(delta[j]);
  }
  *err = errsum;
}

void bpnn_hidden_error(float *delta_h,
                       int nh,
                       float *delta_o,
                       int no,
                       float **who,
                       float *hidden,
                       float *err)
{
  float errsum = 0.0f;
  for (int j = 1; j <= nh; j++) {
    float h = hidden[j];
    float sum = 0.0f;
    for (int k = 1; k <= no; k++) {
      sum += delta_o[k] * who[j][k];
    }
    delta_h[j] = h * (1.0f - h) * sum;
    errsum += ABS(delta_h[j]);
  }
  *err = errsum;
}

void bpnn_adjust_weights(float *delta,
                         int ndelta,
                         float *ly,
                         int nly,
                         float **w,
                         float **oldw)
{
  ly[0] = 1.0f;

#ifdef OPEN
  omp_set_num_threads(NUM_THREAD);
#pragma omp parallel for shared(oldw, w, delta) schedule(static)
#endif
  for (int j = 1; j <= ndelta; j++) {
    for (int k = 0; k <= nly; k++) {
      float new_dw = ((ETA * delta[j] * ly[k]) + (MOMENTUM * oldw[k][j]));
      w[k][j] += new_dw;
      oldw[k][j] = new_dw;
    }
  }
}

void bpnn_feedforward(BPNN *net)
{
  int in = net->input_n;
  int hid = net->hidden_n;
  int out = net->output_n;

  bpnn_layerforward(net->input_units, net->hidden_units, net->input_weights, in, hid);
  bpnn_layerforward(net->hidden_units, net->output_units, net->hidden_weights, hid, out);
}

void bpnn_train(BPNN *net, float *eo, float *eh)
{
  int in = net->input_n;
  int hid = net->hidden_n;
  int out = net->output_n;

  bpnn_layerforward(net->input_units, net->hidden_units, net->input_weights, in, hid);
  bpnn_layerforward(net->hidden_units, net->output_units, net->hidden_weights, hid, out);

  bpnn_output_error(net->output_delta, net->target, net->output_units, out, eo);
  bpnn_hidden_error(net->hidden_delta, hid, net->output_delta, out, net->hidden_weights, net->hidden_units, eh);

  bpnn_adjust_weights(net->output_delta, out, net->hidden_units, hid, net->hidden_weights, net->hidden_prev_weights);
  bpnn_adjust_weights(net->hidden_delta, hid, net->input_units, in, net->input_weights, net->input_prev_weights);
}

void bpnn_save(BPNN *net, char *filename)
{
  int n1 = net->input_n;
  int n2 = net->hidden_n;
  int n3 = net->output_n;
  FILE *pFile = fopen(filename, "w+");
  if (pFile == NULL) {
    printf("BPNN_SAVE: Cannot create '%s'\n", filename);
    return;
  }

  printf("Saving %dx%dx%d network to '%s'\n", n1, n2, n3, filename);

  fwrite(&n1, sizeof(int), 1, pFile);
  fwrite(&n2, sizeof(int), 1, pFile);
  fwrite(&n3, sizeof(int), 1, pFile);

  int memcnt = 0;
  float **w = net->input_weights;
  int total_elems = (n1 + 1) * (n2 + 1);
  char *mem = (char *)malloc((size_t)(total_elems) * sizeof(float));
  for (int i = 0; i <= n1; i++) {
    for (int j = 0; j <= n2; j++) {
      float dvalue = w[i][j];
      fastcopy(&mem[memcnt], &dvalue, sizeof(float));
      memcnt += sizeof(float);
    }
  }
  fwrite(mem, sizeof(float), (size_t)(total_elems), pFile);
  free(mem);

  memcnt = 0;
  w = net->hidden_weights;
  total_elems = (n2 + 1) * (n3 + 1);
  mem = (char *)malloc((size_t)(total_elems) * sizeof(float));
  for (int i = 0; i <= n2; i++) {
    for (int j = 0; j <= n3; j++) {
      float dvalue = w[i][j];
      fastcopy(&mem[memcnt], &dvalue, sizeof(float));
      memcnt += sizeof(float);
    }
  }
  fwrite(mem, sizeof(float), (size_t)(total_elems), pFile);
  free(mem);

  fclose(pFile);
}

BPNN *bpnn_read(char *filename)
{
  int fd = open(filename, O_RDONLY, 0644);
  if (fd == -1) {
    return NULL;
  }

  int n1, n2, n3;
  read(fd, &n1, sizeof(int));
  read(fd, &n2, sizeof(int));
  read(fd, &n3, sizeof(int));

  BPNN *newnet = bpnn_internal_create(n1, n2, n3);
  if (newnet == NULL) {
    close(fd);
    return NULL;
  }

  int total_elems = (n1 + 1) * (n2 + 1);
  char *mem = (char *)malloc((size_t)(total_elems) * sizeof(float));
  int memcnt = 0;
  read(fd, mem, (size_t)(total_elems) * sizeof(float));
  for (int i = 0; i <= n1; i++) {
    for (int j = 0; j <= n2; j++) {
      fastcopy(&(newnet->input_weights[i][j]), &mem[memcnt], sizeof(float));
      memcnt += sizeof(float);
    }
  }
  free(mem);

  total_elems = (n2 + 1) * (n3 + 1);
  mem = (char *)malloc((size_t)(total_elems) * sizeof(float));
  memcnt = 0;
  read(fd, mem, (size_t)(total_elems) * sizeof(float));
  for (int i = 0; i <= n2; i++) {
    for (int j = 0; j <= n3; j++) {
      fastcopy(&(newnet->hidden_weights[i][j]), &mem[memcnt], sizeof(float));
      memcnt += sizeof(float);
    }
  }
  free(mem);
  close(fd);

  bpnn_zero_weights(newnet->input_prev_weights, n1, n2);
  bpnn_zero_weights(newnet->hidden_prev_weights, n2, n3);

  return newnet;
}


static void load(BPNN *net)
{
  float *units = net->input_units;
  int nr = layer_size;

  int k = 1;
  for (int i = 0; i < nr; i++) {
    units[k] = (float)rand() / (float)RAND_MAX;
    k++;
  }
}


////////////////////////////////////////////////////////////////////////////////
// Application entry plumbing (merged from facetrain.c)
////////////////////////////////////////////////////////////////////////////////

void bpnn_train_cuda(BPNN *net, float *eo, float *eh);

static void backprop_face()
{
  BPNN *net = bpnn_create(layer_size, 16, 1);

  /*
  if (net == NULL) {
    fprintf(stderr, "Failed to create neural network\n");
    exit(EXIT_FAILURE);
  }
  */

  float out_err = 0.0f;
  float hid_err = 0.0f;

  printf("Input layer size : %d\n", layer_size);
  load(net);
  printf("Starting training kernel\n");
  bpnn_train_cuda(net, &out_err, &hid_err);
  bpnn_free(net);
  printf("Training done\n");
}

int setup(int argc, char **argv)
{
  if (argc != 2) {
    fprintf(stderr, "usage: backprop <num of input elements>\n");
    return EXIT_FAILURE;
  }

  layer_size = atoi(argv[1]);
  if (layer_size % 16 != 0) {
    fprintf(stderr, "The number of input points must be divided by 16\n");
    return EXIT_FAILURE;
  }

  const int seed = 7;
  bpnn_initialize(seed);
  backprop_face();

  return EXIT_SUCCESS;
}

double gettime() {
  struct timeval t;
  gettimeofday(&t,NULL);
  return t.tv_sec+t.tv_usec*1e-6;
}

unsigned int num_threads = 0;
unsigned int num_blocks = 0;

int main(int argc, char **argv)
{
  return setup(argc, argv);
}


void bpnn_train_cuda(BPNN *net, float *eo, float *eh)
{
  int in, hid, out;
  float out_err, hid_err;
  
  in = net->input_n;
  hid = net->hidden_n;
  out = net->output_n;   
   
#ifdef GPU  
  int m = 0;
  float *input_hidden_cuda;
  float *input_cuda;
  float *output_hidden_cuda;
  float *partial_sum;
  float *hidden_partial_sum;
  float *hidden_delta_cuda;
  float *input_prev_weights_cuda;
  float sum;
  float *input_weights_one_dim;
  float *input_weights_prev_one_dim;
  num_blocks = in / 16;  
  dim3  grid( 1 , num_blocks);
  dim3  threads(16 , 16);
  
  input_weights_one_dim = (float *)malloc((in + 1) * (hid + 1) * sizeof(float));
  input_weights_prev_one_dim = (float *)malloc((in + 1) * (hid + 1) * sizeof(float));
  partial_sum = (float *)malloc(num_blocks * WIDTH * sizeof(float));

  if (input_weights_one_dim == NULL || input_weights_prev_one_dim == NULL || partial_sum == NULL) {
    fprintf(stderr, "Failed to allocate host buffers for CUDA training\n");
    exit(EXIT_FAILURE);
  }
 
  // this preprocessing stage is added to correct the bugs of wrong memcopy using two-dimensional net->inputweights
  for (int k = 0; k <= in; k++) {	
   for (int j = 0; j <= hid; j++) {
	  input_weights_one_dim[m] = net->input_weights[k][j];
	  input_weights_prev_one_dim[m] = net-> input_prev_weights[k][j];
	  m++;
    }
  }
  
  cudaMalloc((void**) &input_cuda, (in + 1) * sizeof(float));
  cudaMalloc((void**) &output_hidden_cuda, (hid + 1) * sizeof(float));
  cudaMalloc((void**) &input_hidden_cuda, (in + 1) * (hid + 1) * sizeof(float));
  cudaMalloc((void**) &hidden_partial_sum, num_blocks * WIDTH * sizeof(float));
  
  
#endif

#ifdef CPU

  printf("Performing CPU computation\n");
  bpnn_layerforward(net->input_units, net->hidden_units,net->input_weights, in, hid);

#endif

#ifdef GPU
 
  printf("Performing GPU computation\n");
  
  //printf("in= %d, hid = %d, numblocks = %d\n", in, hid, num_blocks);
  
  float *input_units_host = net->input_units;
  cudaMemcpy(input_cuda, input_units_host, (in + 1) * sizeof(float), cudaMemcpyHostToDevice);
  cudaMemcpy(input_hidden_cuda, input_weights_one_dim, (in + 1) * (hid + 1) * sizeof(float), cudaMemcpyHostToDevice);

  
  
  bpnn_layerforward_CUDA<<< grid, threads >>>(input_cuda,
	                                          output_hidden_cuda,
											  input_hidden_cuda,
											  hidden_partial_sum,
											  in,
											  hid);
 
  cudaThreadSynchronize();
  
  cudaError_t error = cudaGetLastError();
	if (error != cudaSuccess) {
		printf("bpnn kernel error: %s\n", cudaGetErrorString(error));
		exit(EXIT_FAILURE);
	}
  
  cudaMemcpy(partial_sum, hidden_partial_sum, num_blocks * WIDTH * sizeof(float), cudaMemcpyDeviceToHost);
     
  for (int j = 1; j <= hid; j++) {
    sum = 0.0;
    for (int k = 0; k < num_blocks; k++) {	
      sum += partial_sum[k * hid + j-1] ;
    }
	sum += net->input_weights[0][j];
	net-> hidden_units[j] = (float)(1.0 / (1.0 + expf(-sum)));
  }
  #endif

  bpnn_layerforward(net->hidden_units, net->output_units, net->hidden_weights, hid, out);
  bpnn_output_error(net->output_delta, net->target, net->output_units, out, &out_err);
  bpnn_hidden_error(net->hidden_delta, hid, net->output_delta, out, net->hidden_weights, net->hidden_units, &hid_err);  
  bpnn_adjust_weights(net->output_delta, out, net->hidden_units, hid, net->hidden_weights, net->hidden_prev_weights);

#ifdef CPU

  bpnn_adjust_weights(net->hidden_delta, hid, net->input_units, in, net->input_weights, net->input_prev_weights);

#endif  


#ifdef GPU

  cudaMalloc((void**) &hidden_delta_cuda, (hid + 1) * sizeof(float));
  cudaMalloc((void**) &input_prev_weights_cuda, (in + 1) * (hid + 1) * sizeof(float));

  float *hidden_delta_host = net->hidden_delta;
  cudaMemcpy(hidden_delta_cuda, hidden_delta_host, (hid + 1) * sizeof(float), cudaMemcpyHostToDevice);
  cudaMemcpy(input_prev_weights_cuda, input_weights_prev_one_dim, (in + 1) * (hid + 1) * sizeof(float), cudaMemcpyHostToDevice);
  cudaMemcpy(input_hidden_cuda, input_weights_one_dim, (in + 1) * (hid + 1) * sizeof(float), cudaMemcpyHostToDevice);


  bpnn_adjust_weights_cuda<<< grid, threads >>>(hidden_delta_cuda,  
												hid, 
												input_cuda, 
												in,
												input_hidden_cuda, 
												input_prev_weights_cuda
												);

  cudaMemcpy(input_units_host, input_cuda, (in + 1) * sizeof(float), cudaMemcpyDeviceToHost);
  cudaMemcpy(input_weights_one_dim, input_hidden_cuda, (in + 1) * (hid + 1) * sizeof(float), cudaMemcpyDeviceToHost);
    
  cudaFree(input_cuda);
  cudaFree(output_hidden_cuda);
  cudaFree(input_hidden_cuda);
  cudaFree(hidden_partial_sum);
  cudaFree(input_prev_weights_cuda);
  cudaFree(hidden_delta_cuda);
  
  free(partial_sum);
  free(input_weights_one_dim);
  free(input_weights_prev_one_dim);

#endif   

}
