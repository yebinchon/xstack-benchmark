/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
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
void _ZL10init_arrayiiPdS_S_S_(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void _ZL6kerneliiiPdS_S_S_(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void _ZL11print_arrayiiPdS_S_(uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
uint32_t _ZL10num_blocksii(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void _Z12kernel_splatiiiPdS_S_S_i1(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z9kernel_eyiiiPdS_S_S_i2(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z9kernel_exiiiPdS_S_S_i3(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z9kernel_hziiiPdS_S_S_i4(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
uint8_t _OC_str[8] = { "%0.2lf " };
uint8_t _OC_str_OC_1[2] = { "\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
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

  tmax = atoi(argv[2]);
  nx = atoi(argv[3]);
  ny = atoi(argv[4]);
  dump_code = atoi(argv[1]);
  ex = malloc(nx * ny * 8);
  ey = malloc(nx * ny * 8);
  hz = malloc(nx * ny * 8);
  _fict_ = malloc(ny * 8);
  _ZL10init_arrayiiPdS_S_S_(nx, ny, ((double*)ex), ((double*)ey), ((double*)hz), ((double*)_fict_));
;
  _ZL6kerneliiiPdS_S_S_(tmax, nx, ny, ((double*)ex), ((double*)ey), ((double*)hz), ((double*)_fict_));
;
  if (dump_code == 1) {
_ZL11print_arrayiiPdS_S_(nx, ny, ((double*)ex), ((double*)ey), ((double*)hz));
  }
free(((uint8_t*)((double*)ex)));
free(((uint8_t*)((double*)ey)));
free(((uint8_t*)((double*)hz)));
free(((uint8_t*)((double*)_fict_)));
  return 0;
}


void _ZL10init_arrayiiPdS_S_S_(uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* _fict_) {
  int64_t i;
  int32_t j;


for(int32_t i = 0; i < ny;   i = i + 1){
  _fict_[i] = (double)(i);
}

for(int32_t i = 0; i < nx;   i = i + 1){

for(int32_t j = 0; j < ny;   j = j + 1){
  ex[(i * ny + j)] = (double)(i) * (double)((j + 1)) / (double)(nx);
  ey[(i * ny + j)] = (double)(i) * (double)((j + 2)) / (double)(ny);
  hz[(i * ny + j)] = (double)(i) * (double)((j + 3)) / (double)(nx);
}
}
  return;
}


void _ZL6kerneliiiPdS_S_S_(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict) {
  struct l_struct_struct_OC_dim3 agg_2e_tmp;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp28;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp28_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp33;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp34;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp33_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp34_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp46;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp47;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp46_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp47_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp60;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp61;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp60_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp61_2e_coerce;    /* Address-exposed local */
  uint8_t* dev_ex;
  uint8_t* dev_ey;
  uint8_t* dev_hz;
  uint8_t* dev_fict;
  uint8_t* _1;
  uint8_t* _2;
  uint8_t* _3;
  uint8_t* _4;
  int32_t t;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;
  uint8_t* _5;
  uint8_t* _6;
  uint8_t* _7;

  dev_ex = malloc(nx * ny * 8);
  dev_ey = malloc(nx * ny * 8);
  dev_hz = malloc(nx * ny * 8);
  dev_fict = malloc(ny * 8);
  memcpy(((uint8_t*)((double*)dev_ex)), ((uint8_t*)ex), nx * ny * 8);
  memcpy(((uint8_t*)((double*)dev_ey)), ((uint8_t*)ey), nx * ny * 8);
  memcpy(((uint8_t*)((double*)dev_hz)), ((uint8_t*)hz), nx * ny * 8);
  memcpy(((uint8_t*)((double*)dev_fict)), ((uint8_t*)fict), ny * 8);

for(int32_t t = 0; t < tmax;   t = t + 1){
  agg_2e_tmp.field0 = 256;
  agg_2e_tmp.field1 = 1;
  agg_2e_tmp.field2 = 1;
  uint32_t call29 = _ZL10num_blocksii(ny, 256);
  agg_2e_tmp28.field0 = call29;
  agg_2e_tmp28.field1 = 1;
  agg_2e_tmp28.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp_2e_coerce)), ((uint8_t*)(&agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp28_2e_coerce)), ((uint8_t*)(&agg_2e_tmp28)), 12);
#pragma omp target teams distribute parallel for map(to: dev_fict[0:ny * 8]) map(tofrom: dev_ex[0:nx * ny * 8], dev_ey[0:nx * ny * 8], dev_hz[0:nx * ny * 8])
for(int32_t j = 0; j < 256;   j = j + 1){

for(int32_t k = 0; k < call29;   k = k + 1){
_Z12kernel_splatiiiPdS_S_S_i1(tmax, nx, ny, ((double*)dev_ex), ((double*)dev_ey), ((double*)dev_hz), ((double*)dev_fict), t, 256, 1, 1, call29, 1, 1, j, 0, 0, k, 0, 0);
}
}
  block.field0 = 8;
  block.field1 = 32;
  block.field2 = 1;
  uint32_t call31 = _ZL10num_blocksii((nx - 1), block.field0);
  uint32_t call32 = _ZL10num_blocksii(ny, block.field1);
  grid.field0 = call31;
  grid.field1 = call32;
  grid.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp33)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp34)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp33_2e_coerce)), ((uint8_t*)(&agg_2e_tmp33)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp34_2e_coerce)), ((uint8_t*)(&agg_2e_tmp34)), 12);
#pragma omp target teams distribute parallel for map(to: dev_fict[0:ny * 8]) map(tofrom: dev_ex[0:nx * ny * 8], dev_ey[0:nx * ny * 8], dev_hz[0:nx * ny * 8])
for(int32_t j = 0; j < call31;   j = j + 1){

for(int32_t k = 0; k < call32;   k = k + 1){

for(int32_t l = 0; l < 8;   l = l + 1){

for(int32_t m = 0; m < 32;   m = m + 1){
_Z9kernel_eyiiiPdS_S_S_i2(tmax, nx, ny, ((double*)dev_ex), ((double*)dev_ey), ((double*)dev_hz), ((double*)dev_fict), t, call31, call32, 1, 8, 32, 1, j, k, 0, l, m, 0);
}
}
}
}
  block.field0 = 8;
  block.field1 = 32;
  block.field2 = 1;
  uint32_t call42 = _ZL10num_blocksii(nx, block.field0);
  uint32_t call45 = _ZL10num_blocksii((ny - 1), block.field1);
  grid.field0 = call42;
  grid.field1 = call45;
  grid.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp46)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp47)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp46_2e_coerce)), ((uint8_t*)(&agg_2e_tmp46)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp47_2e_coerce)), ((uint8_t*)(&agg_2e_tmp47)), 12);
