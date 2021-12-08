; ModuleID = 'balanced-ternary.ll'
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
  call void @llvm.dbg.value(metadata i8* %p, metadata !27, metadata !DIExpression()), !dbg !28
  %call = call i64 @strlen(i8* %p) #6, !dbg !29
  call void @llvm.dbg.value(metadata i64 %call, metadata !30, metadata !DIExpression()), !dbg !28
  %add.ptr = getelementptr inbounds i8, i8* %p, i64 %call, !dbg !34
  %add.ptr1 = getelementptr inbounds i8, i8* %add.ptr, i64 -1, !dbg !35
  call void @llvm.dbg.value(metadata i8* %add.ptr1, metadata !36, metadata !DIExpression()), !dbg !28
  br label %while.cond, !dbg !37

while.cond:                                       ; preds = %while.body, %entry
  %r.0 = phi i8* [ %add.ptr1, %entry ], [ %incdec.ptr, %while.body ], !dbg !28
  %p.addr.0 = phi i8* [ %p, %entry ], [ %incdec.ptr9, %while.body ]
  call void @llvm.dbg.value(metadata i8* %p.addr.0, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i8* %r.0, metadata !36, metadata !DIExpression()), !dbg !28
  %cmp = icmp ult i8* %p.addr.0, %r.0, !dbg !38
  br i1 %cmp, label %while.body, label %while.end, !dbg !37

while.body:                                       ; preds = %while.cond
  %0 = load i8, i8* %r.0, align 1, !dbg !39
  %conv = sext i8 %0 to i32, !dbg !39
  %1 = load i8, i8* %p.addr.0, align 1, !dbg !41
  %conv2 = sext i8 %1 to i32, !dbg !41
  %xor = xor i32 %conv2, %conv, !dbg !41
  %conv3 = trunc i32 %xor to i8, !dbg !41
  store i8 %conv3, i8* %p.addr.0, align 1, !dbg !41
  %2 = load i8, i8* %p.addr.0, align 1, !dbg !42
  %conv4 = sext i8 %2 to i32, !dbg !42
  %3 = load i8, i8* %r.0, align 1, !dbg !43
  %conv5 = sext i8 %3 to i32, !dbg !43
  %xor6 = xor i32 %conv5, %conv4, !dbg !43
  %conv7 = trunc i32 %xor6 to i8, !dbg !43
  store i8 %conv7, i8* %r.0, align 1, !dbg !43
  %incdec.ptr = getelementptr inbounds i8, i8* %r.0, i32 -1, !dbg !44
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !36, metadata !DIExpression()), !dbg !28
  %4 = load i8, i8* %r.0, align 1, !dbg !45
  %conv8 = sext i8 %4 to i32, !dbg !45
  %incdec.ptr9 = getelementptr inbounds i8, i8* %p.addr.0, i32 1, !dbg !46
  call void @llvm.dbg.value(metadata i8* %incdec.ptr9, metadata !27, metadata !DIExpression()), !dbg !28
  %5 = load i8, i8* %p.addr.0, align 1, !dbg !47
  %conv10 = sext i8 %5 to i32, !dbg !47
  %xor11 = xor i32 %conv10, %conv8, !dbg !47
  %conv12 = trunc i32 %xor11 to i8, !dbg !47
  store i8 %conv12, i8* %p.addr.0, align 1, !dbg !47
  br label %while.cond, !dbg !37, !llvm.loop !48

while.end:                                        ; preds = %while.cond
  ret void, !dbg !50
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @to_bt(i32 %n, i8* %b) #0 !dbg !2 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i8* %b, metadata !53, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i8* %b, metadata !54, metadata !DIExpression()), !dbg !52
  store i8 0, i8* %b, align 1, !dbg !55
  br label %while.cond, !dbg !56

while.cond:                                       ; preds = %if.end, %entry
  %ptr.0 = phi i8* [ %b, %entry ], [ %incdec.ptr, %if.end ], !dbg !52
  %n.addr.0 = phi i32 [ %n, %entry ], [ %div, %if.end ]
  call void @llvm.dbg.value(metadata i32 %n.addr.0, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i8* %ptr.0, metadata !54, metadata !DIExpression()), !dbg !52
  %tobool = icmp ne i32 %n.addr.0, 0, !dbg !56
  br i1 %tobool, label %while.body, label %while.end, !dbg !56

while.body:                                       ; preds = %while.cond
  %rem = srem i32 %n.addr.0, 3, !dbg !57
  call void @llvm.dbg.value(metadata i32 %rem, metadata !59, metadata !DIExpression()), !dbg !60
  %cmp = icmp slt i32 %rem, 0, !dbg !61
  br i1 %cmp, label %if.then, label %if.end, !dbg !63

if.then:                                          ; preds = %while.body
  %add = add nsw i32 %rem, 3, !dbg !64
  call void @llvm.dbg.value(metadata i32 %add, metadata !59, metadata !DIExpression()), !dbg !60
  br label %if.end, !dbg !66

if.end:                                           ; preds = %if.then, %while.body
  %r.0 = phi i32 [ %add, %if.then ], [ %rem, %while.body ], !dbg !60
  call void @llvm.dbg.value(metadata i32 %r.0, metadata !59, metadata !DIExpression()), !dbg !60
  %idxprom = sext i32 %r.0 to i64, !dbg !67
  %arrayidx = getelementptr inbounds [3 x i8], [3 x i8]* @to_bt.d, i64 0, i64 %idxprom, !dbg !67
  %0 = load i8, i8* %arrayidx, align 1, !dbg !67
  store i8 %0, i8* %ptr.0, align 1, !dbg !68
  %incdec.ptr = getelementptr inbounds i8, i8* %ptr.0, i32 1, !dbg !69
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !54, metadata !DIExpression()), !dbg !52
  store i8 0, i8* %incdec.ptr, align 1, !dbg !70
  %idxprom1 = sext i32 %r.0 to i64, !dbg !71
  %arrayidx2 = getelementptr inbounds [3 x i32], [3 x i32]* @to_bt.v, i64 0, i64 %idxprom1, !dbg !71
  %1 = load i32, i32* %arrayidx2, align 4, !dbg !71
  %sub = sub nsw i32 %n.addr.0, %1, !dbg !72
  call void @llvm.dbg.value(metadata i32 %sub, metadata !51, metadata !DIExpression()), !dbg !52
  %div = sdiv i32 %sub, 3, !dbg !73
  call void @llvm.dbg.value(metadata i32 %div, metadata !51, metadata !DIExpression()), !dbg !52
  br label %while.cond, !dbg !56, !llvm.loop !74

while.end:                                        ; preds = %while.cond
  call void @reverse(i8* %b), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @from_bt(i8* %a) #0 !dbg !78 {
entry:
  call void @llvm.dbg.value(metadata i8* %a, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 0, metadata !85, metadata !DIExpression()), !dbg !84
  br label %while.cond, !dbg !86

while.cond:                                       ; preds = %if.end9, %entry
  %n.0 = phi i32 [ 0, %entry ], [ %n.2, %if.end9 ], !dbg !84
  %a.addr.0 = phi i8* [ %a, %entry ], [ %incdec.ptr, %if.end9 ]
  call void @llvm.dbg.value(metadata i8* %a.addr.0, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !85, metadata !DIExpression()), !dbg !84
  %0 = load i8, i8* %a.addr.0, align 1, !dbg !87
  %conv = sext i8 %0 to i32, !dbg !87
  %cmp = icmp ne i32 %conv, 0, !dbg !88
  br i1 %cmp, label %while.body, label %while.end, !dbg !86

while.body:                                       ; preds = %while.cond
  %mul = mul nsw i32 %n.0, 3, !dbg !89
  call void @llvm.dbg.value(metadata i32 %mul, metadata !85, metadata !DIExpression()), !dbg !84
  %1 = load i8, i8* %a.addr.0, align 1, !dbg !91
  %conv2 = sext i8 %1 to i32, !dbg !91
  %cmp3 = icmp eq i32 %conv2, 43, !dbg !93
  br i1 %cmp3, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %while.body
  %inc = add nsw i32 %mul, 1, !dbg !95
  call void @llvm.dbg.value(metadata i32 %inc, metadata !85, metadata !DIExpression()), !dbg !84
  br label %if.end9, !dbg !97

if.else:                                          ; preds = %while.body
  %2 = load i8, i8* %a.addr.0, align 1, !dbg !98
  %conv5 = sext i8 %2 to i32, !dbg !98
  %cmp6 = icmp eq i32 %conv5, 45, !dbg !100
  br i1 %cmp6, label %if.then8, label %if.end, !dbg !101

