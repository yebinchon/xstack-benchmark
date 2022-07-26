#pragma omp parallel 
{
#pragma omp for schedule(static) nowait
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
      (*a)[i][j] = ((double) i*j) / ni;
}
#pragma omp parallel 
{
#pragma omp for schedule(static) nowait
  for (i = 0; i < ni; i++)
    for (j = 0; j < ni; j++)
      (*c)[i][j] = ((double) i*j) / ni;
}
#pragma omp parallel 
{
#pragma omp for schedule(static) nowait
  for (i = 0; i < ni; i++)
    for (j = 0; j < ni; j++)
      (*c)[i][j] *= beta;
}
#pragma omp parallel 
{
#pragma omp for schedule(static) nowait
  for (i = 0; i < ni; i++)
    for (j = 0; j < ni; j++)
      for (k = 0; k < nj; k++)
        (*c)[i][j] += alpha * (*a)[i][k] * (*a)[j][k];
}
