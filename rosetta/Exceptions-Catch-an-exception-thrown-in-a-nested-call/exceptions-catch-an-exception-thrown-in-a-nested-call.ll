; ModuleID = 'exceptions-catch-an-exception-thrown-in-a-nested-call.c'
source_filename = "exceptions-catch-an-exception-thrown-in-a-nested-call.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.exception_ctx = type { %struct.exception*, i32, i32 }
%struct.exception = type { i32, [128 x i8] }

@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [43 x i8] c"*** Error: Overflow in exception context.\0A\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@GLOBALEX = dso_local global %struct.exception_ctx* null, align 8, !dbg !0
@.str.2 = private unnamed_addr constant [48 x i8] c"U0 Drink Error. Insufficient drinks in bar Baz.\00", align 1
@.str.3 = private unnamed_addr constant [62 x i8] c"U1 Bartender Error. Bartender kicked customer out of bar Baz.\00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 8
@.str.4 = private unnamed_addr constant [19 x i8] c"Bar door is open.\0A\00", align 1
@.str.5 = private unnamed_addr constant [37 x i8] c"Baz has been called without errors.\0A\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Bar door is closed.\0A\00", align 1
@.str.7 = private unnamed_addr constant [19 x i8] c"Foo entering bar.\0A\00", align 1
@.str.8 = private unnamed_addr constant [82 x i8] c"I am foo() and I deaall wrth U0 DriNk Errors with my own bottle... GOT oNE! [%s]\0A\00", align 1
@.str.9 = private unnamed_addr constant [19 x i8] c"Foo left the bar.\0A\00", align 1
@.str.10 = private unnamed_addr constant [25 x i8] c"Foo entering bar again.\0A\00", align 1
@.str.11 = private unnamed_addr constant [24 x i8] c"No errors encountered.\0A\00", align 1
@.str.12 = private unnamed_addr constant [15 x i8] c"*** Error: %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.exception_ctx* @Create_Ex_Ctx(i32 %length) #0 !dbg !35 {
entry:
  %retval = alloca %struct.exception_ctx*, align 8
  %length.addr = alloca i32, align 4
  %safety = alloca i32, align 4
  %tmp = alloca i8*, align 8
  %ctx = alloca %struct.exception_ctx*, align 8
  store i32 %length, i32* %length.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %length.addr, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i32* %safety, metadata !41, metadata !DIExpression()), !dbg !43
  store i32 8, i32* %safety, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata i8** %tmp, metadata !44, metadata !DIExpression()), !dbg !45
  %0 = load i32, i32* %length.addr, align 4, !dbg !46
  %conv = sext i32 %0 to i64, !dbg !46
  %mul = mul i64 132, %conv, !dbg !47
  %add = add i64 24, %mul, !dbg !48
  %call = call noalias i8* @malloc(i64 %add) #4, !dbg !49
  store i8* %call, i8** %tmp, align 8, !dbg !45
  %1 = load i8*, i8** %tmp, align 8, !dbg !50
  %tobool = icmp ne i8* %1, null, !dbg !50
  br i1 %tobool, label %if.end, label %if.then, !dbg !52, !cf.info !53

if.then:                                          ; preds = %entry
  store %struct.exception_ctx* null, %struct.exception_ctx** %retval, align 8, !dbg !54
  br label %return, !dbg !54

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.exception_ctx** %ctx, metadata !55, metadata !DIExpression()), !dbg !56
  %2 = load i8*, i8** %tmp, align 8, !dbg !57
  %3 = bitcast i8* %2 to %struct.exception_ctx*, !dbg !58
  store %struct.exception_ctx* %3, %struct.exception_ctx** %ctx, align 8, !dbg !56
  %4 = load i32, i32* %length.addr, align 4, !dbg !59
  %5 = load %struct.exception_ctx*, %struct.exception_ctx** %ctx, align 8, !dbg !60
  %size = getelementptr inbounds %struct.exception_ctx, %struct.exception_ctx* %5, i32 0, i32 1, !dbg !61
  store i32 %4, i32* %size, align 8, !dbg !62
  %6 = load %struct.exception_ctx*, %struct.exception_ctx** %ctx, align 8, !dbg !63
  %pos = getelementptr inbounds %struct.exception_ctx, %struct.exception_ctx* %6, i32 0, i32 2, !dbg !64
  store i32 -1, i32* %pos, align 4, !dbg !65
  %7 = load i8*, i8** %tmp, align 8, !dbg !66
  %add.ptr = getelementptr inbounds i8, i8* %7, i64 16, !dbg !67
  %8 = bitcast i8* %add.ptr to %struct.exception*, !dbg !68
  %9 = load %struct.exception_ctx*, %struct.exception_ctx** %ctx, align 8, !dbg !69
  %exs = getelementptr inbounds %struct.exception_ctx, %struct.exception_ctx* %9, i32 0, i32 0, !dbg !70
  store %struct.exception* %8, %struct.exception** %exs, align 8, !dbg !71
  %10 = load %struct.exception_ctx*, %struct.exception_ctx** %ctx, align 8, !dbg !72
  store %struct.exception_ctx* %10, %struct.exception_ctx** %retval, align 8, !dbg !73
  br label %return, !dbg !73

return:                                           ; preds = %if.end, %if.then
  %11 = load %struct.exception_ctx*, %struct.exception_ctx** %retval, align 8, !dbg !74
  ret %struct.exception_ctx* %11, !dbg !74
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @Free_Ex_Ctx(%struct.exception_ctx* %ctx) #0 !dbg !75 {
entry:
  %ctx.addr = alloca %struct.exception_ctx*, align 8
  store %struct.exception_ctx* %ctx, %struct.exception_ctx** %ctx.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.exception_ctx** %ctx.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = load %struct.exception_ctx*, %struct.exception_ctx** %ctx.addr, align 8, !dbg !80
  %1 = bitcast %struct.exception_ctx* %0 to i8*, !dbg !80
  call void @free(i8* %1) #4, !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Has_Ex(%struct.exception_ctx* %ctx) #0 !dbg !83 {