if.then8:                                         ; preds = %if.else
  %dec = add nsw i32 %mul, -1, !dbg !102
  call void @llvm.dbg.value(metadata i32 %dec, metadata !85, metadata !DIExpression()), !dbg !84
  br label %if.end, !dbg !104

if.end:                                           ; preds = %if.then8, %if.else
  %n.1 = phi i32 [ %dec, %if.then8 ], [ %mul, %if.else ], !dbg !105
  call void @llvm.dbg.value(metadata i32 %n.1, metadata !85, metadata !DIExpression()), !dbg !84
  br label %if.end9

if.end9:                                          ; preds = %if.end, %if.then
  %n.2 = phi i32 [ %inc, %if.then ], [ %n.1, %if.end ], !dbg !106
  call void @llvm.dbg.value(metadata i32 %n.2, metadata !85, metadata !DIExpression()), !dbg !84
  %incdec.ptr = getelementptr inbounds i8, i8* %a.addr.0, i32 1, !dbg !107
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !83, metadata !DIExpression()), !dbg !84
  br label %while.cond, !dbg !86, !llvm.loop !108

while.end:                                        ; preds = %while.cond
  ret i32 %n.0, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @last_char(i8* %ptr) #0 !dbg !111 {
entry:
  call void @llvm.dbg.value(metadata i8* %ptr, metadata !114, metadata !DIExpression()), !dbg !115
  %cmp = icmp eq i8* %ptr, null, !dbg !116
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !118

lor.lhs.false:                                    ; preds = %entry
  %0 = load i8, i8* %ptr, align 1, !dbg !119
  %conv = sext i8 %0 to i32, !dbg !119
  %cmp1 = icmp eq i32 %conv, 0, !dbg !120
  br i1 %cmp1, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return, !dbg !122

if.end:                                           ; preds = %lor.lhs.false
  br label %while.cond, !dbg !124

while.cond:                                       ; preds = %while.body, %if.end
  %ptr.addr.0 = phi i8* [ %ptr, %if.end ], [ %incdec.ptr, %while.body ]
  call void @llvm.dbg.value(metadata i8* %ptr.addr.0, metadata !114, metadata !DIExpression()), !dbg !115
  %1 = load i8, i8* %ptr.addr.0, align 1, !dbg !125
  %conv3 = sext i8 %1 to i32, !dbg !125
  %cmp4 = icmp ne i32 %conv3, 0, !dbg !126
  br i1 %cmp4, label %while.body, label %while.end, !dbg !124

while.body:                                       ; preds = %while.cond
  %incdec.ptr = getelementptr inbounds i8, i8* %ptr.addr.0, i32 1, !dbg !127
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !114, metadata !DIExpression()), !dbg !115
  br label %while.cond, !dbg !124, !llvm.loop !129

while.end:                                        ; preds = %while.cond
  %incdec.ptr6 = getelementptr inbounds i8, i8* %ptr.addr.0, i32 -1, !dbg !131
  call void @llvm.dbg.value(metadata i8* %incdec.ptr6, metadata !114, metadata !DIExpression()), !dbg !115
  %2 = load i8, i8* %incdec.ptr6, align 1, !dbg !132
  call void @llvm.dbg.value(metadata i8 %2, metadata !133, metadata !DIExpression()), !dbg !115
  store i8 0, i8* %incdec.ptr6, align 1, !dbg !134
  br label %return, !dbg !135

return:                                           ; preds = %while.end, %if.then
  %retval.0 = phi i8 [ 0, %if.then ], [ %2, %while.end ], !dbg !115
  ret i8 %retval.0, !dbg !136
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @add(i8* %b1, i8* %b2, i8* %out) #0 !dbg !137 {
entry:
  %c1 = alloca [16 x i8], align 16
  %c2 = alloca [16 x i8], align 16
  %ob1 = alloca [16 x i8], align 16
  %ob2 = alloca [16 x i8], align 16
  %d = alloca [3 x i8], align 1
  call void @llvm.dbg.value(metadata i8* %b1, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i8* %b2, metadata !142, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i8* %out, metadata !143, metadata !DIExpression()), !dbg !141
  %0 = load i8, i8* %b1, align 1, !dbg !144
  %conv = sext i8 %0 to i32, !dbg !144
  %cmp = icmp ne i32 %conv, 0, !dbg !146
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !147

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %b2, align 1, !dbg !148
  %conv2 = sext i8 %1 to i32, !dbg !148
  %cmp3 = icmp ne i32 %conv2, 0, !dbg !149
  br i1 %cmp3, label %if.then, label %if.else, !dbg !150

if.then:                                          ; preds = %land.lhs.true
  call void @llvm.dbg.declare(metadata [16 x i8]* %c1, metadata !151, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata [16 x i8]* %c2, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata [16 x i8]* %ob1, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata [16 x i8]* %ob2, metadata !161, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata [3 x i8]* %d, metadata !163, metadata !DIExpression()), !dbg !164
  %2 = bitcast [3 x i8]* %d to i8*, !dbg !164
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 0, i64 3, i1 false), !dbg !164
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !165
  %call = call i8* @strcpy(i8* %arraydecay, i8* %b1) #7, !dbg !166
  %arraydecay5 = getelementptr inbounds [16 x i8], [16 x i8]* %c2, i64 0, i64 0, !dbg !167
  %call6 = call i8* @strcpy(i8* %arraydecay5, i8* %b2) #7, !dbg !168
  %arraydecay7 = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !169
  %call8 = call signext i8 @last_char(i8* %arraydecay7), !dbg !170
  call void @llvm.dbg.value(metadata i8 %call8, metadata !171, metadata !DIExpression()), !dbg !172
  %arraydecay9 = getelementptr inbounds [16 x i8], [16 x i8]* %c2, i64 0, i64 0, !dbg !173
  %call10 = call signext i8 @last_char(i8* %arraydecay9), !dbg !174
  call void @llvm.dbg.value(metadata i8 %call10, metadata !175, metadata !DIExpression()), !dbg !172
  %conv11 = sext i8 %call10 to i32, !dbg !176
  %conv12 = sext i8 %call8 to i32, !dbg !178
  %cmp13 = icmp slt i32 %conv11, %conv12, !dbg !179
  br i1 %cmp13, label %if.then15, label %if.end, !dbg !180

if.then15:                                        ; preds = %if.then
  %conv16 = sext i8 %call8 to i32, !dbg !181
  %conv17 = sext i8 %call10 to i32, !dbg !183
  %xor = xor i32 %conv17, %conv16, !dbg !183
  %conv18 = trunc i32 %xor to i8, !dbg !183
  call void @llvm.dbg.value(metadata i8 %conv18, metadata !175, metadata !DIExpression()), !dbg !172
  %conv19 = sext i8 %conv18 to i32, !dbg !184
  %conv20 = sext i8 %call8 to i32, !dbg !185
  %xor21 = xor i32 %conv20, %conv19, !dbg !185
  %conv22 = trunc i32 %xor21 to i8, !dbg !185
  call void @llvm.dbg.value(metadata i8 %conv22, metadata !171, metadata !DIExpression()), !dbg !172
  %conv23 = sext i8 %conv22 to i32, !dbg !186
  %conv24 = sext i8 %conv18 to i32, !dbg !187
  %xor25 = xor i32 %conv24, %conv23, !dbg !187
  %conv26 = trunc i32 %xor25 to i8, !dbg !187
  call void @llvm.dbg.value(metadata i8 %conv26, metadata !175, metadata !DIExpression()), !dbg !172
  br label %if.end, !dbg !188

if.end:                                           ; preds = %if.then15, %if.then
  %L1.0 = phi i8 [ %conv22, %if.then15 ], [ %call8, %if.then ], !dbg !172
  %L2.0 = phi i8 [ %conv26, %if.then15 ], [ %call10, %if.then ], !dbg !172
  call void @llvm.dbg.value(metadata i8 %L2.0, metadata !175, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i8 %L1.0, metadata !171, metadata !DIExpression()), !dbg !172
  %conv27 = sext i8 %L1.0 to i32, !dbg !189
  %cmp28 = icmp eq i32 %conv27, 45, !dbg !191
  br i1 %cmp28, label %if.then30, label %if.end43, !dbg !192

if.then30:                                        ; preds = %if.end
  %conv31 = sext i8 %L2.0 to i32, !dbg !193
  %cmp32 = icmp eq i32 %conv31, 48, !dbg !196
  br i1 %cmp32, label %if.then34, label %if.end35, !dbg !197

