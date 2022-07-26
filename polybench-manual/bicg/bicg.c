/**
 * bicg.c: This file is part of the PolyBench 3.0 test suite.
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
void init_array (int nx, int ny,
		 double A[nx][ny],
		 double r[nx],
		 double p[ny])
{
  int i;//, j;

  for (i = 0; i < ny; i++)
    p[i] = i * M_PI;
  for (i = 0; i < nx; i++) {
    r[i] = i * M_PI;
    for (j = 0; j < ny; j++)
      A[i][j] = ((double) i*(j+1))/nx;
  }
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int nx, int ny,
		 double s[ny],
		 double q[nx])

{
  int i;

  for (i = 0; i < ny; i++) {
    fprintf (stderr, "%0.2lf ", s[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }
  for (i = 0; i < nx; i++) {
    fprintf (stderr, "%0.2lf ", q[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }
  fprintf (stderr, "\n");
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static
void kernel_bicg(int nx, int ny,
		 double A[nx][ny],
		 double s[ny],
		 double q[nx],
		 double p[ny],
		 double r[nx])
{
  int i, j;

#pragma omp parallel
  {
#pragma omp for
  for (i = 0; i < ny; i++)
    s[i] = 0;
#pragma omp for private (j)
  for (i = 0; i < nx; i++)
    {
      q[i] = 0;
      for (j = 0; j < ny; j++)
	{
	  s[j] = s[j] + r[i] * A[i][j];
	  q[i] = q[i] + A[i][j] * p[j];
	}
    }
  }
}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int nx = atoi(argv[2]);
  int ny = atoi(argv[3]);
  int dump_code = atoi(argv[1]);

  /* Variable declaration/allocation. */
  double (*A)[nx][ny]; A = (double(*)[nx][ny])malloc(nx*ny*sizeof(double));
  double (*s)[ny]; s = (double(*)[ny])malloc(ny*sizeof(double));
  double (*q)[nx]; q = (double(*)[nx])malloc(nx*sizeof(double));
  double (*p)[ny]; p = (double(*)[ny])malloc(ny*sizeof(double));
  double (*r)[nx]; r = (double(*)[nx])malloc(nx*sizeof(double));

  /* Initialize array(s). */
  init_array (nx, ny, *A, *r, *p);

  /* Run kernel. */
  kernel_bicg (nx, ny,
	       *A,
	       *s,
	       *q,
	       *p,
	       *r);

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1) print_array(nx, ny, *s, *q);

  /* Be clean. */
  free((void*)A);
  free((void*)s);
  free((void*)q);
  free((void*)p);
  free((void*)r);

  return 0;
}
