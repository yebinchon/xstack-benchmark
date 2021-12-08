; ModuleID = 'cut-a-rectangle-1.ll'
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
  call void @llvm.dbg.value(metadata i32 %y, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.value(metadata i32 %x, metadata !38, metadata !DIExpression()), !dbg !37
  %tobool = icmp ne i32 %y, 0, !dbg !39
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !41

lor.lhs.false:                                    ; preds = %entry
  %0 = load i32, i32* @h, align 4, !dbg !42
  %cmp = icmp eq i32 %y, %0, !dbg !43
  br i1 %cmp, label %if.then, label %lor.lhs.false1, !dbg !44

lor.lhs.false1:                                   ; preds = %lor.lhs.false
  %tobool2 = icmp ne i32 %x, 0, !dbg !45
  br i1 %tobool2, label %lor.lhs.false3, label %if.then, !dbg !46

lor.lhs.false3:                                   ; preds = %lor.lhs.false1
  %1 = load i32, i32* @w, align 4, !dbg !47
  %cmp4 = icmp eq i32 %x, %1, !dbg !48
  br i1 %cmp4, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false1, %lor.lhs.false, %entry
  %2 = load i64, i64* @cnt, align 8, !dbg !50
  %add = add i64 %2, 2, !dbg !50
  store i64 %add, i64* @cnt, align 8, !dbg !50
  br label %return, !dbg !52

if.end:                                           ; preds = %lor.lhs.false3
  %3 = load i32, i32* @w, align 4, !dbg !53
  %add5 = add nsw i32 %3, 1, !dbg !54
  %mul = mul nsw i32 %y, %add5, !dbg !55
  %add6 = add nsw i32 %mul, %x, !dbg !56
  call void @llvm.dbg.value(metadata i32 %add6, metadata !57, metadata !DIExpression()), !dbg !37
  %4 = load i8*, i8** @grid, align 8, !dbg !58
  %idxprom = sext i32 %add6 to i64, !dbg !58
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %idxprom, !dbg !58
  %5 = load i8, i8* %arrayidx, align 1, !dbg !59
  %inc = add i8 %5, 1, !dbg !59
  store i8 %inc, i8* %arrayidx, align 1, !dbg !59
  %6 = load i8*, i8** @grid, align 8, !dbg !60
  %7 = load i32, i32* @len, align 4, !dbg !61
  %sub = sub nsw i32 %7, %add6, !dbg !62
  %idxprom7 = sext i32 %sub to i64, !dbg !60
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i64 %idxprom7, !dbg !60
  %8 = load i8, i8* %arrayidx8, align 1, !dbg !63
  %inc9 = add i8 %8, 1, !dbg !63
  store i8 %inc9, i8* %arrayidx8, align 1, !dbg !63
  call void @llvm.dbg.value(metadata i32 0, metadata !64, metadata !DIExpression()), !dbg !37
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ 0, %if.end ], [ %inc27, %for.inc ], !dbg !67
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !64, metadata !DIExpression()), !dbg !37
  %cmp10 = icmp slt i32 %i.0, 4, !dbg !68
  br i1 %cmp10, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** @grid, align 8, !dbg !71
  %idxprom11 = sext i32 %i.0 to i64, !dbg !73
  %arrayidx12 = getelementptr inbounds [4 x i32], [4 x i32]* @next, i64 0, i64 %idxprom11, !dbg !73
  %10 = load i32, i32* %arrayidx12, align 4, !dbg !73
  %add13 = add nsw i32 %add6, %10, !dbg !74
  %idxprom14 = sext i32 %add13 to i64, !dbg !71
  %arrayidx15 = getelementptr inbounds i8, i8* %9, i64 %idxprom14, !dbg !71
  %11 = load i8, i8* %arrayidx15, align 1, !dbg !71
  %tobool16 = icmp ne i8 %11, 0, !dbg !71
  br i1 %tobool16, label %if.end26, label %if.then17, !dbg !75

