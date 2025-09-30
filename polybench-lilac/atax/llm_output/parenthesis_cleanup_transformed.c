#define ATAX_BLOCK_SIZE_1 256

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
struct IO_FILE_struct_t;
struct dim3;
struct PackedDim3;

/* Function definitions */

/* Types Definitions */
struct uint8_array_1 {
  uint8_t array[1];
};
struct uint8_array_20 {
  uint8_t array[20];
};
struct IO_FILE_struct_t {
  uint32_t file_field0;
  uint8_t* file_field1;
  uint8_t* file_field2;
  uint8_t* file_field3;
  uint8_t* file_field4;
  uint8_t* file_field5;
  uint8_t* file_field6;
  uint8_t* file_field7;
  uint8_t* file_field8;
  uint8_t* file_field9;
  uint8_t* file_field10;
  uint8_t* file_field11;
  void* file_field12;
  struct IO_FILE_struct_t* file_field13;
  uint32_t file_field14;
  uint32_t file_field15;
  uint64_t file_field16;
  uint16_t file_field17;
  uint8_t file_field18;
  uint8_t file_field19[1];
  uint8_t* file_field20;
  uint64_t file_field21;
  void* file_field22;
  void* file_field23;
  struct IO_FILE_struct_t* file_field24;
  uint8_t* file_field25;
  uint64_t file_field26;
  uint32_t file_field27;
  uint8_t file_field28[20];
};
struct dim3 {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct PackedDim3 {
  uint64_t packedDim3_field0;
  uint32_t packedDim3_field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel3(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel4(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t print_format_double[8] = { "%0.2lf " };
uint8_t print_format_newline[2] = { "\n" };


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
  struct dim3 gridDimA;    /* Address-exposed local */
  struct dim3 blockDimA;    /* Address-exposed local */
  struct PackedDim3 packedGridDimA;    /* Address-exposed local */
  struct PackedDim3 packedBlockDimA;    /* Address-exposed local */
  struct dim3 gridDimB;    /* Address-exposed local */
  struct dim3 blockDimB;    /* Address-exposed local */
  struct PackedDim3 packedGridDimB;    /* Address-exposed local */
  struct PackedDim3 packedBlockDimB;    /* Address-exposed local */
  int32_t nx;
  int32_t ny;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* x;
  uint8_t* y;
  uint8_t* tmp;
  int32_t call32_val;
  int32_t numBlocksNx;
  uint8_t* bufA;
  uint8_t* buf2;
  uint32_t i;
  uint32_t j;
  int32_t numBlocksNy;
  uint8_t* buf3;
  uint8_t* buf4;
  int32_t call54_val;

  nx = atoi(argv[2]);
  ny = atoi(argv[3]);
  dump_code = atoi(argv[1]);
  A = malloc(nx * ny * 8);
  x = malloc(ny * 8);
  y = malloc(ny * 8);
  tmp = malloc(nx * 8);
__auto_type A_dbl = (double*)A;
__auto_type x_dbl = (double*)x;
__auto_type tmp_dbl = (double*)tmp;
__auto_type y_dbl = (double*)y;
init_array(nx, ny, A_dbl, x_dbl, tmp_dbl, y_dbl);
  numBlocksNx = num_blocks(nx, ATAX_BLOCK_SIZE_1);
  gridDimA.x = numBlocksNx;
  gridDimA.y = 1;
  gridDimA.z = 1;
  blockDimA.x = 256;
  blockDimA.y = 1;
  blockDimA.z = 1;
  memcpy(((uint8_t*)(&packedGridDimA)), ((uint8_t*)(&gridDimA)), 12);
  memcpy(((uint8_t*)(&packedBlockDimA)), ((uint8_t*)(&blockDimA)), 12);
// INSERT COMMENT LOOP: main::header.014
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < numBlocksNx;   i = i + 1){
for(int32_t j = 0; j < ATAX_BLOCK_SIZE_1;   j = j + 1){
__auto_type A_dbl_k3 = (double*)A;
__auto_type x_dbl_k3 = (double*)x;
__auto_type y_dbl_k3 = (double*)y;
__auto_type tmp_dbl_k3 = (double*)tmp;
__auto_type numBlocksA_k3 = numBlocksNx;
__auto_type blockDimAx_k3 = 256;
kernel3(nx, ny, A_dbl_k3, x_dbl_k3, y_dbl_k3, tmp_dbl_k3, numBlocksA_k3, 1, 1, blockDimAx_k3, 1, 1, i, 0, 0, j, 0, 0);
}
}
  numBlocksNy = num_blocks(ny, ATAX_BLOCK_SIZE_1);
  gridDimB.x = numBlocksNy;
  gridDimB.y = 1;
  gridDimB.z = 1;
  blockDimB.x = 256;
  blockDimB.y = 1;
  blockDimB.z = 1;
  memcpy(((uint8_t*)(&packedGridDimB)), ((uint8_t*)(&gridDimB)), 12);
  memcpy(((uint8_t*)(&packedBlockDimB)), ((uint8_t*)(&blockDimB)), 12);
// INSERT COMMENT LOOP: main::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < numBlocksNy;   i = i + 1){
for(int32_t j = 0; j < ATAX_BLOCK_SIZE_1;   j = j + 1){
__auto_type A_dbl_k4 = (double*)A;
__auto_type x_dbl_k4 = (double*)x;
__auto_type y_dbl_k4 = (double*)y;
__auto_type tmp_dbl_k4 = (double*)tmp;
__auto_type numBlocksB_k4 = numBlocksNy;
__auto_type blockDimAx_k4 = 256;
kernel4(nx, ny, A_dbl_k4, x_dbl_k4, y_dbl_k4, tmp_dbl_k4, numBlocksB_k4, 1, 1, blockDimAx_k4, 1, 1, i, 0, 0, j, 0, 0);
}
}
// INSERT COMMENT IFELSE: main::kcall.end51
  if (dump_code == 1) { // IFELSE MARKER: kcall.end51 IF
print_array(nx, (double*)y);
  }
free((uint8_t*)((double*)A));
free((uint8_t*)((double*)x));
free((uint8_t*)((double*)y));
free((uint8_t*)((double*)tmp));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t nx, uint32_t ny, double* A, double* x, double* tmp, double* y) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < ny;   i = i + 1){
  x[i] = ((double)(i) * 3.1415926535897931);
}
// INSERT COMMENT LOOP: init_array::for.cond1
for(int64_t i = 0; i < nx;   i = i + 1){
  tmp[i] = 0;
}
// INSERT COMMENT LOOP: init_array::for.cond9
for(int64_t i = 0; i < nx;   i = i + 1){
for(int64_t j = 0; j < ny;   j = j + 1){
  A[(i * ny + j)] = (((double)(i) * (double)((j + 1))) / (double)(nx));
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel3
void kernel3(uint32_t m, uint32_t n, double* A, double* x, double* y, double* tmp, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t i;
  int64_t j;
  double dot;

// INSERT COMMENT IFELSE: kernel3::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  if (i < m) { // IFELSE MARKER: entry IF
  dot = 0;
for(int64_t j = 0; j < n;   j = j + 1){
  dot = (dot + (A[(i * n + j)] * x[j]));
}
  tmp[i] = dot;
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel4
void kernel4(uint32_t m, uint32_t n, double* A, double* x, double* y, double* tmp, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t j;
  int64_t i;
  double dot;

// INSERT COMMENT IFELSE: kernel4::entry
  j = blockDim_x * blockIdx_x + threadIdx_x;
  if (j < n) { // IFELSE MARKER: entry IF
  y[j] = 0;
  dot = 0;
for(int64_t i = 0; i < m;   i = i + 1){
  dot = (dot + (A[(i * n + j)] * tmp[i]));
}
  y[j] = dot;
  }
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t nx, double* y) {
  int64_t i;
  int32_t temp_i32;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < nx;   i = i + 1){
  fprintf(stderr, print_format_double, y[i]);
  if (i % 20 == 0) { // IFELSE MARKER: for.body IF
  fprintf(stderr, print_format_newline);
  }
}
  fprintf(stderr, print_format_newline);
}
