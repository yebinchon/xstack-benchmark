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

#define PI 3.1415926535897931

/* Global Declarations */

/* Types Declarations */
struct poly_standard_IO_FILE;
struct cuda_dim3_equivalent;
struct internal_dim3_coercion_helper;

/* Function definitions */

/* Types Definitions */
struct llvm_generated_array_1_uint8 {
  uint8_t array[1];
};
struct llvm_generated_array_20_uint8 {
  uint8_t array[20];
};
struct poly_standard_IO_FILE {
  uint32_t flags;
  uint8_t* io_read_ptr;
  uint8_t* io_read_end;
  uint8_t* io_read_base;
  uint8_t* io_write_base;
  uint8_t* io_write_ptr;
  uint8_t* io_write_end;
  uint8_t* io_buf_base;
  uint8_t* io_buf_end;
  uint8_t* io_save_base;
  uint8_t* io_backup_base;
  uint8_t* io_save_end;
  void* markers;
  struct poly_standard_IO_FILE* chain;
  uint32_t fileno;
  uint32_t internal_flags;
  uint64_t offset;
  uint16_t cur_column;
  uint8_t vtable_offset;
  uint8_t shortbuf[1];
  uint8_t* lock;
  uint64_t wide_offset;
  void* codecvt_ptr;
  void* wide_data_ptr;
  struct poly_standard_IO_FILE* freeres_list;
  uint8_t* freeres_buf_ptr;
  uint64_t padding_field;
  uint32_t mode;
  uint8_t unused_buffer_space[20];
};
struct cuda_dim3_equivalent {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct internal_dim3_coercion_helper {
  uint64_t dim_xy_packed;
  uint32_t dim_z;
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


// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return (num + factor - 1) / factor;
}


// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t nx, uint32_t ny, double* A, double* r, double* p) {
  int64_t i;
  int64_t j;

