; ModuleID = 'conways-game-of-life.ll'
source_filename = "conways-game-of-life.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [4 x i8] c"\1B[H\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"\1B[07m  \1B[m\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"  \00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"\1B[E\00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @show(i8* %u, i32 %w, i32 %h) #0 !dbg !7 {
entry:
  %u.addr = alloca i8*, align 8
  %w.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %univ = alloca i32*, align 8
  %y = alloca i32, align 4
  %x = alloca i32, align 4
  store i8* %u, i8** %u.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %u.addr, metadata !12, metadata !DIExpression()), !dbg !13
  store i32 %w, i32* %w.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %w.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 %h, i32* %h.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %h.addr, metadata !16, metadata !DIExpression()), !dbg !17
  %0 = load i32, i32* %w.addr, align 4, !dbg !18
  %1 = zext i32 %0 to i64, !dbg !19
  call void @llvm.dbg.declare(metadata i32** %univ, metadata !20, metadata !DIExpression()), !dbg !25
  %2 = load i8*, i8** %u.addr, align 8, !dbg !26
  %3 = bitcast i8* %2 to i32*, !dbg !26
  store i32* %3, i32** %univ, align 8, !dbg !25
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %y, metadata !28, metadata !DIExpression()), !dbg !30
  store i32 0, i32* %y, align 4, !dbg !30
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc8, %entry
  %4 = load i32, i32* %y, align 4, !dbg !31
  %5 = load i32, i32* %h.addr, align 4, !dbg !31
  %cmp = icmp slt i32 %4, %5, !dbg !31
  br i1 %cmp, label %for.body, label %for.end10, !dbg !30

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %x, metadata !33, metadata !DIExpression()), !dbg !36
  store i32 0, i32* %x, align 4, !dbg !36
  br label %for.cond1, !dbg !36

for.cond1:                                        ; preds = %for.inc, %for.body
  %6 = load i32, i32* %x, align 4, !dbg !37
  %7 = load i32, i32* %w.addr, align 4, !dbg !37
  %cmp2 = icmp slt i32 %6, %7, !dbg !37
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !36

for.body3:                                        ; preds = %for.cond1
  %8 = load i32*, i32** %univ, align 8, !dbg !39
  %9 = load i32, i32* %y, align 4, !dbg !40
  %idxprom = sext i32 %9 to i64, !dbg !39
  %10 = mul nsw i64 %idxprom, %1, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %10, !dbg !39
  %11 = load i32, i32* %x, align 4, !dbg !41
  %idxprom4 = sext i32 %11 to i64, !dbg !39
  %arrayidx5 = getelementptr inbounds i32, i32* %arrayidx, i64 %idxprom4, !dbg !39
  %12 = load i32, i32* %arrayidx5, align 4, !dbg !39
  %tobool = icmp ne i32 %12, 0, !dbg !39
  %13 = zext i1 %tobool to i64, !dbg !39
  %cond = select i1 %tobool, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), !dbg !39
  %call6 = call i32 (i8*, ...) @printf(i8* %cond), !dbg !42
  br label %for.inc, !dbg !42

for.inc:                                          ; preds = %for.body3
  %14 = load i32, i32* %x, align 4, !dbg !37
  %inc = add nsw i32 %14, 1, !dbg !37
  store i32 %inc, i32* %x, align 4, !dbg !37
  br label %for.cond1, !dbg !37, !llvm.loop !43

for.end:                                          ; preds = %for.cond1
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)), !dbg !45
  br label %for.inc8, !dbg !46

for.inc8:                                         ; preds = %for.end
  %15 = load i32, i32* %y, align 4, !dbg !31
  %inc9 = add nsw i32 %15, 1, !dbg !31
  store i32 %inc9, i32* %y, align 4, !dbg !31
  br label %for.cond, !dbg !31, !llvm.loop !47

for.end10:                                        ; preds = %for.cond
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !49
  %call11 = call i32 @fflush(%struct._IO_FILE* %16), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @fflush(%struct._IO_FILE*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @evolve(i8* %u, i32 %w, i32 %h) #0 !dbg !52 {
entry:
  %u.addr = alloca i8*, align 8
  %w.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %univ = alloca i32*, align 8
  %saved_stack = alloca i8*, align 8
  %__vla_expr0 = alloca i64, align 8
  %__vla_expr1 = alloca i64, align 8
  %y = alloca i32, align 4
  %x = alloca i32, align 4
  %n = alloca i32, align 4
  %y1 = alloca i32, align 4
  %x1 = alloca i32, align 4
  %y45 = alloca i32, align 4
  %x49 = alloca i32, align 4
  store i8* %u, i8** %u.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %u.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i32 %w, i32* %w.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %w.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 %h, i32* %h.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %h.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32, i32* %w.addr, align 4, !dbg !59
  %1 = zext i32 %0 to i64, !dbg !60
  call void @llvm.dbg.declare(metadata i32** %univ, metadata !61, metadata !DIExpression()), !dbg !65
  %2 = load i8*, i8** %u.addr, align 8, !dbg !66
  %3 = bitcast i8* %2 to i32*, !dbg !66
  store i32* %3, i32** %univ, align 8, !dbg !65
  %4 = load i32, i32* %h.addr, align 4, !dbg !67
  %5 = zext i32 %4 to i64, !dbg !68
  %6 = load i32, i32* %w.addr, align 4, !dbg !69
  %7 = zext i32 %6 to i64, !dbg !68
  %8 = call i8* @llvm.stacksave(), !dbg !68
  store i8* %8, i8** %saved_stack, align 8, !dbg !68
  %9 = mul nuw i64 %5, %7, !dbg !68
  %vla = alloca i32, i64 %9, align 16, !dbg !68
  store i64 %5, i64* %__vla_expr0, align 8, !dbg !68
  store i64 %7, i64* %__vla_expr1, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i64* %__vla_expr0, metadata !70, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i64* %__vla_expr1, metadata !73, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32* %vla, metadata !74, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i32* %y, metadata !80, metadata !DIExpression()), !dbg !82
  store i32 0, i32* %y, align 4, !dbg !82
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc42, %entry
  %10 = load i32, i32* %y, align 4, !dbg !83
  %11 = load i32, i32* %h.addr, align 4, !dbg !83
  %cmp = icmp slt i32 %10, %11, !dbg !83
  br i1 %cmp, label %for.body, label %for.end44, !dbg !82

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %x, metadata !85, metadata !DIExpression()), !dbg !87
  store i32 0, i32* %x, align 4, !dbg !87
  br label %for.cond1, !dbg !87

