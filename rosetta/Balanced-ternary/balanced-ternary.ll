; ModuleID = 'balanced-ternary.bc'
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
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %while.body
  %5 = load i32, i32* %r, align 4, !dbg !82
  %add = add nsw i32 %5, 3, !dbg !82
  store i32 %add, i32* %r, align 4, !dbg !82
  br label %if.end, !dbg !84

if.end:                                           ; preds = %if.then, %while.body
  %6 = load i32, i32* %r, align 4, !dbg !85
  %idxprom = sext i32 %6 to i64, !dbg !86
  %arrayidx = getelementptr inbounds [3 x i8], [3 x i8]* @to_bt.d, i64 0, i64 %idxprom, !dbg !86
  %7 = load i8, i8* %arrayidx, align 1, !dbg !86
  %8 = load i8*, i8** %ptr, align 8, !dbg !87
  store i8 %7, i8* %8, align 1, !dbg !88
  %9 = load i8*, i8** %ptr, align 8, !dbg !89
  %incdec.ptr = getelementptr inbounds i8, i8* %9, i32 1, !dbg !89
  store i8* %incdec.ptr, i8** %ptr, align 8, !dbg !89
  store i8 0, i8* %incdec.ptr, align 1, !dbg !90
  %10 = load i32, i32* %r, align 4, !dbg !91
  %idxprom1 = sext i32 %10 to i64, !dbg !92
  %arrayidx2 = getelementptr inbounds [3 x i32], [3 x i32]* @to_bt.v, i64 0, i64 %idxprom1, !dbg !92
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !92
  %12 = load i32, i32* %n.addr, align 4, !dbg !93
  %sub = sub nsw i32 %12, %11, !dbg !93
  store i32 %sub, i32* %n.addr, align 4, !dbg !93
  %13 = load i32, i32* %n.addr, align 4, !dbg !94
  %div = sdiv i32 %13, 3, !dbg !94
  store i32 %div, i32* %n.addr, align 4, !dbg !94
  br label %while.cond, !dbg !71, !llvm.loop !95

while.end:                                        ; preds = %while.cond
  %14 = load i8*, i8** %b.addr, align 8, !dbg !97
  call void @reverse(i8* %14), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @from_bt(i8* %a) #0 !dbg !100 {
entry:
  %a.addr = alloca i8*, align 8
  %n = alloca i32, align 4
  store i8* %a, i8** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a.addr, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32* %n, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 0, i32* %n, align 4, !dbg !108
  br label %while.cond, !dbg !109

while.cond:                                       ; preds = %if.end9, %entry
  %0 = load i8*, i8** %a.addr, align 8, !dbg !110
  %1 = load i8, i8* %0, align 1, !dbg !111
  %conv = sext i8 %1 to i32, !dbg !111
  %cmp = icmp ne i32 %conv, 0, !dbg !112
  br i1 %cmp, label %while.body, label %while.end, !dbg !109

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %n, align 4, !dbg !113
  %mul = mul nsw i32 %2, 3, !dbg !113
  store i32 %mul, i32* %n, align 4, !dbg !113
  %3 = load i8*, i8** %a.addr, align 8, !dbg !115
  %4 = load i8, i8* %3, align 1, !dbg !117
  %conv2 = sext i8 %4 to i32, !dbg !117
  %cmp3 = icmp eq i32 %conv2, 43, !dbg !118
  br i1 %cmp3, label %if.then, label %if.else, !dbg !119

if.then:                                          ; preds = %while.body
  %5 = load i32, i32* %n, align 4, !dbg !120
  %inc = add nsw i32 %5, 1, !dbg !120
  store i32 %inc, i32* %n, align 4, !dbg !120
  br label %if.end9, !dbg !122

if.else:                                          ; preds = %while.body
  %6 = load i8*, i8** %a.addr, align 8, !dbg !123
  %7 = load i8, i8* %6, align 1, !dbg !125
  %conv5 = sext i8 %7 to i32, !dbg !125
  %cmp6 = icmp eq i32 %conv5, 45, !dbg !126
  br i1 %cmp6, label %if.then8, label %if.end, !dbg !127

if.then8:                                         ; preds = %if.else
  %8 = load i32, i32* %n, align 4, !dbg !128
  %dec = add nsw i32 %8, -1, !dbg !128
  store i32 %dec, i32* %n, align 4, !dbg !128
  br label %if.end, !dbg !130

if.end:                                           ; preds = %if.then8, %if.else
  br label %if.end9

if.end9:                                          ; preds = %if.end, %if.then
  %9 = load i8*, i8** %a.addr, align 8, !dbg !131
  %incdec.ptr = getelementptr inbounds i8, i8* %9, i32 1, !dbg !131
  store i8* %incdec.ptr, i8** %a.addr, align 8, !dbg !131
  br label %while.cond, !dbg !109, !llvm.loop !132

while.end:                                        ; preds = %while.cond
  %10 = load i32, i32* %n, align 4, !dbg !134
  ret i32 %10, !dbg !135
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @last_char(i8* %ptr) #0 !dbg !136 {
entry:
  %retval = alloca i8, align 1
  %ptr.addr = alloca i8*, align 8
  %c = alloca i8, align 1
  store i8* %ptr, i8** %ptr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %ptr.addr, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i8* %c, metadata !141, metadata !DIExpression()), !dbg !142
  %0 = load i8*, i8** %ptr.addr, align 8, !dbg !143
  %cmp = icmp eq i8* %0, null, !dbg !145
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !146

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %ptr.addr, align 8, !dbg !147
  %2 = load i8, i8* %1, align 1, !dbg !148
  %conv = sext i8 %2 to i32, !dbg !148
  %cmp1 = icmp eq i32 %conv, 0, !dbg !149
  br i1 %cmp1, label %if.then, label %if.end, !dbg !150

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 0, i8* %retval, align 1, !dbg !151
  br label %return, !dbg !151

if.end:                                           ; preds = %lor.lhs.false
  br label %while.cond, !dbg !153

while.cond:                                       ; preds = %while.body, %if.end
  %3 = load i8*, i8** %ptr.addr, align 8, !dbg !154
  %4 = load i8, i8* %3, align 1, !dbg !155
  %conv3 = sext i8 %4 to i32, !dbg !155
  %cmp4 = icmp ne i32 %conv3, 0, !dbg !156
  br i1 %cmp4, label %while.body, label %while.end, !dbg !153

while.body:                                       ; preds = %while.cond
  %5 = load i8*, i8** %ptr.addr, align 8, !dbg !157
  %incdec.ptr = getelementptr inbounds i8, i8* %5, i32 1, !dbg !157
  store i8* %incdec.ptr, i8** %ptr.addr, align 8, !dbg !157
  br label %while.cond, !dbg !153, !llvm.loop !159

while.end:                                        ; preds = %while.cond
  %6 = load i8*, i8** %ptr.addr, align 8, !dbg !161
  %incdec.ptr6 = getelementptr inbounds i8, i8* %6, i32 -1, !dbg !161
  store i8* %incdec.ptr6, i8** %ptr.addr, align 8, !dbg !161
  %7 = load i8*, i8** %ptr.addr, align 8, !dbg !162
  %8 = load i8, i8* %7, align 1, !dbg !163
  store i8 %8, i8* %c, align 1, !dbg !164
  %9 = load i8*, i8** %ptr.addr, align 8, !dbg !165
  store i8 0, i8* %9, align 1, !dbg !166
  %10 = load i8, i8* %c, align 1, !dbg !167
  store i8 %10, i8* %retval, align 1, !dbg !168
  br label %return, !dbg !168

return:                                           ; preds = %while.end, %if.then
  %11 = load i8, i8* %retval, align 1, !dbg !169
  ret i8 %11, !dbg !169
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @add(i8* %b1, i8* %b2, i8* %out) #0 !dbg !170 {
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
  call void @llvm.dbg.declare(metadata i8** %b1.addr, metadata !173, metadata !DIExpression()), !dbg !174
  store i8* %b2, i8** %b2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b2.addr, metadata !175, metadata !DIExpression()), !dbg !176
  store i8* %out, i8** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %out.addr, metadata !177, metadata !DIExpression()), !dbg !178
  %0 = load i8*, i8** %b1.addr, align 8, !dbg !179
  %1 = load i8, i8* %0, align 1, !dbg !181
  %conv = sext i8 %1 to i32, !dbg !181
  %cmp = icmp ne i32 %conv, 0, !dbg !182
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !183

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %b2.addr, align 8, !dbg !184
  %3 = load i8, i8* %2, align 1, !dbg !185
  %conv2 = sext i8 %3 to i32, !dbg !185
  %cmp3 = icmp ne i32 %conv2, 0, !dbg !186
  br i1 %cmp3, label %if.then, label %if.else, !dbg !187

