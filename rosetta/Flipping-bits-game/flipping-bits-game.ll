; ModuleID = 'flipping-bits-game.c'
source_filename = "flipping-bits-game.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@i = common dso_local global i32 0, align 4, !dbg !0
@j = common dso_local global i32 0, align 4, !dbg !6
@.str = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"Target: \0A\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"Board: \0A\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"What to flip: \00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c" %c\00", align 1
@.str.8 = private unnamed_addr constant [36 x i8] c"Please specify r or c and an number\00", align 1
@.str.9 = private unnamed_addr constant [17 x i8] c"Moves Taken: %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [10 x i8] c"You win!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @fliprow(i32** %b, i32 %sz, i32 %n) #0 !dbg !13 {
entry:
  %b.addr = alloca i32**, align 8
  %sz.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  store i32** %b, i32*** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %b.addr, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 %sz, i32* %sz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %sz.addr, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 0, i32* @i, align 4, !dbg !24
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* @i, align 4, !dbg !27
  %1 = load i32, i32* %sz.addr, align 4, !dbg !29
  %cmp = icmp slt i32 %0, %1, !dbg !30
  br i1 %cmp, label %for.body, label %for.end, !dbg !31

for.body:                                         ; preds = %for.cond
  %2 = load i32**, i32*** %b.addr, align 8, !dbg !32
  %3 = load i32, i32* %n.addr, align 4, !dbg !33
  %add = add nsw i32 %3, 1, !dbg !34
  %idxprom = sext i32 %add to i64, !dbg !32
  %arrayidx = getelementptr inbounds i32*, i32** %2, i64 %idxprom, !dbg !32
  %4 = load i32*, i32** %arrayidx, align 8, !dbg !32
  %5 = load i32, i32* @i, align 4, !dbg !35
  %idxprom1 = sext i32 %5 to i64, !dbg !32
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %idxprom1, !dbg !32
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !32
  %tobool = icmp ne i32 %6, 0, !dbg !36
  %lnot = xor i1 %tobool, true, !dbg !36
  %lnot.ext = zext i1 %lnot to i32, !dbg !36
  %7 = load i32**, i32*** %b.addr, align 8, !dbg !37
  %8 = load i32, i32* %n.addr, align 4, !dbg !38
  %add3 = add nsw i32 %8, 1, !dbg !39
  %idxprom4 = sext i32 %add3 to i64, !dbg !37
  %arrayidx5 = getelementptr inbounds i32*, i32** %7, i64 %idxprom4, !dbg !37
  %9 = load i32*, i32** %arrayidx5, align 8, !dbg !37
  %10 = load i32, i32* @i, align 4, !dbg !40
  %idxprom6 = sext i32 %10 to i64, !dbg !37
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !37
  store i32 %lnot.ext, i32* %arrayidx7, align 4, !dbg !41
  br label %for.inc, !dbg !37

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* @i, align 4, !dbg !42
  %inc = add nsw i32 %11, 1, !dbg !42
  store i32 %inc, i32* @i, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  ret void, !dbg !46
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @flipcol(i32** %b, i32 %sz, i32 %n) #0 !dbg !47 {
entry:
  %b.addr = alloca i32**, align 8
  %sz.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  store i32** %b, i32*** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %b.addr, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 %sz, i32* %sz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %sz.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 1, i32* @i, align 4, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* @i, align 4, !dbg !57
  %1 = load i32, i32* %sz.addr, align 4, !dbg !59
  %cmp = icmp sle i32 %0, %1, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %2 = load i32**, i32*** %b.addr, align 8, !dbg !62
  %3 = load i32, i32* @i, align 4, !dbg !63
  %idxprom = sext i32 %3 to i64, !dbg !62
  %arrayidx = getelementptr inbounds i32*, i32** %2, i64 %idxprom, !dbg !62
  %4 = load i32*, i32** %arrayidx, align 8, !dbg !62
  %5 = load i32, i32* %n.addr, align 4, !dbg !64
  %idxprom1 = sext i32 %5 to i64, !dbg !62
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %idxprom1, !dbg !62
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !62
  %tobool = icmp ne i32 %6, 0, !dbg !65
  %lnot = xor i1 %tobool, true, !dbg !65
  %lnot.ext = zext i1 %lnot to i32, !dbg !65
  %7 = load i32**, i32*** %b.addr, align 8, !dbg !66
  %8 = load i32, i32* @i, align 4, !dbg !67
  %idxprom3 = sext i32 %8 to i64, !dbg !66
  %arrayidx4 = getelementptr inbounds i32*, i32** %7, i64 %idxprom3, !dbg !66
  %9 = load i32*, i32** %arrayidx4, align 8, !dbg !66
  %10 = load i32, i32* %n.addr, align 4, !dbg !68
  %idxprom5 = sext i32 %10 to i64, !dbg !66
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !66
  store i32 %lnot.ext, i32* %arrayidx6, align 4, !dbg !69
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* @i, align 4, !dbg !70
  %inc = add nsw i32 %11, 1, !dbg !70
  store i32 %inc, i32* @i, align 4, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @initt(i32** %t, i32 %sz) #0 !dbg !75 {
entry:
  %t.addr = alloca i32**, align 8
  %sz.addr = alloca i32, align 4
  store i32** %t, i32*** %t.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %t.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i32 %sz, i32* %sz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %sz.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i32 1, i32* @i, align 4, !dbg !82
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32, i32* @i, align 4, !dbg !85
  %1 = load i32, i32* %sz.addr, align 4, !dbg !87
  %cmp = icmp sle i32 %0, %1, !dbg !88
  br i1 %cmp, label %for.body, label %for.end8, !dbg !89

for.body:                                         ; preds = %for.cond
  store i32 0, i32* @j, align 4, !dbg !90
  br label %for.cond1, !dbg !92

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* @j, align 4, !dbg !93
  %3 = load i32, i32* %sz.addr, align 4, !dbg !95
  %cmp2 = icmp slt i32 %2, %3, !dbg !96
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !97

for.body3:                                        ; preds = %for.cond1
  %call = call i32 @rand() #4, !dbg !98
  %rem = srem i32 %call, 2, !dbg !99
  %4 = load i32**, i32*** %t.addr, align 8, !dbg !100
  %5 = load i32, i32* @i, align 4, !dbg !101
  %idxprom = sext i32 %5 to i64, !dbg !100
  %arrayidx = getelementptr inbounds i32*, i32** %4, i64 %idxprom, !dbg !100
  %6 = load i32*, i32** %arrayidx, align 8, !dbg !100
  %7 = load i32, i32* @j, align 4, !dbg !102
  %idxprom4 = sext i32 %7 to i64, !dbg !100
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %idxprom4, !dbg !100
  store i32 %rem, i32* %arrayidx5, align 4, !dbg !103
  br label %for.inc, !dbg !100

for.inc:                                          ; preds = %for.body3
  %8 = load i32, i32* @j, align 4, !dbg !104
  %inc = add nsw i32 %8, 1, !dbg !104
  store i32 %inc, i32* @j, align 4, !dbg !104
  br label %for.cond1, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond1
  br label %for.inc6, !dbg !107

