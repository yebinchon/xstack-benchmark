; ModuleID = 'calendar.c'
source_filename = "calendar.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.months = type { i8*, i32, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@width = dso_local global i32 80, align 4, !dbg !0
@year = dso_local global i32 1969, align 4, !dbg !6
@.str = private unnamed_addr constant [3 x i8] c"Su\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"Mo\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"Tu\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"We\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"Th\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"Fr\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"Sa\00", align 1
@wdays = dso_local global [7 x i8*] [i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0)], align 16, !dbg !9
@.str.7 = private unnamed_addr constant [8 x i8] c"January\00", align 1
@.str.8 = private unnamed_addr constant [9 x i8] c"February\00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"March\00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c"April\00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c"May\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"June\00", align 1
@.str.13 = private unnamed_addr constant [5 x i8] c"July\00", align 1
@.str.14 = private unnamed_addr constant [7 x i8] c"August\00", align 1
@.str.15 = private unnamed_addr constant [10 x i8] c"September\00", align 1
@.str.16 = private unnamed_addr constant [8 x i8] c"October\00", align 1
@.str.17 = private unnamed_addr constant [9 x i8] c"November\00", align 1
@.str.18 = private unnamed_addr constant [9 x i8] c"December\00", align 1
@months = dso_local global [12 x %struct.months] [%struct.months { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i32 0, i32 0), i32 31, i32 0, i32 0 }, %struct.months { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.8, i32 0, i32 0), i32 28, i32 0, i32 0 }, %struct.months { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9, i32 0, i32 0), i32 31, i32 0, i32 0 }, %struct.months { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i32 0, i32 0), i32 30, i32 0, i32 0 }, %struct.months { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0), i32 31, i32 0, i32 0 }, %struct.months { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i32 0, i32 0), i32 30, i32 0, i32 0 }, %struct.months { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0), i32 31, i32 0, i32 0 }, %struct.months { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.14, i32 0, i32 0), i32 31, i32 0, i32 0 }, %struct.months { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.15, i32 0, i32 0), i32 30, i32 0, i32 0 }, %struct.months { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.16, i32 0, i32 0), i32 31, i32 0, i32 0 }, %struct.months { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.17, i32 0, i32 0), i32 30, i32 0, i32 0 }, %struct.months { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.18, i32 0, i32 0), i32 31, i32 0, i32 0 }], align 16, !dbg !17
@cols = common dso_local global i32 0, align 4, !dbg !28
@gap = common dso_local global i32 0, align 4, !dbg !32
@lead = common dso_local global i32 0, align 4, !dbg !30
@.str.19 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.20 = private unnamed_addr constant [5 x i8] c"%s%s\00", align 1
@.str.21 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.22 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.23 = private unnamed_addr constant [4 x i8] c"%2d\00", align 1
@.str.24 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.25 = private unnamed_addr constant [5 x i8] c"%s\0A\0A\00", align 1
@.str.26 = private unnamed_addr constant [3 x i8] c"-w\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.27 = private unnamed_addr constant [44 x i8] c"bad args\0AUsage: %s year [-w width (>= 20)]\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @space(i32 %n) #0 !dbg !38 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !41, metadata !DIExpression()), !dbg !42
  br label %while.cond, !dbg !43

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %n.addr, align 4, !dbg !44
  %dec = add nsw i32 %0, -1, !dbg !44
  store i32 %dec, i32* %n.addr, align 4, !dbg !44
  %cmp = icmp sgt i32 %0, 0, !dbg !45
  br i1 %cmp, label %while.body, label %while.end, !dbg !43

while.body:                                       ; preds = %while.cond
  %call = call i32 @putchar(i32 32), !dbg !46
  br label %while.cond, !dbg !43, !llvm.loop !47

