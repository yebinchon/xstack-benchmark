; ModuleID = 'discordian-date.c'
source_filename = "discordian-date.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

@.str = private unnamed_addr constant [23 x i8] c"St. Tib's Day, YOLD %d\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"%s, %s %d, YOLD %d\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"Sweetmorn\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"Boomtime\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"Pungenday\00", align 1
@.str.5 = private unnamed_addr constant [16 x i8] c"Prickle-Prickle\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Setting Orange\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"Chaos\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"Discord\00", align 1
@.str.9 = private unnamed_addr constant [10 x i8] c"Confusion\00", align 1
@.str.10 = private unnamed_addr constant [12 x i8] c"Bureaucracy\00", align 1
@.str.11 = private unnamed_addr constant [14 x i8] c"The Aftermath\00", align 1
@__const.day_of_year.month_lengths = private unnamed_addr constant [12 x i32] [i32 31, i32 28, i32 31, i32 30, i32 31, i32 30, i32 31, i32 31, i32 30, i32 31, i32 30, i32 31], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @ddate(i32 %y, i32 %d) #0 !dbg !7 {
entry:
  %retval = alloca i8*, align 8
  %y.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %dyear = alloca i32, align 4
  %result = alloca i8*, align 8
  store i32 %y, i32* %y.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %y.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %d, i32* %d.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %d.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %dyear, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* %y.addr, align 4, !dbg !19
  %add = add nsw i32 1166, %0, !dbg !20
  store i32 %add, i32* %dyear, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata i8** %result, metadata !21, metadata !DIExpression()), !dbg !22
  %call = call noalias i8* @malloc(i64 100) #6, !dbg !23
  store i8* %call, i8** %result, align 8, !dbg !22
  %1 = load i32, i32* %y.addr, align 4, !dbg !24
  %rem = srem i32 %1, 400, !dbg !24
  %cmp = icmp eq i32 %rem, 0, !dbg !24
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !24, !cf.info !26

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %y.addr, align 4, !dbg !24
  %rem1 = srem i32 %2, 4, !dbg !24
  %cmp2 = icmp eq i32 %rem1, 0, !dbg !24
  br i1 %cmp2, label %land.lhs.true, label %if.end10, !dbg !24, !cf.info !26

land.lhs.true:                                    ; preds = %lor.lhs.false
  %3 = load i32, i32* %y.addr, align 4, !dbg !24
  %rem3 = srem i32 %3, 100, !dbg !24
  %tobool = icmp ne i32 %rem3, 0, !dbg !24
  br i1 %tobool, label %if.then, label %if.end10, !dbg !27, !cf.info !26

if.then:                                          ; preds = %land.lhs.true, %entry
  %4 = load i32, i32* %d.addr, align 4, !dbg !28
  %cmp4 = icmp eq i32 %4, 60, !dbg !31
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !32, !cf.info !26

if.then5:                                         ; preds = %if.then
  %5 = load i8*, i8** %result, align 8, !dbg !33
  %6 = load i32, i32* %dyear, align 4, !dbg !35
  %call6 = call i32 (i8*, i8*, ...) @sprintf(i8* %5, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0), i32 %6) #6, !dbg !36
  %7 = load i8*, i8** %result, align 8, !dbg !37
  store i8* %7, i8** %retval, align 8, !dbg !38
  br label %return, !dbg !38

if.else:                                          ; preds = %if.then
  %8 = load i32, i32* %d.addr, align 4, !dbg !39
  %cmp7 = icmp sge i32 %8, 60, !dbg !41
  br i1 %cmp7, label %if.then8, label %if.end, !dbg !42, !cf.info !26

if.then8:                                         ; preds = %if.else
  %9 = load i32, i32* %d.addr, align 4, !dbg !43
  %dec = add nsw i32 %9, -1, !dbg !43
  store i32 %dec, i32* %d.addr, align 4, !dbg !43
  br label %if.end, !dbg !45

if.end:                                           ; preds = %if.then8, %if.else
  br label %if.end9

if.end9:                                          ; preds = %if.end
  br label %if.end10, !dbg !46

