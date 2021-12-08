; ModuleID = '100-doors-2.bc'
source_filename = "100-doors-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"door #%ld is %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"open\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"closed\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %is_open = alloca [100 x i32], align 16
  %doorptr = alloca i32*, align 8
  %doorlimit = alloca i32*, align 8
  %pass = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata [100 x i32]* %is_open, metadata !18, metadata !DIExpression()), !dbg !22
  %0 = bitcast [100 x i32]* %is_open to i8*, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %doorptr, metadata !23, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %doorlimit, metadata !26, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %is_open, i64 0, i64 0, !dbg !28
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay, i64 100, !dbg !29
  store i32* %add.ptr, i32** %doorlimit, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32* %pass, metadata !30, metadata !DIExpression()), !dbg !31
  store i32 100, i32* %pass, align 4, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc7, %entry
  %1 = load i32, i32* %pass, align 4, !dbg !35
  %tobool = icmp ne i32 %1, 0, !dbg !37
  br i1 %tobool, label %for.body, label %for.end8, !dbg !37

for.body:                                         ; preds = %for.cond
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %is_open, i64 0, i64 0, !dbg !38
  %2 = load i32, i32* %pass, align 4, !dbg !41
  %sub = sub nsw i32 %2, 1, !dbg !42
  %idx.ext = sext i32 %sub to i64, !dbg !43
  %add.ptr2 = getelementptr inbounds i32, i32* %arraydecay1, i64 %idx.ext, !dbg !43
  store i32* %add.ptr2, i32** %doorptr, align 8, !dbg !44
  br label %for.cond3, !dbg !45

for.cond3:                                        ; preds = %for.inc, %for.body
  %3 = load i32*, i32** %doorptr, align 8, !dbg !46
  %4 = load i32*, i32** %doorlimit, align 8, !dbg !48
  %cmp = icmp ult i32* %3, %4, !dbg !49
  br i1 %cmp, label %for.body4, label %for.end, !dbg !50

for.body4:                                        ; preds = %for.cond3
  %5 = load i32*, i32** %doorptr, align 8, !dbg !51
  %6 = load i32, i32* %5, align 4, !dbg !53
  %xor = xor i32 %6, 1, !dbg !53
  store i32 %xor, i32* %5, align 4, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body4
  %7 = load i32, i32* %pass, align 4, !dbg !55
  %8 = load i32*, i32** %doorptr, align 8, !dbg !56
  %idx.ext5 = sext i32 %7 to i64, !dbg !56
  %add.ptr6 = getelementptr inbounds i32, i32* %8, i64 %idx.ext5, !dbg !56
  store i32* %add.ptr6, i32** %doorptr, align 8, !dbg !56
  br label %for.cond3, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond3
  br label %for.inc7, !dbg !60

for.inc7:                                         ; preds = %for.end
  %9 = load i32, i32* %pass, align 4, !dbg !61
  %dec = add nsw i32 %9, -1, !dbg !61
  store i32 %dec, i32* %pass, align 4, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end8:                                         ; preds = %for.cond
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %is_open, i64 0, i64 0, !dbg !65
  store i32* %arraydecay9, i32** %doorptr, align 8, !dbg !67
  br label %for.cond10, !dbg !68

for.cond10:                                       ; preds = %for.inc15, %for.end8
  %10 = load i32*, i32** %doorptr, align 8, !dbg !69
  %11 = load i32*, i32** %doorlimit, align 8, !dbg !71
  %cmp11 = icmp ne i32* %10, %11, !dbg !72
  br i1 %cmp11, label %for.body12, label %for.end16, !dbg !73

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %doorptr, align 8, !dbg !74
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %is_open, i64 0, i64 0, !dbg !76
  %sub.ptr.lhs.cast = ptrtoint i32* %12 to i64, !dbg !77
  %sub.ptr.rhs.cast = ptrtoint i32* %arraydecay13 to i64, !dbg !77
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !77
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 4, !dbg !77
  %add = add nsw i64 %sub.ptr.div, 1, !dbg !78
  %13 = load i32*, i32** %doorptr, align 8, !dbg !79
  %14 = load i32, i32* %13, align 4, !dbg !80
  %tobool14 = icmp ne i32 %14, 0, !dbg !81
  %15 = zext i1 %tobool14 to i64, !dbg !81
  %cond = select i1 %tobool14, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), !dbg !81
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i64 0, i64 0), i64 %add, i8* %cond), !dbg !82
  br label %for.inc15, !dbg !83

for.inc15:                                        ; preds = %for.body12
  %16 = load i32*, i32** %doorptr, align 8, !dbg !84
  %incdec.ptr = getelementptr inbounds i32, i32* %16, i32 1, !dbg !84
  store i32* %incdec.ptr, i32** %doorptr, align 8, !dbg !84
  br label %for.cond10, !dbg !85, !llvm.loop !86

