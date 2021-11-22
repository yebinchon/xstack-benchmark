; ModuleID = 'flatten-a-list.c'
source_filename = "flatten-a-list.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.list_t = type { i32, i32, %struct.list_t** }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@.str.4 = private unnamed_addr constant [46 x i8] c"[1], 2, [[3,4], 5], [[[]]], [[[6]]], 7, 8, []\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"Nested: \00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.7 = private unnamed_addr constant [12 x i8] c"Flattened: \00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.list_t* @new_list() #0 !dbg !7 {
entry:
  %x = alloca %struct.list_t*, align 8
  call void @llvm.dbg.declare(metadata %struct.list_t** %x, metadata !19, metadata !DIExpression()), !dbg !20
  %call = call noalias i8* @malloc(i64 16) #5, !dbg !21
  %0 = bitcast i8* %call to %struct.list_t*, !dbg !21
  store %struct.list_t* %0, %struct.list_t** %x, align 8, !dbg !20
  %1 = load %struct.list_t*, %struct.list_t** %x, align 8, !dbg !22
  %ival = getelementptr inbounds %struct.list_t, %struct.list_t* %1, i32 0, i32 1, !dbg !23
  store i32 0, i32* %ival, align 4, !dbg !24
  %2 = load %struct.list_t*, %struct.list_t** %x, align 8, !dbg !25
  %is_list = getelementptr inbounds %struct.list_t, %struct.list_t* %2, i32 0, i32 0, !dbg !26
  store i32 1, i32* %is_list, align 8, !dbg !27
  %3 = load %struct.list_t*, %struct.list_t** %x, align 8, !dbg !28
  %lst = getelementptr inbounds %struct.list_t, %struct.list_t* %3, i32 0, i32 2, !dbg !29
  store %struct.list_t** null, %struct.list_t*** %lst, align 8, !dbg !30
  %4 = load %struct.list_t*, %struct.list_t** %x, align 8, !dbg !31
  ret %struct.list_t* %4, !dbg !32
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @append(%struct.list_t* %parent, %struct.list_t* %child) #0 !dbg !33 {
entry:
  %parent.addr = alloca %struct.list_t*, align 8
  %child.addr = alloca %struct.list_t*, align 8
  store %struct.list_t* %parent, %struct.list_t** %parent.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.list_t** %parent.addr, metadata !36, metadata !DIExpression()), !dbg !37
  store %struct.list_t* %child, %struct.list_t** %child.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.list_t** %child.addr, metadata !38, metadata !DIExpression()), !dbg !39
  %0 = load %struct.list_t*, %struct.list_t** %parent.addr, align 8, !dbg !40
  %lst = getelementptr inbounds %struct.list_t, %struct.list_t* %0, i32 0, i32 2, !dbg !41
  %1 = load %struct.list_t**, %struct.list_t*** %lst, align 8, !dbg !41
  %2 = bitcast %struct.list_t** %1 to i8*, !dbg !40
  %3 = load %struct.list_t*, %struct.list_t** %parent.addr, align 8, !dbg !42
  %ival = getelementptr inbounds %struct.list_t, %struct.list_t* %3, i32 0, i32 1, !dbg !43
  %4 = load i32, i32* %ival, align 4, !dbg !43
  %add = add nsw i32 %4, 1, !dbg !44
  %conv = sext i32 %add to i64, !dbg !45
  %mul = mul i64 8, %conv, !dbg !46
  %call = call i8* @realloc(i8* %2, i64 %mul) #5, !dbg !47
  %5 = bitcast i8* %call to %struct.list_t**, !dbg !47
  %6 = load %struct.list_t*, %struct.list_t** %parent.addr, align 8, !dbg !48
  %lst1 = getelementptr inbounds %struct.list_t, %struct.list_t* %6, i32 0, i32 2, !dbg !49
  store %struct.list_t** %5, %struct.list_t*** %lst1, align 8, !dbg !50
  %7 = load %struct.list_t*, %struct.list_t** %child.addr, align 8, !dbg !51
  %8 = load %struct.list_t*, %struct.list_t** %parent.addr, align 8, !dbg !52
  %lst2 = getelementptr inbounds %struct.list_t, %struct.list_t* %8, i32 0, i32 2, !dbg !53
  %9 = load %struct.list_t**, %struct.list_t*** %lst2, align 8, !dbg !53
  %10 = load %struct.list_t*, %struct.list_t** %parent.addr, align 8, !dbg !54
  %ival3 = getelementptr inbounds %struct.list_t, %struct.list_t* %10, i32 0, i32 1, !dbg !55
  %11 = load i32, i32* %ival3, align 4, !dbg !56
  %inc = add nsw i32 %11, 1, !dbg !56
  store i32 %inc, i32* %ival3, align 4, !dbg !56
  %idxprom = sext i32 %11 to i64, !dbg !52
  %arrayidx = getelementptr inbounds %struct.list_t*, %struct.list_t** %9, i64 %idxprom, !dbg !52
  store %struct.list_t* %7, %struct.list_t** %arrayidx, align 8, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.list_t* @from_string(i8* %s, i8** %e, %struct.list_t* %parent) #0 !dbg !59 {
entry:
  %retval = alloca %struct.list_t*, align 8
  %s.addr = alloca i8*, align 8
  %e.addr = alloca i8**, align 8
  %parent.addr = alloca %struct.list_t*, align 8
  %ret = alloca %struct.list_t*, align 8
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %e, i8*** %e.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %e.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store %struct.list_t* %parent, %struct.list_t** %parent.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.list_t** %parent.addr, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata %struct.list_t** %ret, metadata !71, metadata !DIExpression()), !dbg !72
  store %struct.list_t* null, %struct.list_t** %ret, align 8, !dbg !72
  %0 = load %struct.list_t*, %struct.list_t** %parent.addr, align 8, !dbg !73
  %tobool = icmp ne %struct.list_t* %0, null, !dbg !73
  br i1 %tobool, label %if.end, label %if.then, !dbg !75, !cf.info !76

if.then:                                          ; preds = %entry
  %call = call %struct.list_t* @new_list(), !dbg !77
  store %struct.list_t* %call, %struct.list_t** %parent.addr, align 8, !dbg !78
  br label %if.end, !dbg !79

if.end:                                           ; preds = %if.then, %entry
  br label %while.cond, !dbg !80

