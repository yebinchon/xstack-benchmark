/**
 * gesummv.c: This file is part of the PolyBench 3.0 test suite.
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

#define RUN 100
/* Array initialization. */
static
void init_array(int n,
		double *alpha,
		double *beta,
		double A[n][n],
		double B[n][n],
		double x[n])
{
  int i, j;

  *alpha = 43532;
  *beta = 12313;
  for (i = 0; i < n; i++)
    {
      x[i] = ((double) i) / n;
      for (j = 0; j < n; j++) {
	A[i][j] = ((double) i*j) / n;
	B[i][j] = ((double) i*j) / n;
      }
    }
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int n,
		 double y[n])

{
  int i;

  for (i = 0; i < n; i++) {
    fprintf (stderr, "%0.2lf ", y[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static
void kernel_gesummv(int n,
		    double alpha,
		    double beta,
		    double A[n][n],
		    double B[n][n],
		    double tmp[n],
		    double x[n],
		    double y[n])
{
  #pragma omp parallel for schedule(static) default(none) firstprivate(n, alpha, beta, A, B, tmp, x, y)
  for (int i = 0; i < n; i++)
    {
      tmp[i] = 0;
      y[i] = 0;
      for (int j = 0; j < n; j++)
	{
	  tmp[i] = A[i][j] * x[j] + tmp[i];
	  y[i] = B[i][j] * x[j] + y[i];
	}
      y[i] = alpha * tmp[i] + beta * y[i];
    }

}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int n = atoi(argv[2]);
  int dump_code = atoi(argv[1]);

  /* Variable declaration/allocation. */
  double alpha;
  double beta;
  double (*A)[n][n]; A = (double(*)[n][n])malloc(n*n*sizeof(double));
  double (*B)[n][n]; B = (double(*)[n][n])malloc(n*n*sizeof(double));
  double (*tmp)[n]; tmp = (double(*)[n])malloc(n*sizeof(double));
  double (*x)[n]; x = (double(*)[n])malloc(n*sizeof(double));
  double (*y)[n]; y = (double(*)[n])malloc(n*sizeof(double));


  //__builtin_assume(n>0);
  //__builtin_assume(n<0x7FFFFFFE);
  /* Initialize array(s). */
  init_array (n, &alpha, &beta,
	      *A,
	      *B,
	      *x);

  /* Run kernel. */
  kernel_gesummv (n, alpha, beta,
		  *A,
		  *B,
		  *tmp,
		  *x,
		  *y);

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1) print_array(n, *y);

  /* Be clean. */
  free((void*)A);
  free((void*)B);
  free((void*)tmp);
  free((void*)x);
  free((void*)y);

  return 0;
}
