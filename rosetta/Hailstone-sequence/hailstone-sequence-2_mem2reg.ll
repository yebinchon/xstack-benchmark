; ModuleID = 'hailstone-sequence-2.ll'
source_filename = "hailstone-sequence-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@cache = dso_local global [10000000 x i64] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [29 x i8] c"max below %d: %d, length %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @hailstone(i64 %n) #0 !dbg !15 {
entry:
  call void @llvm.dbg.value(metadata i64 %n, metadata !18, metadata !DIExpression()), !dbg !19
  %cmp = icmp eq i64 %n, 1, !dbg !20
  br i1 %cmp, label %if.then, label %if.end, !dbg !22, !cf.info !23

if.then:                                          ; preds = %entry
  br label %return, !dbg !24

if.end:                                           ; preds = %entry
  %cmp1 = icmp ult i64 %n, 10000000, !dbg !25
  br i1 %cmp1, label %land.lhs.true, label %if.end4, !dbg !27, !cf.info !23

land.lhs.true:                                    ; preds = %if.end
  %arrayidx = getelementptr inbounds [10000000 x i64], [10000000 x i64]* @cache, i64 0, i64 %n, !dbg !28
  %0 = load i64, i64* %arrayidx, align 8, !dbg !28
  %tobool = icmp ne i64 %0, 0, !dbg !28
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !29, !cf.info !23

if.then2:                                         ; preds = %land.lhs.true
  %arrayidx3 = getelementptr inbounds [10000000 x i64], [10000000 x i64]* @cache, i64 0, i64 %n, !dbg !30
  %1 = load i64, i64* %arrayidx3, align 8, !dbg !30
  br label %return, !dbg !31

if.end4:                                          ; preds = %land.lhs.true, %if.end
  %and = and i64 %n, 1, !dbg !32
  %tobool5 = icmp ne i64 %and, 0, !dbg !32
  br i1 %tobool5, label %cond.true, label %cond.false, !dbg !33

cond.true:                                        ; preds = %if.end4
  %mul = mul i64 3, %n, !dbg !34
  %add = add i64 %mul, 1, !dbg !35
  br label %cond.end, !dbg !33

cond.false:                                       ; preds = %if.end4
  %div = udiv i64 %n, 2, !dbg !36
  br label %cond.end, !dbg !33

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %add, %cond.true ], [ %div, %cond.false ], !dbg !33
  %call = call i64 @hailstone(i64 %cond), !dbg !37
  %add6 = add i64 1, %call, !dbg !38
  %conv = trunc i64 %add6 to i32, !dbg !39
  call void @llvm.dbg.value(metadata i32 %conv, metadata !40, metadata !DIExpression()), !dbg !19
  %cmp7 = icmp ult i64 %n, 10000000, !dbg !42
  br i1 %cmp7, label %if.then9, label %if.end12, !dbg !44, !cf.info !23

if.then9:                                         ; preds = %cond.end
  %conv10 = sext i32 %conv to i64, !dbg !45
  %arrayidx11 = getelementptr inbounds [10000000 x i64], [10000000 x i64]* @cache, i64 0, i64 %n, !dbg !46
  store i64 %conv10, i64* %arrayidx11, align 8, !dbg !47
  br label %if.end12, !dbg !46

if.end12:                                         ; preds = %if.then9, %cond.end
  %conv13 = sext i32 %conv to i64, !dbg !48
  br label %return, !dbg !49

