; ModuleID = 'caesar-cipher.ll'
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
  %alpha = alloca [2 x i8*], align 16
  call void @llvm.dbg.value(metadata i32 %c, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.value(metadata i8* %str, metadata !34, metadata !DIExpression()), !dbg !33
  %call = call i64 @strlen(i8* %str) #6, !dbg !35
  %conv = trunc i64 %call to i32, !dbg !35
  call void @llvm.dbg.value(metadata i32 %conv, metadata !36, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [2 x i8*]* %alpha, metadata !37, metadata !DIExpression()), !dbg !43
  %0 = bitcast [2 x i8*]* %alpha to i8*, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([2 x i8*]* @__const.rot.alpha to i8*), i64 16, i1 false), !dbg !43
  call void @llvm.dbg.value(metadata i32 0, metadata !44, metadata !DIExpression()), !dbg !33
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !47
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !44, metadata !DIExpression()), !dbg !33
  %cmp = icmp slt i32 %i.0, %conv, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %call2 = call i16** @__ctype_b_loc() #7, !dbg !51
  %1 = load i16*, i16** %call2, align 8, !dbg !51
  %idxprom = sext i32 %i.0 to i64, !dbg !51
  %arrayidx = getelementptr inbounds i8, i8* %str, i64 %idxprom, !dbg !51
  %2 = load i8, i8* %arrayidx, align 1, !dbg !51
  %conv3 = sext i8 %2 to i32, !dbg !51
  %idxprom4 = sext i32 %conv3 to i64, !dbg !51
  %arrayidx5 = getelementptr inbounds i16, i16* %1, i64 %idxprom4, !dbg !51
  %3 = load i16, i16* %arrayidx5, align 2, !dbg !51
  %conv6 = zext i16 %3 to i32, !dbg !51
  %and = and i32 %conv6, 1024, !dbg !51
  %tobool = icmp ne i32 %and, 0, !dbg !51
  br i1 %tobool, label %if.end, label %if.then, !dbg !54

if.then:                                          ; preds = %for.body
  br label %for.inc, !dbg !55

if.end:                                           ; preds = %for.body
  %call7 = call i16** @__ctype_b_loc() #7, !dbg !56
  %4 = load i16*, i16** %call7, align 8, !dbg !56
  %idxprom8 = sext i32 %i.0 to i64, !dbg !56
  %arrayidx9 = getelementptr inbounds i8, i8* %str, i64 %idxprom8, !dbg !56
  %5 = load i8, i8* %arrayidx9, align 1, !dbg !56
  %conv10 = sext i8 %5 to i32, !dbg !56
  %idxprom11 = sext i32 %conv10 to i64, !dbg !56
  %arrayidx12 = getelementptr inbounds i16, i16* %4, i64 %idxprom11, !dbg !56
  %6 = load i16, i16* %arrayidx12, align 2, !dbg !56
  %conv13 = zext i16 %6 to i32, !dbg !56
  %and14 = and i32 %conv13, 256, !dbg !56
  %tobool15 = icmp ne i32 %and14, 0, !dbg !56
  br i1 %tobool15, label %if.then16, label %if.else, !dbg !58

if.then16:                                        ; preds = %if.end
  %arrayidx17 = getelementptr inbounds [2 x i8*], [2 x i8*]* %alpha, i64 0, i64 1, !dbg !59
  %7 = load i8*, i8** %arrayidx17, align 8, !dbg !59
  %idxprom18 = sext i32 %i.0 to i64, !dbg !60
  %arrayidx19 = getelementptr inbounds i8, i8* %str, i64 %idxprom18, !dbg !60
  %8 = load i8, i8* %arrayidx19, align 1, !dbg !60
  %conv20 = sext i8 %8 to i32, !dbg !60
  %call21 = call i32 @tolower(i32 %conv20) #6, !dbg !61
  %sub = sub nsw i32 %call21, 97, !dbg !62
  %add = add nsw i32 %sub, %c, !dbg !63
  %rem = srem i32 %add, 26, !dbg !64
  %idxprom22 = sext i32 %rem to i64, !dbg !59
  %arrayidx23 = getelementptr inbounds i8, i8* %7, i64 %idxprom22, !dbg !59
  %9 = load i8, i8* %arrayidx23, align 1, !dbg !59
  %idxprom24 = sext i32 %i.0 to i64, !dbg !65
  %arrayidx25 = getelementptr inbounds i8, i8* %str, i64 %idxprom24, !dbg !65
  store i8 %9, i8* %arrayidx25, align 1, !dbg !66
  br label %if.end38, !dbg !65

