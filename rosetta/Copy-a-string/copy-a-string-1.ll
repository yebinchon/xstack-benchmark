; ModuleID = 'copy-a-string-1.ll'
source_filename = "copy-a-string-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@__const.main.src = private unnamed_addr constant [6 x i8] c"Hello\00", align 1
@.str = private unnamed_addr constant [26 x i8] c"The buffer is too small!\0A\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [7 x i8] c"strdup\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c" src: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"dst1: %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"dst2: %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"dst3: %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c" ref: %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %len = alloca i64, align 8
  %src = alloca [6 x i8], align 1
  %dst1 = alloca [80 x i8], align 16
  %dst2 = alloca [80 x i8], align 16
  %dst3 = alloca i8*, align 8
  %ref = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i64* %len, metadata !13, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata [6 x i8]* %src, metadata !18, metadata !DIExpression()), !dbg !23
  %0 = bitcast [6 x i8]* %src to i8*, !dbg !23
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([6 x i8], [6 x i8]* @__const.main.src, i32 0, i32 0), i64 6, i1 false), !dbg !23
  call void @llvm.dbg.declare(metadata [80 x i8]* %dst1, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [80 x i8]* %dst2, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i8** %dst3, metadata !31, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i8** %ref, metadata !34, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [80 x i8], [80 x i8]* %dst1, i64 0, i64 0, !dbg !36
  %arraydecay1 = getelementptr inbounds [6 x i8], [6 x i8]* %src, i64 0, i64 0, !dbg !37
  %call = call i8* @strcpy(i8* %arraydecay, i8* %arraydecay1) #7, !dbg !38
  %arraydecay2 = getelementptr inbounds [6 x i8], [6 x i8]* %src, i64 0, i64 0, !dbg !39
  %call3 = call i64 @strlen(i8* %arraydecay2) #8, !dbg !40
  store i64 %call3, i64* %len, align 8, !dbg !41
  %1 = load i64, i64* %len, align 8, !dbg !42
  %cmp = icmp uge i64 %1, 80, !dbg !44
  br i1 %cmp, label %if.then, label %if.end, !dbg !45

if.then:                                          ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !46
  %call4 = call i32 @fputs(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i64 0, i64 0), %struct._IO_FILE* %2), !dbg !48
  call void @exit(i32 1) #9, !dbg !49
  unreachable, !dbg !49

if.end:                                           ; preds = %entry
  %arraydecay5 = getelementptr inbounds [80 x i8], [80 x i8]* %dst2, i64 0, i64 0, !dbg !50
  %arraydecay6 = getelementptr inbounds [6 x i8], [6 x i8]* %src, i64 0, i64 0, !dbg !50
  %3 = load i64, i64* %len, align 8, !dbg !51
  %add = add i64 %3, 1, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %arraydecay6, i64 %add, i1 false), !dbg !50
  %arraydecay7 = getelementptr inbounds [6 x i8], [6 x i8]* %src, i64 0, i64 0, !dbg !53
  %call8 = call noalias i8* @strdup(i8* %arraydecay7) #7, !dbg !54
  store i8* %call8, i8** %dst3, align 8, !dbg !55
  %4 = load i8*, i8** %dst3, align 8, !dbg !56
  %cmp9 = icmp eq i8* %4, null, !dbg !58
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !59

if.then10:                                        ; preds = %if.end
  call void @perror(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @exit(i32 1) #9, !dbg !62
  unreachable, !dbg !62

if.end11:                                         ; preds = %if.end
  %arraydecay12 = getelementptr inbounds [6 x i8], [6 x i8]* %src, i64 0, i64 0, !dbg !63
  store i8* %arraydecay12, i8** %ref, align 8, !dbg !64
  %arraydecay13 = getelementptr inbounds [6 x i8], [6 x i8]* %src, i64 0, i64 0, !dbg !65
  call void @llvm.memset.p0i8.i64(i8* align 1 %arraydecay13, i8 45, i64 5, i1 false), !dbg !65
  %arraydecay14 = getelementptr inbounds [6 x i8], [6 x i8]* %src, i64 0, i64 0, !dbg !66
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0), i8* %arraydecay14), !dbg !67
  %arraydecay16 = getelementptr inbounds [80 x i8], [80 x i8]* %dst1, i64 0, i64 0, !dbg !68
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i8* %arraydecay16), !dbg !69
  %arraydecay18 = getelementptr inbounds [80 x i8], [80 x i8]* %dst2, i64 0, i64 0, !dbg !70
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), i8* %arraydecay18), !dbg !71
  %5 = load i8*, i8** %dst3, align 8, !dbg !72
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i64 0, i64 0), i8* %5), !dbg !73
  %6 = load i8*, i8** %ref, align 8, !dbg !74
  %call21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6, i64 0, i64 0), i8* %6), !dbg !75
  %7 = load i8*, i8** %dst3, align 8, !dbg !76
  call void @free(i8* %7) #7, !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #4

