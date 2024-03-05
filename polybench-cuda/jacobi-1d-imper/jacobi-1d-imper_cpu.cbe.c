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
void _ZL10init_arrayiPdS_(uint32_t, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void _ZL6kerneliiPdS_(uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((noinline));
void _ZL11print_arrayiPd(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
uint32_t _ZL10num_blocksii(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaFree(uint8_t*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void _Z14kernel_stenciliPdS__OC_1(uint32_t, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z14kernel_stenciliPdS__OC_2(uint32_t, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
  int32_t n;
  int32_t tsteps;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* B;

  n = atoi(argv[3]);
  tsteps = atoi(argv[2]);
  dump_code = atoi(argv[1]);
  A = malloc(n * 8);
  B = malloc(n * 8);
  _ZL10init_arrayiPdS_(n, ((double*)A), ((double*)B));
;
  _ZL6kerneliiPdS_(tsteps, n, ((double*)A), ((double*)B));
;
  if (dump_code == 1) {
_ZL11print_arrayiPd(n, ((double*)A));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
  return 0;
}


void _ZL10init_arrayiPdS_(uint32_t n, double* A, double* B) {
  int64_t i;


for(int32_t i = 0; i < n;   i = i + 1){
  A[i] = ((double)(i) + 2) / (double)(n);
  B[i] = ((double)(i) + 3) / (double)(n);
}
  return;
}


void _ZL6kerneliiPdS_(uint32_t tsteps, uint32_t n, double* A, double* B) {
  struct l_struct_struct_OC_dim3 agg_2e_tmp;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp11;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp11_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp13;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp15;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp13_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp15_2e_coerce;    /* Address-exposed local */
  uint8_t* dev_A;
  uint8_t* dev_B;
  uint8_t* _1;
  uint8_t* _2;
  int32_t t;
  uint32_t j;
  uint32_t k;
  uint8_t* _3;

  dev_A = malloc(n * 8);
  dev_B = malloc(n * 8);
  memcpy(((uint8_t*)((double*)dev_A)), ((uint8_t*)A), n * 8);
  memcpy(((uint8_t*)((double*)dev_B)), ((uint8_t*)B), n * 8);

for(int32_t t = 1; t <= tsteps;   t = t + 1){
  uint32_t call10 = _ZL10num_blocksii(n, 256);
  agg_2e_tmp.field0 = call10;
  agg_2e_tmp.field1 = 1;
  agg_2e_tmp.field2 = 1;
  agg_2e_tmp11.field0 = 256;
  agg_2e_tmp11.field1 = 1;
  agg_2e_tmp11.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp_2e_coerce)), ((uint8_t*)(&agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp11_2e_coerce)), ((uint8_t*)(&agg_2e_tmp11)), 12);
#pragma omp target teams distribute parallel for map(to: dev_B[0:n * 8]) map(tofrom: dev_A[0:n * 8])
for(int32_t j = 0; j < call10;   j = j + 1){

for(int32_t k = 0; k < 256;   k = k + 1){
_Z14kernel_stenciliPdS__OC_1(n, ((double*)dev_A), ((double*)dev_B), call10, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
  uint32_t call14 = _ZL10num_blocksii(n, 256);
  agg_2e_tmp13.field0 = call14;
  agg_2e_tmp13.field1 = 1;
  agg_2e_tmp13.field2 = 1;
  agg_2e_tmp15.field0 = 256;
  agg_2e_tmp15.field1 = 1;
  agg_2e_tmp15.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp13_2e_coerce)), ((uint8_t*)(&agg_2e_tmp13)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp15_2e_coerce)), ((uint8_t*)(&agg_2e_tmp15)), 12);
#pragma omp target teams distribute parallel for map(to: dev_B[0:n * 8]) map(tofrom: dev_A[0:n * 8])
for(int32_t j = 0; j < call14;   j = j + 1){

for(int32_t k = 0; k < 256;   k = k + 1){
_Z14kernel_stenciliPdS__OC_2(n, ((double*)dev_B), ((double*)dev_A), call14, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
}
  memcpy(((uint8_t*)A), ((uint8_t*)((double*)dev_A)), n * 8);
free(((uint8_t*)((double*)dev_A)));
free(((uint8_t*)((double*)dev_B)));
}


void _ZL11print_arrayiPd(uint32_t n, double* A) {
  int64_t i;
  int32_t call3;


for(int32_t i = 0; i < n;   i = i + 1){
  uint32_t call = fprintf(stderr, (_OC_str), A[i]);
  if ((int)i % (int)20 == 0) {
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
  B[i] = ((A[(i - 1)] + A[i]) + A[(i + 1)]) / 3;
  }
  return;
}


void _Z14kernel_stenciliPdS__OC_2(uint32_t n, double* A, double* B, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int64_t i;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x + 1;
  if (i < (n - 1)) {
  B[i] = ((A[(i - 1)] + A[i]) + A[(i + 1)]) / 3;
  }
  return;
}

