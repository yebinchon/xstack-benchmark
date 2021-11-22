; ModuleID = 'holidays-related-to-easter.c'
source_filename = "holidays-related-to-easter.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.date_t = type { i32, i32, i32, i32 }
%struct.easter_related_t = type { %struct.date_t, %struct.date_t, %struct.date_t, %struct.date_t, %struct.date_t }

@.str = private unnamed_addr constant [4 x i8] c"Jan\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"Feb\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"Mar\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"Apr\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"May\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"Jun\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"Jul\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"Aug\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"Sep\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"Oct\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"Nov\00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c"Dec\00", align 1
@mon_fmt = dso_local global [13 x i8*] [i8* null, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0)], align 16, !dbg !0
@.str.12 = private unnamed_addr constant [4 x i8] c"Sat\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"Sun\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"Mon\00", align 1
@.str.15 = private unnamed_addr constant [4 x i8] c"Tue\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c"Wed\00", align 1
@.str.17 = private unnamed_addr constant [4 x i8] c"Thu\00", align 1
@.str.18 = private unnamed_addr constant [4 x i8] c"Fri\00", align 1
@week_day_fmt = dso_local global [8 x i8*] [i8* null, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.18, i32 0, i32 0)], align 16, !dbg !6
@__const.month_days.days = private unnamed_addr constant [13 x i32] [i32 0, i32 31, i32 28, i32 31, i32 30, i32 31, i32 30, i32 31, i32 31, i32 30, i32 31, i32 30, i32 31], align 16
@year_months = dso_local global i32 12, align 4, !dbg !14
@week_days = dso_local global i32 7, align 4, !dbg !18
@.str.19 = private unnamed_addr constant [106 x i8] c"%4d Easter: %s %2d %s, Ascension: %s %2d %s, Pentecost: %s %2d %s, Trinity: %s %2d %s, Corpus: %s %2d %s\0A\00", align 1
@.str.20 = private unnamed_addr constant [81 x i8] c"Christian holidays, related to Easter, for each centennial from 400 to 2100 CE:\0A\00", align 1
@.str.21 = private unnamed_addr constant [73 x i8] c"\0AChristian holidays, related to Easter, for years from 2010 to 2020 CE:\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @month_days(i32 %year, i32 %month) #0 !dbg !28 {
entry:
  %year.addr = alloca i32, align 4
  %month.addr = alloca i32, align 4
  %days = alloca [13 x i32], align 16
  store i32 %year, i32* %year.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %year.addr, metadata !33, metadata !DIExpression()), !dbg !34
  store i32 %month, i32* %month.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %month.addr, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata [13 x i32]* %days, metadata !37, metadata !DIExpression()), !dbg !39
  %0 = bitcast [13 x i32]* %days to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([13 x i32]* @__const.month_days.days to i8*), i64 52, i1 false), !dbg !39
  %1 = load i32, i32* %month.addr, align 4, !dbg !40
  %cmp = icmp eq i32 %1, 2, !dbg !41
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !42

cond.true:                                        ; preds = %entry
  %2 = load i32, i32* %year.addr, align 4, !dbg !43
  %rem = srem i32 %2, 4, !dbg !44
  %cmp1 = icmp eq i32 %rem, 0, !dbg !45
  br i1 %cmp1, label %land.lhs.true, label %lor.rhs, !dbg !46

land.lhs.true:                                    ; preds = %cond.true
  %3 = load i32, i32* %year.addr, align 4, !dbg !47
  %rem2 = srem i32 %3, 100, !dbg !48
  %cmp3 = icmp ne i32 %rem2, 0, !dbg !49
  br i1 %cmp3, label %lor.end, label %lor.rhs, !dbg !50

lor.rhs:                                          ; preds = %land.lhs.true, %cond.true
  %4 = load i32, i32* %year.addr, align 4, !dbg !51
  %rem4 = srem i32 %4, 400, !dbg !52
  %cmp5 = icmp eq i32 %rem4, 0, !dbg !53
  br label %lor.end, !dbg !50

lor.end:                                          ; preds = %lor.rhs, %land.lhs.true
  %5 = phi i1 [ true, %land.lhs.true ], [ %cmp5, %lor.rhs ]
  %lor.ext = zext i1 %5 to i32, !dbg !50
  %add = add nsw i32 28, %lor.ext, !dbg !54
  br label %cond.end, !dbg !42

cond.false:                                       ; preds = %entry
  %6 = load i32, i32* %month.addr, align 4, !dbg !55
  %idxprom = sext i32 %6 to i64, !dbg !56
  %arrayidx = getelementptr inbounds [13 x i32], [13 x i32]* %days, i64 0, i64 %idxprom, !dbg !56
  %7 = load i32, i32* %arrayidx, align 4, !dbg !56
  br label %cond.end, !dbg !42

cond.end:                                         ; preds = %cond.false, %lor.end
  %cond = phi i32 [ %add, %lor.end ], [ %7, %cond.false ], !dbg !42
  ret i32 %cond, !dbg !57
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @year_days(i32 %year) #0 !dbg !58 {
entry:
  %year.addr = alloca i32, align 4
  store i32 %year, i32* %year.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %year.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = load i32, i32* %year.addr, align 4, !dbg !63
  %call = call i32 @month_days(i32 %0, i32 2), !dbg !64
  %cmp = icmp eq i32 %call, 28, !dbg !65
  %1 = zext i1 %cmp to i64, !dbg !66
  %cond = select i1 %cmp, i32 365, i32 366, !dbg !66
  ret i32 %cond, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i64 } @plusab(%struct.date_t* %date, i32 %days) #0 !dbg !68 {
entry:
  %retval = alloca %struct.date_t, align 4
  %date.addr = alloca %struct.date_t*, align 8
  %days.addr = alloca i32, align 4
  store %struct.date_t* %date, %struct.date_t** %date.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.date_t** %date.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i32 %days, i32* %days.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %days.addr, metadata !81, metadata !DIExpression()), !dbg !82
  br label %while.cond, !dbg !83

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %days.addr, align 4, !dbg !84
  %cmp = icmp slt i32 %0, 0, !dbg !85
  br i1 %cmp, label %while.body, label %while.end, !dbg !83

while.body:                                       ; preds = %while.cond
  %1 = load %struct.date_t*, %struct.date_t** %date.addr, align 8, !dbg !86
  %year = getelementptr inbounds %struct.date_t, %struct.date_t* %1, i32 0, i32 0, !dbg !88
  %2 = load i32, i32* %year, align 4, !dbg !89
  %sub = sub nsw i32 %2, 1, !dbg !89
  store i32 %sub, i32* %year, align 4, !dbg !89
  %3 = load %struct.date_t*, %struct.date_t** %date.addr, align 8, !dbg !90
  %year1 = getelementptr inbounds %struct.date_t, %struct.date_t* %3, i32 0, i32 0, !dbg !91
  %4 = load i32, i32* %year1, align 4, !dbg !91
  %call = call i32 @year_days(i32 %4), !dbg !92
  %5 = load i32, i32* %days.addr, align 4, !dbg !93
  %add = add nsw i32 %5, %call, !dbg !93
  store i32 %add, i32* %days.addr, align 4, !dbg !93
  br label %while.cond, !dbg !83, !llvm.loop !94

while.end:                                        ; preds = %while.cond
  br label %while.cond2, !dbg !96

while.cond2:                                      ; preds = %while.body6, %while.end
  %6 = load i32, i32* %days.addr, align 4, !dbg !97
  %7 = load %struct.date_t*, %struct.date_t** %date.addr, align 8, !dbg !98
  %year3 = getelementptr inbounds %struct.date_t, %struct.date_t* %7, i32 0, i32 0, !dbg !99
  %8 = load i32, i32* %year3, align 4, !dbg !99
  %call4 = call i32 @year_days(i32 %8), !dbg !100
  %cmp5 = icmp sgt i32 %6, %call4, !dbg !101
  br i1 %cmp5, label %while.body6, label %while.end12, !dbg !96

while.body6:                                      ; preds = %while.cond2
  %9 = load %struct.date_t*, %struct.date_t** %date.addr, align 8, !dbg !102
  %year7 = getelementptr inbounds %struct.date_t, %struct.date_t* %9, i32 0, i32 0, !dbg !104
  %10 = load i32, i32* %year7, align 4, !dbg !104
  %call8 = call i32 @year_days(i32 %10), !dbg !105
  %11 = load i32, i32* %days.addr, align 4, !dbg !106
  %sub9 = sub nsw i32 %11, %call8, !dbg !106
  store i32 %sub9, i32* %days.addr, align 4, !dbg !106
  %12 = load %struct.date_t*, %struct.date_t** %date.addr, align 8, !dbg !107
  %year10 = getelementptr inbounds %struct.date_t, %struct.date_t* %12, i32 0, i32 0, !dbg !108
  %13 = load i32, i32* %year10, align 4, !dbg !109
  %add11 = add nsw i32 %13, 1, !dbg !109
  store i32 %add11, i32* %year10, align 4, !dbg !109
  br label %while.cond2, !dbg !96, !llvm.loop !110

