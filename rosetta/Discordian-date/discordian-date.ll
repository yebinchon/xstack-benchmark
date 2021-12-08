; ModuleID = 'discordian-date.bc'
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
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !24

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %y.addr, align 4, !dbg !24
  %rem1 = srem i32 %2, 4, !dbg !24
  %cmp2 = icmp eq i32 %rem1, 0, !dbg !24
  br i1 %cmp2, label %land.lhs.true, label %if.end10, !dbg !24

land.lhs.true:                                    ; preds = %lor.lhs.false
  %3 = load i32, i32* %y.addr, align 4, !dbg !24
  %rem3 = srem i32 %3, 100, !dbg !24
  %tobool = icmp ne i32 %rem3, 0, !dbg !24
  br i1 %tobool, label %if.then, label %if.end10, !dbg !26

if.then:                                          ; preds = %land.lhs.true, %entry
  %4 = load i32, i32* %d.addr, align 4, !dbg !27
  %cmp4 = icmp eq i32 %4, 60, !dbg !30
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !31

if.then5:                                         ; preds = %if.then
  %5 = load i8*, i8** %result, align 8, !dbg !32
  %6 = load i32, i32* %dyear, align 4, !dbg !34
  %call6 = call i32 (i8*, i8*, ...) @sprintf(i8* %5, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0), i32 %6) #6, !dbg !35
  %7 = load i8*, i8** %result, align 8, !dbg !36
  store i8* %7, i8** %retval, align 8, !dbg !37
  br label %return, !dbg !37

if.else:                                          ; preds = %if.then
  %8 = load i32, i32* %d.addr, align 4, !dbg !38
  %cmp7 = icmp sge i32 %8, 60, !dbg !40
  br i1 %cmp7, label %if.then8, label %if.end, !dbg !41

if.then8:                                         ; preds = %if.else
  %9 = load i32, i32* %d.addr, align 4, !dbg !42
  %dec = add nsw i32 %9, -1, !dbg !42
  store i32 %dec, i32* %d.addr, align 4, !dbg !42
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then8, %if.else
  br label %if.end9

if.end9:                                          ; preds = %if.end
  br label %if.end10, !dbg !45

if.end10:                                         ; preds = %if.end9, %land.lhs.true, %lor.lhs.false
  %10 = load i8*, i8** %result, align 8, !dbg !46
  %11 = load i32, i32* %d.addr, align 4, !dbg !47
  %rem11 = srem i32 %11, 5, !dbg !47
  %cmp12 = icmp eq i32 %rem11, 1, !dbg !47
  br i1 %cmp12, label %cond.true, label %cond.false, !dbg !47

cond.true:                                        ; preds = %if.end10
  br label %cond.end26, !dbg !47

cond.false:                                       ; preds = %if.end10
  %12 = load i32, i32* %d.addr, align 4, !dbg !47
  %rem13 = srem i32 %12, 5, !dbg !47
  %cmp14 = icmp eq i32 %rem13, 2, !dbg !47
  br i1 %cmp14, label %cond.true15, label %cond.false16, !dbg !47

cond.true15:                                      ; preds = %cond.false
  br label %cond.end24, !dbg !47

cond.false16:                                     ; preds = %cond.false
  %13 = load i32, i32* %d.addr, align 4, !dbg !47
  %rem17 = srem i32 %13, 5, !dbg !47
  %cmp18 = icmp eq i32 %rem17, 3, !dbg !47
  br i1 %cmp18, label %cond.true19, label %cond.false20, !dbg !47

cond.true19:                                      ; preds = %cond.false16
  br label %cond.end, !dbg !47

cond.false20:                                     ; preds = %cond.false16
  %14 = load i32, i32* %d.addr, align 4, !dbg !47
  %rem21 = srem i32 %14, 5, !dbg !47
  %cmp22 = icmp eq i32 %rem21, 4, !dbg !47
  %15 = zext i1 %cmp22 to i64, !dbg !47
  %cond = select i1 %cmp22, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0), !dbg !47
  br label %cond.end, !dbg !47

cond.end:                                         ; preds = %cond.false20, %cond.true19
  %cond23 = phi i8* [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), %cond.true19 ], [ %cond, %cond.false20 ], !dbg !47
  br label %cond.end24, !dbg !47

