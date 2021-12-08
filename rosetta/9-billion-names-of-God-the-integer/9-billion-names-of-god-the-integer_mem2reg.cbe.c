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
  uint32_t k;
  uint32_t k__PHI_TEMPORARY;
  uint32_t d;

  ;
  __gmpz_init_set_ui(((&(*((&p.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_n)))]))).array[((int64_t)0)])), 0);
  ;
  k__PHI_TEMPORARY = 1;   /* for PHI node */

  k = k__PHI_TEMPORARY;
  ;
while (((int32_t)k) <= ((int32_t)llvm_cbe_n)){
  d = llvm_sub_u32(llvm_cbe_n, (llvm_sdiv_u32((llvm_mul_u32(k, (llvm_sub_u32((llvm_mul_u32(3, k)), 1)))), 2)));
  ;
  if ((((((int32_t)d) < ((int32_t)0u))&1))) {
  return;
}
  if (((((k & 1) != 0u)&1))) {
  __gmpz_add(((&(*((&p.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_n)))]))).array[((int64_t)0)])), ((&(*((&p.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_n)))]))).array[((int64_t)0)])), ((&(*((&p.array[((int64_t)(((int64_t)(int32_t)d)))]))).array[((int64_t)0)])));

  } else {
  __gmpz_sub(((&(*((&p.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_n)))]))).array[((int64_t)0)])), ((&(*((&p.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_n)))]))).array[((int64_t)0)])), ((&(*((&p.array[((int64_t)(((int64_t)(int32_t)d)))]))).array[((int64_t)0)])));

}
  d = llvm_sub_u32(d, k);
  ;
  if ((((((int32_t)d) < ((int32_t)0u))&1))) {
  return;
}
  if (((((k & 1) != 0u)&1))) {
  __gmpz_add(((&(*((&p.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_n)))]))).array[((int64_t)0)])), ((&(*((&p.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_n)))]))).array[((int64_t)0)])), ((&(*((&p.array[((int64_t)(((int64_t)(int32_t)d)))]))).array[((int64_t)0)])));

  } else {
  __gmpz_sub(((&(*((&p.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_n)))]))).array[((int64_t)0)])), ((&(*((&p.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_n)))]))).array[((int64_t)0)])), ((&(*((&p.array[((int64_t)(((int64_t)(int32_t)d)))]))).array[((int64_t)0)])));

}

  k = llvm_add_u32(k, 1);
  ;
  k__PHI_TEMPORARY = k;   /* for PHI node */

  k = k__PHI_TEMPORARY;
  ;
}
  return;
}


int main(void) {
  __MSALIGN__(16) struct l_array_10_uint32_t llvm_cbe_idx __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _1;
  uint32_t at;
  uint32_t at__PHI_TEMPORARY;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t _2;
  uint32_t _3;
  uint32_t llvm_cbe_call;

  ;
  _1 = memcpy((((uint8_t*)(&llvm_cbe_idx))), ((uint8_t*)(&__const_OC_main_OC_idx)), 40);
  ;
  __gmpz_init_set_ui(((&p.array[((int64_t)0)].array[((int64_t)0)])), 1);
  ;
  at__PHI_TEMPORARY = 0;   /* for PHI node */
  i__PHI_TEMPORARY = 1;   /* for PHI node */

  uint64_t llvm_cbe_idxprom;
  uint32_t* llvm_cbe_arrayidx;
  at = at__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)at);
  llvm_cbe_arrayidx = (&llvm_cbe_idx.array[((int64_t)(((int64_t)(int32_t)at)))]);
  _2 = *((&llvm_cbe_idx.array[((int64_t)(((int64_t)(int32_t)at)))]));
while (_2 != 0u){
  calc(i);
  _3 = *((&llvm_cbe_idx.array[((int64_t)(((int64_t)(int32_t)at)))]));
  if ((((i != _3)&1))) {
  at__PHI_TEMPORARY = at;   /* for PHI node */

  } else {
  llvm_cbe_call = __gmp_printf(((&_OC_str.array[((int64_t)0)])), i, ((&(*((&p.array[((int64_t)(((int64_t)(int32_t)i)))]))).array[((int64_t)0)])));
  at = llvm_add_u32(at, 1);
  ;
  at__PHI_TEMPORARY = at;   /* for PHI node */

}
  at = at__PHI_TEMPORARY;
  ;
  i = llvm_add_u32(i, 1);
  ;
  at__PHI_TEMPORARY = at;   /* for PHI node */
  i__PHI_TEMPORARY = i;   /* for PHI node */

  at = at__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)at);
  llvm_cbe_arrayidx = (&llvm_cbe_idx.array[((int64_t)(((int64_t)(int32_t)at)))]);
  _2 = *((&llvm_cbe_idx.array[((int64_t)(((int64_t)(int32_t)at)))]));
}
  return 0;
}

