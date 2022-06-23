//START OUTLINED
  #pragma omp parallel 
{
uint64_t _5 = ((n << 32) >> 32) + -2;

#pragma omp for schedule(static)
for(uint64_t i = 0; i<=(_5 - 1);i+=1){
  (((double*)B)+1)[i] = ((((double*)A)[i] + (((double*)A)+1)[i]) + (((double*)A)+2)[i]) * 0.33333000000000002;
}
}
//END OUTLINED
//START OUTLINED
  #pragma omp parallel 
{
uint64_t _5 = ((n << 32) >> 32) + -2;

#pragma omp for schedule(static)
for(uint64_t i = 0; i<=(_5 - 1);i+=1){
  *((uint64_t*)((((double*)A)+1)+i)) = *((uint64_t*)((((double*)B)+1)+i));
}
}
//END OUTLINED
