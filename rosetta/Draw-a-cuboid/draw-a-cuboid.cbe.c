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
struct l_array_11_uint8_t {
  uint8_t array[11];
};
struct l_array_3_double {
  double array[3];
};
struct l_array_4_double_KC_ {
  double* array[4];
};
struct l_struct_struct_OC_face_t {
  struct l_array_4_double_KC_ field0;
  struct l_array_3_double field1;
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
  double* llvm_cbe_v1_2e_addr;    /* Address-exposed local */
  double* llvm_cbe_v2_2e_addr;    /* Address-exposed local */
  double* llvm_cbe_s_2e_addr;    /* Address-exposed local */
  double* _1;
  double _2;
  double* _3;
  double _4;
  double* _5;
  double* _6;
  double _7;
  double* _8;
  double _9;
  double* _10;
  double* _11;
  double _12;
  double* _13;
  double _14;
  double* _15;

  llvm_cbe_v1_2e_addr = llvm_cbe_v1;
  ;
  llvm_cbe_v2_2e_addr = llvm_cbe_v2;
  ;
  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  _1 = llvm_cbe_v1_2e_addr;
  _2 = *((&(*_1)));
  _3 = llvm_cbe_v2_2e_addr;
  _4 = *((&(*_3)));
  _5 = llvm_cbe_s_2e_addr;
  *((&(*_5))) = (_2 - _4);
  _6 = llvm_cbe_v1_2e_addr;
  _7 = *((&_6[((int64_t)1)]));
  _8 = llvm_cbe_v2_2e_addr;
  _9 = *((&_8[((int64_t)1)]));
  _10 = llvm_cbe_s_2e_addr;
  *((&_10[((int64_t)1)])) = (_7 - _9);
  _11 = llvm_cbe_v1_2e_addr;
  _12 = *((&_11[((int64_t)2)]));
  _13 = llvm_cbe_v2_2e_addr;
  _14 = *((&_13[((int64_t)2)]));
  _15 = llvm_cbe_s_2e_addr;
  *((&_15[((int64_t)2)])) = (_12 - _14);
}


double normalize(double* llvm_cbe_v) {
  double* llvm_cbe_v_2e_addr;    /* Address-exposed local */
  double llvm_cbe_len;    /* Address-exposed local */
  double* _16;
  double _17;
  double* _18;
  double _19;
  double* _20;
  double _21;
  double* _22;
  double _23;
  double* _24;
  double _25;
  double* _26;
  double _27;
  double llvm_cbe_call;
  double _28;
  double* _29;
  double* llvm_cbe_arrayidx9;
  double _30;
  double _31;
  double* _32;
  double* llvm_cbe_arrayidx10;
  double _33;
  double _34;
  double* _35;
  double* llvm_cbe_arrayidx12;
  double _36;
  double _37;

  llvm_cbe_v_2e_addr = llvm_cbe_v;
  ;
  ;
  _16 = llvm_cbe_v_2e_addr;
  _17 = *((&(*_16)));
  _18 = llvm_cbe_v_2e_addr;
  _19 = *((&(*_18)));
  _20 = llvm_cbe_v_2e_addr;
  _21 = *((&_20[((int64_t)1)]));
  _22 = llvm_cbe_v_2e_addr;
  _23 = *((&_22[((int64_t)1)]));
  _24 = llvm_cbe_v_2e_addr;
  _25 = *((&_24[((int64_t)2)]));
  _26 = llvm_cbe_v_2e_addr;
  _27 = *((&_26[((int64_t)2)]));
  llvm_cbe_call = sqrt((((_17 * _19) + (_21 * _23)) + (_25 * _27)));
  llvm_cbe_len = llvm_cbe_call;
  _28 = llvm_cbe_len;
  _29 = llvm_cbe_v_2e_addr;
  llvm_cbe_arrayidx9 = (&(*_29));
  _30 = *llvm_cbe_arrayidx9;
  *llvm_cbe_arrayidx9 = (_30 / _28);
  _31 = llvm_cbe_len;
  _32 = llvm_cbe_v_2e_addr;
  llvm_cbe_arrayidx10 = (&_32[((int64_t)1)]);
  _33 = *llvm_cbe_arrayidx10;
  *llvm_cbe_arrayidx10 = (_33 / _31);
  _34 = llvm_cbe_len;
  _35 = llvm_cbe_v_2e_addr;
  llvm_cbe_arrayidx12 = (&_35[((int64_t)2)]);
  _36 = *llvm_cbe_arrayidx12;
  *llvm_cbe_arrayidx12 = (_36 / _34);
  _37 = llvm_cbe_len;
  return _37;
}


