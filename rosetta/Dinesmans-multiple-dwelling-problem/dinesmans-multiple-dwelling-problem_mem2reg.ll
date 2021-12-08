; ModuleID = 'dinesmans-multiple-dwelling-problem.ll'
source_filename = "dinesmans-multiple-dwelling-problem.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@verbose = dso_local global i32 0, align 4, !dbg !0
@solution = dso_local global [5 x i32] zeroinitializer, align 16, !dbg !15
@occupied = dso_local global [5 x i32] zeroinitializer, align 16, !dbg !21
@.str = private unnamed_addr constant [6 x i8] c"baker\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"cooper\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"fletcher\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"miller\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"smith\00", align 1
@names = dso_local global [5 x i8*] [i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i32 0, i32 0)], align 16, !dbg !23
@cond = dso_local global [6 x i32 (i32*)*] [i32 (i32*)* @c0, i32 (i32*)* @c1, i32 (i32*)* @c2, i32 (i32*)* @c3, i32 (i32*)* @c4, i32 (i32*)* @c5], align 16, !dbg !29
@.str.5 = private unnamed_addr constant [7 x i8] c"%d %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [14 x i8] c"cond %d bad\0A\0A\00", align 1
@.str.7 = private unnamed_addr constant [20 x i8] c"Found arrangement:\0A\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"Nobody lives anywhere\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @c0(i32* %s) #0 !dbg !43 {
entry:
  call void @llvm.dbg.value(metadata i32* %s, metadata !45, metadata !DIExpression()), !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %s, i64 0, !dbg !47
  %0 = load i32, i32* %arrayidx, align 4, !dbg !47
  %cmp = icmp ne i32 %0, 4, !dbg !47
  %conv = zext i1 %cmp to i32, !dbg !47
  ret i32 %conv, !dbg !47
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @c1(i32* %s) #0 !dbg !48 {
entry:
  call void @llvm.dbg.value(metadata i32* %s, metadata !49, metadata !DIExpression()), !dbg !50
  %arrayidx = getelementptr inbounds i32, i32* %s, i64 1, !dbg !51
  %0 = load i32, i32* %arrayidx, align 4, !dbg !51
  %cmp = icmp ne i32 %0, 0, !dbg !51
  %conv = zext i1 %cmp to i32, !dbg !51
  ret i32 %conv, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @c2(i32* %s) #0 !dbg !52 {
entry:
  call void @llvm.dbg.value(metadata i32* %s, metadata !53, metadata !DIExpression()), !dbg !54
  %arrayidx = getelementptr inbounds i32, i32* %s, i64 2, !dbg !55
  %0 = load i32, i32* %arrayidx, align 4, !dbg !55
  %cmp = icmp ne i32 %0, 0, !dbg !55
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !55

land.rhs:                                         ; preds = %entry
  %arrayidx1 = getelementptr inbounds i32, i32* %s, i64 2, !dbg !55
  %1 = load i32, i32* %arrayidx1, align 4, !dbg !55
  %cmp2 = icmp ne i32 %1, 4, !dbg !55
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %2 = phi i1 [ false, %entry ], [ %cmp2, %land.rhs ], !dbg !54
  %land.ext = zext i1 %2 to i32, !dbg !55
  ret i32 %land.ext, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @c3(i32* %s) #0 !dbg !56 {
entry:
  call void @llvm.dbg.value(metadata i32* %s, metadata !57, metadata !DIExpression()), !dbg !58
  %arrayidx = getelementptr inbounds i32, i32* %s, i64 3, !dbg !59
  %0 = load i32, i32* %arrayidx, align 4, !dbg !59
  %arrayidx1 = getelementptr inbounds i32, i32* %s, i64 1, !dbg !59
  %1 = load i32, i32* %arrayidx1, align 4, !dbg !59
  %cmp = icmp sgt i32 %0, %1, !dbg !59
  %conv = zext i1 %cmp to i32, !dbg !59
  ret i32 %conv, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @c4(i32* %s) #0 !dbg !60 {
