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

static __forceinline int llvm_fcmp_oeq(double X, double Y) { return X == Y; }


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
double max(double, double) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
double fmax(double, double);
void kernel_max_score(uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */


// INSERT COMMENT FUNCTION: max
double max(double a, double b) {
  double fmax_result;

  fmax_result = fmax(a, b);
  return fmax_result;
}


// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return (num + factor - 1) / factor;
}


// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, double* table, double* oldtable, double* seq) {
  int64_t i;
  uint64_t j;

  // INSERT COMMENT LOOP: for.cond
  for(int64_t i = 0; i < n;   i = i + 1){
    for(int64_t j = 0; j < n;   j = j + 1){
      table[(i * n + j)] = ((double)i * (double)j) / (double)n;
      oldtable[(i * n + j)] = ((double)i * (double)j) / (double)n;
    }
  }
  // INSERT COMMENT LOOP: for.cond19
  for(int64_t i = 0; i < n;   i = i + 1){
    seq[i] = ((double)i / (double)n);
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel_max_score
void kernel_max_score(uint32_t n, double* seq, double* table, double* oldtable, uint32_t w, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  uint32_t block_offset;
  int64_t j;
  int64_t i;
  double maximum;
  double upd;
  int64_t k;

  // INSERT COMMENT IFELSE: entry
  block_offset = block_dim_x * block_idx_x;
  j = block_offset + thread_idx_x;
  i = n - 1 + j - w;
  if (0 <= i < n && i + 1 <= j < n && j >= 1) {
    if (j - 1 >= 0) {
      maximum = max(maximum, table[i * n + (j - 1)]);
    }
    if (i + 1 < n) {
      maximum = max(maximum, table[(i + 1) * n + j]);
    }
    if (j - 1 >= 0 && i + 1 < n) {
      if (i < j - 1) {
        upd = (upd + (llvm_fcmp_oeq(seq[i] + seq[j], 3) ? 1 : 0));
        maximum = max(maximum, upd);
      }
      maximum = max(maximum, upd);
    }
    for(int64_t k = (thread_idx_x + n + block_offset - w); k < j;   k = k + 1){
      maximum = max(maximum, table[(i * n + k)] + table[(k + 1) * n + j]);
    }
    table[(i * n + j)] = maximum;
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t n, double* seq, double* table, double* oldtable) {
  struct cuda_dim3_equivalent grid_config;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced;    /* Address-exposed local */
  int32_t w;
  uint32_t j;
  uint32_t k;

  // INSERT COMMENT LOOP: for.cond
  for(int32_t w = n; w < (2 * n - 1);   w = w + 1){
    uint32_t grid_dim_x_val = num_blocks(n, 32);
    grid_config.x = grid_dim_x_val;
    grid_config.y = 1;
    grid_config.z = 1;
    block_config.x = 32;
    block_config.y = 1;
    block_config.z = 1;
    memcpy(((uint8_t*)(&grid_config_coerced)), ((uint8_t*)(&grid_config)), 12);
    memcpy(((uint8_t*)(&block_config_coerced)), ((uint8_t*)(&block_config)), 12);
#pragma omp parallel for collapse(2)
    for(int32_t j = 0; j < grid_dim_x_val;   j = j + 1){
      for(int32_t k = 0; k < 32;   k = k + 1){
        kernel_max_score(n, seq, table, oldtable, w, grid_dim_x_val, 1, 1, 32, 1, 1, j, 0, 0, k, 0, 0);
      }
    }
  }
  return;
}


// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t n, double* table) {
  int64_t i;
  uint64_t j;
  int32_t unused_fprintf_return_val_final;

  // INSERT COMMENT LOOP: for.cond
  for(int64_t i = 0; i < n;   i = i + 1){
    for(int64_t j = 0; j < n;   j = j + 1){
      uint32_t grid_dim_x_val = fprintf(stderr, "0.2lf ", table[i * n + j]);
      if ((int)(i * n + j) % (int)20 == 0) {
        fprintf(stderr, "\n");
      }
    }
  }
  fprintf(stderr, "\n");
}


int main(int argc, char ** argv) {
  int32_t dump_code;
  int32_t n;
  uint8_t* table;
  uint8_t* oldtable;
  uint8_t* seq;
  int32_t unused_kernel_call_return;
  int32_t unused_print_array_call_return;

  // INSERT COMMENT IFELSE: entry
  dump_code = atoi(argv[1]);
  n = atoi(argv[2]);
  table = malloc(n * n * sizeof(double));
  oldtable = malloc(n * n * sizeof(double));
  seq = malloc(n * sizeof(double));
  init_array(n, (double*)table, (double*)oldtable, (double*)seq);
  ;
  kernel(n, (double*)seq, (double*)table, (double*)oldtable);
  ;
  if (dump_code == 1) {
    print_array(n, (double*)table);
  }
  free((uint8_t*)(double*)table);
  free((uint8_t*)(double*)oldtable);
  free((uint8_t*)(double*)seq);
  return 0;
}