double dot(double* llvm_cbe_x, double* llvm_cbe_y) {
  double* llvm_cbe_x_2e_addr;    /* Address-exposed local */
  double* llvm_cbe_y_2e_addr;    /* Address-exposed local */
  double* _38;
  double _39;
  double* _40;
  double _41;
  double* _42;
  double _43;
  double* _44;
  double _45;
  double* _46;
  double _47;
  double* _48;
  double _49;

  llvm_cbe_x_2e_addr = llvm_cbe_x;
  ;
  llvm_cbe_y_2e_addr = llvm_cbe_y;
  ;
  _38 = llvm_cbe_x_2e_addr;
  _39 = *((&(*_38)));
  _40 = llvm_cbe_y_2e_addr;
  _41 = *((&(*_40)));
  _42 = llvm_cbe_x_2e_addr;
  _43 = *((&_42[((int64_t)1)]));
  _44 = llvm_cbe_y_2e_addr;
  _45 = *((&_44[((int64_t)1)]));
  _46 = llvm_cbe_x_2e_addr;
  _47 = *((&_46[((int64_t)2)]));
  _48 = llvm_cbe_y_2e_addr;
  _49 = *((&_48[((int64_t)2)]));
  return (((_39 * _41) + (_43 * _45)) + (_47 * _49));
}


double* cross(double* llvm_cbe_x, double* llvm_cbe_y, double* llvm_cbe_s) {
  double* llvm_cbe_x_2e_addr;    /* Address-exposed local */
  double* llvm_cbe_y_2e_addr;    /* Address-exposed local */
  double* llvm_cbe_s_2e_addr;    /* Address-exposed local */
  double* _50;
  double _51;
  double* _52;
  double _53;
  double* _54;
  double _55;
  double* _56;
  double _57;
  double* _58;
  double* _59;
  double _60;
  double* _61;
  double _62;
  double* _63;
  double _64;
  double* _65;
  double _66;
  double* _67;
  double* _68;
  double _69;
  double* _70;
  double _71;
  double* _72;
  double _73;
  double* _74;
  double _75;
  double* _76;
  double* _77;

  llvm_cbe_x_2e_addr = llvm_cbe_x;
  ;
  llvm_cbe_y_2e_addr = llvm_cbe_y;
  ;
  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  _50 = llvm_cbe_x_2e_addr;
  _51 = *((&_50[((int64_t)1)]));
  _52 = llvm_cbe_y_2e_addr;
  _53 = *((&_52[((int64_t)2)]));
  _54 = llvm_cbe_x_2e_addr;
  _55 = *((&_54[((int64_t)2)]));
  _56 = llvm_cbe_y_2e_addr;
  _57 = *((&_56[((int64_t)1)]));
  _58 = llvm_cbe_s_2e_addr;
  *((&(*_58))) = ((_51 * _53) - (_55 * _57));
  _59 = llvm_cbe_x_2e_addr;
  _60 = *((&_59[((int64_t)2)]));
  _61 = llvm_cbe_y_2e_addr;
  _62 = *((&(*_61)));
  _63 = llvm_cbe_x_2e_addr;
  _64 = *((&(*_63)));
  _65 = llvm_cbe_y_2e_addr;
  _66 = *((&_65[((int64_t)2)]));
  _67 = llvm_cbe_s_2e_addr;
  *((&_67[((int64_t)1)])) = ((_60 * _62) - (_64 * _66));
  _68 = llvm_cbe_x_2e_addr;
  _69 = *((&(*_68)));
  _70 = llvm_cbe_y_2e_addr;
  _71 = *((&_70[((int64_t)1)]));
  _72 = llvm_cbe_x_2e_addr;
  _73 = *((&_72[((int64_t)1)]));
  _74 = llvm_cbe_y_2e_addr;
  _75 = *((&(*_74)));
  _76 = llvm_cbe_s_2e_addr;
  *((&_76[((int64_t)2)])) = ((_69 * _71) - (_73 * _75));
  _77 = llvm_cbe_s_2e_addr;
  return _77;
}


