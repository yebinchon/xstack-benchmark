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
struct l_struct_struct_OC_client;
struct l_struct_struct_OC_fd_set;
struct l_struct_struct_OC_in_addr;
struct l_struct_struct_OC_sockaddr_in;
struct l_struct_struct_OC_timeval;
struct l_struct_struct_OC_sockaddr;
struct l_unnamed_1;

/* Function definitions */
typedef uint32_t l_fptr_3(uint32_t, uint8_t*, uint32_t, ...);

typedef uint32_t l_fptr_1(uint32_t, uint8_t*, uint64_t, ...);

typedef uint32_t l_fptr_2(uint32_t, ...);


/* Types Definitions */
struct l_array_4096_uint8_t {
  uint8_t array[4096];
};
struct l_array_32_uint8_t {
  uint8_t array[32];
};
struct l_struct_struct_OC_client {
  struct l_array_4096_uint8_t field0;
  uint32_t field1;
  struct l_array_32_uint8_t field2;
};
struct l_array_16_uint64_t {
  uint64_t array[16];
};
struct l_struct_struct_OC_fd_set {
  struct l_array_16_uint64_t field0;
};
struct l_struct_struct_OC_in_addr {
  uint32_t field0;
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_struct_struct_OC_sockaddr_in {
  uint16_t field0;
  uint16_t field1;
  struct l_struct_struct_OC_in_addr field2;
  struct l_array_8_uint8_t field3;
};
struct l_struct_struct_OC_timeval {
  uint64_t field0;
  uint64_t field1;
};
struct l_array_14_uint8_t {
  uint8_t array[14];
};
struct l_struct_struct_OC_sockaddr {
  uint16_t field0;
  struct l_array_14_uint8_t field1;
};
struct l_array_1024_struct_AC_l_struct_struct_OC_client_KC_ {
  struct l_struct_struct_OC_client* array[1024];
};
struct l_array_21_uint8_t {
  uint8_t array[21];
};
struct l_array_31_uint8_t {
  uint8_t array[31];
};
struct l_array_18_uint8_t {
  uint8_t array[18];
};
struct l_array_11_uint8_t {
  uint8_t array[11];
};
struct l_array_7_uint8_t {
  uint8_t array[7];
};
struct l_array_27_uint8_t {
  uint8_t array[27];
};
struct l_array_34_uint8_t {
  uint8_t array[34];
};
struct l_array_13_uint8_t {
  uint8_t array[13];
};
struct l_array_23_uint8_t {
  uint8_t array[23];
};
struct l_array_24_uint8_t {
  uint8_t array[24];
};
struct l_array_512_uint8_t {
  uint8_t array[512];
};
struct l_array_8000_uint8_t {
  uint8_t array[8000];
};
struct l_unnamed_1 {
  uint64_t field0;
  uint64_t* field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
void AddConnection(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
void CloseConnection(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t sprintf(uint8_t*, uint8_t*, ...) __ATTRIBUTELIST__((nothrow));
uint32_t write(int, ...);
uint64_t strlen(uint8_t*);
uint32_t printf(uint8_t*, ...);
void free(uint8_t*) __ATTRIBUTELIST__((nothrow));
uint32_t close(int, ...);
void strip(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* strchr(uint8_t*, uint32_t);
uint32_t RelayText(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* strncpy(uint8_t*, uint8_t*, uint64_t);
uint8_t* strcpy(uint8_t*, uint8_t*);
void ClientText(uint32_t, uint8_t*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t ChatLoop(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t select(uint32_t, struct l_struct_struct_OC_fd_set*, struct l_struct_struct_OC_fd_set*, struct l_struct_struct_OC_fd_set*, struct l_struct_struct_OC_timeval*);
void perror(uint8_t*);
uint32_t accept(uint32_t, struct l_struct_struct_OC_sockaddr*, uint32_t*);
uint32_t inet_ntoa(int, ...);
uint16_t ntohs(uint16_t) __ATTRIBUTELIST__((nothrow, const));
uint32_t read(int, ...);
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t socket(uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((nothrow));
uint16_t htons(uint16_t) __ATTRIBUTELIST__((nothrow, const));
uint32_t atoi(uint8_t*) __ATTRIBUTELIST__((nothrow, pure));
uint32_t htonl(uint32_t) __ATTRIBUTELIST__((nothrow, const));
uint32_t bind(uint32_t, struct l_struct_struct_OC_sockaddr*, uint32_t) __ATTRIBUTELIST__((nothrow));
uint32_t listen(uint32_t, uint32_t) __ATTRIBUTELIST__((nothrow));
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
__MSALIGN__(16) struct l_array_1024_struct_AC_l_struct_struct_OC_client_KC_ connections __attribute__((aligned(16))) __ATTRIBUTE_WEAK__;
struct l_struct_struct_OC_fd_set status __ATTRIBUTE_WEAK__;
static struct l_array_21_uint8_t _OC_str = { "* Disconnected: %s\r\n" };
uint32_t tsocket __ATTRIBUTE_WEAK__;
static struct l_array_31_uint8_t _OC_str_OC_1 = { "-- Connection %d disconnected\n" };
static struct l_array_18_uint8_t _OC_str_OC_2 = { "* Connected: %s\r\n" };
static struct l_array_11_uint8_t _OC_str_OC_3 = { "%s: %.*s\r\n" };
struct l_struct_struct_OC_fd_set current __ATTRIBUTE_WEAK__;
static struct l_array_7_uint8_t _OC_str_OC_4 = { "Select" };
static struct l_array_27_uint8_t _OC_str_OC_5 = { "Couldn't accept connection" };
static struct l_array_34_uint8_t _OC_str_OC_6 = { "Unable to accept new connection.\n" };
static struct l_array_13_uint8_t _OC_str_OC_7 = { "Enter name: " };
static struct l_array_34_uint8_t _OC_str_OC_8 = { "-- New connection %d from %s:%hu\n" };
struct l_struct_struct_OC_sockaddr_in tsockinfo __ATTRIBUTE_WEAK__;
static struct l_array_23_uint8_t _OC_str_OC_9 = { "Socket %d on port %hu\n" };
static struct l_array_21_uint8_t _OC_str_OC_10 = { "Couldn't bind socket" };
static struct l_array_24_uint8_t _OC_str_OC_11 = { "Couldn't listen to port" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_sub_u64(uint64_t a, uint64_t b) {
  uint64_t r = a - b;
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

void AddConnection(uint32_t llvm_cbe_handle) {
  uint8_t* llvm_cbe_call;
  struct l_struct_struct_OC_client* _1;
  struct l_struct_struct_OC_client* _2;
  struct l_struct_struct_OC_client* _3;

  ;
  llvm_cbe_call = malloc(4132);
  *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))])) = (((struct l_struct_struct_OC_client*)llvm_cbe_call));
  _1 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  *((&(*((&_1->field0))).array[((int64_t)0)])) = 0;
  _2 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  *((&_2->field1)) = 0;
  _3 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  *((&(*((&_3->field2))).array[((int64_t)0)])) = 0;
}


void CloseConnection(uint32_t llvm_cbe_handle) {
  __MSALIGN__(16) struct l_array_512_uint8_t llvm_cbe_buf __attribute__((aligned(16)));    /* Address-exposed local */
  uint64_t* llvm_cbe_arrayidx;
  uint64_t _4;
  struct l_struct_struct_OC_client* _5;
  uint8_t _6;
  struct l_struct_struct_OC_client* _7;
  uint32_t llvm_cbe_call;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  uint32_t _8;
  uint64_t _9;
  uint64_t llvm_cbe_call22;
  uint32_t llvm_cbe_call23;
  uint32_t llvm_cbe_call27;
  struct l_struct_struct_OC_client* _10;
  struct l_struct_struct_OC_client* _11;
  uint32_t llvm_cbe_call36;

  ;
  ;
  llvm_cbe_arrayidx = (&(*((&status.field0))).array[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(llvm_cbe_handle, 64)))))]);
  _4 = *llvm_cbe_arrayidx;
  *llvm_cbe_arrayidx = (_4 & (~((1 << (((uint64_t)(uint32_t)(llvm_srem_u32(llvm_cbe_handle, 64))))))));
  _5 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  _6 = *((&(*((&_5->field2))).array[((int64_t)0)]));
  if ((((_6 != ((uint8_t)0))&1))) {
  _7 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  llvm_cbe_call = sprintf(((&llvm_cbe_buf.array[((int64_t)0)])), ((&_OC_str.array[((int64_t)0)])), ((&(*((&_7->field2))).array[((int64_t)0)])));
  ;
  j__PHI_TEMPORARY = 0;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
  if (!(((((int32_t)j) < ((int32_t)1024u))&1))) {
  }

  if ((((llvm_cbe_handle != j)&1))) {
  _8 = tsocket;
  if ((((j != _8)&1))) {
  _9 = *((&(*((&status.field0))).array[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(j, 64)))))]));
  if (((((_9 & (1 << (((uint64_t)(uint32_t)(llvm_srem_u32(j, 64)))))) != UINT64_C(0))&1))) {
  llvm_cbe_call22 = strlen(((&llvm_cbe_buf.array[((int64_t)0)])));
  llvm_cbe_call23 = ((l_fptr_1*)(void*)write)(j, ((&llvm_cbe_buf.array[((int64_t)0)])), llvm_cbe_call22);
  if ((((((int32_t)llvm_cbe_call23) < ((int32_t)0u))&1))) {
  CloseConnection(j);

}


  } else {

}
  } else {

}
  } else {

}

  } else {
  llvm_cbe_call27 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), llvm_cbe_handle);

}
  j = j__PHI_TEMPORARY;
  ;
