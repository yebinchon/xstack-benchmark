
int main(int argc, char ** argv) {
  uint64_t _call_2e_i = strtol(argv[1], ((uint8_t**)0), 10);
  uint64_t ni = strtol(argv[2], ((uint8_t**)0), 10);
  uint64_t nj = strtol(argv[3], ((uint8_t**)0), 10);
  uint64_t nk = strtol(argv[4], ((uint8_t**)0), 10);
  uint8_t* C = malloc(nj * (ni << 3));
  uint8_t* _call17 = malloc(nk * (ni << 3));
  uint8_t* _call21 = malloc((nj << 3) * nk);
  if (_call_2e_i == 1) {
for(uint64_t i = 0; i < ni;   i = i + 1){
for(uint64_t j = 0; j < nj;   j = j + 1){
  fprintf(stderr, (_OC_str), (((double*)C)+i * nj)[j]);
  if ((int)(i * ni + j) % (int)20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(C);
free(_call17);
free(_call21);
  return 0;
}

