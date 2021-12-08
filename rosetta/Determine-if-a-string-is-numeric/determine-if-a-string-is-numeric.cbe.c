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
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint8_t* llvm_cbe_s_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_p;    /* Address-exposed local */
  uint8_t* _1;
  uint8_t* _2;
  uint8_t _3;
  uint16_t** llvm_cbe_call;
  uint16_t* _4;
  uint8_t* _5;
  uint8_t _6;
  uint16_t _7;
  uint8_t* _8;
  double llvm_cbe_call6;
  uint8_t* _9;
  uint8_t _10;
  uint32_t _11;

  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  _1 = llvm_cbe_s_2e_addr;
  if ((((_1 == ((uint8_t*)/*NULL*/0))&1))) {
  llvm_cbe_retval = 0;

  _11 = llvm_cbe_retval;
  return _11;
}
  _2 = llvm_cbe_s_2e_addr;
  _3 = *_2;
  if (((((((int32_t)(int8_t)_3)) == 0u)&1))) {
  llvm_cbe_retval = 0;

  _11 = llvm_cbe_retval;
  return _11;
}
  llvm_cbe_call = __ctype_b_loc();
  _4 = *llvm_cbe_call;
  _5 = llvm_cbe_s_2e_addr;
  _6 = *_5;
  _7 = *((&_4[((int64_t)(((int64_t)(int32_t)(((int32_t)(int8_t)_6)))))]));
  if ((((((((uint32_t)(uint16_t)_7)) & 8192) != 0u)&1))) {
  llvm_cbe_retval = 0;

  } else {
  ;
  _8 = llvm_cbe_s_2e_addr;
  llvm_cbe_call6 = strtod(_8, (&llvm_cbe_p));
  _9 = llvm_cbe_p;
  _10 = *_9;
  llvm_cbe_retval = (((uint32_t)(bool)((((((int32_t)(int8_t)_10)) == 0u)&1))));

}
  _11 = llvm_cbe_retval;
  return _11;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_call;

  llvm_cbe_retval = 0;
  llvm_cbe_call = isNumeric(((&_OC_str.array[((int64_t)0)])));
  return 0;
}

