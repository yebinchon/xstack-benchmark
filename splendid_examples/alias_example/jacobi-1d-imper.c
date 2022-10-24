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
#define TSTEPS 10

/* Array initialization. */
  static
void init_array (int n,
    double A[n],
    double B[n])
{
  int i;

  for (i = 0; i < n; i++)
  {
    A[i] = ((double) i+ 2) / n;
    B[i] = ((double) i+ 3) / n;
  }
}


 void A_B_May_Alias(int tsteps,
           double * A,
           double * B)
 {

   int i,j;
   for (i = 0; i < tsteps; i++)
       for (j = 1; j < N - 1; j++)
          B[j] = (A[j-1] + A[j] + A[j + 1]) / 3;

  for (uint64_t i = 0; i < N; i++)
  {
    fprintf(stderr, "%0.2lf ", B[i]);
    if (i % 20 == 0) fprintf(stderr, "\n");
  }
  fprintf(stderr, "\n");
 }

int main(int argc, char** argv)
{
  int n = N;
  int tsteps = TSTEPS;
  int dump_code = atoi(argv[1]);
  double (*A)[n]; A = (double(*)[n])malloc(n*sizeof(double));
  double (*B)[n]; B = (double(*)[n])malloc(n*sizeof(double));

  init_array (n, *A, *B);
  A_B_May_Alias (tsteps, *A, *B);

  free((void*)A);
  free((void*)B);

  return 0;
}
