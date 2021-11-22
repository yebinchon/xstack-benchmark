; ModuleID = 'keyboard-input-obtain-a-y-or-n-response.c'
source_filename = "keyboard-input-obtain-a-y-or-n-response.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.timeval = type { i64, i64 }
%struct.fd_set = type { [16 x i64] }

@set_mode.old = internal global %struct.termios zeroinitializer, align 4, !dbg !0
@set_mode.new = internal global %struct.termios zeroinitializer, align 4, !dbg !14
@.str = private unnamed_addr constant [21 x i8] c"Prompt again [Y/N]? \00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"\0ADone\0A\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"\0AYes or no?\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @set_mode(i32 %want_key) #0 !dbg !2 {
entry:
  %want_key.addr = alloca i32, align 4
  store i32 %want_key, i32* %want_key.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %want_key.addr, metadata !40, metadata !DIExpression()), !dbg !41
  %0 = load i32, i32* %want_key.addr, align 4, !dbg !42
  %tobool = icmp ne i32 %0, 0, !dbg !42
  br i1 %tobool, label %if.end, label %if.then, !dbg !44, !cf.info !45

if.then:                                          ; preds = %entry
  %call = call i32 @tcsetattr(i32 0, i32 0, %struct.termios* @set_mode.old) #5, !dbg !46
  br label %return, !dbg !48

if.end:                                           ; preds = %entry
  %call1 = call i32 @tcgetattr(i32 0, %struct.termios* @set_mode.old) #5, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 bitcast (%struct.termios* @set_mode.new to i8*), i8* align 4 bitcast (%struct.termios* @set_mode.old to i8*), i64 60, i1 false), !dbg !50
  %1 = load i32, i32* getelementptr inbounds (%struct.termios, %struct.termios* @set_mode.new, i32 0, i32 3), align 4, !dbg !51
  %and = and i32 %1, -3, !dbg !51
  store i32 %and, i32* getelementptr inbounds (%struct.termios, %struct.termios* @set_mode.new, i32 0, i32 3), align 4, !dbg !51
  %call2 = call i32 @tcsetattr(i32 0, i32 0, %struct.termios* @set_mode.new) #5, !dbg !52
  br label %return, !dbg !53

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !53
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @tcsetattr(i32, i32, %struct.termios*) #2

; Function Attrs: nounwind
declare dso_local i32 @tcgetattr(i32, %struct.termios*) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @get_key(i32 %no_timeout) #0 !dbg !54 {
entry:
  %no_timeout.addr = alloca i32, align 4
  %c = alloca i32, align 4
  %tv = alloca %struct.timeval, align 8
  %fs = alloca %struct.fd_set, align 8
  %__d0 = alloca i32, align 4
  %__d1 = alloca i32, align 4
  store i32 %no_timeout, i32* %no_timeout.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %no_timeout.addr, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i32* %c, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 0, i32* %c, align 4, !dbg !60
  call void @llvm.dbg.declare(metadata %struct.timeval* %tv, metadata !61, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata %struct.fd_set* %fs, metadata !71, metadata !DIExpression()), !dbg !79
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i32 0, i32 0, !dbg !80
  store i64 0, i64* %tv_sec, align 8, !dbg !81
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i32 0, i32 1, !dbg !82
  store i64 0, i64* %tv_usec, align 8, !dbg !83
  br label %do.body, !dbg !84

do.body:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %__d0, metadata !85, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i32* %__d1, metadata !88, metadata !DIExpression()), !dbg !87
  %__fds_bits = getelementptr inbounds %struct.fd_set, %struct.fd_set* %fs, i32 0, i32 0, !dbg !87
  %arrayidx = getelementptr inbounds [16 x i64], [16 x i64]* %__fds_bits, i64 0, i64 0, !dbg !87
  %0 = call { i64, i64* } asm sideeffect "cld; rep; stosq", "={cx},={di},{ax},0,1,~{memory},~{dirflag},~{fpsr},~{flags}"(i32 0, i64 16, i64* %arrayidx) #5, !dbg !87, !srcloc !89
  %asmresult = extractvalue { i64, i64* } %0, 0, !dbg !87
  %asmresult1 = extractvalue { i64, i64* } %0, 1, !dbg !87
  %1 = trunc i64 %asmresult to i32, !dbg !87
  store i32 %1, i32* %__d0, align 4, !dbg !87
  %2 = ptrtoint i64* %asmresult1 to i64, !dbg !87
  %3 = trunc i64 %2 to i32, !dbg !87
  store i32 %3, i32* %__d1, align 4, !dbg !87
  br label %do.end, !dbg !87