while.end:                                        ; preds = %while.cond
  ret void, !dbg !49
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @putchar(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @init_months() #0 !dbg !50 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !53, metadata !DIExpression()), !dbg !54
  %0 = load i32, i32* @year, align 4, !dbg !55
  %rem = srem i32 %0, 4, !dbg !57
  %tobool = icmp ne i32 %rem, 0, !dbg !57
  br i1 %tobool, label %lor.lhs.false, label %land.lhs.true, !dbg !58, !cf.info !59

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @year, align 4, !dbg !60
  %rem1 = srem i32 %1, 100, !dbg !61
  %tobool2 = icmp ne i32 %rem1, 0, !dbg !61
  br i1 %tobool2, label %if.then, label %lor.lhs.false, !dbg !62, !cf.info !59

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* @year, align 4, !dbg !63
  %rem3 = srem i32 %2, 400, !dbg !64
  %tobool4 = icmp ne i32 %rem3, 0, !dbg !64
  br i1 %tobool4, label %if.end, label %if.then, !dbg !65, !cf.info !59

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  store i32 29, i32* getelementptr inbounds ([12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 1, i32 1), align 8, !dbg !66
  br label %if.end, !dbg !67

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %3 = load i32, i32* @year, align 4, !dbg !68
  %dec = add nsw i32 %3, -1, !dbg !68
  store i32 %dec, i32* @year, align 4, !dbg !68
  %4 = load i32, i32* @year, align 4, !dbg !69
  %mul = mul nsw i32 %4, 365, !dbg !70
  %5 = load i32, i32* @year, align 4, !dbg !71
  %div = sdiv i32 %5, 4, !dbg !72
  %add = add nsw i32 %mul, %div, !dbg !73
  %6 = load i32, i32* @year, align 4, !dbg !74
  %div5 = sdiv i32 %6, 100, !dbg !75
  %sub = sub nsw i32 %add, %div5, !dbg !76
  %7 = load i32, i32* @year, align 4, !dbg !77
  %div6 = sdiv i32 %7, 400, !dbg !78
  %add7 = add nsw i32 %sub, %div6, !dbg !79
  %add8 = add nsw i32 %add7, 1, !dbg !80
  %rem9 = srem i32 %add8, 7, !dbg !81
  store i32 %rem9, i32* getelementptr inbounds ([12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 0, i32 2), align 4, !dbg !82
  store i32 1, i32* %i, align 4, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i32, i32* %i, align 4, !dbg !86
  %cmp = icmp slt i32 %8, 12, !dbg !88
  br i1 %cmp, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !90
  %sub10 = sub nsw i32 %9, 1, !dbg !91
  %idxprom = sext i32 %sub10 to i64, !dbg !92
  %arrayidx = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom, !dbg !92
  %start_wday = getelementptr inbounds %struct.months, %struct.months* %arrayidx, i32 0, i32 2, !dbg !93
  %10 = load i32, i32* %start_wday, align 4, !dbg !93
  %11 = load i32, i32* %i, align 4, !dbg !94
  %sub11 = sub nsw i32 %11, 1, !dbg !95
  %idxprom12 = sext i32 %sub11 to i64, !dbg !96
  %arrayidx13 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom12, !dbg !96
  %days = getelementptr inbounds %struct.months, %struct.months* %arrayidx13, i32 0, i32 1, !dbg !97
  %12 = load i32, i32* %days, align 8, !dbg !97
  %add14 = add nsw i32 %10, %12, !dbg !98
  %rem15 = srem i32 %add14, 7, !dbg !99
  %13 = load i32, i32* %i, align 4, !dbg !100
  %idxprom16 = sext i32 %13 to i64, !dbg !101
  %arrayidx17 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom16, !dbg !101
  %start_wday18 = getelementptr inbounds %struct.months, %struct.months* %arrayidx17, i32 0, i32 2, !dbg !102
  store i32 %rem15, i32* %start_wday18, align 4, !dbg !103
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4, !dbg !104
  %inc = add nsw i32 %14, 1, !dbg !104
  store i32 %inc, i32* %i, align 4, !dbg !104
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  %15 = load i32, i32* @width, align 4, !dbg !108
  %add19 = add nsw i32 %15, 2, !dbg !109
  %div20 = sdiv i32 %add19, 22, !dbg !110
  store i32 %div20, i32* @cols, align 4, !dbg !111
  br label %while.cond, !dbg !112

while.cond:                                       ; preds = %while.body, %for.end
  %16 = load i32, i32* @cols, align 4, !dbg !113
  %rem21 = srem i32 12, %16, !dbg !114
  %tobool22 = icmp ne i32 %rem21, 0, !dbg !112
  br i1 %tobool22, label %while.body, label %while.end, !dbg !112

while.body:                                       ; preds = %while.cond
  %17 = load i32, i32* @cols, align 4, !dbg !115
  %dec23 = add nsw i32 %17, -1, !dbg !115
  store i32 %dec23, i32* @cols, align 4, !dbg !115
  br label %while.cond, !dbg !112, !llvm.loop !116

while.end:                                        ; preds = %while.cond
  %18 = load i32, i32* @cols, align 4, !dbg !117
  %sub24 = sub nsw i32 %18, 1, !dbg !118
  %tobool25 = icmp ne i32 %sub24, 0, !dbg !118
  br i1 %tobool25, label %cond.true, label %cond.false, !dbg !117

cond.true:                                        ; preds = %while.end
  %19 = load i32, i32* @width, align 4, !dbg !119
  %20 = load i32, i32* @cols, align 4, !dbg !120
  %mul26 = mul nsw i32 20, %20, !dbg !121
  %sub27 = sub nsw i32 %19, %mul26, !dbg !122
  %21 = load i32, i32* @cols, align 4, !dbg !123
  %sub28 = sub nsw i32 %21, 1, !dbg !124
  %div29 = sdiv i32 %sub27, %sub28, !dbg !125
  br label %cond.end, !dbg !117

cond.false:                                       ; preds = %while.end
  br label %cond.end, !dbg !117

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %div29, %cond.true ], [ 0, %cond.false ], !dbg !117
  store i32 %cond, i32* @gap, align 4, !dbg !126
  %22 = load i32, i32* @gap, align 4, !dbg !127
  %cmp30 = icmp sgt i32 %22, 4, !dbg !129
  br i1 %cmp30, label %if.then31, label %if.end32, !dbg !130, !cf.info !59

if.then31:                                        ; preds = %cond.end
  store i32 4, i32* @gap, align 4, !dbg !131
  br label %if.end32, !dbg !132

if.end32:                                         ; preds = %if.then31, %cond.end
  %23 = load i32, i32* @width, align 4, !dbg !133
  %24 = load i32, i32* @gap, align 4, !dbg !134
  %add33 = add nsw i32 20, %24, !dbg !135
  %25 = load i32, i32* @cols, align 4, !dbg !136
  %mul34 = mul nsw i32 %add33, %25, !dbg !137
  %sub35 = sub nsw i32 %23, %mul34, !dbg !138
  %26 = load i32, i32* @gap, align 4, !dbg !139
  %add36 = add nsw i32 %sub35, %26, !dbg !140
  %add37 = add nsw i32 %add36, 1, !dbg !141
  %div38 = sdiv i32 %add37, 2, !dbg !142
  store i32 %div38, i32* @lead, align 4, !dbg !143
  %27 = load i32, i32* @year, align 4, !dbg !144
  %inc39 = add nsw i32 %27, 1, !dbg !144
  store i32 %inc39, i32* @year, align 4, !dbg !144
  ret void, !dbg !145
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_row(i32 %row) #0 !dbg !146 {
entry:
  %row.addr = alloca i32, align 4
  %c = alloca i32, align 4
  %i = alloca i32, align 4
  %from = alloca i32, align 4
  %to = alloca i32, align 4
  store i32 %row, i32* %row.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %row.addr, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i32* %c, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i32* %i, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata i32* %from, metadata !153, metadata !DIExpression()), !dbg !154
  %0 = load i32, i32* %row.addr, align 4, !dbg !155
  %1 = load i32, i32* @cols, align 4, !dbg !156
  %mul = mul nsw i32 %0, %1, !dbg !157
  store i32 %mul, i32* %from, align 4, !dbg !154
  call void @llvm.dbg.declare(metadata i32* %to, metadata !158, metadata !DIExpression()), !dbg !159
  %2 = load i32, i32* %from, align 4, !dbg !160
  %3 = load i32, i32* @cols, align 4, !dbg !161
  %add = add nsw i32 %2, %3, !dbg !162
  store i32 %add, i32* %to, align 4, !dbg !159
  %4 = load i32, i32* @lead, align 4, !dbg !163
  call void @space(i32 %4), !dbg !164
  %5 = load i32, i32* %from, align 4, !dbg !165
  store i32 %5, i32* %c, align 4, !dbg !167
  br label %for.cond, !dbg !168

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, i32* %c, align 4, !dbg !169
  %7 = load i32, i32* %to, align 4, !dbg !171
  %cmp = icmp slt i32 %6, %7, !dbg !172
  br i1 %cmp, label %for.body, label %for.end, !dbg !173

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %c, align 4, !dbg !174
  %idxprom = sext i32 %8 to i64, !dbg !176
  %arrayidx = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom, !dbg !176
  %name = getelementptr inbounds %struct.months, %struct.months* %arrayidx, i32 0, i32 0, !dbg !177
  %9 = load i8*, i8** %name, align 8, !dbg !177
  %call = call i64 @strlen(i8* %9) #6, !dbg !178
  %conv = trunc i64 %call to i32, !dbg !178
  store i32 %conv, i32* %i, align 4, !dbg !179
  %10 = load i32, i32* %i, align 4, !dbg !180
  %sub = sub nsw i32 20, %10, !dbg !181
  %div = sdiv i32 %sub, 2, !dbg !182
  call void @space(i32 %div), !dbg !183
  %11 = load i32, i32* %c, align 4, !dbg !184
  %idxprom1 = sext i32 %11 to i64, !dbg !185
  %arrayidx2 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom1, !dbg !185
  %name3 = getelementptr inbounds %struct.months, %struct.months* %arrayidx2, i32 0, i32 0, !dbg !186
  %12 = load i8*, i8** %name3, align 8, !dbg !186
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i64 0, i64 0), i8* %12), !dbg !187
  %13 = load i32, i32* %i, align 4, !dbg !188
  %sub5 = sub nsw i32 20, %13, !dbg !189
  %14 = load i32, i32* %i, align 4, !dbg !190
  %sub6 = sub nsw i32 20, %14, !dbg !191
  %div7 = sdiv i32 %sub6, 2, !dbg !192
  %sub8 = sub nsw i32 %sub5, %div7, !dbg !193
  %15 = load i32, i32* %c, align 4, !dbg !194
  %16 = load i32, i32* %to, align 4, !dbg !195
  %sub9 = sub nsw i32 %16, 1, !dbg !196
  %cmp10 = icmp eq i32 %15, %sub9, !dbg !197
  br i1 %cmp10, label %cond.true, label %cond.false, !dbg !198

cond.true:                                        ; preds = %for.body
  br label %cond.end, !dbg !198

cond.false:                                       ; preds = %for.body
  %17 = load i32, i32* @gap, align 4, !dbg !199
  br label %cond.end, !dbg !198

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %17, %cond.false ], !dbg !198
  %add12 = add nsw i32 %sub8, %cond, !dbg !200
  call void @space(i32 %add12), !dbg !201
  br label %for.inc, !dbg !202

for.inc:                                          ; preds = %cond.end
  %18 = load i32, i32* %c, align 4, !dbg !203
  %inc = add nsw i32 %18, 1, !dbg !203
  store i32 %inc, i32* %c, align 4, !dbg !203
  br label %for.cond, !dbg !204, !llvm.loop !205

for.end:                                          ; preds = %for.cond
  %call13 = call i32 @putchar(i32 10), !dbg !207
  %19 = load i32, i32* @lead, align 4, !dbg !208
  call void @space(i32 %19), !dbg !209
  %20 = load i32, i32* %from, align 4, !dbg !210
  store i32 %20, i32* %c, align 4, !dbg !212
  br label %for.cond14, !dbg !213

for.cond14:                                       ; preds = %for.inc35, %for.end
  %21 = load i32, i32* %c, align 4, !dbg !214
  %22 = load i32, i32* %to, align 4, !dbg !216
  %cmp15 = icmp slt i32 %21, %22, !dbg !217
  br i1 %cmp15, label %for.body17, label %for.end37, !dbg !218

for.body17:                                       ; preds = %for.cond14
  store i32 0, i32* %i, align 4, !dbg !219
  br label %for.cond18, !dbg !222

for.cond18:                                       ; preds = %for.inc28, %for.body17
  %23 = load i32, i32* %i, align 4, !dbg !223
  %cmp19 = icmp slt i32 %23, 7, !dbg !225
  br i1 %cmp19, label %for.body21, label %for.end30, !dbg !226

for.body21:                                       ; preds = %for.cond18
  %24 = load i32, i32* %i, align 4, !dbg !227
  %idxprom22 = sext i32 %24 to i64, !dbg !228
  %arrayidx23 = getelementptr inbounds [7 x i8*], [7 x i8*]* @wdays, i64 0, i64 %idxprom22, !dbg !228
  %25 = load i8*, i8** %arrayidx23, align 8, !dbg !228
  %26 = load i32, i32* %i, align 4, !dbg !229
  %cmp24 = icmp eq i32 %26, 6, !dbg !230
  %27 = zext i1 %cmp24 to i64, !dbg !229
  %cond26 = select i1 %cmp24, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.21, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.22, i64 0, i64 0), !dbg !229
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.20, i64 0, i64 0), i8* %25, i8* %cond26), !dbg !231
  br label %for.inc28, !dbg !231

