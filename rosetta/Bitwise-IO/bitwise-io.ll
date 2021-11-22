; ModuleID = 'bitwise-io.c'
source_filename = "bitwise-io.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bit_io_t = type { %struct._IO_FILE*, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@__const.main.s = private unnamed_addr constant [12 x i8] c"abcdefghijk\00", align 1
@.str = private unnamed_addr constant [9 x i8] c"test.bin\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"%10s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.bit_io_t* @b_attach(%struct._IO_FILE* %f) #0 !dbg !7 {
entry:
  %f.addr = alloca %struct._IO_FILE*, align 8
  %b = alloca %struct.bit_io_t*, align 8
  store %struct._IO_FILE* %f, %struct._IO_FILE** %f.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %f.addr, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata %struct.bit_io_t** %b, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call noalias i8* @malloc(i64 16) #5, !dbg !88
  %0 = bitcast i8* %call to %struct.bit_io_t*, !dbg !88
  store %struct.bit_io_t* %0, %struct.bit_io_t** %b, align 8, !dbg !87
  %1 = load %struct.bit_io_t*, %struct.bit_io_t** %b, align 8, !dbg !89
  %accu = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %1, i32 0, i32 1, !dbg !90
  store i32 0, i32* %accu, align 8, !dbg !91
  %2 = load %struct.bit_io_t*, %struct.bit_io_t** %b, align 8, !dbg !92
  %bits = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %2, i32 0, i32 2, !dbg !93
  store i32 0, i32* %bits, align 4, !dbg !94
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %f.addr, align 8, !dbg !95
  %4 = load %struct.bit_io_t*, %struct.bit_io_t** %b, align 8, !dbg !96
  %fp = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %4, i32 0, i32 0, !dbg !97
  store %struct._IO_FILE* %3, %struct._IO_FILE** %fp, align 8, !dbg !98
  %5 = load %struct.bit_io_t*, %struct.bit_io_t** %b, align 8, !dbg !99
  ret %struct.bit_io_t* %5, !dbg !100
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @b_write(i8* %buf, i64 %n_bits, i64 %shift, %struct.bit_io_t* %bf) #0 !dbg !101 {
entry:
  %buf.addr = alloca i8*, align 8
  %n_bits.addr = alloca i64, align 8
  %shift.addr = alloca i64, align 8
  %bf.addr = alloca %struct.bit_io_t*, align 8
  %accu = alloca i32, align 4
  %bits = alloca i32, align 4
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !109, metadata !DIExpression()), !dbg !110
  store i64 %n_bits, i64* %n_bits.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n_bits.addr, metadata !111, metadata !DIExpression()), !dbg !112
  store i64 %shift, i64* %shift.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %shift.addr, metadata !113, metadata !DIExpression()), !dbg !114
  store %struct.bit_io_t* %bf, %struct.bit_io_t** %bf.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.bit_io_t** %bf.addr, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32* %accu, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = load %struct.bit_io_t*, %struct.bit_io_t** %bf.addr, align 8, !dbg !119
  %accu1 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %0, i32 0, i32 1, !dbg !120
  %1 = load i32, i32* %accu1, align 8, !dbg !120
  store i32 %1, i32* %accu, align 4, !dbg !118
  call void @llvm.dbg.declare(metadata i32* %bits, metadata !121, metadata !DIExpression()), !dbg !122
  %2 = load %struct.bit_io_t*, %struct.bit_io_t** %bf.addr, align 8, !dbg !123
  %bits2 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %2, i32 0, i32 2, !dbg !124
  %3 = load i32, i32* %bits2, align 4, !dbg !124
  store i32 %3, i32* %bits, align 4, !dbg !122
  %4 = load i64, i64* %shift.addr, align 8, !dbg !125
  %div = udiv i64 %4, 8, !dbg !126
  %5 = load i8*, i8** %buf.addr, align 8, !dbg !127
  %add.ptr = getelementptr inbounds i8, i8* %5, i64 %div, !dbg !127
  store i8* %add.ptr, i8** %buf.addr, align 8, !dbg !127
  %6 = load i64, i64* %shift.addr, align 8, !dbg !128
  %rem = urem i64 %6, 8, !dbg !128
  store i64 %rem, i64* %shift.addr, align 8, !dbg !128
  br label %while.cond, !dbg !129

while.cond:                                       ; preds = %while.end20, %entry
  %7 = load i64, i64* %n_bits.addr, align 8, !dbg !130
  %tobool = icmp ne i64 %7, 0, !dbg !130
  br i1 %tobool, label %lor.end, label %lor.rhs, !dbg !131

lor.rhs:                                          ; preds = %while.cond
  %8 = load i32, i32* %bits, align 4, !dbg !132
  %cmp = icmp sge i32 %8, 8, !dbg !133
  br label %lor.end, !dbg !131

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %9 = phi i1 [ true, %while.cond ], [ %cmp, %lor.rhs ]
  br i1 %9, label %while.body, label %while.end21, !dbg !129

while.body:                                       ; preds = %lor.end
  br label %while.cond3, !dbg !134

while.cond3:                                      ; preds = %while.body5, %while.body
  %10 = load i32, i32* %bits, align 4, !dbg !136
  %cmp4 = icmp sge i32 %10, 8, !dbg !137
  br i1 %cmp4, label %while.body5, label %while.end, !dbg !134

while.body5:                                      ; preds = %while.cond3
  %11 = load i32, i32* %bits, align 4, !dbg !138
  %sub = sub nsw i32 %11, 8, !dbg !138
  store i32 %sub, i32* %bits, align 4, !dbg !138
  %12 = load i32, i32* %accu, align 4, !dbg !140
  %13 = load i32, i32* %bits, align 4, !dbg !141
  %shr = lshr i32 %12, %13, !dbg !142
  %14 = load %struct.bit_io_t*, %struct.bit_io_t** %bf.addr, align 8, !dbg !143
  %fp = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %14, i32 0, i32 0, !dbg !144
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !144
  %call = call i32 @fputc(i32 %shr, %struct._IO_FILE* %15), !dbg !145
  %16 = load i32, i32* %bits, align 4, !dbg !146
  %shl = shl i32 1, %16, !dbg !147
  %sub6 = sub nsw i32 %shl, 1, !dbg !148
  %17 = load i32, i32* %accu, align 4, !dbg !149
  %and = and i32 %17, %sub6, !dbg !149
  store i32 %and, i32* %accu, align 4, !dbg !149
  br label %while.cond3, !dbg !134, !llvm.loop !150

