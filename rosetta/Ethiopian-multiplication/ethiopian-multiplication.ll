; ModuleID = 'ethiopian-multiplication.c'
source_filename = "ethiopian-multiplication.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [38 x i8] c"ethiopian multiplication of %d by %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"%4d %6d struck\0A\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"%4d %6d kept\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @halve(i32* %x) #0 !dbg !7 {
entry:
  %x.addr = alloca i32*, align 8
  store i32* %x, i32** %x.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %x.addr, metadata !12, metadata !DIExpression()), !dbg !13
  %0 = load i32*, i32** %x.addr, align 8, !dbg !14
  %1 = load i32, i32* %0, align 4, !dbg !15
  %shr = ashr i32 %1, 1, !dbg !15
  store i32 %shr, i32* %0, align 4, !dbg !15
  ret void, !dbg !16
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @doublit(i32* %x) #0 !dbg !17 {
entry:
  %x.addr = alloca i32*, align 8
  store i32* %x, i32** %x.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %x.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32*, i32** %x.addr, align 8, !dbg !20
  %1 = load i32, i32* %0, align 4, !dbg !21
  %shl = shl i32 %1, 1, !dbg !21
  store i32 %shl, i32* %0, align 4, !dbg !21
  ret void, !dbg !22
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i1 @iseven(i32 %x) #0 !dbg !23 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = load i32, i32* %x.addr, align 4, !dbg !30
  %and = and i32 %0, 1, !dbg !31
  %cmp = icmp eq i32 %and, 0, !dbg !32
  ret i1 %cmp, !dbg !33
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ethiopian(i32 %plier, i32 %plicand, i1 zeroext %tutor) #0 !dbg !34 {
entry:
  %plier.addr = alloca i32, align 4
  %plicand.addr = alloca i32, align 4
  %tutor.addr = alloca i8, align 1
  %result = alloca i32, align 4
  store i32 %plier, i32* %plier.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %plier.addr, metadata !38, metadata !DIExpression()), !dbg !39
  store i32 %plicand, i32* %plicand.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %plicand.addr, metadata !40, metadata !DIExpression()), !dbg !41
  %frombool = zext i1 %tutor to i8
  store i8 %frombool, i8* %tutor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %tutor.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %result, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 0, i32* %result, align 4, !dbg !45
  %0 = load i8, i8* %tutor.addr, align 1, !dbg !46
  %tobool = trunc i8 %0 to i1, !dbg !46
  br i1 %tobool, label %if.then, label %if.end, !dbg !48, !cf.info !49

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %plier.addr, align 4, !dbg !50
  %2 = load i32, i32* %plicand.addr, align 4, !dbg !51
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i64 0, i64 0), i32 %1, i32 %2), !dbg !52
  br label %if.end, !dbg !52

if.end:                                           ; preds = %if.then, %entry
  br label %while.cond, !dbg !53

while.cond:                                       ; preds = %if.end11, %if.end
  %3 = load i32, i32* %plier.addr, align 4, !dbg !54
  %cmp = icmp sge i32 %3, 1, !dbg !55
  br i1 %cmp, label %while.body, label %while.end, !dbg !53

while.body:                                       ; preds = %while.cond
  %4 = load i32, i32* %plier.addr, align 4, !dbg !56
  %call1 = call zeroext i1 @iseven(i32 %4), !dbg !59
  br i1 %call1, label %if.then2, label %if.else, !dbg !60, !cf.info !49

if.then2:                                         ; preds = %while.body
  %5 = load i8, i8* %tutor.addr, align 1, !dbg !61
  %tobool3 = trunc i8 %5 to i1, !dbg !61
  br i1 %tobool3, label %if.then4, label %if.end6, !dbg !64, !cf.info !49

if.then4:                                         ; preds = %if.then2
  %6 = load i32, i32* %plier.addr, align 4, !dbg !65
  %7 = load i32, i32* %plicand.addr, align 4, !dbg !66
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0), i32 %6, i32 %7), !dbg !67
  br label %if.end6, !dbg !67

if.end6:                                          ; preds = %if.then4, %if.then2
  br label %if.end11, !dbg !68

if.else:                                          ; preds = %while.body
  %8 = load i8, i8* %tutor.addr, align 1, !dbg !69
  %tobool7 = trunc i8 %8 to i1, !dbg !69
  br i1 %tobool7, label %if.then8, label %if.end10, !dbg !72, !cf.info !49

if.then8:                                         ; preds = %if.else
  %9 = load i32, i32* %plier.addr, align 4, !dbg !73
  %10 = load i32, i32* %plicand.addr, align 4, !dbg !74
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0), i32 %9, i32 %10), !dbg !75
  br label %if.end10, !dbg !75

if.end10:                                         ; preds = %if.then8, %if.else
  %11 = load i32, i32* %plicand.addr, align 4, !dbg !76
  %12 = load i32, i32* %result, align 4, !dbg !77
  %add = add nsw i32 %12, %11, !dbg !77
  store i32 %add, i32* %result, align 4, !dbg !77
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.end6
  call void @halve(i32* %plier.addr), !dbg !78
  call void @doublit(i32* %plicand.addr), !dbg !79
  br label %while.cond, !dbg !53, !llvm.loop !80

