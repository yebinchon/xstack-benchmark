/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define BYTES_PER_DOUBLE 8
#define THREADS_PER_BLOCK_X 256
#define DIM3_SIZE_BYTES 12
#define PRINTF_FMT_STR_LEN 8
#define NEWLINE_STR_LEN 2
#define DEFAULT_ALPHA 43532
#define DEFAULT_BETA 12313
#define PRINT_ITEMS_PER_LINE 20
#define ARG_IDX_N 2
#define ARG_IDX_DUMP_CODE 1

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
struct cuda_dim3;
struct cuda_dim3_packed;

/* Function definitions */

/* Types Definitions */
struct array_1_uint8_t {
  uint8_t array[1];
};
struct array_20_uint8_t {
  uint8_t array[20];
};
struct cuda_dim3 {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct cuda_dim3_packed {
  uint64_t xy;
  uint32_t z;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
void kernel_y(uint32_t, double, double, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t print_double_format[PRINTF_FMT_STR_LEN] = { "%0.2lf " };
uint8_t newline_string[NEWLINE_STR_LEN] = { "\n" };


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
  struct cuda_dim3 grid_dim;    /* Address-exposed local */
  struct cuda_dim3 block_dim;    /* Address-exposed local */
  struct cuda_dim3_packed grid_dim_packed;    /* Address-exposed local */
  struct cuda_dim3_packed block_dim_packed;    /* Address-exposed local */
  int32_t n;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* B;
  uint8_t* tmp;
  uint8_t* x;
  uint8_t* y;
  int32_t num_blocks_x;
  uint32_t i;
  uint32_t j;

  n = atoi(argv[ARG_IDX_N]);
  dump_code = atoi(argv[ARG_IDX_DUMP_CODE]);
  A = malloc(n * n * BYTES_PER_DOUBLE);
  B = malloc(n * n * BYTES_PER_DOUBLE);
  tmp = malloc(n * BYTES_PER_DOUBLE);
  x = malloc(n * BYTES_PER_DOUBLE);
  y = malloc(n * BYTES_PER_DOUBLE);
init_array(n, (double*)A, (double*)B, (double*)x);
  num_blocks_x = num_blocks(n, THREADS_PER_BLOCK_X);
  grid_dim.x = num_blocks_x;
  grid_dim.y = 1;
  grid_dim.z = 1;
  block_dim.x = THREADS_PER_BLOCK_X;
  block_dim.y = 1;
  block_dim.z = 1;
  memcpy(((uint8_t*)(&grid_dim_packed)), ((uint8_t*)(&grid_dim)), DIM3_SIZE_BYTES);
  memcpy(((uint8_t*)(&block_dim_packed)), ((uint8_t*)(&block_dim)), DIM3_SIZE_BYTES);
// OpenMP-parallel nested iteration over block and thread indices along x to simulate launching all GPU threads::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < num_blocks_x;   i = i + 1){
for(int32_t j = 0; j < THREADS_PER_BLOCK_X;   j = j + 1){
kernel_y(n, DEFAULT_ALPHA, DEFAULT_BETA, (double*)A, (double*)B, (double*)tmp, (double*)x, (double*)y, num_blocks_x, 1, 1, THREADS_PER_BLOCK_X, 1, 1, i, 0, 0, j, 0, 0);
}
}
// If dump_code is enabled, print the computed vector y before proceeding to resource cleanup
  if (dump_code == 1) { // IFELSE MARKER: kcall.end IF
print_array(n, (double*)y);
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
free(((uint8_t*)((double*)tmp)));
free(((uint8_t*)((double*)x)));
free(((uint8_t*)((double*)y)));
  return 0;
}
// Initialize input data: set x to a normalized sequence and populate A and B for an n-by-n problem
void init_array(uint32_t n, double* A, double* B, double* x) {
  int64_t i;
  uint64_t j;

// For each row i, set x[i] = i/n and iterate over all columns j to initialize corresponding A[i][j] and B[i][j]::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  x[i] = ((double)(i) / (double)(n));
for(int64_t j = 0; j < n;   j = j + 1){
  A[(i * n + j)] = (((double)(i) * (double)(j)) / (double)(n));
  B[(i * n + j)] = (((double)(i) * (double)(j)) / (double)(n));
}
}
  return;
}
// Compute ceil(num / factor) to determine how many blocks of size 'factor' are needed
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// Emulated CUDA kernel that maps threads to row indices and computes elements of y from A, B, and x using scalars alpha and beta
void kernel_y(uint32_t n, double alpha, double beta, double* A, double* B, double* tmp, double* x, double* y, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t i;
  int64_t j;

// Compute the 1D global thread index from block and thread IDs and assign it to i for per-row processing
  int block_offset = blockDim_x * blockIdx_x;
  uint32_t thread_index = threadIdx_x;
  int global_index = block_offset + thread_index;
  int linear_index = global_index;
  i = linear_index;
  if (i < n) { // IFELSE MARKER: entry IF
  tmp[i] = 0;
  y[i] = 0;
for(int64_t j = 0; j < n;   j = j + 1){
  int a_index = i * n + j;
  double a_val = A[a_index];
  double x_val_a = x[j];
  double prod_a = a_val * x_val_a;
  double tmp_acc = tmp[i];
  double tmp_sum = tmp_acc + prod_a;
  tmp[i] = tmp_sum;
  int b_index = i * n + j;
  double b_val = B[b_index];
  double x_val_b = x[j];
  double prod_b = b_val * x_val_b;
  double y_acc = y[i];
  double y_sum = y_acc + prod_b;
  y[i] = y_sum;
}
  y[i] = ((alpha * tmp[i]) + (beta * y[i]));
  }
  return;
}
// Print the n elements of y in a fixed format, inserting line breaks at regular intervals
void print_array(uint32_t n, double* y) {
  int64_t i;

// Iterate through y and print each value, inserting a newline every PRINT_ITEMS_PER_LINE items::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  fprintf(stderr, print_double_format, y[i]);
  if (i % PRINT_ITEMS_PER_LINE == 0) { // IFELSE MARKER: for.body IF
  fprintf(stderr, newline_string);
  }
}
  return;
}
