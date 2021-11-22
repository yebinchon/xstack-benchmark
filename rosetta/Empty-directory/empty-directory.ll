; ModuleID = 'empty-directory.c'
source_filename = "empty-directory.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }
%struct.__dirstream = type opaque

@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [5 x i8] c"%s: \00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"..\00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"%s: %sempty\0A\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"not \00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dir_empty(i8* %path) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca i8*, align 8
  %ent = alloca %struct.dirent*, align 8
  %ret = alloca i32, align 4
  %d = alloca %struct.__dirstream*, align 8
  store i8* %path, i8** %path.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %path.addr, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata %struct.dirent** %ent, metadata !16, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 1, i32* %ret, align 4, !dbg !38
  call void @llvm.dbg.declare(metadata %struct.__dirstream** %d, metadata !39, metadata !DIExpression()), !dbg !44
  %0 = load i8*, i8** %path.addr, align 8, !dbg !45
  %call = call %struct.__dirstream* @opendir(i8* %0), !dbg !46
  store %struct.__dirstream* %call, %struct.__dirstream** %d, align 8, !dbg !44
  %1 = load %struct.__dirstream*, %struct.__dirstream** %d, align 8, !dbg !47
  %tobool = icmp ne %struct.__dirstream* %1, null, !dbg !47
  br i1 %tobool, label %if.end, label %if.then, !dbg !49, !cf.info !50

if.then:                                          ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !51
  %3 = load i8*, i8** %path.addr, align 8, !dbg !53
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i8* %3), !dbg !54
  call void @perror(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  store i32 -1, i32* %retval, align 4, !dbg !56
  br label %return, !dbg !56

if.end:                                           ; preds = %entry
  br label %while.cond, !dbg !57

while.cond:                                       ; preds = %if.then10, %if.end
  %4 = load %struct.__dirstream*, %struct.__dirstream** %d, align 8, !dbg !58
  %call2 = call %struct.dirent* @readdir(%struct.__dirstream* %4), !dbg !59
  store %struct.dirent* %call2, %struct.dirent** %ent, align 8, !dbg !60
  %tobool3 = icmp ne %struct.dirent* %call2, null, !dbg !57
  br i1 %tobool3, label %while.body, label %while.end, !dbg !57

while.body:                                       ; preds = %while.cond
  %5 = load %struct.dirent*, %struct.dirent** %ent, align 8, !dbg !61
  %d_name = getelementptr inbounds %struct.dirent, %struct.dirent* %5, i32 0, i32 4, !dbg !64
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %d_name, i64 0, i64 0, !dbg !61
  %call4 = call i32 @strcmp(i8* %arraydecay, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)) #4, !dbg !65
  %tobool5 = icmp ne i32 %call4, 0, !dbg !65
  br i1 %tobool5, label %lor.lhs.false, label %if.then10, !dbg !66, !cf.info !50

