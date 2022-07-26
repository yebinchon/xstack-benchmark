#pragma omp parallel
{
#pragma omp for schedule(static) nowait
  for (i = 0; i < n; i++)
    {
      (*x)[i] = ((double) i) / n;
      for (j = 0; j < n; j++) {
	(*A)[i][j] = ((double) i*j) / n;
	(*B)[i][j] = ((double) i*j) / n;
      }
    }
}
