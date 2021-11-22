; ModuleID = 'last-friday-of-each-month.c'
source_filename = "last-friday-of-each-month.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.days = private unnamed_addr constant [12 x i32] [i32 31, i32 29, i32 31, i32 30, i32 31, i32 30, i32 31, i32 31, i32 30, i32 31, i32 30, i32 31], align 16
@.str = private unnamed_addr constant [12 x i8] c"%d-%02d-%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %c, i8** %v) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %v.addr = alloca i8**, align 8
  %days = alloca [12 x i32], align 16
  %m = alloca i32, align 4
  %y = alloca i32, align 4
  %w = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8** %v, i8*** %v.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %v.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata [12 x i32]* %days, metadata !18, metadata !DIExpression()), !dbg !22
  %0 = bitcast [12 x i32]* %days to i8*, !dbg !22
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([12 x i32]* @__const.main.days to i8*), i64 48, i1 false), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %m, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %y, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32* %w, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = load i32, i32* %c.addr, align 4, !dbg !29
  %cmp = icmp slt i32 %1, 2, !dbg !31
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !32, !cf.info !33

lor.lhs.false:                                    ; preds = %entry
  %2 = load i8**, i8*** %v.addr, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8*, i8** %2, i64 1, !dbg !34
  %3 = load i8*, i8** %arrayidx, align 8, !dbg !34
  %call = call i32 @atoi(i8* %3) #5, !dbg !35
  store i32 %call, i32* %y, align 4, !dbg !36
  %cmp1 = icmp sle i32 %call, 1700, !dbg !37
  br i1 %cmp1, label %if.then, label %if.end, !dbg !38, !cf.info !33

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 1, i32* %retval, align 4, !dbg !39
  br label %return, !dbg !39

if.end:                                           ; preds = %lor.lhs.false
  %4 = load i32, i32* %y, align 4, !dbg !40
  %rem = srem i32 %4, 4, !dbg !41
  %tobool = icmp ne i32 %rem, 0, !dbg !41
  br i1 %tobool, label %lor.end, label %lor.rhs, !dbg !42

lor.rhs:                                          ; preds = %if.end
  %5 = load i32, i32* %y, align 4, !dbg !43
  %rem2 = srem i32 %5, 100, !dbg !44
  %tobool3 = icmp ne i32 %rem2, 0, !dbg !44
  br i1 %tobool3, label %land.end, label %land.rhs, !dbg !45

land.rhs:                                         ; preds = %lor.rhs
  %6 = load i32, i32* %y, align 4, !dbg !46
  %rem4 = srem i32 %6, 400, !dbg !47
  %tobool5 = icmp ne i32 %rem4, 0, !dbg !45
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %7 = phi i1 [ false, %lor.rhs ], [ %tobool5, %land.rhs ], !dbg !48
  br label %lor.end, !dbg !42

lor.end:                                          ; preds = %land.end, %if.end
  %8 = phi i1 [ true, %if.end ], [ %7, %land.end ]
  %lor.ext = zext i1 %8 to i32, !dbg !42
  %arrayidx6 = getelementptr inbounds [12 x i32], [12 x i32]* %days, i64 0, i64 1, !dbg !49
  %9 = load i32, i32* %arrayidx6, align 4, !dbg !50
  %sub = sub nsw i32 %9, %lor.ext, !dbg !50
  store i32 %sub, i32* %arrayidx6, align 4, !dbg !50
  %10 = load i32, i32* %y, align 4, !dbg !51
  %mul = mul nsw i32 %10, 365, !dbg !52
  %11 = load i32, i32* %y, align 4, !dbg !53
  %sub7 = sub nsw i32 %11, 1, !dbg !54
  %div = sdiv i32 %sub7, 4, !dbg !55
  %add = add nsw i32 %mul, %div, !dbg !56
  %12 = load i32, i32* %y, align 4, !dbg !57
  %sub8 = sub nsw i32 %12, 1, !dbg !58
  %div9 = sdiv i32 %sub8, 100, !dbg !59
  %sub10 = sub nsw i32 %add, %div9, !dbg !60
  %13 = load i32, i32* %y, align 4, !dbg !61
  %sub11 = sub nsw i32 %13, 1, !dbg !62
  %div12 = sdiv i32 %sub11, 400, !dbg !63
  %add13 = add nsw i32 %sub10, %div12, !dbg !64
  %add14 = add nsw i32 %add13, 6, !dbg !65
  store i32 %add14, i32* %w, align 4, !dbg !66
  store i32 0, i32* %m, align 4, !dbg !67
  br label %for.cond, !dbg !69

