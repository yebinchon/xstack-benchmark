/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define BYTES_PER_DOUBLE 8
#define THREADS_PER_BLOCK_X 256
#define DIM3_STRUCT_SIZE_BYTES 12
#define ARG_IDX_NX 2
#define ARG_IDX_NY 3
#define ARG_IDX_DUMP_FLAG 1
#define PRINT_VALUES_PER_LINE 20
#define FORMAT_STR_BUF_LEN 8
#define NEWLINE_STR_LEN 2

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
struct Dim3;
struct Dim3Packed;

/* Function definitions */

/* Types Definitions */
struct Uint8Array1 {
  uint8_t array[1];
};
struct Uint8Array20 {
  uint8_t array[20];
};
struct Dim3 {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct Dim3Packed {
  uint64_t packed64;
  uint32_t packed32;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
void kernel3(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel4(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t double_format_str[FORMAT_STR_BUF_LEN] = { "%0.2lf " };
uint8_t newline_str[NEWLINE_STR_LEN] = { "\n" };


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
  struct Dim3 grid_dim_k3;    /* Address-exposed local */
  struct Dim3 block_dim_k3;    /* Address-exposed local */
  struct Dim3Packed grid_dim_k3_packed;    /* Address-exposed local */
  struct Dim3Packed block_dim_k3_packed;    /* Address-exposed local */
  struct Dim3 grid_dim_k4;    /* Address-exposed local */
  struct Dim3 block_dim_k4;    /* Address-exposed local */
  struct Dim3Packed grid_dim_k4_packed;    /* Address-exposed local */
  struct Dim3Packed block_dim_k4_packed;    /* Address-exposed local */
  int32_t nx;
  int32_t ny;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* x;
  uint8_t* y;
  uint8_t* tmp;
  int32_t grid_dim_x_k3;
  uint32_t i;
  uint32_t j;
  int32_t grid_dim_x_k4;

  nx = atoi(argv[ARG_IDX_NX]);
  ny = atoi(argv[ARG_IDX_NY]);
  dump_code = atoi(argv[ARG_IDX_DUMP_FLAG]);
  A = malloc(nx * ny * BYTES_PER_DOUBLE);
  x = malloc(ny * BYTES_PER_DOUBLE);
  y = malloc(ny * BYTES_PER_DOUBLE);
  tmp = malloc(nx * BYTES_PER_DOUBLE);
double* A_dbl = (double*)A;
double* x_dbl = (double*)x;
double* tmp_dbl = (double*)tmp;
double* y_dbl = (double*)y;
init_array(nx, ny, A_dbl, x_dbl, tmp_dbl, y_dbl);
  grid_dim_x_k3 = num_blocks(nx, THREADS_PER_BLOCK_X);
  grid_dim_k3.x = grid_dim_x_k3;
  grid_dim_k3.y = 1;
  grid_dim_k3.z = 1;
  block_dim_k3.x = THREADS_PER_BLOCK_X;
  block_dim_k3.y = 1;
  block_dim_k3.z = 1;
  uint8_t* grid_dim_k3_packed_bytes = (uint8_t*)&grid_dim_k3_packed;
  uint8_t* grid_dim_k3_bytes = (uint8_t*)&grid_dim_k3;
  memcpy(grid_dim_k3_packed_bytes, grid_dim_k3_bytes, DIM3_STRUCT_SIZE_BYTES);
  uint8_t* block_dim_k3_packed_bytes = (uint8_t*)&block_dim_k3_packed;
  uint8_t* block_dim_k3_bytes = (uint8_t*)&block_dim_k3;
  memcpy(block_dim_k3_packed_bytes, block_dim_k3_bytes, DIM3_STRUCT_SIZE_BYTES);
// INSERT COMMENT LOOP: main::header.014
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < grid_dim_x_k3;   i = i + 1){
for(int32_t j = 0; j < THREADS_PER_BLOCK_X;   j = j + 1){
double* A_dbl_k3 = (double*)A;
double* x_dbl_k3 = (double*)x;
double* y_dbl_k3 = (double*)y;
double* tmp_dbl_k3 = (double*)tmp;
__auto_type grid_dim_x_param_k3 = grid_dim_x_k3;
int grid_dim_y_param_k3 = 1;
int grid_dim_z_param_k3 = 1;
__auto_type block_dim_x_param_k3 = THREADS_PER_BLOCK_X;
int block_dim_y_param_k3 = 1;
int block_dim_z_param_k3 = 1;
int32_t block_idx_x_param_k3 = i;
int block_idx_y_param_k3 = 0;
int block_idx_z_param_k3 = 0;
int32_t thread_idx_x_param_k3 = j;
int thread_idx_y_param_k3 = 0;
int thread_idx_z_param_k3 = 0;
kernel3(nx, ny, A_dbl_k3, x_dbl_k3, y_dbl_k3, tmp_dbl_k3, grid_dim_x_param_k3, grid_dim_y_param_k3, grid_dim_z_param_k3, block_dim_x_param_k3, block_dim_y_param_k3, block_dim_z_param_k3, block_idx_x_param_k3, block_idx_y_param_k3, block_idx_z_param_k3, thread_idx_x_param_k3, thread_idx_y_param_k3, thread_idx_z_param_k3);
}
}
  grid_dim_x_k4 = num_blocks(ny, THREADS_PER_BLOCK_X);
  grid_dim_k4.x = grid_dim_x_k4;
  grid_dim_k4.y = 1;
  grid_dim_k4.z = 1;
  block_dim_k4.x = THREADS_PER_BLOCK_X;
  block_dim_k4.y = 1;
  block_dim_k4.z = 1;
  uint8_t* grid_dim_k4_packed_bytes = (uint8_t*)&grid_dim_k4_packed;
  uint8_t* grid_dim_k4_bytes = (uint8_t*)&grid_dim_k4;
  memcpy(grid_dim_k4_packed_bytes, grid_dim_k4_bytes, DIM3_STRUCT_SIZE_BYTES);
  uint8_t* block_dim_k4_packed_bytes = (uint8_t*)&block_dim_k4_packed;
  uint8_t* block_dim_k4_bytes = (uint8_t*)&block_dim_k4;
  memcpy(block_dim_k4_packed_bytes, block_dim_k4_bytes, DIM3_STRUCT_SIZE_BYTES);
// INSERT COMMENT LOOP: main::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < grid_dim_x_k4;   i = i + 1){
for(int32_t j = 0; j < THREADS_PER_BLOCK_X;   j = j + 1){
double* A_dbl_k4 = (double*)A;
double* x_dbl_k4 = (double*)x;
double* y_dbl_k4 = (double*)y;
double* tmp_dbl_k4 = (double*)tmp;
__auto_type grid_dim_x_param_k4 = grid_dim_x_k4;
int grid_dim_y_param_k4 = 1;
int grid_dim_z_param_k4 = 1;
__auto_type block_dim_x_param_k4 = THREADS_PER_BLOCK_X;
int block_dim_y_param_k4 = 1;
int block_dim_z_param_k4 = 1;
int32_t block_idx_x_param_k4 = i;
int block_idx_y_param_k4 = 0;
int block_idx_z_param_k4 = 0;
int32_t thread_idx_x_param_k4 = j;
int thread_idx_y_param_k4 = 0;
int thread_idx_z_param_k4 = 0;
kernel4(nx, ny, A_dbl_k4, x_dbl_k4, y_dbl_k4, tmp_dbl_k4, grid_dim_x_param_k4, grid_dim_y_param_k4, grid_dim_z_param_k4, block_dim_x_param_k4, block_dim_y_param_k4, block_dim_z_param_k4, block_idx_x_param_k4, block_idx_y_param_k4, block_idx_z_param_k4, thread_idx_x_param_k4, thread_idx_y_param_k4, thread_idx_z_param_k4);
}
}
// INSERT COMMENT IFELSE: main::kcall.end51
  if (dump_code == 1) { // IFELSE MARKER: kcall.end51 IF
print_array(nx, (double*)y);
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)x)));
free(((uint8_t*)((double*)y)));
free(((uint8_t*)((double*)tmp)));
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

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < nx;   i = i + 1){
  fprintf(stderr, double_format_str, y[i]);
  if (i % PRINT_VALUES_PER_LINE == 0) { // IFELSE MARKER: for.body IF
  fprintf(stderr, newline_str);
  }
}
  fprintf(stderr, newline_str);
}
