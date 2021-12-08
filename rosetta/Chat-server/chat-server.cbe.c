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
typedef uint32_t l_fptr_1(uint32_t, uint8_t*, uint64_t, ...);

typedef uint32_t l_fptr_2(uint32_t, ...);

typedef uint32_t l_fptr_3(uint32_t, uint8_t*, uint32_t, ...);


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
struct l_array_1024_struct_AC_l_struct_struct_OC_client_KC_ {
  struct l_struct_struct_OC_client* array[1024];
};
struct l_array_16_uint64_t {
  uint64_t array[16];
};
struct l_struct_struct_OC_fd_set {
  struct l_array_16_uint64_t field0;
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
struct l_array_23_uint8_t {
  uint8_t array[23];
};
struct l_array_24_uint8_t {
  uint8_t array[24];
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
  uint32_t llvm_cbe_handle_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_call;
  uint32_t _1;
  uint32_t _2;
  struct l_struct_struct_OC_client* _3;
  uint32_t _4;
  struct l_struct_struct_OC_client* _5;
  uint32_t _6;
  struct l_struct_struct_OC_client* _7;

  llvm_cbe_handle_2e_addr = llvm_cbe_handle;
  ;
  llvm_cbe_call = malloc(4132);
  _1 = llvm_cbe_handle_2e_addr;
  *((&connections.array[((int64_t)(((int64_t)(int32_t)_1)))])) = (((struct l_struct_struct_OC_client*)llvm_cbe_call));
  _2 = llvm_cbe_handle_2e_addr;
  _3 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_2)))]));
  *((&(*((&_3->field0))).array[((int64_t)0)])) = 0;
  _4 = llvm_cbe_handle_2e_addr;
  _5 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_4)))]));
  *((&_5->field1)) = 0;
  _6 = llvm_cbe_handle_2e_addr;
  _7 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_6)))]));
  *((&(*((&_7->field2))).array[((int64_t)0)])) = 0;
}


void CloseConnection(uint32_t llvm_cbe_handle) {
  uint32_t llvm_cbe_handle_2e_addr;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_512_uint8_t llvm_cbe_buf __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint32_t _8;
  uint32_t _9;
  uint64_t* llvm_cbe_arrayidx;
  uint64_t _10;
  uint32_t _11;
  struct l_struct_struct_OC_client* _12;
  uint8_t _13;
  uint32_t _14;
  struct l_struct_struct_OC_client* _15;
  uint32_t llvm_cbe_call;
  uint32_t _16;
  uint32_t _17;
  uint32_t _18;
  uint32_t _19;
  uint32_t _20;
  uint32_t _21;
  uint64_t _22;
  uint32_t _23;
  uint32_t _24;
  uint64_t llvm_cbe_call22;
  uint32_t llvm_cbe_call23;
  uint32_t _25;
  uint32_t _26;
  uint32_t _27;
  uint32_t llvm_cbe_call27;
  uint32_t _28;
  struct l_struct_struct_OC_client* _29;
  uint32_t _30;
  struct l_struct_struct_OC_client* _31;
  uint32_t _32;
  uint32_t llvm_cbe_call36;

  llvm_cbe_handle_2e_addr = llvm_cbe_handle;
  ;
  ;
  ;
  _8 = llvm_cbe_handle_2e_addr;
  _9 = llvm_cbe_handle_2e_addr;
  llvm_cbe_arrayidx = (&(*((&status.field0))).array[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_9, 64)))))]);
  _10 = *llvm_cbe_arrayidx;
  *llvm_cbe_arrayidx = (_10 & (~((1 << (((uint64_t)(uint32_t)(llvm_srem_u32(_8, 64))))))));
  _11 = llvm_cbe_handle_2e_addr;
  _12 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_11)))]));
  _13 = *((&(*((&_12->field2))).array[((int64_t)0)]));
  if ((((_13 != ((uint8_t)0))&1))) {
  _14 = llvm_cbe_handle_2e_addr;
  _15 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_14)))]));
  llvm_cbe_call = sprintf(((&llvm_cbe_buf.array[((int64_t)0)])), ((&_OC_str.array[((int64_t)0)])), ((&(*((&_15->field2))).array[((int64_t)0)])));
  llvm_cbe_j = 0;

  _16 = llvm_cbe_j;
  if (!(((((int32_t)_16) < ((int32_t)1024u))&1))) {
  }

  _17 = llvm_cbe_handle_2e_addr;
  _18 = llvm_cbe_j;
  if ((((_17 != _18)&1))) {
  _19 = llvm_cbe_j;
  _20 = tsocket;
  if ((((_19 != _20)&1))) {
  _21 = llvm_cbe_j;
  _22 = *((&(*((&status.field0))).array[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_21, 64)))))]));
  _23 = llvm_cbe_j;
  if (((((_22 & (1 << (((uint64_t)(uint32_t)(llvm_srem_u32(_23, 64)))))) != UINT64_C(0))&1))) {
  _24 = llvm_cbe_j;
  llvm_cbe_call22 = strlen(((&llvm_cbe_buf.array[((int64_t)0)])));
  llvm_cbe_call23 = ((l_fptr_1*)(void*)write)(_24, ((&llvm_cbe_buf.array[((int64_t)0)])), llvm_cbe_call22);
  if ((((((int32_t)llvm_cbe_call23) < ((int32_t)0u))&1))) {
  _25 = llvm_cbe_j;
  CloseConnection(_25);

}


  } else {

}
  } else {

}
  } else {

}

  } else {
  _27 = llvm_cbe_handle_2e_addr;
  llvm_cbe_call27 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _27);

}
  _16 = llvm_cbe_j;
