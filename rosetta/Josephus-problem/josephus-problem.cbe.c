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
struct l_array_40_uint8_t {
  uint8_t array[40];
};
struct l_array_37_uint8_t {
  uint8_t array[37];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t jos(uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint64_t jos_large(uint64_t, uint64_t, uint64_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint32_t putchar(uint32_t);


/* Global Variable Definitions and Initialization */
static struct l_array_40_uint8_t _OC_str = { "n = %llu, k = %llu, final survivor: %d\n" };
static struct l_array_37_uint8_t _OC_str_OC_1 = { "n = %llu, k = %llu, three survivors:" };
static struct l_array_6_uint8_t _OC_str_OC_2 = { " %llu" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_sub_u64(uint64_t a, uint64_t b) {
  uint64_t r = a - b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint64_t llvm_udiv_u64(uint64_t a, uint64_t b) {
  uint64_t r = a / b;
  return r;
}
static __forceinline uint64_t llvm_urem_u64(uint64_t a, uint64_t b) {
  uint64_t r = a % b;
  return r;
}
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

uint32_t jos(uint32_t llvm_cbe_n, uint32_t llvm_cbe_k, uint32_t llvm_cbe_m) {
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_k_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_m_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_a;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  uint32_t _3;
  uint32_t _4;
  uint32_t _5;
  uint32_t _6;
  uint32_t _7;
  uint32_t _8;

  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  llvm_cbe_k_2e_addr = llvm_cbe_k;
  ;
  llvm_cbe_m_2e_addr = llvm_cbe_m;
  ;
  ;
  _1 = llvm_cbe_m_2e_addr;
  llvm_cbe_a = (llvm_add_u32(_1, 1));

  _2 = llvm_cbe_a;
  _3 = llvm_cbe_n_2e_addr;
while (((int32_t)_2) <= ((int32_t)_3)){
  _4 = llvm_cbe_m_2e_addr;
  _5 = llvm_cbe_k_2e_addr;
  _6 = llvm_cbe_a;
  llvm_cbe_m_2e_addr = (llvm_srem_u32((llvm_add_u32(_4, _5)), _6));

  _7 = llvm_cbe_a;
  llvm_cbe_a = (llvm_add_u32(_7, 1));

  _2 = llvm_cbe_a;
  _3 = llvm_cbe_n_2e_addr;
}
  _8 = llvm_cbe_m_2e_addr;
  return _8;
}


uint64_t jos_large(uint64_t llvm_cbe_n, uint64_t llvm_cbe_k, uint64_t llvm_cbe_m) {
  uint64_t llvm_cbe_retval;    /* Address-exposed local */
  uint64_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint64_t llvm_cbe_k_2e_addr;    /* Address-exposed local */
  uint64_t llvm_cbe_m_2e_addr;    /* Address-exposed local */
  uint64_t llvm_cbe_a;    /* Address-exposed local */
  uint64_t llvm_cbe_q;    /* Address-exposed local */
  uint64_t _9;
  uint64_t _10;
  uint64_t _11;
  uint64_t _12;
  uint64_t _13;
  uint64_t _14;
  uint64_t _15;
  uint64_t _16;
  uint64_t _17;
  uint64_t _18;
  uint64_t _19;
  uint64_t _20;
  uint64_t _21;
  uint64_t _22;
  uint64_t _23;
  uint64_t _24;
  uint64_t _25;
  uint64_t _26;
  uint64_t _27;
  uint64_t _28;
  uint64_t _29;
  uint64_t llvm_cbe_add14;
  uint64_t _30;
  uint64_t _31;

  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  llvm_cbe_k_2e_addr = llvm_cbe_k;
  ;
  llvm_cbe_m_2e_addr = llvm_cbe_m;
  ;
  _9 = llvm_cbe_k_2e_addr;
  if ((((((uint64_t)_9) <= ((uint64_t)UINT64_C(1)))&1))) {
  _10 = llvm_cbe_n_2e_addr;
  _11 = llvm_cbe_m_2e_addr;
  llvm_cbe_retval = (llvm_sub_u64((llvm_sub_u64(_10, _11)), 1));

  _31 = llvm_cbe_retval;
  return _31;
}
  ;
  _12 = llvm_cbe_m_2e_addr;
  llvm_cbe_a = _12;

  _13 = llvm_cbe_a;
  _14 = llvm_cbe_n_2e_addr;
while (((uint64_t)_13) < ((uint64_t)_14)){
  ;
  _15 = llvm_cbe_a;
  _16 = llvm_cbe_m_2e_addr;
  _17 = llvm_cbe_k_2e_addr;
  _18 = llvm_cbe_k_2e_addr;
  llvm_cbe_q = (llvm_udiv_u64((llvm_sub_u64((llvm_add_u64((llvm_sub_u64(_15, _16)), _17)), 2)), (llvm_sub_u64(_18, 1))));
  _19 = llvm_cbe_a;
  _20 = llvm_cbe_q;
  _21 = llvm_cbe_n_2e_addr;
  if ((((((uint64_t)(llvm_add_u64(_19, _20))) > ((uint64_t)_21))&1))) {
  _22 = llvm_cbe_n_2e_addr;
  _23 = llvm_cbe_a;
  llvm_cbe_q = (llvm_sub_u64(_22, _23));

  } else {
  _24 = llvm_cbe_q;
  if (!(((_24 != UINT64_C(0))&1))) {
  llvm_cbe_q = 1;

}

}
  _25 = llvm_cbe_m_2e_addr;
  _26 = llvm_cbe_q;
  _27 = llvm_cbe_k_2e_addr;
  _28 = llvm_cbe_q;
  _29 = llvm_cbe_a;
  llvm_cbe_add14 = llvm_add_u64(_29, _28);
  llvm_cbe_a = llvm_cbe_add14;
  llvm_cbe_m_2e_addr = (llvm_urem_u64((llvm_add_u64(_25, (llvm_mul_u64(_26, _27)))), llvm_cbe_add14));

  _13 = llvm_cbe_a;
  _14 = llvm_cbe_n_2e_addr;
}
  _30 = llvm_cbe_m_2e_addr;
  llvm_cbe_retval = _30;

  _31 = llvm_cbe_retval;
  return _31;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint64_t llvm_cbe_n;    /* Address-exposed local */
  uint64_t llvm_cbe_k;    /* Address-exposed local */
  uint64_t llvm_cbe_i;    /* Address-exposed local */
  uint64_t _32;
  uint64_t _33;
  uint64_t _34;
  uint64_t _35;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call2;
  uint64_t _36;
  uint64_t _37;
  uint32_t llvm_cbe_call3;
  uint64_t _38;
  uint64_t _39;
  uint64_t _40;
  uint64_t _41;
  uint64_t llvm_cbe_call4;
  uint32_t llvm_cbe_call5;
  uint32_t llvm_cbe_call6;

  llvm_cbe_retval = 0;
  ;
  ;
  ;
  llvm_cbe_n = 41;
  llvm_cbe_k = 3;
  _32 = llvm_cbe_n;
  _33 = llvm_cbe_k;
  _34 = llvm_cbe_n;
  _35 = llvm_cbe_k;
  llvm_cbe_call = jos((((uint32_t)_34)), (((uint32_t)_35)), 0);
  llvm_cbe_call2 = printf(((&_OC_str.array[((int64_t)0)])), _32, _33, llvm_cbe_call);
  llvm_cbe_n = UINT64_C(9876543210987654321);
  llvm_cbe_k = 12031;
  _36 = llvm_cbe_n;
  _37 = llvm_cbe_k;
  llvm_cbe_call3 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _36, _37);
  llvm_cbe_i = 3;

  uint64_t llvm_cbe_dec;
  _38 = llvm_cbe_i;
  llvm_cbe_dec = llvm_add_u64(_38, -1);
  llvm_cbe_i = (llvm_add_u64(_38, -1));
while (_38 != UINT64_C(0)){
  _39 = llvm_cbe_n;
  _40 = llvm_cbe_k;
  _41 = llvm_cbe_i;
  llvm_cbe_call4 = jos_large(_39, _40, _41);
  llvm_cbe_call5 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), llvm_cbe_call4);

  _38 = llvm_cbe_i;
  llvm_cbe_dec = llvm_add_u64(_38, -1);
  llvm_cbe_i = (llvm_add_u64(_38, -1));
}
  llvm_cbe_call6 = putchar(10);
  return 0;
}

