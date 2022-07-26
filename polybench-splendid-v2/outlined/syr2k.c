  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i64 - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i66;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((_call10+(_call_2e_i66 << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) = (double)(_polly_2e_indvar) * (double)(_polly_2e_indvar4) / _call_2e_i64;
  *((double*)((_call14+(_call_2e_i66 << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) = (double)(_polly_2e_indvar) * (double)(_polly_2e_indvar4) / _call_2e_i64;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i64 - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i64;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((_call6+(_call_2e_i64 << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) = (double)(_polly_2e_indvar) * (double)(_polly_2e_indvar4) / _call_2e_i64;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i64 - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i64;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((_call6+(_call_2e_i64 << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) = *((double*)((_call6+(_call_2e_i64 << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) * 2123;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i64 - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i64;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
for(uint64_t _polly_2e_indvar12 = 0; _polly_2e_indvar_next13 < _call_2e_i66;  _polly_2e_indvar_next13 = _polly_2e_indvar12 + 1){
  ((double*)_call6)[(_polly_2e_indvar * _call_2e_i64 + _polly_2e_indvar4)] = ((((double*)_call6)[(_polly_2e_indvar * _call_2e_i64 + _polly_2e_indvar4)] + *((double*)((_call10+(_call_2e_i66 << 3) * _polly_2e_indvar)+(_polly_2e_indvar12 << 3))) * 32412 * *((double*)((_call14+(_call_2e_i66 << 3) * _polly_2e_indvar4)+(_polly_2e_indvar12 << 3)))) + *((double*)((_call14+(_call_2e_i66 << 3) * _polly_2e_indvar)+(_polly_2e_indvar12 << 3))) * 32412 * *((double*)((_call10+(_call_2e_i66 << 3) * _polly_2e_indvar4)+(_polly_2e_indvar12 << 3))));
}
}
}
}
