; ModuleID = 'knapsack-problem-0-1.c'
source_filename = "knapsack-problem-0-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.item_t = type { i8*, i32, i32 }

@.str = private unnamed_addr constant [4 x i8] c"map\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"compass\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"water\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"sandwich\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"glucose\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"tin\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"banana\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"apple\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"cheese\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"beer\00", align 1
@.str.10 = private unnamed_addr constant [13 x i8] c"suntan cream\00", align 1
@.str.11 = private unnamed_addr constant [7 x i8] c"camera\00", align 1
@.str.12 = private unnamed_addr constant [8 x i8] c"T-shirt\00", align 1
@.str.13 = private unnamed_addr constant [9 x i8] c"trousers\00", align 1
@.str.14 = private unnamed_addr constant [9 x i8] c"umbrella\00", align 1
@.str.15 = private unnamed_addr constant [20 x i8] c"waterproof trousers\00", align 1
@.str.16 = private unnamed_addr constant [23 x i8] c"waterproof overclothes\00", align 1
@.str.17 = private unnamed_addr constant [10 x i8] c"note-case\00", align 1
@.str.18 = private unnamed_addr constant [11 x i8] c"sunglasses\00", align 1
@.str.19 = private unnamed_addr constant [6 x i8] c"towel\00", align 1
@.str.20 = private unnamed_addr constant [6 x i8] c"socks\00", align 1
@.str.21 = private unnamed_addr constant [5 x i8] c"book\00", align 1
@items = dso_local global [22 x %struct.item_t] [%struct.item_t { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 9, i32 150 }, %struct.item_t { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 13, i32 35 }, %struct.item_t { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i32 153, i32 200 }, %struct.item_t { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i32 50, i32 160 }, %struct.item_t { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), i32 15, i32 60 }, %struct.item_t { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i32 68, i32 45 }, %struct.item_t { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i32 27, i32 60 }, %struct.item_t { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0), i32 39, i32 40 }, %struct.item_t { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0), i32 23, i32 30 }, %struct.item_t { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), i32 52, i32 10 }, %struct.item_t { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i32 0, i32 0), i32 11, i32 70 }, %struct.item_t { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i32 0, i32 0), i32 32, i32 30 }, %struct.item_t { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.12, i32 0, i32 0), i32 24, i32 15 }, %struct.item_t { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.13, i32 0, i32 0), i32 48, i32 10 }, %struct.item_t { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.14, i32 0, i32 0), i32 73, i32 40 }, %struct.item_t { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.15, i32 0, i32 0), i32 42, i32 70 }, %struct.item_t { i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.16, i32 0, i32 0), i32 43, i32 75 }, %struct.item_t { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.17, i32 0, i32 0), i32 22, i32 80 }, %struct.item_t { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.18, i32 0, i32 0), i32 7, i32 20 }, %struct.item_t { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.19, i32 0, i32 0), i32 18, i32 12 }, %struct.item_t { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.20, i32 0, i32 0), i32 4, i32 50 }, %struct.item_t { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i32 0, i32 0), i32 30, i32 10 }], align 16, !dbg !0
@.str.22 = private unnamed_addr constant [15 x i8] c"%-22s %5d %5d\0A\00", align 1
@.str.23 = private unnamed_addr constant [8 x i8] c"totals:\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @knapsack(%struct.item_t* %items, i32 %n, i32 %w) #0 !dbg !22 {
entry:
  %items.addr = alloca %struct.item_t*, align 8
  %n.addr = alloca i32, align 4
  %w.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %mm = alloca i32*, align 8
  %m = alloca i32**, align 8
  %s = alloca i32*, align 8
  store %struct.item_t* %items, %struct.item_t** %items.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.item_t** %items.addr, metadata !27, metadata !DIExpression()), !dbg !28
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !29, metadata !DIExpression()), !dbg !30
  store i32 %w, i32* %w.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %w.addr, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i32* %i, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32* %j, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i32* %a, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32* %b, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i32** %mm, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i32*** %m, metadata !43, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i32** %s, metadata !46, metadata !DIExpression()), !dbg !47
  %0 = load i32, i32* %n.addr, align 4, !dbg !48
  %add = add nsw i32 %0, 1, !dbg !49
  %1 = load i32, i32* %w.addr, align 4, !dbg !50
  %add1 = add nsw i32 %1, 1, !dbg !51
  %mul = mul nsw i32 %add, %add1, !dbg !52
  %conv = sext i32 %mul to i64, !dbg !53
  %call = call noalias i8* @calloc(i64 %conv, i64 4) #4, !dbg !54
  %2 = bitcast i8* %call to i32*, !dbg !54
  store i32* %2, i32** %mm, align 8, !dbg !55
  %3 = load i32, i32* %n.addr, align 4, !dbg !56
  %add2 = add nsw i32 %3, 1, !dbg !57
  %conv3 = sext i32 %add2 to i64, !dbg !58
  %mul4 = mul i64 %conv3, 8, !dbg !59
  %call5 = call noalias i8* @malloc(i64 %mul4) #4, !dbg !60
  %4 = bitcast i8* %call5 to i32**, !dbg !60
  store i32** %4, i32*** %m, align 8, !dbg !61
  %5 = load i32*, i32** %mm, align 8, !dbg !62
  %6 = load i32**, i32*** %m, align 8, !dbg !63
  %arrayidx = getelementptr inbounds i32*, i32** %6, i64 0, !dbg !63
  store i32* %5, i32** %arrayidx, align 8, !dbg !64
  store i32 1, i32* %i, align 4, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc54, %entry
  %7 = load i32, i32* %i, align 4, !dbg !68
  %8 = load i32, i32* %n.addr, align 4, !dbg !70
  %cmp = icmp sle i32 %7, %8, !dbg !71
  br i1 %cmp, label %for.body, label %for.end56, !dbg !72

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %mm, align 8, !dbg !73
  %10 = load i32, i32* %i, align 4, !dbg !75
  %11 = load i32, i32* %w.addr, align 4, !dbg !76
  %add7 = add nsw i32 %11, 1, !dbg !77
  %mul8 = mul nsw i32 %10, %add7, !dbg !78
  %idxprom = sext i32 %mul8 to i64, !dbg !73
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom, !dbg !73
  %12 = load i32**, i32*** %m, align 8, !dbg !79
  %13 = load i32, i32* %i, align 4, !dbg !80
  %idxprom10 = sext i32 %13 to i64, !dbg !79
  %arrayidx11 = getelementptr inbounds i32*, i32** %12, i64 %idxprom10, !dbg !79
  store i32* %arrayidx9, i32** %arrayidx11, align 8, !dbg !81
  store i32 0, i32* %j, align 4, !dbg !82
  br label %for.cond12, !dbg !84