for.end16:                                        ; preds = %for.cond10
  %17 = load i32, i32* %retval, align 4, !dbg !88
  ret i32 %17, !dbg !88
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "100-doors-2.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/100-doors-2")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 5, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "argc", arg: 1, scope: !7, file: !1, line: 5, type: !10)
!15 = !DILocation(line: 5, column: 14, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 5, type: !11)
!17 = !DILocation(line: 5, column: 26, scope: !7)
!18 = !DILocalVariable(name: "is_open", scope: !7, file: !1, line: 7, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 3200, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 100)
!22 = !DILocation(line: 7, column: 7, scope: !7)
!23 = !DILocalVariable(name: "doorptr", scope: !7, file: !1, line: 8, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!25 = !DILocation(line: 8, column: 9, scope: !7)
!26 = !DILocalVariable(name: "doorlimit", scope: !7, file: !1, line: 8, type: !24)
!27 = !DILocation(line: 8, column: 20, scope: !7)
!28 = !DILocation(line: 8, column: 32, scope: !7)
!29 = !DILocation(line: 8, column: 40, scope: !7)
!30 = !DILocalVariable(name: "pass", scope: !7, file: !1, line: 9, type: !10)
!31 = !DILocation(line: 9, column: 7, scope: !7)
!32 = !DILocation(line: 12, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !7, file: !1, line: 12, column: 3)
!34 = !DILocation(line: 12, column: 9, scope: !33)
!35 = !DILocation(line: 12, column: 29, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !1, line: 12, column: 3)
!37 = !DILocation(line: 12, column: 3, scope: !33)
!38 = !DILocation(line: 13, column: 20, scope: !39)
!39 = distinct !DILexicalBlock(scope: !40, file: !1, line: 13, column: 5)
!40 = distinct !DILexicalBlock(scope: !36, file: !1, line: 12, column: 48)
!41 = !DILocation(line: 13, column: 32, scope: !39)
!42 = !DILocation(line: 13, column: 36, scope: !39)
!43 = !DILocation(line: 13, column: 28, scope: !39)
!44 = !DILocation(line: 13, column: 18, scope: !39)
!45 = !DILocation(line: 13, column: 11, scope: !39)
!46 = !DILocation(line: 13, column: 44, scope: !47)
!47 = distinct !DILexicalBlock(scope: !39, file: !1, line: 13, column: 5)
!48 = !DILocation(line: 13, column: 54, scope: !47)
!49 = !DILocation(line: 13, column: 52, scope: !47)
!50 = !DILocation(line: 13, column: 5, scope: !39)
!51 = !DILocation(line: 14, column: 11, scope: !52)
!52 = distinct !DILexicalBlock(scope: !47, file: !1, line: 13, column: 86)
!53 = !DILocation(line: 14, column: 21, scope: !52)
!54 = !DILocation(line: 15, column: 5, scope: !52)
!55 = !DILocation(line: 13, column: 79, scope: !47)
!56 = !DILocation(line: 13, column: 76, scope: !47)
!57 = !DILocation(line: 13, column: 5, scope: !47)
!58 = distinct !{!58, !50, !59}
!59 = !DILocation(line: 15, column: 5, scope: !39)
!60 = !DILocation(line: 16, column: 3, scope: !40)
!61 = !DILocation(line: 12, column: 38, scope: !36)
!62 = !DILocation(line: 12, column: 3, scope: !36)
!63 = distinct !{!63, !37, !64}
!64 = !DILocation(line: 16, column: 3, scope: !33)
!65 = !DILocation(line: 19, column: 18, scope: !66)
!66 = distinct !DILexicalBlock(scope: !7, file: !1, line: 19, column: 3)
!67 = !DILocation(line: 19, column: 16, scope: !66)
!68 = !DILocation(line: 19, column: 9, scope: !66)
!69 = !DILocation(line: 19, column: 30, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !1, line: 19, column: 3)
!71 = !DILocation(line: 19, column: 41, scope: !70)
!72 = !DILocation(line: 19, column: 38, scope: !70)
!73 = !DILocation(line: 19, column: 3, scope: !66)
!74 = !DILocation(line: 20, column: 35, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !1, line: 19, column: 68)
!76 = !DILocation(line: 20, column: 45, scope: !75)
!77 = !DILocation(line: 20, column: 43, scope: !75)
!78 = !DILocation(line: 20, column: 55, scope: !75)
!79 = !DILocation(line: 20, column: 64, scope: !75)
!80 = !DILocation(line: 20, column: 62, scope: !75)
!81 = !DILocation(line: 20, column: 60, scope: !75)
!82 = !DILocation(line: 20, column: 5, scope: !75)
!83 = !DILocation(line: 21, column: 3, scope: !75)
!84 = !DILocation(line: 19, column: 55, scope: !70)
!85 = !DILocation(line: 19, column: 3, scope: !70)
!86 = distinct !{!86, !73, !87}
!87 = !DILocation(line: 21, column: 3, scope: !66)
!88 = !DILocation(line: 22, column: 1, scope: !7)
