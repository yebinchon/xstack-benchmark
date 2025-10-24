/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define FORMAT_SPEC_BUFSZ 8
#define NEWLINE_BUFSZ 2
#define ARG_IDX_DUMP_CODE 1
#define ARG_IDX_NI 2
#define ARG_IDX_NJ 3
#define ARG_IDX_NK 4
#define ARG_IDX_NL 5
#define ARG_IDX_NM 6
#define BYTES_PER_DOUBLE 8
#define DUMP_CODE_ENABLED 1
#define INIT_B_J_OFFSET 1
#define INIT_C_J_OFFSET 3
#define INIT_D_J_OFFSET 2
#define TOTAL_THREADS_PER_BLOCK 256
#define BLOCK_DIM_Y 32
#define BLOCK_DIM_X 8
#define DIM3_STRUCT_BYTES 12
#define GRID_DIM_Z 1
#define BLOCK_DIM_Z 1
#define PRINT_ELEMS_PER_LINE 20

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
uint8_t __FIXME_GLOBAL___OC_str[FORMAT_SPEC_BUFSZ] = { "%0.2lf " };
uint8_t __FIXME_GLOBAL___OC_str_OC_1[NEWLINE_BUFSZ] = { "\n" };


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
  dump_code = atoi(argv[ARG_IDX_DUMP_CODE]);
  ni = atoi(argv[ARG_IDX_NI]);
  nj = atoi(argv[ARG_IDX_NJ]);
  nk = atoi(argv[ARG_IDX_NK]);
  nl = atoi(argv[ARG_IDX_NL]);
  nm = atoi(argv[ARG_IDX_NM]);
  A = malloc(ni * nk * BYTES_PER_DOUBLE);
  B = malloc(nk * nj * BYTES_PER_DOUBLE);
  C = malloc(nj * nm * BYTES_PER_DOUBLE);
  D = malloc(nm * nl * BYTES_PER_DOUBLE);
  E = malloc(ni * nj * BYTES_PER_DOUBLE);
  F = malloc(nj * nl * BYTES_PER_DOUBLE);
  G = malloc(ni * nl * BYTES_PER_DOUBLE);
  init_array(ni, nj, nk, nl, nm, ((double*)A), ((double*)B), ((double*)C), ((double*)D), ((double*)E), ((double*)F), ((double*)G));
;
  kernel(ni, nj, nk, nl, nm, ((double*)E), ((double*)A), ((double*)B), ((double*)F), ((double*)C), ((double*)D), ((double*)G));
