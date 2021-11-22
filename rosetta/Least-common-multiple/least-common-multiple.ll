; ModuleID = 'least-common-multiple.c'
source_filename = "least-common-multiple.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"lcm(35, 21) = %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @gcd(i32 %m, i32 %n) #0 !dbg !7 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %tmp = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %tmp, metadata !15, metadata !DIExpression()), !dbg !16
  br label %while.cond, !dbg !17

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %m.addr, align 4, !dbg !18
  %tobool = icmp ne i32 %0, 0, !dbg !17
  br i1 %tobool, label %while.body, label %while.end, !dbg !17

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %m.addr, align 4, !dbg !19
  store i32 %1, i32* %tmp, align 4, !dbg !21
  %2 = load i32, i32* %n.addr, align 4, !dbg !22
  %3 = load i32, i32* %m.addr, align 4, !dbg !23
  %rem = srem i32 %2, %3, !dbg !24
  store i32 %rem, i32* %m.addr, align 4, !dbg !25
  %4 = load i32, i32* %tmp, align 4, !dbg !26
  store i32 %4, i32* %n.addr, align 4, !dbg !27
  br label %while.cond, !dbg !17, !llvm.loop !28

while.end:                                        ; preds = %while.cond
  %5 = load i32, i32* %n.addr, align 4, !dbg !30
  ret i32 %5, !dbg !31
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @lcm(i32 %m, i32 %n) #0 !dbg !32 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !33, metadata !DIExpression()), !dbg !34
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !35, metadata !DIExpression()), !dbg !36
  %0 = load i32, i32* %m.addr, align 4, !dbg !37
  %1 = load i32, i32* %m.addr, align 4, !dbg !38
  %2 = load i32, i32* %n.addr, align 4, !dbg !39
  %call = call i32 @gcd(i32 %1, i32 %2), !dbg !40
  %div = sdiv i32 %0, %call, !dbg !41
  %3 = load i32, i32* %n.addr, align 4, !dbg !42
  %mul = mul nsw i32 %div, %3, !dbg !43
  ret i32 %mul, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 @lcm(i32 21, i32 35), !dbg !48
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0), i32 %call), !dbg !49
  ret i32 0, !dbg !50
}

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "least-common-multiple.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Least-common-multiple")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "gcd", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "m", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!12 = !DILocation(line: 3, column: 13, scope: !7)
!13 = !DILocalVariable(name: "n", arg: 2, scope: !7, file: !1, line: 3, type: !10)
!14 = !DILocation(line: 3, column: 20, scope: !7)
!15 = !DILocalVariable(name: "tmp", scope: !7, file: !1, line: 5, type: !10)
!16 = !DILocation(line: 5, column: 13, scope: !7)
!17 = !DILocation(line: 6, column: 9, scope: !7)
!18 = !DILocation(line: 6, column: 15, scope: !7)
!19 = !DILocation(line: 6, column: 26, scope: !20)
!20 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 18)
!21 = !DILocation(line: 6, column: 24, scope: !20)
!22 = !DILocation(line: 6, column: 33, scope: !20)
!23 = !DILocation(line: 6, column: 37, scope: !20)
!24 = !DILocation(line: 6, column: 35, scope: !20)
!25 = !DILocation(line: 6, column: 31, scope: !20)
!26 = !DILocation(line: 6, column: 44, scope: !20)
!27 = !DILocation(line: 6, column: 42, scope: !20)
!28 = distinct !{!28, !17, !29}
!29 = !DILocation(line: 6, column: 49, scope: !7)
!30 = !DILocation(line: 7, column: 16, scope: !7)
!31 = !DILocation(line: 7, column: 9, scope: !7)
!32 = distinct !DISubprogram(name: "lcm", scope: !1, file: !1, line: 10, type: !8, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DILocalVariable(name: "m", arg: 1, scope: !32, file: !1, line: 10, type: !10)
!34 = !DILocation(line: 10, column: 13, scope: !32)
!35 = !DILocalVariable(name: "n", arg: 2, scope: !32, file: !1, line: 10, type: !10)
!36 = !DILocation(line: 10, column: 20, scope: !32)
!37 = !DILocation(line: 12, column: 16, scope: !32)
!38 = !DILocation(line: 12, column: 24, scope: !32)
!39 = !DILocation(line: 12, column: 27, scope: !32)
!40 = !DILocation(line: 12, column: 20, scope: !32)
!41 = !DILocation(line: 12, column: 18, scope: !32)
!42 = !DILocation(line: 12, column: 32, scope: !32)
!43 = !DILocation(line: 12, column: 30, scope: !32)
!44 = !DILocation(line: 12, column: 9, scope: !32)
!45 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 15, type: !46, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!10}
!48 = !DILocation(line: 17, column: 38, scope: !45)
!49 = !DILocation(line: 17, column: 9, scope: !45)
!50 = !DILocation(line: 18, column: 9, scope: !45)
