; ModuleID = 'cut-a-rectangle-1.bc'
source_filename = "cut-a-rectangle-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@grid = dso_local global i8* null, align 8, !dbg !0
@h = common dso_local global i32 0, align 4, !dbg !9
@w = common dso_local global i32 0, align 4, !dbg !6
@cnt = common dso_local global i64 0, align 8, !dbg !13
@len = common dso_local global i32 0, align 4, !dbg !11
@next = internal global [4 x i32] zeroinitializer, align 16, !dbg !16
@dir = internal global [4 x [2 x i32]] [[2 x i32] [i32 0, i32 -1], [2 x i32] [i32 -1, i32 0], [2 x i32] [i32 0, i32 1], [2 x i32] [i32 1, i32 0]], align 16, !dbg !21
@.str = private unnamed_addr constant [15 x i8] c"%d x %d: %llu\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @walk(i32 %y, i32 %x) #0 !dbg !33 {
entry:
  %y.addr = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %t = alloca i32, align 4
  store i32 %y, i32* %y.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %y.addr, metadata !36, metadata !DIExpression()), !dbg !37
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %i, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i32* %t, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load i32, i32* %y.addr, align 4, !dbg !44
  %tobool = icmp ne i32 %0, 0, !dbg !44
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !46

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %y.addr, align 4, !dbg !47
  %2 = load i32, i32* @h, align 4, !dbg !48
  %cmp = icmp eq i32 %1, %2, !dbg !49
  br i1 %cmp, label %if.then, label %lor.lhs.false1, !dbg !50

lor.lhs.false1:                                   ; preds = %lor.lhs.false
  %3 = load i32, i32* %x.addr, align 4, !dbg !51
  %tobool2 = icmp ne i32 %3, 0, !dbg !51
  br i1 %tobool2, label %lor.lhs.false3, label %if.then, !dbg !52

lor.lhs.false3:                                   ; preds = %lor.lhs.false1
  %4 = load i32, i32* %x.addr, align 4, !dbg !53
  %5 = load i32, i32* @w, align 4, !dbg !54
  %cmp4 = icmp eq i32 %4, %5, !dbg !55
  br i1 %cmp4, label %if.then, label %if.end, !dbg !56

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false1, %lor.lhs.false, %entry
  %6 = load i64, i64* @cnt, align 8, !dbg !57
  %add = add i64 %6, 2, !dbg !57
  store i64 %add, i64* @cnt, align 8, !dbg !57
  br label %return, !dbg !59

if.end:                                           ; preds = %lor.lhs.false3
  %7 = load i32, i32* %y.addr, align 4, !dbg !60
  %8 = load i32, i32* @w, align 4, !dbg !61
  %add5 = add nsw i32 %8, 1, !dbg !62
  %mul = mul nsw i32 %7, %add5, !dbg !63
  %9 = load i32, i32* %x.addr, align 4, !dbg !64
  %add6 = add nsw i32 %mul, %9, !dbg !65
  store i32 %add6, i32* %t, align 4, !dbg !66
  %10 = load i8*, i8** @grid, align 8, !dbg !67
  %11 = load i32, i32* %t, align 4, !dbg !68
  %idxprom = sext i32 %11 to i64, !dbg !67
  %arrayidx = getelementptr inbounds i8, i8* %10, i64 %idxprom, !dbg !67
  %12 = load i8, i8* %arrayidx, align 1, !dbg !69
  %inc = add i8 %12, 1, !dbg !69
  store i8 %inc, i8* %arrayidx, align 1, !dbg !69
  %13 = load i8*, i8** @grid, align 8, !dbg !70
  %14 = load i32, i32* @len, align 4, !dbg !71
  %15 = load i32, i32* %t, align 4, !dbg !72
  %sub = sub nsw i32 %14, %15, !dbg !73
  %idxprom7 = sext i32 %sub to i64, !dbg !70
  %arrayidx8 = getelementptr inbounds i8, i8* %13, i64 %idxprom7, !dbg !70
  %16 = load i8, i8* %arrayidx8, align 1, !dbg !74
  %inc9 = add i8 %16, 1, !dbg !74
  store i8 %inc9, i8* %arrayidx8, align 1, !dbg !74
  store i32 0, i32* %i, align 4, !dbg !75
  br label %for.cond, !dbg !77

for.cond:                                         ; preds = %for.inc, %if.end
  %17 = load i32, i32* %i, align 4, !dbg !78
  %cmp10 = icmp slt i32 %17, 4, !dbg !80
  br i1 %cmp10, label %for.body, label %for.end, !dbg !81

for.body:                                         ; preds = %for.cond
  %18 = load i8*, i8** @grid, align 8, !dbg !82
  %19 = load i32, i32* %t, align 4, !dbg !84
  %20 = load i32, i32* %i, align 4, !dbg !85
  %idxprom11 = sext i32 %20 to i64, !dbg !86
  %arrayidx12 = getelementptr inbounds [4 x i32], [4 x i32]* @next, i64 0, i64 %idxprom11, !dbg !86
  %21 = load i32, i32* %arrayidx12, align 4, !dbg !86
  %add13 = add nsw i32 %19, %21, !dbg !87
  %idxprom14 = sext i32 %add13 to i64, !dbg !82
  %arrayidx15 = getelementptr inbounds i8, i8* %18, i64 %idxprom14, !dbg !82
  %22 = load i8, i8* %arrayidx15, align 1, !dbg !82
  %tobool16 = icmp ne i8 %22, 0, !dbg !82
  br i1 %tobool16, label %if.end26, label %if.then17, !dbg !88

