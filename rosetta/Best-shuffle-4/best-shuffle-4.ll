; ModuleID = 'best-shuffle-4.bc'
source_filename = "best-shuffle-4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"abracadabra\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"seesaw\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"elk\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"grrrrrr\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"up\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.6 = private unnamed_addr constant [12 x i8] c"%s %s (%d)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @best_shuffle(i8* %s, i32* %diff) #0 !dbg !9 {
entry:
  %s.addr = alloca i8*, align 8
  %diff.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %max = alloca i32, align 4
  %l = alloca i32, align 4
  %cnt = alloca [128 x i32], align 16
  %buf = alloca [256 x i8], align 16
  %r = alloca i8*, align 8
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !17, metadata !DIExpression()), !dbg !18
  store i32* %diff, i32** %diff.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %diff.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %i, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %j, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 0, i32* %j, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %max, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 0, i32* %max, align 4, !dbg !26
  call void @llvm.dbg.declare(metadata i32* %l, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = load i8*, i8** %s.addr, align 8, !dbg !29
  %call = call i64 @strlen(i8* %0) #6, !dbg !30
  %conv = trunc i64 %call to i32, !dbg !30
  store i32 %conv, i32* %l, align 4, !dbg !28
  call void @llvm.dbg.declare(metadata [128 x i32]* %cnt, metadata !31, metadata !DIExpression()), !dbg !35
  %1 = bitcast [128 x i32]* %cnt to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 512, i1 false), !dbg !35
  call void @llvm.dbg.declare(metadata [256 x i8]* %buf, metadata !36, metadata !DIExpression()), !dbg !40
  %2 = bitcast [256 x i8]* %buf to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 256, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i8** %r, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 0, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !45
  %4 = load i32, i32* %l, align 4, !dbg !45
  %cmp = icmp slt i32 %3, %4, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %s.addr, align 8, !dbg !47
  %6 = load i32, i32* %i, align 4, !dbg !49
  %idxprom = sext i32 %6 to i64, !dbg !47
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %idxprom, !dbg !47
  %7 = load i8, i8* %arrayidx, align 1, !dbg !47
  %conv2 = sext i8 %7 to i32, !dbg !50
  %idxprom3 = sext i32 %conv2 to i64, !dbg !51
  %arrayidx4 = getelementptr inbounds [128 x i32], [128 x i32]* %cnt, i64 0, i64 %idxprom3, !dbg !51
  %8 = load i32, i32* %arrayidx4, align 4, !dbg !52
  %inc = add nsw i32 %8, 1, !dbg !52
  store i32 %inc, i32* %arrayidx4, align 4, !dbg !52
  %9 = load i32, i32* %max, align 4, !dbg !53
  %cmp5 = icmp sgt i32 %inc, %9, !dbg !54
  br i1 %cmp5, label %if.then, label %if.end, !dbg !55

if.then:                                          ; preds = %for.body
  %10 = load i8*, i8** %s.addr, align 8, !dbg !56
  %11 = load i32, i32* %i, align 4, !dbg !57
  %idxprom7 = sext i32 %11 to i64, !dbg !56
  %arrayidx8 = getelementptr inbounds i8, i8* %10, i64 %idxprom7, !dbg !56
  %12 = load i8, i8* %arrayidx8, align 1, !dbg !56
  %conv9 = sext i8 %12 to i32, !dbg !58
  %idxprom10 = sext i32 %conv9 to i64, !dbg !59
  %arrayidx11 = getelementptr inbounds [128 x i32], [128 x i32]* %cnt, i64 0, i64 %idxprom10, !dbg !59
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !59
  store i32 %13, i32* %max, align 4, !dbg !60
  br label %if.end, !dbg !61

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %if.end
  %14 = load i32, i32* %i, align 4, !dbg !45
  %inc12 = add nsw i32 %14, 1, !dbg !45
  store i32 %inc12, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !45, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !64
  br label %for.cond13, !dbg !64

