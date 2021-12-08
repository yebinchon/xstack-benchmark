; ModuleID = 'brazillian_numbers.ll'
source_filename = "brazillian_numbers.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c" odd \00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c" prime \00", align 1
@__const.main.kinds = private unnamed_addr constant [3 x i8*] [i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0)], align 16
@.str.3 = private unnamed_addr constant [30 x i8] c"First 20%sBrazilian numbers:\0A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"\0A\0A\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"The 100,000th Brazilian number: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @same_digits(i32 %n, i32 %b) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 %b, metadata !15, metadata !DIExpression()), !dbg !14
  %rem = srem i32 %n, %b, !dbg !16
  call void @llvm.dbg.value(metadata i32 %rem, metadata !17, metadata !DIExpression()), !dbg !14
  %div = sdiv i32 %n, %b, !dbg !18
  call void @llvm.dbg.value(metadata i32 %div, metadata !13, metadata !DIExpression()), !dbg !14
  br label %while.cond, !dbg !19

while.cond:                                       ; preds = %if.end, %entry
  %n.addr.0 = phi i32 [ %div, %entry ], [ %div3, %if.end ], !dbg !14
  call void @llvm.dbg.value(metadata i32 %n.addr.0, metadata !13, metadata !DIExpression()), !dbg !14
  %cmp = icmp sgt i32 %n.addr.0, 0, !dbg !20
  br i1 %cmp, label %while.body, label %while.end, !dbg !19

while.body:                                       ; preds = %while.cond
  %rem1 = srem i32 %n.addr.0, %b, !dbg !21
  %cmp2 = icmp ne i32 %rem1, %rem, !dbg !24
  br i1 %cmp2, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %while.body
  br label %return, !dbg !26

if.end:                                           ; preds = %while.body
  %div3 = sdiv i32 %n.addr.0, %b, !dbg !27
  call void @llvm.dbg.value(metadata i32 %div3, metadata !13, metadata !DIExpression()), !dbg !14
  br label %while.cond, !dbg !19, !llvm.loop !28

while.end:                                        ; preds = %while.cond
  br label %return, !dbg !30

return:                                           ; preds = %while.end, %if.then
  %retval.0 = phi i8 [ 0, %if.then ], [ 1, %while.end ], !dbg !14
  ret i8 %retval.0, !dbg !31
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @is_brazilian(i32 %n) #0 !dbg !32 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !35, metadata !DIExpression()), !dbg !36
  %cmp = icmp slt i32 %n, 7, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  br label %return, !dbg !40

if.end:                                           ; preds = %entry
  %rem = srem i32 %n, 2, !dbg !41
  %tobool = icmp ne i32 %rem, 0, !dbg !41
  br i1 %tobool, label %if.end3, label %land.lhs.true, !dbg !43

land.lhs.true:                                    ; preds = %if.end
  %cmp1 = icmp sge i32 %n, 8, !dbg !44
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !45

if.then2:                                         ; preds = %land.lhs.true
  br label %return, !dbg !46

if.end3:                                          ; preds = %land.lhs.true, %if.end
  call void @llvm.dbg.value(metadata i32 2, metadata !47, metadata !DIExpression()), !dbg !36
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %if.end3
  %b.0 = phi i32 [ 2, %if.end3 ], [ %inc, %for.inc ], !dbg !50
  call void @llvm.dbg.value(metadata i32 %b.0, metadata !47, metadata !DIExpression()), !dbg !36
  %sub = sub nsw i32 %n, 1, !dbg !51
  %cmp4 = icmp slt i32 %b.0, %sub, !dbg !53
  br i1 %cmp4, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %call = call signext i8 @same_digits(i32 %n, i32 %b.0), !dbg !55
  %tobool5 = icmp ne i8 %call, 0, !dbg !55
  br i1 %tobool5, label %if.then6, label %if.end7, !dbg !58

if.then6:                                         ; preds = %for.body
  br label %return, !dbg !59

