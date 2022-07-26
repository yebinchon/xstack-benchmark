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
struct l_struct_struct_OC_ident_t;
struct l_struct_struct_OC__IO_FILE;

/* Function definitions */
typedef void l_fptr_1(uint32_t*, uint32_t*, ...);


/* Types Definitions */
struct l_struct_struct_OC_ident_t {
  uint32_t field0;
  uint32_t field1;
  uint32_t field2;
  uint32_t field3;
  uint8_t* field4;
};
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

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((nothrow));
static void kernel_gemver_polly_subfn(uint64_t, uint64_t, uint64_t, uint8_t*);
static void kernel_gemver_polly_subfn_4(uint64_t, uint64_t, uint64_t, uint8_t*);
static void kernel_gemver_polly_subfn_7(uint64_t, uint64_t, uint64_t, uint8_t*);
static void kernel_gemver_polly_subfn_10(uint64_t, uint64_t, uint64_t, uint8_t*);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static uint8_t _OC_str[8] = { "%0.2lf " };
static uint8_t _OC_str_OC_ident_OC_8[23] = { "Source location dummy." };
static uint8_t _OC_str_OC_ident_OC_5[23] = { "Source location dummy." };
static uint8_t _OC_str_OC_ident_OC_2[23] = { "Source location dummy." };
static uint8_t _OC_str_OC_ident[23] = { "Source location dummy." };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy = { 0, 0, 0, 0, (_OC_str_OC_ident) };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy_OC_3 = { 0, 0, 0, 0, (_OC_str_OC_ident_OC_2) };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy_OC_6 = { 0, 0, 0, 0, (_OC_str_OC_ident_OC_5) };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy_OC_9 = { 0, 0, 0, 0, (_OC_str_OC_ident_OC_8) };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
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
static __forceinline uint32_t llvm_urem_u32(uint32_t a, uint32_t b) {
  uint32_t r = a % b;
  return r;
}
static __forceinline uint64_t llvm_ashr_u64(int64_t a, int64_t b) {
  uint64_t r = a >> b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t n = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t dump_code = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* A = malloc((n << 3) * n);
  uint8_t* u1 = malloc((n << 32) >> 29);
  uint8_t* v1 = malloc((n << 32) >> 29);
  uint8_t* u2 = malloc((n << 32) >> 29);
  uint8_t* v2 = malloc((n << 32) >> 29);
  uint8_t* w = malloc((n << 32) >> 29);
  uint8_t* x = malloc((n << 32) >> 29);
  uint8_t* y = malloc((n << 32) >> 29);
  uint8_t* z = malloc((n << 32) >> 29);
  memset(x, 0, (n << 3));
  memset(w, 0, (n << 3));
#pragma omp parallel for
for(uint64_t i = 0; i < n;  i = i + 1){
  ((double*)u1)[i] = (double)(i);
  ((double*)u2)[i] = (double)((i + 1) / n) * 0.5;
  ((double*)v1)[i] = (double)((i + 1) / n) * 0.25;
  ((double*)v2)[i] = (double)((i + 1) / n) / 6;
  ((double*)y)[i] = (double)((i + 1) / n) * 0.125;
  ((double*)z)[i] = (double)((i + 1) / n) / 9;
for(uint64_t j = 0; j < n;  j = j + 1){
  (((double*)A)+i * n)[j] = (double)(i) * (double)(j) / (double)(n);
}
}
  #pragma omp parallel 
{

#pragma omp for
for(uint64_t i = 0; i<=(n - 1);i+=1){
for(uint64_t j = 0; j < n;  j = j + 1){
  (((double*)A)+i * n)[j] = (((((double*)A)+i * n)[j] + ((double*)u1)[i] * ((double*)v1)[j]) + ((double*)u2)[i] * ((double*)v2)[j]);
}
}
}
  #pragma omp parallel 
{

#pragma omp for
for(uint64_t i = 0; i<=(n - 1);i+=1){
  double __p_scalar_ = ((double*)x)[i];
for(uint64_t j = 0; j < n;  j = j + 1){
  __p_scalar_ = (__p_scalar_ + 12313 * (((double*)A)+i)[j * n] * ((double*)y)[j]);
  ((double*)x)[i] = __p_scalar_;
}
}
}
  #pragma omp parallel 
{

#pragma omp for
for(uint64_t i = 0; i<=(n - 1);i+=1){
  ((double*)x)[i] = (((double*)x)[i] + ((double*)z)[i]);
}
}
  #pragma omp parallel 
{

#pragma omp for
for(uint64_t i = 0; i<=(n - 1);i+=1){
  double __p_scalar_ = ((double*)w)[i];
for(uint64_t j = 0; j < n;  j = j + 1){
  __p_scalar_ = (__p_scalar_ + 43532 * (((double*)A)+i * n)[j] * ((double*)x)[j]);
  ((double*)w)[i] = __p_scalar_;
}
}
}
  if (dump_code != 1 | ~(n > 0)) {
free(A);
free(u1);
free(v1);
free(u2);
free(v2);
free(w);
free(x);
free(y);
free(z);
  return 0;
}
for(uint64_t i = 0; i < n;  i = i + 1){
  fprintf(stderr, (_OC_str), ((double*)w)[i]);
  if (i % 20 == 0) {
  fputc(10, stderr);
}

}
free(A);
free(u1);
free(v1);
free(u2);
free(v2);
free(w);
free(x);
free(y);
free(z);
  return 0;

free(A);
free(u1);
free(v1);
free(u2);
free(v2);
free(w);
free(x);
free(y);
free(z);
  return 0;
}

