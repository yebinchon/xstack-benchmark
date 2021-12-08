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
struct l_array_23_uint8_t {
  uint8_t array[23];
};
struct l_struct_struct_OC_sDelegate {
  l_fptr_1* field0;
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
struct l_struct_struct_OC_sDelegator {
  uint32_t field0;
  uint8_t* field1;
  struct l_struct_struct_OC_sDelegate* field2;
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
  l_fptr_1* llvm_cbe_rspndr_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_sDelegate* llvm_cbe_dl;    /* Address-exposed local */
  uint8_t* llvm_cbe_call;
  l_fptr_1* _1;
  struct l_struct_struct_OC_sDelegate* _2;
  struct l_struct_struct_OC_sDelegate* _3;

  llvm_cbe_rspndr_2e_addr = llvm_cbe_rspndr;
  ;
  ;
  llvm_cbe_call = malloc(8);
  llvm_cbe_dl = (((struct l_struct_struct_OC_sDelegate*)llvm_cbe_call));
  _1 = llvm_cbe_rspndr_2e_addr;
  _2 = llvm_cbe_dl;
  *((&_2->field0)) = _1;
  _3 = llvm_cbe_dl;
  return _3;
}


uint8_t* DelegateThing(struct l_struct_struct_OC_sDelegate* llvm_cbe_dl, uint32_t llvm_cbe_p1) {
  struct l_struct_struct_OC_sDelegate* llvm_cbe_dl_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_p1_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_sDelegate* _4;
  l_fptr_1* _5;
  struct l_struct_struct_OC_sDelegate* _6;
  l_fptr_1* _7;
  uint32_t _8;
  uint8_t* llvm_cbe_call;
  uint8_t* llvm_cbe_cond;
  uint8_t* llvm_cbe_cond__PHI_TEMPORARY;

  llvm_cbe_dl_2e_addr = llvm_cbe_dl;
  ;
  llvm_cbe_p1_2e_addr = llvm_cbe_p1;
  ;
  _4 = llvm_cbe_dl_2e_addr;
  _5 = *((&_4->field0));
  if ((((_5 != ((l_fptr_1*)/*NULL*/0))&1))) {
  _6 = llvm_cbe_dl_2e_addr;
  _7 = *((&_6->field0));
  _8 = llvm_cbe_p1_2e_addr;
  llvm_cbe_call = _7(_8);
  llvm_cbe_cond__PHI_TEMPORARY = llvm_cbe_call;   /* for PHI node */

  } else {
  llvm_cbe_cond__PHI_TEMPORARY = ((uint8_t*)/*NULL*/0);   /* for PHI node */

}
  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;
  return llvm_cbe_cond;
}


uint8_t* defaultResponse(uint32_t llvm_cbe_p1) {
  uint32_t llvm_cbe_p1_2e_addr;    /* Address-exposed local */

  llvm_cbe_p1_2e_addr = llvm_cbe_p1;
  ;
  return ((&_OC_str.array[((int64_t)0)]));
}


struct l_struct_struct_OC_sDelegator* NewDelegator(uint32_t llvm_cbe_p, uint8_t* llvm_cbe_phrase) {
  uint32_t llvm_cbe_p_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_phrase_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_sDelegator* llvm_cbe_d;    /* Address-exposed local */
  uint8_t* llvm_cbe_call;
  uint32_t _9;
  struct l_struct_struct_OC_sDelegator* _10;
  uint8_t* _11;
  struct l_struct_struct_OC_sDelegator* _12;
  struct l_struct_struct_OC_sDelegator* _13;
  struct l_struct_struct_OC_sDelegator* _14;

