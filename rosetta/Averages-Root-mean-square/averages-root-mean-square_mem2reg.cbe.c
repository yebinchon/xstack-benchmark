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
struct l_array_10_double {
  double array[10];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};

/* External Global Variable Declarations */

/* Function Declarations */
double rms(double*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
double sqrt(double) __ATTRIBUTELIST__((nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static __MSALIGN__(16) struct l_array_10_double __const_OC_main_OC_v __attribute__((aligned(16))) = { { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 } };
static struct l_array_4_uint8_t _OC_str = { "%f\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

double rms(double* llvm_cbe_v, uint32_t llvm_cbe_n) {
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  double sum;
  double sum__PHI_TEMPORARY;
  double _1;
  double _2;
  double llvm_cbe_call;

  ;
  ;
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  sum__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  sum = sum__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) < ((int32_t)llvm_cbe_n)){
  _1 = *((&llvm_cbe_v[((int64_t)(((int64_t)(int32_t)i)))]));
  _2 = *((&llvm_cbe_v[((int64_t)(((int64_t)(int32_t)i)))]));
  sum = sum + (_1 * _2);
  ;

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  sum__PHI_TEMPORARY = sum;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  sum = sum__PHI_TEMPORARY;
  ;
  ;
}
  llvm_cbe_call = sqrt((sum / (((double)(int32_t)llvm_cbe_n))));
  return llvm_cbe_call;
}


int main(void) {
  __MSALIGN__(16) struct l_array_10_double llvm_cbe_v __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _3;
  double llvm_cbe_call;
  uint32_t llvm_cbe_call1;

  ;
  _3 = memcpy((((uint8_t*)(&llvm_cbe_v))), ((uint8_t*)(&__const_OC_main_OC_v)), 80);
  llvm_cbe_call = rms(((&llvm_cbe_v.array[((int64_t)0)])), 10);
  llvm_cbe_call1 = printf(((&_OC_str.array[((int64_t)0)])), llvm_cbe_call);
  return 0;
}