for.inc6:                                         ; preds = %for.end
  %9 = load i32, i32* @i, align 4, !dbg !108
  %inc7 = add nsw i32 %9, 1, !dbg !108
  store i32 %inc7, i32* @i, align 4, !dbg !108
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end8:                                         ; preds = %for.cond
  ret void, !dbg !112
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @initb(i32** %t, i32** %b, i32 %sz) #0 !dbg !113 {
entry:
  %t.addr = alloca i32**, align 8
  %b.addr = alloca i32**, align 8
  %sz.addr = alloca i32, align 4
  store i32** %t, i32*** %t.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %t.addr, metadata !116, metadata !DIExpression()), !dbg !117
  store i32** %b, i32*** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %b.addr, metadata !118, metadata !DIExpression()), !dbg !119
  store i32 %sz, i32* %sz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %sz.addr, metadata !120, metadata !DIExpression()), !dbg !121
  store i32 1, i32* @i, align 4, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = load i32, i32* @i, align 4, !dbg !125
  %1 = load i32, i32* %sz.addr, align 4, !dbg !127
  %cmp = icmp sle i32 %0, %1, !dbg !128
  br i1 %cmp, label %for.body, label %for.end12, !dbg !129

for.body:                                         ; preds = %for.cond
  store i32 0, i32* @j, align 4, !dbg !130
  br label %for.cond1, !dbg !132

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* @j, align 4, !dbg !133
  %3 = load i32, i32* %sz.addr, align 4, !dbg !135
  %cmp2 = icmp slt i32 %2, %3, !dbg !136
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !137

for.body3:                                        ; preds = %for.cond1
  %4 = load i32**, i32*** %t.addr, align 8, !dbg !138
  %5 = load i32, i32* @i, align 4, !dbg !139
  %idxprom = sext i32 %5 to i64, !dbg !138
  %arrayidx = getelementptr inbounds i32*, i32** %4, i64 %idxprom, !dbg !138
  %6 = load i32*, i32** %arrayidx, align 8, !dbg !138
  %7 = load i32, i32* @j, align 4, !dbg !140
  %idxprom4 = sext i32 %7 to i64, !dbg !138
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %idxprom4, !dbg !138
  %8 = load i32, i32* %arrayidx5, align 4, !dbg !138
  %9 = load i32**, i32*** %b.addr, align 8, !dbg !141
  %10 = load i32, i32* @i, align 4, !dbg !142
  %idxprom6 = sext i32 %10 to i64, !dbg !141
  %arrayidx7 = getelementptr inbounds i32*, i32** %9, i64 %idxprom6, !dbg !141
  %11 = load i32*, i32** %arrayidx7, align 8, !dbg !141
  %12 = load i32, i32* @j, align 4, !dbg !143
  %idxprom8 = sext i32 %12 to i64, !dbg !141
  %arrayidx9 = getelementptr inbounds i32, i32* %11, i64 %idxprom8, !dbg !141
  store i32 %8, i32* %arrayidx9, align 4, !dbg !144
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body3
  %13 = load i32, i32* @j, align 4, !dbg !145
  %inc = add nsw i32 %13, 1, !dbg !145
  store i32 %inc, i32* @j, align 4, !dbg !145
  br label %for.cond1, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond1
  br label %for.inc10, !dbg !148

for.inc10:                                        ; preds = %for.end
  %14 = load i32, i32* @i, align 4, !dbg !149
  %inc11 = add nsw i32 %14, 1, !dbg !149
  store i32 %inc11, i32* @i, align 4, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end12:                                        ; preds = %for.cond
  store i32 1, i32* @i, align 4, !dbg !153
  br label %for.cond13, !dbg !155

for.cond13:                                       ; preds = %for.inc16, %for.end12
  %15 = load i32, i32* @i, align 4, !dbg !156
  %16 = load i32, i32* %sz.addr, align 4, !dbg !158
  %cmp14 = icmp sle i32 %15, %16, !dbg !159
  br i1 %cmp14, label %for.body15, label %for.end18, !dbg !160

for.body15:                                       ; preds = %for.cond13
  %17 = load i32**, i32*** %b.addr, align 8, !dbg !161
  %18 = load i32, i32* %sz.addr, align 4, !dbg !162
  %call = call i32 @rand() #4, !dbg !163
  %19 = load i32, i32* %sz.addr, align 4, !dbg !164
  %rem = srem i32 %call, %19, !dbg !165
  %add = add nsw i32 %rem, 1, !dbg !166
  call void @fliprow(i32** %17, i32 %18, i32 %add), !dbg !167
  br label %for.inc16, !dbg !167

for.inc16:                                        ; preds = %for.body15
  %20 = load i32, i32* @i, align 4, !dbg !168
  %inc17 = add nsw i32 %20, 1, !dbg !168
  store i32 %inc17, i32* @i, align 4, !dbg !168
  br label %for.cond13, !dbg !169, !llvm.loop !170

for.end18:                                        ; preds = %for.cond13
  store i32 0, i32* @i, align 4, !dbg !172
  br label %for.cond19, !dbg !174

for.cond19:                                       ; preds = %for.inc24, %for.end18
  %21 = load i32, i32* @i, align 4, !dbg !175
  %22 = load i32, i32* %sz.addr, align 4, !dbg !177
  %cmp20 = icmp slt i32 %21, %22, !dbg !178
  br i1 %cmp20, label %for.body21, label %for.end26, !dbg !179

for.body21:                                       ; preds = %for.cond19
  %23 = load i32**, i32*** %b.addr, align 8, !dbg !180
  %24 = load i32, i32* %sz.addr, align 4, !dbg !181
  %call22 = call i32 @rand() #4, !dbg !182
  %25 = load i32, i32* %sz.addr, align 4, !dbg !183
  %rem23 = srem i32 %call22, %25, !dbg !184
  call void @flipcol(i32** %23, i32 %24, i32 %rem23), !dbg !185
  br label %for.inc24, !dbg !185

for.inc24:                                        ; preds = %for.body21
  %26 = load i32, i32* @i, align 4, !dbg !186
  %inc25 = add nsw i32 %26, 1, !dbg !186
  store i32 %inc25, i32* @i, align 4, !dbg !186
  br label %for.cond19, !dbg !187, !llvm.loop !188

for.end26:                                        ; preds = %for.cond19
  ret void, !dbg !190
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printb(i32** %b, i32 %sz) #0 !dbg !191 {
entry:
  %b.addr = alloca i32**, align 8
  %sz.addr = alloca i32, align 4
  store i32** %b, i32*** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %b.addr, metadata !192, metadata !DIExpression()), !dbg !193
  store i32 %sz, i32* %sz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %sz.addr, metadata !194, metadata !DIExpression()), !dbg !195
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !196
  store i32 0, i32* @i, align 4, !dbg !197
  br label %for.cond, !dbg !199

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* @i, align 4, !dbg !200
  %1 = load i32, i32* %sz.addr, align 4, !dbg !202
  %cmp = icmp slt i32 %0, %1, !dbg !203
  br i1 %cmp, label %for.body, label %for.end, !dbg !204

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* @i, align 4, !dbg !205
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %2), !dbg !206
  br label %for.inc, !dbg !206

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* @i, align 4, !dbg !207
  %inc = add nsw i32 %3, 1, !dbg !207
  store i32 %inc, i32* @i, align 4, !dbg !207
  br label %for.cond, !dbg !208, !llvm.loop !209

for.end:                                          ; preds = %for.cond
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !211
  store i32 1, i32* @i, align 4, !dbg !212
  br label %for.cond3, !dbg !214

