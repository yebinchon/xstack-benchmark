; ModuleID = 'generate-chess960-starting-position.c'
source_filename = "generate-chess960-starting-position.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@pos = common dso_local global [8 x i32] zeroinitializer, align 16, !dbg !0
@rank = common dso_local global [9 x i8] zeroinitializer, align 1, !dbg !10
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%lc\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @swap(i32 %i, i32 %j) #0 !dbg !24 {
entry:
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %temp = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !27, metadata !DIExpression()), !dbg !28
  store i32 %j, i32* %j.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %j.addr, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %temp, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = load i32, i32* %i.addr, align 4, !dbg !33
  %idxprom = sext i32 %0 to i64, !dbg !34
  %arrayidx = getelementptr inbounds [8 x i32], [8 x i32]* @pos, i64 0, i64 %idxprom, !dbg !34
  %1 = load i32, i32* %arrayidx, align 4, !dbg !34
  store i32 %1, i32* %temp, align 4, !dbg !32
  %2 = load i32, i32* %j.addr, align 4, !dbg !35
  %idxprom1 = sext i32 %2 to i64, !dbg !36
  %arrayidx2 = getelementptr inbounds [8 x i32], [8 x i32]* @pos, i64 0, i64 %idxprom1, !dbg !36
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !36
  %4 = load i32, i32* %i.addr, align 4, !dbg !37
  %idxprom3 = sext i32 %4 to i64, !dbg !38
  %arrayidx4 = getelementptr inbounds [8 x i32], [8 x i32]* @pos, i64 0, i64 %idxprom3, !dbg !38
  store i32 %3, i32* %arrayidx4, align 4, !dbg !39
  %5 = load i32, i32* %temp, align 4, !dbg !40
  %6 = load i32, i32* %j.addr, align 4, !dbg !41
  %idxprom5 = sext i32 %6 to i64, !dbg !42
  %arrayidx6 = getelementptr inbounds [8 x i32], [8 x i32]* @pos, i64 0, i64 %idxprom5, !dbg !42
  store i32 %5, i32* %arrayidx6, align 4, !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @generateFirstRank() #0 !dbg !45 {
entry:
  %kPos = alloca i32, align 4
  %qPos = alloca i32, align 4
  %bPos1 = alloca i32, align 4
  %bPos2 = alloca i32, align 4
  %rPos1 = alloca i32, align 4
  %rPos2 = alloca i32, align 4
  %nPos1 = alloca i32, align 4
  %nPos2 = alloca i32, align 4
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %kPos, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i32* %qPos, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i32* %bPos1, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i32* %bPos2, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i32* %rPos1, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i32* %rPos2, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i32* %nPos1, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i32* %nPos2, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i32* %i, metadata !64, metadata !DIExpression()), !dbg !65
  store i32 0, i32* %i, align 4, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !69
  %cmp = icmp slt i32 %0, 8, !dbg !71
  br i1 %cmp, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !73
  %idxprom = sext i32 %1 to i64, !dbg !75
  %arrayidx = getelementptr inbounds [9 x i8], [9 x i8]* @rank, i64 0, i64 %idxprom, !dbg !75
  store i8 101, i8* %arrayidx, align 1, !dbg !76
  %2 = load i32, i32* %i, align 4, !dbg !77
  %3 = load i32, i32* %i, align 4, !dbg !78
  %idxprom1 = sext i32 %3 to i64, !dbg !79
  %arrayidx2 = getelementptr inbounds [8 x i32], [8 x i32]* @pos, i64 0, i64 %idxprom1, !dbg !79
  store i32 %2, i32* %arrayidx2, align 4, !dbg !80
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !82
  %inc = add nsw i32 %4, 1, !dbg !82
  store i32 %inc, i32* %i, align 4, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  br label %do.body, !dbg !86

do.body:                                          ; preds = %lor.end20, %for.end
  %call = call i32 @rand() #4, !dbg !87
  %rem = srem i32 %call, 8, !dbg !89
  store i32 %rem, i32* %kPos, align 4, !dbg !90
  %call3 = call i32 @rand() #4, !dbg !91
  %rem4 = srem i32 %call3, 8, !dbg !92
  store i32 %rem4, i32* %rPos1, align 4, !dbg !93
  %call5 = call i32 @rand() #4, !dbg !94
  %rem6 = srem i32 %call5, 8, !dbg !95
  store i32 %rem6, i32* %rPos2, align 4, !dbg !96
  br label %do.cond, !dbg !97

do.cond:                                          ; preds = %do.body
  %5 = load i32, i32* %rPos1, align 4, !dbg !98
  %6 = load i32, i32* %kPos, align 4, !dbg !99
  %sub = sub nsw i32 %5, %6, !dbg !100
  %cmp7 = icmp sle i32 %sub, 0, !dbg !101
  br i1 %cmp7, label %land.lhs.true, label %lor.lhs.false, !dbg !102

land.lhs.true:                                    ; preds = %do.cond
  %7 = load i32, i32* %rPos2, align 4, !dbg !103
  %8 = load i32, i32* %kPos, align 4, !dbg !104
  %sub8 = sub nsw i32 %7, %8, !dbg !105
  %cmp9 = icmp sle i32 %sub8, 0, !dbg !106
  br i1 %cmp9, label %lor.end20, label %lor.lhs.false, !dbg !107

