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
void kernel_jacobi_1d_imper(uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((nothrow));
static void kernel_jacobi_1d_imper_polly_subfn(uint64_t, uint64_t, uint64_t, uint8_t*);
static void kernel_jacobi_1d_imper_polly_subfn_4(uint64_t, uint64_t, uint64_t, uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((nothrow));


/* Global Variable Definitions and Initialization */
static uint8_t _OC_str_OC_ident_OC_2[23] = { "Source location dummy." };
static uint8_t _OC_str_OC_ident[23] = { "Source location dummy." };
static uint8_t _OC_str[8] = { "%0.2lf " };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy = { 0, 0, 0, 0, (_OC_str_OC_ident) };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy_OC_3 = { 0, 0, 0, 0, (_OC_str_OC_ident_OC_2) };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_urem_u32(uint32_t a, uint32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

void kernel_jacobi_1d_imper(uint32_t _tsteps, uint32_t _n, double* _A, double* _B) {
for(uint64_t i = 0; i < _tsteps;   i = i + 1){
//START OUTLINED
  #pragma omp parallel 
{
uint64_t _2 = _n + -2;

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=(_2 - 1); j = j + 1){
  _B[j+1] = ((_A[j] + _A[j+1]) + _A[j+2]) * 0.33333000000000002;
}
}
//END OUTLINED
//START OUTLINED
  #pragma omp parallel 
{
uint64_t _2 = _n + -2;

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=(_2 - 1); j = j + 1){
  *((uint64_t*)((_A+1)+j)) = *((uint64_t*)((_B+1)+j));
}
}
//END OUTLINED
}
  return;
}


int main(int argc, char ** argv) {
  uint64_t dump_code = strtol(argv[1], ((uint8_t**)0), 10);
  double* A = malloc(800000000);
  double* B = malloc(800000000);
#pragma omp parallel for
for(uint64_t i = 0; i < 100000000;   i = i + 1){
  ((double*)A)[i] = ((double)(i) + 2) / 1.0E+8;
  ((double*)B)[i] = ((double)(i) + 3) / 1.0E+8;
}
for(uint64_t i = 0; i < 100;   i = i + 1){
//START OUTLINED
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=99999997; j = j + 1){
  B[j+1] = ((A[j] + A[j+1]) + A[j+2]) * 0.33333000000000002;
}
}
//END OUTLINED
//START OUTLINED
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=99999997; j = j + 1){
  *((uint64_t*)((((double*)A)+1)+j)) = *((uint64_t*)((((double*)B)+1)+j));
}
}
//END OUTLINED
}
  if (dump_code == 1) {
for(uint64_t i = 0; i < 100000000;   i = i + 1){
  fprintf(stderr, (_OC_str), ((double*)A)[i]);
  if (i % 20 == 0) {
  fputc(10, stderr);
}

}
  fputc(10, stderr);
}

free(A);
free(B);
  return 0;
}

