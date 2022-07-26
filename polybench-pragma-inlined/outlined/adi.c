#pragma omp parallel 
{
#pragma omp for schedule(static) nowait
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      {
	    (*X)[i][j] = ((double) i*(j+1) + 1) / n;
	    (*A)[i][j] = ((double) i*(j+2) + 2) / n;
	    (*B)[i][j] = ((double) i*(j+3) + 3) / n;
      }
}
#pragma omp parallel 
{
#pragma omp for schedule(static) nowait
      for (i1 = 0; i1 < n; i1++)
	for (i2 = 0; i2 < n-2; i2++)
	  (*X)[i1][n-i2-2] = ((*X)[i1][n-2-i2] - (*X)[i1][n-2-i2-1] * (*A)[i1][n-i2-3]) / (*B)[i1][n-3-i2];
}
