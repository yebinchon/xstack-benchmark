
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[1], ((uint8_t**)0), 10);
  uint64_t _call_2e_i70 = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t _call_2e_i72 = strtol(_argv[3], ((uint8_t**)0), 10);
  uint64_t _call_2e_i74 = strtol(_argv[4], ((uint8_t**)0), 10);
  uint8_t* _call9 = malloc((_call_2e_i70 << 32) * _call_2e_i72 * _call_2e_i74 >> 29);
  uint8_t* _call14 = malloc((_call_2e_i70 << 32) * _call_2e_i72 * _call_2e_i74 >> 29);
  uint8_t* _call18 = malloc((_call_2e_i74 << 3) * _call_2e_i74);
for(uint64_t _indvars_2e_iv96_2e_i = 0; _indvars_2e_iv_2e_next97_2e_i < _call_2e_i70;  _indvars_2e_iv_2e_next97_2e_i = _indvars_2e_iv96_2e_i + 1){
for(uint64_t _indvars_2e_iv92_2e_i = 0; _indvars_2e_iv_2e_next93_2e_i < _call_2e_i72;  _indvars_2e_iv_2e_next93_2e_i = _indvars_2e_iv92_2e_i + 1){
for(uint64_t _indvars_2e_iv88_2e_i = 0; _indvars_2e_iv_2e_next89_2e_i < _call_2e_i74;  _indvars_2e_iv_2e_next89_2e_i = _indvars_2e_iv88_2e_i + 1){
  ((((double*)_call9)+_call_2e_i74 * _call_2e_i72 * _indvars_2e_iv96_2e_i)+_indvars_2e_iv92_2e_i * _call_2e_i74)[_indvars_2e_iv88_2e_i] = ((double)(_indvars_2e_iv96_2e_i) * (double)(_indvars_2e_iv92_2e_i) + (double)(_indvars_2e_iv88_2e_i)) / (double)(_call_2e_i74);
}
}
}
for(uint64_t _indvars_2e_iv84_2e_i = 0; _indvars_2e_iv_2e_next85_2e_i < _call_2e_i74;  _indvars_2e_iv_2e_next85_2e_i = _indvars_2e_iv84_2e_i + 1){
for(uint64_t _indvars_2e_iv_2e_i = 0; _indvars_2e_iv_2e_next_2e_i < _call_2e_i74;  _indvars_2e_iv_2e_next_2e_i = _indvars_2e_iv_2e_i + 1){
  (((double*)_call18)+_indvars_2e_iv84_2e_i * _call_2e_i74)[_indvars_2e_iv_2e_i] = (double)(_indvars_2e_iv84_2e_i) * (double)(_indvars_2e_iv_2e_i) / (double)(_call_2e_i74);
}
}
  if (_call_2e_i == 1) {
for(uint64_t _indvars_2e_iv48_2e_i = 0; _indvars_2e_iv_2e_next49_2e_i < _call_2e_i70;  _indvars_2e_iv_2e_next49_2e_i = _indvars_2e_iv48_2e_i + 1){
for(uint64_t _indvars_2e_iv44_2e_i = 0; _indvars_2e_iv_2e_next45_2e_i < _call_2e_i72;  _indvars_2e_iv_2e_next45_2e_i = _indvars_2e_iv44_2e_i + 1){
for(uint64_t _indvars_2e_iv_2e_i83 = 0; _indvars_2e_iv_2e_next_2e_i86 < _call_2e_i74;  _indvars_2e_iv_2e_next_2e_i86 = _indvars_2e_iv_2e_i83 + 1){
  fprintf(stderr, (_OC_str), ((((double*)_call9)+_call_2e_i74 * _call_2e_i72 * _indvars_2e_iv48_2e_i)+_indvars_2e_iv44_2e_i * _call_2e_i74)[_indvars_2e_iv_2e_i83]);
  if (_indvars_2e_iv48_2e_i % 20 == 0) {
  fputc(10, stderr);
}

}
}
}
  fputc(10, stderr);
}

free(_call9);
free(_call14);
free(_call18);
  return 0;
}