while (((int32_t)j) < ((int32_t)1024u)){
  j = llvm_add_u32(j, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
}
  _10 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  if ((((_10 != ((struct l_struct_struct_OC_client*)/*NULL*/0))&1))) {
  _11 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  free((((uint8_t*)_11)));

  llvm_cbe_call36 = ((l_fptr_2*)(void*)close)(llvm_cbe_handle);
  return;
}
  llvm_cbe_call36 = ((l_fptr_2*)(void*)close)(llvm_cbe_handle);
  return;
}


void strip(uint8_t* llvm_cbe_buf) {
  uint8_t* x;

  ;
  x = strchr(llvm_cbe_buf, 10);
  ;
  if ((((x != ((uint8_t*)/*NULL*/0))&1))) {
  *x = 0;

}
  x = strchr(llvm_cbe_buf, 13);
  ;
  if ((((x != ((uint8_t*)/*NULL*/0))&1))) {
  *x = 0;

  return;
}
  return;
}


uint32_t RelayText(uint32_t llvm_cbe_handle) {
  __MSALIGN__(16) struct l_array_8000_uint8_t llvm_cbe_output __attribute__((aligned(16)));    /* Address-exposed local */
  struct l_struct_struct_OC_client* _12;
  uint8_t* begin;
  struct l_struct_struct_OC_client* _13;
  uint32_t _14;
  uint8_t _15;
  struct l_struct_struct_OC_client* _16;
  uint32_t _17;
  uint8_t* end;
  uint32_t ret;
  uint32_t ret__PHI_TEMPORARY;
  uint8_t* end__PHI_TEMPORARY;
  uint8_t* begin__PHI_TEMPORARY;
  struct l_struct_struct_OC_client* _18;
  uint8_t _19;
  struct l_struct_struct_OC_client* _20;
  uint8_t* llvm_cbe_call28;
  struct l_struct_struct_OC_client* _21;
  struct l_struct_struct_OC_client* _22;
  struct l_struct_struct_OC_client* _23;
  uint32_t llvm_cbe_call42;
  struct l_struct_struct_OC_client* _24;
  uint32_t llvm_cbe_call49;
  uint8_t _25;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  uint32_t _26;
  uint64_t _27;
  uint64_t llvm_cbe_call68;
  uint32_t llvm_cbe_call69;
  struct l_struct_struct_OC_client* _28;
  uint8_t* llvm_cbe_call81;
  struct l_struct_struct_OC_client* _29;
  struct l_struct_struct_OC_client* _30;
  uint32_t* llvm_cbe_pos91;
  uint32_t _31;

  ;
  ;
  _12 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  begin = (&(*((&_12->field0))).array[((int64_t)0)]);
  ;
  _13 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  _14 = *((&_13->field1));
  if ((((_14 == 4000u)&1))) {
  _15 = *((&begin[((int64_t)3999)]));
  if (((((((int32_t)(int8_t)_15)) != 10u)&1))) {
  *((&begin[((int64_t)4000)])) = 0;

  } else {
  *((&begin[((int64_t)4000)])) = 10;
  *((&begin[((int64_t)4001)])) = 0;

}
  } else {
  _16 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  _17 = *((&_16->field1));
  *((&begin[((int64_t)(((int64_t)(int32_t)_17)))])) = 0;

}

  end = strchr(begin, 10);
  ;
  ret__PHI_TEMPORARY = 0;   /* for PHI node */
  end__PHI_TEMPORARY = end;   /* for PHI node */
  begin__PHI_TEMPORARY = begin;   /* for PHI node */

  ret = ret__PHI_TEMPORARY;
  end = end__PHI_TEMPORARY;
  begin = begin__PHI_TEMPORARY;
  ;
  ;
  ;
while (end != ((uint8_t*)/*NULL*/0)){
  ;
  *((&llvm_cbe_output.array[((int64_t)0)])) = 0;
  _18 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  _19 = *((&(*((&_18->field2))).array[((int64_t)0)]));
  if ((((_19 != ((uint8_t)0))&1))) {
  _24 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  llvm_cbe_call49 = sprintf(((&llvm_cbe_output.array[((int64_t)0)])), ((&_OC_str_OC_3.array[((int64_t)0)])), ((&(*((&_24->field2))).array[((int64_t)0)])), (llvm_sub_u64((((uint64_t)(uintptr_t)end)), (((uint64_t)(uintptr_t)begin)))), begin);
  ;

  } else {
  _20 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  llvm_cbe_call28 = strncpy(((&(*((&_20->field2))).array[((int64_t)0)])), begin, 31);
  _21 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  *((&(*((&_21->field2))).array[((int64_t)31)])) = 0;
  _22 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  strip(((&(*((&_22->field2))).array[((int64_t)0)])));
  _23 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  llvm_cbe_call42 = sprintf(((&llvm_cbe_output.array[((int64_t)0)])), ((&_OC_str_OC_2.array[((int64_t)0)])), ((&(*((&_23->field2))).array[((int64_t)0)])));
  ;

}
  ;
  _25 = *((&llvm_cbe_output.array[((int64_t)0)]));
  if ((((_25 != ((uint8_t)0))&1))) {
  ;
  j__PHI_TEMPORARY = 0;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
  if (!(((((int32_t)j) < ((int32_t)1024u))&1))) {
  }

  if ((((llvm_cbe_handle != j)&1))) {
  _26 = tsocket;
  if ((((j != _26)&1))) {
  _27 = *((&(*((&status.field0))).array[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(j, 64)))))]));
  if (((((_27 & (1 << (((uint64_t)(uint32_t)(llvm_srem_u32(j, 64)))))) != UINT64_C(0))&1))) {
  llvm_cbe_call68 = strlen(((&llvm_cbe_output.array[((int64_t)0)])));
  llvm_cbe_call69 = ((l_fptr_1*)(void*)write)(j, ((&llvm_cbe_output.array[((int64_t)0)])), llvm_cbe_call68);
  if ((((((int32_t)llvm_cbe_call69) < ((int32_t)0u))&1))) {
  CloseConnection(j);

}


  } else {

}
  } else {

}
  } else {

}

}
  j = j__PHI_TEMPORARY;
  ;
