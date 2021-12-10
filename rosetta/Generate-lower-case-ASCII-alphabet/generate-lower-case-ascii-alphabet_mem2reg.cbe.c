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
struct l_array_26_uint8_t {
  uint8_t array[26];
};

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}


/* Function Bodies */

int main(void) {
  __MSALIGN__(16) struct l_array_26_uint8_t llvm_cbe_lower __attribute__((aligned(16)));    /* Address-exposed local */
  uint64_t i;
  uint64_t i__PHI_TEMPORARY;

  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((uint64_t)i) < ((uint64_t)UINT64_C(26))){
  *((&llvm_cbe_lower.array[((int64_t)i)])) = (((uint8_t)(llvm_add_u64(i, 97))));

  i = llvm_add_u64(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return 0;
}

