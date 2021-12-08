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

#ifdef _MSC_VER
#define __MSALIGN__(X) __declspec(align(X))
#else
#define __MSALIGN__(X)
#endif



/* Global Declarations */

/* Types Declarations */
struct l_struct_struct_OC___mpz_struct;

/* Function definitions */

/* Types Definitions */
struct l_array_22_uint8_t {
  uint8_t array[22];
};
struct l_array_19_uint8_t {
  uint8_t array[19];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};
struct l_struct_struct_OC___mpz_struct {
  uint32_t field0;
  uint32_t field1;
  uint64_t* field2;
};
struct l_array_1_struct_AC_l_struct_struct_OC___mpz_struct {
  struct l_struct_struct_OC___mpz_struct array[1];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
void __gmpz_init_set_ui(struct l_struct_struct_OC___mpz_struct*, uint64_t);
void __gmpz_pow_ui(struct l_struct_struct_OC___mpz_struct*, struct l_struct_struct_OC___mpz_struct*, uint64_t);
uint64_t __gmpz_sizeinbase(struct l_struct_struct_OC___mpz_struct*, uint32_t) __ATTRIBUTELIST__((nothrow, pure));
uint32_t printf(uint8_t*, ...);
uint8_t* __gmpz_get_str(uint8_t*, uint32_t, struct l_struct_struct_OC___mpz_struct*);
uint64_t strlen(uint8_t*) __ATTRIBUTELIST__((nothrow, pure));


/* Global Variable Definitions and Initialization */
static struct l_array_22_uint8_t _OC_str = { "GMP says size is: %d\n" };
static struct l_array_19_uint8_t _OC_str_OC_1 = { "size really is %d\n" };
static struct l_array_20_uint8_t _OC_str_OC_2 = { "Digits: %.20s...%s\n" };


/* LLVM Intrinsic Builtin Function Bodies */


/* Function Bodies */

int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_1_struct_AC_l_struct_struct_OC___mpz_struct llvm_cbe_a __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_len;    /* Address-exposed local */
  uint8_t* llvm_cbe_s;    /* Address-exposed local */
  uint64_t llvm_cbe_call;
  uint32_t _1;
  uint32_t llvm_cbe_call4;
  uint8_t* llvm_cbe_call6;
  uint8_t* _2;
  uint64_t llvm_cbe_call7;
  uint32_t llvm_cbe_conv8;
  uint32_t llvm_cbe_call9;
  uint8_t* _3;
  uint8_t* _4;
  uint32_t _5;
  uint32_t llvm_cbe_call11;

  llvm_cbe_retval = 0;
  ;
  __gmpz_init_set_ui(((&llvm_cbe_a.array[((int64_t)0)])), 5);
  __gmpz_pow_ui(((&llvm_cbe_a.array[((int64_t)0)])), ((&llvm_cbe_a.array[((int64_t)0)])), 262144);
  ;
  llvm_cbe_call = __gmpz_sizeinbase(((&llvm_cbe_a.array[((int64_t)0)])), 10);
  llvm_cbe_len = (((uint32_t)llvm_cbe_call));
  _1 = llvm_cbe_len;
  llvm_cbe_call4 = printf(((&_OC_str.array[((int64_t)0)])), _1);
  ;
  llvm_cbe_call6 = __gmpz_get_str(((uint8_t*)/*NULL*/0), 10, ((&llvm_cbe_a.array[((int64_t)0)])));
  llvm_cbe_s = llvm_cbe_call6;
  _2 = llvm_cbe_s;
  llvm_cbe_call7 = strlen(_2);
  llvm_cbe_conv8 = ((uint32_t)llvm_cbe_call7);
  llvm_cbe_len = llvm_cbe_conv8;
  llvm_cbe_call9 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), llvm_cbe_conv8);
  _3 = llvm_cbe_s;
  _4 = llvm_cbe_s;
  _5 = llvm_cbe_len;
  llvm_cbe_call11 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), _3, ((&((&_4[((int64_t)(((int64_t)(int32_t)_5)))]))[((int64_t)-20)])));
  return 0;
}