lor.lhs.false:                                    ; preds = %land.lhs.true, %do.cond
  %9 = load i32, i32* %rPos1, align 4, !dbg !108
  %10 = load i32, i32* %kPos, align 4, !dbg !109
  %sub10 = sub nsw i32 %9, %10, !dbg !110
  %cmp11 = icmp sge i32 %sub10, 0, !dbg !111
  br i1 %cmp11, label %land.lhs.true12, label %lor.rhs, !dbg !112

land.lhs.true12:                                  ; preds = %lor.lhs.false
  %11 = load i32, i32* %rPos2, align 4, !dbg !113
  %12 = load i32, i32* %kPos, align 4, !dbg !114
  %sub13 = sub nsw i32 %11, %12, !dbg !115
  %cmp14 = icmp sge i32 %sub13, 0, !dbg !116
  br i1 %cmp14, label %lor.end20, label %lor.rhs, !dbg !117

lor.rhs:                                          ; preds = %land.lhs.true12, %lor.lhs.false
  %13 = load i32, i32* %rPos1, align 4, !dbg !118
  %14 = load i32, i32* %rPos2, align 4, !dbg !119
  %cmp15 = icmp eq i32 %13, %14, !dbg !120
  br i1 %cmp15, label %lor.end, label %lor.lhs.false16, !dbg !121

lor.lhs.false16:                                  ; preds = %lor.rhs
  %15 = load i32, i32* %kPos, align 4, !dbg !122
  %16 = load i32, i32* %rPos1, align 4, !dbg !123
  %cmp17 = icmp eq i32 %15, %16, !dbg !124
  br i1 %cmp17, label %lor.end, label %lor.rhs18, !dbg !125

lor.rhs18:                                        ; preds = %lor.lhs.false16
  %17 = load i32, i32* %kPos, align 4, !dbg !126
  %18 = load i32, i32* %rPos2, align 4, !dbg !127
  %cmp19 = icmp eq i32 %17, %18, !dbg !128
  br label %lor.end, !dbg !125

lor.end:                                          ; preds = %lor.rhs18, %lor.lhs.false16, %lor.rhs
  %19 = phi i1 [ true, %lor.lhs.false16 ], [ true, %lor.rhs ], [ %cmp19, %lor.rhs18 ]
  br label %lor.end20, !dbg !117

lor.end20:                                        ; preds = %lor.end, %land.lhs.true12, %land.lhs.true
  %20 = phi i1 [ true, %land.lhs.true12 ], [ true, %land.lhs.true ], [ %19, %lor.end ]
  br i1 %20, label %do.body, label %do.end, !dbg !97, !llvm.loop !129

do.end:                                           ; preds = %lor.end20
  %21 = load i32, i32* %rPos1, align 4, !dbg !131
  %idxprom21 = sext i32 %21 to i64, !dbg !132
  %arrayidx22 = getelementptr inbounds [8 x i32], [8 x i32]* @pos, i64 0, i64 %idxprom21, !dbg !132
  %22 = load i32, i32* %arrayidx22, align 4, !dbg !132
  %idxprom23 = sext i32 %22 to i64, !dbg !133
  %arrayidx24 = getelementptr inbounds [9 x i8], [9 x i8]* @rank, i64 0, i64 %idxprom23, !dbg !133
  store i8 82, i8* %arrayidx24, align 1, !dbg !134
  %23 = load i32, i32* %kPos, align 4, !dbg !135
  %idxprom25 = sext i32 %23 to i64, !dbg !136
  %arrayidx26 = getelementptr inbounds [8 x i32], [8 x i32]* @pos, i64 0, i64 %idxprom25, !dbg !136
  %24 = load i32, i32* %arrayidx26, align 4, !dbg !136
  %idxprom27 = sext i32 %24 to i64, !dbg !137
  %arrayidx28 = getelementptr inbounds [9 x i8], [9 x i8]* @rank, i64 0, i64 %idxprom27, !dbg !137
  store i8 75, i8* %arrayidx28, align 1, !dbg !138
  %25 = load i32, i32* %rPos2, align 4, !dbg !139
  %idxprom29 = sext i32 %25 to i64, !dbg !140
  %arrayidx30 = getelementptr inbounds [8 x i32], [8 x i32]* @pos, i64 0, i64 %idxprom29, !dbg !140
  %26 = load i32, i32* %arrayidx30, align 4, !dbg !140
  %idxprom31 = sext i32 %26 to i64, !dbg !141
  %arrayidx32 = getelementptr inbounds [9 x i8], [9 x i8]* @rank, i64 0, i64 %idxprom31, !dbg !141
  store i8 82, i8* %arrayidx32, align 1, !dbg !142
  %27 = load i32, i32* %rPos1, align 4, !dbg !143
  call void @swap(i32 %27, i32 7), !dbg !144
  %28 = load i32, i32* %rPos2, align 4, !dbg !145
  call void @swap(i32 %28, i32 6), !dbg !146
  %29 = load i32, i32* %kPos, align 4, !dbg !147
  call void @swap(i32 %29, i32 5), !dbg !148
  br label %do.body33, !dbg !149

do.body33:                                        ; preds = %lor.end48, %do.end
  %call34 = call i32 @rand() #4, !dbg !150
  %rem35 = srem i32 %call34, 5, !dbg !152
  store i32 %rem35, i32* %bPos1, align 4, !dbg !153
  %call36 = call i32 @rand() #4, !dbg !154
  %rem37 = srem i32 %call36, 5, !dbg !155
  store i32 %rem37, i32* %bPos2, align 4, !dbg !156
  br label %do.cond38, !dbg !157