while (((int32_t)_16) < ((int32_t)1024u)){
  _26 = llvm_cbe_j;
  llvm_cbe_j = (llvm_add_u32(_26, 1));

  _16 = llvm_cbe_j;
}
  _28 = llvm_cbe_handle_2e_addr;
  _29 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_28)))]));
  if ((((_29 != ((struct l_struct_struct_OC_client*)/*NULL*/0))&1))) {
  _30 = llvm_cbe_handle_2e_addr;
  _31 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_30)))]));
  free((((uint8_t*)_31)));

  _32 = llvm_cbe_handle_2e_addr;
  llvm_cbe_call36 = ((l_fptr_2*)(void*)close)(_32);
  return;
}
  _32 = llvm_cbe_handle_2e_addr;
  llvm_cbe_call36 = ((l_fptr_2*)(void*)close)(_32);
  return;
}


void strip(uint8_t* llvm_cbe_buf) {
  uint8_t* llvm_cbe_buf_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_x;    /* Address-exposed local */
  uint8_t* _33;
  uint8_t* llvm_cbe_call;
  uint8_t* _34;
  uint8_t* _35;
  uint8_t* _36;
  uint8_t* llvm_cbe_call1;
  uint8_t* _37;
  uint8_t* _38;

  llvm_cbe_buf_2e_addr = llvm_cbe_buf;
  ;
  ;
  _33 = llvm_cbe_buf_2e_addr;
  llvm_cbe_call = strchr(_33, 10);
  llvm_cbe_x = llvm_cbe_call;
  _34 = llvm_cbe_x;
  if ((((_34 != ((uint8_t*)/*NULL*/0))&1))) {
  _35 = llvm_cbe_x;
  *_35 = 0;

}
  _36 = llvm_cbe_buf_2e_addr;
  llvm_cbe_call1 = strchr(_36, 13);
  llvm_cbe_x = llvm_cbe_call1;
  _37 = llvm_cbe_x;
  if ((((_37 != ((uint8_t*)/*NULL*/0))&1))) {
  _38 = llvm_cbe_x;
  *_38 = 0;

  return;
}
  return;
}


