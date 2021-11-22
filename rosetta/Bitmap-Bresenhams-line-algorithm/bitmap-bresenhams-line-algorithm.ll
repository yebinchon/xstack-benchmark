; ModuleID = 'bitmap-bresenhams-line-algorithm.c'
source_filename = "bitmap-bresenhams-line-algorithm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @line(i32 %x0, i32 %y0, i32 %x1, i32 %y1) #0 !dbg !7 {
entry:
  %x0.addr = alloca i32, align 4
  %y0.addr = alloca i32, align 4
  %x1.addr = alloca i32, align 4
  %y1.addr = alloca i32, align 4
  %dx = alloca i32, align 4
  %sx = alloca i32, align 4
  %dy = alloca i32, align 4
  %sy = alloca i32, align 4
  %err = alloca i32, align 4
  %e2 = alloca i32, align 4
  store i32 %x0, i32* %x0.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x0.addr, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %y0, i32* %y0.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %y0.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %x1, i32* %x1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x1.addr, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 %y1, i32* %y1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %y1.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %dx, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i32, i32* %x1.addr, align 4, !dbg !21
  %1 = load i32, i32* %x0.addr, align 4, !dbg !22
  %sub = sub nsw i32 %0, %1, !dbg !23
  %call = call i32 @abs(i32 %sub) #4, !dbg !24
  store i32 %call, i32* %dx, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %sx, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = load i32, i32* %x0.addr, align 4, !dbg !27
  %3 = load i32, i32* %x1.addr, align 4, !dbg !28
  %cmp = icmp slt i32 %2, %3, !dbg !29
  %4 = zext i1 %cmp to i64, !dbg !27
  %cond = select i1 %cmp, i32 1, i32 -1, !dbg !27
  store i32 %cond, i32* %sx, align 4, !dbg !26
  call void @llvm.dbg.declare(metadata i32* %dy, metadata !30, metadata !DIExpression()), !dbg !31
  %5 = load i32, i32* %y1.addr, align 4, !dbg !32
  %6 = load i32, i32* %y0.addr, align 4, !dbg !33
  %sub1 = sub nsw i32 %5, %6, !dbg !34
  %call2 = call i32 @abs(i32 %sub1) #4, !dbg !35
  store i32 %call2, i32* %dy, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata i32* %sy, metadata !36, metadata !DIExpression()), !dbg !37
  %7 = load i32, i32* %y0.addr, align 4, !dbg !38
  %8 = load i32, i32* %y1.addr, align 4, !dbg !39
  %cmp3 = icmp slt i32 %7, %8, !dbg !40
  %9 = zext i1 %cmp3 to i64, !dbg !38
  %cond4 = select i1 %cmp3, i32 1, i32 -1, !dbg !38
  store i32 %cond4, i32* %sy, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata i32* %err, metadata !41, metadata !DIExpression()), !dbg !42
  %10 = load i32, i32* %dx, align 4, !dbg !43
  %11 = load i32, i32* %dy, align 4, !dbg !44
  %cmp5 = icmp sgt i32 %10, %11, !dbg !45
  br i1 %cmp5, label %cond.true, label %cond.false, !dbg !43

cond.true:                                        ; preds = %entry
  %12 = load i32, i32* %dx, align 4, !dbg !46
  br label %cond.end, !dbg !43

cond.false:                                       ; preds = %entry
  %13 = load i32, i32* %dy, align 4, !dbg !47
  %sub6 = sub nsw i32 0, %13, !dbg !48
  br label %cond.end, !dbg !43

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond7 = phi i32 [ %12, %cond.true ], [ %sub6, %cond.false ], !dbg !43
  %div = sdiv i32 %cond7, 2, !dbg !49
  store i32 %div, i32* %err, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata i32* %e2, metadata !50, metadata !DIExpression()), !dbg !51
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %if.end20, %cond.end
  %14 = load i32, i32* %x0.addr, align 4, !dbg !53
  %15 = load i32, i32* %y0.addr, align 4, !dbg !57
  %call8 = call i32 (i32, i32, ...) bitcast (i32 (...)* @setPixel to i32 (i32, i32, ...)*)(i32 %14, i32 %15), !dbg !58
  %16 = load i32, i32* %x0.addr, align 4, !dbg !59
  %17 = load i32, i32* %x1.addr, align 4, !dbg !61
  %cmp9 = icmp eq i32 %16, %17, !dbg !62
  br i1 %cmp9, label %land.lhs.true, label %if.end, !dbg !63, !cf.info !64

