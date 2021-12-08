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
struct l_struct_struct_OC_str_t;

/* Function definitions */

/* Types Definitions */
struct l_array_18_uint8_t {
  uint8_t array[18];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_1_uint8_t {
  uint8_t array[1];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_struct_struct_OC_str_t {
  uint64_t field0;
  uint64_t field1;
  uint8_t* field2;
};

/* External Global Variable Declarations */

/* Function Declarations */
struct l_struct_struct_OC_str_t* str_new(uint64_t) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
void str_extend(struct l_struct_struct_OC_str_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* realloc(uint8_t*, uint64_t) __ATTRIBUTELIST__((nothrow));
void str_del(struct l_struct_struct_OC_str_t*) __ATTRIBUTELIST__((noinline, nothrow));
void free(uint8_t*) __ATTRIBUTELIST__((nothrow));
uint32_t str_cmp(struct l_struct_struct_OC_str_t*, struct l_struct_struct_OC_str_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t memcmp(uint8_t*, uint8_t*, uint64_t) __ATTRIBUTELIST__((nothrow, pure));
struct l_struct_struct_OC_str_t* str_dup(struct l_struct_struct_OC_str_t*) __ATTRIBUTELIST__((noinline, nothrow));
struct l_struct_struct_OC_str_t* str_from_chars(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint64_t strlen(uint8_t*) __ATTRIBUTELIST__((nothrow, pure));
void str_append(struct l_struct_struct_OC_str_t*, uint8_t) __ATTRIBUTELIST__((noinline, nothrow));
struct l_struct_struct_OC_str_t* str_substr(struct l_struct_struct_OC_str_t*, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
struct l_struct_struct_OC_str_t* str_cat(struct l_struct_struct_OC_str_t*, struct l_struct_struct_OC_str_t*) __ATTRIBUTELIST__((noinline, nothrow));
void str_swap(struct l_struct_struct_OC_str_t*, struct l_struct_struct_OC_str_t*) __ATTRIBUTELIST__((noinline, nothrow));
struct l_struct_struct_OC_str_t* str_subst(struct l_struct_struct_OC_str_t*, struct l_struct_struct_OC_str_t*, struct l_struct_struct_OC_str_t*) __ATTRIBUTELIST__((noinline, nothrow));
void str_set(struct l_struct_struct_OC_str_t*, struct l_struct_struct_OC_str_t*) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_18_uint8_t _OC_str = { "aaaaHaaaaaFaaaaHa" };
static struct l_array_5_uint8_t _OC_str_OC_1 = { "___." };
static struct l_array_1_uint8_t _OC_str_OC_2;
static struct l_array_6_uint8_t _OC_str_OC_3 = { "%.*s\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_select_u32(bool condition, uint32_t iftrue, uint32_t ifnot) {
  uint32_t r;
  r = condition ? iftrue : ifnot;
  return r;
}
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
static __forceinline uint64_t llvm_sub_u64(uint64_t a, uint64_t b) {
  uint64_t r = a - b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}


/* Function Bodies */

struct l_struct_struct_OC_str_t* str_new(uint64_t llvm_cbe_len) {
  uint64_t llvm_cbe_len_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* llvm_cbe_s;    /* Address-exposed local */
  uint8_t* llvm_cbe_call;
  uint64_t _1;
  uint64_t _2;
  struct l_struct_struct_OC_str_t* _3;
  uint64_t _4;
  uint8_t* llvm_cbe_call1;
  struct l_struct_struct_OC_str_t* _5;
  struct l_struct_struct_OC_str_t* _6;
  struct l_struct_struct_OC_str_t* _7;

  llvm_cbe_len_2e_addr = llvm_cbe_len;
  ;
  ;
  llvm_cbe_call = malloc(24);
  llvm_cbe_s = (((struct l_struct_struct_OC_str_t*)llvm_cbe_call));
  _1 = llvm_cbe_len_2e_addr;
  if ((((((uint64_t)_1) < ((uint64_t)UINT64_C(8)))&1))) {
  llvm_cbe_len_2e_addr = 8;

  _2 = llvm_cbe_len_2e_addr;
  _3 = llvm_cbe_s;
  *((&_3->field1)) = _2;
  _4 = llvm_cbe_len_2e_addr;
  llvm_cbe_call1 = malloc(_4);
  _5 = llvm_cbe_s;
  *((&_5->field2)) = llvm_cbe_call1;
  _6 = llvm_cbe_s;
  *((&_6->field0)) = 0;
  _7 = llvm_cbe_s;
  return _7;
}
  _2 = llvm_cbe_len_2e_addr;
  _3 = llvm_cbe_s;
  *((&_3->field1)) = _2;
  _4 = llvm_cbe_len_2e_addr;
  llvm_cbe_call1 = malloc(_4);
  _5 = llvm_cbe_s;
  *((&_5->field2)) = llvm_cbe_call1;
  _6 = llvm_cbe_s;
  *((&_6->field0)) = 0;
  _7 = llvm_cbe_s;
  return _7;
}


void str_extend(struct l_struct_struct_OC_str_t* llvm_cbe_s) {
  struct l_struct_struct_OC_str_t* llvm_cbe_s_2e_addr;    /* Address-exposed local */
  uint64_t llvm_cbe_ns;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* _8;
  uint64_t _9;
  uint64_t _10;
  struct l_struct_struct_OC_str_t* _11;
  uint64_t _12;
  struct l_struct_struct_OC_str_t* _13;
  uint64_t _14;
  struct l_struct_struct_OC_str_t* _15;
  uint8_t* _16;
  uint64_t _17;
  uint8_t* llvm_cbe_call;
  struct l_struct_struct_OC_str_t* _18;
  uint64_t _19;
  struct l_struct_struct_OC_str_t* _20;

  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  ;
  _8 = llvm_cbe_s_2e_addr;
  _9 = *((&_8->field1));
  llvm_cbe_ns = (llvm_mul_u64(_9, 2));
  _10 = llvm_cbe_ns;
  _11 = llvm_cbe_s_2e_addr;
  _12 = *((&_11->field1));
  if ((((((uint64_t)(llvm_sub_u64(_10, _12))) > ((uint64_t)UINT64_C(1024)))&1))) {
  _13 = llvm_cbe_s_2e_addr;
  _14 = *((&_13->field1));
  llvm_cbe_ns = (llvm_add_u64(_14, 1024));

  _15 = llvm_cbe_s_2e_addr;
  _16 = *((&_15->field2));
  _17 = llvm_cbe_ns;
  llvm_cbe_call = realloc(_16, _17);
  _18 = llvm_cbe_s_2e_addr;
  *((&_18->field2)) = llvm_cbe_call;
  _19 = llvm_cbe_ns;
  _20 = llvm_cbe_s_2e_addr;
  *((&_20->field1)) = _19;
}
  _15 = llvm_cbe_s_2e_addr;
  _16 = *((&_15->field2));
  _17 = llvm_cbe_ns;
  llvm_cbe_call = realloc(_16, _17);
  _18 = llvm_cbe_s_2e_addr;
  *((&_18->field2)) = llvm_cbe_call;
  _19 = llvm_cbe_ns;
  _20 = llvm_cbe_s_2e_addr;
  *((&_20->field1)) = _19;
}


void str_del(struct l_struct_struct_OC_str_t* llvm_cbe_s) {
  struct l_struct_struct_OC_str_t* llvm_cbe_s_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* _21;
  uint8_t* _22;
  struct l_struct_struct_OC_str_t* _23;

  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  _21 = llvm_cbe_s_2e_addr;
  _22 = *((&_21->field2));
  free(_22);
  _23 = llvm_cbe_s_2e_addr;
  free((((uint8_t*)_23)));
}


uint32_t str_cmp(struct l_struct_struct_OC_str_t* llvm_cbe_l, struct l_struct_struct_OC_str_t* llvm_cbe_r) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* llvm_cbe_l_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* llvm_cbe_r_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_res;    /* Address-exposed local */
  uint32_t llvm_cbe_len;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* _24;
  uint64_t _25;
  uint32_t _26;
  struct l_struct_struct_OC_str_t* _27;
  uint64_t _28;
  struct l_struct_struct_OC_str_t* _29;
  uint64_t _30;
  struct l_struct_struct_OC_str_t* _31;
  uint8_t* _32;
  struct l_struct_struct_OC_str_t* _33;
  uint8_t* _34;
  uint32_t _35;
  uint32_t llvm_cbe_call;
  uint32_t _36;
  struct l_struct_struct_OC_str_t* _37;
  uint64_t _38;
  struct l_struct_struct_OC_str_t* _39;
  uint64_t _40;
  uint64_t _41;
  uint32_t _42;

  llvm_cbe_l_2e_addr = llvm_cbe_l;
  ;
  llvm_cbe_r_2e_addr = llvm_cbe_r;
  ;
  ;
  ;
  _24 = llvm_cbe_l_2e_addr;
  _25 = *((&_24->field0));
  llvm_cbe_len = (((uint32_t)_25));
  _26 = llvm_cbe_len;
  _27 = llvm_cbe_r_2e_addr;
  _28 = *((&_27->field0));
  if ((((((uint64_t)(((int64_t)(int32_t)_26))) > ((uint64_t)_28))&1))) {
  _29 = llvm_cbe_r_2e_addr;
  _30 = *((&_29->field0));
  llvm_cbe_len = (((uint32_t)_30));

}
  _31 = llvm_cbe_l_2e_addr;
  _32 = *((&_31->field2));
  _33 = llvm_cbe_r_2e_addr;
  _34 = *((&_33->field2));
  _35 = llvm_cbe_len;
  llvm_cbe_call = memcmp(_32, _34, (((int64_t)(int32_t)_35)));
  llvm_cbe_res = llvm_cbe_call;
  if ((((llvm_cbe_call != 0u)&1))) {
  _36 = llvm_cbe_res;
  llvm_cbe_retval = _36;

  } else {
  _37 = llvm_cbe_l_2e_addr;
  _38 = *((&_37->field0));
  _39 = llvm_cbe_r_2e_addr;
  _40 = *((&_39->field0));
  _41 = ((uint64_t)(bool)(((((uint64_t)_38) > ((uint64_t)_40))&1)));
  llvm_cbe_retval = (llvm_select_u32((((((uint64_t)_38) > ((uint64_t)_40))&1)), 1, -1));

}
  _42 = llvm_cbe_retval;
  return _42;
}


struct l_struct_struct_OC_str_t* str_dup(struct l_struct_struct_OC_str_t* llvm_cbe_src) {
  struct l_struct_struct_OC_str_t* llvm_cbe_src_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* llvm_cbe_x;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* _43;
  uint64_t _44;
  struct l_struct_struct_OC_str_t* llvm_cbe_call;
  struct l_struct_struct_OC_str_t* _45;
  uint8_t* _46;
  struct l_struct_struct_OC_str_t* _47;
  uint8_t* _48;
  struct l_struct_struct_OC_str_t* _49;
  uint64_t _50;
  uint8_t* _51;
  struct l_struct_struct_OC_str_t* _52;
  uint64_t _53;
  struct l_struct_struct_OC_str_t* _54;
  struct l_struct_struct_OC_str_t* _55;

  llvm_cbe_src_2e_addr = llvm_cbe_src;
  ;
  ;
  _43 = llvm_cbe_src_2e_addr;
  _44 = *((&_43->field0));
  llvm_cbe_call = str_new(_44);
  llvm_cbe_x = llvm_cbe_call;
  _45 = llvm_cbe_x;
  _46 = *((&_45->field2));
  _47 = llvm_cbe_src_2e_addr;
  _48 = *((&_47->field2));
  _49 = llvm_cbe_src_2e_addr;
  _50 = *((&_49->field0));
  _51 = memcpy(_46, _48, _50);
  _52 = llvm_cbe_src_2e_addr;
  _53 = *((&_52->field0));
  _54 = llvm_cbe_x;
  *((&_54->field0)) = _53;
  _55 = llvm_cbe_x;
  return _55;
}


struct l_struct_struct_OC_str_t* str_from_chars(uint8_t* llvm_cbe_t) {
  struct l_struct_struct_OC_str_t* llvm_cbe_retval;    /* Address-exposed local */
  uint8_t* llvm_cbe_t_2e_addr;    /* Address-exposed local */
  uint64_t llvm_cbe_l;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* llvm_cbe_x;    /* Address-exposed local */
  uint8_t* _56;
  struct l_struct_struct_OC_str_t* llvm_cbe_call;
  uint8_t* _57;
  uint64_t llvm_cbe_call1;
  uint64_t _58;
  struct l_struct_struct_OC_str_t* llvm_cbe_call2;
  uint64_t _59;
  struct l_struct_struct_OC_str_t* _60;
  struct l_struct_struct_OC_str_t* _61;
  uint8_t* _62;
  uint8_t* _63;
  uint64_t _64;
  uint8_t* _65;
  struct l_struct_struct_OC_str_t* _66;
  struct l_struct_struct_OC_str_t* _67;

  llvm_cbe_t_2e_addr = llvm_cbe_t;
  ;
  _56 = llvm_cbe_t_2e_addr;
  if ((((_56 != ((uint8_t*)/*NULL*/0))&1))) {
  ;
  _57 = llvm_cbe_t_2e_addr;
  llvm_cbe_call1 = strlen(_57);
  llvm_cbe_l = llvm_cbe_call1;
  ;
  _58 = llvm_cbe_l;
  llvm_cbe_call2 = str_new((llvm_add_u64(_58, 1)));
  llvm_cbe_x = llvm_cbe_call2;
  _59 = llvm_cbe_l;
  _60 = llvm_cbe_x;
  *((&_60->field0)) = _59;
  _61 = llvm_cbe_x;
  _62 = *((&_61->field2));
  _63 = llvm_cbe_t_2e_addr;
  _64 = llvm_cbe_l;
  _65 = memcpy(_62, _63, _64);
  _66 = llvm_cbe_x;
  llvm_cbe_retval = _66;

  } else {
  llvm_cbe_call = str_new(0);
  llvm_cbe_retval = llvm_cbe_call;

}
  _67 = llvm_cbe_retval;
  return _67;
}


void str_append(struct l_struct_struct_OC_str_t* llvm_cbe_s, uint8_t llvm_cbe_b) {
  struct l_struct_struct_OC_str_t* llvm_cbe_s_2e_addr;    /* Address-exposed local */
  uint8_t llvm_cbe_b_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* _68;
  uint64_t _69;
  struct l_struct_struct_OC_str_t* _70;
  uint64_t _71;
  struct l_struct_struct_OC_str_t* _72;
  uint8_t _73;
  struct l_struct_struct_OC_str_t* _74;
  uint8_t* _75;
  struct l_struct_struct_OC_str_t* _76;
  uint64_t* llvm_cbe_len2;
  uint64_t _77;

  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  llvm_cbe_b_2e_addr = llvm_cbe_b;
  ;
  _68 = llvm_cbe_s_2e_addr;
  _69 = *((&_68->field0));
  _70 = llvm_cbe_s_2e_addr;
  _71 = *((&_70->field1));
  if ((((((uint64_t)_69) >= ((uint64_t)_71))&1))) {
  _72 = llvm_cbe_s_2e_addr;
  str_extend(_72);

  _73 = llvm_cbe_b_2e_addr;
  _74 = llvm_cbe_s_2e_addr;
  _75 = *((&_74->field2));
  _76 = llvm_cbe_s_2e_addr;
  llvm_cbe_len2 = (&_76->field0);
  _77 = *llvm_cbe_len2;
  *llvm_cbe_len2 = (llvm_add_u64(_77, 1));
  *((&_75[((int64_t)_77)])) = _73;
}
  _73 = llvm_cbe_b_2e_addr;
  _74 = llvm_cbe_s_2e_addr;
  _75 = *((&_74->field2));
  _76 = llvm_cbe_s_2e_addr;
  llvm_cbe_len2 = (&_76->field0);
  _77 = *llvm_cbe_len2;
  *llvm_cbe_len2 = (llvm_add_u64(_77, 1));
  *((&_75[((int64_t)_77)])) = _73;
}


struct l_struct_struct_OC_str_t* str_substr(struct l_struct_struct_OC_str_t* llvm_cbe_s, uint32_t llvm_cbe_from, uint32_t llvm_cbe_to) {
  struct l_struct_struct_OC_str_t* llvm_cbe_retval;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* llvm_cbe_s_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_from_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_to_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* llvm_cbe_x;    /* Address-exposed local */
  uint32_t _78;
  struct l_struct_struct_OC_str_t* _79;
  uint64_t _80;
  uint32_t _81;
  struct l_struct_struct_OC_str_t* _82;
  uint64_t _83;
  uint32_t _84;
  uint32_t _85;
  uint32_t _86;
  struct l_struct_struct_OC_str_t* _87;
  uint64_t _88;
  uint32_t _89;
  uint32_t _90;
  uint32_t _91;
  uint32_t _92;
  uint32_t _93;
  struct l_struct_struct_OC_str_t* llvm_cbe_call;
  uint32_t _94;
  uint32_t _95;
  struct l_struct_struct_OC_str_t* _96;
  struct l_struct_struct_OC_str_t* _97;
  uint8_t* _98;
  struct l_struct_struct_OC_str_t* _99;
  uint8_t* _100;
  uint32_t _101;
  struct l_struct_struct_OC_str_t* _102;
  uint64_t _103;
  uint8_t* _104;
  struct l_struct_struct_OC_str_t* _105;
  struct l_struct_struct_OC_str_t* _106;

  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  llvm_cbe_from_2e_addr = llvm_cbe_from;
  ;
  llvm_cbe_to_2e_addr = llvm_cbe_to;
  ;
  _78 = llvm_cbe_to_2e_addr;
  if (!(((_78 != 0u)&1))) {
  _79 = llvm_cbe_s_2e_addr;
  _80 = *((&_79->field0));
  llvm_cbe_to_2e_addr = (((uint32_t)_80));

}
  _81 = llvm_cbe_from_2e_addr;
  if ((((((int32_t)_81) < ((int32_t)0u))&1))) {
  _82 = llvm_cbe_s_2e_addr;
  _83 = *((&_82->field0));
  _84 = llvm_cbe_from_2e_addr;
  llvm_cbe_from_2e_addr = (((uint32_t)(llvm_add_u64((((int64_t)(int32_t)_84)), _83))));

}
  _85 = llvm_cbe_from_2e_addr;
  if ((((((int32_t)_85) < ((int32_t)0u))&1))) {
  llvm_cbe_retval = ((struct l_struct_struct_OC_str_t*)/*NULL*/0);

  _106 = llvm_cbe_retval;
  return _106;
}
  _86 = llvm_cbe_from_2e_addr;
  _87 = llvm_cbe_s_2e_addr;
  _88 = *((&_87->field0));
  if ((((((uint64_t)(((int64_t)(int32_t)_86))) >= ((uint64_t)_88))&1))) {
  llvm_cbe_retval = ((struct l_struct_struct_OC_str_t*)/*NULL*/0);

  _106 = llvm_cbe_retval;
  return _106;
}
  _89 = llvm_cbe_to_2e_addr;
  _90 = llvm_cbe_from_2e_addr;
  if (!(((((int32_t)_89) < ((int32_t)_90))&1))) {
  _91 = llvm_cbe_from_2e_addr;
  llvm_cbe_to_2e_addr = (llvm_add_u32(_91, 1));

}
  ;
  _92 = llvm_cbe_to_2e_addr;
  _93 = llvm_cbe_from_2e_addr;
  llvm_cbe_call = str_new((((int64_t)(int32_t)(llvm_sub_u32(_92, _93)))));
  llvm_cbe_x = llvm_cbe_call;
  _94 = llvm_cbe_to_2e_addr;
  _95 = llvm_cbe_from_2e_addr;
  _96 = llvm_cbe_x;
  *((&_96->field0)) = (((int64_t)(int32_t)(llvm_sub_u32(_94, _95))));
  _97 = llvm_cbe_x;
  _98 = *((&_97->field2));
  _99 = llvm_cbe_s_2e_addr;
  _100 = *((&_99->field2));
  _101 = llvm_cbe_from_2e_addr;
  _102 = llvm_cbe_x;
  _103 = *((&_102->field0));
  _104 = memcpy(_98, ((&_100[((int64_t)(((int64_t)(int32_t)_101)))])), _103);
  _105 = llvm_cbe_x;
  llvm_cbe_retval = _105;

  _106 = llvm_cbe_retval;
  return _106;
}


struct l_struct_struct_OC_str_t* str_cat(struct l_struct_struct_OC_str_t* llvm_cbe_s, struct l_struct_struct_OC_str_t* llvm_cbe_s2) {
  struct l_struct_struct_OC_str_t* llvm_cbe_s_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* llvm_cbe_s2_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* _107;
  uint64_t _108;
  struct l_struct_struct_OC_str_t* _109;
  uint64_t _110;
  struct l_struct_struct_OC_str_t* _111;
  uint64_t _112;
  struct l_struct_struct_OC_str_t* _113;
  struct l_struct_struct_OC_str_t* _114;
  uint8_t* _115;
  struct l_struct_struct_OC_str_t* _116;
  uint64_t _117;
  struct l_struct_struct_OC_str_t* _118;
  uint8_t* _119;
  struct l_struct_struct_OC_str_t* _120;
  uint64_t _121;
  uint8_t* _122;
  struct l_struct_struct_OC_str_t* _123;
  uint64_t _124;
  struct l_struct_struct_OC_str_t* _125;
  uint64_t* llvm_cbe_len8;
  uint64_t _126;
  struct l_struct_struct_OC_str_t* _127;

  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  llvm_cbe_s2_2e_addr = llvm_cbe_s2;
  ;

  uint64_t* llvm_cbe_alloc;
  uint64_t* llvm_cbe_len;
  uint64_t* llvm_cbe_len1;
  uint64_t llvm_cbe_add;
  _107 = llvm_cbe_s_2e_addr;
  llvm_cbe_alloc = (&_107->field1);
  _108 = *((&_107->field1));
  _109 = llvm_cbe_s_2e_addr;
  llvm_cbe_len = (&_109->field0);
  _110 = *((&_109->field0));
  _111 = llvm_cbe_s2_2e_addr;
  llvm_cbe_len1 = (&_111->field0);
  _112 = *((&_111->field0));
  llvm_cbe_add = llvm_add_u64(_110, _112);
while (((uint64_t)_108) < ((uint64_t)llvm_cbe_add)){
  _113 = llvm_cbe_s_2e_addr;
  str_extend(_113);

  _107 = llvm_cbe_s_2e_addr;
  llvm_cbe_alloc = (&_107->field1);
  _108 = *((&_107->field1));
  _109 = llvm_cbe_s_2e_addr;
  llvm_cbe_len = (&_109->field0);
  _110 = *((&_109->field0));
  _111 = llvm_cbe_s2_2e_addr;
  llvm_cbe_len1 = (&_111->field0);
  _112 = *((&_111->field0));
  llvm_cbe_add = llvm_add_u64(_110, _112);
}
  _114 = llvm_cbe_s_2e_addr;
  _115 = *((&_114->field2));
  _116 = llvm_cbe_s_2e_addr;
  _117 = *((&_116->field0));
  _118 = llvm_cbe_s2_2e_addr;
  _119 = *((&_118->field2));
  _120 = llvm_cbe_s2_2e_addr;
  _121 = *((&_120->field0));
  _122 = memcpy(((&_115[((int64_t)_117)])), _119, _121);
  _123 = llvm_cbe_s2_2e_addr;
  _124 = *((&_123->field0));
  _125 = llvm_cbe_s_2e_addr;
  llvm_cbe_len8 = (&_125->field0);
  _126 = *llvm_cbe_len8;
  *llvm_cbe_len8 = (llvm_add_u64(_126, _124));
  _127 = llvm_cbe_s_2e_addr;
  return _127;
}


void str_swap(struct l_struct_struct_OC_str_t* llvm_cbe_a, struct l_struct_struct_OC_str_t* llvm_cbe_b) {
  struct l_struct_struct_OC_str_t* llvm_cbe_a_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* llvm_cbe_b_2e_addr;    /* Address-exposed local */
  uint64_t llvm_cbe_tz;    /* Address-exposed local */
  uint8_t* llvm_cbe_ts;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* _128;
  uint64_t _129;
  struct l_struct_struct_OC_str_t* _130;
  uint64_t _131;
  struct l_struct_struct_OC_str_t* _132;
  uint64_t _133;
  struct l_struct_struct_OC_str_t* _134;
  struct l_struct_struct_OC_str_t* _135;
  uint64_t _136;
  struct l_struct_struct_OC_str_t* _137;
  uint64_t _138;
  struct l_struct_struct_OC_str_t* _139;
  uint64_t _140;
  struct l_struct_struct_OC_str_t* _141;
  struct l_struct_struct_OC_str_t* _142;
  uint8_t* _143;
  struct l_struct_struct_OC_str_t* _144;
  uint8_t* _145;
  struct l_struct_struct_OC_str_t* _146;
  uint8_t* _147;
  struct l_struct_struct_OC_str_t* _148;

  llvm_cbe_a_2e_addr = llvm_cbe_a;
  ;
  llvm_cbe_b_2e_addr = llvm_cbe_b;
  ;
  ;
  ;
  _128 = llvm_cbe_a_2e_addr;
  _129 = *((&_128->field1));
  llvm_cbe_tz = _129;
  _130 = llvm_cbe_b_2e_addr;
  _131 = *((&_130->field1));
  _132 = llvm_cbe_a_2e_addr;
  *((&_132->field1)) = _131;
  _133 = llvm_cbe_tz;
  _134 = llvm_cbe_b_2e_addr;
  *((&_134->field1)) = _133;
  _135 = llvm_cbe_a_2e_addr;
  _136 = *((&_135->field0));
  llvm_cbe_tz = _136;
  _137 = llvm_cbe_b_2e_addr;
  _138 = *((&_137->field0));
  _139 = llvm_cbe_a_2e_addr;
  *((&_139->field0)) = _138;
  _140 = llvm_cbe_tz;
  _141 = llvm_cbe_b_2e_addr;
  *((&_141->field0)) = _140;
  _142 = llvm_cbe_a_2e_addr;
  _143 = *((&_142->field2));
  llvm_cbe_ts = _143;
  _144 = llvm_cbe_b_2e_addr;
  _145 = *((&_144->field2));
  _146 = llvm_cbe_a_2e_addr;
  *((&_146->field2)) = _145;
  _147 = llvm_cbe_ts;
  _148 = llvm_cbe_b_2e_addr;
  *((&_148->field2)) = _147;
}


struct l_struct_struct_OC_str_t* str_subst(struct l_struct_struct_OC_str_t* llvm_cbe_tgt, struct l_struct_struct_OC_str_t* llvm_cbe_pat, struct l_struct_struct_OC_str_t* llvm_cbe_repl) {
  struct l_struct_struct_OC_str_t* llvm_cbe_tgt_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* llvm_cbe_pat_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* llvm_cbe_repl_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* llvm_cbe_tmp;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* llvm_cbe_call;
  uint32_t _149;
  struct l_struct_struct_OC_str_t* _150;
  uint64_t _151;
  struct l_struct_struct_OC_str_t* _152;
  uint64_t _153;
  struct l_struct_struct_OC_str_t* _154;
  uint8_t* _155;
  uint32_t _156;
  struct l_struct_struct_OC_str_t* _157;
  uint8_t* _158;
  struct l_struct_struct_OC_str_t* _159;
  uint64_t _160;
  uint32_t llvm_cbe_call5;
  struct l_struct_struct_OC_str_t* _161;
  struct l_struct_struct_OC_str_t* _162;
  uint8_t* _163;
  uint32_t _164;
  uint8_t _165;
  uint32_t _166;
  struct l_struct_struct_OC_str_t* _167;
  struct l_struct_struct_OC_str_t* _168;
  struct l_struct_struct_OC_str_t* llvm_cbe_call7;
  struct l_struct_struct_OC_str_t* _169;
  uint64_t _170;
  uint32_t _171;
  struct l_struct_struct_OC_str_t* _172;
  uint64_t _173;
  struct l_struct_struct_OC_str_t* _174;
  struct l_struct_struct_OC_str_t* _175;
  uint8_t* _176;
  uint32_t _177;
  uint8_t _178;
  uint32_t _179;
  struct l_struct_struct_OC_str_t* _180;
  uint64_t _181;
  struct l_struct_struct_OC_str_t* _182;
  struct l_struct_struct_OC_str_t* _183;
  uint8_t* _184;
  uint32_t _185;
  uint8_t _186;
  struct l_struct_struct_OC_str_t* _187;
  struct l_struct_struct_OC_str_t* _188;
  struct l_struct_struct_OC_str_t* _189;
  struct l_struct_struct_OC_str_t* _190;

  llvm_cbe_tgt_2e_addr = llvm_cbe_tgt;
  ;
  llvm_cbe_pat_2e_addr = llvm_cbe_pat;
  ;
  llvm_cbe_repl_2e_addr = llvm_cbe_repl;
  ;
  ;
  llvm_cbe_call = str_new(0);
  llvm_cbe_tmp = llvm_cbe_call;
  ;
  llvm_cbe_i = 0;

  uint64_t llvm_cbe_conv;
  uint64_t* llvm_cbe_len;
  uint64_t llvm_cbe_add;
  uint64_t* llvm_cbe_len1;
  _149 = llvm_cbe_i;
  llvm_cbe_conv = ((int64_t)(int32_t)_149);
  _150 = llvm_cbe_pat_2e_addr;
  llvm_cbe_len = (&_150->field0);
  _151 = *((&_150->field0));
  llvm_cbe_add = llvm_add_u64((((int64_t)(int32_t)_149)), _151);
  _152 = llvm_cbe_tgt_2e_addr;
  llvm_cbe_len1 = (&_152->field0);
  _153 = *((&_152->field0));
while (((uint64_t)llvm_cbe_add) <= ((uint64_t)_153)){
  _154 = llvm_cbe_tgt_2e_addr;
  _155 = *((&_154->field2));
  _156 = llvm_cbe_i;
  _157 = llvm_cbe_pat_2e_addr;
  _158 = *((&_157->field2));
  _159 = llvm_cbe_pat_2e_addr;
  _160 = *((&_159->field0));
  llvm_cbe_call5 = memcmp(((&_155[((int64_t)(((int64_t)(int32_t)_156)))])), _158, _160);
  if ((((llvm_cbe_call5 != 0u)&1))) {
  _161 = llvm_cbe_tmp;
  _162 = llvm_cbe_tgt_2e_addr;
  _163 = *((&_162->field2));
  _164 = llvm_cbe_i;
  _165 = *((&_163[((int64_t)(((int64_t)(int32_t)_164)))]));
  str_append(_161, _165);
  _166 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_166, 1));

  } else {
  _167 = llvm_cbe_tmp;
  _168 = llvm_cbe_repl_2e_addr;
  llvm_cbe_call7 = str_cat(_167, _168);
  _169 = llvm_cbe_pat_2e_addr;
  _170 = *((&_169->field0));
  _171 = llvm_cbe_i;
  llvm_cbe_i = (((uint32_t)(llvm_add_u64((((int64_t)(int32_t)_171)), _170))));
  _172 = llvm_cbe_pat_2e_addr;
  _173 = *((&_172->field0));
  if (!(((_173 != UINT64_C(0))&1))) {
  _174 = llvm_cbe_tmp;
  _175 = llvm_cbe_tgt_2e_addr;
  _176 = *((&_175->field2));
  _177 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_177, 1));
  _178 = *((&_176[((int64_t)(((int64_t)(int32_t)_177)))]));
  str_append(_174, _178);

}

}

  _149 = llvm_cbe_i;
  llvm_cbe_conv = ((int64_t)(int32_t)_149);
  _150 = llvm_cbe_pat_2e_addr;
  llvm_cbe_len = (&_150->field0);
  _151 = *((&_150->field0));
  llvm_cbe_add = llvm_add_u64((((int64_t)(int32_t)_149)), _151);
  _152 = llvm_cbe_tgt_2e_addr;
  llvm_cbe_len1 = (&_152->field0);
  _153 = *((&_152->field0));
}

  uint64_t llvm_cbe_conv20;
  uint64_t* llvm_cbe_len21;
  _179 = llvm_cbe_i;
  llvm_cbe_conv20 = ((int64_t)(int32_t)_179);
  _180 = llvm_cbe_tgt_2e_addr;
  llvm_cbe_len21 = (&_180->field0);
  _181 = *((&_180->field0));
while (((uint64_t)llvm_cbe_conv20) < ((uint64_t)_181)){
  _182 = llvm_cbe_tmp;
  _183 = llvm_cbe_tgt_2e_addr;
  _184 = *((&_183->field2));
  _185 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_185, 1));
  _186 = *((&_184[((int64_t)(((int64_t)(int32_t)_185)))]));
  str_append(_182, _186);