for.cond1:                                        ; preds = %for.inc39, %for.body
  %12 = load i32, i32* %x, align 4, !dbg !88
  %13 = load i32, i32* %w.addr, align 4, !dbg !88
  %cmp2 = icmp slt i32 %12, %13, !dbg !88
  br i1 %cmp2, label %for.body3, label %for.end41, !dbg !87

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %n, metadata !90, metadata !DIExpression()), !dbg !92
  store i32 0, i32* %n, align 4, !dbg !92
  call void @llvm.dbg.declare(metadata i32* %y1, metadata !93, metadata !DIExpression()), !dbg !95
  %14 = load i32, i32* %y, align 4, !dbg !96
  %sub = sub nsw i32 %14, 1, !dbg !97
  store i32 %sub, i32* %y1, align 4, !dbg !95
  br label %for.cond4, !dbg !98

for.cond4:                                        ; preds = %for.inc18, %for.body3
  %15 = load i32, i32* %y1, align 4, !dbg !99
  %16 = load i32, i32* %y, align 4, !dbg !101
  %add = add nsw i32 %16, 1, !dbg !102
  %cmp5 = icmp sle i32 %15, %add, !dbg !103
  br i1 %cmp5, label %for.body6, label %for.end20, !dbg !104

for.body6:                                        ; preds = %for.cond4
  call void @llvm.dbg.declare(metadata i32* %x1, metadata !105, metadata !DIExpression()), !dbg !107
  %17 = load i32, i32* %x, align 4, !dbg !108
  %sub7 = sub nsw i32 %17, 1, !dbg !109
  store i32 %sub7, i32* %x1, align 4, !dbg !107
  br label %for.cond8, !dbg !110

for.cond8:                                        ; preds = %for.inc, %for.body6
  %18 = load i32, i32* %x1, align 4, !dbg !111
  %19 = load i32, i32* %x, align 4, !dbg !113
  %add9 = add nsw i32 %19, 1, !dbg !114
  %cmp10 = icmp sle i32 %18, %add9, !dbg !115
  br i1 %cmp10, label %for.body11, label %for.end, !dbg !116

for.body11:                                       ; preds = %for.cond8
  %20 = load i32*, i32** %univ, align 8, !dbg !117
  %21 = load i32, i32* %y1, align 4, !dbg !119
  %22 = load i32, i32* %h.addr, align 4, !dbg !120
  %add12 = add nsw i32 %21, %22, !dbg !121
  %23 = load i32, i32* %h.addr, align 4, !dbg !122
  %rem = srem i32 %add12, %23, !dbg !123
  %idxprom = sext i32 %rem to i64, !dbg !117
  %24 = mul nsw i64 %idxprom, %1, !dbg !117
  %arrayidx = getelementptr inbounds i32, i32* %20, i64 %24, !dbg !117
  %25 = load i32, i32* %x1, align 4, !dbg !124
  %26 = load i32, i32* %w.addr, align 4, !dbg !125
  %add13 = add nsw i32 %25, %26, !dbg !126
  %27 = load i32, i32* %w.addr, align 4, !dbg !127
  %rem14 = srem i32 %add13, %27, !dbg !128
  %idxprom15 = sext i32 %rem14 to i64, !dbg !117
  %arrayidx16 = getelementptr inbounds i32, i32* %arrayidx, i64 %idxprom15, !dbg !117
  %28 = load i32, i32* %arrayidx16, align 4, !dbg !117
  %tobool = icmp ne i32 %28, 0, !dbg !117
  br i1 %tobool, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %for.body11
  %29 = load i32, i32* %n, align 4, !dbg !130
  %inc = add nsw i32 %29, 1, !dbg !130
  store i32 %inc, i32* %n, align 4, !dbg !130
  br label %if.end, !dbg !131

if.end:                                           ; preds = %if.then, %for.body11
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %if.end
  %30 = load i32, i32* %x1, align 4, !dbg !133
  %inc17 = add nsw i32 %30, 1, !dbg !133
  store i32 %inc17, i32* %x1, align 4, !dbg !133
  br label %for.cond8, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond8
  br label %for.inc18, !dbg !136

for.inc18:                                        ; preds = %for.end
  %31 = load i32, i32* %y1, align 4, !dbg !137
  %inc19 = add nsw i32 %31, 1, !dbg !137
  store i32 %inc19, i32* %y1, align 4, !dbg !137
  br label %for.cond4, !dbg !138, !llvm.loop !139

for.end20:                                        ; preds = %for.cond4
  %32 = load i32*, i32** %univ, align 8, !dbg !141
  %33 = load i32, i32* %y, align 4, !dbg !143
  %idxprom21 = sext i32 %33 to i64, !dbg !141
  %34 = mul nsw i64 %idxprom21, %1, !dbg !141
  %arrayidx22 = getelementptr inbounds i32, i32* %32, i64 %34, !dbg !141
  %35 = load i32, i32* %x, align 4, !dbg !144
  %idxprom23 = sext i32 %35 to i64, !dbg !141
  %arrayidx24 = getelementptr inbounds i32, i32* %arrayidx22, i64 %idxprom23, !dbg !141
  %36 = load i32, i32* %arrayidx24, align 4, !dbg !141
  %tobool25 = icmp ne i32 %36, 0, !dbg !141
  br i1 %tobool25, label %if.then26, label %if.end27, !dbg !145

