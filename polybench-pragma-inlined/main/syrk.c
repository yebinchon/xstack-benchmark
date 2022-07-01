int main(int argc, char** argv)
{
  int dump_code = atoi(argv[1]);
  int ni = atoi(argv[2]);
  int nj = atoi(argv[3]);

  double alpha;
  double beta;
  double (*C)[ni][ni]; C = (double(*)[ni][ni])malloc((ni) * (ni) * sizeof(double));;
  double (*A)[ni][nj]; A = (double(*)[ni][nj])malloc((ni) * (nj) * sizeof(double));;

  int i, j, k;

  alpha = 32412;
  beta = 2123;


  if (dump_code == 1){
  for (i = 0; i < ni; i++)
    for (j = 0; j < ni; j++) {
      fprintf (stderr, "%0.2lf ", (*C)[i][j]);
      if ((i * ni + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
  }


  free((void*)C);;
  free((void*)A);;

  return 0;
}
