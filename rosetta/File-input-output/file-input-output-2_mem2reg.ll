; ModuleID = 'file-input-output-2.ll'
source_filename = "file-input-output-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@.str = private unnamed_addr constant [7 x i8] c"infile\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"outfile\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @copy_file(i8* %in, i8* %out) #0 !dbg !7 {
entry:
  %buf = alloca [4096 x i8*], align 16
  %st = alloca %struct.stat, align 8
  call void @llvm.dbg.value(metadata i8* %in, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i8* %out, metadata !16, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 0, metadata !17, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata [4096 x i8*]* %buf, metadata !18, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %struct.stat* %st, metadata !24, metadata !DIExpression()), !dbg !66
  %call = call i32 (i8*, i32, ...) @open(i8* %in, i32 0), !dbg !67
  call void @llvm.dbg.value(metadata i32 %call, metadata !69, metadata !DIExpression()), !dbg !15
  %cmp = icmp eq i32 %call, -1, !dbg !70
  br i1 %cmp, label %if.then, label %if.end, !dbg !71, !cf.info !72

if.then:                                          ; preds = %entry
  br label %return, !dbg !73

if.end:                                           ; preds = %entry
  %call1 = call i32 @fstat(i32 %call, %struct.stat* %st) #4, !dbg !74
  %tobool = icmp ne i32 %call1, 0, !dbg !74
  br i1 %tobool, label %if.then2, label %if.end3, !dbg !76, !cf.info !72

if.then2:                                         ; preds = %if.end
  br label %bail, !dbg !77

if.end3:                                          ; preds = %if.end
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 3, !dbg !78
  %0 = load i32, i32* %st_mode, align 8, !dbg !78
  %and = and i32 %0, 511, !dbg !79
  %call4 = call i32 (i8*, i32, ...) @open(i8* %out, i32 577, i32 %and), !dbg !80
  call void @llvm.dbg.value(metadata i32 %call4, metadata !81, metadata !DIExpression()), !dbg !15
  %cmp5 = icmp eq i32 %call4, -1, !dbg !82
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !84, !cf.info !72

if.then6:                                         ; preds = %if.end3
  br label %bail, !dbg !85

if.end7:                                          ; preds = %if.end3
  br label %while.cond, !dbg !86

while.cond:                                       ; preds = %while.body, %if.end7
  %arraydecay = getelementptr inbounds [4096 x i8*], [4096 x i8*]* %buf, i64 0, i64 0, !dbg !87
  %1 = bitcast i8** %arraydecay to i8*, !dbg !87
  %call8 = call i64 @read(i32 %call, i8* %1, i64 4096), !dbg !88
  call void @llvm.dbg.value(metadata i64 %call8, metadata !89, metadata !DIExpression()), !dbg !15
  %cmp9 = icmp sgt i64 %call8, 0, !dbg !93
  br i1 %cmp9, label %while.body, label %while.end, !dbg !86

while.body:                                       ; preds = %while.cond
  %arraydecay10 = getelementptr inbounds [4096 x i8*], [4096 x i8*]* %buf, i64 0, i64 0, !dbg !94
  %2 = bitcast i8** %arraydecay10 to i8*, !dbg !94
  %call11 = call i64 @write(i32 %call4, i8* %2, i64 %call8), !dbg !95
  br label %while.cond, !dbg !86, !llvm.loop !96

while.end:                                        ; preds = %while.cond
  %tobool12 = icmp ne i64 %call8, 0, !dbg !98
  %3 = zext i1 %tobool12 to i64, !dbg !98
  %cond = select i1 %tobool12, i32 0, i32 1, !dbg !98
  call void @llvm.dbg.value(metadata i32 %cond, metadata !17, metadata !DIExpression()), !dbg !15
  br label %bail, !dbg !99

bail:                                             ; preds = %while.end, %if.then6, %if.then2
  %ret.0 = phi i32 [ 0, %if.then2 ], [ 0, %if.then6 ], [ %cond, %while.end ], !dbg !15
  %fout.0 = phi i32 [ undef, %if.then2 ], [ %call4, %if.then6 ], [ %call4, %while.end ]
  call void @llvm.dbg.value(metadata i32 %fout.0, metadata !81, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 %ret.0, metadata !17, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.label(metadata !100), !dbg !101
  %cmp13 = icmp ne i32 %call, -1, !dbg !102
  br i1 %cmp13, label %if.then14, label %if.end16, !dbg !104, !cf.info !72

if.then14:                                        ; preds = %bail
  %call15 = call i32 @close(i32 %call), !dbg !105
  br label %if.end16, !dbg !105

if.end16:                                         ; preds = %if.then14, %bail
  %cmp17 = icmp ne i32 %fout.0, -1, !dbg !106
  br i1 %cmp17, label %if.then18, label %if.end20, !dbg !108, !cf.info !72

if.then18:                                        ; preds = %if.end16
  %call19 = call i32 @close(i32 %fout.0), !dbg !109
  br label %if.end20, !dbg !109

if.end20:                                         ; preds = %if.then18, %if.end16
  br label %return, !dbg !110

return:                                           ; preds = %if.end20, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %ret.0, %if.end20 ], !dbg !15
  ret i32 %retval.0, !dbg !111
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @open(i8*, i32, ...) #2

