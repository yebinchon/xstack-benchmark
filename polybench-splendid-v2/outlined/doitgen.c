  #pragma omp parallel 
{
uint64_t _2 = ((_call_2e_i70 << 32) + -4294967296 >> 32) + 1;

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_2 - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i72;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
for(uint64_t _polly_2e_indvar12 = 0; _polly_2e_indvar_next13 < _call_2e_i74;  _polly_2e_indvar_next13 = _polly_2e_indvar12 + 1){
  *((double*)((_call14+(_call_2e_i74 << 3) * (_polly_2e_indvar4 + _polly_2e_indvar * _call_2e_i72))+(_polly_2e_indvar12 << 3))) = 0;
  double __p_scalar_57 = 0;
for(uint64_t _polly_2e_indvar22 = 0; _polly_2e_indvar_next23 < _call_2e_i74;  _polly_2e_indvar_next23 = _polly_2e_indvar22 + 1){
  double _p_add = (__p_scalar_57 + *((double*)((_call9+(_call_2e_i74 << 3) * (_polly_2e_indvar4 + _polly_2e_indvar * _call_2e_i72))+(_polly_2e_indvar22 << 3))) * (((double*)_call18)+_polly_2e_indvar12)[_polly_2e_indvar22 * _call_2e_i74]);
}
  *((double*)((_call14+(_call_2e_i74 << 3) * (_polly_2e_indvar4 + _polly_2e_indvar * _call_2e_i72))+(_polly_2e_indvar12 << 3))) = _p_add;
}
for(uint64_t _polly_2e_indvar41 = 0; _polly_2e_indvar_next42 < _call_2e_i74;  _polly_2e_indvar_next42 = _polly_2e_indvar41 + 1){
  *((uint64_t*)((_call9+(_call_2e_i74 << 3) * (_polly_2e_indvar4 + _polly_2e_indvar * _call_2e_i72))+(_polly_2e_indvar41 << 3))) = *((uint64_t*)((_call14+(_call_2e_i74 << 3) * (_polly_2e_indvar4 + _polly_2e_indvar * _call_2e_i72))+(_polly_2e_indvar41 << 3)));
}
}
}
}