for.cond3:                                        ; preds = %for.inc17, %for.end
  %4 = load i32, i32* @i, align 4, !dbg !215
  %5 = load i32, i32* %sz.addr, align 4, !dbg !217
  %cmp4 = icmp sle i32 %4, %5, !dbg !218
  br i1 %cmp4, label %for.body5, label %for.end19, !dbg !219

for.body5:                                        ; preds = %for.cond3
  %6 = load i32, i32* @i, align 4, !dbg !220
  %sub = sub nsw i32 %6, 1, !dbg !222
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0), i32 %sub), !dbg !223
  store i32 0, i32* @j, align 4, !dbg !224
  br label %for.cond7, !dbg !226

for.cond7:                                        ; preds = %for.inc13, %for.body5
  %7 = load i32, i32* @j, align 4, !dbg !227
  %8 = load i32, i32* %sz.addr, align 4, !dbg !229
  %cmp8 = icmp slt i32 %7, %8, !dbg !230
  br i1 %cmp8, label %for.body9, label %for.end15, !dbg !231

for.body9:                                        ; preds = %for.cond7
  %9 = load i32**, i32*** %b.addr, align 8, !dbg !232
  %10 = load i32, i32* @i, align 4, !dbg !233
  %idxprom = sext i32 %10 to i64, !dbg !232
  %arrayidx = getelementptr inbounds i32*, i32** %9, i64 %idxprom, !dbg !232
  %11 = load i32*, i32** %arrayidx, align 8, !dbg !232
  %12 = load i32, i32* @j, align 4, !dbg !234
  %idxprom10 = sext i32 %12 to i64, !dbg !232
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !232
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !232
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %13), !dbg !235
  br label %for.inc13, !dbg !235

for.inc13:                                        ; preds = %for.body9
  %14 = load i32, i32* @j, align 4, !dbg !236
  %inc14 = add nsw i32 %14, 1, !dbg !236
  store i32 %inc14, i32* @j, align 4, !dbg !236
  br label %for.cond7, !dbg !237, !llvm.loop !238

for.end15:                                        ; preds = %for.cond7
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !240
  br label %for.inc17, !dbg !241

for.inc17:                                        ; preds = %for.end15
  %15 = load i32, i32* @i, align 4, !dbg !242
  %inc18 = add nsw i32 %15, 1, !dbg !242
  store i32 %inc18, i32* @i, align 4, !dbg !242
  br label %for.cond3, !dbg !243, !llvm.loop !244

for.end19:                                        ; preds = %for.cond3
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !246
  ret void, !dbg !247
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @eq(i32** %t, i32** %b, i32 %sz) #0 !dbg !248 {
entry:
  %retval = alloca i32, align 4
  %t.addr = alloca i32**, align 8
  %b.addr = alloca i32**, align 8
  %sz.addr = alloca i32, align 4
  store i32** %t, i32*** %t.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %t.addr, metadata !251, metadata !DIExpression()), !dbg !252
  store i32** %b, i32*** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %b.addr, metadata !253, metadata !DIExpression()), !dbg !254
  store i32 %sz, i32* %sz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %sz.addr, metadata !255, metadata !DIExpression()), !dbg !256
  store i32 1, i32* @i, align 4, !dbg !257
  br label %for.cond, !dbg !259

for.cond:                                         ; preds = %for.inc11, %entry
  %0 = load i32, i32* @i, align 4, !dbg !260
  %1 = load i32, i32* %sz.addr, align 4, !dbg !262
  %cmp = icmp sle i32 %0, %1, !dbg !263
  br i1 %cmp, label %for.body, label %for.end13, !dbg !264

for.body:                                         ; preds = %for.cond
  store i32 0, i32* @j, align 4, !dbg !265
  br label %for.cond1, !dbg !267

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* @j, align 4, !dbg !268
  %3 = load i32, i32* %sz.addr, align 4, !dbg !270
  %cmp2 = icmp slt i32 %2, %3, !dbg !271
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !272

for.body3:                                        ; preds = %for.cond1
  %4 = load i32**, i32*** %b.addr, align 8, !dbg !273
  %5 = load i32, i32* @i, align 4, !dbg !275
  %idxprom = sext i32 %5 to i64, !dbg !273
  %arrayidx = getelementptr inbounds i32*, i32** %4, i64 %idxprom, !dbg !273
  %6 = load i32*, i32** %arrayidx, align 8, !dbg !273
  %7 = load i32, i32* @j, align 4, !dbg !276
  %idxprom4 = sext i32 %7 to i64, !dbg !273
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %idxprom4, !dbg !273
  %8 = load i32, i32* %arrayidx5, align 4, !dbg !273
  %9 = load i32**, i32*** %t.addr, align 8, !dbg !277
  %10 = load i32, i32* @i, align 4, !dbg !278
  %idxprom6 = sext i32 %10 to i64, !dbg !277
  %arrayidx7 = getelementptr inbounds i32*, i32** %9, i64 %idxprom6, !dbg !277
  %11 = load i32*, i32** %arrayidx7, align 8, !dbg !277
  %12 = load i32, i32* @j, align 4, !dbg !279
  %idxprom8 = sext i32 %12 to i64, !dbg !277
  %arrayidx9 = getelementptr inbounds i32, i32* %11, i64 %idxprom8, !dbg !277
  %13 = load i32, i32* %arrayidx9, align 4, !dbg !277
  %cmp10 = icmp ne i32 %8, %13, !dbg !280
  br i1 %cmp10, label %if.then, label %if.end, !dbg !281, !cf.info !282

if.then:                                          ; preds = %for.body3
  store i32 0, i32* %retval, align 4, !dbg !283
  br label %return, !dbg !283

if.end:                                           ; preds = %for.body3
  br label %for.inc, !dbg !284

for.inc:                                          ; preds = %if.end
  %14 = load i32, i32* @j, align 4, !dbg !285
  %inc = add nsw i32 %14, 1, !dbg !285
  store i32 %inc, i32* @j, align 4, !dbg !285
  br label %for.cond1, !dbg !286, !llvm.loop !287

for.end:                                          ; preds = %for.cond1
  br label %for.inc11, !dbg !288

for.inc11:                                        ; preds = %for.end
  %15 = load i32, i32* @i, align 4, !dbg !289
  %inc12 = add nsw i32 %15, 1, !dbg !289
  store i32 %inc12, i32* @i, align 4, !dbg !289
  br label %for.cond, !dbg !290, !llvm.loop !291

for.end13:                                        ; preds = %for.cond
  store i32 1, i32* %retval, align 4, !dbg !293
  br label %return, !dbg !293

