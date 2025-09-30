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
struct dim3_coerce_t;

/* Function definitions */

/* Types Definitions */
struct uint8_array1_t {
  uint8_t array[1];
};
struct uint8_array20_t {
  uint8_t array[20];
};
struct IOFile {
  uint32_t flags;
  uint8_t* read_ptr;
  uint8_t* read_end;
  uint8_t* read_base;
  uint8_t* write_base;
  uint8_t* write_ptr;
  uint8_t* write_end;
  uint8_t* buf_base;
  uint8_t* buf_end;
  uint8_t* save_base;
  uint8_t* backup_base;
  uint8_t* save_end;
  void* markers;
  struct IOFile* chain;
  uint32_t fileno;
  uint32_t flags2;
  uint64_t old_offset;
  uint16_t cur_column;
  uint8_t vtable_offset;
  uint8_t shortbuf[1];
  uint8_t* lock;
  uint64_t offset;
  void* pad1;
  void* pad2;
  struct IOFile* freeres_list;
  uint8_t* freeres_buf;
  uint64_t pad5;
  uint32_t mode;
  uint8_t unused2[20];
};
struct dim3 {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct dim3_coerce_t {
  uint64_t x;
  uint32_t y;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel_polly(uint32_t, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
double sqrt(double);
void kernel0(uint32_t, uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel1(uint32_t, uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel2(uint32_t, uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
  int32_t n;
  int32_t dump_code;
  uint8_t* A;
  int32_t tmp_call12;
  int32_t tmp_call16;

// INSERT COMMENT IFELSE: main::entry
  n = atoi(argv[2]);
  dump_code = atoi(argv[1]);
  A = malloc(n * n * 8);
  init_array(n, ((double*)A));
;
  kernel_polly(n, ((double*)A));
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(n, ((double*)A));
  }
free(((uint8_t*)((double*)A)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  A[(i * n + j)] = (1 / (double)(n));
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel0
void kernel0(uint32_t n, uint32_t j, double* A, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  double diag_val;

  diag_val = sqrt(A[(j * n + j)]);
  A[(j * n + j)] = diag_val;
}
// INSERT COMMENT FUNCTION: kernel1
void kernel1(uint32_t n, uint32_t j, double* A, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;

// INSERT COMMENT IFELSE: kernel1::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  if (i < n & i > j) { // IFELSE MARKER: entry IF
  A[(i * n + j)] = (A[(i * n + j)] / A[(j * n + j)]);
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel2
void kernel2(uint32_t n, uint32_t j, double* A, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t k;

// INSERT COMMENT IFELSE: kernel2::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  k = blockDim_y * blockIdx_y + threadIdx_y;
  __auto_type cond_j_lt_n = (j < n);
  __auto_type cond_j_lt_i = (j < i);
  __auto_type cond_i_lt_n = (i < n);
  __auto_type cond_j_lt_k = (j < k);
  __auto_type cond_k_le_i = (k <= i);
  __auto_type cond_all = cond_j_lt_n & cond_j_lt_i & cond_i_lt_n & cond_j_lt_k & cond_k_le_i;
  if (cond_all) { // IFELSE MARKER: entry IF
  __auto_type index_i_n_k = (i * n + k);
  __auto_type index_i_n_j = (i * n + j);
  __auto_type index_k_n_j = (k * n + j);
  __auto_type val_A_i_k = A[index_i_n_k];
  __auto_type val_A_i_j = A[index_i_n_j];
  __auto_type val_A_k_j = A[index_k_n_j];
  __auto_type prod_A_i_j_A_k_j = val_A_i_j * val_A_k_j;
  __auto_type updated_A_i_k = val_A_i_k - prod_A_i_j_A_k_j;
  A[(i * n + k)] = updated_A_i_k;
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_polly
void kernel_polly(uint32_t n, double* dev_A) {
  struct dim3 dim_temp_a;    /* Address-exposed local */
  struct dim3 dim_temp_b;    /* Address-exposed local */
  struct dim3_coerce_t dim_temp_a_coerce;    /* Address-exposed local */
  struct dim3_coerce_t dim_temp_b_coerce;    /* Address-exposed local */
  struct dim3 blocks_k1;    /* Address-exposed local */
  struct dim3 threads_k1;    /* Address-exposed local */
  struct dim3_coerce_t blocks_k1_coerce;    /* Address-exposed local */
  struct dim3_coerce_t threads_k1_coerce;    /* Address-exposed local */
  struct dim3 block;    /* Address-exposed local */
  struct dim3 grid;    /* Address-exposed local */
  struct dim3 block_copy;    /* Address-exposed local */
  struct dim3 grid_copy;    /* Address-exposed local */
  struct dim3_coerce_t block_copy_coerce;    /* Address-exposed local */
  struct dim3_coerce_t grid_copy_coerce;    /* Address-exposed local */
  int32_t iter;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

// INSERT COMMENT LOOP: kernel_polly::for.cond
for(int32_t iter = 0; iter < n;   iter = iter + 1){
  dim_temp_a.x = 1;
  dim_temp_a.y = 1;
  dim_temp_a.z = 1;
  dim_temp_b.x = 1;
  dim_temp_b.y = 1;
  dim_temp_b.z = 1;
  memcpy(((uint8_t*)(&dim_temp_a_coerce)), ((uint8_t*)(&dim_temp_a)), 12);
  memcpy(((uint8_t*)(&dim_temp_b_coerce)), ((uint8_t*)(&dim_temp_b)), 12);
kernel0(n, iter, dev_A, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0);
  uint32_t num_blocks_256 = num_blocks(n, 256);
  blocks_k1.x = num_blocks_256;
  blocks_k1.y = 1;
  blocks_k1.z = 1;
  threads_k1.x = 256;
  threads_k1.y = 1;
  threads_k1.z = 1;
  memcpy(((uint8_t*)(&blocks_k1_coerce)), ((uint8_t*)(&blocks_k1)), 12);
  memcpy(((uint8_t*)(&threads_k1_coerce)), ((uint8_t*)(&threads_k1)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < num_blocks_256;   j = j + 1){
for(int32_t k = 0; k < 256;   k = k + 1){
  kernel1(n, iter, dev_A, num_blocks_256, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
;
}
}
  block.x = 8;
  block.y = 32;
  block.z = 1;
  uint32_t num_blocks_x = num_blocks(n, block.x);
  uint32_t num_blocks_y = num_blocks(n, block.y);
  grid.x = num_blocks_x;
  grid.y = num_blocks_y;
  grid.z = 1;
  memcpy(((uint8_t*)(&block_copy)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_copy)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_copy_coerce)), ((uint8_t*)(&block_copy)), 12);
  memcpy(((uint8_t*)(&grid_copy_coerce)), ((uint8_t*)(&grid_copy)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < 8;   j = j + 1){
for(int32_t k = 0; k < 32;   k = k + 1){
for(int32_t l = 0; l < num_blocks_x;   l = l + 1){
for(int32_t m = 0; m < num_blocks_y;   m = m + 1){
  kernel2(n, iter, dev_A, 8, 32, 1, num_blocks_x, num_blocks_y, 1, j, k, 0, l, m, 0);
;
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

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  fprintf(stderr, (print_format_str), A[(i * n + j)]);
  if ((int)(i * n + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (newline_str));
  }
}
}
  return;
}
