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

#ifdef _MSC_VER
#define __MSALIGN__(X) __declspec(align(X))
#else
#define __MSALIGN__(X)
#endif



/* Global Declarations */

/* Types Declarations */
struct l_unnamed_1;

/* Function definitions */

/* Types Definitions */
struct l_array_7_uint8_t {
  uint8_t array[7];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};
struct l_array_32_uint32_t {
  uint32_t array[32];
};
struct l_array_31_uint32_t {
  uint32_t array[31];
};
#ifdef _MSC_VER
#pragma pack(push, 1)
#endif
struct l_unnamed_1 {
  uint32_t field0;
  struct l_array_31_uint32_t field1;
} __attribute__ ((packed));
#ifdef _MSC_VER
#pragma pack(pop)
#endif

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t atoi(uint8_t*) __ATTRIBUTELIST__((nothrow, pure));
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_7_uint8_t _OC_str = { "%u %u\n" };
static struct l_array_20_uint8_t _OC_str_OC_1 = { "\nTop %u count : %u\n" };


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
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint32_t llvm_udiv_u32(uint32_t a, uint32_t b) {
  uint32_t r = a / b;
  return r;
}
static __forceinline uint32_t llvm_urem_u32(uint32_t a, uint32_t b) {
  uint32_t r = a % b;
  return r;
}
static __forceinline uint32_t llvm_lshr_u32(uint32_t a, uint32_t b) {
  uint32_t r = a >> b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argc = (uint32_t)argc;
  uint8_t** llvm_cbe_argv = (uint8_t**)argv;
  __MSALIGN__(16) struct l_array_32_uint32_t llvm_cbe_pows __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _1;
  uint32_t top;
  uint8_t* llvm_cbe_call1;
  uint32_t* divsum;
  uint8_t* _2;
  uint8_t* _3;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t llvm_cbe_p_2e_0;
  uint32_t llvm_cbe_p_2e_0__PHI_TEMPORARY;
  uint32_t _4;
  uint32_t* llvm_cbe_arrayidx14;
  uint32_t _5;
  uint32_t x;
  uint32_t x__PHI_TEMPORARY;
  uint32_t _6;
  uint32_t _7;
  uint32_t k;
  uint32_t n;
  uint32_t n__PHI_TEMPORARY;
  uint32_t k__PHI_TEMPORARY;
  uint32_t _8;
  uint32_t s;
  uint32_t s__PHI_TEMPORARY;
  uint32_t _9;
  bool llvm_cbe_lnot;
  bool _10;
  bool _10__PHI_TEMPORARY;
  uint32_t _11;
  uint32_t* llvm_cbe_arrayidx57;
  uint32_t _12;
  uint32_t p;
  uint32_t p__PHI_TEMPORARY;
  uint32_t _13;
  uint32_t* llvm_cbe_arrayidx77;
  uint32_t _14;
  uint32_t cnt;
  uint32_t cnt__PHI_TEMPORARY;
  uint32_t a;
  uint32_t a__PHI_TEMPORARY;
  uint32_t b;
  uint32_t _15;
  uint32_t llvm_cbe_call99;
  uint32_t llvm_cbe_call105;
  uint32_t llvm_cbe_cnt_2e_1_2e_splitted1;
  uint32_t llvm_cbe_cnt_2e_1_2e_splitted1__PHI_TEMPORARY;
  uint32_t llvm_cbe_cnt_2e_1_2e_splitted2;
  uint32_t llvm_cbe_cnt_2e_1_2e_splitted2__PHI_TEMPORARY;
  uint32_t llvm_cbe_cnt_2e_1_2e_splitted3;
  uint32_t llvm_cbe_cnt_2e_1_2e_splitted3__PHI_TEMPORARY;

  ;
  ;
  _1 = *((&llvm_cbe_argv[((int64_t)1)]));
  top = atoi(_1);
  ;
  llvm_cbe_call1 = malloc((llvm_mul_u64((((uint64_t)(uint32_t)(llvm_add_u32(top, 1)))), 4)));
  divsum = ((uint32_t*)llvm_cbe_call1);
  ;
  ;
  _2 = ((uint8_t*)(&llvm_cbe_pows));
  _3 = memset(_2, 0, 128);
  *((&(((struct l_unnamed_1*)_2))->field0)) = 1;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((uint32_t)i) <= ((uint32_t)top)){
  *((&divsum[((int64_t)(((uint64_t)(uint32_t)i)))])) = 1;

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  ;
  llvm_cbe_p_2e_0__PHI_TEMPORARY = 2;   /* for PHI node */

  uint32_t llvm_cbe_add5;
  llvm_cbe_p_2e_0 = llvm_cbe_p_2e_0__PHI_TEMPORARY;
  ;
  llvm_cbe_add5 = llvm_add_u32(llvm_cbe_p_2e_0, llvm_cbe_p_2e_0);
while (((uint32_t)llvm_cbe_add5) <= ((uint32_t)top)){
  _4 = *((&divsum[((int64_t)(((uint64_t)(uint32_t)llvm_cbe_p_2e_0)))]));
  if ((((((uint32_t)_4) > ((uint32_t)1u))&1))) {
  llvm_cbe_arrayidx14 = (&divsum[((int64_t)(((uint64_t)(uint32_t)llvm_cbe_p_2e_0)))]);
  _5 = *llvm_cbe_arrayidx14;
  *llvm_cbe_arrayidx14 = (llvm_sub_u32(_5, llvm_cbe_p_2e_0));

  } else {
  ;
  x__PHI_TEMPORARY = 1;   /* for PHI node */

  x = x__PHI_TEMPORARY;
  ;
  _6 = *((&llvm_cbe_pows.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)))))]));
  if (!(((((uint32_t)_6) <= ((uint32_t)(llvm_udiv_u32(top, llvm_cbe_p_2e_0))))&1))) {
  }

  _7 = *((&llvm_cbe_pows.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)))))]));
  *((&llvm_cbe_pows.array[((int64_t)(((uint64_t)(uint32_t)x)))])) = (llvm_mul_u32(llvm_cbe_p_2e_0, _7));

  k = llvm_sub_u32(llvm_cbe_p_2e_0, 1);
  ;
  n = llvm_add_u32(llvm_cbe_p_2e_0, llvm_cbe_p_2e_0);
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */
  k__PHI_TEMPORARY = k;   /* for PHI node */

  x = llvm_add_u32(x, 1);
  ;
  x__PHI_TEMPORARY = x;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  k = k__PHI_TEMPORARY;
  ;
  ;
  if (!(((((uint32_t)n) <= ((uint32_t)top))&1))) {
  }

  _8 = *((&llvm_cbe_pows.array[((int64_t)1)]));
  s = llvm_add_u32(1, _8);
  ;
  k = llvm_add_u32(k, -1);
  ;
  if ((((k == 0u)&1))) {
  ;
  s__PHI_TEMPORARY = s;   /* for PHI node */
  i__PHI_TEMPORARY = 2;   /* for PHI node */

  s = s__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
  if (!(((((uint32_t)i) < ((uint32_t)x))&1))) {
    _10__PHI_TEMPORARY = 0;   /* for PHI node */
  }

  _9 = *((&llvm_cbe_pows.array[((int64_t)(((uint64_t)(uint32_t)i)))]));
  llvm_cbe_lnot = ((~(((((llvm_urem_u32(n, _9)) != 0u)&1))))&1);
  _10__PHI_TEMPORARY = llvm_cbe_lnot;   /* for PHI node */

  _10 = ((_10__PHI_TEMPORARY)&1);
  if (_10) {

  i = llvm_add_u32(i, 1);
  ;
  _11 = *((&llvm_cbe_pows.array[((int64_t)(((uint64_t)(uint32_t)i)))]));
  s = llvm_add_u32(s, _11);
  ;
  s__PHI_TEMPORARY = s;   /* for PHI node */
  i__PHI_TEMPORARY = i;   /* for PHI node */

}
  ;
  break;
}

  k = k__PHI_TEMPORARY;
  s = s__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_arrayidx57 = (&divsum[((int64_t)(((uint64_t)(uint32_t)n)))]);
  _12 = *llvm_cbe_arrayidx57;
  *llvm_cbe_arrayidx57 = (llvm_mul_u32(_12, s));

}
  uint32_t llvm_cbe_sub16;
  uint64_t llvm_cbe_idxprom17;
  uint32_t* llvm_cbe_arrayidx18;
  uint32_t llvm_cbe_div;
  x = x__PHI_TEMPORARY;
  ;
  llvm_cbe_sub16 = llvm_sub_u32(x, 1);
  llvm_cbe_idxprom17 = ((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)));
  llvm_cbe_arrayidx18 = (&llvm_cbe_pows.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)))))]);
  _6 = *((&llvm_cbe_pows.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)))))]));
  llvm_cbe_div = llvm_udiv_u32(top, llvm_cbe_p_2e_0);