; Function Attrs: nounwind
declare dso_local i32 @fstat(i32, %struct.stat*) #3

declare dso_local i64 @read(i32, i8*, i64) #2

declare dso_local i64 @write(i32, i8*, i64) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare dso_local i32 @close(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !112 {
entry:
  %call = call i32 @copy_file(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)), !dbg !115
  ret i32 0, !dbg !116
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "file-input-output-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/File-input-output")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "copy_file", scope: !1, file: !1, line: 7, type: !8, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "in", arg: 1, scope: !7, file: !1, line: 7, type: !11)
!15 = !DILocation(line: 0, scope: !7)
!16 = !DILocalVariable(name: "out", arg: 2, scope: !7, file: !1, line: 7, type: !11)
!17 = !DILocalVariable(name: "ret", scope: !7, file: !1, line: 9, type: !10)
!18 = !DILocalVariable(name: "buf", scope: !7, file: !1, line: 12, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 262144, elements: !21)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!21 = !{!22}
!22 = !DISubrange(count: 4096)
!23 = !DILocation(line: 12, column: 8, scope: !7)
!24 = !DILocalVariable(name: "st", scope: !7, file: !1, line: 13, type: !25)
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
!43 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !25, file: !26, line: 67, baseType: !10, size: 32, offset: 288)
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
!66 = !DILocation(line: 13, column: 14, scope: !7)
!67 = !DILocation(line: 15, column: 14, scope: !68)
!68 = distinct !DILexicalBlock(scope: !7, file: !1, line: 15, column: 6)
!69 = !DILocalVariable(name: "fin", scope: !7, file: !1, line: 10, type: !10)
!70 = !DILocation(line: 15, column: 35, scope: !68)
!71 = !DILocation(line: 15, column: 6, scope: !7)
!72 = !{!"if"}
!73 = !DILocation(line: 15, column: 42, scope: !68)
!74 = !DILocation(line: 16, column: 6, scope: !75)
!75 = distinct !DILexicalBlock(scope: !7, file: !1, line: 16, column: 6)
!76 = !DILocation(line: 16, column: 6, scope: !7)
!77 = !DILocation(line: 16, column: 23, scope: !75)
!78 = !DILocation(line: 19, column: 48, scope: !7)
!79 = !DILocation(line: 19, column: 56, scope: !7)
!80 = !DILocation(line: 19, column: 9, scope: !7)
!81 = !DILocalVariable(name: "fout", scope: !7, file: !1, line: 10, type: !10)
!82 = !DILocation(line: 20, column: 11, scope: !83)
!83 = distinct !DILexicalBlock(scope: !7, file: !1, line: 20, column: 6)
!84 = !DILocation(line: 20, column: 6, scope: !7)
!85 = !DILocation(line: 20, column: 18, scope: !83)
!86 = !DILocation(line: 22, column: 2, scope: !7)
!87 = !DILocation(line: 22, column: 26, scope: !7)
!88 = !DILocation(line: 22, column: 16, scope: !7)
!89 = !DILocalVariable(name: "len", scope: !7, file: !1, line: 11, type: !90)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !91, line: 220, baseType: !92)
!91 = !DIFile(filename: "/usr/include/unistd.h", directory: "")
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ssize_t", file: !30, line: 193, baseType: !47)
!93 = !DILocation(line: 22, column: 38, scope: !7)
!94 = !DILocation(line: 23, column: 15, scope: !7)
!95 = !DILocation(line: 23, column: 3, scope: !7)
!96 = distinct !{!96, !86, !97}
!97 = !DILocation(line: 23, column: 23, scope: !7)
!98 = !DILocation(line: 25, column: 8, scope: !7)
!99 = !DILocation(line: 25, column: 2, scope: !7)
!100 = !DILabel(scope: !7, name: "bail", file: !1, line: 27)
!101 = !DILocation(line: 27, column: 1, scope: !7)
!102 = !DILocation(line: 27, column: 15, scope: !103)
!103 = distinct !DILexicalBlock(scope: !7, file: !1, line: 27, column: 11)
!104 = !DILocation(line: 27, column: 11, scope: !7)
!105 = !DILocation(line: 27, column: 23, scope: !103)
!106 = !DILocation(line: 28, column: 11, scope: !107)
!107 = distinct !DILexicalBlock(scope: !7, file: !1, line: 28, column: 6)
!108 = !DILocation(line: 28, column: 6, scope: !7)
!109 = !DILocation(line: 28, column: 18, scope: !107)
!110 = !DILocation(line: 29, column: 2, scope: !7)
!111 = !DILocation(line: 30, column: 1, scope: !7)
!112 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 32, type: !113, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DISubroutineType(types: !114)
!114 = !{!10}
!115 = !DILocation(line: 34, column: 2, scope: !112)
!116 = !DILocation(line: 35, column: 2, scope: !112)
