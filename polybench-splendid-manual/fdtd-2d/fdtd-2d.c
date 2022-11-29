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
static void main_polly_subfn_4(uint64_t, uint64_t, uint64_t, uint8_t*);


/* Global Variable Definitions and Initialization */
static uint8_t _OC_str[8] = { "%0.2lf " };
static uint8_t _OC_str_OC_ident_OC_2[23] = { "Source location dummy." };
static uint8_t _OC_str_OC_ident[23] = { "Source location dummy." };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy = { 0, 0, 0, 0, (_OC_str_OC_ident) };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy_OC_3 = { 0, 0, 0, 0, (_OC_str_OC_ident_OC_2) };


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


/* Function Bodies */

int main(int argc, char ** argv) {
  uint64_t _call_2e_i = strtol(argv[1], ((uint8_t**)0), 10);
  uint8_t* ex = malloc(128000000);
  uint8_t* ey = malloc(128000000);
  uint8_t* hz = malloc(128000000);
  uint8_t* _fict_ = malloc(32000);
#pragma omp parallel for
for(uint64_t i = 0; i < 4000;   i = i + 1){
  *((double*)(_fict_+(i << 3))) = (double)(i);
}
//START OUTLINED
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=3999; i = i + 1){
for(uint64_t j = 0; j < (3999 + 1);   j = j + 1){
  *((double*)((ex+i * 32000)+(j << 3))) = (double)(i) * (double)((j + 1)) / 4000;
  *((double*)((ey+i * 32000)+(j << 3))) = (double)(i) * (double)((j + 2)) / 4000;
  *((double*)((hz+i * 32000)+(j << 3))) = (double)(i) * (double)((j + 3)) / 4000;
}
}
}
//END OUTLINED
for(uint64_t i = 0; i < 100;   i = i + 1){
#pragma omp parallel for
for(uint64_t j = 0; j < 4000;   j = j + 1){
  *((uint64_t*)(ey+(j << 3))) = *((uint64_t*)(_fict_+(i << 3)));
}
//START OUTLINED
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=3998; j = j + 1){
for(uint64_t k = 0; k < (3999 + 1);   k = k + 1){
  *((double*)(((ey+32000)+j * 32000)+(k << 3))) = (*((double*)(((ey+32000)+j * 32000)+(k << 3))) - (*((double*)(((hz+32000)+j * 32000)+(k << 3))) - *((double*)((hz+j * 32000)+(k << 3)))) * 0.5);
}
}
}
//END OUTLINED
#pragma omp parallel for
for(uint64_t j = 0; j < 4000;   j = j + 1){
  double __2e_phiops_2e_0 = *((double*)(hz+j * 32000));
for(uint64_t k = 0; k < 3999;   k = k + 1){
  *((double*)(((ex+8)+j * 32000)+(k << 3))) = (*((double*)(((ex+8)+j * 32000)+(k << 3))) - (*((double*)(((hz+8)+j * 32000)+(k << 3))) - __2e_phiops_2e_0) * 0.5);
  __2e_phiops_2e_0 = *((double*)(((hz+8)+j * 32000)+(k << 3)));
}
}
#pragma omp parallel for
for(uint64_t j = 0; j < 3999;   j = j + 1){
  double __2e_phiops135_2e_0 = *((double*)(ex+j * 32000));
for(uint64_t k = 0; k < 3999;   k = k + 1){
  *((double*)((hz+j * 32000)+(k << 3))) = (*((double*)((hz+j * 32000)+(k << 3))) - (((*((double*)(((ex+8)+j * 32000)+(k << 3))) - __2e_phiops135_2e_0) + *((double*)(((ey+32000)+j * 32000)+(k << 3)))) - *((double*)((ey+j * 32000)+(k << 3)))) * 0.69999999999999996);
  __2e_phiops135_2e_0 = *((double*)(((ex+8)+j * 32000)+(k << 3)));
}
}
}
  if (_call_2e_i == 1) {
for(uint64_t i = 0; i < 4000;   i = i + 1){
for(uint64_t j = 0; j < 4000;   j = j + 1){
  fprintf(stderr, (_OC_str), (((double*)ex)+i * 4000)[j]);
  fprintf(stderr, (_OC_str), (((double*)ey)+i * 4000)[j]);
  fprintf(stderr, (_OC_str), (((double*)hz)+i * 4000)[j]);
  if ((j + i * 4000) % 20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(ex);
free(ey);
free(hz);
free(_fict_);
  return 0;
}

