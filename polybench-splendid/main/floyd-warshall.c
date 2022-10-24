
int main(int argc, char ** argv) {
  uint64_t _call_2e_i = strtol(argv[1], ((uint8_t**)0), 10);
  uint8_t* path = malloc(128000000);
for(uint64_t i = 0; i < 4000;   i = i + 1){
for(uint64_t j = 0; j < 4000;   j = j + 1){
for(uint64_t k = 0; k < 4000;   k = k + 1){
  *((double*)((path+j * 32000)+(k << 3))) = llvm_select_f64(llvm_fcmp_olt(*((double*)((path+j * 32000)+(k << 3))), (*((double*)((path+(i << 3))+j * 32000)) + *((double*)((path+i * 32000)+(k << 3))))), *((double*)((path+j * 32000)+(k << 3))), (*((double*)((path+(i << 3))+j * 32000)) + *((double*)((path+i * 32000)+(k << 3)))));
}
}
}
  if (_call_2e_i == 1) {
for(uint64_t i = 0; i < 4000;   i = i + 1){
for(uint64_t j = 0; j < 4000;   j = j + 1){
  fprintf(stderr, (_OC_str), (((double*)path)+i * 4000)[j]);
  if ((j + i * 4000) % 20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(path);
  return 0;
}

