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
struct l_struct_struct_OC_str_t {
  uint64_t field0;
  uint64_t field1;
  uint8_t* field2;
};
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
  uint8_t* llvm_cbe_call;
  struct l_struct_struct_OC_str_t* s;
  uint64_t len;
  uint64_t len__PHI_TEMPORARY;
  uint8_t* llvm_cbe_call1;

  ;
  llvm_cbe_call = malloc(24);
  s = ((struct l_struct_struct_OC_str_t*)llvm_cbe_call);
  ;
  if ((((((uint64_t)llvm_cbe_len) < ((uint64_t)UINT64_C(8)))&1))) {
  ;
  len__PHI_TEMPORARY = 8;   /* for PHI node */

    len__PHI_TEMPORARY = 8;   /* for PHI node */
  len = len__PHI_TEMPORARY;
  ;
  *((&s->field1)) = len;
  llvm_cbe_call1 = malloc(len);
  *((&s->field2)) = llvm_cbe_call1;
  *((&s->field0)) = 0;
  return s;
}
  len = len__PHI_TEMPORARY;
  ;
  *((&s->field1)) = len;
  llvm_cbe_call1 = malloc(len);
  *((&s->field2)) = llvm_cbe_call1;
  *((&s->field0)) = 0;
  return s;
}


void str_extend(struct l_struct_struct_OC_str_t* llvm_cbe_s) {
  uint64_t _1;
  uint64_t ns;
  uint64_t _2;
  uint64_t _3;
  uint64_t ns__PHI_TEMPORARY;
  uint8_t* _4;
  uint8_t* llvm_cbe_call;

  ;
  _1 = *((&llvm_cbe_s->field1));
  ns = llvm_mul_u64(_1, 2);
  ;
  _2 = *((&llvm_cbe_s->field1));
  if ((((((uint64_t)(llvm_sub_u64(ns, _2))) > ((uint64_t)UINT64_C(1024)))&1))) {
  _3 = *((&llvm_cbe_s->field1));
  ns = llvm_add_u64(_3, 1024);
  ;
  ns__PHI_TEMPORARY = ns;   /* for PHI node */

    ns__PHI_TEMPORARY = ns;   /* for PHI node */
  ns = ns__PHI_TEMPORARY;
  ;
  _4 = *((&llvm_cbe_s->field2));
  llvm_cbe_call = realloc(_4, ns);
  *((&llvm_cbe_s->field2)) = llvm_cbe_call;
  *((&llvm_cbe_s->field1)) = ns;
}
  ns = ns__PHI_TEMPORARY;
  ;
  _4 = *((&llvm_cbe_s->field2));
  llvm_cbe_call = realloc(_4, ns);
  *((&llvm_cbe_s->field2)) = llvm_cbe_call;
  *((&llvm_cbe_s->field1)) = ns;
}


void str_del(struct l_struct_struct_OC_str_t* llvm_cbe_s) {
  uint8_t* _5;

  ;
  _5 = *((&llvm_cbe_s->field2));
  free(_5);
  free((((uint8_t*)llvm_cbe_s)));
}


