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
  call void @llvm.dbg.value(metadata i8* %u, metadata !12, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i32 %w, metadata !14, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i32 %h, metadata !15, metadata !DIExpression()), !dbg !13
  %0 = zext i32 %w to i64, !dbg !16
  %1 = bitcast i8* %u to i32*, !dbg !17
  call void @llvm.dbg.value(metadata i32* %1, metadata !18, metadata !DIExpression()), !dbg !13
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !23
  call void @llvm.dbg.value(metadata i32 0, metadata !24, metadata !DIExpression()), !dbg !26
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc8, %entry
  %y.0 = phi i32 [ 0, %entry ], [ %inc9, %for.inc8 ], !dbg !26
  call void @llvm.dbg.value(metadata i32 %y.0, metadata !24, metadata !DIExpression()), !dbg !26
  %cmp = icmp slt i32 %y.0, %h, !dbg !28
  br i1 %cmp, label %for.body, label %for.end10, !dbg !27

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !30, metadata !DIExpression()), !dbg !33
  br label %for.cond1, !dbg !34

for.cond1:                                        ; preds = %for.inc, %for.body
  %x.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !33
  call void @llvm.dbg.value(metadata i32 %x.0, metadata !30, metadata !DIExpression()), !dbg !33
  %cmp2 = icmp slt i32 %x.0, %w, !dbg !35
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !34

for.body3:                                        ; preds = %for.cond1
  %idxprom = sext i32 %y.0 to i64, !dbg !37
  %2 = mul nsw i64 %idxprom, %0, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 %2, !dbg !37
  %idxprom4 = sext i32 %x.0 to i64, !dbg !37
  %arrayidx5 = getelementptr inbounds i32, i32* %arrayidx, i64 %idxprom4, !dbg !37
  %3 = load i32, i32* %arrayidx5, align 4, !dbg !37
  %tobool = icmp ne i32 %3, 0, !dbg !37
  %4 = zext i1 %tobool to i64, !dbg !37
  %cond = select i1 %tobool, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), !dbg !37
  %call6 = call i32 (i8*, ...) @printf(i8* %cond), !dbg !38
  br label %for.inc, !dbg !38

for.inc:                                          ; preds = %for.body3
  %inc = add nsw i32 %x.0, 1, !dbg !35
  call void @llvm.dbg.value(metadata i32 %inc, metadata !30, metadata !DIExpression()), !dbg !33
  br label %for.cond1, !dbg !35, !llvm.loop !39

for.end:                                          ; preds = %for.cond1
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)), !dbg !41
  br label %for.inc8, !dbg !42

for.inc8:                                         ; preds = %for.end
  %inc9 = add nsw i32 %y.0, 1, !dbg !28
  call void @llvm.dbg.value(metadata i32 %inc9, metadata !24, metadata !DIExpression()), !dbg !26
  br label %for.cond, !dbg !28, !llvm.loop !43

