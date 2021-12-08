; ModuleID = 'determine-if-only-one-instance-is-running-2.ll'
source_filename = "determine-if-only-one-instance-is-running-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.sigaction = type { %union.anon, %struct.__sigset_t, i32, void ()* }
%union.anon = type { void (i32)* }
%struct.__sigset_t = type { [16 x i64] }

@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [19 x i8] c"Caught signal %d.\0A\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"/tmp/MyUniqueName\00", align 1
@.str.2 = private unnamed_addr constant [23 x i8] c"I am already running!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @sigint_handler(i32 %sig) #0 !dbg !7 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %sig.addr, metadata !11, metadata !DIExpression()), !dbg !12
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !13
  %1 = load i32, i32* %sig.addr, align 4, !dbg !14
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), i32 %1), !dbg !15
  %call1 = call i32 @unlink(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)) #6, !dbg !16
  call void @_exit(i32 1) #7, !dbg !17
  unreachable, !dbg !17
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare dso_local i32 @unlink(i8*) #3

; Function Attrs: noreturn
declare dso_local void @_exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !18 {
entry:
  %retval = alloca i32, align 4
  %act = alloca %struct.sigaction, align 8
  %myfd = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.sigaction* %act, metadata !21, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i32* %myfd, metadata !133, metadata !DIExpression()), !dbg !134
  %call = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i32 192), !dbg !135
  store i32 %call, i32* %myfd, align 4, !dbg !136
  %0 = load i32, i32* %myfd, align 4, !dbg !137
  %cmp = icmp slt i32 %0, 0, !dbg !139
  br i1 %cmp, label %if.then, label %if.end, !dbg !140

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !141
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.2, i64 0, i64 0)), !dbg !143
  call void @exit(i32 1) #8, !dbg !144
  unreachable, !dbg !144

if.end:                                           ; preds = %entry
  %__sigaction_handler = getelementptr inbounds %struct.sigaction, %struct.sigaction* %act, i32 0, i32 0, !dbg !145
  %sa_handler = bitcast %union.anon* %__sigaction_handler to void (i32)**, !dbg !145
  store void (i32)* @sigint_handler, void (i32)** %sa_handler, align 8, !dbg !146
  %sa_mask = getelementptr inbounds %struct.sigaction, %struct.sigaction* %act, i32 0, i32 1, !dbg !147
  %call2 = call i32 @sigemptyset(%struct.__sigset_t* %sa_mask) #6, !dbg !148
  %sa_flags = getelementptr inbounds %struct.sigaction, %struct.sigaction* %act, i32 0, i32 2, !dbg !149
  store i32 0, i32* %sa_flags, align 8, !dbg !150
  %call3 = call i32 @sigaction(i32 2, %struct.sigaction* %act, %struct.sigaction* null) #6, !dbg !151
  %call4 = call i32 @sleep(i32 20), !dbg !152
  %call5 = call i32 @unlink(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)) #6, !dbg !153
  %2 = load i32, i32* %myfd, align 4, !dbg !154
  %call6 = call i32 @close(i32 %2), !dbg !155
  ret i32 0, !dbg !156
}

declare dso_local i32 @open(i8*, i32, ...) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: nounwind
declare dso_local i32 @sigemptyset(%struct.__sigset_t*) #3

; Function Attrs: nounwind
declare dso_local i32 @sigaction(i32, %struct.sigaction*, %struct.sigaction*) #3

declare dso_local i32 @sleep(i32) #2

