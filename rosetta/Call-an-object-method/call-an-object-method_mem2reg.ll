; ModuleID = 'call-an-object-method.ll'
source_filename = "call-an-object-method.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.functionPair = type { i32, i32 (i32)* }

@.str = private unnamed_addr constant [34 x i8] c"Usage : %s <non negative integer>\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"\0AFactorial of %d is %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @factorial(i32 %num) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %num, metadata !11, metadata !DIExpression()), !dbg !12
  %cmp = icmp eq i32 %num, 0, !dbg !13
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !15

lor.lhs.false:                                    ; preds = %entry
  %cmp1 = icmp eq i32 %num, 1, !dbg !16
  br i1 %cmp1, label %if.then, label %if.else, !dbg !17

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return, !dbg !18

if.else:                                          ; preds = %lor.lhs.false
  %sub = sub nsw i32 %num, 1, !dbg !19
  %call = call i32 @factorial(i32 %sub), !dbg !20
  %mul = mul nsw i32 %num, %call, !dbg !21
  br label %return, !dbg !22

return:                                           ; preds = %if.else, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ %mul, %if.else ], !dbg !23
  ret i32 %retval.0, !dbg !24
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !25 {
entry:
  %response = alloca %struct.functionPair, align 8
  %.compoundliteral = alloca %struct.functionPair, align 8
  call void @llvm.dbg.value(metadata i32 %argc, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.value(metadata i8** %argv, metadata !33, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata %struct.functionPair* %response, metadata !34, metadata !DIExpression()), !dbg !41
  %cmp = icmp ne i32 %argc, 2, !dbg !42
  br i1 %cmp, label %if.then, label %if.else, !dbg !44

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 0, !dbg !45
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !45
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0), i8* %0), !dbg !46
  br label %return, !dbg !47

if.else:                                          ; preds = %entry
  %x = getelementptr inbounds %struct.functionPair, %struct.functionPair* %.compoundliteral, i32 0, i32 0, !dbg !48
  %arrayidx1 = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !50
  %1 = load i8*, i8** %arrayidx1, align 8, !dbg !50
  %call2 = call i32 @atoi(i8* %1) #5, !dbg !51
  store i32 %call2, i32* %x, align 8, !dbg !48
  %funcPtr = getelementptr inbounds %struct.functionPair, %struct.functionPair* %.compoundliteral, i32 0, i32 1, !dbg !48
  store i32 (i32)* @factorial, i32 (i32)** %funcPtr, align 8, !dbg !48
  %2 = bitcast %struct.functionPair* %response to i8*, !dbg !52
  %3 = bitcast %struct.functionPair* %.compoundliteral to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 8 %3, i64 16, i1 false), !dbg !52
  %x3 = getelementptr inbounds %struct.functionPair, %struct.functionPair* %response, i32 0, i32 0, !dbg !53
  %4 = load i32, i32* %x3, align 8, !dbg !53
  %funcPtr4 = getelementptr inbounds %struct.functionPair, %struct.functionPair* %response, i32 0, i32 1, !dbg !54
  %5 = load i32 (i32)*, i32 (i32)** %funcPtr4, align 8, !dbg !54
  %x5 = getelementptr inbounds %struct.functionPair, %struct.functionPair* %response, i32 0, i32 0, !dbg !55
  %6 = load i32, i32* %x5, align 8, !dbg !55
  %call6 = call i32 %5(i32 %6), !dbg !56
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i64 0, i64 0), i32 %4, i32 %call6), !dbg !57
  br label %if.end

if.end:                                           ; preds = %if.else
  br label %return, !dbg !58

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ %call, %if.then ], [ 0, %if.end ], !dbg !32
  ret i32 %retval.0, !dbg !59
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "call-an-object-method.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Call-an-object-method")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "factorial", scope: !1, file: !1, line: 9, type: !8, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "num", arg: 1, scope: !7, file: !1, line: 9, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocation(line: 10, column: 15, scope: !14)
!14 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 12)
!15 = !DILocation(line: 10, column: 18, scope: !14)
!16 = !DILocation(line: 10, column: 23, scope: !14)
!17 = !DILocation(line: 10, column: 12, scope: !7)
!18 = !DILocation(line: 11, column: 17, scope: !14)
!19 = !DILocation(line: 13, column: 41, scope: !14)
!20 = !DILocation(line: 13, column: 28, scope: !14)
!21 = !DILocation(line: 13, column: 27, scope: !14)
!22 = !DILocation(line: 13, column: 17, scope: !14)
!23 = !DILocation(line: 0, scope: !14)
!24 = !DILocation(line: 14, column: 1, scope: !7)
!25 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 16, type: !26, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{!10, !10, !28}
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!31 = !DILocalVariable(name: "argc", arg: 1, scope: !25, file: !1, line: 16, type: !10)
!32 = !DILocation(line: 0, scope: !25)
!33 = !DILocalVariable(name: "argv", arg: 2, scope: !25, file: !1, line: 16, type: !28)
!34 = !DILocalVariable(name: "response", scope: !25, file: !1, line: 18, type: !35)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "functionPair", file: !1, line: 7, baseType: !36)
!36 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 4, size: 128, elements: !37)
!37 = !{!38, !39}
!38 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !36, file: !1, line: 5, baseType: !10, size: 32)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "funcPtr", scope: !36, file: !1, line: 6, baseType: !40, size: 64, offset: 64)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!41 = !DILocation(line: 18, column: 22, scope: !25)
!42 = !DILocation(line: 20, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !25, file: !1, line: 20, column: 12)
!44 = !DILocation(line: 20, column: 12, scope: !25)
!45 = !DILocation(line: 21, column: 67, scope: !43)
!46 = !DILocation(line: 21, column: 24, scope: !43)
!47 = !DILocation(line: 21, column: 17, scope: !43)
!48 = !DILocation(line: 23, column: 42, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !1, line: 22, column: 13)
!50 = !DILocation(line: 23, column: 53, scope: !49)
!51 = !DILocation(line: 23, column: 48, scope: !49)
!52 = !DILocation(line: 23, column: 28, scope: !49)
!53 = !DILocation(line: 24, column: 61, scope: !49)
!54 = !DILocation(line: 24, column: 72, scope: !49)
!55 = !DILocation(line: 24, column: 89, scope: !49)
!56 = !DILocation(line: 24, column: 63, scope: !49)
!57 = !DILocation(line: 24, column: 17, scope: !49)
!58 = !DILocation(line: 26, column: 9, scope: !25)
!59 = !DILocation(line: 27, column: 1, scope: !25)
