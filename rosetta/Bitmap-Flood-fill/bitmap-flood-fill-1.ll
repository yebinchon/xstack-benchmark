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
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 %j, i32* %j.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %j.addr, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = load i32, i32* %i.addr, align 4, !dbg !30
  %cmp = icmp sle i32 0, %0, !dbg !32
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !33

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %i.addr, align 4, !dbg !34
  %2 = load i32, i32* @height, align 4, !dbg !35
  %cmp1 = icmp slt i32 %1, %2, !dbg !36
  br i1 %cmp1, label %land.lhs.true2, label %if.end, !dbg !37

land.lhs.true2:                                   ; preds = %land.lhs.true
  %3 = load i32, i32* %j.addr, align 4, !dbg !38
  %cmp3 = icmp sle i32 0, %3, !dbg !39
  br i1 %cmp3, label %land.lhs.true4, label %if.end, !dbg !40

land.lhs.true4:                                   ; preds = %land.lhs.true2
  %4 = load i32, i32* %j.addr, align 4, !dbg !41
  %5 = load i32, i32* @width, align 4, !dbg !42
  %cmp5 = icmp slt i32 %4, %5, !dbg !43
  br i1 %cmp5, label %land.lhs.true6, label %if.end, !dbg !44

land.lhs.true6:                                   ; preds = %land.lhs.true4
  %6 = load i32, i32* %i.addr, align 4, !dbg !45
  %idxprom = sext i32 %6 to i64, !dbg !46
  %arrayidx = getelementptr inbounds [2048 x [2048 x i8]], [2048 x [2048 x i8]]* @bitmap, i64 0, i64 %idxprom, !dbg !46
  %7 = load i32, i32* %j.addr, align 4, !dbg !47
  %idxprom7 = sext i32 %7 to i64, !dbg !46
  %arrayidx8 = getelementptr inbounds [2048 x i8], [2048 x i8]* %arrayidx, i64 0, i64 %idxprom7, !dbg !46
  %8 = load i8, i8* %arrayidx8, align 1, !dbg !46
  %conv = zext i8 %8 to i32, !dbg !46
  %9 = load i8, i8* @oldColor, align 1, !dbg !48
  %conv9 = zext i8 %9 to i32, !dbg !48
  %cmp10 = icmp eq i32 %conv, %conv9, !dbg !49
  br i1 %cmp10, label %if.then, label %if.end, !dbg !50

if.then:                                          ; preds = %land.lhs.true6
  %10 = load i8, i8* @newColor, align 1, !dbg !51
  %11 = load i32, i32* %i.addr, align 4, !dbg !53
  %idxprom12 = sext i32 %11 to i64, !dbg !54
  %arrayidx13 = getelementptr inbounds [2048 x [2048 x i8]], [2048 x [2048 x i8]]* @bitmap, i64 0, i64 %idxprom12, !dbg !54
  %12 = load i32, i32* %j.addr, align 4, !dbg !55
  %idxprom14 = sext i32 %12 to i64, !dbg !54
  %arrayidx15 = getelementptr inbounds [2048 x i8], [2048 x i8]* %arrayidx13, i64 0, i64 %idxprom14, !dbg !54
  store i8 %10, i8* %arrayidx15, align 1, !dbg !56
  %13 = load i32, i32* %i.addr, align 4, !dbg !57
  %sub = sub nsw i32 %13, 1, !dbg !58
  %14 = load i32, i32* %j.addr, align 4, !dbg !59
  call void @floodFill(i32 %sub, i32 %14), !dbg !60
  %15 = load i32, i32* %i.addr, align 4, !dbg !61
  %add = add nsw i32 %15, 1, !dbg !62
  %16 = load i32, i32* %j.addr, align 4, !dbg !63
  call void @floodFill(i32 %add, i32 %16), !dbg !64
  %17 = load i32, i32* %i.addr, align 4, !dbg !65
  %18 = load i32, i32* %j.addr, align 4, !dbg !66
  %sub16 = sub nsw i32 %18, 1, !dbg !67
  call void @floodFill(i32 %17, i32 %sub16), !dbg !68
  %19 = load i32, i32* %i.addr, align 4, !dbg !69
  %20 = load i32, i32* %j.addr, align 4, !dbg !70
  %add17 = add nsw i32 %20, 1, !dbg !71
  call void @floodFill(i32 %19, i32 %add17), !dbg !72
  br label %if.end, !dbg !73

