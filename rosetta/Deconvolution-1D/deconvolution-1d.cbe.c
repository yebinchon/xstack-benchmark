/* Provide Declarations */
#include <stdint.h>
#ifndef __cplusplus
typedef unsigned char bool;
#endif

/* get a declaration for alloca */
#if defined(__CYGWIN__) || defined(__MINGW32__)
#define  alloca(x) __builtin_alloca((x))
#define _alloca(x) __builtin_alloca((x))
#elif defined(__APPLE__)
extern void *__builtin_alloca(unsigned long);
#define alloca(x) __builtin_alloca(x)
#define longjmp _longjmp
#define setjmp _setjmp
#elif defined(__sun__)
#if defined(__sparcv9)
extern void *__builtin_alloca(unsigned long);
#else
extern void *__builtin_alloca(unsigned int);
#endif
#define alloca(x) __builtin_alloca(x)
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__arm__)
#define alloca(x) __builtin_alloca(x)
#elif defined(_MSC_VER)
#define alloca(x) _alloca(x)
#else
#include <alloca.h>
#endif

#ifndef _MSC_VER
#define __forceinline __attribute__((always_inline)) inline
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
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

static __forceinline int llvm_fcmp_uno(double X, double Y) { return X != X || Y != Y; }


/* Global Declarations */

/* Types Declarations */
struct l_unnamed_1;

/* Function definitions */

/* Types Definitions */
struct l_array_21_double {
  double array[21];
};
struct l_array_16_double {
  double array[16];
};
struct l_array_15_uint8_t {
  uint8_t array[15];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};
struct l_unnamed_1 {
  double field0;
  double field1;
};
struct l_array_6_double {
  double array[6];
};

/* External Global Variable Declarations */

