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

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));


/* LLVM Intrinsic Builtin Function Bodies */


/* Function Bodies */

int main(void) {
  uint32_t _1;
  uint32_t dat;

  _1 = *(volatile uint32_t*)((uint32_t*)(uintptr_t)256);
  *(volatile uint32_t*)((uint32_t*)(uintptr_t)256) = (_1 ^ 1);
  dat = *(volatile uint32_t*)((uint32_t*)(uintptr_t)256);
  ;
  ;
  return 0;
}