for.cond:                                         ; preds = %for.inc, %lor.end
  %14 = load i32, i32* %m, align 4, !dbg !70
  %cmp15 = icmp slt i32 %14, 12, !dbg !72
  br i1 %cmp15, label %for.body, label %for.end, !dbg !73

for.body:                                         ; preds = %for.cond
  %15 = load i32, i32* %w, align 4, !dbg !74
  %16 = load i32, i32* %m, align 4, !dbg !76
  %idxprom = sext i32 %16 to i64, !dbg !77
  %arrayidx16 = getelementptr inbounds [12 x i32], [12 x i32]* %days, i64 0, i64 %idxprom, !dbg !77
  %17 = load i32, i32* %arrayidx16, align 4, !dbg !77
  %add17 = add nsw i32 %15, %17, !dbg !78
  %rem18 = srem i32 %add17, 7, !dbg !79
  store i32 %rem18, i32* %w, align 4, !dbg !80
  %18 = load i32, i32* %y, align 4, !dbg !81
  %19 = load i32, i32* %m, align 4, !dbg !82
  %add19 = add nsw i32 %19, 1, !dbg !83
  %20 = load i32, i32* %m, align 4, !dbg !84
  %idxprom20 = sext i32 %20 to i64, !dbg !85
  %arrayidx21 = getelementptr inbounds [12 x i32], [12 x i32]* %days, i64 0, i64 %idxprom20, !dbg !85
  %21 = load i32, i32* %arrayidx21, align 4, !dbg !85
  %22 = load i32, i32* %w, align 4, !dbg !86
  %cmp22 = icmp slt i32 %22, 5, !dbg !87
  %23 = zext i1 %cmp22 to i64, !dbg !86
  %cond = select i1 %cmp22, i32 -2, i32 5, !dbg !86
  %add23 = add nsw i32 %21, %cond, !dbg !88
  %24 = load i32, i32* %w, align 4, !dbg !89
  %sub24 = sub nsw i32 %add23, %24, !dbg !90
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i32 %18, i32 %add19, i32 %sub24), !dbg !91
  br label %for.inc, !dbg !92

for.inc:                                          ; preds = %for.body
  %25 = load i32, i32* %m, align 4, !dbg !93
  %inc = add nsw i32 %25, 1, !dbg !93
  store i32 %inc, i32* %m, align 4, !dbg !93
  br label %for.cond, !dbg !94, !llvm.loop !95

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, align 4, !dbg !97
  br label %return, !dbg !97

return:                                           ; preds = %for.end, %if.then
  %26 = load i32, i32* %retval, align 4, !dbg !98
  ret i32 %26, !dbg !98
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #3

