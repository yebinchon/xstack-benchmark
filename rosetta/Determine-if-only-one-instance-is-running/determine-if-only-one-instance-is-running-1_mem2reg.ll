; ModuleID = 'determine-if-only-one-instance-is-running-1.ll'
source_filename = "determine-if-only-one-instance-is-running-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.flock = type { i16, i16, i64, i64, i32 }

@ooi_path = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [5 x i8] c"HOME\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"Bad home directory.\0A\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [7 x i8] c"malloc\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"/rosetta-code-lock\00", align 1
@.str.4 = private unnamed_addr constant [46 x i8] c"Another instance of this program is running.\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%d...%s\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c" \00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 8
@.str.8 = private unnamed_addr constant [5 x i8] c"Fin!\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @fail(i8* %message) #0 !dbg !14 {
entry:
  call void @llvm.dbg.value(metadata i8* %message, metadata !19, metadata !DIExpression()), !dbg !20
  call void @perror(i8* %message), !dbg !21
  call void @exit(i32 1) #7, !dbg !22
  unreachable, !dbg !22
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @perror(i8*) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @ooi_unlink() #0 !dbg !23 {
entry:
  %0 = load i8*, i8** @ooi_path, align 8, !dbg !26
  %call = call i32 @unlink(i8* %0) #8, !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nounwind
declare dso_local i32 @unlink(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @only_one_instance() #0 !dbg !29 {
entry:
  %fl = alloca %struct.flock, align 8
  call void @llvm.dbg.declare(metadata %struct.flock* %fl, metadata !30, metadata !DIExpression()), !dbg !45
  %call = call i8* @getenv(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)) #8, !dbg !46
  call void @llvm.dbg.value(metadata i8* %call, metadata !47, metadata !DIExpression()), !dbg !48
  %cmp = icmp eq i8* %call, null, !dbg !49
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !51

lor.lhs.false:                                    ; preds = %entry
  %arrayidx = getelementptr inbounds i8, i8* %call, i64 0, !dbg !52
  %0 = load i8, i8* %arrayidx, align 1, !dbg !52
  %conv = sext i8 %0 to i32, !dbg !52
  %cmp1 = icmp ne i32 %conv, 47, !dbg !53
  br i1 %cmp1, label %if.then, label %if.end, !dbg !54

if.then:                                          ; preds = %lor.lhs.false, %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !55
  %call3 = call i32 @fputs(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0), %struct._IO_FILE* %1), !dbg !57
  call void @exit(i32 1) #7, !dbg !58
  unreachable, !dbg !58

if.end:                                           ; preds = %lor.lhs.false
  %call4 = call i64 @strlen(i8* %call) #9, !dbg !59
  call void @llvm.dbg.value(metadata i64 %call4, metadata !60, metadata !DIExpression()), !dbg !48
  %add = add i64 %call4, 19, !dbg !64
  %call5 = call noalias i8* @malloc(i64 %add) #8, !dbg !65
  store i8* %call5, i8** @ooi_path, align 8, !dbg !66
  %2 = load i8*, i8** @ooi_path, align 8, !dbg !67
  %cmp6 = icmp eq i8* %2, null, !dbg !69
  br i1 %cmp6, label %if.then8, label %if.end9, !dbg !70

if.then8:                                         ; preds = %if.end
  call void @fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  br label %if.end9, !dbg !71

if.end9:                                          ; preds = %if.then8, %if.end
  %3 = load i8*, i8** @ooi_path, align 8, !dbg !72
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %call, i64 %call4, i1 false), !dbg !73
  %4 = load i8*, i8** @ooi_path, align 8, !dbg !74
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 %call4, !dbg !75
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %add.ptr, i8* align 1 getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i64 19, i1 false), !dbg !76
  %5 = load i8*, i8** @ooi_path, align 8, !dbg !77
  %call10 = call i32 (i8*, i32, ...) @open(i8* %5, i32 66, i32 384), !dbg !78
  call void @llvm.dbg.value(metadata i32 %call10, metadata !79, metadata !DIExpression()), !dbg !48
  %cmp11 = icmp slt i32 %call10, 0, !dbg !80
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !82