if.then:                                          ; preds = %land.lhs.true
  call void @llvm.dbg.declare(metadata [16 x i8]* %c1, metadata !188, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.declare(metadata [16 x i8]* %c2, metadata !194, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata [16 x i8]* %ob1, metadata !196, metadata !DIExpression()), !dbg !197
  call void @llvm.dbg.declare(metadata [16 x i8]* %ob2, metadata !198, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.declare(metadata [3 x i8]* %d, metadata !200, metadata !DIExpression()), !dbg !201
  %4 = bitcast [3 x i8]* %d to i8*, !dbg !201
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 0, i64 3, i1 false), !dbg !201
  call void @llvm.dbg.declare(metadata i8* %L1, metadata !202, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.declare(metadata i8* %L2, metadata !204, metadata !DIExpression()), !dbg !205
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !206
  %5 = load i8*, i8** %b1.addr, align 8, !dbg !207
  %call = call i8* @strcpy(i8* %arraydecay, i8* %5) #7, !dbg !208
  %arraydecay5 = getelementptr inbounds [16 x i8], [16 x i8]* %c2, i64 0, i64 0, !dbg !209
  %6 = load i8*, i8** %b2.addr, align 8, !dbg !210
  %call6 = call i8* @strcpy(i8* %arraydecay5, i8* %6) #7, !dbg !211
  %arraydecay7 = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !212
  %call8 = call signext i8 @last_char(i8* %arraydecay7), !dbg !213
  store i8 %call8, i8* %L1, align 1, !dbg !214
  %arraydecay9 = getelementptr inbounds [16 x i8], [16 x i8]* %c2, i64 0, i64 0, !dbg !215
  %call10 = call signext i8 @last_char(i8* %arraydecay9), !dbg !216
  store i8 %call10, i8* %L2, align 1, !dbg !217
  %7 = load i8, i8* %L2, align 1, !dbg !218
  %conv11 = sext i8 %7 to i32, !dbg !218
  %8 = load i8, i8* %L1, align 1, !dbg !220
  %conv12 = sext i8 %8 to i32, !dbg !220
  %cmp13 = icmp slt i32 %conv11, %conv12, !dbg !221
  br i1 %cmp13, label %if.then15, label %if.end, !dbg !222

if.then15:                                        ; preds = %if.then
  %9 = load i8, i8* %L1, align 1, !dbg !223
  %conv16 = sext i8 %9 to i32, !dbg !223
  %10 = load i8, i8* %L2, align 1, !dbg !225
  %conv17 = sext i8 %10 to i32, !dbg !225
  %xor = xor i32 %conv17, %conv16, !dbg !225
  %conv18 = trunc i32 %xor to i8, !dbg !225
  store i8 %conv18, i8* %L2, align 1, !dbg !225
  %11 = load i8, i8* %L2, align 1, !dbg !226
  %conv19 = sext i8 %11 to i32, !dbg !226
  %12 = load i8, i8* %L1, align 1, !dbg !227
  %conv20 = sext i8 %12 to i32, !dbg !227
  %xor21 = xor i32 %conv20, %conv19, !dbg !227
  %conv22 = trunc i32 %xor21 to i8, !dbg !227
  store i8 %conv22, i8* %L1, align 1, !dbg !227
  %13 = load i8, i8* %L1, align 1, !dbg !228
  %conv23 = sext i8 %13 to i32, !dbg !228
  %14 = load i8, i8* %L2, align 1, !dbg !229
  %conv24 = sext i8 %14 to i32, !dbg !229
  %xor25 = xor i32 %conv24, %conv23, !dbg !229
  %conv26 = trunc i32 %xor25 to i8, !dbg !229
  store i8 %conv26, i8* %L2, align 1, !dbg !229
  br label %if.end, !dbg !230

if.end:                                           ; preds = %if.then15, %if.then
  %15 = load i8, i8* %L1, align 1, !dbg !231
  %conv27 = sext i8 %15 to i32, !dbg !231
  %cmp28 = icmp eq i32 %conv27, 45, !dbg !233
  br i1 %cmp28, label %if.then30, label %if.end43, !dbg !234

if.then30:                                        ; preds = %if.end
  %16 = load i8, i8* %L2, align 1, !dbg !235
  %conv31 = sext i8 %16 to i32, !dbg !235
  %cmp32 = icmp eq i32 %conv31, 48, !dbg !238
  br i1 %cmp32, label %if.then34, label %if.end35, !dbg !239

if.then34:                                        ; preds = %if.then30
  %arrayidx = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !240
  store i8 45, i8* %arrayidx, align 1, !dbg !242
  br label %if.end35, !dbg !243

if.end35:                                         ; preds = %if.then34, %if.then30
  %17 = load i8, i8* %L2, align 1, !dbg !244
  %conv36 = sext i8 %17 to i32, !dbg !244
  %cmp37 = icmp eq i32 %conv36, 45, !dbg !246
  br i1 %cmp37, label %if.then39, label %if.end42, !dbg !247

if.then39:                                        ; preds = %if.end35
  %arrayidx40 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !248
  store i8 43, i8* %arrayidx40, align 1, !dbg !250
  %arrayidx41 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 1, !dbg !251
  store i8 45, i8* %arrayidx41, align 1, !dbg !252
  br label %if.end42, !dbg !253

if.end42:                                         ; preds = %if.then39, %if.end35
  br label %if.end43, !dbg !254

if.end43:                                         ; preds = %if.end42, %if.end
  %18 = load i8, i8* %L1, align 1, !dbg !255
  %conv44 = sext i8 %18 to i32, !dbg !255
  %cmp45 = icmp eq i32 %conv44, 43, !dbg !257
  br i1 %cmp45, label %if.then47, label %if.end67, !dbg !258

if.then47:                                        ; preds = %if.end43
  %19 = load i8, i8* %L2, align 1, !dbg !259
  %conv48 = sext i8 %19 to i32, !dbg !259
  %cmp49 = icmp eq i32 %conv48, 48, !dbg !262
  br i1 %cmp49, label %if.then51, label %if.end53, !dbg !263

if.then51:                                        ; preds = %if.then47
  %arrayidx52 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !264
  store i8 43, i8* %arrayidx52, align 1, !dbg !266
  br label %if.end53, !dbg !267

if.end53:                                         ; preds = %if.then51, %if.then47
  %20 = load i8, i8* %L2, align 1, !dbg !268
  %conv54 = sext i8 %20 to i32, !dbg !268
  %cmp55 = icmp eq i32 %conv54, 45, !dbg !270
  br i1 %cmp55, label %if.then57, label %if.end59, !dbg !271

if.then57:                                        ; preds = %if.end53
  %arrayidx58 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !272
  store i8 48, i8* %arrayidx58, align 1, !dbg !274
  br label %if.end59, !dbg !275

if.end59:                                         ; preds = %if.then57, %if.end53
  %21 = load i8, i8* %L2, align 1, !dbg !276
  %conv60 = sext i8 %21 to i32, !dbg !276
  %cmp61 = icmp eq i32 %conv60, 43, !dbg !278
  br i1 %cmp61, label %if.then63, label %if.end66, !dbg !279

if.then63:                                        ; preds = %if.end59
  %arrayidx64 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !280
  store i8 45, i8* %arrayidx64, align 1, !dbg !282
  %arrayidx65 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 1, !dbg !283
  store i8 43, i8* %arrayidx65, align 1, !dbg !284
  br label %if.end66, !dbg !285

if.end66:                                         ; preds = %if.then63, %if.end59
  br label %if.end67, !dbg !286

if.end67:                                         ; preds = %if.end66, %if.end43
  %22 = load i8, i8* %L1, align 1, !dbg !287
  %conv68 = sext i8 %22 to i32, !dbg !287
  %cmp69 = icmp eq i32 %conv68, 48, !dbg !289
  br i1 %cmp69, label %if.then71, label %if.end78, !dbg !290

if.then71:                                        ; preds = %if.end67
  %23 = load i8, i8* %L2, align 1, !dbg !291
  %conv72 = sext i8 %23 to i32, !dbg !291
  %cmp73 = icmp eq i32 %conv72, 48, !dbg !294
  br i1 %cmp73, label %if.then75, label %if.end77, !dbg !295

if.then75:                                        ; preds = %if.then71
  %arrayidx76 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !296
  store i8 48, i8* %arrayidx76, align 1, !dbg !298
  br label %if.end77, !dbg !299

if.end77:                                         ; preds = %if.then75, %if.then71
  br label %if.end78, !dbg !300

if.end78:                                         ; preds = %if.end77, %if.end67
  %arraydecay79 = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !301
  %arrayidx80 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 1, !dbg !302
  %arraydecay81 = getelementptr inbounds [16 x i8], [16 x i8]* %ob1, i64 0, i64 0, !dbg !303
  call void @add(i8* %arraydecay79, i8* %arrayidx80, i8* %arraydecay81), !dbg !304
  %arraydecay82 = getelementptr inbounds [16 x i8], [16 x i8]* %ob1, i64 0, i64 0, !dbg !305
  %arraydecay83 = getelementptr inbounds [16 x i8], [16 x i8]* %c2, i64 0, i64 0, !dbg !306
  %arraydecay84 = getelementptr inbounds [16 x i8], [16 x i8]* %ob2, i64 0, i64 0, !dbg !307
  call void @add(i8* %arraydecay82, i8* %arraydecay83, i8* %arraydecay84), !dbg !308
  %24 = load i8*, i8** %out.addr, align 8, !dbg !309
  %arraydecay85 = getelementptr inbounds [16 x i8], [16 x i8]* %ob2, i64 0, i64 0, !dbg !310
  %call86 = call i8* @strcpy(i8* %24, i8* %arraydecay85) #7, !dbg !311
  %arrayidx87 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 1, !dbg !312
  store i8 0, i8* %arrayidx87, align 1, !dbg !313
  %25 = load i8*, i8** %out.addr, align 8, !dbg !314
  %arraydecay88 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !315
  %call89 = call i8* @strcat(i8* %25, i8* %arraydecay88) #7, !dbg !316
  br label %if.end104, !dbg !317

if.else:                                          ; preds = %land.lhs.true, %entry
  %26 = load i8*, i8** %b1.addr, align 8, !dbg !318
  %27 = load i8, i8* %26, align 1, !dbg !320
  %conv90 = sext i8 %27 to i32, !dbg !320
  %cmp91 = icmp ne i32 %conv90, 0, !dbg !321
  br i1 %cmp91, label %if.then93, label %if.else95, !dbg !322

if.then93:                                        ; preds = %if.else
  %28 = load i8*, i8** %out.addr, align 8, !dbg !323
  %29 = load i8*, i8** %b1.addr, align 8, !dbg !325
  %call94 = call i8* @strcpy(i8* %28, i8* %29) #7, !dbg !326
  br label %if.end103, !dbg !327

if.else95:                                        ; preds = %if.else
  %30 = load i8*, i8** %b2.addr, align 8, !dbg !328
  %31 = load i8, i8* %30, align 1, !dbg !330
  %conv96 = sext i8 %31 to i32, !dbg !330
  %cmp97 = icmp ne i32 %conv96, 0, !dbg !331
  br i1 %cmp97, label %if.then99, label %if.else101, !dbg !332

if.then99:                                        ; preds = %if.else95
  %32 = load i8*, i8** %out.addr, align 8, !dbg !333
  %33 = load i8*, i8** %b2.addr, align 8, !dbg !335
  %call100 = call i8* @strcpy(i8* %32, i8* %33) #7, !dbg !336
  br label %if.end102, !dbg !337

if.else101:                                       ; preds = %if.else95
  %34 = load i8*, i8** %out.addr, align 8, !dbg !338
  store i8 0, i8* %34, align 1, !dbg !340
  br label %if.end102

if.end102:                                        ; preds = %if.else101, %if.then99
  br label %if.end103

if.end103:                                        ; preds = %if.end102, %if.then93
  br label %if.end104

if.end104:                                        ; preds = %if.end103, %if.end78
  ret void, !dbg !341
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @unary_minus(i8* %b, i8* %out) #0 !dbg !342 {
entry:
  %b.addr = alloca i8*, align 8
  %out.addr = alloca i8*, align 8
  store i8* %b, i8** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b.addr, metadata !345, metadata !DIExpression()), !dbg !346
  store i8* %out, i8** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %out.addr, metadata !347, metadata !DIExpression()), !dbg !348
  br label %while.cond, !dbg !349

