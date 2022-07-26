#pragma omp parallel
{
#pragma omp for schedule(static) nowait
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      (*path)[i][j] = ((double) (i+1)*(j+1)) / n;
}
