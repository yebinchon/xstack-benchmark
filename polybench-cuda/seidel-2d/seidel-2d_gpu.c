/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
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
void _ZL10init_arrayiPd(uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void _ZL6kerneliiPd(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
void _ZL11print_arrayiPd(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t _ZL10num_blocksii(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void _Z14kernel_stenciliiPd_OC_1(uint32_t, uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t _OC_str[8] = { "%0.2lf " };
uint8_t _OC_str_OC_1[2] = { "\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
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
  int32_t n;
  int32_t tsteps;
  uint8_t* A;
  int32_t call14;
  int32_t call18;

  dump_code = atoi(argv[1]);
  n = atoi(argv[2]);
  tsteps = atoi(argv[3]);
  A = malloc(n * n * 8);
  _ZL10init_arrayiPd(n, ((double*)A));
;
#pragma omp target data map(tofrom: A[0:n * n * 8])
{
  _ZL6kerneliiPd(tsteps, n, ((double*)A));
;

}
  if (dump_code == 1) {
_ZL11print_arrayiPd(n, ((double*)A));
  }
free(((uint8_t*)((double*)A)));
  return 0;
}


void _ZL10init_arrayiPd(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;


for(int64_t i = 0; i < n;   i = i + 1){

for(int64_t j = 0; j < n;   j = j + 1){
  A[(i * n + j)] = ((((double)(i) * (double)((j + 2))) + 2) / (double)(n));
}
}
  return;
}


void _ZL6kerneliiPd(uint32_t tsteps, uint32_t n, double* A) {
  struct l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp3;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp3_2e_coerce;    /* Address-exposed local */
  int32_t t;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;


for(int32_t t = 1; t <= tsteps;   t = t + 1){
  block.field0 = 8;
  block.field1 = 32;
  block.field2 = 1;
  uint32_t call = _ZL10num_blocksii((n - 2), block.field0);
  uint32_t call2 = _ZL10num_blocksii((n - 2), block.field1);
  grid.field0 = call;
  grid.field1 = call2;
  grid.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp3)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp_2e_coerce)), ((uint8_t*)(&agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp3_2e_coerce)), ((uint8_t*)(&agg_2e_tmp3)), 12);
#pragma omp target teams distribute collapse(2)

for(int32_t j = 0; j < call;   j = j + 1){

for(int32_t k = 0; k < call2;   k = k + 1){
#pragma omp parallel for collapse(2)

for(int32_t l = 0; l < 8;   l = l + 1){

for(int32_t m = 0; m < 32;   m = m + 1){
_Z14kernel_stenciliiPd_OC_1(tsteps, n, A, call, call2, 1, 8, 32, 1, j, k, 0, l, m, 0);
}
}
}
}
}
  return;
}


void _ZL11print_arrayiPd(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;
  int32_t call11;


for(int64_t i = 0; i < n;   i = i + 1){

for(int64_t j = 0; j < n;   j = j + 1){
  uint32_t call = fprintf(stderr, (_OC_str), A[(i * n + j)]);
  if ((int)(i * n + j) % (int)20 == 0) {
  fprintf(stderr, (_OC_str_OC_1));
  }
}
}
  fprintf(stderr, (_OC_str_OC_1));
}


uint32_t _ZL10num_blocksii(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}


void _Z14kernel_stenciliiPd_OC_1(uint32_t tsteps, uint32_t n, double* A, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int32_t i;
  int32_t j;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x + 1;
  j = blockDim_2e_y * blockIdx_2e_y + threadIdx_2e_y + 1;
  if (i < (n - 1)) {
  if (j < (n - 1)) {
  A[(i * n + j)] = (((((((((A[(((i - 1) * n + j) - 1)] + A[((i - 1) * n + j)]) + A[(((i - 1) * n + j) + 1)]) + A[((i * n + j) - 1)]) + A[(i * n + j)]) + A[((i * n + j) + 1)]) + A[(((i + 1) * n + j) - 1)]) + A[((i + 1) * n + j)]) + A[(((i + 1) * n + j) + 1)]) / 9);
  }
  }
  return;
}