if.then17:                                        ; preds = %for.body
  %idxprom18 = sext i32 %i.0 to i64, !dbg !76
  %arrayidx19 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* @dir, i64 0, i64 %idxprom18, !dbg !76
  %arrayidx20 = getelementptr inbounds [2 x i32], [2 x i32]* %arrayidx19, i64 0, i64 0, !dbg !76
  %12 = load i32, i32* %arrayidx20, align 8, !dbg !76
  %add21 = add nsw i32 %y, %12, !dbg !77
  %idxprom22 = sext i32 %i.0 to i64, !dbg !78
  %arrayidx23 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* @dir, i64 0, i64 %idxprom22, !dbg !78
  %arrayidx24 = getelementptr inbounds [2 x i32], [2 x i32]* %arrayidx23, i64 0, i64 1, !dbg !78
  %13 = load i32, i32* %arrayidx24, align 4, !dbg !78
  %add25 = add nsw i32 %x, %13, !dbg !79
  call void @walk(i32 %add21, i32 %add25), !dbg !80
  br label %if.end26, !dbg !80

if.end26:                                         ; preds = %if.then17, %for.body
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %if.end26
  %inc27 = add nsw i32 %i.0, 1, !dbg !82
  call void @llvm.dbg.value(metadata i32 %inc27, metadata !64, metadata !DIExpression()), !dbg !37
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  %14 = load i8*, i8** @grid, align 8, !dbg !86
  %idxprom28 = sext i32 %add6 to i64, !dbg !86
  %arrayidx29 = getelementptr inbounds i8, i8* %14, i64 %idxprom28, !dbg !86
  %15 = load i8, i8* %arrayidx29, align 1, !dbg !87
  %dec = add i8 %15, -1, !dbg !87
  store i8 %dec, i8* %arrayidx29, align 1, !dbg !87
  %16 = load i8*, i8** @grid, align 8, !dbg !88
  %17 = load i32, i32* @len, align 4, !dbg !89
  %sub30 = sub nsw i32 %17, %add6, !dbg !90
  %idxprom31 = sext i32 %sub30 to i64, !dbg !88
  %arrayidx32 = getelementptr inbounds i8, i8* %16, i64 %idxprom31, !dbg !88
  %18 = load i8, i8* %arrayidx32, align 1, !dbg !91
  %dec33 = add i8 %18, -1, !dbg !91
  store i8 %dec33, i8* %arrayidx32, align 1, !dbg !91
  br label %return, !dbg !92