do.end:                                           ; preds = %do.body
  %__fds_bits2 = getelementptr inbounds %struct.fd_set, %struct.fd_set* %fs, i32 0, i32 0, !dbg !90
  %arrayidx3 = getelementptr inbounds [16 x i64], [16 x i64]* %__fds_bits2, i64 0, i64 0, !dbg !90
  %4 = load i64, i64* %arrayidx3, align 8, !dbg !90
  %or = or i64 %4, 1, !dbg !90
  store i64 %or, i64* %arrayidx3, align 8, !dbg !90
  %5 = load i32, i32* %no_timeout.addr, align 4, !dbg !91
  %tobool = icmp ne i32 %5, 0, !dbg !91
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !91

cond.true:                                        ; preds = %do.end
  br label %cond.end, !dbg !91

cond.false:                                       ; preds = %do.end
  br label %cond.end, !dbg !91

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.timeval* [ null, %cond.true ], [ %tv, %cond.false ], !dbg !91
  %call = call i32 @select(i32 1, %struct.fd_set* %fs, %struct.fd_set* null, %struct.fd_set* null, %struct.timeval* %cond), !dbg !92
  %__fds_bits4 = getelementptr inbounds %struct.fd_set, %struct.fd_set* %fs, i32 0, i32 0, !dbg !93
  %arrayidx5 = getelementptr inbounds [16 x i64], [16 x i64]* %__fds_bits4, i64 0, i64 0, !dbg !93
  %6 = load i64, i64* %arrayidx5, align 8, !dbg !93
  %and = and i64 %6, 1, !dbg !93
  %cmp = icmp ne i64 %and, 0, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !95, !cf.info !45

if.then:                                          ; preds = %cond.end
  %call6 = call i32 @getchar(), !dbg !96
  store i32 %call6, i32* %c, align 4, !dbg !98
  call void @set_mode(i32 0), !dbg !99
  br label %if.end, !dbg !100

if.end:                                           ; preds = %if.then, %cond.end
  %7 = load i32, i32* %c, align 4, !dbg !101
  ret i32 %7, !dbg !102
}

declare dso_local i32 @select(i32, %struct.fd_set*, %struct.fd_set*, %struct.fd_set*, %struct.timeval*) #4

declare dso_local i32 @getchar() #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !103 {
entry:
  %retval = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %c, metadata !106, metadata !DIExpression()), !dbg !107
  br label %while.body, !dbg !108

while.body:                                       ; preds = %entry, %if.then, %if.end13
  call void @set_mode(i32 1), !dbg !109
  br label %while.cond1, !dbg !111

while.cond1:                                      ; preds = %while.body2, %while.body
  %call = call i32 @get_key(i32 0), !dbg !112
  %tobool = icmp ne i32 %call, 0, !dbg !111
  br i1 %tobool, label %while.body2, label %while.end, !dbg !111

while.body2:                                      ; preds = %while.cond1
  br label %while.cond1, !dbg !111, !llvm.loop !113

while.end:                                        ; preds = %while.cond1
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !115
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !116
  %call4 = call i32 @fflush(%struct._IO_FILE* %0), !dbg !117
  %call5 = call i32 @get_key(i32 1), !dbg !118
  store i32 %call5, i32* %c, align 4, !dbg !119
  %1 = load i32, i32* %c, align 4, !dbg !120
  %cmp = icmp eq i32 %1, 89, !dbg !122
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !123, !cf.info !45

lor.lhs.false:                                    ; preds = %while.end
  %2 = load i32, i32* %c, align 4, !dbg !124
  %cmp6 = icmp eq i32 %2, 121, !dbg !125
  br i1 %cmp6, label %if.then, label %if.end, !dbg !126, !cf.info !45

if.then:                                          ; preds = %lor.lhs.false, %while.end
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !127
  br label %while.body, !dbg !129, !llvm.loop !130

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i32, i32* %c, align 4, !dbg !132
  %cmp8 = icmp eq i32 %3, 78, !dbg !134
  br i1 %cmp8, label %if.then11, label %lor.lhs.false9, !dbg !135, !cf.info !45

lor.lhs.false9:                                   ; preds = %if.end
  %4 = load i32, i32* %c, align 4, !dbg !136
  %cmp10 = icmp eq i32 %4, 110, !dbg !137
  br i1 %cmp10, label %if.then11, label %if.end13, !dbg !138, !cf.info !45

if.then11:                                        ; preds = %lor.lhs.false9, %if.end
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0)), !dbg !139
  br label %while.end15, !dbg !141

if.end13:                                         ; preds = %lor.lhs.false9
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0)), !dbg !142
  br label %while.body, !dbg !108, !llvm.loop !130

while.end15:                                      ; preds = %if.then11
  ret i32 0, !dbg !143
}

declare dso_local i32 @printf(i8*, ...) #4

