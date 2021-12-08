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
  call void @llvm.dbg.value(metadata i32 %n, metadata !41, metadata !DIExpression()), !dbg !42
  br label %while.cond, !dbg !43

while.cond:                                       ; preds = %while.body, %entry
  %n.addr.0 = phi i32 [ %n, %entry ], [ %dec, %while.body ]
  call void @llvm.dbg.value(metadata i32 %n.addr.0, metadata !41, metadata !DIExpression()), !dbg !42
  %dec = add nsw i32 %n.addr.0, -1, !dbg !44
  call void @llvm.dbg.value(metadata i32 %dec, metadata !41, metadata !DIExpression()), !dbg !42
  %cmp = icmp sgt i32 %n.addr.0, 0, !dbg !45
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
  %0 = load i32, i32* @year, align 4, !dbg !53
  %rem = srem i32 %0, 4, !dbg !55
  %tobool = icmp ne i32 %rem, 0, !dbg !55
  br i1 %tobool, label %lor.lhs.false, label %land.lhs.true, !dbg !56

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @year, align 4, !dbg !57
  %rem1 = srem i32 %1, 100, !dbg !58
  %tobool2 = icmp ne i32 %rem1, 0, !dbg !58
  br i1 %tobool2, label %if.then, label %lor.lhs.false, !dbg !59

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* @year, align 4, !dbg !60
  %rem3 = srem i32 %2, 400, !dbg !61
  %tobool4 = icmp ne i32 %rem3, 0, !dbg !61
  br i1 %tobool4, label %if.end, label %if.then, !dbg !62

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  store i32 29, i32* getelementptr inbounds ([12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 1, i32 1), align 8, !dbg !63
  br label %if.end, !dbg !64

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %3 = load i32, i32* @year, align 4, !dbg !65
  %dec = add nsw i32 %3, -1, !dbg !65
  store i32 %dec, i32* @year, align 4, !dbg !65
  %4 = load i32, i32* @year, align 4, !dbg !66
  %mul = mul nsw i32 %4, 365, !dbg !67
  %5 = load i32, i32* @year, align 4, !dbg !68
  %div = sdiv i32 %5, 4, !dbg !69
  %add = add nsw i32 %mul, %div, !dbg !70
  %6 = load i32, i32* @year, align 4, !dbg !71
  %div5 = sdiv i32 %6, 100, !dbg !72
  %sub = sub nsw i32 %add, %div5, !dbg !73
  %7 = load i32, i32* @year, align 4, !dbg !74
  %div6 = sdiv i32 %7, 400, !dbg !75
  %add7 = add nsw i32 %sub, %div6, !dbg !76
  %add8 = add nsw i32 %add7, 1, !dbg !77
  %rem9 = srem i32 %add8, 7, !dbg !78
  store i32 %rem9, i32* getelementptr inbounds ([12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 0, i32 2), align 4, !dbg !79
  call void @llvm.dbg.value(metadata i32 1, metadata !80, metadata !DIExpression()), !dbg !81
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ 1, %if.end ], [ %inc, %for.inc ], !dbg !84
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !80, metadata !DIExpression()), !dbg !81
  %cmp = icmp slt i32 %i.0, 12, !dbg !85
  br i1 %cmp, label %for.body, label %for.end, !dbg !87

for.body:                                         ; preds = %for.cond
  %sub10 = sub nsw i32 %i.0, 1, !dbg !88
  %idxprom = sext i32 %sub10 to i64, !dbg !89
  %arrayidx = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom, !dbg !89
  %start_wday = getelementptr inbounds %struct.months, %struct.months* %arrayidx, i32 0, i32 2, !dbg !90
  %8 = load i32, i32* %start_wday, align 4, !dbg !90
  %sub11 = sub nsw i32 %i.0, 1, !dbg !91
  %idxprom12 = sext i32 %sub11 to i64, !dbg !92
  %arrayidx13 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom12, !dbg !92
  %days = getelementptr inbounds %struct.months, %struct.months* %arrayidx13, i32 0, i32 1, !dbg !93
  %9 = load i32, i32* %days, align 8, !dbg !93
  %add14 = add nsw i32 %8, %9, !dbg !94
  %rem15 = srem i32 %add14, 7, !dbg !95
  %idxprom16 = sext i32 %i.0 to i64, !dbg !96
  %arrayidx17 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom16, !dbg !96
  %start_wday18 = getelementptr inbounds %struct.months, %struct.months* %arrayidx17, i32 0, i32 2, !dbg !97
  store i32 %rem15, i32* %start_wday18, align 4, !dbg !98
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !99
  call void @llvm.dbg.value(metadata i32 %inc, metadata !80, metadata !DIExpression()), !dbg !81
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* @width, align 4, !dbg !103
  %add19 = add nsw i32 %10, 2, !dbg !104
  %div20 = sdiv i32 %add19, 22, !dbg !105
  store i32 %div20, i32* @cols, align 4, !dbg !106
  br label %while.cond, !dbg !107

while.cond:                                       ; preds = %while.body, %for.end
  %11 = load i32, i32* @cols, align 4, !dbg !108
  %rem21 = srem i32 12, %11, !dbg !109
  %tobool22 = icmp ne i32 %rem21, 0, !dbg !107
  br i1 %tobool22, label %while.body, label %while.end, !dbg !107

while.body:                                       ; preds = %while.cond
  %12 = load i32, i32* @cols, align 4, !dbg !110
  %dec23 = add nsw i32 %12, -1, !dbg !110
  store i32 %dec23, i32* @cols, align 4, !dbg !110
  br label %while.cond, !dbg !107, !llvm.loop !111

while.end:                                        ; preds = %while.cond
  %13 = load i32, i32* @cols, align 4, !dbg !112
  %sub24 = sub nsw i32 %13, 1, !dbg !113
  %tobool25 = icmp ne i32 %sub24, 0, !dbg !113
  br i1 %tobool25, label %cond.true, label %cond.false, !dbg !112

cond.true:                                        ; preds = %while.end
  %14 = load i32, i32* @width, align 4, !dbg !114
  %15 = load i32, i32* @cols, align 4, !dbg !115
  %mul26 = mul nsw i32 20, %15, !dbg !116
  %sub27 = sub nsw i32 %14, %mul26, !dbg !117
  %16 = load i32, i32* @cols, align 4, !dbg !118
  %sub28 = sub nsw i32 %16, 1, !dbg !119
  %div29 = sdiv i32 %sub27, %sub28, !dbg !120
  br label %cond.end, !dbg !112

cond.false:                                       ; preds = %while.end
  br label %cond.end, !dbg !112

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %div29, %cond.true ], [ 0, %cond.false ], !dbg !112
  store i32 %cond, i32* @gap, align 4, !dbg !121
  %17 = load i32, i32* @gap, align 4, !dbg !122
  %cmp30 = icmp sgt i32 %17, 4, !dbg !124
  br i1 %cmp30, label %if.then31, label %if.end32, !dbg !125

if.then31:                                        ; preds = %cond.end
  store i32 4, i32* @gap, align 4, !dbg !126
  br label %if.end32, !dbg !127

