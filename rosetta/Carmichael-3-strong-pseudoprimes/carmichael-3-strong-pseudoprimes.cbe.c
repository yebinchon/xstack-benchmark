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
struct l_array_10_uint8_t {
  uint8_t array[10];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t is_prime(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void carmichael3(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
int main(void) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
static struct l_array_10_uint8_t _OC_str = { "%d %d %d\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint32_t llvm_mul_u32(uint32_t a, uint32_t b) {
  uint32_t r = a * b;
  return r;
}
static __forceinline uint32_t llvm_sdiv_u32(int32_t a, int32_t b) {
  uint32_t r = a / b;
  return r;
}
static __forceinline uint32_t llvm_urem_u32(uint32_t a, uint32_t b) {
  uint32_t r = a % b;
  return r;
}
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}
static __forceinline uint32_t llvm_neg_u32(uint32_t a) {
  uint32_t r = -a;
  return r;
}


/* Function Bodies */

uint32_t is_prime(uint32_t llvm_cbe_n) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  uint32_t _3;
  uint32_t _4;
  uint32_t _5;
  uint32_t _6;
  uint32_t _7;
  uint32_t _8;
  uint32_t _9;
  uint32_t _10;
  uint32_t _11;
  uint32_t _12;
  uint32_t _13;

  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  _1 = llvm_cbe_n_2e_addr;
  if ((((((uint32_t)_1) <= ((uint32_t)3u))&1))) {
  _2 = llvm_cbe_n_2e_addr;
  llvm_cbe_retval = (((uint32_t)(bool)(((((uint32_t)_2) > ((uint32_t)1u))&1))));

  _13 = llvm_cbe_retval;
  return _13;
}
  _3 = llvm_cbe_n_2e_addr;
  if (!((((llvm_urem_u32(_3, 2)) != 0u)&1))) {
  llvm_cbe_retval = 0;

  _13 = llvm_cbe_retval;
  return _13;
}
  _4 = llvm_cbe_n_2e_addr;
  if (!((((llvm_urem_u32(_4, 3)) != 0u)&1))) {
  llvm_cbe_retval = 0;

  _13 = llvm_cbe_retval;
  return _13;
}
  ;
  llvm_cbe_i = 5;

  uint32_t llvm_cbe_mul;
  _5 = llvm_cbe_i;
  _6 = llvm_cbe_i;
  llvm_cbe_mul = llvm_mul_u32(_5, _6);
  _7 = llvm_cbe_n_2e_addr;
while (((uint32_t)llvm_cbe_mul) <= ((uint32_t)_7)){
  _8 = llvm_cbe_n_2e_addr;
  _9 = llvm_cbe_i;
  if (!((((llvm_urem_u32(_8, _9)) != 0u)&1))) {
  llvm_cbe_retval = 0;

  _13 = llvm_cbe_retval;
  return _13;
}
  _10 = llvm_cbe_n_2e_addr;
  _11 = llvm_cbe_i;
  if (!((((llvm_urem_u32(_10, (llvm_add_u32(_11, 2)))) != 0u)&1))) {
  llvm_cbe_retval = 0;

  _13 = llvm_cbe_retval;
  return _13;
}

  _12 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_12, 6));

  _5 = llvm_cbe_i;
  _6 = llvm_cbe_i;
  llvm_cbe_mul = llvm_mul_u32(_5, _6);
  _7 = llvm_cbe_n_2e_addr;
}
  llvm_cbe_retval = 1;

  _13 = llvm_cbe_retval;
  return _13;
}


