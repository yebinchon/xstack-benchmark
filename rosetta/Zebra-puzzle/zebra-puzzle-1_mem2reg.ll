; ModuleID = 'zebra-puzzle-1.ll'
source_filename = "zebra-puzzle-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"Red\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"Green\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"White\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"Yellow\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"Blue\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"English\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"Swede\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"Dane\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"German\00", align 1
@.str.9 = private unnamed_addr constant [10 x i8] c"Norwegian\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"Tea\00", align 1
@.str.11 = private unnamed_addr constant [7 x i8] c"Coffee\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"Milk\00", align 1
@.str.13 = private unnamed_addr constant [5 x i8] c"Beer\00", align 1
@.str.14 = private unnamed_addr constant [6 x i8] c"Water\00", align 1
@.str.15 = private unnamed_addr constant [4 x i8] c"Dog\00", align 1
@.str.16 = private unnamed_addr constant [6 x i8] c"Birds\00", align 1
@.str.17 = private unnamed_addr constant [5 x i8] c"Cats\00", align 1
@.str.18 = private unnamed_addr constant [6 x i8] c"Horse\00", align 1
@.str.19 = private unnamed_addr constant [6 x i8] c"Zebra\00", align 1
@.str.20 = private unnamed_addr constant [9 x i8] c"PallMall\00", align 1
@.str.21 = private unnamed_addr constant [8 x i8] c"Dunhill\00", align 1
@.str.22 = private unnamed_addr constant [6 x i8] c"Blend\00", align 1
@.str.23 = private unnamed_addr constant [11 x i8] c"BlueMaster\00", align 1
@.str.24 = private unnamed_addr constant [7 x i8] c"Prince\00", align 1
@.str.25 = private unnamed_addr constant [50 x i8] c"%-10.10s%-10.10s%-10.10s%-10.10s%-10.10s%-10.10s\0A\00", align 1
@.str.26 = private unnamed_addr constant [6 x i8] c"House\00", align 1
@.str.27 = private unnamed_addr constant [6 x i8] c"Color\00", align 1
@.str.28 = private unnamed_addr constant [4 x i8] c"Man\00", align 1
@.str.29 = private unnamed_addr constant [6 x i8] c"Drink\00", align 1
@.str.30 = private unnamed_addr constant [7 x i8] c"Animal\00", align 1
@.str.31 = private unnamed_addr constant [6 x i8] c"Smoke\00", align 1
@.str.32 = private unnamed_addr constant [6 x i8] c"%-10d\00", align 1
@.str.33 = private unnamed_addr constant [9 x i8] c"%-10.10s\00", align 1
@.str.34 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.35 = private unnamed_addr constant [10 x i8] c"%-10.10s\0A\00", align 1
@.str.36 = private unnamed_addr constant [3 x i8] c"-\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @printHouses([5 x i32]* %ha) #0 !dbg !55 {
entry:
  %color = alloca [5 x i8*], align 16
  %man = alloca [5 x i8*], align 16
  %drink = alloca [5 x i8*], align 16
  %animal = alloca [5 x i8*], align 16
  %smoke = alloca [5 x i8*], align 16
  call void @llvm.dbg.value(metadata [5 x i32]* %ha, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata [5 x i8*]* %color, metadata !66, metadata !DIExpression()), !dbg !71
  %0 = bitcast [5 x i8*]* %color to i8*, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !71
  %1 = bitcast i8* %0 to [5 x i8*]*, !dbg !71
  %2 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 0, !dbg !71
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8** %2, align 16, !dbg !71
  %3 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 1, !dbg !71
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i8** %3, align 8, !dbg !71
  %4 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 2, !dbg !71
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8** %4, align 16, !dbg !71
  %5 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 3, !dbg !71
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8** %5, align 8, !dbg !71
  %6 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 4, !dbg !71
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0), i8** %6, align 16, !dbg !71
  call void @llvm.dbg.declare(metadata [5 x i8*]* %man, metadata !72, metadata !DIExpression()), !dbg !73
  %7 = bitcast [5 x i8*]* %man to i8*, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 40, i1 false), !dbg !73
  %8 = bitcast i8* %7 to [5 x i8*]*, !dbg !73
  %9 = getelementptr inbounds [5 x i8*], [5 x i8*]* %8, i32 0, i32 0, !dbg !73
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), i8** %9, align 16, !dbg !73
  %10 = getelementptr inbounds [5 x i8*], [5 x i8*]* %8, i32 0, i32 1, !dbg !73
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0), i8** %10, align 8, !dbg !73
  %11 = getelementptr inbounds [5 x i8*], [5 x i8*]* %8, i32 0, i32 2, !dbg !73
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0), i8** %11, align 16, !dbg !73
  %12 = getelementptr inbounds [5 x i8*], [5 x i8*]* %8, i32 0, i32 3, !dbg !73
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0), i8** %12, align 8, !dbg !73
  %13 = getelementptr inbounds [5 x i8*], [5 x i8*]* %8, i32 0, i32 4, !dbg !73
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i32 0, i32 0), i8** %13, align 16, !dbg !73
  call void @llvm.dbg.declare(metadata [5 x i8*]* %drink, metadata !74, metadata !DIExpression()), !dbg !75
  %14 = bitcast [5 x i8*]* %drink to i8*, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 16 %14, i8 0, i64 40, i1 false), !dbg !75
  %15 = bitcast i8* %14 to [5 x i8*]*, !dbg !75
  %16 = getelementptr inbounds [5 x i8*], [5 x i8*]* %15, i32 0, i32 0, !dbg !75
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0), i8** %16, align 16, !dbg !75
  %17 = getelementptr inbounds [5 x i8*], [5 x i8*]* %15, i32 0, i32 1, !dbg !75
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i32 0, i32 0), i8** %17, align 8, !dbg !75
  %18 = getelementptr inbounds [5 x i8*], [5 x i8*]* %15, i32 0, i32 2, !dbg !75
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i32 0, i32 0), i8** %18, align 16, !dbg !75
  %19 = getelementptr inbounds [5 x i8*], [5 x i8*]* %15, i32 0, i32 3, !dbg !75
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0), i8** %19, align 8, !dbg !75
  %20 = getelementptr inbounds [5 x i8*], [5 x i8*]* %15, i32 0, i32 4, !dbg !75
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.14, i32 0, i32 0), i8** %20, align 16, !dbg !75
  call void @llvm.dbg.declare(metadata [5 x i8*]* %animal, metadata !76, metadata !DIExpression()), !dbg !77
  %21 = bitcast [5 x i8*]* %animal to i8*, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* align 16 %21, i8 0, i64 40, i1 false), !dbg !77
  %22 = bitcast i8* %21 to [5 x i8*]*, !dbg !77
  %23 = getelementptr inbounds [5 x i8*], [5 x i8*]* %22, i32 0, i32 0, !dbg !77
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0), i8** %23, align 16, !dbg !77
  %24 = getelementptr inbounds [5 x i8*], [5 x i8*]* %22, i32 0, i32 1, !dbg !77
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i32 0, i32 0), i8** %24, align 8, !dbg !77
  %25 = getelementptr inbounds [5 x i8*], [5 x i8*]* %22, i32 0, i32 2, !dbg !77
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.17, i32 0, i32 0), i8** %25, align 16, !dbg !77
  %26 = getelementptr inbounds [5 x i8*], [5 x i8*]* %22, i32 0, i32 3, !dbg !77
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i32 0, i32 0), i8** %26, align 8, !dbg !77
  %27 = getelementptr inbounds [5 x i8*], [5 x i8*]* %22, i32 0, i32 4, !dbg !77
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.19, i32 0, i32 0), i8** %27, align 16, !dbg !77
  call void @llvm.dbg.declare(metadata [5 x i8*]* %smoke, metadata !78, metadata !DIExpression()), !dbg !79
  %28 = bitcast [5 x i8*]* %smoke to i8*, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %28, i8 0, i64 40, i1 false), !dbg !79
  %29 = bitcast i8* %28 to [5 x i8*]*, !dbg !79
  %30 = getelementptr inbounds [5 x i8*], [5 x i8*]* %29, i32 0, i32 0, !dbg !79
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.20, i32 0, i32 0), i8** %30, align 16, !dbg !79
  %31 = getelementptr inbounds [5 x i8*], [5 x i8*]* %29, i32 0, i32 1, !dbg !79
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.21, i32 0, i32 0), i8** %31, align 8, !dbg !79
  %32 = getelementptr inbounds [5 x i8*], [5 x i8*]* %29, i32 0, i32 2, !dbg !79
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.22, i32 0, i32 0), i8** %32, align 16, !dbg !79
  %33 = getelementptr inbounds [5 x i8*], [5 x i8*]* %29, i32 0, i32 3, !dbg !79
  store i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.23, i32 0, i32 0), i8** %33, align 8, !dbg !79
  %34 = getelementptr inbounds [5 x i8*], [5 x i8*]* %29, i32 0, i32 4, !dbg !79
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.24, i32 0, i32 0), i8** %34, align 16, !dbg !79
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.25, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.26, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.27, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.28, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.29, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.31, i64 0, i64 0)), !dbg !80
  call void @llvm.dbg.value(metadata i32 0, metadata !81, metadata !DIExpression()), !dbg !83
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !83
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !81, metadata !DIExpression()), !dbg !83
  %cmp = icmp slt i32 %i.0, 5, !dbg !85
  br i1 %cmp, label %for.body, label %for.end, !dbg !87

for.body:                                         ; preds = %for.cond
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.32, i64 0, i64 0), i32 %i.0), !dbg !88
  %idxprom = sext i32 %i.0 to i64, !dbg !90
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom, !dbg !90
  %arrayidx2 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx, i64 0, i64 0, !dbg !90
  %35 = load i32, i32* %arrayidx2, align 4, !dbg !90
  %cmp3 = icmp sge i32 %35, 0, !dbg !92
  br i1 %cmp3, label %if.then, label %if.else, !dbg !93, !cf.info !94

if.then:                                          ; preds = %for.body
  %idxprom4 = sext i32 %i.0 to i64, !dbg !95
  %arrayidx5 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom4, !dbg !95
  %arrayidx6 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx5, i64 0, i64 0, !dbg !95
  %36 = load i32, i32* %arrayidx6, align 4, !dbg !95
  %idxprom7 = sext i32 %36 to i64, !dbg !96
  %arrayidx8 = getelementptr inbounds [5 x i8*], [5 x i8*]* %color, i64 0, i64 %idxprom7, !dbg !96
  %37 = load i8*, i8** %arrayidx8, align 8, !dbg !96
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i64 0, i64 0), i8* %37), !dbg !97
  br label %if.end, !dbg !97

if.else:                                          ; preds = %for.body
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.34, i64 0, i64 0)), !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %idxprom11 = sext i32 %i.0 to i64, !dbg !99
  %arrayidx12 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom11, !dbg !99
  %arrayidx13 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx12, i64 0, i64 1, !dbg !99
  %38 = load i32, i32* %arrayidx13, align 4, !dbg !99
  %cmp14 = icmp sge i32 %38, 0, !dbg !101
  br i1 %cmp14, label %if.then15, label %if.else22, !dbg !102, !cf.info !94

if.then15:                                        ; preds = %if.end
  %idxprom16 = sext i32 %i.0 to i64, !dbg !103
  %arrayidx17 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom16, !dbg !103
  %arrayidx18 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx17, i64 0, i64 1, !dbg !103
  %39 = load i32, i32* %arrayidx18, align 4, !dbg !103
  %idxprom19 = sext i32 %39 to i64, !dbg !104
  %arrayidx20 = getelementptr inbounds [5 x i8*], [5 x i8*]* %man, i64 0, i64 %idxprom19, !dbg !104
  %40 = load i8*, i8** %arrayidx20, align 8, !dbg !104
  %call21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i64 0, i64 0), i8* %40), !dbg !105
  br label %if.end24, !dbg !105

if.else22:                                        ; preds = %if.end
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.34, i64 0, i64 0)), !dbg !106
  br label %if.end24

if.end24:                                         ; preds = %if.else22, %if.then15
  %idxprom25 = sext i32 %i.0 to i64, !dbg !107
  %arrayidx26 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom25, !dbg !107
  %arrayidx27 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx26, i64 0, i64 2, !dbg !107
  %41 = load i32, i32* %arrayidx27, align 4, !dbg !107
  %cmp28 = icmp sge i32 %41, 0, !dbg !109
  br i1 %cmp28, label %if.then29, label %if.else36, !dbg !110, !cf.info !94

if.then29:                                        ; preds = %if.end24
  %idxprom30 = sext i32 %i.0 to i64, !dbg !111
  %arrayidx31 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom30, !dbg !111
  %arrayidx32 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx31, i64 0, i64 2, !dbg !111
  %42 = load i32, i32* %arrayidx32, align 4, !dbg !111
  %idxprom33 = sext i32 %42 to i64, !dbg !112
  %arrayidx34 = getelementptr inbounds [5 x i8*], [5 x i8*]* %drink, i64 0, i64 %idxprom33, !dbg !112
  %43 = load i8*, i8** %arrayidx34, align 8, !dbg !112
  %call35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i64 0, i64 0), i8* %43), !dbg !113
  br label %if.end38, !dbg !113

if.else36:                                        ; preds = %if.end24
  %call37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.34, i64 0, i64 0)), !dbg !114
  br label %if.end38

if.end38:                                         ; preds = %if.else36, %if.then29
  %idxprom39 = sext i32 %i.0 to i64, !dbg !115
  %arrayidx40 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom39, !dbg !115
  %arrayidx41 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx40, i64 0, i64 3, !dbg !115
  %44 = load i32, i32* %arrayidx41, align 4, !dbg !115
  %cmp42 = icmp sge i32 %44, 0, !dbg !117
  br i1 %cmp42, label %if.then43, label %if.else50, !dbg !118, !cf.info !94

if.then43:                                        ; preds = %if.end38
  %idxprom44 = sext i32 %i.0 to i64, !dbg !119
  %arrayidx45 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom44, !dbg !119
  %arrayidx46 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx45, i64 0, i64 3, !dbg !119
  %45 = load i32, i32* %arrayidx46, align 4, !dbg !119
  %idxprom47 = sext i32 %45 to i64, !dbg !120
  %arrayidx48 = getelementptr inbounds [5 x i8*], [5 x i8*]* %animal, i64 0, i64 %idxprom47, !dbg !120
  %46 = load i8*, i8** %arrayidx48, align 8, !dbg !120
  %call49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i64 0, i64 0), i8* %46), !dbg !121
  br label %if.end52, !dbg !121

if.else50:                                        ; preds = %if.end38
  %call51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.34, i64 0, i64 0)), !dbg !122
  br label %if.end52

if.end52:                                         ; preds = %if.else50, %if.then43
  %idxprom53 = sext i32 %i.0 to i64, !dbg !123
  %arrayidx54 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom53, !dbg !123
  %arrayidx55 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx54, i64 0, i64 4, !dbg !123
  %47 = load i32, i32* %arrayidx55, align 4, !dbg !123
  %cmp56 = icmp sge i32 %47, 0, !dbg !125
  br i1 %cmp56, label %if.then57, label %if.else64, !dbg !126, !cf.info !94

if.then57:                                        ; preds = %if.end52
  %idxprom58 = sext i32 %i.0 to i64, !dbg !127
  %arrayidx59 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom58, !dbg !127
  %arrayidx60 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx59, i64 0, i64 4, !dbg !127
  %48 = load i32, i32* %arrayidx60, align 4, !dbg !127
  %idxprom61 = sext i32 %48 to i64, !dbg !128
  %arrayidx62 = getelementptr inbounds [5 x i8*], [5 x i8*]* %smoke, i64 0, i64 %idxprom61, !dbg !128
  %49 = load i8*, i8** %arrayidx62, align 8, !dbg !128
  %call63 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.35, i64 0, i64 0), i8* %49), !dbg !129
  br label %if.end66, !dbg !129

if.else64:                                        ; preds = %if.end52
  %call65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.36, i64 0, i64 0)), !dbg !130
  br label %if.end66

if.end66:                                         ; preds = %if.else64, %if.then57
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %if.end66
  %inc = add nsw i32 %i.0, 1, !dbg !132
  call void @llvm.dbg.value(metadata i32 %inc, metadata !81, metadata !DIExpression()), !dbg !83
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  ret void, !dbg !136
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @checkHouses([5 x i32]* %ha) #0 !dbg !137 {
entry:
  call void @llvm.dbg.value(metadata [5 x i32]* %ha, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 0, metadata !142, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 0, metadata !143, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 0, metadata !144, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 0, metadata !145, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 0, metadata !146, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 0, metadata !147, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 0, metadata !148, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 0, metadata !149, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 0, metadata !150, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 0, metadata !151, metadata !DIExpression()), !dbg !141
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 2, !dbg !152
  %arrayidx1 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx, i64 0, i64 2, !dbg !152
  %0 = load i32, i32* %arrayidx1, align 4, !dbg !152
  %cmp = icmp sge i32 %0, 0, !dbg !154
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !155, !cf.info !94

