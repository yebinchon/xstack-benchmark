; ModuleID = 'zebra-puzzle-1.c'
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
  %ha.addr = alloca [5 x i32]*, align 8
  %color = alloca [5 x i8*], align 16
  %man = alloca [5 x i8*], align 16
  %drink = alloca [5 x i8*], align 16
  %animal = alloca [5 x i8*], align 16
  %smoke = alloca [5 x i8*], align 16
  %i = alloca i32, align 4
  store [5 x i32]* %ha, [5 x i32]** %ha.addr, align 8
  call void @llvm.dbg.declare(metadata [5 x i32]** %ha.addr, metadata !64, metadata !DIExpression()), !dbg !65
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
  call void @llvm.dbg.declare(metadata i32* %i, metadata !81, metadata !DIExpression()), !dbg !83
  store i32 0, i32* %i, align 4, !dbg !83
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc, %entry
  %35 = load i32, i32* %i, align 4, !dbg !85
  %cmp = icmp slt i32 %35, 5, !dbg !87
  br i1 %cmp, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  %36 = load i32, i32* %i, align 4, !dbg !89
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.32, i64 0, i64 0), i32 %36), !dbg !91
  %37 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !92
  %38 = load i32, i32* %i, align 4, !dbg !94
  %idxprom = sext i32 %38 to i64, !dbg !92
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %37, i64 %idxprom, !dbg !92
  %arrayidx2 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx, i64 0, i64 0, !dbg !92
  %39 = load i32, i32* %arrayidx2, align 4, !dbg !92
  %cmp3 = icmp sge i32 %39, 0, !dbg !95
  br i1 %cmp3, label %if.then, label %if.else, !dbg !96, !cf.info !97

if.then:                                          ; preds = %for.body
  %40 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !98
  %41 = load i32, i32* %i, align 4, !dbg !99
  %idxprom4 = sext i32 %41 to i64, !dbg !98
  %arrayidx5 = getelementptr inbounds [5 x i32], [5 x i32]* %40, i64 %idxprom4, !dbg !98
  %arrayidx6 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx5, i64 0, i64 0, !dbg !98
  %42 = load i32, i32* %arrayidx6, align 4, !dbg !98
  %idxprom7 = sext i32 %42 to i64, !dbg !100
  %arrayidx8 = getelementptr inbounds [5 x i8*], [5 x i8*]* %color, i64 0, i64 %idxprom7, !dbg !100
  %43 = load i8*, i8** %arrayidx8, align 8, !dbg !100
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i64 0, i64 0), i8* %43), !dbg !101
  br label %if.end, !dbg !101

if.else:                                          ; preds = %for.body
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.34, i64 0, i64 0)), !dbg !102
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %44 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !103
  %45 = load i32, i32* %i, align 4, !dbg !105
  %idxprom11 = sext i32 %45 to i64, !dbg !103
  %arrayidx12 = getelementptr inbounds [5 x i32], [5 x i32]* %44, i64 %idxprom11, !dbg !103
  %arrayidx13 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx12, i64 0, i64 1, !dbg !103
  %46 = load i32, i32* %arrayidx13, align 4, !dbg !103
  %cmp14 = icmp sge i32 %46, 0, !dbg !106
  br i1 %cmp14, label %if.then15, label %if.else22, !dbg !107, !cf.info !97

if.then15:                                        ; preds = %if.end
  %47 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !108
  %48 = load i32, i32* %i, align 4, !dbg !109
  %idxprom16 = sext i32 %48 to i64, !dbg !108
  %arrayidx17 = getelementptr inbounds [5 x i32], [5 x i32]* %47, i64 %idxprom16, !dbg !108
  %arrayidx18 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx17, i64 0, i64 1, !dbg !108
  %49 = load i32, i32* %arrayidx18, align 4, !dbg !108
  %idxprom19 = sext i32 %49 to i64, !dbg !110
  %arrayidx20 = getelementptr inbounds [5 x i8*], [5 x i8*]* %man, i64 0, i64 %idxprom19, !dbg !110
  %50 = load i8*, i8** %arrayidx20, align 8, !dbg !110
  %call21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i64 0, i64 0), i8* %50), !dbg !111
  br label %if.end24, !dbg !111

if.else22:                                        ; preds = %if.end
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.34, i64 0, i64 0)), !dbg !112
  br label %if.end24

if.end24:                                         ; preds = %if.else22, %if.then15
  %51 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !113
  %52 = load i32, i32* %i, align 4, !dbg !115
  %idxprom25 = sext i32 %52 to i64, !dbg !113
  %arrayidx26 = getelementptr inbounds [5 x i32], [5 x i32]* %51, i64 %idxprom25, !dbg !113
  %arrayidx27 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx26, i64 0, i64 2, !dbg !113
  %53 = load i32, i32* %arrayidx27, align 4, !dbg !113
  %cmp28 = icmp sge i32 %53, 0, !dbg !116
  br i1 %cmp28, label %if.then29, label %if.else36, !dbg !117, !cf.info !97

if.then29:                                        ; preds = %if.end24
  %54 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !118
  %55 = load i32, i32* %i, align 4, !dbg !119
  %idxprom30 = sext i32 %55 to i64, !dbg !118
  %arrayidx31 = getelementptr inbounds [5 x i32], [5 x i32]* %54, i64 %idxprom30, !dbg !118
  %arrayidx32 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx31, i64 0, i64 2, !dbg !118
  %56 = load i32, i32* %arrayidx32, align 4, !dbg !118
  %idxprom33 = sext i32 %56 to i64, !dbg !120
  %arrayidx34 = getelementptr inbounds [5 x i8*], [5 x i8*]* %drink, i64 0, i64 %idxprom33, !dbg !120
  %57 = load i8*, i8** %arrayidx34, align 8, !dbg !120
  %call35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i64 0, i64 0), i8* %57), !dbg !121
  br label %if.end38, !dbg !121

if.else36:                                        ; preds = %if.end24
  %call37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.34, i64 0, i64 0)), !dbg !122
  br label %if.end38

if.end38:                                         ; preds = %if.else36, %if.then29
  %58 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !123
  %59 = load i32, i32* %i, align 4, !dbg !125
  %idxprom39 = sext i32 %59 to i64, !dbg !123
  %arrayidx40 = getelementptr inbounds [5 x i32], [5 x i32]* %58, i64 %idxprom39, !dbg !123
  %arrayidx41 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx40, i64 0, i64 3, !dbg !123
  %60 = load i32, i32* %arrayidx41, align 4, !dbg !123
  %cmp42 = icmp sge i32 %60, 0, !dbg !126
  br i1 %cmp42, label %if.then43, label %if.else50, !dbg !127, !cf.info !97

if.then43:                                        ; preds = %if.end38
  %61 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !128
  %62 = load i32, i32* %i, align 4, !dbg !129
  %idxprom44 = sext i32 %62 to i64, !dbg !128
  %arrayidx45 = getelementptr inbounds [5 x i32], [5 x i32]* %61, i64 %idxprom44, !dbg !128
  %arrayidx46 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx45, i64 0, i64 3, !dbg !128
  %63 = load i32, i32* %arrayidx46, align 4, !dbg !128
  %idxprom47 = sext i32 %63 to i64, !dbg !130
  %arrayidx48 = getelementptr inbounds [5 x i8*], [5 x i8*]* %animal, i64 0, i64 %idxprom47, !dbg !130
  %64 = load i8*, i8** %arrayidx48, align 8, !dbg !130
  %call49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i64 0, i64 0), i8* %64), !dbg !131
  br label %if.end52, !dbg !131

if.else50:                                        ; preds = %if.end38
  %call51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.34, i64 0, i64 0)), !dbg !132
  br label %if.end52

if.end52:                                         ; preds = %if.else50, %if.then43
  %65 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !133
  %66 = load i32, i32* %i, align 4, !dbg !135
  %idxprom53 = sext i32 %66 to i64, !dbg !133
  %arrayidx54 = getelementptr inbounds [5 x i32], [5 x i32]* %65, i64 %idxprom53, !dbg !133
  %arrayidx55 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx54, i64 0, i64 4, !dbg !133
  %67 = load i32, i32* %arrayidx55, align 4, !dbg !133
  %cmp56 = icmp sge i32 %67, 0, !dbg !136
  br i1 %cmp56, label %if.then57, label %if.else64, !dbg !137, !cf.info !97

if.then57:                                        ; preds = %if.end52
  %68 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !138
  %69 = load i32, i32* %i, align 4, !dbg !139
  %idxprom58 = sext i32 %69 to i64, !dbg !138
  %arrayidx59 = getelementptr inbounds [5 x i32], [5 x i32]* %68, i64 %idxprom58, !dbg !138
  %arrayidx60 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx59, i64 0, i64 4, !dbg !138
  %70 = load i32, i32* %arrayidx60, align 4, !dbg !138
  %idxprom61 = sext i32 %70 to i64, !dbg !140
  %arrayidx62 = getelementptr inbounds [5 x i8*], [5 x i8*]* %smoke, i64 0, i64 %idxprom61, !dbg !140
  %71 = load i8*, i8** %arrayidx62, align 8, !dbg !140
  %call63 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.35, i64 0, i64 0), i8* %71), !dbg !141
  br label %if.end66, !dbg !141

if.else64:                                        ; preds = %if.end52
  %call65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.36, i64 0, i64 0)), !dbg !142
  br label %if.end66

if.end66:                                         ; preds = %if.else64, %if.then57
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %if.end66
  %72 = load i32, i32* %i, align 4, !dbg !144
  %inc = add nsw i32 %72, 1, !dbg !144
  store i32 %inc, i32* %i, align 4, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  ret void, !dbg !148
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @checkHouses([5 x i32]* %ha) #0 !dbg !149 {
entry:
  %retval = alloca i32, align 4
  %ha.addr = alloca [5 x i32]*, align 8
  %c_add = alloca i32, align 4
  %c_or = alloca i32, align 4
  %m_add = alloca i32, align 4
  %m_or = alloca i32, align 4
  %d_add = alloca i32, align 4
  %d_or = alloca i32, align 4
  %a_add = alloca i32, align 4
  %a_or = alloca i32, align 4
  %s_add = alloca i32, align 4
  %s_or = alloca i32, align 4
  %i = alloca i32, align 4
  store [5 x i32]* %ha, [5 x i32]** %ha.addr, align 8
  call void @llvm.dbg.declare(metadata [5 x i32]** %ha.addr, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata i32* %c_add, metadata !154, metadata !DIExpression()), !dbg !155
  store i32 0, i32* %c_add, align 4, !dbg !155
  call void @llvm.dbg.declare(metadata i32* %c_or, metadata !156, metadata !DIExpression()), !dbg !157
  store i32 0, i32* %c_or, align 4, !dbg !157
  call void @llvm.dbg.declare(metadata i32* %m_add, metadata !158, metadata !DIExpression()), !dbg !159
  store i32 0, i32* %m_add, align 4, !dbg !159
  call void @llvm.dbg.declare(metadata i32* %m_or, metadata !160, metadata !DIExpression()), !dbg !161
  store i32 0, i32* %m_or, align 4, !dbg !161
  call void @llvm.dbg.declare(metadata i32* %d_add, metadata !162, metadata !DIExpression()), !dbg !163
  store i32 0, i32* %d_add, align 4, !dbg !163
  call void @llvm.dbg.declare(metadata i32* %d_or, metadata !164, metadata !DIExpression()), !dbg !165
  store i32 0, i32* %d_or, align 4, !dbg !165
  call void @llvm.dbg.declare(metadata i32* %a_add, metadata !166, metadata !DIExpression()), !dbg !167
  store i32 0, i32* %a_add, align 4, !dbg !167
  call void @llvm.dbg.declare(metadata i32* %a_or, metadata !168, metadata !DIExpression()), !dbg !169
  store i32 0, i32* %a_or, align 4, !dbg !169
  call void @llvm.dbg.declare(metadata i32* %s_add, metadata !170, metadata !DIExpression()), !dbg !171
  store i32 0, i32* %s_add, align 4, !dbg !171
  call void @llvm.dbg.declare(metadata i32* %s_or, metadata !172, metadata !DIExpression()), !dbg !173
  store i32 0, i32* %s_or, align 4, !dbg !173
  %0 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !174
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %0, i64 2, !dbg !174
  %arrayidx1 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx, i64 0, i64 2, !dbg !174
  %1 = load i32, i32* %arrayidx1, align 4, !dbg !174
  %cmp = icmp sge i32 %1, 0, !dbg !176
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !177, !cf.info !97

land.lhs.true:                                    ; preds = %entry
  %2 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !178
  %arrayidx2 = getelementptr inbounds [5 x i32], [5 x i32]* %2, i64 2, !dbg !178
  %arrayidx3 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx2, i64 0, i64 2, !dbg !178
  %3 = load i32, i32* %arrayidx3, align 4, !dbg !178
  %cmp4 = icmp ne i32 %3, 2, !dbg !179
  br i1 %cmp4, label %if.then, label %if.end, !dbg !180, !cf.info !97

if.then:                                          ; preds = %land.lhs.true
  store i32 0, i32* %retval, align 4, !dbg !181
  br label %return, !dbg !181

if.end:                                           ; preds = %land.lhs.true, %entry
  %4 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !182
  %arrayidx5 = getelementptr inbounds [5 x i32], [5 x i32]* %4, i64 0, !dbg !182
  %arrayidx6 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx5, i64 0, i64 1, !dbg !182
  %5 = load i32, i32* %arrayidx6, align 4, !dbg !182
  %cmp7 = icmp sge i32 %5, 0, !dbg !184
  br i1 %cmp7, label %land.lhs.true8, label %if.end13, !dbg !185, !cf.info !97

land.lhs.true8:                                   ; preds = %if.end
  %6 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !186
  %arrayidx9 = getelementptr inbounds [5 x i32], [5 x i32]* %6, i64 0, !dbg !186
  %arrayidx10 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx9, i64 0, i64 1, !dbg !186
  %7 = load i32, i32* %arrayidx10, align 4, !dbg !186
  %cmp11 = icmp ne i32 %7, 4, !dbg !187
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !188, !cf.info !97

if.then12:                                        ; preds = %land.lhs.true8
  store i32 0, i32* %retval, align 4, !dbg !189
  br label %return, !dbg !189

if.end13:                                         ; preds = %land.lhs.true8, %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !190, metadata !DIExpression()), !dbg !192
  store i32 0, i32* %i, align 4, !dbg !192
  br label %for.cond, !dbg !193

for.cond:                                         ; preds = %for.inc, %if.end13
  %8 = load i32, i32* %i, align 4, !dbg !194
  %cmp14 = icmp slt i32 %8, 5, !dbg !196
  br i1 %cmp14, label %for.body, label %for.end, !dbg !197

for.body:                                         ; preds = %for.cond
  %9 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !198
  %10 = load i32, i32* %i, align 4, !dbg !201
  %idxprom = sext i32 %10 to i64, !dbg !198
  %arrayidx15 = getelementptr inbounds [5 x i32], [5 x i32]* %9, i64 %idxprom, !dbg !198
  %arrayidx16 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx15, i64 0, i64 0, !dbg !198
  %11 = load i32, i32* %arrayidx16, align 4, !dbg !198
  %cmp17 = icmp sge i32 %11, 0, !dbg !202
  br i1 %cmp17, label %if.then18, label %if.end26, !dbg !203, !cf.info !97

if.then18:                                        ; preds = %for.body
  %12 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !204
  %13 = load i32, i32* %i, align 4, !dbg !206
  %idxprom19 = sext i32 %13 to i64, !dbg !204
  %arrayidx20 = getelementptr inbounds [5 x i32], [5 x i32]* %12, i64 %idxprom19, !dbg !204
  %arrayidx21 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx20, i64 0, i64 0, !dbg !204
  %14 = load i32, i32* %arrayidx21, align 4, !dbg !204
  %shl = shl i32 1, %14, !dbg !207
  %15 = load i32, i32* %c_add, align 4, !dbg !208
  %add = add nsw i32 %15, %shl, !dbg !208
  store i32 %add, i32* %c_add, align 4, !dbg !208
  %16 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !209
  %17 = load i32, i32* %i, align 4, !dbg !210
  %idxprom22 = sext i32 %17 to i64, !dbg !209
  %arrayidx23 = getelementptr inbounds [5 x i32], [5 x i32]* %16, i64 %idxprom22, !dbg !209
  %arrayidx24 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx23, i64 0, i64 0, !dbg !209
  %18 = load i32, i32* %arrayidx24, align 4, !dbg !209
  %shl25 = shl i32 1, %18, !dbg !211
  %19 = load i32, i32* %c_or, align 4, !dbg !212
  %or = or i32 %19, %shl25, !dbg !212
  store i32 %or, i32* %c_or, align 4, !dbg !212
  br label %if.end26, !dbg !213

if.end26:                                         ; preds = %if.then18, %for.body
  %20 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !214
  %21 = load i32, i32* %i, align 4, !dbg !216
  %idxprom27 = sext i32 %21 to i64, !dbg !214
  %arrayidx28 = getelementptr inbounds [5 x i32], [5 x i32]* %20, i64 %idxprom27, !dbg !214
  %arrayidx29 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx28, i64 0, i64 1, !dbg !214
  %22 = load i32, i32* %arrayidx29, align 4, !dbg !214
  %cmp30 = icmp sge i32 %22, 0, !dbg !217
  br i1 %cmp30, label %if.then31, label %if.end42, !dbg !218, !cf.info !97

if.then31:                                        ; preds = %if.end26
  %23 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !219
  %24 = load i32, i32* %i, align 4, !dbg !221
  %idxprom32 = sext i32 %24 to i64, !dbg !219
  %arrayidx33 = getelementptr inbounds [5 x i32], [5 x i32]* %23, i64 %idxprom32, !dbg !219
  %arrayidx34 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx33, i64 0, i64 1, !dbg !219
  %25 = load i32, i32* %arrayidx34, align 4, !dbg !219
  %shl35 = shl i32 1, %25, !dbg !222
  %26 = load i32, i32* %m_add, align 4, !dbg !223
  %add36 = add nsw i32 %26, %shl35, !dbg !223
  store i32 %add36, i32* %m_add, align 4, !dbg !223
  %27 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !224
  %28 = load i32, i32* %i, align 4, !dbg !225
  %idxprom37 = sext i32 %28 to i64, !dbg !224
  %arrayidx38 = getelementptr inbounds [5 x i32], [5 x i32]* %27, i64 %idxprom37, !dbg !224
  %arrayidx39 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx38, i64 0, i64 1, !dbg !224
  %29 = load i32, i32* %arrayidx39, align 4, !dbg !224
  %shl40 = shl i32 1, %29, !dbg !226
  %30 = load i32, i32* %m_or, align 4, !dbg !227
  %or41 = or i32 %30, %shl40, !dbg !227
  store i32 %or41, i32* %m_or, align 4, !dbg !227
  br label %if.end42, !dbg !228

