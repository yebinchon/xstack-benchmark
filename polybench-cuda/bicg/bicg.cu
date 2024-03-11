/**
 * bicg.c: This file is part of the PolyBench 3.0 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

//#define NX 40000
#define RUN 50

static unsigned num_blocks(int num, int factor) {
  return (num + factor - 1) / factor;
}



__global__ void kernel_q(int m, int n, double *A, double s[], double q[], double p[], double r[]) {
  int i = blockDim.x * blockIdx.x + threadIdx.x;

  if (i < n) {
    q[i] = 0;
    for (int j = 0; j < m; j++)
      q[i] += A[i * m + j] * p[j];
  }
}


__global__ void kernel_s(int m, int n, double *A, double s[], double q[], double p[], double r[]) {
  int j = blockDim.x * blockIdx.x + threadIdx.x;

  if (j < m) {
    s[j] = 0;
    for (int i = 0; i < n; i++)
      s[j] += r[i] * A[i * m + j];
  }
}


/* Array initialization. */
static
void init_array (int nx, int ny,
		 double *A,
		 double *r,
		 double *p)
{
  int i, j;

  for (i = 0; i < ny; i++)
    p[i] = i * M_PI;
  for (i = 0; i < nx; i++) {
    r[i] = i * M_PI;
    for (j = 0; j < ny; j++)
      A[i*ny+j] = ((double) i*(j+1))/nx;
  }
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int nx, int ny,
		 double *s,
		 double *q)

{
  int i;

  for (i = 0; i < ny; i++) {
    fprintf (stderr, "%0.2lf ", s[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }
  for (i = 0; i < nx; i++) {
    fprintf (stderr, "%0.2lf ", q[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }
  fprintf (stderr, "\n");
}


static void kernel(int m, int n, double *A, double s[], double q[], double p[], double r[]) {
  double *dev_A;
  double *dev_s;
  double *dev_q;
  double *dev_p;
  double *dev_r;
  cudaMalloc(&dev_A, m*n*sizeof(double));
  cudaMalloc(&dev_s, n*sizeof(double));
  cudaMalloc(&dev_q, m*sizeof(double));
  cudaMalloc(&dev_p, n*sizeof(double));
  cudaMalloc(&dev_r, m*sizeof(double));
  cudaMemcpy(dev_A, A, m*n*sizeof(double), cudaMemcpyHostToDevice);
  cudaMemcpy(dev_s, s, n*sizeof(double), cudaMemcpyHostToDevice);
  cudaMemcpy(dev_q, q, m*sizeof(double), cudaMemcpyHostToDevice);
  cudaMemcpy(dev_p, p, n*sizeof(double), cudaMemcpyHostToDevice);
  cudaMemcpy(dev_r, r, m*sizeof(double), cudaMemcpyHostToDevice);
  const unsigned threadsPerBlock = 256;
  kernel_q<<<num_blocks(n, threadsPerBlock), threadsPerBlock>>>(m, n, dev_A, dev_s, dev_q, dev_p, dev_r);
  kernel_s<<<num_blocks(m, threadsPerBlock), threadsPerBlock>>>(m, n, dev_A, dev_s, dev_q, dev_p, dev_r);
  cudaMemcpy(s, dev_s, n*sizeof(double), cudaMemcpyDeviceToHost);
  cudaMemcpy(q, dev_q, m*sizeof(double), cudaMemcpyDeviceToHost);
  cudaFree((void*)dev_A);
  cudaFree((void*)dev_s);
  cudaFree((void*)dev_q);
  cudaFree((void*)dev_p);
  cudaFree((void*)dev_r);
}

int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int nx =atoi(argv[2]);
  int ny = atoi(argv[3]);
  int dump_code = atoi(argv[1]);

  for(int t = 0; t < RUN; t++) {

  /* Variable declaration/allocation. */
  double *A = (double*)malloc(nx*ny*sizeof(double));
  double *s = (double*)malloc(ny*sizeof(double));
  double *q = (double*)malloc(nx*sizeof(double));
  double *p = (double*)malloc(ny*sizeof(double));
  double *r = (double*)malloc(nx*sizeof(double));
  /* Initialize array(s). */
  init_array (nx, ny, A, r, p);


  kernel(nx, ny, A, s, q, p, r);

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1) print_array(nx, ny, s, q);

  /* Be clean. */
  free((void*)A);
  free((void*)s);
  free((void*)q);
  free((void*)p);
  free((void*)r);

  }

  return 0;
}