uint32_t RelayText(uint32_t llvm_cbe_handle) {
  uint32_t llvm_cbe_handle_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_begin;    /* Address-exposed local */
  uint8_t* llvm_cbe_end;    /* Address-exposed local */
  uint32_t llvm_cbe_ret;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_8000_uint8_t llvm_cbe_output __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint32_t _39;
  struct l_struct_struct_OC_client* _40;
  uint32_t _41;
  struct l_struct_struct_OC_client* _42;
  uint32_t _43;
  uint8_t* _44;
  uint8_t _45;
  uint8_t* _46;
  uint8_t* _47;
  uint8_t* _48;
  uint8_t* _49;
  uint32_t _50;
  struct l_struct_struct_OC_client* _51;
  uint32_t _52;
  uint8_t* _53;
  uint8_t* llvm_cbe_call;
  uint8_t* _54;
  uint32_t _55;
  struct l_struct_struct_OC_client* _56;
  uint8_t _57;
  uint32_t _58;
  struct l_struct_struct_OC_client* _59;
  uint8_t* _60;
  uint8_t* llvm_cbe_call28;
  uint32_t _61;
  struct l_struct_struct_OC_client* _62;
  uint32_t _63;
  struct l_struct_struct_OC_client* _64;
  uint32_t _65;
  struct l_struct_struct_OC_client* _66;
  uint32_t llvm_cbe_call42;
  uint32_t _67;
  struct l_struct_struct_OC_client* _68;
  uint8_t* _69;
  uint8_t* _70;
  uint8_t* _71;
  uint32_t llvm_cbe_call49;
  uint8_t _72;
  uint32_t _73;
  uint32_t _74;
  uint32_t _75;
  uint32_t _76;
  uint32_t _77;
  uint32_t _78;
  uint64_t _79;
  uint32_t _80;
  uint32_t _81;
  uint64_t llvm_cbe_call68;
  uint32_t llvm_cbe_call69;
  uint32_t _82;
  uint32_t _83;
  uint8_t* _84;
  uint8_t* _85;
  uint8_t* llvm_cbe_call76;
  uint32_t _86;
  struct l_struct_struct_OC_client* _87;
  uint8_t* _88;
  uint8_t* llvm_cbe_call81;
  uint8_t* _89;
  uint32_t _90;
  struct l_struct_struct_OC_client* _91;
  uint32_t _92;
  struct l_struct_struct_OC_client* _93;
  uint32_t* llvm_cbe_pos91;
  uint32_t _94;
  uint32_t _95;

  llvm_cbe_handle_2e_addr = llvm_cbe_handle;
  ;
  ;
  ;
  ;
  llvm_cbe_ret = 0;
  _39 = llvm_cbe_handle_2e_addr;
  _40 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_39)))]));
  llvm_cbe_begin = ((&(*((&_40->field0))).array[((int64_t)0)]));
  _41 = llvm_cbe_handle_2e_addr;
  _42 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_41)))]));
  _43 = *((&_42->field1));
  if ((((_43 == 4000u)&1))) {
  _44 = llvm_cbe_begin;
  _45 = *((&_44[((int64_t)3999)]));
  if (((((((int32_t)(int8_t)_45)) != 10u)&1))) {
  _46 = llvm_cbe_begin;
  *((&_46[((int64_t)4000)])) = 0;

  } else {
  _47 = llvm_cbe_begin;
  *((&_47[((int64_t)4000)])) = 10;
  _48 = llvm_cbe_begin;
  *((&_48[((int64_t)4001)])) = 0;

}
  } else {
  _49 = llvm_cbe_begin;
  _50 = llvm_cbe_handle_2e_addr;
  _51 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_50)))]));
  _52 = *((&_51->field1));
  *((&_49[((int64_t)(((int64_t)(int32_t)_52)))])) = 0;

}

  _53 = llvm_cbe_begin;
  llvm_cbe_call = strchr(_53, 10);
  llvm_cbe_end = llvm_cbe_call;

  _54 = llvm_cbe_end;
