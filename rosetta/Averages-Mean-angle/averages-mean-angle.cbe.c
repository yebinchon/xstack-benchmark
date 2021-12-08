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

/* Function definitions */

/* Types Definitions */
struct l_array_2_double {
  double array[2];
};
struct l_array_4_double {
  double array[4];
};
struct l_array_3_double {
  double array[3];
};
struct l_array_38_uint8_t {
  uint8_t array[38];
};
struct l_array_39_uint8_t {
  uint8_t array[39];
};

/* External Global Variable Declarations */

/* Function Declarations */
double meanAngle(double*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
double cos(double) __ATTRIBUTELIST__((nothrow));
double sin(double) __ATTRIBUTELIST__((nothrow));
double atan2(double, double) __ATTRIBUTELIST__((nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static __MSALIGN__(16) struct l_array_2_double __const_OC_main_OC_angleSet1 __attribute__((aligned(16))) = { { 350, 10 } };
static __MSALIGN__(16) struct l_array_4_double __const_OC_main_OC_angleSet2 __attribute__((aligned(16))) = { { 90, 180, 270, 360 } };
static __MSALIGN__(16) struct l_array_3_double __const_OC_main_OC_angleSet3 __attribute__((aligned(16))) = { { 10, 20, 30 } };
static struct l_array_38_uint8_t _OC_str = { "\nMean Angle for 1st set : %lf degrees" };
static struct l_array_38_uint8_t _OC_str_OC_1 = { "\nMean Angle for 2nd set : %lf degrees" };
static struct l_array_39_uint8_t _OC_str_OC_2 = { "\nMean Angle for 3rd set : %lf degrees\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

double meanAngle(double* llvm_cbe_angles, uint32_t llvm_cbe_size) {
  double* llvm_cbe_angles_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_size_2e_addr;    /* Address-exposed local */
  double llvm_cbe_y_part;    /* Address-exposed local */
  double llvm_cbe_x_part;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  double* _3;
  uint32_t _4;
  double _5;
  double llvm_cbe_call;
  double _6;
  double* _7;
  uint32_t _8;
  double _9;
  double llvm_cbe_call5;
  double _10;
  uint32_t _11;
  double _12;
  uint32_t _13;
  double _14;
  uint32_t _15;
  double llvm_cbe_call10;

  llvm_cbe_angles_2e_addr = llvm_cbe_angles;
  ;
  llvm_cbe_size_2e_addr = llvm_cbe_size;
  ;
  ;
  llvm_cbe_y_part = 0;
  ;
  llvm_cbe_x_part = 0;
  ;
  llvm_cbe_i = 0;

  _1 = llvm_cbe_i;
  _2 = llvm_cbe_size_2e_addr;
while (((int32_t)_1) < ((int32_t)_2)){
  _3 = llvm_cbe_angles_2e_addr;
  _4 = llvm_cbe_i;
  _5 = *((&_3[((int64_t)(((int64_t)(int32_t)_4)))]));
  llvm_cbe_call = cos(((_5 * 3.1415926535897931) / 180));
  _6 = llvm_cbe_x_part;
  llvm_cbe_x_part = (_6 + llvm_cbe_call);
  _7 = llvm_cbe_angles_2e_addr;
  _8 = llvm_cbe_i;
  _9 = *((&_7[((int64_t)(((int64_t)(int32_t)_8)))]));
  llvm_cbe_call5 = sin(((_9 * 3.1415926535897931) / 180));
  _10 = llvm_cbe_y_part;
  llvm_cbe_y_part = (_10 + llvm_cbe_call5);

  _11 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_11, 1));

  _1 = llvm_cbe_i;
  _2 = llvm_cbe_size_2e_addr;
}
  _12 = llvm_cbe_y_part;
  _13 = llvm_cbe_size_2e_addr;
  _14 = llvm_cbe_x_part;
  _15 = llvm_cbe_size_2e_addr;
  llvm_cbe_call10 = atan2((_12 / (((double)(int32_t)_13))), (_14 / (((double)(int32_t)_15))));
  return ((llvm_cbe_call10 * 180) / 3.1415926535897931);
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_2_double llvm_cbe_angleSet1 __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_4_double llvm_cbe_angleSet2 __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_angleSet3 __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _16;
  uint8_t* _17;
  uint8_t* _18;
  double llvm_cbe_call;
  uint32_t llvm_cbe_call1;
  double llvm_cbe_call3;
  uint32_t llvm_cbe_call4;
  double llvm_cbe_call6;
  uint32_t llvm_cbe_call7;

  llvm_cbe_retval = 0;
  ;
  _16 = memcpy((((uint8_t*)(&llvm_cbe_angleSet1))), ((uint8_t*)(&__const_OC_main_OC_angleSet1)), 16);
  ;
  _17 = memcpy((((uint8_t*)(&llvm_cbe_angleSet2))), ((uint8_t*)(&__const_OC_main_OC_angleSet2)), 32);
  ;
  _18 = memcpy((((uint8_t*)(&llvm_cbe_angleSet3))), ((uint8_t*)(&__const_OC_main_OC_angleSet3)), 24);
  llvm_cbe_call = meanAngle(((&llvm_cbe_angleSet1.array[((int64_t)0)])), 2);
  llvm_cbe_call1 = printf(((&_OC_str.array[((int64_t)0)])), llvm_cbe_call);
  llvm_cbe_call3 = meanAngle(((&llvm_cbe_angleSet2.array[((int64_t)0)])), 4);
  llvm_cbe_call4 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), llvm_cbe_call3);
  llvm_cbe_call6 = meanAngle(((&llvm_cbe_angleSet3.array[((int64_t)0)])), 3);
  llvm_cbe_call7 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), llvm_cbe_call6);
  return 0;
}