return:                                           ; preds = %for.end, %if.then
  ret void, !dbg !92
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @solve(i32 %hh, i32 %ww, i32 %recur) #0 !dbg !93 {
entry:
  call void @llvm.dbg.value(metadata i32 %hh, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.value(metadata i32 %ww, metadata !98, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.value(metadata i32 %recur, metadata !99, metadata !DIExpression()), !dbg !97
  store i32 %hh, i32* @h, align 4, !dbg !100
  store i32 %ww, i32* @w, align 4, !dbg !101
  %0 = load i32, i32* @h, align 4, !dbg !102
  %and = and i32 %0, 1, !dbg !104
  %tobool = icmp ne i32 %and, 0, !dbg !104
  br i1 %tobool, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @w, align 4, !dbg !106
  call void @llvm.dbg.value(metadata i32 %1, metadata !107, metadata !DIExpression()), !dbg !97
  %2 = load i32, i32* @h, align 4, !dbg !108
  store i32 %2, i32* @w, align 4, !dbg !109
  store i32 %1, i32* @h, align 4, !dbg !110
  br label %if.end, !dbg !111

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* @h, align 4, !dbg !112
  %and1 = and i32 %3, 1, !dbg !114
  %tobool2 = icmp ne i32 %and1, 0, !dbg !114
  br i1 %tobool2, label %if.then3, label %if.end4, !dbg !115

if.then3:                                         ; preds = %if.end
  br label %return, !dbg !116

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* @w, align 4, !dbg !117
  %cmp = icmp eq i32 %4, 1, !dbg !119
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !120

if.then5:                                         ; preds = %if.end4
  br label %return, !dbg !121

if.end6:                                          ; preds = %if.end4
  %5 = load i32, i32* @w, align 4, !dbg !122
  %cmp7 = icmp eq i32 %5, 2, !dbg !124
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !125

if.then8:                                         ; preds = %if.end6
  %6 = load i32, i32* @h, align 4, !dbg !126
  %conv = sext i32 %6 to i64, !dbg !126
  br label %return, !dbg !127

if.end9:                                          ; preds = %if.end6
  %7 = load i32, i32* @h, align 4, !dbg !128
  %cmp10 = icmp eq i32 %7, 2, !dbg !130
  br i1 %cmp10, label %if.then12, label %if.end14, !dbg !131

if.then12:                                        ; preds = %if.end9
  %8 = load i32, i32* @w, align 4, !dbg !132
  %conv13 = sext i32 %8 to i64, !dbg !132
  br label %return, !dbg !133

if.end14:                                         ; preds = %if.end9
  %9 = load i32, i32* @h, align 4, !dbg !134
  %div = sdiv i32 %9, 2, !dbg !135
  call void @llvm.dbg.value(metadata i32 %div, metadata !136, metadata !DIExpression()), !dbg !97
  %10 = load i32, i32* @w, align 4, !dbg !137
  %div15 = sdiv i32 %10, 2, !dbg !138
  call void @llvm.dbg.value(metadata i32 %div15, metadata !139, metadata !DIExpression()), !dbg !97
  %11 = load i32, i32* @h, align 4, !dbg !140
  %add = add nsw i32 %11, 1, !dbg !141
  %12 = load i32, i32* @w, align 4, !dbg !142
  %add16 = add nsw i32 %12, 1, !dbg !143
  %mul = mul nsw i32 %add, %add16, !dbg !144
  store i32 %mul, i32* @len, align 4, !dbg !145
  %13 = load i8*, i8** @grid, align 8, !dbg !146
  %14 = load i32, i32* @len, align 4, !dbg !147
  %conv17 = sext i32 %14 to i64, !dbg !147
  %call = call i8* @realloc(i8* %13, i64 %conv17) #5, !dbg !148
  store i8* %call, i8** @grid, align 8, !dbg !149
  %15 = load i8*, i8** @grid, align 8, !dbg !150
  %16 = load i32, i32* @len, align 4, !dbg !151
  %dec = add nsw i32 %16, -1, !dbg !151
  store i32 %dec, i32* @len, align 4, !dbg !151
  %conv18 = sext i32 %16 to i64, !dbg !152
  call void @llvm.memset.p0i8.i64(i8* align 1 %15, i8 0, i64 %conv18, i1 false), !dbg !153
  store i32 -1, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @next, i64 0, i64 0), align 16, !dbg !154
  %17 = load i32, i32* @w, align 4, !dbg !155
  %sub = sub nsw i32 0, %17, !dbg !156
  %sub19 = sub nsw i32 %sub, 1, !dbg !157
  store i32 %sub19, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @next, i64 0, i64 1), align 4, !dbg !158
  store i32 1, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @next, i64 0, i64 2), align 8, !dbg !159
  %18 = load i32, i32* @w, align 4, !dbg !160
  %add20 = add nsw i32 %18, 1, !dbg !161
  store i32 %add20, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @next, i64 0, i64 3), align 4, !dbg !162
  %tobool21 = icmp ne i32 %recur, 0, !dbg !163
  br i1 %tobool21, label %if.then22, label %if.end23, !dbg !165

if.then22:                                        ; preds = %if.end14
  store i64 0, i64* @cnt, align 8, !dbg !166
  br label %if.end23, !dbg !167