if.then26:                                        ; preds = %for.end20
  %37 = load i32, i32* %n, align 4, !dbg !146
  %dec = add nsw i32 %37, -1, !dbg !146
  store i32 %dec, i32* %n, align 4, !dbg !146
  br label %if.end27, !dbg !147

if.end27:                                         ; preds = %if.then26, %for.end20
  %38 = load i32, i32* %n, align 4, !dbg !148
  %cmp28 = icmp eq i32 %38, 3, !dbg !149
  br i1 %cmp28, label %lor.end, label %lor.rhs, !dbg !150

lor.rhs:                                          ; preds = %if.end27
  %39 = load i32, i32* %n, align 4, !dbg !151
  %cmp29 = icmp eq i32 %39, 2, !dbg !152
  br i1 %cmp29, label %land.rhs, label %land.end, !dbg !153

land.rhs:                                         ; preds = %lor.rhs
  %40 = load i32*, i32** %univ, align 8, !dbg !154
  %41 = load i32, i32* %y, align 4, !dbg !155
  %idxprom30 = sext i32 %41 to i64, !dbg !154
  %42 = mul nsw i64 %idxprom30, %1, !dbg !154
  %arrayidx31 = getelementptr inbounds i32, i32* %40, i64 %42, !dbg !154
  %43 = load i32, i32* %x, align 4, !dbg !156
  %idxprom32 = sext i32 %43 to i64, !dbg !154
  %arrayidx33 = getelementptr inbounds i32, i32* %arrayidx31, i64 %idxprom32, !dbg !154
  %44 = load i32, i32* %arrayidx33, align 4, !dbg !154
  %tobool34 = icmp ne i32 %44, 0, !dbg !153
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %45 = phi i1 [ false, %lor.rhs ], [ %tobool34, %land.rhs ], !dbg !157
  br label %lor.end, !dbg !150

lor.end:                                          ; preds = %land.end, %if.end27
  %46 = phi i1 [ true, %if.end27 ], [ %45, %land.end ]
  %lor.ext = zext i1 %46 to i32, !dbg !150
  %47 = load i32, i32* %y, align 4, !dbg !158
  %idxprom35 = sext i32 %47 to i64, !dbg !159
  %48 = mul nsw i64 %idxprom35, %7, !dbg !159
  %arrayidx36 = getelementptr inbounds i32, i32* %vla, i64 %48, !dbg !159
  %49 = load i32, i32* %x, align 4, !dbg !160
  %idxprom37 = sext i32 %49 to i64, !dbg !159
  %arrayidx38 = getelementptr inbounds i32, i32* %arrayidx36, i64 %idxprom37, !dbg !159
  store i32 %lor.ext, i32* %arrayidx38, align 4, !dbg !161
  br label %for.inc39, !dbg !162

for.inc39:                                        ; preds = %lor.end
  %50 = load i32, i32* %x, align 4, !dbg !88
  %inc40 = add nsw i32 %50, 1, !dbg !88
  store i32 %inc40, i32* %x, align 4, !dbg !88
  br label %for.cond1, !dbg !88, !llvm.loop !163

for.end41:                                        ; preds = %for.cond1
  br label %for.inc42, !dbg !164

for.inc42:                                        ; preds = %for.end41
  %51 = load i32, i32* %y, align 4, !dbg !83
  %inc43 = add nsw i32 %51, 1, !dbg !83
  store i32 %inc43, i32* %y, align 4, !dbg !83
  br label %for.cond, !dbg !83, !llvm.loop !165

for.end44:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %y45, metadata !167, metadata !DIExpression()), !dbg !169
  store i32 0, i32* %y45, align 4, !dbg !169
  br label %for.cond46, !dbg !169

for.cond46:                                       ; preds = %for.inc64, %for.end44
  %52 = load i32, i32* %y45, align 4, !dbg !170
  %53 = load i32, i32* %h.addr, align 4, !dbg !170
  %cmp47 = icmp slt i32 %52, %53, !dbg !170
  br i1 %cmp47, label %for.body48, label %for.end66, !dbg !169

for.body48:                                       ; preds = %for.cond46
  call void @llvm.dbg.declare(metadata i32* %x49, metadata !172, metadata !DIExpression()), !dbg !174
  store i32 0, i32* %x49, align 4, !dbg !174
  br label %for.cond50, !dbg !174

for.cond50:                                       ; preds = %for.inc61, %for.body48
  %54 = load i32, i32* %x49, align 4, !dbg !175
  %55 = load i32, i32* %w.addr, align 4, !dbg !175
  %cmp51 = icmp slt i32 %54, %55, !dbg !175
  br i1 %cmp51, label %for.body52, label %for.end63, !dbg !174