while.cond:                                       ; preds = %if.end30, %if.then24, %if.then13, %if.end
  %1 = load i8*, i8** %s.addr, align 8, !dbg !81
  %2 = load i8, i8* %1, align 1, !dbg !82
  %conv = sext i8 %2 to i32, !dbg !82
  %cmp = icmp ne i32 %conv, 0, !dbg !83
  br i1 %cmp, label %while.body, label %while.end, !dbg !80

while.body:                                       ; preds = %while.cond
  %3 = load i8*, i8** %s.addr, align 8, !dbg !84
  %4 = load i8, i8* %3, align 1, !dbg !87
  %conv2 = sext i8 %4 to i32, !dbg !87
  %cmp3 = icmp eq i32 %conv2, 93, !dbg !88
  br i1 %cmp3, label %if.then5, label %if.end9, !dbg !89, !cf.info !76

if.then5:                                         ; preds = %while.body
  %5 = load i8**, i8*** %e.addr, align 8, !dbg !90
  %tobool6 = icmp ne i8** %5, null, !dbg !90
  br i1 %tobool6, label %if.then7, label %if.end8, !dbg !93, !cf.info !76

if.then7:                                         ; preds = %if.then5
  %6 = load i8*, i8** %s.addr, align 8, !dbg !94
  %add.ptr = getelementptr inbounds i8, i8* %6, i64 1, !dbg !95
  %7 = load i8**, i8*** %e.addr, align 8, !dbg !96
  store i8* %add.ptr, i8** %7, align 8, !dbg !97
  br label %if.end8, !dbg !98

if.end8:                                          ; preds = %if.then7, %if.then5
  %8 = load %struct.list_t*, %struct.list_t** %parent.addr, align 8, !dbg !99
  store %struct.list_t* %8, %struct.list_t** %retval, align 8, !dbg !100
  br label %return, !dbg !100

if.end9:                                          ; preds = %while.body
  %9 = load i8*, i8** %s.addr, align 8, !dbg !101
  %10 = load i8, i8* %9, align 1, !dbg !103
  %conv10 = sext i8 %10 to i32, !dbg !103
  %cmp11 = icmp eq i32 %conv10, 91, !dbg !104
  br i1 %cmp11, label %if.then13, label %if.end17, !dbg !105, !cf.info !76

if.then13:                                        ; preds = %if.end9
  %call14 = call %struct.list_t* @new_list(), !dbg !106
  store %struct.list_t* %call14, %struct.list_t** %ret, align 8, !dbg !108
  %11 = load %struct.list_t*, %struct.list_t** %ret, align 8, !dbg !109
  %is_list = getelementptr inbounds %struct.list_t, %struct.list_t* %11, i32 0, i32 0, !dbg !110
  store i32 1, i32* %is_list, align 8, !dbg !111
  %12 = load %struct.list_t*, %struct.list_t** %ret, align 8, !dbg !112
  %ival = getelementptr inbounds %struct.list_t, %struct.list_t* %12, i32 0, i32 1, !dbg !113
  store i32 0, i32* %ival, align 4, !dbg !114
  %13 = load %struct.list_t*, %struct.list_t** %parent.addr, align 8, !dbg !115
  %14 = load %struct.list_t*, %struct.list_t** %ret, align 8, !dbg !116
  call void @append(%struct.list_t* %13, %struct.list_t* %14), !dbg !117
  %15 = load i8*, i8** %s.addr, align 8, !dbg !118
  %add.ptr15 = getelementptr inbounds i8, i8* %15, i64 1, !dbg !119
  %16 = load %struct.list_t*, %struct.list_t** %ret, align 8, !dbg !120
  %call16 = call %struct.list_t* @from_string(i8* %add.ptr15, i8** %s.addr, %struct.list_t* %16), !dbg !121
  br label %while.cond, !dbg !122, !llvm.loop !123

if.end17:                                         ; preds = %if.end9
  %17 = load i8*, i8** %s.addr, align 8, !dbg !125
  %18 = load i8, i8* %17, align 1, !dbg !127
  %conv18 = sext i8 %18 to i32, !dbg !127
  %cmp19 = icmp sge i32 %conv18, 48, !dbg !128
  br i1 %cmp19, label %land.lhs.true, label %if.end30, !dbg !129, !cf.info !76

land.lhs.true:                                    ; preds = %if.end17
  %19 = load i8*, i8** %s.addr, align 8, !dbg !130
  %20 = load i8, i8* %19, align 1, !dbg !131
  %conv21 = sext i8 %20 to i32, !dbg !131
  %cmp22 = icmp sle i32 %conv21, 57, !dbg !132
  br i1 %cmp22, label %if.then24, label %if.end30, !dbg !133, !cf.info !76

if.then24:                                        ; preds = %land.lhs.true
  %call25 = call %struct.list_t* @new_list(), !dbg !134
  store %struct.list_t* %call25, %struct.list_t** %ret, align 8, !dbg !136
  %21 = load %struct.list_t*, %struct.list_t** %ret, align 8, !dbg !137
  %is_list26 = getelementptr inbounds %struct.list_t, %struct.list_t* %21, i32 0, i32 0, !dbg !138
  store i32 0, i32* %is_list26, align 8, !dbg !139
  %22 = load i8*, i8** %s.addr, align 8, !dbg !140
  %call27 = call i64 @strtol(i8* %22, i8** %s.addr, i32 10) #5, !dbg !141
  %conv28 = trunc i64 %call27 to i32, !dbg !141
  %23 = load %struct.list_t*, %struct.list_t** %ret, align 8, !dbg !142
  %ival29 = getelementptr inbounds %struct.list_t, %struct.list_t* %23, i32 0, i32 1, !dbg !143
  store i32 %conv28, i32* %ival29, align 4, !dbg !144
  %24 = load %struct.list_t*, %struct.list_t** %parent.addr, align 8, !dbg !145
  %25 = load %struct.list_t*, %struct.list_t** %ret, align 8, !dbg !146
  call void @append(%struct.list_t* %24, %struct.list_t* %25), !dbg !147
  br label %while.cond, !dbg !148, !llvm.loop !123

