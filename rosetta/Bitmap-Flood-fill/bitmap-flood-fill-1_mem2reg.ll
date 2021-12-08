; ModuleID = 'bitmap-flood-fill-1.ll'
source_filename = "bitmap-flood-fill-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@height = internal global i32 0, align 4, !dbg !0
@width = internal global i32 0, align 4, !dbg !6
@bitmap = internal global [2048 x [2048 x i8]] zeroinitializer, align 16, !dbg !9
@oldColor = internal global i8 0, align 1, !dbg !15
@newColor = internal global i8 0, align 1, !dbg !17
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%1d\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"P1\0A\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@stdin = external dso_local global %struct._IO_FILE*, align 8
@stdout = external dso_local global %struct._IO_FILE*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @floodFill(i32 %i, i32 %j) #0 !dbg !23 {
entry:
  call void @llvm.dbg.value(metadata i32 %i, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.value(metadata i32 %j, metadata !28, metadata !DIExpression()), !dbg !27
  %cmp = icmp sle i32 0, %i, !dbg !29
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !31

land.lhs.true:                                    ; preds = %entry
  %0 = load i32, i32* @height, align 4, !dbg !32
  %cmp1 = icmp slt i32 %i, %0, !dbg !33
  br i1 %cmp1, label %land.lhs.true2, label %if.end, !dbg !34

land.lhs.true2:                                   ; preds = %land.lhs.true
  %cmp3 = icmp sle i32 0, %j, !dbg !35
  br i1 %cmp3, label %land.lhs.true4, label %if.end, !dbg !36

land.lhs.true4:                                   ; preds = %land.lhs.true2
  %1 = load i32, i32* @width, align 4, !dbg !37
  %cmp5 = icmp slt i32 %j, %1, !dbg !38
  br i1 %cmp5, label %land.lhs.true6, label %if.end, !dbg !39

land.lhs.true6:                                   ; preds = %land.lhs.true4
  %idxprom = sext i32 %i to i64, !dbg !40
  %arrayidx = getelementptr inbounds [2048 x [2048 x i8]], [2048 x [2048 x i8]]* @bitmap, i64 0, i64 %idxprom, !dbg !40
  %idxprom7 = sext i32 %j to i64, !dbg !40
  %arrayidx8 = getelementptr inbounds [2048 x i8], [2048 x i8]* %arrayidx, i64 0, i64 %idxprom7, !dbg !40
  %2 = load i8, i8* %arrayidx8, align 1, !dbg !40
  %conv = zext i8 %2 to i32, !dbg !40
  %3 = load i8, i8* @oldColor, align 1, !dbg !41
  %conv9 = zext i8 %3 to i32, !dbg !41
  %cmp10 = icmp eq i32 %conv, %conv9, !dbg !42
  br i1 %cmp10, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %land.lhs.true6
  %4 = load i8, i8* @newColor, align 1, !dbg !44
  %idxprom12 = sext i32 %i to i64, !dbg !46
  %arrayidx13 = getelementptr inbounds [2048 x [2048 x i8]], [2048 x [2048 x i8]]* @bitmap, i64 0, i64 %idxprom12, !dbg !46
  %idxprom14 = sext i32 %j to i64, !dbg !46
  %arrayidx15 = getelementptr inbounds [2048 x i8], [2048 x i8]* %arrayidx13, i64 0, i64 %idxprom14, !dbg !46
  store i8 %4, i8* %arrayidx15, align 1, !dbg !47
  %sub = sub nsw i32 %i, 1, !dbg !48
  call void @floodFill(i32 %sub, i32 %j), !dbg !49
  %add = add nsw i32 %i, 1, !dbg !50
  call void @floodFill(i32 %add, i32 %j), !dbg !51
  %sub16 = sub nsw i32 %j, 1, !dbg !52
  call void @floodFill(i32 %i, i32 %sub16), !dbg !53
  %add17 = add nsw i32 %j, 1, !dbg !54
  call void @floodFill(i32 %i, i32 %add17), !dbg !55
  br label %if.end, !dbg !56

if.end:                                           ; preds = %if.then, %land.lhs.true6, %land.lhs.true4, %land.lhs.true2, %land.lhs.true, %entry
  ret void, !dbg !57
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @skipLine(%struct._IO_FILE* %file) #0 !dbg !58 {
entry:
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %file, metadata !123, metadata !DIExpression()), !dbg !124
  br label %while.cond, !dbg !125