cond.end24:                                       ; preds = %cond.end, %cond.true15
  %cond25 = phi i8* [ getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), %cond.true15 ], [ %cond23, %cond.end ], !dbg !47
  br label %cond.end26, !dbg !47

cond.end26:                                       ; preds = %cond.end24, %cond.true
  %cond27 = phi i8* [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0), %cond.true ], [ %cond25, %cond.end24 ], !dbg !47
  %16 = load i32, i32* %d.addr, align 4, !dbg !48
  %rem28 = srem i32 %16, 73, !dbg !48
  %cmp29 = icmp eq i32 %rem28, 0, !dbg !48
  br i1 %cmp29, label %cond.true30, label %cond.false31, !dbg !48

cond.true30:                                      ; preds = %cond.end26
  %17 = load i32, i32* %d.addr, align 4, !dbg !48
  %sub = sub nsw i32 %17, 1, !dbg !48
  br label %cond.end32, !dbg !48

cond.false31:                                     ; preds = %cond.end26
  %18 = load i32, i32* %d.addr, align 4, !dbg !48
  br label %cond.end32, !dbg !48

cond.end32:                                       ; preds = %cond.false31, %cond.true30
  %cond33 = phi i32 [ %sub, %cond.true30 ], [ %18, %cond.false31 ], !dbg !48
  %div = sdiv i32 %cond33, 73, !dbg !48
  %cmp34 = icmp eq i32 %div, 0, !dbg !48
  br i1 %cmp34, label %cond.true35, label %cond.false36, !dbg !48

cond.true35:                                      ; preds = %cond.end32
  br label %cond.end73, !dbg !48

cond.false36:                                     ; preds = %cond.end32
  %19 = load i32, i32* %d.addr, align 4, !dbg !48
  %rem37 = srem i32 %19, 73, !dbg !48
  %cmp38 = icmp eq i32 %rem37, 0, !dbg !48
  br i1 %cmp38, label %cond.true39, label %cond.false41, !dbg !48

cond.true39:                                      ; preds = %cond.false36
  %20 = load i32, i32* %d.addr, align 4, !dbg !48
  %sub40 = sub nsw i32 %20, 1, !dbg !48
  br label %cond.end42, !dbg !48

cond.false41:                                     ; preds = %cond.false36
  %21 = load i32, i32* %d.addr, align 4, !dbg !48
  br label %cond.end42, !dbg !48

cond.end42:                                       ; preds = %cond.false41, %cond.true39
  %cond43 = phi i32 [ %sub40, %cond.true39 ], [ %21, %cond.false41 ], !dbg !48
  %div44 = sdiv i32 %cond43, 73, !dbg !48
  %cmp45 = icmp eq i32 %div44, 1, !dbg !48
  br i1 %cmp45, label %cond.true46, label %cond.false47, !dbg !48

cond.true46:                                      ; preds = %cond.end42
  br label %cond.end71, !dbg !48

cond.false47:                                     ; preds = %cond.end42
  %22 = load i32, i32* %d.addr, align 4, !dbg !48
  %rem48 = srem i32 %22, 73, !dbg !48
  %cmp49 = icmp eq i32 %rem48, 0, !dbg !48
  br i1 %cmp49, label %cond.true50, label %cond.false52, !dbg !48

cond.true50:                                      ; preds = %cond.false47
  %23 = load i32, i32* %d.addr, align 4, !dbg !48
  %sub51 = sub nsw i32 %23, 1, !dbg !48
  br label %cond.end53, !dbg !48

cond.false52:                                     ; preds = %cond.false47
  %24 = load i32, i32* %d.addr, align 4, !dbg !48
  br label %cond.end53, !dbg !48

cond.end53:                                       ; preds = %cond.false52, %cond.true50
  %cond54 = phi i32 [ %sub51, %cond.true50 ], [ %24, %cond.false52 ], !dbg !48
  %div55 = sdiv i32 %cond54, 73, !dbg !48
  %cmp56 = icmp eq i32 %div55, 2, !dbg !48
  br i1 %cmp56, label %cond.true57, label %cond.false58, !dbg !48

