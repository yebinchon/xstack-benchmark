; ModuleID = 'bitcoin-address-validation.ll'
source_filename = "bitcoin-address-validation.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@unbase58.tmpl = internal global i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str, i32 0, i32 0), align 8, !dbg !0
@.str = private unnamed_addr constant [59 x i8] c"123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"bad char\00", align 1
@coin_err = common dso_local global i8* null, align 8, !dbg !15
@.str.2 = private unnamed_addr constant [17 x i8] c"address too long\00", align 1
@.str.3 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"bad digest\00", align 1
@.str.5 = private unnamed_addr constant [35 x i8] c"1Q1pE5vPGEEMqRcVRMbtBK842Y6Pzo6nK9\00", align 1
@.str.6 = private unnamed_addr constant [35 x i8] c"1AGNa15ZQXAZUgFiqJ2i7Z2DPU2J6hW62i\00", align 1
@.str.7 = private unnamed_addr constant [35 x i8] c"1Q1pE5vPGEEMqRcVRMbtBK842Y6Pzo6nJ9\00", align 1
@.str.8 = private unnamed_addr constant [35 x i8] c"1AGNa15ZQXAZUgFiqJ2i7Z2DPU2J6hW62I\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"%s: %s\0A\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"Ok\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @unbase58(i8* %s, i8* %out) #0 !dbg !2 {
entry:
  call void @llvm.dbg.value(metadata i8* %s, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.value(metadata i8* %out, metadata !23, metadata !DIExpression()), !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %out, i8 0, i64 25, i1 false), !dbg !24
  call void @llvm.dbg.value(metadata i32 0, metadata !25, metadata !DIExpression()), !dbg !22
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !28
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !25, metadata !DIExpression()), !dbg !22
  %idxprom = sext i32 %i.0 to i64, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %s, i64 %idxprom, !dbg !29
  %0 = load i8, i8* %arrayidx, align 1, !dbg !29
  %tobool = icmp ne i8 %0, 0, !dbg !31
  br i1 %tobool, label %for.body, label %for.end17, !dbg !31

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** @unbase58.tmpl, align 8, !dbg !32
  %idxprom1 = sext i32 %i.0 to i64, !dbg !35
  %arrayidx2 = getelementptr inbounds i8, i8* %s, i64 %idxprom1, !dbg !35
  %2 = load i8, i8* %arrayidx2, align 1, !dbg !35
  %conv = sext i8 %2 to i32, !dbg !35
  %call = call i8* @strchr(i8* %1, i32 %conv) #5, !dbg !36
  call void @llvm.dbg.value(metadata i8* %call, metadata !37, metadata !DIExpression()), !dbg !22
  %tobool3 = icmp ne i8* %call, null, !dbg !38
  br i1 %tobool3, label %if.end, label %if.then, !dbg !39

if.then:                                          ; preds = %for.body
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i8** @coin_err, align 8, !dbg !40
  br label %return, !dbg !40