land.lhs.true:                                    ; preds = %for.cond
  %18 = load i32, i32* %y0.addr, align 4, !dbg !65
  %19 = load i32, i32* %y1.addr, align 4, !dbg !66
  %cmp10 = icmp eq i32 %18, %19, !dbg !67
  br i1 %cmp10, label %if.then, label %if.end, !dbg !68, !cf.info !64

if.then:                                          ; preds = %land.lhs.true
  br label %for.end, !dbg !69

if.end:                                           ; preds = %land.lhs.true, %for.cond
  %20 = load i32, i32* %err, align 4, !dbg !70
  store i32 %20, i32* %e2, align 4, !dbg !71
  %21 = load i32, i32* %e2, align 4, !dbg !72
  %22 = load i32, i32* %dx, align 4, !dbg !74
  %sub11 = sub nsw i32 0, %22, !dbg !75
  %cmp12 = icmp sgt i32 %21, %sub11, !dbg !76
  br i1 %cmp12, label %if.then13, label %if.end15, !dbg !77, !cf.info !64

if.then13:                                        ; preds = %if.end
  %23 = load i32, i32* %dy, align 4, !dbg !78
  %24 = load i32, i32* %err, align 4, !dbg !80
  %sub14 = sub nsw i32 %24, %23, !dbg !80
  store i32 %sub14, i32* %err, align 4, !dbg !80
  %25 = load i32, i32* %sx, align 4, !dbg !81
  %26 = load i32, i32* %x0.addr, align 4, !dbg !82
  %add = add nsw i32 %26, %25, !dbg !82
  store i32 %add, i32* %x0.addr, align 4, !dbg !82
  br label %if.end15, !dbg !83

if.end15:                                         ; preds = %if.then13, %if.end
  %27 = load i32, i32* %e2, align 4, !dbg !84
  %28 = load i32, i32* %dy, align 4, !dbg !86
  %cmp16 = icmp slt i32 %27, %28, !dbg !87
  br i1 %cmp16, label %if.then17, label %if.end20, !dbg !88, !cf.info !64

if.then17:                                        ; preds = %if.end15
  %29 = load i32, i32* %dx, align 4, !dbg !89
  %30 = load i32, i32* %err, align 4, !dbg !91
  %add18 = add nsw i32 %30, %29, !dbg !91
  store i32 %add18, i32* %err, align 4, !dbg !91
  %31 = load i32, i32* %sy, align 4, !dbg !92
  %32 = load i32, i32* %y0.addr, align 4, !dbg !93
  %add19 = add nsw i32 %32, %31, !dbg !93
  store i32 %add19, i32* %y0.addr, align 4, !dbg !93
  br label %if.end20, !dbg !94

if.end20:                                         ; preds = %if.then17, %if.end15
  br label %for.cond, !dbg !95, !llvm.loop !96

for.end:                                          ; preds = %if.then
  ret void, !dbg !99
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readnone
declare dso_local i32 @abs(i32) #2