double* madd(double* llvm_cbe_x, double* llvm_cbe_y, double llvm_cbe_d, double* llvm_cbe_r) {
  double* llvm_cbe_x_2e_addr;    /* Address-exposed local */
  double* llvm_cbe_y_2e_addr;    /* Address-exposed local */
  double llvm_cbe_d_2e_addr;    /* Address-exposed local */
  double* llvm_cbe_r_2e_addr;    /* Address-exposed local */
  double* _78;
  double _79;
  double* _80;
  double _81;
  double _82;
  double* _83;
  double* _84;
  double _85;
  double* _86;
  double _87;
  double _88;
  double* _89;
  double* _90;
  double _91;
  double* _92;
  double _93;
  double _94;
  double* _95;
  double* _96;

  llvm_cbe_x_2e_addr = llvm_cbe_x;
  ;
  llvm_cbe_y_2e_addr = llvm_cbe_y;
  ;
  llvm_cbe_d_2e_addr = llvm_cbe_d;
  ;
  llvm_cbe_r_2e_addr = llvm_cbe_r;
  ;
  _78 = llvm_cbe_x_2e_addr;
  _79 = *((&(*_78)));
  _80 = llvm_cbe_y_2e_addr;
  _81 = *((&(*_80)));
  _82 = llvm_cbe_d_2e_addr;
  _83 = llvm_cbe_r_2e_addr;
  *((&(*_83))) = (_79 + (_81 * _82));
  _84 = llvm_cbe_x_2e_addr;
  _85 = *((&_84[((int64_t)1)]));
  _86 = llvm_cbe_y_2e_addr;
  _87 = *((&_86[((int64_t)1)]));
  _88 = llvm_cbe_d_2e_addr;
  _89 = llvm_cbe_r_2e_addr;
  *((&_89[((int64_t)1)])) = (_85 + (_87 * _88));
  _90 = llvm_cbe_x_2e_addr;
  _91 = *((&_90[((int64_t)2)]));
  _92 = llvm_cbe_y_2e_addr;
  _93 = *((&_92[((int64_t)2)]));
  _94 = llvm_cbe_d_2e_addr;
  _95 = llvm_cbe_r_2e_addr;
  *((&_95[((int64_t)2)])) = (_91 + (_93 * _94));
  _96 = llvm_cbe_r_2e_addr;
  return _96;
}


uint32_t in_range(double llvm_cbe_x, double llvm_cbe_x0, double llvm_cbe_x1) {
  double llvm_cbe_x_2e_addr;    /* Address-exposed local */
  double llvm_cbe_x0_2e_addr;    /* Address-exposed local */
  double llvm_cbe_x1_2e_addr;    /* Address-exposed local */
  double _97;
  double _98;
  double _99;
  double _100;

  llvm_cbe_x_2e_addr = llvm_cbe_x;
  ;
  llvm_cbe_x0_2e_addr = llvm_cbe_x0;
  ;
  llvm_cbe_x1_2e_addr = llvm_cbe_x1;
  ;
  _97 = llvm_cbe_x_2e_addr;
  _98 = llvm_cbe_x0_2e_addr;
  _99 = llvm_cbe_x_2e_addr;
  _100 = llvm_cbe_x1_2e_addr;
  return (((uint32_t)(bool)(((llvm_fcmp_ole(((_97 - _98) * (_99 - _100)), 0))&1))));
}


