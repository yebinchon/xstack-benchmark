; ModuleID = 'caesar-cipher.bc'
source_filename = "caesar-cipher.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [27 x i8] c"abcdefghijklmnopqrstuvwxyz\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZ\00", align 1
@__const.rot.alpha = private unnamed_addr constant [2 x i8*] [i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i32 0, i32 0)], align 16
@__const.main.str = private unnamed_addr constant [35 x i8] c"This is a top secret text message!\00", align 16
@.str.2 = private unnamed_addr constant [14 x i8] c"Original: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Encrypted: %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Decrypted: %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @rot(i32 %c, i8* %str) #0 !dbg !26 {
entry:
  %c.addr = alloca i32, align 4
  %str.addr = alloca i8*, align 8
  %l = alloca i32, align 4
  %alpha = alloca [2 x i8*], align 16
  %i = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !32, metadata !DIExpression()), !dbg !33
  store i8* %str, i8** %str.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %str.addr, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %l, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load i8*, i8** %str.addr, align 8, !dbg !38
  %call = call i64 @strlen(i8* %0) #6, !dbg !39
  %conv = trunc i64 %call to i32, !dbg !39
  store i32 %conv, i32* %l, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata [2 x i8*]* %alpha, metadata !40, metadata !DIExpression()), !dbg !46
  %1 = bitcast [2 x i8*]* %alpha to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([2 x i8*]* @__const.rot.alpha to i8*), i64 16, i1 false), !dbg !46
  call void @llvm.dbg.declare(metadata i32* %i, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 0, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !52
  %3 = load i32, i32* %l, align 4, !dbg !54
  %cmp = icmp slt i32 %2, %3, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %call2 = call i16** @__ctype_b_loc() #7, !dbg !57
  %4 = load i16*, i16** %call2, align 8, !dbg !57
  %5 = load i8*, i8** %str.addr, align 8, !dbg !57
  %6 = load i32, i32* %i, align 4, !dbg !57
  %idxprom = sext i32 %6 to i64, !dbg !57
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %idxprom, !dbg !57
  %7 = load i8, i8* %arrayidx, align 1, !dbg !57
  %conv3 = sext i8 %7 to i32, !dbg !57
  %idxprom4 = sext i32 %conv3 to i64, !dbg !57
  %arrayidx5 = getelementptr inbounds i16, i16* %4, i64 %idxprom4, !dbg !57
  %8 = load i16, i16* %arrayidx5, align 2, !dbg !57
  %conv6 = zext i16 %8 to i32, !dbg !57
  %and = and i32 %conv6, 1024, !dbg !57
  %tobool = icmp ne i32 %and, 0, !dbg !57
  br i1 %tobool, label %if.end, label %if.then, !dbg !60

if.then:                                          ; preds = %for.body
  br label %for.inc, !dbg !61

if.end:                                           ; preds = %for.body
  %call7 = call i16** @__ctype_b_loc() #7, !dbg !62
  %9 = load i16*, i16** %call7, align 8, !dbg !62
  %10 = load i8*, i8** %str.addr, align 8, !dbg !62
  %11 = load i32, i32* %i, align 4, !dbg !62
  %idxprom8 = sext i32 %11 to i64, !dbg !62
  %arrayidx9 = getelementptr inbounds i8, i8* %10, i64 %idxprom8, !dbg !62
  %12 = load i8, i8* %arrayidx9, align 1, !dbg !62
  %conv10 = sext i8 %12 to i32, !dbg !62
  %idxprom11 = sext i32 %conv10 to i64, !dbg !62
  %arrayidx12 = getelementptr inbounds i16, i16* %9, i64 %idxprom11, !dbg !62
  %13 = load i16, i16* %arrayidx12, align 2, !dbg !62
  %conv13 = zext i16 %13 to i32, !dbg !62
  %and14 = and i32 %conv13, 256, !dbg !62
  %tobool15 = icmp ne i32 %and14, 0, !dbg !62
  br i1 %tobool15, label %if.then16, label %if.else, !dbg !64

if.then16:                                        ; preds = %if.end
  %arrayidx17 = getelementptr inbounds [2 x i8*], [2 x i8*]* %alpha, i64 0, i64 1, !dbg !65
  %14 = load i8*, i8** %arrayidx17, align 8, !dbg !65
  %15 = load i8*, i8** %str.addr, align 8, !dbg !66
  %16 = load i32, i32* %i, align 4, !dbg !67
  %idxprom18 = sext i32 %16 to i64, !dbg !66
  %arrayidx19 = getelementptr inbounds i8, i8* %15, i64 %idxprom18, !dbg !66
  %17 = load i8, i8* %arrayidx19, align 1, !dbg !66
  %conv20 = sext i8 %17 to i32, !dbg !66
  %call21 = call i32 @tolower(i32 %conv20) #6, !dbg !68
  %sub = sub nsw i32 %call21, 97, !dbg !69
  %18 = load i32, i32* %c.addr, align 4, !dbg !70
  %add = add nsw i32 %sub, %18, !dbg !71
  %rem = srem i32 %add, 26, !dbg !72
  %idxprom22 = sext i32 %rem to i64, !dbg !65
  %arrayidx23 = getelementptr inbounds i8, i8* %14, i64 %idxprom22, !dbg !65
  %19 = load i8, i8* %arrayidx23, align 1, !dbg !65
  %20 = load i8*, i8** %str.addr, align 8, !dbg !73
  %21 = load i32, i32* %i, align 4, !dbg !74
  %idxprom24 = sext i32 %21 to i64, !dbg !73
  %arrayidx25 = getelementptr inbounds i8, i8* %20, i64 %idxprom24, !dbg !73
  store i8 %19, i8* %arrayidx25, align 1, !dbg !75
  br label %if.end38, !dbg !73

if.else:                                          ; preds = %if.end
  %arrayidx26 = getelementptr inbounds [2 x i8*], [2 x i8*]* %alpha, i64 0, i64 0, !dbg !76
  %22 = load i8*, i8** %arrayidx26, align 16, !dbg !76
  %23 = load i8*, i8** %str.addr, align 8, !dbg !77
  %24 = load i32, i32* %i, align 4, !dbg !78
  %idxprom27 = sext i32 %24 to i64, !dbg !77
  %arrayidx28 = getelementptr inbounds i8, i8* %23, i64 %idxprom27, !dbg !77
  %25 = load i8, i8* %arrayidx28, align 1, !dbg !77
  %conv29 = sext i8 %25 to i32, !dbg !77
  %call30 = call i32 @tolower(i32 %conv29) #6, !dbg !79
  %sub31 = sub nsw i32 %call30, 97, !dbg !80
  %26 = load i32, i32* %c.addr, align 4, !dbg !81
  %add32 = add nsw i32 %sub31, %26, !dbg !82
  %rem33 = srem i32 %add32, 26, !dbg !83
  %idxprom34 = sext i32 %rem33 to i64, !dbg !76
  %arrayidx35 = getelementptr inbounds i8, i8* %22, i64 %idxprom34, !dbg !76
  %27 = load i8, i8* %arrayidx35, align 1, !dbg !76
  %28 = load i8*, i8** %str.addr, align 8, !dbg !84
  %29 = load i32, i32* %i, align 4, !dbg !85
  %idxprom36 = sext i32 %29 to i64, !dbg !84
  %arrayidx37 = getelementptr inbounds i8, i8* %28, i64 %idxprom36, !dbg !84
  store i8 %27, i8* %arrayidx37, align 1, !dbg !86
  br label %if.end38

if.end38:                                         ; preds = %if.else, %if.then16
  br label %for.inc, !dbg !87

for.inc:                                          ; preds = %if.end38, %if.then
  %30 = load i32, i32* %i, align 4, !dbg !88
  %inc = add nsw i32 %30, 1, !dbg !88
  store i32 %inc, i32* %i, align 4, !dbg !88
  br label %for.cond, !dbg !89, !llvm.loop !90

for.end:                                          ; preds = %for.cond
  ret void, !dbg !92
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind readnone
declare dso_local i16** @__ctype_b_loc() #4

; Function Attrs: nounwind readonly
declare dso_local i32 @tolower(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %str = alloca [35 x i8], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [35 x i8]* %str, metadata !96, metadata !DIExpression()), !dbg !100
  %0 = bitcast [35 x i8]* %str to i8*, !dbg !100
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 getelementptr inbounds ([35 x i8], [35 x i8]* @__const.main.str, i32 0, i32 0), i64 35, i1 false), !dbg !100
  %arraydecay = getelementptr inbounds [35 x i8], [35 x i8]* %str, i64 0, i64 0, !dbg !101
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0), i8* %arraydecay), !dbg !102
  %arraydecay1 = getelementptr inbounds [35 x i8], [35 x i8]* %str, i64 0, i64 0, !dbg !103
  call void @rot(i32 13, i8* %arraydecay1), !dbg !103
  %arraydecay2 = getelementptr inbounds [35 x i8], [35 x i8]* %str, i64 0, i64 0, !dbg !104
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0), i8* %arraydecay2), !dbg !105
  %arraydecay4 = getelementptr inbounds [35 x i8], [35 x i8]* %str, i64 0, i64 0, !dbg !106
  call void @rot(i32 13, i8* %arraydecay4), !dbg !106
  %arraydecay5 = getelementptr inbounds [35 x i8], [35 x i8]* %str, i64 0, i64 0, !dbg !107
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i8* %arraydecay5), !dbg !108
  ret i32 0, !dbg !109
}

