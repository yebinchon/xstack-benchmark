; ModuleID = 'floyds-triangle.c'
source_filename = "floyds-triangle.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%*d%c\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @t(i32 %n) #0 !dbg !7 {
entry:
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %c = alloca i32, align 4
  %len = alloca i32, align 4
  %num = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.declare(metadata i32* %i, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %j, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %c, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %len, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i32, i32* %n.addr, align 4, !dbg !21
  %1 = load i32, i32* %n.addr, align 4, !dbg !22
  %sub = sub nsw i32 %1, 1, !dbg !23
  %mul = mul nsw i32 %0, %sub, !dbg !24
  %div = sdiv i32 %mul, 2, !dbg !25
  store i32 %div, i32* %i, align 4, !dbg !26
  store i32 1, i32* %c, align 4, !dbg !27
  store i32 1, i32* %len, align 4, !dbg !29
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %c, align 4, !dbg !31
  %3 = load i32, i32* %i, align 4, !dbg !33
  %cmp = icmp slt i32 %2, %3, !dbg !34
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  br label %for.inc, !dbg !35

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %c, align 4, !dbg !36
  %mul1 = mul nsw i32 %4, 10, !dbg !36
  store i32 %mul1, i32* %c, align 4, !dbg !36
  %5 = load i32, i32* %len, align 4, !dbg !37
  %inc = add nsw i32 %5, 1, !dbg !37
  store i32 %inc, i32* %len, align 4, !dbg !37
  br label %for.cond, !dbg !38, !llvm.loop !39

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !41
  %7 = load i32, i32* %c, align 4, !dbg !42
  %sub2 = sub nsw i32 %7, %6, !dbg !42
  store i32 %sub2, i32* %c, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata i32* %num, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 1, i32* %i, align 4, !dbg !45
  store i32 1, i32* %num, align 4, !dbg !47
  br label %for.cond3, !dbg !48

for.cond3:                                        ; preds = %for.inc16, %for.end
  %8 = load i32, i32* %i, align 4, !dbg !49
  %9 = load i32, i32* %n.addr, align 4, !dbg !51
  %cmp4 = icmp sle i32 %8, %9, !dbg !52
  br i1 %cmp4, label %for.body5, label %for.end18, !dbg !53

for.body5:                                        ; preds = %for.cond3
  store i32 1, i32* %j, align 4, !dbg !54
  br label %for.cond6, !dbg !56

for.cond6:                                        ; preds = %for.inc13, %for.body5
  %10 = load i32, i32* %j, align 4, !dbg !57
  %11 = load i32, i32* %i, align 4, !dbg !59
  %cmp7 = icmp sle i32 %10, %11, !dbg !60
  br i1 %cmp7, label %for.body8, label %for.end15, !dbg !61

for.body8:                                        ; preds = %for.cond6
  %12 = load i32, i32* %len, align 4, !dbg !62
  %13 = load i32, i32* %j, align 4, !dbg !63
  %14 = load i32, i32* %c, align 4, !dbg !64
  %cmp9 = icmp slt i32 %13, %14, !dbg !65
  %conv = zext i1 %cmp9 to i32, !dbg !65
  %sub10 = sub nsw i32 %12, %conv, !dbg !66
  %15 = load i32, i32* %num, align 4, !dbg !67
  %inc11 = add nsw i32 %15, 1, !dbg !67
  store i32 %inc11, i32* %num, align 4, !dbg !67
  %16 = load i32, i32* %i, align 4, !dbg !68
  %17 = load i32, i32* %j, align 4, !dbg !69
  %sub12 = sub nsw i32 %16, %17, !dbg !70
  %tobool = icmp ne i32 %sub12, 0, !dbg !68
  %18 = zext i1 %tobool to i64, !dbg !68
  %cond = select i1 %tobool, i32 32, i32 10, !dbg !68
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i32 %sub10, i32 %15, i32 %cond), !dbg !71
  br label %for.inc13, !dbg !71

for.inc13:                                        ; preds = %for.body8
  %19 = load i32, i32* %j, align 4, !dbg !72
  %inc14 = add nsw i32 %19, 1, !dbg !72
  store i32 %inc14, i32* %j, align 4, !dbg !72
  br label %for.cond6, !dbg !73, !llvm.loop !74

for.end15:                                        ; preds = %for.cond6
  br label %for.inc16, !dbg !75

for.inc16:                                        ; preds = %for.end15
  %20 = load i32, i32* %i, align 4, !dbg !76
  %inc17 = add nsw i32 %20, 1, !dbg !76
  store i32 %inc17, i32* %i, align 4, !dbg !76
  br label %for.cond3, !dbg !77, !llvm.loop !78