for.end10:                                        ; preds = %for.cond
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !45
  %call11 = call i32 @fflush(%struct._IO_FILE* %5), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @fflush(%struct._IO_FILE*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @evolve(i8* %u, i32 %w, i32 %h) #0 !dbg !48 {
entry:
  call void @llvm.dbg.value(metadata i8* %u, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.value(metadata i32 %w, metadata !51, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.value(metadata i32 %h, metadata !52, metadata !DIExpression()), !dbg !50
  %0 = zext i32 %w to i64, !dbg !53
  %1 = bitcast i8* %u to i32*, !dbg !54
  call void @llvm.dbg.value(metadata i32* %1, metadata !55, metadata !DIExpression()), !dbg !50
  %2 = zext i32 %h to i64, !dbg !59
  %3 = zext i32 %w to i64, !dbg !59
  %4 = call i8* @llvm.stacksave(), !dbg !59
  %5 = mul nuw i64 %2, %3, !dbg !59
  %vla = alloca i32, i64 %5, align 16, !dbg !59
  call void @llvm.dbg.value(metadata i64 %2, metadata !60, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.value(metadata i64 %3, metadata !62, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i32* %vla, metadata !63, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.value(metadata i32 0, metadata !69, metadata !DIExpression()), !dbg !71
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc42, %entry
  %y.0 = phi i32 [ 0, %entry ], [ %inc43, %for.inc42 ], !dbg !71
  call void @llvm.dbg.value(metadata i32 %y.0, metadata !69, metadata !DIExpression()), !dbg !71
  %cmp = icmp slt i32 %y.0, %h, !dbg !73
  br i1 %cmp, label %for.body, label %for.end44, !dbg !72

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !75, metadata !DIExpression()), !dbg !77
  br label %for.cond1, !dbg !78

for.cond1:                                        ; preds = %for.inc39, %for.body
  %x.0 = phi i32 [ 0, %for.body ], [ %inc40, %for.inc39 ], !dbg !77
  call void @llvm.dbg.value(metadata i32 %x.0, metadata !75, metadata !DIExpression()), !dbg !77
  %cmp2 = icmp slt i32 %x.0, %w, !dbg !79
  br i1 %cmp2, label %for.body3, label %for.end41, !dbg !78

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.value(metadata i32 0, metadata !81, metadata !DIExpression()), !dbg !83
  %sub = sub nsw i32 %y.0, 1, !dbg !84
  call void @llvm.dbg.value(metadata i32 %sub, metadata !86, metadata !DIExpression()), !dbg !87
  br label %for.cond4, !dbg !88

for.cond4:                                        ; preds = %for.inc18, %for.body3
  %n.0 = phi i32 [ 0, %for.body3 ], [ %n.1, %for.inc18 ], !dbg !89
  %y1.0 = phi i32 [ %sub, %for.body3 ], [ %inc19, %for.inc18 ], !dbg !87
  call void @llvm.dbg.value(metadata i32 %y1.0, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !81, metadata !DIExpression()), !dbg !83
  %add = add nsw i32 %y.0, 1, !dbg !90
  %cmp5 = icmp sle i32 %y1.0, %add, !dbg !92
  br i1 %cmp5, label %for.body6, label %for.end20, !dbg !93

for.body6:                                        ; preds = %for.cond4
  %sub7 = sub nsw i32 %x.0, 1, !dbg !94
  call void @llvm.dbg.value(metadata i32 %sub7, metadata !96, metadata !DIExpression()), !dbg !97
  br label %for.cond8, !dbg !98

for.cond8:                                        ; preds = %for.inc, %for.body6
  %n.1 = phi i32 [ %n.0, %for.body6 ], [ %n.2, %for.inc ], !dbg !83
  %x1.0 = phi i32 [ %sub7, %for.body6 ], [ %inc17, %for.inc ], !dbg !97
  call void @llvm.dbg.value(metadata i32 %x1.0, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.value(metadata i32 %n.1, metadata !81, metadata !DIExpression()), !dbg !83
  %add9 = add nsw i32 %x.0, 1, !dbg !99
  %cmp10 = icmp sle i32 %x1.0, %add9, !dbg !101
  br i1 %cmp10, label %for.body11, label %for.end, !dbg !102

for.body11:                                       ; preds = %for.cond8
  %add12 = add nsw i32 %y1.0, %h, !dbg !103
  %rem = srem i32 %add12, %h, !dbg !105
  %idxprom = sext i32 %rem to i64, !dbg !106
  %6 = mul nsw i64 %idxprom, %0, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 %6, !dbg !106
  %add13 = add nsw i32 %x1.0, %w, !dbg !107
  %rem14 = srem i32 %add13, %w, !dbg !108
  %idxprom15 = sext i32 %rem14 to i64, !dbg !106
  %arrayidx16 = getelementptr inbounds i32, i32* %arrayidx, i64 %idxprom15, !dbg !106
  %7 = load i32, i32* %arrayidx16, align 4, !dbg !106
  %tobool = icmp ne i32 %7, 0, !dbg !106
  br i1 %tobool, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %for.body11
  %inc = add nsw i32 %n.1, 1, !dbg !110
  call void @llvm.dbg.value(metadata i32 %inc, metadata !81, metadata !DIExpression()), !dbg !83
  br label %if.end, !dbg !111

if.end:                                           ; preds = %if.then, %for.body11
  %n.2 = phi i32 [ %inc, %if.then ], [ %n.1, %for.body11 ], !dbg !83
  call void @llvm.dbg.value(metadata i32 %n.2, metadata !81, metadata !DIExpression()), !dbg !83
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %if.end
  %inc17 = add nsw i32 %x1.0, 1, !dbg !113
  call void @llvm.dbg.value(metadata i32 %inc17, metadata !96, metadata !DIExpression()), !dbg !97
  br label %for.cond8, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond8
  br label %for.inc18, !dbg !116

for.inc18:                                        ; preds = %for.end
  %inc19 = add nsw i32 %y1.0, 1, !dbg !117
  call void @llvm.dbg.value(metadata i32 %inc19, metadata !86, metadata !DIExpression()), !dbg !87
  br label %for.cond4, !dbg !118, !llvm.loop !119

for.end20:                                        ; preds = %for.cond4
  %idxprom21 = sext i32 %y.0 to i64, !dbg !121
  %8 = mul nsw i64 %idxprom21, %0, !dbg !121
  %arrayidx22 = getelementptr inbounds i32, i32* %1, i64 %8, !dbg !121
  %idxprom23 = sext i32 %x.0 to i64, !dbg !121
  %arrayidx24 = getelementptr inbounds i32, i32* %arrayidx22, i64 %idxprom23, !dbg !121
  %9 = load i32, i32* %arrayidx24, align 4, !dbg !121
  %tobool25 = icmp ne i32 %9, 0, !dbg !121
  br i1 %tobool25, label %if.then26, label %if.end27, !dbg !123

if.then26:                                        ; preds = %for.end20
  %dec = add nsw i32 %n.0, -1, !dbg !124
  call void @llvm.dbg.value(metadata i32 %dec, metadata !81, metadata !DIExpression()), !dbg !83
  br label %if.end27, !dbg !125

if.end27:                                         ; preds = %if.then26, %for.end20
  %n.3 = phi i32 [ %dec, %if.then26 ], [ %n.0, %for.end20 ], !dbg !83
  call void @llvm.dbg.value(metadata i32 %n.3, metadata !81, metadata !DIExpression()), !dbg !83
  %cmp28 = icmp eq i32 %n.3, 3, !dbg !126
  br i1 %cmp28, label %lor.end, label %lor.rhs, !dbg !127

lor.rhs:                                          ; preds = %if.end27
  %cmp29 = icmp eq i32 %n.3, 2, !dbg !128
  br i1 %cmp29, label %land.rhs, label %land.end, !dbg !129

land.rhs:                                         ; preds = %lor.rhs
  %idxprom30 = sext i32 %y.0 to i64, !dbg !130
  %10 = mul nsw i64 %idxprom30, %0, !dbg !130
  %arrayidx31 = getelementptr inbounds i32, i32* %1, i64 %10, !dbg !130
  %idxprom32 = sext i32 %x.0 to i64, !dbg !130
  %arrayidx33 = getelementptr inbounds i32, i32* %arrayidx31, i64 %idxprom32, !dbg !130
  %11 = load i32, i32* %arrayidx33, align 4, !dbg !130
  %tobool34 = icmp ne i32 %11, 0, !dbg !129
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %12 = phi i1 [ false, %lor.rhs ], [ %tobool34, %land.rhs ], !dbg !83
  br label %lor.end, !dbg !127

lor.end:                                          ; preds = %land.end, %if.end27
  %13 = phi i1 [ true, %if.end27 ], [ %12, %land.end ]
  %lor.ext = zext i1 %13 to i32, !dbg !127
  %idxprom35 = sext i32 %y.0 to i64, !dbg !131
  %14 = mul nsw i64 %idxprom35, %3, !dbg !131
  %arrayidx36 = getelementptr inbounds i32, i32* %vla, i64 %14, !dbg !131
  %idxprom37 = sext i32 %x.0 to i64, !dbg !131
  %arrayidx38 = getelementptr inbounds i32, i32* %arrayidx36, i64 %idxprom37, !dbg !131
  store i32 %lor.ext, i32* %arrayidx38, align 4, !dbg !132
  br label %for.inc39, !dbg !133

for.inc39:                                        ; preds = %lor.end
  %inc40 = add nsw i32 %x.0, 1, !dbg !79
  call void @llvm.dbg.value(metadata i32 %inc40, metadata !75, metadata !DIExpression()), !dbg !77
  br label %for.cond1, !dbg !79, !llvm.loop !134

for.end41:                                        ; preds = %for.cond1
  br label %for.inc42, !dbg !135

for.inc42:                                        ; preds = %for.end41
  %inc43 = add nsw i32 %y.0, 1, !dbg !73
  call void @llvm.dbg.value(metadata i32 %inc43, metadata !69, metadata !DIExpression()), !dbg !71
  br label %for.cond, !dbg !73, !llvm.loop !136

for.end44:                                        ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !138, metadata !DIExpression()), !dbg !140
  br label %for.cond46, !dbg !141

for.cond46:                                       ; preds = %for.inc64, %for.end44
  %y45.0 = phi i32 [ 0, %for.end44 ], [ %inc65, %for.inc64 ], !dbg !140
  call void @llvm.dbg.value(metadata i32 %y45.0, metadata !138, metadata !DIExpression()), !dbg !140
  %cmp47 = icmp slt i32 %y45.0, %h, !dbg !142
  br i1 %cmp47, label %for.body48, label %for.end66, !dbg !141

for.body48:                                       ; preds = %for.cond46
  call void @llvm.dbg.value(metadata i32 0, metadata !144, metadata !DIExpression()), !dbg !146
  br label %for.cond50, !dbg !147

for.cond50:                                       ; preds = %for.inc61, %for.body48
  %x49.0 = phi i32 [ 0, %for.body48 ], [ %inc62, %for.inc61 ], !dbg !146
  call void @llvm.dbg.value(metadata i32 %x49.0, metadata !144, metadata !DIExpression()), !dbg !146
  %cmp51 = icmp slt i32 %x49.0, %w, !dbg !148
  br i1 %cmp51, label %for.body52, label %for.end63, !dbg !147

for.body52:                                       ; preds = %for.cond50
  %idxprom53 = sext i32 %y45.0 to i64, !dbg !150
  %15 = mul nsw i64 %idxprom53, %3, !dbg !150
  %arrayidx54 = getelementptr inbounds i32, i32* %vla, i64 %15, !dbg !150
  %idxprom55 = sext i32 %x49.0 to i64, !dbg !150
  %arrayidx56 = getelementptr inbounds i32, i32* %arrayidx54, i64 %idxprom55, !dbg !150
  %16 = load i32, i32* %arrayidx56, align 4, !dbg !150
  %idxprom57 = sext i32 %y45.0 to i64, !dbg !151
  %17 = mul nsw i64 %idxprom57, %0, !dbg !151
  %arrayidx58 = getelementptr inbounds i32, i32* %1, i64 %17, !dbg !151
  %idxprom59 = sext i32 %x49.0 to i64, !dbg !151
  %arrayidx60 = getelementptr inbounds i32, i32* %arrayidx58, i64 %idxprom59, !dbg !151
  store i32 %16, i32* %arrayidx60, align 4, !dbg !152
  br label %for.inc61, !dbg !151

for.inc61:                                        ; preds = %for.body52
  %inc62 = add nsw i32 %x49.0, 1, !dbg !148
  call void @llvm.dbg.value(metadata i32 %inc62, metadata !144, metadata !DIExpression()), !dbg !146
  br label %for.cond50, !dbg !148, !llvm.loop !153

for.end63:                                        ; preds = %for.cond50
  br label %for.inc64, !dbg !154

for.inc64:                                        ; preds = %for.end63
  %inc65 = add nsw i32 %y45.0, 1, !dbg !142
  call void @llvm.dbg.value(metadata i32 %inc65, metadata !138, metadata !DIExpression()), !dbg !140
  br label %for.cond46, !dbg !142, !llvm.loop !155

for.end66:                                        ; preds = %for.cond46
  call void @llvm.stackrestore(i8* %4), !dbg !157
  ret void, !dbg !157
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #3

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @game(i32 %w, i32 %h) #0 !dbg !158 {
entry:
  call void @llvm.dbg.value(metadata i32 %w, metadata !161, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.value(metadata i32 %h, metadata !163, metadata !DIExpression()), !dbg !162
  %0 = zext i32 %h to i64, !dbg !164
  %1 = zext i32 %w to i64, !dbg !164
  %2 = call i8* @llvm.stacksave(), !dbg !164
  %3 = mul nuw i64 %0, %1, !dbg !164
  %vla = alloca i32, i64 %3, align 16, !dbg !164
  call void @llvm.dbg.value(metadata i64 %0, metadata !165, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.value(metadata i64 %1, metadata !166, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata i32* %vla, metadata !167, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i32 0, metadata !173, metadata !DIExpression()), !dbg !175
  br label %for.cond, !dbg !176

for.cond:                                         ; preds = %for.inc7, %entry
  %x.0 = phi i32 [ 0, %entry ], [ %inc8, %for.inc7 ], !dbg !175
  call void @llvm.dbg.value(metadata i32 %x.0, metadata !173, metadata !DIExpression()), !dbg !175
  %cmp = icmp slt i32 %x.0, %w, !dbg !177
  br i1 %cmp, label %for.body, label %for.end9, !dbg !176

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !179, metadata !DIExpression()), !dbg !181
  br label %for.cond1, !dbg !182

for.cond1:                                        ; preds = %for.inc, %for.body
  %y.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !181
  call void @llvm.dbg.value(metadata i32 %y.0, metadata !179, metadata !DIExpression()), !dbg !181
  %cmp2 = icmp slt i32 %y.0, %h, !dbg !183
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !182

for.body3:                                        ; preds = %for.cond1
  %call = call i32 @rand() #3, !dbg !185
  %cmp4 = icmp slt i32 %call, 214748364, !dbg !186
  %4 = zext i1 %cmp4 to i64, !dbg !185
  %cond = select i1 %cmp4, i32 1, i32 0, !dbg !185
  %idxprom = sext i32 %y.0 to i64, !dbg !187
  %5 = mul nsw i64 %idxprom, %1, !dbg !187
  %arrayidx = getelementptr inbounds i32, i32* %vla, i64 %5, !dbg !187
  %idxprom5 = sext i32 %x.0 to i64, !dbg !187
  %arrayidx6 = getelementptr inbounds i32, i32* %arrayidx, i64 %idxprom5, !dbg !187
  store i32 %cond, i32* %arrayidx6, align 4, !dbg !188
  br label %for.inc, !dbg !187

for.inc:                                          ; preds = %for.body3
  %inc = add nsw i32 %y.0, 1, !dbg !183
  call void @llvm.dbg.value(metadata i32 %inc, metadata !179, metadata !DIExpression()), !dbg !181
  br label %for.cond1, !dbg !183, !llvm.loop !189

for.end:                                          ; preds = %for.cond1
  br label %for.inc7, !dbg !190

for.inc7:                                         ; preds = %for.end
  %inc8 = add nsw i32 %x.0, 1, !dbg !177
  call void @llvm.dbg.value(metadata i32 %inc8, metadata !173, metadata !DIExpression()), !dbg !175
  br label %for.cond, !dbg !177, !llvm.loop !191

for.end9:                                         ; preds = %for.cond
  br label %while.cond, !dbg !193

while.cond:                                       ; preds = %while.body, %for.end9
  br label %while.body, !dbg !193

while.body:                                       ; preds = %while.cond
  %6 = bitcast i32* %vla to i8*, !dbg !194
  call void @show(i8* %6, i32 %w, i32 %h), !dbg !196
  %7 = bitcast i32* %vla to i8*, !dbg !197
  call void @evolve(i8* %7, i32 %w, i32 %h), !dbg !198
  %call10 = call i32 @usleep(i32 200000), !dbg !199
  br label %while.cond, !dbg !193, !llvm.loop !200
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #4

declare dso_local i32 @usleep(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !202 {
entry:
  call void @llvm.dbg.value(metadata i32 %c, metadata !208, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i8** %v, metadata !210, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i32 0, metadata !211, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i32 0, metadata !212, metadata !DIExpression()), !dbg !209
  %cmp = icmp sgt i32 %c, 1, !dbg !213
  br i1 %cmp, label %if.then, label %if.end, !dbg !215

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %v, i64 1, !dbg !216
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !216
  %call = call i32 @atoi(i8* %0) #6, !dbg !217
  call void @llvm.dbg.value(metadata i32 %call, metadata !211, metadata !DIExpression()), !dbg !209
  br label %if.end, !dbg !218

if.end:                                           ; preds = %if.then, %entry
  %w.0 = phi i32 [ %call, %if.then ], [ 0, %entry ], !dbg !209
  call void @llvm.dbg.value(metadata i32 %w.0, metadata !211, metadata !DIExpression()), !dbg !209
  %cmp1 = icmp sgt i32 %c, 2, !dbg !219
  br i1 %cmp1, label %if.then2, label %if.end5, !dbg !221

if.then2:                                         ; preds = %if.end
  %arrayidx3 = getelementptr inbounds i8*, i8** %v, i64 2, !dbg !222
  %1 = load i8*, i8** %arrayidx3, align 8, !dbg !222
  %call4 = call i32 @atoi(i8* %1) #6, !dbg !223
  call void @llvm.dbg.value(metadata i32 %call4, metadata !212, metadata !DIExpression()), !dbg !209
  br label %if.end5, !dbg !224

if.end5:                                          ; preds = %if.then2, %if.end
  %h.0 = phi i32 [ %call4, %if.then2 ], [ 0, %if.end ], !dbg !209
  call void @llvm.dbg.value(metadata i32 %h.0, metadata !212, metadata !DIExpression()), !dbg !209
  %cmp6 = icmp sle i32 %w.0, 0, !dbg !225
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !227

if.then7:                                         ; preds = %if.end5
  call void @llvm.dbg.value(metadata i32 30, metadata !211, metadata !DIExpression()), !dbg !209
  br label %if.end8, !dbg !228

if.end8:                                          ; preds = %if.then7, %if.end5
  %w.1 = phi i32 [ 30, %if.then7 ], [ %w.0, %if.end5 ], !dbg !209
  call void @llvm.dbg.value(metadata i32 %w.1, metadata !211, metadata !DIExpression()), !dbg !209
  %cmp9 = icmp sle i32 %h.0, 0, !dbg !229
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !231

if.then10:                                        ; preds = %if.end8
  call void @llvm.dbg.value(metadata i32 30, metadata !212, metadata !DIExpression()), !dbg !209
  br label %if.end11, !dbg !232

if.end11:                                         ; preds = %if.then10, %if.end8
  %h.1 = phi i32 [ 30, %if.then10 ], [ %h.0, %if.end8 ], !dbg !209
  call void @llvm.dbg.value(metadata i32 %h.1, metadata !212, metadata !DIExpression()), !dbg !209
  call void @game(i32 %w.1, i32 %h.1), !dbg !233
  ret i32 0, !dbg !234
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #5

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!13 = !DILocation(line: 0, scope: !7)
!14 = !DILocalVariable(name: "w", arg: 2, scope: !7, file: !1, line: 8, type: !11)
!15 = !DILocalVariable(name: "h", arg: 3, scope: !7, file: !1, line: 8, type: !11)
!16 = !DILocation(line: 10, column: 2, scope: !7)
!17 = !DILocation(line: 10, column: 19, scope: !7)
!18 = !DILocalVariable(name: "univ", scope: !7, file: !1, line: 10, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: -1)
!23 = !DILocation(line: 11, column: 2, scope: !7)
!24 = !DILocalVariable(name: "y", scope: !25, file: !1, line: 12, type: !11)
!25 = distinct !DILexicalBlock(scope: !7, file: !1, line: 12, column: 2)
!26 = !DILocation(line: 0, scope: !25)
!27 = !DILocation(line: 12, column: 2, scope: !25)
!28 = !DILocation(line: 12, column: 2, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !1, line: 12, column: 2)
!30 = !DILocalVariable(name: "x", scope: !31, file: !1, line: 13, type: !11)
!31 = distinct !DILexicalBlock(scope: !32, file: !1, line: 13, column: 3)
!32 = distinct !DILexicalBlock(scope: !29, file: !1, line: 12, column: 8)
!33 = !DILocation(line: 0, scope: !31)
!34 = !DILocation(line: 13, column: 3, scope: !31)
!35 = !DILocation(line: 13, column: 3, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !1, line: 13, column: 3)
!37 = !DILocation(line: 13, column: 16, scope: !36)
!38 = !DILocation(line: 13, column: 9, scope: !36)
!39 = distinct !{!39, !34, !40}
!40 = !DILocation(line: 13, column: 54, scope: !31)
!41 = !DILocation(line: 14, column: 3, scope: !32)
!42 = !DILocation(line: 15, column: 2, scope: !32)
!43 = distinct !{!43, !27, !44}
!44 = !DILocation(line: 15, column: 2, scope: !25)
!45 = !DILocation(line: 16, column: 9, scope: !7)
!46 = !DILocation(line: 16, column: 2, scope: !7)
!47 = !DILocation(line: 17, column: 1, scope: !7)
!48 = distinct !DISubprogram(name: "evolve", scope: !1, file: !1, line: 19, type: !8, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocalVariable(name: "u", arg: 1, scope: !48, file: !1, line: 19, type: !10)
!50 = !DILocation(line: 0, scope: !48)
!51 = !DILocalVariable(name: "w", arg: 2, scope: !48, file: !1, line: 19, type: !11)
!52 = !DILocalVariable(name: "h", arg: 3, scope: !48, file: !1, line: 19, type: !11)
!53 = !DILocation(line: 21, column: 2, scope: !48)
!54 = !DILocation(line: 21, column: 24, scope: !48)
!55 = !DILocalVariable(name: "univ", scope: !48, file: !1, line: 21, type: !56)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, elements: !21)
!58 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!59 = !DILocation(line: 22, column: 2, scope: !48)
!60 = !DILocalVariable(name: "__vla_expr0", scope: !48, type: !61, flags: DIFlagArtificial)
!61 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!62 = !DILocalVariable(name: "__vla_expr1", scope: !48, type: !61, flags: DIFlagArtificial)
!63 = !DILocalVariable(name: "new", scope: !48, file: !1, line: 22, type: !64)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, elements: !65)
!65 = !{!66, !67}
!66 = !DISubrange(count: !60)
!67 = !DISubrange(count: !62)
!68 = !DILocation(line: 22, column: 11, scope: !48)
!69 = !DILocalVariable(name: "y", scope: !70, file: !1, line: 24, type: !11)
!70 = distinct !DILexicalBlock(scope: !48, file: !1, line: 24, column: 2)
!71 = !DILocation(line: 0, scope: !70)
!72 = !DILocation(line: 24, column: 2, scope: !70)
!73 = !DILocation(line: 24, column: 2, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !1, line: 24, column: 2)
!75 = !DILocalVariable(name: "x", scope: !76, file: !1, line: 24, type: !11)
!76 = distinct !DILexicalBlock(scope: !74, file: !1, line: 24, column: 8)
!77 = !DILocation(line: 0, scope: !76)
!78 = !DILocation(line: 24, column: 8, scope: !76)
!79 = !DILocation(line: 24, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !1, line: 24, column: 8)
!81 = !DILocalVariable(name: "n", scope: !82, file: !1, line: 25, type: !11)
!82 = distinct !DILexicalBlock(scope: !80, file: !1, line: 24, column: 14)
!83 = !DILocation(line: 0, scope: !82)
!84 = !DILocation(line: 26, column: 19, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !1, line: 26, column: 3)
!86 = !DILocalVariable(name: "y1", scope: !85, file: !1, line: 26, type: !11)
!87 = !DILocation(line: 0, scope: !85)
!88 = !DILocation(line: 26, column: 8, scope: !85)
!89 = !DILocation(line: 25, column: 7, scope: !82)
!90 = !DILocation(line: 26, column: 32, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !1, line: 26, column: 3)
!92 = !DILocation(line: 26, column: 27, scope: !91)
!93 = !DILocation(line: 26, column: 3, scope: !85)
!94 = !DILocation(line: 27, column: 20, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !1, line: 27, column: 4)
!96 = !DILocalVariable(name: "x1", scope: !95, file: !1, line: 27, type: !11)
!97 = !DILocation(line: 0, scope: !95)
!98 = !DILocation(line: 27, column: 9, scope: !95)
!99 = !DILocation(line: 27, column: 33, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !1, line: 27, column: 4)
!101 = !DILocation(line: 27, column: 28, scope: !100)
!102 = !DILocation(line: 27, column: 4, scope: !95)
!103 = !DILocation(line: 28, column: 18, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !1, line: 28, column: 9)
!105 = !DILocation(line: 28, column: 23, scope: !104)
!106 = !DILocation(line: 28, column: 9, scope: !104)
!107 = !DILocation(line: 28, column: 32, scope: !104)
!108 = !DILocation(line: 28, column: 37, scope: !104)
!109 = !DILocation(line: 28, column: 9, scope: !100)
!110 = !DILocation(line: 29, column: 7, scope: !104)
!111 = !DILocation(line: 29, column: 6, scope: !104)
!112 = !DILocation(line: 28, column: 40, scope: !104)
!113 = !DILocation(line: 27, column: 40, scope: !100)
!114 = !DILocation(line: 27, column: 4, scope: !100)
!115 = distinct !{!115, !102, !116}
!116 = !DILocation(line: 29, column: 7, scope: !95)
!117 = !DILocation(line: 26, column: 39, scope: !91)
!118 = !DILocation(line: 26, column: 3, scope: !91)
!119 = distinct !{!119, !93, !120}
!120 = !DILocation(line: 29, column: 7, scope: !85)
!121 = !DILocation(line: 31, column: 7, scope: !122)
!122 = distinct !DILexicalBlock(scope: !82, file: !1, line: 31, column: 7)
!123 = !DILocation(line: 31, column: 7, scope: !82)
!124 = !DILocation(line: 31, column: 20, scope: !122)
!125 = !DILocation(line: 31, column: 19, scope: !122)
!126 = !DILocation(line: 32, column: 18, scope: !82)
!127 = !DILocation(line: 32, column: 23, scope: !82)
!128 = !DILocation(line: 32, column: 29, scope: !82)
!129 = !DILocation(line: 32, column: 34, scope: !82)
!130 = !DILocation(line: 32, column: 37, scope: !82)
!131 = !DILocation(line: 32, column: 3, scope: !82)
!132 = !DILocation(line: 32, column: 13, scope: !82)
!133 = !DILocation(line: 33, column: 2, scope: !82)
!134 = distinct !{!134, !78, !135}
!135 = !DILocation(line: 33, column: 2, scope: !76)
!136 = distinct !{!136, !72, !137}
!137 = !DILocation(line: 33, column: 2, scope: !70)
!138 = !DILocalVariable(name: "y", scope: !139, file: !1, line: 34, type: !11)
!139 = distinct !DILexicalBlock(scope: !48, file: !1, line: 34, column: 2)
!140 = !DILocation(line: 0, scope: !139)
!141 = !DILocation(line: 34, column: 2, scope: !139)
!142 = !DILocation(line: 34, column: 2, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !1, line: 34, column: 2)
!144 = !DILocalVariable(name: "x", scope: !145, file: !1, line: 34, type: !11)
!145 = distinct !DILexicalBlock(scope: !143, file: !1, line: 34, column: 8)
!146 = !DILocation(line: 0, scope: !145)
!147 = !DILocation(line: 34, column: 8, scope: !145)
!148 = !DILocation(line: 34, column: 8, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !1, line: 34, column: 8)
!150 = !DILocation(line: 34, column: 27, scope: !149)
!151 = !DILocation(line: 34, column: 14, scope: !149)
!152 = !DILocation(line: 34, column: 25, scope: !149)
!153 = distinct !{!153, !147, !154}
!154 = !DILocation(line: 34, column: 35, scope: !145)
!155 = distinct !{!155, !141, !156}
!156 = !DILocation(line: 34, column: 35, scope: !139)
!157 = !DILocation(line: 35, column: 1, scope: !48)
!158 = distinct !DISubprogram(name: "game", scope: !1, file: !1, line: 37, type: !159, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!159 = !DISubroutineType(types: !160)
!160 = !{null, !11, !11}
!161 = !DILocalVariable(name: "w", arg: 1, scope: !158, file: !1, line: 37, type: !11)
!162 = !DILocation(line: 0, scope: !158)
!163 = !DILocalVariable(name: "h", arg: 2, scope: !158, file: !1, line: 37, type: !11)
!164 = !DILocation(line: 39, column: 2, scope: !158)
!165 = !DILocalVariable(name: "__vla_expr0", scope: !158, type: !61, flags: DIFlagArtificial)
!166 = !DILocalVariable(name: "__vla_expr1", scope: !158, type: !61, flags: DIFlagArtificial)
!167 = !DILocalVariable(name: "univ", scope: !158, file: !1, line: 39, type: !168)
!168 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, elements: !169)
!169 = !{!170, !171}
!170 = !DISubrange(count: !165)
!171 = !DISubrange(count: !166)
!172 = !DILocation(line: 39, column: 11, scope: !158)
!173 = !DILocalVariable(name: "x", scope: !174, file: !1, line: 40, type: !11)
!174 = distinct !DILexicalBlock(scope: !158, file: !1, line: 40, column: 2)
!175 = !DILocation(line: 0, scope: !174)
!176 = !DILocation(line: 40, column: 2, scope: !174)
!177 = !DILocation(line: 40, column: 2, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !1, line: 40, column: 2)
!179 = !DILocalVariable(name: "y", scope: !180, file: !1, line: 40, type: !11)
!180 = distinct !DILexicalBlock(scope: !178, file: !1, line: 40, column: 2)
!181 = !DILocation(line: 0, scope: !180)
!182 = !DILocation(line: 40, column: 2, scope: !180)
!183 = !DILocation(line: 40, column: 2, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !1, line: 40, column: 2)
!185 = !DILocation(line: 40, column: 22, scope: !184)
!186 = !DILocation(line: 40, column: 29, scope: !184)
!187 = !DILocation(line: 40, column: 9, scope: !184)
!188 = !DILocation(line: 40, column: 20, scope: !184)
!189 = distinct !{!189, !182, !190}
!190 = !DILocation(line: 40, column: 51, scope: !180)
!191 = distinct !{!191, !176, !192}
!192 = !DILocation(line: 40, column: 51, scope: !174)
!193 = !DILocation(line: 41, column: 2, scope: !158)
!194 = !DILocation(line: 42, column: 8, scope: !195)
!195 = distinct !DILexicalBlock(scope: !158, file: !1, line: 41, column: 12)
!196 = !DILocation(line: 42, column: 3, scope: !195)
!197 = !DILocation(line: 43, column: 10, scope: !195)
!198 = !DILocation(line: 43, column: 3, scope: !195)
!199 = !DILocation(line: 44, column: 3, scope: !195)
!200 = distinct !{!200, !193, !201}
!201 = !DILocation(line: 45, column: 2, scope: !158)
!202 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 48, type: !203, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!203 = !DISubroutineType(types: !204)
!204 = !{!11, !11, !205}
!205 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !206, size: 64)
!206 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !207, size: 64)
!207 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!208 = !DILocalVariable(name: "c", arg: 1, scope: !202, file: !1, line: 48, type: !11)
!209 = !DILocation(line: 0, scope: !202)
!210 = !DILocalVariable(name: "v", arg: 2, scope: !202, file: !1, line: 48, type: !205)
!211 = !DILocalVariable(name: "w", scope: !202, file: !1, line: 50, type: !11)
!212 = !DILocalVariable(name: "h", scope: !202, file: !1, line: 50, type: !11)
!213 = !DILocation(line: 51, column: 8, scope: !214)
!214 = distinct !DILexicalBlock(scope: !202, file: !1, line: 51, column: 6)
!215 = !DILocation(line: 51, column: 6, scope: !202)
!216 = !DILocation(line: 51, column: 22, scope: !214)
!217 = !DILocation(line: 51, column: 17, scope: !214)
!218 = !DILocation(line: 51, column: 13, scope: !214)
!219 = !DILocation(line: 52, column: 8, scope: !220)
!220 = distinct !DILexicalBlock(scope: !202, file: !1, line: 52, column: 6)
!221 = !DILocation(line: 52, column: 6, scope: !202)
!222 = !DILocation(line: 52, column: 22, scope: !220)
!223 = !DILocation(line: 52, column: 17, scope: !220)
!224 = !DILocation(line: 52, column: 13, scope: !220)
!225 = !DILocation(line: 53, column: 8, scope: !226)
!226 = distinct !DILexicalBlock(scope: !202, file: !1, line: 53, column: 6)
!227 = !DILocation(line: 53, column: 6, scope: !202)
!228 = !DILocation(line: 53, column: 14, scope: !226)
!229 = !DILocation(line: 54, column: 8, scope: !230)
!230 = distinct !DILexicalBlock(scope: !202, file: !1, line: 54, column: 6)
!231 = !DILocation(line: 54, column: 6, scope: !202)
!232 = !DILocation(line: 54, column: 14, scope: !230)
!233 = !DILocation(line: 55, column: 2, scope: !202)
!234 = !DILocation(line: 56, column: 1, scope: !202)
