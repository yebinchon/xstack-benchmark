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
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint32_t atoi(uint8_t*) __ATTRIBUTELIST__((nothrow, pure));


/* Global Variable Definitions and Initialization */
static struct l_array_4_uint8_t _OC_str = { "%d\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argc = (uint32_t)argc;
  uint8_t** llvm_cbe_argv = (uint8_t**)argv;
  uint8_t* _1;
  uint32_t llvm_cbe_call;
  uint8_t* _2;
  uint32_t llvm_cbe_call2;
  uint32_t llvm_cbe_call3;

  ;
  ;
  _1 = *((&llvm_cbe_argv[((int64_t)1)]));
  llvm_cbe_call = atoi(_1);
  _2 = *((&llvm_cbe_argv[((int64_t)2)]));
  llvm_cbe_call2 = atoi(_2);
  llvm_cbe_call3 = printf(((&_OC_str.array[((int64_t)0)])), (llvm_add_u32(llvm_cbe_call, llvm_cbe_call2)));
  return 0;
}

