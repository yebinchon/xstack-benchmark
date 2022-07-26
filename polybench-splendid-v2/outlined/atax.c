  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i63;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((_call6+(_call_2e_i63 << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) = (double)(_polly_2e_indvar) * (double)((_polly_2e_indvar4 + 1)) / (double)(_call_2e_i);
}
}
}