for.end18:                                        ; preds = %for.cond3
  ret void, !dbg !80
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @t(i32 5), !dbg !84
  call void @t(i32 14), !dbg !85
  ret i32 0, !dbg !86
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "floyds-triangle.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Floyds-triangle")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "t", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!12 = !DILocation(line: 3, column: 12, scope: !7)
!13 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 5, type: !10)
!14 = !DILocation(line: 5, column: 6, scope: !7)
!15 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 5, type: !10)
!16 = !DILocation(line: 5, column: 9, scope: !7)
!17 = !DILocalVariable(name: "c", scope: !7, file: !1, line: 5, type: !10)
!18 = !DILocation(line: 5, column: 12, scope: !7)
!19 = !DILocalVariable(name: "len", scope: !7, file: !1, line: 5, type: !10)
!20 = !DILocation(line: 5, column: 15, scope: !7)
!21 = !DILocation(line: 7, column: 6, scope: !7)
!22 = !DILocation(line: 7, column: 11, scope: !7)
!23 = !DILocation(line: 7, column: 13, scope: !7)
!24 = !DILocation(line: 7, column: 8, scope: !7)
!25 = !DILocation(line: 7, column: 18, scope: !7)
!26 = !DILocation(line: 7, column: 4, scope: !7)
!27 = !DILocation(line: 8, column: 15, scope: !28)
!28 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 2)
!29 = !DILocation(line: 8, column: 11, scope: !28)
!30 = !DILocation(line: 8, column: 7, scope: !28)
!31 = !DILocation(line: 8, column: 20, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !1, line: 8, column: 2)
!33 = !DILocation(line: 8, column: 24, scope: !32)
!34 = !DILocation(line: 8, column: 22, scope: !32)
!35 = !DILocation(line: 8, column: 2, scope: !28)
!36 = !DILocation(line: 8, column: 29, scope: !32)
!37 = !DILocation(line: 8, column: 39, scope: !32)
!38 = !DILocation(line: 8, column: 2, scope: !32)
!39 = distinct !{!39, !35, !40}
!40 = !DILocation(line: 8, column: 42, scope: !28)
!41 = !DILocation(line: 9, column: 7, scope: !7)
!42 = !DILocation(line: 9, column: 4, scope: !7)
!43 = !DILocalVariable(name: "num", scope: !7, file: !1, line: 48, type: !10)
!44 = !DILocation(line: 48, column: 6, scope: !7)
!45 = !DILocation(line: 49, column: 15, scope: !46)
!46 = distinct !DILexicalBlock(scope: !7, file: !1, line: 49, column: 2)
!47 = !DILocation(line: 49, column: 11, scope: !46)
!48 = !DILocation(line: 49, column: 7, scope: !46)
!49 = !DILocation(line: 49, column: 20, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 49, column: 2)
!51 = !DILocation(line: 49, column: 25, scope: !50)
!52 = !DILocation(line: 49, column: 22, scope: !50)
!53 = !DILocation(line: 49, column: 2, scope: !46)
!54 = !DILocation(line: 50, column: 10, scope: !55)
!55 = distinct !DILexicalBlock(scope: !50, file: !1, line: 50, column: 3)
!56 = !DILocation(line: 50, column: 8, scope: !55)
!57 = !DILocation(line: 50, column: 15, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !1, line: 50, column: 3)
!59 = !DILocation(line: 50, column: 20, scope: !58)
!60 = !DILocation(line: 50, column: 17, scope: !58)
!61 = !DILocation(line: 50, column: 3, scope: !55)
!62 = !DILocation(line: 51, column: 20, scope: !58)
!63 = !DILocation(line: 51, column: 27, scope: !58)
!64 = !DILocation(line: 51, column: 31, scope: !58)
!65 = !DILocation(line: 51, column: 29, scope: !58)
!66 = !DILocation(line: 51, column: 24, scope: !58)
!67 = !DILocation(line: 51, column: 38, scope: !58)
!68 = !DILocation(line: 51, column: 42, scope: !58)
!69 = !DILocation(line: 51, column: 46, scope: !58)
!70 = !DILocation(line: 51, column: 44, scope: !58)
!71 = !DILocation(line: 51, column: 4, scope: !58)
!72 = !DILocation(line: 50, column: 24, scope: !58)
!73 = !DILocation(line: 50, column: 3, scope: !58)
!74 = distinct !{!74, !61, !75}
!75 = !DILocation(line: 51, column: 58, scope: !55)
!76 = !DILocation(line: 49, column: 29, scope: !50)
!77 = !DILocation(line: 49, column: 2, scope: !50)
!78 = distinct !{!78, !53, !79}
!79 = !DILocation(line: 51, column: 58, scope: !46)
!80 = !DILocation(line: 53, column: 1, scope: !7)
!81 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 55, type: !82, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!10}
!84 = !DILocation(line: 57, column: 2, scope: !81)
!85 = !DILocation(line: 57, column: 8, scope: !81)
!86 = !DILocation(line: 61, column: 2, scope: !81)
