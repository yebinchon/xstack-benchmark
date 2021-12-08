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
struct l_array_10_uint8_t {
  uint8_t array[10];
};
struct l_array_11_uint8_t {
  uint8_t array[11];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t unlink(uint8_t*) __ATTRIBUTELIST__((nothrow));
uint32_t rmdir(uint8_t*) __ATTRIBUTELIST__((nothrow));


/* Global Variable Definitions and Initialization */
static struct l_array_10_uint8_t _OC_str = { "input.txt" };
static struct l_array_11_uint8_t _OC_str_OC_1 = { "/input.txt" };
static struct l_array_5_uint8_t _OC_str_OC_2 = { "docs" };
static struct l_array_6_uint8_t _OC_str_OC_3 = { "/docs" };


/* LLVM Intrinsic Builtin Function Bodies */


/* Function Bodies */

int main(void) {
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call1;
  uint32_t llvm_cbe_call2;
  uint32_t llvm_cbe_call3;

  llvm_cbe_call = unlink(((&_OC_str.array[((int64_t)0)])));
  llvm_cbe_call1 = unlink(((&_OC_str_OC_1.array[((int64_t)0)])));
  llvm_cbe_call2 = rmdir(((&_OC_str_OC_2.array[((int64_t)0)])));
  llvm_cbe_call3 = rmdir(((&_OC_str_OC_3.array[((int64_t)0)])));
  return 0;
}