land.lhs.true:                                    ; preds = %entry
  %arrayidx2 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 2, !dbg !156
  %arrayidx3 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx2, i64 0, i64 2, !dbg !156
  %1 = load i32, i32* %arrayidx3, align 4, !dbg !156
  %cmp4 = icmp ne i32 %1, 2, !dbg !157
  br i1 %cmp4, label %if.then, label %if.end, !dbg !158, !cf.info !94

if.then:                                          ; preds = %land.lhs.true
  br label %return, !dbg !159

if.end:                                           ; preds = %land.lhs.true, %entry
  %arrayidx5 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 0, !dbg !160
  %arrayidx6 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx5, i64 0, i64 1, !dbg !160
  %2 = load i32, i32* %arrayidx6, align 4, !dbg !160
  %cmp7 = icmp sge i32 %2, 0, !dbg !162
  br i1 %cmp7, label %land.lhs.true8, label %if.end13, !dbg !163, !cf.info !94

land.lhs.true8:                                   ; preds = %if.end
  %arrayidx9 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 0, !dbg !164
  %arrayidx10 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx9, i64 0, i64 1, !dbg !164
  %3 = load i32, i32* %arrayidx10, align 4, !dbg !164
  %cmp11 = icmp ne i32 %3, 4, !dbg !165
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !166, !cf.info !94

if.then12:                                        ; preds = %land.lhs.true8
  br label %return, !dbg !167

if.end13:                                         ; preds = %land.lhs.true8, %if.end
  call void @llvm.dbg.value(metadata i32 0, metadata !168, metadata !DIExpression()), !dbg !170
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc, %if.end13
  %s_or.0 = phi i32 [ 0, %if.end13 ], [ %s_or.1, %for.inc ], !dbg !141
  %s_add.0 = phi i32 [ 0, %if.end13 ], [ %s_add.1, %for.inc ], !dbg !141
  %a_or.0 = phi i32 [ 0, %if.end13 ], [ %a_or.1, %for.inc ], !dbg !141
  %a_add.0 = phi i32 [ 0, %if.end13 ], [ %a_add.1, %for.inc ], !dbg !141
  %d_or.0 = phi i32 [ 0, %if.end13 ], [ %d_or.1, %for.inc ], !dbg !141
  %d_add.0 = phi i32 [ 0, %if.end13 ], [ %d_add.1, %for.inc ], !dbg !141
  %m_or.0 = phi i32 [ 0, %if.end13 ], [ %m_or.1, %for.inc ], !dbg !141
  %m_add.0 = phi i32 [ 0, %if.end13 ], [ %m_add.1, %for.inc ], !dbg !141
  %c_or.0 = phi i32 [ 0, %if.end13 ], [ %c_or.1, %for.inc ], !dbg !141
  %c_add.0 = phi i32 [ 0, %if.end13 ], [ %c_add.1, %for.inc ], !dbg !141
  %i.0 = phi i32 [ 0, %if.end13 ], [ %inc, %for.inc ], !dbg !170
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !168, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.value(metadata i32 %c_add.0, metadata !142, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 %c_or.0, metadata !143, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 %m_add.0, metadata !144, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 %m_or.0, metadata !145, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 %d_add.0, metadata !146, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 %d_or.0, metadata !147, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 %a_add.0, metadata !148, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 %a_or.0, metadata !149, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 %s_add.0, metadata !150, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 %s_or.0, metadata !151, metadata !DIExpression()), !dbg !141
  %cmp14 = icmp slt i32 %i.0, 5, !dbg !172
  br i1 %cmp14, label %for.body, label %for.end, !dbg !174

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !175
  %arrayidx15 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom, !dbg !175
  %arrayidx16 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx15, i64 0, i64 0, !dbg !175
  %4 = load i32, i32* %arrayidx16, align 4, !dbg !175
  %cmp17 = icmp sge i32 %4, 0, !dbg !178
  br i1 %cmp17, label %if.then18, label %if.end26, !dbg !179, !cf.info !94

if.then18:                                        ; preds = %for.body
  %idxprom19 = sext i32 %i.0 to i64, !dbg !180
  %arrayidx20 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom19, !dbg !180
  %arrayidx21 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx20, i64 0, i64 0, !dbg !180
  %5 = load i32, i32* %arrayidx21, align 4, !dbg !180
  %shl = shl i32 1, %5, !dbg !182
  %add = add nsw i32 %c_add.0, %shl, !dbg !183
  call void @llvm.dbg.value(metadata i32 %add, metadata !142, metadata !DIExpression()), !dbg !141
  %idxprom22 = sext i32 %i.0 to i64, !dbg !184
  %arrayidx23 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom22, !dbg !184
  %arrayidx24 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx23, i64 0, i64 0, !dbg !184
  %6 = load i32, i32* %arrayidx24, align 4, !dbg !184
  %shl25 = shl i32 1, %6, !dbg !185
  %or = or i32 %c_or.0, %shl25, !dbg !186
  call void @llvm.dbg.value(metadata i32 %or, metadata !143, metadata !DIExpression()), !dbg !141
  br label %if.end26, !dbg !187

if.end26:                                         ; preds = %if.then18, %for.body
  %c_or.1 = phi i32 [ %or, %if.then18 ], [ %c_or.0, %for.body ], !dbg !141
  %c_add.1 = phi i32 [ %add, %if.then18 ], [ %c_add.0, %for.body ], !dbg !141
  call void @llvm.dbg.value(metadata i32 %c_add.1, metadata !142, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 %c_or.1, metadata !143, metadata !DIExpression()), !dbg !141
  %idxprom27 = sext i32 %i.0 to i64, !dbg !188
  %arrayidx28 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom27, !dbg !188
  %arrayidx29 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx28, i64 0, i64 1, !dbg !188
  %7 = load i32, i32* %arrayidx29, align 4, !dbg !188
  %cmp30 = icmp sge i32 %7, 0, !dbg !190
  br i1 %cmp30, label %if.then31, label %if.end42, !dbg !191, !cf.info !94

if.then31:                                        ; preds = %if.end26
  %idxprom32 = sext i32 %i.0 to i64, !dbg !192
  %arrayidx33 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom32, !dbg !192
  %arrayidx34 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx33, i64 0, i64 1, !dbg !192
  %8 = load i32, i32* %arrayidx34, align 4, !dbg !192
  %shl35 = shl i32 1, %8, !dbg !194
  %add36 = add nsw i32 %m_add.0, %shl35, !dbg !195
  call void @llvm.dbg.value(metadata i32 %add36, metadata !144, metadata !DIExpression()), !dbg !141
  %idxprom37 = sext i32 %i.0 to i64, !dbg !196
  %arrayidx38 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom37, !dbg !196
  %arrayidx39 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx38, i64 0, i64 1, !dbg !196
  %9 = load i32, i32* %arrayidx39, align 4, !dbg !196
  %shl40 = shl i32 1, %9, !dbg !197
  %or41 = or i32 %m_or.0, %shl40, !dbg !198
  call void @llvm.dbg.value(metadata i32 %or41, metadata !145, metadata !DIExpression()), !dbg !141
  br label %if.end42, !dbg !199

if.end42:                                         ; preds = %if.then31, %if.end26
  %m_or.1 = phi i32 [ %or41, %if.then31 ], [ %m_or.0, %if.end26 ], !dbg !141
  %m_add.1 = phi i32 [ %add36, %if.then31 ], [ %m_add.0, %if.end26 ], !dbg !141
  call void @llvm.dbg.value(metadata i32 %m_add.1, metadata !144, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 %m_or.1, metadata !145, metadata !DIExpression()), !dbg !141
  %idxprom43 = sext i32 %i.0 to i64, !dbg !200
  %arrayidx44 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom43, !dbg !200
  %arrayidx45 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx44, i64 0, i64 2, !dbg !200
  %10 = load i32, i32* %arrayidx45, align 4, !dbg !200
  %cmp46 = icmp sge i32 %10, 0, !dbg !202
  br i1 %cmp46, label %if.then47, label %if.end58, !dbg !203, !cf.info !94

if.then47:                                        ; preds = %if.end42
  %idxprom48 = sext i32 %i.0 to i64, !dbg !204
  %arrayidx49 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom48, !dbg !204
  %arrayidx50 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx49, i64 0, i64 2, !dbg !204
  %11 = load i32, i32* %arrayidx50, align 4, !dbg !204
  %shl51 = shl i32 1, %11, !dbg !206
  %add52 = add nsw i32 %d_add.0, %shl51, !dbg !207
  call void @llvm.dbg.value(metadata i32 %add52, metadata !146, metadata !DIExpression()), !dbg !141
  %idxprom53 = sext i32 %i.0 to i64, !dbg !208
  %arrayidx54 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom53, !dbg !208
  %arrayidx55 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx54, i64 0, i64 2, !dbg !208
  %12 = load i32, i32* %arrayidx55, align 4, !dbg !208
  %shl56 = shl i32 1, %12, !dbg !209
  %or57 = or i32 %d_or.0, %shl56, !dbg !210
  call void @llvm.dbg.value(metadata i32 %or57, metadata !147, metadata !DIExpression()), !dbg !141
  br label %if.end58, !dbg !211

if.end58:                                         ; preds = %if.then47, %if.end42
  %d_or.1 = phi i32 [ %or57, %if.then47 ], [ %d_or.0, %if.end42 ], !dbg !141
  %d_add.1 = phi i32 [ %add52, %if.then47 ], [ %d_add.0, %if.end42 ], !dbg !141
  call void @llvm.dbg.value(metadata i32 %d_add.1, metadata !146, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 %d_or.1, metadata !147, metadata !DIExpression()), !dbg !141
  %idxprom59 = sext i32 %i.0 to i64, !dbg !212
  %arrayidx60 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom59, !dbg !212
  %arrayidx61 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx60, i64 0, i64 3, !dbg !212
  %13 = load i32, i32* %arrayidx61, align 4, !dbg !212
  %cmp62 = icmp sge i32 %13, 0, !dbg !214
  br i1 %cmp62, label %if.then63, label %if.end74, !dbg !215, !cf.info !94

if.then63:                                        ; preds = %if.end58
  %idxprom64 = sext i32 %i.0 to i64, !dbg !216
  %arrayidx65 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom64, !dbg !216
  %arrayidx66 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx65, i64 0, i64 3, !dbg !216
  %14 = load i32, i32* %arrayidx66, align 4, !dbg !216
  %shl67 = shl i32 1, %14, !dbg !218
  %add68 = add nsw i32 %a_add.0, %shl67, !dbg !219
  call void @llvm.dbg.value(metadata i32 %add68, metadata !148, metadata !DIExpression()), !dbg !141
  %idxprom69 = sext i32 %i.0 to i64, !dbg !220
  %arrayidx70 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom69, !dbg !220
  %arrayidx71 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx70, i64 0, i64 3, !dbg !220
  %15 = load i32, i32* %arrayidx71, align 4, !dbg !220
  %shl72 = shl i32 1, %15, !dbg !221
  %or73 = or i32 %a_or.0, %shl72, !dbg !222
  call void @llvm.dbg.value(metadata i32 %or73, metadata !149, metadata !DIExpression()), !dbg !141
  br label %if.end74, !dbg !223

if.end74:                                         ; preds = %if.then63, %if.end58
  %a_or.1 = phi i32 [ %or73, %if.then63 ], [ %a_or.0, %if.end58 ], !dbg !141
  %a_add.1 = phi i32 [ %add68, %if.then63 ], [ %a_add.0, %if.end58 ], !dbg !141
  call void @llvm.dbg.value(metadata i32 %a_add.1, metadata !148, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 %a_or.1, metadata !149, metadata !DIExpression()), !dbg !141
  %idxprom75 = sext i32 %i.0 to i64, !dbg !224
  %arrayidx76 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom75, !dbg !224
  %arrayidx77 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx76, i64 0, i64 4, !dbg !224
  %16 = load i32, i32* %arrayidx77, align 4, !dbg !224
  %cmp78 = icmp sge i32 %16, 0, !dbg !226
  br i1 %cmp78, label %if.then79, label %if.end90, !dbg !227, !cf.info !94

if.then79:                                        ; preds = %if.end74
  %idxprom80 = sext i32 %i.0 to i64, !dbg !228
  %arrayidx81 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom80, !dbg !228
  %arrayidx82 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx81, i64 0, i64 4, !dbg !228
  %17 = load i32, i32* %arrayidx82, align 4, !dbg !228
  %shl83 = shl i32 1, %17, !dbg !230
  %add84 = add nsw i32 %s_add.0, %shl83, !dbg !231
  call void @llvm.dbg.value(metadata i32 %add84, metadata !150, metadata !DIExpression()), !dbg !141
  %idxprom85 = sext i32 %i.0 to i64, !dbg !232
  %arrayidx86 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom85, !dbg !232
  %arrayidx87 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx86, i64 0, i64 4, !dbg !232
  %18 = load i32, i32* %arrayidx87, align 4, !dbg !232
  %shl88 = shl i32 1, %18, !dbg !233
  %or89 = or i32 %s_or.0, %shl88, !dbg !234
  call void @llvm.dbg.value(metadata i32 %or89, metadata !151, metadata !DIExpression()), !dbg !141
  br label %if.end90, !dbg !235

if.end90:                                         ; preds = %if.then79, %if.end74
  %s_or.1 = phi i32 [ %or89, %if.then79 ], [ %s_or.0, %if.end74 ], !dbg !141
  %s_add.1 = phi i32 [ %add84, %if.then79 ], [ %s_add.0, %if.end74 ], !dbg !141
  call void @llvm.dbg.value(metadata i32 %s_add.1, metadata !150, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i32 %s_or.1, metadata !151, metadata !DIExpression()), !dbg !141
  %idxprom91 = sext i32 %i.0 to i64, !dbg !236
  %arrayidx92 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom91, !dbg !236
  %arrayidx93 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx92, i64 0, i64 1, !dbg !236
  %19 = load i32, i32* %arrayidx93, align 4, !dbg !236
  %cmp94 = icmp sge i32 %19, 0, !dbg !238
  br i1 %cmp94, label %land.lhs.true95, label %if.end120, !dbg !239, !cf.info !94

land.lhs.true95:                                  ; preds = %if.end90
  %idxprom96 = sext i32 %i.0 to i64, !dbg !240
  %arrayidx97 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom96, !dbg !240
  %arrayidx98 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx97, i64 0, i64 0, !dbg !240
  %20 = load i32, i32* %arrayidx98, align 4, !dbg !240
  %cmp99 = icmp sge i32 %20, 0, !dbg !241
  br i1 %cmp99, label %land.lhs.true100, label %if.end120, !dbg !242, !cf.info !94

land.lhs.true100:                                 ; preds = %land.lhs.true95
  %idxprom101 = sext i32 %i.0 to i64, !dbg !243
  %arrayidx102 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom101, !dbg !243
  %arrayidx103 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx102, i64 0, i64 1, !dbg !243
  %21 = load i32, i32* %arrayidx103, align 4, !dbg !243
  %cmp104 = icmp eq i32 %21, 0, !dbg !244
  br i1 %cmp104, label %land.lhs.true105, label %lor.lhs.false, !dbg !245, !cf.info !94

land.lhs.true105:                                 ; preds = %land.lhs.true100
  %idxprom106 = sext i32 %i.0 to i64, !dbg !246
  %arrayidx107 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom106, !dbg !246
  %arrayidx108 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx107, i64 0, i64 0, !dbg !246
  %22 = load i32, i32* %arrayidx108, align 4, !dbg !246
  %cmp109 = icmp ne i32 %22, 0, !dbg !247
  br i1 %cmp109, label %if.then119, label %lor.lhs.false, !dbg !248, !cf.info !94

lor.lhs.false:                                    ; preds = %land.lhs.true105, %land.lhs.true100
  %idxprom110 = sext i32 %i.0 to i64, !dbg !249
  %arrayidx111 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom110, !dbg !249
  %arrayidx112 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx111, i64 0, i64 1, !dbg !249
  %23 = load i32, i32* %arrayidx112, align 4, !dbg !249
  %cmp113 = icmp ne i32 %23, 0, !dbg !250
  br i1 %cmp113, label %land.lhs.true114, label %if.end120, !dbg !251, !cf.info !94

land.lhs.true114:                                 ; preds = %lor.lhs.false
  %idxprom115 = sext i32 %i.0 to i64, !dbg !252
  %arrayidx116 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom115, !dbg !252
  %arrayidx117 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx116, i64 0, i64 0, !dbg !252
  %24 = load i32, i32* %arrayidx117, align 4, !dbg !252
  %cmp118 = icmp eq i32 %24, 0, !dbg !253
  br i1 %cmp118, label %if.then119, label %if.end120, !dbg !254, !cf.info !94

if.then119:                                       ; preds = %land.lhs.true114, %land.lhs.true105
  br label %return, !dbg !255

