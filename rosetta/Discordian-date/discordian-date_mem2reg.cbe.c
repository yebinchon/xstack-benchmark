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
  uint32_t dyear;
  uint8_t* result;
  uint32_t llvm_cbe_call6;
  uint32_t d;
  uint32_t d__PHI_TEMPORARY;
  uint64_t _1;
  uint8_t* llvm_cbe_cond;
  uint8_t* llvm_cbe_cond23;
  uint8_t* llvm_cbe_cond23__PHI_TEMPORARY;
  uint8_t* llvm_cbe_cond25;
  uint8_t* llvm_cbe_cond25__PHI_TEMPORARY;
  uint8_t* llvm_cbe_cond27;
  uint8_t* llvm_cbe_cond27__PHI_TEMPORARY;
  uint32_t llvm_cbe_sub;
  uint32_t llvm_cbe_cond33;
  uint32_t llvm_cbe_cond33__PHI_TEMPORARY;
  uint32_t llvm_cbe_sub40;
  uint32_t llvm_cbe_cond43;
  uint32_t llvm_cbe_cond43__PHI_TEMPORARY;
  uint32_t llvm_cbe_sub51;
  uint32_t llvm_cbe_cond54;
  uint32_t llvm_cbe_cond54__PHI_TEMPORARY;
  uint32_t llvm_cbe_sub62;
  uint32_t llvm_cbe_cond65;
  uint32_t llvm_cbe_cond65__PHI_TEMPORARY;
  uint64_t _2;
  uint8_t* llvm_cbe_cond68;
  uint8_t* llvm_cbe_cond70;
  uint8_t* llvm_cbe_cond70__PHI_TEMPORARY;
  uint8_t* llvm_cbe_cond72;
  uint8_t* llvm_cbe_cond72__PHI_TEMPORARY;
  uint8_t* llvm_cbe_cond74;
  uint8_t* llvm_cbe_cond74__PHI_TEMPORARY;
  uint32_t llvm_cbe_rem79;
  uint32_t llvm_cbe_cond81;
  uint32_t llvm_cbe_cond81__PHI_TEMPORARY;
  uint32_t llvm_cbe_call82;
  uint32_t llvm_cbe_d_2e_addr_2e_1_2e_splitted1;
  uint32_t llvm_cbe_d_2e_addr_2e_1_2e_splitted1__PHI_TEMPORARY;
  uint32_t llvm_cbe_d_2e_addr_2e_1_2e_splitted2;
  uint32_t llvm_cbe_d_2e_addr_2e_1_2e_splitted2__PHI_TEMPORARY;

  ;
  ;
  dyear = llvm_add_u32(1166, llvm_cbe_y);
  ;
  result = malloc(100);
  ;
  if (((((llvm_srem_u32(llvm_cbe_y, 400)) == 0u)&1))) {
  if ((((llvm_cbe_d == 60u)&1))) {
  llvm_cbe_call6 = sprintf(result, ((&_OC_str.array[((int64_t)0)])), dyear);

  return result;
}
  if ((((((int32_t)llvm_cbe_d) >= ((int32_t)60u))&1))) {
  d = llvm_add_u32(llvm_cbe_d, -1);
  ;
  d__PHI_TEMPORARY = d;   /* for PHI node */

}
  d = d__PHI_TEMPORARY;
  ;

  d__PHI_TEMPORARY = d;   /* for PHI node */

  d = d__PHI_TEMPORARY;
  ;
  if (((((llvm_srem_u32(d, 5)) == 1u)&1))) {
  llvm_cbe_cond27__PHI_TEMPORARY = ((&_OC_str_OC_2.array[((int64_t)0)]));   /* for PHI node */

  } else {
  if (((((llvm_srem_u32(d, 5)) == 2u)&1))) {
  llvm_cbe_cond25__PHI_TEMPORARY = ((&_OC_str_OC_3.array[((int64_t)0)]));   /* for PHI node */

  } else {
  if (((((llvm_srem_u32(d, 5)) == 3u)&1))) {
  llvm_cbe_cond23__PHI_TEMPORARY = ((&_OC_str_OC_4.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _1 = ((uint64_t)(bool)((((llvm_srem_u32(d, 5)) == 4u)&1)));
  llvm_cbe_cond = llvm_select_pu8(((((llvm_srem_u32(d, 5)) == 4u)&1)), ((&_OC_str_OC_5.array[((int64_t)0)])), ((&_OC_str_OC_6.array[((int64_t)0)])));
  llvm_cbe_cond23__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
}
}
  } else {
  if (((((llvm_srem_u32(llvm_cbe_y, 4)) == 0u)&1))) {
  if (((((llvm_srem_u32(llvm_cbe_y, 100)) != 0u)&1))) {
  if ((((llvm_cbe_d == 60u)&1))) {
  return result;
}
  } else {
    llvm_cbe_d_2e_addr_2e_1_2e_splitted1__PHI_TEMPORARY = llvm_cbe_d;   /* for PHI node */
  llvm_cbe_d_2e_addr_2e_1_2e_splitted1 = llvm_cbe_d_2e_addr_2e_1_2e_splitted1__PHI_TEMPORARY;
  ;
  if (((((llvm_srem_u32(llvm_cbe_d_2e_addr_2e_1_2e_splitted1, 5)) == 1u)&1))) {
  llvm_cbe_cond27__PHI_TEMPORARY = ((&_OC_str_OC_2.array[((int64_t)0)]));   /* for PHI node */

  } else {
  if (((((llvm_srem_u32(d, 5)) == 2u)&1))) {
  } else {
}
  llvm_cbe_cond25__PHI_TEMPORARY = ((&_OC_str_OC_3.array[((int64_t)0)]));   /* for PHI node */

  if (((((llvm_srem_u32(d, 5)) == 3u)&1))) {
  } else {
}
  llvm_cbe_cond25 = llvm_cbe_cond25__PHI_TEMPORARY;
  llvm_cbe_cond27__PHI_TEMPORARY = llvm_cbe_cond25;   /* for PHI node */

  llvm_cbe_cond23__PHI_TEMPORARY = ((&_OC_str_OC_4.array[((int64_t)0)]));   /* for PHI node */

  _1 = ((uint64_t)(bool)((((llvm_srem_u32(d, 5)) == 4u)&1)));
  llvm_cbe_cond = llvm_select_pu8(((((llvm_srem_u32(d, 5)) == 4u)&1)), ((&_OC_str_OC_5.array[((int64_t)0)])), ((&_OC_str_OC_6.array[((int64_t)0)])));
  llvm_cbe_cond23__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
}
  } else {
    llvm_cbe_d_2e_addr_2e_1_2e_splitted2__PHI_TEMPORARY = llvm_cbe_d;   /* for PHI node */
  llvm_cbe_d_2e_addr_2e_1_2e_splitted2 = llvm_cbe_d_2e_addr_2e_1_2e_splitted2__PHI_TEMPORARY;
  ;
  if (((((llvm_srem_u32(llvm_cbe_d_2e_addr_2e_1_2e_splitted2, 5)) == 1u)&1))) {
  llvm_cbe_cond27__PHI_TEMPORARY = ((&_OC_str_OC_2.array[((int64_t)0)]));   /* for PHI node */

  } else {
  if (((((llvm_srem_u32(d, 5)) == 2u)&1))) {
  } else {
}
  llvm_cbe_cond25__PHI_TEMPORARY = ((&_OC_str_OC_3.array[((int64_t)0)]));   /* for PHI node */

  if (((((llvm_srem_u32(d, 5)) == 3u)&1))) {
  } else {
}
  llvm_cbe_cond25 = llvm_cbe_cond25__PHI_TEMPORARY;
  llvm_cbe_cond27__PHI_TEMPORARY = llvm_cbe_cond25;   /* for PHI node */

  llvm_cbe_cond23__PHI_TEMPORARY = ((&_OC_str_OC_4.array[((int64_t)0)]));   /* for PHI node */

  _1 = ((uint64_t)(bool)((((llvm_srem_u32(d, 5)) == 4u)&1)));
  llvm_cbe_cond = llvm_select_pu8(((((llvm_srem_u32(d, 5)) == 4u)&1)), ((&_OC_str_OC_5.array[((int64_t)0)])), ((&_OC_str_OC_6.array[((int64_t)0)])));
  llvm_cbe_cond23__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
}
}
  llvm_cbe_cond23 = llvm_cbe_cond23__PHI_TEMPORARY;
  llvm_cbe_cond25__PHI_TEMPORARY = llvm_cbe_cond23;   /* for PHI node */

  llvm_cbe_cond27 = llvm_cbe_cond27__PHI_TEMPORARY;
  if (((((llvm_srem_u32(d, 73)) == 0u)&1))) {
  llvm_cbe_sub = llvm_sub_u32(d, 1);
  llvm_cbe_cond33__PHI_TEMPORARY = llvm_cbe_sub;   /* for PHI node */

  } else {
  llvm_cbe_cond33__PHI_TEMPORARY = d;   /* for PHI node */

}
  llvm_cbe_cond33 = llvm_cbe_cond33__PHI_TEMPORARY;
  if (((((llvm_sdiv_u32(llvm_cbe_cond33, 73)) == 0u)&1))) {
  llvm_cbe_cond74__PHI_TEMPORARY = ((&_OC_str_OC_7.array[((int64_t)0)]));   /* for PHI node */

  } else {
  if (((((llvm_srem_u32(d, 73)) == 0u)&1))) {
  llvm_cbe_sub40 = llvm_sub_u32(d, 1);
  llvm_cbe_cond43__PHI_TEMPORARY = llvm_cbe_sub40;   /* for PHI node */

  } else {
  llvm_cbe_cond43__PHI_TEMPORARY = d;   /* for PHI node */

}
}
  llvm_cbe_cond43 = llvm_cbe_cond43__PHI_TEMPORARY;
  if (((((llvm_sdiv_u32(llvm_cbe_cond43, 73)) == 1u)&1))) {
  llvm_cbe_cond72__PHI_TEMPORARY = ((&_OC_str_OC_8.array[((int64_t)0)]));   /* for PHI node */

  } else {
  if (((((llvm_srem_u32(d, 73)) == 0u)&1))) {
  llvm_cbe_sub51 = llvm_sub_u32(d, 1);
  llvm_cbe_cond54__PHI_TEMPORARY = llvm_cbe_sub51;   /* for PHI node */

  } else {
  llvm_cbe_cond54__PHI_TEMPORARY = d;   /* for PHI node */

}
}
  llvm_cbe_cond54 = llvm_cbe_cond54__PHI_TEMPORARY;
  if (((((llvm_sdiv_u32(llvm_cbe_cond54, 73)) == 2u)&1))) {
  llvm_cbe_cond70__PHI_TEMPORARY = ((&_OC_str_OC_9.array[((int64_t)0)]));   /* for PHI node */

  } else {
  if (((((llvm_srem_u32(d, 73)) == 0u)&1))) {
  llvm_cbe_sub62 = llvm_sub_u32(d, 1);
  llvm_cbe_cond65__PHI_TEMPORARY = llvm_cbe_sub62;   /* for PHI node */

  } else {
  llvm_cbe_cond65__PHI_TEMPORARY = d;   /* for PHI node */

}
}
  llvm_cbe_cond65 = llvm_cbe_cond65__PHI_TEMPORARY;
  _2 = ((uint64_t)(bool)((((llvm_sdiv_u32(llvm_cbe_cond65, 73)) == 3u)&1)));
  llvm_cbe_cond68 = llvm_select_pu8(((((llvm_sdiv_u32(llvm_cbe_cond65, 73)) == 3u)&1)), ((&_OC_str_OC_10.array[((int64_t)0)])), ((&_OC_str_OC_11.array[((int64_t)0)])));
  llvm_cbe_cond70__PHI_TEMPORARY = llvm_cbe_cond68;   /* for PHI node */

  llvm_cbe_cond70 = llvm_cbe_cond70__PHI_TEMPORARY;
  llvm_cbe_cond72__PHI_TEMPORARY = llvm_cbe_cond70;   /* for PHI node */

  llvm_cbe_cond72 = llvm_cbe_cond72__PHI_TEMPORARY;
  llvm_cbe_cond74__PHI_TEMPORARY = llvm_cbe_cond72;   /* for PHI node */

  llvm_cbe_cond74 = llvm_cbe_cond74__PHI_TEMPORARY;
  if (((((llvm_srem_u32(d, 73)) == 0u)&1))) {
  llvm_cbe_cond81__PHI_TEMPORARY = 73;   /* for PHI node */

  } else {
  llvm_cbe_rem79 = llvm_srem_u32(d, 73);
  llvm_cbe_cond81__PHI_TEMPORARY = llvm_cbe_rem79;   /* for PHI node */

}
  llvm_cbe_cond81 = llvm_cbe_cond81__PHI_TEMPORARY;
  llvm_cbe_call82 = sprintf(result, ((&_OC_str_OC_1.array[((int64_t)0)])), llvm_cbe_cond27, llvm_cbe_cond74, llvm_cbe_cond81, dyear);

  return result;
}


uint32_t day_of_year(uint32_t llvm_cbe_y, uint32_t llvm_cbe_m, uint32_t llvm_cbe_d) {
  __MSALIGN__(16) struct l_array_12_uint32_t llvm_cbe_month_lengths __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _3;
  uint32_t m;
  uint32_t m__PHI_TEMPORARY;
  uint32_t d;
  uint32_t d__PHI_TEMPORARY;
  uint32_t _4;
  uint32_t llvm_cbe_d_2e_addr_2e_1_2e_splitted1;
  uint32_t llvm_cbe_d_2e_addr_2e_1_2e_splitted1__PHI_TEMPORARY;
  uint32_t llvm_cbe_d_2e_addr_2e_1_2e_splitted2;
  uint32_t llvm_cbe_d_2e_addr_2e_1_2e_splitted2__PHI_TEMPORARY;
  uint32_t llvm_cbe_d_2e_addr_2e_1_2e_splitted3;
  uint32_t llvm_cbe_d_2e_addr_2e_1_2e_splitted3__PHI_TEMPORARY;
  uint32_t llvm_cbe_inc_2e_splitted1;

  ;
  ;
  ;
  ;
  _3 = memcpy((((uint8_t*)(&llvm_cbe_month_lengths))), ((uint8_t*)(&__const_OC_day_of_year_OC_month_lengths)), 48);
  m__PHI_TEMPORARY = llvm_cbe_m;   /* for PHI node */
  d__PHI_TEMPORARY = llvm_cbe_d;   /* for PHI node */

  m = m__PHI_TEMPORARY;
  d = d__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)m) > ((int32_t)1u)){
  _4 = *((&llvm_cbe_month_lengths.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(m, 2)))))]));
  d = llvm_add_u32(d, _4);
  ;
  if ((((m == 3u)&1))) {
  if (((((llvm_srem_u32(llvm_cbe_y, 400)) == 0u)&1))) {
  llvm_cbe_inc_2e_splitted1 = llvm_add_u32(d, 1);
  ;
  d__PHI_TEMPORARY = llvm_cbe_inc_2e_splitted1;   /* for PHI node */

  d = d__PHI_TEMPORARY;
  ;

  } else {
  if (((((llvm_srem_u32(llvm_cbe_y, 4)) == 0u)&1))) {
  if (((((llvm_srem_u32(llvm_cbe_y, 100)) != 0u)&1))) {
  d = llvm_add_u32(d, 1);
  ;
  d__PHI_TEMPORARY = d;   /* for PHI node */

  } else {
    llvm_cbe_d_2e_addr_2e_1_2e_splitted1__PHI_TEMPORARY = d;   /* for PHI node */
  llvm_cbe_d_2e_addr_2e_1_2e_splitted1 = llvm_cbe_d_2e_addr_2e_1_2e_splitted1__PHI_TEMPORARY;
  ;

}
  } else {
    llvm_cbe_d_2e_addr_2e_1_2e_splitted2__PHI_TEMPORARY = d;   /* for PHI node */
  llvm_cbe_d_2e_addr_2e_1_2e_splitted2 = llvm_cbe_d_2e_addr_2e_1_2e_splitted2__PHI_TEMPORARY;
  ;

}
}
  } else {
    llvm_cbe_d_2e_addr_2e_1_2e_splitted3__PHI_TEMPORARY = d;   /* for PHI node */
  llvm_cbe_d_2e_addr_2e_1_2e_splitted3 = llvm_cbe_d_2e_addr_2e_1_2e_splitted3__PHI_TEMPORARY;
  ;

}
  m = llvm_add_u32(m, -1);
  ;
  m__PHI_TEMPORARY = m;   /* for PHI node */
  d__PHI_TEMPORARY = d;   /* for PHI node */

  m = m__PHI_TEMPORARY;
  d = d__PHI_TEMPORARY;
  ;
  ;
}
  return d;
}


