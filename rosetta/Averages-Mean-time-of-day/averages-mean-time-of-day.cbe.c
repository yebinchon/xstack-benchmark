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
#define __UNALIGNED_LOAD__(type, align, op) *((type __unaligned*)op)
#else
#define __UNALIGNED_LOAD__(type, align, op) ((struct { type data __attribute__((packed, aligned(align))); }*)op)->data
#endif



/* Global Declarations */

/* Types Declarations */
struct l_unnamed_1;
struct l_struct_struct_OC_digitime;

/* Function definitions */

/* Types Definitions */
struct l_array_26_uint8_t {
  uint8_t array[26];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_59_uint8_t {
  uint8_t array[59];
};
struct l_array_9_uint8_t {
  uint8_t array[9];
};
struct l_array_30_uint8_t {
  uint8_t array[30];
};
struct l_unnamed_1 {
  uint64_t field0;
  uint32_t field1;
};
struct l_struct_struct_OC_digitime {
  uint32_t field0;
  uint32_t field1;
  uint32_t field2;
};

/* External Global Variable Declarations */

/* Function Declarations */
double timeToDegrees(uint64_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
struct l_unnamed_1 timeFromDegrees(double) __ATTRIBUTELIST__((noinline, nothrow));
double meanAngle(double*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
double cos(double) __ATTRIBUTELIST__((nothrow));
double sin(double) __ATTRIBUTELIST__((nothrow));
double atan2(double, double) __ATTRIBUTELIST__((nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint32_t __isoc99_scanf(uint8_t*, ...);
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_26_uint8_t _OC_str = { "Enter number of inputs : " };
static struct l_array_3_uint8_t _OC_str_OC_1 = { "%d" };
static struct l_array_59_uint8_t _OC_str_OC_2 = { "\n\nEnter the data separated by a space between each unit : " };
static struct l_array_9_uint8_t _OC_str_OC_3 = { "%d:%d:%d" };
static struct l_array_30_uint8_t _OC_str_OC_4 = { "\n\nThe mean time is : %d:%d:%d" };


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
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
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


/* Function Bodies */

double timeToDegrees(uint64_t llvm_cbe_time_2e_coerce0, uint32_t llvm_cbe_time_2e_coerce1) {
  struct l_struct_struct_OC_digitime llvm_cbe_time;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_coerce;    /* Address-exposed local */
  uint8_t* _1;
  uint32_t _2;
  uint32_t _3;
  uint32_t _4;

  __UNALIGNED_LOAD__(uint64_t, 4, ((&llvm_cbe_coerce.field0))) = llvm_cbe_time_2e_coerce0;
  *((&llvm_cbe_coerce.field1)) = llvm_cbe_time_2e_coerce1;
  _1 = memcpy((((uint8_t*)(&llvm_cbe_time))), (((uint8_t*)(&llvm_cbe_coerce))), 12);
  ;
  _2 = *((&llvm_cbe_time.field0));
  _3 = *((&llvm_cbe_time.field1));
  _4 = *((&llvm_cbe_time.field2));
  return ((((((double)(int32_t)(llvm_mul_u32(360, _2)))) / 24) + ((((double)(int32_t)(llvm_mul_u32(360, _3)))) / 1440)) + ((((double)(int32_t)(llvm_mul_u32(360, _4)))) / 86400));
}


struct l_unnamed_1 timeFromDegrees(double llvm_cbe_angle) {
  struct l_struct_struct_OC_digitime llvm_cbe_retval;    /* Address-exposed local */
  double llvm_cbe_angle_2e_addr;    /* Address-exposed local */
  double llvm_cbe_totalSeconds;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_tmp;    /* Address-exposed local */
  double _5;
  double _6;
  double _7;
  uint32_t _8;
  double _9;
  uint8_t* _10;
  struct l_unnamed_1 _11;

  llvm_cbe_angle_2e_addr = llvm_cbe_angle;
  ;
  ;
  ;
  _5 = llvm_cbe_angle_2e_addr;
  llvm_cbe_totalSeconds = ((86400 * _5) / 360);
  _6 = llvm_cbe_totalSeconds;
  *((&llvm_cbe_retval.field2)) = (llvm_srem_u32((((int32_t)_6)), 60));
  _7 = llvm_cbe_totalSeconds;
  _8 = *((&llvm_cbe_retval.field2));
  *((&llvm_cbe_retval.field1)) = (llvm_sdiv_u32((llvm_sub_u32((llvm_srem_u32((((int32_t)_7)), 3600)), _8)), 60));
  _9 = llvm_cbe_totalSeconds;
  *((&llvm_cbe_retval.field0)) = (llvm_sdiv_u32((((int32_t)_9)), 3600));
  _10 = memcpy((((uint8_t*)(&llvm_cbe_tmp))), (((uint8_t*)(&llvm_cbe_retval))), 12);
  _11 = llvm_cbe_tmp;
  return _11;
}


double meanAngle(double* llvm_cbe_angles, uint32_t llvm_cbe_size) {
  double* llvm_cbe_angles_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_size_2e_addr;    /* Address-exposed local */
  double llvm_cbe_y_part;    /* Address-exposed local */
  double llvm_cbe_x_part;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t _12;
  uint32_t _13;
  double* _14;
  uint32_t _15;
  double _16;
  double llvm_cbe_call;
  double _17;
  double* _18;
  uint32_t _19;
  double _20;
  double llvm_cbe_call5;
  double _21;
  uint32_t _22;
  double _23;
  uint32_t _24;
  double _25;
  uint32_t _26;
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

  _12 = llvm_cbe_i;
  _13 = llvm_cbe_size_2e_addr;
while (((int32_t)_12) < ((int32_t)_13)){
  _14 = llvm_cbe_angles_2e_addr;
  _15 = llvm_cbe_i;
  _16 = *((&_14[((int64_t)(((int64_t)(int32_t)_15)))]));
  llvm_cbe_call = cos(((_16 * 3.1415926535897931) / 180));
  _17 = llvm_cbe_x_part;
  llvm_cbe_x_part = (_17 + llvm_cbe_call);
  _18 = llvm_cbe_angles_2e_addr;
  _19 = llvm_cbe_i;
  _20 = *((&_18[((int64_t)(((int64_t)(int32_t)_19)))]));
  llvm_cbe_call5 = sin(((_20 * 3.1415926535897931) / 180));
  _21 = llvm_cbe_y_part;
  llvm_cbe_y_part = (_21 + llvm_cbe_call5);

  _22 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_22, 1));

  _12 = llvm_cbe_i;
  _13 = llvm_cbe_size_2e_addr;
}
  _23 = llvm_cbe_y_part;
  _24 = llvm_cbe_size_2e_addr;
  _25 = llvm_cbe_x_part;
  _26 = llvm_cbe_size_2e_addr;
  llvm_cbe_call10 = atan2((_23 / (((double)(int32_t)_24))), (_25 / (((double)(int32_t)_26))));
  return ((llvm_cbe_call10 * 180) / 3.1415926535897931);
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  struct l_struct_struct_OC_digitime* llvm_cbe_set;    /* Address-exposed local */
  struct l_struct_struct_OC_digitime llvm_cbe_meanTime;    /* Address-exposed local */
  uint32_t llvm_cbe_inputs;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  double* llvm_cbe_angleSet;    /* Address-exposed local */
  double llvm_cbe_angleMean;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_arrayidx14_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_digitime llvm_cbe_tmp;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_tmp20;    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call1;
  uint32_t _27;
  uint8_t* llvm_cbe_call2;
  uint32_t _28;
  uint8_t* llvm_cbe_call5;
  uint32_t llvm_cbe_call6;
  uint32_t _29;
  uint32_t _30;
  struct l_struct_struct_OC_digitime* _31;
  uint32_t _32;
  struct l_struct_struct_OC_digitime* _33;
  uint32_t _34;
  struct l_struct_struct_OC_digitime* _35;
  uint32_t _36;
  uint32_t llvm_cbe_call12;
  struct l_struct_struct_OC_digitime* _37;
  uint32_t _38;
  uint8_t* _39;
  uint64_t _40;
  uint32_t _41;
  double llvm_cbe_call15;
  double* _42;
  uint32_t _43;
  uint32_t _44;
  double* _45;
  uint32_t _46;
  double llvm_cbe_call18;
  struct l_unnamed_1 llvm_cbe_call19;
  uint8_t* _47;
  uint8_t* _48;
  uint32_t _49;
  uint32_t _50;
  uint32_t _51;
  uint32_t llvm_cbe_call24;

  llvm_cbe_retval = 0;
  ;
  ;
  ;
  ;
  ;
  ;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])));
  llvm_cbe_call1 = __isoc99_scanf(((&_OC_str_OC_1.array[((int64_t)0)])), (&llvm_cbe_inputs));
  _27 = llvm_cbe_inputs;
  llvm_cbe_call2 = malloc((llvm_mul_u64((((int64_t)(int32_t)_27)), 12)));
  llvm_cbe_set = (((struct l_struct_struct_OC_digitime*)llvm_cbe_call2));
  _28 = llvm_cbe_inputs;
  llvm_cbe_call5 = malloc((llvm_mul_u64((((int64_t)(int32_t)_28)), 8)));
  llvm_cbe_angleSet = (((double*)llvm_cbe_call5));
  llvm_cbe_call6 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  llvm_cbe_i = 0;

  _29 = llvm_cbe_i;
  _30 = llvm_cbe_inputs;
