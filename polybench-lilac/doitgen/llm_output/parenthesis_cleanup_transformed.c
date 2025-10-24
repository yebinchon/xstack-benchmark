/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define DOUBLE_SIZE_BYTES 8
#define BLOCK_DIM_X 1
#define BLOCK_DIM_Y 8
#define BLOCK_DIM_Z 32
#define DIM3_STRUCT_SIZE_BYTES 12
#define PRINT_ELEM_FMT_LEN 8
#define NEWLINE_FMT_LEN 2
#define DUMP_CODE_PRINT 1
#define ARG_IDX_DUMP_CODE 1
#define ARG_IDX_NR 2
#define ARG_IDX_NQ 3
#define ARG_IDX_NP 4

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
struct Uint8Array1 {
  uint8_t array[1];
};
struct Uint8Array20 {
  uint8_t array[20];
};
struct Dim3 {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct Dim3Coerce {
  uint64_t dim0;
  uint32_t dim1;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_sum(uint32_t, uint32_t, uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t print_double_format[PRINT_ELEM_FMT_LEN] = { "%0.2lf " };
uint8_t newline_string[NEWLINE_FMT_LEN] = { "\n" };


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
  int32_t nr;
  int32_t nq;
  int32_t np;
  uint8_t* A;
  uint8_t* sum;
  uint8_t* C4;

// INSERT COMMENT IFELSE: main::entry
  dump_code = atoi(argv[ARG_IDX_DUMP_CODE]);
  nr = atoi(argv[ARG_IDX_NR]);
  nq = atoi(argv[ARG_IDX_NQ]);
  np = atoi(argv[ARG_IDX_NP]);
  A = malloc(nr * nq * np * DOUBLE_SIZE_BYTES);
  sum = malloc(nr * nq * np * DOUBLE_SIZE_BYTES);
  C4 = malloc(np * np * DOUBLE_SIZE_BYTES);
  init_array(nr, nq, np, (double*)A, (double*)C4);
;
  kernel(nr, nq, np, (double*)A, (double*)C4, (double*)sum);
;
  if (dump_code == DUMP_CODE_PRINT) { // IFELSE MARKER: entry IF
print_array(nr, nq, np, (double*)sum);
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)sum)));
free(((uint8_t*)((double*)C4)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t nr, uint32_t nq, uint32_t np, double* A, double* C4) {
  int64_t i;
  int64_t j;
  int64_t k;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < nr;   i = i + 1){
for(int64_t j = 0; j < nq;   j = j + 1){
for(int64_t k = 0; k < np;   k = k + 1){
  A[((i * np * nq + j * nq) + k)] = ((((double)(i) * (double)(j)) + (double)(k)) / (double)(np));
}
}
}
// INSERT COMMENT LOOP: init_array::for.cond21
for(int64_t i = 0; i < np;   i = i + 1){
for(int64_t j = 0; j < np;   j = j + 1){
  C4[(i * np + j)] = (((double)(i) * (double)(j)) / (double)(np));
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_sum
void kernel_sum(uint32_t nr, uint32_t nq, uint32_t np, double* A, double* C4, double* sum, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t r;
  int32_t q;
  int32_t p;
  int64_t s;
  double dot;

// INSERT COMMENT IFELSE: kernel_sum::entry
  r = blockDim_x * blockIdx_x + threadIdx_x;
  q = blockDim_y * blockIdx_y + threadIdx_y;
  p = blockDim_z * blockIdx_z + threadIdx_z;
  if (r < nr && q < nq) {
if (p < np) { // IFELSE MARKER: land.lhs.true14 IF
int rq_index0 = r * nq + q;
int rq_times_np0 = rq_index0 * np;
int rqp_index0 = rq_times_np0 + p;
sum[((r * nq + q) * np + p)] = 0;
dot = 0;
for(int64_t s = 0; s < np;   s = s + 1){
int rq_index1 = r * nq + q;
int rq_times_np1 = rq_index1 * np;
int rqs_index = rq_times_np1 + s;
int sp_index = s * np + p;
double a_val = A[rqs_index];
double c4_val = C4[sp_index];
double prod = a_val * c4_val;
double new_dot = dot + prod;
dot = new_dot;
}
int rq_index2 = r * nq + q;
int rq_times_np2 = rq_index2 * np;
int rqp_index1 = rq_times_np2 + p;
sum[((r * nq + q) * np + p)] = dot;
}
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t nr, uint32_t nq, uint32_t np, double* A, double* C4, double* sum) {
  struct Dim3 block;    /* Address-exposed local */
  struct Dim3 grid;    /* Address-exposed local */
  struct Dim3 grid_tmp;    /* Address-exposed local */
  struct Dim3 block_tmp;    /* Address-exposed local */
  struct Dim3Coerce grid_coerce;    /* Address-exposed local */
  struct Dim3Coerce block_coerce;    /* Address-exposed local */
  int32_t grid_blocks_x;
  int32_t grid_blocks_y;
  int32_t grid_blocks_z;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

  block.x = BLOCK_DIM_X;
  block.y = BLOCK_DIM_Y;
  block.z = BLOCK_DIM_Z;
  grid_blocks_x = num_blocks(nr, block.x);
  grid_blocks_y = num_blocks(nq, block.y);
  grid_blocks_z = num_blocks(np, block.z);
  grid.x = grid_blocks_x;
  grid.y = grid_blocks_y;
  grid.z = grid_blocks_z;
  memcpy(((uint8_t*)(&grid_tmp)), ((uint8_t*)(&grid)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&block_tmp)), ((uint8_t*)(&block)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&grid_coerce)), ((uint8_t*)(&grid_tmp)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&block_coerce)), ((uint8_t*)(&block_tmp)), DIM3_STRUCT_SIZE_BYTES);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < grid_blocks_x;   i = i + 1){
for(int32_t j = 0; j < grid_blocks_y;   j = j + 1){
for(int32_t k = 0; k < grid_blocks_z;   k = k + 1){
for(int32_t l = 0; l < BLOCK_DIM_Y;   l = l + 1){
for(int32_t m = 0; m < BLOCK_DIM_Z;   m = m + 1){
kernel_sum(nr, nq, np, A, C4, sum, grid_blocks_x, grid_blocks_y, grid_blocks_z, BLOCK_DIM_X, BLOCK_DIM_Y, BLOCK_DIM_Z, i, j, k, 0, l, m);
}
}
}
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t nr, uint32_t nq, uint32_t np, double* A) {
  int64_t i;
  int64_t j;
  int64_t k;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < nr;   i = i + 1){
for(int64_t j = 0; j < nq;   j = j + 1){
for(int64_t k = 0; k < np;   k = k + 1){
  fprintf(stderr, print_double_format, A[((i * nq * np + j * nq) + k)]);
  if (i % 20 == 0) { // IFELSE MARKER: for.body6 IF
  fprintf(stderr, newline_string);
  }
}
}
}
  fprintf(stderr, newline_string);
}
