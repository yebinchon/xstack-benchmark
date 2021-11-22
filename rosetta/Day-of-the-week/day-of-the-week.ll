; ModuleID = 'day-of-the-week.c'
source_filename = "day-of-the-week.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"%04d-12-25\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @wday(i32 %year, i32 %month, i32 %day) #0 !dbg !7 {
entry:
  %year.addr = alloca i32, align 4
  %month.addr = alloca i32, align 4
  %day.addr = alloca i32, align 4
  %adjustment = alloca i32, align 4
  %mm = alloca i32, align 4
  %yy = alloca i32, align 4
  store i32 %year, i32* %year.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %year.addr, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %month, i32* %month.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %month.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %day, i32* %day.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %day.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %adjustment, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %mm, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %yy, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = load i32, i32* %month.addr, align 4, !dbg !23
  %sub = sub nsw i32 14, %0, !dbg !24
  %div = sdiv i32 %sub, 12, !dbg !25
  store i32 %div, i32* %adjustment, align 4, !dbg !26
  %1 = load i32, i32* %month.addr, align 4, !dbg !27
  %2 = load i32, i32* %adjustment, align 4, !dbg !28
  %mul = mul nsw i32 12, %2, !dbg !29
  %add = add nsw i32 %1, %mul, !dbg !30
  %sub1 = sub nsw i32 %add, 2, !dbg !31
  store i32 %sub1, i32* %mm, align 4, !dbg !32
  %3 = load i32, i32* %year.addr, align 4, !dbg !33
  %4 = load i32, i32* %adjustment, align 4, !dbg !34
  %sub2 = sub nsw i32 %3, %4, !dbg !35
  store i32 %sub2, i32* %yy, align 4, !dbg !36
  %5 = load i32, i32* %day.addr, align 4, !dbg !37
  %6 = load i32, i32* %mm, align 4, !dbg !38
  %mul3 = mul nsw i32 13, %6, !dbg !39
  %sub4 = sub nsw i32 %mul3, 1, !dbg !40
  %div5 = sdiv i32 %sub4, 5, !dbg !41
  %add6 = add nsw i32 %5, %div5, !dbg !42
  %7 = load i32, i32* %yy, align 4, !dbg !43
  %add7 = add nsw i32 %add6, %7, !dbg !44
  %8 = load i32, i32* %yy, align 4, !dbg !45
  %div8 = sdiv i32 %8, 4, !dbg !46
  %add9 = add nsw i32 %add7, %div8, !dbg !47
  %9 = load i32, i32* %yy, align 4, !dbg !48
  %div10 = sdiv i32 %9, 100, !dbg !49
  %sub11 = sub nsw i32 %add9, %div10, !dbg !50
  %10 = load i32, i32* %yy, align 4, !dbg !51
  %div12 = sdiv i32 %10, 400, !dbg !52
  %add13 = add nsw i32 %sub11, %div12, !dbg !53
  %rem = srem i32 %add13, 7, !dbg !54
  ret i32 %rem, !dbg !55
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %y, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 2008, i32* %y, align 4, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %y, align 4, !dbg !64
  %cmp = icmp sle i32 %0, 2121, !dbg !66
  br i1 %cmp, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %y, align 4, !dbg !68
  %call = call i32 @wday(i32 %1, i32 12, i32 25), !dbg !71
  %cmp1 = icmp eq i32 %call, 0, !dbg !72
  br i1 %cmp1, label %if.then, label %if.end, !dbg !73, !cf.info !74

