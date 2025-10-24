/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define BYTES_PER_DOUBLE 8
#define FDTD_E_UPDATE_COEFF 0.5
#define SPLAT_BLOCK_DIM_X 256
#define DIM3_STRUCT_SIZE_BYTES 12
#define ARG_IDX_TMAX 2
#define ARG_IDX_NX 3
#define ARG_IDX_NY 4
#define ARG_IDX_DUMP 1
#define DUMP_ENABLED_VALUE 1
#define INIT_EY_J_OFFSET 2
#define INIT_HZ_J_OFFSET 3

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
struct Dim3Coerce;

/* Function definitions */

/* Types Definitions */
struct uint8_array_1 {
  uint8_t array[1];
};
struct uint8_array_20 {
  uint8_t array[20];
};
struct Dim3 {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct Dim3Coerce {
  uint64_t offset;
  uint32_t length;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_splat(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_ey(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_ex(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_hz(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t print_fmt_double_2dp_space[8] = { "%0.2lf " };
uint8_t newline_str[2] = { "\n" };


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

// Parse command-line args (tmax, nx, ny, dump flag) and allocate nx*ny-sized arrays for the fields
  tmax = atoi(argv[ARG_IDX_TMAX]);
  nx = atoi(argv[ARG_IDX_NX]);
  ny = atoi(argv[ARG_IDX_NY]);
  dump_code = atoi(argv[ARG_IDX_DUMP]);
  ex = malloc(nx * ny * BYTES_PER_DOUBLE);
  ey = malloc(nx * ny * BYTES_PER_DOUBLE);
  hz = malloc(nx * ny * BYTES_PER_DOUBLE);
  _fict_ = malloc(ny * BYTES_PER_DOUBLE);
  init_array(nx, ny, (double*)ex, (double*)ey, (double*)hz, (double*)_fict_);
;
  kernel(tmax, nx, ny, (double*)ex, (double*)ey, (double*)hz, (double*)_fict_);
;
  if (dump_code == DUMP_ENABLED_VALUE) { // IFELSE MARKER: entry IF
print_array(nx, ny, (double*)ex, (double*)ey, (double*)hz);
  }
free(((uint8_t*)((double*)ex)));
free(((uint8_t*)((double*)ey)));
free(((uint8_t*)((double*)hz)));
free(((uint8_t*)((double*)_fict_)));
  return 0;
}
// Initialize the ex, ey, and hz arrays and the _fict_ boundary sequence for an nx-by-ny grid (setup for the FDTD simulation)
void init_array(uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* _fict_) {
  int64_t i;
  int64_t j;

// Outer loop over grid rows i to initialize field values across the nx-by-ny domain::for.cond
for(int64_t i = 0; i < ny;   i = i + 1){
  _fict_[i] = (double)(i);
}
// Inner loop over columns j within row i; compute linear index i*ny + j and initialize per-cell values::for.cond1
for(int64_t i = 0; i < nx;   i = i + 1){
for(int64_t j = 0; j < ny;   j = j + 1){
  int ex_index = i * ny + j;
  int ex_j_plus_1 = j + 1;
  double i_as_double_ex = (double)i;
  double ex_jp1_as_double = (double)ex_j_plus_1;
  double ex_numer = i_as_double_ex * ex_jp1_as_double;
  double nx_as_double_ex = (double)nx;
  double ex_value = ex_numer / nx_as_double_ex;
  ex[(i * ny + j)] = ex_value;
  int ey_index = i * ny + j;
  int ey_j_offset = j + INIT_EY_J_OFFSET;
  double i_as_double_ey = (double)i;
  double ey_j_off_as_double = (double)ey_j_offset;
  double ey_numer = i_as_double_ey * ey_j_off_as_double;
  double ny_as_double_ey = (double)ny;
  double ey_value = ey_numer / ny_as_double_ey;
  ey[(i * ny + j)] = ey_value;
  int hz_index = i * ny + j;
  int hz_j_offset = j + INIT_HZ_J_OFFSET;
  double i_as_double_hz = (double)i;
  double hz_j_off_as_double = (double)hz_j_offset;
  double hz_numer = i_as_double_hz * hz_j_off_as_double;
  double nx_as_double_hz = (double)nx;
  double hz_value = hz_numer / nx_as_double_hz;
  hz[(i * ny + j)] = hz_value;
}
}
  return;
}
// Compute ceil(num / factor): the number of blocks needed to cover num items with blocks of size factor
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// CUDA-like kernel that applies the time-dependent boundary condition Ey[0, j] = fict[t] across columns j
void kernel_splat(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t j;

// Only threads with j < ny write the boundary Ey[0, j] = fict[t]; others exit without work
  j = blockDim_x * blockIdx_x + threadIdx_x;
  if (j < ny) { // IFELSE MARKER: entry IF
  ey[(0 * ny + j)] = fict[t];
  }
  return;
}
// CUDA-like kernel that updates Ey for interior rows (i >= 1) using the discrete dHz/di term scaled by FDTD_E_UPDATE_COEFF
void kernel_ey(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;

// Update only if inside domain (i < nx, j < ny, with i >= 1): Ey[i,j] -= FDTD_E_UPDATE_COEFF * (Hz[i,j] - Hz[i-1,j])
  i = blockDim_x * blockIdx_x + threadIdx_x + 1;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < nx && j < ny) {
    ey[(i * ny + j)] = (ey[(i * ny + j)] - FDTD_E_UPDATE_COEFF * (hz[(i * ny + j)] - hz[((i - 1) * ny + j)]));
  }
  return;
}
// CUDA-like kernel that updates Ex for interior columns (j >= 1) using the discrete dHz/dj term scaled by FDTD_E_UPDATE_COEFF
void kernel_ex(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;

// Update only if inside domain (i < nx, j < ny, with j >= 1): Ex[i,j] -= FDTD_E_UPDATE_COEFF * (Hz[i,j] - Hz[i,j-1])
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y + 1;
  if (i < nx && j < ny) {
    ex[(i * ny + j)] = (ex[(i * ny + j)] - FDTD_E_UPDATE_COEFF * (hz[(i * ny + j)] - hz[((i * ny + j) - 1)]));
  }
  return;
}
// CUDA-like kernel that updates Hz on interior cells via the discrete curl of E (Ex, Ey) with a 0.7 update coefficient
void kernel_hz(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;

// Perform Hz update only for interior cells (i < nx-1, j < ny-1): Hz[i,j] -= 0.7 * ((Ex[i,j+1]-Ex[i,j]) + (Ey[i+1,j]-Ey[i,j]))
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < (nx - 1)) { // IFELSE MARKER: entry IF
  if (j < (ny - 1)) { // IFELSE MARKER: land.lhs.true IF
  hz[(i * ny + j)] = (hz[(i * ny + j)] - (0.69999999999999996 * (((ex[((i * ny + j) + 1)] - ex[(i * ny + j)]) + ey[((i + 1) * ny + j)]) - ey[(i * ny + j)])));
  }
  }
  return;
}
// Orchestrate the FDTD time stepping: configure launch dimensions and invoke boundary/field update kernels each timestep
void kernel(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict) {
  struct Dim3 splat_block_dim;    /* Address-exposed local */
  struct Dim3 splat_grid_dim;    /* Address-exposed local */
  struct Dim3Coerce splat_block_dim_coerce;    /* Address-exposed local */
  struct Dim3Coerce splat_grid_dim_coerce;    /* Address-exposed local */
  struct Dim3 block;    /* Address-exposed local */
  struct Dim3 grid;    /* Address-exposed local */
  struct Dim3 ey_grid_dim;    /* Address-exposed local */
  struct Dim3 ey_block_dim;    /* Address-exposed local */
  struct Dim3Coerce ey_grid_dim_coerce;    /* Address-exposed local */
  struct Dim3Coerce ey_block_dim_coerce;    /* Address-exposed local */
  struct Dim3 ex_grid_dim;    /* Address-exposed local */
  struct Dim3 ex_block_dim;    /* Address-exposed local */
  struct Dim3Coerce ex_grid_dim_coerce;    /* Address-exposed local */
  struct Dim3Coerce ex_block_dim_coerce;    /* Address-exposed local */
  struct Dim3 hz_grid_dim;    /* Address-exposed local */
  struct Dim3 hz_block_dim;    /* Address-exposed local */
  struct Dim3Coerce hz_grid_dim_coerce;    /* Address-exposed local */
  struct Dim3Coerce hz_block_dim_coerce;    /* Address-exposed local */
  int32_t t;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

// Time-stepping loop (t = 0..tmax-1): set up block/grid sizes and launch the update kernels each step::for.cond
for(int32_t t = 0; t < tmax;   t = t + 1){
  splat_block_dim.x = SPLAT_BLOCK_DIM_X;
  splat_block_dim.y = 1;
  splat_block_dim.z = 1;
  uint32_t splat_grid_x = num_blocks(ny, SPLAT_BLOCK_DIM_X);
  splat_grid_dim.x = splat_grid_x;
  splat_grid_dim.y = 1;
  splat_grid_dim.z = 1;
  memcpy(((uint8_t*)(&splat_block_dim_coerce)), ((uint8_t*)(&splat_block_dim)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&splat_grid_dim_coerce)), ((uint8_t*)(&splat_grid_dim)), DIM3_STRUCT_SIZE_BYTES);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < SPLAT_BLOCK_DIM_X;   j = j + 1){
for(int32_t k = 0; k < splat_grid_x;   k = k + 1){
kernel_splat(tmax, nx, ny, ex, ey, hz, fict, t, 256, 1, 1, splat_grid_x, 1, 1, j, 0, 0, k, 0, 0);
}
}
  block.x = 8;
  block.y = 32;
  block.z = 1;
  uint32_t ey_grid_x = num_blocks((nx - 1), block.x);
  uint32_t ey_grid_y = num_blocks(ny, block.y);
  grid.x = ey_grid_x;
  grid.y = ey_grid_y;
  grid.z = 1;
  memcpy(((uint8_t*)(&ey_grid_dim)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&ey_block_dim)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&ey_grid_dim_coerce)), ((uint8_t*)(&ey_grid_dim)), 12);
  memcpy(((uint8_t*)(&ey_block_dim_coerce)), ((uint8_t*)(&ey_block_dim)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < ey_grid_x;   j = j + 1){
for(int32_t k = 0; k < ey_grid_y;   k = k + 1){
for(int32_t l = 0; l < 8;   l = l + 1){
for(int32_t m = 0; m < 32;   m = m + 1){
kernel_ey(tmax, nx, ny, ex, ey, hz, fict, t, ey_grid_x, ey_grid_y, 1, 8, 32, 1, j, k, 0, l, m, 0);
}
}
}
}
  block.x = 8;
  block.y = 32;
  block.z = 1;
  uint32_t ex_grid_x = num_blocks(nx, block.x);
  uint32_t ex_grid_y = num_blocks((ny - 1), block.y);
  grid.x = ex_grid_x;
  grid.y = ex_grid_y;
  grid.z = 1;
  memcpy(((uint8_t*)(&ex_grid_dim)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&ex_block_dim)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&ex_grid_dim_coerce)), ((uint8_t*)(&ex_grid_dim)), 12);
  memcpy(((uint8_t*)(&ex_block_dim_coerce)), ((uint8_t*)(&ex_block_dim)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < ex_grid_x;   j = j + 1){
for(int32_t k = 0; k < ex_grid_y;   k = k + 1){
for(int32_t l = 0; l < 8;   l = l + 1){
for(int32_t m = 0; m < 32;   m = m + 1){
kernel_ex(tmax, nx, ny, ex, ey, hz, fict, t, ex_grid_x, ex_grid_y, 1, 8, 32, 1, j, k, 0, l, m, 0);
}
}
}
}
  block.x = 8;
  block.y = 32;
  block.z = 1;
  uint32_t hz_grid_x = num_blocks((nx - 1), block.x);
  uint32_t hz_grid_y = num_blocks((ny - 1), block.y);
  grid.x = hz_grid_x;
  grid.y = hz_grid_y;
  grid.z = 1;
  memcpy(((uint8_t*)(&hz_grid_dim)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&hz_block_dim)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&hz_grid_dim_coerce)), ((uint8_t*)(&hz_grid_dim)), 12);
  memcpy(((uint8_t*)(&hz_block_dim_coerce)), ((uint8_t*)(&hz_block_dim)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < hz_grid_x;   j = j + 1){
for(int32_t k = 0; k < hz_grid_y;   k = k + 1){
for(int32_t l = 0; l < 8;   l = l + 1){
for(int32_t m = 0; m < 32;   m = m + 1){
kernel_hz(tmax, nx, ny, ex, ey, hz, fict, t, hz_grid_x, hz_grid_y, 1, 8, 32, 1, j, k, 0, l, m, 0);
}
}
}
}
}
  return;
}
// Print the field data over the nx-by-ny grid (e.g., for debugging/verification output)
void print_array(uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz) {
  int64_t i;
  int64_t j;

// Traverse the grid in row-major order and emit ex[i*ny + j] for every cell::for.cond
for(int64_t i = 0; i < nx;   i = i + 1){
for(int64_t j = 0; j < ny;   j = j + 1){
  fprintf(stderr, print_fmt_double_2dp_space, ex[(i * ny + j)]);
  fprintf(stderr, print_fmt_double_2dp_space, ey[(i * ny + j)]);
  fprintf(stderr, print_fmt_double_2dp_space, hz[(i * ny + j)]);
  if ((int)(i * nx + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, newline_str);
  }
}
}
  fprintf(stderr, newline_str);
}