if.end10:                                         ; preds = %if.end9, %land.lhs.true, %lor.lhs.false
  %10 = load i8*, i8** %result, align 8, !dbg !47
  %11 = load i32, i32* %d.addr, align 4, !dbg !48
  %rem11 = srem i32 %11, 5, !dbg !48
  %cmp12 = icmp eq i32 %rem11, 1, !dbg !48
  br i1 %cmp12, label %cond.true, label %cond.false, !dbg !48

cond.true:                                        ; preds = %if.end10
  br label %cond.end26, !dbg !48

cond.false:                                       ; preds = %if.end10
  %12 = load i32, i32* %d.addr, align 4, !dbg !48
  %rem13 = srem i32 %12, 5, !dbg !48
  %cmp14 = icmp eq i32 %rem13, 2, !dbg !48
  br i1 %cmp14, label %cond.true15, label %cond.false16, !dbg !48

cond.true15:                                      ; preds = %cond.false
  br label %cond.end24, !dbg !48

cond.false16:                                     ; preds = %cond.false
  %13 = load i32, i32* %d.addr, align 4, !dbg !48
  %rem17 = srem i32 %13, 5, !dbg !48
  %cmp18 = icmp eq i32 %rem17, 3, !dbg !48
  br i1 %cmp18, label %cond.true19, label %cond.false20, !dbg !48

cond.true19:                                      ; preds = %cond.false16
  br label %cond.end, !dbg !48

cond.false20:                                     ; preds = %cond.false16
  %14 = load i32, i32* %d.addr, align 4, !dbg !48
  %rem21 = srem i32 %14, 5, !dbg !48
  %cmp22 = icmp eq i32 %rem21, 4, !dbg !48
  %15 = zext i1 %cmp22 to i64, !dbg !48
  %cond = select i1 %cmp22, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0), !dbg !48
  br label %cond.end, !dbg !48

cond.end:                                         ; preds = %cond.false20, %cond.true19
  %cond23 = phi i8* [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), %cond.true19 ], [ %cond, %cond.false20 ], !dbg !48
  br label %cond.end24, !dbg !48

cond.end24:                                       ; preds = %cond.end, %cond.true15
  %cond25 = phi i8* [ getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), %cond.true15 ], [ %cond23, %cond.end ], !dbg !48
  br label %cond.end26, !dbg !48

cond.end26:                                       ; preds = %cond.end24, %cond.true
  %cond27 = phi i8* [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0), %cond.true ], [ %cond25, %cond.end24 ], !dbg !48
  %16 = load i32, i32* %d.addr, align 4, !dbg !49
  %rem28 = srem i32 %16, 73, !dbg !49
  %cmp29 = icmp eq i32 %rem28, 0, !dbg !49
  br i1 %cmp29, label %cond.true30, label %cond.false31, !dbg !49

cond.true30:                                      ; preds = %cond.end26
  %17 = load i32, i32* %d.addr, align 4, !dbg !49
  %sub = sub nsw i32 %17, 1, !dbg !49
  br label %cond.end32, !dbg !49

cond.false31:                                     ; preds = %cond.end26
  %18 = load i32, i32* %d.addr, align 4, !dbg !49
  br label %cond.end32, !dbg !49

cond.end32:                                       ; preds = %cond.false31, %cond.true30
  %cond33 = phi i32 [ %sub, %cond.true30 ], [ %18, %cond.false31 ], !dbg !49
  %div = sdiv i32 %cond33, 73, !dbg !49
  %cmp34 = icmp eq i32 %div, 0, !dbg !49
  br i1 %cmp34, label %cond.true35, label %cond.false36, !dbg !49

cond.true35:                                      ; preds = %cond.end32
  br label %cond.end73, !dbg !49

cond.false36:                                     ; preds = %cond.end32
  %19 = load i32, i32* %d.addr, align 4, !dbg !49
  %rem37 = srem i32 %19, 73, !dbg !49
  %cmp38 = icmp eq i32 %rem37, 0, !dbg !49
  br i1 %cmp38, label %cond.true39, label %cond.false41, !dbg !49

