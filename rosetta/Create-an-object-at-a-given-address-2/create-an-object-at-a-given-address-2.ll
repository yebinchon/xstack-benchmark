; ModuleID = 'create-an-object-at-a-given-address-2.bc'
source_filename = "create-an-object-at-a-given-address-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !15 {
entry:
  %retval = alloca i32, align 4
  %dat = alloca i32, align 4
  %addr = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %dat, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i64* %addr, metadata !21, metadata !DIExpression()), !dbg !25
  %0 = load volatile i32, i32* inttoptr (i64 256 to i32*), align 4, !dbg !26
  %xor = xor i32 %0, 1, !dbg !26
  store volatile i32 %xor, i32* inttoptr (i64 256 to i32*), align 4, !dbg !26
  %1 = load volatile i32, i32* inttoptr (i64 256 to i32*), align 4, !dbg !27
  store i32 %1, i32* %dat, align 4, !dbg !28
  store i64 256, i64* %addr, align 8, !dbg !29
  ret i32 0, !dbg !30
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "create-an-object-at-a-given-address-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Create-an-object-at-a-given-address-2")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !6)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !7, line: 26, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !9, line: 42, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!15 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 7, type: !16, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DISubroutineType(types: !17)
!17 = !{!18}
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "dat", scope: !15, file: !1, line: 9, type: !6)
!20 = !DILocation(line: 9, column: 12, scope: !15)
!21 = !DILocalVariable(name: "addr", scope: !15, file: !1, line: 10, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !23, line: 46, baseType: !24)
!23 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!24 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!25 = !DILocation(line: 10, column: 10, scope: !15)
!26 = !DILocation(line: 12, column: 10, scope: !15)
!27 = !DILocation(line: 13, column: 9, scope: !15)
!28 = !DILocation(line: 13, column: 7, scope: !15)
!29 = !DILocation(line: 14, column: 8, scope: !15)
!30 = !DILocation(line: 16, column: 3, scope: !15)
