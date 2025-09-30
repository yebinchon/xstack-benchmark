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
struct Dim3;
struct CudaDim3Coerce;

/* Function definitions */

/* Types Definitions */
struct UInt8Array1 {
  uint8_t array[1];
};
struct UInt8Array20 {
  uint8_t array[20];
};
struct IOFile {
  uint32_t flags;
  uint8_t* read_ptr;
  uint8_t* read_end;
  uint8_t* write_ptr;
  uint8_t* write_end;
  uint8_t* buf_base;
  uint8_t* buf_lim;
  uint8_t* buf_start;
  uint8_t* buf_current;
  uint8_t* buf_last;
  uint8_t* unget_buf;
  uint8_t* tmp_buf;
  void* cookie;
  struct IOFile* next;
  uint32_t read_size;
  uint32_t write_size;
  uint64_t offset;
  uint16_t short_val;
  uint8_t char_flags;
  uint8_t small_array[1];
  uint8_t* aux_buf;
  uint64_t file_size;
  void* vtable1;
  void* vtable2;
  struct IOFile* prev;
  uint8_t* path;
  uint64_t timestamp;
  uint32_t status;
  uint8_t name[20];
};
struct Dim3 {
  uint32_t dim3_x;
  uint32_t dim3_y;
  uint32_t dim3_z;
};
struct CudaDim3Coerce {
  uint64_t batch_dim0;
  uint32_t batch_dim1;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int16_t num_blocks(int16_t, int16_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaFree(uint8_t*);
void print_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_A_mul_B(uint32_t, uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_D_plus_tmp_mul_C(uint32_t, uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
  int64_t m;
  int64_t n;
  int64_t k;
  int64_t p;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;
  uint8_t* D;
  uint8_t* tmp;
  int32_t unused47;
  int32_t unused66;

// INSERT COMMENT IFELSE: main::entry
  dump_code = atoi(argv[1]);
  m = atoi(argv[2]);
  n = atoi(argv[3]);
  k = atoi(argv[4]);
  p = atoi(argv[5]);
  A = malloc(m * k * 8);
  B = malloc(k * n * 8);
  C = malloc(p * n * 8);
  D = malloc(m * p * 8);
  tmp = malloc(m * n * 8);
  init_array(m, n, k, p, ((double*)A), ((double*)B), ((double*)C), ((double*)D), ((double*)tmp));
;
  kernel(m, n, k, p, 32412, 2123, ((double*)tmp), ((double*)A), ((double*)B), ((double*)C), ((double*)D));
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(m, k, ((double*)D));
  }
free(((uint8_t*)((double*)tmp)));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)D)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double* A, double* B, double* C, double* D, double* tmp) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nk;   j = j + 1){
  __auto_type idx_a = i * ni + j;
  __auto_type i_d = (double)i;
  __auto_type j_d = (double)j;
  __auto_type prod_id_jd = i_d * j_d;
  __auto_type ni_d = (double)ni;
  __auto_type a_init_val = prod_id_jd / ni_d;
  A[(i * ni + j)] = a_init_val;
}
}
// INSERT COMMENT LOOP: init_array::for.cond10
for(int64_t i = 0; i < nk;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  __auto_type idx_b = i * nk + j;
  __auto_type i_b_d = (double)i;
  __auto_type j_plus1_int = j + 1;
  __auto_type j_plus1_d = (double)j_plus1_int;
  __auto_type prod_i_jp1 = i_b_d * j_plus1_d;
  __auto_type nj_d = (double)nj;
  __auto_type b_init_val = prod_i_jp1 / nj_d;
  B[(i * nk + j)] = b_init_val;
}
}
// INSERT COMMENT LOOP: init_array::for.cond32
for(int64_t i = 0; i < nl;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  __auto_type idx_c = i * nl + j;
  __auto_type i_c_d = (double)i;
  __auto_type j_plus3_int = j + 3;
  __auto_type j_plus3_d = (double)j_plus3_int;
  __auto_type prod_i_jp3 = i_c_d * j_plus3_d;
  __auto_type nl_d = (double)nl;
  __auto_type c_init_val = prod_i_jp3 / nl_d;
  C[(i * nl + j)] = c_init_val;
}
}
// INSERT COMMENT LOOP: init_array::for.cond54
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  __auto_type idx_d = i * ni + j;
  __auto_type i_d2 = (double)i;
  __auto_type j_plus2_int = j + 2;
  __auto_type j_plus2_d = (double)j_plus2_int;
  __auto_type prod_i_jp2 = i_d2 * j_plus2_d;
  __auto_type nk_d = (double)nk;
  __auto_type d_init_val = prod_i_jp2 / nk_d;
  D[(i * ni + j)] = d_init_val;
}
}
// INSERT COMMENT LOOP: init_array::for.cond76
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  tmp[(i * ni + j)] = 0;
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
int16_t num_blocks(int16_t num, int16_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_A_mul_B
void kernel_A_mul_B(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;
  int64_t k;
  double dot;

// INSERT COMMENT IFELSE: kernel_A_mul_B::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < ni) { // IFELSE MARKER: entry IF
  if (j < nj) { // IFELSE MARKER: land.lhs.true IF
  dot = 0;
for(int64_t k = 0; k < nk;   k = k + 1){
  dot = (dot + ((alpha * A[(i * nk + k)]) * B[(k * nj + j)]));
}
  tmp[(i * nj + j)] = dot;
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_D_plus_tmp_mul_C
void kernel_D_plus_tmp_mul_C(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t l;
  double dot;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_D_plus_tmp_mul_C::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  l = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < ni) { // IFELSE MARKER: entry IF
  if (l < nl) { // IFELSE MARKER: land.lhs.true IF
  dot = (D[(i * nj + l)] * beta);
for(int64_t j = 0; j < nj;   j = j + 1){
  dot = (dot + (tmp[(i * nj + j)] * C[(j * nl + l)]));
}
  D[(i * nl + l)] = dot;
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D) {
  struct Dim3 block;    /* Address-exposed local */
  struct Dim3 grid;    /* Address-exposed local */
  struct Dim3 grid_copy1;    /* Address-exposed local */
  struct Dim3 block_copy1;    /* Address-exposed local */
  struct CudaDim3Coerce grid_coerce1;    /* Address-exposed local */
  struct CudaDim3Coerce block_coerce1;    /* Address-exposed local */
  struct Dim3 grid_copy2;    /* Address-exposed local */
  struct Dim3 block_copy2;    /* Address-exposed local */
  struct CudaDim3Coerce grid_coerce2;    /* Address-exposed local */
  struct CudaDim3Coerce block_coerce2;    /* Address-exposed local */
  uint32_t blockDimXCount;
  int32_t numBlocksNi;
  int32_t numBlocksNj;
  uint8_t* tmp_bytes_ptr1;
  uint8_t* tmp_bytes_ptr2;
  uint8_t* tmp_bytes_ptr3;
  uint8_t* tmp_bytes_ptr4;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t numBlocksNi2;
  int32_t numBlocksNl;
  uint8_t* tmp_bytes_ptr5;
  uint8_t* tmp_bytes_ptr6;
  uint8_t* tmp_bytes_ptr7;
  uint8_t* tmp_bytes_ptr8;

  blockDimXCount = (256 / 32);
  block.dim3_x = blockDimXCount;
  block.dim3_y = 32;
  block.dim3_z = 1;
  numBlocksNi = num_blocks(ni, block.dim3_x);
  numBlocksNj = num_blocks(nj, block.dim3_y);
  grid.dim3_x = numBlocksNi;
  grid.dim3_y = numBlocksNj;
  grid.dim3_z = 1;
  memcpy(((uint8_t*)(&grid_copy1)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_copy1)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_coerce1)), ((uint8_t*)(&grid_copy1)), 12);
  memcpy(((uint8_t*)(&block_coerce1)), ((uint8_t*)(&block_copy1)), 12);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < numBlocksNi;   i = i + 1){
for(int32_t j = 0; j < numBlocksNj;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_A_mul_B(ni, nj, nk, nl, alpha, beta, tmp, A, B, C, D, numBlocksNi, numBlocksNj, 1, blockDimXCount, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  numBlocksNi2 = num_blocks(ni, block.dim3_x);
  numBlocksNl = num_blocks(nl, block.dim3_y);
  grid.dim3_x = numBlocksNi2;
  grid.dim3_y = numBlocksNl;
  grid.dim3_z = 1;
  memcpy(((uint8_t*)(&grid_copy2)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_copy2)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_coerce2)), ((uint8_t*)(&grid_copy2)), 12);
  memcpy(((uint8_t*)(&block_coerce2)), ((uint8_t*)(&block_copy2)), 12);
// INSERT COMMENT LOOP: kernel::header.07
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < numBlocksNi2;   i = i + 1){
for(int32_t j = 0; j < numBlocksNl;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_D_plus_tmp_mul_C(ni, nj, nk, nl, alpha, beta, tmp, A, B, C, D, numBlocksNi2, numBlocksNl, 1, blockDimXCount, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t ni, uint32_t nl, double* D) {
  int64_t i;
  int64_t j;
  int32_t tmp_index;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  fprintf(stderr, (print_format_double), D[(i * ni + j)]);
  if ((int)(i * ni + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (print_newline));
  }
}
}
  fprintf(stderr, (print_newline));
}
