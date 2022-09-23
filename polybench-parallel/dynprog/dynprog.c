/**
 * dynprog.c: This file is part of the PolyBench/C 3.2 test suite.
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
void init_array(int length,
  int c[length][length],
  int W[length][length])
{
  int i, j;
  for (i = 0; i < length; i++)
    for (j = 0; j < length; j++) {
      c[i][j] = i*j % 2;
      W[i][j] = ((int) i-j) / length;
    }
}




  static
void print_array(int out)
{
  fprintf (stderr, "%d ", out);
  fprintf (stderr, "\n");
}




  static
void kernel_dynprog(int tsteps, int length,
    int c[length][length],
    int W[length][length],
    int sum_c[length][length][length],
    int *out)
{
  int iter, i, j, k;

  int out_l = 0;

//#pragma scop
//#pragma omp master
{
//  #pragma omp parallel
  {
  for (iter = 0; iter < tsteps; iter++)
  {
//    #pragma omp for private (j)
    for (i = 0; i <= length - 1; i++)
      for (j = 0; j <= length - 1; j++)
        c[i][j] = 0;

//    #pragma omp for private (j,k)
    for (i = 0; i <= length - 2; i++)
    {
      for (j = i + 1; j <= length - 1; j++)
      {
        sum_c[i][j][i] = 0;
        for (k = i + 1; k <= j-1; k++)
          sum_c[i][j][k] = sum_c[i][j][k - 1] + c[i][k] + c[k][j];
        c[i][j] = sum_c[i][j][j-1] + W[i][j];
      }
    }
    out_l += c[0][length - 1];
  }
  }
}
//#pragma endscop

  *out = out_l;
}


int main(int argc, char** argv)
{
  int dump_code = atoi(argv[1]);
  int length = atoi(argv[2]);
  int tsteps = atoi(argv[3]);

  int out;
  int (*sum_c)[length][length][length]; sum_c = (int(*)[length][length][length])malloc((length) * (length) * (length) * sizeof(int));;
  int (*c)[length][length]; c = (int(*)[length][length])malloc((length) * (length) * sizeof(int));;
  int (*W)[length][length]; W = (int(*)[length][length])malloc((length) * (length) * sizeof(int));;


  init_array (length, *c, *W);




  kernel_dynprog (tsteps, length,
      *c,
      *W,
      *sum_c,
      &out);





  if (dump_code == 1) print_array(out);


  free((void*)sum_c);;
  free((void*)c);;
  free((void*)W);;

  return 0;
}
