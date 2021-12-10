; ModuleID = 'make-directory-path.ll'
source_filename = "make-directory-path.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [18 x i8] c"usage: %s <path>\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@.str.2 = private unnamed_addr constant [30 x i8] c"couldn't create directory %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !9 {
entry:
  %statBuf = alloca %struct.stat, align 8
  call void @llvm.dbg.value(metadata i32 %argc, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i8** %argv, metadata !18, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata %struct.stat* %statBuf, metadata !19, metadata !DIExpression()), !dbg !61
  %cmp = icmp ne i32 %argc, 2, !dbg !62
  br i1 %cmp, label %if.then, label %if.end, !dbg !64

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !65
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 0, !dbg !67
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !67
  %call = call i8* @__xpg_basename(i8* %1) #5, !dbg !68
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0), i8* %call), !dbg !69
  call void @exit(i32 1) #6, !dbg !70
  unreachable, !dbg !70

if.end:                                           ; preds = %entry
  %arrayidx2 = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !71
  %2 = load i8*, i8** %arrayidx2, align 8, !dbg !71
  call void @llvm.dbg.value(metadata i8* %2, metadata !72, metadata !DIExpression()), !dbg !17
  br label %while.cond, !dbg !73

while.cond:                                       ; preds = %if.end20, %if.end
  %s.0 = phi i8* [ %2, %if.end ], [ null, %if.end20 ], !dbg !17
  call void @llvm.dbg.value(metadata i8* %s.0, metadata !72, metadata !DIExpression()), !dbg !17
  %call3 = call i8* @strtok(i8* %s.0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)) #5, !dbg !74
  call void @llvm.dbg.value(metadata i8* %call3, metadata !75, metadata !DIExpression()), !dbg !17
  %cmp4 = icmp ne i8* %call3, null, !dbg !76
  br i1 %cmp4, label %while.body, label %while.end, !dbg !73

while.body:                                       ; preds = %while.cond
  %cmp5 = icmp ne i8* %call3, %s.0, !dbg !77
  br i1 %cmp5, label %if.then6, label %if.end8, !dbg !80

if.then6:                                         ; preds = %while.body
  %arrayidx7 = getelementptr inbounds i8, i8* %call3, i64 -1, !dbg !81
  store i8 47, i8* %arrayidx7, align 1, !dbg !83
  br label %if.end8, !dbg !84

if.end8:                                          ; preds = %if.then6, %while.body
  %arrayidx9 = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !85
  %3 = load i8*, i8** %arrayidx9, align 8, !dbg !85
  %call10 = call i32 @stat(i8* %3, %struct.stat* %statBuf) #5, !dbg !87
  %cmp11 = icmp eq i32 %call10, -1, !dbg !88
  br i1 %cmp11, label %if.then12, label %if.else, !dbg !89

if.then12:                                        ; preds = %if.end8
  %arrayidx13 = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !90
  %4 = load i8*, i8** %arrayidx13, align 8, !dbg !90
  %call14 = call i32 @mkdir(i8* %4, i32 0) #5, !dbg !92
  br label %if.end20, !dbg !93

if.else:                                          ; preds = %if.end8
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %statBuf, i32 0, i32 3, !dbg !94
  %5 = load i32, i32* %st_mode, align 8, !dbg !94
  %and = and i32 %5, 61440, !dbg !94
  %cmp15 = icmp eq i32 %and, 16384, !dbg !94
  br i1 %cmp15, label %if.end19, label %if.then16, !dbg !97

if.then16:                                        ; preds = %if.else
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !98
  %arrayidx17 = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !100
  %7 = load i8*, i8** %arrayidx17, align 8, !dbg !100
  %call18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.2, i64 0, i64 0), i8* %7), !dbg !101
  call void @exit(i32 1) #6, !dbg !102
  unreachable, !dbg !102

if.end19:                                         ; preds = %if.else
  br label %if.end20

if.end20:                                         ; preds = %if.end19, %if.then12
  call void @llvm.dbg.value(metadata i8* null, metadata !72, metadata !DIExpression()), !dbg !17
  br label %while.cond, !dbg !73, !llvm.loop !103

while.end:                                        ; preds = %while.cond
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare dso_local i8* @__xpg_basename(i8*) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: nounwind
declare dso_local i8* @strtok(i8*, i8*) #3

; Function Attrs: nounwind
declare dso_local i32 @stat(i8*, %struct.stat*) #3