void carmichael3(uint32_t llvm_cbe_p1) {
  uint32_t llvm_cbe_p1_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_h3;    /* Address-exposed local */
  uint32_t llvm_cbe_d;    /* Address-exposed local */
  uint32_t llvm_cbe_p2;    /* Address-exposed local */
  uint32_t llvm_cbe_p3;    /* Address-exposed local */
  uint32_t _14;
  uint32_t llvm_cbe_call;
  uint32_t _15;
  uint32_t _16;
  uint32_t _17;
  uint32_t _18;
  uint32_t _19;
  uint32_t _20;
  uint32_t _21;
  uint32_t _22;
  uint32_t _23;
  uint32_t _24;
  uint32_t _25;
  uint32_t _26;
  uint32_t _27;
  uint32_t _28;
  uint32_t _29;
  uint32_t _30;
  uint32_t _31;
  uint32_t _32;
  uint32_t _33;
  uint32_t _34;
  uint32_t _35;
  uint32_t llvm_cbe_call18;
  uint32_t _36;
  uint32_t _37;
  uint32_t _38;
  uint32_t _39;
  uint32_t llvm_cbe_call25;
  uint32_t _40;
  uint32_t _41;
  uint32_t _42;
  uint32_t _43;
  uint32_t _44;
  uint32_t _45;
  uint32_t llvm_cbe_call33;
  uint32_t _46;
  uint32_t _47;

  llvm_cbe_p1_2e_addr = llvm_cbe_p1;
  ;
  _14 = llvm_cbe_p1_2e_addr;
  llvm_cbe_call = is_prime(_14);
  if (!(((llvm_cbe_call != 0u)&1))) {

  return;
}
  ;
  ;
  ;
  ;
  llvm_cbe_h3 = 1;

  _15 = llvm_cbe_h3;
  _16 = llvm_cbe_p1_2e_addr;
while (((int32_t)_15) < ((int32_t)_16)){
  llvm_cbe_d = 1;

  uint32_t llvm_cbe_add;
  _17 = llvm_cbe_d;
  _18 = llvm_cbe_h3;
  _19 = llvm_cbe_p1_2e_addr;
  llvm_cbe_add = llvm_add_u32(_18, _19);
while (((int32_t)_17) < ((int32_t)llvm_cbe_add)){
  _20 = llvm_cbe_h3;
  _21 = llvm_cbe_p1_2e_addr;
  _22 = llvm_cbe_p1_2e_addr;
  _23 = llvm_cbe_d;
  if (((((llvm_srem_u32((llvm_mul_u32((llvm_add_u32(_20, _21)), (llvm_sub_u32(_22, 1)))), _23)) == 0u)&1))) {
  _24 = llvm_cbe_p1_2e_addr;
  _25 = llvm_cbe_p1_2e_addr;
  _26 = llvm_cbe_h3;
  _27 = llvm_cbe_h3;
  _28 = llvm_cbe_h3;
  _29 = llvm_cbe_d;
  _30 = llvm_cbe_h3;
  if (((((llvm_srem_u32((llvm_add_u32((llvm_srem_u32((llvm_mul_u32((llvm_neg_u32(_24)), _25)), _26)), _27)), _28)) == (llvm_srem_u32(_29, _30)))&1))) {
  _31 = llvm_cbe_p1_2e_addr;
  _32 = llvm_cbe_h3;
  _33 = llvm_cbe_p1_2e_addr;
  _34 = llvm_cbe_d;
  llvm_cbe_p2 = (llvm_add_u32(1, (llvm_sdiv_u32((llvm_mul_u32((llvm_sub_u32(_31, 1)), (llvm_add_u32(_32, _33)))), _34))));
  _35 = llvm_cbe_p2;
  llvm_cbe_call18 = is_prime(_35);
  if ((((llvm_cbe_call18 != 0u)&1))) {
  _36 = llvm_cbe_p1_2e_addr;
  _37 = llvm_cbe_p2;
  _38 = llvm_cbe_h3;
  llvm_cbe_p3 = (llvm_add_u32(1, (llvm_sdiv_u32((llvm_mul_u32(_36, _37)), _38))));
  _39 = llvm_cbe_p3;
  llvm_cbe_call25 = is_prime(_39);
  if ((((llvm_cbe_call25 != 0u)&1))) {
  _40 = llvm_cbe_p2;
  _41 = llvm_cbe_p3;
  _42 = llvm_cbe_p1_2e_addr;
  if (((((llvm_srem_u32((llvm_mul_u32(_40, _41)), (llvm_sub_u32(_42, 1)))) != 1u)&1))) {

  } else {
  _43 = llvm_cbe_p1_2e_addr;
  _44 = llvm_cbe_p2;
  _45 = llvm_cbe_p3;
  llvm_cbe_call33 = printf(((&_OC_str.array[((int64_t)0)])), _43, _44, _45);


}
  } else {

}
  } else {

}
  } else {

}
  } else {

}
  _46 = llvm_cbe_d;
  llvm_cbe_d = (llvm_add_u32(_46, 1));

  _17 = llvm_cbe_d;
  _18 = llvm_cbe_h3;
  _19 = llvm_cbe_p1_2e_addr;
  llvm_cbe_add = llvm_add_u32(_18, _19);
}

  _47 = llvm_cbe_h3;
  llvm_cbe_h3 = (llvm_add_u32(_47, 1));

  _15 = llvm_cbe_h3;
  _16 = llvm_cbe_p1_2e_addr;
}

  return;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_p1;    /* Address-exposed local */
  uint32_t _48;
  uint32_t _49;
  uint32_t _50;

  llvm_cbe_retval = 0;
  ;
  llvm_cbe_p1 = 2;

  _48 = llvm_cbe_p1;
while (((int32_t)_48) < ((int32_t)62u)){
  _49 = llvm_cbe_p1;
  carmichael3(_49);

  _50 = llvm_cbe_p1;
  llvm_cbe_p1 = (llvm_add_u32(_50, 1));

  _48 = llvm_cbe_p1;
}
  return 0;
}