return:                                           ; preds = %for.end13, %if.then
  %16 = load i32, i32* %retval, align 4, !dbg !294
  ret i32 %16, !dbg !294
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @main() #0 !dbg !295 {
entry:
  %sz = alloca i32, align 4
  %eql = alloca i32, align 4
  %mov = alloca i32, align 4
  %t = alloca i32**, align 8
  %b = alloca i32**, align 8
  %roc = alloca i8, align 1
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %sz, metadata !298, metadata !DIExpression()), !dbg !299
  store i32 3, i32* %sz, align 4, !dbg !299
  call void @llvm.dbg.declare(metadata i32* %eql, metadata !300, metadata !DIExpression()), !dbg !301
  store i32 0, i32* %eql, align 4, !dbg !301
  call void @llvm.dbg.declare(metadata i32* %mov, metadata !302, metadata !DIExpression()), !dbg !303
  store i32 0, i32* %mov, align 4, !dbg !303
  call void @llvm.dbg.declare(metadata i32*** %t, metadata !304, metadata !DIExpression()), !dbg !305
  %0 = load i32, i32* %sz, align 4, !dbg !306
  %conv = sext i32 %0 to i64, !dbg !306
  %mul = mul i64 %conv, 5, !dbg !307
  %call = call noalias i8* @malloc(i64 %mul) #4, !dbg !308
  %1 = bitcast i8* %call to i32**, !dbg !308
  store i32** %1, i32*** %t, align 8, !dbg !305
  store i32 1, i32* @i, align 4, !dbg !309
  br label %for.cond, !dbg !311

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* @i, align 4, !dbg !312
  %3 = load i32, i32* %sz, align 4, !dbg !314
  %cmp = icmp sle i32 %2, %3, !dbg !315
  br i1 %cmp, label %for.body, label %for.end, !dbg !316

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %sz, align 4, !dbg !317
  %conv2 = sext i32 %4 to i64, !dbg !317
  %mul3 = mul i64 %conv2, 4, !dbg !318
  %call4 = call noalias i8* @malloc(i64 %mul3) #4, !dbg !319
  %5 = bitcast i8* %call4 to i32*, !dbg !319
  %6 = load i32**, i32*** %t, align 8, !dbg !320
  %7 = load i32, i32* @i, align 4, !dbg !321
  %idxprom = sext i32 %7 to i64, !dbg !320
  %arrayidx = getelementptr inbounds i32*, i32** %6, i64 %idxprom, !dbg !320
  store i32* %5, i32** %arrayidx, align 8, !dbg !322
  br label %for.inc, !dbg !320

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* @i, align 4, !dbg !323
  %inc = add nsw i32 %8, 1, !dbg !323
  store i32 %inc, i32* @i, align 4, !dbg !323
  br label %for.cond, !dbg !324, !llvm.loop !325

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32*** %b, metadata !327, metadata !DIExpression()), !dbg !328
  %9 = load i32, i32* %sz, align 4, !dbg !329
  %conv5 = sext i32 %9 to i64, !dbg !329
  %mul6 = mul i64 %conv5, 5, !dbg !330
  %call7 = call noalias i8* @malloc(i64 %mul6) #4, !dbg !331
  %10 = bitcast i8* %call7 to i32**, !dbg !331
  store i32** %10, i32*** %b, align 8, !dbg !328
  store i32 1, i32* @i, align 4, !dbg !332
  br label %for.cond8, !dbg !334

for.cond8:                                        ; preds = %for.inc17, %for.end
  %11 = load i32, i32* @i, align 4, !dbg !335
  %12 = load i32, i32* %sz, align 4, !dbg !337
  %cmp9 = icmp sle i32 %11, %12, !dbg !338
  br i1 %cmp9, label %for.body11, label %for.end19, !dbg !339

for.body11:                                       ; preds = %for.cond8
  %13 = load i32, i32* %sz, align 4, !dbg !340
  %conv12 = sext i32 %13 to i64, !dbg !340
  %mul13 = mul i64 %conv12, 4, !dbg !341
  %call14 = call noalias i8* @malloc(i64 %mul13) #4, !dbg !342
  %14 = bitcast i8* %call14 to i32*, !dbg !342
  %15 = load i32**, i32*** %b, align 8, !dbg !343
  %16 = load i32, i32* @i, align 4, !dbg !344
  %idxprom15 = sext i32 %16 to i64, !dbg !343
  %arrayidx16 = getelementptr inbounds i32*, i32** %15, i64 %idxprom15, !dbg !343
  store i32* %14, i32** %arrayidx16, align 8, !dbg !345
  br label %for.inc17, !dbg !343

for.inc17:                                        ; preds = %for.body11
  %17 = load i32, i32* @i, align 4, !dbg !346
  %inc18 = add nsw i32 %17, 1, !dbg !346
  store i32 %inc18, i32* @i, align 4, !dbg !346
  br label %for.cond8, !dbg !347, !llvm.loop !348

for.end19:                                        ; preds = %for.cond8
  call void @llvm.dbg.declare(metadata i8* %roc, metadata !350, metadata !DIExpression()), !dbg !352
  call void @llvm.dbg.declare(metadata i32* %n, metadata !353, metadata !DIExpression()), !dbg !354
  %18 = load i32**, i32*** %t, align 8, !dbg !355
  %19 = load i32, i32* %sz, align 4, !dbg !356
  call void @initt(i32** %18, i32 %19), !dbg !357
  %20 = load i32**, i32*** %t, align 8, !dbg !358
  %21 = load i32**, i32*** %b, align 8, !dbg !359
  %22 = load i32, i32* %sz, align 4, !dbg !360
  call void @initb(i32** %20, i32** %21, i32 %22), !dbg !361
  br label %while.cond, !dbg !362

while.cond:                                       ; preds = %while.body, %for.end19
  %23 = load i32**, i32*** %t, align 8, !dbg !363
  %24 = load i32**, i32*** %b, align 8, !dbg !364
  %25 = load i32, i32* %sz, align 4, !dbg !365
  %call20 = call i32 @eq(i32** %23, i32** %24, i32 %25), !dbg !366
  %tobool = icmp ne i32 %call20, 0, !dbg !362
  br i1 %tobool, label %while.body, label %while.end, !dbg !362

while.body:                                       ; preds = %while.cond
  %26 = load i32**, i32*** %t, align 8, !dbg !367
  %27 = load i32**, i32*** %b, align 8, !dbg !368
  %28 = load i32, i32* %sz, align 4, !dbg !369
  call void @initb(i32** %26, i32** %27, i32 %28), !dbg !370
  br label %while.cond, !dbg !362, !llvm.loop !371

while.end:                                        ; preds = %while.cond
  br label %while.cond21, !dbg !373

while.cond21:                                     ; preds = %if.end, %while.end
  %29 = load i32, i32* %eql, align 4, !dbg !374
  %tobool22 = icmp ne i32 %29, 0, !dbg !375
  %lnot = xor i1 %tobool22, true, !dbg !375
  br i1 %lnot, label %while.body23, label %while.end36, !dbg !373

while.body23:                                     ; preds = %while.cond21
  %call24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0)), !dbg !376
  %30 = load i32**, i32*** %t, align 8, !dbg !378
  %31 = load i32, i32* %sz, align 4, !dbg !379
  call void @printb(i32** %30, i32 %31), !dbg !380
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i64 0, i64 0)), !dbg !381
  %32 = load i32**, i32*** %b, align 8, !dbg !382
  %33 = load i32, i32* %sz, align 4, !dbg !383
  call void @printb(i32** %32, i32 %33), !dbg !384
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0)), !dbg !385
  %call27 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i64 0, i64 0), i8* %roc), !dbg !386
  %call28 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32* %n), !dbg !387
  %34 = load i8, i8* %roc, align 1, !dbg !388
  %conv29 = sext i8 %34 to i32, !dbg !388
  switch i32 %conv29, label %sw.default [
    i32 114, label %sw.bb
    i32 99, label %sw.bb30
  ], !dbg !389

sw.bb:                                            ; preds = %while.body23
  %35 = load i32**, i32*** %b, align 8, !dbg !390
  %36 = load i32, i32* %sz, align 4, !dbg !392
  %37 = load i32, i32* %n, align 4, !dbg !393
  call void @fliprow(i32** %35, i32 %36, i32 %37), !dbg !394
  br label %sw.epilog, !dbg !395

