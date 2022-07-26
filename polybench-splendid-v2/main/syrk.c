
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[1], ((uint8_t**)0), 10);
  uint64_t _call_2e_i47 = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t _call_2e_i49 = strtol(_argv[3], ((uint8_t**)0), 10);
  uint8_t* _call9 = malloc((_call_2e_i47 << 3) * _call_2e_i47);
  uint8_t* _call13 = malloc(_call_2e_i49 * (_call_2e_i47 << 3));
  if (_call_2e_i == 1) {
for(uint64_t _indvars_2e_iv32_2e_i = 0; _indvars_2e_iv_2e_next33_2e_i < _call_2e_i47;  _indvars_2e_iv_2e_next33_2e_i = _indvars_2e_iv32_2e_i + 1){
for(uint64_t _indvars_2e_iv_2e_i55 = 0; _indvars_2e_iv_2e_next_2e_i58 < _call_2e_i47;  _indvars_2e_iv_2e_next_2e_i58 = _indvars_2e_iv_2e_i55 + 1){
  fprintf(stderr, (_OC_str), (((double*)_call9)+_indvars_2e_iv32_2e_i * _call_2e_i47)[_indvars_2e_iv_2e_i55]);
  if ((int)(_indvars_2e_iv32_2e_i * _call_2e_i47 + _indvars_2e_iv_2e_i55) % (int)20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(_call9);
free(_call13);
  return 0;
}