uint32_t str_cmp(struct l_struct_struct_OC_str_t* llvm_cbe_l, struct l_struct_struct_OC_str_t* llvm_cbe_r) {
  uint64_t _6;
  uint32_t len;
  uint64_t _7;
  uint64_t _8;
  uint32_t len__PHI_TEMPORARY;
  uint8_t* _9;
  uint8_t* _10;
  uint32_t res;
  uint64_t _11;
  uint64_t _12;
  uint64_t _13;
  uint32_t llvm_cbe_cond;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  _6 = *((&llvm_cbe_l->field0));
  len = ((uint32_t)_6);
  ;
  _7 = *((&llvm_cbe_r->field0));
  if ((((((uint64_t)(((int64_t)(int32_t)len))) > ((uint64_t)_7))&1))) {
  _8 = *((&llvm_cbe_r->field0));
  len = ((uint32_t)_8);
  ;
  len__PHI_TEMPORARY = len;   /* for PHI node */

}
  len = len__PHI_TEMPORARY;
  ;
  _9 = *((&llvm_cbe_l->field2));
  _10 = *((&llvm_cbe_r->field2));
  res = memcmp(_9, _10, (((int64_t)(int32_t)len)));
  ;
  if ((((res != 0u)&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = res;   /* for PHI node */

  } else {
  _11 = *((&llvm_cbe_l->field0));
  _12 = *((&llvm_cbe_r->field0));
  _13 = ((uint64_t)(bool)(((((uint64_t)_11) > ((uint64_t)_12))&1)));
  llvm_cbe_cond = llvm_select_u32((((((uint64_t)_11) > ((uint64_t)_12))&1)), 1, -1);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


struct l_struct_struct_OC_str_t* str_dup(struct l_struct_struct_OC_str_t* llvm_cbe_src) {
  uint64_t _14;
  struct l_struct_struct_OC_str_t* x;
  uint8_t* _15;
  uint8_t* _16;
  uint64_t _17;
  uint8_t* _18;
  uint64_t _19;

  ;
  _14 = *((&llvm_cbe_src->field0));
  x = str_new(_14);
  ;
  _15 = *((&x->field2));
  _16 = *((&llvm_cbe_src->field2));
  _17 = *((&llvm_cbe_src->field0));
  _18 = memcpy(_15, _16, _17);
  _19 = *((&llvm_cbe_src->field0));
  *((&x->field0)) = _19;
  return x;
}


struct l_struct_struct_OC_str_t* str_from_chars(uint8_t* llvm_cbe_t) {
  struct l_struct_struct_OC_str_t* llvm_cbe_call;
  uint64_t l;
  struct l_struct_struct_OC_str_t* x;
  uint8_t* _20;
  uint8_t* _21;
  struct l_struct_struct_OC_str_t* llvm_cbe_retval_2e_0;
  struct l_struct_struct_OC_str_t* llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  if ((((llvm_cbe_t != ((uint8_t*)/*NULL*/0))&1))) {
  l = strlen(llvm_cbe_t);
  ;
  x = str_new((llvm_add_u64(l, 1)));
  ;
  *((&x->field0)) = l;
  _20 = *((&x->field2));
  _21 = memcpy(_20, llvm_cbe_t, l);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = x;   /* for PHI node */

  } else {
  llvm_cbe_call = str_new(0);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_call;   /* for PHI node */

}
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


void str_append(struct l_struct_struct_OC_str_t* llvm_cbe_s, uint8_t llvm_cbe_b) {
  uint64_t _22;
  uint64_t _23;
  uint8_t* _24;
  uint64_t* llvm_cbe_len2;
  uint64_t _25;

  ;
  ;
  _22 = *((&llvm_cbe_s->field0));
  _23 = *((&llvm_cbe_s->field1));
  if ((((((uint64_t)_22) >= ((uint64_t)_23))&1))) {
  str_extend(llvm_cbe_s);

  _24 = *((&llvm_cbe_s->field2));
  llvm_cbe_len2 = (&llvm_cbe_s->field0);
  _25 = *llvm_cbe_len2;
  *llvm_cbe_len2 = (llvm_add_u64(_25, 1));
  *((&_24[((int64_t)_25)])) = llvm_cbe_b;
}
  _24 = *((&llvm_cbe_s->field2));
  llvm_cbe_len2 = (&llvm_cbe_s->field0);
  _25 = *llvm_cbe_len2;
  *llvm_cbe_len2 = (llvm_add_u64(_25, 1));
  *((&_24[((int64_t)_25)])) = llvm_cbe_b;
}


struct l_struct_struct_OC_str_t* str_substr(struct l_struct_struct_OC_str_t* llvm_cbe_s, uint32_t llvm_cbe_from, uint32_t llvm_cbe_to) {
  uint64_t _26;
  uint32_t to;
  uint32_t to__PHI_TEMPORARY;
  uint64_t _27;
  uint32_t from;
  uint32_t from__PHI_TEMPORARY;
  uint64_t _28;
  struct l_struct_struct_OC_str_t* x;
  uint8_t* _29;
  uint8_t* _30;
  uint64_t _31;
  uint8_t* _32;
  struct l_struct_struct_OC_str_t* llvm_cbe_retval_2e_0;
  struct l_struct_struct_OC_str_t* llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  ;
  if (!(((llvm_cbe_to != 0u)&1))) {
  _26 = *((&llvm_cbe_s->field0));
  to = ((uint32_t)_26);
  ;
  to__PHI_TEMPORARY = to;   /* for PHI node */

}
  to = to__PHI_TEMPORARY;
  ;
  if ((((((int32_t)llvm_cbe_from) < ((int32_t)0u))&1))) {
  _27 = *((&llvm_cbe_s->field0));
  from = ((uint32_t)(llvm_add_u64((((int64_t)(int32_t)llvm_cbe_from)), _27)));
  ;
  from__PHI_TEMPORARY = from;   /* for PHI node */

}
  from = from__PHI_TEMPORARY;
  ;
  if ((((((int32_t)from) < ((int32_t)0u))&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = ((struct l_struct_struct_OC_str_t*)/*NULL*/0);   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = ((struct l_struct_struct_OC_str_t*)/*NULL*/0);   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  _28 = *((&llvm_cbe_s->field0));
  if ((((((uint64_t)(((int64_t)(int32_t)from))) >= ((uint64_t)_28))&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = ((struct l_struct_struct_OC_str_t*)/*NULL*/0);   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = ((struct l_struct_struct_OC_str_t*)/*NULL*/0);   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  if (!(((((int32_t)to) < ((int32_t)from))&1))) {
  to = llvm_add_u32(from, 1);
  ;
  to__PHI_TEMPORARY = to;   /* for PHI node */

}
  to = to__PHI_TEMPORARY;
  ;
  x = str_new((((int64_t)(int32_t)(llvm_sub_u32(to, from)))));
  ;
  *((&x->field0)) = (((int64_t)(int32_t)(llvm_sub_u32(to, from))));
  _29 = *((&x->field2));
  _30 = *((&llvm_cbe_s->field2));
  _31 = *((&x->field0));
  _32 = memcpy(_29, ((&_30[((int64_t)(((int64_t)(int32_t)from)))])), _31);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = x;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


struct l_struct_struct_OC_str_t* str_cat(struct l_struct_struct_OC_str_t* llvm_cbe_s, struct l_struct_struct_OC_str_t* llvm_cbe_s2) {
  uint64_t _33;
  uint64_t _34;
  uint64_t _35;
  uint8_t* _36;
  uint64_t _37;
  uint8_t* _38;
  uint64_t _39;
  uint8_t* _40;
  uint64_t _41;
  uint64_t* llvm_cbe_len8;
  uint64_t _42;

  ;
  ;

  uint64_t* llvm_cbe_alloc;
  uint64_t* llvm_cbe_len;
  uint64_t* llvm_cbe_len1;
  uint64_t llvm_cbe_add;
  llvm_cbe_alloc = (&llvm_cbe_s->field1);
  _33 = *((&llvm_cbe_s->field1));
  llvm_cbe_len = (&llvm_cbe_s->field0);
  _34 = *((&llvm_cbe_s->field0));
  llvm_cbe_len1 = (&llvm_cbe_s2->field0);
  _35 = *((&llvm_cbe_s2->field0));
  llvm_cbe_add = llvm_add_u64(_34, _35);
while (((uint64_t)_33) < ((uint64_t)llvm_cbe_add)){
  str_extend(llvm_cbe_s);

  llvm_cbe_alloc = (&llvm_cbe_s->field1);
  _33 = *((&llvm_cbe_s->field1));
  llvm_cbe_len = (&llvm_cbe_s->field0);
  _34 = *((&llvm_cbe_s->field0));
  llvm_cbe_len1 = (&llvm_cbe_s2->field0);
  _35 = *((&llvm_cbe_s2->field0));
  llvm_cbe_add = llvm_add_u64(_34, _35);
}
  _36 = *((&llvm_cbe_s->field2));
  _37 = *((&llvm_cbe_s->field0));
  _38 = *((&llvm_cbe_s2->field2));
  _39 = *((&llvm_cbe_s2->field0));
  _40 = memcpy(((&_36[((int64_t)_37)])), _38, _39);
  _41 = *((&llvm_cbe_s2->field0));
  llvm_cbe_len8 = (&llvm_cbe_s->field0);
  _42 = *llvm_cbe_len8;
  *llvm_cbe_len8 = (llvm_add_u64(_42, _41));
  return llvm_cbe_s;
}


void str_swap(struct l_struct_struct_OC_str_t* llvm_cbe_a, struct l_struct_struct_OC_str_t* llvm_cbe_b) {
  uint64_t tz;
  uint64_t _43;
  uint64_t _44;
  uint8_t* ts;
  uint8_t* _45;

  ;
  ;
  tz = *((&llvm_cbe_a->field1));
  ;
  _43 = *((&llvm_cbe_b->field1));
  *((&llvm_cbe_a->field1)) = _43;
  *((&llvm_cbe_b->field1)) = tz;
  tz = *((&llvm_cbe_a->field0));
  ;
  _44 = *((&llvm_cbe_b->field0));
  *((&llvm_cbe_a->field0)) = _44;
  *((&llvm_cbe_b->field0)) = tz;
  ts = *((&llvm_cbe_a->field2));
  ;
  _45 = *((&llvm_cbe_b->field2));
  *((&llvm_cbe_a->field2)) = _45;
  *((&llvm_cbe_b->field2)) = ts;
}


struct l_struct_struct_OC_str_t* str_subst(struct l_struct_struct_OC_str_t* llvm_cbe_tgt, struct l_struct_struct_OC_str_t* llvm_cbe_pat, struct l_struct_struct_OC_str_t* llvm_cbe_repl) {
  struct l_struct_struct_OC_str_t* tmp;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint64_t _46;
  uint64_t _47;
  uint8_t* _48;
  uint8_t* _49;
  uint64_t _50;
  uint32_t llvm_cbe_call5;
  uint8_t* _51;
  uint8_t _52;
  struct l_struct_struct_OC_str_t* llvm_cbe_call7;
  uint64_t _53;
  uint64_t _54;
  uint8_t* _55;
  uint8_t _56;
  uint64_t _57;
  uint8_t* _58;
  uint8_t _59;

  ;
  ;
  ;
  tmp = str_new(0);
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint64_t llvm_cbe_conv;
  uint64_t* llvm_cbe_len;
  uint64_t llvm_cbe_add;
  uint64_t* llvm_cbe_len1;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_conv = ((int64_t)(int32_t)i);
  llvm_cbe_len = (&llvm_cbe_pat->field0);
  _46 = *((&llvm_cbe_pat->field0));
  llvm_cbe_add = llvm_add_u64((((int64_t)(int32_t)i)), _46);
  llvm_cbe_len1 = (&llvm_cbe_tgt->field0);
  _47 = *((&llvm_cbe_tgt->field0));
while (((uint64_t)llvm_cbe_add) <= ((uint64_t)_47)){
  _48 = *((&llvm_cbe_tgt->field2));
  _49 = *((&llvm_cbe_pat->field2));
  _50 = *((&llvm_cbe_pat->field0));
  llvm_cbe_call5 = memcmp(((&_48[((int64_t)(((int64_t)(int32_t)i)))])), _49, _50);
  if ((((llvm_cbe_call5 != 0u)&1))) {
  _51 = *((&llvm_cbe_tgt->field2));
  _52 = *((&_51[((int64_t)(((int64_t)(int32_t)i)))]));
  str_append(tmp, _52);
  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  } else {
  llvm_cbe_call7 = str_cat(tmp, llvm_cbe_repl);
  _53 = *((&llvm_cbe_pat->field0));
  i = ((uint32_t)(llvm_add_u64((((int64_t)(int32_t)i)), _53)));
  ;
  _54 = *((&llvm_cbe_pat->field0));
  if (!(((_54 != UINT64_C(0))&1))) {
  _55 = *((&llvm_cbe_tgt->field2));
  i = llvm_add_u32(i, 1);
  ;
  _56 = *((&_55[((int64_t)(((int64_t)(int32_t)i)))]));
  str_append(tmp, _56);
  i__PHI_TEMPORARY = i;   /* for PHI node */

}
  i = i__PHI_TEMPORARY;
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

}
  i = i__PHI_TEMPORARY;
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_conv = ((int64_t)(int32_t)i);
  llvm_cbe_len = (&llvm_cbe_pat->field0);
  _46 = *((&llvm_cbe_pat->field0));
  llvm_cbe_add = llvm_add_u64((((int64_t)(int32_t)i)), _46);
  llvm_cbe_len1 = (&llvm_cbe_tgt->field0);
  _47 = *((&llvm_cbe_tgt->field0));
}
  i__PHI_TEMPORARY = i;   /* for PHI node */

  uint64_t llvm_cbe_conv20;
  uint64_t* llvm_cbe_len21;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_conv20 = ((int64_t)(int32_t)i);
  llvm_cbe_len21 = (&llvm_cbe_tgt->field0);
  _57 = *((&llvm_cbe_tgt->field0));
while (((uint64_t)llvm_cbe_conv20) < ((uint64_t)_57)){
  _58 = *((&llvm_cbe_tgt->field2));
  i = llvm_add_u32(i, 1);
  ;
  _59 = *((&_58[((int64_t)(((int64_t)(int32_t)i)))]));
  str_append(tmp, _59);
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_conv20 = ((int64_t)(int32_t)i);
  llvm_cbe_len21 = (&llvm_cbe_tgt->field0);
  _57 = *((&llvm_cbe_tgt->field0));
}
  str_swap(tmp, llvm_cbe_tgt);
  str_del(tmp);
  return llvm_cbe_tgt;
}


void str_set(struct l_struct_struct_OC_str_t* llvm_cbe_dest, struct l_struct_struct_OC_str_t* llvm_cbe_src) {
  uint64_t _60;
  uint64_t _61;
  uint8_t* _62;
  uint8_t* _63;
  uint64_t _64;
  uint8_t* _65;
  uint64_t _66;

  ;
  ;

  uint64_t* llvm_cbe_len;
  uint64_t* llvm_cbe_len1;
  llvm_cbe_len = (&llvm_cbe_dest->field0);
  _60 = *((&llvm_cbe_dest->field0));
  llvm_cbe_len1 = (&llvm_cbe_src->field0);
  _61 = *((&llvm_cbe_src->field0));
while (((uint64_t)_60) < ((uint64_t)_61)){
  str_extend(llvm_cbe_dest);

  llvm_cbe_len = (&llvm_cbe_dest->field0);
  _60 = *((&llvm_cbe_dest->field0));
  llvm_cbe_len1 = (&llvm_cbe_src->field0);
  _61 = *((&llvm_cbe_src->field0));
}
  _62 = *((&llvm_cbe_dest->field2));
  _63 = *((&llvm_cbe_src->field2));
  _64 = *((&llvm_cbe_src->field0));
  _65 = memcpy(_62, _63, _64);
  _66 = *((&llvm_cbe_src->field0));
  *((&llvm_cbe_dest->field0)) = _66;
}


int main(void) {
  struct l_struct_struct_OC_str_t* s;
  struct l_struct_struct_OC_str_t* s2;
  struct l_struct_struct_OC_str_t* s3;
  struct l_struct_struct_OC_str_t* llvm_cbe_call3;
  uint64_t _67;
  uint8_t* _68;
  uint32_t llvm_cbe_call5;

  s = str_from_chars(((&_OC_str.array[((int64_t)0)])));
  ;
  s2 = str_from_chars(((&_OC_str_OC_1.array[((int64_t)0)])));
  ;
  s3 = str_from_chars(((&_OC_str_OC_2.array[((int64_t)0)])));
  ;
  llvm_cbe_call3 = str_subst(s, s3, s2);
  _67 = *((&s->field0));
  _68 = *((&s->field2));
  llvm_cbe_call5 = printf(((&_OC_str_OC_3.array[((int64_t)0)])), _67, _68);
  str_del(s);
  str_del(s2);
  str_del(s3);
  return 0;
}

