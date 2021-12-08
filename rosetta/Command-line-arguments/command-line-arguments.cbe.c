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
struct l_array_27_uint8_t {
  uint8_t array[27];
};
struct l_array_24_uint8_t {
  uint8_t array[24];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_27_uint8_t _OC_str = { "This program is named %s.\n" };
static struct l_array_24_uint8_t _OC_str_OC_1 = { "the argument #%d is %s\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argc = (uint32_t)argc;
  uint8_t** llvm_cbe_argv = (uint8_t**)argv;
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_argc_2e_addr;    /* Address-exposed local */
  uint8_t** llvm_cbe_argv_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint8_t** _1;
  uint8_t* _2;
  uint32_t llvm_cbe_call;
  uint32_t _3;
  uint32_t _4;
  uint32_t _5;
  uint8_t** _6;
  uint32_t _7;
  uint8_t* _8;
  uint32_t llvm_cbe_call2;
  uint32_t _9;

  llvm_cbe_retval = 0;
  llvm_cbe_argc_2e_addr = llvm_cbe_argc;
  ;
  llvm_cbe_argv_2e_addr = llvm_cbe_argv;
  ;
  ;
  _1 = llvm_cbe_argv_2e_addr;
  _2 = *((&(*_1)));
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _2);
  llvm_cbe_i = 1;

  _3 = llvm_cbe_i;
  _4 = llvm_cbe_argc_2e_addr;
while (((int32_t)_3) < ((int32_t)_4)){
  _5 = llvm_cbe_i;
  _6 = llvm_cbe_argv_2e_addr;
  _7 = llvm_cbe_i;
  _8 = *((&_6[((int64_t)(((int64_t)(int32_t)_7)))]));
  llvm_cbe_call2 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _5, _8);

  _9 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_9, 1));

  _3 = llvm_cbe_i;
  _4 = llvm_cbe_argc_2e_addr;
}
  return 0;
}

