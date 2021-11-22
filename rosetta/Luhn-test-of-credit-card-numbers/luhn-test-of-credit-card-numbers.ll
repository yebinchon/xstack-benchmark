; ModuleID = 'luhn-test-of-credit-card-numbers.c'
source_filename = "luhn-test-of-credit-card-numbers.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.luhn.m = private unnamed_addr constant [10 x i32] [i32 0, i32 2, i32 4, i32 6, i32 8, i32 1, i32 3, i32 5, i32 7, i32 9], align 16
@.str = private unnamed_addr constant [12 x i8] c"49927398716\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"49927398717\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"1234567812345678\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"1234567812345670\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"%16s\09%s\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"ok\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"not ok\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @luhn(i8* %cc) #0 !dbg !7 {
entry:
  %cc.addr = alloca i8*, align 8
  %m = alloca [10 x i32], align 16
  %i = alloca i32, align 4
  %odd = alloca i32, align 4
  %sum = alloca i32, align 4
  %digit = alloca i32, align 4
  store i8* %cc, i8** %cc.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %cc.addr, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata [10 x i32]* %m, metadata !16, metadata !DIExpression()), !dbg !21
  %0 = bitcast [10 x i32]* %m to i8*, !dbg !21
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([10 x i32]* @__const.luhn.m to i8*), i64 40, i1 false), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %odd, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 1, i32* %odd, align 4, !dbg !25
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 0, i32* %sum, align 4, !dbg !27
  %1 = load i8*, i8** %cc.addr, align 8, !dbg !28
  %call = call i64 @strlen(i8* %1) #5, !dbg !30
  %conv = trunc i64 %call to i32, !dbg !30
  store i32 %conv, i32* %i, align 4, !dbg !31
  br label %for.cond, !dbg !32

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !33
  %dec = add nsw i32 %2, -1, !dbg !33
  store i32 %dec, i32* %i, align 4, !dbg !33
  %tobool = icmp ne i32 %2, 0, !dbg !35
  br i1 %tobool, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %digit, metadata !36, metadata !DIExpression()), !dbg !38
  %3 = load i8*, i8** %cc.addr, align 8, !dbg !39
  %4 = load i32, i32* %i, align 4, !dbg !40
  %idxprom = sext i32 %4 to i64, !dbg !39
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 %idxprom, !dbg !39
  %5 = load i8, i8* %arrayidx, align 1, !dbg !39
  %conv1 = sext i8 %5 to i32, !dbg !39
  %sub = sub nsw i32 %conv1, 48, !dbg !41
  store i32 %sub, i32* %digit, align 4, !dbg !38
  %6 = load i32, i32* %odd, align 4, !dbg !42
  %tobool2 = icmp ne i32 %6, 0, !dbg !42
  br i1 %tobool2, label %cond.true, label %cond.false, !dbg !42

cond.true:                                        ; preds = %for.body
  %7 = load i32, i32* %digit, align 4, !dbg !43
  br label %cond.end, !dbg !42

cond.false:                                       ; preds = %for.body
  %8 = load i32, i32* %digit, align 4, !dbg !44
  %idxprom3 = sext i32 %8 to i64, !dbg !45
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %m, i64 0, i64 %idxprom3, !dbg !45
  %9 = load i32, i32* %arrayidx4, align 4, !dbg !45
  br label %cond.end, !dbg !42

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %7, %cond.true ], [ %9, %cond.false ], !dbg !42
  %10 = load i32, i32* %sum, align 4, !dbg !46
  %add = add nsw i32 %10, %cond, !dbg !46
  store i32 %add, i32* %sum, align 4, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %cond.end
  %11 = load i32, i32* %odd, align 4, !dbg !48
  %tobool5 = icmp ne i32 %11, 0, !dbg !49
  %lnot = xor i1 %tobool5, true, !dbg !49
  %lnot.ext = zext i1 %lnot to i32, !dbg !49
  store i32 %lnot.ext, i32* %odd, align 4, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %sum, align 4, !dbg !54
  %rem = srem i32 %12, 10, !dbg !55
  %cmp = icmp eq i32 %rem, 0, !dbg !56
  %conv6 = zext i1 %cmp to i32, !dbg !56
  ret i32 %conv6, !dbg !57
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %cc = alloca [5 x i8*], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i8*]* %cc, metadata !61, metadata !DIExpression()), !dbg !65
  %0 = bitcast [5 x i8*]* %cc to i8*, !dbg !65
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !65
  %1 = bitcast i8* %0 to [5 x i8*]*, !dbg !65
  %2 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 0, !dbg !65
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i8** %2, align 16, !dbg !65
  %3 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 1, !dbg !65
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i8** %3, align 8, !dbg !65
  %4 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 2, !dbg !65
  store i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i32 0, i32 0), i8** %4, align 16, !dbg !65
  %5 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 3, !dbg !65
  store i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i32 0, i32 0), i8** %5, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata i32* %i, metadata !66, metadata !DIExpression()), !dbg !67
  store i32 0, i32* %i, align 4, !dbg !68
  br label %for.cond, !dbg !70

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, i32* %i, align 4, !dbg !71
  %idxprom = sext i32 %6 to i64, !dbg !73
  %arrayidx = getelementptr inbounds [5 x i8*], [5 x i8*]* %cc, i64 0, i64 %idxprom, !dbg !73
  %7 = load i8*, i8** %arrayidx, align 8, !dbg !73
  %tobool = icmp ne i8* %7, null, !dbg !74
  br i1 %tobool, label %for.body, label %for.end, !dbg !74

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !75
  %idxprom1 = sext i32 %8 to i64, !dbg !76
  %arrayidx2 = getelementptr inbounds [5 x i8*], [5 x i8*]* %cc, i64 0, i64 %idxprom1, !dbg !76
  %9 = load i8*, i8** %arrayidx2, align 8, !dbg !76
  %10 = load i32, i32* %i, align 4, !dbg !77
  %idxprom3 = sext i32 %10 to i64, !dbg !78
  %arrayidx4 = getelementptr inbounds [5 x i8*], [5 x i8*]* %cc, i64 0, i64 %idxprom3, !dbg !78
  %11 = load i8*, i8** %arrayidx4, align 8, !dbg !78
  %call = call i32 @luhn(i8* %11), !dbg !79
  %tobool5 = icmp ne i32 %call, 0, !dbg !79
  %12 = zext i1 %tobool5 to i64, !dbg !79
  %cond = select i1 %tobool5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), !dbg !79
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0), i8* %9, i8* %cond), !dbg !80
  br label %for.inc, !dbg !80

