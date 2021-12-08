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
struct l_array_10_double {
  double array[10];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};

/* External Global Variable Declarations */

/* Function Declarations */
double rms(double*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
double sqrt(double) __ATTRIBUTELIST__((nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static __MSALIGN__(16) struct l_array_10_double __const_OC_main_OC_v __attribute__((aligned(16))) = { { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 } };
static struct l_array_4_uint8_t _OC_str = { "%f\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

double rms(double* llvm_cbe_v, uint32_t llvm_cbe_n) {
  double* llvm_cbe_v_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  double llvm_cbe_sum;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  double* _3;
  uint32_t _4;
  double _5;
  double* _6;
  uint32_t _7;
  double _8;
  double _9;
  uint32_t _10;
  double _11;
  uint32_t _12;
  double llvm_cbe_call;

  llvm_cbe_v_2e_addr = llvm_cbe_v;
  ;
  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  ;
  ;
  llvm_cbe_sum = 0;
  llvm_cbe_i = 0;

  _1 = llvm_cbe_i;
  _2 = llvm_cbe_n_2e_addr;
while (((int32_t)_1) < ((int32_t)_2)){
  _3 = llvm_cbe_v_2e_addr;
  _4 = llvm_cbe_i;
  _5 = *((&_3[((int64_t)(((int64_t)(int32_t)_4)))]));
  _6 = llvm_cbe_v_2e_addr;
  _7 = llvm_cbe_i;
  _8 = *((&_6[((int64_t)(((int64_t)(int32_t)_7)))]));
  _9 = llvm_cbe_sum;
  llvm_cbe_sum = (_9 + (_5 * _8));

  _10 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_10, 1));

  _1 = llvm_cbe_i;
  _2 = llvm_cbe_n_2e_addr;
}
  _11 = llvm_cbe_sum;
  _12 = llvm_cbe_n_2e_addr;
  llvm_cbe_call = sqrt((_11 / (((double)(int32_t)_12))));
  return llvm_cbe_call;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_10_double llvm_cbe_v __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _13;
  double llvm_cbe_call;
  uint32_t llvm_cbe_call1;

  llvm_cbe_retval = 0;
  ;
  _13 = memcpy((((uint8_t*)(&llvm_cbe_v))), ((uint8_t*)(&__const_OC_main_OC_v)), 80);
  llvm_cbe_call = rms(((&llvm_cbe_v.array[((int64_t)0)])), 10);
  llvm_cbe_call1 = printf(((&_OC_str.array[((int64_t)0)])), llvm_cbe_call);
  return 0;
}

