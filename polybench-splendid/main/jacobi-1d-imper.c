
void kernel_jacobi_1d_imper(uint32_t _tsteps, uint32_t _n, double* _A, double* _B) {
for(uint64_t i = 0; i < _tsteps;   i = i + 1){
}
  return;
}


int main(int argc, char ** argv) {
  uint64_t dump_code = strtol(argv[1], ((uint8_t**)0), 10);
  double* A = malloc(800000000);
  double* B = malloc(800000000);
for(uint64_t i = 0; i < 100000000;   i = i + 1){
  ((double*)A)[i] = ((double)(i) + 2) / 1.0E+8;
  ((double*)B)[i] = ((double)(i) + 3) / 1.0E+8;
}
for(uint64_t i = 0; i < 100;   i = i + 1){
}
  if (dump_code == 1) {
for(uint64_t i = 0; i < 100000000;   i = i + 1){
  fprintf(stderr, (_OC_str), ((double*)A)[i]);
  if (i % 20 == 0) {
  fputc(10, stderr);
}

}
  fputc(10, stderr);
}

free(A);
free(B);
  return 0;
}

