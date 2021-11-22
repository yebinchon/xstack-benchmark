; ModuleID = 'balanced-ternary.c'
source_filename = "balanced-ternary.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@to_bt.d = internal global [3 x i8] c"0+-", align 1, !dbg !0
@to_bt.v = internal global [3 x i32] [i32 0, i32 1, i32 -1], align 4, !dbg !14
@__const.mult.r = private unnamed_addr constant [16 x i8] c"0\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"+-0++0+\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"+-++-\00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c"      a: %14s %10d\0A\00", align 1
@.str.4 = private unnamed_addr constant [20 x i8] c"      b: %14s %10d\0A\00", align 1
@.str.5 = private unnamed_addr constant [20 x i8] c"      c: %14s %10d\0A\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"a*(b-c): %14s %10d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @reverse(i8* %p) #0 !dbg !24 {
entry:
  %p.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  %r = alloca i8*, align 8
  store i8* %p, i8** %p.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %p.addr, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %len, metadata !29, metadata !DIExpression()), !dbg !33
  %0 = load i8*, i8** %p.addr, align 8, !dbg !34
  %call = call i64 @strlen(i8* %0) #6, !dbg !35
  store i64 %call, i64* %len, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i8** %r, metadata !36, metadata !DIExpression()), !dbg !37
  %1 = load i8*, i8** %p.addr, align 8, !dbg !38
  %2 = load i64, i64* %len, align 8, !dbg !39
  %add.ptr = getelementptr inbounds i8, i8* %1, i64 %2, !dbg !40
  %add.ptr1 = getelementptr inbounds i8, i8* %add.ptr, i64 -1, !dbg !41
  store i8* %add.ptr1, i8** %r, align 8, !dbg !37
  br label %while.cond, !dbg !42

while.cond:                                       ; preds = %while.body, %entry
  %3 = load i8*, i8** %p.addr, align 8, !dbg !43
  %4 = load i8*, i8** %r, align 8, !dbg !44
  %cmp = icmp ult i8* %3, %4, !dbg !45
  br i1 %cmp, label %while.body, label %while.end, !dbg !42

while.body:                                       ; preds = %while.cond
  %5 = load i8*, i8** %r, align 8, !dbg !46
  %6 = load i8, i8* %5, align 1, !dbg !48
  %conv = sext i8 %6 to i32, !dbg !48
  %7 = load i8*, i8** %p.addr, align 8, !dbg !49
  %8 = load i8, i8* %7, align 1, !dbg !50
  %conv2 = sext i8 %8 to i32, !dbg !50
  %xor = xor i32 %conv2, %conv, !dbg !50
  %conv3 = trunc i32 %xor to i8, !dbg !50
  store i8 %conv3, i8* %7, align 1, !dbg !50
  %9 = load i8*, i8** %p.addr, align 8, !dbg !51
  %10 = load i8, i8* %9, align 1, !dbg !52
  %conv4 = sext i8 %10 to i32, !dbg !52
  %11 = load i8*, i8** %r, align 8, !dbg !53
  %12 = load i8, i8* %11, align 1, !dbg !54
  %conv5 = sext i8 %12 to i32, !dbg !54
  %xor6 = xor i32 %conv5, %conv4, !dbg !54
  %conv7 = trunc i32 %xor6 to i8, !dbg !54
  store i8 %conv7, i8* %11, align 1, !dbg !54
  %13 = load i8*, i8** %r, align 8, !dbg !55
  %incdec.ptr = getelementptr inbounds i8, i8* %13, i32 -1, !dbg !55
  store i8* %incdec.ptr, i8** %r, align 8, !dbg !55
  %14 = load i8, i8* %13, align 1, !dbg !56
  %conv8 = sext i8 %14 to i32, !dbg !56
  %15 = load i8*, i8** %p.addr, align 8, !dbg !57
  %incdec.ptr9 = getelementptr inbounds i8, i8* %15, i32 1, !dbg !57
  store i8* %incdec.ptr9, i8** %p.addr, align 8, !dbg !57
  %16 = load i8, i8* %15, align 1, !dbg !58
  %conv10 = sext i8 %16 to i32, !dbg !58
  %xor11 = xor i32 %conv10, %conv8, !dbg !58
  %conv12 = trunc i32 %xor11 to i8, !dbg !58
  store i8 %conv12, i8* %15, align 1, !dbg !58
  br label %while.cond, !dbg !42, !llvm.loop !59

while.end:                                        ; preds = %while.cond
  ret void, !dbg !61
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @to_bt(i32 %n, i8* %b) #0 !dbg !2 {
entry:
  %n.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ptr = alloca i8*, align 8
  %r = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8* %b, i8** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b.addr, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load i8*, i8** %b.addr, align 8, !dbg !68
  store i8* %0, i8** %ptr, align 8, !dbg !67
  %1 = load i8*, i8** %ptr, align 8, !dbg !69
  store i8 0, i8* %1, align 1, !dbg !70
  br label %while.cond, !dbg !71

while.cond:                                       ; preds = %if.end, %entry
  %2 = load i32, i32* %n.addr, align 4, !dbg !72
  %tobool = icmp ne i32 %2, 0, !dbg !71
  br i1 %tobool, label %while.body, label %while.end, !dbg !71

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata i32* %r, metadata !73, metadata !DIExpression()), !dbg !75
  %3 = load i32, i32* %n.addr, align 4, !dbg !76
  %rem = srem i32 %3, 3, !dbg !77
  store i32 %rem, i32* %r, align 4, !dbg !75
  %4 = load i32, i32* %r, align 4, !dbg !78
  %cmp = icmp slt i32 %4, 0, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81, !cf.info !82

if.then:                                          ; preds = %while.body
  %5 = load i32, i32* %r, align 4, !dbg !83
  %add = add nsw i32 %5, 3, !dbg !83
  store i32 %add, i32* %r, align 4, !dbg !83
  br label %if.end, !dbg !85

if.end:                                           ; preds = %if.then, %while.body
  %6 = load i32, i32* %r, align 4, !dbg !86
  %idxprom = sext i32 %6 to i64, !dbg !87
  %arrayidx = getelementptr inbounds [3 x i8], [3 x i8]* @to_bt.d, i64 0, i64 %idxprom, !dbg !87
  %7 = load i8, i8* %arrayidx, align 1, !dbg !87
  %8 = load i8*, i8** %ptr, align 8, !dbg !88
  store i8 %7, i8* %8, align 1, !dbg !89
  %9 = load i8*, i8** %ptr, align 8, !dbg !90
  %incdec.ptr = getelementptr inbounds i8, i8* %9, i32 1, !dbg !90
  store i8* %incdec.ptr, i8** %ptr, align 8, !dbg !90
  store i8 0, i8* %incdec.ptr, align 1, !dbg !91
  %10 = load i32, i32* %r, align 4, !dbg !92
  %idxprom1 = sext i32 %10 to i64, !dbg !93
  %arrayidx2 = getelementptr inbounds [3 x i32], [3 x i32]* @to_bt.v, i64 0, i64 %idxprom1, !dbg !93
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !93
  %12 = load i32, i32* %n.addr, align 4, !dbg !94
  %sub = sub nsw i32 %12, %11, !dbg !94
  store i32 %sub, i32* %n.addr, align 4, !dbg !94
  %13 = load i32, i32* %n.addr, align 4, !dbg !95
  %div = sdiv i32 %13, 3, !dbg !95
  store i32 %div, i32* %n.addr, align 4, !dbg !95
  br label %while.cond, !dbg !71, !llvm.loop !96

while.end:                                        ; preds = %while.cond
  %14 = load i8*, i8** %b.addr, align 8, !dbg !98
  call void @reverse(i8* %14), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @from_bt(i8* %a) #0 !dbg !101 {
entry:
  %a.addr = alloca i8*, align 8
  %n = alloca i32, align 4
  store i8* %a, i8** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a.addr, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i32* %n, metadata !108, metadata !DIExpression()), !dbg !109
  store i32 0, i32* %n, align 4, !dbg !109
  br label %while.cond, !dbg !110

while.cond:                                       ; preds = %if.end9, %entry
  %0 = load i8*, i8** %a.addr, align 8, !dbg !111
  %1 = load i8, i8* %0, align 1, !dbg !112
  %conv = sext i8 %1 to i32, !dbg !112
  %cmp = icmp ne i32 %conv, 0, !dbg !113
  br i1 %cmp, label %while.body, label %while.end, !dbg !110

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %n, align 4, !dbg !114
  %mul = mul nsw i32 %2, 3, !dbg !114
  store i32 %mul, i32* %n, align 4, !dbg !114
  %3 = load i8*, i8** %a.addr, align 8, !dbg !116
  %4 = load i8, i8* %3, align 1, !dbg !118
  %conv2 = sext i8 %4 to i32, !dbg !118
  %cmp3 = icmp eq i32 %conv2, 43, !dbg !119
  br i1 %cmp3, label %if.then, label %if.else, !dbg !120, !cf.info !82

if.then:                                          ; preds = %while.body
  %5 = load i32, i32* %n, align 4, !dbg !121
  %inc = add nsw i32 %5, 1, !dbg !121
  store i32 %inc, i32* %n, align 4, !dbg !121
  br label %if.end9, !dbg !123

if.else:                                          ; preds = %while.body
  %6 = load i8*, i8** %a.addr, align 8, !dbg !124
  %7 = load i8, i8* %6, align 1, !dbg !126
  %conv5 = sext i8 %7 to i32, !dbg !126
  %cmp6 = icmp eq i32 %conv5, 45, !dbg !127
  br i1 %cmp6, label %if.then8, label %if.end, !dbg !128, !cf.info !82

if.then8:                                         ; preds = %if.else
  %8 = load i32, i32* %n, align 4, !dbg !129
  %dec = add nsw i32 %8, -1, !dbg !129
  store i32 %dec, i32* %n, align 4, !dbg !129
  br label %if.end, !dbg !131

