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
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_7_uint8_t {
  uint8_t array[7];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_11_uint8_t_KC_ {
  uint8_t* array[11];
};
struct l_array_15_uint8_t {
  uint8_t array[15];
};
struct l_array_11_uint8_t {
  uint8_t array[11];
};
struct l_array_35_uint8_t {
  uint8_t array[35];
};
struct l_array_25_uint8_t {
  uint8_t array[25];
};
struct l_array_24_uint8_t {
  uint8_t array[24];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t search_needle(uint8_t*, uint8_t**) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t strcmp(uint8_t*, uint8_t*) __ATTRIBUTELIST__((nothrow, pure));
uint32_t search_last_needle(uint8_t*, uint8_t**) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_4_uint8_t _OC_str = { "Zig" };
static struct l_array_4_uint8_t _OC_str_OC_1 = { "Zag" };
static struct l_array_6_uint8_t _OC_str_OC_2 = { "Wally" };
static struct l_array_7_uint8_t _OC_str_OC_3 = { "Ronald" };
static struct l_array_5_uint8_t _OC_str_OC_4 = { "Bush" };
static struct l_array_7_uint8_t _OC_str_OC_5 = { "Krusty" };
static struct l_array_8_uint8_t _OC_str_OC_6 = { "Charlie" };
static struct l_array_4_uint8_t _OC_str_OC_7 = { "Boz" };
__MSALIGN__(16) struct l_array_11_uint8_t_KC_ haystack __attribute__((aligned(16))) = { { ((&_OC_str.array[((int32_t)0)])), ((&_OC_str_OC_1.array[((int32_t)0)])), ((&_OC_str_OC_2.array[((int32_t)0)])), ((&_OC_str_OC_3.array[((int32_t)0)])), ((&_OC_str_OC_4.array[((int32_t)0)])), ((&_OC_str_OC_5.array[((int32_t)0)])), ((&_OC_str_OC_6.array[((int32_t)0)])), ((&_OC_str_OC_4.array[((int32_t)0)])), ((&_OC_str_OC_7.array[((int32_t)0)])), ((&_OC_str_OC_1.array[((int32_t)0)])), ((uint8_t*)/*NULL*/0) } };
static struct l_array_15_uint8_t _OC_str_OC_8 = { "Bush is at %d\n" };
static struct l_array_11_uint8_t _OC_str_OC_9 = { "Washington" };
static struct l_array_35_uint8_t _OC_str_OC_10 = { "Washington is not in the haystack\n" };
static struct l_array_25_uint8_t _OC_str_OC_11 = { "First index for Zag: %d\n" };
static struct l_array_24_uint8_t _OC_str_OC_12 = { "Last index for Zag: %d\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

uint32_t search_needle(uint8_t* llvm_cbe_needle, uint8_t** llvm_cbe_hs) {
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint8_t* _1;
  uint8_t* _2;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint64_t llvm_cbe_idxprom;
  uint8_t** llvm_cbe_arrayidx;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx = (&llvm_cbe_hs[((int64_t)(((int64_t)(int32_t)i)))]);
  _1 = *((&llvm_cbe_hs[((int64_t)(((int64_t)(int32_t)i)))]));
while (_1 != ((uint8_t*)/*NULL*/0)){
  _2 = *((&llvm_cbe_hs[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call = strcmp(_2, llvm_cbe_needle);
  if ((((llvm_cbe_call == 0u)&1))) {
    llvm_cbe_retval_2e_0__PHI_TEMPORARY = i;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx = (&llvm_cbe_hs[((int64_t)(((int64_t)(int32_t)i)))]);
  _1 = *((&llvm_cbe_hs[((int64_t)(((int64_t)(int32_t)i)))]));
}
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = -1;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


uint32_t search_last_needle(uint8_t* llvm_cbe_needle, uint8_t** llvm_cbe_hs) {
  uint32_t llvm_cbe_call;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t last;
  uint32_t last__PHI_TEMPORARY;
  uint32_t llvm_cbe_inc;
  uint8_t* _3;
  uint8_t* _4;
  uint32_t llvm_cbe_call4;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  ;
  llvm_cbe_call = search_needle(llvm_cbe_needle, llvm_cbe_hs);
  ;
  ;
  if ((((((int32_t)llvm_cbe_call) < ((int32_t)0u))&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = -1;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = -1;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  i__PHI_TEMPORARY = llvm_cbe_call;   /* for PHI node */
  last__PHI_TEMPORARY = llvm_cbe_call;   /* for PHI node */

  uint64_t llvm_cbe_idxprom;
  uint8_t** llvm_cbe_arrayidx;
  i = i__PHI_TEMPORARY;
  last = last__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_inc = llvm_add_u32(i, 1);
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)llvm_cbe_inc);
  llvm_cbe_arrayidx = (&llvm_cbe_hs[((int64_t)(((int64_t)(int32_t)llvm_cbe_inc)))]);
  _3 = *((&llvm_cbe_hs[((int64_t)(((int64_t)(int32_t)llvm_cbe_inc)))]));
while (_3 != ((uint8_t*)/*NULL*/0)){
  _4 = *((&llvm_cbe_hs[((int64_t)(((int64_t)(int32_t)llvm_cbe_inc)))]));
  llvm_cbe_call4 = strcmp(llvm_cbe_needle, _4);
  if ((((llvm_cbe_call4 == 0u)&1))) {
  ;
  last__PHI_TEMPORARY = llvm_cbe_inc;   /* for PHI node */

}
  last = last__PHI_TEMPORARY;
  ;
  i__PHI_TEMPORARY = llvm_cbe_inc;   /* for PHI node */
  last__PHI_TEMPORARY = last;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  last = last__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_inc = llvm_add_u32(i, 1);
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)llvm_cbe_inc);
  llvm_cbe_arrayidx = (&llvm_cbe_hs[((int64_t)(((int64_t)(int32_t)llvm_cbe_inc)))]);
  _3 = *((&llvm_cbe_hs[((int64_t)(((int64_t)(int32_t)llvm_cbe_inc)))]));
}
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = last;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


int main(void) {
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call1;
  uint32_t llvm_cbe_call2;
  uint32_t llvm_cbe_call3;
  uint32_t llvm_cbe_call4;
  uint32_t llvm_cbe_call5;
  uint32_t llvm_cbe_call6;
  uint32_t llvm_cbe_call7;

  llvm_cbe_call = search_needle(((&_OC_str_OC_4.array[((int64_t)0)])), ((&haystack.array[((int64_t)0)])));
  llvm_cbe_call1 = printf(((&_OC_str_OC_8.array[((int64_t)0)])), llvm_cbe_call);
  llvm_cbe_call2 = search_needle(((&_OC_str_OC_9.array[((int64_t)0)])), ((&haystack.array[((int64_t)0)])));
  if ((((llvm_cbe_call2 == 4294967295u)&1))) {
  llvm_cbe_call3 = printf(((&_OC_str_OC_10.array[((int64_t)0)])));

  llvm_cbe_call4 = search_needle(((&_OC_str_OC_1.array[((int64_t)0)])), ((&haystack.array[((int64_t)0)])));
  llvm_cbe_call5 = printf(((&_OC_str_OC_11.array[((int64_t)0)])), llvm_cbe_call4);
  llvm_cbe_call6 = search_last_needle(((&_OC_str_OC_1.array[((int64_t)0)])), ((&haystack.array[((int64_t)0)])));
  llvm_cbe_call7 = printf(((&_OC_str_OC_12.array[((int64_t)0)])), llvm_cbe_call6);
  return 0;
}
  llvm_cbe_call4 = search_needle(((&_OC_str_OC_1.array[((int64_t)0)])), ((&haystack.array[((int64_t)0)])));
  llvm_cbe_call5 = printf(((&_OC_str_OC_11.array[((int64_t)0)])), llvm_cbe_call4);
  llvm_cbe_call6 = search_last_needle(((&_OC_str_OC_1.array[((int64_t)0)])), ((&haystack.array[((int64_t)0)])));
  llvm_cbe_call7 = printf(((&_OC_str_OC_12.array[((int64_t)0)])), llvm_cbe_call6);
  return 0;
}

