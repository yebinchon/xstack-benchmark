
int main(int argc, char ** argv) {
  uint64_t _call_2e_i = strtol(argv[1], ((uint8_t**)0), 10);
  uint8_t* X = malloc(33882912);
  uint8_t* A = malloc(33882912);
  uint8_t* B = malloc(33882912);
for(uint64_t i = 0; i < 50;   i = i + 1){
for(uint64_t j = 0; j < 2058;   j = j + 1){
  double __2e_phiops_2e_0 = *((double*)(B+j * 16464));
  double __2e_phiops73_2e_0 = *((double*)(X+j * 16464));
for(uint64_t k = 0; k < 2057;   k = k + 1){
  __2e_phiops73_2e_0 = (*((double*)(((X+8)+j * 16464)+(k << 3))) - __2e_phiops73_2e_0 * *((double*)(((A+8)+j * 16464)+(k << 3))) / __2e_phiops_2e_0);
  *((double*)(((X+8)+j * 16464)+(k << 3))) = __2e_phiops73_2e_0;
  __2e_phiops_2e_0 = (*((double*)(((B+8)+j * 16464)+(k << 3))) - *((double*)(((A+8)+j * 16464)+(k << 3))) * *((double*)(((A+8)+j * 16464)+(k << 3))) / __2e_phiops_2e_0);
  *((double*)(((B+8)+j * 16464)+(k << 3))) = __2e_phiops_2e_0;
}
}
for(uint64_t j = 0; j < 2058;   j = j + 1){
  *((double*)((X+16456)+j * 16464)) = *((double*)((X+16456)+j * 16464)) / *((double*)((B+16456)+j * 16464));
}
for(uint64_t j = 0; j < 2057;   j = j + 1){
for(uint64_t k = 0; k < 2058;   k = k + 1){
  *((double*)(((X+16464)+j * 16464)+(k << 3))) = (*((double*)(((X+16464)+j * 16464)+(k << 3))) - *((double*)((X+j * 16464)+(k << 3))) * *((double*)(((A+16464)+j * 16464)+(k << 3))) / *((double*)((B+j * 16464)+(k << 3))));
  *((double*)(((B+16464)+j * 16464)+(k << 3))) = (*((double*)(((B+16464)+j * 16464)+(k << 3))) - *((double*)(((A+16464)+j * 16464)+(k << 3))) * *((double*)(((A+16464)+j * 16464)+(k << 3))) / *((double*)((B+j * 16464)+(k << 3))));
}
}
for(uint64_t j = 0; j < 2058;   j = j + 1){
  *((double*)((X+33866448)+(j << 3))) = *((double*)((X+33866448)+(j << 3))) / *((double*)((B+33866448)+(j << 3)));
}
for(uint64_t j = 0; j < 2056;   j = j + 1){
for(uint64_t k = 0; k < 2058;   k = k + 1){
  *((double*)(((X+33849984)+j * -16464)+(k << 3))) = (*((double*)(((X+33849984)+j * -16464)+(k << 3))) - *((double*)(((X+33833520)+j * -16464)+(k << 3))) * *((double*)(((A+33833520)+j * -16464)+(k << 3)))) / *((double*)(((B+33849984)+j * -16464)+(k << 3)));
}
}
}
  if (_call_2e_i == 1) {
for(uint64_t i = 0; i < 2058;   i = i + 1){
for(uint64_t j = 0; j < 2058;   j = j + 1){
  fprintf(stderr, (_OC_str), (((double*)X)+i * 2058)[j]);
  if ((j + i * 2058) % 20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(X);
free(A);
free(B);
  return 0;
}