if.end120:                                        ; preds = %land.lhs.true114, %lor.lhs.false, %land.lhs.true95, %if.end90
  %idxprom121 = sext i32 %i.0 to i64, !dbg !256
  %arrayidx122 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom121, !dbg !256
  %arrayidx123 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx122, i64 0, i64 1, !dbg !256
  %25 = load i32, i32* %arrayidx123, align 4, !dbg !256
  %cmp124 = icmp sge i32 %25, 0, !dbg !258
  br i1 %cmp124, label %land.lhs.true125, label %if.end151, !dbg !259, !cf.info !94

land.lhs.true125:                                 ; preds = %if.end120
  %idxprom126 = sext i32 %i.0 to i64, !dbg !260
  %arrayidx127 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom126, !dbg !260
  %arrayidx128 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx127, i64 0, i64 3, !dbg !260
  %26 = load i32, i32* %arrayidx128, align 4, !dbg !260
  %cmp129 = icmp sge i32 %26, 0, !dbg !261
  br i1 %cmp129, label %land.lhs.true130, label %if.end151, !dbg !262, !cf.info !94

land.lhs.true130:                                 ; preds = %land.lhs.true125
  %idxprom131 = sext i32 %i.0 to i64, !dbg !263
  %arrayidx132 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom131, !dbg !263
  %arrayidx133 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx132, i64 0, i64 1, !dbg !263
  %27 = load i32, i32* %arrayidx133, align 4, !dbg !263
  %cmp134 = icmp eq i32 %27, 1, !dbg !264
  br i1 %cmp134, label %land.lhs.true135, label %lor.lhs.false140, !dbg !265, !cf.info !94

land.lhs.true135:                                 ; preds = %land.lhs.true130
  %idxprom136 = sext i32 %i.0 to i64, !dbg !266
  %arrayidx137 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom136, !dbg !266
  %arrayidx138 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx137, i64 0, i64 3, !dbg !266
  %28 = load i32, i32* %arrayidx138, align 4, !dbg !266
  %cmp139 = icmp ne i32 %28, 0, !dbg !267
  br i1 %cmp139, label %if.then150, label %lor.lhs.false140, !dbg !268, !cf.info !94

lor.lhs.false140:                                 ; preds = %land.lhs.true135, %land.lhs.true130
  %idxprom141 = sext i32 %i.0 to i64, !dbg !269
  %arrayidx142 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom141, !dbg !269
  %arrayidx143 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx142, i64 0, i64 1, !dbg !269
  %29 = load i32, i32* %arrayidx143, align 4, !dbg !269
  %cmp144 = icmp ne i32 %29, 1, !dbg !270
  br i1 %cmp144, label %land.lhs.true145, label %if.end151, !dbg !271, !cf.info !94

land.lhs.true145:                                 ; preds = %lor.lhs.false140
  %idxprom146 = sext i32 %i.0 to i64, !dbg !272
  %arrayidx147 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom146, !dbg !272
  %arrayidx148 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx147, i64 0, i64 3, !dbg !272
  %30 = load i32, i32* %arrayidx148, align 4, !dbg !272
  %cmp149 = icmp eq i32 %30, 0, !dbg !273
  br i1 %cmp149, label %if.then150, label %if.end151, !dbg !274, !cf.info !94

if.then150:                                       ; preds = %land.lhs.true145, %land.lhs.true135
  br label %return, !dbg !275

if.end151:                                        ; preds = %land.lhs.true145, %lor.lhs.false140, %land.lhs.true125, %if.end120
  %idxprom152 = sext i32 %i.0 to i64, !dbg !276
  %arrayidx153 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom152, !dbg !276
  %arrayidx154 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx153, i64 0, i64 1, !dbg !276
  %31 = load i32, i32* %arrayidx154, align 4, !dbg !276
  %cmp155 = icmp sge i32 %31, 0, !dbg !278
  br i1 %cmp155, label %land.lhs.true156, label %if.end182, !dbg !279, !cf.info !94

land.lhs.true156:                                 ; preds = %if.end151
  %idxprom157 = sext i32 %i.0 to i64, !dbg !280
  %arrayidx158 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom157, !dbg !280
  %arrayidx159 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx158, i64 0, i64 2, !dbg !280
  %32 = load i32, i32* %arrayidx159, align 4, !dbg !280
  %cmp160 = icmp sge i32 %32, 0, !dbg !281
  br i1 %cmp160, label %land.lhs.true161, label %if.end182, !dbg !282, !cf.info !94

land.lhs.true161:                                 ; preds = %land.lhs.true156
  %idxprom162 = sext i32 %i.0 to i64, !dbg !283
  %arrayidx163 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom162, !dbg !283
  %arrayidx164 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx163, i64 0, i64 1, !dbg !283
  %33 = load i32, i32* %arrayidx164, align 4, !dbg !283
  %cmp165 = icmp eq i32 %33, 2, !dbg !284
  br i1 %cmp165, label %land.lhs.true166, label %lor.lhs.false171, !dbg !285, !cf.info !94

land.lhs.true166:                                 ; preds = %land.lhs.true161
  %idxprom167 = sext i32 %i.0 to i64, !dbg !286
  %arrayidx168 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom167, !dbg !286
  %arrayidx169 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx168, i64 0, i64 2, !dbg !286
  %34 = load i32, i32* %arrayidx169, align 4, !dbg !286
  %cmp170 = icmp ne i32 %34, 0, !dbg !287
  br i1 %cmp170, label %if.then181, label %lor.lhs.false171, !dbg !288, !cf.info !94

lor.lhs.false171:                                 ; preds = %land.lhs.true166, %land.lhs.true161
  %idxprom172 = sext i32 %i.0 to i64, !dbg !289
  %arrayidx173 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom172, !dbg !289
  %arrayidx174 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx173, i64 0, i64 1, !dbg !289
  %35 = load i32, i32* %arrayidx174, align 4, !dbg !289
  %cmp175 = icmp ne i32 %35, 2, !dbg !290
  br i1 %cmp175, label %land.lhs.true176, label %if.end182, !dbg !291, !cf.info !94

land.lhs.true176:                                 ; preds = %lor.lhs.false171
  %idxprom177 = sext i32 %i.0 to i64, !dbg !292
  %arrayidx178 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom177, !dbg !292
  %arrayidx179 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx178, i64 0, i64 2, !dbg !292
  %36 = load i32, i32* %arrayidx179, align 4, !dbg !292
  %cmp180 = icmp eq i32 %36, 0, !dbg !293
  br i1 %cmp180, label %if.then181, label %if.end182, !dbg !294, !cf.info !94

if.then181:                                       ; preds = %land.lhs.true176, %land.lhs.true166
  br label %return, !dbg !295

if.end182:                                        ; preds = %land.lhs.true176, %lor.lhs.false171, %land.lhs.true156, %if.end151
  %cmp183 = icmp sgt i32 %i.0, 0, !dbg !296
  br i1 %cmp183, label %land.lhs.true184, label %if.end211, !dbg !298, !cf.info !94

land.lhs.true184:                                 ; preds = %if.end182
  %idxprom185 = sext i32 %i.0 to i64, !dbg !299
  %arrayidx186 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom185, !dbg !299
  %arrayidx187 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx186, i64 0, i64 0, !dbg !299
  %37 = load i32, i32* %arrayidx187, align 4, !dbg !299
  %cmp188 = icmp sge i32 %37, 0, !dbg !300
  br i1 %cmp188, label %land.lhs.true189, label %if.end211, !dbg !301, !cf.info !94

land.lhs.true189:                                 ; preds = %land.lhs.true184
  %sub = sub nsw i32 %i.0, 1, !dbg !302
  %idxprom190 = sext i32 %sub to i64, !dbg !303
  %arrayidx191 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom190, !dbg !303
  %arrayidx192 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx191, i64 0, i64 0, !dbg !303
  %38 = load i32, i32* %arrayidx192, align 4, !dbg !303
  %cmp193 = icmp eq i32 %38, 1, !dbg !304
  br i1 %cmp193, label %land.lhs.true194, label %lor.lhs.false199, !dbg !305, !cf.info !94

land.lhs.true194:                                 ; preds = %land.lhs.true189
  %idxprom195 = sext i32 %i.0 to i64, !dbg !306
  %arrayidx196 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom195, !dbg !306
  %arrayidx197 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx196, i64 0, i64 0, !dbg !306
  %39 = load i32, i32* %arrayidx197, align 4, !dbg !306
  %cmp198 = icmp ne i32 %39, 2, !dbg !307
  br i1 %cmp198, label %if.then210, label %lor.lhs.false199, !dbg !308, !cf.info !94

lor.lhs.false199:                                 ; preds = %land.lhs.true194, %land.lhs.true189
  %sub200 = sub nsw i32 %i.0, 1, !dbg !309
  %idxprom201 = sext i32 %sub200 to i64, !dbg !310
  %arrayidx202 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom201, !dbg !310
  %arrayidx203 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx202, i64 0, i64 0, !dbg !310
  %40 = load i32, i32* %arrayidx203, align 4, !dbg !310
  %cmp204 = icmp ne i32 %40, 1, !dbg !311
  br i1 %cmp204, label %land.lhs.true205, label %if.end211, !dbg !312, !cf.info !94

land.lhs.true205:                                 ; preds = %lor.lhs.false199
  %idxprom206 = sext i32 %i.0 to i64, !dbg !313
  %arrayidx207 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom206, !dbg !313
  %arrayidx208 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx207, i64 0, i64 0, !dbg !313
  %41 = load i32, i32* %arrayidx208, align 4, !dbg !313
  %cmp209 = icmp eq i32 %41, 2, !dbg !314
  br i1 %cmp209, label %if.then210, label %if.end211, !dbg !315, !cf.info !94

if.then210:                                       ; preds = %land.lhs.true205, %land.lhs.true194
  br label %return, !dbg !316

if.end211:                                        ; preds = %land.lhs.true205, %lor.lhs.false199, %land.lhs.true184, %if.end182
  %idxprom212 = sext i32 %i.0 to i64, !dbg !317
  %arrayidx213 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom212, !dbg !317
  %arrayidx214 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx213, i64 0, i64 0, !dbg !317
  %42 = load i32, i32* %arrayidx214, align 4, !dbg !317
  %cmp215 = icmp sge i32 %42, 0, !dbg !319
  br i1 %cmp215, label %land.lhs.true216, label %if.end242, !dbg !320, !cf.info !94

land.lhs.true216:                                 ; preds = %if.end211
  %idxprom217 = sext i32 %i.0 to i64, !dbg !321
  %arrayidx218 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom217, !dbg !321
  %arrayidx219 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx218, i64 0, i64 2, !dbg !321
  %43 = load i32, i32* %arrayidx219, align 4, !dbg !321
  %cmp220 = icmp sge i32 %43, 0, !dbg !322
  br i1 %cmp220, label %land.lhs.true221, label %if.end242, !dbg !323, !cf.info !94

land.lhs.true221:                                 ; preds = %land.lhs.true216
  %idxprom222 = sext i32 %i.0 to i64, !dbg !324
  %arrayidx223 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom222, !dbg !324
  %arrayidx224 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx223, i64 0, i64 0, !dbg !324
  %44 = load i32, i32* %arrayidx224, align 4, !dbg !324
  %cmp225 = icmp eq i32 %44, 1, !dbg !325
  br i1 %cmp225, label %land.lhs.true226, label %lor.lhs.false231, !dbg !326, !cf.info !94

land.lhs.true226:                                 ; preds = %land.lhs.true221
  %idxprom227 = sext i32 %i.0 to i64, !dbg !327
  %arrayidx228 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom227, !dbg !327
  %arrayidx229 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx228, i64 0, i64 2, !dbg !327
  %45 = load i32, i32* %arrayidx229, align 4, !dbg !327
  %cmp230 = icmp ne i32 %45, 1, !dbg !328
  br i1 %cmp230, label %if.then241, label %lor.lhs.false231, !dbg !329, !cf.info !94

lor.lhs.false231:                                 ; preds = %land.lhs.true226, %land.lhs.true221
  %idxprom232 = sext i32 %i.0 to i64, !dbg !330
  %arrayidx233 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom232, !dbg !330
  %arrayidx234 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx233, i64 0, i64 0, !dbg !330
  %46 = load i32, i32* %arrayidx234, align 4, !dbg !330
  %cmp235 = icmp ne i32 %46, 1, !dbg !331
  br i1 %cmp235, label %land.lhs.true236, label %if.end242, !dbg !332, !cf.info !94

land.lhs.true236:                                 ; preds = %lor.lhs.false231
  %idxprom237 = sext i32 %i.0 to i64, !dbg !333
  %arrayidx238 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom237, !dbg !333
  %arrayidx239 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx238, i64 0, i64 2, !dbg !333
  %47 = load i32, i32* %arrayidx239, align 4, !dbg !333
  %cmp240 = icmp eq i32 %47, 1, !dbg !334
  br i1 %cmp240, label %if.then241, label %if.end242, !dbg !335, !cf.info !94

if.then241:                                       ; preds = %land.lhs.true236, %land.lhs.true226
  br label %return, !dbg !336

if.end242:                                        ; preds = %land.lhs.true236, %lor.lhs.false231, %land.lhs.true216, %if.end211
  %idxprom243 = sext i32 %i.0 to i64, !dbg !337
  %arrayidx244 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom243, !dbg !337
  %arrayidx245 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx244, i64 0, i64 4, !dbg !337
  %48 = load i32, i32* %arrayidx245, align 4, !dbg !337
  %cmp246 = icmp sge i32 %48, 0, !dbg !339
  br i1 %cmp246, label %land.lhs.true247, label %if.end273, !dbg !340, !cf.info !94

land.lhs.true247:                                 ; preds = %if.end242
  %idxprom248 = sext i32 %i.0 to i64, !dbg !341
  %arrayidx249 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom248, !dbg !341
  %arrayidx250 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx249, i64 0, i64 3, !dbg !341
  %49 = load i32, i32* %arrayidx250, align 4, !dbg !341
  %cmp251 = icmp sge i32 %49, 0, !dbg !342
  br i1 %cmp251, label %land.lhs.true252, label %if.end273, !dbg !343, !cf.info !94

land.lhs.true252:                                 ; preds = %land.lhs.true247
  %idxprom253 = sext i32 %i.0 to i64, !dbg !344
  %arrayidx254 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom253, !dbg !344
  %arrayidx255 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx254, i64 0, i64 4, !dbg !344
  %50 = load i32, i32* %arrayidx255, align 4, !dbg !344
  %cmp256 = icmp eq i32 %50, 0, !dbg !345
  br i1 %cmp256, label %land.lhs.true257, label %lor.lhs.false262, !dbg !346, !cf.info !94

land.lhs.true257:                                 ; preds = %land.lhs.true252
  %idxprom258 = sext i32 %i.0 to i64, !dbg !347
  %arrayidx259 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom258, !dbg !347
  %arrayidx260 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx259, i64 0, i64 3, !dbg !347
  %51 = load i32, i32* %arrayidx260, align 4, !dbg !347
  %cmp261 = icmp ne i32 %51, 1, !dbg !348
  br i1 %cmp261, label %if.then272, label %lor.lhs.false262, !dbg !349, !cf.info !94

lor.lhs.false262:                                 ; preds = %land.lhs.true257, %land.lhs.true252
  %idxprom263 = sext i32 %i.0 to i64, !dbg !350
  %arrayidx264 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom263, !dbg !350
  %arrayidx265 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx264, i64 0, i64 4, !dbg !350
  %52 = load i32, i32* %arrayidx265, align 4, !dbg !350
  %cmp266 = icmp ne i32 %52, 0, !dbg !351
  br i1 %cmp266, label %land.lhs.true267, label %if.end273, !dbg !352, !cf.info !94

land.lhs.true267:                                 ; preds = %lor.lhs.false262
  %idxprom268 = sext i32 %i.0 to i64, !dbg !353
  %arrayidx269 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom268, !dbg !353
  %arrayidx270 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx269, i64 0, i64 3, !dbg !353
  %53 = load i32, i32* %arrayidx270, align 4, !dbg !353
  %cmp271 = icmp eq i32 %53, 1, !dbg !354
  br i1 %cmp271, label %if.then272, label %if.end273, !dbg !355, !cf.info !94

if.then272:                                       ; preds = %land.lhs.true267, %land.lhs.true257
  br label %return, !dbg !356

if.end273:                                        ; preds = %land.lhs.true267, %lor.lhs.false262, %land.lhs.true247, %if.end242
  %idxprom274 = sext i32 %i.0 to i64, !dbg !357
  %arrayidx275 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom274, !dbg !357
  %arrayidx276 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx275, i64 0, i64 4, !dbg !357
  %54 = load i32, i32* %arrayidx276, align 4, !dbg !357
  %cmp277 = icmp sge i32 %54, 0, !dbg !359
  br i1 %cmp277, label %land.lhs.true278, label %if.end304, !dbg !360, !cf.info !94