if.then34:                                        ; preds = %if.then30
  %arrayidx = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !198
  store i8 45, i8* %arrayidx, align 1, !dbg !200
  br label %if.end35, !dbg !201

if.end35:                                         ; preds = %if.then34, %if.then30
  %conv36 = sext i8 %L2.0 to i32, !dbg !202
  %cmp37 = icmp eq i32 %conv36, 45, !dbg !204
  br i1 %cmp37, label %if.then39, label %if.end42, !dbg !205

if.then39:                                        ; preds = %if.end35
  %arrayidx40 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !206
  store i8 43, i8* %arrayidx40, align 1, !dbg !208
  %arrayidx41 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 1, !dbg !209
  store i8 45, i8* %arrayidx41, align 1, !dbg !210
  br label %if.end42, !dbg !211

if.end42:                                         ; preds = %if.then39, %if.end35
  br label %if.end43, !dbg !212

if.end43:                                         ; preds = %if.end42, %if.end
  %conv44 = sext i8 %L1.0 to i32, !dbg !213
  %cmp45 = icmp eq i32 %conv44, 43, !dbg !215
  br i1 %cmp45, label %if.then47, label %if.end67, !dbg !216

if.then47:                                        ; preds = %if.end43
  %conv48 = sext i8 %L2.0 to i32, !dbg !217
  %cmp49 = icmp eq i32 %conv48, 48, !dbg !220
  br i1 %cmp49, label %if.then51, label %if.end53, !dbg !221

if.then51:                                        ; preds = %if.then47
  %arrayidx52 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !222
  store i8 43, i8* %arrayidx52, align 1, !dbg !224
  br label %if.end53, !dbg !225

if.end53:                                         ; preds = %if.then51, %if.then47
  %conv54 = sext i8 %L2.0 to i32, !dbg !226
  %cmp55 = icmp eq i32 %conv54, 45, !dbg !228
  br i1 %cmp55, label %if.then57, label %if.end59, !dbg !229

if.then57:                                        ; preds = %if.end53
  %arrayidx58 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !230
  store i8 48, i8* %arrayidx58, align 1, !dbg !232
  br label %if.end59, !dbg !233

if.end59:                                         ; preds = %if.then57, %if.end53
  %conv60 = sext i8 %L2.0 to i32, !dbg !234
  %cmp61 = icmp eq i32 %conv60, 43, !dbg !236
  br i1 %cmp61, label %if.then63, label %if.end66, !dbg !237

if.then63:                                        ; preds = %if.end59
  %arrayidx64 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !238
  store i8 45, i8* %arrayidx64, align 1, !dbg !240
  %arrayidx65 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 1, !dbg !241
  store i8 43, i8* %arrayidx65, align 1, !dbg !242
  br label %if.end66, !dbg !243

if.end66:                                         ; preds = %if.then63, %if.end59
  br label %if.end67, !dbg !244

if.end67:                                         ; preds = %if.end66, %if.end43
  %conv68 = sext i8 %L1.0 to i32, !dbg !245
  %cmp69 = icmp eq i32 %conv68, 48, !dbg !247
  br i1 %cmp69, label %if.then71, label %if.end78, !dbg !248

if.then71:                                        ; preds = %if.end67
  %conv72 = sext i8 %L2.0 to i32, !dbg !249
  %cmp73 = icmp eq i32 %conv72, 48, !dbg !252
  br i1 %cmp73, label %if.then75, label %if.end77, !dbg !253

if.then75:                                        ; preds = %if.then71
  %arrayidx76 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !254
  store i8 48, i8* %arrayidx76, align 1, !dbg !256
  br label %if.end77, !dbg !257

if.end77:                                         ; preds = %if.then75, %if.then71
  br label %if.end78, !dbg !258

if.end78:                                         ; preds = %if.end77, %if.end67
  %arraydecay79 = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !259
  %arrayidx80 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 1, !dbg !260
  %arraydecay81 = getelementptr inbounds [16 x i8], [16 x i8]* %ob1, i64 0, i64 0, !dbg !261
  call void @add(i8* %arraydecay79, i8* %arrayidx80, i8* %arraydecay81), !dbg !262
  %arraydecay82 = getelementptr inbounds [16 x i8], [16 x i8]* %ob1, i64 0, i64 0, !dbg !263
  %arraydecay83 = getelementptr inbounds [16 x i8], [16 x i8]* %c2, i64 0, i64 0, !dbg !264
  %arraydecay84 = getelementptr inbounds [16 x i8], [16 x i8]* %ob2, i64 0, i64 0, !dbg !265
  call void @add(i8* %arraydecay82, i8* %arraydecay83, i8* %arraydecay84), !dbg !266
  %arraydecay85 = getelementptr inbounds [16 x i8], [16 x i8]* %ob2, i64 0, i64 0, !dbg !267
  %call86 = call i8* @strcpy(i8* %out, i8* %arraydecay85) #7, !dbg !268
  %arrayidx87 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 1, !dbg !269
  store i8 0, i8* %arrayidx87, align 1, !dbg !270
  %arraydecay88 = getelementptr inbounds [3 x i8], [3 x i8]* %d, i64 0, i64 0, !dbg !271
  %call89 = call i8* @strcat(i8* %out, i8* %arraydecay88) #7, !dbg !272
  br label %if.end104, !dbg !273

if.else:                                          ; preds = %land.lhs.true, %entry
  %3 = load i8, i8* %b1, align 1, !dbg !274
  %conv90 = sext i8 %3 to i32, !dbg !274
  %cmp91 = icmp ne i32 %conv90, 0, !dbg !276
  br i1 %cmp91, label %if.then93, label %if.else95, !dbg !277

if.then93:                                        ; preds = %if.else
  %call94 = call i8* @strcpy(i8* %out, i8* %b1) #7, !dbg !278
  br label %if.end103, !dbg !280

if.else95:                                        ; preds = %if.else
  %4 = load i8, i8* %b2, align 1, !dbg !281
  %conv96 = sext i8 %4 to i32, !dbg !281
  %cmp97 = icmp ne i32 %conv96, 0, !dbg !283
  br i1 %cmp97, label %if.then99, label %if.else101, !dbg !284

if.then99:                                        ; preds = %if.else95
  %call100 = call i8* @strcpy(i8* %out, i8* %b2) #7, !dbg !285
  br label %if.end102, !dbg !287

if.else101:                                       ; preds = %if.else95
  store i8 0, i8* %out, align 1, !dbg !288
  br label %if.end102

if.end102:                                        ; preds = %if.else101, %if.then99
  br label %if.end103

if.end103:                                        ; preds = %if.end102, %if.then93
  br label %if.end104

if.end104:                                        ; preds = %if.end103, %if.end78
  ret void, !dbg !290
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @unary_minus(i8* %b, i8* %out) #0 !dbg !291 {
entry:
  call void @llvm.dbg.value(metadata i8* %b, metadata !294, metadata !DIExpression()), !dbg !295
  call void @llvm.dbg.value(metadata i8* %out, metadata !296, metadata !DIExpression()), !dbg !295
  br label %while.cond, !dbg !297

while.cond:                                       ; preds = %if.end15, %entry
  %out.addr.0 = phi i8* [ %out, %entry ], [ %out.addr.2, %if.end15 ]
  %b.addr.0 = phi i8* [ %b, %entry ], [ %b.addr.2, %if.end15 ]
  call void @llvm.dbg.value(metadata i8* %b.addr.0, metadata !294, metadata !DIExpression()), !dbg !295
  call void @llvm.dbg.value(metadata i8* %out.addr.0, metadata !296, metadata !DIExpression()), !dbg !295
  %0 = load i8, i8* %b.addr.0, align 1, !dbg !298
  %conv = sext i8 %0 to i32, !dbg !298
  %cmp = icmp ne i32 %conv, 0, !dbg !299
  br i1 %cmp, label %while.body, label %while.end, !dbg !297

while.body:                                       ; preds = %while.cond
  %1 = load i8, i8* %b.addr.0, align 1, !dbg !300
  %conv2 = sext i8 %1 to i32, !dbg !300
  %cmp3 = icmp eq i32 %conv2, 45, !dbg !303
  br i1 %cmp3, label %if.then, label %if.else, !dbg !304

if.then:                                          ; preds = %while.body
  %incdec.ptr = getelementptr inbounds i8, i8* %out.addr.0, i32 1, !dbg !305
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !296, metadata !DIExpression()), !dbg !295
  store i8 43, i8* %out.addr.0, align 1, !dbg !307
  %incdec.ptr5 = getelementptr inbounds i8, i8* %b.addr.0, i32 1, !dbg !308
  call void @llvm.dbg.value(metadata i8* %incdec.ptr5, metadata !294, metadata !DIExpression()), !dbg !295
  br label %if.end15, !dbg !309

