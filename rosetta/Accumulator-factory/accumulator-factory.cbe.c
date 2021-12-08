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
struct l_array_4_uint8_t {
  uint8_t array[4];
};

/* External Global Variable Declarations */

/* Function Declarations */
double x(double) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t y(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t z(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static double x_OC__n = 1;
static uint32_t y_OC__n = 3;
static uint32_t z_OC__n = 97;
static struct l_array_4_uint8_t _OC_str = { "%f\n" };
static struct l_array_4_uint8_t _OC_str_OC_1 = { "%i\n" };
static struct l_array_4_uint8_t _OC_str_OC_2 = { "%c\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

double x(double llvm_cbe_i) {
  double llvm_cbe_i_2e_addr;    /* Address-exposed local */
  double _1;
  double _2;
  double llvm_cbe_add;

  llvm_cbe_i_2e_addr = llvm_cbe_i;
  ;
  _1 = llvm_cbe_i_2e_addr;
  _2 = x_OC__n;
  llvm_cbe_add = _2 + _1;
  x_OC__n = llvm_cbe_add;
  return llvm_cbe_add;
}


uint32_t y(uint32_t llvm_cbe_i) {
  uint32_t llvm_cbe_i_2e_addr;    /* Address-exposed local */
  uint32_t _3;
  uint32_t _4;
  uint32_t llvm_cbe_add;

  llvm_cbe_i_2e_addr = llvm_cbe_i;
  ;
  _3 = llvm_cbe_i_2e_addr;
  _4 = y_OC__n;
  llvm_cbe_add = llvm_add_u32(_4, _3);
  y_OC__n = llvm_cbe_add;
  return llvm_cbe_add;
}


uint32_t z(uint32_t llvm_cbe_i) {
  uint32_t llvm_cbe_i_2e_addr;    /* Address-exposed local */
  uint32_t _5;
  uint32_t _6;
  uint32_t llvm_cbe_add;

  llvm_cbe_i_2e_addr = llvm_cbe_i;
  ;
  _5 = llvm_cbe_i_2e_addr;
  _6 = z_OC__n;
  llvm_cbe_add = llvm_add_u32(_6, _5);
  z_OC__n = llvm_cbe_add;
  return llvm_cbe_add;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  double llvm_cbe_call;
  uint32_t llvm_cbe_call1;
  double llvm_cbe_call2;
  uint32_t llvm_cbe_call3;
  uint32_t llvm_cbe_call4;
  uint32_t llvm_cbe_call5;
  uint32_t llvm_cbe_call6;
  uint32_t llvm_cbe_call7;
  uint32_t llvm_cbe_call8;
  uint32_t llvm_cbe_call9;

  llvm_cbe_retval = 0;
  llvm_cbe_call = x(5);
  llvm_cbe_call1 = printf(((&_OC_str.array[((int64_t)0)])), llvm_cbe_call);
  llvm_cbe_call2 = x(2.2999999999999998);
  llvm_cbe_call3 = printf(((&_OC_str.array[((int64_t)0)])), llvm_cbe_call2);
  llvm_cbe_call4 = y(5);
  llvm_cbe_call5 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), llvm_cbe_call4);
  llvm_cbe_call6 = y(3);
  llvm_cbe_call7 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), llvm_cbe_call6);
  llvm_cbe_call8 = z(5);
  llvm_cbe_call9 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), llvm_cbe_call8);
  return 0;
}