if.then17:                                        ; preds = %for.body
  %23 = load i32, i32* %y.addr, align 4, !dbg !89
  %24 = load i32, i32* %i, align 4, !dbg !90
  %idxprom18 = sext i32 %24 to i64, !dbg !91
  %arrayidx19 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* @dir, i64 0, i64 %idxprom18, !dbg !91
  %arrayidx20 = getelementptr inbounds [2 x i32], [2 x i32]* %arrayidx19, i64 0, i64 0, !dbg !91
  %25 = load i32, i32* %arrayidx20, align 8, !dbg !91
  %add21 = add nsw i32 %23, %25, !dbg !92
  %26 = load i32, i32* %x.addr, align 4, !dbg !93
  %27 = load i32, i32* %i, align 4, !dbg !94
  %idxprom22 = sext i32 %27 to i64, !dbg !95
  %arrayidx23 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* @dir, i64 0, i64 %idxprom22, !dbg !95
  %arrayidx24 = getelementptr inbounds [2 x i32], [2 x i32]* %arrayidx23, i64 0, i64 1, !dbg !95
  %28 = load i32, i32* %arrayidx24, align 4, !dbg !95
  %add25 = add nsw i32 %26, %28, !dbg !96
  call void @walk(i32 %add21, i32 %add25), !dbg !97
  br label %if.end26, !dbg !97

if.end26:                                         ; preds = %if.then17, %for.body
  br label %for.inc, !dbg !98

for.inc:                                          ; preds = %if.end26
  %29 = load i32, i32* %i, align 4, !dbg !99
  %inc27 = add nsw i32 %29, 1, !dbg !99
  store i32 %inc27, i32* %i, align 4, !dbg !99
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %for.cond
  %30 = load i8*, i8** @grid, align 8, !dbg !103
  %31 = load i32, i32* %t, align 4, !dbg !104
  %idxprom28 = sext i32 %31 to i64, !dbg !103
  %arrayidx29 = getelementptr inbounds i8, i8* %30, i64 %idxprom28, !dbg !103
  %32 = load i8, i8* %arrayidx29, align 1, !dbg !105
  %dec = add i8 %32, -1, !dbg !105
  store i8 %dec, i8* %arrayidx29, align 1, !dbg !105
  %33 = load i8*, i8** @grid, align 8, !dbg !106
  %34 = load i32, i32* @len, align 4, !dbg !107
  %35 = load i32, i32* %t, align 4, !dbg !108
  %sub30 = sub nsw i32 %34, %35, !dbg !109
  %idxprom31 = sext i32 %sub30 to i64, !dbg !106
  %arrayidx32 = getelementptr inbounds i8, i8* %33, i64 %idxprom31, !dbg !106
  %36 = load i8, i8* %arrayidx32, align 1, !dbg !110
  %dec33 = add i8 %36, -1, !dbg !110
  store i8 %dec33, i8* %arrayidx32, align 1, !dbg !110
  br label %return, !dbg !111

return:                                           ; preds = %for.end, %if.then
  ret void, !dbg !111
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @solve(i32 %hh, i32 %ww, i32 %recur) #0 !dbg !112 {
entry:
  %retval = alloca i64, align 8
  %hh.addr = alloca i32, align 4
  %ww.addr = alloca i32, align 4
  %recur.addr = alloca i32, align 4
  %t = alloca i32, align 4
  %cx = alloca i32, align 4
  %cy = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %hh, i32* %hh.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %hh.addr, metadata !115, metadata !DIExpression()), !dbg !116
  store i32 %ww, i32* %ww.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ww.addr, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 %recur, i32* %recur.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %recur.addr, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i32* %t, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i32* %cx, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i32* %cy, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i32* %x, metadata !127, metadata !DIExpression()), !dbg !128
  %0 = load i32, i32* %hh.addr, align 4, !dbg !129
  store i32 %0, i32* @h, align 4, !dbg !130
  %1 = load i32, i32* %ww.addr, align 4, !dbg !131
  store i32 %1, i32* @w, align 4, !dbg !132
  %2 = load i32, i32* @h, align 4, !dbg !133
  %and = and i32 %2, 1, !dbg !135
  %tobool = icmp ne i32 %and, 0, !dbg !135
  br i1 %tobool, label %if.then, label %if.end, !dbg !136

if.then:                                          ; preds = %entry
  %3 = load i32, i32* @w, align 4, !dbg !137
  store i32 %3, i32* %t, align 4, !dbg !138
  %4 = load i32, i32* @h, align 4, !dbg !139
  store i32 %4, i32* @w, align 4, !dbg !140
  %5 = load i32, i32* %t, align 4, !dbg !141
  store i32 %5, i32* @h, align 4, !dbg !142
  br label %if.end, !dbg !143

if.end:                                           ; preds = %if.then, %entry
  %6 = load i32, i32* @h, align 4, !dbg !144
  %and1 = and i32 %6, 1, !dbg !146
  %tobool2 = icmp ne i32 %and1, 0, !dbg !146
  br i1 %tobool2, label %if.then3, label %if.end4, !dbg !147