if.end:                                           ; preds = %for.body
  %3 = load i8*, i8** @unbase58.tmpl, align 8, !dbg !42
  %sub.ptr.lhs.cast = ptrtoint i8* %call to i64, !dbg !43
  %sub.ptr.rhs.cast = ptrtoint i8* %3 to i64, !dbg !43
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !43
  %conv4 = trunc i64 %sub.ptr.sub to i32, !dbg !44
  call void @llvm.dbg.value(metadata i32 %conv4, metadata !45, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.value(metadata i32 25, metadata !46, metadata !DIExpression()), !dbg !22
  br label %for.cond5, !dbg !47

for.cond5:                                        ; preds = %for.body7, %if.end
  %j.0 = phi i32 [ 25, %if.end ], [ %dec, %for.body7 ], !dbg !49
  %c.0 = phi i32 [ %conv4, %if.end ], [ %div, %for.body7 ], !dbg !50
  call void @llvm.dbg.value(metadata i32 %c.0, metadata !45, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !46, metadata !DIExpression()), !dbg !22
  %dec = add nsw i32 %j.0, -1, !dbg !51
  call void @llvm.dbg.value(metadata i32 %dec, metadata !46, metadata !DIExpression()), !dbg !22
  %tobool6 = icmp ne i32 %j.0, 0, !dbg !53
  br i1 %tobool6, label %for.body7, label %for.end, !dbg !53

for.body7:                                        ; preds = %for.cond5
  %idxprom8 = sext i32 %dec to i64, !dbg !54
  %arrayidx9 = getelementptr inbounds i8, i8* %out, i64 %idxprom8, !dbg !54
  %4 = load i8, i8* %arrayidx9, align 1, !dbg !54
  %conv10 = zext i8 %4 to i32, !dbg !54
  %mul = mul nsw i32 58, %conv10, !dbg !56
  %add = add nsw i32 %c.0, %mul, !dbg !57
  call void @llvm.dbg.value(metadata i32 %add, metadata !45, metadata !DIExpression()), !dbg !22
  %rem = srem i32 %add, 256, !dbg !58
  %conv11 = trunc i32 %rem to i8, !dbg !59
  %idxprom12 = sext i32 %dec to i64, !dbg !60
  %arrayidx13 = getelementptr inbounds i8, i8* %out, i64 %idxprom12, !dbg !60
  store i8 %conv11, i8* %arrayidx13, align 1, !dbg !61
  %div = sdiv i32 %add, 256, !dbg !62
  call void @llvm.dbg.value(metadata i32 %div, metadata !45, metadata !DIExpression()), !dbg !22
  br label %for.cond5, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond5
  %tobool14 = icmp ne i32 %c.0, 0, !dbg !66
  br i1 %tobool14, label %if.then15, label %if.end16, !dbg !68

if.then15:                                        ; preds = %for.end
  store i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0), i8** @coin_err, align 8, !dbg !69
  br label %return, !dbg !69

if.end16:                                         ; preds = %for.end
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %if.end16
  %inc = add nsw i32 %i.0, 1, !dbg !72
  call void @llvm.dbg.value(metadata i32 %inc, metadata !25, metadata !DIExpression()), !dbg !22
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end17:                                        ; preds = %for.cond
  br label %return, !dbg !76

return:                                           ; preds = %for.end17, %if.then15, %if.then
  %retval.0 = phi i32 [ 0, %if.then15 ], [ 0, %if.then ], [ 1, %for.end17 ], !dbg !22
  ret i32 %retval.0, !dbg !77
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly
declare dso_local i8* @strchr(i8*, i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @valid(i8* %s) #0 !dbg !78 {
entry:
  %dec = alloca [32 x i8], align 16
  %d1 = alloca [32 x i8], align 16
  %d2 = alloca [32 x i8], align 16
  call void @llvm.dbg.value(metadata i8* %s, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [32 x i8]* %dec, metadata !83, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [32 x i8]* %d1, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [32 x i8]* %d2, metadata !90, metadata !DIExpression()), !dbg !91
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.3, i64 0, i64 0), i8** @coin_err, align 8, !dbg !92
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %dec, i64 0, i64 0, !dbg !93
  %call = call i32 @unbase58(i8* %s, i8* %arraydecay), !dbg !95
  %tobool = icmp ne i32 %call, 0, !dbg !95
  br i1 %tobool, label %if.end, label %if.then, !dbg !96

if.then:                                          ; preds = %entry
  br label %return, !dbg !97

if.end:                                           ; preds = %entry
  %arraydecay1 = getelementptr inbounds [32 x i8], [32 x i8]* %dec, i64 0, i64 0, !dbg !98
  %arraydecay2 = getelementptr inbounds [32 x i8], [32 x i8]* %d1, i64 0, i64 0, !dbg !99
  %call3 = call i8* @SHA256(i8* %arraydecay1, i64 21, i8* %arraydecay2), !dbg !100
  %arraydecay4 = getelementptr inbounds [32 x i8], [32 x i8]* %d2, i64 0, i64 0, !dbg !101
  %call5 = call i8* @SHA256(i8* %call3, i64 32, i8* %arraydecay4), !dbg !102
  %arraydecay6 = getelementptr inbounds [32 x i8], [32 x i8]* %dec, i64 0, i64 0, !dbg !103
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay6, i64 21, !dbg !105
  %arraydecay7 = getelementptr inbounds [32 x i8], [32 x i8]* %d2, i64 0, i64 0, !dbg !106
  %call8 = call i32 @memcmp(i8* %add.ptr, i8* %arraydecay7, i64 4) #5, !dbg !107
  %tobool9 = icmp ne i32 %call8, 0, !dbg !107
  br i1 %tobool9, label %if.then10, label %if.end11, !dbg !108