declare dso_local i32 @fputs(i8*, %struct._IO_FILE*) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: nounwind
declare dso_local noalias i8* @strdup(i8*) #3

declare dso_local void @perror(i8*) #5

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "copy-a-string-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Copy-a-string")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !10, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "len", scope: !9, file: !1, line: 8, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !15, line: 46, baseType: !16)
!15 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!16 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!17 = !DILocation(line: 8, column: 9, scope: !9)
!18 = !DILocalVariable(name: "src", scope: !9, file: !1, line: 9, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 48, elements: !21)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !{!22}
!22 = !DISubrange(count: 6)
!23 = !DILocation(line: 9, column: 7, scope: !9)
!24 = !DILocalVariable(name: "dst1", scope: !9, file: !1, line: 10, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 640, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 80)
!28 = !DILocation(line: 10, column: 7, scope: !9)
!29 = !DILocalVariable(name: "dst2", scope: !9, file: !1, line: 10, type: !25)
!30 = !DILocation(line: 10, column: 17, scope: !9)
!31 = !DILocalVariable(name: "dst3", scope: !9, file: !1, line: 11, type: !32)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!33 = !DILocation(line: 11, column: 8, scope: !9)
!34 = !DILocalVariable(name: "ref", scope: !9, file: !1, line: 11, type: !32)
!35 = !DILocation(line: 11, column: 15, scope: !9)
!36 = !DILocation(line: 21, column: 9, scope: !9)
!37 = !DILocation(line: 21, column: 15, scope: !9)
!38 = !DILocation(line: 21, column: 2, scope: !9)
!39 = !DILocation(line: 27, column: 15, scope: !9)
!40 = !DILocation(line: 27, column: 8, scope: !9)
!41 = !DILocation(line: 27, column: 6, scope: !9)
!42 = !DILocation(line: 28, column: 6, scope: !43)
!43 = distinct !DILexicalBlock(scope: !9, file: !1, line: 28, column: 6)
!44 = !DILocation(line: 28, column: 10, scope: !43)
!45 = !DILocation(line: 28, column: 6, scope: !9)
!46 = !DILocation(line: 29, column: 39, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !1, line: 28, column: 26)
!48 = !DILocation(line: 29, column: 3, scope: !47)
!49 = !DILocation(line: 30, column: 3, scope: !47)
!50 = !DILocation(line: 32, column: 2, scope: !9)
!51 = !DILocation(line: 32, column: 20, scope: !9)
!52 = !DILocation(line: 32, column: 24, scope: !9)
!53 = !DILocation(line: 37, column: 16, scope: !9)
!54 = !DILocation(line: 37, column: 9, scope: !9)
!55 = !DILocation(line: 37, column: 7, scope: !9)
!56 = !DILocation(line: 38, column: 6, scope: !57)
!57 = distinct !DILexicalBlock(scope: !9, file: !1, line: 38, column: 6)
!58 = !DILocation(line: 38, column: 11, scope: !57)
!59 = !DILocation(line: 38, column: 6, scope: !9)
!60 = !DILocation(line: 40, column: 3, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !1, line: 38, column: 20)
!62 = !DILocation(line: 41, column: 3, scope: !61)
!63 = !DILocation(line: 45, column: 8, scope: !9)
!64 = !DILocation(line: 45, column: 6, scope: !9)
!65 = !DILocation(line: 48, column: 2, scope: !9)
!66 = !DILocation(line: 50, column: 23, scope: !9)
!67 = !DILocation(line: 50, column: 2, scope: !9)
!68 = !DILocation(line: 51, column: 23, scope: !9)
!69 = !DILocation(line: 51, column: 2, scope: !9)
!70 = !DILocation(line: 52, column: 23, scope: !9)
!71 = !DILocation(line: 52, column: 2, scope: !9)
!72 = !DILocation(line: 53, column: 23, scope: !9)
!73 = !DILocation(line: 53, column: 2, scope: !9)
!74 = !DILocation(line: 54, column: 23, scope: !9)
!75 = !DILocation(line: 54, column: 2, scope: !9)
!76 = !DILocation(line: 57, column: 7, scope: !9)
!77 = !DILocation(line: 57, column: 2, scope: !9)
!78 = !DILocation(line: 59, column: 2, scope: !9)
