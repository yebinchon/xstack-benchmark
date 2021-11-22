; ModuleID = 'galton-box-animation.c'
source_filename = "galton-box-animation.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@h = dso_local global i32 45, align 4, !dbg !0
@cnt = dso_local global i32 0, align 4, !dbg !6
@.str = private unnamed_addr constant [4 x i8] c"\1B[H\00", align 1
@w = common dso_local global i32 0, align 4, !dbg !16
@b = common dso_local global i8* null, align 8, !dbg !23
@.str.1 = private unnamed_addr constant [11 x i8] c"\1B[32m%c\1B[m\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"\1B[31m%c\1B[m\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"\1B[H\1B[J\00", align 1
@x = common dso_local global i32* null, align 8, !dbg !18
@y = common dso_local global i32* null, align 8, !dbg !21
@n = common dso_local global i32 0, align 4, !dbg !14
@run.step = internal global i32 0, align 4, !dbg !9

; Function Attrs: noinline nounwind uwtable
define dso_local void @show_board() #0 !dbg !31 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %j, metadata !36, metadata !DIExpression()), !dbg !37
  %call = call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !38
  store i32 0, i32* %i, align 4, !dbg !40
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc21, %entry
  %0 = load i32, i32* %i, align 4, !dbg !41
  %1 = load i32, i32* @h, align 4, !dbg !43
  %cmp = icmp slt i32 %0, %1, !dbg !44
  br i1 %cmp, label %for.body, label %for.end24, !dbg !45

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !46
  br label %for.cond1, !dbg !48

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !49
  %3 = load i32, i32* @w, align 4, !dbg !51
  %cmp2 = icmp slt i32 %2, %3, !dbg !52
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !53

for.body3:                                        ; preds = %for.cond1
  %4 = load i8*, i8** @b, align 8, !dbg !54
  %5 = load i32, i32* %i, align 4, !dbg !54
  %6 = load i32, i32* @w, align 4, !dbg !54
  %mul = mul nsw i32 %5, %6, !dbg !54
  %7 = load i32, i32* %j, align 4, !dbg !54
  %add = add nsw i32 %mul, %7, !dbg !54
  %idxprom = sext i32 %add to i64, !dbg !54
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %idxprom, !dbg !54
  %8 = load i8, i8* %arrayidx, align 1, !dbg !54
  %conv = sext i8 %8 to i32, !dbg !54
  %cmp4 = icmp eq i32 %conv, 42, !dbg !55
  br i1 %cmp4, label %cond.true, label %cond.false, !dbg !54

cond.true:                                        ; preds = %for.body3
  %9 = load i8*, i8** @b, align 8, !dbg !56
  %10 = load i32, i32* %i, align 4, !dbg !56
  %sub = sub nsw i32 %10, 1, !dbg !56
  %11 = load i32, i32* @w, align 4, !dbg !56
  %mul6 = mul nsw i32 %sub, %11, !dbg !56
  %12 = load i32, i32* %j, align 4, !dbg !56
  %add7 = add nsw i32 %mul6, %12, !dbg !56
  %idxprom8 = sext i32 %add7 to i64, !dbg !56
  %arrayidx9 = getelementptr inbounds i8, i8* %9, i64 %idxprom8, !dbg !56
  %13 = load i8, i8* %arrayidx9, align 1, !dbg !56
  %conv10 = sext i8 %13 to i32, !dbg !56
  %cmp11 = icmp eq i32 32, %conv10, !dbg !56
  %14 = zext i1 %cmp11 to i64, !dbg !56
  %cond = select i1 %cmp11, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), !dbg !56
  br label %cond.end, !dbg !54

cond.false:                                       ; preds = %for.body3
  br label %cond.end, !dbg !54

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond13 = phi i8* [ %cond, %cond.true ], [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0), %cond.false ], !dbg !54
  %15 = load i8*, i8** @b, align 8, !dbg !57
  %16 = load i32, i32* %i, align 4, !dbg !57
  %17 = load i32, i32* @w, align 4, !dbg !57
  %mul14 = mul nsw i32 %16, %17, !dbg !57
  %18 = load i32, i32* %j, align 4, !dbg !57
  %add15 = add nsw i32 %mul14, %18, !dbg !57
  %idxprom16 = sext i32 %add15 to i64, !dbg !57
  %arrayidx17 = getelementptr inbounds i8, i8* %15, i64 %idxprom16, !dbg !57
  %19 = load i8, i8* %arrayidx17, align 1, !dbg !57
  %conv18 = sext i8 %19 to i32, !dbg !57
  %call19 = call i32 (i8*, ...) @printf(i8* %cond13, i32 %conv18), !dbg !58
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %cond.end
  %20 = load i32, i32* %j, align 4, !dbg !59
  %inc = add nsw i32 %20, 1, !dbg !59
  store i32 %inc, i32* %j, align 4, !dbg !59
  %call20 = call i32 @putchar(i32 32), !dbg !60
  br label %for.cond1, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond1
  br label %for.inc21, !dbg !63

for.inc21:                                        ; preds = %for.end
  %21 = load i32, i32* %i, align 4, !dbg !64
  %inc22 = add nsw i32 %21, 1, !dbg !64
  store i32 %inc22, i32* %i, align 4, !dbg !64
  %call23 = call i32 @putchar(i32 10), !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end24:                                        ; preds = %for.cond
  ret void, !dbg !69
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @puts(i8*) #2

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @putchar(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @init() #0 !dbg !70 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32* %j, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i32 @puts(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0)), !dbg !75
  %0 = load i32, i32* @w, align 4, !dbg !76
  %1 = load i32, i32* @h, align 4, !dbg !77
  %mul = mul nsw i32 %0, %1, !dbg !78
  %conv = sext i32 %mul to i64, !dbg !76
  %call1 = call noalias i8* @malloc(i64 %conv) #6, !dbg !79
  store i8* %call1, i8** @b, align 8, !dbg !80
  %2 = load i8*, i8** @b, align 8, !dbg !81
  %3 = load i32, i32* @w, align 4, !dbg !82
  %4 = load i32, i32* @h, align 4, !dbg !83
  %mul2 = mul nsw i32 %3, %4, !dbg !84
  %conv3 = sext i32 %mul2 to i64, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 32, i64 %conv3, i1 false), !dbg !85
  %call4 = call noalias i8* @malloc(i64 8192) #6, !dbg !86
  %5 = bitcast i8* %call4 to i32*, !dbg !86
  store i32* %5, i32** @x, align 8, !dbg !87
  %6 = load i32*, i32** @x, align 8, !dbg !88
  %add.ptr = getelementptr inbounds i32, i32* %6, i64 1024, !dbg !89
  store i32* %add.ptr, i32** @y, align 8, !dbg !90
  store i32 0, i32* %i, align 4, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc15, %entry
  %7 = load i32, i32* %i, align 4, !dbg !94
  %8 = load i32, i32* @n, align 4, !dbg !96
  %cmp = icmp slt i32 %7, %8, !dbg !97
  br i1 %cmp, label %for.body, label %for.end16, !dbg !98

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !99
  %sub = sub nsw i32 0, %9, !dbg !101
  store i32 %sub, i32* %j, align 4, !dbg !102
  br label %for.cond6, !dbg !103

