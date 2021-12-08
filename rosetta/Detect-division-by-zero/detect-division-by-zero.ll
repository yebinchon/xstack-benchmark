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
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %act = alloca %struct.sigaction, align 8
  %old = alloca %struct.sigaction, align 8
  %code = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 %y, i32* %y.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %y.addr, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata %struct.sigaction* %act, metadata !43, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata %struct.sigaction* %old, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i32* %code, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i32* %result, metadata !151, metadata !DIExpression()), !dbg !153
  %call = call i32 @__sigsetjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @fpe_env, i64 0, i64 0), i32 1) #6, !dbg !154
  store i32 %call, i32* %code, align 4, !dbg !155
  %0 = load i32, i32* %code, align 4, !dbg !156
  %cmp = icmp eq i32 %0, 0, !dbg !158
  br i1 %cmp, label %if.then, label %if.else, !dbg !159

if.then:                                          ; preds = %entry
  %__sigaction_handler = getelementptr inbounds %struct.sigaction, %struct.sigaction* %act, i32 0, i32 0, !dbg !160
  %sa_sigaction = bitcast %union.anon* %__sigaction_handler to void (i32, %struct.siginfo_t*, i8*)**, !dbg !160
  store void (i32, %struct.siginfo_t*, i8*)* @fpe_handler, void (i32, %struct.siginfo_t*, i8*)** %sa_sigaction, align 8, !dbg !162
  %sa_mask = getelementptr inbounds %struct.sigaction, %struct.sigaction* %act, i32 0, i32 1, !dbg !163
  %call1 = call i32 @sigemptyset(%struct.__sigset_t* %sa_mask) #7, !dbg !164
  %sa_flags = getelementptr inbounds %struct.sigaction, %struct.sigaction* %act, i32 0, i32 2, !dbg !165
  store i32 4, i32* %sa_flags, align 8, !dbg !166
  %call2 = call i32 @sigaction(i32 8, %struct.sigaction* %act, %struct.sigaction* %old) #7, !dbg !167
  %cmp3 = icmp slt i32 %call2, 0, !dbg !169
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !170

if.then4:                                         ; preds = %if.then
  call void @perror(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !171
  call void @exit(i32 1) #8, !dbg !173
  unreachable, !dbg !173

if.end:                                           ; preds = %if.then
  %1 = load i32, i32* %x.addr, align 4, !dbg !174
  %2 = load i32, i32* %y.addr, align 4, !dbg !175
  %div = sdiv i32 %1, %2, !dbg !176
  store volatile i32 %div, i32* %result, align 4, !dbg !177
  %call5 = call i32 @sigaction(i32 8, %struct.sigaction* %old, %struct.sigaction* null) #7, !dbg !178
  %cmp6 = icmp slt i32 %call5, 0, !dbg !180
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !181

if.then7:                                         ; preds = %if.end
  call void @perror(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !182
  call void @exit(i32 1) #8, !dbg !184
  unreachable, !dbg !184

if.end8:                                          ; preds = %if.end
  %3 = load i32, i32* %x.addr, align 4, !dbg !185
  %4 = load i32, i32* %y.addr, align 4, !dbg !186
  %5 = load volatile i32, i32* %result, align 4, !dbg !187
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i32 %3, i32 %4, i32 %5), !dbg !188
  br label %if.end16, !dbg !189

if.else:                                          ; preds = %entry
  %call10 = call i32 @sigaction(i32 8, %struct.sigaction* %old, %struct.sigaction* null) #7, !dbg !190
  %cmp11 = icmp slt i32 %call10, 0, !dbg !193
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !194

if.then12:                                        ; preds = %if.else
  call void @perror(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !195
  call void @exit(i32 1) #8, !dbg !197
  unreachable, !dbg !197

if.end13:                                         ; preds = %if.else
  %6 = load i32, i32* %code, align 4, !dbg !198
  switch i32 %6, label %sw.default [
    i32 1, label %sw.bb
    i32 3, label %sw.bb
  ], !dbg !199

sw.bb:                                            ; preds = %if.end13, %if.end13
  %7 = load i32, i32* %x.addr, align 4, !dbg !200
  %8 = load i32, i32* %y.addr, align 4, !dbg !202
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.2, i64 0, i64 0), i32 %7, i32 %8), !dbg !203
  br label %sw.epilog, !dbg !204

