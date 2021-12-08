; ModuleID = 'call-a-function-in-a-shared-library-1.ll'
source_filename = "call-a-function-in-a-shared-library-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@myopenimage.handle = internal global i32 0, align 4, !dbg !0
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [32 x i8] c"internal openimage opens %s...\0A\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"./fakeimglib.so\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"openimage\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"fake.img\00", align 1
@.str.4 = private unnamed_addr constant [23 x i8] c"opened with handle %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @myopenimage(i8* %in) #0 !dbg !2 {
entry:
  call void @llvm.dbg.value(metadata i8* %in, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !22
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8* %in), !dbg !23
  %1 = load i32, i32* @myopenimage.handle, align 4, !dbg !24
  %inc = add nsw i32 %1, 1, !dbg !24
  store i32 %inc, i32* @myopenimage.handle, align 4, !dbg !24
  ret i32 %1, !dbg !25
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !26 {
entry:
  %extopenimage = alloca i32 (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i32 (i8*)** %extopenimage, metadata !29, metadata !DIExpression()), !dbg !31
  %call = call i8* @dlopen(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0), i32 1) #4, !dbg !32
  call void @llvm.dbg.value(metadata i8* %call, metadata !33, metadata !DIExpression()), !dbg !34
  %cmp = icmp ne i8* %call, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.else, !dbg !37

if.then:                                          ; preds = %entry
  %call1 = call i8* @dlsym(i8* %call, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0)) #4, !dbg !38
  %0 = bitcast i32 (i8*)** %extopenimage to i8**, !dbg !40
  store i8* %call1, i8** %0, align 8, !dbg !41
  %1 = load i32 (i8*)*, i32 (i8*)** %extopenimage, align 8, !dbg !42
  %call2 = call i32 %1(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0)), !dbg !42
  call void @llvm.dbg.value(metadata i32 %call2, metadata !43, metadata !DIExpression()), !dbg !34
  br label %if.end, !dbg !44

if.else:                                          ; preds = %entry
  %call3 = call i32 @myopenimage(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0)), !dbg !45
  call void @llvm.dbg.value(metadata i32 %call3, metadata !43, metadata !DIExpression()), !dbg !34
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %imghandle.0 = phi i32 [ %call2, %if.then ], [ %call3, %if.else ], !dbg !47
  call void @llvm.dbg.value(metadata i32 %imghandle.0, metadata !43, metadata !DIExpression()), !dbg !34
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4, i64 0, i64 0), i32 %imghandle.0), !dbg !48
  %cmp5 = icmp ne i8* %call, null, !dbg !49
  br i1 %cmp5, label %if.then6, label %if.end8, !dbg !51

if.then6:                                         ; preds = %if.end
  %call7 = call i32 @dlclose(i8* %call) #4, !dbg !52
  br label %if.end8, !dbg !52

if.end8:                                          ; preds = %if.then6, %if.end
  ret i32 0, !dbg !53
}

; Function Attrs: nounwind
declare dso_local i8* @dlopen(i8*, i32) #3

; Function Attrs: nounwind
declare dso_local i8* @dlsym(i8*, i8*) #3

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local i32 @dlclose(i8*) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!10}
!llvm.module.flags = !{!16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "handle", scope: !2, file: !3, line: 7, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "myopenimage", scope: !3, file: !3, line: 5, type: !4, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !10, retainedNodes: !11)
!3 = !DIFile(filename: "call-a-function-in-a-shared-library-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Call-a-function-in-a-shared-library")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !11, retainedTypes: !12, globals: !15, splitDebugInlining: false, nameTableKind: None)
!11 = !{}
!12 = !{!13, !14}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!15 = !{!0}
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!20 = !DILocalVariable(name: "in", arg: 1, scope: !2, file: !3, line: 5, type: !7)
!21 = !DILocation(line: 0, scope: !2)
!22 = !DILocation(line: 8, column: 11, scope: !2)
!23 = !DILocation(line: 8, column: 3, scope: !2)
!24 = !DILocation(line: 9, column: 16, scope: !2)
!25 = !DILocation(line: 9, column: 3, scope: !2)
!26 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 12, type: !27, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !10, retainedNodes: !11)
!27 = !DISubroutineType(types: !28)
!28 = !{!6}
!29 = !DILocalVariable(name: "extopenimage", scope: !26, file: !3, line: 15, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!31 = !DILocation(line: 15, column: 9, scope: !26)
!32 = !DILocation(line: 18, column: 12, scope: !26)
!33 = !DILocalVariable(name: "imglib", scope: !26, file: !3, line: 14, type: !13)
!34 = !DILocation(line: 0, scope: !26)
!35 = !DILocation(line: 19, column: 15, scope: !36)
!36 = distinct !DILexicalBlock(scope: !26, file: !3, line: 19, column: 8)
!37 = !DILocation(line: 19, column: 8, scope: !26)
!38 = !DILocation(line: 24, column: 33, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !3, line: 19, column: 25)
!40 = !DILocation(line: 24, column: 5, scope: !39)
!41 = !DILocation(line: 24, column: 31, scope: !39)
!42 = !DILocation(line: 28, column: 17, scope: !39)
!43 = !DILocalVariable(name: "imghandle", scope: !26, file: !3, line: 16, type: !6)
!44 = !DILocation(line: 29, column: 3, scope: !39)
!45 = !DILocation(line: 30, column: 17, scope: !46)
!46 = distinct !DILexicalBlock(scope: !36, file: !3, line: 29, column: 10)
!47 = !DILocation(line: 0, scope: !36)
!48 = !DILocation(line: 32, column: 3, scope: !26)
!49 = !DILocation(line: 34, column: 14, scope: !50)
!50 = distinct !DILexicalBlock(scope: !26, file: !3, line: 34, column: 7)
!51 = !DILocation(line: 34, column: 7, scope: !26)
!52 = !DILocation(line: 34, column: 24, scope: !50)
!53 = !DILocation(line: 35, column: 3, scope: !26)
