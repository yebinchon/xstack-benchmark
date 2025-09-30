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
struct Dim3Coerce;

/* Function definitions */

/* Types Definitions */
struct uint8_array_1 {
  uint8_t array[1];
};
struct uint8_array_20 {
  uint8_t array[20];
};
struct IOFile {
  uint32_t f0;
  uint8_t* f1;
  uint8_t* f2;
  uint8_t* f3;
  uint8_t* f4;
  uint8_t* f5;
  uint8_t* f6;
  uint8_t* f7;
  uint8_t* f8;
  uint8_t* f9;
  uint8_t* f10;
  uint8_t* f11;
  void* f12;
  struct IOFile* f13;
  uint32_t f14;
  uint32_t f15;
  uint64_t f16;
  uint16_t f17;
  uint8_t f18;
  uint8_t f19[1];
  uint8_t* f20;
  uint64_t f21;
  void* f22;
  void* f23;
  struct IOFile* f24;
  uint8_t* f25;
  uint64_t f26;
  uint32_t f27;
  uint8_t f28[20];
};
struct Dim3 {
  uint32_t batch;
  uint32_t height;
  uint32_t width;
};
struct Dim3Coerce {
  uint64_t batch;
  uint32_t count;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int16_t num_blocks(int16_t, int16_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void print_array(uint32_t, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_x1(uint32_t, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_x2(uint32_t, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t double_print_format[7] = { "%0.2lf" };
uint8_t newline_string[2] = { "\n" };


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
  int32_t init_call_ret;
  int32_t kernel_call_ret;

// INSERT COMMENT IFELSE: main::entry
  dump_code = atoi(argv[1]);
  A = malloc(1800000000);
  x1 = malloc(8 * 15000);
  x2 = malloc(8 * 15000);
  y_1 = malloc(8 * 15000);
  y_2 = malloc(8 * 15000);
  __auto_type num_elements_init = 15000;
  __auto_type x1_double_init = (double*)x1;
  __auto_type x2_double_init = (double*)x2;
  __auto_type y1_double_init = (double*)y_1;
  __auto_type y2_double_init = (double*)y_2;
  __auto_type A_double_init = (double*)A;
  init_array(num_elements_init, x1_double_init, x2_double_init, y1_double_init, y2_double_init, A_double_init);
;
  __auto_type num_elements_kernel = 15000;
  __auto_type x1_double_kernel = (double*)x1;
  __auto_type x2_double_kernel = (double*)x2;
  __auto_type y1_double_kernel = (double*)y_1;
  __auto_type y2_double_kernel = (double*)y_2;
  __auto_type A_double_kernel = (double*)A;
  kernel(num_elements_kernel, x1_double_kernel, x2_double_kernel, y1_double_kernel, y2_double_kernel, A_double_kernel);
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(15000, ((double*)x1), ((double*)x2));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)x1)));
free(((uint8_t*)((double*)x2)));
free(((uint8_t*)((double*)y_1)));
free(((uint8_t*)((double*)y_2)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, double* x1, double* x2, double* y_1, double* y_2, double* A) {
  int64_t i;
  uint64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  x1[i] = ((double)(i) / (double)(n));
  x2[i] = (((double)(i) + 1) / (double)(n));
  y_1[i] = (((double)(i) + 3) / (double)(n));
  y_2[i] = (((double)(i) + 4) / (double)(n));
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
  x1[i] = (x1[i] + (A[(i * n + j)] * y_1[j]));
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
  x2[i] = (x2[i] + (A[(j * n + i)] * y_2[j]));
}
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t n, double* x1, double* x2, double* y_1, double* y_2, double* A) {
  struct Dim3 dim_block256;    /* Address-exposed local */
  struct Dim3 dim_grid;    /* Address-exposed local */
  struct Dim3Coerce dim_block256_coerce;    /* Address-exposed local */
  struct Dim3Coerce dim_grid_coerce;    /* Address-exposed local */
  struct Dim3 dim_block256_b;    /* Address-exposed local */
  struct Dim3 dim_grid_b;    /* Address-exposed local */
  struct Dim3Coerce dim_block256_b_coerce;    /* Address-exposed local */
  struct Dim3Coerce dim_grid_b_coerce;    /* Address-exposed local */
  int32_t num_blocks_256;
  uint8_t* tmp_bytes1;
  uint8_t* tmp_bytes2;
  uint32_t i;
  uint32_t j;
  int32_t num_blocks_256_2;
  uint8_t* tmp_bytes3;
  uint8_t* tmp_bytes4;

  dim_block256.batch = 256;
  dim_block256.height = 1;
  dim_block256.width = 1;
  num_blocks_256 = num_blocks(n, 256);
  dim_grid.batch = num_blocks_256;
  dim_grid.height = 1;
  dim_grid.width = 1;
  memcpy(((uint8_t*)(&dim_block256_coerce)), ((uint8_t*)(&dim_block256)), 12);
  memcpy(((uint8_t*)(&dim_grid_coerce)), ((uint8_t*)(&dim_grid)), 12);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < 256;   i = i + 1){
for(int32_t j = 0; j < num_blocks_256;   j = j + 1){
kernel_x1(n, x1, x2, y_1, y_2, A, 256, 1, 1, num_blocks_256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  dim_block256_b.batch = 256;
  dim_block256_b.height = 1;
  dim_block256_b.width = 1;
  num_blocks_256_2 = num_blocks(n, 256);
  dim_grid_b.batch = num_blocks_256_2;
  dim_grid_b.height = 1;
  dim_grid_b.width = 1;
  memcpy(((uint8_t*)(&dim_block256_b_coerce)), ((uint8_t*)(&dim_block256_b)), 12);
  memcpy(((uint8_t*)(&dim_grid_b_coerce)), ((uint8_t*)(&dim_grid_b)), 12);
// INSERT COMMENT LOOP: kernel::header.010
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < 256;   i = i + 1){
for(int32_t j = 0; j < num_blocks_256_2;   j = j + 1){
kernel_x2(n, x1, x2, y_1, y_2, A, 256, 1, 1, num_blocks_256_2, 1, 1, i, 0, 0, j, 0, 0);
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t n, double* x1, double* x2) {
  int64_t i;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  fprintf(stderr, (double_print_format), x1[i]);
  fprintf(stderr, (double_print_format), x2[i]);
  if (i % 20 == 0) { // IFELSE MARKER: for.body IF
  fprintf(stderr, (newline_string));
  }
}
  return;
}