for.body52:                                       ; preds = %for.cond50
  %56 = load i32, i32* %y45, align 4, !dbg !177
  %idxprom53 = sext i32 %56 to i64, !dbg !178
  %57 = mul nsw i64 %idxprom53, %7, !dbg !178
  %arrayidx54 = getelementptr inbounds i32, i32* %vla, i64 %57, !dbg !178
  %58 = load i32, i32* %x49, align 4, !dbg !179
  %idxprom55 = sext i32 %58 to i64, !dbg !178
  %arrayidx56 = getelementptr inbounds i32, i32* %arrayidx54, i64 %idxprom55, !dbg !178
  %59 = load i32, i32* %arrayidx56, align 4, !dbg !178
  %60 = load i32*, i32** %univ, align 8, !dbg !180
  %61 = load i32, i32* %y45, align 4, !dbg !181
  %idxprom57 = sext i32 %61 to i64, !dbg !180
  %62 = mul nsw i64 %idxprom57, %1, !dbg !180
  %arrayidx58 = getelementptr inbounds i32, i32* %60, i64 %62, !dbg !180
  %63 = load i32, i32* %x49, align 4, !dbg !182
  %idxprom59 = sext i32 %63 to i64, !dbg !180
  %arrayidx60 = getelementptr inbounds i32, i32* %arrayidx58, i64 %idxprom59, !dbg !180
  store i32 %59, i32* %arrayidx60, align 4, !dbg !183
  br label %for.inc61, !dbg !180

for.inc61:                                        ; preds = %for.body52
  %64 = load i32, i32* %x49, align 4, !dbg !175
  %inc62 = add nsw i32 %64, 1, !dbg !175
  store i32 %inc62, i32* %x49, align 4, !dbg !175
  br label %for.cond50, !dbg !175, !llvm.loop !184

for.end63:                                        ; preds = %for.cond50
  br label %for.inc64, !dbg !185

for.inc64:                                        ; preds = %for.end63
  %65 = load i32, i32* %y45, align 4, !dbg !170
  %inc65 = add nsw i32 %65, 1, !dbg !170
  store i32 %inc65, i32* %y45, align 4, !dbg !170
  br label %for.cond46, !dbg !170, !llvm.loop !186

for.end66:                                        ; preds = %for.cond46
  %66 = load i8*, i8** %saved_stack, align 8, !dbg !188
  call void @llvm.stackrestore(i8* %66), !dbg !188
  ret void, !dbg !188
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #3

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @game(i32 %w, i32 %h) #0 !dbg !189 {
entry:
  %w.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %saved_stack = alloca i8*, align 8
  %__vla_expr0 = alloca i64, align 8
  %__vla_expr1 = alloca i64, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 %w, i32* %w.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %w.addr, metadata !192, metadata !DIExpression()), !dbg !193
  store i32 %h, i32* %h.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %h.addr, metadata !194, metadata !DIExpression()), !dbg !195
  %0 = load i32, i32* %h.addr, align 4, !dbg !196
  %1 = zext i32 %0 to i64, !dbg !197
  %2 = load i32, i32* %w.addr, align 4, !dbg !198
  %3 = zext i32 %2 to i64, !dbg !197
  %4 = call i8* @llvm.stacksave(), !dbg !197
  store i8* %4, i8** %saved_stack, align 8, !dbg !197
  %5 = mul nuw i64 %1, %3, !dbg !197
  %vla = alloca i32, i64 %5, align 16, !dbg !197
  store i64 %1, i64* %__vla_expr0, align 8, !dbg !197
  store i64 %3, i64* %__vla_expr1, align 8, !dbg !197
  call void @llvm.dbg.declare(metadata i64* %__vla_expr0, metadata !199, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata i64* %__vla_expr1, metadata !201, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata i32* %vla, metadata !202, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.declare(metadata i32* %x, metadata !208, metadata !DIExpression()), !dbg !210
  store i32 0, i32* %x, align 4, !dbg !210
  br label %for.cond, !dbg !210

for.cond:                                         ; preds = %for.inc7, %entry
  %6 = load i32, i32* %x, align 4, !dbg !211
  %7 = load i32, i32* %w.addr, align 4, !dbg !211
  %cmp = icmp slt i32 %6, %7, !dbg !211
  br i1 %cmp, label %for.body, label %for.end9, !dbg !210

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %y, metadata !213, metadata !DIExpression()), !dbg !215
  store i32 0, i32* %y, align 4, !dbg !215
  br label %for.cond1, !dbg !215

for.cond1:                                        ; preds = %for.inc, %for.body
  %8 = load i32, i32* %y, align 4, !dbg !216
  %9 = load i32, i32* %h.addr, align 4, !dbg !216
  %cmp2 = icmp slt i32 %8, %9, !dbg !216
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !215

for.body3:                                        ; preds = %for.cond1
  %call = call i32 @rand() #3, !dbg !218
  %cmp4 = icmp slt i32 %call, 214748364, !dbg !219
  %10 = zext i1 %cmp4 to i64, !dbg !218
  %cond = select i1 %cmp4, i32 1, i32 0, !dbg !218
  %11 = load i32, i32* %y, align 4, !dbg !220
  %idxprom = sext i32 %11 to i64, !dbg !221
  %12 = mul nsw i64 %idxprom, %3, !dbg !221
  %arrayidx = getelementptr inbounds i32, i32* %vla, i64 %12, !dbg !221
  %13 = load i32, i32* %x, align 4, !dbg !222
  %idxprom5 = sext i32 %13 to i64, !dbg !221
  %arrayidx6 = getelementptr inbounds i32, i32* %arrayidx, i64 %idxprom5, !dbg !221
  store i32 %cond, i32* %arrayidx6, align 4, !dbg !223
  br label %for.inc, !dbg !221

for.inc:                                          ; preds = %for.body3
  %14 = load i32, i32* %y, align 4, !dbg !216
  %inc = add nsw i32 %14, 1, !dbg !216
  store i32 %inc, i32* %y, align 4, !dbg !216
  br label %for.cond1, !dbg !216, !llvm.loop !224

for.end:                                          ; preds = %for.cond1
  br label %for.inc7, !dbg !225

