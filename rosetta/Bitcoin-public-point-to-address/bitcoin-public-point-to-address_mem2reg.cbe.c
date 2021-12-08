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
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_59_uint8_t {
  uint8_t array[59];
};
struct l_array_40_uint8_t {
  uint8_t array[40];
};
struct l_array_24_uint8_t {
  uint8_t array[24];
};
struct l_array_65_uint8_t {
  uint8_t array[65];
};
struct l_array_25_uint8_t {
  uint8_t array[25];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t is_hex(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint16_t** __ctype_b_loc(void) __ATTRIBUTELIST__((nothrow, const));
void str_to_byte(uint8_t*, uint8_t*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t __isoc99_sscanf(uint8_t*, uint8_t*, ...) __ATTRIBUTELIST__((nothrow));
uint8_t* base58(uint8_t*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* coin_encode(uint8_t*, uint8_t*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* RIPEMD160(uint8_t*, uint64_t, uint8_t*);
uint8_t* SHA256(uint8_t*, uint64_t, uint8_t*);
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t puts(uint8_t*);
uint8_t* memmove(uint8_t*, uint8_t*, uint64_t);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_6_uint8_t _OC_str = { "%2hhx" };
static struct l_array_59_uint8_t _OC_str_OC_1 = { "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz" };
static __MSALIGN__(16) struct l_array_40_uint8_t base58_OC_buf __attribute__((aligned(16)));
static struct l_array_24_uint8_t _OC_str_OC_2 = { "bad public point string" };
uint8_t* coin_err __ATTRIBUTE_WEAK__;
static struct l_array_65_uint8_t _OC_str_OC_3 = { "50863AD64A87AE8A2FE83C1AF1A8403CB53F53E486D8511DAD8A04887E5B2352" };
static struct l_array_65_uint8_t _OC_str_OC_4 = { "2CD470243453A299FA9E77237716103ABC11A1DF38855ED6F2EE187E9C582BA6" };
static uint8_t* base58_OC_tmpl = ((&_OC_str_OC_1.array[((int32_t)0)]));


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

uint32_t is_hex(uint8_t* llvm_cbe_s) {
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint16_t** llvm_cbe_call;
  uint16_t* _1;
  uint8_t _2;
  uint16_t _3;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)64u)){
  llvm_cbe_call = __ctype_b_loc();
  _1 = *llvm_cbe_call;
  _2 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]));
  _3 = *((&_1[((int64_t)(((int64_t)(int32_t)(((int32_t)(int8_t)_2)))))]));
  if (!(((((((uint32_t)(uint16_t)_3)) & 4096) != 0u)&1))) {
    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


void str_to_byte(uint8_t* llvm_cbe_src, uint8_t* llvm_cbe_dst, uint32_t llvm_cbe_n) {
  uint32_t n;
  uint32_t n__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;

  ;
  ;
  ;
  n__PHI_TEMPORARY = llvm_cbe_n;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  ;
  n = llvm_add_u32(n, -1);
  ;
while (n != 0u){
  llvm_cbe_call = __isoc99_sscanf(((&llvm_cbe_src[((int64_t)(((int64_t)(int32_t)(llvm_mul_u32(n, 2)))))])), ((&_OC_str.array[((int64_t)0)])), ((&llvm_cbe_dst[((int64_t)(((int64_t)(int32_t)n)))])));
  n__PHI_TEMPORARY = n;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  ;
  n = llvm_add_u32(n, -1);
  ;
}
  return;
}


uint8_t* base58(uint8_t* llvm_cbe_s, uint8_t* llvm_cbe_out) {
  uint8_t* out;
  uint8_t* out__PHI_TEMPORARY;
  uint32_t n;
  uint32_t n__PHI_TEMPORARY;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t c;
  uint32_t c__PHI_TEMPORARY;
  uint8_t _4;
  uint8_t* _5;
  uint8_t _6;
  uint8_t _7;
  uint8_t* _8;

  ;
  ;
  if (!(((llvm_cbe_out != ((uint8_t*)/*NULL*/0))&1))) {
  ;
  out__PHI_TEMPORARY = ((&base58_OC_buf.array[((int64_t)0)]));   /* for PHI node */

}
  out = out__PHI_TEMPORARY;
  ;
  ;
  *((&out[((int64_t)34)])) = 0;
  n__PHI_TEMPORARY = 34;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  ;
  n = llvm_add_u32(n, -1);
  ;
while (n != 0u){
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  c__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  c = c__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) < ((int32_t)25u)){
  _4 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]));
  c = llvm_add_u32((llvm_mul_u32(c, 256)), (((uint32_t)(uint8_t)_4)));
  ;
  *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))])) = (((uint8_t)(llvm_sdiv_u32(c, 58))));
  c = llvm_srem_u32(c, 58);
  ;

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  c__PHI_TEMPORARY = c;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  c = c__PHI_TEMPORARY;
  ;
  ;
}
  _5 = base58_OC_tmpl;
  _6 = *((&_5[((int64_t)(((int64_t)(int32_t)c)))]));
  *((&out[((int64_t)(((int64_t)(int32_t)n)))])) = _6;
  n__PHI_TEMPORARY = n;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  ;
  n = llvm_add_u32(n, -1);
  ;
}
  ;
  n__PHI_TEMPORARY = 0;   /* for PHI node */

  uint64_t llvm_cbe_idxprom11;
  uint8_t* llvm_cbe_arrayidx12;
  uint32_t llvm_cbe_conv13;
  n = n__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom11 = ((int64_t)(int32_t)n);
  llvm_cbe_arrayidx12 = (&out[((int64_t)(((int64_t)(int32_t)n)))]);
  _7 = *((&out[((int64_t)(((int64_t)(int32_t)n)))]));
  llvm_cbe_conv13 = ((int32_t)(int8_t)_7);