entry:
  %ctx.addr = alloca %struct.exception_ctx*, align 8
  store %struct.exception_ctx* %ctx, %struct.exception_ctx** %ctx.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.exception_ctx** %ctx.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = load %struct.exception_ctx*, %struct.exception_ctx** %ctx.addr, align 8, !dbg !88
  %pos = getelementptr inbounds %struct.exception_ctx, %struct.exception_ctx* %0, i32 0, i32 2, !dbg !89
  %1 = load i32, i32* %pos, align 4, !dbg !89
  %cmp = icmp sge i32 %1, 0, !dbg !90
  %2 = zext i1 %cmp to i64, !dbg !91
  %cond = select i1 %cmp, i32 1, i32 0, !dbg !91
  ret i32 %cond, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Is_Ex_Type(%struct.exception_ctx* %exctx, i32 %extype) #0 !dbg !93 {
entry:
  %exctx.addr = alloca %struct.exception_ctx*, align 8
  %extype.addr = alloca i32, align 4
  store %struct.exception_ctx* %exctx, %struct.exception_ctx** %exctx.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.exception_ctx** %exctx.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i32 %extype, i32* %extype.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %extype.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = load %struct.exception_ctx*, %struct.exception_ctx** %exctx.addr, align 8, !dbg !100
  %pos = getelementptr inbounds %struct.exception_ctx, %struct.exception_ctx* %0, i32 0, i32 2, !dbg !101
  %1 = load i32, i32* %pos, align 4, !dbg !101
  %cmp = icmp sge i32 %1, 0, !dbg !102
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !103

land.rhs:                                         ; preds = %entry
  %2 = load %struct.exception_ctx*, %struct.exception_ctx** %exctx.addr, align 8, !dbg !104
  %exs = getelementptr inbounds %struct.exception_ctx, %struct.exception_ctx* %2, i32 0, i32 0, !dbg !105
  %3 = load %struct.exception*, %struct.exception** %exs, align 8, !dbg !105
  %4 = load %struct.exception_ctx*, %struct.exception_ctx** %exctx.addr, align 8, !dbg !106
  %pos1 = getelementptr inbounds %struct.exception_ctx, %struct.exception_ctx* %4, i32 0, i32 2, !dbg !107
  %5 = load i32, i32* %pos1, align 4, !dbg !107
  %idxprom = sext i32 %5 to i64, !dbg !104
  %arrayidx = getelementptr inbounds %struct.exception, %struct.exception* %3, i64 %idxprom, !dbg !104
  %extype2 = getelementptr inbounds %struct.exception, %struct.exception* %arrayidx, i32 0, i32 0, !dbg !108
  %6 = load i32, i32* %extype2, align 4, !dbg !108
  %7 = load i32, i32* %extype.addr, align 4, !dbg !109
  %cmp3 = icmp eq i32 %6, %7, !dbg !110
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %8 = phi i1 [ false, %entry ], [ %cmp3, %land.rhs ], !dbg !111
  %9 = zext i1 %8 to i64, !dbg !112
  %cond = select i1 %8, i32 1, i32 0, !dbg !112
  ret i32 %cond, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Pop_Ex(%struct.exception_ctx* %ctx) #0 !dbg !114 {
entry:
  %ctx.addr = alloca %struct.exception_ctx*, align 8
  store %struct.exception_ctx* %ctx, %struct.exception_ctx** %ctx.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.exception_ctx** %ctx.addr, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = load %struct.exception_ctx*, %struct.exception_ctx** %ctx.addr, align 8, !dbg !117
  %pos = getelementptr inbounds %struct.exception_ctx, %struct.exception_ctx* %0, i32 0, i32 2, !dbg !119
  %1 = load i32, i32* %pos, align 4, !dbg !119
  %cmp = icmp sge i32 %1, 0, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121, !cf.info !53

if.then:                                          ; preds = %entry
  %2 = load %struct.exception_ctx*, %struct.exception_ctx** %ctx.addr, align 8, !dbg !122
  %pos1 = getelementptr inbounds %struct.exception_ctx, %struct.exception_ctx* %2, i32 0, i32 2, !dbg !123
  %3 = load i32, i32* %pos1, align 4, !dbg !124
  %dec = add nsw i32 %3, -1, !dbg !124
  store i32 %dec, i32* %pos1, align 4, !dbg !124
  br label %if.end, !dbg !124

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @Get_What(%struct.exception_ctx* %ctx) #0 !dbg !126 {
entry:
  %retval = alloca i8*, align 8
  %ctx.addr = alloca %struct.exception_ctx*, align 8
  store %struct.exception_ctx* %ctx, %struct.exception_ctx** %ctx.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.exception_ctx** %ctx.addr, metadata !131, metadata !DIExpression()), !dbg !132
  %0 = load %struct.exception_ctx*, %struct.exception_ctx** %ctx.addr, align 8, !dbg !133
  %pos = getelementptr inbounds %struct.exception_ctx, %struct.exception_ctx* %0, i32 0, i32 2, !dbg !135
  %1 = load i32, i32* %pos, align 4, !dbg !135
  %cmp = icmp sge i32 %1, 0, !dbg !136
  br i1 %cmp, label %if.then, label %if.end, !dbg !137, !cf.info !53