if.end:                                           ; preds = %if.then, %land.lhs.true6, %land.lhs.true4, %land.lhs.true2, %land.lhs.true, %entry
  ret void, !dbg !74
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @skipLine(%struct._IO_FILE* %file) #0 !dbg !75 {
entry:
  %file.addr = alloca %struct._IO_FILE*, align 8
  store %struct._IO_FILE* %file, %struct._IO_FILE** %file.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %file.addr, metadata !140, metadata !DIExpression()), !dbg !141
  br label %while.cond, !dbg !142

while.cond:                                       ; preds = %while.body, %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %file.addr, align 8, !dbg !143
  %call = call i32 @ferror(%struct._IO_FILE* %0) #5, !dbg !144
  %tobool = icmp ne i32 %call, 0, !dbg !144
  br i1 %tobool, label %land.end, label %land.lhs.true, !dbg !145

land.lhs.true:                                    ; preds = %while.cond
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %file.addr, align 8, !dbg !146
  %call1 = call i32 @feof(%struct._IO_FILE* %1) #5, !dbg !147
  %tobool2 = icmp ne i32 %call1, 0, !dbg !147
  br i1 %tobool2, label %land.end, label %land.rhs, !dbg !148

land.rhs:                                         ; preds = %land.lhs.true
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %file.addr, align 8, !dbg !149
  %call3 = call i32 @fgetc(%struct._IO_FILE* %2), !dbg !150
  %cmp = icmp ne i32 %call3, 10, !dbg !151
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %while.cond
  %3 = phi i1 [ false, %land.lhs.true ], [ false, %while.cond ], [ %cmp, %land.rhs ], !dbg !152
  br i1 %3, label %while.body, label %while.end, !dbg !142

while.body:                                       ; preds = %land.end
  br label %while.cond, !dbg !142, !llvm.loop !153

while.end:                                        ; preds = %land.end
  ret void, !dbg !155
}

; Function Attrs: nounwind
declare dso_local i32 @ferror(%struct._IO_FILE*) #2

; Function Attrs: nounwind
declare dso_local i32 @feof(%struct._IO_FILE*) #2

declare dso_local i32 @fgetc(%struct._IO_FILE*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @skipCommentLines(%struct._IO_FILE* %file) #0 !dbg !156 {
entry:
  %file.addr = alloca %struct._IO_FILE*, align 8
  %c = alloca i32, align 4
  %comment = alloca i32, align 4
  store %struct._IO_FILE* %file, %struct._IO_FILE** %file.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %file.addr, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata i32* %c, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata i32* %comment, metadata !161, metadata !DIExpression()), !dbg !162
  store i32 35, i32* %comment, align 4, !dbg !162
  br label %while.cond, !dbg !163

while.cond:                                       ; preds = %while.body, %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %file.addr, align 8, !dbg !164
  %call = call i32 @fgetc(%struct._IO_FILE* %0), !dbg !165
  store i32 %call, i32* %c, align 4, !dbg !166
  %1 = load i32, i32* %comment, align 4, !dbg !167
  %cmp = icmp eq i32 %call, %1, !dbg !168
  br i1 %cmp, label %while.body, label %while.end, !dbg !163

while.body:                                       ; preds = %while.cond
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %file.addr, align 8, !dbg !169
  call void @skipLine(%struct._IO_FILE* %2), !dbg !170
  br label %while.cond, !dbg !163, !llvm.loop !171

while.end:                                        ; preds = %while.cond
  %3 = load i32, i32* %c, align 4, !dbg !173
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %file.addr, align 8, !dbg !174
  %call1 = call i32 @ungetc(i32 %3, %struct._IO_FILE* %4), !dbg !175
  ret void, !dbg !176
}

