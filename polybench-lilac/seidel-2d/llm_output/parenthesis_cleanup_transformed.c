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
struct PackedDim3;

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
  uint8_t* read_ptr;
  uint8_t* read_end;
  uint8_t* write_base;
  uint8_t* write_ptr;
  uint8_t* write_end;
  uint8_t* buf_base;
  uint8_t* buf_end;
  uint8_t* buf_size;
  uint8_t* unget_buf;
  uint8_t* tmp_buf;
  uint8_t* get_buf;
  void* cookie;
  struct IOFile* prev;
  uint32_t line_cnt;
  uint32_t max_line;
  uint64_t position;
  uint16_t shortbuf_len;
  uint8_t mode;
  uint8_t small_buf[1];
  uint8_t* name;
  uint64_t seek_offset;
  void* lock_ptr;
  void* vtable;
  struct IOFile* next;
  uint8_t* open_buf;
  uint64_t cookie_offset;
  uint32_t fd;
  uint8_t reserved[20];
};
struct dim3 {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct PackedDim3 {
  uint64_t packed_dims;
  uint32_t padding;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_stencil(uint32_t, uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t print_value_format[8] = { "%0.2lf " };
uint8_t newline_format[2] = { "\n" };


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
  int32_t unused_call14;
  int32_t unused_call18;

// INSERT COMMENT IFELSE: main::entry
  dump_code = atoi(argv[1]);
  n = atoi(argv[2]);
  tsteps = atoi(argv[3]);
  A = malloc(n * n * 8);
  init_array(n, (double*)A);
;
  kernel(tsteps, n, (double*)A);
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(n, (double*)A);
  }
free((uint8_t*)((double*)A));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  A[(i * n + j)] = ((((double)(i) * (double)((j + 2))) + 2) / (double)(n));
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_stencil
void kernel_stencil(uint32_t tsteps, uint32_t n, double* A, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;

// INSERT COMMENT IFELSE: kernel_stencil::entry
  i = blockDim_x * blockIdx_x + threadIdx_x + 1;
  j = blockDim_y * blockIdx_y + threadIdx_y + 1;
  if (i < (n - 1)) { // IFELSE MARKER: entry IF
  if (j < (n - 1)) { // IFELSE MARKER: land.lhs.true IF
  __auto_type row_im1 = (i - 1) * n;
  __auto_type row_i = i * n;
  __auto_type row_ip1 = (i + 1) * n;
  __auto_type idx_im1_jm1 = row_im1 + (j - 1);
  __auto_type idx_im1_j = row_im1 + j;
  __auto_type idx_im1_jp1 = row_im1 + (j + 1);
  __auto_type idx_i_jm1 = row_i + (j - 1);
  __auto_type idx_i_j = row_i + j;
  __auto_type idx_i_jp1 = row_i + (j + 1);
  __auto_type idx_ip1_jm1 = row_ip1 + (j - 1);
  __auto_type idx_ip1_j = row_ip1 + j;
  __auto_type idx_ip1_jp1 = row_ip1 + (j + 1);
  __auto_type v_im1_jm1 = A[idx_im1_jm1];
  __auto_type v_im1_j = A[idx_im1_j];
  __auto_type v_im1_jp1 = A[idx_im1_jp1];
  __auto_type v_i_jm1 = A[idx_i_jm1];
  __auto_type v_i_j = A[idx_i_j];
  __auto_type v_i_jp1 = A[idx_i_jp1];
  __auto_type v_ip1_jm1 = A[idx_ip1_jm1];
  __auto_type v_ip1_j = A[idx_ip1_j];
  __auto_type v_ip1_jp1 = A[idx_ip1_jp1];
  __auto_type sum9 = v_im1_jm1 + v_im1_j + v_im1_jp1 + v_i_jm1 + v_i_j + v_i_jp1 + v_ip1_jm1 + v_ip1_j + v_ip1_jp1;
  __auto_type avg9 = sum9 / 9.0;
  A[(i * n + j)] = avg9;
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t tsteps, uint32_t n, double* A) {
  struct dim3 block;    /* Address-exposed local */
  struct dim3 grid;    /* Address-exposed local */
  struct dim3 dim3_grid_copy;    /* Address-exposed local */
  struct dim3 dim3_block_copy;    /* Address-exposed local */
  struct PackedDim3 packed_grid_copy;    /* Address-exposed local */
  struct PackedDim3 packed_block_copy;    /* Address-exposed local */
  int32_t t;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

// INSERT COMMENT LOOP: kernel::for.cond
for(int32_t t = 1; t <= tsteps;   t = t + 1){
  block.x = 8;
  block.y = 32;
  block.z = 1;
  uint32_t num_blocks_x = num_blocks((n - 2), block.x);
  uint32_t num_blocks_y = num_blocks((n - 2), block.y);
  grid.x = num_blocks_x;
  grid.y = num_blocks_y;
  grid.z = 1;
  memcpy((uint8_t*)(&dim3_grid_copy), ((uint8_t*)(&grid)), 12);
  memcpy((uint8_t*)(&dim3_block_copy), ((uint8_t*)(&block)), 12);
  memcpy((uint8_t*)(&packed_grid_copy), ((uint8_t*)(&dim3_grid_copy)), 12);
  memcpy((uint8_t*)(&packed_block_copy), ((uint8_t*)(&dim3_block_copy)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < num_blocks_x;   j = j + 1){
for(int32_t k = 0; k < num_blocks_y;   k = k + 1){
for(int32_t l = 0; l < 8;   l = l + 1){
for(int32_t m = 0; m < 32;   m = m + 1){
kernel_stencil(tsteps, n, A, num_blocks_x, num_blocks_y, 1, 8, 32, 1, j, k, 0, l, m, 0);
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
  int32_t tmp_index;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  fprintf(stderr, print_value_format, A[(i * n + j)]);
  if ((int)(i * n + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, newline_format);
  }
}
}
  fprintf(stderr, newline_format);
}