entry:
  call void @llvm.dbg.value(metadata i32* %s, metadata !61, metadata !DIExpression()), !dbg !62
  %arrayidx = getelementptr inbounds i32, i32* %s, i64 4, !dbg !63
  %0 = load i32, i32* %arrayidx, align 4, !dbg !63
  %arrayidx1 = getelementptr inbounds i32, i32* %s, i64 2, !dbg !63
  %1 = load i32, i32* %arrayidx1, align 4, !dbg !63
  %sub = sub nsw i32 %0, %1, !dbg !63
  %call = call i32 @abs(i32 %sub) #4, !dbg !63
  %cmp = icmp ne i32 %call, 1, !dbg !63
  %conv = zext i1 %cmp to i32, !dbg !63
  ret i32 %conv, !dbg !63
}

; Function Attrs: nounwind readnone
declare dso_local i32 @abs(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @c5(i32* %s) #0 !dbg !64 {
entry:
  call void @llvm.dbg.value(metadata i32* %s, metadata !65, metadata !DIExpression()), !dbg !66
  %arrayidx = getelementptr inbounds i32, i32* %s, i64 1, !dbg !67
  %0 = load i32, i32* %arrayidx, align 4, !dbg !67
  %arrayidx1 = getelementptr inbounds i32, i32* %s, i64 2, !dbg !67
  %1 = load i32, i32* %arrayidx1, align 4, !dbg !67
  %sub = sub nsw i32 %0, %1, !dbg !67
  %call = call i32 @abs(i32 %sub) #4, !dbg !67
  %cmp = icmp ne i32 %call, 1, !dbg !67
  %conv = zext i1 %cmp to i32, !dbg !67
  ret i32 %conv, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @solve(i32 %person) #0 !dbg !68 {
entry:
  call void @llvm.dbg.value(metadata i32 %person, metadata !71, metadata !DIExpression()), !dbg !72
  %cmp = icmp eq i32 %person, 5, !dbg !73
  br i1 %cmp, label %if.then, label %if.end30, !dbg !75

if.then:                                          ; preds = %entry
  call void @llvm.dbg.value(metadata i32 0, metadata !76, metadata !DIExpression()), !dbg !72
  br label %for.cond, !dbg !77

for.cond:                                         ; preds = %for.inc15, %if.then
  %i.0 = phi i32 [ 0, %if.then ], [ %inc16, %for.inc15 ], !dbg !80
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !76, metadata !DIExpression()), !dbg !72
  %cmp1 = icmp slt i32 %i.0, 6, !dbg !81
  br i1 %cmp1, label %for.body, label %for.end17, !dbg !83

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !84
  %arrayidx = getelementptr inbounds [6 x i32 (i32*)*], [6 x i32 (i32*)*]* @cond, i64 0, i64 %idxprom, !dbg !84
  %0 = load i32 (i32*)*, i32 (i32*)** %arrayidx, align 8, !dbg !84
  %call = call i32 %0(i32* getelementptr inbounds ([5 x i32], [5 x i32]* @solution, i64 0, i64 0)), !dbg !84
  %tobool = icmp ne i32 %call, 0, !dbg !84
  br i1 %tobool, label %if.then2, label %if.end, !dbg !87

if.then2:                                         ; preds = %for.body
  br label %for.inc15, !dbg !88

if.end:                                           ; preds = %for.body
  %1 = load i32, i32* @verbose, align 4, !dbg !89
  %tobool3 = icmp ne i32 %1, 0, !dbg !89
  br i1 %tobool3, label %if.then4, label %if.end14, !dbg !91

if.then4:                                         ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression()), !dbg !72
  br label %for.cond5, !dbg !93

for.cond5:                                        ; preds = %for.inc, %if.then4
  %j.0 = phi i32 [ 0, %if.then4 ], [ %inc, %for.inc ], !dbg !96
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !92, metadata !DIExpression()), !dbg !72
  %cmp6 = icmp slt i32 %j.0, 5, !dbg !97
  br i1 %cmp6, label %for.body7, label %for.end, !dbg !99

for.body7:                                        ; preds = %for.cond5
  %idxprom8 = sext i32 %j.0 to i64, !dbg !100
  %arrayidx9 = getelementptr inbounds [5 x i32], [5 x i32]* @solution, i64 0, i64 %idxprom8, !dbg !100
  %2 = load i32, i32* %arrayidx9, align 4, !dbg !100
  %idxprom10 = sext i32 %j.0 to i64, !dbg !101
  %arrayidx11 = getelementptr inbounds [5 x i8*], [5 x i8*]* @names, i64 0, i64 %idxprom10, !dbg !101
  %3 = load i8*, i8** %arrayidx11, align 8, !dbg !101
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), i32 %2, i8* %3), !dbg !102
  br label %for.inc, !dbg !102