for.cond12:                                       ; preds = %for.inc, %for.body
  %14 = load i32, i32* %j, align 4, !dbg !85
  %15 = load i32, i32* %w.addr, align 4, !dbg !87
  %cmp13 = icmp sle i32 %14, %15, !dbg !88
  br i1 %cmp13, label %for.body15, label %for.end, !dbg !89

for.body15:                                       ; preds = %for.cond12
  %16 = load %struct.item_t*, %struct.item_t** %items.addr, align 8, !dbg !90
  %17 = load i32, i32* %i, align 4, !dbg !93
  %sub = sub nsw i32 %17, 1, !dbg !94
  %idxprom16 = sext i32 %sub to i64, !dbg !90
  %arrayidx17 = getelementptr inbounds %struct.item_t, %struct.item_t* %16, i64 %idxprom16, !dbg !90
  %weight = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx17, i32 0, i32 1, !dbg !95
  %18 = load i32, i32* %weight, align 8, !dbg !95
  %19 = load i32, i32* %j, align 4, !dbg !96
  %cmp18 = icmp sgt i32 %18, %19, !dbg !97
  br i1 %cmp18, label %if.then, label %if.else, !dbg !98, !cf.info !99

if.then:                                          ; preds = %for.body15
  %20 = load i32**, i32*** %m, align 8, !dbg !100
  %21 = load i32, i32* %i, align 4, !dbg !102
  %sub20 = sub nsw i32 %21, 1, !dbg !103
  %idxprom21 = sext i32 %sub20 to i64, !dbg !100
  %arrayidx22 = getelementptr inbounds i32*, i32** %20, i64 %idxprom21, !dbg !100
  %22 = load i32*, i32** %arrayidx22, align 8, !dbg !100
  %23 = load i32, i32* %j, align 4, !dbg !104
  %idxprom23 = sext i32 %23 to i64, !dbg !100
  %arrayidx24 = getelementptr inbounds i32, i32* %22, i64 %idxprom23, !dbg !100
  %24 = load i32, i32* %arrayidx24, align 4, !dbg !100
  %25 = load i32**, i32*** %m, align 8, !dbg !105
  %26 = load i32, i32* %i, align 4, !dbg !106
  %idxprom25 = sext i32 %26 to i64, !dbg !105
  %arrayidx26 = getelementptr inbounds i32*, i32** %25, i64 %idxprom25, !dbg !105
  %27 = load i32*, i32** %arrayidx26, align 8, !dbg !105
  %28 = load i32, i32* %j, align 4, !dbg !107
  %idxprom27 = sext i32 %28 to i64, !dbg !105
  %arrayidx28 = getelementptr inbounds i32, i32* %27, i64 %idxprom27, !dbg !105
  store i32 %24, i32* %arrayidx28, align 4, !dbg !108
  br label %if.end, !dbg !109