cond.true39:                                      ; preds = %cond.false36
  %20 = load i32, i32* %d.addr, align 4, !dbg !49
  %sub40 = sub nsw i32 %20, 1, !dbg !49
  br label %cond.end42, !dbg !49

cond.false41:                                     ; preds = %cond.false36
  %21 = load i32, i32* %d.addr, align 4, !dbg !49
  br label %cond.end42, !dbg !49

cond.end42:                                       ; preds = %cond.false41, %cond.true39
  %cond43 = phi i32 [ %sub40, %cond.true39 ], [ %21, %cond.false41 ], !dbg !49
  %div44 = sdiv i32 %cond43, 73, !dbg !49
  %cmp45 = icmp eq i32 %div44, 1, !dbg !49
  br i1 %cmp45, label %cond.true46, label %cond.false47, !dbg !49

cond.true46:                                      ; preds = %cond.end42
  br label %cond.end71, !dbg !49

cond.false47:                                     ; preds = %cond.end42
  %22 = load i32, i32* %d.addr, align 4, !dbg !49
  %rem48 = srem i32 %22, 73, !dbg !49
  %cmp49 = icmp eq i32 %rem48, 0, !dbg !49
  br i1 %cmp49, label %cond.true50, label %cond.false52, !dbg !49

cond.true50:                                      ; preds = %cond.false47
  %23 = load i32, i32* %d.addr, align 4, !dbg !49
  %sub51 = sub nsw i32 %23, 1, !dbg !49
  br label %cond.end53, !dbg !49

cond.false52:                                     ; preds = %cond.false47
  %24 = load i32, i32* %d.addr, align 4, !dbg !49
  br label %cond.end53, !dbg !49

cond.end53:                                       ; preds = %cond.false52, %cond.true50
  %cond54 = phi i32 [ %sub51, %cond.true50 ], [ %24, %cond.false52 ], !dbg !49
  %div55 = sdiv i32 %cond54, 73, !dbg !49
  %cmp56 = icmp eq i32 %div55, 2, !dbg !49
  br i1 %cmp56, label %cond.true57, label %cond.false58, !dbg !49

cond.true57:                                      ; preds = %cond.end53
  br label %cond.end69, !dbg !49

cond.false58:                                     ; preds = %cond.end53
  %25 = load i32, i32* %d.addr, align 4, !dbg !49
  %rem59 = srem i32 %25, 73, !dbg !49
  %cmp60 = icmp eq i32 %rem59, 0, !dbg !49
  br i1 %cmp60, label %cond.true61, label %cond.false63, !dbg !49

cond.true61:                                      ; preds = %cond.false58
  %26 = load i32, i32* %d.addr, align 4, !dbg !49
  %sub62 = sub nsw i32 %26, 1, !dbg !49
  br label %cond.end64, !dbg !49

cond.false63:                                     ; preds = %cond.false58
  %27 = load i32, i32* %d.addr, align 4, !dbg !49
  br label %cond.end64, !dbg !49

cond.end64:                                       ; preds = %cond.false63, %cond.true61
  %cond65 = phi i32 [ %sub62, %cond.true61 ], [ %27, %cond.false63 ], !dbg !49
  %div66 = sdiv i32 %cond65, 73, !dbg !49
  %cmp67 = icmp eq i32 %div66, 3, !dbg !49
  %28 = zext i1 %cmp67 to i64, !dbg !49
  %cond68 = select i1 %cmp67, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.11, i64 0, i64 0), !dbg !49
  br label %cond.end69, !dbg !49

cond.end69:                                       ; preds = %cond.end64, %cond.true57
  %cond70 = phi i8* [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i64 0, i64 0), %cond.true57 ], [ %cond68, %cond.end64 ], !dbg !49
  br label %cond.end71, !dbg !49

cond.end71:                                       ; preds = %cond.end69, %cond.true46
  %cond72 = phi i8* [ getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i64 0, i64 0), %cond.true46 ], [ %cond70, %cond.end69 ], !dbg !49
  br label %cond.end73, !dbg !49

