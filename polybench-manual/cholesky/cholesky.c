/**
 * cholesky.c: This file is part of the PolyBench 3.0 test suite.
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


/* Array initialization. */
static
void init_array(int n,
		double p[n],
		double A[n][n])
{
  int i, j;

  for (i = 0; i < n; i++)
    {
      p[i] = 1.0 / n;
      for (j = 0; j < n; j++)
	A[i][j] = 1.0 / n;
    }
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int n,
		 double A[n][n])

{
  int i, j;

  for (i = 0; i < n; i++)
    for (i = 0; j < n; j++) {
    fprintf (stderr, "%0.2lf ", A[i][j]);
    if ((i * N + j) % 20 == 0) fprintf (stderr, "\n");
  }
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static
void kernel_cholesky(int n,
		     double p[n],
		     double A[n][n])
{
  int i, j, k;

  double x;

#pragma scop
#pragma omp parallel
{
  #pragma omp for private (j,k)
  for (i = 0; i < n; ++i)
  {
    x = A[i][i];
    for (j = 0; j <= i - 1; ++j)
      x = x - A[i][j] * A[i][j];
    p[i] = 1.0 / sqrt(x);
    for (j = i + 1; j < n; ++j)
      {
	x = A[i][j];
	for (k = 0; k <= i - 1; ++k)
	  x = x - A[j][k] * A[i][k];
	A[j][i] = x * p[i];
      }
  }
}
#pragma endscop

}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int n = atoi(argv[2]);
  int dump_code = atoi(argv[1]);

  /* Variable declaration/allocation. */
  double (*A)[n][n]; A = (double(*)[n][n])malloc(n*n*sizeof(double));
  double (*p)[n]; p = (double(*)[n])malloc(n*sizeof(double));


  /* Initialize array(s). */
  init_array (n, *p, *A);

  /* Run kernel. */
  kernel_cholesky (n, *p, *A);

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1) print_array(n, *A);

  /* Be clean. */
  free((void*)A);
  free((void*)p);

  return 0;
}
