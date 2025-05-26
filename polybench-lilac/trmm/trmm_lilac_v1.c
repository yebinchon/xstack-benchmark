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
void kernel(uint32_t, uint32_t, double, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_contract(uint32_t, uint32_t, double, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_alpha(uint32_t, uint32_t, double, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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


// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return (num + factor - 1) / factor;
}


// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, uint32_t m, double* alpha, double* A, double* B) {
  int64_t i;
  int64_t j;
  uint32_t inner_loop_var_j_init;

  *alpha = 32412;
  // INSERT COMMENT LOOP: for.cond
  for(int64_t i = 0; i < n;   i = i + 1){
    for(int64_t j = 0; j < m;   j = j + 1){
      A[(i * m + j)] = ((double)i * (double)j) / (double)m;
      B[(j * n + j)] = ((double)i * (double)j) / (double)n;
    }
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel_alpha
void kernel_alpha(uint32_t n, uint32_t m, double alpha, double* B, double* A, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;
  int32_t j;

  // INSERT COMMENT IFELSE: entry
  i = block_dim_x * block_idx_x + thread_idx_x;
  j = block_dim_y * block_idx_y + thread_idx_y;
  if (i < m && j < n) {
    B[(i * n + j)] = B[(i * n + j)] * alpha;
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel_contract
void kernel_contract(uint32_t n, uint32_t m, double alpha, double* B, double* A, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t j;
  int64_t i;
  uint32_t unused_loop_var_placeholder;
  uint64_t k;

  // INSERT COMMENT IFELSE: entry
  j = block_dim_x * block_idx_x + thread_idx_x;
  if (j < n) {
    for(int64_t i = 0; i < m;   i = i + 1){
      for(int64_t k = i; k < m;   k = k + 1){
        B[(i * n + j)] = B[(i * n + j)] + A[(k * m + i)] * B[(k * n + j)];
      }
    }
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t n, uint32_t m, double alpha, double* A, double* B) {
  struct cuda_dim3_equivalent grid_config_contract;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_contract;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_contract;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_contract;    /* Address-exposed local */
  struct cuda_dim3_equivalent block;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_alpha;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_alpha;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_alpha;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_alpha;    /* Address-exposed local */
  int32_t grid_dim_x_contract;
  uint8_t* unused_contract_placeholder_1;
  uint8_t* unused_contract_placeholder_2;
  uint32_t i;
  uint32_t j;
  int32_t grid_dim_x_alpha;
  int32_t grid_dim_y_alpha;
  uint8_t* unused_alpha_placeholder_1;
  uint8_t* unused_alpha_placeholder_2;
  uint8_t* unused_alpha_placeholder_3;
  uint8_t* unused_alpha_placeholder_4;
  uint32_t k;
  uint32_t l;

  grid_dim_x_contract = num_blocks(n, 256);
  grid_config_contract.x = grid_dim_x_contract;
  grid_config_contract.y = 1;
  grid_config_contract.z = 1;
  block_config_contract.x = 256;
  block_config_contract.y = 1;
  block_config_contract.z = 1;
  memcpy((uint8_t*)(&grid_config_coerced_contract), (uint8_t*)(&grid_config_contract), 12);
  memcpy((uint8_t*)(&block_config_coerced_contract), (uint8_t*)(&block_config_contract), 12);
  // INSERT COMMENT LOOP: header.0
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_contract;   i = i + 1){
    for(int32_t j = 0; j < 256;   j = j + 1){
      kernel_contract(n, m, alpha, B, A, grid_dim_x_contract, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
    }
  }
  grid_dim_x_alpha = num_blocks(m, 8);
  grid_dim_y_alpha = num_blocks(n, 32);
  grid.x = grid_dim_x_alpha;
  grid.y = grid_dim_y_alpha;
  grid.z = 1;
  memcpy((uint8_t*)(&grid_config_alpha), (uint8_t*)(&grid), 12);
  memcpy((uint8_t*)(&block_config_alpha), (uint8_t*)(&block), 12);
  memcpy((uint8_t*)(&grid_config_coerced_alpha), (uint8_t*)(&grid_config_alpha), 12);
  memcpy((uint8_t*)(&block_config_coerced_alpha), (uint8_t*)(&block_config_alpha), 12);
  // INSERT COMMENT LOOP: header.010
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_alpha;   i = i + 1){
    for(int32_t j = 0; j < grid_dim_y_alpha;   j = j + 1){
      for(int32_t k = 0; k < 8;   k = k + 1){
        for(int32_t l = 0; l < 32;   l = l + 1){
          kernel_alpha(n, m, alpha, B, A, grid_dim_x_alpha, grid_dim_y_alpha, 1, 8, 32, 1, i, j, 0, k, l, 0);
        }
      }
    }
  }
  return;
}


// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t m, uint32_t n, double* B) {
  int64_t i;
  int64_t j;
  int32_t unused_fprintf_return_val_final;

  // INSERT COMMENT LOOP: for.cond
  for(int64_t i = 0; i < m;   i = i + 1){
    for(int64_t j = 0; j < n;   j = j + 1){
      uint32_t grid_dim_x_contract = fprintf(stderr, "0.2lf ", B[(i * n + j)]);
      if ((int)(i * n + j) % (int)20 == 0) {
        fprintf(stderr, "\n");
      }
    }
  }
  fprintf(stderr, "\n");
}


int main(int argc, char ** argv) {
  double alpha;    /* Address-exposed local */
  int32_t n;
  int32_t m;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* B;

  // INSERT COMMENT IFELSE: entry
  n = atoi(argv[2]);
  m = atoi(argv[3]);
  dump_code = atoi(argv[1]);
  A = malloc(n * m * sizeof(double));
  B = malloc(m * n * sizeof(double));
  init_array(n, m, (&alpha), (double*)A, (double*)B);
  ;
  kernel(n, m, alpha, (double*)A, (double*)B);
  ;
  if (dump_code == 1) {
    print_array(m, n, (double*)B);
  }
  free((uint8_t*)(double*)A);
  return 0;
}