if.end:                                           ; preds = %if.then8, %if.else
  br label %if.end9

if.end9:                                          ; preds = %if.end, %if.then
  %9 = load i8*, i8** %a.addr, align 8, !dbg !132
  %incdec.ptr = getelementptr inbounds i8, i8* %9, i32 1, !dbg !132
  store i8* %incdec.ptr, i8** %a.addr, align 8, !dbg !132
  br label %while.cond, !dbg !110, !llvm.loop !133

while.end:                                        ; preds = %while.cond
  %10 = load i32, i32* %n, align 4, !dbg !135
  ret i32 %10, !dbg !136
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @last_char(i8* %ptr) #0 !dbg !137 {
entry:
  %retval = alloca i8, align 1
  %ptr.addr = alloca i8*, align 8
  %c = alloca i8, align 1
  store i8* %ptr, i8** %ptr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %ptr.addr, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i8* %c, metadata !142, metadata !DIExpression()), !dbg !143
  %0 = load i8*, i8** %ptr.addr, align 8, !dbg !144
  %cmp = icmp eq i8* %0, null, !dbg !146
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !147, !cf.info !82

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %ptr.addr, align 8, !dbg !148
  %2 = load i8, i8* %1, align 1, !dbg !149
  %conv = sext i8 %2 to i32, !dbg !149
  %cmp1 = icmp eq i32 %conv, 0, !dbg !150
  br i1 %cmp1, label %if.then, label %if.end, !dbg !151, !cf.info !82

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 0, i8* %retval, align 1, !dbg !152
  br label %return, !dbg !152

if.end:                                           ; preds = %lor.lhs.false
  br label %while.cond, !dbg !154

while.cond:                                       ; preds = %while.body, %if.end
  %3 = load i8*, i8** %ptr.addr, align 8, !dbg !155
  %4 = load i8, i8* %3, align 1, !dbg !156
  %conv3 = sext i8 %4 to i32, !dbg !156
  %cmp4 = icmp ne i32 %conv3, 0, !dbg !157
  br i1 %cmp4, label %while.body, label %while.end, !dbg !154

while.body:                                       ; preds = %while.cond
  %5 = load i8*, i8** %ptr.addr, align 8, !dbg !158
  %incdec.ptr = getelementptr inbounds i8, i8* %5, i32 1, !dbg !158
  store i8* %incdec.ptr, i8** %ptr.addr, align 8, !dbg !158
  br label %while.cond, !dbg !154, !llvm.loop !160

while.end:                                        ; preds = %while.cond
  %6 = load i8*, i8** %ptr.addr, align 8, !dbg !162
  %incdec.ptr6 = getelementptr inbounds i8, i8* %6, i32 -1, !dbg !162
  store i8* %incdec.ptr6, i8** %ptr.addr, align 8, !dbg !162
  %7 = load i8*, i8** %ptr.addr, align 8, !dbg !163
  %8 = load i8, i8* %7, align 1, !dbg !164
  store i8 %8, i8* %c, align 1, !dbg !165
  %9 = load i8*, i8** %ptr.addr, align 8, !dbg !166
  store i8 0, i8* %9, align 1, !dbg !167
  %10 = load i8, i8* %c, align 1, !dbg !168
  store i8 %10, i8* %retval, align 1, !dbg !169
  br label %return, !dbg !169

return:                                           ; preds = %while.end, %if.then
  %11 = load i8, i8* %retval, align 1, !dbg !170
  ret i8 %11, !dbg !170
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @add(i8* %b1, i8* %b2, i8* %out) #0 !dbg !171 {
entry:
  %b1.addr = alloca i8*, align 8
  %b2.addr = alloca i8*, align 8
  %out.addr = alloca i8*, align 8
  %c1 = alloca [16 x i8], align 16
  %c2 = alloca [16 x i8], align 16
  %ob1 = alloca [16 x i8], align 16
  %ob2 = alloca [16 x i8], align 16
  %d = alloca [3 x i8], align 1
  %L1 = alloca i8, align 1
  %L2 = alloca i8, align 1
  store i8* %b1, i8** %b1.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b1.addr, metadata !174, metadata !DIExpression()), !dbg !175
  store i8* %b2, i8** %b2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b2.addr, metadata !176, metadata !DIExpression()), !dbg !177
  store i8* %out, i8** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %out.addr, metadata !178, metadata !DIExpression()), !dbg !179
  %0 = load i8*, i8** %b1.addr, align 8, !dbg !180
  %1 = load i8, i8* %0, align 1, !dbg !182
  %conv = sext i8 %1 to i32, !dbg !182
  %cmp = icmp ne i32 %conv, 0, !dbg !183
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !184, !cf.info !82

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %b2.addr, align 8, !dbg !185
  %3 = load i8, i8* %2, align 1, !dbg !186
  %conv2 = sext i8 %3 to i32, !dbg !186
  %cmp3 = icmp ne i32 %conv2, 0, !dbg !187
  br i1 %cmp3, label %if.then, label %if.else, !dbg !188, !cf.info !82

