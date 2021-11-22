; ModuleID = 'langtons-ant.c'
source_filename = "langtons-ant.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@w = dso_local global i32 0, align 4, !dbg !0
@h = dso_local global i32 0, align 4, !dbg !6
@.str = private unnamed_addr constant [4 x i8] c"\1B[H\00", align 1
@pix = common dso_local global i8* null, align 8, !dbg !9
@.str.1 = private unnamed_addr constant [7 x i8] c"\1B[H\1B[J\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"\1B[%d;%dH%c\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"\1B[%d;%dH\1B[31m@\1B[m\00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @refresh(i32 %x, i32 %y) #0 !dbg !17 {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 %y, i32* %y.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %y.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32* %j, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %k, metadata !28, metadata !DIExpression()), !dbg !29
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !30
  store i32 0, i32* %k, align 4, !dbg !31
  store i32 0, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32, i32* %i, align 4, !dbg !35
  %1 = load i32, i32* @h, align 4, !dbg !37
  %cmp = icmp slt i32 %0, %1, !dbg !38
  br i1 %cmp, label %for.body, label %for.end9, !dbg !39

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !40
  br label %for.cond1, !dbg !42

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !43
  %3 = load i32, i32* @w, align 4, !dbg !45
  %cmp2 = icmp slt i32 %2, %3, !dbg !46
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !47

for.body3:                                        ; preds = %for.cond1
  %4 = load i8*, i8** @pix, align 8, !dbg !48
  %5 = load i32, i32* %k, align 4, !dbg !49
  %idxprom = sext i32 %5 to i64, !dbg !48
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %idxprom, !dbg !48
  %6 = load i8, i8* %arrayidx, align 1, !dbg !48
  %conv = zext i8 %6 to i32, !dbg !48
  %tobool = icmp ne i32 %conv, 0, !dbg !48
  %7 = zext i1 %tobool to i64, !dbg !48
  %cond = select i1 %tobool, i32 35, i32 32, !dbg !48
  %call4 = call i32 @putchar(i32 %cond), !dbg !50
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body3
  %8 = load i32, i32* %j, align 4, !dbg !51
  %inc = add nsw i32 %8, 1, !dbg !51
  store i32 %inc, i32* %j, align 4, !dbg !51
  %9 = load i32, i32* %k, align 4, !dbg !52
  %inc5 = add nsw i32 %9, 1, !dbg !52
  store i32 %inc5, i32* %k, align 4, !dbg !52
  br label %for.cond1, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond1
  br label %for.inc6, !dbg !55

for.inc6:                                         ; preds = %for.end
  %call7 = call i32 @putchar(i32 10), !dbg !56
  %10 = load i32, i32* %i, align 4, !dbg !57
  %inc8 = add nsw i32 %10, 1, !dbg !57
  store i32 %inc8, i32* %i, align 4, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end9:                                         ; preds = %for.cond
  ret void, !dbg !61
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @putchar(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @walk() #0 !dbg !62 {
entry:
  %dx = alloca i32, align 4
  %dy = alloca i32, align 4
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %dx, metadata !65, metadata !DIExpression()), !dbg !66
  store i32 0, i32* %dx, align 4, !dbg !66
  call void @llvm.dbg.declare(metadata i32* %dy, metadata !67, metadata !DIExpression()), !dbg !68
  store i32 1, i32* %dy, align 4, !dbg !68
  call void @llvm.dbg.declare(metadata i32* %i, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i32* %k, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32* %x, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = load i32, i32* @w, align 4, !dbg !75
  %div = sdiv i32 %0, 2, !dbg !76
  store i32 %div, i32* %x, align 4, !dbg !74
  call void @llvm.dbg.declare(metadata i32* %y, metadata !77, metadata !DIExpression()), !dbg !78
  %1 = load i32, i32* @h, align 4, !dbg !79
  %div1 = sdiv i32 %1, 2, !dbg !80
  store i32 %div1, i32* %y, align 4, !dbg !78
  %2 = load i32, i32* @w, align 4, !dbg !81
  %3 = load i32, i32* @h, align 4, !dbg !82
  %mul = mul nsw i32 %2, %3, !dbg !83
  %conv = sext i32 %mul to i64, !dbg !81
  %call = call noalias i8* @calloc(i64 1, i64 %conv) #6, !dbg !84
  store i8* %call, i8** @pix, align 8, !dbg !85
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  br label %while.body, !dbg !87

while.body:                                       ; preds = %entry, %if.end80
  %4 = load i32, i32* %y, align 4, !dbg !88
  %5 = load i32, i32* @w, align 4, !dbg !90
  %mul3 = mul nsw i32 %4, %5, !dbg !91
  %6 = load i32, i32* %x, align 4, !dbg !92
  %add = add nsw i32 %mul3, %6, !dbg !93
  store i32 %add, i32* %i, align 4, !dbg !94
  %7 = load i8*, i8** @pix, align 8, !dbg !95
  %8 = load i32, i32* %i, align 4, !dbg !97
  %idxprom = sext i32 %8 to i64, !dbg !95
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %idxprom, !dbg !95
  %9 = load i8, i8* %arrayidx, align 1, !dbg !95
  %tobool = icmp ne i8 %9, 0, !dbg !95
  br i1 %tobool, label %if.then, label %if.else, !dbg !98, !cf.info !99

if.then:                                          ; preds = %while.body
  %10 = load i32, i32* %dx, align 4, !dbg !100
  store i32 %10, i32* %k, align 4, !dbg !101
  %11 = load i32, i32* %dy, align 4, !dbg !102
  %sub = sub nsw i32 0, %11, !dbg !103
  store i32 %sub, i32* %dx, align 4, !dbg !104
  %12 = load i32, i32* %k, align 4, !dbg !105
  store i32 %12, i32* %dy, align 4, !dbg !106
  br label %if.end, !dbg !107

if.else:                                          ; preds = %while.body
  %13 = load i32, i32* %dy, align 4, !dbg !108
  store i32 %13, i32* %k, align 4, !dbg !109
  %14 = load i32, i32* %dx, align 4, !dbg !110
  %sub4 = sub nsw i32 0, %14, !dbg !111
  store i32 %sub4, i32* %dy, align 4, !dbg !112
  %15 = load i32, i32* %k, align 4, !dbg !113
  store i32 %15, i32* %dx, align 4, !dbg !114
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %16 = load i8*, i8** @pix, align 8, !dbg !115
  %17 = load i32, i32* %i, align 4, !dbg !116
  %idxprom5 = sext i32 %17 to i64, !dbg !115
  %arrayidx6 = getelementptr inbounds i8, i8* %16, i64 %idxprom5, !dbg !115
  %18 = load i8, i8* %arrayidx6, align 1, !dbg !115
  %tobool7 = icmp ne i8 %18, 0, !dbg !117
  %lnot = xor i1 %tobool7, true, !dbg !117
  %lnot.ext = zext i1 %lnot to i32, !dbg !117
  %conv8 = trunc i32 %lnot.ext to i8, !dbg !117
  %19 = load i8*, i8** @pix, align 8, !dbg !118
  %20 = load i32, i32* %i, align 4, !dbg !119
  %idxprom9 = sext i32 %20 to i64, !dbg !118
  %arrayidx10 = getelementptr inbounds i8, i8* %19, i64 %idxprom9, !dbg !118
  store i8 %conv8, i8* %arrayidx10, align 1, !dbg !120
  %21 = load i32, i32* %y, align 4, !dbg !121
  %add11 = add nsw i32 %21, 1, !dbg !122
  %22 = load i32, i32* %x, align 4, !dbg !123
  %add12 = add nsw i32 %22, 1, !dbg !124
  %23 = load i8*, i8** @pix, align 8, !dbg !125
  %24 = load i32, i32* %i, align 4, !dbg !126
  %idxprom13 = sext i32 %24 to i64, !dbg !125
  %arrayidx14 = getelementptr inbounds i8, i8* %23, i64 %idxprom13, !dbg !125
  %25 = load i8, i8* %arrayidx14, align 1, !dbg !125
  %conv15 = zext i8 %25 to i32, !dbg !125
  %tobool16 = icmp ne i32 %conv15, 0, !dbg !125
  %26 = zext i1 %tobool16 to i64, !dbg !125
  %cond = select i1 %tobool16, i32 35, i32 32, !dbg !125
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i32 %add11, i32 %add12, i32 %cond), !dbg !127
  %27 = load i32, i32* %dx, align 4, !dbg !128
  %28 = load i32, i32* %x, align 4, !dbg !129
  %add18 = add nsw i32 %28, %27, !dbg !129
  store i32 %add18, i32* %x, align 4, !dbg !129
  %29 = load i32, i32* %dy, align 4, !dbg !130
  %30 = load i32, i32* %y, align 4, !dbg !131
  %add19 = add nsw i32 %30, %29, !dbg !131
  store i32 %add19, i32* %y, align 4, !dbg !131
  store i32 0, i32* %k, align 4, !dbg !132
  %31 = load i32, i32* %x, align 4, !dbg !133
  %cmp = icmp slt i32 %31, 0, !dbg !135
  br i1 %cmp, label %if.then21, label %if.else31, !dbg !136, !cf.info !99

if.then21:                                        ; preds = %if.end
  %32 = load i8*, i8** @pix, align 8, !dbg !137
  %add.ptr = getelementptr inbounds i8, i8* %32, i64 1, !dbg !139
  %33 = load i8*, i8** @pix, align 8, !dbg !140
  %34 = load i32, i32* @w, align 4, !dbg !141
  %35 = load i32, i32* @h, align 4, !dbg !142
  %mul22 = mul nsw i32 %34, %35, !dbg !143
  %sub23 = sub nsw i32 %mul22, 1, !dbg !144
  %conv24 = sext i32 %sub23 to i64, !dbg !141
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %add.ptr, i8* align 1 %33, i64 %conv24, i1 false), !dbg !145
  store i32 0, i32* %i, align 4, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %if.then21
  %36 = load i32, i32* %i, align 4, !dbg !149
  %37 = load i32, i32* @w, align 4, !dbg !151
  %38 = load i32, i32* @h, align 4, !dbg !152
  %mul25 = mul nsw i32 %37, %38, !dbg !153
  %cmp26 = icmp slt i32 %36, %mul25, !dbg !154
  br i1 %cmp26, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  %39 = load i8*, i8** @pix, align 8, !dbg !156
  %40 = load i32, i32* %i, align 4, !dbg !157
  %idxprom28 = sext i32 %40 to i64, !dbg !156
  %arrayidx29 = getelementptr inbounds i8, i8* %39, i64 %idxprom28, !dbg !156
  store i8 0, i8* %arrayidx29, align 1, !dbg !158
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body
  %41 = load i32, i32* @w, align 4, !dbg !159
  %42 = load i32, i32* %i, align 4, !dbg !160
  %add30 = add nsw i32 %42, %41, !dbg !160
  store i32 %add30, i32* %i, align 4, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  %43 = load i32, i32* %x, align 4, !dbg !164
  %inc = add nsw i32 %43, 1, !dbg !164
  store i32 %inc, i32* %x, align 4, !dbg !164
  store i32 1, i32* %k, align 4, !dbg !165
  br label %if.end51, !dbg !166

