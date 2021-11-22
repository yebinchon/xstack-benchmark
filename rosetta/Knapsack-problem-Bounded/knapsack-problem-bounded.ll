; ModuleID = 'knapsack-problem-bounded.c'
source_filename = "knapsack-problem-bounded.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.item_t = type { i8*, i32, i32, i32 }

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
@items = dso_local global [22 x %struct.item_t] [%struct.item_t { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 9, i32 150, i32 1 }, %struct.item_t { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 13, i32 35, i32 1 }, %struct.item_t { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i32 153, i32 200, i32 2 }, %struct.item_t { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i32 50, i32 60, i32 2 }, %struct.item_t { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), i32 15, i32 60, i32 2 }, %struct.item_t { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i32 68, i32 45, i32 3 }, %struct.item_t { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i32 27, i32 60, i32 3 }, %struct.item_t { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0), i32 39, i32 40, i32 3 }, %struct.item_t { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0), i32 23, i32 30, i32 1 }, %struct.item_t { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), i32 52, i32 10, i32 3 }, %struct.item_t { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i32 0, i32 0), i32 11, i32 70, i32 1 }, %struct.item_t { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i32 0, i32 0), i32 32, i32 30, i32 1 }, %struct.item_t { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.12, i32 0, i32 0), i32 24, i32 15, i32 2 }, %struct.item_t { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.13, i32 0, i32 0), i32 48, i32 10, i32 2 }, %struct.item_t { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.14, i32 0, i32 0), i32 73, i32 40, i32 1 }, %struct.item_t { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.15, i32 0, i32 0), i32 42, i32 70, i32 1 }, %struct.item_t { i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.16, i32 0, i32 0), i32 43, i32 75, i32 1 }, %struct.item_t { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.17, i32 0, i32 0), i32 22, i32 80, i32 1 }, %struct.item_t { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.18, i32 0, i32 0), i32 7, i32 20, i32 1 }, %struct.item_t { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.19, i32 0, i32 0), i32 18, i32 12, i32 2 }, %struct.item_t { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.20, i32 0, i32 0), i32 4, i32 50, i32 1 }, %struct.item_t { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i32 0, i32 0), i32 30, i32 10, i32 2 }], align 16, !dbg !0
@n = dso_local global i32 22, align 4, !dbg !6
@.str.22 = private unnamed_addr constant [19 x i8] c"%-22s %5d %5d %5d\0A\00", align 1
@.str.23 = private unnamed_addr constant [22 x i8] c"count, weight, value:\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @knapsack(i32 %w) #0 !dbg !25 {
entry:
  %w.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %v = alloca i32, align 4
  %mm = alloca i32*, align 8
  %m = alloca i32**, align 8
  %s = alloca i32*, align 8
  %v77 = alloca i32, align 4
  store i32 %w, i32* %w.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %w.addr, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i32* %j, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32* %k, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i32* %v, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32** %mm, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i32*** %m, metadata !41, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32** %s, metadata !44, metadata !DIExpression()), !dbg !45
  %0 = load i32, i32* @n, align 4, !dbg !46
  %add = add nsw i32 %0, 1, !dbg !47
  %1 = load i32, i32* %w.addr, align 4, !dbg !48
  %add1 = add nsw i32 %1, 1, !dbg !49
  %mul = mul nsw i32 %add, %add1, !dbg !50
  %conv = sext i32 %mul to i64, !dbg !51
  %call = call noalias i8* @calloc(i64 %conv, i64 4) #4, !dbg !52
  %2 = bitcast i8* %call to i32*, !dbg !52
  store i32* %2, i32** %mm, align 8, !dbg !53
  %3 = load i32, i32* @n, align 4, !dbg !54
  %add2 = add nsw i32 %3, 1, !dbg !55
  %conv3 = sext i32 %add2 to i64, !dbg !56
  %mul4 = mul i64 %conv3, 8, !dbg !57
  %call5 = call noalias i8* @malloc(i64 %mul4) #4, !dbg !58
  %4 = bitcast i8* %call5 to i32**, !dbg !58
  store i32** %4, i32*** %m, align 8, !dbg !59
  %5 = load i32*, i32** %mm, align 8, !dbg !60
  %6 = load i32**, i32*** %m, align 8, !dbg !61
  %arrayidx = getelementptr inbounds i32*, i32** %6, i64 0, !dbg !61
  store i32* %5, i32** %arrayidx, align 8, !dbg !62
  store i32 1, i32* %i, align 4, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc68, %entry
  %7 = load i32, i32* %i, align 4, !dbg !66
  %8 = load i32, i32* @n, align 4, !dbg !68
  %cmp = icmp sle i32 %7, %8, !dbg !69
  br i1 %cmp, label %for.body, label %for.end70, !dbg !70

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %mm, align 8, !dbg !71
  %10 = load i32, i32* %i, align 4, !dbg !73
  %11 = load i32, i32* %w.addr, align 4, !dbg !74
  %add7 = add nsw i32 %11, 1, !dbg !75
  %mul8 = mul nsw i32 %10, %add7, !dbg !76
  %idxprom = sext i32 %mul8 to i64, !dbg !71
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom, !dbg !71
  %12 = load i32**, i32*** %m, align 8, !dbg !77
  %13 = load i32, i32* %i, align 4, !dbg !78
  %idxprom10 = sext i32 %13 to i64, !dbg !77
  %arrayidx11 = getelementptr inbounds i32*, i32** %12, i64 %idxprom10, !dbg !77
  store i32* %arrayidx9, i32** %arrayidx11, align 8, !dbg !79
  store i32 0, i32* %j, align 4, !dbg !80
  br label %for.cond12, !dbg !82

for.cond12:                                       ; preds = %for.inc65, %for.body
  %14 = load i32, i32* %j, align 4, !dbg !83
  %15 = load i32, i32* %w.addr, align 4, !dbg !85
  %cmp13 = icmp sle i32 %14, %15, !dbg !86
  br i1 %cmp13, label %for.body15, label %for.end67, !dbg !87

