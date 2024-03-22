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
void _ZL10init_arrayiPdS_(uint32_t, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void _ZL6kerneliiPdS_(uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((noinline));
void _ZL11print_arrayiPd(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t _ZL10num_blocksii(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void _Z14kernel_stenciliPdS__OC_1(uint32_t, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
static __forceinline uint32_t llvm_urem_u32(uint32_t a, uint32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  int32_t n;
  int32_t tsteps;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* B;
  int32_t call17;
  int32_t call23;

  n = atoi(argv[3]);
  tsteps = atoi(argv[2]);
  dump_code = atoi(argv[1]);
  A = malloc(n * 8);
  B = malloc(n * 8);
  _ZL10init_arrayiPdS_(n, ((double*)A), ((double*)B));
;
#pragma omp target data map(to: B[0:n * 8]) map(tofrom: A[0:n * 8])
{
  _ZL6kerneliiPdS_(tsteps, n, ((double*)A), ((double*)B));
;

}
  if (dump_code == 1) {
_ZL11print_arrayiPd(n, ((double*)A));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
  return 0;
}


void _ZL10init_arrayiPdS_(uint32_t n, double* A, double* B) {
  int64_t i;


for(int64_t i = 0; i < n;   i = i + 1){
  A[i] = (((double)(i) + 2) / (double)(n));
  B[i] = (((double)(i) + 3) / (double)(n));
}
  return;
}


void _ZL6kerneliiPdS_(uint32_t tsteps, uint32_t n, double* A, double* B) {
  struct l_struct_struct_OC_dim3 agg_2e_tmp;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp1;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp1_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp3;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp5;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp3_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp5_2e_coerce;    /* Address-exposed local */
  int32_t t;
  uint32_t j;
  uint32_t k;


for(int32_t t = 1; t <= tsteps;   t = t + 1){
  uint32_t call = _ZL10num_blocksii(n, 256);
  agg_2e_tmp.field0 = call;
  agg_2e_tmp.field1 = 1;
  agg_2e_tmp.field2 = 1;
  agg_2e_tmp1.field0 = 256;
  agg_2e_tmp1.field1 = 1;
  agg_2e_tmp1.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp_2e_coerce)), ((uint8_t*)(&agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp1_2e_coerce)), ((uint8_t*)(&agg_2e_tmp1)), 12);
#pragma omp target teams distribute

for(int32_t j = 0; j < call;   j = j + 1){
#pragma omp parallel for

for(int32_t k = 0; k < 256;   k = k + 1){
_Z14kernel_stenciliPdS__OC_1(n, A, B, call, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
  uint32_t call4 = _ZL10num_blocksii(n, 256);
  agg_2e_tmp3.field0 = call4;
  agg_2e_tmp3.field1 = 1;
  agg_2e_tmp3.field2 = 1;
  agg_2e_tmp5.field0 = 256;
  agg_2e_tmp5.field1 = 1;
  agg_2e_tmp5.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp3_2e_coerce)), ((uint8_t*)(&agg_2e_tmp3)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp5_2e_coerce)), ((uint8_t*)(&agg_2e_tmp5)), 12);
#pragma omp target teams distribute

for(int32_t j = 0; j < call4;   j = j + 1){
#pragma omp parallel for

for(int32_t k = 0; k < 256;   k = k + 1){
_Z14kernel_stenciliPdS__OC_1(n, B, A, call4, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
}
  return;
}


void _ZL11print_arrayiPd(uint32_t n, double* A) {
  int64_t i;
  int32_t call3;


for(int64_t i = 0; i < n;   i = i + 1){
  uint32_t call = fprintf(stderr, (_OC_str), A[i]);
  if (i % 20 == 0) {
  fprintf(stderr, (_OC_str_OC_1));
  }
}
  fprintf(stderr, (_OC_str_OC_1));
}


uint32_t _ZL10num_blocksii(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}


void _Z14kernel_stenciliPdS__OC_1(uint32_t n, double* A, double* B, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int64_t i;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x + 1;
  if (i < (n - 1)) {
  B[i] = (((A[(i - 1)] + A[i]) + A[(i + 1)]) / 3);
  }
  return;
}