sw.default:                                       ; preds = %if.end13
  %9 = load i32, i32* %x.addr, align 4, !dbg !205
  %10 = load i32, i32* %y.addr, align 4, !dbg !206
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i64 0, i64 0), i32 %9, i32 %10), !dbg !207
  br label %sw.epilog, !dbg !208

sw.epilog:                                        ; preds = %sw.default, %sw.bb
  br label %if.end16

if.end16:                                         ; preds = %sw.epilog, %if.end8
  ret void, !dbg !209
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind returns_twice
declare dso_local i32 @__sigsetjmp(%struct.__jmp_buf_tag*, i32) #2

; Function Attrs: noinline nounwind uwtable
define internal void @fpe_handler(i32 %signal, %struct.siginfo_t* %w, i8* %a) #0 !dbg !210 {
entry:
  %signal.addr = alloca i32, align 4
  %w.addr = alloca %struct.siginfo_t*, align 8
  %a.addr = alloca i8*, align 8
  store i32 %signal, i32* %signal.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %signal.addr, metadata !211, metadata !DIExpression()), !dbg !212
  store %struct.siginfo_t* %w, %struct.siginfo_t** %w.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.siginfo_t** %w.addr, metadata !213, metadata !DIExpression()), !dbg !214
  store i8* %a, i8** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a.addr, metadata !215, metadata !DIExpression()), !dbg !216
  %0 = load %struct.siginfo_t*, %struct.siginfo_t** %w.addr, align 8, !dbg !217
  %si_code = getelementptr inbounds %struct.siginfo_t, %struct.siginfo_t* %0, i32 0, i32 2, !dbg !218
  %1 = load i32, i32* %si_code, align 8, !dbg !218
  call void @siglongjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @fpe_env, i64 0, i64 0), i32 %1) #8, !dbg !219
  unreachable, !dbg !219
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
define dso_local i32 @main() #0 !dbg !220 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @try_division(i32 -44, i32 0), !dbg !223
  call void @try_division(i32 -44, i32 5), !dbg !224
  call void @try_division(i32 0, i32 5), !dbg !225
  call void @try_division(i32 0, i32 0), !dbg !226
  call void @try_division(i32 -2147483648, i32 -1), !dbg !227
  ret i32 0, !dbg !228
}