if.then10:                                        ; preds = %if.end
  store i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i64 0, i64 0), i8** @coin_err, align 8, !dbg !109
  br label %return, !dbg !109

if.end11:                                         ; preds = %if.end
  br label %return, !dbg !111

return:                                           ; preds = %if.end11, %if.then10, %if.then
  %retval.0 = phi i32 [ 0, %if.then10 ], [ 1, %if.end11 ], [ 0, %if.then ], !dbg !82
  ret i32 %retval.0, !dbg !112
}

declare dso_local i8* @SHA256(i8*, i64, i8*) #4

; Function Attrs: nounwind readonly
declare dso_local i32 @memcmp(i8*, i8*, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !113 {
entry:
  %s = alloca [5 x i8*], align 16
  call void @llvm.dbg.declare(metadata [5 x i8*]* %s, metadata !116, metadata !DIExpression()), !dbg !120
  %0 = bitcast [5 x i8*]* %s to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !120
  %1 = bitcast i8* %0 to [5 x i8*]*, !dbg !120
  %2 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 0, !dbg !120
  store i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.5, i32 0, i32 0), i8** %2, align 16, !dbg !120
  %3 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 1, !dbg !120
  store i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.6, i32 0, i32 0), i8** %3, align 8, !dbg !120
  %4 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 2, !dbg !120
  store i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7, i32 0, i32 0), i8** %4, align 16, !dbg !120
  %5 = getelementptr inbounds [5 x i8*], [5 x i8*]* %1, i32 0, i32 3, !dbg !120
  store i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8, i32 0, i32 0), i8** %5, align 8, !dbg !120
  call void @llvm.dbg.value(metadata i32 0, metadata !121, metadata !DIExpression()), !dbg !122
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !125
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !121, metadata !DIExpression()), !dbg !122
  %idxprom = sext i32 %i.0 to i64, !dbg !126
  %arrayidx = getelementptr inbounds [5 x i8*], [5 x i8*]* %s, i64 0, i64 %idxprom, !dbg !126
  %6 = load i8*, i8** %arrayidx, align 8, !dbg !126
  %tobool = icmp ne i8* %6, null, !dbg !128
  br i1 %tobool, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %idxprom1 = sext i32 %i.0 to i64, !dbg !129
  %arrayidx2 = getelementptr inbounds [5 x i8*], [5 x i8*]* %s, i64 0, i64 %idxprom1, !dbg !129
  %7 = load i8*, i8** %arrayidx2, align 8, !dbg !129
  %call = call i32 @valid(i8* %7), !dbg !131
  call void @llvm.dbg.value(metadata i32 %call, metadata !132, metadata !DIExpression()), !dbg !133
  %idxprom3 = sext i32 %i.0 to i64, !dbg !134
  %arrayidx4 = getelementptr inbounds [5 x i8*], [5 x i8*]* %s, i64 0, i64 %idxprom3, !dbg !134
  %8 = load i8*, i8** %arrayidx4, align 8, !dbg !134
  %tobool5 = icmp ne i32 %call, 0, !dbg !135
  br i1 %tobool5, label %cond.true, label %cond.false, !dbg !135

cond.true:                                        ; preds = %for.body
  br label %cond.end, !dbg !135

cond.false:                                       ; preds = %for.body
  %9 = load i8*, i8** @coin_err, align 8, !dbg !136
  br label %cond.end, !dbg !135

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i64 0, i64 0), %cond.true ], [ %9, %cond.false ], !dbg !135
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* %8, i8* %cond), !dbg !137
  br label %for.inc, !dbg !138

