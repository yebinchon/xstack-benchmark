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

static __forceinline int llvm_fcmp_oeq(double X, double Y) { return X == Y; }
static __forceinline int llvm_fcmp_ogt(double X, double Y) { return X >  Y; }


/* Global Declarations */

/* Types Declarations */
struct l_struct_struct_OC_point;
struct l_unnamed_1;

/* Function definitions */

/* Types Definitions */
struct l_struct_struct_OC_point {
  double field0;
  double field1;
};
struct l_array_45_uint8_t {
  uint8_t array[45];
};
struct l_array_58_uint8_t {
  uint8_t array[58];
};
struct l_array_100_uint8_t {
  uint8_t array[100];
};
struct l_array_92_uint8_t {
  uint8_t array[92];
};
struct l_array_27_uint8_t {
  uint8_t array[27];
};
struct l_array_99_uint8_t {
  uint8_t array[99];
};
struct l_array_10_struct_AC_l_struct_struct_OC_point {
  struct l_struct_struct_OC_point array[10];
};
struct l_array_10_uint8_t {
  uint8_t array[10];
};
struct l_unnamed_1 {
  double field0;
  double field1;
};
struct l_array_5_double {
  double array[5];
};

/* External Global Variable Declarations */

/* Function Declarations */
double distance(double, double, double, double) __ATTRIBUTELIST__((noinline, nothrow));
double sqrt(double) __ATTRIBUTELIST__((nothrow));
void findCircles(double, double, double, double, double) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
double pow(double, double) __ATTRIBUTELIST__((nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_45_uint8_t _OC_str = { "\nNo circles can be drawn through (%.4f,%.4f)" };
static struct l_array_58_uint8_t _OC_str_OC_1 = { "\nInfinitely many circles can be drawn through (%.4f,%.4f)" };
static struct l_array_100_uint8_t _OC_str_OC_2 = { "\nGiven points are opposite ends of a diameter of the circle with center (%.4f,%.4f) and radius %.4f" };
static struct l_array_92_uint8_t _OC_str_OC_3 = { "\nGiven points are farther away from each other than a diameter of a circle with radius %.4f" };
static struct l_array_27_uint8_t _OC_str_OC_4 = { "\nTwo circles are possible." };
static struct l_array_99_uint8_t _OC_str_OC_5 = { "\nCircle C1 with center (%.4f,%.4f), radius %.4f and Circle C2 with center (%.4f,%.4f), radius %.4f" };
static __MSALIGN__(16) struct l_array_10_struct_AC_l_struct_struct_OC_point __const_OC_main_OC_cases __attribute__((aligned(16))) = { { { 0.1234, 0.98760000000000003 }, { 0.87649999999999995, 0.23449999999999999 }, { 0, 2 }, { 0, 0 }, { 0.1234, 0.98760000000000003 }, { 0.1234, 0.98760000000000003 }, { 0.1234, 0.98760000000000003 }, { 0.87649999999999995, 0.23449999999999999 }, { 0.1234, 0.98760000000000003 }, { 0.1234, 0.98760000000000003 } } };
static struct l_array_10_uint8_t _OC_str_OC_6 = { "\nCase %d)" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_mul_u32(uint32_t a, uint32_t b) {
  uint32_t r = a * b;
  return r;
}


/* Function Bodies */

double distance(double llvm_cbe_p1_2e_coerce0, double llvm_cbe_p1_2e_coerce1, double llvm_cbe_p2_2e_coerce0, double llvm_cbe_p2_2e_coerce1) {
  struct l_struct_struct_OC_point llvm_cbe_p1;    /* Address-exposed local */
  struct l_struct_struct_OC_point llvm_cbe_p2;    /* Address-exposed local */
  struct l_unnamed_1* _1;
  struct l_unnamed_1* _2;
  double _3;
  double _4;
  double _5;
  double _6;
  double _7;
  double _8;
  double _9;
  double _10;
  double llvm_cbe_call;

  _1 = ((struct l_unnamed_1*)(&llvm_cbe_p1));
  *((&_1->field0)) = llvm_cbe_p1_2e_coerce0;
  *((&_1->field1)) = llvm_cbe_p1_2e_coerce1;
  _2 = ((struct l_unnamed_1*)(&llvm_cbe_p2));
  *((&_2->field0)) = llvm_cbe_p2_2e_coerce0;
  *((&_2->field1)) = llvm_cbe_p2_2e_coerce1;
  ;
  ;
  _3 = *((&llvm_cbe_p1.field0));
  _4 = *((&llvm_cbe_p2.field0));
  _5 = *((&llvm_cbe_p1.field0));
  _6 = *((&llvm_cbe_p2.field0));
  _7 = *((&llvm_cbe_p1.field1));
  _8 = *((&llvm_cbe_p2.field1));
  _9 = *((&llvm_cbe_p1.field1));
  _10 = *((&llvm_cbe_p2.field1));
  llvm_cbe_call = sqrt((((_3 - _4) * (_5 - _6)) + ((_7 - _8) * (_9 - _10))));
  return llvm_cbe_call;
}


void findCircles(double llvm_cbe_p1_2e_coerce0, double llvm_cbe_p1_2e_coerce1, double llvm_cbe_p2_2e_coerce0, double llvm_cbe_p2_2e_coerce1, double llvm_cbe_radius) {
  struct l_struct_struct_OC_point llvm_cbe_p1;    /* Address-exposed local */
  struct l_struct_struct_OC_point llvm_cbe_p2;    /* Address-exposed local */
  struct l_unnamed_1* _11;
  struct l_unnamed_1* _12;
  struct l_unnamed_1* _13;
  double _14;
  double _15;
  struct l_unnamed_1* _16;
  double _17;
  double _18;
  double separation;
  double _19;
  double _20;
  uint32_t llvm_cbe_call2;
  double _21;
  double _22;
  uint32_t llvm_cbe_call5;
  uint32_t llvm_cbe_cond;
  uint32_t llvm_cbe_cond__PHI_TEMPORARY;
  double _23;
  double _24;
  double _25;
  double _26;
  uint32_t llvm_cbe_call14;
  uint32_t llvm_cbe_call19;
  double llvm_cbe_call21;
  double llvm_cbe_call23;
  double mirrorDistance;
  uint32_t llvm_cbe_call25;
  double _27;
  double _28;
  double _29;
  double _30;
  double _31;
  double _32;
  double _33;
  double _34;
  double _35;
  double _36;
  double _37;
  double _38;
  double _39;
  double _40;
  double _41;
  double _42;
  uint32_t llvm_cbe_call66;

  _11 = ((struct l_unnamed_1*)(&llvm_cbe_p1));
  *((&_11->field0)) = llvm_cbe_p1_2e_coerce0;
  *((&_11->field1)) = llvm_cbe_p1_2e_coerce1;
  _12 = ((struct l_unnamed_1*)(&llvm_cbe_p2));
  *((&_12->field0)) = llvm_cbe_p2_2e_coerce0;
  *((&_12->field1)) = llvm_cbe_p2_2e_coerce1;
  ;
  ;
  ;
  _13 = ((struct l_unnamed_1*)(&llvm_cbe_p1));
  _14 = *((&_13->field0));
  _15 = *((&_13->field1));
  _16 = ((struct l_unnamed_1*)(&llvm_cbe_p2));
  _17 = *((&_16->field0));
  _18 = *((&_16->field1));
  separation = distance(_14, _15, _17, _18);
  ;
  if ((((llvm_fcmp_oeq(separation, 0))&1))) {
  if ((((llvm_fcmp_oeq(llvm_cbe_radius, 0))&1))) {
  _19 = *((&llvm_cbe_p1.field0));
  _20 = *((&llvm_cbe_p1.field1));
  llvm_cbe_call2 = printf(((&_OC_str.array[((int64_t)0)])), _19, _20);
  llvm_cbe_cond__PHI_TEMPORARY = llvm_cbe_call2;   /* for PHI node */

  } else {
  _21 = *((&llvm_cbe_p1.field0));
  _22 = *((&llvm_cbe_p1.field1));
  llvm_cbe_call5 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _21, _22);
  llvm_cbe_cond__PHI_TEMPORARY = llvm_cbe_call5;   /* for PHI node */

}
  } else {
  if ((((llvm_fcmp_oeq(separation, (2 * llvm_cbe_radius)))&1))) {
  _23 = *((&llvm_cbe_p1.field0));
  _24 = *((&llvm_cbe_p2.field0));
  _25 = *((&llvm_cbe_p1.field1));
  _26 = *((&llvm_cbe_p2.field1));
  llvm_cbe_call14 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), ((_23 + _24) / 2), ((_25 + _26) / 2), llvm_cbe_radius);

  } else {
  if ((((llvm_fcmp_ogt(separation, (2 * llvm_cbe_radius)))&1))) {
  llvm_cbe_call19 = printf(((&_OC_str_OC_3.array[((int64_t)0)])), llvm_cbe_radius);

  } else {
  llvm_cbe_call21 = pow(llvm_cbe_radius, 2);
  llvm_cbe_call23 = pow((separation / 2), 2);
  mirrorDistance = sqrt((llvm_cbe_call21 - llvm_cbe_call23));
  ;
  llvm_cbe_call25 = printf(((&_OC_str_OC_4.array[((int64_t)0)])));
  _27 = *((&llvm_cbe_p1.field0));
  _28 = *((&llvm_cbe_p2.field0));
  _29 = *((&llvm_cbe_p1.field1));
  _30 = *((&llvm_cbe_p2.field1));
  _31 = *((&llvm_cbe_p1.field1));
  _32 = *((&llvm_cbe_p2.field1));
  _33 = *((&llvm_cbe_p2.field0));
  _34 = *((&llvm_cbe_p1.field0));
  _35 = *((&llvm_cbe_p1.field0));
  _36 = *((&llvm_cbe_p2.field0));
  _37 = *((&llvm_cbe_p1.field1));
  _38 = *((&llvm_cbe_p2.field1));
  _39 = *((&llvm_cbe_p1.field1));
  _40 = *((&llvm_cbe_p2.field1));
  _41 = *((&llvm_cbe_p2.field0));
  _42 = *((&llvm_cbe_p1.field0));
  llvm_cbe_call66 = printf(((&_OC_str_OC_5.array[((int64_t)0)])), (((_27 + _28) / 2) + ((mirrorDistance * (_29 - _30)) / separation)), (((_31 + _32) / 2) + ((mirrorDistance * (_33 - _34)) / separation)), llvm_cbe_radius, (((_35 + _36) / 2) - ((mirrorDistance * (_37 - _38)) / separation)), (((_39 + _40) / 2) - ((mirrorDistance * (_41 - _42)) / separation)), llvm_cbe_radius);

}
}
}
  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;



  return;
}


