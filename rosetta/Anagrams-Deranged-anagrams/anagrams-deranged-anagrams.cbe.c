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
struct l_struct_union_OC_node;
struct l_struct_struct_OC_timespec;
struct l_struct_struct_OC_stat;
struct l_struct_struct_OC_word;

/* Function definitions */

/* Types Definitions */
struct l_array_27_uint8_t {
  uint8_t array[27];
};
struct l_array_128_uint32_t {
  uint32_t array[128];
};
struct l_array_13_uint8_t {
  uint8_t array[13];
};
struct l_array_28_uint8_t {
  uint8_t array[28];
};
struct l_array_10_struct_AC_l_struct_union_OC_node_KC_ {
  struct l_struct_union_OC_node* array[10];
};
struct l_struct_union_OC_node {
  struct l_array_10_struct_AC_l_struct_union_OC_node_KC_ field0;
};
struct l_struct_struct_OC_timespec {
  uint64_t field0;
  uint64_t field1;
};
struct l_array_3_uint64_t {
  uint64_t array[3];
};
struct l_struct_struct_OC_stat {
  uint64_t field0;
  uint64_t field1;
  uint64_t field2;
  uint32_t field3;
  uint32_t field4;
  uint32_t field5;
  uint32_t field6;
  uint64_t field7;
  uint64_t field8;
  uint64_t field9;
  uint64_t field10;
  struct l_struct_struct_OC_timespec field11;
  struct l_struct_struct_OC_timespec field12;
  struct l_struct_struct_OC_timespec field13;
  struct l_array_3_uint64_t field14;
};
struct l_struct_struct_OC_word {
  uint8_t* field0;
  struct l_struct_struct_OC_word* field1;
};
struct l_array_10_struct_AC_l_struct_struct_OC_word_KC_ {
  struct l_struct_struct_OC_word* array[10];
};
struct l_array_26_uint8_t {
  uint8_t array[26];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t deranged(uint8_t*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t count_letters(uint8_t*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* insert(struct l_struct_union_OC_node*, uint8_t*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* calloc(uint64_t, uint64_t) __ATTRIBUTELIST__((nothrow));
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t open(uint8_t*, uint32_t, ...);
uint32_t fstat(uint32_t, struct l_struct_struct_OC_stat*) __ATTRIBUTELIST__((nothrow));
uint64_t read(uint32_t, uint8_t*, uint64_t);
uint32_t close(uint32_t);
uint32_t printf(uint8_t*, ...);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_27_uint8_t _OC_str = { "zqxjkvbpygfwmucldrhsnioate" };
uint8_t* freq = ((&_OC_str.array[((int32_t)0)]));
__MSALIGN__(16) struct l_array_128_uint32_t char_to_idx __attribute__((aligned(16))) __ATTRIBUTE_WEAK__;
static struct l_array_13_uint8_t _OC_str_OC_1 = { "unixdict.txt" };
static struct l_array_28_uint8_t _OC_str_OC_2 = { "longest derangement: %s %s\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint8_t llvm_add_u8(uint8_t a, uint8_t b) {
  uint8_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}


/* Function Bodies */

uint32_t deranged(uint8_t* llvm_cbe_s1, uint8_t* llvm_cbe_s2) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint8_t* llvm_cbe_s1_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_s2_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint8_t* _1;
  uint32_t _2;
  uint8_t _3;
  uint8_t* _4;
  uint32_t _5;
  uint8_t _6;
  uint8_t* _7;
  uint32_t _8;
  uint8_t _9;
  uint32_t _10;
  uint32_t _11;

  llvm_cbe_s1_2e_addr = llvm_cbe_s1;
  ;
  llvm_cbe_s2_2e_addr = llvm_cbe_s2;
  ;
  ;
  llvm_cbe_i = 0;

  uint64_t llvm_cbe_idxprom;
  uint8_t* llvm_cbe_arrayidx;
  _1 = llvm_cbe_s1_2e_addr;
  _2 = llvm_cbe_i;
  llvm_cbe_idxprom = ((int64_t)(int32_t)_2);
  llvm_cbe_arrayidx = (&_1[((int64_t)(((int64_t)(int32_t)_2)))]);
  _3 = *((&_1[((int64_t)(((int64_t)(int32_t)_2)))]));
while (_3 != ((uint8_t)0)){
  _4 = llvm_cbe_s1_2e_addr;
  _5 = llvm_cbe_i;
  _6 = *((&_4[((int64_t)(((int64_t)(int32_t)_5)))]));
  _7 = llvm_cbe_s2_2e_addr;
  _8 = llvm_cbe_i;
  _9 = *((&_7[((int64_t)(((int64_t)(int32_t)_8)))]));
  if (((((((int32_t)(int8_t)_6)) == (((int32_t)(int8_t)_9)))&1))) {
  llvm_cbe_retval = 0;
  _11 = llvm_cbe_retval;
  return _11;
}

  _10 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_10, 1));

  _1 = llvm_cbe_s1_2e_addr;
  _2 = llvm_cbe_i;
  llvm_cbe_idxprom = ((int64_t)(int32_t)_2);
  llvm_cbe_arrayidx = (&_1[((int64_t)(((int64_t)(int32_t)_2)))]);
  _3 = *((&_1[((int64_t)(((int64_t)(int32_t)_2)))]));
}
  llvm_cbe_retval = 1;

  _11 = llvm_cbe_retval;
  return _11;
}


uint32_t count_letters(uint8_t* llvm_cbe_s, uint8_t* llvm_cbe_c) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint8_t* llvm_cbe_s_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_c_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_len;    /* Address-exposed local */
  uint8_t* _12;
  uint8_t* _13;
  uint8_t* _14;
  uint32_t _15;
  uint8_t _16;
  uint8_t* _17;
  uint32_t _18;
  uint8_t _19;
  uint8_t* _20;
  uint32_t _21;
  uint8_t _22;
  uint32_t _23;
  uint8_t* _24;
  uint8_t* _25;
  uint32_t _26;
  uint8_t _27;
  uint32_t _28;
  uint8_t* llvm_cbe_arrayidx14;
  uint8_t _29;
  uint32_t _30;
  uint32_t _31;
  uint32_t _32;

  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  llvm_cbe_c_2e_addr = llvm_cbe_c;
  ;
  ;
  ;
  _12 = llvm_cbe_c_2e_addr;
  _13 = memset(_12, 0, 26);
  llvm_cbe_i = 0;
  llvm_cbe_len = 0;

