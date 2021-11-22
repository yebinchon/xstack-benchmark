; ModuleID = 'look-and-say-sequence.c'
source_filename = "look-and-say-sequence.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%d%c\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i8*, align 8
  %b = alloca i8*, align 8
  %x = alloca i8*, align 8
  %c = alloca i8, align 1
  %cnt = alloca i32, align 4
  %len = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i8** %a, metadata !11, metadata !DIExpression()), !dbg !14
  %call = call noalias i8* @malloc(i64 2) #4, !dbg !15
  store i8* %call, i8** %a, align 8, !dbg !14
  call void @llvm.dbg.declare(metadata i8** %b, metadata !16, metadata !DIExpression()), !dbg !17
  store i8* null, i8** %b, align 8, !dbg !17
  call void @llvm.dbg.declare(metadata i8** %x, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8* %c, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %cnt, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %len, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 1, i32* %len, align 4, !dbg !25
  %0 = load i8*, i8** %a, align 8, !dbg !26
  %call1 = call i32 (i8*, i8*, ...) @sprintf(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)) #4, !dbg !28
  br label %for.cond, !dbg !28

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %b, align 8, !dbg !29
  %2 = load i32, i32* %len, align 4, !dbg !31
  %mul = mul nsw i32 %2, 2, !dbg !32
  %add = add nsw i32 %mul, 1, !dbg !33
  %conv = sext i32 %add to i64, !dbg !31
  %call2 = call i8* @realloc(i8* %1, i64 %conv) #4, !dbg !34
  store i8* %call2, i8** %b, align 8, !dbg !35
  %tobool = icmp ne i8* %call2, null, !dbg !36
  br i1 %tobool, label %for.body, label %for.end16, !dbg !36

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %a, align 8, !dbg !37
  store i8* %3, i8** %x, align 8, !dbg !39
  %call3 = call i32 @puts(i8* %3), !dbg !40
  store i32 0, i32* %len, align 4, !dbg !41
  store i32 1, i32* %cnt, align 4, !dbg !43
  br label %for.cond4, !dbg !44

for.cond4:                                        ; preds = %if.end15, %for.body
  %4 = load i8*, i8** %a, align 8, !dbg !45
  %5 = load i8, i8* %4, align 1, !dbg !47
  store i8 %5, i8* %c, align 1, !dbg !48
  %tobool5 = icmp ne i8 %5, 0, !dbg !49
  br i1 %tobool5, label %for.body6, label %for.end, !dbg !49

for.body6:                                        ; preds = %for.cond4
  %6 = load i8, i8* %c, align 1, !dbg !50
  %conv7 = sext i8 %6 to i32, !dbg !50
  %7 = load i8*, i8** %a, align 8, !dbg !53
  %incdec.ptr = getelementptr inbounds i8, i8* %7, i32 1, !dbg !53
  store i8* %incdec.ptr, i8** %a, align 8, !dbg !53
  %8 = load i8, i8* %incdec.ptr, align 1, !dbg !54
  %conv8 = sext i8 %8 to i32, !dbg !54
  %cmp = icmp eq i32 %conv7, %conv8, !dbg !55
  br i1 %cmp, label %if.then, label %if.else, !dbg !56, !cf.info !57

if.then:                                          ; preds = %for.body6
  %9 = load i32, i32* %cnt, align 4, !dbg !58
  %inc = add nsw i32 %9, 1, !dbg !58
  store i32 %inc, i32* %cnt, align 4, !dbg !58
  br label %if.end15, !dbg !59

if.else:                                          ; preds = %for.body6
  %10 = load i8, i8* %c, align 1, !dbg !60
  %tobool10 = icmp ne i8 %10, 0, !dbg !60
  br i1 %tobool10, label %if.then11, label %if.end, !dbg !62, !cf.info !57

if.then11:                                        ; preds = %if.else
  %11 = load i8*, i8** %b, align 8, !dbg !63
  %12 = load i32, i32* %len, align 4, !dbg !65
  %idx.ext = sext i32 %12 to i64, !dbg !66
  %add.ptr = getelementptr inbounds i8, i8* %11, i64 %idx.ext, !dbg !66
  %13 = load i32, i32* %cnt, align 4, !dbg !67
  %14 = load i8, i8* %c, align 1, !dbg !68
  %conv12 = sext i8 %14 to i32, !dbg !68
  %call13 = call i32 (i8*, i8*, ...) @sprintf(i8* %add.ptr, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i32 %13, i32 %conv12) #4, !dbg !69
  %15 = load i32, i32* %len, align 4, !dbg !70
  %add14 = add nsw i32 %15, %call13, !dbg !70
  store i32 %add14, i32* %len, align 4, !dbg !70
  store i32 1, i32* %cnt, align 4, !dbg !71
  br label %if.end, !dbg !72

if.end:                                           ; preds = %if.then11, %if.else
  br label %if.end15