if.end7:                                          ; preds = %for.body
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %if.end7
  %inc = add nsw i32 %b.0, 1, !dbg !61
  call void @llvm.dbg.value(metadata i32 %inc, metadata !47, metadata !DIExpression()), !dbg !36
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  br label %return, !dbg !65

return:                                           ; preds = %for.end, %if.then6, %if.then2, %if.then
  %retval.0 = phi i8 [ 0, %if.then ], [ 1, %if.then6 ], [ 0, %for.end ], [ 1, %if.then2 ], !dbg !36
  ret i8 %retval.0, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @is_prime(i32 %n) #0 !dbg !67 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.value(metadata i32 5, metadata !70, metadata !DIExpression()), !dbg !69
  %cmp = icmp slt i32 %n, 2, !dbg !71
  br i1 %cmp, label %if.then, label %if.end, !dbg !73

if.then:                                          ; preds = %entry
  br label %return, !dbg !74

if.end:                                           ; preds = %entry
  %rem = srem i32 %n, 2, !dbg !75
  %tobool = icmp ne i32 %rem, 0, !dbg !75
  br i1 %tobool, label %if.end4, label %if.then1, !dbg !77

if.then1:                                         ; preds = %if.end
  %cmp2 = icmp eq i32 %n, 2, !dbg !78
  %conv = zext i1 %cmp2 to i32, !dbg !78
  %conv3 = trunc i32 %conv to i8, !dbg !79
  br label %return, !dbg !80

if.end4:                                          ; preds = %if.end
  %rem5 = srem i32 %n, 3, !dbg !81
  %tobool6 = icmp ne i32 %rem5, 0, !dbg !81
  br i1 %tobool6, label %if.end11, label %if.then7, !dbg !83

if.then7:                                         ; preds = %if.end4
  %cmp8 = icmp eq i32 %n, 3, !dbg !84
  %conv9 = zext i1 %cmp8 to i32, !dbg !84
  %conv10 = trunc i32 %conv9 to i8, !dbg !85
  br label %return, !dbg !86

if.end11:                                         ; preds = %if.end4
  br label %while.cond, !dbg !87

while.cond:                                       ; preds = %if.end21, %if.end11
  %d.0 = phi i32 [ 5, %if.end11 ], [ %add22, %if.end21 ], !dbg !69
  call void @llvm.dbg.value(metadata i32 %d.0, metadata !70, metadata !DIExpression()), !dbg !69
  %mul = mul nsw i32 %d.0, %d.0, !dbg !88
  %cmp12 = icmp sle i32 %mul, %n, !dbg !89
  br i1 %cmp12, label %while.body, label %while.end, !dbg !87

while.body:                                       ; preds = %while.cond
  %rem14 = srem i32 %n, %d.0, !dbg !90
  %tobool15 = icmp ne i32 %rem14, 0, !dbg !90
  br i1 %tobool15, label %if.end17, label %if.then16, !dbg !93

if.then16:                                        ; preds = %while.body
  br label %return, !dbg !94

if.end17:                                         ; preds = %while.body
  %add = add nsw i32 %d.0, 2, !dbg !95
  call void @llvm.dbg.value(metadata i32 %add, metadata !70, metadata !DIExpression()), !dbg !69
  %rem18 = srem i32 %n, %add, !dbg !96
  %tobool19 = icmp ne i32 %rem18, 0, !dbg !96
  br i1 %tobool19, label %if.end21, label %if.then20, !dbg !98

if.then20:                                        ; preds = %if.end17
  br label %return, !dbg !99

if.end21:                                         ; preds = %if.end17
  %add22 = add nsw i32 %add, 4, !dbg !100
  call void @llvm.dbg.value(metadata i32 %add22, metadata !70, metadata !DIExpression()), !dbg !69
  br label %while.cond, !dbg !87, !llvm.loop !101

while.end:                                        ; preds = %while.cond
  br label %return, !dbg !103