  uint64_t llvm_cbe_idxprom;
  uint8_t* llvm_cbe_arrayidx;
  _14 = llvm_cbe_s_2e_addr;
  _15 = llvm_cbe_i;
  llvm_cbe_idxprom = ((int64_t)(int32_t)_15);
  llvm_cbe_arrayidx = (&_14[((int64_t)(((int64_t)(int32_t)_15)))]);
  _16 = *((&_14[((int64_t)(((int64_t)(int32_t)_15)))]));
while (_16 != ((uint8_t)0)){
  _17 = llvm_cbe_s_2e_addr;
  _18 = llvm_cbe_i;
  _19 = *((&_17[((int64_t)(((int64_t)(int32_t)_18)))]));
  if ((((((int32_t)(((int32_t)(int8_t)_19))) < ((int32_t)97u))&1))) {
  llvm_cbe_retval = 0;

  _32 = llvm_cbe_retval;
  return _32;
}
  _20 = llvm_cbe_s_2e_addr;
  _21 = llvm_cbe_i;
  _22 = *((&_20[((int64_t)(((int64_t)(int32_t)_21)))]));
  if ((((((int32_t)(((int32_t)(int8_t)_22))) > ((int32_t)122u))&1))) {
  llvm_cbe_retval = 0;

  _32 = llvm_cbe_retval;
  return _32;
}
  _23 = llvm_cbe_len;
  llvm_cbe_len = (llvm_add_u32(_23, 1));
  _24 = llvm_cbe_c_2e_addr;
  _25 = llvm_cbe_s_2e_addr;
  _26 = llvm_cbe_i;
  _27 = *((&_25[((int64_t)(((int64_t)(int32_t)_26)))]));
  _28 = *((&char_to_idx.array[((int64_t)(((uint64_t)(uint8_t)_27)))]));
  llvm_cbe_arrayidx14 = (&_24[((int64_t)(((int64_t)(int32_t)_28)))]);
  _29 = *llvm_cbe_arrayidx14;
  *llvm_cbe_arrayidx14 = (llvm_add_u8(_29, 1));

  _30 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_30, 1));

  _14 = llvm_cbe_s_2e_addr;
  _15 = llvm_cbe_i;
  llvm_cbe_idxprom = ((int64_t)(int32_t)_15);
  llvm_cbe_arrayidx = (&_14[((int64_t)(((int64_t)(int32_t)_15)))]);
  _16 = *((&_14[((int64_t)(((int64_t)(int32_t)_15)))]));
}
  _31 = llvm_cbe_len;
  llvm_cbe_retval = _31;

  _32 = llvm_cbe_retval;
  return _32;
}


