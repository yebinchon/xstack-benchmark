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
struct l_struct_struct_OC___mpz_struct;
struct l_struct_struct_OC___mpq_struct;

/* Function definitions */

/* Types Definitions */
struct l_array_23_uint8_t {
  uint8_t array[23];
};
struct l_struct_struct_OC___mpz_struct {
  uint32_t field0;
  uint32_t field1;
  uint64_t* field2;
};
struct l_struct_struct_OC___mpq_struct {
  struct l_struct_struct_OC___mpz_struct field0;
  struct l_struct_struct_OC___mpz_struct field1;
};
struct l_array_1_struct_AC_l_struct_struct_OC___mpq_struct {
  struct l_struct_struct_OC___mpq_struct array[1];
};
struct l_array_1_struct_AC_l_struct_struct_OC___mpz_struct {
  struct l_struct_struct_OC___mpz_struct array[1];
};

/* External Global Variable Declarations */

/* Function Declarations */
void bernoulli(struct l_struct_struct_OC___mpq_struct*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
void __gmpq_init(struct l_struct_struct_OC___mpq_struct*);
void __gmpq_set_ui(struct l_struct_struct_OC___mpq_struct*, uint64_t, uint64_t);
void __gmpq_sub(struct l_struct_struct_OC___mpq_struct*, struct l_struct_struct_OC___mpq_struct*, struct l_struct_struct_OC___mpq_struct*);
void __gmpq_mul(struct l_struct_struct_OC___mpq_struct*, struct l_struct_struct_OC___mpq_struct*, struct l_struct_struct_OC___mpq_struct*);
void __gmpq_set(struct l_struct_struct_OC___mpq_struct*, struct l_struct_struct_OC___mpq_struct*);
void __gmpq_clear(struct l_struct_struct_OC___mpq_struct*);
void free(uint8_t*) __ATTRIBUTELIST__((nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
void __gmpz_inits(struct l_struct_struct_OC___mpz_struct*, ...);
uint32_t __gmpz_cmp(struct l_struct_struct_OC___mpz_struct*, struct l_struct_struct_OC___mpz_struct*) __ATTRIBUTELIST__((nothrow, pure));
uint32_t __gmpq_cmp_ui(struct l_struct_struct_OC___mpq_struct*, uint64_t, uint64_t) __ATTRIBUTELIST__((nothrow, pure));
void __gmpq_get_num(struct l_struct_struct_OC___mpz_struct*, struct l_struct_struct_OC___mpq_struct*);
void __gmpq_get_den(struct l_struct_struct_OC___mpz_struct*, struct l_struct_struct_OC___mpq_struct*);
uint32_t __gmp_printf(uint8_t*, ...);
void __gmpz_clears(struct l_struct_struct_OC___mpz_struct*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_23_uint8_t _OC_str = { "B(%-2u) = %44Zd / %Zd\n" };


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

void bernoulli(struct l_struct_struct_OC___mpq_struct* llvm_cbe_rop, uint32_t llvm_cbe_n) {
  struct l_struct_struct_OC___mpq_struct* llvm_cbe_rop_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_m;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  struct l_array_1_struct_AC_l_struct_struct_OC___mpq_struct* llvm_cbe_a;    /* Address-exposed local */
  uint64_t llvm_cbe_i;    /* Address-exposed local */
  uint64_t llvm_cbe_i43;    /* Address-exposed local */
  uint32_t _1;
  uint8_t* llvm_cbe_call;
  uint64_t _2;
  uint32_t _3;
  struct l_array_1_struct_AC_l_struct_struct_OC___mpq_struct* _4;
  uint64_t _5;
  uint64_t _6;
  uint32_t _7;
  uint32_t _8;
  struct l_array_1_struct_AC_l_struct_struct_OC___mpq_struct* _9;
  uint32_t _10;
  uint32_t _11;
  uint32_t _12;
  uint32_t _13;
  struct l_array_1_struct_AC_l_struct_struct_OC___mpq_struct* _14;
  uint32_t _15;
  struct l_array_1_struct_AC_l_struct_struct_OC___mpq_struct* _16;
  uint32_t _17;
  struct l_array_1_struct_AC_l_struct_struct_OC___mpq_struct* _18;
  uint32_t _19;
  struct l_struct_struct_OC___mpq_struct* _20;
  uint32_t _21;
  struct l_array_1_struct_AC_l_struct_struct_OC___mpq_struct* _22;
  uint32_t _23;
  struct l_array_1_struct_AC_l_struct_struct_OC___mpq_struct* _24;
  uint32_t _25;
  struct l_struct_struct_OC___mpq_struct* _26;
  uint32_t _27;
  uint32_t _28;
  struct l_struct_struct_OC___mpq_struct* _29;
  struct l_array_1_struct_AC_l_struct_struct_OC___mpq_struct* _30;
  uint64_t _31;
  uint32_t _32;
  struct l_array_1_struct_AC_l_struct_struct_OC___mpq_struct* _33;
  uint64_t _34;
  uint64_t _35;
  struct l_array_1_struct_AC_l_struct_struct_OC___mpq_struct* _36;

  llvm_cbe_rop_2e_addr = llvm_cbe_rop;
  ;
  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  ;
  ;
  ;
  _1 = llvm_cbe_n_2e_addr;
  llvm_cbe_call = malloc((llvm_mul_u64(32, (((uint64_t)(uint32_t)(llvm_add_u32(_1, 1)))))));
  llvm_cbe_a = (((struct l_array_1_struct_AC_l_struct_struct_OC___mpq_struct*)llvm_cbe_call));

  ;
  llvm_cbe_i = 0;

  uint32_t llvm_cbe_add1;
  uint64_t llvm_cbe_conv2;
  _2 = llvm_cbe_i;
  _3 = llvm_cbe_n_2e_addr;
  llvm_cbe_add1 = llvm_add_u32(_3, 1);
  llvm_cbe_conv2 = ((uint64_t)(uint32_t)(llvm_add_u32(_3, 1)));
while (((uint64_t)_2) < ((uint64_t)llvm_cbe_conv2)){
  _4 = llvm_cbe_a;
  _5 = llvm_cbe_i;
  __gmpq_init(((&(*((&_4[((int64_t)_5)]))).array[((int64_t)0)])));

  _6 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u64(_6, 1));

  _2 = llvm_cbe_i;
  _3 = llvm_cbe_n_2e_addr;
  llvm_cbe_add1 = llvm_add_u32(_3, 1);
  llvm_cbe_conv2 = ((uint64_t)(uint32_t)(llvm_add_u32(_3, 1)));
}

  llvm_cbe_m = 0;

  _7 = llvm_cbe_m;
  _8 = llvm_cbe_n_2e_addr;
while (((uint32_t)_7) <= ((uint32_t)_8)){
  _9 = llvm_cbe_a;
  _10 = llvm_cbe_m;
  _11 = llvm_cbe_m;
  __gmpq_set_ui(((&(*((&_9[((int64_t)(((uint64_t)(uint32_t)_10)))]))).array[((int64_t)0)])), 1, (((uint64_t)(uint32_t)(llvm_add_u32(_11, 1)))));
  _12 = llvm_cbe_m;
  llvm_cbe_j = _12;

  _13 = llvm_cbe_j;
while (((uint32_t)_13) > ((uint32_t)0u)){
  _14 = llvm_cbe_a;
  _15 = llvm_cbe_j;
  _16 = llvm_cbe_a;
  _17 = llvm_cbe_j;
  _18 = llvm_cbe_a;
  _19 = llvm_cbe_j;
  __gmpq_sub(((&(*((&_14[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(_15, 1)))))]))).array[((int64_t)0)])), ((&(*((&_16[((int64_t)(((uint64_t)(uint32_t)_17)))]))).array[((int64_t)0)])), ((&(*((&_18[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(_19, 1)))))]))).array[((int64_t)0)])));
  _20 = llvm_cbe_rop_2e_addr;
  _21 = llvm_cbe_j;
  __gmpq_set_ui(_20, (((uint64_t)(uint32_t)_21)), 1);
  _22 = llvm_cbe_a;
  _23 = llvm_cbe_j;
  _24 = llvm_cbe_a;
  _25 = llvm_cbe_j;
  _26 = llvm_cbe_rop_2e_addr;
  __gmpq_mul(((&(*((&_22[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(_23, 1)))))]))).array[((int64_t)0)])), ((&(*((&_24[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(_25, 1)))))]))).array[((int64_t)0)])), _26);

  _27 = llvm_cbe_j;
  llvm_cbe_j = (llvm_add_u32(_27, -1));

  _13 = llvm_cbe_j;
}

  _28 = llvm_cbe_m;
  llvm_cbe_m = (llvm_add_u32(_28, 1));

  _7 = llvm_cbe_m;
  _8 = llvm_cbe_n_2e_addr;
}
  _29 = llvm_cbe_rop_2e_addr;
  _30 = llvm_cbe_a;
  __gmpq_set(_29, ((&(*((&(*_30)))).array[((int64_t)0)])));

  ;
  llvm_cbe_i43 = 0;

  uint32_t llvm_cbe_add45;
  uint64_t llvm_cbe_conv46;
  _31 = llvm_cbe_i43;
  _32 = llvm_cbe_n_2e_addr;
  llvm_cbe_add45 = llvm_add_u32(_32, 1);
  llvm_cbe_conv46 = ((uint64_t)(uint32_t)(llvm_add_u32(_32, 1)));
