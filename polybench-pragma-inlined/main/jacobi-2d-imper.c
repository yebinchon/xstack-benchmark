int main(int argc, char** argv)
{

  int dump_code = atoi(argv[1]);
  int n = atoi(argv[2]);
  int tsteps = atoi(argv[3]);

  double (*A)[n][n]; A = (double(*)[n][n])malloc((n) * (n) * sizeof(double));;
  double (*B)[n][n]; B = (double(*)[n][n])malloc((n) * (n) * sizeof(double));;

  int i, j, t;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
    {
      (*A)[i][j] = ((double) i*(j+2) + 2) / n;
      (*B)[i][j] = ((double) i*(j+3) + 3) / n;
    }
  for (t = 0; t < tsteps; t++)
  {
  }

  if (dump_code == 1) { 
    for (i = 0; i < n; i++)
      for (j = 0; j < n; j++) {
        fprintf(stderr, "%0.2lf ", (*A)[i][j]);
        if ((i * n + j) % 20 == 0) fprintf(stderr, "\n");
      }
    fprintf(stderr, "\n");
  }


  free((void*)A);;
  free((void*)B);;

  return 0;
}