/* Function Declarations */
void _fft(struct l_unnamed_1*, struct l_unnamed_1*, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
struct l_unnamed_1 cexp(double, double) __ATTRIBUTELIST__((nothrow));
struct l_unnamed_1 __muldc3(double, double, double, double);
struct l_unnamed_1 __divdc3(double, double, double, double);
void fft(struct l_unnamed_1*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
struct l_unnamed_1* pad_two(double*, uint32_t, uint32_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* calloc(uint64_t, uint64_t) __ATTRIBUTELIST__((nothrow));
void deconv(double*, uint32_t, double*, uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
void free(uint8_t*) __ATTRIBUTELIST__((nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
double atan2(double, double) __ATTRIBUTELIST__((nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
double PI __ATTRIBUTE_WEAK__;
static __MSALIGN__(16) struct l_array_21_double __const_OC_main_OC_g __attribute__((aligned(16))) = { { 24, 75, 71, -34, 3, 22, -45, 23, 245, 25, 52, 25, -67, -96, 96, 31, 55, 36, 29, -43, -7 } };
static __MSALIGN__(16) struct l_array_16_double __const_OC_main_OC_f __attribute__((aligned(16))) = { { -3, -6, -1, 8, -6, 3, -1, -9, -9, 3, -2, 5, 2, -2, -7, -1 } };
static struct l_array_15_uint8_t _OC_str = { "f[] data is : " };
static struct l_array_4_uint8_t _OC_str_OC_1 = { " %g" };
static struct l_array_2_uint8_t _OC_str_OC_2 = { "\n" };
static struct l_array_15_uint8_t _OC_str_OC_3 = { "deconv(g, h): " };
static struct l_array_15_uint8_t _OC_str_OC_4 = { "h[] data is : " };
static struct l_array_15_uint8_t _OC_str_OC_5 = { "deconv(g, f): " };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint32_t llvm_mul_u32(uint32_t a, uint32_t b) {
  uint32_t r = a * b;
  return r;
}
static __forceinline uint32_t llvm_sdiv_u32(int32_t a, int32_t b) {
  uint32_t r = a / b;
  return r;
}
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}
static __forceinline uint32_t llvm_neg_u32(uint32_t a) {
  uint32_t r = -a;
  return r;
}


/* Function Bodies */

void _fft(struct l_unnamed_1* llvm_cbe_buf, struct l_unnamed_1* llvm_cbe_out, uint32_t llvm_cbe_n, uint32_t llvm_cbe_step) {
  struct l_unnamed_1* llvm_cbe_buf_2e_addr;    /* Address-exposed local */
  struct l_unnamed_1* llvm_cbe_out_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_step_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_t;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_coerce;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  struct l_unnamed_1* _3;
  struct l_unnamed_1* _4;
  uint32_t _5;
  uint32_t _6;
  struct l_unnamed_1* _7;
  uint32_t _8;
  struct l_unnamed_1* _9;
  uint32_t _10;
  uint32_t _11;
  uint32_t _12;
  uint32_t _13;
  uint32_t _14;
  double _15;
  double llvm_cbe_mul_2e_rl;
  double llvm_cbe_mul_2e_il;
  uint32_t _16;
  double llvm_cbe_conv;
  double llvm_cbe_mul_r;
  double llvm_cbe_mul_i;
  struct l_unnamed_1 llvm_cbe_call;
  double _17;
  double _18;
  double llvm_cbe_real_mul_phi;
  double llvm_cbe_real_mul_phi__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi;
  double llvm_cbe_imag_mul_phi__PHI_TEMPORARY;
  uint32_t _19;
  struct l_unnamed_1 llvm_cbe_call7;
  double _20;
  double _21;
  struct l_unnamed_1 llvm_cbe_call8;
  double _22;
  double _23;
  struct l_unnamed_1* _24;
  uint32_t _25;
  uint32_t _26;
  struct l_unnamed_1* llvm_cbe_arrayidx;
  double llvm_cbe_arrayidx_2e_real;
  double llvm_cbe_arrayidx_2e_imag;
  double llvm_cbe_mul_r13;
  double llvm_cbe_mul_i14;
  struct l_unnamed_1 llvm_cbe_call19;
  double _27;
  double _28;
  double llvm_cbe_real_mul_phi21;
  double llvm_cbe_real_mul_phi21__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi22;
  double llvm_cbe_imag_mul_phi22__PHI_TEMPORARY;
  struct l_unnamed_1* _29;
  uint32_t _30;
  struct l_unnamed_1* llvm_cbe_arrayidx24;
  double llvm_cbe_arrayidx24_2e_real;
  double llvm_cbe_arrayidx24_2e_imag;
  double llvm_cbe_t_2e_real;
  double llvm_cbe_t_2e_imag;
  struct l_unnamed_1* _31;
  uint32_t _32;
  struct l_unnamed_1* llvm_cbe_arrayidx28;
  struct l_unnamed_1* _33;
  uint32_t _34;
  struct l_unnamed_1* llvm_cbe_arrayidx30;
  double llvm_cbe_arrayidx30_2e_real;
  double llvm_cbe_arrayidx30_2e_imag;
  double llvm_cbe_t_2e_real32;
  double llvm_cbe_t_2e_imag34;
  struct l_unnamed_1* _35;
  uint32_t _36;
  uint32_t _37;
  struct l_unnamed_1* llvm_cbe_arrayidx38;
  uint32_t _38;
  uint32_t _39;
  double llvm_cbe_real_mul_phi_2e_splitted1;
  double llvm_cbe_real_mul_phi_2e_splitted1__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi_2e_splitted1;
  double llvm_cbe_imag_mul_phi_2e_splitted1__PHI_TEMPORARY;
  uint32_t _40;
  struct l_unnamed_1 llvm_cbe_call7_2e_splitted1;
  double _41;
  double _42;
  struct l_unnamed_1 llvm_cbe_call8_2e_splitted1;
  double _43;
  double _44;
  struct l_unnamed_1* _45;
  uint32_t _46;
  uint32_t _47;
  struct l_unnamed_1* llvm_cbe_arrayidx_2e_splitted1;
  double llvm_cbe_arrayidx_2e_real_2e_splitted1;
  double llvm_cbe_arrayidx_2e_imag_2e_splitted1;
  double llvm_cbe_mul_r13_2e_splitted1;
  double llvm_cbe_mul_i14_2e_splitted1;
  double llvm_cbe_real_mul_phi_2e_splitted2;
  double llvm_cbe_real_mul_phi_2e_splitted2__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi_2e_splitted2;
  double llvm_cbe_imag_mul_phi_2e_splitted2__PHI_TEMPORARY;
  uint32_t _48;
  struct l_unnamed_1 llvm_cbe_call7_2e_splitted2;
  double _49;
  double _50;
  struct l_unnamed_1 llvm_cbe_call8_2e_splitted2;
  double _51;
  double _52;
  struct l_unnamed_1* _53;
  uint32_t _54;
  uint32_t _55;
  struct l_unnamed_1* llvm_cbe_arrayidx_2e_splitted2;
  double llvm_cbe_arrayidx_2e_real_2e_splitted2;
  double llvm_cbe_arrayidx_2e_imag_2e_splitted2;
  double llvm_cbe_mul_r13_2e_splitted2;
  double llvm_cbe_mul_i14_2e_splitted2;
  double llvm_cbe_real_mul_phi21_2e_splitted1;
  double llvm_cbe_real_mul_phi21_2e_splitted1__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi22_2e_splitted1;
  double llvm_cbe_imag_mul_phi22_2e_splitted1__PHI_TEMPORARY;
  struct l_unnamed_1* _56;
  uint32_t _57;
  struct l_unnamed_1* llvm_cbe_arrayidx24_2e_splitted1;
  double llvm_cbe_arrayidx24_2e_real_2e_splitted1;
  double llvm_cbe_arrayidx24_2e_imag_2e_splitted1;
  double llvm_cbe_t_2e_real_2e_splitted1;
  double llvm_cbe_t_2e_imag_2e_splitted1;
  struct l_unnamed_1* _58;
  uint32_t _59;
  struct l_unnamed_1* llvm_cbe_arrayidx28_2e_splitted1;
  struct l_unnamed_1* _60;
  uint32_t _61;
  struct l_unnamed_1* llvm_cbe_arrayidx30_2e_splitted1;
  double llvm_cbe_arrayidx30_2e_real_2e_splitted1;
  double llvm_cbe_arrayidx30_2e_imag_2e_splitted1;
  double llvm_cbe_t_2e_real32_2e_splitted1;
  double llvm_cbe_t_2e_imag34_2e_splitted1;
  struct l_unnamed_1* _62;
  uint32_t _63;
  uint32_t _64;
  struct l_unnamed_1* llvm_cbe_arrayidx38_2e_splitted1;
  double llvm_cbe_real_mul_phi21_2e_splitted2;
  double llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi22_2e_splitted2;
  double llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY;
  struct l_unnamed_1* _65;
  uint32_t _66;
  struct l_unnamed_1* llvm_cbe_arrayidx24_2e_splitted2;
  double llvm_cbe_arrayidx24_2e_real_2e_splitted2;
  double llvm_cbe_arrayidx24_2e_imag_2e_splitted2;
  double llvm_cbe_t_2e_real_2e_splitted2;
  double llvm_cbe_t_2e_imag_2e_splitted2;
  struct l_unnamed_1* _67;
  uint32_t _68;
  struct l_unnamed_1* llvm_cbe_arrayidx28_2e_splitted2;
  struct l_unnamed_1* _69;
  uint32_t _70;
  struct l_unnamed_1* llvm_cbe_arrayidx30_2e_splitted2;
  double llvm_cbe_arrayidx30_2e_real_2e_splitted2;
  double llvm_cbe_arrayidx30_2e_imag_2e_splitted2;
  double llvm_cbe_t_2e_real32_2e_splitted2;
  double llvm_cbe_t_2e_imag34_2e_splitted2;
  struct l_unnamed_1* _71;
  uint32_t _72;
  uint32_t _73;
  struct l_unnamed_1* llvm_cbe_arrayidx38_2e_splitted2;
  double llvm_cbe_real_mul_phi21_2e_splitted3;
  double llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi22_2e_splitted3;
  double llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY;
  struct l_unnamed_1* _74;
  uint32_t _75;
  struct l_unnamed_1* llvm_cbe_arrayidx24_2e_splitted3;
  double llvm_cbe_arrayidx24_2e_real_2e_splitted3;
  double llvm_cbe_arrayidx24_2e_imag_2e_splitted3;
  double llvm_cbe_t_2e_real_2e_splitted3;
  double llvm_cbe_t_2e_imag_2e_splitted3;
  struct l_unnamed_1* _76;
  uint32_t _77;
  struct l_unnamed_1* llvm_cbe_arrayidx28_2e_splitted3;
  struct l_unnamed_1* _78;
  uint32_t _79;
  struct l_unnamed_1* llvm_cbe_arrayidx30_2e_splitted3;
  double llvm_cbe_arrayidx30_2e_real_2e_splitted3;
  double llvm_cbe_arrayidx30_2e_imag_2e_splitted3;
  double llvm_cbe_t_2e_real32_2e_splitted3;
  double llvm_cbe_t_2e_imag34_2e_splitted3;
  struct l_unnamed_1* _80;
  uint32_t _81;
  uint32_t _82;
  struct l_unnamed_1* llvm_cbe_arrayidx38_2e_splitted3;
  double llvm_cbe_real_mul_phi21_2e_splitted4;
  double llvm_cbe_real_mul_phi21_2e_splitted4__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi22_2e_splitted4;
  double llvm_cbe_imag_mul_phi22_2e_splitted4__PHI_TEMPORARY;
  struct l_unnamed_1* _83;
  uint32_t _84;
  struct l_unnamed_1* llvm_cbe_arrayidx24_2e_splitted4;
  double llvm_cbe_arrayidx24_2e_real_2e_splitted4;
  double llvm_cbe_arrayidx24_2e_imag_2e_splitted4;
  double llvm_cbe_t_2e_real_2e_splitted4;
  double llvm_cbe_t_2e_imag_2e_splitted4;
  struct l_unnamed_1* _85;
  uint32_t _86;
  struct l_unnamed_1* llvm_cbe_arrayidx28_2e_splitted4;
  struct l_unnamed_1* _87;
  uint32_t _88;
  struct l_unnamed_1* llvm_cbe_arrayidx30_2e_splitted4;
  double llvm_cbe_arrayidx30_2e_real_2e_splitted4;
  double llvm_cbe_arrayidx30_2e_imag_2e_splitted4;
  double llvm_cbe_t_2e_real32_2e_splitted4;
  double llvm_cbe_t_2e_imag34_2e_splitted4;
  struct l_unnamed_1* _89;
  uint32_t _90;
  uint32_t _91;
  struct l_unnamed_1* llvm_cbe_arrayidx38_2e_splitted4;

  llvm_cbe_buf_2e_addr = llvm_cbe_buf;
  ;
  llvm_cbe_out_2e_addr = llvm_cbe_out;
  ;
  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  llvm_cbe_step_2e_addr = llvm_cbe_step;
  ;
  _1 = llvm_cbe_step_2e_addr;
  _2 = llvm_cbe_n_2e_addr;
  if (!(((((int32_t)_1) < ((int32_t)_2))&1))) {
  _3 = llvm_cbe_out_2e_addr;
  _4 = llvm_cbe_buf_2e_addr;
  _5 = llvm_cbe_n_2e_addr;
  _6 = llvm_cbe_step_2e_addr;
  _fft(_3, _4, _5, (llvm_mul_u32(_6, 2)));
  _7 = llvm_cbe_out_2e_addr;
  _8 = llvm_cbe_step_2e_addr;
  _9 = llvm_cbe_buf_2e_addr;
  _10 = llvm_cbe_step_2e_addr;
  _11 = llvm_cbe_n_2e_addr;
  _12 = llvm_cbe_step_2e_addr;
  _fft(((&_7[((int64_t)(((int64_t)(int32_t)_8)))])), ((&_9[((int64_t)(((int64_t)(int32_t)_10)))])), _11, (llvm_mul_u32(_12, 2)));
  ;
  llvm_cbe_i = 0;

  _13 = llvm_cbe_i;
  _14 = llvm_cbe_n_2e_addr;
  if (!(((((int32_t)_13) < ((int32_t)_14))&1))) {
  }

  ;
  _15 = PI;
  llvm_cbe_mul_2e_rl = -0 * _15;
  llvm_cbe_mul_2e_il = -1 * _15;
  _16 = llvm_cbe_i;
  llvm_cbe_conv = ((double)(int32_t)_16);
  llvm_cbe_mul_r = (llvm_cbe_mul_2e_rl * llvm_cbe_conv) - (llvm_cbe_mul_2e_il * 0);
  llvm_cbe_mul_i = (llvm_cbe_mul_2e_rl * 0) + (llvm_cbe_mul_2e_il * llvm_cbe_conv);
  if ((((llvm_fcmp_uno(llvm_cbe_mul_r, llvm_cbe_mul_r))&1))) {
  if ((((llvm_fcmp_uno(llvm_cbe_mul_i, llvm_cbe_mul_i))&1))) {
  llvm_cbe_call = __muldc3(llvm_cbe_mul_2e_rl, llvm_cbe_mul_2e_il, llvm_cbe_conv, 0);
  _17 = (llvm_cbe_call.field0);
  _18 = (llvm_cbe_call.field1);
  llvm_cbe_real_mul_phi__PHI_TEMPORARY = _17;   /* for PHI node */
  llvm_cbe_imag_mul_phi__PHI_TEMPORARY = _18;   /* for PHI node */

  llvm_cbe_real_mul_phi = llvm_cbe_real_mul_phi__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi = llvm_cbe_imag_mul_phi__PHI_TEMPORARY;
  _19 = llvm_cbe_n_2e_addr;
  llvm_cbe_call7 = __divdc3(llvm_cbe_real_mul_phi, llvm_cbe_imag_mul_phi, (((double)(int32_t)_19)), 0);
  *((&llvm_cbe_coerce.field0)) = ((llvm_cbe_call7.field0));
  *((&llvm_cbe_coerce.field1)) = ((llvm_cbe_call7.field1));
  _20 = *((&llvm_cbe_coerce.field0));
  _21 = *((&llvm_cbe_coerce.field1));
  llvm_cbe_call8 = cexp(_20, _21);
  _22 = (llvm_cbe_call8.field0);
  _23 = (llvm_cbe_call8.field1);
  _24 = llvm_cbe_out_2e_addr;
  _25 = llvm_cbe_i;
  _26 = llvm_cbe_step_2e_addr;
  llvm_cbe_arrayidx = (&_24[((int64_t)(((int64_t)(int32_t)(llvm_add_u32(_25, _26)))))]);
  llvm_cbe_arrayidx_2e_real = *((&llvm_cbe_arrayidx->field0));
  llvm_cbe_arrayidx_2e_imag = *((&llvm_cbe_arrayidx->field1));
  llvm_cbe_mul_r13 = (_22 * llvm_cbe_arrayidx_2e_real) - (_23 * llvm_cbe_arrayidx_2e_imag);
  llvm_cbe_mul_i14 = (_22 * llvm_cbe_arrayidx_2e_imag) + (_23 * llvm_cbe_arrayidx_2e_real);
  if ((((llvm_fcmp_uno(llvm_cbe_mul_r13, llvm_cbe_mul_r13))&1))) {
  if ((((llvm_fcmp_uno(llvm_cbe_mul_i14, llvm_cbe_mul_i14))&1))) {
  llvm_cbe_call19 = __muldc3(_22, _23, llvm_cbe_arrayidx_2e_real, llvm_cbe_arrayidx_2e_imag);
  _27 = (llvm_cbe_call19.field0);
  _28 = (llvm_cbe_call19.field1);
  llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY = _27;   /* for PHI node */
  llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY = _28;   /* for PHI node */

  llvm_cbe_real_mul_phi21_2e_splitted2 = llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted2 = llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted2;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted2;
  _65 = llvm_cbe_out_2e_addr;
  _66 = llvm_cbe_i;
  llvm_cbe_arrayidx24_2e_splitted2 = (&_65[((int64_t)(((int64_t)(int32_t)_66)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx24_2e_splitted2->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx24_2e_splitted2->field1));
  llvm_cbe_t_2e_real_2e_splitted2 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted2 = *((&llvm_cbe_t.field1));
  _67 = llvm_cbe_buf_2e_addr;
  _68 = llvm_cbe_i;
  llvm_cbe_arrayidx28_2e_splitted2 = (&_67[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_68, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted2->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted2 + llvm_cbe_t_2e_real_2e_splitted2);
  *((&llvm_cbe_arrayidx28_2e_splitted2->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted2 + llvm_cbe_t_2e_imag_2e_splitted2);
  _69 = llvm_cbe_out_2e_addr;
  _70 = llvm_cbe_i;
  llvm_cbe_arrayidx30_2e_splitted2 = (&_69[((int64_t)(((int64_t)(int32_t)_70)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx30_2e_splitted2->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx30_2e_splitted2->field1));
  llvm_cbe_t_2e_real32_2e_splitted2 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted2 = *((&llvm_cbe_t.field1));
  _71 = llvm_cbe_buf_2e_addr;
  _72 = llvm_cbe_i;
  _73 = llvm_cbe_n_2e_addr;
  llvm_cbe_arrayidx38_2e_splitted2 = (&_71[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(_72, _73)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted2->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted2 - llvm_cbe_t_2e_real32_2e_splitted2);
  *((&llvm_cbe_arrayidx38_2e_splitted2->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted2 - llvm_cbe_t_2e_imag34_2e_splitted2);

  } else {
    llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY = llvm_cbe_mul_r13;   /* for PHI node */
    llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY = llvm_cbe_mul_i14;   /* for PHI node */
  llvm_cbe_real_mul_phi21_2e_splitted3 = llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted3 = llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted3;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted3;
  _74 = llvm_cbe_out_2e_addr;
  _75 = llvm_cbe_i;
  llvm_cbe_arrayidx24_2e_splitted3 = (&_74[((int64_t)(((int64_t)(int32_t)_75)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted3 = *((&llvm_cbe_arrayidx24_2e_splitted3->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted3 = *((&llvm_cbe_arrayidx24_2e_splitted3->field1));
  llvm_cbe_t_2e_real_2e_splitted3 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted3 = *((&llvm_cbe_t.field1));
  _76 = llvm_cbe_buf_2e_addr;
  _77 = llvm_cbe_i;
  llvm_cbe_arrayidx28_2e_splitted3 = (&_76[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_77, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted3->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted3 + llvm_cbe_t_2e_real_2e_splitted3);
  *((&llvm_cbe_arrayidx28_2e_splitted3->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted3 + llvm_cbe_t_2e_imag_2e_splitted3);
  _78 = llvm_cbe_out_2e_addr;
  _79 = llvm_cbe_i;
  llvm_cbe_arrayidx30_2e_splitted3 = (&_78[((int64_t)(((int64_t)(int32_t)_79)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted3 = *((&llvm_cbe_arrayidx30_2e_splitted3->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted3 = *((&llvm_cbe_arrayidx30_2e_splitted3->field1));
  llvm_cbe_t_2e_real32_2e_splitted3 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted3 = *((&llvm_cbe_t.field1));
  _80 = llvm_cbe_buf_2e_addr;
  _81 = llvm_cbe_i;
  _82 = llvm_cbe_n_2e_addr;
  llvm_cbe_arrayidx38_2e_splitted3 = (&_80[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(_81, _82)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted3->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted3 - llvm_cbe_t_2e_real32_2e_splitted3);
  *((&llvm_cbe_arrayidx38_2e_splitted3->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted3 - llvm_cbe_t_2e_imag34_2e_splitted3);

}
  } else {
    llvm_cbe_real_mul_phi21_2e_splitted4__PHI_TEMPORARY = llvm_cbe_mul_r13;   /* for PHI node */
    llvm_cbe_imag_mul_phi22_2e_splitted4__PHI_TEMPORARY = llvm_cbe_mul_i14;   /* for PHI node */
  llvm_cbe_real_mul_phi21_2e_splitted4 = llvm_cbe_real_mul_phi21_2e_splitted4__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted4 = llvm_cbe_imag_mul_phi22_2e_splitted4__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted4;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted4;
  _83 = llvm_cbe_out_2e_addr;
  _84 = llvm_cbe_i;
  llvm_cbe_arrayidx24_2e_splitted4 = (&_83[((int64_t)(((int64_t)(int32_t)_84)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted4 = *((&llvm_cbe_arrayidx24_2e_splitted4->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted4 = *((&llvm_cbe_arrayidx24_2e_splitted4->field1));
  llvm_cbe_t_2e_real_2e_splitted4 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted4 = *((&llvm_cbe_t.field1));
  _85 = llvm_cbe_buf_2e_addr;
  _86 = llvm_cbe_i;
  llvm_cbe_arrayidx28_2e_splitted4 = (&_85[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_86, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted4->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted4 + llvm_cbe_t_2e_real_2e_splitted4);
  *((&llvm_cbe_arrayidx28_2e_splitted4->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted4 + llvm_cbe_t_2e_imag_2e_splitted4);
  _87 = llvm_cbe_out_2e_addr;
  _88 = llvm_cbe_i;
  llvm_cbe_arrayidx30_2e_splitted4 = (&_87[((int64_t)(((int64_t)(int32_t)_88)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted4 = *((&llvm_cbe_arrayidx30_2e_splitted4->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted4 = *((&llvm_cbe_arrayidx30_2e_splitted4->field1));
  llvm_cbe_t_2e_real32_2e_splitted4 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted4 = *((&llvm_cbe_t.field1));
  _89 = llvm_cbe_buf_2e_addr;
  _90 = llvm_cbe_i;
  _91 = llvm_cbe_n_2e_addr;
  llvm_cbe_arrayidx38_2e_splitted4 = (&_89[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(_90, _91)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted4->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted4 - llvm_cbe_t_2e_real32_2e_splitted4);
  *((&llvm_cbe_arrayidx38_2e_splitted4->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted4 - llvm_cbe_t_2e_imag34_2e_splitted4);

}
  } else {
    llvm_cbe_real_mul_phi_2e_splitted1__PHI_TEMPORARY = llvm_cbe_mul_r;   /* for PHI node */
    llvm_cbe_imag_mul_phi_2e_splitted1__PHI_TEMPORARY = llvm_cbe_mul_i;   /* for PHI node */
  llvm_cbe_real_mul_phi_2e_splitted1 = llvm_cbe_real_mul_phi_2e_splitted1__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi_2e_splitted1 = llvm_cbe_imag_mul_phi_2e_splitted1__PHI_TEMPORARY;
  _40 = llvm_cbe_n_2e_addr;
  llvm_cbe_call7_2e_splitted1 = __divdc3(llvm_cbe_real_mul_phi_2e_splitted1, llvm_cbe_imag_mul_phi_2e_splitted1, (((double)(int32_t)_40)), 0);
  *((&llvm_cbe_coerce.field0)) = ((llvm_cbe_call7_2e_splitted1.field0));
  *((&llvm_cbe_coerce.field1)) = ((llvm_cbe_call7_2e_splitted1.field1));
  _41 = *((&llvm_cbe_coerce.field0));
  _42 = *((&llvm_cbe_coerce.field1));
  llvm_cbe_call8_2e_splitted1 = cexp(_41, _42);
  _43 = (llvm_cbe_call8_2e_splitted1.field0);
  _44 = (llvm_cbe_call8_2e_splitted1.field1);
  _45 = llvm_cbe_out_2e_addr;
  _46 = llvm_cbe_i;
  _47 = llvm_cbe_step_2e_addr;
  llvm_cbe_arrayidx_2e_splitted1 = (&_45[((int64_t)(((int64_t)(int32_t)(llvm_add_u32(_46, _47)))))]);
  llvm_cbe_arrayidx_2e_real_2e_splitted1 = *((&llvm_cbe_arrayidx_2e_splitted1->field0));
  llvm_cbe_arrayidx_2e_imag_2e_splitted1 = *((&llvm_cbe_arrayidx_2e_splitted1->field1));
  llvm_cbe_mul_r13_2e_splitted1 = (_43 * llvm_cbe_arrayidx_2e_real_2e_splitted1) - (_44 * llvm_cbe_arrayidx_2e_imag_2e_splitted1);
  llvm_cbe_mul_i14_2e_splitted1 = (_43 * llvm_cbe_arrayidx_2e_imag_2e_splitted1) + (_44 * llvm_cbe_arrayidx_2e_real_2e_splitted1);
  if ((((llvm_fcmp_uno(llvm_cbe_mul_r13_2e_splitted1, llvm_cbe_mul_r13_2e_splitted1))&1))) {
  if ((((llvm_fcmp_uno(llvm_cbe_mul_i14, llvm_cbe_mul_i14))&1))) {
  } else {
    llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY = llvm_cbe_mul_r13;   /* for PHI node */
    llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY = llvm_cbe_mul_i14;   /* for PHI node */
}
  llvm_cbe_call19 = __muldc3(_22, _23, llvm_cbe_arrayidx_2e_real, llvm_cbe_arrayidx_2e_imag);
  _27 = (llvm_cbe_call19.field0);
  _28 = (llvm_cbe_call19.field1);
  llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY = _27;   /* for PHI node */
  llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY = _28;   /* for PHI node */

  llvm_cbe_real_mul_phi21_2e_splitted3 = llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted3 = llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted3;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted3;
  _74 = llvm_cbe_out_2e_addr;
  _75 = llvm_cbe_i;
  llvm_cbe_arrayidx24_2e_splitted3 = (&_74[((int64_t)(((int64_t)(int32_t)_75)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted3 = *((&llvm_cbe_arrayidx24_2e_splitted3->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted3 = *((&llvm_cbe_arrayidx24_2e_splitted3->field1));
  llvm_cbe_t_2e_real_2e_splitted3 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted3 = *((&llvm_cbe_t.field1));
  _76 = llvm_cbe_buf_2e_addr;
  _77 = llvm_cbe_i;
  llvm_cbe_arrayidx28_2e_splitted3 = (&_76[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_77, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted3->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted3 + llvm_cbe_t_2e_real_2e_splitted3);
  *((&llvm_cbe_arrayidx28_2e_splitted3->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted3 + llvm_cbe_t_2e_imag_2e_splitted3);
  _78 = llvm_cbe_out_2e_addr;
  _79 = llvm_cbe_i;
  llvm_cbe_arrayidx30_2e_splitted3 = (&_78[((int64_t)(((int64_t)(int32_t)_79)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted3 = *((&llvm_cbe_arrayidx30_2e_splitted3->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted3 = *((&llvm_cbe_arrayidx30_2e_splitted3->field1));
  llvm_cbe_t_2e_real32_2e_splitted3 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted3 = *((&llvm_cbe_t.field1));
  _80 = llvm_cbe_buf_2e_addr;
  _81 = llvm_cbe_i;
  _82 = llvm_cbe_n_2e_addr;
  llvm_cbe_arrayidx38_2e_splitted3 = (&_80[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(_81, _82)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted3->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted3 - llvm_cbe_t_2e_real32_2e_splitted3);
  *((&llvm_cbe_arrayidx38_2e_splitted3->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted3 - llvm_cbe_t_2e_imag34_2e_splitted3);

  llvm_cbe_real_mul_phi21_2e_splitted2 = llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted2 = llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted2;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted2;
  _65 = llvm_cbe_out_2e_addr;
  _66 = llvm_cbe_i;
  llvm_cbe_arrayidx24_2e_splitted2 = (&_65[((int64_t)(((int64_t)(int32_t)_66)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx24_2e_splitted2->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx24_2e_splitted2->field1));
  llvm_cbe_t_2e_real_2e_splitted2 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted2 = *((&llvm_cbe_t.field1));
  _67 = llvm_cbe_buf_2e_addr;
  _68 = llvm_cbe_i;
  llvm_cbe_arrayidx28_2e_splitted2 = (&_67[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_68, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted2->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted2 + llvm_cbe_t_2e_real_2e_splitted2);
  *((&llvm_cbe_arrayidx28_2e_splitted2->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted2 + llvm_cbe_t_2e_imag_2e_splitted2);
  _69 = llvm_cbe_out_2e_addr;
  _70 = llvm_cbe_i;
  llvm_cbe_arrayidx30_2e_splitted2 = (&_69[((int64_t)(((int64_t)(int32_t)_70)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx30_2e_splitted2->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx30_2e_splitted2->field1));
  llvm_cbe_t_2e_real32_2e_splitted2 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted2 = *((&llvm_cbe_t.field1));
  _71 = llvm_cbe_buf_2e_addr;
  _72 = llvm_cbe_i;
  _73 = llvm_cbe_n_2e_addr;
  llvm_cbe_arrayidx38_2e_splitted2 = (&_71[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(_72, _73)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted2->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted2 - llvm_cbe_t_2e_real32_2e_splitted2);
  *((&llvm_cbe_arrayidx38_2e_splitted2->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted2 - llvm_cbe_t_2e_imag34_2e_splitted2);

  } else {
    llvm_cbe_real_mul_phi21_2e_splitted1__PHI_TEMPORARY = llvm_cbe_mul_r13_2e_splitted2;   /* for PHI node */
    llvm_cbe_imag_mul_phi22_2e_splitted1__PHI_TEMPORARY = llvm_cbe_mul_i14_2e_splitted2;   /* for PHI node */
  llvm_cbe_real_mul_phi21_2e_splitted1 = llvm_cbe_real_mul_phi21_2e_splitted1__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted1 = llvm_cbe_imag_mul_phi22_2e_splitted1__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted1;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted1;
  _56 = llvm_cbe_out_2e_addr;
  _57 = llvm_cbe_i;
  llvm_cbe_arrayidx24_2e_splitted1 = (&_56[((int64_t)(((int64_t)(int32_t)_57)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted1 = *((&llvm_cbe_arrayidx24_2e_splitted1->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted1 = *((&llvm_cbe_arrayidx24_2e_splitted1->field1));
  llvm_cbe_t_2e_real_2e_splitted1 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted1 = *((&llvm_cbe_t.field1));
  _58 = llvm_cbe_buf_2e_addr;
  _59 = llvm_cbe_i;
  llvm_cbe_arrayidx28_2e_splitted1 = (&_58[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_59, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted1->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted1 + llvm_cbe_t_2e_real_2e_splitted1);
  *((&llvm_cbe_arrayidx28_2e_splitted1->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted1 + llvm_cbe_t_2e_imag_2e_splitted1);
  _60 = llvm_cbe_out_2e_addr;
  _61 = llvm_cbe_i;
  llvm_cbe_arrayidx30_2e_splitted1 = (&_60[((int64_t)(((int64_t)(int32_t)_61)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted1 = *((&llvm_cbe_arrayidx30_2e_splitted1->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted1 = *((&llvm_cbe_arrayidx30_2e_splitted1->field1));
  llvm_cbe_t_2e_real32_2e_splitted1 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted1 = *((&llvm_cbe_t.field1));
  _62 = llvm_cbe_buf_2e_addr;
  _63 = llvm_cbe_i;
  _64 = llvm_cbe_n_2e_addr;
  llvm_cbe_arrayidx38_2e_splitted1 = (&_62[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(_63, _64)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted1->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted1 - llvm_cbe_t_2e_real32_2e_splitted1);
  *((&llvm_cbe_arrayidx38_2e_splitted1->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted1 - llvm_cbe_t_2e_imag34_2e_splitted1);

}
}
  } else {
    llvm_cbe_real_mul_phi_2e_splitted2__PHI_TEMPORARY = llvm_cbe_mul_r;   /* for PHI node */
    llvm_cbe_imag_mul_phi_2e_splitted2__PHI_TEMPORARY = llvm_cbe_mul_i;   /* for PHI node */
  llvm_cbe_real_mul_phi_2e_splitted2 = llvm_cbe_real_mul_phi_2e_splitted2__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi_2e_splitted2 = llvm_cbe_imag_mul_phi_2e_splitted2__PHI_TEMPORARY;
  _48 = llvm_cbe_n_2e_addr;
  llvm_cbe_call7_2e_splitted2 = __divdc3(llvm_cbe_real_mul_phi_2e_splitted2, llvm_cbe_imag_mul_phi_2e_splitted2, (((double)(int32_t)_48)), 0);
  *((&llvm_cbe_coerce.field0)) = ((llvm_cbe_call7_2e_splitted2.field0));
  *((&llvm_cbe_coerce.field1)) = ((llvm_cbe_call7_2e_splitted2.field1));
  _49 = *((&llvm_cbe_coerce.field0));
  _50 = *((&llvm_cbe_coerce.field1));
  llvm_cbe_call8_2e_splitted2 = cexp(_49, _50);
  _51 = (llvm_cbe_call8_2e_splitted2.field0);
  _52 = (llvm_cbe_call8_2e_splitted2.field1);
  _53 = llvm_cbe_out_2e_addr;
  _54 = llvm_cbe_i;
  _55 = llvm_cbe_step_2e_addr;
  llvm_cbe_arrayidx_2e_splitted2 = (&_53[((int64_t)(((int64_t)(int32_t)(llvm_add_u32(_54, _55)))))]);
  llvm_cbe_arrayidx_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx_2e_splitted2->field0));
  llvm_cbe_arrayidx_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx_2e_splitted2->field1));
  llvm_cbe_mul_r13_2e_splitted2 = (_51 * llvm_cbe_arrayidx_2e_real_2e_splitted2) - (_52 * llvm_cbe_arrayidx_2e_imag_2e_splitted2);
  llvm_cbe_mul_i14_2e_splitted2 = (_51 * llvm_cbe_arrayidx_2e_imag_2e_splitted2) + (_52 * llvm_cbe_arrayidx_2e_real_2e_splitted2);
  if ((((llvm_fcmp_uno(llvm_cbe_mul_r13_2e_splitted2, llvm_cbe_mul_r13_2e_splitted2))&1))) {
  if ((((llvm_fcmp_uno(llvm_cbe_mul_i14, llvm_cbe_mul_i14))&1))) {
  } else {
    llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY = llvm_cbe_mul_r13;   /* for PHI node */
    llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY = llvm_cbe_mul_i14;   /* for PHI node */
}
  llvm_cbe_call19 = __muldc3(_22, _23, llvm_cbe_arrayidx_2e_real, llvm_cbe_arrayidx_2e_imag);
  _27 = (llvm_cbe_call19.field0);
  _28 = (llvm_cbe_call19.field1);
  llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY = _27;   /* for PHI node */
  llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY = _28;   /* for PHI node */

  llvm_cbe_real_mul_phi21_2e_splitted3 = llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted3 = llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted3;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted3;
  _74 = llvm_cbe_out_2e_addr;
  _75 = llvm_cbe_i;
  llvm_cbe_arrayidx24_2e_splitted3 = (&_74[((int64_t)(((int64_t)(int32_t)_75)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted3 = *((&llvm_cbe_arrayidx24_2e_splitted3->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted3 = *((&llvm_cbe_arrayidx24_2e_splitted3->field1));
  llvm_cbe_t_2e_real_2e_splitted3 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted3 = *((&llvm_cbe_t.field1));
  _76 = llvm_cbe_buf_2e_addr;
  _77 = llvm_cbe_i;
  llvm_cbe_arrayidx28_2e_splitted3 = (&_76[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_77, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted3->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted3 + llvm_cbe_t_2e_real_2e_splitted3);
  *((&llvm_cbe_arrayidx28_2e_splitted3->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted3 + llvm_cbe_t_2e_imag_2e_splitted3);
  _78 = llvm_cbe_out_2e_addr;
  _79 = llvm_cbe_i;
  llvm_cbe_arrayidx30_2e_splitted3 = (&_78[((int64_t)(((int64_t)(int32_t)_79)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted3 = *((&llvm_cbe_arrayidx30_2e_splitted3->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted3 = *((&llvm_cbe_arrayidx30_2e_splitted3->field1));
  llvm_cbe_t_2e_real32_2e_splitted3 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted3 = *((&llvm_cbe_t.field1));
  _80 = llvm_cbe_buf_2e_addr;
  _81 = llvm_cbe_i;
  _82 = llvm_cbe_n_2e_addr;
  llvm_cbe_arrayidx38_2e_splitted3 = (&_80[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(_81, _82)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted3->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted3 - llvm_cbe_t_2e_real32_2e_splitted3);
  *((&llvm_cbe_arrayidx38_2e_splitted3->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted3 - llvm_cbe_t_2e_imag34_2e_splitted3);

  llvm_cbe_real_mul_phi21_2e_splitted2 = llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted2 = llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted2;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted2;
  _65 = llvm_cbe_out_2e_addr;
  _66 = llvm_cbe_i;
  llvm_cbe_arrayidx24_2e_splitted2 = (&_65[((int64_t)(((int64_t)(int32_t)_66)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx24_2e_splitted2->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx24_2e_splitted2->field1));
  llvm_cbe_t_2e_real_2e_splitted2 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted2 = *((&llvm_cbe_t.field1));
  _67 = llvm_cbe_buf_2e_addr;
  _68 = llvm_cbe_i;
  llvm_cbe_arrayidx28_2e_splitted2 = (&_67[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_68, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted2->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted2 + llvm_cbe_t_2e_real_2e_splitted2);
  *((&llvm_cbe_arrayidx28_2e_splitted2->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted2 + llvm_cbe_t_2e_imag_2e_splitted2);
  _69 = llvm_cbe_out_2e_addr;
  _70 = llvm_cbe_i;
  llvm_cbe_arrayidx30_2e_splitted2 = (&_69[((int64_t)(((int64_t)(int32_t)_70)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx30_2e_splitted2->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx30_2e_splitted2->field1));
  llvm_cbe_t_2e_real32_2e_splitted2 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted2 = *((&llvm_cbe_t.field1));
  _71 = llvm_cbe_buf_2e_addr;
  _72 = llvm_cbe_i;
  _73 = llvm_cbe_n_2e_addr;
  llvm_cbe_arrayidx38_2e_splitted2 = (&_71[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(_72, _73)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted2->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted2 - llvm_cbe_t_2e_real32_2e_splitted2);
  *((&llvm_cbe_arrayidx38_2e_splitted2->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted2 - llvm_cbe_t_2e_imag34_2e_splitted2);

  } else {
    llvm_cbe_real_mul_phi21__PHI_TEMPORARY = llvm_cbe_mul_r13_2e_splitted2;   /* for PHI node */
    llvm_cbe_imag_mul_phi22__PHI_TEMPORARY = llvm_cbe_mul_i14_2e_splitted2;   /* for PHI node */
  llvm_cbe_real_mul_phi21 = llvm_cbe_real_mul_phi21__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22 = llvm_cbe_imag_mul_phi22__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22;
  _29 = llvm_cbe_out_2e_addr;
  _30 = llvm_cbe_i;
  llvm_cbe_arrayidx24 = (&_29[((int64_t)(((int64_t)(int32_t)_30)))]);
  llvm_cbe_arrayidx24_2e_real = *((&llvm_cbe_arrayidx24->field0));
  llvm_cbe_arrayidx24_2e_imag = *((&llvm_cbe_arrayidx24->field1));
  llvm_cbe_t_2e_real = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag = *((&llvm_cbe_t.field1));
  _31 = llvm_cbe_buf_2e_addr;
  _32 = llvm_cbe_i;
  llvm_cbe_arrayidx28 = (&_31[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_32, 2)))))]);
  *((&llvm_cbe_arrayidx28->field0)) = (llvm_cbe_arrayidx24_2e_real + llvm_cbe_t_2e_real);
  *((&llvm_cbe_arrayidx28->field1)) = (llvm_cbe_arrayidx24_2e_imag + llvm_cbe_t_2e_imag);
  _33 = llvm_cbe_out_2e_addr;
  _34 = llvm_cbe_i;
  llvm_cbe_arrayidx30 = (&_33[((int64_t)(((int64_t)(int32_t)_34)))]);
  llvm_cbe_arrayidx30_2e_real = *((&llvm_cbe_arrayidx30->field0));
  llvm_cbe_arrayidx30_2e_imag = *((&llvm_cbe_arrayidx30->field1));
  llvm_cbe_t_2e_real32 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34 = *((&llvm_cbe_t.field1));
  _35 = llvm_cbe_buf_2e_addr;
  _36 = llvm_cbe_i;
  _37 = llvm_cbe_n_2e_addr;
  llvm_cbe_arrayidx38 = (&_35[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(_36, _37)), 2)))))]);
  *((&llvm_cbe_arrayidx38->field0)) = (llvm_cbe_arrayidx30_2e_real - llvm_cbe_t_2e_real32);
  *((&llvm_cbe_arrayidx38->field1)) = (llvm_cbe_arrayidx30_2e_imag - llvm_cbe_t_2e_imag34);

}
}

}
  _13 = llvm_cbe_i;
  _14 = llvm_cbe_n_2e_addr;
while (((int32_t)_13) < ((int32_t)_14)){
  _38 = llvm_cbe_step_2e_addr;
  _39 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_39, (llvm_mul_u32(2, _38))));

  _13 = llvm_cbe_i;
  _14 = llvm_cbe_n_2e_addr;
}
  return;
}


void fft(struct l_unnamed_1* llvm_cbe_buf, uint32_t llvm_cbe_n) {
  struct l_unnamed_1* llvm_cbe_buf_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_saved_stack;    /* Address-exposed local */
  uint64_t llvm_cbe___vla_expr0;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t _92;
  uint64_t _93;
  struct l_unnamed_1* llvm_cbe_vla;
  uint32_t _94;
  uint32_t _95;
  struct l_unnamed_1* _96;
  uint32_t _97;
  struct l_unnamed_1* llvm_cbe_arrayidx;
  double llvm_cbe_arrayidx_2e_real;
  double llvm_cbe_arrayidx_2e_imag;
  uint32_t _98;
  struct l_unnamed_1* llvm_cbe_arrayidx2;
  uint32_t _99;
  struct l_unnamed_1* _100;
  uint32_t _101;
  uint8_t* _102;

  llvm_cbe_buf_2e_addr = llvm_cbe_buf;
  ;
  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  _92 = llvm_cbe_n_2e_addr;
  _93 = ((uint64_t)(uint32_t)_92);
  llvm_cbe_saved_stack = ((uint8_t*)/*NULL*/0);
  llvm_cbe_vla = (struct l_unnamed_1*) alloca(sizeof(struct l_unnamed_1) * (_93));
  llvm_cbe___vla_expr0 = _93;
  ;
  ;
  ;
  llvm_cbe_i = 0;

  _94 = llvm_cbe_i;
  _95 = llvm_cbe_n_2e_addr;
while (((int32_t)_94) < ((int32_t)_95)){
  _96 = llvm_cbe_buf_2e_addr;
  _97 = llvm_cbe_i;
  llvm_cbe_arrayidx = (&_96[((int64_t)(((int64_t)(int32_t)_97)))]);
  llvm_cbe_arrayidx_2e_real = *((&llvm_cbe_arrayidx->field0));
  llvm_cbe_arrayidx_2e_imag = *((&llvm_cbe_arrayidx->field1));
  _98 = llvm_cbe_i;
  llvm_cbe_arrayidx2 = (&llvm_cbe_vla[((int64_t)(((int64_t)(int32_t)_98)))]);
  *((&llvm_cbe_arrayidx2->field0)) = llvm_cbe_arrayidx_2e_real;
  *((&llvm_cbe_arrayidx2->field1)) = llvm_cbe_arrayidx_2e_imag;

  _99 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_99, 1));

  _94 = llvm_cbe_i;
  _95 = llvm_cbe_n_2e_addr;
}
  _100 = llvm_cbe_buf_2e_addr;
  _101 = llvm_cbe_n_2e_addr;
  _fft(_100, llvm_cbe_vla, _101, 1);
  _102 = llvm_cbe_saved_stack;
}


struct l_unnamed_1* pad_two(double* llvm_cbe_g, uint32_t llvm_cbe_len, uint32_t* llvm_cbe_ns) {
  double* llvm_cbe_g_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_len_2e_addr;    /* Address-exposed local */
  uint32_t* llvm_cbe_ns_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_n;    /* Address-exposed local */
  struct l_unnamed_1* llvm_cbe_buf;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t* _103;
  uint32_t _104;
  uint32_t* _105;
  uint32_t _106;
  uint32_t _107;
  uint32_t _108;
  uint32_t _109;
  uint32_t _110;
  uint8_t* llvm_cbe_call;
  uint32_t _111;
  uint32_t _112;
  double* _113;
  uint32_t _114;
  double _115;
  struct l_unnamed_1* _116;
  uint32_t _117;
  struct l_unnamed_1* llvm_cbe_arrayidx4;
  uint32_t _118;
  uint32_t _119;
  uint32_t* _120;
  struct l_unnamed_1* _121;

  llvm_cbe_g_2e_addr = llvm_cbe_g;
  ;
  llvm_cbe_len_2e_addr = llvm_cbe_len;
  ;
  llvm_cbe_ns_2e_addr = llvm_cbe_ns;
  ;
  ;
  llvm_cbe_n = 1;
  _103 = llvm_cbe_ns_2e_addr;
  _104 = *_103;
  if ((((_104 != 0u)&1))) {
  _105 = llvm_cbe_ns_2e_addr;
  _106 = *_105;
  llvm_cbe_n = _106;

  } else {

  _107 = llvm_cbe_n;
  _108 = llvm_cbe_len_2e_addr;
  if (!(((((int32_t)_107) < ((int32_t)_108))&1))) {
  }

  _109 = llvm_cbe_n;
  llvm_cbe_n = (llvm_mul_u32(_109, 2));


}
  _107 = llvm_cbe_n;
  _108 = llvm_cbe_len_2e_addr;
while (((int32_t)_107) < ((int32_t)_108)){
  _107 = llvm_cbe_n;
  _108 = llvm_cbe_len_2e_addr;
}
  ;
  _110 = llvm_cbe_n;
  llvm_cbe_call = calloc(16, (((int64_t)(int32_t)_110)));
  llvm_cbe_buf = (((struct l_unnamed_1*)llvm_cbe_call));
  ;
  llvm_cbe_i = 0;

  _111 = llvm_cbe_i;
  _112 = llvm_cbe_len_2e_addr;
while (((int32_t)_111) < ((int32_t)_112)){
  _113 = llvm_cbe_g_2e_addr;
  _114 = llvm_cbe_i;
  _115 = *((&_113[((int64_t)(((int64_t)(int32_t)_114)))]));
  _116 = llvm_cbe_buf;
  _117 = llvm_cbe_i;
  llvm_cbe_arrayidx4 = (&_116[((int64_t)(((int64_t)(int32_t)_117)))]);
  *((&llvm_cbe_arrayidx4->field0)) = _115;
  *((&llvm_cbe_arrayidx4->field1)) = 0;

  _118 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_118, 1));

  _111 = llvm_cbe_i;
  _112 = llvm_cbe_len_2e_addr;
}
  _119 = llvm_cbe_n;
  _120 = llvm_cbe_ns_2e_addr;
  *_120 = _119;
  _121 = llvm_cbe_buf;
  return _121;
}


void deconv(double* llvm_cbe_g, uint32_t llvm_cbe_lg, double* llvm_cbe_f, uint32_t llvm_cbe_lf, double* llvm_cbe_out) {
  double* llvm_cbe_g_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_lg_2e_addr;    /* Address-exposed local */
  double* llvm_cbe_f_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_lf_2e_addr;    /* Address-exposed local */
  double* llvm_cbe_out_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_ns;    /* Address-exposed local */
  struct l_unnamed_1* llvm_cbe_g2;    /* Address-exposed local */
  struct l_unnamed_1* llvm_cbe_f2;    /* Address-exposed local */
  uint8_t* llvm_cbe_saved_stack;    /* Address-exposed local */
  uint64_t llvm_cbe___vla_expr0;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_i7;    /* Address-exposed local */
  double* _122;
  uint32_t _123;
  struct l_unnamed_1* llvm_cbe_call;
  double* _124;
  uint32_t _125;
  struct l_unnamed_1* llvm_cbe_call1;
  struct l_unnamed_1* _126;
  uint32_t _127;
  struct l_unnamed_1* _128;
  uint32_t _129;
  uint32_t _130;
  uint64_t _131;
  struct l_unnamed_1* llvm_cbe_vla;
  uint32_t _132;
  uint32_t _133;
  struct l_unnamed_1* _134;
  uint32_t _135;
  struct l_unnamed_1* llvm_cbe_arrayidx;
  double llvm_cbe_arrayidx_2e_real;
  double llvm_cbe_arrayidx_2e_imag;
  struct l_unnamed_1* _136;
  uint32_t _137;
  struct l_unnamed_1* llvm_cbe_arrayidx3;
  double llvm_cbe_arrayidx3_2e_real;
  double llvm_cbe_arrayidx3_2e_imag;
  struct l_unnamed_1 llvm_cbe_call4;
  uint32_t _138;
  struct l_unnamed_1* llvm_cbe_arrayidx6;
  uint32_t _139;
  uint32_t _140;
  uint32_t _141;
  uint32_t _142;
  uint32_t _143;
  uint32_t _144;
  uint32_t _145;
  uint32_t _146;
  struct l_unnamed_1* llvm_cbe_arrayidx12;
  double llvm_cbe_arrayidx12_2e_real;
  double llvm_cbe_arrayidx12_2e_imag;
  struct l_unnamed_1 llvm_cbe_call13;
  double _147;
  double* _148;
  uint32_t _149;
  uint32_t _150;
  struct l_unnamed_1* _151;
  struct l_unnamed_1* _152;
  uint8_t* _153;

  llvm_cbe_g_2e_addr = llvm_cbe_g;
  ;
  llvm_cbe_lg_2e_addr = llvm_cbe_lg;
  ;
  llvm_cbe_f_2e_addr = llvm_cbe_f;
  ;
  llvm_cbe_lf_2e_addr = llvm_cbe_lf;
  ;
  llvm_cbe_out_2e_addr = llvm_cbe_out;
  ;
  ;
  llvm_cbe_ns = 0;
  ;
  _122 = llvm_cbe_g_2e_addr;
  _123 = llvm_cbe_lg_2e_addr;
  llvm_cbe_call = pad_two(_122, _123, (&llvm_cbe_ns));
  llvm_cbe_g2 = llvm_cbe_call;
  ;
  _124 = llvm_cbe_f_2e_addr;
  _125 = llvm_cbe_lf_2e_addr;
  llvm_cbe_call1 = pad_two(_124, _125, (&llvm_cbe_ns));
  llvm_cbe_f2 = llvm_cbe_call1;
  _126 = llvm_cbe_g2;
  _127 = llvm_cbe_ns;
  fft(_126, _127);
  _128 = llvm_cbe_f2;
  _129 = llvm_cbe_ns;
  fft(_128, _129);
  _130 = llvm_cbe_ns;
  _131 = ((uint64_t)(uint32_t)_130);
  llvm_cbe_saved_stack = ((uint8_t*)/*NULL*/0);
  llvm_cbe_vla = (struct l_unnamed_1*) alloca(sizeof(struct l_unnamed_1) * (_131));
  llvm_cbe___vla_expr0 = _131;
  ;
  ;
  ;
  llvm_cbe_i = 0;

  _132 = llvm_cbe_i;
  _133 = llvm_cbe_ns;
while (((int32_t)_132) < ((int32_t)_133)){
  _134 = llvm_cbe_g2;
  _135 = llvm_cbe_i;
  llvm_cbe_arrayidx = (&_134[((int64_t)(((int64_t)(int32_t)_135)))]);
  llvm_cbe_arrayidx_2e_real = *((&llvm_cbe_arrayidx->field0));
  llvm_cbe_arrayidx_2e_imag = *((&llvm_cbe_arrayidx->field1));
  _136 = llvm_cbe_f2;
  _137 = llvm_cbe_i;
  llvm_cbe_arrayidx3 = (&_136[((int64_t)(((int64_t)(int32_t)_137)))]);
  llvm_cbe_arrayidx3_2e_real = *((&llvm_cbe_arrayidx3->field0));
  llvm_cbe_arrayidx3_2e_imag = *((&llvm_cbe_arrayidx3->field1));
  llvm_cbe_call4 = __divdc3(llvm_cbe_arrayidx_2e_real, llvm_cbe_arrayidx_2e_imag, llvm_cbe_arrayidx3_2e_real, llvm_cbe_arrayidx3_2e_imag);
  _138 = llvm_cbe_i;
  llvm_cbe_arrayidx6 = (&llvm_cbe_vla[((int64_t)(((int64_t)(int32_t)_138)))]);
  *((&llvm_cbe_arrayidx6->field0)) = ((llvm_cbe_call4.field0));
  *((&llvm_cbe_arrayidx6->field1)) = ((llvm_cbe_call4.field1));

  _139 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_139, 1));

  _132 = llvm_cbe_i;
  _133 = llvm_cbe_ns;
}
  _140 = llvm_cbe_ns;
  fft(llvm_cbe_vla, _140);
  ;
  llvm_cbe_i7 = 0;

  uint32_t llvm_cbe_sub;
  _141 = llvm_cbe_i7;
  _142 = llvm_cbe_lf_2e_addr;
  _143 = llvm_cbe_lg_2e_addr;
  llvm_cbe_sub = llvm_sub_u32(_142, _143);
while (((int32_t)_141) >= ((int32_t)llvm_cbe_sub)){
  _144 = llvm_cbe_i7;
  _145 = llvm_cbe_ns;
  _146 = llvm_cbe_ns;
  llvm_cbe_arrayidx12 = (&llvm_cbe_vla[((int64_t)(((int64_t)(int32_t)(llvm_srem_u32((llvm_add_u32(_144, _145)), _146)))))]);
  llvm_cbe_arrayidx12_2e_real = *((&llvm_cbe_arrayidx12->field0));
  llvm_cbe_arrayidx12_2e_imag = *((&llvm_cbe_arrayidx12->field1));
  llvm_cbe_call13 = __divdc3(llvm_cbe_arrayidx12_2e_real, llvm_cbe_arrayidx12_2e_imag, 32, 0);
  _147 = (llvm_cbe_call13.field1);
  _148 = llvm_cbe_out_2e_addr;
  _149 = llvm_cbe_i7;
  *((&_148[((int64_t)(((int64_t)(int32_t)(llvm_neg_u32(_149)))))])) = ((llvm_cbe_call13.field0));

  _150 = llvm_cbe_i7;
  llvm_cbe_i7 = (llvm_add_u32(_150, -1));

  _141 = llvm_cbe_i7;
  _142 = llvm_cbe_lf_2e_addr;
  _143 = llvm_cbe_lg_2e_addr;
  llvm_cbe_sub = llvm_sub_u32(_142, _143);
}
  _151 = llvm_cbe_g2;
  free((((uint8_t*)_151)));
  _152 = llvm_cbe_f2;
  free((((uint8_t*)_152)));
  _153 = llvm_cbe_saved_stack;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_21_double llvm_cbe_g __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_double llvm_cbe_f __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_6_double llvm_cbe_h __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_lg;    /* Address-exposed local */
  uint32_t llvm_cbe_lf;    /* Address-exposed local */
  uint32_t llvm_cbe_lh;    /* Address-exposed local */
  uint8_t* llvm_cbe_saved_stack;    /* Address-exposed local */
  uint64_t llvm_cbe___vla_expr0;    /* Address-exposed local */
  uint64_t llvm_cbe___vla_expr1;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_i7;    /* Address-exposed local */
  uint32_t llvm_cbe_i19;    /* Address-exposed local */
  uint32_t llvm_cbe_i33;    /* Address-exposed local */
  double llvm_cbe_call;
  uint8_t* _154;
  uint8_t* _155;
  uint8_t* _156;
  uint8_t* _157;
  struct l_array_6_double* _158;
  uint32_t _159;
  uint64_t _160;
  double* llvm_cbe_vla;
  uint32_t _161;
  uint64_t _162;
  double* llvm_cbe_vla1;
  uint32_t llvm_cbe_call2;
  uint32_t _163;
  uint32_t _164;
  uint32_t _165;
  double _166;
  uint32_t llvm_cbe_call3;
  uint32_t _167;
  uint32_t llvm_cbe_call4;
  uint32_t llvm_cbe_call5;
  uint32_t _168;
  uint32_t _169;
  uint32_t _170;
  uint32_t _171;
  uint32_t _172;
  double _173;
  uint32_t llvm_cbe_call13;
  uint32_t _174;
  uint32_t llvm_cbe_call17;
  uint32_t llvm_cbe_call18;
  uint32_t _175;
  uint32_t _176;
  uint32_t _177;
  double _178;
  uint32_t llvm_cbe_call25;
  uint32_t _179;
  uint32_t llvm_cbe_call29;
  uint32_t llvm_cbe_call30;
  uint32_t _180;
  uint32_t _181;
  uint32_t _182;
  uint32_t _183;
  uint32_t _184;
  double _185;
  uint32_t llvm_cbe_call39;
  uint32_t _186;
  uint32_t llvm_cbe_call43;
  uint8_t* _187;
  uint32_t _188;

  llvm_cbe_retval = 0;
  llvm_cbe_call = atan2(1, 1);
  PI = (llvm_cbe_call * 4);
  ;
  _154 = memcpy((((uint8_t*)(&llvm_cbe_g))), ((uint8_t*)(&__const_OC_main_OC_g)), 168);
  ;
  _155 = memcpy((((uint8_t*)(&llvm_cbe_f))), ((uint8_t*)(&__const_OC_main_OC_f)), 128);
  ;
  _156 = ((uint8_t*)(&llvm_cbe_h));
  _157 = memset(_156, 0, 48);
  _158 = ((struct l_array_6_double*)_156);
  *((&(*_158).array[((int32_t)0)])) = -8;
  *((&(*_158).array[((int32_t)1)])) = -9;
  *((&(*_158).array[((int32_t)2)])) = -3;
  *((&(*_158).array[((int32_t)3)])) = -1;
  *((&(*_158).array[((int32_t)4)])) = -6;
  *((&(*_158).array[((int32_t)5)])) = 7;
  ;
  llvm_cbe_lg = 21;
  ;
  llvm_cbe_lf = 16;
  ;
  llvm_cbe_lh = 6;
  _159 = llvm_cbe_lh;
  _160 = ((uint64_t)(uint32_t)_159);
  llvm_cbe_saved_stack = ((uint8_t*)/*NULL*/0);
  llvm_cbe_vla = (double*) alloca(sizeof(double) * (_160));
  llvm_cbe___vla_expr0 = _160;
  ;
  ;
  _161 = llvm_cbe_lf;
  _162 = ((uint64_t)(uint32_t)_161);
  llvm_cbe_vla1 = (double*) alloca(sizeof(double) * (_162));
  llvm_cbe___vla_expr1 = _162;
  ;
  ;
  llvm_cbe_call2 = printf(((&_OC_str.array[((int64_t)0)])));
  ;
  llvm_cbe_i = 0;

  _163 = llvm_cbe_i;
  _164 = llvm_cbe_lf;
while (((int32_t)_163) < ((int32_t)_164)){
  _165 = llvm_cbe_i;
  _166 = *((&llvm_cbe_f.array[((int64_t)(((int64_t)(int32_t)_165)))]));
  llvm_cbe_call3 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _166);

  _167 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_167, 1));

  _163 = llvm_cbe_i;
  _164 = llvm_cbe_lf;
}
  llvm_cbe_call4 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  llvm_cbe_call5 = printf(((&_OC_str_OC_3.array[((int64_t)0)])));
  _168 = llvm_cbe_lg;
  _169 = llvm_cbe_lh;
  deconv(((&llvm_cbe_g.array[((int64_t)0)])), _168, ((&llvm_cbe_h.array[((int64_t)0)])), _169, llvm_cbe_vla1);
  ;
  llvm_cbe_i7 = 0;

  _170 = llvm_cbe_i7;
  _171 = llvm_cbe_lf;
while (((int32_t)_170) < ((int32_t)_171)){
  _172 = llvm_cbe_i7;
  _173 = *((&llvm_cbe_vla1[((int64_t)(((int64_t)(int32_t)_172)))]));
  llvm_cbe_call13 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _173);

  _174 = llvm_cbe_i7;
  llvm_cbe_i7 = (llvm_add_u32(_174, 1));

  _170 = llvm_cbe_i7;
  _171 = llvm_cbe_lf;
}
  llvm_cbe_call17 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  llvm_cbe_call18 = printf(((&_OC_str_OC_4.array[((int64_t)0)])));
  ;
  llvm_cbe_i19 = 0;

  _175 = llvm_cbe_i19;
  _176 = llvm_cbe_lh;
while (((int32_t)_175) < ((int32_t)_176)){
  _177 = llvm_cbe_i19;
  _178 = *((&llvm_cbe_h.array[((int64_t)(((int64_t)(int32_t)_177)))]));
  llvm_cbe_call25 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _178);

  _179 = llvm_cbe_i19;
  llvm_cbe_i19 = (llvm_add_u32(_179, 1));

  _175 = llvm_cbe_i19;
  _176 = llvm_cbe_lh;
}
  llvm_cbe_call29 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  llvm_cbe_call30 = printf(((&_OC_str_OC_5.array[((int64_t)0)])));
  _180 = llvm_cbe_lg;
  _181 = llvm_cbe_lf;
  deconv(((&llvm_cbe_g.array[((int64_t)0)])), _180, ((&llvm_cbe_f.array[((int64_t)0)])), _181, llvm_cbe_vla);
  ;
  llvm_cbe_i33 = 0;

  _182 = llvm_cbe_i33;
  _183 = llvm_cbe_lh;
while (((int32_t)_182) < ((int32_t)_183)){
  _184 = llvm_cbe_i33;
  _185 = *((&llvm_cbe_vla[((int64_t)(((int64_t)(int32_t)_184)))]));
  llvm_cbe_call39 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _185);

  _186 = llvm_cbe_i33;
  llvm_cbe_i33 = (llvm_add_u32(_186, 1));

  _182 = llvm_cbe_i33;
  _183 = llvm_cbe_lh;
}
  llvm_cbe_call43 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  _187 = llvm_cbe_saved_stack;
  _188 = llvm_cbe_retval;
  return _188;
}

