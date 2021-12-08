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
  %message.addr = alloca i8*, align 8
  store i8* %message, i8** %message.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %message.addr, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i8*, i8** %message.addr, align 8, !dbg !21
  call void @perror(i8* %0), !dbg !22
  call void @exit(i32 1) #7, !dbg !23
  unreachable, !dbg !23
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @perror(i8*) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @ooi_unlink() #0 !dbg !24 {
entry:
  %0 = load i8*, i8** @ooi_path, align 8, !dbg !27
  %call = call i32 @unlink(i8* %0) #8, !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nounwind
declare dso_local i32 @unlink(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @only_one_instance() #0 !dbg !30 {
entry:
  %fl = alloca %struct.flock, align 8
  %dirlen = alloca i64, align 8
  %fd = alloca i32, align 4
  %dir = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata %struct.flock* %fl, metadata !31, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %dirlen, metadata !47, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i32* %fd, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i8** %dir, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i8* @getenv(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)) #8, !dbg !56
  store i8* %call, i8** %dir, align 8, !dbg !57
  %0 = load i8*, i8** %dir, align 8, !dbg !58
  %cmp = icmp eq i8* %0, null, !dbg !60
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !61

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %dir, align 8, !dbg !62
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !62
  %2 = load i8, i8* %arrayidx, align 1, !dbg !62
  %conv = sext i8 %2 to i32, !dbg !62
  %cmp1 = icmp ne i32 %conv, 47, !dbg !63
  br i1 %cmp1, label %if.then, label %if.end, !dbg !64

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !65
  %call3 = call i32 @fputs(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0), %struct._IO_FILE* %3), !dbg !67
  call void @exit(i32 1) #7, !dbg !68
  unreachable, !dbg !68

if.end:                                           ; preds = %lor.lhs.false
  %4 = load i8*, i8** %dir, align 8, !dbg !69
  %call4 = call i64 @strlen(i8* %4) #9, !dbg !70
  store i64 %call4, i64* %dirlen, align 8, !dbg !71
  %5 = load i64, i64* %dirlen, align 8, !dbg !72
  %add = add i64 %5, 19, !dbg !73
  %call5 = call noalias i8* @malloc(i64 %add) #8, !dbg !74
  store i8* %call5, i8** @ooi_path, align 8, !dbg !75
  %6 = load i8*, i8** @ooi_path, align 8, !dbg !76
  %cmp6 = icmp eq i8* %6, null, !dbg !78
  br i1 %cmp6, label %if.then8, label %if.end9, !dbg !79

if.then8:                                         ; preds = %if.end
  call void @fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  br label %if.end9, !dbg !80

if.end9:                                          ; preds = %if.then8, %if.end
  %7 = load i8*, i8** @ooi_path, align 8, !dbg !81
  %8 = load i8*, i8** %dir, align 8, !dbg !82
  %9 = load i64, i64* %dirlen, align 8, !dbg !83
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 %8, i64 %9, i1 false), !dbg !84
  %10 = load i8*, i8** @ooi_path, align 8, !dbg !85
  %11 = load i64, i64* %dirlen, align 8, !dbg !86
  %add.ptr = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !87
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %add.ptr, i8* align 1 getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i64 19, i1 false), !dbg !88
  %12 = load i8*, i8** @ooi_path, align 8, !dbg !89
  %call10 = call i32 (i8*, i32, ...) @open(i8* %12, i32 66, i32 384), !dbg !90
  store i32 %call10, i32* %fd, align 4, !dbg !91
  %13 = load i32, i32* %fd, align 4, !dbg !92
  %cmp11 = icmp slt i32 %13, 0, !dbg !94
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !95

if.then13:                                        ; preds = %if.end9
  %14 = load i8*, i8** @ooi_path, align 8, !dbg !96
  call void @fail(i8* %14), !dbg !97
  br label %if.end14, !dbg !97

if.end14:                                         ; preds = %if.then13, %if.end9
  %l_start = getelementptr inbounds %struct.flock, %struct.flock* %fl, i32 0, i32 2, !dbg !98
  store i64 0, i64* %l_start, align 8, !dbg !99
  %l_len = getelementptr inbounds %struct.flock, %struct.flock* %fl, i32 0, i32 3, !dbg !100
  store i64 0, i64* %l_len, align 8, !dbg !101
  %l_type = getelementptr inbounds %struct.flock, %struct.flock* %fl, i32 0, i32 0, !dbg !102
  store i16 1, i16* %l_type, align 8, !dbg !103
  %l_whence = getelementptr inbounds %struct.flock, %struct.flock* %fl, i32 0, i32 1, !dbg !104
  store i16 0, i16* %l_whence, align 2, !dbg !105
  %15 = load i32, i32* %fd, align 4, !dbg !106
  %call15 = call i32 (i32, i32, ...) @fcntl(i32 %15, i32 6, %struct.flock* %fl), !dbg !108
  %cmp16 = icmp slt i32 %call15, 0, !dbg !109
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !110

