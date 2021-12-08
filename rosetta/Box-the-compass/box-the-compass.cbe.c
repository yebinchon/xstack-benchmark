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
struct l_array_33_double {
  double array[33];
};
struct l_array_727_uint8_t {
  uint8_t array[727];
};
struct l_array_19_uint8_t {
  uint8_t array[19];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static __MSALIGN__(16) struct l_array_33_double __const_OC_main_OC_degrees __attribute__((aligned(16))) = { { 0, 16.870000000000001, 16.879999999999999, 33.75, 50.619999999999997, 50.630000000000003, 67.5, 84.370000000000005, 84.379999999999995, 101.25, 118.12, 118.13, 135, 151.87, 151.88, 168.75, 185.62, 185.63, 202.5, 219.37, 219.38, 236.25, 253.12, 253.13, 270, 286.87, 286.88, 303.75, 320.62, 320.63, 337.5, 354.37, 354.38 } };
static struct l_array_727_uint8_t _OC_str = { "North                 North by east         North-northeast       Northeast by north    Northeast             Northeast by east     East-northeast        East by north         East                  East by south         East-southeast        Southeast by east     Southeast             Southeast by south    South-southeast       South by east         South                 South by west         South-southwest       Southwest by south    Southwest             Southwest by west     West-southwest        West by south         West                  West by north         West-northwest        Northwest by west     Northwest             Northwest by north    North-northwest       North by west         North                 " };
static struct l_array_19_uint8_t _OC_str_OC_1 = { "%2d  %.22s  %6.2f\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_mul_u32(uint32_t a, uint32_t b) {
  uint32_t r = a * b;
  return r;
}
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_33_double llvm_cbe_degrees __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* llvm_cbe_names;    /* Address-exposed local */
  uint8_t* _1;
  uint32_t _2;
  uint32_t _3;
  double _4;
  uint32_t _5;
  uint8_t* _6;
  uint32_t _7;
  uint32_t _8;
  double _9;
  uint32_t llvm_cbe_call;
  uint32_t _10;

  llvm_cbe_retval = 0;
  ;
  ;
  ;
  _1 = memcpy((((uint8_t*)(&llvm_cbe_degrees))), ((uint8_t*)(&__const_OC_main_OC_degrees)), 264);
  ;
  llvm_cbe_names = ((&_OC_str.array[((int64_t)0)]));
  llvm_cbe_i = 0;

  _2 = llvm_cbe_i;
while (((int32_t)_2) < ((int32_t)33u)){
  _3 = llvm_cbe_i;
  _4 = *((&llvm_cbe_degrees.array[((int64_t)(((int64_t)(int32_t)_3)))]));
  llvm_cbe_j = (((int32_t)(0.5 + ((_4 * 32) / 360))));
  _5 = llvm_cbe_j;
  _6 = llvm_cbe_names;
  _7 = llvm_cbe_j;
  _8 = llvm_cbe_i;
  _9 = *((&llvm_cbe_degrees.array[((int64_t)(((int64_t)(int32_t)_8)))]));
  llvm_cbe_call = printf(((&_OC_str_OC_1.array[((int64_t)0)])), (llvm_add_u32((llvm_srem_u32(_5, 32)), 1)), ((&_6[((int64_t)(((int64_t)(int32_t)(llvm_mul_u32((llvm_srem_u32(_7, 32)), 22)))))])), _9);

  _10 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_10, 1));

  _2 = llvm_cbe_i;
}
  return 0;
}