cond.true57:                                      ; preds = %cond.end53
  br label %cond.end69, !dbg !48

cond.false58:                                     ; preds = %cond.end53
  %25 = load i32, i32* %d.addr, align 4, !dbg !48
  %rem59 = srem i32 %25, 73, !dbg !48
  %cmp60 = icmp eq i32 %rem59, 0, !dbg !48
  br i1 %cmp60, label %cond.true61, label %cond.false63, !dbg !48

cond.true61:                                      ; preds = %cond.false58
  %26 = load i32, i32* %d.addr, align 4, !dbg !48
  %sub62 = sub nsw i32 %26, 1, !dbg !48
  br label %cond.end64, !dbg !48

cond.false63:                                     ; preds = %cond.false58
  %27 = load i32, i32* %d.addr, align 4, !dbg !48
  br label %cond.end64, !dbg !48

cond.end64:                                       ; preds = %cond.false63, %cond.true61
  %cond65 = phi i32 [ %sub62, %cond.true61 ], [ %27, %cond.false63 ], !dbg !48
  %div66 = sdiv i32 %cond65, 73, !dbg !48
  %cmp67 = icmp eq i32 %div66, 3, !dbg !48
  %28 = zext i1 %cmp67 to i64, !dbg !48
  %cond68 = select i1 %cmp67, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.11, i64 0, i64 0), !dbg !48
  br label %cond.end69, !dbg !48

cond.end69:                                       ; preds = %cond.end64, %cond.true57
  %cond70 = phi i8* [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i64 0, i64 0), %cond.true57 ], [ %cond68, %cond.end64 ], !dbg !48
  br label %cond.end71, !dbg !48

cond.end71:                                       ; preds = %cond.end69, %cond.true46
  %cond72 = phi i8* [ getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i64 0, i64 0), %cond.true46 ], [ %cond70, %cond.end69 ], !dbg !48
  br label %cond.end73, !dbg !48

cond.end73:                                       ; preds = %cond.end71, %cond.true35
  %cond74 = phi i8* [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i64 0, i64 0), %cond.true35 ], [ %cond72, %cond.end71 ], !dbg !48
  %29 = load i32, i32* %d.addr, align 4, !dbg !49
  %rem75 = srem i32 %29, 73, !dbg !49
  %cmp76 = icmp eq i32 %rem75, 0, !dbg !49
  br i1 %cmp76, label %cond.true77, label %cond.false78, !dbg !49

cond.true77:                                      ; preds = %cond.end73
  br label %cond.end80, !dbg !49

cond.false78:                                     ; preds = %cond.end73
  %30 = load i32, i32* %d.addr, align 4, !dbg !49
  %rem79 = srem i32 %30, 73, !dbg !49
  br label %cond.end80, !dbg !49

cond.end80:                                       ; preds = %cond.false78, %cond.true77
  %cond81 = phi i32 [ 73, %cond.true77 ], [ %rem79, %cond.false78 ], !dbg !49
  %31 = load i32, i32* %dyear, align 4, !dbg !50
  %call82 = call i32 (i8*, i8*, ...) @sprintf(i8* %10, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0), i8* %cond27, i8* %cond74, i32 %cond81, i32 %31) #6, !dbg !51
  %32 = load i8*, i8** %result, align 8, !dbg !52
  store i8* %32, i8** %retval, align 8, !dbg !53
  br label %return, !dbg !53

