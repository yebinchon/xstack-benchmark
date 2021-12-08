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
struct l_struct_struct_OC_Complex;
struct l_unnamed_1;

/* Function definitions */

/* Types Definitions */
struct l_array_9_uint8_t {
  uint8_t array[9];
};
struct l_struct_struct_OC_Complex {
  double field0;
  double field1;
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};
struct l_unnamed_1 {
  double field0;
  double field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
struct l_unnamed_1 add(double, double, double, double) __ATTRIBUTELIST__((noinline, nothrow));
struct l_unnamed_1 mult(double, double, double, double) __ATTRIBUTELIST__((noinline, nothrow));
struct l_unnamed_1 inv(double, double) __ATTRIBUTELIST__((noinline, nothrow));
struct l_unnamed_1 neg(double, double) __ATTRIBUTELIST__((noinline, nothrow));
struct l_unnamed_1 conj(double, double) __ATTRIBUTELIST__((noinline, nothrow));
void put(double, double) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
void complex_ops(void) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_9_uint8_t _OC_str = { "%lf%+lfI" };
static struct l_struct_struct_OC_Complex __const_OC_complex_ops_OC_a = { 1, 1 };
static struct l_struct_struct_OC_Complex __const_OC_complex_ops_OC_b = { 3.1415899999999999, 1.2 };
static struct l_array_4_uint8_t _OC_str_OC_1 = { "\na=" };
static struct l_array_4_uint8_t _OC_str_OC_2 = { "\nb=" };
static struct l_array_6_uint8_t _OC_str_OC_3 = { "\na+b=" };
static struct l_array_6_uint8_t _OC_str_OC_4 = { "\na*b=" };
static struct l_array_6_uint8_t _OC_str_OC_5 = { "\n1/a=" };
static struct l_array_5_uint8_t _OC_str_OC_6 = { "\n-a=" };
static struct l_array_9_uint8_t _OC_str_OC_7 = { "\nconj a=" };
static struct l_array_2_uint8_t _OC_str_OC_8 = { "\n" };


/* LLVM Intrinsic Builtin Function Bodies */


/* Function Bodies */

struct l_unnamed_1 add(double llvm_cbe_a_2e_coerce0, double llvm_cbe_a_2e_coerce1, double llvm_cbe_b_2e_coerce0, double llvm_cbe_b_2e_coerce1) {
  struct l_struct_struct_OC_Complex llvm_cbe_retval;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_a;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_b;    /* Address-exposed local */
  struct l_unnamed_1* _1;
  struct l_unnamed_1* _2;
  double _3;
  double _4;
  double _5;
  double _6;
  struct l_unnamed_1 _7;

  _1 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  *((&_1->field0)) = llvm_cbe_a_2e_coerce0;
  *((&_1->field1)) = llvm_cbe_a_2e_coerce1;
  _2 = ((struct l_unnamed_1*)(&llvm_cbe_b));
  *((&_2->field0)) = llvm_cbe_b_2e_coerce0;
  *((&_2->field1)) = llvm_cbe_b_2e_coerce1;
  ;
  ;
  ;
  _3 = *((&llvm_cbe_a.field0));
  _4 = *((&llvm_cbe_b.field0));
  *((&llvm_cbe_retval.field0)) = (_3 + _4);
  _5 = *((&llvm_cbe_a.field1));
  _6 = *((&llvm_cbe_b.field1));
  *((&llvm_cbe_retval.field1)) = (_5 + _6);
  _7 = *(((struct l_unnamed_1*)(&llvm_cbe_retval)));
  return _7;
}


struct l_unnamed_1 mult(double llvm_cbe_a_2e_coerce0, double llvm_cbe_a_2e_coerce1, double llvm_cbe_b_2e_coerce0, double llvm_cbe_b_2e_coerce1) {
  struct l_struct_struct_OC_Complex llvm_cbe_retval;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_a;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_b;    /* Address-exposed local */
  struct l_unnamed_1* _8;
  struct l_unnamed_1* _9;
  double _10;
  double _11;
  double _12;
  double _13;
  double _14;
  double _15;
  double _16;
  double _17;
  struct l_unnamed_1 _18;

