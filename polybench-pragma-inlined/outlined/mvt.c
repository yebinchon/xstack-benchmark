#pragma omp parallel
{
#pragma omp for schedule(static) nowait
  for (i = 0; i < n; i++)
    {
      (*x1)[i] = ((double) i) / n;
      (*x2)[i] = ((double) i + 1) / n;
      (*y_1)[i] = ((double) i + 3) / n;
      (*y_2)[i] = ((double) i + 4) / n;
      for (j = 0; j < n; j++)
	(*A)[i][j] = ((double) i*j) / n;
    }
}
#pragma omp parallel
{
#pragma omp for schedule(static) nowait
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      (*x1)[i] = (*x1)[i] + (*A)[i][j] * (*y_1)[j];
}
#pragma omp parallel
{
#pragma omp for schedule(static) nowait
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      (*x2)[i] = (*x2)[i] + (*A)[j][i] * (*y_2)[j];
}