return:                                           ; preds = %cond.end80, %if.then5
  %33 = load i8*, i8** %retval, align 8, !dbg !54
  ret i8* %33, !dbg !54
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8*, i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @day_of_year(i32 %y, i32 %m, i32 %d) #0 !dbg !55 {
entry:
  %y.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %month_lengths = alloca [12 x i32], align 16
  store i32 %y, i32* %y.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %y.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i32 %m, i32* %m.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i32 %d, i32* %d.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %d.addr, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata [12 x i32]* %month_lengths, metadata !64, metadata !DIExpression()), !dbg !68
  %0 = bitcast [12 x i32]* %month_lengths to i8*, !dbg !68
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([12 x i32]* @__const.day_of_year.month_lengths to i8*), i64 48, i1 false), !dbg !68
  br label %for.cond, !dbg !69

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %m.addr, align 4, !dbg !70
  %cmp = icmp sgt i32 %1, 1, !dbg !73
  br i1 %cmp, label %for.body, label %for.end, !dbg !74

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %m.addr, align 4, !dbg !75
  %sub = sub nsw i32 %2, 2, !dbg !77
  %idxprom = sext i32 %sub to i64, !dbg !78
  %arrayidx = getelementptr inbounds [12 x i32], [12 x i32]* %month_lengths, i64 0, i64 %idxprom, !dbg !78
  %3 = load i32, i32* %arrayidx, align 4, !dbg !78
  %4 = load i32, i32* %d.addr, align 4, !dbg !79
  %add = add nsw i32 %4, %3, !dbg !79
  store i32 %add, i32* %d.addr, align 4, !dbg !79
  %5 = load i32, i32* %m.addr, align 4, !dbg !80
  %cmp1 = icmp eq i32 %5, 3, !dbg !82
  br i1 %cmp1, label %land.lhs.true, label %if.end, !dbg !83

land.lhs.true:                                    ; preds = %for.body
  %6 = load i32, i32* %y.addr, align 4, !dbg !84
  %rem = srem i32 %6, 400, !dbg !84
  %cmp2 = icmp eq i32 %rem, 0, !dbg !84
  br i1 %cmp2, label %if.then, label %lor.lhs.false, !dbg !84

lor.lhs.false:                                    ; preds = %land.lhs.true
  %7 = load i32, i32* %y.addr, align 4, !dbg !84
  %rem3 = srem i32 %7, 4, !dbg !84
  %cmp4 = icmp eq i32 %rem3, 0, !dbg !84
  br i1 %cmp4, label %land.lhs.true5, label %if.end, !dbg !84

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %8 = load i32, i32* %y.addr, align 4, !dbg !84
  %rem6 = srem i32 %8, 100, !dbg !84
  %tobool = icmp ne i32 %rem6, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  %9 = load i32, i32* %d.addr, align 4, !dbg !86
  %inc = add nsw i32 %9, 1, !dbg !86
  store i32 %inc, i32* %d.addr, align 4, !dbg !86
  br label %if.end, !dbg !88

if.end:                                           ; preds = %if.then, %land.lhs.true5, %lor.lhs.false, %for.body
  br label %for.inc, !dbg !89

for.inc:                                          ; preds = %if.end
  %10 = load i32, i32* %m.addr, align 4, !dbg !90
  %dec = add nsw i32 %10, -1, !dbg !90
  store i32 %dec, i32* %m.addr, align 4, !dbg !90
  br label %for.cond, !dbg !91, !llvm.loop !92

for.end:                                          ; preds = %for.cond
  %11 = load i32, i32* %d.addr, align 4, !dbg !94
  ret i32 %11, !dbg !95
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !96 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i64* %now, metadata !104, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata %struct.tm** %now_time, metadata !111, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i32* %year, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i32* %doy, metadata !132, metadata !DIExpression()), !dbg !133
  %0 = load i32, i32* %argc.addr, align 4, !dbg !134
  %cmp = icmp eq i32 %0, 1, !dbg !136
  br i1 %cmp, label %if.then, label %if.else, !dbg !137

if.then:                                          ; preds = %entry
  %call = call i64 @time(i64* null) #6, !dbg !138
  store i64 %call, i64* %now, align 8, !dbg !140
  %call1 = call %struct.tm* @localtime(i64* %now) #6, !dbg !141
  store %struct.tm* %call1, %struct.tm** %now_time, align 8, !dbg !142
  %1 = load %struct.tm*, %struct.tm** %now_time, align 8, !dbg !143
  %tm_year = getelementptr inbounds %struct.tm, %struct.tm* %1, i32 0, i32 5, !dbg !144
  %2 = load i32, i32* %tm_year, align 4, !dbg !144
  %add = add nsw i32 %2, 1900, !dbg !145
  store i32 %add, i32* %year, align 4, !dbg !146
  %3 = load %struct.tm*, %struct.tm** %now_time, align 8, !dbg !147
  %tm_yday = getelementptr inbounds %struct.tm, %struct.tm* %3, i32 0, i32 7, !dbg !148
  %4 = load i32, i32* %tm_yday, align 4, !dbg !148
  %add2 = add nsw i32 %4, 1, !dbg !149
  store i32 %add2, i32* %doy, align 4, !dbg !150
  br label %if.end13, !dbg !151

