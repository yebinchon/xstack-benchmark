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
struct dim3;
struct dim3_packed;

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
  uint8_t* buf_cur;
  uint8_t* buf_end;
  uint8_t* buf_start;
  uint8_t* buf_ptr1;
  uint8_t* buf_ptr2;
  uint8_t* buf_ptr3;
  uint8_t* buf_ptr4;
  uint8_t* buf_ptr5;
  uint8_t* buf_ptr6;
  uint8_t* buf_ptr7;
  uint8_t* buf_ptr8;
  void* cookie;
  struct IOFile* next;
  uint32_t fd;
  uint32_t lock;
  uint64_t offset;
  uint16_t mode;
  uint8_t small_flag;
  uint8_t small_buf[1];
  uint8_t* buf_alloc;
  uint64_t file_size;
  void* vtable;
  void* opaque;
  struct IOFile* prev;
  uint8_t* tmp_buf;
  uint64_t timestamp;
  uint32_t state;
  uint8_t id[20];
};
struct dim3 {
  uint32_t dim3_x;
  uint32_t dim3_y;
  uint32_t dim3_z;
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
void init_array(uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_div(uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_A(uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t double_print_format[8] = { "%0.2lf " };
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
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */
int main(int argc, char ** argv) {
  int32_t dump_code;
  int32_t n;
  uint8_t* A;
  int32_t unused_call12;
  int32_t unused_call16;

// Parse command-line args: set dump_code from argv[1], n from argv[2]; allocate n*n doubles for A and initialize it via init_array
  dump_code = atoi(argv[1]);
  n = atoi(argv[2]);
  A = malloc(n * n * 8);
  init_array(n, ((double*)A));
;
  kernel(n, ((double*)A));
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(n, ((double*)A));
  }
free(((uint8_t*)((double*)A)));
  return 0;
}
// Initialize an n-by-n matrix A in row-major order with values (i+1)*(j+1)/n where i and j are 0-based row/column indices
void init_array(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;

// Nested loops over rows i and columns j to populate each A[i*n + j] with the initialization formula ((i+1)*(j+1))/n::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  A[(i * n + j)] = (((double)((i + 1)) * (double)((j + 1))) / (double)(n));
}
}
  return;
}
// Compute the number of blocks required to cover 'num' items with blocks of size 'factor' (ceiling division)
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// Per-thread kernel that divides the matrix column element A[i,k] by the pivot A[k,k] for rows assigned to this thread using the provided grid/block/thread indices
void kernel_div(uint32_t n, double* A, uint32_t k, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;

// Compute the global row index i for this thread and, if it is within bounds, divide A[i,k] by the pivot A[k,k] to normalize the column entry
  i = blockDim_x * blockIdx_x + threadIdx_x + k + 1;
  if (i < n) { // IFELSE MARKER: entry IF
  A[(i * n + k)] = (A[(i * n + k)] / A[(k * n + k)]);
  }
  return;
}
// Per-thread kernel that will update row i of the matrix after division (used to perform A[i,j] -= A[i,k] * A[k,j] for assigned columns), with i and j determined from grid/block/thread indices
void kernel_A(uint32_t n, double* A, uint32_t k, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;

// Compute the global row index i using block and thread indices plus offset k+1 (preparing the thread to update row i in the matrix update kernel)
  __auto_type tmp1 = blockDim_x * blockIdx_x;
  __auto_type tmp2 = tmp1 + threadIdx_x;
  __auto_type tmp3 = k + 1;
  __auto_type tmp4 = tmp2 + tmp3;
  i = tmp4;
  __auto_type tmp5 = blockDim_y * blockIdx_y;
  __auto_type tmp6 = tmp5 + threadIdx_y;
  __auto_type tmp7 = k + 1;
  __auto_type tmp8 = tmp6 + tmp7;
  j = tmp8;
  if (i < n) { // IFELSE MARKER: entry IF
  if (j < n) { // IFELSE MARKER: land.lhs.true IF
  __auto_type tmp9 = i * n + j;
  __auto_type tmp10 = i * n + k;
  __auto_type tmp11 = k * n + j;
  __auto_type tmp12 = A[tmp9];
  __auto_type tmp13 = A[tmp10];
  __auto_type tmp14 = A[tmp11];
  __auto_type tmp15 = tmp13 * tmp14;
  __auto_type tmp16 = tmp12 - tmp15;
  A[(i * n + j)] = tmp16;
  }
  }
  return;
}
// Top-level driver that sets up grid/block dimensions and iterates kernel launches to perform the stepwise division and row-updates over the n-by-n matrix
void kernel(uint32_t n, double* A) {
  struct dim3 tmp_dim3_1;    /* Address-exposed local */
  struct dim3 tmp_dim3_2;    /* Address-exposed local */
  struct dim3_packed tmp_dim3_1_packed;    /* Address-exposed local */
  struct dim3_packed tmp_dim3_2_packed;    /* Address-exposed local */
  struct dim3 block;    /* Address-exposed local */
  struct dim3 grid;    /* Address-exposed local */
  struct dim3 tmp_grid_copy;    /* Address-exposed local */
  struct dim3 tmp_block_copy;    /* Address-exposed local */
  struct dim3_packed tmp_grid_copy_packed;    /* Address-exposed local */
  struct dim3_packed tmp_block_copy_packed;    /* Address-exposed local */
  int32_t iter;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

// Iterate 'iter' from 0 to n-2 to configure per-iteration kernel launches; compute the number of 256-sized blocks needed to cover remaining elements and set the grid x dimension::for.cond
for(int32_t iter = 0; iter < (n - 1);   iter = iter + 1){
  uint32_t num_blocks_256 = num_blocks((n - iter + 1), 256);
  tmp_dim3_1.dim3_x = num_blocks_256;
  tmp_dim3_1.dim3_y = 1;
  tmp_dim3_1.dim3_z = 1;
  tmp_dim3_2.dim3_x = 256;
  tmp_dim3_2.dim3_y = 1;
  tmp_dim3_2.dim3_z = 1;
  memcpy(((uint8_t*)(&tmp_dim3_1_packed)), ((uint8_t*)(&tmp_dim3_1)), 12);
  memcpy(((uint8_t*)(&tmp_dim3_2_packed)), ((uint8_t*)(&tmp_dim3_2)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < num_blocks_256;   j = j + 1){
for(int32_t k = 0; k < 256;   k = k + 1){
kernel_div(n, A, iter, num_blocks_256, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
  block.dim3_x = 8;
  block.dim3_y = 32;
  block.dim3_z = 1;
  uint32_t num_blocks_block_x = num_blocks((n - iter + 1), block.dim3_x);
  uint32_t num_blocks_block_y = num_blocks((n - iter + 1), block.dim3_y);
  grid.dim3_x = num_blocks_block_x;
  grid.dim3_y = num_blocks_block_y;
  grid.dim3_z = 1;
  memcpy(((uint8_t*)(&tmp_grid_copy)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&tmp_block_copy)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&tmp_grid_copy_packed)), ((uint8_t*)(&tmp_grid_copy)), 12);
  memcpy(((uint8_t*)(&tmp_block_copy_packed)), ((uint8_t*)(&tmp_block_copy)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < num_blocks_block_x;   j = j + 1){
for(int32_t k = 0; k < num_blocks_block_y;   k = k + 1){
for(int32_t l = 0; l < 8;   l = l + 1){
for(int32_t m = 0; m < 32;   m = m + 1){
kernel_A(n, A, iter, num_blocks_block_x, num_blocks_block_y, 1, 8, 32, 1, j, k, 0, l, m, 0);
}
}
}
}
}
  return;
}
// Print the n-by-n matrix A to stderr in row-major order using the configured double print format
void print_array(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;
  int32_t temp_index;

// Nested loops over rows i and columns j to print each matrix element A[i*n + j] to stderr::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  fprintf(stderr, (double_print_format), A[(i * n + j)]);
  if ((int)(i * n + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (newline_string));
  }
}
}
  fprintf(stderr, (newline_string));
}