  // INSERT COMMENT LOOP: for.cond
  for(int64_t i = 0; i < ny;   i = i + 1){
    p[i] = (double)i * PI;
  }
  // INSERT COMMENT LOOP: for.cond1
  for(int64_t i = 0; i < nx;   i = i + 1){
    r[i] = (double)i * PI;
    for(int64_t j = 0; j < ny;   j = j + 1){
      A[i * ny + j] = ((double)i * (double)j) / (double)nx;
    }
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel_s
void kernel_s(uint32_t m, uint32_t n, double* A, double* s, double* q, double* p, double* r, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int64_t j;
  int64_t i;
  double dot;

  // INSERT COMMENT IFELSE: entry
  j = block_dim_x * block_idx_x + thread_idx_x;
  if (j < m) {
    s[j] = 0;
    dot = 0;
    for(int64_t i = 0; i < n;   i = i + 1){
      dot = dot + r[i] * A[i * m + j];
    }
    s[j] = dot;
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel_q
void kernel_q(uint32_t m, uint32_t n, double* A, double* s, double* q, double* p, double* r, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int64_t i;
  int64_t j;
  double dot;

  // INSERT COMMENT IFELSE: entry
  i = block_dim_x * block_idx_x + thread_idx_x;
  if (i < n) {
    q[i] = 0;
    dot = 0;
    for(int64_t j = 0; j < m;   j = j + 1){
      dot = dot + A[i * m + j] * p[j];
    }
    q[i] = q[i] + dot;
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t m, uint32_t n, double* A, double* s, double* q, double* p, double* r) {
  struct cuda_dim3_equivalent grid_config_kernel_q;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_kernel_q;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_kernel_q;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_kernel_q;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_kernel_s;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_kernel_s;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_kernel_s;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_kernel_s;    /* Address-exposed local */
  int32_t grid_dim_x_kernel_q;
  uint8_t* unused_kernel_q_placeholder1;
  uint8_t* unused_kernel_q_placeholder2;
  uint32_t i;
  uint32_t j;
  int32_t grid_dim_x_kernel_s;
  uint8_t* unused_kernel_s_placeholder1;
  uint8_t* unused_kernel_s_placeholder2;

  grid_dim_x_kernel_q = num_blocks(n, 256);
  grid_config_kernel_q.x = grid_dim_x_kernel_q;
  grid_config_kernel_q.y = 1;
  grid_config_kernel_q.z = 1;
  block_config_kernel_q.x = 256;
  block_config_kernel_q.y = 1;
  block_config_kernel_q.z = 1;
  memcpy(((uint8_t*)(&grid_config_coerced_kernel_q)), ((uint8_t*)(&grid_config_kernel_q)), 12);
  memcpy(((uint8_t*)(&block_config_coerced_kernel_q)), ((uint8_t*)(&block_config_kernel_q)), 12);
  // INSERT COMMENT LOOP: header.0
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_kernel_q;   i = i + 1){
    for(int32_t j = 0; j < 256;   j = j + 1){
      kernel_q(m, n, A, s, q, p, r, grid_dim_x_kernel_q, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
    }
  }
  grid_dim_x_kernel_s = num_blocks(m, 256);
  grid_config_kernel_s.x = grid_dim_x_kernel_s;
  grid_config_kernel_s.y = 1;
  grid_config_kernel_s.z = 1;
  block_config_kernel_s.x = 256;
  block_config_kernel_s.y = 1;
  block_config_kernel_s.z = 1;
  memcpy(((uint8_t*)(&grid_config_coerced_kernel_s)), ((uint8_t*)(&grid_config_kernel_s)), 12);
  memcpy(((uint8_t*)(&block_config_coerced_kernel_s)), ((uint8_t*)(&block_config_kernel_s)), 12);
  // INSERT COMMENT LOOP: header.010
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_kernel_s;   i = i + 1){
    for(int32_t j = 0; j < 256;   j = j + 1){
      kernel_s(m, n, A, s, q, p, r, grid_dim_x_kernel_s, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
    }
  }
  return;
}


// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t nx, uint32_t ny, double* s, double* q) {
  int64_t i;
  int32_t unused_fprintf_return_final;

  // INSERT COMMENT LOOP: for.cond
  for(int64_t i = 0; i < ny;   i = i + 1){
    uint32_t grid_dim_x_kernel_q = fprintf(stderr, "0.2lf ", s[i]);
    if (i % 20 == 0) {
      fprintf(stderr, "\n");
    }
  }
  // INSERT COMMENT LOOP: for.cond3
  for(int64_t i = 0; i < nx;   i = i + 1){
    uint32_t fprintf_return_loop_q = fprintf(stderr, "0.2lf ", q[i]);
    if (i % 20 == 0) {
      fprintf(stderr, "\n");
    }
  }
  fprintf(stderr, "\n");
}


int main(int argc, char ** argv) {
  int32_t m;
  int32_t n;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* s;
  uint8_t* q;
  uint8_t* p;
  uint8_t* r;
  int32_t unused_kernel_call_return;
  int32_t unused_print_array_call_return;

  // INSERT COMMENT IFELSE: entry
  m = atoi(argv[2]);
  n = atoi(argv[3]);
  dump_code = atoi(argv[1]);
  A = malloc(m * n * sizeof(double));
  s = malloc(n * sizeof(double));
  q = malloc(m * sizeof(double));
  p = malloc(n * sizeof(double));
  r = malloc(m * sizeof(double));
  init_array(m, n, (double*)A, (double*)r, (double*)p);
  ;
  kernel(m, n, (double*)A, (double*)s, (double*)q, (double*)p, (double*)r);
  ;
  if (dump_code == 1) {
    print_array(m, n, (double*)s, (double*)q);
  }
  free((uint8_t*)(double*)A);
  free((uint8_t*)(double*)s);
  free((uint8_t*)(double*)q);
  free((uint8_t*)(double*)p);
  free((uint8_t*)(double*)r);
  return 0;
}
