
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t _call_2e_i99 = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* _call4 = malloc((_call_2e_i << 3) * _call_2e_i);
  uint8_t* _call7 = malloc((_call_2e_i << 32) >> 29);
  uint8_t* _call10 = malloc((_call_2e_i << 32) >> 29);
  uint8_t* _call13 = malloc((_call_2e_i << 32) >> 29);
  uint8_t* _call16 = malloc((_call_2e_i << 32) >> 29);
  uint8_t* _call19 = malloc((_call_2e_i << 32) >> 29);
  uint8_t* _call22 = malloc((_call_2e_i << 32) >> 29);
  uint8_t* _call25 = malloc((_call_2e_i << 32) >> 29);
  uint8_t* _call28 = malloc((_call_2e_i << 32) >> 29);
  memset(_call22, 0, (_call_2e_i << 3));
  memset(_call19, 0, (_call_2e_i << 3));
for(uint64_t _indvars_2e_iv90_2e_i = 0; _indvars_2e_iv_2e_next91_2e_i < _call_2e_i;  _indvars_2e_iv_2e_next91_2e_i = _indvars_2e_iv90_2e_i + 1){
  ((double*)_call7)[_indvars_2e_iv90_2e_i] = (double)(_indvars_2e_iv90_2e_i);
  ((double*)_call13)[_indvars_2e_iv90_2e_i] = (double)((_indvars_2e_iv_2e_next91_2e_i + 1) / _call_2e_i) * 0.5;
  ((double*)_call10)[_indvars_2e_iv90_2e_i] = (double)((_indvars_2e_iv_2e_next91_2e_i + 1) / _call_2e_i) * 0.25;
  ((double*)_call16)[_indvars_2e_iv90_2e_i] = (double)((_indvars_2e_iv_2e_next91_2e_i + 1) / _call_2e_i) / 6;
  ((double*)_call25)[_indvars_2e_iv90_2e_i] = (double)((_indvars_2e_iv_2e_next91_2e_i + 1) / _call_2e_i) * 0.125;
  ((double*)_call28)[_indvars_2e_iv90_2e_i] = (double)((_indvars_2e_iv_2e_next91_2e_i + 1) / _call_2e_i) / 9;
for(uint64_t _indvars_2e_iv_2e_i = 0; _indvars_2e_iv_2e_next_2e_i < _call_2e_i;  _indvars_2e_iv_2e_next_2e_i = _indvars_2e_iv_2e_i + 1){
  (((double*)_call4)+_indvars_2e_iv90_2e_i * _call_2e_i)[_indvars_2e_iv_2e_i] = (double)(_indvars_2e_iv90_2e_i) * (double)(_indvars_2e_iv_2e_i) / (double)(_call_2e_i);
}
}
  _beta_2e_s2a_2e_i = 12313;
  _alpha_2e_s2a_2e_i = 43532;
__kmpc_fork_call((&_OC_loc_OC_dummy), 4, ((l_fptr_1*)kernel_gemver_polly_subfn), 0, _call_2e_i, 1, (&_polly_2e_par_2e_userContext_2e_i));
  _polly_2e_par_2e_userContext188_2e_i.field3 = (&_beta_2e_s2a_2e_i);
__kmpc_fork_call((&_OC_loc_OC_dummy_OC_3), 4, ((l_fptr_1*)kernel_gemver_polly_subfn_4), 0, _call_2e_i, 1, (&_polly_2e_par_2e_userContext188_2e_i));
__kmpc_fork_call((&_OC_loc_OC_dummy_OC_6), 4, ((l_fptr_1*)kernel_gemver_polly_subfn_7), 0, _call_2e_i, 1, (&_polly_2e_par_2e_userContext193_2e_i));
  _polly_2e_par_2e_userContext198_2e_i.field3 = (&_alpha_2e_s2a_2e_i);
__kmpc_fork_call((&_OC_loc_OC_dummy_OC_9), 4, ((l_fptr_1*)kernel_gemver_polly_subfn_10), 0, _call_2e_i, 1, (&_polly_2e_par_2e_userContext198_2e_i));
  if (_call_2e_i99 == 1) {
for(uint64_t _indvars_2e_iv_2e_i102 = 0; _indvars_2e_iv_2e_next_2e_i105 < _call_2e_i;  _indvars_2e_iv_2e_next_2e_i105 = _indvars_2e_iv_2e_i102 + 1){
  fprintf(stderr, (_OC_str), ((double*)_call19)[_indvars_2e_iv_2e_i102]);
  if (_indvars_2e_iv_2e_i102 % 20 == 0) {
  fputc(10, stderr);
}

}
}

free(_call4);
free(_call7);
free(_call10);
free(_call13);
free(_call16);
free(_call19);
free(_call22);
free(_call25);
free(_call28);
  return 0;
}