while.cond:                                       ; preds = %if.end15, %entry
  %0 = load i8*, i8** %b.addr, align 8, !dbg !350
  %1 = load i8, i8* %0, align 1, !dbg !351
  %conv = sext i8 %1 to i32, !dbg !351
  %cmp = icmp ne i32 %conv, 0, !dbg !352
  br i1 %cmp, label %while.body, label %while.end, !dbg !349

while.body:                                       ; preds = %while.cond
  %2 = load i8*, i8** %b.addr, align 8, !dbg !353
  %3 = load i8, i8* %2, align 1, !dbg !356
  %conv2 = sext i8 %3 to i32, !dbg !356
  %cmp3 = icmp eq i32 %conv2, 45, !dbg !357
  br i1 %cmp3, label %if.then, label %if.else, !dbg !358

if.then:                                          ; preds = %while.body
  %4 = load i8*, i8** %out.addr, align 8, !dbg !359
  %incdec.ptr = getelementptr inbounds i8, i8* %4, i32 1, !dbg !359
  store i8* %incdec.ptr, i8** %out.addr, align 8, !dbg !359
  store i8 43, i8* %4, align 1, !dbg !361
  %5 = load i8*, i8** %b.addr, align 8, !dbg !362
  %incdec.ptr5 = getelementptr inbounds i8, i8* %5, i32 1, !dbg !362
  store i8* %incdec.ptr5, i8** %b.addr, align 8, !dbg !362
  br label %if.end15, !dbg !363

if.else:                                          ; preds = %while.body
  %6 = load i8*, i8** %b.addr, align 8, !dbg !364
  %7 = load i8, i8* %6, align 1, !dbg !366
  %conv6 = sext i8 %7 to i32, !dbg !366
  %cmp7 = icmp eq i32 %conv6, 43, !dbg !367
  br i1 %cmp7, label %if.then9, label %if.else12, !dbg !368

if.then9:                                         ; preds = %if.else
  %8 = load i8*, i8** %out.addr, align 8, !dbg !369
  %incdec.ptr10 = getelementptr inbounds i8, i8* %8, i32 1, !dbg !369
  store i8* %incdec.ptr10, i8** %out.addr, align 8, !dbg !369
  store i8 45, i8* %8, align 1, !dbg !371
  %9 = load i8*, i8** %b.addr, align 8, !dbg !372
  %incdec.ptr11 = getelementptr inbounds i8, i8* %9, i32 1, !dbg !372
  store i8* %incdec.ptr11, i8** %b.addr, align 8, !dbg !372
  br label %if.end, !dbg !373

if.else12:                                        ; preds = %if.else
  %10 = load i8*, i8** %b.addr, align 8, !dbg !374
  %incdec.ptr13 = getelementptr inbounds i8, i8* %10, i32 1, !dbg !374
  store i8* %incdec.ptr13, i8** %b.addr, align 8, !dbg !374
  %11 = load i8, i8* %10, align 1, !dbg !376
  %12 = load i8*, i8** %out.addr, align 8, !dbg !377
  %incdec.ptr14 = getelementptr inbounds i8, i8* %12, i32 1, !dbg !377
  store i8* %incdec.ptr14, i8** %out.addr, align 8, !dbg !377
  store i8 %11, i8* %12, align 1, !dbg !378
  br label %if.end

if.end:                                           ; preds = %if.else12, %if.then9
  br label %if.end15

if.end15:                                         ; preds = %if.end, %if.then
  br label %while.cond, !dbg !349, !llvm.loop !379

