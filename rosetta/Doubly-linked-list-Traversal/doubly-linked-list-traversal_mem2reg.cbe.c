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
struct l_struct_struct_OC_sListEntry;
struct l_struct_struct_OC_sListIterator;

/* Function definitions */

/* Types Definitions */
struct l_struct_struct_OC_sListEntry {
  uint8_t* field0;
  struct l_struct_struct_OC_sListEntry* field1;
  struct l_struct_struct_OC_sListEntry* field2;
};
struct l_struct_struct_OC_sListIterator {
  struct l_struct_struct_OC_sListEntry* field0;
  struct l_struct_struct_OC_sListEntry* field1;
};
struct l_array_6_uint8_t_KC_ {
  uint8_t* array[6];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_7_uint8_t {
  uint8_t array[7];
};
struct l_array_9_uint8_t {
  uint8_t array[9];
};
struct l_array_10_uint8_t {
  uint8_t array[10];
};

/* External Global Variable Declarations */

/* Function Declarations */
struct l_struct_struct_OC_sListEntry* NewList(void) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
uint32_t LL_Append(struct l_struct_struct_OC_sListEntry*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* strdup(uint8_t*) __ATTRIBUTELIST__((nothrow));
uint32_t LI_Insert(struct l_struct_struct_OC_sListIterator*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
struct l_struct_struct_OC_sListIterator* LL_GetIterator(struct l_struct_struct_OC_sListEntry*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t LLI_AtEnd(struct l_struct_struct_OC_sListIterator*) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* LLI_Value(struct l_struct_struct_OC_sListIterator*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t LLI_Next(struct l_struct_struct_OC_sListIterator*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t LLI_Prev(struct l_struct_struct_OC_sListIterator*) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
void free(uint8_t*) __ATTRIBUTELIST__((nothrow));


/* Global Variable Definitions and Initialization */
static __MSALIGN__(16) struct l_array_6_uint8_t_KC_ main_OC_contents __attribute__((aligned(16))) = { { ((&_OC_str.array[((int32_t)0)])), ((&_OC_str_OC_1.array[((int32_t)0)])), ((&_OC_str_OC_2.array[((int32_t)0)])), ((&_OC_str_OC_3.array[((int32_t)0)])), ((&_OC_str_OC_4.array[((int32_t)0)])), ((&_OC_str_OC_5.array[((int32_t)0)])) } };
static struct l_array_5_uint8_t _OC_str = { "Read" };
static struct l_array_6_uint8_t _OC_str_OC_1 = { "Orage" };
static struct l_array_7_uint8_t _OC_str_OC_2 = { "Yeller" };
static struct l_array_6_uint8_t _OC_str_OC_3 = { "Glean" };
static struct l_array_5_uint8_t _OC_str_OC_4 = { "Blew" };
static struct l_array_7_uint8_t _OC_str_OC_5 = { "Burple" };
static struct l_array_9_uint8_t _OC_str_OC_6 = { "forward\n" };
static struct l_array_10_uint8_t _OC_str_OC_7 = { "value=%s\n" };
static struct l_array_10_uint8_t _OC_str_OC_8 = { "\nreverse\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

struct l_struct_struct_OC_sListEntry* NewList(void) {
  uint8_t* llvm_cbe_call;
  struct l_struct_struct_OC_sListEntry* le;

  llvm_cbe_call = malloc(24);
  le = ((struct l_struct_struct_OC_sListEntry*)llvm_cbe_call);
  ;
  if ((((le != ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0))&1))) {
  *((&le->field0)) = ((uint8_t*)/*NULL*/0);
  *((&le->field2)) = ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0);
  *((&le->field1)) = ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0);

  return le;
}
  return le;
}


uint32_t LL_Append(struct l_struct_struct_OC_sListEntry* llvm_cbe_ll, uint8_t* llvm_cbe_newVal) {
  uint8_t* llvm_cbe_call;
  struct l_struct_struct_OC_sListEntry* le;
  uint8_t* llvm_cbe_call1;
  struct l_struct_struct_OC_sListEntry* _1;
  struct l_struct_struct_OC_sListEntry* _2;
  struct l_struct_struct_OC_sListEntry* _3;

  ;
  ;
  llvm_cbe_call = malloc(24);
  le = ((struct l_struct_struct_OC_sListEntry*)llvm_cbe_call);
  ;
  if (!(((le != ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0))&1))) {
  llvm_cbe_call1 = strdup(llvm_cbe_newVal);
  *((&le->field0)) = llvm_cbe_call1;
  _1 = *((&llvm_cbe_ll->field2));
  *((&le->field2)) = _1;
  *((&le->field1)) = ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0);
  _2 = *((&le->field2));
  if ((((_2 != ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0))&1))) {
  _3 = *((&le->field2));
  *((&_3->field1)) = le;

  } else {
  *((&llvm_cbe_ll->field1)) = le;

}
}
  *((&llvm_cbe_ll->field2)) = le;

  return (((uint32_t)(bool)(((le != ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0))&1))));
}


