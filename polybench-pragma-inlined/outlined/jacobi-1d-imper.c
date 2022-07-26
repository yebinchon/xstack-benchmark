#pragma omp parallel
{
#pragma omp for schedule(static) nowait
       for (i = 1; i < n - 1; i++)
   (*B)[i] = 0.33333 * ((*A)[i-1] + (*A)[i] + (*A)[i + 1]);
}
#pragma omp parallel
{
#pragma omp for schedule(static) nowait
       for (j = 1; j < n - 1; j++)
   (*A)[j] = (*B)[j];
}
