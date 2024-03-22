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
void _ZL10init_arrayiPdS_S_S_(uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void _ZL6kerneliiPdS_S_S_(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaFree(uint8_t*);
void _ZL11print_arrayiPd(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t _ZL10num_blocksii(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void _Z19kernel_column_sweepiiPdS_S_S_dddddd_OC_1(uint32_t, uint32_t, double*, double*, double*, double*, double, double, double, double, double, double, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z16kernel_row_sweepiiPdS_S_S_dddddd_OC_2(uint32_t, uint32_t, double*, double*, double*, double*, double, double, double, double, double, double, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
  int32_t call38;
  int32_t call54;

  n = atoi(argv[2]);
  tsteps = atoi(argv[3]);
  dump_code = atoi(argv[1]);
  u = malloc(n * n * 8);
  v = malloc(n * n * 8);
  p = malloc(n * n * 8);
  q = malloc(n * n * 8);
  _ZL10init_arrayiPdS_S_S_(n, ((double*)u), ((double*)v), ((double*)p), ((double*)q));
;
  _ZL6kerneliiPdS_S_S_(tsteps, n, ((double*)u), ((double*)v), ((double*)p), ((double*)q));
;
  if (dump_code == 1) {
_ZL11print_arrayiPd(n, ((double*)u));
  }
free(((uint8_t*)((double*)u)));
free(((uint8_t*)((double*)v)));
free(((uint8_t*)((double*)p)));
free(((uint8_t*)((double*)q)));
  return 0;
}


void _ZL10init_arrayiPdS_S_S_(uint32_t n, double* u, double* v, double* p, double* q) {
  int64_t i;
  uint64_t j;

#pragma omp parallel for 
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


void _ZL6kerneliiPdS_S_S_(uint32_t tsteps, uint32_t n, double* u, double* v, double* p, double* q) {
  struct l_struct_struct_OC_dim3 agg_2e_tmp;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp15;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp15_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp17;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp20;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp17_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp20_2e_coerce;    /* Address-exposed local */
  double DX;
  double DY;
  double DT;
  double mul1;
  double mul2;
  double div10;
  double b;
  double div12;
  double e;
  int32_t t;
  uint32_t j;
  uint32_t k;

  DX = (1 / (double)(n));
  DY = (1 / (double)(n));
  DT = (1 / (double)(tsteps));
  mul1 = (((2 * DT) / DX) / DX);
  mul2 = (((1 * DT) / DY) / DY);
  div10 = (-(mul1) / 2);
  b = (1 + mul1);
  div12 = (-(mul2) / 2);
  e = (1 + mul2);

for(int32_t t = 1; t <= tsteps;   t = t + 1){
  uint32_t call = _ZL10num_blocksii((n - 2), 256);
  agg_2e_tmp.field0 = call;
  agg_2e_tmp.field1 = 1;
  agg_2e_tmp.field2 = 1;
  agg_2e_tmp15.field0 = 256;
  agg_2e_tmp15.field1 = 1;
  agg_2e_tmp15.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp_2e_coerce)), ((uint8_t*)(&agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp15_2e_coerce)), ((uint8_t*)(&agg_2e_tmp15)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < call;   j = j + 1){

for(int32_t k = 0; k < 256;   k = k + 1){
_Z19kernel_column_sweepiiPdS_S_S_dddddd_OC_1(tsteps, n, u, v, p, q, div10, b, div10, div12, e, div12, call, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
  uint32_t call19 = _ZL10num_blocksii((n - 2), 256);
  agg_2e_tmp17.field0 = call19;
  agg_2e_tmp17.field1 = 1;
  agg_2e_tmp17.field2 = 1;
  agg_2e_tmp20.field0 = 256;
  agg_2e_tmp20.field1 = 1;
  agg_2e_tmp20.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp17_2e_coerce)), ((uint8_t*)(&agg_2e_tmp17)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp20_2e_coerce)), ((uint8_t*)(&agg_2e_tmp20)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < call19;   j = j + 1){

for(int32_t k = 0; k < 256;   k = k + 1){
_Z16kernel_row_sweepiiPdS_S_S_dddddd_OC_2(tsteps, n, u, v, p, q, div10, b, div10, div12, e, div12, call19, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
}
  return;
}


void _ZL11print_arrayiPd(uint32_t n, double* u) {
  int64_t i;
  uint64_t j;
  int32_t call11;


for(int64_t i = 0; i < n;   i = i + 1){

for(int64_t j = 0; j < n;   j = j + 1){
  uint32_t call = fprintf(stderr, _OC_str, u[(i * n + j)]);
  if ((int)(i * n + j) % (int)20 == 0) {
  fprintf(stderr, _OC_str_OC_1);
  }
}
}
  fprintf(stderr, _OC_str_OC_1);
}


uint32_t _ZL10num_blocksii(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}


void _Z19kernel_column_sweepiiPdS_S_S_dddddd_OC_1(uint32_t tsteps, uint32_t n, double* u, double* v, double* p, double* q, double a, double b, double c, double d, double e, double f, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int32_t i;
  int64_t j;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x + 1;
  if (i < (n - 1)) {
  v[(0 * n + i)] = 1;
  p[(i * n + 0)] = 0;
  q[(i * n + 0)] = v[(0 * n + i)];

for(int64_t j = 1; j < (n - 1);   j = j + 1){
  p[(i * n + j)] = (-(c) / ((a * p[((i * n + j) - 1)]) + b));
  q[(i * n + j)] = (((((-(d) * u[((j * n + i) - 1)]) + ((1 + (2 * d)) * u[(j * n + i)])) - (f * u[((j * n + i) + 1)])) - (a * q[((i * n + j) - 1)])) / ((a * p[((i * n + j) - 1)]) + b));
}
  v[((n - 1) * n + i)] = 1;

for(int64_t j = n + -2; j >= 1;   j = j + -1){
  v[(j * n + i)] = ((p[(i * n + j)] * v[((j + 1) * n + i)]) + q[(i * n + j)]);
}
  }
  return;
}


void _Z16kernel_row_sweepiiPdS_S_S_dddddd_OC_2(uint32_t tsteps, uint32_t n, double* u, double* v, double* p, double* q, double a, double b, double c, double d, double e, double f, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int32_t i;
  int64_t j;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x + 1;
  if (i < (n - 1)) {
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