return:                                           ; preds = %if.end12, %if.then2, %if.then
  %retval.0 = phi i64 [ 1, %if.then ], [ %1, %if.then2 ], [ %conv13, %if.end12 ], !dbg !19
  ret i64 %retval.0, !dbg !50
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !51 {
entry:
  call void @llvm.dbg.value(metadata i32 0, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.value(metadata i32 1, metadata !56, metadata !DIExpression()), !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %entry
  %max.0 = phi i32 [ 0, %entry ], [ %max.1, %for.inc ], !dbg !55
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ], !dbg !59
  %mi.0 = phi i32 [ undef, %entry ], [ %mi.1, %for.inc ]
  call void @llvm.dbg.value(metadata i32 %mi.0, metadata !60, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !56, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.value(metadata i32 %max.0, metadata !54, metadata !DIExpression()), !dbg !55
  %cmp = icmp slt i32 %i.0, 10000000, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %conv = sext i32 %i.0 to i64, !dbg !64
  %call = call i64 @hailstone(i64 %conv), !dbg !67
  %conv1 = trunc i64 %call to i32, !dbg !67
  call void @llvm.dbg.value(metadata i32 %conv1, metadata !68, metadata !DIExpression()), !dbg !55
  %cmp2 = icmp sgt i32 %conv1, %max.0, !dbg !69
  br i1 %cmp2, label %if.then, label %if.end, !dbg !70, !cf.info !23

if.then:                                          ; preds = %for.body
  call void @llvm.dbg.value(metadata i32 %conv1, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !60, metadata !DIExpression()), !dbg !55
  br label %if.end, !dbg !71

if.end:                                           ; preds = %if.then, %for.body
  %max.1 = phi i32 [ %conv1, %if.then ], [ %max.0, %for.body ], !dbg !55
  %mi.1 = phi i32 [ %i.0, %if.then ], [ %mi.0, %for.body ]
  call void @llvm.dbg.value(metadata i32 %mi.1, metadata !60, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.value(metadata i32 %max.1, metadata !54, metadata !DIExpression()), !dbg !55
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1, !dbg !74
  call void @llvm.dbg.value(metadata i32 %inc, metadata !56, metadata !DIExpression()), !dbg !55
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str, i64 0, i64 0), i32 10000000, i32 %mi.0, i32 %max.0), !dbg !78
  ret i32 0, !dbg !79
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "cache", scope: !2, file: !3, line: 7, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "hailstone-sequence-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Hailstone-sequence")
!4 = !{}
!5 = !{!0}
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 640000000, elements: !9)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "ulong", file: !3, line: 6, baseType: !8)
!8 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!9 = !{!10}
!10 = !DISubrange(count: 10000000)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!15 = distinct !DISubprogram(name: "hailstone", scope: !3, file: !3, line: 9, type: !16, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!16 = !DISubroutineType(types: !17)
!17 = !{!7, !7}
!18 = !DILocalVariable(name: "n", arg: 1, scope: !15, file: !3, line: 9, type: !7)
!19 = !DILocation(line: 0, scope: !15)
!20 = !DILocation(line: 12, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !15, file: !3, line: 12, column: 6)
!22 = !DILocation(line: 12, column: 6, scope: !15)
!23 = !{!"if"}
!24 = !DILocation(line: 12, column: 14, scope: !21)
!25 = !DILocation(line: 13, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !15, file: !3, line: 13, column: 6)
!27 = !DILocation(line: 13, column: 13, scope: !26)
!28 = !DILocation(line: 13, column: 16, scope: !26)
!29 = !DILocation(line: 13, column: 6, scope: !15)
!30 = !DILocation(line: 13, column: 33, scope: !26)
!31 = !DILocation(line: 13, column: 26, scope: !26)
!32 = !DILocation(line: 15, column: 23, scope: !15)
!33 = !DILocation(line: 15, column: 20, scope: !15)
!34 = !DILocation(line: 15, column: 32, scope: !15)
!35 = !DILocation(line: 15, column: 36, scope: !15)
!36 = !DILocation(line: 15, column: 44, scope: !15)
!37 = !DILocation(line: 15, column: 10, scope: !15)
!38 = !DILocation(line: 15, column: 8, scope: !15)
!39 = !DILocation(line: 15, column: 6, scope: !15)
!40 = !DILocalVariable(name: "x", scope: !15, file: !3, line: 11, type: !41)
!41 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!42 = !DILocation(line: 16, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !15, file: !3, line: 16, column: 6)
!44 = !DILocation(line: 16, column: 6, scope: !15)
!45 = !DILocation(line: 16, column: 25, scope: !43)
!46 = !DILocation(line: 16, column: 14, scope: !43)
!47 = !DILocation(line: 16, column: 23, scope: !43)
!48 = !DILocation(line: 17, column: 9, scope: !15)
!49 = !DILocation(line: 17, column: 2, scope: !15)
!50 = !DILocation(line: 18, column: 1, scope: !15)
!51 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 20, type: !52, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DISubroutineType(types: !53)
!53 = !{!41}
!54 = !DILocalVariable(name: "max", scope: !51, file: !3, line: 22, type: !41)
!55 = !DILocation(line: 0, scope: !51)
!56 = !DILocalVariable(name: "i", scope: !51, file: !3, line: 22, type: !41)
!57 = !DILocation(line: 23, column: 7, scope: !58)
!58 = distinct !DILexicalBlock(scope: !51, file: !3, line: 23, column: 2)
!59 = !DILocation(line: 0, scope: !58)
!60 = !DILocalVariable(name: "mi", scope: !51, file: !3, line: 22, type: !41)
!61 = !DILocation(line: 23, column: 16, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !3, line: 23, column: 2)
!63 = !DILocation(line: 23, column: 2, scope: !58)
!64 = !DILocation(line: 24, column: 22, scope: !65)
!65 = distinct !DILexicalBlock(scope: !66, file: !3, line: 24, column: 7)
!66 = distinct !DILexicalBlock(scope: !62, file: !3, line: 23, column: 26)
!67 = !DILocation(line: 24, column: 12, scope: !65)
!68 = !DILocalVariable(name: "l", scope: !51, file: !3, line: 22, type: !41)
!69 = !DILocation(line: 24, column: 26, scope: !65)
!70 = !DILocation(line: 24, column: 7, scope: !66)
!71 = !DILocation(line: 27, column: 3, scope: !72)
!72 = distinct !DILexicalBlock(scope: !65, file: !3, line: 24, column: 33)
!73 = !DILocation(line: 28, column: 2, scope: !66)
!74 = !DILocation(line: 23, column: 22, scope: !62)
!75 = !DILocation(line: 23, column: 2, scope: !62)
!76 = distinct !{!76, !63, !77}
!77 = !DILocation(line: 28, column: 2, scope: !58)
!78 = !DILocation(line: 29, column: 2, scope: !51)
!79 = !DILocation(line: 30, column: 2, scope: !51)
