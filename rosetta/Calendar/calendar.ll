; ModuleID = 'calendar.ll'
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
  br i1 %tobool, label %lor.lhs.false, label %land.lhs.true, !dbg !58

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @year, align 4, !dbg !59
  %rem1 = srem i32 %1, 100, !dbg !60
  %tobool2 = icmp ne i32 %rem1, 0, !dbg !60
  br i1 %tobool2, label %if.then, label %lor.lhs.false, !dbg !61

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* @year, align 4, !dbg !62
  %rem3 = srem i32 %2, 400, !dbg !63
  %tobool4 = icmp ne i32 %rem3, 0, !dbg !63
  br i1 %tobool4, label %if.end, label %if.then, !dbg !64

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  store i32 29, i32* getelementptr inbounds ([12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 1, i32 1), align 8, !dbg !65
  br label %if.end, !dbg !66

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %3 = load i32, i32* @year, align 4, !dbg !67
  %dec = add nsw i32 %3, -1, !dbg !67
  store i32 %dec, i32* @year, align 4, !dbg !67
  %4 = load i32, i32* @year, align 4, !dbg !68
  %mul = mul nsw i32 %4, 365, !dbg !69
  %5 = load i32, i32* @year, align 4, !dbg !70
  %div = sdiv i32 %5, 4, !dbg !71
  %add = add nsw i32 %mul, %div, !dbg !72
  %6 = load i32, i32* @year, align 4, !dbg !73
  %div5 = sdiv i32 %6, 100, !dbg !74
  %sub = sub nsw i32 %add, %div5, !dbg !75
  %7 = load i32, i32* @year, align 4, !dbg !76
  %div6 = sdiv i32 %7, 400, !dbg !77
  %add7 = add nsw i32 %sub, %div6, !dbg !78
  %add8 = add nsw i32 %add7, 1, !dbg !79
  %rem9 = srem i32 %add8, 7, !dbg !80
  store i32 %rem9, i32* getelementptr inbounds ([12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 0, i32 2), align 4, !dbg !81
  store i32 1, i32* %i, align 4, !dbg !82
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i32, i32* %i, align 4, !dbg !85
  %cmp = icmp slt i32 %8, 12, !dbg !87
  br i1 %cmp, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !89
  %sub10 = sub nsw i32 %9, 1, !dbg !90
  %idxprom = sext i32 %sub10 to i64, !dbg !91
  %arrayidx = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom, !dbg !91
  %start_wday = getelementptr inbounds %struct.months, %struct.months* %arrayidx, i32 0, i32 2, !dbg !92
  %10 = load i32, i32* %start_wday, align 4, !dbg !92
  %11 = load i32, i32* %i, align 4, !dbg !93
  %sub11 = sub nsw i32 %11, 1, !dbg !94
  %idxprom12 = sext i32 %sub11 to i64, !dbg !95
  %arrayidx13 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom12, !dbg !95
  %days = getelementptr inbounds %struct.months, %struct.months* %arrayidx13, i32 0, i32 1, !dbg !96
  %12 = load i32, i32* %days, align 8, !dbg !96
  %add14 = add nsw i32 %10, %12, !dbg !97
  %rem15 = srem i32 %add14, 7, !dbg !98
  %13 = load i32, i32* %i, align 4, !dbg !99
  %idxprom16 = sext i32 %13 to i64, !dbg !100
  %arrayidx17 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom16, !dbg !100
  %start_wday18 = getelementptr inbounds %struct.months, %struct.months* %arrayidx17, i32 0, i32 2, !dbg !101
  store i32 %rem15, i32* %start_wday18, align 4, !dbg !102
  br label %for.inc, !dbg !100

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4, !dbg !103
  %inc = add nsw i32 %14, 1, !dbg !103
  store i32 %inc, i32* %i, align 4, !dbg !103
  br label %for.cond, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %for.cond
  %15 = load i32, i32* @width, align 4, !dbg !107
  %add19 = add nsw i32 %15, 2, !dbg !108
  %div20 = sdiv i32 %add19, 22, !dbg !109
  store i32 %div20, i32* @cols, align 4, !dbg !110
  br label %while.cond, !dbg !111

while.cond:                                       ; preds = %while.body, %for.end
  %16 = load i32, i32* @cols, align 4, !dbg !112
  %rem21 = srem i32 12, %16, !dbg !113
  %tobool22 = icmp ne i32 %rem21, 0, !dbg !111
  br i1 %tobool22, label %while.body, label %while.end, !dbg !111

while.body:                                       ; preds = %while.cond
  %17 = load i32, i32* @cols, align 4, !dbg !114
  %dec23 = add nsw i32 %17, -1, !dbg !114
  store i32 %dec23, i32* @cols, align 4, !dbg !114
  br label %while.cond, !dbg !111, !llvm.loop !115

while.end:                                        ; preds = %while.cond
  %18 = load i32, i32* @cols, align 4, !dbg !116
  %sub24 = sub nsw i32 %18, 1, !dbg !117
  %tobool25 = icmp ne i32 %sub24, 0, !dbg !117
  br i1 %tobool25, label %cond.true, label %cond.false, !dbg !116

cond.true:                                        ; preds = %while.end
  %19 = load i32, i32* @width, align 4, !dbg !118
  %20 = load i32, i32* @cols, align 4, !dbg !119
  %mul26 = mul nsw i32 20, %20, !dbg !120
  %sub27 = sub nsw i32 %19, %mul26, !dbg !121
  %21 = load i32, i32* @cols, align 4, !dbg !122
  %sub28 = sub nsw i32 %21, 1, !dbg !123
  %div29 = sdiv i32 %sub27, %sub28, !dbg !124
  br label %cond.end, !dbg !116

cond.false:                                       ; preds = %while.end
  br label %cond.end, !dbg !116

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %div29, %cond.true ], [ 0, %cond.false ], !dbg !116
  store i32 %cond, i32* @gap, align 4, !dbg !125
  %22 = load i32, i32* @gap, align 4, !dbg !126
  %cmp30 = icmp sgt i32 %22, 4, !dbg !128
  br i1 %cmp30, label %if.then31, label %if.end32, !dbg !129

if.then31:                                        ; preds = %cond.end
  store i32 4, i32* @gap, align 4, !dbg !130
  br label %if.end32, !dbg !131

if.end32:                                         ; preds = %if.then31, %cond.end
  %23 = load i32, i32* @width, align 4, !dbg !132
  %24 = load i32, i32* @gap, align 4, !dbg !133
  %add33 = add nsw i32 20, %24, !dbg !134
  %25 = load i32, i32* @cols, align 4, !dbg !135
  %mul34 = mul nsw i32 %add33, %25, !dbg !136
  %sub35 = sub nsw i32 %23, %mul34, !dbg !137
  %26 = load i32, i32* @gap, align 4, !dbg !138
  %add36 = add nsw i32 %sub35, %26, !dbg !139
  %add37 = add nsw i32 %add36, 1, !dbg !140
  %div38 = sdiv i32 %add37, 2, !dbg !141
  store i32 %div38, i32* @lead, align 4, !dbg !142
  %27 = load i32, i32* @year, align 4, !dbg !143
  %inc39 = add nsw i32 %27, 1, !dbg !143
  store i32 %inc39, i32* @year, align 4, !dbg !143
  ret void, !dbg !144
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_row(i32 %row) #0 !dbg !145 {
entry:
  %row.addr = alloca i32, align 4
  %c = alloca i32, align 4
  %i = alloca i32, align 4
  %from = alloca i32, align 4
  %to = alloca i32, align 4
  store i32 %row, i32* %row.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %row.addr, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i32* %c, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata i32* %i, metadata !150, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata i32* %from, metadata !152, metadata !DIExpression()), !dbg !153
  %0 = load i32, i32* %row.addr, align 4, !dbg !154
  %1 = load i32, i32* @cols, align 4, !dbg !155
  %mul = mul nsw i32 %0, %1, !dbg !156
  store i32 %mul, i32* %from, align 4, !dbg !153
  call void @llvm.dbg.declare(metadata i32* %to, metadata !157, metadata !DIExpression()), !dbg !158
  %2 = load i32, i32* %from, align 4, !dbg !159
  %3 = load i32, i32* @cols, align 4, !dbg !160
  %add = add nsw i32 %2, %3, !dbg !161
  store i32 %add, i32* %to, align 4, !dbg !158
  %4 = load i32, i32* @lead, align 4, !dbg !162
  call void @space(i32 %4), !dbg !163
  %5 = load i32, i32* %from, align 4, !dbg !164
  store i32 %5, i32* %c, align 4, !dbg !166
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, i32* %c, align 4, !dbg !168
  %7 = load i32, i32* %to, align 4, !dbg !170
  %cmp = icmp slt i32 %6, %7, !dbg !171
  br i1 %cmp, label %for.body, label %for.end, !dbg !172

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %c, align 4, !dbg !173
  %idxprom = sext i32 %8 to i64, !dbg !175
  %arrayidx = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom, !dbg !175
  %name = getelementptr inbounds %struct.months, %struct.months* %arrayidx, i32 0, i32 0, !dbg !176
  %9 = load i8*, i8** %name, align 8, !dbg !176
  %call = call i64 @strlen(i8* %9) #6, !dbg !177
  %conv = trunc i64 %call to i32, !dbg !177
  store i32 %conv, i32* %i, align 4, !dbg !178
  %10 = load i32, i32* %i, align 4, !dbg !179
  %sub = sub nsw i32 20, %10, !dbg !180
  %div = sdiv i32 %sub, 2, !dbg !181
  call void @space(i32 %div), !dbg !182
  %11 = load i32, i32* %c, align 4, !dbg !183
  %idxprom1 = sext i32 %11 to i64, !dbg !184
  %arrayidx2 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom1, !dbg !184
  %name3 = getelementptr inbounds %struct.months, %struct.months* %arrayidx2, i32 0, i32 0, !dbg !185
  %12 = load i8*, i8** %name3, align 8, !dbg !185
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i64 0, i64 0), i8* %12), !dbg !186
  %13 = load i32, i32* %i, align 4, !dbg !187
  %sub5 = sub nsw i32 20, %13, !dbg !188
  %14 = load i32, i32* %i, align 4, !dbg !189
  %sub6 = sub nsw i32 20, %14, !dbg !190
  %div7 = sdiv i32 %sub6, 2, !dbg !191
  %sub8 = sub nsw i32 %sub5, %div7, !dbg !192
  %15 = load i32, i32* %c, align 4, !dbg !193
  %16 = load i32, i32* %to, align 4, !dbg !194
  %sub9 = sub nsw i32 %16, 1, !dbg !195
  %cmp10 = icmp eq i32 %15, %sub9, !dbg !196
  br i1 %cmp10, label %cond.true, label %cond.false, !dbg !197