if.else:                                          ; preds = %while.body
  %2 = load i8, i8* %b.addr.0, align 1, !dbg !310
  %conv6 = sext i8 %2 to i32, !dbg !310
  %cmp7 = icmp eq i32 %conv6, 43, !dbg !312
  br i1 %cmp7, label %if.then9, label %if.else12, !dbg !313

if.then9:                                         ; preds = %if.else
  %incdec.ptr10 = getelementptr inbounds i8, i8* %out.addr.0, i32 1, !dbg !314
  call void @llvm.dbg.value(metadata i8* %incdec.ptr10, metadata !296, metadata !DIExpression()), !dbg !295
  store i8 45, i8* %out.addr.0, align 1, !dbg !316
  %incdec.ptr11 = getelementptr inbounds i8, i8* %b.addr.0, i32 1, !dbg !317
  call void @llvm.dbg.value(metadata i8* %incdec.ptr11, metadata !294, metadata !DIExpression()), !dbg !295
  br label %if.end, !dbg !318

if.else12:                                        ; preds = %if.else
  %incdec.ptr13 = getelementptr inbounds i8, i8* %b.addr.0, i32 1, !dbg !319
  call void @llvm.dbg.value(metadata i8* %incdec.ptr13, metadata !294, metadata !DIExpression()), !dbg !295
  %3 = load i8, i8* %b.addr.0, align 1, !dbg !321
  %incdec.ptr14 = getelementptr inbounds i8, i8* %out.addr.0, i32 1, !dbg !322
  call void @llvm.dbg.value(metadata i8* %incdec.ptr14, metadata !296, metadata !DIExpression()), !dbg !295
  store i8 %3, i8* %out.addr.0, align 1, !dbg !323
  br label %if.end

if.end:                                           ; preds = %if.else12, %if.then9
  %out.addr.1 = phi i8* [ %incdec.ptr10, %if.then9 ], [ %incdec.ptr14, %if.else12 ], !dbg !324
  %b.addr.1 = phi i8* [ %incdec.ptr11, %if.then9 ], [ %incdec.ptr13, %if.else12 ], !dbg !324
  call void @llvm.dbg.value(metadata i8* %b.addr.1, metadata !294, metadata !DIExpression()), !dbg !295
  call void @llvm.dbg.value(metadata i8* %out.addr.1, metadata !296, metadata !DIExpression()), !dbg !295
  br label %if.end15

if.end15:                                         ; preds = %if.end, %if.then
  %out.addr.2 = phi i8* [ %incdec.ptr, %if.then ], [ %out.addr.1, %if.end ], !dbg !325
  %b.addr.2 = phi i8* [ %incdec.ptr5, %if.then ], [ %b.addr.1, %if.end ], !dbg !325
  call void @llvm.dbg.value(metadata i8* %b.addr.2, metadata !294, metadata !DIExpression()), !dbg !295
  call void @llvm.dbg.value(metadata i8* %out.addr.2, metadata !296, metadata !DIExpression()), !dbg !295
  br label %while.cond, !dbg !297, !llvm.loop !326

while.end:                                        ; preds = %while.cond
  store i8 0, i8* %out.addr.0, align 1, !dbg !328
  ret void, !dbg !329
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @subtract(i8* %b1, i8* %b2, i8* %out) #0 !dbg !330 {
entry:
  %buf = alloca [16 x i8], align 16
  call void @llvm.dbg.value(metadata i8* %b1, metadata !331, metadata !DIExpression()), !dbg !332
  call void @llvm.dbg.value(metadata i8* %b2, metadata !333, metadata !DIExpression()), !dbg !332
  call void @llvm.dbg.value(metadata i8* %out, metadata !334, metadata !DIExpression()), !dbg !332
  call void @llvm.dbg.declare(metadata [16 x i8]* %buf, metadata !335, metadata !DIExpression()), !dbg !336
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !337
  call void @unary_minus(i8* %b2, i8* %arraydecay), !dbg !338
  %arraydecay1 = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !339
  call void @add(i8* %b1, i8* %arraydecay1, i8* %out), !dbg !340
  ret void, !dbg !341
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @mult(i8* %b1, i8* %b2, i8* %out) #0 !dbg !342 {
entry:
  %r = alloca [16 x i8], align 16
  %t = alloca [16 x i8], align 16
  %c1 = alloca [16 x i8], align 16
  %c2 = alloca [16 x i8], align 16
  call void @llvm.dbg.value(metadata i8* %b1, metadata !343, metadata !DIExpression()), !dbg !344
  call void @llvm.dbg.value(metadata i8* %b2, metadata !345, metadata !DIExpression()), !dbg !344
  call void @llvm.dbg.value(metadata i8* %out, metadata !346, metadata !DIExpression()), !dbg !344
  call void @llvm.dbg.declare(metadata [16 x i8]* %r, metadata !347, metadata !DIExpression()), !dbg !348
  %0 = bitcast [16 x i8]* %r to i8*, !dbg !348
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 getelementptr inbounds ([16 x i8], [16 x i8]* @__const.mult.r, i32 0, i32 0), i64 16, i1 false), !dbg !348
  call void @llvm.dbg.declare(metadata [16 x i8]* %t, metadata !349, metadata !DIExpression()), !dbg !350
  call void @llvm.dbg.declare(metadata [16 x i8]* %c1, metadata !351, metadata !DIExpression()), !dbg !352
  call void @llvm.dbg.declare(metadata [16 x i8]* %c2, metadata !353, metadata !DIExpression()), !dbg !354
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %c2, i64 0, i64 0, !dbg !355
  call void @llvm.dbg.value(metadata i8* %arraydecay, metadata !356, metadata !DIExpression()), !dbg !344
  %arraydecay1 = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !357
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %b1) #7, !dbg !358
  %arraydecay2 = getelementptr inbounds [16 x i8], [16 x i8]* %c2, i64 0, i64 0, !dbg !359
  %call3 = call i8* @strcpy(i8* %arraydecay2, i8* %b2) #7, !dbg !360
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %c2, i64 0, i64 0, !dbg !361
  call void @reverse(i8* %arraydecay4), !dbg !362
  br label %while.cond, !dbg !363

while.cond:                                       ; preds = %if.end25, %entry
  %ptr.0 = phi i8* [ %arraydecay, %entry ], [ %incdec.ptr, %if.end25 ], !dbg !344
  call void @llvm.dbg.value(metadata i8* %ptr.0, metadata !356, metadata !DIExpression()), !dbg !344
  %1 = load i8, i8* %ptr.0, align 1, !dbg !364
  %conv = sext i8 %1 to i32, !dbg !364
  %cmp = icmp ne i32 %conv, 0, !dbg !365
  br i1 %cmp, label %while.body, label %while.end, !dbg !363

while.body:                                       ; preds = %while.cond
  %2 = load i8, i8* %ptr.0, align 1, !dbg !366
  %conv6 = sext i8 %2 to i32, !dbg !366
  %cmp7 = icmp eq i32 %conv6, 43, !dbg !369
  br i1 %cmp7, label %if.then, label %if.end, !dbg !370

if.then:                                          ; preds = %while.body
  %arraydecay9 = getelementptr inbounds [16 x i8], [16 x i8]* %r, i64 0, i64 0, !dbg !371
  %arraydecay10 = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !373
  %arraydecay11 = getelementptr inbounds [16 x i8], [16 x i8]* %t, i64 0, i64 0, !dbg !374
  call void @add(i8* %arraydecay9, i8* %arraydecay10, i8* %arraydecay11), !dbg !375
  %arraydecay12 = getelementptr inbounds [16 x i8], [16 x i8]* %r, i64 0, i64 0, !dbg !376
  %arraydecay13 = getelementptr inbounds [16 x i8], [16 x i8]* %t, i64 0, i64 0, !dbg !377
  %call14 = call i8* @strcpy(i8* %arraydecay12, i8* %arraydecay13) #7, !dbg !378
  br label %if.end, !dbg !379

if.end:                                           ; preds = %if.then, %while.body
  %3 = load i8, i8* %ptr.0, align 1, !dbg !380
  %conv15 = sext i8 %3 to i32, !dbg !380
  %cmp16 = icmp eq i32 %conv15, 45, !dbg !382
  br i1 %cmp16, label %if.then18, label %if.end25, !dbg !383

