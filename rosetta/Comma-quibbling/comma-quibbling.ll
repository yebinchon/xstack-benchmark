; ModuleID = 'comma-quibbling.ll'
source_filename = "comma-quibbling.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [24 x i8] c"Can't allocate memory!\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c" and \00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"ABC\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"DEF\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"H\00", align 1
@__const.main.test = private unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0)], align 16
@.str.9 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @quib(i8** %strs, i64 %size) #0 !dbg !7 {
entry:
  %strs.addr = alloca i8**, align 8
  %size.addr = alloca i64, align 8
  %len = alloca i64, align 8
  %i = alloca i64, align 8
  %s = alloca i8*, align 8
  store i8** %strs, i8*** %strs.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %strs.addr, metadata !18, metadata !DIExpression()), !dbg !19
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i64* %len, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i64, i64* %size.addr, align 8, !dbg !24
  %cmp = icmp ugt i64 %0, 1, !dbg !25
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !26

cond.true:                                        ; preds = %entry
  %1 = load i64, i64* %size.addr, align 8, !dbg !27
  %mul = mul i64 2, %1, !dbg !28
  %add = add i64 %mul, 1, !dbg !29
  br label %cond.end, !dbg !26

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !26

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %add, %cond.true ], [ 0, %cond.false ], !dbg !26
  %add1 = add i64 3, %cond, !dbg !30
  store i64 %add1, i64* %len, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !32
  store i64 0, i64* %i, align 8, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %cond.end
  %2 = load i64, i64* %i, align 8, !dbg !36
  %3 = load i64, i64* %size.addr, align 8, !dbg !38
  %cmp2 = icmp ult i64 %2, %3, !dbg !39
  br i1 %cmp2, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %4 = load i8**, i8*** %strs.addr, align 8, !dbg !41
  %5 = load i64, i64* %i, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i8*, i8** %4, i64 %5, !dbg !41
  %6 = load i8*, i8** %arrayidx, align 8, !dbg !41
  %call = call i64 @strlen(i8* %6) #7, !dbg !43
  %7 = load i64, i64* %len, align 8, !dbg !44
  %add3 = add i64 %7, %call, !dbg !44
  store i64 %add3, i64* %len, align 8, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !46
  %inc = add i64 %8, 1, !dbg !46
  store i64 %inc, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i8** %s, metadata !50, metadata !DIExpression()), !dbg !51
  %9 = load i64, i64* %len, align 8, !dbg !52
  %mul4 = mul i64 %9, 1, !dbg !53
  %call5 = call noalias i8* @malloc(i64 %mul4) #8, !dbg !54
  store i8* %call5, i8** %s, align 8, !dbg !51
  %10 = load i8*, i8** %s, align 8, !dbg !55
  %tobool = icmp ne i8* %10, null, !dbg !55
  br i1 %tobool, label %if.end, label %if.then, !dbg !57

if.then:                                          ; preds = %for.end
  call void @perror(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @exit(i32 1) #9, !dbg !60
  unreachable, !dbg !60

if.end:                                           ; preds = %for.end
  %11 = load i8*, i8** %s, align 8, !dbg !61
  %call6 = call i8* @strcpy(i8* %11, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)) #8, !dbg !62
  %12 = load i64, i64* %size.addr, align 8, !dbg !63
  switch i64 %12, label %sw.default [
    i64 0, label %sw.bb
    i64 1, label %sw.bb7
  ], !dbg !64

sw.bb:                                            ; preds = %if.end
  br label %sw.epilog, !dbg !65

sw.bb7:                                           ; preds = %if.end
  %13 = load i8*, i8** %s, align 8, !dbg !67
  %14 = load i8**, i8*** %strs.addr, align 8, !dbg !68
  %arrayidx8 = getelementptr inbounds i8*, i8** %14, i64 0, !dbg !68
  %15 = load i8*, i8** %arrayidx8, align 8, !dbg !68
  %call9 = call i8* @strcat(i8* %13, i8* %15) #8, !dbg !69
  br label %sw.epilog, !dbg !70

sw.default:                                       ; preds = %if.end
  store i64 0, i64* %i, align 8, !dbg !71
  br label %for.cond10, !dbg !73