  llvm_cbe_p_2e_addr = llvm_cbe_p;
  ;
  llvm_cbe_phrase_2e_addr = llvm_cbe_phrase;
  ;
  ;
  llvm_cbe_call = malloc(24);
  llvm_cbe_d = (((struct l_struct_struct_OC_sDelegator*)llvm_cbe_call));
  _9 = llvm_cbe_p_2e_addr;
  _10 = llvm_cbe_d;
  *((&_10->field0)) = _9;
  _11 = llvm_cbe_phrase_2e_addr;
  _12 = llvm_cbe_d;
  *((&_12->field1)) = _11;
  _13 = llvm_cbe_d;
  *((&_13->field2)) = (&defaultDel);
  _14 = llvm_cbe_d;
  return _14;
}


uint8_t* Delegator_Operation(struct l_struct_struct_OC_sDelegator* llvm_cbe_theDelegator, uint32_t llvm_cbe_p1, struct l_struct_struct_OC_sDelegate* llvm_cbe_delroy) {
  struct l_struct_struct_OC_sDelegator* llvm_cbe_theDelegator_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_p1_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_sDelegate* llvm_cbe_delroy_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_rtn;    /* Address-exposed local */
  struct l_struct_struct_OC_sDelegate* _15;
  struct l_struct_struct_OC_sDelegate* _16;
  uint32_t _17;
  uint8_t* llvm_cbe_call;
  uint8_t* _18;
  struct l_struct_struct_OC_sDelegator* _19;
  struct l_struct_struct_OC_sDelegate* _20;
  uint32_t _21;
  uint8_t* llvm_cbe_call3;
  struct l_struct_struct_OC_sDelegator* _22;
  struct l_struct_struct_OC_sDelegate* _23;
  uint32_t _24;
  uint8_t* llvm_cbe_call5;
  struct l_struct_struct_OC_sDelegator* _25;
  uint8_t* _26;
  uint32_t llvm_cbe_call7;
  uint8_t* _27;

  llvm_cbe_theDelegator_2e_addr = llvm_cbe_theDelegator;
  ;
  llvm_cbe_p1_2e_addr = llvm_cbe_p1;
  ;
  llvm_cbe_delroy_2e_addr = llvm_cbe_delroy;
  ;
  ;
  _15 = llvm_cbe_delroy_2e_addr;
  if (!(((_15 != ((struct l_struct_struct_OC_sDelegate*)/*NULL*/0))&1))) {
  _22 = llvm_cbe_theDelegator_2e_addr;
  _23 = *((&_22->field2));
  _24 = llvm_cbe_p1_2e_addr;
  llvm_cbe_call5 = DelegateThing(_23, _24);
  llvm_cbe_rtn = llvm_cbe_call5;

  _25 = llvm_cbe_theDelegator_2e_addr;
  _26 = *((&_25->field1));
  llvm_cbe_call7 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _26);
  _27 = llvm_cbe_rtn;
  return _27;
}
  _16 = llvm_cbe_delroy_2e_addr;
  _17 = llvm_cbe_p1_2e_addr;
  llvm_cbe_call = DelegateThing(_16, _17);
  llvm_cbe_rtn = llvm_cbe_call;
  _18 = llvm_cbe_rtn;
  if (!(((_18 != ((uint8_t*)/*NULL*/0))&1))) {
  _25 = llvm_cbe_theDelegator_2e_addr;
  _26 = *((&_25->field1));
  llvm_cbe_call7 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _26);
  _27 = llvm_cbe_rtn;
  return _27;
}
  _19 = llvm_cbe_theDelegator_2e_addr;
  _20 = *((&_19->field2));
  _21 = llvm_cbe_p1_2e_addr;
  llvm_cbe_call3 = DelegateThing(_20, _21);
  llvm_cbe_rtn = llvm_cbe_call3;


  _25 = llvm_cbe_theDelegator_2e_addr;
  _26 = *((&_25->field1));
  llvm_cbe_call7 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _26);
  _27 = llvm_cbe_rtn;
  return _27;
}


uint8_t* thing1(uint32_t llvm_cbe_p1) {
  uint32_t llvm_cbe_p1_2e_addr;    /* Address-exposed local */
  uint32_t _28;
  uint32_t llvm_cbe_call;

  llvm_cbe_p1_2e_addr = llvm_cbe_p1;
  ;
  _28 = llvm_cbe_p1_2e_addr;
  llvm_cbe_call = printf(((&_OC_str_OC_2.array[((int64_t)0)])), _28);
  return ((&_OC_str_OC_3.array[((int64_t)0)]));
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  struct l_struct_struct_OC_sDelegate* llvm_cbe_del1;    /* Address-exposed local */
  struct l_struct_struct_OC_sDelegate* llvm_cbe_del2;    /* Address-exposed local */
  struct l_struct_struct_OC_sDelegator* llvm_cbe_theDelegator;    /* Address-exposed local */
  struct l_struct_struct_OC_sDelegate* llvm_cbe_call;
  struct l_struct_struct_OC_sDelegate* llvm_cbe_call1;
  struct l_struct_struct_OC_sDelegator* llvm_cbe_call2;
  struct l_struct_struct_OC_sDelegator* _29;
  uint8_t* llvm_cbe_call3;
  uint32_t llvm_cbe_call4;
  struct l_struct_struct_OC_sDelegator* _30;
  struct l_struct_struct_OC_sDelegate* _31;
  uint8_t* llvm_cbe_call5;
  uint32_t llvm_cbe_call6;
  struct l_struct_struct_OC_sDelegator* _32;
  struct l_struct_struct_OC_sDelegate* _33;
  uint8_t* llvm_cbe_call7;
  uint32_t llvm_cbe_call8;

  llvm_cbe_retval = 0;
  ;
  llvm_cbe_call = NewDelegate(thing1);
  llvm_cbe_del1 = llvm_cbe_call;
  ;
  llvm_cbe_call1 = NewDelegate(((l_fptr_1*)/*NULL*/0));
  llvm_cbe_del2 = llvm_cbe_call1;
  ;
  llvm_cbe_call2 = NewDelegator(14, ((&_OC_str_OC_4.array[((int64_t)0)])));
  llvm_cbe_theDelegator = llvm_cbe_call2;
  _29 = llvm_cbe_theDelegator;
  llvm_cbe_call3 = Delegator_Operation(_29, 3, ((struct l_struct_struct_OC_sDelegate*)/*NULL*/0));
  llvm_cbe_call4 = printf(((&_OC_str_OC_5.array[((int64_t)0)])), llvm_cbe_call3);
  _30 = llvm_cbe_theDelegator;
  _31 = llvm_cbe_del1;
  llvm_cbe_call5 = Delegator_Operation(_30, 3, _31);
  llvm_cbe_call6 = printf(((&_OC_str_OC_5.array[((int64_t)0)])), llvm_cbe_call5);
  _32 = llvm_cbe_theDelegator;
  _33 = llvm_cbe_del2;
  llvm_cbe_call7 = Delegator_Operation(_32, 3, _33);
  llvm_cbe_call8 = printf(((&_OC_str_OC_5.array[((int64_t)0)])), llvm_cbe_call7);
  return 0;
}

