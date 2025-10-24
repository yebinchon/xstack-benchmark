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
void init_array(uint32_t, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_stencil(uint32_t, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t fmt_double_2dp_space[8] = { "%0.2lf " };
uint8_t newline_str[2] = { "\n" };


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
  int32_t n;
  int32_t tsteps;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* B;

// INSERT COMMENT IFELSE: main::entry
  n = atoi(argv[3]);
  tsteps = atoi(argv[2]);
  dump_code = atoi(argv[1]);
  A = malloc(n * 8);
  B = malloc(n * 8);
  init_array(n, (double*)A, (double*)B);
;
  kernel(tsteps, n, (double*)A, (double*)B);
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(n, (double*)A);
  }
free((uint8_t*)((double*)A));
free((uint8_t*)((double*)B));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, double* A, double* B) {
  int64_t i;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  A[i] = (((double)(i) + 2) / (double)(n));
  B[i] = (((double)(i) + 3) / (double)(n));
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_stencil
void kernel_stencil(uint32_t n, double* A, double* B, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t i;

// INSERT COMMENT IFELSE: kernel_stencil::entry
  int blockStartX = blockDim_x * blockIdx_x;
  int threadGlobalX = blockStartX + threadIdx_x;
  int computedIndex = threadGlobalX + 1;
  i = computedIndex;
  if (i < (n - 1)) { // IFELSE MARKER: entry IF
  double leftVal = A[i - 1];
  double centerVal = A[i];
  double rightVal = A[i + 1];
  double sumLeftCenter = leftVal + centerVal;
  double sumAll = sumLeftCenter + rightVal;
  double average = sumAll / 3;
  B[i] = average;
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t tsteps, uint32_t n, double* A, double* B) {
  struct dim3 gridDim0;    /* Address-exposed local */
  struct dim3 blockDim0;    /* Address-exposed local */
  struct dim3_coerce gridDim0_coerce;    /* Address-exposed local */
  struct dim3_coerce blockDim0_coerce;    /* Address-exposed local */
  struct dim3 gridDim1;    /* Address-exposed local */
  struct dim3 blockDim1;    /* Address-exposed local */
  struct dim3_coerce gridDim1_coerce;    /* Address-exposed local */
  struct dim3_coerce blockDim1_coerce;    /* Address-exposed local */
  int32_t t;
  uint32_t j;
  uint32_t k;

// INSERT COMMENT LOOP: kernel::for.cond
for(int32_t t = 1; t <= tsteps;   t = t + 1){
  uint32_t numBlocks0 = num_blocks(n, 256);
  gridDim0.x = numBlocks0;
  gridDim0.y = 1;
  gridDim0.z = 1;
  blockDim0.x = 256;
  blockDim0.y = 1;
  blockDim0.z = 1;
  memcpy((uint8_t*)(&gridDim0_coerce), (uint8_t*)(&gridDim0), 12);
  memcpy((uint8_t*)(&blockDim0_coerce), (uint8_t*)(&blockDim0), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < numBlocks0;   j = j + 1){
for(int32_t k = 0; k < 256;   k = k + 1){
kernel_stencil(n, A, B, numBlocks0, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
  uint32_t numBlocks1 = num_blocks(n, 256);
  gridDim1.x = numBlocks1;
  gridDim1.y = 1;
  gridDim1.z = 1;
  blockDim1.x = 256;
  blockDim1.y = 1;
  blockDim1.z = 1;
  memcpy((uint8_t*)(&gridDim1_coerce), (uint8_t*)(&gridDim1), 12);
  memcpy((uint8_t*)(&blockDim1_coerce), (uint8_t*)(&blockDim1), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < numBlocks1;   j = j + 1){
for(int32_t k = 0; k < 256;   k = k + 1){
kernel_stencil(n, B, A, numBlocks1, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t n, double* A) {
  int64_t i;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  fprintf(stderr, fmt_double_2dp_space, A[i]);
  if (i % 20 == 0) { // IFELSE MARKER: for.body IF
  fprintf(stderr, newline_str);
  }
}
  fprintf(stderr, newline_str);
}