uint32_t LI_Insert(struct l_struct_struct_OC_sListIterator* llvm_cbe_iter, uint8_t* llvm_cbe_newVal) {
  struct l_struct_struct_OC_sListEntry* crnt;
  uint8_t* llvm_cbe_call;
  struct l_struct_struct_OC_sListEntry* le;
  uint8_t* llvm_cbe_call1;
  struct l_struct_struct_OC_sListEntry* _4;
  struct l_struct_struct_OC_sListEntry* _5;
  struct l_struct_struct_OC_sListEntry* _6;
  struct l_struct_struct_OC_sListEntry* _7;
  struct l_struct_struct_OC_sListEntry* _8;
  struct l_struct_struct_OC_sListEntry* _9;
  struct l_struct_struct_OC_sListEntry* _10;
  struct l_struct_struct_OC_sListEntry* llvm_cbe_cond;
  struct l_struct_struct_OC_sListEntry* llvm_cbe_cond__PHI_TEMPORARY;
  struct l_struct_struct_OC_sListEntry* _11;
  struct l_struct_struct_OC_sListEntry* _12;
  struct l_struct_struct_OC_sListEntry* _13;
  struct l_struct_struct_OC_sListEntry* _14;

  ;
  ;
  crnt = *((&llvm_cbe_iter->field0));
  ;
  llvm_cbe_call = malloc(24);
  le = ((struct l_struct_struct_OC_sListEntry*)llvm_cbe_call);
  ;
  if (!(((le != ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0))&1))) {
  llvm_cbe_call1 = strdup(llvm_cbe_newVal);
  *((&le->field0)) = llvm_cbe_call1;
  _4 = *((&llvm_cbe_iter->field1));
  if ((((crnt == _4)&1))) {
  *((&le->field2)) = ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0);
  _5 = *((&crnt->field1));
  *((&le->field1)) = _5;
  *((&crnt->field1)) = le;
  _6 = *((&le->field1));
  if ((((_6 != ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0))&1))) {
  _7 = *((&le->field1));
  *((&_7->field2)) = le;

  } else {
  *((&crnt->field2)) = le;

}
  } else {
  if ((((crnt == ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0))&1))) {
  _8 = *((&llvm_cbe_iter->field1));
  _9 = *((&_8->field2));
  llvm_cbe_cond__PHI_TEMPORARY = _9;   /* for PHI node */

  } else {
  _10 = *((&crnt->field2));
  llvm_cbe_cond__PHI_TEMPORARY = _10;   /* for PHI node */

}
}
}

  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;
  *((&le->field2)) = llvm_cbe_cond;
  *((&le->field1)) = crnt;
  _11 = *((&le->field2));
  if ((((_11 != ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0))&1))) {
  _12 = *((&le->field2));
  *((&_12->field1)) = le;

  } else {
  _13 = *((&llvm_cbe_iter->field1));
  *((&_13->field1)) = le;

}
  if ((((crnt != ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0))&1))) {
  *((&crnt->field2)) = le;

  } else {
  _14 = *((&llvm_cbe_iter->field1));
  *((&_14->field2)) = le;

}


  return (((uint32_t)(bool)(((le != ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0))&1))));
}


struct l_struct_struct_OC_sListIterator* LL_GetIterator(struct l_struct_struct_OC_sListEntry* llvm_cbe_ll) {
  uint8_t* llvm_cbe_call;
  struct l_struct_struct_OC_sListIterator* liter;

  ;
  llvm_cbe_call = malloc(16);
  liter = ((struct l_struct_struct_OC_sListIterator*)llvm_cbe_call);
  ;
  *((&liter->field1)) = llvm_cbe_ll;
  *((&liter->field0)) = llvm_cbe_ll;
  return liter;
}


uint32_t LLI_AtEnd(struct l_struct_struct_OC_sListIterator* llvm_cbe_iter) {
  struct l_struct_struct_OC_sListEntry* _15;

  ;
  _15 = *((&llvm_cbe_iter->field0));
  return (((uint32_t)(bool)(((_15 == ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0))&1))));
}