cond.true:                                        ; preds = %for.body
  br label %cond.end, !dbg !197

cond.false:                                       ; preds = %for.body
  %17 = load i32, i32* @gap, align 4, !dbg !198
  br label %cond.end, !dbg !197

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %17, %cond.false ], !dbg !197
  %add12 = add nsw i32 %sub8, %cond, !dbg !199
  call void @space(i32 %add12), !dbg !200
  br label %for.inc, !dbg !201

for.inc:                                          ; preds = %cond.end
  %18 = load i32, i32* %c, align 4, !dbg !202
  %inc = add nsw i32 %18, 1, !dbg !202
  store i32 %inc, i32* %c, align 4, !dbg !202
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  %call13 = call i32 @putchar(i32 10), !dbg !206
  %19 = load i32, i32* @lead, align 4, !dbg !207
  call void @space(i32 %19), !dbg !208
  %20 = load i32, i32* %from, align 4, !dbg !209
  store i32 %20, i32* %c, align 4, !dbg !211
  br label %for.cond14, !dbg !212

for.cond14:                                       ; preds = %for.inc35, %for.end
  %21 = load i32, i32* %c, align 4, !dbg !213
  %22 = load i32, i32* %to, align 4, !dbg !215
  %cmp15 = icmp slt i32 %21, %22, !dbg !216
  br i1 %cmp15, label %for.body17, label %for.end37, !dbg !217

for.body17:                                       ; preds = %for.cond14
  store i32 0, i32* %i, align 4, !dbg !218
  br label %for.cond18, !dbg !221

for.cond18:                                       ; preds = %for.inc28, %for.body17
  %23 = load i32, i32* %i, align 4, !dbg !222
  %cmp19 = icmp slt i32 %23, 7, !dbg !224
  br i1 %cmp19, label %for.body21, label %for.end30, !dbg !225

for.body21:                                       ; preds = %for.cond18
  %24 = load i32, i32* %i, align 4, !dbg !226
  %idxprom22 = sext i32 %24 to i64, !dbg !227
  %arrayidx23 = getelementptr inbounds [7 x i8*], [7 x i8*]* @wdays, i64 0, i64 %idxprom22, !dbg !227
  %25 = load i8*, i8** %arrayidx23, align 8, !dbg !227
  %26 = load i32, i32* %i, align 4, !dbg !228
  %cmp24 = icmp eq i32 %26, 6, !dbg !229
  %27 = zext i1 %cmp24 to i64, !dbg !228
  %cond26 = select i1 %cmp24, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.21, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.22, i64 0, i64 0), !dbg !228
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.20, i64 0, i64 0), i8* %25, i8* %cond26), !dbg !230
  br label %for.inc28, !dbg !230

for.inc28:                                        ; preds = %for.body21
  %28 = load i32, i32* %i, align 4, !dbg !231
  %inc29 = add nsw i32 %28, 1, !dbg !231
  store i32 %inc29, i32* %i, align 4, !dbg !231
  br label %for.cond18, !dbg !232, !llvm.loop !233

for.end30:                                        ; preds = %for.cond18
  %29 = load i32, i32* %c, align 4, !dbg !235
  %30 = load i32, i32* %to, align 4, !dbg !237
  %sub31 = sub nsw i32 %30, 1, !dbg !238
  %cmp32 = icmp slt i32 %29, %sub31, !dbg !239
  br i1 %cmp32, label %if.then, label %if.else, !dbg !240

if.then:                                          ; preds = %for.end30
  %31 = load i32, i32* @gap, align 4, !dbg !241
  call void @space(i32 %31), !dbg !242
  br label %if.end, !dbg !242

if.else:                                          ; preds = %for.end30
  %call34 = call i32 @putchar(i32 10), !dbg !243
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc35, !dbg !244

for.inc35:                                        ; preds = %if.end
  %32 = load i32, i32* %c, align 4, !dbg !245
  %inc36 = add nsw i32 %32, 1, !dbg !245
  store i32 %inc36, i32* %c, align 4, !dbg !245
  br label %for.cond14, !dbg !246, !llvm.loop !247

for.end37:                                        ; preds = %for.cond14
  br label %while.body, !dbg !249

while.body:                                       ; preds = %for.end118, %for.end37
  %33 = load i32, i32* %from, align 4, !dbg !250
  store i32 %33, i32* %c, align 4, !dbg !253
  br label %for.cond38, !dbg !254

for.cond38:                                       ; preds = %for.inc50, %while.body
  %34 = load i32, i32* %c, align 4, !dbg !255
  %35 = load i32, i32* %to, align 4, !dbg !257
  %cmp39 = icmp slt i32 %34, %35, !dbg !258
  br i1 %cmp39, label %for.body41, label %for.end52.loopexit, !dbg !259

