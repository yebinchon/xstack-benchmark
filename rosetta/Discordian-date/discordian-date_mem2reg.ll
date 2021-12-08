; ModuleID = 'discordian-date.ll'
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
  call void @llvm.dbg.value(metadata i32 %y, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 %d, metadata !15, metadata !DIExpression()), !dbg !14
  %add = add nsw i32 1166, %y, !dbg !16
  call void @llvm.dbg.value(metadata i32 %add, metadata !17, metadata !DIExpression()), !dbg !14
  %call = call noalias i8* @malloc(i64 100) #6, !dbg !18
  call void @llvm.dbg.value(metadata i8* %call, metadata !19, metadata !DIExpression()), !dbg !14
  %rem = srem i32 %y, 400, !dbg !20
  %cmp = icmp eq i32 %rem, 0, !dbg !20
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !20

lor.lhs.false:                                    ; preds = %entry
  %rem1 = srem i32 %y, 4, !dbg !20
  %cmp2 = icmp eq i32 %rem1, 0, !dbg !20
  br i1 %cmp2, label %land.lhs.true, label %if.end10, !dbg !20

land.lhs.true:                                    ; preds = %lor.lhs.false
  %rem3 = srem i32 %y, 100, !dbg !20
  %tobool = icmp ne i32 %rem3, 0, !dbg !20
  br i1 %tobool, label %if.then, label %if.end10, !dbg !22

if.then:                                          ; preds = %land.lhs.true, %entry
  %cmp4 = icmp eq i32 %d, 60, !dbg !23
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !26

if.then5:                                         ; preds = %if.then
  %call6 = call i32 (i8*, i8*, ...) @sprintf(i8* %call, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0), i32 %add) #6, !dbg !27
  br label %return, !dbg !29

if.else:                                          ; preds = %if.then
  %cmp7 = icmp sge i32 %d, 60, !dbg !30
  br i1 %cmp7, label %if.then8, label %if.end, !dbg !32

if.then8:                                         ; preds = %if.else
  %dec = add nsw i32 %d, -1, !dbg !33
  call void @llvm.dbg.value(metadata i32 %dec, metadata !15, metadata !DIExpression()), !dbg !14
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then8, %if.else
  %d.addr.0 = phi i32 [ %dec, %if.then8 ], [ %d, %if.else ]
  call void @llvm.dbg.value(metadata i32 %d.addr.0, metadata !15, metadata !DIExpression()), !dbg !14
  br label %if.end9

if.end9:                                          ; preds = %if.end
  br label %if.end10, !dbg !36

if.end10:                                         ; preds = %if.end9, %land.lhs.true, %lor.lhs.false
  %d.addr.1 = phi i32 [ %d.addr.0, %if.end9 ], [ %d, %land.lhs.true ], [ %d, %lor.lhs.false ]
  call void @llvm.dbg.value(metadata i32 %d.addr.1, metadata !15, metadata !DIExpression()), !dbg !14
  %rem11 = srem i32 %d.addr.1, 5, !dbg !37
  %cmp12 = icmp eq i32 %rem11, 1, !dbg !37
  br i1 %cmp12, label %cond.true, label %cond.false, !dbg !37

cond.true:                                        ; preds = %if.end10
  br label %cond.end26, !dbg !37

cond.false:                                       ; preds = %if.end10
  %rem13 = srem i32 %d.addr.1, 5, !dbg !37
  %cmp14 = icmp eq i32 %rem13, 2, !dbg !37
  br i1 %cmp14, label %cond.true15, label %cond.false16, !dbg !37

cond.true15:                                      ; preds = %cond.false
  br label %cond.end24, !dbg !37

cond.false16:                                     ; preds = %cond.false
  %rem17 = srem i32 %d.addr.1, 5, !dbg !37
  %cmp18 = icmp eq i32 %rem17, 3, !dbg !37
  br i1 %cmp18, label %cond.true19, label %cond.false20, !dbg !37

cond.true19:                                      ; preds = %cond.false16
  br label %cond.end, !dbg !37

cond.false20:                                     ; preds = %cond.false16
  %rem21 = srem i32 %d.addr.1, 5, !dbg !37
  %cmp22 = icmp eq i32 %rem21, 4, !dbg !37
  %0 = zext i1 %cmp22 to i64, !dbg !37
  %cond = select i1 %cmp22, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0), !dbg !37
  br label %cond.end, !dbg !37