cond.end73:                                       ; preds = %cond.end71, %cond.true35
  %cond74 = phi i8* [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i64 0, i64 0), %cond.true35 ], [ %cond72, %cond.end71 ], !dbg !49
  %29 = load i32, i32* %d.addr, align 4, !dbg !50
  %rem75 = srem i32 %29, 73, !dbg !50
  %cmp76 = icmp eq i32 %rem75, 0, !dbg !50
  br i1 %cmp76, label %cond.true77, label %cond.false78, !dbg !50

cond.true77:                                      ; preds = %cond.end73
  br label %cond.end80, !dbg !50

cond.false78:                                     ; preds = %cond.end73
  %30 = load i32, i32* %d.addr, align 4, !dbg !50
  %rem79 = srem i32 %30, 73, !dbg !50
  br label %cond.end80, !dbg !50

cond.end80:                                       ; preds = %cond.false78, %cond.true77
  %cond81 = phi i32 [ 73, %cond.true77 ], [ %rem79, %cond.false78 ], !dbg !50
  %31 = load i32, i32* %dyear, align 4, !dbg !51
  %call82 = call i32 (i8*, i8*, ...) @sprintf(i8* %10, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0), i8* %cond27, i8* %cond74, i32 %cond81, i32 %31) #6, !dbg !52
  %32 = load i8*, i8** %result, align 8, !dbg !53
  store i8* %32, i8** %retval, align 8, !dbg !54
  br label %return, !dbg !54

return:                                           ; preds = %cond.end80, %if.then5
  %33 = load i8*, i8** %retval, align 8, !dbg !55
  ret i8* %33, !dbg !55
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8*, i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @day_of_year(i32 %y, i32 %m, i32 %d) #0 !dbg !56 {
entry:
  %y.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %month_lengths = alloca [12 x i32], align 16
  store i32 %y, i32* %y.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %y.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 %m, i32* %m.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i32 %d, i32* %d.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %d.addr, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata [12 x i32]* %month_lengths, metadata !65, metadata !DIExpression()), !dbg !69
  %0 = bitcast [12 x i32]* %month_lengths to i8*, !dbg !69
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([12 x i32]* @__const.day_of_year.month_lengths to i8*), i64 48, i1 false), !dbg !69
  br label %for.cond, !dbg !70

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %m.addr, align 4, !dbg !71
  %cmp = icmp sgt i32 %1, 1, !dbg !74
  br i1 %cmp, label %for.body, label %for.end, !dbg !75

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %m.addr, align 4, !dbg !76
  %sub = sub nsw i32 %2, 2, !dbg !78
  %idxprom = sext i32 %sub to i64, !dbg !79
  %arrayidx = getelementptr inbounds [12 x i32], [12 x i32]* %month_lengths, i64 0, i64 %idxprom, !dbg !79
  %3 = load i32, i32* %arrayidx, align 4, !dbg !79
  %4 = load i32, i32* %d.addr, align 4, !dbg !80
  %add = add nsw i32 %4, %3, !dbg !80
  store i32 %add, i32* %d.addr, align 4, !dbg !80
  %5 = load i32, i32* %m.addr, align 4, !dbg !81
  %cmp1 = icmp eq i32 %5, 3, !dbg !83
  br i1 %cmp1, label %land.lhs.true, label %if.end, !dbg !84, !cf.info !26

land.lhs.true:                                    ; preds = %for.body
  %6 = load i32, i32* %y.addr, align 4, !dbg !85
  %rem = srem i32 %6, 400, !dbg !85
  %cmp2 = icmp eq i32 %rem, 0, !dbg !85
  br i1 %cmp2, label %if.then, label %lor.lhs.false, !dbg !85, !cf.info !26

lor.lhs.false:                                    ; preds = %land.lhs.true
  %7 = load i32, i32* %y.addr, align 4, !dbg !85
  %rem3 = srem i32 %7, 4, !dbg !85
  %cmp4 = icmp eq i32 %rem3, 0, !dbg !85
  br i1 %cmp4, label %land.lhs.true5, label %if.end, !dbg !85, !cf.info !26

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %8 = load i32, i32* %y.addr, align 4, !dbg !85
  %rem6 = srem i32 %8, 100, !dbg !85
  %tobool = icmp ne i32 %rem6, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.end, !dbg !86, !cf.info !26

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  %9 = load i32, i32* %d.addr, align 4, !dbg !87
  %inc = add nsw i32 %9, 1, !dbg !87
  store i32 %inc, i32* %d.addr, align 4, !dbg !87
  br label %if.end, !dbg !89