land.lhs.true278:                                 ; preds = %if.end273
  %idxprom279 = sext i32 %i.0 to i64, !dbg !361
  %arrayidx280 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom279, !dbg !361
  %arrayidx281 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx280, i64 0, i64 0, !dbg !361
  %55 = load i32, i32* %arrayidx281, align 4, !dbg !361
  %cmp282 = icmp sge i32 %55, 0, !dbg !362
  br i1 %cmp282, label %land.lhs.true283, label %if.end304, !dbg !363, !cf.info !94

land.lhs.true283:                                 ; preds = %land.lhs.true278
  %idxprom284 = sext i32 %i.0 to i64, !dbg !364
  %arrayidx285 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom284, !dbg !364
  %arrayidx286 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx285, i64 0, i64 4, !dbg !364
  %56 = load i32, i32* %arrayidx286, align 4, !dbg !364
  %cmp287 = icmp eq i32 %56, 1, !dbg !365
  br i1 %cmp287, label %land.lhs.true288, label %lor.lhs.false293, !dbg !366, !cf.info !94

land.lhs.true288:                                 ; preds = %land.lhs.true283
  %idxprom289 = sext i32 %i.0 to i64, !dbg !367
  %arrayidx290 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom289, !dbg !367
  %arrayidx291 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx290, i64 0, i64 0, !dbg !367
  %57 = load i32, i32* %arrayidx291, align 4, !dbg !367
  %cmp292 = icmp ne i32 %57, 3, !dbg !368
  br i1 %cmp292, label %if.then303, label %lor.lhs.false293, !dbg !369, !cf.info !94

lor.lhs.false293:                                 ; preds = %land.lhs.true288, %land.lhs.true283
  %idxprom294 = sext i32 %i.0 to i64, !dbg !370
  %arrayidx295 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom294, !dbg !370
  %arrayidx296 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx295, i64 0, i64 4, !dbg !370
  %58 = load i32, i32* %arrayidx296, align 4, !dbg !370
  %cmp297 = icmp ne i32 %58, 1, !dbg !371
  br i1 %cmp297, label %land.lhs.true298, label %if.end304, !dbg !372, !cf.info !94

land.lhs.true298:                                 ; preds = %lor.lhs.false293
  %idxprom299 = sext i32 %i.0 to i64, !dbg !373
  %arrayidx300 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom299, !dbg !373
  %arrayidx301 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx300, i64 0, i64 0, !dbg !373
  %59 = load i32, i32* %arrayidx301, align 4, !dbg !373
  %cmp302 = icmp eq i32 %59, 3, !dbg !374
  br i1 %cmp302, label %if.then303, label %if.end304, !dbg !375, !cf.info !94

if.then303:                                       ; preds = %land.lhs.true298, %land.lhs.true288
  br label %return, !dbg !376

if.end304:                                        ; preds = %land.lhs.true298, %lor.lhs.false293, %land.lhs.true278, %if.end273
  %idxprom305 = sext i32 %i.0 to i64, !dbg !377
  %arrayidx306 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom305, !dbg !377
  %arrayidx307 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx306, i64 0, i64 4, !dbg !377
  %60 = load i32, i32* %arrayidx307, align 4, !dbg !377
  %cmp308 = icmp eq i32 %60, 2, !dbg !379
  br i1 %cmp308, label %if.then309, label %if.end354, !dbg !380, !cf.info !94

if.then309:                                       ; preds = %if.end304
  %cmp310 = icmp eq i32 %i.0, 0, !dbg !381
  br i1 %cmp310, label %land.lhs.true311, label %if.else, !dbg !384, !cf.info !94

land.lhs.true311:                                 ; preds = %if.then309
  %add312 = add nsw i32 %i.0, 1, !dbg !385
  %idxprom313 = sext i32 %add312 to i64, !dbg !386
  %arrayidx314 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom313, !dbg !386
  %arrayidx315 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx314, i64 0, i64 3, !dbg !386
  %61 = load i32, i32* %arrayidx315, align 4, !dbg !386
  %cmp316 = icmp sge i32 %61, 0, !dbg !387
  br i1 %cmp316, label %land.lhs.true317, label %if.else, !dbg !388, !cf.info !94

land.lhs.true317:                                 ; preds = %land.lhs.true311
  %add318 = add nsw i32 %i.0, 1, !dbg !389
  %idxprom319 = sext i32 %add318 to i64, !dbg !390
  %arrayidx320 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom319, !dbg !390
  %arrayidx321 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx320, i64 0, i64 3, !dbg !390
  %62 = load i32, i32* %arrayidx321, align 4, !dbg !390
  %cmp322 = icmp ne i32 %62, 2, !dbg !391
  br i1 %cmp322, label %if.then323, label %if.else, !dbg !392, !cf.info !94

if.then323:                                       ; preds = %land.lhs.true317
  br label %return, !dbg !393

if.else:                                          ; preds = %land.lhs.true317, %land.lhs.true311, %if.then309
  %cmp324 = icmp eq i32 %i.0, 4, !dbg !394
  br i1 %cmp324, label %land.lhs.true325, label %if.else332, !dbg !396, !cf.info !94

land.lhs.true325:                                 ; preds = %if.else
  %sub326 = sub nsw i32 %i.0, 1, !dbg !397
  %idxprom327 = sext i32 %sub326 to i64, !dbg !398
  %arrayidx328 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom327, !dbg !398
  %arrayidx329 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx328, i64 0, i64 3, !dbg !398
  %63 = load i32, i32* %arrayidx329, align 4, !dbg !398
  %cmp330 = icmp ne i32 %63, 2, !dbg !399
  br i1 %cmp330, label %if.then331, label %if.else332, !dbg !400, !cf.info !94

if.then331:                                       ; preds = %land.lhs.true325
  br label %return, !dbg !401

if.else332:                                       ; preds = %land.lhs.true325, %if.else
  %add333 = add nsw i32 %i.0, 1, !dbg !402
  %idxprom334 = sext i32 %add333 to i64, !dbg !404
  %arrayidx335 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom334, !dbg !404
  %arrayidx336 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx335, i64 0, i64 3, !dbg !404
  %64 = load i32, i32* %arrayidx336, align 4, !dbg !404
  %cmp337 = icmp sge i32 %64, 0, !dbg !405
  br i1 %cmp337, label %land.lhs.true338, label %if.end351, !dbg !406, !cf.info !94

land.lhs.true338:                                 ; preds = %if.else332
  %add339 = add nsw i32 %i.0, 1, !dbg !407
  %idxprom340 = sext i32 %add339 to i64, !dbg !408
  %arrayidx341 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom340, !dbg !408
  %arrayidx342 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx341, i64 0, i64 3, !dbg !408
  %65 = load i32, i32* %arrayidx342, align 4, !dbg !408
  %cmp343 = icmp ne i32 %65, 2, !dbg !409
  br i1 %cmp343, label %land.lhs.true344, label %if.end351, !dbg !410, !cf.info !94

land.lhs.true344:                                 ; preds = %land.lhs.true338
  %sub345 = sub nsw i32 %i.0, 1, !dbg !411
  %idxprom346 = sext i32 %sub345 to i64, !dbg !412
  %arrayidx347 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom346, !dbg !412
  %arrayidx348 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx347, i64 0, i64 3, !dbg !412
  %66 = load i32, i32* %arrayidx348, align 4, !dbg !412
  %cmp349 = icmp ne i32 %66, 2, !dbg !413
  br i1 %cmp349, label %if.then350, label %if.end351, !dbg !414, !cf.info !94

if.then350:                                       ; preds = %land.lhs.true344
  br label %return, !dbg !415

if.end351:                                        ; preds = %land.lhs.true344, %land.lhs.true338, %if.else332
  br label %if.end352

if.end352:                                        ; preds = %if.end351
  br label %if.end353

if.end353:                                        ; preds = %if.end352
  br label %if.end354, !dbg !416

if.end354:                                        ; preds = %if.end353, %if.end304
  %idxprom355 = sext i32 %i.0 to i64, !dbg !417
  %arrayidx356 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom355, !dbg !417
  %arrayidx357 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx356, i64 0, i64 4, !dbg !417
  %67 = load i32, i32* %arrayidx357, align 4, !dbg !417
  %cmp358 = icmp eq i32 %67, 1, !dbg !419
  br i1 %cmp358, label %if.then359, label %if.end405, !dbg !420, !cf.info !94

if.then359:                                       ; preds = %if.end354
  %cmp360 = icmp eq i32 %i.0, 0, !dbg !421
  br i1 %cmp360, label %land.lhs.true361, label %if.else374, !dbg !424, !cf.info !94

land.lhs.true361:                                 ; preds = %if.then359
  %add362 = add nsw i32 %i.0, 1, !dbg !425
  %idxprom363 = sext i32 %add362 to i64, !dbg !426
  %arrayidx364 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom363, !dbg !426
  %arrayidx365 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx364, i64 0, i64 3, !dbg !426
  %68 = load i32, i32* %arrayidx365, align 4, !dbg !426
  %cmp366 = icmp sge i32 %68, 0, !dbg !427
  br i1 %cmp366, label %land.lhs.true367, label %if.else374, !dbg !428, !cf.info !94

land.lhs.true367:                                 ; preds = %land.lhs.true361
  %add368 = add nsw i32 %i.0, 1, !dbg !429
  %idxprom369 = sext i32 %add368 to i64, !dbg !430
  %arrayidx370 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom369, !dbg !430
  %arrayidx371 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx370, i64 0, i64 3, !dbg !430
  %69 = load i32, i32* %arrayidx371, align 4, !dbg !430
  %cmp372 = icmp ne i32 %69, 3, !dbg !431
  br i1 %cmp372, label %if.then373, label %if.else374, !dbg !432, !cf.info !94

if.then373:                                       ; preds = %land.lhs.true367
  br label %return, !dbg !433

if.else374:                                       ; preds = %land.lhs.true367, %land.lhs.true361, %if.then359
  %cmp375 = icmp eq i32 %i.0, 4, !dbg !434
  br i1 %cmp375, label %land.lhs.true376, label %if.else383, !dbg !436, !cf.info !94

land.lhs.true376:                                 ; preds = %if.else374
  %sub377 = sub nsw i32 %i.0, 1, !dbg !437
  %idxprom378 = sext i32 %sub377 to i64, !dbg !438
  %arrayidx379 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom378, !dbg !438
  %arrayidx380 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx379, i64 0, i64 3, !dbg !438
  %70 = load i32, i32* %arrayidx380, align 4, !dbg !438
  %cmp381 = icmp ne i32 %70, 3, !dbg !439
  br i1 %cmp381, label %if.then382, label %if.else383, !dbg !440, !cf.info !94

if.then382:                                       ; preds = %land.lhs.true376
  br label %return, !dbg !441

if.else383:                                       ; preds = %land.lhs.true376, %if.else374
  %add384 = add nsw i32 %i.0, 1, !dbg !442
  %idxprom385 = sext i32 %add384 to i64, !dbg !444
  %arrayidx386 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom385, !dbg !444
  %arrayidx387 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx386, i64 0, i64 3, !dbg !444
  %71 = load i32, i32* %arrayidx387, align 4, !dbg !444
  %cmp388 = icmp sge i32 %71, 0, !dbg !445
  br i1 %cmp388, label %land.lhs.true389, label %if.end402, !dbg !446, !cf.info !94

land.lhs.true389:                                 ; preds = %if.else383
  %add390 = add nsw i32 %i.0, 1, !dbg !447
  %idxprom391 = sext i32 %add390 to i64, !dbg !448
  %arrayidx392 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom391, !dbg !448
  %arrayidx393 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx392, i64 0, i64 3, !dbg !448
  %72 = load i32, i32* %arrayidx393, align 4, !dbg !448
  %cmp394 = icmp ne i32 %72, 3, !dbg !449
  br i1 %cmp394, label %land.lhs.true395, label %if.end402, !dbg !450, !cf.info !94

land.lhs.true395:                                 ; preds = %land.lhs.true389
  %sub396 = sub nsw i32 %i.0, 1, !dbg !451
  %idxprom397 = sext i32 %sub396 to i64, !dbg !452
  %arrayidx398 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom397, !dbg !452
  %arrayidx399 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx398, i64 0, i64 3, !dbg !452
  %73 = load i32, i32* %arrayidx399, align 4, !dbg !452
  %cmp400 = icmp ne i32 %73, 3, !dbg !453
  br i1 %cmp400, label %if.then401, label %if.end402, !dbg !454, !cf.info !94

if.then401:                                       ; preds = %land.lhs.true395
  br label %return, !dbg !455

if.end402:                                        ; preds = %land.lhs.true395, %land.lhs.true389, %if.else383
  br label %if.end403

if.end403:                                        ; preds = %if.end402
  br label %if.end404

if.end404:                                        ; preds = %if.end403
  br label %if.end405, !dbg !456

if.end405:                                        ; preds = %if.end404, %if.end354
  %idxprom406 = sext i32 %i.0 to i64, !dbg !457
  %arrayidx407 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom406, !dbg !457
  %arrayidx408 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx407, i64 0, i64 4, !dbg !457
  %74 = load i32, i32* %arrayidx408, align 4, !dbg !457
  %cmp409 = icmp sge i32 %74, 0, !dbg !459
  br i1 %cmp409, label %land.lhs.true410, label %if.end436, !dbg !460, !cf.info !94

land.lhs.true410:                                 ; preds = %if.end405
  %idxprom411 = sext i32 %i.0 to i64, !dbg !461
  %arrayidx412 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom411, !dbg !461
  %arrayidx413 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx412, i64 0, i64 2, !dbg !461
  %75 = load i32, i32* %arrayidx413, align 4, !dbg !461
  %cmp414 = icmp sge i32 %75, 0, !dbg !462
  br i1 %cmp414, label %land.lhs.true415, label %if.end436, !dbg !463, !cf.info !94

land.lhs.true415:                                 ; preds = %land.lhs.true410
  %idxprom416 = sext i32 %i.0 to i64, !dbg !464
  %arrayidx417 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom416, !dbg !464
  %arrayidx418 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx417, i64 0, i64 4, !dbg !464
  %76 = load i32, i32* %arrayidx418, align 4, !dbg !464
  %cmp419 = icmp eq i32 %76, 3, !dbg !465
  br i1 %cmp419, label %land.lhs.true420, label %lor.lhs.false425, !dbg !466, !cf.info !94

land.lhs.true420:                                 ; preds = %land.lhs.true415
  %idxprom421 = sext i32 %i.0 to i64, !dbg !467
  %arrayidx422 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom421, !dbg !467
  %arrayidx423 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx422, i64 0, i64 2, !dbg !467
  %77 = load i32, i32* %arrayidx423, align 4, !dbg !467
  %cmp424 = icmp ne i32 %77, 3, !dbg !468
  br i1 %cmp424, label %if.then435, label %lor.lhs.false425, !dbg !469, !cf.info !94

lor.lhs.false425:                                 ; preds = %land.lhs.true420, %land.lhs.true415
  %idxprom426 = sext i32 %i.0 to i64, !dbg !470
  %arrayidx427 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom426, !dbg !470
  %arrayidx428 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx427, i64 0, i64 4, !dbg !470
  %78 = load i32, i32* %arrayidx428, align 4, !dbg !470
  %cmp429 = icmp ne i32 %78, 3, !dbg !471
  br i1 %cmp429, label %land.lhs.true430, label %if.end436, !dbg !472, !cf.info !94

land.lhs.true430:                                 ; preds = %lor.lhs.false425
  %idxprom431 = sext i32 %i.0 to i64, !dbg !473
  %arrayidx432 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom431, !dbg !473
  %arrayidx433 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx432, i64 0, i64 2, !dbg !473
  %79 = load i32, i32* %arrayidx433, align 4, !dbg !473
  %cmp434 = icmp eq i32 %79, 3, !dbg !474
  br i1 %cmp434, label %if.then435, label %if.end436, !dbg !475, !cf.info !94

if.then435:                                       ; preds = %land.lhs.true430, %land.lhs.true420
  br label %return, !dbg !476

if.end436:                                        ; preds = %land.lhs.true430, %lor.lhs.false425, %land.lhs.true410, %if.end405
  %idxprom437 = sext i32 %i.0 to i64, !dbg !477
  %arrayidx438 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom437, !dbg !477
  %arrayidx439 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx438, i64 0, i64 1, !dbg !477
  %80 = load i32, i32* %arrayidx439, align 4, !dbg !477
  %cmp440 = icmp sge i32 %80, 0, !dbg !479
  br i1 %cmp440, label %land.lhs.true441, label %if.end467, !dbg !480, !cf.info !94

land.lhs.true441:                                 ; preds = %if.end436
  %idxprom442 = sext i32 %i.0 to i64, !dbg !481
  %arrayidx443 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom442, !dbg !481
  %arrayidx444 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx443, i64 0, i64 4, !dbg !481
  %81 = load i32, i32* %arrayidx444, align 4, !dbg !481
  %cmp445 = icmp sge i32 %81, 0, !dbg !482
  br i1 %cmp445, label %land.lhs.true446, label %if.end467, !dbg !483, !cf.info !94

