#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

#define match(b1, b2) (((b1) + (b2)) == 3 ? 1 : 0)

  static
void init_array(int n,
    double *table,
    double *seq)
{
  int i, j;


  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      table[i*n+j] = ((double) i*j) / n;
  for (i = 0; i < n; i++)
      seq[i] = ((double) i) / n;
}



static void kernel(int n, double *seq, double *table) {
  for (int i = n - 1; i >= 0; i--) {
    for (int j = i + 1; j < n; j++) {

      if (j - 1 >= 0)
        table[i*n+j] = fmax(table[i*n+j], table[i*n+j - 1]);
      if (i + 1 < n)
        table[i*n+j] = fmax(table[i*n+j], table[(i + 1)*n+j]);

      if (j - 1 >= 0 && i + 1 < n) {
        /* don't allow adjacent elements to bond */
        if (i < j - 1)
          table[i*n+j] = fmax(table[i*n+j], table[(i + 1)*n+j - 1] + match(seq[i], seq[j]));
        else
          table[i*n+j] = fmax(table[i*n+j], table[(i + 1)*n+j - 1]);
      }

      for (int k = i + 1; k < j; k++)
        table[i*n+j] = fmax(table[i*n+j], table[i*n+k] + table[(k + 1)*n+j]);

      // fprintf(stderr, "i=%d,j=%d\n",i,j);
      // table.dump();
    }
  }
}

  static
void print_array(int n,
    double *table)
{
  int i, j;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++) {
      fprintf (stderr, "%0.2lf ", table[i*n+j]);
      if ((i * n + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
}

int main(int argc, char** argv)
{

  int dump_code = atoi(argv[1]);
  int n = atoi(argv[2]);
  double *table = (double*)malloc(n*n*sizeof(double));
  double *seq = (double*)malloc(n*sizeof(double));
  init_array (n,
      table,
      seq);
  kernel(n, seq, table);
  if (dump_code == 1) print_array(n, table);
  free((void*)table);
  free((void*)seq);
}
