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
  double y_part;
  double y_part__PHI_TEMPORARY;
  double x_part;
  double x_part__PHI_TEMPORARY;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  double _1;
  double llvm_cbe_call;
  double _2;
  double llvm_cbe_call5;
  double llvm_cbe_call10;

  ;
  ;
  ;
  ;
  ;
  y_part__PHI_TEMPORARY = 0;   /* for PHI node */
  x_part__PHI_TEMPORARY = 0;   /* for PHI node */
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  y_part = y_part__PHI_TEMPORARY;
  x_part = x_part__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
  ;
while (((int32_t)i) < ((int32_t)llvm_cbe_size)){
  _1 = *((&llvm_cbe_angles[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call = cos(((_1 * 3.1415926535897931) / 180));
  x_part = x_part + llvm_cbe_call;
  ;
  _2 = *((&llvm_cbe_angles[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call5 = sin(((_2 * 3.1415926535897931) / 180));
  y_part = y_part + llvm_cbe_call5;
  ;

  i = llvm_add_u32(i, 1);
  ;
  y_part__PHI_TEMPORARY = y_part;   /* for PHI node */
  x_part__PHI_TEMPORARY = x_part;   /* for PHI node */
  i__PHI_TEMPORARY = i;   /* for PHI node */

  y_part = y_part__PHI_TEMPORARY;
  x_part = x_part__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
  ;
}
  llvm_cbe_call10 = atan2((y_part / (((double)(int32_t)llvm_cbe_size))), (x_part / (((double)(int32_t)llvm_cbe_size))));
  return ((llvm_cbe_call10 * 180) / 3.1415926535897931);
}


int main(void) {
  __MSALIGN__(16) struct l_array_2_double llvm_cbe_angleSet1 __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_4_double llvm_cbe_angleSet2 __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_angleSet3 __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _3;
  uint8_t* _4;
  uint8_t* _5;
  double llvm_cbe_call;
  uint32_t llvm_cbe_call1;
  double llvm_cbe_call3;
  uint32_t llvm_cbe_call4;
  double llvm_cbe_call6;
  uint32_t llvm_cbe_call7;

  ;
  _3 = memcpy((((uint8_t*)(&llvm_cbe_angleSet1))), ((uint8_t*)(&__const_OC_main_OC_angleSet1)), 16);
  ;
  _4 = memcpy((((uint8_t*)(&llvm_cbe_angleSet2))), ((uint8_t*)(&__const_OC_main_OC_angleSet2)), 32);
  ;
  _5 = memcpy((((uint8_t*)(&llvm_cbe_angleSet3))), ((uint8_t*)(&__const_OC_main_OC_angleSet3)), 24);
  llvm_cbe_call = meanAngle(((&llvm_cbe_angleSet1.array[((int64_t)0)])), 2);
  llvm_cbe_call1 = printf(((&_OC_str.array[((int64_t)0)])), llvm_cbe_call);
  llvm_cbe_call3 = meanAngle(((&llvm_cbe_angleSet2.array[((int64_t)0)])), 4);
  llvm_cbe_call4 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), llvm_cbe_call3);
  llvm_cbe_call6 = meanAngle(((&llvm_cbe_angleSet3.array[((int64_t)0)])), 3);
  llvm_cbe_call7 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), llvm_cbe_call6);
  return 0;
}

