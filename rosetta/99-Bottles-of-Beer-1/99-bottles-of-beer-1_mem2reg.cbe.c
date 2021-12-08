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
struct l_array_120_uint8_t {
  uint8_t array[120];
};
struct l_array_365_uint8_t {
  uint8_t array[365];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_120_uint8_t _OC_str = { "%d bottles of beer on the wall, %d bottles of beer.\nTake one down and pass it around, %d bottles of beer on the wall.\n\n" };
static struct l_array_365_uint8_t _OC_str_OC_1 = { "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n\n1 bottle of beer on the wall, 1 bottle of beer.\nTake one down and pass it around, no more bottles of beer on the wall.\n\nNo more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}


/* Function Bodies */

int main(void) {
  uint32_t n;
  uint32_t n__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call1;

  ;
  n__PHI_TEMPORARY = 99;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  ;
while (((int32_t)n) > ((int32_t)2u)){
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), n, n, (llvm_sub_u32(n, 1)));

  n = llvm_add_u32(n, -1);
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  ;
}
  llvm_cbe_call1 = printf(((&_OC_str_OC_1.array[((int64_t)0)])));
  return 0;
}