for.body41:                                       ; preds = %for.cond38
  %36 = load i32, i32* %c, align 4, !dbg !260
  %idxprom42 = sext i32 %36 to i64, !dbg !262
  %arrayidx43 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom42, !dbg !262
  %at = getelementptr inbounds %struct.months, %struct.months* %arrayidx43, i32 0, i32 3, !dbg !263
  %37 = load i32, i32* %at, align 8, !dbg !263
  %38 = load i32, i32* %c, align 4, !dbg !264
  %idxprom44 = sext i32 %38 to i64, !dbg !265
  %arrayidx45 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom44, !dbg !265
  %days = getelementptr inbounds %struct.months, %struct.months* %arrayidx45, i32 0, i32 1, !dbg !266
  %39 = load i32, i32* %days, align 8, !dbg !266
  %cmp46 = icmp slt i32 %37, %39, !dbg !267
  br i1 %cmp46, label %if.then48, label %if.end49, !dbg !268

if.then48:                                        ; preds = %for.body41
  br label %for.end52, !dbg !269

if.end49:                                         ; preds = %for.body41
  br label %for.inc50, !dbg !266

for.inc50:                                        ; preds = %if.end49
  %40 = load i32, i32* %c, align 4, !dbg !270
  %inc51 = add nsw i32 %40, 1, !dbg !270
  store i32 %inc51, i32* %c, align 4, !dbg !270
  br label %for.cond38, !dbg !271, !llvm.loop !272

for.end52.loopexit:                               ; preds = %for.cond38
  br label %for.end52, !dbg !274

for.end52:                                        ; preds = %for.end52.loopexit, %if.then48
  %41 = load i32, i32* %c, align 4, !dbg !274
  %42 = load i32, i32* %to, align 4, !dbg !276
  %cmp53 = icmp eq i32 %41, %42, !dbg !277
  br i1 %cmp53, label %if.then55, label %if.end56, !dbg !278

if.then55:                                        ; preds = %for.end52
  br label %while.end120, !dbg !279

if.end56:                                         ; preds = %for.end52
  %43 = load i32, i32* @lead, align 4, !dbg !280
  call void @space(i32 %43), !dbg !281
  %44 = load i32, i32* %from, align 4, !dbg !282
  store i32 %44, i32* %c, align 4, !dbg !284
  br label %for.cond57, !dbg !285

for.cond57:                                       ; preds = %for.inc116, %if.end56
  %45 = load i32, i32* %c, align 4, !dbg !286
  %46 = load i32, i32* %to, align 4, !dbg !288
  %cmp58 = icmp slt i32 %45, %46, !dbg !289
  br i1 %cmp58, label %for.body60, label %for.end118, !dbg !290

for.body60:                                       ; preds = %for.cond57
  store i32 0, i32* %i, align 4, !dbg !291
  br label %for.cond61, !dbg !294

for.cond61:                                       ; preds = %for.inc67, %for.body60
  %47 = load i32, i32* %i, align 4, !dbg !295
  %48 = load i32, i32* %c, align 4, !dbg !297
  %idxprom62 = sext i32 %48 to i64, !dbg !298
  %arrayidx63 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom62, !dbg !298
  %start_wday = getelementptr inbounds %struct.months, %struct.months* %arrayidx63, i32 0, i32 2, !dbg !299
  %49 = load i32, i32* %start_wday, align 4, !dbg !299
  %cmp64 = icmp slt i32 %47, %49, !dbg !300
  br i1 %cmp64, label %for.body66, label %for.end69, !dbg !301

for.body66:                                       ; preds = %for.cond61
  call void @space(i32 3), !dbg !302
  br label %for.inc67, !dbg !302

for.inc67:                                        ; preds = %for.body66
  %50 = load i32, i32* %i, align 4, !dbg !303
  %inc68 = add nsw i32 %50, 1, !dbg !303
  store i32 %inc68, i32* %i, align 4, !dbg !303
  br label %for.cond61, !dbg !304, !llvm.loop !305

for.end69:                                        ; preds = %for.cond61
  br label %while.cond70, !dbg !307

while.cond70:                                     ; preds = %if.end95, %for.end69
  %51 = load i32, i32* %i, align 4, !dbg !308
  %inc71 = add nsw i32 %51, 1, !dbg !308
  store i32 %inc71, i32* %i, align 4, !dbg !308
  %cmp72 = icmp slt i32 %51, 7, !dbg !309
  br i1 %cmp72, label %land.rhs, label %land.end, !dbg !310

land.rhs:                                         ; preds = %while.cond70
  %52 = load i32, i32* %c, align 4, !dbg !311
  %idxprom74 = sext i32 %52 to i64, !dbg !312
  %arrayidx75 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom74, !dbg !312
  %at76 = getelementptr inbounds %struct.months, %struct.months* %arrayidx75, i32 0, i32 3, !dbg !313
  %53 = load i32, i32* %at76, align 8, !dbg !313
  %54 = load i32, i32* %c, align 4, !dbg !314
  %idxprom77 = sext i32 %54 to i64, !dbg !315
  %arrayidx78 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom77, !dbg !315
  %days79 = getelementptr inbounds %struct.months, %struct.months* %arrayidx78, i32 0, i32 1, !dbg !316
  %55 = load i32, i32* %days79, align 8, !dbg !316
  %cmp80 = icmp slt i32 %53, %55, !dbg !317
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond70
  %56 = phi i1 [ false, %while.cond70 ], [ %cmp80, %land.rhs ], !dbg !318
  br i1 %56, label %while.body82, label %while.end, !dbg !307

while.body82:                                     ; preds = %land.end
  %57 = load i32, i32* %c, align 4, !dbg !319
  %idxprom83 = sext i32 %57 to i64, !dbg !321
  %arrayidx84 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom83, !dbg !321
  %at85 = getelementptr inbounds %struct.months, %struct.months* %arrayidx84, i32 0, i32 3, !dbg !322
  %58 = load i32, i32* %at85, align 8, !dbg !323
  %inc86 = add nsw i32 %58, 1, !dbg !323
  store i32 %inc86, i32* %at85, align 8, !dbg !323
  %call87 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i64 0, i64 0), i32 %inc86), !dbg !324
  %59 = load i32, i32* %i, align 4, !dbg !325
  %cmp88 = icmp slt i32 %59, 7, !dbg !327
  br i1 %cmp88, label %if.then93, label %lor.lhs.false, !dbg !328

lor.lhs.false:                                    ; preds = %while.body82
  %60 = load i32, i32* %c, align 4, !dbg !329
  %61 = load i32, i32* %to, align 4, !dbg !330
  %sub90 = sub nsw i32 %61, 1, !dbg !331
  %cmp91 = icmp slt i32 %60, %sub90, !dbg !332
  br i1 %cmp91, label %if.then93, label %if.end95, !dbg !333

if.then93:                                        ; preds = %lor.lhs.false, %while.body82
  %call94 = call i32 @putchar(i32 32), !dbg !334
  br label %if.end95, !dbg !334

if.end95:                                         ; preds = %if.then93, %lor.lhs.false
  br label %while.cond70, !dbg !307, !llvm.loop !335

while.end:                                        ; preds = %land.end
  br label %while.cond96, !dbg !337

while.cond96:                                     ; preds = %while.body105, %while.end
  %62 = load i32, i32* %i, align 4, !dbg !338
  %inc97 = add nsw i32 %62, 1, !dbg !338
  store i32 %inc97, i32* %i, align 4, !dbg !338
  %cmp98 = icmp sle i32 %62, 7, !dbg !339
  br i1 %cmp98, label %land.rhs100, label %land.end104, !dbg !340

land.rhs100:                                      ; preds = %while.cond96
  %63 = load i32, i32* %c, align 4, !dbg !341
  %64 = load i32, i32* %to, align 4, !dbg !342
  %sub101 = sub nsw i32 %64, 1, !dbg !343
  %cmp102 = icmp slt i32 %63, %sub101, !dbg !344
  br label %land.end104

