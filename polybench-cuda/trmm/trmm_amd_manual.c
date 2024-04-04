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
void _ZL10init_arrayiiPdS_S_(uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void _ZL6kerneliidPdS_(uint32_t, uint32_t, double, double*, double*) __ATTRIBUTELIST__((noinline));
void _ZL11print_arrayiiPd(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t _ZL10num_blocksii(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void _Z15kernel_contractiidPdS__OC_1(uint32_t, uint32_t, double, double*, double*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z12kernel_alphaiidPdS__OC_2(uint32_t, uint32_t, double, double*, double*, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
  double alpha;    /* Address-exposed local */
  int32_t n;
  int32_t m;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* B;
  int32_t call22;
  int32_t call30;

  n = atoi(argv[2]);
  m = atoi(argv[3]);
  dump_code = atoi(argv[1]);
  A = malloc(n * m * 8);
  B = malloc(m * n * 8);
  _ZL10init_arrayiiPdS_S_(n, m, (&alpha), ((double*)A), ((double*)B));
;
#pragma omp target data map(to: A[0:n * m * 8]) map(tofrom: B[0:m * n * 8])
{
  _ZL6kerneliidPdS_(n, m, alpha, ((double*)A), ((double*)B));
;

}
  if (dump_code == 1) {
_ZL11print_arrayiiPd(m, n, ((double*)B));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
  return 0;
}


void _ZL10init_arrayiiPdS_S_(uint32_t n, uint32_t m, double* alpha, double* A, double* B) {
  int64_t i;
  int64_t j;
  uint32_t j_2e_0;

  *alpha = 32412;

for(int64_t i = 0; i < n;   ++i){

for(int64_t j = 0; j < m;   ++j){
  A[(i * m + j)] = (((double)(i) * (double)(j)) / (double)(m));
  B[(j * n + j)] = (((double)(i) * (double)(j)) / (double)(n));
}
}
  return;
}


void _ZL6kerneliidPdS_(uint32_t n, uint32_t m, double alpha, double* B, double* A) {
  struct l_struct_struct_OC_dim3 agg_2e_tmp;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp1;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp1_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  int32_t call;
  int32_t call3;
  int32_t call4;

#pragma omp target teams distribute parallel for thread_limit(512)

for(int32_t i = 0; i < n;   ++i){
//#pragma omp parallel for

_Z15kernel_contractiidPdS__OC_1(n, m, alpha, B, A, i);
}

#pragma omp target teams distribute parallel for collapse(2) thread_limit(512)

for(int32_t i = 0; i < m;   ++i){

for(int32_t j = 0; j < n;   ++j){

_Z12kernel_alphaiidPdS__OC_2(n, m, alpha, B, A, i, j);
}
}
  return;
}


void _ZL11print_arrayiiPd(uint32_t m, uint32_t n, double* B) {
  int64_t i;
  int64_t j;
  int32_t call11;


for(int64_t i = 0; i < m;   ++i){

for(int64_t j = 0; j < n;   ++j){
  uint32_t call = fprintf(stderr, _OC_str, B[(i * n + j)]);
  if ((int)(i * n + j) % (int)20 == 0) {
  fprintf(stderr, _OC_str_OC_1);
  }
}
}
  fprintf(stderr, _OC_str_OC_1);
}


uint32_t _ZL10num_blocksii(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}


void _Z15kernel_contractiidPdS__OC_1(uint32_t n, uint32_t m, double alpha, double* B, double* A, uint32_t j) {
  //int32_t j;
  int64_t i;
  uint32_t indvars_2e_iv;
  uint64_t k;

  //j = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  //if (j < n) {

for(int64_t i = 0; i < m;   ++i){

for(int64_t k = i; k < m;   ++k){
  B[(i * n + j)] = (B[(i * n + j)] + (A[(k * m + i)] * B[(k * n + j)]));
}
}
  //}
  return;
}


void _Z12kernel_alphaiidPdS__OC_2(uint32_t n, uint32_t m, double alpha, double* B, double* A, uint32_t i, uint32_t j) {
  //int32_t i;
  //int32_t j;

  //i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  //j = blockDim_2e_y * blockIdx_2e_y + threadIdx_2e_y;
  //if (i < m) {
  //if (j < n) {
  B[(i * n + j)] = (B[(i * n + j)] * alpha);
  //}
  //}
  return;
}