return:                                           ; preds = %while.end, %if.then20, %if.then16, %if.then7, %if.then1, %if.then
  %retval.0 = phi i8 [ 0, %if.then ], [ 0, %if.then20 ], [ 0, %if.then16 ], [ 1, %while.end ], [ %conv10, %if.then7 ], [ %conv3, %if.then1 ], !dbg !69
  ret i8 %retval.0, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !105 {
entry:
  %kinds = alloca [3 x i8*], align 16
  call void @llvm.dbg.declare(metadata [3 x i8*]* %kinds, metadata !108, metadata !DIExpression()), !dbg !114
  %0 = bitcast [3 x i8*]* %kinds to i8*, !dbg !114
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([3 x i8*]* @__const.main.kinds to i8*), i64 24, i1 false), !dbg !114
  call void @llvm.dbg.value(metadata i32 0, metadata !115, metadata !DIExpression()), !dbg !116
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc13, %for.inc ], !dbg !119
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !115, metadata !DIExpression()), !dbg !116
  %cmp = icmp slt i32 %i.0, 3, !dbg !120
  br i1 %cmp, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !123
  %arrayidx = getelementptr inbounds [3 x i8*], [3 x i8*]* %kinds, i64 0, i64 %idxprom, !dbg !123
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !123
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.3, i64 0, i64 0), i8* %1), !dbg !125
  call void @llvm.dbg.value(metadata i32 0, metadata !126, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.value(metadata i32 7, metadata !127, metadata !DIExpression()), !dbg !116
  br label %while.body, !dbg !128

while.body:                                       ; preds = %sw.epilog, %for.body
  %c.0 = phi i32 [ 0, %for.body ], [ %c.1, %sw.epilog ], !dbg !129
  %n.0 = phi i32 [ 7, %for.body ], [ %n.2, %sw.epilog ], !dbg !130
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !127, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.value(metadata i32 %c.0, metadata !126, metadata !DIExpression()), !dbg !116
  %call1 = call signext i8 @is_brazilian(i32 %n.0), !dbg !131
  %tobool = icmp ne i8 %call1, 0, !dbg !131
  br i1 %tobool, label %if.then, label %if.end6, !dbg !134

if.then:                                          ; preds = %while.body
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i32 %n.0), !dbg !135
  %inc = add nsw i32 %c.0, 1, !dbg !137
  call void @llvm.dbg.value(metadata i32 %inc, metadata !126, metadata !DIExpression()), !dbg !116
  %cmp3 = icmp eq i32 %inc, 20, !dbg !139
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !140

if.then4:                                         ; preds = %if.then
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0)), !dbg !141
  br label %while.end, !dbg !143

if.end:                                           ; preds = %if.then
  br label %if.end6, !dbg !144

if.end6:                                          ; preds = %if.end, %while.body
  %c.1 = phi i32 [ %inc, %if.end ], [ %c.0, %while.body ], !dbg !129
  call void @llvm.dbg.value(metadata i32 %c.1, metadata !126, metadata !DIExpression()), !dbg !116
  switch i32 %i.0, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb8
    i32 2, label %sw.bb9
  ], !dbg !145

sw.bb:                                            ; preds = %if.end6
  %inc7 = add nsw i32 %n.0, 1, !dbg !146
  call void @llvm.dbg.value(metadata i32 %inc7, metadata !127, metadata !DIExpression()), !dbg !116
  br label %sw.epilog, !dbg !148

sw.bb8:                                           ; preds = %if.end6
  %add = add nsw i32 %n.0, 2, !dbg !149
  call void @llvm.dbg.value(metadata i32 %add, metadata !127, metadata !DIExpression()), !dbg !116
  br label %sw.epilog, !dbg !150

sw.bb9:                                           ; preds = %if.end6
  br label %do.body, !dbg !151