declare dso_local i32 @close(i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "determine-if-only-one-instance-is-running-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Determine-if-only-one-instance-is-running-2")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "sigint_handler", scope: !1, file: !1, line: 8, type: !8, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "sig", arg: 1, scope: !7, file: !1, line: 8, type: !10)
!12 = !DILocation(line: 8, column: 25, scope: !7)
!13 = !DILocation(line: 10, column: 12, scope: !7)
!14 = !DILocation(line: 10, column: 43, scope: !7)
!15 = !DILocation(line: 10, column: 4, scope: !7)
!16 = !DILocation(line: 11, column: 4, scope: !7)
!17 = !DILocation(line: 13, column: 4, scope: !7)
!18 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 16, type: !19, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!10}
!21 = !DILocalVariable(name: "act", scope: !18, file: !1, line: 18, type: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sigaction", file: !23, line: 27, size: 1216, elements: !24)
!23 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sigaction.h", directory: "")
!24 = !{!25, !117, !127, !128}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "__sigaction_handler", scope: !22, file: !23, line: 38, baseType: !26, size: 64)
!26 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !22, file: !23, line: 31, size: 64, elements: !27)
!27 = !{!28, !32}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "sa_handler", scope: !26, file: !23, line: 34, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sighandler_t", file: !30, line: 72, baseType: !31)
!30 = !DIFile(filename: "/usr/include/signal.h", directory: "")
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "sa_sigaction", scope: !26, file: !23, line: 36, baseType: !33, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DISubroutineType(types: !35)
!35 = !{null, !10, !36, !73}
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "siginfo_t", file: !38, line: 124, baseType: !39)
!38 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h", directory: "")
!39 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !38, line: 36, size: 1024, elements: !40)
!40 = !{!41, !42, !43, !44, !45}
!41 = !DIDerivedType(tag: DW_TAG_member, name: "si_signo", scope: !39, file: !38, line: 38, baseType: !10, size: 32)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "si_errno", scope: !39, file: !38, line: 40, baseType: !10, size: 32, offset: 32)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "si_code", scope: !39, file: !38, line: 42, baseType: !10, size: 32, offset: 64)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !39, file: !38, line: 48, baseType: !10, size: 32, offset: 96)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "_sifields", scope: !39, file: !38, line: 123, baseType: !46, size: 896, offset: 128)
!46 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !39, file: !38, line: 51, size: 896, elements: !47)
!47 = !{!48, !52, !61, !74, !80, !90, !106, !111}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "_pad", scope: !46, file: !38, line: 53, baseType: !49, size: 896)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 896, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 28)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "_kill", scope: !46, file: !38, line: 60, baseType: !53, size: 64)
!53 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !46, file: !38, line: 56, size: 64, elements: !54)
!54 = !{!55, !58}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "si_pid", scope: !53, file: !38, line: 58, baseType: !56, size: 32)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "__pid_t", file: !57, line: 154, baseType: !10)
!57 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!58 = !DIDerivedType(tag: DW_TAG_member, name: "si_uid", scope: !53, file: !38, line: 59, baseType: !59, size: 32, offset: 32)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !57, line: 146, baseType: !60)
!60 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "_timer", scope: !46, file: !38, line: 68, baseType: !62, size: 128)
!62 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !46, file: !38, line: 63, size: 128, elements: !63)
!63 = !{!64, !65, !66}
!64 = !DIDerivedType(tag: DW_TAG_member, name: "si_tid", scope: !62, file: !38, line: 65, baseType: !10, size: 32)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "si_overrun", scope: !62, file: !38, line: 66, baseType: !10, size: 32, offset: 32)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "si_sigval", scope: !62, file: !38, line: 67, baseType: !67, size: 64, offset: 64)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sigval_t", file: !68, line: 30, baseType: !69)
!68 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__sigval_t.h", directory: "")
!69 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "sigval", file: !68, line: 24, size: 64, elements: !70)
!70 = !{!71, !72}
!71 = !DIDerivedType(tag: DW_TAG_member, name: "sival_int", scope: !69, file: !68, line: 26, baseType: !10, size: 32)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "sival_ptr", scope: !69, file: !68, line: 27, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "_rt", scope: !46, file: !38, line: 76, baseType: !75, size: 128)
!75 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !46, file: !38, line: 71, size: 128, elements: !76)
!76 = !{!77, !78, !79}
!77 = !DIDerivedType(tag: DW_TAG_member, name: "si_pid", scope: !75, file: !38, line: 73, baseType: !56, size: 32)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "si_uid", scope: !75, file: !38, line: 74, baseType: !59, size: 32, offset: 32)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "si_sigval", scope: !75, file: !38, line: 75, baseType: !67, size: 64, offset: 64)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "_sigchld", scope: !46, file: !38, line: 86, baseType: !81, size: 256)
!81 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !46, file: !38, line: 79, size: 256, elements: !82)
!82 = !{!83, !84, !85, !86, !89}
!83 = !DIDerivedType(tag: DW_TAG_member, name: "si_pid", scope: !81, file: !38, line: 81, baseType: !56, size: 32)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "si_uid", scope: !81, file: !38, line: 82, baseType: !59, size: 32, offset: 32)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "si_status", scope: !81, file: !38, line: 83, baseType: !10, size: 32, offset: 64)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "si_utime", scope: !81, file: !38, line: 84, baseType: !87, size: 64, offset: 128)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !57, line: 156, baseType: !88)
!88 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "si_stime", scope: !81, file: !38, line: 85, baseType: !87, size: 64, offset: 192)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "_sigfault", scope: !46, file: !38, line: 105, baseType: !91, size: 256)
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !46, file: !38, line: 89, size: 256, elements: !92)
!92 = !{!93, !94, !96}
!93 = !DIDerivedType(tag: DW_TAG_member, name: "si_addr", scope: !91, file: !38, line: 91, baseType: !73, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "si_addr_lsb", scope: !91, file: !38, line: 93, baseType: !95, size: 16, offset: 64)
!95 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "_bounds", scope: !91, file: !38, line: 104, baseType: !97, size: 128, offset: 128)
!97 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !91, file: !38, line: 94, size: 128, elements: !98)
!98 = !{!99, !104}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "_addr_bnd", scope: !97, file: !38, line: 101, baseType: !100, size: 128)
!100 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !97, file: !38, line: 97, size: 128, elements: !101)
!101 = !{!102, !103}
!102 = !DIDerivedType(tag: DW_TAG_member, name: "_lower", scope: !100, file: !38, line: 99, baseType: !73, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "_upper", scope: !100, file: !38, line: 100, baseType: !73, size: 64, offset: 64)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "_pkey", scope: !97, file: !38, line: 103, baseType: !105, size: 32)
!105 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !57, line: 42, baseType: !60)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "_sigpoll", scope: !46, file: !38, line: 112, baseType: !107, size: 128)
!107 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !46, file: !38, line: 108, size: 128, elements: !108)
!108 = !{!109, !110}
!109 = !DIDerivedType(tag: DW_TAG_member, name: "si_band", scope: !107, file: !38, line: 110, baseType: !88, size: 64)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "si_fd", scope: !107, file: !38, line: 111, baseType: !10, size: 32, offset: 64)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "_sigsys", scope: !46, file: !38, line: 121, baseType: !112, size: 128)
!112 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !46, file: !38, line: 116, size: 128, elements: !113)
!113 = !{!114, !115, !116}
!114 = !DIDerivedType(tag: DW_TAG_member, name: "_call_addr", scope: !112, file: !38, line: 118, baseType: !73, size: 64)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "_syscall", scope: !112, file: !38, line: 119, baseType: !10, size: 32, offset: 64)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "_arch", scope: !112, file: !38, line: 120, baseType: !60, size: 32, offset: 96)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "sa_mask", scope: !22, file: !23, line: 46, baseType: !118, size: 1024, offset: 64)
!118 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sigset_t", file: !119, line: 8, baseType: !120)
!119 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h", directory: "")
!120 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !119, line: 5, size: 1024, elements: !121)
!121 = !{!122}
!122 = !DIDerivedType(tag: DW_TAG_member, name: "__val", scope: !120, file: !119, line: 7, baseType: !123, size: 1024)
!123 = !DICompositeType(tag: DW_TAG_array_type, baseType: !124, size: 1024, elements: !125)
!124 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!125 = !{!126}
!126 = !DISubrange(count: 16)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "sa_flags", scope: !22, file: !23, line: 49, baseType: !10, size: 32, offset: 1088)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "sa_restorer", scope: !22, file: !23, line: 52, baseType: !129, size: 64, offset: 1152)
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64)
!130 = !DISubroutineType(types: !131)
!131 = !{null}
!132 = !DILocation(line: 18, column: 21, scope: !18)
!133 = !DILocalVariable(name: "myfd", scope: !18, file: !1, line: 19, type: !10)
!134 = !DILocation(line: 19, column: 8, scope: !18)
!135 = !DILocation(line: 21, column: 11, scope: !18)
!136 = !DILocation(line: 21, column: 9, scope: !18)
!137 = !DILocation(line: 22, column: 9, scope: !138)
!138 = distinct !DILexicalBlock(scope: !18, file: !1, line: 22, column: 9)
!139 = !DILocation(line: 22, column: 14, scope: !138)
!140 = !DILocation(line: 22, column: 9, scope: !18)
!141 = !DILocation(line: 24, column: 15, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !1, line: 23, column: 4)
!143 = !DILocation(line: 24, column: 7, scope: !142)
!144 = !DILocation(line: 25, column: 7, scope: !142)
!145 = !DILocation(line: 27, column: 8, scope: !18)
!146 = !DILocation(line: 27, column: 19, scope: !18)
!147 = !DILocation(line: 28, column: 21, scope: !18)
!148 = !DILocation(line: 28, column: 4, scope: !18)
!149 = !DILocation(line: 29, column: 8, scope: !18)
!150 = !DILocation(line: 29, column: 17, scope: !18)
!151 = !DILocation(line: 30, column: 4, scope: !18)
!152 = !DILocation(line: 32, column: 4, scope: !18)
!153 = !DILocation(line: 34, column: 4, scope: !18)
!154 = !DILocation(line: 34, column: 39, scope: !18)
!155 = !DILocation(line: 34, column: 33, scope: !18)
!156 = !DILocation(line: 35, column: 4, scope: !18)
