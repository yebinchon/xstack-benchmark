/* Provide Declarations */
#include <stdarg.h>
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
struct l_struct_struct_OC___va_list_tag;

/* Function definitions */

/* Types Definitions */
struct l_array_34_uint8_t {
  uint8_t array[34];
};
struct l_struct_struct_OC___va_list_tag {
  uint32_t field0;
  uint32_t field1;
  uint8_t* field2;
  uint8_t* field3;
};
struct l_array_1_struct_AC_l_struct_struct_OC___va_list_tag {
  struct l_struct_struct_OC___va_list_tag array[1];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint64_t factorial(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint64_t sumOfFactorials(uint32_t, ...) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_34_uint8_t _OC_str = { "\nSum of factorials of [1,5] : %ld" };
static struct l_array_34_uint8_t _OC_str_OC_1 = { "\nSum of factorials of [3,5] : %ld" };
static struct l_array_34_uint8_t _OC_str_OC_2 = { "\nSum of factorials of [1,3] : %ld" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}


/* Function Bodies */

uint64_t factorial(uint32_t llvm_cbe_n) {
  uint64_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  uint32_t _3;
  uint64_t llvm_cbe_call;
  uint64_t _4;

  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  _1 = llvm_cbe_n_2e_addr;
  if ((((((int32_t)_1) > ((int32_t)1u))&1))) {
  _2 = llvm_cbe_n_2e_addr;
  _3 = llvm_cbe_n_2e_addr;
  llvm_cbe_call = factorial((llvm_sub_u32(_3, 1)));
  llvm_cbe_retval = (llvm_mul_u64((((int64_t)(int32_t)_2)), llvm_cbe_call));

  } else {
  llvm_cbe_retval = 1;

}
  _4 = llvm_cbe_retval;
  return _4;
}


uint64_t sumOfFactorials(uint32_t llvm_cbe_num, ...) {
  uint32_t llvm_cbe_num_2e_addr;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_1_struct_AC_l_struct_struct_OC___va_list_tag llvm_cbe_vaList __attribute__((aligned(16)));    /* Address-exposed local */
  uint64_t llvm_cbe_sum;    /* Address-exposed local */
  uint32_t _5;
  struct l_struct_struct_OC___va_list_tag* llvm_cbe_arraydecay2;
  uint32_t* llvm_cbe_gp_offset_p;
  uint32_t llvm_cbe_gp_offset;
  uint8_t* llvm_cbe_reg_save_area;
  uint32_t* _6;
  uint8_t** llvm_cbe_overflow_arg_area_p;
  uint8_t* llvm_cbe_overflow_arg_area;
  uint32_t* _7;
  uint32_t* llvm_cbe_vaarg_2e_addr;
  uint32_t* llvm_cbe_vaarg_2e_addr__PHI_TEMPORARY;
  uint32_t _8;
  uint64_t llvm_cbe_call;
  uint64_t _9;
  uint64_t _10;

  llvm_cbe_num_2e_addr = llvm_cbe_num;
  ;
  ;
  ;
  llvm_cbe_sum = 0;
  0; va_start(*(va_list*)(((uint8_t*)((&llvm_cbe_vaList.array[((int64_t)0)])))), llvm_cbe_num);

  uint32_t llvm_cbe_dec;
  _5 = llvm_cbe_num_2e_addr;
  llvm_cbe_dec = llvm_add_u32(_5, -1);
  llvm_cbe_num_2e_addr = (llvm_add_u32(_5, -1));
while (_5 != 0u){
  llvm_cbe_arraydecay2 = (&llvm_cbe_vaList.array[((int64_t)0)]);
  llvm_cbe_gp_offset_p = (&llvm_cbe_arraydecay2->field0);
  llvm_cbe_gp_offset = *llvm_cbe_gp_offset_p;
  if ((((((uint32_t)llvm_cbe_gp_offset) <= ((uint32_t)40u))&1))) {
  llvm_cbe_reg_save_area = *((&llvm_cbe_arraydecay2->field3));
  _6 = ((uint32_t*)((&llvm_cbe_reg_save_area[((int32_t)llvm_cbe_gp_offset)])));
  *llvm_cbe_gp_offset_p = (llvm_add_u32(llvm_cbe_gp_offset, 8));
  llvm_cbe_vaarg_2e_addr__PHI_TEMPORARY = _6;   /* for PHI node */

  } else {
  llvm_cbe_overflow_arg_area_p = (&llvm_cbe_arraydecay2->field2);
  llvm_cbe_overflow_arg_area = *llvm_cbe_overflow_arg_area_p;
  _7 = ((uint32_t*)llvm_cbe_overflow_arg_area);
  *llvm_cbe_overflow_arg_area_p = ((&llvm_cbe_overflow_arg_area[((int32_t)8)]));
  llvm_cbe_vaarg_2e_addr__PHI_TEMPORARY = _7;   /* for PHI node */

}
  llvm_cbe_vaarg_2e_addr = llvm_cbe_vaarg_2e_addr__PHI_TEMPORARY;
  _8 = *llvm_cbe_vaarg_2e_addr;
  llvm_cbe_call = factorial(_8);
  _9 = llvm_cbe_sum;
  llvm_cbe_sum = (llvm_add_u64(_9, llvm_cbe_call));

  _5 = llvm_cbe_num_2e_addr;
  llvm_cbe_dec = llvm_add_u32(_5, -1);
  llvm_cbe_num_2e_addr = (llvm_add_u32(_5, -1));
}
  0; va_end(*(va_list*)(((uint8_t*)((&llvm_cbe_vaList.array[((int64_t)0)])))));
  _10 = llvm_cbe_sum;
  return _10;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint64_t llvm_cbe_call;
  uint32_t llvm_cbe_call1;
  uint64_t llvm_cbe_call2;
  uint32_t llvm_cbe_call3;
  uint64_t llvm_cbe_call4;
  uint32_t llvm_cbe_call5;

  llvm_cbe_retval = 0;
  llvm_cbe_call = sumOfFactorials(5, 1, 2, 3, 4, 5);
  llvm_cbe_call1 = printf(((&_OC_str.array[((int64_t)0)])), llvm_cbe_call);
  llvm_cbe_call2 = sumOfFactorials(3, 3, 4, 5);
  llvm_cbe_call3 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), llvm_cbe_call2);
  llvm_cbe_call4 = sumOfFactorials(3, 1, 2, 3);
  llvm_cbe_call5 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), llvm_cbe_call4);
  return 0;
}