while (((uint32_t)_6) <= ((uint32_t)llvm_cbe_div)){
  x = x__PHI_TEMPORARY;
  ;
  llvm_cbe_sub16 = llvm_sub_u32(x, 1);
  llvm_cbe_idxprom17 = ((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)));
  llvm_cbe_arrayidx18 = (&llvm_cbe_pows.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)))))]);
  _6 = *((&llvm_cbe_pows.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)))))]));
  llvm_cbe_div = llvm_udiv_u32(top, llvm_cbe_p_2e_0);
}
  n = n__PHI_TEMPORARY;
  k = k__PHI_TEMPORARY;
  ;
  ;
while (((uint32_t)n) <= ((uint32_t)top)){
){
  s = s__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_cmp44 = ((((uint32_t)i) < ((uint32_t)x))&1);
    if (!(((((uint32_t)i) < ((uint32_t)x))&1))) {
    _10__PHI_TEMPORARY = 0;   /* for PHI node */
  }

;
}
  n = llvm_add_u32(n, llvm_cbe_p_2e_0);
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */
  k__PHI_TEMPORARY = k;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  k = k__PHI_TEMPORARY;
  ;
  ;
}
  p = llvm_add_u32(llvm_cbe_p_2e_0, 1);
  ;
  llvm_cbe_p_2e_0__PHI_TEMPORARY = p;   /* for PHI node */

  llvm_cbe_p_2e_0 = llvm_cbe_p_2e_0__PHI_TEMPORARY;
  ;
  llvm_cbe_add5 = llvm_add_u32(llvm_cbe_p_2e_0, llvm_cbe_p_2e_0);
}
  p = llvm_add_u32((llvm_lshr_u32(top, 1)), 1);
  ;
  p__PHI_TEMPORARY = p;   /* for PHI node */

  p = p__PHI_TEMPORARY;
  ;