if.end42:                                         ; preds = %if.then31, %if.end26
  %31 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !229
  %32 = load i32, i32* %i, align 4, !dbg !231
  %idxprom43 = sext i32 %32 to i64, !dbg !229
  %arrayidx44 = getelementptr inbounds [5 x i32], [5 x i32]* %31, i64 %idxprom43, !dbg !229
  %arrayidx45 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx44, i64 0, i64 2, !dbg !229
  %33 = load i32, i32* %arrayidx45, align 4, !dbg !229
  %cmp46 = icmp sge i32 %33, 0, !dbg !232
  br i1 %cmp46, label %if.then47, label %if.end58, !dbg !233, !cf.info !97

if.then47:                                        ; preds = %if.end42
  %34 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !234
  %35 = load i32, i32* %i, align 4, !dbg !236
  %idxprom48 = sext i32 %35 to i64, !dbg !234
  %arrayidx49 = getelementptr inbounds [5 x i32], [5 x i32]* %34, i64 %idxprom48, !dbg !234
  %arrayidx50 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx49, i64 0, i64 2, !dbg !234
  %36 = load i32, i32* %arrayidx50, align 4, !dbg !234
  %shl51 = shl i32 1, %36, !dbg !237
  %37 = load i32, i32* %d_add, align 4, !dbg !238
  %add52 = add nsw i32 %37, %shl51, !dbg !238
  store i32 %add52, i32* %d_add, align 4, !dbg !238
  %38 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !239
  %39 = load i32, i32* %i, align 4, !dbg !240
  %idxprom53 = sext i32 %39 to i64, !dbg !239
  %arrayidx54 = getelementptr inbounds [5 x i32], [5 x i32]* %38, i64 %idxprom53, !dbg !239
  %arrayidx55 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx54, i64 0, i64 2, !dbg !239
  %40 = load i32, i32* %arrayidx55, align 4, !dbg !239
  %shl56 = shl i32 1, %40, !dbg !241
  %41 = load i32, i32* %d_or, align 4, !dbg !242
  %or57 = or i32 %41, %shl56, !dbg !242
  store i32 %or57, i32* %d_or, align 4, !dbg !242
  br label %if.end58, !dbg !243

if.end58:                                         ; preds = %if.then47, %if.end42
  %42 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !244
  %43 = load i32, i32* %i, align 4, !dbg !246
  %idxprom59 = sext i32 %43 to i64, !dbg !244
  %arrayidx60 = getelementptr inbounds [5 x i32], [5 x i32]* %42, i64 %idxprom59, !dbg !244
  %arrayidx61 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx60, i64 0, i64 3, !dbg !244
  %44 = load i32, i32* %arrayidx61, align 4, !dbg !244
  %cmp62 = icmp sge i32 %44, 0, !dbg !247
  br i1 %cmp62, label %if.then63, label %if.end74, !dbg !248, !cf.info !97

if.then63:                                        ; preds = %if.end58
  %45 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !249
  %46 = load i32, i32* %i, align 4, !dbg !251
  %idxprom64 = sext i32 %46 to i64, !dbg !249
  %arrayidx65 = getelementptr inbounds [5 x i32], [5 x i32]* %45, i64 %idxprom64, !dbg !249
  %arrayidx66 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx65, i64 0, i64 3, !dbg !249
  %47 = load i32, i32* %arrayidx66, align 4, !dbg !249
  %shl67 = shl i32 1, %47, !dbg !252
  %48 = load i32, i32* %a_add, align 4, !dbg !253
  %add68 = add nsw i32 %48, %shl67, !dbg !253
  store i32 %add68, i32* %a_add, align 4, !dbg !253
  %49 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !254
  %50 = load i32, i32* %i, align 4, !dbg !255
  %idxprom69 = sext i32 %50 to i64, !dbg !254
  %arrayidx70 = getelementptr inbounds [5 x i32], [5 x i32]* %49, i64 %idxprom69, !dbg !254
  %arrayidx71 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx70, i64 0, i64 3, !dbg !254
  %51 = load i32, i32* %arrayidx71, align 4, !dbg !254
  %shl72 = shl i32 1, %51, !dbg !256
  %52 = load i32, i32* %a_or, align 4, !dbg !257
  %or73 = or i32 %52, %shl72, !dbg !257
  store i32 %or73, i32* %a_or, align 4, !dbg !257
  br label %if.end74, !dbg !258

if.end74:                                         ; preds = %if.then63, %if.end58
  %53 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !259
  %54 = load i32, i32* %i, align 4, !dbg !261
  %idxprom75 = sext i32 %54 to i64, !dbg !259
  %arrayidx76 = getelementptr inbounds [5 x i32], [5 x i32]* %53, i64 %idxprom75, !dbg !259
  %arrayidx77 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx76, i64 0, i64 4, !dbg !259
  %55 = load i32, i32* %arrayidx77, align 4, !dbg !259
  %cmp78 = icmp sge i32 %55, 0, !dbg !262
  br i1 %cmp78, label %if.then79, label %if.end90, !dbg !263, !cf.info !97

if.then79:                                        ; preds = %if.end74
  %56 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !264
  %57 = load i32, i32* %i, align 4, !dbg !266
  %idxprom80 = sext i32 %57 to i64, !dbg !264
  %arrayidx81 = getelementptr inbounds [5 x i32], [5 x i32]* %56, i64 %idxprom80, !dbg !264
  %arrayidx82 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx81, i64 0, i64 4, !dbg !264
  %58 = load i32, i32* %arrayidx82, align 4, !dbg !264
  %shl83 = shl i32 1, %58, !dbg !267
  %59 = load i32, i32* %s_add, align 4, !dbg !268
  %add84 = add nsw i32 %59, %shl83, !dbg !268
  store i32 %add84, i32* %s_add, align 4, !dbg !268
  %60 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !269
  %61 = load i32, i32* %i, align 4, !dbg !270
  %idxprom85 = sext i32 %61 to i64, !dbg !269
  %arrayidx86 = getelementptr inbounds [5 x i32], [5 x i32]* %60, i64 %idxprom85, !dbg !269
  %arrayidx87 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx86, i64 0, i64 4, !dbg !269
  %62 = load i32, i32* %arrayidx87, align 4, !dbg !269
  %shl88 = shl i32 1, %62, !dbg !271
  %63 = load i32, i32* %s_or, align 4, !dbg !272
  %or89 = or i32 %63, %shl88, !dbg !272
  store i32 %or89, i32* %s_or, align 4, !dbg !272
  br label %if.end90, !dbg !273

if.end90:                                         ; preds = %if.then79, %if.end74
  %64 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !274
  %65 = load i32, i32* %i, align 4, !dbg !276
  %idxprom91 = sext i32 %65 to i64, !dbg !274
  %arrayidx92 = getelementptr inbounds [5 x i32], [5 x i32]* %64, i64 %idxprom91, !dbg !274
  %arrayidx93 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx92, i64 0, i64 1, !dbg !274
  %66 = load i32, i32* %arrayidx93, align 4, !dbg !274
  %cmp94 = icmp sge i32 %66, 0, !dbg !277
  br i1 %cmp94, label %land.lhs.true95, label %if.end120, !dbg !278, !cf.info !97

land.lhs.true95:                                  ; preds = %if.end90
  %67 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !279
  %68 = load i32, i32* %i, align 4, !dbg !280
  %idxprom96 = sext i32 %68 to i64, !dbg !279
  %arrayidx97 = getelementptr inbounds [5 x i32], [5 x i32]* %67, i64 %idxprom96, !dbg !279
  %arrayidx98 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx97, i64 0, i64 0, !dbg !279
  %69 = load i32, i32* %arrayidx98, align 4, !dbg !279
  %cmp99 = icmp sge i32 %69, 0, !dbg !281
  br i1 %cmp99, label %land.lhs.true100, label %if.end120, !dbg !282, !cf.info !97

land.lhs.true100:                                 ; preds = %land.lhs.true95
  %70 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !283
  %71 = load i32, i32* %i, align 4, !dbg !284
  %idxprom101 = sext i32 %71 to i64, !dbg !283
  %arrayidx102 = getelementptr inbounds [5 x i32], [5 x i32]* %70, i64 %idxprom101, !dbg !283
  %arrayidx103 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx102, i64 0, i64 1, !dbg !283
  %72 = load i32, i32* %arrayidx103, align 4, !dbg !283
  %cmp104 = icmp eq i32 %72, 0, !dbg !285
  br i1 %cmp104, label %land.lhs.true105, label %lor.lhs.false, !dbg !286, !cf.info !97

land.lhs.true105:                                 ; preds = %land.lhs.true100
  %73 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !287
  %74 = load i32, i32* %i, align 4, !dbg !288
  %idxprom106 = sext i32 %74 to i64, !dbg !287
  %arrayidx107 = getelementptr inbounds [5 x i32], [5 x i32]* %73, i64 %idxprom106, !dbg !287
  %arrayidx108 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx107, i64 0, i64 0, !dbg !287
  %75 = load i32, i32* %arrayidx108, align 4, !dbg !287
  %cmp109 = icmp ne i32 %75, 0, !dbg !289
  br i1 %cmp109, label %if.then119, label %lor.lhs.false, !dbg !290, !cf.info !97

lor.lhs.false:                                    ; preds = %land.lhs.true105, %land.lhs.true100
  %76 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !291
  %77 = load i32, i32* %i, align 4, !dbg !292
  %idxprom110 = sext i32 %77 to i64, !dbg !291
  %arrayidx111 = getelementptr inbounds [5 x i32], [5 x i32]* %76, i64 %idxprom110, !dbg !291
  %arrayidx112 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx111, i64 0, i64 1, !dbg !291
  %78 = load i32, i32* %arrayidx112, align 4, !dbg !291
  %cmp113 = icmp ne i32 %78, 0, !dbg !293
  br i1 %cmp113, label %land.lhs.true114, label %if.end120, !dbg !294, !cf.info !97

land.lhs.true114:                                 ; preds = %lor.lhs.false
  %79 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !295
  %80 = load i32, i32* %i, align 4, !dbg !296
  %idxprom115 = sext i32 %80 to i64, !dbg !295
  %arrayidx116 = getelementptr inbounds [5 x i32], [5 x i32]* %79, i64 %idxprom115, !dbg !295
  %arrayidx117 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx116, i64 0, i64 0, !dbg !295
  %81 = load i32, i32* %arrayidx117, align 4, !dbg !295
  %cmp118 = icmp eq i32 %81, 0, !dbg !297
  br i1 %cmp118, label %if.then119, label %if.end120, !dbg !298, !cf.info !97

if.then119:                                       ; preds = %land.lhs.true114, %land.lhs.true105
  store i32 0, i32* %retval, align 4, !dbg !299
  br label %return, !dbg !299

if.end120:                                        ; preds = %land.lhs.true114, %lor.lhs.false, %land.lhs.true95, %if.end90
  %82 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !300
  %83 = load i32, i32* %i, align 4, !dbg !302
  %idxprom121 = sext i32 %83 to i64, !dbg !300
  %arrayidx122 = getelementptr inbounds [5 x i32], [5 x i32]* %82, i64 %idxprom121, !dbg !300
  %arrayidx123 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx122, i64 0, i64 1, !dbg !300
  %84 = load i32, i32* %arrayidx123, align 4, !dbg !300
  %cmp124 = icmp sge i32 %84, 0, !dbg !303
  br i1 %cmp124, label %land.lhs.true125, label %if.end151, !dbg !304, !cf.info !97

land.lhs.true125:                                 ; preds = %if.end120
  %85 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !305
  %86 = load i32, i32* %i, align 4, !dbg !306
  %idxprom126 = sext i32 %86 to i64, !dbg !305
  %arrayidx127 = getelementptr inbounds [5 x i32], [5 x i32]* %85, i64 %idxprom126, !dbg !305
  %arrayidx128 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx127, i64 0, i64 3, !dbg !305
  %87 = load i32, i32* %arrayidx128, align 4, !dbg !305
  %cmp129 = icmp sge i32 %87, 0, !dbg !307
  br i1 %cmp129, label %land.lhs.true130, label %if.end151, !dbg !308, !cf.info !97

land.lhs.true130:                                 ; preds = %land.lhs.true125
  %88 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !309
  %89 = load i32, i32* %i, align 4, !dbg !310
  %idxprom131 = sext i32 %89 to i64, !dbg !309
  %arrayidx132 = getelementptr inbounds [5 x i32], [5 x i32]* %88, i64 %idxprom131, !dbg !309
  %arrayidx133 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx132, i64 0, i64 1, !dbg !309
  %90 = load i32, i32* %arrayidx133, align 4, !dbg !309
  %cmp134 = icmp eq i32 %90, 1, !dbg !311
  br i1 %cmp134, label %land.lhs.true135, label %lor.lhs.false140, !dbg !312, !cf.info !97

land.lhs.true135:                                 ; preds = %land.lhs.true130
  %91 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !313
  %92 = load i32, i32* %i, align 4, !dbg !314
  %idxprom136 = sext i32 %92 to i64, !dbg !313
  %arrayidx137 = getelementptr inbounds [5 x i32], [5 x i32]* %91, i64 %idxprom136, !dbg !313
  %arrayidx138 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx137, i64 0, i64 3, !dbg !313
  %93 = load i32, i32* %arrayidx138, align 4, !dbg !313
  %cmp139 = icmp ne i32 %93, 0, !dbg !315
  br i1 %cmp139, label %if.then150, label %lor.lhs.false140, !dbg !316, !cf.info !97

lor.lhs.false140:                                 ; preds = %land.lhs.true135, %land.lhs.true130
  %94 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !317
  %95 = load i32, i32* %i, align 4, !dbg !318
  %idxprom141 = sext i32 %95 to i64, !dbg !317
  %arrayidx142 = getelementptr inbounds [5 x i32], [5 x i32]* %94, i64 %idxprom141, !dbg !317
  %arrayidx143 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx142, i64 0, i64 1, !dbg !317
  %96 = load i32, i32* %arrayidx143, align 4, !dbg !317
  %cmp144 = icmp ne i32 %96, 1, !dbg !319
  br i1 %cmp144, label %land.lhs.true145, label %if.end151, !dbg !320, !cf.info !97

land.lhs.true145:                                 ; preds = %lor.lhs.false140
  %97 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !321
  %98 = load i32, i32* %i, align 4, !dbg !322
  %idxprom146 = sext i32 %98 to i64, !dbg !321
  %arrayidx147 = getelementptr inbounds [5 x i32], [5 x i32]* %97, i64 %idxprom146, !dbg !321
  %arrayidx148 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx147, i64 0, i64 3, !dbg !321
  %99 = load i32, i32* %arrayidx148, align 4, !dbg !321
  %cmp149 = icmp eq i32 %99, 0, !dbg !323
  br i1 %cmp149, label %if.then150, label %if.end151, !dbg !324, !cf.info !97

if.then150:                                       ; preds = %land.lhs.true145, %land.lhs.true135
  store i32 0, i32* %retval, align 4, !dbg !325
  br label %return, !dbg !325

if.end151:                                        ; preds = %land.lhs.true145, %lor.lhs.false140, %land.lhs.true125, %if.end120
  %100 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !326
  %101 = load i32, i32* %i, align 4, !dbg !328
  %idxprom152 = sext i32 %101 to i64, !dbg !326
  %arrayidx153 = getelementptr inbounds [5 x i32], [5 x i32]* %100, i64 %idxprom152, !dbg !326
  %arrayidx154 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx153, i64 0, i64 1, !dbg !326
  %102 = load i32, i32* %arrayidx154, align 4, !dbg !326
  %cmp155 = icmp sge i32 %102, 0, !dbg !329
  br i1 %cmp155, label %land.lhs.true156, label %if.end182, !dbg !330, !cf.info !97

land.lhs.true156:                                 ; preds = %if.end151
  %103 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !331
  %104 = load i32, i32* %i, align 4, !dbg !332
  %idxprom157 = sext i32 %104 to i64, !dbg !331
  %arrayidx158 = getelementptr inbounds [5 x i32], [5 x i32]* %103, i64 %idxprom157, !dbg !331
  %arrayidx159 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx158, i64 0, i64 2, !dbg !331
  %105 = load i32, i32* %arrayidx159, align 4, !dbg !331
  %cmp160 = icmp sge i32 %105, 0, !dbg !333
  br i1 %cmp160, label %land.lhs.true161, label %if.end182, !dbg !334, !cf.info !97

land.lhs.true161:                                 ; preds = %land.lhs.true156
  %106 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !335
  %107 = load i32, i32* %i, align 4, !dbg !336
  %idxprom162 = sext i32 %107 to i64, !dbg !335
  %arrayidx163 = getelementptr inbounds [5 x i32], [5 x i32]* %106, i64 %idxprom162, !dbg !335
  %arrayidx164 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx163, i64 0, i64 1, !dbg !335
  %108 = load i32, i32* %arrayidx164, align 4, !dbg !335
  %cmp165 = icmp eq i32 %108, 2, !dbg !337
  br i1 %cmp165, label %land.lhs.true166, label %lor.lhs.false171, !dbg !338, !cf.info !97

land.lhs.true166:                                 ; preds = %land.lhs.true161
  %109 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !339
  %110 = load i32, i32* %i, align 4, !dbg !340
  %idxprom167 = sext i32 %110 to i64, !dbg !339
  %arrayidx168 = getelementptr inbounds [5 x i32], [5 x i32]* %109, i64 %idxprom167, !dbg !339
  %arrayidx169 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx168, i64 0, i64 2, !dbg !339
  %111 = load i32, i32* %arrayidx169, align 4, !dbg !339
  %cmp170 = icmp ne i32 %111, 0, !dbg !341
  br i1 %cmp170, label %if.then181, label %lor.lhs.false171, !dbg !342, !cf.info !97

lor.lhs.false171:                                 ; preds = %land.lhs.true166, %land.lhs.true161
  %112 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !343
  %113 = load i32, i32* %i, align 4, !dbg !344
  %idxprom172 = sext i32 %113 to i64, !dbg !343
  %arrayidx173 = getelementptr inbounds [5 x i32], [5 x i32]* %112, i64 %idxprom172, !dbg !343
  %arrayidx174 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx173, i64 0, i64 1, !dbg !343
  %114 = load i32, i32* %arrayidx174, align 4, !dbg !343
  %cmp175 = icmp ne i32 %114, 2, !dbg !345
  br i1 %cmp175, label %land.lhs.true176, label %if.end182, !dbg !346, !cf.info !97

land.lhs.true176:                                 ; preds = %lor.lhs.false171
  %115 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !347
  %116 = load i32, i32* %i, align 4, !dbg !348
  %idxprom177 = sext i32 %116 to i64, !dbg !347
  %arrayidx178 = getelementptr inbounds [5 x i32], [5 x i32]* %115, i64 %idxprom177, !dbg !347
  %arrayidx179 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx178, i64 0, i64 2, !dbg !347
  %117 = load i32, i32* %arrayidx179, align 4, !dbg !347
  %cmp180 = icmp eq i32 %117, 0, !dbg !349
  br i1 %cmp180, label %if.then181, label %if.end182, !dbg !350, !cf.info !97