if.else31:                                        ; preds = %if.end
  %44 = load i32, i32* %x, align 4, !dbg !167
  %45 = load i32, i32* @w, align 4, !dbg !169
  %cmp32 = icmp sge i32 %44, %45, !dbg !170
  br i1 %cmp32, label %if.then34, label %if.end50, !dbg !171, !cf.info !99

if.then34:                                        ; preds = %if.else31
  %46 = load i8*, i8** @pix, align 8, !dbg !172
  %47 = load i8*, i8** @pix, align 8, !dbg !174
  %add.ptr35 = getelementptr inbounds i8, i8* %47, i64 1, !dbg !175
  %48 = load i32, i32* @w, align 4, !dbg !176
  %49 = load i32, i32* @h, align 4, !dbg !177
  %mul36 = mul nsw i32 %48, %49, !dbg !178
  %sub37 = sub nsw i32 %mul36, 1, !dbg !179
  %conv38 = sext i32 %sub37 to i64, !dbg !176
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %46, i8* align 1 %add.ptr35, i64 %conv38, i1 false), !dbg !180
  %50 = load i32, i32* @w, align 4, !dbg !181
  %sub39 = sub nsw i32 %50, 1, !dbg !183
  store i32 %sub39, i32* %i, align 4, !dbg !184
  br label %for.cond40, !dbg !185

