/**
 * adi.c: This file is part of the PolyBench 3.0 test suite.
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

#define N 2058
#define TSTEPS 50

/* Array initialization. */
static
void init_array (int n,
		 double X[n][n],
		 double A[n][n],
		 double B[n][n])
{
  int i, j;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      {
	    X[i][j] = ((double) i*(j+1) + 1) / n;
	    A[i][j] = ((double) i*(j+2) + 2) / n;
	    B[i][j] = ((double) i*(j+3) + 3) / n;
      }
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int n,
		 double X[n][n])

{
  int i, j;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++) {
      fprintf(stderr, "%0.2lf ", X[i][j]);
      if ((i * n + j) % 20 == 0) fprintf(stderr, "\n");
    }
  fprintf(stderr, "\n");
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static
void kernel_adi(int tsteps,
		int n,
		double X[n][n],
		double A[n][n],
		double B[n][n])
{
  int t, i1, i2;

  for (t = 0; t < tsteps; t++)
    {
      for (i1 = 0; i1 < n; i1++)
	for (i2 = 1; i2 < n; i2++)
	  {
	    X[i1][i2] = X[i1][i2] - X[i1][i2-1] * A[i1][i2] / B[i1][i2-1];
	    B[i1][i2] = B[i1][i2] - A[i1][i2] * A[i1][i2] / B[i1][i2-1];
	  }

      for (i1 = 0; i1 < n; i1++)
	X[i1][n-1] = X[i1][n-1] / B[i1][n-1];

      for (i1 = 0; i1 < n; i1++)
	for (i2 = 0; i2 < n-2; i2++)
	  X[i1][n-i2-2] = (X[i1][n-2-i2] - X[i1][n-2-i2-1] * A[i1][n-i2-3]) / B[i1][n-3-i2];

      for (i1 = 1; i1 < n; i1++)
	for (i2 = 0; i2 < n; i2++) {
	  X[i1][i2] = X[i1][i2] - X[i1-1][i2] * A[i1][i2] / B[i1-1][i2];
	  B[i1][i2] = B[i1][i2] - A[i1][i2] * A[i1][i2] / B[i1-1][i2];
	}

      for (i2 = 0; i2 < n; i2++)
	X[n-1][i2] = X[n-1][i2] / B[n-1][i2];

      for (i1 = 0; i1 < n-2; i1++)
	for (i2 = 0; i2 < n; i2++)
	  X[n-2-i1][i2] = (X[n-2-i1][i2] - X[n-i1-3][i2] * A[n-3-i1][i2]) / B[n-2-i1][i2];
    }
}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int n = N;//atoi(argv[2]);
  int tsteps = TSTEPS;//atoi(argv[3]);
  //int n = atoi(argv[2]);
  //int tsteps = atoi(argv[3]);
  int dump_code = atoi(argv[1]);

  /* Variable declaration/allocation. */

  double (*X)[n][n]; X = (double(*)[n][n])malloc(n*n*sizeof(double));
  double (*A)[n][n]; A = (double(*)[n][n])malloc(n*n*sizeof(double));
  double (*B)[n][n]; B = (double(*)[n][n])malloc(n*n*sizeof(double));


  /* Initialize array(s). */
  init_array (n, *X, *A, *B);

  /* Run kernel. */
  kernel_adi (tsteps, n, *X, *A, *B);


  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1) print_array(n, *X);

  /* Be clean. */
  free((void*)X);
  free((void*)A);
  free((void*)B);

  return 0;
}
