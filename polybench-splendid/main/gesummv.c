int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t n = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t _call_2e_i65 = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* A = malloc((n << 3) * n);
  uint8_t* B = malloc((n << 3) * n);
  uint8_t* x = malloc((n << 32) >> 29);
  uint8_t* y = malloc((n << 32) >> 29);
//START OUTLINED
//END OUTLINED
for(uint64_t i = 0; i < n;  i = i + 1){
  ((double*)y)[i] = 0;
  double _polly_2e_access_2e_call1799_2e_reload = 0;
  double _add_2e_i83_2e_phiops_2e_0 = 0;
for(uint64_t j = 0; j < n;  j = j + 1){
  _add_2e_i83_2e_phiops_2e_0 = (_add_2e_i83_2e_phiops_2e_0 + *((double*)((A+i * (n << 3))+(j << 3))) * *((double*)(x+(j << 3))));
  _polly_2e_access_2e_call1799_2e_reload = (_polly_2e_access_2e_call1799_2e_reload + *((double*)(x+(j << 3))) * *((double*)((B+i * (n << 3))+(j << 3))));
}
  *((double*)(y+(i << 3))) = (_add_2e_i83_2e_phiops_2e_0 * 43532 + _polly_2e_access_2e_call1799_2e_reload * 12313);
}
  if (_call_2e_i65 == 1) {
for(uint64_t i = 0; i < n;  i = i + 1){
  fprintf(stderr, (_OC_str), ((double*)y)[i]);
  if (i % 20 == 0) {
  fputc(10, stderr);
}

}
free(A);
free(B);
free(x);
free(y);
  return 0;
}

free(A);
free(B);
free(x);
free(y);
  return 0;
}