if.end32:                                         ; preds = %if.then31, %cond.end
  %18 = load i32, i32* @width, align 4, !dbg !128
  %19 = load i32, i32* @gap, align 4, !dbg !129
  %add33 = add nsw i32 20, %19, !dbg !130
  %20 = load i32, i32* @cols, align 4, !dbg !131
  %mul34 = mul nsw i32 %add33, %20, !dbg !132
  %sub35 = sub nsw i32 %18, %mul34, !dbg !133
  %21 = load i32, i32* @gap, align 4, !dbg !134
  %add36 = add nsw i32 %sub35, %21, !dbg !135
  %add37 = add nsw i32 %add36, 1, !dbg !136
  %div38 = sdiv i32 %add37, 2, !dbg !137
  store i32 %div38, i32* @lead, align 4, !dbg !138
  %22 = load i32, i32* @year, align 4, !dbg !139
  %inc39 = add nsw i32 %22, 1, !dbg !139
  store i32 %inc39, i32* @year, align 4, !dbg !139
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_row(i32 %row) #0 !dbg !141 {
entry:
  call void @llvm.dbg.value(metadata i32 %row, metadata !142, metadata !DIExpression()), !dbg !143
  %0 = load i32, i32* @cols, align 4, !dbg !144
  %mul = mul nsw i32 %row, %0, !dbg !145
  call void @llvm.dbg.value(metadata i32 %mul, metadata !146, metadata !DIExpression()), !dbg !143
  %1 = load i32, i32* @cols, align 4, !dbg !147
  %add = add nsw i32 %mul, %1, !dbg !148
  call void @llvm.dbg.value(metadata i32 %add, metadata !149, metadata !DIExpression()), !dbg !143
  %2 = load i32, i32* @lead, align 4, !dbg !150
  call void @space(i32 %2), !dbg !151
  call void @llvm.dbg.value(metadata i32 %mul, metadata !152, metadata !DIExpression()), !dbg !143
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %entry
  %c.0 = phi i32 [ %mul, %entry ], [ %inc, %for.inc ], !dbg !155
  call void @llvm.dbg.value(metadata i32 %c.0, metadata !152, metadata !DIExpression()), !dbg !143
  %cmp = icmp slt i32 %c.0, %add, !dbg !156
  br i1 %cmp, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %c.0 to i64, !dbg !159
  %arrayidx = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom, !dbg !159
  %name = getelementptr inbounds %struct.months, %struct.months* %arrayidx, i32 0, i32 0, !dbg !161
  %3 = load i8*, i8** %name, align 8, !dbg !161
  %call = call i64 @strlen(i8* %3) #6, !dbg !162
  %conv = trunc i64 %call to i32, !dbg !162
  call void @llvm.dbg.value(metadata i32 %conv, metadata !163, metadata !DIExpression()), !dbg !143
  %sub = sub nsw i32 20, %conv, !dbg !164
  %div = sdiv i32 %sub, 2, !dbg !165
  call void @space(i32 %div), !dbg !166
  %idxprom1 = sext i32 %c.0 to i64, !dbg !167
  %arrayidx2 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom1, !dbg !167
  %name3 = getelementptr inbounds %struct.months, %struct.months* %arrayidx2, i32 0, i32 0, !dbg !168
  %4 = load i8*, i8** %name3, align 8, !dbg !168
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i64 0, i64 0), i8* %4), !dbg !169
  %sub5 = sub nsw i32 20, %conv, !dbg !170
  %sub6 = sub nsw i32 20, %conv, !dbg !171
  %div7 = sdiv i32 %sub6, 2, !dbg !172
  %sub8 = sub nsw i32 %sub5, %div7, !dbg !173
  %sub9 = sub nsw i32 %add, 1, !dbg !174
  %cmp10 = icmp eq i32 %c.0, %sub9, !dbg !175
  br i1 %cmp10, label %cond.true, label %cond.false, !dbg !176

cond.true:                                        ; preds = %for.body
  br label %cond.end, !dbg !176

cond.false:                                       ; preds = %for.body
  %5 = load i32, i32* @gap, align 4, !dbg !177
  br label %cond.end, !dbg !176

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %5, %cond.false ], !dbg !176
  %add12 = add nsw i32 %sub8, %cond, !dbg !178
  call void @space(i32 %add12), !dbg !179
  br label %for.inc, !dbg !180

for.inc:                                          ; preds = %cond.end
  %inc = add nsw i32 %c.0, 1, !dbg !181
  call void @llvm.dbg.value(metadata i32 %inc, metadata !152, metadata !DIExpression()), !dbg !143
  br label %for.cond, !dbg !182, !llvm.loop !183

for.end:                                          ; preds = %for.cond
  %call13 = call i32 @putchar(i32 10), !dbg !185
  %6 = load i32, i32* @lead, align 4, !dbg !186
  call void @space(i32 %6), !dbg !187
  call void @llvm.dbg.value(metadata i32 %mul, metadata !152, metadata !DIExpression()), !dbg !143
  br label %for.cond14, !dbg !188

for.cond14:                                       ; preds = %for.inc35, %for.end
  %c.1 = phi i32 [ %mul, %for.end ], [ %inc36, %for.inc35 ], !dbg !190
  call void @llvm.dbg.value(metadata i32 %c.1, metadata !152, metadata !DIExpression()), !dbg !143
  %cmp15 = icmp slt i32 %c.1, %add, !dbg !191
  br i1 %cmp15, label %for.body17, label %for.end37, !dbg !193

for.body17:                                       ; preds = %for.cond14
  call void @llvm.dbg.value(metadata i32 0, metadata !163, metadata !DIExpression()), !dbg !143
  br label %for.cond18, !dbg !194

for.cond18:                                       ; preds = %for.inc28, %for.body17
  %i.0 = phi i32 [ 0, %for.body17 ], [ %inc29, %for.inc28 ], !dbg !197
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !163, metadata !DIExpression()), !dbg !143
  %cmp19 = icmp slt i32 %i.0, 7, !dbg !198
  br i1 %cmp19, label %for.body21, label %for.end30, !dbg !200

for.body21:                                       ; preds = %for.cond18
  %idxprom22 = sext i32 %i.0 to i64, !dbg !201
  %arrayidx23 = getelementptr inbounds [7 x i8*], [7 x i8*]* @wdays, i64 0, i64 %idxprom22, !dbg !201
  %7 = load i8*, i8** %arrayidx23, align 8, !dbg !201
  %cmp24 = icmp eq i32 %i.0, 6, !dbg !202
  %8 = zext i1 %cmp24 to i64, !dbg !203
  %cond26 = select i1 %cmp24, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.21, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.22, i64 0, i64 0), !dbg !203
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.20, i64 0, i64 0), i8* %7, i8* %cond26), !dbg !204
  br label %for.inc28, !dbg !204

for.inc28:                                        ; preds = %for.body21
  %inc29 = add nsw i32 %i.0, 1, !dbg !205
  call void @llvm.dbg.value(metadata i32 %inc29, metadata !163, metadata !DIExpression()), !dbg !143
  br label %for.cond18, !dbg !206, !llvm.loop !207

for.end30:                                        ; preds = %for.cond18
  %sub31 = sub nsw i32 %add, 1, !dbg !209
  %cmp32 = icmp slt i32 %c.1, %sub31, !dbg !211
  br i1 %cmp32, label %if.then, label %if.else, !dbg !212

if.then:                                          ; preds = %for.end30
  %9 = load i32, i32* @gap, align 4, !dbg !213
  call void @space(i32 %9), !dbg !214
  br label %if.end, !dbg !214