sw.bb30:                                          ; preds = %while.body23
  %38 = load i32**, i32*** %b, align 8, !dbg !396
  %39 = load i32, i32* %sz, align 4, !dbg !397
  %40 = load i32, i32* %n, align 4, !dbg !398
  call void @flipcol(i32** %38, i32 %39, i32 %40), !dbg !399
  br label %sw.epilog, !dbg !400

sw.default:                                       ; preds = %while.body23
  call void @perror(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.8, i64 0, i64 0)), !dbg !401
  br label %sw.epilog, !dbg !402

sw.epilog:                                        ; preds = %sw.default, %sw.bb30, %sw.bb
  %41 = load i32, i32* %mov, align 4, !dbg !403
  %inc31 = add nsw i32 %41, 1, !dbg !403
  store i32 %inc31, i32* %mov, align 4, !dbg !403
  %call32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.9, i64 0, i64 0), i32 %inc31), !dbg !404
  %42 = load i32**, i32*** %t, align 8, !dbg !405
  %43 = load i32**, i32*** %b, align 8, !dbg !407
  %44 = load i32, i32* %sz, align 4, !dbg !408
  %call33 = call i32 @eq(i32** %42, i32** %43, i32 %44), !dbg !409
  %tobool34 = icmp ne i32 %call33, 0, !dbg !409
  br i1 %tobool34, label %if.then, label %if.end, !dbg !410, !cf.info !282

if.then:                                          ; preds = %sw.epilog
  %call35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.10, i64 0, i64 0)), !dbg !411
  store i32 1, i32* %eql, align 4, !dbg !413
  br label %if.end, !dbg !414

if.end:                                           ; preds = %if.then, %sw.epilog
  br label %while.cond21, !dbg !373, !llvm.loop !415

while.end36:                                      ; preds = %while.cond21
  ret void, !dbg !417
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

declare dso_local i32 @__isoc99_scanf(i8*, ...) #3