do.cond38:                                        ; preds = %do.body33
  %30 = load i32, i32* %bPos1, align 4, !dbg !158
  %idxprom39 = sext i32 %30 to i64, !dbg !159
  %arrayidx40 = getelementptr inbounds [8 x i32], [8 x i32]* @pos, i64 0, i64 %idxprom39, !dbg !159
  %31 = load i32, i32* %arrayidx40, align 4, !dbg !159
  %32 = load i32, i32* %bPos2, align 4, !dbg !160
  %idxprom41 = sext i32 %32 to i64, !dbg !161
  %arrayidx42 = getelementptr inbounds [8 x i32], [8 x i32]* @pos, i64 0, i64 %idxprom41, !dbg !161
  %33 = load i32, i32* %arrayidx42, align 4, !dbg !161
  %sub43 = sub nsw i32 %31, %33, !dbg !162
  %rem44 = srem i32 %sub43, 2, !dbg !163
  %cmp45 = icmp eq i32 %rem44, 0, !dbg !164
  br i1 %cmp45, label %lor.end48, label %lor.rhs46, !dbg !165

lor.rhs46:                                        ; preds = %do.cond38
  %34 = load i32, i32* %bPos1, align 4, !dbg !166
  %35 = load i32, i32* %bPos2, align 4, !dbg !167
  %cmp47 = icmp eq i32 %34, %35, !dbg !168
  br label %lor.end48, !dbg !165

lor.end48:                                        ; preds = %lor.rhs46, %do.cond38
  %36 = phi i1 [ true, %do.cond38 ], [ %cmp47, %lor.rhs46 ]
  br i1 %36, label %do.body33, label %do.end49, !dbg !157, !llvm.loop !169

do.end49:                                         ; preds = %lor.end48
  %37 = load i32, i32* %bPos1, align 4, !dbg !171
  %idxprom50 = sext i32 %37 to i64, !dbg !172
  %arrayidx51 = getelementptr inbounds [8 x i32], [8 x i32]* @pos, i64 0, i64 %idxprom50, !dbg !172
  %38 = load i32, i32* %arrayidx51, align 4, !dbg !172
  %idxprom52 = sext i32 %38 to i64, !dbg !173
  %arrayidx53 = getelementptr inbounds [9 x i8], [9 x i8]* @rank, i64 0, i64 %idxprom52, !dbg !173
  store i8 66, i8* %arrayidx53, align 1, !dbg !174
  %39 = load i32, i32* %bPos2, align 4, !dbg !175
  %idxprom54 = sext i32 %39 to i64, !dbg !176
  %arrayidx55 = getelementptr inbounds [8 x i32], [8 x i32]* @pos, i64 0, i64 %idxprom54, !dbg !176
  %40 = load i32, i32* %arrayidx55, align 4, !dbg !176
  %idxprom56 = sext i32 %40 to i64, !dbg !177
  %arrayidx57 = getelementptr inbounds [9 x i8], [9 x i8]* @rank, i64 0, i64 %idxprom56, !dbg !177
  store i8 66, i8* %arrayidx57, align 1, !dbg !178
  %41 = load i32, i32* %bPos1, align 4, !dbg !179
  call void @swap(i32 %41, i32 4), !dbg !180
  %42 = load i32, i32* %bPos2, align 4, !dbg !181
  call void @swap(i32 %42, i32 3), !dbg !182
  br label %do.body58, !dbg !183

do.body58:                                        ; preds = %do.cond63, %do.end49
  %call59 = call i32 @rand() #4, !dbg !184
  %rem60 = srem i32 %call59, 3, !dbg !186
  store i32 %rem60, i32* %qPos, align 4, !dbg !187
  %call61 = call i32 @rand() #4, !dbg !188
  %rem62 = srem i32 %call61, 3, !dbg !189
  store i32 %rem62, i32* %nPos1, align 4, !dbg !190
  br label %do.cond63, !dbg !191

do.cond63:                                        ; preds = %do.body58
  %43 = load i32, i32* %qPos, align 4, !dbg !192
  %44 = load i32, i32* %nPos1, align 4, !dbg !193
  %cmp64 = icmp eq i32 %43, %44, !dbg !194
  br i1 %cmp64, label %do.body58, label %do.end65, !dbg !191, !llvm.loop !195

do.end65:                                         ; preds = %do.cond63
  %45 = load i32, i32* %qPos, align 4, !dbg !197
  %idxprom66 = sext i32 %45 to i64, !dbg !198
  %arrayidx67 = getelementptr inbounds [8 x i32], [8 x i32]* @pos, i64 0, i64 %idxprom66, !dbg !198
  %46 = load i32, i32* %arrayidx67, align 4, !dbg !198
  %idxprom68 = sext i32 %46 to i64, !dbg !199
  %arrayidx69 = getelementptr inbounds [9 x i8], [9 x i8]* @rank, i64 0, i64 %idxprom68, !dbg !199
  store i8 81, i8* %arrayidx69, align 1, !dbg !200
  %47 = load i32, i32* %nPos1, align 4, !dbg !201
  %idxprom70 = sext i32 %47 to i64, !dbg !202
  %arrayidx71 = getelementptr inbounds [8 x i32], [8 x i32]* @pos, i64 0, i64 %idxprom70, !dbg !202
  %48 = load i32, i32* %arrayidx71, align 4, !dbg !202
  %idxprom72 = sext i32 %48 to i64, !dbg !203
  %arrayidx73 = getelementptr inbounds [9 x i8], [9 x i8]* @rank, i64 0, i64 %idxprom72, !dbg !203
  store i8 78, i8* %arrayidx73, align 1, !dbg !204
  store i32 0, i32* %i, align 4, !dbg !205
  br label %for.cond74, !dbg !207

