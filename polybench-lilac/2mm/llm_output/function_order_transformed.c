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
struct __FIXME__l_struct_struct_OC_dim3;
struct __FIXME__l_unnamed_1;

/* Function definitions */

/* Types Definitions */
struct __FIXME__l_array_1_uint8_t {
  uint8_t array[1];
};
struct __FIXME__l_array_20_uint8_t {
  uint8_t array[20];
};
struct __FIXME__l_struct_struct_OC_dim3 {
  uint32_t __FIXME__l_struct_struct_OC_dim3_field0;
  uint32_t __FIXME__l_struct_struct_OC_dim3_field1;
  uint32_t __FIXME__l_struct_struct_OC_dim3_field2;
};
struct __FIXME__l_unnamed_1 {
  uint64_t __FIXME__l_unnamed_1_field0;
  uint32_t __FIXME__l_unnamed_1_field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
int16_t num_blocks(int16_t, int16_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
void kernel_A_mul_B(uint32_t, uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_D_plus_tmp_mul_C(uint32_t, uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t __FIXME_GLOBAL___OC_str[8] = { "%0.2lf " };
uint8_t __FIXME_GLOBAL___OC_str_OC_1[2] = { "\n" };


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
int main(int argc, char ** argv) {
  int32_t dump_code;
  int64_t __FIXME__call2;
  int64_t __FIXME__call4;
  int64_t __FIXME__call7;
  int64_t __FIXME__call10;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;
  uint8_t* D;
  uint8_t* tmp;

// INSERT COMMENT IFELSE: main::entry
  dump_code = atoi(argv[1]);
  __FIXME__call2 = atoi(argv[2]);
  __FIXME__call4 = atoi(argv[3]);
  __FIXME__call7 = atoi(argv[4]);
  __FIXME__call10 = atoi(argv[5]);
  A = malloc(__FIXME__call2 * __FIXME__call7 * 8);
  B = malloc(__FIXME__call7 * __FIXME__call4 * 8);
  C = malloc(__FIXME__call10 * __FIXME__call4 * 8);
  D = malloc(__FIXME__call2 * __FIXME__call10 * 8);
  tmp = malloc(__FIXME__call2 * __FIXME__call4 * 8);
  init_array(__FIXME__call2, __FIXME__call4, __FIXME__call7, __FIXME__call10, ((double*)A), ((double*)B), ((double*)C), ((double*)D), ((double*)tmp));
;
  kernel(__FIXME__call2, __FIXME__call4, __FIXME__call7, __FIXME__call10, 32412, 2123, ((double*)tmp), ((double*)A), ((double*)B), ((double*)C), ((double*)D));
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(__FIXME__call2, __FIXME__call7, ((double*)D));
  }
free(((uint8_t*)((double*)tmp)));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)D)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double* A, double* B, double* C, double* D, double* tmp) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nk;   j = j + 1){
  A[(i * ni + j)] = (((double)(i) * (double)(j)) / (double)(ni));
}
}
// INSERT COMMENT LOOP: init_array::for.cond10
for(int64_t i = 0; i < nk;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  B[(i * nk + j)] = (((double)(i) * (double)((j + 1))) / (double)(nj));
}
}
// INSERT COMMENT LOOP: init_array::for.cond32
for(int64_t i = 0; i < nl;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  C[(i * nl + j)] = (((double)(i) * (double)((j + 3))) / (double)(nl));
}
}
// INSERT COMMENT LOOP: init_array::for.cond54
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  D[(i * ni + j)] = (((double)(i) * (double)((j + 2))) / (double)(nk));
}
}
// INSERT COMMENT LOOP: init_array::for.cond76
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  tmp[(i * ni + j)] = 0;
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
int16_t num_blocks(int16_t num, int16_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_A_mul_B
void kernel_A_mul_B(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int32_t j;
  int64_t k;
  double dot;

// INSERT COMMENT IFELSE: kernel_A_mul_B::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  j = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y + __FIXME__threadIdx_2e_y;
  if (i < ni) { // IFELSE MARKER: entry IF
  if (j < nj) { // IFELSE MARKER: land.lhs.true IF
  dot = 0;
for(int64_t k = 0; k < nk;   k = k + 1){
  dot = (dot + ((alpha * A[(i * nk + k)]) * B[(k * nj + j)]));
}
  tmp[(i * nj + j)] = dot;
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_D_plus_tmp_mul_C
void kernel_D_plus_tmp_mul_C(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int32_t l;
  double dot;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_D_plus_tmp_mul_C::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  l = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y + __FIXME__threadIdx_2e_y;
  if (i < ni) { // IFELSE MARKER: entry IF
  if (l < nl) { // IFELSE MARKER: land.lhs.true IF
  dot = (D[(i * nj + l)] * beta);
for(int64_t j = 0; j < nj;   j = j + 1){
  dot = (dot + (tmp[(i * nj + j)] * C[(j * nl + l)]));
}
  D[(i * nl + l)] = dot;
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D) {
  struct __FIXME__l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp7;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp7_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp20;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp21;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp20_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp21_2e_coerce;    /* Address-exposed local */
  uint32_t __FIXME__div;
  int32_t __FIXME__call;
  int32_t __FIXME__call5;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t __FIXME__call13;
  int32_t __FIXME__call18;

  __FIXME__div = (256 / 32);
  block.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__div;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = 32;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__call = num_blocks(ni, block.__FIXME__l_struct_struct_OC_dim3_field0);
  __FIXME__call5 = num_blocks(nj, block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call5;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp7)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp7_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp7)), 12);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call;   i = i + 1){
for(int32_t j = 0; j < __FIXME__call5;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_A_mul_B(ni, nj, nk, nl, alpha, beta, tmp, A, B, C, D, __FIXME__call, __FIXME__call5, 1, __FIXME__div, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  __FIXME__call13 = num_blocks(ni, block.__FIXME__l_struct_struct_OC_dim3_field0);
  __FIXME__call18 = num_blocks(nl, block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call13;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call18;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp20)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp21)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp20_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp20)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp21_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp21)), 12);
// INSERT COMMENT LOOP: kernel::header.07
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call13;   i = i + 1){
for(int32_t j = 0; j < __FIXME__call18;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_D_plus_tmp_mul_C(ni, nj, nk, nl, alpha, beta, tmp, A, B, C, D, __FIXME__call13, __FIXME__call18, 1, __FIXME__div, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t ni, uint32_t nl, double* D) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), D[(i * ni + j)]);
  if ((int)(i * ni + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
}
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
}
