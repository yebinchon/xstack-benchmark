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
struct l_array_41_uint8_t {
  uint8_t array[41];
};
struct l_array_9_uint8_t {
  uint8_t array[9];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_7_uint8_t {
  uint8_t array[7];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_41_uint8_t _OC_str = { "The three dogs are named %s, %s and %s.\n" };
static struct l_array_9_uint8_t _OC_str_OC_1 = { "Benjamin" };
static struct l_array_6_uint8_t _OC_str_OC_2 = { "Samba" };
static struct l_array_7_uint8_t _OC_str_OC_3 = { "Bernie" };
static uint8_t* dog = ((&_OC_str_OC_1.array[((int32_t)0)]));
static uint8_t* Dog = ((&_OC_str_OC_2.array[((int32_t)0)]));
static uint8_t* DOG = ((&_OC_str_OC_3.array[((int32_t)0)]));


/* LLVM Intrinsic Builtin Function Bodies */


/* Function Bodies */

int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint8_t* _1;
  uint8_t* _2;
  uint8_t* _3;
  uint32_t llvm_cbe_call;

  llvm_cbe_retval = 0;
  _1 = dog;
  _2 = Dog;
  _3 = DOG;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _1, _2, _3);
  return 0;
}

