
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t dump_code = strtol(_argv[1], ((uint8_t**)0), 10);
  uint64_t ni = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t nj = strtol(_argv[3], ((uint8_t**)0), 10);
  uint64_t nk = strtol(_argv[4], ((uint8_t**)0), 10);
  uint64_t nl = strtol(_argv[5], ((uint8_t**)0), 10);
  uint64_t nm = strtol(_argv[6], ((uint8_t**)0), 10);
  uint8_t* E = malloc(nj * (ni << 3));
  uint8_t* A = malloc(nk * (ni << 3));
  uint8_t* B = malloc(nk * (nj << 3));
  uint8_t* F = malloc(nl * (nj << 3));
  uint8_t* C = malloc(nm * (nj << 3));
  uint8_t* D = malloc((nl << 3) * nm);
  uint8_t* G = malloc(nl * (ni << 3));
for(uint64_t i = 0; i < ni;  i = i + 1){
for(uint64_t j = 0; j < nk;  j = j + 1){
  (((double*)A)+i * nk)[j] = (double)(i) * (double)(j) / (double)(ni);
}
}
  if (dump_code == 1) {
for(uint64_t i = 0; i < ni;  i = i + 1){
for(uint64_t j = 0; j < nl;  j = j + 1){
  fprintf(stderr, (_OC_str), (((double*)G)+i * nl)[j]);
  if ((int)(i * ni + j) % (int)20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
free(E);
free(A);
free(B);
free(F);
free(C);
free(D);
free(G);
  return 0;
}

free(E);
free(A);
free(B);
free(F);
free(C);
free(D);
free(G);
  return 0;
}

