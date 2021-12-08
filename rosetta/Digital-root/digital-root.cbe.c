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
struct l_array_4_uint64_t {
  uint64_t array[4];
};
struct l_array_24_uint8_t {
  uint8_t array[24];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t droot(uint64_t, uint32_t, uint32_t*) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static __MSALIGN__(16) struct l_array_4_uint64_t __const_OC_main_OC_x __attribute__((aligned(16))) = { { 627615, 39390, 588225, INT64_C(393900588225) } };
static struct l_array_24_uint8_t _OC_str = { "%lld: pers %d, root %d\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint64_t llvm_sdiv_u64(int64_t a, int64_t b) {
  uint64_t r = a / b;
  return r;
}
static __forceinline uint64_t llvm_srem_u64(int64_t a, int64_t b) {
  uint64_t r = a % b;
  return r;
}


/* Function Bodies */

uint32_t droot(uint64_t llvm_cbe_x, uint32_t llvm_cbe_base, uint32_t* llvm_cbe_pers) {
  uint64_t llvm_cbe_x_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_base_2e_addr;    /* Address-exposed local */
  uint32_t* llvm_cbe_pers_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_d;    /* Address-exposed local */
  uint32_t* _1;
  uint32_t* _2;
  uint64_t _3;
  uint32_t _4;
  uint64_t _5;
  uint64_t _6;
  uint32_t _7;
  uint32_t _8;
  uint32_t _9;
  uint64_t _10;
  uint32_t _11;
  uint32_t* _12;
  uint32_t _13;
  uint64_t _14;
  uint64_t _15;
  uint32_t _16;
  uint32_t llvm_cbe_conv15;
  uint32_t _17;
  uint32_t _18;

  llvm_cbe_x_2e_addr = llvm_cbe_x;
  ;
  llvm_cbe_base_2e_addr = llvm_cbe_base;
  ;
  llvm_cbe_pers_2e_addr = llvm_cbe_pers;
  ;
  ;
  llvm_cbe_d = 0;
  _1 = llvm_cbe_pers_2e_addr;
  if ((((_1 != ((uint32_t*)/*NULL*/0))&1))) {
  _2 = llvm_cbe_pers_2e_addr;
  *_2 = 0;

  _3 = llvm_cbe_x_2e_addr;
  _4 = llvm_cbe_base_2e_addr;
  if (!(((((int64_t)_3) >= ((int64_t)(((int64_t)(int32_t)_4))))&1))) {
  }

  llvm_cbe_d = 0;


  _5 = llvm_cbe_x_2e_addr;
  if (!(((_5 != UINT64_C(0))&1))) {
  }

  } else {
  _14 = llvm_cbe_x_2e_addr;
  if (!(((_14 != UINT64_C(0))&1))) {

  _18 = llvm_cbe_d;
  return _18;
}
  _15 = llvm_cbe_x_2e_addr;
  _16 = llvm_cbe_base_2e_addr;
  llvm_cbe_conv15 = ((uint32_t)(llvm_srem_u64(_15, (((int64_t)(int32_t)(llvm_sub_u32(_16, 1)))))));
  llvm_cbe_d = llvm_cbe_conv15;
  if ((((llvm_cbe_conv15 != 0u)&1))) {

  _18 = llvm_cbe_d;
  return _18;
}
  _17 = llvm_cbe_base_2e_addr;
  llvm_cbe_d = (llvm_sub_u32(_17, 1));


}
  uint64_t llvm_cbe_conv;
  _3 = llvm_cbe_x_2e_addr;
  _4 = llvm_cbe_base_2e_addr;
  llvm_cbe_conv = ((int64_t)(int32_t)_4);
while (((int64_t)_3) >= ((int64_t)llvm_cbe_conv)){
  _5 = llvm_cbe_x_2e_addr;
while (_5 != UINT64_C(0)){

  _6 = llvm_cbe_x_2e_addr;
  _7 = llvm_cbe_base_2e_addr;
  _8 = llvm_cbe_d;
  llvm_cbe_d = (((uint32_t)(llvm_add_u64((((int64_t)(int32_t)_8)), (llvm_srem_u64(_6, (((int64_t)(int32_t)_7))))))));
  _9 = llvm_cbe_base_2e_addr;
  _10 = llvm_cbe_x_2e_addr;
  llvm_cbe_x_2e_addr = (llvm_sdiv_u64(_10, (((int64_t)(int32_t)_9))));

  _5 = llvm_cbe_x_2e_addr;
}

  _11 = llvm_cbe_d;
  llvm_cbe_x_2e_addr = (((int64_t)(int32_t)_11));
  _12 = llvm_cbe_pers_2e_addr;
  _13 = *_12;
  *_12 = (llvm_add_u32(_13, 1));

  _3 = llvm_cbe_x_2e_addr;
  _4 = llvm_cbe_base_2e_addr;
  llvm_cbe_conv = ((int64_t)(int32_t)_4);
}
  _18 = llvm_cbe_d;
  return _18;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_d;    /* Address-exposed local */
  uint32_t llvm_cbe_pers;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_4_uint64_t llvm_cbe_x __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _19;
  uint32_t _20;
  uint32_t _21;
  uint64_t _22;
  uint32_t llvm_cbe_call;
  uint32_t _23;
  uint64_t _24;
  uint32_t _25;
  uint32_t _26;
  uint32_t llvm_cbe_call3;
  uint32_t _27;

  llvm_cbe_retval = 0;
  ;
  ;
  ;
  ;
  _19 = memcpy((((uint8_t*)(&llvm_cbe_x))), ((uint8_t*)(&__const_OC_main_OC_x)), 32);
  llvm_cbe_i = 0;

  _20 = llvm_cbe_i;
while (((int32_t)_20) < ((int32_t)4u)){
  _21 = llvm_cbe_i;
  _22 = *((&llvm_cbe_x.array[((int64_t)(((int64_t)(int32_t)_21)))]));
  llvm_cbe_call = droot(_22, 10, (&llvm_cbe_pers));
  llvm_cbe_d = llvm_cbe_call;
  _23 = llvm_cbe_i;
  _24 = *((&llvm_cbe_x.array[((int64_t)(((int64_t)(int32_t)_23)))]));
  _25 = llvm_cbe_pers;
  _26 = llvm_cbe_d;
  llvm_cbe_call3 = printf(((&_OC_str.array[((int64_t)0)])), _24, _25, _26);

  _27 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_27, 1));

  _20 = llvm_cbe_i;
}
  return 0;
}

