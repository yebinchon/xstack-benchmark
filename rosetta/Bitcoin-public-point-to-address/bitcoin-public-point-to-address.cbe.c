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
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint8_t* llvm_cbe_s_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t _1;
  uint16_t** llvm_cbe_call;
  uint16_t* _2;
  uint8_t* _3;
  uint32_t _4;
  uint8_t _5;
  uint16_t _6;
  uint32_t _7;
  uint32_t _8;

  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  ;
  llvm_cbe_i = 0;

  _1 = llvm_cbe_i;
while (((int32_t)_1) < ((int32_t)64u)){
  llvm_cbe_call = __ctype_b_loc();
  _2 = *llvm_cbe_call;
  _3 = llvm_cbe_s_2e_addr;
  _4 = llvm_cbe_i;
  _5 = *((&_3[((int64_t)(((int64_t)(int32_t)_4)))]));
  _6 = *((&_2[((int64_t)(((int64_t)(int32_t)(((int32_t)(int8_t)_5)))))]));
  if (!(((((((uint32_t)(uint16_t)_6)) & 4096) != 0u)&1))) {
  llvm_cbe_retval = 0;
  _8 = llvm_cbe_retval;
  return _8;
}

  _7 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_7, 1));

  _1 = llvm_cbe_i;
}
  llvm_cbe_retval = 1;

  _8 = llvm_cbe_retval;
  return _8;
}


void str_to_byte(uint8_t* llvm_cbe_src, uint8_t* llvm_cbe_dst, uint32_t llvm_cbe_n) {
  uint8_t* llvm_cbe_src_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_dst_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint32_t _9;
  uint8_t* _10;
  uint32_t _11;
  uint8_t* _12;
  uint32_t _13;
  uint32_t llvm_cbe_call;

  llvm_cbe_src_2e_addr = llvm_cbe_src;
  ;
  llvm_cbe_dst_2e_addr = llvm_cbe_dst;
  ;
  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;

  uint32_t llvm_cbe_dec;
  _9 = llvm_cbe_n_2e_addr;
  llvm_cbe_dec = llvm_add_u32(_9, -1);
  llvm_cbe_n_2e_addr = (llvm_add_u32(_9, -1));
while (_9 != 0u){
  _10 = llvm_cbe_src_2e_addr;
  _11 = llvm_cbe_n_2e_addr;
  _12 = llvm_cbe_dst_2e_addr;
  _13 = llvm_cbe_n_2e_addr;
  llvm_cbe_call = __isoc99_sscanf(((&_10[((int64_t)(((int64_t)(int32_t)(llvm_mul_u32(_11, 2)))))])), ((&_OC_str.array[((int64_t)0)])), ((&_12[((int64_t)(((int64_t)(int32_t)_13)))])));

  _9 = llvm_cbe_n_2e_addr;
  llvm_cbe_dec = llvm_add_u32(_9, -1);
  llvm_cbe_n_2e_addr = (llvm_add_u32(_9, -1));
}
  return;
}


