; ModuleID = 'abc-problem.ll'
source_filename = "abc-problem.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"BO\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"XK\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"DQ\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"CP\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"NA\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"GT\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"RE\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"TG\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"QD\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"FS\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"JW\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"HU\00", align 1
@.str.12 = private unnamed_addr constant [3 x i8] c"VI\00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"AN\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"OB\00", align 1
@.str.15 = private unnamed_addr constant [3 x i8] c"ER\00", align 1
@.str.16 = private unnamed_addr constant [3 x i8] c"LY\00", align 1
@.str.17 = private unnamed_addr constant [3 x i8] c"PC\00", align 1
@.str.18 = private unnamed_addr constant [3 x i8] c"ZM\00", align 1
@__const.main.blocks = private unnamed_addr constant [21 x i8*] [i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.18, i32 0, i32 0), i8* null], align 16
@.str.19 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.20 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.21 = private unnamed_addr constant [5 x i8] c"BARK\00", align 1
@.str.22 = private unnamed_addr constant [5 x i8] c"BOOK\00", align 1
@.str.23 = private unnamed_addr constant [6 x i8] c"TREAT\00", align 1
@.str.24 = private unnamed_addr constant [7 x i8] c"COMMON\00", align 1
@.str.25 = private unnamed_addr constant [6 x i8] c"SQUAD\00", align 1
@.str.26 = private unnamed_addr constant [8 x i8] c"Confuse\00", align 1
@__const.main.words = private unnamed_addr constant [9 x i8*] [i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.26, i32 0, i32 0), i8* null], align 16
@.str.27 = private unnamed_addr constant [7 x i8] c"%s\09%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @can_make_words(i8** %b, i8* %word) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i8** %b, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i8* %word, metadata !16, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 0, metadata !17, metadata !DIExpression()), !dbg !15
  %0 = load i8, i8* %word, align 1, !dbg !18
  %conv = sext i8 %0 to i32, !dbg !18
  %call = call i32 @toupper(i32 %conv) #5, !dbg !19
  call void @llvm.dbg.value(metadata i32 %call, metadata !20, metadata !DIExpression()), !dbg !15
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.end, label %if.then, !dbg !23, !cf.info !24

if.then:                                          ; preds = %entry
  br label %return, !dbg !25

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %b, i64 0, !dbg !26
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !26
  %tobool1 = icmp ne i8* %1, null, !dbg !26
  br i1 %tobool1, label %if.end3, label %if.then2, !dbg !28, !cf.info !24

if.then2:                                         ; preds = %if.end
  br label %return, !dbg !29

if.end3:                                          ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 0, metadata !30, metadata !DIExpression()), !dbg !15
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc, %if.end3
  %i.0 = phi i32 [ 0, %if.end3 ], [ %inc, %for.inc ], !dbg !33
  %ret.0 = phi i32 [ 0, %if.end3 ], [ %ret.1, %for.inc ], !dbg !34
  call void @llvm.dbg.value(metadata i32 %ret.0, metadata !17, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !30, metadata !DIExpression()), !dbg !15
  %idxprom = sext i32 %i.0 to i64, !dbg !35
  %arrayidx4 = getelementptr inbounds i8*, i8** %b, i64 %idxprom, !dbg !35
  %2 = load i8*, i8** %arrayidx4, align 8, !dbg !35
  %tobool5 = icmp ne i8* %2, null, !dbg !35
  br i1 %tobool5, label %land.rhs, label %land.end, !dbg !37

land.rhs:                                         ; preds = %for.cond
  %tobool6 = icmp ne i32 %ret.0, 0, !dbg !38
  %lnot = xor i1 %tobool6, true, !dbg !38
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %3 = phi i1 [ false, %for.cond ], [ %lnot, %land.rhs ], !dbg !39
  br i1 %3, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %land.end
  %idxprom7 = sext i32 %i.0 to i64, !dbg !41
  %arrayidx8 = getelementptr inbounds i8*, i8** %b, i64 %idxprom7, !dbg !41
  %4 = load i8*, i8** %arrayidx8, align 8, !dbg !41
  %arrayidx9 = getelementptr inbounds i8, i8* %4, i64 0, !dbg !41
  %5 = load i8, i8* %arrayidx9, align 1, !dbg !41
  %conv10 = sext i8 %5 to i32, !dbg !41
  %cmp = icmp ne i32 %conv10, %call, !dbg !44
  br i1 %cmp, label %land.lhs.true, label %if.end19, !dbg !45, !cf.info !24

