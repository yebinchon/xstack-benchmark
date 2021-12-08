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
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_dat;    /* Address-exposed local */
  uint64_t llvm_cbe_addr;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;

  llvm_cbe_retval = 0;
  ;
  ;
  _1 = *(volatile uint32_t*)((uint32_t*)(uintptr_t)256);
  *(volatile uint32_t*)((uint32_t*)(uintptr_t)256) = (_1 ^ 1);
  _2 = *(volatile uint32_t*)((uint32_t*)(uintptr_t)256);
  llvm_cbe_dat = _2;
  llvm_cbe_addr = 256;
  return 0;
}