for.cond6:                                        ; preds = %for.inc, %for.body
  %10 = load i32, i32* %j, align 4, !dbg !104
  %11 = load i32, i32* %i, align 4, !dbg !106
  %cmp7 = icmp sle i32 %10, %11, !dbg !107
  br i1 %cmp7, label %for.body9, label %for.end, !dbg !108

for.body9:                                        ; preds = %for.cond6
  %12 = load i8*, i8** @b, align 8, !dbg !109
  %13 = load i32, i32* %i, align 4, !dbg !109
  %mul10 = mul nsw i32 2, %13, !dbg !109
  %add = add nsw i32 %mul10, 2, !dbg !109
  %14 = load i32, i32* @w, align 4, !dbg !109
  %mul11 = mul nsw i32 %add, %14, !dbg !109
  %15 = load i32, i32* %j, align 4, !dbg !109
  %add12 = add nsw i32 %mul11, %15, !dbg !109
  %16 = load i32, i32* @w, align 4, !dbg !109
  %div = sdiv i32 %16, 2, !dbg !109
  %add13 = add nsw i32 %add12, %div, !dbg !109
  %idxprom = sext i32 %add13 to i64, !dbg !109
  %arrayidx = getelementptr inbounds i8, i8* %12, i64 %idxprom, !dbg !109
  store i8 42, i8* %arrayidx, align 1, !dbg !110
  br label %for.inc, !dbg !109

for.inc:                                          ; preds = %for.body9
  %17 = load i32, i32* %j, align 4, !dbg !111
  %add14 = add nsw i32 %17, 2, !dbg !111
  store i32 %add14, i32* %j, align 4, !dbg !111
  br label %for.cond6, !dbg !112, !llvm.loop !113

for.end:                                          ; preds = %for.cond6
  br label %for.inc15, !dbg !114

for.inc15:                                        ; preds = %for.end
  %18 = load i32, i32* %i, align 4, !dbg !115
  %inc = add nsw i32 %18, 1, !dbg !115
  store i32 %inc, i32* %i, align 4, !dbg !115
  br label %for.cond, !dbg !116, !llvm.loop !117

for.end16:                                        ; preds = %for.cond
  %call17 = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !119
  call void @srand(i32 %call17) #6, !dbg !120
  ret void, !dbg !121
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

declare dso_local i32 @time(...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @move(i32 %idx) #0 !dbg !122 {
entry:
  %idx.addr = alloca i32, align 4
  %xx = alloca i32, align 4
  %yy = alloca i32, align 4
  %c = alloca i32, align 4
  %kill = alloca i32, align 4
  %sl = alloca i32, align 4
  %o = alloca i32, align 4
  store i32 %idx, i32* %idx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %idx.addr, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i32* %xx, metadata !127, metadata !DIExpression()), !dbg !128
  %0 = load i32*, i32** @x, align 8, !dbg !129
  %1 = load i32, i32* %idx.addr, align 4, !dbg !130
  %idxprom = sext i32 %1 to i64, !dbg !129
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %idxprom, !dbg !129
  %2 = load i32, i32* %arrayidx, align 4, !dbg !129
  store i32 %2, i32* %xx, align 4, !dbg !128
  call void @llvm.dbg.declare(metadata i32* %yy, metadata !131, metadata !DIExpression()), !dbg !132
  %3 = load i32*, i32** @y, align 8, !dbg !133
  %4 = load i32, i32* %idx.addr, align 4, !dbg !134
  %idxprom1 = sext i32 %4 to i64, !dbg !133
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %idxprom1, !dbg !133
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !133
  store i32 %5, i32* %yy, align 4, !dbg !132
  call void @llvm.dbg.declare(metadata i32* %c, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata i32* %kill, metadata !137, metadata !DIExpression()), !dbg !138
  store i32 0, i32* %kill, align 4, !dbg !138
  call void @llvm.dbg.declare(metadata i32* %sl, metadata !139, metadata !DIExpression()), !dbg !140
  store i32 3, i32* %sl, align 4, !dbg !140
  call void @llvm.dbg.declare(metadata i32* %o, metadata !141, metadata !DIExpression()), !dbg !142
  store i32 0, i32* %o, align 4, !dbg !142
  %6 = load i32, i32* %yy, align 4, !dbg !143
  %cmp = icmp slt i32 %6, 0, !dbg !145
  br i1 %cmp, label %if.then, label %if.end, !dbg !146, !cf.info !147

if.then:                                          ; preds = %entry
  br label %if.end99, !dbg !148

if.end:                                           ; preds = %entry
  %7 = load i32, i32* %yy, align 4, !dbg !149
  %8 = load i32, i32* @h, align 4, !dbg !151
  %sub = sub nsw i32 %8, 1, !dbg !152
  %cmp3 = icmp eq i32 %7, %sub, !dbg !153
  br i1 %cmp3, label %if.then4, label %if.end7, !dbg !154, !cf.info !147

if.then4:                                         ; preds = %if.end
  %9 = load i32*, i32** @y, align 8, !dbg !155
  %10 = load i32, i32* %idx.addr, align 4, !dbg !157
  %idxprom5 = sext i32 %10 to i64, !dbg !155
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !155
  store i32 -1, i32* %arrayidx6, align 4, !dbg !158
  br label %if.end99, !dbg !159

if.end7:                                          ; preds = %if.end
  %11 = load i8*, i8** @b, align 8, !dbg !160
  %12 = load i32, i32* %yy, align 4, !dbg !160
  %add = add nsw i32 %12, 1, !dbg !160
  %13 = load i32, i32* @w, align 4, !dbg !160
  %mul = mul nsw i32 %add, %13, !dbg !160
  %14 = load i32, i32* %xx, align 4, !dbg !160
  %add8 = add nsw i32 %mul, %14, !dbg !160
  %idxprom9 = sext i32 %add8 to i64, !dbg !160
  %arrayidx10 = getelementptr inbounds i8, i8* %11, i64 %idxprom9, !dbg !160
  %15 = load i8, i8* %arrayidx10, align 1, !dbg !160
  %conv = sext i8 %15 to i32, !dbg !160
  store i32 %conv, i32* %c, align 4, !dbg !161
  switch i32 %conv, label %sw.default [
    i32 32, label %sw.bb
    i32 42, label %sw.bb11
  ], !dbg !162

sw.bb:                                            ; preds = %if.end7
  %16 = load i32, i32* %yy, align 4, !dbg !163
  %inc = add nsw i32 %16, 1, !dbg !163
  store i32 %inc, i32* %yy, align 4, !dbg !163
  br label %sw.epilog, !dbg !165

sw.bb11:                                          ; preds = %if.end7
  store i32 1, i32* %sl, align 4, !dbg !166
  br label %sw.default, !dbg !167

