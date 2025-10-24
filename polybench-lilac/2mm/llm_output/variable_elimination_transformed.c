/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define BYTES_PER_DOUBLE 8
#define DEFAULT_ALPHA 32412
#define DEFAULT_BETA 2123
#define DUMP_CODE_ENABLE_VALUE 1
#define INIT_B_J_OFFSET 1
#define INIT_C_J_OFFSET 3
#define INIT_D_J_OFFSET 2
#define GPU_BLOCK_THREADS_TOTAL 256
#define GPU_BLOCK_DIM_Y 32
#define PRINT_FORMAT_BUFFER_LEN 8
#define NEWLINE_STR_LEN 2
#define ARG_IDX_DUMP_CODE 1
#define ARG_IDX_NI 2
#define ARG_IDX_NJ 3
#define ARG_IDX_NK 4
#define ARG_IDX_NL 5

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
struct dim3;
struct dim3_coerce;

/* Function definitions */

/* Types Definitions */
struct uint8_array_1 {
  uint8_t array[1];
};
struct uint8_array_20 {
  uint8_t array[20];
};
struct dim3 {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct dim3_coerce {
  uint64_t v64;
  uint32_t v32;
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
uint8_t double_printf_format[PRINT_FORMAT_BUFFER_LEN] = { "%0.2lf " };
uint8_t newline_str[NEWLINE_STR_LEN] = { "\n" };


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
  int64_t ni;
  int64_t nj;
  int64_t nk;
  int64_t nl;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;
  uint8_t* D;
  uint8_t* tmp;

// INSERT COMMENT IFELSE: main::entry
  dump_code = atoi(argv[ARG_IDX_DUMP_CODE]);
  ni = atoi(argv[ARG_IDX_NI]);
  nj = atoi(argv[ARG_IDX_NJ]);
  nk = atoi(argv[ARG_IDX_NK]);
  nl = atoi(argv[ARG_IDX_NL]);
  A = malloc(ni * nk * BYTES_PER_DOUBLE);
  B = malloc(nk * nj * BYTES_PER_DOUBLE);
  C = malloc(nl * nj * BYTES_PER_DOUBLE);
  D = malloc(ni * nl * BYTES_PER_DOUBLE);
  tmp = malloc(ni * nj * BYTES_PER_DOUBLE);
  init_array(ni, nj, nk, nl, ((double*)A), ((double*)B), ((double*)C), ((double*)D), ((double*)tmp));
;
  kernel(ni, nj, nk, nl, DEFAULT_ALPHA, DEFAULT_BETA, ((double*)tmp), ((double*)A), ((double*)B), ((double*)C), ((double*)D));
;
  if (dump_code == DUMP_CODE_ENABLE_VALUE) { // IFELSE MARKER: entry IF
print_array(ni, nk, ((double*)D));
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
  int a_index = i * ni + j;
  double a_prod_ij = ((double)i) * ((double)j);
  double ni_double = (double)ni;
  double a_value = a_prod_ij / ni_double;
  A[(i * ni + j)] = a_value;
}
}
// INSERT COMMENT LOOP: init_array::for.cond10
for(int64_t i = 0; i < nk;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  int b_index = i * nk + j;
  int b_j_with_offset = j + INIT_B_J_OFFSET;
  double b_prod_i_joff = ((double)i) * ((double)b_j_with_offset);
  double nj_double = (double)nj;
  double b_value = b_prod_i_joff / nj_double;
  B[(i * nk + j)] = b_value;
}
}
// INSERT COMMENT LOOP: init_array::for.cond32
for(int64_t i = 0; i < nl;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  int c_index = i * nl + j;
  int c_j_with_offset = j + INIT_C_J_OFFSET;
  double c_prod_i_joff = ((double)i) * ((double)c_j_with_offset);
  double nl_double = (double)nl;
  double c_value = c_prod_i_joff / nl_double;
  C[(i * nl + j)] = c_value;
}
}
// INSERT COMMENT LOOP: init_array::for.cond54
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  int d_index = i * ni + j;
  int d_j_with_offset = j + INIT_D_J_OFFSET;
  double d_prod_i_joff = ((double)i) * ((double)d_j_with_offset);
  double nk_double = (double)nk;
  double d_value = d_prod_i_joff / nk_double;
  D[(i * ni + j)] = d_value;
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
void kernel_A_mul_B(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;
  int64_t k;
  double dot;

// INSERT COMMENT IFELSE: kernel_A_mul_B::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < ni && j < nj) {
    dot = 0;
    for(int64_t k = 0; k < nk;   k = k + 1){
    dot = (dot + ((alpha * A[(i * nk + k)]) * B[(k * nj + j)]));
    }
    tmp[(i * nj + j)] = dot;
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_D_plus_tmp_mul_C
void kernel_D_plus_tmp_mul_C(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t l;
  double dot;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_D_plus_tmp_mul_C::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  l = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < ni && l < nl) {
    dot = (D[(i * nj + l)] * beta);
    for(int64_t j = 0; j < nj;   j = j + 1){
    dot = (dot + (tmp[(i * nj + j)] * C[(j * nl + l)]));
    }
    D[(i * nl + l)] = dot;
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D) {
  struct dim3 block;    /* Address-exposed local */
  struct dim3 grid;    /* Address-exposed local */
  struct dim3 grid_copy;    /* Address-exposed local */
  struct dim3 block_copy;    /* Address-exposed local */
  struct dim3_coerce grid_copy_coerce;    /* Address-exposed local */
  struct dim3_coerce block_copy_coerce;    /* Address-exposed local */
  struct dim3 grid_copy2;    /* Address-exposed local */
  struct dim3 block_copy2;    /* Address-exposed local */
  struct dim3_coerce grid_copy2_coerce;    /* Address-exposed local */
  struct dim3_coerce block_copy2_coerce;    /* Address-exposed local */
  uint32_t block_dim_x;
  int32_t grid_x_blocks;
  int32_t grid_y_blocks;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t grid_x_blocks2;
  int32_t grid_y_blocks2;

  block_dim_x = (GPU_BLOCK_THREADS_TOTAL / GPU_BLOCK_DIM_Y);
  block.x = block_dim_x;
  block.y = 32;
  block.z = 1;
  grid_x_blocks = num_blocks(ni, block.x);
  grid_y_blocks = num_blocks(nj, block.y);
  grid.x = grid_x_blocks;
  grid.y = grid_y_blocks;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_copy)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_copy)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_copy_coerce)), ((uint8_t*)(&grid_copy)), 12);
  memcpy(((uint8_t*)(&block_copy_coerce)), ((uint8_t*)(&block_copy)), 12);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < grid_x_blocks;   i = i + 1){
for(int32_t j = 0; j < grid_y_blocks;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_A_mul_B(ni, nj, nk, nl, alpha, beta, tmp, A, B, C, D, grid_x_blocks, grid_y_blocks, 1, block_dim_x, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  grid_x_blocks2 = num_blocks(ni, block.x);
  grid_y_blocks2 = num_blocks(nl, block.y);
  grid.x = grid_x_blocks2;
  grid.y = grid_y_blocks2;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_copy2)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_copy2)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_copy2_coerce)), ((uint8_t*)(&grid_copy2)), 12);
  memcpy(((uint8_t*)(&block_copy2_coerce)), ((uint8_t*)(&block_copy2)), 12);
// INSERT COMMENT LOOP: kernel::header.07
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < grid_x_blocks2;   i = i + 1){
for(int32_t j = 0; j < grid_y_blocks2;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_D_plus_tmp_mul_C(ni, nj, nk, nl, alpha, beta, tmp, A, B, C, D, grid_x_blocks2, grid_y_blocks2, 1, block_dim_x, 32, 1, i, j, 0, k, l, 0);
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
  fprintf(stderr, (double_printf_format), D[(i * ni + j)]);
  if ((int)(i * ni + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (newline_str));
  }
}
}
  fprintf(stderr, (newline_str));
}