for.inc28:                                        ; preds = %for.body21
  %28 = load i32, i32* %i, align 4, !dbg !232
  %inc29 = add nsw i32 %28, 1, !dbg !232
  store i32 %inc29, i32* %i, align 4, !dbg !232
  br label %for.cond18, !dbg !233, !llvm.loop !234

for.end30:                                        ; preds = %for.cond18
  %29 = load i32, i32* %c, align 4, !dbg !236
  %30 = load i32, i32* %to, align 4, !dbg !238
  %sub31 = sub nsw i32 %30, 1, !dbg !239
  %cmp32 = icmp slt i32 %29, %sub31, !dbg !240
  br i1 %cmp32, label %if.then, label %if.else, !dbg !241, !cf.info !59

if.then:                                          ; preds = %for.end30
  %31 = load i32, i32* @gap, align 4, !dbg !242
  call void @space(i32 %31), !dbg !243
  br label %if.end, !dbg !243

if.else:                                          ; preds = %for.end30
  %call34 = call i32 @putchar(i32 10), !dbg !244
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc35, !dbg !245

for.inc35:                                        ; preds = %if.end
  %32 = load i32, i32* %c, align 4, !dbg !246
  %inc36 = add nsw i32 %32, 1, !dbg !246
  store i32 %inc36, i32* %c, align 4, !dbg !246
  br label %for.cond14, !dbg !247, !llvm.loop !248

for.end37:                                        ; preds = %for.cond14
  br label %while.body, !dbg !250

while.body:                                       ; preds = %for.end37, %for.end118
  %33 = load i32, i32* %from, align 4, !dbg !251
  store i32 %33, i32* %c, align 4, !dbg !254
  br label %for.cond38, !dbg !255

for.cond38:                                       ; preds = %for.inc50, %while.body
  %34 = load i32, i32* %c, align 4, !dbg !256
  %35 = load i32, i32* %to, align 4, !dbg !258
  %cmp39 = icmp slt i32 %34, %35, !dbg !259
  br i1 %cmp39, label %for.body41, label %for.end52, !dbg !260

for.body41:                                       ; preds = %for.cond38
  %36 = load i32, i32* %c, align 4, !dbg !261
  %idxprom42 = sext i32 %36 to i64, !dbg !263
  %arrayidx43 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom42, !dbg !263
  %at = getelementptr inbounds %struct.months, %struct.months* %arrayidx43, i32 0, i32 3, !dbg !264
  %37 = load i32, i32* %at, align 8, !dbg !264
  %38 = load i32, i32* %c, align 4, !dbg !265
  %idxprom44 = sext i32 %38 to i64, !dbg !266
  %arrayidx45 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom44, !dbg !266
  %days = getelementptr inbounds %struct.months, %struct.months* %arrayidx45, i32 0, i32 1, !dbg !267
  %39 = load i32, i32* %days, align 8, !dbg !267
  %cmp46 = icmp slt i32 %37, %39, !dbg !268
  br i1 %cmp46, label %if.then48, label %if.end49, !dbg !269, !cf.info !59

if.then48:                                        ; preds = %for.body41
  br label %for.end52, !dbg !270

if.end49:                                         ; preds = %for.body41
  br label %for.inc50, !dbg !267

for.inc50:                                        ; preds = %if.end49
  %40 = load i32, i32* %c, align 4, !dbg !271
  %inc51 = add nsw i32 %40, 1, !dbg !271
  store i32 %inc51, i32* %c, align 4, !dbg !271
  br label %for.cond38, !dbg !272, !llvm.loop !273

for.end52:                                        ; preds = %if.then48, %for.cond38
  %41 = load i32, i32* %c, align 4, !dbg !275
  %42 = load i32, i32* %to, align 4, !dbg !277
  %cmp53 = icmp eq i32 %41, %42, !dbg !278
  br i1 %cmp53, label %if.then55, label %if.end56, !dbg !279, !cf.info !59

if.then55:                                        ; preds = %for.end52
  br label %while.end120, !dbg !280

if.end56:                                         ; preds = %for.end52
  %43 = load i32, i32* @lead, align 4, !dbg !281
  call void @space(i32 %43), !dbg !282
  %44 = load i32, i32* %from, align 4, !dbg !283
  store i32 %44, i32* %c, align 4, !dbg !285
  br label %for.cond57, !dbg !286

for.cond57:                                       ; preds = %for.inc116, %if.end56
  %45 = load i32, i32* %c, align 4, !dbg !287
  %46 = load i32, i32* %to, align 4, !dbg !289
  %cmp58 = icmp slt i32 %45, %46, !dbg !290
  br i1 %cmp58, label %for.body60, label %for.end118, !dbg !291

for.body60:                                       ; preds = %for.cond57
  store i32 0, i32* %i, align 4, !dbg !292
  br label %for.cond61, !dbg !295

for.cond61:                                       ; preds = %for.inc67, %for.body60
  %47 = load i32, i32* %i, align 4, !dbg !296
  %48 = load i32, i32* %c, align 4, !dbg !298
  %idxprom62 = sext i32 %48 to i64, !dbg !299
  %arrayidx63 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom62, !dbg !299
  %start_wday = getelementptr inbounds %struct.months, %struct.months* %arrayidx63, i32 0, i32 2, !dbg !300
  %49 = load i32, i32* %start_wday, align 4, !dbg !300
  %cmp64 = icmp slt i32 %47, %49, !dbg !301
  br i1 %cmp64, label %for.body66, label %for.end69, !dbg !302

for.body66:                                       ; preds = %for.cond61
  call void @space(i32 3), !dbg !303
  br label %for.inc67, !dbg !303

for.inc67:                                        ; preds = %for.body66
  %50 = load i32, i32* %i, align 4, !dbg !304
  %inc68 = add nsw i32 %50, 1, !dbg !304
  store i32 %inc68, i32* %i, align 4, !dbg !304
  br label %for.cond61, !dbg !305, !llvm.loop !306

for.end69:                                        ; preds = %for.cond61
  br label %while.cond70, !dbg !308

while.cond70:                                     ; preds = %if.end95, %for.end69
  %51 = load i32, i32* %i, align 4, !dbg !309
  %inc71 = add nsw i32 %51, 1, !dbg !309
  store i32 %inc71, i32* %i, align 4, !dbg !309
  %cmp72 = icmp slt i32 %51, 7, !dbg !310
  br i1 %cmp72, label %land.rhs, label %land.end, !dbg !311

land.rhs:                                         ; preds = %while.cond70
  %52 = load i32, i32* %c, align 4, !dbg !312
  %idxprom74 = sext i32 %52 to i64, !dbg !313
  %arrayidx75 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom74, !dbg !313
  %at76 = getelementptr inbounds %struct.months, %struct.months* %arrayidx75, i32 0, i32 3, !dbg !314
  %53 = load i32, i32* %at76, align 8, !dbg !314
  %54 = load i32, i32* %c, align 4, !dbg !315
  %idxprom77 = sext i32 %54 to i64, !dbg !316
  %arrayidx78 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom77, !dbg !316
  %days79 = getelementptr inbounds %struct.months, %struct.months* %arrayidx78, i32 0, i32 1, !dbg !317
  %55 = load i32, i32* %days79, align 8, !dbg !317
  %cmp80 = icmp slt i32 %53, %55, !dbg !318
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond70
  %56 = phi i1 [ false, %while.cond70 ], [ %cmp80, %land.rhs ], !dbg !319
  br i1 %56, label %while.body82, label %while.end, !dbg !308

while.body82:                                     ; preds = %land.end
  %57 = load i32, i32* %c, align 4, !dbg !320
  %idxprom83 = sext i32 %57 to i64, !dbg !322
  %arrayidx84 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom83, !dbg !322
  %at85 = getelementptr inbounds %struct.months, %struct.months* %arrayidx84, i32 0, i32 3, !dbg !323
  %58 = load i32, i32* %at85, align 8, !dbg !324
  %inc86 = add nsw i32 %58, 1, !dbg !324
  store i32 %inc86, i32* %at85, align 8, !dbg !324
  %call87 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i64 0, i64 0), i32 %inc86), !dbg !325
  %59 = load i32, i32* %i, align 4, !dbg !326
  %cmp88 = icmp slt i32 %59, 7, !dbg !328
  br i1 %cmp88, label %if.then93, label %lor.lhs.false, !dbg !329, !cf.info !59

