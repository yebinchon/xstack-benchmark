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

static __forceinline int llvm_fcmp_ole(double X, double Y) { return X <= Y; }


/* Global Declarations */

/* Types Declarations */
struct IOFile;
struct Dim3;
struct Dim3Coerce;

/* Function definitions */

/* Types Definitions */
struct uint8_array_1 {
  uint8_t array[1];
};
struct uint8_array_20_t {
  uint8_t array[20];
};
struct IOFile {
  uint32_t flags;
  uint8_t* buf_base;
  uint8_t* buf_ptr;
  uint8_t* buf_end;
  uint8_t* read_ptr;
  uint8_t* read_end;
  uint8_t* write_ptr;
  uint8_t* write_end;
  uint8_t* unget_buf;
  uint8_t* line_buf;
  uint8_t* cookie;
  uint8_t* aux_buffer;
  void* user_data;
  struct IOFile* next;
  uint32_t fd;
  uint32_t status;
  uint64_t position;
  uint16_t orientation;
  uint8_t charbuf;
  uint8_t smallbuf[1];
  uint8_t* locale;
  uint64_t timestamp;
  void* lock;
  void* vtable;
  struct IOFile* prev;
  uint8_t* filename;
  uint64_t reserved64;
  uint32_t mode;
  uint8_t padding[20];
};
struct Dim3 {
  uint32_t batch;
  uint32_t x;
  uint32_t y;
};
struct Dim3Coerce {
  uint64_t coerce_u64;
  uint32_t coerce_u32;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
double sqrt(double);
double sqrt_OC_1(double);
void kernel_mean(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_stddev(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_reduce(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_diag(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_corr(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_tail(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t fmt_double_space[8] = { "%0.2lf " };
uint8_t fmt_newline[2] = { "\n" };


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
  int32_t m;
  uint8_t* data;
  uint8_t* mean;
  uint8_t* stddev;
  uint8_t* corr;
  int32_t placeholder_call34;
  int32_t placeholder_call49;

// INSERT COMMENT IFELSE: main::entry
  dump_code = atoi(argv[1]);
  n = atoi(argv[2]);
  m = atoi(argv[3]);
  data = malloc(n * m * 8);
  mean = malloc(m * 8);
  stddev = malloc(m * 8);
  corr = malloc(m * m * 8);
  init_array(m, n, ((double*)data));
;
  kernel(m, n, ((double*)data), ((double*)corr), ((double*)mean), ((double*)stddev));
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(m, ((double*)corr));
  }
free(((uint8_t*)((double*)data)));
free(((uint8_t*)((double*)corr)));
free(((uint8_t*)((double*)mean)));
free(((uint8_t*)((double*)stddev)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t m, uint32_t n, double* data) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < m;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  data[(i * n + j)] = (((double)(i) * (double)(j)) / 1000);
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t m, double* corr) {
  int64_t i;
  uint64_t j;
  int32_t num_blocks_m_x32;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < m;   i = i + 1){
for(int64_t j = 0; j < m;   j = j + 1){
  fprintf(stderr, (fmt_double_space), corr[(i * m + j)]);
  if ((int)(i * m + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (fmt_newline));
  }
}
}
  fprintf(stderr, (fmt_newline));
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_mean
void kernel_mean(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t j;
  int64_t i;

// INSERT COMMENT IFELSE: kernel_mean::entry
  j = blockDim_x * blockIdx_x + threadIdx_x;
  if (j < m) { // IFELSE MARKER: entry IF
  mean[j] = 0;
for(int64_t i = 0; i < n;   i = i + 1){
  mean[j] = (mean[j] + data[(i * m + j)]);
}
  mean[j] = (mean[j] / (double)(n));
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_stddev
void kernel_stddev(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t j;
  int64_t i;
  double stddev_root;

// INSERT COMMENT IFELSE: kernel_stddev::entry
  j = blockDim_x * blockIdx_x + threadIdx_x;
  if (j < m) { // IFELSE MARKER: entry IF
  stddev[j] = 0;
for(int64_t i = 0; i < n;   i = i + 1){
  stddev[j] = (stddev[j] + ((data[(i * m + j)] - mean[j]) * (data[(i * m + j)] - mean[j])));
}
  stddev[j] = (stddev[j] / (double)(n));
  stddev_root = sqrt(stddev[j]);
  stddev[j] = stddev_root;
  if (llvm_fcmp_ole(stddev[j], 0.10000000000000001)) { // IFELSE MARKER: for.end IF
  stddev[j] = 1;
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_reduce
void kernel_reduce(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int64_t j;
  double sqrt_n;

// INSERT COMMENT IFELSE: kernel_reduce::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < n) { // IFELSE MARKER: entry IF
  if (j < m) { // IFELSE MARKER: land.lhs.true IF
  data[(i * m + j)] = (data[(i * m + j)] - mean[j]);
  sqrt_n = sqrt((double)(n));
  data[(i * m + j)] = (data[(i * m + j)] / (sqrt_n * stddev[j]));
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_diag
void kernel_diag(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;

// INSERT COMMENT IFELSE: kernel_diag::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  if (i < m) { // IFELSE MARKER: entry IF
  corr[(i * m + i)] = 1;
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_corr
void kernel_corr(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;
  int64_t k;

// INSERT COMMENT IFELSE: kernel_corr::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  __auto_type blockDim_y_times_blockIdx_y = blockDim_y * blockIdx_y;
  __auto_type threadIdx_y_val = threadIdx_y;
  __auto_type y_index_base = blockDim_y_times_blockIdx_y + threadIdx_y_val;
  __auto_type j_calc = y_index_base + i + 1;
  j = j_calc;
  if (i < (m - 1)) { // IFELSE MARKER: entry IF
  if (j < m) { // IFELSE MARKER: land.lhs.true IF
  __auto_type idx_i_m_j = i * m + j;
  __auto_type corr_ij_old = corr[idx_i_m_j];
  corr[(i * m + j)] = 0;
for(int64_t k = 0; k < n;   k = k + 1){
  __auto_type idx_i_m_j_loop = i * m + j;
  __auto_type idx_k_m_i = k * m + i;
  __auto_type idx_k_m_j = k * m + j;
  __auto_type prod_data_ki_kj = data[idx_k_m_i] * data[idx_k_m_j];
  __auto_type corr_accum = corr[idx_i_m_j_loop] + prod_data_ki_kj;
  corr[(i * m + j)] = corr_accum;
}
  __auto_type idx_j_m_i = j * m + i;
  __auto_type idx_i_m_j_sym_src = i * m + j;
  __auto_type corr_src_val = corr[idx_i_m_j_sym_src];
  corr[(j * m + i)] = corr_src_val;
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_tail
void kernel_tail(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  corr[(((m - 1) * m + m) - 1)] = 1;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev) {
  struct Dim3 grid_mean_blocks;    /* Address-exposed local */
  struct Dim3 block_256x1;    /* Address-exposed local */
  struct Dim3Coerce grid_mean_blocks_coerce;    /* Address-exposed local */
  struct Dim3Coerce block_256x1_coerce;    /* Address-exposed local */
  struct Dim3 grid_stddev_blocks;    /* Address-exposed local */
  struct Dim3 block_256x1_stddev;    /* Address-exposed local */
  struct Dim3Coerce grid_stddev_blocks_coerce;    /* Address-exposed local */
  struct Dim3Coerce block_256x1_stddev_coerce;    /* Address-exposed local */
  struct Dim3 block;    /* Address-exposed local */
  struct Dim3 grid;    /* Address-exposed local */
  struct Dim3 block_8_32;    /* Address-exposed local */
  struct Dim3 grid_for_reduce;    /* Address-exposed local */
  struct Dim3Coerce block_8_32_coerce;    /* Address-exposed local */
  struct Dim3Coerce grid_for_reduce_coerce;    /* Address-exposed local */
  struct Dim3 block_256x1_diag;    /* Address-exposed local */
  struct Dim3 grid_diag_blocks;    /* Address-exposed local */
  struct Dim3Coerce block_256x1_diag_coerce;    /* Address-exposed local */
  struct Dim3Coerce grid_diag_blocks_coerce;    /* Address-exposed local */
  struct Dim3 block_8_32_corr;    /* Address-exposed local */
  struct Dim3 grid_for_corr;    /* Address-exposed local */
  struct Dim3Coerce block_8_32_corr_coerce;    /* Address-exposed local */
  struct Dim3Coerce grid_for_corr_coerce;    /* Address-exposed local */
  struct Dim3 block_tail;    /* Address-exposed local */
  struct Dim3 grid_tail;    /* Address-exposed local */
  struct Dim3Coerce block_tail_coerce;    /* Address-exposed local */
  struct Dim3Coerce grid_tail_coerce;    /* Address-exposed local */
  int32_t num_blocks_m_256;
  uint8_t* tmp_u8_1;
  uint8_t* tmp_u8_2;
  uint32_t i;
  uint32_t j;
  int32_t num_blocks_m_256_2;
  uint8_t* tmp_u8_3;
  uint8_t* tmp_u8_4;
  int32_t num_blocks_n_batch8;
  int32_t num_blocks_m_x32;
  uint8_t* tmp_u8_5;
  uint8_t* tmp_u8_6;
  uint8_t* tmp_u8_7;
  uint8_t* tmp_u8_8;
  uint32_t k;
  uint32_t l;
  int32_t num_blocks_m_256_diag;
  uint8_t* tmp_u8_9;
  uint8_t* tmp_u8_10;
  int32_t num_blocks_m1_batch8;
  int32_t num_blocks_m1_x32;
  uint8_t* tmp_u8_11;
  uint8_t* tmp_u8_12;
  uint8_t* tmp_u8_13;
  uint8_t* tmp_u8_14;
  uint8_t* tmp_u8_15;
  uint8_t* tmp_u8_16;

  num_blocks_m_256 = num_blocks(m, 256);
  grid_mean_blocks.batch = num_blocks_m_256;
  grid_mean_blocks.x = 1;
  grid_mean_blocks.y = 1;
  block_256x1.batch = 256;
  block_256x1.x = 1;
  block_256x1.y = 1;
  memcpy(((uint8_t*)(&grid_mean_blocks_coerce)), ((uint8_t*)(&grid_mean_blocks)), 12);
  memcpy(((uint8_t*)(&block_256x1_coerce)), ((uint8_t*)(&block_256x1)), 12);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < num_blocks_m_256;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_mean(m, n, data, corr, mean, stddev, num_blocks_m_256, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  num_blocks_m_256_2 = num_blocks(m, 256);
  grid_stddev_blocks.batch = num_blocks_m_256_2;
  grid_stddev_blocks.x = 1;
  grid_stddev_blocks.y = 1;
  block_256x1_stddev.batch = 256;
  block_256x1_stddev.x = 1;
  block_256x1_stddev.y = 1;
  memcpy(((uint8_t*)(&grid_stddev_blocks_coerce)), ((uint8_t*)(&grid_stddev_blocks)), 12);
  memcpy(((uint8_t*)(&block_256x1_stddev_coerce)), ((uint8_t*)(&block_256x1_stddev)), 12);
// INSERT COMMENT LOOP: kernel::header.034
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < num_blocks_m_256_2;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_stddev(m, n, data, corr, mean, stddev, num_blocks_m_256_2, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  block.batch = 8;
  block.x = 32;
  block.y = 1;
  num_blocks_n_batch8 = num_blocks(n, block.batch);
  num_blocks_m_x32 = num_blocks(m, block.x);
  grid.batch = num_blocks_n_batch8;
  grid.x = num_blocks_m_x32;
  grid.y = 1;
  memcpy(((uint8_t*)(&block_8_32)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_for_reduce)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_8_32_coerce)), ((uint8_t*)(&block_8_32)), 12);
  memcpy(((uint8_t*)(&grid_for_reduce_coerce)), ((uint8_t*)(&grid_for_reduce)), 12);
// INSERT COMMENT LOOP: kernel::header.044
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < 8;   i = i + 1){
for(int32_t j = 0; j < 32;   j = j + 1){
for(int32_t k = 0; k < num_blocks_n_batch8;   k = k + 1){
for(int32_t l = 0; l < num_blocks_m_x32;   l = l + 1){
kernel_reduce(m, n, data, corr, mean, stddev, 8, 32, 1, num_blocks_n_batch8, num_blocks_m_x32, 1, i, j, 0, k, l, 0);
}
}
}
}
  block_256x1_diag.batch = 256;
  block_256x1_diag.x = 1;
  block_256x1_diag.y = 1;
  num_blocks_m_256_diag = num_blocks(m, 256);
  grid_diag_blocks.batch = num_blocks_m_256_diag;
  grid_diag_blocks.x = 1;
  grid_diag_blocks.y = 1;
  memcpy(((uint8_t*)(&block_256x1_diag_coerce)), ((uint8_t*)(&block_256x1_diag)), 12);
  memcpy(((uint8_t*)(&grid_diag_blocks_coerce)), ((uint8_t*)(&grid_diag_blocks)), 12);
// INSERT COMMENT LOOP: kernel::header.054
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < 256;   i = i + 1){
for(int32_t j = 0; j < num_blocks_m_256_diag;   j = j + 1){
kernel_diag(m, n, data, corr, mean, stddev, 256, 1, 1, num_blocks_m_256_diag, 1, 1, i, 0, 0, j, 0, 0);
}
}
  block.batch = 8;
  block.x = 32;
  block.y = 1;
  num_blocks_m1_batch8 = num_blocks((m - 1), block.batch);
  num_blocks_m1_x32 = num_blocks((m - 1), block.x);
  grid.batch = num_blocks_m1_batch8;
  grid.x = num_blocks_m1_x32;
  grid.y = 1;
  memcpy(((uint8_t*)(&block_8_32_corr)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_for_corr)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_8_32_corr_coerce)), ((uint8_t*)(&block_8_32_corr)), 12);
  memcpy(((uint8_t*)(&grid_for_corr_coerce)), ((uint8_t*)(&grid_for_corr)), 12);
// INSERT COMMENT LOOP: kernel::header.064
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < 8;   i = i + 1){
for(int32_t j = 0; j < 32;   j = j + 1){
for(int32_t k = 0; k < num_blocks_m1_batch8;   k = k + 1){
for(int32_t l = 0; l < num_blocks_m1_x32;   l = l + 1){
kernel_corr(m, n, data, corr, mean, stddev, 8, 32, 1, num_blocks_m1_batch8, num_blocks_m1_x32, 1, i, j, 0, k, l, 0);
}
}
}
}
// INSERT COMMENT IFELSE: kernel::kcall.end37
  block_tail.batch = 1;
  block_tail.x = 1;
  block_tail.y = 1;
  grid_tail.batch = 1;
  grid_tail.x = 1;
  grid_tail.y = 1;
  memcpy(((uint8_t*)(&block_tail_coerce)), ((uint8_t*)(&block_tail)), 12);
  memcpy(((uint8_t*)(&grid_tail_coerce)), ((uint8_t*)(&grid_tail)), 12);
  ;
  if (0) { // IFELSE MARKER: kcall.end37 IF
  } else { // IFELSE MARKER: kcall.end37 ELSE
kernel_tail(m, n, data, corr, mean, stddev, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0);
  }
  return;
}
