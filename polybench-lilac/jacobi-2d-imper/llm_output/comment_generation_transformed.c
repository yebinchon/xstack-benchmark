/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define BYTES_PER_DOUBLE 8
#define FORMAT_STR_BUF_SIZE 8
#define NEWLINE_STR_BUF_SIZE 2
#define DUMP_CODE_ENABLED 1
#define INIT_A_J_OFFSET 2
#define INIT_A_CONST_TERM 2
#define INIT_B_J_OFFSET 3
#define INIT_B_CONST_TERM 3
#define STENCIL_HALO_RADIUS 1
#define STENCIL_DENOMINATOR_5PT 5
#define STENCIL_BORDER_TOTAL 2
#define BLOCK_DIM_X 8
#define BLOCK_DIM_Y 32
#define Z_DIM_SIZE 1
#define DIM3_SIZE_BYTES 12

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
  uint64_t xy;
  uint32_t z;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_stencil(uint32_t, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t print_double_format_str[FORMAT_STR_BUF_SIZE] = { "%0.2lf " };
uint8_t newline_string[NEWLINE_STR_BUF_SIZE] = { "\n" };


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
  int32_t n;
  int32_t tsteps;
  uint8_t* A;
  uint8_t* B;

// Parse command-line args (dump flag, n, tsteps) and allocate n-by-n double buffers A and B
  dump_code = atoi(argv[1]);
  n = atoi(argv[2]);
  tsteps = atoi(argv[3]);
  A = malloc(n * n * BYTES_PER_DOUBLE);
  B = malloc(n * n * BYTES_PER_DOUBLE);
  init_array(n, ((double*)A), ((double*)B));
;
  kernel(tsteps, n, ((double*)A), ((double*)B));
;
  if (dump_code == DUMP_CODE_ENABLED) { // IFELSE MARKER: entry IF
print_array(n, ((double*)A));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
  return 0;
}
// Initialize the n-by-n arrays A and B before computation, filling each element from its indices to form a reproducible setup
void init_array(uint32_t n, double* A, double* B) {
  int64_t i;
  uint64_t j;

// Visit every (i,j) in the n-by-n grid to compute per-index offsets (e.g., a_j_offset) and initialize entries in A/B::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  int a_j_offset = j + INIT_A_J_OFFSET;
  double i_double_a = (double)(i);
  double a_j_offset_double = (double)(a_j_offset);
  double a_product = i_double_a * a_j_offset_double;
  double a_numerator = a_product + INIT_A_CONST_TERM;
  double n_double_a = (double)(n);
  double a_value = a_numerator / n_double_a;
  A[(i * n + j)] = a_value;
  int b_j_offset = j + INIT_B_J_OFFSET;
  double i_double_b = (double)(i);
  double b_j_offset_double = (double)(b_j_offset);
  double b_product = i_double_b * b_j_offset_double;
  double b_numerator = b_product + INIT_B_CONST_TERM;
  double n_double_b = (double)(n);
  double b_value = b_numerator / n_double_b;
  B[(i * n + j)] = b_value;
}
}
  return;
}
// Return ceil(num/factor): the number of blocks needed to cover num items with a given block size
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// GPU-style 2D 5-point stencil kernel: each thread computes B(i,j) from A at (i,j) and its four neighbors using grid/block/thread indices with a halo
void kernel_stencil(uint32_t n, double* A, double* B, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;

// Compute global indices (i,j); if inside the interior region (excluding halo), write B(i,j) as the 5-point average of A at (i,j) and its four axial neighbors
  i = blockDim_x * blockIdx_x + threadIdx_x + STENCIL_HALO_RADIUS;
  j = blockDim_y * blockIdx_y + threadIdx_y + STENCIL_HALO_RADIUS;
  if (i < (n - STENCIL_HALO_RADIUS)) { // IFELSE MARKER: entry IF
  if (j < (n - STENCIL_HALO_RADIUS)) { // IFELSE MARKER: land.lhs.true IF
  B[(i * n + j)] = (((((A[(i * n + j)] + A[((i * n + j) - 1)]) + A[((i * n + 1) + j)]) + A[((1 + i) * n + j)]) + A[((i - 1) * n + j)]) / STENCIL_DENOMINATOR_5PT);
  }
  }
  return;
}
// Orchestrate tsteps iterations of the stencil on n-by-n arrays by configuring launch geometry and invoking the compute kernel
void kernel(uint32_t tsteps, uint32_t n, double* A, double* B) {
  struct dim3 block;    /* Address-exposed local */
  struct dim3 grid;    /* Address-exposed local */
  struct dim3 grid_tmp;    /* Address-exposed local */
  struct dim3 block_tmp;    /* Address-exposed local */
  struct dim3_coerce grid_tmp_coerce;    /* Address-exposed local */
  struct dim3_coerce block_tmp_coerce;    /* Address-exposed local */
  struct dim3 grid_tmp2;    /* Address-exposed local */
  struct dim3 block_tmp2;    /* Address-exposed local */
  struct dim3_coerce grid_tmp2_coerce;    /* Address-exposed local */
  struct dim3_coerce block_tmp2_coerce;    /* Address-exposed local */
  int32_t t;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

// Iterate over time steps, configuring thread-block dimensions each step before launching the stencil computation::for.cond
for(int32_t t = 1; t <= tsteps;   t = t + 1){
  block.x = BLOCK_DIM_X;
  block.y = BLOCK_DIM_Y;
  block.z = Z_DIM_SIZE;
  uint32_t num_blocks_x = num_blocks((n - STENCIL_BORDER_TOTAL), block.x);
  uint32_t num_blocks_y = num_blocks((n - STENCIL_BORDER_TOTAL), block.y);
  grid.x = num_blocks_x;
  grid.y = num_blocks_y;
  grid.z = Z_DIM_SIZE;
  memcpy(((uint8_t*)(&grid_tmp)), ((uint8_t*)(&grid)), DIM3_SIZE_BYTES);
  memcpy(((uint8_t*)(&block_tmp)), ((uint8_t*)(&block)), DIM3_SIZE_BYTES);
  memcpy(((uint8_t*)(&grid_tmp_coerce)), ((uint8_t*)(&grid_tmp)), DIM3_SIZE_BYTES);
  memcpy(((uint8_t*)(&block_tmp_coerce)), ((uint8_t*)(&block_tmp)), DIM3_SIZE_BYTES);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < num_blocks_x;   j = j + 1){
for(int32_t k = 0; k < num_blocks_y;   k = k + 1){
for(int32_t l = 0; l < BLOCK_DIM_X;   l = l + 1){
for(int32_t m = 0; m < BLOCK_DIM_Y;   m = m + 1){
kernel_stencil(n, A, B, num_blocks_x, num_blocks_y, 1, 8, 32, 1, j, k, 0, l, m, 0);
}
}
}
}
  memcpy(((uint8_t*)(&grid_tmp2)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_tmp2)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_tmp2_coerce)), ((uint8_t*)(&grid_tmp2)), 12);
  memcpy(((uint8_t*)(&block_tmp2_coerce)), ((uint8_t*)(&block_tmp2)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < num_blocks_x;   j = j + 1){
for(int32_t k = 0; k < num_blocks_y;   k = k + 1){
for(int32_t l = 0; l < 8;   l = l + 1){
for(int32_t m = 0; m < 32;   m = m + 1){
kernel_stencil(n, B, A, num_blocks_x, num_blocks_y, 1, 8, 32, 1, j, k, 0, l, m, 0);
}
}
}
}
}
  return;
}
// Print the n-by-n array A element-by-element to stderr using the configured floating-point format
void print_array(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;

// Traverse all rows and columns in row-major order and print each element of A::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  fprintf(stderr, (print_double_format_str), A[(i * n + j)]);
  if ((int)(i * n + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (newline_string));
  }
}
}
  fprintf(stderr, (newline_string));
}