cond.end:                                         ; preds = %cond.false20, %cond.true19
  %cond23 = phi i8* [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), %cond.true19 ], [ %cond, %cond.false20 ], !dbg !37
  br label %cond.end24, !dbg !37

cond.end24:                                       ; preds = %cond.end, %cond.true15
  %cond25 = phi i8* [ getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), %cond.true15 ], [ %cond23, %cond.end ], !dbg !37
  br label %cond.end26, !dbg !37

cond.end26:                                       ; preds = %cond.end24, %cond.true
  %cond27 = phi i8* [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0), %cond.true ], [ %cond25, %cond.end24 ], !dbg !37
  %rem28 = srem i32 %d.addr.1, 73, !dbg !38
  %cmp29 = icmp eq i32 %rem28, 0, !dbg !38
  br i1 %cmp29, label %cond.true30, label %cond.false31, !dbg !38

cond.true30:                                      ; preds = %cond.end26
  %sub = sub nsw i32 %d.addr.1, 1, !dbg !38
  br label %cond.end32, !dbg !38

cond.false31:                                     ; preds = %cond.end26
  br label %cond.end32, !dbg !38

cond.end32:                                       ; preds = %cond.false31, %cond.true30
  %cond33 = phi i32 [ %sub, %cond.true30 ], [ %d.addr.1, %cond.false31 ], !dbg !38
  %div = sdiv i32 %cond33, 73, !dbg !38
  %cmp34 = icmp eq i32 %div, 0, !dbg !38
  br i1 %cmp34, label %cond.true35, label %cond.false36, !dbg !38

cond.true35:                                      ; preds = %cond.end32
  br label %cond.end73, !dbg !38

cond.false36:                                     ; preds = %cond.end32
  %rem37 = srem i32 %d.addr.1, 73, !dbg !38
  %cmp38 = icmp eq i32 %rem37, 0, !dbg !38
  br i1 %cmp38, label %cond.true39, label %cond.false41, !dbg !38

cond.true39:                                      ; preds = %cond.false36
  %sub40 = sub nsw i32 %d.addr.1, 1, !dbg !38
  br label %cond.end42, !dbg !38

cond.false41:                                     ; preds = %cond.false36
  br label %cond.end42, !dbg !38

cond.end42:                                       ; preds = %cond.false41, %cond.true39
  %cond43 = phi i32 [ %sub40, %cond.true39 ], [ %d.addr.1, %cond.false41 ], !dbg !38
  %div44 = sdiv i32 %cond43, 73, !dbg !38
  %cmp45 = icmp eq i32 %div44, 1, !dbg !38
  br i1 %cmp45, label %cond.true46, label %cond.false47, !dbg !38

cond.true46:                                      ; preds = %cond.end42
  br label %cond.end71, !dbg !38

cond.false47:                                     ; preds = %cond.end42
  %rem48 = srem i32 %d.addr.1, 73, !dbg !38
  %cmp49 = icmp eq i32 %rem48, 0, !dbg !38
  br i1 %cmp49, label %cond.true50, label %cond.false52, !dbg !38

cond.true50:                                      ; preds = %cond.false47
  %sub51 = sub nsw i32 %d.addr.1, 1, !dbg !38
  br label %cond.end53, !dbg !38

cond.false52:                                     ; preds = %cond.false47
  br label %cond.end53, !dbg !38

cond.end53:                                       ; preds = %cond.false52, %cond.true50
  %cond54 = phi i32 [ %sub51, %cond.true50 ], [ %d.addr.1, %cond.false52 ], !dbg !38
  %div55 = sdiv i32 %cond54, 73, !dbg !38
  %cmp56 = icmp eq i32 %div55, 2, !dbg !38
  br i1 %cmp56, label %cond.true57, label %cond.false58, !dbg !38

cond.true57:                                      ; preds = %cond.end53
  br label %cond.end69, !dbg !38

cond.false58:                                     ; preds = %cond.end53
  %rem59 = srem i32 %d.addr.1, 73, !dbg !38
  %cmp60 = icmp eq i32 %rem59, 0, !dbg !38
  br i1 %cmp60, label %cond.true61, label %cond.false63, !dbg !38

cond.true61:                                      ; preds = %cond.false58
  %sub62 = sub nsw i32 %d.addr.1, 1, !dbg !38
  br label %cond.end64, !dbg !38

cond.false63:                                     ; preds = %cond.false58
  br label %cond.end64, !dbg !38

