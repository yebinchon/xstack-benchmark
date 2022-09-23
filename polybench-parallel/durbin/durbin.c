/**
 * durbin.c: This file is part of the PolyBench 3.0 test suite.
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
void init_array (int n,
		 double y[n][n],
		 double sum[n][n],
		 double alpha[n],
		 double beta[n],
		 double r[n])
{
  int i, j;

  for (i = 0; i < n; i++)
    {
      alpha[i] = i;
      beta[i] = (i+1)/n/2.0;
      r[i] = (i+1)/n/4.0;
      for (j = 0; j < n; j++) {
	y[i][j] = ((double) i*j) / n;
	sum[i][j] = ((double) i*j) / n;
      }
    }
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int n,
		 double out[n])

{
  int i;

  for (i = 0; i < n; i++) {
    fprintf (stderr, "%0.2lf ", out[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static
void kernel_durbin(int n,
		 double y[n][n],
		 double sum[n][n],
		 double alpha[n],
		 double beta[n],
		 double r[n],
     double out[n])
{
  int i, k;

//#pragma scop
  y[0][0] = r[0];
  beta[0] = 1;
  alpha[0] = r[0];
//  #pragma omp parallel
  {
//  #pragma omp for private (i)
  for (k = 1; k < n; k++)
    {
      beta[k] = beta[k-1] - alpha[k-1] * alpha[k-1] * beta[k-1];
      sum[0][k] = r[k];
      for (i = 0; i <= k - 1; i++)
	sum[i+1][k] = sum[i][k] + r[k-i-1] * y[i][k-1];
      alpha[k] = -sum[k][k] * beta[k];
      for (i = 0; i <= k-1; i++)
	y[i][k] = y[i][k-1] + alpha[k] * y[k-i-1][k-1];
      y[k][k] = alpha[k];
    }
//  #pragma omp for
  for (i = 0; i < n; i++)
    out[i] = y[i][n-1];
  }
//#pragma endscop

}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int n = atoi(argv[2]);
  int dump_code = atoi(argv[1]);

  /* Variable declaration/allocation. */
  double (*y)[n][n]; y = (double(*)[n][n])malloc(n*n*sizeof(double));
  double (*sum)[n][n]; sum = (double(*)[n][n])malloc(n*n*sizeof(double));
  double (*alpha)[n]; alpha = (double(*)[n])malloc(n*sizeof(double));
  double (*beta)[n]; beta = (double(*)[n])malloc(n*sizeof(double));
  double (*r)[n]; r = (double(*)[n])malloc(n*sizeof(double));
  double (*out)[n]; out = (double(*)[n])malloc(n*sizeof(double));


  /* Initialize array(s). */
  init_array (n,
	      *y,
	      *sum,
	      *alpha,
	      *beta,
	      *r);

  /* Run kernel. */
  kernel_durbin (n,
		 *y,
		 *sum,
		 *alpha,
		 *beta,
		 *r,
		 *out);

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1) print_array(n, *out);

  /* Be clean. */
  free((void*)y);
  free((void*)sum);
  free((void*)alpha);
  free((void*)beta);
  free((void*)r);
  free((void*)out);

  return 0;
}
