#pragma omp parallel
{
#pragma for schedule(static) nowait 
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      (*B)[i][j] = ((double) i*(j+1)) / nj;
}
#pragma omp parallel
{
#pragma for schedule(static) nowait
  for (i = 0; i < nj; i++)
    for (j = 0; j < nm; j++)
      (*C)[i][j] = ((double) i*(j+3)) / nl;
}
#pragma omp parallel
{
#pragma for schedule(static) nowait
  for (i = 0; i < nm; i++)
    for (j = 0; j < nl; j++)
      (*D)[i][j] = ((double) i*(j+2)) / nk;
}
#pragma omp parallel
{
#pragma for schedule(static) nowait
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
    {
      (*E)[i][j] = 0;
      for (k = 0; k < nk; ++k)
        (*E)[i][j] += (*A)[i][k] * (*B)[k][j];
    }
}
#pragma omp parallel
{
#pragma for schedule(static) nowait
  for (i = 0; i < nj; i++)
    for (j = 0; j < nl; j++)
    {
      (*F)[i][j] = 0;
      for (k = 0; k < nm; ++k)
        (*F)[i][j] += (*C)[i][k] * (*D)[k][j];
    }
}
#pragma omp parallel
{
#pragma for schedule(static) nowait
  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++)
    {
      (*G)[i][j] = 0;
      for (k = 0; k < nj; ++k)
        (*G)[i][j] += (*E)[i][k] * (*F)[k][j];
    }
}