while.end:                                        ; preds = %while.cond
  %13 = load i32, i32* %result, align 4, !dbg !82
  ret i32 %13, !dbg !83
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 @ethiopian(i32 17, i32 34, i1 zeroext true), !dbg !87
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %call), !dbg !88
  ret i32 0, !dbg !89
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "ethiopian-multiplication.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Ethiopian-multiplication")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "halve", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "x", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!13 = !DILocation(line: 4, column: 17, scope: !7)
!14 = !DILocation(line: 4, column: 23, scope: !7)
!15 = !DILocation(line: 4, column: 25, scope: !7)
!16 = !DILocation(line: 4, column: 32, scope: !7)
!17 = distinct !DISubprogram(name: "doublit", scope: !1, file: !1, line: 5, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DILocalVariable(name: "x", arg: 1, scope: !17, file: !1, line: 5, type: !10)
!19 = !DILocation(line: 5, column: 19, scope: !17)
!20 = !DILocation(line: 5, column: 26, scope: !17)
!21 = !DILocation(line: 5, column: 28, scope: !17)
!22 = !DILocation(line: 5, column: 35, scope: !17)
!23 = distinct !DISubprogram(name: "iseven", scope: !1, file: !1, line: 6, type: !24, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!24 = !DISubroutineType(types: !25)
!25 = !{!26, !27}
!26 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!28 = !DILocalVariable(name: "x", arg: 1, scope: !23, file: !1, line: 6, type: !27)
!29 = !DILocation(line: 6, column: 23, scope: !23)
!30 = !DILocation(line: 6, column: 36, scope: !23)
!31 = !DILocation(line: 6, column: 38, scope: !23)
!32 = !DILocation(line: 6, column: 43, scope: !23)
!33 = !DILocation(line: 6, column: 28, scope: !23)
!34 = distinct !DISubprogram(name: "ethiopian", scope: !1, file: !1, line: 8, type: !35, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!11, !11, !11, !37}
!37 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !26)
!38 = !DILocalVariable(name: "plier", arg: 1, scope: !34, file: !1, line: 8, type: !11)
!39 = !DILocation(line: 8, column: 19, scope: !34)
!40 = !DILocalVariable(name: "plicand", arg: 2, scope: !34, file: !1, line: 9, type: !11)
!41 = !DILocation(line: 9, column: 12, scope: !34)
!42 = !DILocalVariable(name: "tutor", arg: 3, scope: !34, file: !1, line: 9, type: !37)
!43 = !DILocation(line: 9, column: 32, scope: !34)
!44 = !DILocalVariable(name: "result", scope: !34, file: !1, line: 11, type: !11)
!45 = !DILocation(line: 11, column: 7, scope: !34)
!46 = !DILocation(line: 13, column: 7, scope: !47)
!47 = distinct !DILexicalBlock(scope: !34, file: !1, line: 13, column: 7)
!48 = !DILocation(line: 13, column: 7, scope: !34)
!49 = !{!"if"}
!50 = !DILocation(line: 14, column: 54, scope: !47)
!51 = !DILocation(line: 14, column: 61, scope: !47)
!52 = !DILocation(line: 14, column: 5, scope: !47)
!53 = !DILocation(line: 16, column: 3, scope: !34)
!54 = !DILocation(line: 16, column: 9, scope: !34)
!55 = !DILocation(line: 16, column: 15, scope: !34)
!56 = !DILocation(line: 17, column: 17, scope: !57)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 17, column: 10)
!58 = distinct !DILexicalBlock(scope: !34, file: !1, line: 16, column: 21)
!59 = !DILocation(line: 17, column: 10, scope: !57)
!60 = !DILocation(line: 17, column: 10, scope: !58)
!61 = !DILocation(line: 18, column: 11, scope: !62)
!62 = distinct !DILexicalBlock(scope: !63, file: !1, line: 18, column: 11)
!63 = distinct !DILexicalBlock(scope: !57, file: !1, line: 17, column: 26)
!64 = !DILocation(line: 18, column: 11, scope: !63)
!65 = !DILocation(line: 18, column: 45, scope: !62)
!66 = !DILocation(line: 18, column: 52, scope: !62)
!67 = !DILocation(line: 18, column: 18, scope: !62)
!68 = !DILocation(line: 19, column: 5, scope: !63)
!69 = !DILocation(line: 20, column: 11, scope: !70)
!70 = distinct !DILexicalBlock(scope: !71, file: !1, line: 20, column: 11)
!71 = distinct !DILexicalBlock(scope: !57, file: !1, line: 19, column: 12)
!72 = !DILocation(line: 20, column: 11, scope: !71)
!73 = !DILocation(line: 20, column: 43, scope: !70)
!74 = !DILocation(line: 20, column: 50, scope: !70)
!75 = !DILocation(line: 20, column: 18, scope: !70)
!76 = !DILocation(line: 21, column: 17, scope: !71)
!77 = !DILocation(line: 21, column: 14, scope: !71)
!78 = !DILocation(line: 23, column: 5, scope: !58)
!79 = !DILocation(line: 23, column: 20, scope: !58)
!80 = distinct !{!80, !53, !81}
!81 = !DILocation(line: 24, column: 3, scope: !34)
!82 = !DILocation(line: 25, column: 10, scope: !34)
!83 = !DILocation(line: 25, column: 3, scope: !34)
!84 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 28, type: !85, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!11}
!87 = !DILocation(line: 30, column: 18, scope: !84)
!88 = !DILocation(line: 30, column: 3, scope: !84)
!89 = !DILocation(line: 31, column: 3, scope: !84)
