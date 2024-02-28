/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#ifndef __cplusplus
typedef unsigned char bool;
#endif

#ifndef _MSC_VER
#define __forceinline __attribute__((always_inline)) inline
#endif

#if defined(__GNUC__)
#define  __ATTRIBUTELIST__(x) __attribute__(x)
#else
#define  __ATTRIBUTELIST__(x)  
#endif

#ifdef _MSC_VER  /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif



/* Global Declarations */

/* Types Declarations */
struct l_struct_struct_OC__IO_FILE;
struct l_struct_struct_OC_dim3;
struct l_unnamed_1;

/* Function definitions */

/* Types Definitions */
struct l_array_1_uint8_t {
  uint8_t array[1];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};
struct l_struct_struct_OC__IO_FILE {
  uint32_t field0;
  uint8_t* field1;
  uint8_t* field2;
  uint8_t* field3;
  uint8_t* field4;
  uint8_t* field5;
  uint8_t* field6;
  uint8_t* field7;
  uint8_t* field8;
  uint8_t* field9;
  uint8_t* field10;
  uint8_t* field11;
  void* field12;
  struct l_struct_struct_OC__IO_FILE* field13;
  uint32_t field14;
  uint32_t field15;
  uint64_t field16;
  uint16_t field17;
  uint8_t field18;
  uint8_t field19[1];
  uint8_t* field20;
  uint64_t field21;
  void* field22;
  void* field23;
  struct l_struct_struct_OC__IO_FILE* field24;
  uint8_t* field25;
  uint64_t field26;
  uint32_t field27;
  uint8_t field28[20];
};
struct l_struct_struct_OC_dim3 {
  uint32_t field0;
  uint32_t field1;
  uint32_t field2;
};
struct l_unnamed_1 {
  uint64_t field0;
  uint32_t field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int16_t _Z10num_blocksss(int16_t, int16_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(int, char **) __ATTRIBUTELIST__((noinline));
void _ZL10init_arrayiiiiPdS_S_S_S_S_S_(uint32_t, uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void _ZL6kerneliiiiddPdS_S_S_S_(uint32_t, uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void _ZL11print_arrayiiPd(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaFree(uint8_t*);
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void _Z14kernel_A_mul_BiiiiddPdS_S_S_S__OC_1(uint32_t, uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z23kernel_D_plus_tmp_mul_CiiiiddPdS_S_S_S__OC_2(uint32_t, uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
uint8_t _OC_str[8] = { "%0.2lf " };
uint8_t _OC_str_OC_1[2] = { "\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint32_t llvm_mul_u32(uint32_t a, uint32_t b) {
  uint32_t r = a * b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint32_t llvm_udiv_u32(uint32_t a, uint32_t b) {
  uint32_t r = a / b;
  return r;
}
static __forceinline uint32_t llvm_sdiv_u32(int32_t a, int32_t b) {
  uint32_t r = a / b;
  return r;
}
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

int16_t _Z10num_blocksss(int16_t num, int16_t factor) {
  return ((num + factor) - 1) / factor;
}


int main(int argc, char ** argv) {
  int32_t dump_code;
  int32_t ni;
  int32_t nj;
  int32_t nk;
  int32_t nl;
  uint8_t* alpha;
  uint8_t* beta;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;
  uint8_t* D;
  uint8_t* tmp;
  uint8_t* dev_A;
  uint8_t* dev_B;
  uint8_t* dev_C;
  uint8_t* dev_D;
  uint8_t* dev_tmp;
  uint8_t* dev_alpha;
  uint8_t* dev_beta;
  uint8_t* _1;
  uint8_t* _2;
  uint8_t* _3;
  uint8_t* _4;
  uint8_t* _5;
  uint8_t* _6;
  uint8_t* _7;
  uint8_t* _8;

  dump_code = atoi(argv[1]);
  ni = atoi(argv[2]);
  nj = atoi(argv[3]);
  nk = atoi(argv[4]);
  nl = atoi(argv[5]);
  alpha = malloc(8);
  beta = malloc(8);
  A = malloc(ni * nk * 8);
  B = malloc(nk * nj * 8);
  C = malloc(nl * nj * 8);
  D = malloc(ni * nl * 8);
  tmp = malloc(ni * nj * 8);
  _ZL10init_arrayiiiiPdS_S_S_S_S_S_(ni, nj, nk, nl, ((double*)alpha), ((double*)beta), ((double*)A), ((double*)B), ((double*)C), ((double*)D), ((double*)tmp));
;
  dev_A = malloc(ni * nk * 8);
  dev_B = malloc(nk * nj * 8);
  dev_C = malloc(nl * nj * 8);
  dev_D = malloc(ni * nl * 8);
  dev_tmp = malloc(ni * nj * 8);
  dev_alpha = malloc(8);
  dev_beta = malloc(8);
  _1 = memcpy(((uint8_t*)((double*)dev_A)), ((uint8_t*)((double*)A)), ni * nk * 8);
  _2 = memcpy(((uint8_t*)((double*)dev_B)), ((uint8_t*)((double*)B)), nk * nj * 8);
  _3 = memcpy(((uint8_t*)((double*)dev_C)), ((uint8_t*)((double*)C)), nl * nj * 8);
  _4 = memcpy(((uint8_t*)((double*)dev_D)), ((uint8_t*)((double*)D)), ni * nl * 8);
  _5 = memcpy(((uint8_t*)((double*)dev_tmp)), ((uint8_t*)((double*)tmp)), ni * nj * 8);
  _6 = memcpy(((uint8_t*)((double*)dev_alpha)), ((uint8_t*)((double*)alpha)), 8);
  _7 = memcpy(((uint8_t*)((double*)dev_beta)), ((uint8_t*)((double*)beta)), 8);
  _ZL6kerneliiiiddPdS_S_S_S_(ni, nj, nk, nl, *((double*)alpha), *((double*)beta), ((double*)dev_tmp), ((double*)dev_A), ((double*)dev_B), ((double*)dev_C), ((double*)dev_D));
;
  _8 = memcpy(((uint8_t*)((double*)D)), ((uint8_t*)((double*)dev_D)), ni * nl * 8);
  if (dump_code == 1) {
_ZL11print_arrayiiPd(ni, nk, ((double*)D));
  }
free(((uint8_t*)((double*)tmp)));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)D)));
free(((uint8_t*)((double*)dev_A)));
free(((uint8_t*)((double*)dev_B)));
free(((uint8_t*)((double*)dev_C)));
free(((uint8_t*)((double*)dev_D)));
free(((uint8_t*)((double*)dev_tmp)));
free(((uint8_t*)((double*)dev_alpha)));
free(((uint8_t*)((double*)dev_beta)));
  return 0;
}


void _ZL10init_arrayiiiiPdS_S_S_S_S_S_(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double* alpha, double* beta, double* A, double* B, double* C, double* D, double* tmp) {
  int32_t i;
  int32_t j;

  *alpha = 32412;
  *beta = 2123;

for(int32_t i = 0; i < ni;   i = i + 1){

for(int32_t j = 0; j < nk;   j = j + 1){
  A[(i * ni + j)] = (double)(i) * (double)(j) / (double)(ni);
}
}

for(int32_t i = 0; i < nk;   i = i + 1){

for(int32_t j = 0; j < nj;   j = j + 1){
  B[(i * nk + j)] = (double)(i) * (double)((j + 1)) / (double)(nj);
}
}

for(int32_t i = 0; i < nl;   i = i + 1){

for(int32_t j = 0; j < nj;   j = j + 1){
  C[(i * nl + j)] = (double)(i) * (double)((j + 3)) / (double)(nl);
}
}

for(int32_t i = 0; i < ni;   i = i + 1){

for(int32_t j = 0; j < nl;   j = j + 1){
  D[(i * ni + j)] = (double)(i) * (double)((j + 2)) / (double)(nk);
}
}

for(int32_t i = 0; i < ni;   i = i + 1){

for(int32_t j = 0; j < nj;   j = j + 1){
  tmp[(i * ni + j)] = 0;
}
}
  return;
}


void _ZL6kerneliiiiddPdS_S_S_S_(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D) {
  struct l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp7;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp7_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp20;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp21;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp20_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp21_2e_coerce;    /* Address-exposed local */
  uint32_t div;
  int32_t call;
  int32_t call5;
  uint8_t* _9;
  uint8_t* _10;
  uint8_t* _11;
  uint8_t* _12;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t call13;
  int32_t call18;
  uint8_t* _13;
  uint8_t* _14;
  uint8_t* _15;
  uint8_t* _16;

  div = (256 / 32);
  block.field0 = div;
  block.field1 = 32;
  block.field2 = 1;
  call = _Z10num_blocksss(ni, block.field0);
  call5 = _Z10num_blocksss(nj, block.field1);
  grid.field0 = call;
  grid.field1 = call5;
  grid.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp7)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp_2e_coerce)), ((uint8_t*)(&agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp7_2e_coerce)), ((uint8_t*)(&agg_2e_tmp7)), 12);
#pragma omp parallel for 
for(int32_t i = 0; i < call;   i = i + 1){

for(int32_t j = 0; j < call5;   j = j + 1){

for(int32_t k = 0; k < div;   k = k + 1){

for(int32_t l = 0; l < 32;   l = l + 1){
_Z14kernel_A_mul_BiiiiddPdS_S_S_S__OC_1(ni, nj, nk, nl, alpha, beta, tmp, A, B, C, D, call, call5, 1, div, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  call13 = _Z10num_blocksss(ni, block.field0);
  call18 = _Z10num_blocksss(nl, block.field1);
  grid.field0 = call13;
  grid.field1 = call18;
  grid.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp20)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp21)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp20_2e_coerce)), ((uint8_t*)(&agg_2e_tmp20)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp21_2e_coerce)), ((uint8_t*)(&agg_2e_tmp21)), 12);
