//START OUTLINED
  #pragma omp parallel 
{
uint64_t _2 = n + -2;

#pragma omp for schedule(static)
for(uint64_t i = 0; i<=(_2 - 1);i+=1){
  if (n > 2) {
for(uint64_t j = 0; j < n + -2;  j = j + 1){
  *((double*)((((uint8_t*)(((double*)B)+1))+((i << 3) + 8) * n)+(j << 3))) = ((((*((double*)((((uint8_t*)(((double*)A)+1))+((i << 3) + 8) * n)+(j << 3))) + *((double*)((((uint8_t*)(double*)A)+((i << 3) + 8) * n)+(j << 3)))) + *((double*)((((uint8_t*)(((double*)A)+2))+((i << 3) + 8) * n)+(j << 3)))) + *((double*)((((uint8_t*)(((double*)A)+1))+((i << 3) + 16) * n)+(j << 3)))) + ((((double*)A)+1)+i * n)[j]) * 0.20000000000000001;
}
}

}
}
//END OUTLINED
//START OUTLINED
  #pragma omp parallel 
{
uint64_t _2 = n + -2;

#pragma omp for schedule(static)
for(uint64_t i = 0; i<=(_2 - 1);i+=1){
  if (n > 2) {
for(uint64_t j = 0; j < n + -2;  j = j + 1){
  *((uint64_t*)((((uint8_t*)(((double*)A)+1))+((i << 3) + 8) * n)+(j << 3))) = *((uint64_t*)((((uint8_t*)(((double*)B)+1))+((i << 3) + 8) * n)+(j << 3)));
}
}

}
}
//END OUTLINED
