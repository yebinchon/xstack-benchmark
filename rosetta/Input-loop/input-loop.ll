; ModuleID = 'input-loop.c'
source_filename = "input-loop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @get_line(%struct._IO_FILE* %fp) #0 !dbg !7 {
entry:
  %retval = alloca i8*, align 8
  %fp.addr = alloca %struct._IO_FILE*, align 8
  %len = alloca i32, align 4
  %got = alloca i32, align 4
  %c = alloca i32, align 4
  %buf = alloca i8*, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %fp.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fp.addr, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32* %len, metadata !75, metadata !DIExpression()), !dbg !76
  store i32 0, i32* %len, align 4, !dbg !76
  call void @llvm.dbg.declare(metadata i32* %got, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 0, i32* %got, align 4, !dbg !78
  call void @llvm.dbg.declare(metadata i32* %c, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i8** %buf, metadata !81, metadata !DIExpression()), !dbg !82
  store i8* null, i8** %buf, align 8, !dbg !82
  br label %while.cond, !dbg !83

while.cond:                                       ; preds = %if.end10, %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8, !dbg !84
  %call = call i32 @fgetc(%struct._IO_FILE* %0), !dbg !85
  store i32 %call, i32* %c, align 4, !dbg !86
  %cmp = icmp ne i32 %call, -1, !dbg !87
  br i1 %cmp, label %while.body, label %while.end, !dbg !83

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %got, align 4, !dbg !88
  %add = add nsw i32 %1, 1, !dbg !91
  %2 = load i32, i32* %len, align 4, !dbg !92
  %cmp1 = icmp sge i32 %add, %2, !dbg !93
  br i1 %cmp1, label %if.then, label %if.end5, !dbg !94, !cf.info !95

if.then:                                          ; preds = %while.body
  %3 = load i32, i32* %len, align 4, !dbg !96
  %mul = mul nsw i32 %3, 2, !dbg !96
  store i32 %mul, i32* %len, align 4, !dbg !96
  %4 = load i32, i32* %len, align 4, !dbg !98
  %cmp2 = icmp slt i32 %4, 4, !dbg !100
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !101, !cf.info !95

if.then3:                                         ; preds = %if.then
  store i32 4, i32* %len, align 4, !dbg !102
  br label %if.end, !dbg !103

if.end:                                           ; preds = %if.then3, %if.then
  %5 = load i8*, i8** %buf, align 8, !dbg !104
  %6 = load i32, i32* %len, align 4, !dbg !105
  %conv = sext i32 %6 to i64, !dbg !105
  %call4 = call i8* @realloc(i8* %5, i64 %conv) #4, !dbg !106
  store i8* %call4, i8** %buf, align 8, !dbg !107
  br label %if.end5, !dbg !108

if.end5:                                          ; preds = %if.end, %while.body
  %7 = load i32, i32* %c, align 4, !dbg !109
  %conv6 = trunc i32 %7 to i8, !dbg !109
  %8 = load i8*, i8** %buf, align 8, !dbg !110
  %9 = load i32, i32* %got, align 4, !dbg !111
  %inc = add nsw i32 %9, 1, !dbg !111
  store i32 %inc, i32* %got, align 4, !dbg !111
  %idxprom = sext i32 %9 to i64, !dbg !110
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %idxprom, !dbg !110
  store i8 %conv6, i8* %arrayidx, align 1, !dbg !112
  %10 = load i32, i32* %c, align 4, !dbg !113
  %cmp7 = icmp eq i32 %10, 10, !dbg !115
  br i1 %cmp7, label %if.then9, label %if.end10, !dbg !116, !cf.info !95

if.then9:                                         ; preds = %if.end5
  br label %while.end, !dbg !117

if.end10:                                         ; preds = %if.end5
  br label %while.cond, !dbg !83, !llvm.loop !118

while.end:                                        ; preds = %if.then9, %while.cond
  %11 = load i32, i32* %c, align 4, !dbg !120
  %cmp11 = icmp eq i32 %11, -1, !dbg !122
  br i1 %cmp11, label %land.lhs.true, label %if.end14, !dbg !123, !cf.info !95

land.lhs.true:                                    ; preds = %while.end
  %12 = load i32, i32* %got, align 4, !dbg !124
  %tobool = icmp ne i32 %12, 0, !dbg !124
  br i1 %tobool, label %if.end14, label %if.then13, !dbg !125, !cf.info !95

if.then13:                                        ; preds = %land.lhs.true
  store i8* null, i8** %retval, align 8, !dbg !126
  br label %return, !dbg !126

if.end14:                                         ; preds = %land.lhs.true, %while.end
  %13 = load i8*, i8** %buf, align 8, !dbg !127
  %14 = load i32, i32* %got, align 4, !dbg !128
  %inc15 = add nsw i32 %14, 1, !dbg !128
  store i32 %inc15, i32* %got, align 4, !dbg !128
  %idxprom16 = sext i32 %14 to i64, !dbg !127
  %arrayidx17 = getelementptr inbounds i8, i8* %13, i64 %idxprom16, !dbg !127
  store i8 0, i8* %arrayidx17, align 1, !dbg !129
  %15 = load i8*, i8** %buf, align 8, !dbg !130
  store i8* %15, i8** %retval, align 8, !dbg !131
  br label %return, !dbg !131

return:                                           ; preds = %if.end14, %if.then13
  %16 = load i8*, i8** %retval, align 8, !dbg !132
  ret i8* %16, !dbg !132
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @fgetc(%struct._IO_FILE*) #2

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !133 {
entry:
  %retval = alloca i32, align 4
  %s = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i8** %s, metadata !136, metadata !DIExpression()), !dbg !137
  br label %while.cond, !dbg !138

while.cond:                                       ; preds = %while.body, %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !139
  %call = call i8* @get_line(%struct._IO_FILE* %0), !dbg !140
  store i8* %call, i8** %s, align 8, !dbg !141
  %tobool = icmp ne i8* %call, null, !dbg !138
  br i1 %tobool, label %while.body, label %while.end, !dbg !138

while.body:                                       ; preds = %while.cond
  %1 = load i8*, i8** %s, align 8, !dbg !142
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %1), !dbg !144
  %2 = load i8*, i8** %s, align 8, !dbg !145
  call void @free(i8* %2) #4, !dbg !146
  br label %while.cond, !dbg !138, !llvm.loop !147