while (((int32_t)j) < ((int32_t)1024u)){
  j = llvm_add_u32(j, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
}
  begin = (&end[((int64_t)1)]);
  ;
  end = strchr(begin, 10);
  ;
  ret__PHI_TEMPORARY = 1;   /* for PHI node */
  end__PHI_TEMPORARY = end;   /* for PHI node */
  begin__PHI_TEMPORARY = begin;   /* for PHI node */

  ret = ret__PHI_TEMPORARY;
  end = end__PHI_TEMPORARY;
  begin = begin__PHI_TEMPORARY;
  ;
  ;
  ;
}
  _28 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  llvm_cbe_call81 = strcpy(((&(*((&_28->field0))).array[((int64_t)0)])), begin);
  _29 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  _30 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  llvm_cbe_pos91 = (&_30->field1);
  _31 = *llvm_cbe_pos91;
  *llvm_cbe_pos91 = (((uint32_t)(llvm_sub_u64((((int64_t)(int32_t)_31)), (llvm_sub_u64((((uint64_t)(uintptr_t)begin)), (((uint64_t)(uintptr_t)((&(*((&_29->field0))).array[((int64_t)0)]))))))))));
  return ret;
}


void ClientText(uint32_t llvm_cbe_handle, uint8_t* llvm_cbe_buf, uint32_t llvm_cbe_buf_len) {
  struct l_struct_struct_OC_client* _32;
  struct l_struct_struct_OC_client* _33;
  uint32_t j;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t j__PHI_TEMPORARY;
  uint8_t _34;
  struct l_struct_struct_OC_client* _35;
  uint32_t llvm_cbe_call;
  struct l_struct_struct_OC_client* _36;
  struct l_struct_struct_OC_client* _37;
  uint32_t llvm_cbe_call21;

  ;
  ;
  ;
  _32 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  if (!(((_32 != ((struct l_struct_struct_OC_client*)/*NULL*/0))&1))) {

  return;
}
  _33 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  j = *((&_33->field1));
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) < ((int32_t)llvm_cbe_buf_len)){
  _34 = *((&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)i)))]));
  _35 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  *((&(*((&_35->field0))).array[((int64_t)(((int64_t)(int32_t)j)))])) = _34;
  if ((((j == 4000u)&1))) {

  llvm_cbe_call = RelayText(llvm_cbe_handle);
  if (!(((llvm_cbe_call != 0u)&1))) {
  }


  _36 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  j = *((&_36->field1));
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */

}
  llvm_cbe_call = RelayText(llvm_cbe_handle);
