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
struct l_struct_struct_OC_tm;

/* Function definitions */

/* Types Definitions */
struct l_array_23_uint8_t {
  uint8_t array[23];
};
struct l_array_19_uint8_t {
  uint8_t array[19];
};
struct l_array_10_uint8_t {
  uint8_t array[10];
};
struct l_array_9_uint8_t {
  uint8_t array[9];
};
struct l_array_16_uint8_t {
  uint8_t array[16];
};
struct l_array_15_uint8_t {
  uint8_t array[15];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_12_uint8_t {
  uint8_t array[12];
};
struct l_array_14_uint8_t {
  uint8_t array[14];
};
struct l_array_12_uint32_t {
  uint32_t array[12];
};
struct l_struct_struct_OC_tm {
  uint32_t field0;
  uint32_t field1;
  uint32_t field2;
  uint32_t field3;
  uint32_t field4;
  uint32_t field5;
  uint32_t field6;
  uint32_t field7;
  uint32_t field8;
  uint64_t field9;
  uint8_t* field10;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint8_t* ddate(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
uint32_t sprintf(uint8_t*, uint8_t*, ...) __ATTRIBUTELIST__((nothrow));
uint32_t day_of_year(uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
uint64_t time(uint64_t*) __ATTRIBUTELIST__((nothrow));
struct l_struct_struct_OC_tm* localtime(uint64_t*) __ATTRIBUTELIST__((nothrow));
uint32_t atoi(uint8_t*) __ATTRIBUTELIST__((nothrow, pure));
uint32_t puts(uint8_t*);
void free(uint8_t*) __ATTRIBUTELIST__((nothrow));
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_23_uint8_t _OC_str = { "St. Tib's Day, YOLD %d" };
static struct l_array_19_uint8_t _OC_str_OC_1 = { "%s, %s %d, YOLD %d" };
static struct l_array_10_uint8_t _OC_str_OC_2 = { "Sweetmorn" };
static struct l_array_9_uint8_t _OC_str_OC_3 = { "Boomtime" };
static struct l_array_10_uint8_t _OC_str_OC_4 = { "Pungenday" };
static struct l_array_16_uint8_t _OC_str_OC_5 = { "Prickle-Prickle" };
static struct l_array_15_uint8_t _OC_str_OC_6 = { "Setting Orange" };
static struct l_array_6_uint8_t _OC_str_OC_7 = { "Chaos" };
static struct l_array_8_uint8_t _OC_str_OC_8 = { "Discord" };
static struct l_array_10_uint8_t _OC_str_OC_9 = { "Confusion" };
static struct l_array_12_uint8_t _OC_str_OC_10 = { "Bureaucracy" };
static struct l_array_14_uint8_t _OC_str_OC_11 = { "The Aftermath" };
static __MSALIGN__(16) struct l_array_12_uint32_t __const_OC_day_of_year_OC_month_lengths __attribute__((aligned(16))) = { { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 } };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint8_t* llvm_select_pu8(bool condition, uint8_t* iftrue, uint8_t* ifnot) {
  uint8_t* r;
  r = condition ? iftrue : ifnot;
  return r;
}
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
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

uint8_t* ddate(uint32_t llvm_cbe_y, uint32_t llvm_cbe_d) {
  uint8_t* llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_y_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_d_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_dyear;    /* Address-exposed local */
  uint8_t* llvm_cbe_result;    /* Address-exposed local */
  uint32_t _1;
  uint8_t* llvm_cbe_call;
  uint32_t _2;
  uint32_t _3;
  uint32_t _4;
  uint32_t _5;
  uint8_t* _6;
  uint32_t _7;
  uint32_t llvm_cbe_call6;
  uint8_t* _8;
  uint32_t _9;
  uint32_t _10;
  uint8_t* _11;
  uint32_t _12;
  uint32_t _13;
  uint32_t _14;
  uint32_t _15;
  uint64_t _16;
  uint8_t* llvm_cbe_cond;
  uint8_t* llvm_cbe_cond23;
  uint8_t* llvm_cbe_cond23__PHI_TEMPORARY;
  uint8_t* llvm_cbe_cond25;
  uint8_t* llvm_cbe_cond25__PHI_TEMPORARY;
  uint8_t* llvm_cbe_cond27;
  uint8_t* llvm_cbe_cond27__PHI_TEMPORARY;
  uint32_t _17;
  uint32_t _18;
  uint32_t llvm_cbe_sub;
  uint32_t _19;
  uint32_t llvm_cbe_cond33;
  uint32_t llvm_cbe_cond33__PHI_TEMPORARY;
  uint32_t _20;
  uint32_t _21;
  uint32_t llvm_cbe_sub40;
  uint32_t _22;
  uint32_t llvm_cbe_cond43;
  uint32_t llvm_cbe_cond43__PHI_TEMPORARY;
  uint32_t _23;
  uint32_t _24;
  uint32_t llvm_cbe_sub51;
  uint32_t _25;
  uint32_t llvm_cbe_cond54;
  uint32_t llvm_cbe_cond54__PHI_TEMPORARY;
  uint32_t _26;
  uint32_t _27;
  uint32_t llvm_cbe_sub62;
  uint32_t _28;
  uint32_t llvm_cbe_cond65;
  uint32_t llvm_cbe_cond65__PHI_TEMPORARY;
  uint64_t _29;
  uint8_t* llvm_cbe_cond68;
  uint8_t* llvm_cbe_cond70;
  uint8_t* llvm_cbe_cond70__PHI_TEMPORARY;
  uint8_t* llvm_cbe_cond72;
  uint8_t* llvm_cbe_cond72__PHI_TEMPORARY;
  uint8_t* llvm_cbe_cond74;
  uint8_t* llvm_cbe_cond74__PHI_TEMPORARY;
  uint32_t _30;
  uint32_t _31;
  uint32_t llvm_cbe_rem79;
  uint32_t llvm_cbe_cond81;
  uint32_t llvm_cbe_cond81__PHI_TEMPORARY;
  uint32_t _32;
  uint32_t llvm_cbe_call82;
  uint8_t* _33;
  uint8_t* _34;
  uint32_t _35;
  uint8_t* _36;
  uint32_t _37;
  uint8_t* _38;
  uint32_t _39;

  llvm_cbe_y_2e_addr = llvm_cbe_y;
  ;
  llvm_cbe_d_2e_addr = llvm_cbe_d;
  ;
  ;
  _1 = llvm_cbe_y_2e_addr;
  llvm_cbe_dyear = (llvm_add_u32(1166, _1));
  ;
  llvm_cbe_call = malloc(100);
  llvm_cbe_result = llvm_cbe_call;
  _2 = llvm_cbe_y_2e_addr;
  if (((((llvm_srem_u32(_2, 400)) == 0u)&1))) {
  _35 = llvm_cbe_d_2e_addr;
  if ((((_35 == 60u)&1))) {
  _6 = llvm_cbe_result;
  _7 = llvm_cbe_dyear;
  llvm_cbe_call6 = sprintf(_6, ((&_OC_str.array[((int64_t)0)])), _7);
  _8 = llvm_cbe_result;
  llvm_cbe_retval = _8;

  _34 = llvm_cbe_retval;
  return _34;
}
  _9 = llvm_cbe_d_2e_addr;
  if ((((((int32_t)_9) >= ((int32_t)60u))&1))) {
  _10 = llvm_cbe_d_2e_addr;
  llvm_cbe_d_2e_addr = (llvm_add_u32(_10, -1));

}


  _11 = llvm_cbe_result;
  _12 = llvm_cbe_d_2e_addr;
  if (((((llvm_srem_u32(_12, 5)) == 1u)&1))) {
  llvm_cbe_cond27__PHI_TEMPORARY = ((&_OC_str_OC_2.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _13 = llvm_cbe_d_2e_addr;
  if (((((llvm_srem_u32(_13, 5)) == 2u)&1))) {
  llvm_cbe_cond25__PHI_TEMPORARY = ((&_OC_str_OC_3.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _14 = llvm_cbe_d_2e_addr;
  if (((((llvm_srem_u32(_14, 5)) == 3u)&1))) {
  llvm_cbe_cond23__PHI_TEMPORARY = ((&_OC_str_OC_4.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _15 = llvm_cbe_d_2e_addr;
  _16 = ((uint64_t)(bool)((((llvm_srem_u32(_15, 5)) == 4u)&1)));
  llvm_cbe_cond = llvm_select_pu8(((((llvm_srem_u32(_15, 5)) == 4u)&1)), ((&_OC_str_OC_5.array[((int64_t)0)])), ((&_OC_str_OC_6.array[((int64_t)0)])));
  llvm_cbe_cond23__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
}
}
  } else {
  _3 = llvm_cbe_y_2e_addr;
  if (((((llvm_srem_u32(_3, 4)) == 0u)&1))) {
  _4 = llvm_cbe_y_2e_addr;
  if (((((llvm_srem_u32(_4, 100)) != 0u)&1))) {
  _5 = llvm_cbe_d_2e_addr;
  if ((((_5 == 60u)&1))) {
  _34 = llvm_cbe_retval;
  return _34;
}
  } else {
  _36 = llvm_cbe_result;
  _37 = llvm_cbe_d_2e_addr;
  if (((((llvm_srem_u32(_37, 5)) == 1u)&1))) {
  llvm_cbe_cond27__PHI_TEMPORARY = ((&_OC_str_OC_2.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _13 = llvm_cbe_d_2e_addr;
  if (((((llvm_srem_u32(_13, 5)) == 2u)&1))) {
  } else {
}
  llvm_cbe_cond25__PHI_TEMPORARY = ((&_OC_str_OC_3.array[((int64_t)0)]));   /* for PHI node */

  _14 = llvm_cbe_d_2e_addr;
  if (((((llvm_srem_u32(_14, 5)) == 3u)&1))) {
  } else {
}
  llvm_cbe_cond25 = llvm_cbe_cond25__PHI_TEMPORARY;
  llvm_cbe_cond27__PHI_TEMPORARY = llvm_cbe_cond25;   /* for PHI node */

  llvm_cbe_cond23__PHI_TEMPORARY = ((&_OC_str_OC_4.array[((int64_t)0)]));   /* for PHI node */

  _15 = llvm_cbe_d_2e_addr;
  _16 = ((uint64_t)(bool)((((llvm_srem_u32(_15, 5)) == 4u)&1)));
  llvm_cbe_cond = llvm_select_pu8(((((llvm_srem_u32(_15, 5)) == 4u)&1)), ((&_OC_str_OC_5.array[((int64_t)0)])), ((&_OC_str_OC_6.array[((int64_t)0)])));
  llvm_cbe_cond23__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
}
  } else {
  _38 = llvm_cbe_result;
  _39 = llvm_cbe_d_2e_addr;
  if (((((llvm_srem_u32(_39, 5)) == 1u)&1))) {
  llvm_cbe_cond27__PHI_TEMPORARY = ((&_OC_str_OC_2.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _13 = llvm_cbe_d_2e_addr;
  if (((((llvm_srem_u32(_13, 5)) == 2u)&1))) {
  } else {
}
  llvm_cbe_cond25__PHI_TEMPORARY = ((&_OC_str_OC_3.array[((int64_t)0)]));   /* for PHI node */

  _14 = llvm_cbe_d_2e_addr;
  if (((((llvm_srem_u32(_14, 5)) == 3u)&1))) {
  } else {
}
  llvm_cbe_cond25 = llvm_cbe_cond25__PHI_TEMPORARY;
  llvm_cbe_cond27__PHI_TEMPORARY = llvm_cbe_cond25;   /* for PHI node */

  llvm_cbe_cond23__PHI_TEMPORARY = ((&_OC_str_OC_4.array[((int64_t)0)]));   /* for PHI node */

  _15 = llvm_cbe_d_2e_addr;
  _16 = ((uint64_t)(bool)((((llvm_srem_u32(_15, 5)) == 4u)&1)));
  llvm_cbe_cond = llvm_select_pu8(((((llvm_srem_u32(_15, 5)) == 4u)&1)), ((&_OC_str_OC_5.array[((int64_t)0)])), ((&_OC_str_OC_6.array[((int64_t)0)])));
  llvm_cbe_cond23__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
}
}
  llvm_cbe_cond23 = llvm_cbe_cond23__PHI_TEMPORARY;
  llvm_cbe_cond25__PHI_TEMPORARY = llvm_cbe_cond23;   /* for PHI node */

  llvm_cbe_cond27 = llvm_cbe_cond27__PHI_TEMPORARY;
  _17 = llvm_cbe_d_2e_addr;
  if (((((llvm_srem_u32(_17, 73)) == 0u)&1))) {
  _18 = llvm_cbe_d_2e_addr;
  llvm_cbe_sub = llvm_sub_u32(_18, 1);
  llvm_cbe_cond33__PHI_TEMPORARY = llvm_cbe_sub;   /* for PHI node */

  } else {
  _19 = llvm_cbe_d_2e_addr;
  llvm_cbe_cond33__PHI_TEMPORARY = _19;   /* for PHI node */

}
  llvm_cbe_cond33 = llvm_cbe_cond33__PHI_TEMPORARY;
  if (((((llvm_sdiv_u32(llvm_cbe_cond33, 73)) == 0u)&1))) {
  llvm_cbe_cond74__PHI_TEMPORARY = ((&_OC_str_OC_7.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _20 = llvm_cbe_d_2e_addr;
  if (((((llvm_srem_u32(_20, 73)) == 0u)&1))) {
  _21 = llvm_cbe_d_2e_addr;
  llvm_cbe_sub40 = llvm_sub_u32(_21, 1);
  llvm_cbe_cond43__PHI_TEMPORARY = llvm_cbe_sub40;   /* for PHI node */

  } else {
  _22 = llvm_cbe_d_2e_addr;
  llvm_cbe_cond43__PHI_TEMPORARY = _22;   /* for PHI node */

}
}
  llvm_cbe_cond43 = llvm_cbe_cond43__PHI_TEMPORARY;
  if (((((llvm_sdiv_u32(llvm_cbe_cond43, 73)) == 1u)&1))) {
  llvm_cbe_cond72__PHI_TEMPORARY = ((&_OC_str_OC_8.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _23 = llvm_cbe_d_2e_addr;
  if (((((llvm_srem_u32(_23, 73)) == 0u)&1))) {
  _24 = llvm_cbe_d_2e_addr;
  llvm_cbe_sub51 = llvm_sub_u32(_24, 1);
  llvm_cbe_cond54__PHI_TEMPORARY = llvm_cbe_sub51;   /* for PHI node */

  } else {
  _25 = llvm_cbe_d_2e_addr;
  llvm_cbe_cond54__PHI_TEMPORARY = _25;   /* for PHI node */

}
}
  llvm_cbe_cond54 = llvm_cbe_cond54__PHI_TEMPORARY;
  if (((((llvm_sdiv_u32(llvm_cbe_cond54, 73)) == 2u)&1))) {
  llvm_cbe_cond70__PHI_TEMPORARY = ((&_OC_str_OC_9.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _26 = llvm_cbe_d_2e_addr;
  if (((((llvm_srem_u32(_26, 73)) == 0u)&1))) {
  _27 = llvm_cbe_d_2e_addr;
  llvm_cbe_sub62 = llvm_sub_u32(_27, 1);
  llvm_cbe_cond65__PHI_TEMPORARY = llvm_cbe_sub62;   /* for PHI node */

  } else {
  _28 = llvm_cbe_d_2e_addr;
  llvm_cbe_cond65__PHI_TEMPORARY = _28;   /* for PHI node */

}
}
  llvm_cbe_cond65 = llvm_cbe_cond65__PHI_TEMPORARY;
  _29 = ((uint64_t)(bool)((((llvm_sdiv_u32(llvm_cbe_cond65, 73)) == 3u)&1)));
  llvm_cbe_cond68 = llvm_select_pu8(((((llvm_sdiv_u32(llvm_cbe_cond65, 73)) == 3u)&1)), ((&_OC_str_OC_10.array[((int64_t)0)])), ((&_OC_str_OC_11.array[((int64_t)0)])));
  llvm_cbe_cond70__PHI_TEMPORARY = llvm_cbe_cond68;   /* for PHI node */

  llvm_cbe_cond70 = llvm_cbe_cond70__PHI_TEMPORARY;
  llvm_cbe_cond72__PHI_TEMPORARY = llvm_cbe_cond70;   /* for PHI node */

  llvm_cbe_cond72 = llvm_cbe_cond72__PHI_TEMPORARY;
  llvm_cbe_cond74__PHI_TEMPORARY = llvm_cbe_cond72;   /* for PHI node */

  llvm_cbe_cond74 = llvm_cbe_cond74__PHI_TEMPORARY;
  _30 = llvm_cbe_d_2e_addr;
  if (((((llvm_srem_u32(_30, 73)) == 0u)&1))) {
  llvm_cbe_cond81__PHI_TEMPORARY = 73;   /* for PHI node */

  } else {
  _31 = llvm_cbe_d_2e_addr;
  llvm_cbe_rem79 = llvm_srem_u32(_31, 73);
  llvm_cbe_cond81__PHI_TEMPORARY = llvm_cbe_rem79;   /* for PHI node */

}
  llvm_cbe_cond81 = llvm_cbe_cond81__PHI_TEMPORARY;
  _32 = llvm_cbe_dyear;
  llvm_cbe_call82 = sprintf(_11, ((&_OC_str_OC_1.array[((int64_t)0)])), llvm_cbe_cond27, llvm_cbe_cond74, llvm_cbe_cond81, _32);
  _33 = llvm_cbe_result;
  llvm_cbe_retval = _33;

  _34 = llvm_cbe_retval;
  return _34;
}


uint32_t day_of_year(uint32_t llvm_cbe_y, uint32_t llvm_cbe_m, uint32_t llvm_cbe_d) {
  uint32_t llvm_cbe_y_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_m_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_d_2e_addr;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_12_uint32_t llvm_cbe_month_lengths __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _40;
  uint32_t _41;
  uint32_t _42;
  uint32_t _43;
  uint32_t _44;
  uint32_t _45;
  uint32_t _46;
  uint32_t _47;
  uint32_t _48;
  uint32_t _49;
  uint32_t _50;
  uint32_t _51;
  uint32_t _52;

  llvm_cbe_y_2e_addr = llvm_cbe_y;
  ;
  llvm_cbe_m_2e_addr = llvm_cbe_m;
  ;
  llvm_cbe_d_2e_addr = llvm_cbe_d;
  ;
  ;
  _40 = memcpy((((uint8_t*)(&llvm_cbe_month_lengths))), ((uint8_t*)(&__const_OC_day_of_year_OC_month_lengths)), 48);

  _41 = llvm_cbe_m_2e_addr;
while (((int32_t)_41) > ((int32_t)1u)){
  _42 = llvm_cbe_m_2e_addr;
  _43 = *((&llvm_cbe_month_lengths.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_42, 2)))))]));
  _44 = llvm_cbe_d_2e_addr;
  llvm_cbe_d_2e_addr = (llvm_add_u32(_44, _43));
  _45 = llvm_cbe_m_2e_addr;
  if ((((_45 == 3u)&1))) {
  _46 = llvm_cbe_y_2e_addr;
  if (((((llvm_srem_u32(_46, 400)) == 0u)&1))) {
  _52 = llvm_cbe_d_2e_addr;
  llvm_cbe_d_2e_addr = (llvm_add_u32(_52, 1));


  } else {
  _47 = llvm_cbe_y_2e_addr;
  if (((((llvm_srem_u32(_47, 4)) == 0u)&1))) {
  _48 = llvm_cbe_y_2e_addr;
  if (((((llvm_srem_u32(_48, 100)) != 0u)&1))) {
  _49 = llvm_cbe_d_2e_addr;
  llvm_cbe_d_2e_addr = (llvm_add_u32(_49, 1));


  } else {

}
  } else {

}
}
  } else {

}
  _50 = llvm_cbe_m_2e_addr;
  llvm_cbe_m_2e_addr = (llvm_add_u32(_50, -1));

  _41 = llvm_cbe_m_2e_addr;
}
  _51 = llvm_cbe_d_2e_addr;
  return _51;
}


int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argc = (uint32_t)argc;
  uint8_t** llvm_cbe_argv = (uint8_t**)argv;
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_argc_2e_addr;    /* Address-exposed local */
  uint8_t** llvm_cbe_argv_2e_addr;    /* Address-exposed local */
  uint64_t llvm_cbe_now;    /* Address-exposed local */
  struct l_struct_struct_OC_tm* llvm_cbe_now_time;    /* Address-exposed local */
  uint32_t llvm_cbe_year;    /* Address-exposed local */
  uint32_t llvm_cbe_doy;    /* Address-exposed local */
  uint8_t* llvm_cbe_result;    /* Address-exposed local */
  uint32_t _53;
  uint64_t llvm_cbe_call;
  struct l_struct_struct_OC_tm* llvm_cbe_call1;
  struct l_struct_struct_OC_tm* _54;
  uint32_t _55;
  struct l_struct_struct_OC_tm* _56;
  uint32_t _57;
  uint32_t _58;
  uint8_t** _59;
  uint8_t* _60;
  uint32_t llvm_cbe_call5;
  uint8_t** _61;
  uint8_t* _62;
  uint32_t llvm_cbe_call7;
  uint8_t** _63;
  uint8_t* _64;
  uint32_t llvm_cbe_call9;
  uint8_t** _65;
  uint8_t* _66;
  uint32_t llvm_cbe_call11;
  uint32_t llvm_cbe_call12;
  uint32_t _67;
  uint32_t _68;
  uint8_t* llvm_cbe_call14;
  uint8_t* _69;
  uint32_t llvm_cbe_call15;
  uint8_t* _70;

  llvm_cbe_retval = 0;
  llvm_cbe_argc_2e_addr = llvm_cbe_argc;
  ;
  llvm_cbe_argv_2e_addr = llvm_cbe_argv;
  ;
  ;
  ;
  ;
  ;
  _53 = llvm_cbe_argc_2e_addr;
  if ((((_53 == 1u)&1))) {
  llvm_cbe_call = time(((uint64_t*)/*NULL*/0));
  llvm_cbe_now = llvm_cbe_call;
  llvm_cbe_call1 = localtime((&llvm_cbe_now));
  llvm_cbe_now_time = llvm_cbe_call1;
  _54 = llvm_cbe_now_time;
  _55 = *((&_54->field5));
  llvm_cbe_year = (llvm_add_u32(_55, 1900));
  _56 = llvm_cbe_now_time;
  _57 = *((&_56->field7));
  llvm_cbe_doy = (llvm_add_u32(_57, 1));

  ;
  _67 = llvm_cbe_year;
  _68 = llvm_cbe_doy;
  llvm_cbe_call14 = ddate(_67, _68);
  llvm_cbe_result = llvm_cbe_call14;
  _69 = llvm_cbe_result;
  llvm_cbe_call15 = puts(_69);
  _70 = llvm_cbe_result;
  free(_70);
  return 0;
}
  _58 = llvm_cbe_argc_2e_addr;
  if (!(((_58 == 4u)&1))) {
  _59 = llvm_cbe_argv_2e_addr;
  _60 = *((&_59[((int64_t)1)]));
  llvm_cbe_call5 = atoi(_60);
  llvm_cbe_year = llvm_cbe_call5;
  _61 = llvm_cbe_argv_2e_addr;
  _62 = *((&_61[((int64_t)1)]));
  llvm_cbe_call7 = atoi(_62);
  _63 = llvm_cbe_argv_2e_addr;
  _64 = *((&_63[((int64_t)2)]));
  llvm_cbe_call9 = atoi(_64);
  _65 = llvm_cbe_argv_2e_addr;
  _66 = *((&_65[((int64_t)3)]));
  llvm_cbe_call11 = atoi(_66);
  llvm_cbe_call12 = day_of_year(llvm_cbe_call7, llvm_cbe_call9, llvm_cbe_call11);
  llvm_cbe_doy = llvm_cbe_call12;

}

  ;
  _67 = llvm_cbe_year;
  _68 = llvm_cbe_doy;
  llvm_cbe_call14 = ddate(_67, _68);
  llvm_cbe_result = llvm_cbe_call14;
  _69 = llvm_cbe_result;
  llvm_cbe_call15 = puts(_69);
  _70 = llvm_cbe_result;
  free(_70);
  return 0;
}

