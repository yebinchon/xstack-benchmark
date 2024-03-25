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
struct l_struct_struct_OC__IO_FILE;
struct l_struct_struct_OC_dim3;
struct l_unnamed_1;

/* Function definitions */

/* Types Definitions */
struct l_array_1_uint8_t {
  uint8_t array[1];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};
struct l_struct_struct_OC__IO_FILE {
  uint32_t field0;
  uint8_t* field1;
  uint8_t* field2;
  uint8_t* field3;
  uint8_t* field4;
  uint8_t* field5;
  uint8_t* field6;
  uint8_t* field7;
  uint8_t* field8;
  uint8_t* field9;
  uint8_t* field10;
  uint8_t* field11;
  void* field12;
  struct l_struct_struct_OC__IO_FILE* field13;
  uint32_t field14;
  uint32_t field15;
  uint64_t field16;
  uint16_t field17;
  uint8_t field18;
  uint8_t field19[1];
  uint8_t* field20;
  uint64_t field21;
  void* field22;
  void* field23;
  struct l_struct_struct_OC__IO_FILE* field24;
  uint8_t* field25;
  uint64_t field26;
  uint32_t field27;
  uint8_t field28[20];
};
struct l_struct_struct_OC_dim3 {
  uint32_t field0;
  uint32_t field1;
  uint32_t field2;
};
struct l_unnamed_1 {
  uint64_t field0;
  uint32_t field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void _ZL10init_arrayiiPd(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void _ZL6kerneliiPdS_S_S_(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void _ZL11print_arrayiPd(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t _ZL10num_blocksii(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
double sqrt(double);
double sqrt_OC_1(double);
void _Z11kernel_meaniiPdS_S_S__OC_2(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z13kernel_stddeviiPdS_S_S__OC_3(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z13kernel_reduceiiPdS_S_S__OC_4(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z11kernel_diagiiPdS_S_S__OC_5(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z11kernel_corriiPdS_S_S__OC_6(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z11kernel_tailiiPdS_S_S__OC_7(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t _OC_str[8] = { "%0.2lf " };
uint8_t _OC_str_OC_1[2] = { "\n" };


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
  int32_t call34;
  int32_t call49;

  dump_code = atoi(argv[1]);
  n = atoi(argv[2]);
  m = atoi(argv[3]);
  data = malloc(n * m * 8);
  mean = malloc(m * 8);
  stddev = malloc(m * 8);
  corr = malloc(m * m * 8);
  _ZL10init_arrayiiPd(m, n, ((double*)data));
;
#pragma acc data copy(data[0:n * m * 8], mean[0:m * 8], stddev[0:m * 8], corr[0:m * m * 8])
{
  _ZL6kerneliiPdS_S_S_(m, n, ((double*)data), ((double*)corr), ((double*)mean), ((double*)stddev));
;

}
  if (dump_code == 1) {
_ZL11print_arrayiPd(m, ((double*)corr));
  }
free(((uint8_t*)((double*)data)));
free(((uint8_t*)((double*)corr)));
free(((uint8_t*)((double*)mean)));
free(((uint8_t*)((double*)stddev)));
  return 0;
}


void _ZL10init_arrayiiPd(uint32_t m, uint32_t n, double* data) {
  int64_t i;
  int64_t j;


for(int64_t i = 0; i < m;   i = i + 1){

for(int64_t j = 0; j < n;   j = j + 1){
  data[(i * n + j)] = (((double)(i) * (double)(j)) / 1000);
}
}
  return;
}


void _ZL6kerneliiPdS_S_S_(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev) {
  struct l_struct_struct_OC_dim3 agg_2e_tmp;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp1;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp1_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp3;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp5;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp3_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp5_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp12;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp13;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp12_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp13_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp18;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp19;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp18_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp19_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp32;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp33;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp32_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp33_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp38;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp39;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp38_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp39_2e_coerce;    /* Address-exposed local */
  int32_t call;
  uint8_t* _1;
  uint8_t* _2;
  uint32_t i;
  uint32_t j;
  int32_t call4;
  uint8_t* _3;
  uint8_t* _4;
  int32_t call10;
  int32_t call11;
  uint8_t* _5;
  uint8_t* _6;
  uint8_t* _7;
  uint8_t* _8;
  uint32_t k;
  uint32_t l;
  int32_t call20;
  uint8_t* _9;
  uint8_t* _10;
  int32_t call28;
  int32_t call31;
  uint8_t* _11;
  uint8_t* _12;
  uint8_t* _13;
  uint8_t* _14;
  uint8_t* _15;
  uint8_t* _16;

  call = _ZL10num_blocksii(m, 256);
  agg_2e_tmp.field0 = call;
  agg_2e_tmp.field1 = 1;
  agg_2e_tmp.field2 = 1;
  agg_2e_tmp1.field0 = 256;
  agg_2e_tmp1.field1 = 1;
  agg_2e_tmp1.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp_2e_coerce)), ((uint8_t*)(&agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp1_2e_coerce)), ((uint8_t*)(&agg_2e_tmp1)), 12);
#pragma acc parallel loop gang

for(int32_t i = 0; i < call;   i = i + 1){
#pragma acc loop worker

for(int32_t j = 0; j < 256;   j = j + 1){
_Z11kernel_meaniiPdS_S_S__OC_2(m, n, data, corr, mean, stddev, call, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  call4 = _ZL10num_blocksii(m, 256);
  agg_2e_tmp3.field0 = call4;
  agg_2e_tmp3.field1 = 1;
  agg_2e_tmp3.field2 = 1;
  agg_2e_tmp5.field0 = 256;
  agg_2e_tmp5.field1 = 1;
  agg_2e_tmp5.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp3_2e_coerce)), ((uint8_t*)(&agg_2e_tmp3)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp5_2e_coerce)), ((uint8_t*)(&agg_2e_tmp5)), 12);
#pragma acc parallel loop gang

for(int32_t i = 0; i < call4;   i = i + 1){
#pragma acc loop worker

for(int32_t j = 0; j < 256;   j = j + 1){
_Z13kernel_stddeviiPdS_S_S__OC_3(m, n, data, corr, mean, stddev, call4, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  block.field0 = 8;
  block.field1 = 32;
  block.field2 = 1;
  call10 = _ZL10num_blocksii(n, block.field0);
  call11 = _ZL10num_blocksii(m, block.field1);
  grid.field0 = call10;
  grid.field1 = call11;
  grid.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp12)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp13)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp12_2e_coerce)), ((uint8_t*)(&agg_2e_tmp12)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp13_2e_coerce)), ((uint8_t*)(&agg_2e_tmp13)), 12);
#pragma acc parallel loop gang collapse(2)

for(int32_t i = 0; i < 8;   i = i + 1){

for(int32_t j = 0; j < 32;   j = j + 1){
#pragma acc loop worker collapse(2)

for(int32_t k = 0; k < call10;   k = k + 1){

for(int32_t l = 0; l < call11;   l = l + 1){
_Z13kernel_reduceiiPdS_S_S__OC_4(m, n, data, corr, mean, stddev, 8, 32, 1, call10, call11, 1, i, j, 0, k, l, 0);
}
}
}
}
  agg_2e_tmp18.field0 = 256;
  agg_2e_tmp18.field1 = 1;
  agg_2e_tmp18.field2 = 1;
  call20 = _ZL10num_blocksii(m, 256);
  agg_2e_tmp19.field0 = call20;
  agg_2e_tmp19.field1 = 1;
  agg_2e_tmp19.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp18_2e_coerce)), ((uint8_t*)(&agg_2e_tmp18)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp19_2e_coerce)), ((uint8_t*)(&agg_2e_tmp19)), 12);
