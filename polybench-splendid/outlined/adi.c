  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=2057; i = i + 1){
for(uint64_t j = 0; j < (2057 + 1);   j = j + 1){
  *((double*)((X+i * 16464)+(j << 3))) = ((double)(i) * (double)((j + 1)) + 1) / 2058;
  *((double*)((A+i * 16464)+(j << 3))) = ((double)(i) * (double)((j + 2)) + 2) / 2058;
  *((double*)((B+i * 16464)+(j << 3))) = ((double)(i) * (double)((j + 3)) + 3) / 2058;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=2057; j = j + 1){
for(uint64_t k = 0; k < (2055 + 1);   k = k + 1){
  *((double*)(((X+16448)+j * 16464)+k * -8)) = (*((double*)(((X+16448)+j * 16464)+k * -8)) - *((double*)(((X+16440)+j * 16464)+k * -8)) * *((double*)(((A+16440)+j * 16464)+k * -8))) / *((double*)(((B+16440)+j * 16464)+k * -8));
}
}
}
