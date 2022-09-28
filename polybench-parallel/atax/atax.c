/**
 * atax.c: This file is part of the PolyBench 3.0 test suite.
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

#define NX 40000
#define NY 40000

/* Array initialization. */
static
void init_array (int nx, int ny,
		 double A[nx][ny],
		 double x[ny])
{
  int i, j;

  for (i = 0; i < ny; i++)
      x[i] = i * M_PI;
  for (i = 0; i < nx; i++)
    for (j = 0; j < ny; j++)
      A[i][j] = ((double) i*(j+1)) / nx;
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int nx,
		 double y[nx])

{
  int i;

  for (i = 0; i < nx; i++) {
    fprintf (stderr, "%0.2lf ", y[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }
  fprintf (stderr, "\n");
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static
void kernel_atax(int nx, int ny,
		 double A[nx][ny],
		 double x[ny],
		 double y[nx],
		 double tmp[ny])
{
  int i, j;

  for (i= 0; i < nx; i++)
    y[i] = 0;
  for (i = 0; i < ny; i++)
    {
      tmp[i] = 0;
      for (j = 0; j < ny; j++)
      	tmp[i] = tmp[i] + A[i][j] * x[j];
      for (j = 0; j < ny; j++)
      	y[j] = y[j] + A[i][j] * tmp[i];
    }

}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int nx = NX;//atoi(argv[2]);
  int ny = NY;//atoi(argv[3]);
  int dump_code = atoi(argv[1]);

  /* Variable declaration/allocation. */
  double (*A)[nx][ny]; A = (double(*)[nx][ny])malloc(nx*ny*sizeof(double));
  double (*x)[ny]; x = (double(*)[ny])malloc(ny*sizeof(double));
  double (*y)[nx]; y = (double(*)[nx])malloc(nx*sizeof(double));
  double (*tmp)[ny]; tmp = (double(*)[ny])malloc(ny*sizeof(double));

  __builtin_assume(nx < 0x7FFFFFFE);
  __builtin_assume(ny < 0x7FFFFFFE);
  __builtin_assume(nx > 0);
  __builtin_assume(ny > 0);
  /* Initialize array(s). */
  init_array (nx, ny, *A, *x);


  /* Run kernel. */
  kernel_atax (nx, ny,
        *A, *x, *y, *tmp);


  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1) print_array(nx, *y);

  /* Be clean. */
  free((void*)A);
  free((void*)x);
  free((void*)y);
  free((void*)tmp);

  return 0;
}
