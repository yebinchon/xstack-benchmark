/* Provide Declarations */
#include <stdint.h>
#ifndef __cplusplus
typedef unsigned char bool;
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

static __forceinline int llvm_fcmp_olt(double X, double Y) { return X <  Y; }
static __forceinline int llvm_fcmp_ole(double X, double Y) { return X <= Y; }
static __forceinline int llvm_fcmp_oge(double X, double Y) { return X >= Y; }


/* Global Declarations */

/* Types Declarations */
struct l_struct_struct_OC__IO_FILE;

/* Function definitions */

/* Types Definitions */
struct l_array_1_uint8_t {
  uint8_t array[1];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};
struct l_struct_struct_OC__IO_FILE {
  uint32_t field0;
  uint8_t* field1;
  uint8_t* field2;
  uint8_t* field3;
  uint8_t* field4;
  uint8_t* field5;
  uint8_t* field6;
  uint8_t* field7;
  uint8_t* field8;
  uint8_t* field9;
  uint8_t* field10;
  uint8_t* field11;
  void* field12;
  struct l_struct_struct_OC__IO_FILE* field13;
  uint32_t field14;
  uint32_t field15;
  uint64_t field16;
  uint16_t field17;
  uint8_t field18;
  struct l_array_1_uint8_t field19;
  uint8_t* field20;
  uint64_t field21;
  void* field22;
  void* field23;
  struct l_struct_struct_OC__IO_FILE* field24;
  uint8_t* field25;
  uint64_t field26;
  uint32_t field27;
  struct l_array_20_uint8_t field28;
};
struct l_array_4_uint32_t {
  uint32_t array[4];
};
struct l_array_8_double {
  double array[8];
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_16_uint8_t {
  uint8_t array[16];
};
struct l_array_8_uint32_t {
  uint32_t array[8];
};
struct l_array_2_double {
  double array[2];
};
struct l_array_3_double {
  double array[3];
};
struct l_array_65536_uint8_t {
  uint8_t array[65536];
};

/* External Global Variable Declarations */

/* Function Declarations */
void noise_init(void) __ATTRIBUTELIST__((noinline, nothrow));
double sqrt(double) __ATTRIBUTELIST__((nothrow));
double noise(double*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void hashed(uint32_t*, uint32_t*, uint32_t);
double get_noise2(double, double) __ATTRIBUTELIST__((noinline, nothrow));
double get_noise3(double, double, double) __ATTRIBUTELIST__((noinline, nothrow));
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
struct l_struct_struct_OC__IO_FILE* fopen(uint8_t*, uint8_t*);
uint32_t fprintf(struct l_struct_struct_OC__IO_FILE*, uint8_t*, ...);
uint64_t fwrite(uint8_t*, uint64_t, uint64_t, struct l_struct_struct_OC__IO_FILE*);
uint32_t fclose(struct l_struct_struct_OC__IO_FILE*);


/* Global Variable Definitions and Initialization */
__MSALIGN__(16) struct l_array_4_uint32_t g __attribute__((aligned(16))) = { { -1, 1, -1, 1 } };
__MSALIGN__(16) struct l_array_8_double scale __attribute__((aligned(16))) __ATTRIBUTE_WEAK__;
__MSALIGN__(16) struct l_array_8_double scale_u __attribute__((aligned(16))) __ATTRIBUTE_WEAK__;
static struct l_array_8_uint8_t _OC_str = { "out.pgm" };
static struct l_array_3_uint8_t _OC_str_OC_1 = { "w+" };
static struct l_array_16_uint8_t _OC_str_OC_2 = { "P5\n256 256\n255\n" };


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
static __forceinline double llvm_OC_floor_OC_f64(double a) {
  double r;
  r = floor(a);
  return r;
}


/* Function Bodies */

void noise_init(void) {
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  double llvm_cbe_call;
  double _1;
  double llvm_cbe_call6;

  ;
  i__PHI_TEMPORARY = 1;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)8u)){
  llvm_cbe_call = sqrt((((double)(int32_t)(llvm_add_u32(i, 1)))));
  *((&scale.array[((int64_t)(((int64_t)(int32_t)i)))])) = (1 / (1 + llvm_cbe_call));
  _1 = *((&scale.array[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call6 = sqrt((((double)(int32_t)(llvm_add_u32(i, 1)))));
  *((&scale_u.array[((int64_t)(((int64_t)(int32_t)i)))])) = (_1 / llvm_cbe_call6);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return;
}


double noise(double* llvm_cbe_x, uint32_t llvm_cbe_d) {
  __MSALIGN__(16) struct l_array_8_uint32_t llvm_cbe_n __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_8_uint32_t llvm_cbe_o __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_8_uint32_t llvm_cbe_g __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_8_double llvm_cbe_u __attribute__((aligned(16)));    /* Address-exposed local */
  double s;
  double s__PHI_TEMPORARY;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  double _2;
  double _3;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  double _4;
  double t;
  double _5;
  uint32_t llvm_cbe_conv;
  uint32_t llvm_cbe_i_2e_1;
  uint32_t llvm_cbe_i_2e_1__PHI_TEMPORARY;
  uint32_t _6;
  double _7;
  uint32_t _8;
  double _9;
  uint32_t tmp;
  uint32_t _10;
  uint32_t _11;
  double _12;
  double ret;
  double ret__PHI_TEMPORARY;
  double _13;
  uint32_t _14;
  double t__PHI_TEMPORARY;
  double _15;
  double _16;
  double r;
  double r__PHI_TEMPORARY;
  uint32_t _17;
  uint32_t _18;
  double _19;
  double _20;
  double llvm_cbe_fneg;
  double llvm_cbe_cond;
  double llvm_cbe_cond__PHI_TEMPORARY;
  uint32_t _21;
  uint32_t* llvm_cbe_arrayidx144;
  uint32_t _22;
  double _23;

  ;
  ;
  ;
  ;
  ;
  ;
  ;
  ;
  s__PHI_TEMPORARY = 0;   /* for PHI node */
  j__PHI_TEMPORARY = 0;   /* for PHI node */

  s = s__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)j) < ((int32_t)llvm_cbe_d)){
  _2 = *((&llvm_cbe_x[((int64_t)(((int64_t)(int32_t)j)))]));
  s = s + _2;
  ;

  j = llvm_add_u32(j, 1);
  ;
  s__PHI_TEMPORARY = s;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */

  s = s__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
}
  _3 = *((&scale.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_d)))]));
  s = s * _3;
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)llvm_cbe_d)){
  *((&llvm_cbe_o.array[((int64_t)(((int64_t)(int32_t)i)))])) = i;
  _4 = *((&llvm_cbe_x[((int64_t)(((int64_t)(int32_t)i)))]));
  t = _4 + s;
  ;
  _5 = llvm_OC_floor_OC_f64(t);
  llvm_cbe_conv = ((int32_t)_5);
  *((&llvm_cbe_n.array[((int64_t)(((int64_t)(int32_t)i)))])) = llvm_cbe_conv;
  *((&llvm_cbe_u.array[((int64_t)(((int64_t)(int32_t)i)))])) = (t - (((double)(int32_t)llvm_cbe_conv)));

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  *((&llvm_cbe_o.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_d)))])) = 0;
  ;
  llvm_cbe_i_2e_1__PHI_TEMPORARY = 0;   /* for PHI node */

  uint32_t llvm_cbe_sub22;
  llvm_cbe_i_2e_1 = llvm_cbe_i_2e_1__PHI_TEMPORARY;
  ;
  llvm_cbe_sub22 = llvm_sub_u32(llvm_cbe_d, 1);
