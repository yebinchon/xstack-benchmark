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
struct l_struct_struct_OC___mpz_struct {
  uint32_t field0;
  uint32_t field1;
  uint64_t* field2;
};
struct l_struct_struct_OC___mpq_struct {
  struct l_struct_struct_OC___mpz_struct field0;
  struct l_struct_struct_OC___mpz_struct field1;
};
struct l_array_23_uint8_t {
  uint8_t array[23];
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
  uint8_t* llvm_cbe_call;
  struct l_array_1_struct_AC_l_struct_struct_OC___mpq_struct* a;
  uint64_t i;
  uint64_t i__PHI_TEMPORARY;
  uint32_t llvm_cbe_m_2e_0;
  uint32_t llvm_cbe_m_2e_0__PHI_TEMPORARY;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  uint32_t m;

  ;
  ;
  llvm_cbe_call = malloc((llvm_mul_u64(32, (((uint64_t)(uint32_t)(llvm_add_u32(llvm_cbe_n, 1)))))));
  a = ((struct l_array_1_struct_AC_l_struct_struct_OC___mpq_struct*)llvm_cbe_call);
  ;

  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint32_t llvm_cbe_add1;
  uint64_t llvm_cbe_conv2;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_add1 = llvm_add_u32(llvm_cbe_n, 1);
  llvm_cbe_conv2 = ((uint64_t)(uint32_t)(llvm_add_u32(llvm_cbe_n, 1)));
while (((uint64_t)i) < ((uint64_t)llvm_cbe_conv2)){
  __gmpq_init(((&(*((&a[((int64_t)i)]))).array[((int64_t)0)])));

  i = llvm_add_u64(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_add1 = llvm_add_u32(llvm_cbe_n, 1);
  llvm_cbe_conv2 = ((uint64_t)(uint32_t)(llvm_add_u32(llvm_cbe_n, 1)));
}

  ;
  llvm_cbe_m_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

  llvm_cbe_m_2e_0 = llvm_cbe_m_2e_0__PHI_TEMPORARY;
  ;
while (((uint32_t)llvm_cbe_m_2e_0) <= ((uint32_t)llvm_cbe_n)){
  __gmpq_set_ui(((&(*((&a[((int64_t)(((uint64_t)(uint32_t)llvm_cbe_m_2e_0)))]))).array[((int64_t)0)])), 1, (((uint64_t)(uint32_t)(llvm_add_u32(llvm_cbe_m_2e_0, 1)))));
  ;
  j__PHI_TEMPORARY = llvm_cbe_m_2e_0;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
while (((uint32_t)j) > ((uint32_t)0u)){
  __gmpq_sub(((&(*((&a[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(j, 1)))))]))).array[((int64_t)0)])), ((&(*((&a[((int64_t)(((uint64_t)(uint32_t)j)))]))).array[((int64_t)0)])), ((&(*((&a[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(j, 1)))))]))).array[((int64_t)0)])));
  __gmpq_set_ui(llvm_cbe_rop, (((uint64_t)(uint32_t)j)), 1);
  __gmpq_mul(((&(*((&a[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(j, 1)))))]))).array[((int64_t)0)])), ((&(*((&a[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(j, 1)))))]))).array[((int64_t)0)])), llvm_cbe_rop);

  j = llvm_add_u32(j, -1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
}

  m = llvm_add_u32(llvm_cbe_m_2e_0, 1);
  ;
  llvm_cbe_m_2e_0__PHI_TEMPORARY = m;   /* for PHI node */

  llvm_cbe_m_2e_0 = llvm_cbe_m_2e_0__PHI_TEMPORARY;
  ;
}
  __gmpq_set(llvm_cbe_rop, ((&(*((&(*a)))).array[((int64_t)0)])));

  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint32_t llvm_cbe_add45;
  uint64_t llvm_cbe_conv46;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_add45 = llvm_add_u32(llvm_cbe_n, 1);
  llvm_cbe_conv46 = ((uint64_t)(uint32_t)(llvm_add_u32(llvm_cbe_n, 1)));