while.end:                                        ; preds = %while.cond3
  br label %while.cond7, !dbg !152

while.cond7:                                      ; preds = %if.end, %while.end
  %18 = load i32, i32* %bits, align 4, !dbg !153
  %cmp8 = icmp slt i32 %18, 8, !dbg !154
  br i1 %cmp8, label %land.rhs, label %land.end, !dbg !155

land.rhs:                                         ; preds = %while.cond7
  %19 = load i64, i64* %n_bits.addr, align 8, !dbg !156
  %tobool9 = icmp ne i64 %19, 0, !dbg !155
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond7
  %20 = phi i1 [ false, %while.cond7 ], [ %tobool9, %land.rhs ], !dbg !157
  br i1 %20, label %while.body10, label %while.end20, !dbg !152

while.body10:                                     ; preds = %land.end
  %21 = load i32, i32* %accu, align 4, !dbg !158
  %shl11 = shl i32 %21, 1, !dbg !160
  %22 = load i64, i64* %shift.addr, align 8, !dbg !161
  %sh_prom = trunc i64 %22 to i32, !dbg !162
  %shr12 = ashr i32 128, %sh_prom, !dbg !162
  %23 = load i8*, i8** %buf.addr, align 8, !dbg !163
  %24 = load i8, i8* %23, align 1, !dbg !164
  %conv = zext i8 %24 to i32, !dbg !164
  %and13 = and i32 %shr12, %conv, !dbg !165
  %25 = load i64, i64* %shift.addr, align 8, !dbg !166
  %sub14 = sub i64 7, %25, !dbg !167
  %sh_prom15 = trunc i64 %sub14 to i32, !dbg !168
  %shr16 = ashr i32 %and13, %sh_prom15, !dbg !168
  %or = or i32 %shl11, %shr16, !dbg !169
  store i32 %or, i32* %accu, align 4, !dbg !170
  %26 = load i64, i64* %n_bits.addr, align 8, !dbg !171
  %dec = add i64 %26, -1, !dbg !171
  store i64 %dec, i64* %n_bits.addr, align 8, !dbg !171
  %27 = load i32, i32* %bits, align 4, !dbg !172
  %inc = add nsw i32 %27, 1, !dbg !172
  store i32 %inc, i32* %bits, align 4, !dbg !172
  %28 = load i64, i64* %shift.addr, align 8, !dbg !173
  %inc17 = add i64 %28, 1, !dbg !173
  store i64 %inc17, i64* %shift.addr, align 8, !dbg !173
  %cmp18 = icmp eq i64 %inc17, 8, !dbg !175
  br i1 %cmp18, label %if.then, label %if.end, !dbg !176, !cf.info !177

if.then:                                          ; preds = %while.body10
  store i64 0, i64* %shift.addr, align 8, !dbg !178
  %29 = load i8*, i8** %buf.addr, align 8, !dbg !180
  %incdec.ptr = getelementptr inbounds i8, i8* %29, i32 1, !dbg !180
  store i8* %incdec.ptr, i8** %buf.addr, align 8, !dbg !180
  br label %if.end, !dbg !181

if.end:                                           ; preds = %if.then, %while.body10
  br label %while.cond7, !dbg !152, !llvm.loop !182

while.end20:                                      ; preds = %land.end
  br label %while.cond, !dbg !129, !llvm.loop !184

while.end21:                                      ; preds = %lor.end
  %30 = load i32, i32* %accu, align 4, !dbg !186
  %31 = load %struct.bit_io_t*, %struct.bit_io_t** %bf.addr, align 8, !dbg !187
  %accu22 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %31, i32 0, i32 1, !dbg !188
  store i32 %30, i32* %accu22, align 8, !dbg !189
  %32 = load i32, i32* %bits, align 4, !dbg !190
  %33 = load %struct.bit_io_t*, %struct.bit_io_t** %bf.addr, align 8, !dbg !191
  %bits23 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %33, i32 0, i32 2, !dbg !192
  store i32 %32, i32* %bits23, align 4, !dbg !193
  ret void, !dbg !194
}

declare dso_local i32 @fputc(i32, %struct._IO_FILE*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @b_read(i8* %buf, i64 %n_bits, i64 %shift, %struct.bit_io_t* %bf) #0 !dbg !195 {
entry:
  %buf.addr = alloca i8*, align 8
  %n_bits.addr = alloca i64, align 8
  %shift.addr = alloca i64, align 8
  %bf.addr = alloca %struct.bit_io_t*, align 8
  %accu = alloca i32, align 4
  %bits = alloca i32, align 4
  %mask = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !198, metadata !DIExpression()), !dbg !199
  store i64 %n_bits, i64* %n_bits.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n_bits.addr, metadata !200, metadata !DIExpression()), !dbg !201
  store i64 %shift, i64* %shift.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %shift.addr, metadata !202, metadata !DIExpression()), !dbg !203
  store %struct.bit_io_t* %bf, %struct.bit_io_t** %bf.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.bit_io_t** %bf.addr, metadata !204, metadata !DIExpression()), !dbg !205
  call void @llvm.dbg.declare(metadata i32* %accu, metadata !206, metadata !DIExpression()), !dbg !207
  %0 = load %struct.bit_io_t*, %struct.bit_io_t** %bf.addr, align 8, !dbg !208
  %accu1 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %0, i32 0, i32 1, !dbg !209
  %1 = load i32, i32* %accu1, align 8, !dbg !209
  store i32 %1, i32* %accu, align 4, !dbg !207
  call void @llvm.dbg.declare(metadata i32* %bits, metadata !210, metadata !DIExpression()), !dbg !211
  %2 = load %struct.bit_io_t*, %struct.bit_io_t** %bf.addr, align 8, !dbg !212
  %bits2 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %2, i32 0, i32 2, !dbg !213
  %3 = load i32, i32* %bits2, align 4, !dbg !213
  store i32 %3, i32* %bits, align 4, !dbg !211
  call void @llvm.dbg.declare(metadata i32* %mask, metadata !214, metadata !DIExpression()), !dbg !215
  call void @llvm.dbg.declare(metadata i32* %i, metadata !216, metadata !DIExpression()), !dbg !217
  store i32 0, i32* %i, align 4, !dbg !217
  %4 = load i64, i64* %shift.addr, align 8, !dbg !218
  %div = udiv i64 %4, 8, !dbg !219
  %5 = load i8*, i8** %buf.addr, align 8, !dbg !220
  %add.ptr = getelementptr inbounds i8, i8* %5, i64 %div, !dbg !220
  store i8* %add.ptr, i8** %buf.addr, align 8, !dbg !220
  %6 = load i64, i64* %shift.addr, align 8, !dbg !221
  %rem = urem i64 %6, 8, !dbg !221
  store i64 %rem, i64* %shift.addr, align 8, !dbg !221
  br label %while.cond, !dbg !222