declare dso_local i32 @ungetc(i32, %struct._IO_FILE*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @readPortableBitMap(%struct._IO_FILE* %file) #0 !dbg !177 {
entry:
  %retval = alloca i32, align 4
  %file.addr = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store %struct._IO_FILE* %file, %struct._IO_FILE** %file.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %file.addr, metadata !180, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata i32* %i, metadata !182, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.declare(metadata i32* %j, metadata !184, metadata !DIExpression()), !dbg !185
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %file.addr, align 8, !dbg !186
  call void @skipLine(%struct._IO_FILE* %0), !dbg !187
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %file.addr, align 8, !dbg !188
  call void @skipCommentLines(%struct._IO_FILE* %1), !dbg !189
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %file.addr, align 8, !dbg !190
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* @width), !dbg !191
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %file.addr, align 8, !dbg !192
  call void @skipCommentLines(%struct._IO_FILE* %3), !dbg !193
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %file.addr, align 8, !dbg !194
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* @height), !dbg !195
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %file.addr, align 8, !dbg !196
  call void @skipCommentLines(%struct._IO_FILE* %5), !dbg !197
  %6 = load i32, i32* @width, align 4, !dbg !198
  %cmp = icmp sle i32 %6, 2048, !dbg !200
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !201

land.lhs.true:                                    ; preds = %entry
  %7 = load i32, i32* @height, align 4, !dbg !202
  %cmp2 = icmp sle i32 %7, 2048, !dbg !203
  br i1 %cmp2, label %if.then, label %if.else, !dbg !204

if.then:                                          ; preds = %land.lhs.true
  store i32 0, i32* %i, align 4, !dbg !205
  br label %for.cond, !dbg !207

for.cond:                                         ; preds = %for.inc10, %if.then
  %8 = load i32, i32* %i, align 4, !dbg !208
  %9 = load i32, i32* @height, align 4, !dbg !210
  %cmp3 = icmp slt i32 %8, %9, !dbg !211
  br i1 %cmp3, label %for.body, label %for.end12, !dbg !212

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !213
  br label %for.cond4, !dbg !215

for.cond4:                                        ; preds = %for.inc, %for.body
  %10 = load i32, i32* %j, align 4, !dbg !216
  %11 = load i32, i32* @width, align 4, !dbg !218
  %cmp5 = icmp slt i32 %10, %11, !dbg !219
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !220

for.body6:                                        ; preds = %for.cond4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %file.addr, align 8, !dbg !221
  %13 = load i32, i32* %i, align 4, !dbg !222
  %idxprom = sext i32 %13 to i64, !dbg !223
  %arrayidx = getelementptr inbounds [2048 x [2048 x i8]], [2048 x [2048 x i8]]* @bitmap, i64 0, i64 %idxprom, !dbg !223
  %14 = load i32, i32* %j, align 4, !dbg !224
  %idxprom7 = sext i32 %14 to i64, !dbg !223
  %arrayidx8 = getelementptr inbounds [2048 x i8], [2048 x i8]* %arrayidx, i64 0, i64 %idxprom7, !dbg !223
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8* %arrayidx8), !dbg !225
  br label %for.inc, !dbg !225

for.inc:                                          ; preds = %for.body6
  %15 = load i32, i32* %j, align 4, !dbg !226
  %inc = add nsw i32 %15, 1, !dbg !226
  store i32 %inc, i32* %j, align 4, !dbg !226
  br label %for.cond4, !dbg !227, !llvm.loop !228

for.end:                                          ; preds = %for.cond4
  br label %for.inc10, !dbg !229

for.inc10:                                        ; preds = %for.end
  %16 = load i32, i32* %i, align 4, !dbg !230
  %inc11 = add nsw i32 %16, 1, !dbg !230
  store i32 %inc11, i32* %i, align 4, !dbg !230
  br label %for.cond, !dbg !231, !llvm.loop !232

for.end12:                                        ; preds = %for.cond
  br label %if.end, !dbg !233

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @exit(i32 1) #6, !dbg !234
  unreachable, !dbg !234

if.end:                                           ; preds = %for.end12
  %17 = load i32, i32* %retval, align 4, !dbg !235
  ret i32 %17, !dbg !235
}

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @writePortableBitMap(%struct._IO_FILE* %file) #0 !dbg !236 {
entry:
  %file.addr = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store %struct._IO_FILE* %file, %struct._IO_FILE** %file.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %file.addr, metadata !237, metadata !DIExpression()), !dbg !238
  call void @llvm.dbg.declare(metadata i32* %i, metadata !239, metadata !DIExpression()), !dbg !240
  call void @llvm.dbg.declare(metadata i32* %j, metadata !241, metadata !DIExpression()), !dbg !242
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %file.addr, align 8, !dbg !243
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0)), !dbg !244
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %file.addr, align 8, !dbg !245
  %2 = load i32, i32* @width, align 4, !dbg !246
  %3 = load i32, i32* @height, align 4, !dbg !247
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0), i32 %2, i32 %3), !dbg !248
  store i32 0, i32* %i, align 4, !dbg !249
  br label %for.cond, !dbg !251