for.cond40:                                       ; preds = %for.inc47, %if.then34
  %51 = load i32, i32* %i, align 4, !dbg !186
  %52 = load i32, i32* @w, align 4, !dbg !188
  %53 = load i32, i32* @h, align 4, !dbg !189
  %mul41 = mul nsw i32 %52, %53, !dbg !190
  %cmp42 = icmp slt i32 %51, %mul41, !dbg !191
  br i1 %cmp42, label %for.body44, label %for.end49, !dbg !192

for.body44:                                       ; preds = %for.cond40
  %54 = load i8*, i8** @pix, align 8, !dbg !193
  %55 = load i32, i32* %i, align 4, !dbg !194
  %idxprom45 = sext i32 %55 to i64, !dbg !193
  %arrayidx46 = getelementptr inbounds i8, i8* %54, i64 %idxprom45, !dbg !193
  store i8 0, i8* %arrayidx46, align 1, !dbg !195
  br label %for.inc47, !dbg !193

for.inc47:                                        ; preds = %for.body44
  %56 = load i32, i32* @w, align 4, !dbg !196
  %57 = load i32, i32* %i, align 4, !dbg !197
  %add48 = add nsw i32 %57, %56, !dbg !197
  store i32 %add48, i32* %i, align 4, !dbg !197
  br label %for.cond40, !dbg !198, !llvm.loop !199

for.end49:                                        ; preds = %for.cond40
  %58 = load i32, i32* %x, align 4, !dbg !201
  %dec = add nsw i32 %58, -1, !dbg !201
  store i32 %dec, i32* %x, align 4, !dbg !201
  store i32 1, i32* %k, align 4, !dbg !202
  br label %if.end50, !dbg !203

if.end50:                                         ; preds = %for.end49, %if.else31
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %for.end
  %59 = load i32, i32* %y, align 4, !dbg !204
  %60 = load i32, i32* @h, align 4, !dbg !206
  %cmp52 = icmp sge i32 %59, %60, !dbg !207
  br i1 %cmp52, label %if.then54, label %if.else65, !dbg !208, !cf.info !99

if.then54:                                        ; preds = %if.end51
  %61 = load i8*, i8** @pix, align 8, !dbg !209
  %62 = load i8*, i8** @pix, align 8, !dbg !211
  %63 = load i32, i32* @w, align 4, !dbg !212
  %idx.ext = sext i32 %63 to i64, !dbg !213
  %add.ptr55 = getelementptr inbounds i8, i8* %62, i64 %idx.ext, !dbg !213
  %64 = load i32, i32* @w, align 4, !dbg !214
  %65 = load i32, i32* @h, align 4, !dbg !215
  %sub56 = sub nsw i32 %65, 1, !dbg !216
  %mul57 = mul nsw i32 %64, %sub56, !dbg !217
  %conv58 = sext i32 %mul57 to i64, !dbg !214
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %61, i8* align 1 %add.ptr55, i64 %conv58, i1 false), !dbg !218
  %66 = load i8*, i8** @pix, align 8, !dbg !219
  %67 = load i32, i32* @w, align 4, !dbg !220
  %68 = load i32, i32* @h, align 4, !dbg !221
  %sub59 = sub nsw i32 %68, 1, !dbg !222
  %mul60 = mul nsw i32 %67, %sub59, !dbg !223
  %idx.ext61 = sext i32 %mul60 to i64, !dbg !224
  %add.ptr62 = getelementptr inbounds i8, i8* %66, i64 %idx.ext61, !dbg !224
  %69 = load i32, i32* @w, align 4, !dbg !225
  %conv63 = sext i32 %69 to i64, !dbg !225
  call void @llvm.memset.p0i8.i64(i8* align 1 %add.ptr62, i8 0, i64 %conv63, i1 false), !dbg !226
  %70 = load i32, i32* %y, align 4, !dbg !227
  %dec64 = add nsw i32 %70, -1, !dbg !227
  store i32 %dec64, i32* %y, align 4, !dbg !227
  store i32 1, i32* %k, align 4, !dbg !228
  br label %if.end77, !dbg !229

