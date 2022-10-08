/**
 * 2mm.c: This file is part of the PolyBench/C 3.2 test suite.
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
#include <stdint.h>




  static
void print_array(int ni, int nl,
    double D[ni][nl])
{
  int i, j;

  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++) {
      fprintf (stderr, "%0.2lf ", D[i][j]);
      if ((i * ni + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
}

int main(int argc, char** argv)
{
  uint8_t A[100][100];
  uint8_t B[100][100];
  for(int i=1; i<100; i++){
    for(int j=0; j<100; j++){
      A[i][j] = i + j;
      B[i][j] = i*j - A[i-1][j];
    }
  }


  print_array(100, 100, B);


  return 0;
}
