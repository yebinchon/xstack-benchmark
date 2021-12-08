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

/* Function definitions */

/* Types Definitions */
struct l_struct_struct_OC___mpz_struct {
  uint32_t field0;
  uint32_t field1;
  uint64_t* field2;
};
struct l_array_19_uint8_t {
  uint8_t array[19];
};
struct l_array_1_struct_AC_l_struct_struct_OC___mpz_struct {
  struct l_struct_struct_OC___mpz_struct array[1];
};

/* External Global Variable Declarations */

/* Function Declarations */
void perm(struct l_struct_struct_OC___mpz_struct*, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void __gmpz_set_ui(struct l_struct_struct_OC___mpz_struct*, uint64_t);
void __gmpz_mul_ui(struct l_struct_struct_OC___mpz_struct*, struct l_struct_struct_OC___mpz_struct*, uint64_t);
void comb(struct l_struct_struct_OC___mpz_struct*, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void __gmpz_divexact_ui(struct l_struct_struct_OC___mpz_struct*, struct l_struct_struct_OC___mpz_struct*, uint64_t);
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
void __gmpz_init(struct l_struct_struct_OC___mpz_struct*);
uint32_t __gmp_printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_19_uint8_t _OC_str = { "P(1000,969) = %Zd\n" };
static struct l_array_19_uint8_t _OC_str_OC_1 = { "C(1000,969) = %Zd\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}


/* Function Bodies */

void perm(struct l_struct_struct_OC___mpz_struct* llvm_cbe_out, uint32_t llvm_cbe_n, uint32_t llvm_cbe_k) {
  uint32_t k;
  uint32_t n;
  uint32_t n__PHI_TEMPORARY;

  ;
  ;
  ;
  __gmpz_set_ui(llvm_cbe_out, 1);
  k = llvm_sub_u32(llvm_cbe_n, llvm_cbe_k);
  ;
  n__PHI_TEMPORARY = llvm_cbe_n;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  ;
while (((int32_t)n) > ((int32_t)k)){
  n = llvm_add_u32(n, -1);
  ;
  __gmpz_mul_ui(llvm_cbe_out, llvm_cbe_out, (((int64_t)(int32_t)n)));
  n__PHI_TEMPORARY = n;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  ;
}
  return;
}


void comb(struct l_struct_struct_OC___mpz_struct* llvm_cbe_out, uint32_t llvm_cbe_n, uint32_t llvm_cbe_k) {
  uint32_t k;
  uint32_t k__PHI_TEMPORARY;

  ;
  ;
  ;
  perm(llvm_cbe_out, llvm_cbe_n, llvm_cbe_k);
  k__PHI_TEMPORARY = llvm_cbe_k;   /* for PHI node */

  k = k__PHI_TEMPORARY;
  ;
while (k != 0u){
  k = llvm_add_u32(k, -1);
  ;
  __gmpz_divexact_ui(llvm_cbe_out, llvm_cbe_out, (((int64_t)(int32_t)k)));
  k__PHI_TEMPORARY = k;   /* for PHI node */

  k = k__PHI_TEMPORARY;
  ;
}
  return;
}


int main(void) {
  __MSALIGN__(16) struct l_array_1_struct_AC_l_struct_struct_OC___mpz_struct llvm_cbe_x __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call5;

  ;
  __gmpz_init(((&llvm_cbe_x.array[((int64_t)0)])));
  perm(((&llvm_cbe_x.array[((int64_t)0)])), 1000, 969);
  llvm_cbe_call = __gmp_printf(((&_OC_str.array[((int64_t)0)])), ((&llvm_cbe_x.array[((int64_t)0)])));
  comb(((&llvm_cbe_x.array[((int64_t)0)])), 1000, 969);
  llvm_cbe_call5 = __gmp_printf(((&_OC_str_OC_1.array[((int64_t)0)])), ((&llvm_cbe_x.array[((int64_t)0)])));
  return 0;
}

