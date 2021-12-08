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
struct l_array_10_uint32_t {
  uint32_t array[10];
};
struct l_array_19_uint8_t {
  uint8_t array[19];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t bsearch(uint32_t*, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t bsearch_r(uint32_t*, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static __MSALIGN__(16) struct l_array_10_uint32_t __const_OC_main_OC_a __attribute__((aligned(16))) = { { -31, 0, 1, 2, 2, 4, 65, 83, 99, 782 } };
static struct l_array_19_uint8_t _OC_str = { "%d is at index %d\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint32_t llvm_sdiv_u32(int32_t a, int32_t b) {
  uint32_t r = a / b;
  return r;
}


/* Function Bodies */

uint32_t bsearch(uint32_t* llvm_cbe_a, uint32_t llvm_cbe_n, uint32_t llvm_cbe_x) {
  uint32_t j;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t j__PHI_TEMPORARY;
  uint32_t k;
  uint32_t _1;
  uint32_t _2;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  ;
  ;
  j = llvm_sub_u32(llvm_cbe_n, 1);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) <= ((int32_t)j)){
  k = llvm_add_u32(i, (llvm_sdiv_u32((llvm_sub_u32(j, i)), 2)));
  ;
  _1 = *((&llvm_cbe_a[((int64_t)(((int64_t)(int32_t)k)))]));
  if ((((_1 == llvm_cbe_x)&1))) {
    llvm_cbe_retval_2e_0__PHI_TEMPORARY = k;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  _2 = *((&llvm_cbe_a[((int64_t)(((int64_t)(int32_t)k)))]));
  if ((((((int32_t)_2) < ((int32_t)llvm_cbe_x))&1))) {
  i = llvm_add_u32(k, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */

  } else {
  j = llvm_sub_u32(k, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */

}
  i = i__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;

  i__PHI_TEMPORARY = i;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
}
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = -1;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


uint32_t bsearch_r(uint32_t* llvm_cbe_a, uint32_t llvm_cbe_x, uint32_t llvm_cbe_i, uint32_t llvm_cbe_j) {
  uint32_t k;
  uint32_t _3;
  uint32_t _4;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call10;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  ;
  ;
  if ((((((int32_t)llvm_cbe_j) < ((int32_t)llvm_cbe_i))&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = -1;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = -1;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  k = llvm_add_u32(llvm_cbe_i, (llvm_sdiv_u32((llvm_sub_u32(llvm_cbe_j, llvm_cbe_i)), 2)));
  ;
  _3 = *((&llvm_cbe_a[((int64_t)(((int64_t)(int32_t)k)))]));
  if ((((_3 == llvm_cbe_x)&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = k;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = k;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  _4 = *((&llvm_cbe_a[((int64_t)(((int64_t)(int32_t)k)))]));
  if ((((((int32_t)_4) < ((int32_t)llvm_cbe_x))&1))) {
  llvm_cbe_call = bsearch_r(llvm_cbe_a, llvm_cbe_x, (llvm_add_u32(k, 1)), llvm_cbe_j);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_call;   /* for PHI node */

  } else {
  llvm_cbe_call10 = bsearch_r(llvm_cbe_a, llvm_cbe_x, llvm_cbe_i, (llvm_sub_u32(k, 1)));
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_call10;   /* for PHI node */

}
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


int main(void) {
  __MSALIGN__(16) struct l_array_10_uint32_t llvm_cbe_a __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _5;
  uint32_t i;
  uint32_t llvm_cbe_call1;
  uint32_t llvm_cbe_call4;

  ;
  _5 = memcpy((((uint8_t*)(&llvm_cbe_a))), ((uint8_t*)(&__const_OC_main_OC_a)), 40);
  ;
  ;
  i = bsearch(((&llvm_cbe_a.array[((int64_t)0)])), 10, 2);
  ;
  llvm_cbe_call1 = printf(((&_OC_str.array[((int64_t)0)])), 2, i);
  ;
  i = bsearch_r(((&llvm_cbe_a.array[((int64_t)0)])), 5, 0, (llvm_sub_u32(10, 1)));
  ;
  llvm_cbe_call4 = printf(((&_OC_str.array[((int64_t)0)])), 5, i);
  return 0;
}

