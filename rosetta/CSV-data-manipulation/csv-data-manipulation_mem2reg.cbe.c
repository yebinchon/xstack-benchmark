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
struct l_struct_struct_OC_CSV;
struct l_struct_struct_OC__IO_FILE;

/* Function definitions */

uint32_t csv_destroy(struct l_struct_struct_OC_CSV*);

/* Types Definitions */
struct l_struct_struct_OC_CSV {
  uint8_t* field0;
  uint32_t field1;
  uint32_t field2;
  uint8_t** field3;
};
struct l_array_1_uint8_t {
  uint8_t array[1];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};
struct l_struct_struct_OC__IO_FILE {
  uint32_t field0;
  uint8_t* field1;
  uint8_t* field2;
  uint8_t* field3;
  uint8_t* field4;
  uint8_t* field5;
  uint8_t* field6;
  uint8_t* field7;
  uint8_t* field8;
  uint8_t* field9;
  uint8_t* field10;
  uint8_t* field11;
  void* field12;
  struct l_struct_struct_OC__IO_FILE* field13;
  uint32_t field14;
  uint32_t field15;
  uint64_t field16;
  uint16_t field17;
  uint8_t field18;
  struct l_array_1_uint8_t field19;
  uint8_t* field20;
  uint64_t field21;
  void* field22;
  void* field23;
  struct l_struct_struct_OC__IO_FILE* field24;
  uint8_t* field25;
  uint64_t field26;
  uint32_t field27;
  struct l_array_20_uint8_t field28;
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};
struct l_array_15_uint8_t {
  uint8_t array[15];
};
struct l_array_26_uint8_t {
  uint8_t array[26];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_43_uint8_t {
  uint8_t array[43];
};
struct l_array_31_uint8_t {
  uint8_t array[31];
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_22_uint8_t {
  uint8_t array[22];
};
struct l_array_50_uint8_t {
  uint8_t array[50];
};
struct l_array_35_uint8_t {
  uint8_t array[35];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_37_uint8_t {
  uint8_t array[37];
};
struct l_array_2048_uint8_t {
  uint8_t array[2048];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t trim(uint8_t**) __ATTRIBUTELIST__((noinline, nothrow));
uint64_t strlen(uint8_t*) __ATTRIBUTELIST__((nothrow, pure));
uint16_t** __ctype_b_loc(void) __ATTRIBUTELIST__((nothrow, const));
uint32_t csv_destroy(struct l_struct_struct_OC_CSV*) __ATTRIBUTELIST__((noinline, nothrow));
void free(uint8_t*) __ATTRIBUTELIST__((nothrow));
struct l_struct_struct_OC_CSV* csv_create(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
uint8_t* strdup(uint8_t*) __ATTRIBUTELIST__((nothrow));
uint8_t* csv_get(struct l_struct_struct_OC_CSV*, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t csv_set(struct l_struct_struct_OC_CSV*, uint32_t, uint32_t, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
void csv_display(struct l_struct_struct_OC_CSV*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint32_t csv_resize(struct l_struct_struct_OC_CSV*, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t* __errno_location(void) __ATTRIBUTELIST__((nothrow, const));
uint8_t* strerror(uint32_t) __ATTRIBUTELIST__((nothrow));
uint32_t csv_open(struct l_struct_struct_OC_CSV*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
struct l_struct_struct_OC__IO_FILE* fopen(uint8_t*, uint8_t*);
uint8_t* fgets(uint8_t*, uint32_t, struct l_struct_struct_OC__IO_FILE*);
uint8_t* strtok(uint8_t*, uint8_t*) __ATTRIBUTELIST__((nothrow));
uint32_t fclose(struct l_struct_struct_OC__IO_FILE*);
uint32_t csv_save(struct l_struct_struct_OC_CSV*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t fprintf(struct l_struct_struct_OC__IO_FILE*, uint8_t*, ...);
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_2_uint8_t _OC_str = { "," };
static struct l_array_15_uint8_t _OC_str_OC_1 = { "[Empty table]\n" };
static struct l_array_26_uint8_t _OC_str_OC_2 = { "\n[Table cols=%d rows=%d]\n" };
static struct l_array_3_uint8_t _OC_str_OC_3 = { "[|" };
static struct l_array_5_uint8_t _OC_str_OC_4 = { "%s\t|" };
static struct l_array_3_uint8_t _OC_str_OC_5 = { "]\n" };
static struct l_array_2_uint8_t _OC_str_OC_6 = { "\n" };
static struct l_array_43_uint8_t _OC_str_OC_7 = { "Unable to resize CSV table: error %d - %s\n" };
static struct l_array_2_uint8_t _OC_str_OC_8 = { "r" };
static struct l_array_31_uint8_t _OC_str_OC_9 = { "Unable to open %s for reading." };
static struct l_array_2_uint8_t _OC_str_OC_10 = { "w" };
static struct l_array_5_uint8_t _OC_str_OC_11 = { "%s%s" };
static struct l_array_1_uint8_t _OC_str_OC_12;
static struct l_array_8_uint8_t _OC_str_OC_13 = { "%s\n%s\n\n" };
static struct l_array_22_uint8_t _OC_str_OC_14 = { "CSV data manipulation" };
static struct l_array_50_uint8_t _OC_str_OC_15 = { "http://rosettacode.org/wiki/CSV_data_manipulation" };
static struct l_array_35_uint8_t _OC_str_OC_16 = { "fixtures/csv-data-manipulation.csv" };
static struct l_array_8_uint8_t _OC_str_OC_17 = { "Column0" };
static struct l_array_4_uint8_t _OC_str_OC_18 = { "100" };
static struct l_array_4_uint8_t _OC_str_OC_19 = { "200" };
static struct l_array_4_uint8_t _OC_str_OC_20 = { "300" };
static struct l_array_4_uint8_t _OC_str_OC_21 = { "400" };
static struct l_array_37_uint8_t _OC_str_OC_22 = { "tmp/csv-data-manipulation.result.csv" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint32_t llvm_mul_u32(uint32_t a, uint32_t b) {
  uint32_t r = a * b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}


/* Function Bodies */

uint32_t trim(uint8_t** llvm_cbe_str) {
  uint8_t* _1;
  uint64_t llvm_cbe_call;
  uint32_t len;
  uint32_t n;
  uint32_t trimmed;
  uint32_t trimmed__PHI_TEMPORARY;
  uint32_t n__PHI_TEMPORARY;
  uint16_t** llvm_cbe_call2;
  uint16_t* _2;
  uint8_t* _3;
  uint8_t _4;
  uint16_t _5;
  bool _6;
  bool _6__PHI_TEMPORARY;
  uint8_t* _7;
  uint16_t** llvm_cbe_call13;
  uint16_t* _8;
  uint8_t* _9;
  uint8_t _10;
  uint16_t _11;
  bool _12;
  bool _12__PHI_TEMPORARY;
  uint8_t* _13;
  uint8_t* _14;

  ;
  _1 = *llvm_cbe_str;
  llvm_cbe_call = strlen(_1);
  len = ((uint32_t)llvm_cbe_call);
  ;
  n = llvm_sub_u32(len, 1);
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */

){
  llvm_cbe_call2 = __ctype_b_loc();
  _2 = *llvm_cbe_call2;
  _3 = *llvm_cbe_str;
  _4 = *((&_3[((int64_t)(((int64_t)(int32_t)n)))]));
  _5 = *((&_2[((int64_t)(((int64_t)(int32_t)(((int32_t)(int8_t)_4)))))]));
  _6__PHI_TEMPORARY = (((((((uint32_t)(uint16_t)_5)) & 8192) != 0u)&1));   /* for PHI node */

  _6 = ((_6__PHI_TEMPORARY)&1);
  if (_6) {
  _7 = *llvm_cbe_str;
  *((&_7[((int64_t)(((int64_t)(int32_t)n)))])) = 0;
  trimmed = llvm_add_u32(trimmed, 1);
  ;
  n = llvm_add_u32(n, -1);
  ;
  trimmed__PHI_TEMPORARY = trimmed;   /* for PHI node */
  n__PHI_TEMPORARY = n;   /* for PHI node */

  trimmed = trimmed__PHI_TEMPORARY;
  n = n__PHI_TEMPORARY;
  ;
  ;
  if (!(((((int32_t)n) >= ((int32_t)0u))&1))) {
    _6__PHI_TEMPORARY = 0;   /* for PHI node */
  }

}
  trimmed = trimmed__PHI_TEMPORARY;
  n = n__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_cmp = ((((int32_t)n) >= ((int32_t)0u))&1);
    if (!(((((int32_t)n) >= ((int32_t)0u))&1))) {
    _6__PHI_TEMPORARY = 0;   /* for PHI node */
  }

;
}
  ;
  break;
){
  llvm_cbe_call13 = __ctype_b_loc();
  _8 = *llvm_cbe_call13;
  _9 = *llvm_cbe_str;
  _10 = *((&(*_9)));
  _11 = *((&_8[((int64_t)(((int64_t)(int32_t)(((int32_t)(int8_t)_10)))))]));
  _12__PHI_TEMPORARY = (((((((uint32_t)(uint16_t)_11)) & 8192) != 0u)&1));   /* for PHI node */

  _12 = ((_12__PHI_TEMPORARY)&1);
  if (!_12) {
  _13 = *llvm_cbe_str;
  *((&(*_13))) = 0;
  _14 = *llvm_cbe_str;
  *llvm_cbe_str = ((&_14[((int64_t)1)]));
  trimmed = llvm_add_u32(trimmed, 1);
  ;
  n = llvm_add_u32(n, 1);
  ;
  trimmed__PHI_TEMPORARY = trimmed;   /* for PHI node */
  n__PHI_TEMPORARY = n;   /* for PHI node */

  trimmed = trimmed__PHI_TEMPORARY;
  n = n__PHI_TEMPORARY;
  ;
  ;
  if (!(((((int32_t)n) < ((int32_t)len))&1))) {
    _12__PHI_TEMPORARY = 0;   /* for PHI node */
  }

}
  trimmed = trimmed__PHI_TEMPORARY;
  n = n__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_cmp10 = ((((int32_t)n) < ((int32_t)len))&1);
    if (!(((((int32_t)n) < ((int32_t)len))&1))) {
    _12__PHI_TEMPORARY = 0;   /* for PHI node */
  }

;
}
  return trimmed;
}


uint32_t csv_destroy(struct l_struct_struct_OC_CSV* llvm_cbe_csv) {
  uint8_t** _15;
  uint8_t** _16;
  uint8_t* _17;
  uint8_t* _18;

  ;
  if ((((llvm_cbe_csv == ((struct l_struct_struct_OC_CSV*)/*NULL*/0))&1))) {

  return 0;
}
  _15 = *((&llvm_cbe_csv->field3));
  if ((((_15 != ((uint8_t**)/*NULL*/0))&1))) {
  _16 = *((&llvm_cbe_csv->field3));
  free((((uint8_t*)_16)));

}
  _17 = *((&llvm_cbe_csv->field0));
  if (!(((_17 != ((uint8_t*)/*NULL*/0))&1))) {
  _18 = *((&llvm_cbe_csv->field0));
  free(_18);

}
  free((((uint8_t*)llvm_cbe_csv)));

  return 0;
}


struct l_struct_struct_OC_CSV* csv_create(uint32_t llvm_cbe_cols, uint32_t llvm_cbe_rows) {
  uint8_t* llvm_cbe_call;
  struct l_struct_struct_OC_CSV* csv;
  uint8_t* llvm_cbe_call3;
  uint8_t* llvm_cbe_call6;
  uint8_t** _19;
  uint8_t** _20;
  uint8_t* _21;
  uint32_t llvm_cbe_call14;
  struct l_struct_struct_OC_CSV* llvm_cbe_retval_2e_0;
  struct l_struct_struct_OC_CSV* llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  llvm_cbe_call = malloc(24);
  csv = ((struct l_struct_struct_OC_CSV*)llvm_cbe_call);
  ;
  *((&csv->field1)) = llvm_cbe_rows;
  *((&csv->field2)) = llvm_cbe_cols;
  llvm_cbe_call3 = strdup(((&_OC_str.array[((int64_t)0)])));
  *((&csv->field0)) = llvm_cbe_call3;
  llvm_cbe_call6 = malloc((llvm_mul_u64((llvm_mul_u64(8, (((uint64_t)(uint32_t)llvm_cbe_cols)))), (((uint64_t)(uint32_t)llvm_cbe_rows)))));
  *((&csv->field3)) = (((uint8_t**)llvm_cbe_call6));
  _19 = *((&csv->field3));
  if (!(((_19 == ((uint8_t**)/*NULL*/0))&1))) {
  _20 = *((&csv->field3));
  _21 = memset((((uint8_t*)_20)), 0, (llvm_mul_u64((llvm_mul_u64(8, (((uint64_t)(uint32_t)llvm_cbe_cols)))), (((uint64_t)(uint32_t)llvm_cbe_rows)))));
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = csv;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = csv;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}

  llvm_cbe_call14 = csv_destroy(csv);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = ((struct l_struct_struct_OC_CSV*)/*NULL*/0);   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


uint8_t* csv_get(struct l_struct_struct_OC_CSV* llvm_cbe_csv, uint32_t llvm_cbe_col, uint32_t llvm_cbe_row) {
  uint32_t _22;
  uint8_t** _23;
  uint8_t* _24;

  ;
  ;
  ;
  _22 = *((&llvm_cbe_csv->field2));
  ;
  _23 = *((&llvm_cbe_csv->field3));
  _24 = *((&_23[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(llvm_cbe_col, (llvm_mul_u32(llvm_cbe_row, _22)))))))]));
  return _24;
}


uint32_t csv_set(struct l_struct_struct_OC_CSV* llvm_cbe_csv, uint32_t llvm_cbe_col, uint32_t llvm_cbe_row, uint8_t* llvm_cbe_value) {
  uint32_t _25;
  uint8_t** _26;

  ;
  ;
  ;
  ;
  _25 = *((&llvm_cbe_csv->field2));
  ;
  _26 = *((&llvm_cbe_csv->field3));
  *((&_26[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(llvm_cbe_col, (llvm_mul_u32(llvm_cbe_row, _25)))))))])) = llvm_cbe_value;
  return 0;
}


void csv_display(struct l_struct_struct_OC_CSV* llvm_cbe_csv) {
  uint32_t _27;
  uint32_t _28;
  uint32_t llvm_cbe_call;
  uint32_t _29;
  uint32_t _30;
  uint32_t llvm_cbe_call4;
  uint32_t row;
  uint32_t row__PHI_TEMPORARY;
  uint32_t _31;
  uint32_t llvm_cbe_call7;
  uint32_t col;
  uint32_t col__PHI_TEMPORARY;
  uint32_t _32;
  uint8_t* content;
  uint32_t llvm_cbe_call13;
  uint32_t llvm_cbe_call14;
  uint32_t llvm_cbe_call18;
  uint32_t llvm_cbe_call_2e_splitted1;

  ;
  _27 = *((&llvm_cbe_csv->field1));
  if ((((_27 == 0u)&1))) {
  llvm_cbe_call_2e_splitted1 = printf(((&_OC_str_OC_1.array[((int64_t)0)])));

  return;
}
  _28 = *((&llvm_cbe_csv->field2));
  if ((((_28 == 0u)&1))) {
  llvm_cbe_call = printf(((&_OC_str_OC_1.array[((int64_t)0)])));

  return;
}
  _29 = *((&llvm_cbe_csv->field2));
  _30 = *((&llvm_cbe_csv->field1));
  llvm_cbe_call4 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), _29, _30);
  ;
  row__PHI_TEMPORARY = 0;   /* for PHI node */

