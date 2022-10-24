  #pragma omp parallel 
{
uint64_t _2 = n + -2;

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=(_2 - 1); j = j + 1){
  if (n > 2) {
for(uint64_t k = 0; k < n + -2;   k = k + 1){
  *((double*)((((uint8_t*)(((double*)B)+1))+((j << 3) + 8) * n)+(k << 3))) = ((((*((double*)((((uint8_t*)(((double*)A)+1))+((j << 3) + 8) * n)+(k << 3))) + *((double*)((((uint8_t*)(double*)A)+((j << 3) + 8) * n)+(k << 3)))) + *((double*)((((uint8_t*)(((double*)A)+2))+((j << 3) + 8) * n)+(k << 3)))) + *((double*)((((uint8_t*)(((double*)A)+1))+((j << 3) + 16) * n)+(k << 3)))) + (((double*)A)+1)[k+j * n]) * 0.20000000000000001;
}
}

}
}
  #pragma omp parallel 
{
uint64_t _2 = n + -2;

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=(_2 - 1); j = j + 1){
  if (n > 2) {
for(uint64_t k = 0; k < n + -2;   k = k + 1){
  *((uint64_t*)((((uint8_t*)(((double*)A)+1))+((j << 3) + 8) * n)+(k << 3))) = *((uint64_t*)((((uint8_t*)(((double*)B)+1))+((j << 3) + 8) * n)+(k << 3)));
}
}

}
}