land.end104:                                      ; preds = %land.rhs100, %while.cond96
  %65 = phi i1 [ false, %while.cond96 ], [ %cmp102, %land.rhs100 ], !dbg !318
  br i1 %65, label %while.body105, label %while.end106, !dbg !337

while.body105:                                    ; preds = %land.end104
  call void @space(i32 3), !dbg !345
  br label %while.cond96, !dbg !337, !llvm.loop !346

while.end106:                                     ; preds = %land.end104
  %66 = load i32, i32* %c, align 4, !dbg !348
  %67 = load i32, i32* %to, align 4, !dbg !350
  %sub107 = sub nsw i32 %67, 1, !dbg !351
  %cmp108 = icmp slt i32 %66, %sub107, !dbg !352
  br i1 %cmp108, label %if.then110, label %if.end112, !dbg !353

if.then110:                                       ; preds = %while.end106
  %68 = load i32, i32* @gap, align 4, !dbg !354
  %sub111 = sub nsw i32 %68, 1, !dbg !355
  call void @space(i32 %sub111), !dbg !356
  br label %if.end112, !dbg !356

if.end112:                                        ; preds = %if.then110, %while.end106
  %69 = load i32, i32* %c, align 4, !dbg !357
  %idxprom113 = sext i32 %69 to i64, !dbg !358
  %arrayidx114 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom113, !dbg !358
  %start_wday115 = getelementptr inbounds %struct.months, %struct.months* %arrayidx114, i32 0, i32 2, !dbg !359
  store i32 0, i32* %start_wday115, align 4, !dbg !360
  br label %for.inc116, !dbg !361

for.inc116:                                       ; preds = %if.end112
  %70 = load i32, i32* %c, align 4, !dbg !362
  %inc117 = add nsw i32 %70, 1, !dbg !362
  store i32 %inc117, i32* %c, align 4, !dbg !362
  br label %for.cond57, !dbg !363, !llvm.loop !364

for.end118:                                       ; preds = %for.cond57
  %call119 = call i32 @putchar(i32 10), !dbg !366
  br label %while.body, !dbg !249, !llvm.loop !367

while.end120:                                     ; preds = %if.then55
  %call121 = call i32 @putchar(i32 10), !dbg !369
  ret void, !dbg !370
}

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #3

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_year() #0 !dbg !371 {
entry:
  %row = alloca i32, align 4
  %buf = alloca [32 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %row, metadata !372, metadata !DIExpression()), !dbg !373
  call void @llvm.dbg.declare(metadata [32 x i8]* %buf, metadata !374, metadata !DIExpression()), !dbg !378
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i64 0, i64 0, !dbg !379
  %0 = load i32, i32* @year, align 4, !dbg !380
  %call = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.24, i64 0, i64 0), i32 %0) #7, !dbg !381
  %1 = load i32, i32* @width, align 4, !dbg !382
  %conv = sext i32 %1 to i64, !dbg !382
  %arraydecay1 = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i64 0, i64 0, !dbg !383
  %call2 = call i64 @strlen(i8* %arraydecay1) #6, !dbg !384
  %sub = sub i64 %conv, %call2, !dbg !385
  %div = udiv i64 %sub, 2, !dbg !386
  %conv3 = trunc i64 %div to i32, !dbg !387
  call void @space(i32 %conv3), !dbg !388
  %arraydecay4 = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i64 0, i64 0, !dbg !389
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i64 0, i64 0), i8* %arraydecay4), !dbg !390
  store i32 0, i32* %row, align 4, !dbg !391
  br label %for.cond, !dbg !393

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %row, align 4, !dbg !394
  %3 = load i32, i32* @cols, align 4, !dbg !396
  %mul = mul nsw i32 %2, %3, !dbg !397
  %cmp = icmp slt i32 %mul, 12, !dbg !398
  br i1 %cmp, label %for.body, label %for.end, !dbg !399

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %row, align 4, !dbg !400
  call void @print_row(i32 %4), !dbg !401
  br label %for.inc, !dbg !401

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %row, align 4, !dbg !402
  %inc = add nsw i32 %5, 1, !dbg !402
  store i32 %inc, i32* %row, align 4, !dbg !402
  br label %for.cond, !dbg !403, !llvm.loop !404

for.end:                                          ; preds = %for.cond
  ret void, !dbg !406
}

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8*, i8*, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !407 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %v.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %year_set = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !412, metadata !DIExpression()), !dbg !413
  store i8** %v, i8*** %v.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %v.addr, metadata !414, metadata !DIExpression()), !dbg !415
  call void @llvm.dbg.declare(metadata i32* %i, metadata !416, metadata !DIExpression()), !dbg !417
  call void @llvm.dbg.declare(metadata i32* %year_set, metadata !418, metadata !DIExpression()), !dbg !419
  store i32 0, i32* %year_set, align 4, !dbg !419
  store i32 1, i32* %i, align 4, !dbg !420
  br label %for.cond, !dbg !422

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !423
  %1 = load i32, i32* %c.addr, align 4, !dbg !425
  %cmp = icmp slt i32 %0, %1, !dbg !426
  br i1 %cmp, label %for.body, label %for.end, !dbg !427

for.body:                                         ; preds = %for.cond
  %2 = load i8**, i8*** %v.addr, align 8, !dbg !428
  %3 = load i32, i32* %i, align 4, !dbg !431
  %idxprom = sext i32 %3 to i64, !dbg !428
  %arrayidx = getelementptr inbounds i8*, i8** %2, i64 %idxprom, !dbg !428
  %4 = load i8*, i8** %arrayidx, align 8, !dbg !428
  %call = call i32 @strcmp(i8* %4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.26, i64 0, i64 0)) #6, !dbg !432
  %tobool = icmp ne i32 %call, 0, !dbg !432
  br i1 %tobool, label %if.else, label %if.then, !dbg !433

if.then:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !434
  %inc = add nsw i32 %5, 1, !dbg !434
  store i32 %inc, i32* %i, align 4, !dbg !434
  %6 = load i32, i32* %c.addr, align 4, !dbg !437
  %cmp1 = icmp eq i32 %inc, %6, !dbg !438
  br i1 %cmp1, label %if.then6, label %lor.lhs.false, !dbg !439

lor.lhs.false:                                    ; preds = %if.then
  %7 = load i8**, i8*** %v.addr, align 8, !dbg !440
  %8 = load i32, i32* %i, align 4, !dbg !441
  %idxprom2 = sext i32 %8 to i64, !dbg !440
  %arrayidx3 = getelementptr inbounds i8*, i8** %7, i64 %idxprom2, !dbg !440
  %9 = load i8*, i8** %arrayidx3, align 8, !dbg !440
  %call4 = call i32 @atoi(i8* %9) #6, !dbg !442
  store i32 %call4, i32* @width, align 4, !dbg !443
  %cmp5 = icmp slt i32 %call4, 20, !dbg !444
  br i1 %cmp5, label %if.then6, label %if.end, !dbg !445

if.then6:                                         ; preds = %lor.lhs.false, %if.then
  br label %bail, !dbg !446

if.end:                                           ; preds = %lor.lhs.false
  br label %if.end19, !dbg !447

if.else:                                          ; preds = %for.body
  %10 = load i32, i32* %year_set, align 4, !dbg !448
  %tobool7 = icmp ne i32 %10, 0, !dbg !448
  br i1 %tobool7, label %if.else17, label %if.then8, !dbg !450

