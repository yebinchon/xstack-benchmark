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
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_n;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  uint32_t _3;
  uint32_t _4;
  uint32_t llvm_cbe_call;
  uint32_t _5;
  uint32_t llvm_cbe_call1;

  llvm_cbe_retval = 0;
  ;
  llvm_cbe_n = 99;

  _1 = llvm_cbe_n;
while (((int32_t)_1) > ((int32_t)2u)){
  _2 = llvm_cbe_n;
  _3 = llvm_cbe_n;
  _4 = llvm_cbe_n;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _2, _3, (llvm_sub_u32(_4, 1)));

  _5 = llvm_cbe_n;
  llvm_cbe_n = (llvm_add_u32(_5, -1));

  _1 = llvm_cbe_n;
}
  llvm_cbe_call1 = printf(((&_OC_str_OC_1.array[((int64_t)0)])));
  return 0;
}

