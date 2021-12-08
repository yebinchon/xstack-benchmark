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
struct l_array_33_uint8_t {
  uint8_t array[33];
};
struct l_array_21_uint8_t {
  uint8_t array[21];
};
struct l_array_31_uint8_t {
  uint8_t array[31];
};
struct l_array_34_uint8_t {
  uint8_t array[34];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_33_uint8_t _OC_str = { "%d bottle%c of beer on the wall\n" };
static struct l_array_21_uint8_t _OC_str_OC_1 = { "%d bottle%c of beer\n" };
static struct l_array_31_uint8_t _OC_str_OC_2 = { "Take one down, pass it around\n" };
static struct l_array_34_uint8_t _OC_str_OC_3 = { "%d bottle%c of beer on the wall\n\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_select_u32(bool condition, uint32_t iftrue, uint32_t ifnot) {
  uint32_t r;
  r = condition ? iftrue : ifnot;
  return r;
}
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argc = (uint32_t)argc;
  uint8_t** llvm_cbe_argv = (uint8_t**)argv;
  uint8_t* _1;
  uint32_t argc;
  uint32_t argc__PHI_TEMPORARY;
  uint64_t _2;
  uint32_t llvm_cbe_call6;
  uint64_t _3;
  uint32_t llvm_cbe_call9;
  uint32_t llvm_cbe_call10;
  uint64_t _4;
  uint32_t llvm_cbe_call14;
  uint32_t llvm_cbe_sub15;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  if ((((llvm_cbe_argc == 99u)&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 99;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 99;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  _1 = *((&(*llvm_cbe_argv)));
  if (!(((_1 != ((uint8_t*)/*NULL*/0))&1))) {
  *((&(*llvm_cbe_argv))) = ((uint8_t*)/*NULL*/0);
  ;
  argc__PHI_TEMPORARY = 0;   /* for PHI node */

}
  argc = argc__PHI_TEMPORARY;
  ;
  argc = main((llvm_add_u32(argc, 1)), llvm_cbe_argv);
  ;
  _2 = ((uint64_t)(bool)(((argc == 1u)&1)));
  llvm_cbe_call6 = printf(((&_OC_str.array[((int64_t)0)])), argc, (llvm_select_u32((((argc == 1u)&1)), 0, 115)));
  _3 = ((uint64_t)(bool)(((argc == 1u)&1)));
  llvm_cbe_call9 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), argc, (llvm_select_u32((((argc == 1u)&1)), 0, 115)));
  llvm_cbe_call10 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  _4 = ((uint64_t)(bool)((((llvm_sub_u32(argc, 1)) == 1u)&1)));
  llvm_cbe_call14 = printf(((&_OC_str_OC_3.array[((int64_t)0)])), (llvm_sub_u32(argc, 1)), (llvm_select_u32(((((llvm_sub_u32(argc, 1)) == 1u)&1)), 0, 115)));
  llvm_cbe_sub15 = llvm_sub_u32(argc, 1);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_sub15;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}