while (llvm_cbe_call != 0u){
  llvm_cbe_call = RelayText(llvm_cbe_handle);
}
  j = j__PHI_TEMPORARY;
  ;

  i = llvm_add_u32(i, 1);
  ;
  j = llvm_add_u32(j, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
}
  _37 = *((&connections.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_handle)))]));
  *((&_37->field1)) = j;

  llvm_cbe_call21 = RelayText(llvm_cbe_handle);
while (llvm_cbe_call21 != 0u){

  llvm_cbe_call21 = RelayText(llvm_cbe_handle);
}

  return;
}


uint32_t ChatLoop(void) {
  struct l_struct_struct_OC_sockaddr_in llvm_cbe_cliinfo;    /* Address-exposed local */
  uint32_t llvm_cbe_addrlen;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_512_uint8_t llvm_cbe_buf __attribute__((aligned(16)));    /* Address-exposed local */
  struct l_unnamed_1 _38;
  uint32_t __d0;
  uint32_t __d1;
  uint32_t _39;
  uint32_t _40;
  uint64_t* llvm_cbe_arrayidx;
  uint64_t _41;
  uint64_t _42;
  uint8_t* _43;
  uint32_t llvm_cbe_call;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint64_t _44;
  uint32_t _45;
  uint32_t _46;
  uint32_t handle;
  uint32_t llvm_cbe_call19;
  uint32_t llvm_cbe_call20;
  uint32_t llvm_cbe_call22;
  uint32_t _47;
  uint32_t llvm_cbe_call25;
  uint16_t _48;
  uint16_t llvm_cbe_call26;
  uint32_t llvm_cbe_call27;
  uint64_t* llvm_cbe_arrayidx33;
  uint64_t _49;
  uint32_t b;

  ;

  __asm__ volatile ("cld; rep; stosq"
        :
        :);
  __d0 = ((uint32_t)((_38.field0)));
  ;
  __d1 = ((uint32_t)(((uint64_t)(uintptr_t)((_38.field1)))));
  ;

  _39 = tsocket;
  _40 = tsocket;
  llvm_cbe_arrayidx = (&(*((&status.field0))).array[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_40, 64)))))]);
  _41 = *llvm_cbe_arrayidx;
  *llvm_cbe_arrayidx = (_41 | (1 << (((uint64_t)(uint32_t)(llvm_srem_u32(_39, 64))))));
  _42 = *((&status.field0.array[((int64_t)0)]));
  *((&status.field0.array[((int64_t)0)])) = (_42 | 1);

  _43 = memcpy(((uint8_t*)(&current)), ((uint8_t*)(&status)), 128);
  llvm_cbe_call = select(1024, (&current), ((struct l_struct_struct_OC_fd_set*)/*NULL*/0), ((struct l_struct_struct_OC_fd_set*)/*NULL*/0), ((struct l_struct_struct_OC_timeval*)/*NULL*/0));