if.then13:                                        ; preds = %if.end9
  %6 = load i8*, i8** @ooi_path, align 8, !dbg !83
  call void @fail(i8* %6), !dbg !84
  br label %if.end14, !dbg !84

if.end14:                                         ; preds = %if.then13, %if.end9
  %l_start = getelementptr inbounds %struct.flock, %struct.flock* %fl, i32 0, i32 2, !dbg !85
  store i64 0, i64* %l_start, align 8, !dbg !86
  %l_len = getelementptr inbounds %struct.flock, %struct.flock* %fl, i32 0, i32 3, !dbg !87
  store i64 0, i64* %l_len, align 8, !dbg !88
  %l_type = getelementptr inbounds %struct.flock, %struct.flock* %fl, i32 0, i32 0, !dbg !89
  store i16 1, i16* %l_type, align 8, !dbg !90
  %l_whence = getelementptr inbounds %struct.flock, %struct.flock* %fl, i32 0, i32 1, !dbg !91
  store i16 0, i16* %l_whence, align 2, !dbg !92
  %call15 = call i32 (i32, i32, ...) @fcntl(i32 %call10, i32 6, %struct.flock* %fl), !dbg !93
  %cmp16 = icmp slt i32 %call15, 0, !dbg !95
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !96

if.then18:                                        ; preds = %if.end14
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !97
  %call19 = call i32 @fputs(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.4, i64 0, i64 0), %struct._IO_FILE* %7), !dbg !99
  call void @exit(i32 1) #7, !dbg !100
  unreachable, !dbg !100

if.end20:                                         ; preds = %if.end14
  %call21 = call i32 @atexit(void ()* @ooi_unlink) #8, !dbg !101
  ret void, !dbg !102
}

; Function Attrs: nounwind
declare dso_local i8* @getenv(i8*) #4

declare dso_local i32 @fputs(i8*, %struct._IO_FILE*) #2

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare dso_local i32 @open(i8*, i32, ...) #2

declare dso_local i32 @fcntl(i32, i32, ...) #2

; Function Attrs: nounwind
declare dso_local i32 @atexit(void ()*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !103 {
entry:
  call void @only_one_instance(), !dbg !106
  call void @llvm.dbg.value(metadata i32 10, metadata !107, metadata !DIExpression()), !dbg !108
  br label %for.cond, !dbg !109

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 10, %entry ], [ %dec, %for.inc ], !dbg !111
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !107, metadata !DIExpression()), !dbg !108
  %cmp = icmp sgt i32 %i.0, 0, !dbg !112
  br i1 %cmp, label %for.body, label %for.end, !dbg !114

for.body:                                         ; preds = %for.cond
  %rem = srem i32 %i.0, 5, !dbg !115
  %cmp1 = icmp eq i32 %rem, 1, !dbg !117
  %0 = zext i1 %cmp1 to i64, !dbg !118
  %cond = select i1 %cmp1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0), !dbg !118
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i32 %i.0, i8* %cond), !dbg !119
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !120
  %call2 = call i32 @fflush(%struct._IO_FILE* %1), !dbg !121
  %call3 = call i32 @sleep(i32 1), !dbg !122
  br label %for.inc, !dbg !123

for.inc:                                          ; preds = %for.body
  %dec = add nsw i32 %i.0, -1, !dbg !124
  call void @llvm.dbg.value(metadata i32 %dec, metadata !107, metadata !DIExpression()), !dbg !108
  br label %for.cond, !dbg !125, !llvm.loop !126

for.end:                                          ; preds = %for.cond
  %call4 = call i32 @puts(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i64 0, i64 0)), !dbg !128
  ret i32 0, !dbg !129
}

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @fflush(%struct._IO_FILE*) #2

