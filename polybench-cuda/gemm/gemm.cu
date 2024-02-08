/**
 * gemm.c: This file is part of the PolyBench/C 3.2 test suite.
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

__global__ void kernel_dev(int ni, int nj, int nk,
                           double alpha,
                           double beta,
                           double *C, double *A, double *B) {
  int i = blockDim.x * blockIdx.x + threadIdx.x;
  int j = blockDim.y * blockIdx.y + threadIdx.y;
  int k;


  if (i < ni && j < nj) {
    C[i * nj + j] *= beta;


    for (k = 0; k < nk; k++)
      C[i * nj + j] += alpha * A[i * nk + k] * B[k * nj + j];
  }
}


static unsigned num_blocks(int num, int factor) {
  return (num + factor - 1) / factor;
}

static void kernel(int ni, int nj, int nk,
                   double alpha,
                   double beta,
                   double *C, double *A, double *B) {

  unsigned threadsPerBlock = 256;
  dim3 block(threadsPerBlock / 32, 32, 1);
  dim3 grid(num_blocks(ni, block.x), num_blocks(nj, block.y), 1);
  kernel_dev<<<grid, block>>>(ni, nj, nk, alpha, beta, C, A, B);
}

  static
void init_array(int ni, int nj, int nk,
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
    for (j = 0; j < nj; j++)
      C[i*nj+j] = ((double) i*j) / ni;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      A[i*nk+j] = ((double) i*j) / ni;
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      B[i*nj+j] = ((double) i*j) / ni;
}




  static
void print_array(int ni, int nj,
    double *C)
{
  int i, j;

  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++) {
      fprintf (stderr, "%0.2lf ", C[i*nj+j]);
      if ((i * ni + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
}


int main(int argc, char** argv)
{

  int dump_code = atoi(argv[1]);
  int ni = atoi(argv[2]);
  int nj = atoi(argv[3]);
  int nk = atoi(argv[4]);

  double *alpha = (double*)malloc(sizeof(double));
  double *beta = (double*)malloc(sizeof(double));
  double *A = (double*)malloc(ni*nk*sizeof(double));
  double *B = (double*)malloc(nk*nj*sizeof(double));
  double *C = (double*)malloc(ni*nj*sizeof(double));


  init_array (ni, nj, nk, alpha, beta,
      C,
      A,
      B);


  double *dev_A;
  double *dev_B;
  double *dev_C;
  double *dev_alpha;
  double *dev_beta;
  cudaMalloc(&dev_A, ni*nk*sizeof(double));
  cudaMalloc(&dev_B, nk*nj*sizeof(double));
  cudaMalloc(&dev_C, ni*nj*sizeof(double));
  cudaMalloc(&dev_alpha, sizeof(double));
  cudaMalloc(&dev_beta, sizeof(double));
  cudaMemcpy(dev_A, A, ni*nk*sizeof(double), cudaMemcpyHostToDevice);
  cudaMemcpy(dev_B, B, nk*nj*sizeof(double), cudaMemcpyHostToDevice);
  cudaMemcpy(dev_C, C, ni*nj*sizeof(double), cudaMemcpyHostToDevice);
  cudaMemcpy(dev_alpha, alpha, sizeof(double), cudaMemcpyHostToDevice);
  cudaMemcpy(dev_beta, beta, sizeof(double), cudaMemcpyHostToDevice);


  kernel(ni, nj, nk, *alpha, *beta, dev_C, dev_A, dev_B);
  cudaMemcpy(C, dev_C, ni*nj*sizeof(double), cudaMemcpyDeviceToHost);




  if (dump_code == 1) print_array(ni, nj, C);


  free((void*)C);
  free((void*)A);
  free((void*)B);
  free((void*)alpha);
  free((void*)beta);

  cudaFree((void*)dev_A);
  cudaFree((void*)dev_B);
  cudaFree((void*)dev_C);
  cudaFree((void*)dev_alpha);
  cudaFree((void*)dev_beta);
  return 0;
}