while.cond:                                       ; preds = %while.body, %entry
  %call = call i32 @ferror(%struct._IO_FILE* %file) #5, !dbg !126
  %tobool = icmp ne i32 %call, 0, !dbg !126
  br i1 %tobool, label %land.end, label %land.lhs.true, !dbg !127

land.lhs.true:                                    ; preds = %while.cond
  %call1 = call i32 @feof(%struct._IO_FILE* %file) #5, !dbg !128
  %tobool2 = icmp ne i32 %call1, 0, !dbg !128
  br i1 %tobool2, label %land.end, label %land.rhs, !dbg !129

land.rhs:                                         ; preds = %land.lhs.true
  %call3 = call i32 @fgetc(%struct._IO_FILE* %file), !dbg !130
  %cmp = icmp ne i32 %call3, 10, !dbg !131
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %while.cond
  %0 = phi i1 [ false, %land.lhs.true ], [ false, %while.cond ], [ %cmp, %land.rhs ], !dbg !124
  br i1 %0, label %while.body, label %while.end, !dbg !125

while.body:                                       ; preds = %land.end
  br label %while.cond, !dbg !125, !llvm.loop !132

while.end:                                        ; preds = %land.end
  ret void, !dbg !134
}

; Function Attrs: nounwind
declare dso_local i32 @ferror(%struct._IO_FILE*) #2

; Function Attrs: nounwind
declare dso_local i32 @feof(%struct._IO_FILE*) #2

declare dso_local i32 @fgetc(%struct._IO_FILE*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @skipCommentLines(%struct._IO_FILE* %file) #0 !dbg !135 {
entry:
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %file, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata i32 35, metadata !138, metadata !DIExpression()), !dbg !137
  br label %while.cond, !dbg !139

while.cond:                                       ; preds = %while.body, %entry
  %call = call i32 @fgetc(%struct._IO_FILE* %file), !dbg !140
  call void @llvm.dbg.value(metadata i32 %call, metadata !141, metadata !DIExpression()), !dbg !137
  %cmp = icmp eq i32 %call, 35, !dbg !142
  br i1 %cmp, label %while.body, label %while.end, !dbg !139

while.body:                                       ; preds = %while.cond
  call void @skipLine(%struct._IO_FILE* %file), !dbg !143
  br label %while.cond, !dbg !139, !llvm.loop !144

while.end:                                        ; preds = %while.cond
  %call1 = call i32 @ungetc(i32 %call, %struct._IO_FILE* %file), !dbg !146
  ret void, !dbg !147
}

declare dso_local i32 @ungetc(i32, %struct._IO_FILE*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @readPortableBitMap(%struct._IO_FILE* %file) #0 !dbg !148 {
entry:
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %file, metadata !151, metadata !DIExpression()), !dbg !152
  call void @skipLine(%struct._IO_FILE* %file), !dbg !153
  call void @skipCommentLines(%struct._IO_FILE* %file), !dbg !154
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* @width), !dbg !155
  call void @skipCommentLines(%struct._IO_FILE* %file), !dbg !156
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* @height), !dbg !157
  call void @skipCommentLines(%struct._IO_FILE* %file), !dbg !158
  %0 = load i32, i32* @width, align 4, !dbg !159
  %cmp = icmp sle i32 %0, 2048, !dbg !161
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !162

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @height, align 4, !dbg !163
  %cmp2 = icmp sle i32 %1, 2048, !dbg !164
  br i1 %cmp2, label %if.then, label %if.else, !dbg !165

if.then:                                          ; preds = %land.lhs.true
  call void @llvm.dbg.value(metadata i32 0, metadata !166, metadata !DIExpression()), !dbg !152
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc10, %if.then
  %i.0 = phi i32 [ 0, %if.then ], [ %inc11, %for.inc10 ], !dbg !169
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !166, metadata !DIExpression()), !dbg !152
  %2 = load i32, i32* @height, align 4, !dbg !170
  %cmp3 = icmp slt i32 %i.0, %2, !dbg !172
  br i1 %cmp3, label %for.body, label %for.end12, !dbg !173

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !174, metadata !DIExpression()), !dbg !152
  br label %for.cond4, !dbg !175