if.end:                                           ; preds = %if.then, %land.lhs.true5, %lor.lhs.false, %for.body
  br label %for.inc, !dbg !90

for.inc:                                          ; preds = %if.end
  %10 = load i32, i32* %m.addr, align 4, !dbg !91
  %dec = add nsw i32 %10, -1, !dbg !91
  store i32 %dec, i32* %m.addr, align 4, !dbg !91
  br label %for.cond, !dbg !92, !llvm.loop !93

for.end:                                          ; preds = %for.cond
  %11 = load i32, i32* %d.addr, align 4, !dbg !95
  ret i32 %11, !dbg !96
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %now = alloca i64, align 8
  %now_time = alloca %struct.tm*, align 8
  %year = alloca i32, align 4
  %doy = alloca i32, align 4
  %result = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i64* %now, metadata !105, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata %struct.tm** %now_time, metadata !112, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i32* %year, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i32* %doy, metadata !133, metadata !DIExpression()), !dbg !134
  %0 = load i32, i32* %argc.addr, align 4, !dbg !135
  %cmp = icmp eq i32 %0, 1, !dbg !137
  br i1 %cmp, label %if.then, label %if.else, !dbg !138, !cf.info !26

if.then:                                          ; preds = %entry
  %call = call i64 @time(i64* null) #6, !dbg !139
  store i64 %call, i64* %now, align 8, !dbg !141
  %call1 = call %struct.tm* @localtime(i64* %now) #6, !dbg !142
  store %struct.tm* %call1, %struct.tm** %now_time, align 8, !dbg !143
  %1 = load %struct.tm*, %struct.tm** %now_time, align 8, !dbg !144
  %tm_year = getelementptr inbounds %struct.tm, %struct.tm* %1, i32 0, i32 5, !dbg !145
  %2 = load i32, i32* %tm_year, align 4, !dbg !145
  %add = add nsw i32 %2, 1900, !dbg !146
  store i32 %add, i32* %year, align 4, !dbg !147
  %3 = load %struct.tm*, %struct.tm** %now_time, align 8, !dbg !148
  %tm_yday = getelementptr inbounds %struct.tm, %struct.tm* %3, i32 0, i32 7, !dbg !149
  %4 = load i32, i32* %tm_yday, align 4, !dbg !149
  %add2 = add nsw i32 %4, 1, !dbg !150
  store i32 %add2, i32* %doy, align 4, !dbg !151
  br label %if.end13, !dbg !152

if.else:                                          ; preds = %entry
  %5 = load i32, i32* %argc.addr, align 4, !dbg !153
  %cmp3 = icmp eq i32 %5, 4, !dbg !155
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !156, !cf.info !26

if.then4:                                         ; preds = %if.else
  %6 = load i8**, i8*** %argv.addr, align 8, !dbg !157
  %arrayidx = getelementptr inbounds i8*, i8** %6, i64 1, !dbg !157
  %7 = load i8*, i8** %arrayidx, align 8, !dbg !157
  %call5 = call i32 @atoi(i8* %7) #7, !dbg !159
  store i32 %call5, i32* %year, align 4, !dbg !160
  %8 = load i8**, i8*** %argv.addr, align 8, !dbg !161
  %arrayidx6 = getelementptr inbounds i8*, i8** %8, i64 1, !dbg !161
  %9 = load i8*, i8** %arrayidx6, align 8, !dbg !161
  %call7 = call i32 @atoi(i8* %9) #7, !dbg !162
  %10 = load i8**, i8*** %argv.addr, align 8, !dbg !163
  %arrayidx8 = getelementptr inbounds i8*, i8** %10, i64 2, !dbg !163
  %11 = load i8*, i8** %arrayidx8, align 8, !dbg !163
  %call9 = call i32 @atoi(i8* %11) #7, !dbg !164
  %12 = load i8**, i8*** %argv.addr, align 8, !dbg !165
  %arrayidx10 = getelementptr inbounds i8*, i8** %12, i64 3, !dbg !165
  %13 = load i8*, i8** %arrayidx10, align 8, !dbg !165
  %call11 = call i32 @atoi(i8* %13) #7, !dbg !166
  %call12 = call i32 @day_of_year(i32 %call7, i32 %call9, i32 %call11), !dbg !167
  store i32 %call12, i32* %doy, align 4, !dbg !168
  br label %if.end, !dbg !169

