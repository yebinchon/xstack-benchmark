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
struct l_array_10_uint8_t {
  uint8_t array[10];
};
struct l_array_64_uint8_t {
  uint8_t array[64];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t isBal(uint8_t*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void shuffle(uint8_t*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t rand(void) __ATTRIBUTELIST__((nothrow));
void genSeq(uint8_t*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void doSeq(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_6_uint8_t _OC_str = { "False" };
static struct l_array_5_uint8_t _OC_str_OC_1 = { "True" };
static struct l_array_10_uint8_t _OC_str_OC_2 = { "'%s': %s\n" };


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

uint32_t isBal(uint8_t* llvm_cbe_s, uint32_t llvm_cbe_l) {
  uint8_t* llvm_cbe_s_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_l_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_c;    /* Address-exposed local */
  uint32_t _1;
  uint8_t* _2;
  uint32_t _3;
  uint8_t _4;
  uint32_t _5;
  uint8_t* _6;
  uint32_t _7;
  uint8_t _8;
  uint32_t _9;
  uint32_t llvm_cbe_dec8;
  uint32_t _10;

  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  llvm_cbe_l_2e_addr = llvm_cbe_l;
  ;
  ;
  llvm_cbe_c = 0;

  uint32_t llvm_cbe_dec;
  _1 = llvm_cbe_l_2e_addr;
  llvm_cbe_dec = llvm_add_u32(_1, -1);
  llvm_cbe_l_2e_addr = (llvm_add_u32(_1, -1));
while (_1 != 0u){
  _2 = llvm_cbe_s_2e_addr;
  _3 = llvm_cbe_l_2e_addr;
  _4 = *((&_2[((int64_t)(((int64_t)(int32_t)_3)))]));
  if (((((((int32_t)(int8_t)_4)) == 93u)&1))) {
  _5 = llvm_cbe_c;
  llvm_cbe_c = (llvm_add_u32(_5, 1));


  _1 = llvm_cbe_l_2e_addr;
  llvm_cbe_l_2e_addr = (llvm_add_u32(_1, -1));
  if (!(((_1 != 0u)&1))) {
  }

  } else {
  _6 = llvm_cbe_s_2e_addr;
  _7 = llvm_cbe_l_2e_addr;
  _8 = *((&_6[((int64_t)(((int64_t)(int32_t)_7)))]));
  if (((((((int32_t)(int8_t)_8)) == 91u)&1))) {
  _9 = llvm_cbe_c;
  llvm_cbe_dec8 = llvm_add_u32(_9, -1);
  llvm_cbe_c = llvm_cbe_dec8;
  if ((((((int32_t)llvm_cbe_dec8) < ((int32_t)0u))&1))) {
  _10 = llvm_cbe_c;
  return (((uint32_t)(bool)(((~((((_10 != 0u)&1))))&1))));
}


  } else {
}
}
  _1 = llvm_cbe_l_2e_addr;
  llvm_cbe_dec = llvm_add_u32(_1, -1);
  llvm_cbe_l_2e_addr = (llvm_add_u32(_1, -1));
}

  _10 = llvm_cbe_c;
  return (((uint32_t)(bool)(((~((((_10 != 0u)&1))))&1))));
}


void shuffle(uint8_t* llvm_cbe_s, uint32_t llvm_cbe_h) {
  uint8_t* llvm_cbe_s_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_h_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_x;    /* Address-exposed local */
  uint32_t llvm_cbe_t;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t _11;
  uint32_t _12;
  uint8_t* _13;
  uint32_t llvm_cbe_call;
  uint32_t _14;
  uint32_t llvm_cbe_rem;
  uint8_t _15;
  uint8_t* _16;
  uint32_t _17;
  uint8_t _18;
  uint8_t* _19;
  uint32_t _20;
  uint32_t _21;
  uint8_t* _22;
  uint32_t _23;

  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  llvm_cbe_h_2e_addr = llvm_cbe_h;
  ;
  ;
  ;
  ;
  _11 = llvm_cbe_h_2e_addr;
  llvm_cbe_i = _11;

  uint32_t llvm_cbe_dec;
  _12 = llvm_cbe_i;
  llvm_cbe_dec = llvm_add_u32(_12, -1);
  llvm_cbe_i = (llvm_add_u32(_12, -1));
while (_12 != 0u){
  _13 = llvm_cbe_s_2e_addr;
  llvm_cbe_call = rand();
  _14 = llvm_cbe_h_2e_addr;
  llvm_cbe_rem = llvm_srem_u32(llvm_cbe_call, _14);
  llvm_cbe_x = llvm_cbe_rem;
  _15 = *((&_13[((int64_t)(((int64_t)(int32_t)llvm_cbe_rem)))]));
  llvm_cbe_t = (((int32_t)(int8_t)_15));
  _16 = llvm_cbe_s_2e_addr;
  _17 = llvm_cbe_i;
  _18 = *((&_16[((int64_t)(((int64_t)(int32_t)_17)))]));
  _19 = llvm_cbe_s_2e_addr;
  _20 = llvm_cbe_x;
  *((&_19[((int64_t)(((int64_t)(int32_t)_20)))])) = _18;
  _21 = llvm_cbe_t;
  _22 = llvm_cbe_s_2e_addr;
  _23 = llvm_cbe_i;
  *((&_22[((int64_t)(((int64_t)(int32_t)_23)))])) = (((uint8_t)_21));

  _12 = llvm_cbe_i;
  llvm_cbe_dec = llvm_add_u32(_12, -1);
  llvm_cbe_i = (llvm_add_u32(_12, -1));
}
  return;
}


void genSeq(uint8_t* llvm_cbe_s, uint32_t llvm_cbe_n) {
  uint8_t* llvm_cbe_s_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint32_t _24;
  uint8_t* _25;
  uint32_t _26;
  uint8_t* _27;
  uint8_t* _28;
  uint32_t _29;
  uint32_t _30;
  uint8_t* _31;
  uint8_t* _32;
  uint32_t _33;
  uint8_t* _34;
  uint32_t _35;

  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  _24 = llvm_cbe_n_2e_addr;
  if ((((_24 != 0u)&1))) {
  _25 = llvm_cbe_s_2e_addr;
  _26 = llvm_cbe_n_2e_addr;
  _27 = memset(_25, 91, (((int64_t)(int32_t)_26)));
  _28 = llvm_cbe_s_2e_addr;
  _29 = llvm_cbe_n_2e_addr;
  _30 = llvm_cbe_n_2e_addr;
  _31 = memset(((&_28[((int64_t)(((int64_t)(int32_t)_29)))])), 93, (((int64_t)(int32_t)_30)));
  _32 = llvm_cbe_s_2e_addr;
  _33 = llvm_cbe_n_2e_addr;
  shuffle(_32, (llvm_mul_u32(_33, 2)));

  _34 = llvm_cbe_s_2e_addr;
  _35 = llvm_cbe_n_2e_addr;
  *((&_34[((int64_t)(((int64_t)(int32_t)(llvm_mul_u32(_35, 2)))))])) = 0;
}
  _34 = llvm_cbe_s_2e_addr;
  _35 = llvm_cbe_n_2e_addr;
  *((&_34[((int64_t)(((int64_t)(int32_t)(llvm_mul_u32(_35, 2)))))])) = 0;
}


void doSeq(uint32_t llvm_cbe_n) {
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_64_uint8_t llvm_cbe_s __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* llvm_cbe_o;    /* Address-exposed local */
  uint32_t _36;
  uint32_t _37;
  uint32_t llvm_cbe_call;
  uint8_t* _38;
  uint32_t llvm_cbe_call3;

  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  ;
  ;
  llvm_cbe_o = ((&_OC_str.array[((int64_t)0)]));
  _36 = llvm_cbe_n_2e_addr;
  genSeq(((&llvm_cbe_s.array[((int64_t)0)])), _36);
  _37 = llvm_cbe_n_2e_addr;
  llvm_cbe_call = isBal(((&llvm_cbe_s.array[((int64_t)0)])), (llvm_mul_u32(_37, 2)));
  if ((((llvm_cbe_call != 0u)&1))) {
  llvm_cbe_o = ((&_OC_str_OC_1.array[((int64_t)0)]));

  _38 = llvm_cbe_o;
  llvm_cbe_call3 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), ((&llvm_cbe_s.array[((int64_t)0)])), _38);
}
  _38 = llvm_cbe_o;
  llvm_cbe_call3 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), ((&llvm_cbe_s.array[((int64_t)0)])), _38);
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_n;    /* Address-exposed local */
  uint32_t _39;
  uint32_t _40;

  llvm_cbe_retval = 0;
  ;
  llvm_cbe_n = 0;

  _39 = llvm_cbe_n;
while (((int32_t)_39) < ((int32_t)9u)){
  _40 = llvm_cbe_n;
  llvm_cbe_n = (llvm_add_u32(_40, 1));
  doSeq(_40);

  _39 = llvm_cbe_n;
}
  return 0;
}