if.then:                                          ; preds = %entry
  %2 = load %struct.exception_ctx*, %struct.exception_ctx** %ctx.addr, align 8, !dbg !138
  %exs = getelementptr inbounds %struct.exception_ctx, %struct.exception_ctx* %2, i32 0, i32 0, !dbg !139
  %3 = load %struct.exception*, %struct.exception** %exs, align 8, !dbg !139
  %4 = load %struct.exception_ctx*, %struct.exception_ctx** %ctx.addr, align 8, !dbg !140
  %pos1 = getelementptr inbounds %struct.exception_ctx, %struct.exception_ctx* %4, i32 0, i32 2, !dbg !141
  %5 = load i32, i32* %pos1, align 4, !dbg !141
  %idxprom = sext i32 %5 to i64, !dbg !138
  %arrayidx = getelementptr inbounds %struct.exception, %struct.exception* %3, i64 %idxprom, !dbg !138
  %what = getelementptr inbounds %struct.exception, %struct.exception* %arrayidx, i32 0, i32 1, !dbg !142
  %arraydecay = getelementptr inbounds [128 x i8], [128 x i8]* %what, i64 0, i64 0, !dbg !138
  store i8* %arraydecay, i8** %retval, align 8, !dbg !143
  br label %return, !dbg !143

if.end:                                           ; preds = %entry
  store i8* null, i8** %retval, align 8, !dbg !144
  br label %return, !dbg !144

return:                                           ; preds = %if.end, %if.then
  %6 = load i8*, i8** %retval, align 8, !dbg !145
  ret i8* %6, !dbg !145
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Push_Ex(%struct.exception_ctx* %exctx, i32 %extype, i8* %msg) #0 !dbg !146 {
entry:
  %exctx.addr = alloca %struct.exception_ctx*, align 8
  %extype.addr = alloca i32, align 4
  %msg.addr = alloca i8*, align 8
  store %struct.exception_ctx* %exctx, %struct.exception_ctx** %exctx.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.exception_ctx** %exctx.addr, metadata !149, metadata !DIExpression()), !dbg !150
  store i32 %extype, i32* %extype.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %extype.addr, metadata !151, metadata !DIExpression()), !dbg !152
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !153, metadata !DIExpression()), !dbg !154
  %0 = load %struct.exception_ctx*, %struct.exception_ctx** %exctx.addr, align 8, !dbg !155
  %pos = getelementptr inbounds %struct.exception_ctx, %struct.exception_ctx* %0, i32 0, i32 2, !dbg !157
  %1 = load i32, i32* %pos, align 4, !dbg !158
  %inc = add nsw i32 %1, 1, !dbg !158
  store i32 %inc, i32* %pos, align 4, !dbg !158
  %2 = load %struct.exception_ctx*, %struct.exception_ctx** %exctx.addr, align 8, !dbg !159
  %size = getelementptr inbounds %struct.exception_ctx, %struct.exception_ctx* %2, i32 0, i32 1, !dbg !160
  %3 = load i32, i32* %size, align 8, !dbg !160
  %cmp = icmp eq i32 %inc, %3, !dbg !161
  br i1 %cmp, label %if.then, label %if.end, !dbg !162, !cf.info !53

if.then:                                          ; preds = %entry
  %4 = load %struct.exception_ctx*, %struct.exception_ctx** %exctx.addr, align 8, !dbg !163
  %pos1 = getelementptr inbounds %struct.exception_ctx, %struct.exception_ctx* %4, i32 0, i32 2, !dbg !165
  %5 = load i32, i32* %pos1, align 4, !dbg !166
  %dec = add nsw i32 %5, -1, !dbg !166
  store i32 %dec, i32* %pos1, align 4, !dbg !166
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !167
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str, i64 0, i64 0)), !dbg !168
  br label %if.end, !dbg !169

if.end:                                           ; preds = %if.then, %entry
  %7 = load %struct.exception_ctx*, %struct.exception_ctx** %exctx.addr, align 8, !dbg !170
  %exs = getelementptr inbounds %struct.exception_ctx, %struct.exception_ctx* %7, i32 0, i32 0, !dbg !171
  %8 = load %struct.exception*, %struct.exception** %exs, align 8, !dbg !171
  %9 = load %struct.exception_ctx*, %struct.exception_ctx** %exctx.addr, align 8, !dbg !172
  %pos2 = getelementptr inbounds %struct.exception_ctx, %struct.exception_ctx* %9, i32 0, i32 2, !dbg !173
  %10 = load i32, i32* %pos2, align 4, !dbg !173
  %idxprom = sext i32 %10 to i64, !dbg !170
  %arrayidx = getelementptr inbounds %struct.exception, %struct.exception* %8, i64 %idxprom, !dbg !170
  %what = getelementptr inbounds %struct.exception, %struct.exception* %arrayidx, i32 0, i32 1, !dbg !174
  %arraydecay = getelementptr inbounds [128 x i8], [128 x i8]* %what, i64 0, i64 0, !dbg !170
  %11 = load i8*, i8** %msg.addr, align 8, !dbg !175
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 128, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i8* %11) #4, !dbg !176
  %12 = load i32, i32* %extype.addr, align 4, !dbg !177
  %13 = load %struct.exception_ctx*, %struct.exception_ctx** %exctx.addr, align 8, !dbg !178
  %exs4 = getelementptr inbounds %struct.exception_ctx, %struct.exception_ctx* %13, i32 0, i32 0, !dbg !179
  %14 = load %struct.exception*, %struct.exception** %exs4, align 8, !dbg !179
  %15 = load %struct.exception_ctx*, %struct.exception_ctx** %exctx.addr, align 8, !dbg !180
  %pos5 = getelementptr inbounds %struct.exception_ctx, %struct.exception_ctx* %15, i32 0, i32 2, !dbg !181
  %16 = load i32, i32* %pos5, align 4, !dbg !181
  %idxprom6 = sext i32 %16 to i64, !dbg !178
  %arrayidx7 = getelementptr inbounds %struct.exception, %struct.exception* %14, i64 %idxprom6, !dbg !178
  %extype8 = getelementptr inbounds %struct.exception, %struct.exception* %arrayidx7, i32 0, i32 0, !dbg !182
  store i32 %12, i32* %extype8, align 4, !dbg !183
  ret i32 -1, !dbg !184
}

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @baz(i32 %n) #0 !dbg !185 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !188, metadata !DIExpression()), !dbg !189
  %0 = load i32, i32* %n.addr, align 4, !dbg !190
  %tobool = icmp ne i32 %0, 0, !dbg !190
  br i1 %tobool, label %if.else, label %if.then, !dbg !192, !cf.info !53