for.cond13:                                       ; preds = %for.inc23, %for.end
  %15 = load i32, i32* %i, align 4, !dbg !66
  %cmp14 = icmp slt i32 %15, 128, !dbg !66
  br i1 %cmp14, label %for.body16, label %for.end25, !dbg !64

for.body16:                                       ; preds = %for.cond13
  br label %while.cond, !dbg !68

while.cond:                                       ; preds = %while.body, %for.body16
  %16 = load i32, i32* %i, align 4, !dbg !69
  %idxprom17 = sext i32 %16 to i64, !dbg !70
  %arrayidx18 = getelementptr inbounds [128 x i32], [128 x i32]* %cnt, i64 0, i64 %idxprom17, !dbg !70
  %17 = load i32, i32* %arrayidx18, align 4, !dbg !71
  %dec = add nsw i32 %17, -1, !dbg !71
  store i32 %dec, i32* %arrayidx18, align 4, !dbg !71
  %tobool = icmp ne i32 %17, 0, !dbg !68
  br i1 %tobool, label %while.body, label %while.end, !dbg !68

while.body:                                       ; preds = %while.cond
  %18 = load i32, i32* %i, align 4, !dbg !72
  %conv19 = trunc i32 %18 to i8, !dbg !72
  %19 = load i32, i32* %j, align 4, !dbg !73
  %inc20 = add nsw i32 %19, 1, !dbg !73
  store i32 %inc20, i32* %j, align 4, !dbg !73
  %idxprom21 = sext i32 %19 to i64, !dbg !74
  %arrayidx22 = getelementptr inbounds [256 x i8], [256 x i8]* %buf, i64 0, i64 %idxprom21, !dbg !74
  store i8 %conv19, i8* %arrayidx22, align 1, !dbg !75
  br label %while.cond, !dbg !68, !llvm.loop !76

while.end:                                        ; preds = %while.cond
  br label %for.inc23, !dbg !68

for.inc23:                                        ; preds = %while.end
  %20 = load i32, i32* %i, align 4, !dbg !66
  %inc24 = add nsw i32 %20, 1, !dbg !66
  store i32 %inc24, i32* %i, align 4, !dbg !66
  br label %for.cond13, !dbg !66, !llvm.loop !77

for.end25:                                        ; preds = %for.cond13
  %21 = load i8*, i8** %s.addr, align 8, !dbg !79
  %call26 = call noalias i8* @strdup(i8* %21) #7, !dbg !80
  store i8* %call26, i8** %r, align 8, !dbg !81
  store i32 0, i32* %i, align 4, !dbg !82
  br label %for.cond27, !dbg !82

for.cond27:                                       ; preds = %for.inc58, %for.end25
  %22 = load i32, i32* %i, align 4, !dbg !84
  %23 = load i32, i32* %l, align 4, !dbg !84
  %cmp28 = icmp slt i32 %22, %23, !dbg !84
  br i1 %cmp28, label %for.body30, label %for.end60, !dbg !82

for.body30:                                       ; preds = %for.cond27
  store i32 0, i32* %j, align 4, !dbg !86
  br label %for.cond31, !dbg !86

for.cond31:                                       ; preds = %for.inc55, %for.body30
  %24 = load i32, i32* %j, align 4, !dbg !88
  %25 = load i32, i32* %l, align 4, !dbg !88
  %cmp32 = icmp slt i32 %24, %25, !dbg !88
  br i1 %cmp32, label %for.body34, label %for.end57.loopexit, !dbg !86