lor.lhs.false:                                    ; preds = %while.body82
  %60 = load i32, i32* %c, align 4, !dbg !330
  %61 = load i32, i32* %to, align 4, !dbg !331
  %sub90 = sub nsw i32 %61, 1, !dbg !332
  %cmp91 = icmp slt i32 %60, %sub90, !dbg !333
  br i1 %cmp91, label %if.then93, label %if.end95, !dbg !334, !cf.info !59

if.then93:                                        ; preds = %lor.lhs.false, %while.body82
  %call94 = call i32 @putchar(i32 32), !dbg !335
  br label %if.end95, !dbg !335

if.end95:                                         ; preds = %if.then93, %lor.lhs.false
  br label %while.cond70, !dbg !308, !llvm.loop !336

while.end:                                        ; preds = %land.end
  br label %while.cond96, !dbg !338

while.cond96:                                     ; preds = %while.body105, %while.end
  %62 = load i32, i32* %i, align 4, !dbg !339
  %inc97 = add nsw i32 %62, 1, !dbg !339
  store i32 %inc97, i32* %i, align 4, !dbg !339
  %cmp98 = icmp sle i32 %62, 7, !dbg !340
  br i1 %cmp98, label %land.rhs100, label %land.end104, !dbg !341

land.rhs100:                                      ; preds = %while.cond96
  %63 = load i32, i32* %c, align 4, !dbg !342
  %64 = load i32, i32* %to, align 4, !dbg !343
  %sub101 = sub nsw i32 %64, 1, !dbg !344
  %cmp102 = icmp slt i32 %63, %sub101, !dbg !345
  br label %land.end104

land.end104:                                      ; preds = %land.rhs100, %while.cond96
  %65 = phi i1 [ false, %while.cond96 ], [ %cmp102, %land.rhs100 ], !dbg !319
  br i1 %65, label %while.body105, label %while.end106, !dbg !338

while.body105:                                    ; preds = %land.end104
  call void @space(i32 3), !dbg !346
  br label %while.cond96, !dbg !338, !llvm.loop !347

while.end106:                                     ; preds = %land.end104
  %66 = load i32, i32* %c, align 4, !dbg !349
  %67 = load i32, i32* %to, align 4, !dbg !351
  %sub107 = sub nsw i32 %67, 1, !dbg !352
  %cmp108 = icmp slt i32 %66, %sub107, !dbg !353
  br i1 %cmp108, label %if.then110, label %if.end112, !dbg !354, !cf.info !59

if.then110:                                       ; preds = %while.end106
  %68 = load i32, i32* @gap, align 4, !dbg !355
  %sub111 = sub nsw i32 %68, 1, !dbg !356
  call void @space(i32 %sub111), !dbg !357
  br label %if.end112, !dbg !357

if.end112:                                        ; preds = %if.then110, %while.end106
  %69 = load i32, i32* %c, align 4, !dbg !358
  %idxprom113 = sext i32 %69 to i64, !dbg !359
  %arrayidx114 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom113, !dbg !359
  %start_wday115 = getelementptr inbounds %struct.months, %struct.months* %arrayidx114, i32 0, i32 2, !dbg !360
  store i32 0, i32* %start_wday115, align 4, !dbg !361
  br label %for.inc116, !dbg !362

for.inc116:                                       ; preds = %if.end112
  %70 = load i32, i32* %c, align 4, !dbg !363
  %inc117 = add nsw i32 %70, 1, !dbg !363
  store i32 %inc117, i32* %c, align 4, !dbg !363
  br label %for.cond57, !dbg !364, !llvm.loop !365

for.end118:                                       ; preds = %for.cond57
  %call119 = call i32 @putchar(i32 10), !dbg !367
  br label %while.body, !dbg !250, !llvm.loop !368

while.end120:                                     ; preds = %if.then55
  %call121 = call i32 @putchar(i32 10), !dbg !370
  ret void, !dbg !371
}

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #3

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_year() #0 !dbg !372 {
entry:
  %row = alloca i32, align 4
  %buf = alloca [32 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %row, metadata !373, metadata !DIExpression()), !dbg !374
  call void @llvm.dbg.declare(metadata [32 x i8]* %buf, metadata !375, metadata !DIExpression()), !dbg !379
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i64 0, i64 0, !dbg !380
  %0 = load i32, i32* @year, align 4, !dbg !381
  %call = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.24, i64 0, i64 0), i32 %0) #7, !dbg !382
  %1 = load i32, i32* @width, align 4, !dbg !383
  %conv = sext i32 %1 to i64, !dbg !383
  %arraydecay1 = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i64 0, i64 0, !dbg !384
  %call2 = call i64 @strlen(i8* %arraydecay1) #6, !dbg !385
  %sub = sub i64 %conv, %call2, !dbg !386
  %div = udiv i64 %sub, 2, !dbg !387
  %conv3 = trunc i64 %div to i32, !dbg !388
  call void @space(i32 %conv3), !dbg !389
  %arraydecay4 = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i64 0, i64 0, !dbg !390
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i64 0, i64 0), i8* %arraydecay4), !dbg !391
  store i32 0, i32* %row, align 4, !dbg !392
  br label %for.cond, !dbg !394

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %row, align 4, !dbg !395
  %3 = load i32, i32* @cols, align 4, !dbg !397
  %mul = mul nsw i32 %2, %3, !dbg !398
  %cmp = icmp slt i32 %mul, 12, !dbg !399
  br i1 %cmp, label %for.body, label %for.end, !dbg !400

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %row, align 4, !dbg !401
  call void @print_row(i32 %4), !dbg !402
  br label %for.inc, !dbg !402

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %row, align 4, !dbg !403
  %inc = add nsw i32 %5, 1, !dbg !403
  store i32 %inc, i32* %row, align 4, !dbg !403
  br label %for.cond, !dbg !404, !llvm.loop !405

for.end:                                          ; preds = %for.cond
  ret void, !dbg !407
}

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8*, i8*, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !408 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %v.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %year_set = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !413, metadata !DIExpression()), !dbg !414
  store i8** %v, i8*** %v.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %v.addr, metadata !415, metadata !DIExpression()), !dbg !416
  call void @llvm.dbg.declare(metadata i32* %i, metadata !417, metadata !DIExpression()), !dbg !418
  call void @llvm.dbg.declare(metadata i32* %year_set, metadata !419, metadata !DIExpression()), !dbg !420
  store i32 0, i32* %year_set, align 4, !dbg !420
  store i32 1, i32* %i, align 4, !dbg !421
  br label %for.cond, !dbg !423

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !424
  %1 = load i32, i32* %c.addr, align 4, !dbg !426
  %cmp = icmp slt i32 %0, %1, !dbg !427
  br i1 %cmp, label %for.body, label %for.end, !dbg !428

for.body:                                         ; preds = %for.cond
  %2 = load i8**, i8*** %v.addr, align 8, !dbg !429
  %3 = load i32, i32* %i, align 4, !dbg !432
  %idxprom = sext i32 %3 to i64, !dbg !429
  %arrayidx = getelementptr inbounds i8*, i8** %2, i64 %idxprom, !dbg !429
  %4 = load i8*, i8** %arrayidx, align 8, !dbg !429
  %call = call i32 @strcmp(i8* %4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.26, i64 0, i64 0)) #6, !dbg !433
  %tobool = icmp ne i32 %call, 0, !dbg !433
  br i1 %tobool, label %if.else, label %if.then, !dbg !434, !cf.info !59

if.then:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !435
  %inc = add nsw i32 %5, 1, !dbg !435
  store i32 %inc, i32* %i, align 4, !dbg !435
  %6 = load i32, i32* %c.addr, align 4, !dbg !438
  %cmp1 = icmp eq i32 %inc, %6, !dbg !439
  br i1 %cmp1, label %if.then6, label %lor.lhs.false, !dbg !440, !cf.info !59

lor.lhs.false:                                    ; preds = %if.then
  %7 = load i8**, i8*** %v.addr, align 8, !dbg !441
  %8 = load i32, i32* %i, align 4, !dbg !442
  %idxprom2 = sext i32 %8 to i64, !dbg !441
  %arrayidx3 = getelementptr inbounds i8*, i8** %7, i64 %idxprom2, !dbg !441
  %9 = load i8*, i8** %arrayidx3, align 8, !dbg !441
  %call4 = call i32 @atoi(i8* %9) #6, !dbg !443
  store i32 %call4, i32* @width, align 4, !dbg !444
  %cmp5 = icmp slt i32 %call4, 20, !dbg !445
  br i1 %cmp5, label %if.then6, label %if.end, !dbg !446, !cf.info !59

if.then6:                                         ; preds = %lor.lhs.false, %if.then
  br label %bail, !dbg !447