land.lhs.true:                                    ; preds = %for.body
  %idxprom12 = sext i32 %i.0 to i64, !dbg !46
  %arrayidx13 = getelementptr inbounds i8*, i8** %b, i64 %idxprom12, !dbg !46
  %6 = load i8*, i8** %arrayidx13, align 8, !dbg !46
  %arrayidx14 = getelementptr inbounds i8, i8* %6, i64 1, !dbg !46
  %7 = load i8, i8* %arrayidx14, align 1, !dbg !46
  %conv15 = sext i8 %7 to i32, !dbg !46
  %cmp16 = icmp ne i32 %conv15, %call, !dbg !47
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !48, !cf.info !24

if.then18:                                        ; preds = %land.lhs.true
  br label %for.inc, !dbg !49

if.end19:                                         ; preds = %land.lhs.true, %for.body
  %idxprom20 = sext i32 %i.0 to i64, !dbg !50
  %arrayidx21 = getelementptr inbounds i8*, i8** %b, i64 %idxprom20, !dbg !50
  %8 = load i8*, i8** %arrayidx21, align 8, !dbg !50
  %arrayidx22 = getelementptr inbounds i8*, i8** %b, i64 0, !dbg !50
  %9 = load i8*, i8** %arrayidx22, align 8, !dbg !50
  %cmp23 = icmp ne i8* %8, %9, !dbg !50
  br i1 %cmp23, label %if.then25, label %if.end32, !dbg !52, !cf.info !24

if.then25:                                        ; preds = %if.end19
  %idxprom26 = sext i32 %i.0 to i64, !dbg !53
  %arrayidx27 = getelementptr inbounds i8*, i8** %b, i64 %idxprom26, !dbg !53
  %10 = load i8*, i8** %arrayidx27, align 8, !dbg !53
  call void @llvm.dbg.value(metadata i8* %10, metadata !55, metadata !DIExpression()), !dbg !56
  %arrayidx28 = getelementptr inbounds i8*, i8** %b, i64 0, !dbg !53
  %11 = load i8*, i8** %arrayidx28, align 8, !dbg !53
  %idxprom29 = sext i32 %i.0 to i64, !dbg !53
  %arrayidx30 = getelementptr inbounds i8*, i8** %b, i64 %idxprom29, !dbg !53
  store i8* %11, i8** %arrayidx30, align 8, !dbg !53
  %arrayidx31 = getelementptr inbounds i8*, i8** %b, i64 0, !dbg !53
  store i8* %10, i8** %arrayidx31, align 8, !dbg !53
  br label %if.end32, !dbg !53

if.end32:                                         ; preds = %if.then25, %if.end19
  %add.ptr = getelementptr inbounds i8*, i8** %b, i64 1, !dbg !57
  %add.ptr33 = getelementptr inbounds i8, i8* %word, i64 1, !dbg !58
  %call34 = call i32 @can_make_words(i8** %add.ptr, i8* %add.ptr33), !dbg !59
  call void @llvm.dbg.value(metadata i32 %call34, metadata !17, metadata !DIExpression()), !dbg !15
  %idxprom35 = sext i32 %i.0 to i64, !dbg !60
  %arrayidx36 = getelementptr inbounds i8*, i8** %b, i64 %idxprom35, !dbg !60
  %12 = load i8*, i8** %arrayidx36, align 8, !dbg !60
  %arrayidx37 = getelementptr inbounds i8*, i8** %b, i64 0, !dbg !60
  %13 = load i8*, i8** %arrayidx37, align 8, !dbg !60
  %cmp38 = icmp ne i8* %12, %13, !dbg !60
  br i1 %cmp38, label %if.then40, label %if.end48, !dbg !62, !cf.info !24

if.then40:                                        ; preds = %if.end32
  %idxprom42 = sext i32 %i.0 to i64, !dbg !63
  %arrayidx43 = getelementptr inbounds i8*, i8** %b, i64 %idxprom42, !dbg !63
  %14 = load i8*, i8** %arrayidx43, align 8, !dbg !63
  call void @llvm.dbg.value(metadata i8* %14, metadata !65, metadata !DIExpression()), !dbg !66
  %arrayidx44 = getelementptr inbounds i8*, i8** %b, i64 0, !dbg !63
  %15 = load i8*, i8** %arrayidx44, align 8, !dbg !63
  %idxprom45 = sext i32 %i.0 to i64, !dbg !63
  %arrayidx46 = getelementptr inbounds i8*, i8** %b, i64 %idxprom45, !dbg !63
  store i8* %15, i8** %arrayidx46, align 8, !dbg !63
  %arrayidx47 = getelementptr inbounds i8*, i8** %b, i64 0, !dbg !63
  store i8* %14, i8** %arrayidx47, align 8, !dbg !63
  br label %if.end48, !dbg !63

