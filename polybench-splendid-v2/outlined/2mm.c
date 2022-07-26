  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i116 - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i118;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((_call10+(_call_2e_i118 << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) = 0;
  ((double*)_call10)[(_polly_2e_indvar * _call_2e_i118 + _polly_2e_indvar4)] = 0;
for(uint64_t _polly_2e_indvar15 = 0; _polly_2e_indvar_next16 < _call_2e_i120;  _polly_2e_indvar_next16 = _polly_2e_indvar15 + 1){
  ((double*)_call10)[(_polly_2e_indvar * _call_2e_i118 + _polly_2e_indvar4)] = (((double*)_call10)[(_polly_2e_indvar * _call_2e_i118 + _polly_2e_indvar4)] + *((double*)((_call14+(_call_2e_i120 << 3) * _polly_2e_indvar)+(_polly_2e_indvar15 << 3))) * 32412 * *((double*)((_call18+(_polly_2e_indvar4 << 3))+(_call_2e_i118 << 3) * _polly_2e_indvar15)));
}
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i116 - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i122;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  ((double*)_call26)[(_polly_2e_indvar * _call_2e_i122 + _polly_2e_indvar4)] = *((double*)((_call26+(_call_2e_i122 << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) * 2123;
for(uint64_t _polly_2e_indvar14 = 0; _polly_2e_indvar_next15 < _call_2e_i118;  _polly_2e_indvar_next15 = _polly_2e_indvar14 + 1){
  ((double*)_call26)[(_polly_2e_indvar * _call_2e_i122 + _polly_2e_indvar4)] = (((double*)_call26)[(_polly_2e_indvar * _call_2e_i122 + _polly_2e_indvar4)] + *((double*)((_call10+(_call_2e_i118 << 3) * _polly_2e_indvar)+(_polly_2e_indvar14 << 3))) * *((double*)((_call22+(_polly_2e_indvar4 << 3))+(_call_2e_i118 << 3) * _polly_2e_indvar14)));
}
}
}
}
