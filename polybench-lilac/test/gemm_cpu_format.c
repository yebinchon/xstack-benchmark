#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifndef __cplusplus
typedef unsigned char bool;
#endif

#ifndef _MSC_VER
#define __forceinline __attribute__((always_inline)) inline
#endif

#if defined(__GNUC__)
#define __ATTRIBUTELIST__(x) __attribute__(x)
#else
#define __ATTRIBUTELIST__(x)
#endif

#ifdef _MSC_VER /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif

/* Global Declarations */

/* Types Declarations */
struct __FIXME__l_struct_struct_OC__IO_FILE;

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
  uint8_t *__FIXME__l_struct_struct_OC__IO_FILE_field1;
  uint8_t *__FIXME__l_struct_struct_OC__IO_FILE_field2;
  uint8_t *__FIXME__l_struct_struct_OC__IO_FILE_field3;
  uint8_t *__FIXME__l_struct_struct_OC__IO_FILE_field4;
  uint8_t *__FIXME__l_struct_struct_OC__IO_FILE_field5;
  uint8_t *__FIXME__l_struct_struct_OC__IO_FILE_field6;
  uint8_t *__FIXME__l_struct_struct_OC__IO_FILE_field7;
  uint8_t *__FIXME__l_struct_struct_OC__IO_FILE_field8;
  uint8_t *__FIXME__l_struct_struct_OC__IO_FILE_field9;
  uint8_t *__FIXME__l_struct_struct_OC__IO_FILE_field10;
  uint8_t *__FIXME__l_struct_struct_OC__IO_FILE_field11;
  void *__FIXME__l_struct_struct_OC__IO_FILE_field12;
  struct __FIXME__l_struct_struct_OC__IO_FILE
      *__FIXME__l_struct_struct_OC__IO_FILE_field13;
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field14;
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field15;
  uint64_t __FIXME__l_struct_struct_OC__IO_FILE_field16;
  uint16_t __FIXME__l_struct_struct_OC__IO_FILE_field17;
  uint8_t __FIXME__l_struct_struct_OC__IO_FILE_field18;
  uint8_t __FIXME__l_struct_struct_OC__IO_FILE_field19[1];
  uint8_t *__FIXME__l_struct_struct_OC__IO_FILE_field20;
  uint64_t __FIXME__l_struct_struct_OC__IO_FILE_field21;
  void *__FIXME__l_struct_struct_OC__IO_FILE_field22;
  void *__FIXME__l_struct_struct_OC__IO_FILE_field23;
  struct __FIXME__l_struct_struct_OC__IO_FILE
      *__FIXME__l_struct_struct_OC__IO_FILE_field24;
  uint8_t *__FIXME__l_struct_struct_OC__IO_FILE_field25;
  uint64_t __FIXME__l_struct_struct_OC__IO_FILE_field26;
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field27;
  uint8_t __FIXME__l_struct_struct_OC__IO_FILE_field28[20];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline));
void _ZL10init_arrayiiiPdS_S_(uint32_t, uint32_t, uint32_t, double *, double *,
                              double *) __ATTRIBUTELIST__((noinline, nothrow));
void _ZL11print_arrayiiPd(uint32_t, uint32_t, double *)
    __ATTRIBUTELIST__((noinline));

/* Global Variable Definitions and Initialization */
uint8_t __FIXME_GLOBAL___OC_str[7] = {"%0.2lf"};
uint8_t __FIXME_GLOBAL___OC_str_OC_1[2] = {"\n"};
uint8_t __FIXME_GLOBAL___OC_str_OC_2[2] = {" "};

/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
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
static __forceinline uint32_t llvm_urem_u32(uint32_t a, uint32_t b) {
  uint32_t r = a % b;
  return r;
}

/* Function Bodies */

int main(int argc, char **argv) {
  int32_t dump_code;
  int32_t ni;
  int32_t nj;
  int32_t nk;
  uint8_t *A;
  uint8_t *B;
  uint8_t *C;

  dump_code = atoi(argv[1]);
  ni = atoi(argv[2]);
  nj = atoi(argv[3]);
  nk = atoi(argv[4]);
  A = malloc(ni * nk * 8);
  B = malloc(nk * nj * 8);
  C = malloc(ni * nj * 8);
  _ZL10init_arrayiiiPdS_S_(ni, nj, nk, ((double *)C), ((double *)A),
                           ((double *)B));
  ;
  if (dump_code == 1) {
    _ZL11print_arrayiiPd(ni, nj, ((double *)C));
  }
  free(((uint8_t *)((double *)C)));
  free(((uint8_t *)((double *)A)));
  free(((uint8_t *)((double *)B)));
  return 0;
}

void _ZL10init_arrayiiiPdS_S_(uint32_t ni, uint32_t nj, uint32_t nk, double *C,
                              double *A, double *B) {
  int64_t i;
  int64_t j;

  for (int64_t i = 0; i < ni; i = i + 1) {

    for (int64_t j = 0; j < nj; j = j + 1) {
      C[(i * nj + j)] = (((double)(i) * (double)(j)) / (double)(ni));
    }
  }

  for (int64_t i = 0; i < ni; i = i + 1) {

    for (int64_t j = 0; j < nk; j = j + 1) {
      A[(i * nk + j)] = (((double)(i) * (double)(j)) / (double)(ni));
    }
  }

  for (int64_t i = 0; i < nk; i = i + 1) {

    for (int64_t j = 0; j < nj; j = j + 1) {
      B[(i * nj + j)] = (((double)(i) * (double)(j)) / (double)(ni));
    }
  }
  return;
}

void _ZL11print_arrayiiPd(uint32_t ni, uint32_t nj, double *C) {
  int64_t j;

  for (int64_t j = 0; j < nj; j = j + 1) {
    uint32_t __FIXME__call = fprintf(stderr, (__FIXME_GLOBAL___OC_str), C[j]);
    if (j % 20 == 0) {
      if (0 == 0) {
        fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
        fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
      }
      fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
    } else {
      fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_2));
    }
  }
  return;
}
