; ModuleID = 'find-limit-of-recursion-2.c'
source_filename = "find-limit-of-recursion-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@base = common dso_local global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [7 x i8] c"%p %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"pos of v: %p\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @get_diff() #0 !dbg !12 {
entry:
  %x = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %x, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i8*, i8** @base, align 8, !dbg !17
  %sub.ptr.lhs.cast = ptrtoint i8* %0 to i64, !dbg !19
  %sub.ptr.rhs.cast = ptrtoint i8* %x to i64, !dbg !19
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !19
  %cmp = icmp slt i64 %sub.ptr.sub, 200, !dbg !20
  br i1 %cmp, label %if.then, label %if.end, !dbg !21, !cf.info !22

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @base, align 8, !dbg !23
  %sub.ptr.lhs.cast1 = ptrtoint i8* %1 to i64, !dbg !24
  %sub.ptr.rhs.cast2 = ptrtoint i8* %x to i64, !dbg !24
  %sub.ptr.sub3 = sub i64 %sub.ptr.lhs.cast1, %sub.ptr.rhs.cast2, !dbg !24
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* %x, i64 %sub.ptr.sub3), !dbg !25
  br label %if.end, !dbg !25

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !26
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @recur() #0 !dbg !27 {
entry:
  call void @get_diff(), !dbg !28
  call void @recur(), !dbg !29
  ret void, !dbg !30
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !31 {
entry:
  %retval = alloca i32, align 4
  %v = alloca i8, align 1
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i8* %v, metadata !35, metadata !DIExpression()), !dbg !36
  store i8 32, i8* %v, align 1, !dbg !36
  store i8* %v, i8** @base, align 8, !dbg !37
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i8* %v), !dbg !38
  call void @recur(), !dbg !39
  ret i32 0, !dbg !40
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10}
!llvm.ident = !{!11}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "base", scope: !2, file: !3, line: 3, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "find-limit-of-recursion-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Find-limit-of-recursion")
!4 = !{}
!5 = !{!0}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!12 = distinct !DISubprogram(name: "get_diff", scope: !3, file: !3, line: 4, type: !13, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "x", scope: !12, file: !3, line: 6, type: !7)
!16 = !DILocation(line: 6, column: 7, scope: !12)
!17 = !DILocation(line: 7, column: 6, scope: !18)
!18 = distinct !DILexicalBlock(scope: !12, file: !3, line: 7, column: 6)
!19 = !DILocation(line: 7, column: 11, scope: !18)
!20 = !DILocation(line: 7, column: 16, scope: !18)
!21 = !DILocation(line: 7, column: 6, scope: !12)
!22 = !{!"if"}
!23 = !DILocation(line: 8, column: 25, scope: !18)
!24 = !DILocation(line: 8, column: 30, scope: !18)
!25 = !DILocation(line: 8, column: 3, scope: !18)
!26 = !DILocation(line: 9, column: 1, scope: !12)
!27 = distinct !DISubprogram(name: "recur", scope: !3, file: !3, line: 11, type: !13, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!28 = !DILocation(line: 13, column: 2, scope: !27)
!29 = !DILocation(line: 14, column: 2, scope: !27)
!30 = !DILocation(line: 15, column: 1, scope: !27)
!31 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 17, type: !32, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!32 = !DISubroutineType(types: !33)
!33 = !{!34}
!34 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!35 = !DILocalVariable(name: "v", scope: !31, file: !3, line: 19, type: !7)
!36 = !DILocation(line: 19, column: 7, scope: !31)
!37 = !DILocation(line: 20, column: 32, scope: !31)
!38 = !DILocation(line: 20, column: 2, scope: !31)
!39 = !DILocation(line: 21, column: 2, scope: !31)
!40 = !DILocation(line: 22, column: 2, scope: !31)