while (((int32_t)llvm_cbe_i_2e_1) < ((int32_t)llvm_cbe_sub22)){
  ;
  j__PHI_TEMPORARY = llvm_cbe_i_2e_1;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
while (((int32_t)j) < ((int32_t)llvm_cbe_d)){
  _6 = *((&llvm_cbe_o.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_i_2e_1)))]));
  _7 = *((&llvm_cbe_u.array[((int64_t)(((int64_t)(int32_t)_6)))]));
  _8 = *((&llvm_cbe_o.array[((int64_t)(((int64_t)(int32_t)j)))]));
  _9 = *((&llvm_cbe_u.array[((int64_t)(((int64_t)(int32_t)_8)))]));
  if ((((llvm_fcmp_olt(_7, _9))&1))) {
  tmp = *((&llvm_cbe_o.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_i_2e_1)))]));
  ;
  _10 = *((&llvm_cbe_o.array[((int64_t)(((int64_t)(int32_t)j)))]));
  *((&llvm_cbe_o.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_i_2e_1)))])) = _10;
  *((&llvm_cbe_o.array[((int64_t)(((int64_t)(int32_t)j)))])) = tmp;

}

  j = llvm_add_u32(j, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
}

  i = llvm_add_u32(llvm_cbe_i_2e_1, 1);
  ;
  llvm_cbe_i_2e_1__PHI_TEMPORARY = i;   /* for PHI node */

  llvm_cbe_i_2e_1 = llvm_cbe_i_2e_1__PHI_TEMPORARY;
  ;
  llvm_cbe_sub22 = llvm_sub_u32(llvm_cbe_d, 1);
}
  ;
  ;
  ;
  ;
  ;
  s__PHI_TEMPORARY = 0;   /* for PHI node */
  j__PHI_TEMPORARY = 0;   /* for PHI node */

  s = s__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)j) < ((int32_t)llvm_cbe_d)){
  _11 = *((&llvm_cbe_n.array[((int64_t)(((int64_t)(int32_t)j)))]));
  s = s + (((double)(int32_t)_11));
  ;

  j = llvm_add_u32(j, 1);
  ;
  s__PHI_TEMPORARY = s;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */

  s = s__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
}
  _12 = *((&scale_u.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_d)))]));
  s = s * _12;
  ;
  ;
  s__PHI_TEMPORARY = s;   /* for PHI node */
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  ret__PHI_TEMPORARY = 0;   /* for PHI node */

  s = s__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ret = ret__PHI_TEMPORARY;
  ;
  ;
  ;