if.end30:                                         ; preds = %land.lhs.true, %if.end17
  %26 = load i8*, i8** %s.addr, align 8, !dbg !149
  %incdec.ptr = getelementptr inbounds i8, i8* %26, i32 1, !dbg !149
  store i8* %incdec.ptr, i8** %s.addr, align 8, !dbg !149
  br label %while.cond, !dbg !80, !llvm.loop !123

while.end:                                        ; preds = %while.cond
  %27 = load i8**, i8*** %e.addr, align 8, !dbg !150
  %tobool31 = icmp ne i8** %27, null, !dbg !150
  br i1 %tobool31, label %if.then32, label %if.end33, !dbg !152, !cf.info !76

if.then32:                                        ; preds = %while.end
  %28 = load i8*, i8** %s.addr, align 8, !dbg !153
  %29 = load i8**, i8*** %e.addr, align 8, !dbg !154
  store i8* %28, i8** %29, align 8, !dbg !155
  br label %if.end33, !dbg !156

if.end33:                                         ; preds = %if.then32, %while.end
  %30 = load %struct.list_t*, %struct.list_t** %parent.addr, align 8, !dbg !157
  store %struct.list_t* %30, %struct.list_t** %retval, align 8, !dbg !158
  br label %return, !dbg !158

return:                                           ; preds = %if.end33, %if.end8
  %31 = load %struct.list_t*, %struct.list_t** %retval, align 8, !dbg !159
  ret %struct.list_t* %31, !dbg !159
}

; Function Attrs: nounwind
declare dso_local i64 @strtol(i8*, i8**, i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @show_list(%struct.list_t* %l) #0 !dbg !160 {
entry:
  %l.addr = alloca %struct.list_t*, align 8
  %i = alloca i32, align 4
  store %struct.list_t* %l, %struct.list_t** %l.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.list_t** %l.addr, metadata !163, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata i32* %i, metadata !165, metadata !DIExpression()), !dbg !166
  %0 = load %struct.list_t*, %struct.list_t** %l.addr, align 8, !dbg !167
  %tobool = icmp ne %struct.list_t* %0, null, !dbg !167
  br i1 %tobool, label %if.end, label %if.then, !dbg !169, !cf.info !76

if.then:                                          ; preds = %entry
  br label %return, !dbg !170

if.end:                                           ; preds = %entry
  %1 = load %struct.list_t*, %struct.list_t** %l.addr, align 8, !dbg !171
  %is_list = getelementptr inbounds %struct.list_t, %struct.list_t* %1, i32 0, i32 0, !dbg !173
  %2 = load i32, i32* %is_list, align 8, !dbg !173
  %tobool1 = icmp ne i32 %2, 0, !dbg !171
  br i1 %tobool1, label %if.end3, label %if.then2, !dbg !174, !cf.info !76

if.then2:                                         ; preds = %if.end
  %3 = load %struct.list_t*, %struct.list_t** %l.addr, align 8, !dbg !175
  %ival = getelementptr inbounds %struct.list_t, %struct.list_t* %3, i32 0, i32 1, !dbg !177
  %4 = load i32, i32* %ival, align 4, !dbg !177
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 %4), !dbg !178
  br label %return, !dbg !179

if.end3:                                          ; preds = %if.end
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !180
  store i32 0, i32* %i, align 4, !dbg !181
  br label %for.cond, !dbg !183

for.cond:                                         ; preds = %for.inc, %if.end3
  %5 = load i32, i32* %i, align 4, !dbg !184
  %6 = load %struct.list_t*, %struct.list_t** %l.addr, align 8, !dbg !186
  %ival5 = getelementptr inbounds %struct.list_t, %struct.list_t* %6, i32 0, i32 1, !dbg !187
  %7 = load i32, i32* %ival5, align 4, !dbg !187
  %cmp = icmp slt i32 %5, %7, !dbg !188
  br i1 %cmp, label %for.body, label %for.end, !dbg !189

for.body:                                         ; preds = %for.cond
  %8 = load %struct.list_t*, %struct.list_t** %l.addr, align 8, !dbg !190
  %lst = getelementptr inbounds %struct.list_t, %struct.list_t* %8, i32 0, i32 2, !dbg !192
  %9 = load %struct.list_t**, %struct.list_t*** %lst, align 8, !dbg !192
  %10 = load i32, i32* %i, align 4, !dbg !193
  %idxprom = sext i32 %10 to i64, !dbg !190
  %arrayidx = getelementptr inbounds %struct.list_t*, %struct.list_t** %9, i64 %idxprom, !dbg !190
  %11 = load %struct.list_t*, %struct.list_t** %arrayidx, align 8, !dbg !190
  call void @show_list(%struct.list_t* %11), !dbg !194
  %12 = load i32, i32* %i, align 4, !dbg !195
  %13 = load %struct.list_t*, %struct.list_t** %l.addr, align 8, !dbg !197
  %ival6 = getelementptr inbounds %struct.list_t, %struct.list_t* %13, i32 0, i32 1, !dbg !198
  %14 = load i32, i32* %ival6, align 4, !dbg !198
  %sub = sub nsw i32 %14, 1, !dbg !199
  %cmp7 = icmp slt i32 %12, %sub, !dbg !200
  br i1 %cmp7, label %if.then8, label %if.end10, !dbg !201, !cf.info !76

if.then8:                                         ; preds = %for.body
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0)), !dbg !202
  br label %if.end10, !dbg !202

if.end10:                                         ; preds = %if.then8, %for.body
  br label %for.inc, !dbg !203

for.inc:                                          ; preds = %if.end10
  %15 = load i32, i32* %i, align 4, !dbg !204
  %inc = add nsw i32 %15, 1, !dbg !204
  store i32 %inc, i32* %i, align 4, !dbg !204
  br label %for.cond, !dbg !205, !llvm.loop !206

for.end:                                          ; preds = %for.cond
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !208
  br label %return, !dbg !209

