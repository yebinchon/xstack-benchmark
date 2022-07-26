
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[1], ((uint8_t**)0), 10);
  uint64_t _call_2e_i116 = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t _call_2e_i118 = strtol(_argv[3], ((uint8_t**)0), 10);
  uint64_t _call_2e_i120 = strtol(_argv[4], ((uint8_t**)0), 10);
  uint64_t _call_2e_i122 = strtol(_argv[5], ((uint8_t**)0), 10);
  uint8_t* _call10 = malloc(_call_2e_i118 * (_call_2e_i116 << 32) >> 29);
  uint8_t* _call14 = malloc(_call_2e_i120 * (_call_2e_i116 << 32) >> 29);
  uint8_t* _call18 = malloc(_call_2e_i120 * (_call_2e_i118 << 32) >> 29);
  uint8_t* _call22 = malloc(_call_2e_i122 * (_call_2e_i118 << 32) >> 29);
  uint8_t* _call26 = malloc(_call_2e_i122 * (_call_2e_i116 << 32) >> 29);
for(uint64_t _indvars_2e_iv172_2e_i = 0; _indvars_2e_iv_2e_next173_2e_i < _call_2e_i116;  _indvars_2e_iv_2e_next173_2e_i = _indvars_2e_iv172_2e_i + 1){
for(uint64_t _indvars_2e_iv168_2e_i = 0; _indvars_2e_iv_2e_next169_2e_i < _call_2e_i120;  _indvars_2e_iv_2e_next169_2e_i = _indvars_2e_iv168_2e_i + 1){
  (((double*)_call14)+_indvars_2e_iv172_2e_i * _call_2e_i122)[_indvars_2e_iv168_2e_i] = (double)(_indvars_2e_iv172_2e_i) * (double)(_indvars_2e_iv168_2e_i) / (double)(_call_2e_i116);
}
}
for(uint64_t _indvars_2e_iv164_2e_i = 0; _indvars_2e_iv_2e_next165_2e_i < _call_2e_i120;  _indvars_2e_iv_2e_next165_2e_i = _indvars_2e_iv164_2e_i + 1){
for(uint64_t _indvars_2e_iv160_2e_i = 0; _indvars_2e_iv_2e_next161_2e_i < _call_2e_i118;  _indvars_2e_iv_2e_next161_2e_i = _indvars_2e_iv160_2e_i + 1){
  (((double*)_call18)+_indvars_2e_iv164_2e_i * _call_2e_i118)[_indvars_2e_iv160_2e_i] = (double)(_indvars_2e_iv164_2e_i) * (double)((_indvars_2e_iv_2e_next161_2e_i + 1)) / (double)(_call_2e_i118);
}
}
for(uint64_t _indvars_2e_iv156_2e_i = 0; _indvars_2e_iv_2e_next157_2e_i < _call_2e_i122;  _indvars_2e_iv_2e_next157_2e_i = _indvars_2e_iv156_2e_i + 1){
for(uint64_t _indvars_2e_iv151_2e_i = 0; _indvars_2e_iv_2e_next152_2e_i < _call_2e_i118;  _indvars_2e_iv_2e_next152_2e_i = _indvars_2e_iv151_2e_i + 1){
  (((double*)_call22)+_indvars_2e_iv156_2e_i * _call_2e_i118)[_indvars_2e_iv151_2e_i] = (double)(_indvars_2e_iv156_2e_i) * (double)((_indvars_2e_iv151_2e_i + 3)) / (double)(_call_2e_i122);
}
}
for(uint64_t _indvars_2e_iv147_2e_i = 0; _indvars_2e_iv_2e_next148_2e_i < _call_2e_i116;  _indvars_2e_iv_2e_next148_2e_i = _indvars_2e_iv147_2e_i + 1){
for(uint64_t _indvars_2e_iv_2e_i = 0; _indvars_2e_iv_2e_next_2e_i < _call_2e_i122;  _indvars_2e_iv_2e_next_2e_i = _indvars_2e_iv_2e_i + 1){
  (((double*)_call26)+_indvars_2e_iv147_2e_i * _call_2e_i122)[_indvars_2e_iv_2e_i] = (double)(_indvars_2e_iv147_2e_i) * (double)((_indvars_2e_iv_2e_i + 2)) / (double)(_call_2e_i120);
}
}
  if (_call_2e_i == 1) {
for(uint64_t _indvars_2e_iv31_2e_i = 0; _indvars_2e_iv_2e_next32_2e_i < _call_2e_i116;  _indvars_2e_iv_2e_next32_2e_i = _indvars_2e_iv31_2e_i + 1){
for(uint64_t _indvars_2e_iv_2e_i130 = 0; _indvars_2e_iv_2e_next_2e_i133 < _call_2e_i122;  _indvars_2e_iv_2e_next_2e_i133 = _indvars_2e_iv_2e_i130 + 1){
  fprintf(stderr, (_OC_str), (((double*)_call26)+_indvars_2e_iv31_2e_i * _call_2e_i122)[_indvars_2e_iv_2e_i130]);
  if ((int)(_indvars_2e_iv31_2e_i * _call_2e_i116 + _indvars_2e_iv_2e_i130) % (int)20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(_call10);
free(_call14);
free(_call18);
free(_call22);
free(_call26);
  return 0;
}