cond.end64:                                       ; preds = %cond.false63, %cond.true61
  %cond65 = phi i32 [ %sub62, %cond.true61 ], [ %d.addr.1, %cond.false63 ], !dbg !38
  %div66 = sdiv i32 %cond65, 73, !dbg !38
  %cmp67 = icmp eq i32 %div66, 3, !dbg !38
  %1 = zext i1 %cmp67 to i64, !dbg !38
  %cond68 = select i1 %cmp67, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.11, i64 0, i64 0), !dbg !38
  br label %cond.end69, !dbg !38

cond.end69:                                       ; preds = %cond.end64, %cond.true57
  %cond70 = phi i8* [ getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i64 0, i64 0), %cond.true57 ], [ %cond68, %cond.end64 ], !dbg !38
  br label %cond.end71, !dbg !38

cond.end71:                                       ; preds = %cond.end69, %cond.true46
  %cond72 = phi i8* [ getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i64 0, i64 0), %cond.true46 ], [ %cond70, %cond.end69 ], !dbg !38
  br label %cond.end73, !dbg !38

cond.end73:                                       ; preds = %cond.end71, %cond.true35
  %cond74 = phi i8* [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i64 0, i64 0), %cond.true35 ], [ %cond72, %cond.end71 ], !dbg !38
  %rem75 = srem i32 %d.addr.1, 73, !dbg !39
  %cmp76 = icmp eq i32 %rem75, 0, !dbg !39
  br i1 %cmp76, label %cond.true77, label %cond.false78, !dbg !39

cond.true77:                                      ; preds = %cond.end73
  br label %cond.end80, !dbg !39

cond.false78:                                     ; preds = %cond.end73
  %rem79 = srem i32 %d.addr.1, 73, !dbg !39
  br label %cond.end80, !dbg !39

cond.end80:                                       ; preds = %cond.false78, %cond.true77
  %cond81 = phi i32 [ 73, %cond.true77 ], [ %rem79, %cond.false78 ], !dbg !39
  %call82 = call i32 (i8*, i8*, ...) @sprintf(i8* %call, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0), i8* %cond27, i8* %cond74, i32 %cond81, i32 %add) #6, !dbg !40
  br label %return, !dbg !41

