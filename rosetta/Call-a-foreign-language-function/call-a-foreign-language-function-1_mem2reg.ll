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
  call void @llvm.dbg.value(metadata i32 %argc, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i8** %argv, metadata !16, metadata !DIExpression()), !dbg !15
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !17
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !17
  %call = call i32 @atoi(i8* %0) #4, !dbg !18
  call void @llvm.dbg.value(metadata i32 %call, metadata !19, metadata !DIExpression()), !dbg !15
  %arrayidx1 = getelementptr inbounds i8*, i8** %argv, i64 2, !dbg !20
  %1 = load i8*, i8** %arrayidx1, align 8, !dbg !20
  %call2 = call i32 @atoi(i8* %1) #4, !dbg !21
  call void @llvm.dbg.value(metadata i32 %call2, metadata !22, metadata !DIExpression()), !dbg !15
  %2 = call i32 asm "addl %ebx, %eax;", "={ax},{ax},{bx},~{dirflag},~{fpsr},~{flags}"(i32 %call, i32 %call2) #5, !dbg !23, !srcloc !24
  call void @llvm.dbg.value(metadata i32 %2, metadata !25, metadata !DIExpression()), !dbg !15
  %3 = call i32 asm "subl %ebx, %eax;", "={ax},{ax},{bx},~{dirflag},~{fpsr},~{flags}"(i32 %call, i32 %call2) #5, !dbg !26, !srcloc !27
  call void @llvm.dbg.value(metadata i32 %3, metadata !28, metadata !DIExpression()), !dbg !15
  %4 = call i32 asm "imull %ebx, %eax;", "={ax},{ax},{bx},~{dirflag},~{fpsr},~{flags}"(i32 %call, i32 %call2) #5, !dbg !29, !srcloc !30
  call void @llvm.dbg.value(metadata i32 %4, metadata !31, metadata !DIExpression()), !dbg !15
  %5 = call { i32, i32 } asm "movl $$0x0, %edx;movl $2, %eax;movl $3, %ebx;idivl %ebx;", "={ax},={dx},imr,imr,~{dirflag},~{fpsr},~{flags}"(i32 %call, i32 %call2) #4, !dbg !32, !srcloc !33
  %asmresult = extractvalue { i32, i32 } %5, 0, !dbg !32
  %asmresult3 = extractvalue { i32, i32 } %5, 1, !dbg !32
  call void @llvm.dbg.value(metadata i32 %asmresult, metadata !34, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 %asmresult3, metadata !35, metadata !DIExpression()), !dbg !15
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i32 %call, i32 %call2, i32 %2), !dbg !36
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 %call, i32 %call2, i32 %3), !dbg !37
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0), i32 %call, i32 %call2, i32 %4), !dbg !38
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i32 %call, i32 %call2, i32 %asmresult), !dbg !39
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i32 %call, i32 %call2, i32 %asmresult3), !dbg !40
  ret i32 0, !dbg !41
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!15 = !DILocation(line: 0, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 4, type: !11)
!17 = !DILocation(line: 6, column: 21, scope: !7)
!18 = !DILocation(line: 6, column: 16, scope: !7)
!19 = !DILocalVariable(name: "arg1", scope: !7, file: !1, line: 6, type: !10)
!20 = !DILocation(line: 6, column: 43, scope: !7)
!21 = !DILocation(line: 6, column: 38, scope: !7)
!22 = !DILocalVariable(name: "arg2", scope: !7, file: !1, line: 6, type: !10)
!23 = !DILocation(line: 8, column: 5, scope: !7)
!24 = !{i32 185}
!25 = !DILocalVariable(name: "sum", scope: !7, file: !1, line: 6, type: !10)
!26 = !DILocation(line: 9, column: 5, scope: !7)
!27 = !{i32 262}
!28 = !DILocalVariable(name: "diff", scope: !7, file: !1, line: 6, type: !10)
!29 = !DILocation(line: 10, column: 5, scope: !7)
!30 = !{i32 340}
!31 = !DILocalVariable(name: "product", scope: !7, file: !1, line: 6, type: !10)
!32 = !DILocation(line: 12, column: 5, scope: !7)
!33 = !{i32 423}
!34 = !DILocalVariable(name: "quotient", scope: !7, file: !1, line: 6, type: !10)
!35 = !DILocalVariable(name: "remainder", scope: !7, file: !1, line: 6, type: !10)
!36 = !DILocation(line: 17, column: 5, scope: !7)
!37 = !DILocation(line: 18, column: 5, scope: !7)
!38 = !DILocation(line: 19, column: 5, scope: !7)
!39 = !DILocation(line: 20, column: 5, scope: !7)
!40 = !DILocation(line: 21, column: 5, scope: !7)
!41 = !DILocation(line: 23, column: 5, scope: !7)