while (((uint64_t)_31) < ((uint64_t)llvm_cbe_conv46)){
  _33 = llvm_cbe_a;
  _34 = llvm_cbe_i43;
  __gmpq_clear(((&(*((&_33[((int64_t)_34)]))).array[((int64_t)0)])));

  _35 = llvm_cbe_i43;
  llvm_cbe_i43 = (llvm_add_u64(_35, 1));

  _31 = llvm_cbe_i43;
  _32 = llvm_cbe_n_2e_addr;
  llvm_cbe_add45 = llvm_add_u32(_32, 1);
  llvm_cbe_conv46 = ((uint64_t)(uint32_t)(llvm_add_u32(_32, 1)));
}

  _36 = llvm_cbe_a;
  free((((uint8_t*)_36)));
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_1_struct_AC_l_struct_struct_OC___mpq_struct llvm_cbe_rop __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_1_struct_AC_l_struct_struct_OC___mpz_struct llvm_cbe_n __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_1_struct_AC_l_struct_struct_OC___mpz_struct llvm_cbe_d __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t _37;
  uint32_t _38;
  uint32_t _39;
  uint32_t _40;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call18;
  uint32_t _41;
  uint32_t llvm_cbe_call26;
  uint32_t _42;
  uint32_t _43;
  uint32_t llvm_cbe_call26_2e_splitted1;
  uint32_t _44;
  uint32_t llvm_cbe_call26_2e_splitted2;
  uint32_t _45;
  uint32_t llvm_cbe_call26_2e_splitted3;

  llvm_cbe_retval = 0;
  ;
  ;
  ;
  __gmpq_init(((&llvm_cbe_rop.array[((int64_t)0)])));
  __gmpz_inits(((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_d.array[((int64_t)0)])), ((uint8_t*)/*NULL*/0));
  ;
  llvm_cbe_i = 0;

  _37 = llvm_cbe_i;