uint8_t* insert(struct l_struct_union_OC_node* llvm_cbe_root, uint8_t* llvm_cbe_s, uint8_t* llvm_cbe_cnt) {
  uint8_t* llvm_cbe_retval;    /* Address-exposed local */
  struct l_struct_union_OC_node* llvm_cbe_root_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_s_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_cnt_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  struct l_struct_union_OC_node* llvm_cbe_n;    /* Address-exposed local */
  struct l_struct_struct_OC_word* llvm_cbe_v;    /* Address-exposed local */
  struct l_struct_struct_OC_word* llvm_cbe_w;    /* Address-exposed local */
  uint32_t _33;
  struct l_struct_union_OC_node* _34;
  uint8_t* _35;
  uint32_t _36;
  uint8_t _37;
  struct l_struct_union_OC_node* _38;
  uint8_t* llvm_cbe_call;
  struct l_struct_union_OC_node* _39;
  struct l_struct_union_OC_node* _40;
  uint8_t* _41;
  uint32_t _42;
  uint8_t _43;
  uint32_t _44;
  struct l_struct_union_OC_node* _45;
  uint8_t* llvm_cbe_call8;
  uint8_t* _46;
  struct l_struct_struct_OC_word* _47;
  struct l_struct_union_OC_node* _48;
  uint8_t* _49;
  uint8_t _50;
  struct l_struct_struct_OC_word* _51;
  struct l_struct_struct_OC_word* _52;
  struct l_struct_struct_OC_word* _53;
  struct l_struct_union_OC_node* _54;
  uint8_t* _55;
  uint8_t _56;
  struct l_struct_struct_OC_word* _57;
  struct l_struct_struct_OC_word* _58;
  struct l_struct_struct_OC_word* _59;
  struct l_struct_struct_OC_word* _60;
  uint8_t* _61;
  struct l_struct_struct_OC_word* _62;
  uint8_t* _63;
  uint32_t llvm_cbe_call23;
  struct l_struct_struct_OC_word* _64;
  uint8_t* _65;
  struct l_struct_struct_OC_word* _66;
  struct l_struct_struct_OC_word* _67;
  uint8_t* _68;

  llvm_cbe_root_2e_addr = llvm_cbe_root;
  ;
  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  llvm_cbe_cnt_2e_addr = llvm_cbe_cnt;
  ;
  ;
  ;
  ;
  ;
  llvm_cbe_w = ((struct l_struct_struct_OC_word*)/*NULL*/0);
  llvm_cbe_i = 0;

  _33 = llvm_cbe_i;
while (((int32_t)_33) < ((int32_t)25u)){
  _34 = llvm_cbe_root_2e_addr;
  _35 = llvm_cbe_cnt_2e_addr;
  _36 = llvm_cbe_i;
  _37 = *((&_35[((int64_t)(((int64_t)(int32_t)_36)))]));
  _38 = *((&(*(((struct l_array_10_struct_AC_l_struct_union_OC_node_KC_*)_34))).array[((int64_t)(((uint64_t)(uint8_t)_37)))]));
  llvm_cbe_n = _38;
  if (!(((_38 != ((struct l_struct_union_OC_node*)/*NULL*/0))&1))) {
  llvm_cbe_call = calloc(1, 80);
  _39 = ((struct l_struct_union_OC_node*)llvm_cbe_call);
  llvm_cbe_n = _39;
  _40 = llvm_cbe_root_2e_addr;
  _41 = llvm_cbe_cnt_2e_addr;
  _42 = llvm_cbe_i;
  _43 = *((&_41[((int64_t)(((int64_t)(int32_t)_42)))]));
  *((&(*(((struct l_array_10_struct_AC_l_struct_union_OC_node_KC_*)_40))).array[((int64_t)(((uint64_t)(uint8_t)_43)))])) = _39;

}

  _44 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_44, 1));
  _45 = llvm_cbe_n;
  llvm_cbe_root_2e_addr = _45;

  _33 = llvm_cbe_i;
}
  llvm_cbe_call8 = malloc(16);
  llvm_cbe_w = (((struct l_struct_struct_OC_word*)llvm_cbe_call8));
  _46 = llvm_cbe_s_2e_addr;
  _47 = llvm_cbe_w;
  *((&_47->field0)) = _46;
  _48 = llvm_cbe_root_2e_addr;
  _49 = llvm_cbe_cnt_2e_addr;
  _50 = *((&_49[((int64_t)25)]));
  _51 = *((&(*(((struct l_array_10_struct_AC_l_struct_struct_OC_word_KC_*)_48))).array[((int64_t)(((uint64_t)(uint8_t)_50)))]));
  _52 = llvm_cbe_w;
  *((&_52->field1)) = _51;
  _53 = llvm_cbe_w;
  _54 = llvm_cbe_root_2e_addr;
  _55 = llvm_cbe_cnt_2e_addr;
  _56 = *((&_55[((int64_t)25)]));
  *((&(*(((struct l_array_10_struct_AC_l_struct_struct_OC_word_KC_*)_54))).array[((int64_t)(((uint64_t)(uint8_t)_56)))])) = _53;
  _57 = llvm_cbe_w;
  _58 = *((&_57->field1));
  llvm_cbe_v = _58;

  _59 = llvm_cbe_v;
