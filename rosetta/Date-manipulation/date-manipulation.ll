; ModuleID = 'date-manipulation.c'
source_filename = "date-manipulation.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

@.str = private unnamed_addr constant [24 x i8] c"March 7 2009 7:30pm EST\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"%B %d %Y %I:%M%p %Z\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %ts = alloca %struct.tm, align 8
  %t = alloca i64, align 8
  %d = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.tm* %ts, metadata !11, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i64* %t, metadata !31, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i8** %d, metadata !37, metadata !DIExpression()), !dbg !38
  store i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i64 0, i64 0), i8** %d, align 8, !dbg !38
  %0 = load i8*, i8** %d, align 8, !dbg !39
  %call = call i32 (i8*, i8*, %struct.tm*, ...) bitcast (i32 (...)* @strptime to i32 (i8*, i8*, %struct.tm*, ...)*)(i8* %0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.1, i64 0, i64 0), %struct.tm* %ts), !dbg !40
  %call1 = call i64 @mktime(%struct.tm* %ts) #4, !dbg !41
  store i64 %call1, i64* %t, align 8, !dbg !42
  %1 = load i64, i64* %t, align 8, !dbg !43
  %add = add nsw i64 %1, 43200, !dbg !43
  store i64 %add, i64* %t, align 8, !dbg !43
  %call2 = call i8* @ctime(i64* %t) #4, !dbg !44
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i8* %call2), !dbg !45
  ret i32 0, !dbg !46
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @strptime(...) #2

; Function Attrs: nounwind
declare dso_local i64 @mktime(%struct.tm*) #3

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local i8* @ctime(i64*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "date-manipulation.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Date-manipulation")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 5, type: !8, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "ts", scope: !7, file: !1, line: 7, type: !12)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !13, line: 7, size: 448, elements: !14)
!13 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h", directory: "")
!14 = !{!15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !26}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !12, file: !13, line: 9, baseType: !10, size: 32)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !12, file: !13, line: 10, baseType: !10, size: 32, offset: 32)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !12, file: !13, line: 11, baseType: !10, size: 32, offset: 64)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !12, file: !13, line: 12, baseType: !10, size: 32, offset: 96)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !12, file: !13, line: 13, baseType: !10, size: 32, offset: 128)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !12, file: !13, line: 14, baseType: !10, size: 32, offset: 160)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !12, file: !13, line: 15, baseType: !10, size: 32, offset: 192)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !12, file: !13, line: 16, baseType: !10, size: 32, offset: 224)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !12, file: !13, line: 17, baseType: !10, size: 32, offset: 256)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !12, file: !13, line: 20, baseType: !25, size: 64, offset: 320)
!25 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !12, file: !13, line: 21, baseType: !27, size: 64, offset: 384)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !29)
!29 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!30 = !DILocation(line: 7, column: 13, scope: !7)
!31 = !DILocalVariable(name: "t", scope: !7, file: !1, line: 8, type: !32)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !33, line: 7, baseType: !34)
!33 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/time_t.h", directory: "")
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !35, line: 160, baseType: !25)
!35 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!36 = !DILocation(line: 8, column: 10, scope: !7)
!37 = !DILocalVariable(name: "d", scope: !7, file: !1, line: 9, type: !27)
!38 = !DILocation(line: 9, column: 15, scope: !7)
!39 = !DILocation(line: 11, column: 12, scope: !7)
!40 = !DILocation(line: 11, column: 3, scope: !7)
!41 = !DILocation(line: 14, column: 7, scope: !7)
!42 = !DILocation(line: 14, column: 5, scope: !7)
!43 = !DILocation(line: 15, column: 5, scope: !7)
!44 = !DILocation(line: 16, column: 16, scope: !7)
!45 = !DILocation(line: 16, column: 3, scope: !7)
!46 = !DILocation(line: 18, column: 3, scope: !7)