while (_54 != ((uint8_t*)/*NULL*/0)){
  ;
  *((&llvm_cbe_output.array[((int64_t)0)])) = 0;
  _55 = llvm_cbe_handle_2e_addr;
  _56 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_55)))]));
  _57 = *((&(*((&_56->field2))).array[((int64_t)0)]));
  if ((((_57 != ((uint8_t)0))&1))) {
  _67 = llvm_cbe_handle_2e_addr;
  _68 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_67)))]));
  _69 = llvm_cbe_end;
  _70 = llvm_cbe_begin;
  _71 = llvm_cbe_begin;
  llvm_cbe_call49 = sprintf(((&llvm_cbe_output.array[((int64_t)0)])), ((&_OC_str_OC_3.array[((int64_t)0)])), ((&(*((&_68->field2))).array[((int64_t)0)])), (llvm_sub_u64((((uint64_t)(uintptr_t)_69)), (((uint64_t)(uintptr_t)_70)))), _71);
  llvm_cbe_ret = 1;

  } else {
  _58 = llvm_cbe_handle_2e_addr;
  _59 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_58)))]));
  _60 = llvm_cbe_begin;
  llvm_cbe_call28 = strncpy(((&(*((&_59->field2))).array[((int64_t)0)])), _60, 31);
  _61 = llvm_cbe_handle_2e_addr;
  _62 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_61)))]));
  *((&(*((&_62->field2))).array[((int64_t)31)])) = 0;
  _63 = llvm_cbe_handle_2e_addr;
  _64 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_63)))]));
  strip(((&(*((&_64->field2))).array[((int64_t)0)])));
  _65 = llvm_cbe_handle_2e_addr;
  _66 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_65)))]));
  llvm_cbe_call42 = sprintf(((&llvm_cbe_output.array[((int64_t)0)])), ((&_OC_str_OC_2.array[((int64_t)0)])), ((&(*((&_66->field2))).array[((int64_t)0)])));
  llvm_cbe_ret = 1;

}
  _72 = *((&llvm_cbe_output.array[((int64_t)0)]));
  if ((((_72 != ((uint8_t)0))&1))) {
  ;
  llvm_cbe_j = 0;

  _73 = llvm_cbe_j;
  if (!(((((int32_t)_73) < ((int32_t)1024u))&1))) {
  }

  _74 = llvm_cbe_handle_2e_addr;
  _75 = llvm_cbe_j;
  if ((((_74 != _75)&1))) {
  _76 = llvm_cbe_j;
  _77 = tsocket;
  if ((((_76 != _77)&1))) {
  _78 = llvm_cbe_j;
  _79 = *((&(*((&status.field0))).array[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_78, 64)))))]));
  _80 = llvm_cbe_j;
  if (((((_79 & (1 << (((uint64_t)(uint32_t)(llvm_srem_u32(_80, 64)))))) != UINT64_C(0))&1))) {
  _81 = llvm_cbe_j;
  llvm_cbe_call68 = strlen(((&llvm_cbe_output.array[((int64_t)0)])));
  llvm_cbe_call69 = ((l_fptr_1*)(void*)write)(_81, ((&llvm_cbe_output.array[((int64_t)0)])), llvm_cbe_call68);
  if ((((((int32_t)llvm_cbe_call69) < ((int32_t)0u))&1))) {
  _82 = llvm_cbe_j;
  CloseConnection(_82);

}


  } else {

}
  } else {

}
  } else {

}

}
  _73 = llvm_cbe_j;
while (((int32_t)_73) < ((int32_t)1024u)){
  _83 = llvm_cbe_j;
  llvm_cbe_j = (llvm_add_u32(_83, 1));

  _73 = llvm_cbe_j;
}
  _84 = llvm_cbe_end;
  llvm_cbe_begin = ((&_84[((int64_t)1)]));
  _85 = llvm_cbe_begin;
  llvm_cbe_call76 = strchr(_85, 10);
  llvm_cbe_end = llvm_cbe_call76;

  _54 = llvm_cbe_end;
}
  _86 = llvm_cbe_handle_2e_addr;
  _87 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_86)))]));
  _88 = llvm_cbe_begin;
  llvm_cbe_call81 = strcpy(((&(*((&_87->field0))).array[((int64_t)0)])), _88);
  _89 = llvm_cbe_begin;
  _90 = llvm_cbe_handle_2e_addr;
  _91 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_90)))]));
  _92 = llvm_cbe_handle_2e_addr;
  _93 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_92)))]));
  llvm_cbe_pos91 = (&_93->field1);
  _94 = *llvm_cbe_pos91;
  *llvm_cbe_pos91 = (((uint32_t)(llvm_sub_u64((((int64_t)(int32_t)_94)), (llvm_sub_u64((((uint64_t)(uintptr_t)_89)), (((uint64_t)(uintptr_t)((&(*((&_91->field0))).array[((int64_t)0)]))))))))));
  _95 = llvm_cbe_ret;
  return _95;
}