sw.default:                                       ; preds = %if.end7, %sw.bb11
  %17 = load i32, i32* %xx, align 4, !dbg !168
  %18 = load i32, i32* @w, align 4, !dbg !170
  %sub12 = sub nsw i32 %18, 1, !dbg !171
  %cmp13 = icmp slt i32 %17, %sub12, !dbg !172
  br i1 %cmp13, label %land.lhs.true, label %if.end37, !dbg !173, !cf.info !147

land.lhs.true:                                    ; preds = %sw.default
  %19 = load i8*, i8** @b, align 8, !dbg !174
  %20 = load i32, i32* %yy, align 4, !dbg !174
  %21 = load i32, i32* @w, align 4, !dbg !174
  %mul15 = mul nsw i32 %20, %21, !dbg !174
  %22 = load i32, i32* %xx, align 4, !dbg !174
  %add16 = add nsw i32 %mul15, %22, !dbg !174
  %add17 = add nsw i32 %add16, 1, !dbg !174
  %idxprom18 = sext i32 %add17 to i64, !dbg !174
  %arrayidx19 = getelementptr inbounds i8, i8* %19, i64 %idxprom18, !dbg !174
  %23 = load i8, i8* %arrayidx19, align 1, !dbg !174
  %conv20 = sext i8 %23 to i32, !dbg !174
  %cmp21 = icmp eq i32 32, %conv20, !dbg !174
  br i1 %cmp21, label %land.lhs.true23, label %if.end37, !dbg !175, !cf.info !147

land.lhs.true23:                                  ; preds = %land.lhs.true
  %24 = load i8*, i8** @b, align 8, !dbg !176
  %25 = load i32, i32* %yy, align 4, !dbg !176
  %add24 = add nsw i32 %25, 1, !dbg !176
  %26 = load i32, i32* @w, align 4, !dbg !176
  %mul25 = mul nsw i32 %add24, %26, !dbg !176
  %27 = load i32, i32* %xx, align 4, !dbg !176
  %add26 = add nsw i32 %mul25, %27, !dbg !176
  %add27 = add nsw i32 %add26, 1, !dbg !176
  %idxprom28 = sext i32 %add27 to i64, !dbg !176
  %arrayidx29 = getelementptr inbounds i8, i8* %24, i64 %idxprom28, !dbg !176
  %28 = load i8, i8* %arrayidx29, align 1, !dbg !176
  %conv30 = sext i8 %28 to i32, !dbg !176
  %cmp31 = icmp eq i32 32, %conv30, !dbg !176
  br i1 %cmp31, label %if.then33, label %if.end37, !dbg !177, !cf.info !147

if.then33:                                        ; preds = %land.lhs.true23
  %29 = load i32, i32* %sl, align 4, !dbg !178
  %inc34 = add nsw i32 %29, 1, !dbg !178
  store i32 %inc34, i32* %sl, align 4, !dbg !178
  %call = call i32 @rnd(i32 %29), !dbg !180
  %tobool = icmp ne i32 %call, 0, !dbg !180
  br i1 %tobool, label %if.end36, label %if.then35, !dbg !181, !cf.info !147

if.then35:                                        ; preds = %if.then33
  store i32 1, i32* %o, align 4, !dbg !182
  br label %if.end36, !dbg !183

if.end36:                                         ; preds = %if.then35, %if.then33
  br label %if.end37, !dbg !184

if.end37:                                         ; preds = %if.end36, %land.lhs.true23, %land.lhs.true, %sw.default
  %30 = load i32, i32* %xx, align 4, !dbg !185
  %tobool38 = icmp ne i32 %30, 0, !dbg !185
  br i1 %tobool38, label %land.lhs.true39, label %if.end64, !dbg !187, !cf.info !147

land.lhs.true39:                                  ; preds = %if.end37
  %31 = load i8*, i8** @b, align 8, !dbg !188
  %32 = load i32, i32* %yy, align 4, !dbg !188
  %33 = load i32, i32* @w, align 4, !dbg !188
  %mul40 = mul nsw i32 %32, %33, !dbg !188
  %34 = load i32, i32* %xx, align 4, !dbg !188
  %add41 = add nsw i32 %mul40, %34, !dbg !188
  %sub42 = sub nsw i32 %add41, 1, !dbg !188
  %idxprom43 = sext i32 %sub42 to i64, !dbg !188
  %arrayidx44 = getelementptr inbounds i8, i8* %31, i64 %idxprom43, !dbg !188
  %35 = load i8, i8* %arrayidx44, align 1, !dbg !188
  %conv45 = sext i8 %35 to i32, !dbg !188
  %cmp46 = icmp eq i32 32, %conv45, !dbg !188
  br i1 %cmp46, label %land.lhs.true48, label %if.end64, !dbg !189, !cf.info !147

land.lhs.true48:                                  ; preds = %land.lhs.true39
  %36 = load i8*, i8** @b, align 8, !dbg !190
  %37 = load i32, i32* %yy, align 4, !dbg !190
  %add49 = add nsw i32 %37, 1, !dbg !190
  %38 = load i32, i32* @w, align 4, !dbg !190
  %mul50 = mul nsw i32 %add49, %38, !dbg !190
  %39 = load i32, i32* %xx, align 4, !dbg !190
  %add51 = add nsw i32 %mul50, %39, !dbg !190
  %sub52 = sub nsw i32 %add51, 1, !dbg !190
  %idxprom53 = sext i32 %sub52 to i64, !dbg !190
  %arrayidx54 = getelementptr inbounds i8, i8* %36, i64 %idxprom53, !dbg !190
  %40 = load i8, i8* %arrayidx54, align 1, !dbg !190
  %conv55 = sext i8 %40 to i32, !dbg !190
  %cmp56 = icmp eq i32 32, %conv55, !dbg !190
  br i1 %cmp56, label %if.then58, label %if.end64, !dbg !191, !cf.info !147

if.then58:                                        ; preds = %land.lhs.true48
  %41 = load i32, i32* %sl, align 4, !dbg !192
  %inc59 = add nsw i32 %41, 1, !dbg !192
  store i32 %inc59, i32* %sl, align 4, !dbg !192
  %call60 = call i32 @rnd(i32 %41), !dbg !194
  %tobool61 = icmp ne i32 %call60, 0, !dbg !194
  br i1 %tobool61, label %if.end63, label %if.then62, !dbg !195, !cf.info !147

if.then62:                                        ; preds = %if.then58
  store i32 -1, i32* %o, align 4, !dbg !196
  br label %if.end63, !dbg !197

if.end63:                                         ; preds = %if.then62, %if.then58
  br label %if.end64, !dbg !198

if.end64:                                         ; preds = %if.end63, %land.lhs.true48, %land.lhs.true39, %if.end37
  %42 = load i32, i32* %o, align 4, !dbg !199
  %tobool65 = icmp ne i32 %42, 0, !dbg !199
  br i1 %tobool65, label %if.end67, label %if.then66, !dbg !201, !cf.info !147