int main(void) {
  __MSALIGN__(16) struct l_array_10_struct_AC_l_struct_struct_OC_point llvm_cbe_cases __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_5_double llvm_cbe_radii __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _43;
  uint8_t* _44;
  uint8_t* _45;
  struct l_array_5_double* _46;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;
  double _47;
  struct l_unnamed_1* _48;
  double _49;
  double _50;
  struct l_unnamed_1* _51;
  double _52;
  double _53;

  ;
  _43 = memcpy((((uint8_t*)(&llvm_cbe_cases))), ((uint8_t*)(&__const_OC_main_OC_cases)), 160);
  ;
  _44 = ((uint8_t*)(&llvm_cbe_radii));
  _45 = memset(_44, 0, 40);
  _46 = ((struct l_array_5_double*)_44);
  *((&(*_46).array[((int32_t)0)])) = 2;
  *((&(*_46).array[((int32_t)1)])) = 1;
  *((&(*_46).array[((int32_t)2)])) = 2;
  *((&(*_46).array[((int32_t)3)])) = 0.5;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)5u)){
  llvm_cbe_call = printf(((&_OC_str_OC_6.array[((int64_t)0)])), (llvm_add_u32(i, 1)));
  _47 = *((&llvm_cbe_radii.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _48 = ((struct l_unnamed_1*)((&llvm_cbe_cases.array[((int64_t)(((int64_t)(int32_t)(llvm_mul_u32(2, i)))))])));
  _49 = *((&_48->field0));
  _50 = *((&_48->field1));
  _51 = ((struct l_unnamed_1*)((&llvm_cbe_cases.array[((int64_t)(((int64_t)(int32_t)(llvm_add_u32((llvm_mul_u32(2, i)), 1)))))])));
  _52 = *((&_51->field0));
  _53 = *((&_51->field1));
  findCircles(_49, _50, _52, _53, _47);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return 0;
}

