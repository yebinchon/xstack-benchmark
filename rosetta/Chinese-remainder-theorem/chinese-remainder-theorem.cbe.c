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
struct l_array_3_uint32_t {
  uint32_t array[3];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t mul_inv(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t chinese_remainder(uint32_t*, uint32_t*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_3_uint32_t __const_OC_main_OC_n = { { 3, 5, 7 } };
static struct l_array_3_uint32_t __const_OC_main_OC_a = { { 2, 3, 2 } };
static struct l_array_4_uint8_t _OC_str = { "%d\n" };


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
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

uint32_t mul_inv(uint32_t llvm_cbe_a, uint32_t llvm_cbe_b) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_a_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_b_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_b0;    /* Address-exposed local */
  uint32_t llvm_cbe_t;    /* Address-exposed local */
  uint32_t llvm_cbe_q;    /* Address-exposed local */
  uint32_t llvm_cbe_x0;    /* Address-exposed local */
  uint32_t llvm_cbe_x1;    /* Address-exposed local */
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
  uint32_t _14;
  uint32_t _15;
  uint32_t _16;
  uint32_t _17;
  uint32_t _18;
  uint32_t _19;

  llvm_cbe_a_2e_addr = llvm_cbe_a;
  ;
  llvm_cbe_b_2e_addr = llvm_cbe_b;
  ;
  ;
  _1 = llvm_cbe_b_2e_addr;
  llvm_cbe_b0 = _1;
  ;
  ;
  ;
  llvm_cbe_x0 = 0;
  ;
  llvm_cbe_x1 = 1;
  _2 = llvm_cbe_b_2e_addr;
  if ((((_2 == 1u)&1))) {
  llvm_cbe_retval = 1;

  _19 = llvm_cbe_retval;
  return _19;
}

  _3 = llvm_cbe_a_2e_addr;
while (((int32_t)_3) > ((int32_t)1u)){
  _4 = llvm_cbe_a_2e_addr;
  _5 = llvm_cbe_b_2e_addr;
  llvm_cbe_q = (llvm_sdiv_u32(_4, _5));
  _6 = llvm_cbe_b_2e_addr;
  llvm_cbe_t = _6;
  _7 = llvm_cbe_a_2e_addr;
  _8 = llvm_cbe_b_2e_addr;
  llvm_cbe_b_2e_addr = (llvm_srem_u32(_7, _8));
  _9 = llvm_cbe_t;
  llvm_cbe_a_2e_addr = _9;
  _10 = llvm_cbe_x0;
  llvm_cbe_t = _10;
  _11 = llvm_cbe_x1;
  _12 = llvm_cbe_q;
  _13 = llvm_cbe_x0;
  llvm_cbe_x0 = (llvm_sub_u32(_11, (llvm_mul_u32(_12, _13))));
  _14 = llvm_cbe_t;
  llvm_cbe_x1 = _14;

  _3 = llvm_cbe_a_2e_addr;
}
  _15 = llvm_cbe_x1;
  if (!(((((int32_t)_15) < ((int32_t)0u))&1))) {
  _16 = llvm_cbe_b0;
  _17 = llvm_cbe_x1;
  llvm_cbe_x1 = (llvm_add_u32(_17, _16));

}
  _18 = llvm_cbe_x1;
  llvm_cbe_retval = _18;

  _19 = llvm_cbe_retval;
  return _19;
}


uint32_t chinese_remainder(uint32_t* llvm_cbe_n, uint32_t* llvm_cbe_a, uint32_t llvm_cbe_len) {
  uint32_t* llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint32_t* llvm_cbe_a_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_len_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_p;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_prod;    /* Address-exposed local */
  uint32_t llvm_cbe_sum;    /* Address-exposed local */
  uint32_t _20;
  uint32_t _21;
  uint32_t* _22;
  uint32_t _23;
  uint32_t _24;
  uint32_t _25;
  uint32_t _26;
  uint32_t _27;
  uint32_t _28;
  uint32_t _29;
  uint32_t* _30;
  uint32_t _31;
  uint32_t _32;
  uint32_t* _33;
  uint32_t _34;
  uint32_t _35;
  uint32_t _36;
  uint32_t* _37;
  uint32_t _38;
  uint32_t _39;
  uint32_t llvm_cbe_call;
  uint32_t _40;
  uint32_t _41;
  uint32_t _42;
  uint32_t _43;
  uint32_t _44;

  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  llvm_cbe_a_2e_addr = llvm_cbe_a;
  ;
  llvm_cbe_len_2e_addr = llvm_cbe_len;
  ;
  ;
  ;
  ;
  llvm_cbe_prod = 1;
  ;
  llvm_cbe_sum = 0;
  llvm_cbe_i = 0;

  _20 = llvm_cbe_i;
  _21 = llvm_cbe_len_2e_addr;
while (((int32_t)_20) < ((int32_t)_21)){
  _22 = llvm_cbe_n_2e_addr;
  _23 = llvm_cbe_i;
  _24 = *((&_22[((int64_t)(((int64_t)(int32_t)_23)))]));
  _25 = llvm_cbe_prod;
  llvm_cbe_prod = (llvm_mul_u32(_25, _24));

  _26 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_26, 1));

  _20 = llvm_cbe_i;
  _21 = llvm_cbe_len_2e_addr;
}
  llvm_cbe_i = 0;

  _27 = llvm_cbe_i;
  _28 = llvm_cbe_len_2e_addr;
while (((int32_t)_27) < ((int32_t)_28)){
  _29 = llvm_cbe_prod;
  _30 = llvm_cbe_n_2e_addr;
  _31 = llvm_cbe_i;
  _32 = *((&_30[((int64_t)(((int64_t)(int32_t)_31)))]));
  llvm_cbe_p = (llvm_sdiv_u32(_29, _32));
  _33 = llvm_cbe_a_2e_addr;
  _34 = llvm_cbe_i;
  _35 = *((&_33[((int64_t)(((int64_t)(int32_t)_34)))]));
  _36 = llvm_cbe_p;
  _37 = llvm_cbe_n_2e_addr;
  _38 = llvm_cbe_i;
  _39 = *((&_37[((int64_t)(((int64_t)(int32_t)_38)))]));
  llvm_cbe_call = mul_inv(_36, _39);
  _40 = llvm_cbe_p;
  _41 = llvm_cbe_sum;
  llvm_cbe_sum = (llvm_add_u32(_41, (llvm_mul_u32((llvm_mul_u32(_35, llvm_cbe_call)), _40))));

  _42 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_42, 1));

  _27 = llvm_cbe_i;
  _28 = llvm_cbe_len_2e_addr;
}
  _43 = llvm_cbe_sum;
  _44 = llvm_cbe_prod;
  return (llvm_srem_u32(_43, _44));
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  struct l_array_3_uint32_t llvm_cbe_n;    /* Address-exposed local */
  struct l_array_3_uint32_t llvm_cbe_a;    /* Address-exposed local */
  uint8_t* _45;
  uint8_t* _46;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call2;

  llvm_cbe_retval = 0;
  ;
  _45 = memcpy((((uint8_t*)(&llvm_cbe_n))), ((uint8_t*)(&__const_OC_main_OC_n)), 12);
  ;
  _46 = memcpy((((uint8_t*)(&llvm_cbe_a))), ((uint8_t*)(&__const_OC_main_OC_a)), 12);
  llvm_cbe_call = chinese_remainder(((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_a.array[((int64_t)0)])), 3);
  llvm_cbe_call2 = printf(((&_OC_str.array[((int64_t)0)])), llvm_cbe_call);
  return 0;
}