if.else:                                          ; preds = %for.body15
  %29 = load i32**, i32*** %m, align 8, !dbg !110
  %30 = load i32, i32* %i, align 4, !dbg !112
  %sub29 = sub nsw i32 %30, 1, !dbg !113
  %idxprom30 = sext i32 %sub29 to i64, !dbg !110
  %arrayidx31 = getelementptr inbounds i32*, i32** %29, i64 %idxprom30, !dbg !110
  %31 = load i32*, i32** %arrayidx31, align 8, !dbg !110
  %32 = load i32, i32* %j, align 4, !dbg !114
  %idxprom32 = sext i32 %32 to i64, !dbg !110
  %arrayidx33 = getelementptr inbounds i32, i32* %31, i64 %idxprom32, !dbg !110
  %33 = load i32, i32* %arrayidx33, align 4, !dbg !110
  store i32 %33, i32* %a, align 4, !dbg !115
  %34 = load i32**, i32*** %m, align 8, !dbg !116
  %35 = load i32, i32* %i, align 4, !dbg !117
  %sub34 = sub nsw i32 %35, 1, !dbg !118
  %idxprom35 = sext i32 %sub34 to i64, !dbg !116
  %arrayidx36 = getelementptr inbounds i32*, i32** %34, i64 %idxprom35, !dbg !116
  %36 = load i32*, i32** %arrayidx36, align 8, !dbg !116
  %37 = load i32, i32* %j, align 4, !dbg !119
  %38 = load %struct.item_t*, %struct.item_t** %items.addr, align 8, !dbg !120
  %39 = load i32, i32* %i, align 4, !dbg !121
  %sub37 = sub nsw i32 %39, 1, !dbg !122
  %idxprom38 = sext i32 %sub37 to i64, !dbg !120
  %arrayidx39 = getelementptr inbounds %struct.item_t, %struct.item_t* %38, i64 %idxprom38, !dbg !120
  %weight40 = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx39, i32 0, i32 1, !dbg !123
  %40 = load i32, i32* %weight40, align 8, !dbg !123
  %sub41 = sub nsw i32 %37, %40, !dbg !124
  %idxprom42 = sext i32 %sub41 to i64, !dbg !116
  %arrayidx43 = getelementptr inbounds i32, i32* %36, i64 %idxprom42, !dbg !116
  %41 = load i32, i32* %arrayidx43, align 4, !dbg !116
  %42 = load %struct.item_t*, %struct.item_t** %items.addr, align 8, !dbg !125
  %43 = load i32, i32* %i, align 4, !dbg !126
  %sub44 = sub nsw i32 %43, 1, !dbg !127
  %idxprom45 = sext i32 %sub44 to i64, !dbg !125
  %arrayidx46 = getelementptr inbounds %struct.item_t, %struct.item_t* %42, i64 %idxprom45, !dbg !125
  %value = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx46, i32 0, i32 2, !dbg !128
  %44 = load i32, i32* %value, align 4, !dbg !128
  %add47 = add nsw i32 %41, %44, !dbg !129
  store i32 %add47, i32* %b, align 4, !dbg !130
  %45 = load i32, i32* %a, align 4, !dbg !131
  %46 = load i32, i32* %b, align 4, !dbg !132
  %cmp48 = icmp sgt i32 %45, %46, !dbg !133
  br i1 %cmp48, label %cond.true, label %cond.false, !dbg !131

cond.true:                                        ; preds = %if.else
  %47 = load i32, i32* %a, align 4, !dbg !134
  br label %cond.end, !dbg !131

cond.false:                                       ; preds = %if.else
  %48 = load i32, i32* %b, align 4, !dbg !135
  br label %cond.end, !dbg !131

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %47, %cond.true ], [ %48, %cond.false ], !dbg !131
  %49 = load i32**, i32*** %m, align 8, !dbg !136
  %50 = load i32, i32* %i, align 4, !dbg !137
  %idxprom50 = sext i32 %50 to i64, !dbg !136
  %arrayidx51 = getelementptr inbounds i32*, i32** %49, i64 %idxprom50, !dbg !136
  %51 = load i32*, i32** %arrayidx51, align 8, !dbg !136
  %52 = load i32, i32* %j, align 4, !dbg !138
  %idxprom52 = sext i32 %52 to i64, !dbg !136
  %arrayidx53 = getelementptr inbounds i32, i32* %51, i64 %idxprom52, !dbg !136
  store i32 %cond, i32* %arrayidx53, align 4, !dbg !139
  br label %if.end

if.end:                                           ; preds = %cond.end, %if.then
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %if.end
  %53 = load i32, i32* %j, align 4, !dbg !141
  %inc = add nsw i32 %53, 1, !dbg !141
  store i32 %inc, i32* %j, align 4, !dbg !141
  br label %for.cond12, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond12
  br label %for.inc54, !dbg !145

for.inc54:                                        ; preds = %for.end
  %54 = load i32, i32* %i, align 4, !dbg !146
  %inc55 = add nsw i32 %54, 1, !dbg !146
  store i32 %inc55, i32* %i, align 4, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end56:                                        ; preds = %for.cond
  %55 = load i32, i32* %n.addr, align 4, !dbg !150
  %conv57 = sext i32 %55 to i64, !dbg !150
  %call58 = call noalias i8* @calloc(i64 %conv57, i64 4) #4, !dbg !151
  %56 = bitcast i8* %call58 to i32*, !dbg !151
  store i32* %56, i32** %s, align 8, !dbg !152
  %57 = load i32, i32* %n.addr, align 4, !dbg !153
  store i32 %57, i32* %i, align 4, !dbg !155
  %58 = load i32, i32* %w.addr, align 4, !dbg !156
  store i32 %58, i32* %j, align 4, !dbg !157
  br label %for.cond59, !dbg !158

for.cond59:                                       ; preds = %for.inc84, %for.end56
  %59 = load i32, i32* %i, align 4, !dbg !159
  %cmp60 = icmp sgt i32 %59, 0, !dbg !161
  br i1 %cmp60, label %for.body62, label %for.end85, !dbg !162

