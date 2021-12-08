; ModuleID = 'create-an-object-at-a-given-address-1.bc'
source_filename = "create-an-object-at-a-given-address-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"%p: %08x (=%08x)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !10 {
entry:
  %retval = alloca i32, align 4
  %intspace = alloca i32, align 4
  %address = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %intspace, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32** %address, metadata !16, metadata !DIExpression()), !dbg !18
  store i32* %intspace, i32** %address, align 8, !dbg !19
  %0 = load i32*, i32** %address, align 8, !dbg !20
  store i32 65535, i32* %0, align 4, !dbg !21
  %1 = load i32*, i32** %address, align 8, !dbg !22
  %2 = load i32*, i32** %address, align 8, !dbg !23
  %3 = load i32, i32* %2, align 4, !dbg !24
  %4 = load i32, i32* %intspace, align 4, !dbg !25
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0), i32* %1, i32 %3, i32 %4), !dbg !26
  %5 = load i32*, i32** %address, align 8, !dbg !27
  %6 = bitcast i32* %5 to i8*, !dbg !28
  store i8 0, i8* %6, align 1, !dbg !29
  %7 = load i32*, i32** %address, align 8, !dbg !30
  %8 = bitcast i32* %7 to i8*, !dbg !31
  %add.ptr = getelementptr inbounds i8, i8* %8, i64 1, !dbg !32
  store i8 0, i8* %add.ptr, align 1, !dbg !33
  %9 = load i32*, i32** %address, align 8, !dbg !34
  %10 = bitcast i32* %9 to i8*, !dbg !35
  %add.ptr1 = getelementptr inbounds i8, i8* %10, i64 2, !dbg !36
  store i8 -1, i8* %add.ptr1, align 1, !dbg !37
  %11 = load i32*, i32** %address, align 8, !dbg !38
  %12 = bitcast i32* %11 to i8*, !dbg !39
  %add.ptr2 = getelementptr inbounds i8, i8* %12, i64 3, !dbg !40
  store i8 -1, i8* %add.ptr2, align 1, !dbg !41
  %13 = load i32*, i32** %address, align 8, !dbg !42
  %14 = load i32*, i32** %address, align 8, !dbg !43
  %15 = load i32, i32* %14, align 4, !dbg !44
  %16 = load i32, i32* %intspace, align 4, !dbg !45
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0), i32* %13, i32 %15, i32 %16), !dbg !46
  ret i32 0, !dbg !47
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "create-an-object-at-a-given-address-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Create-an-object-at-a-given-address")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !11, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "intspace", scope: !10, file: !1, line: 5, type: !13)
!15 = !DILocation(line: 5, column: 7, scope: !10)
!16 = !DILocalVariable(name: "address", scope: !10, file: !1, line: 6, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!18 = !DILocation(line: 6, column: 8, scope: !10)
!19 = !DILocation(line: 8, column: 11, scope: !10)
!20 = !DILocation(line: 9, column: 4, scope: !10)
!21 = !DILocation(line: 9, column: 12, scope: !10)
!22 = !DILocation(line: 10, column: 32, scope: !10)
!23 = !DILocation(line: 10, column: 42, scope: !10)
!24 = !DILocation(line: 10, column: 41, scope: !10)
!25 = !DILocation(line: 10, column: 51, scope: !10)
!26 = !DILocation(line: 10, column: 3, scope: !10)
!27 = !DILocation(line: 12, column: 12, scope: !10)
!28 = !DILocation(line: 12, column: 3, scope: !10)
!29 = !DILocation(line: 12, column: 21, scope: !10)
!30 = !DILocation(line: 13, column: 12, scope: !10)
!31 = !DILocation(line: 13, column: 5, scope: !10)
!32 = !DILocation(line: 13, column: 19, scope: !10)
!33 = !DILocation(line: 13, column: 23, scope: !10)
!34 = !DILocation(line: 14, column: 12, scope: !10)
!35 = !DILocation(line: 14, column: 5, scope: !10)
!36 = !DILocation(line: 14, column: 19, scope: !10)
!37 = !DILocation(line: 14, column: 23, scope: !10)
!38 = !DILocation(line: 15, column: 12, scope: !10)
!39 = !DILocation(line: 15, column: 5, scope: !10)
!40 = !DILocation(line: 15, column: 19, scope: !10)
!41 = !DILocation(line: 15, column: 23, scope: !10)
!42 = !DILocation(line: 17, column: 32, scope: !10)
!43 = !DILocation(line: 17, column: 42, scope: !10)
!44 = !DILocation(line: 17, column: 41, scope: !10)
!45 = !DILocation(line: 17, column: 51, scope: !10)
!46 = !DILocation(line: 17, column: 3, scope: !10)
!47 = !DILocation(line: 18, column: 3, scope: !10)
