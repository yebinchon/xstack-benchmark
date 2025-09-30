#define BLOCK_SIZE_NY_1 256
#define TILE_DIM_L_1 8
#define TILE_DIM_M_1 32
#define BLOCK_STRUCT_SIZE_BYTES_1 12

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
struct Internal_FILE;
struct dim3_t;
struct dim3_packed_u32x3;

/* Function definitions */

/* Types Definitions */
struct array_u8_1 {
  uint8_t array[1];
};
struct array_u8_20 {
  uint8_t array[20];
};
struct Internal_FILE {
  uint32_t file_flags;
  uint8_t* read_pos;
  uint8_t* read_end;
  uint8_t* write_pos;
  uint8_t* write_end;
  uint8_t* buf_base;
  uint8_t* buf_end;
  uint8_t* buf_ptr;
  uint8_t* unget_buf_ptr;
  uint8_t* linebuf_ptr;
  uint8_t* save_area;
  uint8_t* save_end_ptr;
  void* cookie;
  struct Internal_FILE* prev;
  uint32_t mode;
  uint32_t fd;
  uint64_t file_pos;
  uint16_t orientation;
  uint8_t small_char;
  uint8_t smallbuf1[1];
  uint8_t* ungetc_buf;
  uint64_t file_size;
  void* lock;
  void* locale;
  struct Internal_FILE* next;
  uint8_t* filename;
  uint64_t reserved64;
  uint32_t checksum;
  uint8_t pad20[20];
};
struct dim3_t {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct dim3_packed_u32x3 {
  uint64_t dim3_packed_u64;
  uint32_t dim3_packed_u32;
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
uint8_t print_format[8] = { "%0.2lf " };
uint8_t newline[2] = { "\n" };


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
  int32_t tmax;
  int32_t nx;
  int32_t ny;
  int32_t dump_code;
  uint8_t* ex;
  uint8_t* ey;
  uint8_t* hz;
  uint8_t* _fict_;
  int32_t unused_call38;
  int32_t unused_call53;

// INSERT COMMENT IFELSE: main::entry
  tmax = atoi(argv[2]);
  nx = atoi(argv[3]);
  ny = atoi(argv[4]);
  dump_code = atoi(argv[1]);
  ex = malloc(nx * ny * 8);
  ey = malloc(nx * ny * 8);
  hz = malloc(nx * ny * 8);
  _fict_ = malloc(ny * 8);
  init_array(nx, ny, ((double*)ex), ((double*)ey), ((double*)hz), ((double*)_fict_));
;
  kernel(tmax, nx, ny, ((double*)ex), ((double*)ey), ((double*)hz), ((double*)_fict_));
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(nx, ny, ((double*)ex), ((double*)ey), ((double*)hz));
  }
free(((uint8_t*)((double*)ex)));
free(((uint8_t*)((double*)ey)));
free(((uint8_t*)((double*)hz)));
free(((uint8_t*)((double*)_fict_)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* _fict_) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < ny;   i = i + 1){
  _fict_[i] = (double)(i);
}
// INSERT COMMENT LOOP: init_array::for.cond1
for(int64_t i = 0; i < nx;   i = i + 1){
for(int64_t j = 0; j < ny;   j = j + 1){
  ex[(i * ny + j)] = (((double)(i) * (double)((j + 1))) / (double)(nx));
  ey[(i * ny + j)] = (((double)(i) * (double)((j + 2))) / (double)(ny));
  hz[(i * ny + j)] = (((double)(i) * (double)((j + 3))) / (double)(nx));
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_splat
void kernel_splat(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t j;

// INSERT COMMENT IFELSE: kernel_splat::entry
  j = blockDim_x * blockIdx_x + threadIdx_x;
  if (j < ny) { // IFELSE MARKER: entry IF
  ey[(0 * ny + j)] = fict[t];
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_ey
void kernel_ey(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;

// INSERT COMMENT IFELSE: kernel_ey::entry
  i = blockDim_x * blockIdx_x + threadIdx_x + 1;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < nx) { // IFELSE MARKER: entry IF
  if (j < ny) { // IFELSE MARKER: land.lhs.true IF
  ey[(i * ny + j)] = (ey[(i * ny + j)] - (0.5 * (hz[(i * ny + j)] - hz[((i - 1) * ny + j)])));
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_ex
void kernel_ex(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;

// INSERT COMMENT IFELSE: kernel_ex::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y + 1;
  if (i < nx) { // IFELSE MARKER: entry IF
  if (j < ny) { // IFELSE MARKER: land.lhs.true IF
  ex[(i * ny + j)] = (ex[(i * ny + j)] - (0.5 * (hz[(i * ny + j)] - hz[((i * ny + j) - 1)])));
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_hz
void kernel_hz(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;

// INSERT COMMENT IFELSE: kernel_hz::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < (nx - 1)) { // IFELSE MARKER: entry IF
  if (j < (ny - 1)) { // IFELSE MARKER: land.lhs.true IF
  hz[(i * ny + j)] = (hz[(i * ny + j)] - (0.69999999999999996 * (((ex[((i * ny + j) + 1)] - ex[(i * ny + j)]) + ey[((i + 1) * ny + j)]) - ey[(i * ny + j)])));
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict) {
  struct dim3_t dim_thread_256;    /* Address-exposed local */
  struct dim3_t dim_grid_ny;    /* Address-exposed local */
  struct dim3_packed_u32x3 dim_thread_256_packed;    /* Address-exposed local */
  struct dim3_packed_u32x3 dim_grid_ny_packed;    /* Address-exposed local */
  struct dim3_t block;    /* Address-exposed local */
  struct dim3_t grid;    /* Address-exposed local */
  struct dim3_t dim_grid_ey;    /* Address-exposed local */
  struct dim3_t dim_block_ey;    /* Address-exposed local */
  struct dim3_packed_u32x3 dim_grid_ey_packed;    /* Address-exposed local */
  struct dim3_packed_u32x3 dim_block_ey_packed;    /* Address-exposed local */
  struct dim3_t dim_grid_ex;    /* Address-exposed local */
  struct dim3_t dim_block_ex;    /* Address-exposed local */
  struct dim3_packed_u32x3 dim_grid_ex_packed;    /* Address-exposed local */
  struct dim3_packed_u32x3 dim_block_ex_packed;    /* Address-exposed local */
  struct dim3_t dim_grid_hz;    /* Address-exposed local */
  struct dim3_t dim_block_hz;    /* Address-exposed local */
  struct dim3_packed_u32x3 dim_grid_hz_packed;    /* Address-exposed local */
  struct dim3_packed_u32x3 dim_block_hz_packed;    /* Address-exposed local */
  int32_t t;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

// INSERT COMMENT LOOP: kernel::for.cond
for(int32_t t = 0; t < tmax;   t = t + 1){
  dim_thread_256.x = 256;
  dim_thread_256.y = 1;
  dim_thread_256.z = 1;
  uint32_t nb_blocks_ny_splat = num_blocks(ny, BLOCK_SIZE_NY_1);
  dim_grid_ny.x = nb_blocks_ny_splat;
  dim_grid_ny.y = 1;
  dim_grid_ny.z = 1;
  memcpy(((uint8_t*)(&dim_thread_256_packed)), ((uint8_t*)(&dim_thread_256)), 12);
  memcpy(((uint8_t*)(&dim_grid_ny_packed)), ((uint8_t*)(&dim_grid_ny)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < 256;   j = j + 1){
for(int32_t k = 0; k < nb_blocks_ny_splat;   k = k + 1){
kernel_splat(tmax, nx, ny, ex, ey, hz, fict, t, BLOCK_SIZE_NY_1, 1, 1, nb_blocks_ny_splat, 1, 1, j, 0, 0, k, 0, 0);
}
}
  block.x = TILE_DIM_L_1;
  block.y = TILE_DIM_M_1;
  block.z = 1;
  uint32_t nb_blocks_nx_minus1_stage1 = num_blocks((nx - 1), block.x);
  uint32_t nb_blocks_ny_stage1 = num_blocks(ny, block.y);
  grid.x = nb_blocks_nx_minus1_stage1;
  grid.y = nb_blocks_ny_stage1;
  grid.z = 1;
  memcpy(((uint8_t*)(&dim_grid_ey)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&dim_block_ey)), ((uint8_t*)(&block)), BLOCK_STRUCT_SIZE_BYTES_1);
  memcpy(((uint8_t*)(&dim_grid_ey_packed)), ((uint8_t*)(&dim_grid_ey)), 12);
  memcpy(((uint8_t*)(&dim_block_ey_packed)), ((uint8_t*)(&dim_block_ey)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < nb_blocks_nx_minus1_stage1;   j = j + 1){
for(int32_t k = 0; k < nb_blocks_ny_stage1;   k = k + 1){
for(int32_t l = 0; l < TILE_DIM_L_1;   l = l + 1){
for(int32_t m = 0; m < TILE_DIM_M_1;   m = m + 1){
__auto_type ey_grid_x = nb_blocks_nx_minus1_stage1;
__auto_type ey_grid_y = nb_blocks_ny_stage1;
__auto_type ey_one1 = 1;
__auto_type ey_tile_L = TILE_DIM_L_1;
__auto_type ey_tile_M = TILE_DIM_M_1;
__auto_type ey_one2 = 1;
__auto_type ey_j = j;
__auto_type ey_k = k;
__auto_type ey_zero0 = 0;
__auto_type ey_l = l;
__auto_type ey_m = m;
__auto_type ey_zero1 = 0;
kernel_ey(tmax, nx, ny, ex, ey, hz, fict, t, ey_grid_x, ey_grid_y, ey_one1, ey_tile_L, ey_tile_M, ey_one2, ey_j, ey_k, ey_zero0, ey_l, ey_m, ey_zero1);
}
}
}
}
  block.x = TILE_DIM_L_1;
  block.y = TILE_DIM_M_1;
  block.z = 1;
  uint32_t nb_blocks_nx_stage2 = num_blocks(nx, block.x);
  uint32_t nb_blocks_ny_minus1_stage2 = num_blocks((ny - 1), block.y);
  grid.x = nb_blocks_nx_stage2;
  grid.y = nb_blocks_ny_minus1_stage2;
  grid.z = 1;
  memcpy(((uint8_t*)(&dim_grid_ex)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&dim_block_ex)), ((uint8_t*)(&block)), BLOCK_STRUCT_SIZE_BYTES_1);
  memcpy(((uint8_t*)(&dim_grid_ex_packed)), ((uint8_t*)(&dim_grid_ex)), 12);
  memcpy(((uint8_t*)(&dim_block_ex_packed)), ((uint8_t*)(&dim_block_ex)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < nb_blocks_nx_stage2;   j = j + 1){
for(int32_t k = 0; k < nb_blocks_ny_minus1_stage2;   k = k + 1){
for(int32_t l = 0; l < TILE_DIM_L_1;   l = l + 1){
for(int32_t m = 0; m < TILE_DIM_M_1;   m = m + 1){
__auto_type ex_grid_x = nb_blocks_nx_stage2;
__auto_type ex_grid_y = nb_blocks_ny_minus1_stage2;
__auto_type ex_one1 = 1;
__auto_type ex_tile_L = TILE_DIM_L_1;
__auto_type ex_tile_M = TILE_DIM_M_1;
__auto_type ex_one2 = 1;
__auto_type ex_j = j;
__auto_type ex_k = k;
__auto_type ex_zero0 = 0;
__auto_type ex_l = l;
__auto_type ex_m = m;
__auto_type ex_zero1 = 0;
kernel_ex(tmax, nx, ny, ex, ey, hz, fict, t, ex_grid_x, ex_grid_y, ex_one1, ex_tile_L, ex_tile_M, ex_one2, ex_j, ex_k, ex_zero0, ex_l, ex_m, ex_zero1);
}
}
}
}
  block.x = TILE_DIM_L_1;
  block.y = TILE_DIM_M_1;
  block.z = 1;
  uint32_t nb_blocks_nx_minus1_stage3 = num_blocks((nx - 1), block.x);
  uint32_t nb_blocks_ny_minus1_stage3 = num_blocks((ny - 1), block.y);
  grid.x = nb_blocks_nx_minus1_stage3;
  grid.y = nb_blocks_ny_minus1_stage3;
  grid.z = 1;
  memcpy(((uint8_t*)(&dim_grid_hz)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&dim_block_hz)), ((uint8_t*)(&block)), BLOCK_STRUCT_SIZE_BYTES_1);
  memcpy(((uint8_t*)(&dim_grid_hz_packed)), ((uint8_t*)(&dim_grid_hz)), 12);
  memcpy(((uint8_t*)(&dim_block_hz_packed)), ((uint8_t*)(&dim_block_hz)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < nb_blocks_nx_minus1_stage3;   j = j + 1){
for(int32_t k = 0; k < nb_blocks_ny_minus1_stage3;   k = k + 1){
for(int32_t l = 0; l < TILE_DIM_L_1;   l = l + 1){
for(int32_t m = 0; m < TILE_DIM_M_1;   m = m + 1){
__auto_type hz_grid_x = nb_blocks_nx_minus1_stage3;
__auto_type hz_grid_y = nb_blocks_ny_minus1_stage3;
__auto_type hz_one1 = 1;
__auto_type hz_tile_L = TILE_DIM_L_1;
__auto_type hz_tile_M = TILE_DIM_M_1;
__auto_type hz_one2 = 1;
__auto_type hz_j = j;
__auto_type hz_k = k;
__auto_type hz_zero0 = 0;
__auto_type hz_l = l;
__auto_type hz_m = m;
__auto_type hz_zero1 = 0;
kernel_hz(tmax, nx, ny, ex, ey, hz, fict, t, hz_grid_x, hz_grid_y, hz_one1, hz_tile_L, hz_tile_M, hz_one2, hz_j, hz_k, hz_zero0, hz_l, hz_m, hz_zero1);
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
  int32_t print_counter;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < nx;   i = i + 1){
for(int64_t j = 0; j < ny;   j = j + 1){
  fprintf(stderr, (print_format), ex[(i * ny + j)]);
  fprintf(stderr, (print_format), ey[(i * ny + j)]);
  fprintf(stderr, (print_format), hz[(i * ny + j)]);
  if ((int)(i * nx + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (newline));
  }
}
}
  fprintf(stderr, (newline));
}