if.then66:                                        ; preds = %if.end64
  store i32 1, i32* %kill, align 4, !dbg !202
  br label %if.end67, !dbg !203

if.end67:                                         ; preds = %if.then66, %if.end64
  %43 = load i32, i32* %o, align 4, !dbg !204
  %44 = load i32, i32* %xx, align 4, !dbg !205
  %add68 = add nsw i32 %44, %43, !dbg !205
  store i32 %add68, i32* %xx, align 4, !dbg !205
  br label %sw.epilog, !dbg !206

sw.epilog:                                        ; preds = %if.end67, %sw.bb
  %45 = load i8*, i8** @b, align 8, !dbg !207
  %46 = load i32*, i32** @y, align 8, !dbg !207
  %47 = load i32, i32* %idx.addr, align 4, !dbg !207
  %idxprom69 = sext i32 %47 to i64, !dbg !207
  %arrayidx70 = getelementptr inbounds i32, i32* %46, i64 %idxprom69, !dbg !207
  %48 = load i32, i32* %arrayidx70, align 4, !dbg !207
  %49 = load i32, i32* @w, align 4, !dbg !207
  %mul71 = mul nsw i32 %48, %49, !dbg !207
  %50 = load i32*, i32** @x, align 8, !dbg !207
  %51 = load i32, i32* %idx.addr, align 4, !dbg !207
  %idxprom72 = sext i32 %51 to i64, !dbg !207
  %arrayidx73 = getelementptr inbounds i32, i32* %50, i64 %idxprom72, !dbg !207
  %52 = load i32, i32* %arrayidx73, align 4, !dbg !207
  %add74 = add nsw i32 %mul71, %52, !dbg !207
  %idxprom75 = sext i32 %add74 to i64, !dbg !207
  %arrayidx76 = getelementptr inbounds i8, i8* %45, i64 %idxprom75, !dbg !207
  %53 = load i8, i8* %arrayidx76, align 1, !dbg !207
  %conv77 = sext i8 %53 to i32, !dbg !207
  store i32 %conv77, i32* %c, align 4, !dbg !208
  %54 = load i8*, i8** @b, align 8, !dbg !209
  %55 = load i32*, i32** @y, align 8, !dbg !209
  %56 = load i32, i32* %idx.addr, align 4, !dbg !209
  %idxprom78 = sext i32 %56 to i64, !dbg !209
  %arrayidx79 = getelementptr inbounds i32, i32* %55, i64 %idxprom78, !dbg !209
  %57 = load i32, i32* %arrayidx79, align 4, !dbg !209
  %58 = load i32, i32* @w, align 4, !dbg !209
  %mul80 = mul nsw i32 %57, %58, !dbg !209
  %59 = load i32*, i32** @x, align 8, !dbg !209
  %60 = load i32, i32* %idx.addr, align 4, !dbg !209
  %idxprom81 = sext i32 %60 to i64, !dbg !209
  %arrayidx82 = getelementptr inbounds i32, i32* %59, i64 %idxprom81, !dbg !209
  %61 = load i32, i32* %arrayidx82, align 4, !dbg !209
  %add83 = add nsw i32 %mul80, %61, !dbg !209
  %idxprom84 = sext i32 %add83 to i64, !dbg !209
  %arrayidx85 = getelementptr inbounds i8, i8* %54, i64 %idxprom84, !dbg !209
  store i8 32, i8* %arrayidx85, align 1, !dbg !210
  %62 = load i32, i32* %yy, align 4, !dbg !211
  %63 = load i32, i32* %idx.addr, align 4, !dbg !212
  %64 = load i32*, i32** @y, align 8, !dbg !213
  %idxprom86 = sext i32 %63 to i64, !dbg !213
  %arrayidx87 = getelementptr inbounds i32, i32* %64, i64 %idxprom86, !dbg !213
  store i32 %62, i32* %arrayidx87, align 4, !dbg !214
  %65 = load i32, i32* %xx, align 4, !dbg !215
  %66 = load i32, i32* %idx.addr, align 4, !dbg !216
  %67 = load i32*, i32** @x, align 8, !dbg !217
  %idxprom88 = sext i32 %66 to i64, !dbg !217
  %arrayidx89 = getelementptr inbounds i32, i32* %67, i64 %idxprom88, !dbg !217
  store i32 %65, i32* %arrayidx89, align 4, !dbg !218
  %68 = load i32, i32* %c, align 4, !dbg !219
  %conv90 = trunc i32 %68 to i8, !dbg !219
  %69 = load i8*, i8** @b, align 8, !dbg !220
  %70 = load i32, i32* %yy, align 4, !dbg !220
  %71 = load i32, i32* @w, align 4, !dbg !220
  %mul91 = mul nsw i32 %70, %71, !dbg !220
  %72 = load i32, i32* %xx, align 4, !dbg !220
  %add92 = add nsw i32 %mul91, %72, !dbg !220
  %idxprom93 = sext i32 %add92 to i64, !dbg !220
  %arrayidx94 = getelementptr inbounds i8, i8* %69, i64 %idxprom93, !dbg !220
  store i8 %conv90, i8* %arrayidx94, align 1, !dbg !221
  %73 = load i32, i32* %kill, align 4, !dbg !222
  %tobool95 = icmp ne i32 %73, 0, !dbg !222
  br i1 %tobool95, label %if.then96, label %if.end99, !dbg !224, !cf.info !147

if.then96:                                        ; preds = %sw.epilog
  %74 = load i32, i32* %idx.addr, align 4, !dbg !225
  %75 = load i32*, i32** @y, align 8, !dbg !226
  %idxprom97 = sext i32 %74 to i64, !dbg !226
  %arrayidx98 = getelementptr inbounds i32, i32* %75, i64 %idxprom97, !dbg !226
  store i32 -1, i32* %arrayidx98, align 4, !dbg !227
  br label %if.end99, !dbg !225

if.end99:                                         ; preds = %if.then, %if.then4, %if.then96, %sw.epilog
  ret void, !dbg !228
}