  uint32_t* llvm_cbe_rows5;
  row = row__PHI_TEMPORARY;
  ;
  llvm_cbe_rows5 = (&llvm_cbe_csv->field1);
  _31 = *((&llvm_cbe_csv->field1));
while (((uint32_t)row) < ((uint32_t)_31)){
  llvm_cbe_call7 = printf(((&_OC_str_OC_3.array[((int64_t)0)])));
  ;
  col__PHI_TEMPORARY = 0;   /* for PHI node */

  uint32_t* llvm_cbe_cols9;
  col = col__PHI_TEMPORARY;
  ;
  llvm_cbe_cols9 = (&llvm_cbe_csv->field2);
  _32 = *((&llvm_cbe_csv->field2));
while (((uint32_t)col) < ((uint32_t)_32)){
  content = csv_get(llvm_cbe_csv, col, row);
  ;
  llvm_cbe_call13 = printf(((&_OC_str_OC_4.array[((int64_t)0)])), content);

  col = llvm_add_u32(col, 1);
  ;
  col__PHI_TEMPORARY = col;   /* for PHI node */

  col = col__PHI_TEMPORARY;
  ;
  llvm_cbe_cols9 = (&llvm_cbe_csv->field2);
  _32 = *((&llvm_cbe_csv->field2));
}
  llvm_cbe_call14 = printf(((&_OC_str_OC_5.array[((int64_t)0)])));

  row = llvm_add_u32(row, 1);
  ;
  row__PHI_TEMPORARY = row;   /* for PHI node */

  row = row__PHI_TEMPORARY;
  ;
  llvm_cbe_rows5 = (&llvm_cbe_csv->field1);
  _31 = *((&llvm_cbe_csv->field1));
}
  llvm_cbe_call18 = printf(((&_OC_str_OC_6.array[((int64_t)0)])));