#pragma acc parallel loop gang

for(int32_t i = 0; i < 256;   i = i + 1){
#pragma acc loop worker

for(int32_t j = 0; j < call20;   j = j + 1){
_Z11kernel_diagiiPdS_S_S__OC_5(m, n, data, corr, mean, stddev, 256, 1, 1, call20, 1, 1, i, 0, 0, j, 0, 0);
}
}
  block.field0 = 8;
  block.field1 = 32;
  block.field2 = 1;
  call28 = _ZL10num_blocksii((m - 1), block.field0);
  call31 = _ZL10num_blocksii((m - 1), block.field1);
  grid.field0 = call28;
  grid.field1 = call31;
  grid.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp32)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp33)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp32_2e_coerce)), ((uint8_t*)(&agg_2e_tmp32)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp33_2e_coerce)), ((uint8_t*)(&agg_2e_tmp33)), 12);
#pragma acc parallel loop gang collapse(2)

for(int32_t i = 0; i < 8;   i = i + 1){

for(int32_t j = 0; j < 32;   j = j + 1){
#pragma acc loop worker collapse(2)

for(int32_t k = 0; k < call28;   k = k + 1){

for(int32_t l = 0; l < call31;   l = l + 1){
_Z11kernel_corriiPdS_S_S__OC_6(m, n, data, corr, mean, stddev, 8, 32, 1, call28, call31, 1, i, j, 0, k, l, 0);
}
}
}
}
  agg_2e_tmp38.field0 = 1;
  agg_2e_tmp38.field1 = 1;
  agg_2e_tmp38.field2 = 1;
  agg_2e_tmp39.field0 = 1;
  agg_2e_tmp39.field1 = 1;
  agg_2e_tmp39.field2 = 1;
  _15 = memcpy(((uint8_t*)(&agg_2e_tmp38_2e_coerce)), ((uint8_t*)(&agg_2e_tmp38)), 12);
  _16 = memcpy(((uint8_t*)(&agg_2e_tmp39_2e_coerce)), ((uint8_t*)(&agg_2e_tmp39)), 12);
  ;
  if (0) {
  } else {
_Z11kernel_tailiiPdS_S_S__OC_7(m, n, data, corr, mean, stddev, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0);
  }
  return;
}


