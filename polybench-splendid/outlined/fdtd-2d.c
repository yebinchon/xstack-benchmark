  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=3999; i = i + 1){
for(uint64_t j = 0; j < (3999 + 1);   j = j + 1){
  *((double*)((ex+i * 32000)+(j << 3))) = (double)(i) * (double)((j + 1)) / 4000;
  *((double*)((ey+i * 32000)+(j << 3))) = (double)(i) * (double)((j + 2)) / 4000;
  *((double*)((hz+i * 32000)+(j << 3))) = (double)(i) * (double)((j + 3)) / 4000;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=3998; j = j + 1){
for(uint64_t k = 0; k < (3999 + 1);   k = k + 1){
  *((double*)(((ey+32000)+j * 32000)+(k << 3))) = (*((double*)(((ey+32000)+j * 32000)+(k << 3))) - (*((double*)(((hz+32000)+j * 32000)+(k << 3))) - *((double*)((hz+j * 32000)+(k << 3)))) * 0.5);
}
}
}
