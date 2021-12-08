/* Provide Declarations */
#include <stdint.h>
#ifndef __cplusplus
typedef unsigned char bool;
#endif

#ifndef _MSC_VER
#define __forceinline __attribute__((always_inline)) inline
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
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
struct l_struct_struct_OC___pthread_internal_list;
struct l_struct_struct_OC___pthread_mutex_s;
struct l_struct_union_OC_pthread_mutex_t;
struct l_struct_union_OC_pthread_mutexattr_t;
struct l_struct_union_OC_pthread_attr_t;

/* Function definitions */

/* Types Definitions */
struct l_struct_struct_OC___pthread_internal_list {
  struct l_struct_struct_OC___pthread_internal_list* field0;
  struct l_struct_struct_OC___pthread_internal_list* field1;
};
struct l_struct_struct_OC___pthread_mutex_s {
  uint32_t field0;
  uint32_t field1;
  uint32_t field2;
  uint32_t field3;
  uint32_t field4;
  uint16_t field5;
  uint16_t field6;
  struct l_struct_struct_OC___pthread_internal_list field7;
};
struct l_struct_union_OC_pthread_mutex_t {
  struct l_struct_struct_OC___pthread_mutex_s field0;
};
struct l_struct_union_OC_pthread_mutexattr_t {
  uint32_t field0;
};
struct l_array_48_uint8_t {
  uint8_t array[48];
};
struct l_struct_union_OC_pthread_attr_t {
  uint64_t field0;
  struct l_array_48_uint8_t field1;
};
struct l_array_15_struct_AC_l_struct_union_OC_pthread_mutex_t {
  struct l_struct_union_OC_pthread_mutex_t array[15];
};
struct l_array_15_uint32_t {
  uint32_t array[15];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};

/* External Global Variable Declarations */

