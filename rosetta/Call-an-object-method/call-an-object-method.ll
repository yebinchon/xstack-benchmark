; ModuleID = 'call-an-object-method.bc'
source_filename = "call-an-object-method.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.functionPair = type { i32, i32 (i32)* }

@.str = private unnamed_addr constant [34 x i8] c"Usage : %s <non negative integer>\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"\0AFactorial of %d is %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @factorial(i32 %num) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %num.addr = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !11, metadata !DIExpression()), !dbg !12
  %0 = load i32, i32* %num.addr, align 4, !dbg !13
  %cmp = icmp eq i32 %0, 0, !dbg !15
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !16

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %num.addr, align 4, !dbg !17
  %cmp1 = icmp eq i32 %1, 1, !dbg !18
  br i1 %cmp1, label %if.then, label %if.else, !dbg !19

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 1, i32* %retval, align 4, !dbg !20
  br label %return, !dbg !20

if.else:                                          ; preds = %lor.lhs.false
  %2 = load i32, i32* %num.addr, align 4, !dbg !21
  %3 = load i32, i32* %num.addr, align 4, !dbg !22
  %sub = sub nsw i32 %3, 1, !dbg !23
  %call = call i32 @factorial(i32 %sub), !dbg !24
  %mul = mul nsw i32 %2, %call, !dbg !25
  store i32 %mul, i32* %retval, align 4, !dbg !26
  br label %return, !dbg !26

return:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %retval, align 4, !dbg !27
  ret i32 %4, !dbg !27
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !28 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %response = alloca %struct.functionPair, align 8
  %.compoundliteral = alloca %struct.functionPair, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !34, metadata !DIExpression()), !dbg !35
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata %struct.functionPair* %response, metadata !38, metadata !DIExpression()), !dbg !45
  %0 = load i32, i32* %argc.addr, align 4, !dbg !46
  %cmp = icmp ne i32 %0, 2, !dbg !48
  br i1 %cmp, label %if.then, label %if.else, !dbg !49

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 0, !dbg !50
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !50
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0), i8* %2), !dbg !51
  store i32 %call, i32* %retval, align 4, !dbg !52
  br label %return, !dbg !52

if.else:                                          ; preds = %entry
  %x = getelementptr inbounds %struct.functionPair, %struct.functionPair* %.compoundliteral, i32 0, i32 0, !dbg !53
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !55
  %arrayidx1 = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !55
  %4 = load i8*, i8** %arrayidx1, align 8, !dbg !55
  %call2 = call i32 @atoi(i8* %4) #5, !dbg !56
  store i32 %call2, i32* %x, align 8, !dbg !53
  %funcPtr = getelementptr inbounds %struct.functionPair, %struct.functionPair* %.compoundliteral, i32 0, i32 1, !dbg !53
  store i32 (i32)* @factorial, i32 (i32)** %funcPtr, align 8, !dbg !53
  %5 = bitcast %struct.functionPair* %response to i8*, !dbg !57
  %6 = bitcast %struct.functionPair* %.compoundliteral to i8*, !dbg !57
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %5, i8* align 8 %6, i64 16, i1 false), !dbg !57
  %x3 = getelementptr inbounds %struct.functionPair, %struct.functionPair* %response, i32 0, i32 0, !dbg !58
  %7 = load i32, i32* %x3, align 8, !dbg !58
  %funcPtr4 = getelementptr inbounds %struct.functionPair, %struct.functionPair* %response, i32 0, i32 1, !dbg !59
  %8 = load i32 (i32)*, i32 (i32)** %funcPtr4, align 8, !dbg !59
  %x5 = getelementptr inbounds %struct.functionPair, %struct.functionPair* %response, i32 0, i32 0, !dbg !60
  %9 = load i32, i32* %x5, align 8, !dbg !60
  %call6 = call i32 %8(i32 %9), !dbg !61
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i64 0, i64 0), i32 %7, i32 %call6), !dbg !62
  br label %if.end

if.end:                                           ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !63
  br label %return, !dbg !63

return:                                           ; preds = %if.end, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !64
  ret i32 %10, !dbg !64
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

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
!12 = !DILocation(line: 9, column: 19, scope: !7)
!13 = !DILocation(line: 10, column: 12, scope: !14)
!14 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 12)
!15 = !DILocation(line: 10, column: 15, scope: !14)
!16 = !DILocation(line: 10, column: 18, scope: !14)
!17 = !DILocation(line: 10, column: 20, scope: !14)
!18 = !DILocation(line: 10, column: 23, scope: !14)
!19 = !DILocation(line: 10, column: 12, scope: !7)
!20 = !DILocation(line: 11, column: 17, scope: !14)
!21 = !DILocation(line: 13, column: 24, scope: !14)
!22 = !DILocation(line: 13, column: 38, scope: !14)
!23 = !DILocation(line: 13, column: 41, scope: !14)
!24 = !DILocation(line: 13, column: 28, scope: !14)
!25 = !DILocation(line: 13, column: 27, scope: !14)
!26 = !DILocation(line: 13, column: 17, scope: !14)
!27 = !DILocation(line: 14, column: 1, scope: !7)
!28 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 16, type: !29, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{!10, !10, !31}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!34 = !DILocalVariable(name: "argc", arg: 1, scope: !28, file: !1, line: 16, type: !10)
!35 = !DILocation(line: 16, column: 14, scope: !28)
!36 = !DILocalVariable(name: "argv", arg: 2, scope: !28, file: !1, line: 16, type: !31)
!37 = !DILocation(line: 16, column: 26, scope: !28)
!38 = !DILocalVariable(name: "response", scope: !28, file: !1, line: 18, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "functionPair", file: !1, line: 7, baseType: !40)
!40 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 4, size: 128, elements: !41)
!41 = !{!42, !43}
!42 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !40, file: !1, line: 5, baseType: !10, size: 32)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "funcPtr", scope: !40, file: !1, line: 6, baseType: !44, size: 64, offset: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!45 = !DILocation(line: 18, column: 22, scope: !28)
!46 = !DILocation(line: 20, column: 12, scope: !47)
!47 = distinct !DILexicalBlock(scope: !28, file: !1, line: 20, column: 12)
!48 = !DILocation(line: 20, column: 16, scope: !47)
!49 = !DILocation(line: 20, column: 12, scope: !28)
!50 = !DILocation(line: 21, column: 67, scope: !47)
!51 = !DILocation(line: 21, column: 24, scope: !47)
!52 = !DILocation(line: 21, column: 17, scope: !47)
!53 = !DILocation(line: 23, column: 42, scope: !54)
!54 = distinct !DILexicalBlock(scope: !47, file: !1, line: 22, column: 13)
!55 = !DILocation(line: 23, column: 53, scope: !54)
!56 = !DILocation(line: 23, column: 48, scope: !54)
!57 = !DILocation(line: 23, column: 28, scope: !54)
!58 = !DILocation(line: 24, column: 61, scope: !54)
!59 = !DILocation(line: 24, column: 72, scope: !54)
!60 = !DILocation(line: 24, column: 89, scope: !54)
!61 = !DILocation(line: 24, column: 63, scope: !54)
!62 = !DILocation(line: 24, column: 17, scope: !54)
!63 = !DILocation(line: 26, column: 9, scope: !28)
!64 = !DILocation(line: 27, column: 1, scope: !28)