int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argc = (uint32_t)argc;
  uint8_t** llvm_cbe_argv = (uint8_t**)argv;
  uint64_t llvm_cbe_now;    /* Address-exposed local */
  uint64_t llvm_cbe_call;
  struct l_struct_struct_OC_tm* now_time;
  uint32_t _5;
  uint32_t year;
  uint32_t _6;
  uint32_t doy;
  uint8_t* _7;
  uint8_t* _8;
  uint32_t llvm_cbe_call7;
  uint8_t* _9;
  uint32_t llvm_cbe_call9;
  uint8_t* _10;
  uint32_t llvm_cbe_call11;
  uint32_t year__PHI_TEMPORARY;
  uint32_t doy__PHI_TEMPORARY;
  uint8_t* result;
  uint32_t llvm_cbe_call15;

  ;
  ;
  ;
  if ((((llvm_cbe_argc == 1u)&1))) {
  llvm_cbe_call = time(((uint64_t*)/*NULL*/0));
  llvm_cbe_now = llvm_cbe_call;
  now_time = localtime((&llvm_cbe_now));
  ;
  _5 = *((&now_time->field5));
  year = llvm_add_u32(_5, 1900);
  ;
  _6 = *((&now_time->field7));
  doy = llvm_add_u32(_6, 1);
  ;
  year__PHI_TEMPORARY = year;   /* for PHI node */
  doy__PHI_TEMPORARY = doy;   /* for PHI node */

    year__PHI_TEMPORARY = year;   /* for PHI node */
    doy__PHI_TEMPORARY = doy;   /* for PHI node */
  year = year__PHI_TEMPORARY;
  doy = doy__PHI_TEMPORARY;
  ;
  ;
  result = ddate(year, doy);
  ;
  llvm_cbe_call15 = puts(result);
  free(result);
  return 0;
}
  if (!(((llvm_cbe_argc == 4u)&1))) {
  _7 = *((&llvm_cbe_argv[((int64_t)1)]));
  year = atoi(_7);
  ;
  _8 = *((&llvm_cbe_argv[((int64_t)1)]));
  llvm_cbe_call7 = atoi(_8);
  _9 = *((&llvm_cbe_argv[((int64_t)2)]));
  llvm_cbe_call9 = atoi(_9);
  _10 = *((&llvm_cbe_argv[((int64_t)3)]));
  llvm_cbe_call11 = atoi(_10);
  doy = day_of_year(llvm_cbe_call7, llvm_cbe_call9, llvm_cbe_call11);
  ;
  year__PHI_TEMPORARY = year;   /* for PHI node */
  doy__PHI_TEMPORARY = doy;   /* for PHI node */

}
  year = year__PHI_TEMPORARY;
  doy = doy__PHI_TEMPORARY;
  ;
  ;
  year__PHI_TEMPORARY = year;   /* for PHI node */
  doy__PHI_TEMPORARY = doy;   /* for PHI node */

  year = year__PHI_TEMPORARY;
  doy = doy__PHI_TEMPORARY;
  ;
  ;
  result = ddate(year, doy);
  ;
  llvm_cbe_call15 = puts(result);
  free(result);
  return 0;
}