while (((uint32_t)_37) <= ((uint32_t)60u)){
  _38 = llvm_cbe_i;
  bernoulli(((&llvm_cbe_rop.array[((int64_t)0)])), _38);
  if (1) {
  _39 = *((&((&((&llvm_cbe_rop.array[((int64_t)0)]))->field0))->field1));
  if ((((((int32_t)_39) < ((int32_t)0u))&1))) {
  if (1) {
  __gmpq_get_num(((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_rop.array[((int64_t)0)])));
  __gmpq_get_den(((&llvm_cbe_d.array[((int64_t)0)])), ((&llvm_cbe_rop.array[((int64_t)0)])));
  _45 = llvm_cbe_i;
  llvm_cbe_call26_2e_splitted3 = __gmp_printf(((&_OC_str.array[((int64_t)0)])), _45, ((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_d.array[((int64_t)0)])));


  } else {

}
  } else {
  _40 = *((&((&((&llvm_cbe_rop.array[((int64_t)0)]))->field0))->field1));
  if ((((((int32_t)_40) > ((int32_t)0u))&1))) {
  __gmpq_get_num(((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_rop.array[((int64_t)0)])));
  __gmpq_get_den(((&llvm_cbe_d.array[((int64_t)0)])), ((&llvm_cbe_rop.array[((int64_t)0)])));
  _44 = llvm_cbe_i;
  llvm_cbe_call26_2e_splitted2 = __gmp_printf(((&_OC_str.array[((int64_t)0)])), _44, ((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_d.array[((int64_t)0)])));


  } else {

}
}
  } else {
  if (0) {
  llvm_cbe_call = __gmpz_cmp(((&((&llvm_cbe_rop.array[((int64_t)0)]))->field0)), ((&((&llvm_cbe_rop.array[((int64_t)0)]))->field1)));
  if ((((llvm_cbe_call != 0u)&1))) {
  __gmpq_get_num(((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_rop.array[((int64_t)0)])));
  __gmpq_get_den(((&llvm_cbe_d.array[((int64_t)0)])), ((&llvm_cbe_rop.array[((int64_t)0)])));
  _43 = llvm_cbe_i;
  llvm_cbe_call26_2e_splitted1 = __gmp_printf(((&_OC_str.array[((int64_t)0)])), _43, ((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_d.array[((int64_t)0)])));


  } else {

}
  } else {
  llvm_cbe_call18 = __gmpq_cmp_ui(((&llvm_cbe_rop.array[((int64_t)0)])), 0, 1);
  if ((((llvm_cbe_call18 != 0u)&1))) {
  __gmpq_get_num(((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_rop.array[((int64_t)0)])));
  __gmpq_get_den(((&llvm_cbe_d.array[((int64_t)0)])), ((&llvm_cbe_rop.array[((int64_t)0)])));
  _41 = llvm_cbe_i;
  llvm_cbe_call26 = __gmp_printf(((&_OC_str.array[((int64_t)0)])), _41, ((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_d.array[((int64_t)0)])));


  } else {

}
}
}
  _42 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_42, 1));

  _37 = llvm_cbe_i;
}
  __gmpz_clears(((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_d.array[((int64_t)0)])), ((uint8_t*)/*NULL*/0));
  __gmpq_clear(((&llvm_cbe_rop.array[((int64_t)0)])));
  return 0;
}

