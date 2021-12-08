; ModuleID = 'case-sensitivity-of-identifiers.bc'
source_filename = "case-sensitivity-of-identifiers.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [41 x i8] c"The three dogs are named %s, %s and %s.\0A\00", align 1
@dog = internal global i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), align 8, !dbg !0
@Dog = internal global i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), align 8, !dbg !6
@DOG = internal global i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), align 8, !dbg !11
@.str.1 = private unnamed_addr constant [9 x i8] c"Benjamin\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"Samba\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"Bernie\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !17 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %0 = load i8*, i8** @dog, align 8, !dbg !21
  %1 = load i8*, i8** @Dog, align 8, !dbg !22
  %2 = load i8*, i8** @DOG, align 8, !dbg !23
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str, i64 0, i64 0), i8* %0, i8* %1, i8* %2), !dbg !24
  ret i32 0, !dbg !25
}

declare dso_local i32 @printf(i8*, ...) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dog", scope: !2, file: !3, line: 3, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "case-sensitivity-of-identifiers.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Case-sensitivity-of-identifiers")
!4 = !{}
!5 = !{!0, !6, !11}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "Dog", scope: !2, file: !3, line: 4, type: !8, isLocal: true, isDefinition: true)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!10 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "DOG", scope: !2, file: !3, line: 5, type: !8, isLocal: true, isDefinition: true)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!17 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 7, type: !18, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!18 = !DISubroutineType(types: !19)
!19 = !{!20}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DILocation(line: 9, column: 57, scope: !17)
!22 = !DILocation(line: 9, column: 62, scope: !17)
!23 = !DILocation(line: 9, column: 67, scope: !17)
!24 = !DILocation(line: 9, column: 5, scope: !17)
!25 = !DILocation(line: 10, column: 5, scope: !17)
