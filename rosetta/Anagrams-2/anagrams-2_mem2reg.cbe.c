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
struct l_struct_struct_OC_kw_t;
struct l_struct_struct_OC_timespec;
struct l_struct_struct_OC_stat;

/* Function definitions */

/* Types Definitions */
struct l_struct_struct_OC_kw_t {
  uint8_t* field0;
  uint8_t* field1;
  uint32_t field2;
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
struct l_array_13_uint8_t {
  uint8_t array[13];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t lst_cmp(uint8_t*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t strcmp(uint8_t*, uint8_t*) __ATTRIBUTELIST__((nothrow, pure));
void sort_letters(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t open(uint8_t*, uint32_t, ...);
uint32_t fstat(uint32_t, struct l_struct_struct_OC_stat*) __ATTRIBUTELIST__((nothrow));
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
uint64_t read(uint32_t, uint8_t*, uint64_t);
uint8_t* calloc(uint64_t, uint64_t) __ATTRIBUTELIST__((nothrow));
void qsort(uint8_t*, uint64_t, uint64_t, l_fptr_1*);
uint32_t printf(uint8_t*, ...);
uint32_t close(uint32_t);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_13_uint8_t _OC_str = { "unixdict.txt" };
static struct l_array_4_uint8_t _OC_str_OC_1 = { "%s " };
static struct l_array_2_uint8_t _OC_str_OC_2 = { "\n" };


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
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}


/* Function Bodies */

uint32_t lst_cmp(uint8_t* llvm_cbe_a, uint8_t* llvm_cbe_b) {
  uint8_t* _1;
  uint8_t* _2;
  uint32_t llvm_cbe_call;

  ;
  ;
  _1 = *((&(((struct l_struct_struct_OC_kw_t*)llvm_cbe_a))->field0));
  _2 = *((&(((struct l_struct_struct_OC_kw_t*)llvm_cbe_b))->field0));
  llvm_cbe_call = strcmp(_1, _2);
  return llvm_cbe_call;
}


void sort_letters(uint8_t* llvm_cbe_s) {
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint8_t _3;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  uint8_t _4;
  uint8_t _5;
  uint8_t _6;
  uint8_t t;
  uint8_t _7;

  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint64_t llvm_cbe_idxprom;
  uint8_t* llvm_cbe_arrayidx;
  uint32_t llvm_cbe_conv;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx = (&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]);
  _3 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_conv = ((int32_t)(int8_t)_3);
while (llvm_cbe_conv != 0u){
  j = llvm_add_u32(i, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */

  uint64_t llvm_cbe_idxprom3;
  uint8_t* llvm_cbe_arrayidx4;
  uint32_t llvm_cbe_conv5;
  j = j__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom3 = ((int64_t)(int32_t)j);
  llvm_cbe_arrayidx4 = (&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)j)))]);
  _4 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)j)))]));
  llvm_cbe_conv5 = ((int32_t)(int8_t)_4);
while (llvm_cbe_conv5 != 0u){
  _5 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)j)))]));
  _6 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((((int32_t)(((int32_t)(int8_t)_5))) < ((int32_t)(((int32_t)(int8_t)_6))))&1))) {
  t = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)j)))]));
  ;
  _7 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]));
  *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)j)))])) = _7;
  *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))])) = t;

}

  j = llvm_add_u32(j, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom3 = ((int64_t)(int32_t)j);
  llvm_cbe_arrayidx4 = (&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)j)))]);
  _4 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)j)))]));
  llvm_cbe_conv5 = ((int32_t)(int8_t)_4);
}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx = (&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]);
  _3 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_conv = ((int32_t)(int8_t)_3);
}
  return;
}


