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
struct l_struct_struct_OC_word;
struct l_struct_struct_OC_timespec;
struct l_struct_struct_OC_stat;

/* Function definitions */

/* Types Definitions */
struct l_array_10_struct_AC_l_struct_union_OC_node_KC_ {
  struct l_struct_union_OC_node* array[10];
};
struct l_struct_union_OC_node {
  struct l_array_10_struct_AC_l_struct_union_OC_node_KC_ field0;
};
struct l_struct_struct_OC_word {
  uint8_t* field0;
  struct l_struct_struct_OC_word* field1;
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
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint8_t _1;
  uint8_t _2;
  uint8_t _3;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint64_t llvm_cbe_idxprom;
  uint8_t* llvm_cbe_arrayidx;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx = (&llvm_cbe_s1[((int64_t)(((int64_t)(int32_t)i)))]);
  _1 = *((&llvm_cbe_s1[((int64_t)(((int64_t)(int32_t)i)))]));
while (_1 != ((uint8_t)0)){
  _2 = *((&llvm_cbe_s1[((int64_t)(((int64_t)(int32_t)i)))]));
  _3 = *((&llvm_cbe_s2[((int64_t)(((int64_t)(int32_t)i)))]));
  if (((((((int32_t)(int8_t)_2)) == (((int32_t)(int8_t)_3)))&1))) {
    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx = (&llvm_cbe_s1[((int64_t)(((int64_t)(int32_t)i)))]);
  _1 = *((&llvm_cbe_s1[((int64_t)(((int64_t)(int32_t)i)))]));
}
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


uint32_t count_letters(uint8_t* llvm_cbe_s, uint8_t* llvm_cbe_c) {
  uint8_t* _4;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t len;
  uint32_t len__PHI_TEMPORARY;
  uint8_t _5;
  uint8_t _6;
  uint8_t _7;
  uint8_t _8;
  uint32_t _9;
  uint8_t* llvm_cbe_arrayidx14;
  uint8_t _10;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  _4 = memset(llvm_cbe_c, 0, 26);
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  len__PHI_TEMPORARY = 0;   /* for PHI node */

  uint64_t llvm_cbe_idxprom;
  uint8_t* llvm_cbe_arrayidx;
  i = i__PHI_TEMPORARY;
  len = len__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx = (&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]);
  _5 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]));
while (_5 != ((uint8_t)0)){
  _6 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((((int32_t)(((int32_t)(int8_t)_6))) < ((int32_t)97u))&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  _7 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((((int32_t)(((int32_t)(int8_t)_7))) > ((int32_t)122u))&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  len = llvm_add_u32(len, 1);
  ;
  _8 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]));
  _9 = *((&char_to_idx.array[((int64_t)(((uint64_t)(uint8_t)_8)))]));
  llvm_cbe_arrayidx14 = (&llvm_cbe_c[((int64_t)(((int64_t)(int32_t)_9)))]);
  _10 = *llvm_cbe_arrayidx14;
  *llvm_cbe_arrayidx14 = (llvm_add_u8(_10, 1));

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  len__PHI_TEMPORARY = len;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  len = len__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx = (&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]);
  _5 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]));
}
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = len;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


uint8_t* insert(struct l_struct_union_OC_node* llvm_cbe_root, uint8_t* llvm_cbe_s, uint8_t* llvm_cbe_cnt) {
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  struct l_struct_union_OC_node* root;
  struct l_struct_union_OC_node* root__PHI_TEMPORARY;
  uint8_t _11;
  struct l_struct_union_OC_node* n;
  uint8_t* llvm_cbe_call;
  uint8_t _12;
  struct l_struct_union_OC_node* n__PHI_TEMPORARY;
  uint8_t* llvm_cbe_call8;
  struct l_struct_struct_OC_word* w;
  uint8_t _13;
  struct l_struct_struct_OC_word* _14;
  uint8_t _15;
  struct l_struct_struct_OC_word* v;
  struct l_struct_struct_OC_word* v__PHI_TEMPORARY;
  uint8_t* _16;
  uint8_t* _17;
  uint32_t llvm_cbe_call23;
  uint8_t* _18;
  uint8_t* llvm_cbe_retval_2e_0;
  uint8_t* llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  ;
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  root__PHI_TEMPORARY = llvm_cbe_root;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  root = root__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) < ((int32_t)25u)){
  _11 = *((&llvm_cbe_cnt[((int64_t)(((int64_t)(int32_t)i)))]));
  n = *((&(*(((struct l_array_10_struct_AC_l_struct_union_OC_node_KC_*)root))).array[((int64_t)(((uint64_t)(uint8_t)_11)))]));
  ;
  if (!(((n != ((struct l_struct_union_OC_node*)/*NULL*/0))&1))) {
  llvm_cbe_call = calloc(1, 80);
  n = ((struct l_struct_union_OC_node*)llvm_cbe_call);
  ;
  _12 = *((&llvm_cbe_cnt[((int64_t)(((int64_t)(int32_t)i)))]));
  *((&(*(((struct l_array_10_struct_AC_l_struct_union_OC_node_KC_*)root))).array[((int64_t)(((uint64_t)(uint8_t)_12)))])) = n;
  n__PHI_TEMPORARY = n;   /* for PHI node */

}
  n = n__PHI_TEMPORARY;
  ;

  i = llvm_add_u32(i, 1);
  ;
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  root__PHI_TEMPORARY = n;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  root = root__PHI_TEMPORARY;
  ;
  ;
}
  llvm_cbe_call8 = malloc(16);
  w = ((struct l_struct_struct_OC_word*)llvm_cbe_call8);
  ;
  *((&w->field0)) = llvm_cbe_s;
  _13 = *((&llvm_cbe_cnt[((int64_t)25)]));
  _14 = *((&(*(((struct l_array_10_struct_AC_l_struct_struct_OC_word_KC_*)root))).array[((int64_t)(((uint64_t)(uint8_t)_13)))]));
  *((&w->field1)) = _14;
  _15 = *((&llvm_cbe_cnt[((int64_t)25)]));
  *((&(*(((struct l_array_10_struct_AC_l_struct_struct_OC_word_KC_*)root))).array[((int64_t)(((uint64_t)(uint8_t)_15)))])) = w;
  v = *((&w->field1));
  ;
  v__PHI_TEMPORARY = v;   /* for PHI node */

  v = v__PHI_TEMPORARY;
  ;