do.body:                                          ; preds = %do.cond, %sw.bb9
  %n.1 = phi i32 [ %n.0, %sw.bb9 ], [ %add10, %do.cond ], !dbg !129
  call void @llvm.dbg.value(metadata i32 %n.1, metadata !127, metadata !DIExpression()), !dbg !116
  %add10 = add nsw i32 %n.1, 2, !dbg !152
  call void @llvm.dbg.value(metadata i32 %add10, metadata !127, metadata !DIExpression()), !dbg !116
  br label %do.cond, !dbg !154

do.cond:                                          ; preds = %do.body
  %call11 = call signext i8 @is_prime(i32 %add10), !dbg !155
  %tobool12 = icmp ne i8 %call11, 0, !dbg !156
  %lnot = xor i1 %tobool12, true, !dbg !156
  br i1 %lnot, label %do.body, label %do.end, !dbg !154, !llvm.loop !157

do.end:                                           ; preds = %do.cond
  br label %sw.epilog, !dbg !159

sw.epilog:                                        ; preds = %do.end, %sw.bb8, %sw.bb, %if.end6
  %n.2 = phi i32 [ %n.0, %if.end6 ], [ %add10, %do.end ], [ %add, %sw.bb8 ], [ %inc7, %sw.bb ], !dbg !129
  call void @llvm.dbg.value(metadata i32 %n.2, metadata !127, metadata !DIExpression()), !dbg !116
  br label %while.body, !dbg !128, !llvm.loop !160

while.end:                                        ; preds = %if.then4
  br label %for.inc, !dbg !162

for.inc:                                          ; preds = %while.end
  %inc13 = add nsw i32 %i.0, 1, !dbg !163
  call void @llvm.dbg.value(metadata i32 %inc13, metadata !115, metadata !DIExpression()), !dbg !116
  br label %for.cond, !dbg !164, !llvm.loop !165

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 7, metadata !127, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.value(metadata i32 0, metadata !126, metadata !DIExpression()), !dbg !116
  br label %for.cond14, !dbg !167

