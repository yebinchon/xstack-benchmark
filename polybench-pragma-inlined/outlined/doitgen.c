#pragma omp parallel
{
#pragma omp for schedule(static) nowait
  for (r = 0; r < nr; r++)
    for (q = 0; q < nq; q++) {
      for (p = 0; p < np; p++) {
        (*sum)[r][q][p] = 0;
        for (s = 0; s < np; s++)
          (*sum)[r][q][p] = (*sum)[r][q][p] + (*A)[r][q][s] * (*C4)[s][p];
      }
      for (p = 0; p < np; p++)
        (*A)[r][q][p] = (*sum)[r][q][p];
    }
}