/* Function Declarations */
void transfer_value(uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t pthread_mutex_lock(struct l_struct_union_OC_pthread_mutex_t*) __ATTRIBUTELIST__((nothrow));
uint32_t pthread_mutex_unlock(struct l_struct_union_OC_pthread_mutex_t*) __ATTRIBUTELIST__((nothrow));
void print_buckets(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* equalizer_start(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t rand(void) __ATTRIBUTELIST__((nothrow));
uint8_t* randomizer_start(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t pthread_mutex_init(struct l_struct_union_OC_pthread_mutex_t*, struct l_struct_union_OC_pthread_mutexattr_t*) __ATTRIBUTELIST__((nothrow));
uint32_t pthread_create(uint64_t*, struct l_struct_union_OC_pthread_attr_t*, l_fptr_1*, uint8_t*) __ATTRIBUTELIST__((nothrow));
uint32_t sleep(uint32_t);


/* Global Variable Definitions and Initialization */
__MSALIGN__(16) struct l_array_15_struct_AC_l_struct_union_OC_pthread_mutex_t bucket_mutex __attribute__((aligned(16))) __ATTRIBUTE_WEAK__;
__MSALIGN__(16) struct l_array_15_uint32_t buckets __attribute__((aligned(16))) __ATTRIBUTE_WEAK__;
static struct l_array_5_uint8_t _OC_str = { "%3d " };
static struct l_array_6_uint8_t _OC_str_OC_1 = { "= %d\n" };
uint64_t equalizer __ATTRIBUTE_WEAK__;
uint64_t randomizer __ATTRIBUTE_WEAK__;


/* LLVM Intrinsic Builtin Function Bodies */
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
static __forceinline uint32_t llvm_neg_u32(uint32_t a) {
  uint32_t r = -a;
  return r;
}


/* Function Bodies */

void transfer_value(uint32_t llvm_cbe_from, uint32_t llvm_cbe_to, uint32_t llvm_cbe_howmuch) {
  uint32_t howmuch;
  uint8_t swapped;
  uint8_t swapped__PHI_TEMPORARY;
  uint32_t howmuch__PHI_TEMPORARY;
  uint32_t to;
  uint32_t to__PHI_TEMPORARY;
  uint32_t from;
  uint32_t from__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call15;
  uint32_t _1;
  uint32_t _2;
  uint32_t _3;
  uint32_t* llvm_cbe_arrayidx35;
  uint32_t _4;
  uint32_t* llvm_cbe_arrayidx38;
  uint32_t _5;
  uint32_t llvm_cbe_call41;
  uint32_t llvm_cbe_call44;
  uint32_t llvm_cbe_howmuch_2e_addr_2e_1_2e_splitted1;
  uint32_t llvm_cbe_howmuch_2e_addr_2e_1_2e_splitted1__PHI_TEMPORARY;
  uint32_t _6;
  uint32_t llvm_cbe_howmuch_2e_addr_2e_1_2e_splitted2;
  uint32_t llvm_cbe_howmuch_2e_addr_2e_1_2e_splitted2__PHI_TEMPORARY;
  uint32_t _7;
  uint32_t llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted1;
  uint32_t llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted1__PHI_TEMPORARY;
  uint32_t* llvm_cbe_arrayidx35_2e_splitted1;
  uint32_t _8;
  uint32_t* llvm_cbe_arrayidx38_2e_splitted1;
  uint32_t _9;
  uint32_t llvm_cbe_call41_2e_splitted1;
  uint32_t llvm_cbe_call44_2e_splitted1;
  uint32_t llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted2;
  uint32_t llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted2__PHI_TEMPORARY;
  uint32_t* llvm_cbe_arrayidx35_2e_splitted2;
  uint32_t _10;
  uint32_t* llvm_cbe_arrayidx38_2e_splitted2;
  uint32_t _11;
  uint32_t llvm_cbe_call41_2e_splitted2;
  uint32_t llvm_cbe_call44_2e_splitted2;
  uint32_t llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted3;
  uint32_t llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted3__PHI_TEMPORARY;
  uint32_t* llvm_cbe_arrayidx35_2e_splitted3;
  uint32_t _12;
  uint32_t* llvm_cbe_arrayidx38_2e_splitted3;
  uint32_t _13;
  uint32_t llvm_cbe_call41_2e_splitted3;
  uint32_t llvm_cbe_call44_2e_splitted3;
  uint32_t llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted4;
  uint32_t llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted4__PHI_TEMPORARY;
  uint32_t* llvm_cbe_arrayidx35_2e_splitted4;
  uint32_t _14;
  uint32_t* llvm_cbe_arrayidx38_2e_splitted4;
  uint32_t _15;
  uint32_t llvm_cbe_call41_2e_splitted4;
  uint32_t llvm_cbe_call44_2e_splitted4;

  ;
  ;
  ;
  ;
  if ((((llvm_cbe_from == llvm_cbe_to)&1))) {

  return;
}
  if ((((((int32_t)llvm_cbe_howmuch) < ((int32_t)0u))&1))) {

  return;
}
  if ((((((int32_t)llvm_cbe_from) < ((int32_t)0u))&1))) {

  return;
}
  if ((((((int32_t)llvm_cbe_to) < ((int32_t)0u))&1))) {

  return;
}
  if ((((((int32_t)llvm_cbe_from) >= ((int32_t)15u))&1))) {

  return;
}
  if ((((((int32_t)llvm_cbe_to) >= ((int32_t)15u))&1))) {

  return;
}
  if ((((((int32_t)llvm_cbe_from) > ((int32_t)llvm_cbe_to))&1))) {
  ;
  ;
  ;
  ;
  howmuch = llvm_neg_u32(llvm_cbe_howmuch);
  ;
  swapped__PHI_TEMPORARY = 1;   /* for PHI node */
  howmuch__PHI_TEMPORARY = howmuch;   /* for PHI node */
  to__PHI_TEMPORARY = llvm_cbe_from;   /* for PHI node */
  from__PHI_TEMPORARY = llvm_cbe_to;   /* for PHI node */

}
  swapped = swapped__PHI_TEMPORARY;
  howmuch = howmuch__PHI_TEMPORARY;
  to = to__PHI_TEMPORARY;
  from = from__PHI_TEMPORARY;
  ;
  ;
  ;
  ;
  llvm_cbe_call = pthread_mutex_lock(((&bucket_mutex.array[((int64_t)(((int64_t)(int32_t)from)))])));
  llvm_cbe_call15 = pthread_mutex_lock(((&bucket_mutex.array[((int64_t)(((int64_t)(int32_t)to)))])));
  _1 = *((&buckets.array[((int64_t)(((int64_t)(int32_t)from)))]));
  if ((((((int32_t)howmuch) > ((int32_t)_1))&1))) {
  if ((((((bool)swapped&1u))&1))) {
    llvm_cbe_howmuch_2e_addr_2e_1_2e_splitted1__PHI_TEMPORARY = howmuch;   /* for PHI node */
  llvm_cbe_howmuch_2e_addr_2e_1_2e_splitted1 = llvm_cbe_howmuch_2e_addr_2e_1_2e_splitted1__PHI_TEMPORARY;
  ;
  _6 = *((&buckets.array[((int64_t)(((int64_t)(int32_t)to)))]));
  if (!(((((int32_t)(llvm_neg_u32(llvm_cbe_howmuch_2e_addr_2e_1_2e_splitted1))) > ((int32_t)_6))&1))) {
    llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted1__PHI_TEMPORARY = llvm_cbe_howmuch_2e_addr_2e_1_2e_splitted2;   /* for PHI node */
  llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted1 = llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted1__PHI_TEMPORARY;
  ;
  llvm_cbe_arrayidx35_2e_splitted1 = (&buckets.array[((int64_t)(((int64_t)(int32_t)from)))]);
  _8 = *llvm_cbe_arrayidx35_2e_splitted1;
  *llvm_cbe_arrayidx35_2e_splitted1 = (llvm_sub_u32(_8, llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted1));
  llvm_cbe_arrayidx38_2e_splitted1 = (&buckets.array[((int64_t)(((int64_t)(int32_t)to)))]);
  _9 = *llvm_cbe_arrayidx38_2e_splitted1;
  *llvm_cbe_arrayidx38_2e_splitted1 = (llvm_add_u32(_9, llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted1));
  llvm_cbe_call41_2e_splitted1 = pthread_mutex_unlock(((&bucket_mutex.array[((int64_t)(((int64_t)(int32_t)from)))])));
  llvm_cbe_call44_2e_splitted1 = pthread_mutex_unlock(((&bucket_mutex.array[((int64_t)(((int64_t)(int32_t)to)))])));

  return;
}
  if (!(((((bool)swapped&1u))&1))) {
    llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted3__PHI_TEMPORARY = howmuch;   /* for PHI node */
  llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted3 = llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted3__PHI_TEMPORARY;
  ;
  llvm_cbe_arrayidx35_2e_splitted3 = (&buckets.array[((int64_t)(((int64_t)(int32_t)from)))]);
  _12 = *llvm_cbe_arrayidx35_2e_splitted3;
  *llvm_cbe_arrayidx35_2e_splitted3 = (llvm_sub_u32(_12, llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted3));
  llvm_cbe_arrayidx38_2e_splitted3 = (&buckets.array[((int64_t)(((int64_t)(int32_t)to)))]);
  _13 = *llvm_cbe_arrayidx38_2e_splitted3;
  *llvm_cbe_arrayidx38_2e_splitted3 = (llvm_add_u32(_13, llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted3));
  llvm_cbe_call41_2e_splitted3 = pthread_mutex_unlock(((&bucket_mutex.array[((int64_t)(((int64_t)(int32_t)from)))])));
  llvm_cbe_call44_2e_splitted3 = pthread_mutex_unlock(((&bucket_mutex.array[((int64_t)(((int64_t)(int32_t)to)))])));

  return;
}
  _3 = *((&buckets.array[((int64_t)(((int64_t)(int32_t)to)))]));
  howmuch = llvm_neg_u32(_3);
  ;
  llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted2__PHI_TEMPORARY = howmuch;   /* for PHI node */

  llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted2 = llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted2__PHI_TEMPORARY;
  ;
  llvm_cbe_arrayidx35_2e_splitted2 = (&buckets.array[((int64_t)(((int64_t)(int32_t)from)))]);
  _10 = *llvm_cbe_arrayidx35_2e_splitted2;
  *llvm_cbe_arrayidx35_2e_splitted2 = (llvm_sub_u32(_10, llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted2));
  llvm_cbe_arrayidx38_2e_splitted2 = (&buckets.array[((int64_t)(((int64_t)(int32_t)to)))]);
  _11 = *llvm_cbe_arrayidx38_2e_splitted2;
  *llvm_cbe_arrayidx38_2e_splitted2 = (llvm_add_u32(_11, llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted2));
  llvm_cbe_call41_2e_splitted2 = pthread_mutex_unlock(((&bucket_mutex.array[((int64_t)(((int64_t)(int32_t)from)))])));
  llvm_cbe_call44_2e_splitted2 = pthread_mutex_unlock(((&bucket_mutex.array[((int64_t)(((int64_t)(int32_t)to)))])));

  } else {
  howmuch = *((&buckets.array[((int64_t)(((int64_t)(int32_t)from)))]));
  ;
  howmuch__PHI_TEMPORARY = howmuch;   /* for PHI node */

  howmuch = howmuch__PHI_TEMPORARY;
  ;
  _2 = *((&buckets.array[((int64_t)(((int64_t)(int32_t)to)))]));
  if (!(((((int32_t)(llvm_neg_u32(howmuch))) > ((int32_t)_2))&1))) {
    llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted4__PHI_TEMPORARY = howmuch;   /* for PHI node */
  llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted4 = llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted4__PHI_TEMPORARY;
  ;
  llvm_cbe_arrayidx35_2e_splitted4 = (&buckets.array[((int64_t)(((int64_t)(int32_t)from)))]);
  _14 = *llvm_cbe_arrayidx35_2e_splitted4;
  *llvm_cbe_arrayidx35_2e_splitted4 = (llvm_sub_u32(_14, llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted4));
  llvm_cbe_arrayidx38_2e_splitted4 = (&buckets.array[((int64_t)(((int64_t)(int32_t)to)))]);
  _15 = *llvm_cbe_arrayidx38_2e_splitted4;
  *llvm_cbe_arrayidx38_2e_splitted4 = (llvm_add_u32(_15, llvm_cbe_howmuch_2e_addr_2e_2_2e_splitted4));
  llvm_cbe_call41_2e_splitted4 = pthread_mutex_unlock(((&bucket_mutex.array[((int64_t)(((int64_t)(int32_t)from)))])));
  llvm_cbe_call44_2e_splitted4 = pthread_mutex_unlock(((&bucket_mutex.array[((int64_t)(((int64_t)(int32_t)to)))])));

  return;
}
}
  } else {
    llvm_cbe_howmuch_2e_addr_2e_1_2e_splitted2__PHI_TEMPORARY = howmuch;   /* for PHI node */
  llvm_cbe_howmuch_2e_addr_2e_1_2e_splitted2 = llvm_cbe_howmuch_2e_addr_2e_1_2e_splitted2__PHI_TEMPORARY;
  ;
  _7 = *((&buckets.array[((int64_t)(((int64_t)(int32_t)to)))]));
  if (!(((((int32_t)(llvm_neg_u32(llvm_cbe_howmuch_2e_addr_2e_1_2e_splitted2))) > ((int32_t)_7))&1))) {
    howmuch__PHI_TEMPORARY = llvm_cbe_howmuch_2e_addr_2e_1_2e_splitted2;   /* for PHI node */
  howmuch = howmuch__PHI_TEMPORARY;
  ;
  llvm_cbe_arrayidx35 = (&buckets.array[((int64_t)(((int64_t)(int32_t)from)))]);
  _4 = *llvm_cbe_arrayidx35;
  *llvm_cbe_arrayidx35 = (llvm_sub_u32(_4, howmuch));
  llvm_cbe_arrayidx38 = (&buckets.array[((int64_t)(((int64_t)(int32_t)to)))]);
  _5 = *llvm_cbe_arrayidx38;
  *llvm_cbe_arrayidx38 = (llvm_add_u32(_5, howmuch));
  llvm_cbe_call41 = pthread_mutex_unlock(((&bucket_mutex.array[((int64_t)(((int64_t)(int32_t)from)))])));
  llvm_cbe_call44 = pthread_mutex_unlock(((&bucket_mutex.array[((int64_t)(((int64_t)(int32_t)to)))])));

  return;
}
}
  return;
}


void print_buckets(void) {
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;
  uint32_t sum;
  uint32_t sum__PHI_TEMPORARY;
  uint32_t _16;
  uint32_t llvm_cbe_call6;
  uint32_t _17;
  uint32_t llvm_cbe_call12;
  uint32_t llvm_cbe_call18;

  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)15u)){
  llvm_cbe_call = pthread_mutex_lock(((&bucket_mutex.array[((int64_t)(((int64_t)(int32_t)i)))])));

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  ;
  sum__PHI_TEMPORARY = 0;   /* for PHI node */
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  sum = sum__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) < ((int32_t)15u)){
  _16 = *((&buckets.array[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call6 = printf(((&_OC_str.array[((int64_t)0)])), _16);
  _17 = *((&buckets.array[((int64_t)(((int64_t)(int32_t)i)))]));
  sum = llvm_add_u32(sum, _17);
  ;

  i = llvm_add_u32(i, 1);
  ;
  sum__PHI_TEMPORARY = sum;   /* for PHI node */
  i__PHI_TEMPORARY = i;   /* for PHI node */

  sum = sum__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
}
  llvm_cbe_call12 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), sum);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)15u)){
  llvm_cbe_call18 = pthread_mutex_unlock(((&bucket_mutex.array[((int64_t)(((int64_t)(int32_t)i)))])));

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return;
}