if.else65:                                        ; preds = %if.end51
  %71 = load i32, i32* %y, align 4, !dbg !230
  %cmp66 = icmp slt i32 %71, 0, !dbg !232
  br i1 %cmp66, label %if.then68, label %if.end76, !dbg !233, !cf.info !99

if.then68:                                        ; preds = %if.else65
  %72 = load i8*, i8** @pix, align 8, !dbg !234
  %73 = load i32, i32* @w, align 4, !dbg !236
  %idx.ext69 = sext i32 %73 to i64, !dbg !237
  %add.ptr70 = getelementptr inbounds i8, i8* %72, i64 %idx.ext69, !dbg !237
  %74 = load i8*, i8** @pix, align 8, !dbg !238
  %75 = load i32, i32* @w, align 4, !dbg !239
  %76 = load i32, i32* @h, align 4, !dbg !240
  %sub71 = sub nsw i32 %76, 1, !dbg !241
  %mul72 = mul nsw i32 %75, %sub71, !dbg !242
  %conv73 = sext i32 %mul72 to i64, !dbg !239
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %add.ptr70, i8* align 1 %74, i64 %conv73, i1 false), !dbg !243
  %77 = load i8*, i8** @pix, align 8, !dbg !244
  %78 = load i32, i32* @w, align 4, !dbg !245
  %conv74 = sext i32 %78 to i64, !dbg !245
  call void @llvm.memset.p0i8.i64(i8* align 1 %77, i8 0, i64 %conv74, i1 false), !dbg !246
  %79 = load i32, i32* %y, align 4, !dbg !247
  %inc75 = add nsw i32 %79, 1, !dbg !247
  store i32 %inc75, i32* %y, align 4, !dbg !247
  store i32 1, i32* %k, align 4, !dbg !248
  br label %if.end76, !dbg !249

if.end76:                                         ; preds = %if.then68, %if.else65
  br label %if.end77

if.end77:                                         ; preds = %if.end76, %if.then54
  %80 = load i32, i32* %k, align 4, !dbg !250
  %tobool78 = icmp ne i32 %80, 0, !dbg !250
  br i1 %tobool78, label %if.then79, label %if.end80, !dbg !252, !cf.info !99

if.then79:                                        ; preds = %if.end77
  %81 = load i32, i32* %x, align 4, !dbg !253
  %82 = load i32, i32* %y, align 4, !dbg !254
  call void @refresh(i32 %81, i32 %82), !dbg !255
  br label %if.end80, !dbg !255

if.end80:                                         ; preds = %if.then79, %if.end77
  %83 = load i32, i32* %y, align 4, !dbg !256
  %add81 = add nsw i32 %83, 1, !dbg !257
  %84 = load i32, i32* %x, align 4, !dbg !258
  %add82 = add nsw i32 %84, 1, !dbg !259
  %call83 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0), i32 %add81, i32 %add82), !dbg !260
  %85 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !261
  %call84 = call i32 @fflush(%struct._IO_FILE* %85), !dbg !262
  %call85 = call i32 @usleep(i32 10000), !dbg !263
  br label %while.body, !dbg !87, !llvm.loop !264
}

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i1 immarg) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local i32 @fflush(%struct._IO_FILE*) #2

declare dso_local i32 @usleep(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !266 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %v.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !272, metadata !DIExpression()), !dbg !273
  store i8** %v, i8*** %v.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %v.addr, metadata !274, metadata !DIExpression()), !dbg !275
  %0 = load i32, i32* %c.addr, align 4, !dbg !276
  %cmp = icmp sgt i32 %0, 1, !dbg !278
  br i1 %cmp, label %if.then, label %if.end, !dbg !279, !cf.info !99

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %v.addr, align 8, !dbg !280
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !280
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !280
  %call = call i32 @atoi(i8* %2) #7, !dbg !281
  store i32 %call, i32* @w, align 4, !dbg !282
  br label %if.end, !dbg !283

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %c.addr, align 4, !dbg !284
  %cmp1 = icmp sgt i32 %3, 2, !dbg !286
  br i1 %cmp1, label %if.then2, label %if.end5, !dbg !287, !cf.info !99

if.then2:                                         ; preds = %if.end
  %4 = load i8**, i8*** %v.addr, align 8, !dbg !288
  %arrayidx3 = getelementptr inbounds i8*, i8** %4, i64 2, !dbg !288
  %5 = load i8*, i8** %arrayidx3, align 8, !dbg !288
  %call4 = call i32 @atoi(i8* %5) #7, !dbg !289
  store i32 %call4, i32* @h, align 4, !dbg !290
  br label %if.end5, !dbg !291