for.body34:                                       ; preds = %for.cond31
  %26 = load i8*, i8** %r, align 8, !dbg !90
  %27 = load i32, i32* %i, align 4, !dbg !92
  %idxprom35 = sext i32 %27 to i64, !dbg !90
  %arrayidx36 = getelementptr inbounds i8, i8* %26, i64 %idxprom35, !dbg !90
  %28 = load i8, i8* %arrayidx36, align 1, !dbg !90
  %conv37 = sext i8 %28 to i32, !dbg !90
  %29 = load i32, i32* %j, align 4, !dbg !93
  %idxprom38 = sext i32 %29 to i64, !dbg !94
  %arrayidx39 = getelementptr inbounds [256 x i8], [256 x i8]* %buf, i64 0, i64 %idxprom38, !dbg !94
  %30 = load i8, i8* %arrayidx39, align 1, !dbg !94
  %conv40 = sext i8 %30 to i32, !dbg !94
  %cmp41 = icmp eq i32 %conv37, %conv40, !dbg !95
  br i1 %cmp41, label %if.then43, label %if.end54, !dbg !96

if.then43:                                        ; preds = %for.body34
  %31 = load i32, i32* %j, align 4, !dbg !97
  %32 = load i32, i32* %max, align 4, !dbg !99
  %add = add nsw i32 %31, %32, !dbg !100
  %33 = load i32, i32* %l, align 4, !dbg !101
  %rem = srem i32 %add, %33, !dbg !102
  %idxprom44 = sext i32 %rem to i64, !dbg !103
  %arrayidx45 = getelementptr inbounds [256 x i8], [256 x i8]* %buf, i64 0, i64 %idxprom44, !dbg !103
  %34 = load i8, i8* %arrayidx45, align 1, !dbg !103
  %conv46 = sext i8 %34 to i32, !dbg !103
  %and = and i32 %conv46, -129, !dbg !104
  %conv47 = trunc i32 %and to i8, !dbg !103
  %35 = load i8*, i8** %r, align 8, !dbg !105
  %36 = load i32, i32* %i, align 4, !dbg !106
  %idxprom48 = sext i32 %36 to i64, !dbg !105
  %arrayidx49 = getelementptr inbounds i8, i8* %35, i64 %idxprom48, !dbg !105
  store i8 %conv47, i8* %arrayidx49, align 1, !dbg !107
  %37 = load i32, i32* %j, align 4, !dbg !108
  %idxprom50 = sext i32 %37 to i64, !dbg !109
  %arrayidx51 = getelementptr inbounds [256 x i8], [256 x i8]* %buf, i64 0, i64 %idxprom50, !dbg !109
  %38 = load i8, i8* %arrayidx51, align 1, !dbg !110
  %conv52 = sext i8 %38 to i32, !dbg !110
  %or = or i32 %conv52, 128, !dbg !110
  %conv53 = trunc i32 %or to i8, !dbg !110
  store i8 %conv53, i8* %arrayidx51, align 1, !dbg !110
  br label %for.end57, !dbg !111

if.end54:                                         ; preds = %for.body34
  br label %for.inc55, !dbg !112

for.inc55:                                        ; preds = %if.end54
  %39 = load i32, i32* %j, align 4, !dbg !88
  %inc56 = add nsw i32 %39, 1, !dbg !88
  store i32 %inc56, i32* %j, align 4, !dbg !88
  br label %for.cond31, !dbg !88, !llvm.loop !113

for.end57.loopexit:                               ; preds = %for.cond31
  br label %for.end57, !dbg !114

for.end57:                                        ; preds = %for.end57.loopexit, %if.then43
  br label %for.inc58, !dbg !114

for.inc58:                                        ; preds = %for.end57
  %40 = load i32, i32* %i, align 4, !dbg !84
  %inc59 = add nsw i32 %40, 1, !dbg !84
  store i32 %inc59, i32* %i, align 4, !dbg !84
  br label %for.cond27, !dbg !84, !llvm.loop !115

for.end60:                                        ; preds = %for.cond27
  %41 = load i32*, i32** %diff.addr, align 8, !dbg !117
  store i32 0, i32* %41, align 4, !dbg !118
  store i32 0, i32* %i, align 4, !dbg !119
  br label %for.cond61, !dbg !119

for.cond61:                                       ; preds = %for.inc74, %for.end60
  %42 = load i32, i32* %i, align 4, !dbg !121
  %43 = load i32, i32* %l, align 4, !dbg !121
  %cmp62 = icmp slt i32 %42, %43, !dbg !121
  br i1 %cmp62, label %for.body64, label %for.end76, !dbg !119