for.cond4:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !177
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !174, metadata !DIExpression()), !dbg !152
  %3 = load i32, i32* @width, align 4, !dbg !178
  %cmp5 = icmp slt i32 %j.0, %3, !dbg !180
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !181

for.body6:                                        ; preds = %for.cond4
  %idxprom = sext i32 %i.0 to i64, !dbg !182
  %arrayidx = getelementptr inbounds [2048 x [2048 x i8]], [2048 x [2048 x i8]]* @bitmap, i64 0, i64 %idxprom, !dbg !182
  %idxprom7 = sext i32 %j.0 to i64, !dbg !182
  %arrayidx8 = getelementptr inbounds [2048 x i8], [2048 x i8]* %arrayidx, i64 0, i64 %idxprom7, !dbg !182
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8* %arrayidx8), !dbg !183
  br label %for.inc, !dbg !183

for.inc:                                          ; preds = %for.body6
  %inc = add nsw i32 %j.0, 1, !dbg !184
  call void @llvm.dbg.value(metadata i32 %inc, metadata !174, metadata !DIExpression()), !dbg !152
  br label %for.cond4, !dbg !185, !llvm.loop !186

for.end:                                          ; preds = %for.cond4
  br label %for.inc10, !dbg !187

for.inc10:                                        ; preds = %for.end
  %inc11 = add nsw i32 %i.0, 1, !dbg !188
  call void @llvm.dbg.value(metadata i32 %inc11, metadata !166, metadata !DIExpression()), !dbg !152
  br label %for.cond, !dbg !189, !llvm.loop !190

for.end12:                                        ; preds = %for.cond
  br label %if.end, !dbg !191

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @exit(i32 1) #6, !dbg !192
  unreachable, !dbg !192

if.end:                                           ; preds = %for.end12
  ret i32 undef, !dbg !193
}

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @writePortableBitMap(%struct._IO_FILE* %file) #0 !dbg !194 {
entry:
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %file, metadata !195, metadata !DIExpression()), !dbg !196
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0)), !dbg !197
  %0 = load i32, i32* @width, align 4, !dbg !198
  %1 = load i32, i32* @height, align 4, !dbg !199
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0), i32 %0, i32 %1), !dbg !200
  call void @llvm.dbg.value(metadata i32 0, metadata !201, metadata !DIExpression()), !dbg !196
  br label %for.cond, !dbg !202

for.cond:                                         ; preds = %for.inc9, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc10, %for.inc9 ], !dbg !204
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !201, metadata !DIExpression()), !dbg !196
  %2 = load i32, i32* @height, align 4, !dbg !205
  %cmp = icmp slt i32 %i.0, %2, !dbg !207
  br i1 %cmp, label %for.body, label %for.end11, !dbg !208

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !209, metadata !DIExpression()), !dbg !196
  br label %for.cond2, !dbg !210

for.cond2:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !213
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !209, metadata !DIExpression()), !dbg !196
  %3 = load i32, i32* @width, align 4, !dbg !214
  %cmp3 = icmp slt i32 %j.0, %3, !dbg !216
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !217

for.body4:                                        ; preds = %for.cond2
  %idxprom = sext i32 %i.0 to i64, !dbg !218
  %arrayidx = getelementptr inbounds [2048 x [2048 x i8]], [2048 x [2048 x i8]]* @bitmap, i64 0, i64 %idxprom, !dbg !218
  %idxprom5 = sext i32 %j.0 to i64, !dbg !218
  %arrayidx6 = getelementptr inbounds [2048 x i8], [2048 x i8]* %arrayidx, i64 0, i64 %idxprom5, !dbg !218
  %4 = load i8, i8* %arrayidx6, align 1, !dbg !218
  %conv = zext i8 %4 to i32, !dbg !218
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %conv), !dbg !219
  br label %for.inc, !dbg !219

for.inc:                                          ; preds = %for.body4
  %inc = add nsw i32 %j.0, 1, !dbg !220
  call void @llvm.dbg.value(metadata i32 %inc, metadata !209, metadata !DIExpression()), !dbg !196
  br label %for.cond2, !dbg !221, !llvm.loop !222

