/**
 * reg_detect.c: This file is part of the PolyBench/C 3.2 test suite.
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

  static
void init_array(int maxgrid,
    int sum_tang[maxgrid][maxgrid],
    int mean[maxgrid][maxgrid],
    int path[maxgrid][maxgrid])
{
  int i, j;

  for (i = 0; i < maxgrid; i++)
    for (j = 0; j < maxgrid; j++) {
      sum_tang[i][j] = (int)((i+1)*(j+1));
      mean[i][j] = ((int) i-j) / maxgrid;
      path[i][j] = ((int) i*(j-1)) / maxgrid;
    }
}




  static
void print_array(int maxgrid,
    int path[maxgrid][maxgrid])
{
  int i, j;

  for (i = 0; i < maxgrid; i++)
    for (j = 0; j < maxgrid; j++) {
      fprintf (stderr, "%d ", path[i][j]);
      if ((i * maxgrid + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
}





  static
void kernel_reg_detect(int niter, int maxgrid, int length,
    int sum_tang[maxgrid][maxgrid],
    int mean[maxgrid][maxgrid],
    int path[maxgrid][maxgrid],
    int diff[maxgrid][maxgrid][length],
    int sum_diff[maxgrid][maxgrid][length])
{
  int t, i, j, cnt;

//#pragma scop
  //#pragma omp master
{
//#pragma omp parallel
  {
  for (t = 0; t < niter; t++)
  {
    //#pragma omp for private (i, cnt) collapse(2) schedule (static)
    for (j = 0; j <= maxgrid - 1; j++)
      for (i = j; i <= maxgrid - 1; i++)
        for (cnt = 0; cnt <= length - 1; cnt++)
          diff[j][i][cnt] = sum_tang[j][i];

    //#pragma omp for private (i, cnt) collapse(2) schedule (static)
    for (j = 0; j <= maxgrid - 1; j++)
    {
      for (i = j; i <= maxgrid - 1; i++)
      {
        sum_diff[j][i][0] = diff[j][i][0];
        for (cnt = 1; cnt <= length - 1; cnt++)
          sum_diff[j][i][cnt] = sum_diff[j][i][cnt - 1] + diff[j][i][cnt];
        mean[j][i] = sum_diff[j][i][length - 1];
      }
    }

    //#pragma omp for
    for (i = 0; i <= maxgrid - 1; i++)
      path[0][i] = mean[0][i];

    //#pragma omp for private (i) collapse(2) schedule (static)
    for (j = 1; j <= maxgrid - 1; j++)
      for (i = j; i <= maxgrid - 1; i++)
        path[j][i] = path[j - 1][i - 1] + mean[j][i];
  }
  }
}
//#pragma endscop

}


int main(int argc, char** argv)
{

  int dump_code = atoi(argv[1]);
  int niter = atoi(argv[2]);
  int maxgrid = atoi(argv[3]);
  int length = atoi(argv[4]);

  int (*sum_tang)[maxgrid][maxgrid]; sum_tang = (int(*)[maxgrid][maxgrid])malloc((maxgrid) * (maxgrid) * sizeof(int));;
  int (*mean)[maxgrid][maxgrid]; mean = (int(*)[maxgrid][maxgrid])malloc((maxgrid) * (maxgrid) * sizeof(int));;
  int (*path)[maxgrid][maxgrid]; path = (int(*)[maxgrid][maxgrid])malloc((maxgrid) * (maxgrid) * sizeof(int));;
  int (*diff)[maxgrid][maxgrid][length]; diff = (int(*)[maxgrid][maxgrid][length])malloc((maxgrid) * (maxgrid) * (length) * sizeof(int));;
  int (*sum_diff)[maxgrid][maxgrid][length]; sum_diff = (int(*)[maxgrid][maxgrid][length])malloc((maxgrid) * (maxgrid) * (length) * sizeof(int));;


  init_array (maxgrid,
      *sum_tang,
      *mean,
      *path);




  kernel_reg_detect (niter, maxgrid, length,
      *sum_tang,
      *mean,
      *path,
      *diff,
      *sum_diff);





  if (dump_code == 1) print_array(maxgrid, *path);


  free((void*)sum_tang);;
  free((void*)mean);;
  free((void*)path);;
  free((void*)diff);;
  free((void*)sum_diff);;

  return 0;
}
