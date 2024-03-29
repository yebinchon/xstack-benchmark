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
void _ZL6kerneliiPdS_S_S_S_(uint32_t, uint32_t, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void _ZL11print_arrayiiPdS_(uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t _ZL10num_blocksii(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void _Z8kernel_qiiPdS_S_S_S__OC_1(uint32_t, uint32_t, double*, double*, double*, double*, double*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z8kernel_siiPdS_S_S_S__OC_2(uint32_t, uint32_t, double*, double*, double*, double*, double*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
  int32_t m;
  int32_t n;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* s;
  uint8_t* q;
  uint8_t* p;
  uint8_t* r;
  int32_t call38;
  int32_t call53;

  m = atoi(argv[2]);
  n = atoi(argv[3]);
  dump_code = atoi(argv[1]);
  A = malloc(m * n * 8);
  s = malloc(n * 8);
  q = malloc(m * 8);
  p = malloc(n * 8);
  r = malloc(m * 8);
  _ZL10init_arrayiiPdS_S_(m, n, ((double*)A), ((double*)r), ((double*)p));
;
  _ZL6kerneliiPdS_S_S_S_(m, n, ((double*)A), ((double*)s), ((double*)q), ((double*)p), ((double*)r));
;
  if (dump_code == 1) {
_ZL11print_arrayiiPdS_(m, n, ((double*)s), ((double*)q));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)s)));
free(((uint8_t*)((double*)q)));
free(((uint8_t*)((double*)p)));
free(((uint8_t*)((double*)r)));
  return 0;
}


void _ZL10init_arrayiiPdS_S_(uint32_t nx, uint32_t ny, double* A, double* r, double* p) {
  int64_t i;
  int64_t j;

#pragma omp parallel
  {
#pragma omp for schedule(static) nowait
for(int64_t i = 0; i < ny;   i = i + 1){
  p[i] = ((double)(i) * 3.1415926535897931);
}
#pragma omp for schedule(static) nowait
for(int64_t i = 0; i < nx;   i = i + 1){
  r[i] = ((double)(i) * 3.1415926535897931);

for(int64_t j = 0; j < ny;   j = j + 1){
  A[(i * ny + j)] = (((double)(i) * (double)((j + 1))) / (double)(nx));
}
}
}
  return;
}


void _ZL6kerneliiPdS_S_S_S_(uint32_t m, uint32_t n, double* A, double* s, double* q, double* p, double* r) {
  struct l_struct_struct_OC_dim3 agg_2e_tmp;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp1;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp1_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp3;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp5;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp3_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp5_2e_coerce;    /* Address-exposed local */
  int32_t call;
  uint8_t* _1;
  uint8_t* _2;
  uint32_t i;
  uint32_t j;
  int32_t call4;
  uint8_t* _3;
  uint8_t* _4;

  call = _ZL10num_blocksii(n, 256);
  call4 = _ZL10num_blocksii(m, 256);
#pragma omp parallel
  {
#pragma omp for schedule(dynamic, 4)
for(int32_t i = 0; i < n;   i = i + 1){
_Z8kernel_qiiPdS_S_S_S__OC_1(m, n, A, s, q, p, r, i);
}
#pragma omp for schedule(dynamic, 4)
for(int32_t i = 0; i < m;   i = i + 1){
_Z8kernel_siiPdS_S_S_S__OC_2(m, n, A, s, q, p, r, i);
}
}
  return;
}


void _ZL11print_arrayiiPdS_(uint32_t nx, uint32_t ny, double* s, double* q) {
  int64_t i;
  int32_t call17;


for(int64_t i = 0; i < ny;   i = i + 1){
  uint32_t call = fprintf(stderr, _OC_str, s[i]);
  if (i % 20 == 0) {
  fprintf(stderr, _OC_str_OC_1);
  }
}

for(int64_t i = 0; i < nx;   i = i + 1){
  uint32_t call8 = fprintf(stderr, _OC_str, q[i]);
  if (i % 20 == 0) {
  fprintf(stderr, _OC_str_OC_1);
  }
}
  fprintf(stderr, _OC_str_OC_1);
}


uint32_t _ZL10num_blocksii(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}


void _Z8kernel_qiiPdS_S_S_S__OC_1(uint32_t m, uint32_t n, double* A, double* s, double* q, double* p, double* r, uint32_t i) {
  //int64_t i;
  int64_t j;
  double dot;

 // i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  //if (i < n) {
  q[i] = 0;
  dot = 0;
#pragma omp simd reduction(+:dot)
for(int64_t j = 0; j < m;   j = j + 1){
  dot = (dot + (A[(i * m + j)] * p[j]));
}
  q[i] = (q[i] + dot);
  //}
  return;
}


void _Z8kernel_siiPdS_S_S_S__OC_2(uint32_t m, uint32_t n, double* A, double* s, double* q, double* p, double* r, uint32_t j) {
  //int64_t j;
  int64_t i;
  double dot;

  //j = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  //if (j < m) {
  s[j] = 0;
  dot = 0;
#pragma omp simd reduction(+:dot)
for(int64_t i = 0; i < n;   i = i + 1){
  dot = (dot + (r[i] * A[(i * m + j)]));
}
  s[j] = dot;
  //}
  return;
}