; Function Attrs: noreturn nounwind
declare dso_local void @siglongjmp(%struct.__jmp_buf_tag*, i32) #5

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
!40 = !DILocation(line: 27, column: 18, scope: !36)
!41 = !DILocalVariable(name: "y", arg: 2, scope: !36, file: !3, line: 27, type: !19)
!42 = !DILocation(line: 27, column: 25, scope: !36)
!43 = !DILocalVariable(name: "act", scope: !36, file: !3, line: 29, type: !44)
!44 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sigaction", file: !45, line: 27, size: 1216, elements: !46)
!45 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sigaction.h", directory: "")
!46 = !{!47, !140, !141, !142}
!47 = !DIDerivedType(tag: DW_TAG_member, name: "__sigaction_handler", scope: !44, file: !45, line: 38, baseType: !48, size: 64)
!48 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !44, file: !45, line: 31, size: 64, elements: !49)
!49 = !{!50, !56}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sa_handler", scope: !48, file: !45, line: 34, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sighandler_t", file: !52, line: 72, baseType: !53)
!52 = !DIFile(filename: "/usr/include/signal.h", directory: "")
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DISubroutineType(types: !55)
!55 = !{null, !19}
!56 = !DIDerivedType(tag: DW_TAG_member, name: "sa_sigaction", scope: !48, file: !45, line: 36, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DISubroutineType(types: !59)
!59 = !{null, !19, !60, !97}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "siginfo_t", file: !62, line: 124, baseType: !63)
!62 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h", directory: "")
!63 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !62, line: 36, size: 1024, elements: !64)
!64 = !{!65, !66, !67, !68, !69}
!65 = !DIDerivedType(tag: DW_TAG_member, name: "si_signo", scope: !63, file: !62, line: 38, baseType: !19, size: 32)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "si_errno", scope: !63, file: !62, line: 40, baseType: !19, size: 32, offset: 32)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "si_code", scope: !63, file: !62, line: 42, baseType: !19, size: 32, offset: 64)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !63, file: !62, line: 48, baseType: !19, size: 32, offset: 96)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "_sifields", scope: !63, file: !62, line: 123, baseType: !70, size: 896, offset: 128)
!70 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !63, file: !62, line: 51, size: 896, elements: !71)
!71 = !{!72, !76, !85, !98, !104, !113, !129, !134}
!72 = !DIDerivedType(tag: DW_TAG_member, name: "_pad", scope: !70, file: !62, line: 53, baseType: !73, size: 896)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 896, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 28)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "_kill", scope: !70, file: !62, line: 60, baseType: !77, size: 64)
!77 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !70, file: !62, line: 56, size: 64, elements: !78)
!78 = !{!79, !82}
!79 = !DIDerivedType(tag: DW_TAG_member, name: "si_pid", scope: !77, file: !62, line: 58, baseType: !80, size: 32)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "__pid_t", file: !81, line: 154, baseType: !19)
!81 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!82 = !DIDerivedType(tag: DW_TAG_member, name: "si_uid", scope: !77, file: !62, line: 59, baseType: !83, size: 32, offset: 32)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !81, line: 146, baseType: !84)
!84 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "_timer", scope: !70, file: !62, line: 68, baseType: !86, size: 128)
!86 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !70, file: !62, line: 63, size: 128, elements: !87)
!87 = !{!88, !89, !90}
!88 = !DIDerivedType(tag: DW_TAG_member, name: "si_tid", scope: !86, file: !62, line: 65, baseType: !19, size: 32)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "si_overrun", scope: !86, file: !62, line: 66, baseType: !19, size: 32, offset: 32)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "si_sigval", scope: !86, file: !62, line: 67, baseType: !91, size: 64, offset: 64)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sigval_t", file: !92, line: 30, baseType: !93)
!92 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__sigval_t.h", directory: "")
!93 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "sigval", file: !92, line: 24, size: 64, elements: !94)
!94 = !{!95, !96}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "sival_int", scope: !93, file: !92, line: 26, baseType: !19, size: 32)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sival_ptr", scope: !93, file: !92, line: 27, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "_rt", scope: !70, file: !62, line: 76, baseType: !99, size: 128)
!99 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !70, file: !62, line: 71, size: 128, elements: !100)
!100 = !{!101, !102, !103}
!101 = !DIDerivedType(tag: DW_TAG_member, name: "si_pid", scope: !99, file: !62, line: 73, baseType: !80, size: 32)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "si_uid", scope: !99, file: !62, line: 74, baseType: !83, size: 32, offset: 32)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "si_sigval", scope: !99, file: !62, line: 75, baseType: !91, size: 64, offset: 64)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "_sigchld", scope: !70, file: !62, line: 86, baseType: !105, size: 256)
!105 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !70, file: !62, line: 79, size: 256, elements: !106)
!106 = !{!107, !108, !109, !110, !112}
!107 = !DIDerivedType(tag: DW_TAG_member, name: "si_pid", scope: !105, file: !62, line: 81, baseType: !80, size: 32)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "si_uid", scope: !105, file: !62, line: 82, baseType: !83, size: 32, offset: 32)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "si_status", scope: !105, file: !62, line: 83, baseType: !19, size: 32, offset: 64)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "si_utime", scope: !105, file: !62, line: 84, baseType: !111, size: 64, offset: 128)
!111 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !81, line: 156, baseType: !15)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "si_stime", scope: !105, file: !62, line: 85, baseType: !111, size: 64, offset: 192)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "_sigfault", scope: !70, file: !62, line: 105, baseType: !114, size: 256)
!114 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !70, file: !62, line: 89, size: 256, elements: !115)
!115 = !{!116, !117, !119}
!116 = !DIDerivedType(tag: DW_TAG_member, name: "si_addr", scope: !114, file: !62, line: 91, baseType: !97, size: 64)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "si_addr_lsb", scope: !114, file: !62, line: 93, baseType: !118, size: 16, offset: 64)
!118 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "_bounds", scope: !114, file: !62, line: 104, baseType: !120, size: 128, offset: 128)
!120 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !114, file: !62, line: 94, size: 128, elements: !121)
!121 = !{!122, !127}
!122 = !DIDerivedType(tag: DW_TAG_member, name: "_addr_bnd", scope: !120, file: !62, line: 101, baseType: !123, size: 128)
!123 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !120, file: !62, line: 97, size: 128, elements: !124)
!124 = !{!125, !126}
!125 = !DIDerivedType(tag: DW_TAG_member, name: "_lower", scope: !123, file: !62, line: 99, baseType: !97, size: 64)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "_upper", scope: !123, file: !62, line: 100, baseType: !97, size: 64, offset: 64)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "_pkey", scope: !120, file: !62, line: 103, baseType: !128, size: 32)
!128 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !81, line: 42, baseType: !84)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "_sigpoll", scope: !70, file: !62, line: 112, baseType: !130, size: 128)
!130 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !70, file: !62, line: 108, size: 128, elements: !131)
!131 = !{!132, !133}
!132 = !DIDerivedType(tag: DW_TAG_member, name: "si_band", scope: !130, file: !62, line: 110, baseType: !15, size: 64)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "si_fd", scope: !130, file: !62, line: 111, baseType: !19, size: 32, offset: 64)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "_sigsys", scope: !70, file: !62, line: 121, baseType: !135, size: 128)
!135 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !70, file: !62, line: 116, size: 128, elements: !136)
!136 = !{!137, !138, !139}
!137 = !DIDerivedType(tag: DW_TAG_member, name: "_call_addr", scope: !135, file: !62, line: 118, baseType: !97, size: 64)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "_syscall", scope: !135, file: !62, line: 119, baseType: !19, size: 32, offset: 64)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "_arch", scope: !135, file: !62, line: 120, baseType: !84, size: 32, offset: 96)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "sa_mask", scope: !44, file: !45, line: 46, baseType: !21, size: 1024, offset: 64)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "sa_flags", scope: !44, file: !45, line: 49, baseType: !19, size: 32, offset: 1088)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "sa_restorer", scope: !44, file: !45, line: 52, baseType: !143, size: 64, offset: 1152)
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !144, size: 64)
!144 = !DISubroutineType(types: !145)
!145 = !{null}
!146 = !DILocation(line: 29, column: 19, scope: !36)
!147 = !DILocalVariable(name: "old", scope: !36, file: !3, line: 29, type: !44)
!148 = !DILocation(line: 29, column: 24, scope: !36)
!149 = !DILocalVariable(name: "code", scope: !36, file: !3, line: 30, type: !19)
!150 = !DILocation(line: 30, column: 6, scope: !36)
!151 = !DILocalVariable(name: "result", scope: !36, file: !3, line: 35, type: !152)
!152 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !19)
!153 = !DILocation(line: 35, column: 15, scope: !36)
!154 = !DILocation(line: 41, column: 9, scope: !36)
!155 = !DILocation(line: 41, column: 7, scope: !36)
!156 = !DILocation(line: 42, column: 6, scope: !157)
!157 = distinct !DILexicalBlock(scope: !36, file: !3, line: 42, column: 6)
!158 = !DILocation(line: 42, column: 11, scope: !157)
!159 = !DILocation(line: 42, column: 6, scope: !36)
!160 = !DILocation(line: 44, column: 7, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !3, line: 42, column: 17)
!162 = !DILocation(line: 44, column: 20, scope: !161)
!163 = !DILocation(line: 45, column: 20, scope: !161)
!164 = !DILocation(line: 45, column: 3, scope: !161)
!165 = !DILocation(line: 46, column: 7, scope: !161)
!166 = !DILocation(line: 46, column: 16, scope: !161)
!167 = !DILocation(line: 47, column: 7, scope: !168)
!168 = distinct !DILexicalBlock(scope: !161, file: !3, line: 47, column: 7)
!169 = !DILocation(line: 47, column: 37, scope: !168)
!170 = !DILocation(line: 47, column: 7, scope: !161)
!171 = !DILocation(line: 48, column: 4, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !3, line: 47, column: 42)
!173 = !DILocation(line: 49, column: 4, scope: !172)
!174 = !DILocation(line: 53, column: 12, scope: !161)
!175 = !DILocation(line: 53, column: 16, scope: !161)
!176 = !DILocation(line: 53, column: 14, scope: !161)
!177 = !DILocation(line: 53, column: 10, scope: !161)
!178 = !DILocation(line: 59, column: 7, scope: !179)
!179 = distinct !DILexicalBlock(scope: !161, file: !3, line: 59, column: 7)
!180 = !DILocation(line: 59, column: 37, scope: !179)
!181 = !DILocation(line: 59, column: 7, scope: !161)
!182 = !DILocation(line: 60, column: 4, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !3, line: 59, column: 42)
!184 = !DILocation(line: 61, column: 4, scope: !183)
!185 = !DILocation(line: 64, column: 29, scope: !161)
!186 = !DILocation(line: 64, column: 32, scope: !161)
!187 = !DILocation(line: 64, column: 35, scope: !161)
!188 = !DILocation(line: 64, column: 3, scope: !161)
!189 = !DILocation(line: 65, column: 2, scope: !161)
!190 = !DILocation(line: 72, column: 7, scope: !191)
!191 = distinct !DILexicalBlock(scope: !192, file: !3, line: 72, column: 7)
!192 = distinct !DILexicalBlock(scope: !157, file: !3, line: 65, column: 9)
!193 = !DILocation(line: 72, column: 37, scope: !191)
!194 = !DILocation(line: 72, column: 7, scope: !192)
!195 = !DILocation(line: 73, column: 4, scope: !196)
!196 = distinct !DILexicalBlock(scope: !191, file: !3, line: 72, column: 42)
!197 = !DILocation(line: 74, column: 4, scope: !196)
!198 = !DILocation(line: 78, column: 11, scope: !192)
!199 = !DILocation(line: 78, column: 3, scope: !192)
!200 = !DILocation(line: 81, column: 50, scope: !201)
!201 = distinct !DILexicalBlock(scope: !192, file: !3, line: 78, column: 17)
!202 = !DILocation(line: 81, column: 53, scope: !201)
!203 = !DILocation(line: 81, column: 4, scope: !201)
!204 = !DILocation(line: 82, column: 4, scope: !201)
!205 = !DILocation(line: 84, column: 50, scope: !201)
!206 = !DILocation(line: 84, column: 53, scope: !201)
!207 = !DILocation(line: 84, column: 4, scope: !201)
!208 = !DILocation(line: 85, column: 4, scope: !201)
!209 = !DILocation(line: 88, column: 1, scope: !36)
!210 = distinct !DISubprogram(name: "fpe_handler", scope: !3, file: !3, line: 17, type: !58, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!211 = !DILocalVariable(name: "signal", arg: 1, scope: !210, file: !3, line: 17, type: !19)
!212 = !DILocation(line: 17, column: 17, scope: !210)
!213 = !DILocalVariable(name: "w", arg: 2, scope: !210, file: !3, line: 17, type: !60)
!214 = !DILocation(line: 17, column: 36, scope: !210)
!215 = !DILocalVariable(name: "a", arg: 3, scope: !210, file: !3, line: 17, type: !97)
!216 = !DILocation(line: 17, column: 45, scope: !210)
!217 = !DILocation(line: 19, column: 22, scope: !210)
!218 = !DILocation(line: 19, column: 25, scope: !210)
!219 = !DILocation(line: 19, column: 2, scope: !210)
!220 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 92, type: !221, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!221 = !DISubroutineType(types: !222)
!222 = !{!19}
!223 = !DILocation(line: 94, column: 2, scope: !220)
!224 = !DILocation(line: 95, column: 2, scope: !220)
!225 = !DILocation(line: 96, column: 2, scope: !220)
!226 = !DILocation(line: 97, column: 2, scope: !220)
!227 = !DILocation(line: 98, column: 2, scope: !220)
!228 = !DILocation(line: 99, column: 2, scope: !220)
