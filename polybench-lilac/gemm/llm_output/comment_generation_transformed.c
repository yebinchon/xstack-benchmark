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
struct dim3_t;
struct dim3_packed_t;

/* Function definitions */

/* Types Definitions */
struct uint8_array_1_t {
  uint8_t array[1];
};
struct uint8_array_20_t {
  uint8_t array[20];
};
struct IOFile {
  uint32_t flags;
  uint8_t* read_ptr;
  uint8_t* read_end;
  uint8_t* write_base;
  uint8_t* write_ptr;
  uint8_t* write_end;
  uint8_t* buf_base;
  uint8_t* buf_end;
  uint8_t* save_base;
  uint8_t* save_end;
  uint8_t* backup_base;
  uint8_t* backup_end;
  void* cookie;
  struct IOFile* prev;
  uint32_t fileno;
  uint32_t mode;
  uint64_t offset;
  uint16_t orientation;
  uint8_t unget_count;
  uint8_t small_buffer[1];
  uint8_t* tmp_buffer;
  uint64_t sys_offset;
  void* lock;
  void* vtable;
  struct IOFile* next;
  uint8_t* alloc_buffer;
  uint64_t cookie_size;
  uint32_t line_count;
  uint8_t name[20];
};
struct dim3_t {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct dim3_packed_t {
  uint64_t l_unnamed_1_field0;
  uint32_t l_unnamed_1_field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_dev(uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t print_fmt_double[8] = { "%0.2lf " };
uint8_t print_fmt_newline[2] = { "\n" };


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
static __forceinline uint32_t llvm_udiv_u32(uint32_t a, uint32_t b) {
  uint32_t r = a / b;
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
  int32_t ni;
  int32_t nj;
  int32_t nk;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;
  int32_t unused_call32;
  int32_t unused_call44;

// Parse command-line arguments (dump_code, ni, nj, nk) and allocate memory for A (ni * nk doubles); these values configure problem size and behavior
  dump_code = atoi(argv[1]);
  ni = atoi(argv[2]);
  nj = atoi(argv[3]);
  nk = atoi(argv[4]);
  A = malloc(ni * nk * 8);
  B = malloc(nk * nj * 8);
  C = malloc(ni * nj * 8);
  init_array(ni, nj, nk, ((double*)C), ((double*)A), ((double*)B));
;
  kernel(ni, nj, nk, 32412, 2123, ((double*)C), ((double*)A), ((double*)B));
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(ni, nj, ((double*)C));
  }
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
  return 0;
}
// Initialize the arrays A, B, and C with deterministic values based on their indices so the computation has a known starting state
void init_array(uint32_t ni, uint32_t nj, uint32_t nk, double* C, double* A, double* B) {
  int64_t i;
  int64_t j;

// Iterate over k (0..nk-1) and j (0..nj-1) to visit every element of B (nk x nj) and compute its linear index idx_B for access::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  __auto_type idx_C = i * (int64_t)nj + j;
  __auto_type i_double = (double)i;
  __auto_type j_double = (double)j;
  __auto_type ij_product = i_double * j_double;
  __auto_type ni_double = (double)ni;
  __auto_type c_val = ij_product / ni_double;
  C[(i * nj + j)] = c_val;
}
}
// Iterate over k (0..nk-1) and j (0..nj-1) to visit every element of B (nk x nj) and compute its linear index idx_B for access::for.cond10
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nk;   j = j + 1){
  __auto_type idx_A = i * (int64_t)nk + j;
  __auto_type i_double_a = (double)i;
  __auto_type j_double_a = (double)j;
  __auto_type ij_product_a = i_double_a * j_double_a;
  __auto_type ni_double_a = (double)ni;
  __auto_type a_val = ij_product_a / ni_double_a;
  A[(i * nk + j)] = a_val;
}
}
// Iterate over k (0..nk-1) and j (0..nj-1) to visit every element of B (nk x nj) and compute its linear index idx_B for access::for.cond31
for(int64_t i = 0; i < nk;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  __auto_type idx_B = i * (int64_t)nj + j;
  __auto_type i_double_b = (double)i;
  __auto_type j_double_b = (double)j;
  __auto_type ij_product_b = i_double_b * j_double_b;
  __auto_type ni_double_b = (double)ni;
  __auto_type b_val = ij_product_b / ni_double_b;
  B[(i * nj + j)] = b_val;
}
}
  return;
}
// GPU-style per-thread kernel: compute the global element indices i,j from block/thread ids, perform the dot-product over k to update C[i,j] as alpha * sum_k(A[i,k]*B[k,j]) + beta*C[i,j], with bounds checks
void kernel_dev(uint32_t ni, uint32_t nj, uint32_t nk, double alpha, double beta, double* C, double* A, double* B, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;
  double dot;
  int64_t k;

// Compute the global element coordinates i,j from block and thread indices; check bounds so only valid matrix positions execute, then initialize the accumulator 'dot' with beta * C[i,j]
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < ni) { // IFELSE MARKER: entry IF
  if (j < nj) { // IFELSE MARKER: land.lhs.true IF
  dot = (C[(i * nj + j)] * beta);
for(int64_t k = 0; k < nk;   k = k + 1){
  dot = (dot + ((alpha * A[(i * nk + k)]) * B[(k * nj + j)]));
}
  C[(i * nj + j)] = dot;
  }
  }
  return;
}
// Compute the number of blocks required to cover 'num' elements with blocks of size 'factor' (ceiling division)
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// Host-side kernel launcher: configure grid and block dimensions and orchestrate parallel execution of the device kernel over the matrix tiles
void kernel(uint32_t ni, uint32_t nj, uint32_t nk, double alpha, double beta, double* C, double* A, double* B) {
  struct dim3_t block;    /* Address-exposed local */
  struct dim3_t grid;    /* Address-exposed local */
  struct dim3_t grid_copy;    /* Address-exposed local */
  struct dim3_t block_copy;    /* Address-exposed local */
  struct dim3_packed_t grid_packed;    /* Address-exposed local */
  struct dim3_packed_t block_packed;    /* Address-exposed local */
  uint32_t block_x_size;
  int32_t num_blocks_x;
  int32_t num_blocks_y;
  uint8_t* byte_ptr1;
  uint8_t* byte_ptr2;
  uint8_t* byte_ptr3;
  uint8_t* byte_ptr4;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;

  block_x_size = (256 / 32);
  block.x = block_x_size;
  block.y = 32;
  block.z = 1;
  num_blocks_x = num_blocks(ni, block.x);
  num_blocks_y = num_blocks(nj, block.y);
  grid.x = num_blocks_x;
  grid.y = num_blocks_y;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_copy)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_copy)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_packed)), ((uint8_t*)(&grid_copy)), 12);
  memcpy(((uint8_t*)(&block_packed)), ((uint8_t*)(&block_copy)), 12);
// Parallelize over the 2D block grid: for each block index (i,j) in the x and y block dimensions run the block-level work (collapse(2) distributes both loops)::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < num_blocks_x;   i = i + 1){
for(int32_t j = 0; j < num_blocks_y;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_dev(ni, nj, nk, alpha, beta, C, A, B, num_blocks_x, num_blocks_y, 1, block_x_size, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  return;
}
// Print the contents of matrix C (size ni x nj) to stderr in row-major order using the specified formatting
void print_array(uint32_t ni, uint32_t nj, double* C) {
  int64_t i;
  int64_t j;
  int32_t tmp_index;

// Loop over all rows i and columns j of C and print each element C[i*nj + j] in row-major order::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  fprintf(stderr, (print_fmt_double), C[(i * nj + j)]);
  if ((int)(i * ni + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (print_fmt_newline));
  }
}
}
  fprintf(stderr, (print_fmt_newline));
}
