  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((_call4+(_call_2e_i << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) = (double)((_polly_2e_indvar + 1)) * (double)((_polly_2e_indvar4 + 1)) / _call_2e_i;
}
}
}