if.else:                                          ; preds = %for.end30
  %call34 = call i32 @putchar(i32 10), !dbg !215
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc35, !dbg !216

for.inc35:                                        ; preds = %if.end
  %inc36 = add nsw i32 %c.1, 1, !dbg !217
  call void @llvm.dbg.value(metadata i32 %inc36, metadata !152, metadata !DIExpression()), !dbg !143
  br label %for.cond14, !dbg !218, !llvm.loop !219

for.end37:                                        ; preds = %for.cond14
  br label %while.body, !dbg !221

while.body:                                       ; preds = %for.end118, %for.end37
  call void @llvm.dbg.value(metadata i32 %mul, metadata !152, metadata !DIExpression()), !dbg !143
  br label %for.cond38, !dbg !222

for.cond38:                                       ; preds = %for.inc50, %while.body
  %c.2 = phi i32 [ %mul, %while.body ], [ %inc51, %for.inc50 ], !dbg !225
  call void @llvm.dbg.value(metadata i32 %c.2, metadata !152, metadata !DIExpression()), !dbg !143
  %cmp39 = icmp slt i32 %c.2, %add, !dbg !226
  br i1 %cmp39, label %for.body41, label %for.end52.loopexit, !dbg !228

for.body41:                                       ; preds = %for.cond38
  %idxprom42 = sext i32 %c.2 to i64, !dbg !229
  %arrayidx43 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom42, !dbg !229
  %at = getelementptr inbounds %struct.months, %struct.months* %arrayidx43, i32 0, i32 3, !dbg !231
  %10 = load i32, i32* %at, align 8, !dbg !231
  %idxprom44 = sext i32 %c.2 to i64, !dbg !232
  %arrayidx45 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom44, !dbg !232
  %days = getelementptr inbounds %struct.months, %struct.months* %arrayidx45, i32 0, i32 1, !dbg !233
  %11 = load i32, i32* %days, align 8, !dbg !233
  %cmp46 = icmp slt i32 %10, %11, !dbg !234
  br i1 %cmp46, label %if.then48, label %if.end49, !dbg !235

if.then48:                                        ; preds = %for.body41
  br label %for.end52, !dbg !236

if.end49:                                         ; preds = %for.body41
  br label %for.inc50, !dbg !233

for.inc50:                                        ; preds = %if.end49
  %inc51 = add nsw i32 %c.2, 1, !dbg !237
  call void @llvm.dbg.value(metadata i32 %inc51, metadata !152, metadata !DIExpression()), !dbg !143
  br label %for.cond38, !dbg !238, !llvm.loop !239

for.end52.loopexit:                               ; preds = %for.cond38
  br label %for.end52, !dbg !241

for.end52:                                        ; preds = %for.end52.loopexit, %if.then48
  %cmp53 = icmp eq i32 %c.2, %add, !dbg !243
  br i1 %cmp53, label %if.then55, label %if.end56, !dbg !244

if.then55:                                        ; preds = %for.end52
  br label %while.end120, !dbg !245

if.end56:                                         ; preds = %for.end52
  %12 = load i32, i32* @lead, align 4, !dbg !246
  call void @space(i32 %12), !dbg !247
  call void @llvm.dbg.value(metadata i32 %mul, metadata !152, metadata !DIExpression()), !dbg !143
  br label %for.cond57, !dbg !248

for.cond57:                                       ; preds = %for.inc116, %if.end56
  %c.3 = phi i32 [ %mul, %if.end56 ], [ %inc117, %for.inc116 ], !dbg !250
  call void @llvm.dbg.value(metadata i32 %c.3, metadata !152, metadata !DIExpression()), !dbg !143
  %cmp58 = icmp slt i32 %c.3, %add, !dbg !251
  br i1 %cmp58, label %for.body60, label %for.end118, !dbg !253

for.body60:                                       ; preds = %for.cond57
  call void @llvm.dbg.value(metadata i32 0, metadata !163, metadata !DIExpression()), !dbg !143
  br label %for.cond61, !dbg !254

for.cond61:                                       ; preds = %for.inc67, %for.body60
  %i.1 = phi i32 [ 0, %for.body60 ], [ %inc68, %for.inc67 ], !dbg !257
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !163, metadata !DIExpression()), !dbg !143
  %idxprom62 = sext i32 %c.3 to i64, !dbg !258
  %arrayidx63 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom62, !dbg !258
  %start_wday = getelementptr inbounds %struct.months, %struct.months* %arrayidx63, i32 0, i32 2, !dbg !260
  %13 = load i32, i32* %start_wday, align 4, !dbg !260
  %cmp64 = icmp slt i32 %i.1, %13, !dbg !261
  br i1 %cmp64, label %for.body66, label %for.end69, !dbg !262

for.body66:                                       ; preds = %for.cond61
  call void @space(i32 3), !dbg !263
  br label %for.inc67, !dbg !263

for.inc67:                                        ; preds = %for.body66
  %inc68 = add nsw i32 %i.1, 1, !dbg !264
  call void @llvm.dbg.value(metadata i32 %inc68, metadata !163, metadata !DIExpression()), !dbg !143
  br label %for.cond61, !dbg !265, !llvm.loop !266

for.end69:                                        ; preds = %for.cond61
  br label %while.cond70, !dbg !268

while.cond70:                                     ; preds = %if.end95, %for.end69
  %i.2 = phi i32 [ %i.1, %for.end69 ], [ %inc71, %if.end95 ], !dbg !269
  call void @llvm.dbg.value(metadata i32 %i.2, metadata !163, metadata !DIExpression()), !dbg !143
  %inc71 = add nsw i32 %i.2, 1, !dbg !270
  call void @llvm.dbg.value(metadata i32 %inc71, metadata !163, metadata !DIExpression()), !dbg !143
  %cmp72 = icmp slt i32 %i.2, 7, !dbg !271
  br i1 %cmp72, label %land.rhs, label %land.end, !dbg !272

land.rhs:                                         ; preds = %while.cond70
  %idxprom74 = sext i32 %c.3 to i64, !dbg !273
  %arrayidx75 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom74, !dbg !273
  %at76 = getelementptr inbounds %struct.months, %struct.months* %arrayidx75, i32 0, i32 3, !dbg !274
  %14 = load i32, i32* %at76, align 8, !dbg !274
  %idxprom77 = sext i32 %c.3 to i64, !dbg !275
  %arrayidx78 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom77, !dbg !275
  %days79 = getelementptr inbounds %struct.months, %struct.months* %arrayidx78, i32 0, i32 1, !dbg !276
  %15 = load i32, i32* %days79, align 8, !dbg !276
  %cmp80 = icmp slt i32 %14, %15, !dbg !277
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond70
  %16 = phi i1 [ false, %while.cond70 ], [ %cmp80, %land.rhs ], !dbg !269
  br i1 %16, label %while.body82, label %while.end, !dbg !268

while.body82:                                     ; preds = %land.end
  %idxprom83 = sext i32 %c.3 to i64, !dbg !278
  %arrayidx84 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom83, !dbg !278
  %at85 = getelementptr inbounds %struct.months, %struct.months* %arrayidx84, i32 0, i32 3, !dbg !280
  %17 = load i32, i32* %at85, align 8, !dbg !281
  %inc86 = add nsw i32 %17, 1, !dbg !281
  store i32 %inc86, i32* %at85, align 8, !dbg !281
  %call87 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i64 0, i64 0), i32 %inc86), !dbg !282
  %cmp88 = icmp slt i32 %inc71, 7, !dbg !283
  br i1 %cmp88, label %if.then93, label %lor.lhs.false, !dbg !285

