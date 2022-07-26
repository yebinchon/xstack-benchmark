
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t _call_2e_i27 = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* _call4 = malloc((_call_2e_i << 3) * _call_2e_i);
  _conv6_2e_i_2e_s2a = (double)(_call_2e_i);
  _polly_2e_par_2e_userContext.field0 = _call_2e_i;
  _polly_2e_par_2e_userContext.field1 = (&_conv6_2e_i_2e_s2a);
__kmpc_fork_call((&_OC_loc_OC_dummy), 4, ((l_fptr_1*)main_polly_subfn), 0, _call_2e_i, 1, (&_polly_2e_par_2e_userContext));
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar_next < _call_2e_i;  _polly_2e_indvar_next = _polly_2e_indvar + 1){
for(uint64_t _polly_2e_indvar50 = 0; _polly_2e_indvar_next51 < _call_2e_i;  _polly_2e_indvar_next51 = _polly_2e_indvar50 + 1){
for(uint64_t _polly_2e_indvar58 = 0; _polly_2e_indvar_next59 < _call_2e_i;  _polly_2e_indvar_next59 = _polly_2e_indvar58 + 1){
  *((double*)((_call4+_polly_2e_indvar50 * (_call_2e_i << 3))+(_polly_2e_indvar58 << 3))) = llvm_select_f64(llvm_fcmp_olt(*((double*)((_call4+_polly_2e_indvar50 * (_call_2e_i << 3))+(_polly_2e_indvar58 << 3))), (*((double*)((_call4+(_polly_2e_indvar << 3))+_polly_2e_indvar50 * (_call_2e_i << 3))) + *((double*)((_call4+_polly_2e_indvar * (_call_2e_i << 3))+(_polly_2e_indvar58 << 3))))), *((double*)((_call4+_polly_2e_indvar50 * (_call_2e_i << 3))+(_polly_2e_indvar58 << 3))), (*((double*)((_call4+(_polly_2e_indvar << 3))+_polly_2e_indvar50 * (_call_2e_i << 3))) + *((double*)((_call4+_polly_2e_indvar * (_call_2e_i << 3))+(_polly_2e_indvar58 << 3)))));
}
}
}
  if (_call_2e_i27 == 1) {
for(uint64_t _indvars_2e_iv32_2e_i = 0; _indvars_2e_iv_2e_next33_2e_i < _call_2e_i;  _indvars_2e_iv_2e_next33_2e_i = _indvars_2e_iv32_2e_i + 1){
for(uint64_t _indvars_2e_iv_2e_i33 = 0; _indvars_2e_iv_2e_next_2e_i36 < _call_2e_i;  _indvars_2e_iv_2e_next_2e_i36 = _indvars_2e_iv_2e_i33 + 1){
  fprintf(stderr, (_OC_str), (((double*)_call4)+_indvars_2e_iv32_2e_i * _call_2e_i)[_indvars_2e_iv_2e_i33]);
  if ((int)(_indvars_2e_iv32_2e_i * _call_2e_i + _indvars_2e_iv_2e_i33) % (int)20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(_call4);
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
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < *((uint64_t*)_polly_2e_kmpc_2e_shared);  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+16))+(*((uint64_t*)_polly_2e_kmpc_2e_shared) << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) = (double)((_polly_2e_indvar + 1)) * (double)((_polly_2e_indvar4 + 1)) / **((double**)(_polly_2e_kmpc_2e_shared+8));
}
}
__kmpc_for_static_fini((&_OC_loc_OC_dummy), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy), *_polly_2e_kmpc_2e_global_tid);
  return;
}