declare dso_local void @perror(i8*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "i", scope: !2, file: !3, line: 4, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "flipping-bits-game.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Flipping-bits-game")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "j", scope: !2, file: !3, line: 4, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!13 = distinct !DISubprogram(name: "fliprow", scope: !3, file: !3, line: 6, type: !14, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{null, !16, !8, !8}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!18 = !DILocalVariable(name: "b", arg: 1, scope: !13, file: !3, line: 6, type: !16)
!19 = !DILocation(line: 6, column: 20, scope: !13)
!20 = !DILocalVariable(name: "sz", arg: 2, scope: !13, file: !3, line: 6, type: !8)
!21 = !DILocation(line: 6, column: 27, scope: !13)
!22 = !DILocalVariable(name: "n", arg: 3, scope: !13, file: !3, line: 6, type: !8)
!23 = !DILocation(line: 6, column: 35, scope: !13)
!24 = !DILocation(line: 8, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !13, file: !3, line: 8, column: 2)
!26 = !DILocation(line: 8, column: 6, scope: !25)
!27 = !DILocation(line: 8, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !3, line: 8, column: 2)
!29 = !DILocation(line: 8, column: 17, scope: !28)
!30 = !DILocation(line: 8, column: 15, scope: !28)
!31 = !DILocation(line: 8, column: 2, scope: !25)
!32 = !DILocation(line: 9, column: 16, scope: !28)
!33 = !DILocation(line: 9, column: 18, scope: !28)
!34 = !DILocation(line: 9, column: 19, scope: !28)
!35 = !DILocation(line: 9, column: 23, scope: !28)
!36 = !DILocation(line: 9, column: 15, scope: !28)
!37 = !DILocation(line: 9, column: 3, scope: !28)
!38 = !DILocation(line: 9, column: 5, scope: !28)
!39 = !DILocation(line: 9, column: 6, scope: !28)
!40 = !DILocation(line: 9, column: 10, scope: !28)
!41 = !DILocation(line: 9, column: 13, scope: !28)
!42 = !DILocation(line: 8, column: 22, scope: !28)
!43 = !DILocation(line: 8, column: 2, scope: !28)
!44 = distinct !{!44, !31, !45}
!45 = !DILocation(line: 9, column: 24, scope: !25)
!46 = !DILocation(line: 10, column: 1, scope: !13)
!47 = distinct !DISubprogram(name: "flipcol", scope: !3, file: !3, line: 12, type: !14, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DILocalVariable(name: "b", arg: 1, scope: !47, file: !3, line: 12, type: !16)
!49 = !DILocation(line: 12, column: 20, scope: !47)
!50 = !DILocalVariable(name: "sz", arg: 2, scope: !47, file: !3, line: 12, type: !8)
!51 = !DILocation(line: 12, column: 27, scope: !47)
!52 = !DILocalVariable(name: "n", arg: 3, scope: !47, file: !3, line: 12, type: !8)
!53 = !DILocation(line: 12, column: 35, scope: !47)
!54 = !DILocation(line: 14, column: 8, scope: !55)
!55 = distinct !DILexicalBlock(scope: !47, file: !3, line: 14, column: 2)
!56 = !DILocation(line: 14, column: 6, scope: !55)
!57 = !DILocation(line: 14, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !3, line: 14, column: 2)
!59 = !DILocation(line: 14, column: 18, scope: !58)
!60 = !DILocation(line: 14, column: 15, scope: !58)
!61 = !DILocation(line: 14, column: 2, scope: !55)
!62 = !DILocation(line: 15, column: 14, scope: !58)
!63 = !DILocation(line: 15, column: 16, scope: !58)
!64 = !DILocation(line: 15, column: 19, scope: !58)
!65 = !DILocation(line: 15, column: 13, scope: !58)
!66 = !DILocation(line: 15, column: 3, scope: !58)
!67 = !DILocation(line: 15, column: 5, scope: !58)
!68 = !DILocation(line: 15, column: 8, scope: !58)
!69 = !DILocation(line: 15, column: 11, scope: !58)
!70 = !DILocation(line: 14, column: 23, scope: !58)
!71 = !DILocation(line: 14, column: 2, scope: !58)
!72 = distinct !{!72, !61, !73}
!73 = !DILocation(line: 15, column: 20, scope: !55)
!74 = !DILocation(line: 16, column: 1, scope: !47)
!75 = distinct !DISubprogram(name: "initt", scope: !3, file: !3, line: 18, type: !76, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DISubroutineType(types: !77)
!77 = !{null, !16, !8}
!78 = !DILocalVariable(name: "t", arg: 1, scope: !75, file: !3, line: 18, type: !16)
!79 = !DILocation(line: 18, column: 18, scope: !75)
!80 = !DILocalVariable(name: "sz", arg: 2, scope: !75, file: !3, line: 18, type: !8)
!81 = !DILocation(line: 18, column: 25, scope: !75)
!82 = !DILocation(line: 20, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !75, file: !3, line: 20, column: 2)
!84 = !DILocation(line: 20, column: 6, scope: !83)
!85 = !DILocation(line: 20, column: 13, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !3, line: 20, column: 2)
!87 = !DILocation(line: 20, column: 18, scope: !86)
!88 = !DILocation(line: 20, column: 15, scope: !86)
!89 = !DILocation(line: 20, column: 2, scope: !83)
!90 = !DILocation(line: 21, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !3, line: 21, column: 3)
!92 = !DILocation(line: 21, column: 7, scope: !91)
!93 = !DILocation(line: 21, column: 14, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !3, line: 21, column: 3)
!95 = !DILocation(line: 21, column: 18, scope: !94)
!96 = !DILocation(line: 21, column: 16, scope: !94)
!97 = !DILocation(line: 21, column: 3, scope: !91)
!98 = !DILocation(line: 22, column: 14, scope: !94)
!99 = !DILocation(line: 22, column: 20, scope: !94)
!100 = !DILocation(line: 22, column: 4, scope: !94)
!101 = !DILocation(line: 22, column: 6, scope: !94)
!102 = !DILocation(line: 22, column: 9, scope: !94)
!103 = !DILocation(line: 22, column: 12, scope: !94)
!104 = !DILocation(line: 21, column: 23, scope: !94)
!105 = !DILocation(line: 21, column: 3, scope: !94)
!106 = distinct !{!106, !97, !107}
!107 = !DILocation(line: 22, column: 21, scope: !91)
!108 = !DILocation(line: 20, column: 23, scope: !86)
!109 = !DILocation(line: 20, column: 2, scope: !86)
!110 = distinct !{!110, !89, !111}
!111 = !DILocation(line: 22, column: 21, scope: !83)
!112 = !DILocation(line: 23, column: 1, scope: !75)
!113 = distinct !DISubprogram(name: "initb", scope: !3, file: !3, line: 25, type: !114, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!114 = !DISubroutineType(types: !115)
!115 = !{null, !16, !16, !8}
!116 = !DILocalVariable(name: "t", arg: 1, scope: !113, file: !3, line: 25, type: !16)
!117 = !DILocation(line: 25, column: 18, scope: !113)
!118 = !DILocalVariable(name: "b", arg: 2, scope: !113, file: !3, line: 25, type: !16)
!119 = !DILocation(line: 25, column: 27, scope: !113)
!120 = !DILocalVariable(name: "sz", arg: 3, scope: !113, file: !3, line: 25, type: !8)
!121 = !DILocation(line: 25, column: 34, scope: !113)
!122 = !DILocation(line: 27, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !113, file: !3, line: 27, column: 2)
!124 = !DILocation(line: 27, column: 6, scope: !123)
!125 = !DILocation(line: 27, column: 13, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !3, line: 27, column: 2)
!127 = !DILocation(line: 27, column: 18, scope: !126)
!128 = !DILocation(line: 27, column: 15, scope: !126)
!129 = !DILocation(line: 27, column: 2, scope: !123)
!130 = !DILocation(line: 28, column: 9, scope: !131)
!131 = distinct !DILexicalBlock(scope: !126, file: !3, line: 28, column: 3)
!132 = !DILocation(line: 28, column: 7, scope: !131)
!133 = !DILocation(line: 28, column: 14, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !3, line: 28, column: 3)
!135 = !DILocation(line: 28, column: 18, scope: !134)
!136 = !DILocation(line: 28, column: 16, scope: !134)
!137 = !DILocation(line: 28, column: 3, scope: !131)
!138 = !DILocation(line: 29, column: 14, scope: !134)
!139 = !DILocation(line: 29, column: 16, scope: !134)
!140 = !DILocation(line: 29, column: 19, scope: !134)
!141 = !DILocation(line: 29, column: 4, scope: !134)
!142 = !DILocation(line: 29, column: 6, scope: !134)
!143 = !DILocation(line: 29, column: 9, scope: !134)
!144 = !DILocation(line: 29, column: 12, scope: !134)
!145 = !DILocation(line: 28, column: 23, scope: !134)
!146 = !DILocation(line: 28, column: 3, scope: !134)
!147 = distinct !{!147, !137, !148}
!148 = !DILocation(line: 29, column: 20, scope: !131)
!149 = !DILocation(line: 27, column: 23, scope: !126)
!150 = !DILocation(line: 27, column: 2, scope: !126)
!151 = distinct !{!151, !129, !152}
!152 = !DILocation(line: 29, column: 20, scope: !123)
!153 = !DILocation(line: 31, column: 8, scope: !154)
!154 = distinct !DILexicalBlock(scope: !113, file: !3, line: 31, column: 2)
!155 = !DILocation(line: 31, column: 6, scope: !154)
!156 = !DILocation(line: 31, column: 13, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !3, line: 31, column: 2)
!158 = !DILocation(line: 31, column: 18, scope: !157)
!159 = !DILocation(line: 31, column: 15, scope: !157)
!160 = !DILocation(line: 31, column: 2, scope: !154)
!161 = !DILocation(line: 32, column: 11, scope: !157)
!162 = !DILocation(line: 32, column: 14, scope: !157)
!163 = !DILocation(line: 32, column: 18, scope: !157)
!164 = !DILocation(line: 32, column: 25, scope: !157)
!165 = !DILocation(line: 32, column: 24, scope: !157)
!166 = !DILocation(line: 32, column: 27, scope: !157)
!167 = !DILocation(line: 32, column: 3, scope: !157)
!168 = !DILocation(line: 31, column: 23, scope: !157)
!169 = !DILocation(line: 31, column: 2, scope: !157)
!170 = distinct !{!170, !160, !171}
!171 = !DILocation(line: 32, column: 29, scope: !154)
!172 = !DILocation(line: 33, column: 8, scope: !173)
!173 = distinct !DILexicalBlock(scope: !113, file: !3, line: 33, column: 2)
!174 = !DILocation(line: 33, column: 6, scope: !173)
!175 = !DILocation(line: 33, column: 13, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !3, line: 33, column: 2)
!177 = !DILocation(line: 33, column: 17, scope: !176)
!178 = !DILocation(line: 33, column: 15, scope: !176)
!179 = !DILocation(line: 33, column: 2, scope: !173)
!180 = !DILocation(line: 34, column: 11, scope: !176)
!181 = !DILocation(line: 34, column: 14, scope: !176)
!182 = !DILocation(line: 34, column: 18, scope: !176)
!183 = !DILocation(line: 34, column: 25, scope: !176)
!184 = !DILocation(line: 34, column: 24, scope: !176)
!185 = !DILocation(line: 34, column: 3, scope: !176)
!186 = !DILocation(line: 33, column: 22, scope: !176)
!187 = !DILocation(line: 33, column: 2, scope: !176)
!188 = distinct !{!188, !179, !189}
!189 = !DILocation(line: 34, column: 27, scope: !173)
!190 = !DILocation(line: 35, column: 1, scope: !113)
!191 = distinct !DISubprogram(name: "printb", scope: !3, file: !3, line: 37, type: !76, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!192 = !DILocalVariable(name: "b", arg: 1, scope: !191, file: !3, line: 37, type: !16)
!193 = !DILocation(line: 37, column: 19, scope: !191)
!194 = !DILocalVariable(name: "sz", arg: 2, scope: !191, file: !3, line: 37, type: !8)
!195 = !DILocation(line: 37, column: 26, scope: !191)
!196 = !DILocation(line: 39, column: 2, scope: !191)
!197 = !DILocation(line: 40, column: 8, scope: !198)
!198 = distinct !DILexicalBlock(scope: !191, file: !3, line: 40, column: 2)
!199 = !DILocation(line: 40, column: 6, scope: !198)
!200 = !DILocation(line: 40, column: 13, scope: !201)
!201 = distinct !DILexicalBlock(scope: !198, file: !3, line: 40, column: 2)
!202 = !DILocation(line: 40, column: 17, scope: !201)
!203 = !DILocation(line: 40, column: 15, scope: !201)
!204 = !DILocation(line: 40, column: 2, scope: !198)
!205 = !DILocation(line: 41, column: 17, scope: !201)
!206 = !DILocation(line: 41, column: 3, scope: !201)
!207 = !DILocation(line: 40, column: 22, scope: !201)
!208 = !DILocation(line: 40, column: 2, scope: !201)
!209 = distinct !{!209, !204, !210}
!210 = !DILocation(line: 41, column: 18, scope: !198)
!211 = !DILocation(line: 42, column: 2, scope: !191)
!212 = !DILocation(line: 44, column: 8, scope: !213)
!213 = distinct !DILexicalBlock(scope: !191, file: !3, line: 44, column: 2)
!214 = !DILocation(line: 44, column: 6, scope: !213)
!215 = !DILocation(line: 44, column: 13, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !3, line: 44, column: 2)
!217 = !DILocation(line: 44, column: 18, scope: !216)
!218 = !DILocation(line: 44, column: 15, scope: !216)
!219 = !DILocation(line: 44, column: 2, scope: !213)
!220 = !DILocation(line: 46, column: 16, scope: !221)
!221 = distinct !DILexicalBlock(scope: !216, file: !3, line: 45, column: 2)
!222 = !DILocation(line: 46, column: 17, scope: !221)
!223 = !DILocation(line: 46, column: 3, scope: !221)
!224 = !DILocation(line: 47, column: 9, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !3, line: 47, column: 3)
!226 = !DILocation(line: 47, column: 7, scope: !225)
!227 = !DILocation(line: 47, column: 14, scope: !228)
!228 = distinct !DILexicalBlock(scope: !225, file: !3, line: 47, column: 3)
!229 = !DILocation(line: 47, column: 18, scope: !228)
!230 = !DILocation(line: 47, column: 16, scope: !228)
!231 = !DILocation(line: 47, column: 3, scope: !225)
!232 = !DILocation(line: 48, column: 18, scope: !228)
!233 = !DILocation(line: 48, column: 20, scope: !228)
!234 = !DILocation(line: 48, column: 23, scope: !228)
!235 = !DILocation(line: 48, column: 4, scope: !228)
!236 = !DILocation(line: 47, column: 23, scope: !228)
!237 = !DILocation(line: 47, column: 3, scope: !228)
!238 = distinct !{!238, !231, !239}
!239 = !DILocation(line: 48, column: 25, scope: !225)
!240 = !DILocation(line: 49, column: 3, scope: !221)
!241 = !DILocation(line: 50, column: 2, scope: !221)
!242 = !DILocation(line: 44, column: 23, scope: !216)
!243 = !DILocation(line: 44, column: 2, scope: !216)
!244 = distinct !{!244, !219, !245}
!245 = !DILocation(line: 50, column: 2, scope: !213)
!246 = !DILocation(line: 52, column: 2, scope: !191)
!247 = !DILocation(line: 53, column: 1, scope: !191)
!248 = distinct !DISubprogram(name: "eq", scope: !3, file: !3, line: 55, type: !249, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!249 = !DISubroutineType(types: !250)
!250 = !{!8, !16, !16, !8}
!251 = !DILocalVariable(name: "t", arg: 1, scope: !248, file: !3, line: 55, type: !16)
!252 = !DILocation(line: 55, column: 14, scope: !248)
!253 = !DILocalVariable(name: "b", arg: 2, scope: !248, file: !3, line: 55, type: !16)
!254 = !DILocation(line: 55, column: 23, scope: !248)
!255 = !DILocalVariable(name: "sz", arg: 3, scope: !248, file: !3, line: 55, type: !8)
!256 = !DILocation(line: 55, column: 30, scope: !248)
!257 = !DILocation(line: 57, column: 8, scope: !258)
!258 = distinct !DILexicalBlock(scope: !248, file: !3, line: 57, column: 2)
!259 = !DILocation(line: 57, column: 6, scope: !258)
!260 = !DILocation(line: 57, column: 13, scope: !261)
!261 = distinct !DILexicalBlock(scope: !258, file: !3, line: 57, column: 2)
!262 = !DILocation(line: 57, column: 18, scope: !261)
!263 = !DILocation(line: 57, column: 15, scope: !261)
!264 = !DILocation(line: 57, column: 2, scope: !258)
!265 = !DILocation(line: 58, column: 9, scope: !266)
!266 = distinct !DILexicalBlock(scope: !261, file: !3, line: 58, column: 3)
!267 = !DILocation(line: 58, column: 7, scope: !266)
!268 = !DILocation(line: 58, column: 14, scope: !269)
!269 = distinct !DILexicalBlock(scope: !266, file: !3, line: 58, column: 3)
!270 = !DILocation(line: 58, column: 18, scope: !269)
!271 = !DILocation(line: 58, column: 16, scope: !269)
!272 = !DILocation(line: 58, column: 3, scope: !266)
!273 = !DILocation(line: 59, column: 7, scope: !274)
!274 = distinct !DILexicalBlock(scope: !269, file: !3, line: 59, column: 7)
!275 = !DILocation(line: 59, column: 9, scope: !274)
!276 = !DILocation(line: 59, column: 12, scope: !274)
!277 = !DILocation(line: 59, column: 18, scope: !274)
!278 = !DILocation(line: 59, column: 20, scope: !274)
!279 = !DILocation(line: 59, column: 23, scope: !274)
!280 = !DILocation(line: 59, column: 15, scope: !274)
!281 = !DILocation(line: 59, column: 7, scope: !269)
!282 = !{!"if"}
!283 = !DILocation(line: 60, column: 5, scope: !274)
!284 = !DILocation(line: 59, column: 24, scope: !274)
!285 = !DILocation(line: 58, column: 23, scope: !269)
!286 = !DILocation(line: 58, column: 3, scope: !269)
!287 = distinct !{!287, !272, !288}
!288 = !DILocation(line: 60, column: 12, scope: !266)
!289 = !DILocation(line: 57, column: 23, scope: !261)
!290 = !DILocation(line: 57, column: 2, scope: !261)
!291 = distinct !{!291, !264, !292}
!292 = !DILocation(line: 60, column: 12, scope: !258)
!293 = !DILocation(line: 61, column: 2, scope: !248)
!294 = !DILocation(line: 62, column: 1, scope: !248)
!295 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 64, type: !296, scopeLine: 65, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!296 = !DISubroutineType(types: !297)
!297 = !{null}
!298 = !DILocalVariable(name: "sz", scope: !295, file: !3, line: 66, type: !8)
!299 = !DILocation(line: 66, column: 6, scope: !295)
!300 = !DILocalVariable(name: "eql", scope: !295, file: !3, line: 67, type: !8)
!301 = !DILocation(line: 67, column: 6, scope: !295)
!302 = !DILocalVariable(name: "mov", scope: !295, file: !3, line: 68, type: !8)
!303 = !DILocation(line: 68, column: 6, scope: !295)
!304 = !DILocalVariable(name: "t", scope: !295, file: !3, line: 69, type: !16)
!305 = !DILocation(line: 69, column: 8, scope: !295)
!306 = !DILocation(line: 69, column: 19, scope: !295)
!307 = !DILocation(line: 69, column: 21, scope: !295)
!308 = !DILocation(line: 69, column: 12, scope: !295)
!309 = !DILocation(line: 70, column: 8, scope: !310)
!310 = distinct !DILexicalBlock(scope: !295, file: !3, line: 70, column: 2)
!311 = !DILocation(line: 70, column: 6, scope: !310)
!312 = !DILocation(line: 70, column: 13, scope: !313)
!313 = distinct !DILexicalBlock(scope: !310, file: !3, line: 70, column: 2)
!314 = !DILocation(line: 70, column: 18, scope: !313)
!315 = !DILocation(line: 70, column: 15, scope: !313)
!316 = !DILocation(line: 70, column: 2, scope: !310)
!317 = !DILocation(line: 71, column: 17, scope: !313)
!318 = !DILocation(line: 71, column: 19, scope: !313)
!319 = !DILocation(line: 71, column: 10, scope: !313)
!320 = !DILocation(line: 71, column: 3, scope: !313)
!321 = !DILocation(line: 71, column: 5, scope: !313)
!322 = !DILocation(line: 71, column: 8, scope: !313)
!323 = !DILocation(line: 70, column: 23, scope: !313)
!324 = !DILocation(line: 70, column: 2, scope: !313)
!325 = distinct !{!325, !316, !326}
!326 = !DILocation(line: 71, column: 31, scope: !310)
!327 = !DILocalVariable(name: "b", scope: !295, file: !3, line: 73, type: !16)
!328 = !DILocation(line: 73, column: 8, scope: !295)
!329 = !DILocation(line: 73, column: 19, scope: !295)
!330 = !DILocation(line: 73, column: 21, scope: !295)
!331 = !DILocation(line: 73, column: 12, scope: !295)
!332 = !DILocation(line: 74, column: 8, scope: !333)
!333 = distinct !DILexicalBlock(scope: !295, file: !3, line: 74, column: 2)
!334 = !DILocation(line: 74, column: 6, scope: !333)
!335 = !DILocation(line: 74, column: 13, scope: !336)
!336 = distinct !DILexicalBlock(scope: !333, file: !3, line: 74, column: 2)
!337 = !DILocation(line: 74, column: 18, scope: !336)
!338 = !DILocation(line: 74, column: 15, scope: !336)
!339 = !DILocation(line: 74, column: 2, scope: !333)
!340 = !DILocation(line: 75, column: 17, scope: !336)
!341 = !DILocation(line: 75, column: 19, scope: !336)
!342 = !DILocation(line: 75, column: 10, scope: !336)
!343 = !DILocation(line: 75, column: 3, scope: !336)
!344 = !DILocation(line: 75, column: 5, scope: !336)
!345 = !DILocation(line: 75, column: 8, scope: !336)
!346 = !DILocation(line: 74, column: 23, scope: !336)
!347 = !DILocation(line: 74, column: 2, scope: !336)
!348 = distinct !{!348, !339, !349}
!349 = !DILocation(line: 75, column: 31, scope: !333)
!350 = !DILocalVariable(name: "roc", scope: !295, file: !3, line: 76, type: !351)
!351 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!352 = !DILocation(line: 76, column: 7, scope: !295)
!353 = !DILocalVariable(name: "n", scope: !295, file: !3, line: 77, type: !8)
!354 = !DILocation(line: 77, column: 6, scope: !295)
!355 = !DILocation(line: 78, column: 8, scope: !295)
!356 = !DILocation(line: 78, column: 11, scope: !295)
!357 = !DILocation(line: 78, column: 2, scope: !295)
!358 = !DILocation(line: 79, column: 8, scope: !295)
!359 = !DILocation(line: 79, column: 11, scope: !295)
!360 = !DILocation(line: 79, column: 14, scope: !295)
!361 = !DILocation(line: 79, column: 2, scope: !295)
!362 = !DILocation(line: 81, column: 2, scope: !295)
!363 = !DILocation(line: 81, column: 11, scope: !295)
!364 = !DILocation(line: 81, column: 14, scope: !295)
!365 = !DILocation(line: 81, column: 17, scope: !295)
!366 = !DILocation(line: 81, column: 8, scope: !295)
!367 = !DILocation(line: 82, column: 9, scope: !295)
!368 = !DILocation(line: 82, column: 12, scope: !295)
!369 = !DILocation(line: 82, column: 15, scope: !295)
!370 = !DILocation(line: 82, column: 3, scope: !295)
!371 = distinct !{!371, !362, !372}
!372 = !DILocation(line: 82, column: 17, scope: !295)
!373 = !DILocation(line: 84, column: 2, scope: !295)
!374 = !DILocation(line: 84, column: 9, scope: !295)
!375 = !DILocation(line: 84, column: 8, scope: !295)
!376 = !DILocation(line: 86, column: 3, scope: !377)
!377 = distinct !DILexicalBlock(scope: !295, file: !3, line: 85, column: 2)
!378 = !DILocation(line: 87, column: 10, scope: !377)
!379 = !DILocation(line: 87, column: 13, scope: !377)
!380 = !DILocation(line: 87, column: 3, scope: !377)
!381 = !DILocation(line: 88, column: 3, scope: !377)
!382 = !DILocation(line: 89, column: 10, scope: !377)
!383 = !DILocation(line: 89, column: 13, scope: !377)
!384 = !DILocation(line: 89, column: 3, scope: !377)
!385 = !DILocation(line: 90, column: 3, scope: !377)
!386 = !DILocation(line: 91, column: 3, scope: !377)
!387 = !DILocation(line: 92, column: 3, scope: !377)
!388 = !DILocation(line: 94, column: 10, scope: !377)
!389 = !DILocation(line: 94, column: 3, scope: !377)
!390 = !DILocation(line: 97, column: 13, scope: !391)
!391 = distinct !DILexicalBlock(scope: !377, file: !3, line: 95, column: 3)
!392 = !DILocation(line: 97, column: 16, scope: !391)
!393 = !DILocation(line: 97, column: 20, scope: !391)
!394 = !DILocation(line: 97, column: 5, scope: !391)
!395 = !DILocation(line: 98, column: 5, scope: !391)
!396 = !DILocation(line: 100, column: 13, scope: !391)
!397 = !DILocation(line: 100, column: 16, scope: !391)
!398 = !DILocation(line: 100, column: 20, scope: !391)
!399 = !DILocation(line: 100, column: 5, scope: !391)
!400 = !DILocation(line: 101, column: 5, scope: !391)
!401 = !DILocation(line: 103, column: 5, scope: !391)
!402 = !DILocation(line: 104, column: 5, scope: !391)
!403 = !DILocation(line: 107, column: 31, scope: !377)
!404 = !DILocation(line: 107, column: 3, scope: !377)
!405 = !DILocation(line: 109, column: 9, scope: !406)
!406 = distinct !DILexicalBlock(scope: !377, file: !3, line: 109, column: 6)
!407 = !DILocation(line: 109, column: 12, scope: !406)
!408 = !DILocation(line: 109, column: 15, scope: !406)
!409 = !DILocation(line: 109, column: 6, scope: !406)
!410 = !DILocation(line: 109, column: 6, scope: !377)
!411 = !DILocation(line: 111, column: 4, scope: !412)
!412 = distinct !DILexicalBlock(scope: !406, file: !3, line: 110, column: 3)
!413 = !DILocation(line: 112, column: 8, scope: !412)
!414 = !DILocation(line: 113, column: 3, scope: !412)
!415 = distinct !{!415, !373, !416}
!416 = !DILocation(line: 114, column: 2, scope: !295)
!417 = !DILocation(line: 115, column: 1, scope: !295)