declare dso_local i32 @rnd(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @run() #0 !dbg !11 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !229, metadata !DIExpression()), !dbg !230
  store i32 0, i32* %i, align 4, !dbg !231
  br label %for.cond, !dbg !233

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !234
  %1 = load i32, i32* @cnt, align 4, !dbg !236
  %cmp = icmp slt i32 %0, %1, !dbg !237
  br i1 %cmp, label %for.body, label %for.end, !dbg !238

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !239
  call void @move(i32 %2), !dbg !240
  br label %for.inc, !dbg !240

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !241
  %inc = add nsw i32 %3, 1, !dbg !241
  store i32 %inc, i32* %i, align 4, !dbg !241
  br label %for.cond, !dbg !242, !llvm.loop !243

for.end:                                          ; preds = %for.cond
  %4 = load i32, i32* @run.step, align 4, !dbg !245
  %inc1 = add nsw i32 %4, 1, !dbg !245
  store i32 %inc1, i32* @run.step, align 4, !dbg !245
  %cmp2 = icmp eq i32 2, %inc1, !dbg !247
  br i1 %cmp2, label %land.lhs.true, label %if.end26, !dbg !248, !cf.info !147

land.lhs.true:                                    ; preds = %for.end
  %5 = load i32, i32* @cnt, align 4, !dbg !249
  %cmp3 = icmp slt i32 %5, 1024, !dbg !250
  br i1 %cmp3, label %if.then, label %if.end26, !dbg !251, !cf.info !147

if.then:                                          ; preds = %land.lhs.true
  store i32 0, i32* @run.step, align 4, !dbg !252
  %6 = load i32, i32* @w, align 4, !dbg !254
  %div = sdiv i32 %6, 2, !dbg !255
  %7 = load i32*, i32** @x, align 8, !dbg !256
  %8 = load i32, i32* @cnt, align 4, !dbg !257
  %idxprom = sext i32 %8 to i64, !dbg !256
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !256
  store i32 %div, i32* %arrayidx, align 4, !dbg !258
  %9 = load i32*, i32** @y, align 8, !dbg !259
  %10 = load i32, i32* @cnt, align 4, !dbg !260
  %idxprom4 = sext i32 %10 to i64, !dbg !259
  %arrayidx5 = getelementptr inbounds i32, i32* %9, i64 %idxprom4, !dbg !259
  store i32 0, i32* %arrayidx5, align 4, !dbg !261
  %11 = load i8*, i8** @b, align 8, !dbg !262
  %12 = load i32*, i32** @y, align 8, !dbg !262
  %13 = load i32, i32* @cnt, align 4, !dbg !262
  %idxprom6 = sext i32 %13 to i64, !dbg !262
  %arrayidx7 = getelementptr inbounds i32, i32* %12, i64 %idxprom6, !dbg !262
  %14 = load i32, i32* %arrayidx7, align 4, !dbg !262
  %15 = load i32, i32* @w, align 4, !dbg !262
  %mul = mul nsw i32 %14, %15, !dbg !262
  %16 = load i32*, i32** @x, align 8, !dbg !262
  %17 = load i32, i32* @cnt, align 4, !dbg !262
  %idxprom8 = sext i32 %17 to i64, !dbg !262
  %arrayidx9 = getelementptr inbounds i32, i32* %16, i64 %idxprom8, !dbg !262
  %18 = load i32, i32* %arrayidx9, align 4, !dbg !262
  %add = add nsw i32 %mul, %18, !dbg !262
  %idxprom10 = sext i32 %add to i64, !dbg !262
  %arrayidx11 = getelementptr inbounds i8, i8* %11, i64 %idxprom10, !dbg !262
  %19 = load i8, i8* %arrayidx11, align 1, !dbg !262
  %conv = sext i8 %19 to i32, !dbg !262
  %cmp12 = icmp ne i32 %conv, 32, !dbg !264
  br i1 %cmp12, label %if.then14, label %if.end, !dbg !265, !cf.info !147

if.then14:                                        ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !266
  br label %return, !dbg !266

if.end:                                           ; preds = %if.then
  %call = call i32 @rnd(i32 80), !dbg !267
  %add15 = add nsw i32 %call, 43, !dbg !268
  %conv16 = trunc i32 %add15 to i8, !dbg !267
  %20 = load i8*, i8** @b, align 8, !dbg !269
  %21 = load i32*, i32** @y, align 8, !dbg !269
  %22 = load i32, i32* @cnt, align 4, !dbg !269
  %idxprom17 = sext i32 %22 to i64, !dbg !269
  %arrayidx18 = getelementptr inbounds i32, i32* %21, i64 %idxprom17, !dbg !269
  %23 = load i32, i32* %arrayidx18, align 4, !dbg !269
  %24 = load i32, i32* @w, align 4, !dbg !269
  %mul19 = mul nsw i32 %23, %24, !dbg !269
  %25 = load i32*, i32** @x, align 8, !dbg !269
  %26 = load i32, i32* @cnt, align 4, !dbg !269
  %idxprom20 = sext i32 %26 to i64, !dbg !269
  %arrayidx21 = getelementptr inbounds i32, i32* %25, i64 %idxprom20, !dbg !269
  %27 = load i32, i32* %arrayidx21, align 4, !dbg !269
  %add22 = add nsw i32 %mul19, %27, !dbg !269
  %idxprom23 = sext i32 %add22 to i64, !dbg !269
  %arrayidx24 = getelementptr inbounds i8, i8* %20, i64 %idxprom23, !dbg !269
  store i8 %conv16, i8* %arrayidx24, align 1, !dbg !270
  %28 = load i32, i32* @cnt, align 4, !dbg !271
  %inc25 = add nsw i32 %28, 1, !dbg !271
  store i32 %inc25, i32* @cnt, align 4, !dbg !271
  br label %if.end26, !dbg !272

if.end26:                                         ; preds = %if.end, %land.lhs.true, %for.end
  store i32 1, i32* %retval, align 4, !dbg !273
  br label %return, !dbg !273

return:                                           ; preds = %if.end26, %if.then14
  %29 = load i32, i32* %retval, align 4, !dbg !274
  ret i32 %29, !dbg !274
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !275 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %v.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !279, metadata !DIExpression()), !dbg !280
  store i8** %v, i8*** %v.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %v.addr, metadata !281, metadata !DIExpression()), !dbg !282
  %0 = load i32, i32* %c.addr, align 4, !dbg !283
  %cmp = icmp slt i32 %0, 2, !dbg !285
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !286, !cf.info !147

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8**, i8*** %v.addr, align 8, !dbg !287
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !287
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !287
  %call = call i32 @atoi(i8* %2) #7, !dbg !288
  store i32 %call, i32* @n, align 4, !dbg !289
  %cmp1 = icmp sle i32 %call, 3, !dbg !290
  br i1 %cmp1, label %if.then, label %if.end, !dbg !291, !cf.info !147

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 5, i32* @n, align 4, !dbg !292
  br label %if.end, !dbg !293

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %3 = load i32, i32* @n, align 4, !dbg !294
  %cmp2 = icmp sge i32 %3, 20, !dbg !296
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !297, !cf.info !147

if.then3:                                         ; preds = %if.end
  store i32 20, i32* @n, align 4, !dbg !298
  br label %if.end4, !dbg !299

if.end4:                                          ; preds = %if.then3, %if.end
  %4 = load i32, i32* @n, align 4, !dbg !300
  %mul = mul nsw i32 %4, 2, !dbg !301
  %add = add nsw i32 %mul, 1, !dbg !302
  store i32 %add, i32* @w, align 4, !dbg !303
  call void @init(), !dbg !304
  br label %do.body, !dbg !305

do.body:                                          ; preds = %do.cond, %if.end4
  call void @show_board(), !dbg !306
  %call5 = call i32 (i32, ...) bitcast (i32 (...)* @usleep to i32 (i32, ...)*)(i32 60000), !dbg !308
  br label %do.cond, !dbg !309