if.then:                                          ; preds = %land.lhs.true
  call void @llvm.dbg.declare(metadata [16 x i8]* %c1, metadata !189, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.declare(metadata [16 x i8]* %c2, metadata !195, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata [16 x i8]* %ob1, metadata !197, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata [16 x i8]* %ob2, metadata !199, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata [3 x i8]* %d, metadata !201, metadata !DIExpression()), !dbg !202
  %4 = bitcast [3 x i8]* %d to i8*, !dbg !202
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 0, i64 3, i1 false), !dbg !202
  call void @llvm.dbg.declare(metadata i8* %L1, metadata !203, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.declare(metadata i8* %L2, metadata !205, metadata !DIExpression()), !dbg !206
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !207
  %5 = load i8*, i8** %b1.addr, align 8, !dbg !208
  %call = call i8* @strcpy(i8* %arraydecay, i8* %5) #7, !dbg !209
  %arraydecay5 = getelementptr inbounds [16 x i8], [16 x i8]* %c2, i64 0, i64 0, !dbg !210
  %6 = load i8*, i8** %b2.addr, align 8, !dbg !211
  %call6 = call i8* @strcpy(i8* %arraydecay5, i8* %6) #7, !dbg !212
  %arraydecay7 = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !213
  %call8 = call signext i8 @last_char(i8* %arraydecay7), !dbg !214
  store i8 %call8, i8* %L1, align 1, !dbg !215
  %arraydecay9 = getelementptr inbounds [16 x i8], [16 x i8]* %c2, i64 0, i64 0, !dbg !216
  %call10 = call signext i8 @last_char(i8* %arraydecay9), !dbg !217
  store i8 %call10, i8* %L2, align 1, !dbg !218
  %7 = load i8, i8* %L2, align 1, !dbg !219
  %conv11 = sext i8 %7 to i32, !dbg !219
  %8 = load i8, i8* %L1, align 1, !dbg !221
  %conv12 = sext i8 %8 to i32, !dbg !221
  %cmp13 = icmp slt i32 %conv11, %conv12, !dbg !222
  br i1 %cmp13, label %if.then15, label %if.end, !dbg !223, !cf.info !82

if.then15:                                        ; preds = %if.then
  %9 = load i8, i8* %L1, align 1, !dbg !224
  %conv16 = sext i8 %9 to i32, !dbg !224
  %10 = load i8, i8* %L2, align 1, !dbg !226
  %conv17 = sext i8 %10 to i32, !dbg !226
  %xor = xor i32 %conv17, %conv16, !dbg !226
  %conv18 = trunc i32 %xor to i8, !dbg !226
  store i8 %conv18, i8* %L2, align 1, !dbg !226
  %11 = load i8, i8* %L2, align 1, !dbg !227
  %conv19 = sext i8 %11 to i32, !dbg !227
  %12 = load i8, i8* %L1, align 1, !dbg !228
  %conv20 = sext i8 %12 to i32, !dbg !228
  %xor21 = xor i32 %conv20, %conv19, !dbg !228
  %conv22 = trunc i32 %xor21 to i8, !dbg !228
  store i8 %conv22, i8* %L1, align 1, !dbg !228
  %13 = load i8, i8* %L1, align 1, !dbg !229
  %conv23 = sext i8 %13 to i32, !dbg !229
  %14 = load i8, i8* %L2, align 1, !dbg !230
  %conv24 = sext i8 %14 to i32, !dbg !230
  %xor25 = xor i32 %conv24, %conv23, !dbg !230
  %conv26 = trunc i32 %xor25 to i8, !dbg !230
  store i8 %conv26, i8* %L2, align 1, !dbg !230
  br label %if.end, !dbg !231

if.end:                                           ; preds = %if.then15, %if.then
  %15 = load i8, i8* %L1, align 1, !dbg !232
  %conv27 = sext i8 %15 to i32, !dbg !232
  %cmp28 = icmp eq i32 %conv27, 45, !dbg !234
  br i1 %cmp28, label %if.then30, label %if.end43, !dbg !235, !cf.info !82

if.then30:                                        ; preds = %if.end
  %16 = load i8, i8* %L2, align 1, !dbg !236
  %conv31 = sext i8 %16 to i32, !dbg !236
  %cmp32 = icmp eq i32 %conv31, 48, !dbg !239
  br i1 %cmp32, label %if.then34, label %if.end35, !dbg !240, !cf.info !82

if.then34:                                        ; preds = %if.then30
  %arrayidx = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !241
  store i8 45, i8* %arrayidx, align 1, !dbg !243
  br label %if.end35, !dbg !244

if.end35:                                         ; preds = %if.then34, %if.then30
  %17 = load i8, i8* %L2, align 1, !dbg !245
  %conv36 = sext i8 %17 to i32, !dbg !245
  %cmp37 = icmp eq i32 %conv36, 45, !dbg !247
  br i1 %cmp37, label %if.then39, label %if.end42, !dbg !248, !cf.info !82

if.then39:                                        ; preds = %if.end35
  %arrayidx40 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !249
  store i8 43, i8* %arrayidx40, align 1, !dbg !251
  %arrayidx41 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 1, !dbg !252
  store i8 45, i8* %arrayidx41, align 1, !dbg !253
  br label %if.end42, !dbg !254

if.end42:                                         ; preds = %if.then39, %if.end35
  br label %if.end43, !dbg !255

if.end43:                                         ; preds = %if.end42, %if.end
  %18 = load i8, i8* %L1, align 1, !dbg !256
  %conv44 = sext i8 %18 to i32, !dbg !256
  %cmp45 = icmp eq i32 %conv44, 43, !dbg !258
  br i1 %cmp45, label %if.then47, label %if.end67, !dbg !259, !cf.info !82

if.then47:                                        ; preds = %if.end43
  %19 = load i8, i8* %L2, align 1, !dbg !260
  %conv48 = sext i8 %19 to i32, !dbg !260
  %cmp49 = icmp eq i32 %conv48, 48, !dbg !263
  br i1 %cmp49, label %if.then51, label %if.end53, !dbg !264, !cf.info !82

if.then51:                                        ; preds = %if.then47
  %arrayidx52 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !265
  store i8 43, i8* %arrayidx52, align 1, !dbg !267
  br label %if.end53, !dbg !268

if.end53:                                         ; preds = %if.then51, %if.then47
  %20 = load i8, i8* %L2, align 1, !dbg !269
  %conv54 = sext i8 %20 to i32, !dbg !269
  %cmp55 = icmp eq i32 %conv54, 45, !dbg !271
  br i1 %cmp55, label %if.then57, label %if.end59, !dbg !272, !cf.info !82

if.then57:                                        ; preds = %if.end53
  %arrayidx58 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !273
  store i8 48, i8* %arrayidx58, align 1, !dbg !275
  br label %if.end59, !dbg !276

if.end59:                                         ; preds = %if.then57, %if.end53
  %21 = load i8, i8* %L2, align 1, !dbg !277
  %conv60 = sext i8 %21 to i32, !dbg !277
  %cmp61 = icmp eq i32 %conv60, 43, !dbg !279
  br i1 %cmp61, label %if.then63, label %if.end66, !dbg !280, !cf.info !82

if.then63:                                        ; preds = %if.end59
  %arrayidx64 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !281
  store i8 45, i8* %arrayidx64, align 1, !dbg !283
  %arrayidx65 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 1, !dbg !284
  store i8 43, i8* %arrayidx65, align 1, !dbg !285
  br label %if.end66, !dbg !286

if.end66:                                         ; preds = %if.then63, %if.end59
  br label %if.end67, !dbg !287

if.end67:                                         ; preds = %if.end66, %if.end43
  %22 = load i8, i8* %L1, align 1, !dbg !288
  %conv68 = sext i8 %22 to i32, !dbg !288
  %cmp69 = icmp eq i32 %conv68, 48, !dbg !290
  br i1 %cmp69, label %if.then71, label %if.end78, !dbg !291, !cf.info !82

if.then71:                                        ; preds = %if.end67
  %23 = load i8, i8* %L2, align 1, !dbg !292
  %conv72 = sext i8 %23 to i32, !dbg !292
  %cmp73 = icmp eq i32 %conv72, 48, !dbg !295
  br i1 %cmp73, label %if.then75, label %if.end77, !dbg !296, !cf.info !82

if.then75:                                        ; preds = %if.then71
  %arrayidx76 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !297
  store i8 48, i8* %arrayidx76, align 1, !dbg !299
  br label %if.end77, !dbg !300

if.end77:                                         ; preds = %if.then75, %if.then71
  br label %if.end78, !dbg !301

if.end78:                                         ; preds = %if.end77, %if.end67
  %arraydecay79 = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !302
  %arrayidx80 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 1, !dbg !303
  %arraydecay81 = getelementptr inbounds [16 x i8], [16 x i8]* %ob1, i64 0, i64 0, !dbg !304
  call void @add(i8* %arraydecay79, i8* %arrayidx80, i8* %arraydecay81), !dbg !305
  %arraydecay82 = getelementptr inbounds [16 x i8], [16 x i8]* %ob1, i64 0, i64 0, !dbg !306
  %arraydecay83 = getelementptr inbounds [16 x i8], [16 x i8]* %c2, i64 0, i64 0, !dbg !307
  %arraydecay84 = getelementptr inbounds [16 x i8], [16 x i8]* %ob2, i64 0, i64 0, !dbg !308
  call void @add(i8* %arraydecay82, i8* %arraydecay83, i8* %arraydecay84), !dbg !309
  %24 = load i8*, i8** %out.addr, align 8, !dbg !310
  %arraydecay85 = getelementptr inbounds [16 x i8], [16 x i8]* %ob2, i64 0, i64 0, !dbg !311
  %call86 = call i8* @strcpy(i8* %24, i8* %arraydecay85) #7, !dbg !312
  %arrayidx87 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 1, !dbg !313
  store i8 0, i8* %arrayidx87, align 1, !dbg !314
  %25 = load i8*, i8** %out.addr, align 8, !dbg !315
  %arraydecay88 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !316
  %call89 = call i8* @strcat(i8* %25, i8* %arraydecay88) #7, !dbg !317
  br label %if.end104, !dbg !318

if.else:                                          ; preds = %land.lhs.true, %entry
  %26 = load i8*, i8** %b1.addr, align 8, !dbg !319
  %27 = load i8, i8* %26, align 1, !dbg !321
  %conv90 = sext i8 %27 to i32, !dbg !321
  %cmp91 = icmp ne i32 %conv90, 0, !dbg !322
  br i1 %cmp91, label %if.then93, label %if.else95, !dbg !323, !cf.info !82

if.then93:                                        ; preds = %if.else
  %28 = load i8*, i8** %out.addr, align 8, !dbg !324
  %29 = load i8*, i8** %b1.addr, align 8, !dbg !326
  %call94 = call i8* @strcpy(i8* %28, i8* %29) #7, !dbg !327
  br label %if.end103, !dbg !328

if.else95:                                        ; preds = %if.else
  %30 = load i8*, i8** %b2.addr, align 8, !dbg !329
  %31 = load i8, i8* %30, align 1, !dbg !331
  %conv96 = sext i8 %31 to i32, !dbg !331
  %cmp97 = icmp ne i32 %conv96, 0, !dbg !332
  br i1 %cmp97, label %if.then99, label %if.else101, !dbg !333, !cf.info !82

if.then99:                                        ; preds = %if.else95
  %32 = load i8*, i8** %out.addr, align 8, !dbg !334
  %33 = load i8*, i8** %b2.addr, align 8, !dbg !336
  %call100 = call i8* @strcpy(i8* %32, i8* %33) #7, !dbg !337
  br label %if.end102, !dbg !338

if.else101:                                       ; preds = %if.else95
  %34 = load i8*, i8** %out.addr, align 8, !dbg !339
  store i8 0, i8* %34, align 1, !dbg !341
  br label %if.end102

if.end102:                                        ; preds = %if.else101, %if.then99
  br label %if.end103

if.end103:                                        ; preds = %if.end102, %if.then93
  br label %if.end104

if.end104:                                        ; preds = %if.end103, %if.end78
  ret void, !dbg !342
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @unary_minus(i8* %b, i8* %out) #0 !dbg !343 {
entry:
  %b.addr = alloca i8*, align 8
  %out.addr = alloca i8*, align 8
  store i8* %b, i8** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b.addr, metadata !346, metadata !DIExpression()), !dbg !347
  store i8* %out, i8** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %out.addr, metadata !348, metadata !DIExpression()), !dbg !349
  br label %while.cond, !dbg !350

while.cond:                                       ; preds = %if.end15, %entry
  %0 = load i8*, i8** %b.addr, align 8, !dbg !351
  %1 = load i8, i8* %0, align 1, !dbg !352
  %conv = sext i8 %1 to i32, !dbg !352
  %cmp = icmp ne i32 %conv, 0, !dbg !353
  br i1 %cmp, label %while.body, label %while.end, !dbg !350

while.body:                                       ; preds = %while.cond
  %2 = load i8*, i8** %b.addr, align 8, !dbg !354
  %3 = load i8, i8* %2, align 1, !dbg !357
  %conv2 = sext i8 %3 to i32, !dbg !357
  %cmp3 = icmp eq i32 %conv2, 45, !dbg !358
  br i1 %cmp3, label %if.then, label %if.else, !dbg !359, !cf.info !82

if.then:                                          ; preds = %while.body
  %4 = load i8*, i8** %out.addr, align 8, !dbg !360
  %incdec.ptr = getelementptr inbounds i8, i8* %4, i32 1, !dbg !360
  store i8* %incdec.ptr, i8** %out.addr, align 8, !dbg !360
  store i8 43, i8* %4, align 1, !dbg !362
  %5 = load i8*, i8** %b.addr, align 8, !dbg !363
  %incdec.ptr5 = getelementptr inbounds i8, i8* %5, i32 1, !dbg !363
  store i8* %incdec.ptr5, i8** %b.addr, align 8, !dbg !363
  br label %if.end15, !dbg !364

if.else:                                          ; preds = %while.body
  %6 = load i8*, i8** %b.addr, align 8, !dbg !365
  %7 = load i8, i8* %6, align 1, !dbg !367
  %conv6 = sext i8 %7 to i32, !dbg !367
  %cmp7 = icmp eq i32 %conv6, 43, !dbg !368
  br i1 %cmp7, label %if.then9, label %if.else12, !dbg !369, !cf.info !82