lor.lhs.false:                                    ; preds = %while.body
  %6 = load %struct.dirent*, %struct.dirent** %ent, align 8, !dbg !67
  %d_name6 = getelementptr inbounds %struct.dirent, %struct.dirent* %6, i32 0, i32 4, !dbg !68
  %arraydecay7 = getelementptr inbounds [256 x i8], [256 x i8]* %d_name6, i64 0, i64 0, !dbg !67
  %call8 = call i32 @strcmp(i8* %arraydecay7, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #4, !dbg !69
  %tobool9 = icmp ne i32 %call8, 0, !dbg !69
  br i1 %tobool9, label %if.end11, label %if.then10, !dbg !70, !cf.info !50

if.then10:                                        ; preds = %lor.lhs.false, %while.body
  br label %while.cond, !dbg !71, !llvm.loop !72

if.end11:                                         ; preds = %lor.lhs.false
  store i32 0, i32* %ret, align 4, !dbg !74
  br label %while.end, !dbg !75

while.end:                                        ; preds = %if.end11, %while.cond
  %7 = load %struct.__dirstream*, %struct.__dirstream** %d, align 8, !dbg !76
  %call12 = call i32 @closedir(%struct.__dirstream* %7), !dbg !77
  %8 = load i32, i32* %ret, align 4, !dbg !78
  store i32 %8, i32* %retval, align 4, !dbg !79
  br label %return, !dbg !79

return:                                           ; preds = %while.end, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !80
  ret i32 %9, !dbg !80
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local %struct.__dirstream* @opendir(i8*) #2

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

declare dso_local void @perror(i8*) #2

declare dso_local %struct.dirent* @readdir(%struct.__dirstream*) #2

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #3

declare dso_local i32 @closedir(%struct.__dirstream*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %v.addr = alloca i8**, align 8
  %ret = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %v, i8*** %v.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %v.addr, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !90, metadata !DIExpression()), !dbg !91
  store i32 0, i32* %ret, align 4, !dbg !91
  call void @llvm.dbg.declare(metadata i32* %i, metadata !92, metadata !DIExpression()), !dbg !93
  %0 = load i32, i32* %c.addr, align 4, !dbg !94
  %cmp = icmp slt i32 %0, 2, !dbg !96
  br i1 %cmp, label %if.then, label %if.end, !dbg !97, !cf.info !50

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !98
  br label %return, !dbg !98

if.end:                                           ; preds = %entry
  store i32 1, i32* %i, align 4, !dbg !99
  br label %for.cond, !dbg !101

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4, !dbg !102
  %2 = load i32, i32* %c.addr, align 4, !dbg !104
  %cmp1 = icmp slt i32 %1, %2, !dbg !105
  br i1 %cmp1, label %for.body, label %for.end, !dbg !106

for.body:                                         ; preds = %for.cond
  %3 = load i8**, i8*** %v.addr, align 8, !dbg !107
  %4 = load i32, i32* %i, align 4, !dbg !109
  %idxprom = sext i32 %4 to i64, !dbg !107
  %arrayidx = getelementptr inbounds i8*, i8** %3, i64 %idxprom, !dbg !107
  %5 = load i8*, i8** %arrayidx, align 8, !dbg !107
  %call = call i32 @dir_empty(i8* %5), !dbg !110
  store i32 %call, i32* %ret, align 4, !dbg !111
  %6 = load i32, i32* %ret, align 4, !dbg !112
  %cmp2 = icmp sge i32 %6, 0, !dbg !114
  br i1 %cmp2, label %if.then3, label %if.end7, !dbg !115, !cf.info !50

if.then3:                                         ; preds = %for.body
  %7 = load i8**, i8*** %v.addr, align 8, !dbg !116
  %8 = load i32, i32* %i, align 4, !dbg !117
  %idxprom4 = sext i32 %8 to i64, !dbg !116
  %arrayidx5 = getelementptr inbounds i8*, i8** %7, i64 %idxprom4, !dbg !116
  %9 = load i8*, i8** %arrayidx5, align 8, !dbg !116
  %10 = load i32, i32* %ret, align 4, !dbg !118
  %tobool = icmp ne i32 %10, 0, !dbg !118
  %11 = zext i1 %tobool to i64, !dbg !118
  %cond = select i1 %tobool, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), !dbg !118
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i64 0, i64 0), i8* %9, i8* %cond), !dbg !119
  br label %if.end7, !dbg !119

if.end7:                                          ; preds = %if.then3, %for.body
  br label %for.inc, !dbg !120

for.inc:                                          ; preds = %if.end7
  %12 = load i32, i32* %i, align 4, !dbg !121
  %inc = add nsw i32 %12, 1, !dbg !121
  store i32 %inc, i32* %i, align 4, !dbg !121
  br label %for.cond, !dbg !122, !llvm.loop !123

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, align 4, !dbg !125
  br label %return, !dbg !125

