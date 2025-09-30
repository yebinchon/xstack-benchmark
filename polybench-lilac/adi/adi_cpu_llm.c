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
struct dim3_t;
struct dim3_packed_t;

/* Function definitions */

/* Types Definitions */
struct uint8_array1_t {
  uint8_t array[1];
};
struct uint8_array_20_t {
  uint8_t array[20];
};
struct IO_FILE {
  uint32_t flags;
  uint8_t* read_ptr;
  uint8_t* read_end;
  uint8_t* read_base;
  uint8_t* write_base;
  uint8_t* write_ptr;
  uint8_t* write_end;
  uint8_t* buf_base;
  uint8_t* buf_end;
  uint8_t* save_base;
  uint8_t* backup_base;
  uint8_t* save_end;
  void* marker;
  struct IO_FILE* chain;
  uint32_t fileno;
  uint32_t flags2;
  uint64_t old_offset;
  uint16_t cur_column;
  uint8_t vtable_offset;
  uint8_t shortbuf[1];
  uint8_t* lock;
  uint64_t offset;
  void* codecvt;
  void* wide_data;
  struct IO_FILE* freeres_list;
  uint8_t* locale;
  uint64_t reserved2;
  uint32_t mode;
  uint8_t filler[20];
};
struct dim3_t {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct dim3_packed_t {
  uint64_t x;
  uint32_t y;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaFree(uint8_t*);
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_column_sweep(uint32_t, uint32_t, double*, double*, double*, double*, double, double, double, double, double, double, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_row_sweep(uint32_t, uint32_t, double*, double*, double*, double*, double, double, double, double, double, double, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t print_format[8] = { "%0.2lf " };
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
static __forceinline uint64_t llvm_sub_u64(uint64_t a, uint64_t b) {
  uint64_t r = a - b;
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
  int32_t n;
  int32_t tsteps;
  int32_t dump_code;
  uint8_t* u;
  uint8_t* v;
  uint8_t* p;
  uint8_t* q;
  int32_t temp_call38;
  int32_t temp_call54;

// Parse command-line arguments to obtain dump_code, n and tsteps, then allocate memory for u and v arrays of n*n doubles
  n = atoi(argv[2]);
  tsteps = atoi(argv[3]);
  dump_code = atoi(argv[1]);
  u = malloc(n * n * 8);
  v = malloc(n * n * 8);
  p = malloc(n * n * 8);
  q = malloc(n * n * 8);
  init_array(n, (double*)u, (double*)v, (double*)p, (double*)q);
;
  kernel(tsteps, n, (double*)u, (double*)v, (double*)p, (double*)q);
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(n, (double*)u);
  }
free((uint8_t*)((double*)u));
free((uint8_t*)((double*)v));
free((uint8_t*)((double*)p));
free((uint8_t*)((double*)q));
  return 0;
}
// Initialize arrays used by the computation; set up initial values (here u is initialized as u[i*n+j] = (i + n - j) / n) before the main computation
void init_array(uint32_t n, double* u, double* v, double* p, double* q) {
  int64_t i;
  uint64_t j;

// Iterate all rows (i) and columns (j) of the n x n grid to initialize the element u[i*n + j] to (i + n - j) / n::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  u[(i * n + j)] = ((double)(((i + n) - j)) / (double)(n));
  v[(i * n + j)] = 0;
  p[(i * n + j)] = 0;
  q[(i * n + j)] = 0;
}
}
  return;
}
// Return the number of blocks of size 'factor' required to cover 'num' items (integer ceiling division)
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// Column-oriented GPU-style kernel: performs per-column updates on the 2D arrays u,v,p,q using provided coefficients and thread/block mapping
void kernel_column_sweep(uint32_t tsteps, uint32_t n, double* u, double* v, double* p, double* q, double a, double b, double c, double d, double e, double f, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int64_t j;

// Compute the global column index i for this thread; if i lies inside the interior (1..n-2) initialize the top-of-column and related auxiliary values (v[0,i], p[i,0], q[i,0])
  i = blockDim_x * blockIdx_x + threadIdx_x + 1;
  if (i < (n - 1)) { // IFELSE MARKER: entry IF
  v[(0 * n + i)] = 1;
  p[(i * n + 0)] = 0;
  q[(i * n + 0)] = v[(0 * n + i)];
for(int64_t j = 1; j < (n - 1);   j = j + 1){
  __auto_type tmp1 = i * n + j;
  __auto_type tmp2 = tmp1 - 1;
  __auto_type tmp3 = a * p[tmp2] + b;
  __auto_type tmp4 = -c;
  __auto_type tmp5 = tmp4 / tmp3;
  p[(i * n + j)] = tmp5;
  __auto_type tmp6 = i * n + j;
  __auto_type tmp7 = tmp6 - 1;
  __auto_type tmp8 = a * p[tmp7] + b;
  __auto_type tmp9 = j * n + i;
  __auto_type tmp10 = tmp9 - 1;
  __auto_type tmp11 = tmp9 + 1;
  __auto_type tmp12 = -d * u[tmp10];
  __auto_type tmp13 = (1 + 2 * d) * u[tmp9];
  __auto_type tmp14 = f * u[tmp11];
  __auto_type tmp15 = a * q[tmp7];
  __auto_type tmp16 = tmp12 + tmp13 - tmp14 - tmp15;
  __auto_type tmp17 = tmp16 / tmp8;
  q[(i * n + j)] = tmp17;
}
  v[((n - 1) * n + i)] = 1;
for(int64_t j = n + -2; j >= 1;   j = j + -1){
  __auto_type tmp18 = j * n + i;
  __auto_type tmp19 = i * n + j;
  __auto_type tmp20 = (j + 1) * n + i;
  __auto_type tmp21 = p[tmp19];
  __auto_type tmp22 = v[tmp20];
  __auto_type tmp23 = q[tmp19];
  __auto_type tmp24 = tmp21 * tmp22 + tmp23;
  v[(j * n + i)] = tmp24;
}
  }
  return;
}
// Row-oriented GPU-style kernel: performs per-row updates on the 2D arrays u,v,p,q using provided coefficients and thread/block mapping
void kernel_row_sweep(uint32_t tsteps, uint32_t n, double* u, double* v, double* p, double* q, double a, double b, double c, double d, double e, double f, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int64_t j;

// Compute the global row index i for this thread; if i lies inside the interior (1..n-2) initialize the left-of-row and related auxiliary values (u[i,0], p[i+ n,0], q[i,0])
  i = blockDim_x * blockIdx_x + threadIdx_x + 1;
  if (i < (n - 1)) { // IFELSE MARKER: entry IF
  u[(i * n + 0)] = 1;
  p[((i + n) + 0)] = 0;
  q[(i * n + 0)] = u[(i * n + 0)];
for(int64_t j = 1; j < (n - 1);   j = j + 1){
  p[(i * n + j)] = (-(f) / ((d * p[((i * n + j) - 1)]) + e));
  q[(i * n + j)] = (((((-(a) * v[((i - 1) * n + j)]) + ((1 + (2 * a)) * v[(i * n + j)])) - (c * v[((i + 1) * n + j)])) - (d * q[((i * n + j) - 1)])) / ((d * p[((i * n + j) - 1)]) + e));
}
  u[((i * n + n) - 1)] = 1;
for(int64_t j = n + -2; j >= 1;   j = j + -1){
  u[(i * n + j)] = ((p[(i * n + j)] * u[((i * n + j) + 1)]) + q[(i * n + j)]);
}
  }
  return;
}
// Host-side kernel driver that configures grid/block dimensions, prepares launch parameters, and iterates time steps to invoke row/column sweep kernels
void kernel(uint32_t tsteps, uint32_t n, double* u, double* v, double* p, double* q) {
  struct dim3_t grid1;    /* Address-exposed local */
  struct dim3_t block1;    /* Address-exposed local */
  struct dim3_packed_t grid1_packed;    /* Address-exposed local */
  struct dim3_packed_t block1_packed;    /* Address-exposed local */
  struct dim3_t grid2;    /* Address-exposed local */
  struct dim3_t block2;    /* Address-exposed local */
  struct dim3_packed_t grid2_packed;    /* Address-exposed local */
  struct dim3_packed_t block2_packed;    /* Address-exposed local */
  double DX;
  double DY;
  double DT;
  double mul1;
  double mul2;
  double neg_half_mul1;
  double b;
  double neg_half_mul2;
  double e;
  int32_t t;
  uint32_t j;
  uint32_t k;

  DX = (1 / (double)(n));
  DY = (1 / (double)(n));
  DT = (1 / (double)(tsteps));
  mul1 = (((2 * DT) / DX) / DX);
  mul2 = (((1 * DT) / DY) / DY);
  neg_half_mul1 = (-(mul1) / 2);
  b = (1 + mul1);
  neg_half_mul2 = (-(mul2) / 2);
  e = (1 + mul2);
// Time-stepping loop: for each time step compute how many blocks are needed to cover the interior columns and set grid.x accordingly before launching kernels::for.cond
for(int32_t t = 1; t <= tsteps;   t = t + 1){
  uint32_t numBlocks1 = num_blocks((n - 2), 256);
  grid1.x = numBlocks1;
  grid1.y = 1;
  grid1.z = 1;
  block1.x = 256;
  block1.y = 1;
  block1.z = 1;
  memcpy((uint8_t*)(&grid1_packed), (uint8_t*)(&grid1), 12);
  memcpy((uint8_t*)(&block1_packed), (uint8_t*)(&block1), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < numBlocks1;   j = j + 1){
for(int32_t k = 0; k < 256;   k = k + 1){
kernel_column_sweep(tsteps, n, u, v, p, q, neg_half_mul1, b, neg_half_mul1, neg_half_mul2, e, neg_half_mul2, numBlocks1, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
  uint32_t numBlocks2 = num_blocks((n - 2), 256);
  grid2.x = numBlocks2;
  grid2.y = 1;
  grid2.z = 1;
  block2.x = 256;
  block2.y = 1;
  block2.z = 1;
  memcpy((uint8_t*)(&grid2_packed), (uint8_t*)(&grid2), 12);
  memcpy((uint8_t*)(&block2_packed), (uint8_t*)(&block2), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < numBlocks2;   j = j + 1){
for(int32_t k = 0; k < 256;   k = k + 1){
kernel_row_sweep(tsteps, n, u, v, p, q, neg_half_mul1, b, neg_half_mul1, neg_half_mul2, e, neg_half_mul2, numBlocks2, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
}
  return;
}
// Print the n x n array 'u' in row-major order to stderr using a fixed format, iterating over rows then columns
void print_array(uint32_t n, double* u) {
  int64_t i;
  uint64_t j;
  int32_t temp_int32;

// Iterate rows and columns and print each element u[i*n + j] with fprintf to produce a full array dump::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  fprintf(stderr, print_format, u[(i * n + j)]);
  if ((int)(i * n + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, newline_str);
  }
}
}
  fprintf(stderr, newline_str);
}