declare dso_local i32 @printf(i8*, ...) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly }
attributes #7 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23, !24}
!llvm.ident = !{!25}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !19, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "caesar-cipher.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Caesar-cipher")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !4, line: 46, baseType: !5, size: 32, elements: !6)
!4 = !DIFile(filename: "/usr/include/ctype.h", directory: "")
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18}
!7 = !DIEnumerator(name: "_ISupper", value: 256, isUnsigned: true)
!8 = !DIEnumerator(name: "_ISlower", value: 512, isUnsigned: true)
!9 = !DIEnumerator(name: "_ISalpha", value: 1024, isUnsigned: true)
!10 = !DIEnumerator(name: "_ISdigit", value: 2048, isUnsigned: true)
!11 = !DIEnumerator(name: "_ISxdigit", value: 4096, isUnsigned: true)
!12 = !DIEnumerator(name: "_ISspace", value: 8192, isUnsigned: true)
!13 = !DIEnumerator(name: "_ISprint", value: 16384, isUnsigned: true)
!14 = !DIEnumerator(name: "_ISgraph", value: 32768, isUnsigned: true)
!15 = !DIEnumerator(name: "_ISblank", value: 1, isUnsigned: true)
!16 = !DIEnumerator(name: "_IScntrl", value: 2, isUnsigned: true)
!17 = !DIEnumerator(name: "_ISpunct", value: 4, isUnsigned: true)
!18 = !DIEnumerator(name: "_ISalnum", value: 8, isUnsigned: true)
!19 = !{!20, !21}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!22 = !{i32 7, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!26 = distinct !DISubprogram(name: "rot", scope: !1, file: !1, line: 10, type: !27, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !31)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !20, !29}
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!31 = !{}
!32 = !DILocalVariable(name: "c", arg: 1, scope: !26, file: !1, line: 10, type: !20)
!33 = !DILocation(line: 10, column: 14, scope: !26)
!34 = !DILocalVariable(name: "str", arg: 2, scope: !26, file: !1, line: 10, type: !29)
!35 = !DILocation(line: 10, column: 23, scope: !26)
!36 = !DILocalVariable(name: "l", scope: !26, file: !1, line: 12, type: !20)
!37 = !DILocation(line: 12, column: 6, scope: !26)
!38 = !DILocation(line: 12, column: 17, scope: !26)
!39 = !DILocation(line: 12, column: 10, scope: !26)
!40 = !DILocalVariable(name: "alpha", scope: !26, file: !1, line: 13, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !42, size: 128, elements: !44)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !30)
!44 = !{!45}
!45 = !DISubrange(count: 2)
!46 = !DILocation(line: 13, column: 14, scope: !26)
!47 = !DILocalVariable(name: "i", scope: !26, file: !1, line: 15, type: !20)
!48 = !DILocation(line: 15, column: 6, scope: !26)
!49 = !DILocation(line: 16, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !26, file: !1, line: 16, column: 2)
!51 = !DILocation(line: 16, column: 7, scope: !50)
!52 = !DILocation(line: 16, column: 14, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !1, line: 16, column: 2)
!54 = !DILocation(line: 16, column: 18, scope: !53)
!55 = !DILocation(line: 16, column: 16, scope: !53)
!56 = !DILocation(line: 16, column: 2, scope: !50)
!57 = !DILocation(line: 18, column: 8, scope: !58)
!58 = distinct !DILexicalBlock(scope: !59, file: !1, line: 18, column: 7)
!59 = distinct !DILexicalBlock(scope: !53, file: !1, line: 17, column: 2)
!60 = !DILocation(line: 18, column: 7, scope: !59)
!61 = !DILocation(line: 19, column: 4, scope: !58)
!62 = !DILocation(line: 21, column: 7, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !1, line: 21, column: 7)
!64 = !DILocation(line: 21, column: 7, scope: !59)
!65 = !DILocation(line: 22, column: 34, scope: !63)
!66 = !DILocation(line: 22, column: 58, scope: !63)
!67 = !DILocation(line: 22, column: 62, scope: !63)
!68 = !DILocation(line: 22, column: 50, scope: !63)
!69 = !DILocation(line: 22, column: 66, scope: !63)
!70 = !DILocation(line: 22, column: 75, scope: !63)
!71 = !DILocation(line: 22, column: 73, scope: !63)
!72 = !DILocation(line: 22, column: 78, scope: !63)
!73 = !DILocation(line: 22, column: 25, scope: !63)
!74 = !DILocation(line: 22, column: 29, scope: !63)
!75 = !DILocation(line: 22, column: 32, scope: !63)
!76 = !DILocation(line: 24, column: 34, scope: !63)
!77 = !DILocation(line: 24, column: 58, scope: !63)
!78 = !DILocation(line: 24, column: 62, scope: !63)
!79 = !DILocation(line: 24, column: 50, scope: !63)
!80 = !DILocation(line: 24, column: 66, scope: !63)
!81 = !DILocation(line: 24, column: 75, scope: !63)
!82 = !DILocation(line: 24, column: 73, scope: !63)
!83 = !DILocation(line: 24, column: 78, scope: !63)
!84 = !DILocation(line: 24, column: 25, scope: !63)
!85 = !DILocation(line: 24, column: 29, scope: !63)
!86 = !DILocation(line: 24, column: 32, scope: !63)
!87 = !DILocation(line: 25, column: 2, scope: !59)
!88 = !DILocation(line: 16, column: 22, scope: !53)
!89 = !DILocation(line: 16, column: 2, scope: !53)
!90 = distinct !{!90, !56, !91}
!91 = !DILocation(line: 25, column: 2, scope: !50)
!92 = !DILocation(line: 26, column: 1, scope: !26)
!93 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 29, type: !94, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !31)
!94 = !DISubroutineType(types: !95)
!95 = !{!20}
!96 = !DILocalVariable(name: "str", scope: !93, file: !1, line: 31, type: !97)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 280, elements: !98)
!98 = !{!99}
!99 = !DISubrange(count: 35)
!100 = !DILocation(line: 31, column: 7, scope: !93)
!101 = !DILocation(line: 33, column: 27, scope: !93)
!102 = !DILocation(line: 33, column: 2, scope: !93)
!103 = !DILocation(line: 34, column: 2, scope: !93)
!104 = !DILocation(line: 35, column: 28, scope: !93)
!105 = !DILocation(line: 35, column: 2, scope: !93)
!106 = !DILocation(line: 36, column: 2, scope: !93)
!107 = !DILocation(line: 37, column: 28, scope: !93)
!108 = !DILocation(line: 37, column: 2, scope: !93)
!109 = !DILocation(line: 39, column: 2, scope: !93)