declare dso_local i32 @fflush(%struct._IO_FILE*) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!36, !37, !38}
!llvm.ident = !{!39}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "old", scope: !2, file: !3, line: 9, type: !16, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "set_mode", scope: !3, file: !3, line: 7, type: !4, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!3 = !DIFile(filename: "keyboard-input-obtain-a-y-or-n-response.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Keyboard-input-Obtain-a-Y-or-N-response")
!4 = !DISubroutineType(types: !5)
!5 = !{null, !6}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, retainedTypes: !9, globals: !13, splitDebugInlining: false, nameTableKind: None)
!8 = !{}
!9 = !{!10, !6}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fd_mask", file: !11, line: 49, baseType: !12)
!11 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/select.h", directory: "")
!12 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!13 = !{!0, !14}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "new", scope: !2, file: !3, line: 9, type: !16, isLocal: true, isDefinition: true)
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "termios", file: !17, line: 24, size: 480, elements: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/termios-struct.h", directory: "")
!18 = !{!19, !23, !24, !25, !26, !29, !33, !35}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "c_iflag", scope: !16, file: !17, line: 26, baseType: !20, size: 32)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "tcflag_t", file: !21, line: 25, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/termios.h", directory: "")
!22 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "c_oflag", scope: !16, file: !17, line: 27, baseType: !20, size: 32, offset: 32)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "c_cflag", scope: !16, file: !17, line: 28, baseType: !20, size: 32, offset: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "c_lflag", scope: !16, file: !17, line: 29, baseType: !20, size: 32, offset: 96)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "c_line", scope: !16, file: !17, line: 30, baseType: !27, size: 8, offset: 128)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "cc_t", file: !21, line: 23, baseType: !28)
!28 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "c_cc", scope: !16, file: !17, line: 31, baseType: !30, size: 256, offset: 136)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 256, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 32)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "c_ispeed", scope: !16, file: !17, line: 32, baseType: !34, size: 32, offset: 416)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "speed_t", file: !21, line: 24, baseType: !22)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "c_ospeed", scope: !16, file: !17, line: 33, baseType: !34, size: 32, offset: 448)
!36 = !{i32 7, !"Dwarf Version", i32 4}
!37 = !{i32 2, !"Debug Info Version", i32 3}
!38 = !{i32 1, !"wchar_size", i32 4}
!39 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!40 = !DILocalVariable(name: "want_key", arg: 1, scope: !2, file: !3, line: 7, type: !6)
!41 = !DILocation(line: 7, column: 19, scope: !2)
!42 = !DILocation(line: 10, column: 7, scope: !43)
!43 = distinct !DILexicalBlock(scope: !2, file: !3, line: 10, column: 6)
!44 = !DILocation(line: 10, column: 6, scope: !2)
!45 = !{!"if"}
!46 = !DILocation(line: 11, column: 3, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !3, line: 10, column: 17)
!48 = !DILocation(line: 12, column: 3, scope: !47)
!49 = !DILocation(line: 15, column: 2, scope: !2)
!50 = !DILocation(line: 16, column: 8, scope: !2)
!51 = !DILocation(line: 17, column: 14, scope: !2)
!52 = !DILocation(line: 18, column: 2, scope: !2)
!53 = !DILocation(line: 19, column: 1, scope: !2)
!54 = distinct !DISubprogram(name: "get_key", scope: !3, file: !3, line: 21, type: !55, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!55 = !DISubroutineType(types: !56)
!56 = !{!6, !6}
!57 = !DILocalVariable(name: "no_timeout", arg: 1, scope: !54, file: !3, line: 21, type: !6)
!58 = !DILocation(line: 21, column: 17, scope: !54)
!59 = !DILocalVariable(name: "c", scope: !54, file: !3, line: 23, type: !6)
!60 = !DILocation(line: 23, column: 6, scope: !54)
!61 = !DILocalVariable(name: "tv", scope: !54, file: !3, line: 24, type: !62)
!62 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !63, line: 8, size: 128, elements: !64)
!63 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h", directory: "")
!64 = !{!65, !68}
!65 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !62, file: !63, line: 10, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !67, line: 160, baseType: !12)
!67 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!68 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !62, file: !63, line: 11, baseType: !69, size: 64, offset: 64)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !67, line: 162, baseType: !12)
!70 = !DILocation(line: 24, column: 17, scope: !54)
!71 = !DILocalVariable(name: "fs", scope: !54, file: !3, line: 25, type: !72)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "fd_set", file: !11, line: 70, baseType: !73)
!73 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !11, line: 59, size: 1024, elements: !74)
!74 = !{!75}
!75 = !DIDerivedType(tag: DW_TAG_member, name: "__fds_bits", scope: !73, file: !11, line: 67, baseType: !76, size: 1024)
!76 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 1024, elements: !77)
!77 = !{!78}
!78 = !DISubrange(count: 16)
!79 = !DILocation(line: 25, column: 9, scope: !54)
!80 = !DILocation(line: 26, column: 18, scope: !54)
!81 = !DILocation(line: 26, column: 25, scope: !54)
!82 = !DILocation(line: 26, column: 5, scope: !54)
!83 = !DILocation(line: 26, column: 13, scope: !54)
!84 = !DILocation(line: 28, column: 2, scope: !54)
!85 = !DILocalVariable(name: "__d0", scope: !86, file: !3, line: 28, type: !6)
!86 = distinct !DILexicalBlock(scope: !54, file: !3, line: 28, column: 2)
!87 = !DILocation(line: 28, column: 2, scope: !86)
!88 = !DILocalVariable(name: "__d1", scope: !86, file: !3, line: 28, type: !6)
!89 = !{i32 -2147189017}
!90 = !DILocation(line: 29, column: 2, scope: !54)
!91 = !DILocation(line: 31, column: 38, scope: !54)
!92 = !DILocation(line: 31, column: 2, scope: !54)
!93 = !DILocation(line: 32, column: 6, scope: !94)
!94 = distinct !DILexicalBlock(scope: !54, file: !3, line: 32, column: 6)
!95 = !DILocation(line: 32, column: 6, scope: !54)
!96 = !DILocation(line: 33, column: 7, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !3, line: 32, column: 35)
!98 = !DILocation(line: 33, column: 5, scope: !97)
!99 = !DILocation(line: 34, column: 3, scope: !97)
!100 = !DILocation(line: 35, column: 2, scope: !97)
!101 = !DILocation(line: 36, column: 9, scope: !54)
!102 = !DILocation(line: 36, column: 2, scope: !54)
!103 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 39, type: !104, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!104 = !DISubroutineType(types: !105)
!105 = !{!6}
!106 = !DILocalVariable(name: "c", scope: !103, file: !3, line: 41, type: !6)
!107 = !DILocation(line: 41, column: 6, scope: !103)
!108 = !DILocation(line: 42, column: 2, scope: !103)
!109 = !DILocation(line: 43, column: 3, scope: !110)
!110 = distinct !DILexicalBlock(scope: !103, file: !3, line: 42, column: 11)
!111 = !DILocation(line: 44, column: 3, scope: !110)
!112 = !DILocation(line: 44, column: 10, scope: !110)
!113 = distinct !{!113, !111, !114}
!114 = !DILocation(line: 44, column: 21, scope: !110)
!115 = !DILocation(line: 45, column: 3, scope: !110)
!116 = !DILocation(line: 46, column: 10, scope: !110)
!117 = !DILocation(line: 46, column: 3, scope: !110)
!118 = !DILocation(line: 48, column: 7, scope: !110)
!119 = !DILocation(line: 48, column: 5, scope: !110)
!120 = !DILocation(line: 49, column: 7, scope: !121)
!121 = distinct !DILexicalBlock(scope: !110, file: !3, line: 49, column: 7)
!122 = !DILocation(line: 49, column: 9, scope: !121)
!123 = !DILocation(line: 49, column: 16, scope: !121)
!124 = !DILocation(line: 49, column: 19, scope: !121)
!125 = !DILocation(line: 49, column: 21, scope: !121)
!126 = !DILocation(line: 49, column: 7, scope: !110)
!127 = !DILocation(line: 50, column: 4, scope: !128)
!128 = distinct !DILexicalBlock(scope: !121, file: !3, line: 49, column: 29)
!129 = !DILocation(line: 51, column: 4, scope: !128)
!130 = distinct !{!130, !108, !131}
!131 = !DILocation(line: 60, column: 2, scope: !103)
!132 = !DILocation(line: 54, column: 7, scope: !133)
!133 = distinct !DILexicalBlock(scope: !110, file: !3, line: 54, column: 7)
!134 = !DILocation(line: 54, column: 9, scope: !133)
!135 = !DILocation(line: 54, column: 16, scope: !133)
!136 = !DILocation(line: 54, column: 19, scope: !133)
!137 = !DILocation(line: 54, column: 21, scope: !133)
!138 = !DILocation(line: 54, column: 7, scope: !110)
!139 = !DILocation(line: 55, column: 4, scope: !140)
!140 = distinct !DILexicalBlock(scope: !133, file: !3, line: 54, column: 29)
!141 = !DILocation(line: 56, column: 4, scope: !140)
!142 = !DILocation(line: 59, column: 3, scope: !110)
!143 = !DILocation(line: 62, column: 2, scope: !103)
