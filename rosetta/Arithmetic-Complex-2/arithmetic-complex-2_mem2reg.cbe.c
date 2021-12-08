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
struct l_struct_struct_OC_Complex {
  double field0;
  double field1;
};
struct l_array_9_uint8_t {
  uint8_t array[9];
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
  struct l_unnamed_1* _19;
  double _20;
  double _21;
  double _22;
  double _23;
  double denom;
  double _24;
  double _25;
  struct l_unnamed_1 _26;

  _19 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  *((&_19->field0)) = llvm_cbe_a_2e_coerce0;
  *((&_19->field1)) = llvm_cbe_a_2e_coerce1;
  ;
  ;
  _20 = *((&llvm_cbe_a.field0));
  _21 = *((&llvm_cbe_a.field0));
  _22 = *((&llvm_cbe_a.field1));
  _23 = *((&llvm_cbe_a.field1));
  denom = (_20 * _21) + (_22 * _23);
  ;
  _24 = *((&llvm_cbe_a.field0));
  *((&llvm_cbe_retval.field0)) = (_24 / denom);
  _25 = *((&llvm_cbe_a.field1));
  *((&llvm_cbe_retval.field1)) = ((-(_25)) / denom);
  _26 = *(((struct l_unnamed_1*)(&llvm_cbe_retval)));
  return _26;
}


struct l_unnamed_1 neg(double llvm_cbe_a_2e_coerce0, double llvm_cbe_a_2e_coerce1) {
  struct l_struct_struct_OC_Complex llvm_cbe_retval;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_a;    /* Address-exposed local */
  struct l_unnamed_1* _27;
  double _28;
  double _29;
  struct l_unnamed_1 _30;

  _27 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  *((&_27->field0)) = llvm_cbe_a_2e_coerce0;
  *((&_27->field1)) = llvm_cbe_a_2e_coerce1;
  ;
  ;
  _28 = *((&llvm_cbe_a.field0));
  *((&llvm_cbe_retval.field0)) = (-(_28));
  _29 = *((&llvm_cbe_a.field1));
  *((&llvm_cbe_retval.field1)) = (-(_29));
  _30 = *(((struct l_unnamed_1*)(&llvm_cbe_retval)));
  return _30;
}


struct l_unnamed_1 conj(double llvm_cbe_a_2e_coerce0, double llvm_cbe_a_2e_coerce1) {
  struct l_struct_struct_OC_Complex llvm_cbe_retval;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_a;    /* Address-exposed local */
  struct l_unnamed_1* _31;
  double _32;
  double _33;
  struct l_unnamed_1 _34;

  _31 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  *((&_31->field0)) = llvm_cbe_a_2e_coerce0;
  *((&_31->field1)) = llvm_cbe_a_2e_coerce1;
  ;
  ;
  _32 = *((&llvm_cbe_a.field0));
  *((&llvm_cbe_retval.field0)) = _32;
  _33 = *((&llvm_cbe_a.field1));
  *((&llvm_cbe_retval.field1)) = (-(_33));
  _34 = *(((struct l_unnamed_1*)(&llvm_cbe_retval)));
  return _34;
}


void put(double llvm_cbe_c_2e_coerce0, double llvm_cbe_c_2e_coerce1) {
  struct l_struct_struct_OC_Complex llvm_cbe_c;    /* Address-exposed local */
  struct l_unnamed_1* _35;
  double _36;
  double _37;
  uint32_t llvm_cbe_call;

  _35 = ((struct l_unnamed_1*)(&llvm_cbe_c));
  *((&_35->field0)) = llvm_cbe_c_2e_coerce0;
  *((&_35->field1)) = llvm_cbe_c_2e_coerce1;
  ;
  _36 = *((&llvm_cbe_c.field0));
  _37 = *((&llvm_cbe_c.field1));
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _36, _37);
}