return:                                           ; preds = %for.end, %if.then2, %if.then
  ret void, !dbg !209
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.list_t* @flatten(%struct.list_t* %from, %struct.list_t* %to) #0 !dbg !210 {
entry:
  %from.addr = alloca %struct.list_t*, align 8
  %to.addr = alloca %struct.list_t*, align 8
  %i = alloca i32, align 4
  %t = alloca %struct.list_t*, align 8
  store %struct.list_t* %from, %struct.list_t** %from.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.list_t** %from.addr, metadata !213, metadata !DIExpression()), !dbg !214
  store %struct.list_t* %to, %struct.list_t** %to.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.list_t** %to.addr, metadata !215, metadata !DIExpression()), !dbg !216
  call void @llvm.dbg.declare(metadata i32* %i, metadata !217, metadata !DIExpression()), !dbg !218
  call void @llvm.dbg.declare(metadata %struct.list_t** %t, metadata !219, metadata !DIExpression()), !dbg !220
  %0 = load %struct.list_t*, %struct.list_t** %to.addr, align 8, !dbg !221
  %tobool = icmp ne %struct.list_t* %0, null, !dbg !221
  br i1 %tobool, label %if.end, label %if.then, !dbg !223, !cf.info !76

if.then:                                          ; preds = %entry
  %call = call %struct.list_t* @new_list(), !dbg !224
  store %struct.list_t* %call, %struct.list_t** %to.addr, align 8, !dbg !225
  br label %if.end, !dbg !226

if.end:                                           ; preds = %if.then, %entry
  %1 = load %struct.list_t*, %struct.list_t** %from.addr, align 8, !dbg !227
  %is_list = getelementptr inbounds %struct.list_t, %struct.list_t* %1, i32 0, i32 0, !dbg !229
  %2 = load i32, i32* %is_list, align 8, !dbg !229
  %tobool1 = icmp ne i32 %2, 0, !dbg !227
  br i1 %tobool1, label %if.else, label %if.then2, !dbg !230, !cf.info !76

if.then2:                                         ; preds = %if.end
  %call3 = call %struct.list_t* @new_list(), !dbg !231
  store %struct.list_t* %call3, %struct.list_t** %t, align 8, !dbg !233
  %3 = load %struct.list_t*, %struct.list_t** %t, align 8, !dbg !234
  %4 = load %struct.list_t*, %struct.list_t** %from.addr, align 8, !dbg !235
  %5 = bitcast %struct.list_t* %3 to i8*, !dbg !236
  %6 = bitcast %struct.list_t* %4 to i8*, !dbg !236
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %5, i8* align 8 %6, i64 16, i1 false), !dbg !236
  %7 = load %struct.list_t*, %struct.list_t** %to.addr, align 8, !dbg !237
  %8 = load %struct.list_t*, %struct.list_t** %t, align 8, !dbg !238
  call void @append(%struct.list_t* %7, %struct.list_t* %8), !dbg !239
  br label %if.end5, !dbg !240

if.else:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !241
  br label %for.cond, !dbg !243

for.cond:                                         ; preds = %for.inc, %if.else
  %9 = load i32, i32* %i, align 4, !dbg !244
  %10 = load %struct.list_t*, %struct.list_t** %from.addr, align 8, !dbg !246
  %ival = getelementptr inbounds %struct.list_t, %struct.list_t* %10, i32 0, i32 1, !dbg !247
  %11 = load i32, i32* %ival, align 4, !dbg !247
  %cmp = icmp slt i32 %9, %11, !dbg !248
  br i1 %cmp, label %for.body, label %for.end, !dbg !249

for.body:                                         ; preds = %for.cond
  %12 = load %struct.list_t*, %struct.list_t** %from.addr, align 8, !dbg !250
  %lst = getelementptr inbounds %struct.list_t, %struct.list_t* %12, i32 0, i32 2, !dbg !251
  %13 = load %struct.list_t**, %struct.list_t*** %lst, align 8, !dbg !251
  %14 = load i32, i32* %i, align 4, !dbg !252
  %idxprom = sext i32 %14 to i64, !dbg !250
  %arrayidx = getelementptr inbounds %struct.list_t*, %struct.list_t** %13, i64 %idxprom, !dbg !250
  %15 = load %struct.list_t*, %struct.list_t** %arrayidx, align 8, !dbg !250
  %16 = load %struct.list_t*, %struct.list_t** %to.addr, align 8, !dbg !253
  %call4 = call %struct.list_t* @flatten(%struct.list_t* %15, %struct.list_t* %16), !dbg !254
  br label %for.inc, !dbg !254

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !255
  %inc = add nsw i32 %17, 1, !dbg !255
  store i32 %inc, i32* %i, align 4, !dbg !255
  br label %for.cond, !dbg !256, !llvm.loop !257

for.end:                                          ; preds = %for.cond
  br label %if.end5

if.end5:                                          ; preds = %for.end, %if.then2
  %18 = load %struct.list_t*, %struct.list_t** %to.addr, align 8, !dbg !259
  ret %struct.list_t* %18, !dbg !260
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @delete_list(%struct.list_t* %l) #0 !dbg !261 {
entry:
  %l.addr = alloca %struct.list_t*, align 8
  %i = alloca i32, align 4
  store %struct.list_t* %l, %struct.list_t** %l.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.list_t** %l.addr, metadata !262, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.declare(metadata i32* %i, metadata !264, metadata !DIExpression()), !dbg !265
  %0 = load %struct.list_t*, %struct.list_t** %l.addr, align 8, !dbg !266
  %tobool = icmp ne %struct.list_t* %0, null, !dbg !266
  br i1 %tobool, label %if.end, label %if.then, !dbg !268, !cf.info !76

if.then:                                          ; preds = %entry
  br label %return, !dbg !269

if.end:                                           ; preds = %entry
  %1 = load %struct.list_t*, %struct.list_t** %l.addr, align 8, !dbg !270
  %is_list = getelementptr inbounds %struct.list_t, %struct.list_t* %1, i32 0, i32 0, !dbg !272
  %2 = load i32, i32* %is_list, align 8, !dbg !272
  %tobool1 = icmp ne i32 %2, 0, !dbg !270
  br i1 %tobool1, label %land.lhs.true, label %if.end6, !dbg !273, !cf.info !76

land.lhs.true:                                    ; preds = %if.end
  %3 = load %struct.list_t*, %struct.list_t** %l.addr, align 8, !dbg !274
  %ival = getelementptr inbounds %struct.list_t, %struct.list_t* %3, i32 0, i32 1, !dbg !275
  %4 = load i32, i32* %ival, align 4, !dbg !275
  %tobool2 = icmp ne i32 %4, 0, !dbg !274
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !276, !cf.info !76