if.then9:                                         ; preds = %if.else
  %8 = load i8*, i8** %out.addr, align 8, !dbg !370
  %incdec.ptr10 = getelementptr inbounds i8, i8* %8, i32 1, !dbg !370
  store i8* %incdec.ptr10, i8** %out.addr, align 8, !dbg !370
  store i8 45, i8* %8, align 1, !dbg !372
  %9 = load i8*, i8** %b.addr, align 8, !dbg !373
  %incdec.ptr11 = getelementptr inbounds i8, i8* %9, i32 1, !dbg !373
  store i8* %incdec.ptr11, i8** %b.addr, align 8, !dbg !373
  br label %if.end, !dbg !374

if.else12:                                        ; preds = %if.else
  %10 = load i8*, i8** %b.addr, align 8, !dbg !375
  %incdec.ptr13 = getelementptr inbounds i8, i8* %10, i32 1, !dbg !375
  store i8* %incdec.ptr13, i8** %b.addr, align 8, !dbg !375
  %11 = load i8, i8* %10, align 1, !dbg !377
  %12 = load i8*, i8** %out.addr, align 8, !dbg !378
  %incdec.ptr14 = getelementptr inbounds i8, i8* %12, i32 1, !dbg !378
  store i8* %incdec.ptr14, i8** %out.addr, align 8, !dbg !378
  store i8 %11, i8* %12, align 1, !dbg !379
  br label %if.end

if.end:                                           ; preds = %if.else12, %if.then9
  br label %if.end15

if.end15:                                         ; preds = %if.end, %if.then
  br label %while.cond, !dbg !350, !llvm.loop !380

while.end:                                        ; preds = %while.cond
  %13 = load i8*, i8** %out.addr, align 8, !dbg !382
  store i8 0, i8* %13, align 1, !dbg !383
  ret void, !dbg !384
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @subtract(i8* %b1, i8* %b2, i8* %out) #0 !dbg !385 {
entry:
  %b1.addr = alloca i8*, align 8
  %b2.addr = alloca i8*, align 8
  %out.addr = alloca i8*, align 8
  %buf = alloca [16 x i8], align 16
  store i8* %b1, i8** %b1.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b1.addr, metadata !386, metadata !DIExpression()), !dbg !387
  store i8* %b2, i8** %b2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b2.addr, metadata !388, metadata !DIExpression()), !dbg !389
  store i8* %out, i8** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %out.addr, metadata !390, metadata !DIExpression()), !dbg !391
  call void @llvm.dbg.declare(metadata [16 x i8]* %buf, metadata !392, metadata !DIExpression()), !dbg !393
  %0 = load i8*, i8** %b2.addr, align 8, !dbg !394
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !395
  call void @unary_minus(i8* %0, i8* %arraydecay), !dbg !396
  %1 = load i8*, i8** %b1.addr, align 8, !dbg !397
  %arraydecay1 = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !398
  %2 = load i8*, i8** %out.addr, align 8, !dbg !399
  call void @add(i8* %1, i8* %arraydecay1, i8* %2), !dbg !400
  ret void, !dbg !401
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @mult(i8* %b1, i8* %b2, i8* %out) #0 !dbg !402 {
entry:
  %b1.addr = alloca i8*, align 8
  %b2.addr = alloca i8*, align 8
  %out.addr = alloca i8*, align 8
  %r = alloca [16 x i8], align 16
  %t = alloca [16 x i8], align 16
  %c1 = alloca [16 x i8], align 16
  %c2 = alloca [16 x i8], align 16
  %ptr = alloca i8*, align 8
  store i8* %b1, i8** %b1.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b1.addr, metadata !403, metadata !DIExpression()), !dbg !404
  store i8* %b2, i8** %b2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b2.addr, metadata !405, metadata !DIExpression()), !dbg !406
  store i8* %out, i8** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %out.addr, metadata !407, metadata !DIExpression()), !dbg !408
  call void @llvm.dbg.declare(metadata [16 x i8]* %r, metadata !409, metadata !DIExpression()), !dbg !410
  %0 = bitcast [16 x i8]* %r to i8*, !dbg !410
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 getelementptr inbounds ([16 x i8], [16 x i8]* @__const.mult.r, i32 0, i32 0), i64 16, i1 false), !dbg !410
  call void @llvm.dbg.declare(metadata [16 x i8]* %t, metadata !411, metadata !DIExpression()), !dbg !412
  call void @llvm.dbg.declare(metadata [16 x i8]* %c1, metadata !413, metadata !DIExpression()), !dbg !414
  call void @llvm.dbg.declare(metadata [16 x i8]* %c2, metadata !415, metadata !DIExpression()), !dbg !416
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !417, metadata !DIExpression()), !dbg !418
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %c2, i64 0, i64 0, !dbg !419
  store i8* %arraydecay, i8** %ptr, align 8, !dbg !418
  %arraydecay1 = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !420
  %1 = load i8*, i8** %b1.addr, align 8, !dbg !421
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %1) #7, !dbg !422
  %arraydecay2 = getelementptr inbounds [16 x i8], [16 x i8]* %c2, i64 0, i64 0, !dbg !423
  %2 = load i8*, i8** %b2.addr, align 8, !dbg !424
  %call3 = call i8* @strcpy(i8* %arraydecay2, i8* %2) #7, !dbg !425
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %c2, i64 0, i64 0, !dbg !426
  call void @reverse(i8* %arraydecay4), !dbg !427
  br label %while.cond, !dbg !428

while.cond:                                       ; preds = %if.end25, %entry
  %3 = load i8*, i8** %ptr, align 8, !dbg !429
  %4 = load i8, i8* %3, align 1, !dbg !430
  %conv = sext i8 %4 to i32, !dbg !430
  %cmp = icmp ne i32 %conv, 0, !dbg !431
  br i1 %cmp, label %while.body, label %while.end, !dbg !428

while.body:                                       ; preds = %while.cond
  %5 = load i8*, i8** %ptr, align 8, !dbg !432
  %6 = load i8, i8* %5, align 1, !dbg !435
  %conv6 = sext i8 %6 to i32, !dbg !435
  %cmp7 = icmp eq i32 %conv6, 43, !dbg !436
  br i1 %cmp7, label %if.then, label %if.end, !dbg !437, !cf.info !82

if.then:                                          ; preds = %while.body
  %arraydecay9 = getelementptr inbounds [16 x i8], [16 x i8]* %r, i64 0, i64 0, !dbg !438
  %arraydecay10 = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !440
  %arraydecay11 = getelementptr inbounds [16 x i8], [16 x i8]* %t, i64 0, i64 0, !dbg !441
  call void @add(i8* %arraydecay9, i8* %arraydecay10, i8* %arraydecay11), !dbg !442
  %arraydecay12 = getelementptr inbounds [16 x i8], [16 x i8]* %r, i64 0, i64 0, !dbg !443
  %arraydecay13 = getelementptr inbounds [16 x i8], [16 x i8]* %t, i64 0, i64 0, !dbg !444
  %call14 = call i8* @strcpy(i8* %arraydecay12, i8* %arraydecay13) #7, !dbg !445
  br label %if.end, !dbg !446

if.end:                                           ; preds = %if.then, %while.body
  %7 = load i8*, i8** %ptr, align 8, !dbg !447
  %8 = load i8, i8* %7, align 1, !dbg !449
  %conv15 = sext i8 %8 to i32, !dbg !449
  %cmp16 = icmp eq i32 %conv15, 45, !dbg !450
  br i1 %cmp16, label %if.then18, label %if.end25, !dbg !451, !cf.info !82

if.then18:                                        ; preds = %if.end
  %arraydecay19 = getelementptr inbounds [16 x i8], [16 x i8]* %r, i64 0, i64 0, !dbg !452
  %arraydecay20 = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !454
  %arraydecay21 = getelementptr inbounds [16 x i8], [16 x i8]* %t, i64 0, i64 0, !dbg !455
  call void @subtract(i8* %arraydecay19, i8* %arraydecay20, i8* %arraydecay21), !dbg !456
  %arraydecay22 = getelementptr inbounds [16 x i8], [16 x i8]* %r, i64 0, i64 0, !dbg !457
  %arraydecay23 = getelementptr inbounds [16 x i8], [16 x i8]* %t, i64 0, i64 0, !dbg !458
  %call24 = call i8* @strcpy(i8* %arraydecay22, i8* %arraydecay23) #7, !dbg !459
  br label %if.end25, !dbg !460

if.end25:                                         ; preds = %if.then18, %if.end
  %arraydecay26 = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !461
  %call27 = call i8* @strcat(i8* %arraydecay26, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)) #7, !dbg !462
  %9 = load i8*, i8** %ptr, align 8, !dbg !463
  %incdec.ptr = getelementptr inbounds i8, i8* %9, i32 1, !dbg !463
  store i8* %incdec.ptr, i8** %ptr, align 8, !dbg !463
  br label %while.cond, !dbg !428, !llvm.loop !464

while.end:                                        ; preds = %while.cond
  %arraydecay28 = getelementptr inbounds [16 x i8], [16 x i8]* %r, i64 0, i64 0, !dbg !466
  store i8* %arraydecay28, i8** %ptr, align 8, !dbg !467
  br label %while.cond29, !dbg !468

while.cond29:                                     ; preds = %while.body33, %while.end
  %10 = load i8*, i8** %ptr, align 8, !dbg !469
  %11 = load i8, i8* %10, align 1, !dbg !470
  %conv30 = sext i8 %11 to i32, !dbg !470
  %cmp31 = icmp eq i32 %conv30, 48, !dbg !471
  br i1 %cmp31, label %while.body33, label %while.end35, !dbg !468

while.body33:                                     ; preds = %while.cond29
  %12 = load i8*, i8** %ptr, align 8, !dbg !472
  %incdec.ptr34 = getelementptr inbounds i8, i8* %12, i32 1, !dbg !472
  store i8* %incdec.ptr34, i8** %ptr, align 8, !dbg !472
  br label %while.cond29, !dbg !468, !llvm.loop !474

