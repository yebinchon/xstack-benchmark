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
struct l_struct_struct_OC___mpf_struct;

/* Function definitions */

/* Types Definitions */
struct l_struct_struct_OC___mpf_struct {
  uint32_t field0;
  uint32_t field1;
  uint64_t field2;
  uint64_t* field3;
};
struct l_array_12_uint8_t {
  uint8_t array[12];
};
struct l_array_1_struct_AC_l_struct_struct_OC___mpf_struct {
  struct l_struct_struct_OC___mpf_struct array[1];
};

/* External Global Variable Declarations */

/* Function Declarations */
void agm(struct l_struct_struct_OC___mpf_struct*, struct l_struct_struct_OC___mpf_struct*, struct l_struct_struct_OC___mpf_struct*, struct l_struct_struct_OC___mpf_struct*) __ATTRIBUTELIST__((noinline, nothrow));
void __gmpf_add(struct l_struct_struct_OC___mpf_struct*, struct l_struct_struct_OC___mpf_struct*, struct l_struct_struct_OC___mpf_struct*);
void __gmpf_div_ui(struct l_struct_struct_OC___mpf_struct*, struct l_struct_struct_OC___mpf_struct*, uint64_t);
void __gmpf_mul(struct l_struct_struct_OC___mpf_struct*, struct l_struct_struct_OC___mpf_struct*, struct l_struct_struct_OC___mpf_struct*);
void __gmpf_sqrt(struct l_struct_struct_OC___mpf_struct*, struct l_struct_struct_OC___mpf_struct*);
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
void __gmpf_set_default_prec(uint64_t);
void __gmpf_init_set_ui(struct l_struct_struct_OC___mpf_struct*, uint64_t);
void __gmpf_init_set_d(struct l_struct_struct_OC___mpf_struct*, double);
void __gmpf_init(struct l_struct_struct_OC___mpf_struct*);
void __gmpf_sub(struct l_struct_struct_OC___mpf_struct*, struct l_struct_struct_OC___mpf_struct*, struct l_struct_struct_OC___mpf_struct*);
void __gmpf_mul_ui(struct l_struct_struct_OC___mpf_struct*, struct l_struct_struct_OC___mpf_struct*, uint64_t);
void __gmpf_div(struct l_struct_struct_OC___mpf_struct*, struct l_struct_struct_OC___mpf_struct*, struct l_struct_struct_OC___mpf_struct*);
uint32_t __gmp_printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_12_uint8_t _OC_str = { "%.100000Ff\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

void agm(struct l_struct_struct_OC___mpf_struct* llvm_cbe_in1, struct l_struct_struct_OC___mpf_struct* llvm_cbe_in2, struct l_struct_struct_OC___mpf_struct* llvm_cbe_out1, struct l_struct_struct_OC___mpf_struct* llvm_cbe_out2) {
  ;
  ;
  ;
  ;
  __gmpf_add(llvm_cbe_out1, llvm_cbe_in1, llvm_cbe_in2);
  __gmpf_div_ui(llvm_cbe_out1, llvm_cbe_out1, 2);
  __gmpf_mul(llvm_cbe_out2, llvm_cbe_in1, llvm_cbe_in2);
  __gmpf_sqrt(llvm_cbe_out2, llvm_cbe_out2);
}


int main(void) {
  __MSALIGN__(16) struct l_array_1_struct_AC_l_struct_struct_OC___mpf_struct llvm_cbe_x0 __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_1_struct_AC_l_struct_struct_OC___mpf_struct llvm_cbe_y0 __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_1_struct_AC_l_struct_struct_OC___mpf_struct llvm_cbe_resA __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_1_struct_AC_l_struct_struct_OC___mpf_struct llvm_cbe_resB __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_1_struct_AC_l_struct_struct_OC___mpf_struct llvm_cbe_Z __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_1_struct_AC_l_struct_struct_OC___mpf_struct llvm_cbe_var __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t n;
  uint32_t n__PHI_TEMPORARY;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;

  __gmpf_set_default_prec(300000);
  ;
  ;
  ;
  ;
  ;
  ;
  __gmpf_init_set_ui(((&llvm_cbe_x0.array[((int64_t)0)])), 1);
  __gmpf_init_set_d(((&llvm_cbe_y0.array[((int64_t)0)])), 0.5);
  __gmpf_sqrt(((&llvm_cbe_y0.array[((int64_t)0)])), ((&llvm_cbe_y0.array[((int64_t)0)])));
  __gmpf_init(((&llvm_cbe_resA.array[((int64_t)0)])));
  __gmpf_init(((&llvm_cbe_resB.array[((int64_t)0)])));
  __gmpf_init_set_d(((&llvm_cbe_Z.array[((int64_t)0)])), 0.25);
  __gmpf_init(((&llvm_cbe_var.array[((int64_t)0)])));
  ;
  ;
  n__PHI_TEMPORARY = 1;   /* for PHI node */
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) < ((int32_t)8u)){
  agm(((&llvm_cbe_x0.array[((int64_t)0)])), ((&llvm_cbe_y0.array[((int64_t)0)])), ((&llvm_cbe_resA.array[((int64_t)0)])), ((&llvm_cbe_resB.array[((int64_t)0)])));
  __gmpf_sub(((&llvm_cbe_var.array[((int64_t)0)])), ((&llvm_cbe_resA.array[((int64_t)0)])), ((&llvm_cbe_x0.array[((int64_t)0)])));
  __gmpf_mul(((&llvm_cbe_var.array[((int64_t)0)])), ((&llvm_cbe_var.array[((int64_t)0)])), ((&llvm_cbe_var.array[((int64_t)0)])));
  __gmpf_mul_ui(((&llvm_cbe_var.array[((int64_t)0)])), ((&llvm_cbe_var.array[((int64_t)0)])), (((int64_t)(int32_t)n)));
  __gmpf_sub(((&llvm_cbe_Z.array[((int64_t)0)])), ((&llvm_cbe_Z.array[((int64_t)0)])), ((&llvm_cbe_var.array[((int64_t)0)])));
  n = llvm_add_u32(n, n);
  ;
  agm(((&llvm_cbe_resA.array[((int64_t)0)])), ((&llvm_cbe_resB.array[((int64_t)0)])), ((&llvm_cbe_x0.array[((int64_t)0)])), ((&llvm_cbe_y0.array[((int64_t)0)])));
  __gmpf_sub(((&llvm_cbe_var.array[((int64_t)0)])), ((&llvm_cbe_x0.array[((int64_t)0)])), ((&llvm_cbe_resA.array[((int64_t)0)])));
  __gmpf_mul(((&llvm_cbe_var.array[((int64_t)0)])), ((&llvm_cbe_var.array[((int64_t)0)])), ((&llvm_cbe_var.array[((int64_t)0)])));
  __gmpf_mul_ui(((&llvm_cbe_var.array[((int64_t)0)])), ((&llvm_cbe_var.array[((int64_t)0)])), (((int64_t)(int32_t)n)));
  __gmpf_sub(((&llvm_cbe_Z.array[((int64_t)0)])), ((&llvm_cbe_Z.array[((int64_t)0)])), ((&llvm_cbe_var.array[((int64_t)0)])));
  n = llvm_add_u32(n, n);
  ;

  i = llvm_add_u32(i, 1);
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */
  i__PHI_TEMPORARY = i;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
}
  __gmpf_mul(((&llvm_cbe_x0.array[((int64_t)0)])), ((&llvm_cbe_x0.array[((int64_t)0)])), ((&llvm_cbe_x0.array[((int64_t)0)])));
  __gmpf_div(((&llvm_cbe_x0.array[((int64_t)0)])), ((&llvm_cbe_x0.array[((int64_t)0)])), ((&llvm_cbe_Z.array[((int64_t)0)])));
  llvm_cbe_call = __gmp_printf(((&_OC_str.array[((int64_t)0)])), ((&llvm_cbe_x0.array[((int64_t)0)])));
  return 0;
}

