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
  %in.addr = alloca i8*, align 8
  store i8* %in, i8** %in.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %in.addr, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !22
  %1 = load i8*, i8** %in.addr, align 8, !dbg !23
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8* %1), !dbg !24
  %2 = load i32, i32* @myopenimage.handle, align 4, !dbg !25
  %inc = add nsw i32 %2, 1, !dbg !25
  store i32 %inc, i32* @myopenimage.handle, align 4, !dbg !25
  ret i32 %2, !dbg !26
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !27 {
entry:
  %retval = alloca i32, align 4
  %imglib = alloca i8*, align 8
  %extopenimage = alloca i32 (i8*)*, align 8
  %imghandle = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i8** %imglib, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i32 (i8*)** %extopenimage, metadata !32, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32* %imghandle, metadata !35, metadata !DIExpression()), !dbg !36
  %call = call i8* @dlopen(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0), i32 1) #4, !dbg !37
  store i8* %call, i8** %imglib, align 8, !dbg !38
  %0 = load i8*, i8** %imglib, align 8, !dbg !39
  %cmp = icmp ne i8* %0, null, !dbg !41
  br i1 %cmp, label %if.then, label %if.else, !dbg !42

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %imglib, align 8, !dbg !43
  %call1 = call i8* @dlsym(i8* %1, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0)) #4, !dbg !45
  %2 = bitcast i32 (i8*)** %extopenimage to i8**, !dbg !46
  store i8* %call1, i8** %2, align 8, !dbg !47
  %3 = load i32 (i8*)*, i32 (i8*)** %extopenimage, align 8, !dbg !48
  %call2 = call i32 %3(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0)), !dbg !48
  store i32 %call2, i32* %imghandle, align 4, !dbg !49
  br label %if.end, !dbg !50

if.else:                                          ; preds = %entry
  %call3 = call i32 @myopenimage(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0)), !dbg !51
  store i32 %call3, i32* %imghandle, align 4, !dbg !53
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %imghandle, align 4, !dbg !54
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4, i64 0, i64 0), i32 %4), !dbg !55
  %5 = load i8*, i8** %imglib, align 8, !dbg !56
  %cmp5 = icmp ne i8* %5, null, !dbg !58
  br i1 %cmp5, label %if.then6, label %if.end8, !dbg !59

if.then6:                                         ; preds = %if.end
  %6 = load i8*, i8** %imglib, align 8, !dbg !60
  %call7 = call i32 @dlclose(i8* %6) #4, !dbg !61
  br label %if.end8, !dbg !61

if.end8:                                          ; preds = %if.then6, %if.end
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local i8* @dlopen(i8*, i32) #3

; Function Attrs: nounwind
declare dso_local i8* @dlsym(i8*, i8*) #3

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local i32 @dlclose(i8*) #3

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
!21 = !DILocation(line: 5, column: 29, scope: !2)
!22 = !DILocation(line: 8, column: 11, scope: !2)
!23 = !DILocation(line: 8, column: 55, scope: !2)
!24 = !DILocation(line: 8, column: 3, scope: !2)
!25 = !DILocation(line: 9, column: 16, scope: !2)
!26 = !DILocation(line: 9, column: 3, scope: !2)
!27 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 12, type: !28, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !10, retainedNodes: !11)
!28 = !DISubroutineType(types: !29)
!29 = !{!6}
!30 = !DILocalVariable(name: "imglib", scope: !27, file: !3, line: 14, type: !13)
!31 = !DILocation(line: 14, column: 9, scope: !27)
!32 = !DILocalVariable(name: "extopenimage", scope: !27, file: !3, line: 15, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!34 = !DILocation(line: 15, column: 9, scope: !27)
!35 = !DILocalVariable(name: "imghandle", scope: !27, file: !3, line: 16, type: !6)
!36 = !DILocation(line: 16, column: 7, scope: !27)
!37 = !DILocation(line: 18, column: 12, scope: !27)
!38 = !DILocation(line: 18, column: 10, scope: !27)
!39 = !DILocation(line: 19, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !27, file: !3, line: 19, column: 8)
!41 = !DILocation(line: 19, column: 15, scope: !40)
!42 = !DILocation(line: 19, column: 8, scope: !27)
!43 = !DILocation(line: 24, column: 39, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !3, line: 19, column: 25)
!45 = !DILocation(line: 24, column: 33, scope: !44)
!46 = !DILocation(line: 24, column: 5, scope: !44)
!47 = !DILocation(line: 24, column: 31, scope: !44)
!48 = !DILocation(line: 28, column: 17, scope: !44)
!49 = !DILocation(line: 28, column: 15, scope: !44)
!50 = !DILocation(line: 29, column: 3, scope: !44)
!51 = !DILocation(line: 30, column: 17, scope: !52)
!52 = distinct !DILexicalBlock(scope: !40, file: !3, line: 29, column: 10)
!53 = !DILocation(line: 30, column: 15, scope: !52)
!54 = !DILocation(line: 32, column: 37, scope: !27)
!55 = !DILocation(line: 32, column: 3, scope: !27)
!56 = !DILocation(line: 34, column: 7, scope: !57)
!57 = distinct !DILexicalBlock(scope: !27, file: !3, line: 34, column: 7)
!58 = !DILocation(line: 34, column: 14, scope: !57)
!59 = !DILocation(line: 34, column: 7, scope: !27)
!60 = !DILocation(line: 34, column: 32, scope: !57)
!61 = !DILocation(line: 34, column: 24, scope: !57)
!62 = !DILocation(line: 35, column: 3, scope: !27)