if.then181:                                       ; preds = %land.lhs.true176, %land.lhs.true166
  store i32 0, i32* %retval, align 4, !dbg !351
  br label %return, !dbg !351

if.end182:                                        ; preds = %land.lhs.true176, %lor.lhs.false171, %land.lhs.true156, %if.end151
  %118 = load i32, i32* %i, align 4, !dbg !352
  %cmp183 = icmp sgt i32 %118, 0, !dbg !354
  br i1 %cmp183, label %land.lhs.true184, label %if.end211, !dbg !355, !cf.info !97

land.lhs.true184:                                 ; preds = %if.end182
  %119 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !356
  %120 = load i32, i32* %i, align 4, !dbg !357
  %idxprom185 = sext i32 %120 to i64, !dbg !356
  %arrayidx186 = getelementptr inbounds [5 x i32], [5 x i32]* %119, i64 %idxprom185, !dbg !356
  %arrayidx187 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx186, i64 0, i64 0, !dbg !356
  %121 = load i32, i32* %arrayidx187, align 4, !dbg !356
  %cmp188 = icmp sge i32 %121, 0, !dbg !358
  br i1 %cmp188, label %land.lhs.true189, label %if.end211, !dbg !359, !cf.info !97

land.lhs.true189:                                 ; preds = %land.lhs.true184
  %122 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !360
  %123 = load i32, i32* %i, align 4, !dbg !361
  %sub = sub nsw i32 %123, 1, !dbg !362
  %idxprom190 = sext i32 %sub to i64, !dbg !360
  %arrayidx191 = getelementptr inbounds [5 x i32], [5 x i32]* %122, i64 %idxprom190, !dbg !360
  %arrayidx192 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx191, i64 0, i64 0, !dbg !360
  %124 = load i32, i32* %arrayidx192, align 4, !dbg !360
  %cmp193 = icmp eq i32 %124, 1, !dbg !363
  br i1 %cmp193, label %land.lhs.true194, label %lor.lhs.false199, !dbg !364, !cf.info !97

land.lhs.true194:                                 ; preds = %land.lhs.true189
  %125 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !365
  %126 = load i32, i32* %i, align 4, !dbg !366
  %idxprom195 = sext i32 %126 to i64, !dbg !365
  %arrayidx196 = getelementptr inbounds [5 x i32], [5 x i32]* %125, i64 %idxprom195, !dbg !365
  %arrayidx197 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx196, i64 0, i64 0, !dbg !365
  %127 = load i32, i32* %arrayidx197, align 4, !dbg !365
  %cmp198 = icmp ne i32 %127, 2, !dbg !367
  br i1 %cmp198, label %if.then210, label %lor.lhs.false199, !dbg !368, !cf.info !97

lor.lhs.false199:                                 ; preds = %land.lhs.true194, %land.lhs.true189
  %128 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !369
  %129 = load i32, i32* %i, align 4, !dbg !370
  %sub200 = sub nsw i32 %129, 1, !dbg !371
  %idxprom201 = sext i32 %sub200 to i64, !dbg !369
  %arrayidx202 = getelementptr inbounds [5 x i32], [5 x i32]* %128, i64 %idxprom201, !dbg !369
  %arrayidx203 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx202, i64 0, i64 0, !dbg !369
  %130 = load i32, i32* %arrayidx203, align 4, !dbg !369
  %cmp204 = icmp ne i32 %130, 1, !dbg !372
  br i1 %cmp204, label %land.lhs.true205, label %if.end211, !dbg !373, !cf.info !97

land.lhs.true205:                                 ; preds = %lor.lhs.false199
  %131 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !374
  %132 = load i32, i32* %i, align 4, !dbg !375
  %idxprom206 = sext i32 %132 to i64, !dbg !374
  %arrayidx207 = getelementptr inbounds [5 x i32], [5 x i32]* %131, i64 %idxprom206, !dbg !374
  %arrayidx208 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx207, i64 0, i64 0, !dbg !374
  %133 = load i32, i32* %arrayidx208, align 4, !dbg !374
  %cmp209 = icmp eq i32 %133, 2, !dbg !376
  br i1 %cmp209, label %if.then210, label %if.end211, !dbg !377, !cf.info !97

if.then210:                                       ; preds = %land.lhs.true205, %land.lhs.true194
  store i32 0, i32* %retval, align 4, !dbg !378
  br label %return, !dbg !378

if.end211:                                        ; preds = %land.lhs.true205, %lor.lhs.false199, %land.lhs.true184, %if.end182
  %134 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !379
  %135 = load i32, i32* %i, align 4, !dbg !381
  %idxprom212 = sext i32 %135 to i64, !dbg !379
  %arrayidx213 = getelementptr inbounds [5 x i32], [5 x i32]* %134, i64 %idxprom212, !dbg !379
  %arrayidx214 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx213, i64 0, i64 0, !dbg !379
  %136 = load i32, i32* %arrayidx214, align 4, !dbg !379
  %cmp215 = icmp sge i32 %136, 0, !dbg !382
  br i1 %cmp215, label %land.lhs.true216, label %if.end242, !dbg !383, !cf.info !97

land.lhs.true216:                                 ; preds = %if.end211
  %137 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !384
  %138 = load i32, i32* %i, align 4, !dbg !385
  %idxprom217 = sext i32 %138 to i64, !dbg !384
  %arrayidx218 = getelementptr inbounds [5 x i32], [5 x i32]* %137, i64 %idxprom217, !dbg !384
  %arrayidx219 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx218, i64 0, i64 2, !dbg !384
  %139 = load i32, i32* %arrayidx219, align 4, !dbg !384
  %cmp220 = icmp sge i32 %139, 0, !dbg !386
  br i1 %cmp220, label %land.lhs.true221, label %if.end242, !dbg !387, !cf.info !97

land.lhs.true221:                                 ; preds = %land.lhs.true216
  %140 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !388
  %141 = load i32, i32* %i, align 4, !dbg !389
  %idxprom222 = sext i32 %141 to i64, !dbg !388
  %arrayidx223 = getelementptr inbounds [5 x i32], [5 x i32]* %140, i64 %idxprom222, !dbg !388
  %arrayidx224 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx223, i64 0, i64 0, !dbg !388
  %142 = load i32, i32* %arrayidx224, align 4, !dbg !388
  %cmp225 = icmp eq i32 %142, 1, !dbg !390
  br i1 %cmp225, label %land.lhs.true226, label %lor.lhs.false231, !dbg !391, !cf.info !97

land.lhs.true226:                                 ; preds = %land.lhs.true221
  %143 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !392
  %144 = load i32, i32* %i, align 4, !dbg !393
  %idxprom227 = sext i32 %144 to i64, !dbg !392
  %arrayidx228 = getelementptr inbounds [5 x i32], [5 x i32]* %143, i64 %idxprom227, !dbg !392
  %arrayidx229 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx228, i64 0, i64 2, !dbg !392
  %145 = load i32, i32* %arrayidx229, align 4, !dbg !392
  %cmp230 = icmp ne i32 %145, 1, !dbg !394
  br i1 %cmp230, label %if.then241, label %lor.lhs.false231, !dbg !395, !cf.info !97

lor.lhs.false231:                                 ; preds = %land.lhs.true226, %land.lhs.true221
  %146 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !396
  %147 = load i32, i32* %i, align 4, !dbg !397
  %idxprom232 = sext i32 %147 to i64, !dbg !396
  %arrayidx233 = getelementptr inbounds [5 x i32], [5 x i32]* %146, i64 %idxprom232, !dbg !396
  %arrayidx234 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx233, i64 0, i64 0, !dbg !396
  %148 = load i32, i32* %arrayidx234, align 4, !dbg !396
  %cmp235 = icmp ne i32 %148, 1, !dbg !398
  br i1 %cmp235, label %land.lhs.true236, label %if.end242, !dbg !399, !cf.info !97

land.lhs.true236:                                 ; preds = %lor.lhs.false231
  %149 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !400
  %150 = load i32, i32* %i, align 4, !dbg !401
  %idxprom237 = sext i32 %150 to i64, !dbg !400
  %arrayidx238 = getelementptr inbounds [5 x i32], [5 x i32]* %149, i64 %idxprom237, !dbg !400
  %arrayidx239 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx238, i64 0, i64 2, !dbg !400
  %151 = load i32, i32* %arrayidx239, align 4, !dbg !400
  %cmp240 = icmp eq i32 %151, 1, !dbg !402
  br i1 %cmp240, label %if.then241, label %if.end242, !dbg !403, !cf.info !97

if.then241:                                       ; preds = %land.lhs.true236, %land.lhs.true226
  store i32 0, i32* %retval, align 4, !dbg !404
  br label %return, !dbg !404

if.end242:                                        ; preds = %land.lhs.true236, %lor.lhs.false231, %land.lhs.true216, %if.end211
  %152 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !405
  %153 = load i32, i32* %i, align 4, !dbg !407
  %idxprom243 = sext i32 %153 to i64, !dbg !405
  %arrayidx244 = getelementptr inbounds [5 x i32], [5 x i32]* %152, i64 %idxprom243, !dbg !405
  %arrayidx245 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx244, i64 0, i64 4, !dbg !405
  %154 = load i32, i32* %arrayidx245, align 4, !dbg !405
  %cmp246 = icmp sge i32 %154, 0, !dbg !408
  br i1 %cmp246, label %land.lhs.true247, label %if.end273, !dbg !409, !cf.info !97

land.lhs.true247:                                 ; preds = %if.end242
  %155 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !410
  %156 = load i32, i32* %i, align 4, !dbg !411
  %idxprom248 = sext i32 %156 to i64, !dbg !410
  %arrayidx249 = getelementptr inbounds [5 x i32], [5 x i32]* %155, i64 %idxprom248, !dbg !410
  %arrayidx250 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx249, i64 0, i64 3, !dbg !410
  %157 = load i32, i32* %arrayidx250, align 4, !dbg !410
  %cmp251 = icmp sge i32 %157, 0, !dbg !412
  br i1 %cmp251, label %land.lhs.true252, label %if.end273, !dbg !413, !cf.info !97

land.lhs.true252:                                 ; preds = %land.lhs.true247
  %158 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !414
  %159 = load i32, i32* %i, align 4, !dbg !415
  %idxprom253 = sext i32 %159 to i64, !dbg !414
  %arrayidx254 = getelementptr inbounds [5 x i32], [5 x i32]* %158, i64 %idxprom253, !dbg !414
  %arrayidx255 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx254, i64 0, i64 4, !dbg !414
  %160 = load i32, i32* %arrayidx255, align 4, !dbg !414
  %cmp256 = icmp eq i32 %160, 0, !dbg !416
  br i1 %cmp256, label %land.lhs.true257, label %lor.lhs.false262, !dbg !417, !cf.info !97

land.lhs.true257:                                 ; preds = %land.lhs.true252
  %161 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !418
  %162 = load i32, i32* %i, align 4, !dbg !419
  %idxprom258 = sext i32 %162 to i64, !dbg !418
  %arrayidx259 = getelementptr inbounds [5 x i32], [5 x i32]* %161, i64 %idxprom258, !dbg !418
  %arrayidx260 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx259, i64 0, i64 3, !dbg !418
  %163 = load i32, i32* %arrayidx260, align 4, !dbg !418
  %cmp261 = icmp ne i32 %163, 1, !dbg !420
  br i1 %cmp261, label %if.then272, label %lor.lhs.false262, !dbg !421, !cf.info !97

lor.lhs.false262:                                 ; preds = %land.lhs.true257, %land.lhs.true252
  %164 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !422
  %165 = load i32, i32* %i, align 4, !dbg !423
  %idxprom263 = sext i32 %165 to i64, !dbg !422
  %arrayidx264 = getelementptr inbounds [5 x i32], [5 x i32]* %164, i64 %idxprom263, !dbg !422
  %arrayidx265 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx264, i64 0, i64 4, !dbg !422
  %166 = load i32, i32* %arrayidx265, align 4, !dbg !422
  %cmp266 = icmp ne i32 %166, 0, !dbg !424
  br i1 %cmp266, label %land.lhs.true267, label %if.end273, !dbg !425, !cf.info !97

land.lhs.true267:                                 ; preds = %lor.lhs.false262
  %167 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !426
  %168 = load i32, i32* %i, align 4, !dbg !427
  %idxprom268 = sext i32 %168 to i64, !dbg !426
  %arrayidx269 = getelementptr inbounds [5 x i32], [5 x i32]* %167, i64 %idxprom268, !dbg !426
  %arrayidx270 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx269, i64 0, i64 3, !dbg !426
  %169 = load i32, i32* %arrayidx270, align 4, !dbg !426
  %cmp271 = icmp eq i32 %169, 1, !dbg !428
  br i1 %cmp271, label %if.then272, label %if.end273, !dbg !429, !cf.info !97

if.then272:                                       ; preds = %land.lhs.true267, %land.lhs.true257
  store i32 0, i32* %retval, align 4, !dbg !430
  br label %return, !dbg !430

if.end273:                                        ; preds = %land.lhs.true267, %lor.lhs.false262, %land.lhs.true247, %if.end242
  %170 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !431
  %171 = load i32, i32* %i, align 4, !dbg !433
  %idxprom274 = sext i32 %171 to i64, !dbg !431
  %arrayidx275 = getelementptr inbounds [5 x i32], [5 x i32]* %170, i64 %idxprom274, !dbg !431
  %arrayidx276 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx275, i64 0, i64 4, !dbg !431
  %172 = load i32, i32* %arrayidx276, align 4, !dbg !431
  %cmp277 = icmp sge i32 %172, 0, !dbg !434
  br i1 %cmp277, label %land.lhs.true278, label %if.end304, !dbg !435, !cf.info !97

land.lhs.true278:                                 ; preds = %if.end273
  %173 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !436
  %174 = load i32, i32* %i, align 4, !dbg !437
  %idxprom279 = sext i32 %174 to i64, !dbg !436
  %arrayidx280 = getelementptr inbounds [5 x i32], [5 x i32]* %173, i64 %idxprom279, !dbg !436
  %arrayidx281 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx280, i64 0, i64 0, !dbg !436
  %175 = load i32, i32* %arrayidx281, align 4, !dbg !436
  %cmp282 = icmp sge i32 %175, 0, !dbg !438
  br i1 %cmp282, label %land.lhs.true283, label %if.end304, !dbg !439, !cf.info !97

land.lhs.true283:                                 ; preds = %land.lhs.true278
  %176 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !440
  %177 = load i32, i32* %i, align 4, !dbg !441
  %idxprom284 = sext i32 %177 to i64, !dbg !440
  %arrayidx285 = getelementptr inbounds [5 x i32], [5 x i32]* %176, i64 %idxprom284, !dbg !440
  %arrayidx286 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx285, i64 0, i64 4, !dbg !440
  %178 = load i32, i32* %arrayidx286, align 4, !dbg !440
  %cmp287 = icmp eq i32 %178, 1, !dbg !442
  br i1 %cmp287, label %land.lhs.true288, label %lor.lhs.false293, !dbg !443, !cf.info !97

land.lhs.true288:                                 ; preds = %land.lhs.true283
  %179 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !444
  %180 = load i32, i32* %i, align 4, !dbg !445
  %idxprom289 = sext i32 %180 to i64, !dbg !444
  %arrayidx290 = getelementptr inbounds [5 x i32], [5 x i32]* %179, i64 %idxprom289, !dbg !444
  %arrayidx291 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx290, i64 0, i64 0, !dbg !444
  %181 = load i32, i32* %arrayidx291, align 4, !dbg !444
  %cmp292 = icmp ne i32 %181, 3, !dbg !446
  br i1 %cmp292, label %if.then303, label %lor.lhs.false293, !dbg !447, !cf.info !97

lor.lhs.false293:                                 ; preds = %land.lhs.true288, %land.lhs.true283
  %182 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !448
  %183 = load i32, i32* %i, align 4, !dbg !449
  %idxprom294 = sext i32 %183 to i64, !dbg !448
  %arrayidx295 = getelementptr inbounds [5 x i32], [5 x i32]* %182, i64 %idxprom294, !dbg !448
  %arrayidx296 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx295, i64 0, i64 4, !dbg !448
  %184 = load i32, i32* %arrayidx296, align 4, !dbg !448
  %cmp297 = icmp ne i32 %184, 1, !dbg !450
  br i1 %cmp297, label %land.lhs.true298, label %if.end304, !dbg !451, !cf.info !97

land.lhs.true298:                                 ; preds = %lor.lhs.false293
  %185 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !452
  %186 = load i32, i32* %i, align 4, !dbg !453
  %idxprom299 = sext i32 %186 to i64, !dbg !452
  %arrayidx300 = getelementptr inbounds [5 x i32], [5 x i32]* %185, i64 %idxprom299, !dbg !452
  %arrayidx301 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx300, i64 0, i64 0, !dbg !452
  %187 = load i32, i32* %arrayidx301, align 4, !dbg !452
  %cmp302 = icmp eq i32 %187, 3, !dbg !454
  br i1 %cmp302, label %if.then303, label %if.end304, !dbg !455, !cf.info !97

if.then303:                                       ; preds = %land.lhs.true298, %land.lhs.true288
  store i32 0, i32* %retval, align 4, !dbg !456
  br label %return, !dbg !456

if.end304:                                        ; preds = %land.lhs.true298, %lor.lhs.false293, %land.lhs.true278, %if.end273
  %188 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !457
  %189 = load i32, i32* %i, align 4, !dbg !459
  %idxprom305 = sext i32 %189 to i64, !dbg !457
  %arrayidx306 = getelementptr inbounds [5 x i32], [5 x i32]* %188, i64 %idxprom305, !dbg !457
  %arrayidx307 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx306, i64 0, i64 4, !dbg !457
  %190 = load i32, i32* %arrayidx307, align 4, !dbg !457
  %cmp308 = icmp eq i32 %190, 2, !dbg !460
  br i1 %cmp308, label %if.then309, label %if.end354, !dbg !461, !cf.info !97

if.then309:                                       ; preds = %if.end304
  %191 = load i32, i32* %i, align 4, !dbg !462
  %cmp310 = icmp eq i32 %191, 0, !dbg !465
  br i1 %cmp310, label %land.lhs.true311, label %if.else, !dbg !466, !cf.info !97

land.lhs.true311:                                 ; preds = %if.then309
  %192 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !467
  %193 = load i32, i32* %i, align 4, !dbg !468
  %add312 = add nsw i32 %193, 1, !dbg !469
  %idxprom313 = sext i32 %add312 to i64, !dbg !467
  %arrayidx314 = getelementptr inbounds [5 x i32], [5 x i32]* %192, i64 %idxprom313, !dbg !467
  %arrayidx315 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx314, i64 0, i64 3, !dbg !467
  %194 = load i32, i32* %arrayidx315, align 4, !dbg !467
  %cmp316 = icmp sge i32 %194, 0, !dbg !470
  br i1 %cmp316, label %land.lhs.true317, label %if.else, !dbg !471, !cf.info !97