  _8 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  *((&_8->field0)) = llvm_cbe_a_2e_coerce0;
  *((&_8->field1)) = llvm_cbe_a_2e_coerce1;
  _9 = ((struct l_unnamed_1*)(&llvm_cbe_b));
  *((&_9->field0)) = llvm_cbe_b_2e_coerce0;
  *((&_9->field1)) = llvm_cbe_b_2e_coerce1;
  ;
  ;
  ;
  _10 = *((&llvm_cbe_a.field0));
  _11 = *((&llvm_cbe_b.field0));
  _12 = *((&llvm_cbe_a.field1));
  _13 = *((&llvm_cbe_b.field1));
  *((&llvm_cbe_retval.field0)) = ((_10 * _11) - (_12 * _13));
  _14 = *((&llvm_cbe_a.field0));
  _15 = *((&llvm_cbe_b.field1));
  _16 = *((&llvm_cbe_a.field1));
  _17 = *((&llvm_cbe_b.field0));
  *((&llvm_cbe_retval.field1)) = ((_14 * _15) + (_16 * _17));
  _18 = *(((struct l_unnamed_1*)(&llvm_cbe_retval)));
  return _18;
}


struct l_unnamed_1 inv(double llvm_cbe_a_2e_coerce0, double llvm_cbe_a_2e_coerce1) {
  struct l_struct_struct_OC_Complex llvm_cbe_retval;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_a;    /* Address-exposed local */
  double llvm_cbe_denom;    /* Address-exposed local */
  struct l_unnamed_1* _19;
  double _20;
  double _21;
  double _22;
  double _23;
  double _24;
  double _25;
  double _26;
  double _27;
  struct l_unnamed_1 _28;

  _19 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  *((&_19->field0)) = llvm_cbe_a_2e_coerce0;
  *((&_19->field1)) = llvm_cbe_a_2e_coerce1;
  ;
  ;
  ;
  _20 = *((&llvm_cbe_a.field0));
  _21 = *((&llvm_cbe_a.field0));
  _22 = *((&llvm_cbe_a.field1));
  _23 = *((&llvm_cbe_a.field1));
  llvm_cbe_denom = ((_20 * _21) + (_22 * _23));
  _24 = *((&llvm_cbe_a.field0));
  _25 = llvm_cbe_denom;
  *((&llvm_cbe_retval.field0)) = (_24 / _25);
  _26 = *((&llvm_cbe_a.field1));
  _27 = llvm_cbe_denom;
  *((&llvm_cbe_retval.field1)) = ((-(_26)) / _27);
  _28 = *(((struct l_unnamed_1*)(&llvm_cbe_retval)));
  return _28;
}


struct l_unnamed_1 neg(double llvm_cbe_a_2e_coerce0, double llvm_cbe_a_2e_coerce1) {
  struct l_struct_struct_OC_Complex llvm_cbe_retval;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_a;    /* Address-exposed local */
  struct l_unnamed_1* _29;
  double _30;
  double _31;
  struct l_unnamed_1 _32;

  _29 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  *((&_29->field0)) = llvm_cbe_a_2e_coerce0;
  *((&_29->field1)) = llvm_cbe_a_2e_coerce1;
  ;
  ;
  _30 = *((&llvm_cbe_a.field0));
  *((&llvm_cbe_retval.field0)) = (-(_30));
  _31 = *((&llvm_cbe_a.field1));
  *((&llvm_cbe_retval.field1)) = (-(_31));
  _32 = *(((struct l_unnamed_1*)(&llvm_cbe_retval)));
  return _32;
}


struct l_unnamed_1 conj(double llvm_cbe_a_2e_coerce0, double llvm_cbe_a_2e_coerce1) {
  struct l_struct_struct_OC_Complex llvm_cbe_retval;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_a;    /* Address-exposed local */
  struct l_unnamed_1* _33;
  double _34;
  double _35;
  struct l_unnamed_1 _36;

