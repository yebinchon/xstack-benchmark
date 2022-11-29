
int main(int argc, char ** argv) {
  uint64_t _call_2e_i = strtol(argv[1], ((uint8_t**)0), 10);
  uint8_t* A = malloc(128000000);
  uint8_t* x1 = malloc(32000);
  uint8_t* x2 = malloc(32000);
  uint8_t* y_1 = malloc(32000);
  uint8_t* y_2 = malloc(32000);
  if (_call_2e_i == 1) {
for(uint64_t i = 0; i < 4000;   i = i + 1){
  fprintf(stderr, (_OC_str), ((double*)x1)[i]);
  fprintf(stderr, (_OC_str), ((double*)x2)[i]);
  if (i % 20 == ((uint16_t)0)) {
  fputc(10, stderr);
}

}
}

free(A);
free(x1);
free(x2);
free(y_1);
free(y_2);
  return 0;
}

