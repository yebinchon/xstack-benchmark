; ModuleID = 'ackermann-function-1.c'
source_filename = "ackermann-function-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"A(%d, %d) = %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ackermann(i32 %m, i32 %n) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %m.addr, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !13, metadata !DIExpression()), !dbg !14
  %0 = load i32, i32* %m.addr, align 4, !dbg !15
  %tobool = icmp ne i32 %0, 0, !dbg !15
  br i1 %tobool, label %if.end, label %if.then, !dbg !17, !cf.info !18

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !19
  %add = add nsw i32 %1, 1, !dbg !20
  store i32 %add, i32* %retval, align 4, !dbg !21
  br label %return, !dbg !21

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %n.addr, align 4, !dbg !22
  %tobool1 = icmp ne i32 %2, 0, !dbg !22
  br i1 %tobool1, label %if.end3, label %if.then2, !dbg !24, !cf.info !18

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %m.addr, align 4, !dbg !25
  %sub = sub nsw i32 %3, 1, !dbg !26
  %call = call i32 @ackermann(i32 %sub, i32 1), !dbg !27
  store i32 %call, i32* %retval, align 4, !dbg !28
  br label %return, !dbg !28

if.end3:                                          ; preds = %if.end
  %4 = load i32, i32* %m.addr, align 4, !dbg !29
  %sub4 = sub nsw i32 %4, 1, !dbg !30
  %5 = load i32, i32* %m.addr, align 4, !dbg !31
  %6 = load i32, i32* %n.addr, align 4, !dbg !32
  %sub5 = sub nsw i32 %6, 1, !dbg !33
  %call6 = call i32 @ackermann(i32 %5, i32 %sub5), !dbg !34
  %call7 = call i32 @ackermann(i32 %sub4, i32 %call6), !dbg !35
  store i32 %call7, i32* %retval, align 4, !dbg !36
  br label %return, !dbg !36

return:                                           ; preds = %if.end3, %if.then2, %if.then
  %7 = load i32, i32* %retval, align 4, !dbg !37
  ret i32 %7, !dbg !37
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !38 {
entry:
  %retval = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %m, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i32* %n, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 0, i32* %m, align 4, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i32, i32* %m, align 4, !dbg !48
  %cmp = icmp sle i32 %0, 4, !dbg !50
  br i1 %cmp, label %for.body, label %for.end7, !dbg !51

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %n, align 4, !dbg !52
  br label %for.cond1, !dbg !54

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %n, align 4, !dbg !55
  %2 = load i32, i32* %m, align 4, !dbg !57
  %sub = sub nsw i32 6, %2, !dbg !58
  %cmp2 = icmp slt i32 %1, %sub, !dbg !59
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !60

for.body3:                                        ; preds = %for.cond1
  %3 = load i32, i32* %m, align 4, !dbg !61
  %4 = load i32, i32* %n, align 4, !dbg !62
  %5 = load i32, i32* %m, align 4, !dbg !63
  %6 = load i32, i32* %n, align 4, !dbg !64
  %call = call i32 @ackermann(i32 %5, i32 %6), !dbg !65
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0), i32 %3, i32 %4, i32 %call), !dbg !66
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body3
  %7 = load i32, i32* %n, align 4, !dbg !67
  %inc = add nsw i32 %7, 1, !dbg !67
  store i32 %inc, i32* %n, align 4, !dbg !67
  br label %for.cond1, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond1
  br label %for.inc5, !dbg !70