if.then18:                                        ; preds = %if.end
  %arraydecay19 = getelementptr inbounds [16 x i8], [16 x i8]* %r, i64 0, i64 0, !dbg !384
  %arraydecay20 = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !386
  %arraydecay21 = getelementptr inbounds [16 x i8], [16 x i8]* %t, i64 0, i64 0, !dbg !387
  call void @subtract(i8* %arraydecay19, i8* %arraydecay20, i8* %arraydecay21), !dbg !388
  %arraydecay22 = getelementptr inbounds [16 x i8], [16 x i8]* %r, i64 0, i64 0, !dbg !389
  %arraydecay23 = getelementptr inbounds [16 x i8], [16 x i8]* %t, i64 0, i64 0, !dbg !390
  %call24 = call i8* @strcpy(i8* %arraydecay22, i8* %arraydecay23) #7, !dbg !391
  br label %if.end25, !dbg !392

if.end25:                                         ; preds = %if.then18, %if.end
  %arraydecay26 = getelementptr inbounds [16 x i8], [16 x i8]* %c1, i64 0, i64 0, !dbg !393
  %call27 = call i8* @strcat(i8* %arraydecay26, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)) #7, !dbg !394
  %incdec.ptr = getelementptr inbounds i8, i8* %ptr.0, i32 1, !dbg !395
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !356, metadata !DIExpression()), !dbg !344
  br label %while.cond, !dbg !363, !llvm.loop !396

while.end:                                        ; preds = %while.cond
  %arraydecay28 = getelementptr inbounds [16 x i8], [16 x i8]* %r, i64 0, i64 0, !dbg !398
  call void @llvm.dbg.value(metadata i8* %arraydecay28, metadata !356, metadata !DIExpression()), !dbg !344
  br label %while.cond29, !dbg !399

while.cond29:                                     ; preds = %while.body33, %while.end
  %ptr.1 = phi i8* [ %arraydecay28, %while.end ], [ %incdec.ptr34, %while.body33 ], !dbg !344
  call void @llvm.dbg.value(metadata i8* %ptr.1, metadata !356, metadata !DIExpression()), !dbg !344
  %4 = load i8, i8* %ptr.1, align 1, !dbg !400
  %conv30 = sext i8 %4 to i32, !dbg !400
  %cmp31 = icmp eq i32 %conv30, 48, !dbg !401
  br i1 %cmp31, label %while.body33, label %while.end35, !dbg !399

while.body33:                                     ; preds = %while.cond29
  %incdec.ptr34 = getelementptr inbounds i8, i8* %ptr.1, i32 1, !dbg !402
  call void @llvm.dbg.value(metadata i8* %incdec.ptr34, metadata !356, metadata !DIExpression()), !dbg !344
  br label %while.cond29, !dbg !399, !llvm.loop !404

while.end35:                                      ; preds = %while.cond29
  %call36 = call i8* @strcpy(i8* %out, i8* %ptr.1) #7, !dbg !406
  ret void, !dbg !407
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !408 {
entry:
  %b = alloca [16 x i8], align 16
  %t = alloca [16 x i8], align 16
  %d = alloca [16 x i8], align 16
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), metadata !411, metadata !DIExpression()), !dbg !412
  call void @llvm.dbg.declare(metadata [16 x i8]* %b, metadata !413, metadata !DIExpression()), !dbg !414
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), metadata !415, metadata !DIExpression()), !dbg !412
  call void @llvm.dbg.declare(metadata [16 x i8]* %t, metadata !416, metadata !DIExpression()), !dbg !417
  call void @llvm.dbg.declare(metadata [16 x i8]* %d, metadata !418, metadata !DIExpression()), !dbg !419
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %b, i64 0, i64 0, !dbg !420
  call void @to_bt(i32 -436, i8* %arraydecay), !dbg !421
  %arraydecay1 = getelementptr inbounds [16 x i8], [16 x i8]* %b, i64 0, i64 0, !dbg !422
  %arraydecay2 = getelementptr inbounds [16 x i8], [16 x i8]* %t, i64 0, i64 0, !dbg !423
  call void @subtract(i8* %arraydecay1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* %arraydecay2), !dbg !424
  %arraydecay3 = getelementptr inbounds [16 x i8], [16 x i8]* %t, i64 0, i64 0, !dbg !425
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %d, i64 0, i64 0, !dbg !426
  call void @mult(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i8* %arraydecay3, i8* %arraydecay4), !dbg !427
  %call = call i32 @from_bt(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)), !dbg !428
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 %call), !dbg !429
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %b, i64 0, i64 0, !dbg !430
  %arraydecay7 = getelementptr inbounds [16 x i8], [16 x i8]* %b, i64 0, i64 0, !dbg !431
  %call8 = call i32 @from_bt(i8* %arraydecay7), !dbg !432
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i64 0, i64 0), i8* %arraydecay6, i32 %call8), !dbg !433
  %call10 = call i32 @from_bt(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0)), !dbg !434
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i32 %call10), !dbg !435
  %arraydecay12 = getelementptr inbounds [16 x i8], [16 x i8]* %d, i64 0, i64 0, !dbg !436
  %arraydecay13 = getelementptr inbounds [16 x i8], [16 x i8]* %d, i64 0, i64 0, !dbg !437
  %call14 = call i32 @from_bt(i8* %arraydecay13), !dbg !438
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6, i64 0, i64 0), i8* %arraydecay12, i32 %call14), !dbg !439
  ret i32 0, !dbg !440
}

