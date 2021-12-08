; ModuleID = 'bitwise-io.ll'
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
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %f, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call noalias i8* @malloc(i64 16) #5, !dbg !86
  %0 = bitcast i8* %call to %struct.bit_io_t*, !dbg !86
  call void @llvm.dbg.value(metadata %struct.bit_io_t* %0, metadata !87, metadata !DIExpression()), !dbg !85
  %accu = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %0, i32 0, i32 1, !dbg !88
  store i32 0, i32* %accu, align 8, !dbg !89
  %bits = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %0, i32 0, i32 2, !dbg !90
  store i32 0, i32* %bits, align 4, !dbg !91
  %fp = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %0, i32 0, i32 0, !dbg !92
  store %struct._IO_FILE* %f, %struct._IO_FILE** %fp, align 8, !dbg !93
  ret %struct.bit_io_t* %0, !dbg !94
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @b_write(i8* %buf, i64 %n_bits, i64 %shift, %struct.bit_io_t* %bf) #0 !dbg !95 {
entry:
  call void @llvm.dbg.value(metadata i8* %buf, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i64 %n_bits, metadata !105, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i64 %shift, metadata !106, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata %struct.bit_io_t* %bf, metadata !107, metadata !DIExpression()), !dbg !104
  %accu1 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 1, !dbg !108
  %0 = load i32, i32* %accu1, align 8, !dbg !108
  call void @llvm.dbg.value(metadata i32 %0, metadata !109, metadata !DIExpression()), !dbg !104
  %bits2 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 2, !dbg !110
  %1 = load i32, i32* %bits2, align 4, !dbg !110
  call void @llvm.dbg.value(metadata i32 %1, metadata !111, metadata !DIExpression()), !dbg !104
  %div = udiv i64 %shift, 8, !dbg !112
  %add.ptr = getelementptr inbounds i8, i8* %buf, i64 %div, !dbg !113
  call void @llvm.dbg.value(metadata i8* %add.ptr, metadata !103, metadata !DIExpression()), !dbg !104
  %rem = urem i64 %shift, 8, !dbg !114
  call void @llvm.dbg.value(metadata i64 %rem, metadata !106, metadata !DIExpression()), !dbg !104
  br label %while.cond, !dbg !115

while.cond:                                       ; preds = %while.end20, %entry
  %accu.0 = phi i32 [ %0, %entry ], [ %accu.2, %while.end20 ], !dbg !116
  %bits.0 = phi i32 [ %1, %entry ], [ %bits.2, %while.end20 ], !dbg !117
  %shift.addr.0 = phi i64 [ %rem, %entry ], [ %shift.addr.1, %while.end20 ], !dbg !114
  %n_bits.addr.0 = phi i64 [ %n_bits, %entry ], [ %n_bits.addr.1, %while.end20 ]
  %buf.addr.0 = phi i8* [ %add.ptr, %entry ], [ %buf.addr.1, %while.end20 ], !dbg !113
  call void @llvm.dbg.value(metadata i8* %buf.addr.0, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i64 %n_bits.addr.0, metadata !105, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i64 %shift.addr.0, metadata !106, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i32 %bits.0, metadata !111, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i32 %accu.0, metadata !109, metadata !DIExpression()), !dbg !104
  %tobool = icmp ne i64 %n_bits.addr.0, 0, !dbg !118
  br i1 %tobool, label %lor.end, label %lor.rhs, !dbg !119

lor.rhs:                                          ; preds = %while.cond
  %cmp = icmp sge i32 %bits.0, 8, !dbg !120
  br label %lor.end, !dbg !119

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %2 = phi i1 [ true, %while.cond ], [ %cmp, %lor.rhs ]
  br i1 %2, label %while.body, label %while.end21, !dbg !115

while.body:                                       ; preds = %lor.end
  br label %while.cond3, !dbg !121

while.cond3:                                      ; preds = %while.body5, %while.body
  %accu.1 = phi i32 [ %accu.0, %while.body ], [ %and, %while.body5 ], !dbg !104
  %bits.1 = phi i32 [ %bits.0, %while.body ], [ %sub, %while.body5 ], !dbg !104
  call void @llvm.dbg.value(metadata i32 %bits.1, metadata !111, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i32 %accu.1, metadata !109, metadata !DIExpression()), !dbg !104
  %cmp4 = icmp sge i32 %bits.1, 8, !dbg !123
  br i1 %cmp4, label %while.body5, label %while.end, !dbg !121

while.body5:                                      ; preds = %while.cond3
  %sub = sub nsw i32 %bits.1, 8, !dbg !124
  call void @llvm.dbg.value(metadata i32 %sub, metadata !111, metadata !DIExpression()), !dbg !104
  %shr = lshr i32 %accu.1, %sub, !dbg !126
  %fp = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 0, !dbg !127
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !127
  %call = call i32 @fputc(i32 %shr, %struct._IO_FILE* %3), !dbg !128
  %shl = shl i32 1, %sub, !dbg !129
  %sub6 = sub nsw i32 %shl, 1, !dbg !130
  %and = and i32 %accu.1, %sub6, !dbg !131
  call void @llvm.dbg.value(metadata i32 %and, metadata !109, metadata !DIExpression()), !dbg !104
  br label %while.cond3, !dbg !121, !llvm.loop !132