  _33 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  *((&_33->field0)) = llvm_cbe_a_2e_coerce0;
  *((&_33->field1)) = llvm_cbe_a_2e_coerce1;
  ;
  ;
  _34 = *((&llvm_cbe_a.field0));
  *((&llvm_cbe_retval.field0)) = _34;
  _35 = *((&llvm_cbe_a.field1));
  *((&llvm_cbe_retval.field1)) = (-(_35));
  _36 = *(((struct l_unnamed_1*)(&llvm_cbe_retval)));
  return _36;
}


void put(double llvm_cbe_c_2e_coerce0, double llvm_cbe_c_2e_coerce1) {
  struct l_struct_struct_OC_Complex llvm_cbe_c;    /* Address-exposed local */
  struct l_unnamed_1* _37;
  double _38;
  double _39;
  uint32_t llvm_cbe_call;

  _37 = ((struct l_unnamed_1*)(&llvm_cbe_c));
  *((&_37->field0)) = llvm_cbe_c_2e_coerce0;
  *((&_37->field1)) = llvm_cbe_c_2e_coerce1;
  ;
  _38 = *((&llvm_cbe_c.field0));
  _39 = *((&llvm_cbe_c.field1));
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _38, _39);
}


void complex_ops(void) {
  struct l_struct_struct_OC_Complex llvm_cbe_a;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_b;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_agg_2e_tmp;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_agg_2e_tmp5;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_agg_2e_tmp8;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_agg_2e_tmp11;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_agg_2e_tmp14;    /* Address-exposed local */
  uint8_t* _40;
  uint8_t* _41;
  uint32_t llvm_cbe_call;
  struct l_unnamed_1* _42;
  double _43;
  double _44;
  uint32_t llvm_cbe_call1;
  struct l_unnamed_1* _45;
  double _46;
  double _47;
  uint32_t llvm_cbe_call2;
  struct l_unnamed_1* _48;
  double _49;
  double _50;
  struct l_unnamed_1* _51;
  double _52;
  double _53;
  struct l_unnamed_1 llvm_cbe_call3;
  struct l_unnamed_1* _54;
  struct l_unnamed_1* _55;
  double _56;
  double _57;
  uint32_t llvm_cbe_call4;
  struct l_unnamed_1* _58;
  double _59;
  double _60;
  struct l_unnamed_1* _61;
  double _62;
  double _63;
  struct l_unnamed_1 llvm_cbe_call6;
  struct l_unnamed_1* _64;
  struct l_unnamed_1* _65;
  double _66;
  double _67;
  uint32_t llvm_cbe_call7;
  struct l_unnamed_1* _68;
  double _69;
  double _70;
  struct l_unnamed_1 llvm_cbe_call9;
  struct l_unnamed_1* _71;
  struct l_unnamed_1* _72;
  double _73;
  double _74;
  uint32_t llvm_cbe_call10;
  struct l_unnamed_1* _75;
  double _76;
  double _77;
  struct l_unnamed_1 llvm_cbe_call12;
  struct l_unnamed_1* _78;
  struct l_unnamed_1* _79;
  double _80;
  double _81;
  uint32_t llvm_cbe_call13;
  struct l_unnamed_1* _82;
  double _83;
  double _84;
  struct l_unnamed_1 llvm_cbe_call15;
  struct l_unnamed_1* _85;
  struct l_unnamed_1* _86;
  double _87;
  double _88;
  uint32_t llvm_cbe_call16;

  ;
  _40 = memcpy((((uint8_t*)(&llvm_cbe_a))), ((uint8_t*)(&__const_OC_complex_ops_OC_a)), 16);
  ;
  _41 = memcpy((((uint8_t*)(&llvm_cbe_b))), ((uint8_t*)(&__const_OC_complex_ops_OC_b)), 16);
  llvm_cbe_call = printf(((&_OC_str_OC_1.array[((int64_t)0)])));
  _42 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  _43 = *((&_42->field0));
  _44 = *((&_42->field1));
  put(_43, _44);
  llvm_cbe_call1 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  _45 = ((struct l_unnamed_1*)(&llvm_cbe_b));
  _46 = *((&_45->field0));
  _47 = *((&_45->field1));
  put(_46, _47);
  llvm_cbe_call2 = printf(((&_OC_str_OC_3.array[((int64_t)0)])));
  _48 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  _49 = *((&_48->field0));
  _50 = *((&_48->field1));
  _51 = ((struct l_unnamed_1*)(&llvm_cbe_b));
  _52 = *((&_51->field0));
  _53 = *((&_51->field1));
  llvm_cbe_call3 = add(_49, _50, _52, _53);
  _54 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp));
  *((&_54->field0)) = ((llvm_cbe_call3.field0));
  *((&_54->field1)) = ((llvm_cbe_call3.field1));
  _55 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp));
  _56 = *((&_55->field0));
  _57 = *((&_55->field1));
  put(_56, _57);
  llvm_cbe_call4 = printf(((&_OC_str_OC_4.array[((int64_t)0)])));
  _58 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  _59 = *((&_58->field0));
  _60 = *((&_58->field1));
  _61 = ((struct l_unnamed_1*)(&llvm_cbe_b));
  _62 = *((&_61->field0));
  _63 = *((&_61->field1));
  llvm_cbe_call6 = mult(_59, _60, _62, _63);
  _64 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp5));
  *((&_64->field0)) = ((llvm_cbe_call6.field0));
  *((&_64->field1)) = ((llvm_cbe_call6.field1));
  _65 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp5));
  _66 = *((&_65->field0));
  _67 = *((&_65->field1));
  put(_66, _67);
  llvm_cbe_call7 = printf(((&_OC_str_OC_5.array[((int64_t)0)])));
  _68 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  _69 = *((&_68->field0));
  _70 = *((&_68->field1));
  llvm_cbe_call9 = inv(_69, _70);
  _71 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp8));
  *((&_71->field0)) = ((llvm_cbe_call9.field0));
  *((&_71->field1)) = ((llvm_cbe_call9.field1));
  _72 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp8));
  _73 = *((&_72->field0));
  _74 = *((&_72->field1));
  put(_73, _74);
  llvm_cbe_call10 = printf(((&_OC_str_OC_6.array[((int64_t)0)])));
  _75 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  _76 = *((&_75->field0));
  _77 = *((&_75->field1));
  llvm_cbe_call12 = neg(_76, _77);
  _78 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp11));
  *((&_78->field0)) = ((llvm_cbe_call12.field0));
  *((&_78->field1)) = ((llvm_cbe_call12.field1));
  _79 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp11));
  _80 = *((&_79->field0));
  _81 = *((&_79->field1));
  put(_80, _81);
  llvm_cbe_call13 = printf(((&_OC_str_OC_7.array[((int64_t)0)])));
  _82 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  _83 = *((&_82->field0));
  _84 = *((&_82->field1));
  llvm_cbe_call15 = conj(_83, _84);
  _85 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp14));
  *((&_85->field0)) = ((llvm_cbe_call15.field0));
  *((&_85->field1)) = ((llvm_cbe_call15.field1));
  _86 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp14));
  _87 = *((&_86->field0));
  _88 = *((&_86->field1));
  put(_87, _88);
  llvm_cbe_call16 = printf(((&_OC_str_OC_8.array[((int64_t)0)])));
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */

  llvm_cbe_retval = 0;
  complex_ops();
  return 0;
}