if.then:                                          ; preds = %entry
  %1 = load %struct.exception_ctx*, %struct.exception_ctx** @GLOBALEX, align 8, !dbg !193
  %call = call i32 @Push_Ex(%struct.exception_ctx* %1, i32 10, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.2, i64 0, i64 0)), !dbg !195
  br label %return, !dbg !196

if.else:                                          ; preds = %entry
  %2 = load %struct.exception_ctx*, %struct.exception_ctx** @GLOBALEX, align 8, !dbg !197
  %call1 = call i32 @Push_Ex(%struct.exception_ctx* %2, i32 11, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.3, i64 0, i64 0)), !dbg !199
  br label %return, !dbg !200

return:                                           ; preds = %if.else, %if.then
  ret void, !dbg !201
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @bar(i32 %n) #0 !dbg !202 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !203, metadata !DIExpression()), !dbg !204
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !205
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i64 0, i64 0)), !dbg !206
  %1 = load i32, i32* %n.addr, align 4, !dbg !207
  call void @baz(i32 %1), !dbg !208
  %2 = load %struct.exception_ctx*, %struct.exception_ctx** @GLOBALEX, align 8, !dbg !209
  %call1 = call i32 @Has_Ex(%struct.exception_ctx* %2), !dbg !211
  %tobool = icmp ne i32 %call1, 0, !dbg !211
  br i1 %tobool, label %if.then, label %if.end, !dbg !212, !cf.info !53

if.then:                                          ; preds = %entry
  br label %bar_cleanup, !dbg !213

if.end:                                           ; preds = %entry
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !214
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.5, i64 0, i64 0)), !dbg !215
  br label %bar_cleanup, !dbg !215

bar_cleanup:                                      ; preds = %if.end, %if.then
  call void @llvm.dbg.label(metadata !216), !dbg !217
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !218
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !219
  ret void, !dbg !220
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @foo() #0 !dbg !221 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !224
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.7, i64 0, i64 0)), !dbg !225
  call void @bar(i32 0), !dbg !226
  br label %while.cond, !dbg !227

while.cond:                                       ; preds = %while.body, %entry
  %1 = load %struct.exception_ctx*, %struct.exception_ctx** @GLOBALEX, align 8, !dbg !228
  %call1 = call i32 @Is_Ex_Type(%struct.exception_ctx* %1, i32 10), !dbg !229
  %tobool = icmp ne i32 %call1, 0, !dbg !227
  br i1 %tobool, label %while.body, label %while.end, !dbg !227

while.body:                                       ; preds = %while.cond
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !230
  %3 = load %struct.exception_ctx*, %struct.exception_ctx** @GLOBALEX, align 8, !dbg !232
  %call2 = call i8* @Get_What(%struct.exception_ctx* %3), !dbg !233
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([82 x i8], [82 x i8]* @.str.8, i64 0, i64 0), i8* %call2), !dbg !234
  %4 = load %struct.exception_ctx*, %struct.exception_ctx** @GLOBALEX, align 8, !dbg !235
  call void @Pop_Ex(%struct.exception_ctx* %4), !dbg !236
  br label %while.cond, !dbg !227, !llvm.loop !237

while.end:                                        ; preds = %while.cond
  %5 = load %struct.exception_ctx*, %struct.exception_ctx** @GLOBALEX, align 8, !dbg !239
  %call4 = call i32 @Has_Ex(%struct.exception_ctx* %5), !dbg !241
  %tobool5 = icmp ne i32 %call4, 0, !dbg !241
  br i1 %tobool5, label %if.then, label %if.end, !dbg !242, !cf.info !53

if.then:                                          ; preds = %while.end
  br label %return, !dbg !243

if.end:                                           ; preds = %while.end
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !244
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.9, i64 0, i64 0)), !dbg !245
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !246
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.10, i64 0, i64 0)), !dbg !247
  call void @bar(i32 1), !dbg !248
  br label %while.cond8, !dbg !249

while.cond8:                                      ; preds = %while.body11, %if.end
  %8 = load %struct.exception_ctx*, %struct.exception_ctx** @GLOBALEX, align 8, !dbg !250
  %call9 = call i32 @Is_Ex_Type(%struct.exception_ctx* %8, i32 10), !dbg !251
  %tobool10 = icmp ne i32 %call9, 0, !dbg !249
  br i1 %tobool10, label %while.body11, label %while.end14, !dbg !249

while.body11:                                     ; preds = %while.cond8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !252
  %10 = load %struct.exception_ctx*, %struct.exception_ctx** @GLOBALEX, align 8, !dbg !254
  %call12 = call i8* @Get_What(%struct.exception_ctx* %10), !dbg !255
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([82 x i8], [82 x i8]* @.str.8, i64 0, i64 0), i8* %call12), !dbg !256
  %11 = load %struct.exception_ctx*, %struct.exception_ctx** @GLOBALEX, align 8, !dbg !257
  call void @Pop_Ex(%struct.exception_ctx* %11), !dbg !258
  br label %while.cond8, !dbg !249, !llvm.loop !259

while.end14:                                      ; preds = %while.cond8
  %12 = load %struct.exception_ctx*, %struct.exception_ctx** @GLOBALEX, align 8, !dbg !261
  %call15 = call i32 @Has_Ex(%struct.exception_ctx* %12), !dbg !263
  %tobool16 = icmp ne i32 %call15, 0, !dbg !263
  br i1 %tobool16, label %if.then17, label %if.end18, !dbg !264, !cf.info !53

if.then17:                                        ; preds = %while.end14
  br label %return, !dbg !265

if.end18:                                         ; preds = %while.end14
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !266
  %call19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.9, i64 0, i64 0)), !dbg !267
  br label %return, !dbg !268