while.end:                                        ; preds = %while.cond
  %13 = load i8*, i8** %out.addr, align 8, !dbg !381
  store i8 0, i8* %13, align 1, !dbg !382
  ret void, !dbg !383
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @subtract(i8* %b1, i8* %b2, i8* %out) #0 !dbg !384 {
entry:
  %b1.addr = alloca i8*, align 8
  %b2.addr = alloca i8*, align 8
  %out.addr = alloca i8*, align 8
  %buf = alloca [16 x i8], align 16
  store i8* %b1, i8** %b1.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b1.addr, metadata !385, metadata !DIExpression()), !dbg !386
  store i8* %b2, i8** %b2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b2.addr, metadata !387, metadata !DIExpression()), !dbg !388
  store i8* %out, i8** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %out.addr, metadata !389, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.declare(metadata [16 x i8]* %buf, metadata !391, metadata !DIExpression()), !dbg !392
  %0 = load i8*, i8** %b2.addr, align 8, !dbg !393
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !394
  call void @unary_minus(i8* %0, i8* %arraydecay), !dbg !395
  %1 = load i8*, i8** %b1.addr, align 8, !dbg !396
  %arraydecay1 = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !397
  %2 = load i8*, i8** %out.addr, align 8, !dbg !398
  call void @add(i8* %1, i8* %arraydecay1, i8* %2), !dbg !399
  ret void, !dbg !400
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @mult(i8* %b1, i8* %b2, i8* %out) #0 !dbg !401 {
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
  call void @llvm.dbg.declare(metadata i8** %b1.addr, metadata !402, metadata !DIExpression()), !dbg !403
  store i8* %b2, i8** %b2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b2.addr, metadata !404, metadata !DIExpression()), !dbg !405
  store i8* %out, i8** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %out.addr, metadata !406, metadata !DIExpression()), !dbg !407
  call void @llvm.dbg.declare(metadata [16 x i8]* %r, metadata !408, metadata !DIExpression()), !dbg !409
  %0 = bitcast [16 x i8]* %r to i8*, !dbg !409
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 getelementptr inbounds ([16 x i8], [16 x i8]* @__const.mult.r, i32 0, i32 0), i64 16, i1 false), !dbg !409
  call void @llvm.dbg.declare(metadata [16 x i8]* %t, metadata !410, metadata !DIExpression()), !dbg !411
  call void @llvm.dbg.declare(metadata [16 x i8]* %c1, metadata !412, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.declare(metadata [16 x i8]* %c2, metadata !414, metadata !DIExpression()), !dbg !415
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !416, metadata !DIExpression()), !dbg !417
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %c2, i64 0, i64 0, !dbg !418
  store i8* %arraydecay, i8** %ptr, align 8, !dbg !417
  %arraydecay1 = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !419
  %1 = load i8*, i8** %b1.addr, align 8, !dbg !420
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %1) #7, !dbg !421
  %arraydecay2 = getelementptr inbounds [16 x i8], [16 x i8]* %c2, i64 0, i64 0, !dbg !422
  %2 = load i8*, i8** %b2.addr, align 8, !dbg !423
  %call3 = call i8* @strcpy(i8* %arraydecay2, i8* %2) #7, !dbg !424
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %c2, i64 0, i64 0, !dbg !425
  call void @reverse(i8* %arraydecay4), !dbg !426
  br label %while.cond, !dbg !427

while.cond:                                       ; preds = %if.end25, %entry
  %3 = load i8*, i8** %ptr, align 8, !dbg !428
  %4 = load i8, i8* %3, align 1, !dbg !429
  %conv = sext i8 %4 to i32, !dbg !429
  %cmp = icmp ne i32 %conv, 0, !dbg !430
  br i1 %cmp, label %while.body, label %while.end, !dbg !427

while.body:                                       ; preds = %while.cond
  %5 = load i8*, i8** %ptr, align 8, !dbg !431
  %6 = load i8, i8* %5, align 1, !dbg !434
  %conv6 = sext i8 %6 to i32, !dbg !434
  %cmp7 = icmp eq i32 %conv6, 43, !dbg !435
  br i1 %cmp7, label %if.then, label %if.end, !dbg !436

if.then:                                          ; preds = %while.body
  %arraydecay9 = getelementptr inbounds [16 x i8], [16 x i8]* %r, i64 0, i64 0, !dbg !437
  %arraydecay10 = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !439
  %arraydecay11 = getelementptr inbounds [16 x i8], [16 x i8]* %t, i64 0, i64 0, !dbg !440
  call void @add(i8* %arraydecay9, i8* %arraydecay10, i8* %arraydecay11), !dbg !441
  %arraydecay12 = getelementptr inbounds [16 x i8], [16 x i8]* %r, i64 0, i64 0, !dbg !442
  %arraydecay13 = getelementptr inbounds [16 x i8], [16 x i8]* %t, i64 0, i64 0, !dbg !443
  %call14 = call i8* @strcpy(i8* %arraydecay12, i8* %arraydecay13) #7, !dbg !444
  br label %if.end, !dbg !445

if.end:                                           ; preds = %if.then, %while.body
  %7 = load i8*, i8** %ptr, align 8, !dbg !446
  %8 = load i8, i8* %7, align 1, !dbg !448
  %conv15 = sext i8 %8 to i32, !dbg !448
  %cmp16 = icmp eq i32 %conv15, 45, !dbg !449
  br i1 %cmp16, label %if.then18, label %if.end25, !dbg !450

if.then18:                                        ; preds = %if.end
  %arraydecay19 = getelementptr inbounds [16 x i8], [16 x i8]* %r, i64 0, i64 0, !dbg !451
  %arraydecay20 = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !453
  %arraydecay21 = getelementptr inbounds [16 x i8], [16 x i8]* %t, i64 0, i64 0, !dbg !454
  call void @subtract(i8* %arraydecay19, i8* %arraydecay20, i8* %arraydecay21), !dbg !455
  %arraydecay22 = getelementptr inbounds [16 x i8], [16 x i8]* %r, i64 0, i64 0, !dbg !456
  %arraydecay23 = getelementptr inbounds [16 x i8], [16 x i8]* %t, i64 0, i64 0, !dbg !457
  %call24 = call i8* @strcpy(i8* %arraydecay22, i8* %arraydecay23) #7, !dbg !458
  br label %if.end25, !dbg !459

if.end25:                                         ; preds = %if.then18, %if.end
  %arraydecay26 = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !460
  %call27 = call i8* @strcat(i8* %arraydecay26, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)) #7, !dbg !461
  %9 = load i8*, i8** %ptr, align 8, !dbg !462
  %incdec.ptr = getelementptr inbounds i8, i8* %9, i32 1, !dbg !462
  store i8* %incdec.ptr, i8** %ptr, align 8, !dbg !462
  br label %while.cond, !dbg !427, !llvm.loop !463

while.end:                                        ; preds = %while.cond
  %arraydecay28 = getelementptr inbounds [16 x i8], [16 x i8]* %r, i64 0, i64 0, !dbg !465
  store i8* %arraydecay28, i8** %ptr, align 8, !dbg !466
  br label %while.cond29, !dbg !467

while.cond29:                                     ; preds = %while.body33, %while.end
  %10 = load i8*, i8** %ptr, align 8, !dbg !468
  %11 = load i8, i8* %10, align 1, !dbg !469
  %conv30 = sext i8 %11 to i32, !dbg !469
  %cmp31 = icmp eq i32 %conv30, 48, !dbg !470
  br i1 %cmp31, label %while.body33, label %while.end35, !dbg !467

while.body33:                                     ; preds = %while.cond29
  %12 = load i8*, i8** %ptr, align 8, !dbg !471
  %incdec.ptr34 = getelementptr inbounds i8, i8* %12, i32 1, !dbg !471
  store i8* %incdec.ptr34, i8** %ptr, align 8, !dbg !471
  br label %while.cond29, !dbg !467, !llvm.loop !473