if.then18:                                        ; preds = %if.end14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !111
  %call19 = call i32 @fputs(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.4, i64 0, i64 0), %struct._IO_FILE* %16), !dbg !113
  call void @exit(i32 1) #7, !dbg !114
  unreachable, !dbg !114

if.end20:                                         ; preds = %if.end14
  %call21 = call i32 @atexit(void ()* @ooi_unlink) #8, !dbg !115
  ret void, !dbg !116
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
define dso_local i32 @main() #0 !dbg !117 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !120, metadata !DIExpression()), !dbg !121
  call void @only_one_instance(), !dbg !122
  store i32 10, i32* %i, align 4, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !126
  %cmp = icmp sgt i32 %0, 0, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !130
  %2 = load i32, i32* %i, align 4, !dbg !132
  %rem = srem i32 %2, 5, !dbg !133
  %cmp1 = icmp eq i32 %rem, 1, !dbg !134
  %3 = zext i1 %cmp1 to i64, !dbg !132
  %cond = select i1 %cmp1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0), !dbg !132
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i32 %1, i8* %cond), !dbg !135
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !136
  %call2 = call i32 @fflush(%struct._IO_FILE* %4), !dbg !137
  %call3 = call i32 @sleep(i32 1), !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !140
  %dec = add nsw i32 %5, -1, !dbg !140
  store i32 %dec, i32* %i, align 4, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %call4 = call i32 @puts(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i64 0, i64 0)), !dbg !144
  ret i32 0, !dbg !145
}

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @fflush(%struct._IO_FILE*) #2

declare dso_local i32 @sleep(i32) #2

