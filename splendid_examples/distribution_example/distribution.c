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


  for (int i = 0; i < 100; i++)
    for (int j = 0; j < 100; j++) {
      fprintf (stderr, "%d ", B[i][j]);
      if ((i * 100 + 100) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");


  return 0;
}