for.inc:                                          ; preds = %for.body7
  %inc = add nsw i32 %j.0, 1, !dbg !103
  call void @llvm.dbg.value(metadata i32 %inc, metadata !92, metadata !DIExpression()), !dbg !72
  br label %for.cond5, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %for.cond5
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.6, i64 0, i64 0), i32 %i.0), !dbg !107
  br label %if.end14, !dbg !108

if.end14:                                         ; preds = %for.end, %if.end
  br label %return, !dbg !109

for.inc15:                                        ; preds = %if.then2
  %inc16 = add nsw i32 %i.0, 1, !dbg !110
  call void @llvm.dbg.value(metadata i32 %inc16, metadata !76, metadata !DIExpression()), !dbg !72
  br label %for.cond, !dbg !111, !llvm.loop !112

for.end17:                                        ; preds = %for.cond
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.7, i64 0, i64 0)), !dbg !114
  call void @llvm.dbg.value(metadata i32 0, metadata !76, metadata !DIExpression()), !dbg !72
  br label %for.cond19, !dbg !115

for.cond19:                                       ; preds = %for.inc27, %for.end17
  %i.1 = phi i32 [ 0, %for.end17 ], [ %inc28, %for.inc27 ], !dbg !117
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !76, metadata !DIExpression()), !dbg !72
  %cmp20 = icmp slt i32 %i.1, 5, !dbg !118
  br i1 %cmp20, label %for.body21, label %for.end29, !dbg !120

for.body21:                                       ; preds = %for.cond19
  %idxprom22 = sext i32 %i.1 to i64, !dbg !121
  %arrayidx23 = getelementptr inbounds [5 x i32], [5 x i32]* @solution, i64 0, i64 %idxprom22, !dbg !121
  %4 = load i32, i32* %arrayidx23, align 4, !dbg !121
  %idxprom24 = sext i32 %i.1 to i64, !dbg !122
  %arrayidx25 = getelementptr inbounds [5 x i8*], [5 x i8*]* @names, i64 0, i64 %idxprom24, !dbg !122
  %5 = load i8*, i8** %arrayidx25, align 8, !dbg !122
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), i32 %4, i8* %5), !dbg !123
  br label %for.inc27, !dbg !123

for.inc27:                                        ; preds = %for.body21
  %inc28 = add nsw i32 %i.1, 1, !dbg !124
  call void @llvm.dbg.value(metadata i32 %inc28, metadata !76, metadata !DIExpression()), !dbg !72
  br label %for.cond19, !dbg !125, !llvm.loop !126

for.end29:                                        ; preds = %for.cond19
  br label %return, !dbg !128

if.end30:                                         ; preds = %entry
  call void @llvm.dbg.value(metadata i32 0, metadata !76, metadata !DIExpression()), !dbg !72
  br label %for.cond31, !dbg !129

for.cond31:                                       ; preds = %for.inc49, %if.end30
  %i.2 = phi i32 [ 0, %if.end30 ], [ %inc50, %for.inc49 ], !dbg !131
  call void @llvm.dbg.value(metadata i32 %i.2, metadata !76, metadata !DIExpression()), !dbg !72
  %cmp32 = icmp slt i32 %i.2, 5, !dbg !132
  br i1 %cmp32, label %for.body33, label %for.end51, !dbg !134

for.body33:                                       ; preds = %for.cond31
  %idxprom34 = sext i32 %i.2 to i64, !dbg !135
  %arrayidx35 = getelementptr inbounds [5 x i32], [5 x i32]* @occupied, i64 0, i64 %idxprom34, !dbg !135
  %6 = load i32, i32* %arrayidx35, align 4, !dbg !135
  %tobool36 = icmp ne i32 %6, 0, !dbg !135
  br i1 %tobool36, label %if.then37, label %if.end38, !dbg !138

if.then37:                                        ; preds = %for.body33
  br label %for.inc49, !dbg !139

