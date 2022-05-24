#define TSTEPS 100
#define N 10000

int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int n = N;
  int tsteps = TSTEPS;
  int dump_code = atoi(argv[1]);

  /* Variable declaration/allocation. */
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
       //#pragma omp for schedule(static){
       for (i = 1; i < n - 1; i++)
   (*B)[i] = 0.33333 * ((*A)[i-1] + (*A)[i] + (*A)[i + 1]);

       //#pragma omp for schedule(static)
       for (j = 1; j < n - 1; j++)
   (*A)[j] = (*B)[j];
     }

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1){
  for (i = 0; i < n; i++)
  {
    fprintf(stderr, "%0.2lf ", (*A)[i]);
    if (i % 20 == 0) fprintf(stderr, "\n");
  }
  fprintf(stderr, "\n");
  }

  /* Be clean. */
  free((void*)A);
  free((void*)B);

  return 0;
}