while.cond:                                       ; preds = %if.end18, %entry
  %7 = load i64, i64* %n_bits.addr, align 8, !dbg !223
  %tobool = icmp ne i64 %7, 0, !dbg !222
  br i1 %tobool, label %while.body, label %while.end21, !dbg !222

while.body:                                       ; preds = %while.cond
  br label %while.cond3, !dbg !224

while.cond3:                                      ; preds = %if.end15, %while.body
  %8 = load i32, i32* %bits, align 4, !dbg !226
  %tobool4 = icmp ne i32 %8, 0, !dbg !226
  br i1 %tobool4, label %land.rhs, label %land.end, !dbg !227

land.rhs:                                         ; preds = %while.cond3
  %9 = load i64, i64* %n_bits.addr, align 8, !dbg !228
  %tobool5 = icmp ne i64 %9, 0, !dbg !227
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond3
  %10 = phi i1 [ false, %while.cond3 ], [ %tobool5, %land.rhs ], !dbg !229
  br i1 %10, label %while.body6, label %while.end, !dbg !224

while.body6:                                      ; preds = %land.end
  %11 = load i64, i64* %shift.addr, align 8, !dbg !230
  %sh_prom = trunc i64 %11 to i32, !dbg !232
  %shr = ashr i32 128, %sh_prom, !dbg !232
  store i32 %shr, i32* %mask, align 4, !dbg !233
  %12 = load i32, i32* %accu, align 4, !dbg !234
  %13 = load i32, i32* %bits, align 4, !dbg !236
  %sub = sub nsw i32 %13, 1, !dbg !237
  %shl = shl i32 1, %sub, !dbg !238
  %and = and i32 %12, %shl, !dbg !239
  %tobool7 = icmp ne i32 %and, 0, !dbg !239
  br i1 %tobool7, label %if.then, label %if.else, !dbg !240, !cf.info !177

if.then:                                          ; preds = %while.body6
  %14 = load i32, i32* %mask, align 4, !dbg !241
  %15 = load i8*, i8** %buf.addr, align 8, !dbg !242
  %16 = load i8, i8* %15, align 1, !dbg !243
  %conv = zext i8 %16 to i32, !dbg !243
  %or = or i32 %conv, %14, !dbg !243
  %conv8 = trunc i32 %or to i8, !dbg !243
  store i8 %conv8, i8* %15, align 1, !dbg !243
  br label %if.end, !dbg !244

if.else:                                          ; preds = %while.body6
  %17 = load i32, i32* %mask, align 4, !dbg !245
  %neg = xor i32 %17, -1, !dbg !246
  %18 = load i8*, i8** %buf.addr, align 8, !dbg !247
  %19 = load i8, i8* %18, align 1, !dbg !248
  %conv9 = zext i8 %19 to i32, !dbg !248
  %and10 = and i32 %conv9, %neg, !dbg !248
  %conv11 = trunc i32 %and10 to i8, !dbg !248
  store i8 %conv11, i8* %18, align 1, !dbg !248
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %20 = load i64, i64* %n_bits.addr, align 8, !dbg !249
  %dec = add i64 %20, -1, !dbg !249
  store i64 %dec, i64* %n_bits.addr, align 8, !dbg !249
  %21 = load i32, i32* %bits, align 4, !dbg !250
  %dec12 = add nsw i32 %21, -1, !dbg !250
  store i32 %dec12, i32* %bits, align 4, !dbg !250
  %22 = load i64, i64* %shift.addr, align 8, !dbg !251
  %inc = add i64 %22, 1, !dbg !251
  store i64 %inc, i64* %shift.addr, align 8, !dbg !251
  %cmp = icmp uge i64 %inc, 8, !dbg !253
  br i1 %cmp, label %if.then14, label %if.end15, !dbg !254, !cf.info !177

if.then14:                                        ; preds = %if.end
  store i64 0, i64* %shift.addr, align 8, !dbg !255
  %23 = load i8*, i8** %buf.addr, align 8, !dbg !257
  %incdec.ptr = getelementptr inbounds i8, i8* %23, i32 1, !dbg !257
  store i8* %incdec.ptr, i8** %buf.addr, align 8, !dbg !257
  br label %if.end15, !dbg !258

if.end15:                                         ; preds = %if.then14, %if.end
  br label %while.cond3, !dbg !224, !llvm.loop !259

while.end:                                        ; preds = %land.end
  %24 = load i64, i64* %n_bits.addr, align 8, !dbg !261
  %tobool16 = icmp ne i64 %24, 0, !dbg !261
  br i1 %tobool16, label %if.end18, label %if.then17, !dbg !263, !cf.info !177

if.then17:                                        ; preds = %while.end
  br label %while.end21, !dbg !264

if.end18:                                         ; preds = %while.end
  %25 = load i32, i32* %accu, align 4, !dbg !265
  %shl19 = shl i32 %25, 8, !dbg !266
  %26 = load %struct.bit_io_t*, %struct.bit_io_t** %bf.addr, align 8, !dbg !267
  %fp = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %26, i32 0, i32 0, !dbg !268
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !268
  %call = call i32 @fgetc(%struct._IO_FILE* %27), !dbg !269
  %or20 = or i32 %shl19, %call, !dbg !270
  store i32 %or20, i32* %accu, align 4, !dbg !271
  %28 = load i32, i32* %bits, align 4, !dbg !272
  %add = add nsw i32 %28, 8, !dbg !272
  store i32 %add, i32* %bits, align 4, !dbg !272
  br label %while.cond, !dbg !222, !llvm.loop !273

while.end21:                                      ; preds = %if.then17, %while.cond
  %29 = load i32, i32* %accu, align 4, !dbg !275
  %30 = load %struct.bit_io_t*, %struct.bit_io_t** %bf.addr, align 8, !dbg !276
  %accu22 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %30, i32 0, i32 1, !dbg !277
  store i32 %29, i32* %accu22, align 8, !dbg !278
  %31 = load i32, i32* %bits, align 4, !dbg !279
  %32 = load %struct.bit_io_t*, %struct.bit_io_t** %bf.addr, align 8, !dbg !280
  %bits23 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %32, i32 0, i32 2, !dbg !281
  store i32 %31, i32* %bits23, align 4, !dbg !282
  %33 = load i32, i32* %i, align 4, !dbg !283
  %conv24 = sext i32 %33 to i64, !dbg !283
  ret i64 %conv24, !dbg !284
}