  return;
}


uint32_t csv_resize(struct l_struct_struct_OC_CSV* llvm_cbe_old_csv, uint32_t llvm_cbe_new_cols, uint32_t llvm_cbe_new_rows) {
  struct l_struct_struct_OC_CSV* new_csv;
  uint32_t _33;
  uint32_t _34;
  uint32_t max_cols;
  uint32_t max_cols__PHI_TEMPORARY;
  uint32_t _35;
  uint32_t _36;
  uint32_t max_rows;
  uint32_t max_rows__PHI_TEMPORARY;
  uint32_t cur_col;
  uint32_t cur_col__PHI_TEMPORARY;
  uint32_t cur_row;
  uint32_t cur_row__PHI_TEMPORARY;
  uint32_t _37;
  uint32_t _38;
  bool _39;
  bool _39__PHI_TEMPORARY;
  uint32_t in_old;
  uint32_t _40;
  uint32_t _41;
  bool _42;
  bool _42__PHI_TEMPORARY;
  uint32_t in_new;
  uint8_t* content;
  uint32_t llvm_cbe_call29;
  uint8_t** _43;
  uint8_t** _44;
  uint32_t llvm_cbe_call44;
  uint32_t* llvm_cbe_call45;
  uint32_t _45;
  uint32_t* llvm_cbe_call46;
  uint32_t _46;
  uint8_t* llvm_cbe_call47;
  uint32_t llvm_cbe_call48;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  ;
  new_csv = csv_create(llvm_cbe_new_cols, llvm_cbe_new_rows);
  ;
  if ((((new_csv == ((struct l_struct_struct_OC_CSV*)/*NULL*/0))&1))) {

  llvm_cbe_call45 = __errno_location();
  _45 = *llvm_cbe_call45;
  llvm_cbe_call46 = __errno_location();
  _46 = *llvm_cbe_call46;
  llvm_cbe_call47 = strerror(_46);
  llvm_cbe_call48 = printf(((&_OC_str_OC_7.array[((int64_t)0)])), _45, llvm_cbe_call47);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = -1;   /* for PHI node */

  } else {
  *((&new_csv->field1)) = llvm_cbe_new_rows;
  *((&new_csv->field2)) = llvm_cbe_new_cols;
  _33 = *((&llvm_cbe_old_csv->field2));
  if ((((((uint32_t)llvm_cbe_new_cols) > ((uint32_t)_33))&1))) {
  max_cols__PHI_TEMPORARY = llvm_cbe_new_cols;   /* for PHI node */

  } else {
  _34 = *((&llvm_cbe_old_csv->field2));
  max_cols__PHI_TEMPORARY = _34;   /* for PHI node */

}
}
  max_cols = max_cols__PHI_TEMPORARY;
  ;
  _35 = *((&llvm_cbe_old_csv->field1));
  if ((((((uint32_t)llvm_cbe_new_rows) > ((uint32_t)_35))&1))) {
  max_rows__PHI_TEMPORARY = llvm_cbe_new_rows;   /* for PHI node */

  } else {
  _36 = *((&llvm_cbe_old_csv->field1));
  max_rows__PHI_TEMPORARY = _36;   /* for PHI node */

}
  max_rows = max_rows__PHI_TEMPORARY;
  ;
  ;
  cur_col__PHI_TEMPORARY = 0;   /* for PHI node */

  cur_col = cur_col__PHI_TEMPORARY;
  ;
while (((uint32_t)cur_col) < ((uint32_t)max_cols)){
  ;
  cur_row__PHI_TEMPORARY = 0;   /* for PHI node */

  cur_row = cur_row__PHI_TEMPORARY;
  ;
while (((uint32_t)cur_row) < ((uint32_t)max_rows)){
  _37 = *((&llvm_cbe_old_csv->field2));
  if ((((((uint32_t)cur_col) < ((uint32_t)_37))&1))) {
  _38 = *((&llvm_cbe_old_csv->field1));
  _39__PHI_TEMPORARY = (((((uint32_t)cur_row) < ((uint32_t)_38))&1));   /* for PHI node */

}
  _39 = ((_39__PHI_TEMPORARY)&1);
  in_old = ((uint32_t)(bool)_39);
  ;
  _40 = *((&new_csv->field2));
  if ((((((uint32_t)cur_col) < ((uint32_t)_40))&1))) {
  _41 = *((&new_csv->field1));
  _42__PHI_TEMPORARY = (((((uint32_t)cur_row) < ((uint32_t)_41))&1));   /* for PHI node */

}
  _42 = ((_42__PHI_TEMPORARY)&1);
  in_new = ((uint32_t)(bool)_42);
  ;
  if ((((in_old != 0u)&1))) {
  if ((((in_new != 0u)&1))) {
  content = csv_get(llvm_cbe_old_csv, cur_col, cur_row);
  ;
  llvm_cbe_call29 = csv_set(new_csv, cur_col, cur_row, content);

  } else {
  if ((((in_old != 0u)&1))) {
  content = csv_get(llvm_cbe_old_csv, cur_col, cur_row);
  ;
  free(content);

  } else {

}
}
  } else {
  if ((((in_old != 0u)&1))) {
  content = csv_get(llvm_cbe_old_csv, cur_col, cur_row);
  ;
  free(content);

  } else {

}
}


  cur_row = llvm_add_u32(cur_row, 1);
  ;
  cur_row__PHI_TEMPORARY = cur_row;   /* for PHI node */

  cur_row = cur_row__PHI_TEMPORARY;
  ;
}

  cur_col = llvm_add_u32(cur_col, 1);
  ;
  cur_col__PHI_TEMPORARY = cur_col;   /* for PHI node */

  cur_col = cur_col__PHI_TEMPORARY;
  ;
}
  _43 = *((&llvm_cbe_old_csv->field3));
  free((((uint8_t*)_43)));
  *((&llvm_cbe_old_csv->field1)) = llvm_cbe_new_rows;
  *((&llvm_cbe_old_csv->field2)) = llvm_cbe_new_cols;
  _44 = *((&new_csv->field3));
  *((&llvm_cbe_old_csv->field3)) = _44;
  *((&new_csv->field3)) = ((uint8_t**)/*NULL*/0);
  llvm_cbe_call44 = csv_destroy(new_csv);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


uint32_t csv_open(struct l_struct_struct_OC_CSV* llvm_cbe_csv, uint8_t* llvm_cbe_filename) {
  __MSALIGN__(16) struct l_array_2048_uint8_t llvm_cbe_line __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* llvm_cbe_token;    /* Address-exposed local */
  struct l_struct_struct_OC__IO_FILE* fp;
  uint32_t m_rows;
  uint32_t m_rows__PHI_TEMPORARY;
  uint32_t m_cols;
  uint32_t m_cols__PHI_TEMPORARY;
  uint8_t* llvm_cbe_call1;
  uint8_t* lineptr;
  uint32_t cols;
  uint32_t cols__PHI_TEMPORARY;
  uint8_t* lineptr__PHI_TEMPORARY;
  uint8_t* _47;
  uint8_t* llvm_cbe_call5;
  uint32_t llvm_cbe_call8;
  uint32_t llvm_cbe_add9;
  uint32_t llvm_cbe_call13;
  uint8_t* _48;
  uint8_t* llvm_cbe_call15;
  uint32_t llvm_cbe_call16;
  uint32_t llvm_cbe_call18;
  uint32_t llvm_cbe_call20;
  uint32_t llvm_cbe_call21;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  ;
  ;
  fp = fopen(llvm_cbe_filename, ((&_OC_str_OC_8.array[((int64_t)0)])));
  ;
  if ((((fp == ((struct l_struct_struct_OC__IO_FILE*)/*NULL*/0))&1))) {

  llvm_cbe_call20 = fclose(fp);
  llvm_cbe_call21 = printf(((&_OC_str_OC_9.array[((int64_t)0)])), llvm_cbe_filename);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = -1;   /* for PHI node */

  } else {
  ;
  ;
  m_rows__PHI_TEMPORARY = 0;   /* for PHI node */
  m_cols__PHI_TEMPORARY = 0;   /* for PHI node */

  m_rows = m_rows__PHI_TEMPORARY;
  m_cols = m_cols__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_call1 = fgets(((&llvm_cbe_line.array[((int64_t)0)])), 2048, fp);
  if (!(((llvm_cbe_call1 != ((uint8_t*)/*NULL*/0))&1))) {
  }

  m_rows = llvm_add_u32(m_rows, 1);
  ;
  ;
  lineptr = (&llvm_cbe_line.array[((int64_t)0)]);
  ;
  m_cols__PHI_TEMPORARY = m_cols;   /* for PHI node */
  cols__PHI_TEMPORARY = 0;   /* for PHI node */
  lineptr__PHI_TEMPORARY = lineptr;   /* for PHI node */

  llvm_cbe_call18 = fclose(fp);
  *((&llvm_cbe_csv->field1)) = m_rows;
  *((&llvm_cbe_csv->field2)) = m_cols;
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

  m_cols = m_cols__PHI_TEMPORARY;
  cols = cols__PHI_TEMPORARY;
  lineptr = lineptr__PHI_TEMPORARY;
  ;
  ;
  ;
  _47 = *((&llvm_cbe_csv->field0));
  llvm_cbe_call5 = strtok(lineptr, _47);
  llvm_cbe_token = llvm_cbe_call5;
  if (!(((llvm_cbe_call5 != ((uint8_t*)/*NULL*/0))&1))) {
  }

}
  uint8_t* llvm_cbe_arraydecay;
  m_rows = m_rows__PHI_TEMPORARY;
  m_cols = m_cols__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_arraydecay = (&llvm_cbe_line.array[((int64_t)0)]);
  llvm_cbe_call1 = fgets(((&llvm_cbe_line.array[((int64_t)0)])), 2048, fp);
while (llvm_cbe_call1 != ((uint8_t*)/*NULL*/0)){
  uint8_t** llvm_cbe_delim;
  m_cols = m_cols__PHI_TEMPORARY;
  cols = cols__PHI_TEMPORARY;
  lineptr = lineptr__PHI_TEMPORARY;
  ;
  ;
  ;
  llvm_cbe_delim = (&llvm_cbe_csv->field0);
  _47 = *((&llvm_cbe_csv->field0));
  llvm_cbe_call5 = strtok(lineptr, _47);
  llvm_cbe_token = llvm_cbe_call5;
while (llvm_cbe_call5 != ((uint8_t*)/*NULL*/0)){
  ;
  llvm_cbe_call8 = trim((&llvm_cbe_token));
  llvm_cbe_add9 = llvm_add_u32(cols, 1);
  ;
  if ((((((uint32_t)llvm_cbe_add9) > ((uint32_t)m_cols))&1))) {
  ;
  m_cols__PHI_TEMPORARY = llvm_cbe_add9;   /* for PHI node */

}
  m_cols = m_cols__PHI_TEMPORARY;
  ;
  llvm_cbe_call13 = csv_resize(llvm_cbe_csv, m_cols, m_rows);
  _48 = llvm_cbe_token;
  llvm_cbe_call15 = strdup(_48);
  llvm_cbe_call16 = csv_set(llvm_cbe_csv, (llvm_sub_u32(llvm_cbe_add9, 1)), (llvm_sub_u32(m_rows, 1)), llvm_cbe_call15);
  m_cols__PHI_TEMPORARY = m_cols;   /* for PHI node */
  cols__PHI_TEMPORARY = llvm_cbe_add9;   /* for PHI node */
  lineptr__PHI_TEMPORARY = ((uint8_t*)/*NULL*/0);   /* for PHI node */

  m_cols = m_cols__PHI_TEMPORARY;
  cols = cols__PHI_TEMPORARY;
  lineptr = lineptr__PHI_TEMPORARY;
  ;
  ;
  ;
  llvm_cbe_delim = (&llvm_cbe_csv->field0);
  _47 = *((&llvm_cbe_csv->field0));
  llvm_cbe_call5 = strtok(lineptr, _47);
  llvm_cbe_token = llvm_cbe_call5;
}
  m_rows__PHI_TEMPORARY = m_rows;   /* for PHI node */
  m_cols__PHI_TEMPORARY = m_cols;   /* for PHI node */

  m_rows = m_rows__PHI_TEMPORARY;
  m_cols = m_cols__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_arraydecay = (&llvm_cbe_line.array[((int64_t)0)]);
  llvm_cbe_call1 = fgets(((&llvm_cbe_line.array[((int64_t)0)])), 2048, fp);
}
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


uint32_t csv_save(struct l_struct_struct_OC_CSV* llvm_cbe_csv, uint8_t* llvm_cbe_filename) {
  struct l_struct_struct_OC__IO_FILE* fp;
  uint32_t row;
  uint32_t row__PHI_TEMPORARY;
  uint32_t _49;
  uint32_t col;
  uint32_t col__PHI_TEMPORARY;
  uint32_t _50;
  uint8_t* content;
  uint32_t _51;
  uint8_t* _52;
  uint8_t* llvm_cbe_cond;
  uint8_t* llvm_cbe_cond__PHI_TEMPORARY;
  uint32_t llvm_cbe_call7;
  uint32_t llvm_cbe_call8;
  uint32_t llvm_cbe_call12;

  ;
  ;
  fp = fopen(llvm_cbe_filename, ((&_OC_str_OC_10.array[((int64_t)0)])));
  ;
  ;
  row__PHI_TEMPORARY = 0;   /* for PHI node */

  uint32_t* llvm_cbe_rows;
  row = row__PHI_TEMPORARY;
  ;
  llvm_cbe_rows = (&llvm_cbe_csv->field1);
  _49 = *((&llvm_cbe_csv->field1));
while (((uint32_t)row) < ((uint32_t)_49)){
  ;
  col__PHI_TEMPORARY = 0;   /* for PHI node */

  uint32_t* llvm_cbe_cols;
  col = col__PHI_TEMPORARY;
  ;
  llvm_cbe_cols = (&llvm_cbe_csv->field2);
  _50 = *((&llvm_cbe_csv->field2));
while (((uint32_t)col) < ((uint32_t)_50)){
  content = csv_get(llvm_cbe_csv, col, row);
  ;
  _51 = *((&llvm_cbe_csv->field2));
  if ((((col == (llvm_sub_u32(_51, 1)))&1))) {
  llvm_cbe_cond__PHI_TEMPORARY = ((&_OC_str_OC_12.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _52 = *((&llvm_cbe_csv->field0));
  llvm_cbe_cond__PHI_TEMPORARY = _52;   /* for PHI node */

}
  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;
  llvm_cbe_call7 = fprintf(fp, ((&_OC_str_OC_11.array[((int64_t)0)])), content, llvm_cbe_cond);

  col = llvm_add_u32(col, 1);
  ;
  col__PHI_TEMPORARY = col;   /* for PHI node */

  col = col__PHI_TEMPORARY;
  ;
  llvm_cbe_cols = (&llvm_cbe_csv->field2);
  _50 = *((&llvm_cbe_csv->field2));
}
  llvm_cbe_call8 = fprintf(fp, ((&_OC_str_OC_6.array[((int64_t)0)])));

  row = llvm_add_u32(row, 1);
  ;
  row__PHI_TEMPORARY = row;   /* for PHI node */

  row = row__PHI_TEMPORARY;
  ;
  llvm_cbe_rows = (&llvm_cbe_csv->field1);
  _49 = *((&llvm_cbe_csv->field1));
}
  llvm_cbe_call12 = fclose(fp);
  return 0;
}


int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argc = (uint32_t)argc;
  uint8_t** llvm_cbe_argv = (uint8_t**)argv;
  uint32_t llvm_cbe_call;
  struct l_struct_struct_OC_CSV* csv;
  uint32_t llvm_cbe_call2;
  uint32_t llvm_cbe_call3;
  uint32_t llvm_cbe_call4;
  uint32_t llvm_cbe_call5;
  uint32_t llvm_cbe_call6;
  uint32_t llvm_cbe_call7;
  uint32_t llvm_cbe_call8;
  uint32_t llvm_cbe_call9;

  ;
  ;
  llvm_cbe_call = printf(((&_OC_str_OC_13.array[((int64_t)0)])), ((&_OC_str_OC_14.array[((int64_t)0)])), ((&_OC_str_OC_15.array[((int64_t)0)])));
  csv = csv_create(0, 0);
  ;
  llvm_cbe_call2 = csv_open(csv, ((&_OC_str_OC_16.array[((int64_t)0)])));
  csv_display(csv);
  llvm_cbe_call3 = csv_set(csv, 0, 0, ((&_OC_str_OC_17.array[((int64_t)0)])));
  llvm_cbe_call4 = csv_set(csv, 1, 1, ((&_OC_str_OC_18.array[((int64_t)0)])));
  llvm_cbe_call5 = csv_set(csv, 2, 2, ((&_OC_str_OC_19.array[((int64_t)0)])));
  llvm_cbe_call6 = csv_set(csv, 3, 3, ((&_OC_str_OC_20.array[((int64_t)0)])));
  llvm_cbe_call7 = csv_set(csv, 4, 4, ((&_OC_str_OC_21.array[((int64_t)0)])));
  csv_display(csv);
  llvm_cbe_call8 = csv_save(csv, ((&_OC_str_OC_22.array[((int64_t)0)])));
  llvm_cbe_call9 = csv_destroy(csv);
  return 0;
}