land.lhs.true317:                                 ; preds = %land.lhs.true311
  %195 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !472
  %196 = load i32, i32* %i, align 4, !dbg !473
  %add318 = add nsw i32 %196, 1, !dbg !474
  %idxprom319 = sext i32 %add318 to i64, !dbg !472
  %arrayidx320 = getelementptr inbounds [5 x i32], [5 x i32]* %195, i64 %idxprom319, !dbg !472
  %arrayidx321 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx320, i64 0, i64 3, !dbg !472
  %197 = load i32, i32* %arrayidx321, align 4, !dbg !472
  %cmp322 = icmp ne i32 %197, 2, !dbg !475
  br i1 %cmp322, label %if.then323, label %if.else, !dbg !476, !cf.info !97

if.then323:                                       ; preds = %land.lhs.true317
  store i32 0, i32* %retval, align 4, !dbg !477
  br label %return, !dbg !477

if.else:                                          ; preds = %land.lhs.true317, %land.lhs.true311, %if.then309
  %198 = load i32, i32* %i, align 4, !dbg !478
  %cmp324 = icmp eq i32 %198, 4, !dbg !480
  br i1 %cmp324, label %land.lhs.true325, label %if.else332, !dbg !481, !cf.info !97

land.lhs.true325:                                 ; preds = %if.else
  %199 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !482
  %200 = load i32, i32* %i, align 4, !dbg !483
  %sub326 = sub nsw i32 %200, 1, !dbg !484
  %idxprom327 = sext i32 %sub326 to i64, !dbg !482
  %arrayidx328 = getelementptr inbounds [5 x i32], [5 x i32]* %199, i64 %idxprom327, !dbg !482
  %arrayidx329 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx328, i64 0, i64 3, !dbg !482
  %201 = load i32, i32* %arrayidx329, align 4, !dbg !482
  %cmp330 = icmp ne i32 %201, 2, !dbg !485
  br i1 %cmp330, label %if.then331, label %if.else332, !dbg !486, !cf.info !97

if.then331:                                       ; preds = %land.lhs.true325
  store i32 0, i32* %retval, align 4, !dbg !487
  br label %return, !dbg !487

if.else332:                                       ; preds = %land.lhs.true325, %if.else
  %202 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !488
  %203 = load i32, i32* %i, align 4, !dbg !490
  %add333 = add nsw i32 %203, 1, !dbg !491
  %idxprom334 = sext i32 %add333 to i64, !dbg !488
  %arrayidx335 = getelementptr inbounds [5 x i32], [5 x i32]* %202, i64 %idxprom334, !dbg !488
  %arrayidx336 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx335, i64 0, i64 3, !dbg !488
  %204 = load i32, i32* %arrayidx336, align 4, !dbg !488
  %cmp337 = icmp sge i32 %204, 0, !dbg !492
  br i1 %cmp337, label %land.lhs.true338, label %if.end351, !dbg !493, !cf.info !97

land.lhs.true338:                                 ; preds = %if.else332
  %205 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !494
  %206 = load i32, i32* %i, align 4, !dbg !495
  %add339 = add nsw i32 %206, 1, !dbg !496
  %idxprom340 = sext i32 %add339 to i64, !dbg !494
  %arrayidx341 = getelementptr inbounds [5 x i32], [5 x i32]* %205, i64 %idxprom340, !dbg !494
  %arrayidx342 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx341, i64 0, i64 3, !dbg !494
  %207 = load i32, i32* %arrayidx342, align 4, !dbg !494
  %cmp343 = icmp ne i32 %207, 2, !dbg !497
  br i1 %cmp343, label %land.lhs.true344, label %if.end351, !dbg !498, !cf.info !97

land.lhs.true344:                                 ; preds = %land.lhs.true338
  %208 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !499
  %209 = load i32, i32* %i, align 4, !dbg !500
  %sub345 = sub nsw i32 %209, 1, !dbg !501
  %idxprom346 = sext i32 %sub345 to i64, !dbg !499
  %arrayidx347 = getelementptr inbounds [5 x i32], [5 x i32]* %208, i64 %idxprom346, !dbg !499
  %arrayidx348 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx347, i64 0, i64 3, !dbg !499
  %210 = load i32, i32* %arrayidx348, align 4, !dbg !499
  %cmp349 = icmp ne i32 %210, 2, !dbg !502
  br i1 %cmp349, label %if.then350, label %if.end351, !dbg !503, !cf.info !97

if.then350:                                       ; preds = %land.lhs.true344
  store i32 0, i32* %retval, align 4, !dbg !504
  br label %return, !dbg !504

if.end351:                                        ; preds = %land.lhs.true344, %land.lhs.true338, %if.else332
  br label %if.end352

if.end352:                                        ; preds = %if.end351
  br label %if.end353

if.end353:                                        ; preds = %if.end352
  br label %if.end354, !dbg !505

if.end354:                                        ; preds = %if.end353, %if.end304
  %211 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !506
  %212 = load i32, i32* %i, align 4, !dbg !508
  %idxprom355 = sext i32 %212 to i64, !dbg !506
  %arrayidx356 = getelementptr inbounds [5 x i32], [5 x i32]* %211, i64 %idxprom355, !dbg !506
  %arrayidx357 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx356, i64 0, i64 4, !dbg !506
  %213 = load i32, i32* %arrayidx357, align 4, !dbg !506
  %cmp358 = icmp eq i32 %213, 1, !dbg !509
  br i1 %cmp358, label %if.then359, label %if.end405, !dbg !510, !cf.info !97

if.then359:                                       ; preds = %if.end354
  %214 = load i32, i32* %i, align 4, !dbg !511
  %cmp360 = icmp eq i32 %214, 0, !dbg !514
  br i1 %cmp360, label %land.lhs.true361, label %if.else374, !dbg !515, !cf.info !97

land.lhs.true361:                                 ; preds = %if.then359
  %215 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !516
  %216 = load i32, i32* %i, align 4, !dbg !517
  %add362 = add nsw i32 %216, 1, !dbg !518
  %idxprom363 = sext i32 %add362 to i64, !dbg !516
  %arrayidx364 = getelementptr inbounds [5 x i32], [5 x i32]* %215, i64 %idxprom363, !dbg !516
  %arrayidx365 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx364, i64 0, i64 3, !dbg !516
  %217 = load i32, i32* %arrayidx365, align 4, !dbg !516
  %cmp366 = icmp sge i32 %217, 0, !dbg !519
  br i1 %cmp366, label %land.lhs.true367, label %if.else374, !dbg !520, !cf.info !97

land.lhs.true367:                                 ; preds = %land.lhs.true361
  %218 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !521
  %219 = load i32, i32* %i, align 4, !dbg !522
  %add368 = add nsw i32 %219, 1, !dbg !523
  %idxprom369 = sext i32 %add368 to i64, !dbg !521
  %arrayidx370 = getelementptr inbounds [5 x i32], [5 x i32]* %218, i64 %idxprom369, !dbg !521
  %arrayidx371 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx370, i64 0, i64 3, !dbg !521
  %220 = load i32, i32* %arrayidx371, align 4, !dbg !521
  %cmp372 = icmp ne i32 %220, 3, !dbg !524
  br i1 %cmp372, label %if.then373, label %if.else374, !dbg !525, !cf.info !97

if.then373:                                       ; preds = %land.lhs.true367
  store i32 0, i32* %retval, align 4, !dbg !526
  br label %return, !dbg !526

if.else374:                                       ; preds = %land.lhs.true367, %land.lhs.true361, %if.then359
  %221 = load i32, i32* %i, align 4, !dbg !527
  %cmp375 = icmp eq i32 %221, 4, !dbg !529
  br i1 %cmp375, label %land.lhs.true376, label %if.else383, !dbg !530, !cf.info !97

land.lhs.true376:                                 ; preds = %if.else374
  %222 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !531
  %223 = load i32, i32* %i, align 4, !dbg !532
  %sub377 = sub nsw i32 %223, 1, !dbg !533
  %idxprom378 = sext i32 %sub377 to i64, !dbg !531
  %arrayidx379 = getelementptr inbounds [5 x i32], [5 x i32]* %222, i64 %idxprom378, !dbg !531
  %arrayidx380 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx379, i64 0, i64 3, !dbg !531
  %224 = load i32, i32* %arrayidx380, align 4, !dbg !531
  %cmp381 = icmp ne i32 %224, 3, !dbg !534
  br i1 %cmp381, label %if.then382, label %if.else383, !dbg !535, !cf.info !97

if.then382:                                       ; preds = %land.lhs.true376
  store i32 0, i32* %retval, align 4, !dbg !536
  br label %return, !dbg !536

if.else383:                                       ; preds = %land.lhs.true376, %if.else374
  %225 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !537
  %226 = load i32, i32* %i, align 4, !dbg !539
  %add384 = add nsw i32 %226, 1, !dbg !540
  %idxprom385 = sext i32 %add384 to i64, !dbg !537
  %arrayidx386 = getelementptr inbounds [5 x i32], [5 x i32]* %225, i64 %idxprom385, !dbg !537
  %arrayidx387 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx386, i64 0, i64 3, !dbg !537
  %227 = load i32, i32* %arrayidx387, align 4, !dbg !537
  %cmp388 = icmp sge i32 %227, 0, !dbg !541
  br i1 %cmp388, label %land.lhs.true389, label %if.end402, !dbg !542, !cf.info !97

land.lhs.true389:                                 ; preds = %if.else383
  %228 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !543
  %229 = load i32, i32* %i, align 4, !dbg !544
  %add390 = add nsw i32 %229, 1, !dbg !545
  %idxprom391 = sext i32 %add390 to i64, !dbg !543
  %arrayidx392 = getelementptr inbounds [5 x i32], [5 x i32]* %228, i64 %idxprom391, !dbg !543
  %arrayidx393 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx392, i64 0, i64 3, !dbg !543
  %230 = load i32, i32* %arrayidx393, align 4, !dbg !543
  %cmp394 = icmp ne i32 %230, 3, !dbg !546
  br i1 %cmp394, label %land.lhs.true395, label %if.end402, !dbg !547, !cf.info !97

land.lhs.true395:                                 ; preds = %land.lhs.true389
  %231 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !548
  %232 = load i32, i32* %i, align 4, !dbg !549
  %sub396 = sub nsw i32 %232, 1, !dbg !550
  %idxprom397 = sext i32 %sub396 to i64, !dbg !548
  %arrayidx398 = getelementptr inbounds [5 x i32], [5 x i32]* %231, i64 %idxprom397, !dbg !548
  %arrayidx399 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx398, i64 0, i64 3, !dbg !548
  %233 = load i32, i32* %arrayidx399, align 4, !dbg !548
  %cmp400 = icmp ne i32 %233, 3, !dbg !551
  br i1 %cmp400, label %if.then401, label %if.end402, !dbg !552, !cf.info !97

if.then401:                                       ; preds = %land.lhs.true395
  store i32 0, i32* %retval, align 4, !dbg !553
  br label %return, !dbg !553

if.end402:                                        ; preds = %land.lhs.true395, %land.lhs.true389, %if.else383
  br label %if.end403

if.end403:                                        ; preds = %if.end402
  br label %if.end404

if.end404:                                        ; preds = %if.end403
  br label %if.end405, !dbg !554

if.end405:                                        ; preds = %if.end404, %if.end354
  %234 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !555
  %235 = load i32, i32* %i, align 4, !dbg !557
  %idxprom406 = sext i32 %235 to i64, !dbg !555
  %arrayidx407 = getelementptr inbounds [5 x i32], [5 x i32]* %234, i64 %idxprom406, !dbg !555
  %arrayidx408 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx407, i64 0, i64 4, !dbg !555
  %236 = load i32, i32* %arrayidx408, align 4, !dbg !555
  %cmp409 = icmp sge i32 %236, 0, !dbg !558
  br i1 %cmp409, label %land.lhs.true410, label %if.end436, !dbg !559, !cf.info !97

land.lhs.true410:                                 ; preds = %if.end405
  %237 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !560
  %238 = load i32, i32* %i, align 4, !dbg !561
  %idxprom411 = sext i32 %238 to i64, !dbg !560
  %arrayidx412 = getelementptr inbounds [5 x i32], [5 x i32]* %237, i64 %idxprom411, !dbg !560
  %arrayidx413 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx412, i64 0, i64 2, !dbg !560
  %239 = load i32, i32* %arrayidx413, align 4, !dbg !560
  %cmp414 = icmp sge i32 %239, 0, !dbg !562
  br i1 %cmp414, label %land.lhs.true415, label %if.end436, !dbg !563, !cf.info !97

land.lhs.true415:                                 ; preds = %land.lhs.true410
  %240 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !564
  %241 = load i32, i32* %i, align 4, !dbg !565
  %idxprom416 = sext i32 %241 to i64, !dbg !564
  %arrayidx417 = getelementptr inbounds [5 x i32], [5 x i32]* %240, i64 %idxprom416, !dbg !564
  %arrayidx418 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx417, i64 0, i64 4, !dbg !564
  %242 = load i32, i32* %arrayidx418, align 4, !dbg !564
  %cmp419 = icmp eq i32 %242, 3, !dbg !566
  br i1 %cmp419, label %land.lhs.true420, label %lor.lhs.false425, !dbg !567, !cf.info !97

land.lhs.true420:                                 ; preds = %land.lhs.true415
  %243 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !568
  %244 = load i32, i32* %i, align 4, !dbg !569
  %idxprom421 = sext i32 %244 to i64, !dbg !568
  %arrayidx422 = getelementptr inbounds [5 x i32], [5 x i32]* %243, i64 %idxprom421, !dbg !568
  %arrayidx423 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx422, i64 0, i64 2, !dbg !568
  %245 = load i32, i32* %arrayidx423, align 4, !dbg !568
  %cmp424 = icmp ne i32 %245, 3, !dbg !570
  br i1 %cmp424, label %if.then435, label %lor.lhs.false425, !dbg !571, !cf.info !97

lor.lhs.false425:                                 ; preds = %land.lhs.true420, %land.lhs.true415
  %246 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !572
  %247 = load i32, i32* %i, align 4, !dbg !573
  %idxprom426 = sext i32 %247 to i64, !dbg !572
  %arrayidx427 = getelementptr inbounds [5 x i32], [5 x i32]* %246, i64 %idxprom426, !dbg !572
  %arrayidx428 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx427, i64 0, i64 4, !dbg !572
  %248 = load i32, i32* %arrayidx428, align 4, !dbg !572
  %cmp429 = icmp ne i32 %248, 3, !dbg !574
  br i1 %cmp429, label %land.lhs.true430, label %if.end436, !dbg !575, !cf.info !97

land.lhs.true430:                                 ; preds = %lor.lhs.false425
  %249 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !576
  %250 = load i32, i32* %i, align 4, !dbg !577
  %idxprom431 = sext i32 %250 to i64, !dbg !576
  %arrayidx432 = getelementptr inbounds [5 x i32], [5 x i32]* %249, i64 %idxprom431, !dbg !576
  %arrayidx433 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx432, i64 0, i64 2, !dbg !576
  %251 = load i32, i32* %arrayidx433, align 4, !dbg !576
  %cmp434 = icmp eq i32 %251, 3, !dbg !578
  br i1 %cmp434, label %if.then435, label %if.end436, !dbg !579, !cf.info !97

if.then435:                                       ; preds = %land.lhs.true430, %land.lhs.true420
  store i32 0, i32* %retval, align 4, !dbg !580
  br label %return, !dbg !580

if.end436:                                        ; preds = %land.lhs.true430, %lor.lhs.false425, %land.lhs.true410, %if.end405
  %252 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !581
  %253 = load i32, i32* %i, align 4, !dbg !583
  %idxprom437 = sext i32 %253 to i64, !dbg !581
  %arrayidx438 = getelementptr inbounds [5 x i32], [5 x i32]* %252, i64 %idxprom437, !dbg !581
  %arrayidx439 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx438, i64 0, i64 1, !dbg !581
  %254 = load i32, i32* %arrayidx439, align 4, !dbg !581
  %cmp440 = icmp sge i32 %254, 0, !dbg !584
  br i1 %cmp440, label %land.lhs.true441, label %if.end467, !dbg !585, !cf.info !97

land.lhs.true441:                                 ; preds = %if.end436
  %255 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !586
  %256 = load i32, i32* %i, align 4, !dbg !587
  %idxprom442 = sext i32 %256 to i64, !dbg !586
  %arrayidx443 = getelementptr inbounds [5 x i32], [5 x i32]* %255, i64 %idxprom442, !dbg !586
  %arrayidx444 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx443, i64 0, i64 4, !dbg !586
  %257 = load i32, i32* %arrayidx444, align 4, !dbg !586
  %cmp445 = icmp sge i32 %257, 0, !dbg !588
  br i1 %cmp445, label %land.lhs.true446, label %if.end467, !dbg !589, !cf.info !97

land.lhs.true446:                                 ; preds = %land.lhs.true441
  %258 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !590
  %259 = load i32, i32* %i, align 4, !dbg !591
  %idxprom447 = sext i32 %259 to i64, !dbg !590
  %arrayidx448 = getelementptr inbounds [5 x i32], [5 x i32]* %258, i64 %idxprom447, !dbg !590
  %arrayidx449 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx448, i64 0, i64 1, !dbg !590
  %260 = load i32, i32* %arrayidx449, align 4, !dbg !590
  %cmp450 = icmp eq i32 %260, 3, !dbg !592
  br i1 %cmp450, label %land.lhs.true451, label %lor.lhs.false456, !dbg !593, !cf.info !97

land.lhs.true451:                                 ; preds = %land.lhs.true446
  %261 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !594
  %262 = load i32, i32* %i, align 4, !dbg !595
  %idxprom452 = sext i32 %262 to i64, !dbg !594
  %arrayidx453 = getelementptr inbounds [5 x i32], [5 x i32]* %261, i64 %idxprom452, !dbg !594
  %arrayidx454 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx453, i64 0, i64 4, !dbg !594
  %263 = load i32, i32* %arrayidx454, align 4, !dbg !594
  %cmp455 = icmp ne i32 %263, 4, !dbg !596
  br i1 %cmp455, label %if.then466, label %lor.lhs.false456, !dbg !597, !cf.info !97

lor.lhs.false456:                                 ; preds = %land.lhs.true451, %land.lhs.true446
  %264 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !598
  %265 = load i32, i32* %i, align 4, !dbg !599
  %idxprom457 = sext i32 %265 to i64, !dbg !598
  %arrayidx458 = getelementptr inbounds [5 x i32], [5 x i32]* %264, i64 %idxprom457, !dbg !598
  %arrayidx459 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx458, i64 0, i64 1, !dbg !598
  %266 = load i32, i32* %arrayidx459, align 4, !dbg !598
  %cmp460 = icmp ne i32 %266, 3, !dbg !600
  br i1 %cmp460, label %land.lhs.true461, label %if.end467, !dbg !601, !cf.info !97