declare dso_local i32 @fgetc(%struct._IO_FILE*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @b_detach(%struct.bit_io_t* %bf) #0 !dbg !285 {
entry:
  %bf.addr = alloca %struct.bit_io_t*, align 8
  store %struct.bit_io_t* %bf, %struct.bit_io_t** %bf.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.bit_io_t** %bf.addr, metadata !288, metadata !DIExpression()), !dbg !289
  %0 = load %struct.bit_io_t*, %struct.bit_io_t** %bf.addr, align 8, !dbg !290
  %bits = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %0, i32 0, i32 2, !dbg !292
  %1 = load i32, i32* %bits, align 4, !dbg !292
  %tobool = icmp ne i32 %1, 0, !dbg !290
  br i1 %tobool, label %if.then, label %if.end, !dbg !293, !cf.info !177

if.then:                                          ; preds = %entry
  %2 = load %struct.bit_io_t*, %struct.bit_io_t** %bf.addr, align 8, !dbg !294
  %bits1 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %2, i32 0, i32 2, !dbg !296
  %3 = load i32, i32* %bits1, align 4, !dbg !296
  %sub = sub nsw i32 8, %3, !dbg !297
  %4 = load %struct.bit_io_t*, %struct.bit_io_t** %bf.addr, align 8, !dbg !298
  %accu = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %4, i32 0, i32 1, !dbg !299
  %5 = load i32, i32* %accu, align 8, !dbg !300
  %shl = shl i32 %5, %sub, !dbg !300
  store i32 %shl, i32* %accu, align 8, !dbg !300
  %6 = load %struct.bit_io_t*, %struct.bit_io_t** %bf.addr, align 8, !dbg !301
  %accu2 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %6, i32 0, i32 1, !dbg !302
  %7 = load i32, i32* %accu2, align 8, !dbg !302
  %8 = load %struct.bit_io_t*, %struct.bit_io_t** %bf.addr, align 8, !dbg !303
  %fp = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %8, i32 0, i32 0, !dbg !304
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !304
  %call = call i32 @fputc(i32 %7, %struct._IO_FILE* %9), !dbg !305
  br label %if.end, !dbg !306

if.end:                                           ; preds = %if.then, %entry
  %10 = load %struct.bit_io_t*, %struct.bit_io_t** %bf.addr, align 8, !dbg !307
  %11 = bitcast %struct.bit_io_t* %10 to i8*, !dbg !307
  call void @free(i8* %11) #5, !dbg !308
  ret void, !dbg !309
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !310 {
entry:
  %retval = alloca i32, align 4
  %s = alloca [12 x i8], align 1
  %s2 = alloca [11 x i8], align 1
  %i = alloca i32, align 4
  %f = alloca %struct._IO_FILE*, align 8
  %b = alloca %struct.bit_io_t*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [12 x i8]* %s, metadata !313, metadata !DIExpression()), !dbg !317
  %0 = bitcast [12 x i8]* %s to i8*, !dbg !317
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([12 x i8], [12 x i8]* @__const.main.s, i32 0, i32 0), i64 12, i1 false), !dbg !317
  call void @llvm.dbg.declare(metadata [11 x i8]* %s2, metadata !318, metadata !DIExpression()), !dbg !322
  %1 = bitcast [11 x i8]* %s2 to i8*, !dbg !322
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 11, i1 false), !dbg !322
  call void @llvm.dbg.declare(metadata i32* %i, metadata !323, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %f, metadata !325, metadata !DIExpression()), !dbg !326
  %call = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0)), !dbg !327
  store %struct._IO_FILE* %call, %struct._IO_FILE** %f, align 8, !dbg !326
  call void @llvm.dbg.declare(metadata %struct.bit_io_t** %b, metadata !328, metadata !DIExpression()), !dbg !329
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %f, align 8, !dbg !330
  %call1 = call %struct.bit_io_t* @b_attach(%struct._IO_FILE* %2), !dbg !331
  store %struct.bit_io_t* %call1, %struct.bit_io_t** %b, align 8, !dbg !329
  store i32 0, i32* %i, align 4, !dbg !332
  br label %for.cond, !dbg !334

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !335
  %cmp = icmp slt i32 %3, 10, !dbg !337
  br i1 %cmp, label %for.body, label %for.end, !dbg !338

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [12 x i8], [12 x i8]* %s, i64 0, i64 0, !dbg !339
  %4 = load i32, i32* %i, align 4, !dbg !340
  %idx.ext = sext i32 %4 to i64, !dbg !341
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay, i64 %idx.ext, !dbg !341
  %5 = load %struct.bit_io_t*, %struct.bit_io_t** %b, align 8, !dbg !342
  call void @b_write(i8* %add.ptr, i64 7, i64 1, %struct.bit_io_t* %5), !dbg !343
  br label %for.inc, !dbg !343

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !344
  %inc = add nsw i32 %6, 1, !dbg !344
  store i32 %inc, i32* %i, align 4, !dbg !344
  br label %for.cond, !dbg !345, !llvm.loop !346

for.end:                                          ; preds = %for.cond
  %7 = load %struct.bit_io_t*, %struct.bit_io_t** %b, align 8, !dbg !348
  call void @b_detach(%struct.bit_io_t* %7), !dbg !349
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %f, align 8, !dbg !350
  %call2 = call i32 @fclose(%struct._IO_FILE* %8), !dbg !351
  %call3 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0)), !dbg !352
  store %struct._IO_FILE* %call3, %struct._IO_FILE** %f, align 8, !dbg !353
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %f, align 8, !dbg !354
  %call4 = call %struct.bit_io_t* @b_attach(%struct._IO_FILE* %9), !dbg !355
  store %struct.bit_io_t* %call4, %struct.bit_io_t** %b, align 8, !dbg !356
  store i32 0, i32* %i, align 4, !dbg !357
  br label %for.cond5, !dbg !359

for.cond5:                                        ; preds = %for.inc12, %for.end
  %10 = load i32, i32* %i, align 4, !dbg !360
  %cmp6 = icmp slt i32 %10, 10, !dbg !362
  br i1 %cmp6, label %for.body7, label %for.end14, !dbg !363

