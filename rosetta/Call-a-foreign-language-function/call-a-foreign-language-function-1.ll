; ModuleID = 'call-a-foreign-language-function-1.ll'
source_filename = "call-a-foreign-language-function-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"%d + %d = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"%d - %d = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"%d * %d = %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"%d / %d = %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"%d %% %d = %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %arg1 = alloca i32, align 4
  %arg2 = alloca i32, align 4
  %sum = alloca i32, align 4
  %diff = alloca i32, align 4
  %product = alloca i32, align 4
  %quotient = alloca i32, align 4
  %remainder = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %arg1, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !20
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !dbg !20
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !20
  %call = call i32 @atoi(i8* %1) #4, !dbg !21
  store i32 %call, i32* %arg1, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %arg2, metadata !22, metadata !DIExpression()), !dbg !23
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !24
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 2, !dbg !24
  %3 = load i8*, i8** %arrayidx1, align 8, !dbg !24
  %call2 = call i32 @atoi(i8* %3) #4, !dbg !25
  store i32 %call2, i32* %arg2, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %diff, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i32* %product, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i32* %quotient, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i32* %remainder, metadata !34, metadata !DIExpression()), !dbg !35
  %4 = load i32, i32* %arg1, align 4, !dbg !36
  %5 = load i32, i32* %arg2, align 4, !dbg !37
  %6 = call i32 asm "addl %ebx, %eax;", "={ax},{ax},{bx},~{dirflag},~{fpsr},~{flags}"(i32 %4, i32 %5) #5, !dbg !38, !srcloc !39
  store i32 %6, i32* %sum, align 4, !dbg !38
  %7 = load i32, i32* %arg1, align 4, !dbg !40
  %8 = load i32, i32* %arg2, align 4, !dbg !41
  %9 = call i32 asm "subl %ebx, %eax;", "={ax},{ax},{bx},~{dirflag},~{fpsr},~{flags}"(i32 %7, i32 %8) #5, !dbg !42, !srcloc !43
  store i32 %9, i32* %diff, align 4, !dbg !42
  %10 = load i32, i32* %arg1, align 4, !dbg !44
  %11 = load i32, i32* %arg2, align 4, !dbg !45
  %12 = call i32 asm "imull %ebx, %eax;", "={ax},{ax},{bx},~{dirflag},~{fpsr},~{flags}"(i32 %10, i32 %11) #5, !dbg !46, !srcloc !47
  store i32 %12, i32* %product, align 4, !dbg !46
  %13 = load i32, i32* %arg1, align 4, !dbg !48
  %14 = load i32, i32* %arg2, align 4, !dbg !49
  %15 = call { i32, i32 } asm "movl $$0x0, %edx;movl $2, %eax;movl $3, %ebx;idivl %ebx;", "={ax},={dx},imr,imr,~{dirflag},~{fpsr},~{flags}"(i32 %13, i32 %14) #4, !dbg !50, !srcloc !51
  %asmresult = extractvalue { i32, i32 } %15, 0, !dbg !50
  %asmresult3 = extractvalue { i32, i32 } %15, 1, !dbg !50
  store i32 %asmresult, i32* %quotient, align 4, !dbg !50
  store i32 %asmresult3, i32* %remainder, align 4, !dbg !50
  %16 = load i32, i32* %arg1, align 4, !dbg !52
  %17 = load i32, i32* %arg2, align 4, !dbg !53
  %18 = load i32, i32* %sum, align 4, !dbg !54
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i32 %16, i32 %17, i32 %18), !dbg !55
  %19 = load i32, i32* %arg1, align 4, !dbg !56
  %20 = load i32, i32* %arg2, align 4, !dbg !57
  %21 = load i32, i32* %diff, align 4, !dbg !58
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 %19, i32 %20, i32 %21), !dbg !59
  %22 = load i32, i32* %arg1, align 4, !dbg !60
  %23 = load i32, i32* %arg2, align 4, !dbg !61
  %24 = load i32, i32* %product, align 4, !dbg !62
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0), i32 %22, i32 %23, i32 %24), !dbg !63
  %25 = load i32, i32* %arg1, align 4, !dbg !64
  %26 = load i32, i32* %arg2, align 4, !dbg !65
  %27 = load i32, i32* %quotient, align 4, !dbg !66
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i32 %25, i32 %26, i32 %27), !dbg !67
  %28 = load i32, i32* %arg1, align 4, !dbg !68
  %29 = load i32, i32* %arg2, align 4, !dbg !69
  %30 = load i32, i32* %remainder, align 4, !dbg !70
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i32 %28, i32 %29, i32 %30), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #2

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "call-a-foreign-language-function-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Call-a-foreign-language-function")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "argc", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!15 = !DILocation(line: 4, column: 14, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 4, type: !11)
!17 = !DILocation(line: 4, column: 26, scope: !7)
!18 = !DILocalVariable(name: "arg1", scope: !7, file: !1, line: 6, type: !10)
!19 = !DILocation(line: 6, column: 9, scope: !7)
!20 = !DILocation(line: 6, column: 21, scope: !7)
!21 = !DILocation(line: 6, column: 16, scope: !7)
!22 = !DILocalVariable(name: "arg2", scope: !7, file: !1, line: 6, type: !10)
!23 = !DILocation(line: 6, column: 31, scope: !7)
!24 = !DILocation(line: 6, column: 43, scope: !7)
!25 = !DILocation(line: 6, column: 38, scope: !7)
!26 = !DILocalVariable(name: "sum", scope: !7, file: !1, line: 6, type: !10)
!27 = !DILocation(line: 6, column: 53, scope: !7)
!28 = !DILocalVariable(name: "diff", scope: !7, file: !1, line: 6, type: !10)
!29 = !DILocation(line: 6, column: 58, scope: !7)
!30 = !DILocalVariable(name: "product", scope: !7, file: !1, line: 6, type: !10)
!31 = !DILocation(line: 6, column: 64, scope: !7)
!32 = !DILocalVariable(name: "quotient", scope: !7, file: !1, line: 6, type: !10)
!33 = !DILocation(line: 6, column: 73, scope: !7)
!34 = !DILocalVariable(name: "remainder", scope: !7, file: !1, line: 6, type: !10)
!35 = !DILocation(line: 6, column: 83, scope: !7)
!36 = !DILocation(line: 8, column: 56, scope: !7)
!37 = !DILocation(line: 8, column: 69, scope: !7)
!38 = !DILocation(line: 8, column: 5, scope: !7)
!39 = !{i32 185}
!40 = !DILocation(line: 9, column: 57, scope: !7)
!41 = !DILocation(line: 9, column: 70, scope: !7)
!42 = !DILocation(line: 9, column: 5, scope: !7)
!43 = !{i32 262}
!44 = !DILocation(line: 10, column: 61, scope: !7)
!45 = !DILocation(line: 10, column: 74, scope: !7)
!46 = !DILocation(line: 10, column: 5, scope: !7)
!47 = !{i32 340}
!48 = !DILocation(line: 15, column: 74, scope: !7)
!49 = !DILocation(line: 15, column: 86, scope: !7)
!50 = !DILocation(line: 12, column: 5, scope: !7)
!51 = !{i32 423}
!52 = !DILocation(line: 17, column: 31, scope: !7)
!53 = !DILocation(line: 17, column: 37, scope: !7)
!54 = !DILocation(line: 17, column: 43, scope: !7)
!55 = !DILocation(line: 17, column: 5, scope: !7)
!56 = !DILocation(line: 18, column: 31, scope: !7)
!57 = !DILocation(line: 18, column: 37, scope: !7)
!58 = !DILocation(line: 18, column: 43, scope: !7)
!59 = !DILocation(line: 18, column: 5, scope: !7)
!60 = !DILocation(line: 19, column: 31, scope: !7)
!61 = !DILocation(line: 19, column: 37, scope: !7)
!62 = !DILocation(line: 19, column: 43, scope: !7)
!63 = !DILocation(line: 19, column: 5, scope: !7)
!64 = !DILocation(line: 20, column: 31, scope: !7)
!65 = !DILocation(line: 20, column: 37, scope: !7)
!66 = !DILocation(line: 20, column: 43, scope: !7)
!67 = !DILocation(line: 20, column: 5, scope: !7)
!68 = !DILocation(line: 21, column: 32, scope: !7)
!69 = !DILocation(line: 21, column: 38, scope: !7)
!70 = !DILocation(line: 21, column: 44, scope: !7)
!71 = !DILocation(line: 21, column: 5, scope: !7)
!72 = !DILocation(line: 23, column: 5, scope: !7)
