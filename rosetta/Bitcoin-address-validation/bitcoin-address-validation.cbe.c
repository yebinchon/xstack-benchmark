/* Provide Declarations */
#include <stdint.h>
#ifndef __cplusplus
typedef unsigned char bool;
#endif

#ifndef _MSC_VER
#define __forceinline __attribute__((always_inline)) inline
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
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
struct l_array_59_uint8_t {
  uint8_t array[59];
};
struct l_array_9_uint8_t {
  uint8_t array[9];
};
struct l_array_17_uint8_t {
  uint8_t array[17];
};
struct l_array_1_uint8_t {
  uint8_t array[1];
};
struct l_array_11_uint8_t {
  uint8_t array[11];
};
struct l_array_35_uint8_t {
  uint8_t array[35];
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_32_uint8_t {
  uint8_t array[32];
};
struct l_array_5_uint8_t_KC_ {
  uint8_t* array[5];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t unbase58(uint8_t*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* strchr(uint8_t*, uint32_t) __ATTRIBUTELIST__((nothrow, pure));
uint32_t valid(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* SHA256(uint8_t*, uint64_t, uint8_t*);
uint32_t memcmp(uint8_t*, uint8_t*, uint64_t) __ATTRIBUTELIST__((nothrow, pure));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_59_uint8_t _OC_str = { "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz" };
static struct l_array_9_uint8_t _OC_str_OC_1 = { "bad char" };
uint8_t* coin_err __ATTRIBUTE_WEAK__;
static struct l_array_17_uint8_t _OC_str_OC_2 = { "address too long" };
static struct l_array_1_uint8_t _OC_str_OC_3;
static struct l_array_11_uint8_t _OC_str_OC_4 = { "bad digest" };
static struct l_array_35_uint8_t _OC_str_OC_5 = { "1Q1pE5vPGEEMqRcVRMbtBK842Y6Pzo6nK9" };
static struct l_array_35_uint8_t _OC_str_OC_6 = { "1AGNa15ZQXAZUgFiqJ2i7Z2DPU2J6hW62i" };
static struct l_array_35_uint8_t _OC_str_OC_7 = { "1Q1pE5vPGEEMqRcVRMbtBK842Y6Pzo6nJ9" };
static struct l_array_35_uint8_t _OC_str_OC_8 = { "1AGNa15ZQXAZUgFiqJ2i7Z2DPU2J6hW62I" };
static struct l_array_8_uint8_t _OC_str_OC_9 = { "%s: %s\n" };
static struct l_array_3_uint8_t _OC_str_OC_10 = { "Ok" };
static uint8_t* unbase58_OC_tmpl = ((&_OC_str.array[((int32_t)0)]));


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_sub_u64(uint64_t a, uint64_t b) {
  uint64_t r = a - b;
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

uint32_t unbase58(uint8_t* llvm_cbe_s, uint8_t* llvm_cbe_out) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint8_t* llvm_cbe_s_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_out_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint32_t llvm_cbe_c;    /* Address-exposed local */
  uint8_t* llvm_cbe_p;    /* Address-exposed local */
  uint8_t* _1;
  uint8_t* _2;
  uint8_t* _3;
  uint32_t _4;
  uint8_t _5;
  uint8_t* _6;
  uint8_t* _7;
  uint32_t _8;
  uint8_t _9;
  uint8_t* llvm_cbe_call;
  uint8_t* _10;
  uint8_t* _11;
  uint32_t _12;
  uint8_t* _13;
  uint32_t _14;
  uint8_t _15;
  uint32_t _16;
  uint32_t _17;
  uint8_t* _18;
  uint32_t _19;
  uint32_t _20;
  uint32_t _21;
  uint32_t _22;
  uint32_t _23;

  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  llvm_cbe_out_2e_addr = llvm_cbe_out;
  ;
  ;
  ;
  ;
  ;
  _1 = llvm_cbe_out_2e_addr;
  _2 = memset(_1, 0, 25);
  llvm_cbe_i = 0;

  uint64_t llvm_cbe_idxprom;
  uint8_t* llvm_cbe_arrayidx;
  _3 = llvm_cbe_s_2e_addr;
  _4 = llvm_cbe_i;
  llvm_cbe_idxprom = ((int64_t)(int32_t)_4);
  llvm_cbe_arrayidx = (&_3[((int64_t)(((int64_t)(int32_t)_4)))]);
  _5 = *((&_3[((int64_t)(((int64_t)(int32_t)_4)))]));
while (_5 != ((uint8_t)0)){
  _6 = unbase58_OC_tmpl;
  _7 = llvm_cbe_s_2e_addr;
  _8 = llvm_cbe_i;
  _9 = *((&_7[((int64_t)(((int64_t)(int32_t)_8)))]));
  llvm_cbe_call = strchr(_6, (((int32_t)(int8_t)_9)));
  llvm_cbe_p = llvm_cbe_call;
  if (!(((llvm_cbe_call != ((uint8_t*)/*NULL*/0))&1))) {
  coin_err = ((&_OC_str_OC_1.array[((int64_t)0)]));
  llvm_cbe_retval = 0;
  _23 = llvm_cbe_retval;
  return _23;
}
  _10 = llvm_cbe_p;
  _11 = unbase58_OC_tmpl;
  llvm_cbe_c = (((uint32_t)(llvm_sub_u64((((uint64_t)(uintptr_t)_10)), (((uint64_t)(uintptr_t)_11))))));
  llvm_cbe_j = 25;

  uint32_t llvm_cbe_dec;
  _12 = llvm_cbe_j;
  llvm_cbe_dec = llvm_add_u32(_12, -1);
  llvm_cbe_j = (llvm_add_u32(_12, -1));
while (_12 != 0u){
  _13 = llvm_cbe_out_2e_addr;
  _14 = llvm_cbe_j;
  _15 = *((&_13[((int64_t)(((int64_t)(int32_t)_14)))]));
  _16 = llvm_cbe_c;
  llvm_cbe_c = (llvm_add_u32(_16, (llvm_mul_u32(58, (((uint32_t)(uint8_t)_15))))));
  _17 = llvm_cbe_c;
  _18 = llvm_cbe_out_2e_addr;
  _19 = llvm_cbe_j;
  *((&_18[((int64_t)(((int64_t)(int32_t)_19)))])) = (((uint8_t)(llvm_srem_u32(_17, 256))));
  _20 = llvm_cbe_c;
  llvm_cbe_c = (llvm_sdiv_u32(_20, 256));

  _12 = llvm_cbe_j;
  llvm_cbe_dec = llvm_add_u32(_12, -1);
  llvm_cbe_j = (llvm_add_u32(_12, -1));
}
  _21 = llvm_cbe_c;
  if ((((_21 != 0u)&1))) {
  coin_err = ((&_OC_str_OC_2.array[((int64_t)0)]));
  llvm_cbe_retval = 0;
  _23 = llvm_cbe_retval;
  return _23;
}

  _22 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_22, 1));

  _3 = llvm_cbe_s_2e_addr;
  _4 = llvm_cbe_i;
  llvm_cbe_idxprom = ((int64_t)(int32_t)_4);
  llvm_cbe_arrayidx = (&_3[((int64_t)(((int64_t)(int32_t)_4)))]);
  _5 = *((&_3[((int64_t)(((int64_t)(int32_t)_4)))]));
}
  llvm_cbe_retval = 1;

  _23 = llvm_cbe_retval;
  return _23;
}


uint32_t valid(uint8_t* llvm_cbe_s) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint8_t* llvm_cbe_s_2e_addr;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_32_uint8_t llvm_cbe_dec __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_32_uint8_t llvm_cbe_d1 __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_32_uint8_t llvm_cbe_d2 __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _24;
  uint32_t llvm_cbe_call;
  uint8_t* llvm_cbe_call3;
  uint8_t* llvm_cbe_call5;
  uint32_t llvm_cbe_call8;
  uint32_t _25;

  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  ;
  ;
  ;
  coin_err = ((&_OC_str_OC_3.array[((int64_t)0)]));
  _24 = llvm_cbe_s_2e_addr;
  llvm_cbe_call = unbase58(_24, ((&llvm_cbe_dec.array[((int64_t)0)])));
  if (!(((llvm_cbe_call != 0u)&1))) {
  llvm_cbe_retval = 0;

  _25 = llvm_cbe_retval;
  return _25;
}
  llvm_cbe_call3 = SHA256(((&llvm_cbe_dec.array[((int64_t)0)])), 21, ((&llvm_cbe_d1.array[((int64_t)0)])));
  llvm_cbe_call5 = SHA256(llvm_cbe_call3, 32, ((&llvm_cbe_d2.array[((int64_t)0)])));
  llvm_cbe_call8 = memcmp(((&((&llvm_cbe_dec.array[((int64_t)0)]))[((int64_t)21)])), ((&llvm_cbe_d2.array[((int64_t)0)])), 4);
  if ((((llvm_cbe_call8 != 0u)&1))) {
  coin_err = ((&_OC_str_OC_4.array[((int64_t)0)]));
  llvm_cbe_retval = 0;

  } else {
  llvm_cbe_retval = 1;

}
  _25 = llvm_cbe_retval;
  return _25;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_5_uint8_t_KC_ llvm_cbe_s __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_status;    /* Address-exposed local */
  uint8_t* _26;
  uint8_t* _27;
  struct l_array_5_uint8_t_KC_* _28;
  uint32_t _29;
  uint8_t* _30;
  uint32_t _31;
  uint8_t* _32;
  uint32_t llvm_cbe_call;
  uint32_t _33;
  uint8_t* _34;
  uint32_t _35;
  uint8_t* _36;
  uint8_t* llvm_cbe_cond;
  uint8_t* llvm_cbe_cond__PHI_TEMPORARY;
  uint32_t llvm_cbe_call6;
  uint32_t _37;