static void kernel_gemver_polly_subfn(uint32_t* _polly_2e_kmpc_2e_global_tid, uint32_t* _polly_2e_kmpc_2e_bound_tid, uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
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
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < *((uint32_t*)_polly_2e_kmpc_2e_shared);  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  (*((double**)(_polly_2e_kmpc_2e_shared+8))+_polly_2e_indvar * *((uint32_t*)_polly_2e_kmpc_2e_shared))[_polly_2e_indvar4] = (((*((double**)(_polly_2e_kmpc_2e_shared+8))+_polly_2e_indvar * *((uint32_t*)_polly_2e_kmpc_2e_shared))[_polly_2e_indvar4] + *((double**)(_polly_2e_kmpc_2e_shared+16))[_polly_2e_indvar] * *((double**)(_polly_2e_kmpc_2e_shared+24))[_polly_2e_indvar4]) + *((double**)(_polly_2e_kmpc_2e_shared+32))[_polly_2e_indvar] * *((double**)(_polly_2e_kmpc_2e_shared+40))[_polly_2e_indvar4]);
}
}
__kmpc_for_static_fini((&_OC_loc_OC_dummy), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy), *_polly_2e_kmpc_2e_global_tid);
  return;
}


static void kernel_gemver_polly_subfn_4(uint32_t* _polly_2e_kmpc_2e_global_tid, uint32_t* _polly_2e_kmpc_2e_bound_tid, uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
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
  double __p_scalar_ = *((double**)(_polly_2e_kmpc_2e_shared+8))[_polly_2e_indvar];
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < *((uint32_t*)_polly_2e_kmpc_2e_shared);  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  double _p_add39 = (__p_scalar_ + **((double**)(_polly_2e_kmpc_2e_shared+24)) * (*((double**)(_polly_2e_kmpc_2e_shared+16))+_polly_2e_indvar)[_polly_2e_indvar4 * *((uint32_t*)_polly_2e_kmpc_2e_shared)] * *((double**)(_polly_2e_kmpc_2e_shared+32))[_polly_2e_indvar4]);
  *((double**)(_polly_2e_kmpc_2e_shared+8))[_polly_2e_indvar] = _p_add39;
}
}
__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_3), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_3), *_polly_2e_kmpc_2e_global_tid);
  return;
}


static void kernel_gemver_polly_subfn_7(uint32_t* _polly_2e_kmpc_2e_global_tid, uint32_t* _polly_2e_kmpc_2e_bound_tid, uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
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
  *((double**)(_polly_2e_kmpc_2e_shared+8))[_polly_2e_indvar] = (*((double**)(_polly_2e_kmpc_2e_shared+8))[_polly_2e_indvar] + *((double**)(_polly_2e_kmpc_2e_shared+16))[_polly_2e_indvar]);
}
__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_6), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_6), *_polly_2e_kmpc_2e_global_tid);
  return;
}


static void kernel_gemver_polly_subfn_10(uint32_t* _polly_2e_kmpc_2e_global_tid, uint32_t* _polly_2e_kmpc_2e_bound_tid, uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
  _polly_2e_par_2e_LBPtr = _polly_2e_kmpc_2e_lb;
  _polly_2e_par_2e_UBPtr = _polly_2e_kmpc_2e_ub;
  _polly_2e_par_2e_lastIterPtr = 0;
  _polly_2e_par_2e_StridePtr = _polly_2e_kmpc_2e_inc;
__kmpc_for_static_init_8((&_OC_loc_OC_dummy_OC_9), *_polly_2e_kmpc_2e_global_tid, 34, (&_polly_2e_par_2e_lastIterPtr), (&_polly_2e_par_2e_LBPtr), (&_polly_2e_par_2e_UBPtr), (&_polly_2e_par_2e_StridePtr), 1, 1);
  uint64_t _4 = llvm_select_u64(_polly_2e_par_2e_UBPtr < _polly_2e_kmpc_2e_ub + -1, _polly_2e_par_2e_UBPtr, _polly_2e_kmpc_2e_ub + -1);
  _polly_2e_par_2e_UBPtr = _4;
  if (_polly_2e_par_2e_LBPtr > _4) {
}
for(uint64_t _polly_2e_indvar = _polly_2e_par_2e_LBPtr; _polly_2e_indvar_next<=_4;  _polly_2e_indvar_next = _polly_2e_indvar + _polly_2e_kmpc_2e_inc){
  double __p_scalar_ = *((double**)(_polly_2e_kmpc_2e_shared+8))[_polly_2e_indvar];
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < *((uint32_t*)_polly_2e_kmpc_2e_shared);  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  double _p_add77 = (__p_scalar_ + **((double**)(_polly_2e_kmpc_2e_shared+24)) * (*((double**)(_polly_2e_kmpc_2e_shared+16))+_polly_2e_indvar * *((uint32_t*)_polly_2e_kmpc_2e_shared))[_polly_2e_indvar4] * *((double**)(_polly_2e_kmpc_2e_shared+32))[_polly_2e_indvar4]);
  *((double**)(_polly_2e_kmpc_2e_shared+8))[_polly_2e_indvar] = _p_add77;
}
}
__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_9), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_9), *_polly_2e_kmpc_2e_global_tid);
  return;
}