while.end35:                                      ; preds = %while.cond29
  %13 = load i8*, i8** %out.addr, align 8, !dbg !476
  %14 = load i8*, i8** %ptr, align 8, !dbg !477
  %call36 = call i8* @strcpy(i8* %13, i8* %14) #7, !dbg !478
  ret void, !dbg !479
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !480 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i8*, align 8
  %b = alloca [16 x i8], align 16
  %c = alloca i8*, align 8
  %t = alloca [16 x i8], align 16
  %d = alloca [16 x i8], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i8** %a, metadata !483, metadata !DIExpression()), !dbg !484
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i8** %a, align 8, !dbg !484
  call void @llvm.dbg.declare(metadata [16 x i8]* %b, metadata !485, metadata !DIExpression()), !dbg !486
  call void @llvm.dbg.declare(metadata i8** %c, metadata !487, metadata !DIExpression()), !dbg !488
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8** %c, align 8, !dbg !488
  call void @llvm.dbg.declare(metadata [16 x i8]* %t, metadata !489, metadata !DIExpression()), !dbg !490
  call void @llvm.dbg.declare(metadata [16 x i8]* %d, metadata !491, metadata !DIExpression()), !dbg !492
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %b, i64 0, i64 0, !dbg !493
  call void @to_bt(i32 -436, i8* %arraydecay), !dbg !494
  %arraydecay1 = getelementptr inbounds [16 x i8], [16 x i8]* %b, i64 0, i64 0, !dbg !495
  %0 = load i8*, i8** %c, align 8, !dbg !496
  %arraydecay2 = getelementptr inbounds [16 x i8], [16 x i8]* %t, i64 0, i64 0, !dbg !497
  call void @subtract(i8* %arraydecay1, i8* %0, i8* %arraydecay2), !dbg !498
  %1 = load i8*, i8** %a, align 8, !dbg !499
  %arraydecay3 = getelementptr inbounds [16 x i8], [16 x i8]* %t, i64 0, i64 0, !dbg !500
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %d, i64 0, i64 0, !dbg !501
  call void @mult(i8* %1, i8* %arraydecay3, i8* %arraydecay4), !dbg !502
  %2 = load i8*, i8** %a, align 8, !dbg !503
  %3 = load i8*, i8** %a, align 8, !dbg !504
  %call = call i32 @from_bt(i8* %3), !dbg !505
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i64 0, i64 0), i8* %2, i32 %call), !dbg !506
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %b, i64 0, i64 0, !dbg !507
  %arraydecay7 = getelementptr inbounds [16 x i8], [16 x i8]* %b, i64 0, i64 0, !dbg !508
  %call8 = call i32 @from_bt(i8* %arraydecay7), !dbg !509
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i64 0, i64 0), i8* %arraydecay6, i32 %call8), !dbg !510
  %4 = load i8*, i8** %c, align 8, !dbg !511
  %5 = load i8*, i8** %c, align 8, !dbg !512
  %call10 = call i32 @from_bt(i8* %5), !dbg !513
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i64 0, i64 0), i8* %4, i32 %call10), !dbg !514
  %arraydecay12 = getelementptr inbounds [16 x i8], [16 x i8]* %d, i64 0, i64 0, !dbg !515
  %arraydecay13 = getelementptr inbounds [16 x i8], [16 x i8]* %d, i64 0, i64 0, !dbg !516
  %call14 = call i32 @from_bt(i8* %arraydecay13), !dbg !517
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6, i64 0, i64 0), i8* %arraydecay12, i32 %call14), !dbg !518
  ret i32 0, !dbg !519
}