for.body15:                                       ; preds = %for.cond12
  %16 = load i32**, i32*** %m, align 8, !dbg !88
  %17 = load i32, i32* %i, align 4, !dbg !90
  %sub = sub nsw i32 %17, 1, !dbg !91
  %idxprom16 = sext i32 %sub to i64, !dbg !88
  %arrayidx17 = getelementptr inbounds i32*, i32** %16, i64 %idxprom16, !dbg !88
  %18 = load i32*, i32** %arrayidx17, align 8, !dbg !88
  %19 = load i32, i32* %j, align 4, !dbg !92
  %idxprom18 = sext i32 %19 to i64, !dbg !88
  %arrayidx19 = getelementptr inbounds i32, i32* %18, i64 %idxprom18, !dbg !88
  %20 = load i32, i32* %arrayidx19, align 4, !dbg !88
  %21 = load i32**, i32*** %m, align 8, !dbg !93
  %22 = load i32, i32* %i, align 4, !dbg !94
  %idxprom20 = sext i32 %22 to i64, !dbg !93
  %arrayidx21 = getelementptr inbounds i32*, i32** %21, i64 %idxprom20, !dbg !93
  %23 = load i32*, i32** %arrayidx21, align 8, !dbg !93
  %24 = load i32, i32* %j, align 4, !dbg !95
  %idxprom22 = sext i32 %24 to i64, !dbg !93
  %arrayidx23 = getelementptr inbounds i32, i32* %23, i64 %idxprom22, !dbg !93
  store i32 %20, i32* %arrayidx23, align 4, !dbg !96
  store i32 1, i32* %k, align 4, !dbg !97
  br label %for.cond24, !dbg !99

for.cond24:                                       ; preds = %for.inc, %for.body15
  %25 = load i32, i32* %k, align 4, !dbg !100
  %26 = load i32, i32* %i, align 4, !dbg !102
  %sub25 = sub nsw i32 %26, 1, !dbg !103
  %idxprom26 = sext i32 %sub25 to i64, !dbg !104
  %arrayidx27 = getelementptr inbounds [22 x %struct.item_t], [22 x %struct.item_t]* @items, i64 0, i64 %idxprom26, !dbg !104
  %count = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx27, i32 0, i32 3, !dbg !105
  %27 = load i32, i32* %count, align 8, !dbg !105
  %cmp28 = icmp sle i32 %25, %27, !dbg !106
  br i1 %cmp28, label %for.body30, label %for.end, !dbg !107

for.body30:                                       ; preds = %for.cond24
  %28 = load i32, i32* %k, align 4, !dbg !108
  %29 = load i32, i32* %i, align 4, !dbg !111
  %sub31 = sub nsw i32 %29, 1, !dbg !112
  %idxprom32 = sext i32 %sub31 to i64, !dbg !113
  %arrayidx33 = getelementptr inbounds [22 x %struct.item_t], [22 x %struct.item_t]* @items, i64 0, i64 %idxprom32, !dbg !113
  %weight = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx33, i32 0, i32 1, !dbg !114
  %30 = load i32, i32* %weight, align 8, !dbg !114
  %mul34 = mul nsw i32 %28, %30, !dbg !115
  %31 = load i32, i32* %j, align 4, !dbg !116
  %cmp35 = icmp sgt i32 %mul34, %31, !dbg !117
  br i1 %cmp35, label %if.then, label %if.end, !dbg !118, !cf.info !119

if.then:                                          ; preds = %for.body30
  br label %for.end, !dbg !120

if.end:                                           ; preds = %for.body30
  %32 = load i32**, i32*** %m, align 8, !dbg !122
  %33 = load i32, i32* %i, align 4, !dbg !123
  %sub37 = sub nsw i32 %33, 1, !dbg !124
  %idxprom38 = sext i32 %sub37 to i64, !dbg !122
  %arrayidx39 = getelementptr inbounds i32*, i32** %32, i64 %idxprom38, !dbg !122
  %34 = load i32*, i32** %arrayidx39, align 8, !dbg !122
  %35 = load i32, i32* %j, align 4, !dbg !125
  %36 = load i32, i32* %k, align 4, !dbg !126
  %37 = load i32, i32* %i, align 4, !dbg !127
  %sub40 = sub nsw i32 %37, 1, !dbg !128
  %idxprom41 = sext i32 %sub40 to i64, !dbg !129
  %arrayidx42 = getelementptr inbounds [22 x %struct.item_t], [22 x %struct.item_t]* @items, i64 0, i64 %idxprom41, !dbg !129
  %weight43 = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx42, i32 0, i32 1, !dbg !130
  %38 = load i32, i32* %weight43, align 8, !dbg !130
  %mul44 = mul nsw i32 %36, %38, !dbg !131
  %sub45 = sub nsw i32 %35, %mul44, !dbg !132
  %idxprom46 = sext i32 %sub45 to i64, !dbg !122
  %arrayidx47 = getelementptr inbounds i32, i32* %34, i64 %idxprom46, !dbg !122
  %39 = load i32, i32* %arrayidx47, align 4, !dbg !122
  %40 = load i32, i32* %k, align 4, !dbg !133
  %41 = load i32, i32* %i, align 4, !dbg !134
  %sub48 = sub nsw i32 %41, 1, !dbg !135
  %idxprom49 = sext i32 %sub48 to i64, !dbg !136
  %arrayidx50 = getelementptr inbounds [22 x %struct.item_t], [22 x %struct.item_t]* @items, i64 0, i64 %idxprom49, !dbg !136
  %value = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx50, i32 0, i32 2, !dbg !137
  %42 = load i32, i32* %value, align 4, !dbg !137
  %mul51 = mul nsw i32 %40, %42, !dbg !138
  %add52 = add nsw i32 %39, %mul51, !dbg !139
  store i32 %add52, i32* %v, align 4, !dbg !140
  %43 = load i32, i32* %v, align 4, !dbg !141
  %44 = load i32**, i32*** %m, align 8, !dbg !143
  %45 = load i32, i32* %i, align 4, !dbg !144
  %idxprom53 = sext i32 %45 to i64, !dbg !143
  %arrayidx54 = getelementptr inbounds i32*, i32** %44, i64 %idxprom53, !dbg !143
  %46 = load i32*, i32** %arrayidx54, align 8, !dbg !143
  %47 = load i32, i32* %j, align 4, !dbg !145
  %idxprom55 = sext i32 %47 to i64, !dbg !143
  %arrayidx56 = getelementptr inbounds i32, i32* %46, i64 %idxprom55, !dbg !143
  %48 = load i32, i32* %arrayidx56, align 4, !dbg !143
  %cmp57 = icmp sgt i32 %43, %48, !dbg !146
  br i1 %cmp57, label %if.then59, label %if.end64, !dbg !147, !cf.info !119