land.lhs.true446:                                 ; preds = %land.lhs.true441
  %idxprom447 = sext i32 %i.0 to i64, !dbg !484
  %arrayidx448 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom447, !dbg !484
  %arrayidx449 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx448, i64 0, i64 1, !dbg !484
  %82 = load i32, i32* %arrayidx449, align 4, !dbg !484
  %cmp450 = icmp eq i32 %82, 3, !dbg !485
  br i1 %cmp450, label %land.lhs.true451, label %lor.lhs.false456, !dbg !486, !cf.info !94

land.lhs.true451:                                 ; preds = %land.lhs.true446
  %idxprom452 = sext i32 %i.0 to i64, !dbg !487
  %arrayidx453 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom452, !dbg !487
  %arrayidx454 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx453, i64 0, i64 4, !dbg !487
  %83 = load i32, i32* %arrayidx454, align 4, !dbg !487
  %cmp455 = icmp ne i32 %83, 4, !dbg !488
  br i1 %cmp455, label %if.then466, label %lor.lhs.false456, !dbg !489, !cf.info !94

lor.lhs.false456:                                 ; preds = %land.lhs.true451, %land.lhs.true446
  %idxprom457 = sext i32 %i.0 to i64, !dbg !490
  %arrayidx458 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom457, !dbg !490
  %arrayidx459 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx458, i64 0, i64 1, !dbg !490
  %84 = load i32, i32* %arrayidx459, align 4, !dbg !490
  %cmp460 = icmp ne i32 %84, 3, !dbg !491
  br i1 %cmp460, label %land.lhs.true461, label %if.end467, !dbg !492, !cf.info !94

land.lhs.true461:                                 ; preds = %lor.lhs.false456
  %idxprom462 = sext i32 %i.0 to i64, !dbg !493
  %arrayidx463 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom462, !dbg !493
  %arrayidx464 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx463, i64 0, i64 4, !dbg !493
  %85 = load i32, i32* %arrayidx464, align 4, !dbg !493
  %cmp465 = icmp eq i32 %85, 4, !dbg !494
  br i1 %cmp465, label %if.then466, label %if.end467, !dbg !495, !cf.info !94

if.then466:                                       ; preds = %land.lhs.true461, %land.lhs.true451
  br label %return, !dbg !496

if.end467:                                        ; preds = %land.lhs.true461, %lor.lhs.false456, %land.lhs.true441, %if.end436
  %idxprom468 = sext i32 %i.0 to i64, !dbg !497
  %arrayidx469 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom468, !dbg !497
  %arrayidx470 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx469, i64 0, i64 1, !dbg !497
  %86 = load i32, i32* %arrayidx470, align 4, !dbg !497
  %cmp471 = icmp eq i32 %86, 4, !dbg !499
  br i1 %cmp471, label %land.lhs.true472, label %if.end495, !dbg !500, !cf.info !94

land.lhs.true472:                                 ; preds = %if.end467
  %cmp473 = icmp slt i32 %i.0, 4, !dbg !501
  br i1 %cmp473, label %land.lhs.true474, label %lor.lhs.false486, !dbg !502, !cf.info !94

land.lhs.true474:                                 ; preds = %land.lhs.true472
  %add475 = add nsw i32 %i.0, 1, !dbg !503
  %idxprom476 = sext i32 %add475 to i64, !dbg !504
  %arrayidx477 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom476, !dbg !504
  %arrayidx478 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx477, i64 0, i64 0, !dbg !504
  %87 = load i32, i32* %arrayidx478, align 4, !dbg !504
  %cmp479 = icmp sge i32 %87, 0, !dbg !505
  br i1 %cmp479, label %land.lhs.true480, label %lor.lhs.false486, !dbg !506, !cf.info !94

land.lhs.true480:                                 ; preds = %land.lhs.true474
  %add481 = add nsw i32 %i.0, 1, !dbg !507
  %idxprom482 = sext i32 %add481 to i64, !dbg !508
  %arrayidx483 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom482, !dbg !508
  %arrayidx484 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx483, i64 0, i64 0, !dbg !508
  %88 = load i32, i32* %arrayidx484, align 4, !dbg !508
  %cmp485 = icmp ne i32 %88, 4, !dbg !509
  br i1 %cmp485, label %if.then494, label %lor.lhs.false486, !dbg !510, !cf.info !94

lor.lhs.false486:                                 ; preds = %land.lhs.true480, %land.lhs.true474, %land.lhs.true472
  %cmp487 = icmp sgt i32 %i.0, 0, !dbg !511
  br i1 %cmp487, label %land.lhs.true488, label %if.end495, !dbg !512, !cf.info !94

land.lhs.true488:                                 ; preds = %lor.lhs.false486
  %sub489 = sub nsw i32 %i.0, 1, !dbg !513
  %idxprom490 = sext i32 %sub489 to i64, !dbg !514
  %arrayidx491 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom490, !dbg !514
  %arrayidx492 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx491, i64 0, i64 0, !dbg !514
  %89 = load i32, i32* %arrayidx492, align 4, !dbg !514
  %cmp493 = icmp ne i32 %89, 4, !dbg !515
  br i1 %cmp493, label %if.then494, label %if.end495, !dbg !516, !cf.info !94

if.then494:                                       ; preds = %land.lhs.true488, %land.lhs.true480
  br label %return, !dbg !517

if.end495:                                        ; preds = %land.lhs.true488, %lor.lhs.false486, %if.end467
  %idxprom496 = sext i32 %i.0 to i64, !dbg !518
  %arrayidx497 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom496, !dbg !518
  %arrayidx498 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx497, i64 0, i64 4, !dbg !518
  %90 = load i32, i32* %arrayidx498, align 4, !dbg !518
  %cmp499 = icmp eq i32 %90, 2, !dbg !520
  br i1 %cmp499, label %if.then500, label %if.end546, !dbg !521, !cf.info !94

if.then500:                                       ; preds = %if.end495
  %cmp501 = icmp eq i32 %i.0, 0, !dbg !522
  br i1 %cmp501, label %land.lhs.true502, label %if.else515, !dbg !525, !cf.info !94

land.lhs.true502:                                 ; preds = %if.then500
  %add503 = add nsw i32 %i.0, 1, !dbg !526
  %idxprom504 = sext i32 %add503 to i64, !dbg !527
  %arrayidx505 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom504, !dbg !527
  %arrayidx506 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx505, i64 0, i64 2, !dbg !527
  %91 = load i32, i32* %arrayidx506, align 4, !dbg !527
  %cmp507 = icmp sge i32 %91, 0, !dbg !528
  br i1 %cmp507, label %land.lhs.true508, label %if.else515, !dbg !529, !cf.info !94

land.lhs.true508:                                 ; preds = %land.lhs.true502
  %add509 = add nsw i32 %i.0, 1, !dbg !530
  %idxprom510 = sext i32 %add509 to i64, !dbg !531
  %arrayidx511 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom510, !dbg !531
  %arrayidx512 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx511, i64 0, i64 2, !dbg !531
  %92 = load i32, i32* %arrayidx512, align 4, !dbg !531
  %cmp513 = icmp ne i32 %92, 4, !dbg !532
  br i1 %cmp513, label %if.then514, label %if.else515, !dbg !533, !cf.info !94

if.then514:                                       ; preds = %land.lhs.true508
  br label %return, !dbg !534

if.else515:                                       ; preds = %land.lhs.true508, %land.lhs.true502, %if.then500
  %cmp516 = icmp eq i32 %i.0, 4, !dbg !535
  br i1 %cmp516, label %land.lhs.true517, label %if.else524, !dbg !537, !cf.info !94

land.lhs.true517:                                 ; preds = %if.else515
  %sub518 = sub nsw i32 %i.0, 1, !dbg !538
  %idxprom519 = sext i32 %sub518 to i64, !dbg !539
  %arrayidx520 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom519, !dbg !539
  %arrayidx521 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx520, i64 0, i64 2, !dbg !539
  %93 = load i32, i32* %arrayidx521, align 4, !dbg !539
  %cmp522 = icmp ne i32 %93, 4, !dbg !540
  br i1 %cmp522, label %if.then523, label %if.else524, !dbg !541, !cf.info !94

if.then523:                                       ; preds = %land.lhs.true517
  br label %return, !dbg !542

if.else524:                                       ; preds = %land.lhs.true517, %if.else515
  %add525 = add nsw i32 %i.0, 1, !dbg !543
  %idxprom526 = sext i32 %add525 to i64, !dbg !545
  %arrayidx527 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom526, !dbg !545
  %arrayidx528 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx527, i64 0, i64 2, !dbg !545
  %94 = load i32, i32* %arrayidx528, align 4, !dbg !545
  %cmp529 = icmp sge i32 %94, 0, !dbg !546
  br i1 %cmp529, label %land.lhs.true530, label %if.end543, !dbg !547, !cf.info !94

land.lhs.true530:                                 ; preds = %if.else524
  %add531 = add nsw i32 %i.0, 1, !dbg !548
  %idxprom532 = sext i32 %add531 to i64, !dbg !549
  %arrayidx533 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom532, !dbg !549
  %arrayidx534 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx533, i64 0, i64 2, !dbg !549
  %95 = load i32, i32* %arrayidx534, align 4, !dbg !549
  %cmp535 = icmp ne i32 %95, 4, !dbg !550
  br i1 %cmp535, label %land.lhs.true536, label %if.end543, !dbg !551, !cf.info !94

land.lhs.true536:                                 ; preds = %land.lhs.true530
  %sub537 = sub nsw i32 %i.0, 1, !dbg !552
  %idxprom538 = sext i32 %sub537 to i64, !dbg !553
  %arrayidx539 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i64 %idxprom538, !dbg !553
  %arrayidx540 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx539, i64 0, i64 2, !dbg !553
  %96 = load i32, i32* %arrayidx540, align 4, !dbg !553
  %cmp541 = icmp ne i32 %96, 4, !dbg !554
  br i1 %cmp541, label %if.then542, label %if.end543, !dbg !555, !cf.info !94

if.then542:                                       ; preds = %land.lhs.true536
  br label %return, !dbg !556

if.end543:                                        ; preds = %land.lhs.true536, %land.lhs.true530, %if.else524
  br label %if.end544

if.end544:                                        ; preds = %if.end543
  br label %if.end545

if.end545:                                        ; preds = %if.end544
  br label %if.end546, !dbg !557

if.end546:                                        ; preds = %if.end545, %if.end495
  br label %for.inc, !dbg !558

for.inc:                                          ; preds = %if.end546
  %inc = add nsw i32 %i.0, 1, !dbg !559
  call void @llvm.dbg.value(metadata i32 %inc, metadata !168, metadata !DIExpression()), !dbg !170
  br label %for.cond, !dbg !560, !llvm.loop !561

for.end:                                          ; preds = %for.cond
  %cmp547 = icmp ne i32 %c_add.0, %c_or.0, !dbg !563
  br i1 %cmp547, label %if.then556, label %lor.lhs.false548, !dbg !565, !cf.info !94

lor.lhs.false548:                                 ; preds = %for.end
  %cmp549 = icmp ne i32 %m_add.0, %m_or.0, !dbg !566
  br i1 %cmp549, label %if.then556, label %lor.lhs.false550, !dbg !567, !cf.info !94

lor.lhs.false550:                                 ; preds = %lor.lhs.false548
  %cmp551 = icmp ne i32 %d_add.0, %d_or.0, !dbg !568
  br i1 %cmp551, label %if.then556, label %lor.lhs.false552, !dbg !569, !cf.info !94

lor.lhs.false552:                                 ; preds = %lor.lhs.false550
  %cmp553 = icmp ne i32 %a_add.0, %a_or.0, !dbg !570
  br i1 %cmp553, label %if.then556, label %lor.lhs.false554, !dbg !571, !cf.info !94

lor.lhs.false554:                                 ; preds = %lor.lhs.false552
  %cmp555 = icmp ne i32 %s_add.0, %s_or.0, !dbg !572
  br i1 %cmp555, label %if.then556, label %if.end557, !dbg !573, !cf.info !94

if.then556:                                       ; preds = %lor.lhs.false554, %lor.lhs.false552, %lor.lhs.false550, %lor.lhs.false548, %for.end
  br label %return, !dbg !574

if.end557:                                        ; preds = %lor.lhs.false554
  %cmp558 = icmp ne i32 %c_add.0, 31, !dbg !576
  br i1 %cmp558, label %if.then567, label %lor.lhs.false559, !dbg !578, !cf.info !94

lor.lhs.false559:                                 ; preds = %if.end557
  %cmp560 = icmp ne i32 %m_add.0, 31, !dbg !579
  br i1 %cmp560, label %if.then567, label %lor.lhs.false561, !dbg !580, !cf.info !94

lor.lhs.false561:                                 ; preds = %lor.lhs.false559
  %cmp562 = icmp ne i32 %d_add.0, 31, !dbg !581
  br i1 %cmp562, label %if.then567, label %lor.lhs.false563, !dbg !582, !cf.info !94

lor.lhs.false563:                                 ; preds = %lor.lhs.false561
  %cmp564 = icmp ne i32 %a_add.0, 31, !dbg !583
  br i1 %cmp564, label %if.then567, label %lor.lhs.false565, !dbg !584, !cf.info !94

lor.lhs.false565:                                 ; preds = %lor.lhs.false563
  %cmp566 = icmp ne i32 %s_add.0, 31, !dbg !585
  br i1 %cmp566, label %if.then567, label %if.end568, !dbg !586, !cf.info !94

if.then567:                                       ; preds = %lor.lhs.false565, %lor.lhs.false563, %lor.lhs.false561, %lor.lhs.false559, %if.end557
  br label %return, !dbg !587

if.end568:                                        ; preds = %lor.lhs.false565
  br label %return, !dbg !589

return:                                           ; preds = %if.end568, %if.then567, %if.then556, %if.then542, %if.then523, %if.then514, %if.then494, %if.then466, %if.then435, %if.then401, %if.then382, %if.then373, %if.then350, %if.then331, %if.then323, %if.then303, %if.then272, %if.then241, %if.then210, %if.then181, %if.then150, %if.then119, %if.then12, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ 0, %if.then12 ], [ 0, %if.then119 ], [ 0, %if.then150 ], [ 0, %if.then181 ], [ 0, %if.then210 ], [ 0, %if.then241 ], [ 0, %if.then272 ], [ 0, %if.then303 ], [ 0, %if.then323 ], [ 0, %if.then331 ], [ 0, %if.then350 ], [ 0, %if.then373 ], [ 0, %if.then382 ], [ 0, %if.then401 ], [ 0, %if.then435 ], [ 0, %if.then466 ], [ 0, %if.then494 ], [ 0, %if.then514 ], [ 0, %if.then523 ], [ 0, %if.then542 ], [ 0, %if.then556 ], [ 1, %if.then567 ], [ 2, %if.end568 ], !dbg !141
  ret i32 %retval.0, !dbg !590
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bruteFill([5 x i32]* %ha, i32 %hno, i32 %attr) #0 !dbg !591 {
entry:
  %hb = alloca [5 x [5 x i32]], align 16
  call void @llvm.dbg.value(metadata [5 x i32]* %ha, metadata !594, metadata !DIExpression()), !dbg !595
  call void @llvm.dbg.value(metadata i32 %hno, metadata !596, metadata !DIExpression()), !dbg !595
  call void @llvm.dbg.value(metadata i32 %attr, metadata !597, metadata !DIExpression()), !dbg !595
  %call = call i32 @checkHouses([5 x i32]* %ha), !dbg !598
  call void @llvm.dbg.value(metadata i32 %call, metadata !599, metadata !DIExpression()), !dbg !595
  %cmp = icmp eq i32 %call, 2, !dbg !600
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !602, !cf.info !94

lor.lhs.false:                                    ; preds = %entry
  %cmp1 = icmp eq i32 %call, 0, !dbg !603
  br i1 %cmp1, label %if.then, label %if.end, !dbg !604, !cf.info !94

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return, !dbg !605