for.body64:                                       ; preds = %for.cond61
  %44 = load i8*, i8** %r, align 8, !dbg !123
  %45 = load i32, i32* %i, align 4, !dbg !124
  %idxprom65 = sext i32 %45 to i64, !dbg !123
  %arrayidx66 = getelementptr inbounds i8, i8* %44, i64 %idxprom65, !dbg !123
  %46 = load i8, i8* %arrayidx66, align 1, !dbg !123
  %conv67 = sext i8 %46 to i32, !dbg !123
  %47 = load i8*, i8** %s.addr, align 8, !dbg !125
  %48 = load i32, i32* %i, align 4, !dbg !126
  %idxprom68 = sext i32 %48 to i64, !dbg !125
  %arrayidx69 = getelementptr inbounds i8, i8* %47, i64 %idxprom68, !dbg !125
  %49 = load i8, i8* %arrayidx69, align 1, !dbg !125
  %conv70 = sext i8 %49 to i32, !dbg !125
  %cmp71 = icmp eq i32 %conv67, %conv70, !dbg !127
  %conv72 = zext i1 %cmp71 to i32, !dbg !127
  %50 = load i32*, i32** %diff.addr, align 8, !dbg !128
  %51 = load i32, i32* %50, align 4, !dbg !129
  %add73 = add nsw i32 %51, %conv72, !dbg !129
  store i32 %add73, i32* %50, align 4, !dbg !129
  br label %for.inc74, !dbg !130

for.inc74:                                        ; preds = %for.body64
  %52 = load i32, i32* %i, align 4, !dbg !121
  %inc75 = add nsw i32 %52, 1, !dbg !121
  store i32 %inc75, i32* %i, align 4, !dbg !121
  br label %for.cond61, !dbg !121, !llvm.loop !131

