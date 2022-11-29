  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=3999; i = i + 1){
for(uint64_t j = 0; j < (3999 + 1);   j = j + 1){
  *((double*)((path+i * 32000)+(j << 3))) = (double)((i + 1)) * (double)((j + 1)) / 4000;
}
}
}
