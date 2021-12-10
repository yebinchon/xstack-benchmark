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
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %str = alloca i8*, align 8
  %s = alloca i8*, align 8
  %statBuf = alloca %struct.stat, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !16, metadata !DIExpression()), !dbg !17
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %str, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i8** %s, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %struct.stat* %statBuf, metadata !24, metadata !DIExpression()), !dbg !66
  %0 = load i32, i32* %argc.addr, align 4, !dbg !67
  %cmp = icmp ne i32 %0, 2, !dbg !69
  br i1 %cmp, label %if.then, label %if.end, !dbg !70

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !71
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i8*, i8** %2, i64 0, !dbg !73
  %3 = load i8*, i8** %arrayidx, align 8, !dbg !73
  %call = call i8* @__xpg_basename(i8* %3) #5, !dbg !74
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0), i8* %call), !dbg !75
  call void @exit(i32 1) #6, !dbg !76
  unreachable, !dbg !76

if.end:                                           ; preds = %entry
  %4 = load i8**, i8*** %argv.addr, align 8, !dbg !77
  %arrayidx2 = getelementptr inbounds i8*, i8** %4, i64 1, !dbg !77
  %5 = load i8*, i8** %arrayidx2, align 8, !dbg !77
  store i8* %5, i8** %s, align 8, !dbg !78
  br label %while.cond, !dbg !79

while.cond:                                       ; preds = %if.end20, %if.end
  %6 = load i8*, i8** %s, align 8, !dbg !80
  %call3 = call i8* @strtok(i8* %6, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)) #5, !dbg !81
  store i8* %call3, i8** %str, align 8, !dbg !82
  %cmp4 = icmp ne i8* %call3, null, !dbg !83
  br i1 %cmp4, label %while.body, label %while.end, !dbg !79

while.body:                                       ; preds = %while.cond
  %7 = load i8*, i8** %str, align 8, !dbg !84
  %8 = load i8*, i8** %s, align 8, !dbg !87
  %cmp5 = icmp ne i8* %7, %8, !dbg !88
  br i1 %cmp5, label %if.then6, label %if.end8, !dbg !89

if.then6:                                         ; preds = %while.body
  %9 = load i8*, i8** %str, align 8, !dbg !90
  %arrayidx7 = getelementptr inbounds i8, i8* %9, i64 -1, !dbg !90
  store i8 47, i8* %arrayidx7, align 1, !dbg !92
  br label %if.end8, !dbg !93

if.end8:                                          ; preds = %if.then6, %while.body
  %10 = load i8**, i8*** %argv.addr, align 8, !dbg !94
  %arrayidx9 = getelementptr inbounds i8*, i8** %10, i64 1, !dbg !94
  %11 = load i8*, i8** %arrayidx9, align 8, !dbg !94
  %call10 = call i32 @stat(i8* %11, %struct.stat* %statBuf) #5, !dbg !96
  %cmp11 = icmp eq i32 %call10, -1, !dbg !97
  br i1 %cmp11, label %if.then12, label %if.else, !dbg !98

if.then12:                                        ; preds = %if.end8
  %12 = load i8**, i8*** %argv.addr, align 8, !dbg !99
  %arrayidx13 = getelementptr inbounds i8*, i8** %12, i64 1, !dbg !99
  %13 = load i8*, i8** %arrayidx13, align 8, !dbg !99
  %call14 = call i32 @mkdir(i8* %13, i32 0) #5, !dbg !101
  br label %if.end20, !dbg !102

if.else:                                          ; preds = %if.end8
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %statBuf, i32 0, i32 3, !dbg !103
  %14 = load i32, i32* %st_mode, align 8, !dbg !103
  %and = and i32 %14, 61440, !dbg !103
  %cmp15 = icmp eq i32 %and, 16384, !dbg !103
  br i1 %cmp15, label %if.end19, label %if.then16, !dbg !106

if.then16:                                        ; preds = %if.else
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !107
  %16 = load i8**, i8*** %argv.addr, align 8, !dbg !109
  %arrayidx17 = getelementptr inbounds i8*, i8** %16, i64 1, !dbg !109
  %17 = load i8*, i8** %arrayidx17, align 8, !dbg !109
  %call18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.2, i64 0, i64 0), i8* %17), !dbg !110
  call void @exit(i32 1) #6, !dbg !111
  unreachable, !dbg !111

if.end19:                                         ; preds = %if.else
  br label %if.end20

if.end20:                                         ; preds = %if.end19, %if.then12
  store i8* null, i8** %s, align 8, !dbg !112
  br label %while.cond, !dbg !79, !llvm.loop !113