while.end35:                                      ; preds = %while.cond29
  %13 = load i8*, i8** %out.addr, align 8, !dbg !475
  %14 = load i8*, i8** %ptr, align 8, !dbg !476
  %call36 = call i8* @strcpy(i8* %13, i8* %14) #7, !dbg !477
  ret void, !dbg !478
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !479 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i8*, align 8
  %b = alloca [16 x i8], align 16
  %c = alloca i8*, align 8
  %t = alloca [16 x i8], align 16
  %d = alloca [16 x i8], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i8** %a, metadata !482, metadata !DIExpression()), !dbg !483
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i8** %a, align 8, !dbg !483
  call void @llvm.dbg.declare(metadata [16 x i8]* %b, metadata !484, metadata !DIExpression()), !dbg !485
  call void @llvm.dbg.declare(metadata i8** %c, metadata !486, metadata !DIExpression()), !dbg !487
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8** %c, align 8, !dbg !487
  call void @llvm.dbg.declare(metadata [16 x i8]* %t, metadata !488, metadata !DIExpression()), !dbg !489
  call void @llvm.dbg.declare(metadata [16 x i8]* %d, metadata !490, metadata !DIExpression()), !dbg !491
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %b, i64 0, i64 0, !dbg !492
  call void @to_bt(i32 -436, i8* %arraydecay), !dbg !493
  %arraydecay1 = getelementptr inbounds [16 x i8], [16 x i8]* %b, i64 0, i64 0, !dbg !494
  %0 = load i8*, i8** %c, align 8, !dbg !495
  %arraydecay2 = getelementptr inbounds [16 x i8], [16 x i8]* %t, i64 0, i64 0, !dbg !496
  call void @subtract(i8* %arraydecay1, i8* %0, i8* %arraydecay2), !dbg !497
  %1 = load i8*, i8** %a, align 8, !dbg !498
  %arraydecay3 = getelementptr inbounds [16 x i8], [16 x i8]* %t, i64 0, i64 0, !dbg !499
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %d, i64 0, i64 0, !dbg !500
  call void @mult(i8* %1, i8* %arraydecay3, i8* %arraydecay4), !dbg !501
  %2 = load i8*, i8** %a, align 8, !dbg !502
  %3 = load i8*, i8** %a, align 8, !dbg !503
  %call = call i32 @from_bt(i8* %3), !dbg !504
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i64 0, i64 0), i8* %2, i32 %call), !dbg !505
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %b, i64 0, i64 0, !dbg !506
  %arraydecay7 = getelementptr inbounds [16 x i8], [16 x i8]* %b, i64 0, i64 0, !dbg !507
  %call8 = call i32 @from_bt(i8* %arraydecay7), !dbg !508
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i64 0, i64 0), i8* %arraydecay6, i32 %call8), !dbg !509
  %4 = load i8*, i8** %c, align 8, !dbg !510
  %5 = load i8*, i8** %c, align 8, !dbg !511
  %call10 = call i32 @from_bt(i8* %5), !dbg !512
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i64 0, i64 0), i8* %4, i32 %call10), !dbg !513
  %arraydecay12 = getelementptr inbounds [16 x i8], [16 x i8]* %d, i64 0, i64 0, !dbg !514
  %arraydecay13 = getelementptr inbounds [16 x i8], [16 x i8]* %d, i64 0, i64 0, !dbg !515
  %call14 = call i32 @from_bt(i8* %arraydecay13), !dbg !516
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6, i64 0, i64 0), i8* %arraydecay12, i32 %call14), !dbg !517
  ret i32 0, !dbg !518
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
!9 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !10, retainedTypes: !11, globals: !13, splitDebugInlining: false, nameTableKind: None)
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
!23 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!24 = distinct !DISubprogram(name: "reverse", scope: !3, file: !3, line: 4, type: !25, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !7}
!27 = !DILocalVariable(name: "p", arg: 1, scope: !24, file: !3, line: 4, type: !7)
!28 = !DILocation(line: 4, column: 20, scope: !24)
!29 = !DILocalVariable(name: "len", scope: !24, file: !3, line: 5, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !31, line: 46, baseType: !32)
!31 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
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
!82 = !DILocation(line: 24, column: 15, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !3, line: 23, column: 20)
!84 = !DILocation(line: 25, column: 9, scope: !83)
!85 = !DILocation(line: 27, column: 18, scope: !74)
!86 = !DILocation(line: 27, column: 16, scope: !74)
!87 = !DILocation(line: 27, column: 10, scope: !74)
!88 = !DILocation(line: 27, column: 14, scope: !74)
!89 = !DILocation(line: 28, column: 11, scope: !74)
!90 = !DILocation(line: 28, column: 18, scope: !74)
!91 = !DILocation(line: 30, column: 16, scope: !74)
!92 = !DILocation(line: 30, column: 14, scope: !74)
!93 = !DILocation(line: 30, column: 11, scope: !74)
!94 = !DILocation(line: 31, column: 11, scope: !74)
!95 = distinct !{!95, !71, !96}
!96 = !DILocation(line: 32, column: 5, scope: !2)
!97 = !DILocation(line: 34, column: 13, scope: !2)
!98 = !DILocation(line: 34, column: 5, scope: !2)
!99 = !DILocation(line: 35, column: 1, scope: !2)
!100 = distinct !DISubprogram(name: "from_bt", scope: !3, file: !3, line: 37, type: !101, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!101 = !DISubroutineType(types: !102)
!102 = !{!6, !103}
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !8)
!105 = !DILocalVariable(name: "a", arg: 1, scope: !100, file: !3, line: 37, type: !103)
!106 = !DILocation(line: 37, column: 25, scope: !100)
!107 = !DILocalVariable(name: "n", scope: !100, file: !3, line: 38, type: !6)
!108 = !DILocation(line: 38, column: 9, scope: !100)
!109 = !DILocation(line: 40, column: 5, scope: !100)
!110 = !DILocation(line: 40, column: 13, scope: !100)
!111 = !DILocation(line: 40, column: 12, scope: !100)
!112 = !DILocation(line: 40, column: 15, scope: !100)
!113 = !DILocation(line: 41, column: 11, scope: !114)
!114 = distinct !DILexicalBlock(scope: !100, file: !3, line: 40, column: 24)
!115 = !DILocation(line: 42, column: 14, scope: !116)
!116 = distinct !DILexicalBlock(scope: !114, file: !3, line: 42, column: 13)
!117 = !DILocation(line: 42, column: 13, scope: !116)
!118 = !DILocation(line: 42, column: 16, scope: !116)
!119 = !DILocation(line: 42, column: 13, scope: !114)
!120 = !DILocation(line: 43, column: 14, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !3, line: 42, column: 24)
!122 = !DILocation(line: 44, column: 9, scope: !121)
!123 = !DILocation(line: 44, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !116, file: !3, line: 44, column: 20)
!125 = !DILocation(line: 44, column: 20, scope: !124)
!126 = !DILocation(line: 44, column: 23, scope: !124)
!127 = !DILocation(line: 44, column: 20, scope: !116)
!128 = !DILocation(line: 45, column: 14, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !3, line: 44, column: 31)
!130 = !DILocation(line: 46, column: 9, scope: !129)
!131 = !DILocation(line: 47, column: 10, scope: !114)
!132 = distinct !{!132, !109, !133}
!133 = !DILocation(line: 48, column: 5, scope: !100)
!134 = !DILocation(line: 50, column: 12, scope: !100)
!135 = !DILocation(line: 50, column: 5, scope: !100)
!136 = distinct !DISubprogram(name: "last_char", scope: !3, file: !3, line: 53, type: !137, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!137 = !DISubroutineType(types: !138)
!138 = !{!8, !7}
!139 = !DILocalVariable(name: "ptr", arg: 1, scope: !136, file: !3, line: 53, type: !7)
!140 = !DILocation(line: 53, column: 22, scope: !136)
!141 = !DILocalVariable(name: "c", scope: !136, file: !3, line: 54, type: !8)
!142 = !DILocation(line: 54, column: 10, scope: !136)
!143 = !DILocation(line: 56, column: 9, scope: !144)
!144 = distinct !DILexicalBlock(scope: !136, file: !3, line: 56, column: 9)
!145 = !DILocation(line: 56, column: 13, scope: !144)
!146 = !DILocation(line: 56, column: 21, scope: !144)
!147 = !DILocation(line: 56, column: 25, scope: !144)
!148 = !DILocation(line: 56, column: 24, scope: !144)
!149 = !DILocation(line: 56, column: 29, scope: !144)
!150 = !DILocation(line: 56, column: 9, scope: !136)
!151 = !DILocation(line: 57, column: 9, scope: !152)
!152 = distinct !DILexicalBlock(scope: !144, file: !3, line: 56, column: 38)
!153 = !DILocation(line: 60, column: 5, scope: !136)
!154 = !DILocation(line: 60, column: 13, scope: !136)
!155 = !DILocation(line: 60, column: 12, scope: !136)
!156 = !DILocation(line: 60, column: 17, scope: !136)
!157 = !DILocation(line: 61, column: 12, scope: !158)
!158 = distinct !DILexicalBlock(scope: !136, file: !3, line: 60, column: 26)
!159 = distinct !{!159, !153, !160}
!160 = !DILocation(line: 62, column: 5, scope: !136)
!161 = !DILocation(line: 63, column: 8, scope: !136)
!162 = !DILocation(line: 65, column: 10, scope: !136)
!163 = !DILocation(line: 65, column: 9, scope: !136)
!164 = !DILocation(line: 65, column: 7, scope: !136)
!165 = !DILocation(line: 66, column: 6, scope: !136)
!166 = !DILocation(line: 66, column: 10, scope: !136)
!167 = !DILocation(line: 67, column: 12, scope: !136)
!168 = !DILocation(line: 67, column: 5, scope: !136)
!169 = !DILocation(line: 68, column: 1, scope: !136)
!170 = distinct !DISubprogram(name: "add", scope: !3, file: !3, line: 70, type: !171, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!171 = !DISubroutineType(types: !172)
!172 = !{null, !103, !103, !7}
!173 = !DILocalVariable(name: "b1", arg: 1, scope: !170, file: !3, line: 70, type: !103)
!174 = !DILocation(line: 70, column: 22, scope: !170)
!175 = !DILocalVariable(name: "b2", arg: 2, scope: !170, file: !3, line: 70, type: !103)
!176 = !DILocation(line: 70, column: 38, scope: !170)
!177 = !DILocalVariable(name: "out", arg: 3, scope: !170, file: !3, line: 70, type: !7)
!178 = !DILocation(line: 70, column: 48, scope: !170)
!179 = !DILocation(line: 71, column: 10, scope: !180)
!180 = distinct !DILexicalBlock(scope: !170, file: !3, line: 71, column: 9)
!181 = !DILocation(line: 71, column: 9, scope: !180)
!182 = !DILocation(line: 71, column: 13, scope: !180)
!183 = !DILocation(line: 71, column: 21, scope: !180)
!184 = !DILocation(line: 71, column: 25, scope: !180)
!185 = !DILocation(line: 71, column: 24, scope: !180)
!186 = !DILocation(line: 71, column: 28, scope: !180)
!187 = !DILocation(line: 71, column: 9, scope: !170)
!188 = !DILocalVariable(name: "c1", scope: !189, file: !3, line: 72, type: !190)
!189 = distinct !DILexicalBlock(scope: !180, file: !3, line: 71, column: 37)
!190 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 128, elements: !191)
!191 = !{!192}
!192 = !DISubrange(count: 16)
!193 = !DILocation(line: 72, column: 14, scope: !189)
!194 = !DILocalVariable(name: "c2", scope: !189, file: !3, line: 73, type: !190)
!195 = !DILocation(line: 73, column: 14, scope: !189)
!196 = !DILocalVariable(name: "ob1", scope: !189, file: !3, line: 74, type: !190)
!197 = !DILocation(line: 74, column: 14, scope: !189)
!198 = !DILocalVariable(name: "ob2", scope: !189, file: !3, line: 75, type: !190)
!199 = !DILocation(line: 75, column: 14, scope: !189)
!200 = !DILocalVariable(name: "d", scope: !189, file: !3, line: 76, type: !19)
!201 = !DILocation(line: 76, column: 14, scope: !189)
!202 = !DILocalVariable(name: "L1", scope: !189, file: !3, line: 77, type: !8)
!203 = !DILocation(line: 77, column: 14, scope: !189)
!204 = !DILocalVariable(name: "L2", scope: !189, file: !3, line: 77, type: !8)
!205 = !DILocation(line: 77, column: 18, scope: !189)
!206 = !DILocation(line: 79, column: 16, scope: !189)
!207 = !DILocation(line: 79, column: 20, scope: !189)
!208 = !DILocation(line: 79, column: 9, scope: !189)
!209 = !DILocation(line: 80, column: 16, scope: !189)
!210 = !DILocation(line: 80, column: 20, scope: !189)
!211 = !DILocation(line: 80, column: 9, scope: !189)
!212 = !DILocation(line: 81, column: 24, scope: !189)
!213 = !DILocation(line: 81, column: 14, scope: !189)
!214 = !DILocation(line: 81, column: 12, scope: !189)
!215 = !DILocation(line: 82, column: 24, scope: !189)
!216 = !DILocation(line: 82, column: 14, scope: !189)
!217 = !DILocation(line: 82, column: 12, scope: !189)
!218 = !DILocation(line: 83, column: 13, scope: !219)
!219 = distinct !DILexicalBlock(scope: !189, file: !3, line: 83, column: 13)
!220 = !DILocation(line: 83, column: 18, scope: !219)
!221 = !DILocation(line: 83, column: 16, scope: !219)
!222 = !DILocation(line: 83, column: 13, scope: !189)
!223 = !DILocation(line: 84, column: 19, scope: !224)
!224 = distinct !DILexicalBlock(scope: !219, file: !3, line: 83, column: 22)
!225 = !DILocation(line: 84, column: 16, scope: !224)
!226 = !DILocation(line: 85, column: 19, scope: !224)
!227 = !DILocation(line: 85, column: 16, scope: !224)
!228 = !DILocation(line: 86, column: 19, scope: !224)
!229 = !DILocation(line: 86, column: 16, scope: !224)
!230 = !DILocation(line: 87, column: 9, scope: !224)
!231 = !DILocation(line: 89, column: 13, scope: !232)
!232 = distinct !DILexicalBlock(scope: !189, file: !3, line: 89, column: 13)
!233 = !DILocation(line: 89, column: 16, scope: !232)
!234 = !DILocation(line: 89, column: 13, scope: !189)
!235 = !DILocation(line: 90, column: 17, scope: !236)
!236 = distinct !DILexicalBlock(scope: !237, file: !3, line: 90, column: 17)
!237 = distinct !DILexicalBlock(scope: !232, file: !3, line: 89, column: 24)
!238 = !DILocation(line: 90, column: 20, scope: !236)
!239 = !DILocation(line: 90, column: 17, scope: !237)
!240 = !DILocation(line: 91, column: 17, scope: !241)
!241 = distinct !DILexicalBlock(scope: !236, file: !3, line: 90, column: 28)
!242 = !DILocation(line: 91, column: 22, scope: !241)
!243 = !DILocation(line: 92, column: 13, scope: !241)
!244 = !DILocation(line: 93, column: 17, scope: !245)
!245 = distinct !DILexicalBlock(scope: !237, file: !3, line: 93, column: 17)
!246 = !DILocation(line: 93, column: 20, scope: !245)
!247 = !DILocation(line: 93, column: 17, scope: !237)
!248 = !DILocation(line: 94, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !245, file: !3, line: 93, column: 28)
!250 = !DILocation(line: 94, column: 22, scope: !249)
!251 = !DILocation(line: 95, column: 17, scope: !249)
!252 = !DILocation(line: 95, column: 22, scope: !249)
!253 = !DILocation(line: 96, column: 13, scope: !249)
!254 = !DILocation(line: 97, column: 9, scope: !237)
!255 = !DILocation(line: 98, column: 13, scope: !256)
!256 = distinct !DILexicalBlock(scope: !189, file: !3, line: 98, column: 13)
!257 = !DILocation(line: 98, column: 16, scope: !256)
!258 = !DILocation(line: 98, column: 13, scope: !189)
!259 = !DILocation(line: 99, column: 17, scope: !260)
!260 = distinct !DILexicalBlock(scope: !261, file: !3, line: 99, column: 17)
!261 = distinct !DILexicalBlock(scope: !256, file: !3, line: 98, column: 24)
!262 = !DILocation(line: 99, column: 20, scope: !260)
!263 = !DILocation(line: 99, column: 17, scope: !261)
!264 = !DILocation(line: 100, column: 17, scope: !265)
!265 = distinct !DILexicalBlock(scope: !260, file: !3, line: 99, column: 28)
!266 = !DILocation(line: 100, column: 22, scope: !265)
!267 = !DILocation(line: 101, column: 13, scope: !265)
!268 = !DILocation(line: 102, column: 17, scope: !269)
!269 = distinct !DILexicalBlock(scope: !261, file: !3, line: 102, column: 17)
!270 = !DILocation(line: 102, column: 20, scope: !269)
!271 = !DILocation(line: 102, column: 17, scope: !261)
!272 = !DILocation(line: 103, column: 17, scope: !273)
!273 = distinct !DILexicalBlock(scope: !269, file: !3, line: 102, column: 28)
!274 = !DILocation(line: 103, column: 22, scope: !273)
!275 = !DILocation(line: 104, column: 13, scope: !273)
!276 = !DILocation(line: 105, column: 17, scope: !277)
!277 = distinct !DILexicalBlock(scope: !261, file: !3, line: 105, column: 17)
!278 = !DILocation(line: 105, column: 20, scope: !277)
!279 = !DILocation(line: 105, column: 17, scope: !261)
!280 = !DILocation(line: 106, column: 17, scope: !281)
!281 = distinct !DILexicalBlock(scope: !277, file: !3, line: 105, column: 28)
!282 = !DILocation(line: 106, column: 22, scope: !281)
!283 = !DILocation(line: 107, column: 17, scope: !281)
!284 = !DILocation(line: 107, column: 22, scope: !281)
!285 = !DILocation(line: 108, column: 13, scope: !281)
!286 = !DILocation(line: 109, column: 9, scope: !261)
!287 = !DILocation(line: 110, column: 13, scope: !288)
!288 = distinct !DILexicalBlock(scope: !189, file: !3, line: 110, column: 13)
!289 = !DILocation(line: 110, column: 16, scope: !288)
!290 = !DILocation(line: 110, column: 13, scope: !189)
!291 = !DILocation(line: 111, column: 17, scope: !292)
!292 = distinct !DILexicalBlock(scope: !293, file: !3, line: 111, column: 17)
!293 = distinct !DILexicalBlock(scope: !288, file: !3, line: 110, column: 24)
!294 = !DILocation(line: 111, column: 20, scope: !292)
!295 = !DILocation(line: 111, column: 17, scope: !293)
!296 = !DILocation(line: 112, column: 17, scope: !297)
!297 = distinct !DILexicalBlock(scope: !292, file: !3, line: 111, column: 28)
!298 = !DILocation(line: 112, column: 22, scope: !297)
!299 = !DILocation(line: 113, column: 13, scope: !297)
!300 = !DILocation(line: 114, column: 9, scope: !293)
!301 = !DILocation(line: 116, column: 13, scope: !189)
!302 = !DILocation(line: 116, column: 18, scope: !189)
!303 = !DILocation(line: 116, column: 24, scope: !189)
!304 = !DILocation(line: 116, column: 9, scope: !189)
!305 = !DILocation(line: 117, column: 13, scope: !189)
!306 = !DILocation(line: 117, column: 18, scope: !189)
!307 = !DILocation(line: 117, column: 22, scope: !189)
!308 = !DILocation(line: 117, column: 9, scope: !189)
!309 = !DILocation(line: 118, column: 16, scope: !189)
!310 = !DILocation(line: 118, column: 21, scope: !189)
!311 = !DILocation(line: 118, column: 9, scope: !189)
!312 = !DILocation(line: 120, column: 9, scope: !189)
!313 = !DILocation(line: 120, column: 14, scope: !189)
!314 = !DILocation(line: 121, column: 16, scope: !189)
!315 = !DILocation(line: 121, column: 21, scope: !189)
!316 = !DILocation(line: 121, column: 9, scope: !189)
!317 = !DILocation(line: 122, column: 5, scope: !189)
!318 = !DILocation(line: 122, column: 17, scope: !319)
!319 = distinct !DILexicalBlock(scope: !180, file: !3, line: 122, column: 16)
!320 = !DILocation(line: 122, column: 16, scope: !319)
!321 = !DILocation(line: 122, column: 20, scope: !319)
!322 = !DILocation(line: 122, column: 16, scope: !180)
!323 = !DILocation(line: 123, column: 16, scope: !324)
!324 = distinct !DILexicalBlock(scope: !319, file: !3, line: 122, column: 29)
!325 = !DILocation(line: 123, column: 21, scope: !324)
!326 = !DILocation(line: 123, column: 9, scope: !324)
!327 = !DILocation(line: 124, column: 5, scope: !324)
!328 = !DILocation(line: 124, column: 17, scope: !329)
!329 = distinct !DILexicalBlock(scope: !319, file: !3, line: 124, column: 16)
!330 = !DILocation(line: 124, column: 16, scope: !329)
!331 = !DILocation(line: 124, column: 20, scope: !329)
!332 = !DILocation(line: 124, column: 16, scope: !319)
!333 = !DILocation(line: 125, column: 16, scope: !334)
!334 = distinct !DILexicalBlock(scope: !329, file: !3, line: 124, column: 29)
!335 = !DILocation(line: 125, column: 21, scope: !334)
!336 = !DILocation(line: 125, column: 9, scope: !334)
!337 = !DILocation(line: 126, column: 5, scope: !334)
!338 = !DILocation(line: 127, column: 10, scope: !339)
!339 = distinct !DILexicalBlock(scope: !329, file: !3, line: 126, column: 12)
!340 = !DILocation(line: 127, column: 14, scope: !339)
!341 = !DILocation(line: 129, column: 1, scope: !170)
!342 = distinct !DISubprogram(name: "unary_minus", scope: !3, file: !3, line: 131, type: !343, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!343 = !DISubroutineType(types: !344)
!344 = !{null, !103, !7}
!345 = !DILocalVariable(name: "b", arg: 1, scope: !342, file: !3, line: 131, type: !103)
!346 = !DILocation(line: 131, column: 30, scope: !342)
!347 = !DILocalVariable(name: "out", arg: 2, scope: !342, file: !3, line: 131, type: !7)
!348 = !DILocation(line: 131, column: 39, scope: !342)
!349 = !DILocation(line: 132, column: 5, scope: !342)
!350 = !DILocation(line: 132, column: 13, scope: !342)
!351 = !DILocation(line: 132, column: 12, scope: !342)
!352 = !DILocation(line: 132, column: 15, scope: !342)
!353 = !DILocation(line: 133, column: 14, scope: !354)
!354 = distinct !DILexicalBlock(scope: !355, file: !3, line: 133, column: 13)
!355 = distinct !DILexicalBlock(scope: !342, file: !3, line: 132, column: 24)
!356 = !DILocation(line: 133, column: 13, scope: !354)
!357 = !DILocation(line: 133, column: 16, scope: !354)
!358 = !DILocation(line: 133, column: 13, scope: !355)
!359 = !DILocation(line: 134, column: 17, scope: !360)
!360 = distinct !DILexicalBlock(scope: !354, file: !3, line: 133, column: 24)
!361 = !DILocation(line: 134, column: 20, scope: !360)
!362 = !DILocation(line: 135, column: 14, scope: !360)
!363 = !DILocation(line: 136, column: 9, scope: !360)
!364 = !DILocation(line: 136, column: 21, scope: !365)
!365 = distinct !DILexicalBlock(scope: !354, file: !3, line: 136, column: 20)
!366 = !DILocation(line: 136, column: 20, scope: !365)
!367 = !DILocation(line: 136, column: 23, scope: !365)
!368 = !DILocation(line: 136, column: 20, scope: !354)
!369 = !DILocation(line: 137, column: 17, scope: !370)
!370 = distinct !DILexicalBlock(scope: !365, file: !3, line: 136, column: 31)
!371 = !DILocation(line: 137, column: 20, scope: !370)
!372 = !DILocation(line: 138, column: 14, scope: !370)
!373 = !DILocation(line: 139, column: 9, scope: !370)
!374 = !DILocation(line: 140, column: 24, scope: !375)
!375 = distinct !DILexicalBlock(scope: !365, file: !3, line: 139, column: 16)
!376 = !DILocation(line: 140, column: 22, scope: !375)
!377 = !DILocation(line: 140, column: 17, scope: !375)
!378 = !DILocation(line: 140, column: 20, scope: !375)
!379 = distinct !{!379, !349, !380}
!380 = !DILocation(line: 142, column: 5, scope: !342)
!381 = !DILocation(line: 143, column: 6, scope: !342)
!382 = !DILocation(line: 143, column: 10, scope: !342)
!383 = !DILocation(line: 144, column: 1, scope: !342)
!384 = distinct !DISubprogram(name: "subtract", scope: !3, file: !3, line: 146, type: !171, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!385 = !DILocalVariable(name: "b1", arg: 1, scope: !384, file: !3, line: 146, type: !103)
!386 = !DILocation(line: 146, column: 27, scope: !384)
!387 = !DILocalVariable(name: "b2", arg: 2, scope: !384, file: !3, line: 146, type: !103)
!388 = !DILocation(line: 146, column: 43, scope: !384)
!389 = !DILocalVariable(name: "out", arg: 3, scope: !384, file: !3, line: 146, type: !7)
!390 = !DILocation(line: 146, column: 53, scope: !384)
!391 = !DILocalVariable(name: "buf", scope: !384, file: !3, line: 147, type: !190)
!392 = !DILocation(line: 147, column: 10, scope: !384)
!393 = !DILocation(line: 148, column: 17, scope: !384)
!394 = !DILocation(line: 148, column: 21, scope: !384)
!395 = !DILocation(line: 148, column: 5, scope: !384)
!396 = !DILocation(line: 149, column: 9, scope: !384)
!397 = !DILocation(line: 149, column: 13, scope: !384)
!398 = !DILocation(line: 149, column: 18, scope: !384)
!399 = !DILocation(line: 149, column: 5, scope: !384)
!400 = !DILocation(line: 150, column: 1, scope: !384)
!401 = distinct !DISubprogram(name: "mult", scope: !3, file: !3, line: 152, type: !171, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!402 = !DILocalVariable(name: "b1", arg: 1, scope: !401, file: !3, line: 152, type: !103)
!403 = !DILocation(line: 152, column: 23, scope: !401)
!404 = !DILocalVariable(name: "b2", arg: 2, scope: !401, file: !3, line: 152, type: !103)
!405 = !DILocation(line: 152, column: 39, scope: !401)
!406 = !DILocalVariable(name: "out", arg: 3, scope: !401, file: !3, line: 152, type: !7)
!407 = !DILocation(line: 152, column: 49, scope: !401)
!408 = !DILocalVariable(name: "r", scope: !401, file: !3, line: 153, type: !190)
!409 = !DILocation(line: 153, column: 10, scope: !401)
!410 = !DILocalVariable(name: "t", scope: !401, file: !3, line: 154, type: !190)
!411 = !DILocation(line: 154, column: 10, scope: !401)
!412 = !DILocalVariable(name: "c1", scope: !401, file: !3, line: 155, type: !190)
!413 = !DILocation(line: 155, column: 10, scope: !401)
!414 = !DILocalVariable(name: "c2", scope: !401, file: !3, line: 156, type: !190)
!415 = !DILocation(line: 156, column: 10, scope: !401)
!416 = !DILocalVariable(name: "ptr", scope: !401, file: !3, line: 157, type: !7)
!417 = !DILocation(line: 157, column: 11, scope: !401)
!418 = !DILocation(line: 157, column: 17, scope: !401)
!419 = !DILocation(line: 159, column: 12, scope: !401)
!420 = !DILocation(line: 159, column: 16, scope: !401)
!421 = !DILocation(line: 159, column: 5, scope: !401)
!422 = !DILocation(line: 160, column: 12, scope: !401)
!423 = !DILocation(line: 160, column: 16, scope: !401)
!424 = !DILocation(line: 160, column: 5, scope: !401)
!425 = !DILocation(line: 162, column: 13, scope: !401)
!426 = !DILocation(line: 162, column: 5, scope: !401)
!427 = !DILocation(line: 164, column: 5, scope: !401)
!428 = !DILocation(line: 164, column: 13, scope: !401)
!429 = !DILocation(line: 164, column: 12, scope: !401)
!430 = !DILocation(line: 164, column: 17, scope: !401)
!431 = !DILocation(line: 165, column: 14, scope: !432)
!432 = distinct !DILexicalBlock(scope: !433, file: !3, line: 165, column: 13)
!433 = distinct !DILexicalBlock(scope: !401, file: !3, line: 164, column: 26)
!434 = !DILocation(line: 165, column: 13, scope: !432)
!435 = !DILocation(line: 165, column: 18, scope: !432)
!436 = !DILocation(line: 165, column: 13, scope: !433)
!437 = !DILocation(line: 166, column: 17, scope: !438)
!438 = distinct !DILexicalBlock(scope: !432, file: !3, line: 165, column: 26)
!439 = !DILocation(line: 166, column: 20, scope: !438)
!440 = !DILocation(line: 166, column: 24, scope: !438)
!441 = !DILocation(line: 166, column: 13, scope: !438)
!442 = !DILocation(line: 167, column: 20, scope: !438)
!443 = !DILocation(line: 167, column: 23, scope: !438)
!444 = !DILocation(line: 167, column: 13, scope: !438)
!445 = !DILocation(line: 168, column: 9, scope: !438)
!446 = !DILocation(line: 169, column: 14, scope: !447)
!447 = distinct !DILexicalBlock(scope: !433, file: !3, line: 169, column: 13)
!448 = !DILocation(line: 169, column: 13, scope: !447)
!449 = !DILocation(line: 169, column: 18, scope: !447)
!450 = !DILocation(line: 169, column: 13, scope: !433)
!451 = !DILocation(line: 170, column: 22, scope: !452)
!452 = distinct !DILexicalBlock(scope: !447, file: !3, line: 169, column: 26)
!453 = !DILocation(line: 170, column: 25, scope: !452)
!454 = !DILocation(line: 170, column: 29, scope: !452)
!455 = !DILocation(line: 170, column: 13, scope: !452)
!456 = !DILocation(line: 171, column: 20, scope: !452)
!457 = !DILocation(line: 171, column: 23, scope: !452)
!458 = !DILocation(line: 171, column: 13, scope: !452)
!459 = !DILocation(line: 172, column: 9, scope: !452)
!460 = !DILocation(line: 173, column: 16, scope: !433)
!461 = !DILocation(line: 173, column: 9, scope: !433)
!462 = !DILocation(line: 175, column: 12, scope: !433)
!463 = distinct !{!463, !427, !464}
!464 = !DILocation(line: 176, column: 5, scope: !401)
!465 = !DILocation(line: 178, column: 11, scope: !401)
!466 = !DILocation(line: 178, column: 9, scope: !401)
!467 = !DILocation(line: 179, column: 5, scope: !401)
!468 = !DILocation(line: 179, column: 13, scope: !401)
!469 = !DILocation(line: 179, column: 12, scope: !401)
!470 = !DILocation(line: 179, column: 17, scope: !401)
!471 = !DILocation(line: 180, column: 12, scope: !472)
!472 = distinct !DILexicalBlock(scope: !401, file: !3, line: 179, column: 25)
!473 = distinct !{!473, !467, !474}
!474 = !DILocation(line: 181, column: 5, scope: !401)
!475 = !DILocation(line: 182, column: 12, scope: !401)
!476 = !DILocation(line: 182, column: 17, scope: !401)
!477 = !DILocation(line: 182, column: 5, scope: !401)
!478 = !DILocation(line: 183, column: 1, scope: !401)
!479 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 185, type: !480, scopeLine: 185, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!480 = !DISubroutineType(types: !481)
!481 = !{!6}
!482 = !DILocalVariable(name: "a", scope: !479, file: !3, line: 186, type: !103)
!483 = !DILocation(line: 186, column: 17, scope: !479)
!484 = !DILocalVariable(name: "b", scope: !479, file: !3, line: 187, type: !190)
!485 = !DILocation(line: 187, column: 10, scope: !479)
!486 = !DILocalVariable(name: "c", scope: !479, file: !3, line: 188, type: !103)
!487 = !DILocation(line: 188, column: 17, scope: !479)
!488 = !DILocalVariable(name: "t", scope: !479, file: !3, line: 189, type: !190)
!489 = !DILocation(line: 189, column: 10, scope: !479)
!490 = !DILocalVariable(name: "d", scope: !479, file: !3, line: 190, type: !190)
!491 = !DILocation(line: 190, column: 10, scope: !479)
!492 = !DILocation(line: 192, column: 17, scope: !479)
!493 = !DILocation(line: 192, column: 5, scope: !479)
!494 = !DILocation(line: 193, column: 14, scope: !479)
!495 = !DILocation(line: 193, column: 17, scope: !479)
!496 = !DILocation(line: 193, column: 20, scope: !479)
!497 = !DILocation(line: 193, column: 5, scope: !479)
!498 = !DILocation(line: 194, column: 10, scope: !479)
!499 = !DILocation(line: 194, column: 13, scope: !479)
!500 = !DILocation(line: 194, column: 16, scope: !479)
!501 = !DILocation(line: 194, column: 5, scope: !479)
!502 = !DILocation(line: 196, column: 36, scope: !479)
!503 = !DILocation(line: 196, column: 47, scope: !479)
!504 = !DILocation(line: 196, column: 39, scope: !479)
!505 = !DILocation(line: 196, column: 5, scope: !479)
!506 = !DILocation(line: 197, column: 36, scope: !479)
!507 = !DILocation(line: 197, column: 47, scope: !479)
!508 = !DILocation(line: 197, column: 39, scope: !479)
!509 = !DILocation(line: 197, column: 5, scope: !479)
!510 = !DILocation(line: 198, column: 36, scope: !479)
!511 = !DILocation(line: 198, column: 47, scope: !479)
!512 = !DILocation(line: 198, column: 39, scope: !479)
!513 = !DILocation(line: 198, column: 5, scope: !479)
!514 = !DILocation(line: 199, column: 36, scope: !479)
!515 = !DILocation(line: 199, column: 47, scope: !479)
!516 = !DILocation(line: 199, column: 39, scope: !479)
!517 = !DILocation(line: 199, column: 5, scope: !479)
!518 = !DILocation(line: 201, column: 5, scope: !479)
