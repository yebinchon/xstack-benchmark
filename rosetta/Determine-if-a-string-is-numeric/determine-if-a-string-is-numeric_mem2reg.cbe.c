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
struct l_array_9_uint8_t {
  uint8_t array[9];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t isNumeric(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint16_t** __ctype_b_loc(void) __ATTRIBUTELIST__((nothrow, const));
double strtod(uint8_t*, uint8_t**) __ATTRIBUTELIST__((nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
static struct l_array_9_uint8_t _OC_str = { "01983498" };


/* LLVM Intrinsic Builtin Function Bodies */


/* Function Bodies */

uint32_t isNumeric(uint8_t* llvm_cbe_s) {
  uint8_t* llvm_cbe_p;    /* Address-exposed local */
  uint8_t _1;
  uint16_t** llvm_cbe_call;
  uint16_t* _2;
  uint8_t _3;
  uint16_t _4;
  double llvm_cbe_call6;
  uint8_t* _5;
  uint8_t _6;
  uint32_t llvm_cbe_conv9;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  if ((((llvm_cbe_s == ((uint8_t*)/*NULL*/0))&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  _1 = *llvm_cbe_s;
  if (((((((int32_t)(int8_t)_1)) == 0u)&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  llvm_cbe_call = __ctype_b_loc();
  _2 = *llvm_cbe_call;
  _3 = *llvm_cbe_s;
  _4 = *((&_2[((int64_t)(((int64_t)(int32_t)(((int32_t)(int8_t)_3)))))]));
  if ((((((((uint32_t)(uint16_t)_4)) & 8192) != 0u)&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

  } else {
  ;
  llvm_cbe_call6 = strtod(llvm_cbe_s, (&llvm_cbe_p));
  _5 = llvm_cbe_p;
  _6 = *_5;
  llvm_cbe_conv9 = ((uint32_t)(bool)((((((int32_t)(int8_t)_6)) == 0u)&1)));
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_conv9;   /* for PHI node */

}
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


int main(void) {
  uint32_t llvm_cbe_call;

  llvm_cbe_call = isNumeric(((&_OC_str.array[((int64_t)0)])));
  return 0;
}