if.then3:                                         ; preds = %if.end
  store i64 0, i64* %retval, align 8, !dbg !148
  br label %return, !dbg !148

if.end4:                                          ; preds = %if.end
  %7 = load i32, i32* @w, align 4, !dbg !149
  %cmp = icmp eq i32 %7, 1, !dbg !151
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !152

if.then5:                                         ; preds = %if.end4
  store i64 1, i64* %retval, align 8, !dbg !153
  br label %return, !dbg !153

if.end6:                                          ; preds = %if.end4
  %8 = load i32, i32* @w, align 4, !dbg !154
  %cmp7 = icmp eq i32 %8, 2, !dbg !156
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !157

if.then8:                                         ; preds = %if.end6
  %9 = load i32, i32* @h, align 4, !dbg !158
  %conv = sext i32 %9 to i64, !dbg !158
  store i64 %conv, i64* %retval, align 8, !dbg !159
  br label %return, !dbg !159

if.end9:                                          ; preds = %if.end6
  %10 = load i32, i32* @h, align 4, !dbg !160
  %cmp10 = icmp eq i32 %10, 2, !dbg !162
  br i1 %cmp10, label %if.then12, label %if.end14, !dbg !163

if.then12:                                        ; preds = %if.end9
  %11 = load i32, i32* @w, align 4, !dbg !164
  %conv13 = sext i32 %11 to i64, !dbg !164
  store i64 %conv13, i64* %retval, align 8, !dbg !165
  br label %return, !dbg !165

if.end14:                                         ; preds = %if.end9
  %12 = load i32, i32* @h, align 4, !dbg !166
  %div = sdiv i32 %12, 2, !dbg !167
  store i32 %div, i32* %cy, align 4, !dbg !168
  %13 = load i32, i32* @w, align 4, !dbg !169
  %div15 = sdiv i32 %13, 2, !dbg !170
  store i32 %div15, i32* %cx, align 4, !dbg !171
  %14 = load i32, i32* @h, align 4, !dbg !172
  %add = add nsw i32 %14, 1, !dbg !173
  %15 = load i32, i32* @w, align 4, !dbg !174
  %add16 = add nsw i32 %15, 1, !dbg !175
  %mul = mul nsw i32 %add, %add16, !dbg !176
  store i32 %mul, i32* @len, align 4, !dbg !177
  %16 = load i8*, i8** @grid, align 8, !dbg !178
  %17 = load i32, i32* @len, align 4, !dbg !179
  %conv17 = sext i32 %17 to i64, !dbg !179
  %call = call i8* @realloc(i8* %16, i64 %conv17) #5, !dbg !180
  store i8* %call, i8** @grid, align 8, !dbg !181
  %18 = load i8*, i8** @grid, align 8, !dbg !182
  %19 = load i32, i32* @len, align 4, !dbg !183
  %dec = add nsw i32 %19, -1, !dbg !183
  store i32 %dec, i32* @len, align 4, !dbg !183
  %conv18 = sext i32 %19 to i64, !dbg !184
  call void @llvm.memset.p0i8.i64(i8* align 1 %18, i8 0, i64 %conv18, i1 false), !dbg !185
  store i32 -1, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @next, i64 0, i64 0), align 16, !dbg !186
  %20 = load i32, i32* @w, align 4, !dbg !187
  %sub = sub nsw i32 0, %20, !dbg !188
  %sub19 = sub nsw i32 %sub, 1, !dbg !189
  store i32 %sub19, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @next, i64 0, i64 1), align 4, !dbg !190
  store i32 1, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @next, i64 0, i64 2), align 8, !dbg !191
  %21 = load i32, i32* @w, align 4, !dbg !192
  %add20 = add nsw i32 %21, 1, !dbg !193
  store i32 %add20, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @next, i64 0, i64 3), align 4, !dbg !194
  %22 = load i32, i32* %recur.addr, align 4, !dbg !195
  %tobool21 = icmp ne i32 %22, 0, !dbg !195
  br i1 %tobool21, label %if.then22, label %if.end23, !dbg !197

if.then22:                                        ; preds = %if.end14
  store i64 0, i64* @cnt, align 8, !dbg !198
  br label %if.end23, !dbg !199

if.end23:                                         ; preds = %if.then22, %if.end14
  %23 = load i32, i32* %cx, align 4, !dbg !200
  %add24 = add nsw i32 %23, 1, !dbg !202
  store i32 %add24, i32* %x, align 4, !dbg !203
  br label %for.cond, !dbg !204

for.cond:                                         ; preds = %for.inc, %if.end23
  %24 = load i32, i32* %x, align 4, !dbg !205
  %25 = load i32, i32* @w, align 4, !dbg !207
  %cmp25 = icmp slt i32 %24, %25, !dbg !208
  br i1 %cmp25, label %for.body, label %for.end, !dbg !209