while (v != ((struct l_struct_struct_OC_word*)/*NULL*/0)){
  _16 = *((&w->field0));
  _17 = *((&v->field0));
  llvm_cbe_call23 = deranged(_16, _17);
  if ((((llvm_cbe_call23 != 0u)&1))) {
  _18 = *((&v->field0));
    llvm_cbe_retval_2e_0__PHI_TEMPORARY = _18;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}

  v = *((&v->field1));
  ;
  v__PHI_TEMPORARY = v;   /* for PHI node */

  v = v__PHI_TEMPORARY;
  ;
}
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = ((uint8_t*)/*NULL*/0);   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


int main(int argc, char ** argv) {
  uint32_t llvm_cbe_c = (uint32_t)argc;
  uint8_t** llvm_cbe_v = (uint8_t**)argv;
  struct l_struct_struct_OC_stat llvm_cbe_st;    /* Address-exposed local */
  struct l_struct_union_OC_node llvm_cbe_root;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_26_uint8_t llvm_cbe_cnt __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _19;
  uint8_t* llvm_cbe_cond;
  uint8_t* llvm_cbe_cond__PHI_TEMPORARY;
  uint32_t fd;
  uint32_t llvm_cbe_call1;
  uint64_t _20;
  uint8_t* words;
  uint64_t _21;
  uint64_t llvm_cbe_call5;
  uint32_t llvm_cbe_call6;
  uint8_t* _22;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint8_t* _23;
  uint8_t _24;
  uint8_t* _25;
  uint8_t _26;
  uint32_t best_len;
  uint32_t best_len__PHI_TEMPORARY;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  uint8_t* b1;
  uint8_t* b1__PHI_TEMPORARY;
  uint8_t* b2;
  uint8_t* b2__PHI_TEMPORARY;
  uint64_t _27;
  uint8_t _28;
  uint32_t llvm_cbe_call29;
  uint8_t* llvm_cbe_call33;
  uint32_t llvm_cbe_call47;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  ;
  ;
  if ((((((int32_t)llvm_cbe_c) < ((int32_t)2u))&1))) {
  llvm_cbe_cond__PHI_TEMPORARY = ((&_OC_str_OC_1.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _19 = *((&llvm_cbe_v[((int64_t)1)]));
  llvm_cbe_cond__PHI_TEMPORARY = _19;   /* for PHI node */

}
  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;
  fd = open(llvm_cbe_cond, 0);
  ;
  llvm_cbe_call1 = fstat(fd, (&llvm_cbe_st));
  if ((((((int32_t)llvm_cbe_call1) < ((int32_t)0u))&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  _20 = *((&llvm_cbe_st.field8));
  words = malloc(_20);
  ;
  _21 = *((&llvm_cbe_st.field8));
  llvm_cbe_call5 = read(fd, words, _21);
  llvm_cbe_call6 = close(fd);
  ;
  _22 = memset((((uint8_t*)(&llvm_cbe_root))), 0, 80);
  ;
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint64_t llvm_cbe_idxprom;
  uint8_t* llvm_cbe_arrayidx7;
  i = i__PHI_TEMPORARY;
  ;
  _23 = freq;
  llvm_cbe_idxprom = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx7 = (&_23[((int64_t)(((int64_t)(int32_t)i)))]);
  _24 = *((&_23[((int64_t)(((int64_t)(int32_t)i)))]));
while (_24 != ((uint8_t)0)){
  _25 = freq;
  _26 = *((&_25[((int64_t)(((int64_t)(int32_t)i)))]));
  *((&char_to_idx.array[((int64_t)(((uint64_t)(uint8_t)_26)))])) = i;

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  _23 = freq;
  llvm_cbe_idxprom = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx7 = (&_23[((int64_t)(((int64_t)(int32_t)i)))]);
  _24 = *((&_23[((int64_t)(((int64_t)(int32_t)i)))]));
}
  ;
  ;
  best_len__PHI_TEMPORARY = 0;   /* for PHI node */
  j__PHI_TEMPORARY = 0;   /* for PHI node */
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint64_t llvm_cbe_conv;
  uint64_t* llvm_cbe_st_size13;
  best_len = best_len__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  b1 = b1__PHI_TEMPORARY;
  b2 = b2__PHI_TEMPORARY;
  ;
  ;
  ;
  ;
  ;
  llvm_cbe_conv = ((int64_t)(int32_t)i);
  llvm_cbe_st_size13 = (&llvm_cbe_st.field8);
  _27 = *((&llvm_cbe_st.field8));
while (((int64_t)llvm_cbe_conv) < ((int64_t)_27)){
  _28 = *((&words[((int64_t)(((int64_t)(int32_t)i)))]));
  if (((((((int32_t)(int8_t)_28)) != 10u)&1))) {
  best_len__PHI_TEMPORARY = best_len;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */
  i__PHI_TEMPORARY = i;   /* for PHI node */
  b1__PHI_TEMPORARY = b1;   /* for PHI node */
  b2__PHI_TEMPORARY = b2;   /* for PHI node */

  } else {
  *((&words[((int64_t)(((int64_t)(int32_t)i)))])) = 0;
  if ((((((int32_t)(llvm_sub_u32(i, j))) > ((int32_t)best_len))&1))) {
  llvm_cbe_call29 = count_letters(((&words[((int64_t)(((int64_t)(int32_t)j)))])), ((&llvm_cbe_cnt.array[((int64_t)0)])));
  llvm_cbe_call33 = insert((&llvm_cbe_root), ((&words[((int64_t)(((int64_t)(int32_t)j)))])), ((&llvm_cbe_cnt.array[((int64_t)0)])));
  ;
  if ((((llvm_cbe_call33 != ((uint8_t*)/*NULL*/0))&1))) {
  best_len = llvm_sub_u32(i, j);
  ;
  b1 = (&words[((int64_t)(((int64_t)(int32_t)j)))]);
  ;
  ;
  best_len__PHI_TEMPORARY = best_len;   /* for PHI node */
  b1__PHI_TEMPORARY = b1;   /* for PHI node */
  b2__PHI_TEMPORARY = llvm_cbe_call33;   /* for PHI node */

}
  best_len = best_len__PHI_TEMPORARY;
  b1 = b1__PHI_TEMPORARY;
  b2 = b2__PHI_TEMPORARY;
  ;
  ;
  ;
  best_len__PHI_TEMPORARY = best_len;   /* for PHI node */
  b1__PHI_TEMPORARY = b1;   /* for PHI node */
  b2__PHI_TEMPORARY = b2;   /* for PHI node */

}
  best_len = best_len__PHI_TEMPORARY;
  b1 = b1__PHI_TEMPORARY;
  b2 = b2__PHI_TEMPORARY;
  ;
  ;
  ;
  i = llvm_add_u32(i, 1);
  ;
  ;
  best_len__PHI_TEMPORARY = best_len;   /* for PHI node */
  j__PHI_TEMPORARY = i;   /* for PHI node */
  i__PHI_TEMPORARY = i;   /* for PHI node */
  b1__PHI_TEMPORARY = b1;   /* for PHI node */
  b2__PHI_TEMPORARY = b2;   /* for PHI node */

}
  best_len = best_len__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  b1 = b1__PHI_TEMPORARY;
  b2 = b2__PHI_TEMPORARY;
  ;
  ;
  ;
  ;
  ;
  i = llvm_add_u32(i, 1);
  ;
  best_len__PHI_TEMPORARY = best_len;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */
  i__PHI_TEMPORARY = i;   /* for PHI node */
  b1__PHI_TEMPORARY = b1;   /* for PHI node */
  b2__PHI_TEMPORARY = b2;   /* for PHI node */

  best_len = best_len__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  b1 = b1__PHI_TEMPORARY;
  b2 = b2__PHI_TEMPORARY;
  ;
  ;
  ;
  ;
  ;
  llvm_cbe_conv = ((int64_t)(int32_t)i);
  llvm_cbe_st_size13 = (&llvm_cbe_st.field8);
  _27 = *((&llvm_cbe_st.field8));
}
  if (!(((best_len != 0u)&1))) {
  llvm_cbe_call47 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), b1, b2);

}
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}

