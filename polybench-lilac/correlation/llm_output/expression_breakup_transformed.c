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
struct __FIXME__l_struct_struct_OC__IO_FILE;
struct __FIXME__l_struct_struct_OC_dim3;
struct __FIXME__l_unnamed_1;

/* Function definitions */

/* Types Definitions */
struct __FIXME__l_array_1_uint8_t {
  uint8_t array[1];
};
struct __FIXME__l_array_20_uint8_t {
  uint8_t array[20];
};
struct __FIXME__l_struct_struct_OC__IO_FILE {
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field0;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field1;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field2;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field3;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field4;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field5;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field6;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field7;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field8;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field9;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field10;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field11;
  void* __FIXME__l_struct_struct_OC__IO_FILE_field12;
  struct __FIXME__l_struct_struct_OC__IO_FILE* __FIXME__l_struct_struct_OC__IO_FILE_field13;
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field14;
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field15;
  uint64_t __FIXME__l_struct_struct_OC__IO_FILE_field16;
  uint16_t __FIXME__l_struct_struct_OC__IO_FILE_field17;
  uint8_t __FIXME__l_struct_struct_OC__IO_FILE_field18;
  uint8_t __FIXME__l_struct_struct_OC__IO_FILE_field19[1];
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field20;
  uint64_t __FIXME__l_struct_struct_OC__IO_FILE_field21;
  void* __FIXME__l_struct_struct_OC__IO_FILE_field22;
  void* __FIXME__l_struct_struct_OC__IO_FILE_field23;
  struct __FIXME__l_struct_struct_OC__IO_FILE* __FIXME__l_struct_struct_OC__IO_FILE_field24;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field25;
  uint64_t __FIXME__l_struct_struct_OC__IO_FILE_field26;
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field27;
  uint8_t __FIXME__l_struct_struct_OC__IO_FILE_field28[20];
};
struct __FIXME__l_struct_struct_OC_dim3 {
  uint32_t __FIXME__l_struct_struct_OC_dim3_field0;
  uint32_t __FIXME__l_struct_struct_OC_dim3_field1;
  uint32_t __FIXME__l_struct_struct_OC_dim3_field2;
};
struct __FIXME__l_unnamed_1 {
  uint64_t __FIXME__l_unnamed_1_field0;
  uint32_t __FIXME__l_unnamed_1_field1;
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
uint8_t __FIXME_GLOBAL___OC_str[8] = { "%0.2lf " };
uint8_t __FIXME_GLOBAL___OC_str_OC_1[2] = { "\n" };


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
  int32_t __FIXME__call34;
  int32_t __FIXME__call49;

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
  int32_t __FIXME__call11;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < m;   i = i + 1){
for(int64_t j = 0; j < m;   j = j + 1){
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), corr[(i * m + j)]);
  if ((int)(i * m + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
}
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_mean
void kernel_mean(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t j;
  int64_t i;

// INSERT COMMENT IFELSE: kernel_mean::entry
  j = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
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
void kernel_stddev(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t j;
  int64_t i;
  double __FIXME__17;

// INSERT COMMENT IFELSE: kernel_stddev::entry
  j = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  if (j < m) { // IFELSE MARKER: entry IF
  stddev[j] = 0;
for(int64_t i = 0; i < n;   i = i + 1){
  stddev[j] = (stddev[j] + ((data[(i * m + j)] - mean[j]) * (data[(i * m + j)] - mean[j])));
}
  stddev[j] = (stddev[j] / (double)(n));
  __FIXME__17 = sqrt(stddev[j]);
  stddev[j] = __FIXME__17;
  if (llvm_fcmp_ole(stddev[j], 0.10000000000000001)) { // IFELSE MARKER: for.end IF
  stddev[j] = 1;
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_reduce
void kernel_reduce(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int64_t j;
  double __FIXME__18;

// INSERT COMMENT IFELSE: kernel_reduce::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  j = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y + __FIXME__threadIdx_2e_y;
  if (i < n) { // IFELSE MARKER: entry IF
  if (j < m) { // IFELSE MARKER: land.lhs.true IF
  data[(i * m + j)] = (data[(i * m + j)] - mean[j]);
  __FIXME__18 = sqrt((double)(n));
  data[(i * m + j)] = (data[(i * m + j)] / (__FIXME__18 * stddev[j]));
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_diag
void kernel_diag(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;

// INSERT COMMENT IFELSE: kernel_diag::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  if (i < m) { // IFELSE MARKER: entry IF
  corr[(i * m + i)] = 1;
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_corr
void kernel_corr(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int32_t j;
  int64_t k;

// INSERT COMMENT IFELSE: kernel_corr::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  __auto_type __FIXME__tmp1 = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y;
  __auto_type __FIXME__tmp2 = __FIXME__threadIdx_2e_y;
  __auto_type __FIXME__tmp3 = __FIXME__tmp1 + __FIXME__tmp2;
  __auto_type __FIXME__tmp4 = __FIXME__tmp3 + i + 1;
  j = __FIXME__tmp4;
  if (i < (m - 1)) { // IFELSE MARKER: entry IF
  if (j < m) { // IFELSE MARKER: land.lhs.true IF
  __auto_type __FIXME__tmp5 = i * m + j;
  __auto_type __FIXME__tmp6 = corr[__FIXME__tmp5];
  corr[(i * m + j)] = 0;
for(int64_t k = 0; k < n;   k = k + 1){
  __auto_type __FIXME__tmp7 = i * m + j;
  __auto_type __FIXME__tmp8 = k * m + i;
  __auto_type __FIXME__tmp9 = k * m + j;
  __auto_type __FIXME__tmp10 = data[__FIXME__tmp8] * data[__FIXME__tmp9];
  __auto_type __FIXME__tmp11 = corr[__FIXME__tmp7] + __FIXME__tmp10;
  corr[(i * m + j)] = __FIXME__tmp11;
}
  __auto_type __FIXME__tmp12 = j * m + i;
  __auto_type __FIXME__tmp13 = i * m + j;
  __auto_type __FIXME__tmp14 = corr[__FIXME__tmp13];
  corr[(j * m + i)] = __FIXME__tmp14;
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_tail
void kernel_tail(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  corr[(((m - 1) * m + m) - 1)] = 1;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev) {
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp1;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp1_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp3;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp5;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp3_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp5_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp12;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp13;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp12_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp13_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp18;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp19;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp18_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp19_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp32;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp33;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp32_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp33_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp38;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp39;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp38_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp39_2e_coerce;    /* Address-exposed local */
  int32_t __FIXME__call;
  uint8_t* __FIXME__1;
  uint8_t* __FIXME__2;
  uint32_t i;
  uint32_t j;
  int32_t __FIXME__call4;
  uint8_t* __FIXME__3;
  uint8_t* __FIXME__4;
  int32_t __FIXME__call10;
  int32_t __FIXME__call11;
  uint8_t* __FIXME__5;
  uint8_t* __FIXME__6;
  uint8_t* __FIXME__7;
  uint8_t* __FIXME__8;
  uint32_t k;
  uint32_t l;
  int32_t __FIXME__call20;
  uint8_t* __FIXME__9;
  uint8_t* __FIXME__10;
  int32_t __FIXME__call28;
  int32_t __FIXME__call31;
  uint8_t* __FIXME__11;
  uint8_t* __FIXME__12;
  uint8_t* __FIXME__13;
  uint8_t* __FIXME__14;
  uint8_t* __FIXME__15;
  uint8_t* __FIXME__16;

  __FIXME__call = num_blocks(m, 256);
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field0 = 256;
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp1_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp1)), 12);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_mean(m, n, data, corr, mean, stddev, __FIXME__call, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  __FIXME__call4 = num_blocks(m, 256);
  __FIXME__agg_2e_tmp3.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call4;
  __FIXME__agg_2e_tmp3.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp3.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp5.__FIXME__l_struct_struct_OC_dim3_field0 = 256;
  __FIXME__agg_2e_tmp5.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp5.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp3_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp3)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp5_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp5)), 12);
// INSERT COMMENT LOOP: kernel::header.034
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call4;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_stddev(m, n, data, corr, mean, stddev, __FIXME__call4, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  block.__FIXME__l_struct_struct_OC_dim3_field0 = 8;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = 32;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__call10 = num_blocks(n, block.__FIXME__l_struct_struct_OC_dim3_field0);
  __FIXME__call11 = num_blocks(m, block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call10;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call11;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp12)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp13)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp12_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp12)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp13_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp13)), 12);
// INSERT COMMENT LOOP: kernel::header.044
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < 8;   i = i + 1){
for(int32_t j = 0; j < 32;   j = j + 1){
for(int32_t k = 0; k < __FIXME__call10;   k = k + 1){
for(int32_t l = 0; l < __FIXME__call11;   l = l + 1){
kernel_reduce(m, n, data, corr, mean, stddev, 8, 32, 1, __FIXME__call10, __FIXME__call11, 1, i, j, 0, k, l, 0);
}
}
}
}
  __FIXME__agg_2e_tmp18.__FIXME__l_struct_struct_OC_dim3_field0 = 256;
  __FIXME__agg_2e_tmp18.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp18.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__call20 = num_blocks(m, 256);
  __FIXME__agg_2e_tmp19.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call20;
  __FIXME__agg_2e_tmp19.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp19.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp18_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp18)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp19_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp19)), 12);
