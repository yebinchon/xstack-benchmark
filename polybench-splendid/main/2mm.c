
int main(int argc, char ** argv) {
  uint64_t dump_code = strtol(argv[1], ((uint8_t**)0), 10);
  uint64_t ni = strtol(argv[2], ((uint8_t**)0), 10);
  uint64_t nj = strtol(argv[3], ((uint8_t**)0), 10);
  uint64_t nk = strtol(argv[4], ((uint8_t**)0), 10);
  uint64_t nl = strtol(argv[5], ((uint8_t**)0), 10);
  uint8_t* tmp = malloc(nj * (ni << 32) >> 29);
  uint8_t* A = malloc(nk * (ni << 32) >> 29);
  uint8_t* B = malloc(nk * (nj << 32) >> 29);
  uint8_t* C = malloc(nl * (nj << 32) >> 29);
  uint8_t* D = malloc(nl * (ni << 32) >> 29);
for(uint64_t i = 0; i < ni;   i = i + 1){
for(uint64_t j = 0; j < nk;   j = j + 1){
  (((double*)A)+i * nl)[j] = (double)(i) * (double)(j) / (double)(ni);
}
}
for(uint64_t i = 0; i < nk;   i = i + 1){
for(uint64_t j = 0; j < nj;   j = j + 1){
  (((double*)B)+i * nj)[j] = (double)(i) * (double)((j + 1)) / (double)(nj);
}
}
for(uint64_t i = 0; i < nl;   i = i + 1){
for(uint64_t j = 0; j < nj;   j = j + 1){
  (((double*)C)+i * nj)[j] = (double)(i) * (double)((j + 3)) / (double)(nl);
}
}
for(uint64_t i = 0; i < ni;   i = i + 1){
for(uint64_t j = 0; j < nl;   j = j + 1){
  (((double*)D)+i * nl)[j] = (double)(i) * (double)((j + 2)) / (double)(nk);
}
}
  if (dump_code == 1) {
for(uint64_t i = 0; i < ni;   i = i + 1){
for(uint64_t j = 0; j < nl;   j = j + 1){
  fprintf(stderr, (_OC_str), (((double*)D)+i * nl)[j]);
  if ((int)(i * ni + j) % (int)20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(tmp);
free(A);
free(B);
free(C);
free(D);
  return 0;
}

