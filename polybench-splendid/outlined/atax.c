  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(nx - 1);i+=1){
for(uint64_t j = 0; j < ny;  j = j + 1){
  *((double*)((_call6+(ny << 3) * i)+(j << 3))) = (double)(i) * (double)((j + 1)) / (double)(nx);
}
}
}
