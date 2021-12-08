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
struct l_array_16_uint8_t {
  uint8_t array[16];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t ackermann(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_16_uint8_t _OC_str = { "A(%d, %d) = %d\n" };


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

uint32_t ackermann(uint32_t llvm_cbe_m, uint32_t llvm_cbe_n) {
  uint32_t llvm_cbe_add;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call6;
  uint32_t llvm_cbe_call7;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  if (!(((llvm_cbe_m != 0u)&1))) {
  llvm_cbe_add = llvm_add_u32(llvm_cbe_n, 1);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_add;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_add;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  if ((((llvm_cbe_n != 0u)&1))) {
  llvm_cbe_call6 = ackermann(llvm_cbe_m, (llvm_sub_u32(llvm_cbe_n, 1)));
  llvm_cbe_call7 = ackermann((llvm_sub_u32(llvm_cbe_m, 1)), llvm_cbe_call6);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_call7;   /* for PHI node */

  } else {
  llvm_cbe_call = ackermann((llvm_sub_u32(llvm_cbe_m, 1)), 1);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_call;   /* for PHI node */

}
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


int main(void) {
  uint32_t m;
  uint32_t m__PHI_TEMPORARY;
  uint32_t n;
  uint32_t n__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call4;

  ;
  m__PHI_TEMPORARY = 0;   /* for PHI node */

  m = m__PHI_TEMPORARY;
  ;
while (((int32_t)m) <= ((int32_t)4u)){
  ;
  n__PHI_TEMPORARY = 0;   /* for PHI node */

  uint32_t llvm_cbe_sub;
  n = n__PHI_TEMPORARY;
  ;
  llvm_cbe_sub = llvm_sub_u32(6, m);
while (((int32_t)n) < ((int32_t)llvm_cbe_sub)){
  llvm_cbe_call = ackermann(m, n);
  llvm_cbe_call4 = printf(((&_OC_str.array[((int64_t)0)])), m, n, llvm_cbe_call);

  n = llvm_add_u32(n, 1);
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  ;
  llvm_cbe_sub = llvm_sub_u32(6, m);
}

  m = llvm_add_u32(m, 1);
  ;
  m__PHI_TEMPORARY = m;   /* for PHI node */

  m = m__PHI_TEMPORARY;
  ;
}
  return 0;
}

