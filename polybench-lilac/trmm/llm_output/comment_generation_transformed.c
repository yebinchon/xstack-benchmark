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
struct dim3_packed;

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
  uint8_t* read_ptr;
  uint8_t* write_ptr;
  uint8_t* read_end;
  uint8_t* write_end;
  uint8_t* base_ptr;
  uint8_t* end_ptr;
  uint8_t* aux_buf;
  uint8_t* tmp_buf;
  uint8_t* lock_ptr;
  uint8_t* cookie_ptr;
  uint8_t* close_func_ptr;
  void* cookie;
  struct IOFile* next;
  uint32_t fd;
  uint32_t error;
  uint64_t offset;
  uint16_t mode;
  uint8_t ungetc_buf;
  uint8_t ungetc_storage[1];
  uint8_t* high_buf;
  uint64_t inode;
  void* userdata;
  void* vtable;
  struct IOFile* prev;
  uint8_t* name_buf;
  uint64_t timestamp;
  uint32_t refcount;
  uint8_t padding[20];
};
struct dim3_t {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct dim3_packed {
  uint64_t batch;
  uint32_t count;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, double, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_contract(uint32_t, uint32_t, double, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_alpha(uint32_t, uint32_t, double, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t print_format_str[8] = { "%0.2lf " };
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
  int32_t call22_ret;
  int32_t call30_ret;

// Parse command-line arguments for dump_code, n and m, then allocate memory for arrays A and B (space for n*m doubles each) without additional validation.
  n = atoi(argv[2]);
  m = atoi(argv[3]);
  dump_code = atoi(argv[1]);
  A = malloc(n * m * 8);
  B = malloc(m * n * 8);
  init_array(n, m, (&alpha), ((double*)A), ((double*)B));
;
  kernel(n, m, alpha, ((double*)A), ((double*)B));
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(m, n, ((double*)B));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
  return 0;
}
// Initialize scalar alpha and populate matrices A (m x m) and B (m x n) with deterministic values based on indices to prepare data for the computation.
void init_array(uint32_t n, uint32_t m, double* alpha, double* A, double* B) {
  int64_t i;
  int64_t j;
  uint32_t unused_uint;

  *alpha = 32412;
// Iterate over all i (0..n-1) and j (0..m-1) positions to compute a linear index and initialize corresponding entries of A and B.::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < m;   j = j + 1){
  __auto_type idx_a = i * (int64_t)m + j;
  __auto_type di = (double)i;
  __auto_type dj = (double)j;
  __auto_type prod_ij = di * dj;
  __auto_type dm = (double)m;
  __auto_type a_val = prod_ij / dm;
  A[(i * m + j)] = a_val;
  __auto_type idx_b = j * (int64_t)n + j;
  __auto_type di_b = (double)i;
  __auto_type dj_b = (double)j;
  __auto_type prod_ij_b = di_b * dj_b;
  __auto_type dn = (double)n;
  __auto_type b_val = prod_ij_b / dn;
  B[(j * n + j)] = b_val;
}
}
  return;
}
// Return the number of blocks needed to cover 'num' items with block size 'factor' using ceiling division.
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// GPU-style kernel: each thread maps to a global column j and updates B(:,j) by accumulating A[k,i] * B[k,j] for k from i to m-1, performing a contraction over k for each row i.
void kernel_contract(uint32_t n, uint32_t m, double alpha, double* B, double* A, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t j;
  int64_t i;
  uint32_t indvars_2_iv;
  uint64_t k;

// Compute the global column index j for this thread; if j is within [0,n) perform nested loops over i and k to accumulate contributions A[k,i]*B[k,j] into B[i,j] (k from i to m-1).
  j = blockDim_x * blockIdx_x + threadIdx_x;
  if (j < n) { // IFELSE MARKER: entry IF
for(int64_t i = 0; i < m;   i = i + 1){
for(int64_t k = i; k < m;   k = k + 1){
  B[(i * n + j)] = (B[(i * n + j)] + (A[(k * m + i)] * B[(k * n + j)]));
}
}
  }
  return;
}
// GPU-style kernel: compute global (i,j) from block/thread indices and, if in bounds, scale the single B[i,j] element by the scalar alpha.
void kernel_alpha(uint32_t n, uint32_t m, double alpha, double* B, double* A, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;

// Compute global indices (i,j) from block/thread coordinates; if both indices are within bounds, multiply the element B[i*n + j] by alpha.
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < m) { // IFELSE MARKER: entry IF
  if (j < n) { // IFELSE MARKER: land.lhs.true IF
  B[(i * n + j)] = (B[(i * n + j)] * alpha);
  }
  }
  return;
}
// Host wrapper that configures grid/block dimensions and launches/emulates the two GPU kernels (alpha scaling and contraction), using OpenMP to parallelize on the CPU.
void kernel(uint32_t n, uint32_t m, double alpha, double* A, double* B) {
  struct dim3_t grid_tmp1;    /* Address-exposed local */
  struct dim3_t block_tmp1;    /* Address-exposed local */
  struct dim3_packed grid_tmp1_packed;    /* Address-exposed local */
  struct dim3_packed block_tmp1_packed;    /* Address-exposed local */
  struct dim3_t block;    /* Address-exposed local */
  struct dim3_t grid;    /* Address-exposed local */
  struct dim3_t grid_tmp2;    /* Address-exposed local */
  struct dim3_t block_tmp2;    /* Address-exposed local */
  struct dim3_packed grid_tmp2_packed;    /* Address-exposed local */
  struct dim3_packed block_tmp2_packed;    /* Address-exposed local */
  int32_t blocks_n_256;
  uint8_t* buf_ptr1;
  uint8_t* buf_ptr2;
  uint32_t i;
  uint32_t j;
  int32_t blocks_m_blockx;
  int32_t blocks_n_blocky;
  uint8_t* buf_ptr3;
  uint8_t* buf_ptr4;
  uint8_t* buf_ptr5;
  uint8_t* buf_ptr6;
  uint32_t k;
  uint32_t l;

  blocks_n_256 = num_blocks(n, 256);
  grid_tmp1.x = blocks_n_256;
  grid_tmp1.y = 1;
  grid_tmp1.z = 1;
  block_tmp1.x = 256;
  block_tmp1.y = 1;
  block_tmp1.z = 1;
  memcpy(((uint8_t*)(&grid_tmp1_packed)), ((uint8_t*)(&grid_tmp1)), 12);
  memcpy(((uint8_t*)(&block_tmp1_packed)), ((uint8_t*)(&block_tmp1)), 12);
// INSERT COMMENT LOOP: kernel::header.010
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < blocks_n_256;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_contract(n, m, alpha, B, A, blocks_n_256, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  block.x = 8;
  block.y = 32;
  block.z = 1;
  blocks_m_blockx = num_blocks(m, block.x);
  blocks_n_blocky = num_blocks(n, block.y);
  grid.x = blocks_m_blockx;
  grid.y = blocks_n_blocky;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_tmp2)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_tmp2)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_tmp2_packed)), ((uint8_t*)(&grid_tmp2)), 12);
  memcpy(((uint8_t*)(&block_tmp2_packed)), ((uint8_t*)(&block_tmp2)), 12);
// INSERT COMMENT LOOP: kernel::header.0
// Parallel over 2D block-grid coordinates: iterate all block indices in the x/y dimensions (collapsed) to emulate launching work for each block.
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_alpha(n, m, alpha, B, A, blocks_m_blockx, blocks_n_blocky, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  return;
}
// Print the matrix B with m rows and n columns to stderr in row-major order using the predefined format string for verification/debugging.
void print_array(uint32_t m, uint32_t n, double* B) {
  int64_t i;
  int64_t j;
  int32_t temp_i32;

// Loop over rows i and columns j to print each element B[i*n + j] in row-major order to stderr using the format string.::for.cond
for(int64_t i = 0; i < m;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  fprintf(stderr, (print_format_str), B[(i * n + j)]);
  if ((int)(i * n + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (newline_str));
  }
}
}
  fprintf(stderr, (newline_str));
}