uint8_t* LLI_Value(struct l_struct_struct_OC_sListIterator* llvm_cbe_iter) {
  struct l_struct_struct_OC_sListEntry* _16;
  struct l_struct_struct_OC_sListEntry* _17;
  uint8_t* _18;
  uint8_t* llvm_cbe_cond;
  uint8_t* llvm_cbe_cond__PHI_TEMPORARY;

  ;
  _16 = *((&llvm_cbe_iter->field0));
  if ((((_16 != ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0))&1))) {
  _17 = *((&llvm_cbe_iter->field0));
  _18 = *((&_17->field0));
  llvm_cbe_cond__PHI_TEMPORARY = _18;   /* for PHI node */

  } else {
  llvm_cbe_cond__PHI_TEMPORARY = ((uint8_t*)/*NULL*/0);   /* for PHI node */

}
  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;
  return llvm_cbe_cond;
}


uint32_t LLI_Next(struct l_struct_struct_OC_sListIterator* llvm_cbe_iter) {
  struct l_struct_struct_OC_sListEntry* _19;
  struct l_struct_struct_OC_sListEntry* _20;
  struct l_struct_struct_OC_sListEntry* _21;
  struct l_struct_struct_OC_sListEntry* _22;

  ;
  _19 = *((&llvm_cbe_iter->field0));
  if ((((_19 != ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0))&1))) {
  _20 = *((&llvm_cbe_iter->field0));
  _21 = *((&_20->field1));
  *((&llvm_cbe_iter->field0)) = _21;

  _22 = *((&llvm_cbe_iter->field0));
  return (((uint32_t)(bool)(((_22 != ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0))&1))));
}
  _22 = *((&llvm_cbe_iter->field0));
  return (((uint32_t)(bool)(((_22 != ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0))&1))));
}


uint32_t LLI_Prev(struct l_struct_struct_OC_sListIterator* llvm_cbe_iter) {
  struct l_struct_struct_OC_sListEntry* _23;
  struct l_struct_struct_OC_sListEntry* _24;
  struct l_struct_struct_OC_sListEntry* _25;
  struct l_struct_struct_OC_sListEntry* _26;

  ;
  _23 = *((&llvm_cbe_iter->field0));
  if ((((_23 != ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0))&1))) {
  _24 = *((&llvm_cbe_iter->field0));
  _25 = *((&_24->field2));
  *((&llvm_cbe_iter->field0)) = _25;

  _26 = *((&llvm_cbe_iter->field0));
  return (((uint32_t)(bool)(((_26 != ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0))&1))));
}
  _26 = *((&llvm_cbe_iter->field0));
  return (((uint32_t)(bool)(((_26 != ((struct l_struct_struct_OC_sListEntry*)/*NULL*/0))&1))));
}


int main(void) {
  struct l_struct_struct_OC_sListEntry* ll;
  uint32_t ix;
  uint32_t ix__PHI_TEMPORARY;
  uint8_t* _27;
  uint32_t llvm_cbe_call1;
  struct l_struct_struct_OC_sListIterator* iter;
  uint32_t llvm_cbe_call3;
  uint32_t llvm_cbe_call4;
  uint8_t* llvm_cbe_call5;
  uint32_t llvm_cbe_call6;
  uint32_t llvm_cbe_call7;
  uint32_t llvm_cbe_call10;
  uint8_t* llvm_cbe_call13;
  uint32_t llvm_cbe_call14;

  ll = NewList();
  ;
  ;
  ix__PHI_TEMPORARY = 0;   /* for PHI node */

  ix = ix__PHI_TEMPORARY;
  ;
while (((int32_t)ix) < ((int32_t)6u)){
  _27 = *((&main_OC_contents.array[((int64_t)(((int64_t)(int32_t)ix)))]));
  llvm_cbe_call1 = LL_Append(ll, _27);

  ix = llvm_add_u32(ix, 1);
  ;
  ix__PHI_TEMPORARY = ix;   /* for PHI node */

  ix = ix__PHI_TEMPORARY;
  ;
}
  iter = LL_GetIterator(ll);
  ;
  llvm_cbe_call3 = printf(((&_OC_str_OC_6.array[((int64_t)0)])));

  llvm_cbe_call4 = LLI_Next(iter);
while (llvm_cbe_call4 != 0u){
  llvm_cbe_call5 = LLI_Value(iter);
  llvm_cbe_call6 = printf(((&_OC_str_OC_7.array[((int64_t)0)])), llvm_cbe_call5);

  llvm_cbe_call4 = LLI_Next(iter);
}
  free((((uint8_t*)iter)));
  ;
  llvm_cbe_call7 = printf(((&_OC_str_OC_8.array[((int64_t)0)])));
  iter = LL_GetIterator(ll);
  ;

  llvm_cbe_call10 = LLI_Prev(iter);
while (llvm_cbe_call10 != 0u){
  llvm_cbe_call13 = LLI_Value(iter);
  llvm_cbe_call14 = printf(((&_OC_str_OC_7.array[((int64_t)0)])), llvm_cbe_call13);

  llvm_cbe_call10 = LLI_Prev(iter);
}
  free((((uint8_t*)iter)));
  ;
  return 0;
}