declare dso_local i32 @puts(i8*) #2

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
!20 = !DILocation(line: 11, column: 18, scope: !14)
!21 = !DILocation(line: 13, column: 9, scope: !14)
!22 = !DILocation(line: 13, column: 2, scope: !14)
!23 = !DILocation(line: 14, column: 2, scope: !14)
!24 = distinct !DISubprogram(name: "ooi_unlink", scope: !3, file: !3, line: 21, type: !25, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocation(line: 23, column: 9, scope: !24)
!28 = !DILocation(line: 23, column: 2, scope: !24)
!29 = !DILocation(line: 24, column: 1, scope: !24)
!30 = distinct !DISubprogram(name: "only_one_instance", scope: !3, file: !3, line: 28, type: !25, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!31 = !DILocalVariable(name: "fl", scope: !30, file: !3, line: 30, type: !32)
!32 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flock", file: !33, line: 35, size: 256, elements: !34)
!33 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/fcntl.h", directory: "")
!34 = !{!35, !37, !38, !42, !43}
!35 = !DIDerivedType(tag: DW_TAG_member, name: "l_type", scope: !32, file: !33, line: 37, baseType: !36, size: 16)
!36 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "l_whence", scope: !32, file: !33, line: 38, baseType: !36, size: 16, offset: 16)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "l_start", scope: !32, file: !33, line: 40, baseType: !39, size: 64, offset: 64)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !40, line: 152, baseType: !41)
!40 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!41 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "l_len", scope: !32, file: !33, line: 41, baseType: !39, size: 64, offset: 128)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "l_pid", scope: !32, file: !33, line: 46, baseType: !44, size: 32, offset: 192)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "__pid_t", file: !40, line: 154, baseType: !45)
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DILocation(line: 30, column: 15, scope: !30)
!47 = !DILocalVariable(name: "dirlen", scope: !30, file: !3, line: 31, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 31, column: 9, scope: !30)
!52 = !DILocalVariable(name: "fd", scope: !30, file: !3, line: 32, type: !45)
!53 = !DILocation(line: 32, column: 6, scope: !30)
!54 = !DILocalVariable(name: "dir", scope: !30, file: !3, line: 33, type: !8)
!55 = !DILocation(line: 33, column: 8, scope: !30)
!56 = !DILocation(line: 40, column: 8, scope: !30)
!57 = !DILocation(line: 40, column: 6, scope: !30)
!58 = !DILocation(line: 41, column: 6, scope: !59)
!59 = distinct !DILexicalBlock(scope: !30, file: !3, line: 41, column: 6)
!60 = !DILocation(line: 41, column: 10, scope: !59)
!61 = !DILocation(line: 41, column: 18, scope: !59)
!62 = !DILocation(line: 41, column: 21, scope: !59)
!63 = !DILocation(line: 41, column: 28, scope: !59)
!64 = !DILocation(line: 41, column: 6, scope: !30)
!65 = !DILocation(line: 42, column: 34, scope: !66)
!66 = distinct !DILexicalBlock(scope: !59, file: !3, line: 41, column: 36)
!67 = !DILocation(line: 42, column: 3, scope: !66)
!68 = !DILocation(line: 43, column: 3, scope: !66)
!69 = !DILocation(line: 45, column: 18, scope: !30)
!70 = !DILocation(line: 45, column: 11, scope: !30)
!71 = !DILocation(line: 45, column: 9, scope: !30)
!72 = !DILocation(line: 47, column: 20, scope: !30)
!73 = !DILocation(line: 47, column: 27, scope: !30)
!74 = !DILocation(line: 47, column: 13, scope: !30)
!75 = !DILocation(line: 47, column: 11, scope: !30)
!76 = !DILocation(line: 48, column: 6, scope: !77)
!77 = distinct !DILexicalBlock(scope: !30, file: !3, line: 48, column: 6)
!78 = !DILocation(line: 48, column: 15, scope: !77)
!79 = !DILocation(line: 48, column: 6, scope: !30)
!80 = !DILocation(line: 49, column: 3, scope: !77)
!81 = !DILocation(line: 50, column: 9, scope: !30)
!82 = !DILocation(line: 50, column: 19, scope: !30)
!83 = !DILocation(line: 50, column: 24, scope: !30)
!84 = !DILocation(line: 50, column: 2, scope: !30)
!85 = !DILocation(line: 51, column: 9, scope: !30)
!86 = !DILocation(line: 51, column: 20, scope: !30)
!87 = !DILocation(line: 51, column: 18, scope: !30)
!88 = !DILocation(line: 51, column: 2, scope: !30)
!89 = !DILocation(line: 54, column: 12, scope: !30)
!90 = !DILocation(line: 54, column: 7, scope: !30)
!91 = !DILocation(line: 54, column: 5, scope: !30)
!92 = !DILocation(line: 55, column: 6, scope: !93)
!93 = distinct !DILexicalBlock(scope: !30, file: !3, line: 55, column: 6)
!94 = !DILocation(line: 55, column: 9, scope: !93)
!95 = !DILocation(line: 55, column: 6, scope: !30)
!96 = !DILocation(line: 56, column: 8, scope: !93)
!97 = !DILocation(line: 56, column: 3, scope: !93)
!98 = !DILocation(line: 58, column: 5, scope: !30)
!99 = !DILocation(line: 58, column: 13, scope: !30)
!100 = !DILocation(line: 59, column: 5, scope: !30)
!101 = !DILocation(line: 59, column: 11, scope: !30)
!102 = !DILocation(line: 60, column: 5, scope: !30)
!103 = !DILocation(line: 60, column: 12, scope: !30)
!104 = !DILocation(line: 61, column: 5, scope: !30)
!105 = !DILocation(line: 61, column: 14, scope: !30)
!106 = !DILocation(line: 62, column: 12, scope: !107)
!107 = distinct !DILexicalBlock(scope: !30, file: !3, line: 62, column: 6)
!108 = !DILocation(line: 62, column: 6, scope: !107)
!109 = !DILocation(line: 62, column: 30, scope: !107)
!110 = !DILocation(line: 62, column: 6, scope: !30)
!111 = !DILocation(line: 64, column: 7, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !3, line: 62, column: 35)
!113 = !DILocation(line: 63, column: 3, scope: !112)
!114 = !DILocation(line: 65, column: 3, scope: !112)
!115 = !DILocation(line: 72, column: 2, scope: !30)
!116 = !DILocation(line: 73, column: 1, scope: !30)
!117 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 80, type: !118, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!118 = !DISubroutineType(types: !119)
!119 = !{!45}
!120 = !DILocalVariable(name: "i", scope: !117, file: !3, line: 82, type: !45)
!121 = !DILocation(line: 82, column: 6, scope: !117)
!122 = !DILocation(line: 84, column: 2, scope: !117)
!123 = !DILocation(line: 87, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !117, file: !3, line: 87, column: 2)
!125 = !DILocation(line: 87, column: 6, scope: !124)
!126 = !DILocation(line: 87, column: 14, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !3, line: 87, column: 2)
!128 = !DILocation(line: 87, column: 16, scope: !127)
!129 = !DILocation(line: 87, column: 2, scope: !124)
!130 = !DILocation(line: 88, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !3, line: 87, column: 26)
!132 = !DILocation(line: 88, column: 24, scope: !131)
!133 = !DILocation(line: 88, column: 26, scope: !131)
!134 = !DILocation(line: 88, column: 30, scope: !131)
!135 = !DILocation(line: 88, column: 3, scope: !131)
!136 = !DILocation(line: 89, column: 10, scope: !131)
!137 = !DILocation(line: 89, column: 3, scope: !131)
!138 = !DILocation(line: 90, column: 3, scope: !131)
!139 = !DILocation(line: 91, column: 2, scope: !131)
!140 = !DILocation(line: 87, column: 22, scope: !127)
!141 = !DILocation(line: 87, column: 2, scope: !127)
!142 = distinct !{!142, !129, !143}
!143 = !DILocation(line: 91, column: 2, scope: !124)
!144 = !DILocation(line: 92, column: 2, scope: !117)
!145 = !DILocation(line: 93, column: 2, scope: !117)
