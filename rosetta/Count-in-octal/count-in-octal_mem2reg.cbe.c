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



/* Global Declarations */

/* Types Declarations */

/* Function definitions */

/* Types Definitions */
struct l_array_4_uint8_t {
  uint8_t array[4];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_4_uint8_t _OC_str = { "%o\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

int main(void) {
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;

  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

){
  if (!(((i != 0u)&1))) {
    i__PHI_TEMPORARY = i;   /* for PHI node */
  i = i__PHI_TEMPORARY;
  ;
  i = llvm_add_u32(i, 1);
  ;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), i);

}
  i = i__PHI_TEMPORARY;
  ;
  i = llvm_add_u32(i, 1);
  ;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), i);
  
;
}
  return 0;
}

