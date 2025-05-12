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

static unsigned num_blocks(int num, int factor) {
  return (num + factor - 1) / factor;
}


__global__ void kernel_splat(int tmax,
                             int nx,
                             int ny,
                             double *ex, double *ey, double *hz, double fict[], int t) {
  int j = blockDim.x * blockIdx.x + threadIdx.x;

  if (j < ny)
    ey[0 * ny + j] = fict[t];
}


__global__ void kernel_ey(int tmax,
                          int nx,
                          int ny,
                          double *ex, double *ey, double *hz, double fict[], int t) {
  int i = blockDim.x * blockIdx.x + threadIdx.x + 1;
  int j = blockDim.y * blockIdx.y + threadIdx.y;

  if (i < nx && j < ny)
    ey[i * ny + j] -= (double)(0.5) * (hz[i * ny + j] - hz[(i - 1) * ny + j]);
}



__global__ void kernel_ex(int tmax,
                          int nx,
                          int ny,
                          double *ex, double *ey, double *hz, double fict[], int t) {
  int i = blockDim.x * blockIdx.x + threadIdx.x;
  int j = blockDim.y * blockIdx.y + threadIdx.y + 1;

  if (i < nx && j < ny)
    ex[i * ny + j] -= (double)(0.5) * (hz[i * ny + j] - hz[i * ny + j - 1]);
}



__global__ void kernel_hz(int tmax,
                          int nx,
                          int ny,
                          double *ex, double *ey, double *hz, double fict[], int t) {
  int i = blockDim.x * blockIdx.x + threadIdx.x;
  int j = blockDim.y * blockIdx.y + threadIdx.y;

  if (i < nx - 1 && j < ny - 1)
    hz[i * ny + j] -= (double)(0.7) * (ex[i * ny + j + 1] - ex[i * ny + j] + ey[(i + 1) * ny + j] - ey[i * ny + j]);
}



static void kernel(int tmax,
                   int nx,
                   int ny,
                   double *ex, double *ey, double *hz, double *fict) {
  const unsigned threadsPerBlock = 256;



  for (int t = 0; t < tmax; t++) {
    kernel_splat<<<threadsPerBlock, num_blocks(ny, threadsPerBlock)>>>(tmax, nx, ny, ex, ey, hz, fict, t);

    {
      dim3 block(threadsPerBlock / 32, 32, 1);
      dim3 grid(num_blocks(nx - 1, block.x), num_blocks(ny, block.y), 1);
      kernel_ey<<<grid, block>>>(tmax, nx, ny, ex, ey, hz, fict, t);
    }


    {
      dim3 block(threadsPerBlock / 32, 32, 1);
      dim3 grid(num_blocks(nx, block.x), num_blocks(ny - 1, block.y), 1);
      kernel_ex<<<grid, block>>>(tmax, nx, ny, ex, ey, hz, fict, t);
    }

    {
      dim3 block(threadsPerBlock / 32, 32, 1);
      dim3 grid(num_blocks(nx - 1, block.x), num_blocks(ny - 1, block.y), 1);
      kernel_hz<<<grid, block>>>(tmax, nx, ny, ex, ey, hz, fict, t);
    }
  }

}

/* Array initialization. */
static
void init_array (int nx,
		 int ny,
		 double *ex,
		 double *ey,
		 double *hz,
		 double *_fict_)
{
  int i, j;

  for (i = 0; i < ny; i++)
    _fict_[i] = (double) i;
  for (i = 0; i < nx; i++)
    for (j = 0; j < ny; j++)
    {
	    ex[i*ny+j] = ((double) i*(j+1)) / nx;
	    ey[i*ny+j] = ((double) i*(j+2)) / ny;
	    hz[i*ny+j] = ((double) i*(j+3)) / nx;
      }
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int nx,
		 int ny,
		 double *ex,
		 double *ey,
		 double *hz)
{
  int i, j;

  for (i = 0; i < nx; i++)
    for (j = 0; j < ny; j++) {
      fprintf(stderr, "%0.2lf ", ex[i*ny+j]);
      fprintf(stderr, "%0.2lf ", ey[i*ny+j]);
      fprintf(stderr, "%0.2lf ", hz[i*ny+j]);
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
  int t, i, j;

  for(t = 0; t < tmax; t++)
    {
      for (j = 0; j < ny; j++)
	      ey[0][j] = _fict_[t];
      for (i = 1; i < nx; i++)
	      for (j = 0; j < ny; j++)
	        ey[i][j] = ey[i][j] - 0.5*(hz[i][j]-hz[i-1][j]);
      for (i = 0; i < nx; i++)
	      for (j = 1; j < ny; j++)
	        ex[i][j] = ex[i][j] - 0.5*(hz[i][j]-hz[i][j-1]);
      for (i = 0; i < nx - 1; i++)
	      for (j = 0; j < ny - 1; j++)
	        hz[i][j] = hz[i][j] - 0.7*  (ex[i][j+1] - ex[i][j] +
				       ey[i+1][j] - ey[i][j]);
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
  double *ex = (double*)malloc(nx*ny*sizeof(double));
  double *ey = (double*)malloc(nx*ny*sizeof(double));
  double *hz = (double*)malloc(nx*ny*sizeof(double));
  double *_fict_ = (double*)malloc(ny*sizeof(double));

  /* Initialize array(s). */
  init_array (nx, ny,
	      ex,
	      ey,
	      hz,
	      _fict_);
  double *dev_ex;
  double *dev_ey;
  double *dev_hz;
  double *dev_fict;
  cudaMalloc(&dev_ex, nx*ny*sizeof(double));
  cudaMalloc(&dev_ey, nx*ny*sizeof(double));
  cudaMalloc(&dev_hz, nx*ny*sizeof(double));
  cudaMalloc(&dev_fict, ny*sizeof(double));
  cudaMemcpy(dev_ex, ex, nx*ny*sizeof(double), cudaMemcpyHostToDevice);
  cudaMemcpy(dev_ey, ey, nx*ny*sizeof(double), cudaMemcpyHostToDevice);
  cudaMemcpy(dev_hz, hz, nx*ny*sizeof(double), cudaMemcpyHostToDevice);
  cudaMemcpy(dev_fict, _fict_, ny*sizeof(double), cudaMemcpyHostToDevice);
  /* Run kernel. */
  kernel(tmax, nx, ny, dev_ex, dev_ey, dev_hz, dev_fict);
  cudaMemcpy(ex, dev_ex, nx*ny*sizeof(double), cudaMemcpyDeviceToHost);
  cudaMemcpy(ey, dev_ey, nx*ny*sizeof(double), cudaMemcpyDeviceToHost);
  cudaMemcpy(hz, dev_hz, nx*ny*sizeof(double), cudaMemcpyDeviceToHost);


  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1) print_array(nx, ny, ex, ey, hz);

  /* Be clean. */
  free((void*)ex);
  free((void*)ey);
  free((void*)hz);
  free((void*)_fict_);

  return 0;
}
