; ModuleID = '100-doors-2.ll'
source_filename = "100-doors-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"door #%ld is %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"open\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"closed\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !7 {
entry:
  %is_open = alloca [100 x i32], align 16
  call void @llvm.dbg.value(metadata i32 %argc, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i8** %argv, metadata !16, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata [100 x i32]* %is_open, metadata !17, metadata !DIExpression()), !dbg !21
  %0 = bitcast [100 x i32]* %is_open to i8*, !dbg !21
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !21
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %is_open, i64 0, i64 0, !dbg !22
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay, i64 100, !dbg !23
  call void @llvm.dbg.value(metadata i32* %add.ptr, metadata !24, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 100, metadata !26, metadata !DIExpression()), !dbg !15
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc7, %entry
  %pass.0 = phi i32 [ 100, %entry ], [ %dec, %for.inc7 ], !dbg !29
  call void @llvm.dbg.value(metadata i32 %pass.0, metadata !26, metadata !DIExpression()), !dbg !15
  %tobool = icmp ne i32 %pass.0, 0, !dbg !30
  br i1 %tobool, label %for.body, label %for.end8, !dbg !30

for.body:                                         ; preds = %for.cond
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %is_open, i64 0, i64 0, !dbg !31
  %sub = sub nsw i32 %pass.0, 1, !dbg !35
  %idx.ext = sext i32 %sub to i64, !dbg !36
  %add.ptr2 = getelementptr inbounds i32, i32* %arraydecay1, i64 %idx.ext, !dbg !36
  call void @llvm.dbg.value(metadata i32* %add.ptr2, metadata !37, metadata !DIExpression()), !dbg !15
  br label %for.cond3, !dbg !38

for.cond3:                                        ; preds = %for.inc, %for.body
  %doorptr.0 = phi i32* [ %add.ptr2, %for.body ], [ %add.ptr6, %for.inc ], !dbg !39
  call void @llvm.dbg.value(metadata i32* %doorptr.0, metadata !37, metadata !DIExpression()), !dbg !15
  %cmp = icmp ult i32* %doorptr.0, %add.ptr, !dbg !40
  br i1 %cmp, label %for.body4, label %for.end, !dbg !42

for.body4:                                        ; preds = %for.cond3
  %1 = load i32, i32* %doorptr.0, align 4, !dbg !43
  %xor = xor i32 %1, 1, !dbg !43
  store i32 %xor, i32* %doorptr.0, align 4, !dbg !43
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body4
  %idx.ext5 = sext i32 %pass.0 to i64, !dbg !46
  %add.ptr6 = getelementptr inbounds i32, i32* %doorptr.0, i64 %idx.ext5, !dbg !46
  call void @llvm.dbg.value(metadata i32* %add.ptr6, metadata !37, metadata !DIExpression()), !dbg !15
  br label %for.cond3, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond3
  br label %for.inc7, !dbg !50

for.inc7:                                         ; preds = %for.end
  %dec = add nsw i32 %pass.0, -1, !dbg !51
  call void @llvm.dbg.value(metadata i32 %dec, metadata !26, metadata !DIExpression()), !dbg !15
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end8:                                         ; preds = %for.cond
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %is_open, i64 0, i64 0, !dbg !55
  call void @llvm.dbg.value(metadata i32* %arraydecay9, metadata !37, metadata !DIExpression()), !dbg !15
  br label %for.cond10, !dbg !57

for.cond10:                                       ; preds = %for.inc15, %for.end8
  %doorptr.1 = phi i32* [ %arraydecay9, %for.end8 ], [ %incdec.ptr, %for.inc15 ], !dbg !58
  call void @llvm.dbg.value(metadata i32* %doorptr.1, metadata !37, metadata !DIExpression()), !dbg !15
  %cmp11 = icmp ne i32* %doorptr.1, %add.ptr, !dbg !59
  br i1 %cmp11, label %for.body12, label %for.end16, !dbg !61

for.body12:                                       ; preds = %for.cond10
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %is_open, i64 0, i64 0, !dbg !62
  %sub.ptr.lhs.cast = ptrtoint i32* %doorptr.1 to i64, !dbg !64
  %sub.ptr.rhs.cast = ptrtoint i32* %arraydecay13 to i64, !dbg !64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !64
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 4, !dbg !64
  %add = add nsw i64 %sub.ptr.div, 1, !dbg !65
  %2 = load i32, i32* %doorptr.1, align 4, !dbg !66
  %tobool14 = icmp ne i32 %2, 0, !dbg !67
  %3 = zext i1 %tobool14 to i64, !dbg !67
  %cond = select i1 %tobool14, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), !dbg !67
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i64 0, i64 0), i64 %add, i8* %cond), !dbg !68
  br label %for.inc15, !dbg !69