lor.lhs.false:                                    ; preds = %while.body82
  %sub90 = sub nsw i32 %add, 1, !dbg !286
  %cmp91 = icmp slt i32 %c.3, %sub90, !dbg !287
  br i1 %cmp91, label %if.then93, label %if.end95, !dbg !288

if.then93:                                        ; preds = %lor.lhs.false, %while.body82
  %call94 = call i32 @putchar(i32 32), !dbg !289
  br label %if.end95, !dbg !289

if.end95:                                         ; preds = %if.then93, %lor.lhs.false
  br label %while.cond70, !dbg !268, !llvm.loop !290

while.end:                                        ; preds = %land.end
  br label %while.cond96, !dbg !292

while.cond96:                                     ; preds = %while.body105, %while.end
  %i.3 = phi i32 [ %inc71, %while.end ], [ %inc97, %while.body105 ], !dbg !269
  call void @llvm.dbg.value(metadata i32 %i.3, metadata !163, metadata !DIExpression()), !dbg !143
  %inc97 = add nsw i32 %i.3, 1, !dbg !293
  call void @llvm.dbg.value(metadata i32 %inc97, metadata !163, metadata !DIExpression()), !dbg !143
  %cmp98 = icmp sle i32 %i.3, 7, !dbg !294
  br i1 %cmp98, label %land.rhs100, label %land.end104, !dbg !295

land.rhs100:                                      ; preds = %while.cond96
  %sub101 = sub nsw i32 %add, 1, !dbg !296
  %cmp102 = icmp slt i32 %c.3, %sub101, !dbg !297
  br label %land.end104

land.end104:                                      ; preds = %land.rhs100, %while.cond96
  %18 = phi i1 [ false, %while.cond96 ], [ %cmp102, %land.rhs100 ], !dbg !269
  br i1 %18, label %while.body105, label %while.end106, !dbg !292

while.body105:                                    ; preds = %land.end104
  call void @space(i32 3), !dbg !298
  br label %while.cond96, !dbg !292, !llvm.loop !299

while.end106:                                     ; preds = %land.end104
  %sub107 = sub nsw i32 %add, 1, !dbg !301
  %cmp108 = icmp slt i32 %c.3, %sub107, !dbg !303
  br i1 %cmp108, label %if.then110, label %if.end112, !dbg !304

if.then110:                                       ; preds = %while.end106
  %19 = load i32, i32* @gap, align 4, !dbg !305
  %sub111 = sub nsw i32 %19, 1, !dbg !306
  call void @space(i32 %sub111), !dbg !307
  br label %if.end112, !dbg !307

if.end112:                                        ; preds = %if.then110, %while.end106
  %idxprom113 = sext i32 %c.3 to i64, !dbg !308
  %arrayidx114 = getelementptr inbounds [12 x %struct.months], [12 x %struct.months]* @months, i64 0, i64 %idxprom113, !dbg !308
  %start_wday115 = getelementptr inbounds %struct.months, %struct.months* %arrayidx114, i32 0, i32 2, !dbg !309
  store i32 0, i32* %start_wday115, align 4, !dbg !310
  br label %for.inc116, !dbg !311

for.inc116:                                       ; preds = %if.end112
  %inc117 = add nsw i32 %c.3, 1, !dbg !312
  call void @llvm.dbg.value(metadata i32 %inc117, metadata !152, metadata !DIExpression()), !dbg !143
  br label %for.cond57, !dbg !313, !llvm.loop !314

for.end118:                                       ; preds = %for.cond57
  %call119 = call i32 @putchar(i32 10), !dbg !316
  br label %while.body, !dbg !221, !llvm.loop !317

while.end120:                                     ; preds = %if.then55
  %call121 = call i32 @putchar(i32 10), !dbg !319
  ret void, !dbg !320
}

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #3

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_year() #0 !dbg !321 {
entry:
  %buf = alloca [32 x i8], align 16
  call void @llvm.dbg.declare(metadata [32 x i8]* %buf, metadata !322, metadata !DIExpression()), !dbg !326
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i64 0, i64 0, !dbg !327
  %0 = load i32, i32* @year, align 4, !dbg !328
  %call = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.24, i64 0, i64 0), i32 %0) #7, !dbg !329
  %1 = load i32, i32* @width, align 4, !dbg !330
  %conv = sext i32 %1 to i64, !dbg !330
  %arraydecay1 = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i64 0, i64 0, !dbg !331
  %call2 = call i64 @strlen(i8* %arraydecay1) #6, !dbg !332
  %sub = sub i64 %conv, %call2, !dbg !333
  %div = udiv i64 %sub, 2, !dbg !334
  %conv3 = trunc i64 %div to i32, !dbg !335
  call void @space(i32 %conv3), !dbg !336
  %arraydecay4 = getelementptr inbounds [32 x i8], [32 x i8]* %buf, i64 0, i64 0, !dbg !337
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i64 0, i64 0), i8* %arraydecay4), !dbg !338
  call void @llvm.dbg.value(metadata i32 0, metadata !339, metadata !DIExpression()), !dbg !340
  br label %for.cond, !dbg !341

for.cond:                                         ; preds = %for.inc, %entry
  %row.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !343
  call void @llvm.dbg.value(metadata i32 %row.0, metadata !339, metadata !DIExpression()), !dbg !340
  %2 = load i32, i32* @cols, align 4, !dbg !344
  %mul = mul nsw i32 %row.0, %2, !dbg !346
  %cmp = icmp slt i32 %mul, 12, !dbg !347
  br i1 %cmp, label %for.body, label %for.end, !dbg !348

for.body:                                         ; preds = %for.cond
  call void @print_row(i32 %row.0), !dbg !349
  br label %for.inc, !dbg !349

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %row.0, 1, !dbg !350
  call void @llvm.dbg.value(metadata i32 %inc, metadata !339, metadata !DIExpression()), !dbg !340
  br label %for.cond, !dbg !351, !llvm.loop !352

for.end:                                          ; preds = %for.cond
  ret void, !dbg !354
}

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8*, i8*, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !355 {
entry:
  call void @llvm.dbg.value(metadata i32 %c, metadata !360, metadata !DIExpression()), !dbg !361
  call void @llvm.dbg.value(metadata i8** %v, metadata !362, metadata !DIExpression()), !dbg !361
  call void @llvm.dbg.value(metadata i32 0, metadata !363, metadata !DIExpression()), !dbg !361
  call void @llvm.dbg.value(metadata i32 1, metadata !364, metadata !DIExpression()), !dbg !361
  br label %for.cond, !dbg !365

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc20, %for.inc ], !dbg !367
  %year_set.0 = phi i32 [ 0, %entry ], [ %year_set.1, %for.inc ], !dbg !361
  call void @llvm.dbg.value(metadata i32 %year_set.0, metadata !363, metadata !DIExpression()), !dbg !361
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !364, metadata !DIExpression()), !dbg !361
  %cmp = icmp slt i32 %i.0, %c, !dbg !368
  br i1 %cmp, label %for.body, label %for.end, !dbg !370

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !371
  %arrayidx = getelementptr inbounds i8*, i8** %v, i64 %idxprom, !dbg !371
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !371
  %call = call i32 @strcmp(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.26, i64 0, i64 0)) #6, !dbg !374
  %tobool = icmp ne i32 %call, 0, !dbg !374
  br i1 %tobool, label %if.else, label %if.then, !dbg !375