if.end5:                                          ; preds = %if.then2, %if.end
  %6 = load i32, i32* @w, align 4, !dbg !292
  %cmp6 = icmp slt i32 %6, 40, !dbg !294
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !295, !cf.info !99

if.then7:                                         ; preds = %if.end5
  store i32 40, i32* @w, align 4, !dbg !296
  br label %if.end8, !dbg !297

if.end8:                                          ; preds = %if.then7, %if.end5
  %7 = load i32, i32* @h, align 4, !dbg !298
  %cmp9 = icmp slt i32 %7, 25, !dbg !300
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !301, !cf.info !99

if.then10:                                        ; preds = %if.end8
  store i32 25, i32* @h, align 4, !dbg !302
  br label %if.end11, !dbg !303

if.end11:                                         ; preds = %if.then10, %if.end8
  call void @walk(), !dbg !304
  ret i32 0, !dbg !305
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "w", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "langtons-ant.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Langtons-ant")
!4 = !{}
!5 = !{!0, !6, !9}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "h", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "pix", scope: !2, file: !3, line: 7, type: !11, isLocal: false, isDefinition: true)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!17 = distinct !DISubprogram(name: "refresh", scope: !3, file: !3, line: 9, type: !18, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!18 = !DISubroutineType(types: !19)
!19 = !{null, !8, !8}
!20 = !DILocalVariable(name: "x", arg: 1, scope: !17, file: !3, line: 9, type: !8)
!21 = !DILocation(line: 9, column: 18, scope: !17)
!22 = !DILocalVariable(name: "y", arg: 2, scope: !17, file: !3, line: 9, type: !8)
!23 = !DILocation(line: 9, column: 25, scope: !17)
!24 = !DILocalVariable(name: "i", scope: !17, file: !3, line: 11, type: !8)
!25 = !DILocation(line: 11, column: 6, scope: !17)
!26 = !DILocalVariable(name: "j", scope: !17, file: !3, line: 11, type: !8)
!27 = !DILocation(line: 11, column: 9, scope: !17)
!28 = !DILocalVariable(name: "k", scope: !17, file: !3, line: 11, type: !8)
!29 = !DILocation(line: 11, column: 12, scope: !17)
!30 = !DILocation(line: 12, column: 2, scope: !17)
!31 = !DILocation(line: 13, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !17, file: !3, line: 13, column: 2)
!33 = !DILocation(line: 13, column: 9, scope: !32)
!34 = !DILocation(line: 13, column: 7, scope: !32)
!35 = !DILocation(line: 13, column: 18, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !3, line: 13, column: 2)
!37 = !DILocation(line: 13, column: 22, scope: !36)
!38 = !DILocation(line: 13, column: 20, scope: !36)
!39 = !DILocation(line: 13, column: 2, scope: !32)
!40 = !DILocation(line: 14, column: 10, scope: !41)
!41 = distinct !DILexicalBlock(scope: !36, file: !3, line: 14, column: 3)
!42 = !DILocation(line: 14, column: 8, scope: !41)
!43 = !DILocation(line: 14, column: 15, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !3, line: 14, column: 3)
!45 = !DILocation(line: 14, column: 19, scope: !44)
!46 = !DILocation(line: 14, column: 17, scope: !44)
!47 = !DILocation(line: 14, column: 3, scope: !41)
!48 = !DILocation(line: 15, column: 12, scope: !44)
!49 = !DILocation(line: 15, column: 16, scope: !44)
!50 = !DILocation(line: 15, column: 4, scope: !44)
!51 = !DILocation(line: 14, column: 23, scope: !44)
!52 = !DILocation(line: 14, column: 28, scope: !44)
!53 = !DILocation(line: 14, column: 3, scope: !44)
!54 = distinct !{!54, !47, !55}
!55 = !DILocation(line: 15, column: 30, scope: !41)
!56 = !DILocation(line: 13, column: 25, scope: !36)
!57 = !DILocation(line: 13, column: 41, scope: !36)
!58 = !DILocation(line: 13, column: 2, scope: !36)
!59 = distinct !{!59, !39, !60}
!60 = !DILocation(line: 15, column: 30, scope: !32)
!61 = !DILocation(line: 16, column: 1, scope: !17)
!62 = distinct !DISubprogram(name: "walk", scope: !3, file: !3, line: 18, type: !63, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DISubroutineType(types: !64)
!64 = !{null}
!65 = !DILocalVariable(name: "dx", scope: !62, file: !3, line: 20, type: !8)
!66 = !DILocation(line: 20, column: 6, scope: !62)
!67 = !DILocalVariable(name: "dy", scope: !62, file: !3, line: 20, type: !8)
!68 = !DILocation(line: 20, column: 14, scope: !62)
!69 = !DILocalVariable(name: "i", scope: !62, file: !3, line: 20, type: !8)
!70 = !DILocation(line: 20, column: 22, scope: !62)
!71 = !DILocalVariable(name: "k", scope: !62, file: !3, line: 20, type: !8)
!72 = !DILocation(line: 20, column: 25, scope: !62)
!73 = !DILocalVariable(name: "x", scope: !62, file: !3, line: 21, type: !8)
!74 = !DILocation(line: 21, column: 6, scope: !62)
!75 = !DILocation(line: 21, column: 10, scope: !62)
!76 = !DILocation(line: 21, column: 12, scope: !62)
!77 = !DILocalVariable(name: "y", scope: !62, file: !3, line: 21, type: !8)
!78 = !DILocation(line: 21, column: 17, scope: !62)
!79 = !DILocation(line: 21, column: 21, scope: !62)
!80 = !DILocation(line: 21, column: 23, scope: !62)
!81 = !DILocation(line: 23, column: 18, scope: !62)
!82 = !DILocation(line: 23, column: 22, scope: !62)
!83 = !DILocation(line: 23, column: 20, scope: !62)
!84 = !DILocation(line: 23, column: 8, scope: !62)
!85 = !DILocation(line: 23, column: 6, scope: !62)
!86 = !DILocation(line: 24, column: 2, scope: !62)
!87 = !DILocation(line: 26, column: 2, scope: !62)
!88 = !DILocation(line: 27, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !62, file: !3, line: 26, column: 12)
!90 = !DILocation(line: 27, column: 12, scope: !89)
!91 = !DILocation(line: 27, column: 10, scope: !89)
!92 = !DILocation(line: 27, column: 16, scope: !89)
!93 = !DILocation(line: 27, column: 14, scope: !89)
!94 = !DILocation(line: 27, column: 5, scope: !89)
!95 = !DILocation(line: 28, column: 7, scope: !96)
!96 = distinct !DILexicalBlock(scope: !89, file: !3, line: 28, column: 7)
!97 = !DILocation(line: 28, column: 11, scope: !96)
!98 = !DILocation(line: 28, column: 7, scope: !89)
!99 = !{!"if"}
!100 = !DILocation(line: 28, column: 19, scope: !96)
!101 = !DILocation(line: 28, column: 17, scope: !96)
!102 = !DILocation(line: 28, column: 29, scope: !96)
!103 = !DILocation(line: 28, column: 28, scope: !96)
!104 = !DILocation(line: 28, column: 26, scope: !96)
!105 = !DILocation(line: 28, column: 38, scope: !96)
!106 = !DILocation(line: 28, column: 36, scope: !96)
!107 = !DILocation(line: 28, column: 15, scope: !96)
!108 = !DILocation(line: 29, column: 16, scope: !96)
!109 = !DILocation(line: 29, column: 14, scope: !96)
!110 = !DILocation(line: 29, column: 26, scope: !96)
!111 = !DILocation(line: 29, column: 25, scope: !96)
!112 = !DILocation(line: 29, column: 23, scope: !96)
!113 = !DILocation(line: 29, column: 35, scope: !96)
!114 = !DILocation(line: 29, column: 33, scope: !96)
!115 = !DILocation(line: 31, column: 13, scope: !89)
!116 = !DILocation(line: 31, column: 17, scope: !89)
!117 = !DILocation(line: 31, column: 12, scope: !89)
!118 = !DILocation(line: 31, column: 3, scope: !89)
!119 = !DILocation(line: 31, column: 7, scope: !89)
!120 = !DILocation(line: 31, column: 10, scope: !89)
!121 = !DILocation(line: 32, column: 27, scope: !89)
!122 = !DILocation(line: 32, column: 29, scope: !89)
!123 = !DILocation(line: 32, column: 34, scope: !89)
!124 = !DILocation(line: 32, column: 36, scope: !89)
!125 = !DILocation(line: 32, column: 41, scope: !89)
!126 = !DILocation(line: 32, column: 45, scope: !89)
!127 = !DILocation(line: 32, column: 3, scope: !89)
!128 = !DILocation(line: 34, column: 8, scope: !89)
!129 = !DILocation(line: 34, column: 5, scope: !89)
!130 = !DILocation(line: 34, column: 17, scope: !89)
!131 = !DILocation(line: 34, column: 14, scope: !89)
!132 = !DILocation(line: 36, column: 5, scope: !89)
!133 = !DILocation(line: 37, column: 7, scope: !134)
!134 = distinct !DILexicalBlock(scope: !89, file: !3, line: 37, column: 7)
!135 = !DILocation(line: 37, column: 9, scope: !134)
!136 = !DILocation(line: 37, column: 7, scope: !89)
!137 = !DILocation(line: 38, column: 12, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !3, line: 37, column: 14)
!139 = !DILocation(line: 38, column: 16, scope: !138)
!140 = !DILocation(line: 38, column: 21, scope: !138)
!141 = !DILocation(line: 38, column: 26, scope: !138)
!142 = !DILocation(line: 38, column: 30, scope: !138)
!143 = !DILocation(line: 38, column: 28, scope: !138)
!144 = !DILocation(line: 38, column: 32, scope: !138)
!145 = !DILocation(line: 38, column: 4, scope: !138)
!146 = !DILocation(line: 39, column: 11, scope: !147)
!147 = distinct !DILexicalBlock(scope: !138, file: !3, line: 39, column: 4)
!148 = !DILocation(line: 39, column: 9, scope: !147)
!149 = !DILocation(line: 39, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !3, line: 39, column: 4)
!151 = !DILocation(line: 39, column: 20, scope: !150)
!152 = !DILocation(line: 39, column: 24, scope: !150)
!153 = !DILocation(line: 39, column: 22, scope: !150)
!154 = !DILocation(line: 39, column: 18, scope: !150)
!155 = !DILocation(line: 39, column: 4, scope: !147)
!156 = !DILocation(line: 39, column: 35, scope: !150)
!157 = !DILocation(line: 39, column: 39, scope: !150)
!158 = !DILocation(line: 39, column: 42, scope: !150)
!159 = !DILocation(line: 39, column: 32, scope: !150)
!160 = !DILocation(line: 39, column: 29, scope: !150)
!161 = !DILocation(line: 39, column: 4, scope: !150)
!162 = distinct !{!162, !155, !163}
!163 = !DILocation(line: 39, column: 44, scope: !147)
!164 = !DILocation(line: 40, column: 5, scope: !138)
!165 = !DILocation(line: 40, column: 11, scope: !138)
!166 = !DILocation(line: 41, column: 3, scope: !138)
!167 = !DILocation(line: 42, column: 12, scope: !168)
!168 = distinct !DILexicalBlock(scope: !134, file: !3, line: 42, column: 12)
!169 = !DILocation(line: 42, column: 17, scope: !168)
!170 = !DILocation(line: 42, column: 14, scope: !168)
!171 = !DILocation(line: 42, column: 12, scope: !134)
!172 = !DILocation(line: 43, column: 12, scope: !173)
!173 = distinct !DILexicalBlock(scope: !168, file: !3, line: 42, column: 20)
!174 = !DILocation(line: 43, column: 17, scope: !173)
!175 = !DILocation(line: 43, column: 21, scope: !173)
!176 = !DILocation(line: 43, column: 26, scope: !173)
!177 = !DILocation(line: 43, column: 30, scope: !173)
!178 = !DILocation(line: 43, column: 28, scope: !173)
!179 = !DILocation(line: 43, column: 32, scope: !173)
!180 = !DILocation(line: 43, column: 4, scope: !173)
!181 = !DILocation(line: 44, column: 13, scope: !182)
!182 = distinct !DILexicalBlock(scope: !173, file: !3, line: 44, column: 4)
!183 = !DILocation(line: 44, column: 14, scope: !182)
!184 = !DILocation(line: 44, column: 11, scope: !182)
!185 = !DILocation(line: 44, column: 9, scope: !182)
!186 = !DILocation(line: 44, column: 18, scope: !187)
!187 = distinct !DILexicalBlock(scope: !182, file: !3, line: 44, column: 4)
!188 = !DILocation(line: 44, column: 22, scope: !187)
!189 = !DILocation(line: 44, column: 26, scope: !187)
!190 = !DILocation(line: 44, column: 24, scope: !187)
!191 = !DILocation(line: 44, column: 20, scope: !187)
!192 = !DILocation(line: 44, column: 4, scope: !182)
!193 = !DILocation(line: 44, column: 37, scope: !187)
!194 = !DILocation(line: 44, column: 41, scope: !187)
!195 = !DILocation(line: 44, column: 44, scope: !187)
!196 = !DILocation(line: 44, column: 34, scope: !187)
!197 = !DILocation(line: 44, column: 31, scope: !187)
!198 = !DILocation(line: 44, column: 4, scope: !187)
!199 = distinct !{!199, !192, !200}
!200 = !DILocation(line: 44, column: 46, scope: !182)
!201 = !DILocation(line: 45, column: 5, scope: !173)
!202 = !DILocation(line: 45, column: 11, scope: !173)
!203 = !DILocation(line: 46, column: 3, scope: !173)
!204 = !DILocation(line: 48, column: 7, scope: !205)
!205 = distinct !DILexicalBlock(scope: !89, file: !3, line: 48, column: 7)
!206 = !DILocation(line: 48, column: 12, scope: !205)
!207 = !DILocation(line: 48, column: 9, scope: !205)
!208 = !DILocation(line: 48, column: 7, scope: !89)
!209 = !DILocation(line: 49, column: 12, scope: !210)
!210 = distinct !DILexicalBlock(scope: !205, file: !3, line: 48, column: 15)
!211 = !DILocation(line: 49, column: 17, scope: !210)
!212 = !DILocation(line: 49, column: 23, scope: !210)
!213 = !DILocation(line: 49, column: 21, scope: !210)
!214 = !DILocation(line: 49, column: 26, scope: !210)
!215 = !DILocation(line: 49, column: 31, scope: !210)
!216 = !DILocation(line: 49, column: 33, scope: !210)
!217 = !DILocation(line: 49, column: 28, scope: !210)
!218 = !DILocation(line: 49, column: 4, scope: !210)
!219 = !DILocation(line: 50, column: 11, scope: !210)
!220 = !DILocation(line: 50, column: 17, scope: !210)
!221 = !DILocation(line: 50, column: 22, scope: !210)
!222 = !DILocation(line: 50, column: 24, scope: !210)
!223 = !DILocation(line: 50, column: 19, scope: !210)
!224 = !DILocation(line: 50, column: 15, scope: !210)
!225 = !DILocation(line: 50, column: 33, scope: !210)
!226 = !DILocation(line: 50, column: 4, scope: !210)
!227 = !DILocation(line: 51, column: 5, scope: !210)
!228 = !DILocation(line: 51, column: 11, scope: !210)
!229 = !DILocation(line: 52, column: 3, scope: !210)
!230 = !DILocation(line: 53, column: 12, scope: !231)
!231 = distinct !DILexicalBlock(scope: !205, file: !3, line: 53, column: 12)
!232 = !DILocation(line: 53, column: 14, scope: !231)
!233 = !DILocation(line: 53, column: 12, scope: !205)
!234 = !DILocation(line: 54, column: 12, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !3, line: 53, column: 19)
!236 = !DILocation(line: 54, column: 18, scope: !235)
!237 = !DILocation(line: 54, column: 16, scope: !235)
!238 = !DILocation(line: 54, column: 21, scope: !235)
!239 = !DILocation(line: 54, column: 26, scope: !235)
!240 = !DILocation(line: 54, column: 31, scope: !235)
!241 = !DILocation(line: 54, column: 33, scope: !235)
!242 = !DILocation(line: 54, column: 28, scope: !235)
!243 = !DILocation(line: 54, column: 4, scope: !235)
!244 = !DILocation(line: 55, column: 11, scope: !235)
!245 = !DILocation(line: 55, column: 19, scope: !235)
!246 = !DILocation(line: 55, column: 4, scope: !235)
!247 = !DILocation(line: 56, column: 5, scope: !235)
!248 = !DILocation(line: 56, column: 11, scope: !235)
!249 = !DILocation(line: 57, column: 3, scope: !235)
!250 = !DILocation(line: 58, column: 7, scope: !251)
!251 = distinct !DILexicalBlock(scope: !89, file: !3, line: 58, column: 7)
!252 = !DILocation(line: 58, column: 7, scope: !89)
!253 = !DILocation(line: 58, column: 18, scope: !251)
!254 = !DILocation(line: 58, column: 21, scope: !251)
!255 = !DILocation(line: 58, column: 10, scope: !251)
!256 = !DILocation(line: 59, column: 40, scope: !89)
!257 = !DILocation(line: 59, column: 42, scope: !89)
!258 = !DILocation(line: 59, column: 47, scope: !89)
!259 = !DILocation(line: 59, column: 49, scope: !89)
!260 = !DILocation(line: 59, column: 3, scope: !89)
!261 = !DILocation(line: 61, column: 10, scope: !89)
!262 = !DILocation(line: 61, column: 3, scope: !89)
!263 = !DILocation(line: 62, column: 3, scope: !89)
!264 = distinct !{!264, !87, !265}
!265 = !DILocation(line: 63, column: 2, scope: !62)
!266 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 66, type: !267, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!267 = !DISubroutineType(types: !268)
!268 = !{!8, !8, !269}
!269 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !270, size: 64)
!270 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !271, size: 64)
!271 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!272 = !DILocalVariable(name: "c", arg: 1, scope: !266, file: !3, line: 66, type: !8)
!273 = !DILocation(line: 66, column: 14, scope: !266)
!274 = !DILocalVariable(name: "v", arg: 2, scope: !266, file: !3, line: 66, type: !269)
!275 = !DILocation(line: 66, column: 24, scope: !266)
!276 = !DILocation(line: 68, column: 6, scope: !277)
!277 = distinct !DILexicalBlock(scope: !266, file: !3, line: 68, column: 6)
!278 = !DILocation(line: 68, column: 8, scope: !277)
!279 = !DILocation(line: 68, column: 6, scope: !266)
!280 = !DILocation(line: 68, column: 22, scope: !277)
!281 = !DILocation(line: 68, column: 17, scope: !277)
!282 = !DILocation(line: 68, column: 15, scope: !277)
!283 = !DILocation(line: 68, column: 13, scope: !277)
!284 = !DILocation(line: 69, column: 6, scope: !285)
!285 = distinct !DILexicalBlock(scope: !266, file: !3, line: 69, column: 6)
!286 = !DILocation(line: 69, column: 8, scope: !285)
!287 = !DILocation(line: 69, column: 6, scope: !266)
!288 = !DILocation(line: 69, column: 22, scope: !285)
!289 = !DILocation(line: 69, column: 17, scope: !285)
!290 = !DILocation(line: 69, column: 15, scope: !285)
!291 = !DILocation(line: 69, column: 13, scope: !285)
!292 = !DILocation(line: 70, column: 6, scope: !293)
!293 = distinct !DILexicalBlock(scope: !266, file: !3, line: 70, column: 6)
!294 = !DILocation(line: 70, column: 8, scope: !293)
!295 = !DILocation(line: 70, column: 6, scope: !266)
!296 = !DILocation(line: 70, column: 16, scope: !293)
!297 = !DILocation(line: 70, column: 14, scope: !293)
!298 = !DILocation(line: 71, column: 6, scope: !299)
!299 = distinct !DILexicalBlock(scope: !266, file: !3, line: 71, column: 6)
!300 = !DILocation(line: 71, column: 8, scope: !299)
!301 = !DILocation(line: 71, column: 6, scope: !266)
!302 = !DILocation(line: 71, column: 16, scope: !299)
!303 = !DILocation(line: 71, column: 14, scope: !299)
!304 = !DILocation(line: 73, column: 2, scope: !266)
!305 = !DILocation(line: 74, column: 2, scope: !266)
