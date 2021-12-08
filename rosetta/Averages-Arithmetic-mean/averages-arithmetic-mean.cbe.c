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

#ifdef _MSC_VER
#define __MSALIGN__(X) __declspec(align(X))
#else
#define __MSALIGN__(X)
#endif



/* Global Declarations */

/* Types Declarations */

/* Function definitions */

/* Types Definitions */
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_5_double {
  double array[5];
};

/* External Global Variable Declarations */

/* Function Declarations */
double mean(double*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_6_uint8_t _OC_str = { "mean[" };
static struct l_array_5_uint8_t _OC_str_OC_1 = { ", %g" };
static struct l_array_3_uint8_t _OC_str_OC_2 = { "%g" };
static struct l_array_8_uint8_t _OC_str_OC_3 = { "] = %g\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint8_t* llvm_select_pu8(bool condition, uint8_t* iftrue, uint8_t* ifnot) {
  uint8_t* r;
  r = condition ? iftrue : ifnot;
  return r;
}
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

double mean(double* llvm_cbe_v, uint32_t llvm_cbe_len) {
  double* llvm_cbe_v_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_len_2e_addr;    /* Address-exposed local */
  double llvm_cbe_sum;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  double* _3;
  uint32_t _4;
  double _5;
  double _6;
  uint32_t _7;
  double _8;
  uint32_t _9;

  llvm_cbe_v_2e_addr = llvm_cbe_v;
  ;
  llvm_cbe_len_2e_addr = llvm_cbe_len;
  ;
  ;
  llvm_cbe_sum = 0;
  ;
  llvm_cbe_i = 0;

  _1 = llvm_cbe_i;
  _2 = llvm_cbe_len_2e_addr;
while (((int32_t)_1) < ((int32_t)_2)){
  _3 = llvm_cbe_v_2e_addr;
  _4 = llvm_cbe_i;
  _5 = *((&_3[((int64_t)(((int64_t)(int32_t)_4)))]));
  _6 = llvm_cbe_sum;
  llvm_cbe_sum = (_6 + _5);

  _7 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_7, 1));

  _1 = llvm_cbe_i;
  _2 = llvm_cbe_len_2e_addr;
}
  _8 = llvm_cbe_sum;
  _9 = llvm_cbe_len_2e_addr;
  return (_8 / (((double)(int32_t)_9)));
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_5_double llvm_cbe_v __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_len;    /* Address-exposed local */
  uint8_t* _10;
  uint8_t* _11;
  struct l_array_5_double* _12;
  uint32_t _13;
  uint32_t llvm_cbe_call;
  uint32_t _14;
  uint32_t _15;
  uint32_t _16;
  uint64_t _17;
  uint32_t _18;
  double _19;
  uint32_t llvm_cbe_call4;
  uint32_t _20;
  uint32_t _21;
  double llvm_cbe_call5;
  uint32_t llvm_cbe_call6;
  uint32_t _22;

  llvm_cbe_retval = 0;
  ;
  _10 = ((uint8_t*)(&llvm_cbe_v));
  _11 = memset(_10, 0, 40);
  _12 = ((struct l_array_5_double*)_10);
  *((&(*_12).array[((int32_t)0)])) = 1;
  *((&(*_12).array[((int32_t)1)])) = 2;
  *((&(*_12).array[((int32_t)2)])) = 2.718;
  *((&(*_12).array[((int32_t)3)])) = 3;
  *((&(*_12).array[((int32_t)4)])) = 3.1419999999999999;
  ;
  ;
  llvm_cbe_len = 5;

  _13 = llvm_cbe_len;
while (((int32_t)_13) >= ((int32_t)0u)){
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])));
  llvm_cbe_i = 0;

  _14 = llvm_cbe_i;
  _15 = llvm_cbe_len;
while (((int32_t)_14) < ((int32_t)_15)){
  _16 = llvm_cbe_i;
  _17 = ((uint64_t)(bool)(((_16 != 0u)&1)));
  _18 = llvm_cbe_i;
  _19 = *((&llvm_cbe_v.array[((int64_t)(((int64_t)(int32_t)_18)))]));
  llvm_cbe_call4 = printf((llvm_select_pu8((((_16 != 0u)&1)), ((&_OC_str_OC_1.array[((int64_t)0)])), ((&_OC_str_OC_2.array[((int64_t)0)])))), _19);

  _20 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_20, 1));

  _14 = llvm_cbe_i;
  _15 = llvm_cbe_len;
}
  _21 = llvm_cbe_len;
  llvm_cbe_call5 = mean(((&llvm_cbe_v.array[((int64_t)0)])), _21);
  llvm_cbe_call6 = printf(((&_OC_str_OC_3.array[((int64_t)0)])), llvm_cbe_call5);

  _22 = llvm_cbe_len;
  llvm_cbe_len = (llvm_add_u32(_22, -1));

  _13 = llvm_cbe_len;
}
  return 0;
}

