; ModuleID = 'copy-a-string-2.ll'
source_filename = "copy-a-string-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@__const.main.src = private unnamed_addr constant [6 x i8] c"Hello\00", align 1
@.str = private unnamed_addr constant [26 x i8] c"The buffer is too small!\0A\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [9 x i8] c"src: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"dst: %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %src = alloca [6 x i8], align 1
  %dst = alloca [80 x i8], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [6 x i8]* %src, metadata !11, metadata !DIExpression()), !dbg !16
  %0 = bitcast [6 x i8]* %src to i8*, !dbg !16
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([6 x i8], [6 x i8]* @__const.main.src, i32 0, i32 0), i64 6, i1 false), !dbg !16
  call void @llvm.dbg.declare(metadata [80 x i8]* %dst, metadata !17, metadata !DIExpression()), !dbg !21
  %arraydecay = getelementptr inbounds [80 x i8], [80 x i8]* %dst, i64 0, i64 0, !dbg !22
  %arraydecay1 = getelementptr inbounds [6 x i8], [6 x i8]* %src, i64 0, i64 0, !dbg !24
  %call = call i64 @strlcpy(i8* %arraydecay, i8* %arraydecay1, i64 80), !dbg !25
  %cmp = icmp uge i64 %call, 80, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !28
  %call2 = call i32 @fputs(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i64 0, i64 0), %struct._IO_FILE* %1), !dbg !30
  call void @exit(i32 1) #5, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  %arraydecay3 = getelementptr inbounds [6 x i8], [6 x i8]* %src, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 1 %arraydecay3, i8 45, i64 5, i1 false), !dbg !32
  %arraydecay4 = getelementptr inbounds [6 x i8], [6 x i8]* %src, i64 0, i64 0, !dbg !33
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i8* %arraydecay4), !dbg !34
  %arraydecay6 = getelementptr inbounds [80 x i8], [80 x i8]* %dst, i64 0, i64 0, !dbg !35
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), i8* %arraydecay6), !dbg !36
  ret i32 0, !dbg !37
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i64 @strlcpy(i8*, i8*, i64) #3

declare dso_local i32 @fputs(i8*, %struct._IO_FILE*) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "copy-a-string-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Copy-a-string-2")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !8, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "src", scope: !7, file: !1, line: 8, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 48, elements: !14)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !{!15}
!15 = !DISubrange(count: 6)
!16 = !DILocation(line: 8, column: 7, scope: !7)
!17 = !DILocalVariable(name: "dst", scope: !7, file: !1, line: 9, type: !18)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 640, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 80)
!21 = !DILocation(line: 9, column: 7, scope: !7)
!22 = !DILocation(line: 12, column: 14, scope: !23)
!23 = distinct !DILexicalBlock(scope: !7, file: !1, line: 12, column: 6)
!24 = !DILocation(line: 12, column: 19, scope: !23)
!25 = !DILocation(line: 12, column: 6, scope: !23)
!26 = !DILocation(line: 12, column: 36, scope: !23)
!27 = !DILocation(line: 12, column: 6, scope: !7)
!28 = !DILocation(line: 13, column: 39, scope: !29)
!29 = distinct !DILexicalBlock(scope: !23, file: !1, line: 12, column: 51)
!30 = !DILocation(line: 13, column: 3, scope: !29)
!31 = !DILocation(line: 14, column: 3, scope: !29)
!32 = !DILocation(line: 17, column: 2, scope: !7)
!33 = !DILocation(line: 18, column: 22, scope: !7)
!34 = !DILocation(line: 18, column: 2, scope: !7)
!35 = !DILocation(line: 19, column: 22, scope: !7)
!36 = !DILocation(line: 19, column: 2, scope: !7)
!37 = !DILocation(line: 21, column: 2, scope: !7)
