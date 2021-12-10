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
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_26_uint8_t llvm_cbe_lower __attribute__((aligned(16)));    /* Address-exposed local */
  uint64_t llvm_cbe_i;    /* Address-exposed local */
  uint64_t _1;
  uint64_t _2;
  uint64_t _3;
  uint64_t _4;

  llvm_cbe_retval = 0;
  ;
  ;
  llvm_cbe_i = 0;

  _1 = llvm_cbe_i;
while (((uint64_t)_1) < ((uint64_t)UINT64_C(26))){
  _2 = llvm_cbe_i;
  _3 = llvm_cbe_i;
  *((&llvm_cbe_lower.array[((int64_t)_3)])) = (((uint8_t)(llvm_add_u64(_2, 97))));

  _4 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u64(_4, 1));

  _1 = llvm_cbe_i;
}
  return 0;
}