if.end:                                           ; preds = %lor.lhs.false
  br label %if.end19, !dbg !448

if.else:                                          ; preds = %for.body
  %10 = load i32, i32* %year_set, align 4, !dbg !449
  %tobool7 = icmp ne i32 %10, 0, !dbg !449
  br i1 %tobool7, label %if.else17, label %if.then8, !dbg !451, !cf.info !59

if.then8:                                         ; preds = %if.else
  %11 = load i8**, i8*** %v.addr, align 8, !dbg !452
  %12 = load i32, i32* %i, align 4, !dbg !455
  %idxprom9 = sext i32 %12 to i64, !dbg !452
  %arrayidx10 = getelementptr inbounds i8*, i8** %11, i64 %idxprom9, !dbg !452
  %13 = load i8*, i8** %arrayidx10, align 8, !dbg !452
  %call11 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %13, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.24, i64 0, i64 0), i32* @year) #7, !dbg !456
  %tobool12 = icmp ne i32 %call11, 0, !dbg !456
  br i1 %tobool12, label %lor.lhs.false13, label %if.then15, !dbg !457, !cf.info !59

lor.lhs.false13:                                  ; preds = %if.then8
  %14 = load i32, i32* @year, align 4, !dbg !458
  %cmp14 = icmp sle i32 %14, 0, !dbg !459
  br i1 %cmp14, label %if.then15, label %if.end16, !dbg !460, !cf.info !59

if.then15:                                        ; preds = %lor.lhs.false13, %if.then8
  store i32 1969, i32* @year, align 4, !dbg !461
  br label %if.end16, !dbg !462

if.end16:                                         ; preds = %if.then15, %lor.lhs.false13
  store i32 1, i32* %year_set, align 4, !dbg !463
  br label %if.end18, !dbg !464

if.else17:                                        ; preds = %if.else
  br label %bail, !dbg !465

if.end18:                                         ; preds = %if.end16
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %if.end
  br label %for.inc, !dbg !466

for.inc:                                          ; preds = %if.end19
  %15 = load i32, i32* %i, align 4, !dbg !467
  %inc20 = add nsw i32 %15, 1, !dbg !467
  store i32 %inc20, i32* %i, align 4, !dbg !467
  br label %for.cond, !dbg !468, !llvm.loop !469

for.end:                                          ; preds = %for.cond
  call void @init_months(), !dbg !471
  call void @print_year(), !dbg !472
  ret i32 0, !dbg !473

bail:                                             ; preds = %if.else17, %if.then6
  call void @llvm.dbg.label(metadata !474), !dbg !475
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !476
  %17 = load i8**, i8*** %v.addr, align 8, !dbg !477
  %arrayidx21 = getelementptr inbounds i8*, i8** %17, i64 0, !dbg !477
  %18 = load i8*, i8** %arrayidx21, align 8, !dbg !477
  %call22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.27, i64 0, i64 0), i8* %18), !dbg !478
  call void @exit(i32 1) #8, !dbg !479
  unreachable, !dbg !479
}

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #3

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #3