uint8_t* base58(uint8_t* llvm_cbe_s, uint8_t* llvm_cbe_out) {
  uint8_t* llvm_cbe_s_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_out_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_c;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_n;    /* Address-exposed local */
  uint8_t* _14;
  uint8_t* _15;
  uint32_t _16;
  uint32_t _17;
  uint32_t _18;
  uint8_t* _19;
  uint32_t _20;
  uint8_t _21;
  uint32_t _22;
  uint8_t* _23;
  uint32_t _24;
  uint32_t _25;
  uint32_t _26;
  uint8_t* _27;
  uint32_t _28;
  uint8_t _29;
  uint8_t* _30;
  uint32_t _31;
  uint8_t* _32;
  uint32_t _33;
  uint8_t _34;
  uint32_t _35;
  uint8_t* _36;
  uint8_t* _37;
  uint32_t _38;
  uint32_t _39;
  uint8_t* _40;
  uint8_t* _41;

  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  llvm_cbe_out_2e_addr = llvm_cbe_out;
  ;
  ;
  ;
  ;
  _14 = llvm_cbe_out_2e_addr;
  if (!(((_14 != ((uint8_t*)/*NULL*/0))&1))) {
  llvm_cbe_out_2e_addr = ((&base58_OC_buf.array[((int64_t)0)]));

}
  _15 = llvm_cbe_out_2e_addr;
  llvm_cbe_n = 34;
  *((&_15[((int64_t)34)])) = 0;

  uint32_t llvm_cbe_dec;
  _16 = llvm_cbe_n;
  llvm_cbe_dec = llvm_add_u32(_16, -1);
  llvm_cbe_n = (llvm_add_u32(_16, -1));
while (_16 != 0u){
  llvm_cbe_i = 0;
  llvm_cbe_c = 0;

  _17 = llvm_cbe_i;
while (((int32_t)_17) < ((int32_t)25u)){
  _18 = llvm_cbe_c;
  _19 = llvm_cbe_s_2e_addr;
  _20 = llvm_cbe_i;
  _21 = *((&_19[((int64_t)(((int64_t)(int32_t)_20)))]));
  llvm_cbe_c = (llvm_add_u32((llvm_mul_u32(_18, 256)), (((uint32_t)(uint8_t)_21))));
  _22 = llvm_cbe_c;
  _23 = llvm_cbe_s_2e_addr;
  _24 = llvm_cbe_i;
  *((&_23[((int64_t)(((int64_t)(int32_t)_24)))])) = (((uint8_t)(llvm_sdiv_u32(_22, 58))));
  _25 = llvm_cbe_c;
  llvm_cbe_c = (llvm_srem_u32(_25, 58));

  _26 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_26, 1));

  _17 = llvm_cbe_i;
}
  _27 = base58_OC_tmpl;
  _28 = llvm_cbe_c;
  _29 = *((&_27[((int64_t)(((int64_t)(int32_t)_28)))]));
  _30 = llvm_cbe_out_2e_addr;
  _31 = llvm_cbe_n;
  *((&_30[((int64_t)(((int64_t)(int32_t)_31)))])) = _29;

  _16 = llvm_cbe_n;
  llvm_cbe_dec = llvm_add_u32(_16, -1);
  llvm_cbe_n = (llvm_add_u32(_16, -1));
}
  llvm_cbe_n = 0;

  uint64_t llvm_cbe_idxprom11;
  uint8_t* llvm_cbe_arrayidx12;
  uint32_t llvm_cbe_conv13;
  _32 = llvm_cbe_out_2e_addr;
  _33 = llvm_cbe_n;
  llvm_cbe_idxprom11 = ((int64_t)(int32_t)_33);
  llvm_cbe_arrayidx12 = (&_32[((int64_t)(((int64_t)(int32_t)_33)))]);
  _34 = *((&_32[((int64_t)(((int64_t)(int32_t)_33)))]));
  llvm_cbe_conv13 = ((int32_t)(int8_t)_34);
while (llvm_cbe_conv13 == 49u){

  _35 = llvm_cbe_n;
  llvm_cbe_n = (llvm_add_u32(_35, 1));

  _32 = llvm_cbe_out_2e_addr;
  _33 = llvm_cbe_n;
  llvm_cbe_idxprom11 = ((int64_t)(int32_t)_33);
  llvm_cbe_arrayidx12 = (&_32[((int64_t)(((int64_t)(int32_t)_33)))]);
  _34 = *((&_32[((int64_t)(((int64_t)(int32_t)_33)))]));
  llvm_cbe_conv13 = ((int32_t)(int8_t)_34);
}
  _36 = llvm_cbe_out_2e_addr;
  _37 = llvm_cbe_out_2e_addr;
  _38 = llvm_cbe_n;
  _39 = llvm_cbe_n;
  _40 = memmove(_36, ((&_37[((int64_t)(((int64_t)(int32_t)_38)))])), (((int64_t)(int32_t)(llvm_sub_u32(34, _39)))));
  _41 = llvm_cbe_out_2e_addr;
  return _41;
}


