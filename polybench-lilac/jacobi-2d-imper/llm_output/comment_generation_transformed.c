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
struct StdFile;
struct Dim3;
struct UInt64UInt32Pair;

/* Function definitions */

/* Types Definitions */
struct UInt8Array1 {
  uint8_t array[1];
};
struct UInt8Array20 {
  uint8_t array[20];
};
struct StdFile {
  uint32_t batch_flags;
  uint8_t* batch_buf_base;
  uint8_t* batch_buf_pos;
  uint8_t* batch_buf_end;
  uint8_t* batch_buf_read;
  uint8_t* batch_buf_write;
  uint8_t* batch_buf_aux0;
  uint8_t* batch_buf_aux1;
  uint8_t* batch_buf_aux2;
  uint8_t* batch_buf_aux3;
  uint8_t* batch_buf_aux4;
  uint8_t* batch_buf_aux5;
  void* batch_cookie;
  struct StdFile* batch_prev;
  uint32_t batch_u32_14;
  uint32_t batch_u32_15;
  uint64_t batch_u64_16;
  uint16_t batch_u16_17;
  uint8_t batch_u8_18;
  uint8_t batch_smallbuf[1];
  uint8_t* batch_buf_extra;
  uint64_t batch_u64_21;
  void* batch_lock;
  void* batch_cookie2;
  struct StdFile* batch_next;
  uint8_t* batch_buf_dynamic;
  uint64_t batch_u64_26;
  uint32_t batch_u32_27;
  uint8_t batch_padding[20];
};
struct Dim3 {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct UInt64UInt32Pair {
  uint64_t first64;
  uint32_t second32;
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
uint32_t cudaFree(uint8_t*);
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_stencil(uint32_t, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t print_format_double[8] = { "%0.2lf " };
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
  int32_t n;
  int32_t tsteps;
  uint8_t* A;
  uint8_t* B;
  int32_t unused_call22;
  int32_t unused_call30;

// Parse command-line arguments for dump_code, n and tsteps, then allocate two n-by-n double buffers A and B (n*n*8 bytes each)
  dump_code = atoi(argv[1]);
  n = atoi(argv[2]);
  tsteps = atoi(argv[3]);
  A = malloc(n * n * 8);
  B = malloc(n * n * 8);
  init_array(n, ((double*)A), ((double*)B));
;
  kernel(tsteps, n, ((double*)A), ((double*)B));
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(n, ((double*)A));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
  return 0;
}
// Initialize the n-by-n arrays A and B: iterate over rows and columns to set up initial values for the computation
void init_array(uint32_t n, double* A, double* B) {
  int64_t i;
  uint64_t j;

// Iterate over all row (i) and column (j) indices of the n-by-n grid to compute the row-major element index used for initialization::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  __auto_type index_A = i * n + j;
  __auto_type i_double = (double)i;
  __auto_type j_plus_2_double = (double)(j + 2);
  __auto_type prod_i_jp2 = i_double * j_plus_2_double;
  __auto_type prod_plus_2 = prod_i_jp2 + 2.0;
  __auto_type A_value = prod_plus_2 / (double)n;
  A[(i * n + j)] = A_value;
  __auto_type index_B = i * n + j;
  __auto_type i_double2 = (double)i;
  __auto_type j_plus_3_double = (double)(j + 3);
  __auto_type prod_i_jp3 = i_double2 * j_plus_3_double;
  __auto_type prod_plus_3 = prod_i_jp3 + 3.0;
  __auto_type B_value = prod_plus_3 / (double)n;
  B[(i * n + j)] = B_value;
}
}
  return;
}
// Return the number of blocks required to cover 'num' items with blocks of size 'factor' (ceiling division)
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// Compute a 5-point stencil for interior grid points: use block/grid/thread indices to get global i,j and update B from neighboring values in A
void kernel_stencil(uint32_t n, double* A, double* B, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;

// Compute global indices i,j from block/thread coordinates; if they are interior points (not on the boundary), compute the average of the center and its four neighbors from A and store it into B
  i = blockDim_x * blockIdx_x + threadIdx_x + 1;
  j = blockDim_y * blockIdx_y + threadIdx_y + 1;
  if (i < (n - 1)) { // IFELSE MARKER: entry IF
  if (j < (n - 1)) { // IFELSE MARKER: land.lhs.true IF
  B[(i * n + j)] = (((((A[(i * n + j)] + A[((i * n + j) - 1)]) + A[((i * n + 1) + j)]) + A[((1 + i) * n + j)]) + A[((i - 1) * n + j)]) / 5);
  }
  }
  return;
}
// Manage and execute the time-stepping stencil kernel: configure block/grid dimensions and run the stencil for the given number of time steps, swapping buffers as needed
void kernel(uint32_t tsteps, uint32_t n, double* A, double* B) {
  struct Dim3 block;    /* Address-exposed local */
  struct Dim3 grid;    /* Address-exposed local */
  struct Dim3 grid_copy;    /* Address-exposed local */
  struct Dim3 block_copy;    /* Address-exposed local */
  struct UInt64UInt32Pair grid_pair_coerce;    /* Address-exposed local */
  struct UInt64UInt32Pair block_pair_coerce;    /* Address-exposed local */
  struct Dim3 grid_copy2;    /* Address-exposed local */
  struct Dim3 block_copy2;    /* Address-exposed local */
  struct UInt64UInt32Pair grid_pair_coerce2;    /* Address-exposed local */
  struct UInt64UInt32Pair block_pair_coerce2;    /* Address-exposed local */
  int32_t t;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

// Time-stepping loop: perform one stencil iteration per timestep (1..tsteps), configuring block dimensions and invoking the stencil computation each iteration::for.cond
for(int32_t t = 1; t <= tsteps;   t = t + 1){
  block.x = 8;
  block.y = 32;
  block.z = 1;
  uint32_t num_blocks_x = num_blocks((n - 2), block.x);
  uint32_t num_blocks_y = num_blocks((n - 2), block.y);
  grid.x = num_blocks_x;
  grid.y = num_blocks_y;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_copy)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_copy)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_pair_coerce)), ((uint8_t*)(&grid_copy)), 12);
  memcpy(((uint8_t*)(&block_pair_coerce)), ((uint8_t*)(&block_copy)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < num_blocks_x;   j = j + 1){
for(int32_t k = 0; k < num_blocks_y;   k = k + 1){
for(int32_t l = 0; l < 8;   l = l + 1){
for(int32_t m = 0; m < 32;   m = m + 1){
kernel_stencil(n, A, B, num_blocks_x, num_blocks_y, 1, 8, 32, 1, j, k, 0, l, m, 0);
}
}
}
}
  memcpy(((uint8_t*)(&grid_copy2)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_copy2)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_pair_coerce2)), ((uint8_t*)(&grid_copy2)), 12);
  memcpy(((uint8_t*)(&block_pair_coerce2)), ((uint8_t*)(&block_copy2)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < num_blocks_x;   j = j + 1){
for(int32_t k = 0; k < num_blocks_y;   k = k + 1){
for(int32_t l = 0; l < 8;   l = l + 1){
for(int32_t m = 0; m < 32;   m = m + 1){
kernel_stencil(n, B, A, num_blocks_x, num_blocks_y, 1, 8, 32, 1, j, k, 0, l, m, 0);
}
}
}
}
}
  return;
}
// Print the n-by-n array A to stderr in row-major order using the configured floating-point format
void print_array(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;
  int32_t temp_i32;

// Iterate over every element of the n-by-n array and print each value (row-major order) to stderr::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  fprintf(stderr, (print_format_double), A[(i * n + j)]);
  if ((int)(i * n + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (print_newline));
  }
}
}
  fprintf(stderr, (print_newline));
}