for.body62:                                       ; preds = %for.cond59
  %60 = load i32**, i32*** %m, align 8, !dbg !163
  %61 = load i32, i32* %i, align 4, !dbg !166
  %idxprom63 = sext i32 %61 to i64, !dbg !163
  %arrayidx64 = getelementptr inbounds i32*, i32** %60, i64 %idxprom63, !dbg !163
  %62 = load i32*, i32** %arrayidx64, align 8, !dbg !163
  %63 = load i32, i32* %j, align 4, !dbg !167
  %idxprom65 = sext i32 %63 to i64, !dbg !163
  %arrayidx66 = getelementptr inbounds i32, i32* %62, i64 %idxprom65, !dbg !163
  %64 = load i32, i32* %arrayidx66, align 4, !dbg !163
  %65 = load i32**, i32*** %m, align 8, !dbg !168
  %66 = load i32, i32* %i, align 4, !dbg !169
  %sub67 = sub nsw i32 %66, 1, !dbg !170
  %idxprom68 = sext i32 %sub67 to i64, !dbg !168
  %arrayidx69 = getelementptr inbounds i32*, i32** %65, i64 %idxprom68, !dbg !168
  %67 = load i32*, i32** %arrayidx69, align 8, !dbg !168
  %68 = load i32, i32* %j, align 4, !dbg !171
  %idxprom70 = sext i32 %68 to i64, !dbg !168
  %arrayidx71 = getelementptr inbounds i32, i32* %67, i64 %idxprom70, !dbg !168
  %69 = load i32, i32* %arrayidx71, align 4, !dbg !168
  %cmp72 = icmp sgt i32 %64, %69, !dbg !172
  br i1 %cmp72, label %if.then74, label %if.end83, !dbg !173, !cf.info !99

if.then74:                                        ; preds = %for.body62
  %70 = load i32*, i32** %s, align 8, !dbg !174
  %71 = load i32, i32* %i, align 4, !dbg !176
  %sub75 = sub nsw i32 %71, 1, !dbg !177
  %idxprom76 = sext i32 %sub75 to i64, !dbg !174
  %arrayidx77 = getelementptr inbounds i32, i32* %70, i64 %idxprom76, !dbg !174
  store i32 1, i32* %arrayidx77, align 4, !dbg !178
  %72 = load %struct.item_t*, %struct.item_t** %items.addr, align 8, !dbg !179
  %73 = load i32, i32* %i, align 4, !dbg !180
  %sub78 = sub nsw i32 %73, 1, !dbg !181
  %idxprom79 = sext i32 %sub78 to i64, !dbg !179
  %arrayidx80 = getelementptr inbounds %struct.item_t, %struct.item_t* %72, i64 %idxprom79, !dbg !179
  %weight81 = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx80, i32 0, i32 1, !dbg !182
  %74 = load i32, i32* %weight81, align 8, !dbg !182
  %75 = load i32, i32* %j, align 4, !dbg !183
  %sub82 = sub nsw i32 %75, %74, !dbg !183
  store i32 %sub82, i32* %j, align 4, !dbg !183
  br label %if.end83, !dbg !184

if.end83:                                         ; preds = %if.then74, %for.body62
  br label %for.inc84, !dbg !185

for.inc84:                                        ; preds = %if.end83
  %76 = load i32, i32* %i, align 4, !dbg !186
  %dec = add nsw i32 %76, -1, !dbg !186
  store i32 %dec, i32* %i, align 4, !dbg !186
  br label %for.cond59, !dbg !187, !llvm.loop !188

for.end85:                                        ; preds = %for.cond59
  %77 = load i32*, i32** %mm, align 8, !dbg !190
  %78 = bitcast i32* %77 to i8*, !dbg !190
  call void @free(i8* %78) #4, !dbg !191
  %79 = load i32**, i32*** %m, align 8, !dbg !192
  %80 = bitcast i32** %79 to i8*, !dbg !192
  call void @free(i8* %80) #4, !dbg !193
  %81 = load i32*, i32** %s, align 8, !dbg !194
  ret i32* %81, !dbg !195
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !196 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %tw = alloca i32, align 4
  %tv = alloca i32, align 4
  %s = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !199, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata i32* %n, metadata !201, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata i32* %tw, metadata !203, metadata !DIExpression()), !dbg !204
  store i32 0, i32* %tw, align 4, !dbg !204
  call void @llvm.dbg.declare(metadata i32* %tv, metadata !205, metadata !DIExpression()), !dbg !206
  store i32 0, i32* %tv, align 4, !dbg !206
  call void @llvm.dbg.declare(metadata i32** %s, metadata !207, metadata !DIExpression()), !dbg !208
  store i32 22, i32* %n, align 4, !dbg !209
  %0 = load i32, i32* %n, align 4, !dbg !210
  %call = call i32* @knapsack(%struct.item_t* getelementptr inbounds ([22 x %struct.item_t], [22 x %struct.item_t]* @items, i64 0, i64 0), i32 %0, i32 400), !dbg !211
  store i32* %call, i32** %s, align 8, !dbg !212
  store i32 0, i32* %i, align 4, !dbg !213
  br label %for.cond, !dbg !215

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !216
  %2 = load i32, i32* %n, align 4, !dbg !218
  %cmp = icmp slt i32 %1, %2, !dbg !219
  br i1 %cmp, label %for.body, label %for.end, !dbg !220

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %s, align 8, !dbg !221
  %4 = load i32, i32* %i, align 4, !dbg !224
  %idxprom = sext i32 %4 to i64, !dbg !221
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !221
  %5 = load i32, i32* %arrayidx, align 4, !dbg !221
  %tobool = icmp ne i32 %5, 0, !dbg !221
  br i1 %tobool, label %if.then, label %if.end, !dbg !225, !cf.info !99