while (llvm_cbe_conv13 == 49u){

  n = llvm_add_u32(n, 1);
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom11 = ((int64_t)(int32_t)n);
  llvm_cbe_arrayidx12 = (&out[((int64_t)(((int64_t)(int32_t)n)))]);
  _7 = *((&out[((int64_t)(((int64_t)(int32_t)n)))]));
  llvm_cbe_conv13 = ((int32_t)(int8_t)_7);
}
  _8 = memmove(out, ((&out[((int64_t)(((int64_t)(int32_t)n)))])), (((int64_t)(int32_t)(llvm_sub_u32(34, n)))));
  return out;
}


uint8_t* coin_encode(uint8_t* llvm_cbe_x, uint8_t* llvm_cbe_y, uint8_t* llvm_cbe_out) {
  __MSALIGN__(16) struct l_array_65_uint8_t llvm_cbe_s __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_25_uint8_t llvm_cbe_rmd __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call1;
  uint8_t* llvm_cbe_call7;
  uint8_t* llvm_cbe_call10;
  uint8_t* llvm_cbe_call14;
  uint8_t* llvm_cbe_call15;
  uint8_t* _9;
  uint8_t* llvm_cbe_call17;
  uint8_t* llvm_cbe_retval_2e_0;
  uint8_t* llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  ;
  ;
  ;
  llvm_cbe_call = is_hex(llvm_cbe_x);
  if (!(((llvm_cbe_call != 0u)&1))) {
  coin_err = ((&_OC_str_OC_2.array[((int64_t)0)]));
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = ((uint8_t*)/*NULL*/0);   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = ((uint8_t*)/*NULL*/0);   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  llvm_cbe_call1 = is_hex(llvm_cbe_y);
  if ((((llvm_cbe_call1 != 0u)&1))) {
  *((&llvm_cbe_s.array[((int64_t)0)])) = 4;
  str_to_byte(llvm_cbe_x, ((&((&llvm_cbe_s.array[((int64_t)0)]))[((int64_t)1)])), 32);
  str_to_byte(llvm_cbe_y, ((&((&llvm_cbe_s.array[((int64_t)0)]))[((int64_t)33)])), 32);
  *((&llvm_cbe_rmd.array[((int64_t)0)])) = 0;
  llvm_cbe_call7 = SHA256(((&llvm_cbe_s.array[((int64_t)0)])), 65, ((uint8_t*)/*NULL*/0));
  llvm_cbe_call10 = RIPEMD160(llvm_cbe_call7, 32, ((&((&llvm_cbe_rmd.array[((int64_t)0)]))[((int64_t)1)])));
  llvm_cbe_call14 = SHA256(((&llvm_cbe_rmd.array[((int64_t)0)])), 21, ((uint8_t*)/*NULL*/0));
  llvm_cbe_call15 = SHA256(llvm_cbe_call14, 32, ((uint8_t*)/*NULL*/0));
  _9 = memcpy(((&((&llvm_cbe_rmd.array[((int64_t)0)]))[((int64_t)21)])), llvm_cbe_call15, 4);
  llvm_cbe_call17 = base58(((&llvm_cbe_rmd.array[((int64_t)0)])), llvm_cbe_out);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_call17;   /* for PHI node */

  } else {
  coin_err = ((&_OC_str_OC_2.array[((int64_t)0)]));
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = ((uint8_t*)/*NULL*/0);   /* for PHI node */

}
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


int main(void) {
  uint8_t* llvm_cbe_call;
  uint32_t llvm_cbe_call1;

  llvm_cbe_call = coin_encode(((&_OC_str_OC_3.array[((int64_t)0)])), ((&_OC_str_OC_4.array[((int64_t)0)])), ((uint8_t*)/*NULL*/0));
  llvm_cbe_call1 = puts(llvm_cbe_call);
  return 0;
}