for.body:                                         ; preds = %for.cond
  %26 = load i32, i32* %cy, align 4, !dbg !210
  %27 = load i32, i32* @w, align 4, !dbg !212
  %add27 = add nsw i32 %27, 1, !dbg !213
  %mul28 = mul nsw i32 %26, %add27, !dbg !214
  %28 = load i32, i32* %x, align 4, !dbg !215
  %add29 = add nsw i32 %mul28, %28, !dbg !216
  store i32 %add29, i32* %t, align 4, !dbg !217
  %29 = load i8*, i8** @grid, align 8, !dbg !218
  %30 = load i32, i32* %t, align 4, !dbg !219
  %idxprom = sext i32 %30 to i64, !dbg !218
  %arrayidx = getelementptr inbounds i8, i8* %29, i64 %idxprom, !dbg !218
  store i8 1, i8* %arrayidx, align 1, !dbg !220
  %31 = load i8*, i8** @grid, align 8, !dbg !221
  %32 = load i32, i32* @len, align 4, !dbg !222
  %33 = load i32, i32* %t, align 4, !dbg !223
  %sub30 = sub nsw i32 %32, %33, !dbg !224
  %idxprom31 = sext i32 %sub30 to i64, !dbg !221
  %arrayidx32 = getelementptr inbounds i8, i8* %31, i64 %idxprom31, !dbg !221
  store i8 1, i8* %arrayidx32, align 1, !dbg !225
  %34 = load i32, i32* %cy, align 4, !dbg !226
  %sub33 = sub nsw i32 %34, 1, !dbg !227
  %35 = load i32, i32* %x, align 4, !dbg !228
  call void @walk(i32 %sub33, i32 %35), !dbg !229
  br label %for.inc, !dbg !230

for.inc:                                          ; preds = %for.body
  %36 = load i32, i32* %x, align 4, !dbg !231
  %inc = add nsw i32 %36, 1, !dbg !231
  store i32 %inc, i32* %x, align 4, !dbg !231
  br label %for.cond, !dbg !232, !llvm.loop !233

for.end:                                          ; preds = %for.cond
  %37 = load i64, i64* @cnt, align 8, !dbg !235
  %inc34 = add i64 %37, 1, !dbg !235
  store i64 %inc34, i64* @cnt, align 8, !dbg !235
  %38 = load i32, i32* @h, align 4, !dbg !236
  %39 = load i32, i32* @w, align 4, !dbg !238
  %cmp35 = icmp eq i32 %38, %39, !dbg !239
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !240

if.then37:                                        ; preds = %for.end
  %40 = load i64, i64* @cnt, align 8, !dbg !241
  %mul38 = mul i64 %40, 2, !dbg !241
  store i64 %mul38, i64* @cnt, align 8, !dbg !241
  br label %if.end45, !dbg !242

if.else:                                          ; preds = %for.end
  %41 = load i32, i32* @w, align 4, !dbg !243
  %and39 = and i32 %41, 1, !dbg !245
  %tobool40 = icmp ne i32 %and39, 0, !dbg !245
  br i1 %tobool40, label %if.end44, label %land.lhs.true, !dbg !246

land.lhs.true:                                    ; preds = %if.else
  %42 = load i32, i32* %recur.addr, align 4, !dbg !247
  %tobool41 = icmp ne i32 %42, 0, !dbg !247
  br i1 %tobool41, label %if.then42, label %if.end44, !dbg !248

if.then42:                                        ; preds = %land.lhs.true
  %43 = load i32, i32* @w, align 4, !dbg !249
  %44 = load i32, i32* @h, align 4, !dbg !250
  %call43 = call i64 @solve(i32 %43, i32 %44, i32 0), !dbg !251
  br label %if.end44, !dbg !251

if.end44:                                         ; preds = %if.then42, %land.lhs.true, %if.else
  br label %if.end45

if.end45:                                         ; preds = %if.end44, %if.then37
  %45 = load i64, i64* @cnt, align 8, !dbg !252
  store i64 %45, i64* %retval, align 8, !dbg !253
  br label %return, !dbg !253

return:                                           ; preds = %if.end45, %if.then12, %if.then8, %if.then5, %if.then3
  %46 = load i64, i64* %retval, align 8, !dbg !254
  ret i64 %46, !dbg !254
}

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !255 {
entry:
  %retval = alloca i32, align 4
  %y = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %y, metadata !258, metadata !DIExpression()), !dbg !259
  call void @llvm.dbg.declare(metadata i32* %x, metadata !260, metadata !DIExpression()), !dbg !261
  store i32 1, i32* %y, align 4, !dbg !262
  br label %for.cond, !dbg !264

for.cond:                                         ; preds = %for.inc7, %entry
  %0 = load i32, i32* %y, align 4, !dbg !265
  %cmp = icmp sle i32 %0, 10, !dbg !267
  br i1 %cmp, label %for.body, label %for.end9, !dbg !268

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %x, align 4, !dbg !269
  br label %for.cond1, !dbg !271

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %x, align 4, !dbg !272
  %2 = load i32, i32* %y, align 4, !dbg !274
  %cmp2 = icmp sle i32 %1, %2, !dbg !275
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !276

for.body3:                                        ; preds = %for.cond1
  %3 = load i32, i32* %x, align 4, !dbg !277
  %and = and i32 %3, 1, !dbg !279
  %tobool = icmp ne i32 %and, 0, !dbg !279
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !280

lor.lhs.false:                                    ; preds = %for.body3
  %4 = load i32, i32* %y, align 4, !dbg !281
  %and4 = and i32 %4, 1, !dbg !282
  %tobool5 = icmp ne i32 %and4, 0, !dbg !282
  br i1 %tobool5, label %if.end, label %if.then, !dbg !283