void ClientText(uint32_t llvm_cbe_handle, uint8_t* llvm_cbe_buf, uint32_t llvm_cbe_buf_len) {
  uint32_t llvm_cbe_handle_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_buf_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_buf_len_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint32_t _96;
  struct l_struct_struct_OC_client* _97;
  uint32_t _98;
  struct l_struct_struct_OC_client* _99;
  uint32_t _100;
  uint32_t _101;
  uint32_t _102;
  uint8_t* _103;
  uint32_t _104;
  uint8_t _105;
  uint32_t _106;
  struct l_struct_struct_OC_client* _107;
  uint32_t _108;
  uint32_t _109;
  uint32_t _110;
  uint32_t llvm_cbe_call;
  uint32_t _111;
  struct l_struct_struct_OC_client* _112;
  uint32_t _113;
  uint32_t _114;
  uint32_t _115;
  uint32_t _116;
  uint32_t _117;
  struct l_struct_struct_OC_client* _118;
  uint32_t _119;
  uint32_t llvm_cbe_call21;

  llvm_cbe_handle_2e_addr = llvm_cbe_handle;
  ;
  llvm_cbe_buf_2e_addr = llvm_cbe_buf;
  ;
  llvm_cbe_buf_len_2e_addr = llvm_cbe_buf_len;
  ;
  ;
  ;
  _96 = llvm_cbe_handle_2e_addr;
  _97 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_96)))]));
  if (!(((_97 != ((struct l_struct_struct_OC_client*)/*NULL*/0))&1))) {

  return;
}
  _98 = llvm_cbe_handle_2e_addr;
  _99 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_98)))]));
  _100 = *((&_99->field1));
  llvm_cbe_j = _100;
  llvm_cbe_i = 0;

  _101 = llvm_cbe_i;
  _102 = llvm_cbe_buf_len_2e_addr;
while (((int32_t)_101) < ((int32_t)_102)){
  _103 = llvm_cbe_buf_2e_addr;
  _104 = llvm_cbe_i;
  _105 = *((&_103[((int64_t)(((int64_t)(int32_t)_104)))]));
  _106 = llvm_cbe_handle_2e_addr;
  _107 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_106)))]));
  _108 = llvm_cbe_j;
  *((&(*((&_107->field0))).array[((int64_t)(((int64_t)(int32_t)_108)))])) = _105;
  _109 = llvm_cbe_j;
  if ((((_109 == 4000u)&1))) {

  _110 = llvm_cbe_handle_2e_addr;
  llvm_cbe_call = RelayText(_110);
  if (!(((llvm_cbe_call != 0u)&1))) {
  }


  _111 = llvm_cbe_handle_2e_addr;
  _112 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_111)))]));
  _113 = *((&_112->field1));
  llvm_cbe_j = _113;

}
  _110 = llvm_cbe_handle_2e_addr;
  llvm_cbe_call = RelayText(_110);
while (llvm_cbe_call != 0u){
  _110 = llvm_cbe_handle_2e_addr;
  llvm_cbe_call = RelayText(_110);
}

  _114 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_114, 1));
  _115 = llvm_cbe_j;
  llvm_cbe_j = (llvm_add_u32(_115, 1));

  _101 = llvm_cbe_i;
  _102 = llvm_cbe_buf_len_2e_addr;
}
  _116 = llvm_cbe_j;
  _117 = llvm_cbe_handle_2e_addr;
  _118 = *((&connections.array[((int64_t)(((int64_t)(int32_t)_117)))]));
  *((&_118->field1)) = _116;

  _119 = llvm_cbe_handle_2e_addr;
  llvm_cbe_call21 = RelayText(_119);
while (llvm_cbe_call21 != 0u){

  _119 = llvm_cbe_handle_2e_addr;
  llvm_cbe_call21 = RelayText(_119);
}

  return;
}