while.end12:                                      ; preds = %while.cond2
  %14 = load i32, i32* %days.addr, align 4, !dbg !112
  %15 = load %struct.date_t*, %struct.date_t** %date.addr, align 8, !dbg !113
  %month_day = getelementptr inbounds %struct.date_t, %struct.date_t* %15, i32 0, i32 2, !dbg !114
  %16 = load i32, i32* %month_day, align 4, !dbg !115
  %add13 = add nsw i32 %16, %14, !dbg !115
  store i32 %add13, i32* %month_day, align 4, !dbg !115
  br label %while.cond14, !dbg !116

while.cond14:                                     ; preds = %if.end, %while.end12
  %17 = load %struct.date_t*, %struct.date_t** %date.addr, align 8, !dbg !117
  %month_day15 = getelementptr inbounds %struct.date_t, %struct.date_t* %17, i32 0, i32 2, !dbg !118
  %18 = load i32, i32* %month_day15, align 4, !dbg !118
  %19 = load %struct.date_t*, %struct.date_t** %date.addr, align 8, !dbg !119
  %year16 = getelementptr inbounds %struct.date_t, %struct.date_t* %19, i32 0, i32 0, !dbg !120
  %20 = load i32, i32* %year16, align 4, !dbg !120
  %21 = load %struct.date_t*, %struct.date_t** %date.addr, align 8, !dbg !121
  %month = getelementptr inbounds %struct.date_t, %struct.date_t* %21, i32 0, i32 1, !dbg !122
  %22 = load i32, i32* %month, align 4, !dbg !122
  %call17 = call i32 @month_days(i32 %20, i32 %22), !dbg !123
  %cmp18 = icmp sgt i32 %18, %call17, !dbg !124
  br i1 %cmp18, label %while.body19, label %while.end33, !dbg !116

while.body19:                                     ; preds = %while.cond14
  %23 = load %struct.date_t*, %struct.date_t** %date.addr, align 8, !dbg !125
  %year20 = getelementptr inbounds %struct.date_t, %struct.date_t* %23, i32 0, i32 0, !dbg !127
  %24 = load i32, i32* %year20, align 4, !dbg !127
  %25 = load %struct.date_t*, %struct.date_t** %date.addr, align 8, !dbg !128
  %month21 = getelementptr inbounds %struct.date_t, %struct.date_t* %25, i32 0, i32 1, !dbg !129
  %26 = load i32, i32* %month21, align 4, !dbg !129
  %call22 = call i32 @month_days(i32 %24, i32 %26), !dbg !130
  %27 = load %struct.date_t*, %struct.date_t** %date.addr, align 8, !dbg !131
  %month_day23 = getelementptr inbounds %struct.date_t, %struct.date_t* %27, i32 0, i32 2, !dbg !132
  %28 = load i32, i32* %month_day23, align 4, !dbg !133
  %sub24 = sub nsw i32 %28, %call22, !dbg !133
  store i32 %sub24, i32* %month_day23, align 4, !dbg !133
  %29 = load %struct.date_t*, %struct.date_t** %date.addr, align 8, !dbg !134
  %month25 = getelementptr inbounds %struct.date_t, %struct.date_t* %29, i32 0, i32 1, !dbg !135
  %30 = load i32, i32* %month25, align 4, !dbg !136
  %add26 = add nsw i32 %30, 1, !dbg !136
  store i32 %add26, i32* %month25, align 4, !dbg !136
  %31 = load %struct.date_t*, %struct.date_t** %date.addr, align 8, !dbg !137
  %month27 = getelementptr inbounds %struct.date_t, %struct.date_t* %31, i32 0, i32 1, !dbg !139
  %32 = load i32, i32* %month27, align 4, !dbg !139
  %33 = load i32, i32* @year_months, align 4, !dbg !140
  %cmp28 = icmp sgt i32 %32, %33, !dbg !141
  br i1 %cmp28, label %if.then, label %if.end, !dbg !142, !cf.info !143

if.then:                                          ; preds = %while.body19
  %34 = load i32, i32* @year_months, align 4, !dbg !144
  %35 = load %struct.date_t*, %struct.date_t** %date.addr, align 8, !dbg !146
  %month29 = getelementptr inbounds %struct.date_t, %struct.date_t* %35, i32 0, i32 1, !dbg !147
  %36 = load i32, i32* %month29, align 4, !dbg !148
  %sub30 = sub nsw i32 %36, %34, !dbg !148
  store i32 %sub30, i32* %month29, align 4, !dbg !148
  %37 = load %struct.date_t*, %struct.date_t** %date.addr, align 8, !dbg !149
  %year31 = getelementptr inbounds %struct.date_t, %struct.date_t* %37, i32 0, i32 0, !dbg !150
  %38 = load i32, i32* %year31, align 4, !dbg !151
  %add32 = add nsw i32 %38, 1, !dbg !151
  store i32 %add32, i32* %year31, align 4, !dbg !151
  br label %if.end, !dbg !152

if.end:                                           ; preds = %if.then, %while.body19
  br label %while.cond14, !dbg !116, !llvm.loop !153