for.cond74:                                       ; preds = %for.inc83, %do.end65
  %49 = load i32, i32* %i, align 4, !dbg !208
  %cmp75 = icmp slt i32 %49, 8, !dbg !210
  br i1 %cmp75, label %for.body76, label %for.end85, !dbg !211

for.body76:                                       ; preds = %for.cond74
  %50 = load i32, i32* %i, align 4, !dbg !212
  %idxprom77 = sext i32 %50 to i64, !dbg !214
  %arrayidx78 = getelementptr inbounds [9 x i8], [9 x i8]* @rank, i64 0, i64 %idxprom77, !dbg !214
  %51 = load i8, i8* %arrayidx78, align 1, !dbg !214
  %conv = sext i8 %51 to i32, !dbg !214
  %cmp79 = icmp eq i32 %conv, 101, !dbg !215
  br i1 %cmp79, label %if.then, label %if.end, !dbg !216, !cf.info !217

if.then:                                          ; preds = %for.body76
  %52 = load i32, i32* %i, align 4, !dbg !218
  %idxprom81 = sext i32 %52 to i64, !dbg !220
  %arrayidx82 = getelementptr inbounds [9 x i8], [9 x i8]* @rank, i64 0, i64 %idxprom81, !dbg !220
  store i8 78, i8* %arrayidx82, align 1, !dbg !221
  br label %for.end85, !dbg !222

if.end:                                           ; preds = %for.body76
  br label %for.inc83, !dbg !223

for.inc83:                                        ; preds = %if.end
  %53 = load i32, i32* %i, align 4, !dbg !224
  %inc84 = add nsw i32 %53, 1, !dbg !224
  store i32 %inc84, i32* %i, align 4, !dbg !224
  br label %for.cond74, !dbg !225, !llvm.loop !226

for.end85:                                        ; preds = %if.then, %for.cond74
  ret void, !dbg !228
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @printRank() #0 !dbg !229 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !230, metadata !DIExpression()), !dbg !231
  %call = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0)) #4, !dbg !232
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !234
  store i32 0, i32* %i, align 4, !dbg !235
  br label %for.cond, !dbg !237

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !238
  %cmp = icmp slt i32 %0, 8, !dbg !240
  br i1 %cmp, label %for.body, label %for.end, !dbg !241

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !242
  %idxprom = sext i32 %1 to i64, !dbg !245
  %arrayidx = getelementptr inbounds [9 x i8], [9 x i8]* @rank, i64 0, i64 %idxprom, !dbg !245
  %2 = load i8, i8* %arrayidx, align 1, !dbg !245
  %conv = sext i8 %2 to i32, !dbg !245
  %cmp2 = icmp eq i32 %conv, 75, !dbg !246
  br i1 %cmp2, label %if.then, label %if.else, !dbg !247, !cf.info !217

if.then:                                          ; preds = %for.body
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 9812), !dbg !248
  br label %if.end30, !dbg !248

if.else:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !249
  %idxprom5 = sext i32 %3 to i64, !dbg !251
  %arrayidx6 = getelementptr inbounds [9 x i8], [9 x i8]* @rank, i64 0, i64 %idxprom5, !dbg !251
  %4 = load i8, i8* %arrayidx6, align 1, !dbg !251
  %conv7 = sext i8 %4 to i32, !dbg !251
  %cmp8 = icmp eq i32 %conv7, 81, !dbg !252
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !253, !cf.info !217

if.then10:                                        ; preds = %if.else
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 9813), !dbg !254
  br label %if.end29, !dbg !254

if.else12:                                        ; preds = %if.else
  %5 = load i32, i32* %i, align 4, !dbg !255
  %idxprom13 = sext i32 %5 to i64, !dbg !257
  %arrayidx14 = getelementptr inbounds [9 x i8], [9 x i8]* @rank, i64 0, i64 %idxprom13, !dbg !257
  %6 = load i8, i8* %arrayidx14, align 1, !dbg !257
  %conv15 = sext i8 %6 to i32, !dbg !257
  %cmp16 = icmp eq i32 %conv15, 82, !dbg !258
  br i1 %cmp16, label %if.then18, label %if.else20, !dbg !259, !cf.info !217

if.then18:                                        ; preds = %if.else12
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 9814), !dbg !260
  br label %if.end28, !dbg !260

if.else20:                                        ; preds = %if.else12
  %7 = load i32, i32* %i, align 4, !dbg !261
  %idxprom21 = sext i32 %7 to i64, !dbg !263
  %arrayidx22 = getelementptr inbounds [9 x i8], [9 x i8]* @rank, i64 0, i64 %idxprom21, !dbg !263
  %8 = load i8, i8* %arrayidx22, align 1, !dbg !263
  %conv23 = sext i8 %8 to i32, !dbg !263
  %cmp24 = icmp eq i32 %conv23, 66, !dbg !264
  br i1 %cmp24, label %if.then26, label %if.end, !dbg !265, !cf.info !217

if.then26:                                        ; preds = %if.else20
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 9815), !dbg !266
  br label %if.end, !dbg !266

if.end:                                           ; preds = %if.then26, %if.else20
  br label %if.end28

if.end28:                                         ; preds = %if.end, %if.then18
  br label %if.end29

if.end29:                                         ; preds = %if.end28, %if.then10
  br label %if.end30