if.then:                                          ; preds = %for.body
  %2 = load i32, i32* %y, align 4, !dbg !75
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i32 %2), !dbg !76
  br label %if.end, !dbg !76

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %y, align 4, !dbg !78
  %inc = add nsw i32 %3, 1, !dbg !78
  store i32 %inc, i32* %y, align 4, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !82
}

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "day-of-the-week.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Day-of-the-week")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "wday", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "year", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!12 = !DILocation(line: 4, column: 14, scope: !7)
!13 = !DILocalVariable(name: "month", arg: 2, scope: !7, file: !1, line: 4, type: !10)
!14 = !DILocation(line: 4, column: 24, scope: !7)
!15 = !DILocalVariable(name: "day", arg: 3, scope: !7, file: !1, line: 4, type: !10)
!16 = !DILocation(line: 4, column: 35, scope: !7)
!17 = !DILocalVariable(name: "adjustment", scope: !7, file: !1, line: 6, type: !10)
!18 = !DILocation(line: 6, column: 6, scope: !7)
!19 = !DILocalVariable(name: "mm", scope: !7, file: !1, line: 6, type: !10)
!20 = !DILocation(line: 6, column: 18, scope: !7)
!21 = !DILocalVariable(name: "yy", scope: !7, file: !1, line: 6, type: !10)
!22 = !DILocation(line: 6, column: 22, scope: !7)
!23 = !DILocation(line: 8, column: 21, scope: !7)
!24 = !DILocation(line: 8, column: 19, scope: !7)
!25 = !DILocation(line: 8, column: 28, scope: !7)
!26 = !DILocation(line: 8, column: 13, scope: !7)
!27 = !DILocation(line: 9, column: 7, scope: !7)
!28 = !DILocation(line: 9, column: 20, scope: !7)
!29 = !DILocation(line: 9, column: 18, scope: !7)
!30 = !DILocation(line: 9, column: 13, scope: !7)
!31 = !DILocation(line: 9, column: 31, scope: !7)
!32 = !DILocation(line: 9, column: 5, scope: !7)
!33 = !DILocation(line: 10, column: 7, scope: !7)
!34 = !DILocation(line: 10, column: 14, scope: !7)
!35 = !DILocation(line: 10, column: 12, scope: !7)
!36 = !DILocation(line: 10, column: 5, scope: !7)
!37 = !DILocation(line: 11, column: 10, scope: !7)
!38 = !DILocation(line: 11, column: 22, scope: !7)
!39 = !DILocation(line: 11, column: 20, scope: !7)
!40 = !DILocation(line: 11, column: 25, scope: !7)
!41 = !DILocation(line: 11, column: 30, scope: !7)
!42 = !DILocation(line: 11, column: 14, scope: !7)
!43 = !DILocation(line: 12, column: 3, scope: !7)
!44 = !DILocation(line: 11, column: 34, scope: !7)
!45 = !DILocation(line: 12, column: 8, scope: !7)
!46 = !DILocation(line: 12, column: 11, scope: !7)
!47 = !DILocation(line: 12, column: 6, scope: !7)
!48 = !DILocation(line: 12, column: 17, scope: !7)
!49 = !DILocation(line: 12, column: 20, scope: !7)
!50 = !DILocation(line: 12, column: 15, scope: !7)
!51 = !DILocation(line: 12, column: 28, scope: !7)
!52 = !DILocation(line: 12, column: 31, scope: !7)
!53 = !DILocation(line: 12, column: 26, scope: !7)
!54 = !DILocation(line: 12, column: 38, scope: !7)
!55 = !DILocation(line: 11, column: 2, scope: !7)
!56 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 15, type: !57, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!10}
!59 = !DILocalVariable(name: "y", scope: !56, file: !1, line: 17, type: !10)
!60 = !DILocation(line: 17, column: 6, scope: !56)
!61 = !DILocation(line: 19, column: 9, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !1, line: 19, column: 2)
!63 = !DILocation(line: 19, column: 7, scope: !62)
!64 = !DILocation(line: 19, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !1, line: 19, column: 2)
!66 = !DILocation(line: 19, column: 19, scope: !65)
!67 = !DILocation(line: 19, column: 2, scope: !62)
!68 = !DILocation(line: 20, column: 12, scope: !69)
!69 = distinct !DILexicalBlock(scope: !70, file: !1, line: 20, column: 7)
!70 = distinct !DILexicalBlock(scope: !65, file: !1, line: 19, column: 33)
!71 = !DILocation(line: 20, column: 7, scope: !69)
!72 = !DILocation(line: 20, column: 23, scope: !69)
!73 = !DILocation(line: 20, column: 7, scope: !70)
!74 = !{!"if"}
!75 = !DILocation(line: 20, column: 52, scope: !69)
!76 = !DILocation(line: 20, column: 29, scope: !69)
!77 = !DILocation(line: 21, column: 2, scope: !70)
!78 = !DILocation(line: 19, column: 29, scope: !65)
!79 = !DILocation(line: 19, column: 2, scope: !65)
!80 = distinct !{!80, !67, !81}
!81 = !DILocation(line: 21, column: 2, scope: !62)
!82 = !DILocation(line: 23, column: 2, scope: !56)
