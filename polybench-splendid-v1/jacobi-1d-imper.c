
void kernel_jacobi_1d_imper(uint32_t _tsteps, uint32_t _n, double* _A, double* _B) {
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar_next < _tsteps;  _polly_2e_indvar_next = _polly_2e_indvar + 1){
  _polly_2e_par_2e_userContext.field0 = _tsteps;
  _polly_2e_par_2e_userContext.field1 = _n;
  _polly_2e_par_2e_userContext.field2 = _polly_2e_indvar;
  _polly_2e_par_2e_userContext.field3 = _A;
  _polly_2e_par_2e_userContext.field4 = _B;
__kmpc_fork_call((&_OC_loc_OC_dummy), 4, ((l_fptr_1*)kernel_jacobi_1d_imper_polly_subfn), 0, _n + -2, 1, (&_polly_2e_par_2e_userContext));
  _polly_2e_par_2e_userContext60.field0 = _tsteps;
  _polly_2e_par_2e_userContext60.field1 = _n;
  _polly_2e_par_2e_userContext60.field2 = _polly_2e_indvar;
  _polly_2e_par_2e_userContext60.field3 = _B;
  _polly_2e_par_2e_userContext60.field4 = _A;
__kmpc_fork_call((&_OC_loc_OC_dummy_OC_3), 4, ((l_fptr_1*)kernel_jacobi_1d_imper_polly_subfn_4), 0, _n + -2, 1, (&_polly_2e_par_2e_userContext60));
}
  return;
}


static void kernel_jacobi_1d_imper_polly_subfn(uint32_t* _polly_2e_kmpc_2e_global_tid, uint32_t* _polly_2e_kmpc_2e_bound_tid, uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
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
  (*((double**)(_polly_2e_kmpc_2e_shared+24))+1)[_polly_2e_indvar] = ((*((double**)(_polly_2e_kmpc_2e_shared+16))[_polly_2e_indvar] + (*((double**)(_polly_2e_kmpc_2e_shared+16))+1)[_polly_2e_indvar]) + (*((double**)(_polly_2e_kmpc_2e_shared+16))+2)[_polly_2e_indvar]) * 0.33333000000000002;
}
__kmpc_for_static_fini((&_OC_loc_OC_dummy), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy), *_polly_2e_kmpc_2e_global_tid);
  return;
}


static void kernel_jacobi_1d_imper_polly_subfn_4(uint32_t* _polly_2e_kmpc_2e_global_tid, uint32_t* _polly_2e_kmpc_2e_bound_tid, uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
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
  *((uint64_t*)((*((double**)(_polly_2e_kmpc_2e_shared+24))+1)+_polly_2e_indvar)) = *((uint64_t*)((*((double**)(_polly_2e_kmpc_2e_shared+16))+1)+_polly_2e_indvar));
}
__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_3), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_3), *_polly_2e_kmpc_2e_global_tid);
  return;
}


int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[3], ((uint8_t**)0), 10);
  uint64_t _call_2e_i36 = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t _call_2e_i38 = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* _call5 = malloc((_call_2e_i << 32) >> 29);
  uint8_t* _call8 = malloc((_call_2e_i << 32) >> 29);
for(uint64_t _indvars_2e_iv_2e_i = 0; _indvars_2e_iv_2e_next_2e_i < _call_2e_i;  _indvars_2e_iv_2e_next_2e_i = _indvars_2e_iv_2e_i + 1){
  ((double*)_call5)[_indvars_2e_iv_2e_i] = ((double)(_indvars_2e_iv_2e_i) + 2) / (double)(_call_2e_i);
  ((double*)_call8)[_indvars_2e_iv_2e_i] = ((double)(_indvars_2e_iv_2e_i) + 3) / (double)(_call_2e_i);
}
  if (_call_2e_i36 > 0) {
for(uint64_t _polly_2e_indvar_2e_i = 0; _polly_2e_indvar_next_2e_i < (_call_2e_i36 << 32) >> 32;  _polly_2e_indvar_next_2e_i = _polly_2e_indvar_2e_i + 1){
  _polly_2e_par_2e_userContext_2e_i.field2 = _polly_2e_indvar_2e_i;
__kmpc_fork_call((&_OC_loc_OC_dummy), 4, ((l_fptr_1*)kernel_jacobi_1d_imper_polly_subfn), 0, ((_call_2e_i << 32) >> 32) + -2, 1, (&_polly_2e_par_2e_userContext_2e_i));
  _polly_2e_par_2e_userContext60_2e_i.field2 = _polly_2e_indvar_2e_i;
__kmpc_fork_call((&_OC_loc_OC_dummy_OC_3), 4, ((l_fptr_1*)kernel_jacobi_1d_imper_polly_subfn_4), 0, ((_call_2e_i << 32) >> 32) + -2, 1, (&_polly_2e_par_2e_userContext60_2e_i));
}
}

  if (_call_2e_i38 == 1) {
for(uint64_t _indvars_2e_iv_2e_i43 = 0; _indvars_2e_iv_2e_next_2e_i47 < _call_2e_i;  _indvars_2e_iv_2e_next_2e_i47 = _indvars_2e_iv_2e_i43 + 1){
  fprintf(stderr, (_OC_str), ((double*)_call5)[_indvars_2e_iv_2e_i43]);
  if (_indvars_2e_iv_2e_i43 % 20 == 0) {
  fputc(10, stderr);
}

}
  fputc(10, stderr);
}

free(_call5);
free(_call8);
  return 0;
}

