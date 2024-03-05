/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
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
int main(int, char **) __ATTRIBUTELIST__((noinline));
void _ZL10init_arrayiiPdS_S_S_(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void _ZL6kerneliiPdS_S_S_(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void _ZL11print_arrayiPd(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
uint32_t _ZL10num_blocksii(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaFree(uint8_t*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void _Z11kernel_betaiiddPdS__OC_1(uint32_t, uint32_t, double, double, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z14kernel_productiiddPdS__OC_2(uint32_t, uint32_t, double, double, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
static __forceinline uint32_t llvm_sdiv_u32(int32_t a, int32_t b) {
  uint32_t r = a / b;
  return r;
}
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  int32_t dump_code;
  int32_t ni;
  int32_t nj;
  uint8_t* A;
  uint8_t* C;
  uint8_t* alpha;
  uint8_t* beta;

  dump_code = atoi(argv[1]);
  ni = atoi(argv[2]);
  nj = atoi(argv[3]);
  A = malloc(ni * nj * 8);
  C = malloc(ni * ni * 8);
  alpha = malloc(8);
  beta = malloc(8);
  _ZL10init_arrayiiPdS_S_S_(ni, nj, ((double*)alpha), ((double*)beta), ((double*)C), ((double*)A));
;
  _ZL6kerneliiPdS_S_S_(ni, nj, ((double*)alpha), ((double*)beta), ((double*)C), ((double*)A));
;
  if (dump_code == 1) {
_ZL11print_arrayiPd(ni, ((double*)C));
  }
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)alpha)));
free(((uint8_t*)((double*)beta)));
  return 0;
}


void _ZL10init_arrayiiPdS_S_S_(uint32_t ni, uint32_t nj, double* alpha, double* beta, double* C, double* A) {
  int32_t i;
  int32_t j;

  *alpha = 32412;
  *beta = 2123;

for(int32_t i = 0; i < ni;   i = i + 1){

for(int32_t j = 0; j < nj;   j = j + 1){
  A[(i * nj + j)] = (double)(i) * (double)(j) / (double)(ni);
}
}

for(int32_t i = 0; i < ni;   i = i + 1){

for(int32_t j = 0; j < ni;   j = j + 1){
  C[(i * ni + j)] = (double)(i) * (double)(j) / (double)(ni);
}
}
  return;
}


void _ZL6kerneliiPdS_S_S_(uint32_t n, uint32_t m, double* alpha, double* beta, double* C, double* A) {
  struct l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp20;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp20_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp28;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp29;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp28_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp29_2e_coerce;    /* Address-exposed local */
  uint8_t* dev_A;
  uint8_t* dev_C;
  uint8_t* dev_alpha;
  uint8_t* dev_beta;
  uint8_t* _1;
  uint8_t* _2;
  uint8_t* _3;
  uint8_t* _4;
  int32_t call18;
  int32_t call19;
  uint8_t* _5;
  uint8_t* _6;
  uint8_t* _7;
  uint8_t* _8;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t call25;
  int32_t call27;
  uint8_t* _9;
  uint8_t* _10;
  uint8_t* _11;
  uint8_t* _12;
  uint8_t* _13;

  dev_A = malloc(n * m * 8);
  dev_C = malloc(n * n * 8);
  dev_alpha = malloc(8);
  dev_beta = malloc(8);
  memcpy(((uint8_t*)((double*)dev_A)), ((uint8_t*)A), n * m * 8);
  memcpy(((uint8_t*)((double*)dev_C)), ((uint8_t*)C), n * n * 8);
  memcpy(((uint8_t*)((double*)dev_alpha)), ((uint8_t*)alpha), 8);
  memcpy(((uint8_t*)((double*)dev_beta)), ((uint8_t*)beta), 8);
  block.field0 = 8;
  block.field1 = 32;
  block.field2 = 1;
  call18 = _ZL10num_blocksii(n, block.field0);
  call19 = _ZL10num_blocksii(n, block.field1);
  grid.field0 = call18;
  grid.field1 = call19;
  grid.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp20)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp_2e_coerce)), ((uint8_t*)(&agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp20_2e_coerce)), ((uint8_t*)(&agg_2e_tmp20)), 12);
