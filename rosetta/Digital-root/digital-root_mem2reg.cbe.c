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

/* Function definitions */

/* Types Definitions */
struct l_array_4_uint64_t {
  uint64_t array[4];
};
struct l_array_24_uint8_t {
  uint8_t array[24];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t droot(uint64_t, uint32_t, uint32_t*) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static __MSALIGN__(16) struct l_array_4_uint64_t __const_OC_main_OC_x __attribute__((aligned(16))) = { { 627615, 39390, 588225, INT64_C(393900588225) } };
static struct l_array_24_uint8_t _OC_str = { "%lld: pers %d, root %d\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint64_t llvm_sdiv_u64(int64_t a, int64_t b) {
  uint64_t r = a / b;
  return r;
}
static __forceinline uint64_t llvm_srem_u64(int64_t a, int64_t b) {
  uint64_t r = a % b;
  return r;
}


/* Function Bodies */

uint32_t droot(uint64_t llvm_cbe_x, uint32_t llvm_cbe_base, uint32_t* llvm_cbe_pers) {
  uint32_t d;
  uint32_t d__PHI_TEMPORARY;
  uint64_t x;
  uint64_t x__PHI_TEMPORARY;
  uint32_t _1;
  uint32_t llvm_cbe_d_2e_2_2e_splitted1;
  uint32_t llvm_cbe_d_2e_2_2e_splitted1__PHI_TEMPORARY;
  uint32_t llvm_cbe_d_2e_2_2e_splitted2;
  uint32_t llvm_cbe_d_2e_2_2e_splitted2__PHI_TEMPORARY;

  ;
  ;
  ;
  ;
  if ((((llvm_cbe_pers != ((uint32_t*)/*NULL*/0))&1))) {
  *llvm_cbe_pers = 0;
  d__PHI_TEMPORARY = 0;   /* for PHI node */
  x__PHI_TEMPORARY = llvm_cbe_x;   /* for PHI node */

  d = d__PHI_TEMPORARY;
  x = x__PHI_TEMPORARY;
  ;
  ;
  if (!(((((int64_t)x) >= ((int64_t)(((int64_t)(int32_t)llvm_cbe_base))))&1))) {
  }

  ;
  d__PHI_TEMPORARY = 0;   /* for PHI node */
  x__PHI_TEMPORARY = x;   /* for PHI node */

  d__PHI_TEMPORARY = d;   /* for PHI node */

  d = d__PHI_TEMPORARY;
  x = x__PHI_TEMPORARY;
  ;
  ;
  if (!(((x != UINT64_C(0))&1))) {
  }

  } else {
  if (!(((llvm_cbe_x != UINT64_C(0))&1))) {
    llvm_cbe_d_2e_2_2e_splitted2__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_d_2e_2_2e_splitted2 = llvm_cbe_d_2e_2_2e_splitted2__PHI_TEMPORARY;
  ;
  d__PHI_TEMPORARY = llvm_cbe_d_2e_2_2e_splitted2;   /* for PHI node */

    d__PHI_TEMPORARY = llvm_cbe_d_2e_2_2e_splitted2;   /* for PHI node */
  d = d__PHI_TEMPORARY;
  ;
  return d;
}
  d = ((uint32_t)(llvm_srem_u64(llvm_cbe_x, (((int64_t)(int32_t)(llvm_sub_u32(llvm_cbe_base, 1)))))));
  ;
  if ((((d != 0u)&1))) {
    llvm_cbe_d_2e_2_2e_splitted1__PHI_TEMPORARY = d;   /* for PHI node */
  llvm_cbe_d_2e_2_2e_splitted1 = llvm_cbe_d_2e_2_2e_splitted1__PHI_TEMPORARY;
  ;
  d__PHI_TEMPORARY = llvm_cbe_d_2e_2_2e_splitted2;   /* for PHI node */

    d__PHI_TEMPORARY = llvm_cbe_d_2e_2_2e_splitted2;   /* for PHI node */
  d = d__PHI_TEMPORARY;
  ;
  return d;
}
  d = llvm_sub_u32(llvm_cbe_base, 1);
  ;
  d__PHI_TEMPORARY = d;   /* for PHI node */

  d = d__PHI_TEMPORARY;
  ;
  d__PHI_TEMPORARY = d;   /* for PHI node */

}
  uint64_t llvm_cbe_conv;
  d = d__PHI_TEMPORARY;
  x = x__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_conv = ((int64_t)(int32_t)llvm_cbe_base);
while (((int64_t)x) >= ((int64_t)llvm_cbe_conv)){
  d = d__PHI_TEMPORARY;
  x = x__PHI_TEMPORARY;
  ;
  ;
while (x != UINT64_C(0)){

  d = ((uint32_t)(llvm_add_u64((((int64_t)(int32_t)d)), (llvm_srem_u64(x, (((int64_t)(int32_t)llvm_cbe_base)))))));
  ;
  x = llvm_sdiv_u64(x, (((int64_t)(int32_t)llvm_cbe_base)));
  ;
  d__PHI_TEMPORARY = d;   /* for PHI node */
  x__PHI_TEMPORARY = x;   /* for PHI node */

  d = d__PHI_TEMPORARY;
  x = x__PHI_TEMPORARY;
  ;
  ;
}

  x = ((int64_t)(int32_t)d);
  ;
  _1 = *llvm_cbe_pers;
  *llvm_cbe_pers = (llvm_add_u32(_1, 1));
  d__PHI_TEMPORARY = d;   /* for PHI node */
  x__PHI_TEMPORARY = x;   /* for PHI node */

  d = d__PHI_TEMPORARY;
  x = x__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_conv = ((int64_t)(int32_t)llvm_cbe_base);
}
  d = d__PHI_TEMPORARY;
  ;
  return d;
}


int main(void) {
  uint32_t llvm_cbe_pers;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_4_uint64_t llvm_cbe_x __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _2;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint64_t _3;
  uint32_t d;
  uint64_t _4;
  uint32_t _5;
  uint32_t llvm_cbe_call3;

  ;
  ;
  _2 = memcpy((((uint8_t*)(&llvm_cbe_x))), ((uint8_t*)(&__const_OC_main_OC_x)), 32);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)4u)){
  _3 = *((&llvm_cbe_x.array[((int64_t)(((int64_t)(int32_t)i)))]));
  d = droot(_3, 10, (&llvm_cbe_pers));
  ;
  _4 = *((&llvm_cbe_x.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _5 = llvm_cbe_pers;
  llvm_cbe_call3 = printf(((&_OC_str.array[((int64_t)0)])), _4, _5, d);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return 0;
}

