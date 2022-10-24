
int main(int argc, char ** argv) {
  uint64_t _call_2e_i = strtol(argv[1], ((uint8_t**)0), 10);
  uint8_t* A = malloc(12800000000);
  uint8_t* B = malloc(12800000000);
  uint8_t* x = malloc(320000);
  uint8_t* y = malloc(320000);
for(uint64_t i = 0; i < 40000;   i = i + 1){
  ((double*)y)[i] = 0;
  double _polly_2e_access_2e_call1596_2e_reload = 0;
  double _add_2e_i82_2e_phiops_2e_0 = 0;
for(uint64_t j = 0; j < 40000;   j = j + 1){
  _add_2e_i82_2e_phiops_2e_0 = (_add_2e_i82_2e_phiops_2e_0 + *((double*)((A+i * 320000)+(j << 3))) * *((double*)(x+(j << 3))));
  _polly_2e_access_2e_call1596_2e_reload = (_polly_2e_access_2e_call1596_2e_reload + *((double*)(x+(j << 3))) * *((double*)((B+i * 320000)+(j << 3))));
}
  *((double*)(y+(i << 3))) = (_add_2e_i82_2e_phiops_2e_0 * 43532 + _polly_2e_access_2e_call1596_2e_reload * 12313);
}
  if (_call_2e_i == 1) {
for(uint64_t i = 0; i < 40000;   i = i + 1){
  fprintf(stderr, (_OC_str), ((double*)y)[i]);
  if (i % 20 == ((uint16_t)0)) {
  fputc(10, stderr);
}

}
}

free(A);
free(B);
free(x);
free(y);
  return 0;
}

