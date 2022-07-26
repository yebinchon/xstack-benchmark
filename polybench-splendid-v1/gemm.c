
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[1], ((uint8_t**)0), 10);
  uint64_t _call_2e_i70 = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t _call_2e_i72 = strtol(_argv[3], ((uint8_t**)0), 10);
  uint64_t _call_2e_i74 = strtol(_argv[4], ((uint8_t**)0), 10);
  uint8_t* _call13 = malloc(_call_2e_i72 * (_call_2e_i70 << 3));
  uint8_t* _call17 = malloc(_call_2e_i74 * (_call_2e_i70 << 3));
  uint8_t* _call21 = malloc((_call_2e_i72 << 3) * _call_2e_i74);
  _conv5_2e_i_2e_s2a = (double)(_call_2e_i70);
  _polly_2e_par_2e_userContext.field0 = _call_2e_i72;
  _polly_2e_par_2e_userContext.field1 = _call_2e_i70;
  _polly_2e_par_2e_userContext.field2 = _call_2e_i74;
  _polly_2e_par_2e_userContext.field3 = (&_conv5_2e_i_2e_s2a);
__kmpc_fork_call((&_OC_loc_OC_dummy), 4, ((l_fptr_1*)main_polly_subfn), 0, _call_2e_i70, 1, (&_polly_2e_par_2e_userContext));
  _polly_2e_par_2e_userContext103.field0 = _call_2e_i72;
  _polly_2e_par_2e_userContext103.field1 = _call_2e_i70;
  _polly_2e_par_2e_userContext103.field2 = _call_2e_i74;
  _polly_2e_par_2e_userContext103.field3 = (&_conv5_2e_i_2e_s2a);
__kmpc_fork_call((&_OC_loc_OC_dummy_OC_3), 4, ((l_fptr_1*)main_polly_subfn_4), 0, _call_2e_i70, 1, (&_polly_2e_par_2e_userContext103));
  _polly_2e_par_2e_userContext110.field0 = _call_2e_i72;
  _polly_2e_par_2e_userContext110.field1 = _call_2e_i70;
  _polly_2e_par_2e_userContext110.field2 = _call_2e_i74;
  _polly_2e_par_2e_userContext110.field3 = (&_conv5_2e_i_2e_s2a);
__kmpc_fork_call((&_OC_loc_OC_dummy_OC_6), 4, ((l_fptr_1*)main_polly_subfn_7), 0, _call_2e_i74, 1, (&_polly_2e_par_2e_userContext110));
  _polly_2e_par_2e_userContext117.field0 = _call_2e_i72;
  _polly_2e_par_2e_userContext117.field1 = _call_2e_i70;
  _polly_2e_par_2e_userContext117.field2 = _call_2e_i74;
__kmpc_fork_call((&_OC_loc_OC_dummy_OC_9), 4, ((l_fptr_1*)main_polly_subfn_10), 0, _call_2e_i70, 1, (&_polly_2e_par_2e_userContext117));
  if (_call_2e_i == 1) {
for(uint64_t _indvars_2e_iv31_2e_i = 0; _indvars_2e_iv_2e_next32_2e_i < _call_2e_i70;  _indvars_2e_iv_2e_next32_2e_i = _indvars_2e_iv31_2e_i + 1){
for(uint64_t _indvars_2e_iv_2e_i82 = 0; _indvars_2e_iv_2e_next_2e_i85 < _call_2e_i72;  _indvars_2e_iv_2e_next_2e_i85 = _indvars_2e_iv_2e_i82 + 1){
  fprintf(stderr, (_OC_str), (((double*)_call13)+_indvars_2e_iv31_2e_i * _call_2e_i72)[_indvars_2e_iv_2e_i82]);
  if ((int)(_indvars_2e_iv31_2e_i * _call_2e_i70 + _indvars_2e_iv_2e_i82) % (int)20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(_call13);
free(_call17);
free(_call21);
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
  *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+32))+(*((uint64_t*)_polly_2e_kmpc_2e_shared) << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) = (double)(_polly_2e_indvar) * (double)(_polly_2e_indvar4) / **((double**)(_polly_2e_kmpc_2e_shared+24));
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
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < *((uint64_t*)(_polly_2e_kmpc_2e_shared+16));  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+32))+(*((uint64_t*)(_polly_2e_kmpc_2e_shared+16)) << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) = (double)(_polly_2e_indvar) * (double)(_polly_2e_indvar4) / **((double**)(_polly_2e_kmpc_2e_shared+24));
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
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < *((uint64_t*)_polly_2e_kmpc_2e_shared);  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+32))+(*((uint64_t*)_polly_2e_kmpc_2e_shared) << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) = (double)(_polly_2e_indvar) * (double)(_polly_2e_indvar4) / **((double**)(_polly_2e_kmpc_2e_shared+24));
}
}
__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_6), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_6), *_polly_2e_kmpc_2e_global_tid);
  return;
}


static void main_polly_subfn_10(uint32_t* _polly_2e_kmpc_2e_global_tid, uint32_t* _polly_2e_kmpc_2e_bound_tid, uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
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
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < *((uint64_t*)_polly_2e_kmpc_2e_shared);  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  ((double*)*((uint8_t**)(_polly_2e_kmpc_2e_shared+24)))[(_polly_2e_indvar * *((uint64_t*)_polly_2e_kmpc_2e_shared) + _polly_2e_indvar4)] = *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+24))+(*((uint64_t*)_polly_2e_kmpc_2e_shared) << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) * 2123;
for(uint64_t _polly_2e_indvar14 = 0; _polly_2e_indvar_next15 < *((uint64_t*)(_polly_2e_kmpc_2e_shared+16));  _polly_2e_indvar_next15 = _polly_2e_indvar14 + 1){
  ((double*)*((uint8_t**)(_polly_2e_kmpc_2e_shared+24)))[(_polly_2e_indvar * *((uint64_t*)_polly_2e_kmpc_2e_shared) + _polly_2e_indvar4)] = (((double*)*((uint8_t**)(_polly_2e_kmpc_2e_shared+24)))[(_polly_2e_indvar * *((uint64_t*)_polly_2e_kmpc_2e_shared) + _polly_2e_indvar4)] + *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+32))+(*((uint64_t*)(_polly_2e_kmpc_2e_shared+16)) << 3) * _polly_2e_indvar)+(_polly_2e_indvar14 << 3))) * 32412 * *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+40))+(_polly_2e_indvar4 << 3))+(*((uint64_t*)_polly_2e_kmpc_2e_shared) << 3) * _polly_2e_indvar14)));
}
}
}
__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_9), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_9), *_polly_2e_kmpc_2e_global_tid);
  return;
}

