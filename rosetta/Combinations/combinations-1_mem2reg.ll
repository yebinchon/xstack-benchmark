; ModuleID = 'combinations-1.ll'
source_filename = "combinations-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@one = dso_local global i64 1, align 8, !dbg !0
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @comb(i32 %pool, i32 %need, i64 %chosen, i32 %at) #0 !dbg !12 {
entry:
  call void @llvm.dbg.value(metadata i32 %pool, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i32 %need, metadata !18, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i64 %chosen, metadata !19, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i32 %at, metadata !20, metadata !DIExpression()), !dbg !17
  %add = add nsw i32 %need, %at, !dbg !21
  %cmp = icmp slt i32 %pool, %add, !dbg !23
  br i1 %cmp, label %if.then, label %if.end, !dbg !24

if.then:                                          ; preds = %entry
  br label %return, !dbg !25

if.end:                                           ; preds = %entry
  %tobool = icmp ne i32 %need, 0, !dbg !26
  br i1 %tobool, label %if.end7, label %if.then1, !dbg !28

if.then1:                                         ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 0, metadata !20, metadata !DIExpression()), !dbg !17
  br label %for.cond, !dbg !29

for.cond:                                         ; preds = %for.inc, %if.then1
  %at.addr.0 = phi i32 [ 0, %if.then1 ], [ %inc, %for.inc ], !dbg !32
  call void @llvm.dbg.value(metadata i32 %at.addr.0, metadata !20, metadata !DIExpression()), !dbg !17
  %cmp2 = icmp slt i32 %at.addr.0, %pool, !dbg !33
  br i1 %cmp2, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  %0 = load i64, i64* @one, align 8, !dbg !36
  %sh_prom = zext i32 %at.addr.0 to i64, !dbg !38
  %shl = shl i64 %0, %sh_prom, !dbg !38
  %and = and i64 %chosen, %shl, !dbg !39
  %tobool3 = icmp ne i64 %and, 0, !dbg !39
  br i1 %tobool3, label %if.then4, label %if.end5, !dbg !40

if.then4:                                         ; preds = %for.body
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %at.addr.0), !dbg !41
  br label %if.end5, !dbg !41

if.end5:                                          ; preds = %if.then4, %for.body
  br label %for.inc, !dbg !42

for.inc:                                          ; preds = %if.end5
  %inc = add nsw i32 %at.addr.0, 1, !dbg !43
  call void @llvm.dbg.value(metadata i32 %inc, metadata !20, metadata !DIExpression()), !dbg !17
  br label %for.cond, !dbg !44, !llvm.loop !45

for.end:                                          ; preds = %for.cond
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !47
  br label %return, !dbg !48

if.end7:                                          ; preds = %if.end
  %sub = sub nsw i32 %need, 1, !dbg !49
  %1 = load i64, i64* @one, align 8, !dbg !50
  %sh_prom8 = zext i32 %at to i64, !dbg !51
  %shl9 = shl i64 %1, %sh_prom8, !dbg !51
  %or = or i64 %chosen, %shl9, !dbg !52
  %add10 = add nsw i32 %at, 1, !dbg !53
  call void @comb(i32 %pool, i32 %sub, i64 %or, i32 %add10), !dbg !54
  %add11 = add nsw i32 %at, 1, !dbg !55
  call void @comb(i32 %pool, i32 %need, i64 %chosen, i32 %add11), !dbg !56
  br label %return, !dbg !57

return:                                           ; preds = %if.end7, %for.end, %if.then
  ret void, !dbg !57
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !58 {
entry:
  call void @comb(i32 5, i32 3, i64 0, i32 0), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10}
!llvm.ident = !{!11}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "one", scope: !2, file: !3, line: 6, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "combinations-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Combinations")
!4 = !{}
!5 = !{!0}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "marker", file: !3, line: 5, baseType: !7)
!7 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!12 = distinct !DISubprogram(name: "comb", scope: !3, file: !3, line: 8, type: !13, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15, !15, !6, !15}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DILocalVariable(name: "pool", arg: 1, scope: !12, file: !3, line: 8, type: !15)
!17 = !DILocation(line: 0, scope: !12)
!18 = !DILocalVariable(name: "need", arg: 2, scope: !12, file: !3, line: 8, type: !15)
!19 = !DILocalVariable(name: "chosen", arg: 3, scope: !12, file: !3, line: 8, type: !6)
!20 = !DILocalVariable(name: "at", arg: 4, scope: !12, file: !3, line: 8, type: !15)
!21 = !DILocation(line: 10, column: 18, scope: !22)
!22 = distinct !DILexicalBlock(scope: !12, file: !3, line: 10, column: 6)
!23 = !DILocation(line: 10, column: 11, scope: !22)
!24 = !DILocation(line: 10, column: 6, scope: !12)
!25 = !DILocation(line: 10, column: 24, scope: !22)
!26 = !DILocation(line: 12, column: 7, scope: !27)
!27 = distinct !DILexicalBlock(scope: !12, file: !3, line: 12, column: 6)
!28 = !DILocation(line: 12, column: 6, scope: !12)
!29 = !DILocation(line: 15, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !3, line: 15, column: 3)
!31 = distinct !DILexicalBlock(scope: !27, file: !3, line: 12, column: 13)
!32 = !DILocation(line: 0, scope: !30)
!33 = !DILocation(line: 15, column: 19, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !3, line: 15, column: 3)
!35 = !DILocation(line: 15, column: 3, scope: !30)
!36 = !DILocation(line: 16, column: 18, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !3, line: 16, column: 8)
!38 = !DILocation(line: 16, column: 22, scope: !37)
!39 = !DILocation(line: 16, column: 15, scope: !37)
!40 = !DILocation(line: 16, column: 8, scope: !34)
!41 = !DILocation(line: 16, column: 30, scope: !37)
!42 = !DILocation(line: 16, column: 27, scope: !37)
!43 = !DILocation(line: 15, column: 29, scope: !34)
!44 = !DILocation(line: 15, column: 3, scope: !34)
!45 = distinct !{!45, !35, !46}
!46 = !DILocation(line: 16, column: 46, scope: !30)
!47 = !DILocation(line: 17, column: 3, scope: !31)
!48 = !DILocation(line: 18, column: 3, scope: !31)
!49 = !DILocation(line: 21, column: 18, scope: !12)
!50 = !DILocation(line: 21, column: 33, scope: !12)
!51 = !DILocation(line: 21, column: 37, scope: !12)
!52 = !DILocation(line: 21, column: 30, scope: !12)
!53 = !DILocation(line: 21, column: 48, scope: !12)
!54 = !DILocation(line: 21, column: 2, scope: !12)
!55 = !DILocation(line: 22, column: 30, scope: !12)
!56 = !DILocation(line: 22, column: 2, scope: !12)
!57 = !DILocation(line: 23, column: 1, scope: !12)
!58 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 25, type: !59, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!15}
!61 = !DILocation(line: 27, column: 2, scope: !58)
!62 = !DILocation(line: 28, column: 2, scope: !58)
