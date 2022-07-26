
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* _call2 = malloc(128000000);
  uint8_t* _call5 = malloc(32000);
  uint8_t* _call8 = malloc(32000);
  uint8_t* _call11 = malloc(32000);
  uint8_t* _call14 = malloc(32000);
  if (_call_2e_i == 1) {
for(uint64_t _indvars_2e_iv_2e_i56 = 0; _indvars_2e_iv_2e_next_2e_i60 < 4000;  _indvars_2e_iv_2e_next_2e_i60 = _indvars_2e_iv_2e_i56 + 1){
  fprintf(stderr, (_OC_str), ((double*)_call5)[_indvars_2e_iv_2e_i56]);
  fprintf(stderr, (_OC_str), ((double*)_call8)[_indvars_2e_iv_2e_i56]);
  if (_indvars_2e_iv_2e_i56 % 20 == ((uint16_t)0)) {
  fputc(10, stderr);
}

}
}

free(_call2);
free(_call5);
free(_call8);
free(_call11);
free(_call14);
  return 0;
}

