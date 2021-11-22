; ModuleID = 'file-size-2.c'
source_filename = "file-size-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@.str = private unnamed_addr constant [10 x i8] c"input.txt\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"/input.txt\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %foo = alloca %struct.stat, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.stat* %foo, metadata !11, metadata !DIExpression()), !dbg !53
  %call = call i32 @stat(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), %struct.stat* %foo) #4, !dbg !54
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %foo, i32 0, i32 8, !dbg !55
  %0 = load i64, i64* %st_size, align 8, !dbg !55
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i64 %0), !dbg !56
  %call2 = call i32 @stat(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), %struct.stat* %foo) #4, !dbg !57
  %st_size3 = getelementptr inbounds %struct.stat, %struct.stat* %foo, i32 0, i32 8, !dbg !58
  %1 = load i64, i64* %st_size3, align 8, !dbg !58
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i64 %1), !dbg !59
  ret i32 0, !dbg !60
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @stat(i8*, %struct.stat*) #2

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "file-size-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/File-size")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 5, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "foo", scope: !7, file: !1, line: 7, type: !12)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !13, line: 46, size: 1152, elements: !14)
!13 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stat.h", directory: "")
!14 = !{!15, !19, !21, !23, !26, !28, !30, !31, !32, !35, !37, !39, !47, !48, !49}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !12, file: !13, line: 48, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !17, line: 145, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!18 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !12, file: !13, line: 53, baseType: !20, size: 64, offset: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !17, line: 148, baseType: !18)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !12, file: !13, line: 61, baseType: !22, size: 64, offset: 128)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !17, line: 151, baseType: !18)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !12, file: !13, line: 62, baseType: !24, size: 32, offset: 192)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !17, line: 150, baseType: !25)
!25 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !12, file: !13, line: 64, baseType: !27, size: 32, offset: 224)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !17, line: 146, baseType: !25)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !12, file: !13, line: 65, baseType: !29, size: 32, offset: 256)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !17, line: 147, baseType: !25)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !12, file: !13, line: 67, baseType: !10, size: 32, offset: 288)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !12, file: !13, line: 69, baseType: !16, size: 64, offset: 320)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !12, file: !13, line: 74, baseType: !33, size: 64, offset: 384)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !17, line: 152, baseType: !34)
!34 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !12, file: !13, line: 78, baseType: !36, size: 64, offset: 448)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !17, line: 174, baseType: !34)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !12, file: !13, line: 80, baseType: !38, size: 64, offset: 512)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !17, line: 179, baseType: !34)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !12, file: !13, line: 91, baseType: !40, size: 128, offset: 576)
!40 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !41, line: 10, size: 128, elements: !42)
!41 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "")
!42 = !{!43, !45}
!43 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !40, file: !41, line: 12, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !17, line: 160, baseType: !34)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !40, file: !41, line: 16, baseType: !46, size: 64, offset: 64)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !17, line: 196, baseType: !34)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !12, file: !13, line: 92, baseType: !40, size: 128, offset: 704)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !12, file: !13, line: 93, baseType: !40, size: 128, offset: 832)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !12, file: !13, line: 106, baseType: !50, size: 192, offset: 960)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 192, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 3)
!53 = !DILocation(line: 7, column: 15, scope: !7)
!54 = !DILocation(line: 8, column: 3, scope: !7)
!55 = !DILocation(line: 9, column: 23, scope: !7)
!56 = !DILocation(line: 9, column: 3, scope: !7)
!57 = !DILocation(line: 10, column: 3, scope: !7)
!58 = !DILocation(line: 11, column: 23, scope: !7)
!59 = !DILocation(line: 11, column: 3, scope: !7)
!60 = !DILocation(line: 12, column: 3, scope: !7)