while (llvm_cbe_call == 4294967295u){
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)1024u)){
  _44 = *((&(*((&current.field0))).array[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(i, 64)))))]));
  if (((((_44 & (1 << (((uint64_t)(uint32_t)(llvm_srem_u32(i, 64)))))) != UINT64_C(0))&1))) {
  _45 = tsocket;
  if ((((i == _45)&1))) {
  ;
  ;
  llvm_cbe_addrlen = 16;
  _46 = tsocket;
  handle = accept(_46, (((struct l_struct_struct_OC_sockaddr*)(&llvm_cbe_cliinfo))), (&llvm_cbe_addrlen));
  ;
  if ((((handle == 4294967295u)&1))) {
  perror(((&_OC_str_OC_5.array[((int64_t)0)])));

  } else {
  if ((((((int32_t)handle) > ((int32_t)1024u))&1))) {
  llvm_cbe_call19 = printf(((&_OC_str_OC_6.array[((int64_t)0)])));
  llvm_cbe_call20 = ((l_fptr_2*)(void*)close)(handle);

  } else {
  llvm_cbe_call22 = ((l_fptr_3*)(void*)write)(handle, ((&_OC_str_OC_7.array[((int64_t)0)])), 12);
  if ((((((int32_t)llvm_cbe_call22) >= ((int32_t)0u))&1))) {
  _47 = *((&((&llvm_cbe_cliinfo.field2))->field0));
  llvm_cbe_call25 = ((l_fptr_2*)(void*)inet_ntoa)(_47);
  _48 = *((&llvm_cbe_cliinfo.field1));
  llvm_cbe_call26 = ntohs(_48);
  llvm_cbe_call27 = printf(((&_OC_str_OC_8.array[((int64_t)0)])), handle, llvm_cbe_call25, (((uint32_t)(uint16_t)llvm_cbe_call26)));
  llvm_cbe_arrayidx33 = (&(*((&status.field0))).array[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(handle, 64)))))]);
  _49 = *llvm_cbe_arrayidx33;
  *llvm_cbe_arrayidx33 = (_49 | (1 << (((uint64_t)(uint32_t)(llvm_srem_u32(handle, 64))))));
  AddConnection(handle);

}

}
}
  } else {
  ;
  b = ((l_fptr_3*)(void*)read)(i, ((&llvm_cbe_buf.array[((int64_t)0)])), 500);
  ;
  if ((((((int32_t)b) <= ((int32_t)0u))&1))) {
  CloseConnection(i);

  } else {
  ClientText(i, ((&llvm_cbe_buf.array[((int64_t)0)])), b);

}
}
}





  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}

  _43 = memcpy(((uint8_t*)(&current)), ((uint8_t*)(&status)), 128);
  llvm_cbe_call = select(1024, (&current), ((struct l_struct_struct_OC_fd_set*)/*NULL*/0), ((struct l_struct_struct_OC_fd_set*)/*NULL*/0), ((struct l_struct_struct_OC_timeval*)/*NULL*/0));
}
  perror(((&_OC_str_OC_4.array[((int64_t)0)])));
  return 0;
}