while (_59 != ((struct l_struct_struct_OC_word*)/*NULL*/0)){
  _60 = llvm_cbe_w;
  _61 = *((&_60->field0));
  _62 = llvm_cbe_v;
  _63 = *((&_62->field0));
  llvm_cbe_call23 = deranged(_61, _63);
  if ((((llvm_cbe_call23 != 0u)&1))) {
  _64 = llvm_cbe_v;
  _65 = *((&_64->field0));
  llvm_cbe_retval = _65;
  _68 = llvm_cbe_retval;
  return _68;
}

  _66 = llvm_cbe_v;
  _67 = *((&_66->field1));
  llvm_cbe_v = _67;

  _59 = llvm_cbe_v;
}
  llvm_cbe_retval = ((uint8_t*)/*NULL*/0);

  _68 = llvm_cbe_retval;
  return _68;
}


int main(int argc, char ** argv) {
  uint32_t llvm_cbe_c = (uint32_t)argc;
  uint8_t** llvm_cbe_v = (uint8_t**)argv;
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_c_2e_addr;    /* Address-exposed local */
  uint8_t** llvm_cbe_v_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint8_t* llvm_cbe_words;    /* Address-exposed local */
  struct l_struct_struct_OC_stat llvm_cbe_st;    /* Address-exposed local */
  uint32_t llvm_cbe_fd;    /* Address-exposed local */
  struct l_struct_union_OC_node llvm_cbe_root;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_26_uint8_t llvm_cbe_cnt __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_best_len;    /* Address-exposed local */
  uint8_t* llvm_cbe_b1;    /* Address-exposed local */
  uint8_t* llvm_cbe_b2;    /* Address-exposed local */
  uint8_t* llvm_cbe_match;    /* Address-exposed local */
  uint32_t _69;
  uint8_t** _70;
  uint8_t* _71;
  uint8_t* llvm_cbe_cond;
  uint8_t* llvm_cbe_cond__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;
  uint32_t _72;
  uint32_t llvm_cbe_call1;
  uint64_t _73;
  uint8_t* llvm_cbe_call3;
  uint32_t _74;
  uint8_t* _75;
  uint64_t _76;
  uint64_t llvm_cbe_call5;
  uint32_t _77;
  uint32_t llvm_cbe_call6;
  uint8_t* _78;
  uint8_t* _79;
  uint32_t _80;
  uint8_t _81;
  uint32_t _82;
  uint8_t* _83;
  uint32_t _84;
  uint8_t _85;
  uint32_t _86;
  uint32_t _87;
  uint64_t _88;
  uint8_t* _89;
  uint32_t _90;
  uint8_t _91;
  uint8_t* _92;
  uint32_t _93;
  uint32_t _94;
  uint32_t _95;
  uint32_t _96;
  uint8_t* _97;
  uint32_t _98;
  uint32_t llvm_cbe_call29;
  uint8_t* _99;
  uint32_t _100;
  uint8_t* llvm_cbe_call33;
  uint8_t* _101;
  uint32_t _102;
  uint32_t _103;
  uint8_t* _104;
  uint32_t _105;
  uint8_t* _106;
  uint32_t _107;
  uint32_t llvm_cbe_inc41;
  uint32_t _108;
  uint32_t _109;
  uint8_t* _110;
  uint8_t* _111;
  uint32_t llvm_cbe_call47;
  uint32_t _112;

  llvm_cbe_retval = 0;
  llvm_cbe_c_2e_addr = llvm_cbe_c;
  ;
  llvm_cbe_v_2e_addr = llvm_cbe_v;
  ;
  ;
  ;
  llvm_cbe_j = 0;
  ;
  ;
  ;
  _69 = llvm_cbe_c_2e_addr;
  if ((((((int32_t)_69) < ((int32_t)2u))&1))) {
  llvm_cbe_cond__PHI_TEMPORARY = ((&_OC_str_OC_1.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _70 = llvm_cbe_v_2e_addr;
  _71 = *((&_70[((int64_t)1)]));
  llvm_cbe_cond__PHI_TEMPORARY = _71;   /* for PHI node */

}
  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;
  llvm_cbe_call = open(llvm_cbe_cond, 0);
  llvm_cbe_fd = llvm_cbe_call;
  _72 = llvm_cbe_fd;
  llvm_cbe_call1 = fstat(_72, (&llvm_cbe_st));
  if ((((((int32_t)llvm_cbe_call1) < ((int32_t)0u))&1))) {
  llvm_cbe_retval = 1;

  _112 = llvm_cbe_retval;
  return _112;
}
  _73 = *((&llvm_cbe_st.field8));
  llvm_cbe_call3 = malloc(_73);
  llvm_cbe_words = llvm_cbe_call3;
  _74 = llvm_cbe_fd;
  _75 = llvm_cbe_words;
  _76 = *((&llvm_cbe_st.field8));
  llvm_cbe_call5 = read(_74, _75, _76);
  _77 = llvm_cbe_fd;
  llvm_cbe_call6 = close(_77);
  ;
  _78 = memset((((uint8_t*)(&llvm_cbe_root))), 0, 80);
  ;
  ;
  llvm_cbe_best_len = 0;
  ;
  ;
  llvm_cbe_i = 0;

  uint64_t llvm_cbe_idxprom;
  uint8_t* llvm_cbe_arrayidx7;
  _79 = freq;
  _80 = llvm_cbe_i;
  llvm_cbe_idxprom = ((int64_t)(int32_t)_80);
  llvm_cbe_arrayidx7 = (&_79[((int64_t)(((int64_t)(int32_t)_80)))]);
  _81 = *((&_79[((int64_t)(((int64_t)(int32_t)_80)))]));
while (_81 != ((uint8_t)0)){
  _82 = llvm_cbe_i;
  _83 = freq;
  _84 = llvm_cbe_i;
  _85 = *((&_83[((int64_t)(((int64_t)(int32_t)_84)))]));
  *((&char_to_idx.array[((int64_t)(((uint64_t)(uint8_t)_85)))])) = _82;

  _86 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_86, 1));

  _79 = freq;
  _80 = llvm_cbe_i;
  llvm_cbe_idxprom = ((int64_t)(int32_t)_80);
  llvm_cbe_arrayidx7 = (&_79[((int64_t)(((int64_t)(int32_t)_80)))]);
  _81 = *((&_79[((int64_t)(((int64_t)(int32_t)_80)))]));
}
  llvm_cbe_j = 0;
  llvm_cbe_i = 0;

  uint64_t llvm_cbe_conv;
  uint64_t* llvm_cbe_st_size13;
  _87 = llvm_cbe_i;
  llvm_cbe_conv = ((int64_t)(int32_t)_87);
  llvm_cbe_st_size13 = (&llvm_cbe_st.field8);
  _88 = *((&llvm_cbe_st.field8));
while (((int64_t)llvm_cbe_conv) < ((int64_t)_88)){
  _89 = llvm_cbe_words;
  _90 = llvm_cbe_i;
  _91 = *((&_89[((int64_t)(((int64_t)(int32_t)_90)))]));
  if (((((((int32_t)(int8_t)_91)) != 10u)&1))) {

  } else {
  _92 = llvm_cbe_words;
  _93 = llvm_cbe_i;
  *((&_92[((int64_t)(((int64_t)(int32_t)_93)))])) = 0;
  _94 = llvm_cbe_i;
  _95 = llvm_cbe_j;
  _96 = llvm_cbe_best_len;
  if ((((((int32_t)(llvm_sub_u32(_94, _95))) > ((int32_t)_96))&1))) {
  _97 = llvm_cbe_words;
  _98 = llvm_cbe_j;
  llvm_cbe_call29 = count_letters(((&_97[((int64_t)(((int64_t)(int32_t)_98)))])), ((&llvm_cbe_cnt.array[((int64_t)0)])));
  ;
  _99 = llvm_cbe_words;
  _100 = llvm_cbe_j;
  llvm_cbe_call33 = insert((&llvm_cbe_root), ((&_99[((int64_t)(((int64_t)(int32_t)_100)))])), ((&llvm_cbe_cnt.array[((int64_t)0)])));
  llvm_cbe_match = llvm_cbe_call33;
  _101 = llvm_cbe_match;
  if ((((_101 != ((uint8_t*)/*NULL*/0))&1))) {
  _102 = llvm_cbe_i;
  _103 = llvm_cbe_j;
  llvm_cbe_best_len = (llvm_sub_u32(_102, _103));
  _104 = llvm_cbe_words;
  _105 = llvm_cbe_j;
  llvm_cbe_b1 = ((&_104[((int64_t)(((int64_t)(int32_t)_105)))]));
  _106 = llvm_cbe_match;
  llvm_cbe_b2 = _106;

}

}
  _107 = llvm_cbe_i;
  llvm_cbe_inc41 = llvm_add_u32(_107, 1);
  llvm_cbe_i = llvm_cbe_inc41;
  llvm_cbe_j = llvm_cbe_inc41;

}
  _108 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_108, 1));

  _87 = llvm_cbe_i;
  llvm_cbe_conv = ((int64_t)(int32_t)_87);
  llvm_cbe_st_size13 = (&llvm_cbe_st.field8);
  _88 = *((&llvm_cbe_st.field8));
}
  _109 = llvm_cbe_best_len;
  if (!(((_109 != 0u)&1))) {
  _110 = llvm_cbe_b1;
  _111 = llvm_cbe_b2;
  llvm_cbe_call47 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), _110, _111);

}
  llvm_cbe_retval = 0;

  _112 = llvm_cbe_retval;
  return _112;
}