if.end38:                                         ; preds = %for.body33
  %idxprom39 = sext i32 %person to i64, !dbg !140
  %arrayidx40 = getelementptr inbounds [5 x i32], [5 x i32]* @solution, i64 0, i64 %idxprom39, !dbg !140
  store i32 %i.2, i32* %arrayidx40, align 4, !dbg !141
  %idxprom41 = sext i32 %i.2 to i64, !dbg !142
  %arrayidx42 = getelementptr inbounds [5 x i32], [5 x i32]* @occupied, i64 0, i64 %idxprom41, !dbg !142
  store i32 1, i32* %arrayidx42, align 4, !dbg !143
  %add = add nsw i32 %person, 1, !dbg !144
  %call43 = call i32 @solve(i32 %add), !dbg !146
  %tobool44 = icmp ne i32 %call43, 0, !dbg !146
  br i1 %tobool44, label %if.then45, label %if.end46, !dbg !147

if.then45:                                        ; preds = %if.end38
  br label %return, !dbg !148

if.end46:                                         ; preds = %if.end38
  %idxprom47 = sext i32 %i.2 to i64, !dbg !149
  %arrayidx48 = getelementptr inbounds [5 x i32], [5 x i32]* @occupied, i64 0, i64 %idxprom47, !dbg !149
  store i32 0, i32* %arrayidx48, align 4, !dbg !150
  br label %for.inc49, !dbg !151

for.inc49:                                        ; preds = %if.end46, %if.then37
  %inc50 = add nsw i32 %i.2, 1, !dbg !152
  call void @llvm.dbg.value(metadata i32 %inc50, metadata !76, metadata !DIExpression()), !dbg !72
  br label %for.cond31, !dbg !153, !llvm.loop !154

for.end51:                                        ; preds = %for.cond31
  br label %return, !dbg !156

