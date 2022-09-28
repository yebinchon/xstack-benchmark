/**
 * gemver.c: This file is part of the PolyBench 3.0 test suite.
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

#define N 30000

/* Array initialization. */
static
void init_array (int n,
		 double *alpha,
		 double *beta,
		 double A[n][n],
		 double u1[n],
		 double v1[n],
		 double u2[n],
		 double v2[n],
		 double w[n],
		 double x[n],
		 double y[n],
		 double z[n])
{
  int i, j;

  *alpha = 43532;
  *beta = 12313;

  for (i = 0; i < n; i++)
    {
      u1[i] = i;
      u2[i] = (i+1)/n/2.0;
      v1[i] = (i+1)/n/4.0;
      v2[i] = (i+1)/n/6.0;
      y[i] = (i+1)/n/8.0;
      z[i] = (i+1)/n/9.0;
      x[i] = 0.0;
      w[i] = 0.0;
      for (j = 0; j < n; j++)
	A[i][j] = ((double) i*j) / n;
    }
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int n,
		 double w[n])
{
  int i;

  for (i = 0; i < n; i++) {
    fprintf (stderr, "%0.2lf ", w[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static
void kernel_gemver(int n,
		   double alpha,
		   double beta,
		   double A[n][n],
		   double u1[n],
		   double v1[n],
		   double u2[n],
		   double v2[n],
		   double w[n],
		   double x[n],
		   double y[n],
		   double z[n])
{
  int i, j;

//#pragma scop
//#pragma omp parallel
//{
  //#pragma omp for private (j)
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      A[i][j] = A[i][j] + u1[i] * v1[j] + u2[i] * v2[j];

  //#pragma omp for private (j)
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      x[i] = x[i] + beta * A[j][i] * y[j];

  //#pragma omp for
  for (i = 0; i < n; i++)
    x[i] = x[i] + z[i];

  //#pragma omp for private (j)
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      w[i] = w[i] +  alpha * A[i][j] * x[j];
//}
//#pragma endscop
}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int n = N;//atoi(argv[2]);
  int dump_code = atoi(argv[1]);

  /* Variable declaration/allocation. */
  double alpha;
  double beta;
  double (*A)[n][n]; A = (double(*)[n][n])malloc(n*n*sizeof(double));
  double (*u1)[n]; u1 = (double(*)[n])malloc(n*sizeof(double));
  double (*v1)[n]; v1 = (double(*)[n])malloc(n*sizeof(double));
  double (*u2)[n]; u2 = (double(*)[n])malloc(n*sizeof(double));
  double (*v2)[n]; v2 = (double(*)[n])malloc(n*sizeof(double));
  double (*w)[n]; w = (double(*)[n])malloc(n*sizeof(double));
  double (*x)[n]; x = (double(*)[n])malloc(n*sizeof(double));
  double (*y)[n]; y = (double(*)[n])malloc(n*sizeof(double));
  double (*z)[n]; z = (double(*)[n])malloc(n*sizeof(double));

  __builtin_assume(n>0);
  __builtin_assume(n<0x7FFFFFFE);

  /* Initialize array(s). */
  init_array (n, &alpha, &beta,
	      *A,
	      *u1,
	      *v1,
	      *u2,
	      *v2,
	      *w,
	      *x,
	      *y,
	      *z);

  /* Run kernel. */
  kernel_gemver (n, alpha, beta,
		 *A,
		 *u1,
		 *v1,
		 *u2,
		 *v2,
		 *w,
		 *x,
		 *y,
		 *z);

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1) print_array(n, *w);

  /* Be clean. */
  free((void*)A);
  free((void*)u1);
  free((void*)v1);
  free((void*)u2);
  free((void*)v2);
  free((void*)w);
  free((void*)x);
  free((void*)y);
  free((void*)z);

  return 0;
}
