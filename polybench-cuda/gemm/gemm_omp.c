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


  static
void kernel_gemm(int ni, int nj, int nk,
    double alpha,
    double beta,
    double *C,
    double *A,
    double *B)
{
#pragma omp parallel default(none) firstprivate(ni, nj, nk, alpha, beta, C, A, B)
  {
    #pragma omp for collapse(2) schedule(static)
    for (int i = 0; i < ni; i++)
      for (int j = 0; j < nj; j++)
        C[i*nj+j] *= beta;

#pragma omp for collapse(2) schedule(static)
    for (int i = 0; i < ni; i++)
      for (int j = 0; j < nj; j++)
        for (int k = 0; k < nk; k++)
          C[i*nj+j] += alpha * A[i*nk+k] * B[k*nj+j];
  }
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



  kernel_gemm (ni, nj, nk,
      *alpha, *beta,
      C,
      A,
      B);





  if (dump_code == 1) print_array(ni, nj, C);


  free((void*)C);;
  free((void*)A);;
  free((void*)B);;

  return 0;
}
