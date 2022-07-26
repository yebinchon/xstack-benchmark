  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(2048 - 1);i+=1){
for(uint64_t j = 0; j < (2047 + 1);  j = j + 1){
  *((double*)((X+(i << 14))+(j << 3))) = ((double)(i) * (double)((j + 1)) + 1) * 4.8828125E-4;
  *((double*)((A+(i << 14))+(j << 3))) = ((double)(i) * (double)((j + 2)) + 2) * 4.8828125E-4;
  *((double*)((B+(i << 14))+(j << 3))) = ((double)(i) * (double)((j + 3)) + 3) * 4.8828125E-4;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(2048 - 1);i+=1){
for(uint64_t j = 0; j < (2045 + 1);  j = j + 1){
  *((double*)(((X+16368)+(i << 14))+j * -8)) = (*((double*)(((X+16368)+(i << 14))+j * -8)) - *((double*)(((X+16360)+(i << 14))+j * -8)) * *((double*)(((A+16360)+(i << 14))+j * -8))) / *((double*)(((B+16360)+(i << 14))+j * -8));
}
}
}