if.end30:                                         ; preds = %if.end29, %if.then
  %9 = load i32, i32* %i, align 4, !dbg !267
  %idxprom31 = sext i32 %9 to i64, !dbg !269
  %arrayidx32 = getelementptr inbounds [9 x i8], [9 x i8]* @rank, i64 0, i64 %idxprom31, !dbg !269
  %10 = load i8, i8* %arrayidx32, align 1, !dbg !269
  %conv33 = sext i8 %10 to i32, !dbg !269
  %cmp34 = icmp eq i32 %conv33, 78, !dbg !270
  br i1 %cmp34, label %if.then36, label %if.end38, !dbg !271, !cf.info !217

if.then36:                                        ; preds = %if.end30
  %call37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 9816), !dbg !272
  br label %if.end38, !dbg !272

if.end38:                                         ; preds = %if.then36, %if.end30
  br label %for.inc, !dbg !273

for.inc:                                          ; preds = %if.end38
  %11 = load i32, i32* %i, align 4, !dbg !274
  %inc = add nsw i32 %11, 1, !dbg !274
  store i32 %inc, i32* %i, align 4, !dbg !274
  br label %for.cond, !dbg !275, !llvm.loop !276

for.end:                                          ; preds = %for.cond
  ret void, !dbg !278
}

; Function Attrs: nounwind
declare dso_local i8* @setlocale(i32, i8*) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !279 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !282, metadata !DIExpression()), !dbg !283
  %call = call i64 @time(i64* null) #4, !dbg !284
  %conv = trunc i64 %call to i32, !dbg !285
  call void @srand(i32 %conv) #4, !dbg !286
  store i32 0, i32* %i, align 4, !dbg !287
  br label %for.cond, !dbg !289

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !290
  %cmp = icmp slt i32 %0, 9, !dbg !292
  br i1 %cmp, label %for.body, label %for.end, !dbg !293