uint32_t face_hit(struct l_struct_struct_OC_face_t* llvm_cbe_face, double* llvm_cbe_src, double* llvm_cbe_dir, double* llvm_cbe_hit, double* llvm_cbe_d) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  struct l_struct_struct_OC_face_t* llvm_cbe_face_2e_addr;    /* Address-exposed local */
  double* llvm_cbe_src_2e_addr;    /* Address-exposed local */
  double* llvm_cbe_dir_2e_addr;    /* Address-exposed local */
  double* llvm_cbe_hit_2e_addr;    /* Address-exposed local */
  double* llvm_cbe_d_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  double llvm_cbe_dist;    /* Address-exposed local */
  uint32_t _101;
  struct l_struct_struct_OC_face_t* _102;
  uint32_t _103;
  double _104;
  struct l_struct_struct_OC_face_t* _105;
  double* _106;
  uint32_t _107;
  double _108;
  double* _109;
  uint32_t _110;
  double _111;
  double* _112;
  uint32_t _113;
  double _114;
  uint32_t _115;
  double* _116;
  double* _117;
  double _118;
  double* _119;
  double* llvm_cbe_call;
  double* _120;
  struct l_struct_struct_OC_face_t* _121;
  double llvm_cbe_call9;
  double _122;
  double _123;
  double* _124;
  struct l_struct_struct_OC_face_t* _125;
  double _126;
  double* _127;
  double _128;
  struct l_struct_struct_OC_face_t* _129;
  double* _130;
  double _131;
  struct l_struct_struct_OC_face_t* _132;
  double* _133;
  double _134;
  uint32_t llvm_cbe_call21;
  double* _135;
  double _136;
  struct l_struct_struct_OC_face_t* _137;
  double* _138;
  double _139;
  struct l_struct_struct_OC_face_t* _140;
  double* _141;
  double _142;
  uint32_t llvm_cbe_call30;
  bool _143;
  bool _143__PHI_TEMPORARY;
  struct l_struct_struct_OC_face_t* _144;
  double _145;
  double* _146;
  double _147;
  struct l_struct_struct_OC_face_t* _148;
  double* _149;
  double _150;
  struct l_struct_struct_OC_face_t* _151;
  double* _152;
  double _153;
  uint32_t llvm_cbe_call43;
  double* _154;
  double _155;
  struct l_struct_struct_OC_face_t* _156;
  double* _157;
  double _158;
  struct l_struct_struct_OC_face_t* _159;
  double* _160;
  double _161;
  uint32_t llvm_cbe_call53;
  bool _162;
  bool _162__PHI_TEMPORARY;
  struct l_struct_struct_OC_face_t* _163;
  double _164;
  double* _165;
  double _166;
  struct l_struct_struct_OC_face_t* _167;
  double* _168;
  double _169;
  struct l_struct_struct_OC_face_t* _170;
  double* _171;
  double _172;
  uint32_t llvm_cbe_call69;
  double* _173;
  double _174;
  struct l_struct_struct_OC_face_t* _175;
  double* _176;
  double _177;
  struct l_struct_struct_OC_face_t* _178;
  double* _179;
  double _180;
  uint32_t llvm_cbe_call79;
  bool _181;
  bool _181__PHI_TEMPORARY;
  uint32_t _182;

  llvm_cbe_face_2e_addr = llvm_cbe_face;
  ;
  llvm_cbe_src_2e_addr = llvm_cbe_src;
  ;
  llvm_cbe_dir_2e_addr = llvm_cbe_dir;
  ;
  llvm_cbe_hit_2e_addr = llvm_cbe_hit;
  ;
  llvm_cbe_d_2e_addr = llvm_cbe_d;
  ;
  ;
  ;
  llvm_cbe_i = 0;

  _101 = llvm_cbe_i;
