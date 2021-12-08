; ModuleID = 'detect-division-by-zero.ll'
source_filename = "detect-division-by-zero.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }
%struct.sigaction = type { %union.anon, %struct.__sigset_t, i32, void ()* }
%union.anon = type { void (i32)* }
%struct.siginfo_t = type { i32, i32, i32, i32, %union.anon.0 }
%union.anon.0 = type { %struct.anon.3, [80 x i8] }
%struct.anon.3 = type { i32, i32, i32, i64, i64 }

@fpe_env = internal global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [10 x i8] c"sigaction\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"%d / %d is %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [35 x i8] c"%d / %d: caught division by zero!\0A\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"%d / %d: caught mysterious error!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @try_division(i32 %x, i32 %y) #0 !dbg !36 {
entry:
  %act = alloca %struct.sigaction, align 8
  %old = alloca %struct.sigaction, align 8
  %result = alloca i32, align 4
  call void @llvm.dbg.value(metadata i32 %x, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.value(metadata i32 %y, metadata !41, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata %struct.sigaction* %act, metadata !42, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata %struct.sigaction* %old, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i32* %result, metadata !148, metadata !DIExpression()), !dbg !150
  %call = call i32 @__sigsetjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @fpe_env, i64 0, i64 0), i32 1) #6, !dbg !151
  call void @llvm.dbg.value(metadata i32 %call, metadata !152, metadata !DIExpression()), !dbg !40
  %cmp = icmp eq i32 %call, 0, !dbg !153
  br i1 %cmp, label %if.then, label %if.else, !dbg !155

if.then:                                          ; preds = %entry
  %__sigaction_handler = getelementptr inbounds %struct.sigaction, %struct.sigaction* %act, i32 0, i32 0, !dbg !156
  %sa_sigaction = bitcast %union.anon* %__sigaction_handler to void (i32, %struct.siginfo_t*, i8*)**, !dbg !156
  store void (i32, %struct.siginfo_t*, i8*)* @fpe_handler, void (i32, %struct.siginfo_t*, i8*)** %sa_sigaction, align 8, !dbg !158
  %sa_mask = getelementptr inbounds %struct.sigaction, %struct.sigaction* %act, i32 0, i32 1, !dbg !159
  %call1 = call i32 @sigemptyset(%struct.__sigset_t* %sa_mask) #7, !dbg !160
  %sa_flags = getelementptr inbounds %struct.sigaction, %struct.sigaction* %act, i32 0, i32 2, !dbg !161
  store i32 4, i32* %sa_flags, align 8, !dbg !162
  %call2 = call i32 @sigaction(i32 8, %struct.sigaction* %act, %struct.sigaction* %old) #7, !dbg !163
  %cmp3 = icmp slt i32 %call2, 0, !dbg !165
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !166

if.then4:                                         ; preds = %if.then
  call void @perror(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !167
  call void @exit(i32 1) #8, !dbg !169
  unreachable, !dbg !169

if.end:                                           ; preds = %if.then
  %div = sdiv i32 %x, %y, !dbg !170
  store volatile i32 %div, i32* %result, align 4, !dbg !171
  %call5 = call i32 @sigaction(i32 8, %struct.sigaction* %old, %struct.sigaction* null) #7, !dbg !172
  %cmp6 = icmp slt i32 %call5, 0, !dbg !174
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !175

if.then7:                                         ; preds = %if.end
  call void @perror(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !176
  call void @exit(i32 1) #8, !dbg !178
  unreachable, !dbg !178

if.end8:                                          ; preds = %if.end
  %0 = load volatile i32, i32* %result, align 4, !dbg !179
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i32 %x, i32 %y, i32 %0), !dbg !180
  br label %if.end16, !dbg !181

if.else:                                          ; preds = %entry
  %call10 = call i32 @sigaction(i32 8, %struct.sigaction* %old, %struct.sigaction* null) #7, !dbg !182
  %cmp11 = icmp slt i32 %call10, 0, !dbg !185
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !186

if.then12:                                        ; preds = %if.else
  call void @perror(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !187
  call void @exit(i32 1) #8, !dbg !189
  unreachable, !dbg !189

if.end13:                                         ; preds = %if.else
  switch i32 %call, label %sw.default [
    i32 1, label %sw.bb
    i32 3, label %sw.bb
  ], !dbg !190

sw.bb:                                            ; preds = %if.end13, %if.end13
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.2, i64 0, i64 0), i32 %x, i32 %y), !dbg !191
  br label %sw.epilog, !dbg !193