uint32_t ChatLoop(void) {
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint32_t llvm_cbe___d0;    /* Address-exposed local */
  uint32_t llvm_cbe___d1;    /* Address-exposed local */
  struct l_struct_struct_OC_sockaddr_in llvm_cbe_cliinfo;    /* Address-exposed local */
  uint32_t llvm_cbe_addrlen;    /* Address-exposed local */
  uint32_t llvm_cbe_handle;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_512_uint8_t llvm_cbe_buf __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_b;    /* Address-exposed local */
  struct l_unnamed_1 _120;
  uint32_t _121;
  uint32_t _122;
  uint64_t* llvm_cbe_arrayidx;
  uint64_t _123;
  uint64_t _124;
  uint8_t* _125;
  uint32_t llvm_cbe_call;
  uint32_t _126;
  uint32_t _127;
  uint64_t _128;
  uint32_t _129;
  uint32_t _130;
  uint32_t _131;
  uint32_t _132;
  uint32_t llvm_cbe_call14;
  uint32_t _133;
  uint32_t _134;
  uint32_t llvm_cbe_call19;
  uint32_t _135;
  uint32_t llvm_cbe_call20;
  uint32_t _136;
  uint32_t llvm_cbe_call22;
  uint32_t _137;
  uint32_t _138;
  uint32_t llvm_cbe_call25;
  uint16_t _139;
  uint16_t llvm_cbe_call26;
  uint32_t llvm_cbe_call27;
  uint32_t _140;
  uint32_t _141;
  uint64_t* llvm_cbe_arrayidx33;
  uint64_t _142;
  uint32_t _143;
  uint32_t _144;
  uint32_t llvm_cbe_call39;
  uint32_t _145;
  uint32_t _146;
  uint32_t _147;
  uint32_t _148;
  uint32_t _149;

  ;
  ;

  ;
  ;
  __asm__ volatile ("cld; rep; stosq"
        :
        :);
  llvm_cbe___d0 = (((uint32_t)((_120.field0))));
  llvm_cbe___d1 = (((uint32_t)(((uint64_t)(uintptr_t)((_120.field1))))));

  _121 = tsocket;
  _122 = tsocket;
  llvm_cbe_arrayidx = (&(*((&status.field0))).array[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_122, 64)))))]);
  _123 = *llvm_cbe_arrayidx;
  *llvm_cbe_arrayidx = (_123 | (1 << (((uint64_t)(uint32_t)(llvm_srem_u32(_121, 64))))));
  _124 = *((&status.field0.array[((int64_t)0)]));
  *((&status.field0.array[((int64_t)0)])) = (_124 | 1);

  _125 = memcpy(((uint8_t*)(&current)), ((uint8_t*)(&status)), 128);
  llvm_cbe_call = select(1024, (&current), ((struct l_struct_struct_OC_fd_set*)/*NULL*/0), ((struct l_struct_struct_OC_fd_set*)/*NULL*/0), ((struct l_struct_struct_OC_timeval*)/*NULL*/0));
while (llvm_cbe_call == 4294967295u){
  llvm_cbe_i = 0;

  _126 = llvm_cbe_i;
while (((int32_t)_126) < ((int32_t)1024u)){
  _127 = llvm_cbe_i;
  _128 = *((&(*((&current.field0))).array[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_127, 64)))))]));
  _129 = llvm_cbe_i;
  if (((((_128 & (1 << (((uint64_t)(uint32_t)(llvm_srem_u32(_129, 64)))))) != UINT64_C(0))&1))) {
  _130 = llvm_cbe_i;
  _131 = tsocket;
  if ((((_130 == _131)&1))) {
  ;
  ;
  llvm_cbe_addrlen = 16;
  ;
  _132 = tsocket;
  llvm_cbe_call14 = accept(_132, (((struct l_struct_struct_OC_sockaddr*)(&llvm_cbe_cliinfo))), (&llvm_cbe_addrlen));
  llvm_cbe_handle = llvm_cbe_call14;
  _133 = llvm_cbe_handle;
  if ((((_133 == 4294967295u)&1))) {
  perror(((&_OC_str_OC_5.array[((int64_t)0)])));

  } else {
  _134 = llvm_cbe_handle;
  if ((((((int32_t)_134) > ((int32_t)1024u))&1))) {
  llvm_cbe_call19 = printf(((&_OC_str_OC_6.array[((int64_t)0)])));
  _135 = llvm_cbe_handle;
  llvm_cbe_call20 = ((l_fptr_2*)(void*)close)(_135);

  } else {
  _136 = llvm_cbe_handle;
  llvm_cbe_call22 = ((l_fptr_3*)(void*)write)(_136, ((&_OC_str_OC_7.array[((int64_t)0)])), 12);
  if ((((((int32_t)llvm_cbe_call22) >= ((int32_t)0u))&1))) {
  _137 = llvm_cbe_handle;
  _138 = *((&((&llvm_cbe_cliinfo.field2))->field0));
  llvm_cbe_call25 = ((l_fptr_2*)(void*)inet_ntoa)(_138);
  _139 = *((&llvm_cbe_cliinfo.field1));
  llvm_cbe_call26 = ntohs(_139);
  llvm_cbe_call27 = printf(((&_OC_str_OC_8.array[((int64_t)0)])), _137, llvm_cbe_call25, (((uint32_t)(uint16_t)llvm_cbe_call26)));
  _140 = llvm_cbe_handle;
  _141 = llvm_cbe_handle;
  llvm_cbe_arrayidx33 = (&(*((&status.field0))).array[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_141, 64)))))]);
  _142 = *llvm_cbe_arrayidx33;
  *llvm_cbe_arrayidx33 = (_142 | (1 << (((uint64_t)(uint32_t)(llvm_srem_u32(_140, 64))))));
  _143 = llvm_cbe_handle;
  AddConnection(_143);

}

}
}
  } else {
  ;
  ;
  _144 = llvm_cbe_i;
  llvm_cbe_call39 = ((l_fptr_3*)(void*)read)(_144, ((&llvm_cbe_buf.array[((int64_t)0)])), 500);
  llvm_cbe_b = llvm_cbe_call39;
  _145 = llvm_cbe_b;
  if ((((((int32_t)_145) <= ((int32_t)0u))&1))) {
  _146 = llvm_cbe_i;
  CloseConnection(_146);

  } else {
  _147 = llvm_cbe_i;
  _148 = llvm_cbe_b;
  ClientText(_147, ((&llvm_cbe_buf.array[((int64_t)0)])), _148);

}
}
}





  _149 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_149, 1));

  _126 = llvm_cbe_i;
}

  _125 = memcpy(((uint8_t*)(&current)), ((uint8_t*)(&status)), 128);
  llvm_cbe_call = select(1024, (&current), ((struct l_struct_struct_OC_fd_set*)/*NULL*/0), ((struct l_struct_struct_OC_fd_set*)/*NULL*/0), ((struct l_struct_struct_OC_timeval*)/*NULL*/0));
}
  perror(((&_OC_str_OC_4.array[((int64_t)0)])));
  return 0;
}