for.inc15:                                        ; preds = %for.body12
  %incdec.ptr = getelementptr inbounds i32, i32* %doorptr.1, i32 1, !dbg !70
  call void @llvm.dbg.value(metadata i32* %incdec.ptr, metadata !37, metadata !DIExpression()), !dbg !15
  br label %for.cond10, !dbg !71, !llvm.loop !72

for.end16:                                        ; preds = %for.cond10
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!15 = !DILocation(line: 0, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 5, type: !11)
!17 = !DILocalVariable(name: "is_open", scope: !7, file: !1, line: 7, type: !18)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 3200, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 100)
!21 = !DILocation(line: 7, column: 7, scope: !7)
!22 = !DILocation(line: 8, column: 32, scope: !7)
!23 = !DILocation(line: 8, column: 40, scope: !7)
!24 = !DILocalVariable(name: "doorlimit", scope: !7, file: !1, line: 8, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!26 = !DILocalVariable(name: "pass", scope: !7, file: !1, line: 9, type: !10)
!27 = !DILocation(line: 12, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !7, file: !1, line: 12, column: 3)
!29 = !DILocation(line: 0, scope: !28)
!30 = !DILocation(line: 12, column: 3, scope: !28)
!31 = !DILocation(line: 13, column: 20, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !1, line: 13, column: 5)
!33 = distinct !DILexicalBlock(scope: !34, file: !1, line: 12, column: 48)
!34 = distinct !DILexicalBlock(scope: !28, file: !1, line: 12, column: 3)
!35 = !DILocation(line: 13, column: 36, scope: !32)
!36 = !DILocation(line: 13, column: 28, scope: !32)
!37 = !DILocalVariable(name: "doorptr", scope: !7, file: !1, line: 8, type: !25)
!38 = !DILocation(line: 13, column: 11, scope: !32)
!39 = !DILocation(line: 0, scope: !32)
!40 = !DILocation(line: 13, column: 52, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !1, line: 13, column: 5)
!42 = !DILocation(line: 13, column: 5, scope: !32)
!43 = !DILocation(line: 14, column: 21, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !1, line: 13, column: 86)
!45 = !DILocation(line: 15, column: 5, scope: !44)
!46 = !DILocation(line: 13, column: 76, scope: !41)
!47 = !DILocation(line: 13, column: 5, scope: !41)
!48 = distinct !{!48, !42, !49}
!49 = !DILocation(line: 15, column: 5, scope: !32)
!50 = !DILocation(line: 16, column: 3, scope: !33)
!51 = !DILocation(line: 12, column: 38, scope: !34)
!52 = !DILocation(line: 12, column: 3, scope: !34)
!53 = distinct !{!53, !30, !54}
!54 = !DILocation(line: 16, column: 3, scope: !28)
!55 = !DILocation(line: 19, column: 18, scope: !56)
!56 = distinct !DILexicalBlock(scope: !7, file: !1, line: 19, column: 3)
!57 = !DILocation(line: 19, column: 9, scope: !56)
!58 = !DILocation(line: 0, scope: !56)
!59 = !DILocation(line: 19, column: 38, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !1, line: 19, column: 3)
!61 = !DILocation(line: 19, column: 3, scope: !56)
!62 = !DILocation(line: 20, column: 45, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !1, line: 19, column: 68)
!64 = !DILocation(line: 20, column: 43, scope: !63)
!65 = !DILocation(line: 20, column: 55, scope: !63)
!66 = !DILocation(line: 20, column: 62, scope: !63)
!67 = !DILocation(line: 20, column: 60, scope: !63)
!68 = !DILocation(line: 20, column: 5, scope: !63)
!69 = !DILocation(line: 21, column: 3, scope: !63)
!70 = !DILocation(line: 19, column: 55, scope: !60)
!71 = !DILocation(line: 19, column: 3, scope: !60)
!72 = distinct !{!72, !61, !73}
!73 = !DILocation(line: 21, column: 3, scope: !56)
!74 = !DILocation(line: 22, column: 1, scope: !7)