land.lhs.true461:                                 ; preds = %lor.lhs.false456
  %267 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !602
  %268 = load i32, i32* %i, align 4, !dbg !603
  %idxprom462 = sext i32 %268 to i64, !dbg !602
  %arrayidx463 = getelementptr inbounds [5 x i32], [5 x i32]* %267, i64 %idxprom462, !dbg !602
  %arrayidx464 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx463, i64 0, i64 4, !dbg !602
  %269 = load i32, i32* %arrayidx464, align 4, !dbg !602
  %cmp465 = icmp eq i32 %269, 4, !dbg !604
  br i1 %cmp465, label %if.then466, label %if.end467, !dbg !605, !cf.info !97

if.then466:                                       ; preds = %land.lhs.true461, %land.lhs.true451
  store i32 0, i32* %retval, align 4, !dbg !606
  br label %return, !dbg !606

if.end467:                                        ; preds = %land.lhs.true461, %lor.lhs.false456, %land.lhs.true441, %if.end436
  %270 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !607
  %271 = load i32, i32* %i, align 4, !dbg !609
  %idxprom468 = sext i32 %271 to i64, !dbg !607
  %arrayidx469 = getelementptr inbounds [5 x i32], [5 x i32]* %270, i64 %idxprom468, !dbg !607
  %arrayidx470 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx469, i64 0, i64 1, !dbg !607
  %272 = load i32, i32* %arrayidx470, align 4, !dbg !607
  %cmp471 = icmp eq i32 %272, 4, !dbg !610
  br i1 %cmp471, label %land.lhs.true472, label %if.end495, !dbg !611, !cf.info !97

land.lhs.true472:                                 ; preds = %if.end467
  %273 = load i32, i32* %i, align 4, !dbg !612
  %cmp473 = icmp slt i32 %273, 4, !dbg !613
  br i1 %cmp473, label %land.lhs.true474, label %lor.lhs.false486, !dbg !614, !cf.info !97

land.lhs.true474:                                 ; preds = %land.lhs.true472
  %274 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !615
  %275 = load i32, i32* %i, align 4, !dbg !616
  %add475 = add nsw i32 %275, 1, !dbg !617
  %idxprom476 = sext i32 %add475 to i64, !dbg !615
  %arrayidx477 = getelementptr inbounds [5 x i32], [5 x i32]* %274, i64 %idxprom476, !dbg !615
  %arrayidx478 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx477, i64 0, i64 0, !dbg !615
  %276 = load i32, i32* %arrayidx478, align 4, !dbg !615
  %cmp479 = icmp sge i32 %276, 0, !dbg !618
  br i1 %cmp479, label %land.lhs.true480, label %lor.lhs.false486, !dbg !619, !cf.info !97

land.lhs.true480:                                 ; preds = %land.lhs.true474
  %277 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !620
  %278 = load i32, i32* %i, align 4, !dbg !621
  %add481 = add nsw i32 %278, 1, !dbg !622
  %idxprom482 = sext i32 %add481 to i64, !dbg !620
  %arrayidx483 = getelementptr inbounds [5 x i32], [5 x i32]* %277, i64 %idxprom482, !dbg !620
  %arrayidx484 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx483, i64 0, i64 0, !dbg !620
  %279 = load i32, i32* %arrayidx484, align 4, !dbg !620
  %cmp485 = icmp ne i32 %279, 4, !dbg !623
  br i1 %cmp485, label %if.then494, label %lor.lhs.false486, !dbg !624, !cf.info !97

lor.lhs.false486:                                 ; preds = %land.lhs.true480, %land.lhs.true474, %land.lhs.true472
  %280 = load i32, i32* %i, align 4, !dbg !625
  %cmp487 = icmp sgt i32 %280, 0, !dbg !626
  br i1 %cmp487, label %land.lhs.true488, label %if.end495, !dbg !627, !cf.info !97

land.lhs.true488:                                 ; preds = %lor.lhs.false486
  %281 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !628
  %282 = load i32, i32* %i, align 4, !dbg !629
  %sub489 = sub nsw i32 %282, 1, !dbg !630
  %idxprom490 = sext i32 %sub489 to i64, !dbg !628
  %arrayidx491 = getelementptr inbounds [5 x i32], [5 x i32]* %281, i64 %idxprom490, !dbg !628
  %arrayidx492 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx491, i64 0, i64 0, !dbg !628
  %283 = load i32, i32* %arrayidx492, align 4, !dbg !628
  %cmp493 = icmp ne i32 %283, 4, !dbg !631
  br i1 %cmp493, label %if.then494, label %if.end495, !dbg !632, !cf.info !97

if.then494:                                       ; preds = %land.lhs.true488, %land.lhs.true480
  store i32 0, i32* %retval, align 4, !dbg !633
  br label %return, !dbg !633

if.end495:                                        ; preds = %land.lhs.true488, %lor.lhs.false486, %if.end467
  %284 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !634
  %285 = load i32, i32* %i, align 4, !dbg !636
  %idxprom496 = sext i32 %285 to i64, !dbg !634
  %arrayidx497 = getelementptr inbounds [5 x i32], [5 x i32]* %284, i64 %idxprom496, !dbg !634
  %arrayidx498 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx497, i64 0, i64 4, !dbg !634
  %286 = load i32, i32* %arrayidx498, align 4, !dbg !634
  %cmp499 = icmp eq i32 %286, 2, !dbg !637
  br i1 %cmp499, label %if.then500, label %if.end546, !dbg !638, !cf.info !97

if.then500:                                       ; preds = %if.end495
  %287 = load i32, i32* %i, align 4, !dbg !639
  %cmp501 = icmp eq i32 %287, 0, !dbg !642
  br i1 %cmp501, label %land.lhs.true502, label %if.else515, !dbg !643, !cf.info !97

land.lhs.true502:                                 ; preds = %if.then500
  %288 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !644
  %289 = load i32, i32* %i, align 4, !dbg !645
  %add503 = add nsw i32 %289, 1, !dbg !646
  %idxprom504 = sext i32 %add503 to i64, !dbg !644
  %arrayidx505 = getelementptr inbounds [5 x i32], [5 x i32]* %288, i64 %idxprom504, !dbg !644
  %arrayidx506 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx505, i64 0, i64 2, !dbg !644
  %290 = load i32, i32* %arrayidx506, align 4, !dbg !644
  %cmp507 = icmp sge i32 %290, 0, !dbg !647
  br i1 %cmp507, label %land.lhs.true508, label %if.else515, !dbg !648, !cf.info !97

land.lhs.true508:                                 ; preds = %land.lhs.true502
  %291 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !649
  %292 = load i32, i32* %i, align 4, !dbg !650
  %add509 = add nsw i32 %292, 1, !dbg !651
  %idxprom510 = sext i32 %add509 to i64, !dbg !649
  %arrayidx511 = getelementptr inbounds [5 x i32], [5 x i32]* %291, i64 %idxprom510, !dbg !649
  %arrayidx512 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx511, i64 0, i64 2, !dbg !649
  %293 = load i32, i32* %arrayidx512, align 4, !dbg !649
  %cmp513 = icmp ne i32 %293, 4, !dbg !652
  br i1 %cmp513, label %if.then514, label %if.else515, !dbg !653, !cf.info !97

if.then514:                                       ; preds = %land.lhs.true508
  store i32 0, i32* %retval, align 4, !dbg !654
  br label %return, !dbg !654

if.else515:                                       ; preds = %land.lhs.true508, %land.lhs.true502, %if.then500
  %294 = load i32, i32* %i, align 4, !dbg !655
  %cmp516 = icmp eq i32 %294, 4, !dbg !657
  br i1 %cmp516, label %land.lhs.true517, label %if.else524, !dbg !658, !cf.info !97

land.lhs.true517:                                 ; preds = %if.else515
  %295 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !659
  %296 = load i32, i32* %i, align 4, !dbg !660
  %sub518 = sub nsw i32 %296, 1, !dbg !661
  %idxprom519 = sext i32 %sub518 to i64, !dbg !659
  %arrayidx520 = getelementptr inbounds [5 x i32], [5 x i32]* %295, i64 %idxprom519, !dbg !659
  %arrayidx521 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx520, i64 0, i64 2, !dbg !659
  %297 = load i32, i32* %arrayidx521, align 4, !dbg !659
  %cmp522 = icmp ne i32 %297, 4, !dbg !662
  br i1 %cmp522, label %if.then523, label %if.else524, !dbg !663, !cf.info !97

if.then523:                                       ; preds = %land.lhs.true517
  store i32 0, i32* %retval, align 4, !dbg !664
  br label %return, !dbg !664

if.else524:                                       ; preds = %land.lhs.true517, %if.else515
  %298 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !665
  %299 = load i32, i32* %i, align 4, !dbg !667
  %add525 = add nsw i32 %299, 1, !dbg !668
  %idxprom526 = sext i32 %add525 to i64, !dbg !665
  %arrayidx527 = getelementptr inbounds [5 x i32], [5 x i32]* %298, i64 %idxprom526, !dbg !665
  %arrayidx528 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx527, i64 0, i64 2, !dbg !665
  %300 = load i32, i32* %arrayidx528, align 4, !dbg !665
  %cmp529 = icmp sge i32 %300, 0, !dbg !669
  br i1 %cmp529, label %land.lhs.true530, label %if.end543, !dbg !670, !cf.info !97

land.lhs.true530:                                 ; preds = %if.else524
  %301 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !671
  %302 = load i32, i32* %i, align 4, !dbg !672
  %add531 = add nsw i32 %302, 1, !dbg !673
  %idxprom532 = sext i32 %add531 to i64, !dbg !671
  %arrayidx533 = getelementptr inbounds [5 x i32], [5 x i32]* %301, i64 %idxprom532, !dbg !671
  %arrayidx534 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx533, i64 0, i64 2, !dbg !671
  %303 = load i32, i32* %arrayidx534, align 4, !dbg !671
  %cmp535 = icmp ne i32 %303, 4, !dbg !674
  br i1 %cmp535, label %land.lhs.true536, label %if.end543, !dbg !675, !cf.info !97

land.lhs.true536:                                 ; preds = %land.lhs.true530
  %304 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !676
  %305 = load i32, i32* %i, align 4, !dbg !677
  %sub537 = sub nsw i32 %305, 1, !dbg !678
  %idxprom538 = sext i32 %sub537 to i64, !dbg !676
  %arrayidx539 = getelementptr inbounds [5 x i32], [5 x i32]* %304, i64 %idxprom538, !dbg !676
  %arrayidx540 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx539, i64 0, i64 2, !dbg !676
  %306 = load i32, i32* %arrayidx540, align 4, !dbg !676
  %cmp541 = icmp ne i32 %306, 4, !dbg !679
  br i1 %cmp541, label %if.then542, label %if.end543, !dbg !680, !cf.info !97

if.then542:                                       ; preds = %land.lhs.true536
  store i32 0, i32* %retval, align 4, !dbg !681
  br label %return, !dbg !681

if.end543:                                        ; preds = %land.lhs.true536, %land.lhs.true530, %if.else524
  br label %if.end544

if.end544:                                        ; preds = %if.end543
  br label %if.end545

if.end545:                                        ; preds = %if.end544
  br label %if.end546, !dbg !682

if.end546:                                        ; preds = %if.end545, %if.end495
  br label %for.inc, !dbg !683

for.inc:                                          ; preds = %if.end546
  %307 = load i32, i32* %i, align 4, !dbg !684
  %inc = add nsw i32 %307, 1, !dbg !684
  store i32 %inc, i32* %i, align 4, !dbg !684
  br label %for.cond, !dbg !685, !llvm.loop !686

for.end:                                          ; preds = %for.cond
  %308 = load i32, i32* %c_add, align 4, !dbg !688
  %309 = load i32, i32* %c_or, align 4, !dbg !690
  %cmp547 = icmp ne i32 %308, %309, !dbg !691
  br i1 %cmp547, label %if.then556, label %lor.lhs.false548, !dbg !692, !cf.info !97

lor.lhs.false548:                                 ; preds = %for.end
  %310 = load i32, i32* %m_add, align 4, !dbg !693
  %311 = load i32, i32* %m_or, align 4, !dbg !694
  %cmp549 = icmp ne i32 %310, %311, !dbg !695
  br i1 %cmp549, label %if.then556, label %lor.lhs.false550, !dbg !696, !cf.info !97

lor.lhs.false550:                                 ; preds = %lor.lhs.false548
  %312 = load i32, i32* %d_add, align 4, !dbg !697
  %313 = load i32, i32* %d_or, align 4, !dbg !698
  %cmp551 = icmp ne i32 %312, %313, !dbg !699
  br i1 %cmp551, label %if.then556, label %lor.lhs.false552, !dbg !700, !cf.info !97

lor.lhs.false552:                                 ; preds = %lor.lhs.false550
  %314 = load i32, i32* %a_add, align 4, !dbg !701
  %315 = load i32, i32* %a_or, align 4, !dbg !702
  %cmp553 = icmp ne i32 %314, %315, !dbg !703
  br i1 %cmp553, label %if.then556, label %lor.lhs.false554, !dbg !704, !cf.info !97

lor.lhs.false554:                                 ; preds = %lor.lhs.false552
  %316 = load i32, i32* %s_add, align 4, !dbg !705
  %317 = load i32, i32* %s_or, align 4, !dbg !706
  %cmp555 = icmp ne i32 %316, %317, !dbg !707
  br i1 %cmp555, label %if.then556, label %if.end557, !dbg !708, !cf.info !97

if.then556:                                       ; preds = %lor.lhs.false554, %lor.lhs.false552, %lor.lhs.false550, %lor.lhs.false548, %for.end
  store i32 0, i32* %retval, align 4, !dbg !709
  br label %return, !dbg !709

if.end557:                                        ; preds = %lor.lhs.false554
  %318 = load i32, i32* %c_add, align 4, !dbg !711
  %cmp558 = icmp ne i32 %318, 31, !dbg !713
  br i1 %cmp558, label %if.then567, label %lor.lhs.false559, !dbg !714, !cf.info !97

lor.lhs.false559:                                 ; preds = %if.end557
  %319 = load i32, i32* %m_add, align 4, !dbg !715
  %cmp560 = icmp ne i32 %319, 31, !dbg !716
  br i1 %cmp560, label %if.then567, label %lor.lhs.false561, !dbg !717, !cf.info !97

lor.lhs.false561:                                 ; preds = %lor.lhs.false559
  %320 = load i32, i32* %d_add, align 4, !dbg !718
  %cmp562 = icmp ne i32 %320, 31, !dbg !719
  br i1 %cmp562, label %if.then567, label %lor.lhs.false563, !dbg !720, !cf.info !97

lor.lhs.false563:                                 ; preds = %lor.lhs.false561
  %321 = load i32, i32* %a_add, align 4, !dbg !721
  %cmp564 = icmp ne i32 %321, 31, !dbg !722
  br i1 %cmp564, label %if.then567, label %lor.lhs.false565, !dbg !723, !cf.info !97

lor.lhs.false565:                                 ; preds = %lor.lhs.false563
  %322 = load i32, i32* %s_add, align 4, !dbg !724
  %cmp566 = icmp ne i32 %322, 31, !dbg !725
  br i1 %cmp566, label %if.then567, label %if.end568, !dbg !726, !cf.info !97

if.then567:                                       ; preds = %lor.lhs.false565, %lor.lhs.false563, %lor.lhs.false561, %lor.lhs.false559, %if.end557
  store i32 1, i32* %retval, align 4, !dbg !727
  br label %return, !dbg !727

if.end568:                                        ; preds = %lor.lhs.false565
  store i32 2, i32* %retval, align 4, !dbg !729
  br label %return, !dbg !729

return:                                           ; preds = %if.end568, %if.then567, %if.then556, %if.then542, %if.then523, %if.then514, %if.then494, %if.then466, %if.then435, %if.then401, %if.then382, %if.then373, %if.then350, %if.then331, %if.then323, %if.then303, %if.then272, %if.then241, %if.then210, %if.then181, %if.then150, %if.then119, %if.then12, %if.then
  %323 = load i32, i32* %retval, align 4, !dbg !730
  ret i32 %323, !dbg !730
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bruteFill([5 x i32]* %ha, i32 %hno, i32 %attr) #0 !dbg !731 {
entry:
  %retval = alloca i32, align 4
  %ha.addr = alloca [5 x i32]*, align 8
  %hno.addr = alloca i32, align 4
  %attr.addr = alloca i32, align 4
  %stat = alloca i32, align 4
  %hb = alloca [5 x [5 x i32]], align 16
  %i = alloca i32, align 4
  %nexthno = alloca i32, align 4
  %nextattr = alloca i32, align 4
  store [5 x i32]* %ha, [5 x i32]** %ha.addr, align 8
  call void @llvm.dbg.declare(metadata [5 x i32]** %ha.addr, metadata !734, metadata !DIExpression()), !dbg !735
  store i32 %hno, i32* %hno.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %hno.addr, metadata !736, metadata !DIExpression()), !dbg !737
  store i32 %attr, i32* %attr.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %attr.addr, metadata !738, metadata !DIExpression()), !dbg !739
  call void @llvm.dbg.declare(metadata i32* %stat, metadata !740, metadata !DIExpression()), !dbg !741
  %0 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !742
  %call = call i32 @checkHouses([5 x i32]* %0), !dbg !743
  store i32 %call, i32* %stat, align 4, !dbg !741
  %1 = load i32, i32* %stat, align 4, !dbg !744
  %cmp = icmp eq i32 %1, 2, !dbg !746
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !747, !cf.info !97

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %stat, align 4, !dbg !748
  %cmp1 = icmp eq i32 %2, 0, !dbg !749
  br i1 %cmp1, label %if.then, label %if.end, !dbg !750, !cf.info !97

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i32, i32* %stat, align 4, !dbg !751
  store i32 %3, i32* %retval, align 4, !dbg !752
  br label %return, !dbg !752

