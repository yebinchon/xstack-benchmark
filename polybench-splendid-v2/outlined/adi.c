  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(2048 - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar4 < (2047 + 1);  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((_call2+(_polly_2e_indvar << 14))+(_polly_2e_indvar4 << 3))) = ((double)(_polly_2e_indvar) * (double)((_polly_2e_indvar4 + 1)) + 1) * 4.8828125E-4;
  *((double*)((_call6+(_polly_2e_indvar << 14))+(_polly_2e_indvar4 << 3))) = ((double)(_polly_2e_indvar) * (double)((_polly_2e_indvar4 + 2)) + 2) * 4.8828125E-4;
  *((double*)((_call10+(_polly_2e_indvar << 14))+(_polly_2e_indvar4 << 3))) = ((double)(_polly_2e_indvar) * (double)((_polly_2e_indvar4 + 3)) + 3) * 4.8828125E-4;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(2048 - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar4 < (2045 + 1);  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)(((_call2+16368)+(_polly_2e_indvar << 14))+_polly_2e_indvar4 * -8)) = (*((double*)(((_call2+16368)+(_polly_2e_indvar << 14))+_polly_2e_indvar4 * -8)) - *((double*)(((_call2+16360)+(_polly_2e_indvar << 14))+_polly_2e_indvar4 * -8)) * *((double*)(((_call6+16360)+(_polly_2e_indvar << 14))+_polly_2e_indvar4 * -8))) / *((double*)(((_call10+16360)+(_polly_2e_indvar << 14))+_polly_2e_indvar4 * -8));
}
}
}