while (((uint64_t)i) < ((uint64_t)llvm_cbe_conv46)){
  __gmpq_clear(((&(*((&a[((int64_t)i)]))).array[((int64_t)0)])));

  i = llvm_add_u64(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_add45 = llvm_add_u32(llvm_cbe_n, 1);
  llvm_cbe_conv46 = ((uint64_t)(uint32_t)(llvm_add_u32(llvm_cbe_n, 1)));
}

  free((((uint8_t*)a)));
}


int main(void) {
  __MSALIGN__(16) struct l_array_1_struct_AC_l_struct_struct_OC___mpq_struct llvm_cbe_rop __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_1_struct_AC_l_struct_struct_OC___mpz_struct llvm_cbe_n __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_1_struct_AC_l_struct_struct_OC___mpz_struct llvm_cbe_d __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t _1;
  uint32_t _2;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call18;
  uint32_t llvm_cbe_call26;
  uint32_t llvm_cbe_call26_2e_splitted1;
  uint32_t llvm_cbe_call26_2e_splitted2;
  uint32_t llvm_cbe_call26_2e_splitted3;

  ;
  ;
  ;
  __gmpq_init(((&llvm_cbe_rop.array[((int64_t)0)])));
  __gmpz_inits(((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_d.array[((int64_t)0)])), ((uint8_t*)/*NULL*/0));
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((uint32_t)i) <= ((uint32_t)60u)){
  bernoulli(((&llvm_cbe_rop.array[((int64_t)0)])), i);
  if (1) {
  _1 = *((&((&((&llvm_cbe_rop.array[((int64_t)0)]))->field0))->field1));
  if ((((((int32_t)_1) < ((int32_t)0u))&1))) {
  if (1) {
  __gmpq_get_num(((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_rop.array[((int64_t)0)])));
  __gmpq_get_den(((&llvm_cbe_d.array[((int64_t)0)])), ((&llvm_cbe_rop.array[((int64_t)0)])));
  llvm_cbe_call26_2e_splitted3 = __gmp_printf(((&_OC_str.array[((int64_t)0)])), i, ((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_d.array[((int64_t)0)])));


  } else {

}
  } else {
  _2 = *((&((&((&llvm_cbe_rop.array[((int64_t)0)]))->field0))->field1));
  if ((((((int32_t)_2) > ((int32_t)0u))&1))) {
  __gmpq_get_num(((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_rop.array[((int64_t)0)])));
  __gmpq_get_den(((&llvm_cbe_d.array[((int64_t)0)])), ((&llvm_cbe_rop.array[((int64_t)0)])));
  llvm_cbe_call26_2e_splitted2 = __gmp_printf(((&_OC_str.array[((int64_t)0)])), i, ((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_d.array[((int64_t)0)])));


  } else {

}
}
  } else {
  if (0) {
  llvm_cbe_call = __gmpz_cmp(((&((&llvm_cbe_rop.array[((int64_t)0)]))->field0)), ((&((&llvm_cbe_rop.array[((int64_t)0)]))->field1)));
  if ((((llvm_cbe_call != 0u)&1))) {
  __gmpq_get_num(((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_rop.array[((int64_t)0)])));
  __gmpq_get_den(((&llvm_cbe_d.array[((int64_t)0)])), ((&llvm_cbe_rop.array[((int64_t)0)])));
  llvm_cbe_call26_2e_splitted1 = __gmp_printf(((&_OC_str.array[((int64_t)0)])), i, ((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_d.array[((int64_t)0)])));


  } else {

}
  } else {
  llvm_cbe_call18 = __gmpq_cmp_ui(((&llvm_cbe_rop.array[((int64_t)0)])), 0, 1);
  if ((((llvm_cbe_call18 != 0u)&1))) {
  __gmpq_get_num(((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_rop.array[((int64_t)0)])));
  __gmpq_get_den(((&llvm_cbe_d.array[((int64_t)0)])), ((&llvm_cbe_rop.array[((int64_t)0)])));
  llvm_cbe_call26 = __gmp_printf(((&_OC_str.array[((int64_t)0)])), i, ((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_d.array[((int64_t)0)])));


  } else {

}
}
}
  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  __gmpz_clears(((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_d.array[((int64_t)0)])), ((uint8_t*)/*NULL*/0));
  __gmpq_clear(((&llvm_cbe_rop.array[((int64_t)0)])));
  return 0;
}

