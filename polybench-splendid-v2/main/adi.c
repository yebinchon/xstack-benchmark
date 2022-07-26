
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* _call2 = malloc(33554432);
  uint8_t* _call6 = malloc(33554432);
  uint8_t* _call10 = malloc(33554432);
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar_next < 50;  _polly_2e_indvar_next = _polly_2e_indvar + 1){
for(uint64_t _polly_2e_indvar66 = 0; _polly_2e_indvar_next67 < 2048;  _polly_2e_indvar_next67 = _polly_2e_indvar66 + 1){
  double __2e_phiops_2e_0 = *((double*)(_call10+(_polly_2e_indvar66 << 14)));
  double __2e_phiops73_2e_0 = *((double*)(_call2+(_polly_2e_indvar66 << 14)));
for(uint64_t _polly_2e_indvar77 = 0; _polly_2e_indvar_next78 < 2047;  _polly_2e_indvar_next78 = _polly_2e_indvar77 + 1){
  double _p_sub22_2e_i = (*((double*)(((_call2+8)+(_polly_2e_indvar66 << 14))+(_polly_2e_indvar77 << 3))) - __2e_phiops73_2e_0 * *((double*)(((_call6+8)+(_polly_2e_indvar66 << 14))+(_polly_2e_indvar77 << 3))) / __2e_phiops_2e_0);
  *((double*)(((_call2+8)+(_polly_2e_indvar66 << 14))+(_polly_2e_indvar77 << 3))) = _p_sub22_2e_i;
  double _p_sub46_2e_i = (*((double*)(((_call10+8)+(_polly_2e_indvar66 << 14))+(_polly_2e_indvar77 << 3))) - *((double*)(((_call6+8)+(_polly_2e_indvar66 << 14))+(_polly_2e_indvar77 << 3))) * *((double*)(((_call6+8)+(_polly_2e_indvar66 << 14))+(_polly_2e_indvar77 << 3))) / __2e_phiops_2e_0);
  *((double*)(((_call10+8)+(_polly_2e_indvar66 << 14))+(_polly_2e_indvar77 << 3))) = _p_sub46_2e_i;
}
}
for(uint64_t _polly_2e_indvar97 = 0; _polly_2e_indvar_next98 < 2048;  _polly_2e_indvar_next98 = _polly_2e_indvar97 + 1){
  *((double*)((_call2+16376)+(_polly_2e_indvar97 << 14))) = *((double*)((_call2+16376)+(_polly_2e_indvar97 << 14))) / *((double*)((_call10+16376)+(_polly_2e_indvar97 << 14)));
}
for(uint64_t _polly_2e_indvar117 = 0; _polly_2e_indvar_next118 < 2047;  _polly_2e_indvar_next118 = _polly_2e_indvar117 + 1){
for(uint64_t _polly_2e_indvar123 = 0; _polly_2e_indvar_next124 < 2048;  _polly_2e_indvar_next124 = _polly_2e_indvar123 + 1){
  *((double*)(((_call2+16384)+(_polly_2e_indvar117 << 14))+(_polly_2e_indvar123 << 3))) = (*((double*)(((_call2+16384)+(_polly_2e_indvar117 << 14))+(_polly_2e_indvar123 << 3))) - *((double*)((_call2+(_polly_2e_indvar117 << 14))+(_polly_2e_indvar123 << 3))) * *((double*)(((_call6+16384)+(_polly_2e_indvar117 << 14))+(_polly_2e_indvar123 << 3))) / *((double*)((_call10+(_polly_2e_indvar117 << 14))+(_polly_2e_indvar123 << 3))));
  *((double*)(((_call10+16384)+(_polly_2e_indvar117 << 14))+(_polly_2e_indvar123 << 3))) = (*((double*)(((_call10+16384)+(_polly_2e_indvar117 << 14))+(_polly_2e_indvar123 << 3))) - *((double*)(((_call6+16384)+(_polly_2e_indvar117 << 14))+(_polly_2e_indvar123 << 3))) * *((double*)(((_call6+16384)+(_polly_2e_indvar117 << 14))+(_polly_2e_indvar123 << 3))) / *((double*)((_call10+(_polly_2e_indvar117 << 14))+(_polly_2e_indvar123 << 3))));
}
}
for(uint64_t _polly_2e_indvar152 = 0; _polly_2e_indvar_next153 < 2048;  _polly_2e_indvar_next153 = _polly_2e_indvar152 + 1){
  *((double*)((_call2+33538048)+(_polly_2e_indvar152 << 3))) = *((double*)((_call2+33538048)+(_polly_2e_indvar152 << 3))) / *((double*)((_call10+33538048)+(_polly_2e_indvar152 << 3)));
}
for(uint64_t _polly_2e_indvar166 = 0; _polly_2e_indvar_next167 < 2046;  _polly_2e_indvar_next167 = _polly_2e_indvar166 + 1){
for(uint64_t _polly_2e_indvar172 = 0; _polly_2e_indvar_next173 < 2048;  _polly_2e_indvar_next173 = _polly_2e_indvar172 + 1){
  *((double*)(((_call2+33521664)+_polly_2e_indvar166 * -16384)+(_polly_2e_indvar172 << 3))) = (*((double*)(((_call2+33521664)+_polly_2e_indvar166 * -16384)+(_polly_2e_indvar172 << 3))) - *((double*)(((_call2+33505280)+_polly_2e_indvar166 * -16384)+(_polly_2e_indvar172 << 3))) * *((double*)(((_call6+33505280)+_polly_2e_indvar166 * -16384)+(_polly_2e_indvar172 << 3)))) / *((double*)(((_call10+33521664)+_polly_2e_indvar166 * -16384)+(_polly_2e_indvar172 << 3)));
}
}
}
  if (_call_2e_i == 1) {
for(uint64_t _indvars_2e_iv7_2e_i = 0; _indvars_2e_iv_2e_next8_2e_i < 2048;  _indvars_2e_iv_2e_next8_2e_i = _indvars_2e_iv7_2e_i + 1){
for(uint64_t _indvars_2e_iv_2e_i48 = 0; _indvars_2e_iv_2e_next_2e_i51 < 2048;  _indvars_2e_iv_2e_next_2e_i51 = _indvars_2e_iv_2e_i48 + 1){
  fprintf(stderr, (_OC_str), (((double*)_call2)+(_indvars_2e_iv7_2e_i << 11))[_indvars_2e_iv_2e_i48]);
  if ((_indvars_2e_iv_2e_i48 + (_indvars_2e_iv7_2e_i << 11)) % 20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(_call2);
free(_call6);
free(_call10);
  return 0;
}