; Function Attrs: nounwind
declare dso_local i32 @__isoc99_sscanf(i8*, i8*, ...) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!34, !35, !36}
!llvm.ident = !{!37}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "width", scope: !2, file: !3, line: 5, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "calendar.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Calendar")
!4 = !{}
!5 = !{!0, !6, !9, !17, !28, !30, !32}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "year", scope: !2, file: !3, line: 5, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "wdays", scope: !2, file: !3, line: 8, type: !11, isLocal: false, isDefinition: true)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 448, elements: !15)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !{!16}
!16 = !DISubrange(count: 7)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "months", scope: !2, file: !3, line: 12, type: !19, isLocal: false, isDefinition: true)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 2304, elements: !26)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "months", file: !3, line: 9, size: 192, elements: !21)
!21 = !{!22, !23, !24, !25}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !20, file: !3, line: 10, baseType: !12, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "days", scope: !20, file: !3, line: 11, baseType: !8, size: 32, offset: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "start_wday", scope: !20, file: !3, line: 11, baseType: !8, size: 32, offset: 96)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "at", scope: !20, file: !3, line: 11, baseType: !8, size: 32, offset: 128)
!26 = !{!27}
!27 = !DISubrange(count: 12)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "cols", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "lead", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "gap", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!34 = !{i32 7, !"Dwarf Version", i32 4}
!35 = !{i32 2, !"Debug Info Version", i32 3}
!36 = !{i32 1, !"wchar_size", i32 4}
!37 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!38 = distinct !DISubprogram(name: "space", scope: !3, file: !3, line: 27, type: !39, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DISubroutineType(types: !40)
!40 = !{null, !8}
!41 = !DILocalVariable(name: "n", arg: 1, scope: !38, file: !3, line: 27, type: !8)
!42 = !DILocation(line: 27, column: 16, scope: !38)
!43 = !DILocation(line: 27, column: 21, scope: !38)
!44 = !DILocation(line: 27, column: 29, scope: !38)
!45 = !DILocation(line: 27, column: 32, scope: !38)
!46 = !DILocation(line: 27, column: 37, scope: !38)
!47 = distinct !{!47, !43, !48}
!48 = !DILocation(line: 27, column: 48, scope: !38)
!49 = !DILocation(line: 27, column: 51, scope: !38)
!50 = distinct !DISubprogram(name: "init_months", scope: !3, file: !3, line: 29, type: !51, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DISubroutineType(types: !52)
!52 = !{null}
!53 = !DILocalVariable(name: "i", scope: !50, file: !3, line: 31, type: !8)
!54 = !DILocation(line: 31, column: 6, scope: !50)
!55 = !DILocation(line: 33, column: 9, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !3, line: 33, column: 6)
!57 = !DILocation(line: 33, column: 14, scope: !56)
!58 = !DILocation(line: 33, column: 19, scope: !56)
!59 = !{!"if"}
!60 = !DILocation(line: 33, column: 23, scope: !56)
!61 = !DILocation(line: 33, column: 28, scope: !56)
!62 = !DILocation(line: 33, column: 36, scope: !56)
!63 = !DILocation(line: 33, column: 41, scope: !56)
!64 = !DILocation(line: 33, column: 46, scope: !56)
!65 = !DILocation(line: 33, column: 6, scope: !50)
!66 = !DILocation(line: 34, column: 18, scope: !56)
!67 = !DILocation(line: 34, column: 3, scope: !56)
!68 = !DILocation(line: 36, column: 6, scope: !50)
!69 = !DILocation(line: 38, column: 6, scope: !50)
!70 = !DILocation(line: 38, column: 11, scope: !50)
!71 = !DILocation(line: 38, column: 19, scope: !50)
!72 = !DILocation(line: 38, column: 23, scope: !50)
!73 = !DILocation(line: 38, column: 17, scope: !50)
!74 = !DILocation(line: 38, column: 28, scope: !50)
!75 = !DILocation(line: 38, column: 32, scope: !50)
!76 = !DILocation(line: 38, column: 26, scope: !50)
!77 = !DILocation(line: 38, column: 39, scope: !50)
!78 = !DILocation(line: 38, column: 43, scope: !50)
!79 = !DILocation(line: 38, column: 37, scope: !50)
!80 = !DILocation(line: 38, column: 48, scope: !50)
!81 = !DILocation(line: 38, column: 53, scope: !50)
!82 = !DILocation(line: 38, column: 3, scope: !50)
!83 = !DILocation(line: 40, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !50, file: !3, line: 40, column: 2)
!85 = !DILocation(line: 40, column: 7, scope: !84)
!86 = !DILocation(line: 40, column: 14, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !3, line: 40, column: 2)
!88 = !DILocation(line: 40, column: 16, scope: !87)
!89 = !DILocation(line: 40, column: 2, scope: !84)
!90 = !DILocation(line: 42, column: 12, scope: !87)
!91 = !DILocation(line: 42, column: 13, scope: !87)
!92 = !DILocation(line: 42, column: 5, scope: !87)
!93 = !DILocation(line: 42, column: 17, scope: !87)
!94 = !DILocation(line: 42, column: 37, scope: !87)
!95 = !DILocation(line: 42, column: 38, scope: !87)
!96 = !DILocation(line: 42, column: 30, scope: !87)
!97 = !DILocation(line: 42, column: 42, scope: !87)
!98 = !DILocation(line: 42, column: 28, scope: !87)
!99 = !DILocation(line: 42, column: 48, scope: !87)
!100 = !DILocation(line: 41, column: 10, scope: !87)
!101 = !DILocation(line: 41, column: 3, scope: !87)
!102 = !DILocation(line: 41, column: 13, scope: !87)
!103 = !DILocation(line: 41, column: 24, scope: !87)
!104 = !DILocation(line: 40, column: 23, scope: !87)
!105 = !DILocation(line: 40, column: 2, scope: !87)
!106 = distinct !{!106, !89, !107}
!107 = !DILocation(line: 42, column: 50, scope: !84)
!108 = !DILocation(line: 44, column: 10, scope: !50)
!109 = !DILocation(line: 44, column: 16, scope: !50)
!110 = !DILocation(line: 44, column: 21, scope: !50)
!111 = !DILocation(line: 44, column: 7, scope: !50)
!112 = !DILocation(line: 45, column: 2, scope: !50)
!113 = !DILocation(line: 45, column: 14, scope: !50)
!114 = !DILocation(line: 45, column: 12, scope: !50)
!115 = !DILocation(line: 45, column: 24, scope: !50)
!116 = distinct !{!116, !112, !115}
!117 = !DILocation(line: 46, column: 8, scope: !50)
!118 = !DILocation(line: 46, column: 13, scope: !50)
!119 = !DILocation(line: 46, column: 20, scope: !50)
!120 = !DILocation(line: 46, column: 33, scope: !50)
!121 = !DILocation(line: 46, column: 31, scope: !50)
!122 = !DILocation(line: 46, column: 26, scope: !50)
!123 = !DILocation(line: 46, column: 42, scope: !50)
!124 = !DILocation(line: 46, column: 47, scope: !50)
!125 = !DILocation(line: 46, column: 39, scope: !50)
!126 = !DILocation(line: 46, column: 6, scope: !50)
!127 = !DILocation(line: 47, column: 6, scope: !128)
!128 = distinct !DILexicalBlock(scope: !50, file: !3, line: 47, column: 6)
!129 = !DILocation(line: 47, column: 10, scope: !128)
!130 = !DILocation(line: 47, column: 6, scope: !50)
!131 = !DILocation(line: 47, column: 19, scope: !128)
!132 = !DILocation(line: 47, column: 15, scope: !128)
!133 = !DILocation(line: 48, column: 10, scope: !50)
!134 = !DILocation(line: 48, column: 24, scope: !50)
!135 = !DILocation(line: 48, column: 22, scope: !50)
!136 = !DILocation(line: 48, column: 31, scope: !50)
!137 = !DILocation(line: 48, column: 29, scope: !50)
!138 = !DILocation(line: 48, column: 16, scope: !50)
!139 = !DILocation(line: 48, column: 38, scope: !50)
!140 = !DILocation(line: 48, column: 36, scope: !50)
!141 = !DILocation(line: 48, column: 42, scope: !50)
!142 = !DILocation(line: 48, column: 47, scope: !50)
!143 = !DILocation(line: 48, column: 7, scope: !50)
!144 = !DILocation(line: 49, column: 13, scope: !50)
!145 = !DILocation(line: 50, column: 1, scope: !50)
!146 = distinct !DISubprogram(name: "print_row", scope: !3, file: !3, line: 52, type: !39, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!147 = !DILocalVariable(name: "row", arg: 1, scope: !146, file: !3, line: 52, type: !8)
!148 = !DILocation(line: 52, column: 20, scope: !146)
!149 = !DILocalVariable(name: "c", scope: !146, file: !3, line: 54, type: !8)
!150 = !DILocation(line: 54, column: 6, scope: !146)
!151 = !DILocalVariable(name: "i", scope: !146, file: !3, line: 54, type: !8)
!152 = !DILocation(line: 54, column: 9, scope: !146)
!153 = !DILocalVariable(name: "from", scope: !146, file: !3, line: 54, type: !8)
!154 = !DILocation(line: 54, column: 12, scope: !146)
!155 = !DILocation(line: 54, column: 19, scope: !146)
!156 = !DILocation(line: 54, column: 25, scope: !146)
!157 = !DILocation(line: 54, column: 23, scope: !146)
!158 = !DILocalVariable(name: "to", scope: !146, file: !3, line: 54, type: !8)
!159 = !DILocation(line: 54, column: 31, scope: !146)
!160 = !DILocation(line: 54, column: 36, scope: !146)
!161 = !DILocation(line: 54, column: 43, scope: !146)
!162 = !DILocation(line: 54, column: 41, scope: !146)
!163 = !DILocation(line: 55, column: 8, scope: !146)
!164 = !DILocation(line: 55, column: 2, scope: !146)
!165 = !DILocation(line: 56, column: 11, scope: !166)
!166 = distinct !DILexicalBlock(scope: !146, file: !3, line: 56, column: 2)
!167 = !DILocation(line: 56, column: 9, scope: !166)
!168 = !DILocation(line: 56, column: 7, scope: !166)
!169 = !DILocation(line: 56, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !3, line: 56, column: 2)
!171 = !DILocation(line: 56, column: 21, scope: !170)
!172 = !DILocation(line: 56, column: 19, scope: !170)
!173 = !DILocation(line: 56, column: 2, scope: !166)
!174 = !DILocation(line: 57, column: 21, scope: !175)
!175 = distinct !DILexicalBlock(scope: !170, file: !3, line: 56, column: 30)
!176 = !DILocation(line: 57, column: 14, scope: !175)
!177 = !DILocation(line: 57, column: 24, scope: !175)
!178 = !DILocation(line: 57, column: 7, scope: !175)
!179 = !DILocation(line: 57, column: 5, scope: !175)
!180 = !DILocation(line: 58, column: 15, scope: !175)
!181 = !DILocation(line: 58, column: 13, scope: !175)
!182 = !DILocation(line: 58, column: 17, scope: !175)
!183 = !DILocation(line: 58, column: 3, scope: !175)
!184 = !DILocation(line: 59, column: 23, scope: !175)
!185 = !DILocation(line: 59, column: 16, scope: !175)
!186 = !DILocation(line: 59, column: 26, scope: !175)
!187 = !DILocation(line: 59, column: 3, scope: !175)
!188 = !DILocation(line: 60, column: 14, scope: !175)
!189 = !DILocation(line: 60, column: 12, scope: !175)
!190 = !DILocation(line: 60, column: 24, scope: !175)
!191 = !DILocation(line: 60, column: 22, scope: !175)
!192 = !DILocation(line: 60, column: 26, scope: !175)
!193 = !DILocation(line: 60, column: 16, scope: !175)
!194 = !DILocation(line: 60, column: 33, scope: !175)
!195 = !DILocation(line: 60, column: 38, scope: !175)
!196 = !DILocation(line: 60, column: 41, scope: !175)
!197 = !DILocation(line: 60, column: 35, scope: !175)
!198 = !DILocation(line: 60, column: 32, scope: !175)
!199 = !DILocation(line: 60, column: 52, scope: !175)
!200 = !DILocation(line: 60, column: 29, scope: !175)
!201 = !DILocation(line: 60, column: 3, scope: !175)
!202 = !DILocation(line: 61, column: 2, scope: !175)
!203 = !DILocation(line: 56, column: 26, scope: !170)
!204 = !DILocation(line: 56, column: 2, scope: !170)
!205 = distinct !{!205, !173, !206}
!206 = !DILocation(line: 61, column: 2, scope: !166)
!207 = !DILocation(line: 62, column: 2, scope: !146)
!208 = !DILocation(line: 64, column: 8, scope: !146)
!209 = !DILocation(line: 64, column: 2, scope: !146)
!210 = !DILocation(line: 65, column: 11, scope: !211)
!211 = distinct !DILexicalBlock(scope: !146, file: !3, line: 65, column: 2)
!212 = !DILocation(line: 65, column: 9, scope: !211)
!213 = !DILocation(line: 65, column: 7, scope: !211)
!214 = !DILocation(line: 65, column: 17, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !3, line: 65, column: 2)
!216 = !DILocation(line: 65, column: 21, scope: !215)
!217 = !DILocation(line: 65, column: 19, scope: !215)
!218 = !DILocation(line: 65, column: 2, scope: !211)
!219 = !DILocation(line: 66, column: 10, scope: !220)
!220 = distinct !DILexicalBlock(scope: !221, file: !3, line: 66, column: 3)
!221 = distinct !DILexicalBlock(scope: !215, file: !3, line: 65, column: 30)
!222 = !DILocation(line: 66, column: 8, scope: !220)
!223 = !DILocation(line: 66, column: 15, scope: !224)
!224 = distinct !DILexicalBlock(scope: !220, file: !3, line: 66, column: 3)
!225 = !DILocation(line: 66, column: 17, scope: !224)
!226 = !DILocation(line: 66, column: 3, scope: !220)
!227 = !DILocation(line: 67, column: 25, scope: !224)
!228 = !DILocation(line: 67, column: 19, scope: !224)
!229 = !DILocation(line: 67, column: 29, scope: !224)
!230 = !DILocation(line: 67, column: 31, scope: !224)
!231 = !DILocation(line: 67, column: 4, scope: !224)
!232 = !DILocation(line: 66, column: 23, scope: !224)
!233 = !DILocation(line: 66, column: 3, scope: !224)
!234 = distinct !{!234, !226, !235}
!235 = !DILocation(line: 67, column: 46, scope: !220)
!236 = !DILocation(line: 68, column: 7, scope: !237)
!237 = distinct !DILexicalBlock(scope: !221, file: !3, line: 68, column: 7)
!238 = !DILocation(line: 68, column: 11, scope: !237)
!239 = !DILocation(line: 68, column: 14, scope: !237)
!240 = !DILocation(line: 68, column: 9, scope: !237)
!241 = !DILocation(line: 68, column: 7, scope: !221)
!242 = !DILocation(line: 68, column: 25, scope: !237)
!243 = !DILocation(line: 68, column: 19, scope: !237)
!244 = !DILocation(line: 69, column: 8, scope: !237)
!245 = !DILocation(line: 70, column: 2, scope: !221)
!246 = !DILocation(line: 65, column: 26, scope: !215)
!247 = !DILocation(line: 65, column: 2, scope: !215)
!248 = distinct !{!248, !218, !249}
!249 = !DILocation(line: 70, column: 2, scope: !211)
!250 = !DILocation(line: 72, column: 2, scope: !146)
!251 = !DILocation(line: 73, column: 12, scope: !252)
!252 = distinct !DILexicalBlock(scope: !253, file: !3, line: 73, column: 3)
!253 = distinct !DILexicalBlock(scope: !146, file: !3, line: 72, column: 12)
!254 = !DILocation(line: 73, column: 10, scope: !252)
!255 = !DILocation(line: 73, column: 8, scope: !252)
!256 = !DILocation(line: 73, column: 18, scope: !257)
!257 = distinct !DILexicalBlock(scope: !252, file: !3, line: 73, column: 3)
!258 = !DILocation(line: 73, column: 22, scope: !257)
!259 = !DILocation(line: 73, column: 20, scope: !257)
!260 = !DILocation(line: 73, column: 3, scope: !252)
!261 = !DILocation(line: 74, column: 15, scope: !262)
!262 = distinct !DILexicalBlock(scope: !257, file: !3, line: 74, column: 8)
!263 = !DILocation(line: 74, column: 8, scope: !262)
!264 = !DILocation(line: 74, column: 18, scope: !262)
!265 = !DILocation(line: 74, column: 30, scope: !262)
!266 = !DILocation(line: 74, column: 23, scope: !262)
!267 = !DILocation(line: 74, column: 33, scope: !262)
!268 = !DILocation(line: 74, column: 21, scope: !262)
!269 = !DILocation(line: 74, column: 8, scope: !257)
!270 = !DILocation(line: 74, column: 39, scope: !262)
!271 = !DILocation(line: 73, column: 27, scope: !257)
!272 = !DILocation(line: 73, column: 3, scope: !257)
!273 = distinct !{!273, !260, !274}
!274 = !DILocation(line: 74, column: 39, scope: !252)
!275 = !DILocation(line: 75, column: 7, scope: !276)
!276 = distinct !DILexicalBlock(scope: !253, file: !3, line: 75, column: 7)
!277 = !DILocation(line: 75, column: 12, scope: !276)
!278 = !DILocation(line: 75, column: 9, scope: !276)
!279 = !DILocation(line: 75, column: 7, scope: !253)
!280 = !DILocation(line: 75, column: 16, scope: !276)
!281 = !DILocation(line: 77, column: 9, scope: !253)
!282 = !DILocation(line: 77, column: 3, scope: !253)
!283 = !DILocation(line: 78, column: 12, scope: !284)
!284 = distinct !DILexicalBlock(scope: !253, file: !3, line: 78, column: 3)
!285 = !DILocation(line: 78, column: 10, scope: !284)
!286 = !DILocation(line: 78, column: 8, scope: !284)
!287 = !DILocation(line: 78, column: 18, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !3, line: 78, column: 3)
!289 = !DILocation(line: 78, column: 22, scope: !288)
!290 = !DILocation(line: 78, column: 20, scope: !288)
!291 = !DILocation(line: 78, column: 3, scope: !284)
!292 = !DILocation(line: 79, column: 11, scope: !293)
!293 = distinct !DILexicalBlock(scope: !294, file: !3, line: 79, column: 4)
!294 = distinct !DILexicalBlock(scope: !288, file: !3, line: 78, column: 31)
!295 = !DILocation(line: 79, column: 9, scope: !293)
!296 = !DILocation(line: 79, column: 16, scope: !297)
!297 = distinct !DILexicalBlock(scope: !293, file: !3, line: 79, column: 4)
!298 = !DILocation(line: 79, column: 27, scope: !297)
!299 = !DILocation(line: 79, column: 20, scope: !297)
!300 = !DILocation(line: 79, column: 30, scope: !297)
!301 = !DILocation(line: 79, column: 18, scope: !297)
!302 = !DILocation(line: 79, column: 4, scope: !293)
!303 = !DILocation(line: 79, column: 47, scope: !297)
!304 = !DILocation(line: 79, column: 43, scope: !297)
!305 = !DILocation(line: 79, column: 4, scope: !297)
!306 = distinct !{!306, !302, !307}
!307 = !DILocation(line: 79, column: 54, scope: !293)
!308 = !DILocation(line: 80, column: 4, scope: !294)
!309 = !DILocation(line: 80, column: 11, scope: !294)
!310 = !DILocation(line: 80, column: 14, scope: !294)
!311 = !DILocation(line: 80, column: 18, scope: !294)
!312 = !DILocation(line: 80, column: 28, scope: !294)
!313 = !DILocation(line: 80, column: 21, scope: !294)
!314 = !DILocation(line: 80, column: 31, scope: !294)
!315 = !DILocation(line: 80, column: 43, scope: !294)
!316 = !DILocation(line: 80, column: 36, scope: !294)
!317 = !DILocation(line: 80, column: 46, scope: !294)
!318 = !DILocation(line: 80, column: 34, scope: !294)
!319 = !DILocation(line: 0, scope: !294)
!320 = !DILocation(line: 81, column: 28, scope: !321)
!321 = distinct !DILexicalBlock(scope: !294, file: !3, line: 80, column: 52)
!322 = !DILocation(line: 81, column: 21, scope: !321)
!323 = !DILocation(line: 81, column: 31, scope: !321)
!324 = !DILocation(line: 81, column: 19, scope: !321)
!325 = !DILocation(line: 81, column: 5, scope: !321)
!326 = !DILocation(line: 82, column: 9, scope: !327)
!327 = distinct !DILexicalBlock(scope: !321, file: !3, line: 82, column: 9)
!328 = !DILocation(line: 82, column: 11, scope: !327)
!329 = !DILocation(line: 82, column: 15, scope: !327)
!330 = !DILocation(line: 82, column: 18, scope: !327)
!331 = !DILocation(line: 82, column: 22, scope: !327)
!332 = !DILocation(line: 82, column: 25, scope: !327)
!333 = !DILocation(line: 82, column: 20, scope: !327)
!334 = !DILocation(line: 82, column: 9, scope: !321)
!335 = !DILocation(line: 82, column: 30, scope: !327)
!336 = distinct !{!336, !308, !337}
!337 = !DILocation(line: 83, column: 4, scope: !294)
!338 = !DILocation(line: 84, column: 4, scope: !294)
!339 = !DILocation(line: 84, column: 12, scope: !294)
!340 = !DILocation(line: 84, column: 15, scope: !294)
!341 = !DILocation(line: 84, column: 20, scope: !294)
!342 = !DILocation(line: 84, column: 23, scope: !294)
!343 = !DILocation(line: 84, column: 27, scope: !294)
!344 = !DILocation(line: 84, column: 30, scope: !294)
!345 = !DILocation(line: 84, column: 25, scope: !294)
!346 = !DILocation(line: 84, column: 35, scope: !294)
!347 = distinct !{!347, !338, !348}
!348 = !DILocation(line: 84, column: 42, scope: !294)
!349 = !DILocation(line: 85, column: 8, scope: !350)
!350 = distinct !DILexicalBlock(scope: !294, file: !3, line: 85, column: 8)
!351 = !DILocation(line: 85, column: 12, scope: !350)
!352 = !DILocation(line: 85, column: 15, scope: !350)
!353 = !DILocation(line: 85, column: 10, scope: !350)
!354 = !DILocation(line: 85, column: 8, scope: !294)
!355 = !DILocation(line: 85, column: 26, scope: !350)
!356 = !DILocation(line: 85, column: 30, scope: !350)
!357 = !DILocation(line: 85, column: 20, scope: !350)
!358 = !DILocation(line: 86, column: 11, scope: !294)
!359 = !DILocation(line: 86, column: 4, scope: !294)
!360 = !DILocation(line: 86, column: 14, scope: !294)
!361 = !DILocation(line: 86, column: 25, scope: !294)
!362 = !DILocation(line: 87, column: 3, scope: !294)
!363 = !DILocation(line: 78, column: 27, scope: !288)
!364 = !DILocation(line: 78, column: 3, scope: !288)
!365 = distinct !{!365, !291, !366}
!366 = !DILocation(line: 87, column: 3, scope: !284)
!367 = !DILocation(line: 88, column: 3, scope: !253)
!368 = distinct !{!368, !250, !369}
!369 = !DILocation(line: 89, column: 2, scope: !146)
!370 = !DILocation(line: 90, column: 2, scope: !146)
!371 = !DILocation(line: 91, column: 1, scope: !146)
!372 = distinct !DISubprogram(name: "print_year", scope: !3, file: !3, line: 93, type: !51, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!373 = !DILocalVariable(name: "row", scope: !372, file: !3, line: 95, type: !8)
!374 = !DILocation(line: 95, column: 6, scope: !372)
!375 = !DILocalVariable(name: "buf", scope: !372, file: !3, line: 96, type: !376)
!376 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 256, elements: !377)
!377 = !{!378}
!378 = !DISubrange(count: 32)
!379 = !DILocation(line: 96, column: 7, scope: !372)
!380 = !DILocation(line: 97, column: 10, scope: !372)
!381 = !DILocation(line: 97, column: 21, scope: !372)
!382 = !DILocation(line: 97, column: 2, scope: !372)
!383 = !DILocation(line: 98, column: 9, scope: !372)
!384 = !DILocation(line: 98, column: 24, scope: !372)
!385 = !DILocation(line: 98, column: 17, scope: !372)
!386 = !DILocation(line: 98, column: 15, scope: !372)
!387 = !DILocation(line: 98, column: 30, scope: !372)
!388 = !DILocation(line: 98, column: 8, scope: !372)
!389 = !DILocation(line: 98, column: 2, scope: !372)
!390 = !DILocation(line: 99, column: 19, scope: !372)
!391 = !DILocation(line: 99, column: 2, scope: !372)
!392 = !DILocation(line: 100, column: 11, scope: !393)
!393 = distinct !DILexicalBlock(scope: !372, file: !3, line: 100, column: 2)
!394 = !DILocation(line: 100, column: 7, scope: !393)
!395 = !DILocation(line: 100, column: 16, scope: !396)
!396 = distinct !DILexicalBlock(scope: !393, file: !3, line: 100, column: 2)
!397 = !DILocation(line: 100, column: 22, scope: !396)
!398 = !DILocation(line: 100, column: 20, scope: !396)
!399 = !DILocation(line: 100, column: 27, scope: !396)
!400 = !DILocation(line: 100, column: 2, scope: !393)
!401 = !DILocation(line: 101, column: 13, scope: !396)
!402 = !DILocation(line: 101, column: 3, scope: !396)
!403 = !DILocation(line: 100, column: 36, scope: !396)
!404 = !DILocation(line: 100, column: 2, scope: !396)
!405 = distinct !{!405, !400, !406}
!406 = !DILocation(line: 101, column: 16, scope: !393)
!407 = !DILocation(line: 102, column: 1, scope: !372)
!408 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 104, type: !409, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!409 = !DISubroutineType(types: !410)
!410 = !{!8, !8, !411}
!411 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !412, size: 64)
!412 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!413 = !DILocalVariable(name: "c", arg: 1, scope: !408, file: !3, line: 104, type: !8)
!414 = !DILocation(line: 104, column: 14, scope: !408)
!415 = !DILocalVariable(name: "v", arg: 2, scope: !408, file: !3, line: 104, type: !411)
!416 = !DILocation(line: 104, column: 24, scope: !408)
!417 = !DILocalVariable(name: "i", scope: !408, file: !3, line: 106, type: !8)
!418 = !DILocation(line: 106, column: 6, scope: !408)
!419 = !DILocalVariable(name: "year_set", scope: !408, file: !3, line: 106, type: !8)
!420 = !DILocation(line: 106, column: 9, scope: !408)
!421 = !DILocation(line: 107, column: 9, scope: !422)
!422 = distinct !DILexicalBlock(scope: !408, file: !3, line: 107, column: 2)
!423 = !DILocation(line: 107, column: 7, scope: !422)
!424 = !DILocation(line: 107, column: 14, scope: !425)
!425 = distinct !DILexicalBlock(scope: !422, file: !3, line: 107, column: 2)
!426 = !DILocation(line: 107, column: 18, scope: !425)
!427 = !DILocation(line: 107, column: 16, scope: !425)
!428 = !DILocation(line: 107, column: 2, scope: !422)
!429 = !DILocation(line: 108, column: 15, scope: !430)
!430 = distinct !DILexicalBlock(scope: !431, file: !3, line: 108, column: 7)
!431 = distinct !DILexicalBlock(scope: !425, file: !3, line: 107, column: 26)
!432 = !DILocation(line: 108, column: 17, scope: !430)
!433 = !DILocation(line: 108, column: 8, scope: !430)
!434 = !DILocation(line: 108, column: 7, scope: !431)
!435 = !DILocation(line: 109, column: 8, scope: !436)
!436 = distinct !DILexicalBlock(scope: !437, file: !3, line: 109, column: 8)
!437 = distinct !DILexicalBlock(scope: !430, file: !3, line: 108, column: 28)
!438 = !DILocation(line: 109, column: 15, scope: !436)
!439 = !DILocation(line: 109, column: 12, scope: !436)
!440 = !DILocation(line: 109, column: 17, scope: !436)
!441 = !DILocation(line: 109, column: 34, scope: !436)
!442 = !DILocation(line: 109, column: 36, scope: !436)
!443 = !DILocation(line: 109, column: 29, scope: !436)
!444 = !DILocation(line: 109, column: 27, scope: !436)
!445 = !DILocation(line: 109, column: 41, scope: !436)
!446 = !DILocation(line: 109, column: 8, scope: !437)
!447 = !DILocation(line: 110, column: 5, scope: !436)
!448 = !DILocation(line: 111, column: 3, scope: !437)
!449 = !DILocation(line: 111, column: 15, scope: !450)
!450 = distinct !DILexicalBlock(scope: !430, file: !3, line: 111, column: 14)
!451 = !DILocation(line: 111, column: 14, scope: !430)
!452 = !DILocation(line: 112, column: 16, scope: !453)
!453 = distinct !DILexicalBlock(scope: !454, file: !3, line: 112, column: 8)
!454 = distinct !DILexicalBlock(scope: !450, file: !3, line: 111, column: 25)
!455 = !DILocation(line: 112, column: 18, scope: !453)
!456 = !DILocation(line: 112, column: 9, scope: !453)
!457 = !DILocation(line: 112, column: 35, scope: !453)
!458 = !DILocation(line: 112, column: 38, scope: !453)
!459 = !DILocation(line: 112, column: 43, scope: !453)
!460 = !DILocation(line: 112, column: 8, scope: !454)
!461 = !DILocation(line: 113, column: 10, scope: !453)
!462 = !DILocation(line: 113, column: 5, scope: !453)
!463 = !DILocation(line: 114, column: 13, scope: !454)
!464 = !DILocation(line: 115, column: 3, scope: !454)
!465 = !DILocation(line: 116, column: 4, scope: !450)
!466 = !DILocation(line: 117, column: 2, scope: !431)
!467 = !DILocation(line: 107, column: 22, scope: !425)
!468 = !DILocation(line: 107, column: 2, scope: !425)
!469 = distinct !{!469, !428, !470}
!470 = !DILocation(line: 117, column: 2, scope: !422)
!471 = !DILocation(line: 119, column: 2, scope: !408)
!472 = !DILocation(line: 120, column: 2, scope: !408)
!473 = !DILocation(line: 121, column: 2, scope: !408)
!474 = !DILabel(scope: !408, name: "bail", file: !3, line: 123)
!475 = !DILocation(line: 123, column: 1, scope: !408)
!476 = !DILocation(line: 123, column: 15, scope: !408)
!477 = !DILocation(line: 123, column: 72, scope: !408)
!478 = !DILocation(line: 123, column: 7, scope: !408)
!479 = !DILocation(line: 124, column: 2, scope: !408)