for.body7:                                        ; preds = %for.cond5
  %arraydecay8 = getelementptr inbounds [11 x i8], [11 x i8]* %s2, i64 0, i64 0, !dbg !364
  %11 = load i32, i32* %i, align 4, !dbg !365
  %idx.ext9 = sext i32 %11 to i64, !dbg !366
  %add.ptr10 = getelementptr inbounds i8, i8* %arraydecay8, i64 %idx.ext9, !dbg !366
  %12 = load %struct.bit_io_t*, %struct.bit_io_t** %b, align 8, !dbg !367
  %call11 = call i64 @b_read(i8* %add.ptr10, i64 7, i64 1, %struct.bit_io_t* %12), !dbg !368
  br label %for.inc12, !dbg !368

for.inc12:                                        ; preds = %for.body7
  %13 = load i32, i32* %i, align 4, !dbg !369
  %inc13 = add nsw i32 %13, 1, !dbg !369
  store i32 %inc13, i32* %i, align 4, !dbg !369
  br label %for.cond5, !dbg !370, !llvm.loop !371

for.end14:                                        ; preds = %for.cond5
  %14 = load %struct.bit_io_t*, %struct.bit_io_t** %b, align 8, !dbg !373
  call void @b_detach(%struct.bit_io_t* %14), !dbg !374
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %f, align 8, !dbg !375
  %call15 = call i32 @fclose(%struct._IO_FILE* %15), !dbg !376
  %arraydecay16 = getelementptr inbounds [11 x i8], [11 x i8]* %s2, i64 0, i64 0, !dbg !377
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i8* %arraydecay16), !dbg !378
  ret i32 0, !dbg !379
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #3

