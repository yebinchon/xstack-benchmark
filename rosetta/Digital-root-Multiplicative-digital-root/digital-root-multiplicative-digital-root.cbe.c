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
struct l_array_4_uint32_t {
  uint32_t array[4];
};
struct l_array_21_uint8_t {
  uint8_t array[21];
};
struct l_array_17_uint8_t {
  uint8_t array[17];
};
struct l_array_16_uint8_t {
  uint8_t array[16];
};
struct l_array_7_uint8_t {
  uint8_t array[7];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_1_uint8_t {
  uint8_t array[1];
};
struct l_array_5_uint32_t {
  uint32_t array[5];
};
struct l_array_10_struct_AC_l_array_5_uint32_t {
  struct l_array_5_uint32_t array[10];
};
struct l_array_10_uint32_t {
  uint32_t array[10];
};

/* External Global Variable Declarations */

/* Function Declarations */
void _mdr(uint32_t*, uint32_t*, uint64_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static __MSALIGN__(16) struct l_array_4_uint32_t __const_OC_main_OC_values __attribute__((aligned(16))) = { { 123321, 7739, 893, 899998 } };
static struct l_array_21_uint8_t _OC_str = { "Number    MDR    MP\n" };
static struct l_array_17_uint8_t _OC_str_OC_1 = { "%6d   %3d   %3d\n" };
static struct l_array_16_uint8_t _OC_str_OC_2 = { "\nMDR: [n0..n4]\n" };
static struct l_array_7_uint8_t _OC_str_OC_3 = { "%3d: [" };
static struct l_array_5_uint8_t _OC_str_OC_4 = { "%d%s" };
static struct l_array_3_uint8_t _OC_str_OC_5 = { ", " };
static struct l_array_1_uint8_t _OC_str_OC_6;
static struct l_array_3_uint8_t _OC_str_OC_7 = { "]\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_select_u32(bool condition, uint32_t iftrue, uint32_t ifnot) {
  uint32_t r;
  r = condition ? iftrue : ifnot;
  return r;
}
static __forceinline uint8_t* llvm_select_pu8(bool condition, uint8_t* iftrue, uint8_t* ifnot) {
  uint8_t* r;
  r = condition ? iftrue : ifnot;
  return r;
}
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
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

void _mdr(uint32_t* llvm_cbe_rmdr, uint32_t* llvm_cbe_rmp, uint64_t llvm_cbe_n) {
  uint32_t* llvm_cbe_rmdr_2e_addr;    /* Address-exposed local */
  uint32_t* llvm_cbe_rmp_2e_addr;    /* Address-exposed local */
  uint64_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_r;    /* Address-exposed local */
  uint64_t _1;
  uint64_t _2;
  uint64_t _3;
  uint64_t _4;
  uint32_t _5;
  uint64_t _6;
  uint32_t* _7;
  uint32_t _8;
  uint32_t _9;
  uint32_t* _10;
  uint32_t* _11;
  uint32_t _12;
  uint32_t _13;
  uint32_t* _14;

  llvm_cbe_rmdr_2e_addr = llvm_cbe_rmdr;
  ;
  llvm_cbe_rmp_2e_addr = llvm_cbe_rmp;
  ;
  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  ;
  _1 = llvm_cbe_n_2e_addr;
  _2 = ((uint64_t)(bool)(((_1 != UINT64_C(0))&1)));
  llvm_cbe_r = (llvm_select_u32((((_1 != UINT64_C(0))&1)), 1, 0));

  _3 = llvm_cbe_n_2e_addr;
while (_3 != UINT64_C(0)){
  _4 = llvm_cbe_n_2e_addr;
  _5 = llvm_cbe_r;
  llvm_cbe_r = (((uint32_t)(llvm_mul_u64((((int64_t)(int32_t)_5)), (llvm_srem_u64(_4, 10))))));
  _6 = llvm_cbe_n_2e_addr;
  llvm_cbe_n_2e_addr = (llvm_sdiv_u64(_6, 10));

  _3 = llvm_cbe_n_2e_addr;
}
  _7 = llvm_cbe_rmp_2e_addr;
  _8 = *_7;
  *_7 = (llvm_add_u32(_8, 1));
  _9 = llvm_cbe_r;
  if ((((((int32_t)_9) >= ((int32_t)10u))&1))) {
  _10 = llvm_cbe_rmdr_2e_addr;
  _11 = llvm_cbe_rmp_2e_addr;
  _12 = llvm_cbe_r;
  _mdr(_10, _11, (((int64_t)(int32_t)_12)));

  } else {
  _13 = llvm_cbe_r;
  _14 = llvm_cbe_rmdr_2e_addr;
  *_14 = _13;

}
  return;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint32_t llvm_cbe_vmdr;    /* Address-exposed local */
  uint32_t llvm_cbe_vmp;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_4_uint32_t llvm_cbe_values __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_vsize;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_10_struct_AC_l_array_5_uint32_t llvm_cbe_table __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_10_uint32_t llvm_cbe_tfill __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_total;    /* Address-exposed local */
  uint8_t* _15;
  uint32_t llvm_cbe_call;
  uint32_t _16;
  uint32_t _17;
  uint32_t _18;
  uint32_t _19;
  uint32_t _20;
  uint32_t _21;
  uint32_t _22;
  uint32_t llvm_cbe_call3;
  uint32_t _23;
  uint8_t* _24;
  uint8_t* _25;
  uint32_t _26;
  uint32_t _27;
  uint32_t _28;
  uint32_t _29;
  uint32_t _30;
  uint32_t _31;
  uint32_t _32;
  uint32_t* llvm_cbe_arrayidx18;
  uint32_t _33;
  uint32_t _34;
  uint32_t _35;
  uint32_t llvm_cbe_call26;
  uint32_t _36;
  uint32_t _37;
  uint32_t llvm_cbe_call31;
  uint32_t _38;
  uint32_t _39;
  uint32_t _40;
  uint32_t _41;
  uint32_t _42;
  uint64_t _43;
  uint32_t llvm_cbe_call42;
  uint32_t _44;
  uint32_t llvm_cbe_call46;
  uint32_t _45;

  llvm_cbe_retval = 0;
  ;
  ;
  ;
  ;
  ;
  _15 = memcpy((((uint8_t*)(&llvm_cbe_values))), ((uint8_t*)(&__const_OC_main_OC_values)), 16);
  ;
  llvm_cbe_vsize = 4;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])));
  llvm_cbe_i = 0;

  _16 = llvm_cbe_i;