#pragma omp parallel for 
for(int32_t i = 0; i < call13;   i = i + 1){

for(int32_t j = 0; j < call18;   j = j + 1){

for(int32_t k = 0; k < div;   k = k + 1){

for(int32_t l = 0; l < 32;   l = l + 1){
_Z23kernel_D_plus_tmp_mul_CiiiiddPdS_S_S_S__OC_2(ni, nj, nk, nl, alpha, beta, tmp, A, B, C, D, call13, call18, 1, div, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  return;
}


void _ZL11print_arrayiiPd(uint32_t ni, uint32_t nl, double* D) {
  int32_t i;
  int32_t j;
  int32_t call11;


for(int32_t i = 0; i < ni;   i = i + 1){

for(int32_t j = 0; j < nl;   j = j + 1){
  uint32_t call = fprintf(stderr, (_OC_str), D[(i * ni + j)]);
  if ((int)(i * ni + j) % (int)20 == 0) {
  fprintf(stderr, (_OC_str_OC_1));
  }
}
}
  fprintf(stderr, (_OC_str_OC_1));
}


void _Z14kernel_A_mul_BiiiiddPdS_S_S_S__OC_1(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int32_t i;
  int32_t j;
  int32_t k;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  j = blockDim_2e_y * blockIdx_2e_y + threadIdx_2e_y;
  if (i < ni) {
  if (j < nj) {

for(int32_t k = 0; k < nk;   k = k + 1){
  tmp[(i * nj + j)] = (tmp[(i * nj + j)] + alpha * A[(i * nk + k)] * B[(k * nj + j)]);
}
  }
  }
  return;
}


void _Z23kernel_D_plus_tmp_mul_CiiiiddPdS_S_S_S__OC_2(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int32_t i;
  int32_t l;
  int32_t j;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  l = blockDim_2e_y * blockIdx_2e_y + threadIdx_2e_y;
  if (i < ni) {
  if (l < nl) {
  D[(i * nj + l)] = D[(i * nj + l)] * beta;

for(int32_t j = 0; j < nj;   j = j + 1){
  D[(i * nl + l)] = (D[(i * nl + l)] + tmp[(i * nj + j)] * C[(j * nl + l)]);
}
  }
  }
  return;
}