if.end:                                           ; preds = %lor.lhs.false
  call void @llvm.dbg.declare(metadata [5 x [5 x i32]]* %hb, metadata !606, metadata !DIExpression()), !dbg !609
  %arraydecay = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %hb, i64 0, i64 0, !dbg !610
  %0 = bitcast [5 x i32]* %arraydecay to i8*, !dbg !610
  %1 = bitcast [5 x i32]* %ha to i8*, !dbg !610
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %1, i64 100, i1 false), !dbg !610
  call void @llvm.dbg.value(metadata i32 0, metadata !611, metadata !DIExpression()), !dbg !613
  br label %for.cond, !dbg !614

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ 0, %if.end ], [ %inc, %for.inc ], !dbg !613
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !611, metadata !DIExpression()), !dbg !613
  %cmp2 = icmp slt i32 %i.0, 5, !dbg !615
  br i1 %cmp2, label %for.body, label %for.end, !dbg !617

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %hno to i64, !dbg !618
  %arrayidx = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %hb, i64 0, i64 %idxprom, !dbg !618
  %idxprom3 = sext i32 %attr to i64, !dbg !618
  %arrayidx4 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx, i64 0, i64 %idxprom3, !dbg !618
  store i32 %i.0, i32* %arrayidx4, align 4, !dbg !620
  %arraydecay5 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %hb, i64 0, i64 0, !dbg !621
  %call6 = call i32 @checkHouses([5 x i32]* %arraydecay5), !dbg !622
  call void @llvm.dbg.value(metadata i32 %call6, metadata !599, metadata !DIExpression()), !dbg !595
  %cmp7 = icmp ne i32 %call6, 0, !dbg !623
  br i1 %cmp7, label %if.then8, label %if.end19, !dbg !625, !cf.info !94

if.then8:                                         ; preds = %for.body
  %cmp9 = icmp slt i32 %attr, 4, !dbg !626
  br i1 %cmp9, label %if.then10, label %if.else, !dbg !629, !cf.info !94

if.then10:                                        ; preds = %if.then8
  %add = add nsw i32 %attr, 1, !dbg !630
  call void @llvm.dbg.value(metadata i32 %add, metadata !632, metadata !DIExpression()), !dbg !633
  call void @llvm.dbg.value(metadata i32 %hno, metadata !634, metadata !DIExpression()), !dbg !633
  br label %if.end12, !dbg !635

if.else:                                          ; preds = %if.then8
  call void @llvm.dbg.value(metadata i32 0, metadata !632, metadata !DIExpression()), !dbg !633
  %add11 = add nsw i32 %hno, 1, !dbg !636
  call void @llvm.dbg.value(metadata i32 %add11, metadata !634, metadata !DIExpression()), !dbg !633
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then10
  %nexthno.0 = phi i32 [ %hno, %if.then10 ], [ %add11, %if.else ], !dbg !638
  %nextattr.0 = phi i32 [ %add, %if.then10 ], [ 0, %if.else ], !dbg !638
  call void @llvm.dbg.value(metadata i32 %nextattr.0, metadata !632, metadata !DIExpression()), !dbg !633
  call void @llvm.dbg.value(metadata i32 %nexthno.0, metadata !634, metadata !DIExpression()), !dbg !633
  %arraydecay13 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %hb, i64 0, i64 0, !dbg !639
  %call14 = call i32 @bruteFill([5 x i32]* %arraydecay13, i32 %nexthno.0, i32 %nextattr.0), !dbg !640
  call void @llvm.dbg.value(metadata i32 %call14, metadata !599, metadata !DIExpression()), !dbg !595
  %cmp15 = icmp ne i32 %call14, 0, !dbg !641
  br i1 %cmp15, label %if.then16, label %if.end18, !dbg !643, !cf.info !94

if.then16:                                        ; preds = %if.end12
  %2 = bitcast [5 x i32]* %ha to i8*, !dbg !644
  %arraydecay17 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %hb, i64 0, i64 0, !dbg !644
  %3 = bitcast [5 x i32]* %arraydecay17 to i8*, !dbg !644
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 100, i1 false), !dbg !644
  br label %return, !dbg !646

if.end18:                                         ; preds = %if.end12
  br label %if.end19, !dbg !647

if.end19:                                         ; preds = %if.end18, %for.body
  br label %for.inc, !dbg !648

for.inc:                                          ; preds = %if.end19
  %inc = add nsw i32 %i.0, 1, !dbg !649
  call void @llvm.dbg.value(metadata i32 %inc, metadata !611, metadata !DIExpression()), !dbg !613
  br label %for.cond, !dbg !650, !llvm.loop !651

for.end:                                          ; preds = %for.cond
  br label %return, !dbg !653

