; ModuleID = 'factorial-5.c'
source_filename = "factorial-5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fac_aux(i32 %n, i32 %acc) #0 !dbg !7 {
entry:
  %n.addr = alloca i32, align 4
  %acc.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %acc, i32* %acc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %acc.addr, metadata !13, metadata !DIExpression()), !dbg !14
  %0 = load i32, i32* %n.addr, align 4, !dbg !15
  %cmp = icmp slt i32 %0, 1, !dbg !16
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !15

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* %acc.addr, align 4, !dbg !17
  br label %cond.end, !dbg !15

cond.false:                                       ; preds = %entry
  %2 = load i32, i32* %n.addr, align 4, !dbg !18
  %sub = sub nsw i32 %2, 1, !dbg !19
  %3 = load i32, i32* %acc.addr, align 4, !dbg !20
  %4 = load i32, i32* %n.addr, align 4, !dbg !21
  %mul = mul nsw i32 %3, %4, !dbg !22
  %call = call i32 @fac_aux(i32 %sub, i32 %mul), !dbg !23
  br label %cond.end, !dbg !15

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ %call, %cond.false ], !dbg !15
  ret i32 %cond, !dbg !24
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fac_auxSafe(i32 %n, i32 %acc) #0 !dbg !25 {
entry:
  %n.addr = alloca i32, align 4
  %acc.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 %acc, i32* %acc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %acc.addr, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = load i32, i32* %n.addr, align 4, !dbg !30
  %cmp = icmp slt i32 %0, 0, !dbg !31
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !30

cond.true:                                        ; preds = %entry
  br label %cond.end4, !dbg !30

cond.false:                                       ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !32
  %cmp1 = icmp slt i32 %1, 1, !dbg !33
  br i1 %cmp1, label %cond.true2, label %cond.false3, !dbg !32

cond.true2:                                       ; preds = %cond.false
  %2 = load i32, i32* %acc.addr, align 4, !dbg !34
  br label %cond.end, !dbg !32

cond.false3:                                      ; preds = %cond.false
  %3 = load i32, i32* %n.addr, align 4, !dbg !35
  %sub = sub nsw i32 %3, 1, !dbg !36
  %4 = load i32, i32* %acc.addr, align 4, !dbg !37
  %5 = load i32, i32* %n.addr, align 4, !dbg !38
  %mul = mul nsw i32 %4, %5, !dbg !39
  %call = call i32 @fac_aux(i32 %sub, i32 %mul), !dbg !40
  br label %cond.end, !dbg !32

cond.end:                                         ; preds = %cond.false3, %cond.true2
  %cond = phi i32 [ %2, %cond.true2 ], [ %call, %cond.false3 ], !dbg !32
  br label %cond.end4, !dbg !30

cond.end4:                                        ; preds = %cond.end, %cond.true
  %cond5 = phi i32 [ -1, %cond.true ], [ %cond, %cond.end ], !dbg !30
  ret i32 %cond5, !dbg !41
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @factorial(i32 %n) #0 !dbg !42 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = load i32, i32* %n.addr, align 4, !dbg !47
  %call = call i32 @fac_aux(i32 %0, i32 1), !dbg !48
  ret i32 %call, !dbg !49
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "factorial-5.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Factorial")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "fac_aux", scope: !1, file: !1, line: 1, type: !8, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 1, type: !10)
!12 = !DILocation(line: 1, column: 17, scope: !7)
!13 = !DILocalVariable(name: "acc", arg: 2, scope: !7, file: !1, line: 1, type: !10)
!14 = !DILocation(line: 1, column: 24, scope: !7)
!15 = !DILocation(line: 2, column: 12, scope: !7)
!16 = !DILocation(line: 2, column: 14, scope: !7)
!17 = !DILocation(line: 2, column: 20, scope: !7)
!18 = !DILocation(line: 2, column: 34, scope: !7)
!19 = !DILocation(line: 2, column: 36, scope: !7)
!20 = !DILocation(line: 2, column: 41, scope: !7)
!21 = !DILocation(line: 2, column: 47, scope: !7)
!22 = !DILocation(line: 2, column: 45, scope: !7)
!23 = !DILocation(line: 2, column: 26, scope: !7)
!24 = !DILocation(line: 2, column: 5, scope: !7)
!25 = distinct !DISubprogram(name: "fac_auxSafe", scope: !1, file: !1, line: 5, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DILocalVariable(name: "n", arg: 1, scope: !25, file: !1, line: 5, type: !10)
!27 = !DILocation(line: 5, column: 21, scope: !25)
!28 = !DILocalVariable(name: "acc", arg: 2, scope: !25, file: !1, line: 5, type: !10)
!29 = !DILocation(line: 5, column: 28, scope: !25)
!30 = !DILocation(line: 6, column: 12, scope: !25)
!31 = !DILocation(line: 6, column: 13, scope: !25)
!32 = !DILocation(line: 6, column: 23, scope: !25)
!33 = !DILocation(line: 6, column: 25, scope: !25)
!34 = !DILocation(line: 6, column: 31, scope: !25)
!35 = !DILocation(line: 6, column: 45, scope: !25)
!36 = !DILocation(line: 6, column: 47, scope: !25)
!37 = !DILocation(line: 6, column: 52, scope: !25)
!38 = !DILocation(line: 6, column: 58, scope: !25)
!39 = !DILocation(line: 6, column: 56, scope: !25)
!40 = !DILocation(line: 6, column: 37, scope: !25)
!41 = !DILocation(line: 6, column: 5, scope: !25)
!42 = distinct !DISubprogram(name: "factorial", scope: !1, file: !1, line: 9, type: !43, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{!10, !10}
!45 = !DILocalVariable(name: "n", arg: 1, scope: !42, file: !1, line: 9, type: !10)
!46 = !DILocation(line: 9, column: 19, scope: !42)
!47 = !DILocation(line: 10, column: 20, scope: !42)
!48 = !DILocation(line: 10, column: 12, scope: !42)
!49 = !DILocation(line: 10, column: 5, scope: !42)