while (((int32_t)_16) < ((int32_t)4u)){

  llvm_cbe_vmp = 0;
  _17 = llvm_cbe_i;
  _18 = *((&llvm_cbe_values.array[((int64_t)(((int64_t)(int32_t)_17)))]));
  _mdr((&llvm_cbe_vmdr), (&llvm_cbe_vmp), (((int64_t)(int32_t)_18)));

  _19 = llvm_cbe_i;
  _20 = *((&llvm_cbe_values.array[((int64_t)(((int64_t)(int32_t)_19)))]));
  _21 = llvm_cbe_vmdr;
  _22 = llvm_cbe_vmp;
  llvm_cbe_call3 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _20, _21, _22);

  _23 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_23, 1));

  _16 = llvm_cbe_i;
}
  ;
  _24 = memset((((uint8_t*)(&llvm_cbe_table))), 0, 200);
  ;
  _25 = memset((((uint8_t*)(&llvm_cbe_tfill))), 0, 40);
  ;
  llvm_cbe_total = 0;
  llvm_cbe_i = 0;

  _26 = llvm_cbe_total;
while (((int32_t)_26) < ((int32_t)50u)){

  llvm_cbe_vmp = 0;
  _27 = llvm_cbe_i;
  _mdr((&llvm_cbe_vmdr), (&llvm_cbe_vmp), (((int64_t)(int32_t)_27)));

  _28 = llvm_cbe_vmdr;
  _29 = *((&llvm_cbe_tfill.array[((int64_t)(((int64_t)(int32_t)_28)))]));
  if ((((((int32_t)_29) < ((int32_t)5u))&1))) {
  _30 = llvm_cbe_i;
  _31 = llvm_cbe_vmdr;
  _32 = llvm_cbe_vmdr;
  llvm_cbe_arrayidx18 = (&llvm_cbe_tfill.array[((int64_t)(((int64_t)(int32_t)_32)))]);
  _33 = *llvm_cbe_arrayidx18;
  *llvm_cbe_arrayidx18 = (llvm_add_u32(_33, 1));
  *((&(*((&llvm_cbe_table.array[((int64_t)(((int64_t)(int32_t)_31)))]))).array[((int64_t)(((int64_t)(int32_t)_33)))])) = _30;
  _34 = llvm_cbe_total;
  llvm_cbe_total = (llvm_add_u32(_34, 1));

}

  _35 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_35, 1));

  _26 = llvm_cbe_total;
}
  llvm_cbe_call26 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  llvm_cbe_i = 0;

  _36 = llvm_cbe_i;
while (((int32_t)_36) < ((int32_t)10u)){
  _37 = llvm_cbe_i;
  llvm_cbe_call31 = printf(((&_OC_str_OC_3.array[((int64_t)0)])), _37);
  llvm_cbe_j = 0;

  _38 = llvm_cbe_j;
while (((int32_t)_38) < ((int32_t)5u)){
  _39 = llvm_cbe_i;
  _40 = llvm_cbe_j;
  _41 = *((&(*((&llvm_cbe_table.array[((int64_t)(((int64_t)(int32_t)_39)))]))).array[((int64_t)(((int64_t)(int32_t)_40)))]));
  _42 = llvm_cbe_j;
  _43 = ((uint64_t)(bool)(((_42 != 4u)&1)));
  llvm_cbe_call42 = printf(((&_OC_str_OC_4.array[((int64_t)0)])), _41, (llvm_select_pu8((((_42 != 4u)&1)), ((&_OC_str_OC_5.array[((int64_t)0)])), ((&_OC_str_OC_6.array[((int64_t)0)])))));

  _44 = llvm_cbe_j;
  llvm_cbe_j = (llvm_add_u32(_44, 1));

  _38 = llvm_cbe_j;
}
  llvm_cbe_call46 = printf(((&_OC_str_OC_7.array[((int64_t)0)])));

  _45 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_45, 1));

  _36 = llvm_cbe_i;
}
  return 0;
}