for.cond10:                                       ; preds = %for.inc21, %sw.default
  %16 = load i64, i64* %i, align 8, !dbg !74
  %17 = load i64, i64* %size.addr, align 8, !dbg !76
  %sub = sub i64 %17, 1, !dbg !77
  %cmp11 = icmp ult i64 %16, %sub, !dbg !78
  br i1 %cmp11, label %for.body12, label %for.end23, !dbg !79

for.body12:                                       ; preds = %for.cond10
  %18 = load i8*, i8** %s, align 8, !dbg !80
  %19 = load i8**, i8*** %strs.addr, align 8, !dbg !82
  %20 = load i64, i64* %i, align 8, !dbg !83
  %arrayidx13 = getelementptr inbounds i8*, i8** %19, i64 %20, !dbg !82
  %21 = load i8*, i8** %arrayidx13, align 8, !dbg !82
  %call14 = call i8* @strcat(i8* %18, i8* %21) #8, !dbg !84
  %22 = load i64, i64* %i, align 8, !dbg !85
  %23 = load i64, i64* %size.addr, align 8, !dbg !87
  %sub15 = sub i64 %23, 2, !dbg !88
  %cmp16 = icmp ult i64 %22, %sub15, !dbg !89
  br i1 %cmp16, label %if.then17, label %if.else, !dbg !90

if.then17:                                        ; preds = %for.body12
  %24 = load i8*, i8** %s, align 8, !dbg !91
  %call18 = call i8* @strcat(i8* %24, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0)) #8, !dbg !92
  br label %if.end20, !dbg !92

if.else:                                          ; preds = %for.body12
  %25 = load i8*, i8** %s, align 8, !dbg !93
  %call19 = call i8* @strcat(i8* %25, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0)) #8, !dbg !94
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.then17
  br label %for.inc21, !dbg !95

for.inc21:                                        ; preds = %if.end20
  %26 = load i64, i64* %i, align 8, !dbg !96
  %inc22 = add i64 %26, 1, !dbg !96
  store i64 %inc22, i64* %i, align 8, !dbg !96
  br label %for.cond10, !dbg !97, !llvm.loop !98

for.end23:                                        ; preds = %for.cond10
  %27 = load i8*, i8** %s, align 8, !dbg !100
  %28 = load i8**, i8*** %strs.addr, align 8, !dbg !101
  %29 = load i64, i64* %i, align 8, !dbg !102
  %arrayidx24 = getelementptr inbounds i8*, i8** %28, i64 %29, !dbg !101
  %30 = load i8*, i8** %arrayidx24, align 8, !dbg !101
  %call25 = call i8* @strcat(i8* %27, i8* %30) #8, !dbg !103
  br label %sw.epilog, !dbg !104

sw.epilog:                                        ; preds = %for.end23, %sw.bb7, %sw.bb
  %31 = load i8*, i8** %s, align 8, !dbg !105
  %call26 = call i8* @strcat(i8* %31, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0)) #8, !dbg !106
  %32 = load i8*, i8** %s, align 8, !dbg !107
  ret i8* %32, !dbg !108
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

