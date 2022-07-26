int main(int argc, char** argv)
{
  int dump_code = atoi(argv[1]);
  int n = N;

  double (*A)[n][n]; A = (double(*)[n][n])malloc(n*n*sizeof(double));
  double (*x1)[n]; x1 = (double(*)[n])malloc(n*sizeof(double));
  double (*x2)[n]; x2 = (double(*)[n])malloc(n*sizeof(double));
  double (*y_1)[n]; y_1 = (double(*)[n])malloc(n*sizeof(double));
  double (*y_2)[n]; y_2 = (double(*)[n])malloc(n*sizeof(double));


  int i, j;
  if(dump_code == 1){
  for (i = 0; i < n; i++) {
    fprintf (stderr, "%0.2lf", (*x1)[i]);
    fprintf (stderr, "%0.2lf", (*x2)[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }
  }

  free((void*)A);
  free((void*)x1);
  free((void*)x2);
  free((void*)y_1);
  free((void*)y_2);

  return 0;
}
