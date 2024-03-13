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
    for (j = 0; j < n; j++) {
      fprintf (stderr, "%0.2lf ", A[i][j]);
      if ((i * n + j) % 20 == 0) fprintf (stderr, "\n");
    }
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
  static
void kernel_cholesky(int n,
    double *A)
{
  for (int j = 0; j < n; j++) { // c0
    A[j*n+j] = sqrt(A[j*n+j]); // Stmt_if_then

    for (int i = j + 1; i < n; i++)
      A[i*n+j] /= A[j*n+j]; // Stmt_if_else

    for (int i = j + 1; i < n; i++)
      for (int k = j + 1; k <= i; k++) // c2
        A[i*n+k] -= A[i*n+j] * A[k*n+j];    // Stmt_for_body8
  }
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
  kernel_cholesky (n, A);

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1) print_array(n, *A);

  /* Be clean. */
  free((void*)A);
  free((void*)p);

  return 0;
}
