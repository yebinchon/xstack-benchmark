/* Provide Declarations */
#include <stdint.h>
#ifndef __cplusplus
typedef unsigned char bool;
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
struct l_array_44_uint8_t {
  uint8_t array[44];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint64_t crc32(uint64_t, uint8_t*, uint32_t);
uint64_t strlen(uint8_t*) __ATTRIBUTELIST__((nothrow, pure));


/* Global Variable Definitions and Initialization */
static struct l_array_44_uint8_t _OC_str = { "The quick brown fox jumps over the lazy dog" };
static struct l_array_5_uint8_t _OC_str_OC_1 = { "%lX\n" };


/* LLVM Intrinsic Builtin Function Bodies */


/* Function Bodies */

int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint8_t* llvm_cbe_s;    /* Address-exposed local */
  uint8_t* _1;
  uint8_t* _2;
  uint64_t llvm_cbe_call;
  uint64_t llvm_cbe_call1;
  uint32_t llvm_cbe_call2;

  llvm_cbe_retval = 0;
  ;
  llvm_cbe_s = ((&_OC_str.array[((int64_t)0)]));
  _1 = llvm_cbe_s;
  _2 = llvm_cbe_s;
  llvm_cbe_call = strlen(_2);
  llvm_cbe_call1 = crc32(0, _1, (((uint32_t)llvm_cbe_call)));
  llvm_cbe_call2 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), llvm_cbe_call1);
  return 0;
}