do.cond:                                          ; preds = %do.body
  %call6 = call i32 @run(), !dbg !310
  %tobool = icmp ne i32 %call6, 0, !dbg !309
  br i1 %tobool, label %do.body, label %do.end, !dbg !309, !llvm.loop !311

do.end:                                           ; preds = %do.cond
  ret i32 0, !dbg !313
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #5

declare dso_local i32 @usleep(...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!27, !28, !29}
!llvm.ident = !{!30}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "h", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "galton-box-animation.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Galton-box-animation")
!4 = !{}
!5 = !{!0, !6, !9, !14, !16, !18, !21, !23}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "cnt", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "step", scope: !11, file: !3, line: 66, type: !8, isLocal: true, isDefinition: true)
!11 = distinct !DISubprogram(name: "run", scope: !3, file: !3, line: 64, type: !12, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!12 = !DISubroutineType(types: !13)
!13 = !{!8}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "n", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "w", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "x", scope: !2, file: !3, line: 6, type: !20, isLocal: false, isDefinition: true)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "y", scope: !2, file: !3, line: 6, type: !20, isLocal: false, isDefinition: true)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "b", scope: !2, file: !3, line: 7, type: !25, isLocal: false, isDefinition: true)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!27 = !{i32 7, !"Dwarf Version", i32 4}
!28 = !{i32 2, !"Debug Info Version", i32 3}
!29 = !{i32 1, !"wchar_size", i32 4}
!30 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!31 = distinct !DISubprogram(name: "show_board", scope: !3, file: !3, line: 14, type: !32, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!32 = !DISubroutineType(types: !33)
!33 = !{null}
!34 = !DILocalVariable(name: "i", scope: !31, file: !3, line: 16, type: !8)
!35 = !DILocation(line: 16, column: 6, scope: !31)
!36 = !DILocalVariable(name: "j", scope: !31, file: !3, line: 16, type: !8)
!37 = !DILocation(line: 16, column: 9, scope: !31)
!38 = !DILocation(line: 17, column: 7, scope: !39)
!39 = distinct !DILexicalBlock(scope: !31, file: !3, line: 17, column: 2)
!40 = !DILocation(line: 17, column: 25, scope: !39)
!41 = !DILocation(line: 17, column: 30, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !3, line: 17, column: 2)
!43 = !DILocation(line: 17, column: 34, scope: !42)
!44 = !DILocation(line: 17, column: 32, scope: !42)
!45 = !DILocation(line: 17, column: 2, scope: !39)
!46 = !DILocation(line: 18, column: 10, scope: !47)
!47 = distinct !DILexicalBlock(scope: !42, file: !3, line: 18, column: 3)
!48 = !DILocation(line: 18, column: 8, scope: !47)
!49 = !DILocation(line: 18, column: 15, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !3, line: 18, column: 3)
!51 = !DILocation(line: 18, column: 19, scope: !50)
!52 = !DILocation(line: 18, column: 17, scope: !50)
!53 = !DILocation(line: 18, column: 3, scope: !47)
!54 = !DILocation(line: 19, column: 11, scope: !50)
!55 = !DILocation(line: 19, column: 19, scope: !50)
!56 = !DILocation(line: 20, column: 5, scope: !50)
!57 = !DILocation(line: 21, column: 32, scope: !50)
!58 = !DILocation(line: 19, column: 4, scope: !50)
!59 = !DILocation(line: 18, column: 23, scope: !50)
!60 = !DILocation(line: 18, column: 27, scope: !50)
!61 = !DILocation(line: 18, column: 3, scope: !50)
!62 = distinct !{!62, !53, !63}
!63 = !DILocation(line: 21, column: 39, scope: !47)
!64 = !DILocation(line: 17, column: 38, scope: !42)
!65 = !DILocation(line: 17, column: 42, scope: !42)
!66 = !DILocation(line: 17, column: 2, scope: !42)
!67 = distinct !{!67, !45, !68}
!68 = !DILocation(line: 21, column: 39, scope: !39)
!69 = !DILocation(line: 22, column: 1, scope: !31)
!70 = distinct !DISubprogram(name: "init", scope: !3, file: !3, line: 24, type: !32, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DILocalVariable(name: "i", scope: !70, file: !3, line: 26, type: !8)
!72 = !DILocation(line: 26, column: 6, scope: !70)
!73 = !DILocalVariable(name: "j", scope: !70, file: !3, line: 26, type: !8)
!74 = !DILocation(line: 26, column: 9, scope: !70)
!75 = !DILocation(line: 27, column: 2, scope: !70)
!76 = !DILocation(line: 28, column: 13, scope: !70)
!77 = !DILocation(line: 28, column: 17, scope: !70)
!78 = !DILocation(line: 28, column: 15, scope: !70)
!79 = !DILocation(line: 28, column: 6, scope: !70)
!80 = !DILocation(line: 28, column: 4, scope: !70)
!81 = !DILocation(line: 29, column: 9, scope: !70)
!82 = !DILocation(line: 29, column: 17, scope: !70)
!83 = !DILocation(line: 29, column: 21, scope: !70)
!84 = !DILocation(line: 29, column: 19, scope: !70)
!85 = !DILocation(line: 29, column: 2, scope: !70)
!86 = !DILocation(line: 31, column: 6, scope: !70)
!87 = !DILocation(line: 31, column: 4, scope: !70)
!88 = !DILocation(line: 32, column: 6, scope: !70)
!89 = !DILocation(line: 32, column: 8, scope: !70)
!90 = !DILocation(line: 32, column: 4, scope: !70)
!91 = !DILocation(line: 34, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !70, file: !3, line: 34, column: 2)
!93 = !DILocation(line: 34, column: 7, scope: !92)
!94 = !DILocation(line: 34, column: 14, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !3, line: 34, column: 2)
!96 = !DILocation(line: 34, column: 18, scope: !95)
!97 = !DILocation(line: 34, column: 16, scope: !95)
!98 = !DILocation(line: 34, column: 2, scope: !92)
!99 = !DILocation(line: 35, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !3, line: 35, column: 3)
!101 = !DILocation(line: 35, column: 12, scope: !100)
!102 = !DILocation(line: 35, column: 10, scope: !100)
!103 = !DILocation(line: 35, column: 8, scope: !100)
!104 = !DILocation(line: 35, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !3, line: 35, column: 3)
!106 = !DILocation(line: 35, column: 21, scope: !105)
!107 = !DILocation(line: 35, column: 18, scope: !105)
!108 = !DILocation(line: 35, column: 3, scope: !100)
!109 = !DILocation(line: 36, column: 4, scope: !105)
!110 = !DILocation(line: 36, column: 24, scope: !105)
!111 = !DILocation(line: 35, column: 26, scope: !105)
!112 = !DILocation(line: 35, column: 3, scope: !105)
!113 = distinct !{!113, !108, !114}
!114 = !DILocation(line: 36, column: 26, scope: !100)
!115 = !DILocation(line: 34, column: 22, scope: !95)
!116 = !DILocation(line: 34, column: 2, scope: !95)
!117 = distinct !{!117, !98, !118}
!118 = !DILocation(line: 36, column: 26, scope: !92)
!119 = !DILocation(line: 37, column: 8, scope: !70)
!120 = !DILocation(line: 37, column: 2, scope: !70)
!121 = !DILocation(line: 38, column: 1, scope: !70)
!122 = distinct !DISubprogram(name: "move", scope: !3, file: !3, line: 40, type: !123, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!123 = !DISubroutineType(types: !124)
!124 = !{null, !8}
!125 = !DILocalVariable(name: "idx", arg: 1, scope: !122, file: !3, line: 40, type: !8)
!126 = !DILocation(line: 40, column: 15, scope: !122)
!127 = !DILocalVariable(name: "xx", scope: !122, file: !3, line: 42, type: !8)
!128 = !DILocation(line: 42, column: 6, scope: !122)
!129 = !DILocation(line: 42, column: 11, scope: !122)
!130 = !DILocation(line: 42, column: 13, scope: !122)
!131 = !DILocalVariable(name: "yy", scope: !122, file: !3, line: 42, type: !8)
!132 = !DILocation(line: 42, column: 19, scope: !122)
!133 = !DILocation(line: 42, column: 24, scope: !122)
!134 = !DILocation(line: 42, column: 26, scope: !122)
!135 = !DILocalVariable(name: "c", scope: !122, file: !3, line: 42, type: !8)
!136 = !DILocation(line: 42, column: 32, scope: !122)
!137 = !DILocalVariable(name: "kill", scope: !122, file: !3, line: 42, type: !8)
!138 = !DILocation(line: 42, column: 35, scope: !122)
!139 = !DILocalVariable(name: "sl", scope: !122, file: !3, line: 42, type: !8)
!140 = !DILocation(line: 42, column: 45, scope: !122)
!141 = !DILocalVariable(name: "o", scope: !122, file: !3, line: 42, type: !8)
!142 = !DILocation(line: 42, column: 53, scope: !122)
!143 = !DILocation(line: 44, column: 6, scope: !144)
!144 = distinct !DILexicalBlock(scope: !122, file: !3, line: 44, column: 6)
!145 = !DILocation(line: 44, column: 9, scope: !144)
!146 = !DILocation(line: 44, column: 6, scope: !122)
!147 = !{!"if"}
!148 = !DILocation(line: 44, column: 14, scope: !144)
!149 = !DILocation(line: 45, column: 6, scope: !150)
!150 = distinct !DILexicalBlock(scope: !122, file: !3, line: 45, column: 6)
!151 = !DILocation(line: 45, column: 12, scope: !150)
!152 = !DILocation(line: 45, column: 14, scope: !150)
!153 = !DILocation(line: 45, column: 9, scope: !150)
!154 = !DILocation(line: 45, column: 6, scope: !122)
!155 = !DILocation(line: 45, column: 21, scope: !156)
!156 = distinct !DILexicalBlock(scope: !150, file: !3, line: 45, column: 19)
!157 = !DILocation(line: 45, column: 23, scope: !156)
!158 = !DILocation(line: 45, column: 28, scope: !156)
!159 = !DILocation(line: 45, column: 34, scope: !156)
!160 = !DILocation(line: 47, column: 13, scope: !122)
!161 = !DILocation(line: 47, column: 11, scope: !122)
!162 = !DILocation(line: 47, column: 2, scope: !122)
!163 = !DILocation(line: 48, column: 14, scope: !164)
!164 = distinct !DILexicalBlock(scope: !122, file: !3, line: 47, column: 28)
!165 = !DILocation(line: 48, column: 18, scope: !164)
!166 = !DILocation(line: 49, column: 15, scope: !164)
!167 = !DILocation(line: 49, column: 12, scope: !164)
!168 = !DILocation(line: 50, column: 15, scope: !169)
!169 = distinct !DILexicalBlock(scope: !164, file: !3, line: 50, column: 15)
!170 = !DILocation(line: 50, column: 20, scope: !169)
!171 = !DILocation(line: 50, column: 22, scope: !169)
!172 = !DILocation(line: 50, column: 18, scope: !169)
!173 = !DILocation(line: 50, column: 26, scope: !169)
!174 = !DILocation(line: 50, column: 29, scope: !169)
!175 = !DILocation(line: 50, column: 43, scope: !169)
!176 = !DILocation(line: 50, column: 46, scope: !169)
!177 = !DILocation(line: 50, column: 15, scope: !164)
!178 = !DILocation(line: 51, column: 16, scope: !179)
!179 = distinct !DILexicalBlock(scope: !169, file: !3, line: 51, column: 9)
!180 = !DILocation(line: 51, column: 10, scope: !179)
!181 = !DILocation(line: 51, column: 9, scope: !169)
!182 = !DILocation(line: 51, column: 23, scope: !179)
!183 = !DILocation(line: 51, column: 21, scope: !179)
!184 = !DILocation(line: 51, column: 18, scope: !179)
!185 = !DILocation(line: 52, column: 8, scope: !186)
!186 = distinct !DILexicalBlock(scope: !164, file: !3, line: 52, column: 8)
!187 = !DILocation(line: 52, column: 11, scope: !186)
!188 = !DILocation(line: 52, column: 14, scope: !186)
!189 = !DILocation(line: 52, column: 28, scope: !186)
!190 = !DILocation(line: 52, column: 31, scope: !186)
!191 = !DILocation(line: 52, column: 8, scope: !164)
!192 = !DILocation(line: 53, column: 16, scope: !193)
!193 = distinct !DILexicalBlock(scope: !186, file: !3, line: 53, column: 9)
!194 = !DILocation(line: 53, column: 10, scope: !193)
!195 = !DILocation(line: 53, column: 9, scope: !186)
!196 = !DILocation(line: 53, column: 23, scope: !193)
!197 = !DILocation(line: 53, column: 21, scope: !193)
!198 = !DILocation(line: 53, column: 18, scope: !193)
!199 = !DILocation(line: 54, column: 9, scope: !200)
!200 = distinct !DILexicalBlock(scope: !164, file: !3, line: 54, column: 8)
!201 = !DILocation(line: 54, column: 8, scope: !164)
!202 = !DILocation(line: 54, column: 17, scope: !200)
!203 = !DILocation(line: 54, column: 12, scope: !200)
!204 = !DILocation(line: 55, column: 10, scope: !164)
!205 = !DILocation(line: 55, column: 7, scope: !164)
!206 = !DILocation(line: 56, column: 2, scope: !164)
!207 = !DILocation(line: 58, column: 6, scope: !122)
!208 = !DILocation(line: 58, column: 4, scope: !122)
!209 = !DILocation(line: 58, column: 14, scope: !122)
!210 = !DILocation(line: 58, column: 21, scope: !122)
!211 = !DILocation(line: 59, column: 11, scope: !122)
!212 = !DILocation(line: 59, column: 2, scope: !122)
!213 = !DILocation(line: 59, column: 6, scope: !122)
!214 = !DILocation(line: 59, column: 9, scope: !122)
!215 = !DILocation(line: 59, column: 24, scope: !122)
!216 = !DILocation(line: 59, column: 15, scope: !122)
!217 = !DILocation(line: 59, column: 19, scope: !122)
!218 = !DILocation(line: 59, column: 22, scope: !122)
!219 = !DILocation(line: 60, column: 14, scope: !122)
!220 = !DILocation(line: 60, column: 2, scope: !122)
!221 = !DILocation(line: 60, column: 12, scope: !122)
!222 = !DILocation(line: 61, column: 6, scope: !223)
!223 = distinct !DILexicalBlock(scope: !122, file: !3, line: 61, column: 6)
!224 = !DILocation(line: 61, column: 6, scope: !122)
!225 = !DILocation(line: 61, column: 12, scope: !223)
!226 = !DILocation(line: 61, column: 16, scope: !223)
!227 = !DILocation(line: 61, column: 19, scope: !223)
!228 = !DILocation(line: 62, column: 1, scope: !122)
!229 = !DILocalVariable(name: "i", scope: !11, file: !3, line: 67, type: !8)
!230 = !DILocation(line: 67, column: 6, scope: !11)
!231 = !DILocation(line: 68, column: 9, scope: !232)
!232 = distinct !DILexicalBlock(scope: !11, file: !3, line: 68, column: 2)
!233 = !DILocation(line: 68, column: 7, scope: !232)
!234 = !DILocation(line: 68, column: 14, scope: !235)
!235 = distinct !DILexicalBlock(scope: !232, file: !3, line: 68, column: 2)
!236 = !DILocation(line: 68, column: 18, scope: !235)
!237 = !DILocation(line: 68, column: 16, scope: !235)
!238 = !DILocation(line: 68, column: 2, scope: !232)
!239 = !DILocation(line: 68, column: 33, scope: !235)
!240 = !DILocation(line: 68, column: 28, scope: !235)
!241 = !DILocation(line: 68, column: 24, scope: !235)
!242 = !DILocation(line: 68, column: 2, scope: !235)
!243 = distinct !{!243, !238, !244}
!244 = !DILocation(line: 68, column: 34, scope: !232)
!245 = !DILocation(line: 69, column: 11, scope: !246)
!246 = distinct !DILexicalBlock(scope: !11, file: !3, line: 69, column: 6)
!247 = !DILocation(line: 69, column: 8, scope: !246)
!248 = !DILocation(line: 69, column: 18, scope: !246)
!249 = !DILocation(line: 69, column: 21, scope: !246)
!250 = !DILocation(line: 69, column: 25, scope: !246)
!251 = !DILocation(line: 69, column: 6, scope: !11)
!252 = !DILocation(line: 70, column: 8, scope: !253)
!253 = distinct !DILexicalBlock(scope: !246, file: !3, line: 69, column: 34)
!254 = !DILocation(line: 71, column: 12, scope: !253)
!255 = !DILocation(line: 71, column: 13, scope: !253)
!256 = !DILocation(line: 71, column: 3, scope: !253)
!257 = !DILocation(line: 71, column: 5, scope: !253)
!258 = !DILocation(line: 71, column: 10, scope: !253)
!259 = !DILocation(line: 72, column: 3, scope: !253)
!260 = !DILocation(line: 72, column: 5, scope: !253)
!261 = !DILocation(line: 72, column: 10, scope: !253)
!262 = !DILocation(line: 73, column: 7, scope: !263)
!263 = distinct !DILexicalBlock(scope: !253, file: !3, line: 73, column: 7)
!264 = !DILocation(line: 73, column: 14, scope: !263)
!265 = !DILocation(line: 73, column: 7, scope: !253)
!266 = !DILocation(line: 73, column: 22, scope: !263)
!267 = !DILocation(line: 74, column: 12, scope: !253)
!268 = !DILocation(line: 74, column: 20, scope: !253)
!269 = !DILocation(line: 74, column: 3, scope: !253)
!270 = !DILocation(line: 74, column: 10, scope: !253)
!271 = !DILocation(line: 75, column: 6, scope: !253)
!272 = !DILocation(line: 76, column: 2, scope: !253)
!273 = !DILocation(line: 77, column: 2, scope: !11)
!274 = !DILocation(line: 78, column: 1, scope: !11)
!275 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 80, type: !276, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!276 = !DISubroutineType(types: !277)
!277 = !{!8, !8, !278}
!278 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!279 = !DILocalVariable(name: "c", arg: 1, scope: !275, file: !3, line: 80, type: !8)
!280 = !DILocation(line: 80, column: 14, scope: !275)
!281 = !DILocalVariable(name: "v", arg: 2, scope: !275, file: !3, line: 80, type: !278)
!282 = !DILocation(line: 80, column: 24, scope: !275)
!283 = !DILocation(line: 82, column: 6, scope: !284)
!284 = distinct !DILexicalBlock(scope: !275, file: !3, line: 82, column: 6)
!285 = !DILocation(line: 82, column: 8, scope: !284)
!286 = !DILocation(line: 82, column: 12, scope: !284)
!287 = !DILocation(line: 82, column: 25, scope: !284)
!288 = !DILocation(line: 82, column: 20, scope: !284)
!289 = !DILocation(line: 82, column: 18, scope: !284)
!290 = !DILocation(line: 82, column: 32, scope: !284)
!291 = !DILocation(line: 82, column: 6, scope: !275)
!292 = !DILocation(line: 82, column: 40, scope: !284)
!293 = !DILocation(line: 82, column: 38, scope: !284)
!294 = !DILocation(line: 83, column: 6, scope: !295)
!295 = distinct !DILexicalBlock(scope: !275, file: !3, line: 83, column: 6)
!296 = !DILocation(line: 83, column: 8, scope: !295)
!297 = !DILocation(line: 83, column: 6, scope: !275)
!298 = !DILocation(line: 83, column: 17, scope: !295)
!299 = !DILocation(line: 83, column: 15, scope: !295)
!300 = !DILocation(line: 84, column: 6, scope: !275)
!301 = !DILocation(line: 84, column: 8, scope: !275)
!302 = !DILocation(line: 84, column: 12, scope: !275)
!303 = !DILocation(line: 84, column: 4, scope: !275)
!304 = !DILocation(line: 85, column: 2, scope: !275)
!305 = !DILocation(line: 87, column: 2, scope: !275)
!306 = !DILocation(line: 87, column: 7, scope: !307)
!307 = distinct !DILexicalBlock(scope: !275, file: !3, line: 87, column: 5)
!308 = !DILocation(line: 87, column: 21, scope: !307)
!309 = !DILocation(line: 87, column: 36, scope: !307)
!310 = !DILocation(line: 87, column: 45, scope: !275)
!311 = distinct !{!311, !305, !312}
!312 = !DILocation(line: 87, column: 50, scope: !275)
!313 = !DILocation(line: 89, column: 2, scope: !275)
