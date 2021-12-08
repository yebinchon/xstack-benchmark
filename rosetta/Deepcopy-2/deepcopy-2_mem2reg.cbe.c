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
struct l_struct_struct_OC_elem {
  uint32_t field0;
  struct l_struct_struct_OC_elem* field1;
};
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
  struct l_struct_struct_OC_elem* _1;
  uint8_t* llvm_cbe_call;
  struct l_struct_struct_OC_elem* _2;
  struct l_struct_struct_OC_elem* _3;
  struct l_struct_struct_OC_elem* temp;
  struct l_struct_struct_OC_elem* temp__PHI_TEMPORARY;
  struct l_struct_struct_OC_elem* _4;
  uint8_t* llvm_cbe_call4;
  struct l_struct_struct_OC_elem* holder;

  ;
  ;
  _1 = *llvm_cbe_a;
  if ((((_1 == ((struct l_struct_struct_OC_elem*)/*NULL*/0))&1))) {
  llvm_cbe_call = malloc(16);
  *llvm_cbe_a = (((struct l_struct_struct_OC_elem*)llvm_cbe_call));
  _2 = *llvm_cbe_a;
  *((&_2->field0)) = llvm_cbe_num;
  _3 = *llvm_cbe_a;
  *((&_3->field1)) = ((struct l_struct_struct_OC_elem*)/*NULL*/0);

  return;
}
  temp = *llvm_cbe_a;
  ;
  temp__PHI_TEMPORARY = temp;   /* for PHI node */

  struct l_struct_struct_OC_elem** llvm_cbe_next1;
  temp = temp__PHI_TEMPORARY;
  ;
  llvm_cbe_next1 = (&temp->field1);
  _4 = *((&temp->field1));
while (_4 != ((struct l_struct_struct_OC_elem*)/*NULL*/0)){
  temp = *((&temp->field1));
  ;
  temp__PHI_TEMPORARY = temp;   /* for PHI node */

  temp = temp__PHI_TEMPORARY;
  ;
  llvm_cbe_next1 = (&temp->field1);
  _4 = *((&temp->field1));
}
  llvm_cbe_call4 = malloc(16);
  holder = ((struct l_struct_struct_OC_elem*)llvm_cbe_call4);
  ;
  *((&holder->field0)) = llvm_cbe_num;
  *((&holder->field1)) = ((struct l_struct_struct_OC_elem*)/*NULL*/0);
  *((&temp->field1)) = holder;

  return;
}


struct l_struct_struct_OC_elem* copyList(struct l_struct_struct_OC_elem* llvm_cbe_a) {
  uint8_t* llvm_cbe_call;
  struct l_struct_struct_OC_elem* _5;
  uint32_t _6;
  struct l_struct_struct_OC_elem* tempA;
  struct l_struct_struct_OC_elem* tempA__PHI_TEMPORARY;
  struct l_struct_struct_OC_elem* tempB;
  struct l_struct_struct_OC_elem* tempB__PHI_TEMPORARY;
  uint8_t* llvm_cbe_call4;
  struct l_struct_struct_OC_elem* _7;
  uint32_t _8;
  struct l_struct_struct_OC_elem* b;
  struct l_struct_struct_OC_elem* b__PHI_TEMPORARY;

  ;
  if (!(((llvm_cbe_a != ((struct l_struct_struct_OC_elem*)/*NULL*/0))&1))) {
  llvm_cbe_call = malloc(16);
  _5 = ((struct l_struct_struct_OC_elem*)llvm_cbe_call);
  ;
  _6 = *((&llvm_cbe_a->field0));
  *((&_5->field0)) = _6;
  *((&_5->field1)) = ((struct l_struct_struct_OC_elem*)/*NULL*/0);
  tempA = *((&llvm_cbe_a->field1));
  ;
  ;
  tempA__PHI_TEMPORARY = tempA;   /* for PHI node */
  tempB__PHI_TEMPORARY = _5;   /* for PHI node */

  tempA = tempA__PHI_TEMPORARY;
  tempB = tempB__PHI_TEMPORARY;
  ;
  ;
  if (!(((tempA != ((struct l_struct_struct_OC_elem*)/*NULL*/0))&1))) {
  }

  llvm_cbe_call4 = malloc(16);
  _7 = ((struct l_struct_struct_OC_elem*)llvm_cbe_call4);
  ;
  _8 = *((&tempA->field0));
  *((&_7->field0)) = _8;
  *((&_7->field1)) = ((struct l_struct_struct_OC_elem*)/*NULL*/0);
  *((&tempB->field1)) = _7;
  ;
  tempA = *((&tempA->field1));
  ;
  tempA__PHI_TEMPORARY = tempA;   /* for PHI node */
  tempB__PHI_TEMPORARY = _7;   /* for PHI node */

  b__PHI_TEMPORARY = _5;   /* for PHI node */

}
  tempA = tempA__PHI_TEMPORARY;
  tempB = tempB__PHI_TEMPORARY;
  ;
  ;
while (tempA != ((struct l_struct_struct_OC_elem*)/*NULL*/0)){
  tempA = tempA__PHI_TEMPORARY;
  tempB = tempB__PHI_TEMPORARY;
  ;
  ;
}
  b = b__PHI_TEMPORARY;
  ;
  return b;
}


void printList(struct l_struct_struct_OC_elem* llvm_cbe_a) {
  struct l_struct_struct_OC_elem* temp;
  struct l_struct_struct_OC_elem* temp__PHI_TEMPORARY;
  uint32_t _9;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call1;

  ;
  ;
  temp__PHI_TEMPORARY = llvm_cbe_a;   /* for PHI node */

  temp = temp__PHI_TEMPORARY;
  ;
while (temp != ((struct l_struct_struct_OC_elem*)/*NULL*/0)){
  _9 = *((&temp->field0));
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _9);
  temp = *((&temp->field1));
  ;
  temp__PHI_TEMPORARY = temp;   /* for PHI node */

  temp = temp__PHI_TEMPORARY;
  ;
}
  llvm_cbe_call1 = printf(((&_OC_str_OC_1.array[((int64_t)0)])));
}


int main(void) {
  struct l_struct_struct_OC_elem* llvm_cbe_a;    /* Address-exposed local */
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;
  struct l_struct_struct_OC_elem* _10;
  struct l_struct_struct_OC_elem* _11;
  struct l_struct_struct_OC_elem* b;
  struct l_struct_struct_OC_elem* _12;
  uint32_t llvm_cbe_call2;

  ;
  ;
  i__PHI_TEMPORARY = 1;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) <= ((int32_t)5u)){
  addToList((&llvm_cbe_a), i);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  llvm_cbe_call = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  _10 = llvm_cbe_a;
  printList(_10);
  _11 = llvm_cbe_a;
  b = copyList(_11);
  ;
  _12 = llvm_cbe_a;
  free((((uint8_t*)_12)));
  llvm_cbe_call2 = printf(((&_OC_str_OC_3.array[((int64_t)0)])));
  printList(b);
  return 0;
}