declare dso_local i32 @printf(i8*, ...) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "last-friday-of-each-month.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Last-Friday-of-each-month")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "c", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!15 = !DILocation(line: 4, column: 14, scope: !7)
!16 = !DILocalVariable(name: "v", arg: 2, scope: !7, file: !1, line: 4, type: !11)
!17 = !DILocation(line: 4, column: 23, scope: !7)
!18 = !DILocalVariable(name: "days", scope: !7, file: !1, line: 6, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 384, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 12)
!22 = !DILocation(line: 6, column: 6, scope: !7)
!23 = !DILocalVariable(name: "m", scope: !7, file: !1, line: 7, type: !10)
!24 = !DILocation(line: 7, column: 6, scope: !7)
!25 = !DILocalVariable(name: "y", scope: !7, file: !1, line: 7, type: !10)
!26 = !DILocation(line: 7, column: 9, scope: !7)
!27 = !DILocalVariable(name: "w", scope: !7, file: !1, line: 7, type: !10)
!28 = !DILocation(line: 7, column: 12, scope: !7)
!29 = !DILocation(line: 9, column: 6, scope: !30)
!30 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 6)
!31 = !DILocation(line: 9, column: 8, scope: !30)
!32 = !DILocation(line: 9, column: 12, scope: !30)
!33 = !{!"if"}
!34 = !DILocation(line: 9, column: 25, scope: !30)
!35 = !DILocation(line: 9, column: 20, scope: !30)
!36 = !DILocation(line: 9, column: 18, scope: !30)
!37 = !DILocation(line: 9, column: 32, scope: !30)
!38 = !DILocation(line: 9, column: 6, scope: !7)
!39 = !DILocation(line: 9, column: 41, scope: !30)
!40 = !DILocation(line: 10, column: 15, scope: !7)
!41 = !DILocation(line: 10, column: 17, scope: !7)
!42 = !DILocation(line: 10, column: 22, scope: !7)
!43 = !DILocation(line: 10, column: 28, scope: !7)
!44 = !DILocation(line: 10, column: 30, scope: !7)
!45 = !DILocation(line: 10, column: 37, scope: !7)
!46 = !DILocation(line: 10, column: 41, scope: !7)
!47 = !DILocation(line: 10, column: 43, scope: !7)
!48 = !DILocation(line: 0, scope: !7)
!49 = !DILocation(line: 10, column: 3, scope: !7)
!50 = !DILocation(line: 10, column: 11, scope: !7)
!51 = !DILocation(line: 11, column: 6, scope: !7)
!52 = !DILocation(line: 11, column: 8, scope: !7)
!53 = !DILocation(line: 11, column: 17, scope: !7)
!54 = !DILocation(line: 11, column: 19, scope: !7)
!55 = !DILocation(line: 11, column: 24, scope: !7)
!56 = !DILocation(line: 11, column: 14, scope: !7)
!57 = !DILocation(line: 11, column: 31, scope: !7)
!58 = !DILocation(line: 11, column: 33, scope: !7)
!59 = !DILocation(line: 11, column: 38, scope: !7)
!60 = !DILocation(line: 11, column: 28, scope: !7)
!61 = !DILocation(line: 11, column: 47, scope: !7)
!62 = !DILocation(line: 11, column: 49, scope: !7)
!63 = !DILocation(line: 11, column: 54, scope: !7)
!64 = !DILocation(line: 11, column: 44, scope: !7)
!65 = !DILocation(line: 11, column: 60, scope: !7)
!66 = !DILocation(line: 11, column: 4, scope: !7)
!67 = !DILocation(line: 13, column: 8, scope: !68)
!68 = distinct !DILexicalBlock(scope: !7, file: !1, line: 13, column: 2)
!69 = !DILocation(line: 13, column: 6, scope: !68)
!70 = !DILocation(line: 13, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !1, line: 13, column: 2)
!72 = !DILocation(line: 13, column: 15, scope: !71)
!73 = !DILocation(line: 13, column: 2, scope: !68)
!74 = !DILocation(line: 14, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !1, line: 13, column: 26)
!76 = !DILocation(line: 14, column: 17, scope: !75)
!77 = !DILocation(line: 14, column: 12, scope: !75)
!78 = !DILocation(line: 14, column: 10, scope: !75)
!79 = !DILocation(line: 14, column: 21, scope: !75)
!80 = !DILocation(line: 14, column: 5, scope: !75)
!81 = !DILocation(line: 15, column: 26, scope: !75)
!82 = !DILocation(line: 15, column: 29, scope: !75)
!83 = !DILocation(line: 15, column: 31, scope: !75)
!84 = !DILocation(line: 16, column: 9, scope: !75)
!85 = !DILocation(line: 16, column: 4, scope: !75)
!86 = !DILocation(line: 16, column: 15, scope: !75)
!87 = !DILocation(line: 16, column: 17, scope: !75)
!88 = !DILocation(line: 16, column: 12, scope: !75)
!89 = !DILocation(line: 16, column: 33, scope: !75)
!90 = !DILocation(line: 16, column: 31, scope: !75)
!91 = !DILocation(line: 15, column: 3, scope: !75)
!92 = !DILocation(line: 17, column: 2, scope: !75)
!93 = !DILocation(line: 13, column: 22, scope: !71)
!94 = !DILocation(line: 13, column: 2, scope: !71)
!95 = distinct !{!95, !73, !96}
!96 = !DILocation(line: 17, column: 2, scope: !68)
!97 = !DILocation(line: 19, column: 2, scope: !7)
!98 = !DILocation(line: 20, column: 1, scope: !7)
