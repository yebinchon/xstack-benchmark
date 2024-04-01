/**
 * fdtd-2d.c: This file is part of the PolyBench 3.0 test suite.
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

#define TMAX 100
#define NX 4000
#define NY 4000

/* Array initialization. */
static
void init_array (int nx,
		 int ny,
		 double ex[nx][ny],
		 double ey[nx][ny],
		 double hz[nx][ny],
		 double _fict_[ny])
{
  int i, j;

  for (i = 0; i < ny; i++)
    _fict_[i] = (double) i;
  for (i = 0; i < nx; i++)
    for (j = 0; j < ny; j++)
      {
	ex[i][j] = ((double) i*(j+1)) / nx;
	ey[i][j] = ((double) i*(j+2)) / ny;
	hz[i][j] = ((double) i*(j+3)) / nx;
      }
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int nx,
		 int ny,
		 double ex[nx][ny],
		 double ey[nx][ny],
		 double hz[nx][ny])
{
  int i, j;

  for (i = 0; i < nx; i++)
    for (j = 0; j < ny; j++) {
      fprintf(stderr, "%0.2lf ", ex[i][j]);
      fprintf(stderr, "%0.2lf ", ey[i][j]);
      fprintf(stderr, "%0.2lf ", hz[i][j]);
      if ((i * nx + j) % 20 == 0) fprintf(stderr, "\n");
    }
  fprintf(stderr, "\n");
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static
void kernel_fdtd_2d(int tmax,
		    int nx,
		    int ny,
		    double ex[nx][ny],
		    double ey[nx][ny],
		    double hz[nx][ny],
		    double _fict_[ny])
{

  #pragma omp parallel default(none) firstprivate(tmax, nx, ny, ex, ey, hz, _fict_)
  {
  for(int t = 0; t < tmax; t++)
    {
      #pragma omp for schedule(static) nowait
      for (int j = 0; j < ny; j++)
	      ey[0][j] = _fict_[t];
      #pragma omp for collapse(2) schedule(static) nowait
      for (int i = 1; i < nx; i++)
	      for (int j = 0; j < ny; j++)
	        ey[i][j] = ey[i][j] - 0.5*(hz[i][j]-hz[i-1][j]);
      #pragma omp for collapse(2) schedule(static)
      for (int i = 0; i < nx; i++)
	      for (int j = 1; j < ny; j++)
	        ex[i][j] = ex[i][j] - 0.5*(hz[i][j]-hz[i][j-1]);
      #pragma omp for collapse(2) schedule(static)
      for (int i = 0; i < nx - 1; i++)
	      for (int j = 0; j < ny - 1; j++)
	        hz[i][j] = hz[i][j] - 0.7*  (ex[i][j+1] - ex[i][j] +
				       ey[i+1][j] - ey[i][j]);
    }
  }
}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int tmax = atoi(argv[2]);
  int nx = atoi(argv[3]);
  int ny = atoi(argv[4]);
  int dump_code = atoi(argv[1]);

  /* Variable declaration/allocation. */
  double (*ex)[nx][ny]; ex = (double(*)[nx][ny])malloc(nx*ny*sizeof(double));
  double (*ey)[nx][ny]; ey = (double(*)[nx][ny])malloc(nx*ny*sizeof(double));
  double (*hz)[nx][ny]; hz = (double(*)[nx][ny])malloc(nx*ny*sizeof(double));
  double (*_fict_)[ny]; _fict_ = (double(*)[ny])malloc(ny*sizeof(double));

  /* Initialize array(s). */
  init_array (nx, ny,
	      *ex,
	      *ey,
	      *hz,
	      *_fict_);

  /* Run kernel. */
  kernel_fdtd_2d (tmax, nx, ny,
	      *ex,
	      *ey,
	      *hz,
	      *_fict_);

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1) print_array(nx, ny, *ex, *ey, *hz);

  /* Be clean. */
  free((void*)ex);
  free((void*)ey);
  free((void*)hz);
  free((void*)_fict_);

  return 0;
}