return:                                           ; preds = %cond.end80, %if.then5
  ret i8* %call, !dbg !42
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8*, i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @day_of_year(i32 %y, i32 %m, i32 %d) #0 !dbg !43 {
entry:
  %month_lengths = alloca [12 x i32], align 16
  call void @llvm.dbg.value(metadata i32 %y, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.value(metadata i32 %m, metadata !48, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.value(metadata i32 %d, metadata !49, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [12 x i32]* %month_lengths, metadata !50, metadata !DIExpression()), !dbg !54
  %0 = bitcast [12 x i32]* %month_lengths to i8*, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([12 x i32]* @__const.day_of_year.month_lengths to i8*), i64 48, i1 false), !dbg !54
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %entry
  %m.addr.0 = phi i32 [ %m, %entry ], [ %dec, %for.inc ]
  %d.addr.0 = phi i32 [ %d, %entry ], [ %d.addr.1, %for.inc ]
  call void @llvm.dbg.value(metadata i32 %d.addr.0, metadata !49, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.value(metadata i32 %m.addr.0, metadata !48, metadata !DIExpression()), !dbg !47
  %cmp = icmp sgt i32 %m.addr.0, 1, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %sub = sub nsw i32 %m.addr.0, 2, !dbg !60
  %idxprom = sext i32 %sub to i64, !dbg !62
  %arrayidx = getelementptr inbounds [12 x i32], [12 x i32]* %month_lengths, i64 0, i64 %idxprom, !dbg !62
  %1 = load i32, i32* %arrayidx, align 4, !dbg !62
  %add = add nsw i32 %d.addr.0, %1, !dbg !63
  call void @llvm.dbg.value(metadata i32 %add, metadata !49, metadata !DIExpression()), !dbg !47
  %cmp1 = icmp eq i32 %m.addr.0, 3, !dbg !64
  br i1 %cmp1, label %land.lhs.true, label %if.end, !dbg !66

land.lhs.true:                                    ; preds = %for.body
  %rem = srem i32 %y, 400, !dbg !67
  %cmp2 = icmp eq i32 %rem, 0, !dbg !67
  br i1 %cmp2, label %if.then, label %lor.lhs.false, !dbg !67

lor.lhs.false:                                    ; preds = %land.lhs.true
  %rem3 = srem i32 %y, 4, !dbg !67
  %cmp4 = icmp eq i32 %rem3, 0, !dbg !67
  br i1 %cmp4, label %land.lhs.true5, label %if.end, !dbg !67

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %rem6 = srem i32 %y, 100, !dbg !67
  %tobool = icmp ne i32 %rem6, 0, !dbg !67
  br i1 %tobool, label %if.then, label %if.end, !dbg !68

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  %inc = add nsw i32 %add, 1, !dbg !69
  call void @llvm.dbg.value(metadata i32 %inc, metadata !49, metadata !DIExpression()), !dbg !47
  br label %if.end, !dbg !71

if.end:                                           ; preds = %if.then, %land.lhs.true5, %lor.lhs.false, %for.body
  %d.addr.1 = phi i32 [ %inc, %if.then ], [ %add, %land.lhs.true5 ], [ %add, %lor.lhs.false ], [ %add, %for.body ], !dbg !72
  call void @llvm.dbg.value(metadata i32 %d.addr.1, metadata !49, metadata !DIExpression()), !dbg !47
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %if.end
  %dec = add nsw i32 %m.addr.0, -1, !dbg !74
  call void @llvm.dbg.value(metadata i32 %dec, metadata !48, metadata !DIExpression()), !dbg !47
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  ret i32 %d.addr.0, !dbg !78
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %now = alloca i64, align 8
  call void @llvm.dbg.value(metadata i32 %argc, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i8** %argv, metadata !85, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i64* %now, metadata !86, metadata !DIExpression()), !dbg !92
  %cmp = icmp eq i32 %argc, 1, !dbg !93
  br i1 %cmp, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %entry
  %call = call i64 @time(i64* null) #6, !dbg !96
  store i64 %call, i64* %now, align 8, !dbg !98
  %call1 = call %struct.tm* @localtime(i64* %now) #6, !dbg !99
  call void @llvm.dbg.value(metadata %struct.tm* %call1, metadata !100, metadata !DIExpression()), !dbg !84
  %tm_year = getelementptr inbounds %struct.tm, %struct.tm* %call1, i32 0, i32 5, !dbg !118
  %0 = load i32, i32* %tm_year, align 4, !dbg !118
  %add = add nsw i32 %0, 1900, !dbg !119
  call void @llvm.dbg.value(metadata i32 %add, metadata !120, metadata !DIExpression()), !dbg !84
  %tm_yday = getelementptr inbounds %struct.tm, %struct.tm* %call1, i32 0, i32 7, !dbg !121
  %1 = load i32, i32* %tm_yday, align 4, !dbg !121
  %add2 = add nsw i32 %1, 1, !dbg !122
  call void @llvm.dbg.value(metadata i32 %add2, metadata !123, metadata !DIExpression()), !dbg !84
  br label %if.end13, !dbg !124

if.else:                                          ; preds = %entry
  %cmp3 = icmp eq i32 %argc, 4, !dbg !125
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !127

if.then4:                                         ; preds = %if.else
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !128
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !128
  %call5 = call i32 @atoi(i8* %2) #7, !dbg !130
  call void @llvm.dbg.value(metadata i32 %call5, metadata !120, metadata !DIExpression()), !dbg !84
  %arrayidx6 = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !131
  %3 = load i8*, i8** %arrayidx6, align 8, !dbg !131
  %call7 = call i32 @atoi(i8* %3) #7, !dbg !132
  %arrayidx8 = getelementptr inbounds i8*, i8** %argv, i64 2, !dbg !133
  %4 = load i8*, i8** %arrayidx8, align 8, !dbg !133
  %call9 = call i32 @atoi(i8* %4) #7, !dbg !134
  %arrayidx10 = getelementptr inbounds i8*, i8** %argv, i64 3, !dbg !135
  %5 = load i8*, i8** %arrayidx10, align 8, !dbg !135
  %call11 = call i32 @atoi(i8* %5) #7, !dbg !136
  %call12 = call i32 @day_of_year(i32 %call7, i32 %call9, i32 %call11), !dbg !137
  call void @llvm.dbg.value(metadata i32 %call12, metadata !123, metadata !DIExpression()), !dbg !84
  br label %if.end, !dbg !138

if.end:                                           ; preds = %if.then4, %if.else
  %year.0 = phi i32 [ %call5, %if.then4 ], [ undef, %if.else ]
  %doy.0 = phi i32 [ %call12, %if.then4 ], [ undef, %if.else ]
  call void @llvm.dbg.value(metadata i32 %doy.0, metadata !123, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 %year.0, metadata !120, metadata !DIExpression()), !dbg !84
  br label %if.end13

if.end13:                                         ; preds = %if.end, %if.then
  %year.1 = phi i32 [ %add, %if.then ], [ %year.0, %if.end ], !dbg !139
  %doy.1 = phi i32 [ %add2, %if.then ], [ %doy.0, %if.end ], !dbg !139
  call void @llvm.dbg.value(metadata i32 %doy.1, metadata !123, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 %year.1, metadata !120, metadata !DIExpression()), !dbg !84
  %call14 = call i8* @ddate(i32 %year.1, i32 %doy.1), !dbg !140
  call void @llvm.dbg.value(metadata i8* %call14, metadata !141, metadata !DIExpression()), !dbg !84
  %call15 = call i32 @puts(i8* %call14), !dbg !142
  call void @free(i8* %call14) #6, !dbg !143
  ret i32 0, !dbg !144
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

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!14 = !DILocation(line: 0, scope: !7)
!15 = !DILocalVariable(name: "d", arg: 2, scope: !7, file: !1, line: 21, type: !12)
!16 = !DILocation(line: 22, column: 20, scope: !7)
!17 = !DILocalVariable(name: "dyear", scope: !7, file: !1, line: 22, type: !12)
!18 = !DILocation(line: 23, column: 19, scope: !7)
!19 = !DILocalVariable(name: "result", scope: !7, file: !1, line: 23, type: !10)
!20 = !DILocation(line: 25, column: 7, scope: !21)
!21 = distinct !DILexicalBlock(scope: !7, file: !1, line: 25, column: 7)
!22 = !DILocation(line: 25, column: 7, scope: !7)
!23 = !DILocation(line: 26, column: 11, scope: !24)
!24 = distinct !DILexicalBlock(scope: !25, file: !1, line: 26, column: 9)
!25 = distinct !DILexicalBlock(scope: !21, file: !1, line: 25, column: 23)
!26 = !DILocation(line: 26, column: 9, scope: !25)
!27 = !DILocation(line: 27, column: 7, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !1, line: 26, column: 18)
!29 = !DILocation(line: 28, column: 7, scope: !28)
!30 = !DILocation(line: 29, column: 18, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !1, line: 29, column: 16)
!32 = !DILocation(line: 29, column: 16, scope: !24)
!33 = !DILocation(line: 30, column: 7, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !1, line: 29, column: 25)
!35 = !DILocation(line: 31, column: 5, scope: !34)
!36 = !DILocation(line: 32, column: 3, scope: !25)
!37 = !DILocation(line: 35, column: 12, scope: !7)
!38 = !DILocation(line: 35, column: 30, scope: !7)
!39 = !DILocation(line: 35, column: 61, scope: !7)
!40 = !DILocation(line: 34, column: 3, scope: !7)
!41 = !DILocation(line: 37, column: 3, scope: !7)
!42 = !DILocation(line: 38, column: 1, scope: !7)
!43 = distinct !DISubprogram(name: "day_of_year", scope: !1, file: !1, line: 41, type: !44, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!12, !12, !12, !12}
!46 = !DILocalVariable(name: "y", arg: 1, scope: !43, file: !1, line: 41, type: !12)
!47 = !DILocation(line: 0, scope: !43)
!48 = !DILocalVariable(name: "m", arg: 2, scope: !43, file: !1, line: 41, type: !12)
!49 = !DILocalVariable(name: "d", arg: 3, scope: !43, file: !1, line: 41, type: !12)
!50 = !DILocalVariable(name: "month_lengths", scope: !43, file: !1, line: 42, type: !51)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 384, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 12)
!54 = !DILocation(line: 42, column: 7, scope: !43)
!55 = !DILocation(line: 44, column: 3, scope: !43)
!56 = !DILocation(line: 44, column: 12, scope: !57)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 44, column: 3)
!58 = distinct !DILexicalBlock(scope: !43, file: !1, line: 44, column: 3)
!59 = !DILocation(line: 44, column: 3, scope: !58)
!60 = !DILocation(line: 45, column: 27, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !1, line: 44, column: 23)
!62 = !DILocation(line: 45, column: 10, scope: !61)
!63 = !DILocation(line: 45, column: 7, scope: !61)
!64 = !DILocation(line: 46, column: 11, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !1, line: 46, column: 9)
!66 = !DILocation(line: 46, column: 16, scope: !65)
!67 = !DILocation(line: 46, column: 19, scope: !65)
!68 = !DILocation(line: 46, column: 9, scope: !61)
!69 = !DILocation(line: 47, column: 7, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !1, line: 46, column: 35)
!71 = !DILocation(line: 48, column: 5, scope: !70)
!72 = !DILocation(line: 0, scope: !61)
!73 = !DILocation(line: 49, column: 3, scope: !61)
!74 = !DILocation(line: 44, column: 19, scope: !57)
!75 = !DILocation(line: 44, column: 3, scope: !57)
!76 = distinct !{!76, !59, !77}
!77 = !DILocation(line: 49, column: 3, scope: !58)
!78 = !DILocation(line: 50, column: 3, scope: !43)
!79 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 54, type: !80, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!12, !12, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !1, line: 54, type: !12)
!84 = !DILocation(line: 0, scope: !79)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !1, line: 54, type: !82)
!86 = !DILocalVariable(name: "now", scope: !79, file: !1, line: 55, type: !87)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !88, line: 7, baseType: !89)
!88 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/time_t.h", directory: "")
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !90, line: 160, baseType: !91)
!90 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!91 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!92 = !DILocation(line: 55, column: 10, scope: !79)
!93 = !DILocation(line: 59, column: 12, scope: !94)
!94 = distinct !DILexicalBlock(scope: !79, file: !1, line: 59, column: 7)
!95 = !DILocation(line: 59, column: 7, scope: !79)
!96 = !DILocation(line: 60, column: 11, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !1, line: 59, column: 18)
!98 = !DILocation(line: 60, column: 9, scope: !97)
!99 = !DILocation(line: 61, column: 16, scope: !97)
!100 = !DILocalVariable(name: "now_time", scope: !79, file: !1, line: 56, type: !101)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !103, line: 7, size: 448, elements: !104)
!103 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h", directory: "")
!104 = !{!105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115}
!105 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !102, file: !103, line: 9, baseType: !12, size: 32)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !102, file: !103, line: 10, baseType: !12, size: 32, offset: 32)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !102, file: !103, line: 11, baseType: !12, size: 32, offset: 64)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !102, file: !103, line: 12, baseType: !12, size: 32, offset: 96)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !102, file: !103, line: 13, baseType: !12, size: 32, offset: 128)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !102, file: !103, line: 14, baseType: !12, size: 32, offset: 160)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !102, file: !103, line: 15, baseType: !12, size: 32, offset: 192)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !102, file: !103, line: 16, baseType: !12, size: 32, offset: 224)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !102, file: !103, line: 17, baseType: !12, size: 32, offset: 256)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !102, file: !103, line: 20, baseType: !91, size: 64, offset: 320)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !102, file: !103, line: 21, baseType: !116, size: 64, offset: 384)
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!117 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!118 = !DILocation(line: 62, column: 22, scope: !97)
!119 = !DILocation(line: 62, column: 30, scope: !97)
!120 = !DILocalVariable(name: "year", scope: !79, file: !1, line: 57, type: !12)
!121 = !DILocation(line: 62, column: 54, scope: !97)
!122 = !DILocation(line: 62, column: 62, scope: !97)
!123 = !DILocalVariable(name: "doy", scope: !79, file: !1, line: 57, type: !12)
!124 = !DILocation(line: 63, column: 3, scope: !97)
!125 = !DILocation(line: 63, column: 19, scope: !126)
!126 = distinct !DILexicalBlock(scope: !94, file: !1, line: 63, column: 14)
!127 = !DILocation(line: 63, column: 14, scope: !94)
!128 = !DILocation(line: 64, column: 18, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !1, line: 63, column: 25)
!130 = !DILocation(line: 64, column: 12, scope: !129)
!131 = !DILocation(line: 64, column: 56, scope: !129)
!132 = !DILocation(line: 64, column: 50, scope: !129)
!133 = !DILocation(line: 64, column: 75, scope: !129)
!134 = !DILocation(line: 64, column: 69, scope: !129)
!135 = !DILocation(line: 64, column: 94, scope: !129)
!136 = !DILocation(line: 64, column: 88, scope: !129)
!137 = !DILocation(line: 64, column: 37, scope: !129)
!138 = !DILocation(line: 65, column: 3, scope: !129)
!139 = !DILocation(line: 0, scope: !94)
!140 = !DILocation(line: 67, column: 19, scope: !79)
!141 = !DILocalVariable(name: "result", scope: !79, file: !1, line: 67, type: !10)
!142 = !DILocation(line: 68, column: 3, scope: !79)
!143 = !DILocation(line: 69, column: 3, scope: !79)
!144 = !DILocation(line: 71, column: 3, scope: !79)
