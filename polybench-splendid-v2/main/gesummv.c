
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t _call_2e_i65 = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* _call4 = malloc((_call_2e_i << 3) * _call_2e_i);
  uint8_t* _call8 = malloc((_call_2e_i << 3) * _call_2e_i);
  uint8_t* _call14 = malloc((_call_2e_i << 32) >> 29);
  uint8_t* _call17 = malloc((_call_2e_i << 32) >> 29);
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar_next < _call_2e_i;  _polly_2e_indvar_next = _polly_2e_indvar + 1){
  ((double*)_call17)[_polly_2e_indvar] = 0;
  double _polly_2e_access_2e_call1799_2e_reload = 0;
  double _add_2e_i83_2e_phiops_2e_0 = 0;
for(uint64_t _polly_2e_indvar95 = 0; _polly_2e_indvar_next96 < _call_2e_i;  _polly_2e_indvar_next96 = _polly_2e_indvar95 + 1){
  double _p_add_2e_i = (_add_2e_i83_2e_phiops_2e_0 + *((double*)((_call4+_polly_2e_indvar * (_call_2e_i << 3))+(_polly_2e_indvar95 << 3))) * *((double*)(_call14+(_polly_2e_indvar95 << 3))));
  double _p_add25_2e_i = (_polly_2e_access_2e_call1799_2e_reload + *((double*)(_call14+(_polly_2e_indvar95 << 3))) * *((double*)((_call8+_polly_2e_indvar * (_call_2e_i << 3))+(_polly_2e_indvar95 << 3))));
}
  *((double*)(_call17+(_polly_2e_indvar << 3))) = (_p_add_2e_i * 43532 + _p_add25_2e_i * 12313);
}
  if (_call_2e_i65 == 1) {
for(uint64_t _indvars_2e_iv_2e_i68 = 0; _indvars_2e_iv_2e_next_2e_i71 < _call_2e_i;  _indvars_2e_iv_2e_next_2e_i71 = _indvars_2e_iv_2e_i68 + 1){
  fprintf(stderr, (_OC_str), ((double*)_call17)[_indvars_2e_iv_2e_i68]);
  if (_indvars_2e_iv_2e_i68 % 20 == 0) {
  fputc(10, stderr);
}

}
}

free(_call4);
free(_call8);
free(_call14);
free(_call17);
  return 0;
}

