; ModuleID = 'create-a-file-on-magnetic-tape.c'
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
  %retval = alloca i32, align 4
  %fp = alloca %struct._IO_FILE*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fp, metadata !11, metadata !DIExpression()), !dbg !74
  %call = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8, !dbg !74
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !76
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !78
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([94 x i8], [94 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !80
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([90 x i8], [90 x i8]* @.str.4, i64 0, i64 0)), !dbg !81
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !82
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([125 x i8], [125 x i8]* @.str.5, i64 0, i64 0)), !dbg !83
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !84
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.6, i64 0, i64 0)), !dbg !85
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !86
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([113 x i8], [113 x i8]* @.str.7, i64 0, i64 0)), !dbg !87
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !88
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([127 x i8], [127 x i8]* @.str.8, i64 0, i64 0)), !dbg !89
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !90
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0)), !dbg !91
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !92
  %call9 = call i32 @fclose(%struct._IO_FILE* %8), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #2

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

declare dso_local i32 @fclose(%struct._IO_FILE*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "create-a-file-on-magnetic-tape.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Create-a-file-on-magnetic-tape")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "fp", scope: !7, file: !1, line: 5, type: !12)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !14, line: 7, baseType: !15)
!14 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !16, line: 49, size: 1728, elements: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!17 = !{!18, !19, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !35, !37, !38, !39, !43, !45, !47, !51, !54, !56, !59, !62, !63, !65, !69, !70}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !15, file: !16, line: 51, baseType: !10, size: 32)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !15, file: !16, line: 54, baseType: !20, size: 64, offset: 64)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !15, file: !16, line: 55, baseType: !20, size: 64, offset: 128)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !15, file: !16, line: 56, baseType: !20, size: 64, offset: 192)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !15, file: !16, line: 57, baseType: !20, size: 64, offset: 256)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !15, file: !16, line: 58, baseType: !20, size: 64, offset: 320)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !15, file: !16, line: 59, baseType: !20, size: 64, offset: 384)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !15, file: !16, line: 60, baseType: !20, size: 64, offset: 448)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !15, file: !16, line: 61, baseType: !20, size: 64, offset: 512)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !15, file: !16, line: 64, baseType: !20, size: 64, offset: 576)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !15, file: !16, line: 65, baseType: !20, size: 64, offset: 640)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !15, file: !16, line: 66, baseType: !20, size: 64, offset: 704)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !15, file: !16, line: 68, baseType: !33, size: 64, offset: 768)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !16, line: 36, flags: DIFlagFwdDecl)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !15, file: !16, line: 70, baseType: !36, size: 64, offset: 832)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !15, file: !16, line: 72, baseType: !10, size: 32, offset: 896)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !15, file: !16, line: 73, baseType: !10, size: 32, offset: 928)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !15, file: !16, line: 74, baseType: !40, size: 64, offset: 960)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !41, line: 152, baseType: !42)
!41 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!42 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !15, file: !16, line: 77, baseType: !44, size: 16, offset: 1024)
!44 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !15, file: !16, line: 78, baseType: !46, size: 8, offset: 1040)
!46 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !15, file: !16, line: 79, baseType: !48, size: 8, offset: 1048)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 8, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 1)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !15, file: !16, line: 81, baseType: !52, size: 64, offset: 1088)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !16, line: 43, baseType: null)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !15, file: !16, line: 89, baseType: !55, size: 64, offset: 1152)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !41, line: 153, baseType: !42)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !15, file: !16, line: 91, baseType: !57, size: 64, offset: 1216)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !16, line: 37, flags: DIFlagFwdDecl)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !15, file: !16, line: 92, baseType: !60, size: 64, offset: 1280)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !16, line: 38, flags: DIFlagFwdDecl)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !15, file: !16, line: 93, baseType: !36, size: 64, offset: 1344)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !15, file: !16, line: 94, baseType: !64, size: 64, offset: 1408)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !15, file: !16, line: 95, baseType: !66, size: 64, offset: 1472)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !67, line: 46, baseType: !68)
!67 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!68 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !15, file: !16, line: 96, baseType: !10, size: 32, offset: 1536)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !15, file: !16, line: 98, baseType: !71, size: 160, offset: 1568)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 160, elements: !72)
!72 = !{!73}
!73 = !DISubrange(count: 20)
!74 = !DILocation(line: 5, column: 8, scope: !7)
!75 = !DILocation(line: 5, column: 13, scope: !7)
!76 = !DILocation(line: 7, column: 10, scope: !7)
!77 = !DILocation(line: 7, column: 2, scope: !7)
!78 = !DILocation(line: 8, column: 10, scope: !7)
!79 = !DILocation(line: 8, column: 2, scope: !7)
!80 = !DILocation(line: 9, column: 10, scope: !7)
!81 = !DILocation(line: 9, column: 2, scope: !7)
!82 = !DILocation(line: 10, column: 10, scope: !7)
!83 = !DILocation(line: 10, column: 2, scope: !7)
!84 = !DILocation(line: 11, column: 10, scope: !7)
!85 = !DILocation(line: 11, column: 2, scope: !7)
!86 = !DILocation(line: 12, column: 10, scope: !7)
!87 = !DILocation(line: 12, column: 2, scope: !7)
!88 = !DILocation(line: 13, column: 10, scope: !7)
!89 = !DILocation(line: 13, column: 2, scope: !7)
!90 = !DILocation(line: 14, column: 10, scope: !7)
!91 = !DILocation(line: 14, column: 2, scope: !7)
!92 = !DILocation(line: 16, column: 9, scope: !7)
!93 = !DILocation(line: 16, column: 2, scope: !7)
!94 = !DILocation(line: 18, column: 2, scope: !7)
