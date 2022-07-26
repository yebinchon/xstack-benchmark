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
struct l_struct_struct_OC_ident_t;

/* Function definitions */
typedef void l_fptr_1(uint32_t*, uint32_t*, ...);


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
struct l_struct_struct_OC_ident_t {
  uint32_t field0;
  uint32_t field1;
  uint32_t field2;
  uint32_t field3;
  uint8_t* field4;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((nothrow));
static void main_polly_subfn(uint64_t, uint64_t, uint64_t, uint8_t*);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static uint8_t _OC_str[8] = { "%0.2lf " };
static uint8_t _OC_str_OC_ident[23] = { "Source location dummy." };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy = { 0, 0, 0, 0, (_OC_str_OC_ident) };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
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
  uint64_t nx = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t ny = strtol(_argv[3], ((uint8_t**)0), 10);
  uint64_t dump_code = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* A = malloc(ny * (nx << 32) >> 29);
  uint8_t* x = malloc((ny << 32) >> 29);
  uint8_t* y = malloc((nx << 32) >> 29);
#pragma omp parallel for
for(uint64_t i = 0; i < ny;  i = i + 1){
  ((double*)x)[i] = (double)(i) * 3.1415926535897931;
}
  #pragma omp parallel 
{

#pragma omp for
for(uint64_t i = 0; i<=(nx - 1);i+=1){
for(uint64_t j = 0; j < ny;  j = j + 1){
  *((double*)((A+(ny << 3) * i)+(j << 3))) = (double)(i) * (double)((j + 1)) / (double)(nx);
}
}
}
  memset(y, 0, (nx << 3));
#pragma omp parallel for
for(uint64_t i = 0; i < ny;  i = i + 1){
  double __2e_phiops_2e_0 = 0;
for(uint64_t j = 0; j < ny;  j = j + 1){
  __2e_phiops_2e_0 = (__2e_phiops_2e_0 + *((double*)((A+(ny << 3) * i)+(j << 3))) * *((double*)(x+(j << 3))));
}
#pragma omp critical
for(uint64_t j = 0; j < ny;  j = j + 1){
  *((double*)(y+(j << 3))) = (*((double*)(y+(j << 3))) + __2e_phiops_2e_0 * *((double*)((A+(ny << 3) * i)+(j << 3))));
}
}
  if (dump_code == 1) {
for(uint64_t i = 0; i < nx;  i = i + 1){
  fprintf(stderr, (_OC_str), ((double*)y)[i]);
  if (i % 20 == 0) {
  fputc(10, stderr);
}

}
  fputc(10, stderr);
free(A);
free(x);
free(y);
  return 0;
}

free(A);
free(x);
free(y);
  return 0;
}