uint8_t* equalizer_start(uint8_t* llvm_cbe_t) {
  uint32_t llvm_cbe_call;
  uint32_t b1;
  uint32_t llvm_cbe_call1;
  uint32_t b2;
  uint32_t _18;
  uint32_t _19;
  uint32_t diff;

  ;

){
  transfer_value(b1, b2, (llvm_sdiv_u32(diff, 2)));

  transfer_value(b2, b1, (llvm_sdiv_u32((llvm_neg_u32(diff)), 2)));


  llvm_cbe_call = rand();
  b1 = llvm_srem_u32(llvm_cbe_call, 15);
  ;
  llvm_cbe_call1 = rand();
  b2 = llvm_srem_u32(llvm_cbe_call1, 15);
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)b1);
  llvm_cbe_arrayidx = (&buckets.array[((int64_t)(((int64_t)(int32_t)b1)))]);
  _18 = *((&buckets.array[((int64_t)(((int64_t)(int32_t)b1)))]));
  llvm_cbe_idxprom3 = ((int64_t)(int32_t)b2);
  llvm_cbe_arrayidx4 = (&buckets.array[((int64_t)(((int64_t)(int32_t)b2)))]);
  _19 = *((&buckets.array[((int64_t)(((int64_t)(int32_t)b2)))]));
  diff = llvm_sub_u32(_18, _19);
  ;
  llvm_cbe_cmp = ((((int32_t)diff) < ((int32_t)0u))&1);
    if (!(((((int32_t)diff) < ((int32_t)0u))&1))) {
  }

