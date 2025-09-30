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
struct io_file_struct;
struct dim3_t;
struct dim3_coerce_t;

/* Function definitions */

/* Types Definitions */
struct uint8_array1_t {
  uint8_t array[1];
};
struct uint8_array20_t {
  uint8_t array[20];
};
struct io_file_struct {
  uint32_t field0;
  uint8_t* field1;
  uint8_t* field2;
  uint8_t* field3;
  uint8_t* field4;
  uint8_t* field5;
  uint8_t* field6;
  uint8_t* field7;
  uint8_t* field8;
  uint8_t* field9;
  uint8_t* field10;
  uint8_t* field11;
  void* field12;
  struct io_file_struct* field13;
  uint32_t field14;
  uint32_t field15;
  uint64_t field16;
  uint16_t field17;
  uint8_t field18;
  uint8_t field19[1];
  uint8_t* field20;
  uint64_t field21;
  void* field22;
  void* field23;
  struct io_file_struct* field24;
  uint8_t* field25;
  uint64_t field26;
  uint32_t field27;
  uint8_t field28[20];
};
struct dim3_t {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct dim3_coerce_t {
  uint64_t batch;
  uint32_t batch_extra;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_sum(uint32_t, uint32_t, uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t double_fmt_space[8] = { "%0.2lf " };
uint8_t newline_fmt[2] = { "\n" };


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
  int32_t init_array_ret;
  int32_t kernel_ret;

// Parse command-line arguments into dump_code, nr, nq, np and allocate memory for A as a contiguous double array of size nr*nq*np
  dump_code = atoi(argv[1]);
  nr = atoi(argv[2]);
  nq = atoi(argv[3]);
  np = atoi(argv[4]);
  A = malloc(nr * nq * np * 8);
  sum = malloc(nr * nq * np * 8);
  C4 = malloc(np * np * 8);
  init_array(nr, nq, np, ((double*)A), ((double*)C4));
;
  kernel(nr, nq, np, ((double*)A), ((double*)C4), ((double*)sum));
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(nr, nq, np, ((double*)sum));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)sum)));
free(((uint8_t*)((double*)C4)));
  return 0;
}
// Initialize arrays A and C4 for the problem: set up deterministic starting values based on indices and the provided dimensions nr, nq, np
void init_array(uint32_t nr, uint32_t nq, uint32_t np, double* A, double* C4) {
  int64_t i;
  int64_t j;
  int64_t k;

// Iterate over i and j (0..np-1) to initialize C4 as an np x np matrix where C4[i*np + j] = (double)i * (double)j / np::for.cond
for(int64_t i = 0; i < nr;   i = i + 1){
for(int64_t j = 0; j < nq;   j = j + 1){
for(int64_t k = 0; k < np;   k = k + 1){
  A[((i * np * nq + j * nq) + k)] = ((((double)(i) * (double)(j)) + (double)(k)) / (double)(np));
}
}
}
// Nested loops over i and j filling the C4 coefficient matrix with values proportional to the product of indices divided by np::for.cond21
for(int64_t i = 0; i < np;   i = i + 1){
for(int64_t j = 0; j < np;   j = j + 1){
  C4[(i * np + j)] = (((double)(i) * (double)(j)) / (double)(np));
}
}
  return;
}
// Compute the number of blocks required to cover 'num' elements with blocks of size 'factor' (ceiling division)
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// Emulated CUDA kernel: derive global indices (r,q,p) from block/thread coordinates and perform per-element computation to update the sum array using A and C4
void kernel_sum(uint32_t nr, uint32_t nq, uint32_t np, double* A, double* C4, double* sum, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t r;
  int32_t q;
  int32_t p;
  int64_t s;
  double dot;

// Map block/thread indices to global coordinates r,q,p and check bounds (r<nr, q<nq) so only valid threads perform the per-element work
  r = blockDim_x * blockIdx_x + threadIdx_x;
  q = blockDim_y * blockIdx_y + threadIdx_y;
  p = blockDim_z * blockIdx_z + threadIdx_z;
  if (r < nr) { // IFELSE MARKER: entry IF
  if (q < nq) { // IFELSE MARKER: land.lhs.true IF
  if (p < np) { // IFELSE MARKER: land.lhs.true14 IF
  __auto_type idx_rq = r * nq + q;
  __auto_type idx_rq_np = idx_rq * np;
  __auto_type idx_rq_np_p = idx_rq_np + p;
  __auto_type sum_zero_tmp = sum[idx_rq_np_p] = 0;;
  sum[((r * nq + q) * np + p)] = 0;
  dot = 0;
for(int64_t s = 0; s < np;   s = s + 1){
  __auto_type idx_rq_loop = r * nq + q;
  __auto_type idx_rq_np_loop = idx_rq_loop * np;
  __auto_type idx_rq_np_s = idx_rq_np_loop + s;
  __auto_type idx_sp = s * np + p;
  __auto_type aval = A[idx_rq_np_s];
  __auto_type c4val = C4[idx_sp];
  __auto_type prod = aval * c4val;
  __auto_type dot_update = dot = dot + prod;
  dot = dot + prod;
}
  __auto_type idx_rq_after = r * nq + q;
  __auto_type idx_rq_np_after = idx_rq_after * np;
  __auto_type idx_rq_np_p_after = idx_rq_np_after + p;
  __auto_type sum_store = sum[idx_rq_np_p_after] = dot;;
  sum[((r * nq + q) * np + p)] = dot;
  }
  }
  }
  return;
}
// Host-side launcher that configures grid and block dimensions (dim3-like structs) and dispatches the parallel kernel_sum computation
void kernel(uint32_t nr, uint32_t nq, uint32_t np, double* A, double* C4, double* sum) {
  struct dim3_t block;    /* Address-exposed local */
  struct dim3_t grid;    /* Address-exposed local */
  struct dim3_t grid_copy;    /* Address-exposed local */
  struct dim3_t block_copy;    /* Address-exposed local */
  struct dim3_coerce_t grid_copy_coerce;    /* Address-exposed local */
  struct dim3_coerce_t block_copy_coerce;    /* Address-exposed local */
  int32_t num_blocks_x;
  int32_t num_blocks_y;
  int32_t num_blocks_z;
  uint8_t* byte_ptr1;
  uint8_t* byte_ptr2;
  uint8_t* byte_ptr3;
  uint8_t* byte_ptr4;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

  block.x = 1;
  block.y = 8;
  block.z = 32;
  num_blocks_x = num_blocks(nr, block.x);
  num_blocks_y = num_blocks(nq, block.y);
  num_blocks_z = num_blocks(np, block.z);
  grid.x = num_blocks_x;
  grid.y = num_blocks_y;
  grid.z = num_blocks_z;
  memcpy(((uint8_t*)(&grid_copy)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_copy)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_copy_coerce)), ((uint8_t*)(&grid_copy)), 12);
  memcpy(((uint8_t*)(&block_copy_coerce)), ((uint8_t*)(&block_copy)), 12);
