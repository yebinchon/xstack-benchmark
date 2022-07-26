
void kernel_jacobi_1d_imper(uint32_t _tsteps, uint32_t _n, double* _A, double* _B) {
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar_next < _tsteps;  _polly_2e_indvar_next = _polly_2e_indvar + 1){
}
  return;
}


int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[3], ((uint8_t**)0), 10);
  uint64_t _call_2e_i36 = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t _call_2e_i38 = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* _call5 = malloc((_call_2e_i << 32) >> 29);
  uint8_t* _call8 = malloc((_call_2e_i << 32) >> 29);
for(uint64_t _indvars_2e_iv_2e_i = 0; _indvars_2e_iv_2e_next_2e_i < _call_2e_i;  _indvars_2e_iv_2e_next_2e_i = _indvars_2e_iv_2e_i + 1){
  ((double*)_call5)[_indvars_2e_iv_2e_i] = ((double)(_indvars_2e_iv_2e_i) + 2) / (double)(_call_2e_i);
  ((double*)_call8)[_indvars_2e_iv_2e_i] = ((double)(_indvars_2e_iv_2e_i) + 3) / (double)(_call_2e_i);
}
  if (_call_2e_i36 > 0) {
for(uint64_t _polly_2e_indvar_2e_i = 0; _polly_2e_indvar_next_2e_i < (_call_2e_i36 << 32) >> 32;  _polly_2e_indvar_next_2e_i = _polly_2e_indvar_2e_i + 1){
}
}

  if (_call_2e_i38 == 1) {
for(uint64_t _indvars_2e_iv_2e_i43 = 0; _indvars_2e_iv_2e_next_2e_i47 < _call_2e_i;  _indvars_2e_iv_2e_next_2e_i47 = _indvars_2e_iv_2e_i43 + 1){
  fprintf(stderr, (_OC_str), ((double*)_call5)[_indvars_2e_iv_2e_i43]);
  if (_indvars_2e_iv_2e_i43 % 20 == 0) {
  fputc(10, stderr);
}

}
  fputc(10, stderr);
}

free(_call5);
free(_call8);
  return 0;
}