;
  if (dump_code == DUMP_CODE_ENABLED) { // IFELSE MARKER: entry IF
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
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, uint32_t nm, double* A, double* B, double* C, double* D, double* E, double* F, double* G) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nk;   j = j + 1){
  __auto_type __FIXME__tmp1 = i * ni + j;
  __auto_type __FIXME__tmp2 = (double)i;
  __auto_type __FIXME__tmp3 = (double)j;
  __auto_type __FIXME__tmp4 = (double)ni;
  __auto_type __FIXME__tmp5 = __FIXME__tmp2 * __FIXME__tmp3;
  __auto_type __FIXME__tmp6 = __FIXME__tmp5 / __FIXME__tmp4;
  A[(i * ni + j)] = __FIXME__tmp6;
}
}
// INSERT COMMENT LOOP: init_array::for.cond10
for(int64_t i = 0; i < nk;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  __auto_type __FIXME__tmp7 = i * nk + j;
  __auto_type __FIXME__tmp8 = j + INIT_B_J_OFFSET;
  __auto_type __FIXME__tmp9 = (double)i;
  __auto_type __FIXME__tmp10 = (double)__FIXME__tmp8;
  __auto_type __FIXME__tmp11 = (double)nj;
  __auto_type __FIXME__tmp12 = __FIXME__tmp9 * __FIXME__tmp10;
  __auto_type __FIXME__tmp13 = __FIXME__tmp12 / __FIXME__tmp11;
  B[(i * nk + j)] = __FIXME__tmp13;
}
}
// INSERT COMMENT LOOP: init_array::for.cond32
for(int64_t i = 0; i < nj;   i = i + 1){
for(int64_t j = 0; j < nm;   j = j + 1){
  __auto_type __FIXME__tmp14 = i * nj + j;
  __auto_type __FIXME__tmp15 = j + INIT_C_J_OFFSET;
  __auto_type __FIXME__tmp16 = (double)i;
  __auto_type __FIXME__tmp17 = (double)__FIXME__tmp15;
  __auto_type __FIXME__tmp18 = (double)nl;
  __auto_type __FIXME__tmp19 = __FIXME__tmp16 * __FIXME__tmp17;
  __auto_type __FIXME__tmp20 = __FIXME__tmp19 / __FIXME__tmp18;
  C[(i * nj + j)] = __FIXME__tmp20;
}
}
// INSERT COMMENT LOOP: init_array::for.cond54
for(int64_t i = 0; i < nm;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  __auto_type __FIXME__tmp21 = i * nm + j;
  __auto_type __FIXME__tmp22 = j + INIT_D_J_OFFSET;
  __auto_type __FIXME__tmp23 = (double)i;
  __auto_type __FIXME__tmp24 = (double)__FIXME__tmp22;
  __auto_type __FIXME__tmp25 = (double)nk;
  __auto_type __FIXME__tmp26 = __FIXME__tmp23 * __FIXME__tmp24;
  __auto_type __FIXME__tmp27 = __FIXME__tmp26 / __FIXME__tmp25;
  D[(i * nm + j)] = __FIXME__tmp27;
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
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_A_mul_B
void kernel_A_mul_B(uint32_t ni, uint32_t nj, uint32_t nk, double* C, double* A, double* B, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int32_t j;
  int64_t k;
  double dot;

// INSERT COMMENT IFELSE: kernel_A_mul_B::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  j = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y + __FIXME__threadIdx_2e_y;
  if (i < ni && j < nj) {
dot = 0;
for(int64_t k = 0; k < nk;   k = k + 1){
dot = (dot + (A[(i * nk + k)] * B[(k * nj + j)]));
}
C[(i * nj + j)] = dot;
  }
  return;
}
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

  __FIXME__div = (TOTAL_THREADS_PER_BLOCK / BLOCK_DIM_Y);
  block.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__div;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = BLOCK_DIM_Y;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = BLOCK_DIM_Z;
  __FIXME__call = num_blocks(ni, block.__FIXME__l_struct_struct_OC_dim3_field0);
  __FIXME__call1 = num_blocks(nj, block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call1;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = GRID_DIM_Z;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp)), ((uint8_t*)(&grid)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp2)), ((uint8_t*)(&block)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp2_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp2)), DIM3_STRUCT_BYTES);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call;   i = i + 1){
for(int32_t j = 0; j < __FIXME__call1;   j = j + 1){
for(int32_t k = 0; k < BLOCK_DIM_X;   k = k + 1){
for(int32_t l = 0; l < BLOCK_DIM_Y;   l = l + 1){
kernel_A_mul_B(ni, nj, nk, E, A, B, __FIXME__call, __FIXME__call1, GRID_DIM_Z, __FIXME__div, BLOCK_DIM_Y, BLOCK_DIM_Z, i, j, 0, k, l, 0);
}
}
}
}
  __FIXME__call6 = num_blocks(nj, block.__FIXME__l_struct_struct_OC_dim3_field0);
  __FIXME__call8 = num_blocks(nl, block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call6;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call8;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp9)), ((uint8_t*)(&grid)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp10)), ((uint8_t*)(&block)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp9_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp9)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp10_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp10)), DIM3_STRUCT_BYTES);
// INSERT COMMENT LOOP: kernel::header.010
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call6;   i = i + 1){
for(int32_t j = 0; j < __FIXME__call8;   j = j + 1){
for(int32_t k = 0; k < BLOCK_DIM_X;   k = k + 1){
for(int32_t l = 0; l < BLOCK_DIM_Y;   l = l + 1){
kernel_A_mul_B(nj, nl, nm, F, C, D, __FIXME__call6, __FIXME__call8, GRID_DIM_Z, __FIXME__div, BLOCK_DIM_Y, BLOCK_DIM_Z, i, j, 0, k, l, 0);
}
}
}
}
  __FIXME__call17 = num_blocks(ni, block.__FIXME__l_struct_struct_OC_dim3_field0);
  __FIXME__call19 = num_blocks(nl, block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call17;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call19;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp20)), ((uint8_t*)(&grid)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp21)), ((uint8_t*)(&block)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp20_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp20)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp21_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp21)), DIM3_STRUCT_BYTES);
// INSERT COMMENT LOOP: kernel::header.030
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call17;   i = i + 1){
for(int32_t j = 0; j < __FIXME__call19;   j = j + 1){
for(int32_t k = 0; k < BLOCK_DIM_X;   k = k + 1){
for(int32_t l = 0; l < BLOCK_DIM_Y;   l = l + 1){
kernel_A_mul_B(ni, nl, nj, G, E, F, __FIXME__call17, __FIXME__call19, GRID_DIM_Z, __FIXME__div, BLOCK_DIM_Y, BLOCK_DIM_Z, i, j, 0, k, l, 0);
}
}
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t ni, uint32_t nl, double* G) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), G[(i * ni + j)]);
  if ((int)(i * ni + j) % (int)PRINT_ELEMS_PER_LINE == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
}
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
}