declare dso_local i32 @fclose(%struct._IO_FILE*) #3

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "bitwise-io.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Bitwise-IO")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "b_attach", scope: !1, file: !1, line: 13, type: !8, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !15}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "bit_filter", file: !1, line: 11, baseType: !11)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 7, size: 128, elements: !13)
!13 = !{!14, !78, !83}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "fp", scope: !12, file: !1, line: 8, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !17, line: 7, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !19, line: 49, size: 1728, elements: !20)
!19 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!20 = !{!21, !23, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !39, !41, !42, !43, !47, !49, !51, !55, !58, !60, !63, !66, !67, !69, !73, !74}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !18, file: !19, line: 51, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !18, file: !19, line: 54, baseType: !24, size: 64, offset: 64)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !18, file: !19, line: 55, baseType: !24, size: 64, offset: 128)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !18, file: !19, line: 56, baseType: !24, size: 64, offset: 192)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !18, file: !19, line: 57, baseType: !24, size: 64, offset: 256)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !18, file: !19, line: 58, baseType: !24, size: 64, offset: 320)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !18, file: !19, line: 59, baseType: !24, size: 64, offset: 384)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !18, file: !19, line: 60, baseType: !24, size: 64, offset: 448)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !18, file: !19, line: 61, baseType: !24, size: 64, offset: 512)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !18, file: !19, line: 64, baseType: !24, size: 64, offset: 576)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !18, file: !19, line: 65, baseType: !24, size: 64, offset: 640)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !18, file: !19, line: 66, baseType: !24, size: 64, offset: 704)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !18, file: !19, line: 68, baseType: !37, size: 64, offset: 768)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !19, line: 36, flags: DIFlagFwdDecl)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !18, file: !19, line: 70, baseType: !40, size: 64, offset: 832)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !18, file: !19, line: 72, baseType: !22, size: 32, offset: 896)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !18, file: !19, line: 73, baseType: !22, size: 32, offset: 928)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !18, file: !19, line: 74, baseType: !44, size: 64, offset: 960)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !45, line: 152, baseType: !46)
!45 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!46 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !18, file: !19, line: 77, baseType: !48, size: 16, offset: 1024)
!48 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !18, file: !19, line: 78, baseType: !50, size: 8, offset: 1040)
!50 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !18, file: !19, line: 79, baseType: !52, size: 8, offset: 1048)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 8, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 1)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !18, file: !19, line: 81, baseType: !56, size: 64, offset: 1088)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !19, line: 43, baseType: null)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !18, file: !19, line: 89, baseType: !59, size: 64, offset: 1152)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !45, line: 153, baseType: !46)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !18, file: !19, line: 91, baseType: !61, size: 64, offset: 1216)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !19, line: 37, flags: DIFlagFwdDecl)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !18, file: !19, line: 92, baseType: !64, size: 64, offset: 1280)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !19, line: 38, flags: DIFlagFwdDecl)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !18, file: !19, line: 93, baseType: !40, size: 64, offset: 1344)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !18, file: !19, line: 94, baseType: !68, size: 64, offset: 1408)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !18, file: !19, line: 95, baseType: !70, size: 64, offset: 1472)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !71, line: 46, baseType: !72)
!71 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!72 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !18, file: !19, line: 96, baseType: !22, size: 32, offset: 1536)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !18, file: !19, line: 98, baseType: !75, size: 160, offset: 1568)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 160, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 20)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "accu", scope: !12, file: !1, line: 9, baseType: !79, size: 32, offset: 64)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !80, line: 26, baseType: !81)
!80 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!81 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !45, line: 42, baseType: !82)
!82 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "bits", scope: !12, file: !1, line: 10, baseType: !22, size: 32, offset: 96)
!84 = !DILocalVariable(name: "f", arg: 1, scope: !7, file: !1, line: 13, type: !15)
!85 = !DILocation(line: 13, column: 27, scope: !7)
!86 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 15, type: !10)
!87 = !DILocation(line: 15, column: 13, scope: !7)
!88 = !DILocation(line: 15, column: 17, scope: !7)
!89 = !DILocation(line: 16, column: 12, scope: !7)
!90 = !DILocation(line: 16, column: 15, scope: !7)
!91 = !DILocation(line: 16, column: 20, scope: !7)
!92 = !DILocation(line: 16, column: 2, scope: !7)
!93 = !DILocation(line: 16, column: 5, scope: !7)
!94 = !DILocation(line: 16, column: 10, scope: !7)
!95 = !DILocation(line: 17, column: 10, scope: !7)
!96 = !DILocation(line: 17, column: 2, scope: !7)
!97 = !DILocation(line: 17, column: 5, scope: !7)
!98 = !DILocation(line: 17, column: 8, scope: !7)
!99 = !DILocation(line: 18, column: 9, scope: !7)
!100 = !DILocation(line: 18, column: 2, scope: !7)
!101 = distinct !DISubprogram(name: "b_write", scope: !1, file: !1, line: 21, type: !102, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DISubroutineType(types: !103)
!103 = !{null, !104, !70, !70, !10}
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIDerivedType(tag: DW_TAG_typedef, name: "byte", file: !1, line: 6, baseType: !106)
!106 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !80, line: 24, baseType: !107)
!107 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !45, line: 38, baseType: !108)
!108 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!109 = !DILocalVariable(name: "buf", arg: 1, scope: !101, file: !1, line: 21, type: !104)
!110 = !DILocation(line: 21, column: 20, scope: !101)
!111 = !DILocalVariable(name: "n_bits", arg: 2, scope: !101, file: !1, line: 21, type: !70)
!112 = !DILocation(line: 21, column: 32, scope: !101)
!113 = !DILocalVariable(name: "shift", arg: 3, scope: !101, file: !1, line: 21, type: !70)
!114 = !DILocation(line: 21, column: 47, scope: !101)
!115 = !DILocalVariable(name: "bf", arg: 4, scope: !101, file: !1, line: 21, type: !10)
!116 = !DILocation(line: 21, column: 65, scope: !101)
!117 = !DILocalVariable(name: "accu", scope: !101, file: !1, line: 23, type: !79)
!118 = !DILocation(line: 23, column: 11, scope: !101)
!119 = !DILocation(line: 23, column: 18, scope: !101)
!120 = !DILocation(line: 23, column: 22, scope: !101)
!121 = !DILocalVariable(name: "bits", scope: !101, file: !1, line: 24, type: !22)
!122 = !DILocation(line: 24, column: 6, scope: !101)
!123 = !DILocation(line: 24, column: 13, scope: !101)
!124 = !DILocation(line: 24, column: 17, scope: !101)
!125 = !DILocation(line: 26, column: 9, scope: !101)
!126 = !DILocation(line: 26, column: 15, scope: !101)
!127 = !DILocation(line: 26, column: 6, scope: !101)
!128 = !DILocation(line: 27, column: 8, scope: !101)
!129 = !DILocation(line: 29, column: 2, scope: !101)
!130 = !DILocation(line: 29, column: 9, scope: !101)
!131 = !DILocation(line: 29, column: 16, scope: !101)
!132 = !DILocation(line: 29, column: 19, scope: !101)
!133 = !DILocation(line: 29, column: 24, scope: !101)
!134 = !DILocation(line: 30, column: 3, scope: !135)
!135 = distinct !DILexicalBlock(scope: !101, file: !1, line: 29, column: 30)
!136 = !DILocation(line: 30, column: 10, scope: !135)
!137 = !DILocation(line: 30, column: 15, scope: !135)
!138 = !DILocation(line: 31, column: 9, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !1, line: 30, column: 21)
!140 = !DILocation(line: 32, column: 10, scope: !139)
!141 = !DILocation(line: 32, column: 18, scope: !139)
!142 = !DILocation(line: 32, column: 15, scope: !139)
!143 = !DILocation(line: 32, column: 24, scope: !139)
!144 = !DILocation(line: 32, column: 28, scope: !139)
!145 = !DILocation(line: 32, column: 4, scope: !139)
!146 = !DILocation(line: 33, column: 18, scope: !139)
!147 = !DILocation(line: 33, column: 15, scope: !139)
!148 = !DILocation(line: 33, column: 24, scope: !139)
!149 = !DILocation(line: 33, column: 9, scope: !139)
!150 = distinct !{!150, !134, !151}
!151 = !DILocation(line: 34, column: 3, scope: !135)
!152 = !DILocation(line: 35, column: 3, scope: !135)
!153 = !DILocation(line: 35, column: 10, scope: !135)
!154 = !DILocation(line: 35, column: 15, scope: !135)
!155 = !DILocation(line: 35, column: 19, scope: !135)
!156 = !DILocation(line: 35, column: 22, scope: !135)
!157 = !DILocation(line: 0, scope: !135)
!158 = !DILocation(line: 36, column: 12, scope: !159)
!159 = distinct !DILexicalBlock(scope: !135, file: !1, line: 35, column: 30)
!160 = !DILocation(line: 36, column: 17, scope: !159)
!161 = !DILocation(line: 36, column: 35, scope: !159)
!162 = !DILocation(line: 36, column: 32, scope: !159)
!163 = !DILocation(line: 36, column: 45, scope: !159)
!164 = !DILocation(line: 36, column: 44, scope: !159)
!165 = !DILocation(line: 36, column: 42, scope: !159)
!166 = !DILocation(line: 36, column: 58, scope: !159)
!167 = !DILocation(line: 36, column: 56, scope: !159)
!168 = !DILocation(line: 36, column: 50, scope: !159)
!169 = !DILocation(line: 36, column: 23, scope: !159)
!170 = !DILocation(line: 36, column: 9, scope: !159)
!171 = !DILocation(line: 37, column: 4, scope: !159)
!172 = !DILocation(line: 38, column: 8, scope: !159)
!173 = !DILocation(line: 39, column: 8, scope: !174)
!174 = distinct !DILexicalBlock(scope: !159, file: !1, line: 39, column: 8)
!175 = !DILocation(line: 39, column: 16, scope: !174)
!176 = !DILocation(line: 39, column: 8, scope: !159)
!177 = !{!"if"}
!178 = !DILocation(line: 40, column: 11, scope: !179)
!179 = distinct !DILexicalBlock(scope: !174, file: !1, line: 39, column: 22)
!180 = !DILocation(line: 41, column: 8, scope: !179)
!181 = !DILocation(line: 42, column: 4, scope: !179)
!182 = distinct !{!182, !152, !183}
!183 = !DILocation(line: 43, column: 3, scope: !135)
!184 = distinct !{!184, !129, !185}
!185 = !DILocation(line: 44, column: 2, scope: !101)
!186 = !DILocation(line: 45, column: 13, scope: !101)
!187 = !DILocation(line: 45, column: 2, scope: !101)
!188 = !DILocation(line: 45, column: 6, scope: !101)
!189 = !DILocation(line: 45, column: 11, scope: !101)
!190 = !DILocation(line: 46, column: 13, scope: !101)
!191 = !DILocation(line: 46, column: 2, scope: !101)
!192 = !DILocation(line: 46, column: 6, scope: !101)
!193 = !DILocation(line: 46, column: 11, scope: !101)
!194 = !DILocation(line: 47, column: 1, scope: !101)
!195 = distinct !DISubprogram(name: "b_read", scope: !1, file: !1, line: 49, type: !196, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!196 = !DISubroutineType(types: !197)
!197 = !{!70, !104, !70, !70, !10}
!198 = !DILocalVariable(name: "buf", arg: 1, scope: !195, file: !1, line: 49, type: !104)
!199 = !DILocation(line: 49, column: 21, scope: !195)
!200 = !DILocalVariable(name: "n_bits", arg: 2, scope: !195, file: !1, line: 49, type: !70)
!201 = !DILocation(line: 49, column: 33, scope: !195)
!202 = !DILocalVariable(name: "shift", arg: 3, scope: !195, file: !1, line: 49, type: !70)
!203 = !DILocation(line: 49, column: 48, scope: !195)
!204 = !DILocalVariable(name: "bf", arg: 4, scope: !195, file: !1, line: 49, type: !10)
!205 = !DILocation(line: 49, column: 66, scope: !195)
!206 = !DILocalVariable(name: "accu", scope: !195, file: !1, line: 51, type: !79)
!207 = !DILocation(line: 51, column: 11, scope: !195)
!208 = !DILocation(line: 51, column: 18, scope: !195)
!209 = !DILocation(line: 51, column: 22, scope: !195)
!210 = !DILocalVariable(name: "bits", scope: !195, file: !1, line: 52, type: !22)
!211 = !DILocation(line: 52, column: 6, scope: !195)
!212 = !DILocation(line: 52, column: 13, scope: !195)
!213 = !DILocation(line: 52, column: 17, scope: !195)
!214 = !DILocalVariable(name: "mask", scope: !195, file: !1, line: 53, type: !22)
!215 = !DILocation(line: 53, column: 6, scope: !195)
!216 = !DILocalVariable(name: "i", scope: !195, file: !1, line: 53, type: !22)
!217 = !DILocation(line: 53, column: 12, scope: !195)
!218 = !DILocation(line: 55, column: 9, scope: !195)
!219 = !DILocation(line: 55, column: 15, scope: !195)
!220 = !DILocation(line: 55, column: 6, scope: !195)
!221 = !DILocation(line: 56, column: 8, scope: !195)
!222 = !DILocation(line: 58, column: 2, scope: !195)
!223 = !DILocation(line: 58, column: 9, scope: !195)
!224 = !DILocation(line: 59, column: 3, scope: !225)
!225 = distinct !DILexicalBlock(scope: !195, file: !1, line: 58, column: 17)
!226 = !DILocation(line: 59, column: 10, scope: !225)
!227 = !DILocation(line: 59, column: 15, scope: !225)
!228 = !DILocation(line: 59, column: 18, scope: !225)
!229 = !DILocation(line: 0, scope: !225)
!230 = !DILocation(line: 60, column: 18, scope: !231)
!231 = distinct !DILexicalBlock(scope: !225, file: !1, line: 59, column: 26)
!232 = !DILocation(line: 60, column: 15, scope: !231)
!233 = !DILocation(line: 60, column: 9, scope: !231)
!234 = !DILocation(line: 61, column: 8, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !1, line: 61, column: 8)
!236 = !DILocation(line: 61, column: 22, scope: !235)
!237 = !DILocation(line: 61, column: 27, scope: !235)
!238 = !DILocation(line: 61, column: 18, scope: !235)
!239 = !DILocation(line: 61, column: 13, scope: !235)
!240 = !DILocation(line: 61, column: 8, scope: !231)
!241 = !DILocation(line: 61, column: 42, scope: !235)
!242 = !DILocation(line: 61, column: 35, scope: !235)
!243 = !DILocation(line: 61, column: 39, scope: !235)
!244 = !DILocation(line: 61, column: 34, scope: !235)
!245 = !DILocation(line: 62, column: 18, scope: !235)
!246 = !DILocation(line: 62, column: 17, scope: !235)
!247 = !DILocation(line: 62, column: 10, scope: !235)
!248 = !DILocation(line: 62, column: 14, scope: !235)
!249 = !DILocation(line: 64, column: 10, scope: !231)
!250 = !DILocation(line: 65, column: 8, scope: !231)
!251 = !DILocation(line: 67, column: 8, scope: !252)
!252 = distinct !DILexicalBlock(scope: !231, file: !1, line: 67, column: 8)
!253 = !DILocation(line: 67, column: 16, scope: !252)
!254 = !DILocation(line: 67, column: 8, scope: !231)
!255 = !DILocation(line: 68, column: 11, scope: !256)
!256 = distinct !DILexicalBlock(scope: !252, file: !1, line: 67, column: 22)
!257 = !DILocation(line: 69, column: 8, scope: !256)
!258 = !DILocation(line: 70, column: 4, scope: !256)
!259 = distinct !{!259, !224, !260}
!260 = !DILocation(line: 71, column: 3, scope: !225)
!261 = !DILocation(line: 72, column: 8, scope: !262)
!262 = distinct !DILexicalBlock(scope: !225, file: !1, line: 72, column: 7)
!263 = !DILocation(line: 72, column: 7, scope: !225)
!264 = !DILocation(line: 72, column: 16, scope: !262)
!265 = !DILocation(line: 73, column: 11, scope: !225)
!266 = !DILocation(line: 73, column: 16, scope: !225)
!267 = !DILocation(line: 73, column: 30, scope: !225)
!268 = !DILocation(line: 73, column: 34, scope: !225)
!269 = !DILocation(line: 73, column: 24, scope: !225)
!270 = !DILocation(line: 73, column: 22, scope: !225)
!271 = !DILocation(line: 73, column: 8, scope: !225)
!272 = !DILocation(line: 74, column: 8, scope: !225)
!273 = distinct !{!273, !222, !274}
!274 = !DILocation(line: 75, column: 2, scope: !195)
!275 = !DILocation(line: 76, column: 13, scope: !195)
!276 = !DILocation(line: 76, column: 2, scope: !195)
!277 = !DILocation(line: 76, column: 6, scope: !195)
!278 = !DILocation(line: 76, column: 11, scope: !195)
!279 = !DILocation(line: 77, column: 13, scope: !195)
!280 = !DILocation(line: 77, column: 2, scope: !195)
!281 = !DILocation(line: 77, column: 6, scope: !195)
!282 = !DILocation(line: 77, column: 11, scope: !195)
!283 = !DILocation(line: 79, column: 9, scope: !195)
!284 = !DILocation(line: 79, column: 2, scope: !195)
!285 = distinct !DISubprogram(name: "b_detach", scope: !1, file: !1, line: 82, type: !286, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!286 = !DISubroutineType(types: !287)
!287 = !{null, !10}
!288 = !DILocalVariable(name: "bf", arg: 1, scope: !285, file: !1, line: 82, type: !10)
!289 = !DILocation(line: 82, column: 26, scope: !285)
!290 = !DILocation(line: 84, column: 6, scope: !291)
!291 = distinct !DILexicalBlock(scope: !285, file: !1, line: 84, column: 6)
!292 = !DILocation(line: 84, column: 10, scope: !291)
!293 = !DILocation(line: 84, column: 6, scope: !285)
!294 = !DILocation(line: 85, column: 20, scope: !295)
!295 = distinct !DILexicalBlock(scope: !291, file: !1, line: 84, column: 16)
!296 = !DILocation(line: 85, column: 24, scope: !295)
!297 = !DILocation(line: 85, column: 18, scope: !295)
!298 = !DILocation(line: 85, column: 3, scope: !295)
!299 = !DILocation(line: 85, column: 7, scope: !295)
!300 = !DILocation(line: 85, column: 12, scope: !295)
!301 = !DILocation(line: 86, column: 9, scope: !295)
!302 = !DILocation(line: 86, column: 13, scope: !295)
!303 = !DILocation(line: 86, column: 19, scope: !295)
!304 = !DILocation(line: 86, column: 23, scope: !295)
!305 = !DILocation(line: 86, column: 3, scope: !295)
!306 = !DILocation(line: 87, column: 2, scope: !295)
!307 = !DILocation(line: 88, column: 7, scope: !285)
!308 = !DILocation(line: 88, column: 2, scope: !285)
!309 = !DILocation(line: 89, column: 1, scope: !285)
!310 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 91, type: !311, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!311 = !DISubroutineType(types: !312)
!312 = !{!22}
!313 = !DILocalVariable(name: "s", scope: !310, file: !1, line: 93, type: !314)
!314 = !DICompositeType(tag: DW_TAG_array_type, baseType: !108, size: 96, elements: !315)
!315 = !{!316}
!316 = !DISubrange(count: 12)
!317 = !DILocation(line: 93, column: 16, scope: !310)
!318 = !DILocalVariable(name: "s2", scope: !310, file: !1, line: 94, type: !319)
!319 = !DICompositeType(tag: DW_TAG_array_type, baseType: !108, size: 88, elements: !320)
!320 = !{!321}
!321 = !DISubrange(count: 11)
!322 = !DILocation(line: 94, column: 16, scope: !310)
!323 = !DILocalVariable(name: "i", scope: !310, file: !1, line: 95, type: !22)
!324 = !DILocation(line: 95, column: 6, scope: !310)
!325 = !DILocalVariable(name: "f", scope: !310, file: !1, line: 97, type: !15)
!326 = !DILocation(line: 97, column: 8, scope: !310)
!327 = !DILocation(line: 97, column: 12, scope: !310)
!328 = !DILocalVariable(name: "b", scope: !310, file: !1, line: 98, type: !10)
!329 = !DILocation(line: 98, column: 13, scope: !310)
!330 = !DILocation(line: 98, column: 26, scope: !310)
!331 = !DILocation(line: 98, column: 17, scope: !310)
!332 = !DILocation(line: 100, column: 9, scope: !333)
!333 = distinct !DILexicalBlock(scope: !310, file: !1, line: 100, column: 2)
!334 = !DILocation(line: 100, column: 7, scope: !333)
!335 = !DILocation(line: 100, column: 14, scope: !336)
!336 = distinct !DILexicalBlock(scope: !333, file: !1, line: 100, column: 2)
!337 = !DILocation(line: 100, column: 16, scope: !336)
!338 = !DILocation(line: 100, column: 2, scope: !333)
!339 = !DILocation(line: 100, column: 35, scope: !336)
!340 = !DILocation(line: 100, column: 39, scope: !336)
!341 = !DILocation(line: 100, column: 37, scope: !336)
!342 = !DILocation(line: 100, column: 48, scope: !336)
!343 = !DILocation(line: 100, column: 27, scope: !336)
!344 = !DILocation(line: 100, column: 23, scope: !336)
!345 = !DILocation(line: 100, column: 2, scope: !336)
!346 = distinct !{!346, !338, !347}
!347 = !DILocation(line: 100, column: 49, scope: !333)
!348 = !DILocation(line: 101, column: 11, scope: !310)
!349 = !DILocation(line: 101, column: 2, scope: !310)
!350 = !DILocation(line: 102, column: 9, scope: !310)
!351 = !DILocation(line: 102, column: 2, scope: !310)
!352 = !DILocation(line: 105, column: 6, scope: !310)
!353 = !DILocation(line: 105, column: 4, scope: !310)
!354 = !DILocation(line: 106, column: 15, scope: !310)
!355 = !DILocation(line: 106, column: 6, scope: !310)
!356 = !DILocation(line: 106, column: 4, scope: !310)
!357 = !DILocation(line: 107, column: 9, scope: !358)
!358 = distinct !DILexicalBlock(scope: !310, file: !1, line: 107, column: 2)
!359 = !DILocation(line: 107, column: 7, scope: !358)
!360 = !DILocation(line: 107, column: 14, scope: !361)
!361 = distinct !DILexicalBlock(scope: !358, file: !1, line: 107, column: 2)
!362 = !DILocation(line: 107, column: 16, scope: !361)
!363 = !DILocation(line: 107, column: 2, scope: !358)
!364 = !DILocation(line: 107, column: 34, scope: !361)
!365 = !DILocation(line: 107, column: 39, scope: !361)
!366 = !DILocation(line: 107, column: 37, scope: !361)
!367 = !DILocation(line: 107, column: 48, scope: !361)
!368 = !DILocation(line: 107, column: 27, scope: !361)
!369 = !DILocation(line: 107, column: 23, scope: !361)
!370 = !DILocation(line: 107, column: 2, scope: !361)
!371 = distinct !{!371, !363, !372}
!372 = !DILocation(line: 107, column: 49, scope: !358)
!373 = !DILocation(line: 108, column: 11, scope: !310)
!374 = !DILocation(line: 108, column: 2, scope: !310)
!375 = !DILocation(line: 109, column: 9, scope: !310)
!376 = !DILocation(line: 109, column: 2, scope: !310)
!377 = !DILocation(line: 111, column: 19, scope: !310)
!378 = !DILocation(line: 111, column: 2, scope: !310)
!379 = !DILocation(line: 113, column: 2, scope: !310)
