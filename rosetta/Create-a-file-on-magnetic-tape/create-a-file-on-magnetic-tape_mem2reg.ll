; ModuleID = 'create-a-file-on-magnetic-tape.ll'
source_filename = "create-a-file-on-magnetic-tape.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [10 x i8] c"TAPE.FILE\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.2 = private unnamed_addr constant [60 x i8] c"This code should be able to write a file to magnetic tape.\0A\00", align 1
@.str.3 = private unnamed_addr constant [94 x i8] c"The Wikipedia page on Magnetic tape data storage shows that magnetic tapes are still in use.\0A\00", align 1
@.str.4 = private unnamed_addr constant [90 x i8] c"In fact, the latest format, at the time of writing this code is TS1155 released in 2017.\0A\00", align 1
@.str.5 = private unnamed_addr constant [125 x i8] c"And since C is already 44, maybe 45, years old in 2017, I am sure someone somewhere did use a C compiler on magnetic tapes.\0A\00", align 1
@.str.6 = private unnamed_addr constant [81 x i8] c"If you happen to have one, please try to compile and execute me on that system.\0A\00", align 1
@.str.7 = private unnamed_addr constant [113 x i8] c"My creator tested me on an i5 machine with SSD and RAM that couldn't have even been dreamt of by Denis Ritchie.\0A\00", align 1
@.str.8 = private unnamed_addr constant [127 x i8] c"Who knows ? Maybe he did foresee today, after all he created something which is still young after 44-45 years and counting...\0A\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"EOF\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %call = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !11
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call, metadata !12, metadata !DIExpression()), !dbg !75
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([94 x i8], [94 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([90 x i8], [90 x i8]* @.str.4, i64 0, i64 0)), !dbg !78
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([125 x i8], [125 x i8]* @.str.5, i64 0, i64 0)), !dbg !79
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.6, i64 0, i64 0)), !dbg !80
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([113 x i8], [113 x i8]* @.str.7, i64 0, i64 0)), !dbg !81
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([127 x i8], [127 x i8]* @.str.8, i64 0, i64 0)), !dbg !82
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0)), !dbg !83
  %call9 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #2

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

declare dso_local i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "create-a-file-on-magnetic-tape.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Create-a-file-on-magnetic-tape")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocation(line: 5, column: 13, scope: !7)
!12 = !DILocalVariable(name: "fp", scope: !7, file: !1, line: 5, type: !13)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !15, line: 7, baseType: !16)
!15 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !17, line: 49, size: 1728, elements: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!18 = !{!19, !20, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !36, !38, !39, !40, !44, !46, !48, !52, !55, !57, !60, !63, !64, !66, !70, !71}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !16, file: !17, line: 51, baseType: !10, size: 32)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !16, file: !17, line: 54, baseType: !21, size: 64, offset: 64)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !16, file: !17, line: 55, baseType: !21, size: 64, offset: 128)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !16, file: !17, line: 56, baseType: !21, size: 64, offset: 192)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !16, file: !17, line: 57, baseType: !21, size: 64, offset: 256)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !16, file: !17, line: 58, baseType: !21, size: 64, offset: 320)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !16, file: !17, line: 59, baseType: !21, size: 64, offset: 384)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !16, file: !17, line: 60, baseType: !21, size: 64, offset: 448)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !16, file: !17, line: 61, baseType: !21, size: 64, offset: 512)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !16, file: !17, line: 64, baseType: !21, size: 64, offset: 576)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !16, file: !17, line: 65, baseType: !21, size: 64, offset: 640)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !16, file: !17, line: 66, baseType: !21, size: 64, offset: 704)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !16, file: !17, line: 68, baseType: !34, size: 64, offset: 768)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !17, line: 36, flags: DIFlagFwdDecl)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !16, file: !17, line: 70, baseType: !37, size: 64, offset: 832)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !16, file: !17, line: 72, baseType: !10, size: 32, offset: 896)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !16, file: !17, line: 73, baseType: !10, size: 32, offset: 928)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !16, file: !17, line: 74, baseType: !41, size: 64, offset: 960)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !42, line: 152, baseType: !43)
!42 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!43 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !16, file: !17, line: 77, baseType: !45, size: 16, offset: 1024)
!45 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !16, file: !17, line: 78, baseType: !47, size: 8, offset: 1040)
!47 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !16, file: !17, line: 79, baseType: !49, size: 8, offset: 1048)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 8, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 1)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !16, file: !17, line: 81, baseType: !53, size: 64, offset: 1088)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !17, line: 43, baseType: null)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !16, file: !17, line: 89, baseType: !56, size: 64, offset: 1152)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !42, line: 153, baseType: !43)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !16, file: !17, line: 91, baseType: !58, size: 64, offset: 1216)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !17, line: 37, flags: DIFlagFwdDecl)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !16, file: !17, line: 92, baseType: !61, size: 64, offset: 1280)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !17, line: 38, flags: DIFlagFwdDecl)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !16, file: !17, line: 93, baseType: !37, size: 64, offset: 1344)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !16, file: !17, line: 94, baseType: !65, size: 64, offset: 1408)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !16, file: !17, line: 95, baseType: !67, size: 64, offset: 1472)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !68, line: 46, baseType: !69)
!68 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!69 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !16, file: !17, line: 96, baseType: !10, size: 32, offset: 1536)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !16, file: !17, line: 98, baseType: !72, size: 160, offset: 1568)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 160, elements: !73)
!73 = !{!74}
!74 = !DISubrange(count: 20)
!75 = !DILocation(line: 0, scope: !7)
!76 = !DILocation(line: 7, column: 2, scope: !7)
!77 = !DILocation(line: 8, column: 2, scope: !7)
!78 = !DILocation(line: 9, column: 2, scope: !7)
!79 = !DILocation(line: 10, column: 2, scope: !7)
!80 = !DILocation(line: 11, column: 2, scope: !7)
!81 = !DILocation(line: 12, column: 2, scope: !7)
!82 = !DILocation(line: 13, column: 2, scope: !7)
!83 = !DILocation(line: 14, column: 2, scope: !7)
!84 = !DILocation(line: 16, column: 2, scope: !7)
!85 = !DILocation(line: 18, column: 2, scope: !7)
