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
struct l_array_11_uint8_t {
  uint8_t array[11];
};
struct l_array_12_uint8_t {
  uint8_t array[12];
};
struct l_struct_struct_OC___mpf_struct {
  uint32_t field0;
  uint32_t field1;
  uint64_t field2;
  uint64_t* field3;
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
uint32_t __gmp_printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_11_uint8_t _OC_str = { "%.20000Ff\n" };
static struct l_array_12_uint8_t _OC_str_OC_1 = { "%.20000Ff\n\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

void agm(struct l_struct_struct_OC___mpf_struct* llvm_cbe_in1, struct l_struct_struct_OC___mpf_struct* llvm_cbe_in2, struct l_struct_struct_OC___mpf_struct* llvm_cbe_out1, struct l_struct_struct_OC___mpf_struct* llvm_cbe_out2) {
  struct l_struct_struct_OC___mpf_struct* llvm_cbe_in1_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC___mpf_struct* llvm_cbe_in2_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC___mpf_struct* llvm_cbe_out1_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC___mpf_struct* llvm_cbe_out2_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC___mpf_struct* _1;
  struct l_struct_struct_OC___mpf_struct* _2;
  struct l_struct_struct_OC___mpf_struct* _3;
  struct l_struct_struct_OC___mpf_struct* _4;
  struct l_struct_struct_OC___mpf_struct* _5;
  struct l_struct_struct_OC___mpf_struct* _6;
  struct l_struct_struct_OC___mpf_struct* _7;
  struct l_struct_struct_OC___mpf_struct* _8;
  struct l_struct_struct_OC___mpf_struct* _9;
  struct l_struct_struct_OC___mpf_struct* _10;

  llvm_cbe_in1_2e_addr = llvm_cbe_in1;
  ;
  llvm_cbe_in2_2e_addr = llvm_cbe_in2;
  ;
  llvm_cbe_out1_2e_addr = llvm_cbe_out1;
  ;
  llvm_cbe_out2_2e_addr = llvm_cbe_out2;
  ;
  _1 = llvm_cbe_out1_2e_addr;
  _2 = llvm_cbe_in1_2e_addr;
  _3 = llvm_cbe_in2_2e_addr;
  __gmpf_add(_1, _2, _3);
  _4 = llvm_cbe_out1_2e_addr;
  _5 = llvm_cbe_out1_2e_addr;
  __gmpf_div_ui(_4, _5, 2);
  _6 = llvm_cbe_out2_2e_addr;
  _7 = llvm_cbe_in1_2e_addr;
  _8 = llvm_cbe_in2_2e_addr;
  __gmpf_mul(_6, _7, _8);
  _9 = llvm_cbe_out2_2e_addr;
  _10 = llvm_cbe_out2_2e_addr;
  __gmpf_sqrt(_9, _10);
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_1_struct_AC_l_struct_struct_OC___mpf_struct llvm_cbe_x0 __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_1_struct_AC_l_struct_struct_OC___mpf_struct llvm_cbe_y0 __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_1_struct_AC_l_struct_struct_OC___mpf_struct llvm_cbe_resA __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_1_struct_AC_l_struct_struct_OC___mpf_struct llvm_cbe_resB __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t _11;
  uint32_t _12;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call16;

  llvm_cbe_retval = 0;
  __gmpf_set_default_prec(65568);
  ;
  ;
  ;
  ;
  __gmpf_init_set_ui(((&llvm_cbe_y0.array[((int64_t)0)])), 1);
  __gmpf_init_set_d(((&llvm_cbe_x0.array[((int64_t)0)])), 0.5);
  __gmpf_sqrt(((&llvm_cbe_x0.array[((int64_t)0)])), ((&llvm_cbe_x0.array[((int64_t)0)])));
  __gmpf_init(((&llvm_cbe_resA.array[((int64_t)0)])));
  __gmpf_init(((&llvm_cbe_resB.array[((int64_t)0)])));
  ;
  llvm_cbe_i = 0;

  _11 = llvm_cbe_i;
while (((int32_t)_11) < ((int32_t)7u)){
  agm(((&llvm_cbe_x0.array[((int64_t)0)])), ((&llvm_cbe_y0.array[((int64_t)0)])), ((&llvm_cbe_resA.array[((int64_t)0)])), ((&llvm_cbe_resB.array[((int64_t)0)])));
  agm(((&llvm_cbe_resA.array[((int64_t)0)])), ((&llvm_cbe_resB.array[((int64_t)0)])), ((&llvm_cbe_x0.array[((int64_t)0)])), ((&llvm_cbe_y0.array[((int64_t)0)])));

  _12 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_12, 1));

  _11 = llvm_cbe_i;
}
  llvm_cbe_call = __gmp_printf(((&_OC_str.array[((int64_t)0)])), ((&llvm_cbe_x0.array[((int64_t)0)])));
  llvm_cbe_call16 = __gmp_printf(((&_OC_str_OC_1.array[((int64_t)0)])), ((&llvm_cbe_y0.array[((int64_t)0)])));
  return 0;
}

