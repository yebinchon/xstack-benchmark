/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define DOUBLE_SIZE_BYTES 8
#define KERNEL_ALPHA_DEFAULT 32412
#define KERNEL_BETA_DEFAULT 2123
#define ARGV_IDX_DUMP_CODE 1
#define ARGV_IDX_M 2
#define ARGV_IDX_N 3
#define DUMP_CODE_ENABLED 1
#define BLOCK_DIM_X 8
#define BLOCK_DIM_Y 32
#define BLOCK_DIM_Z 1
#define GRID_DIM_Z 1
#define DIM3_STRUCT_SIZE_BYTES 12
#define PRINTF_FMT_STR_LEN 8
#define NEWLINE_STR_LEN 2

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
  uint64_t x;
  uint32_t y;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, uint32_t, double, double, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_beta(uint32_t, uint32_t, double, double, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_product(uint32_t, uint32_t, double, double, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t double_2dp_fmt[PRINTF_FMT_STR_LEN] = { "%0.2lf " };
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
  int32_t m;
  int32_t n;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;

// INSERT COMMENT IFELSE: main::entry
  dump_code = atoi(argv[ARGV_IDX_DUMP_CODE]);
  m = atoi(argv[ARGV_IDX_M]);
  n = atoi(argv[ARGV_IDX_N]);
  A = malloc(m * n * DOUBLE_SIZE_BYTES);
  B = malloc(m * n * DOUBLE_SIZE_BYTES);
  C = malloc(m * m * DOUBLE_SIZE_BYTES);
  init_array(m, n, ((double*)C), ((double*)A), ((double*)B));
;
  kernel(m, n, KERNEL_ALPHA_DEFAULT, KERNEL_BETA_DEFAULT, ((double*)C), ((double*)A), ((double*)B));
;
  if (dump_code == DUMP_CODE_ENABLED) { // IFELSE MARKER: entry IF
print_array(m, ((double*)C));
  }
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t ni, uint32_t nj, double* C, double* A, double* B) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  int a_index = i * (int64_t)nj + j;
  double ab_prod = (double)i * (double)j;
  double a_value = ab_prod / (double)ni;
  A[(i * nj + j)] = a_value;
  int b_index = i * (int64_t)nj + j;
  double b_prod = (double)i * (double)j;
  double b_value = b_prod / (double)ni;
  B[(i * nj + j)] = b_value;
}
}
// INSERT COMMENT LOOP: init_array::for.cond19
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < ni;   j = j + 1){
  int c_index = i * (int64_t)ni + j;
  double c_prod = (double)i * (double)j;
  double c_value = c_prod / (double)ni;
  C[(i * ni + j)] = c_value;
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_beta
void kernel_beta(uint32_t n, uint32_t m, double alpha, double beta, double* C, double* A, double* B, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;

// INSERT COMMENT IFELSE: kernel_beta::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < n && j <= i) {
    C[(i * n + j)] = (C[(i * n + j)] * beta);
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_product
void kernel_product(uint32_t n, uint32_t m, double alpha, double beta, double* C, double* A, double* B, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;
  int64_t k;

// INSERT COMMENT IFELSE: kernel_product::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < n && j <= i) {
    for(int64_t k = 0; k < m;   k = k + 1){
    C[(i * n + j)] = (C[(i * n + j)] + (((A[(j * m + k)] * alpha) * B[(i * m + k)]) + ((B[(j * m + k)] * alpha) * A[(i * m + k)])));
    }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t n, uint32_t m, double alpha, double beta, double* C, double* A, double* B) {
  struct dim3 block;    /* Address-exposed local */
  struct dim3 grid;    /* Address-exposed local */
  struct dim3 grid_tmp;    /* Address-exposed local */
  struct dim3 block_tmp;    /* Address-exposed local */
  struct dim3_coerce grid_coerce;    /* Address-exposed local */
  struct dim3_coerce block_coerce;    /* Address-exposed local */
  struct dim3 grid2_tmp;    /* Address-exposed local */
  struct dim3 block2_tmp;    /* Address-exposed local */
  struct dim3_coerce grid2_coerce;    /* Address-exposed local */
  struct dim3_coerce block2_coerce;    /* Address-exposed local */
  int32_t grid_blocks_x;
  int32_t grid_blocks_y;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t grid_blocks_x2;
  int32_t grid_blocks_y2;

  block.x = BLOCK_DIM_X;
  block.y = BLOCK_DIM_Y;
  block.z = BLOCK_DIM_Z;
  grid_blocks_x = num_blocks(n, block.x);
  grid_blocks_y = num_blocks(n, block.y);
  grid.x = grid_blocks_x;
  grid.y = grid_blocks_y;
  grid.z = GRID_DIM_Z;
  memcpy(((uint8_t*)(&grid_tmp)), ((uint8_t*)(&grid)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&block_tmp)), ((uint8_t*)(&block)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&grid_coerce)), ((uint8_t*)(&grid_tmp)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&block_coerce)), ((uint8_t*)(&block_tmp)), DIM3_STRUCT_SIZE_BYTES);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < grid_blocks_x;   i = i + 1){
for(int32_t j = 0; j < grid_blocks_y;   j = j + 1){
for(int32_t k = 0; k < BLOCK_DIM_X;   k = k + 1){
for(int32_t l = 0; l < BLOCK_DIM_Y;   l = l + 1){
kernel_beta(n, m, alpha, beta, C, A, B, grid_blocks_x, grid_blocks_y, BLOCK_DIM_Z, BLOCK_DIM_X, BLOCK_DIM_Y, GRID_DIM_Z, i, j, 0, k, l, 0);
}
}
}
}
  block.x = BLOCK_DIM_X;
  block.y = 32;
  block.z = 1;
  grid_blocks_x2 = num_blocks(n, block.x);
  grid_blocks_y2 = num_blocks(n, block.y);
  grid.x = grid_blocks_x2;
  grid.y = grid_blocks_y2;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid2_tmp)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block2_tmp)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid2_coerce)), ((uint8_t*)(&grid2_tmp)), 12);
  memcpy(((uint8_t*)(&block2_coerce)), ((uint8_t*)(&block2_tmp)), 12);
// INSERT COMMENT LOOP: kernel::header.010
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < grid_blocks_x2;   i = i + 1){
for(int32_t j = 0; j < grid_blocks_y2;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_product(n, m, alpha, beta, C, A, B, grid_blocks_x2, grid_blocks_y2, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t ni, double* C) {
  int64_t i;
  uint64_t j;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < ni;   j = j + 1){
  fprintf(stderr, (double_2dp_fmt), C[(i * ni + j)]);
  if ((int)(i * ni + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (newline_str));
  }
}
}
  fprintf(stderr, (newline_str));
}