int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argc = (uint32_t)argc;
  uint8_t** llvm_cbe_argv = (uint8_t**)argv;
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_argc_2e_addr;    /* Address-exposed local */
  uint8_t** llvm_cbe_argv_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint16_t llvm_cbe_call1;
  uint32_t _150;
  uint8_t** _151;
  uint8_t* _152;
  uint32_t llvm_cbe_call2;
  uint16_t llvm_cbe_call3;
  uint32_t llvm_cbe_call4;
  uint32_t _153;
  uint16_t _154;
  uint16_t llvm_cbe_call5;
  uint32_t llvm_cbe_call7;
  uint32_t _155;
  uint32_t llvm_cbe_call8;
  uint32_t _156;
  uint32_t llvm_cbe_call13;
  uint32_t llvm_cbe_call18;
  uint32_t _157;

  llvm_cbe_retval = 0;
  llvm_cbe_argc_2e_addr = llvm_cbe_argc;
  ;
  llvm_cbe_argv_2e_addr = llvm_cbe_argv;
  ;
  llvm_cbe_call = socket(2, 1, 0);
  tsocket = llvm_cbe_call;
  *((&tsockinfo.field0)) = 2;
  llvm_cbe_call1 = htons(7070);
  *((&tsockinfo.field1)) = llvm_cbe_call1;
  _150 = llvm_cbe_argc_2e_addr;
  if ((((((int32_t)_150) > ((int32_t)1u))&1))) {
  _151 = llvm_cbe_argv_2e_addr;
  _152 = *((&_151[((int64_t)1)]));
  llvm_cbe_call2 = atoi(_152);
  llvm_cbe_call3 = htons((((uint16_t)llvm_cbe_call2)));
  *((&tsockinfo.field1)) = llvm_cbe_call3;

}
  llvm_cbe_call4 = htonl(0);
  *((&tsockinfo.field2.field0)) = llvm_cbe_call4;
  _153 = tsocket;
  _154 = *((&tsockinfo.field1));
  llvm_cbe_call5 = ntohs(_154);
  llvm_cbe_call7 = printf(((&_OC_str_OC_9.array[((int64_t)0)])), _153, (((uint32_t)(uint16_t)llvm_cbe_call5)));
  _155 = tsocket;
  llvm_cbe_call8 = bind(_155, ((struct l_struct_struct_OC_sockaddr*)(&tsockinfo)), 16);
  if ((((llvm_cbe_call8 == 4294967295u)&1))) {
  perror(((&_OC_str_OC_10.array[((int64_t)0)])));
  llvm_cbe_retval = -1;

  _157 = llvm_cbe_retval;
  return _157;
}
  _156 = tsocket;
  llvm_cbe_call13 = listen(_156, 10);
  if (!(((llvm_cbe_call13 == 4294967295u)&1))) {
  perror(((&_OC_str_OC_11.array[((int64_t)0)])));

}
  llvm_cbe_call18 = ChatLoop();
  llvm_cbe_retval = 0;

  _157 = llvm_cbe_retval;
  return _157;
}