while.end:                                        ; preds = %while.cond3
  br label %while.cond7, !dbg !134

while.cond7:                                      ; preds = %if.end, %while.end
  %accu.2 = phi i32 [ %accu.1, %while.end ], [ %or, %if.end ], !dbg !104
  %bits.2 = phi i32 [ %bits.1, %while.end ], [ %inc, %if.end ], !dbg !104
  %shift.addr.1 = phi i64 [ %shift.addr.0, %while.end ], [ %shift.addr.2, %if.end ], !dbg !104
  %n_bits.addr.1 = phi i64 [ %n_bits.addr.0, %while.end ], [ %dec, %if.end ]
  %buf.addr.1 = phi i8* [ %buf.addr.0, %while.end ], [ %buf.addr.2, %if.end ], !dbg !104
  call void @llvm.dbg.value(metadata i8* %buf.addr.1, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i64 %n_bits.addr.1, metadata !105, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i64 %shift.addr.1, metadata !106, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i32 %bits.2, metadata !111, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i32 %accu.2, metadata !109, metadata !DIExpression()), !dbg !104
  %cmp8 = icmp slt i32 %bits.2, 8, !dbg !135
  br i1 %cmp8, label %land.rhs, label %land.end, !dbg !136

land.rhs:                                         ; preds = %while.cond7
  %tobool9 = icmp ne i64 %n_bits.addr.1, 0, !dbg !136
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond7
  %4 = phi i1 [ false, %while.cond7 ], [ %tobool9, %land.rhs ], !dbg !137
  br i1 %4, label %while.body10, label %while.end20, !dbg !134

while.body10:                                     ; preds = %land.end
  %shl11 = shl i32 %accu.2, 1, !dbg !138
  %sh_prom = trunc i64 %shift.addr.1 to i32, !dbg !140
  %shr12 = ashr i32 128, %sh_prom, !dbg !140
  %5 = load i8, i8* %buf.addr.1, align 1, !dbg !141
  %conv = zext i8 %5 to i32, !dbg !141
  %and13 = and i32 %shr12, %conv, !dbg !142
  %sub14 = sub i64 7, %shift.addr.1, !dbg !143
  %sh_prom15 = trunc i64 %sub14 to i32, !dbg !144
  %shr16 = ashr i32 %and13, %sh_prom15, !dbg !144
  %or = or i32 %shl11, %shr16, !dbg !145
  call void @llvm.dbg.value(metadata i32 %or, metadata !109, metadata !DIExpression()), !dbg !104
  %dec = add i64 %n_bits.addr.1, -1, !dbg !146
  call void @llvm.dbg.value(metadata i64 %dec, metadata !105, metadata !DIExpression()), !dbg !104
  %inc = add nsw i32 %bits.2, 1, !dbg !147
  call void @llvm.dbg.value(metadata i32 %inc, metadata !111, metadata !DIExpression()), !dbg !104
  %inc17 = add i64 %shift.addr.1, 1, !dbg !148
  call void @llvm.dbg.value(metadata i64 %inc17, metadata !106, metadata !DIExpression()), !dbg !104
  %cmp18 = icmp eq i64 %inc17, 8, !dbg !150
  br i1 %cmp18, label %if.then, label %if.end, !dbg !151

if.then:                                          ; preds = %while.body10
  call void @llvm.dbg.value(metadata i64 0, metadata !106, metadata !DIExpression()), !dbg !104
  %incdec.ptr = getelementptr inbounds i8, i8* %buf.addr.1, i32 1, !dbg !152
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !103, metadata !DIExpression()), !dbg !104
  br label %if.end, !dbg !154

if.end:                                           ; preds = %if.then, %while.body10
  %shift.addr.2 = phi i64 [ 0, %if.then ], [ %inc17, %while.body10 ], !dbg !155
  %buf.addr.2 = phi i8* [ %incdec.ptr, %if.then ], [ %buf.addr.1, %while.body10 ], !dbg !104
  call void @llvm.dbg.value(metadata i8* %buf.addr.2, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.value(metadata i64 %shift.addr.2, metadata !106, metadata !DIExpression()), !dbg !104
  br label %while.cond7, !dbg !134, !llvm.loop !156

while.end20:                                      ; preds = %land.end
  br label %while.cond, !dbg !115, !llvm.loop !158

while.end21:                                      ; preds = %lor.end
  %accu22 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 1, !dbg !160
  store i32 %accu.0, i32* %accu22, align 8, !dbg !161
  %bits23 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 2, !dbg !162
  store i32 %bits.0, i32* %bits23, align 4, !dbg !163
  ret void, !dbg !164
}

