; ModuleID = 'file-input-output-2.c'
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
  %retval = alloca i32, align 4
  %in.addr = alloca i8*, align 8
  %out.addr = alloca i8*, align 8
  %ret = alloca i32, align 4
  %fin = alloca i32, align 4
  %fout = alloca i32, align 4
  %len = alloca i64, align 8
  %buf = alloca [4096 x i8*], align 16
  %st = alloca %struct.stat, align 8
  store i8* %in, i8** %in.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %in.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8* %out, i8** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %out.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 0, i32* %ret, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %fin, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %fout, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i64* %len, metadata !24, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [4096 x i8*]* %buf, metadata !31, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata %struct.stat* %st, metadata !37, metadata !DIExpression()), !dbg !77
  %0 = load i8*, i8** %in.addr, align 8, !dbg !78
  %call = call i32 (i8*, i32, ...) @open(i8* %0, i32 0), !dbg !80
  store i32 %call, i32* %fin, align 4, !dbg !81
  %cmp = icmp eq i32 %call, -1, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83, !cf.info !84

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !85
  br label %return, !dbg !85

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %fin, align 4, !dbg !86
  %call1 = call i32 @fstat(i32 %1, %struct.stat* %st) #4, !dbg !88
  %tobool = icmp ne i32 %call1, 0, !dbg !88
  br i1 %tobool, label %if.then2, label %if.end3, !dbg !89, !cf.info !84

if.then2:                                         ; preds = %if.end
  br label %bail, !dbg !90

if.end3:                                          ; preds = %if.end
  %2 = load i8*, i8** %out.addr, align 8, !dbg !91
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 3, !dbg !92
  %3 = load i32, i32* %st_mode, align 8, !dbg !92
  %and = and i32 %3, 511, !dbg !93
  %call4 = call i32 (i8*, i32, ...) @open(i8* %2, i32 577, i32 %and), !dbg !94
  store i32 %call4, i32* %fout, align 4, !dbg !95
  %4 = load i32, i32* %fout, align 4, !dbg !96
  %cmp5 = icmp eq i32 %4, -1, !dbg !98
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !99, !cf.info !84

if.then6:                                         ; preds = %if.end3
  br label %bail, !dbg !100

if.end7:                                          ; preds = %if.end3
  br label %while.cond, !dbg !101

while.cond:                                       ; preds = %while.body, %if.end7
  %5 = load i32, i32* %fin, align 4, !dbg !102
  %arraydecay = getelementptr inbounds [4096 x i8*], [4096 x i8*]* %buf, i64 0, i64 0, !dbg !103
  %6 = bitcast i8** %arraydecay to i8*, !dbg !103
  %call8 = call i64 @read(i32 %5, i8* %6, i64 4096), !dbg !104
  store i64 %call8, i64* %len, align 8, !dbg !105
  %cmp9 = icmp sgt i64 %call8, 0, !dbg !106
  br i1 %cmp9, label %while.body, label %while.end, !dbg !101

while.body:                                       ; preds = %while.cond
  %7 = load i32, i32* %fout, align 4, !dbg !107
  %arraydecay10 = getelementptr inbounds [4096 x i8*], [4096 x i8*]* %buf, i64 0, i64 0, !dbg !108
  %8 = bitcast i8** %arraydecay10 to i8*, !dbg !108
  %9 = load i64, i64* %len, align 8, !dbg !109
  %call11 = call i64 @write(i32 %7, i8* %8, i64 %9), !dbg !110
  br label %while.cond, !dbg !101, !llvm.loop !111

while.end:                                        ; preds = %while.cond
  %10 = load i64, i64* %len, align 8, !dbg !113
  %tobool12 = icmp ne i64 %10, 0, !dbg !113
  %11 = zext i1 %tobool12 to i64, !dbg !113
  %cond = select i1 %tobool12, i32 0, i32 1, !dbg !113
  store i32 %cond, i32* %ret, align 4, !dbg !114
  br label %bail, !dbg !115

bail:                                             ; preds = %while.end, %if.then6, %if.then2
  call void @llvm.dbg.label(metadata !116), !dbg !117
  %12 = load i32, i32* %fin, align 4, !dbg !118
  %cmp13 = icmp ne i32 %12, -1, !dbg !120
  br i1 %cmp13, label %if.then14, label %if.end16, !dbg !121, !cf.info !84

if.then14:                                        ; preds = %bail
  %13 = load i32, i32* %fin, align 4, !dbg !122
  %call15 = call i32 @close(i32 %13), !dbg !123
  br label %if.end16, !dbg !123