while.end:                                        ; preds = %while.cond
  ret i32 0, !dbg !149
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "input-loop.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Input-loop")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "get_line", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !12}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !14, line: 7, baseType: !15)
!14 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !16, line: 49, size: 1728, elements: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!17 = !{!18, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !34, !36, !37, !38, !42, !44, !46, !50, !53, !55, !58, !61, !62, !64, !68, !69}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !15, file: !16, line: 51, baseType: !19, size: 32)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !15, file: !16, line: 54, baseType: !10, size: 64, offset: 64)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !15, file: !16, line: 55, baseType: !10, size: 64, offset: 128)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !15, file: !16, line: 56, baseType: !10, size: 64, offset: 192)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !15, file: !16, line: 57, baseType: !10, size: 64, offset: 256)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !15, file: !16, line: 58, baseType: !10, size: 64, offset: 320)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !15, file: !16, line: 59, baseType: !10, size: 64, offset: 384)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !15, file: !16, line: 60, baseType: !10, size: 64, offset: 448)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !15, file: !16, line: 61, baseType: !10, size: 64, offset: 512)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !15, file: !16, line: 64, baseType: !10, size: 64, offset: 576)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !15, file: !16, line: 65, baseType: !10, size: 64, offset: 640)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !15, file: !16, line: 66, baseType: !10, size: 64, offset: 704)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !15, file: !16, line: 68, baseType: !32, size: 64, offset: 768)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !16, line: 36, flags: DIFlagFwdDecl)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !15, file: !16, line: 70, baseType: !35, size: 64, offset: 832)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !15, file: !16, line: 72, baseType: !19, size: 32, offset: 896)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !15, file: !16, line: 73, baseType: !19, size: 32, offset: 928)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !15, file: !16, line: 74, baseType: !39, size: 64, offset: 960)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !40, line: 152, baseType: !41)
!40 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!41 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !15, file: !16, line: 77, baseType: !43, size: 16, offset: 1024)
!43 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !15, file: !16, line: 78, baseType: !45, size: 8, offset: 1040)
!45 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !15, file: !16, line: 79, baseType: !47, size: 8, offset: 1048)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 8, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 1)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !15, file: !16, line: 81, baseType: !51, size: 64, offset: 1088)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !16, line: 43, baseType: null)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !15, file: !16, line: 89, baseType: !54, size: 64, offset: 1152)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !40, line: 153, baseType: !41)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !15, file: !16, line: 91, baseType: !56, size: 64, offset: 1216)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !16, line: 37, flags: DIFlagFwdDecl)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !15, file: !16, line: 92, baseType: !59, size: 64, offset: 1280)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !16, line: 38, flags: DIFlagFwdDecl)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !15, file: !16, line: 93, baseType: !35, size: 64, offset: 1344)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !15, file: !16, line: 94, baseType: !63, size: 64, offset: 1408)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !15, file: !16, line: 95, baseType: !65, size: 64, offset: 1472)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !66, line: 46, baseType: !67)
!66 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!67 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !15, file: !16, line: 96, baseType: !19, size: 32, offset: 1536)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !15, file: !16, line: 98, baseType: !70, size: 160, offset: 1568)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 160, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 20)
!73 = !DILocalVariable(name: "fp", arg: 1, scope: !7, file: !1, line: 4, type: !12)
!74 = !DILocation(line: 4, column: 22, scope: !7)
!75 = !DILocalVariable(name: "len", scope: !7, file: !1, line: 6, type: !19)
!76 = !DILocation(line: 6, column: 6, scope: !7)
!77 = !DILocalVariable(name: "got", scope: !7, file: !1, line: 6, type: !19)
!78 = !DILocation(line: 6, column: 15, scope: !7)
!79 = !DILocalVariable(name: "c", scope: !7, file: !1, line: 6, type: !19)
!80 = !DILocation(line: 6, column: 24, scope: !7)
!81 = !DILocalVariable(name: "buf", scope: !7, file: !1, line: 7, type: !10)
!82 = !DILocation(line: 7, column: 8, scope: !7)
!83 = !DILocation(line: 9, column: 2, scope: !7)
!84 = !DILocation(line: 9, column: 20, scope: !7)
!85 = !DILocation(line: 9, column: 14, scope: !7)
!86 = !DILocation(line: 9, column: 12, scope: !7)
!87 = !DILocation(line: 9, column: 25, scope: !7)
!88 = !DILocation(line: 10, column: 7, scope: !89)
!89 = distinct !DILexicalBlock(scope: !90, file: !1, line: 10, column: 7)
!90 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 33)
!91 = !DILocation(line: 10, column: 11, scope: !89)
!92 = !DILocation(line: 10, column: 18, scope: !89)
!93 = !DILocation(line: 10, column: 15, scope: !89)
!94 = !DILocation(line: 10, column: 7, scope: !90)
!95 = !{!"if"}
!96 = !DILocation(line: 11, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !89, file: !1, line: 10, column: 23)
!98 = !DILocation(line: 12, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !97, file: !1, line: 12, column: 8)
!100 = !DILocation(line: 12, column: 12, scope: !99)
!101 = !DILocation(line: 12, column: 8, scope: !97)
!102 = !DILocation(line: 12, column: 21, scope: !99)
!103 = !DILocation(line: 12, column: 17, scope: !99)
!104 = !DILocation(line: 13, column: 18, scope: !97)
!105 = !DILocation(line: 13, column: 23, scope: !97)
!106 = !DILocation(line: 13, column: 10, scope: !97)
!107 = !DILocation(line: 13, column: 8, scope: !97)
!108 = !DILocation(line: 14, column: 3, scope: !97)
!109 = !DILocation(line: 15, column: 16, scope: !90)
!110 = !DILocation(line: 15, column: 3, scope: !90)
!111 = !DILocation(line: 15, column: 10, scope: !90)
!112 = !DILocation(line: 15, column: 14, scope: !90)
!113 = !DILocation(line: 16, column: 7, scope: !114)
!114 = distinct !DILexicalBlock(scope: !90, file: !1, line: 16, column: 7)
!115 = !DILocation(line: 16, column: 9, scope: !114)
!116 = !DILocation(line: 16, column: 7, scope: !90)
!117 = !DILocation(line: 16, column: 18, scope: !114)
!118 = distinct !{!118, !83, !119}
!119 = !DILocation(line: 17, column: 2, scope: !7)
!120 = !DILocation(line: 18, column: 6, scope: !121)
!121 = distinct !DILexicalBlock(scope: !7, file: !1, line: 18, column: 6)
!122 = !DILocation(line: 18, column: 8, scope: !121)
!123 = !DILocation(line: 18, column: 15, scope: !121)
!124 = !DILocation(line: 18, column: 19, scope: !121)
!125 = !DILocation(line: 18, column: 6, scope: !7)
!126 = !DILocation(line: 18, column: 24, scope: !121)
!127 = !DILocation(line: 20, column: 2, scope: !7)
!128 = !DILocation(line: 20, column: 9, scope: !7)
!129 = !DILocation(line: 20, column: 13, scope: !7)
!130 = !DILocation(line: 21, column: 9, scope: !7)
!131 = !DILocation(line: 21, column: 2, scope: !7)
!132 = !DILocation(line: 22, column: 1, scope: !7)
!133 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 24, type: !134, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DISubroutineType(types: !135)
!135 = !{!19}
!136 = !DILocalVariable(name: "s", scope: !133, file: !1, line: 26, type: !10)
!137 = !DILocation(line: 26, column: 8, scope: !133)
!138 = !DILocation(line: 27, column: 2, scope: !133)
!139 = !DILocation(line: 27, column: 23, scope: !133)
!140 = !DILocation(line: 27, column: 14, scope: !133)
!141 = !DILocation(line: 27, column: 12, scope: !133)
!142 = !DILocation(line: 28, column: 15, scope: !143)
!143 = distinct !DILexicalBlock(scope: !133, file: !1, line: 27, column: 32)
!144 = !DILocation(line: 28, column: 3, scope: !143)
!145 = !DILocation(line: 29, column: 8, scope: !143)
!146 = !DILocation(line: 29, column: 3, scope: !143)
!147 = distinct !{!147, !138, !148}
!148 = !DILocation(line: 30, column: 2, scope: !133)
!149 = !DILocation(line: 31, column: 2, scope: !133)
