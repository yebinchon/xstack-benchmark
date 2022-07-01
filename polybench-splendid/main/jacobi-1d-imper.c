int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t n = strtol(_argv[3], ((uint8_t**)0), 10);
  uint64_t tsteps = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t dump_code = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* A = malloc((n << 32) >> 29);
  uint8_t* B = malloc((n << 32) >> 29);
for(uint64_t i = 0; i < n;  i = i + 1){
  ((double*)A)[i] = ((double)(i) + 2) / (double)(n);
  ((double*)B)[i] = ((double)(i) + 3) / (double)(n);
}
  if (tsteps > 0) {
for(uint64_t i = 0; i < (tsteps << 32) >> 32;  i = i + 1){
//START OUTLINED
//END OUTLINED
//START OUTLINED
//END OUTLINED
}
}

  if (dump_code == 1) {
for(uint64_t i = 0; i < n;  i = i + 1){
  fprintf(stderr, (_OC_str), ((double*)A)[i]);
  if (i % 20 == 0) {
  fputc(10, stderr);
}

}
  fputc(10, stderr);
free(A);
free(B);
  return 0;
}

free(A);
free(B);
  return 0;
}