return:                                           ; preds = %for.end, %if.then16, %if.then
  %retval.0 = phi i32 [ %call, %if.then ], [ %call14, %if.then16 ], [ 0, %for.end ], !dbg !595
  ret i32 %retval.0, !dbg !654
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !655 {
entry:
  %ha = alloca [5 x [5 x i32]], align 16
  call void @llvm.dbg.declare(metadata [5 x [5 x i32]]* %ha, metadata !658, metadata !DIExpression()), !dbg !659
  %0 = bitcast [5 x [5 x i32]]* %ha to i8*, !dbg !659
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 -1, i64 100, i1 false), !dbg !659
  %arraydecay = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %ha, i64 0, i64 0, !dbg !660
  %call = call i32 @bruteFill([5 x i32]* %arraydecay, i32 0, i32 0), !dbg !661
  %arraydecay1 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %ha, i64 0, i64 0, !dbg !662
  call void @printHouses([5 x i32]* %arraydecay1), !dbg !663
  ret i32 0, !dbg !664
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!51, !52, !53}
!llvm.ident = !{!54}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "zebra-puzzle-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Zebra-puzzle")
!2 = !{!3, !11, !18, !23, !30, !37, !44}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "Attrib", file: !1, line: 6, baseType: !4, size: 32, elements: !5)
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !7, !8, !9, !10}
!6 = !DIEnumerator(name: "C", value: 0, isUnsigned: true)
!7 = !DIEnumerator(name: "M", value: 1, isUnsigned: true)
!8 = !DIEnumerator(name: "D", value: 2, isUnsigned: true)
!9 = !DIEnumerator(name: "A", value: 3, isUnsigned: true)
!10 = !DIEnumerator(name: "S", value: 4, isUnsigned: true)
!11 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "Drinks", file: !1, line: 11, baseType: !4, size: 32, elements: !12)
!12 = !{!13, !14, !15, !16, !17}
!13 = !DIEnumerator(name: "Tea", value: 0, isUnsigned: true)
!14 = !DIEnumerator(name: "Coffee", value: 1, isUnsigned: true)
!15 = !DIEnumerator(name: "Milk", value: 2, isUnsigned: true)
!16 = !DIEnumerator(name: "Beer", value: 3, isUnsigned: true)
!17 = !DIEnumerator(name: "Water", value: 4, isUnsigned: true)
!18 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "HouseStatus", file: !1, line: 4, baseType: !4, size: 32, elements: !19)
!19 = !{!20, !21, !22}
!20 = !DIEnumerator(name: "Invalid", value: 0, isUnsigned: true)
!21 = !DIEnumerator(name: "Underfull", value: 1, isUnsigned: true)
!22 = !DIEnumerator(name: "Valid", value: 2, isUnsigned: true)
!23 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "Mans", file: !1, line: 10, baseType: !4, size: 32, elements: !24)
!24 = !{!25, !26, !27, !28, !29}
!25 = !DIEnumerator(name: "English", value: 0, isUnsigned: true)
!26 = !DIEnumerator(name: "Swede", value: 1, isUnsigned: true)
!27 = !DIEnumerator(name: "Dane", value: 2, isUnsigned: true)
!28 = !DIEnumerator(name: "German", value: 3, isUnsigned: true)
!29 = !DIEnumerator(name: "Norwegian", value: 4, isUnsigned: true)
!30 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "Colors", file: !1, line: 9, baseType: !4, size: 32, elements: !31)
!31 = !{!32, !33, !34, !35, !36}
!32 = !DIEnumerator(name: "Red", value: 0, isUnsigned: true)
!33 = !DIEnumerator(name: "Green", value: 1, isUnsigned: true)
!34 = !DIEnumerator(name: "White", value: 2, isUnsigned: true)
!35 = !DIEnumerator(name: "Yellow", value: 3, isUnsigned: true)
!36 = !DIEnumerator(name: "Blue", value: 4, isUnsigned: true)
!37 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "Animals", file: !1, line: 12, baseType: !4, size: 32, elements: !38)
!38 = !{!39, !40, !41, !42, !43}
!39 = !DIEnumerator(name: "Dog", value: 0, isUnsigned: true)
!40 = !DIEnumerator(name: "Birds", value: 1, isUnsigned: true)
!41 = !DIEnumerator(name: "Cats", value: 2, isUnsigned: true)
!42 = !DIEnumerator(name: "Horse", value: 3, isUnsigned: true)
!43 = !DIEnumerator(name: "Zebra", value: 4, isUnsigned: true)
!44 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "Smokes", file: !1, line: 13, baseType: !4, size: 32, elements: !45)
!45 = !{!46, !47, !48, !49, !50}
!46 = !DIEnumerator(name: "PallMall", value: 0, isUnsigned: true)
!47 = !DIEnumerator(name: "Dunhill", value: 1, isUnsigned: true)
!48 = !DIEnumerator(name: "Blend", value: 2, isUnsigned: true)
!49 = !DIEnumerator(name: "BlueMaster", value: 3, isUnsigned: true)
!50 = !DIEnumerator(name: "Prince", value: 4, isUnsigned: true)
!51 = !{i32 7, !"Dwarf Version", i32 4}
!52 = !{i32 2, !"Debug Info Version", i32 3}
!53 = !{i32 1, !"wchar_size", i32 4}
!54 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!55 = distinct !DISubprogram(name: "printHouses", scope: !1, file: !1, line: 16, type: !56, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !63)
!56 = !DISubroutineType(types: !57)
!57 = !{null, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 160, elements: !61)
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !{!62}
!62 = !DISubrange(count: 5)
!63 = !{}
!64 = !DILocalVariable(name: "ha", arg: 1, scope: !55, file: !1, line: 16, type: !58)
!65 = !DILocation(line: 0, scope: !55)
!66 = !DILocalVariable(name: "color", scope: !55, file: !1, line: 17, type: !67)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !68, size: 320, elements: !61)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !70)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocation(line: 17, column: 17, scope: !55)
!72 = !DILocalVariable(name: "man", scope: !55, file: !1, line: 18, type: !67)
!73 = !DILocation(line: 18, column: 17, scope: !55)
!74 = !DILocalVariable(name: "drink", scope: !55, file: !1, line: 19, type: !67)
!75 = !DILocation(line: 19, column: 17, scope: !55)
!76 = !DILocalVariable(name: "animal", scope: !55, file: !1, line: 20, type: !67)
!77 = !DILocation(line: 20, column: 17, scope: !55)
!78 = !DILocalVariable(name: "smoke", scope: !55, file: !1, line: 21, type: !67)
!79 = !DILocation(line: 21, column: 17, scope: !55)
!80 = !DILocation(line: 23, column: 5, scope: !55)
!81 = !DILocalVariable(name: "i", scope: !82, file: !1, line: 26, type: !60)
!82 = distinct !DILexicalBlock(scope: !55, file: !1, line: 26, column: 5)
!83 = !DILocation(line: 0, scope: !82)
!84 = !DILocation(line: 26, column: 10, scope: !82)
!85 = !DILocation(line: 26, column: 23, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !1, line: 26, column: 5)
!87 = !DILocation(line: 26, column: 5, scope: !82)
!88 = !DILocation(line: 27, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !1, line: 26, column: 33)
!90 = !DILocation(line: 28, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !89, file: !1, line: 28, column: 13)
!92 = !DILocation(line: 28, column: 22, scope: !91)
!93 = !DILocation(line: 28, column: 13, scope: !89)
!94 = !{!"if"}
!95 = !DILocation(line: 29, column: 38, scope: !91)
!96 = !DILocation(line: 29, column: 32, scope: !91)
!97 = !DILocation(line: 29, column: 13, scope: !91)
!98 = !DILocation(line: 31, column: 13, scope: !91)
!99 = !DILocation(line: 32, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !89, file: !1, line: 32, column: 13)
!101 = !DILocation(line: 32, column: 22, scope: !100)
!102 = !DILocation(line: 32, column: 13, scope: !89)
!103 = !DILocation(line: 33, column: 36, scope: !100)
!104 = !DILocation(line: 33, column: 32, scope: !100)
!105 = !DILocation(line: 33, column: 13, scope: !100)
!106 = !DILocation(line: 35, column: 13, scope: !100)
!107 = !DILocation(line: 36, column: 13, scope: !108)
!108 = distinct !DILexicalBlock(scope: !89, file: !1, line: 36, column: 13)
!109 = !DILocation(line: 36, column: 22, scope: !108)
!110 = !DILocation(line: 36, column: 13, scope: !89)
!111 = !DILocation(line: 37, column: 38, scope: !108)
!112 = !DILocation(line: 37, column: 32, scope: !108)
!113 = !DILocation(line: 37, column: 13, scope: !108)
!114 = !DILocation(line: 39, column: 13, scope: !108)
!115 = !DILocation(line: 40, column: 13, scope: !116)
!116 = distinct !DILexicalBlock(scope: !89, file: !1, line: 40, column: 13)
!117 = !DILocation(line: 40, column: 22, scope: !116)
!118 = !DILocation(line: 40, column: 13, scope: !89)
!119 = !DILocation(line: 41, column: 39, scope: !116)
!120 = !DILocation(line: 41, column: 32, scope: !116)
!121 = !DILocation(line: 41, column: 13, scope: !116)
!122 = !DILocation(line: 43, column: 13, scope: !116)
!123 = !DILocation(line: 44, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !89, file: !1, line: 44, column: 13)
!125 = !DILocation(line: 44, column: 22, scope: !124)
!126 = !DILocation(line: 44, column: 13, scope: !89)
!127 = !DILocation(line: 45, column: 40, scope: !124)
!128 = !DILocation(line: 45, column: 34, scope: !124)
!129 = !DILocation(line: 45, column: 13, scope: !124)
!130 = !DILocation(line: 47, column: 13, scope: !124)
!131 = !DILocation(line: 48, column: 5, scope: !89)
!132 = !DILocation(line: 26, column: 29, scope: !86)
!133 = !DILocation(line: 26, column: 5, scope: !86)
!134 = distinct !{!134, !87, !135}
!135 = !DILocation(line: 48, column: 5, scope: !82)
!136 = !DILocation(line: 49, column: 1, scope: !55)
!137 = distinct !DISubprogram(name: "checkHouses", scope: !1, file: !1, line: 52, type: !138, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !63)
!138 = !DISubroutineType(types: !139)
!139 = !{!60, !58}
!140 = !DILocalVariable(name: "ha", arg: 1, scope: !137, file: !1, line: 52, type: !58)
!141 = !DILocation(line: 0, scope: !137)
!142 = !DILocalVariable(name: "c_add", scope: !137, file: !1, line: 53, type: !60)
!143 = !DILocalVariable(name: "c_or", scope: !137, file: !1, line: 53, type: !60)
!144 = !DILocalVariable(name: "m_add", scope: !137, file: !1, line: 54, type: !60)
!145 = !DILocalVariable(name: "m_or", scope: !137, file: !1, line: 54, type: !60)
!146 = !DILocalVariable(name: "d_add", scope: !137, file: !1, line: 55, type: !60)
!147 = !DILocalVariable(name: "d_or", scope: !137, file: !1, line: 55, type: !60)
!148 = !DILocalVariable(name: "a_add", scope: !137, file: !1, line: 56, type: !60)
!149 = !DILocalVariable(name: "a_or", scope: !137, file: !1, line: 56, type: !60)
!150 = !DILocalVariable(name: "s_add", scope: !137, file: !1, line: 57, type: !60)
!151 = !DILocalVariable(name: "s_or", scope: !137, file: !1, line: 57, type: !60)
!152 = !DILocation(line: 60, column: 9, scope: !153)
!153 = distinct !DILexicalBlock(scope: !137, file: !1, line: 60, column: 9)
!154 = !DILocation(line: 60, column: 18, scope: !153)
!155 = !DILocation(line: 60, column: 23, scope: !153)
!156 = !DILocation(line: 60, column: 26, scope: !153)
!157 = !DILocation(line: 60, column: 35, scope: !153)
!158 = !DILocation(line: 60, column: 9, scope: !137)
!159 = !DILocation(line: 61, column: 9, scope: !153)
!160 = !DILocation(line: 64, column: 9, scope: !161)
!161 = distinct !DILexicalBlock(scope: !137, file: !1, line: 64, column: 9)
!162 = !DILocation(line: 64, column: 18, scope: !161)
!163 = !DILocation(line: 64, column: 23, scope: !161)
!164 = !DILocation(line: 64, column: 26, scope: !161)
!165 = !DILocation(line: 64, column: 35, scope: !161)
!166 = !DILocation(line: 64, column: 9, scope: !137)
!167 = !DILocation(line: 65, column: 9, scope: !161)
!168 = !DILocalVariable(name: "i", scope: !169, file: !1, line: 67, type: !60)
!169 = distinct !DILexicalBlock(scope: !137, file: !1, line: 67, column: 5)
!170 = !DILocation(line: 0, scope: !169)
!171 = !DILocation(line: 67, column: 10, scope: !169)
!172 = !DILocation(line: 67, column: 23, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !1, line: 67, column: 5)
!174 = !DILocation(line: 67, column: 5, scope: !169)
!175 = !DILocation(line: 69, column: 13, scope: !176)
!176 = distinct !DILexicalBlock(scope: !177, file: !1, line: 69, column: 13)
!177 = distinct !DILexicalBlock(scope: !173, file: !1, line: 67, column: 33)
!178 = !DILocation(line: 69, column: 22, scope: !176)
!179 = !DILocation(line: 69, column: 13, scope: !177)
!180 = !DILocation(line: 70, column: 28, scope: !181)
!181 = distinct !DILexicalBlock(scope: !176, file: !1, line: 69, column: 28)
!182 = !DILocation(line: 70, column: 25, scope: !181)
!183 = !DILocation(line: 70, column: 19, scope: !181)
!184 = !DILocation(line: 71, column: 27, scope: !181)
!185 = !DILocation(line: 71, column: 24, scope: !181)
!186 = !DILocation(line: 71, column: 18, scope: !181)
!187 = !DILocation(line: 72, column: 9, scope: !181)
!188 = !DILocation(line: 73, column: 13, scope: !189)
!189 = distinct !DILexicalBlock(scope: !177, file: !1, line: 73, column: 13)
!190 = !DILocation(line: 73, column: 22, scope: !189)
!191 = !DILocation(line: 73, column: 13, scope: !177)
!192 = !DILocation(line: 74, column: 28, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !1, line: 73, column: 28)
!194 = !DILocation(line: 74, column: 25, scope: !193)
!195 = !DILocation(line: 74, column: 19, scope: !193)
!196 = !DILocation(line: 75, column: 27, scope: !193)
!197 = !DILocation(line: 75, column: 24, scope: !193)
!198 = !DILocation(line: 75, column: 18, scope: !193)
!199 = !DILocation(line: 76, column: 9, scope: !193)
!200 = !DILocation(line: 77, column: 13, scope: !201)
!201 = distinct !DILexicalBlock(scope: !177, file: !1, line: 77, column: 13)
!202 = !DILocation(line: 77, column: 22, scope: !201)
!203 = !DILocation(line: 77, column: 13, scope: !177)
!204 = !DILocation(line: 78, column: 28, scope: !205)
!205 = distinct !DILexicalBlock(scope: !201, file: !1, line: 77, column: 28)
!206 = !DILocation(line: 78, column: 25, scope: !205)
!207 = !DILocation(line: 78, column: 19, scope: !205)
!208 = !DILocation(line: 79, column: 27, scope: !205)
!209 = !DILocation(line: 79, column: 24, scope: !205)
!210 = !DILocation(line: 79, column: 18, scope: !205)
!211 = !DILocation(line: 80, column: 9, scope: !205)
!212 = !DILocation(line: 81, column: 13, scope: !213)
!213 = distinct !DILexicalBlock(scope: !177, file: !1, line: 81, column: 13)
!214 = !DILocation(line: 81, column: 22, scope: !213)
!215 = !DILocation(line: 81, column: 13, scope: !177)
!216 = !DILocation(line: 82, column: 28, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !1, line: 81, column: 28)
!218 = !DILocation(line: 82, column: 25, scope: !217)
!219 = !DILocation(line: 82, column: 19, scope: !217)
!220 = !DILocation(line: 83, column: 27, scope: !217)
!221 = !DILocation(line: 83, column: 24, scope: !217)
!222 = !DILocation(line: 83, column: 18, scope: !217)
!223 = !DILocation(line: 84, column: 9, scope: !217)
!224 = !DILocation(line: 85, column: 13, scope: !225)
!225 = distinct !DILexicalBlock(scope: !177, file: !1, line: 85, column: 13)
!226 = !DILocation(line: 85, column: 22, scope: !225)
!227 = !DILocation(line: 85, column: 13, scope: !177)
!228 = !DILocation(line: 86, column: 28, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !1, line: 85, column: 28)
!230 = !DILocation(line: 86, column: 25, scope: !229)
!231 = !DILocation(line: 86, column: 19, scope: !229)
!232 = !DILocation(line: 87, column: 27, scope: !229)
!233 = !DILocation(line: 87, column: 24, scope: !229)
!234 = !DILocation(line: 87, column: 18, scope: !229)
!235 = !DILocation(line: 88, column: 9, scope: !229)
!236 = !DILocation(line: 91, column: 14, scope: !237)
!237 = distinct !DILexicalBlock(scope: !177, file: !1, line: 91, column: 13)
!238 = !DILocation(line: 91, column: 23, scope: !237)
!239 = !DILocation(line: 91, column: 28, scope: !237)
!240 = !DILocation(line: 91, column: 31, scope: !237)
!241 = !DILocation(line: 91, column: 40, scope: !237)
!242 = !DILocation(line: 91, column: 46, scope: !237)
!243 = !DILocation(line: 92, column: 15, scope: !237)
!244 = !DILocation(line: 92, column: 24, scope: !237)
!245 = !DILocation(line: 92, column: 35, scope: !237)
!246 = !DILocation(line: 92, column: 38, scope: !237)
!247 = !DILocation(line: 92, column: 47, scope: !237)
!248 = !DILocation(line: 92, column: 55, scope: !237)
!249 = !DILocation(line: 93, column: 15, scope: !237)
!250 = !DILocation(line: 93, column: 24, scope: !237)
!251 = !DILocation(line: 93, column: 35, scope: !237)
!252 = !DILocation(line: 93, column: 38, scope: !237)
!253 = !DILocation(line: 93, column: 47, scope: !237)
!254 = !DILocation(line: 91, column: 13, scope: !177)
!255 = !DILocation(line: 94, column: 13, scope: !237)
!256 = !DILocation(line: 97, column: 14, scope: !257)
!257 = distinct !DILexicalBlock(scope: !177, file: !1, line: 97, column: 13)
!258 = !DILocation(line: 97, column: 23, scope: !257)
!259 = !DILocation(line: 97, column: 28, scope: !257)
!260 = !DILocation(line: 97, column: 31, scope: !257)
!261 = !DILocation(line: 97, column: 40, scope: !257)
!262 = !DILocation(line: 97, column: 46, scope: !257)
!263 = !DILocation(line: 98, column: 15, scope: !257)
!264 = !DILocation(line: 98, column: 24, scope: !257)
!265 = !DILocation(line: 98, column: 33, scope: !257)
!266 = !DILocation(line: 98, column: 36, scope: !257)
!267 = !DILocation(line: 98, column: 45, scope: !257)
!268 = !DILocation(line: 98, column: 53, scope: !257)
!269 = !DILocation(line: 99, column: 15, scope: !257)
!270 = !DILocation(line: 99, column: 24, scope: !257)
!271 = !DILocation(line: 99, column: 33, scope: !257)
!272 = !DILocation(line: 99, column: 36, scope: !257)
!273 = !DILocation(line: 99, column: 45, scope: !257)
!274 = !DILocation(line: 97, column: 13, scope: !177)
!275 = !DILocation(line: 100, column: 13, scope: !257)
!276 = !DILocation(line: 103, column: 14, scope: !277)
!277 = distinct !DILexicalBlock(scope: !177, file: !1, line: 103, column: 13)
!278 = !DILocation(line: 103, column: 23, scope: !277)
!279 = !DILocation(line: 103, column: 28, scope: !277)
!280 = !DILocation(line: 103, column: 31, scope: !277)
!281 = !DILocation(line: 103, column: 40, scope: !277)
!282 = !DILocation(line: 103, column: 46, scope: !277)
!283 = !DILocation(line: 104, column: 15, scope: !277)
!284 = !DILocation(line: 104, column: 24, scope: !277)
!285 = !DILocation(line: 104, column: 32, scope: !277)
!286 = !DILocation(line: 104, column: 35, scope: !277)
!287 = !DILocation(line: 104, column: 44, scope: !277)
!288 = !DILocation(line: 104, column: 52, scope: !277)
!289 = !DILocation(line: 105, column: 15, scope: !277)
!290 = !DILocation(line: 105, column: 24, scope: !277)
!291 = !DILocation(line: 105, column: 32, scope: !277)
!292 = !DILocation(line: 105, column: 35, scope: !277)
!293 = !DILocation(line: 105, column: 44, scope: !277)
!294 = !DILocation(line: 103, column: 13, scope: !177)
!295 = !DILocation(line: 106, column: 13, scope: !277)
!296 = !DILocation(line: 109, column: 16, scope: !297)
!297 = distinct !DILexicalBlock(scope: !177, file: !1, line: 109, column: 13)
!298 = !DILocation(line: 109, column: 20, scope: !297)
!299 = !DILocation(line: 109, column: 23, scope: !297)
!300 = !DILocation(line: 109, column: 32, scope: !297)
!301 = !DILocation(line: 109, column: 63, scope: !297)
!302 = !DILocation(line: 110, column: 20, scope: !297)
!303 = !DILocation(line: 110, column: 15, scope: !297)
!304 = !DILocation(line: 110, column: 28, scope: !297)
!305 = !DILocation(line: 110, column: 37, scope: !297)
!306 = !DILocation(line: 110, column: 40, scope: !297)
!307 = !DILocation(line: 110, column: 49, scope: !297)
!308 = !DILocation(line: 110, column: 59, scope: !297)
!309 = !DILocation(line: 111, column: 20, scope: !297)
!310 = !DILocation(line: 111, column: 15, scope: !297)
!311 = !DILocation(line: 111, column: 28, scope: !297)
!312 = !DILocation(line: 111, column: 37, scope: !297)
!313 = !DILocation(line: 111, column: 40, scope: !297)
!314 = !DILocation(line: 111, column: 49, scope: !297)
!315 = !DILocation(line: 109, column: 13, scope: !177)
!316 = !DILocation(line: 112, column: 13, scope: !297)
!317 = !DILocation(line: 115, column: 14, scope: !318)
!318 = distinct !DILexicalBlock(scope: !177, file: !1, line: 115, column: 13)
!319 = !DILocation(line: 115, column: 23, scope: !318)
!320 = !DILocation(line: 115, column: 28, scope: !318)
!321 = !DILocation(line: 115, column: 31, scope: !318)
!322 = !DILocation(line: 115, column: 40, scope: !318)
!323 = !DILocation(line: 115, column: 46, scope: !318)
!324 = !DILocation(line: 116, column: 15, scope: !318)
!325 = !DILocation(line: 116, column: 24, scope: !318)
!326 = !DILocation(line: 116, column: 33, scope: !318)
!327 = !DILocation(line: 116, column: 36, scope: !318)
!328 = !DILocation(line: 116, column: 45, scope: !318)
!329 = !DILocation(line: 116, column: 56, scope: !318)
!330 = !DILocation(line: 117, column: 15, scope: !318)
!331 = !DILocation(line: 117, column: 24, scope: !318)
!332 = !DILocation(line: 117, column: 33, scope: !318)
!333 = !DILocation(line: 117, column: 36, scope: !318)
!334 = !DILocation(line: 117, column: 45, scope: !318)
!335 = !DILocation(line: 115, column: 13, scope: !177)
!336 = !DILocation(line: 118, column: 13, scope: !318)
!337 = !DILocation(line: 121, column: 14, scope: !338)
!338 = distinct !DILexicalBlock(scope: !177, file: !1, line: 121, column: 13)
!339 = !DILocation(line: 121, column: 23, scope: !338)
!340 = !DILocation(line: 121, column: 28, scope: !338)
!341 = !DILocation(line: 121, column: 31, scope: !338)
!342 = !DILocation(line: 121, column: 40, scope: !338)
!343 = !DILocation(line: 121, column: 46, scope: !338)
!344 = !DILocation(line: 122, column: 15, scope: !338)
!345 = !DILocation(line: 122, column: 24, scope: !338)
!346 = !DILocation(line: 122, column: 36, scope: !338)
!347 = !DILocation(line: 122, column: 39, scope: !338)
!348 = !DILocation(line: 122, column: 48, scope: !338)
!349 = !DILocation(line: 122, column: 58, scope: !338)
!350 = !DILocation(line: 123, column: 15, scope: !338)
!351 = !DILocation(line: 123, column: 24, scope: !338)
!352 = !DILocation(line: 123, column: 36, scope: !338)
!353 = !DILocation(line: 123, column: 39, scope: !338)
!354 = !DILocation(line: 123, column: 48, scope: !338)
!355 = !DILocation(line: 121, column: 13, scope: !177)
!356 = !DILocation(line: 124, column: 13, scope: !338)
!357 = !DILocation(line: 127, column: 14, scope: !358)
!358 = distinct !DILexicalBlock(scope: !177, file: !1, line: 127, column: 13)
!359 = !DILocation(line: 127, column: 23, scope: !358)
!360 = !DILocation(line: 127, column: 28, scope: !358)
!361 = !DILocation(line: 127, column: 31, scope: !358)
!362 = !DILocation(line: 127, column: 40, scope: !358)
!363 = !DILocation(line: 127, column: 46, scope: !358)
!364 = !DILocation(line: 128, column: 15, scope: !358)
!365 = !DILocation(line: 128, column: 24, scope: !358)
!366 = !DILocation(line: 128, column: 35, scope: !358)
!367 = !DILocation(line: 128, column: 38, scope: !358)
!368 = !DILocation(line: 128, column: 47, scope: !358)
!369 = !DILocation(line: 128, column: 58, scope: !358)
!370 = !DILocation(line: 129, column: 15, scope: !358)
!371 = !DILocation(line: 129, column: 24, scope: !358)
!372 = !DILocation(line: 129, column: 35, scope: !358)
!373 = !DILocation(line: 129, column: 38, scope: !358)
!374 = !DILocation(line: 129, column: 47, scope: !358)
!375 = !DILocation(line: 127, column: 13, scope: !177)
!376 = !DILocation(line: 130, column: 13, scope: !358)
!377 = !DILocation(line: 133, column: 13, scope: !378)
!378 = distinct !DILexicalBlock(scope: !177, file: !1, line: 133, column: 13)
!379 = !DILocation(line: 133, column: 22, scope: !378)
!380 = !DILocation(line: 133, column: 13, scope: !177)
!381 = !DILocation(line: 134, column: 19, scope: !382)
!382 = distinct !DILexicalBlock(scope: !383, file: !1, line: 134, column: 17)
!383 = distinct !DILexicalBlock(scope: !378, file: !1, line: 133, column: 32)
!384 = !DILocation(line: 134, column: 24, scope: !382)
!385 = !DILocation(line: 134, column: 32, scope: !382)
!386 = !DILocation(line: 134, column: 27, scope: !382)
!387 = !DILocation(line: 134, column: 40, scope: !382)
!388 = !DILocation(line: 134, column: 45, scope: !382)
!389 = !DILocation(line: 134, column: 53, scope: !382)
!390 = !DILocation(line: 134, column: 48, scope: !382)
!391 = !DILocation(line: 134, column: 61, scope: !382)
!392 = !DILocation(line: 134, column: 17, scope: !383)
!393 = !DILocation(line: 135, column: 17, scope: !382)
!394 = !DILocation(line: 136, column: 24, scope: !395)
!395 = distinct !DILexicalBlock(scope: !382, file: !1, line: 136, column: 22)
!396 = !DILocation(line: 136, column: 29, scope: !395)
!397 = !DILocation(line: 136, column: 37, scope: !395)
!398 = !DILocation(line: 136, column: 32, scope: !395)
!399 = !DILocation(line: 136, column: 45, scope: !395)
!400 = !DILocation(line: 136, column: 22, scope: !382)
!401 = !DILocation(line: 137, column: 17, scope: !395)
!402 = !DILocation(line: 138, column: 27, scope: !403)
!403 = distinct !DILexicalBlock(scope: !395, file: !1, line: 138, column: 22)
!404 = !DILocation(line: 138, column: 22, scope: !403)
!405 = !DILocation(line: 138, column: 35, scope: !403)
!406 = !DILocation(line: 138, column: 40, scope: !403)
!407 = !DILocation(line: 138, column: 48, scope: !403)
!408 = !DILocation(line: 138, column: 43, scope: !403)
!409 = !DILocation(line: 138, column: 56, scope: !403)
!410 = !DILocation(line: 138, column: 64, scope: !403)
!411 = !DILocation(line: 138, column: 72, scope: !403)
!412 = !DILocation(line: 138, column: 67, scope: !403)
!413 = !DILocation(line: 138, column: 80, scope: !403)
!414 = !DILocation(line: 138, column: 22, scope: !395)
!415 = !DILocation(line: 139, column: 17, scope: !403)
!416 = !DILocation(line: 140, column: 9, scope: !383)
!417 = !DILocation(line: 143, column: 13, scope: !418)
!418 = distinct !DILexicalBlock(scope: !177, file: !1, line: 143, column: 13)
!419 = !DILocation(line: 143, column: 22, scope: !418)
!420 = !DILocation(line: 143, column: 13, scope: !177)
!421 = !DILocation(line: 144, column: 19, scope: !422)
!422 = distinct !DILexicalBlock(scope: !423, file: !1, line: 144, column: 17)
!423 = distinct !DILexicalBlock(scope: !418, file: !1, line: 143, column: 34)
!424 = !DILocation(line: 144, column: 24, scope: !422)
!425 = !DILocation(line: 144, column: 32, scope: !422)
!426 = !DILocation(line: 144, column: 27, scope: !422)
!427 = !DILocation(line: 144, column: 40, scope: !422)
!428 = !DILocation(line: 144, column: 45, scope: !422)
!429 = !DILocation(line: 144, column: 53, scope: !422)
!430 = !DILocation(line: 144, column: 48, scope: !422)
!431 = !DILocation(line: 144, column: 61, scope: !422)
!432 = !DILocation(line: 144, column: 17, scope: !423)
!433 = !DILocation(line: 145, column: 17, scope: !422)
!434 = !DILocation(line: 146, column: 24, scope: !435)
!435 = distinct !DILexicalBlock(scope: !422, file: !1, line: 146, column: 22)
!436 = !DILocation(line: 146, column: 29, scope: !435)
!437 = !DILocation(line: 146, column: 37, scope: !435)
!438 = !DILocation(line: 146, column: 32, scope: !435)
!439 = !DILocation(line: 146, column: 45, scope: !435)
!440 = !DILocation(line: 146, column: 22, scope: !422)
!441 = !DILocation(line: 147, column: 17, scope: !435)
!442 = !DILocation(line: 148, column: 27, scope: !443)
!443 = distinct !DILexicalBlock(scope: !435, file: !1, line: 148, column: 22)
!444 = !DILocation(line: 148, column: 22, scope: !443)
!445 = !DILocation(line: 148, column: 35, scope: !443)
!446 = !DILocation(line: 148, column: 40, scope: !443)
!447 = !DILocation(line: 148, column: 48, scope: !443)
!448 = !DILocation(line: 148, column: 43, scope: !443)
!449 = !DILocation(line: 148, column: 56, scope: !443)
!450 = !DILocation(line: 148, column: 65, scope: !443)
!451 = !DILocation(line: 148, column: 73, scope: !443)
!452 = !DILocation(line: 148, column: 68, scope: !443)
!453 = !DILocation(line: 148, column: 81, scope: !443)
!454 = !DILocation(line: 148, column: 22, scope: !435)
!455 = !DILocation(line: 149, column: 17, scope: !443)
!456 = !DILocation(line: 150, column: 9, scope: !423)
!457 = !DILocation(line: 153, column: 14, scope: !458)
!458 = distinct !DILexicalBlock(scope: !177, file: !1, line: 153, column: 13)
!459 = !DILocation(line: 153, column: 23, scope: !458)
!460 = !DILocation(line: 153, column: 28, scope: !458)
!461 = !DILocation(line: 153, column: 31, scope: !458)
!462 = !DILocation(line: 153, column: 40, scope: !458)
!463 = !DILocation(line: 153, column: 46, scope: !458)
!464 = !DILocation(line: 154, column: 15, scope: !458)
!465 = !DILocation(line: 154, column: 24, scope: !458)
!466 = !DILocation(line: 154, column: 38, scope: !458)
!467 = !DILocation(line: 154, column: 41, scope: !458)
!468 = !DILocation(line: 154, column: 50, scope: !458)
!469 = !DILocation(line: 154, column: 59, scope: !458)
!470 = !DILocation(line: 155, column: 15, scope: !458)
!471 = !DILocation(line: 155, column: 24, scope: !458)
!472 = !DILocation(line: 155, column: 38, scope: !458)
!473 = !DILocation(line: 155, column: 41, scope: !458)
!474 = !DILocation(line: 155, column: 50, scope: !458)
!475 = !DILocation(line: 153, column: 13, scope: !177)
!476 = !DILocation(line: 156, column: 13, scope: !458)
!477 = !DILocation(line: 159, column: 14, scope: !478)
!478 = distinct !DILexicalBlock(scope: !177, file: !1, line: 159, column: 13)
!479 = !DILocation(line: 159, column: 23, scope: !478)
!480 = !DILocation(line: 159, column: 28, scope: !478)
!481 = !DILocation(line: 159, column: 31, scope: !478)
!482 = !DILocation(line: 159, column: 40, scope: !478)
!483 = !DILocation(line: 159, column: 46, scope: !478)
!484 = !DILocation(line: 160, column: 15, scope: !478)
!485 = !DILocation(line: 160, column: 24, scope: !478)
!486 = !DILocation(line: 160, column: 34, scope: !478)
!487 = !DILocation(line: 160, column: 37, scope: !478)
!488 = !DILocation(line: 160, column: 46, scope: !478)
!489 = !DILocation(line: 160, column: 57, scope: !478)
!490 = !DILocation(line: 161, column: 15, scope: !478)
!491 = !DILocation(line: 161, column: 24, scope: !478)
!492 = !DILocation(line: 161, column: 34, scope: !478)
!493 = !DILocation(line: 161, column: 37, scope: !478)
!494 = !DILocation(line: 161, column: 46, scope: !478)
!495 = !DILocation(line: 159, column: 13, scope: !177)
!496 = !DILocation(line: 162, column: 13, scope: !478)
!497 = !DILocation(line: 165, column: 13, scope: !498)
!498 = distinct !DILexicalBlock(scope: !177, file: !1, line: 165, column: 13)
!499 = !DILocation(line: 165, column: 22, scope: !498)
!500 = !DILocation(line: 165, column: 35, scope: !498)
!501 = !DILocation(line: 166, column: 17, scope: !498)
!502 = !DILocation(line: 166, column: 21, scope: !498)
!503 = !DILocation(line: 166, column: 29, scope: !498)
!504 = !DILocation(line: 166, column: 24, scope: !498)
!505 = !DILocation(line: 166, column: 37, scope: !498)
!506 = !DILocation(line: 166, column: 42, scope: !498)
!507 = !DILocation(line: 166, column: 50, scope: !498)
!508 = !DILocation(line: 166, column: 45, scope: !498)
!509 = !DILocation(line: 166, column: 58, scope: !498)
!510 = !DILocation(line: 166, column: 67, scope: !498)
!511 = !DILocation(line: 167, column: 17, scope: !498)
!512 = !DILocation(line: 167, column: 21, scope: !498)
!513 = !DILocation(line: 167, column: 29, scope: !498)
!514 = !DILocation(line: 167, column: 24, scope: !498)
!515 = !DILocation(line: 167, column: 37, scope: !498)
!516 = !DILocation(line: 165, column: 13, scope: !177)
!517 = !DILocation(line: 168, column: 13, scope: !498)
!518 = !DILocation(line: 171, column: 13, scope: !519)
!519 = distinct !DILexicalBlock(scope: !177, file: !1, line: 171, column: 13)
!520 = !DILocation(line: 171, column: 22, scope: !519)
!521 = !DILocation(line: 171, column: 13, scope: !177)
!522 = !DILocation(line: 172, column: 19, scope: !523)
!523 = distinct !DILexicalBlock(scope: !524, file: !1, line: 172, column: 17)
!524 = distinct !DILexicalBlock(scope: !519, file: !1, line: 171, column: 32)
!525 = !DILocation(line: 172, column: 24, scope: !523)
!526 = !DILocation(line: 172, column: 32, scope: !523)
!527 = !DILocation(line: 172, column: 27, scope: !523)
!528 = !DILocation(line: 172, column: 40, scope: !523)
!529 = !DILocation(line: 172, column: 45, scope: !523)
!530 = !DILocation(line: 172, column: 53, scope: !523)
!531 = !DILocation(line: 172, column: 48, scope: !523)
!532 = !DILocation(line: 172, column: 61, scope: !523)
!533 = !DILocation(line: 172, column: 17, scope: !524)
!534 = !DILocation(line: 173, column: 17, scope: !523)
!535 = !DILocation(line: 174, column: 24, scope: !536)
!536 = distinct !DILexicalBlock(scope: !523, file: !1, line: 174, column: 22)
!537 = !DILocation(line: 174, column: 29, scope: !536)
!538 = !DILocation(line: 174, column: 37, scope: !536)
!539 = !DILocation(line: 174, column: 32, scope: !536)
!540 = !DILocation(line: 174, column: 45, scope: !536)
!541 = !DILocation(line: 174, column: 22, scope: !523)
!542 = !DILocation(line: 175, column: 17, scope: !536)
!543 = !DILocation(line: 176, column: 27, scope: !544)
!544 = distinct !DILexicalBlock(scope: !536, file: !1, line: 176, column: 22)
!545 = !DILocation(line: 176, column: 22, scope: !544)
!546 = !DILocation(line: 176, column: 35, scope: !544)
!547 = !DILocation(line: 176, column: 40, scope: !544)
!548 = !DILocation(line: 176, column: 48, scope: !544)
!549 = !DILocation(line: 176, column: 43, scope: !544)
!550 = !DILocation(line: 176, column: 56, scope: !544)
!551 = !DILocation(line: 176, column: 65, scope: !544)
!552 = !DILocation(line: 176, column: 73, scope: !544)
!553 = !DILocation(line: 176, column: 68, scope: !544)
!554 = !DILocation(line: 176, column: 81, scope: !544)
!555 = !DILocation(line: 176, column: 22, scope: !536)
!556 = !DILocation(line: 177, column: 17, scope: !544)
!557 = !DILocation(line: 178, column: 9, scope: !524)
!558 = !DILocation(line: 180, column: 5, scope: !177)
!559 = !DILocation(line: 67, column: 29, scope: !173)
!560 = !DILocation(line: 67, column: 5, scope: !173)
!561 = distinct !{!561, !174, !562}
!562 = !DILocation(line: 180, column: 5, scope: !169)
!563 = !DILocation(line: 182, column: 16, scope: !564)
!564 = distinct !DILexicalBlock(scope: !137, file: !1, line: 182, column: 9)
!565 = !DILocation(line: 182, column: 25, scope: !564)
!566 = !DILocation(line: 182, column: 35, scope: !564)
!567 = !DILocation(line: 182, column: 44, scope: !564)
!568 = !DILocation(line: 182, column: 54, scope: !564)
!569 = !DILocation(line: 183, column: 9, scope: !564)
!570 = !DILocation(line: 183, column: 19, scope: !564)
!571 = !DILocation(line: 183, column: 28, scope: !564)
!572 = !DILocation(line: 183, column: 38, scope: !564)
!573 = !DILocation(line: 182, column: 9, scope: !137)
!574 = !DILocation(line: 184, column: 9, scope: !575)
!575 = distinct !DILexicalBlock(scope: !564, file: !1, line: 183, column: 48)
!576 = !DILocation(line: 187, column: 16, scope: !577)
!577 = distinct !DILexicalBlock(scope: !137, file: !1, line: 187, column: 9)
!578 = !DILocation(line: 187, column: 28, scope: !577)
!579 = !DILocation(line: 187, column: 38, scope: !577)
!580 = !DILocation(line: 187, column: 50, scope: !577)
!581 = !DILocation(line: 187, column: 60, scope: !577)
!582 = !DILocation(line: 188, column: 9, scope: !577)
!583 = !DILocation(line: 188, column: 19, scope: !577)
!584 = !DILocation(line: 188, column: 31, scope: !577)
!585 = !DILocation(line: 188, column: 41, scope: !577)
!586 = !DILocation(line: 187, column: 9, scope: !137)
!587 = !DILocation(line: 189, column: 9, scope: !588)
!588 = distinct !DILexicalBlock(scope: !577, file: !1, line: 188, column: 54)
!589 = !DILocation(line: 192, column: 5, scope: !137)
!590 = !DILocation(line: 193, column: 1, scope: !137)
!591 = distinct !DISubprogram(name: "bruteFill", scope: !1, file: !1, line: 196, type: !592, scopeLine: 196, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !63)
!592 = !DISubroutineType(types: !593)
!593 = !{!60, !58, !60, !60}
!594 = !DILocalVariable(name: "ha", arg: 1, scope: !591, file: !1, line: 196, type: !58)
!595 = !DILocation(line: 0, scope: !591)
!596 = !DILocalVariable(name: "hno", arg: 2, scope: !591, file: !1, line: 196, type: !60)
!597 = !DILocalVariable(name: "attr", arg: 3, scope: !591, file: !1, line: 196, type: !60)
!598 = !DILocation(line: 197, column: 16, scope: !591)
!599 = !DILocalVariable(name: "stat", scope: !591, file: !1, line: 197, type: !60)
!600 = !DILocation(line: 198, column: 15, scope: !601)
!601 = distinct !DILexicalBlock(scope: !591, file: !1, line: 198, column: 9)
!602 = !DILocation(line: 198, column: 25, scope: !601)
!603 = !DILocation(line: 198, column: 34, scope: !601)
!604 = !DILocation(line: 198, column: 9, scope: !591)
!605 = !DILocation(line: 199, column: 9, scope: !601)
!606 = !DILocalVariable(name: "hb", scope: !591, file: !1, line: 201, type: !607)
!607 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 800, elements: !608)
!608 = !{!62, !62}
!609 = !DILocation(line: 201, column: 9, scope: !591)
!610 = !DILocation(line: 202, column: 5, scope: !591)
!611 = !DILocalVariable(name: "i", scope: !612, file: !1, line: 203, type: !60)
!612 = distinct !DILexicalBlock(scope: !591, file: !1, line: 203, column: 5)
!613 = !DILocation(line: 0, scope: !612)
!614 = !DILocation(line: 203, column: 10, scope: !612)
!615 = !DILocation(line: 203, column: 23, scope: !616)
!616 = distinct !DILexicalBlock(scope: !612, file: !1, line: 203, column: 5)
!617 = !DILocation(line: 203, column: 5, scope: !612)
!618 = !DILocation(line: 204, column: 9, scope: !619)
!619 = distinct !DILexicalBlock(scope: !616, file: !1, line: 203, column: 33)
!620 = !DILocation(line: 204, column: 23, scope: !619)
!621 = !DILocation(line: 205, column: 28, scope: !619)
!622 = !DILocation(line: 205, column: 16, scope: !619)
!623 = !DILocation(line: 206, column: 18, scope: !624)
!624 = distinct !DILexicalBlock(scope: !619, file: !1, line: 206, column: 13)
!625 = !DILocation(line: 206, column: 13, scope: !619)
!626 = !DILocation(line: 208, column: 22, scope: !627)
!627 = distinct !DILexicalBlock(scope: !628, file: !1, line: 208, column: 17)
!628 = distinct !DILexicalBlock(scope: !624, file: !1, line: 206, column: 30)
!629 = !DILocation(line: 208, column: 17, scope: !628)
!630 = !DILocation(line: 209, column: 33, scope: !631)
!631 = distinct !DILexicalBlock(scope: !627, file: !1, line: 208, column: 27)
!632 = !DILocalVariable(name: "nextattr", scope: !628, file: !1, line: 207, type: !60)
!633 = !DILocation(line: 0, scope: !628)
!634 = !DILocalVariable(name: "nexthno", scope: !628, file: !1, line: 207, type: !60)
!635 = !DILocation(line: 211, column: 13, scope: !631)
!636 = !DILocation(line: 213, column: 31, scope: !637)
!637 = distinct !DILexicalBlock(scope: !627, file: !1, line: 211, column: 20)
!638 = !DILocation(line: 0, scope: !627)
!639 = !DILocation(line: 216, column: 30, scope: !628)
!640 = !DILocation(line: 216, column: 20, scope: !628)
!641 = !DILocation(line: 217, column: 22, scope: !642)
!642 = distinct !DILexicalBlock(scope: !628, file: !1, line: 217, column: 17)
!643 = !DILocation(line: 217, column: 17, scope: !628)
!644 = !DILocation(line: 218, column: 17, scope: !645)
!645 = distinct !DILexicalBlock(scope: !642, file: !1, line: 217, column: 34)
!646 = !DILocation(line: 219, column: 17, scope: !645)
!647 = !DILocation(line: 221, column: 9, scope: !628)
!648 = !DILocation(line: 222, column: 5, scope: !619)
!649 = !DILocation(line: 203, column: 29, scope: !616)
!650 = !DILocation(line: 203, column: 5, scope: !616)
!651 = distinct !{!651, !617, !652}
!652 = !DILocation(line: 222, column: 5, scope: !612)
!653 = !DILocation(line: 225, column: 5, scope: !591)
!654 = !DILocation(line: 226, column: 1, scope: !591)
!655 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 229, type: !656, scopeLine: 229, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !63)
!656 = !DISubroutineType(types: !657)
!657 = !{!60}
!658 = !DILocalVariable(name: "ha", scope: !655, file: !1, line: 230, type: !607)
!659 = !DILocation(line: 230, column: 9, scope: !655)
!660 = !DILocation(line: 234, column: 15, scope: !655)
!661 = !DILocation(line: 234, column: 5, scope: !655)
!662 = !DILocation(line: 235, column: 17, scope: !655)
!663 = !DILocation(line: 235, column: 5, scope: !655)
!664 = !DILocation(line: 237, column: 5, scope: !655)