  _179 = llvm_cbe_i;
  llvm_cbe_conv20 = ((int64_t)(int32_t)_179);
  _180 = llvm_cbe_tgt_2e_addr;
  llvm_cbe_len21 = (&_180->field0);
  _181 = *((&_180->field0));
}
  _187 = llvm_cbe_tmp;
  _188 = llvm_cbe_tgt_2e_addr;
  str_swap(_187, _188);
  _189 = llvm_cbe_tmp;
  str_del(_189);
  _190 = llvm_cbe_tgt_2e_addr;
  return _190;
}


void str_set(struct l_struct_struct_OC_str_t* llvm_cbe_dest, struct l_struct_struct_OC_str_t* llvm_cbe_src) {
  struct l_struct_struct_OC_str_t* llvm_cbe_dest_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* llvm_cbe_src_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* _191;
  uint64_t _192;
  struct l_struct_struct_OC_str_t* _193;
  uint64_t _194;
  struct l_struct_struct_OC_str_t* _195;
  struct l_struct_struct_OC_str_t* _196;
  uint8_t* _197;
  struct l_struct_struct_OC_str_t* _198;
  uint8_t* _199;
  struct l_struct_struct_OC_str_t* _200;
  uint64_t _201;
  uint8_t* _202;
  struct l_struct_struct_OC_str_t* _203;
  uint64_t _204;
  struct l_struct_struct_OC_str_t* _205;

  llvm_cbe_dest_2e_addr = llvm_cbe_dest;
  ;
  llvm_cbe_src_2e_addr = llvm_cbe_src;
  ;

  uint64_t* llvm_cbe_len;
  uint64_t* llvm_cbe_len1;
  _191 = llvm_cbe_dest_2e_addr;
  llvm_cbe_len = (&_191->field0);
  _192 = *((&_191->field0));
  _193 = llvm_cbe_src_2e_addr;
  llvm_cbe_len1 = (&_193->field0);
  _194 = *((&_193->field0));
while (((uint64_t)_192) < ((uint64_t)_194)){
  _195 = llvm_cbe_dest_2e_addr;
  str_extend(_195);

  _191 = llvm_cbe_dest_2e_addr;
  llvm_cbe_len = (&_191->field0);
  _192 = *((&_191->field0));
  _193 = llvm_cbe_src_2e_addr;
  llvm_cbe_len1 = (&_193->field0);
  _194 = *((&_193->field0));
}
  _196 = llvm_cbe_dest_2e_addr;
  _197 = *((&_196->field2));
  _198 = llvm_cbe_src_2e_addr;
  _199 = *((&_198->field2));
  _200 = llvm_cbe_src_2e_addr;
  _201 = *((&_200->field0));
  _202 = memcpy(_197, _199, _201);
  _203 = llvm_cbe_src_2e_addr;
  _204 = *((&_203->field0));
  _205 = llvm_cbe_dest_2e_addr;
  *((&_205->field0)) = _204;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* llvm_cbe_s;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* llvm_cbe_s2;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* llvm_cbe_s3;    /* Address-exposed local */
  struct l_struct_struct_OC_str_t* llvm_cbe_call;
  struct l_struct_struct_OC_str_t* llvm_cbe_call1;
  struct l_struct_struct_OC_str_t* llvm_cbe_call2;
  struct l_struct_struct_OC_str_t* _206;
  struct l_struct_struct_OC_str_t* _207;
  struct l_struct_struct_OC_str_t* _208;
  struct l_struct_struct_OC_str_t* llvm_cbe_call3;
  struct l_struct_struct_OC_str_t* _209;
  uint64_t _210;
  struct l_struct_struct_OC_str_t* _211;
  uint8_t* _212;
  uint32_t llvm_cbe_call5;
  struct l_struct_struct_OC_str_t* _213;
  struct l_struct_struct_OC_str_t* _214;
  struct l_struct_struct_OC_str_t* _215;

  llvm_cbe_retval = 0;
  ;
  llvm_cbe_call = str_from_chars(((&_OC_str.array[((int64_t)0)])));
  llvm_cbe_s = llvm_cbe_call;
  ;
  llvm_cbe_call1 = str_from_chars(((&_OC_str_OC_1.array[((int64_t)0)])));
  llvm_cbe_s2 = llvm_cbe_call1;
  ;
  llvm_cbe_call2 = str_from_chars(((&_OC_str_OC_2.array[((int64_t)0)])));
  llvm_cbe_s3 = llvm_cbe_call2;
  _206 = llvm_cbe_s;
  _207 = llvm_cbe_s3;
  _208 = llvm_cbe_s2;
  llvm_cbe_call3 = str_subst(_206, _207, _208);
  _209 = llvm_cbe_s;
  _210 = *((&_209->field0));
  _211 = llvm_cbe_s;
  _212 = *((&_211->field2));
  llvm_cbe_call5 = printf(((&_OC_str_OC_3.array[((int64_t)0)])), _210, _212);
  _213 = llvm_cbe_s;
  str_del(_213);
  _214 = llvm_cbe_s2;
  str_del(_214);
  _215 = llvm_cbe_s3;
  str_del(_215);
  return 0;
}