if.then3:                                         ; preds = %land.lhs.true
  store i32 0, i32* %i, align 4, !dbg !277
  br label %for.cond, !dbg !280

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !281
  %6 = load %struct.list_t*, %struct.list_t** %l.addr, align 8, !dbg !283
  %ival4 = getelementptr inbounds %struct.list_t, %struct.list_t* %6, i32 0, i32 1, !dbg !284
  %7 = load i32, i32* %ival4, align 4, !dbg !284
  %cmp = icmp slt i32 %5, %7, !dbg !285
  br i1 %cmp, label %for.body, label %for.end, !dbg !286

for.body:                                         ; preds = %for.cond
  %8 = load %struct.list_t*, %struct.list_t** %l.addr, align 8, !dbg !287
  %lst = getelementptr inbounds %struct.list_t, %struct.list_t* %8, i32 0, i32 2, !dbg !288
  %9 = load %struct.list_t**, %struct.list_t*** %lst, align 8, !dbg !288
  %10 = load i32, i32* %i, align 4, !dbg !289
  %idxprom = sext i32 %10 to i64, !dbg !287
  %arrayidx = getelementptr inbounds %struct.list_t*, %struct.list_t** %9, i64 %idxprom, !dbg !287
  %11 = load %struct.list_t*, %struct.list_t** %arrayidx, align 8, !dbg !287
  call void @delete_list(%struct.list_t* %11), !dbg !290
  br label %for.inc, !dbg !290

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !291
  %inc = add nsw i32 %12, 1, !dbg !291
  store i32 %inc, i32* %i, align 4, !dbg !291
  br label %for.cond, !dbg !292, !llvm.loop !293

for.end:                                          ; preds = %for.cond
  %13 = load %struct.list_t*, %struct.list_t** %l.addr, align 8, !dbg !295
  %lst5 = getelementptr inbounds %struct.list_t, %struct.list_t* %13, i32 0, i32 2, !dbg !296
  %14 = load %struct.list_t**, %struct.list_t*** %lst5, align 8, !dbg !296
  %15 = bitcast %struct.list_t** %14 to i8*, !dbg !295
  call void @free(i8* %15) #5, !dbg !297
  br label %if.end6, !dbg !298

if.end6:                                          ; preds = %for.end, %land.lhs.true, %if.end
  %16 = load %struct.list_t*, %struct.list_t** %l.addr, align 8, !dbg !299
  %17 = bitcast %struct.list_t* %16 to i8*, !dbg !299
  call void @free(i8* %17) #5, !dbg !300
  br label %return, !dbg !301

