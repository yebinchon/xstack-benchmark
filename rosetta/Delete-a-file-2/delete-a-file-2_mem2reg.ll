; ModuleID = 'delete-a-file-2.ll'
source_filename = "delete-a-file-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"input.txt\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"/input.txt\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"docs\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"/docs\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %call = call i32 @unlink(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #2, !dbg !11
  %call1 = call i32 @unlink(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0)) #2, !dbg !12
  %call2 = call i32 @rmdir(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)) #2, !dbg !13
  %call3 = call i32 @rmdir(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0)) #2, !dbg !14
  ret i32 0, !dbg !15
}

; Function Attrs: nounwind
declare dso_local i32 @unlink(i8*) #1

; Function Attrs: nounwind
declare dso_local i32 @rmdir(i8*) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "delete-a-file-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Delete-a-file-2")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocation(line: 4, column: 3, scope: !7)
!12 = !DILocation(line: 5, column: 3, scope: !7)
!13 = !DILocation(line: 6, column: 3, scope: !7)
!14 = !DILocation(line: 7, column: 3, scope: !7)
!15 = !DILocation(line: 8, column: 3, scope: !7)