sw.default:                                       ; preds = %if.end13
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i64 0, i64 0), i32 %x, i32 %y), !dbg !194
  br label %sw.epilog, !dbg !195

sw.epilog:                                        ; preds = %sw.default, %sw.bb
  br label %if.end16

if.end16:                                         ; preds = %sw.epilog, %if.end8
  ret void, !dbg !196
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind returns_twice
declare dso_local i32 @__sigsetjmp(%struct.__jmp_buf_tag*, i32) #2

; Function Attrs: noinline nounwind uwtable
define internal void @fpe_handler(i32 %signal, %struct.siginfo_t* %w, i8* %a) #0 !dbg !197 {
entry:
  call void @llvm.dbg.value(metadata i32 %signal, metadata !198, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.value(metadata %struct.siginfo_t* %w, metadata !200, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.value(metadata i8* %a, metadata !201, metadata !DIExpression()), !dbg !199
  %si_code = getelementptr inbounds %struct.siginfo_t, %struct.siginfo_t* %w, i32 0, i32 2, !dbg !202
  %0 = load i32, i32* %si_code, align 8, !dbg !202
  call void @siglongjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @fpe_env, i64 0, i64 0), i32 %0) #8, !dbg !203
  unreachable, !dbg !203
}

; Function Attrs: nounwind
declare dso_local i32 @sigemptyset(%struct.__sigset_t*) #3

; Function Attrs: nounwind
declare dso_local i32 @sigaction(i32, %struct.sigaction*, %struct.sigaction*) #3

declare dso_local void @perror(i8*) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !204 {
entry:
  call void @try_division(i32 -44, i32 0), !dbg !207
  call void @try_division(i32 -44, i32 5), !dbg !208
  call void @try_division(i32 0, i32 5), !dbg !209
  call void @try_division(i32 0, i32 0), !dbg !210
  call void @try_division(i32 -2147483648, i32 -1), !dbg !211
  ret i32 0, !dbg !212
}

