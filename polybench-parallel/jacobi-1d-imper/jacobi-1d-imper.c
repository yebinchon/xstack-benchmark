/**
 * jacobi-1d-imper.c: This file is part of the PolyBench 3.0 test suite.
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
    double A[n],
    double B[n])
{
  int i;

  for (i = 0; i < n; i++)
  {
    A[i] = ((double) i+ 2) / n;
    B[i] = ((double) i+ 3) / n;
  }
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
  static
void print_array(int n,
    double A[n])

{
  int i;

  for (i = 0; i < n; i++)
  {
    fprintf(stderr, "%0.2lf ", A[i]);
    if (i % 20 == 0) fprintf(stderr, "\n");
  }
  fprintf(stderr, "\n");
}

 void kernel_jacobi_1d_imper(int tsteps,
           int n,
           double A[n],
           double B[n])
 {
   int t, i, j;
   for (t = 0; t < tsteps; t++)
     {
//#pragma omp parallel for schedule(static)
       for (i = 1; i < n - 1; i++)
   B[i] = 0.33333 * (A[i-1] + A[i] + A[i + 1]);

//#pragma omp parallel for schedule(static)
       for (j = 1; j < n - 1; j++)
   A[j] = B[j];
     }

 }

int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int n = atoi(argv[3]);
  int tsteps = atoi(argv[2]);
  int dump_code = atoi(argv[1]);

  /* Variable declaration/allocation. */
  double (*A)[n]; A = (double(*)[n])malloc(n*sizeof(double));
  double (*B)[n]; B = (double(*)[n])malloc(n*sizeof(double));

  __builtin_assume(n>0);
  __builtin_assume(n<0x7FFFFFFE);

  /* Initialize array(s). */
  init_array (n, *A, *B);

  /* Run kernel. */
  kernel_jacobi_1d_imper (tsteps, n, *A, *B);

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1) print_array(n, *A);

  /* Be clean. */
  free((void*)A);
  free((void*)B);

  return 0;
}