if.then:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !226
  %idxprom1 = sext i32 %6 to i64, !dbg !228
  %arrayidx2 = getelementptr inbounds [22 x %struct.item_t], [22 x %struct.item_t]* @items, i64 0, i64 %idxprom1, !dbg !228
  %name = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx2, i32 0, i32 0, !dbg !229
  %7 = load i8*, i8** %name, align 16, !dbg !229
  %8 = load i32, i32* %i, align 4, !dbg !230
  %idxprom3 = sext i32 %8 to i64, !dbg !231
  %arrayidx4 = getelementptr inbounds [22 x %struct.item_t], [22 x %struct.item_t]* @items, i64 0, i64 %idxprom3, !dbg !231
  %weight = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx4, i32 0, i32 1, !dbg !232
  %9 = load i32, i32* %weight, align 8, !dbg !232
  %10 = load i32, i32* %i, align 4, !dbg !233
  %idxprom5 = sext i32 %10 to i64, !dbg !234
  %arrayidx6 = getelementptr inbounds [22 x %struct.item_t], [22 x %struct.item_t]* @items, i64 0, i64 %idxprom5, !dbg !234
  %value = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx6, i32 0, i32 2, !dbg !235
  %11 = load i32, i32* %value, align 4, !dbg !235
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.22, i64 0, i64 0), i8* %7, i32 %9, i32 %11), !dbg !236
  %12 = load i32, i32* %i, align 4, !dbg !237
  %idxprom8 = sext i32 %12 to i64, !dbg !238
  %arrayidx9 = getelementptr inbounds [22 x %struct.item_t], [22 x %struct.item_t]* @items, i64 0, i64 %idxprom8, !dbg !238
  %weight10 = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx9, i32 0, i32 1, !dbg !239
  %13 = load i32, i32* %weight10, align 8, !dbg !239
  %14 = load i32, i32* %tw, align 4, !dbg !240
  %add = add nsw i32 %14, %13, !dbg !240
  store i32 %add, i32* %tw, align 4, !dbg !240
  %15 = load i32, i32* %i, align 4, !dbg !241
  %idxprom11 = sext i32 %15 to i64, !dbg !242
  %arrayidx12 = getelementptr inbounds [22 x %struct.item_t], [22 x %struct.item_t]* @items, i64 0, i64 %idxprom11, !dbg !242
  %value13 = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx12, i32 0, i32 2, !dbg !243
  %16 = load i32, i32* %value13, align 4, !dbg !243
  %17 = load i32, i32* %tv, align 4, !dbg !244
  %add14 = add nsw i32 %17, %16, !dbg !244
  store i32 %add14, i32* %tv, align 4, !dbg !244
  br label %if.end, !dbg !245

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !246

for.inc:                                          ; preds = %if.end
  %18 = load i32, i32* %i, align 4, !dbg !247
  %inc = add nsw i32 %18, 1, !dbg !247
  store i32 %inc, i32* %i, align 4, !dbg !247
  br label %for.cond, !dbg !248, !llvm.loop !249