return:                                           ; preds = %if.end18, %if.then17, %if.then
  ret void, !dbg !268
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !269 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %ctx = alloca %struct.exception_ctx*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !273, metadata !DIExpression()), !dbg !274
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !275, metadata !DIExpression()), !dbg !276
  call void @llvm.dbg.declare(metadata %struct.exception_ctx** %ctx, metadata !277, metadata !DIExpression()), !dbg !278
  %call = call %struct.exception_ctx* @Create_Ex_Ctx(i32 5), !dbg !279
  store %struct.exception_ctx* %call, %struct.exception_ctx** %ctx, align 8, !dbg !278
  %0 = load %struct.exception_ctx*, %struct.exception_ctx** %ctx, align 8, !dbg !280
  store %struct.exception_ctx* %0, %struct.exception_ctx** @GLOBALEX, align 8, !dbg !281
  call void @foo(), !dbg !282
  %1 = load %struct.exception_ctx*, %struct.exception_ctx** %ctx, align 8, !dbg !283
  %call1 = call i32 @Has_Ex(%struct.exception_ctx* %1), !dbg !285
  %tobool = icmp ne i32 %call1, 0, !dbg !285
  br i1 %tobool, label %if.then, label %if.end, !dbg !286, !cf.info !53

if.then:                                          ; preds = %entry
  br label %main_ex, !dbg !287

if.end:                                           ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !288
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.11, i64 0, i64 0)), !dbg !289
  br label %main_ex, !dbg !289

main_ex:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.label(metadata !290), !dbg !291
  br label %while.cond, !dbg !292

while.cond:                                       ; preds = %while.body, %main_ex
  %3 = load %struct.exception_ctx*, %struct.exception_ctx** %ctx, align 8, !dbg !293
  %call3 = call i32 @Has_Ex(%struct.exception_ctx* %3), !dbg !294
  %tobool4 = icmp ne i32 %call3, 0, !dbg !292
  br i1 %tobool4, label %while.body, label %while.end, !dbg !292

while.body:                                       ; preds = %while.cond
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !295
  %5 = load %struct.exception_ctx*, %struct.exception_ctx** %ctx, align 8, !dbg !297
  %call5 = call i8* @Get_What(%struct.exception_ctx* %5), !dbg !298
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.12, i64 0, i64 0), i8* %call5), !dbg !299
  %6 = load %struct.exception_ctx*, %struct.exception_ctx** %ctx, align 8, !dbg !300
  call void @Pop_Ex(%struct.exception_ctx* %6), !dbg !301
  br label %while.cond, !dbg !292, !llvm.loop !302