if.end23:                                         ; preds = %if.then22, %if.end14
  %add24 = add nsw i32 %div15, 1, !dbg !168
  call void @llvm.dbg.value(metadata i32 %add24, metadata !170, metadata !DIExpression()), !dbg !97
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc, %if.end23
  %x.0 = phi i32 [ %add24, %if.end23 ], [ %inc, %for.inc ], !dbg !172
  call void @llvm.dbg.value(metadata i32 %x.0, metadata !170, metadata !DIExpression()), !dbg !97
  %19 = load i32, i32* @w, align 4, !dbg !173
  %cmp25 = icmp slt i32 %x.0, %19, !dbg !175
  br i1 %cmp25, label %for.body, label %for.end, !dbg !176

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* @w, align 4, !dbg !177
  %add27 = add nsw i32 %20, 1, !dbg !179
  %mul28 = mul nsw i32 %div, %add27, !dbg !180
  %add29 = add nsw i32 %mul28, %x.0, !dbg !181
  call void @llvm.dbg.value(metadata i32 %add29, metadata !107, metadata !DIExpression()), !dbg !97
  %21 = load i8*, i8** @grid, align 8, !dbg !182
  %idxprom = sext i32 %add29 to i64, !dbg !182
  %arrayidx = getelementptr inbounds i8, i8* %21, i64 %idxprom, !dbg !182
  store i8 1, i8* %arrayidx, align 1, !dbg !183
  %22 = load i8*, i8** @grid, align 8, !dbg !184
  %23 = load i32, i32* @len, align 4, !dbg !185
  %sub30 = sub nsw i32 %23, %add29, !dbg !186
  %idxprom31 = sext i32 %sub30 to i64, !dbg !184
  %arrayidx32 = getelementptr inbounds i8, i8* %22, i64 %idxprom31, !dbg !184
  store i8 1, i8* %arrayidx32, align 1, !dbg !187
  %sub33 = sub nsw i32 %div, 1, !dbg !188
  call void @walk(i32 %sub33, i32 %x.0), !dbg !189
  br label %for.inc, !dbg !190

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %x.0, 1, !dbg !191
  call void @llvm.dbg.value(metadata i32 %inc, metadata !170, metadata !DIExpression()), !dbg !97
  br label %for.cond, !dbg !192, !llvm.loop !193

for.end:                                          ; preds = %for.cond
  %24 = load i64, i64* @cnt, align 8, !dbg !195
  %inc34 = add i64 %24, 1, !dbg !195
  store i64 %inc34, i64* @cnt, align 8, !dbg !195
  %25 = load i32, i32* @h, align 4, !dbg !196
  %26 = load i32, i32* @w, align 4, !dbg !198
  %cmp35 = icmp eq i32 %25, %26, !dbg !199
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !200

if.then37:                                        ; preds = %for.end
  %27 = load i64, i64* @cnt, align 8, !dbg !201
  %mul38 = mul i64 %27, 2, !dbg !201
  store i64 %mul38, i64* @cnt, align 8, !dbg !201
  br label %if.end45, !dbg !202

if.else:                                          ; preds = %for.end
  %28 = load i32, i32* @w, align 4, !dbg !203
  %and39 = and i32 %28, 1, !dbg !205
  %tobool40 = icmp ne i32 %and39, 0, !dbg !205
  br i1 %tobool40, label %if.end44, label %land.lhs.true, !dbg !206

land.lhs.true:                                    ; preds = %if.else
  %tobool41 = icmp ne i32 %recur, 0, !dbg !207
  br i1 %tobool41, label %if.then42, label %if.end44, !dbg !208

if.then42:                                        ; preds = %land.lhs.true
  %29 = load i32, i32* @w, align 4, !dbg !209
  %30 = load i32, i32* @h, align 4, !dbg !210
  %call43 = call i64 @solve(i32 %29, i32 %30, i32 0), !dbg !211
  br label %if.end44, !dbg !211

if.end44:                                         ; preds = %if.then42, %land.lhs.true, %if.else
  br label %if.end45

if.end45:                                         ; preds = %if.end44, %if.then37
  %31 = load i64, i64* @cnt, align 8, !dbg !212
  br label %return, !dbg !213

return:                                           ; preds = %if.end45, %if.then12, %if.then8, %if.then5, %if.then3
  %retval.0 = phi i64 [ 0, %if.then3 ], [ 1, %if.then5 ], [ %conv, %if.then8 ], [ %conv13, %if.then12 ], [ %31, %if.end45 ], !dbg !97
  ret i64 %retval.0, !dbg !214
}

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !215 {
entry:
  call void @llvm.dbg.value(metadata i32 1, metadata !218, metadata !DIExpression()), !dbg !219
  br label %for.cond, !dbg !220

for.cond:                                         ; preds = %for.inc7, %entry
  %y.0 = phi i32 [ 1, %entry ], [ %inc8, %for.inc7 ], !dbg !222
  call void @llvm.dbg.value(metadata i32 %y.0, metadata !218, metadata !DIExpression()), !dbg !219
  %cmp = icmp sle i32 %y.0, 10, !dbg !223
  br i1 %cmp, label %for.body, label %for.end9, !dbg !225

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 1, metadata !226, metadata !DIExpression()), !dbg !219
  br label %for.cond1, !dbg !227

