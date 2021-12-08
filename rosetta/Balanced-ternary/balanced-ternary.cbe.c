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
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_3_uint32_t {
  uint32_t array[3];
};
struct l_array_16_uint8_t {
  uint8_t array[16];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};

/* External Global Variable Declarations */

/* Function Declarations */
void reverse(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint64_t strlen(uint8_t*) __ATTRIBUTELIST__((nothrow, pure));
void to_bt(uint32_t, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t from_bt(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
int8_t last_char(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
void add(uint8_t*, uint8_t*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* strcpy(uint8_t*, uint8_t*) __ATTRIBUTELIST__((nothrow));
uint8_t* strcat(uint8_t*, uint8_t*) __ATTRIBUTELIST__((nothrow));
void unary_minus(uint8_t*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
void subtract(uint8_t*, uint8_t*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
void mult(uint8_t*, uint8_t*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_3_uint8_t to_bt_OC_d = { "0+-" };
static struct l_array_3_uint32_t to_bt_OC_v = { { 0, 1, -1 } };
static __MSALIGN__(16) struct l_array_16_uint8_t __const_OC_mult_OC_r __attribute__((aligned(16))) = { "0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" };
static struct l_array_2_uint8_t _OC_str = { "0" };
static struct l_array_8_uint8_t _OC_str_OC_1 = { "+-0++0+" };
static struct l_array_6_uint8_t _OC_str_OC_2 = { "+-++-" };
static struct l_array_20_uint8_t _OC_str_OC_3 = { "      a: %14s %10d\n" };
static struct l_array_20_uint8_t _OC_str_OC_4 = { "      b: %14s %10d\n" };
static struct l_array_20_uint8_t _OC_str_OC_5 = { "      c: %14s %10d\n" };
static struct l_array_20_uint8_t _OC_str_OC_6 = { "a*(b-c): %14s %10d\n" };


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

void reverse(uint8_t* llvm_cbe_p) {
  uint8_t* llvm_cbe_p_2e_addr;    /* Address-exposed local */
  uint64_t llvm_cbe_len;    /* Address-exposed local */
  uint8_t* llvm_cbe_r;    /* Address-exposed local */
  uint8_t* _1;
  uint64_t llvm_cbe_call;
  uint8_t* _2;
  uint64_t _3;
  uint8_t* _4;
  uint8_t* _5;
  uint8_t* _6;
  uint8_t _7;
  uint8_t* _8;
  uint8_t _9;
  uint8_t* _10;
  uint8_t _11;
  uint8_t* _12;
  uint8_t _13;
  uint8_t* _14;
  uint8_t _15;
  uint8_t* _16;
  uint8_t _17;

  llvm_cbe_p_2e_addr = llvm_cbe_p;
  ;
  ;
  _1 = llvm_cbe_p_2e_addr;
  llvm_cbe_call = strlen(_1);
  llvm_cbe_len = llvm_cbe_call;
  ;
  _2 = llvm_cbe_p_2e_addr;
  _3 = llvm_cbe_len;
  llvm_cbe_r = ((&((&_2[((int64_t)_3)]))[((int64_t)-1)]));

  _4 = llvm_cbe_p_2e_addr;
  _5 = llvm_cbe_r;
while (((uint64_t)_4) < ((uint64_t)_5)){
  _6 = llvm_cbe_r;
  _7 = *_6;
  _8 = llvm_cbe_p_2e_addr;
  _9 = *_8;
  *_8 = (((uint8_t)((((int32_t)(int8_t)_9)) ^ (((int32_t)(int8_t)_7)))));
  _10 = llvm_cbe_p_2e_addr;
  _11 = *_10;
  _12 = llvm_cbe_r;
  _13 = *_12;
  *_12 = (((uint8_t)((((int32_t)(int8_t)_13)) ^ (((int32_t)(int8_t)_11)))));
  _14 = llvm_cbe_r;
  llvm_cbe_r = ((&_14[((int32_t)-1)]));
  _15 = *_14;
  _16 = llvm_cbe_p_2e_addr;
  llvm_cbe_p_2e_addr = ((&_16[((int32_t)1)]));
  _17 = *_16;
  *_16 = (((uint8_t)((((int32_t)(int8_t)_17)) ^ (((int32_t)(int8_t)_15)))));

  _4 = llvm_cbe_p_2e_addr;
  _5 = llvm_cbe_r;
}
  return;
}


void to_bt(uint32_t llvm_cbe_n, uint8_t* llvm_cbe_b) {
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_b_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_ptr;    /* Address-exposed local */
  uint32_t llvm_cbe_r;    /* Address-exposed local */
  uint8_t* _18;
  uint8_t* _19;
  uint32_t _20;
  uint32_t _21;
  uint32_t _22;
  uint32_t _23;
  uint32_t _24;
  uint8_t _25;
  uint8_t* _26;
  uint8_t* _27;
  uint8_t* llvm_cbe_incdec_2e_ptr;
  uint32_t _28;
  uint32_t _29;
  uint32_t _30;
  uint32_t _31;
  uint8_t* _32;

  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  llvm_cbe_b_2e_addr = llvm_cbe_b;
  ;
  ;
  _18 = llvm_cbe_b_2e_addr;
  llvm_cbe_ptr = _18;
  _19 = llvm_cbe_ptr;
  *_19 = 0;

  _20 = llvm_cbe_n_2e_addr;
while (_20 != 0u){
  ;
  _21 = llvm_cbe_n_2e_addr;
  llvm_cbe_r = (llvm_srem_u32(_21, 3));
  _22 = llvm_cbe_r;
  if ((((((int32_t)_22) < ((int32_t)0u))&1))) {
  _23 = llvm_cbe_r;
  llvm_cbe_r = (llvm_add_u32(_23, 3));

}
  _24 = llvm_cbe_r;
  _25 = *((&to_bt_OC_d.array[((int64_t)(((int64_t)(int32_t)_24)))]));
  _26 = llvm_cbe_ptr;
  *_26 = _25;
  _27 = llvm_cbe_ptr;
  llvm_cbe_incdec_2e_ptr = (&_27[((int32_t)1)]);
  llvm_cbe_ptr = llvm_cbe_incdec_2e_ptr;
  *llvm_cbe_incdec_2e_ptr = 0;
  _28 = llvm_cbe_r;
  _29 = *((&to_bt_OC_v.array[((int64_t)(((int64_t)(int32_t)_28)))]));
  _30 = llvm_cbe_n_2e_addr;
  llvm_cbe_n_2e_addr = (llvm_sub_u32(_30, _29));
  _31 = llvm_cbe_n_2e_addr;
  llvm_cbe_n_2e_addr = (llvm_sdiv_u32(_31, 3));

  _20 = llvm_cbe_n_2e_addr;
}
  _32 = llvm_cbe_b_2e_addr;
  reverse(_32);
}


uint32_t from_bt(uint8_t* llvm_cbe_a) {
  uint8_t* llvm_cbe_a_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_n;    /* Address-exposed local */
  uint8_t* _33;
  uint8_t _34;
  uint32_t _35;
  uint8_t* _36;
  uint8_t _37;
  uint32_t _38;
  uint8_t* _39;
  uint8_t _40;
  uint32_t _41;
  uint8_t* _42;
  uint32_t _43;

  llvm_cbe_a_2e_addr = llvm_cbe_a;
  ;
  ;
  llvm_cbe_n = 0;

  uint32_t llvm_cbe_conv;
  _33 = llvm_cbe_a_2e_addr;
  _34 = *_33;
  llvm_cbe_conv = ((int32_t)(int8_t)_34);
while (llvm_cbe_conv != 0u){
  _35 = llvm_cbe_n;
  llvm_cbe_n = (llvm_mul_u32(_35, 3));
  _36 = llvm_cbe_a_2e_addr;
  _37 = *_36;
  if (((((((int32_t)(int8_t)_37)) == 43u)&1))) {
  _38 = llvm_cbe_n;
  llvm_cbe_n = (llvm_add_u32(_38, 1));

  } else {
  _39 = llvm_cbe_a_2e_addr;
  _40 = *_39;
  if (((((((int32_t)(int8_t)_40)) == 45u)&1))) {
  _41 = llvm_cbe_n;
  llvm_cbe_n = (llvm_add_u32(_41, -1));

}

}
  _42 = llvm_cbe_a_2e_addr;
  llvm_cbe_a_2e_addr = ((&_42[((int32_t)1)]));

  _33 = llvm_cbe_a_2e_addr;
  _34 = *_33;
  llvm_cbe_conv = ((int32_t)(int8_t)_34);
}
  _43 = llvm_cbe_n;
  return _43;
}


int8_t last_char(uint8_t* llvm_cbe_ptr) {
  uint8_t llvm_cbe_retval;    /* Address-exposed local */
  uint8_t* llvm_cbe_ptr_2e_addr;    /* Address-exposed local */
  uint8_t llvm_cbe_c;    /* Address-exposed local */
  uint8_t* _44;
  uint8_t* _45;
  uint8_t _46;
  uint8_t* _47;
  uint8_t _48;
  uint8_t* _49;
  uint8_t* _50;
  uint8_t* _51;
  uint8_t _52;
  uint8_t* _53;
  uint8_t _54;
  uint8_t _55;

  llvm_cbe_ptr_2e_addr = llvm_cbe_ptr;
  ;
  ;
  _44 = llvm_cbe_ptr_2e_addr;
  if ((((_44 == ((uint8_t*)/*NULL*/0))&1))) {
  llvm_cbe_retval = 0;

  _55 = llvm_cbe_retval;
  return _55;
}
  _45 = llvm_cbe_ptr_2e_addr;
  _46 = *_45;
  if (((((((int32_t)(int8_t)_46)) == 0u)&1))) {
  llvm_cbe_retval = 0;

  _55 = llvm_cbe_retval;
  return _55;
}

  uint32_t llvm_cbe_conv3;
  _47 = llvm_cbe_ptr_2e_addr;
  _48 = *_47;
  llvm_cbe_conv3 = ((int32_t)(int8_t)_48);
while (llvm_cbe_conv3 != 0u){
  _49 = llvm_cbe_ptr_2e_addr;
  llvm_cbe_ptr_2e_addr = ((&_49[((int32_t)1)]));

  _47 = llvm_cbe_ptr_2e_addr;
  _48 = *_47;
  llvm_cbe_conv3 = ((int32_t)(int8_t)_48);
}
  _50 = llvm_cbe_ptr_2e_addr;
  llvm_cbe_ptr_2e_addr = ((&_50[((int32_t)-1)]));
  _51 = llvm_cbe_ptr_2e_addr;
  _52 = *_51;
  llvm_cbe_c = _52;
  _53 = llvm_cbe_ptr_2e_addr;
  *_53 = 0;
  _54 = llvm_cbe_c;
  llvm_cbe_retval = _54;

  _55 = llvm_cbe_retval;
  return _55;
}


void add(uint8_t* llvm_cbe_b1, uint8_t* llvm_cbe_b2, uint8_t* llvm_cbe_out) {
  uint8_t* llvm_cbe_b1_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_b2_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_out_2e_addr;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_c1 __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_c2 __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_ob1 __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_ob2 __attribute__((aligned(16)));    /* Address-exposed local */
  struct l_array_3_uint8_t llvm_cbe_d;    /* Address-exposed local */
  uint8_t llvm_cbe_L1;    /* Address-exposed local */
  uint8_t llvm_cbe_L2;    /* Address-exposed local */
  uint8_t* _56;
  uint8_t _57;
  uint8_t* _58;
  uint8_t _59;
  uint8_t* _60;
  uint8_t* _61;
  uint8_t* llvm_cbe_call;
  uint8_t* _62;
  uint8_t* llvm_cbe_call6;
  uint8_t llvm_cbe_call8;
  uint8_t llvm_cbe_call10;
  uint8_t _63;
  uint8_t _64;
  uint8_t _65;
  uint8_t _66;
  uint8_t _67;
  uint8_t _68;
  uint8_t _69;
  uint8_t _70;
  uint8_t _71;
  uint8_t _72;
  uint8_t _73;
  uint8_t _74;
  uint8_t _75;
  uint8_t _76;
  uint8_t _77;
  uint8_t _78;
  uint8_t _79;
  uint8_t* _80;
  uint8_t* llvm_cbe_call86;
  uint8_t* _81;
  uint8_t* llvm_cbe_call89;
  uint8_t* _82;
  uint8_t _83;
  uint8_t* _84;
  uint8_t* _85;
  uint8_t* llvm_cbe_call94;
  uint8_t* _86;
  uint8_t _87;
  uint8_t* _88;
  uint8_t* _89;
  uint8_t* llvm_cbe_call100;
  uint8_t* _90;
  uint8_t* _91;
  uint8_t _92;

  llvm_cbe_b1_2e_addr = llvm_cbe_b1;
  ;
  llvm_cbe_b2_2e_addr = llvm_cbe_b2;
  ;
  llvm_cbe_out_2e_addr = llvm_cbe_out;
  ;
  _56 = llvm_cbe_b1_2e_addr;
  _57 = *_56;
  if (((((((int32_t)(int8_t)_57)) != 0u)&1))) {
  _58 = llvm_cbe_b2_2e_addr;
  _59 = *_58;
  if (((((((int32_t)(int8_t)_59)) != 0u)&1))) {
  ;
  ;
  ;
  ;
  ;
  _60 = memset((((uint8_t*)(&llvm_cbe_d))), 0, 3);
  ;
  ;
  _61 = llvm_cbe_b1_2e_addr;
  llvm_cbe_call = strcpy(((&llvm_cbe_c1.array[((int64_t)0)])), _61);
  _62 = llvm_cbe_b2_2e_addr;
  llvm_cbe_call6 = strcpy(((&llvm_cbe_c2.array[((int64_t)0)])), _62);
  llvm_cbe_call8 = last_char(((&llvm_cbe_c1.array[((int64_t)0)])));
  llvm_cbe_L1 = llvm_cbe_call8;
  llvm_cbe_call10 = last_char(((&llvm_cbe_c2.array[((int64_t)0)])));
  llvm_cbe_L2 = llvm_cbe_call10;
  _63 = llvm_cbe_L2;
  _64 = llvm_cbe_L1;
  if ((((((int32_t)(((int32_t)(int8_t)_63))) < ((int32_t)(((int32_t)(int8_t)_64))))&1))) {
  _65 = llvm_cbe_L1;
  _66 = llvm_cbe_L2;
  llvm_cbe_L2 = (((uint8_t)((((int32_t)(int8_t)_66)) ^ (((int32_t)(int8_t)_65)))));
  _67 = llvm_cbe_L2;
  _68 = llvm_cbe_L1;
  llvm_cbe_L1 = (((uint8_t)((((int32_t)(int8_t)_68)) ^ (((int32_t)(int8_t)_67)))));
  _69 = llvm_cbe_L1;
  _70 = llvm_cbe_L2;
  llvm_cbe_L2 = (((uint8_t)((((int32_t)(int8_t)_70)) ^ (((int32_t)(int8_t)_69)))));

}
  _71 = llvm_cbe_L1;
  if (((((((int32_t)(int8_t)_71)) == 45u)&1))) {
  _72 = llvm_cbe_L2;
  if (((((((int32_t)(int8_t)_72)) == 48u)&1))) {
  *((&llvm_cbe_d.array[((int64_t)0)])) = 45;

}
  _73 = llvm_cbe_L2;
  if (((((((int32_t)(int8_t)_73)) == 45u)&1))) {
  *((&llvm_cbe_d.array[((int64_t)0)])) = 43;
  *((&llvm_cbe_d.array[((int64_t)1)])) = 45;

}

}
  _74 = llvm_cbe_L1;
  if (((((((int32_t)(int8_t)_74)) == 43u)&1))) {
  _75 = llvm_cbe_L2;
  if (((((((int32_t)(int8_t)_75)) == 48u)&1))) {
  *((&llvm_cbe_d.array[((int64_t)0)])) = 43;

}
  _76 = llvm_cbe_L2;
  if (((((((int32_t)(int8_t)_76)) == 45u)&1))) {
  *((&llvm_cbe_d.array[((int64_t)0)])) = 48;

}
  _77 = llvm_cbe_L2;
  if (((((((int32_t)(int8_t)_77)) == 43u)&1))) {
  *((&llvm_cbe_d.array[((int64_t)0)])) = 45;
  *((&llvm_cbe_d.array[((int64_t)1)])) = 43;

}

}
  _78 = llvm_cbe_L1;
  if (!((((((int32_t)(int8_t)_78)) == 48u)&1))) {
  _79 = llvm_cbe_L2;
  if (((((((int32_t)(int8_t)_79)) == 48u)&1))) {
  *((&llvm_cbe_d.array[((int64_t)0)])) = 48;

}

}
  add(((&llvm_cbe_c1.array[((int64_t)0)])), ((&llvm_cbe_d.array[((int64_t)1)])), ((&llvm_cbe_ob1.array[((int64_t)0)])));
  add(((&llvm_cbe_ob1.array[((int64_t)0)])), ((&llvm_cbe_c2.array[((int64_t)0)])), ((&llvm_cbe_ob2.array[((int64_t)0)])));
  _80 = llvm_cbe_out_2e_addr;
  llvm_cbe_call86 = strcpy(_80, ((&llvm_cbe_ob2.array[((int64_t)0)])));
  *((&llvm_cbe_d.array[((int64_t)1)])) = 0;
  _81 = llvm_cbe_out_2e_addr;
  llvm_cbe_call89 = strcat(_81, ((&llvm_cbe_d.array[((int64_t)0)])));

  } else {
  _82 = llvm_cbe_b1_2e_addr;
  _83 = *_82;
  if (((((((int32_t)(int8_t)_83)) != 0u)&1))) {
  _84 = llvm_cbe_out_2e_addr;
  _85 = llvm_cbe_b1_2e_addr;
  llvm_cbe_call94 = strcpy(_84, _85);

  } else {
  _86 = llvm_cbe_b2_2e_addr;
  _87 = *_86;
  if (((((((int32_t)(int8_t)_87)) != 0u)&1))) {
  _88 = llvm_cbe_out_2e_addr;
  _89 = llvm_cbe_b2_2e_addr;
  llvm_cbe_call100 = strcpy(_88, _89);

  } else {
  _90 = llvm_cbe_out_2e_addr;
  *_90 = 0;

}
}
}
  } else {
  _91 = llvm_cbe_b1_2e_addr;
  _92 = *_91;
  if (((((((int32_t)(int8_t)_92)) != 0u)&1))) {
  _84 = llvm_cbe_out_2e_addr;
  _85 = llvm_cbe_b1_2e_addr;
  llvm_cbe_call94 = strcpy(_84, _85);

  } else {
  _86 = llvm_cbe_b2_2e_addr;
  _87 = *_86;
  if (((((((int32_t)(int8_t)_87)) != 0u)&1))) {
  } else {
}
  _88 = llvm_cbe_out_2e_addr;
  _89 = llvm_cbe_b2_2e_addr;
  llvm_cbe_call100 = strcpy(_88, _89);

  _90 = llvm_cbe_out_2e_addr;
  *_90 = 0;


}
}

  return;
}


void unary_minus(uint8_t* llvm_cbe_b, uint8_t* llvm_cbe_out) {
  uint8_t* llvm_cbe_b_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_out_2e_addr;    /* Address-exposed local */
  uint8_t* _93;
  uint8_t _94;
  uint8_t* _95;
  uint8_t _96;
  uint8_t* _97;
  uint8_t* _98;
  uint8_t* _99;
  uint8_t _100;
  uint8_t* _101;
  uint8_t* _102;
  uint8_t* _103;
  uint8_t _104;
  uint8_t* _105;
  uint8_t* _106;

  llvm_cbe_b_2e_addr = llvm_cbe_b;
  ;
  llvm_cbe_out_2e_addr = llvm_cbe_out;
  ;

  uint32_t llvm_cbe_conv;
  _93 = llvm_cbe_b_2e_addr;
  _94 = *_93;
  llvm_cbe_conv = ((int32_t)(int8_t)_94);
while (llvm_cbe_conv != 0u){
  _95 = llvm_cbe_b_2e_addr;
  _96 = *_95;
  if (((((((int32_t)(int8_t)_96)) == 45u)&1))) {
  _97 = llvm_cbe_out_2e_addr;
  llvm_cbe_out_2e_addr = ((&_97[((int32_t)1)]));
  *_97 = 43;
  _98 = llvm_cbe_b_2e_addr;
  llvm_cbe_b_2e_addr = ((&_98[((int32_t)1)]));

  } else {
  _99 = llvm_cbe_b_2e_addr;
  _100 = *_99;
  if (((((((int32_t)(int8_t)_100)) == 43u)&1))) {
  _101 = llvm_cbe_out_2e_addr;
  llvm_cbe_out_2e_addr = ((&_101[((int32_t)1)]));
  *_101 = 45;
  _102 = llvm_cbe_b_2e_addr;
  llvm_cbe_b_2e_addr = ((&_102[((int32_t)1)]));

  } else {
  _103 = llvm_cbe_b_2e_addr;
  llvm_cbe_b_2e_addr = ((&_103[((int32_t)1)]));
  _104 = *_103;
  _105 = llvm_cbe_out_2e_addr;
  llvm_cbe_out_2e_addr = ((&_105[((int32_t)1)]));
  *_105 = _104;

}
}


  _93 = llvm_cbe_b_2e_addr;
  _94 = *_93;
  llvm_cbe_conv = ((int32_t)(int8_t)_94);
}
  _106 = llvm_cbe_out_2e_addr;
  *_106 = 0;
}


void subtract(uint8_t* llvm_cbe_b1, uint8_t* llvm_cbe_b2, uint8_t* llvm_cbe_out) {
  uint8_t* llvm_cbe_b1_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_b2_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_out_2e_addr;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_buf __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _107;
  uint8_t* _108;
  uint8_t* _109;

  llvm_cbe_b1_2e_addr = llvm_cbe_b1;
  ;
  llvm_cbe_b2_2e_addr = llvm_cbe_b2;
  ;
  llvm_cbe_out_2e_addr = llvm_cbe_out;
  ;
  ;
  _107 = llvm_cbe_b2_2e_addr;
  unary_minus(_107, ((&llvm_cbe_buf.array[((int64_t)0)])));
  _108 = llvm_cbe_b1_2e_addr;
  _109 = llvm_cbe_out_2e_addr;
  add(_108, ((&llvm_cbe_buf.array[((int64_t)0)])), _109);
}


void mult(uint8_t* llvm_cbe_b1, uint8_t* llvm_cbe_b2, uint8_t* llvm_cbe_out) {
  uint8_t* llvm_cbe_b1_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_b2_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_out_2e_addr;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_r __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_t __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_c1 __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_c2 __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* llvm_cbe_ptr;    /* Address-exposed local */
  uint8_t* _110;
  uint8_t* _111;
  uint8_t* llvm_cbe_call;
  uint8_t* _112;
  uint8_t* llvm_cbe_call3;
  uint8_t* _113;
  uint8_t _114;
  uint8_t* _115;
  uint8_t _116;
  uint8_t* llvm_cbe_call14;
  uint8_t* _117;
  uint8_t _118;
  uint8_t* llvm_cbe_call24;
  uint8_t* llvm_cbe_call27;
  uint8_t* _119;
  uint8_t* _120;
  uint8_t _121;
  uint8_t* _122;
  uint8_t* _123;
  uint8_t* _124;
  uint8_t* llvm_cbe_call36;

  llvm_cbe_b1_2e_addr = llvm_cbe_b1;
  ;
  llvm_cbe_b2_2e_addr = llvm_cbe_b2;
  ;
  llvm_cbe_out_2e_addr = llvm_cbe_out;
  ;
  ;
  _110 = memcpy((((uint8_t*)(&llvm_cbe_r))), ((&__const_OC_mult_OC_r.array[((int32_t)0)])), 16);
  ;
  ;
  ;
  ;
  llvm_cbe_ptr = ((&llvm_cbe_c2.array[((int64_t)0)]));
  _111 = llvm_cbe_b1_2e_addr;
  llvm_cbe_call = strcpy(((&llvm_cbe_c1.array[((int64_t)0)])), _111);
  _112 = llvm_cbe_b2_2e_addr;
  llvm_cbe_call3 = strcpy(((&llvm_cbe_c2.array[((int64_t)0)])), _112);
  reverse(((&llvm_cbe_c2.array[((int64_t)0)])));

  uint32_t llvm_cbe_conv;
  _113 = llvm_cbe_ptr;
  _114 = *_113;
  llvm_cbe_conv = ((int32_t)(int8_t)_114);
while (llvm_cbe_conv != 0u){
  _115 = llvm_cbe_ptr;
  _116 = *_115;
  if (((((((int32_t)(int8_t)_116)) == 43u)&1))) {
  add(((&llvm_cbe_r.array[((int64_t)0)])), ((&llvm_cbe_c1.array[((int64_t)0)])), ((&llvm_cbe_t.array[((int64_t)0)])));
  llvm_cbe_call14 = strcpy(((&llvm_cbe_r.array[((int64_t)0)])), ((&llvm_cbe_t.array[((int64_t)0)])));

}
  _117 = llvm_cbe_ptr;
  _118 = *_117;
  if (((((((int32_t)(int8_t)_118)) == 45u)&1))) {
  subtract(((&llvm_cbe_r.array[((int64_t)0)])), ((&llvm_cbe_c1.array[((int64_t)0)])), ((&llvm_cbe_t.array[((int64_t)0)])));
  llvm_cbe_call24 = strcpy(((&llvm_cbe_r.array[((int64_t)0)])), ((&llvm_cbe_t.array[((int64_t)0)])));

}
  llvm_cbe_call27 = strcat(((&llvm_cbe_c1.array[((int64_t)0)])), ((&_OC_str.array[((int64_t)0)])));
  _119 = llvm_cbe_ptr;
  llvm_cbe_ptr = ((&_119[((int32_t)1)]));

  _113 = llvm_cbe_ptr;
  _114 = *_113;
  llvm_cbe_conv = ((int32_t)(int8_t)_114);
}
  llvm_cbe_ptr = ((&llvm_cbe_r.array[((int64_t)0)]));

  uint32_t llvm_cbe_conv30;
  _120 = llvm_cbe_ptr;
  _121 = *_120;
  llvm_cbe_conv30 = ((int32_t)(int8_t)_121);
while (llvm_cbe_conv30 == 48u){
  _122 = llvm_cbe_ptr;
  llvm_cbe_ptr = ((&_122[((int32_t)1)]));

  _120 = llvm_cbe_ptr;
  _121 = *_120;
  llvm_cbe_conv30 = ((int32_t)(int8_t)_121);
}
  _123 = llvm_cbe_out_2e_addr;
  _124 = llvm_cbe_ptr;
  llvm_cbe_call36 = strcpy(_123, _124);
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint8_t* llvm_cbe_a;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_b __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* llvm_cbe_c;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_t __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_d __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _125;
  uint8_t* _126;
  uint8_t* _127;
  uint8_t* _128;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call5;
  uint32_t llvm_cbe_call8;
  uint32_t llvm_cbe_call9;
  uint8_t* _129;
  uint8_t* _130;
  uint32_t llvm_cbe_call10;
  uint32_t llvm_cbe_call11;
  uint32_t llvm_cbe_call14;
  uint32_t llvm_cbe_call15;

  llvm_cbe_retval = 0;
  ;
  llvm_cbe_a = ((&_OC_str_OC_1.array[((int64_t)0)]));
  ;
  ;
  llvm_cbe_c = ((&_OC_str_OC_2.array[((int64_t)0)]));
  ;
  ;
  to_bt(-436, ((&llvm_cbe_b.array[((int64_t)0)])));
  _125 = llvm_cbe_c;
  subtract(((&llvm_cbe_b.array[((int64_t)0)])), _125, ((&llvm_cbe_t.array[((int64_t)0)])));
  _126 = llvm_cbe_a;
  mult(_126, ((&llvm_cbe_t.array[((int64_t)0)])), ((&llvm_cbe_d.array[((int64_t)0)])));
  _127 = llvm_cbe_a;
  _128 = llvm_cbe_a;
  llvm_cbe_call = from_bt(_128);
  llvm_cbe_call5 = printf(((&_OC_str_OC_3.array[((int64_t)0)])), _127, llvm_cbe_call);
  llvm_cbe_call8 = from_bt(((&llvm_cbe_b.array[((int64_t)0)])));
  llvm_cbe_call9 = printf(((&_OC_str_OC_4.array[((int64_t)0)])), ((&llvm_cbe_b.array[((int64_t)0)])), llvm_cbe_call8);
  _129 = llvm_cbe_c;
  _130 = llvm_cbe_c;
  llvm_cbe_call10 = from_bt(_130);
  llvm_cbe_call11 = printf(((&_OC_str_OC_5.array[((int64_t)0)])), _129, llvm_cbe_call10);
  llvm_cbe_call14 = from_bt(((&llvm_cbe_d.array[((int64_t)0)])));
  llvm_cbe_call15 = printf(((&_OC_str_OC_6.array[((int64_t)0)])), ((&llvm_cbe_d.array[((int64_t)0)])), llvm_cbe_call14);
  return 0;
}