if.else:                                          ; preds = %if.end
  %arrayidx26 = getelementptr inbounds [2 x i8*], [2 x i8*]* %alpha, i64 0, i64 0, !dbg !67
  %10 = load i8*, i8** %arrayidx26, align 16, !dbg !67
  %idxprom27 = sext i32 %i.0 to i64, !dbg !68
  %arrayidx28 = getelementptr inbounds i8, i8* %str, i64 %idxprom27, !dbg !68
  %11 = load i8, i8* %arrayidx28, align 1, !dbg !68
  %conv29 = sext i8 %11 to i32, !dbg !68
  %call30 = call i32 @tolower(i32 %conv29) #6, !dbg !69
  %sub31 = sub nsw i32 %call30, 97, !dbg !70
  %add32 = add nsw i32 %sub31, %c, !dbg !71
  %rem33 = srem i32 %add32, 26, !dbg !72
  %idxprom34 = sext i32 %rem33 to i64, !dbg !67
  %arrayidx35 = getelementptr inbounds i8, i8* %10, i64 %idxprom34, !dbg !67
  %12 = load i8, i8* %arrayidx35, align 1, !dbg !67
  %idxprom36 = sext i32 %i.0 to i64, !dbg !73
  %arrayidx37 = getelementptr inbounds i8, i8* %str, i64 %idxprom36, !dbg !73
  store i8 %12, i8* %arrayidx37, align 1, !dbg !74
  br label %if.end38

if.end38:                                         ; preds = %if.else, %if.then16
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %if.end38, %if.then
  %inc = add nsw i32 %i.0, 1, !dbg !76
  call void @llvm.dbg.value(metadata i32 %inc, metadata !44, metadata !DIExpression()), !dbg !33
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  ret void, !dbg !80
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
define dso_local i32 @main() #0 !dbg !81 {
entry:
  %str = alloca [35 x i8], align 16
  call void @llvm.dbg.declare(metadata [35 x i8]* %str, metadata !84, metadata !DIExpression()), !dbg !88
  %0 = bitcast [35 x i8]* %str to i8*, !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 getelementptr inbounds ([35 x i8], [35 x i8]* @__const.main.str, i32 0, i32 0), i64 35, i1 false), !dbg !88
  %arraydecay = getelementptr inbounds [35 x i8], [35 x i8]* %str, i64 0, i64 0, !dbg !89
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0), i8* %arraydecay), !dbg !90
  %arraydecay1 = getelementptr inbounds [35 x i8], [35 x i8]* %str, i64 0, i64 0, !dbg !91
  call void @rot(i32 13, i8* %arraydecay1), !dbg !91
  %arraydecay2 = getelementptr inbounds [35 x i8], [35 x i8]* %str, i64 0, i64 0, !dbg !92
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0), i8* %arraydecay2), !dbg !93
  %arraydecay4 = getelementptr inbounds [35 x i8], [35 x i8]* %str, i64 0, i64 0, !dbg !94
  call void @rot(i32 13, i8* %arraydecay4), !dbg !94
  %arraydecay5 = getelementptr inbounds [35 x i8], [35 x i8]* %str, i64 0, i64 0, !dbg !95
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i8* %arraydecay5), !dbg !96
  ret i32 0, !dbg !97
}