for.body:                                         ; preds = %for.cond
  call void @generateFirstRank(), !dbg !294
  call void @printRank(), !dbg !296
  br label %for.inc, !dbg !297

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !298
  %inc = add nsw i32 %1, 1, !dbg !298
  store i32 %inc, i32* %i, align 4, !dbg !298
  br label %for.cond, !dbg !299, !llvm.loop !300

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !302
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "pos", scope: !2, file: !3, line: 9, type: !16, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "generate-chess960-starting-position.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Generate-Chess960-starting-position")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !7, line: 20, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "")
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!10, !0}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "rank", scope: !2, file: !3, line: 7, type: !12, isLocal: false, isDefinition: true)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 72, elements: !14)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !{!15}
!15 = !DISubrange(count: 9)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 256, elements: !18)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !{!19}
!19 = !DISubrange(count: 8)
!20 = !{i32 7, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!24 = distinct !DISubprogram(name: "swap", scope: !3, file: !3, line: 11, type: !25, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !17, !17}
!27 = !DILocalVariable(name: "i", arg: 1, scope: !24, file: !3, line: 11, type: !17)
!28 = !DILocation(line: 11, column: 15, scope: !24)
!29 = !DILocalVariable(name: "j", arg: 2, scope: !24, file: !3, line: 11, type: !17)
!30 = !DILocation(line: 11, column: 21, scope: !24)
!31 = !DILocalVariable(name: "temp", scope: !24, file: !3, line: 12, type: !17)
!32 = !DILocation(line: 12, column: 6, scope: !24)
!33 = !DILocation(line: 12, column: 17, scope: !24)
!34 = !DILocation(line: 12, column: 13, scope: !24)
!35 = !DILocation(line: 13, column: 15, scope: !24)
!36 = !DILocation(line: 13, column: 11, scope: !24)
!37 = !DILocation(line: 13, column: 6, scope: !24)
!38 = !DILocation(line: 13, column: 2, scope: !24)
!39 = !DILocation(line: 13, column: 9, scope: !24)
!40 = !DILocation(line: 14, column: 11, scope: !24)
!41 = !DILocation(line: 14, column: 6, scope: !24)
!42 = !DILocation(line: 14, column: 2, scope: !24)
!43 = !DILocation(line: 14, column: 9, scope: !24)
!44 = !DILocation(line: 15, column: 1, scope: !24)
!45 = distinct !DISubprogram(name: "generateFirstRank", scope: !3, file: !3, line: 17, type: !46, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DISubroutineType(types: !47)
!47 = !{null}
!48 = !DILocalVariable(name: "kPos", scope: !45, file: !3, line: 18, type: !17)
!49 = !DILocation(line: 18, column: 7, scope: !45)
!50 = !DILocalVariable(name: "qPos", scope: !45, file: !3, line: 18, type: !17)
!51 = !DILocation(line: 18, column: 12, scope: !45)
!52 = !DILocalVariable(name: "bPos1", scope: !45, file: !3, line: 18, type: !17)
!53 = !DILocation(line: 18, column: 17, scope: !45)
!54 = !DILocalVariable(name: "bPos2", scope: !45, file: !3, line: 18, type: !17)
!55 = !DILocation(line: 18, column: 23, scope: !45)
!56 = !DILocalVariable(name: "rPos1", scope: !45, file: !3, line: 18, type: !17)
!57 = !DILocation(line: 18, column: 29, scope: !45)
!58 = !DILocalVariable(name: "rPos2", scope: !45, file: !3, line: 18, type: !17)
!59 = !DILocation(line: 18, column: 35, scope: !45)
!60 = !DILocalVariable(name: "nPos1", scope: !45, file: !3, line: 18, type: !17)
!61 = !DILocation(line: 18, column: 41, scope: !45)
!62 = !DILocalVariable(name: "nPos2", scope: !45, file: !3, line: 18, type: !17)
!63 = !DILocation(line: 18, column: 47, scope: !45)
!64 = !DILocalVariable(name: "i", scope: !45, file: !3, line: 18, type: !17)
!65 = !DILocation(line: 18, column: 53, scope: !45)
!66 = !DILocation(line: 20, column: 8, scope: !67)
!67 = distinct !DILexicalBlock(scope: !45, file: !3, line: 20, column: 3)
!68 = !DILocation(line: 20, column: 7, scope: !67)
!69 = !DILocation(line: 20, column: 11, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !3, line: 20, column: 3)
!71 = !DILocation(line: 20, column: 12, scope: !70)
!72 = !DILocation(line: 20, column: 3, scope: !67)
!73 = !DILocation(line: 21, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !3, line: 20, column: 19)
!75 = !DILocation(line: 21, column: 4, scope: !74)
!76 = !DILocation(line: 21, column: 12, scope: !74)
!77 = !DILocation(line: 22, column: 13, scope: !74)
!78 = !DILocation(line: 22, column: 8, scope: !74)
!79 = !DILocation(line: 22, column: 4, scope: !74)
!80 = !DILocation(line: 22, column: 11, scope: !74)
!81 = !DILocation(line: 23, column: 3, scope: !74)
!82 = !DILocation(line: 20, column: 16, scope: !70)
!83 = !DILocation(line: 20, column: 3, scope: !70)
!84 = distinct !{!84, !72, !85}
!85 = !DILocation(line: 23, column: 3, scope: !67)
!86 = !DILocation(line: 25, column: 3, scope: !45)
!87 = !DILocation(line: 26, column: 11, scope: !88)
!88 = distinct !DILexicalBlock(scope: !45, file: !3, line: 25, column: 5)
!89 = !DILocation(line: 26, column: 17, scope: !88)
!90 = !DILocation(line: 26, column: 9, scope: !88)
!91 = !DILocation(line: 27, column: 12, scope: !88)
!92 = !DILocation(line: 27, column: 18, scope: !88)
!93 = !DILocation(line: 27, column: 10, scope: !88)
!94 = !DILocation(line: 28, column: 12, scope: !88)
!95 = !DILocation(line: 28, column: 18, scope: !88)
!96 = !DILocation(line: 28, column: 10, scope: !88)
!97 = !DILocation(line: 29, column: 3, scope: !88)
!98 = !DILocation(line: 29, column: 11, scope: !45)
!99 = !DILocation(line: 29, column: 17, scope: !45)
!100 = !DILocation(line: 29, column: 16, scope: !45)
!101 = !DILocation(line: 29, column: 21, scope: !45)
!102 = !DILocation(line: 29, column: 25, scope: !45)
!103 = !DILocation(line: 29, column: 28, scope: !45)
!104 = !DILocation(line: 29, column: 34, scope: !45)
!105 = !DILocation(line: 29, column: 33, scope: !45)
!106 = !DILocation(line: 29, column: 38, scope: !45)
!107 = !DILocation(line: 29, column: 42, scope: !45)
!108 = !DILocation(line: 29, column: 45, scope: !45)
!109 = !DILocation(line: 29, column: 51, scope: !45)
!110 = !DILocation(line: 29, column: 50, scope: !45)
!111 = !DILocation(line: 29, column: 55, scope: !45)
!112 = !DILocation(line: 29, column: 59, scope: !45)
!113 = !DILocation(line: 29, column: 62, scope: !45)
!114 = !DILocation(line: 29, column: 68, scope: !45)
!115 = !DILocation(line: 29, column: 67, scope: !45)
!116 = !DILocation(line: 29, column: 72, scope: !45)
!117 = !DILocation(line: 29, column: 76, scope: !45)
!118 = !DILocation(line: 29, column: 79, scope: !45)
!119 = !DILocation(line: 29, column: 86, scope: !45)
!120 = !DILocation(line: 29, column: 84, scope: !45)
!121 = !DILocation(line: 29, column: 92, scope: !45)
!122 = !DILocation(line: 29, column: 95, scope: !45)
!123 = !DILocation(line: 29, column: 101, scope: !45)
!124 = !DILocation(line: 29, column: 99, scope: !45)
!125 = !DILocation(line: 29, column: 107, scope: !45)
!126 = !DILocation(line: 29, column: 110, scope: !45)
!127 = !DILocation(line: 29, column: 116, scope: !45)
!128 = !DILocation(line: 29, column: 114, scope: !45)
!129 = distinct !{!129, !86, !130}
!130 = !DILocation(line: 29, column: 122, scope: !45)
!131 = !DILocation(line: 31, column: 12, scope: !45)
!132 = !DILocation(line: 31, column: 8, scope: !45)
!133 = !DILocation(line: 31, column: 3, scope: !45)
!134 = !DILocation(line: 31, column: 20, scope: !45)
!135 = !DILocation(line: 32, column: 12, scope: !45)
!136 = !DILocation(line: 32, column: 8, scope: !45)
!137 = !DILocation(line: 32, column: 3, scope: !45)
!138 = !DILocation(line: 32, column: 19, scope: !45)
!139 = !DILocation(line: 33, column: 12, scope: !45)
!140 = !DILocation(line: 33, column: 8, scope: !45)
!141 = !DILocation(line: 33, column: 3, scope: !45)
!142 = !DILocation(line: 33, column: 20, scope: !45)
!143 = !DILocation(line: 35, column: 8, scope: !45)
!144 = !DILocation(line: 35, column: 3, scope: !45)
!145 = !DILocation(line: 36, column: 8, scope: !45)
!146 = !DILocation(line: 36, column: 3, scope: !45)
!147 = !DILocation(line: 37, column: 8, scope: !45)
!148 = !DILocation(line: 37, column: 3, scope: !45)
!149 = !DILocation(line: 39, column: 3, scope: !45)
!150 = !DILocation(line: 40, column: 12, scope: !151)
!151 = distinct !DILexicalBlock(scope: !45, file: !3, line: 39, column: 5)
!152 = !DILocation(line: 40, column: 18, scope: !151)
!153 = !DILocation(line: 40, column: 10, scope: !151)
!154 = !DILocation(line: 41, column: 12, scope: !151)
!155 = !DILocation(line: 41, column: 18, scope: !151)
!156 = !DILocation(line: 41, column: 10, scope: !151)
!157 = !DILocation(line: 42, column: 3, scope: !151)
!158 = !DILocation(line: 42, column: 16, scope: !45)
!159 = !DILocation(line: 42, column: 12, scope: !45)
!160 = !DILocation(line: 42, column: 27, scope: !45)
!161 = !DILocation(line: 42, column: 23, scope: !45)
!162 = !DILocation(line: 42, column: 22, scope: !45)
!163 = !DILocation(line: 42, column: 34, scope: !45)
!164 = !DILocation(line: 42, column: 36, scope: !45)
!165 = !DILocation(line: 42, column: 40, scope: !45)
!166 = !DILocation(line: 42, column: 43, scope: !45)
!167 = !DILocation(line: 42, column: 50, scope: !45)
!168 = !DILocation(line: 42, column: 48, scope: !45)
!169 = distinct !{!169, !149, !170}
!170 = !DILocation(line: 42, column: 56, scope: !45)
!171 = !DILocation(line: 44, column: 12, scope: !45)
!172 = !DILocation(line: 44, column: 8, scope: !45)
!173 = !DILocation(line: 44, column: 3, scope: !45)
!174 = !DILocation(line: 44, column: 20, scope: !45)
!175 = !DILocation(line: 45, column: 12, scope: !45)
!176 = !DILocation(line: 45, column: 8, scope: !45)
!177 = !DILocation(line: 45, column: 3, scope: !45)
!178 = !DILocation(line: 45, column: 20, scope: !45)
!179 = !DILocation(line: 47, column: 8, scope: !45)
!180 = !DILocation(line: 47, column: 3, scope: !45)
!181 = !DILocation(line: 48, column: 8, scope: !45)
!182 = !DILocation(line: 48, column: 3, scope: !45)
!183 = !DILocation(line: 50, column: 3, scope: !45)
!184 = !DILocation(line: 51, column: 11, scope: !185)
!185 = distinct !DILexicalBlock(scope: !45, file: !3, line: 50, column: 5)
!186 = !DILocation(line: 51, column: 17, scope: !185)
!187 = !DILocation(line: 51, column: 9, scope: !185)
!188 = !DILocation(line: 52, column: 12, scope: !185)
!189 = !DILocation(line: 52, column: 18, scope: !185)
!190 = !DILocation(line: 52, column: 10, scope: !185)
!191 = !DILocation(line: 53, column: 3, scope: !185)
!192 = !DILocation(line: 53, column: 10, scope: !45)
!193 = !DILocation(line: 53, column: 16, scope: !45)
!194 = !DILocation(line: 53, column: 14, scope: !45)
!195 = distinct !{!195, !183, !196}
!196 = !DILocation(line: 53, column: 21, scope: !45)
!197 = !DILocation(line: 55, column: 12, scope: !45)
!198 = !DILocation(line: 55, column: 8, scope: !45)
!199 = !DILocation(line: 55, column: 3, scope: !45)
!200 = !DILocation(line: 55, column: 19, scope: !45)
!201 = !DILocation(line: 56, column: 12, scope: !45)
!202 = !DILocation(line: 56, column: 8, scope: !45)
!203 = !DILocation(line: 56, column: 3, scope: !45)
!204 = !DILocation(line: 56, column: 20, scope: !45)
!205 = !DILocation(line: 58, column: 8, scope: !206)
!206 = distinct !DILexicalBlock(scope: !45, file: !3, line: 58, column: 3)
!207 = !DILocation(line: 58, column: 7, scope: !206)
!208 = !DILocation(line: 58, column: 11, scope: !209)
!209 = distinct !DILexicalBlock(scope: !206, file: !3, line: 58, column: 3)
!210 = !DILocation(line: 58, column: 12, scope: !209)
!211 = !DILocation(line: 58, column: 3, scope: !206)
!212 = !DILocation(line: 59, column: 12, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !3, line: 59, column: 7)
!214 = !DILocation(line: 59, column: 7, scope: !213)
!215 = !DILocation(line: 59, column: 14, scope: !213)
!216 = !DILocation(line: 59, column: 7, scope: !209)
!217 = !{!"if"}
!218 = !DILocation(line: 60, column: 10, scope: !219)
!219 = distinct !DILexicalBlock(scope: !213, file: !3, line: 59, column: 20)
!220 = !DILocation(line: 60, column: 5, scope: !219)
!221 = !DILocation(line: 60, column: 13, scope: !219)
!222 = !DILocation(line: 61, column: 5, scope: !219)
!223 = !DILocation(line: 59, column: 16, scope: !213)
!224 = !DILocation(line: 58, column: 16, scope: !209)
!225 = !DILocation(line: 58, column: 3, scope: !209)
!226 = distinct !{!226, !211, !227}
!227 = !DILocation(line: 62, column: 4, scope: !206)
!228 = !DILocation(line: 63, column: 1, scope: !45)
!229 = distinct !DISubprogram(name: "printRank", scope: !3, file: !3, line: 65, type: !46, scopeLine: 65, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!230 = !DILocalVariable(name: "i", scope: !229, file: !3, line: 66, type: !17)
!231 = !DILocation(line: 66, column: 6, scope: !229)
!232 = !DILocation(line: 72, column: 3, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !3, line: 71, column: 2)
!234 = !DILocation(line: 73, column: 3, scope: !233)
!235 = !DILocation(line: 74, column: 8, scope: !236)
!236 = distinct !DILexicalBlock(scope: !233, file: !3, line: 74, column: 3)
!237 = !DILocation(line: 74, column: 7, scope: !236)
!238 = !DILocation(line: 74, column: 11, scope: !239)
!239 = distinct !DILexicalBlock(scope: !236, file: !3, line: 74, column: 3)
!240 = !DILocation(line: 74, column: 12, scope: !239)
!241 = !DILocation(line: 74, column: 3, scope: !236)
!242 = !DILocation(line: 75, column: 12, scope: !243)
!243 = distinct !DILexicalBlock(scope: !244, file: !3, line: 75, column: 7)
!244 = distinct !DILexicalBlock(scope: !239, file: !3, line: 74, column: 19)
!245 = !DILocation(line: 75, column: 7, scope: !243)
!246 = !DILocation(line: 75, column: 14, scope: !243)
!247 = !DILocation(line: 75, column: 7, scope: !244)
!248 = !DILocation(line: 76, column: 5, scope: !243)
!249 = !DILocation(line: 77, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !243, file: !3, line: 77, column: 12)
!251 = !DILocation(line: 77, column: 12, scope: !250)
!252 = !DILocation(line: 77, column: 19, scope: !250)
!253 = !DILocation(line: 77, column: 12, scope: !243)
!254 = !DILocation(line: 78, column: 5, scope: !250)
!255 = !DILocation(line: 79, column: 17, scope: !256)
!256 = distinct !DILexicalBlock(scope: !250, file: !3, line: 79, column: 12)
!257 = !DILocation(line: 79, column: 12, scope: !256)
!258 = !DILocation(line: 79, column: 19, scope: !256)
!259 = !DILocation(line: 79, column: 12, scope: !250)
!260 = !DILocation(line: 80, column: 5, scope: !256)
!261 = !DILocation(line: 81, column: 17, scope: !262)
!262 = distinct !DILexicalBlock(scope: !256, file: !3, line: 81, column: 12)
!263 = !DILocation(line: 81, column: 12, scope: !262)
!264 = !DILocation(line: 81, column: 19, scope: !262)
!265 = !DILocation(line: 81, column: 12, scope: !256)
!266 = !DILocation(line: 82, column: 5, scope: !262)
!267 = !DILocation(line: 83, column: 12, scope: !268)
!268 = distinct !DILexicalBlock(scope: !244, file: !3, line: 83, column: 7)
!269 = !DILocation(line: 83, column: 7, scope: !268)
!270 = !DILocation(line: 83, column: 14, scope: !268)
!271 = !DILocation(line: 83, column: 7, scope: !244)
!272 = !DILocation(line: 84, column: 5, scope: !268)
!273 = !DILocation(line: 85, column: 3, scope: !244)
!274 = !DILocation(line: 74, column: 16, scope: !239)
!275 = !DILocation(line: 74, column: 3, scope: !239)
!276 = distinct !{!276, !241, !277}
!277 = !DILocation(line: 85, column: 3, scope: !236)
!278 = !DILocation(line: 88, column: 1, scope: !229)
!279 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 90, type: !280, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!280 = !DISubroutineType(types: !281)
!281 = !{!17}
!282 = !DILocalVariable(name: "i", scope: !279, file: !3, line: 92, type: !17)
!283 = !DILocation(line: 92, column: 6, scope: !279)
!284 = !DILocation(line: 94, column: 18, scope: !279)
!285 = !DILocation(line: 94, column: 8, scope: !279)
!286 = !DILocation(line: 94, column: 2, scope: !279)
!287 = !DILocation(line: 96, column: 7, scope: !288)
!288 = distinct !DILexicalBlock(scope: !279, file: !3, line: 96, column: 2)
!289 = !DILocation(line: 96, column: 6, scope: !288)
!290 = !DILocation(line: 96, column: 10, scope: !291)
!291 = distinct !DILexicalBlock(scope: !288, file: !3, line: 96, column: 2)
!292 = !DILocation(line: 96, column: 11, scope: !291)
!293 = !DILocation(line: 96, column: 2, scope: !288)
!294 = !DILocation(line: 97, column: 3, scope: !295)
!295 = distinct !DILexicalBlock(scope: !291, file: !3, line: 96, column: 18)
!296 = !DILocation(line: 98, column: 3, scope: !295)
!297 = !DILocation(line: 99, column: 2, scope: !295)
!298 = !DILocation(line: 96, column: 15, scope: !291)
!299 = !DILocation(line: 96, column: 2, scope: !291)
!300 = distinct !{!300, !293, !301}
!301 = !DILocation(line: 99, column: 2, scope: !288)
!302 = !DILocation(line: 101, column: 2, scope: !279)