; Function Attrs: noreturn nounwind
declare dso_local void @siglongjmp(%struct.__jmp_buf_tag*, i32) #5

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind returns_twice "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind returns_twice }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!32, !33, !34}
!llvm.ident = !{!35}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "fpe_env", scope: !2, file: !3, line: 7, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "detect-division-by-zero.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Detect-division-by-zero")
!4 = !{}
!5 = !{!0}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "sigjmp_buf", file: !7, line: 83, baseType: !8)
!7 = !DIFile(filename: "/usr/include/setjmp.h", directory: "")
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 1600, elements: !30)
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__jmp_buf_tag", file: !7, line: 33, size: 1600, elements: !10)
!10 = !{!11, !18, !20}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "__jmpbuf", scope: !9, file: !7, line: 39, baseType: !12, size: 512)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__jmp_buf", file: !13, line: 31, baseType: !14)
!13 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/setjmp.h", directory: "")
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 512, elements: !16)
!15 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!16 = !{!17}
!17 = !DISubrange(count: 8)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "__mask_was_saved", scope: !9, file: !7, line: 40, baseType: !19, size: 32, offset: 512)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "__saved_mask", scope: !9, file: !7, line: 41, baseType: !21, size: 1024, offset: 576)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sigset_t", file: !22, line: 8, baseType: !23)
!22 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h", directory: "")
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !22, line: 5, size: 1024, elements: !24)
!24 = !{!25}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "__val", scope: !23, file: !22, line: 7, baseType: !26, size: 1024)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 1024, elements: !28)
!27 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!28 = !{!29}
!29 = !DISubrange(count: 16)
!30 = !{!31}
!31 = !DISubrange(count: 1)
!32 = !{i32 7, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 3}
!34 = !{i32 1, !"wchar_size", i32 4}
!35 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!36 = distinct !DISubprogram(name: "try_division", scope: !3, file: !3, line: 27, type: !37, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!37 = !DISubroutineType(types: !38)
!38 = !{null, !19, !19}
!39 = !DILocalVariable(name: "x", arg: 1, scope: !36, file: !3, line: 27, type: !19)
!40 = !DILocation(line: 0, scope: !36)
!41 = !DILocalVariable(name: "y", arg: 2, scope: !36, file: !3, line: 27, type: !19)
!42 = !DILocalVariable(name: "act", scope: !36, file: !3, line: 29, type: !43)
!43 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sigaction", file: !44, line: 27, size: 1216, elements: !45)
!44 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sigaction.h", directory: "")
!45 = !{!46, !139, !140, !141}
!46 = !DIDerivedType(tag: DW_TAG_member, name: "__sigaction_handler", scope: !43, file: !44, line: 38, baseType: !47, size: 64)
!47 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !43, file: !44, line: 31, size: 64, elements: !48)
!48 = !{!49, !55}
!49 = !DIDerivedType(tag: DW_TAG_member, name: "sa_handler", scope: !47, file: !44, line: 34, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sighandler_t", file: !51, line: 72, baseType: !52)
!51 = !DIFile(filename: "/usr/include/signal.h", directory: "")
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DISubroutineType(types: !54)
!54 = !{null, !19}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "sa_sigaction", scope: !47, file: !44, line: 36, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DISubroutineType(types: !58)
!58 = !{null, !19, !59, !96}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "siginfo_t", file: !61, line: 124, baseType: !62)
!61 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h", directory: "")
!62 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !61, line: 36, size: 1024, elements: !63)
!63 = !{!64, !65, !66, !67, !68}
!64 = !DIDerivedType(tag: DW_TAG_member, name: "si_signo", scope: !62, file: !61, line: 38, baseType: !19, size: 32)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "si_errno", scope: !62, file: !61, line: 40, baseType: !19, size: 32, offset: 32)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "si_code", scope: !62, file: !61, line: 42, baseType: !19, size: 32, offset: 64)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !62, file: !61, line: 48, baseType: !19, size: 32, offset: 96)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "_sifields", scope: !62, file: !61, line: 123, baseType: !69, size: 896, offset: 128)
!69 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !62, file: !61, line: 51, size: 896, elements: !70)
!70 = !{!71, !75, !84, !97, !103, !112, !128, !133}
!71 = !DIDerivedType(tag: DW_TAG_member, name: "_pad", scope: !69, file: !61, line: 53, baseType: !72, size: 896)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 896, elements: !73)
!73 = !{!74}
!74 = !DISubrange(count: 28)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "_kill", scope: !69, file: !61, line: 60, baseType: !76, size: 64)
!76 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !69, file: !61, line: 56, size: 64, elements: !77)
!77 = !{!78, !81}
!78 = !DIDerivedType(tag: DW_TAG_member, name: "si_pid", scope: !76, file: !61, line: 58, baseType: !79, size: 32)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "__pid_t", file: !80, line: 154, baseType: !19)
!80 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!81 = !DIDerivedType(tag: DW_TAG_member, name: "si_uid", scope: !76, file: !61, line: 59, baseType: !82, size: 32, offset: 32)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !80, line: 146, baseType: !83)
!83 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "_timer", scope: !69, file: !61, line: 68, baseType: !85, size: 128)
!85 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !69, file: !61, line: 63, size: 128, elements: !86)
!86 = !{!87, !88, !89}
!87 = !DIDerivedType(tag: DW_TAG_member, name: "si_tid", scope: !85, file: !61, line: 65, baseType: !19, size: 32)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "si_overrun", scope: !85, file: !61, line: 66, baseType: !19, size: 32, offset: 32)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "si_sigval", scope: !85, file: !61, line: 67, baseType: !90, size: 64, offset: 64)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sigval_t", file: !91, line: 30, baseType: !92)
!91 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__sigval_t.h", directory: "")
!92 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "sigval", file: !91, line: 24, size: 64, elements: !93)
!93 = !{!94, !95}
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sival_int", scope: !92, file: !91, line: 26, baseType: !19, size: 32)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "sival_ptr", scope: !92, file: !91, line: 27, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "_rt", scope: !69, file: !61, line: 76, baseType: !98, size: 128)
!98 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !69, file: !61, line: 71, size: 128, elements: !99)
!99 = !{!100, !101, !102}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "si_pid", scope: !98, file: !61, line: 73, baseType: !79, size: 32)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "si_uid", scope: !98, file: !61, line: 74, baseType: !82, size: 32, offset: 32)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "si_sigval", scope: !98, file: !61, line: 75, baseType: !90, size: 64, offset: 64)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "_sigchld", scope: !69, file: !61, line: 86, baseType: !104, size: 256)
!104 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !69, file: !61, line: 79, size: 256, elements: !105)
!105 = !{!106, !107, !108, !109, !111}
!106 = !DIDerivedType(tag: DW_TAG_member, name: "si_pid", scope: !104, file: !61, line: 81, baseType: !79, size: 32)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "si_uid", scope: !104, file: !61, line: 82, baseType: !82, size: 32, offset: 32)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "si_status", scope: !104, file: !61, line: 83, baseType: !19, size: 32, offset: 64)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "si_utime", scope: !104, file: !61, line: 84, baseType: !110, size: 64, offset: 128)
!110 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !80, line: 156, baseType: !15)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "si_stime", scope: !104, file: !61, line: 85, baseType: !110, size: 64, offset: 192)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "_sigfault", scope: !69, file: !61, line: 105, baseType: !113, size: 256)
!113 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !69, file: !61, line: 89, size: 256, elements: !114)
!114 = !{!115, !116, !118}
!115 = !DIDerivedType(tag: DW_TAG_member, name: "si_addr", scope: !113, file: !61, line: 91, baseType: !96, size: 64)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "si_addr_lsb", scope: !113, file: !61, line: 93, baseType: !117, size: 16, offset: 64)
!117 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "_bounds", scope: !113, file: !61, line: 104, baseType: !119, size: 128, offset: 128)
!119 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !113, file: !61, line: 94, size: 128, elements: !120)
!120 = !{!121, !126}
!121 = !DIDerivedType(tag: DW_TAG_member, name: "_addr_bnd", scope: !119, file: !61, line: 101, baseType: !122, size: 128)
!122 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !119, file: !61, line: 97, size: 128, elements: !123)
!123 = !{!124, !125}
!124 = !DIDerivedType(tag: DW_TAG_member, name: "_lower", scope: !122, file: !61, line: 99, baseType: !96, size: 64)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "_upper", scope: !122, file: !61, line: 100, baseType: !96, size: 64, offset: 64)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "_pkey", scope: !119, file: !61, line: 103, baseType: !127, size: 32)
!127 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !80, line: 42, baseType: !83)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "_sigpoll", scope: !69, file: !61, line: 112, baseType: !129, size: 128)
!129 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !69, file: !61, line: 108, size: 128, elements: !130)
!130 = !{!131, !132}
!131 = !DIDerivedType(tag: DW_TAG_member, name: "si_band", scope: !129, file: !61, line: 110, baseType: !15, size: 64)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "si_fd", scope: !129, file: !61, line: 111, baseType: !19, size: 32, offset: 64)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "_sigsys", scope: !69, file: !61, line: 121, baseType: !134, size: 128)
!134 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !69, file: !61, line: 116, size: 128, elements: !135)
!135 = !{!136, !137, !138}
!136 = !DIDerivedType(tag: DW_TAG_member, name: "_call_addr", scope: !134, file: !61, line: 118, baseType: !96, size: 64)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "_syscall", scope: !134, file: !61, line: 119, baseType: !19, size: 32, offset: 64)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "_arch", scope: !134, file: !61, line: 120, baseType: !83, size: 32, offset: 96)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "sa_mask", scope: !43, file: !44, line: 46, baseType: !21, size: 1024, offset: 64)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "sa_flags", scope: !43, file: !44, line: 49, baseType: !19, size: 32, offset: 1088)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "sa_restorer", scope: !43, file: !44, line: 52, baseType: !142, size: 64, offset: 1152)
!142 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !143, size: 64)
!143 = !DISubroutineType(types: !144)
!144 = !{null}
!145 = !DILocation(line: 29, column: 19, scope: !36)
!146 = !DILocalVariable(name: "old", scope: !36, file: !3, line: 29, type: !43)
!147 = !DILocation(line: 29, column: 24, scope: !36)
!148 = !DILocalVariable(name: "result", scope: !36, file: !3, line: 35, type: !149)
!149 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !19)
!150 = !DILocation(line: 35, column: 15, scope: !36)
!151 = !DILocation(line: 41, column: 9, scope: !36)
!152 = !DILocalVariable(name: "code", scope: !36, file: !3, line: 30, type: !19)
!153 = !DILocation(line: 42, column: 11, scope: !154)
!154 = distinct !DILexicalBlock(scope: !36, file: !3, line: 42, column: 6)
!155 = !DILocation(line: 42, column: 6, scope: !36)
!156 = !DILocation(line: 44, column: 7, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !3, line: 42, column: 17)
!158 = !DILocation(line: 44, column: 20, scope: !157)
!159 = !DILocation(line: 45, column: 20, scope: !157)
!160 = !DILocation(line: 45, column: 3, scope: !157)
!161 = !DILocation(line: 46, column: 7, scope: !157)
!162 = !DILocation(line: 46, column: 16, scope: !157)
!163 = !DILocation(line: 47, column: 7, scope: !164)
!164 = distinct !DILexicalBlock(scope: !157, file: !3, line: 47, column: 7)
!165 = !DILocation(line: 47, column: 37, scope: !164)
!166 = !DILocation(line: 47, column: 7, scope: !157)
!167 = !DILocation(line: 48, column: 4, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !3, line: 47, column: 42)
!169 = !DILocation(line: 49, column: 4, scope: !168)
!170 = !DILocation(line: 53, column: 14, scope: !157)
!171 = !DILocation(line: 53, column: 10, scope: !157)
!172 = !DILocation(line: 59, column: 7, scope: !173)
!173 = distinct !DILexicalBlock(scope: !157, file: !3, line: 59, column: 7)
!174 = !DILocation(line: 59, column: 37, scope: !173)
!175 = !DILocation(line: 59, column: 7, scope: !157)
!176 = !DILocation(line: 60, column: 4, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !3, line: 59, column: 42)
!178 = !DILocation(line: 61, column: 4, scope: !177)
!179 = !DILocation(line: 64, column: 35, scope: !157)
!180 = !DILocation(line: 64, column: 3, scope: !157)
!181 = !DILocation(line: 65, column: 2, scope: !157)
!182 = !DILocation(line: 72, column: 7, scope: !183)
!183 = distinct !DILexicalBlock(scope: !184, file: !3, line: 72, column: 7)
!184 = distinct !DILexicalBlock(scope: !154, file: !3, line: 65, column: 9)
!185 = !DILocation(line: 72, column: 37, scope: !183)
!186 = !DILocation(line: 72, column: 7, scope: !184)
!187 = !DILocation(line: 73, column: 4, scope: !188)
!188 = distinct !DILexicalBlock(scope: !183, file: !3, line: 72, column: 42)
!189 = !DILocation(line: 74, column: 4, scope: !188)
!190 = !DILocation(line: 78, column: 3, scope: !184)
!191 = !DILocation(line: 81, column: 4, scope: !192)
!192 = distinct !DILexicalBlock(scope: !184, file: !3, line: 78, column: 17)
!193 = !DILocation(line: 82, column: 4, scope: !192)
!194 = !DILocation(line: 84, column: 4, scope: !192)
!195 = !DILocation(line: 85, column: 4, scope: !192)
!196 = !DILocation(line: 88, column: 1, scope: !36)
!197 = distinct !DISubprogram(name: "fpe_handler", scope: !3, file: !3, line: 17, type: !57, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!198 = !DILocalVariable(name: "signal", arg: 1, scope: !197, file: !3, line: 17, type: !19)
!199 = !DILocation(line: 0, scope: !197)
!200 = !DILocalVariable(name: "w", arg: 2, scope: !197, file: !3, line: 17, type: !59)
!201 = !DILocalVariable(name: "a", arg: 3, scope: !197, file: !3, line: 17, type: !96)
!202 = !DILocation(line: 19, column: 25, scope: !197)
!203 = !DILocation(line: 19, column: 2, scope: !197)
!204 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 92, type: !205, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!205 = !DISubroutineType(types: !206)
!206 = !{!19}
!207 = !DILocation(line: 94, column: 2, scope: !204)
!208 = !DILocation(line: 95, column: 2, scope: !204)
!209 = !DILocation(line: 96, column: 2, scope: !204)
!210 = !DILocation(line: 97, column: 2, scope: !204)
!211 = !DILocation(line: 98, column: 2, scope: !204)
!212 = !DILocation(line: 99, column: 2, scope: !204)