if.then8:                                         ; preds = %if.else
  %11 = load i8**, i8*** %v.addr, align 8, !dbg !451
  %12 = load i32, i32* %i, align 4, !dbg !454
  %idxprom9 = sext i32 %12 to i64, !dbg !451
  %arrayidx10 = getelementptr inbounds i8*, i8** %11, i64 %idxprom9, !dbg !451
  %13 = load i8*, i8** %arrayidx10, align 8, !dbg !451
  %call11 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %13, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.24, i64 0, i64 0), i32* @year) #7, !dbg !455
  %tobool12 = icmp ne i32 %call11, 0, !dbg !455
  br i1 %tobool12, label %lor.lhs.false13, label %if.then15, !dbg !456

lor.lhs.false13:                                  ; preds = %if.then8
  %14 = load i32, i32* @year, align 4, !dbg !457
  %cmp14 = icmp sle i32 %14, 0, !dbg !458
  br i1 %cmp14, label %if.then15, label %if.end16, !dbg !459

if.then15:                                        ; preds = %lor.lhs.false13, %if.then8
  store i32 1969, i32* @year, align 4, !dbg !460
  br label %if.end16, !dbg !461

if.end16:                                         ; preds = %if.then15, %lor.lhs.false13
  store i32 1, i32* %year_set, align 4, !dbg !462
  br label %if.end18, !dbg !463

if.else17:                                        ; preds = %if.else
  br label %bail, !dbg !464

if.end18:                                         ; preds = %if.end16
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %if.end
  br label %for.inc, !dbg !465

for.inc:                                          ; preds = %if.end19
  %15 = load i32, i32* %i, align 4, !dbg !466
  %inc20 = add nsw i32 %15, 1, !dbg !466
  store i32 %inc20, i32* %i, align 4, !dbg !466
  br label %for.cond, !dbg !467, !llvm.loop !468

for.end:                                          ; preds = %for.cond
  call void @init_months(), !dbg !470
  call void @print_year(), !dbg !471
  ret i32 0, !dbg !472