declare dso_local i32 @printf(i8*, ...) #5

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!33 = !DILocation(line: 0, scope: !26)
!34 = !DILocalVariable(name: "str", arg: 2, scope: !26, file: !1, line: 10, type: !29)
!35 = !DILocation(line: 12, column: 10, scope: !26)
!36 = !DILocalVariable(name: "l", scope: !26, file: !1, line: 12, type: !20)
!37 = !DILocalVariable(name: "alpha", scope: !26, file: !1, line: 13, type: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !39, size: 128, elements: !41)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !30)
!41 = !{!42}
!42 = !DISubrange(count: 2)
!43 = !DILocation(line: 13, column: 14, scope: !26)
!44 = !DILocalVariable(name: "i", scope: !26, file: !1, line: 15, type: !20)
!45 = !DILocation(line: 16, column: 7, scope: !46)
!46 = distinct !DILexicalBlock(scope: !26, file: !1, line: 16, column: 2)
!47 = !DILocation(line: 0, scope: !46)
!48 = !DILocation(line: 16, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !1, line: 16, column: 2)
!50 = !DILocation(line: 16, column: 2, scope: !46)
!51 = !DILocation(line: 18, column: 8, scope: !52)
!52 = distinct !DILexicalBlock(scope: !53, file: !1, line: 18, column: 7)
!53 = distinct !DILexicalBlock(scope: !49, file: !1, line: 17, column: 2)
!54 = !DILocation(line: 18, column: 7, scope: !53)
!55 = !DILocation(line: 19, column: 4, scope: !52)
!56 = !DILocation(line: 21, column: 7, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !1, line: 21, column: 7)
!58 = !DILocation(line: 21, column: 7, scope: !53)
!59 = !DILocation(line: 22, column: 34, scope: !57)
!60 = !DILocation(line: 22, column: 58, scope: !57)
!61 = !DILocation(line: 22, column: 50, scope: !57)
!62 = !DILocation(line: 22, column: 66, scope: !57)
!63 = !DILocation(line: 22, column: 73, scope: !57)
!64 = !DILocation(line: 22, column: 78, scope: !57)
!65 = !DILocation(line: 22, column: 25, scope: !57)
!66 = !DILocation(line: 22, column: 32, scope: !57)
!67 = !DILocation(line: 24, column: 34, scope: !57)
!68 = !DILocation(line: 24, column: 58, scope: !57)
!69 = !DILocation(line: 24, column: 50, scope: !57)
!70 = !DILocation(line: 24, column: 66, scope: !57)
!71 = !DILocation(line: 24, column: 73, scope: !57)
!72 = !DILocation(line: 24, column: 78, scope: !57)
!73 = !DILocation(line: 24, column: 25, scope: !57)
!74 = !DILocation(line: 24, column: 32, scope: !57)
!75 = !DILocation(line: 25, column: 2, scope: !53)
!76 = !DILocation(line: 16, column: 22, scope: !49)
!77 = !DILocation(line: 16, column: 2, scope: !49)
!78 = distinct !{!78, !50, !79}
!79 = !DILocation(line: 25, column: 2, scope: !46)
!80 = !DILocation(line: 26, column: 1, scope: !26)
!81 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 29, type: !82, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !31)
!82 = !DISubroutineType(types: !83)
!83 = !{!20}
!84 = !DILocalVariable(name: "str", scope: !81, file: !1, line: 31, type: !85)
!85 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 280, elements: !86)
!86 = !{!87}
!87 = !DISubrange(count: 35)
!88 = !DILocation(line: 31, column: 7, scope: !81)
!89 = !DILocation(line: 33, column: 27, scope: !81)
!90 = !DILocation(line: 33, column: 2, scope: !81)
!91 = !DILocation(line: 34, column: 2, scope: !81)
!92 = !DILocation(line: 35, column: 28, scope: !81)
!93 = !DILocation(line: 35, column: 2, scope: !81)
!94 = !DILocation(line: 36, column: 2, scope: !81)
!95 = !DILocation(line: 37, column: 28, scope: !81)
!96 = !DILocation(line: 37, column: 2, scope: !81)
!97 = !DILocation(line: 39, column: 2, scope: !81)