if.end:                                           ; preds = %lor.lhs.false
  call void @llvm.dbg.declare(metadata [5 x [5 x i32]]* %hb, metadata !753, metadata !DIExpression()), !dbg !756
  %arraydecay = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %hb, i64 0, i64 0, !dbg !757
  %4 = bitcast [5 x i32]* %arraydecay to i8*, !dbg !757
  %5 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !758
  %6 = bitcast [5 x i32]* %5 to i8*, !dbg !757
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 100, i1 false), !dbg !757
  call void @llvm.dbg.declare(metadata i32* %i, metadata !759, metadata !DIExpression()), !dbg !761
  store i32 0, i32* %i, align 4, !dbg !761
  br label %for.cond, !dbg !762

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i32, i32* %i, align 4, !dbg !763
  %cmp2 = icmp slt i32 %7, 5, !dbg !765
  br i1 %cmp2, label %for.body, label %for.end, !dbg !766

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !767
  %9 = load i32, i32* %hno.addr, align 4, !dbg !769
  %idxprom = sext i32 %9 to i64, !dbg !770
  %arrayidx = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %hb, i64 0, i64 %idxprom, !dbg !770
  %10 = load i32, i32* %attr.addr, align 4, !dbg !771
  %idxprom3 = sext i32 %10 to i64, !dbg !770
  %arrayidx4 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx, i64 0, i64 %idxprom3, !dbg !770
  store i32 %8, i32* %arrayidx4, align 4, !dbg !772
  %arraydecay5 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %hb, i64 0, i64 0, !dbg !773
  %call6 = call i32 @checkHouses([5 x i32]* %arraydecay5), !dbg !774
  store i32 %call6, i32* %stat, align 4, !dbg !775
  %11 = load i32, i32* %stat, align 4, !dbg !776
  %cmp7 = icmp ne i32 %11, 0, !dbg !778
  br i1 %cmp7, label %if.then8, label %if.end19, !dbg !779, !cf.info !97

if.then8:                                         ; preds = %for.body
  call void @llvm.dbg.declare(metadata i32* %nexthno, metadata !780, metadata !DIExpression()), !dbg !782
  call void @llvm.dbg.declare(metadata i32* %nextattr, metadata !783, metadata !DIExpression()), !dbg !784
  %12 = load i32, i32* %attr.addr, align 4, !dbg !785
  %cmp9 = icmp slt i32 %12, 4, !dbg !787
  br i1 %cmp9, label %if.then10, label %if.else, !dbg !788, !cf.info !97

if.then10:                                        ; preds = %if.then8
  %13 = load i32, i32* %attr.addr, align 4, !dbg !789
  %add = add nsw i32 %13, 1, !dbg !791
  store i32 %add, i32* %nextattr, align 4, !dbg !792
  %14 = load i32, i32* %hno.addr, align 4, !dbg !793
  store i32 %14, i32* %nexthno, align 4, !dbg !794
  br label %if.end12, !dbg !795

if.else:                                          ; preds = %if.then8
  store i32 0, i32* %nextattr, align 4, !dbg !796
  %15 = load i32, i32* %hno.addr, align 4, !dbg !798
  %add11 = add nsw i32 %15, 1, !dbg !799
  store i32 %add11, i32* %nexthno, align 4, !dbg !800
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then10
  %arraydecay13 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %hb, i64 0, i64 0, !dbg !801
  %16 = load i32, i32* %nexthno, align 4, !dbg !802
  %17 = load i32, i32* %nextattr, align 4, !dbg !803
  %call14 = call i32 @bruteFill([5 x i32]* %arraydecay13, i32 %16, i32 %17), !dbg !804
  store i32 %call14, i32* %stat, align 4, !dbg !805
  %18 = load i32, i32* %stat, align 4, !dbg !806
  %cmp15 = icmp ne i32 %18, 0, !dbg !808
  br i1 %cmp15, label %if.then16, label %if.end18, !dbg !809, !cf.info !97

if.then16:                                        ; preds = %if.end12
  %19 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8, !dbg !810
  %20 = bitcast [5 x i32]* %19 to i8*, !dbg !812
  %arraydecay17 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %hb, i64 0, i64 0, !dbg !812
  %21 = bitcast [5 x i32]* %arraydecay17 to i8*, !dbg !812
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %20, i8* align 16 %21, i64 100, i1 false), !dbg !812
  %22 = load i32, i32* %stat, align 4, !dbg !813
  store i32 %22, i32* %retval, align 4, !dbg !814
  br label %return, !dbg !814

if.end18:                                         ; preds = %if.end12
  br label %if.end19, !dbg !815

if.end19:                                         ; preds = %if.end18, %for.body
  br label %for.inc, !dbg !816

for.inc:                                          ; preds = %if.end19
  %23 = load i32, i32* %i, align 4, !dbg !817
  %inc = add nsw i32 %23, 1, !dbg !817
  store i32 %inc, i32* %i, align 4, !dbg !817
  br label %for.cond, !dbg !818, !llvm.loop !819

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, align 4, !dbg !821
  br label %return, !dbg !821

