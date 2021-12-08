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
struct l_array_10_uint32_t {
  uint32_t array[10];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
__MSALIGN__(16) struct l_array_10_uint32_t x __attribute__((aligned(16))) = { { 2, 4, 10, 2, 5, 0, 9, 6, 7, 9 } };
static struct l_array_4_uint8_t _OC_str = { "%d\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

int main(void) {
  uint32_t sum;
  uint32_t sum__PHI_TEMPORARY;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t _1;
  uint32_t _2;
  uint32_t llvm_cbe_call;

  ;
  ;
  sum__PHI_TEMPORARY = 0;   /* for PHI node */
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  sum = sum__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) < ((int32_t)10u)){
  _1 = *((&x.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((((int32_t)_1) > ((int32_t)3u))&1))) {
  _2 = *((&x.array[((int64_t)(((int64_t)(int32_t)i)))]));
  sum = llvm_add_u32(sum, _2);
  ;
  sum__PHI_TEMPORARY = sum;   /* for PHI node */

}
  sum = sum__PHI_TEMPORARY;
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
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), sum);
  return 0;
}