// INSERT COMMENT LOOP: kernel::header.054
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < 256;   i = i + 1){
for(int32_t j = 0; j < __FIXME__call20;   j = j + 1){
kernel_diag(m, n, data, corr, mean, stddev, 256, 1, 1, __FIXME__call20, 1, 1, i, 0, 0, j, 0, 0);
}
}
  block.__FIXME__l_struct_struct_OC_dim3_field0 = 8;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = 32;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__call28 = num_blocks((m - 1), block.__FIXME__l_struct_struct_OC_dim3_field0);
  __FIXME__call31 = num_blocks((m - 1), block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call28;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call31;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp32)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp33)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp32_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp32)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp33_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp33)), 12);
// INSERT COMMENT LOOP: kernel::header.064
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < 8;   i = i + 1){
for(int32_t j = 0; j < 32;   j = j + 1){
for(int32_t k = 0; k < __FIXME__call28;   k = k + 1){
for(int32_t l = 0; l < __FIXME__call31;   l = l + 1){
kernel_corr(m, n, data, corr, mean, stddev, 8, 32, 1, __FIXME__call28, __FIXME__call31, 1, i, j, 0, k, l, 0);
}
}
}
}
// INSERT COMMENT IFELSE: kernel::kcall.end37
  __FIXME__agg_2e_tmp38.__FIXME__l_struct_struct_OC_dim3_field0 = 1;
  __FIXME__agg_2e_tmp38.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp38.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp39.__FIXME__l_struct_struct_OC_dim3_field0 = 1;
  __FIXME__agg_2e_tmp39.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp39.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp38_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp38)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp39_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp39)), 12);
  ;
  if (0) { // IFELSE MARKER: kcall.end37 IF
  } else { // IFELSE MARKER: kcall.end37 ELSE
kernel_tail(m, n, data, corr, mean, stddev, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0);
  }
  return;
}