if.then:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !376
  call void @llvm.dbg.value(metadata i32 %inc, metadata !364, metadata !DIExpression()), !dbg !361
  %cmp1 = icmp eq i32 %inc, %c, !dbg !379
  br i1 %cmp1, label %if.then6, label %lor.lhs.false, !dbg !380

lor.lhs.false:                                    ; preds = %if.then
  %idxprom2 = sext i32 %inc to i64, !dbg !381
  %arrayidx3 = getelementptr inbounds i8*, i8** %v, i64 %idxprom2, !dbg !381
  %1 = load i8*, i8** %arrayidx3, align 8, !dbg !381
  %call4 = call i32 @atoi(i8* %1) #6, !dbg !382
  store i32 %call4, i32* @width, align 4, !dbg !383
  %cmp5 = icmp slt i32 %call4, 20, !dbg !384
  br i1 %cmp5, label %if.then6, label %if.end, !dbg !385

if.then6:                                         ; preds = %lor.lhs.false, %if.then
  br label %bail, !dbg !386

if.end:                                           ; preds = %lor.lhs.false
  br label %if.end19, !dbg !387

if.else:                                          ; preds = %for.body
  %tobool7 = icmp ne i32 %year_set.0, 0, !dbg !388
  br i1 %tobool7, label %if.else17, label %if.then8, !dbg !390

if.then8:                                         ; preds = %if.else
  %idxprom9 = sext i32 %i.0 to i64, !dbg !391
  %arrayidx10 = getelementptr inbounds i8*, i8** %v, i64 %idxprom9, !dbg !391
  %2 = load i8*, i8** %arrayidx10, align 8, !dbg !391
  %call11 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.24, i64 0, i64 0), i32* @year) #7, !dbg !394
  %tobool12 = icmp ne i32 %call11, 0, !dbg !394
  br i1 %tobool12, label %lor.lhs.false13, label %if.then15, !dbg !395

lor.lhs.false13:                                  ; preds = %if.then8
  %3 = load i32, i32* @year, align 4, !dbg !396
  %cmp14 = icmp sle i32 %3, 0, !dbg !397
  br i1 %cmp14, label %if.then15, label %if.end16, !dbg !398

if.then15:                                        ; preds = %lor.lhs.false13, %if.then8
  store i32 1969, i32* @year, align 4, !dbg !399
  br label %if.end16, !dbg !400

if.end16:                                         ; preds = %if.then15, %lor.lhs.false13
  call void @llvm.dbg.value(metadata i32 1, metadata !363, metadata !DIExpression()), !dbg !361
  br label %if.end18, !dbg !401

if.else17:                                        ; preds = %if.else
  br label %bail, !dbg !402

if.end18:                                         ; preds = %if.end16
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %if.end
  %i.1 = phi i32 [ %i.0, %if.end18 ], [ %inc, %if.end ], !dbg !367
  %year_set.1 = phi i32 [ 1, %if.end18 ], [ %year_set.0, %if.end ], !dbg !361
  call void @llvm.dbg.value(metadata i32 %year_set.1, metadata !363, metadata !DIExpression()), !dbg !361
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !364, metadata !DIExpression()), !dbg !361
  br label %for.inc, !dbg !403

for.inc:                                          ; preds = %if.end19
  %inc20 = add nsw i32 %i.1, 1, !dbg !404
  call void @llvm.dbg.value(metadata i32 %inc20, metadata !364, metadata !DIExpression()), !dbg !361
  br label %for.cond, !dbg !405, !llvm.loop !406

for.end:                                          ; preds = %for.cond
  call void @init_months(), !dbg !408
  call void @print_year(), !dbg !409
  ret i32 0, !dbg !410

