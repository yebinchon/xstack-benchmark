/* Provide Declarations */
#include <stdint.h>
#ifndef __cplusplus
typedef unsigned char bool;
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
struct l_struct_struct_OC_sDelegate;
struct l_struct_struct_OC_sDelegator;

/* Function definitions */
typedef uint8_t* l_fptr_1(uint32_t);


/* Types Definitions */
struct l_struct_struct_OC_sDelegate {
  l_fptr_1* field0;
};
struct l_struct_struct_OC_sDelegator {
  uint32_t field0;
  uint8_t* field1;
  struct l_struct_struct_OC_sDelegate* field2;
};
struct l_array_23_uint8_t {
  uint8_t array[23];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_31_uint8_t {
  uint8_t array[31];
};
struct l_array_24_uint8_t {
  uint8_t array[24];
};

/* External Global Variable Declarations */

/* Function Declarations */
struct l_struct_struct_OC_sDelegate* NewDelegate(l_fptr_1*) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
uint8_t* DelegateThing(struct l_struct_struct_OC_sDelegate*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* defaultResponse(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
struct l_struct_struct_OC_sDelegator* NewDelegator(uint32_t, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* Delegator_Operation(struct l_struct_struct_OC_sDelegator*, uint32_t, struct l_struct_struct_OC_sDelegate*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* thing1(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
static struct l_array_23_uint8_t _OC_str = { "default implementation" };
static struct l_struct_struct_OC_sDelegate defaultDel = { defaultResponse };
static struct l_array_4_uint8_t _OC_str_OC_1 = { "%s\n" };
static struct l_array_31_uint8_t _OC_str_OC_2 = { "We're in thing1 with value %d\n" };
static struct l_array_24_uint8_t _OC_str_OC_3 = { "delegate implementation" };
static struct l_array_23_uint8_t _OC_str_OC_4 = { "A stellar vista, Baby." };
static struct l_array_23_uint8_t _OC_str_OC_5 = { "Delegator returns %s\n\n" };


/* LLVM Intrinsic Builtin Function Bodies */


/* Function Bodies */

struct l_struct_struct_OC_sDelegate* NewDelegate(l_fptr_1* llvm_cbe_rspndr) {
  uint8_t* llvm_cbe_call;
  struct l_struct_struct_OC_sDelegate* dl;

  ;
  llvm_cbe_call = malloc(8);
  dl = ((struct l_struct_struct_OC_sDelegate*)llvm_cbe_call);
  ;
  *((&dl->field0)) = llvm_cbe_rspndr;
  return dl;
}


uint8_t* DelegateThing(struct l_struct_struct_OC_sDelegate* llvm_cbe_dl, uint32_t llvm_cbe_p1) {
  l_fptr_1* _1;
  l_fptr_1* _2;
  uint8_t* llvm_cbe_call;
  uint8_t* llvm_cbe_cond;
  uint8_t* llvm_cbe_cond__PHI_TEMPORARY;

  ;
  ;
  _1 = *((&llvm_cbe_dl->field0));
  if ((((_1 != ((l_fptr_1*)/*NULL*/0))&1))) {
  _2 = *((&llvm_cbe_dl->field0));
  llvm_cbe_call = _2(llvm_cbe_p1);
  llvm_cbe_cond__PHI_TEMPORARY = llvm_cbe_call;   /* for PHI node */

  } else {
  llvm_cbe_cond__PHI_TEMPORARY = ((uint8_t*)/*NULL*/0);   /* for PHI node */

}
  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;
  return llvm_cbe_cond;
}


uint8_t* defaultResponse(uint32_t llvm_cbe_p1) {
  ;
  return ((&_OC_str.array[((int64_t)0)]));
}


struct l_struct_struct_OC_sDelegator* NewDelegator(uint32_t llvm_cbe_p, uint8_t* llvm_cbe_phrase) {
  uint8_t* llvm_cbe_call;
  struct l_struct_struct_OC_sDelegator* d;

  ;
  ;
  llvm_cbe_call = malloc(24);
  d = ((struct l_struct_struct_OC_sDelegator*)llvm_cbe_call);
  ;
  *((&d->field0)) = llvm_cbe_p;
  *((&d->field1)) = llvm_cbe_phrase;
  *((&d->field2)) = (&defaultDel);
  return d;
}


uint8_t* Delegator_Operation(struct l_struct_struct_OC_sDelegator* llvm_cbe_theDelegator, uint32_t llvm_cbe_p1, struct l_struct_struct_OC_sDelegate* llvm_cbe_delroy) {
  uint8_t* rtn;
  struct l_struct_struct_OC_sDelegate* _3;
  uint8_t* rtn__PHI_TEMPORARY;
  struct l_struct_struct_OC_sDelegate* _4;
  uint8_t* _5;
  uint32_t llvm_cbe_call7;

  ;
  ;
  ;
  if (!(((llvm_cbe_delroy != ((struct l_struct_struct_OC_sDelegate*)/*NULL*/0))&1))) {
  _4 = *((&llvm_cbe_theDelegator->field2));
  rtn = DelegateThing(_4, llvm_cbe_p1);
  ;
  rtn__PHI_TEMPORARY = rtn;   /* for PHI node */

    rtn__PHI_TEMPORARY = rtn;   /* for PHI node */
  rtn = rtn__PHI_TEMPORARY;
  ;
  _5 = *((&llvm_cbe_theDelegator->field1));
  llvm_cbe_call7 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _5);
  return rtn;
}
  rtn = DelegateThing(llvm_cbe_delroy, llvm_cbe_p1);
  ;
  if (!(((rtn != ((uint8_t*)/*NULL*/0))&1))) {
    rtn__PHI_TEMPORARY = rtn;   /* for PHI node */
    rtn__PHI_TEMPORARY = rtn;   /* for PHI node */
  rtn = rtn__PHI_TEMPORARY;
  ;
  _5 = *((&llvm_cbe_theDelegator->field1));
  llvm_cbe_call7 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _5);
  return rtn;
}
  _3 = *((&llvm_cbe_theDelegator->field2));
  rtn = DelegateThing(_3, llvm_cbe_p1);
  ;
  rtn__PHI_TEMPORARY = rtn;   /* for PHI node */

  rtn = rtn__PHI_TEMPORARY;
  ;
  rtn__PHI_TEMPORARY = rtn;   /* for PHI node */

  rtn = rtn__PHI_TEMPORARY;
  ;
  _5 = *((&llvm_cbe_theDelegator->field1));
  llvm_cbe_call7 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _5);
  return rtn;
}


uint8_t* thing1(uint32_t llvm_cbe_p1) {
  uint32_t llvm_cbe_call;

  ;
  llvm_cbe_call = printf(((&_OC_str_OC_2.array[((int64_t)0)])), llvm_cbe_p1);
  return ((&_OC_str_OC_3.array[((int64_t)0)]));
}


int main(void) {
  struct l_struct_struct_OC_sDelegate* del1;
  struct l_struct_struct_OC_sDelegate* del2;
  struct l_struct_struct_OC_sDelegator* theDelegator;
  uint8_t* llvm_cbe_call3;
  uint32_t llvm_cbe_call4;
  uint8_t* llvm_cbe_call5;
  uint32_t llvm_cbe_call6;
  uint8_t* llvm_cbe_call7;
  uint32_t llvm_cbe_call8;

  del1 = NewDelegate(thing1);
  ;
  del2 = NewDelegate(((l_fptr_1*)/*NULL*/0));
  ;
  theDelegator = NewDelegator(14, ((&_OC_str_OC_4.array[((int64_t)0)])));
  ;
  llvm_cbe_call3 = Delegator_Operation(theDelegator, 3, ((struct l_struct_struct_OC_sDelegate*)/*NULL*/0));
  llvm_cbe_call4 = printf(((&_OC_str_OC_5.array[((int64_t)0)])), llvm_cbe_call3);
  llvm_cbe_call5 = Delegator_Operation(theDelegator, 3, del1);
  llvm_cbe_call6 = printf(((&_OC_str_OC_5.array[((int64_t)0)])), llvm_cbe_call5);
  llvm_cbe_call7 = Delegator_Operation(theDelegator, 3, del2);
  llvm_cbe_call8 = printf(((&_OC_str_OC_5.array[((int64_t)0)])), llvm_cbe_call7);
  return 0;
}