return:                                           ; preds = %for.end, %if.then16, %if.then
  %24 = load i32, i32* %retval, align 4, !dbg !822
  ret i32 %24, !dbg !822
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !823 {
entry:
  %retval = alloca i32, align 4
  %ha = alloca [5 x [5 x i32]], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x [5 x i32]]* %ha, metadata !826, metadata !DIExpression()), !dbg !827
  %0 = bitcast [5 x [5 x i32]]* %ha to i8*, !dbg !827
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 -1, i64 100, i1 false), !dbg !827
  %arraydecay = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %ha, i64 0, i64 0, !dbg !828
  %call = call i32 @bruteFill([5 x i32]* %arraydecay, i32 0, i32 0), !dbg !829
  %arraydecay1 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %ha, i64 0, i64 0, !dbg !830
  call void @printHouses([5 x i32]* %arraydecay1), !dbg !831
  ret i32 0, !dbg !832
}

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
!65 = !DILocation(line: 16, column: 22, scope: !55)
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
!83 = !DILocation(line: 26, column: 14, scope: !82)
!84 = !DILocation(line: 26, column: 10, scope: !82)
!85 = !DILocation(line: 26, column: 21, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !1, line: 26, column: 5)
!87 = !DILocation(line: 26, column: 23, scope: !86)
!88 = !DILocation(line: 26, column: 5, scope: !82)
!89 = !DILocation(line: 27, column: 25, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !1, line: 26, column: 33)
!91 = !DILocation(line: 27, column: 9, scope: !90)
!92 = !DILocation(line: 28, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !1, line: 28, column: 13)
!94 = !DILocation(line: 28, column: 16, scope: !93)
!95 = !DILocation(line: 28, column: 22, scope: !93)
!96 = !DILocation(line: 28, column: 13, scope: !90)
!97 = !{!"if"}
!98 = !DILocation(line: 29, column: 38, scope: !93)
!99 = !DILocation(line: 29, column: 41, scope: !93)
!100 = !DILocation(line: 29, column: 32, scope: !93)
!101 = !DILocation(line: 29, column: 13, scope: !93)
!102 = !DILocation(line: 31, column: 13, scope: !93)
!103 = !DILocation(line: 32, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !90, file: !1, line: 32, column: 13)
!105 = !DILocation(line: 32, column: 16, scope: !104)
!106 = !DILocation(line: 32, column: 22, scope: !104)
!107 = !DILocation(line: 32, column: 13, scope: !90)
!108 = !DILocation(line: 33, column: 36, scope: !104)
!109 = !DILocation(line: 33, column: 39, scope: !104)
!110 = !DILocation(line: 33, column: 32, scope: !104)
!111 = !DILocation(line: 33, column: 13, scope: !104)
!112 = !DILocation(line: 35, column: 13, scope: !104)
!113 = !DILocation(line: 36, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !90, file: !1, line: 36, column: 13)
!115 = !DILocation(line: 36, column: 16, scope: !114)
!116 = !DILocation(line: 36, column: 22, scope: !114)
!117 = !DILocation(line: 36, column: 13, scope: !90)
!118 = !DILocation(line: 37, column: 38, scope: !114)
!119 = !DILocation(line: 37, column: 41, scope: !114)
!120 = !DILocation(line: 37, column: 32, scope: !114)
!121 = !DILocation(line: 37, column: 13, scope: !114)
!122 = !DILocation(line: 39, column: 13, scope: !114)
!123 = !DILocation(line: 40, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !90, file: !1, line: 40, column: 13)
!125 = !DILocation(line: 40, column: 16, scope: !124)
!126 = !DILocation(line: 40, column: 22, scope: !124)
!127 = !DILocation(line: 40, column: 13, scope: !90)
!128 = !DILocation(line: 41, column: 39, scope: !124)
!129 = !DILocation(line: 41, column: 42, scope: !124)
!130 = !DILocation(line: 41, column: 32, scope: !124)
!131 = !DILocation(line: 41, column: 13, scope: !124)
!132 = !DILocation(line: 43, column: 13, scope: !124)
!133 = !DILocation(line: 44, column: 13, scope: !134)
!134 = distinct !DILexicalBlock(scope: !90, file: !1, line: 44, column: 13)
!135 = !DILocation(line: 44, column: 16, scope: !134)
!136 = !DILocation(line: 44, column: 22, scope: !134)
!137 = !DILocation(line: 44, column: 13, scope: !90)
!138 = !DILocation(line: 45, column: 40, scope: !134)
!139 = !DILocation(line: 45, column: 43, scope: !134)
!140 = !DILocation(line: 45, column: 34, scope: !134)
!141 = !DILocation(line: 45, column: 13, scope: !134)
!142 = !DILocation(line: 47, column: 13, scope: !134)
!143 = !DILocation(line: 48, column: 5, scope: !90)
!144 = !DILocation(line: 26, column: 29, scope: !86)
!145 = !DILocation(line: 26, column: 5, scope: !86)
!146 = distinct !{!146, !88, !147}
!147 = !DILocation(line: 48, column: 5, scope: !82)
!148 = !DILocation(line: 49, column: 1, scope: !55)
!149 = distinct !DISubprogram(name: "checkHouses", scope: !1, file: !1, line: 52, type: !150, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !63)
!150 = !DISubroutineType(types: !151)
!151 = !{!60, !58}
!152 = !DILocalVariable(name: "ha", arg: 1, scope: !149, file: !1, line: 52, type: !58)
!153 = !DILocation(line: 52, column: 21, scope: !149)
!154 = !DILocalVariable(name: "c_add", scope: !149, file: !1, line: 53, type: !60)
!155 = !DILocation(line: 53, column: 9, scope: !149)
!156 = !DILocalVariable(name: "c_or", scope: !149, file: !1, line: 53, type: !60)
!157 = !DILocation(line: 53, column: 20, scope: !149)
!158 = !DILocalVariable(name: "m_add", scope: !149, file: !1, line: 54, type: !60)
!159 = !DILocation(line: 54, column: 9, scope: !149)
!160 = !DILocalVariable(name: "m_or", scope: !149, file: !1, line: 54, type: !60)
!161 = !DILocation(line: 54, column: 20, scope: !149)
!162 = !DILocalVariable(name: "d_add", scope: !149, file: !1, line: 55, type: !60)
!163 = !DILocation(line: 55, column: 9, scope: !149)
!164 = !DILocalVariable(name: "d_or", scope: !149, file: !1, line: 55, type: !60)
!165 = !DILocation(line: 55, column: 20, scope: !149)
!166 = !DILocalVariable(name: "a_add", scope: !149, file: !1, line: 56, type: !60)
!167 = !DILocation(line: 56, column: 9, scope: !149)
!168 = !DILocalVariable(name: "a_or", scope: !149, file: !1, line: 56, type: !60)
!169 = !DILocation(line: 56, column: 20, scope: !149)
!170 = !DILocalVariable(name: "s_add", scope: !149, file: !1, line: 57, type: !60)
!171 = !DILocation(line: 57, column: 9, scope: !149)
!172 = !DILocalVariable(name: "s_or", scope: !149, file: !1, line: 57, type: !60)
!173 = !DILocation(line: 57, column: 20, scope: !149)
!174 = !DILocation(line: 60, column: 9, scope: !175)
!175 = distinct !DILexicalBlock(scope: !149, file: !1, line: 60, column: 9)
!176 = !DILocation(line: 60, column: 18, scope: !175)
!177 = !DILocation(line: 60, column: 23, scope: !175)
!178 = !DILocation(line: 60, column: 26, scope: !175)
!179 = !DILocation(line: 60, column: 35, scope: !175)
!180 = !DILocation(line: 60, column: 9, scope: !149)
!181 = !DILocation(line: 61, column: 9, scope: !175)
!182 = !DILocation(line: 64, column: 9, scope: !183)
!183 = distinct !DILexicalBlock(scope: !149, file: !1, line: 64, column: 9)
!184 = !DILocation(line: 64, column: 18, scope: !183)
!185 = !DILocation(line: 64, column: 23, scope: !183)
!186 = !DILocation(line: 64, column: 26, scope: !183)
!187 = !DILocation(line: 64, column: 35, scope: !183)
!188 = !DILocation(line: 64, column: 9, scope: !149)
!189 = !DILocation(line: 65, column: 9, scope: !183)
!190 = !DILocalVariable(name: "i", scope: !191, file: !1, line: 67, type: !60)
!191 = distinct !DILexicalBlock(scope: !149, file: !1, line: 67, column: 5)
!192 = !DILocation(line: 67, column: 14, scope: !191)
!193 = !DILocation(line: 67, column: 10, scope: !191)
!194 = !DILocation(line: 67, column: 21, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !1, line: 67, column: 5)
!196 = !DILocation(line: 67, column: 23, scope: !195)
!197 = !DILocation(line: 67, column: 5, scope: !191)
!198 = !DILocation(line: 69, column: 13, scope: !199)
!199 = distinct !DILexicalBlock(scope: !200, file: !1, line: 69, column: 13)
!200 = distinct !DILexicalBlock(scope: !195, file: !1, line: 67, column: 33)
!201 = !DILocation(line: 69, column: 16, scope: !199)
!202 = !DILocation(line: 69, column: 22, scope: !199)
!203 = !DILocation(line: 69, column: 13, scope: !200)
!204 = !DILocation(line: 70, column: 28, scope: !205)
!205 = distinct !DILexicalBlock(scope: !199, file: !1, line: 69, column: 28)
!206 = !DILocation(line: 70, column: 31, scope: !205)
!207 = !DILocation(line: 70, column: 25, scope: !205)
!208 = !DILocation(line: 70, column: 19, scope: !205)
!209 = !DILocation(line: 71, column: 27, scope: !205)
!210 = !DILocation(line: 71, column: 30, scope: !205)
!211 = !DILocation(line: 71, column: 24, scope: !205)
!212 = !DILocation(line: 71, column: 18, scope: !205)
!213 = !DILocation(line: 72, column: 9, scope: !205)
!214 = !DILocation(line: 73, column: 13, scope: !215)
!215 = distinct !DILexicalBlock(scope: !200, file: !1, line: 73, column: 13)
!216 = !DILocation(line: 73, column: 16, scope: !215)
!217 = !DILocation(line: 73, column: 22, scope: !215)
!218 = !DILocation(line: 73, column: 13, scope: !200)
!219 = !DILocation(line: 74, column: 28, scope: !220)
!220 = distinct !DILexicalBlock(scope: !215, file: !1, line: 73, column: 28)
!221 = !DILocation(line: 74, column: 31, scope: !220)
!222 = !DILocation(line: 74, column: 25, scope: !220)
!223 = !DILocation(line: 74, column: 19, scope: !220)
!224 = !DILocation(line: 75, column: 27, scope: !220)
!225 = !DILocation(line: 75, column: 30, scope: !220)
!226 = !DILocation(line: 75, column: 24, scope: !220)
!227 = !DILocation(line: 75, column: 18, scope: !220)
!228 = !DILocation(line: 76, column: 9, scope: !220)
!229 = !DILocation(line: 77, column: 13, scope: !230)
!230 = distinct !DILexicalBlock(scope: !200, file: !1, line: 77, column: 13)
!231 = !DILocation(line: 77, column: 16, scope: !230)
!232 = !DILocation(line: 77, column: 22, scope: !230)
!233 = !DILocation(line: 77, column: 13, scope: !200)
!234 = !DILocation(line: 78, column: 28, scope: !235)
!235 = distinct !DILexicalBlock(scope: !230, file: !1, line: 77, column: 28)
!236 = !DILocation(line: 78, column: 31, scope: !235)
!237 = !DILocation(line: 78, column: 25, scope: !235)
!238 = !DILocation(line: 78, column: 19, scope: !235)
!239 = !DILocation(line: 79, column: 27, scope: !235)
!240 = !DILocation(line: 79, column: 30, scope: !235)
!241 = !DILocation(line: 79, column: 24, scope: !235)
!242 = !DILocation(line: 79, column: 18, scope: !235)
!243 = !DILocation(line: 80, column: 9, scope: !235)
!244 = !DILocation(line: 81, column: 13, scope: !245)
!245 = distinct !DILexicalBlock(scope: !200, file: !1, line: 81, column: 13)
!246 = !DILocation(line: 81, column: 16, scope: !245)
!247 = !DILocation(line: 81, column: 22, scope: !245)
!248 = !DILocation(line: 81, column: 13, scope: !200)
!249 = !DILocation(line: 82, column: 28, scope: !250)
!250 = distinct !DILexicalBlock(scope: !245, file: !1, line: 81, column: 28)
!251 = !DILocation(line: 82, column: 31, scope: !250)
!252 = !DILocation(line: 82, column: 25, scope: !250)
!253 = !DILocation(line: 82, column: 19, scope: !250)
!254 = !DILocation(line: 83, column: 27, scope: !250)
!255 = !DILocation(line: 83, column: 30, scope: !250)
!256 = !DILocation(line: 83, column: 24, scope: !250)
!257 = !DILocation(line: 83, column: 18, scope: !250)
!258 = !DILocation(line: 84, column: 9, scope: !250)
!259 = !DILocation(line: 85, column: 13, scope: !260)
!260 = distinct !DILexicalBlock(scope: !200, file: !1, line: 85, column: 13)
!261 = !DILocation(line: 85, column: 16, scope: !260)
!262 = !DILocation(line: 85, column: 22, scope: !260)
!263 = !DILocation(line: 85, column: 13, scope: !200)
!264 = !DILocation(line: 86, column: 28, scope: !265)
!265 = distinct !DILexicalBlock(scope: !260, file: !1, line: 85, column: 28)
!266 = !DILocation(line: 86, column: 31, scope: !265)
!267 = !DILocation(line: 86, column: 25, scope: !265)
!268 = !DILocation(line: 86, column: 19, scope: !265)
!269 = !DILocation(line: 87, column: 27, scope: !265)
!270 = !DILocation(line: 87, column: 30, scope: !265)
!271 = !DILocation(line: 87, column: 24, scope: !265)
!272 = !DILocation(line: 87, column: 18, scope: !265)
!273 = !DILocation(line: 88, column: 9, scope: !265)
!274 = !DILocation(line: 91, column: 14, scope: !275)
!275 = distinct !DILexicalBlock(scope: !200, file: !1, line: 91, column: 13)
!276 = !DILocation(line: 91, column: 17, scope: !275)
!277 = !DILocation(line: 91, column: 23, scope: !275)
!278 = !DILocation(line: 91, column: 28, scope: !275)
!279 = !DILocation(line: 91, column: 31, scope: !275)
!280 = !DILocation(line: 91, column: 34, scope: !275)
!281 = !DILocation(line: 91, column: 40, scope: !275)
!282 = !DILocation(line: 91, column: 46, scope: !275)
!283 = !DILocation(line: 92, column: 15, scope: !275)
!284 = !DILocation(line: 92, column: 18, scope: !275)
!285 = !DILocation(line: 92, column: 24, scope: !275)
!286 = !DILocation(line: 92, column: 35, scope: !275)
!287 = !DILocation(line: 92, column: 38, scope: !275)
!288 = !DILocation(line: 92, column: 41, scope: !275)
!289 = !DILocation(line: 92, column: 47, scope: !275)
!290 = !DILocation(line: 92, column: 55, scope: !275)
!291 = !DILocation(line: 93, column: 15, scope: !275)
!292 = !DILocation(line: 93, column: 18, scope: !275)
!293 = !DILocation(line: 93, column: 24, scope: !275)
!294 = !DILocation(line: 93, column: 35, scope: !275)
!295 = !DILocation(line: 93, column: 38, scope: !275)
!296 = !DILocation(line: 93, column: 41, scope: !275)
!297 = !DILocation(line: 93, column: 47, scope: !275)
!298 = !DILocation(line: 91, column: 13, scope: !200)
!299 = !DILocation(line: 94, column: 13, scope: !275)
!300 = !DILocation(line: 97, column: 14, scope: !301)
!301 = distinct !DILexicalBlock(scope: !200, file: !1, line: 97, column: 13)
!302 = !DILocation(line: 97, column: 17, scope: !301)
!303 = !DILocation(line: 97, column: 23, scope: !301)
!304 = !DILocation(line: 97, column: 28, scope: !301)
!305 = !DILocation(line: 97, column: 31, scope: !301)
!306 = !DILocation(line: 97, column: 34, scope: !301)
!307 = !DILocation(line: 97, column: 40, scope: !301)
!308 = !DILocation(line: 97, column: 46, scope: !301)
!309 = !DILocation(line: 98, column: 15, scope: !301)
!310 = !DILocation(line: 98, column: 18, scope: !301)
!311 = !DILocation(line: 98, column: 24, scope: !301)
!312 = !DILocation(line: 98, column: 33, scope: !301)
!313 = !DILocation(line: 98, column: 36, scope: !301)
!314 = !DILocation(line: 98, column: 39, scope: !301)
!315 = !DILocation(line: 98, column: 45, scope: !301)
!316 = !DILocation(line: 98, column: 53, scope: !301)
!317 = !DILocation(line: 99, column: 15, scope: !301)
!318 = !DILocation(line: 99, column: 18, scope: !301)
!319 = !DILocation(line: 99, column: 24, scope: !301)
!320 = !DILocation(line: 99, column: 33, scope: !301)
!321 = !DILocation(line: 99, column: 36, scope: !301)
!322 = !DILocation(line: 99, column: 39, scope: !301)
!323 = !DILocation(line: 99, column: 45, scope: !301)
!324 = !DILocation(line: 97, column: 13, scope: !200)
!325 = !DILocation(line: 100, column: 13, scope: !301)
!326 = !DILocation(line: 103, column: 14, scope: !327)
!327 = distinct !DILexicalBlock(scope: !200, file: !1, line: 103, column: 13)
!328 = !DILocation(line: 103, column: 17, scope: !327)
!329 = !DILocation(line: 103, column: 23, scope: !327)
!330 = !DILocation(line: 103, column: 28, scope: !327)
!331 = !DILocation(line: 103, column: 31, scope: !327)
!332 = !DILocation(line: 103, column: 34, scope: !327)
!333 = !DILocation(line: 103, column: 40, scope: !327)
!334 = !DILocation(line: 103, column: 46, scope: !327)
!335 = !DILocation(line: 104, column: 15, scope: !327)
!336 = !DILocation(line: 104, column: 18, scope: !327)
!337 = !DILocation(line: 104, column: 24, scope: !327)
!338 = !DILocation(line: 104, column: 32, scope: !327)
!339 = !DILocation(line: 104, column: 35, scope: !327)
!340 = !DILocation(line: 104, column: 38, scope: !327)
!341 = !DILocation(line: 104, column: 44, scope: !327)
!342 = !DILocation(line: 104, column: 52, scope: !327)
!343 = !DILocation(line: 105, column: 15, scope: !327)
!344 = !DILocation(line: 105, column: 18, scope: !327)
!345 = !DILocation(line: 105, column: 24, scope: !327)
!346 = !DILocation(line: 105, column: 32, scope: !327)
!347 = !DILocation(line: 105, column: 35, scope: !327)
!348 = !DILocation(line: 105, column: 38, scope: !327)
!349 = !DILocation(line: 105, column: 44, scope: !327)
!350 = !DILocation(line: 103, column: 13, scope: !200)
!351 = !DILocation(line: 106, column: 13, scope: !327)
!352 = !DILocation(line: 109, column: 14, scope: !353)
!353 = distinct !DILexicalBlock(scope: !200, file: !1, line: 109, column: 13)
!354 = !DILocation(line: 109, column: 16, scope: !353)
!355 = !DILocation(line: 109, column: 20, scope: !353)
!356 = !DILocation(line: 109, column: 23, scope: !353)
!357 = !DILocation(line: 109, column: 26, scope: !353)
!358 = !DILocation(line: 109, column: 32, scope: !353)
!359 = !DILocation(line: 109, column: 63, scope: !353)
!360 = !DILocation(line: 110, column: 15, scope: !353)
!361 = !DILocation(line: 110, column: 18, scope: !353)
!362 = !DILocation(line: 110, column: 20, scope: !353)
!363 = !DILocation(line: 110, column: 28, scope: !353)
!364 = !DILocation(line: 110, column: 37, scope: !353)
!365 = !DILocation(line: 110, column: 40, scope: !353)
!366 = !DILocation(line: 110, column: 43, scope: !353)
!367 = !DILocation(line: 110, column: 49, scope: !353)
!368 = !DILocation(line: 110, column: 59, scope: !353)
!369 = !DILocation(line: 111, column: 15, scope: !353)
!370 = !DILocation(line: 111, column: 18, scope: !353)
!371 = !DILocation(line: 111, column: 20, scope: !353)
!372 = !DILocation(line: 111, column: 28, scope: !353)
!373 = !DILocation(line: 111, column: 37, scope: !353)
!374 = !DILocation(line: 111, column: 40, scope: !353)
!375 = !DILocation(line: 111, column: 43, scope: !353)
!376 = !DILocation(line: 111, column: 49, scope: !353)
!377 = !DILocation(line: 109, column: 13, scope: !200)
!378 = !DILocation(line: 112, column: 13, scope: !353)
!379 = !DILocation(line: 115, column: 14, scope: !380)
!380 = distinct !DILexicalBlock(scope: !200, file: !1, line: 115, column: 13)
!381 = !DILocation(line: 115, column: 17, scope: !380)
!382 = !DILocation(line: 115, column: 23, scope: !380)
!383 = !DILocation(line: 115, column: 28, scope: !380)
!384 = !DILocation(line: 115, column: 31, scope: !380)
!385 = !DILocation(line: 115, column: 34, scope: !380)
!386 = !DILocation(line: 115, column: 40, scope: !380)
!387 = !DILocation(line: 115, column: 46, scope: !380)
!388 = !DILocation(line: 116, column: 15, scope: !380)
!389 = !DILocation(line: 116, column: 18, scope: !380)
!390 = !DILocation(line: 116, column: 24, scope: !380)
!391 = !DILocation(line: 116, column: 33, scope: !380)
!392 = !DILocation(line: 116, column: 36, scope: !380)
!393 = !DILocation(line: 116, column: 39, scope: !380)
!394 = !DILocation(line: 116, column: 45, scope: !380)
!395 = !DILocation(line: 116, column: 56, scope: !380)
!396 = !DILocation(line: 117, column: 15, scope: !380)
!397 = !DILocation(line: 117, column: 18, scope: !380)
!398 = !DILocation(line: 117, column: 24, scope: !380)
!399 = !DILocation(line: 117, column: 33, scope: !380)
!400 = !DILocation(line: 117, column: 36, scope: !380)
!401 = !DILocation(line: 117, column: 39, scope: !380)
!402 = !DILocation(line: 117, column: 45, scope: !380)
!403 = !DILocation(line: 115, column: 13, scope: !200)
!404 = !DILocation(line: 118, column: 13, scope: !380)
!405 = !DILocation(line: 121, column: 14, scope: !406)
!406 = distinct !DILexicalBlock(scope: !200, file: !1, line: 121, column: 13)
!407 = !DILocation(line: 121, column: 17, scope: !406)
!408 = !DILocation(line: 121, column: 23, scope: !406)
!409 = !DILocation(line: 121, column: 28, scope: !406)
!410 = !DILocation(line: 121, column: 31, scope: !406)
!411 = !DILocation(line: 121, column: 34, scope: !406)
!412 = !DILocation(line: 121, column: 40, scope: !406)
!413 = !DILocation(line: 121, column: 46, scope: !406)
!414 = !DILocation(line: 122, column: 15, scope: !406)
!415 = !DILocation(line: 122, column: 18, scope: !406)
!416 = !DILocation(line: 122, column: 24, scope: !406)
!417 = !DILocation(line: 122, column: 36, scope: !406)
!418 = !DILocation(line: 122, column: 39, scope: !406)
!419 = !DILocation(line: 122, column: 42, scope: !406)
!420 = !DILocation(line: 122, column: 48, scope: !406)
!421 = !DILocation(line: 122, column: 58, scope: !406)
!422 = !DILocation(line: 123, column: 15, scope: !406)
!423 = !DILocation(line: 123, column: 18, scope: !406)
!424 = !DILocation(line: 123, column: 24, scope: !406)
!425 = !DILocation(line: 123, column: 36, scope: !406)
!426 = !DILocation(line: 123, column: 39, scope: !406)
!427 = !DILocation(line: 123, column: 42, scope: !406)
!428 = !DILocation(line: 123, column: 48, scope: !406)
!429 = !DILocation(line: 121, column: 13, scope: !200)
!430 = !DILocation(line: 124, column: 13, scope: !406)
!431 = !DILocation(line: 127, column: 14, scope: !432)
!432 = distinct !DILexicalBlock(scope: !200, file: !1, line: 127, column: 13)
!433 = !DILocation(line: 127, column: 17, scope: !432)
!434 = !DILocation(line: 127, column: 23, scope: !432)
!435 = !DILocation(line: 127, column: 28, scope: !432)
!436 = !DILocation(line: 127, column: 31, scope: !432)
!437 = !DILocation(line: 127, column: 34, scope: !432)
!438 = !DILocation(line: 127, column: 40, scope: !432)
!439 = !DILocation(line: 127, column: 46, scope: !432)
!440 = !DILocation(line: 128, column: 15, scope: !432)
!441 = !DILocation(line: 128, column: 18, scope: !432)
!442 = !DILocation(line: 128, column: 24, scope: !432)
!443 = !DILocation(line: 128, column: 35, scope: !432)
!444 = !DILocation(line: 128, column: 38, scope: !432)
!445 = !DILocation(line: 128, column: 41, scope: !432)
!446 = !DILocation(line: 128, column: 47, scope: !432)
!447 = !DILocation(line: 128, column: 58, scope: !432)
!448 = !DILocation(line: 129, column: 15, scope: !432)
!449 = !DILocation(line: 129, column: 18, scope: !432)
!450 = !DILocation(line: 129, column: 24, scope: !432)
!451 = !DILocation(line: 129, column: 35, scope: !432)
!452 = !DILocation(line: 129, column: 38, scope: !432)
!453 = !DILocation(line: 129, column: 41, scope: !432)
!454 = !DILocation(line: 129, column: 47, scope: !432)
!455 = !DILocation(line: 127, column: 13, scope: !200)
!456 = !DILocation(line: 130, column: 13, scope: !432)
!457 = !DILocation(line: 133, column: 13, scope: !458)
!458 = distinct !DILexicalBlock(scope: !200, file: !1, line: 133, column: 13)
!459 = !DILocation(line: 133, column: 16, scope: !458)
!460 = !DILocation(line: 133, column: 22, scope: !458)
!461 = !DILocation(line: 133, column: 13, scope: !200)
!462 = !DILocation(line: 134, column: 17, scope: !463)
!463 = distinct !DILexicalBlock(scope: !464, file: !1, line: 134, column: 17)
!464 = distinct !DILexicalBlock(scope: !458, file: !1, line: 133, column: 32)
!465 = !DILocation(line: 134, column: 19, scope: !463)
!466 = !DILocation(line: 134, column: 24, scope: !463)
!467 = !DILocation(line: 134, column: 27, scope: !463)
!468 = !DILocation(line: 134, column: 30, scope: !463)
!469 = !DILocation(line: 134, column: 32, scope: !463)
!470 = !DILocation(line: 134, column: 40, scope: !463)
!471 = !DILocation(line: 134, column: 45, scope: !463)
!472 = !DILocation(line: 134, column: 48, scope: !463)
!473 = !DILocation(line: 134, column: 51, scope: !463)
!474 = !DILocation(line: 134, column: 53, scope: !463)
!475 = !DILocation(line: 134, column: 61, scope: !463)
!476 = !DILocation(line: 134, column: 17, scope: !464)
!477 = !DILocation(line: 135, column: 17, scope: !463)
!478 = !DILocation(line: 136, column: 22, scope: !479)
!479 = distinct !DILexicalBlock(scope: !463, file: !1, line: 136, column: 22)
!480 = !DILocation(line: 136, column: 24, scope: !479)
!481 = !DILocation(line: 136, column: 29, scope: !479)
!482 = !DILocation(line: 136, column: 32, scope: !479)
!483 = !DILocation(line: 136, column: 35, scope: !479)
!484 = !DILocation(line: 136, column: 37, scope: !479)
!485 = !DILocation(line: 136, column: 45, scope: !479)
!486 = !DILocation(line: 136, column: 22, scope: !463)
!487 = !DILocation(line: 137, column: 17, scope: !479)
!488 = !DILocation(line: 138, column: 22, scope: !489)
!489 = distinct !DILexicalBlock(scope: !479, file: !1, line: 138, column: 22)
!490 = !DILocation(line: 138, column: 25, scope: !489)
!491 = !DILocation(line: 138, column: 27, scope: !489)
!492 = !DILocation(line: 138, column: 35, scope: !489)
!493 = !DILocation(line: 138, column: 40, scope: !489)
!494 = !DILocation(line: 138, column: 43, scope: !489)
!495 = !DILocation(line: 138, column: 46, scope: !489)
!496 = !DILocation(line: 138, column: 48, scope: !489)
!497 = !DILocation(line: 138, column: 56, scope: !489)
!498 = !DILocation(line: 138, column: 64, scope: !489)
!499 = !DILocation(line: 138, column: 67, scope: !489)
!500 = !DILocation(line: 138, column: 70, scope: !489)
!501 = !DILocation(line: 138, column: 72, scope: !489)
!502 = !DILocation(line: 138, column: 80, scope: !489)
!503 = !DILocation(line: 138, column: 22, scope: !479)
!504 = !DILocation(line: 139, column: 17, scope: !489)
!505 = !DILocation(line: 140, column: 9, scope: !464)
!506 = !DILocation(line: 143, column: 13, scope: !507)
!507 = distinct !DILexicalBlock(scope: !200, file: !1, line: 143, column: 13)
!508 = !DILocation(line: 143, column: 16, scope: !507)
!509 = !DILocation(line: 143, column: 22, scope: !507)
!510 = !DILocation(line: 143, column: 13, scope: !200)
!511 = !DILocation(line: 144, column: 17, scope: !512)
!512 = distinct !DILexicalBlock(scope: !513, file: !1, line: 144, column: 17)
!513 = distinct !DILexicalBlock(scope: !507, file: !1, line: 143, column: 34)
!514 = !DILocation(line: 144, column: 19, scope: !512)
!515 = !DILocation(line: 144, column: 24, scope: !512)
!516 = !DILocation(line: 144, column: 27, scope: !512)
!517 = !DILocation(line: 144, column: 30, scope: !512)
!518 = !DILocation(line: 144, column: 32, scope: !512)
!519 = !DILocation(line: 144, column: 40, scope: !512)
!520 = !DILocation(line: 144, column: 45, scope: !512)
!521 = !DILocation(line: 144, column: 48, scope: !512)
!522 = !DILocation(line: 144, column: 51, scope: !512)
!523 = !DILocation(line: 144, column: 53, scope: !512)
!524 = !DILocation(line: 144, column: 61, scope: !512)
!525 = !DILocation(line: 144, column: 17, scope: !513)
!526 = !DILocation(line: 145, column: 17, scope: !512)
!527 = !DILocation(line: 146, column: 22, scope: !528)
!528 = distinct !DILexicalBlock(scope: !512, file: !1, line: 146, column: 22)
!529 = !DILocation(line: 146, column: 24, scope: !528)
!530 = !DILocation(line: 146, column: 29, scope: !528)
!531 = !DILocation(line: 146, column: 32, scope: !528)
!532 = !DILocation(line: 146, column: 35, scope: !528)
!533 = !DILocation(line: 146, column: 37, scope: !528)
!534 = !DILocation(line: 146, column: 45, scope: !528)
!535 = !DILocation(line: 146, column: 22, scope: !512)
!536 = !DILocation(line: 147, column: 17, scope: !528)
!537 = !DILocation(line: 148, column: 22, scope: !538)
!538 = distinct !DILexicalBlock(scope: !528, file: !1, line: 148, column: 22)
!539 = !DILocation(line: 148, column: 25, scope: !538)
!540 = !DILocation(line: 148, column: 27, scope: !538)
!541 = !DILocation(line: 148, column: 35, scope: !538)
!542 = !DILocation(line: 148, column: 40, scope: !538)
!543 = !DILocation(line: 148, column: 43, scope: !538)
!544 = !DILocation(line: 148, column: 46, scope: !538)
!545 = !DILocation(line: 148, column: 48, scope: !538)
!546 = !DILocation(line: 148, column: 56, scope: !538)
!547 = !DILocation(line: 148, column: 65, scope: !538)
!548 = !DILocation(line: 148, column: 68, scope: !538)
!549 = !DILocation(line: 148, column: 71, scope: !538)
!550 = !DILocation(line: 148, column: 73, scope: !538)
!551 = !DILocation(line: 148, column: 81, scope: !538)
!552 = !DILocation(line: 148, column: 22, scope: !528)
!553 = !DILocation(line: 149, column: 17, scope: !538)
!554 = !DILocation(line: 150, column: 9, scope: !513)
!555 = !DILocation(line: 153, column: 14, scope: !556)
!556 = distinct !DILexicalBlock(scope: !200, file: !1, line: 153, column: 13)
!557 = !DILocation(line: 153, column: 17, scope: !556)
!558 = !DILocation(line: 153, column: 23, scope: !556)
!559 = !DILocation(line: 153, column: 28, scope: !556)
!560 = !DILocation(line: 153, column: 31, scope: !556)
!561 = !DILocation(line: 153, column: 34, scope: !556)
!562 = !DILocation(line: 153, column: 40, scope: !556)
!563 = !DILocation(line: 153, column: 46, scope: !556)
!564 = !DILocation(line: 154, column: 15, scope: !556)
!565 = !DILocation(line: 154, column: 18, scope: !556)
!566 = !DILocation(line: 154, column: 24, scope: !556)
!567 = !DILocation(line: 154, column: 38, scope: !556)
!568 = !DILocation(line: 154, column: 41, scope: !556)
!569 = !DILocation(line: 154, column: 44, scope: !556)
!570 = !DILocation(line: 154, column: 50, scope: !556)
!571 = !DILocation(line: 154, column: 59, scope: !556)
!572 = !DILocation(line: 155, column: 15, scope: !556)
!573 = !DILocation(line: 155, column: 18, scope: !556)
!574 = !DILocation(line: 155, column: 24, scope: !556)
!575 = !DILocation(line: 155, column: 38, scope: !556)
!576 = !DILocation(line: 155, column: 41, scope: !556)
!577 = !DILocation(line: 155, column: 44, scope: !556)
!578 = !DILocation(line: 155, column: 50, scope: !556)
!579 = !DILocation(line: 153, column: 13, scope: !200)
!580 = !DILocation(line: 156, column: 13, scope: !556)
!581 = !DILocation(line: 159, column: 14, scope: !582)
!582 = distinct !DILexicalBlock(scope: !200, file: !1, line: 159, column: 13)
!583 = !DILocation(line: 159, column: 17, scope: !582)
!584 = !DILocation(line: 159, column: 23, scope: !582)
!585 = !DILocation(line: 159, column: 28, scope: !582)
!586 = !DILocation(line: 159, column: 31, scope: !582)
!587 = !DILocation(line: 159, column: 34, scope: !582)
!588 = !DILocation(line: 159, column: 40, scope: !582)
!589 = !DILocation(line: 159, column: 46, scope: !582)
!590 = !DILocation(line: 160, column: 15, scope: !582)
!591 = !DILocation(line: 160, column: 18, scope: !582)
!592 = !DILocation(line: 160, column: 24, scope: !582)
!593 = !DILocation(line: 160, column: 34, scope: !582)
!594 = !DILocation(line: 160, column: 37, scope: !582)
!595 = !DILocation(line: 160, column: 40, scope: !582)
!596 = !DILocation(line: 160, column: 46, scope: !582)
!597 = !DILocation(line: 160, column: 57, scope: !582)
!598 = !DILocation(line: 161, column: 15, scope: !582)
!599 = !DILocation(line: 161, column: 18, scope: !582)
!600 = !DILocation(line: 161, column: 24, scope: !582)
!601 = !DILocation(line: 161, column: 34, scope: !582)
!602 = !DILocation(line: 161, column: 37, scope: !582)
!603 = !DILocation(line: 161, column: 40, scope: !582)
!604 = !DILocation(line: 161, column: 46, scope: !582)
!605 = !DILocation(line: 159, column: 13, scope: !200)
!606 = !DILocation(line: 162, column: 13, scope: !582)
!607 = !DILocation(line: 165, column: 13, scope: !608)
!608 = distinct !DILexicalBlock(scope: !200, file: !1, line: 165, column: 13)
!609 = !DILocation(line: 165, column: 16, scope: !608)
!610 = !DILocation(line: 165, column: 22, scope: !608)
!611 = !DILocation(line: 165, column: 35, scope: !608)
!612 = !DILocation(line: 166, column: 15, scope: !608)
!613 = !DILocation(line: 166, column: 17, scope: !608)
!614 = !DILocation(line: 166, column: 21, scope: !608)
!615 = !DILocation(line: 166, column: 24, scope: !608)
!616 = !DILocation(line: 166, column: 27, scope: !608)
!617 = !DILocation(line: 166, column: 29, scope: !608)
!618 = !DILocation(line: 166, column: 37, scope: !608)
!619 = !DILocation(line: 166, column: 42, scope: !608)
!620 = !DILocation(line: 166, column: 45, scope: !608)
!621 = !DILocation(line: 166, column: 48, scope: !608)
!622 = !DILocation(line: 166, column: 50, scope: !608)
!623 = !DILocation(line: 166, column: 58, scope: !608)
!624 = !DILocation(line: 166, column: 67, scope: !608)
!625 = !DILocation(line: 167, column: 15, scope: !608)
!626 = !DILocation(line: 167, column: 17, scope: !608)
!627 = !DILocation(line: 167, column: 21, scope: !608)
!628 = !DILocation(line: 167, column: 24, scope: !608)
!629 = !DILocation(line: 167, column: 27, scope: !608)
!630 = !DILocation(line: 167, column: 29, scope: !608)
!631 = !DILocation(line: 167, column: 37, scope: !608)
!632 = !DILocation(line: 165, column: 13, scope: !200)
!633 = !DILocation(line: 168, column: 13, scope: !608)
!634 = !DILocation(line: 171, column: 13, scope: !635)
!635 = distinct !DILexicalBlock(scope: !200, file: !1, line: 171, column: 13)
!636 = !DILocation(line: 171, column: 16, scope: !635)
!637 = !DILocation(line: 171, column: 22, scope: !635)
!638 = !DILocation(line: 171, column: 13, scope: !200)
!639 = !DILocation(line: 172, column: 17, scope: !640)
!640 = distinct !DILexicalBlock(scope: !641, file: !1, line: 172, column: 17)
!641 = distinct !DILexicalBlock(scope: !635, file: !1, line: 171, column: 32)
!642 = !DILocation(line: 172, column: 19, scope: !640)
!643 = !DILocation(line: 172, column: 24, scope: !640)
!644 = !DILocation(line: 172, column: 27, scope: !640)
!645 = !DILocation(line: 172, column: 30, scope: !640)
!646 = !DILocation(line: 172, column: 32, scope: !640)
!647 = !DILocation(line: 172, column: 40, scope: !640)
!648 = !DILocation(line: 172, column: 45, scope: !640)
!649 = !DILocation(line: 172, column: 48, scope: !640)
!650 = !DILocation(line: 172, column: 51, scope: !640)
!651 = !DILocation(line: 172, column: 53, scope: !640)
!652 = !DILocation(line: 172, column: 61, scope: !640)
!653 = !DILocation(line: 172, column: 17, scope: !641)
!654 = !DILocation(line: 173, column: 17, scope: !640)
!655 = !DILocation(line: 174, column: 22, scope: !656)
!656 = distinct !DILexicalBlock(scope: !640, file: !1, line: 174, column: 22)
!657 = !DILocation(line: 174, column: 24, scope: !656)
!658 = !DILocation(line: 174, column: 29, scope: !656)
!659 = !DILocation(line: 174, column: 32, scope: !656)
!660 = !DILocation(line: 174, column: 35, scope: !656)
!661 = !DILocation(line: 174, column: 37, scope: !656)
!662 = !DILocation(line: 174, column: 45, scope: !656)
!663 = !DILocation(line: 174, column: 22, scope: !640)
!664 = !DILocation(line: 175, column: 17, scope: !656)
!665 = !DILocation(line: 176, column: 22, scope: !666)
!666 = distinct !DILexicalBlock(scope: !656, file: !1, line: 176, column: 22)
!667 = !DILocation(line: 176, column: 25, scope: !666)
!668 = !DILocation(line: 176, column: 27, scope: !666)
!669 = !DILocation(line: 176, column: 35, scope: !666)
!670 = !DILocation(line: 176, column: 40, scope: !666)
!671 = !DILocation(line: 176, column: 43, scope: !666)
!672 = !DILocation(line: 176, column: 46, scope: !666)
!673 = !DILocation(line: 176, column: 48, scope: !666)
!674 = !DILocation(line: 176, column: 56, scope: !666)
!675 = !DILocation(line: 176, column: 65, scope: !666)
!676 = !DILocation(line: 176, column: 68, scope: !666)
!677 = !DILocation(line: 176, column: 71, scope: !666)
!678 = !DILocation(line: 176, column: 73, scope: !666)
!679 = !DILocation(line: 176, column: 81, scope: !666)
!680 = !DILocation(line: 176, column: 22, scope: !656)
!681 = !DILocation(line: 177, column: 17, scope: !666)
!682 = !DILocation(line: 178, column: 9, scope: !641)
!683 = !DILocation(line: 180, column: 5, scope: !200)
!684 = !DILocation(line: 67, column: 29, scope: !195)
!685 = !DILocation(line: 67, column: 5, scope: !195)
!686 = distinct !{!686, !197, !687}
!687 = !DILocation(line: 180, column: 5, scope: !191)
!688 = !DILocation(line: 182, column: 10, scope: !689)
!689 = distinct !DILexicalBlock(scope: !149, file: !1, line: 182, column: 9)
!690 = !DILocation(line: 182, column: 19, scope: !689)
!691 = !DILocation(line: 182, column: 16, scope: !689)
!692 = !DILocation(line: 182, column: 25, scope: !689)
!693 = !DILocation(line: 182, column: 29, scope: !689)
!694 = !DILocation(line: 182, column: 38, scope: !689)
!695 = !DILocation(line: 182, column: 35, scope: !689)
!696 = !DILocation(line: 182, column: 44, scope: !689)
!697 = !DILocation(line: 182, column: 48, scope: !689)
!698 = !DILocation(line: 182, column: 57, scope: !689)
!699 = !DILocation(line: 182, column: 54, scope: !689)
!700 = !DILocation(line: 183, column: 9, scope: !689)
!701 = !DILocation(line: 183, column: 13, scope: !689)
!702 = !DILocation(line: 183, column: 22, scope: !689)
!703 = !DILocation(line: 183, column: 19, scope: !689)
!704 = !DILocation(line: 183, column: 28, scope: !689)
!705 = !DILocation(line: 183, column: 32, scope: !689)
!706 = !DILocation(line: 183, column: 41, scope: !689)
!707 = !DILocation(line: 183, column: 38, scope: !689)
!708 = !DILocation(line: 182, column: 9, scope: !149)
!709 = !DILocation(line: 184, column: 9, scope: !710)
!710 = distinct !DILexicalBlock(scope: !689, file: !1, line: 183, column: 48)
!711 = !DILocation(line: 187, column: 10, scope: !712)
!712 = distinct !DILexicalBlock(scope: !149, file: !1, line: 187, column: 9)
!713 = !DILocation(line: 187, column: 16, scope: !712)
!714 = !DILocation(line: 187, column: 28, scope: !712)
!715 = !DILocation(line: 187, column: 32, scope: !712)
!716 = !DILocation(line: 187, column: 38, scope: !712)
!717 = !DILocation(line: 187, column: 50, scope: !712)
!718 = !DILocation(line: 187, column: 54, scope: !712)
!719 = !DILocation(line: 187, column: 60, scope: !712)
!720 = !DILocation(line: 188, column: 9, scope: !712)
!721 = !DILocation(line: 188, column: 13, scope: !712)
!722 = !DILocation(line: 188, column: 19, scope: !712)
!723 = !DILocation(line: 188, column: 31, scope: !712)
!724 = !DILocation(line: 188, column: 35, scope: !712)
!725 = !DILocation(line: 188, column: 41, scope: !712)
!726 = !DILocation(line: 187, column: 9, scope: !149)
!727 = !DILocation(line: 189, column: 9, scope: !728)
!728 = distinct !DILexicalBlock(scope: !712, file: !1, line: 188, column: 54)
!729 = !DILocation(line: 192, column: 5, scope: !149)
!730 = !DILocation(line: 193, column: 1, scope: !149)
!731 = distinct !DISubprogram(name: "bruteFill", scope: !1, file: !1, line: 196, type: !732, scopeLine: 196, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !63)
!732 = !DISubroutineType(types: !733)
!733 = !{!60, !58, !60, !60}
!734 = !DILocalVariable(name: "ha", arg: 1, scope: !731, file: !1, line: 196, type: !58)
!735 = !DILocation(line: 196, column: 19, scope: !731)
!736 = !DILocalVariable(name: "hno", arg: 2, scope: !731, file: !1, line: 196, type: !60)
!737 = !DILocation(line: 196, column: 33, scope: !731)
!738 = !DILocalVariable(name: "attr", arg: 3, scope: !731, file: !1, line: 196, type: !60)
!739 = !DILocation(line: 196, column: 42, scope: !731)
!740 = !DILocalVariable(name: "stat", scope: !731, file: !1, line: 197, type: !60)
!741 = !DILocation(line: 197, column: 9, scope: !731)
!742 = !DILocation(line: 197, column: 28, scope: !731)
!743 = !DILocation(line: 197, column: 16, scope: !731)
!744 = !DILocation(line: 198, column: 10, scope: !745)
!745 = distinct !DILexicalBlock(scope: !731, file: !1, line: 198, column: 9)
!746 = !DILocation(line: 198, column: 15, scope: !745)
!747 = !DILocation(line: 198, column: 25, scope: !745)
!748 = !DILocation(line: 198, column: 29, scope: !745)
!749 = !DILocation(line: 198, column: 34, scope: !745)
!750 = !DILocation(line: 198, column: 9, scope: !731)
!751 = !DILocation(line: 199, column: 16, scope: !745)
!752 = !DILocation(line: 199, column: 9, scope: !745)
!753 = !DILocalVariable(name: "hb", scope: !731, file: !1, line: 201, type: !754)
!754 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 800, elements: !755)
!755 = !{!62, !62}
!756 = !DILocation(line: 201, column: 9, scope: !731)
!757 = !DILocation(line: 202, column: 5, scope: !731)
!758 = !DILocation(line: 202, column: 16, scope: !731)
!759 = !DILocalVariable(name: "i", scope: !760, file: !1, line: 203, type: !60)
!760 = distinct !DILexicalBlock(scope: !731, file: !1, line: 203, column: 5)
!761 = !DILocation(line: 203, column: 14, scope: !760)
!762 = !DILocation(line: 203, column: 10, scope: !760)
!763 = !DILocation(line: 203, column: 21, scope: !764)
!764 = distinct !DILexicalBlock(scope: !760, file: !1, line: 203, column: 5)
!765 = !DILocation(line: 203, column: 23, scope: !764)
!766 = !DILocation(line: 203, column: 5, scope: !760)
!767 = !DILocation(line: 204, column: 25, scope: !768)
!768 = distinct !DILexicalBlock(scope: !764, file: !1, line: 203, column: 33)
!769 = !DILocation(line: 204, column: 12, scope: !768)
!770 = !DILocation(line: 204, column: 9, scope: !768)
!771 = !DILocation(line: 204, column: 17, scope: !768)
!772 = !DILocation(line: 204, column: 23, scope: !768)
!773 = !DILocation(line: 205, column: 28, scope: !768)
!774 = !DILocation(line: 205, column: 16, scope: !768)
!775 = !DILocation(line: 205, column: 14, scope: !768)
!776 = !DILocation(line: 206, column: 13, scope: !777)
!777 = distinct !DILexicalBlock(scope: !768, file: !1, line: 206, column: 13)
!778 = !DILocation(line: 206, column: 18, scope: !777)
!779 = !DILocation(line: 206, column: 13, scope: !768)
!780 = !DILocalVariable(name: "nexthno", scope: !781, file: !1, line: 207, type: !60)
!781 = distinct !DILexicalBlock(scope: !777, file: !1, line: 206, column: 30)
!782 = !DILocation(line: 207, column: 17, scope: !781)
!783 = !DILocalVariable(name: "nextattr", scope: !781, file: !1, line: 207, type: !60)
!784 = !DILocation(line: 207, column: 26, scope: !781)
!785 = !DILocation(line: 208, column: 17, scope: !786)
!786 = distinct !DILexicalBlock(scope: !781, file: !1, line: 208, column: 17)
!787 = !DILocation(line: 208, column: 22, scope: !786)
!788 = !DILocation(line: 208, column: 17, scope: !781)
!789 = !DILocation(line: 209, column: 28, scope: !790)
!790 = distinct !DILexicalBlock(scope: !786, file: !1, line: 208, column: 27)
!791 = !DILocation(line: 209, column: 33, scope: !790)
!792 = !DILocation(line: 209, column: 26, scope: !790)
!793 = !DILocation(line: 210, column: 27, scope: !790)
!794 = !DILocation(line: 210, column: 25, scope: !790)
!795 = !DILocation(line: 211, column: 13, scope: !790)
!796 = !DILocation(line: 212, column: 26, scope: !797)
!797 = distinct !DILexicalBlock(scope: !786, file: !1, line: 211, column: 20)
!798 = !DILocation(line: 213, column: 27, scope: !797)
!799 = !DILocation(line: 213, column: 31, scope: !797)
!800 = !DILocation(line: 213, column: 25, scope: !797)
!801 = !DILocation(line: 216, column: 30, scope: !781)
!802 = !DILocation(line: 216, column: 34, scope: !781)
!803 = !DILocation(line: 216, column: 43, scope: !781)
!804 = !DILocation(line: 216, column: 20, scope: !781)
!805 = !DILocation(line: 216, column: 18, scope: !781)
!806 = !DILocation(line: 217, column: 17, scope: !807)
!807 = distinct !DILexicalBlock(scope: !781, file: !1, line: 217, column: 17)
!808 = !DILocation(line: 217, column: 22, scope: !807)
!809 = !DILocation(line: 217, column: 17, scope: !781)
!810 = !DILocation(line: 218, column: 24, scope: !811)
!811 = distinct !DILexicalBlock(scope: !807, file: !1, line: 217, column: 34)
!812 = !DILocation(line: 218, column: 17, scope: !811)
!813 = !DILocation(line: 219, column: 24, scope: !811)
!814 = !DILocation(line: 219, column: 17, scope: !811)
!815 = !DILocation(line: 221, column: 9, scope: !781)
!816 = !DILocation(line: 222, column: 5, scope: !768)
!817 = !DILocation(line: 203, column: 29, scope: !764)
!818 = !DILocation(line: 203, column: 5, scope: !764)
!819 = distinct !{!819, !766, !820}
!820 = !DILocation(line: 222, column: 5, scope: !760)
!821 = !DILocation(line: 225, column: 5, scope: !731)
!822 = !DILocation(line: 226, column: 1, scope: !731)
!823 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 229, type: !824, scopeLine: 229, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !63)
!824 = !DISubroutineType(types: !825)
!825 = !{!60}
!826 = !DILocalVariable(name: "ha", scope: !823, file: !1, line: 230, type: !754)
!827 = !DILocation(line: 230, column: 9, scope: !823)
!828 = !DILocation(line: 234, column: 15, scope: !823)
!829 = !DILocation(line: 234, column: 5, scope: !823)
!830 = !DILocation(line: 235, column: 17, scope: !823)
!831 = !DILocation(line: 235, column: 5, scope: !823)
!832 = !DILocation(line: 237, column: 5, scope: !823)