while.end33:                                      ; preds = %while.cond14
  %39 = load %struct.date_t*, %struct.date_t** %date.addr, align 8, !dbg !155
  %40 = bitcast %struct.date_t* %39 to { i64, i64 }*, !dbg !156
  %41 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %40, i32 0, i32 0, !dbg !156
  %42 = load i64, i64* %41, align 4, !dbg !156
  %43 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %40, i32 0, i32 1, !dbg !156
  %44 = load i64, i64* %43, align 4, !dbg !156
  %call34 = call i32 @week_day(i64 %42, i64 %44), !dbg !156
  %45 = load %struct.date_t*, %struct.date_t** %date.addr, align 8, !dbg !157
  %week_day = getelementptr inbounds %struct.date_t, %struct.date_t* %45, i32 0, i32 3, !dbg !158
  store i32 %call34, i32* %week_day, align 4, !dbg !159
  %46 = load %struct.date_t*, %struct.date_t** %date.addr, align 8, !dbg !160
  %47 = bitcast %struct.date_t* %retval to i8*, !dbg !161
  %48 = bitcast %struct.date_t* %46 to i8*, !dbg !161
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %47, i8* align 4 %48, i64 16, i1 false), !dbg !161
  %49 = bitcast %struct.date_t* %retval to { i64, i64 }*, !dbg !162
  %50 = load { i64, i64 }, { i64, i64 }* %49, align 4, !dbg !162
  ret { i64, i64 } %50, !dbg !162
}

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i64 } @easter(i32 %year) #0 !dbg !163 {
entry:
  %retval = alloca %struct.date_t, align 4
  %year.addr = alloca i32, align 4
  %c = alloca i32, align 4
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 %year, i32* %year.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %year.addr, metadata !166, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata %struct.date_t* %retval, metadata !168, metadata !DIExpression()), !dbg !169
  %0 = load i32, i32* %year.addr, align 4, !dbg !170
  %year1 = getelementptr inbounds %struct.date_t, %struct.date_t* %retval, i32 0, i32 0, !dbg !171
  store i32 %0, i32* %year1, align 4, !dbg !172
  call void @llvm.dbg.declare(metadata i32* %c, metadata !173, metadata !DIExpression()), !dbg !174
  %1 = load i32, i32* %year.addr, align 4, !dbg !175
  %div = sdiv i32 %1, 100, !dbg !176
  store i32 %div, i32* %c, align 4, !dbg !174
  call void @llvm.dbg.declare(metadata i32* %n, metadata !177, metadata !DIExpression()), !dbg !178
  %2 = load i32, i32* %year.addr, align 4, !dbg !179
  %rem = srem i32 %2, 19, !dbg !180
  store i32 %rem, i32* %n, align 4, !dbg !178
  call void @llvm.dbg.declare(metadata i32* %i, metadata !181, metadata !DIExpression()), !dbg !182
  %3 = load i32, i32* %c, align 4, !dbg !183
  %4 = load i32, i32* %c, align 4, !dbg !184
  %div2 = sdiv i32 %4, 4, !dbg !185
  %sub = sub nsw i32 %3, %div2, !dbg !186
  %5 = load i32, i32* %c, align 4, !dbg !187
  %6 = load i32, i32* %c, align 4, !dbg !188
  %sub3 = sub nsw i32 %6, 17, !dbg !189
  %div4 = sdiv i32 %sub3, 25, !dbg !190
  %sub5 = sub nsw i32 %5, %div4, !dbg !191
  %div6 = sdiv i32 %sub5, 3, !dbg !192
  %sub7 = sub nsw i32 %sub, %div6, !dbg !193
  %7 = load i32, i32* %n, align 4, !dbg !194
  %mul = mul nsw i32 19, %7, !dbg !195
  %add = add nsw i32 %sub7, %mul, !dbg !196
  %add8 = add nsw i32 %add, 15, !dbg !197
  %rem9 = srem i32 %add8, 30, !dbg !198
  store i32 %rem9, i32* %i, align 4, !dbg !182
  %8 = load i32, i32* %i, align 4, !dbg !199
  %div10 = sdiv i32 %8, 28, !dbg !200
  %9 = load i32, i32* %i, align 4, !dbg !201
  %div11 = sdiv i32 %9, 28, !dbg !202
  %10 = load i32, i32* %i, align 4, !dbg !203
  %add12 = add nsw i32 %10, 1, !dbg !204
  %div13 = sdiv i32 29, %add12, !dbg !205
  %mul14 = mul nsw i32 %div11, %div13, !dbg !206
  %11 = load i32, i32* %n, align 4, !dbg !207
  %sub15 = sub nsw i32 21, %11, !dbg !208
  %div16 = sdiv i32 %sub15, 11, !dbg !209
  %mul17 = mul nsw i32 %mul14, %div16, !dbg !210
  %sub18 = sub nsw i32 1, %mul17, !dbg !211
  %mul19 = mul nsw i32 %div10, %sub18, !dbg !212
  %12 = load i32, i32* %i, align 4, !dbg !213
  %sub20 = sub nsw i32 %12, %mul19, !dbg !213
  store i32 %sub20, i32* %i, align 4, !dbg !213
  call void @llvm.dbg.declare(metadata i32* %l, metadata !214, metadata !DIExpression()), !dbg !215
  %13 = load i32, i32* %i, align 4, !dbg !216
  %14 = load i32, i32* %year.addr, align 4, !dbg !217
  %15 = load i32, i32* %year.addr, align 4, !dbg !218
  %div21 = sdiv i32 %15, 4, !dbg !219
  %add22 = add nsw i32 %14, %div21, !dbg !220
  %16 = load i32, i32* %i, align 4, !dbg !221
  %add23 = add nsw i32 %add22, %16, !dbg !222
  %add24 = add nsw i32 %add23, 2, !dbg !223
  %17 = load i32, i32* %c, align 4, !dbg !224
  %sub25 = sub nsw i32 %add24, %17, !dbg !225
  %18 = load i32, i32* %c, align 4, !dbg !226
  %div26 = sdiv i32 %18, 4, !dbg !227
  %add27 = add nsw i32 %sub25, %div26, !dbg !228
  %rem28 = srem i32 %add27, 7, !dbg !229
  %sub29 = sub nsw i32 %13, %rem28, !dbg !230
  store i32 %sub29, i32* %l, align 4, !dbg !215
  %19 = load i32, i32* %l, align 4, !dbg !231
  %add30 = add nsw i32 %19, 40, !dbg !232
  %div31 = sdiv i32 %add30, 44, !dbg !233
  %add32 = add nsw i32 3, %div31, !dbg !234
  %month = getelementptr inbounds %struct.date_t, %struct.date_t* %retval, i32 0, i32 1, !dbg !235
  store i32 %add32, i32* %month, align 4, !dbg !236
  %20 = load i32, i32* %l, align 4, !dbg !237
  %add33 = add nsw i32 %20, 28, !dbg !238
  %month34 = getelementptr inbounds %struct.date_t, %struct.date_t* %retval, i32 0, i32 1, !dbg !239
  %21 = load i32, i32* %month34, align 4, !dbg !239
  %div35 = sdiv i32 %21, 4, !dbg !240
  %mul36 = mul nsw i32 31, %div35, !dbg !241
  %sub37 = sub nsw i32 %add33, %mul36, !dbg !242
  %month_day = getelementptr inbounds %struct.date_t, %struct.date_t* %retval, i32 0, i32 2, !dbg !243
  store i32 %sub37, i32* %month_day, align 4, !dbg !244
  %22 = bitcast %struct.date_t* %retval to { i64, i64 }*, !dbg !245
  %23 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %22, i32 0, i32 0, !dbg !245
  %24 = load i64, i64* %23, align 4, !dbg !245
  %25 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %22, i32 0, i32 1, !dbg !245
  %26 = load i64, i64* %25, align 4, !dbg !245
  %call = call i32 @week_day(i64 %24, i64 %26), !dbg !245
  %week_day = getelementptr inbounds %struct.date_t, %struct.date_t* %retval, i32 0, i32 3, !dbg !246
  store i32 %call, i32* %week_day, align 4, !dbg !247
  %27 = bitcast %struct.date_t* %retval to { i64, i64 }*, !dbg !248
  %28 = load { i64, i64 }, { i64, i64 }* %27, align 4, !dbg !248
  ret { i64, i64 } %28, !dbg !248
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @week_day(i64 %date.coerce0, i64 %date.coerce1) #0 !dbg !249 {
entry:
  %date = alloca %struct.date_t, align 4
  %year = alloca i32, align 4
  %month = alloca i32, align 4
  %month_day = alloca i32, align 4
  %c = alloca i32, align 4
  %0 = bitcast %struct.date_t* %date to { i64, i64 }*
  %1 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 0
  store i64 %date.coerce0, i64* %1, align 4
  %2 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 1
  store i64 %date.coerce1, i64* %2, align 4
  call void @llvm.dbg.declare(metadata %struct.date_t* %date, metadata !252, metadata !DIExpression()), !dbg !253
  call void @llvm.dbg.declare(metadata i32* %year, metadata !254, metadata !DIExpression()), !dbg !255
  %year1 = getelementptr inbounds %struct.date_t, %struct.date_t* %date, i32 0, i32 0, !dbg !256
  %3 = load i32, i32* %year1, align 4, !dbg !256
  store i32 %3, i32* %year, align 4, !dbg !255
  call void @llvm.dbg.declare(metadata i32* %month, metadata !257, metadata !DIExpression()), !dbg !258
  %month2 = getelementptr inbounds %struct.date_t, %struct.date_t* %date, i32 0, i32 1, !dbg !259
  %4 = load i32, i32* %month2, align 4, !dbg !259
  store i32 %4, i32* %month, align 4, !dbg !258
  call void @llvm.dbg.declare(metadata i32* %month_day, metadata !260, metadata !DIExpression()), !dbg !261
  %month_day3 = getelementptr inbounds %struct.date_t, %struct.date_t* %date, i32 0, i32 2, !dbg !262
  %5 = load i32, i32* %month_day3, align 4, !dbg !262
  store i32 %5, i32* %month_day, align 4, !dbg !261
  call void @llvm.dbg.declare(metadata i32* %c, metadata !263, metadata !DIExpression()), !dbg !264
  %6 = load i32, i32* %month, align 4, !dbg !265
  %cmp = icmp sle i32 %6, 2, !dbg !267
  br i1 %cmp, label %if.then, label %if.end, !dbg !268, !cf.info !143

if.then:                                          ; preds = %entry
  %7 = load i32, i32* %month, align 4, !dbg !269
  %add = add nsw i32 %7, 12, !dbg !269
  store i32 %add, i32* %month, align 4, !dbg !269
  %8 = load i32, i32* %year, align 4, !dbg !271
  %sub = sub nsw i32 %8, 1, !dbg !271
  store i32 %sub, i32* %year, align 4, !dbg !271
  br label %if.end, !dbg !272

