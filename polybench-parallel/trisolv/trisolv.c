/**
 * trisolv.c: This file is part of the PolyBench 3.0 test suite.
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

#define N 4000

/* Array initialization. */
static
void init_array(int n,
		double A[n][n],
		double x[n],
		double c[n])
{
  int i, j;

  for (i = 0; i < n; i++)
    {
      c[i] = x[i] = ((double) i) / n;
      for (j = 0; j < n; j++)
	A[i][j] = ((double) i*j) / n;
    }
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int n,
		 double x[n])

{
  int i;

  for (i = 0; i < n; i++) {
    fprintf (stderr, "%0.2lf ", x[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static
void kernel_trisolv(int n,
		    double A[n][n],
		    double x[n],
		    double c[n])
{
  int i, j;

//#pragma scop
//#pragma omp master
{
  //#pragma omp parallel private (i,j)
  {
  for (i = 0; i < n; i++)
    {
      x[i] = c[i];
      //#pragma omp for schedule(static)
      for (j = 0; j <= i - 1; j++)
        x[i] = x[i] - A[i][j] * x[j];
      x[i] = x[i] / A[i][i];
    }
  }
}
//#pragma endscop

}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int n = N;//atoi(argv[2]);
  int dump_code = atoi(argv[1]);

  /* Variable declaration/allocation. */
  double (*A)[n][n]; A = (double(*)[n][n])malloc(n*n*sizeof(double));
  double (*x)[n]; x = (double(*)[n])malloc(n*sizeof(double));
  double (*c)[n]; c = (double(*)[n])malloc(n*sizeof(double));


  /* Initialize array(s). */
  init_array (n, *A, *x, *c);

  /* Run kernel. */
  kernel_trisolv (n, *A, *x, *c);

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1) print_array(n, *x);

  /* Be clean. */
  free((void*)A);
  free((void*)x);
  free((void*)c);

  return 0;
}