for.cond1:                                        ; preds = %for.inc, %for.body
  %x.0 = phi i32 [ 1, %for.body ], [ %inc, %for.inc ], !dbg !229
  call void @llvm.dbg.value(metadata i32 %x.0, metadata !226, metadata !DIExpression()), !dbg !219
  %cmp2 = icmp sle i32 %x.0, %y.0, !dbg !230
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !232

for.body3:                                        ; preds = %for.cond1
  %and = and i32 %x.0, 1, !dbg !233
  %tobool = icmp ne i32 %and, 0, !dbg !233
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !235

lor.lhs.false:                                    ; preds = %for.body3
  %and4 = and i32 %y.0, 1, !dbg !236
  %tobool5 = icmp ne i32 %and4, 0, !dbg !236
  br i1 %tobool5, label %if.end, label %if.then, !dbg !237

if.then:                                          ; preds = %lor.lhs.false, %for.body3
  %call = call i64 @solve(i32 %y.0, i32 %x.0, i32 1), !dbg !238
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i32 %y.0, i32 %x.0, i64 %call), !dbg !239
  br label %if.end, !dbg !239

if.end:                                           ; preds = %if.then, %lor.lhs.false
  br label %for.inc, !dbg !240

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %x.0, 1, !dbg !241
  call void @llvm.dbg.value(metadata i32 %inc, metadata !226, metadata !DIExpression()), !dbg !219
  br label %for.cond1, !dbg !242, !llvm.loop !243

for.end:                                          ; preds = %for.cond1
  br label %for.inc7, !dbg !244

for.inc7:                                         ; preds = %for.end
  %inc8 = add nsw i32 %y.0, 1, !dbg !245
  call void @llvm.dbg.value(metadata i32 %inc8, metadata !218, metadata !DIExpression()), !dbg !219
  br label %for.cond, !dbg !246, !llvm.loop !247

