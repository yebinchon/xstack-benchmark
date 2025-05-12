/**
 * adi.c: This file is part of the PolyBench 3.0 test suite.
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

#define N 2048
#define TSTEPS 50


/* Array initialization. */
static void init_array (int n,
		 double *u)
{
  int i, j;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
	    u[i*n+j] =  (double)(i + n-j) / n;
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int n,
		 double *u)

{
  int i, j;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++) {
      fprintf(stderr, "%0.2lf ", u[i*n+j]);
      if ((i * n + j) % 20 == 0) fprintf(stderr, "\n");
    }
  fprintf(stderr, "\n");
}


static void kernel(
    int tsteps,
    int n,
    double *u,
    double *v,
    double *p,
    double *q) {
  double DX = 1 / (double)n;
  double DY = 1 / (double)n;
  double DT = 1 / (double)tsteps;
  double B1 = 2;
  double B2 = 1;
  double mul1 = B1 * DT / DX / DX;
  double mul2 = B2 * DT / DY / DY;

  double a = -mul1 / 2;
  double b = 1 + mul1;
  double c = a;
  double d = -mul2 / 2;
  double e = 1 + mul2;
  double f = d;

#pragma omp parallel
{
  for (int t = 1; t <= tsteps; t++) {
    // Column Sweep
    #pragma omp for schedule(static)
    for (int i = 1; i < n - 1; i++) {
    v[0 * n + i] = 1;
    p[i * n + 0] = 0;
    q[i * n + 0] = v[0 * n + i];
    for (int j = 1; j < n - 1; j++) {
      p[i * n + j] = -c / (a * p[i * n + j - 1] + b);
      q[i * n + j] = (-d * u[j * n + i - 1] + (1 + 2 * d) * u[j * n + i] - f * u[j * n + i + 1] - a * q[i * n + j - 1]) / (a * p[i * n + j - 1] + b);
    }

    v[(n - 1) * n + i] = 1;
    for (int j = n - 2; j >= 1; j--)
      v[j * n + i] = p[i * n + j] * v[(j + 1) * n + i] + q[i * n + j];
    }
    // Row Sweep
    #pragma omp for schedule(static)
    for (int i = 1; i < n - 1; i++) {
    u[i * n + 0] = 1;
    p[i + n + 0] = 0;
    q[i * n + 0] = u[i * n + 0];
    for (int j = 1; j < n - 1; j++) {
      p[i * n + j] = -f / (d * p[i * n + j - 1] + e);
      q[i * n + j] = (-a * v[(i - 1) * n + j] + (1 + 2 * a) * v[i * n + j] - c * v[(i + 1) * n + j] - d * q[i * n + j - 1]) / (d * p[i * n + j - 1] + e);
    }
    u[i * n + n - 1] = 1;
    for (int j = n - 2; j >= 1; j--)
      u[i * n + j] = p[i * n + j] * u[i * n + j + 1] + q[i * n + j];
    }
  }
}
}

int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int n = atoi(argv[2]);
  int tsteps = atoi(argv[3]);
  int dump_code = atoi(argv[1]);

  /* Variable declaration/allocation. */

  double *u = (double*)malloc(n*n*sizeof(double));
  double *v = (double*)malloc(n*n*sizeof(double));
  double *p = (double*)malloc(n*n*sizeof(double));
  double *q = (double*)malloc(n*n*sizeof(double));


  /* Initialize array(s). */
  init_array (n, u);

  /* Run kernel. */
  kernel (tsteps, n, u, v, p, q);


  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1) print_array(n, u);

  /* Be clean. */
  free((void*)u);
  free((void*)v);
  free((void*)p);
  free((void*)q);

  return 0;
}