if.end48:                                         ; preds = %if.then40, %if.end32
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %if.end48, %if.then18
  %ret.1 = phi i32 [ %ret.0, %if.then18 ], [ %call34, %if.end48 ], !dbg !15
  call void @llvm.dbg.value(metadata i32 %ret.1, metadata !17, metadata !DIExpression()), !dbg !15
  %inc = add nsw i32 %i.0, 1, !dbg !68
  call void @llvm.dbg.value(metadata i32 %inc, metadata !30, metadata !DIExpression()), !dbg !15
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %land.end
  br label %return, !dbg !72

return:                                           ; preds = %for.end, %if.then2, %if.then
  %retval.0 = phi i32 [ %ret.0, %for.end ], [ 0, %if.then2 ], [ 1, %if.then ], !dbg !15
  ret i32 %retval.0, !dbg !73
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @toupper(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !74 {
entry:
  %blocks = alloca [21 x i8*], align 16
  %words = alloca [9 x i8*], align 16
  call void @llvm.dbg.declare(metadata [21 x i8*]* %blocks, metadata !77, metadata !DIExpression()), !dbg !81
  %0 = bitcast [21 x i8*]* %blocks to i8*, !dbg !81
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([21 x i8*]* @__const.main.blocks to i8*), i64 168, i1 false), !dbg !81
  call void @llvm.dbg.declare(metadata [9 x i8*]* %words, metadata !82, metadata !DIExpression()), !dbg !86
  %1 = bitcast [9 x i8*]* %words to i8*, !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([9 x i8*]* @__const.main.words to i8*), i64 72, i1 false), !dbg !86
  %arraydecay = getelementptr inbounds [9 x i8*], [9 x i8*]* %words, i64 0, i64 0, !dbg !87
  call void @llvm.dbg.value(metadata i8** %arraydecay, metadata !89, metadata !DIExpression()), !dbg !90
  br label %for.cond, !dbg !91

for.cond:                                         ; preds = %for.inc, %entry
  %w.0 = phi i8** [ %arraydecay, %entry ], [ %incdec.ptr, %for.inc ], !dbg !92
  call void @llvm.dbg.value(metadata i8** %w.0, metadata !89, metadata !DIExpression()), !dbg !90
  %2 = load i8*, i8** %w.0, align 8, !dbg !93
  %tobool = icmp ne i8* %2, null, !dbg !95
  br i1 %tobool, label %for.body, label %for.end, !dbg !95

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %w.0, align 8, !dbg !96
  %arraydecay1 = getelementptr inbounds [21 x i8*], [21 x i8*]* %blocks, i64 0, i64 0, !dbg !97
  %4 = load i8*, i8** %w.0, align 8, !dbg !98
  %call = call i32 @can_make_words(i8** %arraydecay1, i8* %4), !dbg !99
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.27, i64 0, i64 0), i8* %3, i32 %call), !dbg !100
  br label %for.inc, !dbg !100