if.else:                                          ; preds = %entry
  %5 = load i32, i32* %argc.addr, align 4, !dbg !152
  %cmp3 = icmp eq i32 %5, 4, !dbg !154
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !155

if.then4:                                         ; preds = %if.else
  %6 = load i8**, i8*** %argv.addr, align 8, !dbg !156
  %arrayidx = getelementptr inbounds i8*, i8** %6, i64 1, !dbg !156
  %7 = load i8*, i8** %arrayidx, align 8, !dbg !156
  %call5 = call i32 @atoi(i8* %7) #7, !dbg !158
  store i32 %call5, i32* %year, align 4, !dbg !159
  %8 = load i8**, i8*** %argv.addr, align 8, !dbg !160
  %arrayidx6 = getelementptr inbounds i8*, i8** %8, i64 1, !dbg !160
  %9 = load i8*, i8** %arrayidx6, align 8, !dbg !160
  %call7 = call i32 @atoi(i8* %9) #7, !dbg !161
  %10 = load i8**, i8*** %argv.addr, align 8, !dbg !162
  %arrayidx8 = getelementptr inbounds i8*, i8** %10, i64 2, !dbg !162
  %11 = load i8*, i8** %arrayidx8, align 8, !dbg !162
  %call9 = call i32 @atoi(i8* %11) #7, !dbg !163
  %12 = load i8**, i8*** %argv.addr, align 8, !dbg !164
  %arrayidx10 = getelementptr inbounds i8*, i8** %12, i64 3, !dbg !164
  %13 = load i8*, i8** %arrayidx10, align 8, !dbg !164
  %call11 = call i32 @atoi(i8* %13) #7, !dbg !165
  %call12 = call i32 @day_of_year(i32 %call7, i32 %call9, i32 %call11), !dbg !166
  store i32 %call12, i32* %doy, align 4, !dbg !167
  br label %if.end, !dbg !168

if.end:                                           ; preds = %if.then4, %if.else
  br label %if.end13