if.end16:                                         ; preds = %if.then14, %bail
  %14 = load i32, i32* %fout, align 4, !dbg !124
  %cmp17 = icmp ne i32 %14, -1, !dbg !126
  br i1 %cmp17, label %if.then18, label %if.end20, !dbg !127, !cf.info !84

if.then18:                                        ; preds = %if.end16
  %15 = load i32, i32* %fout, align 4, !dbg !128
  %call19 = call i32 @close(i32 %15), !dbg !129
  br label %if.end20, !dbg !129

if.end20:                                         ; preds = %if.then18, %if.end16
  %16 = load i32, i32* %ret, align 4, !dbg !130
  store i32 %16, i32* %retval, align 4, !dbg !131
  br label %return, !dbg !131

return:                                           ; preds = %if.end20, %if.then
  %17 = load i32, i32* %retval, align 4, !dbg !132
  ret i32 %17, !dbg !132
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
define dso_local i32 @main() #0 !dbg !133 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 @copy_file(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)), !dbg !136
  ret i32 0, !dbg !137
}

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
!15 = !DILocation(line: 7, column: 27, scope: !7)
!16 = !DILocalVariable(name: "out", arg: 2, scope: !7, file: !1, line: 7, type: !11)
!17 = !DILocation(line: 7, column: 43, scope: !7)
!18 = !DILocalVariable(name: "ret", scope: !7, file: !1, line: 9, type: !10)
!19 = !DILocation(line: 9, column: 6, scope: !7)
!20 = !DILocalVariable(name: "fin", scope: !7, file: !1, line: 10, type: !10)
!21 = !DILocation(line: 10, column: 6, scope: !7)
!22 = !DILocalVariable(name: "fout", scope: !7, file: !1, line: 10, type: !10)
!23 = !DILocation(line: 10, column: 11, scope: !7)
!24 = !DILocalVariable(name: "len", scope: !7, file: !1, line: 11, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !26, line: 220, baseType: !27)
!26 = !DIFile(filename: "/usr/include/unistd.h", directory: "")
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ssize_t", file: !28, line: 193, baseType: !29)
!28 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!29 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!30 = !DILocation(line: 11, column: 10, scope: !7)
!31 = !DILocalVariable(name: "buf", scope: !7, file: !1, line: 12, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 262144, elements: !34)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!34 = !{!35}
!35 = !DISubrange(count: 4096)
!36 = !DILocation(line: 12, column: 8, scope: !7)
!37 = !DILocalVariable(name: "st", scope: !7, file: !1, line: 13, type: !38)
!38 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !39, line: 46, size: 1152, elements: !40)
!39 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stat.h", directory: "")
!40 = !{!41, !44, !46, !48, !51, !53, !55, !56, !57, !59, !61, !63, !71, !72, !73}
!41 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !38, file: !39, line: 48, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !28, line: 145, baseType: !43)
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !38, file: !39, line: 53, baseType: !45, size: 64, offset: 64)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !28, line: 148, baseType: !43)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !38, file: !39, line: 61, baseType: !47, size: 64, offset: 128)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !28, line: 151, baseType: !43)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !38, file: !39, line: 62, baseType: !49, size: 32, offset: 192)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !28, line: 150, baseType: !50)
!50 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !38, file: !39, line: 64, baseType: !52, size: 32, offset: 224)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !28, line: 146, baseType: !50)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !38, file: !39, line: 65, baseType: !54, size: 32, offset: 256)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !28, line: 147, baseType: !50)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !38, file: !39, line: 67, baseType: !10, size: 32, offset: 288)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !38, file: !39, line: 69, baseType: !42, size: 64, offset: 320)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !38, file: !39, line: 74, baseType: !58, size: 64, offset: 384)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !28, line: 152, baseType: !29)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !38, file: !39, line: 78, baseType: !60, size: 64, offset: 448)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !28, line: 174, baseType: !29)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !38, file: !39, line: 80, baseType: !62, size: 64, offset: 512)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !28, line: 179, baseType: !29)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !38, file: !39, line: 91, baseType: !64, size: 128, offset: 576)
!64 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !65, line: 10, size: 128, elements: !66)
!65 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "")
!66 = !{!67, !69}
!67 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !64, file: !65, line: 12, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !28, line: 160, baseType: !29)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !64, file: !65, line: 16, baseType: !70, size: 64, offset: 64)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !28, line: 196, baseType: !29)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !38, file: !39, line: 92, baseType: !64, size: 128, offset: 704)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !38, file: !39, line: 93, baseType: !64, size: 128, offset: 832)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !38, file: !39, line: 106, baseType: !74, size: 192, offset: 960)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 192, elements: !75)
!75 = !{!76}
!76 = !DISubrange(count: 3)
!77 = !DILocation(line: 13, column: 14, scope: !7)
!78 = !DILocation(line: 15, column: 19, scope: !79)
!79 = distinct !DILexicalBlock(scope: !7, file: !1, line: 15, column: 6)
!80 = !DILocation(line: 15, column: 14, scope: !79)
!81 = !DILocation(line: 15, column: 12, scope: !79)
!82 = !DILocation(line: 15, column: 35, scope: !79)
!83 = !DILocation(line: 15, column: 6, scope: !7)
!84 = !{!"if"}
!85 = !DILocation(line: 15, column: 42, scope: !79)
!86 = !DILocation(line: 16, column: 12, scope: !87)
!87 = distinct !DILexicalBlock(scope: !7, file: !1, line: 16, column: 6)
!88 = !DILocation(line: 16, column: 6, scope: !87)
!89 = !DILocation(line: 16, column: 6, scope: !7)
!90 = !DILocation(line: 16, column: 23, scope: !87)
!91 = !DILocation(line: 19, column: 14, scope: !7)
!92 = !DILocation(line: 19, column: 48, scope: !7)
!93 = !DILocation(line: 19, column: 56, scope: !7)
!94 = !DILocation(line: 19, column: 9, scope: !7)
!95 = !DILocation(line: 19, column: 7, scope: !7)
!96 = !DILocation(line: 20, column: 6, scope: !97)
!97 = distinct !DILexicalBlock(scope: !7, file: !1, line: 20, column: 6)
!98 = !DILocation(line: 20, column: 11, scope: !97)
!99 = !DILocation(line: 20, column: 6, scope: !7)
!100 = !DILocation(line: 20, column: 18, scope: !97)
!101 = !DILocation(line: 22, column: 2, scope: !7)
!102 = !DILocation(line: 22, column: 21, scope: !7)
!103 = !DILocation(line: 22, column: 26, scope: !7)
!104 = !DILocation(line: 22, column: 16, scope: !7)
!105 = !DILocation(line: 22, column: 14, scope: !7)
!106 = !DILocation(line: 22, column: 38, scope: !7)
!107 = !DILocation(line: 23, column: 9, scope: !7)
!108 = !DILocation(line: 23, column: 15, scope: !7)
!109 = !DILocation(line: 23, column: 20, scope: !7)
!110 = !DILocation(line: 23, column: 3, scope: !7)
!111 = distinct !{!111, !101, !112}
!112 = !DILocation(line: 23, column: 23, scope: !7)
!113 = !DILocation(line: 25, column: 8, scope: !7)
!114 = !DILocation(line: 25, column: 6, scope: !7)
!115 = !DILocation(line: 25, column: 2, scope: !7)
!116 = !DILabel(scope: !7, name: "bail", file: !1, line: 27)
!117 = !DILocation(line: 27, column: 1, scope: !7)
!118 = !DILocation(line: 27, column: 11, scope: !119)
!119 = distinct !DILexicalBlock(scope: !7, file: !1, line: 27, column: 11)
!120 = !DILocation(line: 27, column: 15, scope: !119)
!121 = !DILocation(line: 27, column: 11, scope: !7)
!122 = !DILocation(line: 27, column: 29, scope: !119)
!123 = !DILocation(line: 27, column: 23, scope: !119)
!124 = !DILocation(line: 28, column: 6, scope: !125)
!125 = distinct !DILexicalBlock(scope: !7, file: !1, line: 28, column: 6)
!126 = !DILocation(line: 28, column: 11, scope: !125)
!127 = !DILocation(line: 28, column: 6, scope: !7)
!128 = !DILocation(line: 28, column: 24, scope: !125)
!129 = !DILocation(line: 28, column: 18, scope: !125)
!130 = !DILocation(line: 29, column: 9, scope: !7)
!131 = !DILocation(line: 29, column: 2, scope: !7)
!132 = !DILocation(line: 30, column: 1, scope: !7)
!133 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 32, type: !134, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DISubroutineType(types: !135)
!135 = !{!10}
!136 = !DILocation(line: 34, column: 2, scope: !133)
!137 = !DILocation(line: 35, column: 2, scope: !133)