;
}
}


uint8_t* randomizer_start(uint8_t* llvm_cbe_t) {
  uint32_t llvm_cbe_call;
  uint32_t b1;
  uint32_t llvm_cbe_call1;
  uint32_t llvm_cbe_call3;
  uint32_t _20;

  ;

){
  llvm_cbe_call = rand();
  b1 = llvm_srem_u32(llvm_cbe_call, 15);
  ;
  llvm_cbe_call1 = rand();
  b2 = llvm_srem_u32(llvm_cbe_call1, 15);
  ;
  llvm_cbe_call3 = rand();
  llvm_cbe_idxprom = ((int64_t)(int32_t)b1);
  llvm_cbe_arrayidx = (&buckets.array[((int64_t)(((int64_t)(int32_t)b1)))]);
  _20 = *((&buckets.array[((int64_t)(((int64_t)(int32_t)b1)))]));
  llvm_cbe_add = llvm_add_u32(_20, 1);
  diff = llvm_srem_u32(llvm_cbe_call3, (llvm_add_u32(_20, 1)));
  ;
  transfer_value(b1, (llvm_srem_u32(llvm_cbe_call1, 15)), (llvm_srem_u32(llvm_cbe_call3, (llvm_add_u32(_20, 1)))));
  
;
}
}


int main(void) {
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;
  uint32_t total;
  uint32_t total__PHI_TEMPORARY;
  uint32_t llvm_cbe_call4;
  uint32_t _21;
  uint32_t _22;
  uint32_t llvm_cbe_call11;
  uint32_t llvm_cbe_call15;
  uint32_t llvm_cbe_call16;
  uint32_t llvm_cbe_call17;
  uint32_t llvm_cbe_call19;

  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)15u)){
  llvm_cbe_call = pthread_mutex_init(((&bucket_mutex.array[((int64_t)(((int64_t)(int32_t)i)))])), ((struct l_struct_union_OC_pthread_mutexattr_t*)/*NULL*/0));

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  total__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  total = total__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) < ((int32_t)15u)){
  llvm_cbe_call4 = rand();
  *((&buckets.array[((int64_t)(((int64_t)(int32_t)i)))])) = (llvm_srem_u32(llvm_cbe_call4, 100));
  _21 = *((&buckets.array[((int64_t)(((int64_t)(int32_t)i)))]));
  total = llvm_add_u32(total, _21);
  ;
  _22 = *((&buckets.array[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call11 = printf(((&_OC_str.array[((int64_t)0)])), _22);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  total__PHI_TEMPORARY = total;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  total = total__PHI_TEMPORARY;
  ;
  ;
}
  llvm_cbe_call15 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), total);
  llvm_cbe_call16 = pthread_create((&equalizer), ((struct l_struct_union_OC_pthread_attr_t*)/*NULL*/0), equalizer_start, ((uint8_t*)/*NULL*/0));
  llvm_cbe_call17 = pthread_create((&randomizer), ((struct l_struct_union_OC_pthread_attr_t*)/*NULL*/0), randomizer_start, ((uint8_t*)/*NULL*/0));

){
  llvm_cbe_call19 = sleep(1);
  print_buckets();
  
;
}
}