for.inc7:                                         ; preds = %for.end
  %15 = load i32, i32* %x, align 4, !dbg !211
  %inc8 = add nsw i32 %15, 1, !dbg !211
  store i32 %inc8, i32* %x, align 4, !dbg !211
  br label %for.cond, !dbg !211, !llvm.loop !226

for.end9:                                         ; preds = %for.cond
  br label %while.cond, !dbg !228

while.cond:                                       ; preds = %while.body, %for.end9
  br label %while.body, !dbg !228

while.body:                                       ; preds = %while.cond
  %16 = bitcast i32* %vla to i8*, !dbg !229
  %17 = load i32, i32* %w.addr, align 4, !dbg !231
  %18 = load i32, i32* %h.addr, align 4, !dbg !232
  call void @show(i8* %16, i32 %17, i32 %18), !dbg !233
  %19 = bitcast i32* %vla to i8*, !dbg !234
  %20 = load i32, i32* %w.addr, align 4, !dbg !235
  %21 = load i32, i32* %h.addr, align 4, !dbg !236
  call void @evolve(i8* %19, i32 %20, i32 %21), !dbg !237
  %call10 = call i32 @usleep(i32 200000), !dbg !238
  br label %while.cond, !dbg !228, !llvm.loop !239
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #4

declare dso_local i32 @usleep(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !241 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %v.addr = alloca i8**, align 8
  %w = alloca i32, align 4
  %h = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !247, metadata !DIExpression()), !dbg !248
  store i8** %v, i8*** %v.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %v.addr, metadata !249, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.declare(metadata i32* %w, metadata !251, metadata !DIExpression()), !dbg !252
  store i32 0, i32* %w, align 4, !dbg !252
  call void @llvm.dbg.declare(metadata i32* %h, metadata !253, metadata !DIExpression()), !dbg !254
  store i32 0, i32* %h, align 4, !dbg !254
  %0 = load i32, i32* %c.addr, align 4, !dbg !255
  %cmp = icmp sgt i32 %0, 1, !dbg !257
  br i1 %cmp, label %if.then, label %if.end, !dbg !258

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %v.addr, align 8, !dbg !259
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !259
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !259
  %call = call i32 @atoi(i8* %2) #6, !dbg !260
  store i32 %call, i32* %w, align 4, !dbg !261
  br label %if.end, !dbg !262

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %c.addr, align 4, !dbg !263
  %cmp1 = icmp sgt i32 %3, 2, !dbg !265
  br i1 %cmp1, label %if.then2, label %if.end5, !dbg !266

if.then2:                                         ; preds = %if.end
  %4 = load i8**, i8*** %v.addr, align 8, !dbg !267
  %arrayidx3 = getelementptr inbounds i8*, i8** %4, i64 2, !dbg !267
  %5 = load i8*, i8** %arrayidx3, align 8, !dbg !267
  %call4 = call i32 @atoi(i8* %5) #6, !dbg !268
  store i32 %call4, i32* %h, align 4, !dbg !269
  br label %if.end5, !dbg !270

if.end5:                                          ; preds = %if.then2, %if.end
  %6 = load i32, i32* %w, align 4, !dbg !271
  %cmp6 = icmp sle i32 %6, 0, !dbg !273
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !274

if.then7:                                         ; preds = %if.end5
  store i32 30, i32* %w, align 4, !dbg !275
  br label %if.end8, !dbg !276

if.end8:                                          ; preds = %if.then7, %if.end5
  %7 = load i32, i32* %h, align 4, !dbg !277
  %cmp9 = icmp sle i32 %7, 0, !dbg !279
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !280

if.then10:                                        ; preds = %if.end8
  store i32 30, i32* %h, align 4, !dbg !281
  br label %if.end11, !dbg !282