while (((int32_t)i) <= ((int32_t)llvm_cbe_d)){
  ;
  j__PHI_TEMPORARY = 0;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
while (((int32_t)j) < ((int32_t)llvm_cbe_d)){
  _13 = *((&llvm_cbe_x[((int64_t)(((int64_t)(int32_t)j)))]));
  _14 = *((&llvm_cbe_n.array[((int64_t)(((int64_t)(int32_t)j)))]));
  *((&llvm_cbe_u.array[((int64_t)(((int64_t)(int32_t)j)))])) = ((_13 + s) - (((double)(int32_t)_14)));

  j = llvm_add_u32(j, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
}
  t = ((((double)(int32_t)llvm_cbe_d)) + 1) / (((double)(int32_t)(llvm_mul_u32(2, llvm_cbe_d))));
  ;
  ;
  j__PHI_TEMPORARY = 0;   /* for PHI node */
  t__PHI_TEMPORARY = t;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  t = t__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)j) < ((int32_t)llvm_cbe_d)){
  _15 = *((&llvm_cbe_u.array[((int64_t)(((int64_t)(int32_t)j)))]));
  _16 = *((&llvm_cbe_u.array[((int64_t)(((int64_t)(int32_t)j)))]));
  t = t - (_15 * _16);
  ;
  if ((((llvm_fcmp_ole(t, 0))&1))) {
  break;
  } else {

  j = llvm_add_u32(j, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */
  t__PHI_TEMPORARY = t;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  t = t__PHI_TEMPORARY;
  ;
  ;
  if (!(((((int32_t)j) < ((int32_t)llvm_cbe_d))&1))) {
  }

}
  j = j__PHI_TEMPORARY;
  t = t__PHI_TEMPORARY;
  ;
  ;
}
  t__PHI_TEMPORARY = t;   /* for PHI node */

  t = t__PHI_TEMPORARY;
  ;
  if ((((llvm_fcmp_oge(t, 0))&1))) {
  ;
  hashed(((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_g.array[((int64_t)0)])), llvm_cbe_d);
  ;
  r__PHI_TEMPORARY = 0;   /* for PHI node */
  j__PHI_TEMPORARY = 0;   /* for PHI node */

  r = r__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
  if (!(((((int32_t)j) < ((int32_t)llvm_cbe_d))&1))) {
  }

  _17 = *((&llvm_cbe_g.array[((int64_t)(((int64_t)(int32_t)j)))]));
  if ((((_17 != 0u)&1))) {
  _18 = *((&llvm_cbe_g.array[((int64_t)(((int64_t)(int32_t)j)))]));
  if ((((_18 == 1u)&1))) {
  _19 = *((&llvm_cbe_u.array[((int64_t)(((int64_t)(int32_t)j)))]));
  llvm_cbe_cond__PHI_TEMPORARY = _19;   /* for PHI node */

  } else {
  _20 = *((&llvm_cbe_u.array[((int64_t)(((int64_t)(int32_t)j)))]));
  llvm_cbe_fneg = -(_20);
  llvm_cbe_cond__PHI_TEMPORARY = llvm_cbe_fneg;   /* for PHI node */

}
}
  t = t * t;
  ;
  ret = ret + ((r * t) * t);
  ;
  ret__PHI_TEMPORARY = ret;   /* for PHI node */

  r = r__PHI_TEMPORARY;
  ;

}
  r = r__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)j) < ((int32_t)llvm_cbe_d)){
  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;
  r = r + llvm_cbe_cond;
  ;
  r__PHI_TEMPORARY = r;   /* for PHI node */

  j = llvm_add_u32(j, 1);
  ;
  r__PHI_TEMPORARY = r;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */

  r = r__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
}
  ret = ret__PHI_TEMPORARY;
  ;
  if ((((((int32_t)i) < ((int32_t)llvm_cbe_d))&1))) {
  _21 = *((&llvm_cbe_o.array[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_arrayidx144 = (&llvm_cbe_n.array[((int64_t)(((int64_t)(int32_t)_21)))]);
  _22 = *llvm_cbe_arrayidx144;
  *llvm_cbe_arrayidx144 = (llvm_add_u32(_22, 1));
  _23 = *((&scale_u.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_d)))]));
  s = s + _23;
  ;
  s__PHI_TEMPORARY = s;   /* for PHI node */

}
  s = s__PHI_TEMPORARY;
  ;

  i = llvm_add_u32(i, 1);
  ;
  s__PHI_TEMPORARY = s;   /* for PHI node */
  i__PHI_TEMPORARY = i;   /* for PHI node */
  ret__PHI_TEMPORARY = ret;   /* for PHI node */

  s = s__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ret = ret__PHI_TEMPORARY;
  ;
  ;
  ;
}
  return (ret * (((double)(int32_t)(llvm_mul_u32(llvm_cbe_d, llvm_cbe_d)))));
}