if.end:                                           ; preds = %if.then, %entry
  %9 = load i32, i32* %year, align 4, !dbg !273
  %div = sdiv i32 %9, 100, !dbg !274
  store i32 %div, i32* %c, align 4, !dbg !275
  %10 = load i32, i32* %year, align 4, !dbg !276
  %rem = srem i32 %10, 100, !dbg !276
  store i32 %rem, i32* %year, align 4, !dbg !276
  %11 = load i32, i32* %month_day, align 4, !dbg !277
  %12 = load i32, i32* %month, align 4, !dbg !278
  %add4 = add nsw i32 %12, 1, !dbg !279
  %mul = mul nsw i32 %add4, 26, !dbg !280
  %div5 = sdiv i32 %mul, 10, !dbg !281
  %add6 = add nsw i32 %11, %div5, !dbg !282
  %13 = load i32, i32* %year, align 4, !dbg !283
  %add7 = add nsw i32 %add6, %13, !dbg !284
  %14 = load i32, i32* %year, align 4, !dbg !285
  %div8 = sdiv i32 %14, 4, !dbg !286
  %add9 = add nsw i32 %add7, %div8, !dbg !287
  %15 = load i32, i32* %c, align 4, !dbg !288
  %div10 = sdiv i32 %15, 4, !dbg !289
  %add11 = add nsw i32 %add9, %div10, !dbg !290
  %16 = load i32, i32* %c, align 4, !dbg !291
  %mul12 = mul nsw i32 2, %16, !dbg !292
  %sub13 = sub nsw i32 %add11, %mul12, !dbg !293
  %rem14 = srem i32 %sub13, 7, !dbg !294
  %add15 = add nsw i32 %rem14, 7, !dbg !295
  %rem16 = srem i32 %add15, 7, !dbg !296
  %add17 = add nsw i32 1, %rem16, !dbg !297
  ret i32 %add17, !dbg !298
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @easter_related_init(%struct.easter_related_t* noalias sret %agg.result, i32 %year) #0 !dbg !299 {
entry:
  %year.addr = alloca i32, align 4
  %date = alloca %struct.date_t, align 4
  %tmp = alloca %struct.date_t, align 4
  %tmp1 = alloca %struct.date_t, align 4
  %tmp3 = alloca %struct.date_t, align 4
  %tmp5 = alloca %struct.date_t, align 4
  %tmp7 = alloca %struct.date_t, align 4
  store i32 %year, i32* %year.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %year.addr, metadata !310, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.declare(metadata %struct.date_t* %date, metadata !312, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.declare(metadata %struct.easter_related_t* %agg.result, metadata !314, metadata !DIExpression()), !dbg !315
  %easter = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %agg.result, i32 0, i32 0, !dbg !316
  %0 = load i32, i32* %year.addr, align 4, !dbg !317
  %call = call { i64, i64 } @easter(i32 %0), !dbg !318
  %1 = bitcast %struct.date_t* %tmp to { i64, i64 }*, !dbg !318
  %2 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %1, i32 0, i32 0, !dbg !318
  %3 = extractvalue { i64, i64 } %call, 0, !dbg !318
  store i64 %3, i64* %2, align 4, !dbg !318
  %4 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %1, i32 0, i32 1, !dbg !318
  %5 = extractvalue { i64, i64 } %call, 1, !dbg !318
  store i64 %5, i64* %4, align 4, !dbg !318
  %6 = bitcast %struct.date_t* %date to i8*, !dbg !318
  %7 = bitcast %struct.date_t* %tmp to i8*, !dbg !318
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 4 %7, i64 16, i1 false), !dbg !318
  %8 = bitcast %struct.date_t* %easter to i8*, !dbg !319
  %9 = bitcast %struct.date_t* %date to i8*, !dbg !319
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 4 %9, i64 16, i1 false), !dbg !319
  %ascension = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %agg.result, i32 0, i32 1, !dbg !320
  %call2 = call { i64, i64 } @plusab(%struct.date_t* %date, i32 39), !dbg !321
  %10 = bitcast %struct.date_t* %tmp1 to { i64, i64 }*, !dbg !321
  %11 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %10, i32 0, i32 0, !dbg !321
  %12 = extractvalue { i64, i64 } %call2, 0, !dbg !321
  store i64 %12, i64* %11, align 4, !dbg !321
  %13 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %10, i32 0, i32 1, !dbg !321
  %14 = extractvalue { i64, i64 } %call2, 1, !dbg !321
  store i64 %14, i64* %13, align 4, !dbg !321
  %15 = bitcast %struct.date_t* %ascension to i8*, !dbg !321
  %16 = bitcast %struct.date_t* %tmp1 to i8*, !dbg !321
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %15, i8* align 4 %16, i64 16, i1 false), !dbg !321
  %pentecost = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %agg.result, i32 0, i32 2, !dbg !322
  %call4 = call { i64, i64 } @plusab(%struct.date_t* %date, i32 10), !dbg !323
  %17 = bitcast %struct.date_t* %tmp3 to { i64, i64 }*, !dbg !323
  %18 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %17, i32 0, i32 0, !dbg !323
  %19 = extractvalue { i64, i64 } %call4, 0, !dbg !323
  store i64 %19, i64* %18, align 4, !dbg !323
  %20 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %17, i32 0, i32 1, !dbg !323
  %21 = extractvalue { i64, i64 } %call4, 1, !dbg !323
  store i64 %21, i64* %20, align 4, !dbg !323
  %22 = bitcast %struct.date_t* %pentecost to i8*, !dbg !323
  %23 = bitcast %struct.date_t* %tmp3 to i8*, !dbg !323
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %22, i8* align 4 %23, i64 16, i1 false), !dbg !323
  %trinity = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %agg.result, i32 0, i32 3, !dbg !324
  %call6 = call { i64, i64 } @plusab(%struct.date_t* %date, i32 7), !dbg !325
  %24 = bitcast %struct.date_t* %tmp5 to { i64, i64 }*, !dbg !325
  %25 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %24, i32 0, i32 0, !dbg !325
  %26 = extractvalue { i64, i64 } %call6, 0, !dbg !325
  store i64 %26, i64* %25, align 4, !dbg !325
  %27 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %24, i32 0, i32 1, !dbg !325
  %28 = extractvalue { i64, i64 } %call6, 1, !dbg !325
  store i64 %28, i64* %27, align 4, !dbg !325
  %29 = bitcast %struct.date_t* %trinity to i8*, !dbg !325
  %30 = bitcast %struct.date_t* %tmp5 to i8*, !dbg !325
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %29, i8* align 4 %30, i64 16, i1 false), !dbg !325
  %corpus_christi = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %agg.result, i32 0, i32 4, !dbg !326
  %call8 = call { i64, i64 } @plusab(%struct.date_t* %date, i32 4), !dbg !327
  %31 = bitcast %struct.date_t* %tmp7 to { i64, i64 }*, !dbg !327
  %32 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %31, i32 0, i32 0, !dbg !327
  %33 = extractvalue { i64, i64 } %call8, 0, !dbg !327
  store i64 %33, i64* %32, align 4, !dbg !327
  %34 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %31, i32 0, i32 1, !dbg !327
  %35 = extractvalue { i64, i64 } %call8, 1, !dbg !327
  store i64 %35, i64* %34, align 4, !dbg !327
  %36 = bitcast %struct.date_t* %corpus_christi to i8*, !dbg !327
  %37 = bitcast %struct.date_t* %tmp7 to i8*, !dbg !327
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %36, i8* align 4 %37, i64 16, i1 false), !dbg !327
  ret void, !dbg !328
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @easter_related_print(i32 %year) #0 !dbg !329 {
entry:
  %year.addr = alloca i32, align 4
  %holidays = alloca %struct.easter_related_t, align 4
  store i32 %year, i32* %year.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %year.addr, metadata !332, metadata !DIExpression()), !dbg !333
  call void @llvm.dbg.declare(metadata %struct.easter_related_t* %holidays, metadata !334, metadata !DIExpression()), !dbg !335
  %0 = load i32, i32* %year.addr, align 4, !dbg !336
  call void @easter_related_init(%struct.easter_related_t* sret %holidays, i32 %0), !dbg !337
  %1 = load i32, i32* %year.addr, align 4, !dbg !338
  %easter = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %holidays, i32 0, i32 0, !dbg !339
  %week_day = getelementptr inbounds %struct.date_t, %struct.date_t* %easter, i32 0, i32 3, !dbg !339
  %2 = load i32, i32* %week_day, align 4, !dbg !339
  %idxprom = sext i32 %2 to i64, !dbg !339
  %arrayidx = getelementptr inbounds [8 x i8*], [8 x i8*]* @week_day_fmt, i64 0, i64 %idxprom, !dbg !339
  %3 = load i8*, i8** %arrayidx, align 8, !dbg !339
  %easter1 = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %holidays, i32 0, i32 0, !dbg !339
  %month_day = getelementptr inbounds %struct.date_t, %struct.date_t* %easter1, i32 0, i32 2, !dbg !339
  %4 = load i32, i32* %month_day, align 4, !dbg !339
  %easter2 = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %holidays, i32 0, i32 0, !dbg !339
  %month = getelementptr inbounds %struct.date_t, %struct.date_t* %easter2, i32 0, i32 1, !dbg !339
  %5 = load i32, i32* %month, align 4, !dbg !339
  %idxprom3 = sext i32 %5 to i64, !dbg !339
  %arrayidx4 = getelementptr inbounds [13 x i8*], [13 x i8*]* @mon_fmt, i64 0, i64 %idxprom3, !dbg !339
  %6 = load i8*, i8** %arrayidx4, align 8, !dbg !339
  %ascension = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %holidays, i32 0, i32 1, !dbg !340
  %week_day5 = getelementptr inbounds %struct.date_t, %struct.date_t* %ascension, i32 0, i32 3, !dbg !340
  %7 = load i32, i32* %week_day5, align 4, !dbg !340
  %idxprom6 = sext i32 %7 to i64, !dbg !340
  %arrayidx7 = getelementptr inbounds [8 x i8*], [8 x i8*]* @week_day_fmt, i64 0, i64 %idxprom6, !dbg !340
  %8 = load i8*, i8** %arrayidx7, align 8, !dbg !340
  %ascension8 = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %holidays, i32 0, i32 1, !dbg !340
  %month_day9 = getelementptr inbounds %struct.date_t, %struct.date_t* %ascension8, i32 0, i32 2, !dbg !340
  %9 = load i32, i32* %month_day9, align 4, !dbg !340
  %ascension10 = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %holidays, i32 0, i32 1, !dbg !340
  %month11 = getelementptr inbounds %struct.date_t, %struct.date_t* %ascension10, i32 0, i32 1, !dbg !340
  %10 = load i32, i32* %month11, align 4, !dbg !340
  %idxprom12 = sext i32 %10 to i64, !dbg !340
  %arrayidx13 = getelementptr inbounds [13 x i8*], [13 x i8*]* @mon_fmt, i64 0, i64 %idxprom12, !dbg !340
  %11 = load i8*, i8** %arrayidx13, align 8, !dbg !340
  %pentecost = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %holidays, i32 0, i32 2, !dbg !341
  %week_day14 = getelementptr inbounds %struct.date_t, %struct.date_t* %pentecost, i32 0, i32 3, !dbg !341
  %12 = load i32, i32* %week_day14, align 4, !dbg !341
  %idxprom15 = sext i32 %12 to i64, !dbg !341
  %arrayidx16 = getelementptr inbounds [8 x i8*], [8 x i8*]* @week_day_fmt, i64 0, i64 %idxprom15, !dbg !341
  %13 = load i8*, i8** %arrayidx16, align 8, !dbg !341
  %pentecost17 = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %holidays, i32 0, i32 2, !dbg !341
  %month_day18 = getelementptr inbounds %struct.date_t, %struct.date_t* %pentecost17, i32 0, i32 2, !dbg !341
  %14 = load i32, i32* %month_day18, align 4, !dbg !341
  %pentecost19 = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %holidays, i32 0, i32 2, !dbg !341
  %month20 = getelementptr inbounds %struct.date_t, %struct.date_t* %pentecost19, i32 0, i32 1, !dbg !341
  %15 = load i32, i32* %month20, align 4, !dbg !341
  %idxprom21 = sext i32 %15 to i64, !dbg !341
  %arrayidx22 = getelementptr inbounds [13 x i8*], [13 x i8*]* @mon_fmt, i64 0, i64 %idxprom21, !dbg !341
  %16 = load i8*, i8** %arrayidx22, align 8, !dbg !341
  %trinity = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %holidays, i32 0, i32 3, !dbg !342
  %week_day23 = getelementptr inbounds %struct.date_t, %struct.date_t* %trinity, i32 0, i32 3, !dbg !342
  %17 = load i32, i32* %week_day23, align 4, !dbg !342
  %idxprom24 = sext i32 %17 to i64, !dbg !342
  %arrayidx25 = getelementptr inbounds [8 x i8*], [8 x i8*]* @week_day_fmt, i64 0, i64 %idxprom24, !dbg !342
  %18 = load i8*, i8** %arrayidx25, align 8, !dbg !342
  %trinity26 = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %holidays, i32 0, i32 3, !dbg !342
  %month_day27 = getelementptr inbounds %struct.date_t, %struct.date_t* %trinity26, i32 0, i32 2, !dbg !342
  %19 = load i32, i32* %month_day27, align 4, !dbg !342
  %trinity28 = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %holidays, i32 0, i32 3, !dbg !342
  %month29 = getelementptr inbounds %struct.date_t, %struct.date_t* %trinity28, i32 0, i32 1, !dbg !342
  %20 = load i32, i32* %month29, align 4, !dbg !342
  %idxprom30 = sext i32 %20 to i64, !dbg !342
  %arrayidx31 = getelementptr inbounds [13 x i8*], [13 x i8*]* @mon_fmt, i64 0, i64 %idxprom30, !dbg !342
  %21 = load i8*, i8** %arrayidx31, align 8, !dbg !342
  %corpus_christi = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %holidays, i32 0, i32 4, !dbg !343
  %week_day32 = getelementptr inbounds %struct.date_t, %struct.date_t* %corpus_christi, i32 0, i32 3, !dbg !343
  %22 = load i32, i32* %week_day32, align 4, !dbg !343
  %idxprom33 = sext i32 %22 to i64, !dbg !343
  %arrayidx34 = getelementptr inbounds [8 x i8*], [8 x i8*]* @week_day_fmt, i64 0, i64 %idxprom33, !dbg !343
  %23 = load i8*, i8** %arrayidx34, align 8, !dbg !343
  %corpus_christi35 = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %holidays, i32 0, i32 4, !dbg !343
  %month_day36 = getelementptr inbounds %struct.date_t, %struct.date_t* %corpus_christi35, i32 0, i32 2, !dbg !343
  %24 = load i32, i32* %month_day36, align 4, !dbg !343
  %corpus_christi37 = getelementptr inbounds %struct.easter_related_t, %struct.easter_related_t* %holidays, i32 0, i32 4, !dbg !343
  %month38 = getelementptr inbounds %struct.date_t, %struct.date_t* %corpus_christi37, i32 0, i32 1, !dbg !343
  %25 = load i32, i32* %month38, align 4, !dbg !343
  %idxprom39 = sext i32 %25 to i64, !dbg !343
  %arrayidx40 = getelementptr inbounds [13 x i8*], [13 x i8*]* @mon_fmt, i64 0, i64 %idxprom39, !dbg !343
  %26 = load i8*, i8** %arrayidx40, align 8, !dbg !343
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([106 x i8], [106 x i8]* @.str.19, i64 0, i64 0), i32 %1, i8* %3, i32 %4, i8* %6, i8* %8, i32 %9, i8* %11, i8* %13, i32 %14, i8* %16, i8* %18, i32 %19, i8* %21, i8* %23, i32 %24, i8* %26), !dbg !344
  ret void, !dbg !345
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !346 {
entry:
  %retval = alloca i32, align 4
  %year = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %year, metadata !349, metadata !DIExpression()), !dbg !350
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.20, i64 0, i64 0)), !dbg !351
  store i32 400, i32* %year, align 4, !dbg !352
  br label %for.cond, !dbg !354

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %year, align 4, !dbg !355
  %cmp = icmp sle i32 %0, 2100, !dbg !357
  br i1 %cmp, label %for.body, label %for.end, !dbg !358

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %year, align 4, !dbg !359
  call void @easter_related_print(i32 %1), !dbg !361
  br label %for.inc, !dbg !362

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %year, align 4, !dbg !363
  %add = add nsw i32 %2, 100, !dbg !363
  store i32 %add, i32* %year, align 4, !dbg !363
  br label %for.cond, !dbg !364, !llvm.loop !365