if.end11:                                         ; preds = %if.then10, %if.end8
  %8 = load i32, i32* %w, align 4, !dbg !283
  %9 = load i32, i32* %h, align 4, !dbg !284
  call void @game(i32 %8, i32 %9), !dbg !285
  %10 = load i32, i32* %retval, align 4, !dbg !286
  ret i32 %10, !dbg !286
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "conways-game-of-life.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Conways-Game-of-Life")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "show", scope: !1, file: !1, line: 8, type: !8, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10, !11, !11}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "u", arg: 1, scope: !7, file: !1, line: 8, type: !10)
!13 = !DILocation(line: 8, column: 17, scope: !7)
!14 = !DILocalVariable(name: "w", arg: 2, scope: !7, file: !1, line: 8, type: !11)
!15 = !DILocation(line: 8, column: 24, scope: !7)
!16 = !DILocalVariable(name: "h", arg: 3, scope: !7, file: !1, line: 8, type: !11)
!17 = !DILocation(line: 8, column: 31, scope: !7)
!18 = !DILocation(line: 10, column: 14, scope: !7)
!19 = !DILocation(line: 10, column: 2, scope: !7)
!20 = !DILocalVariable(name: "univ", scope: !7, file: !1, line: 10, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: -1)
!25 = !DILocation(line: 10, column: 8, scope: !7)
!26 = !DILocation(line: 10, column: 19, scope: !7)
!27 = !DILocation(line: 11, column: 2, scope: !7)
!28 = !DILocalVariable(name: "y", scope: !29, file: !1, line: 12, type: !11)
!29 = distinct !DILexicalBlock(scope: !7, file: !1, line: 12, column: 2)
!30 = !DILocation(line: 12, column: 2, scope: !29)
!31 = !DILocation(line: 12, column: 2, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !1, line: 12, column: 2)
!33 = !DILocalVariable(name: "x", scope: !34, file: !1, line: 13, type: !11)
!34 = distinct !DILexicalBlock(scope: !35, file: !1, line: 13, column: 3)
!35 = distinct !DILexicalBlock(scope: !32, file: !1, line: 12, column: 8)
!36 = !DILocation(line: 13, column: 3, scope: !34)
!37 = !DILocation(line: 13, column: 3, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !1, line: 13, column: 3)
!39 = !DILocation(line: 13, column: 16, scope: !38)
!40 = !DILocation(line: 13, column: 21, scope: !38)
!41 = !DILocation(line: 13, column: 24, scope: !38)
!42 = !DILocation(line: 13, column: 9, scope: !38)
!43 = distinct !{!43, !36, !44}
!44 = !DILocation(line: 13, column: 54, scope: !34)
!45 = !DILocation(line: 14, column: 3, scope: !35)
!46 = !DILocation(line: 15, column: 2, scope: !35)
!47 = distinct !{!47, !30, !48}
!48 = !DILocation(line: 15, column: 2, scope: !29)
!49 = !DILocation(line: 16, column: 9, scope: !7)
!50 = !DILocation(line: 16, column: 2, scope: !7)
!51 = !DILocation(line: 17, column: 1, scope: !7)
!52 = distinct !DISubprogram(name: "evolve", scope: !1, file: !1, line: 19, type: !8, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocalVariable(name: "u", arg: 1, scope: !52, file: !1, line: 19, type: !10)
!54 = !DILocation(line: 19, column: 19, scope: !52)
!55 = !DILocalVariable(name: "w", arg: 2, scope: !52, file: !1, line: 19, type: !11)
!56 = !DILocation(line: 19, column: 26, scope: !52)
!57 = !DILocalVariable(name: "h", arg: 3, scope: !52, file: !1, line: 19, type: !11)
!58 = !DILocation(line: 19, column: 33, scope: !52)
!59 = !DILocation(line: 21, column: 19, scope: !52)
!60 = !DILocation(line: 21, column: 2, scope: !52)
!61 = !DILocalVariable(name: "univ", scope: !52, file: !1, line: 21, type: !62)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !64, elements: !23)
!64 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!65 = !DILocation(line: 21, column: 13, scope: !52)
!66 = !DILocation(line: 21, column: 24, scope: !52)
!67 = !DILocation(line: 22, column: 15, scope: !52)
!68 = !DILocation(line: 22, column: 2, scope: !52)
!69 = !DILocation(line: 22, column: 18, scope: !52)
!70 = !DILocalVariable(name: "__vla_expr0", scope: !52, type: !71, flags: DIFlagArtificial)
!71 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!72 = !DILocation(line: 0, scope: !52)
!73 = !DILocalVariable(name: "__vla_expr1", scope: !52, type: !71, flags: DIFlagArtificial)
!74 = !DILocalVariable(name: "new", scope: !52, file: !1, line: 22, type: !75)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !64, elements: !76)
!76 = !{!77, !78}
!77 = !DISubrange(count: !70)
!78 = !DISubrange(count: !73)
!79 = !DILocation(line: 22, column: 11, scope: !52)
!80 = !DILocalVariable(name: "y", scope: !81, file: !1, line: 24, type: !11)
!81 = distinct !DILexicalBlock(scope: !52, file: !1, line: 24, column: 2)
!82 = !DILocation(line: 24, column: 2, scope: !81)
!83 = !DILocation(line: 24, column: 2, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !1, line: 24, column: 2)
!85 = !DILocalVariable(name: "x", scope: !86, file: !1, line: 24, type: !11)
!86 = distinct !DILexicalBlock(scope: !84, file: !1, line: 24, column: 8)
!87 = !DILocation(line: 24, column: 8, scope: !86)
!88 = !DILocation(line: 24, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !1, line: 24, column: 8)
!90 = !DILocalVariable(name: "n", scope: !91, file: !1, line: 25, type: !11)
!91 = distinct !DILexicalBlock(scope: !89, file: !1, line: 24, column: 14)
!92 = !DILocation(line: 25, column: 7, scope: !91)
!93 = !DILocalVariable(name: "y1", scope: !94, file: !1, line: 26, type: !11)
!94 = distinct !DILexicalBlock(scope: !91, file: !1, line: 26, column: 3)
!95 = !DILocation(line: 26, column: 12, scope: !94)
!96 = !DILocation(line: 26, column: 17, scope: !94)
!97 = !DILocation(line: 26, column: 19, scope: !94)
!98 = !DILocation(line: 26, column: 8, scope: !94)
!99 = !DILocation(line: 26, column: 24, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !1, line: 26, column: 3)
!101 = !DILocation(line: 26, column: 30, scope: !100)
!102 = !DILocation(line: 26, column: 32, scope: !100)
!103 = !DILocation(line: 26, column: 27, scope: !100)
!104 = !DILocation(line: 26, column: 3, scope: !94)
!105 = !DILocalVariable(name: "x1", scope: !106, file: !1, line: 27, type: !11)
!106 = distinct !DILexicalBlock(scope: !100, file: !1, line: 27, column: 4)
!107 = !DILocation(line: 27, column: 13, scope: !106)
!108 = !DILocation(line: 27, column: 18, scope: !106)
!109 = !DILocation(line: 27, column: 20, scope: !106)
!110 = !DILocation(line: 27, column: 9, scope: !106)
!111 = !DILocation(line: 27, column: 25, scope: !112)
!112 = distinct !DILexicalBlock(scope: !106, file: !1, line: 27, column: 4)
!113 = !DILocation(line: 27, column: 31, scope: !112)
!114 = !DILocation(line: 27, column: 33, scope: !112)
!115 = !DILocation(line: 27, column: 28, scope: !112)
!116 = !DILocation(line: 27, column: 4, scope: !106)
!117 = !DILocation(line: 28, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !1, line: 28, column: 9)
!119 = !DILocation(line: 28, column: 15, scope: !118)
!120 = !DILocation(line: 28, column: 20, scope: !118)
!121 = !DILocation(line: 28, column: 18, scope: !118)
!122 = !DILocation(line: 28, column: 25, scope: !118)
!123 = !DILocation(line: 28, column: 23, scope: !118)
!124 = !DILocation(line: 28, column: 29, scope: !118)
!125 = !DILocation(line: 28, column: 34, scope: !118)
!126 = !DILocation(line: 28, column: 32, scope: !118)
!127 = !DILocation(line: 28, column: 39, scope: !118)
!128 = !DILocation(line: 28, column: 37, scope: !118)
!129 = !DILocation(line: 28, column: 9, scope: !112)
!130 = !DILocation(line: 29, column: 7, scope: !118)
!131 = !DILocation(line: 29, column: 6, scope: !118)
!132 = !DILocation(line: 28, column: 40, scope: !118)
!133 = !DILocation(line: 27, column: 40, scope: !112)
!134 = !DILocation(line: 27, column: 4, scope: !112)
!135 = distinct !{!135, !116, !136}
!136 = !DILocation(line: 29, column: 7, scope: !106)
!137 = !DILocation(line: 26, column: 39, scope: !100)
!138 = !DILocation(line: 26, column: 3, scope: !100)
!139 = distinct !{!139, !104, !140}
!140 = !DILocation(line: 29, column: 7, scope: !94)
!141 = !DILocation(line: 31, column: 7, scope: !142)
!142 = distinct !DILexicalBlock(scope: !91, file: !1, line: 31, column: 7)
!143 = !DILocation(line: 31, column: 12, scope: !142)
!144 = !DILocation(line: 31, column: 15, scope: !142)
!145 = !DILocation(line: 31, column: 7, scope: !91)
!146 = !DILocation(line: 31, column: 20, scope: !142)
!147 = !DILocation(line: 31, column: 19, scope: !142)
!148 = !DILocation(line: 32, column: 16, scope: !91)
!149 = !DILocation(line: 32, column: 18, scope: !91)
!150 = !DILocation(line: 32, column: 23, scope: !91)
!151 = !DILocation(line: 32, column: 27, scope: !91)
!152 = !DILocation(line: 32, column: 29, scope: !91)
!153 = !DILocation(line: 32, column: 34, scope: !91)
!154 = !DILocation(line: 32, column: 37, scope: !91)
!155 = !DILocation(line: 32, column: 42, scope: !91)
!156 = !DILocation(line: 32, column: 45, scope: !91)
!157 = !DILocation(line: 0, scope: !91)
!158 = !DILocation(line: 32, column: 7, scope: !91)
!159 = !DILocation(line: 32, column: 3, scope: !91)
!160 = !DILocation(line: 32, column: 10, scope: !91)
!161 = !DILocation(line: 32, column: 13, scope: !91)
!162 = !DILocation(line: 33, column: 2, scope: !91)
!163 = distinct !{!163, !87, !164}
!164 = !DILocation(line: 33, column: 2, scope: !86)
!165 = distinct !{!165, !82, !166}
!166 = !DILocation(line: 33, column: 2, scope: !81)
!167 = !DILocalVariable(name: "y", scope: !168, file: !1, line: 34, type: !11)
!168 = distinct !DILexicalBlock(scope: !52, file: !1, line: 34, column: 2)
!169 = !DILocation(line: 34, column: 2, scope: !168)
!170 = !DILocation(line: 34, column: 2, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !1, line: 34, column: 2)
!172 = !DILocalVariable(name: "x", scope: !173, file: !1, line: 34, type: !11)
!173 = distinct !DILexicalBlock(scope: !171, file: !1, line: 34, column: 8)
!174 = !DILocation(line: 34, column: 8, scope: !173)
!175 = !DILocation(line: 34, column: 8, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !1, line: 34, column: 8)
!177 = !DILocation(line: 34, column: 31, scope: !176)
!178 = !DILocation(line: 34, column: 27, scope: !176)
!179 = !DILocation(line: 34, column: 34, scope: !176)
!180 = !DILocation(line: 34, column: 14, scope: !176)
!181 = !DILocation(line: 34, column: 19, scope: !176)
!182 = !DILocation(line: 34, column: 22, scope: !176)
!183 = !DILocation(line: 34, column: 25, scope: !176)
!184 = distinct !{!184, !174, !185}
!185 = !DILocation(line: 34, column: 35, scope: !173)
!186 = distinct !{!186, !169, !187}
!187 = !DILocation(line: 34, column: 35, scope: !168)
!188 = !DILocation(line: 35, column: 1, scope: !52)
!189 = distinct !DISubprogram(name: "game", scope: !1, file: !1, line: 37, type: !190, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!190 = !DISubroutineType(types: !191)
!191 = !{null, !11, !11}
!192 = !DILocalVariable(name: "w", arg: 1, scope: !189, file: !1, line: 37, type: !11)
!193 = !DILocation(line: 37, column: 15, scope: !189)
!194 = !DILocalVariable(name: "h", arg: 2, scope: !189, file: !1, line: 37, type: !11)
!195 = !DILocation(line: 37, column: 22, scope: !189)
!196 = !DILocation(line: 39, column: 16, scope: !189)
!197 = !DILocation(line: 39, column: 2, scope: !189)
!198 = !DILocation(line: 39, column: 19, scope: !189)
!199 = !DILocalVariable(name: "__vla_expr0", scope: !189, type: !71, flags: DIFlagArtificial)
!200 = !DILocation(line: 0, scope: !189)
!201 = !DILocalVariable(name: "__vla_expr1", scope: !189, type: !71, flags: DIFlagArtificial)
!202 = !DILocalVariable(name: "univ", scope: !189, file: !1, line: 39, type: !203)
!203 = !DICompositeType(tag: DW_TAG_array_type, baseType: !64, elements: !204)
!204 = !{!205, !206}
!205 = !DISubrange(count: !199)
!206 = !DISubrange(count: !201)
!207 = !DILocation(line: 39, column: 11, scope: !189)
!208 = !DILocalVariable(name: "x", scope: !209, file: !1, line: 40, type: !11)
!209 = distinct !DILexicalBlock(scope: !189, file: !1, line: 40, column: 2)
!210 = !DILocation(line: 40, column: 2, scope: !209)
!211 = !DILocation(line: 40, column: 2, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !1, line: 40, column: 2)
!213 = !DILocalVariable(name: "y", scope: !214, file: !1, line: 40, type: !11)
!214 = distinct !DILexicalBlock(scope: !212, file: !1, line: 40, column: 2)
!215 = !DILocation(line: 40, column: 2, scope: !214)
!216 = !DILocation(line: 40, column: 2, scope: !217)
!217 = distinct !DILexicalBlock(scope: !214, file: !1, line: 40, column: 2)
!218 = !DILocation(line: 40, column: 22, scope: !217)
!219 = !DILocation(line: 40, column: 29, scope: !217)
!220 = !DILocation(line: 40, column: 14, scope: !217)
!221 = !DILocation(line: 40, column: 9, scope: !217)
!222 = !DILocation(line: 40, column: 17, scope: !217)
!223 = !DILocation(line: 40, column: 20, scope: !217)
!224 = distinct !{!224, !215, !225}
!225 = !DILocation(line: 40, column: 51, scope: !214)
!226 = distinct !{!226, !210, !227}
!227 = !DILocation(line: 40, column: 51, scope: !209)
!228 = !DILocation(line: 41, column: 2, scope: !189)
!229 = !DILocation(line: 42, column: 8, scope: !230)
!230 = distinct !DILexicalBlock(scope: !189, file: !1, line: 41, column: 12)
!231 = !DILocation(line: 42, column: 14, scope: !230)
!232 = !DILocation(line: 42, column: 17, scope: !230)
!233 = !DILocation(line: 42, column: 3, scope: !230)
!234 = !DILocation(line: 43, column: 10, scope: !230)
!235 = !DILocation(line: 43, column: 16, scope: !230)
!236 = !DILocation(line: 43, column: 19, scope: !230)
!237 = !DILocation(line: 43, column: 3, scope: !230)
!238 = !DILocation(line: 44, column: 3, scope: !230)
!239 = distinct !{!239, !228, !240}
!240 = !DILocation(line: 45, column: 2, scope: !189)
!241 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 48, type: !242, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!242 = !DISubroutineType(types: !243)
!243 = !{!11, !11, !244}
!244 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !245, size: 64)
!245 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !246, size: 64)
!246 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!247 = !DILocalVariable(name: "c", arg: 1, scope: !241, file: !1, line: 48, type: !11)
!248 = !DILocation(line: 48, column: 14, scope: !241)
!249 = !DILocalVariable(name: "v", arg: 2, scope: !241, file: !1, line: 48, type: !244)
!250 = !DILocation(line: 48, column: 24, scope: !241)
!251 = !DILocalVariable(name: "w", scope: !241, file: !1, line: 50, type: !11)
!252 = !DILocation(line: 50, column: 6, scope: !241)
!253 = !DILocalVariable(name: "h", scope: !241, file: !1, line: 50, type: !11)
!254 = !DILocation(line: 50, column: 13, scope: !241)
!255 = !DILocation(line: 51, column: 6, scope: !256)
!256 = distinct !DILexicalBlock(scope: !241, file: !1, line: 51, column: 6)
!257 = !DILocation(line: 51, column: 8, scope: !256)
!258 = !DILocation(line: 51, column: 6, scope: !241)
!259 = !DILocation(line: 51, column: 22, scope: !256)
!260 = !DILocation(line: 51, column: 17, scope: !256)
!261 = !DILocation(line: 51, column: 15, scope: !256)
!262 = !DILocation(line: 51, column: 13, scope: !256)
!263 = !DILocation(line: 52, column: 6, scope: !264)
!264 = distinct !DILexicalBlock(scope: !241, file: !1, line: 52, column: 6)
!265 = !DILocation(line: 52, column: 8, scope: !264)
!266 = !DILocation(line: 52, column: 6, scope: !241)
!267 = !DILocation(line: 52, column: 22, scope: !264)
!268 = !DILocation(line: 52, column: 17, scope: !264)
!269 = !DILocation(line: 52, column: 15, scope: !264)
!270 = !DILocation(line: 52, column: 13, scope: !264)
!271 = !DILocation(line: 53, column: 6, scope: !272)
!272 = distinct !DILexicalBlock(scope: !241, file: !1, line: 53, column: 6)
!273 = !DILocation(line: 53, column: 8, scope: !272)
!274 = !DILocation(line: 53, column: 6, scope: !241)
!275 = !DILocation(line: 53, column: 16, scope: !272)
!276 = !DILocation(line: 53, column: 14, scope: !272)
!277 = !DILocation(line: 54, column: 6, scope: !278)
!278 = distinct !DILexicalBlock(scope: !241, file: !1, line: 54, column: 6)
!279 = !DILocation(line: 54, column: 8, scope: !278)
!280 = !DILocation(line: 54, column: 6, scope: !241)
!281 = !DILocation(line: 54, column: 16, scope: !278)
!282 = !DILocation(line: 54, column: 14, scope: !278)
!283 = !DILocation(line: 55, column: 7, scope: !241)
!284 = !DILocation(line: 55, column: 10, scope: !241)
!285 = !DILocation(line: 55, column: 2, scope: !241)
!286 = !DILocation(line: 56, column: 1, scope: !241)