return:                                           ; preds = %if.end6, %if.then
  ret void, !dbg !301
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !302 {
entry:
  %retval = alloca i32, align 4
  %l = alloca %struct.list_t*, align 8
  %flat = alloca %struct.list_t*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.list_t** %l, metadata !305, metadata !DIExpression()), !dbg !306
  %call = call %struct.list_t* @from_string(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.4, i64 0, i64 0), i8** null, %struct.list_t* null), !dbg !307
  store %struct.list_t* %call, %struct.list_t** %l, align 8, !dbg !306
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i64 0, i64 0)), !dbg !308
  %0 = load %struct.list_t*, %struct.list_t** %l, align 8, !dbg !309
  call void @show_list(%struct.list_t* %0), !dbg !310
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0)), !dbg !311
  call void @llvm.dbg.declare(metadata %struct.list_t** %flat, metadata !312, metadata !DIExpression()), !dbg !313
  %1 = load %struct.list_t*, %struct.list_t** %l, align 8, !dbg !314
  %call3 = call %struct.list_t* @flatten(%struct.list_t* %1, %struct.list_t* null), !dbg !315
  store %struct.list_t* %call3, %struct.list_t** %flat, align 8, !dbg !313
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.7, i64 0, i64 0)), !dbg !316
  %2 = load %struct.list_t*, %struct.list_t** %flat, align 8, !dbg !317
  call void @show_list(%struct.list_t* %2), !dbg !318
  ret i32 0, !dbg !319
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "flatten-a-list.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Flatten-a-list")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "new_list", scope: !1, file: !1, line: 11, type: !8, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "list", file: !1, line: 5, baseType: !11)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "list_t", file: !1, line: 6, size: 128, elements: !13)
!13 = !{!14, !16, !17}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "is_list", scope: !12, file: !1, line: 7, baseType: !15, size: 32)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "ival", scope: !12, file: !1, line: 7, baseType: !15, size: 32, offset: 32)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "lst", scope: !12, file: !1, line: 8, baseType: !18, size: 64, offset: 64)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!19 = !DILocalVariable(name: "x", scope: !7, file: !1, line: 13, type: !10)
!20 = !DILocation(line: 13, column: 7, scope: !7)
!21 = !DILocation(line: 13, column: 11, scope: !7)
!22 = !DILocation(line: 14, column: 2, scope: !7)
!23 = !DILocation(line: 14, column: 5, scope: !7)
!24 = !DILocation(line: 14, column: 10, scope: !7)
!25 = !DILocation(line: 15, column: 2, scope: !7)
!26 = !DILocation(line: 15, column: 5, scope: !7)
!27 = !DILocation(line: 15, column: 13, scope: !7)
!28 = !DILocation(line: 16, column: 2, scope: !7)
!29 = !DILocation(line: 16, column: 5, scope: !7)
!30 = !DILocation(line: 16, column: 9, scope: !7)
!31 = !DILocation(line: 17, column: 9, scope: !7)
!32 = !DILocation(line: 17, column: 2, scope: !7)
!33 = distinct !DISubprogram(name: "append", scope: !1, file: !1, line: 20, type: !34, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DISubroutineType(types: !35)
!35 = !{null, !10, !10}
!36 = !DILocalVariable(name: "parent", arg: 1, scope: !33, file: !1, line: 20, type: !10)
!37 = !DILocation(line: 20, column: 18, scope: !33)
!38 = !DILocalVariable(name: "child", arg: 2, scope: !33, file: !1, line: 20, type: !10)
!39 = !DILocation(line: 20, column: 31, scope: !33)
!40 = !DILocation(line: 22, column: 24, scope: !33)
!41 = !DILocation(line: 22, column: 32, scope: !33)
!42 = !DILocation(line: 22, column: 53, scope: !33)
!43 = !DILocation(line: 22, column: 61, scope: !33)
!44 = !DILocation(line: 22, column: 66, scope: !33)
!45 = !DILocation(line: 22, column: 52, scope: !33)
!46 = !DILocation(line: 22, column: 50, scope: !33)
!47 = !DILocation(line: 22, column: 16, scope: !33)
!48 = !DILocation(line: 22, column: 2, scope: !33)
!49 = !DILocation(line: 22, column: 10, scope: !33)
!50 = !DILocation(line: 22, column: 14, scope: !33)
!51 = !DILocation(line: 23, column: 32, scope: !33)
!52 = !DILocation(line: 23, column: 2, scope: !33)
!53 = !DILocation(line: 23, column: 10, scope: !33)
!54 = !DILocation(line: 23, column: 14, scope: !33)
!55 = !DILocation(line: 23, column: 22, scope: !33)
!56 = !DILocation(line: 23, column: 26, scope: !33)
!57 = !DILocation(line: 23, column: 30, scope: !33)
!58 = !DILocation(line: 24, column: 1, scope: !33)
!59 = distinct !DISubprogram(name: "from_string", scope: !1, file: !1, line: 26, type: !60, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!10, !62, !64, !10}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!65 = !DILocalVariable(name: "s", arg: 1, scope: !59, file: !1, line: 26, type: !62)
!66 = !DILocation(line: 26, column: 24, scope: !59)
!67 = !DILocalVariable(name: "e", arg: 2, scope: !59, file: !1, line: 26, type: !64)
!68 = !DILocation(line: 26, column: 34, scope: !59)
!69 = !DILocalVariable(name: "parent", arg: 3, scope: !59, file: !1, line: 26, type: !10)
!70 = !DILocation(line: 26, column: 42, scope: !59)
!71 = !DILocalVariable(name: "ret", scope: !59, file: !1, line: 28, type: !10)
!72 = !DILocation(line: 28, column: 7, scope: !59)
!73 = !DILocation(line: 29, column: 7, scope: !74)
!74 = distinct !DILexicalBlock(scope: !59, file: !1, line: 29, column: 6)
!75 = !DILocation(line: 29, column: 6, scope: !59)
!76 = !{!"if"}
!77 = !DILocation(line: 29, column: 24, scope: !74)
!78 = !DILocation(line: 29, column: 22, scope: !74)
!79 = !DILocation(line: 29, column: 15, scope: !74)
!80 = !DILocation(line: 31, column: 2, scope: !59)
!81 = !DILocation(line: 31, column: 10, scope: !59)
!82 = !DILocation(line: 31, column: 9, scope: !59)
!83 = !DILocation(line: 31, column: 12, scope: !59)
!84 = !DILocation(line: 32, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !86, file: !1, line: 32, column: 7)
!86 = distinct !DILexicalBlock(scope: !59, file: !1, line: 31, column: 21)
!87 = !DILocation(line: 32, column: 7, scope: !85)
!88 = !DILocation(line: 32, column: 10, scope: !85)
!89 = !DILocation(line: 32, column: 7, scope: !86)
!90 = !DILocation(line: 33, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !92, file: !1, line: 33, column: 8)
!92 = distinct !DILexicalBlock(scope: !85, file: !1, line: 32, column: 18)
!93 = !DILocation(line: 33, column: 8, scope: !92)
!94 = !DILocation(line: 33, column: 16, scope: !91)
!95 = !DILocation(line: 33, column: 18, scope: !91)
!96 = !DILocation(line: 33, column: 12, scope: !91)
!97 = !DILocation(line: 33, column: 14, scope: !91)
!98 = !DILocation(line: 33, column: 11, scope: !91)
!99 = !DILocation(line: 34, column: 11, scope: !92)
!100 = !DILocation(line: 34, column: 4, scope: !92)
!101 = !DILocation(line: 36, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !86, file: !1, line: 36, column: 7)
!103 = !DILocation(line: 36, column: 7, scope: !102)
!104 = !DILocation(line: 36, column: 10, scope: !102)
!105 = !DILocation(line: 36, column: 7, scope: !86)
!106 = !DILocation(line: 37, column: 10, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !1, line: 36, column: 18)
!108 = !DILocation(line: 37, column: 8, scope: !107)
!109 = !DILocation(line: 38, column: 4, scope: !107)
!110 = !DILocation(line: 38, column: 9, scope: !107)
!111 = !DILocation(line: 38, column: 17, scope: !107)
!112 = !DILocation(line: 39, column: 4, scope: !107)
!113 = !DILocation(line: 39, column: 9, scope: !107)
!114 = !DILocation(line: 39, column: 14, scope: !107)
!115 = !DILocation(line: 40, column: 11, scope: !107)
!116 = !DILocation(line: 40, column: 19, scope: !107)
!117 = !DILocation(line: 40, column: 4, scope: !107)
!118 = !DILocation(line: 41, column: 16, scope: !107)
!119 = !DILocation(line: 41, column: 18, scope: !107)
!120 = !DILocation(line: 41, column: 27, scope: !107)
!121 = !DILocation(line: 41, column: 4, scope: !107)
!122 = !DILocation(line: 42, column: 4, scope: !107)
!123 = distinct !{!123, !80, !124}
!124 = !DILocation(line: 52, column: 2, scope: !59)
!125 = !DILocation(line: 44, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !86, file: !1, line: 44, column: 7)
!127 = !DILocation(line: 44, column: 7, scope: !126)
!128 = !DILocation(line: 44, column: 10, scope: !126)
!129 = !DILocation(line: 44, column: 17, scope: !126)
!130 = !DILocation(line: 44, column: 21, scope: !126)
!131 = !DILocation(line: 44, column: 20, scope: !126)
!132 = !DILocation(line: 44, column: 23, scope: !126)
!133 = !DILocation(line: 44, column: 7, scope: !86)
!134 = !DILocation(line: 45, column: 10, scope: !135)
!135 = distinct !DILexicalBlock(scope: !126, file: !1, line: 44, column: 31)
!136 = !DILocation(line: 45, column: 8, scope: !135)
!137 = !DILocation(line: 46, column: 4, scope: !135)
!138 = !DILocation(line: 46, column: 9, scope: !135)
!139 = !DILocation(line: 46, column: 17, scope: !135)
!140 = !DILocation(line: 47, column: 23, scope: !135)
!141 = !DILocation(line: 47, column: 16, scope: !135)
!142 = !DILocation(line: 47, column: 4, scope: !135)
!143 = !DILocation(line: 47, column: 9, scope: !135)
!144 = !DILocation(line: 47, column: 14, scope: !135)
!145 = !DILocation(line: 48, column: 11, scope: !135)
!146 = !DILocation(line: 48, column: 19, scope: !135)
!147 = !DILocation(line: 48, column: 4, scope: !135)
!148 = !DILocation(line: 49, column: 4, scope: !135)
!149 = !DILocation(line: 51, column: 4, scope: !86)
!150 = !DILocation(line: 54, column: 6, scope: !151)
!151 = distinct !DILexicalBlock(scope: !59, file: !1, line: 54, column: 6)
!152 = !DILocation(line: 54, column: 6, scope: !59)
!153 = !DILocation(line: 54, column: 14, scope: !151)
!154 = !DILocation(line: 54, column: 10, scope: !151)
!155 = !DILocation(line: 54, column: 12, scope: !151)
!156 = !DILocation(line: 54, column: 9, scope: !151)
!157 = !DILocation(line: 55, column: 9, scope: !59)
!158 = !DILocation(line: 55, column: 2, scope: !59)
!159 = !DILocation(line: 56, column: 1, scope: !59)
!160 = distinct !DISubprogram(name: "show_list", scope: !1, file: !1, line: 58, type: !161, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!161 = !DISubroutineType(types: !162)
!162 = !{null, !10}
!163 = !DILocalVariable(name: "l", arg: 1, scope: !160, file: !1, line: 58, type: !10)
!164 = !DILocation(line: 58, column: 21, scope: !160)
!165 = !DILocalVariable(name: "i", scope: !160, file: !1, line: 60, type: !15)
!166 = !DILocation(line: 60, column: 6, scope: !160)
!167 = !DILocation(line: 61, column: 7, scope: !168)
!168 = distinct !DILexicalBlock(scope: !160, file: !1, line: 61, column: 6)
!169 = !DILocation(line: 61, column: 6, scope: !160)
!170 = !DILocation(line: 61, column: 10, scope: !168)
!171 = !DILocation(line: 62, column: 7, scope: !172)
!172 = distinct !DILexicalBlock(scope: !160, file: !1, line: 62, column: 6)
!173 = !DILocation(line: 62, column: 10, scope: !172)
!174 = !DILocation(line: 62, column: 6, scope: !160)
!175 = !DILocation(line: 63, column: 16, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !1, line: 62, column: 19)
!177 = !DILocation(line: 63, column: 19, scope: !176)
!178 = !DILocation(line: 63, column: 3, scope: !176)
!179 = !DILocation(line: 64, column: 3, scope: !176)
!180 = !DILocation(line: 67, column: 2, scope: !160)
!181 = !DILocation(line: 68, column: 9, scope: !182)
!182 = distinct !DILexicalBlock(scope: !160, file: !1, line: 68, column: 2)
!183 = !DILocation(line: 68, column: 7, scope: !182)
!184 = !DILocation(line: 68, column: 14, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !1, line: 68, column: 2)
!186 = !DILocation(line: 68, column: 18, scope: !185)
!187 = !DILocation(line: 68, column: 21, scope: !185)
!188 = !DILocation(line: 68, column: 16, scope: !185)
!189 = !DILocation(line: 68, column: 2, scope: !182)
!190 = !DILocation(line: 69, column: 13, scope: !191)
!191 = distinct !DILexicalBlock(scope: !185, file: !1, line: 68, column: 32)
!192 = !DILocation(line: 69, column: 16, scope: !191)
!193 = !DILocation(line: 69, column: 20, scope: !191)
!194 = !DILocation(line: 69, column: 3, scope: !191)
!195 = !DILocation(line: 70, column: 7, scope: !196)
!196 = distinct !DILexicalBlock(scope: !191, file: !1, line: 70, column: 7)
!197 = !DILocation(line: 70, column: 11, scope: !196)
!198 = !DILocation(line: 70, column: 14, scope: !196)
!199 = !DILocation(line: 70, column: 19, scope: !196)
!200 = !DILocation(line: 70, column: 9, scope: !196)
!201 = !DILocation(line: 70, column: 7, scope: !191)
!202 = !DILocation(line: 70, column: 24, scope: !196)
!203 = !DILocation(line: 71, column: 2, scope: !191)
!204 = !DILocation(line: 68, column: 28, scope: !185)
!205 = !DILocation(line: 68, column: 2, scope: !185)
!206 = distinct !{!206, !189, !207}
!207 = !DILocation(line: 71, column: 2, scope: !182)
!208 = !DILocation(line: 72, column: 2, scope: !160)
!209 = !DILocation(line: 73, column: 1, scope: !160)
!210 = distinct !DISubprogram(name: "flatten", scope: !1, file: !1, line: 75, type: !211, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!211 = !DISubroutineType(types: !212)
!212 = !{!10, !10, !10}
!213 = !DILocalVariable(name: "from", arg: 1, scope: !210, file: !1, line: 75, type: !10)
!214 = !DILocation(line: 75, column: 19, scope: !210)
!215 = !DILocalVariable(name: "to", arg: 2, scope: !210, file: !1, line: 75, type: !10)
!216 = !DILocation(line: 75, column: 30, scope: !210)
!217 = !DILocalVariable(name: "i", scope: !210, file: !1, line: 77, type: !15)
!218 = !DILocation(line: 77, column: 6, scope: !210)
!219 = !DILocalVariable(name: "t", scope: !210, file: !1, line: 78, type: !10)
!220 = !DILocation(line: 78, column: 7, scope: !210)
!221 = !DILocation(line: 80, column: 7, scope: !222)
!222 = distinct !DILexicalBlock(scope: !210, file: !1, line: 80, column: 6)
!223 = !DILocation(line: 80, column: 6, scope: !210)
!224 = !DILocation(line: 80, column: 16, scope: !222)
!225 = !DILocation(line: 80, column: 14, scope: !222)
!226 = !DILocation(line: 80, column: 11, scope: !222)
!227 = !DILocation(line: 81, column: 7, scope: !228)
!228 = distinct !DILexicalBlock(scope: !210, file: !1, line: 81, column: 6)
!229 = !DILocation(line: 81, column: 13, scope: !228)
!230 = !DILocation(line: 81, column: 6, scope: !210)
!231 = !DILocation(line: 82, column: 7, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !1, line: 81, column: 22)
!233 = !DILocation(line: 82, column: 5, scope: !232)
!234 = !DILocation(line: 83, column: 4, scope: !232)
!235 = !DILocation(line: 83, column: 9, scope: !232)
!236 = !DILocation(line: 83, column: 8, scope: !232)
!237 = !DILocation(line: 84, column: 10, scope: !232)
!238 = !DILocation(line: 84, column: 14, scope: !232)
!239 = !DILocation(line: 84, column: 3, scope: !232)
!240 = !DILocation(line: 85, column: 2, scope: !232)
!241 = !DILocation(line: 86, column: 10, scope: !242)
!242 = distinct !DILexicalBlock(scope: !228, file: !1, line: 86, column: 3)
!243 = !DILocation(line: 86, column: 8, scope: !242)
!244 = !DILocation(line: 86, column: 15, scope: !245)
!245 = distinct !DILexicalBlock(scope: !242, file: !1, line: 86, column: 3)
!246 = !DILocation(line: 86, column: 19, scope: !245)
!247 = !DILocation(line: 86, column: 25, scope: !245)
!248 = !DILocation(line: 86, column: 17, scope: !245)
!249 = !DILocation(line: 86, column: 3, scope: !242)
!250 = !DILocation(line: 87, column: 12, scope: !245)
!251 = !DILocation(line: 87, column: 18, scope: !245)
!252 = !DILocation(line: 87, column: 22, scope: !245)
!253 = !DILocation(line: 87, column: 26, scope: !245)
!254 = !DILocation(line: 87, column: 4, scope: !245)
!255 = !DILocation(line: 86, column: 32, scope: !245)
!256 = !DILocation(line: 86, column: 3, scope: !245)
!257 = distinct !{!257, !249, !258}
!258 = !DILocation(line: 87, column: 28, scope: !242)
!259 = !DILocation(line: 88, column: 9, scope: !210)
!260 = !DILocation(line: 88, column: 2, scope: !210)
!261 = distinct !DISubprogram(name: "delete_list", scope: !1, file: !1, line: 91, type: !161, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!262 = !DILocalVariable(name: "l", arg: 1, scope: !261, file: !1, line: 91, type: !10)
!263 = !DILocation(line: 91, column: 23, scope: !261)
!264 = !DILocalVariable(name: "i", scope: !261, file: !1, line: 93, type: !15)
!265 = !DILocation(line: 93, column: 6, scope: !261)
!266 = !DILocation(line: 94, column: 7, scope: !267)
!267 = distinct !DILexicalBlock(scope: !261, file: !1, line: 94, column: 6)
!268 = !DILocation(line: 94, column: 6, scope: !261)
!269 = !DILocation(line: 94, column: 10, scope: !267)
!270 = !DILocation(line: 95, column: 6, scope: !271)
!271 = distinct !DILexicalBlock(scope: !261, file: !1, line: 95, column: 6)
!272 = !DILocation(line: 95, column: 9, scope: !271)
!273 = !DILocation(line: 95, column: 17, scope: !271)
!274 = !DILocation(line: 95, column: 20, scope: !271)
!275 = !DILocation(line: 95, column: 23, scope: !271)
!276 = !DILocation(line: 95, column: 6, scope: !261)
!277 = !DILocation(line: 96, column: 10, scope: !278)
!278 = distinct !DILexicalBlock(scope: !279, file: !1, line: 96, column: 3)
!279 = distinct !DILexicalBlock(scope: !271, file: !1, line: 95, column: 29)
!280 = !DILocation(line: 96, column: 8, scope: !278)
!281 = !DILocation(line: 96, column: 15, scope: !282)
!282 = distinct !DILexicalBlock(scope: !278, file: !1, line: 96, column: 3)
!283 = !DILocation(line: 96, column: 19, scope: !282)
!284 = !DILocation(line: 96, column: 22, scope: !282)
!285 = !DILocation(line: 96, column: 17, scope: !282)
!286 = !DILocation(line: 96, column: 3, scope: !278)
!287 = !DILocation(line: 97, column: 16, scope: !282)
!288 = !DILocation(line: 97, column: 19, scope: !282)
!289 = !DILocation(line: 97, column: 23, scope: !282)
!290 = !DILocation(line: 97, column: 4, scope: !282)
!291 = !DILocation(line: 96, column: 29, scope: !282)
!292 = !DILocation(line: 96, column: 3, scope: !282)
!293 = distinct !{!293, !286, !294}
!294 = !DILocation(line: 97, column: 25, scope: !278)
!295 = !DILocation(line: 98, column: 8, scope: !279)
!296 = !DILocation(line: 98, column: 11, scope: !279)
!297 = !DILocation(line: 98, column: 3, scope: !279)
!298 = !DILocation(line: 99, column: 2, scope: !279)
!299 = !DILocation(line: 101, column: 7, scope: !261)
!300 = !DILocation(line: 101, column: 2, scope: !261)
!301 = !DILocation(line: 102, column: 1, scope: !261)
!302 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 104, type: !303, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!303 = !DISubroutineType(types: !304)
!304 = !{!15}
!305 = !DILocalVariable(name: "l", scope: !302, file: !1, line: 106, type: !10)
!306 = !DILocation(line: 106, column: 7, scope: !302)
!307 = !DILocation(line: 106, column: 11, scope: !302)
!308 = !DILocation(line: 108, column: 2, scope: !302)
!309 = !DILocation(line: 109, column: 12, scope: !302)
!310 = !DILocation(line: 109, column: 2, scope: !302)
!311 = !DILocation(line: 110, column: 2, scope: !302)
!312 = !DILocalVariable(name: "flat", scope: !302, file: !1, line: 112, type: !10)
!313 = !DILocation(line: 112, column: 7, scope: !302)
!314 = !DILocation(line: 112, column: 22, scope: !302)
!315 = !DILocation(line: 112, column: 14, scope: !302)
!316 = !DILocation(line: 113, column: 2, scope: !302)
!317 = !DILocation(line: 114, column: 12, scope: !302)
!318 = !DILocation(line: 114, column: 2, scope: !302)
!319 = !DILocation(line: 117, column: 2, scope: !302)