void complex_ops(void) {
  struct l_struct_struct_OC_Complex llvm_cbe_a;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_b;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_agg_2e_tmp;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_agg_2e_tmp5;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_agg_2e_tmp8;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_agg_2e_tmp11;    /* Address-exposed local */
  struct l_struct_struct_OC_Complex llvm_cbe_agg_2e_tmp14;    /* Address-exposed local */
  uint8_t* _38;
  uint8_t* _39;
  uint32_t llvm_cbe_call;
  struct l_unnamed_1* _40;
  double _41;
  double _42;
  uint32_t llvm_cbe_call1;
  struct l_unnamed_1* _43;
  double _44;
  double _45;
  uint32_t llvm_cbe_call2;
  struct l_unnamed_1* _46;
  double _47;
  double _48;
  struct l_unnamed_1* _49;
  double _50;
  double _51;
  struct l_unnamed_1 llvm_cbe_call3;
  struct l_unnamed_1* _52;
  struct l_unnamed_1* _53;
  double _54;
  double _55;
  uint32_t llvm_cbe_call4;
  struct l_unnamed_1* _56;
  double _57;
  double _58;
  struct l_unnamed_1* _59;
  double _60;
  double _61;
  struct l_unnamed_1 llvm_cbe_call6;
  struct l_unnamed_1* _62;
  struct l_unnamed_1* _63;
  double _64;
  double _65;
  uint32_t llvm_cbe_call7;
  struct l_unnamed_1* _66;
  double _67;
  double _68;
  struct l_unnamed_1 llvm_cbe_call9;
  struct l_unnamed_1* _69;
  struct l_unnamed_1* _70;
  double _71;
  double _72;
  uint32_t llvm_cbe_call10;
  struct l_unnamed_1* _73;
  double _74;
  double _75;
  struct l_unnamed_1 llvm_cbe_call12;
  struct l_unnamed_1* _76;
  struct l_unnamed_1* _77;
  double _78;
  double _79;
  uint32_t llvm_cbe_call13;
  struct l_unnamed_1* _80;
  double _81;
  double _82;
  struct l_unnamed_1 llvm_cbe_call15;
  struct l_unnamed_1* _83;
  struct l_unnamed_1* _84;
  double _85;
  double _86;
  uint32_t llvm_cbe_call16;

  ;
  _38 = memcpy((((uint8_t*)(&llvm_cbe_a))), ((uint8_t*)(&__const_OC_complex_ops_OC_a)), 16);
  ;
  _39 = memcpy((((uint8_t*)(&llvm_cbe_b))), ((uint8_t*)(&__const_OC_complex_ops_OC_b)), 16);
  llvm_cbe_call = printf(((&_OC_str_OC_1.array[((int64_t)0)])));
  _40 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  _41 = *((&_40->field0));
  _42 = *((&_40->field1));
  put(_41, _42);
  llvm_cbe_call1 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  _43 = ((struct l_unnamed_1*)(&llvm_cbe_b));
  _44 = *((&_43->field0));
  _45 = *((&_43->field1));
  put(_44, _45);
  llvm_cbe_call2 = printf(((&_OC_str_OC_3.array[((int64_t)0)])));
  _46 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  _47 = *((&_46->field0));
  _48 = *((&_46->field1));
  _49 = ((struct l_unnamed_1*)(&llvm_cbe_b));
  _50 = *((&_49->field0));
  _51 = *((&_49->field1));
  llvm_cbe_call3 = add(_47, _48, _50, _51);
  _52 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp));
  *((&_52->field0)) = ((llvm_cbe_call3.field0));
  *((&_52->field1)) = ((llvm_cbe_call3.field1));
  _53 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp));
  _54 = *((&_53->field0));
  _55 = *((&_53->field1));
  put(_54, _55);
  llvm_cbe_call4 = printf(((&_OC_str_OC_4.array[((int64_t)0)])));
  _56 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  _57 = *((&_56->field0));
  _58 = *((&_56->field1));
  _59 = ((struct l_unnamed_1*)(&llvm_cbe_b));
  _60 = *((&_59->field0));
  _61 = *((&_59->field1));
  llvm_cbe_call6 = mult(_57, _58, _60, _61);
  _62 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp5));
  *((&_62->field0)) = ((llvm_cbe_call6.field0));
  *((&_62->field1)) = ((llvm_cbe_call6.field1));
  _63 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp5));
  _64 = *((&_63->field0));
  _65 = *((&_63->field1));
  put(_64, _65);
  llvm_cbe_call7 = printf(((&_OC_str_OC_5.array[((int64_t)0)])));
  _66 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  _67 = *((&_66->field0));
  _68 = *((&_66->field1));
  llvm_cbe_call9 = inv(_67, _68);
  _69 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp8));
  *((&_69->field0)) = ((llvm_cbe_call9.field0));
  *((&_69->field1)) = ((llvm_cbe_call9.field1));
  _70 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp8));
  _71 = *((&_70->field0));
  _72 = *((&_70->field1));
  put(_71, _72);
  llvm_cbe_call10 = printf(((&_OC_str_OC_6.array[((int64_t)0)])));
  _73 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  _74 = *((&_73->field0));
  _75 = *((&_73->field1));
  llvm_cbe_call12 = neg(_74, _75);
  _76 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp11));
  *((&_76->field0)) = ((llvm_cbe_call12.field0));
  *((&_76->field1)) = ((llvm_cbe_call12.field1));
  _77 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp11));
  _78 = *((&_77->field0));
  _79 = *((&_77->field1));
  put(_78, _79);
  llvm_cbe_call13 = printf(((&_OC_str_OC_7.array[((int64_t)0)])));
  _80 = ((struct l_unnamed_1*)(&llvm_cbe_a));
  _81 = *((&_80->field0));
  _82 = *((&_80->field1));
  llvm_cbe_call15 = conj(_81, _82);
  _83 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp14));
  *((&_83->field0)) = ((llvm_cbe_call15.field0));
  *((&_83->field1)) = ((llvm_cbe_call15.field1));
  _84 = ((struct l_unnamed_1*)(&llvm_cbe_agg_2e_tmp14));
  _85 = *((&_84->field0));
  _86 = *((&_84->field1));
  put(_85, _86);
  llvm_cbe_call16 = printf(((&_OC_str_OC_8.array[((int64_t)0)])));
}


int main(void) {
  complex_ops();
  return 0;
}

