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
struct l_struct_struct_OC_digitime;
struct l_unnamed_1;

/* Function definitions */

/* Types Definitions */
struct l_struct_struct_OC_digitime {
  uint32_t field0;
  uint32_t field1;
  uint32_t field2;
};
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
  struct l_unnamed_1 llvm_cbe_tmp;    /* Address-exposed local */
  double totalSeconds;
  uint32_t _5;
  uint8_t* _6;
  struct l_unnamed_1 _7;

  ;
  ;
  totalSeconds = (86400 * llvm_cbe_angle) / 360;
  ;
  *((&llvm_cbe_retval.field2)) = (llvm_srem_u32((((int32_t)totalSeconds)), 60));
  _5 = *((&llvm_cbe_retval.field2));
  *((&llvm_cbe_retval.field1)) = (llvm_sdiv_u32((llvm_sub_u32((llvm_srem_u32((((int32_t)totalSeconds)), 3600)), _5)), 60));
  *((&llvm_cbe_retval.field0)) = (llvm_sdiv_u32((((int32_t)totalSeconds)), 3600));
  _6 = memcpy((((uint8_t*)(&llvm_cbe_tmp))), (((uint8_t*)(&llvm_cbe_retval))), 12);
  _7 = llvm_cbe_tmp;
  return _7;
}


double meanAngle(double* llvm_cbe_angles, uint32_t llvm_cbe_size) {
  double y_part;
  double y_part__PHI_TEMPORARY;
  double x_part;
  double x_part__PHI_TEMPORARY;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  double _8;
  double llvm_cbe_call;
  double _9;
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
  _8 = *((&llvm_cbe_angles[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call = cos(((_8 * 3.1415926535897931) / 180));
  x_part = x_part + llvm_cbe_call;
  ;
  _9 = *((&llvm_cbe_angles[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call5 = sin(((_9 * 3.1415926535897931) / 180));
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
  struct l_struct_struct_OC_digitime llvm_cbe_meanTime;    /* Address-exposed local */
  uint32_t llvm_cbe_inputs;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_arrayidx14_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_digitime llvm_cbe_tmp;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_tmp20;    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call1;
  uint32_t _10;
  uint8_t* llvm_cbe_call2;
  struct l_struct_struct_OC_digitime* set;
  uint32_t _11;
  uint8_t* llvm_cbe_call5;
  double* angleSet;
  uint32_t llvm_cbe_call6;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t _12;
  uint32_t llvm_cbe_call12;
  uint8_t* _13;
  uint64_t _14;
  uint32_t _15;
  double llvm_cbe_call15;
  uint32_t _16;
  double llvm_cbe_call18;
  struct l_unnamed_1 llvm_cbe_call19;
  uint8_t* _17;
  uint8_t* _18;
  uint32_t _19;
  uint32_t _20;
  uint32_t _21;
  uint32_t llvm_cbe_call24;

  ;
  ;
  ;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])));
  llvm_cbe_call1 = __isoc99_scanf(((&_OC_str_OC_1.array[((int64_t)0)])), (&llvm_cbe_inputs));
  _10 = llvm_cbe_inputs;
  llvm_cbe_call2 = malloc((llvm_mul_u64((((int64_t)(int32_t)_10)), 12)));
  set = ((struct l_struct_struct_OC_digitime*)llvm_cbe_call2);
  ;
  _11 = llvm_cbe_inputs;
  llvm_cbe_call5 = malloc((llvm_mul_u64((((int64_t)(int32_t)_11)), 8)));
  angleSet = ((double*)llvm_cbe_call5);
  ;
  llvm_cbe_call6 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  _12 = llvm_cbe_inputs;
while (((int32_t)i) < ((int32_t)_12)){
  llvm_cbe_call12 = __isoc99_scanf(((&_OC_str_OC_3.array[((int64_t)0)])), ((&((&set[((int64_t)(((int64_t)(int32_t)i)))]))->field0)), ((&((&set[((int64_t)(((int64_t)(int32_t)i)))]))->field1)), ((&((&set[((int64_t)(((int64_t)(int32_t)i)))]))->field2)));
  _13 = memcpy((((uint8_t*)(&llvm_cbe_arrayidx14_2e_coerce))), (((uint8_t*)((&set[((int64_t)(((int64_t)(int32_t)i)))])))), 12);
  _14 = __UNALIGNED_LOAD__(uint64_t, 4, ((&llvm_cbe_arrayidx14_2e_coerce.field0)));
  _15 = *((&llvm_cbe_arrayidx14_2e_coerce.field1));
  llvm_cbe_call15 = timeToDegrees(_14, _15);
  *((&angleSet[((int64_t)(((int64_t)(int32_t)i)))])) = llvm_cbe_call15;

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  _12 = llvm_cbe_inputs;
}
  _16 = llvm_cbe_inputs;
  llvm_cbe_call18 = meanAngle(angleSet, _16);
  llvm_cbe_call19 = timeFromDegrees((360 + llvm_cbe_call18));
  llvm_cbe_tmp20 = llvm_cbe_call19;
  _17 = memcpy((((uint8_t*)(&llvm_cbe_tmp))), (((uint8_t*)(&llvm_cbe_tmp20))), 12);
  _18 = memcpy((((uint8_t*)(&llvm_cbe_meanTime))), (((uint8_t*)(&llvm_cbe_tmp))), 12);
  _19 = *((&llvm_cbe_meanTime.field0));
  _20 = *((&llvm_cbe_meanTime.field1));
  _21 = *((&llvm_cbe_meanTime.field2));
  llvm_cbe_call24 = printf(((&_OC_str_OC_4.array[((int64_t)0)])), _19, _20, _21);
  return 0;
}