#pragma omp target teams distribute parallel for map(to: dev_fict[0:ny * 8]) map(tofrom: dev_ex[0:nx * ny * 8], dev_ey[0:nx * ny * 8], dev_hz[0:nx * ny * 8])
for(int32_t j = 0; j < call42;   j = j + 1){

for(int32_t k = 0; k < call45;   k = k + 1){

for(int32_t l = 0; l < 8;   l = l + 1){

for(int32_t m = 0; m < 32;   m = m + 1){
_Z9kernel_exiiiPdS_S_S_i3(tmax, nx, ny, ((double*)dev_ex), ((double*)dev_ey), ((double*)dev_hz), ((double*)dev_fict), t, call42, call45, 1, 8, 32, 1, j, k, 0, l, m, 0);
}
}
}
}
  block.field0 = 8;
  block.field1 = 32;
  block.field2 = 1;
  uint32_t call56 = _ZL10num_blocksii((nx - 1), block.field0);
  uint32_t call59 = _ZL10num_blocksii((ny - 1), block.field1);
  grid.field0 = call56;
  grid.field1 = call59;
  grid.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp60)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp61)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp60_2e_coerce)), ((uint8_t*)(&agg_2e_tmp60)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp61_2e_coerce)), ((uint8_t*)(&agg_2e_tmp61)), 12);