while (((uint32_t)p) <= ((uint32_t)top)){
  _13 = *((&divsum[((int64_t)(((uint64_t)(uint32_t)p)))]));
  if ((((((uint32_t)_13) > ((uint32_t)1u))&1))) {
  llvm_cbe_arrayidx77 = (&divsum[((int64_t)(((uint64_t)(uint32_t)p)))]);
  _14 = *llvm_cbe_arrayidx77;
  *llvm_cbe_arrayidx77 = (llvm_sub_u32(_14, p));

}

  p = llvm_add_u32(p, 1);
  ;
  p__PHI_TEMPORARY = p;   /* for PHI node */

  p = p__PHI_TEMPORARY;
  ;
}
  ;
  ;
  cnt__PHI_TEMPORARY = 0;   /* for PHI node */
  a__PHI_TEMPORARY = 1;   /* for PHI node */

  cnt = cnt__PHI_TEMPORARY;
  a = a__PHI_TEMPORARY;
  ;
  ;
while (((uint32_t)a) <= ((uint32_t)top)){
  b = *((&divsum[((int64_t)(((uint64_t)(uint32_t)a)))]));
  ;
  if ((((((uint32_t)b) > ((uint32_t)a))&1))) {
  if ((((((uint32_t)b) <= ((uint32_t)top))&1))) {
  _15 = *((&divsum[((int64_t)(((uint64_t)(uint32_t)b)))]));
  if ((((_15 == a)&1))) {
  llvm_cbe_call99 = printf(((&_OC_str.array[((int64_t)0)])), a, b);
  cnt = llvm_add_u32(cnt, 1);
  ;
  cnt__PHI_TEMPORARY = cnt;   /* for PHI node */

  cnt = cnt__PHI_TEMPORARY;
  ;

  } else {
    llvm_cbe_cnt_2e_1_2e_splitted1__PHI_TEMPORARY = cnt;   /* for PHI node */
  llvm_cbe_cnt_2e_1_2e_splitted1 = llvm_cbe_cnt_2e_1_2e_splitted1__PHI_TEMPORARY;
  ;

}
  } else {
    llvm_cbe_cnt_2e_1_2e_splitted2__PHI_TEMPORARY = cnt;   /* for PHI node */
  llvm_cbe_cnt_2e_1_2e_splitted2 = llvm_cbe_cnt_2e_1_2e_splitted2__PHI_TEMPORARY;
  ;

}
  } else {
    llvm_cbe_cnt_2e_1_2e_splitted3__PHI_TEMPORARY = cnt;   /* for PHI node */
  llvm_cbe_cnt_2e_1_2e_splitted3 = llvm_cbe_cnt_2e_1_2e_splitted3__PHI_TEMPORARY;
  ;

}
  a = llvm_add_u32(a, 1);
  ;
  cnt__PHI_TEMPORARY = cnt;   /* for PHI node */
  a__PHI_TEMPORARY = a;   /* for PHI node */

  cnt = cnt__PHI_TEMPORARY;
  a = a__PHI_TEMPORARY;
  ;
  ;
}
  llvm_cbe_call105 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), top, cnt);
  return 0;
}

