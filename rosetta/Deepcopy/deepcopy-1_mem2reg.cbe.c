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
struct l_struct_struct_OC_layer1;
struct l_struct_struct_OC_layer2;
struct l_struct_struct_OC_layer3;

/* Function definitions */

/* Types Definitions */
struct l_struct_struct_OC_layer1 {
  uint32_t field0;
};
struct l_struct_struct_OC_layer2 {
  struct l_struct_struct_OC_layer1 field0;
  float field1;
  float field2;
};
struct l_struct_struct_OC_layer3 {
  struct l_struct_struct_OC_layer2 field0;
  struct l_struct_struct_OC_layer1 field1;
  uint32_t field2;
  uint32_t field3;
};
struct l_array_13_uint8_t {
  uint8_t array[13];
};
struct l_array_16_uint8_t {
  uint8_t array[16];
};
struct l_array_19_uint8_t {
  uint8_t array[19];
};
struct l_array_14_uint8_t {
  uint8_t array[14];
};

/* External Global Variable Declarations */

/* Function Declarations */
void showCake(struct l_struct_struct_OC_layer3) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_13_uint8_t _OC_str = { "\ncake.d = %d" };
static struct l_array_13_uint8_t _OC_str_OC_1 = { "\ncake.e = %d" };
static struct l_array_16_uint8_t _OC_str_OC_2 = { "\ncake.l1.a = %d" };
static struct l_array_16_uint8_t _OC_str_OC_3 = { "\ncake.l2.b = %f" };
static struct l_array_19_uint8_t _OC_str_OC_4 = { "\ncake.l2.l1.a = %d" };
static struct l_array_13_uint8_t _OC_str_OC_5 = { "Cake 1 is : " };
static struct l_array_14_uint8_t _OC_str_OC_6 = { "\nCake 2 is : " };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline float llvm_fadd_f32(float a, float b) {
  float r = a + b;
  return r;
}


/* Function Bodies */

void showCake(struct l_struct_struct_OC_layer3 llvm_cbe_cake) {
  uint32_t _1;
  uint32_t llvm_cbe_call;
  uint32_t _2;
  uint32_t llvm_cbe_call1;
  uint32_t _3;
  uint32_t llvm_cbe_call2;
  float _4;
  uint32_t llvm_cbe_call3;
  uint32_t _5;
  uint32_t llvm_cbe_call7;

  ;
  _1 = *((&llvm_cbe_cake->field2));
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _1);
  _2 = *((&llvm_cbe_cake->field3));
  llvm_cbe_call1 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _2);
  _3 = *((&((&llvm_cbe_cake->field1))->field0));
  llvm_cbe_call2 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), _3);
  _4 = *((&((&llvm_cbe_cake->field0))->field1));
  llvm_cbe_call3 = printf(((&_OC_str_OC_3.array[((int64_t)0)])), (((double)_4)));
  _5 = *((&((&((&llvm_cbe_cake->field0))->field0))->field0));
  llvm_cbe_call7 = printf(((&_OC_str_OC_4.array[((int64_t)0)])), _5);
}


int main(void) {
  __MSALIGN__(8) struct l_struct_struct_OC_layer3 llvm_cbe_cake1 __attribute__((aligned(8)));    /* Address-exposed local */
  __MSALIGN__(8) struct l_struct_struct_OC_layer3 llvm_cbe_cake2 __attribute__((aligned(8)));    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint8_t* _6;
  uint32_t _7;
  float* llvm_cbe_b8;
  float _8;
  uint32_t llvm_cbe_call9;

  ;
  ;
  *((&llvm_cbe_cake1.field2)) = 1;
  *((&llvm_cbe_cake1.field3)) = 2;
  *((&((&llvm_cbe_cake1.field1))->field0)) = 3;
  *((&((&llvm_cbe_cake1.field0))->field1)) = 4;
  *((&((&((&llvm_cbe_cake1.field0))->field0))->field0)) = 5;
  llvm_cbe_call = printf(((&_OC_str_OC_5.array[((int64_t)0)])));
  showCake(llvm_cbe_cake1);
  _6 = memcpy((((uint8_t*)(&llvm_cbe_cake2))), (((uint8_t*)(&llvm_cbe_cake1))), 24);
  _7 = *((&((&((&llvm_cbe_cake2.field0))->field0))->field0));
  llvm_cbe_b8 = (&((&llvm_cbe_cake2.field0))->field1);
  _8 = *llvm_cbe_b8;
  *llvm_cbe_b8 = (llvm_fadd_f32(_8, (((float)(int32_t)_7))));
  llvm_cbe_call9 = printf(((&_OC_str_OC_6.array[((int64_t)0)])));
  showCake(llvm_cbe_cake2);
  return 0;
}