for.end9:                                         ; preds = %for.cond
  ret i32 0, !dbg !249
}

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!37 = !DILocation(line: 0, scope: !33)
!38 = !DILocalVariable(name: "x", arg: 2, scope: !33, file: !3, line: 12, type: !8)
!39 = !DILocation(line: 16, column: 7, scope: !40)
!40 = distinct !DILexicalBlock(scope: !33, file: !3, line: 16, column: 6)
!41 = !DILocation(line: 16, column: 9, scope: !40)
!42 = !DILocation(line: 16, column: 17, scope: !40)
!43 = !DILocation(line: 16, column: 14, scope: !40)
!44 = !DILocation(line: 16, column: 19, scope: !40)
!45 = !DILocation(line: 16, column: 23, scope: !40)
!46 = !DILocation(line: 16, column: 25, scope: !40)
!47 = !DILocation(line: 16, column: 33, scope: !40)
!48 = !DILocation(line: 16, column: 30, scope: !40)
!49 = !DILocation(line: 16, column: 6, scope: !33)
!50 = !DILocation(line: 17, column: 7, scope: !51)
!51 = distinct !DILexicalBlock(scope: !40, file: !3, line: 16, column: 36)
!52 = !DILocation(line: 18, column: 3, scope: !51)
!53 = !DILocation(line: 21, column: 11, scope: !33)
!54 = !DILocation(line: 21, column: 13, scope: !33)
!55 = !DILocation(line: 21, column: 8, scope: !33)
!56 = !DILocation(line: 21, column: 18, scope: !33)
!57 = !DILocalVariable(name: "t", scope: !33, file: !3, line: 14, type: !8)
!58 = !DILocation(line: 22, column: 2, scope: !33)
!59 = !DILocation(line: 22, column: 9, scope: !33)
!60 = !DILocation(line: 22, column: 13, scope: !33)
!61 = !DILocation(line: 22, column: 18, scope: !33)
!62 = !DILocation(line: 22, column: 22, scope: !33)
!63 = !DILocation(line: 22, column: 26, scope: !33)
!64 = !DILocalVariable(name: "i", scope: !33, file: !3, line: 14, type: !8)
!65 = !DILocation(line: 24, column: 7, scope: !66)
!66 = distinct !DILexicalBlock(scope: !33, file: !3, line: 24, column: 2)
!67 = !DILocation(line: 0, scope: !66)
!68 = !DILocation(line: 24, column: 16, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !3, line: 24, column: 2)
!70 = !DILocation(line: 24, column: 2, scope: !66)
!71 = !DILocation(line: 25, column: 8, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !3, line: 25, column: 7)
!73 = !DILocation(line: 25, column: 17, scope: !72)
!74 = !DILocation(line: 25, column: 15, scope: !72)
!75 = !DILocation(line: 25, column: 7, scope: !69)
!76 = !DILocation(line: 26, column: 13, scope: !72)
!77 = !DILocation(line: 26, column: 11, scope: !72)
!78 = !DILocation(line: 26, column: 28, scope: !72)
!79 = !DILocation(line: 26, column: 26, scope: !72)
!80 = !DILocation(line: 26, column: 4, scope: !72)
!81 = !DILocation(line: 25, column: 24, scope: !72)
!82 = !DILocation(line: 24, column: 22, scope: !69)
!83 = !DILocation(line: 24, column: 2, scope: !69)
!84 = distinct !{!84, !70, !85}
!85 = !DILocation(line: 26, column: 37, scope: !66)
!86 = !DILocation(line: 28, column: 2, scope: !33)
!87 = !DILocation(line: 28, column: 9, scope: !33)
!88 = !DILocation(line: 28, column: 13, scope: !33)
!89 = !DILocation(line: 28, column: 18, scope: !33)
!90 = !DILocation(line: 28, column: 22, scope: !33)
!91 = !DILocation(line: 28, column: 26, scope: !33)
!92 = !DILocation(line: 29, column: 1, scope: !33)
!93 = distinct !DISubprogram(name: "solve", scope: !3, file: !3, line: 31, type: !94, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!94 = !DISubroutineType(types: !95)
!95 = !{!15, !8, !8, !8}
!96 = !DILocalVariable(name: "hh", arg: 1, scope: !93, file: !3, line: 31, type: !8)
!97 = !DILocation(line: 0, scope: !93)
!98 = !DILocalVariable(name: "ww", arg: 2, scope: !93, file: !3, line: 31, type: !8)
!99 = !DILocalVariable(name: "recur", arg: 3, scope: !93, file: !3, line: 31, type: !8)
!100 = !DILocation(line: 35, column: 4, scope: !93)
!101 = !DILocation(line: 35, column: 12, scope: !93)
!102 = !DILocation(line: 37, column: 6, scope: !103)
!103 = distinct !DILexicalBlock(scope: !93, file: !3, line: 37, column: 6)
!104 = !DILocation(line: 37, column: 8, scope: !103)
!105 = !DILocation(line: 37, column: 6, scope: !93)
!106 = !DILocation(line: 37, column: 17, scope: !103)
!107 = !DILocalVariable(name: "t", scope: !93, file: !3, line: 33, type: !8)
!108 = !DILocation(line: 37, column: 24, scope: !103)
!109 = !DILocation(line: 37, column: 22, scope: !103)
!110 = !DILocation(line: 37, column: 29, scope: !103)
!111 = !DILocation(line: 37, column: 13, scope: !103)
!112 = !DILocation(line: 38, column: 6, scope: !113)
!113 = distinct !DILexicalBlock(scope: !93, file: !3, line: 38, column: 6)
!114 = !DILocation(line: 38, column: 8, scope: !113)
!115 = !DILocation(line: 38, column: 6, scope: !93)
!116 = !DILocation(line: 38, column: 13, scope: !113)
!117 = !DILocation(line: 39, column: 6, scope: !118)
!118 = distinct !DILexicalBlock(scope: !93, file: !3, line: 39, column: 6)
!119 = !DILocation(line: 39, column: 8, scope: !118)
!120 = !DILocation(line: 39, column: 6, scope: !93)
!121 = !DILocation(line: 39, column: 14, scope: !118)
!122 = !DILocation(line: 40, column: 6, scope: !123)
!123 = distinct !DILexicalBlock(scope: !93, file: !3, line: 40, column: 6)
!124 = !DILocation(line: 40, column: 8, scope: !123)
!125 = !DILocation(line: 40, column: 6, scope: !93)
!126 = !DILocation(line: 40, column: 21, scope: !123)
!127 = !DILocation(line: 40, column: 14, scope: !123)
!128 = !DILocation(line: 41, column: 6, scope: !129)
!129 = distinct !DILexicalBlock(scope: !93, file: !3, line: 41, column: 6)
!130 = !DILocation(line: 41, column: 8, scope: !129)
!131 = !DILocation(line: 41, column: 6, scope: !93)
!132 = !DILocation(line: 41, column: 21, scope: !129)
!133 = !DILocation(line: 41, column: 14, scope: !129)
!134 = !DILocation(line: 43, column: 7, scope: !93)
!135 = !DILocation(line: 43, column: 9, scope: !93)
!136 = !DILocalVariable(name: "cy", scope: !93, file: !3, line: 33, type: !8)
!137 = !DILocation(line: 43, column: 19, scope: !93)
!138 = !DILocation(line: 43, column: 21, scope: !93)
!139 = !DILocalVariable(name: "cx", scope: !93, file: !3, line: 33, type: !8)
!140 = !DILocation(line: 45, column: 9, scope: !93)
!141 = !DILocation(line: 45, column: 11, scope: !93)
!142 = !DILocation(line: 45, column: 19, scope: !93)
!143 = !DILocation(line: 45, column: 21, scope: !93)
!144 = !DILocation(line: 45, column: 16, scope: !93)
!145 = !DILocation(line: 45, column: 6, scope: !93)
!146 = !DILocation(line: 46, column: 17, scope: !93)
!147 = !DILocation(line: 46, column: 23, scope: !93)
!148 = !DILocation(line: 46, column: 9, scope: !93)
!149 = !DILocation(line: 46, column: 7, scope: !93)
!150 = !DILocation(line: 47, column: 9, scope: !93)
!151 = !DILocation(line: 47, column: 21, scope: !93)
!152 = !DILocation(line: 47, column: 18, scope: !93)
!153 = !DILocation(line: 47, column: 2, scope: !93)
!154 = !DILocation(line: 49, column: 10, scope: !93)
!155 = !DILocation(line: 50, column: 13, scope: !93)
!156 = !DILocation(line: 50, column: 12, scope: !93)
!157 = !DILocation(line: 50, column: 15, scope: !93)
!158 = !DILocation(line: 50, column: 10, scope: !93)
!159 = !DILocation(line: 51, column: 10, scope: !93)
!160 = !DILocation(line: 52, column: 12, scope: !93)
!161 = !DILocation(line: 52, column: 14, scope: !93)
!162 = !DILocation(line: 52, column: 10, scope: !93)
!163 = !DILocation(line: 54, column: 6, scope: !164)
!164 = distinct !DILexicalBlock(scope: !93, file: !3, line: 54, column: 6)
!165 = !DILocation(line: 54, column: 6, scope: !93)
!166 = !DILocation(line: 54, column: 17, scope: !164)
!167 = !DILocation(line: 54, column: 13, scope: !164)
!168 = !DILocation(line: 55, column: 14, scope: !169)
!169 = distinct !DILexicalBlock(scope: !93, file: !3, line: 55, column: 2)
!170 = !DILocalVariable(name: "x", scope: !93, file: !3, line: 33, type: !8)
!171 = !DILocation(line: 55, column: 7, scope: !169)
!172 = !DILocation(line: 0, scope: !169)
!173 = !DILocation(line: 55, column: 23, scope: !174)
!174 = distinct !DILexicalBlock(scope: !169, file: !3, line: 55, column: 2)
!175 = !DILocation(line: 55, column: 21, scope: !174)
!176 = !DILocation(line: 55, column: 2, scope: !169)
!177 = !DILocation(line: 56, column: 13, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !3, line: 55, column: 31)
!179 = !DILocation(line: 56, column: 15, scope: !178)
!180 = !DILocation(line: 56, column: 10, scope: !178)
!181 = !DILocation(line: 56, column: 20, scope: !178)
!182 = !DILocation(line: 57, column: 3, scope: !178)
!183 = !DILocation(line: 57, column: 11, scope: !178)
!184 = !DILocation(line: 58, column: 3, scope: !178)
!185 = !DILocation(line: 58, column: 8, scope: !178)
!186 = !DILocation(line: 58, column: 12, scope: !178)
!187 = !DILocation(line: 58, column: 17, scope: !178)
!188 = !DILocation(line: 59, column: 11, scope: !178)
!189 = !DILocation(line: 59, column: 3, scope: !178)
!190 = !DILocation(line: 60, column: 2, scope: !178)
!191 = !DILocation(line: 55, column: 27, scope: !174)
!192 = !DILocation(line: 55, column: 2, scope: !174)
!193 = distinct !{!193, !176, !194}
!194 = !DILocation(line: 60, column: 2, scope: !169)
!195 = !DILocation(line: 61, column: 5, scope: !93)
!196 = !DILocation(line: 63, column: 6, scope: !197)
!197 = distinct !DILexicalBlock(scope: !93, file: !3, line: 63, column: 6)
!198 = !DILocation(line: 63, column: 11, scope: !197)
!199 = !DILocation(line: 63, column: 8, scope: !197)
!200 = !DILocation(line: 63, column: 6, scope: !93)
!201 = !DILocation(line: 64, column: 7, scope: !197)
!202 = !DILocation(line: 64, column: 3, scope: !197)
!203 = !DILocation(line: 65, column: 13, scope: !204)
!204 = distinct !DILexicalBlock(scope: !197, file: !3, line: 65, column: 11)
!205 = !DILocation(line: 65, column: 15, scope: !204)
!206 = !DILocation(line: 65, column: 20, scope: !204)
!207 = !DILocation(line: 65, column: 23, scope: !204)
!208 = !DILocation(line: 65, column: 11, scope: !197)
!209 = !DILocation(line: 66, column: 9, scope: !204)
!210 = !DILocation(line: 66, column: 12, scope: !204)
!211 = !DILocation(line: 66, column: 3, scope: !204)
!212 = !DILocation(line: 68, column: 9, scope: !93)
!213 = !DILocation(line: 68, column: 2, scope: !93)
!214 = !DILocation(line: 69, column: 1, scope: !93)
!215 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 71, type: !216, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!216 = !DISubroutineType(types: !217)
!217 = !{!8}
!218 = !DILocalVariable(name: "y", scope: !215, file: !3, line: 73, type: !8)
!219 = !DILocation(line: 0, scope: !215)
!220 = !DILocation(line: 74, column: 7, scope: !221)
!221 = distinct !DILexicalBlock(scope: !215, file: !3, line: 74, column: 2)
!222 = !DILocation(line: 0, scope: !221)
!223 = !DILocation(line: 74, column: 16, scope: !224)
!224 = distinct !DILexicalBlock(scope: !221, file: !3, line: 74, column: 2)
!225 = !DILocation(line: 74, column: 2, scope: !221)
!226 = !DILocalVariable(name: "x", scope: !215, file: !3, line: 73, type: !8)
!227 = !DILocation(line: 75, column: 8, scope: !228)
!228 = distinct !DILexicalBlock(scope: !224, file: !3, line: 75, column: 3)
!229 = !DILocation(line: 0, scope: !228)
!230 = !DILocation(line: 75, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !228, file: !3, line: 75, column: 3)
!232 = !DILocation(line: 75, column: 3, scope: !228)
!233 = !DILocation(line: 76, column: 12, scope: !234)
!234 = distinct !DILexicalBlock(scope: !231, file: !3, line: 76, column: 8)
!235 = !DILocation(line: 76, column: 17, scope: !234)
!236 = !DILocation(line: 76, column: 24, scope: !234)
!237 = !DILocation(line: 76, column: 8, scope: !231)
!238 = !DILocation(line: 77, column: 37, scope: !234)
!239 = !DILocation(line: 77, column: 5, scope: !234)
!240 = !DILocation(line: 76, column: 27, scope: !234)
!241 = !DILocation(line: 75, column: 24, scope: !231)
!242 = !DILocation(line: 75, column: 3, scope: !231)
!243 = distinct !{!243, !232, !244}
!244 = !DILocation(line: 77, column: 51, scope: !228)
!245 = !DILocation(line: 74, column: 24, scope: !224)
!246 = !DILocation(line: 74, column: 2, scope: !224)
!247 = distinct !{!247, !225, !248}
!248 = !DILocation(line: 77, column: 51, scope: !221)
!249 = !DILocation(line: 79, column: 2, scope: !215)
