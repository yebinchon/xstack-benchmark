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
struct l_struct_struct_OC_functionPair;

/* Function definitions */
typedef uint32_t l_fptr_1(uint32_t);


/* Types Definitions */
struct l_struct_struct_OC_functionPair {
  uint32_t field0;
  l_fptr_1* field1;
};
struct l_array_34_uint8_t {
  uint8_t array[34];
};
struct l_array_24_uint8_t {
  uint8_t array[24];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t factorial(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint32_t atoi(uint8_t*) __ATTRIBUTELIST__((nothrow, pure));
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_34_uint8_t _OC_str = { "Usage : %s <non negative integer>" };
static struct l_array_24_uint8_t _OC_str_OC_1 = { "\nFactorial of %d is %d\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint32_t llvm_mul_u32(uint32_t a, uint32_t b) {
  uint32_t r = a * b;
  return r;
}


/* Function Bodies */

uint32_t factorial(uint32_t llvm_cbe_num) {
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_mul;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  if ((((llvm_cbe_num == 0u)&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  if ((((llvm_cbe_num == 1u)&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */

  } else {
  llvm_cbe_call = factorial((llvm_sub_u32(llvm_cbe_num, 1)));
  llvm_cbe_mul = llvm_mul_u32(llvm_cbe_num, llvm_cbe_call);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_mul;   /* for PHI node */

}
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argc = (uint32_t)argc;
  uint8_t** llvm_cbe_argv = (uint8_t**)argv;
  struct l_struct_struct_OC_functionPair llvm_cbe_response;    /* Address-exposed local */
  struct l_struct_struct_OC_functionPair llvm_cbe__2e_compoundliteral;    /* Address-exposed local */
  uint8_t* _1;
  uint32_t llvm_cbe_call;
  uint8_t* _2;
  uint32_t llvm_cbe_call2;
  uint8_t* _3;
  uint32_t _4;
  l_fptr_1* _5;
  uint32_t _6;
  uint32_t llvm_cbe_call6;
  uint32_t llvm_cbe_call7;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  ;
  if ((((llvm_cbe_argc != 2u)&1))) {
  _1 = *((&(*llvm_cbe_argv)));
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _1);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_call;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_call;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  _2 = *((&llvm_cbe_argv[((int64_t)1)]));
  llvm_cbe_call2 = atoi(_2);
  *((&llvm_cbe__2e_compoundliteral.field0)) = llvm_cbe_call2;
  *((&llvm_cbe__2e_compoundliteral.field1)) = factorial;
  _3 = memcpy((((uint8_t*)(&llvm_cbe_response))), (((uint8_t*)(&llvm_cbe__2e_compoundliteral))), 16);
  _4 = *((&llvm_cbe_response.field0));
  _5 = *((&llvm_cbe_response.field1));
  _6 = *((&llvm_cbe_response.field0));
  llvm_cbe_call6 = _5(_6);
  llvm_cbe_call7 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _4, llvm_cbe_call6);

  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}