if.then59:                                        ; preds = %if.end
  %49 = load i32, i32* %v, align 4, !dbg !148
  %50 = load i32**, i32*** %m, align 8, !dbg !150
  %51 = load i32, i32* %i, align 4, !dbg !151
  %idxprom60 = sext i32 %51 to i64, !dbg !150
  %arrayidx61 = getelementptr inbounds i32*, i32** %50, i64 %idxprom60, !dbg !150
  %52 = load i32*, i32** %arrayidx61, align 8, !dbg !150
  %53 = load i32, i32* %j, align 4, !dbg !152
  %idxprom62 = sext i32 %53 to i64, !dbg !150
  %arrayidx63 = getelementptr inbounds i32, i32* %52, i64 %idxprom62, !dbg !150
  store i32 %49, i32* %arrayidx63, align 4, !dbg !153
  br label %if.end64, !dbg !154

if.end64:                                         ; preds = %if.then59, %if.end
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %if.end64
  %54 = load i32, i32* %k, align 4, !dbg !156
  %inc = add nsw i32 %54, 1, !dbg !156
  store i32 %inc, i32* %k, align 4, !dbg !156
  br label %for.cond24, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %if.then, %for.cond24
  br label %for.inc65, !dbg !160

for.inc65:                                        ; preds = %for.end
  %55 = load i32, i32* %j, align 4, !dbg !161
  %inc66 = add nsw i32 %55, 1, !dbg !161
  store i32 %inc66, i32* %j, align 4, !dbg !161
  br label %for.cond12, !dbg !162, !llvm.loop !163

for.end67:                                        ; preds = %for.cond12
  br label %for.inc68, !dbg !165

for.inc68:                                        ; preds = %for.end67
  %56 = load i32, i32* %i, align 4, !dbg !166
  %inc69 = add nsw i32 %56, 1, !dbg !166
  store i32 %inc69, i32* %i, align 4, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end70:                                        ; preds = %for.cond
  %57 = load i32, i32* @n, align 4, !dbg !170
  %conv71 = sext i32 %57 to i64, !dbg !170
  %call72 = call noalias i8* @calloc(i64 %conv71, i64 4) #4, !dbg !171
  %58 = bitcast i8* %call72 to i32*, !dbg !171
  store i32* %58, i32** %s, align 8, !dbg !172
  %59 = load i32, i32* @n, align 4, !dbg !173
  store i32 %59, i32* %i, align 4, !dbg !175
  %60 = load i32, i32* %w.addr, align 4, !dbg !176
  store i32 %60, i32* %j, align 4, !dbg !177
  br label %for.cond73, !dbg !178

for.cond73:                                       ; preds = %for.inc109, %for.end70
  %61 = load i32, i32* %i, align 4, !dbg !179
  %cmp74 = icmp sgt i32 %61, 0, !dbg !181
  br i1 %cmp74, label %for.body76, label %for.end110, !dbg !182

for.body76:                                       ; preds = %for.cond73
  call void @llvm.dbg.declare(metadata i32* %v77, metadata !183, metadata !DIExpression()), !dbg !185
  %62 = load i32**, i32*** %m, align 8, !dbg !186
  %63 = load i32, i32* %i, align 4, !dbg !187
  %idxprom78 = sext i32 %63 to i64, !dbg !186
  %arrayidx79 = getelementptr inbounds i32*, i32** %62, i64 %idxprom78, !dbg !186
  %64 = load i32*, i32** %arrayidx79, align 8, !dbg !186
  %65 = load i32, i32* %j, align 4, !dbg !188
  %idxprom80 = sext i32 %65 to i64, !dbg !186
  %arrayidx81 = getelementptr inbounds i32, i32* %64, i64 %idxprom80, !dbg !186
  %66 = load i32, i32* %arrayidx81, align 4, !dbg !186
  store i32 %66, i32* %v77, align 4, !dbg !185
  store i32 0, i32* %k, align 4, !dbg !189
  br label %for.cond82, !dbg !191

for.cond82:                                       ; preds = %for.inc106, %for.body76
  %67 = load i32, i32* %v77, align 4, !dbg !192
  %68 = load i32**, i32*** %m, align 8, !dbg !194
  %69 = load i32, i32* %i, align 4, !dbg !195
  %sub83 = sub nsw i32 %69, 1, !dbg !196
  %idxprom84 = sext i32 %sub83 to i64, !dbg !194
  %arrayidx85 = getelementptr inbounds i32*, i32** %68, i64 %idxprom84, !dbg !194
  %70 = load i32*, i32** %arrayidx85, align 8, !dbg !194
  %71 = load i32, i32* %j, align 4, !dbg !197
  %idxprom86 = sext i32 %71 to i64, !dbg !194
  %arrayidx87 = getelementptr inbounds i32, i32* %70, i64 %idxprom86, !dbg !194
  %72 = load i32, i32* %arrayidx87, align 4, !dbg !194
  %73 = load i32, i32* %k, align 4, !dbg !198
  %74 = load i32, i32* %i, align 4, !dbg !199
  %sub88 = sub nsw i32 %74, 1, !dbg !200
  %idxprom89 = sext i32 %sub88 to i64, !dbg !201
  %arrayidx90 = getelementptr inbounds [22 x %struct.item_t], [22 x %struct.item_t]* @items, i64 0, i64 %idxprom89, !dbg !201
  %value91 = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx90, i32 0, i32 2, !dbg !202
  %75 = load i32, i32* %value91, align 4, !dbg !202
  %mul92 = mul nsw i32 %73, %75, !dbg !203
  %add93 = add nsw i32 %72, %mul92, !dbg !204
  %cmp94 = icmp ne i32 %67, %add93, !dbg !205
  br i1 %cmp94, label %for.body96, label %for.end108, !dbg !206

