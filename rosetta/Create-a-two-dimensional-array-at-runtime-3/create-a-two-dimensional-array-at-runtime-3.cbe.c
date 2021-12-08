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
struct l_array_48_uint8_t {
  uint8_t array[48];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_21_uint8_t {
  uint8_t array[21];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint32_t __isoc99_scanf(uint8_t*, ...);
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
void free(uint8_t*) __ATTRIBUTELIST__((nothrow));


/* Global Variable Definitions and Initialization */
static struct l_array_48_uint8_t _OC_str = { "Enter two integers.  Space delimited, please:  " };
static struct l_array_6_uint8_t _OC_str_OC_1 = { "%d %d" };
static struct l_array_21_uint8_t _OC_str_OC_2 = { "array[%d][%d] is %d\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_mul_u32(uint32_t a, uint32_t b) {
  uint32_t r = a * b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint32_t llvm_sdiv_u32(int32_t a, int32_t b) {
  uint32_t r = a / b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argc = (uint32_t)argc;
  uint8_t** llvm_cbe_argv = (uint8_t**)argv;
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_argc_2e_addr;    /* Address-exposed local */
  uint8_t** llvm_cbe_argv_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_user1;    /* Address-exposed local */
  uint32_t llvm_cbe_user2;    /* Address-exposed local */
  uint32_t* llvm_cbe_a1;    /* Address-exposed local */
  uint32_t** llvm_cbe_array;    /* Address-exposed local */
  uint32_t llvm_cbe_row;    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call1;
  uint32_t _1;
  uint32_t _2;
  uint8_t* llvm_cbe_call3;
  uint32_t _3;
  uint8_t* llvm_cbe_call6;
  uint32_t _4;
  uint32_t _5;
  uint32_t* _6;
  uint32_t _7;
  uint32_t _8;
  uint32_t** _9;
  uint32_t _10;
  uint32_t _11;
  uint32_t _12;
  uint32_t _13;
  uint32_t** _14;
  uint32_t _15;
  uint32_t* _16;
  uint32_t _17;
  uint32_t _18;
  uint32_t _19;
  uint32_t** _20;
  uint32_t _21;
  uint32_t* _22;
  uint32_t _23;
  uint32_t _24;
  uint32_t llvm_cbe_call22;
  uint32_t** _25;
  uint32_t* _26;

  llvm_cbe_retval = 0;
  llvm_cbe_argc_2e_addr = llvm_cbe_argc;
  ;
  llvm_cbe_argv_2e_addr = llvm_cbe_argv;
  ;
  ;
  llvm_cbe_user1 = 0;
  ;
  llvm_cbe_user2 = 0;
  ;
  ;
  ;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])));
  llvm_cbe_call1 = __isoc99_scanf(((&_OC_str_OC_1.array[((int64_t)0)])), (&llvm_cbe_user1), (&llvm_cbe_user2));
  _1 = llvm_cbe_user1;
  _2 = llvm_cbe_user2;
  llvm_cbe_call3 = malloc((llvm_mul_u64((((int64_t)(int32_t)(llvm_mul_u32(_1, _2)))), 4)));
  llvm_cbe_a1 = (((uint32_t*)llvm_cbe_call3));
  _3 = llvm_cbe_user1;
  llvm_cbe_call6 = malloc((llvm_mul_u64((((int64_t)(int32_t)_3)), 8)));
  llvm_cbe_array = (((uint32_t**)llvm_cbe_call6));
  llvm_cbe_row = 0;

  _4 = llvm_cbe_row;
  _5 = llvm_cbe_user1;
while (((int32_t)_4) < ((int32_t)_5)){
  _6 = llvm_cbe_a1;
  _7 = llvm_cbe_row;
  _8 = llvm_cbe_user2;
  _9 = llvm_cbe_array;
  _10 = llvm_cbe_row;
  *((&_9[((int64_t)(((int64_t)(int32_t)_10)))])) = ((&_6[((int64_t)(((int64_t)(int32_t)(llvm_mul_u32(_7, _8)))))]));

  _11 = llvm_cbe_row;
  llvm_cbe_row = (llvm_add_u32(_11, 1));

  _4 = llvm_cbe_row;
  _5 = llvm_cbe_user1;
}
  _12 = llvm_cbe_user1;
  _13 = llvm_cbe_user2;
  _14 = llvm_cbe_array;
  _15 = llvm_cbe_user1;
  _16 = *((&_14[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_15, 2)))))]));
  _17 = llvm_cbe_user2;
  *((&_16[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_17, 2)))))])) = (llvm_add_u32(_12, _13));
  _18 = llvm_cbe_user1;
  _19 = llvm_cbe_user2;
  _20 = llvm_cbe_array;
  _21 = llvm_cbe_user1;
  _22 = *((&_20[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_21, 2)))))]));
  _23 = llvm_cbe_user2;
  _24 = *((&_22[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_23, 2)))))]));
  llvm_cbe_call22 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), (llvm_sdiv_u32(_18, 2)), (llvm_sdiv_u32(_19, 2)), _24);
  _25 = llvm_cbe_array;
  free((((uint8_t*)_25)));
  _26 = llvm_cbe_a1;
  free((((uint8_t*)_26)));
  return 0;
}