// Parallelize over the block-grid X and Y dimensions (collapse both loops) so each OpenMP thread handles one block coordinate (i,j) of the work::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < num_blocks_x;   i = i + 1){
for(int32_t j = 0; j < num_blocks_y;   j = j + 1){
for(int32_t k = 0; k < num_blocks_z;   k = k + 1){
for(int32_t l = 0; l < 8;   l = l + 1){
for(int32_t m = 0; m < 32;   m = m + 1){
kernel_sum(nr, nq, np, A, C4, sum, num_blocks_x, num_blocks_y, num_blocks_z, 1, 8, 32, i, j, k, 0, l, m);
}
}
}
}
}
  return;
}
// Print the contents of the 3D array A (dimensions nr x nq x np) in a readable order for verification or debugging
void print_array(uint32_t nr, uint32_t nq, uint32_t np, double* A) {
  int64_t i;
  int64_t j;
  int64_t k;
  int32_t unused_int;

// Triple nested loops over i (nr), j (nq), k (np) to visit every element of the 3D array A and emit its value for output::for.cond
for(int64_t i = 0; i < nr;   i = i + 1){
for(int64_t j = 0; j < nq;   j = j + 1){
for(int64_t k = 0; k < np;   k = k + 1){
  fprintf(stderr, (double_fmt_space), A[((i * nq * np + j * nq) + k)]);
  if (i % 20 == 0) { // IFELSE MARKER: for.body6 IF
  fprintf(stderr, (newline_fmt));
  }
}
}
}
  fprintf(stderr, (newline_fmt));
}
