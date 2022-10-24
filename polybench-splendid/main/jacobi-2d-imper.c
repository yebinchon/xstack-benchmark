
int main(int argc, char ** argv) {
  uint64_t dump_code = strtol(argv[1], ((uint8_t**)0), 10);
  uint64_t n = strtol(argv[2], ((uint8_t**)0), 10);
  uint64_t tsteps = strtol(argv[3], ((uint8_t**)0), 10);
  double* A = malloc((n << 3) * n);
  double* B = malloc((n << 3) * n);
for(uint64_t i = 0; i < n;   i = i + 1){
for(uint64_t j = 0; j < n;   j = j + 1){
  (((double*)A)+i * n)[j] = ((double)(i) * (double)((j + 2)) + 2) / (double)(n);
  (((double*)B)+i * n)[j] = ((double)(i) * (double)((j + 3)) + 3) / (double)(n);
}
}
for(uint64_t i = 0; i < tsteps;   i = i + 1){
}
  if (dump_code == 1) {
for(uint64_t i = 0; i < n;   i = i + 1){
for(uint64_t j = 0; j < n;   j = j + 1){
  fprintf(stderr, (_OC_str), (((double*)A)+i * n)[j]);
  if ((int)(i * n + j) % (int)20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(A);
free(B);
  return 0;
}