for.cond:                                         ; preds = %for.inc9, %entry
  %4 = load i32, i32* %i, align 4, !dbg !252
  %5 = load i32, i32* @height, align 4, !dbg !254
  %cmp = icmp slt i32 %4, %5, !dbg !255
  br i1 %cmp, label %for.body, label %for.end11, !dbg !256

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !257
  br label %for.cond2, !dbg !260

for.cond2:                                        ; preds = %for.inc, %for.body
  %6 = load i32, i32* %j, align 4, !dbg !261
  %7 = load i32, i32* @width, align 4, !dbg !263
  %cmp3 = icmp slt i32 %6, %7, !dbg !264
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !265

for.body4:                                        ; preds = %for.cond2
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %file.addr, align 8, !dbg !266
  %9 = load i32, i32* %i, align 4, !dbg !267
  %idxprom = sext i32 %9 to i64, !dbg !268
  %arrayidx = getelementptr inbounds [2048 x [2048 x i8]], [2048 x [2048 x i8]]* @bitmap, i64 0, i64 %idxprom, !dbg !268
  %10 = load i32, i32* %j, align 4, !dbg !269
  %idxprom5 = sext i32 %10 to i64, !dbg !268
  %arrayidx6 = getelementptr inbounds [2048 x i8], [2048 x i8]* %arrayidx, i64 0, i64 %idxprom5, !dbg !268
  %11 = load i8, i8* %arrayidx6, align 1, !dbg !268
  %conv = zext i8 %11 to i32, !dbg !268
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %conv), !dbg !270
  br label %for.inc, !dbg !270

for.inc:                                          ; preds = %for.body4
  %12 = load i32, i32* %j, align 4, !dbg !271
  %inc = add nsw i32 %12, 1, !dbg !271
  store i32 %inc, i32* %j, align 4, !dbg !271
  br label %for.cond2, !dbg !272, !llvm.loop !273

for.end:                                          ; preds = %for.cond2
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %file.addr, align 8, !dbg !275
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0)), !dbg !276
  br label %for.inc9, !dbg !277