return:                                           ; preds = %for.end, %if.then
  %13 = load i32, i32* %retval, align 4, !dbg !126
  ret i32 %13, !dbg !126
}

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "empty-directory.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Empty-directory")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "dir_empty", scope: !1, file: !1, line: 5, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "path", arg: 1, scope: !7, file: !1, line: 5, type: !11)
!15 = !DILocation(line: 5, column: 27, scope: !7)
!16 = !DILocalVariable(name: "ent", scope: !7, file: !1, line: 7, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dirent", file: !19, line: 22, size: 2240, elements: !20)
!19 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/dirent.h", directory: "")
!20 = !{!21, !25, !28, !30, !32}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "d_ino", scope: !18, file: !19, line: 25, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !23, line: 148, baseType: !24)
!23 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!24 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "d_off", scope: !18, file: !19, line: 26, baseType: !26, size: 64, offset: 64)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !23, line: 152, baseType: !27)
!27 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "d_reclen", scope: !18, file: !19, line: 31, baseType: !29, size: 16, offset: 128)
!29 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "d_type", scope: !18, file: !19, line: 32, baseType: !31, size: 8, offset: 144)
!31 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "d_name", scope: !18, file: !19, line: 33, baseType: !33, size: 2048, offset: 152)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 2048, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 256)
!36 = !DILocation(line: 7, column: 17, scope: !7)
!37 = !DILocalVariable(name: "ret", scope: !7, file: !1, line: 8, type: !10)
!38 = !DILocation(line: 8, column: 6, scope: !7)
!39 = !DILocalVariable(name: "d", scope: !7, file: !1, line: 10, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "DIR", file: !42, line: 127, baseType: !43)
!42 = !DIFile(filename: "/usr/include/dirent.h", directory: "")
!43 = !DICompositeType(tag: DW_TAG_structure_type, name: "__dirstream", file: !42, line: 127, flags: DIFlagFwdDecl)
!44 = !DILocation(line: 10, column: 7, scope: !7)
!45 = !DILocation(line: 10, column: 19, scope: !7)
!46 = !DILocation(line: 10, column: 11, scope: !7)
!47 = !DILocation(line: 11, column: 7, scope: !48)
!48 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 6)
!49 = !DILocation(line: 11, column: 6, scope: !7)
!50 = !{!"if"}
!51 = !DILocation(line: 12, column: 11, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !1, line: 11, column: 10)
!53 = !DILocation(line: 12, column: 27, scope: !52)
!54 = !DILocation(line: 12, column: 3, scope: !52)
!55 = !DILocation(line: 13, column: 3, scope: !52)
!56 = !DILocation(line: 14, column: 3, scope: !52)
!57 = !DILocation(line: 17, column: 2, scope: !7)
!58 = !DILocation(line: 17, column: 24, scope: !7)
!59 = !DILocation(line: 17, column: 16, scope: !7)
!60 = !DILocation(line: 17, column: 14, scope: !7)
!61 = !DILocation(line: 18, column: 15, scope: !62)
!62 = distinct !DILexicalBlock(scope: !63, file: !1, line: 18, column: 7)
!63 = distinct !DILexicalBlock(scope: !7, file: !1, line: 17, column: 29)
!64 = !DILocation(line: 18, column: 20, scope: !62)
!65 = !DILocation(line: 18, column: 8, scope: !62)
!66 = !DILocation(line: 18, column: 33, scope: !62)
!67 = !DILocation(line: 18, column: 45, scope: !62)
!68 = !DILocation(line: 18, column: 50, scope: !62)
!69 = !DILocation(line: 18, column: 38, scope: !62)
!70 = !DILocation(line: 18, column: 7, scope: !63)
!71 = !DILocation(line: 19, column: 4, scope: !62)
!72 = distinct !{!72, !57, !73}
!73 = !DILocation(line: 22, column: 2, scope: !7)
!74 = !DILocation(line: 20, column: 7, scope: !63)
!75 = !DILocation(line: 21, column: 3, scope: !63)
!76 = !DILocation(line: 24, column: 11, scope: !7)
!77 = !DILocation(line: 24, column: 2, scope: !7)
!78 = !DILocation(line: 25, column: 9, scope: !7)
!79 = !DILocation(line: 25, column: 2, scope: !7)
!80 = !DILocation(line: 26, column: 1, scope: !7)
!81 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 28, type: !82, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!10, !10, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!86 = !DILocalVariable(name: "c", arg: 1, scope: !81, file: !1, line: 28, type: !10)
!87 = !DILocation(line: 28, column: 14, scope: !81)
!88 = !DILocalVariable(name: "v", arg: 2, scope: !81, file: !1, line: 28, type: !84)
!89 = !DILocation(line: 28, column: 24, scope: !81)
!90 = !DILocalVariable(name: "ret", scope: !81, file: !1, line: 30, type: !10)
!91 = !DILocation(line: 30, column: 6, scope: !81)
!92 = !DILocalVariable(name: "i", scope: !81, file: !1, line: 30, type: !10)
!93 = !DILocation(line: 30, column: 15, scope: !81)
!94 = !DILocation(line: 31, column: 6, scope: !95)
!95 = distinct !DILexicalBlock(scope: !81, file: !1, line: 31, column: 6)
!96 = !DILocation(line: 31, column: 8, scope: !95)
!97 = !DILocation(line: 31, column: 6, scope: !81)
!98 = !DILocation(line: 31, column: 13, scope: !95)
!99 = !DILocation(line: 33, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !81, file: !1, line: 33, column: 2)
!101 = !DILocation(line: 33, column: 7, scope: !100)
!102 = !DILocation(line: 33, column: 14, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !1, line: 33, column: 2)
!104 = !DILocation(line: 33, column: 18, scope: !103)
!105 = !DILocation(line: 33, column: 16, scope: !103)
!106 = !DILocation(line: 33, column: 2, scope: !100)
!107 = !DILocation(line: 34, column: 19, scope: !108)
!108 = distinct !DILexicalBlock(scope: !103, file: !1, line: 33, column: 26)
!109 = !DILocation(line: 34, column: 21, scope: !108)
!110 = !DILocation(line: 34, column: 9, scope: !108)
!111 = !DILocation(line: 34, column: 7, scope: !108)
!112 = !DILocation(line: 35, column: 7, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !1, line: 35, column: 7)
!114 = !DILocation(line: 35, column: 11, scope: !113)
!115 = !DILocation(line: 35, column: 7, scope: !108)
!116 = !DILocation(line: 36, column: 28, scope: !113)
!117 = !DILocation(line: 36, column: 30, scope: !113)
!118 = !DILocation(line: 36, column: 34, scope: !113)
!119 = !DILocation(line: 36, column: 4, scope: !113)
!120 = !DILocation(line: 37, column: 2, scope: !108)
!121 = !DILocation(line: 33, column: 22, scope: !103)
!122 = !DILocation(line: 33, column: 2, scope: !103)
!123 = distinct !{!123, !106, !124}
!124 = !DILocation(line: 37, column: 2, scope: !100)
!125 = !DILocation(line: 39, column: 2, scope: !81)
!126 = !DILocation(line: 40, column: 1, scope: !81)
