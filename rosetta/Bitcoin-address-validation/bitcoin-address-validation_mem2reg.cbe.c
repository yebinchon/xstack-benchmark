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
  uint8_t* _1;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint8_t _2;
  uint8_t* _3;
  uint8_t _4;
  uint8_t* p;
  uint8_t* _5;
  uint32_t c;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  uint32_t c__PHI_TEMPORARY;
  uint8_t _6;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  _1 = memset(llvm_cbe_out, 0, 25);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint64_t llvm_cbe_idxprom;
  uint8_t* llvm_cbe_arrayidx;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx = (&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]);
  _2 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]));
while (_2 != ((uint8_t)0)){
  _3 = unbase58_OC_tmpl;
  _4 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]));
  p = strchr(_3, (((int32_t)(int8_t)_4)));
  ;
  if (!(((p != ((uint8_t*)/*NULL*/0))&1))) {
  coin_err = ((&_OC_str_OC_1.array[((int64_t)0)]));
    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  _5 = unbase58_OC_tmpl;
  c = ((uint32_t)(llvm_sub_u64((((uint64_t)(uintptr_t)p)), (((uint64_t)(uintptr_t)_5)))));
  ;
  ;
  j__PHI_TEMPORARY = 25;   /* for PHI node */
  c__PHI_TEMPORARY = c;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  c = c__PHI_TEMPORARY;
  ;
  ;
  j = llvm_add_u32(j, -1);
  ;
while (j != 0u){
  _6 = *((&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)j)))]));
  c = llvm_add_u32(c, (llvm_mul_u32(58, (((uint32_t)(uint8_t)_6)))));
  ;
  *((&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)j)))])) = (((uint8_t)(llvm_srem_u32(c, 256))));
  c = llvm_sdiv_u32(c, 256);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */
  c__PHI_TEMPORARY = c;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  c = c__PHI_TEMPORARY;
  ;
  ;
  j = llvm_add_u32(j, -1);
  ;
}
  if ((((c != 0u)&1))) {
  coin_err = ((&_OC_str_OC_2.array[((int64_t)0)]));
    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx = (&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]);
  _2 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]));
}
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


uint32_t valid(uint8_t* llvm_cbe_s) {
  __MSALIGN__(16) struct l_array_32_uint8_t llvm_cbe_dec __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_32_uint8_t llvm_cbe_d1 __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_32_uint8_t llvm_cbe_d2 __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint8_t* llvm_cbe_call3;
  uint8_t* llvm_cbe_call5;
  uint32_t llvm_cbe_call8;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  ;
  ;
  coin_err = ((&_OC_str_OC_3.array[((int64_t)0)]));
  llvm_cbe_call = unbase58(llvm_cbe_s, ((&llvm_cbe_dec.array[((int64_t)0)])));
  if (!(((llvm_cbe_call != 0u)&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  llvm_cbe_call3 = SHA256(((&llvm_cbe_dec.array[((int64_t)0)])), 21, ((&llvm_cbe_d1.array[((int64_t)0)])));
  llvm_cbe_call5 = SHA256(llvm_cbe_call3, 32, ((&llvm_cbe_d2.array[((int64_t)0)])));
  llvm_cbe_call8 = memcmp(((&((&llvm_cbe_dec.array[((int64_t)0)]))[((int64_t)21)])), ((&llvm_cbe_d2.array[((int64_t)0)])), 4);
  if ((((llvm_cbe_call8 != 0u)&1))) {
  coin_err = ((&_OC_str_OC_4.array[((int64_t)0)]));
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

  } else {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */

}
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


int main(void) {
  __MSALIGN__(16) struct l_array_5_uint8_t_KC_ llvm_cbe_s __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _7;
  uint8_t* _8;
  struct l_array_5_uint8_t_KC_* _9;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint8_t* _10;
  uint8_t* _11;
  uint32_t status;
  uint8_t* _12;
  uint8_t* _13;
  uint8_t* llvm_cbe_cond;
  uint8_t* llvm_cbe_cond__PHI_TEMPORARY;
  uint32_t llvm_cbe_call6;

  ;
  _7 = ((uint8_t*)(&llvm_cbe_s));
  _8 = memset(_7, 0, 40);
  _9 = ((struct l_array_5_uint8_t_KC_*)_7);
  *((&(*_9).array[((int32_t)0)])) = ((&_OC_str_OC_5.array[((int32_t)0)]));
  *((&(*_9).array[((int32_t)1)])) = ((&_OC_str_OC_6.array[((int32_t)0)]));
  *((&(*_9).array[((int32_t)2)])) = ((&_OC_str_OC_7.array[((int32_t)0)]));
  *((&(*_9).array[((int32_t)3)])) = ((&_OC_str_OC_8.array[((int32_t)0)]));
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint64_t llvm_cbe_idxprom;
  uint8_t** llvm_cbe_arrayidx;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx = (&llvm_cbe_s.array[((int64_t)(((int64_t)(int32_t)i)))]);
  _10 = *((&llvm_cbe_s.array[((int64_t)(((int64_t)(int32_t)i)))]));
while (_10 != ((uint8_t*)/*NULL*/0)){
  _11 = *((&llvm_cbe_s.array[((int64_t)(((int64_t)(int32_t)i)))]));
  status = valid(_11);
  ;
  _12 = *((&llvm_cbe_s.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((status != 0u)&1))) {
  llvm_cbe_cond__PHI_TEMPORARY = ((&_OC_str_OC_10.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _13 = coin_err;
  llvm_cbe_cond__PHI_TEMPORARY = _13;   /* for PHI node */

}
  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;
  llvm_cbe_call6 = printf(((&_OC_str_OC_9.array[((int64_t)0)])), _12, llvm_cbe_cond);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx = (&llvm_cbe_s.array[((int64_t)(((int64_t)(int32_t)i)))]);
  _10 = *((&llvm_cbe_s.array[((int64_t)(((int64_t)(int32_t)i)))]));
}
  return 0;
}

