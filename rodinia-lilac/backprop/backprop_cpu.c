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

static __forceinline int llvm_fcmp_ogt(double X, double Y) { return X >  Y; }


/* Global Declarations */

/* Types Declarations */
struct __FIXME__l_struct_struct_OC_BPNN;
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
struct __FIXME__l_struct_struct_OC_BPNN {
  uint32_t __FIXME__l_struct_struct_OC_BPNN_field0;
  uint32_t __FIXME__l_struct_struct_OC_BPNN_field1;
  uint32_t __FIXME__l_struct_struct_OC_BPNN_field2;
  float* __FIXME__l_struct_struct_OC_BPNN_field3;
  float* __FIXME__l_struct_struct_OC_BPNN_field4;
  float* __FIXME__l_struct_struct_OC_BPNN_field5;
  float* __FIXME__l_struct_struct_OC_BPNN_field6;
  float* __FIXME__l_struct_struct_OC_BPNN_field7;
  float* __FIXME__l_struct_struct_OC_BPNN_field8;
  float** __FIXME__l_struct_struct_OC_BPNN_field9;
  float** __FIXME__l_struct_struct_OC_BPNN_field10;
  float** __FIXME__l_struct_struct_OC_BPNN_field11;
  float** __FIXME__l_struct_struct_OC_BPNN_field12;
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
float squash(float) __ATTRIBUTELIST__((noinline, nothrow));
float expf(float) __ATTRIBUTELIST__((nothrow));
float** alloc_2d_dbl(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline));
float* alloc_1d_dbl(uint32_t) __ATTRIBUTELIST__((noinline));
void bpnn_initialize(uint32_t) __ATTRIBUTELIST__((noinline));
void srand(uint32_t) __ATTRIBUTELIST__((nothrow));
struct __FIXME__l_struct_struct_OC_BPNN* bpnn_create(uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline));
struct __FIXME__l_struct_struct_OC_BPNN* bpnn_internal_create(uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline));
void bpnn_randomize_weights(float**, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void bpnn_zero_weights(float**, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void bpnn_randomize_row(float*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void bpnn_layerforward(float*, float*, float**, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void bpnn_output_error(float*, float*, float*, uint32_t, float*) __ATTRIBUTELIST__((noinline, nothrow));
void bpnn_hidden_error(float*, uint32_t, float*, uint32_t, float**, float*, float*) __ATTRIBUTELIST__((noinline, nothrow));
void bpnn_adjust_weights(float*, uint32_t, float*, uint32_t, float**, float**) __ATTRIBUTELIST__((noinline, nothrow));
void bpnn_feedforward(struct __FIXME__l_struct_struct_OC_BPNN*) __ATTRIBUTELIST__((noinline, nothrow));
void bpnn_train(struct __FIXME__l_struct_struct_OC_BPNN*, float*, float*) __ATTRIBUTELIST__((noinline, nothrow));
void bpnn_save(struct __FIXME__l_struct_struct_OC_BPNN*, uint8_t*) __ATTRIBUTELIST__((noinline));
struct __FIXME__l_struct_struct_OC_BPNN* bpnn_read(uint8_t*) __ATTRIBUTELIST__((noinline));
uint32_t open(uint8_t*, uint32_t, ...);
uint64_t read(uint32_t, uint8_t*, uint64_t);
uint32_t close(uint32_t);
uint32_t setup(uint32_t, uint8_t**) __ATTRIBUTELIST__((noinline));
void backprop_face(void) __ATTRIBUTELIST__((noinline));
void load(struct __FIXME__l_struct_struct_OC_BPNN*) __ATTRIBUTELIST__((noinline, nothrow));
void bpnn_train_cuda(struct __FIXME__l_struct_struct_OC_BPNN*, float*, float*) __ATTRIBUTELIST__((noinline));
double gettime(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t gettimeofday(struct __FIXME__l_struct_struct_OC_timeval*, uint8_t*) __ATTRIBUTELIST__((nothrow));
int main(int, char **) __ATTRIBUTELIST__((noinline));
void bpnn_layerforward_CUDA0(float*, float*, float*, float*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void bpnn_adjust_weights_cuda0(float*, uint32_t, float*, uint32_t, float*, float*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void bpnn_layerforward_CUDA3(float*, float*, float*, float*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void bpnn_layerforward_CUDA2(float*, float*, float*, float*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void bpnn_layerforward_CUDA1(float*, float*, float*, float*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void bpnn_adjust_weights_cuda1(float*, uint32_t, float*, uint32_t, float*, float*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
float _ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE10input_node[16] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
float _ZZ22bpnn_layerforward_CUDAPfS_S_S_iiE13weight_matrix[16][16] = { { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
uint32_t layer_size;
uint32_t num_threads;
uint32_t num_blocks;
uint8_t _OC_str[51] = { "ALLOC_2D_DBL: Couldn't allocate array of dbl ptrs\n" };
uint8_t _OC_str_OC_10[49] = { "ALLOC_1D_DBL: Couldn't allocate array of floats\n" };
uint8_t _OC_str_OC_1[34] = { "Random number generator seed: %d\n" };
uint8_t _OC_str_OC_11[47] = { "BPNN_CREATE: Couldn't allocate neural network\n" };
uint8_t _OC_str_OC_2[3] = { "w+" };
uint8_t _OC_str_OC_3[31] = { "BPNN_SAVE: Cannot create '%s'\n" };
uint8_t _OC_str_OC_4[33] = { "Saving %dx%dx%d network to '%s'\n" };
uint8_t _OC_str_OC_5[41] = { "usage: backprop <num of input elements>\n" };
uint8_t _OC_str_OC_6[50] = { "The number of input points must be divided by 16\n" };
uint8_t _OC_str_OC_12[23] = { "Input layer size : %d\n" };
uint8_t _OC_str_OC_13[26] = { "Starting training kernel\n" };
uint8_t _OC_str_OC_14[15] = { "Training done\n" };
uint8_t _OC_str_OC_7[51] = { "Failed to allocate host buffers for CUDA training\n" };
uint8_t _OC_str_OC_8[28] = { "Performing GPU computation\n" };
uint8_t _OC_str_OC_9[23] = { "bpnn kernel error: %s\n" };
float input_node_shared[16];
float weight_matrix_shared[16][16];


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline float llvm_fadd_f32(float a, float b) {
  float r = a + b;
  return r;
}
static __forceinline uint64_t llvm_sub_u64(uint64_t a, uint64_t b) {
  uint64_t r = a - b;
  return r;
}
static __forceinline float llvm_fsub_f32(float a, float b) {
  float r = a - b;
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
static __forceinline float llvm_fmul_f32(float a, float b) {
  float r = a * b;
  return r;
}
static __forceinline uint32_t llvm_sdiv_u32(int32_t a, int32_t b) {
  uint32_t r = a / b;
  return r;
}
static __forceinline float llvm_fdiv_f32(float a, float b) {
  float r = a / b;
  return r;
}
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}
static __forceinline float llvm_neg_f32(float a) {
  float r = -a;
  return r;
}


/* Function Bodies */

// FUNCTION ORDER ID 0 START
// INSERT COMMENT FUNCTION: squash
float squash(float x) {
  float __FIXME__call;

  __FIXME__call = expf(-x);
  return (1 / 1 + __FIXME__call);
}
// FUNCTION ORDER ID 0 END


// FUNCTION ORDER ID 1 START
// INSERT COMMENT FUNCTION: alloc_2d_dbl
float** alloc_2d_dbl(uint32_t m, uint32_t n) {
  uint8_t* new_mem;
  int64_t i;
  float** __FIXME__retval_2e_0;

// INSERT COMMENT IFELSE: alloc_2d_dbl::entry
  new_mem = malloc(m * 8);
  if (__FIXME__retval_2e_0 == ((float**)0)) { // IFELSE MARKER: entry IF
  printf((_OC_str));
  __FIXME__retval_2e_0 = ((float**)0);
  }
// INSERT COMMENT LOOP: alloc_2d_dbl::for.cond
for(int64_t i = 0; i < m;   i = i + 1) {
  float* __FIXME__call3 = alloc_1d_dbl(n);
  ((float**)new_mem)[i] = __FIXME__call3;
}
  return __FIXME__retval_2e_0;
}
// FUNCTION ORDER ID 1 END


// FUNCTION ORDER ID 2 START
// INSERT COMMENT FUNCTION: alloc_1d_dbl
float* alloc_1d_dbl(uint32_t n) {
  uint8_t* new_mem;
  float* __FIXME__retval_2e_0;

// INSERT COMMENT IFELSE: alloc_1d_dbl::entry
  new_mem = malloc(n * 4);
  if (__FIXME__retval_2e_0 == ((float*)0)) { // IFELSE MARKER: entry IF
  printf((_OC_str_OC_10));
  __FIXME__retval_2e_0 = ((float*)0);
  }
  return __FIXME__retval_2e_0;
}
// FUNCTION ORDER ID 2 END


// FUNCTION ORDER ID 3 START
// INSERT COMMENT FUNCTION: bpnn_initialize
void bpnn_initialize(uint32_t seed) {

  printf((_OC_str_OC_1), seed);
srand(seed);
}
// FUNCTION ORDER ID 3 END


// FUNCTION ORDER ID 4 START
// INSERT COMMENT FUNCTION: bpnn_free
void bpnn_free(struct __FIXME__l_struct_struct_OC_BPNN* net) {
  int64_t i;

// INSERT COMMENT IFELSE: bpnn_free::entry
  if (net == ((struct __FIXME__l_struct_struct_OC_BPNN*)0)) { // IFELSE MARKER: entry IF
  }
free(((uint8_t*)net->__FIXME__l_struct_struct_OC_BPNN_field3));
free(((uint8_t*)net->__FIXME__l_struct_struct_OC_BPNN_field4));
free(((uint8_t*)net->__FIXME__l_struct_struct_OC_BPNN_field5));
free(((uint8_t*)net->__FIXME__l_struct_struct_OC_BPNN_field6));
free(((uint8_t*)net->__FIXME__l_struct_struct_OC_BPNN_field7));
free(((uint8_t*)net->__FIXME__l_struct_struct_OC_BPNN_field8));
// INSERT COMMENT LOOP: bpnn_free::for.cond
for(int64_t i = 0; i <= net->__FIXME__l_struct_struct_OC_BPNN_field0;   i = i + 1) {
free(((uint8_t*)net->__FIXME__l_struct_struct_OC_BPNN_field9[i]));
free(((uint8_t*)net->__FIXME__l_struct_struct_OC_BPNN_field11[i]));
}
free(((uint8_t*)net->__FIXME__l_struct_struct_OC_BPNN_field9));
free(((uint8_t*)net->__FIXME__l_struct_struct_OC_BPNN_field11));
// INSERT COMMENT LOOP: bpnn_free::for.cond7
for(int64_t i = 0; i <= net->__FIXME__l_struct_struct_OC_BPNN_field1;   i = i + 1) {
free(((uint8_t*)net->__FIXME__l_struct_struct_OC_BPNN_field10[i]));
free(((uint8_t*)net->__FIXME__l_struct_struct_OC_BPNN_field12[i]));
}
free(((uint8_t*)net->__FIXME__l_struct_struct_OC_BPNN_field10));
free(((uint8_t*)net->__FIXME__l_struct_struct_OC_BPNN_field12));
free(((uint8_t*)net));
  return;
}
// FUNCTION ORDER ID 4 END


// FUNCTION ORDER ID 5 START
// INSERT COMMENT FUNCTION: bpnn_create
struct __FIXME__l_struct_struct_OC_BPNN* bpnn_create(uint32_t n_in, uint32_t n_hidden, uint32_t n_out) {
  struct __FIXME__l_struct_struct_OC_BPNN* __FIXME__call;
  struct __FIXME__l_struct_struct_OC_BPNN* __FIXME__retval_2e_0;

// INSERT COMMENT IFELSE: bpnn_create::entry
  __FIXME__call = bpnn_internal_create(n_in, n_hidden, n_out);
  if (__FIXME__retval_2e_0 == ((struct __FIXME__l_struct_struct_OC_BPNN*)0)) { // IFELSE MARKER: entry IF
  __FIXME__retval_2e_0 = ((struct __FIXME__l_struct_struct_OC_BPNN*)0);
  }
bpnn_randomize_weights(__FIXME__call->__FIXME__l_struct_struct_OC_BPNN_field9, n_in, n_hidden);
bpnn_randomize_weights(__FIXME__call->__FIXME__l_struct_struct_OC_BPNN_field10, n_hidden, n_out);
bpnn_zero_weights(__FIXME__call->__FIXME__l_struct_struct_OC_BPNN_field11, n_in, n_hidden);
bpnn_zero_weights(__FIXME__call->__FIXME__l_struct_struct_OC_BPNN_field12, n_hidden, n_out);
bpnn_randomize_row(__FIXME__call->__FIXME__l_struct_struct_OC_BPNN_field8, n_out);
  return __FIXME__retval_2e_0;
}
// FUNCTION ORDER ID 5 END


// FUNCTION ORDER ID 6 START
// INSERT COMMENT FUNCTION: bpnn_internal_create
struct __FIXME__l_struct_struct_OC_BPNN* bpnn_internal_create(uint32_t n_in, uint32_t n_hidden, uint32_t n_out) {
  uint8_t* newnet;
  float* __FIXME__call2;
  float* __FIXME__call4;
  float* __FIXME__call6;
  float* __FIXME__call8;
  float* __FIXME__call10;
  float* __FIXME__call12;
  float** __FIXME__call15;
  float** __FIXME__call18;
  float** __FIXME__call21;
  float** __FIXME__call24;
  struct __FIXME__l_struct_struct_OC_BPNN* __FIXME__retval_2e_0;

// INSERT COMMENT IFELSE: bpnn_internal_create::entry
  newnet = malloc(96);
  if (__FIXME__retval_2e_0 == ((struct __FIXME__l_struct_struct_OC_BPNN*)0)) { // IFELSE MARKER: entry IF
  printf((_OC_str_OC_11));
  __FIXME__retval_2e_0 = ((struct __FIXME__l_struct_struct_OC_BPNN*)0);
  }
  ((struct __FIXME__l_struct_struct_OC_BPNN*)newnet)->__FIXME__l_struct_struct_OC_BPNN_field0 = n_in;
  ((struct __FIXME__l_struct_struct_OC_BPNN*)newnet)->__FIXME__l_struct_struct_OC_BPNN_field1 = n_hidden;
  ((struct __FIXME__l_struct_struct_OC_BPNN*)newnet)->__FIXME__l_struct_struct_OC_BPNN_field2 = n_out;
  __FIXME__call2 = alloc_1d_dbl(n_in + 1);
  ((struct __FIXME__l_struct_struct_OC_BPNN*)newnet)->__FIXME__l_struct_struct_OC_BPNN_field3 = __FIXME__call2;
  __FIXME__call4 = alloc_1d_dbl(n_hidden + 1);
  ((struct __FIXME__l_struct_struct_OC_BPNN*)newnet)->__FIXME__l_struct_struct_OC_BPNN_field4 = __FIXME__call4;
  __FIXME__call6 = alloc_1d_dbl(n_out + 1);
  ((struct __FIXME__l_struct_struct_OC_BPNN*)newnet)->__FIXME__l_struct_struct_OC_BPNN_field5 = __FIXME__call6;
  __FIXME__call8 = alloc_1d_dbl(n_hidden + 1);
  ((struct __FIXME__l_struct_struct_OC_BPNN*)newnet)->__FIXME__l_struct_struct_OC_BPNN_field6 = __FIXME__call8;
  __FIXME__call10 = alloc_1d_dbl(n_out + 1);
  ((struct __FIXME__l_struct_struct_OC_BPNN*)newnet)->__FIXME__l_struct_struct_OC_BPNN_field7 = __FIXME__call10;
  __FIXME__call12 = alloc_1d_dbl(n_out + 1);
  ((struct __FIXME__l_struct_struct_OC_BPNN*)newnet)->__FIXME__l_struct_struct_OC_BPNN_field8 = __FIXME__call12;
  __FIXME__call15 = alloc_2d_dbl(n_in + 1, n_hidden + 1);
  ((struct __FIXME__l_struct_struct_OC_BPNN*)newnet)->__FIXME__l_struct_struct_OC_BPNN_field9 = __FIXME__call15;
  __FIXME__call18 = alloc_2d_dbl(n_hidden + 1, n_out + 1);
  ((struct __FIXME__l_struct_struct_OC_BPNN*)newnet)->__FIXME__l_struct_struct_OC_BPNN_field10 = __FIXME__call18;
  __FIXME__call21 = alloc_2d_dbl(n_in + 1, n_hidden + 1);
  ((struct __FIXME__l_struct_struct_OC_BPNN*)newnet)->__FIXME__l_struct_struct_OC_BPNN_field11 = __FIXME__call21;
  __FIXME__call24 = alloc_2d_dbl(n_hidden + 1, n_out + 1);
  ((struct __FIXME__l_struct_struct_OC_BPNN*)newnet)->__FIXME__l_struct_struct_OC_BPNN_field12 = __FIXME__call24;
  return __FIXME__retval_2e_0;
}
// FUNCTION ORDER ID 6 END


// FUNCTION ORDER ID 7 START
// INSERT COMMENT FUNCTION: bpnn_randomize_weights
void bpnn_randomize_weights(float** w, uint32_t m, uint32_t n) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: bpnn_randomize_weights::for.cond
for(int64_t i = 0; i <= m;   i = i + 1) {
for(int64_t j = 0; j <= n;   j = j + 1) {
  uint32_t __FIXME__call = rand();
  w[i][j] = ((float)(__FIXME__call) / 2.14748365E+9);
}
}
  return;
}
// FUNCTION ORDER ID 7 END


// FUNCTION ORDER ID 8 START
// INSERT COMMENT FUNCTION: bpnn_zero_weights
void bpnn_zero_weights(float** w, uint32_t m, uint32_t n) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: bpnn_zero_weights::for.cond
for(int64_t i = 0; i <= m;   i = i + 1) {
for(int64_t j = 0; j <= n;   j = j + 1) {
  w[i][j] = 0;
}
}
  return;
}
// FUNCTION ORDER ID 8 END


// FUNCTION ORDER ID 9 START
// INSERT COMMENT FUNCTION: bpnn_randomize_row
void bpnn_randomize_row(float* w, uint32_t m) {
  int64_t i;

// INSERT COMMENT LOOP: bpnn_randomize_row::for.cond
for(int64_t i = 0; i <= m;   i = i + 1) {
  w[i] = 0.100000001;
}
  return;
}
// FUNCTION ORDER ID 9 END


// FUNCTION ORDER ID 10 START
// INSERT COMMENT FUNCTION: bpnn_layerforward
void bpnn_layerforward(float* l1, float* l2, float** conn, uint32_t n1, uint32_t n2) {
  int64_t j;
  int64_t k;
  float sum;

  l1[0] = 1;
// INSERT COMMENT LOOP: bpnn_layerforward::for.cond
for(int64_t j = 1; j <= n2;   j = j + 1) {
  sum = 0;
for(int64_t k = 0; k <= n1;   k = k + 1) {
  sum = sum + conn[k][j] * l1[k];
}
  float __FIXME__call = squash(sum);
  l2[j] = __FIXME__call;
}
  return;
}
// FUNCTION ORDER ID 10 END


// FUNCTION ORDER ID 11 START
// INSERT COMMENT FUNCTION: bpnn_output_error
void bpnn_output_error(float* delta, float* target, float* output, uint32_t nj, float* err) {
  int64_t j;
  float errsum;
  float __FIXME__cond;

  errsum = 0;
// INSERT COMMENT LOOP: bpnn_output_error::for.cond
for(int64_t j = 1; j <= nj;   j = j + 1) {
  delta[j] = output[j] * (1 - output[j]) * (target[j] - output[j]);
  if (llvm_fcmp_ogt(delta[j], 0)) { // IFELSE MARKER: for.body IF
  __FIXME__cond = delta[j];
  errsum = errsum + __FIXME__cond;
  } else { // IFELSE MARKER: for.body ELSE
  __FIXME__cond = -delta[j];
  errsum = errsum + __FIXME__cond;
  }
}
  *err = errsum;
}
// FUNCTION ORDER ID 11 END


// FUNCTION ORDER ID 12 START
// INSERT COMMENT FUNCTION: bpnn_hidden_error
void bpnn_hidden_error(float* delta_h, uint32_t nh, float* delta_o, uint32_t no, float** who, float* hidden, float* err) {
  int64_t j;
  float errsum;
  int64_t k;
  float sum;
  float __FIXME__cond;

  errsum = 0;
// INSERT COMMENT LOOP: bpnn_hidden_error::for.cond
for(int64_t j = 1; j <= nh;   j = j + 1) {
  sum = 0;
for(int64_t k = 1; k <= no;   k = k + 1) {
  sum = sum + delta_o[k] * who[j][k];
}
  delta_h[j] = hidden[j] * (1 - hidden[j]) * sum;
  if (llvm_fcmp_ogt(delta_h[j], 0)) { // IFELSE MARKER: for.end IF
  __FIXME__cond = delta_h[j];
  errsum = errsum + __FIXME__cond;
  } else { // IFELSE MARKER: for.end ELSE
  __FIXME__cond = -delta_h[j];
  errsum = errsum + __FIXME__cond;
  }
}
  *err = errsum;
}
// FUNCTION ORDER ID 12 END


// FUNCTION ORDER ID 13 START
// INSERT COMMENT FUNCTION: bpnn_adjust_weights
void bpnn_adjust_weights(float* delta, uint32_t ndelta, float* ly, uint32_t nly, float** w, float** oldw) {
  int64_t j;
  int64_t k;

  ly[0] = 1;
// INSERT COMMENT LOOP: bpnn_adjust_weights::for.cond
for(int64_t j = 1; j <= ndelta;   j = j + 1) {
for(int64_t k = 0; k <= nly;   k = k + 1) {
  w[k][j] = w[k][j] + ((float)(((0.29999999999999999 * ((double)delta[j])) * ((double)ly[k])) + (0.29999999999999999 * ((double)oldw[k][j]))));
  oldw[k][j] = ((float)(((0.29999999999999999 * ((double)delta[j])) * ((double)ly[k])) + (0.29999999999999999 * ((double)oldw[k][j]))));
}
}
  return;
}
// FUNCTION ORDER ID 13 END


// FUNCTION ORDER ID 14 START
// INSERT COMMENT FUNCTION: setup
uint32_t setup(uint32_t argc, uint8_t** argv) {
  int32_t __FIXME__call1;
  uint32_t __FIXME__retval_2e_0;

// INSERT COMMENT IFELSE: setup::entry
  if (argc != 2) { // IFELSE MARKER: entry IF
  fprintf(stderr, (_OC_str_OC_5));
  __FIXME__retval_2e_0 = 1;
  }
// INSERT COMMENT IFELSE: setup::if.end
  __FIXME__call1 = atoi(argv[1]);
  layer_size = __FIXME__call1;
  if ((int)layer_size % (int)16 != 0) { // IFELSE MARKER: if.end IF
  fprintf(stderr, (_OC_str_OC_6));
  __FIXME__retval_2e_0 = 1;
  }
bpnn_initialize(7);
backprop_face();
  __FIXME__retval_2e_0 = 0;
  return __FIXME__retval_2e_0;
}
// FUNCTION ORDER ID 14 END


// FUNCTION ORDER ID 15 START
// INSERT COMMENT FUNCTION: backprop_face
void backprop_face(void) {
  float out_err;    /* Address-exposed local */
  float hid_err;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_BPNN* net;

  net = bpnn_create(layer_size, 16, 1);
  out_err = 0;
  hid_err = 0;
  printf((_OC_str_OC_12), layer_size);
load(net);
  printf((_OC_str_OC_13));
bpnn_train_cuda(net, (&out_err), (&hid_err));
bpnn_free(net);
  printf((_OC_str_OC_14));
}
// FUNCTION ORDER ID 15 END


// FUNCTION ORDER ID 16 START
// INSERT COMMENT FUNCTION: load
void load(struct __FIXME__l_struct_struct_OC_BPNN* net) {
  int64_t k;
  int32_t i;

// INSERT COMMENT LOOP: load::for.cond
for(int32_t i = 0; i < layer_size;   i = i + 1) {
  uint32_t __FIXME__call = rand();
  net->__FIXME__l_struct_struct_OC_BPNN_field3[i] = ((float)(__FIXME__call) / 2.14748365E+9);
}
  return;
}
// FUNCTION ORDER ID 16 END


// FUNCTION ORDER ID 17 START
// INSERT COMMENT FUNCTION: bpnn_train_cuda
void bpnn_train_cuda(struct __FIXME__l_struct_struct_OC_BPNN* net, float* eo, float* eh) {
  float out_err;    /* Address-exposed local */
  float hid_err;    /* Address-exposed local */
  float* input_hidden_cuda;    /* Address-exposed local */
  float* input_cuda;    /* Address-exposed local */
  float* output_hidden_cuda;    /* Address-exposed local */
  float* hidden_partial_sum;    /* Address-exposed local */
  float* hidden_delta_cuda;    /* Address-exposed local */
  float* input_prev_weights_cuda;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 threads;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp64;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp64_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp144;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp145;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp144_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp145_2e_coerce;    /* Address-exposed local */
  uint8_t* input_weights_one_dim;
  uint8_t* input_weights_prev_one_dim;
  uint8_t* partial_sum;
  int64_t k;
  int64_t m;
  int64_t j;
  uint32_t i;
  int32_t error;
  uint8_t* __FIXME__call70;
  float sum;

// INSERT COMMENT IFELSE: bpnn_train_cuda::entry
  num_blocks = net->__FIXME__l_struct_struct_OC_BPNN_field0 / 16;
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = 1;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = num_blocks;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  threads.__FIXME__l_struct_struct_OC_dim3_field0 = 16;
  threads.__FIXME__l_struct_struct_OC_dim3_field1 = 16;
  threads.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  input_weights_one_dim = malloc((net->__FIXME__l_struct_struct_OC_BPNN_field0 + 1) * (net->__FIXME__l_struct_struct_OC_BPNN_field1 + 1) * 4);
  input_weights_prev_one_dim = malloc((net->__FIXME__l_struct_struct_OC_BPNN_field0 + 1) * (net->__FIXME__l_struct_struct_OC_BPNN_field1 + 1) * 4);
  partial_sum = malloc(num_blocks * 16 * 4);
  if (((float*)input_weights_one_dim) == ((float*)0)) { // IFELSE MARKER: entry IF
  fprintf(stderr, (_OC_str_OC_7));
exit(1);
  }
// INSERT COMMENT IFELSE: bpnn_train_cuda::lor.lhs.false
  if (((float*)input_weights_prev_one_dim) == ((float*)0)) { // IFELSE MARKER: lor.lhs.false IF
  fprintf(stderr, (_OC_str_OC_7));
exit(1);
  }
// INSERT COMMENT IFELSE: bpnn_train_cuda::lor.lhs.false14
  if (((float*)partial_sum) == ((float*)0)) { // IFELSE MARKER: lor.lhs.false14 IF
  fprintf(stderr, (_OC_str_OC_7));
exit(1);
  }
  m = 0;
// INSERT COMMENT LOOP: bpnn_train_cuda::for.cond
for(int64_t k = 0; k <= net->__FIXME__l_struct_struct_OC_BPNN_field0;   k = k + 1) {
for(int64_t j = 0; j <= net->__FIXME__l_struct_struct_OC_BPNN_field1;   j = j + 1) {
  ((float*)input_weights_one_dim)[m] = net->__FIXME__l_struct_struct_OC_BPNN_field9[k][j];
  ((float*)input_weights_prev_one_dim)[m] = net->__FIXME__l_struct_struct_OC_BPNN_field11[k][j];
}
}
  cudaMalloc(((uint8_t**)(&input_cuda)), (net->__FIXME__l_struct_struct_OC_BPNN_field0 + 1) * 4);
  cudaMalloc(((uint8_t**)(&output_hidden_cuda)), (net->__FIXME__l_struct_struct_OC_BPNN_field1 + 1) * 4);
  cudaMalloc(((uint8_t**)(&input_hidden_cuda)), (net->__FIXME__l_struct_struct_OC_BPNN_field0 + 1) * (net->__FIXME__l_struct_struct_OC_BPNN_field1 + 1) * 4);
  cudaMalloc(((uint8_t**)(&hidden_partial_sum)), num_blocks * 16 * 4);
  printf((_OC_str_OC_8));
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp64)), ((uint8_t*)(&threads)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp64_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp64)), 12);
// INSERT COMMENT LOOP: bpnn_train_cuda::header.0
for(int32_t i = 0; i < num_blocks;   i = i + 1) {
for(int32_t j = 0; j < 16;   j = j + 1) {
for(int32_t k = 0; k < 16;   k = k + 1) {
bpnn_layerforward_CUDA0(net->__FIXME__l_struct_struct_OC_BPNN_field3, output_hidden_cuda, ((float*)input_weights_one_dim), ((float*)partial_sum), net->__FIXME__l_struct_struct_OC_BPNN_field0, net->__FIXME__l_struct_struct_OC_BPNN_field1, 1, num_blocks, 1, 16, 16, 1, 0, i, 0, j, k, 0);
}
for(int32_t k = 0; k < 16;   k = k + 1) {
bpnn_layerforward_CUDA1(net->__FIXME__l_struct_struct_OC_BPNN_field3, output_hidden_cuda, ((float*)input_weights_one_dim), ((float*)partial_sum), net->__FIXME__l_struct_struct_OC_BPNN_field0, net->__FIXME__l_struct_struct_OC_BPNN_field1, 1, num_blocks, 1, 16, 16, 1, 0, i, 0, j, k, 0);
}
for(int32_t k = 0; k < 16;   k = k + 1) {
bpnn_layerforward_CUDA2(net->__FIXME__l_struct_struct_OC_BPNN_field3, output_hidden_cuda, ((float*)input_weights_one_dim), ((float*)partial_sum), net->__FIXME__l_struct_struct_OC_BPNN_field0, net->__FIXME__l_struct_struct_OC_BPNN_field1, 1, num_blocks, 1, 16, 16, 1, 0, i, 0, j, k, 0);
}
for(int32_t k = 0; k < 16;   k = k + 1) {
bpnn_layerforward_CUDA3(net->__FIXME__l_struct_struct_OC_BPNN_field3, output_hidden_cuda, ((float*)input_weights_one_dim), ((float*)partial_sum), net->__FIXME__l_struct_struct_OC_BPNN_field0, net->__FIXME__l_struct_struct_OC_BPNN_field1, 1, num_blocks, 1, 16, 16, 1, 0, i, 0, j, k, 0);
}
}
}
// INSERT COMMENT IFELSE: bpnn_train_cuda::kcall.end
  cudaThreadSynchronize();
  error = cudaGetLastError();
  if (error != 0) { // IFELSE MARKER: kcall.end IF
  __FIXME__call70 = cudaGetErrorString(error);
  printf((_OC_str_OC_9), __FIXME__call70);
exit(1);
  }
// INSERT COMMENT LOOP: bpnn_train_cuda::for.cond78
for(int64_t j = 1; j <= net->__FIXME__l_struct_struct_OC_BPNN_field1;   j = j + 1) {
  sum = 0;
for(int64_t k = 0; k < num_blocks;   k = k + 1) {
  sum = sum + ((float*)partial_sum)[((k * net->__FIXME__l_struct_struct_OC_BPNN_field1 + j) - 1)];
}
  float __FIXME__call99 = expf(-sum + net->__FIXME__l_struct_struct_OC_BPNN_field9[0][j]);
  net->__FIXME__l_struct_struct_OC_BPNN_field4[j] = ((float)(1 / (1 + ((double)__FIXME__call99))));
}
bpnn_layerforward(net->__FIXME__l_struct_struct_OC_BPNN_field4, net->__FIXME__l_struct_struct_OC_BPNN_field5, net->__FIXME__l_struct_struct_OC_BPNN_field10, net->__FIXME__l_struct_struct_OC_BPNN_field1, net->__FIXME__l_struct_struct_OC_BPNN_field2);
bpnn_output_error(net->__FIXME__l_struct_struct_OC_BPNN_field7, net->__FIXME__l_struct_struct_OC_BPNN_field8, net->__FIXME__l_struct_struct_OC_BPNN_field5, net->__FIXME__l_struct_struct_OC_BPNN_field2, (&out_err));
bpnn_hidden_error(net->__FIXME__l_struct_struct_OC_BPNN_field6, net->__FIXME__l_struct_struct_OC_BPNN_field1, net->__FIXME__l_struct_struct_OC_BPNN_field7, net->__FIXME__l_struct_struct_OC_BPNN_field2, net->__FIXME__l_struct_struct_OC_BPNN_field10, net->__FIXME__l_struct_struct_OC_BPNN_field4, (&hid_err));
bpnn_adjust_weights(net->__FIXME__l_struct_struct_OC_BPNN_field7, net->__FIXME__l_struct_struct_OC_BPNN_field2, net->__FIXME__l_struct_struct_OC_BPNN_field4, net->__FIXME__l_struct_struct_OC_BPNN_field1, net->__FIXME__l_struct_struct_OC_BPNN_field10, net->__FIXME__l_struct_struct_OC_BPNN_field12);
  cudaMalloc(((uint8_t**)(&hidden_delta_cuda)), (net->__FIXME__l_struct_struct_OC_BPNN_field1 + 1) * 4);
  cudaMalloc(((uint8_t**)(&input_prev_weights_cuda)), (net->__FIXME__l_struct_struct_OC_BPNN_field0 + 1) * (net->__FIXME__l_struct_struct_OC_BPNN_field1 + 1) * 4);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp144)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp145)), ((uint8_t*)(&threads)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp144_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp144)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp145_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp145)), 12);
// INSERT COMMENT LOOP: bpnn_train_cuda::header.011
for(int32_t i = 0; i < num_blocks;   i = i + 1) {
for(int32_t j = 0; j < 16;   j = j + 1) {
for(int32_t k = 0; k < 16;   k = k + 1) {
bpnn_adjust_weights_cuda0(net->__FIXME__l_struct_struct_OC_BPNN_field6, net->__FIXME__l_struct_struct_OC_BPNN_field1, net->__FIXME__l_struct_struct_OC_BPNN_field3, net->__FIXME__l_struct_struct_OC_BPNN_field0, ((float*)input_weights_one_dim), ((float*)input_weights_prev_one_dim), 1, num_blocks, 1, 16, 16, 1, 0, i, 0, j, k, 0);
}
for(int32_t k = 0; k < 16;   k = k + 1) {
bpnn_adjust_weights_cuda1(net->__FIXME__l_struct_struct_OC_BPNN_field6, net->__FIXME__l_struct_struct_OC_BPNN_field1, net->__FIXME__l_struct_struct_OC_BPNN_field3, net->__FIXME__l_struct_struct_OC_BPNN_field0, ((float*)input_weights_one_dim), ((float*)input_weights_prev_one_dim), 1, num_blocks, 1, 16, 16, 1, 0, i, 0, j, k, 0);
}
}
}
free(((uint8_t*)((float*)partial_sum)));
free(((uint8_t*)((float*)input_weights_one_dim)));
free(((uint8_t*)((float*)input_weights_prev_one_dim)));
}
// FUNCTION ORDER ID 17 END


// MAIN START
int main(int argc, char ** argv) {
  int32_t __FIXME__call;

  __FIXME__call = setup(argc, argv);
  return __FIXME__call;
}
// MAIN END


// FUNCTION ORDER ID 18 START
// INSERT COMMENT FUNCTION: bpnn_layerforward_CUDA0
void bpnn_layerforward_CUDA0(float* input_cuda, float* output_hidden_cuda, float* input_hidden_cuda, float* hidden_partial_sum, uint32_t in, uint32_t hid, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t by, uint32_t __FIXME__blockIdx_2e_z, uint32_t tx, uint32_t ty, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t index_in;

// INSERT COMMENT IFELSE: bpnn_layerforward_CUDA0::entry
  index_in = 16 * by + ty + 1;
  if (tx == 0) { // IFELSE MARKER: entry IF
  input_node_shared[ty] = input_cuda[index_in];
  }
  return;
}
// FUNCTION ORDER ID 18 END


// FUNCTION ORDER ID 19 START
// INSERT COMMENT FUNCTION: bpnn_adjust_weights_cuda0
void bpnn_adjust_weights_cuda0(float* delta, uint32_t hid, float* ly, uint32_t in, float* w, float* oldw, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t by, uint32_t __FIXME__blockIdx_2e_z, uint32_t tx, uint32_t ty, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t index;
  int64_t index_y;
  int64_t index_x;

  index = (hid + 1) * 16 * by + (hid + 1) * ty + tx + 1 + hid + 1;
  index_y = 16 * by + ty + 1;
  index_x = tx + 1;
  w[index] = ((float)(((double)w[index]) + (((0.29999999999999999 * ((double)delta[index_x])) * ((double)ly[index_y])) + (0.29999999999999999 * ((double)oldw[index])))));
  oldw[index] = ((float)(((0.29999999999999999 * ((double)delta[index_x])) * ((double)ly[index_y])) + (0.29999999999999999 * ((double)oldw[index]))));
}
// FUNCTION ORDER ID 19 END


// FUNCTION ORDER ID 20 START
// INSERT COMMENT FUNCTION: bpnn_layerforward_CUDA3
void bpnn_layerforward_CUDA3(float* input_cuda, float* output_hidden_cuda, float* input_hidden_cuda, float* hidden_partial_sum, uint32_t in, uint32_t hid, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t by, uint32_t __FIXME__blockIdx_2e_z, uint32_t tx, uint32_t ty, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t index;
  int64_t row;

  index = (hid + 1) * 16 * by + (hid + 1) * ty + tx + 1 + hid + 1;
// INSERT COMMENT IFELSE: bpnn_layerforward_CUDA3::syncpoint.3
  /*__FIXME__INTRINSIC_CALL__*///sync point
;
  if (ty == 0) { // IFELSE MARKER: syncpoint.3 IF
for(int64_t row = 1; row < 16;   row = row + 1) {
  weight_matrix_shared[0][tx] = weight_matrix_shared[0][tx] + weight_matrix_shared[row][tx];
}
  }
// INSERT COMMENT IFELSE: bpnn_layerforward_CUDA3::if.end45
  input_hidden_cuda[index] = weight_matrix_shared[ty][tx];
  if (tx == 0) { // IFELSE MARKER: if.end45 IF
  hidden_partial_sum[(by * hid + ty)] = weight_matrix_shared[tx][ty];
  }
  return;
}
// FUNCTION ORDER ID 20 END


// FUNCTION ORDER ID 21 START
// INSERT COMMENT FUNCTION: bpnn_layerforward_CUDA2
void bpnn_layerforward_CUDA2(float* input_cuda, float* output_hidden_cuda, float* input_hidden_cuda, float* hidden_partial_sum, uint32_t in, uint32_t hid, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t by, uint32_t __FIXME__blockIdx_2e_z, uint32_t tx, uint32_t ty, uint32_t __FIXME__threadIdx_2e_z) {
/*__FIXME__INTRINSIC_CALL__*///sync point
  weight_matrix_shared[ty][tx] = weight_matrix_shared[ty][tx] * input_node_shared[ty];
}
// FUNCTION ORDER ID 21 END


// FUNCTION ORDER ID 22 START
// INSERT COMMENT FUNCTION: bpnn_layerforward_CUDA1
void bpnn_layerforward_CUDA1(float* input_cuda, float* output_hidden_cuda, float* input_hidden_cuda, float* hidden_partial_sum, uint32_t in, uint32_t hid, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t by, uint32_t __FIXME__blockIdx_2e_z, uint32_t tx, uint32_t ty, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t index;

  index = (hid + 1) * 16 * by + (hid + 1) * ty + tx + 1 + hid + 1;
/*__FIXME__INTRINSIC_CALL__*///sync point
  weight_matrix_shared[ty][tx] = input_hidden_cuda[index];
}
// FUNCTION ORDER ID 22 END


// FUNCTION ORDER ID 23 START
// INSERT COMMENT FUNCTION: bpnn_adjust_weights_cuda1
void bpnn_adjust_weights_cuda1(float* delta, uint32_t hid, float* ly, uint32_t in, float* w, float* oldw, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t by, uint32_t __FIXME__blockIdx_2e_z, uint32_t tx, uint32_t ty, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t index;
  int64_t index_y;
  int64_t index_x;

  index = (hid + 1) * 16 * by + (hid + 1) * ty + tx + 1 + hid + 1;
  index_y = 16 * by + ty + 1;
  index_x = tx + 1;
  w[index] = ((float)(((double)w[index]) + (((0.29999999999999999 * ((double)delta[index_x])) * ((double)ly[index_y])) + (0.29999999999999999 * ((double)oldw[index])))));
  oldw[index] = ((float)(((0.29999999999999999 * ((double)delta[index_x])) * ((double)ly[index_y])) + (0.29999999999999999 * ((double)oldw[index]))));
// INSERT COMMENT IFELSE: bpnn_adjust_weights_cuda1::syncpoint.1
  /*__FIXME__INTRINSIC_CALL__*///sync point
;
  if (ty == 0) { // IFELSE MARKER: syncpoint.1 IF
  }
// INSERT COMMENT IFELSE: bpnn_adjust_weights_cuda1::land.lhs.true
  if (by == 0) { // IFELSE MARKER: land.lhs.true IF
  w[index_x] = ((float)(((double)w[index_x]) + ((0.29999999999999999 * ((double)delta[index_x])) + (0.29999999999999999 * ((double)oldw[index_x])))));
  oldw[index_x] = ((float)((0.29999999999999999 * ((double)delta[index_x])) + (0.29999999999999999 * ((double)oldw[index_x]))));
  }
  return;
}
// FUNCTION ORDER ID 23 END