while (((int32_t)_101) < ((int32_t)3u)){
  _102 = llvm_cbe_face_2e_addr;
  _103 = llvm_cbe_i;
  _104 = *((&(*((&_102->field1))).array[((int64_t)(((int64_t)(int32_t)_103)))]));
  if ((((llvm_fcmp_une(_104, 0))&1))) {
  _105 = llvm_cbe_face_2e_addr;
  _106 = *((&(*((&_105->field0))).array[((int64_t)0)]));
  _107 = llvm_cbe_i;
  _108 = *((&_106[((int64_t)(((int64_t)(int32_t)_107)))]));
  _109 = llvm_cbe_src_2e_addr;
  _110 = llvm_cbe_i;
  _111 = *((&_109[((int64_t)(((int64_t)(int32_t)_110)))]));
  _112 = llvm_cbe_dir_2e_addr;
  _113 = llvm_cbe_i;
  _114 = *((&_112[((int64_t)(((int64_t)(int32_t)_113)))]));
  llvm_cbe_dist = ((_108 - _111) / _114);

}

  _115 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_115, 1));

  _101 = llvm_cbe_i;
}
  _116 = llvm_cbe_src_2e_addr;
  _117 = llvm_cbe_dir_2e_addr;
  _118 = llvm_cbe_dist;
  _119 = llvm_cbe_hit_2e_addr;
  llvm_cbe_call = madd(_116, _117, _118, _119);
  _120 = llvm_cbe_dir_2e_addr;
  _121 = llvm_cbe_face_2e_addr;
  llvm_cbe_call9 = dot(_120, ((&(*((&_121->field1))).array[((int64_t)0)])));
  _122 = llvm_cbe_dist;
  _123 = llvm_OC_fabs_OC_f64((llvm_cbe_call9 * _122));
  _124 = llvm_cbe_d_2e_addr;
  *_124 = _123;
  _125 = llvm_cbe_face_2e_addr;
  _126 = *((&(*((&_125->field1))).array[((int64_t)0)]));
  if ((((llvm_fcmp_une(_126, 0))&1))) {
  _127 = llvm_cbe_hit_2e_addr;
  _128 = *((&_127[((int64_t)1)]));
  _129 = llvm_cbe_face_2e_addr;
  _130 = *((&(*((&_129->field0))).array[((int64_t)0)]));
  _131 = *((&_130[((int64_t)1)]));
  _132 = llvm_cbe_face_2e_addr;
  _133 = *((&(*((&_132->field0))).array[((int64_t)2)]));
  _134 = *((&_133[((int64_t)1)]));
  llvm_cbe_call21 = in_range(_128, _131, _134);
  if (!(((llvm_cbe_call21 != 0u)&1))) {
  _135 = llvm_cbe_hit_2e_addr;
  _136 = *((&_135[((int64_t)2)]));
  _137 = llvm_cbe_face_2e_addr;
  _138 = *((&(*((&_137->field0))).array[((int64_t)0)]));
  _139 = *((&_138[((int64_t)2)]));
  _140 = llvm_cbe_face_2e_addr;
  _141 = *((&(*((&_140->field0))).array[((int64_t)2)]));
  _142 = *((&_141[((int64_t)2)]));
  llvm_cbe_call30 = in_range(_136, _139, _142);
  _143__PHI_TEMPORARY = (((llvm_cbe_call30 != 0u)&1));   /* for PHI node */

}
  _143 = ((_143__PHI_TEMPORARY)&1);
  llvm_cbe_retval = (((uint32_t)(bool)_143));

  } else {
  _144 = llvm_cbe_face_2e_addr;
  _145 = *((&(*((&_144->field1))).array[((int64_t)1)]));
  if ((((llvm_fcmp_une(_145, 0))&1))) {
  _146 = llvm_cbe_hit_2e_addr;
  _147 = *((&(*_146)));
  _148 = llvm_cbe_face_2e_addr;
  _149 = *((&(*((&_148->field0))).array[((int64_t)0)]));
  _150 = *((&(*_149)));
  _151 = llvm_cbe_face_2e_addr;
  _152 = *((&(*((&_151->field0))).array[((int64_t)2)]));
  _153 = *((&(*_152)));
  llvm_cbe_call43 = in_range(_147, _150, _153);
  if (!(((llvm_cbe_call43 != 0u)&1))) {
  _154 = llvm_cbe_hit_2e_addr;
  _155 = *((&_154[((int64_t)2)]));
  _156 = llvm_cbe_face_2e_addr;
  _157 = *((&(*((&_156->field0))).array[((int64_t)0)]));
  _158 = *((&_157[((int64_t)2)]));
  _159 = llvm_cbe_face_2e_addr;
  _160 = *((&(*((&_159->field0))).array[((int64_t)2)]));
  _161 = *((&_160[((int64_t)2)]));
  llvm_cbe_call53 = in_range(_155, _158, _161);
  _162__PHI_TEMPORARY = (((llvm_cbe_call53 != 0u)&1));   /* for PHI node */

}
  _162 = ((_162__PHI_TEMPORARY)&1);
  llvm_cbe_retval = (((uint32_t)(bool)_162));

  } else {
  _163 = llvm_cbe_face_2e_addr;
  _164 = *((&(*((&_163->field1))).array[((int64_t)2)]));
  if ((((llvm_fcmp_une(_164, 0))&1))) {
  _165 = llvm_cbe_hit_2e_addr;
  _166 = *((&(*_165)));
  _167 = llvm_cbe_face_2e_addr;
  _168 = *((&(*((&_167->field0))).array[((int64_t)0)]));
  _169 = *((&(*_168)));
  _170 = llvm_cbe_face_2e_addr;
  _171 = *((&(*((&_170->field0))).array[((int64_t)2)]));
  _172 = *((&(*_171)));
  llvm_cbe_call69 = in_range(_166, _169, _172);
  if (!(((llvm_cbe_call69 != 0u)&1))) {
  _173 = llvm_cbe_hit_2e_addr;
  _174 = *((&_173[((int64_t)1)]));
  _175 = llvm_cbe_face_2e_addr;
  _176 = *((&(*((&_175->field0))).array[((int64_t)0)]));
  _177 = *((&_176[((int64_t)1)]));
  _178 = llvm_cbe_face_2e_addr;
  _179 = *((&(*((&_178->field0))).array[((int64_t)2)]));
  _180 = *((&_179[((int64_t)1)]));
  llvm_cbe_call79 = in_range(_174, _177, _180);
  _181__PHI_TEMPORARY = (((llvm_cbe_call79 != 0u)&1));   /* for PHI node */

}
  _181 = ((_181__PHI_TEMPORARY)&1);
  llvm_cbe_retval = (((uint32_t)(bool)_181));

  } else {


  llvm_cbe_retval = 0;

}
}
}
  _182 = llvm_cbe_retval;
  return _182;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint32_t llvm_cbe_k;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_eye __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_dir __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_orig __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_hit __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_dx __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_dy __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_proj __attribute__((aligned(16)));    /* Address-exposed local */
  double llvm_cbe_d;    /* Address-exposed local */
  double* llvm_cbe_norm;    /* Address-exposed local */
  double llvm_cbe_dbest;    /* Address-exposed local */
  double llvm_cbe_b;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_light __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_ldist __attribute__((aligned(16)));    /* Address-exposed local */
  double llvm_cbe_decay;    /* Address-exposed local */
  double llvm_cbe_strength;    /* Address-exposed local */
  uint8_t* _183;
  uint8_t* _184;
  uint8_t* _185;
  uint8_t* _186;
  uint8_t* _187;
  double* llvm_cbe_call;
  double llvm_cbe_call3;
  double* llvm_cbe_call7;
  double llvm_cbe_call8;
  uint32_t _188;
  uint32_t _189;
  uint32_t _190;
  double* llvm_cbe_call18;
  uint32_t _191;
  double* llvm_cbe_call23;
  uint32_t _192;
  uint32_t _193;
  uint32_t llvm_cbe_call34;
  double _194;
  double _195;
  double _196;
  uint32_t _197;
  uint32_t _198;
  double* _199;
  uint32_t llvm_cbe_call43;
  double llvm_cbe_call49;
  double* _200;
  double llvm_cbe_call51;
  double _201;
  double _202;
  double _203;
  double _204;
  double _205;
  double _206;
  double _207;
  uint8_t* _208;
  double _209;
  uint8_t _210;
  uint32_t llvm_cbe_call71;
  uint32_t _211;
  uint32_t llvm_cbe_call75;
  uint32_t _212;

  llvm_cbe_retval = 0;
  ;
  ;
  ;
  ;
  _183 = memcpy((((uint8_t*)(&llvm_cbe_eye))), ((uint8_t*)(&__const_OC_main_OC_eye)), 24);
  ;
  _184 = memcpy((((uint8_t*)(&llvm_cbe_dir))), ((uint8_t*)(&__const_OC_main_OC_dir)), 24);
  ;
  _185 = memset((((uint8_t*)(&llvm_cbe_orig))), 0, 24);
  ;
  ;
  ;
  _186 = memcpy((((uint8_t*)(&llvm_cbe_dy))), ((uint8_t*)(&__const_OC_main_OC_dy)), 24);
  ;
  ;
  ;
  ;
  ;
  ;
  _187 = memcpy((((uint8_t*)(&llvm_cbe_light))), ((uint8_t*)(&__const_OC_main_OC_light)), 24);
  ;
  ;
  ;
  llvm_cbe_strength = 10;
  llvm_cbe_call = cross(((&llvm_cbe_eye.array[((int64_t)0)])), ((&llvm_cbe_dy.array[((int64_t)0)])), ((&llvm_cbe_dx.array[((int64_t)0)])));
  llvm_cbe_call3 = normalize(llvm_cbe_call);
  llvm_cbe_call7 = cross(((&llvm_cbe_eye.array[((int64_t)0)])), ((&llvm_cbe_dx.array[((int64_t)0)])), ((&llvm_cbe_dy.array[((int64_t)0)])));
  llvm_cbe_call8 = normalize(llvm_cbe_call7);
  llvm_cbe_i = -10;

  _188 = llvm_cbe_i;