declare dso_local i32 @setPixel(...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "bitmap-bresenhams-line-algorithm.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Bitmap-Bresenhams-line-algorithm")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "line", scope: !1, file: !1, line: 1, type: !8, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10, !10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "x0", arg: 1, scope: !7, file: !1, line: 1, type: !10)
!12 = !DILocation(line: 1, column: 15, scope: !7)
!13 = !DILocalVariable(name: "y0", arg: 2, scope: !7, file: !1, line: 1, type: !10)
!14 = !DILocation(line: 1, column: 23, scope: !7)
!15 = !DILocalVariable(name: "x1", arg: 3, scope: !7, file: !1, line: 1, type: !10)
!16 = !DILocation(line: 1, column: 31, scope: !7)
!17 = !DILocalVariable(name: "y1", arg: 4, scope: !7, file: !1, line: 1, type: !10)
!18 = !DILocation(line: 1, column: 39, scope: !7)
!19 = !DILocalVariable(name: "dx", scope: !7, file: !1, line: 3, type: !10)
!20 = !DILocation(line: 3, column: 7, scope: !7)
!21 = !DILocation(line: 3, column: 16, scope: !7)
!22 = !DILocation(line: 3, column: 19, scope: !7)
!23 = !DILocation(line: 3, column: 18, scope: !7)
!24 = !DILocation(line: 3, column: 12, scope: !7)
!25 = !DILocalVariable(name: "sx", scope: !7, file: !1, line: 3, type: !10)
!26 = !DILocation(line: 3, column: 24, scope: !7)
!27 = !DILocation(line: 3, column: 29, scope: !7)
!28 = !DILocation(line: 3, column: 32, scope: !7)
!29 = !DILocation(line: 3, column: 31, scope: !7)
!30 = !DILocalVariable(name: "dy", scope: !7, file: !1, line: 4, type: !10)
!31 = !DILocation(line: 4, column: 7, scope: !7)
!32 = !DILocation(line: 4, column: 16, scope: !7)
!33 = !DILocation(line: 4, column: 19, scope: !7)
!34 = !DILocation(line: 4, column: 18, scope: !7)
!35 = !DILocation(line: 4, column: 12, scope: !7)
!36 = !DILocalVariable(name: "sy", scope: !7, file: !1, line: 4, type: !10)
!37 = !DILocation(line: 4, column: 24, scope: !7)
!38 = !DILocation(line: 4, column: 29, scope: !7)
!39 = !DILocation(line: 4, column: 32, scope: !7)
!40 = !DILocation(line: 4, column: 31, scope: !7)
!41 = !DILocalVariable(name: "err", scope: !7, file: !1, line: 5, type: !10)
!42 = !DILocation(line: 5, column: 7, scope: !7)
!43 = !DILocation(line: 5, column: 14, scope: !7)
!44 = !DILocation(line: 5, column: 17, scope: !7)
!45 = !DILocation(line: 5, column: 16, scope: !7)
!46 = !DILocation(line: 5, column: 22, scope: !7)
!47 = !DILocation(line: 5, column: 28, scope: !7)
!48 = !DILocation(line: 5, column: 27, scope: !7)
!49 = !DILocation(line: 5, column: 31, scope: !7)
!50 = !DILocalVariable(name: "e2", scope: !7, file: !1, line: 5, type: !10)
!51 = !DILocation(line: 5, column: 35, scope: !7)
!52 = !DILocation(line: 7, column: 3, scope: !7)
!53 = !DILocation(line: 8, column: 14, scope: !54)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 7, column: 10)
!55 = distinct !DILexicalBlock(scope: !56, file: !1, line: 7, column: 3)
!56 = distinct !DILexicalBlock(scope: !7, file: !1, line: 7, column: 3)
!57 = !DILocation(line: 8, column: 17, scope: !54)
!58 = !DILocation(line: 8, column: 5, scope: !54)
!59 = !DILocation(line: 9, column: 9, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !1, line: 9, column: 9)
!61 = !DILocation(line: 9, column: 13, scope: !60)
!62 = !DILocation(line: 9, column: 11, scope: !60)
!63 = !DILocation(line: 9, column: 16, scope: !60)
!64 = !{!"if"}
!65 = !DILocation(line: 9, column: 19, scope: !60)
!66 = !DILocation(line: 9, column: 23, scope: !60)
!67 = !DILocation(line: 9, column: 21, scope: !60)
!68 = !DILocation(line: 9, column: 9, scope: !54)
!69 = !DILocation(line: 9, column: 27, scope: !60)
!70 = !DILocation(line: 10, column: 10, scope: !54)
!71 = !DILocation(line: 10, column: 8, scope: !54)
!72 = !DILocation(line: 11, column: 9, scope: !73)
!73 = distinct !DILexicalBlock(scope: !54, file: !1, line: 11, column: 9)
!74 = !DILocation(line: 11, column: 14, scope: !73)
!75 = !DILocation(line: 11, column: 13, scope: !73)
!76 = !DILocation(line: 11, column: 12, scope: !73)
!77 = !DILocation(line: 11, column: 9, scope: !54)
!78 = !DILocation(line: 11, column: 27, scope: !79)
!79 = distinct !DILexicalBlock(scope: !73, file: !1, line: 11, column: 18)
!80 = !DILocation(line: 11, column: 24, scope: !79)
!81 = !DILocation(line: 11, column: 37, scope: !79)
!82 = !DILocation(line: 11, column: 34, scope: !79)
!83 = !DILocation(line: 11, column: 41, scope: !79)
!84 = !DILocation(line: 12, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !54, file: !1, line: 12, column: 9)
!86 = !DILocation(line: 12, column: 14, scope: !85)
!87 = !DILocation(line: 12, column: 12, scope: !85)
!88 = !DILocation(line: 12, column: 9, scope: !54)
!89 = !DILocation(line: 12, column: 27, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !1, line: 12, column: 18)
!91 = !DILocation(line: 12, column: 24, scope: !90)
!92 = !DILocation(line: 12, column: 37, scope: !90)
!93 = !DILocation(line: 12, column: 34, scope: !90)
!94 = !DILocation(line: 12, column: 41, scope: !90)
!95 = !DILocation(line: 7, column: 3, scope: !55)
!96 = distinct !{!96, !97, !98}
!97 = !DILocation(line: 7, column: 3, scope: !56)
!98 = !DILocation(line: 13, column: 3, scope: !56)
!99 = !DILocation(line: 14, column: 1, scope: !7)
