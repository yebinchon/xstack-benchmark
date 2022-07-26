
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[1], ((uint8_t**)0), 10);
  uint64_t _call_2e_i64 = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t _call_2e_i66 = strtol(_argv[3], ((uint8_t**)0), 10);
  uint8_t* _call6 = malloc((_call_2e_i64 << 3) * _call_2e_i64);
  uint8_t* _call10 = malloc((_call_2e_i64 << 32) * _call_2e_i66 >> 29);
  uint8_t* _call14 = malloc((_call_2e_i64 << 32) * _call_2e_i66 >> 29);
  if (_call_2e_i == 1) {
for(uint64_t _indvars_2e_iv32_2e_i = 0; _indvars_2e_iv_2e_next33_2e_i < _call_2e_i64;  _indvars_2e_iv_2e_next33_2e_i = _indvars_2e_iv32_2e_i + 1){
for(uint64_t _indvars_2e_iv_2e_i72 = 0; _indvars_2e_iv_2e_next_2e_i75 < _call_2e_i64;  _indvars_2e_iv_2e_next_2e_i75 = _indvars_2e_iv_2e_i72 + 1){
  fprintf(stderr, (_OC_str), (((double*)_call6)+_indvars_2e_iv32_2e_i * _call_2e_i64)[_indvars_2e_iv_2e_i72]);
  if ((int)(_indvars_2e_iv32_2e_i * _call_2e_i64 + _indvars_2e_iv_2e_i72) % (int)20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(_call6);
free(_call10);
free(_call14);
  return 0;
}