uint8_t* coin_encode(uint8_t* llvm_cbe_x, uint8_t* llvm_cbe_y, uint8_t* llvm_cbe_out) {
  uint8_t* llvm_cbe_retval;    /* Address-exposed local */
  uint8_t* llvm_cbe_x_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_y_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_out_2e_addr;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_65_uint8_t llvm_cbe_s __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_25_uint8_t llvm_cbe_rmd __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _42;
  uint32_t llvm_cbe_call;
  uint8_t* _43;
  uint32_t llvm_cbe_call1;
  uint8_t* _44;
  uint8_t* _45;
  uint8_t* llvm_cbe_call7;
  uint8_t* llvm_cbe_call10;
  uint8_t* llvm_cbe_call14;
  uint8_t* llvm_cbe_call15;
  uint8_t* _46;
  uint8_t* _47;
  uint8_t* llvm_cbe_call17;
  uint8_t* _48;

  llvm_cbe_x_2e_addr = llvm_cbe_x;
  ;
  llvm_cbe_y_2e_addr = llvm_cbe_y;
  ;
  llvm_cbe_out_2e_addr = llvm_cbe_out;
  ;
  ;
  ;
  _42 = llvm_cbe_x_2e_addr;
  llvm_cbe_call = is_hex(_42);
  if (!(((llvm_cbe_call != 0u)&1))) {
  coin_err = ((&_OC_str_OC_2.array[((int64_t)0)]));
  llvm_cbe_retval = ((uint8_t*)/*NULL*/0);

  _48 = llvm_cbe_retval;
  return _48;
}
  _43 = llvm_cbe_y_2e_addr;
  llvm_cbe_call1 = is_hex(_43);
  if ((((llvm_cbe_call1 != 0u)&1))) {
  *((&llvm_cbe_s.array[((int64_t)0)])) = 4;
  _44 = llvm_cbe_x_2e_addr;
  str_to_byte(_44, ((&((&llvm_cbe_s.array[((int64_t)0)]))[((int64_t)1)])), 32);
  _45 = llvm_cbe_y_2e_addr;
  str_to_byte(_45, ((&((&llvm_cbe_s.array[((int64_t)0)]))[((int64_t)33)])), 32);
  *((&llvm_cbe_rmd.array[((int64_t)0)])) = 0;
  llvm_cbe_call7 = SHA256(((&llvm_cbe_s.array[((int64_t)0)])), 65, ((uint8_t*)/*NULL*/0));
  llvm_cbe_call10 = RIPEMD160(llvm_cbe_call7, 32, ((&((&llvm_cbe_rmd.array[((int64_t)0)]))[((int64_t)1)])));
  llvm_cbe_call14 = SHA256(((&llvm_cbe_rmd.array[((int64_t)0)])), 21, ((uint8_t*)/*NULL*/0));
  llvm_cbe_call15 = SHA256(llvm_cbe_call14, 32, ((uint8_t*)/*NULL*/0));
  _46 = memcpy(((&((&llvm_cbe_rmd.array[((int64_t)0)]))[((int64_t)21)])), llvm_cbe_call15, 4);
  _47 = llvm_cbe_out_2e_addr;
  llvm_cbe_call17 = base58(((&llvm_cbe_rmd.array[((int64_t)0)])), _47);
  llvm_cbe_retval = llvm_cbe_call17;

  } else {
  coin_err = ((&_OC_str_OC_2.array[((int64_t)0)]));
  llvm_cbe_retval = ((uint8_t*)/*NULL*/0);

}
  _48 = llvm_cbe_retval;
  return _48;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint8_t* llvm_cbe_call;
  uint32_t llvm_cbe_call1;

  llvm_cbe_retval = 0;
  llvm_cbe_call = coin_encode(((&_OC_str_OC_3.array[((int64_t)0)])), ((&_OC_str_OC_4.array[((int64_t)0)])), ((uint8_t*)/*NULL*/0));
  llvm_cbe_call1 = puts(llvm_cbe_call);
  return 0;
}