int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argc = (uint32_t)argc;
  uint8_t** llvm_cbe_argv = (uint8_t**)argv;
  uint32_t llvm_cbe_call;
  uint16_t llvm_cbe_call1;
  uint8_t* _50;
  uint32_t llvm_cbe_call2;
  uint16_t llvm_cbe_call3;
  uint32_t llvm_cbe_call4;
  uint32_t _51;
  uint16_t _52;
  uint16_t llvm_cbe_call5;
  uint32_t llvm_cbe_call7;
  uint32_t _53;
  uint32_t llvm_cbe_call8;
  uint32_t _54;
  uint32_t llvm_cbe_call13;
  uint32_t llvm_cbe_call18;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  llvm_cbe_call = socket(2, 1, 0);
  tsocket = llvm_cbe_call;
  *((&tsockinfo.field0)) = 2;
  llvm_cbe_call1 = htons(7070);
  *((&tsockinfo.field1)) = llvm_cbe_call1;
  if ((((((int32_t)llvm_cbe_argc) > ((int32_t)1u))&1))) {
  _50 = *((&llvm_cbe_argv[((int64_t)1)]));
  llvm_cbe_call2 = atoi(_50);
  llvm_cbe_call3 = htons((((uint16_t)llvm_cbe_call2)));
  *((&tsockinfo.field1)) = llvm_cbe_call3;

}
  llvm_cbe_call4 = htonl(0);
  *((&tsockinfo.field2.field0)) = llvm_cbe_call4;
  _51 = tsocket;
  _52 = *((&tsockinfo.field1));
  llvm_cbe_call5 = ntohs(_52);
  llvm_cbe_call7 = printf(((&_OC_str_OC_9.array[((int64_t)0)])), _51, (((uint32_t)(uint16_t)llvm_cbe_call5)));
  _53 = tsocket;
  llvm_cbe_call8 = bind(_53, ((struct l_struct_struct_OC_sockaddr*)(&tsockinfo)), 16);
  if ((((llvm_cbe_call8 == 4294967295u)&1))) {
  perror(((&_OC_str_OC_10.array[((int64_t)0)])));
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = -1;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = -1;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  _54 = tsocket;
  llvm_cbe_call13 = listen(_54, 10);
  if (!(((llvm_cbe_call13 == 4294967295u)&1))) {
  perror(((&_OC_str_OC_11.array[((int64_t)0)])));

}
  llvm_cbe_call18 = ChatLoop();
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}

