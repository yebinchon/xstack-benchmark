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
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t __isoc99_scanf(uint8_t*, ...);
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_5_uint8_t _OC_str = { "%d%d" };
static struct l_array_4_uint8_t _OC_str_OC_1 = { "%d\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

int main(void) {
  uint32_t llvm_cbe_a;    /* Address-exposed local */
  uint32_t llvm_cbe_b;    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint32_t _1;
  uint32_t _2;
  uint32_t llvm_cbe_call1;

  ;
  ;
  llvm_cbe_call = __isoc99_scanf(((&_OC_str.array[((int64_t)0)])), (&llvm_cbe_a), (&llvm_cbe_b));
  _1 = llvm_cbe_a;
  _2 = llvm_cbe_b;
  llvm_cbe_call1 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), (llvm_add_u32(_1, _2)));
  return 0;
}