  llvm_cbe_retval = 0;
  ;
  _26 = ((uint8_t*)(&llvm_cbe_s));
  _27 = memset(_26, 0, 40);
  _28 = ((struct l_array_5_uint8_t_KC_*)_26);
  *((&(*_28).array[((int32_t)0)])) = ((&_OC_str_OC_5.array[((int32_t)0)]));
  *((&(*_28).array[((int32_t)1)])) = ((&_OC_str_OC_6.array[((int32_t)0)]));
  *((&(*_28).array[((int32_t)2)])) = ((&_OC_str_OC_7.array[((int32_t)0)]));
  *((&(*_28).array[((int32_t)3)])) = ((&_OC_str_OC_8.array[((int32_t)0)]));
  ;
  llvm_cbe_i = 0;

  uint64_t llvm_cbe_idxprom;
  uint8_t** llvm_cbe_arrayidx;
  _29 = llvm_cbe_i;
  llvm_cbe_idxprom = ((int64_t)(int32_t)_29);
  llvm_cbe_arrayidx = (&llvm_cbe_s.array[((int64_t)(((int64_t)(int32_t)_29)))]);
  _30 = *((&llvm_cbe_s.array[((int64_t)(((int64_t)(int32_t)_29)))]));
while (_30 != ((uint8_t*)/*NULL*/0)){
  ;
  _31 = llvm_cbe_i;
  _32 = *((&llvm_cbe_s.array[((int64_t)(((int64_t)(int32_t)_31)))]));
  llvm_cbe_call = valid(_32);
  llvm_cbe_status = llvm_cbe_call;
  _33 = llvm_cbe_i;
  _34 = *((&llvm_cbe_s.array[((int64_t)(((int64_t)(int32_t)_33)))]));
  _35 = llvm_cbe_status;
  if ((((_35 != 0u)&1))) {
  llvm_cbe_cond__PHI_TEMPORARY = ((&_OC_str_OC_10.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _36 = coin_err;
  llvm_cbe_cond__PHI_TEMPORARY = _36;   /* for PHI node */

}
  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;
  llvm_cbe_call6 = printf(((&_OC_str_OC_9.array[((int64_t)0)])), _34, llvm_cbe_cond);

  _37 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_37, 1));

  _29 = llvm_cbe_i;
  llvm_cbe_idxprom = ((int64_t)(int32_t)_29);
  llvm_cbe_arrayidx = (&llvm_cbe_s.array[((int64_t)(((int64_t)(int32_t)_29)))]);
  _30 = *((&llvm_cbe_s.array[((int64_t)(((int64_t)(int32_t)_29)))]));
}
  return 0;
}

