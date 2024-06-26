#pragma omp parallel
{
#pragma omp for schedule(static) nowait
    for (i = 1; i < n - 1; i++)
      for (j = 1; j < n - 1; j++)
        (*B)[i][j] = 0.2 * ((*A)[i][j] + (*A)[i][j-1] + (*A)[i][1+j] + (*A)[1+i][j] + (*A)[i-1][j]);
}
#pragma omp parallel
{
#pragma omp for schedule(static) nowait
    for (i = 1; i < n-1; i++)
      for (j = 1; j < n-1; j++)
        (*A)[i][j] = (*B)[i][j];
}