while.end:                                        ; preds = %while.cond
  ret i32 0, !dbg !115
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
!17 = !DILocation(line: 8, column: 15, scope: !9)
!18 = !DILocalVariable(name: "argv", arg: 2, scope: !9, file: !1, line: 8, type: !13)
!19 = !DILocation(line: 8, column: 28, scope: !9)
!20 = !DILocalVariable(name: "str", scope: !9, file: !1, line: 9, type: !14)
!21 = !DILocation(line: 9, column: 11, scope: !9)
!22 = !DILocalVariable(name: "s", scope: !9, file: !1, line: 9, type: !14)
!23 = !DILocation(line: 9, column: 17, scope: !9)
!24 = !DILocalVariable(name: "statBuf", scope: !9, file: !1, line: 10, type: !25)
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !26, line: 46, size: 1152, elements: !27)
!26 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stat.h", directory: "")
!27 = !{!28, !32, !34, !36, !39, !41, !43, !44, !45, !48, !50, !52, !60, !61, !62}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !25, file: !26, line: 48, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !30, line: 145, baseType: !31)
!30 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!31 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !25, file: !26, line: 53, baseType: !33, size: 64, offset: 64)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !30, line: 148, baseType: !31)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !25, file: !26, line: 61, baseType: !35, size: 64, offset: 128)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !30, line: 151, baseType: !31)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !25, file: !26, line: 62, baseType: !37, size: 32, offset: 192)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !30, line: 150, baseType: !38)
!38 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !25, file: !26, line: 64, baseType: !40, size: 32, offset: 224)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !30, line: 146, baseType: !38)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !25, file: !26, line: 65, baseType: !42, size: 32, offset: 256)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !30, line: 147, baseType: !38)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !25, file: !26, line: 67, baseType: !12, size: 32, offset: 288)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !25, file: !26, line: 69, baseType: !29, size: 64, offset: 320)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !25, file: !26, line: 74, baseType: !46, size: 64, offset: 384)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !30, line: 152, baseType: !47)
!47 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !25, file: !26, line: 78, baseType: !49, size: 64, offset: 448)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !30, line: 174, baseType: !47)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !25, file: !26, line: 80, baseType: !51, size: 64, offset: 512)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !30, line: 179, baseType: !47)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !25, file: !26, line: 91, baseType: !53, size: 128, offset: 576)
!53 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !54, line: 10, size: 128, elements: !55)
!54 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "")
!55 = !{!56, !58}
!56 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !53, file: !54, line: 12, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !30, line: 160, baseType: !47)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !53, file: !54, line: 16, baseType: !59, size: 64, offset: 64)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !30, line: 196, baseType: !47)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !25, file: !26, line: 92, baseType: !53, size: 128, offset: 704)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !25, file: !26, line: 93, baseType: !53, size: 128, offset: 832)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !25, file: !26, line: 106, baseType: !63, size: 192, offset: 960)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 192, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 3)
!66 = !DILocation(line: 10, column: 17, scope: !9)
!67 = !DILocation(line: 12, column: 9, scope: !68)
!68 = distinct !DILexicalBlock(scope: !9, file: !1, line: 12, column: 9)
!69 = !DILocation(line: 12, column: 14, scope: !68)
!70 = !DILocation(line: 12, column: 9, scope: !9)
!71 = !DILocation(line: 13, column: 18, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !1, line: 12, column: 20)
!73 = !DILocation(line: 13, column: 58, scope: !72)
!74 = !DILocation(line: 13, column: 48, scope: !72)
!75 = !DILocation(line: 13, column: 9, scope: !72)
!76 = !DILocation(line: 14, column: 9, scope: !72)
!77 = !DILocation(line: 16, column: 9, scope: !9)
!78 = !DILocation(line: 16, column: 7, scope: !9)
!79 = !DILocation(line: 17, column: 5, scope: !9)
!80 = !DILocation(line: 17, column: 27, scope: !9)
!81 = !DILocation(line: 17, column: 19, scope: !9)
!82 = !DILocation(line: 17, column: 17, scope: !9)
!83 = !DILocation(line: 17, column: 36, scope: !9)
!84 = !DILocation(line: 18, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !86, file: !1, line: 18, column: 13)
!86 = distinct !DILexicalBlock(scope: !9, file: !1, line: 17, column: 45)
!87 = !DILocation(line: 18, column: 20, scope: !85)
!88 = !DILocation(line: 18, column: 17, scope: !85)
!89 = !DILocation(line: 18, column: 13, scope: !86)
!90 = !DILocation(line: 19, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !1, line: 18, column: 23)
!92 = !DILocation(line: 19, column: 21, scope: !91)
!93 = !DILocation(line: 20, column: 9, scope: !91)
!94 = !DILocation(line: 21, column: 19, scope: !95)
!95 = distinct !DILexicalBlock(scope: !86, file: !1, line: 21, column: 13)
!96 = !DILocation(line: 21, column: 13, scope: !95)
!97 = !DILocation(line: 21, column: 38, scope: !95)
!98 = !DILocation(line: 21, column: 13, scope: !86)
!99 = !DILocation(line: 22, column: 20, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !1, line: 21, column: 45)
!101 = !DILocation(line: 22, column: 13, scope: !100)
!102 = !DILocation(line: 23, column: 9, scope: !100)
!103 = !DILocation(line: 24, column: 19, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !1, line: 24, column: 17)
!105 = distinct !DILexicalBlock(scope: !95, file: !1, line: 23, column: 16)
!106 = !DILocation(line: 24, column: 17, scope: !105)
!107 = !DILocation(line: 25, column: 26, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !1, line: 24, column: 46)
!109 = !DILocation(line: 25, column: 68, scope: !108)
!110 = !DILocation(line: 25, column: 17, scope: !108)
!111 = !DILocation(line: 26, column: 17, scope: !108)
!112 = !DILocation(line: 29, column: 11, scope: !86)
!113 = distinct !{!113, !79, !114}
!114 = !DILocation(line: 30, column: 5, scope: !9)
!115 = !DILocation(line: 31, column: 5, scope: !9)
