  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(40000 - 1);_polly_2e_indvar+=1){
  *((double*)(_call14+(_polly_2e_indvar << 3))) = (double)(_polly_2e_indvar) * 3.1415926535897931;
for(uint64_t _polly_2e_indvar5 = 0; _polly_2e_indvar5 < (39999 + 1);  _polly_2e_indvar_next6 = _polly_2e_indvar5 + 1){
  *((double*)((_call2+_polly_2e_indvar * 320000)+(_polly_2e_indvar5 << 3))) = (double)(_polly_2e_indvar) * (double)((_polly_2e_indvar5 + 1)) / 4.0E+4;
}
}
}
