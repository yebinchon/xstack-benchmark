//START OUTLINED
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t i = 0; i<=(4000 - 1);i+=1){
for(uint64_t j = 0; j < (3999 + 1);  j = j + 1){
  *((double*)((ex+i * 32000)+(j << 3))) = (double)(i) * (double)((j + 1)) / 4000;
  *((double*)((ey+i * 32000)+(j << 3))) = (double)(i) * (double)((j + 2)) / 4000;
  *((double*)((hz+i * 32000)+(j << 3))) = (double)(i) * (double)((j + 3)) / 4000;
}
}
}
//END OUTLINED
//START OUTLINED
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t i = 0; i<=(3999 - 1);i+=1){
for(uint64_t j = 0; j < (3999 + 1);  j = j + 1){
  *((double*)(((ey+32000)+i * 32000)+(j << 3))) = (*((double*)(((ey+32000)+i * 32000)+(j << 3))) - (*((double*)(((hz+32000)+i * 32000)+(j << 3))) - *((double*)((hz+i * 32000)+(j << 3)))) * 0.5);
}
}
}
//END OUTLINED