double get_noise2(double llvm_cbe_x, double llvm_cbe_y) {
  __MSALIGN__(16) struct l_array_2_double llvm_cbe_v __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t ws;
  uint32_t ws__PHI_TEMPORARY;
  double r;
  double r__PHI_TEMPORARY;
  double llvm_cbe_call;

  ;
  ;
  ;
  ;
  ;
  ;
  i__PHI_TEMPORARY = 1;   /* for PHI node */
  ws__PHI_TEMPORARY = 0;   /* for PHI node */
  r__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ws = ws__PHI_TEMPORARY;
  r = r__PHI_TEMPORARY;
  ;
  ;
  ;
while (((int32_t)i) <= ((int32_t)128u)){
  *((&llvm_cbe_v.array[((int64_t)0)])) = (llvm_cbe_x * (((double)(int32_t)i)));
  *((&llvm_cbe_v.array[((int64_t)1)])) = (llvm_cbe_y * (((double)(int32_t)i)));
  llvm_cbe_call = noise(((&llvm_cbe_v.array[((int64_t)0)])), 2);
  r = r + llvm_cbe_call;
  ;
  ws = llvm_add_u32(ws, 1);
  ;

  i = i << 1;
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  ws__PHI_TEMPORARY = ws;   /* for PHI node */
  r__PHI_TEMPORARY = r;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ws = ws__PHI_TEMPORARY;
  r = r__PHI_TEMPORARY;
  ;
  ;
  ;
}
  ;
  return (r / (((double)(int32_t)ws)));
}


