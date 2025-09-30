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
struct IOFileStruct;
struct dim3_t;
struct Dim3Packed;

/* Function definitions */

/* Types Definitions */
struct uint8_array1_t {
  uint8_t array[1];
};
struct uint8_array20_t {
  uint8_t array[20];
};
struct IOFileStruct {
  uint32_t file_flags;
  uint8_t* read_buffer;
  uint8_t* write_buffer;
  uint8_t* read_ptr;
  uint8_t* write_ptr;
  uint8_t* buf_end;
  uint8_t* buf_base;
  uint8_t* buf_last;
  uint8_t* buf_mark;
  uint8_t* buf_save;
  uint8_t* buf_free;
  uint8_t* buf_alloc;
  void* file_cookie;
  struct IOFileStruct* next;
  uint32_t mode;
  uint32_t fd;
  uint64_t file_pos;
  uint16_t orientation;
  uint8_t unget;
  uint8_t unget_buf[1];
  uint8_t* wide_buf_ptr;
  uint64_t file_size;
  void* lock;
  void* mutex;
  struct IOFileStruct* prev;
  uint8_t* ext_buf;
  uint64_t last_sync;
  uint32_t reserved;
  uint8_t padding20[20];
};
struct dim3_t {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct Dim3Packed {
  uint64_t batch0;
  uint32_t batch1;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaFree(uint8_t*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_y(uint32_t, double, double, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t fmt_double_space[8] = { "%0.2lf " };
uint8_t fmt_newline[2] = { "\n" };


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
  struct dim3_t gridDim;    /* Address-exposed local */
  struct dim3_t blockDim;    /* Address-exposed local */
  struct Dim3Packed gridDimPacked;    /* Address-exposed local */
  struct Dim3Packed blockDimPacked;    /* Address-exposed local */
  int32_t n;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* B;
  uint8_t* tmp;
  uint8_t* x;
  uint8_t* y;
  int32_t call38_result;
  int32_t numBlocks;
  uint8_t* unused_ptr1;
  uint8_t* unused_ptr2;
  uint32_t i;
  uint32_t j;
  int32_t call57_result;

  n = atoi(argv[2]);
  dump_code = atoi(argv[1]);
  A = malloc(n * n * 8);
  B = malloc(n * n * 8);
  tmp = malloc(n * 8);
  x = malloc(n * 8);
  y = malloc(n * 8);
init_array(n, ((double*)A), ((double*)B), ((double*)x));
  numBlocks = num_blocks(n, 256);
  gridDim.x = numBlocks;
  gridDim.y = 1;
  gridDim.z = 1;
  blockDim.x = 256;
  blockDim.y = 1;
  blockDim.z = 1;
  memcpy(((uint8_t*)(&gridDimPacked)), ((uint8_t*)(&gridDim)), 12);
  memcpy(((uint8_t*)(&blockDimPacked)), ((uint8_t*)(&blockDim)), 12);
// Parallel nested loops distributing work across OpenMP threads: outer loop over block index i (0..numBlocks-1), inner loop over 256 sub-blocks::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < numBlocks;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_y(n, 43532, 12313, ((double*)A), ((double*)B), ((double*)tmp), ((double*)x), ((double*)y), numBlocks, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
// If dump_code is enabled, print the result vector y; afterwards free the allocated memory for A and B
  if (dump_code == 1) { // IFELSE MARKER: kcall.end IF
print_array(n, ((double*)y));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
free(((uint8_t*)((double*)tmp)));
free(((uint8_t*)((double*)x)));
free(((uint8_t*)((double*)y)));
  return 0;
}
// Initialize input arrays for the problem: set up vector x and populate matrices A and B for size n
void init_array(uint32_t n, double* A, double* B, double* x) {
  int64_t i;
  uint64_t j;

// For each row i in [0,n): initialize x[i] to i/n, then iterate over columns j to initialize the corresponding entries of A and B for that row::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  x[i] = ((double)(i) / (double)(n));
for(int64_t j = 0; j < n;   j = j + 1){
  A[(i * n + j)] = (((double)(i) * (double)(j)) / (double)(n));
  B[(i * n + j)] = (((double)(i) * (double)(j)) / (double)(n));
}
}
  return;
}
// Compute how many blocks of size 'factor' are needed to cover 'num' elements (ceiling division)
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// Kernel that computes per-row contributions using thread/block indices: updates tmp and y for row i based on matrices A, B and vector x with scalars alpha,beta
void kernel_y(uint32_t n, double alpha, double beta, double* A, double* B, double* tmp, double* x, double* y, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t i;
  int64_t j;

// Compute global row index i from block/thread indices; if i is within bounds initialize tmp[i] and y[i] to zero and then accumulate over columns j
  i = blockDim_x * blockIdx_x + threadIdx_x;
  if (i < n) { // IFELSE MARKER: entry IF
  tmp[i] = 0;
  y[i] = 0;
for(int64_t j = 0; j < n;   j = j + 1){
  __auto_type idx_ij = i * n + j;
  __auto_type a_val = A[idx_ij];
  __auto_type x_j = x[j];
  __auto_type prod_a_x = a_val * x_j;
  __auto_type tmp_sum = tmp[i] + prod_a_x;
  tmp[i] = tmp_sum;
  __auto_type idx_ij2 = i * n + j;
  __auto_type b_val = B[idx_ij2];
  __auto_type x_j2 = x[j];
  __auto_type prod_b_x = b_val * x_j2;
  __auto_type y_sum = y[i] + prod_b_x;
  y[i] = y_sum;
}
  __auto_type alpha_tmp = alpha * tmp[i];
  __auto_type beta_y = beta * y[i];
  __auto_type final_y = alpha_tmp + beta_y;
  y[i] = final_y;
  }
  return;
}
// Print the vector y of length n to stderr using the specified format, organizing output for readability
void print_array(uint32_t n, double* y) {
  int64_t i;

// Iterate over all elements of y and print each value; insert a line break every 20 elements to keep output readable::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  fprintf(stderr, (fmt_double_space), y[i]);
  if (i % 20 == 0) { // IFELSE MARKER: for.body IF
  fprintf(stderr, (fmt_newline));
  }
}
  return;
}
