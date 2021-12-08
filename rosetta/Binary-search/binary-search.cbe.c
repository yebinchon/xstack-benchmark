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
struct l_array_10_uint32_t {
  uint32_t array[10];
};
struct l_array_19_uint8_t {
  uint8_t array[19];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t bsearch(uint32_t*, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t bsearch_r(uint32_t*, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static __MSALIGN__(16) struct l_array_10_uint32_t __const_OC_main_OC_a __attribute__((aligned(16))) = { { -31, 0, 1, 2, 2, 4, 65, 83, 99, 782 } };
static struct l_array_19_uint8_t _OC_str = { "%d is at index %d\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint32_t llvm_sdiv_u32(int32_t a, int32_t b) {
  uint32_t r = a / b;
  return r;
}


/* Function Bodies */

uint32_t bsearch(uint32_t* llvm_cbe_a, uint32_t llvm_cbe_n, uint32_t llvm_cbe_x) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t* llvm_cbe_a_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_x_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint32_t llvm_cbe_k;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  uint32_t _3;
  uint32_t _4;
  uint32_t _5;
  uint32_t _6;
  uint32_t* _7;
  uint32_t _8;
  uint32_t _9;
  uint32_t _10;
  uint32_t _11;
  uint32_t* _12;
  uint32_t _13;
  uint32_t _14;
  uint32_t _15;
  uint32_t _16;
  uint32_t _17;
  uint32_t _18;

  llvm_cbe_a_2e_addr = llvm_cbe_a;
  ;
  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  llvm_cbe_x_2e_addr = llvm_cbe_x;
  ;
  ;
  llvm_cbe_i = 0;
  ;
  _1 = llvm_cbe_n_2e_addr;
  llvm_cbe_j = (llvm_sub_u32(_1, 1));

  _2 = llvm_cbe_i;
  _3 = llvm_cbe_j;
while (((int32_t)_2) <= ((int32_t)_3)){
  ;
  _4 = llvm_cbe_i;
  _5 = llvm_cbe_j;
  _6 = llvm_cbe_i;
  llvm_cbe_k = (llvm_add_u32(_4, (llvm_sdiv_u32((llvm_sub_u32(_5, _6)), 2))));
  _7 = llvm_cbe_a_2e_addr;
  _8 = llvm_cbe_k;
  _9 = *((&_7[((int64_t)(((int64_t)(int32_t)_8)))]));
  _10 = llvm_cbe_x_2e_addr;
  if ((((_9 == _10)&1))) {
  _11 = llvm_cbe_k;
  llvm_cbe_retval = _11;
  _18 = llvm_cbe_retval;
  return _18;
}
  _12 = llvm_cbe_a_2e_addr;
  _13 = llvm_cbe_k;
  _14 = *((&_12[((int64_t)(((int64_t)(int32_t)_13)))]));
  _15 = llvm_cbe_x_2e_addr;
  if ((((((int32_t)_14) < ((int32_t)_15))&1))) {
  _16 = llvm_cbe_k;
  llvm_cbe_i = (llvm_add_u32(_16, 1));

  } else {
  _17 = llvm_cbe_k;
  llvm_cbe_j = (llvm_sub_u32(_17, 1));

}


  _2 = llvm_cbe_i;
  _3 = llvm_cbe_j;
}
  llvm_cbe_retval = -1;

  _18 = llvm_cbe_retval;
  return _18;
}


uint32_t bsearch_r(uint32_t* llvm_cbe_a, uint32_t llvm_cbe_x, uint32_t llvm_cbe_i, uint32_t llvm_cbe_j) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t* llvm_cbe_a_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_x_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_j_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_k;    /* Address-exposed local */
  uint32_t _19;
  uint32_t _20;
  uint32_t _21;
  uint32_t _22;
  uint32_t _23;
  uint32_t* _24;
  uint32_t _25;
  uint32_t _26;
  uint32_t _27;
  uint32_t _28;
  uint32_t* _29;
  uint32_t _30;
  uint32_t _31;
  uint32_t _32;
  uint32_t* _33;
  uint32_t _34;
  uint32_t _35;
  uint32_t _36;
  uint32_t llvm_cbe_call;
  uint32_t* _37;
  uint32_t _38;
  uint32_t _39;
  uint32_t _40;
  uint32_t llvm_cbe_call10;
  uint32_t _41;

  llvm_cbe_a_2e_addr = llvm_cbe_a;
  ;
  llvm_cbe_x_2e_addr = llvm_cbe_x;
  ;
  llvm_cbe_i_2e_addr = llvm_cbe_i;
  ;
  llvm_cbe_j_2e_addr = llvm_cbe_j;
  ;
  _19 = llvm_cbe_j_2e_addr;
  _20 = llvm_cbe_i_2e_addr;
  if ((((((int32_t)_19) < ((int32_t)_20))&1))) {
  llvm_cbe_retval = -1;

  _41 = llvm_cbe_retval;
  return _41;
}
  ;
  _21 = llvm_cbe_i_2e_addr;
  _22 = llvm_cbe_j_2e_addr;
  _23 = llvm_cbe_i_2e_addr;
  llvm_cbe_k = (llvm_add_u32(_21, (llvm_sdiv_u32((llvm_sub_u32(_22, _23)), 2))));
  _24 = llvm_cbe_a_2e_addr;
  _25 = llvm_cbe_k;
  _26 = *((&_24[((int64_t)(((int64_t)(int32_t)_25)))]));
  _27 = llvm_cbe_x_2e_addr;
  if ((((_26 == _27)&1))) {
  _28 = llvm_cbe_k;
  llvm_cbe_retval = _28;

  _41 = llvm_cbe_retval;
  return _41;
}
  _29 = llvm_cbe_a_2e_addr;
  _30 = llvm_cbe_k;
  _31 = *((&_29[((int64_t)(((int64_t)(int32_t)_30)))]));
  _32 = llvm_cbe_x_2e_addr;
  if ((((((int32_t)_31) < ((int32_t)_32))&1))) {
  _33 = llvm_cbe_a_2e_addr;
  _34 = llvm_cbe_x_2e_addr;
  _35 = llvm_cbe_k;
  _36 = llvm_cbe_j_2e_addr;
  llvm_cbe_call = bsearch_r(_33, _34, (llvm_add_u32(_35, 1)), _36);
  llvm_cbe_retval = llvm_cbe_call;

  } else {
  _37 = llvm_cbe_a_2e_addr;
  _38 = llvm_cbe_x_2e_addr;
  _39 = llvm_cbe_i_2e_addr;
  _40 = llvm_cbe_k;
  llvm_cbe_call10 = bsearch_r(_37, _38, _39, (llvm_sub_u32(_40, 1)));
  llvm_cbe_retval = llvm_cbe_call10;

}
  _41 = llvm_cbe_retval;
  return _41;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_10_uint32_t llvm_cbe_a __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_n;    /* Address-exposed local */
  uint32_t llvm_cbe_x;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint8_t* _42;
  uint32_t _43;
  uint32_t _44;
  uint32_t llvm_cbe_call;
  uint32_t _45;
  uint32_t _46;
  uint32_t llvm_cbe_call1;
  uint32_t _47;
  uint32_t _48;
  uint32_t llvm_cbe_call3;
  uint32_t _49;
  uint32_t _50;
  uint32_t llvm_cbe_call4;

  llvm_cbe_retval = 0;
  ;
  _42 = memcpy((((uint8_t*)(&llvm_cbe_a))), ((uint8_t*)(&__const_OC_main_OC_a)), 40);
  ;
  llvm_cbe_n = 10;
  ;
  llvm_cbe_x = 2;
  ;
  _43 = llvm_cbe_n;
  _44 = llvm_cbe_x;
  llvm_cbe_call = bsearch(((&llvm_cbe_a.array[((int64_t)0)])), _43, _44);
  llvm_cbe_i = llvm_cbe_call;
  _45 = llvm_cbe_x;
  _46 = llvm_cbe_i;
  llvm_cbe_call1 = printf(((&_OC_str.array[((int64_t)0)])), _45, _46);
  llvm_cbe_x = 5;
  _47 = llvm_cbe_x;
  _48 = llvm_cbe_n;
  llvm_cbe_call3 = bsearch_r(((&llvm_cbe_a.array[((int64_t)0)])), _47, 0, (llvm_sub_u32(_48, 1)));
  llvm_cbe_i = llvm_cbe_call3;
  _49 = llvm_cbe_x;
  _50 = llvm_cbe_i;
  llvm_cbe_call4 = printf(((&_OC_str.array[((int64_t)0)])), _49, _50);
  return 0;
}

