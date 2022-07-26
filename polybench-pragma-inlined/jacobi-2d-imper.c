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
#pragma omp parallel
{
#pragma omp for schedule(static)
    for (i = 1; i < n - 1; i++)
      for (j = 1; j < n - 1; j++)
        (*B)[i][j] = 0.2 * ((*A)[i][j] + (*A)[i][j-1] + (*A)[i][1+j] + (*A)[1+i][j] + (*A)[i-1][j]);
}
#pragma omp parallel
{
#pragma omp for schedule(static)
    for (i = 1; i < n-1; i++)
      for (j = 1; j < n-1; j++)
        (*A)[i][j] = (*B)[i][j];
}
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