declare dso_local i32 @printf(i8*, ...) #5

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!28 = !DILocation(line: 0, scope: !24)
!29 = !DILocation(line: 5, column: 18, scope: !24)
!30 = !DILocalVariable(name: "len", scope: !24, file: !3, line: 5, type: !31)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 46, baseType: !33)
!32 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 6, column: 17, scope: !24)
!35 = !DILocation(line: 6, column: 23, scope: !24)
!36 = !DILocalVariable(name: "r", scope: !24, file: !3, line: 6, type: !7)
!37 = !DILocation(line: 7, column: 5, scope: !24)
!38 = !DILocation(line: 7, column: 14, scope: !24)
!39 = !DILocation(line: 8, column: 15, scope: !40)
!40 = distinct !DILexicalBlock(scope: !24, file: !3, line: 7, column: 19)
!41 = !DILocation(line: 8, column: 12, scope: !40)
!42 = !DILocation(line: 9, column: 15, scope: !40)
!43 = !DILocation(line: 9, column: 12, scope: !40)
!44 = !DILocation(line: 10, column: 19, scope: !40)
!45 = !DILocation(line: 10, column: 17, scope: !40)
!46 = !DILocation(line: 10, column: 11, scope: !40)
!47 = !DILocation(line: 10, column: 14, scope: !40)
!48 = distinct !{!48, !37, !49}
!49 = !DILocation(line: 11, column: 5, scope: !24)
!50 = !DILocation(line: 12, column: 1, scope: !24)
!51 = !DILocalVariable(name: "n", arg: 1, scope: !2, file: !3, line: 14, type: !6)
!52 = !DILocation(line: 0, scope: !2)
!53 = !DILocalVariable(name: "b", arg: 2, scope: !2, file: !3, line: 14, type: !7)
!54 = !DILocalVariable(name: "ptr", scope: !2, file: !3, line: 18, type: !7)
!55 = !DILocation(line: 19, column: 10, scope: !2)
!56 = !DILocation(line: 21, column: 5, scope: !2)
!57 = !DILocation(line: 22, column: 19, scope: !58)
!58 = distinct !DILexicalBlock(scope: !2, file: !3, line: 21, column: 15)
!59 = !DILocalVariable(name: "r", scope: !58, file: !3, line: 22, type: !6)
!60 = !DILocation(line: 0, scope: !58)
!61 = !DILocation(line: 23, column: 15, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !3, line: 23, column: 13)
!63 = !DILocation(line: 23, column: 13, scope: !58)
!64 = !DILocation(line: 24, column: 15, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !3, line: 23, column: 20)
!66 = !DILocation(line: 25, column: 9, scope: !65)
!67 = !DILocation(line: 27, column: 16, scope: !58)
!68 = !DILocation(line: 27, column: 14, scope: !58)
!69 = !DILocation(line: 28, column: 11, scope: !58)
!70 = !DILocation(line: 28, column: 18, scope: !58)
!71 = !DILocation(line: 30, column: 14, scope: !58)
!72 = !DILocation(line: 30, column: 11, scope: !58)
!73 = !DILocation(line: 31, column: 11, scope: !58)
!74 = distinct !{!74, !56, !75}
!75 = !DILocation(line: 32, column: 5, scope: !2)
!76 = !DILocation(line: 34, column: 5, scope: !2)
!77 = !DILocation(line: 35, column: 1, scope: !2)
!78 = distinct !DISubprogram(name: "from_bt", scope: !3, file: !3, line: 37, type: !79, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!79 = !DISubroutineType(types: !80)
!80 = !{!6, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !8)
!83 = !DILocalVariable(name: "a", arg: 1, scope: !78, file: !3, line: 37, type: !81)
!84 = !DILocation(line: 0, scope: !78)
!85 = !DILocalVariable(name: "n", scope: !78, file: !3, line: 38, type: !6)
!86 = !DILocation(line: 40, column: 5, scope: !78)
!87 = !DILocation(line: 40, column: 12, scope: !78)
!88 = !DILocation(line: 40, column: 15, scope: !78)
!89 = !DILocation(line: 41, column: 11, scope: !90)
!90 = distinct !DILexicalBlock(scope: !78, file: !3, line: 40, column: 24)
!91 = !DILocation(line: 42, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !90, file: !3, line: 42, column: 13)
!93 = !DILocation(line: 42, column: 16, scope: !92)
!94 = !DILocation(line: 42, column: 13, scope: !90)
!95 = !DILocation(line: 43, column: 14, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !3, line: 42, column: 24)
!97 = !DILocation(line: 44, column: 9, scope: !96)
!98 = !DILocation(line: 44, column: 20, scope: !99)
!99 = distinct !DILexicalBlock(scope: !92, file: !3, line: 44, column: 20)
!100 = !DILocation(line: 44, column: 23, scope: !99)
!101 = !DILocation(line: 44, column: 20, scope: !92)
!102 = !DILocation(line: 45, column: 14, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !3, line: 44, column: 31)
!104 = !DILocation(line: 46, column: 9, scope: !103)
!105 = !DILocation(line: 0, scope: !90)
!106 = !DILocation(line: 0, scope: !92)
!107 = !DILocation(line: 47, column: 10, scope: !90)
!108 = distinct !{!108, !86, !109}
!109 = !DILocation(line: 48, column: 5, scope: !78)
!110 = !DILocation(line: 50, column: 5, scope: !78)
!111 = distinct !DISubprogram(name: "last_char", scope: !3, file: !3, line: 53, type: !112, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!112 = !DISubroutineType(types: !113)
!113 = !{!8, !7}
!114 = !DILocalVariable(name: "ptr", arg: 1, scope: !111, file: !3, line: 53, type: !7)
!115 = !DILocation(line: 0, scope: !111)
!116 = !DILocation(line: 56, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !3, line: 56, column: 9)
!118 = !DILocation(line: 56, column: 21, scope: !117)
!119 = !DILocation(line: 56, column: 24, scope: !117)
!120 = !DILocation(line: 56, column: 29, scope: !117)
!121 = !DILocation(line: 56, column: 9, scope: !111)
!122 = !DILocation(line: 57, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !117, file: !3, line: 56, column: 38)
!124 = !DILocation(line: 60, column: 5, scope: !111)
!125 = !DILocation(line: 60, column: 12, scope: !111)
!126 = !DILocation(line: 60, column: 17, scope: !111)
!127 = !DILocation(line: 61, column: 12, scope: !128)
!128 = distinct !DILexicalBlock(scope: !111, file: !3, line: 60, column: 26)
!129 = distinct !{!129, !124, !130}
!130 = !DILocation(line: 62, column: 5, scope: !111)
!131 = !DILocation(line: 63, column: 8, scope: !111)
!132 = !DILocation(line: 65, column: 9, scope: !111)
!133 = !DILocalVariable(name: "c", scope: !111, file: !3, line: 54, type: !8)
!134 = !DILocation(line: 66, column: 10, scope: !111)
!135 = !DILocation(line: 67, column: 5, scope: !111)
!136 = !DILocation(line: 68, column: 1, scope: !111)
!137 = distinct !DISubprogram(name: "add", scope: !3, file: !3, line: 70, type: !138, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!138 = !DISubroutineType(types: !139)
!139 = !{null, !81, !81, !7}
!140 = !DILocalVariable(name: "b1", arg: 1, scope: !137, file: !3, line: 70, type: !81)
!141 = !DILocation(line: 0, scope: !137)
!142 = !DILocalVariable(name: "b2", arg: 2, scope: !137, file: !3, line: 70, type: !81)
!143 = !DILocalVariable(name: "out", arg: 3, scope: !137, file: !3, line: 70, type: !7)
!144 = !DILocation(line: 71, column: 9, scope: !145)
!145 = distinct !DILexicalBlock(scope: !137, file: !3, line: 71, column: 9)
!146 = !DILocation(line: 71, column: 13, scope: !145)
!147 = !DILocation(line: 71, column: 21, scope: !145)
!148 = !DILocation(line: 71, column: 24, scope: !145)
!149 = !DILocation(line: 71, column: 28, scope: !145)
!150 = !DILocation(line: 71, column: 9, scope: !137)
!151 = !DILocalVariable(name: "c1", scope: !152, file: !3, line: 72, type: !153)
!152 = distinct !DILexicalBlock(scope: !145, file: !3, line: 71, column: 37)
!153 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 128, elements: !154)
!154 = !{!155}
!155 = !DISubrange(count: 16)
!156 = !DILocation(line: 72, column: 14, scope: !152)
!157 = !DILocalVariable(name: "c2", scope: !152, file: !3, line: 73, type: !153)
!158 = !DILocation(line: 73, column: 14, scope: !152)
!159 = !DILocalVariable(name: "ob1", scope: !152, file: !3, line: 74, type: !153)
!160 = !DILocation(line: 74, column: 14, scope: !152)
!161 = !DILocalVariable(name: "ob2", scope: !152, file: !3, line: 75, type: !153)
!162 = !DILocation(line: 75, column: 14, scope: !152)
!163 = !DILocalVariable(name: "d", scope: !152, file: !3, line: 76, type: !19)
!164 = !DILocation(line: 76, column: 14, scope: !152)
!165 = !DILocation(line: 79, column: 16, scope: !152)
!166 = !DILocation(line: 79, column: 9, scope: !152)
!167 = !DILocation(line: 80, column: 16, scope: !152)
!168 = !DILocation(line: 80, column: 9, scope: !152)
!169 = !DILocation(line: 81, column: 24, scope: !152)
!170 = !DILocation(line: 81, column: 14, scope: !152)
!171 = !DILocalVariable(name: "L1", scope: !152, file: !3, line: 77, type: !8)
!172 = !DILocation(line: 0, scope: !152)
!173 = !DILocation(line: 82, column: 24, scope: !152)
!174 = !DILocation(line: 82, column: 14, scope: !152)
!175 = !DILocalVariable(name: "L2", scope: !152, file: !3, line: 77, type: !8)
!176 = !DILocation(line: 83, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !152, file: !3, line: 83, column: 13)
!178 = !DILocation(line: 83, column: 18, scope: !177)
!179 = !DILocation(line: 83, column: 16, scope: !177)
!180 = !DILocation(line: 83, column: 13, scope: !152)
!181 = !DILocation(line: 84, column: 19, scope: !182)
!182 = distinct !DILexicalBlock(scope: !177, file: !3, line: 83, column: 22)
!183 = !DILocation(line: 84, column: 16, scope: !182)
!184 = !DILocation(line: 85, column: 19, scope: !182)
!185 = !DILocation(line: 85, column: 16, scope: !182)
!186 = !DILocation(line: 86, column: 19, scope: !182)
!187 = !DILocation(line: 86, column: 16, scope: !182)
!188 = !DILocation(line: 87, column: 9, scope: !182)
!189 = !DILocation(line: 89, column: 13, scope: !190)
!190 = distinct !DILexicalBlock(scope: !152, file: !3, line: 89, column: 13)
!191 = !DILocation(line: 89, column: 16, scope: !190)
!192 = !DILocation(line: 89, column: 13, scope: !152)
!193 = !DILocation(line: 90, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !195, file: !3, line: 90, column: 17)
!195 = distinct !DILexicalBlock(scope: !190, file: !3, line: 89, column: 24)
!196 = !DILocation(line: 90, column: 20, scope: !194)
!197 = !DILocation(line: 90, column: 17, scope: !195)
!198 = !DILocation(line: 91, column: 17, scope: !199)
!199 = distinct !DILexicalBlock(scope: !194, file: !3, line: 90, column: 28)
!200 = !DILocation(line: 91, column: 22, scope: !199)
!201 = !DILocation(line: 92, column: 13, scope: !199)
!202 = !DILocation(line: 93, column: 17, scope: !203)
!203 = distinct !DILexicalBlock(scope: !195, file: !3, line: 93, column: 17)
!204 = !DILocation(line: 93, column: 20, scope: !203)
!205 = !DILocation(line: 93, column: 17, scope: !195)
!206 = !DILocation(line: 94, column: 17, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !3, line: 93, column: 28)
!208 = !DILocation(line: 94, column: 22, scope: !207)
!209 = !DILocation(line: 95, column: 17, scope: !207)
!210 = !DILocation(line: 95, column: 22, scope: !207)
!211 = !DILocation(line: 96, column: 13, scope: !207)
!212 = !DILocation(line: 97, column: 9, scope: !195)
!213 = !DILocation(line: 98, column: 13, scope: !214)
!214 = distinct !DILexicalBlock(scope: !152, file: !3, line: 98, column: 13)
!215 = !DILocation(line: 98, column: 16, scope: !214)
!216 = !DILocation(line: 98, column: 13, scope: !152)
!217 = !DILocation(line: 99, column: 17, scope: !218)
!218 = distinct !DILexicalBlock(scope: !219, file: !3, line: 99, column: 17)
!219 = distinct !DILexicalBlock(scope: !214, file: !3, line: 98, column: 24)
!220 = !DILocation(line: 99, column: 20, scope: !218)
!221 = !DILocation(line: 99, column: 17, scope: !219)
!222 = !DILocation(line: 100, column: 17, scope: !223)
!223 = distinct !DILexicalBlock(scope: !218, file: !3, line: 99, column: 28)
!224 = !DILocation(line: 100, column: 22, scope: !223)
!225 = !DILocation(line: 101, column: 13, scope: !223)
!226 = !DILocation(line: 102, column: 17, scope: !227)
!227 = distinct !DILexicalBlock(scope: !219, file: !3, line: 102, column: 17)
!228 = !DILocation(line: 102, column: 20, scope: !227)
!229 = !DILocation(line: 102, column: 17, scope: !219)
!230 = !DILocation(line: 103, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !227, file: !3, line: 102, column: 28)
!232 = !DILocation(line: 103, column: 22, scope: !231)
!233 = !DILocation(line: 104, column: 13, scope: !231)
!234 = !DILocation(line: 105, column: 17, scope: !235)
!235 = distinct !DILexicalBlock(scope: !219, file: !3, line: 105, column: 17)
!236 = !DILocation(line: 105, column: 20, scope: !235)
!237 = !DILocation(line: 105, column: 17, scope: !219)
!238 = !DILocation(line: 106, column: 17, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !3, line: 105, column: 28)
!240 = !DILocation(line: 106, column: 22, scope: !239)
!241 = !DILocation(line: 107, column: 17, scope: !239)
!242 = !DILocation(line: 107, column: 22, scope: !239)
!243 = !DILocation(line: 108, column: 13, scope: !239)
!244 = !DILocation(line: 109, column: 9, scope: !219)
!245 = !DILocation(line: 110, column: 13, scope: !246)
!246 = distinct !DILexicalBlock(scope: !152, file: !3, line: 110, column: 13)
!247 = !DILocation(line: 110, column: 16, scope: !246)
!248 = !DILocation(line: 110, column: 13, scope: !152)
!249 = !DILocation(line: 111, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !251, file: !3, line: 111, column: 17)
!251 = distinct !DILexicalBlock(scope: !246, file: !3, line: 110, column: 24)
!252 = !DILocation(line: 111, column: 20, scope: !250)
!253 = !DILocation(line: 111, column: 17, scope: !251)
!254 = !DILocation(line: 112, column: 17, scope: !255)
!255 = distinct !DILexicalBlock(scope: !250, file: !3, line: 111, column: 28)
!256 = !DILocation(line: 112, column: 22, scope: !255)
!257 = !DILocation(line: 113, column: 13, scope: !255)
!258 = !DILocation(line: 114, column: 9, scope: !251)
!259 = !DILocation(line: 116, column: 13, scope: !152)
!260 = !DILocation(line: 116, column: 18, scope: !152)
!261 = !DILocation(line: 116, column: 24, scope: !152)
!262 = !DILocation(line: 116, column: 9, scope: !152)
!263 = !DILocation(line: 117, column: 13, scope: !152)
!264 = !DILocation(line: 117, column: 18, scope: !152)
!265 = !DILocation(line: 117, column: 22, scope: !152)
!266 = !DILocation(line: 117, column: 9, scope: !152)
!267 = !DILocation(line: 118, column: 21, scope: !152)
!268 = !DILocation(line: 118, column: 9, scope: !152)
!269 = !DILocation(line: 120, column: 9, scope: !152)
!270 = !DILocation(line: 120, column: 14, scope: !152)
!271 = !DILocation(line: 121, column: 21, scope: !152)
!272 = !DILocation(line: 121, column: 9, scope: !152)
!273 = !DILocation(line: 122, column: 5, scope: !152)
!274 = !DILocation(line: 122, column: 16, scope: !275)
!275 = distinct !DILexicalBlock(scope: !145, file: !3, line: 122, column: 16)
!276 = !DILocation(line: 122, column: 20, scope: !275)
!277 = !DILocation(line: 122, column: 16, scope: !145)
!278 = !DILocation(line: 123, column: 9, scope: !279)
!279 = distinct !DILexicalBlock(scope: !275, file: !3, line: 122, column: 29)
!280 = !DILocation(line: 124, column: 5, scope: !279)
!281 = !DILocation(line: 124, column: 16, scope: !282)
!282 = distinct !DILexicalBlock(scope: !275, file: !3, line: 124, column: 16)
!283 = !DILocation(line: 124, column: 20, scope: !282)
!284 = !DILocation(line: 124, column: 16, scope: !275)
!285 = !DILocation(line: 125, column: 9, scope: !286)
!286 = distinct !DILexicalBlock(scope: !282, file: !3, line: 124, column: 29)
!287 = !DILocation(line: 126, column: 5, scope: !286)
!288 = !DILocation(line: 127, column: 14, scope: !289)
!289 = distinct !DILexicalBlock(scope: !282, file: !3, line: 126, column: 12)
!290 = !DILocation(line: 129, column: 1, scope: !137)
!291 = distinct !DISubprogram(name: "unary_minus", scope: !3, file: !3, line: 131, type: !292, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!292 = !DISubroutineType(types: !293)
!293 = !{null, !81, !7}
!294 = !DILocalVariable(name: "b", arg: 1, scope: !291, file: !3, line: 131, type: !81)
!295 = !DILocation(line: 0, scope: !291)
!296 = !DILocalVariable(name: "out", arg: 2, scope: !291, file: !3, line: 131, type: !7)
!297 = !DILocation(line: 132, column: 5, scope: !291)
!298 = !DILocation(line: 132, column: 12, scope: !291)
!299 = !DILocation(line: 132, column: 15, scope: !291)
!300 = !DILocation(line: 133, column: 13, scope: !301)
!301 = distinct !DILexicalBlock(scope: !302, file: !3, line: 133, column: 13)
!302 = distinct !DILexicalBlock(scope: !291, file: !3, line: 132, column: 24)
!303 = !DILocation(line: 133, column: 16, scope: !301)
!304 = !DILocation(line: 133, column: 13, scope: !302)
!305 = !DILocation(line: 134, column: 17, scope: !306)
!306 = distinct !DILexicalBlock(scope: !301, file: !3, line: 133, column: 24)
!307 = !DILocation(line: 134, column: 20, scope: !306)
!308 = !DILocation(line: 135, column: 14, scope: !306)
!309 = !DILocation(line: 136, column: 9, scope: !306)
!310 = !DILocation(line: 136, column: 20, scope: !311)
!311 = distinct !DILexicalBlock(scope: !301, file: !3, line: 136, column: 20)
!312 = !DILocation(line: 136, column: 23, scope: !311)
!313 = !DILocation(line: 136, column: 20, scope: !301)
!314 = !DILocation(line: 137, column: 17, scope: !315)
!315 = distinct !DILexicalBlock(scope: !311, file: !3, line: 136, column: 31)
!316 = !DILocation(line: 137, column: 20, scope: !315)
!317 = !DILocation(line: 138, column: 14, scope: !315)
!318 = !DILocation(line: 139, column: 9, scope: !315)
!319 = !DILocation(line: 140, column: 24, scope: !320)
!320 = distinct !DILexicalBlock(scope: !311, file: !3, line: 139, column: 16)
!321 = !DILocation(line: 140, column: 22, scope: !320)
!322 = !DILocation(line: 140, column: 17, scope: !320)
!323 = !DILocation(line: 140, column: 20, scope: !320)
!324 = !DILocation(line: 0, scope: !311)
!325 = !DILocation(line: 0, scope: !301)
!326 = distinct !{!326, !297, !327}
!327 = !DILocation(line: 142, column: 5, scope: !291)
!328 = !DILocation(line: 143, column: 10, scope: !291)
!329 = !DILocation(line: 144, column: 1, scope: !291)
!330 = distinct !DISubprogram(name: "subtract", scope: !3, file: !3, line: 146, type: !138, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!331 = !DILocalVariable(name: "b1", arg: 1, scope: !330, file: !3, line: 146, type: !81)
!332 = !DILocation(line: 0, scope: !330)
!333 = !DILocalVariable(name: "b2", arg: 2, scope: !330, file: !3, line: 146, type: !81)
!334 = !DILocalVariable(name: "out", arg: 3, scope: !330, file: !3, line: 146, type: !7)
!335 = !DILocalVariable(name: "buf", scope: !330, file: !3, line: 147, type: !153)
!336 = !DILocation(line: 147, column: 10, scope: !330)
!337 = !DILocation(line: 148, column: 21, scope: !330)
!338 = !DILocation(line: 148, column: 5, scope: !330)
!339 = !DILocation(line: 149, column: 13, scope: !330)
!340 = !DILocation(line: 149, column: 5, scope: !330)
!341 = !DILocation(line: 150, column: 1, scope: !330)
!342 = distinct !DISubprogram(name: "mult", scope: !3, file: !3, line: 152, type: !138, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!343 = !DILocalVariable(name: "b1", arg: 1, scope: !342, file: !3, line: 152, type: !81)
!344 = !DILocation(line: 0, scope: !342)
!345 = !DILocalVariable(name: "b2", arg: 2, scope: !342, file: !3, line: 152, type: !81)
!346 = !DILocalVariable(name: "out", arg: 3, scope: !342, file: !3, line: 152, type: !7)
!347 = !DILocalVariable(name: "r", scope: !342, file: !3, line: 153, type: !153)
!348 = !DILocation(line: 153, column: 10, scope: !342)
!349 = !DILocalVariable(name: "t", scope: !342, file: !3, line: 154, type: !153)
!350 = !DILocation(line: 154, column: 10, scope: !342)
!351 = !DILocalVariable(name: "c1", scope: !342, file: !3, line: 155, type: !153)
!352 = !DILocation(line: 155, column: 10, scope: !342)
!353 = !DILocalVariable(name: "c2", scope: !342, file: !3, line: 156, type: !153)
!354 = !DILocation(line: 156, column: 10, scope: !342)
!355 = !DILocation(line: 157, column: 17, scope: !342)
!356 = !DILocalVariable(name: "ptr", scope: !342, file: !3, line: 157, type: !7)
!357 = !DILocation(line: 159, column: 12, scope: !342)
!358 = !DILocation(line: 159, column: 5, scope: !342)
!359 = !DILocation(line: 160, column: 12, scope: !342)
!360 = !DILocation(line: 160, column: 5, scope: !342)
!361 = !DILocation(line: 162, column: 13, scope: !342)
!362 = !DILocation(line: 162, column: 5, scope: !342)
!363 = !DILocation(line: 164, column: 5, scope: !342)
!364 = !DILocation(line: 164, column: 12, scope: !342)
!365 = !DILocation(line: 164, column: 17, scope: !342)
!366 = !DILocation(line: 165, column: 13, scope: !367)
!367 = distinct !DILexicalBlock(scope: !368, file: !3, line: 165, column: 13)
!368 = distinct !DILexicalBlock(scope: !342, file: !3, line: 164, column: 26)
!369 = !DILocation(line: 165, column: 18, scope: !367)
!370 = !DILocation(line: 165, column: 13, scope: !368)
!371 = !DILocation(line: 166, column: 17, scope: !372)
!372 = distinct !DILexicalBlock(scope: !367, file: !3, line: 165, column: 26)
!373 = !DILocation(line: 166, column: 20, scope: !372)
!374 = !DILocation(line: 166, column: 24, scope: !372)
!375 = !DILocation(line: 166, column: 13, scope: !372)
!376 = !DILocation(line: 167, column: 20, scope: !372)
!377 = !DILocation(line: 167, column: 23, scope: !372)
!378 = !DILocation(line: 167, column: 13, scope: !372)
!379 = !DILocation(line: 168, column: 9, scope: !372)
!380 = !DILocation(line: 169, column: 13, scope: !381)
!381 = distinct !DILexicalBlock(scope: !368, file: !3, line: 169, column: 13)
!382 = !DILocation(line: 169, column: 18, scope: !381)
!383 = !DILocation(line: 169, column: 13, scope: !368)
!384 = !DILocation(line: 170, column: 22, scope: !385)
!385 = distinct !DILexicalBlock(scope: !381, file: !3, line: 169, column: 26)
!386 = !DILocation(line: 170, column: 25, scope: !385)
!387 = !DILocation(line: 170, column: 29, scope: !385)
!388 = !DILocation(line: 170, column: 13, scope: !385)
!389 = !DILocation(line: 171, column: 20, scope: !385)
!390 = !DILocation(line: 171, column: 23, scope: !385)
!391 = !DILocation(line: 171, column: 13, scope: !385)
!392 = !DILocation(line: 172, column: 9, scope: !385)
!393 = !DILocation(line: 173, column: 16, scope: !368)
!394 = !DILocation(line: 173, column: 9, scope: !368)
!395 = !DILocation(line: 175, column: 12, scope: !368)
!396 = distinct !{!396, !363, !397}
!397 = !DILocation(line: 176, column: 5, scope: !342)
!398 = !DILocation(line: 178, column: 11, scope: !342)
!399 = !DILocation(line: 179, column: 5, scope: !342)
!400 = !DILocation(line: 179, column: 12, scope: !342)
!401 = !DILocation(line: 179, column: 17, scope: !342)
!402 = !DILocation(line: 180, column: 12, scope: !403)
!403 = distinct !DILexicalBlock(scope: !342, file: !3, line: 179, column: 25)
!404 = distinct !{!404, !399, !405}
!405 = !DILocation(line: 181, column: 5, scope: !342)
!406 = !DILocation(line: 182, column: 5, scope: !342)
!407 = !DILocation(line: 183, column: 1, scope: !342)
!408 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 185, type: !409, scopeLine: 185, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !10)
!409 = !DISubroutineType(types: !410)
!410 = !{!6}
!411 = !DILocalVariable(name: "a", scope: !408, file: !3, line: 186, type: !81)
!412 = !DILocation(line: 0, scope: !408)
!413 = !DILocalVariable(name: "b", scope: !408, file: !3, line: 187, type: !153)
!414 = !DILocation(line: 187, column: 10, scope: !408)
!415 = !DILocalVariable(name: "c", scope: !408, file: !3, line: 188, type: !81)
!416 = !DILocalVariable(name: "t", scope: !408, file: !3, line: 189, type: !153)
!417 = !DILocation(line: 189, column: 10, scope: !408)
!418 = !DILocalVariable(name: "d", scope: !408, file: !3, line: 190, type: !153)
!419 = !DILocation(line: 190, column: 10, scope: !408)
!420 = !DILocation(line: 192, column: 17, scope: !408)
!421 = !DILocation(line: 192, column: 5, scope: !408)
!422 = !DILocation(line: 193, column: 14, scope: !408)
!423 = !DILocation(line: 193, column: 20, scope: !408)
!424 = !DILocation(line: 193, column: 5, scope: !408)
!425 = !DILocation(line: 194, column: 13, scope: !408)
!426 = !DILocation(line: 194, column: 16, scope: !408)
!427 = !DILocation(line: 194, column: 5, scope: !408)
!428 = !DILocation(line: 196, column: 39, scope: !408)
!429 = !DILocation(line: 196, column: 5, scope: !408)
!430 = !DILocation(line: 197, column: 36, scope: !408)
!431 = !DILocation(line: 197, column: 47, scope: !408)
!432 = !DILocation(line: 197, column: 39, scope: !408)
!433 = !DILocation(line: 197, column: 5, scope: !408)
!434 = !DILocation(line: 198, column: 39, scope: !408)
!435 = !DILocation(line: 198, column: 5, scope: !408)
!436 = !DILocation(line: 199, column: 36, scope: !408)
!437 = !DILocation(line: 199, column: 47, scope: !408)
!438 = !DILocation(line: 199, column: 39, scope: !408)
!439 = !DILocation(line: 199, column: 5, scope: !408)
!440 = !DILocation(line: 201, column: 5, scope: !408)
