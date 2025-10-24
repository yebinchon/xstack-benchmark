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
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_A_mul_B(uint32_t, uint32_t, uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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

// MAIN START
int main(int argc, char ** argv) {
  int32_t dump_code;
  int32_t ni;
  int32_t nj;
  int32_t nk;
  int32_t nl;
  int32_t nm;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;
  uint8_t* D;
  uint8_t* E;
  uint8_t* F;
  uint8_t* G;

// INSERT COMMENT IFELSE: main::entry
  dump_code = atoi(argv[1]);
  ni = atoi(argv[2]);
  nj = atoi(argv[3]);
  nk = atoi(argv[4]);
  nl = atoi(argv[5]);
  nm = atoi(argv[6]);
  A = malloc(ni * nk * 8);
  B = malloc(nk * nj * 8);
  C = malloc(nj * nm * 8);
  D = malloc(nm * nl * 8);
  E = malloc(ni * nj * 8);
  F = malloc(nj * nl * 8);
  G = malloc(ni * nl * 8);
  init_array(ni, nj, nk, nl, nm, ((double*)A), ((double*)B), ((double*)C), ((double*)D), ((double*)E), ((double*)F), ((double*)G));
;
  kernel(ni, nj, nk, nl, nm, ((double*)E), ((double*)A), ((double*)B), ((double*)F), ((double*)C), ((double*)D), ((double*)G));
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(ni, nl, ((double*)G));
  }
free(((uint8_t*)((double*)E)));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
free(((uint8_t*)((double*)F)));
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)D)));
free(((uint8_t*)((double*)G)));
  return 0;
}
// MAIN END


// FUNCTION ORDER ID 0 START
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, uint32_t nm, double* A, double* B, double* C, double* D, double* E, double* F, double* G) {
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
for(int64_t i = 0; i < nj;   i = i + 1){
for(int64_t j = 0; j < nm;   j = j + 1){
  C[(i * nj + j)] = (((double)(i) * (double)((j + 3))) / (double)(nl));
}
}
// INSERT COMMENT LOOP: init_array::for.cond54
for(int64_t i = 0; i < nm;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  D[(i * nm + j)] = (((double)(i) * (double)((j + 2))) / (double)(nk));
}
}
// INSERT COMMENT LOOP: init_array::for.cond76
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  E[(i * ni + j)] = 0;
}
}
// INSERT COMMENT LOOP: init_array::for.cond92
for(int64_t i = 0; i < nj;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  F[(i * nj + j)] = 0;
}
}
// INSERT COMMENT LOOP: init_array::for.cond108
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  G[(i * ni + j)] = 0;
}
}
  return;
}
// FUNCTION ORDER ID 0 END


// FUNCTION ORDER ID 1 START
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, uint32_t nm, double* E, double* A, double* B, double* F, double* C, double* D, double* G) {
  struct __FIXME__l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp2;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp2_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp9;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp10;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp9_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp10_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp20;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp21;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp20_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp21_2e_coerce;    /* Address-exposed local */
  uint32_t __FIXME__div;
  int32_t __FIXME__call;
  int32_t __FIXME__call1;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t __FIXME__call6;
  int32_t __FIXME__call8;
  int32_t __FIXME__call17;
  int32_t __FIXME__call19;

  __FIXME__div = (256 / 32);
  block.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__div;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = 32;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__call = num_blocks(ni, block.__FIXME__l_struct_struct_OC_dim3_field0);
  __FIXME__call1 = num_blocks(nj, block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call1;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp2)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp2_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp2)), 12);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call;   i = i + 1){
for(int32_t j = 0; j < __FIXME__call1;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_A_mul_B(ni, nj, nk, E, A, B, __FIXME__call, __FIXME__call1, 1, __FIXME__div, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  __FIXME__call6 = num_blocks(nj, block.__FIXME__l_struct_struct_OC_dim3_field0);
  __FIXME__call8 = num_blocks(nl, block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call6;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call8;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp9)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp10)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp9_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp9)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp10_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp10)), 12);
// INSERT COMMENT LOOP: kernel::header.010
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call6;   i = i + 1){
for(int32_t j = 0; j < __FIXME__call8;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_A_mul_B(nj, nl, nm, F, C, D, __FIXME__call6, __FIXME__call8, 1, __FIXME__div, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  __FIXME__call17 = num_blocks(ni, block.__FIXME__l_struct_struct_OC_dim3_field0);
  __FIXME__call19 = num_blocks(nl, block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call17;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call19;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp20)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp21)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp20_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp20)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp21_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp21)), 12);
// INSERT COMMENT LOOP: kernel::header.030
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call17;   i = i + 1){
for(int32_t j = 0; j < __FIXME__call19;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_A_mul_B(ni, nl, nj, G, E, F, __FIXME__call17, __FIXME__call19, 1, __FIXME__div, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  return;
}
// FUNCTION ORDER ID 1 END


// FUNCTION ORDER ID 2 START
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t ni, uint32_t nl, double* G) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), G[(i * ni + j)]);
  if ((int)(i * ni + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
}
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
}
// FUNCTION ORDER ID 2 END


// FUNCTION ORDER ID 3 START
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// FUNCTION ORDER ID 3 END


// FUNCTION ORDER ID 4 START
// INSERT COMMENT FUNCTION: kernel_A_mul_B
void kernel_A_mul_B(uint32_t ni, uint32_t nj, uint32_t nk, double* C, double* A, double* B, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
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
  dot = (dot + (A[(i * nk + k)] * B[(k * nj + j)]));
}
  C[(i * nj + j)] = dot;
  }
  }
  return;
}
// FUNCTION ORDER ID 4 END