while (((int32_t)_29) < ((int32_t)_30)){
  _31 = llvm_cbe_set;
  _32 = llvm_cbe_i;
  _33 = llvm_cbe_set;
  _34 = llvm_cbe_i;
  _35 = llvm_cbe_set;
  _36 = llvm_cbe_i;
  llvm_cbe_call12 = __isoc99_scanf(((&_OC_str_OC_3.array[((int64_t)0)])), ((&((&_31[((int64_t)(((int64_t)(int32_t)_32)))]))->field0)), ((&((&_33[((int64_t)(((int64_t)(int32_t)_34)))]))->field1)), ((&((&_35[((int64_t)(((int64_t)(int32_t)_36)))]))->field2)));
  _37 = llvm_cbe_set;
  _38 = llvm_cbe_i;
  _39 = memcpy((((uint8_t*)(&llvm_cbe_arrayidx14_2e_coerce))), (((uint8_t*)((&_37[((int64_t)(((int64_t)(int32_t)_38)))])))), 12);
  _40 = __UNALIGNED_LOAD__(uint64_t, 4, ((&llvm_cbe_arrayidx14_2e_coerce.field0)));
  _41 = *((&llvm_cbe_arrayidx14_2e_coerce.field1));
  llvm_cbe_call15 = timeToDegrees(_40, _41);
  _42 = llvm_cbe_angleSet;
  _43 = llvm_cbe_i;
  *((&_42[((int64_t)(((int64_t)(int32_t)_43)))])) = llvm_cbe_call15;

  _44 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_44, 1));

  _29 = llvm_cbe_i;
  _30 = llvm_cbe_inputs;
}
  _45 = llvm_cbe_angleSet;
  _46 = llvm_cbe_inputs;
  llvm_cbe_call18 = meanAngle(_45, _46);
  llvm_cbe_call19 = timeFromDegrees((360 + llvm_cbe_call18));
  llvm_cbe_tmp20 = llvm_cbe_call19;
  _47 = memcpy((((uint8_t*)(&llvm_cbe_tmp))), (((uint8_t*)(&llvm_cbe_tmp20))), 12);
  _48 = memcpy((((uint8_t*)(&llvm_cbe_meanTime))), (((uint8_t*)(&llvm_cbe_tmp))), 12);
  _49 = *((&llvm_cbe_meanTime.field0));
  _50 = *((&llvm_cbe_meanTime.field1));
  _51 = *((&llvm_cbe_meanTime.field2));
  llvm_cbe_call24 = printf(((&_OC_str_OC_4.array[((int64_t)0)])), _49, _50, _51);
  return 0;
}