for.inc5:                                         ; preds = %for.end
  %8 = load i32, i32* %m, align 4, !dbg !71
  %inc6 = add nsw i32 %8, 1, !dbg !71
  store i32 %inc6, i32* %m, align 4, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end7:                                         ; preds = %for.cond
  ret i32 0, !dbg !75
}

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "ackermann-function-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Ackermann-function")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "ackermann", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "m", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!12 = !DILocation(line: 3, column: 19, scope: !7)
!13 = !DILocalVariable(name: "n", arg: 2, scope: !7, file: !1, line: 3, type: !10)
!14 = !DILocation(line: 3, column: 26, scope: !7)
!15 = !DILocation(line: 5, column: 14, scope: !16)
!16 = distinct !DILexicalBlock(scope: !7, file: !1, line: 5, column: 13)
!17 = !DILocation(line: 5, column: 13, scope: !7)
!18 = !{!"if"}
!19 = !DILocation(line: 5, column: 24, scope: !16)
!20 = !DILocation(line: 5, column: 26, scope: !16)
!21 = !DILocation(line: 5, column: 17, scope: !16)
!22 = !DILocation(line: 6, column: 14, scope: !23)
!23 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 13)
!24 = !DILocation(line: 6, column: 13, scope: !7)
!25 = !DILocation(line: 6, column: 34, scope: !23)
!26 = !DILocation(line: 6, column: 36, scope: !23)
!27 = !DILocation(line: 6, column: 24, scope: !23)
!28 = !DILocation(line: 6, column: 17, scope: !23)
!29 = !DILocation(line: 7, column: 26, scope: !7)
!30 = !DILocation(line: 7, column: 28, scope: !7)
!31 = !DILocation(line: 7, column: 43, scope: !7)
!32 = !DILocation(line: 7, column: 46, scope: !7)
!33 = !DILocation(line: 7, column: 48, scope: !7)
!34 = !DILocation(line: 7, column: 33, scope: !7)
!35 = !DILocation(line: 7, column: 16, scope: !7)
!36 = !DILocation(line: 7, column: 9, scope: !7)
!37 = !DILocation(line: 8, column: 1, scope: !7)
!38 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 10, type: !39, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{!10}
!41 = !DILocalVariable(name: "m", scope: !38, file: !1, line: 12, type: !10)
!42 = !DILocation(line: 12, column: 13, scope: !38)
!43 = !DILocalVariable(name: "n", scope: !38, file: !1, line: 12, type: !10)
!44 = !DILocation(line: 12, column: 16, scope: !38)
!45 = !DILocation(line: 13, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !38, file: !1, line: 13, column: 9)
!47 = !DILocation(line: 13, column: 14, scope: !46)
!48 = !DILocation(line: 13, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !1, line: 13, column: 9)
!50 = !DILocation(line: 13, column: 23, scope: !49)
!51 = !DILocation(line: 13, column: 9, scope: !46)
!52 = !DILocation(line: 14, column: 24, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !1, line: 14, column: 17)
!54 = !DILocation(line: 14, column: 22, scope: !53)
!55 = !DILocation(line: 14, column: 29, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !1, line: 14, column: 17)
!57 = !DILocation(line: 14, column: 37, scope: !56)
!58 = !DILocation(line: 14, column: 35, scope: !56)
!59 = !DILocation(line: 14, column: 31, scope: !56)
!60 = !DILocation(line: 14, column: 17, scope: !53)
!61 = !DILocation(line: 15, column: 52, scope: !56)
!62 = !DILocation(line: 15, column: 55, scope: !56)
!63 = !DILocation(line: 15, column: 68, scope: !56)
!64 = !DILocation(line: 15, column: 71, scope: !56)
!65 = !DILocation(line: 15, column: 58, scope: !56)
!66 = !DILocation(line: 15, column: 25, scope: !56)
!67 = !DILocation(line: 14, column: 41, scope: !56)
!68 = !DILocation(line: 14, column: 17, scope: !56)
!69 = distinct !{!69, !60, !70}
!70 = !DILocation(line: 15, column: 73, scope: !53)
!71 = !DILocation(line: 13, column: 30, scope: !49)
!72 = !DILocation(line: 13, column: 9, scope: !49)
!73 = distinct !{!73, !51, !74}
!74 = !DILocation(line: 15, column: 73, scope: !46)
!75 = !DILocation(line: 17, column: 9, scope: !38)
