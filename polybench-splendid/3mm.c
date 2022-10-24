
int main(int argc, char ** argv) {
  uint64_t dump_code = strtol(argv[1], ((uint8_t**)0), 10);
  uint64_t ni = strtol(argv[2], ((uint8_t**)0), 10);
  uint64_t nj = strtol(argv[3], ((uint8_t**)0), 10);
  uint64_t nk = strtol(argv[4], ((uint8_t**)0), 10);
  uint64_t nl = strtol(argv[5], ((uint8_t**)0), 10);
  uint64_t nm = strtol(argv[6], ((uint8_t**)0), 10);
  uint8_t* E = malloc(nj * (ni << 3));
  uint8_t* A = malloc(nk * (ni << 3));
  uint8_t* B = malloc(nk * (nj << 3));
  uint8_t* F = malloc(nl * (nj << 3));
  uint8_t* C = malloc(nm * (nj << 3));
  uint8_t* D = malloc((nl << 3) * nm);
  uint8_t* G = malloc(nl * (ni << 3));
for(uint64_t i = 0; i < ni;   i = i + 1){
for(uint64_t j = 0; j < nk;   j = j + 1){
  (((double*)A)+i * nk)[j] = (double)(i) * (double)(j) / (double)(ni);
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(nk - 1); i = i + 1){
for(uint64_t j = 0; j < nj;   j = j + 1){
  *((double*)((B+(nj << 3) * i)+(j << 3))) = (double)(i) * (double)((j + 1)) / nj;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(nj - 1); i = i + 1){
for(uint64_t j = 0; j < nm;   j = j + 1){
  *((double*)((C+(nm << 3) * i)+(j << 3))) = (double)(i) * (double)((j + 3)) / (double)(nl);
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(nm - 1); i = i + 1){
for(uint64_t j = 0; j < nl;   j = j + 1){
  *((double*)((D+(nl << 3) * i)+(j << 3))) = (double)(i) * (double)((j + 2)) / (double)(nk);
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1); i = i + 1){
for(uint64_t j = 0; j < nj;   j = j + 1){
  *((double*)((E+(nj << 3) * i)+(j << 3))) = 0;
  ((double*)E)[(i * nj + j)] = 0;
for(uint64_t k = 0; k < nk;   k = k + 1){
  ((double*)E)[(i * nj + j)] = (((double*)E)[(i * nj + j)] + *((double*)((A+(nk << 3) * i)+(k << 3))) * *((double*)((B+(j << 3))+(nj << 3) * k)));
}
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(nj - 1); i = i + 1){
for(uint64_t j = 0; j < nl;   j = j + 1){
  *((double*)((F+(nl << 3) * i)+(j << 3))) = 0;
  ((double*)F)[(i * nl + j)] = 0;
for(uint64_t k = 0; k < nm;   k = k + 1){
  ((double*)F)[(i * nl + j)] = (((double*)F)[(i * nl + j)] + *((double*)((C+(nm << 3) * i)+(k << 3))) * *((double*)((D+(j << 3))+(nl << 3) * k)));
}
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1); i = i + 1){
for(uint64_t j = 0; j < nl;   j = j + 1){
  *((double*)((G+(nl << 3) * i)+(j << 3))) = 0;
  ((double*)G)[(i * nl + j)] = 0;
for(uint64_t k = 0; k < nj;   k = k + 1){
  ((double*)G)[(i * nl + j)] = (((double*)G)[(i * nl + j)] + *((double*)((E+(nj << 3) * i)+(k << 3))) * *((double*)((F+(j << 3))+(nl << 3) * k)));
}
}
}
}
  if (dump_code == 1) {
for(uint64_t i = 0; i < ni;   i = i + 1){
for(uint64_t j = 0; j < nl;   j = j + 1){
  fprintf(stderr, (_OC_str), (((double*)G)+i * nl)[j]);
  if ((int)(i * ni + j) % (int)20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(E);
free(A);
free(B);
free(F);
free(C);
free(D);
free(G);
  return 0;
}

