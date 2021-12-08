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
struct l_array_11_uint8_t {
  uint8_t array[11];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t open(uint8_t*, uint32_t, ...);
uint32_t close(uint32_t);
uint32_t mkdir(uint8_t*, uint32_t) __ATTRIBUTELIST__((nothrow));


/* Global Variable Definitions and Initialization */
static struct l_array_11_uint8_t _OC_str = { "output.txt" };
static struct l_array_5_uint8_t _OC_str_OC_1 = { "docs" };


/* LLVM Intrinsic Builtin Function Bodies */


/* Function Bodies */

int main(void) {
  uint32_t fd;
  uint32_t llvm_cbe_call1;
  uint32_t llvm_cbe_call2;

  fd = open(((&_OC_str.array[((int64_t)0)])), 577, 416);
  ;
  llvm_cbe_call1 = close(fd);
  llvm_cbe_call2 = mkdir(((&_OC_str_OC_1.array[((int64_t)0)])), 488);
  return 0;
}

