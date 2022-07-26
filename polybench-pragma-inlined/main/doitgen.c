int main(int argc, char** argv)
{

  int dump_code = atoi(argv[1]);
  int nr = atoi(argv[2]);
  int nq = atoi(argv[3]);
  int np = atoi(argv[4]);

  double (*A)[nr][nq][np]; A = (double(*)[nr][nq][np])malloc((nr) * (nq) * (np) * sizeof(double));;
  double (*sum)[nr][nq][np]; sum = (double(*)[nr][nq][np])malloc((nr) * (nq) * (np) * sizeof(double));;
  double (*C4)[np][np]; C4 = (double(*)[np][np])malloc((np) * (np) * sizeof(double));;


  int i, j, k;

  for (i = 0; i < nr; i++)
    for (j = 0; j < nq; j++)
      for (k = 0; k < np; k++)
        (*A)[i][j][k] = ((double) i*j + k) / np;
  for (i = 0; i < np; i++)
    for (j = 0; j < np; j++)
      (*C4)[i][j] = ((double) i*j) / np;
  int r, q, p, s;

  if (dump_code == 1){
  for (i = 0; i < nr; i++)
    for (j = 0; j < nq; j++)
      for (k = 0; k < np; k++) {
        fprintf (stderr, "%0.2lf ", (*A)[i][j][k]);
        if (i % 20 == 0) fprintf (stderr, "\n");
      }
  fprintf (stderr, "\n");
  }


  free((void*)A);;
  free((void*)sum);;
  free((void*)C4);;

  return 0;
}
