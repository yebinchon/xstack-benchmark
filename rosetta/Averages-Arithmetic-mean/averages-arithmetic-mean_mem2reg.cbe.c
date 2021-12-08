/* Provide Declarations */
#include <stdint.h>
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

#ifdef _MSC_VER
#define __MSALIGN__(X) __declspec(align(X))
#else
#define __MSALIGN__(X)
#endif



/* Global Declarations */

/* Types Declarations */

/* Function definitions */

/* Types Definitions */
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_5_double {
  double array[5];
};

/* External Global Variable Declarations */

/* Function Declarations */
double mean(double*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_6_uint8_t _OC_str = { "mean[" };
static struct l_array_5_uint8_t _OC_str_OC_1 = { ", %g" };
static struct l_array_3_uint8_t _OC_str_OC_2 = { "%g" };
static struct l_array_8_uint8_t _OC_str_OC_3 = { "] = %g\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint8_t* llvm_select_pu8(bool condition, uint8_t* iftrue, uint8_t* ifnot) {
  uint8_t* r;
  r = condition ? iftrue : ifnot;
  return r;
}
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

double mean(double* llvm_cbe_v, uint32_t llvm_cbe_len) {
  double sum;
  double sum__PHI_TEMPORARY;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  double _1;

  ;
  ;
  ;
  ;
  sum__PHI_TEMPORARY = 0;   /* for PHI node */
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  sum = sum__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) < ((int32_t)llvm_cbe_len)){
  _1 = *((&llvm_cbe_v[((int64_t)(((int64_t)(int32_t)i)))]));
  sum = sum + _1;
  ;

  i = llvm_add_u32(i, 1);
  ;
  sum__PHI_TEMPORARY = sum;   /* for PHI node */
  i__PHI_TEMPORARY = i;   /* for PHI node */

  sum = sum__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
}
  return (sum / (((double)(int32_t)llvm_cbe_len)));
}


int main(void) {
  __MSALIGN__(16) struct l_array_5_double llvm_cbe_v __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _2;
  uint8_t* _3;
  struct l_array_5_double* _4;
  uint32_t len;
  uint32_t len__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint64_t _5;
  double _6;
  uint32_t llvm_cbe_call4;
  double llvm_cbe_call5;
  uint32_t llvm_cbe_call6;

  ;
  _2 = ((uint8_t*)(&llvm_cbe_v));
  _3 = memset(_2, 0, 40);
  _4 = ((struct l_array_5_double*)_2);
  *((&(*_4).array[((int32_t)0)])) = 1;
  *((&(*_4).array[((int32_t)1)])) = 2;
  *((&(*_4).array[((int32_t)2)])) = 2.718;
  *((&(*_4).array[((int32_t)3)])) = 3;
  *((&(*_4).array[((int32_t)4)])) = 3.1419999999999999;
  ;
  len__PHI_TEMPORARY = 5;   /* for PHI node */

  len = len__PHI_TEMPORARY;
  ;
while (((int32_t)len) >= ((int32_t)0u)){
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])));
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)len)){
  _5 = ((uint64_t)(bool)(((i != 0u)&1)));
  _6 = *((&llvm_cbe_v.array[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call4 = printf((llvm_select_pu8((((i != 0u)&1)), ((&_OC_str_OC_1.array[((int64_t)0)])), ((&_OC_str_OC_2.array[((int64_t)0)])))), _6);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  llvm_cbe_call5 = mean(((&llvm_cbe_v.array[((int64_t)0)])), len);
  llvm_cbe_call6 = printf(((&_OC_str_OC_3.array[((int64_t)0)])), llvm_cbe_call5);

  len = llvm_add_u32(len, -1);
  ;
  len__PHI_TEMPORARY = len;   /* for PHI node */

  len = len__PHI_TEMPORARY;
  ;
}
  return 0;
}

