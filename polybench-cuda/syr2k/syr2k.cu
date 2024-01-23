/**
 * syr2k.c: This file is part of the PolyBench/C 3.2 test suite.
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


static unsigned num_blocks(int num, int factor) {
  return (num + factor - 1) / factor;
}


__global__ void kernel_beta(int n, int m,
                            double alpha, double beta,
                            double *C,
                            double *A,
                            double *B) {
  int i = blockDim.x * blockIdx.x + threadIdx.x;
  int j = blockDim.y * blockIdx.y + threadIdx.y;


  if (i < n && j <= i)
    C[i * n + j] *= beta;
}

__global__ void kernel_product(int n, int m,
                               double alpha, double beta,
                               double *C,
                               double *A,
                               double *B) {
  int i = blockDim.x * blockIdx.x + threadIdx.x;
  int j = blockDim.y * blockIdx.y + threadIdx.y;


  if (i < n && j <= i) {
    for (int k = 0; k < m; k++)
      C[i * n + j] += A[j * m + k] * alpha * B[i * m + k] + B[j * m + k] * alpha * A[i * m + k];
  }
}



static void kernel(int n, int m,
                   double alpha, double beta,
                   double *C,
                   double *A,
                   double *B) {
  const unsigned int threadsPerBlock = 256;

  {
    dim3 block(threadsPerBlock / 32, 32, 1);
    dim3 grid(num_blocks(n, block.x), num_blocks(n, block.y), 1);
    kernel_beta<<<grid, block>>>(n, m, alpha, beta, C, A, B);
  }

  {
    dim3 block(threadsPerBlock / 32, 32, 1);
    dim3 grid(num_blocks(n, block.x), num_blocks(n, block.y), 1);
    kernel_product<<<grid, block>>>(n, m, alpha, beta, C, A, B);
  }
}

  static
void init_array(int ni, int nj,
    double *alpha,
    double *beta,
    double *C,
    double *A,
    double *B)
{
  int i, j;

  *alpha = 32412;
  *beta = 2123;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++) {
      A[i*nj+j] = ((double) i*j) / ni;
      B[i*nj+j] = ((double) i*j) / ni;
    }
  for (i = 0; i < ni; i++)
    for (j = 0; j < ni; j++)
      C[i*ni+j] = ((double) i*j) / ni;
}




  static
void print_array(int ni,
    double *C)
{
  int i, j;

  for (i = 0; i < ni; i++)
    for (j = 0; j < ni; j++) {
      fprintf (stderr, "%0.2lf ", C[i*ni+j]);
      if ((i * ni + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
}





int main(int argc, char** argv)
{
  int dump_code = atoi(argv[1]);
  int ni = atoi(argv[2]);
  int nj = atoi(argv[3]);

  double *alpha = (double*)malloc(sizeof(double));
  double *beta = (double*)malloc(sizeof(double));
  double *A = (double*)malloc(ni*nj*sizeof(double));
  double *B = (double*)malloc(ni*nj*sizeof(double));
  double *C = (double*)malloc(ni*ni*sizeof(double));


  init_array (ni, nj, alpha, beta,
      C,
      A,
      B);


  double *dev_A;
  double *dev_B;
  double *dev_C;
  double *dev_alpha;
  double *dev_beta;
  cudaMalloc(&dev_A, ni*nj*sizeof(double));
  cudaMalloc(&dev_B, ni*nj*sizeof(double));
  cudaMalloc(&dev_C, ni*ni*sizeof(double));
  cudaMalloc(&dev_alpha, sizeof(double));
  cudaMalloc(&dev_beta, sizeof(double));
  cudaMemcpy(dev_A, A, ni*nj*sizeof(double), cudaMemcpyHostToDevice);
  cudaMemcpy(dev_B, B, ni*nj*sizeof(double), cudaMemcpyHostToDevice);
  cudaMemcpy(dev_C, C, ni*ni*sizeof(double), cudaMemcpyHostToDevice);
  cudaMemcpy(dev_alpha, alpha, sizeof(double), cudaMemcpyHostToDevice);
  cudaMemcpy(dev_beta, beta, sizeof(double), cudaMemcpyHostToDevice);


  kernel(ni, nj, *alpha, *beta, dev_C, dev_A, dev_B);
  cudaMemcpy(C, dev_C, ni*nj*sizeof(double), cudaMemcpyDeviceToHost);




  if (dump_code == 1) print_array(ni, C);


  free((void*)C);;
  free((void*)A);;
  free((void*)B);;
  free((void*)alpha);
  free((void*)beta);

  cudaFree((void*)dev_A);
  cudaFree((void*)dev_B);
  cudaFree((void*)dev_C);
  cudaFree((void*)dev_alpha);
  cudaFree((void*)dev_beta);

  return 0;
}