#pragma omp target teams distribute parallel for map(to: dev_A[0:n * m * 8], dev_alpha[0:8], dev_beta[0:8]) map(tofrom: dev_C[0:n * n * 8])
for(int32_t i = 0; i < call18;   i = i + 1){

for(int32_t j = 0; j < call19;   j = j + 1){

for(int32_t k = 0; k < 8;   k = k + 1){

for(int32_t l = 0; l < 32;   l = l + 1){
_Z11kernel_betaiiddPdS__OC_1(n, m, *((double*)dev_alpha), *((double*)dev_beta), ((double*)dev_C), ((double*)dev_A), call18, call19, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  block.field0 = 8;
  block.field1 = 32;
  block.field2 = 1;
  call25 = _ZL10num_blocksii(n, block.field0);
  call27 = _ZL10num_blocksii(n, block.field1);
  grid.field0 = call25;
  grid.field1 = call27;
  grid.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp28)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp29)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp28_2e_coerce)), ((uint8_t*)(&agg_2e_tmp28)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp29_2e_coerce)), ((uint8_t*)(&agg_2e_tmp29)), 12);
#pragma omp target teams distribute parallel for map(to: dev_A[0:n * m * 8], dev_alpha[0:8], dev_beta[0:8]) map(tofrom: dev_C[0:n * n * 8])
for(int32_t i = 0; i < call25;   i = i + 1){

for(int32_t j = 0; j < call27;   j = j + 1){

for(int32_t k = 0; k < 8;   k = k + 1){

for(int32_t l = 0; l < 32;   l = l + 1){
_Z14kernel_productiiddPdS__OC_2(n, m, *((double*)dev_alpha), *((double*)dev_beta), ((double*)dev_C), ((double*)dev_A), call25, call27, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  memcpy(((uint8_t*)C), ((uint8_t*)((double*)dev_C)), n * n * 8);
free(((uint8_t*)((double*)dev_C)));
free(((uint8_t*)((double*)dev_A)));
free(((uint8_t*)((double*)dev_alpha)));
free(((uint8_t*)((double*)dev_beta)));
}


void _ZL11print_arrayiPd(uint32_t ni, double* C) {
  int32_t i;
  int32_t j;
  int32_t call11;


for(int32_t i = 0; i < ni;   i = i + 1){

for(int32_t j = 0; j < ni;   j = j + 1){
  uint32_t call = fprintf(stderr, (_OC_str), C[(i * ni + j)]);
  if ((int)(i * ni + j) % (int)20 == 0) {
  fprintf(stderr, (_OC_str_OC_1));
  }
}
}
  fprintf(stderr, (_OC_str_OC_1));
}


uint32_t _ZL10num_blocksii(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}


void _Z11kernel_betaiiddPdS__OC_1(uint32_t n, uint32_t m, double alpha, double beta, double* C, double* A, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int32_t i;
  int32_t j;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  j = blockDim_2e_y * blockIdx_2e_y + threadIdx_2e_y;
  if (i < n) {
  if (j <= i) {
  C[(i * n + j)] = C[(i * n + j)] * beta;
  }
  }
  return;
}


void _Z14kernel_productiiddPdS__OC_2(uint32_t n, uint32_t m, double alpha, double beta, double* C, double* A, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int32_t i;
  int32_t j;
  int32_t k;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  j = blockDim_2e_y * blockIdx_2e_y + threadIdx_2e_y;
  if (i < n) {
  if (j <= i) {

for(int32_t k = 0; k < m;   k = k + 1){
  C[(i * n + j)] = (C[(i * n + j)] + alpha * A[(i * m + k)] * A[(j * m + k)]);
}
  }
  }
  return;
}