for.end:                                          ; preds = %for.cond
  %19 = load i32, i32* %tw, align 4, !dbg !251
  %20 = load i32, i32* %tv, align 4, !dbg !252
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.22, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.23, i64 0, i64 0), i32 %19, i32 %20), !dbg !253
  ret i32 0, !dbg !254
}

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "items", scope: !2, file: !3, line: 10, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "knapsack-problem-0-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Knapsack-problem-0-1")
!4 = !{}
!5 = !{!0}
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 2816, elements: !16)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "item_t", file: !3, line: 8, baseType: !8)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 4, size: 128, elements: !9)
!9 = !{!10, !13, !15}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !8, file: !3, line: 5, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "weight", scope: !8, file: !3, line: 6, baseType: !14, size: 32, offset: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !8, file: !3, line: 7, baseType: !14, size: 32, offset: 96)
!16 = !{!17}
!17 = !DISubrange(count: 22)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!22 = distinct !DISubprogram(name: "knapsack", scope: !3, file: !3, line: 35, type: !23, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{!25, !26, !14, !14}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!27 = !DILocalVariable(name: "items", arg: 1, scope: !22, file: !3, line: 35, type: !26)
!28 = !DILocation(line: 35, column: 24, scope: !22)
!29 = !DILocalVariable(name: "n", arg: 2, scope: !22, file: !3, line: 35, type: !14)
!30 = !DILocation(line: 35, column: 35, scope: !22)
!31 = !DILocalVariable(name: "w", arg: 3, scope: !22, file: !3, line: 35, type: !14)
!32 = !DILocation(line: 35, column: 42, scope: !22)
!33 = !DILocalVariable(name: "i", scope: !22, file: !3, line: 36, type: !14)
!34 = !DILocation(line: 36, column: 9, scope: !22)
!35 = !DILocalVariable(name: "j", scope: !22, file: !3, line: 36, type: !14)
!36 = !DILocation(line: 36, column: 12, scope: !22)
!37 = !DILocalVariable(name: "a", scope: !22, file: !3, line: 36, type: !14)
!38 = !DILocation(line: 36, column: 15, scope: !22)
!39 = !DILocalVariable(name: "b", scope: !22, file: !3, line: 36, type: !14)
!40 = !DILocation(line: 36, column: 18, scope: !22)
!41 = !DILocalVariable(name: "mm", scope: !22, file: !3, line: 36, type: !25)
!42 = !DILocation(line: 36, column: 22, scope: !22)
!43 = !DILocalVariable(name: "m", scope: !22, file: !3, line: 36, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!45 = !DILocation(line: 36, column: 28, scope: !22)
!46 = !DILocalVariable(name: "s", scope: !22, file: !3, line: 36, type: !25)
!47 = !DILocation(line: 36, column: 32, scope: !22)
!48 = !DILocation(line: 37, column: 18, scope: !22)
!49 = !DILocation(line: 37, column: 20, scope: !22)
!50 = !DILocation(line: 37, column: 28, scope: !22)
!51 = !DILocation(line: 37, column: 30, scope: !22)
!52 = !DILocation(line: 37, column: 25, scope: !22)
!53 = !DILocation(line: 37, column: 17, scope: !22)
!54 = !DILocation(line: 37, column: 10, scope: !22)
!55 = !DILocation(line: 37, column: 8, scope: !22)
!56 = !DILocation(line: 38, column: 17, scope: !22)
!57 = !DILocation(line: 38, column: 19, scope: !22)
!58 = !DILocation(line: 38, column: 16, scope: !22)
!59 = !DILocation(line: 38, column: 24, scope: !22)
!60 = !DILocation(line: 38, column: 9, scope: !22)
!61 = !DILocation(line: 38, column: 7, scope: !22)
!62 = !DILocation(line: 39, column: 12, scope: !22)
!63 = !DILocation(line: 39, column: 5, scope: !22)
!64 = !DILocation(line: 39, column: 10, scope: !22)
!65 = !DILocation(line: 40, column: 12, scope: !66)
!66 = distinct !DILexicalBlock(scope: !22, file: !3, line: 40, column: 5)
!67 = !DILocation(line: 40, column: 10, scope: !66)
!68 = !DILocation(line: 40, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !3, line: 40, column: 5)
!70 = !DILocation(line: 40, column: 22, scope: !69)
!71 = !DILocation(line: 40, column: 19, scope: !69)
!72 = !DILocation(line: 40, column: 5, scope: !66)
!73 = !DILocation(line: 41, column: 17, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !3, line: 40, column: 30)
!75 = !DILocation(line: 41, column: 20, scope: !74)
!76 = !DILocation(line: 41, column: 25, scope: !74)
!77 = !DILocation(line: 41, column: 27, scope: !74)
!78 = !DILocation(line: 41, column: 22, scope: !74)
!79 = !DILocation(line: 41, column: 9, scope: !74)
!80 = !DILocation(line: 41, column: 11, scope: !74)
!81 = !DILocation(line: 41, column: 14, scope: !74)
!82 = !DILocation(line: 42, column: 16, scope: !83)
!83 = distinct !DILexicalBlock(scope: !74, file: !3, line: 42, column: 9)
!84 = !DILocation(line: 42, column: 14, scope: !83)
!85 = !DILocation(line: 42, column: 21, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !3, line: 42, column: 9)
!87 = !DILocation(line: 42, column: 26, scope: !86)
!88 = !DILocation(line: 42, column: 23, scope: !86)
!89 = !DILocation(line: 42, column: 9, scope: !83)
!90 = !DILocation(line: 43, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !92, file: !3, line: 43, column: 17)
!92 = distinct !DILexicalBlock(scope: !86, file: !3, line: 42, column: 34)
!93 = !DILocation(line: 43, column: 23, scope: !91)
!94 = !DILocation(line: 43, column: 25, scope: !91)
!95 = !DILocation(line: 43, column: 30, scope: !91)
!96 = !DILocation(line: 43, column: 39, scope: !91)
!97 = !DILocation(line: 43, column: 37, scope: !91)
!98 = !DILocation(line: 43, column: 17, scope: !92)
!99 = !{!"if"}
!100 = !DILocation(line: 44, column: 27, scope: !101)
!101 = distinct !DILexicalBlock(scope: !91, file: !3, line: 43, column: 42)
!102 = !DILocation(line: 44, column: 29, scope: !101)
!103 = !DILocation(line: 44, column: 31, scope: !101)
!104 = !DILocation(line: 44, column: 36, scope: !101)
!105 = !DILocation(line: 44, column: 17, scope: !101)
!106 = !DILocation(line: 44, column: 19, scope: !101)
!107 = !DILocation(line: 44, column: 22, scope: !101)
!108 = !DILocation(line: 44, column: 25, scope: !101)
!109 = !DILocation(line: 45, column: 13, scope: !101)
!110 = !DILocation(line: 47, column: 21, scope: !111)
!111 = distinct !DILexicalBlock(scope: !91, file: !3, line: 46, column: 18)
!112 = !DILocation(line: 47, column: 23, scope: !111)
!113 = !DILocation(line: 47, column: 25, scope: !111)
!114 = !DILocation(line: 47, column: 30, scope: !111)
!115 = !DILocation(line: 47, column: 19, scope: !111)
!116 = !DILocation(line: 48, column: 21, scope: !111)
!117 = !DILocation(line: 48, column: 23, scope: !111)
!118 = !DILocation(line: 48, column: 25, scope: !111)
!119 = !DILocation(line: 48, column: 30, scope: !111)
!120 = !DILocation(line: 48, column: 34, scope: !111)
!121 = !DILocation(line: 48, column: 40, scope: !111)
!122 = !DILocation(line: 48, column: 42, scope: !111)
!123 = !DILocation(line: 48, column: 47, scope: !111)
!124 = !DILocation(line: 48, column: 32, scope: !111)
!125 = !DILocation(line: 48, column: 57, scope: !111)
!126 = !DILocation(line: 48, column: 63, scope: !111)
!127 = !DILocation(line: 48, column: 65, scope: !111)
!128 = !DILocation(line: 48, column: 70, scope: !111)
!129 = !DILocation(line: 48, column: 55, scope: !111)
!130 = !DILocation(line: 48, column: 19, scope: !111)
!131 = !DILocation(line: 49, column: 27, scope: !111)
!132 = !DILocation(line: 49, column: 31, scope: !111)
!133 = !DILocation(line: 49, column: 29, scope: !111)
!134 = !DILocation(line: 49, column: 35, scope: !111)
!135 = !DILocation(line: 49, column: 39, scope: !111)
!136 = !DILocation(line: 49, column: 17, scope: !111)
!137 = !DILocation(line: 49, column: 19, scope: !111)
!138 = !DILocation(line: 49, column: 22, scope: !111)
!139 = !DILocation(line: 49, column: 25, scope: !111)
!140 = !DILocation(line: 51, column: 9, scope: !92)
!141 = !DILocation(line: 42, column: 30, scope: !86)
!142 = !DILocation(line: 42, column: 9, scope: !86)
!143 = distinct !{!143, !89, !144}
!144 = !DILocation(line: 51, column: 9, scope: !83)
!145 = !DILocation(line: 52, column: 5, scope: !74)
!146 = !DILocation(line: 40, column: 26, scope: !69)
!147 = !DILocation(line: 40, column: 5, scope: !69)
!148 = distinct !{!148, !72, !149}
!149 = !DILocation(line: 52, column: 5, scope: !66)
!150 = !DILocation(line: 53, column: 16, scope: !22)
!151 = !DILocation(line: 53, column: 9, scope: !22)
!152 = !DILocation(line: 53, column: 7, scope: !22)
!153 = !DILocation(line: 54, column: 14, scope: !154)
!154 = distinct !DILexicalBlock(scope: !22, file: !3, line: 54, column: 5)
!155 = !DILocation(line: 54, column: 12, scope: !154)
!156 = !DILocation(line: 54, column: 21, scope: !154)
!157 = !DILocation(line: 54, column: 19, scope: !154)
!158 = !DILocation(line: 54, column: 10, scope: !154)
!159 = !DILocation(line: 54, column: 24, scope: !160)
!160 = distinct !DILexicalBlock(scope: !154, file: !3, line: 54, column: 5)
!161 = !DILocation(line: 54, column: 26, scope: !160)
!162 = !DILocation(line: 54, column: 5, scope: !154)
!163 = !DILocation(line: 55, column: 13, scope: !164)
!164 = distinct !DILexicalBlock(scope: !165, file: !3, line: 55, column: 13)
!165 = distinct !DILexicalBlock(scope: !160, file: !3, line: 54, column: 36)
!166 = !DILocation(line: 55, column: 15, scope: !164)
!167 = !DILocation(line: 55, column: 18, scope: !164)
!168 = !DILocation(line: 55, column: 23, scope: !164)
!169 = !DILocation(line: 55, column: 25, scope: !164)
!170 = !DILocation(line: 55, column: 27, scope: !164)
!171 = !DILocation(line: 55, column: 32, scope: !164)
!172 = !DILocation(line: 55, column: 21, scope: !164)
!173 = !DILocation(line: 55, column: 13, scope: !165)
!174 = !DILocation(line: 56, column: 13, scope: !175)
!175 = distinct !DILexicalBlock(scope: !164, file: !3, line: 55, column: 36)
!176 = !DILocation(line: 56, column: 15, scope: !175)
!177 = !DILocation(line: 56, column: 17, scope: !175)
!178 = !DILocation(line: 56, column: 22, scope: !175)
!179 = !DILocation(line: 57, column: 18, scope: !175)
!180 = !DILocation(line: 57, column: 24, scope: !175)
!181 = !DILocation(line: 57, column: 26, scope: !175)
!182 = !DILocation(line: 57, column: 31, scope: !175)
!183 = !DILocation(line: 57, column: 15, scope: !175)
!184 = !DILocation(line: 58, column: 9, scope: !175)
!185 = !DILocation(line: 59, column: 5, scope: !165)
!186 = !DILocation(line: 54, column: 32, scope: !160)
!187 = !DILocation(line: 54, column: 5, scope: !160)
!188 = distinct !{!188, !162, !189}
!189 = !DILocation(line: 59, column: 5, scope: !154)
!190 = !DILocation(line: 60, column: 10, scope: !22)
!191 = !DILocation(line: 60, column: 5, scope: !22)
!192 = !DILocation(line: 61, column: 10, scope: !22)
!193 = !DILocation(line: 61, column: 5, scope: !22)
!194 = !DILocation(line: 62, column: 12, scope: !22)
!195 = !DILocation(line: 62, column: 5, scope: !22)
!196 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 65, type: !197, scopeLine: 65, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!197 = !DISubroutineType(types: !198)
!198 = !{!14}
!199 = !DILocalVariable(name: "i", scope: !196, file: !3, line: 66, type: !14)
!200 = !DILocation(line: 66, column: 9, scope: !196)
!201 = !DILocalVariable(name: "n", scope: !196, file: !3, line: 66, type: !14)
!202 = !DILocation(line: 66, column: 12, scope: !196)
!203 = !DILocalVariable(name: "tw", scope: !196, file: !3, line: 66, type: !14)
!204 = !DILocation(line: 66, column: 15, scope: !196)
!205 = !DILocalVariable(name: "tv", scope: !196, file: !3, line: 66, type: !14)
!206 = !DILocation(line: 66, column: 23, scope: !196)
!207 = !DILocalVariable(name: "s", scope: !196, file: !3, line: 66, type: !25)
!208 = !DILocation(line: 66, column: 32, scope: !196)
!209 = !DILocation(line: 67, column: 7, scope: !196)
!210 = !DILocation(line: 68, column: 25, scope: !196)
!211 = !DILocation(line: 68, column: 9, scope: !196)
!212 = !DILocation(line: 68, column: 7, scope: !196)
!213 = !DILocation(line: 69, column: 12, scope: !214)
!214 = distinct !DILexicalBlock(scope: !196, file: !3, line: 69, column: 5)
!215 = !DILocation(line: 69, column: 10, scope: !214)
!216 = !DILocation(line: 69, column: 17, scope: !217)
!217 = distinct !DILexicalBlock(scope: !214, file: !3, line: 69, column: 5)
!218 = !DILocation(line: 69, column: 21, scope: !217)
!219 = !DILocation(line: 69, column: 19, scope: !217)
!220 = !DILocation(line: 69, column: 5, scope: !214)
!221 = !DILocation(line: 70, column: 13, scope: !222)
!222 = distinct !DILexicalBlock(scope: !223, file: !3, line: 70, column: 13)
!223 = distinct !DILexicalBlock(scope: !217, file: !3, line: 69, column: 29)
!224 = !DILocation(line: 70, column: 15, scope: !222)
!225 = !DILocation(line: 70, column: 13, scope: !223)
!226 = !DILocation(line: 71, column: 45, scope: !227)
!227 = distinct !DILexicalBlock(scope: !222, file: !3, line: 70, column: 19)
!228 = !DILocation(line: 71, column: 39, scope: !227)
!229 = !DILocation(line: 71, column: 48, scope: !227)
!230 = !DILocation(line: 71, column: 60, scope: !227)
!231 = !DILocation(line: 71, column: 54, scope: !227)
!232 = !DILocation(line: 71, column: 63, scope: !227)
!233 = !DILocation(line: 71, column: 77, scope: !227)
!234 = !DILocation(line: 71, column: 71, scope: !227)
!235 = !DILocation(line: 71, column: 80, scope: !227)
!236 = !DILocation(line: 71, column: 13, scope: !227)
!237 = !DILocation(line: 72, column: 25, scope: !227)
!238 = !DILocation(line: 72, column: 19, scope: !227)
!239 = !DILocation(line: 72, column: 28, scope: !227)
!240 = !DILocation(line: 72, column: 16, scope: !227)
!241 = !DILocation(line: 73, column: 25, scope: !227)
!242 = !DILocation(line: 73, column: 19, scope: !227)
!243 = !DILocation(line: 73, column: 28, scope: !227)
!244 = !DILocation(line: 73, column: 16, scope: !227)
!245 = !DILocation(line: 74, column: 9, scope: !227)
!246 = !DILocation(line: 75, column: 5, scope: !223)
!247 = !DILocation(line: 69, column: 25, scope: !217)
!248 = !DILocation(line: 69, column: 5, scope: !217)
!249 = distinct !{!249, !220, !250}
!250 = !DILocation(line: 75, column: 5, scope: !214)
!251 = !DILocation(line: 76, column: 42, scope: !196)
!252 = !DILocation(line: 76, column: 46, scope: !196)
!253 = !DILocation(line: 76, column: 5, scope: !196)
!254 = !DILocation(line: 77, column: 5, scope: !196)