declare dso_local i32 @fputc(i32, %struct._IO_FILE*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @b_read(i8* %buf, i64 %n_bits, i64 %shift, %struct.bit_io_t* %bf) #0 !dbg !165 {
entry:
  call void @llvm.dbg.value(metadata i8* %buf, metadata !168, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.value(metadata i64 %n_bits, metadata !170, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.value(metadata i64 %shift, metadata !171, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.value(metadata %struct.bit_io_t* %bf, metadata !172, metadata !DIExpression()), !dbg !169
  %accu1 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 1, !dbg !173
  %0 = load i32, i32* %accu1, align 8, !dbg !173
  call void @llvm.dbg.value(metadata i32 %0, metadata !174, metadata !DIExpression()), !dbg !169
  %bits2 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 2, !dbg !175
  %1 = load i32, i32* %bits2, align 4, !dbg !175
  call void @llvm.dbg.value(metadata i32 %1, metadata !176, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.value(metadata i32 0, metadata !177, metadata !DIExpression()), !dbg !169
  %div = udiv i64 %shift, 8, !dbg !178
  %add.ptr = getelementptr inbounds i8, i8* %buf, i64 %div, !dbg !179
  call void @llvm.dbg.value(metadata i8* %add.ptr, metadata !168, metadata !DIExpression()), !dbg !169
  %rem = urem i64 %shift, 8, !dbg !180
  call void @llvm.dbg.value(metadata i64 %rem, metadata !171, metadata !DIExpression()), !dbg !169
  br label %while.cond, !dbg !181

while.cond:                                       ; preds = %if.end18, %entry
  %accu.0 = phi i32 [ %0, %entry ], [ %or20, %if.end18 ], !dbg !169
  %bits.0 = phi i32 [ %1, %entry ], [ %add, %if.end18 ], !dbg !169
  %shift.addr.0 = phi i64 [ %rem, %entry ], [ %shift.addr.1, %if.end18 ], !dbg !180
  %n_bits.addr.0 = phi i64 [ %n_bits, %entry ], [ %n_bits.addr.1, %if.end18 ]
  %buf.addr.0 = phi i8* [ %add.ptr, %entry ], [ %buf.addr.1, %if.end18 ], !dbg !179
  call void @llvm.dbg.value(metadata i8* %buf.addr.0, metadata !168, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.value(metadata i64 %n_bits.addr.0, metadata !170, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.value(metadata i64 %shift.addr.0, metadata !171, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.value(metadata i32 %bits.0, metadata !176, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.value(metadata i32 %accu.0, metadata !174, metadata !DIExpression()), !dbg !169
  %tobool = icmp ne i64 %n_bits.addr.0, 0, !dbg !181
  br i1 %tobool, label %while.body, label %while.end21.loopexit, !dbg !181

while.body:                                       ; preds = %while.cond
  br label %while.cond3, !dbg !182

while.cond3:                                      ; preds = %if.end15, %while.body
  %bits.1 = phi i32 [ %bits.0, %while.body ], [ %dec12, %if.end15 ], !dbg !169
  %shift.addr.1 = phi i64 [ %shift.addr.0, %while.body ], [ %shift.addr.2, %if.end15 ], !dbg !169
  %n_bits.addr.1 = phi i64 [ %n_bits.addr.0, %while.body ], [ %dec, %if.end15 ]
  %buf.addr.1 = phi i8* [ %buf.addr.0, %while.body ], [ %buf.addr.2, %if.end15 ], !dbg !169
  call void @llvm.dbg.value(metadata i8* %buf.addr.1, metadata !168, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.value(metadata i64 %n_bits.addr.1, metadata !170, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.value(metadata i64 %shift.addr.1, metadata !171, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.value(metadata i32 %bits.1, metadata !176, metadata !DIExpression()), !dbg !169
  %tobool4 = icmp ne i32 %bits.1, 0, !dbg !184
  br i1 %tobool4, label %land.rhs, label %land.end, !dbg !185

land.rhs:                                         ; preds = %while.cond3
  %tobool5 = icmp ne i64 %n_bits.addr.1, 0, !dbg !185
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond3
  %2 = phi i1 [ false, %while.cond3 ], [ %tobool5, %land.rhs ], !dbg !186
  br i1 %2, label %while.body6, label %while.end, !dbg !182

while.body6:                                      ; preds = %land.end
  %sh_prom = trunc i64 %shift.addr.1 to i32, !dbg !187
  %shr = ashr i32 128, %sh_prom, !dbg !187
  call void @llvm.dbg.value(metadata i32 %shr, metadata !189, metadata !DIExpression()), !dbg !169
  %sub = sub nsw i32 %bits.1, 1, !dbg !190
  %shl = shl i32 1, %sub, !dbg !192
  %and = and i32 %accu.0, %shl, !dbg !193
  %tobool7 = icmp ne i32 %and, 0, !dbg !193
  br i1 %tobool7, label %if.then, label %if.else, !dbg !194

if.then:                                          ; preds = %while.body6
  %3 = load i8, i8* %buf.addr.1, align 1, !dbg !195
  %conv = zext i8 %3 to i32, !dbg !195
  %or = or i32 %conv, %shr, !dbg !195
  %conv8 = trunc i32 %or to i8, !dbg !195
  store i8 %conv8, i8* %buf.addr.1, align 1, !dbg !195
  br label %if.end, !dbg !196

if.else:                                          ; preds = %while.body6
  %neg = xor i32 %shr, -1, !dbg !197
  %4 = load i8, i8* %buf.addr.1, align 1, !dbg !198
  %conv9 = zext i8 %4 to i32, !dbg !198
  %and10 = and i32 %conv9, %neg, !dbg !198
  %conv11 = trunc i32 %and10 to i8, !dbg !198
  store i8 %conv11, i8* %buf.addr.1, align 1, !dbg !198
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %dec = add i64 %n_bits.addr.1, -1, !dbg !199
  call void @llvm.dbg.value(metadata i64 %dec, metadata !170, metadata !DIExpression()), !dbg !169
  %dec12 = add nsw i32 %bits.1, -1, !dbg !200
  call void @llvm.dbg.value(metadata i32 %dec12, metadata !176, metadata !DIExpression()), !dbg !169
  %inc = add i64 %shift.addr.1, 1, !dbg !201
  call void @llvm.dbg.value(metadata i64 %inc, metadata !171, metadata !DIExpression()), !dbg !169
  %cmp = icmp uge i64 %inc, 8, !dbg !203
  br i1 %cmp, label %if.then14, label %if.end15, !dbg !204

if.then14:                                        ; preds = %if.end
  call void @llvm.dbg.value(metadata i64 0, metadata !171, metadata !DIExpression()), !dbg !169
  %incdec.ptr = getelementptr inbounds i8, i8* %buf.addr.1, i32 1, !dbg !205
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !168, metadata !DIExpression()), !dbg !169
  br label %if.end15, !dbg !207

if.end15:                                         ; preds = %if.then14, %if.end
  %shift.addr.2 = phi i64 [ 0, %if.then14 ], [ %inc, %if.end ], !dbg !208
  %buf.addr.2 = phi i8* [ %incdec.ptr, %if.then14 ], [ %buf.addr.1, %if.end ], !dbg !169
  call void @llvm.dbg.value(metadata i8* %buf.addr.2, metadata !168, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.value(metadata i64 %shift.addr.2, metadata !171, metadata !DIExpression()), !dbg !169
  br label %while.cond3, !dbg !182, !llvm.loop !209

while.end:                                        ; preds = %land.end
  %tobool16 = icmp ne i64 %n_bits.addr.1, 0, !dbg !211
  br i1 %tobool16, label %if.end18, label %if.then17, !dbg !213

if.then17:                                        ; preds = %while.end
  br label %while.end21, !dbg !214

if.end18:                                         ; preds = %while.end
  %shl19 = shl i32 %accu.0, 8, !dbg !215
  %fp = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 0, !dbg !216
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !216
  %call = call i32 @fgetc(%struct._IO_FILE* %5), !dbg !217
  %or20 = or i32 %shl19, %call, !dbg !218
  call void @llvm.dbg.value(metadata i32 %or20, metadata !174, metadata !DIExpression()), !dbg !169
  %add = add nsw i32 %bits.1, 8, !dbg !219
  call void @llvm.dbg.value(metadata i32 %add, metadata !176, metadata !DIExpression()), !dbg !169
  br label %while.cond, !dbg !181, !llvm.loop !220

while.end21.loopexit:                             ; preds = %while.cond
  br label %while.end21, !dbg !222

while.end21:                                      ; preds = %while.end21.loopexit, %if.then17
  %bits.2 = phi i32 [ %bits.1, %if.then17 ], [ %bits.0, %while.end21.loopexit ], !dbg !223
  call void @llvm.dbg.value(metadata i32 %bits.2, metadata !176, metadata !DIExpression()), !dbg !169
  %accu22 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 1, !dbg !224
  store i32 %accu.0, i32* %accu22, align 8, !dbg !225
  %bits23 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 2, !dbg !226
  store i32 %bits.2, i32* %bits23, align 4, !dbg !227
  %conv24 = sext i32 0 to i64, !dbg !228
  ret i64 %conv24, !dbg !229
}

declare dso_local i32 @fgetc(%struct._IO_FILE*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @b_detach(%struct.bit_io_t* %bf) #0 !dbg !230 {
entry:
  call void @llvm.dbg.value(metadata %struct.bit_io_t* %bf, metadata !233, metadata !DIExpression()), !dbg !234
  %bits = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 2, !dbg !235
  %0 = load i32, i32* %bits, align 4, !dbg !235
  %tobool = icmp ne i32 %0, 0, !dbg !237
  br i1 %tobool, label %if.then, label %if.end, !dbg !238

if.then:                                          ; preds = %entry
  %bits1 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 2, !dbg !239
  %1 = load i32, i32* %bits1, align 4, !dbg !239
  %sub = sub nsw i32 8, %1, !dbg !241
  %accu = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 1, !dbg !242
  %2 = load i32, i32* %accu, align 8, !dbg !243
  %shl = shl i32 %2, %sub, !dbg !243
  store i32 %shl, i32* %accu, align 8, !dbg !243
  %accu2 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 1, !dbg !244
  %3 = load i32, i32* %accu2, align 8, !dbg !244
  %fp = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 0, !dbg !245
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !245
  %call = call i32 @fputc(i32 %3, %struct._IO_FILE* %4), !dbg !246
  br label %if.end, !dbg !247

if.end:                                           ; preds = %if.then, %entry
  %5 = bitcast %struct.bit_io_t* %bf to i8*, !dbg !248
  call void @free(i8* %5) #5, !dbg !249
  ret void, !dbg !250
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !251 {
entry:
  %s = alloca [12 x i8], align 1
  %s2 = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata [12 x i8]* %s, metadata !254, metadata !DIExpression()), !dbg !258
  %0 = bitcast [12 x i8]* %s to i8*, !dbg !258
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([12 x i8], [12 x i8]* @__const.main.s, i32 0, i32 0), i64 12, i1 false), !dbg !258
  call void @llvm.dbg.declare(metadata [11 x i8]* %s2, metadata !259, metadata !DIExpression()), !dbg !263
  %1 = bitcast [11 x i8]* %s2 to i8*, !dbg !263
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 11, i1 false), !dbg !263
  %call = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0)), !dbg !264
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call, metadata !265, metadata !DIExpression()), !dbg !266
  %call1 = call %struct.bit_io_t* @b_attach(%struct._IO_FILE* %call), !dbg !267
  call void @llvm.dbg.value(metadata %struct.bit_io_t* %call1, metadata !268, metadata !DIExpression()), !dbg !266
  call void @llvm.dbg.value(metadata i32 0, metadata !269, metadata !DIExpression()), !dbg !266
  br label %for.cond, !dbg !270

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !272
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !269, metadata !DIExpression()), !dbg !266
  %cmp = icmp slt i32 %i.0, 10, !dbg !273
  br i1 %cmp, label %for.body, label %for.end, !dbg !275

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [12 x i8], [12 x i8]* %s, i64 0, i64 0, !dbg !276
  %idx.ext = sext i32 %i.0 to i64, !dbg !277
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay, i64 %idx.ext, !dbg !277
  call void @b_write(i8* %add.ptr, i64 7, i64 1, %struct.bit_io_t* %call1), !dbg !278
  br label %for.inc, !dbg !278

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !279
  call void @llvm.dbg.value(metadata i32 %inc, metadata !269, metadata !DIExpression()), !dbg !266
  br label %for.cond, !dbg !280, !llvm.loop !281

for.end:                                          ; preds = %for.cond
  call void @b_detach(%struct.bit_io_t* %call1), !dbg !283
  %call2 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !284
  %call3 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0)), !dbg !285
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call3, metadata !265, metadata !DIExpression()), !dbg !266
  %call4 = call %struct.bit_io_t* @b_attach(%struct._IO_FILE* %call3), !dbg !286
  call void @llvm.dbg.value(metadata %struct.bit_io_t* %call4, metadata !268, metadata !DIExpression()), !dbg !266
  call void @llvm.dbg.value(metadata i32 0, metadata !269, metadata !DIExpression()), !dbg !266
  br label %for.cond5, !dbg !287

for.cond5:                                        ; preds = %for.inc12, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc13, %for.inc12 ], !dbg !289
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !269, metadata !DIExpression()), !dbg !266
  %cmp6 = icmp slt i32 %i.1, 10, !dbg !290
  br i1 %cmp6, label %for.body7, label %for.end14, !dbg !292

for.body7:                                        ; preds = %for.cond5
  %arraydecay8 = getelementptr inbounds [11 x i8], [11 x i8]* %s2, i64 0, i64 0, !dbg !293
  %idx.ext9 = sext i32 %i.1 to i64, !dbg !294
  %add.ptr10 = getelementptr inbounds i8, i8* %arraydecay8, i64 %idx.ext9, !dbg !294
  %call11 = call i64 @b_read(i8* %add.ptr10, i64 7, i64 1, %struct.bit_io_t* %call4), !dbg !295
  br label %for.inc12, !dbg !295

for.inc12:                                        ; preds = %for.body7
  %inc13 = add nsw i32 %i.1, 1, !dbg !296
  call void @llvm.dbg.value(metadata i32 %inc13, metadata !269, metadata !DIExpression()), !dbg !266
  br label %for.cond5, !dbg !297, !llvm.loop !298

for.end14:                                        ; preds = %for.cond5
  call void @b_detach(%struct.bit_io_t* %call4), !dbg !300
  %call15 = call i32 @fclose(%struct._IO_FILE* %call3), !dbg !301
  %arraydecay16 = getelementptr inbounds [11 x i8], [11 x i8]* %s2, i64 0, i64 0, !dbg !302
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i8* %arraydecay16), !dbg !303
  ret i32 0, !dbg !304
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #3

