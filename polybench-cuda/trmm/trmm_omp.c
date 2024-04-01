/**
 * trmm.c: This file is part of the PolyBench 3.0 test suite.
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
void init_array(int n,int m,
		double *alpha,
		double *A,
		double *B)
{
  int i, j;

  *alpha = 32412;
  for (i = 0; i < n; i++)
    for (j = 0; j < m; j++) {
      A[i*m+j] = ((double) i*j) / m;
      B[j*n+j] = ((double) i*j) / n;
    }
}

static void kernel(int n, int m,
                   double alpha,
                   double *B,
                   double *A) {
  for (int i = 0; i < m; i++)
    for (int j = 0; j < n; j++) {
      for (int k = i + 1; k < m; k++)
        B[i*n+j] += A[k*m+i] * B[k*n+j];
      B[i*n+j] *= alpha;
    }
}

/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int m, int n,
		 double *B)
{
  int i, j;

  for (i = 0; i < m; i++)
    for (j = 0; j < n; j++) {
	fprintf (stderr, "%0.2lf ", B[i*n+j]);
	if ((i * n + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static
void kernel_trmm(int n, int m,
		 double alpha,
		 double A[n][m],
		 double B[m][n])
{
  int i, j, k;

#pragma omp parallel default(none) firstprivate(n, m, alpha, B, A)
{
  #pragma omp for
    for (int j = 0; j < n; j++)
      for (int i = 0; i < m; i++)
        for (int k = i + 1; k < m; k++)
          B[i][j] += A[k][i] * B[k][j];

#pragma omp for collapse(2) schedule(static)
    for (int i = 0; i < m; i++)
      for (int j = 0; j < n; j++)
        B[i][j] *= alpha;
}

}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int n = atoi(argv[2]);
  int m = atoi(argv[3]);
  int dump_code = atoi(argv[1]);

  /* Variable declaration/allocation. */
  double alpha;
  double *A = (double*)malloc(n*m*sizeof(double));
  double *B = (double*)malloc(m*n*sizeof(double));

  /* Initialize array(s). */
  init_array (n,m, &alpha, A, B);

  /* Run kernel. */
  kernel(n,m, alpha, A, B);

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1) print_array(m, n, B);

  /* Be clean. */
  free((void*)A);
  free((void*)B);

  return 0;
}