for.body96:                                       ; preds = %for.cond82
  %76 = load i32*, i32** %s, align 8, !dbg !207
  %77 = load i32, i32* %i, align 4, !dbg !209
  %sub97 = sub nsw i32 %77, 1, !dbg !210
  %idxprom98 = sext i32 %sub97 to i64, !dbg !207
  %arrayidx99 = getelementptr inbounds i32, i32* %76, i64 %idxprom98, !dbg !207
  %78 = load i32, i32* %arrayidx99, align 4, !dbg !211
  %inc100 = add nsw i32 %78, 1, !dbg !211
  store i32 %inc100, i32* %arrayidx99, align 4, !dbg !211
  %79 = load i32, i32* %i, align 4, !dbg !212
  %sub101 = sub nsw i32 %79, 1, !dbg !213
  %idxprom102 = sext i32 %sub101 to i64, !dbg !214
  %arrayidx103 = getelementptr inbounds [22 x %struct.item_t], [22 x %struct.item_t]* @items, i64 0, i64 %idxprom102, !dbg !214
  %weight104 = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx103, i32 0, i32 1, !dbg !215
  %80 = load i32, i32* %weight104, align 8, !dbg !215
  %81 = load i32, i32* %j, align 4, !dbg !216
  %sub105 = sub nsw i32 %81, %80, !dbg !216
  store i32 %sub105, i32* %j, align 4, !dbg !216
  br label %for.inc106, !dbg !217

for.inc106:                                       ; preds = %for.body96
  %82 = load i32, i32* %k, align 4, !dbg !218
  %inc107 = add nsw i32 %82, 1, !dbg !218
  store i32 %inc107, i32* %k, align 4, !dbg !218
  br label %for.cond82, !dbg !219, !llvm.loop !220

for.end108:                                       ; preds = %for.cond82
  br label %for.inc109, !dbg !222

for.inc109:                                       ; preds = %for.end108
  %83 = load i32, i32* %i, align 4, !dbg !223
  %dec = add nsw i32 %83, -1, !dbg !223
  store i32 %dec, i32* %i, align 4, !dbg !223
  br label %for.cond73, !dbg !224, !llvm.loop !225

for.end110:                                       ; preds = %for.cond73
  %84 = load i32*, i32** %mm, align 8, !dbg !227
  %85 = bitcast i32* %84 to i8*, !dbg !227
  call void @free(i8* %85) #4, !dbg !228
  %86 = load i32**, i32*** %m, align 8, !dbg !229
  %87 = bitcast i32** %86 to i8*, !dbg !229
  call void @free(i8* %87) #4, !dbg !230
  %88 = load i32*, i32** %s, align 8, !dbg !231
  ret i32* %88, !dbg !232
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
define dso_local i32 @main() #0 !dbg !233 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %tc = alloca i32, align 4
  %tw = alloca i32, align 4
  %tv = alloca i32, align 4
  %s = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !236, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.declare(metadata i32* %tc, metadata !238, metadata !DIExpression()), !dbg !239
  store i32 0, i32* %tc, align 4, !dbg !239
  call void @llvm.dbg.declare(metadata i32* %tw, metadata !240, metadata !DIExpression()), !dbg !241
  store i32 0, i32* %tw, align 4, !dbg !241
  call void @llvm.dbg.declare(metadata i32* %tv, metadata !242, metadata !DIExpression()), !dbg !243
  store i32 0, i32* %tv, align 4, !dbg !243
  call void @llvm.dbg.declare(metadata i32** %s, metadata !244, metadata !DIExpression()), !dbg !245
  %call = call i32* @knapsack(i32 400), !dbg !246
  store i32* %call, i32** %s, align 8, !dbg !247
  store i32 0, i32* %i, align 4, !dbg !248
  br label %for.cond, !dbg !250

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !251
  %1 = load i32, i32* @n, align 4, !dbg !253
  %cmp = icmp slt i32 %0, %1, !dbg !254
  br i1 %cmp, label %for.body, label %for.end, !dbg !255

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %s, align 8, !dbg !256
  %3 = load i32, i32* %i, align 4, !dbg !259
  %idxprom = sext i32 %3 to i64, !dbg !256
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom, !dbg !256
  %4 = load i32, i32* %arrayidx, align 4, !dbg !256
  %tobool = icmp ne i32 %4, 0, !dbg !256
  br i1 %tobool, label %if.then, label %if.end, !dbg !260, !cf.info !119

