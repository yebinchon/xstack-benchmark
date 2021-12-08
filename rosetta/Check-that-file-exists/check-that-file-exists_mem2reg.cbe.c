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



/* Global Declarations */

/* Types Declarations */
struct l_struct_struct_OC_timespec;
struct l_struct_struct_OC_stat;

/* Function definitions */

/* Types Definitions */
struct l_struct_struct_OC_timespec {
  uint64_t field0;
  uint64_t field1;
};
struct l_array_3_uint64_t {
  uint64_t array[3];
};
struct l_struct_struct_OC_stat {
  uint64_t field0;
  uint64_t field1;
  uint64_t field2;
  uint32_t field3;
  uint32_t field4;
  uint32_t field5;
  uint32_t field6;
  uint64_t field7;
  uint64_t field8;
  uint64_t field9;
  uint64_t field10;
  struct l_struct_struct_OC_timespec field11;
  struct l_struct_struct_OC_timespec field12;
  struct l_struct_struct_OC_timespec field13;
  struct l_array_3_uint64_t field14;
};
struct l_array_33_uint8_t {
  uint8_t array[33];
};
struct l_array_10_uint8_t {
  uint8_t array[10];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_25_uint8_t {
  uint8_t array[25];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_34_uint8_t {
  uint8_t array[34];
};
struct l_array_11_uint8_t {
  uint8_t array[11];
};
struct l_array_26_uint8_t {
  uint8_t array[26];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t check_reg(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t stat(uint8_t*, struct l_struct_struct_OC_stat*) __ATTRIBUTELIST__((nothrow));
uint32_t check_dir(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_33_uint8_t _OC_str = { "input.txt is a regular file? %s\n" };
static struct l_array_10_uint8_t _OC_str_OC_1 = { "input.txt" };
static struct l_array_4_uint8_t _OC_str_OC_2 = { "yes" };
static struct l_array_3_uint8_t _OC_str_OC_3 = { "no" };
static struct l_array_25_uint8_t _OC_str_OC_4 = { "docs is a directory? %s\n" };
static struct l_array_5_uint8_t _OC_str_OC_5 = { "docs" };
static struct l_array_34_uint8_t _OC_str_OC_6 = { "/input.txt is a regular file? %s\n" };
static struct l_array_11_uint8_t _OC_str_OC_7 = { "/input.txt" };
static struct l_array_26_uint8_t _OC_str_OC_8 = { "/docs is a directory? %s\n" };
static struct l_array_6_uint8_t _OC_str_OC_9 = { "/docs" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint8_t* llvm_select_pu8(bool condition, uint8_t* iftrue, uint8_t* ifnot) {
  uint8_t* r;
  r = condition ? iftrue : ifnot;
  return r;
}


/* Function Bodies */

uint32_t check_reg(uint8_t* llvm_cbe_path) {
  struct l_struct_struct_OC_stat llvm_cbe_sb;    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint32_t _1;
  bool _2;
  bool _2__PHI_TEMPORARY;

  ;
  ;
  llvm_cbe_call = stat(llvm_cbe_path, (&llvm_cbe_sb));
  if ((((llvm_cbe_call == 0u)&1))) {
  _1 = *((&llvm_cbe_sb.field3));
  _2__PHI_TEMPORARY = ((((_1 & 61440) == 32768u)&1));   /* for PHI node */

    _2__PHI_TEMPORARY = ((((_1 & 61440) == 32768u)&1));   /* for PHI node */
  _2 = ((_2__PHI_TEMPORARY)&1);
  return (((uint32_t)(bool)_2));
}
  _2 = ((_2__PHI_TEMPORARY)&1);
  return (((uint32_t)(bool)_2));
}


uint32_t check_dir(uint8_t* llvm_cbe_path) {
  struct l_struct_struct_OC_stat llvm_cbe_sb;    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint32_t _3;
  bool _4;
  bool _4__PHI_TEMPORARY;

  ;
  ;
  llvm_cbe_call = stat(llvm_cbe_path, (&llvm_cbe_sb));
  if ((((llvm_cbe_call == 0u)&1))) {
  _3 = *((&llvm_cbe_sb.field3));
  _4__PHI_TEMPORARY = ((((_3 & 61440) == 16384u)&1));   /* for PHI node */

    _4__PHI_TEMPORARY = ((((_3 & 61440) == 16384u)&1));   /* for PHI node */
  _4 = ((_4__PHI_TEMPORARY)&1);
  return (((uint32_t)(bool)_4));
}
  _4 = ((_4__PHI_TEMPORARY)&1);
  return (((uint32_t)(bool)_4));
}


int main(void) {
  uint32_t llvm_cbe_call;
  uint64_t _5;
  uint32_t llvm_cbe_call1;
  uint32_t llvm_cbe_call2;
  uint64_t _6;
  uint32_t llvm_cbe_call5;
  uint32_t llvm_cbe_call6;
  uint64_t _7;
  uint32_t llvm_cbe_call9;
  uint32_t llvm_cbe_call10;
  uint64_t _8;
  uint32_t llvm_cbe_call13;

  llvm_cbe_call = check_reg(((&_OC_str_OC_1.array[((int64_t)0)])));
  _5 = ((uint64_t)(bool)(((llvm_cbe_call != 0u)&1)));
  llvm_cbe_call1 = printf(((&_OC_str.array[((int64_t)0)])), (llvm_select_pu8((((llvm_cbe_call != 0u)&1)), ((&_OC_str_OC_2.array[((int64_t)0)])), ((&_OC_str_OC_3.array[((int64_t)0)])))));
  llvm_cbe_call2 = check_dir(((&_OC_str_OC_5.array[((int64_t)0)])));
  _6 = ((uint64_t)(bool)(((llvm_cbe_call2 != 0u)&1)));
  llvm_cbe_call5 = printf(((&_OC_str_OC_4.array[((int64_t)0)])), (llvm_select_pu8((((llvm_cbe_call2 != 0u)&1)), ((&_OC_str_OC_2.array[((int64_t)0)])), ((&_OC_str_OC_3.array[((int64_t)0)])))));
  llvm_cbe_call6 = check_reg(((&_OC_str_OC_7.array[((int64_t)0)])));
  _7 = ((uint64_t)(bool)(((llvm_cbe_call6 != 0u)&1)));
  llvm_cbe_call9 = printf(((&_OC_str_OC_6.array[((int64_t)0)])), (llvm_select_pu8((((llvm_cbe_call6 != 0u)&1)), ((&_OC_str_OC_2.array[((int64_t)0)])), ((&_OC_str_OC_3.array[((int64_t)0)])))));
  llvm_cbe_call10 = check_dir(((&_OC_str_OC_9.array[((int64_t)0)])));
  _8 = ((uint64_t)(bool)(((llvm_cbe_call10 != 0u)&1)));
  llvm_cbe_call13 = printf(((&_OC_str_OC_8.array[((int64_t)0)])), (llvm_select_pu8((((llvm_cbe_call10 != 0u)&1)), ((&_OC_str_OC_2.array[((int64_t)0)])), ((&_OC_str_OC_3.array[((int64_t)0)])))));
  return 0;
}

