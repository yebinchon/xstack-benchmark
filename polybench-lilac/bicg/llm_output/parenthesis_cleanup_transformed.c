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
struct IO_FILE;
struct cuda_dim3_t;
struct cuda_dim3_coerce_t;

/* Function definitions */

/* Types Definitions */
struct uint8_array_1_t {
  uint8_t array[1];
};
struct uint8_array_20_t {
  uint8_t array[20];
};
struct IO_FILE {
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
  struct IO_FILE* field13;
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
  struct IO_FILE* field24;
  uint8_t* field25;
  uint64_t field26;
  uint32_t field27;
  uint8_t field28[20];
};
struct cuda_dim3_t {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct cuda_dim3_coerce_t {
  uint64_t batch;
  uint32_t batch_size;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_q(uint32_t, uint32_t, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_s(uint32_t, uint32_t, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t format_double_space[8] = { "%0.2lf " };
uint8_t format_newline[2] = { "\n" };


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
  int32_t m;
  int32_t n;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* s;
  uint8_t* q;
  uint8_t* p;
  uint8_t* r;
  int32_t call38_result;
  int32_t call53_result;

// INSERT COMMENT IFELSE: main::entry
  m = atoi(argv[2]);
  n = atoi(argv[3]);
  dump_code = atoi(argv[1]);
  A = malloc(m * n * 8);
  s = malloc(n * 8);
  q = malloc(m * 8);
  p = malloc(n * 8);
  r = malloc(m * 8);
  __auto_type A_dbl1 = (double*)A;
  __auto_type r_dbl1 = (double*)r;
  __auto_type p_dbl1 = (double*)p;
  init_array(m, n, A_dbl1, r_dbl1, p_dbl1);
;
  __auto_type A_dbl2 = (double*)A;
  __auto_type s_dbl1 = (double*)s;
  __auto_type q_dbl1 = (double*)q;
  __auto_type p_dbl2 = (double*)p;
  __auto_type r_dbl2 = (double*)r;
  kernel(m, n, A_dbl2, s_dbl1, q_dbl1, p_dbl2, r_dbl2);
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
__auto_type s_dbl2 = (double*)s;
__auto_type q_dbl2 = (double*)q;
print_array(m, n, s_dbl2, q_dbl2);
  }
__auto_type A_dbl3 = (double*)A;
__auto_type A_bytes = (uint8_t*)A_dbl3;
free(A_bytes);
__auto_type s_dbl3 = (double*)s;
__auto_type s_bytes = (uint8_t*)s_dbl3;
free(s_bytes);
__auto_type q_dbl3 = (double*)q;
__auto_type q_bytes = (uint8_t*)q_dbl3;
free(q_bytes);
__auto_type p_dbl3 = (double*)p;
__auto_type p_bytes = (uint8_t*)p_dbl3;
free(p_bytes);
__auto_type r_dbl3 = (double*)r;
__auto_type r_bytes = (uint8_t*)r_dbl3;
free(r_bytes);
  return 0;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_q
void kernel_q(uint32_t m, uint32_t n, double* A, double* s, double* q, double* p, double* r, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t i;
  int64_t j;
  double dot;

// INSERT COMMENT IFELSE: kernel_q::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  if (i < n) { // IFELSE MARKER: entry IF
  q[i] = 0;
  dot = 0;
for(int64_t j = 0; j < m;   j = j + 1){
  dot = (dot + (A[(i * m + j)] * p[j]));
}
  q[i] = (q[i] + dot);
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_s
void kernel_s(uint32_t m, uint32_t n, double* A, double* s, double* q, double* p, double* r, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t j;
  int64_t i;
  double dot;

// INSERT COMMENT IFELSE: kernel_s::entry
  j = blockDim_x * blockIdx_x + threadIdx_x;
  if (j < m) { // IFELSE MARKER: entry IF
  s[j] = 0;
  dot = 0;
for(int64_t i = 0; i < n;   i = i + 1){
  dot = (dot + (r[i] * A[(i * m + j)]));
}
  s[j] = dot;
  }
  return;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t nx, uint32_t ny, double* A, double* r, double* p) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < ny;   i = i + 1){
  p[i] = ((double)(i) * 3.1415926535897931);
}
// INSERT COMMENT LOOP: init_array::for.cond1
for(int64_t i = 0; i < nx;   i = i + 1){
  r[i] = ((double)(i) * 3.1415926535897931);
for(int64_t j = 0; j < ny;   j = j + 1){
  A[(i * ny + j)] = (((double)(i) * (double)((j + 1))) / (double)(nx));
}
}
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t m, uint32_t n, double* A, double* s, double* q, double* p, double* r) {
  struct cuda_dim3_t grid_dim_q;    /* Address-exposed local */
  struct cuda_dim3_t block_dim_q;    /* Address-exposed local */
  struct cuda_dim3_coerce_t grid_dim_q_coerce;    /* Address-exposed local */
  struct cuda_dim3_coerce_t block_dim_q_coerce;    /* Address-exposed local */
  struct cuda_dim3_t grid_dim_s;    /* Address-exposed local */
  struct cuda_dim3_t block_dim_s;    /* Address-exposed local */
  struct cuda_dim3_coerce_t grid_dim_s_coerce;    /* Address-exposed local */
  struct cuda_dim3_coerce_t block_dim_s_coerce;    /* Address-exposed local */
  int32_t blocks_n;
  uint8_t* temp_ptr1;
  uint8_t* temp_ptr2;
  uint32_t i;
  uint32_t j;
  int32_t blocks_m;
  uint8_t* temp_ptr3;
  uint8_t* temp_ptr4;

  blocks_n = num_blocks(n, 256);
  grid_dim_q.x = blocks_n;
  grid_dim_q.y = 1;
  grid_dim_q.z = 1;
  block_dim_q.x = 256;
  block_dim_q.y = 1;
  block_dim_q.z = 1;
  memcpy(((uint8_t*)(&grid_dim_q_coerce)), ((uint8_t*)(&grid_dim_q)), 12);
  memcpy(((uint8_t*)(&block_dim_q_coerce)), ((uint8_t*)(&block_dim_q)), 12);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < blocks_n;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_q(m, n, A, s, q, p, r, blocks_n, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  blocks_m = num_blocks(m, 256);
  grid_dim_s.x = blocks_m;
  grid_dim_s.y = 1;
  grid_dim_s.z = 1;
  block_dim_s.x = 256;
  block_dim_s.y = 1;
  block_dim_s.z = 1;
  memcpy(((uint8_t*)(&grid_dim_s_coerce)), ((uint8_t*)(&grid_dim_s)), 12);
  memcpy(((uint8_t*)(&block_dim_s_coerce)), ((uint8_t*)(&block_dim_s)), 12);
// INSERT COMMENT LOOP: kernel::header.010
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < blocks_m;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_s(m, n, A, s, q, p, r, blocks_m, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t nx, uint32_t ny, double* s, double* q) {
  int64_t i;
  int32_t unused_i32;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < ny;   i = i + 1){
  fprintf(stderr, format_double_space, s[i]);
  if (i % 20 == 0) { // IFELSE MARKER: for.body IF
  fprintf(stderr, format_newline);
  }
}
// INSERT COMMENT LOOP: print_array::for.cond3
for(int64_t i = 0; i < nx;   i = i + 1){
  fprintf(stderr, format_double_space, q[i]);
  if (i % 20 == 0) { // IFELSE MARKER: for.body5 IF
  fprintf(stderr, format_newline);
  }
}
  fprintf(stderr, format_newline);
}