declare dso_local i32 @fclose(%struct._IO_FILE*) #3

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "bitwise-io.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Bitwise-IO")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!71 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
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
!85 = !DILocation(line: 0, scope: !7)
!86 = !DILocation(line: 15, column: 17, scope: !7)
!87 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 15, type: !10)
!88 = !DILocation(line: 16, column: 15, scope: !7)
!89 = !DILocation(line: 16, column: 20, scope: !7)
!90 = !DILocation(line: 16, column: 5, scope: !7)
!91 = !DILocation(line: 16, column: 10, scope: !7)
!92 = !DILocation(line: 17, column: 5, scope: !7)
!93 = !DILocation(line: 17, column: 8, scope: !7)
!94 = !DILocation(line: 18, column: 2, scope: !7)
!95 = distinct !DISubprogram(name: "b_write", scope: !1, file: !1, line: 21, type: !96, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{null, !98, !70, !70, !10}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "byte", file: !1, line: 6, baseType: !100)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !80, line: 24, baseType: !101)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !45, line: 38, baseType: !102)
!102 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!103 = !DILocalVariable(name: "buf", arg: 1, scope: !95, file: !1, line: 21, type: !98)
!104 = !DILocation(line: 0, scope: !95)
!105 = !DILocalVariable(name: "n_bits", arg: 2, scope: !95, file: !1, line: 21, type: !70)
!106 = !DILocalVariable(name: "shift", arg: 3, scope: !95, file: !1, line: 21, type: !70)
!107 = !DILocalVariable(name: "bf", arg: 4, scope: !95, file: !1, line: 21, type: !10)
!108 = !DILocation(line: 23, column: 22, scope: !95)
!109 = !DILocalVariable(name: "accu", scope: !95, file: !1, line: 23, type: !79)
!110 = !DILocation(line: 24, column: 17, scope: !95)
!111 = !DILocalVariable(name: "bits", scope: !95, file: !1, line: 24, type: !22)
!112 = !DILocation(line: 26, column: 15, scope: !95)
!113 = !DILocation(line: 26, column: 6, scope: !95)
!114 = !DILocation(line: 27, column: 8, scope: !95)
!115 = !DILocation(line: 29, column: 2, scope: !95)
!116 = !DILocation(line: 23, column: 11, scope: !95)
!117 = !DILocation(line: 24, column: 6, scope: !95)
!118 = !DILocation(line: 29, column: 9, scope: !95)
!119 = !DILocation(line: 29, column: 16, scope: !95)
!120 = !DILocation(line: 29, column: 24, scope: !95)
!121 = !DILocation(line: 30, column: 3, scope: !122)
!122 = distinct !DILexicalBlock(scope: !95, file: !1, line: 29, column: 30)
!123 = !DILocation(line: 30, column: 15, scope: !122)
!124 = !DILocation(line: 31, column: 9, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !1, line: 30, column: 21)
!126 = !DILocation(line: 32, column: 15, scope: !125)
!127 = !DILocation(line: 32, column: 28, scope: !125)
!128 = !DILocation(line: 32, column: 4, scope: !125)
!129 = !DILocation(line: 33, column: 15, scope: !125)
!130 = !DILocation(line: 33, column: 24, scope: !125)
!131 = !DILocation(line: 33, column: 9, scope: !125)
!132 = distinct !{!132, !121, !133}
!133 = !DILocation(line: 34, column: 3, scope: !122)
!134 = !DILocation(line: 35, column: 3, scope: !122)
!135 = !DILocation(line: 35, column: 15, scope: !122)
!136 = !DILocation(line: 35, column: 19, scope: !122)
!137 = !DILocation(line: 0, scope: !122)
!138 = !DILocation(line: 36, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !122, file: !1, line: 35, column: 30)
!140 = !DILocation(line: 36, column: 32, scope: !139)
!141 = !DILocation(line: 36, column: 44, scope: !139)
!142 = !DILocation(line: 36, column: 42, scope: !139)
!143 = !DILocation(line: 36, column: 56, scope: !139)
!144 = !DILocation(line: 36, column: 50, scope: !139)
!145 = !DILocation(line: 36, column: 23, scope: !139)
!146 = !DILocation(line: 37, column: 4, scope: !139)
!147 = !DILocation(line: 38, column: 8, scope: !139)
!148 = !DILocation(line: 39, column: 8, scope: !149)
!149 = distinct !DILexicalBlock(scope: !139, file: !1, line: 39, column: 8)
!150 = !DILocation(line: 39, column: 16, scope: !149)
!151 = !DILocation(line: 39, column: 8, scope: !139)
!152 = !DILocation(line: 41, column: 8, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !1, line: 39, column: 22)
!154 = !DILocation(line: 42, column: 4, scope: !153)
!155 = !DILocation(line: 0, scope: !149)
!156 = distinct !{!156, !134, !157}
!157 = !DILocation(line: 43, column: 3, scope: !122)
!158 = distinct !{!158, !115, !159}
!159 = !DILocation(line: 44, column: 2, scope: !95)
!160 = !DILocation(line: 45, column: 6, scope: !95)
!161 = !DILocation(line: 45, column: 11, scope: !95)
!162 = !DILocation(line: 46, column: 6, scope: !95)
!163 = !DILocation(line: 46, column: 11, scope: !95)
!164 = !DILocation(line: 47, column: 1, scope: !95)
!165 = distinct !DISubprogram(name: "b_read", scope: !1, file: !1, line: 49, type: !166, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!166 = !DISubroutineType(types: !167)
!167 = !{!70, !98, !70, !70, !10}
!168 = !DILocalVariable(name: "buf", arg: 1, scope: !165, file: !1, line: 49, type: !98)
!169 = !DILocation(line: 0, scope: !165)
!170 = !DILocalVariable(name: "n_bits", arg: 2, scope: !165, file: !1, line: 49, type: !70)
!171 = !DILocalVariable(name: "shift", arg: 3, scope: !165, file: !1, line: 49, type: !70)
!172 = !DILocalVariable(name: "bf", arg: 4, scope: !165, file: !1, line: 49, type: !10)
!173 = !DILocation(line: 51, column: 22, scope: !165)
!174 = !DILocalVariable(name: "accu", scope: !165, file: !1, line: 51, type: !79)
!175 = !DILocation(line: 52, column: 17, scope: !165)
!176 = !DILocalVariable(name: "bits", scope: !165, file: !1, line: 52, type: !22)
!177 = !DILocalVariable(name: "i", scope: !165, file: !1, line: 53, type: !22)
!178 = !DILocation(line: 55, column: 15, scope: !165)
!179 = !DILocation(line: 55, column: 6, scope: !165)
!180 = !DILocation(line: 56, column: 8, scope: !165)
!181 = !DILocation(line: 58, column: 2, scope: !165)
!182 = !DILocation(line: 59, column: 3, scope: !183)
!183 = distinct !DILexicalBlock(scope: !165, file: !1, line: 58, column: 17)
!184 = !DILocation(line: 59, column: 10, scope: !183)
!185 = !DILocation(line: 59, column: 15, scope: !183)
!186 = !DILocation(line: 0, scope: !183)
!187 = !DILocation(line: 60, column: 15, scope: !188)
!188 = distinct !DILexicalBlock(scope: !183, file: !1, line: 59, column: 26)
!189 = !DILocalVariable(name: "mask", scope: !165, file: !1, line: 53, type: !22)
!190 = !DILocation(line: 61, column: 27, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !1, line: 61, column: 8)
!192 = !DILocation(line: 61, column: 18, scope: !191)
!193 = !DILocation(line: 61, column: 13, scope: !191)
!194 = !DILocation(line: 61, column: 8, scope: !188)
!195 = !DILocation(line: 61, column: 39, scope: !191)
!196 = !DILocation(line: 61, column: 34, scope: !191)
!197 = !DILocation(line: 62, column: 17, scope: !191)
!198 = !DILocation(line: 62, column: 14, scope: !191)
!199 = !DILocation(line: 64, column: 10, scope: !188)
!200 = !DILocation(line: 65, column: 8, scope: !188)
!201 = !DILocation(line: 67, column: 8, scope: !202)
!202 = distinct !DILexicalBlock(scope: !188, file: !1, line: 67, column: 8)
!203 = !DILocation(line: 67, column: 16, scope: !202)
!204 = !DILocation(line: 67, column: 8, scope: !188)
!205 = !DILocation(line: 69, column: 8, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !1, line: 67, column: 22)
!207 = !DILocation(line: 70, column: 4, scope: !206)
!208 = !DILocation(line: 0, scope: !202)
!209 = distinct !{!209, !182, !210}
!210 = !DILocation(line: 71, column: 3, scope: !183)
!211 = !DILocation(line: 72, column: 8, scope: !212)
!212 = distinct !DILexicalBlock(scope: !183, file: !1, line: 72, column: 7)
!213 = !DILocation(line: 72, column: 7, scope: !183)
!214 = !DILocation(line: 72, column: 16, scope: !212)
!215 = !DILocation(line: 73, column: 16, scope: !183)
!216 = !DILocation(line: 73, column: 34, scope: !183)
!217 = !DILocation(line: 73, column: 24, scope: !183)
!218 = !DILocation(line: 73, column: 22, scope: !183)
!219 = !DILocation(line: 74, column: 8, scope: !183)
!220 = distinct !{!220, !181, !221}
!221 = !DILocation(line: 75, column: 2, scope: !165)
!222 = !DILocation(line: 76, column: 13, scope: !165)
!223 = !DILocation(line: 52, column: 6, scope: !165)
!224 = !DILocation(line: 76, column: 6, scope: !165)
!225 = !DILocation(line: 76, column: 11, scope: !165)
!226 = !DILocation(line: 77, column: 6, scope: !165)
!227 = !DILocation(line: 77, column: 11, scope: !165)
!228 = !DILocation(line: 79, column: 9, scope: !165)
!229 = !DILocation(line: 79, column: 2, scope: !165)
!230 = distinct !DISubprogram(name: "b_detach", scope: !1, file: !1, line: 82, type: !231, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!231 = !DISubroutineType(types: !232)
!232 = !{null, !10}
!233 = !DILocalVariable(name: "bf", arg: 1, scope: !230, file: !1, line: 82, type: !10)
!234 = !DILocation(line: 0, scope: !230)
!235 = !DILocation(line: 84, column: 10, scope: !236)
!236 = distinct !DILexicalBlock(scope: !230, file: !1, line: 84, column: 6)
!237 = !DILocation(line: 84, column: 6, scope: !236)
!238 = !DILocation(line: 84, column: 6, scope: !230)
!239 = !DILocation(line: 85, column: 24, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !1, line: 84, column: 16)
!241 = !DILocation(line: 85, column: 18, scope: !240)
!242 = !DILocation(line: 85, column: 7, scope: !240)
!243 = !DILocation(line: 85, column: 12, scope: !240)
!244 = !DILocation(line: 86, column: 13, scope: !240)
!245 = !DILocation(line: 86, column: 23, scope: !240)
!246 = !DILocation(line: 86, column: 3, scope: !240)
!247 = !DILocation(line: 87, column: 2, scope: !240)
!248 = !DILocation(line: 88, column: 7, scope: !230)
!249 = !DILocation(line: 88, column: 2, scope: !230)
!250 = !DILocation(line: 89, column: 1, scope: !230)
!251 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 91, type: !252, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!252 = !DISubroutineType(types: !253)
!253 = !{!22}
!254 = !DILocalVariable(name: "s", scope: !251, file: !1, line: 93, type: !255)
!255 = !DICompositeType(tag: DW_TAG_array_type, baseType: !102, size: 96, elements: !256)
!256 = !{!257}
!257 = !DISubrange(count: 12)
!258 = !DILocation(line: 93, column: 16, scope: !251)
!259 = !DILocalVariable(name: "s2", scope: !251, file: !1, line: 94, type: !260)
!260 = !DICompositeType(tag: DW_TAG_array_type, baseType: !102, size: 88, elements: !261)
!261 = !{!262}
!262 = !DISubrange(count: 11)
!263 = !DILocation(line: 94, column: 16, scope: !251)
!264 = !DILocation(line: 97, column: 12, scope: !251)
!265 = !DILocalVariable(name: "f", scope: !251, file: !1, line: 97, type: !15)
!266 = !DILocation(line: 0, scope: !251)
!267 = !DILocation(line: 98, column: 17, scope: !251)
!268 = !DILocalVariable(name: "b", scope: !251, file: !1, line: 98, type: !10)
!269 = !DILocalVariable(name: "i", scope: !251, file: !1, line: 95, type: !22)
!270 = !DILocation(line: 100, column: 7, scope: !271)
!271 = distinct !DILexicalBlock(scope: !251, file: !1, line: 100, column: 2)
!272 = !DILocation(line: 0, scope: !271)
!273 = !DILocation(line: 100, column: 16, scope: !274)
!274 = distinct !DILexicalBlock(scope: !271, file: !1, line: 100, column: 2)
!275 = !DILocation(line: 100, column: 2, scope: !271)
!276 = !DILocation(line: 100, column: 35, scope: !274)
!277 = !DILocation(line: 100, column: 37, scope: !274)
!278 = !DILocation(line: 100, column: 27, scope: !274)
!279 = !DILocation(line: 100, column: 23, scope: !274)
!280 = !DILocation(line: 100, column: 2, scope: !274)
!281 = distinct !{!281, !275, !282}
!282 = !DILocation(line: 100, column: 49, scope: !271)
!283 = !DILocation(line: 101, column: 2, scope: !251)
!284 = !DILocation(line: 102, column: 2, scope: !251)
!285 = !DILocation(line: 105, column: 6, scope: !251)
!286 = !DILocation(line: 106, column: 6, scope: !251)
!287 = !DILocation(line: 107, column: 7, scope: !288)
!288 = distinct !DILexicalBlock(scope: !251, file: !1, line: 107, column: 2)
!289 = !DILocation(line: 0, scope: !288)
!290 = !DILocation(line: 107, column: 16, scope: !291)
!291 = distinct !DILexicalBlock(scope: !288, file: !1, line: 107, column: 2)
!292 = !DILocation(line: 107, column: 2, scope: !288)
!293 = !DILocation(line: 107, column: 34, scope: !291)
!294 = !DILocation(line: 107, column: 37, scope: !291)
!295 = !DILocation(line: 107, column: 27, scope: !291)
!296 = !DILocation(line: 107, column: 23, scope: !291)
!297 = !DILocation(line: 107, column: 2, scope: !291)
!298 = distinct !{!298, !292, !299}
!299 = !DILocation(line: 107, column: 49, scope: !288)
!300 = !DILocation(line: 108, column: 2, scope: !251)
!301 = !DILocation(line: 109, column: 2, scope: !251)
!302 = !DILocation(line: 111, column: 19, scope: !251)
!303 = !DILocation(line: 111, column: 2, scope: !251)
!304 = !DILocation(line: 113, column: 2, scope: !251)