; Function Attrs: nounwind
declare dso_local i32 @mkdir(i8*, i32) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "make-directory-path.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Make-directory-path")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 8, type: !10, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !12, !13}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "argc", arg: 1, scope: !9, file: !1, line: 8, type: !12)
!17 = !DILocation(line: 0, scope: !9)
!18 = !DILocalVariable(name: "argv", arg: 2, scope: !9, file: !1, line: 8, type: !13)
!19 = !DILocalVariable(name: "statBuf", scope: !9, file: !1, line: 10, type: !20)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !21, line: 46, size: 1152, elements: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stat.h", directory: "")
!22 = !{!23, !27, !29, !31, !34, !36, !38, !39, !40, !43, !45, !47, !55, !56, !57}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !20, file: !21, line: 48, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !25, line: 145, baseType: !26)
!25 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!26 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !20, file: !21, line: 53, baseType: !28, size: 64, offset: 64)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !25, line: 148, baseType: !26)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !20, file: !21, line: 61, baseType: !30, size: 64, offset: 128)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !25, line: 151, baseType: !26)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !20, file: !21, line: 62, baseType: !32, size: 32, offset: 192)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !25, line: 150, baseType: !33)
!33 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !20, file: !21, line: 64, baseType: !35, size: 32, offset: 224)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !25, line: 146, baseType: !33)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !20, file: !21, line: 65, baseType: !37, size: 32, offset: 256)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !25, line: 147, baseType: !33)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !20, file: !21, line: 67, baseType: !12, size: 32, offset: 288)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !20, file: !21, line: 69, baseType: !24, size: 64, offset: 320)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !20, file: !21, line: 74, baseType: !41, size: 64, offset: 384)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !25, line: 152, baseType: !42)
!42 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !20, file: !21, line: 78, baseType: !44, size: 64, offset: 448)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !25, line: 174, baseType: !42)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !20, file: !21, line: 80, baseType: !46, size: 64, offset: 512)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !25, line: 179, baseType: !42)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !20, file: !21, line: 91, baseType: !48, size: 128, offset: 576)
!48 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !49, line: 10, size: 128, elements: !50)
!49 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "")
!50 = !{!51, !53}
!51 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !48, file: !49, line: 12, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !25, line: 160, baseType: !42)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !48, file: !49, line: 16, baseType: !54, size: 64, offset: 64)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !25, line: 196, baseType: !42)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !20, file: !21, line: 92, baseType: !48, size: 128, offset: 704)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !20, file: !21, line: 93, baseType: !48, size: 128, offset: 832)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !20, file: !21, line: 106, baseType: !58, size: 192, offset: 960)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !54, size: 192, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 3)
!61 = !DILocation(line: 10, column: 17, scope: !9)
!62 = !DILocation(line: 12, column: 14, scope: !63)
!63 = distinct !DILexicalBlock(scope: !9, file: !1, line: 12, column: 9)
!64 = !DILocation(line: 12, column: 9, scope: !9)
!65 = !DILocation(line: 13, column: 18, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !1, line: 12, column: 20)
!67 = !DILocation(line: 13, column: 58, scope: !66)
!68 = !DILocation(line: 13, column: 48, scope: !66)
!69 = !DILocation(line: 13, column: 9, scope: !66)
!70 = !DILocation(line: 14, column: 9, scope: !66)
!71 = !DILocation(line: 16, column: 9, scope: !9)
!72 = !DILocalVariable(name: "s", scope: !9, file: !1, line: 9, type: !14)
!73 = !DILocation(line: 17, column: 5, scope: !9)
!74 = !DILocation(line: 17, column: 19, scope: !9)
!75 = !DILocalVariable(name: "str", scope: !9, file: !1, line: 9, type: !14)
!76 = !DILocation(line: 17, column: 36, scope: !9)
!77 = !DILocation(line: 18, column: 17, scope: !78)
!78 = distinct !DILexicalBlock(scope: !79, file: !1, line: 18, column: 13)
!79 = distinct !DILexicalBlock(scope: !9, file: !1, line: 17, column: 45)
!80 = !DILocation(line: 18, column: 13, scope: !79)
!81 = !DILocation(line: 19, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !1, line: 18, column: 23)
!83 = !DILocation(line: 19, column: 21, scope: !82)
!84 = !DILocation(line: 20, column: 9, scope: !82)
!85 = !DILocation(line: 21, column: 19, scope: !86)
!86 = distinct !DILexicalBlock(scope: !79, file: !1, line: 21, column: 13)
!87 = !DILocation(line: 21, column: 13, scope: !86)
!88 = !DILocation(line: 21, column: 38, scope: !86)
!89 = !DILocation(line: 21, column: 13, scope: !79)
!90 = !DILocation(line: 22, column: 20, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !1, line: 21, column: 45)
!92 = !DILocation(line: 22, column: 13, scope: !91)
!93 = !DILocation(line: 23, column: 9, scope: !91)
!94 = !DILocation(line: 24, column: 19, scope: !95)
!95 = distinct !DILexicalBlock(scope: !96, file: !1, line: 24, column: 17)
!96 = distinct !DILexicalBlock(scope: !86, file: !1, line: 23, column: 16)
!97 = !DILocation(line: 24, column: 17, scope: !96)
!98 = !DILocation(line: 25, column: 26, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !1, line: 24, column: 46)
!100 = !DILocation(line: 25, column: 68, scope: !99)
!101 = !DILocation(line: 25, column: 17, scope: !99)
!102 = !DILocation(line: 26, column: 17, scope: !99)
!103 = distinct !{!103, !73, !104}
!104 = !DILocation(line: 30, column: 5, scope: !9)
!105 = !DILocation(line: 31, column: 5, scope: !9)
