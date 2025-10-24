/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define PROBLEM_SIZE_N 15000
#define BYTES_PER_DOUBLE 8
#define MATRIX_A_BYTES 1800000000
#define CUDA_BLOCK_DIM_X 256
#define DIM3_STRUCT_SIZE_BYTES 12
#define PRINTF_FMT_BUFFER_LEN 7
#define NEWLINE_STR_BUFFER_LEN 2
#define DUMP_CODE_ENABLED 1
#define X2_INIT_OFFSET 1
#define Y1_INIT_OFFSET 3
#define Y2_INIT_OFFSET 4

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
struct CudaDim3;
struct CudaDim3Packed;

/* Function definitions */

/* Types Definitions */
struct uint8_array_1 {
  uint8_t array[1];
};
struct uint8_array_20 {
  uint8_t array[20];
};
struct CudaDim3 {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct CudaDim3Packed {
  uint64_t data64;
  uint32_t data32;
};

/* External Global Variable Declarations */

/* Function Declarations */
int16_t num_blocks(int16_t, int16_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void print_array(uint32_t, double*, double*) __ATTRIBUTELIST__((noinline));
void kernel_x1(uint32_t, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_x2(uint32_t, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t double_format_str[PRINTF_FMT_BUFFER_LEN] = { "%0.2lf" };
uint8_t newline_str[NEWLINE_STR_BUFFER_LEN] = { "\n" };


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
  int32_t dump_code;
  uint8_t* A;
  uint8_t* x1;
  uint8_t* x2;
  uint8_t* y_1;
  uint8_t* y_2;

// INSERT COMMENT IFELSE: main::entry
  dump_code = atoi(argv[1]);
  A = malloc(MATRIX_A_BYTES);
  x1 = malloc(BYTES_PER_DOUBLE * PROBLEM_SIZE_N);
  x2 = malloc(BYTES_PER_DOUBLE * PROBLEM_SIZE_N);
  y_1 = malloc(BYTES_PER_DOUBLE * PROBLEM_SIZE_N);
  y_2 = malloc(BYTES_PER_DOUBLE * PROBLEM_SIZE_N);
  double* x1_as_double = (double*)x1;
  double* x2_as_double = (double*)x2;
  double* y1_as_double = (double*)y_1;
  double* y2_as_double = (double*)y_2;
  double* A_as_double = (double*)A;
  init_array(PROBLEM_SIZE_N, x1_as_double, x2_as_double, y1_as_double, y2_as_double, A_as_double);
;
  kernel(PROBLEM_SIZE_N, x1_as_double, x2_as_double, y1_as_double, y2_as_double, A_as_double);
;
  if (dump_code == DUMP_CODE_ENABLED) { // IFELSE MARKER: entry IF
print_array(PROBLEM_SIZE_N, x1_as_double, x2_as_double);
  }
free((uint8_t*)((double*)A));
free((uint8_t*)((double*)x1));
free((uint8_t*)((double*)x2));
free((uint8_t*)((double*)y_1));
free((uint8_t*)((double*)y_2));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, double* x1, double* x2, double* y_1, double* y_2, double* A) {
  int64_t i;
  uint64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  x1[i] = ((double)(i) / (double)(n));
  x2[i] = (((double)(i) + X2_INIT_OFFSET) / (double)(n));
  y_1[i] = (((double)(i) + Y1_INIT_OFFSET) / (double)(n));
  y_2[i] = (((double)(i) + Y2_INIT_OFFSET) / (double)(n));
for(int64_t j = 0; j < n;   j = j + 1){
  A[(i * n + j)] = (((double)(i) * (double)(j)) / (double)(n));
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
int16_t num_blocks(int16_t num, int16_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_x1
void kernel_x1(uint32_t n, double* x1, double* x2, double* y_1, double* y_2, double* A, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t i;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_x1::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  if (i < n) { // IFELSE MARKER: entry IF
for(int64_t j = 0; j < n;   j = j + 1){
  x1[i] = (x1[i] + A[(i * n + j)] * y_1[j]);
}
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_x2
void kernel_x2(uint32_t n, double* x1, double* x2, double* y_1, double* y_2, double* A, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t i;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_x2::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  if (i < n) { // IFELSE MARKER: entry IF
for(int64_t j = 0; j < n;   j = j + 1){
  x2[i] = (x2[i] + A[(j * n + i)] * y_2[j]);
}
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t n, double* x1, double* x2, double* y_1, double* y_2, double* A) {
  struct CudaDim3 blockDim1;    /* Address-exposed local */
  struct CudaDim3 gridDim1;    /* Address-exposed local */
  struct CudaDim3Packed blockDim1_packed;    /* Address-exposed local */
  struct CudaDim3Packed gridDim1_packed;    /* Address-exposed local */
  struct CudaDim3 blockDim2;    /* Address-exposed local */
  struct CudaDim3 gridDim2;    /* Address-exposed local */
  struct CudaDim3Packed blockDim2_packed;    /* Address-exposed local */
  struct CudaDim3Packed gridDim2_packed;    /* Address-exposed local */
  int32_t numBlocks1;
  uint32_t i;
  uint32_t j;
  int32_t numBlocks2;

  blockDim1.x = CUDA_BLOCK_DIM_X;
  blockDim1.y = 1;
  blockDim1.z = 1;
  numBlocks1 = num_blocks(n, CUDA_BLOCK_DIM_X);
  gridDim1.x = numBlocks1;
  gridDim1.y = 1;
  gridDim1.z = 1;
  memcpy(((uint8_t*)(&blockDim1_packed)), ((uint8_t*)(&blockDim1)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&gridDim1_packed)), ((uint8_t*)(&gridDim1)), DIM3_STRUCT_SIZE_BYTES);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < CUDA_BLOCK_DIM_X;   i = i + 1){
for(int32_t j = 0; j < numBlocks1;   j = j + 1){
kernel_x1(n, x1, x2, y_1, y_2, A, CUDA_BLOCK_DIM_X, 1, 1, numBlocks1, 1, 1, i, 0, 0, j, 0, 0);
}
}
  blockDim2.x = 256;
  blockDim2.y = 1;
  blockDim2.z = 1;
  numBlocks2 = num_blocks(n, 256);
  gridDim2.x = numBlocks2;
  gridDim2.y = 1;
  gridDim2.z = 1;
  memcpy(((uint8_t*)(&blockDim2_packed)), ((uint8_t*)(&blockDim2)), 12);
  memcpy(((uint8_t*)(&gridDim2_packed)), ((uint8_t*)(&gridDim2)), 12);
// INSERT COMMENT LOOP: kernel::header.010
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < 256;   i = i + 1){
for(int32_t j = 0; j < numBlocks2;   j = j + 1){
kernel_x2(n, x1, x2, y_1, y_2, A, 256, 1, 1, numBlocks2, 1, 1, i, 0, 0, j, 0, 0);
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t n, double* x1, double* x2) {
  int64_t i;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  fprintf(stderr, double_format_str, x1[i]);
  fprintf(stderr, double_format_str, x2[i]);
  if (i % 20 == 0) { // IFELSE MARKER: for.body IF
  fprintf(stderr, newline_str);
  }
}
  return;
}