int main(void) {
  struct l_struct_struct_OC_stat llvm_cbe_s;    /* Address-exposed local */
  uint32_t fd;
  uint32_t llvm_cbe_call1;
  uint64_t _8;
  uint8_t* words;
  uint64_t _9;
  uint8_t* keys;
  uint64_t _10;
  uint64_t llvm_cbe_call5;
  uint64_t _11;
  uint8_t* _12;
  uint64_t j;
  uint64_t j__PHI_TEMPORARY;
  uint64_t i;
  uint64_t i__PHI_TEMPORARY;
  uint32_t n_word;
  uint32_t n_word__PHI_TEMPORARY;
  uint64_t _13;
  uint8_t _14;
  uint8_t* llvm_cbe_call18;
  struct l_struct_struct_OC_kw_t* list;
  uint64_t k;
  uint64_t k__PHI_TEMPORARY;
  uint64_t _15;
  uint8_t _16;
  uint64_t longest;
  uint64_t longest__PHI_TEMPORARY;
  uint64_t llvm_cbe_k_2e_2;
  uint64_t llvm_cbe_k_2e_2__PHI_TEMPORARY;
  uint64_t llvm_cbe_i_2e_2;
  uint64_t llvm_cbe_i_2e_2__PHI_TEMPORARY;
  uint64_t offset;
  uint64_t offset__PHI_TEMPORARY;
  uint8_t* _17;
  uint8_t* _18;
  uint32_t llvm_cbe_call49;
  uint8_t* _19;
  uint8_t* _20;
  uint32_t llvm_cbe_call76;
  uint8_t* _21;
  uint8_t* _22;
  uint32_t llvm_cbe_call85;
  uint32_t llvm_cbe_call88;
  uint32_t llvm_cbe_call93;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  fd = open(((&_OC_str.array[((int64_t)0)])), 0);
  ;
  if ((((fd == 4294967295u)&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  llvm_cbe_call1 = fstat(fd, (&llvm_cbe_s));
  _8 = *((&llvm_cbe_s.field8));
  words = malloc((llvm_mul_u64(_8, 2)));
  ;
  _9 = *((&llvm_cbe_s.field8));
  keys = (&words[((int64_t)_9)]);
  ;
  _10 = *((&llvm_cbe_s.field8));
  llvm_cbe_call5 = read(fd, words, _10);
  _11 = *((&llvm_cbe_s.field8));
  _12 = memcpy(keys, words, _11);
  ;
  ;
  j__PHI_TEMPORARY = 0;   /* for PHI node */
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  n_word__PHI_TEMPORARY = 0;   /* for PHI node */

  uint64_t* llvm_cbe_st_size7;
  j = j__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  n_word = n_word__PHI_TEMPORARY;
  ;
  ;
  ;
  llvm_cbe_st_size7 = (&llvm_cbe_s.field8);
  _13 = *((&llvm_cbe_s.field8));
while (((uint64_t)i) < ((uint64_t)_13)){
  _14 = *((&words[((int64_t)i)]));
  if (((((((int32_t)(int8_t)_14)) == 10u)&1))) {
  *((&keys[((int64_t)i)])) = 0;
  *((&words[((int64_t)i)])) = 0;
  sort_letters(((&keys[((int64_t)j)])));
  j = llvm_add_u64(i, 1);
  ;
  n_word = llvm_add_u32(n_word, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */
  n_word__PHI_TEMPORARY = n_word;   /* for PHI node */

}
  j = j__PHI_TEMPORARY;
  n_word = n_word__PHI_TEMPORARY;
  ;
  ;

  i = llvm_add_u64(i, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */
  i__PHI_TEMPORARY = i;   /* for PHI node */
  n_word__PHI_TEMPORARY = n_word;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  n_word = n_word__PHI_TEMPORARY;
  ;
  ;
  ;
  llvm_cbe_st_size7 = (&llvm_cbe_s.field8);
  _13 = *((&llvm_cbe_s.field8));
}
  llvm_cbe_call18 = calloc((((int64_t)(int32_t)n_word)), 24);
  list = ((struct l_struct_struct_OC_kw_t*)llvm_cbe_call18);
  ;
  ;
  ;
  ;
  k__PHI_TEMPORARY = 0;   /* for PHI node */
  j__PHI_TEMPORARY = 0;   /* for PHI node */
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint64_t* llvm_cbe_st_size20;
  k = k__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
  ;
  llvm_cbe_st_size20 = (&llvm_cbe_s.field8);
  _15 = *((&llvm_cbe_s.field8));
while (((uint64_t)i) < ((uint64_t)_15)){
  _16 = *((&words[((int64_t)i)]));
  if (((((((int32_t)(int8_t)_16)) == 0u)&1))) {
  *((&((&list[((int64_t)j)]))->field0)) = ((&keys[((int64_t)k)]));
  *((&((&list[((int64_t)j)]))->field1)) = ((&words[((int64_t)k)]));
  k = llvm_add_u64(i, 1);
  ;
  j = llvm_add_u64(j, 1);
  ;
  k__PHI_TEMPORARY = k;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */

}
  k = k__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;

  i = llvm_add_u64(i, 1);
  ;
  k__PHI_TEMPORARY = k;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */
  i__PHI_TEMPORARY = i;   /* for PHI node */

  k = k__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
  ;
  llvm_cbe_st_size20 = (&llvm_cbe_s.field8);
  _15 = *((&llvm_cbe_s.field8));
}
  qsort((((uint8_t*)list)), (((int64_t)(int32_t)n_word)), 24, lst_cmp);
  ;
  ;
  ;
  ;
  ;
  longest__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_k_2e_2__PHI_TEMPORARY = 0;   /* for PHI node */
  j__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_i_2e_2__PHI_TEMPORARY = 0;   /* for PHI node */
  offset__PHI_TEMPORARY = 0;   /* for PHI node */

  uint64_t llvm_cbe_conv41;
  longest = longest__PHI_TEMPORARY;
  llvm_cbe_k_2e_2 = llvm_cbe_k_2e_2__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  llvm_cbe_i_2e_2 = llvm_cbe_i_2e_2__PHI_TEMPORARY;
  offset = offset__PHI_TEMPORARY;
  ;
  ;
  ;
  ;
  ;
  llvm_cbe_conv41 = ((int64_t)(int32_t)n_word);
while (((uint64_t)llvm_cbe_i_2e_2) < ((uint64_t)llvm_cbe_conv41)){
  _17 = *((&((&list[((int64_t)llvm_cbe_i_2e_2)]))->field0));
  _18 = *((&((&list[((int64_t)j)]))->field0));
  llvm_cbe_call49 = strcmp(_17, _18);
  if ((((llvm_cbe_call49 != 0u)&1))) {
  if ((((((uint64_t)llvm_cbe_k_2e_2) < ((uint64_t)longest))&1))) {
  ;
  ;
  longest__PHI_TEMPORARY = longest;   /* for PHI node */
  k__PHI_TEMPORARY = 0;   /* for PHI node */
  j__PHI_TEMPORARY = llvm_cbe_i_2e_2;   /* for PHI node */
  offset__PHI_TEMPORARY = offset;   /* for PHI node */

  } else {
  if ((((((uint64_t)llvm_cbe_k_2e_2) > ((uint64_t)longest))&1))) {
  ;
  offset__PHI_TEMPORARY = 0;   /* for PHI node */

}
  offset = offset__PHI_TEMPORARY;
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */
  offset__PHI_TEMPORARY = offset;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  offset = offset__PHI_TEMPORARY;
  ;
  ;
  if (!(((((uint64_t)j) < ((uint64_t)llvm_cbe_i_2e_2))&1))) {
  }

  offset = llvm_add_u64(offset, 1);
  ;
  j = llvm_add_u64(j, 1);
  ;
  _19 = memcpy((((uint8_t*)((&list[((int64_t)offset)])))), (((uint8_t*)((&list[((int64_t)j)])))), 24);
  j__PHI_TEMPORARY = j;   /* for PHI node */
  offset__PHI_TEMPORARY = offset;   /* for PHI node */

  ;
  ;
  longest__PHI_TEMPORARY = llvm_cbe_k_2e_2;   /* for PHI node */
  k__PHI_TEMPORARY = 0;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */
  offset__PHI_TEMPORARY = offset;   /* for PHI node */

}
  } else {
  k = llvm_add_u64(llvm_cbe_k_2e_2, 1);
  ;
  longest__PHI_TEMPORARY = longest;   /* for PHI node */
  k__PHI_TEMPORARY = k;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */
  offset__PHI_TEMPORARY = offset;   /* for PHI node */

}
  j = j__PHI_TEMPORARY;
  offset = offset__PHI_TEMPORARY;
  ;
  ;
while (((uint64_t)j) < ((uint64_t)llvm_cbe_i_2e_2)){
  j = j__PHI_TEMPORARY;
  offset = offset__PHI_TEMPORARY;
  ;
  ;
}
  longest = longest__PHI_TEMPORARY;
  k = k__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  offset = offset__PHI_TEMPORARY;
  ;
  ;
  ;
  ;
  i = llvm_add_u64(llvm_cbe_i_2e_2, 1);
  ;
  longest__PHI_TEMPORARY = longest;   /* for PHI node */
  llvm_cbe_k_2e_2__PHI_TEMPORARY = k;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */
  llvm_cbe_i_2e_2__PHI_TEMPORARY = i;   /* for PHI node */
  offset__PHI_TEMPORARY = offset;   /* for PHI node */

  longest = longest__PHI_TEMPORARY;
  llvm_cbe_k_2e_2 = llvm_cbe_k_2e_2__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  llvm_cbe_i_2e_2 = llvm_cbe_i_2e_2__PHI_TEMPORARY;
  offset = offset__PHI_TEMPORARY;
  ;
  ;
  ;
  ;
  ;
  llvm_cbe_conv41 = ((int64_t)(int32_t)n_word);
}
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((uint64_t)i) < ((uint64_t)offset)){
  _20 = *((&((&list[((int64_t)i)]))->field1));
  llvm_cbe_call76 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _20);
  if ((((((uint64_t)i) < ((uint64_t)(((int64_t)(int32_t)(llvm_sub_u32(n_word, 1))))))&1))) {
  _21 = *((&((&list[((int64_t)i)]))->field0));
  _22 = *((&((&list[((int64_t)(llvm_add_u64(i, 1)))]))->field0));
  llvm_cbe_call85 = strcmp(_21, _22);
  if ((((llvm_cbe_call85 != 0u)&1))) {
  llvm_cbe_call88 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));


  } else {

}
  } else {

}
  i = llvm_add_u64(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  llvm_cbe_call93 = close(fd);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}

