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
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_9_uint8_t {
  uint8_t array[9];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint64_t get_prime(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* realloc(uint8_t*, uint64_t) __ATTRIBUTELIST__((nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static uint64_t get_prime_OC_n_primes;
static uint64_t get_prime_OC_alloc;
static uint64_t* get_prime_OC_primes;
static struct l_array_8_uint8_t _OC_str = { "%lld = " };
static struct l_array_4_uint8_t _OC_str_OC_1 = { " x " };
static struct l_array_5_uint8_t _OC_str_OC_2 = { "%lld" };
static struct l_array_6_uint8_t _OC_str_OC_3 = { "%lld\n" };
static struct l_array_9_uint8_t _OC_str_OC_4 = { " x %lld\n" };
static struct l_array_2_uint8_t _OC_str_OC_5 = { "\n" };


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


/* Function Bodies */

uint64_t get_prime(uint32_t llvm_cbe_idx) {
  uint64_t _1;
  uint64_t _2;
  uint64_t _3;
  uint64_t _4;
  uint64_t* _5;
  uint64_t _6;
  uint8_t* llvm_cbe_call;
  uint64_t _7;
  uint64_t* _8;
  uint64_t* _9;
  uint64_t* _10;
  uint64_t _11;
  uint64_t last;
  uint64_t last__PHI_TEMPORARY;
  uint64_t _12;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint64_t _13;
  uint64_t* _14;
  uint64_t p;
  uint64_t* _15;
  uint64_t _16;
  uint64_t* _17;
  uint64_t _18;

  ;
  _1 = get_prime_OC_n_primes;
  if (!(((((int64_t)(((int64_t)(int32_t)llvm_cbe_idx))) >= ((int64_t)_1))&1))) {
  _2 = get_prime_OC_n_primes;
  _3 = get_prime_OC_alloc;
  if ((((((int64_t)_2) >= ((int64_t)_3))&1))) {
  _4 = get_prime_OC_alloc;
  get_prime_OC_alloc = (llvm_add_u64(_4, 16));
  _5 = get_prime_OC_primes;
  _6 = get_prime_OC_alloc;
  llvm_cbe_call = realloc((((uint8_t*)_5)), (llvm_mul_u64(8, _6)));
  get_prime_OC_primes = (((uint64_t*)llvm_cbe_call));

}
  _7 = get_prime_OC_n_primes;
  if (!(((_7 != UINT64_C(0))&1))) {
  _8 = get_prime_OC_primes;
  *((&(*_8))) = 2;
  _9 = get_prime_OC_primes;
  *((&_9[((int64_t)1)])) = 3;
  get_prime_OC_n_primes = 2;

}
  _10 = get_prime_OC_primes;
  _11 = get_prime_OC_n_primes;
  last = *((&_10[((int64_t)(llvm_sub_u64(_11, 1)))]));
  ;
  last__PHI_TEMPORARY = last;   /* for PHI node */

  last = last__PHI_TEMPORARY;
  ;
  _12 = get_prime_OC_n_primes;
  if (!(((((int64_t)(((int64_t)(int32_t)llvm_cbe_idx))) >= ((int64_t)_12))&1))) {
  }

  last = llvm_add_u64(last, 2);
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */


  i = i__PHI_TEMPORARY;
  ;
  _13 = get_prime_OC_n_primes;
  if (!(((((int64_t)(((int64_t)(int32_t)i))) < ((int64_t)_13))&1))) {
  }

}
  uint64_t llvm_cbe_conv9;
  last = last__PHI_TEMPORARY;
  ;
  llvm_cbe_conv9 = ((int64_t)(int32_t)llvm_cbe_idx);
  _12 = get_prime_OC_n_primes;
while (((int64_t)llvm_cbe_conv9) >= ((int64_t)_12)){
  uint64_t llvm_cbe_conv13;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_conv13 = ((int64_t)(int32_t)i);
  _13 = get_prime_OC_n_primes;
while (((int64_t)llvm_cbe_conv13) < ((int64_t)_13)){
  _14 = get_prime_OC_primes;
  p = *((&_14[((int64_t)(((int64_t)(int32_t)i)))]));
  ;
  if ((((((uint64_t)(llvm_mul_u64(p, p))) > ((uint64_t)last))&1))) {
  _15 = get_prime_OC_primes;
  _16 = get_prime_OC_n_primes;
  get_prime_OC_n_primes = (llvm_add_u64(_16, 1));
  *((&_15[((int64_t)_16)])) = last;
  break;
  } else {
  if (((((llvm_urem_u64(last, p)) == UINT64_C(0))&1))) {
  break;
  } else {

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

}
}
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_conv13 = ((int64_t)(int32_t)i);
  _13 = get_prime_OC_n_primes;
}

  last__PHI_TEMPORARY = last;   /* for PHI node */

  last = last__PHI_TEMPORARY;
  ;
  llvm_cbe_conv9 = ((int64_t)(int32_t)llvm_cbe_idx);
  _12 = get_prime_OC_n_primes;
}
  _17 = get_prime_OC_primes;
  _18 = *((&_17[((int64_t)(((int64_t)(int32_t)llvm_cbe_idx)))]));
  return _18;
}


int main(void) {
  uint64_t llvm_cbe_x_2e_0;
  uint64_t llvm_cbe_x_2e_0__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint64_t n;
  uint64_t n__PHI_TEMPORARY;
  uint32_t first;
  uint32_t first__PHI_TEMPORARY;
  uint64_t p;
  uint32_t llvm_cbe_call3;
  uint32_t llvm_cbe_call4;
  uint32_t llvm_cbe_call10;
  uint32_t llvm_cbe_call13;
  uint32_t llvm_cbe_call15;
  uint64_t x;

  ;
  llvm_cbe_x_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */

){
){
  uint64_t llvm_cbe_rem;
  n = n__PHI_TEMPORARY;
  first = first__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_rem = llvm_urem_u64(n, p);
while (llvm_cbe_rem == UINT64_C(0)){
  n = llvm_udiv_u64(n, p);
  ;
  if (!(((first != 0u)&1))) {
  llvm_cbe_call3 = printf(((&_OC_str_OC_1.array[((int64_t)0)])));

}
  ;
  llvm_cbe_call4 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), p);
  n__PHI_TEMPORARY = n;   /* for PHI node */
  first__PHI_TEMPORARY = 0;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  first = first__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_rem = llvm_urem_u64(n, p);
}
  if ((((((uint64_t)n) <= ((uint64_t)(llvm_mul_u64(p, p))))&1))) {
  break;
  if ((((first != 0u)&1))) {
  llvm_cbe_call10 = printf(((&_OC_str_OC_3.array[((int64_t)0)])), n);

  } else {
  if ((((((uint64_t)n) > ((uint64_t)UINT64_C(1)))&1))) {
  llvm_cbe_call13 = printf(((&_OC_str_OC_4.array[((int64_t)0)])), n);

  } else {
  llvm_cbe_call15 = printf(((&_OC_str_OC_5.array[((int64_t)0)])));

}
}
}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  n__PHI_TEMPORARY = n;   /* for PHI node */
  first__PHI_TEMPORARY = first;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  n = n__PHI_TEMPORARY;
  first = first__PHI_TEMPORARY;
  ;
  ;
  ;
  p = get_prime(i);
  ;
    n__PHI_TEMPORARY = n;   /* for PHI node */
  first__PHI_TEMPORARY = first;   /* for PHI node */

;
}


  x = llvm_add_u64(llvm_cbe_x_2e_0, 1);
  ;
  llvm_cbe_x_2e_0__PHI_TEMPORARY = x;   /* for PHI node */

  llvm_cbe_x_2e_0 = llvm_cbe_x_2e_0__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), llvm_cbe_x_2e_0);
  ;
  ;
    i__PHI_TEMPORARY = 0;   /* for PHI node */
  n__PHI_TEMPORARY = llvm_cbe_x_2e_0;   /* for PHI node */
  first__PHI_TEMPORARY = 1;   /* for PHI node */

;
}
}

