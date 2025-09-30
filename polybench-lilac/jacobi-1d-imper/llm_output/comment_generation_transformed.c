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
  uint32_t io_file_field0;
  uint8_t* io_file_field1;
  uint8_t* io_file_field2;
  uint8_t* io_file_field3;
  uint8_t* io_file_field4;
  uint8_t* io_file_field5;
  uint8_t* io_file_field6;
  uint8_t* io_file_field7;
  uint8_t* io_file_field8;
  uint8_t* io_file_field9;
  uint8_t* io_file_field10;
  uint8_t* io_file_field11;
  void* io_file_field12;
  struct IOFile* io_file_field13;
  uint32_t io_file_field14;
  uint32_t io_file_field15;
  uint64_t io_file_field16;
  uint16_t io_file_field17;
  uint8_t io_file_field18;
  uint8_t io_file_field19[1];
  uint8_t* io_file_field20;
  uint64_t io_file_field21;
  void* io_file_field22;
  void* io_file_field23;
  struct IOFile* io_file_field24;
  uint8_t* io_file_field25;
  uint64_t io_file_field26;
  uint32_t io_file_field27;
  uint8_t io_file_field28[20];
};
struct dim3_t {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct dim3_packed_t {
  uint64_t x;
  uint32_t y;
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
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_stencil(uint32_t, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
  int32_t n;
  int32_t tsteps;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* B;
  int32_t local17;
  int32_t local23;

// Parse command-line arguments (dump_code, tsteps, n) and allocate two double arrays A and B of length n
  n = atoi(argv[3]);
  tsteps = atoi(argv[2]);
  dump_code = atoi(argv[1]);
  A = malloc(n * 8);
  B = malloc(n * 8);
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
// Initialize arrays A and B of length n with deterministic test values: A[i]=(i+2)/n and B[i]=(i+3)/n
void init_array(uint32_t n, double* A, double* B) {
  int64_t i;

// Loop over all indices 0..n-1 and initialize A and B with fractional values derived from the index for predictable test data::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  A[i] = (((double)(i) + 2) / (double)(n));
  B[i] = (((double)(i) + 3) / (double)(n));
}
  return;
}
// Compute how many blocks of size 'factor' are needed to cover 'num' elements (ceiling division)
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// Per-thread CUDA-like kernel: compute the global index from block/thread coordinates and apply a stencil update from A into B for interior elements
void kernel_stencil(uint32_t n, double* A, double* B, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t i;

// Compute this thread's global index (shifted by +1) and execute the stencil only if the index lies in the interior range (1..n-2) to avoid boundaries
  __auto_type block_base_x = blockDim_x * blockIdx_x;
  __auto_type global_x = block_base_x + threadIdx_x;
  __auto_type idx = global_x + 1;
  i = idx;
  if (i < (n - 1)) { // IFELSE MARKER: entry IF
  __auto_type left_val = A[i - 1];
  __auto_type center_val = A[i];
  __auto_type right_val = A[i + 1];
  __auto_type sum_val = left_val + center_val + right_val;
  __auto_type avg_val = sum_val / 3.0;
  B[i] = avg_val;
  }
  return;
}
// Host-side driver that configures grid/block dimensions and runs the stencil kernel for tsteps iterations to update arrays A and B
void kernel(uint32_t tsteps, uint32_t n, double* A, double* B) {
  struct dim3_t gridA;    /* Address-exposed local */
  struct dim3_t blockA;    /* Address-exposed local */
  struct dim3_packed_t gridA_packed;    /* Address-exposed local */
  struct dim3_packed_t blockA_packed;    /* Address-exposed local */
  struct dim3_t gridB;    /* Address-exposed local */
  struct dim3_t blockB;    /* Address-exposed local */
  struct dim3_packed_t gridB_packed;    /* Address-exposed local */
  struct dim3_packed_t blockB_packed;    /* Address-exposed local */
  int32_t t;
  uint32_t j;
  uint32_t k;

// Time-stepping loop: for each timestep compute the number of blocks needed (256 threads per block) to cover n and set up the grid for the kernel launch::for.cond
for(int32_t t = 1; t <= tsteps;   t = t + 1){
  uint32_t numBlocksA = num_blocks(n, 256);
  gridA.x = numBlocksA;
  gridA.y = 1;
  gridA.z = 1;
  blockA.x = 256;
  blockA.y = 1;
  blockA.z = 1;
  memcpy(((uint8_t*)(&gridA_packed)), ((uint8_t*)(&gridA)), 12);
  memcpy(((uint8_t*)(&blockA_packed)), ((uint8_t*)(&blockA)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < numBlocksA;   j = j + 1){
for(int32_t k = 0; k < 256;   k = k + 1){
kernel_stencil(n, A, B, numBlocksA, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
  uint32_t numBlocksB = num_blocks(n, 256);
  gridB.x = numBlocksB;
  gridB.y = 1;
  gridB.z = 1;
  blockB.x = 256;
  blockB.y = 1;
  blockB.z = 1;
  memcpy(((uint8_t*)(&gridB_packed)), ((uint8_t*)(&gridB)), 12);
  memcpy(((uint8_t*)(&blockB_packed)), ((uint8_t*)(&blockB)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < numBlocksB;   j = j + 1){
for(int32_t k = 0; k < 256;   k = k + 1){
kernel_stencil(n, B, A, numBlocksB, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
}
  return;
}
// Print the contents of array A (length n) to stderr using the provided double format, with human-friendly line breaks
void print_array(uint32_t n, double* A) {
  int64_t i;
  int32_t tmp32;

// Iterate over array elements and print each value; insert a line break/spacing every 20 values to keep output readable::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  fprintf(stderr, (fmt_double_space), A[i]);
  if (i % 20 == 0) { // IFELSE MARKER: for.body IF
  fprintf(stderr, (fmt_newline));
  }
}
  fprintf(stderr, (fmt_newline));
}
