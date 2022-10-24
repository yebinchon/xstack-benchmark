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
static void main_polly_subfn(uint64_t, uint64_t, uint64_t, uint8_t*);
static void main_polly_subfn_4(uint64_t, uint64_t, uint64_t, uint8_t*);
static void main_polly_subfn_7(uint64_t, uint64_t, uint64_t, uint8_t*);


/* Global Variable Definitions and Initialization */
static uint8_t _OC_str[7] = { "%0.2lf" };
static uint8_t _OC_str_OC_ident_OC_5[23] = { "Source location dummy." };
static uint8_t _OC_str_OC_ident_OC_2[23] = { "Source location dummy." };
static uint8_t _OC_str_OC_ident[23] = { "Source location dummy." };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy = { 0, 0, 0, 0, (_OC_str_OC_ident) };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy_OC_3 = { 0, 0, 0, 0, (_OC_str_OC_ident_OC_2) };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy_OC_6 = { 0, 0, 0, 0, (_OC_str_OC_ident_OC_5) };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint16_t llvm_urem_u16(uint16_t a, uint16_t b) {
  uint16_t r = a % b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  uint64_t _call_2e_i = strtol(argv[1], ((uint8_t**)0), 10);
  uint8_t* A = malloc(128000000);
  uint8_t* x1 = malloc(32000);
  uint8_t* x2 = malloc(32000);
  uint8_t* y_1 = malloc(32000);
  uint8_t* y_2 = malloc(32000);
//START OUTLINED
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=3999; i = i + 1){
  *((double*)(x1+(i << 3))) = (double)(i) / 4000;
  *((double*)(x2+(i << 3))) = ((double)(i) + 1) / 4000;
  *((double*)(y_1+(i << 3))) = ((double)(i) + 3) / 4000;
  *((double*)(y_2+(i << 3))) = ((double)(i) + 4) / 4000;
for(uint64_t j = 0; j < (3999 + 1);   j = j + 1){
  *((double*)((A+i * 32000)+(j << 3))) = (double)(i) * (double)(j) / 4000;
}
}
}
//END OUTLINED
//START OUTLINED
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=3999; i = i + 1){
for(uint64_t j = 0; j < (3999 + 1);   j = j + 1){
  ((double*)x1)[i] = (((double*)x1)[i] + *((double*)((A+i * 32000)+(j << 3))) * *((double*)(y_1+(j << 3))));
}
}
}
//END OUTLINED
//START OUTLINED
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=3999; i = i + 1){
for(uint64_t j = 0; j < (3999 + 1);   j = j + 1){
  ((double*)x2)[i] = (((double*)x2)[i] + *((double*)((A+(i << 3))+j * 32000)) * *((double*)(y_2+(j << 3))));
}
}
}
//END OUTLINED
  if (_call_2e_i == 1) {
for(uint64_t i = 0; i < 4000;   i = i + 1){
  fprintf(stderr, (_OC_str), ((double*)x1)[i]);
  fprintf(stderr, (_OC_str), ((double*)x2)[i]);
  if (i % 20 == ((uint16_t)0)) {
  fputc(10, stderr);
}

}
}

free(A);
free(x1);
free(x2);
free(y_1);
free(y_2);
  return 0;
}