declare dso_local i32 @printf(i8*, ...) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!9}
!llvm.module.flags = !{!20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "d", scope: !2, file: !3, line: 15, type: !19, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "to_bt", scope: !3, file: !3, line: 14, type: !4, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!3 = !DIFile(filename: "balanced-ternary.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Balanced-ternary")
!4 = !DISubroutineType(types: !5)
!5 = !{null, !6, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !10, retainedTypes: !11, globals: !13, splitDebugInlining: false, nameTableKind: None)
!10 = !{}
!11 = !{!12}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !{!0, !14}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "v", scope: !2, file: !3, line: 16, type: !16, isLocal: true, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 96, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 3)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 24, elements: !17)
!20 = !{i32 7, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!24 = distinct !DISubprogram(name: "reverse", scope: !3, file: !3, line: 4, type: !25, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !7}
!27 = !DILocalVariable(name: "p", arg: 1, scope: !24, file: !3, line: 4, type: !7)
!28 = !DILocation(line: 4, column: 20, scope: !24)
!29 = !DILocalVariable(name: "len", scope: !24, file: !3, line: 5, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !31, line: 46, baseType: !32)
!31 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!32 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 5, column: 12, scope: !24)
!34 = !DILocation(line: 5, column: 25, scope: !24)
!35 = !DILocation(line: 5, column: 18, scope: !24)
!36 = !DILocalVariable(name: "r", scope: !24, file: !3, line: 6, type: !7)
!37 = !DILocation(line: 6, column: 11, scope: !24)
!38 = !DILocation(line: 6, column: 15, scope: !24)
!39 = !DILocation(line: 6, column: 19, scope: !24)
!40 = !DILocation(line: 6, column: 17, scope: !24)
!41 = !DILocation(line: 6, column: 23, scope: !24)
!42 = !DILocation(line: 7, column: 5, scope: !24)
!43 = !DILocation(line: 7, column: 12, scope: !24)
!44 = !DILocation(line: 7, column: 16, scope: !24)
!45 = !DILocation(line: 7, column: 14, scope: !24)
!46 = !DILocation(line: 8, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !24, file: !3, line: 7, column: 19)
!48 = !DILocation(line: 8, column: 15, scope: !47)
!49 = !DILocation(line: 8, column: 10, scope: !47)
!50 = !DILocation(line: 8, column: 12, scope: !47)
!51 = !DILocation(line: 9, column: 16, scope: !47)
!52 = !DILocation(line: 9, column: 15, scope: !47)
!53 = !DILocation(line: 9, column: 10, scope: !47)
!54 = !DILocation(line: 9, column: 12, scope: !47)
!55 = !DILocation(line: 10, column: 19, scope: !47)
!56 = !DILocation(line: 10, column: 17, scope: !47)
!57 = !DILocation(line: 10, column: 11, scope: !47)
!58 = !DILocation(line: 10, column: 14, scope: !47)
!59 = distinct !{!59, !42, !60}
!60 = !DILocation(line: 11, column: 5, scope: !24)
!61 = !DILocation(line: 12, column: 1, scope: !24)
!62 = !DILocalVariable(name: "n", arg: 1, scope: !2, file: !3, line: 14, type: !6)
!63 = !DILocation(line: 14, column: 16, scope: !2)
!64 = !DILocalVariable(name: "b", arg: 2, scope: !2, file: !3, line: 14, type: !7)
!65 = !DILocation(line: 14, column: 25, scope: !2)
!66 = !DILocalVariable(name: "ptr", scope: !2, file: !3, line: 18, type: !7)
!67 = !DILocation(line: 18, column: 11, scope: !2)
!68 = !DILocation(line: 18, column: 17, scope: !2)
!69 = !DILocation(line: 19, column: 6, scope: !2)
!70 = !DILocation(line: 19, column: 10, scope: !2)
!71 = !DILocation(line: 21, column: 5, scope: !2)
!72 = !DILocation(line: 21, column: 12, scope: !2)
!73 = !DILocalVariable(name: "r", scope: !74, file: !3, line: 22, type: !6)
!74 = distinct !DILexicalBlock(scope: !2, file: !3, line: 21, column: 15)
!75 = !DILocation(line: 22, column: 13, scope: !74)
!76 = !DILocation(line: 22, column: 17, scope: !74)
!77 = !DILocation(line: 22, column: 19, scope: !74)
!78 = !DILocation(line: 23, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !74, file: !3, line: 23, column: 13)
!80 = !DILocation(line: 23, column: 15, scope: !79)
!81 = !DILocation(line: 23, column: 13, scope: !74)
!82 = !{!"if"}
!83 = !DILocation(line: 24, column: 15, scope: !84)
!84 = distinct !DILexicalBlock(scope: !79, file: !3, line: 23, column: 20)
!85 = !DILocation(line: 25, column: 9, scope: !84)
!86 = !DILocation(line: 27, column: 18, scope: !74)
!87 = !DILocation(line: 27, column: 16, scope: !74)
!88 = !DILocation(line: 27, column: 10, scope: !74)
!89 = !DILocation(line: 27, column: 14, scope: !74)
!90 = !DILocation(line: 28, column: 11, scope: !74)
!91 = !DILocation(line: 28, column: 18, scope: !74)
!92 = !DILocation(line: 30, column: 16, scope: !74)
!93 = !DILocation(line: 30, column: 14, scope: !74)
!94 = !DILocation(line: 30, column: 11, scope: !74)
!95 = !DILocation(line: 31, column: 11, scope: !74)
!96 = distinct !{!96, !71, !97}
!97 = !DILocation(line: 32, column: 5, scope: !2)
!98 = !DILocation(line: 34, column: 13, scope: !2)
!99 = !DILocation(line: 34, column: 5, scope: !2)
!100 = !DILocation(line: 35, column: 1, scope: !2)
!101 = distinct !DISubprogram(name: "from_bt", scope: !3, file: !3, line: 37, type: !102, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!102 = !DISubroutineType(types: !103)
!103 = !{!6, !104}
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !8)
!106 = !DILocalVariable(name: "a", arg: 1, scope: !101, file: !3, line: 37, type: !104)
!107 = !DILocation(line: 37, column: 25, scope: !101)
!108 = !DILocalVariable(name: "n", scope: !101, file: !3, line: 38, type: !6)
!109 = !DILocation(line: 38, column: 9, scope: !101)
!110 = !DILocation(line: 40, column: 5, scope: !101)
!111 = !DILocation(line: 40, column: 13, scope: !101)
!112 = !DILocation(line: 40, column: 12, scope: !101)
!113 = !DILocation(line: 40, column: 15, scope: !101)
!114 = !DILocation(line: 41, column: 11, scope: !115)
!115 = distinct !DILexicalBlock(scope: !101, file: !3, line: 40, column: 24)
!116 = !DILocation(line: 42, column: 14, scope: !117)
!117 = distinct !DILexicalBlock(scope: !115, file: !3, line: 42, column: 13)
!118 = !DILocation(line: 42, column: 13, scope: !117)
!119 = !DILocation(line: 42, column: 16, scope: !117)
!120 = !DILocation(line: 42, column: 13, scope: !115)
!121 = !DILocation(line: 43, column: 14, scope: !122)
!122 = distinct !DILexicalBlock(scope: !117, file: !3, line: 42, column: 24)
!123 = !DILocation(line: 44, column: 9, scope: !122)
!124 = !DILocation(line: 44, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !117, file: !3, line: 44, column: 20)
!126 = !DILocation(line: 44, column: 20, scope: !125)
!127 = !DILocation(line: 44, column: 23, scope: !125)
!128 = !DILocation(line: 44, column: 20, scope: !117)
!129 = !DILocation(line: 45, column: 14, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !3, line: 44, column: 31)
!131 = !DILocation(line: 46, column: 9, scope: !130)
!132 = !DILocation(line: 47, column: 10, scope: !115)
!133 = distinct !{!133, !110, !134}
!134 = !DILocation(line: 48, column: 5, scope: !101)
!135 = !DILocation(line: 50, column: 12, scope: !101)
!136 = !DILocation(line: 50, column: 5, scope: !101)
!137 = distinct !DISubprogram(name: "last_char", scope: !3, file: !3, line: 53, type: !138, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!138 = !DISubroutineType(types: !139)
!139 = !{!8, !7}
!140 = !DILocalVariable(name: "ptr", arg: 1, scope: !137, file: !3, line: 53, type: !7)
!141 = !DILocation(line: 53, column: 22, scope: !137)
!142 = !DILocalVariable(name: "c", scope: !137, file: !3, line: 54, type: !8)
!143 = !DILocation(line: 54, column: 10, scope: !137)
!144 = !DILocation(line: 56, column: 9, scope: !145)
!145 = distinct !DILexicalBlock(scope: !137, file: !3, line: 56, column: 9)
!146 = !DILocation(line: 56, column: 13, scope: !145)
!147 = !DILocation(line: 56, column: 21, scope: !145)
!148 = !DILocation(line: 56, column: 25, scope: !145)
!149 = !DILocation(line: 56, column: 24, scope: !145)
!150 = !DILocation(line: 56, column: 29, scope: !145)
!151 = !DILocation(line: 56, column: 9, scope: !137)
!152 = !DILocation(line: 57, column: 9, scope: !153)
!153 = distinct !DILexicalBlock(scope: !145, file: !3, line: 56, column: 38)
!154 = !DILocation(line: 60, column: 5, scope: !137)
!155 = !DILocation(line: 60, column: 13, scope: !137)
!156 = !DILocation(line: 60, column: 12, scope: !137)
!157 = !DILocation(line: 60, column: 17, scope: !137)
!158 = !DILocation(line: 61, column: 12, scope: !159)
!159 = distinct !DILexicalBlock(scope: !137, file: !3, line: 60, column: 26)
!160 = distinct !{!160, !154, !161}
!161 = !DILocation(line: 62, column: 5, scope: !137)
!162 = !DILocation(line: 63, column: 8, scope: !137)
!163 = !DILocation(line: 65, column: 10, scope: !137)
!164 = !DILocation(line: 65, column: 9, scope: !137)
!165 = !DILocation(line: 65, column: 7, scope: !137)
!166 = !DILocation(line: 66, column: 6, scope: !137)
!167 = !DILocation(line: 66, column: 10, scope: !137)
!168 = !DILocation(line: 67, column: 12, scope: !137)
!169 = !DILocation(line: 67, column: 5, scope: !137)
!170 = !DILocation(line: 68, column: 1, scope: !137)
!171 = distinct !DISubprogram(name: "add", scope: !3, file: !3, line: 70, type: !172, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!172 = !DISubroutineType(types: !173)
!173 = !{null, !104, !104, !7}
!174 = !DILocalVariable(name: "b1", arg: 1, scope: !171, file: !3, line: 70, type: !104)
!175 = !DILocation(line: 70, column: 22, scope: !171)
!176 = !DILocalVariable(name: "b2", arg: 2, scope: !171, file: !3, line: 70, type: !104)
!177 = !DILocation(line: 70, column: 38, scope: !171)
!178 = !DILocalVariable(name: "out", arg: 3, scope: !171, file: !3, line: 70, type: !7)
!179 = !DILocation(line: 70, column: 48, scope: !171)
!180 = !DILocation(line: 71, column: 10, scope: !181)
!181 = distinct !DILexicalBlock(scope: !171, file: !3, line: 71, column: 9)
!182 = !DILocation(line: 71, column: 9, scope: !181)
!183 = !DILocation(line: 71, column: 13, scope: !181)
!184 = !DILocation(line: 71, column: 21, scope: !181)
!185 = !DILocation(line: 71, column: 25, scope: !181)
!186 = !DILocation(line: 71, column: 24, scope: !181)
!187 = !DILocation(line: 71, column: 28, scope: !181)
!188 = !DILocation(line: 71, column: 9, scope: !171)
!189 = !DILocalVariable(name: "c1", scope: !190, file: !3, line: 72, type: !191)
!190 = distinct !DILexicalBlock(scope: !181, file: !3, line: 71, column: 37)
!191 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 128, elements: !192)
!192 = !{!193}
!193 = !DISubrange(count: 16)
!194 = !DILocation(line: 72, column: 14, scope: !190)
!195 = !DILocalVariable(name: "c2", scope: !190, file: !3, line: 73, type: !191)
!196 = !DILocation(line: 73, column: 14, scope: !190)
!197 = !DILocalVariable(name: "ob1", scope: !190, file: !3, line: 74, type: !191)
!198 = !DILocation(line: 74, column: 14, scope: !190)
!199 = !DILocalVariable(name: "ob2", scope: !190, file: !3, line: 75, type: !191)
!200 = !DILocation(line: 75, column: 14, scope: !190)
!201 = !DILocalVariable(name: "d", scope: !190, file: !3, line: 76, type: !19)
!202 = !DILocation(line: 76, column: 14, scope: !190)
!203 = !DILocalVariable(name: "L1", scope: !190, file: !3, line: 77, type: !8)
!204 = !DILocation(line: 77, column: 14, scope: !190)
!205 = !DILocalVariable(name: "L2", scope: !190, file: !3, line: 77, type: !8)
!206 = !DILocation(line: 77, column: 18, scope: !190)
!207 = !DILocation(line: 79, column: 16, scope: !190)
!208 = !DILocation(line: 79, column: 20, scope: !190)
!209 = !DILocation(line: 79, column: 9, scope: !190)
!210 = !DILocation(line: 80, column: 16, scope: !190)
!211 = !DILocation(line: 80, column: 20, scope: !190)
!212 = !DILocation(line: 80, column: 9, scope: !190)
!213 = !DILocation(line: 81, column: 24, scope: !190)
!214 = !DILocation(line: 81, column: 14, scope: !190)
!215 = !DILocation(line: 81, column: 12, scope: !190)
!216 = !DILocation(line: 82, column: 24, scope: !190)
!217 = !DILocation(line: 82, column: 14, scope: !190)
!218 = !DILocation(line: 82, column: 12, scope: !190)
!219 = !DILocation(line: 83, column: 13, scope: !220)
!220 = distinct !DILexicalBlock(scope: !190, file: !3, line: 83, column: 13)
!221 = !DILocation(line: 83, column: 18, scope: !220)
!222 = !DILocation(line: 83, column: 16, scope: !220)
!223 = !DILocation(line: 83, column: 13, scope: !190)
!224 = !DILocation(line: 84, column: 19, scope: !225)
!225 = distinct !DILexicalBlock(scope: !220, file: !3, line: 83, column: 22)
!226 = !DILocation(line: 84, column: 16, scope: !225)
!227 = !DILocation(line: 85, column: 19, scope: !225)
!228 = !DILocation(line: 85, column: 16, scope: !225)
!229 = !DILocation(line: 86, column: 19, scope: !225)
!230 = !DILocation(line: 86, column: 16, scope: !225)
!231 = !DILocation(line: 87, column: 9, scope: !225)
!232 = !DILocation(line: 89, column: 13, scope: !233)
!233 = distinct !DILexicalBlock(scope: !190, file: !3, line: 89, column: 13)
!234 = !DILocation(line: 89, column: 16, scope: !233)
!235 = !DILocation(line: 89, column: 13, scope: !190)
!236 = !DILocation(line: 90, column: 17, scope: !237)
!237 = distinct !DILexicalBlock(scope: !238, file: !3, line: 90, column: 17)
!238 = distinct !DILexicalBlock(scope: !233, file: !3, line: 89, column: 24)
!239 = !DILocation(line: 90, column: 20, scope: !237)
!240 = !DILocation(line: 90, column: 17, scope: !238)
!241 = !DILocation(line: 91, column: 17, scope: !242)
!242 = distinct !DILexicalBlock(scope: !237, file: !3, line: 90, column: 28)
!243 = !DILocation(line: 91, column: 22, scope: !242)
!244 = !DILocation(line: 92, column: 13, scope: !242)
!245 = !DILocation(line: 93, column: 17, scope: !246)
!246 = distinct !DILexicalBlock(scope: !238, file: !3, line: 93, column: 17)
!247 = !DILocation(line: 93, column: 20, scope: !246)
!248 = !DILocation(line: 93, column: 17, scope: !238)
!249 = !DILocation(line: 94, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !3, line: 93, column: 28)
!251 = !DILocation(line: 94, column: 22, scope: !250)
!252 = !DILocation(line: 95, column: 17, scope: !250)
!253 = !DILocation(line: 95, column: 22, scope: !250)
!254 = !DILocation(line: 96, column: 13, scope: !250)
!255 = !DILocation(line: 97, column: 9, scope: !238)
!256 = !DILocation(line: 98, column: 13, scope: !257)
!257 = distinct !DILexicalBlock(scope: !190, file: !3, line: 98, column: 13)
!258 = !DILocation(line: 98, column: 16, scope: !257)
!259 = !DILocation(line: 98, column: 13, scope: !190)
!260 = !DILocation(line: 99, column: 17, scope: !261)
!261 = distinct !DILexicalBlock(scope: !262, file: !3, line: 99, column: 17)
!262 = distinct !DILexicalBlock(scope: !257, file: !3, line: 98, column: 24)
!263 = !DILocation(line: 99, column: 20, scope: !261)
!264 = !DILocation(line: 99, column: 17, scope: !262)
!265 = !DILocation(line: 100, column: 17, scope: !266)
!266 = distinct !DILexicalBlock(scope: !261, file: !3, line: 99, column: 28)
!267 = !DILocation(line: 100, column: 22, scope: !266)
!268 = !DILocation(line: 101, column: 13, scope: !266)
!269 = !DILocation(line: 102, column: 17, scope: !270)
!270 = distinct !DILexicalBlock(scope: !262, file: !3, line: 102, column: 17)
!271 = !DILocation(line: 102, column: 20, scope: !270)
!272 = !DILocation(line: 102, column: 17, scope: !262)
!273 = !DILocation(line: 103, column: 17, scope: !274)
!274 = distinct !DILexicalBlock(scope: !270, file: !3, line: 102, column: 28)
!275 = !DILocation(line: 103, column: 22, scope: !274)
!276 = !DILocation(line: 104, column: 13, scope: !274)
!277 = !DILocation(line: 105, column: 17, scope: !278)
!278 = distinct !DILexicalBlock(scope: !262, file: !3, line: 105, column: 17)
!279 = !DILocation(line: 105, column: 20, scope: !278)
!280 = !DILocation(line: 105, column: 17, scope: !262)
!281 = !DILocation(line: 106, column: 17, scope: !282)
!282 = distinct !DILexicalBlock(scope: !278, file: !3, line: 105, column: 28)
!283 = !DILocation(line: 106, column: 22, scope: !282)
!284 = !DILocation(line: 107, column: 17, scope: !282)
!285 = !DILocation(line: 107, column: 22, scope: !282)
!286 = !DILocation(line: 108, column: 13, scope: !282)
!287 = !DILocation(line: 109, column: 9, scope: !262)
!288 = !DILocation(line: 110, column: 13, scope: !289)
!289 = distinct !DILexicalBlock(scope: !190, file: !3, line: 110, column: 13)
!290 = !DILocation(line: 110, column: 16, scope: !289)
!291 = !DILocation(line: 110, column: 13, scope: !190)
!292 = !DILocation(line: 111, column: 17, scope: !293)
!293 = distinct !DILexicalBlock(scope: !294, file: !3, line: 111, column: 17)
!294 = distinct !DILexicalBlock(scope: !289, file: !3, line: 110, column: 24)
!295 = !DILocation(line: 111, column: 20, scope: !293)
!296 = !DILocation(line: 111, column: 17, scope: !294)
!297 = !DILocation(line: 112, column: 17, scope: !298)
!298 = distinct !DILexicalBlock(scope: !293, file: !3, line: 111, column: 28)
!299 = !DILocation(line: 112, column: 22, scope: !298)
!300 = !DILocation(line: 113, column: 13, scope: !298)
!301 = !DILocation(line: 114, column: 9, scope: !294)
!302 = !DILocation(line: 116, column: 13, scope: !190)
!303 = !DILocation(line: 116, column: 18, scope: !190)
!304 = !DILocation(line: 116, column: 24, scope: !190)
!305 = !DILocation(line: 116, column: 9, scope: !190)
!306 = !DILocation(line: 117, column: 13, scope: !190)
!307 = !DILocation(line: 117, column: 18, scope: !190)
!308 = !DILocation(line: 117, column: 22, scope: !190)
!309 = !DILocation(line: 117, column: 9, scope: !190)
!310 = !DILocation(line: 118, column: 16, scope: !190)
!311 = !DILocation(line: 118, column: 21, scope: !190)
!312 = !DILocation(line: 118, column: 9, scope: !190)
!313 = !DILocation(line: 120, column: 9, scope: !190)
!314 = !DILocation(line: 120, column: 14, scope: !190)
!315 = !DILocation(line: 121, column: 16, scope: !190)
!316 = !DILocation(line: 121, column: 21, scope: !190)
!317 = !DILocation(line: 121, column: 9, scope: !190)
!318 = !DILocation(line: 122, column: 5, scope: !190)
!319 = !DILocation(line: 122, column: 17, scope: !320)
!320 = distinct !DILexicalBlock(scope: !181, file: !3, line: 122, column: 16)
!321 = !DILocation(line: 122, column: 16, scope: !320)
!322 = !DILocation(line: 122, column: 20, scope: !320)
!323 = !DILocation(line: 122, column: 16, scope: !181)
!324 = !DILocation(line: 123, column: 16, scope: !325)
!325 = distinct !DILexicalBlock(scope: !320, file: !3, line: 122, column: 29)
!326 = !DILocation(line: 123, column: 21, scope: !325)
!327 = !DILocation(line: 123, column: 9, scope: !325)
!328 = !DILocation(line: 124, column: 5, scope: !325)
!329 = !DILocation(line: 124, column: 17, scope: !330)
!330 = distinct !DILexicalBlock(scope: !320, file: !3, line: 124, column: 16)
!331 = !DILocation(line: 124, column: 16, scope: !330)
!332 = !DILocation(line: 124, column: 20, scope: !330)
!333 = !DILocation(line: 124, column: 16, scope: !320)
!334 = !DILocation(line: 125, column: 16, scope: !335)
!335 = distinct !DILexicalBlock(scope: !330, file: !3, line: 124, column: 29)
!336 = !DILocation(line: 125, column: 21, scope: !335)
!337 = !DILocation(line: 125, column: 9, scope: !335)
!338 = !DILocation(line: 126, column: 5, scope: !335)
!339 = !DILocation(line: 127, column: 10, scope: !340)
!340 = distinct !DILexicalBlock(scope: !330, file: !3, line: 126, column: 12)
!341 = !DILocation(line: 127, column: 14, scope: !340)
!342 = !DILocation(line: 129, column: 1, scope: !171)
!343 = distinct !DISubprogram(name: "unary_minus", scope: !3, file: !3, line: 131, type: !344, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!344 = !DISubroutineType(types: !345)
!345 = !{null, !104, !7}
!346 = !DILocalVariable(name: "b", arg: 1, scope: !343, file: !3, line: 131, type: !104)
!347 = !DILocation(line: 131, column: 30, scope: !343)
!348 = !DILocalVariable(name: "out", arg: 2, scope: !343, file: !3, line: 131, type: !7)
!349 = !DILocation(line: 131, column: 39, scope: !343)
!350 = !DILocation(line: 132, column: 5, scope: !343)
!351 = !DILocation(line: 132, column: 13, scope: !343)
!352 = !DILocation(line: 132, column: 12, scope: !343)
!353 = !DILocation(line: 132, column: 15, scope: !343)
!354 = !DILocation(line: 133, column: 14, scope: !355)
!355 = distinct !DILexicalBlock(scope: !356, file: !3, line: 133, column: 13)
!356 = distinct !DILexicalBlock(scope: !343, file: !3, line: 132, column: 24)
!357 = !DILocation(line: 133, column: 13, scope: !355)
!358 = !DILocation(line: 133, column: 16, scope: !355)
!359 = !DILocation(line: 133, column: 13, scope: !356)
!360 = !DILocation(line: 134, column: 17, scope: !361)
!361 = distinct !DILexicalBlock(scope: !355, file: !3, line: 133, column: 24)
!362 = !DILocation(line: 134, column: 20, scope: !361)
!363 = !DILocation(line: 135, column: 14, scope: !361)
!364 = !DILocation(line: 136, column: 9, scope: !361)
!365 = !DILocation(line: 136, column: 21, scope: !366)
!366 = distinct !DILexicalBlock(scope: !355, file: !3, line: 136, column: 20)
!367 = !DILocation(line: 136, column: 20, scope: !366)
!368 = !DILocation(line: 136, column: 23, scope: !366)
!369 = !DILocation(line: 136, column: 20, scope: !355)
!370 = !DILocation(line: 137, column: 17, scope: !371)
!371 = distinct !DILexicalBlock(scope: !366, file: !3, line: 136, column: 31)
!372 = !DILocation(line: 137, column: 20, scope: !371)
!373 = !DILocation(line: 138, column: 14, scope: !371)
!374 = !DILocation(line: 139, column: 9, scope: !371)
!375 = !DILocation(line: 140, column: 24, scope: !376)
!376 = distinct !DILexicalBlock(scope: !366, file: !3, line: 139, column: 16)
!377 = !DILocation(line: 140, column: 22, scope: !376)
!378 = !DILocation(line: 140, column: 17, scope: !376)
!379 = !DILocation(line: 140, column: 20, scope: !376)
!380 = distinct !{!380, !350, !381}
!381 = !DILocation(line: 142, column: 5, scope: !343)
!382 = !DILocation(line: 143, column: 6, scope: !343)
!383 = !DILocation(line: 143, column: 10, scope: !343)
!384 = !DILocation(line: 144, column: 1, scope: !343)
!385 = distinct !DISubprogram(name: "subtract", scope: !3, file: !3, line: 146, type: !172, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!386 = !DILocalVariable(name: "b1", arg: 1, scope: !385, file: !3, line: 146, type: !104)
!387 = !DILocation(line: 146, column: 27, scope: !385)
!388 = !DILocalVariable(name: "b2", arg: 2, scope: !385, file: !3, line: 146, type: !104)
!389 = !DILocation(line: 146, column: 43, scope: !385)
!390 = !DILocalVariable(name: "out", arg: 3, scope: !385, file: !3, line: 146, type: !7)
!391 = !DILocation(line: 146, column: 53, scope: !385)
!392 = !DILocalVariable(name: "buf", scope: !385, file: !3, line: 147, type: !191)
!393 = !DILocation(line: 147, column: 10, scope: !385)
!394 = !DILocation(line: 148, column: 17, scope: !385)
!395 = !DILocation(line: 148, column: 21, scope: !385)
!396 = !DILocation(line: 148, column: 5, scope: !385)
!397 = !DILocation(line: 149, column: 9, scope: !385)
!398 = !DILocation(line: 149, column: 13, scope: !385)
!399 = !DILocation(line: 149, column: 18, scope: !385)
!400 = !DILocation(line: 149, column: 5, scope: !385)
!401 = !DILocation(line: 150, column: 1, scope: !385)
!402 = distinct !DISubprogram(name: "mult", scope: !3, file: !3, line: 152, type: !172, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!403 = !DILocalVariable(name: "b1", arg: 1, scope: !402, file: !3, line: 152, type: !104)
!404 = !DILocation(line: 152, column: 23, scope: !402)
!405 = !DILocalVariable(name: "b2", arg: 2, scope: !402, file: !3, line: 152, type: !104)
!406 = !DILocation(line: 152, column: 39, scope: !402)
!407 = !DILocalVariable(name: "out", arg: 3, scope: !402, file: !3, line: 152, type: !7)
!408 = !DILocation(line: 152, column: 49, scope: !402)
!409 = !DILocalVariable(name: "r", scope: !402, file: !3, line: 153, type: !191)
!410 = !DILocation(line: 153, column: 10, scope: !402)
!411 = !DILocalVariable(name: "t", scope: !402, file: !3, line: 154, type: !191)
!412 = !DILocation(line: 154, column: 10, scope: !402)
!413 = !DILocalVariable(name: "c1", scope: !402, file: !3, line: 155, type: !191)
!414 = !DILocation(line: 155, column: 10, scope: !402)
!415 = !DILocalVariable(name: "c2", scope: !402, file: !3, line: 156, type: !191)
!416 = !DILocation(line: 156, column: 10, scope: !402)
!417 = !DILocalVariable(name: "ptr", scope: !402, file: !3, line: 157, type: !7)
!418 = !DILocation(line: 157, column: 11, scope: !402)
!419 = !DILocation(line: 157, column: 17, scope: !402)
!420 = !DILocation(line: 159, column: 12, scope: !402)
!421 = !DILocation(line: 159, column: 16, scope: !402)
!422 = !DILocation(line: 159, column: 5, scope: !402)
!423 = !DILocation(line: 160, column: 12, scope: !402)
!424 = !DILocation(line: 160, column: 16, scope: !402)
!425 = !DILocation(line: 160, column: 5, scope: !402)
!426 = !DILocation(line: 162, column: 13, scope: !402)
!427 = !DILocation(line: 162, column: 5, scope: !402)
!428 = !DILocation(line: 164, column: 5, scope: !402)
!429 = !DILocation(line: 164, column: 13, scope: !402)
!430 = !DILocation(line: 164, column: 12, scope: !402)
!431 = !DILocation(line: 164, column: 17, scope: !402)
!432 = !DILocation(line: 165, column: 14, scope: !433)
!433 = distinct !DILexicalBlock(scope: !434, file: !3, line: 165, column: 13)
!434 = distinct !DILexicalBlock(scope: !402, file: !3, line: 164, column: 26)
!435 = !DILocation(line: 165, column: 13, scope: !433)
!436 = !DILocation(line: 165, column: 18, scope: !433)
!437 = !DILocation(line: 165, column: 13, scope: !434)
!438 = !DILocation(line: 166, column: 17, scope: !439)
!439 = distinct !DILexicalBlock(scope: !433, file: !3, line: 165, column: 26)
!440 = !DILocation(line: 166, column: 20, scope: !439)
!441 = !DILocation(line: 166, column: 24, scope: !439)
!442 = !DILocation(line: 166, column: 13, scope: !439)
!443 = !DILocation(line: 167, column: 20, scope: !439)
!444 = !DILocation(line: 167, column: 23, scope: !439)
!445 = !DILocation(line: 167, column: 13, scope: !439)
!446 = !DILocation(line: 168, column: 9, scope: !439)
!447 = !DILocation(line: 169, column: 14, scope: !448)
!448 = distinct !DILexicalBlock(scope: !434, file: !3, line: 169, column: 13)
!449 = !DILocation(line: 169, column: 13, scope: !448)
!450 = !DILocation(line: 169, column: 18, scope: !448)
!451 = !DILocation(line: 169, column: 13, scope: !434)
!452 = !DILocation(line: 170, column: 22, scope: !453)
!453 = distinct !DILexicalBlock(scope: !448, file: !3, line: 169, column: 26)
!454 = !DILocation(line: 170, column: 25, scope: !453)
!455 = !DILocation(line: 170, column: 29, scope: !453)
!456 = !DILocation(line: 170, column: 13, scope: !453)
!457 = !DILocation(line: 171, column: 20, scope: !453)
!458 = !DILocation(line: 171, column: 23, scope: !453)
!459 = !DILocation(line: 171, column: 13, scope: !453)
!460 = !DILocation(line: 172, column: 9, scope: !453)
!461 = !DILocation(line: 173, column: 16, scope: !434)
!462 = !DILocation(line: 173, column: 9, scope: !434)
!463 = !DILocation(line: 175, column: 12, scope: !434)
!464 = distinct !{!464, !428, !465}
!465 = !DILocation(line: 176, column: 5, scope: !402)
!466 = !DILocation(line: 178, column: 11, scope: !402)
!467 = !DILocation(line: 178, column: 9, scope: !402)
!468 = !DILocation(line: 179, column: 5, scope: !402)
!469 = !DILocation(line: 179, column: 13, scope: !402)
!470 = !DILocation(line: 179, column: 12, scope: !402)
!471 = !DILocation(line: 179, column: 17, scope: !402)
!472 = !DILocation(line: 180, column: 12, scope: !473)
!473 = distinct !DILexicalBlock(scope: !402, file: !3, line: 179, column: 25)
!474 = distinct !{!474, !468, !475}
!475 = !DILocation(line: 181, column: 5, scope: !402)
!476 = !DILocation(line: 182, column: 12, scope: !402)
!477 = !DILocation(line: 182, column: 17, scope: !402)
!478 = !DILocation(line: 182, column: 5, scope: !402)
!479 = !DILocation(line: 183, column: 1, scope: !402)
!480 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 185, type: !481, scopeLine: 185, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!481 = !DISubroutineType(types: !482)
!482 = !{!6}
!483 = !DILocalVariable(name: "a", scope: !480, file: !3, line: 186, type: !104)
!484 = !DILocation(line: 186, column: 17, scope: !480)
!485 = !DILocalVariable(name: "b", scope: !480, file: !3, line: 187, type: !191)
!486 = !DILocation(line: 187, column: 10, scope: !480)
!487 = !DILocalVariable(name: "c", scope: !480, file: !3, line: 188, type: !104)
!488 = !DILocation(line: 188, column: 17, scope: !480)
!489 = !DILocalVariable(name: "t", scope: !480, file: !3, line: 189, type: !191)
!490 = !DILocation(line: 189, column: 10, scope: !480)
!491 = !DILocalVariable(name: "d", scope: !480, file: !3, line: 190, type: !191)
!492 = !DILocation(line: 190, column: 10, scope: !480)
!493 = !DILocation(line: 192, column: 17, scope: !480)
!494 = !DILocation(line: 192, column: 5, scope: !480)
!495 = !DILocation(line: 193, column: 14, scope: !480)
!496 = !DILocation(line: 193, column: 17, scope: !480)
!497 = !DILocation(line: 193, column: 20, scope: !480)
!498 = !DILocation(line: 193, column: 5, scope: !480)
!499 = !DILocation(line: 194, column: 10, scope: !480)
!500 = !DILocation(line: 194, column: 13, scope: !480)
!501 = !DILocation(line: 194, column: 16, scope: !480)
!502 = !DILocation(line: 194, column: 5, scope: !480)
!503 = !DILocation(line: 196, column: 36, scope: !480)
!504 = !DILocation(line: 196, column: 47, scope: !480)
!505 = !DILocation(line: 196, column: 39, scope: !480)
!506 = !DILocation(line: 196, column: 5, scope: !480)
!507 = !DILocation(line: 197, column: 36, scope: !480)
!508 = !DILocation(line: 197, column: 47, scope: !480)
!509 = !DILocation(line: 197, column: 39, scope: !480)
!510 = !DILocation(line: 197, column: 5, scope: !480)
!511 = !DILocation(line: 198, column: 36, scope: !480)
!512 = !DILocation(line: 198, column: 47, scope: !480)
!513 = !DILocation(line: 198, column: 39, scope: !480)
!514 = !DILocation(line: 198, column: 5, scope: !480)
!515 = !DILocation(line: 199, column: 36, scope: !480)
!516 = !DILocation(line: 199, column: 47, scope: !480)
!517 = !DILocation(line: 199, column: 39, scope: !480)
!518 = !DILocation(line: 199, column: 5, scope: !480)
!519 = !DILocation(line: 201, column: 5, scope: !480)
