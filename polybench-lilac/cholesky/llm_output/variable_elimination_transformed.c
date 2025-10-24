/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define BYTES_PER_DOUBLE 8
#define DIM3_STRUCT_SIZE_BYTES 12
#define KERNEL1_BLOCKDIM_X 256
#define TILE_SIZE_X 8
#define TILE_SIZE_Y 32
#define PRINT_ELEMENTS_PER_LINE 20
#define PRINTF_FORMAT_STR_LEN 8
#define NEWLINE_STR_LEN 2
#define ARG_IDX_N 2
#define ARG_IDX_DUMP 1
#define DUMP_CODE_ENABLED 1

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
void init_array(uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_polly(uint32_t, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
double sqrt(double);
void kernel0(uint32_t, uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel1(uint32_t, uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel2(uint32_t, uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t print_double_fmt[PRINTF_FORMAT_STR_LEN] = { "%0.2lf " };
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
  int32_t n;
  int32_t dump_code;
  uint8_t* A;

// INSERT COMMENT IFELSE: main::entry
  n = atoi(argv[ARG_IDX_N]);
  dump_code = atoi(argv[ARG_IDX_DUMP]);
  A = malloc(n * n * BYTES_PER_DOUBLE);
  init_array(n, ((double*)A));
;
  kernel_polly(n, ((double*)A));
;
  if (dump_code == DUMP_CODE_ENABLED) { // IFELSE MARKER: entry IF
print_array(n, ((double*)A));
  }
free(((uint8_t*)((double*)A)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  A[(i * n + j)] = (1 / (double)(n));
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel0
void kernel0(uint32_t n, uint32_t j, double* A, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  double diag_sqrt;

  diag_sqrt = sqrt(A[(j * n + j)]);
  A[(j * n + j)] = diag_sqrt;
}
// INSERT COMMENT FUNCTION: kernel1
void kernel1(uint32_t n, uint32_t j, double* A, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;

// INSERT COMMENT IFELSE: kernel1::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  if (i < n & i > j) { // IFELSE MARKER: entry IF
  A[(i * n + j)] = (A[(i * n + j)] / A[(j * n + j)]);
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel2
void kernel2(uint32_t n, uint32_t j, double* A, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t k;

// INSERT COMMENT IFELSE: kernel2::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  k = blockDim_y * blockIdx_y + threadIdx_y;
  int cond_j_lt_n = (j < n);
  int cond_j_lt_i = (j < i);
  int cond_i_lt_n = (i < n);
  int cond_j_lt_k = (j < k);
  int cond_k_le_i = (k <= i);
  int combined_cond = cond_j_lt_n & cond_j_lt_i & cond_i_lt_n & cond_j_lt_k & cond_k_le_i;
  if (combined_cond) { // IFELSE MARKER: entry IF
  int index_ik = i * n + k;
  int index_ij = i * n + j;
  int index_kj = k * n + j;
  double product_ij_kj = A[index_ij] * A[index_kj];
  double updated_ik_value = A[index_ik] - product_ij_kj;
  A[(i * n + k)] = updated_ik_value;
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_polly
void kernel_polly(uint32_t n, double* dev_A) {
  struct dim3 launch0_grid;    /* Address-exposed local */
  struct dim3 launch0_block;    /* Address-exposed local */
  struct dim3_coerce launch0_grid_coerce;    /* Address-exposed local */
  struct dim3_coerce launch0_block_coerce;    /* Address-exposed local */
  struct dim3 launch1_grid;    /* Address-exposed local */
  struct dim3 launch1_block;    /* Address-exposed local */
  struct dim3_coerce launch1_grid_coerce;    /* Address-exposed local */
  struct dim3_coerce launch1_block_coerce;    /* Address-exposed local */
  struct dim3 block;    /* Address-exposed local */
  struct dim3 grid;    /* Address-exposed local */
  struct dim3 launch2_block;    /* Address-exposed local */
  struct dim3 launch2_grid;    /* Address-exposed local */
  struct dim3_coerce launch2_block_coerce;    /* Address-exposed local */
  struct dim3_coerce launch2_grid_coerce;    /* Address-exposed local */
  int32_t iter;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

// INSERT COMMENT LOOP: kernel_polly::for.cond
for(int32_t iter = 0; iter < n;   iter = iter + 1){
  launch0_grid.x = 1;
  launch0_grid.y = 1;
  launch0_grid.z = 1;
  launch0_block.x = 1;
  launch0_block.y = 1;
  launch0_block.z = 1;
  memcpy(((uint8_t*)(&launch0_grid_coerce)), ((uint8_t*)(&launch0_grid)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&launch0_block_coerce)), ((uint8_t*)(&launch0_block)), DIM3_STRUCT_SIZE_BYTES);
kernel0(n, iter, dev_A, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0);
  uint32_t grid1_x = num_blocks(n, KERNEL1_BLOCKDIM_X);
  launch1_grid.x = grid1_x;
  launch1_grid.y = 1;
  launch1_grid.z = 1;
  launch1_block.x = KERNEL1_BLOCKDIM_X;
  launch1_block.y = 1;
  launch1_block.z = 1;
  memcpy(((uint8_t*)(&launch1_grid_coerce)), ((uint8_t*)(&launch1_grid)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&launch1_block_coerce)), ((uint8_t*)(&launch1_block)), DIM3_STRUCT_SIZE_BYTES);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < grid1_x;   j = j + 1){
for(int32_t k = 0; k < KERNEL1_BLOCKDIM_X;   k = k + 1){
  kernel1(n, iter, dev_A, grid1_x, 1, 1, KERNEL1_BLOCKDIM_X, 1, 1, j, 0, 0, k, 0, 0);
;
}
}
  block.x = TILE_SIZE_X;
  block.y = TILE_SIZE_Y;
  block.z = 1;
  uint32_t grid2_x = num_blocks(n, block.x);
  uint32_t grid2_y = num_blocks(n, block.y);
  grid.x = grid2_x;
  grid.y = grid2_y;
  grid.z = 1;
  memcpy(((uint8_t*)(&launch2_block)), ((uint8_t*)(&block)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&launch2_grid)), ((uint8_t*)(&grid)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&launch2_block_coerce)), ((uint8_t*)(&launch2_block)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&launch2_grid_coerce)), ((uint8_t*)(&launch2_grid)), DIM3_STRUCT_SIZE_BYTES);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < TILE_SIZE_X;   j = j + 1){
for(int32_t k = 0; k < TILE_SIZE_Y;   k = k + 1){
for(int32_t l = 0; l < grid2_x;   l = l + 1){
for(int32_t m = 0; m < grid2_y;   m = m + 1){
  kernel2(n, iter, dev_A, TILE_SIZE_X, TILE_SIZE_Y, 1, grid2_x, grid2_y, 1, j, k, 0, l, m, 0);
;
}
}
}
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  fprintf(stderr, (print_double_fmt), A[(i * n + j)]);
  if ((int)(i * n + j) % (int)PRINT_ELEMENTS_PER_LINE == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (newline_str));
  }
}
}
  return;
}