for.cond14:                                       ; preds = %for.inc22, %for.end
  %c.2 = phi i32 [ 0, %for.end ], [ %c.3, %for.inc22 ], !dbg !169
  %n.3 = phi i32 [ 7, %for.end ], [ %inc23, %for.inc22 ], !dbg !169
  call void @llvm.dbg.value(metadata i32 %n.3, metadata !127, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.value(metadata i32 %c.2, metadata !126, metadata !DIExpression()), !dbg !116
  %cmp15 = icmp slt i32 %c.2, 100000, !dbg !170
  br i1 %cmp15, label %for.body16, label %for.end24, !dbg !172

for.body16:                                       ; preds = %for.cond14
  %call17 = call signext i8 @is_brazilian(i32 %n.3), !dbg !173
  %tobool18 = icmp ne i8 %call17, 0, !dbg !173
  br i1 %tobool18, label %if.then19, label %if.end21, !dbg !176

if.then19:                                        ; preds = %for.body16
  %inc20 = add nsw i32 %c.2, 1, !dbg !177
  call void @llvm.dbg.value(metadata i32 %inc20, metadata !126, metadata !DIExpression()), !dbg !116
  br label %if.end21, !dbg !178

if.end21:                                         ; preds = %if.then19, %for.body16
  %c.3 = phi i32 [ %inc20, %if.then19 ], [ %c.2, %for.body16 ], !dbg !169
  call void @llvm.dbg.value(metadata i32 %c.3, metadata !126, metadata !DIExpression()), !dbg !116
  br label %for.inc22, !dbg !179

for.inc22:                                        ; preds = %if.end21
  %inc23 = add nsw i32 %n.3, 1, !dbg !180
  call void @llvm.dbg.value(metadata i32 %inc23, metadata !127, metadata !DIExpression()), !dbg !116
  br label %for.cond14, !dbg !181, !llvm.loop !182

for.end24:                                        ; preds = %for.cond14
  %sub = sub nsw i32 %n.3, 1, !dbg !184
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0), i32 %sub), !dbg !185
  ret i32 0, !dbg !186
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "brazillian_numbers.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/brazillian_numbers")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "same_digits", scope: !1, file: !1, line: 8, type: !8, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !12, !12}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "bool", file: !1, line: 3, baseType: !11)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 8, type: !12)
!14 = !DILocation(line: 0, scope: !7)
!15 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 8, type: !12)
!16 = !DILocation(line: 9, column: 13, scope: !7)
!17 = !DILocalVariable(name: "f", scope: !7, file: !1, line: 9, type: !12)
!18 = !DILocation(line: 10, column: 5, scope: !7)
!19 = !DILocation(line: 11, column: 3, scope: !7)
!20 = !DILocation(line: 11, column: 12, scope: !7)
!21 = !DILocation(line: 12, column: 11, scope: !22)
!22 = distinct !DILexicalBlock(scope: !23, file: !1, line: 12, column: 9)
!23 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 17)
!24 = !DILocation(line: 12, column: 15, scope: !22)
!25 = !DILocation(line: 12, column: 9, scope: !23)
!26 = !DILocation(line: 12, column: 21, scope: !22)
!27 = !DILocation(line: 13, column: 7, scope: !23)
!28 = distinct !{!28, !19, !29}
!29 = !DILocation(line: 14, column: 3, scope: !7)
!30 = !DILocation(line: 15, column: 3, scope: !7)
!31 = !DILocation(line: 16, column: 1, scope: !7)
!32 = distinct !DISubprogram(name: "is_brazilian", scope: !1, file: !1, line: 18, type: !33, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{!10, !12}
!35 = !DILocalVariable(name: "n", arg: 1, scope: !32, file: !1, line: 18, type: !12)
!36 = !DILocation(line: 0, scope: !32)
!37 = !DILocation(line: 20, column: 9, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !1, line: 20, column: 7)
!39 = !DILocation(line: 20, column: 7, scope: !32)
!40 = !DILocation(line: 20, column: 14, scope: !38)
!41 = !DILocation(line: 21, column: 11, scope: !42)
!42 = distinct !DILexicalBlock(scope: !32, file: !1, line: 21, column: 7)
!43 = !DILocation(line: 21, column: 16, scope: !42)
!44 = !DILocation(line: 21, column: 21, scope: !42)
!45 = !DILocation(line: 21, column: 7, scope: !32)
!46 = !DILocation(line: 21, column: 27, scope: !42)
!47 = !DILocalVariable(name: "b", scope: !32, file: !1, line: 19, type: !12)
!48 = !DILocation(line: 22, column: 8, scope: !49)
!49 = distinct !DILexicalBlock(scope: !32, file: !1, line: 22, column: 3)
!50 = !DILocation(line: 0, scope: !49)
!51 = !DILocation(line: 22, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !1, line: 22, column: 3)
!53 = !DILocation(line: 22, column: 17, scope: !52)
!54 = !DILocation(line: 22, column: 3, scope: !49)
!55 = !DILocation(line: 23, column: 9, scope: !56)
!56 = distinct !DILexicalBlock(scope: !57, file: !1, line: 23, column: 9)
!57 = distinct !DILexicalBlock(scope: !52, file: !1, line: 22, column: 31)
!58 = !DILocation(line: 23, column: 9, scope: !57)
!59 = !DILocation(line: 23, column: 28, scope: !56)
!60 = !DILocation(line: 24, column: 3, scope: !57)
!61 = !DILocation(line: 22, column: 26, scope: !52)
!62 = !DILocation(line: 22, column: 3, scope: !52)
!63 = distinct !{!63, !54, !64}
!64 = !DILocation(line: 24, column: 3, scope: !49)
!65 = !DILocation(line: 25, column: 3, scope: !32)
!66 = !DILocation(line: 26, column: 1, scope: !32)
!67 = distinct !DISubprogram(name: "is_prime", scope: !1, file: !1, line: 28, type: !33, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "n", arg: 1, scope: !67, file: !1, line: 28, type: !12)
!69 = !DILocation(line: 0, scope: !67)
!70 = !DILocalVariable(name: "d", scope: !67, file: !1, line: 29, type: !12)
!71 = !DILocation(line: 30, column: 9, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !1, line: 30, column: 7)
!73 = !DILocation(line: 30, column: 7, scope: !67)
!74 = !DILocation(line: 30, column: 14, scope: !72)
!75 = !DILocation(line: 31, column: 11, scope: !76)
!76 = distinct !DILexicalBlock(scope: !67, file: !1, line: 31, column: 7)
!77 = !DILocation(line: 31, column: 7, scope: !67)
!78 = !DILocation(line: 31, column: 26, scope: !76)
!79 = !DILocation(line: 31, column: 24, scope: !76)
!80 = !DILocation(line: 31, column: 17, scope: !76)
!81 = !DILocation(line: 32, column: 11, scope: !82)
!82 = distinct !DILexicalBlock(scope: !67, file: !1, line: 32, column: 7)
!83 = !DILocation(line: 32, column: 7, scope: !67)
!84 = !DILocation(line: 32, column: 26, scope: !82)
!85 = !DILocation(line: 32, column: 24, scope: !82)
!86 = !DILocation(line: 32, column: 17, scope: !82)
!87 = !DILocation(line: 33, column: 3, scope: !67)
!88 = !DILocation(line: 33, column: 12, scope: !67)
!89 = !DILocation(line: 33, column: 16, scope: !67)
!90 = !DILocation(line: 34, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !92, file: !1, line: 34, column: 9)
!92 = distinct !DILexicalBlock(scope: !67, file: !1, line: 33, column: 22)
!93 = !DILocation(line: 34, column: 9, scope: !92)
!94 = !DILocation(line: 34, column: 19, scope: !91)
!95 = !DILocation(line: 35, column: 7, scope: !92)
!96 = !DILocation(line: 36, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !1, line: 36, column: 9)
!98 = !DILocation(line: 36, column: 9, scope: !92)
!99 = !DILocation(line: 36, column: 19, scope: !97)
!100 = !DILocation(line: 37, column: 7, scope: !92)
!101 = distinct !{!101, !87, !102}
!102 = !DILocation(line: 38, column: 3, scope: !67)
!103 = !DILocation(line: 39, column: 3, scope: !67)
!104 = !DILocation(line: 40, column: 1, scope: !67)
!105 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 42, type: !106, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DISubroutineType(types: !107)
!107 = !{!12}
!108 = !DILocalVariable(name: "kinds", scope: !105, file: !1, line: 44, type: !109)
!109 = !DICompositeType(tag: DW_TAG_array_type, baseType: !110, size: 192, elements: !112)
!110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 64)
!111 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!112 = !{!113}
!113 = !DISubrange(count: 3)
!114 = !DILocation(line: 44, column: 15, scope: !105)
!115 = !DILocalVariable(name: "i", scope: !105, file: !1, line: 43, type: !12)
!116 = !DILocation(line: 0, scope: !105)
!117 = !DILocation(line: 45, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !105, file: !1, line: 45, column: 3)
!119 = !DILocation(line: 0, scope: !118)
!120 = !DILocation(line: 45, column: 17, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !1, line: 45, column: 3)
!122 = !DILocation(line: 45, column: 3, scope: !118)
!123 = !DILocation(line: 46, column: 46, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !1, line: 45, column: 27)
!125 = !DILocation(line: 46, column: 5, scope: !124)
!126 = !DILocalVariable(name: "c", scope: !105, file: !1, line: 43, type: !12)
!127 = !DILocalVariable(name: "n", scope: !105, file: !1, line: 43, type: !12)
!128 = !DILocation(line: 49, column: 5, scope: !124)
!129 = !DILocation(line: 0, scope: !124)
!130 = !DILocation(line: 48, column: 7, scope: !124)
!131 = !DILocation(line: 50, column: 11, scope: !132)
!132 = distinct !DILexicalBlock(scope: !133, file: !1, line: 50, column: 11)
!133 = distinct !DILexicalBlock(scope: !124, file: !1, line: 49, column: 18)
!134 = !DILocation(line: 50, column: 11, scope: !133)
!135 = !DILocation(line: 51, column: 9, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !1, line: 50, column: 28)
!137 = !DILocation(line: 52, column: 13, scope: !138)
!138 = distinct !DILexicalBlock(scope: !136, file: !1, line: 52, column: 13)
!139 = !DILocation(line: 52, column: 17, scope: !138)
!140 = !DILocation(line: 52, column: 13, scope: !136)
!141 = !DILocation(line: 53, column: 11, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !1, line: 52, column: 24)
!143 = !DILocation(line: 54, column: 11, scope: !142)
!144 = !DILocation(line: 56, column: 7, scope: !136)
!145 = !DILocation(line: 57, column: 7, scope: !133)
!146 = !DILocation(line: 58, column: 18, scope: !147)
!147 = distinct !DILexicalBlock(scope: !133, file: !1, line: 57, column: 18)
!148 = !DILocation(line: 58, column: 22, scope: !147)
!149 = !DILocation(line: 59, column: 19, scope: !147)
!150 = !DILocation(line: 59, column: 25, scope: !147)
!151 = !DILocation(line: 61, column: 17, scope: !147)
!152 = !DILocation(line: 62, column: 21, scope: !153)
!153 = distinct !DILexicalBlock(scope: !147, file: !1, line: 61, column: 20)
!154 = !DILocation(line: 63, column: 17, scope: !153)
!155 = !DILocation(line: 63, column: 27, scope: !147)
!156 = !DILocation(line: 63, column: 26, scope: !147)
!157 = distinct !{!157, !151, !158}
!158 = !DILocation(line: 63, column: 38, scope: !147)
!159 = !DILocation(line: 64, column: 17, scope: !147)
!160 = distinct !{!160, !128, !161}
!161 = !DILocation(line: 66, column: 5, scope: !124)
!162 = !DILocation(line: 67, column: 3, scope: !124)
!163 = !DILocation(line: 45, column: 22, scope: !121)
!164 = !DILocation(line: 45, column: 3, scope: !121)
!165 = distinct !{!165, !122, !166}
!166 = !DILocation(line: 67, column: 3, scope: !118)
!167 = !DILocation(line: 69, column: 8, scope: !168)
!168 = distinct !DILexicalBlock(scope: !105, file: !1, line: 69, column: 3)
!169 = !DILocation(line: 0, scope: !168)
!170 = !DILocation(line: 69, column: 24, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !1, line: 69, column: 3)
!172 = !DILocation(line: 69, column: 3, scope: !168)
!173 = !DILocation(line: 70, column: 9, scope: !174)
!174 = distinct !DILexicalBlock(scope: !175, file: !1, line: 70, column: 9)
!175 = distinct !DILexicalBlock(scope: !171, file: !1, line: 69, column: 39)
!176 = !DILocation(line: 70, column: 9, scope: !175)
!177 = !DILocation(line: 70, column: 27, scope: !174)
!178 = !DILocation(line: 70, column: 26, scope: !174)
!179 = !DILocation(line: 71, column: 3, scope: !175)
!180 = !DILocation(line: 69, column: 34, scope: !171)
!181 = !DILocation(line: 69, column: 3, scope: !171)
!182 = distinct !{!182, !172, !183}
!183 = !DILocation(line: 71, column: 3, scope: !168)
!184 = !DILocation(line: 72, column: 52, scope: !105)
!185 = !DILocation(line: 72, column: 3, scope: !105)
!186 = !DILocation(line: 73, column: 3, scope: !105)