#pragma omp target teams distribute parallel for map(to: dev_fict[0:ny * 8]) map(tofrom: dev_ex[0:nx * ny * 8], dev_ey[0:nx * ny * 8], dev_hz[0:nx * ny * 8])
for(int32_t j = 0; j < call56;   j = j + 1){

for(int32_t k = 0; k < call59;   k = k + 1){

for(int32_t l = 0; l < 8;   l = l + 1){

for(int32_t m = 0; m < 32;   m = m + 1){
_Z9kernel_hziiiPdS_S_S_i4(tmax, nx, ny, ((double*)dev_ex), ((double*)dev_ey), ((double*)dev_hz), ((double*)dev_fict), t, call56, call59, 1, 8, 32, 1, j, k, 0, l, m, 0);
}
}
}
}
}
  memcpy(((uint8_t*)ex), ((uint8_t*)((double*)dev_ex)), nx * ny * 8);
  memcpy(((uint8_t*)ey), ((uint8_t*)((double*)dev_ey)), nx * ny * 8);
  memcpy(((uint8_t*)hz), ((uint8_t*)((double*)dev_hz)), ny * 8);
}


void _ZL11print_arrayiiPdS_S_(uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz) {
  int32_t i;
  int32_t j;
  int32_t call21;


for(int32_t i = 0; i < nx;   i = i + 1){

for(int32_t j = 0; j < ny;   j = j + 1){
  uint32_t call = fprintf(stderr, (_OC_str), ex[(i * ny + j)]);
  uint32_t call8 = fprintf(stderr, (_OC_str), ey[(i * ny + j)]);
  uint32_t call13 = fprintf(stderr, (_OC_str), hz[(i * ny + j)]);
  if ((int)(i * nx + j) % (int)20 == 0) {
  fprintf(stderr, (_OC_str_OC_1));
  }
}
}
  fprintf(stderr, (_OC_str_OC_1));
}


uint32_t _ZL10num_blocksii(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}


void _Z12kernel_splatiiiPdS_S_S_i1(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int32_t j;

  j = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  if (j < ny) {
  ey[(0 * ny + j)] = fict[t];
  }
  return;
}


void _Z9kernel_eyiiiPdS_S_S_i2(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int32_t i;
  int32_t j;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x + 1;
  j = blockDim_2e_y * blockIdx_2e_y + threadIdx_2e_y;
  if (i < nx) {
  if (j < ny) {
  ey[(i * ny + j)] = (ey[(i * ny + j)] - 0.5 * (hz[(i * ny + j)] - hz[((i - 1) * ny + j)]));
  }
  }
  return;
}


void _Z9kernel_exiiiPdS_S_S_i3(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int32_t i;
  int32_t j;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  j = blockDim_2e_y * blockIdx_2e_y + threadIdx_2e_y + 1;
  if (i < nx) {
  if (j < ny) {
  ex[(i * ny + j)] = (ex[(i * ny + j)] - 0.5 * (hz[(i * ny + j)] - hz[((i * ny + j) - 1)]));
  }
  }
  return;
}


void _Z9kernel_hziiiPdS_S_S_i4(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int32_t i;
  int32_t j;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  j = blockDim_2e_y * blockIdx_2e_y + threadIdx_2e_y;
  if (i < (nx - 1)) {
  if (j < (ny - 1)) {
  hz[(i * ny + j)] = (hz[(i * ny + j)] - 0.69999999999999996 * (((ex[((i * ny + j) + 1)] - ex[(i * ny + j)]) + ey[((i + 1) * ny + j)]) - ey[(i * ny + j)]));
  }
  }
  return;
}