return:                                           ; preds = %for.end51, %if.then45, %for.end29, %if.end14
  %retval.0 = phi i32 [ 0, %if.end14 ], [ 1, %for.end29 ], [ 1, %if.then45 ], [ 0, %for.end51 ], !dbg !72
  ret i32 %retval.0, !dbg !157
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !158 {
entry:
  store i32 0, i32* @verbose, align 4, !dbg !161
  %call = call i32 @solve(i32 0), !dbg !162
  %tobool = icmp ne i32 %call, 0, !dbg !162
  br i1 %tobool, label %if.end, label %if.then, !dbg !164

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0)), !dbg !165
  br label %if.end, !dbg !165

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !166
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!39, !40, !41}
!llvm.ident = !{!42}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "verbose", scope: !2, file: !3, line: 4, type: !18, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "dinesmans-multiple-dwelling-problem.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Dinesmans-multiple-dwelling-problem")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "tenants", file: !3, line: 14, baseType: !6, size: 32, elements: !7)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!8, !9, !10, !11, !12, !13}
!8 = !DIEnumerator(name: "baker", value: 0, isUnsigned: true)
!9 = !DIEnumerator(name: "cooper", value: 1, isUnsigned: true)
!10 = !DIEnumerator(name: "fletcher", value: 2, isUnsigned: true)
!11 = !DIEnumerator(name: "miller", value: 3, isUnsigned: true)
!12 = !DIEnumerator(name: "smith", value: 4, isUnsigned: true)
!13 = !DIEnumerator(name: "phantom_of_the_opera", value: 5, isUnsigned: true)
!14 = !{!0, !15, !21, !23, !29}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "solution", scope: !2, file: !3, line: 11, type: !17, isLocal: false, isDefinition: true)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 160, elements: !19)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !{!20}
!20 = !DISubrange(count: 5)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "occupied", scope: !2, file: !3, line: 12, type: !17, isLocal: false, isDefinition: true)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "names", scope: !2, file: !3, line: 23, type: !25, isLocal: false, isDefinition: true)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 320, elements: !19)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !28)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "cond", scope: !2, file: !3, line: 39, type: !31, isLocal: false, isDefinition: true)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 384, elements: !37)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "condition", file: !3, line: 6, baseType: !33)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DISubroutineType(types: !35)
!35 = !{!18, !36}
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!37 = !{!38}
!38 = !DISubrange(count: 6)
!39 = !{i32 7, !"Dwarf Version", i32 4}
!40 = !{i32 2, !"Debug Info Version", i32 3}
!41 = !{i32 1, !"wchar_size", i32 4}
!42 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!43 = distinct !DISubprogram(name: "c0", scope: !3, file: !3, line: 31, type: !34, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!44 = !{}
!45 = !DILocalVariable(name: "s", arg: 1, scope: !43, file: !3, line: 31, type: !36)
!46 = !DILocation(line: 0, scope: !43)
!47 = !DILocation(line: 31, column: 1, scope: !43)
!48 = distinct !DISubprogram(name: "c1", scope: !3, file: !3, line: 32, type: !34, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!49 = !DILocalVariable(name: "s", arg: 1, scope: !48, file: !3, line: 32, type: !36)
!50 = !DILocation(line: 0, scope: !48)
!51 = !DILocation(line: 32, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "c2", scope: !3, file: !3, line: 33, type: !34, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!53 = !DILocalVariable(name: "s", arg: 1, scope: !52, file: !3, line: 33, type: !36)
!54 = !DILocation(line: 0, scope: !52)
!55 = !DILocation(line: 33, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "c3", scope: !3, file: !3, line: 34, type: !34, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!57 = !DILocalVariable(name: "s", arg: 1, scope: !56, file: !3, line: 34, type: !36)
!58 = !DILocation(line: 0, scope: !56)
!59 = !DILocation(line: 34, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "c4", scope: !3, file: !3, line: 35, type: !34, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!61 = !DILocalVariable(name: "s", arg: 1, scope: !60, file: !3, line: 35, type: !36)
!62 = !DILocation(line: 0, scope: !60)
!63 = !DILocation(line: 35, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "c5", scope: !3, file: !3, line: 36, type: !34, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!65 = !DILocalVariable(name: "s", arg: 1, scope: !64, file: !3, line: 36, type: !36)
!66 = !DILocation(line: 0, scope: !64)
!67 = !DILocation(line: 36, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "solve", scope: !3, file: !3, line: 44, type: !69, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!69 = !DISubroutineType(types: !70)
!70 = !{!18, !18}
!71 = !DILocalVariable(name: "person", arg: 1, scope: !68, file: !3, line: 44, type: !18)
!72 = !DILocation(line: 0, scope: !68)
!73 = !DILocation(line: 47, column: 13, scope: !74)
!74 = distinct !DILexicalBlock(scope: !68, file: !3, line: 47, column: 6)
!75 = !DILocation(line: 47, column: 6, scope: !68)
!76 = !DILocalVariable(name: "i", scope: !68, file: !3, line: 46, type: !18)
!77 = !DILocation(line: 49, column: 8, scope: !78)
!78 = distinct !DILexicalBlock(scope: !79, file: !3, line: 49, column: 3)
!79 = distinct !DILexicalBlock(scope: !74, file: !3, line: 47, column: 38)
!80 = !DILocation(line: 0, scope: !78)
!81 = !DILocation(line: 49, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !3, line: 49, column: 3)
!83 = !DILocation(line: 49, column: 3, scope: !78)
!84 = !DILocation(line: 50, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !86, file: !3, line: 50, column: 8)
!86 = distinct !DILexicalBlock(scope: !82, file: !3, line: 49, column: 38)
!87 = !DILocation(line: 50, column: 8, scope: !86)
!88 = !DILocation(line: 50, column: 27, scope: !85)
!89 = !DILocation(line: 52, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !3, line: 52, column: 8)
!91 = !DILocation(line: 52, column: 8, scope: !86)
!92 = !DILocalVariable(name: "j", scope: !68, file: !3, line: 46, type: !18)
!93 = !DILocation(line: 53, column: 10, scope: !94)
!94 = distinct !DILexicalBlock(scope: !95, file: !3, line: 53, column: 5)
!95 = distinct !DILexicalBlock(scope: !90, file: !3, line: 52, column: 17)
!96 = !DILocation(line: 0, scope: !94)
!97 = !DILocation(line: 53, column: 19, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !3, line: 53, column: 5)
!99 = !DILocation(line: 53, column: 5, scope: !94)
!100 = !DILocation(line: 54, column: 24, scope: !98)
!101 = !DILocation(line: 54, column: 37, scope: !98)
!102 = !DILocation(line: 54, column: 6, scope: !98)
!103 = !DILocation(line: 53, column: 32, scope: !98)
!104 = !DILocation(line: 53, column: 5, scope: !98)
!105 = distinct !{!105, !99, !106}
!106 = !DILocation(line: 54, column: 45, scope: !94)
!107 = !DILocation(line: 55, column: 5, scope: !95)
!108 = !DILocation(line: 56, column: 4, scope: !95)
!109 = !DILocation(line: 57, column: 4, scope: !86)
!110 = !DILocation(line: 49, column: 34, scope: !82)
!111 = !DILocation(line: 49, column: 3, scope: !82)
!112 = distinct !{!112, !83, !113}
!113 = !DILocation(line: 58, column: 3, scope: !78)
!114 = !DILocation(line: 60, column: 3, scope: !79)
!115 = !DILocation(line: 61, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !79, file: !3, line: 61, column: 3)
!117 = !DILocation(line: 0, scope: !116)
!118 = !DILocation(line: 61, column: 17, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !3, line: 61, column: 3)
!120 = !DILocation(line: 61, column: 3, scope: !116)
!121 = !DILocation(line: 62, column: 22, scope: !119)
!122 = !DILocation(line: 62, column: 35, scope: !119)
!123 = !DILocation(line: 62, column: 4, scope: !119)
!124 = !DILocation(line: 61, column: 30, scope: !119)
!125 = !DILocation(line: 61, column: 3, scope: !119)
!126 = distinct !{!126, !120, !127}
!127 = !DILocation(line: 62, column: 43, scope: !116)
!128 = !DILocation(line: 63, column: 3, scope: !79)
!129 = !DILocation(line: 66, column: 7, scope: !130)
!130 = distinct !DILexicalBlock(scope: !68, file: !3, line: 66, column: 2)
!131 = !DILocation(line: 0, scope: !130)
!132 = !DILocation(line: 66, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !3, line: 66, column: 2)
!134 = !DILocation(line: 66, column: 2, scope: !130)
!135 = !DILocation(line: 67, column: 7, scope: !136)
!136 = distinct !DILexicalBlock(scope: !137, file: !3, line: 67, column: 7)
!137 = distinct !DILexicalBlock(scope: !133, file: !3, line: 66, column: 33)
!138 = !DILocation(line: 67, column: 7, scope: !137)
!139 = !DILocation(line: 67, column: 20, scope: !136)
!140 = !DILocation(line: 68, column: 3, scope: !137)
!141 = !DILocation(line: 68, column: 20, scope: !137)
!142 = !DILocation(line: 69, column: 3, scope: !137)
!143 = !DILocation(line: 69, column: 15, scope: !137)
!144 = !DILocation(line: 70, column: 20, scope: !145)
!145 = distinct !DILexicalBlock(scope: !137, file: !3, line: 70, column: 7)
!146 = !DILocation(line: 70, column: 7, scope: !145)
!147 = !DILocation(line: 70, column: 7, scope: !137)
!148 = !DILocation(line: 70, column: 26, scope: !145)
!149 = !DILocation(line: 71, column: 3, scope: !137)
!150 = !DILocation(line: 71, column: 15, scope: !137)
!151 = !DILocation(line: 72, column: 2, scope: !137)
!152 = !DILocation(line: 66, column: 29, scope: !133)
!153 = !DILocation(line: 66, column: 2, scope: !133)
!154 = distinct !{!154, !134, !155}
!155 = !DILocation(line: 72, column: 2, scope: !130)
!156 = !DILocation(line: 73, column: 2, scope: !68)
!157 = !DILocation(line: 74, column: 1, scope: !68)
!158 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 76, type: !159, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !44)
!159 = !DISubroutineType(types: !160)
!160 = !{!18}
!161 = !DILocation(line: 78, column: 10, scope: !158)
!162 = !DILocation(line: 79, column: 7, scope: !163)
!163 = distinct !DILexicalBlock(scope: !158, file: !3, line: 79, column: 6)
!164 = !DILocation(line: 79, column: 6, scope: !158)
!165 = !DILocation(line: 79, column: 17, scope: !163)
!166 = !DILocation(line: 80, column: 2, scope: !158)