for.end:                                          ; preds = %for.cond
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.21, i64 0, i64 0)), !dbg !367
  store i32 2010, i32* %year, align 4, !dbg !368
  br label %for.cond2, !dbg !370

for.cond2:                                        ; preds = %for.inc5, %for.end
  %3 = load i32, i32* %year, align 4, !dbg !371
  %cmp3 = icmp sle i32 %3, 2020, !dbg !373
  br i1 %cmp3, label %for.body4, label %for.end6, !dbg !374

for.body4:                                        ; preds = %for.cond2
  %4 = load i32, i32* %year, align 4, !dbg !375
  call void @easter_related_print(i32 %4), !dbg !377
  br label %for.inc5, !dbg !378

for.inc5:                                         ; preds = %for.body4
  %5 = load i32, i32* %year, align 4, !dbg !379
  %inc = add nsw i32 %5, 1, !dbg !379
  store i32 %inc, i32* %year, align 4, !dbg !379
  br label %for.cond2, !dbg !380, !llvm.loop !381

for.end6:                                         ; preds = %for.cond2
  ret i32 0, !dbg !383
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "mon_fmt", scope: !2, file: !3, line: 10, type: !21, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "holidays-related-to-easter.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Holidays-related-to-Easter")
!4 = !{}
!5 = !{!0, !6, !14, !18}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "week_day_fmt", scope: !2, file: !3, line: 12, type: !8, isLocal: false, isDefinition: true)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 512, elements: !12)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !{!13}
!13 = !DISubrange(count: 8)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "year_months", scope: !2, file: !3, line: 22, type: !16, isLocal: false, isDefinition: true)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "month_t", file: !3, line: 3, baseType: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "week_days", scope: !2, file: !3, line: 23, type: !20, isLocal: false, isDefinition: true)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "week_t", file: !3, line: 3, baseType: !17)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 832, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 13)
!24 = !{i32 7, !"Dwarf Version", i32 4}
!25 = !{i32 2, !"Debug Info Version", i32 3}
!26 = !{i32 1, !"wchar_size", i32 4}
!27 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!28 = distinct !DISubprogram(name: "month_days", scope: !3, file: !3, line: 14, type: !29, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!29 = !DISubroutineType(types: !30)
!30 = !{!31, !32, !16}
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "day_t", file: !3, line: 3, baseType: !17)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "year_t", file: !3, line: 3, baseType: !17)
!33 = !DILocalVariable(name: "year", arg: 1, scope: !28, file: !3, line: 14, type: !32)
!34 = !DILocation(line: 14, column: 25, scope: !28)
!35 = !DILocalVariable(name: "month", arg: 2, scope: !28, file: !3, line: 14, type: !16)
!36 = !DILocation(line: 14, column: 39, scope: !28)
!37 = !DILocalVariable(name: "days", scope: !28, file: !3, line: 15, type: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 416, elements: !22)
!39 = !DILocation(line: 15, column: 11, scope: !28)
!40 = !DILocation(line: 16, column: 13, scope: !28)
!41 = !DILocation(line: 16, column: 18, scope: !28)
!42 = !DILocation(line: 16, column: 12, scope: !28)
!43 = !DILocation(line: 16, column: 33, scope: !28)
!44 = !DILocation(line: 16, column: 38, scope: !28)
!45 = !DILocation(line: 16, column: 42, scope: !28)
!46 = !DILocation(line: 16, column: 47, scope: !28)
!47 = !DILocation(line: 16, column: 50, scope: !28)
!48 = !DILocation(line: 16, column: 55, scope: !28)
!49 = !DILocation(line: 16, column: 61, scope: !28)
!50 = !DILocation(line: 16, column: 68, scope: !28)
!51 = !DILocation(line: 16, column: 71, scope: !28)
!52 = !DILocation(line: 16, column: 76, scope: !28)
!53 = !DILocation(line: 16, column: 82, scope: !28)
!54 = !DILocation(line: 16, column: 28, scope: !28)
!55 = !DILocation(line: 16, column: 95, scope: !28)
!56 = !DILocation(line: 16, column: 90, scope: !28)
!57 = !DILocation(line: 16, column: 5, scope: !28)
!58 = distinct !DISubprogram(name: "year_days", scope: !3, file: !3, line: 19, type: !59, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!31, !32}
!61 = !DILocalVariable(name: "year", arg: 1, scope: !58, file: !3, line: 19, type: !32)
!62 = !DILocation(line: 19, column: 24, scope: !58)
!63 = !DILocation(line: 20, column: 24, scope: !58)
!64 = !DILocation(line: 20, column: 13, scope: !58)
!65 = !DILocation(line: 20, column: 33, scope: !58)
!66 = !DILocation(line: 20, column: 12, scope: !58)
!67 = !DILocation(line: 20, column: 5, scope: !58)
!68 = distinct !DISubprogram(name: "plusab", scope: !3, file: !3, line: 25, type: !69, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DISubroutineType(types: !70)
!70 = !{!71, !78, !31}
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "date_t", file: !3, line: 8, baseType: !72)
!72 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 5, size: 128, elements: !73)
!73 = !{!74, !75, !76, !77}
!74 = !DIDerivedType(tag: DW_TAG_member, name: "year", scope: !72, file: !3, line: 6, baseType: !32, size: 32)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "month", scope: !72, file: !3, line: 7, baseType: !16, size: 32, offset: 32)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "month_day", scope: !72, file: !3, line: 7, baseType: !31, size: 32, offset: 64)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "week_day", scope: !72, file: !3, line: 8, baseType: !31, size: 32, offset: 96)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!79 = !DILocalVariable(name: "date", arg: 1, scope: !68, file: !3, line: 25, type: !78)
!80 = !DILocation(line: 25, column: 23, scope: !68)
!81 = !DILocalVariable(name: "days", arg: 2, scope: !68, file: !3, line: 25, type: !31)
!82 = !DILocation(line: 25, column: 35, scope: !68)
!83 = !DILocation(line: 28, column: 8, scope: !68)
!84 = !DILocation(line: 28, column: 14, scope: !68)
!85 = !DILocation(line: 28, column: 19, scope: !68)
!86 = !DILocation(line: 29, column: 10, scope: !87)
!87 = distinct !DILexicalBlock(scope: !68, file: !3, line: 28, column: 23)
!88 = !DILocation(line: 29, column: 16, scope: !87)
!89 = !DILocation(line: 29, column: 21, scope: !87)
!90 = !DILocation(line: 30, column: 28, scope: !87)
!91 = !DILocation(line: 30, column: 34, scope: !87)
!92 = !DILocation(line: 30, column: 18, scope: !87)
!93 = !DILocation(line: 30, column: 15, scope: !87)
!94 = distinct !{!94, !83, !95}
!95 = !DILocation(line: 31, column: 8, scope: !68)
!96 = !DILocation(line: 32, column: 8, scope: !68)
!97 = !DILocation(line: 32, column: 14, scope: !68)
!98 = !DILocation(line: 32, column: 31, scope: !68)
!99 = !DILocation(line: 32, column: 37, scope: !68)
!100 = !DILocation(line: 32, column: 21, scope: !68)
!101 = !DILocation(line: 32, column: 19, scope: !68)
!102 = !DILocation(line: 33, column: 28, scope: !103)
!103 = distinct !DILexicalBlock(scope: !68, file: !3, line: 32, column: 43)
!104 = !DILocation(line: 33, column: 34, scope: !103)
!105 = !DILocation(line: 33, column: 18, scope: !103)
!106 = !DILocation(line: 33, column: 15, scope: !103)
!107 = !DILocation(line: 34, column: 10, scope: !103)
!108 = !DILocation(line: 34, column: 16, scope: !103)
!109 = !DILocation(line: 34, column: 21, scope: !103)
!110 = distinct !{!110, !96, !111}
!111 = !DILocation(line: 35, column: 8, scope: !68)
!112 = !DILocation(line: 36, column: 27, scope: !68)
!113 = !DILocation(line: 36, column: 8, scope: !68)
!114 = !DILocation(line: 36, column: 14, scope: !68)
!115 = !DILocation(line: 36, column: 24, scope: !68)
!116 = !DILocation(line: 38, column: 8, scope: !68)
!117 = !DILocation(line: 38, column: 14, scope: !68)
!118 = !DILocation(line: 38, column: 20, scope: !68)
!119 = !DILocation(line: 38, column: 43, scope: !68)
!120 = !DILocation(line: 38, column: 49, scope: !68)
!121 = !DILocation(line: 38, column: 55, scope: !68)
!122 = !DILocation(line: 38, column: 61, scope: !68)
!123 = !DILocation(line: 38, column: 32, scope: !68)
!124 = !DILocation(line: 38, column: 30, scope: !68)
!125 = !DILocation(line: 39, column: 41, scope: !126)
!126 = distinct !DILexicalBlock(scope: !68, file: !3, line: 38, column: 68)
!127 = !DILocation(line: 39, column: 47, scope: !126)
!128 = !DILocation(line: 39, column: 53, scope: !126)
!129 = !DILocation(line: 39, column: 59, scope: !126)
!130 = !DILocation(line: 39, column: 30, scope: !126)
!131 = !DILocation(line: 39, column: 11, scope: !126)
!132 = !DILocation(line: 39, column: 17, scope: !126)
!133 = !DILocation(line: 39, column: 27, scope: !126)
!134 = !DILocation(line: 40, column: 11, scope: !126)
!135 = !DILocation(line: 40, column: 17, scope: !126)
!136 = !DILocation(line: 40, column: 23, scope: !126)
!137 = !DILocation(line: 41, column: 14, scope: !138)
!138 = distinct !DILexicalBlock(scope: !126, file: !3, line: 41, column: 14)
!139 = !DILocation(line: 41, column: 20, scope: !138)
!140 = !DILocation(line: 41, column: 28, scope: !138)
!141 = !DILocation(line: 41, column: 26, scope: !138)
!142 = !DILocation(line: 41, column: 14, scope: !126)
!143 = !{!"if"}
!144 = !DILocation(line: 42, column: 29, scope: !145)
!145 = distinct !DILexicalBlock(scope: !138, file: !3, line: 41, column: 40)
!146 = !DILocation(line: 42, column: 14, scope: !145)
!147 = !DILocation(line: 42, column: 20, scope: !145)
!148 = !DILocation(line: 42, column: 26, scope: !145)
!149 = !DILocation(line: 43, column: 14, scope: !145)
!150 = !DILocation(line: 43, column: 20, scope: !145)
!151 = !DILocation(line: 43, column: 25, scope: !145)
!152 = !DILocation(line: 44, column: 11, scope: !145)
!153 = distinct !{!153, !116, !154}
!154 = !DILocation(line: 45, column: 8, scope: !68)
!155 = !DILocation(line: 46, column: 35, scope: !68)
!156 = !DILocation(line: 46, column: 25, scope: !68)
!157 = !DILocation(line: 46, column: 8, scope: !68)
!158 = !DILocation(line: 46, column: 14, scope: !68)
!159 = !DILocation(line: 46, column: 23, scope: !68)
!160 = !DILocation(line: 47, column: 16, scope: !68)
!161 = !DILocation(line: 47, column: 15, scope: !68)
!162 = !DILocation(line: 47, column: 8, scope: !68)
!163 = distinct !DISubprogram(name: "easter", scope: !3, file: !3, line: 50, type: !164, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!164 = !DISubroutineType(types: !165)
!165 = !{!71, !32}
!166 = !DILocalVariable(name: "year", arg: 1, scope: !163, file: !3, line: 50, type: !32)
!167 = !DILocation(line: 50, column: 23, scope: !163)
!168 = !DILocalVariable(name: "date", scope: !163, file: !3, line: 57, type: !71)
!169 = !DILocation(line: 57, column: 14, scope: !163)
!170 = !DILocation(line: 57, column: 32, scope: !163)
!171 = !DILocation(line: 57, column: 25, scope: !163)
!172 = !DILocation(line: 57, column: 30, scope: !163)
!173 = !DILocalVariable(name: "c", scope: !163, file: !3, line: 58, type: !17)
!174 = !DILocation(line: 58, column: 11, scope: !163)
!175 = !DILocation(line: 58, column: 15, scope: !163)
!176 = !DILocation(line: 58, column: 20, scope: !163)
!177 = !DILocalVariable(name: "n", scope: !163, file: !3, line: 58, type: !17)
!178 = !DILocation(line: 58, column: 27, scope: !163)
!179 = !DILocation(line: 58, column: 31, scope: !163)
!180 = !DILocation(line: 58, column: 36, scope: !163)
!181 = !DILocalVariable(name: "i", scope: !163, file: !3, line: 59, type: !17)
!182 = !DILocation(line: 59, column: 11, scope: !163)
!183 = !DILocation(line: 59, column: 16, scope: !163)
!184 = !DILocation(line: 59, column: 20, scope: !163)
!185 = !DILocation(line: 59, column: 22, scope: !163)
!186 = !DILocation(line: 59, column: 18, scope: !163)
!187 = !DILocation(line: 59, column: 29, scope: !163)
!188 = !DILocation(line: 59, column: 34, scope: !163)
!189 = !DILocation(line: 59, column: 36, scope: !163)
!190 = !DILocation(line: 59, column: 42, scope: !163)
!191 = !DILocation(line: 59, column: 31, scope: !163)
!192 = !DILocation(line: 59, column: 48, scope: !163)
!193 = !DILocation(line: 59, column: 26, scope: !163)
!194 = !DILocation(line: 59, column: 59, scope: !163)
!195 = !DILocation(line: 59, column: 57, scope: !163)
!196 = !DILocation(line: 59, column: 52, scope: !163)
!197 = !DILocation(line: 59, column: 61, scope: !163)
!198 = !DILocation(line: 59, column: 67, scope: !163)
!199 = !DILocation(line: 60, column: 13, scope: !163)
!200 = !DILocation(line: 60, column: 15, scope: !163)
!201 = !DILocation(line: 60, column: 29, scope: !163)
!202 = !DILocation(line: 60, column: 31, scope: !163)
!203 = !DILocation(line: 60, column: 46, scope: !163)
!204 = !DILocation(line: 60, column: 48, scope: !163)
!205 = !DILocation(line: 60, column: 43, scope: !163)
!206 = !DILocation(line: 60, column: 37, scope: !163)
!207 = !DILocation(line: 60, column: 63, scope: !163)
!208 = !DILocation(line: 60, column: 61, scope: !163)
!209 = !DILocation(line: 60, column: 66, scope: !163)
!210 = !DILocation(line: 60, column: 54, scope: !163)
!211 = !DILocation(line: 60, column: 26, scope: !163)
!212 = !DILocation(line: 60, column: 21, scope: !163)
!213 = !DILocation(line: 60, column: 9, scope: !163)
!214 = !DILocalVariable(name: "l", scope: !163, file: !3, line: 61, type: !17)
!215 = !DILocation(line: 61, column: 11, scope: !163)
!216 = !DILocation(line: 61, column: 15, scope: !163)
!217 = !DILocation(line: 61, column: 20, scope: !163)
!218 = !DILocation(line: 61, column: 27, scope: !163)
!219 = !DILocation(line: 61, column: 32, scope: !163)
!220 = !DILocation(line: 61, column: 25, scope: !163)
!221 = !DILocation(line: 61, column: 38, scope: !163)
!222 = !DILocation(line: 61, column: 36, scope: !163)
!223 = !DILocation(line: 61, column: 40, scope: !163)
!224 = !DILocation(line: 61, column: 46, scope: !163)
!225 = !DILocation(line: 61, column: 44, scope: !163)
!226 = !DILocation(line: 61, column: 50, scope: !163)
!227 = !DILocation(line: 61, column: 52, scope: !163)
!228 = !DILocation(line: 61, column: 48, scope: !163)
!229 = !DILocation(line: 61, column: 57, scope: !163)
!230 = !DILocation(line: 61, column: 17, scope: !163)
!231 = !DILocation(line: 62, column: 25, scope: !163)
!232 = !DILocation(line: 62, column: 27, scope: !163)
!233 = !DILocation(line: 62, column: 33, scope: !163)
!234 = !DILocation(line: 62, column: 22, scope: !163)
!235 = !DILocation(line: 62, column: 12, scope: !163)
!236 = !DILocation(line: 62, column: 18, scope: !163)
!237 = !DILocation(line: 63, column: 24, scope: !163)
!238 = !DILocation(line: 63, column: 26, scope: !163)
!239 = !DILocation(line: 63, column: 44, scope: !163)
!240 = !DILocation(line: 63, column: 50, scope: !163)
!241 = !DILocation(line: 63, column: 36, scope: !163)
!242 = !DILocation(line: 63, column: 31, scope: !163)
!243 = !DILocation(line: 63, column: 12, scope: !163)
!244 = !DILocation(line: 63, column: 22, scope: !163)
!245 = !DILocation(line: 64, column: 23, scope: !163)
!246 = !DILocation(line: 64, column: 12, scope: !163)
!247 = !DILocation(line: 64, column: 21, scope: !163)
!248 = !DILocation(line: 65, column: 7, scope: !163)
!249 = distinct !DISubprogram(name: "week_day", scope: !3, file: !3, line: 68, type: !250, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!250 = !DISubroutineType(types: !251)
!251 = !{!31, !71}
!252 = !DILocalVariable(name: "date", arg: 1, scope: !249, file: !3, line: 68, type: !71)
!253 = !DILocation(line: 68, column: 24, scope: !249)
!254 = !DILocalVariable(name: "year", scope: !249, file: !3, line: 71, type: !17)
!255 = !DILocation(line: 71, column: 11, scope: !249)
!256 = !DILocation(line: 71, column: 23, scope: !249)
!257 = !DILocalVariable(name: "month", scope: !249, file: !3, line: 71, type: !17)
!258 = !DILocation(line: 71, column: 29, scope: !249)
!259 = !DILocation(line: 71, column: 42, scope: !249)
!260 = !DILocalVariable(name: "month_day", scope: !249, file: !3, line: 71, type: !17)
!261 = !DILocation(line: 71, column: 49, scope: !249)
!262 = !DILocation(line: 71, column: 66, scope: !249)
!263 = !DILocalVariable(name: "c", scope: !249, file: !3, line: 71, type: !17)
!264 = !DILocation(line: 71, column: 77, scope: !249)
!265 = !DILocation(line: 72, column: 10, scope: !266)
!266 = distinct !DILexicalBlock(scope: !249, file: !3, line: 72, column: 10)
!267 = !DILocation(line: 72, column: 16, scope: !266)
!268 = !DILocation(line: 72, column: 10, scope: !249)
!269 = !DILocation(line: 72, column: 28, scope: !270)
!270 = distinct !DILexicalBlock(scope: !266, file: !3, line: 72, column: 21)
!271 = !DILocation(line: 72, column: 40, scope: !270)
!272 = !DILocation(line: 72, column: 45, scope: !270)
!273 = !DILocation(line: 73, column: 11, scope: !249)
!274 = !DILocation(line: 73, column: 16, scope: !249)
!275 = !DILocation(line: 73, column: 9, scope: !249)
!276 = !DILocation(line: 74, column: 12, scope: !249)
!277 = !DILocation(line: 75, column: 20, scope: !249)
!278 = !DILocation(line: 75, column: 34, scope: !249)
!279 = !DILocation(line: 75, column: 40, scope: !249)
!280 = !DILocation(line: 75, column: 45, scope: !249)
!281 = !DILocation(line: 75, column: 51, scope: !249)
!282 = !DILocation(line: 75, column: 30, scope: !249)
!283 = !DILocation(line: 76, column: 12, scope: !249)
!284 = !DILocation(line: 76, column: 10, scope: !249)
!285 = !DILocation(line: 76, column: 19, scope: !249)
!286 = !DILocation(line: 76, column: 24, scope: !249)
!287 = !DILocation(line: 76, column: 17, scope: !249)
!288 = !DILocation(line: 76, column: 30, scope: !249)
!289 = !DILocation(line: 76, column: 32, scope: !249)
!290 = !DILocation(line: 76, column: 28, scope: !249)
!291 = !DILocation(line: 76, column: 42, scope: !249)
!292 = !DILocation(line: 76, column: 40, scope: !249)
!293 = !DILocation(line: 76, column: 36, scope: !249)
!294 = !DILocation(line: 76, column: 45, scope: !249)
!295 = !DILocation(line: 76, column: 49, scope: !249)
!296 = !DILocation(line: 76, column: 54, scope: !249)
!297 = !DILocation(line: 75, column: 16, scope: !249)
!298 = !DILocation(line: 75, column: 7, scope: !249)
!299 = distinct !DISubprogram(name: "easter_related_init", scope: !3, file: !3, line: 83, type: !300, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!300 = !DISubroutineType(types: !301)
!301 = !{!302, !32}
!302 = !DIDerivedType(tag: DW_TAG_typedef, name: "easter_related_t", file: !3, line: 81, baseType: !303)
!303 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 81, size: 640, elements: !304)
!304 = !{!305, !306, !307, !308, !309}
!305 = !DIDerivedType(tag: DW_TAG_member, name: "easter", scope: !303, file: !3, line: 81, baseType: !71, size: 128)
!306 = !DIDerivedType(tag: DW_TAG_member, name: "ascension", scope: !303, file: !3, line: 81, baseType: !71, size: 128, offset: 128)
!307 = !DIDerivedType(tag: DW_TAG_member, name: "pentecost", scope: !303, file: !3, line: 81, baseType: !71, size: 128, offset: 256)
!308 = !DIDerivedType(tag: DW_TAG_member, name: "trinity", scope: !303, file: !3, line: 81, baseType: !71, size: 128, offset: 384)
!309 = !DIDerivedType(tag: DW_TAG_member, name: "corpus_christi", scope: !303, file: !3, line: 81, baseType: !71, size: 128, offset: 512)
!310 = !DILocalVariable(name: "year", arg: 1, scope: !299, file: !3, line: 83, type: !32)
!311 = !DILocation(line: 83, column: 46, scope: !299)
!312 = !DILocalVariable(name: "date", scope: !299, file: !3, line: 85, type: !71)
!313 = !DILocation(line: 85, column: 11, scope: !299)
!314 = !DILocalVariable(name: "holidays", scope: !299, file: !3, line: 86, type: !302)
!315 = !DILocation(line: 86, column: 21, scope: !299)
!316 = !DILocation(line: 88, column: 13, scope: !299)
!317 = !DILocation(line: 88, column: 36, scope: !299)
!318 = !DILocation(line: 88, column: 29, scope: !299)
!319 = !DILocation(line: 88, column: 27, scope: !299)
!320 = !DILocation(line: 90, column: 13, scope: !299)
!321 = !DILocation(line: 90, column: 25, scope: !299)
!322 = !DILocation(line: 92, column: 13, scope: !299)
!323 = !DILocation(line: 92, column: 25, scope: !299)
!324 = !DILocation(line: 94, column: 13, scope: !299)
!325 = !DILocation(line: 94, column: 23, scope: !299)
!326 = !DILocation(line: 96, column: 13, scope: !299)
!327 = !DILocation(line: 96, column: 30, scope: !299)
!328 = !DILocation(line: 97, column: 4, scope: !299)
!329 = distinct !DISubprogram(name: "easter_related_print", scope: !3, file: !3, line: 104, type: !330, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!330 = !DISubroutineType(types: !331)
!331 = !{null, !32}
!332 = !DILocalVariable(name: "year", arg: 1, scope: !329, file: !3, line: 104, type: !32)
!333 = !DILocation(line: 104, column: 34, scope: !329)
!334 = !DILocalVariable(name: "holidays", scope: !329, file: !3, line: 106, type: !302)
!335 = !DILocation(line: 106, column: 20, scope: !329)
!336 = !DILocation(line: 106, column: 51, scope: !329)
!337 = !DILocation(line: 106, column: 31, scope: !329)
!338 = !DILocation(line: 108, column: 30, scope: !329)
!339 = !DILocation(line: 109, column: 5, scope: !329)
!340 = !DILocation(line: 109, column: 30, scope: !329)
!341 = !DILocation(line: 109, column: 57, scope: !329)
!342 = !DILocation(line: 110, column: 5, scope: !329)
!343 = !DILocation(line: 110, column: 30, scope: !329)
!344 = !DILocation(line: 108, column: 3, scope: !329)
!345 = !DILocation(line: 111, column: 1, scope: !329)
!346 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 113, type: !347, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!347 = !DISubroutineType(types: !348)
!348 = !{!17}
!349 = !DILocalVariable(name: "year", scope: !346, file: !3, line: 114, type: !32)
!350 = !DILocation(line: 114, column: 10, scope: !346)
!351 = !DILocation(line: 116, column: 3, scope: !346)
!352 = !DILocation(line: 117, column: 11, scope: !353)
!353 = distinct !DILexicalBlock(scope: !346, file: !3, line: 117, column: 3)
!354 = !DILocation(line: 117, column: 7, scope: !353)
!355 = !DILocation(line: 117, column: 17, scope: !356)
!356 = distinct !DILexicalBlock(scope: !353, file: !3, line: 117, column: 3)
!357 = !DILocation(line: 117, column: 21, scope: !356)
!358 = !DILocation(line: 117, column: 3, scope: !353)
!359 = !DILocation(line: 117, column: 62, scope: !360)
!360 = distinct !DILexicalBlock(scope: !356, file: !3, line: 117, column: 39)
!361 = !DILocation(line: 117, column: 41, scope: !360)
!362 = !DILocation(line: 117, column: 69, scope: !360)
!363 = !DILocation(line: 117, column: 33, scope: !356)
!364 = !DILocation(line: 117, column: 3, scope: !356)
!365 = distinct !{!365, !358, !366}
!366 = !DILocation(line: 117, column: 69, scope: !353)
!367 = !DILocation(line: 119, column: 3, scope: !346)
!368 = !DILocation(line: 120, column: 11, scope: !369)
!369 = distinct !DILexicalBlock(scope: !346, file: !3, line: 120, column: 3)
!370 = !DILocation(line: 120, column: 7, scope: !369)
!371 = !DILocation(line: 120, column: 18, scope: !372)
!372 = distinct !DILexicalBlock(scope: !369, file: !3, line: 120, column: 3)
!373 = !DILocation(line: 120, column: 22, scope: !372)
!374 = !DILocation(line: 120, column: 3, scope: !369)
!375 = !DILocation(line: 120, column: 60, scope: !376)
!376 = distinct !DILexicalBlock(scope: !372, file: !3, line: 120, column: 37)
!377 = !DILocation(line: 120, column: 39, scope: !376)
!378 = !DILocation(line: 120, column: 67, scope: !376)
!379 = !DILocation(line: 120, column: 34, scope: !372)
!380 = !DILocation(line: 120, column: 3, scope: !372)
!381 = distinct !{!381, !374, !382}
!382 = !DILocation(line: 120, column: 67, scope: !369)
!383 = !DILocation(line: 121, column: 3, scope: !346)