if.end13:                                         ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i8** %result, metadata !169, metadata !DIExpression()), !dbg !170
  %14 = load i32, i32* %year, align 4, !dbg !171
  %15 = load i32, i32* %doy, align 4, !dbg !172
  %call14 = call i8* @ddate(i32 %14, i32 %15), !dbg !173
  store i8* %call14, i8** %result, align 8, !dbg !170
  %16 = load i8*, i8** %result, align 8, !dbg !174
  %call15 = call i32 @puts(i8* %16), !dbg !175
  %17 = load i8*, i8** %result, align 8, !dbg !176
  call void @free(i8* %17) #6, !dbg !177
  ret i32 0, !dbg !178
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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "discordian-date.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Discordian-date")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!26 = !DILocation(line: 25, column: 7, scope: !7)
!27 = !DILocation(line: 26, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !1, line: 26, column: 9)
!29 = distinct !DILexicalBlock(scope: !25, file: !1, line: 25, column: 23)
!30 = !DILocation(line: 26, column: 11, scope: !28)
!31 = !DILocation(line: 26, column: 9, scope: !29)
!32 = !DILocation(line: 27, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !28, file: !1, line: 26, column: 18)
!34 = !DILocation(line: 27, column: 50, scope: !33)
!35 = !DILocation(line: 27, column: 7, scope: !33)
!36 = !DILocation(line: 28, column: 14, scope: !33)
!37 = !DILocation(line: 28, column: 7, scope: !33)
!38 = !DILocation(line: 29, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !28, file: !1, line: 29, column: 16)
!40 = !DILocation(line: 29, column: 18, scope: !39)
!41 = !DILocation(line: 29, column: 16, scope: !28)
!42 = !DILocation(line: 30, column: 7, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !1, line: 29, column: 25)
!44 = !DILocation(line: 31, column: 5, scope: !43)
!45 = !DILocation(line: 32, column: 3, scope: !29)
!46 = !DILocation(line: 34, column: 12, scope: !7)
!47 = !DILocation(line: 35, column: 12, scope: !7)
!48 = !DILocation(line: 35, column: 30, scope: !7)
!49 = !DILocation(line: 35, column: 61, scope: !7)
!50 = !DILocation(line: 35, column: 72, scope: !7)
!51 = !DILocation(line: 34, column: 3, scope: !7)
!52 = !DILocation(line: 37, column: 10, scope: !7)
!53 = !DILocation(line: 37, column: 3, scope: !7)
!54 = !DILocation(line: 38, column: 1, scope: !7)
!55 = distinct !DISubprogram(name: "day_of_year", scope: !1, file: !1, line: 41, type: !56, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!12, !12, !12, !12}
!58 = !DILocalVariable(name: "y", arg: 1, scope: !55, file: !1, line: 41, type: !12)
!59 = !DILocation(line: 41, column: 22, scope: !55)
!60 = !DILocalVariable(name: "m", arg: 2, scope: !55, file: !1, line: 41, type: !12)
!61 = !DILocation(line: 41, column: 29, scope: !55)
!62 = !DILocalVariable(name: "d", arg: 3, scope: !55, file: !1, line: 41, type: !12)
!63 = !DILocation(line: 41, column: 36, scope: !55)
!64 = !DILocalVariable(name: "month_lengths", scope: !55, file: !1, line: 42, type: !65)
!65 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 384, elements: !66)
!66 = !{!67}
!67 = !DISubrange(count: 12)
!68 = !DILocation(line: 42, column: 7, scope: !55)
!69 = !DILocation(line: 44, column: 3, scope: !55)
!70 = !DILocation(line: 44, column: 10, scope: !71)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 44, column: 3)
!72 = distinct !DILexicalBlock(scope: !55, file: !1, line: 44, column: 3)
!73 = !DILocation(line: 44, column: 12, scope: !71)
!74 = !DILocation(line: 44, column: 3, scope: !72)
!75 = !DILocation(line: 45, column: 25, scope: !76)
!76 = distinct !DILexicalBlock(scope: !71, file: !1, line: 44, column: 23)
!77 = !DILocation(line: 45, column: 27, scope: !76)
!78 = !DILocation(line: 45, column: 10, scope: !76)
!79 = !DILocation(line: 45, column: 7, scope: !76)
!80 = !DILocation(line: 46, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !1, line: 46, column: 9)
!82 = !DILocation(line: 46, column: 11, scope: !81)
!83 = !DILocation(line: 46, column: 16, scope: !81)
!84 = !DILocation(line: 46, column: 19, scope: !81)
!85 = !DILocation(line: 46, column: 9, scope: !76)
!86 = !DILocation(line: 47, column: 7, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !1, line: 46, column: 35)
!88 = !DILocation(line: 48, column: 5, scope: !87)
!89 = !DILocation(line: 49, column: 3, scope: !76)
!90 = !DILocation(line: 44, column: 19, scope: !71)
!91 = !DILocation(line: 44, column: 3, scope: !71)
!92 = distinct !{!92, !74, !93}
!93 = !DILocation(line: 49, column: 3, scope: !72)
!94 = !DILocation(line: 50, column: 10, scope: !55)
!95 = !DILocation(line: 50, column: 3, scope: !55)
!96 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 54, type: !97, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{!12, !12, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !1, line: 54, type: !12)
!101 = !DILocation(line: 54, column: 15, scope: !96)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !1, line: 54, type: !99)
!103 = !DILocation(line: 54, column: 28, scope: !96)
!104 = !DILocalVariable(name: "now", scope: !96, file: !1, line: 55, type: !105)
!105 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !106, line: 7, baseType: !107)
!106 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/time_t.h", directory: "")
!107 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !108, line: 160, baseType: !109)
!108 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!109 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!110 = !DILocation(line: 55, column: 10, scope: !96)
!111 = !DILocalVariable(name: "now_time", scope: !96, file: !1, line: 56, type: !112)
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !114, line: 7, size: 448, elements: !115)
!114 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h", directory: "")
!115 = !{!116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126}
!116 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !113, file: !114, line: 9, baseType: !12, size: 32)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !113, file: !114, line: 10, baseType: !12, size: 32, offset: 32)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !113, file: !114, line: 11, baseType: !12, size: 32, offset: 64)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !113, file: !114, line: 12, baseType: !12, size: 32, offset: 96)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !113, file: !114, line: 13, baseType: !12, size: 32, offset: 128)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !113, file: !114, line: 14, baseType: !12, size: 32, offset: 160)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !113, file: !114, line: 15, baseType: !12, size: 32, offset: 192)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !113, file: !114, line: 16, baseType: !12, size: 32, offset: 224)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !113, file: !114, line: 17, baseType: !12, size: 32, offset: 256)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !113, file: !114, line: 20, baseType: !109, size: 64, offset: 320)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !113, file: !114, line: 21, baseType: !127, size: 64, offset: 384)
!127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !128, size: 64)
!128 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!129 = !DILocation(line: 56, column: 15, scope: !96)
!130 = !DILocalVariable(name: "year", scope: !96, file: !1, line: 57, type: !12)
!131 = !DILocation(line: 57, column: 7, scope: !96)
!132 = !DILocalVariable(name: "doy", scope: !96, file: !1, line: 57, type: !12)
!133 = !DILocation(line: 57, column: 13, scope: !96)
!134 = !DILocation(line: 59, column: 7, scope: !135)
!135 = distinct !DILexicalBlock(scope: !96, file: !1, line: 59, column: 7)
!136 = !DILocation(line: 59, column: 12, scope: !135)
!137 = !DILocation(line: 59, column: 7, scope: !96)
!138 = !DILocation(line: 60, column: 11, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !1, line: 59, column: 18)
!140 = !DILocation(line: 60, column: 9, scope: !139)
!141 = !DILocation(line: 61, column: 16, scope: !139)
!142 = !DILocation(line: 61, column: 14, scope: !139)
!143 = !DILocation(line: 62, column: 12, scope: !139)
!144 = !DILocation(line: 62, column: 22, scope: !139)
!145 = !DILocation(line: 62, column: 30, scope: !139)
!146 = !DILocation(line: 62, column: 10, scope: !139)
!147 = !DILocation(line: 62, column: 44, scope: !139)
!148 = !DILocation(line: 62, column: 54, scope: !139)
!149 = !DILocation(line: 62, column: 62, scope: !139)
!150 = !DILocation(line: 62, column: 42, scope: !139)
!151 = !DILocation(line: 63, column: 3, scope: !139)
!152 = !DILocation(line: 63, column: 14, scope: !153)
!153 = distinct !DILexicalBlock(scope: !135, file: !1, line: 63, column: 14)
!154 = !DILocation(line: 63, column: 19, scope: !153)
!155 = !DILocation(line: 63, column: 14, scope: !135)
!156 = !DILocation(line: 64, column: 18, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !1, line: 63, column: 25)
!158 = !DILocation(line: 64, column: 12, scope: !157)
!159 = !DILocation(line: 64, column: 10, scope: !157)
!160 = !DILocation(line: 64, column: 56, scope: !157)
!161 = !DILocation(line: 64, column: 50, scope: !157)
!162 = !DILocation(line: 64, column: 75, scope: !157)
!163 = !DILocation(line: 64, column: 69, scope: !157)
!164 = !DILocation(line: 64, column: 94, scope: !157)
!165 = !DILocation(line: 64, column: 88, scope: !157)
!166 = !DILocation(line: 64, column: 37, scope: !157)
!167 = !DILocation(line: 64, column: 35, scope: !157)
!168 = !DILocation(line: 65, column: 3, scope: !157)
!169 = !DILocalVariable(name: "result", scope: !96, file: !1, line: 67, type: !10)
!170 = !DILocation(line: 67, column: 10, scope: !96)
!171 = !DILocation(line: 67, column: 26, scope: !96)
!172 = !DILocation(line: 67, column: 32, scope: !96)
!173 = !DILocation(line: 67, column: 19, scope: !96)
!174 = !DILocation(line: 68, column: 9, scope: !96)
!175 = !DILocation(line: 68, column: 3, scope: !96)
!176 = !DILocation(line: 69, column: 9, scope: !96)
!177 = !DILocation(line: 69, column: 3, scope: !96)
!178 = !DILocation(line: 71, column: 3, scope: !96)
