/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define PRINTF_FMT_STR_LEN 8
#define NEWLINE_STR_LEN 2
#define ARG_IDX_N 2
#define ARG_IDX_M 3
#define ARG_IDX_DUMP 1
#define DUMP_ENABLED_FLAG 1
#define DOUBLE_SIZE_BYTES 8
#define DEFAULT_ALPHA 32412
#define CONTRACT_BLOCK_DIM_X 256
#define DIM3_MEMCPY_SIZE 12
#define ALPHA_BLOCK_DIM_X 8
#define ALPHA_BLOCK_DIM_Y 32

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
struct uint8_array_1 {
  uint8_t array[1];
};
struct uint8_array_20 {
  uint8_t array[20];
};
struct Dim3 {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct Dim3Coerce {
  uint64_t value64;
  uint32_t value32;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, uint32_t, double, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_contract(uint32_t, uint32_t, double, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_alpha(uint32_t, uint32_t, double, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t double_print_format[PRINTF_FMT_STR_LEN] = { "%0.2lf " };
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
  double alpha;    /* Address-exposed local */
  int32_t n;
  int32_t m;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* B;

// Parse n, m, and dump flag from argv, then allocate contiguous buffers for A (n*m) and B (m*n) as doubles
  n = atoi(argv[ARG_IDX_N]);
  m = atoi(argv[ARG_IDX_M]);
  dump_code = atoi(argv[ARG_IDX_DUMP]);
  A = malloc(n * m * DOUBLE_SIZE_BYTES);
  B = malloc(m * n * DOUBLE_SIZE_BYTES);
  init_array(n, m, &alpha, (double*)A, (double*)B);
;
  kernel(n, m, alpha, (double*)A, (double*)B);
;
  if (dump_code == DUMP_ENABLED_FLAG) { // IFELSE MARKER: entry IF
print_array(m, n, (double*)B);
  }
free((uint8_t*)((double*)A));
free((uint8_t*)((double*)B));
  return 0;
}
// Initialize the scalar alpha and populate arrays A and B with deterministic values based on n and m to set up the computation
void init_array(uint32_t n, uint32_t m, double* alpha, double* A, double* B) {
  int64_t i;
  int64_t j;
  uint32_t j_u32;

  *alpha = DEFAULT_ALPHA;
// Iterate over all n rows and m columns, computing the row-major index a_index for element A[i,j]::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < m;   j = j + 1){
  int a_index = i * (int64_t)m + j;
  double i_as_double = (double)i;
  double j_as_double = (double)j;
  double ij_product = i_as_double * j_as_double;
  double m_as_double = (double)m;
  double a_value = ij_product / m_as_double;
  A[(i * m + j)] = a_value;
  int b_index = j * (int64_t)n + j;
  double i_as_double2 = (double)i;
  double j_as_double2 = (double)j;
  double ij_product2 = i_as_double2 * j_as_double2;
  double n_as_double = (double)n;
  double b_value = ij_product2 / n_as_double;
  B[(j * n + j)] = b_value;
}
}
  return;
}
// Return ceil(num / factor): number of fixed-size blocks needed to cover num items
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// GPU-style kernel that updates B in place: for each column j, accumulate B[i,j] += sum_{k=i..m-1} A[k,i] * B[k,j] using the provided grid/block/thread indices
void kernel_contract(uint32_t n, uint32_t m, double alpha, double* B, double* A, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t j;
  int64_t i;
  uint32_t induction_index;
  uint64_t k;

// Compute global column index j; if j < n, perform an upper-triangular accumulation B[i,j] += sum_{k=i..m-1} A[k,i] * B[k,j] for all rows i
  j = blockDim_x * blockIdx_x + threadIdx_x;
  if (j < n) { // IFELSE MARKER: entry IF
for(int64_t i = 0; i < m;   i = i + 1){
for(int64_t k = i; k < m;   k = k + 1){
  B[(i * n + j)] = (B[(i * n + j)] + A[(k * m + i)] * B[(k * n + j)]);
}
}
  }
  return;
}
// GPU-style kernel that scales each in-bounds element of B by alpha using a 2D thread grid
void kernel_alpha(uint32_t n, uint32_t m, double alpha, double* B, double* A, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;

// Derive element coordinates (i,j) from thread/block indices; if within bounds, scale B[i,j] by alpha
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < m && j < n) {
B[(i * n + j)] = (B[(i * n + j)] * alpha);
  }
  return;
}
// Host driver that configures launch dimensions and invokes the contract and scaling kernels over A and B
void kernel(uint32_t n, uint32_t m, double alpha, double* A, double* B) {
  struct Dim3 contract_grid;    /* Address-exposed local */
  struct Dim3 contract_block;    /* Address-exposed local */
  struct Dim3Coerce contract_grid_coerce;    /* Address-exposed local */
  struct Dim3Coerce contract_block_coerce;    /* Address-exposed local */
  struct Dim3 block;    /* Address-exposed local */
  struct Dim3 grid;    /* Address-exposed local */
  struct Dim3 alpha_grid_tmp;    /* Address-exposed local */
  struct Dim3 alpha_block_tmp;    /* Address-exposed local */
  struct Dim3Coerce alpha_grid_coerce;    /* Address-exposed local */
  struct Dim3Coerce alpha_block_coerce;    /* Address-exposed local */
  int32_t contract_grid_x;
  uint32_t i;
  uint32_t j;
  int32_t alpha_grid_x;
  int32_t alpha_grid_y;
  uint32_t k;
  uint32_t l;

  contract_grid_x = num_blocks(n, CONTRACT_BLOCK_DIM_X);
  contract_grid.x = contract_grid_x;
  contract_grid.y = 1;
  contract_grid.z = 1;
  contract_block.x = CONTRACT_BLOCK_DIM_X;
  contract_block.y = 1;
  contract_block.z = 1;
  memcpy((uint8_t*)(&contract_grid_coerce), (uint8_t*)(&contract_grid), DIM3_MEMCPY_SIZE);
  memcpy((uint8_t*)(&contract_block_coerce), (uint8_t*)(&contract_block), DIM3_MEMCPY_SIZE);
// OpenMP-parallel 2D iteration over the launch grid (alpha_grid_x x alpha_grid_y) to emulate GPU execution::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < contract_grid_x;   i = i + 1){
for(int32_t j = 0; j < CONTRACT_BLOCK_DIM_X;   j = j + 1){
kernel_contract(n, m, alpha, B, A, contract_grid_x, 1, 1, CONTRACT_BLOCK_DIM_X, 1, 1, i, 0, 0, j, 0, 0);
}
}
  block.x = ALPHA_BLOCK_DIM_X;
  block.y = ALPHA_BLOCK_DIM_Y;
  block.z = 1;
  alpha_grid_x = num_blocks(m, block.x);
  alpha_grid_y = num_blocks(n, block.y);
  grid.x = alpha_grid_x;
  grid.y = alpha_grid_y;
  grid.z = 1;
  memcpy((uint8_t*)(&alpha_grid_tmp), (uint8_t*)(&grid), DIM3_MEMCPY_SIZE);
  memcpy((uint8_t*)(&alpha_block_tmp), (uint8_t*)(&block), DIM3_MEMCPY_SIZE);
  memcpy((uint8_t*)(&alpha_grid_coerce), (uint8_t*)(&alpha_grid_tmp), DIM3_MEMCPY_SIZE);
  memcpy((uint8_t*)(&alpha_block_coerce), (uint8_t*)(&alpha_block_tmp), DIM3_MEMCPY_SIZE);
// OpenMP-parallel 2D iteration over the launch grid (alpha_grid_x x alpha_grid_y) to emulate GPU execution::header.010
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < alpha_grid_x;   i = i + 1){
for(int32_t j = 0; j < alpha_grid_y;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_alpha(n, m, alpha, B, A, alpha_grid_x, alpha_grid_y, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  return;
}
// Print the m-by-n matrix B to stderr in row-major order using double_print_format
void print_array(uint32_t m, uint32_t n, double* B) {
  int64_t i;
  int64_t j;

// Walk B by rows (i = 0..m-1) and columns (j = 0..n-1), printing each element in order::for.cond
for(int64_t i = 0; i < m;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  fprintf(stderr, double_print_format, B[(i * n + j)]);
  if ((int)(i * n + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, newline_str);
  }
}
}
  fprintf(stderr, newline_str);
}