while (((int32_t)_188) <= ((int32_t)17u)){
  llvm_cbe_j = -35;

  _189 = llvm_cbe_j;
while (((int32_t)_189) < ((int32_t)35u)){
  vsub(((&llvm_cbe_orig.array[((int64_t)0)])), ((&llvm_cbe_orig.array[((int64_t)0)])), ((&llvm_cbe_proj.array[((int64_t)0)])));
  _190 = llvm_cbe_j;
  llvm_cbe_call18 = madd(((&llvm_cbe_proj.array[((int64_t)0)])), ((&llvm_cbe_dx.array[((int64_t)0)])), ((((double)(int32_t)_190)) / 6), ((&llvm_cbe_proj.array[((int64_t)0)])));
  _191 = llvm_cbe_i;
  llvm_cbe_call23 = madd(llvm_cbe_call18, ((&llvm_cbe_dy.array[((int64_t)0)])), ((((double)(int32_t)_191)) / 3), ((&llvm_cbe_proj.array[((int64_t)0)])));
  vsub(((&llvm_cbe_proj.array[((int64_t)0)])), ((&llvm_cbe_eye.array[((int64_t)0)])), ((&llvm_cbe_dir.array[((int64_t)0)])));
  llvm_cbe_dbest = 1.0E+100;
  llvm_cbe_norm = ((double*)/*NULL*/0);
  llvm_cbe_k = 0;

  _192 = llvm_cbe_k;
while (((int32_t)_192) < ((int32_t)6u)){
  _193 = llvm_cbe_k;
  llvm_cbe_call34 = face_hit(((&((&f.array[((int64_t)0)]))[((int64_t)(((int64_t)(int32_t)_193)))])), ((&llvm_cbe_eye.array[((int64_t)0)])), ((&llvm_cbe_dir.array[((int64_t)0)])), ((&llvm_cbe_hit.array[((int64_t)0)])), (&llvm_cbe_d));
  if ((((llvm_cbe_call34 != 0u)&1))) {
  _194 = llvm_cbe_dbest;
  _195 = llvm_cbe_d;
  if ((((llvm_fcmp_ogt(_194, _195))&1))) {
  _196 = llvm_cbe_d;
  llvm_cbe_dbest = _196;
  _197 = llvm_cbe_k;
  llvm_cbe_norm = ((&(*((&((&f.array[((int64_t)(((int64_t)(int32_t)_197)))]))->field1))).array[((int64_t)0)]));

}

  } else {

}
  _198 = llvm_cbe_k;
  llvm_cbe_k = (llvm_add_u32(_198, 1));

  _192 = llvm_cbe_k;
}
  _199 = llvm_cbe_norm;
  if ((((_199 != ((double*)/*NULL*/0))&1))) {
  vsub(((&llvm_cbe_light.array[((int64_t)0)])), ((&llvm_cbe_hit.array[((int64_t)0)])), ((&llvm_cbe_ldist.array[((int64_t)0)])));
  llvm_cbe_call49 = normalize(((&llvm_cbe_ldist.array[((int64_t)0)])));
  llvm_cbe_decay = llvm_cbe_call49;
  _200 = llvm_cbe_norm;
  llvm_cbe_call51 = dot(_200, ((&llvm_cbe_ldist.array[((int64_t)0)])));
  _201 = llvm_cbe_decay;
  _202 = llvm_cbe_strength;
  llvm_cbe_b = ((llvm_cbe_call51 / _201) * _202);
  _203 = llvm_cbe_b;
  if ((((llvm_fcmp_olt(_203, 0))&1))) {
  llvm_cbe_b = 0;

  } else {
  _204 = llvm_cbe_b;
  if ((((llvm_fcmp_ogt(_204, 1))&1))) {
  llvm_cbe_b = 1;

}

}
  } else {
  llvm_cbe_call43 = putchar(32);

}
  _205 = llvm_cbe_b;
  llvm_cbe_b = (_205 + 0.20000000000000001);
  _206 = llvm_cbe_b;
  if ((((llvm_fcmp_ogt(_206, 1))&1))) {
  llvm_cbe_b = 0;

  } else {
  _207 = llvm_cbe_b;
  llvm_cbe_b = (1 - _207);

}
  _208 = shades;
  _209 = llvm_cbe_b;
  _210 = *((&_208[((int64_t)(((int64_t)(int32_t)(((int32_t)(_209 * 6))))))]));
  llvm_cbe_call71 = putchar((((int32_t)(int8_t)_210)));

  _211 = llvm_cbe_j;
  llvm_cbe_j = (llvm_add_u32(_211, 1));

  _189 = llvm_cbe_j;
}
  llvm_cbe_call75 = putchar(10);

  _212 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_212, 1));

  _188 = llvm_cbe_i;
}
  return 0;
}

