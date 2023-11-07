/**
 * floyd-warshall.c: This file is part of the PolyBench 3.0 test suite.
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
		 double path[n][n])
{
  int i, j;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      path[i][j] = ((double) (i+1)*(j+1)) / n;
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int n,
		 double path[n][n])

{
  int i, j;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++) {
      fprintf (stderr, "%0.2lf ", path[i][j]);
      if ((i * n + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static
void kernel_floyd_warshall(int n,
			   double path[n][n])
{
  int i, j, k;
  double path_new, path_old;

  for (k = 0; k < n; k++)
    {
      for(i = 0; i < n; i++)
	      for (j = 0; j < n; j++) {
	        path[i][j] = path[i][j] < path[i][k] + path[k][j] ?
	          path[i][j] : path[i][k] + path[k][j];
        }
    }

}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int n = atoi(argv[2]);
  int dump_code = atoi(argv[1]);

  /* Variable declaration/allocation. */
  double (*path)[n][n]; path = (double(*)[n][n])malloc(n*n*sizeof(double));


//  __builtin_assume(n > 0);
//  __builtin_assume(n<0x7FFFFFFE);
  /* Initialize array(s). */
  init_array (n, *path);

  /* Run kernel. */
  kernel_floyd_warshall (n, *path);

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1) print_array(n, *path);

  /* Be clean. */
  free((void*)path);

  return 0;
}