if.end15:                                         ; preds = %if.end, %if.then
  br label %for.cond4, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond4
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.end
  %16 = load i8*, i8** %b, align 8, !dbg !77
  store i8* %16, i8** %a, align 8, !dbg !78
  %17 = load i8*, i8** %x, align 8, !dbg !79
  store i8* %17, i8** %b, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end16:                                        ; preds = %for.cond
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8*, i8*, ...) #2

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #2

declare dso_local i32 @puts(i8*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "look-and-say-sequence.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Look-and-say-sequence")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 6, type: !12)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocation(line: 6, column: 8, scope: !7)
!15 = !DILocation(line: 6, column: 12, scope: !7)
!16 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 6, type: !12)
!17 = !DILocation(line: 6, column: 24, scope: !7)
!18 = !DILocalVariable(name: "x", scope: !7, file: !1, line: 6, type: !12)
!19 = !DILocation(line: 6, column: 32, scope: !7)
!20 = !DILocalVariable(name: "c", scope: !7, file: !1, line: 6, type: !13)
!21 = !DILocation(line: 6, column: 35, scope: !7)
!22 = !DILocalVariable(name: "cnt", scope: !7, file: !1, line: 7, type: !10)
!23 = !DILocation(line: 7, column: 6, scope: !7)
!24 = !DILocalVariable(name: "len", scope: !7, file: !1, line: 7, type: !10)
!25 = !DILocation(line: 7, column: 11, scope: !7)
!26 = !DILocation(line: 9, column: 15, scope: !27)
!27 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 2)
!28 = !DILocation(line: 9, column: 7, scope: !27)
!29 = !DILocation(line: 9, column: 37, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !1, line: 9, column: 2)
!31 = !DILocation(line: 9, column: 40, scope: !30)
!32 = !DILocation(line: 9, column: 44, scope: !30)
!33 = !DILocation(line: 9, column: 48, scope: !30)
!34 = !DILocation(line: 9, column: 29, scope: !30)
!35 = !DILocation(line: 9, column: 27, scope: !30)
!36 = !DILocation(line: 9, column: 2, scope: !27)
!37 = !DILocation(line: 10, column: 12, scope: !38)
!38 = distinct !DILexicalBlock(scope: !30, file: !1, line: 9, column: 69)
!39 = !DILocation(line: 10, column: 10, scope: !38)
!40 = !DILocation(line: 10, column: 3, scope: !38)
!41 = !DILocation(line: 11, column: 12, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !1, line: 11, column: 3)
!43 = !DILocation(line: 11, column: 21, scope: !42)
!44 = !DILocation(line: 11, column: 8, scope: !42)
!45 = !DILocation(line: 11, column: 32, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !1, line: 11, column: 3)
!47 = !DILocation(line: 11, column: 31, scope: !46)
!48 = !DILocation(line: 11, column: 29, scope: !46)
!49 = !DILocation(line: 11, column: 3, scope: !42)
!50 = !DILocation(line: 12, column: 8, scope: !51)
!51 = distinct !DILexicalBlock(scope: !52, file: !1, line: 12, column: 8)
!52 = distinct !DILexicalBlock(scope: !46, file: !1, line: 11, column: 38)
!53 = !DILocation(line: 12, column: 14, scope: !51)
!54 = !DILocation(line: 12, column: 13, scope: !51)
!55 = !DILocation(line: 12, column: 10, scope: !51)
!56 = !DILocation(line: 12, column: 8, scope: !52)
!57 = !{!"if"}
!58 = !DILocation(line: 13, column: 8, scope: !51)
!59 = !DILocation(line: 13, column: 5, scope: !51)
!60 = !DILocation(line: 14, column: 13, scope: !61)
!61 = distinct !DILexicalBlock(scope: !51, file: !1, line: 14, column: 13)
!62 = !DILocation(line: 14, column: 13, scope: !51)
!63 = !DILocation(line: 15, column: 20, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !1, line: 14, column: 16)
!65 = !DILocation(line: 15, column: 24, scope: !64)
!66 = !DILocation(line: 15, column: 22, scope: !64)
!67 = !DILocation(line: 15, column: 37, scope: !64)
!68 = !DILocation(line: 15, column: 42, scope: !64)
!69 = !DILocation(line: 15, column: 12, scope: !64)
!70 = !DILocation(line: 15, column: 9, scope: !64)
!71 = !DILocation(line: 16, column: 9, scope: !64)
!72 = !DILocation(line: 17, column: 4, scope: !64)
!73 = !DILocation(line: 11, column: 3, scope: !46)
!74 = distinct !{!74, !49, !75}
!75 = !DILocation(line: 18, column: 3, scope: !42)
!76 = !DILocation(line: 19, column: 2, scope: !38)
!77 = !DILocation(line: 9, column: 59, scope: !30)
!78 = !DILocation(line: 9, column: 57, scope: !30)
!79 = !DILocation(line: 9, column: 66, scope: !30)
!80 = !DILocation(line: 9, column: 64, scope: !30)
!81 = !DILocation(line: 9, column: 2, scope: !30)
!82 = distinct !{!82, !36, !83}
!83 = !DILocation(line: 19, column: 2, scope: !27)
!84 = !DILocation(line: 21, column: 2, scope: !7)
