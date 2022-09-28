/**
 * mvt.c: This file is part of the PolyBench 3.0 test suite.
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

/* Include benchmark-specific header. */
/* Default data type is double, default size is 4000. */

/* Array initialization. */
static
void init_array(int n,
		double x1[n],
		double x2[n],
		double y_1[n],
		double y_2[n],
		double A[n][n])
{
  int i, j;

  for (i = 0; i < n; i++)
    {
      x1[i] = ((double) i) / n;
      x2[i] = ((double) i + 1) / n;
      y_1[i] = ((double) i + 3) / n;
      y_2[i] = ((double) i + 4) / n;
      for (j = 0; j < n; j++)
	A[i][j] = ((double) i*j) / n;
    }
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int n,
		 double x1[n],
		 double x2[n])

{
  int i;

  for (i = 0; i < n; i++) {
    fprintf (stderr, "%0.2lf", x1[i]);
    fprintf (stderr, "%0.2lf", x2[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static
void kernel_mvt(int n,
		double x1[n],
		double x2[n],
		double y_1[n],
		double y_2[n],
		double A[n][n])
{
  int i, j;

{
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      x1[i] = x1[i] + A[i][j] * y_1[j];
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      x2[i] = x2[i] + A[j][i] * y_2[j];
}

}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int dump_code = atoi(argv[1]);
  int n = N;//atoi(argv[2]);

  /* Variable declaration/allocation. */
  double (*A)[n][n]; A = (double(*)[n][n])malloc(n*n*sizeof(double));
  double (*x1)[n]; x1 = (double(*)[n])malloc(n*sizeof(double));
  double (*x2)[n]; x2 = (double(*)[n])malloc(n*sizeof(double));
  double (*y_1)[n]; y_1 = (double(*)[n])malloc(n*sizeof(double));
  double (*y_2)[n]; y_2 = (double(*)[n])malloc(n*sizeof(double));


  /* Initialize array(s). */
  init_array (n,
	      *x1,
	      *x2,
	      *y_1,
	      *y_2,
	      *A);

  /* Run kernel. */
  kernel_mvt (n,
	      *x1,
	      *x2,
	      *y_1,
	      *y_2,
	      *A);

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1) print_array(n, *x1, *x2);

  /* Be clean. */
  free((void*)A);
  free((void*)x1);
  free((void*)x2);
  free((void*)y_1);
  free((void*)y_2);

  return 0;
}