for.inc:                                          ; preds = %for.body
  %incdec.ptr = getelementptr inbounds i8*, i8** %w.0, i32 1, !dbg !101
  call void @llvm.dbg.value(metadata i8** %incdec.ptr, metadata !89, metadata !DIExpression()), !dbg !90
  br label %for.cond, !dbg !102, !llvm.loop !103

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !105
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "abc-problem.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/ABC-Problem")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "can_make_words", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !12}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "b", arg: 1, scope: !7, file: !1, line: 4, type: !11)
!15 = !DILocation(line: 0, scope: !7)
!16 = !DILocalVariable(name: "word", arg: 2, scope: !7, file: !1, line: 4, type: !12)
!17 = !DILocalVariable(name: "ret", scope: !7, file: !1, line: 6, type: !10)
!18 = !DILocation(line: 6, column: 30, scope: !7)
!19 = !DILocation(line: 6, column: 22, scope: !7)
!20 = !DILocalVariable(name: "c", scope: !7, file: !1, line: 6, type: !10)
!21 = !DILocation(line: 10, column: 7, scope: !22)
!22 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 6)
!23 = !DILocation(line: 10, column: 6, scope: !7)
!24 = !{!"if"}
!25 = !DILocation(line: 10, column: 10, scope: !22)
!26 = !DILocation(line: 11, column: 7, scope: !27)
!27 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 6)
!28 = !DILocation(line: 11, column: 6, scope: !7)
!29 = !DILocation(line: 11, column: 13, scope: !27)
!30 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 6, type: !10)
!31 = !DILocation(line: 13, column: 7, scope: !32)
!32 = distinct !DILexicalBlock(scope: !7, file: !1, line: 13, column: 2)
!33 = !DILocation(line: 0, scope: !32)
!34 = !DILocation(line: 6, column: 9, scope: !7)
!35 = !DILocation(line: 13, column: 14, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !1, line: 13, column: 2)
!37 = !DILocation(line: 13, column: 19, scope: !36)
!38 = !DILocation(line: 13, column: 22, scope: !36)
!39 = !DILocation(line: 0, scope: !36)
!40 = !DILocation(line: 13, column: 2, scope: !32)
!41 = !DILocation(line: 14, column: 7, scope: !42)
!42 = distinct !DILexicalBlock(scope: !43, file: !1, line: 14, column: 7)
!43 = distinct !DILexicalBlock(scope: !36, file: !1, line: 13, column: 33)
!44 = !DILocation(line: 14, column: 15, scope: !42)
!45 = !DILocation(line: 14, column: 20, scope: !42)
!46 = !DILocation(line: 14, column: 23, scope: !42)
!47 = !DILocation(line: 14, column: 31, scope: !42)
!48 = !DILocation(line: 14, column: 7, scope: !43)
!49 = !DILocation(line: 14, column: 37, scope: !42)
!50 = !DILocation(line: 15, column: 3, scope: !51)
!51 = distinct !DILexicalBlock(scope: !43, file: !1, line: 15, column: 3)
!52 = !DILocation(line: 15, column: 3, scope: !43)
!53 = !DILocation(line: 15, column: 3, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !1, line: 15, column: 3)
!55 = !DILocalVariable(name: "tmp", scope: !54, file: !1, line: 15, type: !12)
!56 = !DILocation(line: 0, scope: !54)
!57 = !DILocation(line: 16, column: 26, scope: !43)
!58 = !DILocation(line: 16, column: 36, scope: !43)
!59 = !DILocation(line: 16, column: 9, scope: !43)
!60 = !DILocation(line: 17, column: 3, scope: !61)
!61 = distinct !DILexicalBlock(scope: !43, file: !1, line: 17, column: 3)
!62 = !DILocation(line: 17, column: 3, scope: !43)
!63 = !DILocation(line: 17, column: 3, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !1, line: 17, column: 3)
!65 = !DILocalVariable(name: "tmp", scope: !64, file: !1, line: 17, type: !12)
!66 = !DILocation(line: 0, scope: !64)
!67 = !DILocation(line: 18, column: 2, scope: !43)
!68 = !DILocation(line: 13, column: 29, scope: !36)
!69 = !DILocation(line: 13, column: 2, scope: !36)
!70 = distinct !{!70, !40, !71}
!71 = !DILocation(line: 18, column: 2, scope: !32)
!72 = !DILocation(line: 20, column: 2, scope: !7)
!73 = !DILocation(line: 21, column: 1, scope: !7)
!74 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 23, type: !75, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!10}
!77 = !DILocalVariable(name: "blocks", scope: !74, file: !1, line: 25, type: !78)
!78 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1344, elements: !79)
!79 = !{!80}
!80 = !DISubrange(count: 21)
!81 = !DILocation(line: 25, column: 8, scope: !74)
!82 = !DILocalVariable(name: "words", scope: !74, file: !1, line: 32, type: !83)
!83 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 576, elements: !84)
!84 = !{!85}
!85 = !DISubrange(count: 9)
!86 = !DILocation(line: 32, column: 8, scope: !74)
!87 = !DILocation(line: 37, column: 11, scope: !88)
!88 = distinct !DILexicalBlock(scope: !74, file: !1, line: 37, column: 2)
!89 = !DILocalVariable(name: "w", scope: !74, file: !1, line: 36, type: !11)
!90 = !DILocation(line: 0, scope: !74)
!91 = !DILocation(line: 37, column: 7, scope: !88)
!92 = !DILocation(line: 0, scope: !88)
!93 = !DILocation(line: 37, column: 18, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !1, line: 37, column: 2)
!95 = !DILocation(line: 37, column: 2, scope: !88)
!96 = !DILocation(line: 38, column: 22, scope: !94)
!97 = !DILocation(line: 38, column: 41, scope: !94)
!98 = !DILocation(line: 38, column: 49, scope: !94)
!99 = !DILocation(line: 38, column: 26, scope: !94)
!100 = !DILocation(line: 38, column: 3, scope: !94)
!101 = !DILocation(line: 37, column: 23, scope: !94)
!102 = !DILocation(line: 37, column: 2, scope: !94)
!103 = distinct !{!103, !95, !104}
!104 = !DILocation(line: 38, column: 52, scope: !88)
!105 = !DILocation(line: 40, column: 2, scope: !74)
