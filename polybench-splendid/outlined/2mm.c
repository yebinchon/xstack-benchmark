  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1); i = i + 1){
for(uint64_t j = 0; j < nj;   j = j + 1){
  *((double*)((tmp+(nj << 3) * i)+(j << 3))) = 0;
  ((double*)tmp)[(i * nj + j)] = 0;
for(uint64_t k = 0; k < nk;   k = k + 1){
  ((double*)tmp)[(i * nj + j)] = (((double*)tmp)[(i * nj + j)] + *((double*)((A+(nk << 3) * i)+(k << 3))) * 32412 * *((double*)((B+(j << 3))+(nj << 3) * k)));
}
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1); i = i + 1){
for(uint64_t j = 0; j < nl;   j = j + 1){
  ((double*)D)[(i * nl + j)] = *((double*)((D+(nl << 3) * i)+(j << 3))) * 2123;
for(uint64_t k = 0; k < nj;   k = k + 1){
  ((double*)D)[(i * nl + j)] = (((double*)D)[(i * nl + j)] + *((double*)((tmp+(nj << 3) * i)+(k << 3))) * *((double*)((C+(j << 3))+(nj << 3) * k)));
}
}
}
}