void _ZL11print_arrayiPd(uint32_t m, double* corr) {
  int64_t i;
  uint64_t j;
  int32_t call11;


for(int64_t i = 0; i < m;   i = i + 1){

for(int64_t j = 0; j < m;   j = j + 1){
  uint32_t call = fprintf(stderr, (_OC_str), corr[(i * m + j)]);
  if ((int)(i * m + j) % (int)20 == 0) {
  fprintf(stderr, (_OC_str_OC_1));
  }
}
}
  fprintf(stderr, (_OC_str_OC_1));
}


uint32_t _ZL10num_blocksii(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}


void _Z11kernel_meaniiPdS_S_S__OC_2(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int64_t j;
  int64_t i;

  j = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  if (j < m) {
  mean[j] = 0;

for(int64_t i = 0; i < n;   i = i + 1){
  mean[j] = (mean[j] + data[(i * m + j)]);
}
  mean[j] = (mean[j] / (double)(n));
  }
  return;
}


void _Z13kernel_stddeviiPdS_S_S__OC_3(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int64_t j;
  int64_t i;
  double _17;

  j = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  if (j < m) {
  stddev[j] = 0;

for(int64_t i = 0; i < n;   i = i + 1){
  stddev[j] = (stddev[j] + ((data[(i * m + j)] - mean[j]) * (data[(i * m + j)] - mean[j])));
}
  stddev[j] = (stddev[j] / (double)(n));
  _17 = sqrt(stddev[j]);
  stddev[j] = _17;
  if (llvm_fcmp_ole(stddev[j], 0.10000000000000001)) {
  stddev[j] = 1;
  }
  }
  return;
}


void _Z13kernel_reduceiiPdS_S_S__OC_4(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int32_t i;
  int64_t j;
  double _18;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  j = blockDim_2e_y * blockIdx_2e_y + threadIdx_2e_y;
  if (i < n) {
  if (j < m) {
  data[(i * m + j)] = (data[(i * m + j)] - mean[j]);
  _18 = sqrt((double)(n));
  data[(i * m + j)] = (data[(i * m + j)] / (_18 * stddev[j]));
  }
  }
  return;
}


void _Z11kernel_diagiiPdS_S_S__OC_5(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int32_t i;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  if (i < m) {
  corr[(i * m + i)] = 1;
  }
  return;
}


void _Z11kernel_corriiPdS_S_S__OC_6(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int32_t i;
  int32_t j;
  int64_t k;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  j = blockDim_2e_y * blockIdx_2e_y + threadIdx_2e_y + i + 1;
  if (i < (m - 1)) {
  if (j < m) {
  corr[(i * m + j)] = 0;

for(int64_t k = 0; k < n;   k = k + 1){
  corr[(i * m + j)] = (corr[(i * m + j)] + (data[(k * m + i)] * data[(k * m + j)]));
}
  corr[(j * m + i)] = corr[(i * m + j)];
  }
  }
  return;
}


void _Z11kernel_tailiiPdS_S_S__OC_7(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  corr[(((m - 1) * m + m) - 1)] = 1;
}