for.end:                                          ; preds = %for.cond2
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0)), !dbg !224
  br label %for.inc9, !dbg !225

for.inc9:                                         ; preds = %for.end
  %inc10 = add nsw i32 %i.0, 1, !dbg !226
  call void @llvm.dbg.value(metadata i32 %inc10, metadata !201, metadata !DIExpression()), !dbg !196
  br label %for.cond, !dbg !227, !llvm.loop !228

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !230
}

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !231 {
entry:
  store i8 1, i8* @oldColor, align 1, !dbg !234
  %0 = load i8, i8* @oldColor, align 1, !dbg !235
  %conv = zext i8 %0 to i32, !dbg !235
  %tobool = icmp ne i32 %conv, 0, !dbg !235
  %1 = zext i1 %tobool to i64, !dbg !235
  %cond = select i1 %tobool, i32 0, i32 1, !dbg !235
  %conv1 = trunc i32 %cond to i8, !dbg !235
  store i8 %conv1, i8* @newColor, align 1, !dbg !236
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !237
  %call = call i32 @readPortableBitMap(%struct._IO_FILE* %2), !dbg !238
  %3 = load i32, i32* @height, align 4, !dbg !239
  %div = sdiv i32 %3, 2, !dbg !240
  %4 = load i32, i32* @width, align 4, !dbg !241
  %div2 = sdiv i32 %4, 2, !dbg !242
  call void @floodFill(i32 %div, i32 %div2), !dbg !243
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !244
  call void @writePortableBitMap(%struct._IO_FILE* %5), !dbg !245
  ret i32 0, !dbg !246
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "height", scope: !2, file: !3, line: 27, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "bitmap-flood-fill-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Bitmap-Flood-fill")
!4 = !{}
!5 = !{!6, !0, !9, !15, !17}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "width", scope: !2, file: !3, line: 27, type: !8, isLocal: true, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "bitmap", scope: !2, file: !3, line: 28, type: !11, isLocal: true, isDefinition: true)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 33554432, elements: !13)
!12 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!13 = !{!14, !14}
!14 = !DISubrange(count: 2048)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "oldColor", scope: !2, file: !3, line: 29, type: !12, isLocal: true, isDefinition: true)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "newColor", scope: !2, file: !3, line: 30, type: !12, isLocal: true, isDefinition: true)
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!23 = distinct !DISubprogram(name: "floodFill", scope: !3, file: !3, line: 32, type: !24, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !8, !8}
!26 = !DILocalVariable(name: "i", arg: 1, scope: !23, file: !3, line: 32, type: !8)
!27 = !DILocation(line: 0, scope: !23)
!28 = !DILocalVariable(name: "j", arg: 2, scope: !23, file: !3, line: 32, type: !8)
!29 = !DILocation(line: 34, column: 12, scope: !30)
!30 = distinct !DILexicalBlock(scope: !23, file: !3, line: 34, column: 10)
!31 = !DILocation(line: 34, column: 17, scope: !30)
!32 = !DILocation(line: 34, column: 24, scope: !30)
!33 = !DILocation(line: 34, column: 22, scope: !30)
!34 = !DILocation(line: 35, column: 5, scope: !30)
!35 = !DILocation(line: 35, column: 12, scope: !30)
!36 = !DILocation(line: 35, column: 17, scope: !30)
!37 = !DILocation(line: 35, column: 24, scope: !30)
!38 = !DILocation(line: 35, column: 22, scope: !30)
!39 = !DILocation(line: 36, column: 5, scope: !30)
!40 = !DILocation(line: 36, column: 10, scope: !30)
!41 = !DILocation(line: 36, column: 26, scope: !30)
!42 = !DILocation(line: 36, column: 23, scope: !30)
!43 = !DILocation(line: 34, column: 10, scope: !23)
!44 = !DILocation(line: 38, column: 24, scope: !45)
!45 = distinct !DILexicalBlock(scope: !30, file: !3, line: 37, column: 5)
!46 = !DILocation(line: 38, column: 9, scope: !45)
!47 = !DILocation(line: 38, column: 22, scope: !45)
!48 = !DILocation(line: 39, column: 20, scope: !45)
!49 = !DILocation(line: 39, column: 9, scope: !45)
!50 = !DILocation(line: 40, column: 20, scope: !45)
!51 = !DILocation(line: 40, column: 9, scope: !45)
!52 = !DILocation(line: 41, column: 22, scope: !45)
!53 = !DILocation(line: 41, column: 9, scope: !45)
!54 = !DILocation(line: 42, column: 22, scope: !45)
!55 = !DILocation(line: 42, column: 9, scope: !45)
!56 = !DILocation(line: 43, column: 5, scope: !45)
!57 = !DILocation(line: 44, column: 1, scope: !23)
!58 = distinct !DISubprogram(name: "skipLine", scope: !3, file: !3, line: 50, type: !59, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{null, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !63, line: 7, baseType: !64)
!63 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!64 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !65, line: 49, size: 1728, elements: !66)
!65 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!66 = !{!67, !68, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !84, !86, !87, !88, !92, !94, !96, !100, !103, !105, !108, !111, !112, !114, !118, !119}
!67 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !64, file: !65, line: 51, baseType: !8, size: 32)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !64, file: !65, line: 54, baseType: !69, size: 64, offset: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !64, file: !65, line: 55, baseType: !69, size: 64, offset: 128)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !64, file: !65, line: 56, baseType: !69, size: 64, offset: 192)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !64, file: !65, line: 57, baseType: !69, size: 64, offset: 256)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !64, file: !65, line: 58, baseType: !69, size: 64, offset: 320)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !64, file: !65, line: 59, baseType: !69, size: 64, offset: 384)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !64, file: !65, line: 60, baseType: !69, size: 64, offset: 448)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !64, file: !65, line: 61, baseType: !69, size: 64, offset: 512)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !64, file: !65, line: 64, baseType: !69, size: 64, offset: 576)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !64, file: !65, line: 65, baseType: !69, size: 64, offset: 640)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !64, file: !65, line: 66, baseType: !69, size: 64, offset: 704)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !64, file: !65, line: 68, baseType: !82, size: 64, offset: 768)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !65, line: 36, flags: DIFlagFwdDecl)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !64, file: !65, line: 70, baseType: !85, size: 64, offset: 832)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !64, file: !65, line: 72, baseType: !8, size: 32, offset: 896)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !64, file: !65, line: 73, baseType: !8, size: 32, offset: 928)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !64, file: !65, line: 74, baseType: !89, size: 64, offset: 960)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !90, line: 152, baseType: !91)
!90 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!91 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !64, file: !65, line: 77, baseType: !93, size: 16, offset: 1024)
!93 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !64, file: !65, line: 78, baseType: !95, size: 8, offset: 1040)
!95 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !64, file: !65, line: 79, baseType: !97, size: 8, offset: 1048)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 8, elements: !98)
!98 = !{!99}
!99 = !DISubrange(count: 1)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !64, file: !65, line: 81, baseType: !101, size: 64, offset: 1088)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !65, line: 43, baseType: null)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !64, file: !65, line: 89, baseType: !104, size: 64, offset: 1152)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !90, line: 153, baseType: !91)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !64, file: !65, line: 91, baseType: !106, size: 64, offset: 1216)
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!107 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !65, line: 37, flags: DIFlagFwdDecl)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !64, file: !65, line: 92, baseType: !109, size: 64, offset: 1280)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !65, line: 38, flags: DIFlagFwdDecl)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !64, file: !65, line: 93, baseType: !85, size: 64, offset: 1344)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !64, file: !65, line: 94, baseType: !113, size: 64, offset: 1408)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !64, file: !65, line: 95, baseType: !115, size: 64, offset: 1472)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !116, line: 46, baseType: !117)
!116 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!117 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !64, file: !65, line: 96, baseType: !8, size: 32, offset: 1536)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !64, file: !65, line: 98, baseType: !120, size: 160, offset: 1568)
!120 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 160, elements: !121)
!121 = !{!122}
!122 = !DISubrange(count: 20)
!123 = !DILocalVariable(name: "file", arg: 1, scope: !58, file: !3, line: 50, type: !61)
!124 = !DILocation(line: 0, scope: !58)
!125 = !DILocation(line: 52, column: 5, scope: !58)
!126 = !DILocation(line: 52, column: 12, scope: !58)
!127 = !DILocation(line: 52, column: 25, scope: !58)
!128 = !DILocation(line: 52, column: 29, scope: !58)
!129 = !DILocation(line: 52, column: 40, scope: !58)
!130 = !DILocation(line: 52, column: 43, scope: !58)
!131 = !DILocation(line: 52, column: 55, scope: !58)
!132 = distinct !{!132, !125, !133}
!133 = !DILocation(line: 53, column: 9, scope: !58)
!134 = !DILocation(line: 54, column: 1, scope: !58)
!135 = distinct !DISubprogram(name: "skipCommentLines", scope: !3, file: !3, line: 56, type: !59, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!136 = !DILocalVariable(name: "file", arg: 1, scope: !135, file: !3, line: 56, type: !61)
!137 = !DILocation(line: 0, scope: !135)
!138 = !DILocalVariable(name: "comment", scope: !135, file: !3, line: 59, type: !8)
!139 = !DILocation(line: 61, column: 5, scope: !135)
!140 = !DILocation(line: 61, column: 17, scope: !135)
!141 = !DILocalVariable(name: "c", scope: !135, file: !3, line: 58, type: !8)
!142 = !DILocation(line: 61, column: 30, scope: !135)
!143 = !DILocation(line: 62, column: 9, scope: !135)
!144 = distinct !{!144, !139, !145}
!145 = !DILocation(line: 62, column: 22, scope: !135)
!146 = !DILocation(line: 63, column: 5, scope: !135)
!147 = !DILocation(line: 64, column: 1, scope: !135)
!148 = distinct !DISubprogram(name: "readPortableBitMap", scope: !3, file: !3, line: 66, type: !149, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!149 = !DISubroutineType(types: !150)
!150 = !{!8, !61}
!151 = !DILocalVariable(name: "file", arg: 1, scope: !148, file: !3, line: 66, type: !61)
!152 = !DILocation(line: 0, scope: !148)
!153 = !DILocation(line: 70, column: 5, scope: !148)
!154 = !DILocation(line: 71, column: 5, scope: !148)
!155 = !DILocation(line: 71, column: 30, scope: !148)
!156 = !DILocation(line: 72, column: 5, scope: !148)
!157 = !DILocation(line: 72, column: 30, scope: !148)
!158 = !DILocation(line: 73, column: 5, scope: !148)
!159 = !DILocation(line: 75, column: 10, scope: !160)
!160 = distinct !DILexicalBlock(scope: !148, file: !3, line: 75, column: 10)
!161 = !DILocation(line: 75, column: 16, scope: !160)
!162 = !DILocation(line: 75, column: 27, scope: !160)
!163 = !DILocation(line: 75, column: 30, scope: !160)
!164 = !DILocation(line: 75, column: 37, scope: !160)
!165 = !DILocation(line: 75, column: 10, scope: !148)
!166 = !DILocalVariable(name: "i", scope: !148, file: !3, line: 68, type: !8)
!167 = !DILocation(line: 76, column: 15, scope: !168)
!168 = distinct !DILexicalBlock(scope: !160, file: !3, line: 76, column: 9)
!169 = !DILocation(line: 0, scope: !168)
!170 = !DILocation(line: 76, column: 26, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !3, line: 76, column: 9)
!172 = !DILocation(line: 76, column: 24, scope: !171)
!173 = !DILocation(line: 76, column: 9, scope: !168)
!174 = !DILocalVariable(name: "j", scope: !148, file: !3, line: 68, type: !8)
!175 = !DILocation(line: 77, column: 19, scope: !176)
!176 = distinct !DILexicalBlock(scope: !171, file: !3, line: 77, column: 13)
!177 = !DILocation(line: 0, scope: !176)
!178 = !DILocation(line: 77, column: 30, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !3, line: 77, column: 13)
!180 = !DILocation(line: 77, column: 28, scope: !179)
!181 = !DILocation(line: 77, column: 13, scope: !176)
!182 = !DILocation(line: 78, column: 37, scope: !179)
!183 = !DILocation(line: 78, column: 17, scope: !179)
!184 = !DILocation(line: 77, column: 38, scope: !179)
!185 = !DILocation(line: 77, column: 13, scope: !179)
!186 = distinct !{!186, !181, !187}
!187 = !DILocation(line: 78, column: 50, scope: !176)
!188 = !DILocation(line: 76, column: 35, scope: !171)
!189 = !DILocation(line: 76, column: 9, scope: !171)
!190 = distinct !{!190, !173, !191}
!191 = !DILocation(line: 78, column: 50, scope: !168)
!192 = !DILocation(line: 79, column: 10, scope: !160)
!193 = !DILocation(line: 80, column: 1, scope: !148)
!194 = distinct !DISubprogram(name: "writePortableBitMap", scope: !3, file: !3, line: 82, type: !59, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!195 = !DILocalVariable(name: "file", arg: 1, scope: !194, file: !3, line: 82, type: !61)
!196 = !DILocation(line: 0, scope: !194)
!197 = !DILocation(line: 85, column: 5, scope: !194)
!198 = !DILocation(line: 86, column: 29, scope: !194)
!199 = !DILocation(line: 86, column: 36, scope: !194)
!200 = !DILocation(line: 86, column: 5, scope: !194)
!201 = !DILocalVariable(name: "i", scope: !194, file: !3, line: 84, type: !8)
!202 = !DILocation(line: 87, column: 11, scope: !203)
!203 = distinct !DILexicalBlock(scope: !194, file: !3, line: 87, column: 5)
!204 = !DILocation(line: 0, scope: !203)
!205 = !DILocation(line: 87, column: 22, scope: !206)
!206 = distinct !DILexicalBlock(scope: !203, file: !3, line: 87, column: 5)
!207 = !DILocation(line: 87, column: 20, scope: !206)
!208 = !DILocation(line: 87, column: 5, scope: !203)
!209 = !DILocalVariable(name: "j", scope: !194, file: !3, line: 84, type: !8)
!210 = !DILocation(line: 89, column: 15, scope: !211)
!211 = distinct !DILexicalBlock(scope: !212, file: !3, line: 89, column: 9)
!212 = distinct !DILexicalBlock(scope: !206, file: !3, line: 88, column: 5)
!213 = !DILocation(line: 0, scope: !211)
!214 = !DILocation(line: 89, column: 26, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !3, line: 89, column: 9)
!216 = !DILocation(line: 89, column: 24, scope: !215)
!217 = !DILocation(line: 89, column: 9, scope: !211)
!218 = !DILocation(line: 90, column: 33, scope: !215)
!219 = !DILocation(line: 90, column: 13, scope: !215)
!220 = !DILocation(line: 89, column: 34, scope: !215)
!221 = !DILocation(line: 89, column: 9, scope: !215)
!222 = distinct !{!222, !217, !223}
!223 = !DILocation(line: 90, column: 45, scope: !211)
!224 = !DILocation(line: 91, column: 9, scope: !212)
!225 = !DILocation(line: 92, column: 5, scope: !212)
!226 = !DILocation(line: 87, column: 31, scope: !206)
!227 = !DILocation(line: 87, column: 5, scope: !206)
!228 = distinct !{!228, !208, !229}
!229 = !DILocation(line: 92, column: 5, scope: !203)
!230 = !DILocation(line: 93, column: 1, scope: !194)
!231 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 99, type: !232, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!232 = !DISubroutineType(types: !233)
!233 = !{!8}
!234 = !DILocation(line: 101, column: 14, scope: !231)
!235 = !DILocation(line: 102, column: 16, scope: !231)
!236 = !DILocation(line: 102, column: 14, scope: !231)
!237 = !DILocation(line: 103, column: 24, scope: !231)
!238 = !DILocation(line: 103, column: 5, scope: !231)
!239 = !DILocation(line: 104, column: 15, scope: !231)
!240 = !DILocation(line: 104, column: 21, scope: !231)
!241 = !DILocation(line: 104, column: 24, scope: !231)
!242 = !DILocation(line: 104, column: 29, scope: !231)
!243 = !DILocation(line: 104, column: 5, scope: !231)
!244 = !DILocation(line: 105, column: 25, scope: !231)
!245 = !DILocation(line: 105, column: 5, scope: !231)
!246 = !DILocation(line: 106, column: 5, scope: !231)
