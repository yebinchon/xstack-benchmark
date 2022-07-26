
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* _call2 = malloc(33554432);
  uint8_t* _call6 = malloc(33554432);
  uint8_t* _call10 = malloc(33554432);
__kmpc_fork_call((&_OC_loc_OC_dummy), 4, ((l_fptr_1*)main_polly_subfn), 0, 2048, 1, (&_polly_2e_par_2e_userContext));
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
  _polly_2e_par_2e_userContext109.field0 = _polly_2e_indvar;
__kmpc_fork_call((&_OC_loc_OC_dummy_OC_3), 4, ((l_fptr_1*)main_polly_subfn_4), 0, 2048, 1, (&_polly_2e_par_2e_userContext109));
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


static void main_polly_subfn(uint32_t* _polly_2e_kmpc_2e_global_tid, uint32_t* _polly_2e_kmpc_2e_bound_tid, uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
  _polly_2e_par_2e_LBPtr = _polly_2e_kmpc_2e_lb;
  _polly_2e_par_2e_UBPtr = _polly_2e_kmpc_2e_ub;
  _polly_2e_par_2e_lastIterPtr = 0;
  _polly_2e_par_2e_StridePtr = _polly_2e_kmpc_2e_inc;
__kmpc_for_static_init_8((&_OC_loc_OC_dummy), *_polly_2e_kmpc_2e_global_tid, 34, (&_polly_2e_par_2e_lastIterPtr), (&_polly_2e_par_2e_LBPtr), (&_polly_2e_par_2e_UBPtr), (&_polly_2e_par_2e_StridePtr), 1, 1);
  uint64_t _1 = llvm_select_u64(_polly_2e_par_2e_UBPtr < _polly_2e_kmpc_2e_ub + -1, _polly_2e_par_2e_UBPtr, _polly_2e_kmpc_2e_ub + -1);
  _polly_2e_par_2e_UBPtr = _1;
  if (_polly_2e_par_2e_LBPtr > _1) {
}
for(uint64_t _polly_2e_indvar = _polly_2e_par_2e_LBPtr; _polly_2e_indvar_next<=_1;  _polly_2e_indvar_next = _polly_2e_indvar + _polly_2e_kmpc_2e_inc){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar4 < (2047 + 1);  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((*((uint8_t**)_polly_2e_kmpc_2e_shared)+(_polly_2e_indvar << 14))+(_polly_2e_indvar4 << 3))) = ((double)(_polly_2e_indvar) * (double)((_polly_2e_indvar4 + 1)) + 1) * 4.8828125E-4;
  *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+16))+(_polly_2e_indvar << 14))+(_polly_2e_indvar4 << 3))) = ((double)(_polly_2e_indvar) * (double)((_polly_2e_indvar4 + 2)) + 2) * 4.8828125E-4;
  *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+8))+(_polly_2e_indvar << 14))+(_polly_2e_indvar4 << 3))) = ((double)(_polly_2e_indvar) * (double)((_polly_2e_indvar4 + 3)) + 3) * 4.8828125E-4;
}
}
__kmpc_for_static_fini((&_OC_loc_OC_dummy), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy), *_polly_2e_kmpc_2e_global_tid);
  return;
}


static void main_polly_subfn_4(uint32_t* _polly_2e_kmpc_2e_global_tid, uint32_t* _polly_2e_kmpc_2e_bound_tid, uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
  _polly_2e_par_2e_LBPtr = _polly_2e_kmpc_2e_lb;
  _polly_2e_par_2e_UBPtr = _polly_2e_kmpc_2e_ub;
  _polly_2e_par_2e_lastIterPtr = 0;
  _polly_2e_par_2e_StridePtr = _polly_2e_kmpc_2e_inc;
__kmpc_for_static_init_8((&_OC_loc_OC_dummy_OC_3), *_polly_2e_kmpc_2e_global_tid, 34, (&_polly_2e_par_2e_lastIterPtr), (&_polly_2e_par_2e_LBPtr), (&_polly_2e_par_2e_UBPtr), (&_polly_2e_par_2e_StridePtr), 1, 1);
  uint64_t _2 = llvm_select_u64(_polly_2e_par_2e_UBPtr < _polly_2e_kmpc_2e_ub + -1, _polly_2e_par_2e_UBPtr, _polly_2e_kmpc_2e_ub + -1);
  _polly_2e_par_2e_UBPtr = _2;
  if (_polly_2e_par_2e_LBPtr > _2) {
}
for(uint64_t _polly_2e_indvar = _polly_2e_par_2e_LBPtr; _polly_2e_indvar_next<=_2;  _polly_2e_indvar_next = _polly_2e_indvar + _polly_2e_kmpc_2e_inc){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar4 < (2045 + 1);  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)(((*((uint8_t**)(_polly_2e_kmpc_2e_shared+8))+16368)+(_polly_2e_indvar << 14))+_polly_2e_indvar4 * -8)) = (*((double*)(((*((uint8_t**)(_polly_2e_kmpc_2e_shared+8))+16368)+(_polly_2e_indvar << 14))+_polly_2e_indvar4 * -8)) - *((double*)(((*((uint8_t**)(_polly_2e_kmpc_2e_shared+8))+16360)+(_polly_2e_indvar << 14))+_polly_2e_indvar4 * -8)) * *((double*)(((*((uint8_t**)(_polly_2e_kmpc_2e_shared+16))+16360)+(_polly_2e_indvar << 14))+_polly_2e_indvar4 * -8))) / *((double*)(((*((uint8_t**)(_polly_2e_kmpc_2e_shared+24))+16360)+(_polly_2e_indvar << 14))+_polly_2e_indvar4 * -8));
}
}
__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_3), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_3), *_polly_2e_kmpc_2e_global_tid);
  return;
}