while.end:                                        ; preds = %while.cond
  %7 = load %struct.exception_ctx*, %struct.exception_ctx** %ctx, align 8, !dbg !304
  call void @Free_Ex_Ctx(%struct.exception_ctx* %7), !dbg !305
  ret i32 0, !dbg !306
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!31, !32, !33}
!llvm.ident = !{!34}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "GLOBALEX", scope: !2, file: !3, line: 60, type: !13, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !10, globals: !30, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "exceptions-catch-an-exception-thrown-in-a-nested-call.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Exceptions-Catch-an-exception-thrown-in-a-nested-call")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !3, line: 61, baseType: !6, size: 32, elements: !7)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!8, !9}
!8 = !DIEnumerator(name: "U0_DRINK_ERROR", value: 10, isUnsigned: true)
!9 = !DIEnumerator(name: "U1_ANGRYBARTENDER_ERROR", value: 11, isUnsigned: true)
!10 = !{!11, !13, !18}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "exception_ctx", file: !3, line: 13, baseType: !15)
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "exception_ctx", file: !3, line: 9, size: 128, elements: !16)
!16 = !{!17, !28, !29}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "exs", scope: !15, file: !3, line: 10, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "exception", file: !3, line: 7, baseType: !20)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "exception", file: !3, line: 4, size: 1056, elements: !21)
!21 = !{!22, !24}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "extype", scope: !20, file: !3, line: 5, baseType: !23, size: 32)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "what", scope: !20, file: !3, line: 6, baseType: !25, size: 1024, offset: 32)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1024, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 128)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !15, file: !3, line: 11, baseType: !23, size: 32, offset: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !15, file: !3, line: 12, baseType: !23, size: 32, offset: 96)
!30 = !{!0}
!31 = !{i32 7, !"Dwarf Version", i32 4}
!32 = !{i32 2, !"Debug Info Version", i32 3}
!33 = !{i32 1, !"wchar_size", i32 4}
!34 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!35 = distinct !DISubprogram(name: "Create_Ex_Ctx", scope: !3, file: !3, line: 15, type: !36, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !38)
!36 = !DISubroutineType(types: !37)
!37 = !{!13, !23}
!38 = !{}
!39 = !DILocalVariable(name: "length", arg: 1, scope: !35, file: !3, line: 15, type: !23)
!40 = !DILocation(line: 15, column: 35, scope: !35)
!41 = !DILocalVariable(name: "safety", scope: !35, file: !3, line: 16, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!43 = !DILocation(line: 16, column: 19, scope: !35)
!44 = !DILocalVariable(name: "tmp", scope: !35, file: !3, line: 17, type: !11)
!45 = !DILocation(line: 17, column: 16, scope: !35)
!46 = !DILocation(line: 17, column: 84, scope: !35)
!47 = !DILocation(line: 17, column: 83, scope: !35)
!48 = !DILocation(line: 17, column: 65, scope: !35)
!49 = !DILocation(line: 17, column: 30, scope: !35)
!50 = !DILocation(line: 18, column: 15, scope: !51)
!51 = distinct !DILexicalBlock(scope: !35, file: !3, line: 18, column: 13)
!52 = !DILocation(line: 18, column: 13, scope: !35)
!53 = !{!"if"}
!54 = !DILocation(line: 18, column: 20, scope: !51)
!55 = !DILocalVariable(name: "ctx", scope: !35, file: !3, line: 19, type: !13)
!56 = !DILocation(line: 19, column: 25, scope: !35)
!57 = !DILocation(line: 19, column: 47, scope: !35)
!58 = !DILocation(line: 19, column: 31, scope: !35)
!59 = !DILocation(line: 20, column: 21, scope: !35)
!60 = !DILocation(line: 20, column: 9, scope: !35)
!61 = !DILocation(line: 20, column: 14, scope: !35)
!62 = !DILocation(line: 20, column: 19, scope: !35)
!63 = !DILocation(line: 21, column: 9, scope: !35)
!64 = !DILocation(line: 21, column: 14, scope: !35)
!65 = !DILocation(line: 21, column: 18, scope: !35)
!66 = !DILocation(line: 22, column: 34, scope: !35)
!67 = !DILocation(line: 22, column: 38, scope: !35)
!68 = !DILocation(line: 22, column: 20, scope: !35)
!69 = !DILocation(line: 22, column: 9, scope: !35)
!70 = !DILocation(line: 22, column: 14, scope: !35)
!71 = !DILocation(line: 22, column: 18, scope: !35)
!72 = !DILocation(line: 23, column: 16, scope: !35)
!73 = !DILocation(line: 23, column: 9, scope: !35)
!74 = !DILocation(line: 24, column: 1, scope: !35)
!75 = distinct !DISubprogram(name: "Free_Ex_Ctx", scope: !3, file: !3, line: 26, type: !76, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !38)
!76 = !DISubroutineType(types: !77)
!77 = !{null, !13}
!78 = !DILocalVariable(name: "ctx", arg: 1, scope: !75, file: !3, line: 26, type: !13)
!79 = !DILocation(line: 26, column: 34, scope: !75)
!80 = !DILocation(line: 27, column: 14, scope: !75)
!81 = !DILocation(line: 27, column: 9, scope: !75)
!82 = !DILocation(line: 28, column: 1, scope: !75)
!83 = distinct !DISubprogram(name: "Has_Ex", scope: !3, file: !3, line: 30, type: !84, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !38)
!84 = !DISubroutineType(types: !85)
!85 = !{!23, !13}
!86 = !DILocalVariable(name: "ctx", arg: 1, scope: !83, file: !3, line: 30, type: !13)
!87 = !DILocation(line: 30, column: 28, scope: !83)
!88 = !DILocation(line: 31, column: 17, scope: !83)
!89 = !DILocation(line: 31, column: 22, scope: !83)
!90 = !DILocation(line: 31, column: 26, scope: !83)
!91 = !DILocation(line: 31, column: 16, scope: !83)
!92 = !DILocation(line: 31, column: 9, scope: !83)
!93 = distinct !DISubprogram(name: "Is_Ex_Type", scope: !3, file: !3, line: 34, type: !94, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !38)
!94 = !DISubroutineType(types: !95)
!95 = !{!23, !13, !23}
!96 = !DILocalVariable(name: "exctx", arg: 1, scope: !93, file: !3, line: 34, type: !13)
!97 = !DILocation(line: 34, column: 32, scope: !93)
!98 = !DILocalVariable(name: "extype", arg: 2, scope: !93, file: !3, line: 34, type: !23)
!99 = !DILocation(line: 34, column: 43, scope: !93)
!100 = !DILocation(line: 35, column: 17, scope: !93)
!101 = !DILocation(line: 35, column: 24, scope: !93)
!102 = !DILocation(line: 35, column: 28, scope: !93)
!103 = !DILocation(line: 35, column: 33, scope: !93)
!104 = !DILocation(line: 35, column: 36, scope: !93)
!105 = !DILocation(line: 35, column: 43, scope: !93)
!106 = !DILocation(line: 35, column: 47, scope: !93)
!107 = !DILocation(line: 35, column: 54, scope: !93)
!108 = !DILocation(line: 35, column: 59, scope: !93)
!109 = !DILocation(line: 35, column: 69, scope: !93)
!110 = !DILocation(line: 35, column: 66, scope: !93)
!111 = !DILocation(line: 0, scope: !93)
!112 = !DILocation(line: 35, column: 16, scope: !93)
!113 = !DILocation(line: 35, column: 9, scope: !93)
!114 = distinct !DISubprogram(name: "Pop_Ex", scope: !3, file: !3, line: 38, type: !76, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !38)
!115 = !DILocalVariable(name: "ctx", arg: 1, scope: !114, file: !3, line: 38, type: !13)
!116 = !DILocation(line: 38, column: 29, scope: !114)
!117 = !DILocation(line: 39, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !3, line: 39, column: 13)
!119 = !DILocation(line: 39, column: 18, scope: !118)
!120 = !DILocation(line: 39, column: 22, scope: !118)
!121 = !DILocation(line: 39, column: 13, scope: !114)
!122 = !DILocation(line: 39, column: 30, scope: !118)
!123 = !DILocation(line: 39, column: 35, scope: !118)
!124 = !DILocation(line: 39, column: 28, scope: !118)
!125 = !DILocation(line: 40, column: 1, scope: !114)
!126 = distinct !DISubprogram(name: "Get_What", scope: !3, file: !3, line: 42, type: !127, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !38)
!127 = !DISubroutineType(types: !128)
!128 = !{!129, !13}
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64)
!130 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!131 = !DILocalVariable(name: "ctx", arg: 1, scope: !126, file: !3, line: 42, type: !13)
!132 = !DILocation(line: 42, column: 39, scope: !126)
!133 = !DILocation(line: 43, column: 13, scope: !134)
!134 = distinct !DILexicalBlock(scope: !126, file: !3, line: 43, column: 13)
!135 = !DILocation(line: 43, column: 18, scope: !134)
!136 = !DILocation(line: 43, column: 22, scope: !134)
!137 = !DILocation(line: 43, column: 13, scope: !126)
!138 = !DILocation(line: 43, column: 35, scope: !134)
!139 = !DILocation(line: 43, column: 40, scope: !134)
!140 = !DILocation(line: 43, column: 44, scope: !134)
!141 = !DILocation(line: 43, column: 49, scope: !134)
!142 = !DILocation(line: 43, column: 54, scope: !134)
!143 = !DILocation(line: 43, column: 28, scope: !134)
!144 = !DILocation(line: 44, column: 9, scope: !126)
!145 = !DILocation(line: 45, column: 1, scope: !126)
!146 = distinct !DISubprogram(name: "Push_Ex", scope: !3, file: !3, line: 47, type: !147, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !38)
!147 = !DISubroutineType(types: !148)
!148 = !{!23, !13, !23, !129}
!149 = !DILocalVariable(name: "exctx", arg: 1, scope: !146, file: !3, line: 47, type: !13)
!150 = !DILocation(line: 47, column: 29, scope: !146)
!151 = !DILocalVariable(name: "extype", arg: 2, scope: !146, file: !3, line: 47, type: !23)
!152 = !DILocation(line: 47, column: 40, scope: !146)
!153 = !DILocalVariable(name: "msg", arg: 3, scope: !146, file: !3, line: 47, type: !129)
!154 = !DILocation(line: 47, column: 61, scope: !146)
!155 = !DILocation(line: 48, column: 15, scope: !156)
!156 = distinct !DILexicalBlock(scope: !146, file: !3, line: 48, column: 13)
!157 = !DILocation(line: 48, column: 22, scope: !156)
!158 = !DILocation(line: 48, column: 13, scope: !156)
!159 = !DILocation(line: 48, column: 29, scope: !156)
!160 = !DILocation(line: 48, column: 36, scope: !156)
!161 = !DILocation(line: 48, column: 26, scope: !156)
!162 = !DILocation(line: 48, column: 13, scope: !146)
!163 = !DILocation(line: 50, column: 19, scope: !164)
!164 = distinct !DILexicalBlock(scope: !156, file: !3, line: 48, column: 42)
!165 = !DILocation(line: 50, column: 26, scope: !164)
!166 = !DILocation(line: 50, column: 17, scope: !164)
!167 = !DILocation(line: 51, column: 25, scope: !164)
!168 = !DILocation(line: 51, column: 17, scope: !164)
!169 = !DILocation(line: 52, column: 9, scope: !164)
!170 = !DILocation(line: 53, column: 18, scope: !146)
!171 = !DILocation(line: 53, column: 25, scope: !146)
!172 = !DILocation(line: 53, column: 29, scope: !146)
!173 = !DILocation(line: 53, column: 36, scope: !146)
!174 = !DILocation(line: 53, column: 41, scope: !146)
!175 = !DILocation(line: 53, column: 81, scope: !146)
!176 = !DILocation(line: 53, column: 9, scope: !146)
!177 = !DILocation(line: 54, column: 41, scope: !146)
!178 = !DILocation(line: 54, column: 9, scope: !146)
!179 = !DILocation(line: 54, column: 16, scope: !146)
!180 = !DILocation(line: 54, column: 20, scope: !146)
!181 = !DILocation(line: 54, column: 27, scope: !146)
!182 = !DILocation(line: 54, column: 32, scope: !146)
!183 = !DILocation(line: 54, column: 39, scope: !146)
!184 = !DILocation(line: 55, column: 9, scope: !146)
!185 = distinct !DISubprogram(name: "baz", scope: !3, file: !3, line: 63, type: !186, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !38)
!186 = !DISubroutineType(types: !187)
!187 = !{null, !23}
!188 = !DILocalVariable(name: "n", arg: 1, scope: !185, file: !3, line: 63, type: !23)
!189 = !DILocation(line: 63, column: 14, scope: !185)
!190 = !DILocation(line: 64, column: 15, scope: !191)
!191 = distinct !DILexicalBlock(scope: !185, file: !3, line: 64, column: 13)
!192 = !DILocation(line: 64, column: 13, scope: !185)
!193 = !DILocation(line: 65, column: 25, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !3, line: 64, column: 18)
!195 = !DILocation(line: 65, column: 17, scope: !194)
!196 = !DILocation(line: 66, column: 17, scope: !194)
!197 = !DILocation(line: 69, column: 25, scope: !198)
!198 = distinct !DILexicalBlock(scope: !191, file: !3, line: 68, column: 14)
!199 = !DILocation(line: 69, column: 17, scope: !198)
!200 = !DILocation(line: 70, column: 17, scope: !198)
!201 = !DILocation(line: 72, column: 1, scope: !185)
!202 = distinct !DISubprogram(name: "bar", scope: !3, file: !3, line: 74, type: !186, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !38)
!203 = !DILocalVariable(name: "n", arg: 1, scope: !202, file: !3, line: 74, type: !23)
!204 = !DILocation(line: 74, column: 14, scope: !202)
!205 = !DILocation(line: 75, column: 17, scope: !202)
!206 = !DILocation(line: 75, column: 9, scope: !202)
!207 = !DILocation(line: 76, column: 13, scope: !202)
!208 = !DILocation(line: 76, column: 9, scope: !202)
!209 = !DILocation(line: 77, column: 20, scope: !210)
!210 = distinct !DILexicalBlock(scope: !202, file: !3, line: 77, column: 13)
!211 = !DILocation(line: 77, column: 13, scope: !210)
!212 = !DILocation(line: 77, column: 13, scope: !202)
!213 = !DILocation(line: 77, column: 31, scope: !210)
!214 = !DILocation(line: 78, column: 17, scope: !202)
!215 = !DILocation(line: 78, column: 9, scope: !202)
!216 = !DILabel(scope: !202, name: "bar_cleanup", file: !3, line: 79)
!217 = !DILocation(line: 79, column: 1, scope: !202)
!218 = !DILocation(line: 80, column: 17, scope: !202)
!219 = !DILocation(line: 80, column: 9, scope: !202)
!220 = !DILocation(line: 81, column: 1, scope: !202)
!221 = distinct !DISubprogram(name: "foo", scope: !3, file: !3, line: 83, type: !222, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !38)
!222 = !DISubroutineType(types: !223)
!223 = !{null}
!224 = !DILocation(line: 84, column: 17, scope: !221)
!225 = !DILocation(line: 84, column: 9, scope: !221)
!226 = !DILocation(line: 85, column: 9, scope: !221)
!227 = !DILocation(line: 86, column: 9, scope: !221)
!228 = !DILocation(line: 86, column: 27, scope: !221)
!229 = !DILocation(line: 86, column: 16, scope: !221)
!230 = !DILocation(line: 87, column: 25, scope: !231)
!231 = distinct !DILexicalBlock(scope: !221, file: !3, line: 86, column: 54)
!232 = !DILocation(line: 87, column: 128, scope: !231)
!233 = !DILocation(line: 87, column: 119, scope: !231)
!234 = !DILocation(line: 87, column: 17, scope: !231)
!235 = !DILocation(line: 88, column: 24, scope: !231)
!236 = !DILocation(line: 88, column: 17, scope: !231)
!237 = distinct !{!237, !227, !238}
!238 = !DILocation(line: 89, column: 9, scope: !221)
!239 = !DILocation(line: 90, column: 20, scope: !240)
!240 = distinct !DILexicalBlock(scope: !221, file: !3, line: 90, column: 13)
!241 = !DILocation(line: 90, column: 13, scope: !240)
!242 = !DILocation(line: 90, column: 13, scope: !221)
!243 = !DILocation(line: 90, column: 31, scope: !240)
!244 = !DILocation(line: 91, column: 17, scope: !221)
!245 = !DILocation(line: 91, column: 9, scope: !221)
!246 = !DILocation(line: 92, column: 17, scope: !221)
!247 = !DILocation(line: 92, column: 9, scope: !221)
!248 = !DILocation(line: 93, column: 9, scope: !221)
!249 = !DILocation(line: 94, column: 9, scope: !221)
!250 = !DILocation(line: 94, column: 27, scope: !221)
!251 = !DILocation(line: 94, column: 16, scope: !221)
!252 = !DILocation(line: 95, column: 25, scope: !253)
!253 = distinct !DILexicalBlock(scope: !221, file: !3, line: 94, column: 54)
!254 = !DILocation(line: 95, column: 128, scope: !253)
!255 = !DILocation(line: 95, column: 119, scope: !253)
!256 = !DILocation(line: 95, column: 17, scope: !253)
!257 = !DILocation(line: 96, column: 24, scope: !253)
!258 = !DILocation(line: 96, column: 17, scope: !253)
!259 = distinct !{!259, !249, !260}
!260 = !DILocation(line: 97, column: 9, scope: !221)
!261 = !DILocation(line: 98, column: 20, scope: !262)
!262 = distinct !DILexicalBlock(scope: !221, file: !3, line: 98, column: 13)
!263 = !DILocation(line: 98, column: 13, scope: !262)
!264 = !DILocation(line: 98, column: 13, scope: !221)
!265 = !DILocation(line: 98, column: 31, scope: !262)
!266 = !DILocation(line: 99, column: 17, scope: !221)
!267 = !DILocation(line: 99, column: 9, scope: !221)
!268 = !DILocation(line: 100, column: 1, scope: !221)
!269 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 103, type: !270, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !38)
!270 = !DISubroutineType(types: !271)
!271 = !{!23, !23, !272}
!272 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!273 = !DILocalVariable(name: "argc", arg: 1, scope: !269, file: !3, line: 103, type: !23)
!274 = !DILocation(line: 103, column: 14, scope: !269)
!275 = !DILocalVariable(name: "argv", arg: 2, scope: !269, file: !3, line: 103, type: !272)
!276 = !DILocation(line: 103, column: 28, scope: !269)
!277 = !DILocalVariable(name: "ctx", scope: !269, file: !3, line: 104, type: !13)
!278 = !DILocation(line: 104, column: 25, scope: !269)
!279 = !DILocation(line: 104, column: 31, scope: !269)
!280 = !DILocation(line: 105, column: 20, scope: !269)
!281 = !DILocation(line: 105, column: 18, scope: !269)
!282 = !DILocation(line: 107, column: 9, scope: !269)
!283 = !DILocation(line: 108, column: 20, scope: !284)
!284 = distinct !DILexicalBlock(scope: !269, file: !3, line: 108, column: 13)
!285 = !DILocation(line: 108, column: 13, scope: !284)
!286 = !DILocation(line: 108, column: 13, scope: !269)
!287 = !DILocation(line: 108, column: 26, scope: !284)
!288 = !DILocation(line: 110, column: 17, scope: !269)
!289 = !DILocation(line: 110, column: 9, scope: !269)
!290 = !DILabel(scope: !269, name: "main_ex", file: !3, line: 112)
!291 = !DILocation(line: 112, column: 1, scope: !269)
!292 = !DILocation(line: 113, column: 9, scope: !269)
!293 = !DILocation(line: 113, column: 23, scope: !269)
!294 = !DILocation(line: 113, column: 16, scope: !269)
!295 = !DILocation(line: 114, column: 25, scope: !296)
!296 = distinct !DILexicalBlock(scope: !269, file: !3, line: 113, column: 29)
!297 = !DILocation(line: 114, column: 61, scope: !296)
!298 = !DILocation(line: 114, column: 52, scope: !296)
!299 = !DILocation(line: 114, column: 17, scope: !296)
!300 = !DILocation(line: 115, column: 24, scope: !296)
!301 = !DILocation(line: 115, column: 17, scope: !296)
!302 = distinct !{!302, !292, !303}
!303 = !DILocation(line: 116, column: 9, scope: !269)
!304 = !DILocation(line: 117, column: 21, scope: !269)
!305 = !DILocation(line: 117, column: 9, scope: !269)
!306 = !DILocation(line: 118, column: 9, scope: !269)
