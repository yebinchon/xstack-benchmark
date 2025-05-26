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
void init_array(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_splat(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_ey(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_ex(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_hz(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
void init_array(uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* _fict_) {
  int64_t i;
  int64_t j;

  // INSERT COMMENT LOOP: for.cond
  for(int64_t i = 0; i < ny;   i = i + 1){
    _fict_[i] = (double)i;
  }
  // INSERT COMMENT LOOP: for.cond1
  for(int64_t i = 0; i < nx;   i = i + 1){
    for(int64_t j = 0; j < ny;   j = j + 1){
      ex[(i * ny + j)] = ((double)i * (double)j) / (double)nx;
      ey[(i * ny + j)] = ((double)i * (double)((j + 2))) / (double)ny;
      hz[(i * ny + j)] = ((double)i * (double)((j + 3))) / (double)nx;
    }
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel_hz
void kernel_hz(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;
  int32_t j;

  // INSERT COMMENT IFELSE: entry
  i = block_dim_x * block_idx_x + thread_idx_x;
  j = block_dim_y * block_idx_y + thread_idx_y;
  if (i < nx - 1 && j < ny - 1) {
    hz[i * ny + j] = hz[i * ny + j] - 0.69999999999999996 * (ex[i * ny + j + 1] - ex[i * ny + j] + ey[(i + 1) * ny + j] - ey[i * ny + j]);
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel_ex
void kernel_ex(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;
  int32_t j;

  // INSERT COMMENT IFELSE: entry
  i = block_dim_x * block_idx_x + thread_idx_x;
  j = block_dim_y * block_idx_y + thread_idx_y + 1;
  if (i < nx && j < ny) {
    ex[i * ny + j] = ex[i * ny + j] - 0.5 * (hz[i * ny + j] - hz[i * ny + j - 1]);
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel_ey
void kernel_ey(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;
  int32_t j;

  // INSERT COMMENT IFELSE: entry
  i = block_dim_x * block_idx_x + thread_idx_x + 1;
  j = block_dim_y * block_idx_y + thread_idx_y;
  if (i < nx && j < ny) {
    ey[i * ny + j] = ey[i * ny + j] - 0.5 * (hz[i * ny + j] - hz[(i - 1) * ny + j]);
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel_splat
void kernel_splat(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t j;

  // INSERT COMMENT IFELSE: entry
  j = block_dim_x * block_idx_x + thread_idx_x;
  if (j < ny) {
    ey[j] = fict[t];
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict) {
  struct cuda_dim3_equivalent block_config_splat;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_splat;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_splat;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_splat;    /* Address-exposed local */
  struct cuda_dim3_equivalent block;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_ey;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_ey;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_ey;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_ey;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_ex;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_ex;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_ex;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_ex;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_hz;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_hz;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_hz;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_hz;    /* Address-exposed local */
  int32_t t;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

  // INSERT COMMENT LOOP: for.cond
  for(int32_t t = 0; t < tmax;   t = t + 1){
    block_config_splat.x = 256;
    block_config_splat.y = 1;
    block_config_splat.z = 1;
    uint32_t grid_dim_x_splat = num_blocks(ny, 256);
    grid_config_splat.x = grid_dim_x_splat;
    grid_config_splat.y = 1;
    grid_config_splat.z = 1;
    memcpy(((uint8_t*)(&block_config_coerced_splat)), ((uint8_t*)(&block_config_splat)), 12);
    memcpy(((uint8_t*)(&grid_config_coerced_splat)), ((uint8_t*)(&grid_config_splat)), 12);
#pragma omp parallel for collapse(2)
    for(int32_t j = 0; j < 256;   j = j + 1){
      for(int32_t k = 0; k < grid_dim_x_splat;   k = k + 1){
        kernel_splat(tmax, nx, ny, ex, ey, hz, fict, t, 256, 1, 1, grid_dim_x_splat, 1, 1, j, 0, 0, k, 0, 0);
      }
    }
    uint32_t grid_dim_x_ey = num_blocks((nx - 1), 8);
    uint32_t grid_dim_y_ey = num_blocks(ny, 32);
    grid.x = grid_dim_x_ey;
    grid.y = grid_dim_y_ey;
    grid.z = 1;
    memcpy(((uint8_t*)(&grid_config_ey)), ((uint8_t*)(&grid)), 12);
    memcpy(((uint8_t*)(&block_config_ey)), ((uint8_t*)(&block)), 12);
    memcpy(((uint8_t*)(&grid_config_coerced_ey)), ((uint8_t*)(&grid_config_ey)), 12);
    memcpy(((uint8_t*)(&block_config_coerced_ey)), ((uint8_t*)(&block_config_ey)), 12);
#pragma omp parallel for collapse(2)
    for(int32_t j = 0; j < grid_dim_x_ey;   j = j + 1){
      for(int32_t k = 0; k < grid_dim_y_ey;   k = k + 1){
        for(int32_t l = 0; l < 8;   l = l + 1){
          for(int32_t m = 0; m < 32;   m = m + 1){
            kernel_ey(tmax, nx, ny, ex, ey, hz, fict, t, grid_dim_x_ey, grid_dim_y_ey, 1, 8, 32, 1, j, k, 0, l, m, 0);
          }
        }
      }
    }
    uint32_t grid_dim_x_ex = num_blocks(nx, 8);
    uint32_t grid_dim_y_ex = num_blocks((ny - 1), 32);
    grid.x = grid_dim_x_ex;
    grid.y = grid_dim_y_ex;
    grid.z = 1;
    memcpy(((uint8_t*)(&grid_config_ex)), ((uint8_t*)(&grid)), 12);
    memcpy(((uint8_t*)(&block_config_ex)), ((uint8_t*)(&block)), 12);
    memcpy(((uint8_t*)(&grid_config_coerced_ex)), ((uint8_t*)(&grid_config_ex)), 12);
    memcpy(((uint8_t*)(&block_config_coerced_ex)), ((uint8_t*)(&block_config_ex)), 12);
#pragma omp parallel for collapse(2)
    for(int32_t j = 0; j < grid_dim_x_ex;   j = j + 1){
      for(int32_t k = 0; k < grid_dim_y_ex;   k = k + 1){
        for(int32_t l = 0; l < 8;   l = l + 1){
          for(int32_t m = 0; m < 32;   m = m + 1){
            kernel_ex(tmax, nx, ny, ex, ey, hz, fict, t, grid_dim_x_ex, grid_dim_y_ex, 1, 8, 32, 1, j, k, 0, l, m, 0);
          }
        }
      }
    }
    uint32_t grid_dim_x_hz = num_blocks((nx - 1), 8);
    uint32_t grid_dim_y_hz = num_blocks((ny - 1), 32);
    grid.x = grid_dim_x_hz;
    grid.y = grid_dim_y_hz;
    grid.z = 1;
    memcpy(((uint8_t*)(&grid_config_hz)), ((uint8_t*)(&grid)), 12);
    memcpy(((uint8_t*)(&block_config_hz)), ((uint8_t*)(&block)), 12);
    memcpy(((uint8_t*)(&grid_config_coerced_hz)), ((uint8_t*)(&grid_config_hz)), 12);
    memcpy(((uint8_t*)(&block_config_coerced_hz)), ((uint8_t*)(&block_config_hz)), 12);
#pragma omp parallel for collapse(2)
    for(int32_t j = 0; j < grid_dim_x_hz;   j = j + 1){
      for(int32_t k = 0; k < grid_dim_y_hz;   k = k + 1){
        for(int32_t l = 0; l < 8;   l = l + 1){
          for(int32_t m = 0; m < 32;   m = m + 1){
            kernel_hz(tmax, nx, ny, ex, ey, hz, fict, t, grid_dim_x_hz, grid_dim_y_hz, 1, 8, 32, 1, j, k, 0, l, m, 0);
          }
        }
      }
    }
  }
  return;
}


// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz) {
  int64_t i;
  int64_t j;
  int32_t unused_fprintf_return_val_final;

  // INSERT COMMENT LOOP: for.cond
  for(int64_t i = 0; i < nx;   i = i + 1){
    for(int64_t j = 0; j < ny;   j = j + 1){
      uint32_t grid_dim_x_splat = fprintf(stderr, "0.2lf ", ex[i * ny + j]);
      uint32_t fprintf_return_val_loop_ey = fprintf(stderr, "0.2lf ", ey[i * ny + j]);
      uint32_t fprintf_return_val_loop_hz = fprintf(stderr, "0.2lf ", hz[i * ny + j]);
      if ((int)(i * nx + j) % (int)20 == 0) {
        fprintf(stderr, "\n");
      }
    }
  }
  fprintf(stderr, "\n");
}


int main(int argc, char ** argv) {
  int32_t tmax;
  int32_t nx;
  int32_t ny;
  int32_t dump_code;
  uint8_t* ex;
  uint8_t* ey;
  uint8_t* hz;
  uint8_t* _fict_;
  int32_t unused_kernel_call_return;
  int32_t unused_print_array_call_return;

  // INSERT COMMENT IFELSE: entry
  tmax = atoi(argv[2]);
  nx = atoi(argv[3]);
  ny = atoi(argv[4]);
  dump_code = atoi(argv[1]);
  ex = malloc(nx * ny * sizeof(double));
  ey = malloc(nx * ny * sizeof(double));
  hz = malloc(nx * ny * sizeof(double));
  _fict_ = malloc(ny * sizeof(double));
  init_array(nx, ny, (double*)ex, (double*)ey, (double*)hz, (double*)_fict_);
  ;
  kernel(tmax, nx, ny, (double*)ex, (double*)ey, (double*)hz, (double*)_fict_);
  ;
  if (dump_code == 1) {
    print_array(nx, ny, (double*)ex, (double*)ey, (double*)hz);
  }
  free((uint8_t*)(double*)ex);
  free((uint8_t*)(double*)ey);
  free((uint8_t*)(double*)hz);
  free((uint8_t*)(double*)_fict_);
  return 0;
}
