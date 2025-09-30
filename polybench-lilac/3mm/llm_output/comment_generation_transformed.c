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
struct io_file_t;
struct dim3_t;
struct packed_dim3_t;

/* Function definitions */

/* Types Definitions */
struct uint8_array1_t {
  uint8_t array[1];
};
struct uint8_array_20_t {
  uint8_t array[20];
};
struct io_file_t {
  uint32_t flags;
  uint8_t* read_ptr;
  uint8_t* write_ptr;
  uint8_t* buf_base;
  uint8_t* buf_end;
  uint8_t* save_base;
  uint8_t* save_end;
  uint8_t* marker;
  uint8_t* chain;
  uint8_t* lock_ptr;
  uint8_t* cookie_ptr;
  uint8_t* cookie_io_functions;
  void* data_ptr;
  struct io_file_t* next_file;
  uint32_t file_flags2;
  uint32_t orientation;
  uint64_t read_count;
  uint16_t mode;
  uint8_t ungetc_char;
  uint8_t small_buffer[1];
  uint8_t* wide_data_ptr;
  uint64_t lock_owner;
  void* codecvt_ptr;
  void* locale_ptr;
  struct io_file_t* prev_file;
  uint8_t* buffer2_ptr;
  uint64_t cookie_size;
  uint32_t reserved32;
  uint8_t padding20[20];
};
struct dim3_t {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct packed_dim3_t {
  uint64_t packed_dim3_t_field0;
  uint32_t packed_dim3_t_field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_A_mul_B(uint32_t, uint32_t, uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t double_fmt_space[8] = { "%0.2lf " };
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
  int32_t nl;
  int32_t nm;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;
  uint8_t* D;
  uint8_t* E;
  uint8_t* F;
  uint8_t* G;
  int32_t tmp_call68;
  int32_t tmp_call96;

// Parse command-line arguments: set dump_code and problem sizes ni, nj, nk, nl from argv[1..5]
  dump_code = atoi(argv[1]);
  ni = atoi(argv[2]);
  nj = atoi(argv[3]);
  nk = atoi(argv[4]);
  nl = atoi(argv[5]);
  nm = atoi(argv[6]);
  A = malloc(ni * nk * 8);
  B = malloc(nk * nj * 8);
  C = malloc(nj * nm * 8);
  D = malloc(nm * nl * 8);
  E = malloc(ni * nj * 8);
  F = malloc(nj * nl * 8);
  G = malloc(ni * nl * 8);
  init_array(ni, nj, nk, nl, nm, ((double*)A), ((double*)B), ((double*)C), ((double*)D), ((double*)E), ((double*)F), ((double*)G));
;
  kernel(ni, nj, nk, nl, nm, ((double*)E), ((double*)A), ((double*)B), ((double*)F), ((double*)C), ((double*)D), ((double*)G));
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(ni, nl, ((double*)G));
  }
free(((uint8_t*)((double*)E)));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
free(((uint8_t*)((double*)F)));
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)D)));
free(((uint8_t*)((double*)G)));
  return 0;
}
// Initialize arrays used by the computation; this function prepares data structures (e.g., zeroing G and setting initial values for A..F) for the main kernels
void init_array(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, uint32_t nm, double* A, double* B, double* C, double* D, double* E, double* F, double* G) {
  int64_t i;
  int64_t j;

// Iterate over all row (i) and column (j) indices of G and initialize each element to 0 to clear the output matrix before computation::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nk;   j = j + 1){
  __auto_type i_d = (double)i;
  __auto_type j_d = (double)j;
  __auto_type prod_i_j = i_d * j_d;
  __auto_type ni_d = (double)ni;
  __auto_type normalized_prod1 = prod_i_j / ni_d;
  __auto_type idx_a = i * ni + j;
  A[(i * ni + j)] = normalized_prod1;
}
}
// Iterate over all row (i) and column (j) indices of G and initialize each element to 0 to clear the output matrix before computation::for.cond10
for(int64_t i = 0; i < nk;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  __auto_type i_d2 = (double)i;
  __auto_type j_plus1 = j + 1;
  __auto_type j1_d = (double)j_plus1;
  __auto_type prod_i_j1 = i_d2 * j1_d;
  __auto_type nj_d = (double)nj;
  __auto_type normalized_prod2 = prod_i_j1 / nj_d;
  __auto_type idx_b = i * nk + j;
  B[(i * nk + j)] = normalized_prod2;
}
}
// Iterate over all row (i) and column (j) indices of G and initialize each element to 0 to clear the output matrix before computation::for.cond32
for(int64_t i = 0; i < nj;   i = i + 1){
for(int64_t j = 0; j < nm;   j = j + 1){
  __auto_type i_d3 = (double)i;
  __auto_type j_plus3 = j + 3;
  __auto_type j3_d = (double)j_plus3;
  __auto_type prod_i_j3 = i_d3 * j3_d;
  __auto_type nl_d = (double)nl;
  __auto_type normalized_prod3 = prod_i_j3 / nl_d;
  __auto_type idx_c = i * nj + j;
  C[(i * nj + j)] = normalized_prod3;
}
}
// Iterate over all row (i) and column (j) indices of G and initialize each element to 0 to clear the output matrix before computation::for.cond54
for(int64_t i = 0; i < nm;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  __auto_type i_d4 = (double)i;
  __auto_type j_plus2 = j + 2;
  __auto_type j2_d = (double)j_plus2;
  __auto_type prod_i_j2 = i_d4 * j2_d;
  __auto_type nk_d = (double)nk;
  __auto_type normalized_prod4 = prod_i_j2 / nk_d;
  __auto_type idx_d = i * nm + j;
  D[(i * nm + j)] = normalized_prod4;
}
}
// Iterate over all row (i) and column (j) indices of G and initialize each element to 0 to clear the output matrix before computation::for.cond76
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  E[(i * ni + j)] = 0;
}
}
// Iterate over all row (i) and column (j) indices of G and initialize each element to 0 to clear the output matrix before computation::for.cond92
for(int64_t i = 0; i < nj;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  F[(i * nj + j)] = 0;
}
}
// Iterate over all row (i) and column (j) indices of G and initialize each element to 0 to clear the output matrix before computation::for.cond108
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  G[(i * ni + j)] = 0;
}
}
  return;
}
// Compute the number of blocks required to cover 'num' items when grouping by 'factor' (ceiling division)
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// Per-thread/block kernel that computes one element of C as the dot product of row i of A and column j of B, using block/thread indices to map to global matrix coordinates
void kernel_A_mul_B(uint32_t ni, uint32_t nj, uint32_t nk, double* C, double* A, double* B, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;
  int64_t k;
  double dot;

// Compute global row (i) and column (j) indices from block and thread coordinates; if both indices fall within matrix bounds, initialize the dot-product accumulator for this thread
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < ni) { // IFELSE MARKER: entry IF
  if (j < nj) { // IFELSE MARKER: land.lhs.true IF
  dot = 0;
for(int64_t k = 0; k < nk;   k = k + 1){
  dot = (dot + (A[(i * nk + k)] * B[(k * nj + j)]));
}
  C[(i * nj + j)] = dot;
  }
  }
  return;
}
// Top-level kernel wrapper that sets up grid/block dimensions (dim3_t structs) and coordinates, then orchestrates the tiled/blocked parallel computation to produce G from input matrices
void kernel(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, uint32_t nm, double* E, double* A, double* B, double* F, double* C, double* D, double* G) {
  struct dim3_t block;    /* Address-exposed local */
  struct dim3_t grid;    /* Address-exposed local */
  struct dim3_t temp_grid_copy1;    /* Address-exposed local */
  struct dim3_t temp_block_copy1;    /* Address-exposed local */
  struct packed_dim3_t packed_grid_copy1;    /* Address-exposed local */
  struct packed_dim3_t packed_block_copy1;    /* Address-exposed local */
  struct dim3_t temp_grid_copy2;    /* Address-exposed local */
  struct dim3_t temp_block_copy2;    /* Address-exposed local */
  struct packed_dim3_t packed_grid_copy2;    /* Address-exposed local */
  struct packed_dim3_t packed_block_copy2;    /* Address-exposed local */
  struct dim3_t temp_grid_copy3;    /* Address-exposed local */
  struct dim3_t temp_block_copy3;    /* Address-exposed local */
  struct packed_dim3_t packed_grid_copy3;    /* Address-exposed local */
  struct packed_dim3_t packed_block_copy3;    /* Address-exposed local */
  uint32_t warps_per_block;
  int32_t num_blocks_ni_by_blockx;
  int32_t num_blocks_nj_by_blocky;
  uint8_t* byte_ptr1;
  uint8_t* byte_ptr2;
  uint8_t* byte_ptr3;
  uint8_t* byte_ptr4;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t num_blocks_nj_by_blockx;
  int32_t num_blocks_nl_by_blocky;
  uint8_t* byte_ptr5;
  uint8_t* byte_ptr6;
  uint8_t* byte_ptr7;
  uint8_t* byte_ptr8;
  int32_t num_blocks_ni_by_blockx_2;
  int32_t num_blocks_nl_by_blocky_2;
  uint8_t* byte_ptr9;
  uint8_t* byte_ptr10;
  uint8_t* byte_ptr11;
  uint8_t* byte_ptr12;

  warps_per_block = (256 / 32);
  block.x = warps_per_block;
  block.y = 32;
  block.z = 1;
  num_blocks_ni_by_blockx = num_blocks(ni, block.x);
  num_blocks_nj_by_blocky = num_blocks(nj, block.y);
  grid.x = num_blocks_ni_by_blockx;
  grid.y = num_blocks_nj_by_blocky;
  grid.z = 1;
  memcpy(((uint8_t*)(&temp_grid_copy1)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&temp_block_copy1)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&packed_grid_copy1)), ((uint8_t*)(&temp_grid_copy1)), 12);
  memcpy(((uint8_t*)(&packed_block_copy1)), ((uint8_t*)(&temp_block_copy1)), 12);