if.then:                                          ; preds = %lor.lhs.false, %for.body3
  %5 = load i32, i32* %y, align 4, !dbg !284
  %6 = load i32, i32* %x, align 4, !dbg !285
  %7 = load i32, i32* %y, align 4, !dbg !286
  %8 = load i32, i32* %x, align 4, !dbg !287
  %call = call i64 @solve(i32 %7, i32 %8, i32 1), !dbg !288
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i32 %5, i32 %6, i64 %call), !dbg !289
  br label %if.end, !dbg !289

if.end:                                           ; preds = %if.then, %lor.lhs.false
  br label %for.inc, !dbg !290

for.inc:                                          ; preds = %if.end
  %9 = load i32, i32* %x, align 4, !dbg !291
  %inc = add nsw i32 %9, 1, !dbg !291
  store i32 %inc, i32* %x, align 4, !dbg !291
  br label %for.cond1, !dbg !292, !llvm.loop !293

for.end:                                          ; preds = %for.cond1
  br label %for.inc7, !dbg !294

for.inc7:                                         ; preds = %for.end
  %10 = load i32, i32* %y, align 4, !dbg !295
  %inc8 = add nsw i32 %10, 1, !dbg !295
  store i32 %inc8, i32* %y, align 4, !dbg !295
  br label %for.cond, !dbg !296, !llvm.loop !297

for.end9:                                         ; preds = %for.cond
  ret i32 0, !dbg !299
}

