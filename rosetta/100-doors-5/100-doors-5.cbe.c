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
struct l_array_14_uint8_t {
  uint8_t array[14];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_14_uint8_t _OC_str = { "door %d open\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_mul_u32(uint32_t a, uint32_t b) {
  uint32_t r = a * b;
  return r;
}


/* Function Bodies */

int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  uint32_t _3;
  uint32_t _4;
  uint32_t llvm_cbe_call;
  uint32_t _5;

  llvm_cbe_retval = 0;
  ;
  llvm_cbe_i = 1;

  uint32_t llvm_cbe_mul;
  _1 = llvm_cbe_i;
  _2 = llvm_cbe_i;
  llvm_cbe_mul = llvm_mul_u32(_1, _2);
while (((int32_t)llvm_cbe_mul) <= ((int32_t)100u)){
  _3 = llvm_cbe_i;
  _4 = llvm_cbe_i;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), (llvm_mul_u32(_3, _4)));

  _5 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_5, 1));

  _1 = llvm_cbe_i;
  _2 = llvm_cbe_i;
  llvm_cbe_mul = llvm_mul_u32(_1, _2);
}
  return 0;
}