for.inc:                                          ; preds = %for.body
  %13 = load i32, i32* %i, align 4, !dbg !81
  %inc = add nsw i32 %13, 1, !dbg !81
  store i32 %inc, i32* %i, align 4, !dbg !81
  br label %for.cond, !dbg !82, !llvm.loop !83

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !85
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

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
!1 = !DIFile(filename: "luhn-test-of-credit-card-numbers.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Luhn-test-of-credit-card-numbers")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "luhn", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "cc", arg: 1, scope: !7, file: !1, line: 4, type: !11)
!15 = !DILocation(line: 4, column: 22, scope: !7)
!16 = !DILocalVariable(name: "m", scope: !7, file: !1, line: 6, type: !17)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !19)
!18 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!19 = !{!20}
!20 = !DISubrange(count: 10)
!21 = !DILocation(line: 6, column: 12, scope: !7)
!22 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 7, type: !10)
!23 = !DILocation(line: 7, column: 6, scope: !7)
!24 = !DILocalVariable(name: "odd", scope: !7, file: !1, line: 7, type: !10)
!25 = !DILocation(line: 7, column: 9, scope: !7)
!26 = !DILocalVariable(name: "sum", scope: !7, file: !1, line: 7, type: !10)
!27 = !DILocation(line: 7, column: 18, scope: !7)
!28 = !DILocation(line: 9, column: 18, scope: !29)
!29 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 2)
!30 = !DILocation(line: 9, column: 11, scope: !29)
!31 = !DILocation(line: 9, column: 9, scope: !29)
!32 = !DILocation(line: 9, column: 7, scope: !29)
!33 = !DILocation(line: 9, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !29, file: !1, line: 9, column: 2)
!35 = !DILocation(line: 9, column: 2, scope: !29)
!36 = !DILocalVariable(name: "digit", scope: !37, file: !1, line: 10, type: !10)
!37 = distinct !DILexicalBlock(scope: !34, file: !1, line: 9, column: 40)
!38 = !DILocation(line: 10, column: 7, scope: !37)
!39 = !DILocation(line: 10, column: 15, scope: !37)
!40 = !DILocation(line: 10, column: 18, scope: !37)
!41 = !DILocation(line: 10, column: 21, scope: !37)
!42 = !DILocation(line: 11, column: 10, scope: !37)
!43 = !DILocation(line: 11, column: 16, scope: !37)
!44 = !DILocation(line: 11, column: 26, scope: !37)
!45 = !DILocation(line: 11, column: 24, scope: !37)
!46 = !DILocation(line: 11, column: 7, scope: !37)
!47 = !DILocation(line: 12, column: 2, scope: !37)
!48 = !DILocation(line: 9, column: 35, scope: !34)
!49 = !DILocation(line: 9, column: 34, scope: !34)
!50 = !DILocation(line: 9, column: 32, scope: !34)
!51 = !DILocation(line: 9, column: 2, scope: !34)
!52 = distinct !{!52, !35, !53}
!53 = !DILocation(line: 12, column: 2, scope: !29)
!54 = !DILocation(line: 14, column: 9, scope: !7)
!55 = !DILocation(line: 14, column: 13, scope: !7)
!56 = !DILocation(line: 14, column: 18, scope: !7)
!57 = !DILocation(line: 14, column: 2, scope: !7)
!58 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 17, type: !59, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!10}
!61 = !DILocalVariable(name: "cc", scope: !58, file: !1, line: 19, type: !62)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 5)
!65 = !DILocation(line: 19, column: 14, scope: !58)
!66 = !DILocalVariable(name: "i", scope: !58, file: !1, line: 26, type: !10)
!67 = !DILocation(line: 26, column: 6, scope: !58)
!68 = !DILocation(line: 28, column: 9, scope: !69)
!69 = distinct !DILexicalBlock(scope: !58, file: !1, line: 28, column: 2)
!70 = !DILocation(line: 28, column: 7, scope: !69)
!71 = !DILocation(line: 28, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !1, line: 28, column: 2)
!73 = !DILocation(line: 28, column: 14, scope: !72)
!74 = !DILocation(line: 28, column: 2, scope: !69)
!75 = !DILocation(line: 29, column: 27, scope: !72)
!76 = !DILocation(line: 29, column: 24, scope: !72)
!77 = !DILocation(line: 29, column: 39, scope: !72)
!78 = !DILocation(line: 29, column: 36, scope: !72)
!79 = !DILocation(line: 29, column: 31, scope: !72)
!80 = !DILocation(line: 29, column: 3, scope: !72)
!81 = !DILocation(line: 28, column: 22, scope: !72)
!82 = !DILocation(line: 28, column: 2, scope: !72)
!83 = distinct !{!83, !74, !84}
!84 = !DILocation(line: 29, column: 60, scope: !69)
!85 = !DILocation(line: 31, column: 2, scope: !58)