for.end76:                                        ; preds = %for.cond61
  %53 = load i8*, i8** %r, align 8, !dbg !133
  ret i8* %53, !dbg !134
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local noalias i8* @strdup(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !135 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %d = alloca i32, align 4
  %r = alloca i8*, align 8
  %t = alloca [7 x i8*], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i32* %d, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i8** %r, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata [7 x i8*]* %t, metadata !143, metadata !DIExpression()), !dbg !147
  %0 = bitcast [7 x i8*]* %t to i8*, !dbg !147
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 56, i1 false), !dbg !147
  %1 = bitcast i8* %0 to [7 x i8*]*, !dbg !147
  %2 = getelementptr inbounds [7 x i8*], [7 x i8*]* %1, i32 0, i32 0, !dbg !147
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i8** %2, align 16, !dbg !147
  %3 = getelementptr inbounds [7 x i8*], [7 x i8*]* %1, i32 0, i32 1, !dbg !147
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i8** %3, align 8, !dbg !147
  %4 = getelementptr inbounds [7 x i8*], [7 x i8*]* %1, i32 0, i32 2, !dbg !147
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i8** %4, align 16, !dbg !147
  %5 = getelementptr inbounds [7 x i8*], [7 x i8*]* %1, i32 0, i32 3, !dbg !147
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), i8** %5, align 8, !dbg !147
  %6 = getelementptr inbounds [7 x i8*], [7 x i8*]* %1, i32 0, i32 4, !dbg !147
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i8** %6, align 16, !dbg !147
  %7 = getelementptr inbounds [7 x i8*], [7 x i8*]* %1, i32 0, i32 5, !dbg !147
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0), i8** %7, align 8, !dbg !147
  store i32 0, i32* %i, align 4, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32, i32* %i, align 4, !dbg !151
  %idxprom = sext i32 %8 to i64, !dbg !153
  %arrayidx = getelementptr inbounds [7 x i8*], [7 x i8*]* %t, i64 0, i64 %idxprom, !dbg !153
  %9 = load i8*, i8** %arrayidx, align 8, !dbg !153
  %tobool = icmp ne i8* %9, null, !dbg !154
  br i1 %tobool, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %i, align 4, !dbg !155
  %idxprom1 = sext i32 %10 to i64, !dbg !157
  %arrayidx2 = getelementptr inbounds [7 x i8*], [7 x i8*]* %t, i64 0, i64 %idxprom1, !dbg !157
  %11 = load i8*, i8** %arrayidx2, align 8, !dbg !157
  %call = call i8* @best_shuffle(i8* %11, i32* %d), !dbg !158
  store i8* %call, i8** %r, align 8, !dbg !159
  %12 = load i32, i32* %i, align 4, !dbg !160
  %idxprom3 = sext i32 %12 to i64, !dbg !161
  %arrayidx4 = getelementptr inbounds [7 x i8*], [7 x i8*]* %t, i64 0, i64 %idxprom3, !dbg !161
  %13 = load i8*, i8** %arrayidx4, align 8, !dbg !161
  %14 = load i8*, i8** %r, align 8, !dbg !162
  %15 = load i32, i32* %d, align 4, !dbg !163
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i64 0, i64 0), i8* %13, i8* %14, i32 %15), !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %16 = load i32, i32* %i, align 4, !dbg !166
  %inc = add nsw i32 %16, 1, !dbg !166
  store i32 %inc, i32* %i, align 4, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !170
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "best-shuffle-4.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Best-shuffle-4")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = distinct !DISubprogram(name: "best_shuffle", scope: !1, file: !1, line: 5, type: !10, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !14, !16}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!17 = !DILocalVariable(name: "s", arg: 1, scope: !9, file: !1, line: 5, type: !14)
!18 = !DILocation(line: 5, column: 32, scope: !9)
!19 = !DILocalVariable(name: "diff", arg: 2, scope: !9, file: !1, line: 5, type: !16)
!20 = !DILocation(line: 5, column: 40, scope: !9)
!21 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 7, type: !4)
!22 = !DILocation(line: 7, column: 6, scope: !9)
!23 = !DILocalVariable(name: "j", scope: !9, file: !1, line: 7, type: !4)
!24 = !DILocation(line: 7, column: 9, scope: !9)
!25 = !DILocalVariable(name: "max", scope: !9, file: !1, line: 7, type: !4)
!26 = !DILocation(line: 7, column: 16, scope: !9)
!27 = !DILocalVariable(name: "l", scope: !9, file: !1, line: 7, type: !4)
!28 = !DILocation(line: 7, column: 25, scope: !9)
!29 = !DILocation(line: 7, column: 36, scope: !9)
!30 = !DILocation(line: 7, column: 29, scope: !9)
!31 = !DILocalVariable(name: "cnt", scope: !9, file: !1, line: 7, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 4096, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 128)
!35 = !DILocation(line: 7, column: 40, scope: !9)
!36 = !DILocalVariable(name: "buf", scope: !9, file: !1, line: 8, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 2048, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 256)
!40 = !DILocation(line: 8, column: 7, scope: !9)
!41 = !DILocalVariable(name: "r", scope: !9, file: !1, line: 8, type: !12)
!42 = !DILocation(line: 8, column: 24, scope: !9)
!43 = !DILocation(line: 10, column: 2, scope: !44)
!44 = distinct !DILexicalBlock(scope: !9, file: !1, line: 10, column: 2)
!45 = !DILocation(line: 10, column: 2, scope: !46)
!46 = distinct !DILexicalBlock(scope: !44, file: !1, line: 10, column: 2)
!47 = !DILocation(line: 10, column: 27, scope: !48)
!48 = distinct !DILexicalBlock(scope: !46, file: !1, line: 10, column: 16)
!49 = !DILocation(line: 10, column: 29, scope: !48)
!50 = !DILocation(line: 10, column: 22, scope: !48)
!51 = !DILocation(line: 10, column: 18, scope: !48)
!52 = !DILocation(line: 10, column: 16, scope: !48)
!53 = !DILocation(line: 10, column: 35, scope: !48)
!54 = !DILocation(line: 10, column: 33, scope: !48)
!55 = !DILocation(line: 10, column: 16, scope: !46)
!56 = !DILocation(line: 10, column: 55, scope: !48)
!57 = !DILocation(line: 10, column: 57, scope: !48)
!58 = !DILocation(line: 10, column: 50, scope: !48)
!59 = !DILocation(line: 10, column: 46, scope: !48)
!60 = !DILocation(line: 10, column: 44, scope: !48)
!61 = !DILocation(line: 10, column: 40, scope: !48)
!62 = distinct !{!62, !43, !63}
!63 = !DILocation(line: 10, column: 59, scope: !44)
!64 = !DILocation(line: 11, column: 2, scope: !65)
!65 = distinct !DILexicalBlock(scope: !9, file: !1, line: 11, column: 2)
!66 = !DILocation(line: 11, column: 2, scope: !67)
!67 = distinct !DILexicalBlock(scope: !65, file: !1, line: 11, column: 2)
!68 = !DILocation(line: 11, column: 14, scope: !67)
!69 = !DILocation(line: 11, column: 25, scope: !67)
!70 = !DILocation(line: 11, column: 21, scope: !67)
!71 = !DILocation(line: 11, column: 27, scope: !67)
!72 = !DILocation(line: 11, column: 42, scope: !67)
!73 = !DILocation(line: 11, column: 36, scope: !67)
!74 = !DILocation(line: 11, column: 31, scope: !67)
!75 = !DILocation(line: 11, column: 40, scope: !67)
!76 = distinct !{!76, !68, !72}
!77 = distinct !{!77, !64, !78}
!78 = !DILocation(line: 11, column: 42, scope: !65)
!79 = !DILocation(line: 13, column: 13, scope: !9)
!80 = !DILocation(line: 13, column: 6, scope: !9)
!81 = !DILocation(line: 13, column: 4, scope: !9)
!82 = !DILocation(line: 14, column: 2, scope: !83)
!83 = distinct !DILexicalBlock(scope: !9, file: !1, line: 14, column: 2)
!84 = !DILocation(line: 14, column: 2, scope: !85)
!85 = distinct !DILexicalBlock(scope: !83, file: !1, line: 14, column: 2)
!86 = !DILocation(line: 14, column: 12, scope: !87)
!87 = distinct !DILexicalBlock(scope: !85, file: !1, line: 14, column: 12)
!88 = !DILocation(line: 14, column: 12, scope: !89)
!89 = distinct !DILexicalBlock(scope: !87, file: !1, line: 14, column: 12)
!90 = !DILocation(line: 15, column: 7, scope: !91)
!91 = distinct !DILexicalBlock(scope: !89, file: !1, line: 15, column: 7)
!92 = !DILocation(line: 15, column: 9, scope: !91)
!93 = !DILocation(line: 15, column: 19, scope: !91)
!94 = !DILocation(line: 15, column: 15, scope: !91)
!95 = !DILocation(line: 15, column: 12, scope: !91)
!96 = !DILocation(line: 15, column: 7, scope: !89)
!97 = !DILocation(line: 16, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !91, file: !1, line: 15, column: 23)
!99 = !DILocation(line: 16, column: 20, scope: !98)
!100 = !DILocation(line: 16, column: 18, scope: !98)
!101 = !DILocation(line: 16, column: 27, scope: !98)
!102 = !DILocation(line: 16, column: 25, scope: !98)
!103 = !DILocation(line: 16, column: 11, scope: !98)
!104 = !DILocation(line: 16, column: 30, scope: !98)
!105 = !DILocation(line: 16, column: 4, scope: !98)
!106 = !DILocation(line: 16, column: 6, scope: !98)
!107 = !DILocation(line: 16, column: 9, scope: !98)
!108 = !DILocation(line: 17, column: 8, scope: !98)
!109 = !DILocation(line: 17, column: 4, scope: !98)
!110 = !DILocation(line: 17, column: 11, scope: !98)
!111 = !DILocation(line: 18, column: 4, scope: !98)
!112 = !DILocation(line: 15, column: 20, scope: !91)
!113 = distinct !{!113, !86, !114}
!114 = !DILocation(line: 19, column: 3, scope: !87)
!115 = distinct !{!115, !82, !116}
!116 = !DILocation(line: 19, column: 3, scope: !83)
!117 = !DILocation(line: 21, column: 3, scope: !9)
!118 = !DILocation(line: 21, column: 8, scope: !9)
!119 = !DILocation(line: 22, column: 2, scope: !120)
!120 = distinct !DILexicalBlock(scope: !9, file: !1, line: 22, column: 2)
!121 = !DILocation(line: 22, column: 2, scope: !122)
!122 = distinct !DILexicalBlock(scope: !120, file: !1, line: 22, column: 2)
!123 = !DILocation(line: 22, column: 21, scope: !122)
!124 = !DILocation(line: 22, column: 23, scope: !122)
!125 = !DILocation(line: 22, column: 29, scope: !122)
!126 = !DILocation(line: 22, column: 31, scope: !122)
!127 = !DILocation(line: 22, column: 26, scope: !122)
!128 = !DILocation(line: 22, column: 13, scope: !122)
!129 = !DILocation(line: 22, column: 18, scope: !122)
!130 = !DILocation(line: 22, column: 12, scope: !122)
!131 = distinct !{!131, !119, !132}
!132 = !DILocation(line: 22, column: 32, scope: !120)
!133 = !DILocation(line: 24, column: 9, scope: !9)
!134 = !DILocation(line: 24, column: 2, scope: !9)
!135 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 27, type: !136, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!136 = !DISubroutineType(types: !3)
!137 = !DILocalVariable(name: "i", scope: !135, file: !1, line: 29, type: !4)
!138 = !DILocation(line: 29, column: 6, scope: !135)
!139 = !DILocalVariable(name: "d", scope: !135, file: !1, line: 29, type: !4)
!140 = !DILocation(line: 29, column: 9, scope: !135)
!141 = !DILocalVariable(name: "r", scope: !135, file: !1, line: 30, type: !14)
!142 = !DILocation(line: 30, column: 14, scope: !135)
!143 = !DILocalVariable(name: "t", scope: !135, file: !1, line: 30, type: !144)
!144 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 448, elements: !145)
!145 = !{!146}
!146 = !DISubrange(count: 7)
!147 = !DILocation(line: 30, column: 18, scope: !135)
!148 = !DILocation(line: 31, column: 9, scope: !149)
!149 = distinct !DILexicalBlock(scope: !135, file: !1, line: 31, column: 2)
!150 = !DILocation(line: 31, column: 7, scope: !149)
!151 = !DILocation(line: 31, column: 16, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !1, line: 31, column: 2)
!153 = !DILocation(line: 31, column: 14, scope: !152)
!154 = !DILocation(line: 31, column: 2, scope: !149)
!155 = !DILocation(line: 32, column: 22, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !1, line: 31, column: 25)
!157 = !DILocation(line: 32, column: 20, scope: !156)
!158 = !DILocation(line: 32, column: 7, scope: !156)
!159 = !DILocation(line: 32, column: 5, scope: !156)
!160 = !DILocation(line: 33, column: 28, scope: !156)
!161 = !DILocation(line: 33, column: 26, scope: !156)
!162 = !DILocation(line: 33, column: 32, scope: !156)
!163 = !DILocation(line: 33, column: 35, scope: !156)
!164 = !DILocation(line: 33, column: 3, scope: !156)
!165 = !DILocation(line: 34, column: 2, scope: !156)
!166 = !DILocation(line: 31, column: 21, scope: !152)
!167 = !DILocation(line: 31, column: 2, scope: !152)
!168 = distinct !{!168, !154, !169}
!169 = !DILocation(line: 34, column: 2, scope: !149)
!170 = !DILocation(line: 35, column: 2, scope: !135)
