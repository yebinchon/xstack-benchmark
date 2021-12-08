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
struct l_struct_struct_OC___mpz_struct;

/* Function definitions */

/* Types Definitions */
struct l_struct_struct_OC___mpz_struct {
  uint32_t field0;
  uint32_t field1;
  uint64_t* field2;
};
struct l_array_1_struct_AC_l_struct_struct_OC___mpz_struct {
  struct l_struct_struct_OC___mpz_struct array[1];
};
struct l_array_100001_struct_AC_l_array_1_struct_AC_l_struct_struct_OC___mpz_struct {
  struct l_array_1_struct_AC_l_struct_struct_OC___mpz_struct array[100001];
};
struct l_array_10_uint32_t {
  uint32_t array[10];
};
struct l_array_10_uint8_t {
  uint8_t array[10];
};

/* External Global Variable Declarations */

/* Function Declarations */
void calc(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void __gmpz_init_set_ui(struct l_struct_struct_OC___mpz_struct*, uint64_t);
void __gmpz_add(struct l_struct_struct_OC___mpz_struct*, struct l_struct_struct_OC___mpz_struct*, struct l_struct_struct_OC___mpz_struct*);
void __gmpz_sub(struct l_struct_struct_OC___mpz_struct*, struct l_struct_struct_OC___mpz_struct*, struct l_struct_struct_OC___mpz_struct*);
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t __gmp_printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
__MSALIGN__(16) struct l_array_100001_struct_AC_l_array_1_struct_AC_l_struct_struct_OC___mpz_struct p __attribute__((aligned(16))) __ATTRIBUTE_WEAK__;
static __MSALIGN__(16) struct l_array_10_uint32_t __const_OC_main_OC_idx __attribute__((aligned(16))) = { { 23, 123, 1234, 12345, 20000, 30000, 40000, 50000, 100000, 0 } };
static struct l_array_10_uint8_t _OC_str = { "%2d:\t%Zd\n" };


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


/* Function Bodies */

void calc(uint32_t llvm_cbe_n) {
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_k;    /* Address-exposed local */
  uint32_t llvm_cbe_d;    /* Address-exposed local */
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
  uint32_t _20;
  uint32_t _21;
  uint32_t _22;
  uint32_t _23;
  uint32_t _24;
  uint32_t _25;

  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  _1 = llvm_cbe_n_2e_addr;
  __gmpz_init_set_ui(((&(*((&p.array[((int64_t)(((int64_t)(int32_t)_1)))]))).array[((int64_t)0)])), 0);
  ;
  llvm_cbe_k = 1;

  _2 = llvm_cbe_k;
  _3 = llvm_cbe_n_2e_addr;
while (((int32_t)_2) <= ((int32_t)_3)){
  ;
  _4 = llvm_cbe_n_2e_addr;
  _5 = llvm_cbe_k;
  _6 = llvm_cbe_k;
  llvm_cbe_d = (llvm_sub_u32(_4, (llvm_sdiv_u32((llvm_mul_u32(_5, (llvm_sub_u32((llvm_mul_u32(3, _6)), 1)))), 2))));
  _7 = llvm_cbe_d;
  if ((((((int32_t)_7) < ((int32_t)0u))&1))) {
  return;
}
  _8 = llvm_cbe_k;
  if (((((_8 & 1) != 0u)&1))) {
  _9 = llvm_cbe_n_2e_addr;
  _10 = llvm_cbe_n_2e_addr;
  _11 = llvm_cbe_d;
  __gmpz_add(((&(*((&p.array[((int64_t)(((int64_t)(int32_t)_9)))]))).array[((int64_t)0)])), ((&(*((&p.array[((int64_t)(((int64_t)(int32_t)_10)))]))).array[((int64_t)0)])), ((&(*((&p.array[((int64_t)(((int64_t)(int32_t)_11)))]))).array[((int64_t)0)])));

  } else {
  _12 = llvm_cbe_n_2e_addr;
  _13 = llvm_cbe_n_2e_addr;
  _14 = llvm_cbe_d;
  __gmpz_sub(((&(*((&p.array[((int64_t)(((int64_t)(int32_t)_12)))]))).array[((int64_t)0)])), ((&(*((&p.array[((int64_t)(((int64_t)(int32_t)_13)))]))).array[((int64_t)0)])), ((&(*((&p.array[((int64_t)(((int64_t)(int32_t)_14)))]))).array[((int64_t)0)])));

}
  _15 = llvm_cbe_k;
  _16 = llvm_cbe_d;
  llvm_cbe_d = (llvm_sub_u32(_16, _15));
  _17 = llvm_cbe_d;
  if ((((((int32_t)_17) < ((int32_t)0u))&1))) {
  return;
}
  _18 = llvm_cbe_k;
  if (((((_18 & 1) != 0u)&1))) {
  _19 = llvm_cbe_n_2e_addr;
  _20 = llvm_cbe_n_2e_addr;
  _21 = llvm_cbe_d;
  __gmpz_add(((&(*((&p.array[((int64_t)(((int64_t)(int32_t)_19)))]))).array[((int64_t)0)])), ((&(*((&p.array[((int64_t)(((int64_t)(int32_t)_20)))]))).array[((int64_t)0)])), ((&(*((&p.array[((int64_t)(((int64_t)(int32_t)_21)))]))).array[((int64_t)0)])));

  } else {
  _22 = llvm_cbe_n_2e_addr;
  _23 = llvm_cbe_n_2e_addr;
  _24 = llvm_cbe_d;
  __gmpz_sub(((&(*((&p.array[((int64_t)(((int64_t)(int32_t)_22)))]))).array[((int64_t)0)])), ((&(*((&p.array[((int64_t)(((int64_t)(int32_t)_23)))]))).array[((int64_t)0)])), ((&(*((&p.array[((int64_t)(((int64_t)(int32_t)_24)))]))).array[((int64_t)0)])));

}

  _25 = llvm_cbe_k;
  llvm_cbe_k = (llvm_add_u32(_25, 1));

  _2 = llvm_cbe_k;
  _3 = llvm_cbe_n_2e_addr;
}
  return;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_10_uint32_t llvm_cbe_idx __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_at;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint8_t* _26;
  uint32_t _27;
  uint32_t _28;
  uint32_t _29;
  uint32_t _30;
  uint32_t _31;
  uint32_t _32;
  uint32_t _33;
  uint32_t _34;
  uint32_t llvm_cbe_call;
  uint32_t _35;
  uint32_t _36;
  uint32_t _37;

  llvm_cbe_retval = 0;
  ;
  _26 = memcpy((((uint8_t*)(&llvm_cbe_idx))), ((uint8_t*)(&__const_OC_main_OC_idx)), 40);
  ;
  llvm_cbe_at = 0;
  __gmpz_init_set_ui(((&p.array[((int64_t)0)].array[((int64_t)0)])), 1);
  ;
  llvm_cbe_i = 1;

  uint64_t llvm_cbe_idxprom;
  uint32_t* llvm_cbe_arrayidx;
  _27 = llvm_cbe_at;
  llvm_cbe_idxprom = ((int64_t)(int32_t)_27);
  llvm_cbe_arrayidx = (&llvm_cbe_idx.array[((int64_t)(((int64_t)(int32_t)_27)))]);
  _28 = *((&llvm_cbe_idx.array[((int64_t)(((int64_t)(int32_t)_27)))]));
while (_28 != 0u){
  _29 = llvm_cbe_i;
  calc(_29);
  _30 = llvm_cbe_i;
  _31 = llvm_cbe_at;
  _32 = *((&llvm_cbe_idx.array[((int64_t)(((int64_t)(int32_t)_31)))]));
  if ((((_30 != _32)&1))) {

  } else {
  _33 = llvm_cbe_i;
  _34 = llvm_cbe_i;
  llvm_cbe_call = __gmp_printf(((&_OC_str.array[((int64_t)0)])), _33, ((&(*((&p.array[((int64_t)(((int64_t)(int32_t)_34)))]))).array[((int64_t)0)])));
  _35 = llvm_cbe_at;
  llvm_cbe_at = (llvm_add_u32(_35, 1));

}
  _36 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_36, 1));

  _27 = llvm_cbe_at;
  llvm_cbe_idxprom = ((int64_t)(int32_t)_27);
  llvm_cbe_arrayidx = (&llvm_cbe_idx.array[((int64_t)(((int64_t)(int32_t)_27)))]);
  _28 = *((&llvm_cbe_idx.array[((int64_t)(((int64_t)(int32_t)_27)))]));
}
  _37 = llvm_cbe_retval;
  return _37;
}