for.inc9:                                         ; preds = %for.end
  %14 = load i32, i32* %i, align 4, !dbg !278
  %inc10 = add nsw i32 %14, 1, !dbg !278
  store i32 %inc10, i32* %i, align 4, !dbg !278
  br label %for.cond, !dbg !279, !llvm.loop !280

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !282
}

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !283 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i8 1, i8* @oldColor, align 1, !dbg !286
  %0 = load i8, i8* @oldColor, align 1, !dbg !287
  %conv = zext i8 %0 to i32, !dbg !287
  %tobool = icmp ne i32 %conv, 0, !dbg !287
  %1 = zext i1 %tobool to i64, !dbg !287
  %cond = select i1 %tobool, i32 0, i32 1, !dbg !287
  %conv1 = trunc i32 %cond to i8, !dbg !287
  store i8 %conv1, i8* @newColor, align 1, !dbg !288
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !289
  %call = call i32 @readPortableBitMap(%struct._IO_FILE* %2), !dbg !290
  %3 = load i32, i32* @height, align 4, !dbg !291
  %div = sdiv i32 %3, 2, !dbg !292
  %4 = load i32, i32* @width, align 4, !dbg !293
  %div2 = sdiv i32 %4, 2, !dbg !294
  call void @floodFill(i32 %div, i32 %div2), !dbg !295
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !296
  call void @writePortableBitMap(%struct._IO_FILE* %5), !dbg !297
  ret i32 0, !dbg !298
}

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
!27 = !DILocation(line: 32, column: 20, scope: !23)
!28 = !DILocalVariable(name: "j", arg: 2, scope: !23, file: !3, line: 32, type: !8)
!29 = !DILocation(line: 32, column: 27, scope: !23)
!30 = !DILocation(line: 34, column: 15, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !3, line: 34, column: 10)
!32 = !DILocation(line: 34, column: 12, scope: !31)
!33 = !DILocation(line: 34, column: 17, scope: !31)
!34 = !DILocation(line: 34, column: 20, scope: !31)
!35 = !DILocation(line: 34, column: 24, scope: !31)
!36 = !DILocation(line: 34, column: 22, scope: !31)
!37 = !DILocation(line: 35, column: 5, scope: !31)
!38 = !DILocation(line: 35, column: 15, scope: !31)
!39 = !DILocation(line: 35, column: 12, scope: !31)
!40 = !DILocation(line: 35, column: 17, scope: !31)
!41 = !DILocation(line: 35, column: 20, scope: !31)
!42 = !DILocation(line: 35, column: 24, scope: !31)
!43 = !DILocation(line: 35, column: 22, scope: !31)
!44 = !DILocation(line: 36, column: 5, scope: !31)
!45 = !DILocation(line: 36, column: 17, scope: !31)
!46 = !DILocation(line: 36, column: 10, scope: !31)
!47 = !DILocation(line: 36, column: 20, scope: !31)
!48 = !DILocation(line: 36, column: 26, scope: !31)
!49 = !DILocation(line: 36, column: 23, scope: !31)
!50 = !DILocation(line: 34, column: 10, scope: !23)
!51 = !DILocation(line: 38, column: 24, scope: !52)
!52 = distinct !DILexicalBlock(scope: !31, file: !3, line: 37, column: 5)
!53 = !DILocation(line: 38, column: 16, scope: !52)
!54 = !DILocation(line: 38, column: 9, scope: !52)
!55 = !DILocation(line: 38, column: 19, scope: !52)
!56 = !DILocation(line: 38, column: 22, scope: !52)
!57 = !DILocation(line: 39, column: 19, scope: !52)
!58 = !DILocation(line: 39, column: 20, scope: !52)
!59 = !DILocation(line: 39, column: 23, scope: !52)
!60 = !DILocation(line: 39, column: 9, scope: !52)
!61 = !DILocation(line: 40, column: 19, scope: !52)
!62 = !DILocation(line: 40, column: 20, scope: !52)
!63 = !DILocation(line: 40, column: 23, scope: !52)
!64 = !DILocation(line: 40, column: 9, scope: !52)
!65 = !DILocation(line: 41, column: 19, scope: !52)
!66 = !DILocation(line: 41, column: 21, scope: !52)
!67 = !DILocation(line: 41, column: 22, scope: !52)
!68 = !DILocation(line: 41, column: 9, scope: !52)
!69 = !DILocation(line: 42, column: 19, scope: !52)
!70 = !DILocation(line: 42, column: 21, scope: !52)
!71 = !DILocation(line: 42, column: 22, scope: !52)
!72 = !DILocation(line: 42, column: 9, scope: !52)
!73 = !DILocation(line: 43, column: 5, scope: !52)
!74 = !DILocation(line: 44, column: 1, scope: !23)
!75 = distinct !DISubprogram(name: "skipLine", scope: !3, file: !3, line: 50, type: !76, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DISubroutineType(types: !77)
!77 = !{null, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !80, line: 7, baseType: !81)
!80 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!81 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !82, line: 49, size: 1728, elements: !83)
!82 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!83 = !{!84, !85, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !101, !103, !104, !105, !109, !111, !113, !117, !120, !122, !125, !128, !129, !131, !135, !136}
!84 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !81, file: !82, line: 51, baseType: !8, size: 32)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !81, file: !82, line: 54, baseType: !86, size: 64, offset: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !81, file: !82, line: 55, baseType: !86, size: 64, offset: 128)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !81, file: !82, line: 56, baseType: !86, size: 64, offset: 192)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !81, file: !82, line: 57, baseType: !86, size: 64, offset: 256)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !81, file: !82, line: 58, baseType: !86, size: 64, offset: 320)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !81, file: !82, line: 59, baseType: !86, size: 64, offset: 384)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !81, file: !82, line: 60, baseType: !86, size: 64, offset: 448)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !81, file: !82, line: 61, baseType: !86, size: 64, offset: 512)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !81, file: !82, line: 64, baseType: !86, size: 64, offset: 576)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !81, file: !82, line: 65, baseType: !86, size: 64, offset: 640)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !81, file: !82, line: 66, baseType: !86, size: 64, offset: 704)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !81, file: !82, line: 68, baseType: !99, size: 64, offset: 768)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !82, line: 36, flags: DIFlagFwdDecl)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !81, file: !82, line: 70, baseType: !102, size: 64, offset: 832)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !81, file: !82, line: 72, baseType: !8, size: 32, offset: 896)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !81, file: !82, line: 73, baseType: !8, size: 32, offset: 928)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !81, file: !82, line: 74, baseType: !106, size: 64, offset: 960)
!106 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !107, line: 152, baseType: !108)
!107 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!108 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !81, file: !82, line: 77, baseType: !110, size: 16, offset: 1024)
!110 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !81, file: !82, line: 78, baseType: !112, size: 8, offset: 1040)
!112 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !81, file: !82, line: 79, baseType: !114, size: 8, offset: 1048)
!114 = !DICompositeType(tag: DW_TAG_array_type, baseType: !87, size: 8, elements: !115)
!115 = !{!116}
!116 = !DISubrange(count: 1)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !81, file: !82, line: 81, baseType: !118, size: 64, offset: 1088)
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64)
!119 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !82, line: 43, baseType: null)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !81, file: !82, line: 89, baseType: !121, size: 64, offset: 1152)
!121 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !107, line: 153, baseType: !108)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !81, file: !82, line: 91, baseType: !123, size: 64, offset: 1216)
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!124 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !82, line: 37, flags: DIFlagFwdDecl)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !81, file: !82, line: 92, baseType: !126, size: 64, offset: 1280)
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !127, size: 64)
!127 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !82, line: 38, flags: DIFlagFwdDecl)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !81, file: !82, line: 93, baseType: !102, size: 64, offset: 1344)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !81, file: !82, line: 94, baseType: !130, size: 64, offset: 1408)
!130 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !81, file: !82, line: 95, baseType: !132, size: 64, offset: 1472)
!132 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !133, line: 46, baseType: !134)
!133 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!134 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !81, file: !82, line: 96, baseType: !8, size: 32, offset: 1536)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !81, file: !82, line: 98, baseType: !137, size: 160, offset: 1568)
!137 = !DICompositeType(tag: DW_TAG_array_type, baseType: !87, size: 160, elements: !138)
!138 = !{!139}
!139 = !DISubrange(count: 20)
!140 = !DILocalVariable(name: "file", arg: 1, scope: !75, file: !3, line: 50, type: !78)
!141 = !DILocation(line: 50, column: 21, scope: !75)
!142 = !DILocation(line: 52, column: 5, scope: !75)
!143 = !DILocation(line: 52, column: 19, scope: !75)
!144 = !DILocation(line: 52, column: 12, scope: !75)
!145 = !DILocation(line: 52, column: 25, scope: !75)
!146 = !DILocation(line: 52, column: 34, scope: !75)
!147 = !DILocation(line: 52, column: 29, scope: !75)
!148 = !DILocation(line: 52, column: 40, scope: !75)
!149 = !DILocation(line: 52, column: 49, scope: !75)
!150 = !DILocation(line: 52, column: 43, scope: !75)
!151 = !DILocation(line: 52, column: 55, scope: !75)
!152 = !DILocation(line: 0, scope: !75)
!153 = distinct !{!153, !142, !154}
!154 = !DILocation(line: 53, column: 9, scope: !75)
!155 = !DILocation(line: 54, column: 1, scope: !75)
!156 = distinct !DISubprogram(name: "skipCommentLines", scope: !3, file: !3, line: 56, type: !76, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!157 = !DILocalVariable(name: "file", arg: 1, scope: !156, file: !3, line: 56, type: !78)
!158 = !DILocation(line: 56, column: 29, scope: !156)
!159 = !DILocalVariable(name: "c", scope: !156, file: !3, line: 58, type: !8)
!160 = !DILocation(line: 58, column: 9, scope: !156)
!161 = !DILocalVariable(name: "comment", scope: !156, file: !3, line: 59, type: !8)
!162 = !DILocation(line: 59, column: 9, scope: !156)
!163 = !DILocation(line: 61, column: 5, scope: !156)
!164 = !DILocation(line: 61, column: 23, scope: !156)
!165 = !DILocation(line: 61, column: 17, scope: !156)
!166 = !DILocation(line: 61, column: 15, scope: !156)
!167 = !DILocation(line: 61, column: 33, scope: !156)
!168 = !DILocation(line: 61, column: 30, scope: !156)
!169 = !DILocation(line: 62, column: 18, scope: !156)
!170 = !DILocation(line: 62, column: 9, scope: !156)
!171 = distinct !{!171, !163, !172}
!172 = !DILocation(line: 62, column: 22, scope: !156)
!173 = !DILocation(line: 63, column: 12, scope: !156)
!174 = !DILocation(line: 63, column: 14, scope: !156)
!175 = !DILocation(line: 63, column: 5, scope: !156)
!176 = !DILocation(line: 64, column: 1, scope: !156)
!177 = distinct !DISubprogram(name: "readPortableBitMap", scope: !3, file: !3, line: 66, type: !178, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!178 = !DISubroutineType(types: !179)
!179 = !{!8, !78}
!180 = !DILocalVariable(name: "file", arg: 1, scope: !177, file: !3, line: 66, type: !78)
!181 = !DILocation(line: 66, column: 26, scope: !177)
!182 = !DILocalVariable(name: "i", scope: !177, file: !3, line: 68, type: !8)
!183 = !DILocation(line: 68, column: 9, scope: !177)
!184 = !DILocalVariable(name: "j", scope: !177, file: !3, line: 68, type: !8)
!185 = !DILocation(line: 68, column: 11, scope: !177)
!186 = !DILocation(line: 70, column: 14, scope: !177)
!187 = !DILocation(line: 70, column: 5, scope: !177)
!188 = !DILocation(line: 71, column: 22, scope: !177)
!189 = !DILocation(line: 71, column: 5, scope: !177)
!190 = !DILocation(line: 71, column: 37, scope: !177)
!191 = !DILocation(line: 71, column: 30, scope: !177)
!192 = !DILocation(line: 72, column: 22, scope: !177)
!193 = !DILocation(line: 72, column: 5, scope: !177)
!194 = !DILocation(line: 72, column: 37, scope: !177)
!195 = !DILocation(line: 72, column: 30, scope: !177)
!196 = !DILocation(line: 73, column: 22, scope: !177)
!197 = !DILocation(line: 73, column: 5, scope: !177)
!198 = !DILocation(line: 75, column: 10, scope: !199)
!199 = distinct !DILexicalBlock(scope: !177, file: !3, line: 75, column: 10)
!200 = !DILocation(line: 75, column: 16, scope: !199)
!201 = !DILocation(line: 75, column: 27, scope: !199)
!202 = !DILocation(line: 75, column: 30, scope: !199)
!203 = !DILocation(line: 75, column: 37, scope: !199)
!204 = !DILocation(line: 75, column: 10, scope: !177)
!205 = !DILocation(line: 76, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !199, file: !3, line: 76, column: 9)
!207 = !DILocation(line: 76, column: 15, scope: !206)
!208 = !DILocation(line: 76, column: 22, scope: !209)
!209 = distinct !DILexicalBlock(scope: !206, file: !3, line: 76, column: 9)
!210 = !DILocation(line: 76, column: 26, scope: !209)
!211 = !DILocation(line: 76, column: 24, scope: !209)
!212 = !DILocation(line: 76, column: 9, scope: !206)
!213 = !DILocation(line: 77, column: 21, scope: !214)
!214 = distinct !DILexicalBlock(scope: !209, file: !3, line: 77, column: 13)
!215 = !DILocation(line: 77, column: 19, scope: !214)
!216 = !DILocation(line: 77, column: 26, scope: !217)
!217 = distinct !DILexicalBlock(scope: !214, file: !3, line: 77, column: 13)
!218 = !DILocation(line: 77, column: 30, scope: !217)
!219 = !DILocation(line: 77, column: 28, scope: !217)
!220 = !DILocation(line: 77, column: 13, scope: !214)
!221 = !DILocation(line: 78, column: 24, scope: !217)
!222 = !DILocation(line: 78, column: 44, scope: !217)
!223 = !DILocation(line: 78, column: 37, scope: !217)
!224 = !DILocation(line: 78, column: 47, scope: !217)
!225 = !DILocation(line: 78, column: 17, scope: !217)
!226 = !DILocation(line: 77, column: 38, scope: !217)
!227 = !DILocation(line: 77, column: 13, scope: !217)
!228 = distinct !{!228, !220, !229}
!229 = !DILocation(line: 78, column: 50, scope: !214)
!230 = !DILocation(line: 76, column: 35, scope: !209)
!231 = !DILocation(line: 76, column: 9, scope: !209)
!232 = distinct !{!232, !212, !233}
!233 = !DILocation(line: 78, column: 50, scope: !206)
!234 = !DILocation(line: 79, column: 10, scope: !199)
!235 = !DILocation(line: 80, column: 1, scope: !177)
!236 = distinct !DISubprogram(name: "writePortableBitMap", scope: !3, file: !3, line: 82, type: !76, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!237 = !DILocalVariable(name: "file", arg: 1, scope: !236, file: !3, line: 82, type: !78)
!238 = !DILocation(line: 82, column: 32, scope: !236)
!239 = !DILocalVariable(name: "i", scope: !236, file: !3, line: 84, type: !8)
!240 = !DILocation(line: 84, column: 9, scope: !236)
!241 = !DILocalVariable(name: "j", scope: !236, file: !3, line: 84, type: !8)
!242 = !DILocation(line: 84, column: 11, scope: !236)
!243 = !DILocation(line: 85, column: 13, scope: !236)
!244 = !DILocation(line: 85, column: 5, scope: !236)
!245 = !DILocation(line: 86, column: 13, scope: !236)
!246 = !DILocation(line: 86, column: 29, scope: !236)
!247 = !DILocation(line: 86, column: 36, scope: !236)
!248 = !DILocation(line: 86, column: 5, scope: !236)
!249 = !DILocation(line: 87, column: 13, scope: !250)
!250 = distinct !DILexicalBlock(scope: !236, file: !3, line: 87, column: 5)
!251 = !DILocation(line: 87, column: 11, scope: !250)
!252 = !DILocation(line: 87, column: 18, scope: !253)
!253 = distinct !DILexicalBlock(scope: !250, file: !3, line: 87, column: 5)
!254 = !DILocation(line: 87, column: 22, scope: !253)
!255 = !DILocation(line: 87, column: 20, scope: !253)
!256 = !DILocation(line: 87, column: 5, scope: !250)
!257 = !DILocation(line: 89, column: 17, scope: !258)
!258 = distinct !DILexicalBlock(scope: !259, file: !3, line: 89, column: 9)
!259 = distinct !DILexicalBlock(scope: !253, file: !3, line: 88, column: 5)
!260 = !DILocation(line: 89, column: 15, scope: !258)
!261 = !DILocation(line: 89, column: 22, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !3, line: 89, column: 9)
!263 = !DILocation(line: 89, column: 26, scope: !262)
!264 = !DILocation(line: 89, column: 24, scope: !262)
!265 = !DILocation(line: 89, column: 9, scope: !258)
!266 = !DILocation(line: 90, column: 21, scope: !262)
!267 = !DILocation(line: 90, column: 40, scope: !262)
!268 = !DILocation(line: 90, column: 33, scope: !262)
!269 = !DILocation(line: 90, column: 43, scope: !262)
!270 = !DILocation(line: 90, column: 13, scope: !262)
!271 = !DILocation(line: 89, column: 34, scope: !262)
!272 = !DILocation(line: 89, column: 9, scope: !262)
!273 = distinct !{!273, !265, !274}
!274 = !DILocation(line: 90, column: 45, scope: !258)
!275 = !DILocation(line: 91, column: 17, scope: !259)
!276 = !DILocation(line: 91, column: 9, scope: !259)
!277 = !DILocation(line: 92, column: 5, scope: !259)
!278 = !DILocation(line: 87, column: 31, scope: !253)
!279 = !DILocation(line: 87, column: 5, scope: !253)
!280 = distinct !{!280, !256, !281}
!281 = !DILocation(line: 92, column: 5, scope: !250)
!282 = !DILocation(line: 93, column: 1, scope: !236)
!283 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 99, type: !284, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!284 = !DISubroutineType(types: !285)
!285 = !{!8}
!286 = !DILocation(line: 101, column: 14, scope: !283)
!287 = !DILocation(line: 102, column: 16, scope: !283)
!288 = !DILocation(line: 102, column: 14, scope: !283)
!289 = !DILocation(line: 103, column: 24, scope: !283)
!290 = !DILocation(line: 103, column: 5, scope: !283)
!291 = !DILocation(line: 104, column: 15, scope: !283)
!292 = !DILocation(line: 104, column: 21, scope: !283)
!293 = !DILocation(line: 104, column: 24, scope: !283)
!294 = !DILocation(line: 104, column: 29, scope: !283)
!295 = !DILocation(line: 104, column: 5, scope: !283)
!296 = !DILocation(line: 105, column: 25, scope: !283)
!297 = !DILocation(line: 105, column: 5, scope: !283)
!298 = !DILocation(line: 106, column: 5, scope: !283)