// Parallelized nested loop over block-grid indices i and j (both loops collapsed) to cover all tile/block positions for the computation; iterations correspond to block-level work dispatched via OpenMP::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < num_blocks_ni_by_blockx;   i = i + 1){
for(int32_t j = 0; j < num_blocks_nj_by_blocky;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_A_mul_B(ni, nj, nk, E, A, B, num_blocks_ni_by_blockx, num_blocks_nj_by_blocky, 1, warps_per_block, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  num_blocks_nj_by_blockx = num_blocks(nj, block.x);
  num_blocks_nl_by_blocky = num_blocks(nl, block.y);
  grid.x = num_blocks_nj_by_blockx;
  grid.y = num_blocks_nl_by_blocky;
  grid.z = 1;
  memcpy(((uint8_t*)(&temp_grid_copy2)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&temp_block_copy2)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&packed_grid_copy2)), ((uint8_t*)(&temp_grid_copy2)), 12);
  memcpy(((uint8_t*)(&packed_block_copy2)), ((uint8_t*)(&temp_block_copy2)), 12);
// Parallelized nested loop over block-grid indices i and j (both loops collapsed) to cover all tile/block positions for the computation; iterations correspond to block-level work dispatched via OpenMP::header.010
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < num_blocks_nj_by_blockx;   i = i + 1){
for(int32_t j = 0; j < num_blocks_nl_by_blocky;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_A_mul_B(nj, nl, nm, F, C, D, num_blocks_nj_by_blockx, num_blocks_nl_by_blocky, 1, warps_per_block, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  num_blocks_ni_by_blockx_2 = num_blocks(ni, block.x);
  num_blocks_nl_by_blocky_2 = num_blocks(nl, block.y);
  grid.x = num_blocks_ni_by_blockx_2;
  grid.y = num_blocks_nl_by_blocky_2;
  grid.z = 1;
  memcpy(((uint8_t*)(&temp_grid_copy3)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&temp_block_copy3)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&packed_grid_copy3)), ((uint8_t*)(&temp_grid_copy3)), 12);
  memcpy(((uint8_t*)(&packed_block_copy3)), ((uint8_t*)(&temp_block_copy3)), 12);
// Parallelized nested loop over block-grid indices i and j (both loops collapsed) to cover all tile/block positions for the computation; iterations correspond to block-level work dispatched via OpenMP::header.030
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < num_blocks_ni_by_blockx_2;   i = i + 1){
for(int32_t j = 0; j < num_blocks_nl_by_blocky_2;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_A_mul_B(ni, nl, nj, G, E, F, num_blocks_ni_by_blockx_2, num_blocks_nl_by_blocky_2, 1, warps_per_block, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  return;
}
// Print the matrix G (dimensions ni x nl) to stderr in a human-readable formatted form for verification or debugging
void print_array(uint32_t ni, uint32_t nl, double* G) {
  int64_t i;
  int64_t j;
  int32_t tmp_i32;

// Iterate over rows i and columns j of G and print each element in row-major order to stderr using the configured double format::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  fprintf(stderr, (double_fmt_space), G[(i * ni + j)]);
  if ((int)(i * ni + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (newline_str));
  }
}
}
  fprintf(stderr, (newline_str));
}
