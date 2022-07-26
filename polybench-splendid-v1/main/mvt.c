
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* _call2 = malloc(128000000);
  uint8_t* _call5 = malloc(32000);
  uint8_t* _call8 = malloc(32000);
  uint8_t* _call11 = malloc(32000);
  uint8_t* _call14 = malloc(32000);
__kmpc_fork_call((&_OC_loc_OC_dummy), 4, ((l_fptr_1*)main_polly_subfn), 0, 4000, 1, (&_polly_2e_par_2e_userContext));
__kmpc_fork_call((&_OC_loc_OC_dummy_OC_3), 4, ((l_fptr_1*)main_polly_subfn_4), 0, 4000, 1, (&_polly_2e_par_2e_userContext71));
__kmpc_fork_call((&_OC_loc_OC_dummy_OC_6), 4, ((l_fptr_1*)main_polly_subfn_7), 0, 4000, 1, (&_polly_2e_par_2e_userContext77));
  if (_call_2e_i == 1) {
for(uint64_t _indvars_2e_iv_2e_i56 = 0; _indvars_2e_iv_2e_next_2e_i60 < 4000;  _indvars_2e_iv_2e_next_2e_i60 = _indvars_2e_iv_2e_i56 + 1){
  fprintf(stderr, (_OC_str), ((double*)_call5)[_indvars_2e_iv_2e_i56]);
  fprintf(stderr, (_OC_str), ((double*)_call8)[_indvars_2e_iv_2e_i56]);
  if (_indvars_2e_iv_2e_i56 % 20 == ((uint16_t)0)) {
  fputc(10, stderr);
}

}
}

free(_call2);
free(_call5);
free(_call8);
free(_call11);
free(_call14);
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
  *((double*)(*((uint8_t**)_polly_2e_kmpc_2e_shared)+(_polly_2e_indvar << 3))) = (double)(_polly_2e_indvar) / 4000;
  *((double*)(*((uint8_t**)(_polly_2e_kmpc_2e_shared+8))+(_polly_2e_indvar << 3))) = ((double)(_polly_2e_indvar) + 1) / 4000;
  *((double*)(*((uint8_t**)(_polly_2e_kmpc_2e_shared+16))+(_polly_2e_indvar << 3))) = ((double)(_polly_2e_indvar) + 3) / 4000;
  *((double*)(*((uint8_t**)(_polly_2e_kmpc_2e_shared+24))+(_polly_2e_indvar << 3))) = ((double)(_polly_2e_indvar) + 4) / 4000;
for(uint64_t _polly_2e_indvar11 = 0; _polly_2e_indvar11 < (3999 + 1);  _polly_2e_indvar_next12 = _polly_2e_indvar11 + 1){
  *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+32))+_polly_2e_indvar * 32000)+(_polly_2e_indvar11 << 3))) = (double)(_polly_2e_indvar) * (double)(_polly_2e_indvar11) / 4000;
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
  ((double*)*((uint8_t**)_polly_2e_kmpc_2e_shared))[_polly_2e_indvar] = (((double*)*((uint8_t**)_polly_2e_kmpc_2e_shared))[_polly_2e_indvar] + *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+8))+_polly_2e_indvar * 32000)+(_polly_2e_indvar4 << 3))) * *((double*)(*((uint8_t**)(_polly_2e_kmpc_2e_shared+16))+(_polly_2e_indvar4 << 3))));
}
}
__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_3), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_3), *_polly_2e_kmpc_2e_global_tid);
  return;
}


static void main_polly_subfn_7(uint32_t* _polly_2e_kmpc_2e_global_tid, uint32_t* _polly_2e_kmpc_2e_bound_tid, uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
  _polly_2e_par_2e_LBPtr = _polly_2e_kmpc_2e_lb;
  _polly_2e_par_2e_UBPtr = _polly_2e_kmpc_2e_ub;
  _polly_2e_par_2e_lastIterPtr = 0;
  _polly_2e_par_2e_StridePtr = _polly_2e_kmpc_2e_inc;
__kmpc_for_static_init_8((&_OC_loc_OC_dummy_OC_6), *_polly_2e_kmpc_2e_global_tid, 34, (&_polly_2e_par_2e_lastIterPtr), (&_polly_2e_par_2e_LBPtr), (&_polly_2e_par_2e_UBPtr), (&_polly_2e_par_2e_StridePtr), 1, 1);
  uint64_t _3 = llvm_select_u64(_polly_2e_par_2e_UBPtr < _polly_2e_kmpc_2e_ub + -1, _polly_2e_par_2e_UBPtr, _polly_2e_kmpc_2e_ub + -1);
  _polly_2e_par_2e_UBPtr = _3;
  if (_polly_2e_par_2e_LBPtr > _3) {
}
for(uint64_t _polly_2e_indvar = _polly_2e_par_2e_LBPtr; _polly_2e_indvar_next<=_3;  _polly_2e_indvar_next = _polly_2e_indvar + _polly_2e_kmpc_2e_inc){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar4 < (3999 + 1);  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  ((double*)*((uint8_t**)_polly_2e_kmpc_2e_shared))[_polly_2e_indvar] = (((double*)*((uint8_t**)_polly_2e_kmpc_2e_shared))[_polly_2e_indvar] + *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+8))+(_polly_2e_indvar << 3))+_polly_2e_indvar4 * 32000)) * *((double*)(*((uint8_t**)(_polly_2e_kmpc_2e_shared+16))+(_polly_2e_indvar4 << 3))));
}
}
__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_6), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_6), *_polly_2e_kmpc_2e_global_tid);
  return;
}

