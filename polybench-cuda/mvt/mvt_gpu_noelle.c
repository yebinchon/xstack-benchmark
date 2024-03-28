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
int16_t _Z10num_blocksss(int16_t, int16_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z6kerneliPdS_S_S_S_(uint32_t, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void _ZL10init_arrayiPdS_S_S_S_(uint32_t, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void _ZL11print_arrayiPdS_(uint32_t, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaMalloc(uint8_t**, uint64_t);
void _Z9kernel_x1iPdS_S_S_S__OC_1(uint32_t, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z9kernel_x2iPdS_S_S_S__OC_2(uint32_t, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t _OC_str[7] = { "%0.2lf" };
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

int16_t _Z10num_blocksss(int16_t num, int16_t factor) {
  return ((num + factor) - 1) / factor;
}


void _Z6kerneliPdS_S_S_S_(uint32_t n, double* x1, double* x2, double* y_1, double* y_2, double* A) {
  struct l_struct_struct_OC_dim3 agg_2e_tmp;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp1;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp1_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp5;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp7;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp5_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp7_2e_coerce;    /* Address-exposed local */
  int32_t call;
  uint8_t* _1;
  uint8_t* _2;
  uint32_t i;
  uint32_t j;
  int32_t call9;
  uint8_t* _3;
  uint8_t* _4;

  agg_2e_tmp.field0 = 256;
  agg_2e_tmp.field1 = 1;
  agg_2e_tmp.field2 = 1;
  call = _Z10num_blocksss(n, 256);
  agg_2e_tmp1.field0 = call;
  agg_2e_tmp1.field1 = 1;
  agg_2e_tmp1.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp_2e_coerce)), ((uint8_t*)(&agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp1_2e_coerce)), ((uint8_t*)(&agg_2e_tmp1)), 12);
#pragma omp target teams distribute

for(int32_t i = 0; i < 256;   i = i + 1){
#pragma omp parallel for

for(int32_t j = 0; j < call;   j = j + 1){
_Z9kernel_x1iPdS_S_S_S__OC_1(n, x1, x2, y_1, y_2, A, 256, 1, 1, call, 1, 1, i, 0, 0, j, 0, 0);
}
}
  agg_2e_tmp5.field0 = 256;
  agg_2e_tmp5.field1 = 1;
  agg_2e_tmp5.field2 = 1;
  call9 = _Z10num_blocksss(n, 256);
  agg_2e_tmp7.field0 = call9;
  agg_2e_tmp7.field1 = 1;
  agg_2e_tmp7.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp5_2e_coerce)), ((uint8_t*)(&agg_2e_tmp5)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp7_2e_coerce)), ((uint8_t*)(&agg_2e_tmp7)), 12);
#pragma omp target teams distribute

for(int32_t i = 0; i < 256;   i = i + 1){
#pragma omp parallel for

for(int32_t j = 0; j < call9;   j = j + 1){
_Z9kernel_x2iPdS_S_S_S__OC_2(n, x1, x2, y_1, y_2, A, 256, 1, 1, call9, 1, 1, i, 0, 0, j, 0, 0);
}
}
  return;
}


int main(int argc, char ** argv) {
  int32_t dump_code;
  uint8_t* A;
  uint8_t* x1;
  uint8_t* x2;
  uint8_t* y_1;
  uint8_t* y_2;
  int32_t call31;
  int32_t call46;

  dump_code = atoi(argv[1]);
  A = malloc(1800000000);
  x1 = malloc(8 * 15000);
  x2 = malloc(8 * 15000);
  y_1 = malloc(8 * 15000);
  y_2 = malloc(8 * 15000);
  _ZL10init_arrayiPdS_S_S_S_(15000, ((double*)x1), ((double*)x2), ((double*)y_1), ((double*)y_2), ((double*)A));
;
#pragma omp target data map(to: A[0:1800000000], y_1[0:8 * 15000], y_2[0:8 * 15000]) map(tofrom: x1[0:8 * 15000], x2[0:8 * 15000])
{
  _Z6kerneliPdS_S_S_S_(15000, ((double*)x1), ((double*)x2), ((double*)y_1), ((double*)y_2), ((double*)A));
;

}
  if (dump_code == 1) {
_ZL11print_arrayiPdS_(15000, ((double*)x1), ((double*)x2));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)x1)));
free(((uint8_t*)((double*)x2)));
free(((uint8_t*)((double*)y_1)));
free(((uint8_t*)((double*)y_2)));
  return 0;
}


void _ZL10init_arrayiPdS_S_S_S_(uint32_t n, double* x1, double* x2, double* y_1, double* y_2, double* A) {
  int64_t i;
  uint64_t j;

#pragma omp parallel for 
for(int64_t i = 0; i < n;   i = i + 1){
  x1[i] = ((double)(i) / (double)(n));
  x2[i] = (((double)(i) + 1) / (double)(n));
  y_1[i] = (((double)(i) + 3) / (double)(n));
  y_2[i] = (((double)(i) + 4) / (double)(n));

for(int64_t j = 0; j < n;   j = j + 1){
  A[(i * n + j)] = (((double)(i) * (double)(j)) / (double)(n));
}
}
  return;
}


void _ZL11print_arrayiPdS_(uint32_t n, double* x1, double* x2) {
  int64_t i;


for(int64_t i = 0; i < n;   i = i + 1){
  uint32_t call = fprintf(stderr, _OC_str, x1[i]);
  uint32_t call3 = fprintf(stderr, _OC_str, x2[i]);
  if (i % 20 == 0) {
  fprintf(stderr, _OC_str_OC_1);
  }
}
  return;
}


void _Z9kernel_x1iPdS_S_S_S__OC_1(uint32_t n, double* x1, double* x2, double* y_1, double* y_2, double* A, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int64_t i;
  int64_t j;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  if (i < n) {

for(int64_t j = 0; j < n;   j = j + 1){
  x1[i] = (x1[i] + (A[(i * n + j)] * y_1[j]));
}
  }
  return;
}


void _Z9kernel_x2iPdS_S_S_S__OC_2(uint32_t n, double* x1, double* x2, double* y_1, double* y_2, double* A, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int64_t i;
  int64_t j;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  if (i < n) {

for(int64_t j = 0; j < n;   j = j + 1){
  x2[i] = (x2[i] + (A[(j * n + i)] * y_2[j]));
}
  }
  return;
}

