
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
__kmpc_fork_call((&_OC_loc_OC_dummy), 4, ((l_fptr_1*)main_polly_subfn), 0, 4000, 1, (&_polly_2e_par_2e_userContext));
for(uint64_t _polly_2e_indvar84 = 0; _polly_2e_indvar_next85 < 100;  _polly_2e_indvar_next85 = _polly_2e_indvar84 + 1){
for(uint64_t _polly_2e_indvar93 = 0; _polly_2e_indvar_next94 < 4000;  _polly_2e_indvar_next94 = _polly_2e_indvar93 + 1){
  *((uint64_t*)(_call6+(_polly_2e_indvar93 << 3))) = *((uint64_t*)(_call13+(_polly_2e_indvar84 << 3)));
}
  _polly_2e_par_2e_userContext99.field0 = _polly_2e_indvar84;
__kmpc_fork_call((&_OC_loc_OC_dummy_OC_3), 4, ((l_fptr_1*)main_polly_subfn_4), 0, 3999, 1, (&_polly_2e_par_2e_userContext99));
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
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar4 < (3999 + 1);  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+8))+_polly_2e_indvar * 32000)+(_polly_2e_indvar4 << 3))) = (double)(_polly_2e_indvar) * (double)((_polly_2e_indvar4 + 1)) / 4000;
  *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+16))+_polly_2e_indvar * 32000)+(_polly_2e_indvar4 << 3))) = (double)(_polly_2e_indvar) * (double)((_polly_2e_indvar4 + 2)) / 4000;
  *((double*)((*((uint8_t**)_polly_2e_kmpc_2e_shared)+_polly_2e_indvar * 32000)+(_polly_2e_indvar4 << 3))) = (double)(_polly_2e_indvar) * (double)((_polly_2e_indvar4 + 3)) / 4000;
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
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar4 < (3999 + 1);  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)(((*((uint8_t**)(_polly_2e_kmpc_2e_shared+8))+32000)+_polly_2e_indvar * 32000)+(_polly_2e_indvar4 << 3))) = (*((double*)(((*((uint8_t**)(_polly_2e_kmpc_2e_shared+8))+32000)+_polly_2e_indvar * 32000)+(_polly_2e_indvar4 << 3))) - (*((double*)(((*((uint8_t**)(_polly_2e_kmpc_2e_shared+16))+32000)+_polly_2e_indvar * 32000)+(_polly_2e_indvar4 << 3))) - *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+16))+_polly_2e_indvar * 32000)+(_polly_2e_indvar4 << 3)))) * 0.5);
}
}
__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_3), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_3), *_polly_2e_kmpc_2e_global_tid);
  return;
}