double get_noise3(double llvm_cbe_x, double llvm_cbe_y, double llvm_cbe_z) {
  __MSALIGN__(16) struct l_array_3_double llvm_cbe_v __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t ws;
  uint32_t ws__PHI_TEMPORARY;
  double r;
  double r__PHI_TEMPORARY;
  double llvm_cbe_call;
  double w;
  double llvm_cbe_call8;

  ;
  ;
  ;
  ;
  ;
  ;
  ;
  i__PHI_TEMPORARY = 1;   /* for PHI node */
  ws__PHI_TEMPORARY = 0;   /* for PHI node */
  r__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ws = ws__PHI_TEMPORARY;
  r = r__PHI_TEMPORARY;
  ;
  ;
  ;
while (((int32_t)i) <= ((int32_t)32u)){
  *((&llvm_cbe_v.array[((int64_t)0)])) = (llvm_cbe_x * (((double)(int32_t)i)));
  *((&llvm_cbe_v.array[((int64_t)1)])) = (llvm_cbe_y * (((double)(int32_t)i)));
  *((&llvm_cbe_v.array[((int64_t)2)])) = (llvm_cbe_z * (((double)(int32_t)i)));
  llvm_cbe_call = sqrt((((double)(int32_t)i)));
  w = 1 / llvm_cbe_call;
  ;
  llvm_cbe_call8 = noise(((&llvm_cbe_v.array[((int64_t)0)])), 3);
  r = r + (llvm_cbe_call8 * w);
  ;
  ws = ((int32_t)((((double)(int32_t)ws)) + w));
  ;

  i = i << 1;
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  ws__PHI_TEMPORARY = ws;   /* for PHI node */
  r__PHI_TEMPORARY = r;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ws = ws__PHI_TEMPORARY;
  r = r__PHI_TEMPORARY;
  ;
  ;
  ;
}
  return (r / (((double)(int32_t)ws)));
}


int main(int argc, char ** argv) {
  uint32_t llvm_cbe_c = (uint32_t)argc;
  uint8_t** llvm_cbe_v = (uint8_t**)argv;
  __MSALIGN__(16) struct l_array_65536_uint8_t llvm_cbe_pix __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* p;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint8_t* p__PHI_TEMPORARY;
  double y;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  double x;
  double llvm_cbe_call;
  double z;
  double w;
  double w__PHI_TEMPORARY;
  struct l_struct_struct_OC__IO_FILE* fp;
  uint32_t llvm_cbe_call48;
  uint64_t llvm_cbe_call50;
  uint32_t llvm_cbe_call51;

  ;
  ;
  ;
  noise_init();
  p = (&llvm_cbe_pix.array[((int64_t)0)]);
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  p__PHI_TEMPORARY = p;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  p = p__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) < ((int32_t)65536u)){
  p = (&p[((int32_t)1)]);
  ;
  *p = 0;

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  p__PHI_TEMPORARY = p;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  p = p__PHI_TEMPORARY;
  ;
  ;
}
  p = (&llvm_cbe_pix.array[((int64_t)0)]);
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  p__PHI_TEMPORARY = p;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  p = p__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) < ((int32_t)256u)){
  y = (((double)(int32_t)(llvm_sub_u32(i, 128)))) / 125;
  ;
  ;
  p__PHI_TEMPORARY = p;   /* for PHI node */
  j__PHI_TEMPORARY = 0;   /* for PHI node */

  p = p__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)j) < ((int32_t)256u)){
  x = (((double)(int32_t)(llvm_sub_u32(j, 128)))) / 125;
  ;
  llvm_cbe_call = get_noise2(((((double)(int32_t)i)) / 256), ((((double)(int32_t)j)) / 256));
  *p = (((uint8_t)(((llvm_cbe_call + 1) / 6) * (((double)(int32_t)i)))));
  z = (1 - (x * x)) - (y * y);
  ;
  if ((((llvm_fcmp_olt(z, 0))&1))) {

  } else {
  z = sqrt(z);
  ;
  w = get_noise3(x, y, z);
  ;
  ;
  w = ((w + 1) / 2) * ((((1 + x) - y) + z) / 3.5);
  ;
  if ((((llvm_fcmp_olt(w, 0))&1))) {
  ;
  w__PHI_TEMPORARY = 0;   /* for PHI node */

}
  w = w__PHI_TEMPORARY;
  ;
  *p = (((uint8_t)(w * 255)));

}
  j = llvm_add_u32(j, 1);
  ;
  p = (&p[((int32_t)1)]);
  ;
  p__PHI_TEMPORARY = p;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */

  p = p__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  p__PHI_TEMPORARY = p;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  p = p__PHI_TEMPORARY;
  ;
  ;
}
  fp = fopen(((&_OC_str.array[((int64_t)0)])), ((&_OC_str_OC_1.array[((int64_t)0)])));
  ;
  llvm_cbe_call48 = fprintf(fp, ((&_OC_str_OC_2.array[((int64_t)0)])));
  llvm_cbe_call50 = fwrite(((&llvm_cbe_pix.array[((int64_t)0)])), 1, 65536, fp);
  llvm_cbe_call51 = fclose(fp);
  return 0;
}

