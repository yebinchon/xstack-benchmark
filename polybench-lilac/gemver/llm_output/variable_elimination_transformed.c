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
  uint32_t flags;
  uint8_t* read_ptr;
  uint8_t* read_end;
  uint8_t* write_base;
  uint8_t* write_ptr;
  uint8_t* buf_base;
  uint8_t* buf_end;
  uint8_t* save_base;
  uint8_t* save_end;
  uint8_t* marker;
  uint8_t* tmpbuf;
  uint8_t* linebuf;
  void* cookie;
  struct IOFile* chain;
  uint32_t fileno;
  uint32_t mode;
  uint64_t offset;
  uint16_t short_flags;
  uint8_t eof_char;
  uint8_t tinybuf[1];
  uint8_t* buffer;
  uint64_t data_offset;
  void* vtable;
  void* codec;
  struct IOFile* next;
  uint8_t* curbuf;
  uint64_t cookie2;
  uint32_t linebuf_size;
  uint8_t reserved[20];
};
struct Dim3 {
  uint32_t dim3_x;
  uint32_t dim3_y;
  uint32_t dim3_z;
};
struct Dim3Coerce {
  uint64_t dim3coerce_field0;
  uint32_t dim3coerce_field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*, double*, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_A(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_x(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_y(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_w(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t double_format_str[8] = { "%0.2lf " };
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
  int32_t dump_code;
  uint8_t* A;
  uint8_t* u1;
  uint8_t* v1;
  uint8_t* u2;
  uint8_t* v2;
  uint8_t* w;
  uint8_t* x;
  uint8_t* y;
  uint8_t* z;
  int32_t call62_result;
  int32_t call89_result;

// INSERT COMMENT IFELSE: main::entry
  n = atoi(argv[2]);
  dump_code = atoi(argv[1]);
  A = malloc(n * n * 8);
  u1 = malloc(n * 8);
  v1 = malloc(n * 8);
  u2 = malloc(n * 8);
  v2 = malloc(n * 8);
  w = malloc(n * 8);
  x = malloc(n * 8);
  y = malloc(n * 8);
  z = malloc(n * 8);
  __auto_type A_dbl = (double*)A;
  __auto_type u1_dbl = (double*)u1;
  __auto_type v1_dbl = (double*)v1;
  __auto_type u2_dbl = (double*)u2;
  __auto_type v2_dbl = (double*)v2;
  __auto_type w_dbl = (double*)w;
  __auto_type x_dbl = (double*)x;
  __auto_type y_dbl = (double*)y;
  __auto_type z_dbl = (double*)z;
  init_array(n, A_dbl, u1_dbl, v1_dbl, u2_dbl, v2_dbl, w_dbl, x_dbl, y_dbl, z_dbl);
;
  __auto_type A_dbl2 = (double*)A;
  __auto_type u1_dbl2 = (double*)u1;
  __auto_type v1_dbl2 = (double*)v1;
  __auto_type u2_dbl2 = (double*)u2;
  __auto_type v2_dbl2 = (double*)v2;
  __auto_type w_dbl2 = (double*)w;
  __auto_type x_dbl2 = (double*)x;
  __auto_type y_dbl2 = (double*)y;
  __auto_type z_dbl2 = (double*)z;
  kernel(n, 43532, 12313, A_dbl2, u1_dbl2, v1_dbl2, u2_dbl2, v2_dbl2, w_dbl2, x_dbl2, y_dbl2, z_dbl2);
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(n, ((double*)w));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)u1)));
free(((uint8_t*)((double*)v1)));
free(((uint8_t*)((double*)u2)));
free(((uint8_t*)((double*)v2)));
free(((uint8_t*)((double*)w)));
free(((uint8_t*)((double*)x)));
free(((uint8_t*)((double*)y)));
free(((uint8_t*)((double*)z)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z) {
  int64_t i;
  uint64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  u1[i] = (double)(i);
  u2[i] = ((double)((i + 1) / n) / 2);
  v1[i] = ((double)((i + 1) / n) / 4);
  v2[i] = ((double)((i + 1) / n) / 6);
  y[i] = ((double)((i + 1) / n) / 8);
  z[i] = ((double)((i + 1) / n) / 9);
  x[i] = 0;
  w[i] = 0;
for(int64_t j = 0; j < n;   j = j + 1){
  A[(i * n + j)] = (((double)(i) * (double)(j)) / (double)(n));
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_A
void kernel_A(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t i;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_A::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < n) { // IFELSE MARKER: entry IF
  if (j < n) { // IFELSE MARKER: land.lhs.true IF
  A[(i * n + j)] = (A[(i * n + j)] + ((u1[i] * v1[j]) + (u2[i] * v2[j])));
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_x
void kernel_x(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t i;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_x::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  if (i < n) { // IFELSE MARKER: entry IF
for(int64_t j = 0; j < n;   j = j + 1){
  x[i] = (x[i] + ((beta * A[(j * n + i)]) * y[j]));
}
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_y
void kernel_y(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t i;

// INSERT COMMENT IFELSE: kernel_y::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  if (i < n) { // IFELSE MARKER: entry IF
  x[i] = (x[i] + z[i]);
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_w
void kernel_w(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t i;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_w::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  if (i < n) { // IFELSE MARKER: entry IF
for(int64_t j = 0; j < n;   j = j + 1){
  w[i] = (w[i] + ((alpha * A[(i * n + j)]) * x[j]));
}
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z) {
  struct Dim3 block;    /* Address-exposed local */
  struct Dim3 grid;    /* Address-exposed local */
  struct Dim3 grid_tmp;    /* Address-exposed local */
  struct Dim3 block_tmp4;    /* Address-exposed local */
  struct Dim3Coerce grid_tmp_coerce;    /* Address-exposed local */
  struct Dim3Coerce block_tmp4_coerce;    /* Address-exposed local */
  struct Dim3 grid_tmp6;    /* Address-exposed local */
  struct Dim3 block_tmp8;    /* Address-exposed local */
  struct Dim3Coerce grid_tmp6_coerce;    /* Address-exposed local */
  struct Dim3Coerce block_tmp8_coerce;    /* Address-exposed local */
  struct Dim3 grid_tmp13;    /* Address-exposed local */
  struct Dim3 block_tmp15;    /* Address-exposed local */
  struct Dim3Coerce grid_tmp13_coerce;    /* Address-exposed local */
  struct Dim3Coerce block_tmp15_coerce;    /* Address-exposed local */
  struct Dim3 grid_tmp20;    /* Address-exposed local */
  struct Dim3 block_tmp22;    /* Address-exposed local */
  struct Dim3Coerce grid_tmp20_coerce;    /* Address-exposed local */
  struct Dim3Coerce block_tmp22_coerce;    /* Address-exposed local */
  int32_t grid_blocks_x;
  int32_t grid_blocks_y;
  uint8_t* byte_ptr1;
  uint8_t* byte_ptr2;
  uint8_t* byte_ptr3;
  uint8_t* byte_ptr4;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t blocks_for_x;
  uint8_t* byte_ptr5;
  uint8_t* byte_ptr6;
  int32_t blocks_for_y;
  uint8_t* byte_ptr7;
  uint8_t* byte_ptr8;
  int32_t blocks_for_w;
  uint8_t* byte_ptr9;
  uint8_t* byte_ptr10;

  block.dim3_x = 8;
  block.dim3_y = 32;
  block.dim3_z = 1;
  grid_blocks_x = num_blocks(n, block.dim3_x);
  grid_blocks_y = num_blocks(n, block.dim3_y);
  grid.dim3_x = grid_blocks_x;
  grid.dim3_y = grid_blocks_y;
  grid.dim3_z = 1;
  memcpy(((uint8_t*)(&grid_tmp)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_tmp4)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_tmp_coerce)), ((uint8_t*)(&grid_tmp)), 12);
  memcpy(((uint8_t*)(&block_tmp4_coerce)), ((uint8_t*)(&block_tmp4)), 12);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < grid_blocks_x;   i = i + 1){
for(int32_t j = 0; j < grid_blocks_y;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_A(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, grid_blocks_x, grid_blocks_y, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  blocks_for_x = num_blocks(n, 256);
  grid_tmp6.dim3_x = blocks_for_x;
  grid_tmp6.dim3_y = 1;
  grid_tmp6.dim3_z = 1;
  block_tmp8.dim3_x = 256;
  block_tmp8.dim3_y = 1;
  block_tmp8.dim3_z = 1;
  memcpy(((uint8_t*)(&grid_tmp6_coerce)), ((uint8_t*)(&grid_tmp6)), 12);
  memcpy(((uint8_t*)(&block_tmp8_coerce)), ((uint8_t*)(&block_tmp8)), 12);
// INSERT COMMENT LOOP: kernel::header.022
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < blocks_for_x;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_x(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, blocks_for_x, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  blocks_for_y = num_blocks(n, 256);
  grid_tmp13.dim3_x = blocks_for_y;
  grid_tmp13.dim3_y = 1;
  grid_tmp13.dim3_z = 1;
  block_tmp15.dim3_x = 256;
  block_tmp15.dim3_y = 1;
  block_tmp15.dim3_z = 1;
  memcpy(((uint8_t*)(&grid_tmp13_coerce)), ((uint8_t*)(&grid_tmp13)), 12);
  memcpy(((uint8_t*)(&block_tmp15_coerce)), ((uint8_t*)(&block_tmp15)), 12);
// INSERT COMMENT LOOP: kernel::header.032
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < blocks_for_y;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_y(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, blocks_for_y, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  blocks_for_w = num_blocks(n, 256);
  grid_tmp20.dim3_x = blocks_for_w;
  grid_tmp20.dim3_y = 1;
  grid_tmp20.dim3_z = 1;
  block_tmp22.dim3_x = 256;
  block_tmp22.dim3_y = 1;
  block_tmp22.dim3_z = 1;
  memcpy(((uint8_t*)(&grid_tmp20_coerce)), ((uint8_t*)(&grid_tmp20)), 12);
  memcpy(((uint8_t*)(&block_tmp22_coerce)), ((uint8_t*)(&block_tmp22)), 12);
// INSERT COMMENT LOOP: kernel::header.042
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < blocks_for_w;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_w(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, blocks_for_w, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t n, double* w) {
  int64_t i;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  fprintf(stderr, (double_format_str), w[i]);
  if (i % 20 == 0) { // IFELSE MARKER: for.body IF
  fprintf(stderr, (newline_str));
  }
}
  return;
}