if.then:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !261
  %idxprom1 = sext i32 %5 to i64, !dbg !263
  %arrayidx2 = getelementptr inbounds [22 x %struct.item_t], [22 x %struct.item_t]* @items, i64 0, i64 %idxprom1, !dbg !263
  %name = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx2, i32 0, i32 0, !dbg !264
  %6 = load i8*, i8** %name, align 8, !dbg !264
  %7 = load i32*, i32** %s, align 8, !dbg !265
  %8 = load i32, i32* %i, align 4, !dbg !266
  %idxprom3 = sext i32 %8 to i64, !dbg !265
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %idxprom3, !dbg !265
  %9 = load i32, i32* %arrayidx4, align 4, !dbg !265
  %10 = load i32*, i32** %s, align 8, !dbg !267
  %11 = load i32, i32* %i, align 4, !dbg !268
  %idxprom5 = sext i32 %11 to i64, !dbg !267
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 %idxprom5, !dbg !267
  %12 = load i32, i32* %arrayidx6, align 4, !dbg !267
  %13 = load i32, i32* %i, align 4, !dbg !269
  %idxprom7 = sext i32 %13 to i64, !dbg !270
  %arrayidx8 = getelementptr inbounds [22 x %struct.item_t], [22 x %struct.item_t]* @items, i64 0, i64 %idxprom7, !dbg !270
  %weight = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx8, i32 0, i32 1, !dbg !271
  %14 = load i32, i32* %weight, align 8, !dbg !271
  %mul = mul nsw i32 %12, %14, !dbg !272
  %15 = load i32*, i32** %s, align 8, !dbg !273
  %16 = load i32, i32* %i, align 4, !dbg !274
  %idxprom9 = sext i32 %16 to i64, !dbg !273
  %arrayidx10 = getelementptr inbounds i32, i32* %15, i64 %idxprom9, !dbg !273
  %17 = load i32, i32* %arrayidx10, align 4, !dbg !273
  %18 = load i32, i32* %i, align 4, !dbg !275
  %idxprom11 = sext i32 %18 to i64, !dbg !276
  %arrayidx12 = getelementptr inbounds [22 x %struct.item_t], [22 x %struct.item_t]* @items, i64 0, i64 %idxprom11, !dbg !276
  %value = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx12, i32 0, i32 2, !dbg !277
  %19 = load i32, i32* %value, align 4, !dbg !277
  %mul13 = mul nsw i32 %17, %19, !dbg !278
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.22, i64 0, i64 0), i8* %6, i32 %9, i32 %mul, i32 %mul13), !dbg !279
  %20 = load i32*, i32** %s, align 8, !dbg !280
  %21 = load i32, i32* %i, align 4, !dbg !281
  %idxprom15 = sext i32 %21 to i64, !dbg !280
  %arrayidx16 = getelementptr inbounds i32, i32* %20, i64 %idxprom15, !dbg !280
  %22 = load i32, i32* %arrayidx16, align 4, !dbg !280
  %23 = load i32, i32* %tc, align 4, !dbg !282
  %add = add nsw i32 %23, %22, !dbg !282
  store i32 %add, i32* %tc, align 4, !dbg !282
  %24 = load i32*, i32** %s, align 8, !dbg !283
  %25 = load i32, i32* %i, align 4, !dbg !284
  %idxprom17 = sext i32 %25 to i64, !dbg !283
  %arrayidx18 = getelementptr inbounds i32, i32* %24, i64 %idxprom17, !dbg !283
  %26 = load i32, i32* %arrayidx18, align 4, !dbg !283
  %27 = load i32, i32* %i, align 4, !dbg !285
  %idxprom19 = sext i32 %27 to i64, !dbg !286
  %arrayidx20 = getelementptr inbounds [22 x %struct.item_t], [22 x %struct.item_t]* @items, i64 0, i64 %idxprom19, !dbg !286
  %weight21 = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx20, i32 0, i32 1, !dbg !287
  %28 = load i32, i32* %weight21, align 8, !dbg !287
  %mul22 = mul nsw i32 %26, %28, !dbg !288
  %29 = load i32, i32* %tw, align 4, !dbg !289
  %add23 = add nsw i32 %29, %mul22, !dbg !289
  store i32 %add23, i32* %tw, align 4, !dbg !289
  %30 = load i32*, i32** %s, align 8, !dbg !290
  %31 = load i32, i32* %i, align 4, !dbg !291
  %idxprom24 = sext i32 %31 to i64, !dbg !290
  %arrayidx25 = getelementptr inbounds i32, i32* %30, i64 %idxprom24, !dbg !290
  %32 = load i32, i32* %arrayidx25, align 4, !dbg !290
  %33 = load i32, i32* %i, align 4, !dbg !292
  %idxprom26 = sext i32 %33 to i64, !dbg !293
  %arrayidx27 = getelementptr inbounds [22 x %struct.item_t], [22 x %struct.item_t]* @items, i64 0, i64 %idxprom26, !dbg !293
  %value28 = getelementptr inbounds %struct.item_t, %struct.item_t* %arrayidx27, i32 0, i32 2, !dbg !294
  %34 = load i32, i32* %value28, align 4, !dbg !294
  %mul29 = mul nsw i32 %32, %34, !dbg !295
  %35 = load i32, i32* %tv, align 4, !dbg !296
  %add30 = add nsw i32 %35, %mul29, !dbg !296
  store i32 %add30, i32* %tv, align 4, !dbg !296
  br label %if.end, !dbg !297

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !298

for.inc:                                          ; preds = %if.end
  %36 = load i32, i32* %i, align 4, !dbg !299
  %inc = add nsw i32 %36, 1, !dbg !299
  store i32 %inc, i32* %i, align 4, !dbg !299
  br label %for.cond, !dbg !300, !llvm.loop !301

