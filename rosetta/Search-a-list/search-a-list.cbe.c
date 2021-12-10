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
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint8_t* llvm_cbe_needle_2e_addr;    /* Address-exposed local */
  uint8_t** llvm_cbe_hs_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint8_t** _1;
  uint32_t _2;
  uint8_t* _3;
  uint8_t** _4;
  uint32_t _5;
  uint8_t* _6;
  uint8_t* _7;
  uint32_t llvm_cbe_call;
  uint32_t _8;
  uint32_t _9;
  uint32_t _10;

  llvm_cbe_needle_2e_addr = llvm_cbe_needle;
  ;
  llvm_cbe_hs_2e_addr = llvm_cbe_hs;
  ;
  ;
  llvm_cbe_i = 0;

  uint64_t llvm_cbe_idxprom;
  uint8_t** llvm_cbe_arrayidx;
  _1 = llvm_cbe_hs_2e_addr;
  _2 = llvm_cbe_i;
  llvm_cbe_idxprom = ((int64_t)(int32_t)_2);
  llvm_cbe_arrayidx = (&_1[((int64_t)(((int64_t)(int32_t)_2)))]);
  _3 = *((&_1[((int64_t)(((int64_t)(int32_t)_2)))]));
while (_3 != ((uint8_t*)/*NULL*/0)){
  _4 = llvm_cbe_hs_2e_addr;
  _5 = llvm_cbe_i;
  _6 = *((&_4[((int64_t)(((int64_t)(int32_t)_5)))]));
  _7 = llvm_cbe_needle_2e_addr;
  llvm_cbe_call = strcmp(_6, _7);
  if ((((llvm_cbe_call == 0u)&1))) {
  _8 = llvm_cbe_i;
  llvm_cbe_retval = _8;
  _10 = llvm_cbe_retval;
  return _10;
}
  _9 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_9, 1));

  _1 = llvm_cbe_hs_2e_addr;
  _2 = llvm_cbe_i;
  llvm_cbe_idxprom = ((int64_t)(int32_t)_2);
  llvm_cbe_arrayidx = (&_1[((int64_t)(((int64_t)(int32_t)_2)))]);
  _3 = *((&_1[((int64_t)(((int64_t)(int32_t)_2)))]));
}
  llvm_cbe_retval = -1;

  _10 = llvm_cbe_retval;
  return _10;
}


uint32_t search_last_needle(uint8_t* llvm_cbe_needle, uint8_t** llvm_cbe_hs) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint8_t* llvm_cbe_needle_2e_addr;    /* Address-exposed local */
  uint8_t** llvm_cbe_hs_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_last;    /* Address-exposed local */
  uint8_t* _11;
  uint8_t** _12;
  uint32_t llvm_cbe_call;
  uint32_t _13;
  uint8_t** _14;
  uint32_t _15;
  uint32_t llvm_cbe_inc;
  uint8_t* _16;
  uint8_t* _17;
  uint8_t** _18;
  uint32_t _19;
  uint8_t* _20;
  uint32_t llvm_cbe_call4;
  uint32_t _21;
  uint32_t _22;
  uint32_t _23;

  llvm_cbe_needle_2e_addr = llvm_cbe_needle;
  ;
  llvm_cbe_hs_2e_addr = llvm_cbe_hs;
  ;
  ;
  ;
  llvm_cbe_last = 0;
  _11 = llvm_cbe_needle_2e_addr;
  _12 = llvm_cbe_hs_2e_addr;
  llvm_cbe_call = search_needle(_11, _12);
  llvm_cbe_last = llvm_cbe_call;
  llvm_cbe_i = llvm_cbe_call;
  _13 = llvm_cbe_last;
  if ((((((int32_t)_13) < ((int32_t)0u))&1))) {
  llvm_cbe_retval = -1;

  _23 = llvm_cbe_retval;
  return _23;
}

  uint64_t llvm_cbe_idxprom;
  uint8_t** llvm_cbe_arrayidx;
  _14 = llvm_cbe_hs_2e_addr;
  _15 = llvm_cbe_i;
  llvm_cbe_inc = llvm_add_u32(_15, 1);
  llvm_cbe_i = llvm_cbe_inc;
  llvm_cbe_idxprom = ((int64_t)(int32_t)llvm_cbe_inc);
  llvm_cbe_arrayidx = (&_14[((int64_t)(((int64_t)(int32_t)llvm_cbe_inc)))]);
  _16 = *((&_14[((int64_t)(((int64_t)(int32_t)llvm_cbe_inc)))]));
while (_16 != ((uint8_t*)/*NULL*/0)){
  _17 = llvm_cbe_needle_2e_addr;
  _18 = llvm_cbe_hs_2e_addr;
  _19 = llvm_cbe_i;
  _20 = *((&_18[((int64_t)(((int64_t)(int32_t)_19)))]));
  llvm_cbe_call4 = strcmp(_17, _20);
  if ((((llvm_cbe_call4 == 0u)&1))) {
  _21 = llvm_cbe_i;
  llvm_cbe_last = _21;

}

  _14 = llvm_cbe_hs_2e_addr;
  _15 = llvm_cbe_i;
  llvm_cbe_inc = llvm_add_u32(_15, 1);
  llvm_cbe_i = llvm_cbe_inc;
  llvm_cbe_idxprom = ((int64_t)(int32_t)llvm_cbe_inc);
  llvm_cbe_arrayidx = (&_14[((int64_t)(((int64_t)(int32_t)llvm_cbe_inc)))]);
  _16 = *((&_14[((int64_t)(((int64_t)(int32_t)llvm_cbe_inc)))]));
}
  _22 = llvm_cbe_last;
  llvm_cbe_retval = _22;

  _23 = llvm_cbe_retval;
  return _23;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call1;
  uint32_t llvm_cbe_call2;
  uint32_t llvm_cbe_call3;
  uint32_t llvm_cbe_call4;
  uint32_t llvm_cbe_call5;
  uint32_t llvm_cbe_call6;
  uint32_t llvm_cbe_call7;

  llvm_cbe_retval = 0;
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