bail:                                             ; preds = %if.else17, %if.then6
  call void @llvm.dbg.label(metadata !473), !dbg !474
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !475
  %17 = load i8**, i8*** %v.addr, align 8, !dbg !476
  %arrayidx21 = getelementptr inbounds i8*, i8** %17, i64 0, !dbg !476
  %18 = load i8*, i8** %arrayidx21, align 8, !dbg !476
  %call22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.27, i64 0, i64 0), i8* %18), !dbg !477
  call void @exit(i32 1) #8, !dbg !478
  unreachable, !dbg !478
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
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
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
!37 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!59 = !DILocation(line: 33, column: 23, scope: !56)
!60 = !DILocation(line: 33, column: 28, scope: !56)
!61 = !DILocation(line: 33, column: 36, scope: !56)
!62 = !DILocation(line: 33, column: 41, scope: !56)
!63 = !DILocation(line: 33, column: 46, scope: !56)
!64 = !DILocation(line: 33, column: 6, scope: !50)
!65 = !DILocation(line: 34, column: 18, scope: !56)
!66 = !DILocation(line: 34, column: 3, scope: !56)
!67 = !DILocation(line: 36, column: 6, scope: !50)
!68 = !DILocation(line: 38, column: 6, scope: !50)
!69 = !DILocation(line: 38, column: 11, scope: !50)
!70 = !DILocation(line: 38, column: 19, scope: !50)
!71 = !DILocation(line: 38, column: 23, scope: !50)
!72 = !DILocation(line: 38, column: 17, scope: !50)
!73 = !DILocation(line: 38, column: 28, scope: !50)
!74 = !DILocation(line: 38, column: 32, scope: !50)
!75 = !DILocation(line: 38, column: 26, scope: !50)
!76 = !DILocation(line: 38, column: 39, scope: !50)
!77 = !DILocation(line: 38, column: 43, scope: !50)
!78 = !DILocation(line: 38, column: 37, scope: !50)
!79 = !DILocation(line: 38, column: 48, scope: !50)
!80 = !DILocation(line: 38, column: 53, scope: !50)
!81 = !DILocation(line: 38, column: 3, scope: !50)
!82 = !DILocation(line: 40, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !50, file: !3, line: 40, column: 2)
!84 = !DILocation(line: 40, column: 7, scope: !83)
!85 = !DILocation(line: 40, column: 14, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !3, line: 40, column: 2)
!87 = !DILocation(line: 40, column: 16, scope: !86)
!88 = !DILocation(line: 40, column: 2, scope: !83)
!89 = !DILocation(line: 42, column: 12, scope: !86)
!90 = !DILocation(line: 42, column: 13, scope: !86)
!91 = !DILocation(line: 42, column: 5, scope: !86)
!92 = !DILocation(line: 42, column: 17, scope: !86)
!93 = !DILocation(line: 42, column: 37, scope: !86)
!94 = !DILocation(line: 42, column: 38, scope: !86)
!95 = !DILocation(line: 42, column: 30, scope: !86)
!96 = !DILocation(line: 42, column: 42, scope: !86)
!97 = !DILocation(line: 42, column: 28, scope: !86)
!98 = !DILocation(line: 42, column: 48, scope: !86)
!99 = !DILocation(line: 41, column: 10, scope: !86)
!100 = !DILocation(line: 41, column: 3, scope: !86)
!101 = !DILocation(line: 41, column: 13, scope: !86)
!102 = !DILocation(line: 41, column: 24, scope: !86)
!103 = !DILocation(line: 40, column: 23, scope: !86)
!104 = !DILocation(line: 40, column: 2, scope: !86)
!105 = distinct !{!105, !88, !106}
!106 = !DILocation(line: 42, column: 50, scope: !83)
!107 = !DILocation(line: 44, column: 10, scope: !50)
!108 = !DILocation(line: 44, column: 16, scope: !50)
!109 = !DILocation(line: 44, column: 21, scope: !50)
!110 = !DILocation(line: 44, column: 7, scope: !50)
!111 = !DILocation(line: 45, column: 2, scope: !50)
!112 = !DILocation(line: 45, column: 14, scope: !50)
!113 = !DILocation(line: 45, column: 12, scope: !50)
!114 = !DILocation(line: 45, column: 24, scope: !50)
!115 = distinct !{!115, !111, !114}
!116 = !DILocation(line: 46, column: 8, scope: !50)
!117 = !DILocation(line: 46, column: 13, scope: !50)
!118 = !DILocation(line: 46, column: 20, scope: !50)
!119 = !DILocation(line: 46, column: 33, scope: !50)
!120 = !DILocation(line: 46, column: 31, scope: !50)
!121 = !DILocation(line: 46, column: 26, scope: !50)
!122 = !DILocation(line: 46, column: 42, scope: !50)
!123 = !DILocation(line: 46, column: 47, scope: !50)
!124 = !DILocation(line: 46, column: 39, scope: !50)
!125 = !DILocation(line: 46, column: 6, scope: !50)
!126 = !DILocation(line: 47, column: 6, scope: !127)
!127 = distinct !DILexicalBlock(scope: !50, file: !3, line: 47, column: 6)
!128 = !DILocation(line: 47, column: 10, scope: !127)
!129 = !DILocation(line: 47, column: 6, scope: !50)
!130 = !DILocation(line: 47, column: 19, scope: !127)
!131 = !DILocation(line: 47, column: 15, scope: !127)
!132 = !DILocation(line: 48, column: 10, scope: !50)
!133 = !DILocation(line: 48, column: 24, scope: !50)
!134 = !DILocation(line: 48, column: 22, scope: !50)
!135 = !DILocation(line: 48, column: 31, scope: !50)
!136 = !DILocation(line: 48, column: 29, scope: !50)
!137 = !DILocation(line: 48, column: 16, scope: !50)
!138 = !DILocation(line: 48, column: 38, scope: !50)
!139 = !DILocation(line: 48, column: 36, scope: !50)
!140 = !DILocation(line: 48, column: 42, scope: !50)
!141 = !DILocation(line: 48, column: 47, scope: !50)
!142 = !DILocation(line: 48, column: 7, scope: !50)
!143 = !DILocation(line: 49, column: 13, scope: !50)
!144 = !DILocation(line: 50, column: 1, scope: !50)
!145 = distinct !DISubprogram(name: "print_row", scope: !3, file: !3, line: 52, type: !39, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!146 = !DILocalVariable(name: "row", arg: 1, scope: !145, file: !3, line: 52, type: !8)
!147 = !DILocation(line: 52, column: 20, scope: !145)
!148 = !DILocalVariable(name: "c", scope: !145, file: !3, line: 54, type: !8)
!149 = !DILocation(line: 54, column: 6, scope: !145)
!150 = !DILocalVariable(name: "i", scope: !145, file: !3, line: 54, type: !8)
!151 = !DILocation(line: 54, column: 9, scope: !145)
!152 = !DILocalVariable(name: "from", scope: !145, file: !3, line: 54, type: !8)
!153 = !DILocation(line: 54, column: 12, scope: !145)
!154 = !DILocation(line: 54, column: 19, scope: !145)
!155 = !DILocation(line: 54, column: 25, scope: !145)
!156 = !DILocation(line: 54, column: 23, scope: !145)
!157 = !DILocalVariable(name: "to", scope: !145, file: !3, line: 54, type: !8)
!158 = !DILocation(line: 54, column: 31, scope: !145)
!159 = !DILocation(line: 54, column: 36, scope: !145)
!160 = !DILocation(line: 54, column: 43, scope: !145)
!161 = !DILocation(line: 54, column: 41, scope: !145)
!162 = !DILocation(line: 55, column: 8, scope: !145)
!163 = !DILocation(line: 55, column: 2, scope: !145)
!164 = !DILocation(line: 56, column: 11, scope: !165)
!165 = distinct !DILexicalBlock(scope: !145, file: !3, line: 56, column: 2)
!166 = !DILocation(line: 56, column: 9, scope: !165)
!167 = !DILocation(line: 56, column: 7, scope: !165)
!168 = !DILocation(line: 56, column: 17, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !3, line: 56, column: 2)
!170 = !DILocation(line: 56, column: 21, scope: !169)
!171 = !DILocation(line: 56, column: 19, scope: !169)
!172 = !DILocation(line: 56, column: 2, scope: !165)
!173 = !DILocation(line: 57, column: 21, scope: !174)
!174 = distinct !DILexicalBlock(scope: !169, file: !3, line: 56, column: 30)
!175 = !DILocation(line: 57, column: 14, scope: !174)
!176 = !DILocation(line: 57, column: 24, scope: !174)
!177 = !DILocation(line: 57, column: 7, scope: !174)
!178 = !DILocation(line: 57, column: 5, scope: !174)
!179 = !DILocation(line: 58, column: 15, scope: !174)
!180 = !DILocation(line: 58, column: 13, scope: !174)
!181 = !DILocation(line: 58, column: 17, scope: !174)
!182 = !DILocation(line: 58, column: 3, scope: !174)
!183 = !DILocation(line: 59, column: 23, scope: !174)
!184 = !DILocation(line: 59, column: 16, scope: !174)
!185 = !DILocation(line: 59, column: 26, scope: !174)
!186 = !DILocation(line: 59, column: 3, scope: !174)
!187 = !DILocation(line: 60, column: 14, scope: !174)
!188 = !DILocation(line: 60, column: 12, scope: !174)
!189 = !DILocation(line: 60, column: 24, scope: !174)
!190 = !DILocation(line: 60, column: 22, scope: !174)
!191 = !DILocation(line: 60, column: 26, scope: !174)
!192 = !DILocation(line: 60, column: 16, scope: !174)
!193 = !DILocation(line: 60, column: 33, scope: !174)
!194 = !DILocation(line: 60, column: 38, scope: !174)
!195 = !DILocation(line: 60, column: 41, scope: !174)
!196 = !DILocation(line: 60, column: 35, scope: !174)
!197 = !DILocation(line: 60, column: 32, scope: !174)
!198 = !DILocation(line: 60, column: 52, scope: !174)
!199 = !DILocation(line: 60, column: 29, scope: !174)
!200 = !DILocation(line: 60, column: 3, scope: !174)
!201 = !DILocation(line: 61, column: 2, scope: !174)
!202 = !DILocation(line: 56, column: 26, scope: !169)
!203 = !DILocation(line: 56, column: 2, scope: !169)
!204 = distinct !{!204, !172, !205}
!205 = !DILocation(line: 61, column: 2, scope: !165)
!206 = !DILocation(line: 62, column: 2, scope: !145)
!207 = !DILocation(line: 64, column: 8, scope: !145)
!208 = !DILocation(line: 64, column: 2, scope: !145)
!209 = !DILocation(line: 65, column: 11, scope: !210)
!210 = distinct !DILexicalBlock(scope: !145, file: !3, line: 65, column: 2)
!211 = !DILocation(line: 65, column: 9, scope: !210)
!212 = !DILocation(line: 65, column: 7, scope: !210)
!213 = !DILocation(line: 65, column: 17, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !3, line: 65, column: 2)
!215 = !DILocation(line: 65, column: 21, scope: !214)
!216 = !DILocation(line: 65, column: 19, scope: !214)
!217 = !DILocation(line: 65, column: 2, scope: !210)
!218 = !DILocation(line: 66, column: 10, scope: !219)
!219 = distinct !DILexicalBlock(scope: !220, file: !3, line: 66, column: 3)
!220 = distinct !DILexicalBlock(scope: !214, file: !3, line: 65, column: 30)
!221 = !DILocation(line: 66, column: 8, scope: !219)
!222 = !DILocation(line: 66, column: 15, scope: !223)
!223 = distinct !DILexicalBlock(scope: !219, file: !3, line: 66, column: 3)
!224 = !DILocation(line: 66, column: 17, scope: !223)
!225 = !DILocation(line: 66, column: 3, scope: !219)
!226 = !DILocation(line: 67, column: 25, scope: !223)
!227 = !DILocation(line: 67, column: 19, scope: !223)
!228 = !DILocation(line: 67, column: 29, scope: !223)
!229 = !DILocation(line: 67, column: 31, scope: !223)
!230 = !DILocation(line: 67, column: 4, scope: !223)
!231 = !DILocation(line: 66, column: 23, scope: !223)
!232 = !DILocation(line: 66, column: 3, scope: !223)
!233 = distinct !{!233, !225, !234}
!234 = !DILocation(line: 67, column: 46, scope: !219)
!235 = !DILocation(line: 68, column: 7, scope: !236)
!236 = distinct !DILexicalBlock(scope: !220, file: !3, line: 68, column: 7)
!237 = !DILocation(line: 68, column: 11, scope: !236)
!238 = !DILocation(line: 68, column: 14, scope: !236)
!239 = !DILocation(line: 68, column: 9, scope: !236)
!240 = !DILocation(line: 68, column: 7, scope: !220)
!241 = !DILocation(line: 68, column: 25, scope: !236)
!242 = !DILocation(line: 68, column: 19, scope: !236)
!243 = !DILocation(line: 69, column: 8, scope: !236)
!244 = !DILocation(line: 70, column: 2, scope: !220)
!245 = !DILocation(line: 65, column: 26, scope: !214)
!246 = !DILocation(line: 65, column: 2, scope: !214)
!247 = distinct !{!247, !217, !248}
!248 = !DILocation(line: 70, column: 2, scope: !210)
!249 = !DILocation(line: 72, column: 2, scope: !145)
!250 = !DILocation(line: 73, column: 12, scope: !251)
!251 = distinct !DILexicalBlock(scope: !252, file: !3, line: 73, column: 3)
!252 = distinct !DILexicalBlock(scope: !145, file: !3, line: 72, column: 12)
!253 = !DILocation(line: 73, column: 10, scope: !251)
!254 = !DILocation(line: 73, column: 8, scope: !251)
!255 = !DILocation(line: 73, column: 18, scope: !256)
!256 = distinct !DILexicalBlock(scope: !251, file: !3, line: 73, column: 3)
!257 = !DILocation(line: 73, column: 22, scope: !256)
!258 = !DILocation(line: 73, column: 20, scope: !256)
!259 = !DILocation(line: 73, column: 3, scope: !251)
!260 = !DILocation(line: 74, column: 15, scope: !261)
!261 = distinct !DILexicalBlock(scope: !256, file: !3, line: 74, column: 8)
!262 = !DILocation(line: 74, column: 8, scope: !261)
!263 = !DILocation(line: 74, column: 18, scope: !261)
!264 = !DILocation(line: 74, column: 30, scope: !261)
!265 = !DILocation(line: 74, column: 23, scope: !261)
!266 = !DILocation(line: 74, column: 33, scope: !261)
!267 = !DILocation(line: 74, column: 21, scope: !261)
!268 = !DILocation(line: 74, column: 8, scope: !256)
!269 = !DILocation(line: 74, column: 39, scope: !261)
!270 = !DILocation(line: 73, column: 27, scope: !256)
!271 = !DILocation(line: 73, column: 3, scope: !256)
!272 = distinct !{!272, !259, !273}
!273 = !DILocation(line: 74, column: 39, scope: !251)
!274 = !DILocation(line: 75, column: 7, scope: !275)
!275 = distinct !DILexicalBlock(scope: !252, file: !3, line: 75, column: 7)
!276 = !DILocation(line: 75, column: 12, scope: !275)
!277 = !DILocation(line: 75, column: 9, scope: !275)
!278 = !DILocation(line: 75, column: 7, scope: !252)
!279 = !DILocation(line: 75, column: 16, scope: !275)
!280 = !DILocation(line: 77, column: 9, scope: !252)
!281 = !DILocation(line: 77, column: 3, scope: !252)
!282 = !DILocation(line: 78, column: 12, scope: !283)
!283 = distinct !DILexicalBlock(scope: !252, file: !3, line: 78, column: 3)
!284 = !DILocation(line: 78, column: 10, scope: !283)
!285 = !DILocation(line: 78, column: 8, scope: !283)
!286 = !DILocation(line: 78, column: 18, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !3, line: 78, column: 3)
!288 = !DILocation(line: 78, column: 22, scope: !287)
!289 = !DILocation(line: 78, column: 20, scope: !287)
!290 = !DILocation(line: 78, column: 3, scope: !283)
!291 = !DILocation(line: 79, column: 11, scope: !292)
!292 = distinct !DILexicalBlock(scope: !293, file: !3, line: 79, column: 4)
!293 = distinct !DILexicalBlock(scope: !287, file: !3, line: 78, column: 31)
!294 = !DILocation(line: 79, column: 9, scope: !292)
!295 = !DILocation(line: 79, column: 16, scope: !296)
!296 = distinct !DILexicalBlock(scope: !292, file: !3, line: 79, column: 4)
!297 = !DILocation(line: 79, column: 27, scope: !296)
!298 = !DILocation(line: 79, column: 20, scope: !296)
!299 = !DILocation(line: 79, column: 30, scope: !296)
!300 = !DILocation(line: 79, column: 18, scope: !296)
!301 = !DILocation(line: 79, column: 4, scope: !292)
!302 = !DILocation(line: 79, column: 47, scope: !296)
!303 = !DILocation(line: 79, column: 43, scope: !296)
!304 = !DILocation(line: 79, column: 4, scope: !296)
!305 = distinct !{!305, !301, !306}
!306 = !DILocation(line: 79, column: 54, scope: !292)
!307 = !DILocation(line: 80, column: 4, scope: !293)
!308 = !DILocation(line: 80, column: 11, scope: !293)
!309 = !DILocation(line: 80, column: 14, scope: !293)
!310 = !DILocation(line: 80, column: 18, scope: !293)
!311 = !DILocation(line: 80, column: 28, scope: !293)
!312 = !DILocation(line: 80, column: 21, scope: !293)
!313 = !DILocation(line: 80, column: 31, scope: !293)
!314 = !DILocation(line: 80, column: 43, scope: !293)
!315 = !DILocation(line: 80, column: 36, scope: !293)
!316 = !DILocation(line: 80, column: 46, scope: !293)
!317 = !DILocation(line: 80, column: 34, scope: !293)
!318 = !DILocation(line: 0, scope: !293)
!319 = !DILocation(line: 81, column: 28, scope: !320)
!320 = distinct !DILexicalBlock(scope: !293, file: !3, line: 80, column: 52)
!321 = !DILocation(line: 81, column: 21, scope: !320)
!322 = !DILocation(line: 81, column: 31, scope: !320)
!323 = !DILocation(line: 81, column: 19, scope: !320)
!324 = !DILocation(line: 81, column: 5, scope: !320)
!325 = !DILocation(line: 82, column: 9, scope: !326)
!326 = distinct !DILexicalBlock(scope: !320, file: !3, line: 82, column: 9)
!327 = !DILocation(line: 82, column: 11, scope: !326)
!328 = !DILocation(line: 82, column: 15, scope: !326)
!329 = !DILocation(line: 82, column: 18, scope: !326)
!330 = !DILocation(line: 82, column: 22, scope: !326)
!331 = !DILocation(line: 82, column: 25, scope: !326)
!332 = !DILocation(line: 82, column: 20, scope: !326)
!333 = !DILocation(line: 82, column: 9, scope: !320)
!334 = !DILocation(line: 82, column: 30, scope: !326)
!335 = distinct !{!335, !307, !336}
!336 = !DILocation(line: 83, column: 4, scope: !293)
!337 = !DILocation(line: 84, column: 4, scope: !293)
!338 = !DILocation(line: 84, column: 12, scope: !293)
!339 = !DILocation(line: 84, column: 15, scope: !293)
!340 = !DILocation(line: 84, column: 20, scope: !293)
!341 = !DILocation(line: 84, column: 23, scope: !293)
!342 = !DILocation(line: 84, column: 27, scope: !293)
!343 = !DILocation(line: 84, column: 30, scope: !293)
!344 = !DILocation(line: 84, column: 25, scope: !293)
!345 = !DILocation(line: 84, column: 35, scope: !293)
!346 = distinct !{!346, !337, !347}
!347 = !DILocation(line: 84, column: 42, scope: !293)
!348 = !DILocation(line: 85, column: 8, scope: !349)
!349 = distinct !DILexicalBlock(scope: !293, file: !3, line: 85, column: 8)
!350 = !DILocation(line: 85, column: 12, scope: !349)
!351 = !DILocation(line: 85, column: 15, scope: !349)
!352 = !DILocation(line: 85, column: 10, scope: !349)
!353 = !DILocation(line: 85, column: 8, scope: !293)
!354 = !DILocation(line: 85, column: 26, scope: !349)
!355 = !DILocation(line: 85, column: 30, scope: !349)
!356 = !DILocation(line: 85, column: 20, scope: !349)
!357 = !DILocation(line: 86, column: 11, scope: !293)
!358 = !DILocation(line: 86, column: 4, scope: !293)
!359 = !DILocation(line: 86, column: 14, scope: !293)
!360 = !DILocation(line: 86, column: 25, scope: !293)
!361 = !DILocation(line: 87, column: 3, scope: !293)
!362 = !DILocation(line: 78, column: 27, scope: !287)
!363 = !DILocation(line: 78, column: 3, scope: !287)
!364 = distinct !{!364, !290, !365}
!365 = !DILocation(line: 87, column: 3, scope: !283)
!366 = !DILocation(line: 88, column: 3, scope: !252)
!367 = distinct !{!367, !249, !368}
!368 = !DILocation(line: 89, column: 2, scope: !145)
!369 = !DILocation(line: 90, column: 2, scope: !145)
!370 = !DILocation(line: 91, column: 1, scope: !145)
!371 = distinct !DISubprogram(name: "print_year", scope: !3, file: !3, line: 93, type: !51, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!372 = !DILocalVariable(name: "row", scope: !371, file: !3, line: 95, type: !8)
!373 = !DILocation(line: 95, column: 6, scope: !371)
!374 = !DILocalVariable(name: "buf", scope: !371, file: !3, line: 96, type: !375)
!375 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 256, elements: !376)
!376 = !{!377}
!377 = !DISubrange(count: 32)
!378 = !DILocation(line: 96, column: 7, scope: !371)
!379 = !DILocation(line: 97, column: 10, scope: !371)
!380 = !DILocation(line: 97, column: 21, scope: !371)
!381 = !DILocation(line: 97, column: 2, scope: !371)
!382 = !DILocation(line: 98, column: 9, scope: !371)
!383 = !DILocation(line: 98, column: 24, scope: !371)
!384 = !DILocation(line: 98, column: 17, scope: !371)
!385 = !DILocation(line: 98, column: 15, scope: !371)
!386 = !DILocation(line: 98, column: 30, scope: !371)
!387 = !DILocation(line: 98, column: 8, scope: !371)
!388 = !DILocation(line: 98, column: 2, scope: !371)
!389 = !DILocation(line: 99, column: 19, scope: !371)
!390 = !DILocation(line: 99, column: 2, scope: !371)
!391 = !DILocation(line: 100, column: 11, scope: !392)
!392 = distinct !DILexicalBlock(scope: !371, file: !3, line: 100, column: 2)
!393 = !DILocation(line: 100, column: 7, scope: !392)
!394 = !DILocation(line: 100, column: 16, scope: !395)
!395 = distinct !DILexicalBlock(scope: !392, file: !3, line: 100, column: 2)
!396 = !DILocation(line: 100, column: 22, scope: !395)
!397 = !DILocation(line: 100, column: 20, scope: !395)
!398 = !DILocation(line: 100, column: 27, scope: !395)
!399 = !DILocation(line: 100, column: 2, scope: !392)
!400 = !DILocation(line: 101, column: 13, scope: !395)
!401 = !DILocation(line: 101, column: 3, scope: !395)
!402 = !DILocation(line: 100, column: 36, scope: !395)
!403 = !DILocation(line: 100, column: 2, scope: !395)
!404 = distinct !{!404, !399, !405}
!405 = !DILocation(line: 101, column: 16, scope: !392)
!406 = !DILocation(line: 102, column: 1, scope: !371)
!407 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 104, type: !408, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!408 = !DISubroutineType(types: !409)
!409 = !{!8, !8, !410}
!410 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !411, size: 64)
!411 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!412 = !DILocalVariable(name: "c", arg: 1, scope: !407, file: !3, line: 104, type: !8)
!413 = !DILocation(line: 104, column: 14, scope: !407)
!414 = !DILocalVariable(name: "v", arg: 2, scope: !407, file: !3, line: 104, type: !410)
!415 = !DILocation(line: 104, column: 24, scope: !407)
!416 = !DILocalVariable(name: "i", scope: !407, file: !3, line: 106, type: !8)
!417 = !DILocation(line: 106, column: 6, scope: !407)
!418 = !DILocalVariable(name: "year_set", scope: !407, file: !3, line: 106, type: !8)
!419 = !DILocation(line: 106, column: 9, scope: !407)
!420 = !DILocation(line: 107, column: 9, scope: !421)
!421 = distinct !DILexicalBlock(scope: !407, file: !3, line: 107, column: 2)
!422 = !DILocation(line: 107, column: 7, scope: !421)
!423 = !DILocation(line: 107, column: 14, scope: !424)
!424 = distinct !DILexicalBlock(scope: !421, file: !3, line: 107, column: 2)
!425 = !DILocation(line: 107, column: 18, scope: !424)
!426 = !DILocation(line: 107, column: 16, scope: !424)
!427 = !DILocation(line: 107, column: 2, scope: !421)
!428 = !DILocation(line: 108, column: 15, scope: !429)
!429 = distinct !DILexicalBlock(scope: !430, file: !3, line: 108, column: 7)
!430 = distinct !DILexicalBlock(scope: !424, file: !3, line: 107, column: 26)
!431 = !DILocation(line: 108, column: 17, scope: !429)
!432 = !DILocation(line: 108, column: 8, scope: !429)
!433 = !DILocation(line: 108, column: 7, scope: !430)
!434 = !DILocation(line: 109, column: 8, scope: !435)
!435 = distinct !DILexicalBlock(scope: !436, file: !3, line: 109, column: 8)
!436 = distinct !DILexicalBlock(scope: !429, file: !3, line: 108, column: 28)
!437 = !DILocation(line: 109, column: 15, scope: !435)
!438 = !DILocation(line: 109, column: 12, scope: !435)
!439 = !DILocation(line: 109, column: 17, scope: !435)
!440 = !DILocation(line: 109, column: 34, scope: !435)
!441 = !DILocation(line: 109, column: 36, scope: !435)
!442 = !DILocation(line: 109, column: 29, scope: !435)
!443 = !DILocation(line: 109, column: 27, scope: !435)
!444 = !DILocation(line: 109, column: 41, scope: !435)
!445 = !DILocation(line: 109, column: 8, scope: !436)
!446 = !DILocation(line: 110, column: 5, scope: !435)
!447 = !DILocation(line: 111, column: 3, scope: !436)
!448 = !DILocation(line: 111, column: 15, scope: !449)
!449 = distinct !DILexicalBlock(scope: !429, file: !3, line: 111, column: 14)
!450 = !DILocation(line: 111, column: 14, scope: !429)
!451 = !DILocation(line: 112, column: 16, scope: !452)
!452 = distinct !DILexicalBlock(scope: !453, file: !3, line: 112, column: 8)
!453 = distinct !DILexicalBlock(scope: !449, file: !3, line: 111, column: 25)
!454 = !DILocation(line: 112, column: 18, scope: !452)
!455 = !DILocation(line: 112, column: 9, scope: !452)
!456 = !DILocation(line: 112, column: 35, scope: !452)
!457 = !DILocation(line: 112, column: 38, scope: !452)
!458 = !DILocation(line: 112, column: 43, scope: !452)
!459 = !DILocation(line: 112, column: 8, scope: !453)
!460 = !DILocation(line: 113, column: 10, scope: !452)
!461 = !DILocation(line: 113, column: 5, scope: !452)
!462 = !DILocation(line: 114, column: 13, scope: !453)
!463 = !DILocation(line: 115, column: 3, scope: !453)
!464 = !DILocation(line: 116, column: 4, scope: !449)
!465 = !DILocation(line: 117, column: 2, scope: !430)
!466 = !DILocation(line: 107, column: 22, scope: !424)
!467 = !DILocation(line: 107, column: 2, scope: !424)
!468 = distinct !{!468, !427, !469}
!469 = !DILocation(line: 117, column: 2, scope: !421)
!470 = !DILocation(line: 119, column: 2, scope: !407)
!471 = !DILocation(line: 120, column: 2, scope: !407)
!472 = !DILocation(line: 121, column: 2, scope: !407)
!473 = !DILabel(scope: !407, name: "bail", file: !3, line: 123)
!474 = !DILocation(line: 123, column: 1, scope: !407)
!475 = !DILocation(line: 123, column: 15, scope: !407)
!476 = !DILocation(line: 123, column: 72, scope: !407)
!477 = !DILocation(line: 123, column: 7, scope: !407)
!478 = !DILocation(line: 124, column: 2, scope: !407)