for.end:                                          ; preds = %for.cond
  %37 = load i32, i32* %tc, align 4, !dbg !303
  %38 = load i32, i32* %tw, align 4, !dbg !304
  %39 = load i32, i32* %tv, align 4, !dbg !305
  %call31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.22, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.23, i64 0, i64 0), i32 %37, i32 %38, i32 %39), !dbg !306
  ret i32 0, !dbg !307
}

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "items", scope: !2, file: !3, line: 11, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "knapsack-problem-bounded.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Knapsack-problem-Bounded")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "n", scope: !2, file: !3, line: 36, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 4224, elements: !19)
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "item_t", file: !3, line: 9, baseType: !11)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 4, size: 192, elements: !12)
!12 = !{!13, !16, !17, !18}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !11, file: !3, line: 5, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "weight", scope: !11, file: !3, line: 6, baseType: !8, size: 32, offset: 64)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !11, file: !3, line: 7, baseType: !8, size: 32, offset: 96)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !11, file: !3, line: 8, baseType: !8, size: 32, offset: 128)
!19 = !{!20}
!20 = !DISubrange(count: 22)
!21 = !{i32 7, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{i32 1, !"wchar_size", i32 4}
!24 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!25 = distinct !DISubprogram(name: "knapsack", scope: !3, file: !3, line: 38, type: !26, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!26 = !DISubroutineType(types: !27)
!27 = !{!28, !8}
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!29 = !DILocalVariable(name: "w", arg: 1, scope: !25, file: !3, line: 38, type: !8)
!30 = !DILocation(line: 38, column: 20, scope: !25)
!31 = !DILocalVariable(name: "i", scope: !25, file: !3, line: 39, type: !8)
!32 = !DILocation(line: 39, column: 9, scope: !25)
!33 = !DILocalVariable(name: "j", scope: !25, file: !3, line: 39, type: !8)
!34 = !DILocation(line: 39, column: 12, scope: !25)
!35 = !DILocalVariable(name: "k", scope: !25, file: !3, line: 39, type: !8)
!36 = !DILocation(line: 39, column: 15, scope: !25)
!37 = !DILocalVariable(name: "v", scope: !25, file: !3, line: 39, type: !8)
!38 = !DILocation(line: 39, column: 18, scope: !25)
!39 = !DILocalVariable(name: "mm", scope: !25, file: !3, line: 39, type: !28)
!40 = !DILocation(line: 39, column: 22, scope: !25)
!41 = !DILocalVariable(name: "m", scope: !25, file: !3, line: 39, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!43 = !DILocation(line: 39, column: 28, scope: !25)
!44 = !DILocalVariable(name: "s", scope: !25, file: !3, line: 39, type: !28)
!45 = !DILocation(line: 39, column: 32, scope: !25)
!46 = !DILocation(line: 40, column: 18, scope: !25)
!47 = !DILocation(line: 40, column: 20, scope: !25)
!48 = !DILocation(line: 40, column: 28, scope: !25)
!49 = !DILocation(line: 40, column: 30, scope: !25)
!50 = !DILocation(line: 40, column: 25, scope: !25)
!51 = !DILocation(line: 40, column: 17, scope: !25)
!52 = !DILocation(line: 40, column: 10, scope: !25)
!53 = !DILocation(line: 40, column: 8, scope: !25)
!54 = !DILocation(line: 41, column: 17, scope: !25)
!55 = !DILocation(line: 41, column: 19, scope: !25)
!56 = !DILocation(line: 41, column: 16, scope: !25)
!57 = !DILocation(line: 41, column: 24, scope: !25)
!58 = !DILocation(line: 41, column: 9, scope: !25)
!59 = !DILocation(line: 41, column: 7, scope: !25)
!60 = !DILocation(line: 42, column: 12, scope: !25)
!61 = !DILocation(line: 42, column: 5, scope: !25)
!62 = !DILocation(line: 42, column: 10, scope: !25)
!63 = !DILocation(line: 43, column: 12, scope: !64)
!64 = distinct !DILexicalBlock(scope: !25, file: !3, line: 43, column: 5)
!65 = !DILocation(line: 43, column: 10, scope: !64)
!66 = !DILocation(line: 43, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !3, line: 43, column: 5)
!68 = !DILocation(line: 43, column: 22, scope: !67)
!69 = !DILocation(line: 43, column: 19, scope: !67)
!70 = !DILocation(line: 43, column: 5, scope: !64)
!71 = !DILocation(line: 44, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !3, line: 43, column: 30)
!73 = !DILocation(line: 44, column: 20, scope: !72)
!74 = !DILocation(line: 44, column: 25, scope: !72)
!75 = !DILocation(line: 44, column: 27, scope: !72)
!76 = !DILocation(line: 44, column: 22, scope: !72)
!77 = !DILocation(line: 44, column: 9, scope: !72)
!78 = !DILocation(line: 44, column: 11, scope: !72)
!79 = !DILocation(line: 44, column: 14, scope: !72)
!80 = !DILocation(line: 45, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !72, file: !3, line: 45, column: 9)
!82 = !DILocation(line: 45, column: 14, scope: !81)
!83 = !DILocation(line: 45, column: 21, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !3, line: 45, column: 9)
!85 = !DILocation(line: 45, column: 26, scope: !84)
!86 = !DILocation(line: 45, column: 23, scope: !84)
!87 = !DILocation(line: 45, column: 9, scope: !81)
!88 = !DILocation(line: 46, column: 23, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !3, line: 45, column: 34)
!90 = !DILocation(line: 46, column: 25, scope: !89)
!91 = !DILocation(line: 46, column: 27, scope: !89)
!92 = !DILocation(line: 46, column: 32, scope: !89)
!93 = !DILocation(line: 46, column: 13, scope: !89)
!94 = !DILocation(line: 46, column: 15, scope: !89)
!95 = !DILocation(line: 46, column: 18, scope: !89)
!96 = !DILocation(line: 46, column: 21, scope: !89)
!97 = !DILocation(line: 47, column: 20, scope: !98)
!98 = distinct !DILexicalBlock(scope: !89, file: !3, line: 47, column: 13)
!99 = !DILocation(line: 47, column: 18, scope: !98)
!100 = !DILocation(line: 47, column: 25, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !3, line: 47, column: 13)
!102 = !DILocation(line: 47, column: 36, scope: !101)
!103 = !DILocation(line: 47, column: 38, scope: !101)
!104 = !DILocation(line: 47, column: 30, scope: !101)
!105 = !DILocation(line: 47, column: 43, scope: !101)
!106 = !DILocation(line: 47, column: 27, scope: !101)
!107 = !DILocation(line: 47, column: 13, scope: !98)
!108 = !DILocation(line: 48, column: 21, scope: !109)
!109 = distinct !DILexicalBlock(scope: !110, file: !3, line: 48, column: 21)
!110 = distinct !DILexicalBlock(scope: !101, file: !3, line: 47, column: 55)
!111 = !DILocation(line: 48, column: 31, scope: !109)
!112 = !DILocation(line: 48, column: 33, scope: !109)
!113 = !DILocation(line: 48, column: 25, scope: !109)
!114 = !DILocation(line: 48, column: 38, scope: !109)
!115 = !DILocation(line: 48, column: 23, scope: !109)
!116 = !DILocation(line: 48, column: 47, scope: !109)
!117 = !DILocation(line: 48, column: 45, scope: !109)
!118 = !DILocation(line: 48, column: 21, scope: !110)
!119 = !{!"if"}
!120 = !DILocation(line: 49, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !109, file: !3, line: 48, column: 50)
!122 = !DILocation(line: 51, column: 21, scope: !110)
!123 = !DILocation(line: 51, column: 23, scope: !110)
!124 = !DILocation(line: 51, column: 25, scope: !110)
!125 = !DILocation(line: 51, column: 30, scope: !110)
!126 = !DILocation(line: 51, column: 34, scope: !110)
!127 = !DILocation(line: 51, column: 44, scope: !110)
!128 = !DILocation(line: 51, column: 46, scope: !110)
!129 = !DILocation(line: 51, column: 38, scope: !110)
!130 = !DILocation(line: 51, column: 51, scope: !110)
!131 = !DILocation(line: 51, column: 36, scope: !110)
!132 = !DILocation(line: 51, column: 32, scope: !110)
!133 = !DILocation(line: 51, column: 61, scope: !110)
!134 = !DILocation(line: 51, column: 71, scope: !110)
!135 = !DILocation(line: 51, column: 73, scope: !110)
!136 = !DILocation(line: 51, column: 65, scope: !110)
!137 = !DILocation(line: 51, column: 78, scope: !110)
!138 = !DILocation(line: 51, column: 63, scope: !110)
!139 = !DILocation(line: 51, column: 59, scope: !110)
!140 = !DILocation(line: 51, column: 19, scope: !110)
!141 = !DILocation(line: 52, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !110, file: !3, line: 52, column: 21)
!143 = !DILocation(line: 52, column: 25, scope: !142)
!144 = !DILocation(line: 52, column: 27, scope: !142)
!145 = !DILocation(line: 52, column: 30, scope: !142)
!146 = !DILocation(line: 52, column: 23, scope: !142)
!147 = !DILocation(line: 52, column: 21, scope: !110)
!148 = !DILocation(line: 53, column: 31, scope: !149)
!149 = distinct !DILexicalBlock(scope: !142, file: !3, line: 52, column: 34)
!150 = !DILocation(line: 53, column: 21, scope: !149)
!151 = !DILocation(line: 53, column: 23, scope: !149)
!152 = !DILocation(line: 53, column: 26, scope: !149)
!153 = !DILocation(line: 53, column: 29, scope: !149)
!154 = !DILocation(line: 54, column: 17, scope: !149)
!155 = !DILocation(line: 55, column: 13, scope: !110)
!156 = !DILocation(line: 47, column: 51, scope: !101)
!157 = !DILocation(line: 47, column: 13, scope: !101)
!158 = distinct !{!158, !107, !159}
!159 = !DILocation(line: 55, column: 13, scope: !98)
!160 = !DILocation(line: 56, column: 9, scope: !89)
!161 = !DILocation(line: 45, column: 30, scope: !84)
!162 = !DILocation(line: 45, column: 9, scope: !84)
!163 = distinct !{!163, !87, !164}
!164 = !DILocation(line: 56, column: 9, scope: !81)
!165 = !DILocation(line: 57, column: 5, scope: !72)
!166 = !DILocation(line: 43, column: 26, scope: !67)
!167 = !DILocation(line: 43, column: 5, scope: !67)
!168 = distinct !{!168, !70, !169}
!169 = !DILocation(line: 57, column: 5, scope: !64)
!170 = !DILocation(line: 58, column: 16, scope: !25)
!171 = !DILocation(line: 58, column: 9, scope: !25)
!172 = !DILocation(line: 58, column: 7, scope: !25)
!173 = !DILocation(line: 59, column: 14, scope: !174)
!174 = distinct !DILexicalBlock(scope: !25, file: !3, line: 59, column: 5)
!175 = !DILocation(line: 59, column: 12, scope: !174)
!176 = !DILocation(line: 59, column: 21, scope: !174)
!177 = !DILocation(line: 59, column: 19, scope: !174)
!178 = !DILocation(line: 59, column: 10, scope: !174)
!179 = !DILocation(line: 59, column: 24, scope: !180)
!180 = distinct !DILexicalBlock(scope: !174, file: !3, line: 59, column: 5)
!181 = !DILocation(line: 59, column: 26, scope: !180)
!182 = !DILocation(line: 59, column: 5, scope: !174)
!183 = !DILocalVariable(name: "v", scope: !184, file: !3, line: 60, type: !8)
!184 = distinct !DILexicalBlock(scope: !180, file: !3, line: 59, column: 36)
!185 = !DILocation(line: 60, column: 13, scope: !184)
!186 = !DILocation(line: 60, column: 17, scope: !184)
!187 = !DILocation(line: 60, column: 19, scope: !184)
!188 = !DILocation(line: 60, column: 22, scope: !184)
!189 = !DILocation(line: 61, column: 16, scope: !190)
!190 = distinct !DILexicalBlock(scope: !184, file: !3, line: 61, column: 9)
!191 = !DILocation(line: 61, column: 14, scope: !190)
!192 = !DILocation(line: 61, column: 21, scope: !193)
!193 = distinct !DILexicalBlock(scope: !190, file: !3, line: 61, column: 9)
!194 = !DILocation(line: 61, column: 26, scope: !193)
!195 = !DILocation(line: 61, column: 28, scope: !193)
!196 = !DILocation(line: 61, column: 30, scope: !193)
!197 = !DILocation(line: 61, column: 35, scope: !193)
!198 = !DILocation(line: 61, column: 40, scope: !193)
!199 = !DILocation(line: 61, column: 50, scope: !193)
!200 = !DILocation(line: 61, column: 52, scope: !193)
!201 = !DILocation(line: 61, column: 44, scope: !193)
!202 = !DILocation(line: 61, column: 57, scope: !193)
!203 = !DILocation(line: 61, column: 42, scope: !193)
!204 = !DILocation(line: 61, column: 38, scope: !193)
!205 = !DILocation(line: 61, column: 23, scope: !193)
!206 = !DILocation(line: 61, column: 9, scope: !190)
!207 = !DILocation(line: 62, column: 13, scope: !208)
!208 = distinct !DILexicalBlock(scope: !193, file: !3, line: 61, column: 69)
!209 = !DILocation(line: 62, column: 15, scope: !208)
!210 = !DILocation(line: 62, column: 17, scope: !208)
!211 = !DILocation(line: 62, column: 21, scope: !208)
!212 = !DILocation(line: 63, column: 24, scope: !208)
!213 = !DILocation(line: 63, column: 26, scope: !208)
!214 = !DILocation(line: 63, column: 18, scope: !208)
!215 = !DILocation(line: 63, column: 31, scope: !208)
!216 = !DILocation(line: 63, column: 15, scope: !208)
!217 = !DILocation(line: 64, column: 9, scope: !208)
!218 = !DILocation(line: 61, column: 65, scope: !193)
!219 = !DILocation(line: 61, column: 9, scope: !193)
!220 = distinct !{!220, !206, !221}
!221 = !DILocation(line: 64, column: 9, scope: !190)
!222 = !DILocation(line: 65, column: 5, scope: !184)
!223 = !DILocation(line: 59, column: 32, scope: !180)
!224 = !DILocation(line: 59, column: 5, scope: !180)
!225 = distinct !{!225, !182, !226}
!226 = !DILocation(line: 65, column: 5, scope: !174)
!227 = !DILocation(line: 66, column: 10, scope: !25)
!228 = !DILocation(line: 66, column: 5, scope: !25)
!229 = !DILocation(line: 67, column: 10, scope: !25)
!230 = !DILocation(line: 67, column: 5, scope: !25)
!231 = !DILocation(line: 68, column: 12, scope: !25)
!232 = !DILocation(line: 68, column: 5, scope: !25)
!233 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 71, type: !234, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!234 = !DISubroutineType(types: !235)
!235 = !{!8}
!236 = !DILocalVariable(name: "i", scope: !233, file: !3, line: 72, type: !8)
!237 = !DILocation(line: 72, column: 9, scope: !233)
!238 = !DILocalVariable(name: "tc", scope: !233, file: !3, line: 72, type: !8)
!239 = !DILocation(line: 72, column: 12, scope: !233)
!240 = !DILocalVariable(name: "tw", scope: !233, file: !3, line: 72, type: !8)
!241 = !DILocation(line: 72, column: 20, scope: !233)
!242 = !DILocalVariable(name: "tv", scope: !233, file: !3, line: 72, type: !8)
!243 = !DILocation(line: 72, column: 28, scope: !233)
!244 = !DILocalVariable(name: "s", scope: !233, file: !3, line: 72, type: !28)
!245 = !DILocation(line: 72, column: 37, scope: !233)
!246 = !DILocation(line: 73, column: 9, scope: !233)
!247 = !DILocation(line: 73, column: 7, scope: !233)
!248 = !DILocation(line: 74, column: 12, scope: !249)
!249 = distinct !DILexicalBlock(scope: !233, file: !3, line: 74, column: 5)
!250 = !DILocation(line: 74, column: 10, scope: !249)
!251 = !DILocation(line: 74, column: 17, scope: !252)
!252 = distinct !DILexicalBlock(scope: !249, file: !3, line: 74, column: 5)
!253 = !DILocation(line: 74, column: 21, scope: !252)
!254 = !DILocation(line: 74, column: 19, scope: !252)
!255 = !DILocation(line: 74, column: 5, scope: !249)
!256 = !DILocation(line: 75, column: 13, scope: !257)
!257 = distinct !DILexicalBlock(scope: !258, file: !3, line: 75, column: 13)
!258 = distinct !DILexicalBlock(scope: !252, file: !3, line: 74, column: 29)
!259 = !DILocation(line: 75, column: 15, scope: !257)
!260 = !DILocation(line: 75, column: 13, scope: !258)
!261 = !DILocation(line: 76, column: 49, scope: !262)
!262 = distinct !DILexicalBlock(scope: !257, file: !3, line: 75, column: 19)
!263 = !DILocation(line: 76, column: 43, scope: !262)
!264 = !DILocation(line: 76, column: 52, scope: !262)
!265 = !DILocation(line: 76, column: 58, scope: !262)
!266 = !DILocation(line: 76, column: 60, scope: !262)
!267 = !DILocation(line: 76, column: 64, scope: !262)
!268 = !DILocation(line: 76, column: 66, scope: !262)
!269 = !DILocation(line: 76, column: 77, scope: !262)
!270 = !DILocation(line: 76, column: 71, scope: !262)
!271 = !DILocation(line: 76, column: 80, scope: !262)
!272 = !DILocation(line: 76, column: 69, scope: !262)
!273 = !DILocation(line: 76, column: 88, scope: !262)
!274 = !DILocation(line: 76, column: 90, scope: !262)
!275 = !DILocation(line: 76, column: 101, scope: !262)
!276 = !DILocation(line: 76, column: 95, scope: !262)
!277 = !DILocation(line: 76, column: 104, scope: !262)
!278 = !DILocation(line: 76, column: 93, scope: !262)
!279 = !DILocation(line: 76, column: 13, scope: !262)
!280 = !DILocation(line: 77, column: 19, scope: !262)
!281 = !DILocation(line: 77, column: 21, scope: !262)
!282 = !DILocation(line: 77, column: 16, scope: !262)
!283 = !DILocation(line: 78, column: 19, scope: !262)
!284 = !DILocation(line: 78, column: 21, scope: !262)
!285 = !DILocation(line: 78, column: 32, scope: !262)
!286 = !DILocation(line: 78, column: 26, scope: !262)
!287 = !DILocation(line: 78, column: 35, scope: !262)
!288 = !DILocation(line: 78, column: 24, scope: !262)
!289 = !DILocation(line: 78, column: 16, scope: !262)
!290 = !DILocation(line: 79, column: 19, scope: !262)
!291 = !DILocation(line: 79, column: 21, scope: !262)
!292 = !DILocation(line: 79, column: 32, scope: !262)
!293 = !DILocation(line: 79, column: 26, scope: !262)
!294 = !DILocation(line: 79, column: 35, scope: !262)
!295 = !DILocation(line: 79, column: 24, scope: !262)
!296 = !DILocation(line: 79, column: 16, scope: !262)
!297 = !DILocation(line: 80, column: 9, scope: !262)
!298 = !DILocation(line: 81, column: 5, scope: !258)
!299 = !DILocation(line: 74, column: 25, scope: !252)
!300 = !DILocation(line: 74, column: 5, scope: !252)
!301 = distinct !{!301, !255, !302}
!302 = !DILocation(line: 81, column: 5, scope: !249)
!303 = !DILocation(line: 82, column: 60, scope: !233)
!304 = !DILocation(line: 82, column: 64, scope: !233)
!305 = !DILocation(line: 82, column: 68, scope: !233)
!306 = !DILocation(line: 82, column: 5, scope: !233)
!307 = !DILocation(line: 83, column: 5, scope: !233)