declare dso_local i32 @sleep(i32) #2

declare dso_local i32 @puts(i8*) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind willreturn }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind }
attributes #9 = { nounwind readonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "ooi_path", scope: !2, file: !3, line: 18, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "determine-if-only-one-instance-is-running-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Determine-if-only-one-instance-is-running")
!4 = !{}
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{!0}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!14 = distinct !DISubprogram(name: "fail", scope: !3, file: !3, line: 11, type: !15, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!19 = !DILocalVariable(name: "message", arg: 1, scope: !14, file: !3, line: 11, type: !17)
!20 = !DILocation(line: 0, scope: !14)
!21 = !DILocation(line: 13, column: 2, scope: !14)
!22 = !DILocation(line: 14, column: 2, scope: !14)
!23 = distinct !DISubprogram(name: "ooi_unlink", scope: !3, file: !3, line: 21, type: !24, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocation(line: 23, column: 9, scope: !23)
!27 = !DILocation(line: 23, column: 2, scope: !23)
!28 = !DILocation(line: 24, column: 1, scope: !23)
!29 = distinct !DISubprogram(name: "only_one_instance", scope: !3, file: !3, line: 28, type: !24, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!30 = !DILocalVariable(name: "fl", scope: !29, file: !3, line: 30, type: !31)
!31 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flock", file: !32, line: 35, size: 256, elements: !33)
!32 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/fcntl.h", directory: "")
!33 = !{!34, !36, !37, !41, !42}
!34 = !DIDerivedType(tag: DW_TAG_member, name: "l_type", scope: !31, file: !32, line: 37, baseType: !35, size: 16)
!35 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "l_whence", scope: !31, file: !32, line: 38, baseType: !35, size: 16, offset: 16)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "l_start", scope: !31, file: !32, line: 40, baseType: !38, size: 64, offset: 64)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !39, line: 152, baseType: !40)
!39 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!40 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "l_len", scope: !31, file: !32, line: 41, baseType: !38, size: 64, offset: 128)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "l_pid", scope: !31, file: !32, line: 46, baseType: !43, size: 32, offset: 192)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__pid_t", file: !39, line: 154, baseType: !44)
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DILocation(line: 30, column: 15, scope: !29)
!46 = !DILocation(line: 40, column: 8, scope: !29)
!47 = !DILocalVariable(name: "dir", scope: !29, file: !3, line: 33, type: !8)
!48 = !DILocation(line: 0, scope: !29)
!49 = !DILocation(line: 41, column: 10, scope: !50)
!50 = distinct !DILexicalBlock(scope: !29, file: !3, line: 41, column: 6)
!51 = !DILocation(line: 41, column: 18, scope: !50)
!52 = !DILocation(line: 41, column: 21, scope: !50)
!53 = !DILocation(line: 41, column: 28, scope: !50)
!54 = !DILocation(line: 41, column: 6, scope: !29)
!55 = !DILocation(line: 42, column: 34, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !3, line: 41, column: 36)
!57 = !DILocation(line: 42, column: 3, scope: !56)
!58 = !DILocation(line: 43, column: 3, scope: !56)
!59 = !DILocation(line: 45, column: 11, scope: !29)
!60 = !DILocalVariable(name: "dirlen", scope: !29, file: !3, line: 31, type: !61)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !62, line: 46, baseType: !63)
!62 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!63 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!64 = !DILocation(line: 47, column: 27, scope: !29)
!65 = !DILocation(line: 47, column: 13, scope: !29)
!66 = !DILocation(line: 47, column: 11, scope: !29)
!67 = !DILocation(line: 48, column: 6, scope: !68)
!68 = distinct !DILexicalBlock(scope: !29, file: !3, line: 48, column: 6)
!69 = !DILocation(line: 48, column: 15, scope: !68)
!70 = !DILocation(line: 48, column: 6, scope: !29)
!71 = !DILocation(line: 49, column: 3, scope: !68)
!72 = !DILocation(line: 50, column: 9, scope: !29)
!73 = !DILocation(line: 50, column: 2, scope: !29)
!74 = !DILocation(line: 51, column: 9, scope: !29)
!75 = !DILocation(line: 51, column: 18, scope: !29)
!76 = !DILocation(line: 51, column: 2, scope: !29)
!77 = !DILocation(line: 54, column: 12, scope: !29)
!78 = !DILocation(line: 54, column: 7, scope: !29)
!79 = !DILocalVariable(name: "fd", scope: !29, file: !3, line: 32, type: !44)
!80 = !DILocation(line: 55, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !29, file: !3, line: 55, column: 6)
!82 = !DILocation(line: 55, column: 6, scope: !29)
!83 = !DILocation(line: 56, column: 8, scope: !81)
!84 = !DILocation(line: 56, column: 3, scope: !81)
!85 = !DILocation(line: 58, column: 5, scope: !29)
!86 = !DILocation(line: 58, column: 13, scope: !29)
!87 = !DILocation(line: 59, column: 5, scope: !29)
!88 = !DILocation(line: 59, column: 11, scope: !29)
!89 = !DILocation(line: 60, column: 5, scope: !29)
!90 = !DILocation(line: 60, column: 12, scope: !29)
!91 = !DILocation(line: 61, column: 5, scope: !29)
!92 = !DILocation(line: 61, column: 14, scope: !29)
!93 = !DILocation(line: 62, column: 6, scope: !94)
!94 = distinct !DILexicalBlock(scope: !29, file: !3, line: 62, column: 6)
!95 = !DILocation(line: 62, column: 30, scope: !94)
!96 = !DILocation(line: 62, column: 6, scope: !29)
!97 = !DILocation(line: 64, column: 7, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !3, line: 62, column: 35)
!99 = !DILocation(line: 63, column: 3, scope: !98)
!100 = !DILocation(line: 65, column: 3, scope: !98)
!101 = !DILocation(line: 72, column: 2, scope: !29)
!102 = !DILocation(line: 73, column: 1, scope: !29)
!103 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 80, type: !104, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DISubroutineType(types: !105)
!105 = !{!44}
!106 = !DILocation(line: 84, column: 2, scope: !103)
!107 = !DILocalVariable(name: "i", scope: !103, file: !3, line: 82, type: !44)
!108 = !DILocation(line: 0, scope: !103)
!109 = !DILocation(line: 87, column: 6, scope: !110)
!110 = distinct !DILexicalBlock(scope: !103, file: !3, line: 87, column: 2)
!111 = !DILocation(line: 0, scope: !110)
!112 = !DILocation(line: 87, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !3, line: 87, column: 2)
!114 = !DILocation(line: 87, column: 2, scope: !110)
!115 = !DILocation(line: 88, column: 26, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !3, line: 87, column: 26)
!117 = !DILocation(line: 88, column: 30, scope: !116)
!118 = !DILocation(line: 88, column: 24, scope: !116)
!119 = !DILocation(line: 88, column: 3, scope: !116)
!120 = !DILocation(line: 89, column: 10, scope: !116)
!121 = !DILocation(line: 89, column: 3, scope: !116)
!122 = !DILocation(line: 90, column: 3, scope: !116)
!123 = !DILocation(line: 91, column: 2, scope: !116)
!124 = !DILocation(line: 87, column: 22, scope: !113)
!125 = !DILocation(line: 87, column: 2, scope: !113)
!126 = distinct !{!126, !114, !127}
!127 = !DILocation(line: 91, column: 2, scope: !110)
!128 = !DILocation(line: 92, column: 2, scope: !103)
!129 = !DILocation(line: 93, column: 2, scope: !103)
