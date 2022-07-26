
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* _call2 = malloc(128000000);
  uint8_t* _call6 = malloc(128000000);
  uint8_t* _call10 = malloc(128000000);
  uint8_t* _call13 = malloc(32000);
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar_next < 4000;  _polly_2e_indvar_next = _polly_2e_indvar + 1){
  *((double*)(_call13+(_polly_2e_indvar << 3))) = (double)(_polly_2e_indvar);
}
for(uint64_t _polly_2e_indvar84 = 0; _polly_2e_indvar_next85 < 100;  _polly_2e_indvar_next85 = _polly_2e_indvar84 + 1){
for(uint64_t _polly_2e_indvar93 = 0; _polly_2e_indvar_next94 < 4000;  _polly_2e_indvar_next94 = _polly_2e_indvar93 + 1){
  *((uint64_t*)(_call6+(_polly_2e_indvar93 << 3))) = *((uint64_t*)(_call13+(_polly_2e_indvar84 << 3)));
}
for(uint64_t _polly_2e_indvar106 = 0; _polly_2e_indvar_next107 < 4000;  _polly_2e_indvar_next107 = _polly_2e_indvar106 + 1){
  double __2e_phiops_2e_0 = *((double*)(_call10+_polly_2e_indvar106 * 32000));
for(uint64_t _polly_2e_indvar114 = 0; _polly_2e_indvar_next115 < 3999;  _polly_2e_indvar_next115 = _polly_2e_indvar114 + 1){
  *((double*)(((_call2+8)+_polly_2e_indvar106 * 32000)+(_polly_2e_indvar114 << 3))) = (*((double*)(((_call2+8)+_polly_2e_indvar106 * 32000)+(_polly_2e_indvar114 << 3))) - (*((double*)(((_call10+8)+_polly_2e_indvar106 * 32000)+(_polly_2e_indvar114 << 3))) - __2e_phiops_2e_0) * 0.5);
  __2e_phiops_2e_0 = *((double*)(((_call10+8)+_polly_2e_indvar106 * 32000)+(_polly_2e_indvar114 << 3)));
}
}
for(uint64_t _polly_2e_indvar130 = 0; _polly_2e_indvar_next131 < 3999;  _polly_2e_indvar_next131 = _polly_2e_indvar130 + 1){
  double __2e_phiops135_2e_0 = *((double*)(_call2+_polly_2e_indvar130 * 32000));
for(uint64_t _polly_2e_indvar139 = 0; _polly_2e_indvar_next140 < 3999;  _polly_2e_indvar_next140 = _polly_2e_indvar139 + 1){
  *((double*)((_call10+_polly_2e_indvar130 * 32000)+(_polly_2e_indvar139 << 3))) = (*((double*)((_call10+_polly_2e_indvar130 * 32000)+(_polly_2e_indvar139 << 3))) - (((*((double*)(((_call2+8)+_polly_2e_indvar130 * 32000)+(_polly_2e_indvar139 << 3))) - __2e_phiops135_2e_0) + *((double*)(((_call6+32000)+_polly_2e_indvar130 * 32000)+(_polly_2e_indvar139 << 3)))) - *((double*)((_call6+_polly_2e_indvar130 * 32000)+(_polly_2e_indvar139 << 3)))) * 0.69999999999999996);
  __2e_phiops135_2e_0 = *((double*)(((_call2+8)+_polly_2e_indvar130 * 32000)+(_polly_2e_indvar139 << 3)));
}
}
}
  if (_call_2e_i == 1) {
for(uint64_t _indvars_2e_iv7_2e_i = 0; _indvars_2e_iv_2e_next8_2e_i < 4000;  _indvars_2e_iv_2e_next8_2e_i = _indvars_2e_iv7_2e_i + 1){
for(uint64_t _indvars_2e_iv_2e_i61 = 0; _indvars_2e_iv_2e_next_2e_i63 < 4000;  _indvars_2e_iv_2e_next_2e_i63 = _indvars_2e_iv_2e_i61 + 1){
  fprintf(stderr, (_OC_str), (((double*)_call2)+_indvars_2e_iv7_2e_i * 4000)[_indvars_2e_iv_2e_i61]);
  fprintf(stderr, (_OC_str), (((double*)_call6)+_indvars_2e_iv7_2e_i * 4000)[_indvars_2e_iv_2e_i61]);
  fprintf(stderr, (_OC_str), (((double*)_call10)+_indvars_2e_iv7_2e_i * 4000)[_indvars_2e_iv_2e_i61]);
  if ((_indvars_2e_iv_2e_i61 + _indvars_2e_iv7_2e_i * 4000) % 20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(_call2);
free(_call6);
free(_call10);
free(_call13);
  return 0;
}