declare dso_local i32 @printf(i8*, ...) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!29, !30, !31}
!llvm.ident = !{!32}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "grid", scope: !2, file: !3, line: 6, type: !26, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "cut-a-rectangle-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Cut-a-rectangle")
!4 = !{}
!5 = !{!0, !6, !9, !11, !13, !16, !21}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "w", scope: !2, file: !3, line: 8, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "h", scope: !2, file: !3, line: 8, type: !8, isLocal: false, isDefinition: true)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "len", scope: !2, file: !3, line: 8, type: !8, isLocal: false, isDefinition: true)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "cnt", scope: !2, file: !3, line: 9, type: !15, isLocal: false, isDefinition: true)
!15 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "next", scope: !2, file: !3, line: 11, type: !18, isLocal: true, isDefinition: true)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 128, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 4)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "dir", scope: !2, file: !3, line: 11, type: !23, isLocal: true, isDefinition: true)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 256, elements: !24)
!24 = !{!20, !25}
!25 = !DISubrange(count: 2)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "byte", file: !3, line: 5, baseType: !28)
!28 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!29 = !{i32 7, !"Dwarf Version", i32 4}
!30 = !{i32 2, !"Debug Info Version", i32 3}
!31 = !{i32 1, !"wchar_size", i32 4}
!32 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!33 = distinct !DISubprogram(name: "walk", scope: !3, file: !3, line: 12, type: !34, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!34 = !DISubroutineType(types: !35)
!35 = !{null, !8, !8}
!36 = !DILocalVariable(name: "y", arg: 1, scope: !33, file: !3, line: 12, type: !8)
!37 = !DILocation(line: 12, column: 15, scope: !33)
!38 = !DILocalVariable(name: "x", arg: 2, scope: !33, file: !3, line: 12, type: !8)
!39 = !DILocation(line: 12, column: 22, scope: !33)
!40 = !DILocalVariable(name: "i", scope: !33, file: !3, line: 14, type: !8)
!41 = !DILocation(line: 14, column: 6, scope: !33)
!42 = !DILocalVariable(name: "t", scope: !33, file: !3, line: 14, type: !8)
!43 = !DILocation(line: 14, column: 9, scope: !33)
!44 = !DILocation(line: 16, column: 7, scope: !45)
!45 = distinct !DILexicalBlock(scope: !33, file: !3, line: 16, column: 6)
!46 = !DILocation(line: 16, column: 9, scope: !45)
!47 = !DILocation(line: 16, column: 12, scope: !45)
!48 = !DILocation(line: 16, column: 17, scope: !45)
!49 = !DILocation(line: 16, column: 14, scope: !45)
!50 = !DILocation(line: 16, column: 19, scope: !45)
!51 = !DILocation(line: 16, column: 23, scope: !45)
!52 = !DILocation(line: 16, column: 25, scope: !45)
!53 = !DILocation(line: 16, column: 28, scope: !45)
!54 = !DILocation(line: 16, column: 33, scope: !45)
!55 = !DILocation(line: 16, column: 30, scope: !45)
!56 = !DILocation(line: 16, column: 6, scope: !33)
!57 = !DILocation(line: 17, column: 7, scope: !58)
!58 = distinct !DILexicalBlock(scope: !45, file: !3, line: 16, column: 36)
!59 = !DILocation(line: 18, column: 3, scope: !58)
!60 = !DILocation(line: 21, column: 6, scope: !33)
!61 = !DILocation(line: 21, column: 11, scope: !33)
!62 = !DILocation(line: 21, column: 13, scope: !33)
!63 = !DILocation(line: 21, column: 8, scope: !33)
!64 = !DILocation(line: 21, column: 20, scope: !33)
!65 = !DILocation(line: 21, column: 18, scope: !33)
!66 = !DILocation(line: 21, column: 4, scope: !33)
!67 = !DILocation(line: 22, column: 2, scope: !33)
!68 = !DILocation(line: 22, column: 7, scope: !33)
!69 = !DILocation(line: 22, column: 9, scope: !33)
!70 = !DILocation(line: 22, column: 13, scope: !33)
!71 = !DILocation(line: 22, column: 18, scope: !33)
!72 = !DILocation(line: 22, column: 24, scope: !33)
!73 = !DILocation(line: 22, column: 22, scope: !33)
!74 = !DILocation(line: 22, column: 26, scope: !33)
!75 = !DILocation(line: 24, column: 9, scope: !76)
!76 = distinct !DILexicalBlock(scope: !33, file: !3, line: 24, column: 2)
!77 = !DILocation(line: 24, column: 7, scope: !76)
!78 = !DILocation(line: 24, column: 14, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !3, line: 24, column: 2)
!80 = !DILocation(line: 24, column: 16, scope: !79)
!81 = !DILocation(line: 24, column: 2, scope: !76)
!82 = !DILocation(line: 25, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !3, line: 25, column: 7)
!84 = !DILocation(line: 25, column: 13, scope: !83)
!85 = !DILocation(line: 25, column: 22, scope: !83)
!86 = !DILocation(line: 25, column: 17, scope: !83)
!87 = !DILocation(line: 25, column: 15, scope: !83)
!88 = !DILocation(line: 25, column: 7, scope: !79)
!89 = !DILocation(line: 26, column: 9, scope: !83)
!90 = !DILocation(line: 26, column: 17, scope: !83)
!91 = !DILocation(line: 26, column: 13, scope: !83)
!92 = !DILocation(line: 26, column: 11, scope: !83)
!93 = !DILocation(line: 26, column: 24, scope: !83)
!94 = !DILocation(line: 26, column: 32, scope: !83)
!95 = !DILocation(line: 26, column: 28, scope: !83)
!96 = !DILocation(line: 26, column: 26, scope: !83)
!97 = !DILocation(line: 26, column: 4, scope: !83)
!98 = !DILocation(line: 25, column: 24, scope: !83)
!99 = !DILocation(line: 24, column: 22, scope: !79)
!100 = !DILocation(line: 24, column: 2, scope: !79)
!101 = distinct !{!101, !81, !102}
!102 = !DILocation(line: 26, column: 37, scope: !76)
!103 = !DILocation(line: 28, column: 2, scope: !33)
!104 = !DILocation(line: 28, column: 7, scope: !33)
!105 = !DILocation(line: 28, column: 9, scope: !33)
!106 = !DILocation(line: 28, column: 13, scope: !33)
!107 = !DILocation(line: 28, column: 18, scope: !33)
!108 = !DILocation(line: 28, column: 24, scope: !33)
!109 = !DILocation(line: 28, column: 22, scope: !33)
!110 = !DILocation(line: 28, column: 26, scope: !33)
!111 = !DILocation(line: 29, column: 1, scope: !33)
!112 = distinct !DISubprogram(name: "solve", scope: !3, file: !3, line: 31, type: !113, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DISubroutineType(types: !114)
!114 = !{!15, !8, !8, !8}
!115 = !DILocalVariable(name: "hh", arg: 1, scope: !112, file: !3, line: 31, type: !8)
!116 = !DILocation(line: 31, column: 30, scope: !112)
!117 = !DILocalVariable(name: "ww", arg: 2, scope: !112, file: !3, line: 31, type: !8)
!118 = !DILocation(line: 31, column: 38, scope: !112)
!119 = !DILocalVariable(name: "recur", arg: 3, scope: !112, file: !3, line: 31, type: !8)
!120 = !DILocation(line: 31, column: 46, scope: !112)
!121 = !DILocalVariable(name: "t", scope: !112, file: !3, line: 33, type: !8)
!122 = !DILocation(line: 33, column: 6, scope: !112)
!123 = !DILocalVariable(name: "cx", scope: !112, file: !3, line: 33, type: !8)
!124 = !DILocation(line: 33, column: 9, scope: !112)
!125 = !DILocalVariable(name: "cy", scope: !112, file: !3, line: 33, type: !8)
!126 = !DILocation(line: 33, column: 13, scope: !112)
!127 = !DILocalVariable(name: "x", scope: !112, file: !3, line: 33, type: !8)
!128 = !DILocation(line: 33, column: 17, scope: !112)
!129 = !DILocation(line: 35, column: 6, scope: !112)
!130 = !DILocation(line: 35, column: 4, scope: !112)
!131 = !DILocation(line: 35, column: 14, scope: !112)
!132 = !DILocation(line: 35, column: 12, scope: !112)
!133 = !DILocation(line: 37, column: 6, scope: !134)
!134 = distinct !DILexicalBlock(scope: !112, file: !3, line: 37, column: 6)
!135 = !DILocation(line: 37, column: 8, scope: !134)
!136 = !DILocation(line: 37, column: 6, scope: !112)
!137 = !DILocation(line: 37, column: 17, scope: !134)
!138 = !DILocation(line: 37, column: 15, scope: !134)
!139 = !DILocation(line: 37, column: 24, scope: !134)
!140 = !DILocation(line: 37, column: 22, scope: !134)
!141 = !DILocation(line: 37, column: 31, scope: !134)
!142 = !DILocation(line: 37, column: 29, scope: !134)
!143 = !DILocation(line: 37, column: 13, scope: !134)
!144 = !DILocation(line: 38, column: 6, scope: !145)
!145 = distinct !DILexicalBlock(scope: !112, file: !3, line: 38, column: 6)
!146 = !DILocation(line: 38, column: 8, scope: !145)
!147 = !DILocation(line: 38, column: 6, scope: !112)
!148 = !DILocation(line: 38, column: 13, scope: !145)
!149 = !DILocation(line: 39, column: 6, scope: !150)
!150 = distinct !DILexicalBlock(scope: !112, file: !3, line: 39, column: 6)
!151 = !DILocation(line: 39, column: 8, scope: !150)
!152 = !DILocation(line: 39, column: 6, scope: !112)
!153 = !DILocation(line: 39, column: 14, scope: !150)
!154 = !DILocation(line: 40, column: 6, scope: !155)
!155 = distinct !DILexicalBlock(scope: !112, file: !3, line: 40, column: 6)
!156 = !DILocation(line: 40, column: 8, scope: !155)
!157 = !DILocation(line: 40, column: 6, scope: !112)
!158 = !DILocation(line: 40, column: 21, scope: !155)
!159 = !DILocation(line: 40, column: 14, scope: !155)
!160 = !DILocation(line: 41, column: 6, scope: !161)
!161 = distinct !DILexicalBlock(scope: !112, file: !3, line: 41, column: 6)
!162 = !DILocation(line: 41, column: 8, scope: !161)
!163 = !DILocation(line: 41, column: 6, scope: !112)
!164 = !DILocation(line: 41, column: 21, scope: !161)
!165 = !DILocation(line: 41, column: 14, scope: !161)
!166 = !DILocation(line: 43, column: 7, scope: !112)
!167 = !DILocation(line: 43, column: 9, scope: !112)
!168 = !DILocation(line: 43, column: 5, scope: !112)
!169 = !DILocation(line: 43, column: 19, scope: !112)
!170 = !DILocation(line: 43, column: 21, scope: !112)
!171 = !DILocation(line: 43, column: 17, scope: !112)
!172 = !DILocation(line: 45, column: 9, scope: !112)
!173 = !DILocation(line: 45, column: 11, scope: !112)
!174 = !DILocation(line: 45, column: 19, scope: !112)
!175 = !DILocation(line: 45, column: 21, scope: !112)
!176 = !DILocation(line: 45, column: 16, scope: !112)
!177 = !DILocation(line: 45, column: 6, scope: !112)
!178 = !DILocation(line: 46, column: 17, scope: !112)
!179 = !DILocation(line: 46, column: 23, scope: !112)
!180 = !DILocation(line: 46, column: 9, scope: !112)
!181 = !DILocation(line: 46, column: 7, scope: !112)
!182 = !DILocation(line: 47, column: 9, scope: !112)
!183 = !DILocation(line: 47, column: 21, scope: !112)
!184 = !DILocation(line: 47, column: 18, scope: !112)
!185 = !DILocation(line: 47, column: 2, scope: !112)
!186 = !DILocation(line: 49, column: 10, scope: !112)
!187 = !DILocation(line: 50, column: 13, scope: !112)
!188 = !DILocation(line: 50, column: 12, scope: !112)
!189 = !DILocation(line: 50, column: 15, scope: !112)
!190 = !DILocation(line: 50, column: 10, scope: !112)
!191 = !DILocation(line: 51, column: 10, scope: !112)
!192 = !DILocation(line: 52, column: 12, scope: !112)
!193 = !DILocation(line: 52, column: 14, scope: !112)
!194 = !DILocation(line: 52, column: 10, scope: !112)
!195 = !DILocation(line: 54, column: 6, scope: !196)
!196 = distinct !DILexicalBlock(scope: !112, file: !3, line: 54, column: 6)
!197 = !DILocation(line: 54, column: 6, scope: !112)
!198 = !DILocation(line: 54, column: 17, scope: !196)
!199 = !DILocation(line: 54, column: 13, scope: !196)
!200 = !DILocation(line: 55, column: 11, scope: !201)
!201 = distinct !DILexicalBlock(scope: !112, file: !3, line: 55, column: 2)
!202 = !DILocation(line: 55, column: 14, scope: !201)
!203 = !DILocation(line: 55, column: 9, scope: !201)
!204 = !DILocation(line: 55, column: 7, scope: !201)
!205 = !DILocation(line: 55, column: 19, scope: !206)
!206 = distinct !DILexicalBlock(scope: !201, file: !3, line: 55, column: 2)
!207 = !DILocation(line: 55, column: 23, scope: !206)
!208 = !DILocation(line: 55, column: 21, scope: !206)
!209 = !DILocation(line: 55, column: 2, scope: !201)
!210 = !DILocation(line: 56, column: 7, scope: !211)
!211 = distinct !DILexicalBlock(scope: !206, file: !3, line: 55, column: 31)
!212 = !DILocation(line: 56, column: 13, scope: !211)
!213 = !DILocation(line: 56, column: 15, scope: !211)
!214 = !DILocation(line: 56, column: 10, scope: !211)
!215 = !DILocation(line: 56, column: 22, scope: !211)
!216 = !DILocation(line: 56, column: 20, scope: !211)
!217 = !DILocation(line: 56, column: 5, scope: !211)
!218 = !DILocation(line: 57, column: 3, scope: !211)
!219 = !DILocation(line: 57, column: 8, scope: !211)
!220 = !DILocation(line: 57, column: 11, scope: !211)
!221 = !DILocation(line: 58, column: 3, scope: !211)
!222 = !DILocation(line: 58, column: 8, scope: !211)
!223 = !DILocation(line: 58, column: 14, scope: !211)
!224 = !DILocation(line: 58, column: 12, scope: !211)
!225 = !DILocation(line: 58, column: 17, scope: !211)
!226 = !DILocation(line: 59, column: 8, scope: !211)
!227 = !DILocation(line: 59, column: 11, scope: !211)
!228 = !DILocation(line: 59, column: 16, scope: !211)
!229 = !DILocation(line: 59, column: 3, scope: !211)
!230 = !DILocation(line: 60, column: 2, scope: !211)
!231 = !DILocation(line: 55, column: 27, scope: !206)
!232 = !DILocation(line: 55, column: 2, scope: !206)
!233 = distinct !{!233, !209, !234}
!234 = !DILocation(line: 60, column: 2, scope: !201)
!235 = !DILocation(line: 61, column: 5, scope: !112)
!236 = !DILocation(line: 63, column: 6, scope: !237)
!237 = distinct !DILexicalBlock(scope: !112, file: !3, line: 63, column: 6)
!238 = !DILocation(line: 63, column: 11, scope: !237)
!239 = !DILocation(line: 63, column: 8, scope: !237)
!240 = !DILocation(line: 63, column: 6, scope: !112)
!241 = !DILocation(line: 64, column: 7, scope: !237)
!242 = !DILocation(line: 64, column: 3, scope: !237)
!243 = !DILocation(line: 65, column: 13, scope: !244)
!244 = distinct !DILexicalBlock(scope: !237, file: !3, line: 65, column: 11)
!245 = !DILocation(line: 65, column: 15, scope: !244)
!246 = !DILocation(line: 65, column: 20, scope: !244)
!247 = !DILocation(line: 65, column: 23, scope: !244)
!248 = !DILocation(line: 65, column: 11, scope: !237)
!249 = !DILocation(line: 66, column: 9, scope: !244)
!250 = !DILocation(line: 66, column: 12, scope: !244)
!251 = !DILocation(line: 66, column: 3, scope: !244)
!252 = !DILocation(line: 68, column: 9, scope: !112)
!253 = !DILocation(line: 68, column: 2, scope: !112)
!254 = !DILocation(line: 69, column: 1, scope: !112)
!255 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 71, type: !256, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!256 = !DISubroutineType(types: !257)
!257 = !{!8}
!258 = !DILocalVariable(name: "y", scope: !255, file: !3, line: 73, type: !8)
!259 = !DILocation(line: 73, column: 6, scope: !255)
!260 = !DILocalVariable(name: "x", scope: !255, file: !3, line: 73, type: !8)
!261 = !DILocation(line: 73, column: 9, scope: !255)
!262 = !DILocation(line: 74, column: 9, scope: !263)
!263 = distinct !DILexicalBlock(scope: !255, file: !3, line: 74, column: 2)
!264 = !DILocation(line: 74, column: 7, scope: !263)
!265 = !DILocation(line: 74, column: 14, scope: !266)
!266 = distinct !DILexicalBlock(scope: !263, file: !3, line: 74, column: 2)
!267 = !DILocation(line: 74, column: 16, scope: !266)
!268 = !DILocation(line: 74, column: 2, scope: !263)
!269 = !DILocation(line: 75, column: 10, scope: !270)
!270 = distinct !DILexicalBlock(scope: !266, file: !3, line: 75, column: 3)
!271 = !DILocation(line: 75, column: 8, scope: !270)
!272 = !DILocation(line: 75, column: 15, scope: !273)
!273 = distinct !DILexicalBlock(scope: !270, file: !3, line: 75, column: 3)
!274 = !DILocation(line: 75, column: 20, scope: !273)
!275 = !DILocation(line: 75, column: 17, scope: !273)
!276 = !DILocation(line: 75, column: 3, scope: !270)
!277 = !DILocation(line: 76, column: 10, scope: !278)
!278 = distinct !DILexicalBlock(scope: !273, file: !3, line: 76, column: 8)
!279 = !DILocation(line: 76, column: 12, scope: !278)
!280 = !DILocation(line: 76, column: 17, scope: !278)
!281 = !DILocation(line: 76, column: 22, scope: !278)
!282 = !DILocation(line: 76, column: 24, scope: !278)
!283 = !DILocation(line: 76, column: 8, scope: !273)
!284 = !DILocation(line: 77, column: 31, scope: !278)
!285 = !DILocation(line: 77, column: 34, scope: !278)
!286 = !DILocation(line: 77, column: 43, scope: !278)
!287 = !DILocation(line: 77, column: 46, scope: !278)
!288 = !DILocation(line: 77, column: 37, scope: !278)
!289 = !DILocation(line: 77, column: 5, scope: !278)
!290 = !DILocation(line: 76, column: 27, scope: !278)
!291 = !DILocation(line: 75, column: 24, scope: !273)
!292 = !DILocation(line: 75, column: 3, scope: !273)
!293 = distinct !{!293, !276, !294}
!294 = !DILocation(line: 77, column: 51, scope: !270)
!295 = !DILocation(line: 74, column: 24, scope: !266)
!296 = !DILocation(line: 74, column: 2, scope: !266)
!297 = distinct !{!297, !268, !298}
!298 = !DILocation(line: 77, column: 51, scope: !263)
!299 = !DILocation(line: 79, column: 2, scope: !255)
