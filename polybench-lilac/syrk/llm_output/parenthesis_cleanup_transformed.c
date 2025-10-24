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
#define BLOCK_DIM_X 8
#define BLOCK_DIM_Y 32
#define BLOCK_DIM_Z 1
#define GRID_DIM_Z 1
#define DIM3_STRUCT_SIZE_BYTES 12
#define PRINTF_FMT_STR_SIZE 8
#define NEWLINE_STR_SIZE 2
#define DUMP_CODE_ENABLED_VALUE 1

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
struct Dim3;
struct Dim3Coerce;

/* Function definitions */

/* Types Definitions */
struct UInt8Array1 {
  uint8_t array[1];
};
struct UInt8Array20 {
  uint8_t array[20];
};
struct Dim3 {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct Dim3Coerce {
  uint64_t u64;
  uint32_t u32;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, uint32_t, double, double, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_beta(uint32_t, uint32_t, double, double, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_product(uint32_t, uint32_t, double, double, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t print_fmt_double_2dp_space[PRINTF_FMT_STR_SIZE] = { "%0.2lf " };
uint8_t newline_str[NEWLINE_STR_SIZE] = { "\n" };


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
  uint8_t* C;

// INSERT COMMENT IFELSE: main::entry
  dump_code = atoi(argv[1]);
  m = atoi(argv[2]);
  n = atoi(argv[3]);
  A = malloc(m * n * BYTES_PER_DOUBLE);
  C = malloc(m * m * BYTES_PER_DOUBLE);
  init_array(m, n, (double*)C, (double*)A);
;
  kernel(m, n, DEFAULT_ALPHA, DEFAULT_BETA, (double*)C, (double*)A);
;
  if (dump_code == DUMP_CODE_ENABLED_VALUE) { // IFELSE MARKER: entry IF
print_array(m, (double*)C);
  }
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)A)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t ni, uint32_t nj, double* C, double* A) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  int a_index = i * nj + j;
  double ij_product = (double)i * (double)j;
  double ni_as_double = (double)ni;
  double a_value = ij_product / ni_as_double;
  A[(i * nj + j)] = a_value;
}
}
// INSERT COMMENT LOOP: init_array::for.cond10
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < ni;   j = j + 1){
  int c_index = i * ni + j;
  double ij_product_c = (double)i * (double)j;
  double ni_as_double_c = (double)ni;
  double c_value = ij_product_c / ni_as_double_c;
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
void kernel_beta(uint32_t n, uint32_t m, double alpha, double beta, double* C, double* A, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;
  int32_t j;

// INSERT COMMENT IFELSE: kernel_beta::entry
  i = block_dim_x * block_idx_x + thread_idx_x;
  j = block_dim_y * block_idx_y + thread_idx_y;
  if (i < n && j <= i) {
    C[(i * n + j)] = (C[(i * n + j)] * beta);
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_product
void kernel_product(uint32_t n, uint32_t m, double alpha, double beta, double* C, double* A, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;
  int32_t j;
  int64_t k;

// INSERT COMMENT IFELSE: kernel_product::entry
  i = block_dim_x * block_idx_x + thread_idx_x;
  j = block_dim_y * block_idx_y + thread_idx_y;
  if (i < n && j <= i) {
    for(int64_t k = 0; k < m;   k = k + 1){
    C[(i * n + j)] = (C[(i * n + j)] + (alpha * A[(i * m + k)]) * A[(j * m + k)]);
    }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t n, uint32_t m, double alpha, double beta, double* C, double* A) {
  struct Dim3 block;    /* Address-exposed local */
  struct Dim3 grid;    /* Address-exposed local */
  struct Dim3 grid_copy;    /* Address-exposed local */
  struct Dim3 block_copy;    /* Address-exposed local */
  struct Dim3Coerce grid_coerce;    /* Address-exposed local */
  struct Dim3Coerce block_coerce;    /* Address-exposed local */
  struct Dim3 grid_copy2;    /* Address-exposed local */
  struct Dim3 block_copy2;    /* Address-exposed local */
  struct Dim3Coerce grid_coerce2;    /* Address-exposed local */
  struct Dim3Coerce block_coerce2;    /* Address-exposed local */
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
  memcpy(((uint8_t*)(&grid_copy)), ((uint8_t*)(&grid)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&block_copy)), ((uint8_t*)(&block)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&grid_coerce)), ((uint8_t*)(&grid_copy)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&block_coerce)), ((uint8_t*)(&block_copy)), DIM3_STRUCT_SIZE_BYTES);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < grid_blocks_x;   i = i + 1){
for(int32_t j = 0; j < grid_blocks_y;   j = j + 1){
for(int32_t k = 0; k < BLOCK_DIM_X;   k = k + 1){
for(int32_t l = 0; l < BLOCK_DIM_Y;   l = l + 1){
kernel_beta(m, n, alpha, beta, C, A, grid_blocks_x, grid_blocks_y, BLOCK_DIM_Z, BLOCK_DIM_X, BLOCK_DIM_Y, GRID_DIM_Z, i, j, 0, k, l, 0);
}
}
}
}
  block.x = BLOCK_DIM_X;
  block.y = BLOCK_DIM_Y;
  block.z = 1;
  grid_blocks_x2 = num_blocks(n, block.x);
  grid_blocks_y2 = num_blocks(n, block.y);
  grid.x = grid_blocks_x2;
  grid.y = grid_blocks_y2;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_copy2)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_copy2)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_coerce2)), ((uint8_t*)(&grid_copy2)), 12);
  memcpy(((uint8_t*)(&block_coerce2)), ((uint8_t*)(&block_copy2)), 12);
// INSERT COMMENT LOOP: kernel::header.010
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < grid_blocks_x2;   i = i + 1){
for(int32_t j = 0; j < grid_blocks_y2;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_product(m, n, alpha, beta, C, A, grid_blocks_x2, grid_blocks_y2, 1, 8, 32, 1, i, j, 0, k, l, 0);
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
  fprintf(stderr, print_fmt_double_2dp_space, C[(i * ni + j)]);
  if ((int)(i * ni + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, newline_str);
  }
}
}
  fprintf(stderr, newline_str);
}
