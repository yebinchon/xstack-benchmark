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
struct IOFile;
struct Dim3;
struct Dim3Packed;

/* Function definitions */

/* Types Definitions */
struct uint8_array_1 {
  uint8_t array[1];
};
struct uint8_array_20 {
  uint8_t array[20];
};
struct IOFile {
  uint32_t io_flags;
  uint8_t* buf_ptr0;
  uint8_t* buf_ptr1;
  uint8_t* buf_ptr2;
  uint8_t* buf_ptr3;
  uint8_t* buf_ptr4;
  uint8_t* buf_ptr5;
  uint8_t* buf_ptr6;
  uint8_t* buf_ptr7;
  uint8_t* buf_ptr8;
  uint8_t* buf_ptr9;
  uint8_t* buf_ptr10;
  void* cookie;
  struct IOFile* next;
  uint32_t mode;
  uint32_t fd;
  uint64_t offset;
  uint16_t state;
  uint8_t char_last;
  uint8_t small_buf[1];
  uint8_t* buffer;
  uint64_t timestamp;
  void* lock;
  void* lock2;
  struct IOFile* prev;
  uint8_t* tmp_ptr;
  uint64_t size64;
  uint32_t count32;
  uint8_t small_array[20];
};
struct Dim3 {
  uint32_t dim3_x;
  uint32_t dim3_y;
  uint32_t dim3_z;
};
struct Dim3Packed {
  uint64_t dim3packed_field0;
  uint32_t dim3packed_field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_stencil(uint32_t, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t print_double_space[8] = { "%0.2lf " };
uint8_t print_newline[2] = { "\n" };


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
  int32_t tsteps;
  int32_t n;
  uint8_t* A;
  uint8_t* B;
  int32_t unused_var27;
  int32_t unused_var37;

// INSERT COMMENT IFELSE: main::entry
  dump_code = atoi(argv[1]);
  tsteps = atoi(argv[2]);
  n = atoi(argv[3]);
  A = malloc(n * n * n * 8);
  B = malloc(n * n * n * 8);
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
  uint64_t j;
  uint64_t k;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
for(int64_t k = 0; k < n;   k = k + 1){
  __auto_type idx_ijk = ((i * n + j) * n + k);
  __auto_type sum_ijk = ((double)i + (double)j + (double)k);
  __auto_type normalized_sum = sum_ijk / (double)n;
  A[((i * n + j) * n + k)] = normalized_sum;
  __auto_type idx_ijk_b = ((i * n + j) * n + k);
  __auto_type sum_ijk_b = ((double)i + (double)j + (double)k);
  __auto_type sum_plus_one = sum_ijk_b + 1.0;
  __auto_type normalized_sum_plus_one = sum_plus_one / (double)n;
  B[((i * n + j) * n + k)] = normalized_sum_plus_one;
}
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_stencil
void kernel_stencil(uint32_t iter, double* A, double* B, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;
  int32_t k;

// INSERT COMMENT IFELSE: kernel_stencil::entry
  i = blockDim_x * blockIdx_x + threadIdx_x + 1;
  j = blockDim_y * blockIdx_y + threadIdx_y + 1;
  k = blockDim_z * blockIdx_z + threadIdx_z + 1;
  if (i < (iter - 1)) { // IFELSE MARKER: entry IF
  if (j < (iter - 1)) { // IFELSE MARKER: land.lhs.true IF
  if (k < (iter - 1)) { // IFELSE MARKER: land.lhs.true18 IF
  B[((i * iter + j) * iter + k)] = ((((((A[(((i + 1) * iter + j) * iter + k)] - (2 * A[((i * iter + j) * iter + k)])) + A[(((i - 1) * iter + j) * iter + k)]) / 8) + (((A[((i * iter + (j + 1)) * iter + k)] - (2 * A[((i * iter + j) * iter + k)])) + A[((i * iter + (j - 1)) * iter + k)]) / 8)) + (((A[(((i * iter + j) * iter + k) + 1)] - (2 * A[((i * iter + j) * iter + k)])) + A[(((i * iter + j) * iter + k) - 1)]) / 8)) + A[((i * iter + j) * iter + k)]);
  }
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t tsteps, uint32_t iter, double* A, double* B) {
  struct Dim3 block;    /* Address-exposed local */
  struct Dim3 grid;    /* Address-exposed local */
  struct Dim3 grid_temp;    /* Address-exposed local */
  struct Dim3 block_temp;    /* Address-exposed local */
  struct Dim3Packed grid_packed_temp;    /* Address-exposed local */
  struct Dim3Packed block_packed_temp;    /* Address-exposed local */
  struct Dim3 grid_temp2;    /* Address-exposed local */
  struct Dim3 block_temp2;    /* Address-exposed local */
  struct Dim3Packed grid_packed_temp2;    /* Address-exposed local */
  struct Dim3Packed block_packed_temp2;    /* Address-exposed local */
  int32_t t;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;
  uint32_t n;

// INSERT COMMENT LOOP: kernel::for.cond
for(int32_t t = 1; t <= tsteps;   t = t + 1){
  block.dim3_x = 1;
  block.dim3_y = 8;
  block.dim3_z = 32;
  uint32_t num_blocks_x = num_blocks(iter - 2, block.dim3_x);
  uint32_t num_blocks_y = num_blocks(iter - 2, block.dim3_y);
  uint32_t num_blocks_z = num_blocks(iter - 2, block.dim3_z);
  grid.dim3_x = num_blocks_x;
  grid.dim3_y = num_blocks_y;
  grid.dim3_z = num_blocks_z;
  memcpy((uint8_t*)(&grid_temp), (uint8_t*)(&grid), 12);
  memcpy((uint8_t*)(&block_temp), (uint8_t*)(&block), 12);
  memcpy((uint8_t*)(&grid_packed_temp), (uint8_t*)(&grid_temp), 12);
  memcpy((uint8_t*)(&block_packed_temp), (uint8_t*)(&block_temp), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < num_blocks_x;   j = j + 1){
for(int32_t k = 0; k < num_blocks_y;   k = k + 1){
for(int32_t l = 0; l < num_blocks_z;   l = l + 1){
for(int32_t m = 0; m < 8;   m = m + 1){
for(int32_t n = 0; n < 32;   n = n + 1){
kernel_stencil(iter, A, B, num_blocks_x, num_blocks_y, num_blocks_z, 1, 8, 32, j, k, l, 0, m, n);
}
}
}
}
}
  memcpy((uint8_t*)(&grid_temp2), (uint8_t*)(&grid), 12);
  memcpy((uint8_t*)(&block_temp2), (uint8_t*)(&block), 12);
  memcpy((uint8_t*)(&grid_packed_temp2), (uint8_t*)(&grid_temp2), 12);
  memcpy((uint8_t*)(&block_packed_temp2), (uint8_t*)(&block_temp2), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < num_blocks_x;   j = j + 1){
for(int32_t k = 0; k < num_blocks_y;   k = k + 1){
for(int32_t l = 0; l < num_blocks_z;   l = l + 1){
for(int32_t m = 0; m < 8;   m = m + 1){
for(int32_t n = 0; n < 32;   n = n + 1){
kernel_stencil(iter, B, A, num_blocks_x, num_blocks_y, num_blocks_z, 1, 8, 32, j, k, l, 0, m, n);
}
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
  uint64_t k;
  int32_t tmp_i32;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
for(int64_t k = 0; k < n;   k = k + 1){
  fprintf(stderr, print_double_space, A[((i * n + j) * n + k)]);
  if ((int)((i * n + j) * n + k) % (int)20 == 0) { // IFELSE MARKER: for.body6 IF
  fprintf(stderr, print_newline);
  }
}
}
}
  fprintf(stderr, print_newline);
}