for.inc:                                          ; preds = %cond.end
  %inc = add nsw i32 %i.0, 1, !dbg !139
  call void @llvm.dbg.value(metadata i32 %inc, metadata !121, metadata !DIExpression()), !dbg !122
  br label %for.cond, !dbg !140, !llvm.loop !141

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !143
}

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "tmpl", scope: !2, file: !3, line: 9, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "unbase58", scope: !3, file: !3, line: 8, type: !4, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !13)
!3 = !DIFile(filename: "bitcoin-address-validation.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Bitcoin-address-validation")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7, !10}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !13, globals: !14, splitDebugInlining: false, nameTableKind: None)
!13 = !{}
!14 = !{!0, !15}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "coin_err", scope: !12, file: !3, line: 5, type: !7, isLocal: false, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!21 = !DILocalVariable(name: "s", arg: 1, scope: !2, file: !3, line: 8, type: !7)
!22 = !DILocation(line: 0, scope: !2)
!23 = !DILocalVariable(name: "out", arg: 2, scope: !2, file: !3, line: 8, type: !10)
!24 = !DILocation(line: 15, column: 2, scope: !2)
!25 = !DILocalVariable(name: "i", scope: !2, file: !3, line: 12, type: !6)
!26 = !DILocation(line: 16, column: 7, scope: !27)
!27 = distinct !DILexicalBlock(scope: !2, file: !3, line: 16, column: 2)
!28 = !DILocation(line: 0, scope: !27)
!29 = !DILocation(line: 16, column: 14, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !3, line: 16, column: 2)
!31 = !DILocation(line: 16, column: 2, scope: !27)
!32 = !DILocation(line: 17, column: 20, scope: !33)
!33 = distinct !DILexicalBlock(scope: !34, file: !3, line: 17, column: 7)
!34 = distinct !DILexicalBlock(scope: !30, file: !3, line: 16, column: 25)
!35 = !DILocation(line: 17, column: 26, scope: !33)
!36 = !DILocation(line: 17, column: 13, scope: !33)
!37 = !DILocalVariable(name: "p", scope: !2, file: !3, line: 13, type: !7)
!38 = !DILocation(line: 17, column: 11, scope: !33)
!39 = !DILocation(line: 17, column: 7, scope: !34)
!40 = !DILocation(line: 18, column: 4, scope: !41)
!41 = distinct !DILexicalBlock(scope: !33, file: !3, line: 18, column: 4)
!42 = !DILocation(line: 20, column: 11, scope: !34)
!43 = !DILocation(line: 20, column: 9, scope: !34)
!44 = !DILocation(line: 20, column: 7, scope: !34)
!45 = !DILocalVariable(name: "c", scope: !2, file: !3, line: 12, type: !6)
!46 = !DILocalVariable(name: "j", scope: !2, file: !3, line: 12, type: !6)
!47 = !DILocation(line: 21, column: 8, scope: !48)
!48 = distinct !DILexicalBlock(scope: !34, file: !3, line: 21, column: 3)
!49 = !DILocation(line: 0, scope: !48)
!50 = !DILocation(line: 0, scope: !34)
!51 = !DILocation(line: 21, column: 17, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !3, line: 21, column: 3)
!53 = !DILocation(line: 21, column: 3, scope: !48)
!54 = !DILocation(line: 22, column: 14, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !3, line: 21, column: 23)
!56 = !DILocation(line: 22, column: 12, scope: !55)
!57 = !DILocation(line: 22, column: 6, scope: !55)
!58 = !DILocation(line: 23, column: 15, scope: !55)
!59 = !DILocation(line: 23, column: 13, scope: !55)
!60 = !DILocation(line: 23, column: 4, scope: !55)
!61 = !DILocation(line: 23, column: 11, scope: !55)
!62 = !DILocation(line: 24, column: 6, scope: !55)
!63 = !DILocation(line: 21, column: 3, scope: !52)
!64 = distinct !{!64, !53, !65}
!65 = !DILocation(line: 25, column: 3, scope: !48)
!66 = !DILocation(line: 27, column: 7, scope: !67)
!67 = distinct !DILexicalBlock(scope: !34, file: !3, line: 27, column: 7)
!68 = !DILocation(line: 27, column: 7, scope: !34)
!69 = !DILocation(line: 27, column: 10, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !3, line: 27, column: 10)
!71 = !DILocation(line: 28, column: 2, scope: !34)
!72 = !DILocation(line: 16, column: 21, scope: !30)
!73 = !DILocation(line: 16, column: 2, scope: !30)
!74 = distinct !{!74, !31, !75}
!75 = !DILocation(line: 28, column: 2, scope: !27)
!76 = !DILocation(line: 30, column: 2, scope: !2)
!77 = !DILocation(line: 31, column: 1, scope: !2)
!78 = distinct !DISubprogram(name: "valid", scope: !3, file: !3, line: 33, type: !79, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !13)
!79 = !DISubroutineType(types: !80)
!80 = !{!6, !7}
!81 = !DILocalVariable(name: "s", arg: 1, scope: !78, file: !3, line: 33, type: !7)
!82 = !DILocation(line: 0, scope: !78)
!83 = !DILocalVariable(name: "dec", scope: !78, file: !3, line: 34, type: !84)
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 256, elements: !85)
!85 = !{!86}
!86 = !DISubrange(count: 32)
!87 = !DILocation(line: 34, column: 16, scope: !78)
!88 = !DILocalVariable(name: "d1", scope: !78, file: !3, line: 34, type: !84)
!89 = !DILocation(line: 34, column: 25, scope: !78)
!90 = !DILocalVariable(name: "d2", scope: !78, file: !3, line: 34, type: !84)
!91 = !DILocation(line: 34, column: 51, scope: !78)
!92 = !DILocation(line: 36, column: 11, scope: !78)
!93 = !DILocation(line: 37, column: 19, scope: !94)
!94 = distinct !DILexicalBlock(scope: !78, file: !3, line: 37, column: 6)
!95 = !DILocation(line: 37, column: 7, scope: !94)
!96 = !DILocation(line: 37, column: 6, scope: !78)
!97 = !DILocation(line: 37, column: 25, scope: !94)
!98 = !DILocation(line: 39, column: 16, scope: !78)
!99 = !DILocation(line: 39, column: 25, scope: !78)
!100 = !DILocation(line: 39, column: 9, scope: !78)
!101 = !DILocation(line: 39, column: 52, scope: !78)
!102 = !DILocation(line: 39, column: 2, scope: !78)
!103 = !DILocation(line: 41, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !78, file: !3, line: 41, column: 6)
!105 = !DILocation(line: 41, column: 17, scope: !104)
!106 = !DILocation(line: 41, column: 23, scope: !104)
!107 = !DILocation(line: 41, column: 6, scope: !104)
!108 = !DILocation(line: 41, column: 6, scope: !78)
!109 = !DILocation(line: 42, column: 3, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !3, line: 42, column: 3)
!111 = !DILocation(line: 44, column: 2, scope: !78)
!112 = !DILocation(line: 45, column: 1, scope: !78)
!113 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 47, type: !114, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !13)
!114 = !DISubroutineType(types: !115)
!115 = !{!6}
!116 = !DILocalVariable(name: "s", scope: !113, file: !3, line: 48, type: !117)
!117 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 320, elements: !118)
!118 = !{!119}
!119 = !DISubrange(count: 5)
!120 = !DILocation(line: 48, column: 14, scope: !113)
!121 = !DILocalVariable(name: "i", scope: !113, file: !3, line: 54, type: !6)
!122 = !DILocation(line: 0, scope: !113)
!123 = !DILocation(line: 55, column: 7, scope: !124)
!124 = distinct !DILexicalBlock(scope: !113, file: !3, line: 55, column: 2)
!125 = !DILocation(line: 0, scope: !124)
!126 = !DILocation(line: 55, column: 14, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !3, line: 55, column: 2)
!128 = !DILocation(line: 55, column: 2, scope: !124)
!129 = !DILocation(line: 56, column: 22, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !3, line: 55, column: 25)
!131 = !DILocation(line: 56, column: 16, scope: !130)
!132 = !DILocalVariable(name: "status", scope: !130, file: !3, line: 56, type: !6)
!133 = !DILocation(line: 0, scope: !130)
!134 = !DILocation(line: 57, column: 22, scope: !130)
!135 = !DILocation(line: 57, column: 28, scope: !130)
!136 = !DILocation(line: 57, column: 44, scope: !130)
!137 = !DILocation(line: 57, column: 3, scope: !130)
!138 = !DILocation(line: 58, column: 2, scope: !130)
!139 = !DILocation(line: 55, column: 21, scope: !127)
!140 = !DILocation(line: 55, column: 2, scope: !127)
!141 = distinct !{!141, !128, !142}
!142 = !DILocation(line: 58, column: 2, scope: !124)
!143 = !DILocation(line: 60, column: 2, scope: !113)