bail:                                             ; preds = %if.else17, %if.then6
  call void @llvm.dbg.label(metadata !411), !dbg !412
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !413
  %arrayidx21 = getelementptr inbounds i8*, i8** %v, i64 0, !dbg !414
  %5 = load i8*, i8** %arrayidx21, align 8, !dbg !414
  %call22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.27, i64 0, i64 0), i8* %5), !dbg !415
  call void @exit(i32 1) #8, !dbg !416
  unreachable, !dbg !416
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

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!42 = !DILocation(line: 0, scope: !38)
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
!53 = !DILocation(line: 33, column: 9, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !3, line: 33, column: 6)
!55 = !DILocation(line: 33, column: 14, scope: !54)
!56 = !DILocation(line: 33, column: 19, scope: !54)
!57 = !DILocation(line: 33, column: 23, scope: !54)
!58 = !DILocation(line: 33, column: 28, scope: !54)
!59 = !DILocation(line: 33, column: 36, scope: !54)
!60 = !DILocation(line: 33, column: 41, scope: !54)
!61 = !DILocation(line: 33, column: 46, scope: !54)
!62 = !DILocation(line: 33, column: 6, scope: !50)
!63 = !DILocation(line: 34, column: 18, scope: !54)
!64 = !DILocation(line: 34, column: 3, scope: !54)
!65 = !DILocation(line: 36, column: 6, scope: !50)
!66 = !DILocation(line: 38, column: 6, scope: !50)
!67 = !DILocation(line: 38, column: 11, scope: !50)
!68 = !DILocation(line: 38, column: 19, scope: !50)
!69 = !DILocation(line: 38, column: 23, scope: !50)
!70 = !DILocation(line: 38, column: 17, scope: !50)
!71 = !DILocation(line: 38, column: 28, scope: !50)
!72 = !DILocation(line: 38, column: 32, scope: !50)
!73 = !DILocation(line: 38, column: 26, scope: !50)
!74 = !DILocation(line: 38, column: 39, scope: !50)
!75 = !DILocation(line: 38, column: 43, scope: !50)
!76 = !DILocation(line: 38, column: 37, scope: !50)
!77 = !DILocation(line: 38, column: 48, scope: !50)
!78 = !DILocation(line: 38, column: 53, scope: !50)
!79 = !DILocation(line: 38, column: 3, scope: !50)
!80 = !DILocalVariable(name: "i", scope: !50, file: !3, line: 31, type: !8)
!81 = !DILocation(line: 0, scope: !50)
!82 = !DILocation(line: 40, column: 7, scope: !83)
!83 = distinct !DILexicalBlock(scope: !50, file: !3, line: 40, column: 2)
!84 = !DILocation(line: 0, scope: !83)
!85 = !DILocation(line: 40, column: 16, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !3, line: 40, column: 2)
!87 = !DILocation(line: 40, column: 2, scope: !83)
!88 = !DILocation(line: 42, column: 13, scope: !86)
!89 = !DILocation(line: 42, column: 5, scope: !86)
!90 = !DILocation(line: 42, column: 17, scope: !86)
!91 = !DILocation(line: 42, column: 38, scope: !86)
!92 = !DILocation(line: 42, column: 30, scope: !86)
!93 = !DILocation(line: 42, column: 42, scope: !86)
!94 = !DILocation(line: 42, column: 28, scope: !86)
!95 = !DILocation(line: 42, column: 48, scope: !86)
!96 = !DILocation(line: 41, column: 3, scope: !86)
!97 = !DILocation(line: 41, column: 13, scope: !86)
!98 = !DILocation(line: 41, column: 24, scope: !86)
!99 = !DILocation(line: 40, column: 23, scope: !86)
!100 = !DILocation(line: 40, column: 2, scope: !86)
!101 = distinct !{!101, !87, !102}
!102 = !DILocation(line: 42, column: 50, scope: !83)
!103 = !DILocation(line: 44, column: 10, scope: !50)
!104 = !DILocation(line: 44, column: 16, scope: !50)
!105 = !DILocation(line: 44, column: 21, scope: !50)
!106 = !DILocation(line: 44, column: 7, scope: !50)
!107 = !DILocation(line: 45, column: 2, scope: !50)
!108 = !DILocation(line: 45, column: 14, scope: !50)
!109 = !DILocation(line: 45, column: 12, scope: !50)
!110 = !DILocation(line: 45, column: 24, scope: !50)
!111 = distinct !{!111, !107, !110}
!112 = !DILocation(line: 46, column: 8, scope: !50)
!113 = !DILocation(line: 46, column: 13, scope: !50)
!114 = !DILocation(line: 46, column: 20, scope: !50)
!115 = !DILocation(line: 46, column: 33, scope: !50)
!116 = !DILocation(line: 46, column: 31, scope: !50)
!117 = !DILocation(line: 46, column: 26, scope: !50)
!118 = !DILocation(line: 46, column: 42, scope: !50)
!119 = !DILocation(line: 46, column: 47, scope: !50)
!120 = !DILocation(line: 46, column: 39, scope: !50)
!121 = !DILocation(line: 46, column: 6, scope: !50)
!122 = !DILocation(line: 47, column: 6, scope: !123)
!123 = distinct !DILexicalBlock(scope: !50, file: !3, line: 47, column: 6)
!124 = !DILocation(line: 47, column: 10, scope: !123)
!125 = !DILocation(line: 47, column: 6, scope: !50)
!126 = !DILocation(line: 47, column: 19, scope: !123)
!127 = !DILocation(line: 47, column: 15, scope: !123)
!128 = !DILocation(line: 48, column: 10, scope: !50)
!129 = !DILocation(line: 48, column: 24, scope: !50)
!130 = !DILocation(line: 48, column: 22, scope: !50)
!131 = !DILocation(line: 48, column: 31, scope: !50)
!132 = !DILocation(line: 48, column: 29, scope: !50)
!133 = !DILocation(line: 48, column: 16, scope: !50)
!134 = !DILocation(line: 48, column: 38, scope: !50)
!135 = !DILocation(line: 48, column: 36, scope: !50)
!136 = !DILocation(line: 48, column: 42, scope: !50)
!137 = !DILocation(line: 48, column: 47, scope: !50)
!138 = !DILocation(line: 48, column: 7, scope: !50)
!139 = !DILocation(line: 49, column: 13, scope: !50)
!140 = !DILocation(line: 50, column: 1, scope: !50)
!141 = distinct !DISubprogram(name: "print_row", scope: !3, file: !3, line: 52, type: !39, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!142 = !DILocalVariable(name: "row", arg: 1, scope: !141, file: !3, line: 52, type: !8)
!143 = !DILocation(line: 0, scope: !141)
!144 = !DILocation(line: 54, column: 25, scope: !141)
!145 = !DILocation(line: 54, column: 23, scope: !141)
!146 = !DILocalVariable(name: "from", scope: !141, file: !3, line: 54, type: !8)
!147 = !DILocation(line: 54, column: 43, scope: !141)
!148 = !DILocation(line: 54, column: 41, scope: !141)
!149 = !DILocalVariable(name: "to", scope: !141, file: !3, line: 54, type: !8)
!150 = !DILocation(line: 55, column: 8, scope: !141)
!151 = !DILocation(line: 55, column: 2, scope: !141)
!152 = !DILocalVariable(name: "c", scope: !141, file: !3, line: 54, type: !8)
!153 = !DILocation(line: 56, column: 7, scope: !154)
!154 = distinct !DILexicalBlock(scope: !141, file: !3, line: 56, column: 2)
!155 = !DILocation(line: 0, scope: !154)
!156 = !DILocation(line: 56, column: 19, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !3, line: 56, column: 2)
!158 = !DILocation(line: 56, column: 2, scope: !154)
!159 = !DILocation(line: 57, column: 14, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !3, line: 56, column: 30)
!161 = !DILocation(line: 57, column: 24, scope: !160)
!162 = !DILocation(line: 57, column: 7, scope: !160)
!163 = !DILocalVariable(name: "i", scope: !141, file: !3, line: 54, type: !8)
!164 = !DILocation(line: 58, column: 13, scope: !160)
!165 = !DILocation(line: 58, column: 17, scope: !160)
!166 = !DILocation(line: 58, column: 3, scope: !160)
!167 = !DILocation(line: 59, column: 16, scope: !160)
!168 = !DILocation(line: 59, column: 26, scope: !160)
!169 = !DILocation(line: 59, column: 3, scope: !160)
!170 = !DILocation(line: 60, column: 12, scope: !160)
!171 = !DILocation(line: 60, column: 22, scope: !160)
!172 = !DILocation(line: 60, column: 26, scope: !160)
!173 = !DILocation(line: 60, column: 16, scope: !160)
!174 = !DILocation(line: 60, column: 41, scope: !160)
!175 = !DILocation(line: 60, column: 35, scope: !160)
!176 = !DILocation(line: 60, column: 32, scope: !160)
!177 = !DILocation(line: 60, column: 52, scope: !160)
!178 = !DILocation(line: 60, column: 29, scope: !160)
!179 = !DILocation(line: 60, column: 3, scope: !160)
!180 = !DILocation(line: 61, column: 2, scope: !160)
!181 = !DILocation(line: 56, column: 26, scope: !157)
!182 = !DILocation(line: 56, column: 2, scope: !157)
!183 = distinct !{!183, !158, !184}
!184 = !DILocation(line: 61, column: 2, scope: !154)
!185 = !DILocation(line: 62, column: 2, scope: !141)
!186 = !DILocation(line: 64, column: 8, scope: !141)
!187 = !DILocation(line: 64, column: 2, scope: !141)
!188 = !DILocation(line: 65, column: 7, scope: !189)
!189 = distinct !DILexicalBlock(scope: !141, file: !3, line: 65, column: 2)
!190 = !DILocation(line: 0, scope: !189)
!191 = !DILocation(line: 65, column: 19, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !3, line: 65, column: 2)
!193 = !DILocation(line: 65, column: 2, scope: !189)
!194 = !DILocation(line: 66, column: 8, scope: !195)
!195 = distinct !DILexicalBlock(scope: !196, file: !3, line: 66, column: 3)
!196 = distinct !DILexicalBlock(scope: !192, file: !3, line: 65, column: 30)
!197 = !DILocation(line: 0, scope: !195)
!198 = !DILocation(line: 66, column: 17, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !3, line: 66, column: 3)
!200 = !DILocation(line: 66, column: 3, scope: !195)
!201 = !DILocation(line: 67, column: 19, scope: !199)
!202 = !DILocation(line: 67, column: 31, scope: !199)
!203 = !DILocation(line: 67, column: 29, scope: !199)
!204 = !DILocation(line: 67, column: 4, scope: !199)
!205 = !DILocation(line: 66, column: 23, scope: !199)
!206 = !DILocation(line: 66, column: 3, scope: !199)
!207 = distinct !{!207, !200, !208}
!208 = !DILocation(line: 67, column: 46, scope: !195)
!209 = !DILocation(line: 68, column: 14, scope: !210)
!210 = distinct !DILexicalBlock(scope: !196, file: !3, line: 68, column: 7)
!211 = !DILocation(line: 68, column: 9, scope: !210)
!212 = !DILocation(line: 68, column: 7, scope: !196)
!213 = !DILocation(line: 68, column: 25, scope: !210)
!214 = !DILocation(line: 68, column: 19, scope: !210)
!215 = !DILocation(line: 69, column: 8, scope: !210)
!216 = !DILocation(line: 70, column: 2, scope: !196)
!217 = !DILocation(line: 65, column: 26, scope: !192)
!218 = !DILocation(line: 65, column: 2, scope: !192)
!219 = distinct !{!219, !193, !220}
!220 = !DILocation(line: 70, column: 2, scope: !189)
!221 = !DILocation(line: 72, column: 2, scope: !141)
!222 = !DILocation(line: 73, column: 8, scope: !223)
!223 = distinct !DILexicalBlock(scope: !224, file: !3, line: 73, column: 3)
!224 = distinct !DILexicalBlock(scope: !141, file: !3, line: 72, column: 12)
!225 = !DILocation(line: 0, scope: !223)
!226 = !DILocation(line: 73, column: 20, scope: !227)
!227 = distinct !DILexicalBlock(scope: !223, file: !3, line: 73, column: 3)
!228 = !DILocation(line: 73, column: 3, scope: !223)
!229 = !DILocation(line: 74, column: 8, scope: !230)
!230 = distinct !DILexicalBlock(scope: !227, file: !3, line: 74, column: 8)
!231 = !DILocation(line: 74, column: 18, scope: !230)
!232 = !DILocation(line: 74, column: 23, scope: !230)
!233 = !DILocation(line: 74, column: 33, scope: !230)
!234 = !DILocation(line: 74, column: 21, scope: !230)
!235 = !DILocation(line: 74, column: 8, scope: !227)
!236 = !DILocation(line: 74, column: 39, scope: !230)
!237 = !DILocation(line: 73, column: 27, scope: !227)
!238 = !DILocation(line: 73, column: 3, scope: !227)
!239 = distinct !{!239, !228, !240}
!240 = !DILocation(line: 74, column: 39, scope: !223)
!241 = !DILocation(line: 75, column: 7, scope: !242)
!242 = distinct !DILexicalBlock(scope: !224, file: !3, line: 75, column: 7)
!243 = !DILocation(line: 75, column: 9, scope: !242)
!244 = !DILocation(line: 75, column: 7, scope: !224)
!245 = !DILocation(line: 75, column: 16, scope: !242)
!246 = !DILocation(line: 77, column: 9, scope: !224)
!247 = !DILocation(line: 77, column: 3, scope: !224)
!248 = !DILocation(line: 78, column: 8, scope: !249)
!249 = distinct !DILexicalBlock(scope: !224, file: !3, line: 78, column: 3)
!250 = !DILocation(line: 0, scope: !249)
!251 = !DILocation(line: 78, column: 20, scope: !252)
!252 = distinct !DILexicalBlock(scope: !249, file: !3, line: 78, column: 3)
!253 = !DILocation(line: 78, column: 3, scope: !249)
!254 = !DILocation(line: 79, column: 9, scope: !255)
!255 = distinct !DILexicalBlock(scope: !256, file: !3, line: 79, column: 4)
!256 = distinct !DILexicalBlock(scope: !252, file: !3, line: 78, column: 31)
!257 = !DILocation(line: 0, scope: !255)
!258 = !DILocation(line: 79, column: 20, scope: !259)
!259 = distinct !DILexicalBlock(scope: !255, file: !3, line: 79, column: 4)
!260 = !DILocation(line: 79, column: 30, scope: !259)
!261 = !DILocation(line: 79, column: 18, scope: !259)
!262 = !DILocation(line: 79, column: 4, scope: !255)
!263 = !DILocation(line: 79, column: 47, scope: !259)
!264 = !DILocation(line: 79, column: 43, scope: !259)
!265 = !DILocation(line: 79, column: 4, scope: !259)
!266 = distinct !{!266, !262, !267}
!267 = !DILocation(line: 79, column: 54, scope: !255)
!268 = !DILocation(line: 80, column: 4, scope: !256)
!269 = !DILocation(line: 0, scope: !256)
!270 = !DILocation(line: 80, column: 11, scope: !256)
!271 = !DILocation(line: 80, column: 14, scope: !256)
!272 = !DILocation(line: 80, column: 18, scope: !256)
!273 = !DILocation(line: 80, column: 21, scope: !256)
!274 = !DILocation(line: 80, column: 31, scope: !256)
!275 = !DILocation(line: 80, column: 36, scope: !256)
!276 = !DILocation(line: 80, column: 46, scope: !256)
!277 = !DILocation(line: 80, column: 34, scope: !256)
!278 = !DILocation(line: 81, column: 21, scope: !279)
!279 = distinct !DILexicalBlock(scope: !256, file: !3, line: 80, column: 52)
!280 = !DILocation(line: 81, column: 31, scope: !279)
!281 = !DILocation(line: 81, column: 19, scope: !279)
!282 = !DILocation(line: 81, column: 5, scope: !279)
!283 = !DILocation(line: 82, column: 11, scope: !284)
!284 = distinct !DILexicalBlock(scope: !279, file: !3, line: 82, column: 9)
!285 = !DILocation(line: 82, column: 15, scope: !284)
!286 = !DILocation(line: 82, column: 25, scope: !284)
!287 = !DILocation(line: 82, column: 20, scope: !284)
!288 = !DILocation(line: 82, column: 9, scope: !279)
!289 = !DILocation(line: 82, column: 30, scope: !284)
!290 = distinct !{!290, !268, !291}
!291 = !DILocation(line: 83, column: 4, scope: !256)
!292 = !DILocation(line: 84, column: 4, scope: !256)
!293 = !DILocation(line: 84, column: 12, scope: !256)
!294 = !DILocation(line: 84, column: 15, scope: !256)
!295 = !DILocation(line: 84, column: 20, scope: !256)
!296 = !DILocation(line: 84, column: 30, scope: !256)
!297 = !DILocation(line: 84, column: 25, scope: !256)
!298 = !DILocation(line: 84, column: 35, scope: !256)
!299 = distinct !{!299, !292, !300}
!300 = !DILocation(line: 84, column: 42, scope: !256)
!301 = !DILocation(line: 85, column: 15, scope: !302)
!302 = distinct !DILexicalBlock(scope: !256, file: !3, line: 85, column: 8)
!303 = !DILocation(line: 85, column: 10, scope: !302)
!304 = !DILocation(line: 85, column: 8, scope: !256)
!305 = !DILocation(line: 85, column: 26, scope: !302)
!306 = !DILocation(line: 85, column: 30, scope: !302)
!307 = !DILocation(line: 85, column: 20, scope: !302)
!308 = !DILocation(line: 86, column: 4, scope: !256)
!309 = !DILocation(line: 86, column: 14, scope: !256)
!310 = !DILocation(line: 86, column: 25, scope: !256)
!311 = !DILocation(line: 87, column: 3, scope: !256)
!312 = !DILocation(line: 78, column: 27, scope: !252)
!313 = !DILocation(line: 78, column: 3, scope: !252)
!314 = distinct !{!314, !253, !315}
!315 = !DILocation(line: 87, column: 3, scope: !249)
!316 = !DILocation(line: 88, column: 3, scope: !224)
!317 = distinct !{!317, !221, !318}
!318 = !DILocation(line: 89, column: 2, scope: !141)
!319 = !DILocation(line: 90, column: 2, scope: !141)
!320 = !DILocation(line: 91, column: 1, scope: !141)
!321 = distinct !DISubprogram(name: "print_year", scope: !3, file: !3, line: 93, type: !51, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!322 = !DILocalVariable(name: "buf", scope: !321, file: !3, line: 96, type: !323)
!323 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 256, elements: !324)
!324 = !{!325}
!325 = !DISubrange(count: 32)
!326 = !DILocation(line: 96, column: 7, scope: !321)
!327 = !DILocation(line: 97, column: 10, scope: !321)
!328 = !DILocation(line: 97, column: 21, scope: !321)
!329 = !DILocation(line: 97, column: 2, scope: !321)
!330 = !DILocation(line: 98, column: 9, scope: !321)
!331 = !DILocation(line: 98, column: 24, scope: !321)
!332 = !DILocation(line: 98, column: 17, scope: !321)
!333 = !DILocation(line: 98, column: 15, scope: !321)
!334 = !DILocation(line: 98, column: 30, scope: !321)
!335 = !DILocation(line: 98, column: 8, scope: !321)
!336 = !DILocation(line: 98, column: 2, scope: !321)
!337 = !DILocation(line: 99, column: 19, scope: !321)
!338 = !DILocation(line: 99, column: 2, scope: !321)
!339 = !DILocalVariable(name: "row", scope: !321, file: !3, line: 95, type: !8)
!340 = !DILocation(line: 0, scope: !321)
!341 = !DILocation(line: 100, column: 7, scope: !342)
!342 = distinct !DILexicalBlock(scope: !321, file: !3, line: 100, column: 2)
!343 = !DILocation(line: 0, scope: !342)
!344 = !DILocation(line: 100, column: 22, scope: !345)
!345 = distinct !DILexicalBlock(scope: !342, file: !3, line: 100, column: 2)
!346 = !DILocation(line: 100, column: 20, scope: !345)
!347 = !DILocation(line: 100, column: 27, scope: !345)
!348 = !DILocation(line: 100, column: 2, scope: !342)
!349 = !DILocation(line: 101, column: 3, scope: !345)
!350 = !DILocation(line: 100, column: 36, scope: !345)
!351 = !DILocation(line: 100, column: 2, scope: !345)
!352 = distinct !{!352, !348, !353}
!353 = !DILocation(line: 101, column: 16, scope: !342)
!354 = !DILocation(line: 102, column: 1, scope: !321)
!355 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 104, type: !356, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!356 = !DISubroutineType(types: !357)
!357 = !{!8, !8, !358}
!358 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !359, size: 64)
!359 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!360 = !DILocalVariable(name: "c", arg: 1, scope: !355, file: !3, line: 104, type: !8)
!361 = !DILocation(line: 0, scope: !355)
!362 = !DILocalVariable(name: "v", arg: 2, scope: !355, file: !3, line: 104, type: !358)
!363 = !DILocalVariable(name: "year_set", scope: !355, file: !3, line: 106, type: !8)
!364 = !DILocalVariable(name: "i", scope: !355, file: !3, line: 106, type: !8)
!365 = !DILocation(line: 107, column: 7, scope: !366)
!366 = distinct !DILexicalBlock(scope: !355, file: !3, line: 107, column: 2)
!367 = !DILocation(line: 0, scope: !366)
!368 = !DILocation(line: 107, column: 16, scope: !369)
!369 = distinct !DILexicalBlock(scope: !366, file: !3, line: 107, column: 2)
!370 = !DILocation(line: 107, column: 2, scope: !366)
!371 = !DILocation(line: 108, column: 15, scope: !372)
!372 = distinct !DILexicalBlock(scope: !373, file: !3, line: 108, column: 7)
!373 = distinct !DILexicalBlock(scope: !369, file: !3, line: 107, column: 26)
!374 = !DILocation(line: 108, column: 8, scope: !372)
!375 = !DILocation(line: 108, column: 7, scope: !373)
!376 = !DILocation(line: 109, column: 8, scope: !377)
!377 = distinct !DILexicalBlock(scope: !378, file: !3, line: 109, column: 8)
!378 = distinct !DILexicalBlock(scope: !372, file: !3, line: 108, column: 28)
!379 = !DILocation(line: 109, column: 12, scope: !377)
!380 = !DILocation(line: 109, column: 17, scope: !377)
!381 = !DILocation(line: 109, column: 34, scope: !377)
!382 = !DILocation(line: 109, column: 29, scope: !377)
!383 = !DILocation(line: 109, column: 27, scope: !377)
!384 = !DILocation(line: 109, column: 41, scope: !377)
!385 = !DILocation(line: 109, column: 8, scope: !378)
!386 = !DILocation(line: 110, column: 5, scope: !377)
!387 = !DILocation(line: 111, column: 3, scope: !378)
!388 = !DILocation(line: 111, column: 15, scope: !389)
!389 = distinct !DILexicalBlock(scope: !372, file: !3, line: 111, column: 14)
!390 = !DILocation(line: 111, column: 14, scope: !372)
!391 = !DILocation(line: 112, column: 16, scope: !392)
!392 = distinct !DILexicalBlock(scope: !393, file: !3, line: 112, column: 8)
!393 = distinct !DILexicalBlock(scope: !389, file: !3, line: 111, column: 25)
!394 = !DILocation(line: 112, column: 9, scope: !392)
!395 = !DILocation(line: 112, column: 35, scope: !392)
!396 = !DILocation(line: 112, column: 38, scope: !392)
!397 = !DILocation(line: 112, column: 43, scope: !392)
!398 = !DILocation(line: 112, column: 8, scope: !393)
!399 = !DILocation(line: 113, column: 10, scope: !392)
!400 = !DILocation(line: 113, column: 5, scope: !392)
!401 = !DILocation(line: 115, column: 3, scope: !393)
!402 = !DILocation(line: 116, column: 4, scope: !389)
!403 = !DILocation(line: 117, column: 2, scope: !373)
!404 = !DILocation(line: 107, column: 22, scope: !369)
!405 = !DILocation(line: 107, column: 2, scope: !369)
!406 = distinct !{!406, !370, !407}
!407 = !DILocation(line: 117, column: 2, scope: !366)
!408 = !DILocation(line: 119, column: 2, scope: !355)
!409 = !DILocation(line: 120, column: 2, scope: !355)
!410 = !DILocation(line: 121, column: 2, scope: !355)
!411 = !DILabel(scope: !355, name: "bail", file: !3, line: 123)
!412 = !DILocation(line: 123, column: 1, scope: !355)
!413 = !DILocation(line: 123, column: 15, scope: !355)
!414 = !DILocation(line: 123, column: 72, scope: !355)
!415 = !DILocation(line: 123, column: 7, scope: !355)
!416 = !DILocation(line: 124, column: 2, scope: !355)