if.end:                                           ; preds = %if.then4, %if.else
  br label %if.end13

if.end13:                                         ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i8** %result, metadata !170, metadata !DIExpression()), !dbg !171
  %14 = load i32, i32* %year, align 4, !dbg !172
  %15 = load i32, i32* %doy, align 4, !dbg !173
  %call14 = call i8* @ddate(i32 %14, i32 %15), !dbg !174
  store i8* %call14, i8** %result, align 8, !dbg !171
  %16 = load i8*, i8** %result, align 8, !dbg !175
  %call15 = call i32 @puts(i8* %16), !dbg !176
  %17 = load i8*, i8** %result, align 8, !dbg !177
  call void @free(i8* %17) #6, !dbg !178
  ret i32 0, !dbg !179
}

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: nounwind
declare dso_local %struct.tm* @localtime(i64*) #2

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #4

declare dso_local i32 @puts(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "discordian-date.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Discordian-date")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "ddate", scope: !1, file: !1, line: 21, type: !8, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !12, !12}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "y", arg: 1, scope: !7, file: !1, line: 21, type: !12)
!14 = !DILocation(line: 21, column: 19, scope: !7)
!15 = !DILocalVariable(name: "d", arg: 2, scope: !7, file: !1, line: 21, type: !12)
!16 = !DILocation(line: 21, column: 26, scope: !7)
!17 = !DILocalVariable(name: "dyear", scope: !7, file: !1, line: 22, type: !12)
!18 = !DILocation(line: 22, column: 7, scope: !7)
!19 = !DILocation(line: 22, column: 22, scope: !7)
!20 = !DILocation(line: 22, column: 20, scope: !7)
!21 = !DILocalVariable(name: "result", scope: !7, file: !1, line: 23, type: !10)
!22 = !DILocation(line: 23, column: 10, scope: !7)
!23 = !DILocation(line: 23, column: 19, scope: !7)
!24 = !DILocation(line: 25, column: 7, scope: !25)
!25 = distinct !DILexicalBlock(scope: !7, file: !1, line: 25, column: 7)
!26 = !{!"if"}
!27 = !DILocation(line: 25, column: 7, scope: !7)
!28 = !DILocation(line: 26, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !30, file: !1, line: 26, column: 9)
!30 = distinct !DILexicalBlock(scope: !25, file: !1, line: 25, column: 23)
!31 = !DILocation(line: 26, column: 11, scope: !29)
!32 = !DILocation(line: 26, column: 9, scope: !30)
!33 = !DILocation(line: 27, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !29, file: !1, line: 26, column: 18)
!35 = !DILocation(line: 27, column: 50, scope: !34)
!36 = !DILocation(line: 27, column: 7, scope: !34)
!37 = !DILocation(line: 28, column: 14, scope: !34)
!38 = !DILocation(line: 28, column: 7, scope: !34)
!39 = !DILocation(line: 29, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !29, file: !1, line: 29, column: 16)
!41 = !DILocation(line: 29, column: 18, scope: !40)
!42 = !DILocation(line: 29, column: 16, scope: !29)
!43 = !DILocation(line: 30, column: 7, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !1, line: 29, column: 25)
!45 = !DILocation(line: 31, column: 5, scope: !44)
!46 = !DILocation(line: 32, column: 3, scope: !30)
!47 = !DILocation(line: 34, column: 12, scope: !7)
!48 = !DILocation(line: 35, column: 12, scope: !7)
!49 = !DILocation(line: 35, column: 30, scope: !7)
!50 = !DILocation(line: 35, column: 61, scope: !7)
!51 = !DILocation(line: 35, column: 72, scope: !7)
!52 = !DILocation(line: 34, column: 3, scope: !7)
!53 = !DILocation(line: 37, column: 10, scope: !7)
!54 = !DILocation(line: 37, column: 3, scope: !7)
!55 = !DILocation(line: 38, column: 1, scope: !7)
!56 = distinct !DISubprogram(name: "day_of_year", scope: !1, file: !1, line: 41, type: !57, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!12, !12, !12, !12}
!59 = !DILocalVariable(name: "y", arg: 1, scope: !56, file: !1, line: 41, type: !12)
!60 = !DILocation(line: 41, column: 22, scope: !56)
!61 = !DILocalVariable(name: "m", arg: 2, scope: !56, file: !1, line: 41, type: !12)
!62 = !DILocation(line: 41, column: 29, scope: !56)
!63 = !DILocalVariable(name: "d", arg: 3, scope: !56, file: !1, line: 41, type: !12)
!64 = !DILocation(line: 41, column: 36, scope: !56)
!65 = !DILocalVariable(name: "month_lengths", scope: !56, file: !1, line: 42, type: !66)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 384, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 12)
!69 = !DILocation(line: 42, column: 7, scope: !56)
!70 = !DILocation(line: 44, column: 3, scope: !56)
!71 = !DILocation(line: 44, column: 10, scope: !72)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 44, column: 3)
!73 = distinct !DILexicalBlock(scope: !56, file: !1, line: 44, column: 3)
!74 = !DILocation(line: 44, column: 12, scope: !72)
!75 = !DILocation(line: 44, column: 3, scope: !73)
!76 = !DILocation(line: 45, column: 25, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !1, line: 44, column: 23)
!78 = !DILocation(line: 45, column: 27, scope: !77)
!79 = !DILocation(line: 45, column: 10, scope: !77)
!80 = !DILocation(line: 45, column: 7, scope: !77)
!81 = !DILocation(line: 46, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !1, line: 46, column: 9)
!83 = !DILocation(line: 46, column: 11, scope: !82)
!84 = !DILocation(line: 46, column: 16, scope: !82)
!85 = !DILocation(line: 46, column: 19, scope: !82)
!86 = !DILocation(line: 46, column: 9, scope: !77)
!87 = !DILocation(line: 47, column: 7, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !1, line: 46, column: 35)
!89 = !DILocation(line: 48, column: 5, scope: !88)
!90 = !DILocation(line: 49, column: 3, scope: !77)
!91 = !DILocation(line: 44, column: 19, scope: !72)
!92 = !DILocation(line: 44, column: 3, scope: !72)
!93 = distinct !{!93, !75, !94}
!94 = !DILocation(line: 49, column: 3, scope: !73)
!95 = !DILocation(line: 50, column: 10, scope: !56)
!96 = !DILocation(line: 50, column: 3, scope: !56)
!97 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 54, type: !98, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DISubroutineType(types: !99)
!99 = !{!12, !12, !100}
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !97, file: !1, line: 54, type: !12)
!102 = !DILocation(line: 54, column: 15, scope: !97)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !97, file: !1, line: 54, type: !100)
!104 = !DILocation(line: 54, column: 28, scope: !97)
!105 = !DILocalVariable(name: "now", scope: !97, file: !1, line: 55, type: !106)
!106 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !107, line: 7, baseType: !108)
!107 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/time_t.h", directory: "")
!108 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !109, line: 160, baseType: !110)
!109 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!110 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!111 = !DILocation(line: 55, column: 10, scope: !97)
!112 = !DILocalVariable(name: "now_time", scope: !97, file: !1, line: 56, type: !113)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !115, line: 7, size: 448, elements: !116)
!115 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h", directory: "")
!116 = !{!117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127}
!117 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !114, file: !115, line: 9, baseType: !12, size: 32)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !114, file: !115, line: 10, baseType: !12, size: 32, offset: 32)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !114, file: !115, line: 11, baseType: !12, size: 32, offset: 64)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !114, file: !115, line: 12, baseType: !12, size: 32, offset: 96)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !114, file: !115, line: 13, baseType: !12, size: 32, offset: 128)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !114, file: !115, line: 14, baseType: !12, size: 32, offset: 160)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !114, file: !115, line: 15, baseType: !12, size: 32, offset: 192)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !114, file: !115, line: 16, baseType: !12, size: 32, offset: 224)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !114, file: !115, line: 17, baseType: !12, size: 32, offset: 256)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !114, file: !115, line: 20, baseType: !110, size: 64, offset: 320)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !114, file: !115, line: 21, baseType: !128, size: 64, offset: 384)
!128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !129, size: 64)
!129 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!130 = !DILocation(line: 56, column: 15, scope: !97)
!131 = !DILocalVariable(name: "year", scope: !97, file: !1, line: 57, type: !12)
!132 = !DILocation(line: 57, column: 7, scope: !97)
!133 = !DILocalVariable(name: "doy", scope: !97, file: !1, line: 57, type: !12)
!134 = !DILocation(line: 57, column: 13, scope: !97)
!135 = !DILocation(line: 59, column: 7, scope: !136)
!136 = distinct !DILexicalBlock(scope: !97, file: !1, line: 59, column: 7)
!137 = !DILocation(line: 59, column: 12, scope: !136)
!138 = !DILocation(line: 59, column: 7, scope: !97)
!139 = !DILocation(line: 60, column: 11, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !1, line: 59, column: 18)
!141 = !DILocation(line: 60, column: 9, scope: !140)
!142 = !DILocation(line: 61, column: 16, scope: !140)
!143 = !DILocation(line: 61, column: 14, scope: !140)
!144 = !DILocation(line: 62, column: 12, scope: !140)
!145 = !DILocation(line: 62, column: 22, scope: !140)
!146 = !DILocation(line: 62, column: 30, scope: !140)
!147 = !DILocation(line: 62, column: 10, scope: !140)
!148 = !DILocation(line: 62, column: 44, scope: !140)
!149 = !DILocation(line: 62, column: 54, scope: !140)
!150 = !DILocation(line: 62, column: 62, scope: !140)
!151 = !DILocation(line: 62, column: 42, scope: !140)
!152 = !DILocation(line: 63, column: 3, scope: !140)
!153 = !DILocation(line: 63, column: 14, scope: !154)
!154 = distinct !DILexicalBlock(scope: !136, file: !1, line: 63, column: 14)
!155 = !DILocation(line: 63, column: 19, scope: !154)
!156 = !DILocation(line: 63, column: 14, scope: !136)
!157 = !DILocation(line: 64, column: 18, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !1, line: 63, column: 25)
!159 = !DILocation(line: 64, column: 12, scope: !158)
!160 = !DILocation(line: 64, column: 10, scope: !158)
!161 = !DILocation(line: 64, column: 56, scope: !158)
!162 = !DILocation(line: 64, column: 50, scope: !158)
!163 = !DILocation(line: 64, column: 75, scope: !158)
!164 = !DILocation(line: 64, column: 69, scope: !158)
!165 = !DILocation(line: 64, column: 94, scope: !158)
!166 = !DILocation(line: 64, column: 88, scope: !158)
!167 = !DILocation(line: 64, column: 37, scope: !158)
!168 = !DILocation(line: 64, column: 35, scope: !158)
!169 = !DILocation(line: 65, column: 3, scope: !158)
!170 = !DILocalVariable(name: "result", scope: !97, file: !1, line: 67, type: !10)
!171 = !DILocation(line: 67, column: 10, scope: !97)
!172 = !DILocation(line: 67, column: 26, scope: !97)
!173 = !DILocation(line: 67, column: 32, scope: !97)
!174 = !DILocation(line: 67, column: 19, scope: !97)
!175 = !DILocation(line: 68, column: 9, scope: !97)
!176 = !DILocation(line: 68, column: 3, scope: !97)
!177 = !DILocation(line: 69, column: 9, scope: !97)
!178 = !DILocation(line: 69, column: 3, scope: !97)
!179 = !DILocation(line: 71, column: 3, scope: !97)
