; ModuleID = 'casting-out-nines.ll'
source_filename = "casting-out-nines.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [52 x i8] c"\0ATring %d numbers instead of %d numbers saves %f%%\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %N = alloca i32, align 4
  %base = alloca i32, align 4
  %c1 = alloca i32, align 4
  %c2 = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %N, metadata !11, metadata !DIExpression()), !dbg !13
  store i32 2, i32* %N, align 4, !dbg !13
  call void @llvm.dbg.declare(metadata i32* %base, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 10, i32* %base, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %c1, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 0, i32* %c1, align 4, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %c2, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 0, i32* %c2, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %k, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 1, i32* %k, align 4, !dbg !22
  br label %for.cond, !dbg !24

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %k, align 4, !dbg !25
  %conv = sitofp i32 %0 to double, !dbg !25
  %1 = load i32, i32* %base, align 4, !dbg !27
  %conv1 = sitofp i32 %1 to double, !dbg !27
  %call = call double @pow(double %conv1, double 2.000000e+00) #4, !dbg !28
  %cmp = fcmp olt double %conv, %call, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %c1, align 4, !dbg !31
  %inc = add nsw i32 %2, 1, !dbg !31
  store i32 %inc, i32* %c1, align 4, !dbg !31
  %3 = load i32, i32* %k, align 4, !dbg !33
  %4 = load i32, i32* %base, align 4, !dbg !35
  %sub = sub nsw i32 %4, 1, !dbg !36
  %rem = srem i32 %3, %sub, !dbg !37
  %5 = load i32, i32* %k, align 4, !dbg !38
  %6 = load i32, i32* %k, align 4, !dbg !39
  %mul = mul nsw i32 %5, %6, !dbg !40
  %7 = load i32, i32* %base, align 4, !dbg !41
  %sub3 = sub nsw i32 %7, 1, !dbg !42
  %rem4 = srem i32 %mul, %sub3, !dbg !43
  %cmp5 = icmp eq i32 %rem, %rem4, !dbg !44
  br i1 %cmp5, label %if.then, label %if.end, !dbg !45

if.then:                                          ; preds = %for.body
  %8 = load i32, i32* %c2, align 4, !dbg !46
  %inc7 = add nsw i32 %8, 1, !dbg !46
  store i32 %inc7, i32* %c2, align 4, !dbg !46
  %9 = load i32, i32* %k, align 4, !dbg !48
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %9), !dbg !49
  br label %if.end, !dbg !50

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %if.end
  %10 = load i32, i32* %k, align 4, !dbg !52
  %inc9 = add nsw i32 %10, 1, !dbg !52
  store i32 %inc9, i32* %k, align 4, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %11 = load i32, i32* %c2, align 4, !dbg !56
  %12 = load i32, i32* %c1, align 4, !dbg !57
  %13 = load i32, i32* %c2, align 4, !dbg !58
  %conv10 = sitofp i32 %13 to double, !dbg !58
  %mul11 = fmul double 1.000000e+02, %conv10, !dbg !59
  %14 = load i32, i32* %c1, align 4, !dbg !60
  %conv12 = sitofp i32 %14 to double, !dbg !60
  %div = fdiv double %mul11, %conv12, !dbg !61
  %sub13 = fsub double 1.000000e+02, %div, !dbg !62
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.1, i64 0, i64 0), i32 %11, i32 %12, double %sub13), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local double @pow(double, double) #2

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "casting-out-nines.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Casting-out-nines")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "N", scope: !7, file: !1, line: 5, type: !12)
!12 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!13 = !DILocation(line: 5, column: 15, scope: !7)
!14 = !DILocalVariable(name: "base", scope: !7, file: !1, line: 6, type: !10)
!15 = !DILocation(line: 6, column: 9, scope: !7)
!16 = !DILocalVariable(name: "c1", scope: !7, file: !1, line: 7, type: !10)
!17 = !DILocation(line: 7, column: 9, scope: !7)
!18 = !DILocalVariable(name: "c2", scope: !7, file: !1, line: 8, type: !10)
!19 = !DILocation(line: 8, column: 9, scope: !7)
!20 = !DILocalVariable(name: "k", scope: !7, file: !1, line: 9, type: !10)
!21 = !DILocation(line: 9, column: 9, scope: !7)
!22 = !DILocation(line: 11, column: 12, scope: !23)
!23 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 5)
!24 = !DILocation(line: 11, column: 10, scope: !23)
!25 = !DILocation(line: 11, column: 17, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !1, line: 11, column: 5)
!27 = !DILocation(line: 11, column: 25, scope: !26)
!28 = !DILocation(line: 11, column: 21, scope: !26)
!29 = !DILocation(line: 11, column: 19, scope: !26)
!30 = !DILocation(line: 11, column: 5, scope: !23)
!31 = !DILocation(line: 12, column: 11, scope: !32)
!32 = distinct !DILexicalBlock(scope: !26, file: !1, line: 11, column: 40)
!33 = !DILocation(line: 13, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !32, file: !1, line: 13, column: 13)
!35 = !DILocation(line: 13, column: 18, scope: !34)
!36 = !DILocation(line: 13, column: 23, scope: !34)
!37 = !DILocation(line: 13, column: 15, scope: !34)
!38 = !DILocation(line: 13, column: 32, scope: !34)
!39 = !DILocation(line: 13, column: 36, scope: !34)
!40 = !DILocation(line: 13, column: 34, scope: !34)
!41 = !DILocation(line: 13, column: 42, scope: !34)
!42 = !DILocation(line: 13, column: 47, scope: !34)
!43 = !DILocation(line: 13, column: 39, scope: !34)
!44 = !DILocation(line: 13, column: 28, scope: !34)
!45 = !DILocation(line: 13, column: 13, scope: !32)
!46 = !DILocation(line: 14, column: 15, scope: !47)
!47 = distinct !DILexicalBlock(scope: !34, file: !1, line: 13, column: 53)
!48 = !DILocation(line: 15, column: 27, scope: !47)
!49 = !DILocation(line: 15, column: 13, scope: !47)
!50 = !DILocation(line: 16, column: 9, scope: !47)
!51 = !DILocation(line: 17, column: 5, scope: !32)
!52 = !DILocation(line: 11, column: 36, scope: !26)
!53 = !DILocation(line: 11, column: 5, scope: !26)
!54 = distinct !{!54, !30, !55}
!55 = !DILocation(line: 17, column: 5, scope: !23)
!56 = !DILocation(line: 19, column: 69, scope: !7)
!57 = !DILocation(line: 19, column: 73, scope: !7)
!58 = !DILocation(line: 19, column: 93, scope: !7)
!59 = !DILocation(line: 19, column: 91, scope: !7)
!60 = !DILocation(line: 19, column: 98, scope: !7)
!61 = !DILocation(line: 19, column: 96, scope: !7)
!62 = !DILocation(line: 19, column: 83, scope: !7)
!63 = !DILocation(line: 19, column: 5, scope: !7)
!64 = !DILocation(line: 20, column: 5, scope: !7)
