/**
 * jacobi-1d-imper.c: This file is part of the PolyBench 3.0 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

#define N 1000

/* Array initialization. */
  static
void init_array (int n,
    double A[n],
    double B[n],
    double C[n])
{
  int i;

  for (i = 0; i < n; i++)
  {
    A[i] = ((double) i+ 2) / n;
    B[i] = ((double) i+ 3) / n;
    C[i] = ((double) i+ 4) / n;
  }
}


 void MayAlias(double * __restrict__ A, double * __restrict__ B, double * C)
 {
   int i;
   for (i = 0; i < N; i++){
     A[i] = M_PI*B[i] + exp(C[i]);
   }

  for (uint64_t i = 0; i < N; i++)
  {
    fprintf(stderr, "%0.2lf ", A[i]);
    if (i % 20 == 0) fprintf(stderr, "\n");
  }
  fprintf(stderr, "\n");
 }

int main(int argc, char** argv)
{
  int n = N;
  int dump_code = atoi(argv[1]);
  double *A = (double*) malloc(n * sizeof(double));
  double *B = (double*) malloc(n * sizeof(double));
  double *C = (double*) malloc(n * sizeof(double));

  init_array (n, A, B, C);
  MayAlias (A, B, C);

  free((void*)A);
  free((void*)B);
  free((void*)C);

  return 0;
}