declare dso_local void @perror(i8*) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !109 {
entry:
  %retval = alloca i32, align 4
  %test = alloca [4 x i8*], align 16
  %s = alloca i8*, align 8
  %i = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [4 x i8*]* %test, metadata !113, metadata !DIExpression()), !dbg !117
  %0 = bitcast [4 x i8*]* %test to i8*, !dbg !117
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([4 x i8*]* @__const.main.test to i8*), i64 32, i1 false), !dbg !117
  call void @llvm.dbg.declare(metadata i8** %s, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !122
  store i64 0, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !124
  %cmp = icmp ult i64 %1, 5, !dbg !126
  br i1 %cmp, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [4 x i8*], [4 x i8*]* %test, i64 0, i64 0, !dbg !128
  %2 = load i64, i64* %i, align 8, !dbg !130
  %call = call i8* @quib(i8** %arraydecay, i64 %2), !dbg !131
  store i8* %call, i8** %s, align 8, !dbg !132
  %3 = load i8*, i8** %s, align 8, !dbg !133
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i8* %3), !dbg !134
  %4 = load i8*, i8** %s, align 8, !dbg !135
  call void @free(i8* %4) #8, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %5, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !142
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind willreturn }
attributes #7 = { nounwind readonly }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "comma-quibbling.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Comma-quibbling")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "quib", scope: !1, file: !1, line: 5, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !12, !15}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !17)
!16 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!17 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!18 = !DILocalVariable(name: "strs", arg: 1, scope: !7, file: !1, line: 5, type: !12)
!19 = !DILocation(line: 5, column: 25, scope: !7)
!20 = !DILocalVariable(name: "size", arg: 2, scope: !7, file: !1, line: 5, type: !15)
!21 = !DILocation(line: 5, column: 38, scope: !7)
!22 = !DILocalVariable(name: "len", scope: !7, file: !1, line: 8, type: !15)
!23 = !DILocation(line: 8, column: 12, scope: !7)
!24 = !DILocation(line: 8, column: 24, scope: !7)
!25 = !DILocation(line: 8, column: 29, scope: !7)
!26 = !DILocation(line: 8, column: 23, scope: !7)
!27 = !DILocation(line: 8, column: 41, scope: !7)
!28 = !DILocation(line: 8, column: 39, scope: !7)
!29 = !DILocation(line: 8, column: 46, scope: !7)
!30 = !DILocation(line: 8, column: 20, scope: !7)
!31 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 9, type: !15)
!32 = !DILocation(line: 9, column: 12, scope: !7)
!33 = !DILocation(line: 11, column: 12, scope: !34)
!34 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 5)
!35 = !DILocation(line: 11, column: 10, scope: !34)
!36 = !DILocation(line: 11, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !1, line: 11, column: 5)
!38 = !DILocation(line: 11, column: 21, scope: !37)
!39 = !DILocation(line: 11, column: 19, scope: !37)
!40 = !DILocation(line: 11, column: 5, scope: !34)
!41 = !DILocation(line: 12, column: 23, scope: !37)
!42 = !DILocation(line: 12, column: 28, scope: !37)
!43 = !DILocation(line: 12, column: 16, scope: !37)
!44 = !DILocation(line: 12, column: 13, scope: !37)
!45 = !DILocation(line: 12, column: 9, scope: !37)
!46 = !DILocation(line: 11, column: 28, scope: !37)
!47 = !DILocation(line: 11, column: 5, scope: !37)
!48 = distinct !{!48, !40, !49}
!49 = !DILocation(line: 12, column: 30, scope: !34)
!50 = !DILocalVariable(name: "s", scope: !7, file: !1, line: 14, type: !10)
!51 = !DILocation(line: 14, column: 11, scope: !7)
!52 = !DILocation(line: 14, column: 22, scope: !7)
!53 = !DILocation(line: 14, column: 26, scope: !7)
!54 = !DILocation(line: 14, column: 15, scope: !7)
!55 = !DILocation(line: 15, column: 10, scope: !56)
!56 = distinct !DILexicalBlock(scope: !7, file: !1, line: 15, column: 9)
!57 = !DILocation(line: 15, column: 9, scope: !7)
!58 = !DILocation(line: 17, column: 9, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !1, line: 16, column: 5)
!60 = !DILocation(line: 18, column: 9, scope: !59)
!61 = !DILocation(line: 21, column: 12, scope: !7)
!62 = !DILocation(line: 21, column: 5, scope: !7)
!63 = !DILocation(line: 22, column: 13, scope: !7)
!64 = !DILocation(line: 22, column: 5, scope: !7)
!65 = !DILocation(line: 23, column: 18, scope: !66)
!66 = distinct !DILexicalBlock(scope: !7, file: !1, line: 22, column: 19)
!67 = !DILocation(line: 24, column: 25, scope: !66)
!68 = !DILocation(line: 24, column: 28, scope: !66)
!69 = !DILocation(line: 24, column: 18, scope: !66)
!70 = !DILocation(line: 25, column: 18, scope: !66)
!71 = !DILocation(line: 26, column: 25, scope: !72)
!72 = distinct !DILexicalBlock(scope: !66, file: !1, line: 26, column: 18)
!73 = !DILocation(line: 26, column: 23, scope: !72)
!74 = !DILocation(line: 26, column: 30, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !1, line: 26, column: 18)
!76 = !DILocation(line: 26, column: 34, scope: !75)
!77 = !DILocation(line: 26, column: 39, scope: !75)
!78 = !DILocation(line: 26, column: 32, scope: !75)
!79 = !DILocation(line: 26, column: 18, scope: !72)
!80 = !DILocation(line: 28, column: 29, scope: !81)
!81 = distinct !DILexicalBlock(scope: !75, file: !1, line: 27, column: 18)
!82 = !DILocation(line: 28, column: 32, scope: !81)
!83 = !DILocation(line: 28, column: 37, scope: !81)
!84 = !DILocation(line: 28, column: 22, scope: !81)
!85 = !DILocation(line: 29, column: 26, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !1, line: 29, column: 26)
!87 = !DILocation(line: 29, column: 30, scope: !86)
!88 = !DILocation(line: 29, column: 35, scope: !86)
!89 = !DILocation(line: 29, column: 28, scope: !86)
!90 = !DILocation(line: 29, column: 26, scope: !81)
!91 = !DILocation(line: 30, column: 33, scope: !86)
!92 = !DILocation(line: 30, column: 26, scope: !86)
!93 = !DILocation(line: 32, column: 33, scope: !86)
!94 = !DILocation(line: 32, column: 26, scope: !86)
!95 = !DILocation(line: 33, column: 18, scope: !81)
!96 = !DILocation(line: 26, column: 45, scope: !75)
!97 = !DILocation(line: 26, column: 18, scope: !75)
!98 = distinct !{!98, !79, !99}
!99 = !DILocation(line: 33, column: 18, scope: !72)
!100 = !DILocation(line: 34, column: 25, scope: !66)
!101 = !DILocation(line: 34, column: 28, scope: !66)
!102 = !DILocation(line: 34, column: 33, scope: !66)
!103 = !DILocation(line: 34, column: 18, scope: !66)
!104 = !DILocation(line: 35, column: 18, scope: !66)
!105 = !DILocation(line: 37, column: 12, scope: !7)
!106 = !DILocation(line: 37, column: 5, scope: !7)
!107 = !DILocation(line: 38, column: 12, scope: !7)
!108 = !DILocation(line: 38, column: 5, scope: !7)
!109 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 41, type: !110, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DISubroutineType(types: !111)
!111 = !{!112}
!112 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!113 = !DILocalVariable(name: "test", scope: !109, file: !1, line: 43, type: !114)
!114 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 256, elements: !115)
!115 = !{!116}
!116 = !DISubrange(count: 4)
!117 = !DILocation(line: 43, column: 17, scope: !109)
!118 = !DILocalVariable(name: "s", scope: !109, file: !1, line: 44, type: !10)
!119 = !DILocation(line: 44, column: 11, scope: !109)
!120 = !DILocalVariable(name: "i", scope: !121, file: !1, line: 46, type: !15)
!121 = distinct !DILexicalBlock(scope: !109, file: !1, line: 46, column: 5)
!122 = !DILocation(line: 46, column: 17, scope: !121)
!123 = !DILocation(line: 46, column: 10, scope: !121)
!124 = !DILocation(line: 46, column: 24, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !1, line: 46, column: 5)
!126 = !DILocation(line: 46, column: 26, scope: !125)
!127 = !DILocation(line: 46, column: 5, scope: !121)
!128 = !DILocation(line: 48, column: 18, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !1, line: 47, column: 5)
!130 = !DILocation(line: 48, column: 24, scope: !129)
!131 = !DILocation(line: 48, column: 13, scope: !129)
!132 = !DILocation(line: 48, column: 11, scope: !129)
!133 = !DILocation(line: 49, column: 24, scope: !129)
!134 = !DILocation(line: 49, column: 9, scope: !129)
!135 = !DILocation(line: 50, column: 14, scope: !129)
!136 = !DILocation(line: 50, column: 9, scope: !129)
!137 = !DILocation(line: 51, column: 5, scope: !129)
!138 = !DILocation(line: 46, column: 32, scope: !125)
!139 = !DILocation(line: 46, column: 5, scope: !125)
!140 = distinct !{!140, !127, !141}
!141 = !DILocation(line: 51, column: 5, scope: !121)
!142 = !DILocation(line: 52, column: 5, scope: !109)
