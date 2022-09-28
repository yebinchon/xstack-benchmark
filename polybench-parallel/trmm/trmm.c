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

#define N 1024

/* Array initialization. */
static
void init_array(int ni,
		double *alpha,
		double A[ni][ni],
		double B[ni][ni])
{
  int i, j;

  *alpha = 32412;
  for (i = 0; i < ni; i++)
    for (j = 0; j < ni; j++) {
      A[i][j] = ((double) i*j) / ni;
      B[i][j] = ((double) i*j) / ni;
    }
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int ni,
		 double B[ni][ni])
{
  int i, j;

  for (i = 0; i < ni; i++)
    for (j = 0; j < ni; j++) {
	fprintf (stderr, "%0.2lf ", B[i][j]);
	if ((i * ni + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static
void kernel_trmm(int ni,
		 double alpha,
		 double A[ni][ni],
		 double B[ni][ni])
{
  int i, j, k;

//#pragma scop
//#pragma omp parallel
{
  /*  B := alpha*A'*B, A triangular */
  //#pragma omp for private (j,k)
  for (i = 1; i < ni; i++)
    for (j = 0; j < ni; j++)
      for (k = 0; k < i; k++)
        B[i][j] += alpha * A[i][k] * B[j][k];
}
//#pragma endscop

}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int ni = N;//atoi(argv[2]);
  int dump_code = atoi(argv[1]);

  /* Variable declaration/allocation. */
  double alpha;
  double (*A)[ni][ni]; A = (double(*)[ni][ni])malloc(ni*ni*sizeof(double));
  double (*B)[ni][ni]; B = (double(*)[ni][ni])malloc(ni*ni*sizeof(double));

  /* Initialize array(s). */
  init_array (ni, &alpha, *A, *B);

  /* Run kernel. */
  kernel_trmm (ni, alpha, *A, *B);

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1) print_array(ni, *B);

  /* Be clean. */
  free((void*)A);
  free((void*)B);

  return 0;
}
