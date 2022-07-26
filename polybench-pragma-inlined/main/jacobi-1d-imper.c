int main(int argc, char** argv)
{
  int n = N;
  int tsteps = TSTEPS;
  int dump_code = atoi(argv[1]);

  double (*A)[n]; A = (double(*)[n])malloc(n*sizeof(double));
  double (*B)[n]; B = (double(*)[n])malloc(n*sizeof(double));


  int t, i, j;

  for (i = 0; i < n; i++)
  {
    (*A)[i] = ((double) i+ 2) / n;
    (*B)[i] = ((double) i+ 3) / n;
  }

   for (t = 0; t < tsteps; t++)
     {
     }

  if(dump_code == 1){
  for (i = 0; i < n; i++)
  {
    fprintf(stderr, "%0.2lf ", (*A)[i]);
    if (i % 20 == 0) fprintf(stderr, "\n");
  }
  fprintf(stderr, "\n");
  }

  free((void*)A);
  free((void*)B);

  return 0;
}
