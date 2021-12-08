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

static __forceinline int llvm_fcmp_ole(double X, double Y) { return X <= Y; }
static __forceinline int llvm_fcmp_une(double X, double Y) { return X != Y; }
static __forceinline int llvm_fcmp_ogt(double X, double Y) { return X >  Y; }
static __forceinline int llvm_fcmp_olt(double X, double Y) { return X <  Y; }


/* Global Declarations */

/* Types Declarations */
struct l_struct_struct_OC_face_t;

/* Function definitions */

/* Types Definitions */
struct l_array_4_double_KC_ {
  double* array[4];
};
struct l_array_3_double {
  double array[3];
};
struct l_struct_struct_OC_face_t {
  struct l_array_4_double_KC_ field0;
  struct l_array_3_double field1;
};
struct l_array_11_uint8_t {
  uint8_t array[11];
};
struct l_array_6_struct_AC_l_struct_struct_OC_face_t {
  struct l_struct_struct_OC_face_t array[6];
};

/* External Global Variable Declarations */

/* Function Declarations */
void vsub(double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
double normalize(double*) __ATTRIBUTELIST__((noinline, nothrow));
double sqrt(double) __ATTRIBUTELIST__((nothrow));
double dot(double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
double* cross(double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
double* madd(double*, double*, double, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t in_range(double, double, double) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t face_hit(struct l_struct_struct_OC_face_t*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t putchar(uint32_t);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_11_uint8_t _OC_str = { ".:!*oe&#%@" };
uint8_t* shades = ((&_OC_str.array[((int32_t)0)]));
__MSALIGN__(16) struct l_array_3_double v000 __attribute__((aligned(16))) = { { -4, -3, -2 } };
__MSALIGN__(16) struct l_array_3_double v100 __attribute__((aligned(16))) = { { 4, -3, -2 } };
__MSALIGN__(16) struct l_array_3_double v010 __attribute__((aligned(16))) = { { -4, 3, -2 } };
__MSALIGN__(16) struct l_array_3_double v110 __attribute__((aligned(16))) = { { 4, 3, -2 } };
__MSALIGN__(16) struct l_array_3_double v001 __attribute__((aligned(16))) = { { -4, -3, 2 } };
__MSALIGN__(16) struct l_array_3_double v101 __attribute__((aligned(16))) = { { 4, -3, 2 } };
__MSALIGN__(16) struct l_array_3_double v011 __attribute__((aligned(16))) = { { -4, 3, 2 } };
__MSALIGN__(16) struct l_array_3_double v111 __attribute__((aligned(16))) = { { 4, 3, 2 } };
__MSALIGN__(16) struct l_array_6_struct_AC_l_struct_struct_OC_face_t f __attribute__((aligned(16))) = { { { { { ((&v000.array[((int32_t)0)])), ((&v010.array[((int32_t)0)])), ((&v110.array[((int32_t)0)])), ((&v100.array[((int32_t)0)])) } }, { { 0, 0, -1 } } }, { { { ((&v001.array[((int32_t)0)])), ((&v011.array[((int32_t)0)])), ((&v111.array[((int32_t)0)])), ((&v101.array[((int32_t)0)])) } }, { { 0, 0, 1 } } }, { { { ((&v000.array[((int32_t)0)])), ((&v010.array[((int32_t)0)])), ((&v011.array[((int32_t)0)])), ((&v001.array[((int32_t)0)])) } }, { { -1, 0, 0 } } }, { { { ((&v100.array[((int32_t)0)])), ((&v110.array[((int32_t)0)])), ((&v111.array[((int32_t)0)])), ((&v101.array[((int32_t)0)])) } }, { { 1, 0, 0 } } }, { { { ((&v000.array[((int32_t)0)])), ((&v100.array[((int32_t)0)])), ((&v101.array[((int32_t)0)])), ((&v001.array[((int32_t)0)])) } }, { { 0, -1, 0 } } }, { { { ((&v010.array[((int32_t)0)])), ((&v110.array[((int32_t)0)])), ((&v111.array[((int32_t)0)])), ((&v011.array[((int32_t)0)])) } }, { { 0, 1, 0 } } } } };
static __MSALIGN__(16) struct l_array_3_double __const_OC_main_OC_eye __attribute__((aligned(16))) = { { 7, 7, 6 } };
static __MSALIGN__(16) struct l_array_3_double __const_OC_main_OC_dir __attribute__((aligned(16))) = { { -1, -1, -1 } };
static __MSALIGN__(16) struct l_array_3_double __const_OC_main_OC_dy __attribute__((aligned(16))) = { { 0, 0, 1 } };
static __MSALIGN__(16) struct l_array_3_double __const_OC_main_OC_light __attribute__((aligned(16))) = { { 6, 8, 6 } };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline double llvm_OC_fabs_OC_f64(double a) {
  double r;
  r = fabs(a);
  return r;
}


/* Function Bodies */

void vsub(double* llvm_cbe_v1, double* llvm_cbe_v2, double* llvm_cbe_s) {
  double _1;
  double _2;
  double _3;
  double _4;
  double _5;
  double _6;

  ;
  ;
  ;
  _1 = *((&(*llvm_cbe_v1)));
  _2 = *((&(*llvm_cbe_v2)));
  *((&(*llvm_cbe_s))) = (_1 - _2);
  _3 = *((&llvm_cbe_v1[((int64_t)1)]));
  _4 = *((&llvm_cbe_v2[((int64_t)1)]));
  *((&llvm_cbe_s[((int64_t)1)])) = (_3 - _4);
  _5 = *((&llvm_cbe_v1[((int64_t)2)]));
  _6 = *((&llvm_cbe_v2[((int64_t)2)]));
  *((&llvm_cbe_s[((int64_t)2)])) = (_5 - _6);
}


double normalize(double* llvm_cbe_v) {
  double _7;
  double _8;
  double _9;
  double _10;
  double _11;
  double _12;
  double len;
  double* llvm_cbe_arrayidx9;
  double _13;
  double* llvm_cbe_arrayidx10;
  double _14;
  double* llvm_cbe_arrayidx12;
  double _15;

  ;
  _7 = *((&(*llvm_cbe_v)));
  _8 = *((&(*llvm_cbe_v)));
  _9 = *((&llvm_cbe_v[((int64_t)1)]));
  _10 = *((&llvm_cbe_v[((int64_t)1)]));
  _11 = *((&llvm_cbe_v[((int64_t)2)]));
  _12 = *((&llvm_cbe_v[((int64_t)2)]));
  len = sqrt((((_7 * _8) + (_9 * _10)) + (_11 * _12)));
  ;
  llvm_cbe_arrayidx9 = (&(*llvm_cbe_v));
  _13 = *llvm_cbe_arrayidx9;
  *llvm_cbe_arrayidx9 = (_13 / len);
  llvm_cbe_arrayidx10 = (&llvm_cbe_v[((int64_t)1)]);
  _14 = *llvm_cbe_arrayidx10;
  *llvm_cbe_arrayidx10 = (_14 / len);
  llvm_cbe_arrayidx12 = (&llvm_cbe_v[((int64_t)2)]);
  _15 = *llvm_cbe_arrayidx12;
  *llvm_cbe_arrayidx12 = (_15 / len);
  return len;
}


double dot(double* llvm_cbe_x, double* llvm_cbe_y) {
  double _16;
  double _17;
  double _18;
  double _19;
  double _20;
  double _21;

  ;
  ;
  _16 = *((&(*llvm_cbe_x)));
  _17 = *((&(*llvm_cbe_y)));
  _18 = *((&llvm_cbe_x[((int64_t)1)]));
  _19 = *((&llvm_cbe_y[((int64_t)1)]));
  _20 = *((&llvm_cbe_x[((int64_t)2)]));
  _21 = *((&llvm_cbe_y[((int64_t)2)]));
  return (((_16 * _17) + (_18 * _19)) + (_20 * _21));
}


double* cross(double* llvm_cbe_x, double* llvm_cbe_y, double* llvm_cbe_s) {
  double _22;
  double _23;
  double _24;
  double _25;
  double _26;
  double _27;
  double _28;
  double _29;
  double _30;
  double _31;
  double _32;
  double _33;

  ;
  ;
  ;
  _22 = *((&llvm_cbe_x[((int64_t)1)]));
  _23 = *((&llvm_cbe_y[((int64_t)2)]));
  _24 = *((&llvm_cbe_x[((int64_t)2)]));
  _25 = *((&llvm_cbe_y[((int64_t)1)]));
  *((&(*llvm_cbe_s))) = ((_22 * _23) - (_24 * _25));
  _26 = *((&llvm_cbe_x[((int64_t)2)]));
  _27 = *((&(*llvm_cbe_y)));
  _28 = *((&(*llvm_cbe_x)));
  _29 = *((&llvm_cbe_y[((int64_t)2)]));
  *((&llvm_cbe_s[((int64_t)1)])) = ((_26 * _27) - (_28 * _29));
  _30 = *((&(*llvm_cbe_x)));
  _31 = *((&llvm_cbe_y[((int64_t)1)]));
  _32 = *((&llvm_cbe_x[((int64_t)1)]));
  _33 = *((&(*llvm_cbe_y)));
  *((&llvm_cbe_s[((int64_t)2)])) = ((_30 * _31) - (_32 * _33));
  return llvm_cbe_s;
}


double* madd(double* llvm_cbe_x, double* llvm_cbe_y, double llvm_cbe_d, double* llvm_cbe_r) {
  double _34;
  double _35;
  double _36;
  double _37;
  double _38;
  double _39;

  ;
  ;
  ;
  ;
  _34 = *((&(*llvm_cbe_x)));
  _35 = *((&(*llvm_cbe_y)));
  *((&(*llvm_cbe_r))) = (_34 + (_35 * llvm_cbe_d));
  _36 = *((&llvm_cbe_x[((int64_t)1)]));
  _37 = *((&llvm_cbe_y[((int64_t)1)]));
  *((&llvm_cbe_r[((int64_t)1)])) = (_36 + (_37 * llvm_cbe_d));
  _38 = *((&llvm_cbe_x[((int64_t)2)]));
  _39 = *((&llvm_cbe_y[((int64_t)2)]));
  *((&llvm_cbe_r[((int64_t)2)])) = (_38 + (_39 * llvm_cbe_d));
  return llvm_cbe_r;
}


uint32_t in_range(double llvm_cbe_x, double llvm_cbe_x0, double llvm_cbe_x1) {
  ;
  ;
  ;
  return (((uint32_t)(bool)(((llvm_fcmp_ole(((llvm_cbe_x - llvm_cbe_x0) * (llvm_cbe_x - llvm_cbe_x1)), 0))&1))));
}


uint32_t face_hit(struct l_struct_struct_OC_face_t* llvm_cbe_face, double* llvm_cbe_src, double* llvm_cbe_dir, double* llvm_cbe_hit, double* llvm_cbe_d) {
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  double dist;
  double dist__PHI_TEMPORARY;
  double _40;
  double* _41;
  double _42;
  double _43;
  double _44;
  double* llvm_cbe_call;
  double llvm_cbe_call9;
  double _45;
  double _46;
  double _47;
  double* _48;
  double _49;
  double* _50;
  double _51;
  uint32_t llvm_cbe_call21;
  double _52;
  double* _53;
  double _54;
  double* _55;
  double _56;
  uint32_t llvm_cbe_call30;
  bool _57;
  bool _57__PHI_TEMPORARY;
  uint32_t llvm_cbe_land_2e_ext;
  double _58;
  double _59;
  double* _60;
  double _61;
  double* _62;
  double _63;
  uint32_t llvm_cbe_call43;
  double _64;
  double* _65;
  double _66;
  double* _67;
  double _68;
  uint32_t llvm_cbe_call53;
  bool _69;
  bool _69__PHI_TEMPORARY;
  uint32_t llvm_cbe_land_2e_ext56;
  double _70;
  double _71;
  double* _72;
  double _73;
  double* _74;
  double _75;
  uint32_t llvm_cbe_call69;
  double _76;
  double* _77;
  double _78;
  double* _79;
  double _80;
  uint32_t llvm_cbe_call79;
  bool _81;
  bool _81__PHI_TEMPORARY;
  uint32_t llvm_cbe_land_2e_ext82;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  ;
  ;
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  dist = dist__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) < ((int32_t)3u)){
  _40 = *((&(*((&llvm_cbe_face->field1))).array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((llvm_fcmp_une(_40, 0))&1))) {
  _41 = *((&(*((&llvm_cbe_face->field0))).array[((int64_t)0)]));
  _42 = *((&_41[((int64_t)(((int64_t)(int32_t)i)))]));
  _43 = *((&llvm_cbe_src[((int64_t)(((int64_t)(int32_t)i)))]));
  _44 = *((&llvm_cbe_dir[((int64_t)(((int64_t)(int32_t)i)))]));
  dist = (_42 - _43) / _44;
  ;
  dist__PHI_TEMPORARY = dist;   /* for PHI node */

}
  dist = dist__PHI_TEMPORARY;
  ;

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  dist__PHI_TEMPORARY = dist;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  dist = dist__PHI_TEMPORARY;
  ;
  ;
}
  llvm_cbe_call = madd(llvm_cbe_src, llvm_cbe_dir, dist, llvm_cbe_hit);
  llvm_cbe_call9 = dot(llvm_cbe_dir, ((&(*((&llvm_cbe_face->field1))).array[((int64_t)0)])));
  _45 = llvm_OC_fabs_OC_f64((llvm_cbe_call9 * dist));
  *llvm_cbe_d = _45;
  _46 = *((&(*((&llvm_cbe_face->field1))).array[((int64_t)0)]));
  if ((((llvm_fcmp_une(_46, 0))&1))) {
  _47 = *((&llvm_cbe_hit[((int64_t)1)]));
  _48 = *((&(*((&llvm_cbe_face->field0))).array[((int64_t)0)]));
  _49 = *((&_48[((int64_t)1)]));
  _50 = *((&(*((&llvm_cbe_face->field0))).array[((int64_t)2)]));
  _51 = *((&_50[((int64_t)1)]));
  llvm_cbe_call21 = in_range(_47, _49, _51);
  if (!(((llvm_cbe_call21 != 0u)&1))) {
  _52 = *((&llvm_cbe_hit[((int64_t)2)]));
  _53 = *((&(*((&llvm_cbe_face->field0))).array[((int64_t)0)]));
  _54 = *((&_53[((int64_t)2)]));
  _55 = *((&(*((&llvm_cbe_face->field0))).array[((int64_t)2)]));
  _56 = *((&_55[((int64_t)2)]));
  llvm_cbe_call30 = in_range(_52, _54, _56);
  _57__PHI_TEMPORARY = (((llvm_cbe_call30 != 0u)&1));   /* for PHI node */

}
  _57 = ((_57__PHI_TEMPORARY)&1);
  llvm_cbe_land_2e_ext = ((uint32_t)(bool)_57);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_land_2e_ext;   /* for PHI node */

  } else {
  _58 = *((&(*((&llvm_cbe_face->field1))).array[((int64_t)1)]));
  if ((((llvm_fcmp_une(_58, 0))&1))) {
  _59 = *((&(*llvm_cbe_hit)));
  _60 = *((&(*((&llvm_cbe_face->field0))).array[((int64_t)0)]));
  _61 = *((&(*_60)));
  _62 = *((&(*((&llvm_cbe_face->field0))).array[((int64_t)2)]));
  _63 = *((&(*_62)));
  llvm_cbe_call43 = in_range(_59, _61, _63);
  if (!(((llvm_cbe_call43 != 0u)&1))) {
  _64 = *((&llvm_cbe_hit[((int64_t)2)]));
  _65 = *((&(*((&llvm_cbe_face->field0))).array[((int64_t)0)]));
  _66 = *((&_65[((int64_t)2)]));
  _67 = *((&(*((&llvm_cbe_face->field0))).array[((int64_t)2)]));
  _68 = *((&_67[((int64_t)2)]));
  llvm_cbe_call53 = in_range(_64, _66, _68);
  _69__PHI_TEMPORARY = (((llvm_cbe_call53 != 0u)&1));   /* for PHI node */

}
  _69 = ((_69__PHI_TEMPORARY)&1);
  llvm_cbe_land_2e_ext56 = ((uint32_t)(bool)_69);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_land_2e_ext56;   /* for PHI node */

  } else {
  _70 = *((&(*((&llvm_cbe_face->field1))).array[((int64_t)2)]));
  if ((((llvm_fcmp_une(_70, 0))&1))) {
  _71 = *((&(*llvm_cbe_hit)));
  _72 = *((&(*((&llvm_cbe_face->field0))).array[((int64_t)0)]));
  _73 = *((&(*_72)));
  _74 = *((&(*((&llvm_cbe_face->field0))).array[((int64_t)2)]));
  _75 = *((&(*_74)));
  llvm_cbe_call69 = in_range(_71, _73, _75);
  if (!(((llvm_cbe_call69 != 0u)&1))) {
  _76 = *((&llvm_cbe_hit[((int64_t)1)]));
  _77 = *((&(*((&llvm_cbe_face->field0))).array[((int64_t)0)]));
  _78 = *((&_77[((int64_t)1)]));
  _79 = *((&(*((&llvm_cbe_face->field0))).array[((int64_t)2)]));
  _80 = *((&_79[((int64_t)1)]));
  llvm_cbe_call79 = in_range(_76, _78, _80);
  _81__PHI_TEMPORARY = (((llvm_cbe_call79 != 0u)&1));   /* for PHI node */

}
  _81 = ((_81__PHI_TEMPORARY)&1);
  llvm_cbe_land_2e_ext82 = ((uint32_t)(bool)_81);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_land_2e_ext82;   /* for PHI node */

  } else {


  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

}
}
}
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


int main(void) {
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_eye __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_dir __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_orig __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_hit __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_dx __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_dy __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_proj __attribute__((aligned(16)));    /* Address-exposed local */
  double llvm_cbe_d;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_light __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_ldist __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _82;
  uint8_t* _83;
  uint8_t* _84;
  uint8_t* _85;
  uint8_t* _86;
  double* llvm_cbe_call;
  double llvm_cbe_call3;
  double* llvm_cbe_call7;
  double llvm_cbe_call8;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  double* llvm_cbe_call18;
  double* llvm_cbe_call23;
  double dbest;
  double dbest__PHI_TEMPORARY;
  double* norm;
  double* norm__PHI_TEMPORARY;
  uint32_t k;
  uint32_t k__PHI_TEMPORARY;
  uint32_t llvm_cbe_call34;
  double _87;
  uint32_t llvm_cbe_call43;
  double decay;
  double llvm_cbe_call51;
  double b;
  double b__PHI_TEMPORARY;
  uint8_t* _88;
  uint8_t _89;
  uint32_t llvm_cbe_call71;
  uint32_t llvm_cbe_call75;

  ;
  _82 = memcpy((((uint8_t*)(&llvm_cbe_eye))), ((uint8_t*)(&__const_OC_main_OC_eye)), 24);
  ;
  _83 = memcpy((((uint8_t*)(&llvm_cbe_dir))), ((uint8_t*)(&__const_OC_main_OC_dir)), 24);
  ;
  _84 = memset((((uint8_t*)(&llvm_cbe_orig))), 0, 24);
  ;
  ;
  ;
  _85 = memcpy((((uint8_t*)(&llvm_cbe_dy))), ((uint8_t*)(&__const_OC_main_OC_dy)), 24);
  ;
  ;
  ;
  _86 = memcpy((((uint8_t*)(&llvm_cbe_light))), ((uint8_t*)(&__const_OC_main_OC_light)), 24);
  ;
  ;
  llvm_cbe_call = cross(((&llvm_cbe_eye.array[((int64_t)0)])), ((&llvm_cbe_dy.array[((int64_t)0)])), ((&llvm_cbe_dx.array[((int64_t)0)])));
  llvm_cbe_call3 = normalize(llvm_cbe_call);
  llvm_cbe_call7 = cross(((&llvm_cbe_eye.array[((int64_t)0)])), ((&llvm_cbe_dx.array[((int64_t)0)])), ((&llvm_cbe_dy.array[((int64_t)0)])));
  llvm_cbe_call8 = normalize(llvm_cbe_call7);
  ;
  i__PHI_TEMPORARY = -10;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) <= ((int32_t)17u)){
  ;
  j__PHI_TEMPORARY = -35;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
while (((int32_t)j) < ((int32_t)35u)){
  vsub(((&llvm_cbe_orig.array[((int64_t)0)])), ((&llvm_cbe_orig.array[((int64_t)0)])), ((&llvm_cbe_proj.array[((int64_t)0)])));
  llvm_cbe_call18 = madd(((&llvm_cbe_proj.array[((int64_t)0)])), ((&llvm_cbe_dx.array[((int64_t)0)])), ((((double)(int32_t)j)) / 6), ((&llvm_cbe_proj.array[((int64_t)0)])));
  llvm_cbe_call23 = madd(llvm_cbe_call18, ((&llvm_cbe_dy.array[((int64_t)0)])), ((((double)(int32_t)i)) / 3), ((&llvm_cbe_proj.array[((int64_t)0)])));
  vsub(((&llvm_cbe_proj.array[((int64_t)0)])), ((&llvm_cbe_eye.array[((int64_t)0)])), ((&llvm_cbe_dir.array[((int64_t)0)])));
  ;
  ;
  ;
  dbest__PHI_TEMPORARY = 1.0E+100;   /* for PHI node */
  norm__PHI_TEMPORARY = ((double*)/*NULL*/0);   /* for PHI node */
  k__PHI_TEMPORARY = 0;   /* for PHI node */

  dbest = dbest__PHI_TEMPORARY;
  norm = norm__PHI_TEMPORARY;
  k = k__PHI_TEMPORARY;
  ;
  ;
  ;
while (((int32_t)k) < ((int32_t)6u)){
  llvm_cbe_call34 = face_hit(((&((&f.array[((int64_t)0)]))[((int64_t)(((int64_t)(int32_t)k)))])), ((&llvm_cbe_eye.array[((int64_t)0)])), ((&llvm_cbe_dir.array[((int64_t)0)])), ((&llvm_cbe_hit.array[((int64_t)0)])), (&llvm_cbe_d));
  if ((((llvm_cbe_call34 != 0u)&1))) {
  _87 = llvm_cbe_d;
  if ((((llvm_fcmp_ogt(dbest, _87))&1))) {
  dbest = llvm_cbe_d;
  ;
  norm = (&(*((&((&f.array[((int64_t)(((int64_t)(int32_t)k)))]))->field1))).array[((int64_t)0)]);
  ;
  dbest__PHI_TEMPORARY = dbest;   /* for PHI node */
  norm__PHI_TEMPORARY = norm;   /* for PHI node */

}
  dbest = dbest__PHI_TEMPORARY;
  norm = norm__PHI_TEMPORARY;
  ;
  ;
  dbest__PHI_TEMPORARY = dbest;   /* for PHI node */
  norm__PHI_TEMPORARY = norm;   /* for PHI node */

  } else {
  dbest__PHI_TEMPORARY = dbest;   /* for PHI node */
  norm__PHI_TEMPORARY = norm;   /* for PHI node */

}
  dbest = dbest__PHI_TEMPORARY;
  norm = norm__PHI_TEMPORARY;
  ;
  ;
  k = llvm_add_u32(k, 1);
  ;
  dbest__PHI_TEMPORARY = dbest;   /* for PHI node */
  norm__PHI_TEMPORARY = norm;   /* for PHI node */
  k__PHI_TEMPORARY = k;   /* for PHI node */

  dbest = dbest__PHI_TEMPORARY;
  norm = norm__PHI_TEMPORARY;
  k = k__PHI_TEMPORARY;
  ;
  ;
  ;
}
  if ((((norm != ((double*)/*NULL*/0))&1))) {
  vsub(((&llvm_cbe_light.array[((int64_t)0)])), ((&llvm_cbe_hit.array[((int64_t)0)])), ((&llvm_cbe_ldist.array[((int64_t)0)])));
  decay = normalize(((&llvm_cbe_ldist.array[((int64_t)0)])));
  ;
  llvm_cbe_call51 = dot(norm, ((&llvm_cbe_ldist.array[((int64_t)0)])));
  b = (llvm_cbe_call51 / decay) * 10;
  ;
  if ((((llvm_fcmp_olt(b, 0))&1))) {
  ;
  b__PHI_TEMPORARY = 0;   /* for PHI node */

  } else {
  if ((((llvm_fcmp_ogt(b, 1))&1))) {
  ;
  b__PHI_TEMPORARY = 1;   /* for PHI node */

}
  b = b__PHI_TEMPORARY;
  ;
  b__PHI_TEMPORARY = b;   /* for PHI node */

}
  } else {
  llvm_cbe_call43 = putchar(32);

}
  b = b__PHI_TEMPORARY;
  ;
  b = b + 0.20000000000000001;
  ;
  if ((((llvm_fcmp_ogt(b, 1))&1))) {
  ;
  b__PHI_TEMPORARY = 0;   /* for PHI node */

  } else {
  b = 1 - b;
  ;
  b__PHI_TEMPORARY = b;   /* for PHI node */

}
  b = b__PHI_TEMPORARY;
  ;
  _88 = shades;
  _89 = *((&_88[((int64_t)(((int64_t)(int32_t)(((int32_t)(b * 6))))))]));
  llvm_cbe_call71 = putchar((((int32_t)(int8_t)_89)));

  j = llvm_add_u32(j, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
}
  llvm_cbe_call75 = putchar(10);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return 0;
}

