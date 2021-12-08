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
struct l_struct_struct_OC_elem;

/* Function definitions */

/* Types Definitions */
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};
struct l_array_13_uint8_t {
  uint8_t array[13];
};
struct l_array_32_uint8_t {
  uint8_t array[32];
};
struct l_struct_struct_OC_elem {
  uint32_t field0;
  struct l_struct_struct_OC_elem* field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
void addToList(struct l_struct_struct_OC_elem**, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
struct l_struct_struct_OC_elem* copyList(struct l_struct_struct_OC_elem*) __ATTRIBUTELIST__((noinline, nothrow));
void printList(struct l_struct_struct_OC_elem*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
void free(uint8_t*) __ATTRIBUTELIST__((nothrow));


/* Global Variable Definitions and Initialization */
static struct l_array_4_uint8_t _OC_str = { "%d," };
static struct l_array_2_uint8_t _OC_str_OC_1 = { "\x08" };
static struct l_array_13_uint8_t _OC_str_OC_2 = { "List a is : " };
static struct l_array_32_uint8_t _OC_str_OC_3 = { "\nList a destroyed, List b is : " };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

void addToList(struct l_struct_struct_OC_elem** llvm_cbe_a, uint32_t llvm_cbe_num) {
  struct l_struct_struct_OC_elem** llvm_cbe_a_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_num_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_elem* llvm_cbe_temp;    /* Address-exposed local */
  struct l_struct_struct_OC_elem* llvm_cbe_holder;    /* Address-exposed local */
  struct l_struct_struct_OC_elem** _1;
  struct l_struct_struct_OC_elem* _2;
  uint8_t* llvm_cbe_call;
  struct l_struct_struct_OC_elem** _3;
  uint32_t _4;
  struct l_struct_struct_OC_elem** _5;
  struct l_struct_struct_OC_elem* _6;
  struct l_struct_struct_OC_elem** _7;
  struct l_struct_struct_OC_elem* _8;
  struct l_struct_struct_OC_elem** _9;
  struct l_struct_struct_OC_elem* _10;
  struct l_struct_struct_OC_elem* _11;
  struct l_struct_struct_OC_elem* _12;
  struct l_struct_struct_OC_elem* _13;
  struct l_struct_struct_OC_elem* _14;
  uint8_t* llvm_cbe_call4;
  uint32_t _15;
  struct l_struct_struct_OC_elem* _16;
  struct l_struct_struct_OC_elem* _17;
  struct l_struct_struct_OC_elem* _18;
  struct l_struct_struct_OC_elem* _19;

  llvm_cbe_a_2e_addr = llvm_cbe_a;
  ;
  llvm_cbe_num_2e_addr = llvm_cbe_num;
  ;
  ;
  ;
  _1 = llvm_cbe_a_2e_addr;
  _2 = *_1;
  if ((((_2 == ((struct l_struct_struct_OC_elem*)/*NULL*/0))&1))) {
  llvm_cbe_call = malloc(16);
  _3 = llvm_cbe_a_2e_addr;
  *_3 = (((struct l_struct_struct_OC_elem*)llvm_cbe_call));
  _4 = llvm_cbe_num_2e_addr;
  _5 = llvm_cbe_a_2e_addr;
  _6 = *_5;
  *((&_6->field0)) = _4;
  _7 = llvm_cbe_a_2e_addr;
  _8 = *_7;
  *((&_8->field1)) = ((struct l_struct_struct_OC_elem*)/*NULL*/0);

  return;
}
  _9 = llvm_cbe_a_2e_addr;
  _10 = *_9;
  llvm_cbe_temp = _10;

  struct l_struct_struct_OC_elem** llvm_cbe_next1;
  _11 = llvm_cbe_temp;
  llvm_cbe_next1 = (&_11->field1);
  _12 = *((&_11->field1));
while (_12 != ((struct l_struct_struct_OC_elem*)/*NULL*/0)){
  _13 = llvm_cbe_temp;
  _14 = *((&_13->field1));
  llvm_cbe_temp = _14;

  _11 = llvm_cbe_temp;
  llvm_cbe_next1 = (&_11->field1);
  _12 = *((&_11->field1));
}
  llvm_cbe_call4 = malloc(16);
  llvm_cbe_holder = (((struct l_struct_struct_OC_elem*)llvm_cbe_call4));
  _15 = llvm_cbe_num_2e_addr;
  _16 = llvm_cbe_holder;
  *((&_16->field0)) = _15;
  _17 = llvm_cbe_holder;
  *((&_17->field1)) = ((struct l_struct_struct_OC_elem*)/*NULL*/0);
  _18 = llvm_cbe_holder;
  _19 = llvm_cbe_temp;
  *((&_19->field1)) = _18;

  return;
}


struct l_struct_struct_OC_elem* copyList(struct l_struct_struct_OC_elem* llvm_cbe_a) {
  struct l_struct_struct_OC_elem* llvm_cbe_a_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_elem* llvm_cbe_b;    /* Address-exposed local */
  struct l_struct_struct_OC_elem* llvm_cbe_tempA;    /* Address-exposed local */
  struct l_struct_struct_OC_elem* llvm_cbe_tempB;    /* Address-exposed local */
  struct l_struct_struct_OC_elem* llvm_cbe_temp;    /* Address-exposed local */
  struct l_struct_struct_OC_elem* _20;
  uint8_t* llvm_cbe_call;
  struct l_struct_struct_OC_elem* _21;
  uint32_t _22;
  struct l_struct_struct_OC_elem* _23;
  struct l_struct_struct_OC_elem* _24;
  struct l_struct_struct_OC_elem* _25;
  struct l_struct_struct_OC_elem* _26;
  struct l_struct_struct_OC_elem* _27;
  struct l_struct_struct_OC_elem* _28;
  uint8_t* llvm_cbe_call4;
  struct l_struct_struct_OC_elem* _29;
  uint32_t _30;
  struct l_struct_struct_OC_elem* _31;
  struct l_struct_struct_OC_elem* _32;
  struct l_struct_struct_OC_elem* _33;
  struct l_struct_struct_OC_elem* _34;
  struct l_struct_struct_OC_elem* _35;
  struct l_struct_struct_OC_elem* _36;
  struct l_struct_struct_OC_elem* _37;
  struct l_struct_struct_OC_elem* _38;

  llvm_cbe_a_2e_addr = llvm_cbe_a;
  ;
  ;
  ;
  ;
  ;
  _20 = llvm_cbe_a_2e_addr;
  if (!(((_20 != ((struct l_struct_struct_OC_elem*)/*NULL*/0))&1))) {
  llvm_cbe_call = malloc(16);
  llvm_cbe_b = (((struct l_struct_struct_OC_elem*)llvm_cbe_call));
  _21 = llvm_cbe_a_2e_addr;
  _22 = *((&_21->field0));
  _23 = llvm_cbe_b;
  *((&_23->field0)) = _22;
  _24 = llvm_cbe_b;
  *((&_24->field1)) = ((struct l_struct_struct_OC_elem*)/*NULL*/0);
  _25 = llvm_cbe_a_2e_addr;
  _26 = *((&_25->field1));
  llvm_cbe_tempA = _26;
  _27 = llvm_cbe_b;
  llvm_cbe_tempB = _27;

  _28 = llvm_cbe_tempA;
  if (!(((_28 != ((struct l_struct_struct_OC_elem*)/*NULL*/0))&1))) {
  }

  llvm_cbe_call4 = malloc(16);
  llvm_cbe_temp = (((struct l_struct_struct_OC_elem*)llvm_cbe_call4));
  _29 = llvm_cbe_tempA;
  _30 = *((&_29->field0));
  _31 = llvm_cbe_temp;
  *((&_31->field0)) = _30;
  _32 = llvm_cbe_temp;
  *((&_32->field1)) = ((struct l_struct_struct_OC_elem*)/*NULL*/0);
  _33 = llvm_cbe_temp;
  _34 = llvm_cbe_tempB;
  *((&_34->field1)) = _33;
  _35 = llvm_cbe_temp;
  llvm_cbe_tempB = _35;
  _36 = llvm_cbe_tempA;
  _37 = *((&_36->field1));
  llvm_cbe_tempA = _37;


}
  _28 = llvm_cbe_tempA;
while (_28 != ((struct l_struct_struct_OC_elem*)/*NULL*/0)){
  _28 = llvm_cbe_tempA;
}
  _38 = llvm_cbe_b;
  return _38;
}


void printList(struct l_struct_struct_OC_elem* llvm_cbe_a) {
  struct l_struct_struct_OC_elem* llvm_cbe_a_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC_elem* llvm_cbe_temp;    /* Address-exposed local */
  struct l_struct_struct_OC_elem* _39;
  struct l_struct_struct_OC_elem* _40;
  struct l_struct_struct_OC_elem* _41;
  uint32_t _42;
  uint32_t llvm_cbe_call;
  struct l_struct_struct_OC_elem* _43;
  struct l_struct_struct_OC_elem* _44;
  uint32_t llvm_cbe_call1;

  llvm_cbe_a_2e_addr = llvm_cbe_a;
  ;
  ;
  _39 = llvm_cbe_a_2e_addr;
  llvm_cbe_temp = _39;

  _40 = llvm_cbe_temp;
while (_40 != ((struct l_struct_struct_OC_elem*)/*NULL*/0)){
  _41 = llvm_cbe_temp;
  _42 = *((&_41->field0));
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _42);
  _43 = llvm_cbe_temp;
  _44 = *((&_43->field1));
  llvm_cbe_temp = _44;

  _40 = llvm_cbe_temp;
}
  llvm_cbe_call1 = printf(((&_OC_str_OC_1.array[((int64_t)0)])));
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  struct l_struct_struct_OC_elem* llvm_cbe_a;    /* Address-exposed local */
  struct l_struct_struct_OC_elem* llvm_cbe_b;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t _45;
  uint32_t _46;
  uint32_t _47;
  uint32_t llvm_cbe_call;
  struct l_struct_struct_OC_elem* _48;
  struct l_struct_struct_OC_elem* _49;
  struct l_struct_struct_OC_elem* llvm_cbe_call1;
  struct l_struct_struct_OC_elem* _50;
  uint32_t llvm_cbe_call2;
  struct l_struct_struct_OC_elem* _51;

  llvm_cbe_retval = 0;
  ;
  ;
  ;
  llvm_cbe_i = 1;

  _45 = llvm_cbe_i;
while (((int32_t)_45) <= ((int32_t)5u)){
  _46 = llvm_cbe_i;
  addToList((&llvm_cbe_a), _46);

  _47 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_47, 1));

  _45 = llvm_cbe_i;
}
  llvm_cbe_call = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  _48 = llvm_cbe_a;
  printList(_48);
  _49 = llvm_cbe_a;
  llvm_cbe_call1 = copyList(_49);
  llvm_cbe_b = llvm_cbe_call1;
  _50 = llvm_cbe_a;
  free((((uint8_t*)_50)));
  llvm_cbe_call2 = printf(((&_OC_str_OC_3.array[((int64_t)0)])));
  _51 = llvm_cbe_b;
  printList(_51);
  return 0;
}

