; ModuleID = 'fibonacci-sequence-5.ll'
source_filename = "fibonacci-sequence-5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { i32, [1 x %struct.__mpz_struct], %struct.node* }
%struct.__mpz_struct = type { i32, i32, i64* }

@cache = common dso_local global [37 x %struct.node*] zeroinitializer, align 16, !dbg !0
@tmp1 = common dso_local global [1 x %struct.__mpz_struct] zeroinitializer, align 16, !dbg !6
@tmp2 = common dso_local global [1 x %struct.__mpz_struct] zeroinitializer, align 16, !dbg !23
@.str = private unnamed_addr constant [15 x i8] c"bad input: %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%Zd\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.node* @find_cache(i32 %n) #0 !dbg !39 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !42, metadata !DIExpression()), !dbg !43
  %rem = srem i32 %n, 37, !dbg !44
  call void @llvm.dbg.value(metadata i32 %rem, metadata !45, metadata !DIExpression()), !dbg !43
  %idxprom = sext i32 %rem to i64, !dbg !46
  %arrayidx = getelementptr inbounds [37 x %struct.node*], [37 x %struct.node*]* @cache, i64 0, i64 %idxprom, !dbg !46
  %0 = load %struct.node*, %struct.node** %arrayidx, align 8, !dbg !46
  call void @llvm.dbg.value(metadata %struct.node* %0, metadata !48, metadata !DIExpression()), !dbg !43
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %p.0 = phi %struct.node* [ %0, %entry ], [ %3, %for.inc ], !dbg !50
  call void @llvm.dbg.value(metadata %struct.node* %p.0, metadata !48, metadata !DIExpression()), !dbg !43
  %tobool = icmp ne %struct.node* %p.0, null, !dbg !51
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !53

land.rhs:                                         ; preds = %for.cond
  %n1 = getelementptr inbounds %struct.node, %struct.node* %p.0, i32 0, i32 0, !dbg !54
  %1 = load i32, i32* %n1, align 8, !dbg !54
  %cmp = icmp ne i32 %1, %n, !dbg !55
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %2 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ], !dbg !56
  br i1 %2, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %land.end
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %next = getelementptr inbounds %struct.node, %struct.node* %p.0, i32 0, i32 2, !dbg !58
  %3 = load %struct.node*, %struct.node** %next, align 8, !dbg !58
  call void @llvm.dbg.value(metadata %struct.node* %3, metadata !48, metadata !DIExpression()), !dbg !43
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %land.end
  %tobool2 = icmp ne %struct.node* %p.0, null, !dbg !62
  br i1 %tobool2, label %if.then, label %if.end, !dbg !64, !cf.info !65

if.then:                                          ; preds = %for.end
  br label %return, !dbg !66

if.end:                                           ; preds = %for.end
  %call = call noalias i8* @malloc(i64 32) #5, !dbg !67
  %4 = bitcast i8* %call to %struct.node*, !dbg !67
  call void @llvm.dbg.value(metadata %struct.node* %4, metadata !48, metadata !DIExpression()), !dbg !43
  %idxprom3 = sext i32 %rem to i64, !dbg !68
  %arrayidx4 = getelementptr inbounds [37 x %struct.node*], [37 x %struct.node*]* @cache, i64 0, i64 %idxprom3, !dbg !68
  %5 = load %struct.node*, %struct.node** %arrayidx4, align 8, !dbg !68
  %next5 = getelementptr inbounds %struct.node, %struct.node* %4, i32 0, i32 2, !dbg !69
  store %struct.node* %5, %struct.node** %next5, align 8, !dbg !70
  %idxprom6 = sext i32 %rem to i64, !dbg !71
  %arrayidx7 = getelementptr inbounds [37 x %struct.node*], [37 x %struct.node*]* @cache, i64 0, i64 %idxprom6, !dbg !71
  store %struct.node* %4, %struct.node** %arrayidx7, align 8, !dbg !72
  %cmp8 = icmp slt i32 %n, 2, !dbg !73
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !75, !cf.info !65

if.then9:                                         ; preds = %if.end
  %n10 = getelementptr inbounds %struct.node, %struct.node* %4, i32 0, i32 0, !dbg !76
  store i32 %n, i32* %n10, align 8, !dbg !78
  %v = getelementptr inbounds %struct.node, %struct.node* %4, i32 0, i32 1, !dbg !79
  %arraydecay = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %v, i64 0, i64 0, !dbg !80
  call void @__gmpz_init_set_ui(%struct.__mpz_struct* %arraydecay, i64 1), !dbg !81
  br label %if.end14, !dbg !82

if.else:                                          ; preds = %if.end
  %n11 = getelementptr inbounds %struct.node, %struct.node* %4, i32 0, i32 0, !dbg !83
  store i32 -1, i32* %n11, align 8, !dbg !85
  %v12 = getelementptr inbounds %struct.node, %struct.node* %4, i32 0, i32 1, !dbg !86
  %arraydecay13 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %v12, i64 0, i64 0, !dbg !87
  call void @__gmpz_init(%struct.__mpz_struct* %arraydecay13), !dbg !88
  br label %if.end14

if.end14:                                         ; preds = %if.else, %if.then9
  br label %return, !dbg !89

return:                                           ; preds = %if.end14, %if.then
  %retval.0 = phi %struct.node* [ %p.0, %if.then ], [ %4, %if.end14 ], !dbg !43
  ret %struct.node* %retval.0, !dbg !90
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

declare dso_local void @__gmpz_init_set_ui(%struct.__mpz_struct*, i64) #3

declare dso_local void @__gmpz_init(%struct.__mpz_struct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local [1 x %struct.__mpz_struct]* @fib(i32 %n) #0 !dbg !91 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call %struct.node* @find_cache(i32 %n), !dbg !97
  call void @llvm.dbg.value(metadata %struct.node* %call, metadata !98, metadata !DIExpression()), !dbg !96
  %n1 = getelementptr inbounds %struct.node, %struct.node* %call, i32 0, i32 0, !dbg !99
  %0 = load i32, i32* %n1, align 8, !dbg !99
  %cmp = icmp slt i32 %0, 0, !dbg !101
  br i1 %cmp, label %if.then, label %if.end, !dbg !102, !cf.info !65

if.then:                                          ; preds = %entry
  %n2 = getelementptr inbounds %struct.node, %struct.node* %call, i32 0, i32 0, !dbg !103
  store i32 %n, i32* %n2, align 8, !dbg !105
  %div = sdiv i32 %n, 2, !dbg !106
  call void @llvm.dbg.value(metadata i32 %div, metadata !107, metadata !DIExpression()), !dbg !96
  %sub = sub nsw i32 %div, 1, !dbg !108
  %call3 = call [1 x %struct.__mpz_struct]* @fib(i32 %sub), !dbg !109
  %arraydecay = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %call3, i64 0, i64 0, !dbg !110
  %sub4 = sub nsw i32 %n, %div, !dbg !111
  %sub5 = sub nsw i32 %sub4, 1, !dbg !112
  %call6 = call [1 x %struct.__mpz_struct]* @fib(i32 %sub5), !dbg !113
  %arraydecay7 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %call6, i64 0, i64 0, !dbg !114
  call void @__gmpz_mul(%struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @tmp1, i64 0, i64 0), %struct.__mpz_struct* %arraydecay, %struct.__mpz_struct* %arraydecay7), !dbg !115
  %call8 = call [1 x %struct.__mpz_struct]* @fib(i32 %div), !dbg !116
  %arraydecay9 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %call8, i64 0, i64 0, !dbg !117
  %sub10 = sub nsw i32 %n, %div, !dbg !118
  %call11 = call [1 x %struct.__mpz_struct]* @fib(i32 %sub10), !dbg !119
  %arraydecay12 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %call11, i64 0, i64 0, !dbg !120
  call void @__gmpz_mul(%struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @tmp2, i64 0, i64 0), %struct.__mpz_struct* %arraydecay9, %struct.__mpz_struct* %arraydecay12), !dbg !121
  %v = getelementptr inbounds %struct.node, %struct.node* %call, i32 0, i32 1, !dbg !122
  %arraydecay13 = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %v, i64 0, i64 0, !dbg !123
  call void @__gmpz_add(%struct.__mpz_struct* %arraydecay13, %struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @tmp1, i64 0, i64 0), %struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @tmp2, i64 0, i64 0)), !dbg !124
  br label %if.end, !dbg !125

if.end:                                           ; preds = %if.then, %entry
  %v14 = getelementptr inbounds %struct.node, %struct.node* %call, i32 0, i32 1, !dbg !126
  ret [1 x %struct.__mpz_struct]* %v14, !dbg !127
}

declare dso_local void @__gmpz_mul(%struct.__mpz_struct*, %struct.__mpz_struct*, %struct.__mpz_struct*) #3

declare dso_local void @__gmpz_add(%struct.__mpz_struct*, %struct.__mpz_struct*, %struct.__mpz_struct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !128 {
entry:
  call void @llvm.dbg.value(metadata i32 %argc, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.value(metadata i8** %argv, metadata !136, metadata !DIExpression()), !dbg !135
  %cmp = icmp slt i32 %argc, 2, !dbg !137
  br i1 %cmp, label %if.then, label %if.end, !dbg !139, !cf.info !65

if.then:                                          ; preds = %entry
  br label %return, !dbg !140

if.end:                                           ; preds = %entry
  call void @__gmpz_init(%struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @tmp1, i64 0, i64 0)), !dbg !141
  call void @__gmpz_init(%struct.__mpz_struct* getelementptr inbounds ([1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* @tmp2, i64 0, i64 0)), !dbg !142
  call void @llvm.dbg.value(metadata i32 1, metadata !143, metadata !DIExpression()), !dbg !135
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ 1, %if.end ], [ %inc, %for.inc ], !dbg !146
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !143, metadata !DIExpression()), !dbg !135
  %cmp1 = icmp slt i32 %i.0, %argc, !dbg !147
  br i1 %cmp1, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !dbg !150
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 %idxprom, !dbg !150
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !150
  %call = call i32 @atoi(i8* %0) #6, !dbg !152
  call void @llvm.dbg.value(metadata i32 %call, metadata !153, metadata !DIExpression()), !dbg !135
  %cmp2 = icmp slt i32 %call, 0, !dbg !154
  br i1 %cmp2, label %if.then3, label %if.end7, !dbg !156, !cf.info !65

if.then3:                                         ; preds = %for.body
  %idxprom4 = sext i32 %i.0 to i64, !dbg !157
  %arrayidx5 = getelementptr inbounds i8*, i8** %argv, i64 %idxprom4, !dbg !157
  %1 = load i8*, i8** %arrayidx5, align 8, !dbg !157
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i8* %1), !dbg !159
  br label %for.inc, !dbg !160

if.end7:                                          ; preds = %for.body
  %call8 = call [1 x %struct.__mpz_struct]* @fib(i32 %call), !dbg !161
  %arraydecay = getelementptr inbounds [1 x %struct.__mpz_struct], [1 x %struct.__mpz_struct]* %call8, i64 0, i64 0, !dbg !162
  %call9 = call i32 (i8*, ...) @__gmp_printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), %struct.__mpz_struct* %arraydecay), !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %if.end7, %if.then3
  %inc = add nsw i32 %i.0, 1, !dbg !165
  call void @llvm.dbg.value(metadata i32 %inc, metadata !143, metadata !DIExpression()), !dbg !135
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  br label %return, !dbg !169

return:                                           ; preds = %for.end, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %for.end ], !dbg !135
  ret i32 %retval.0, !dbg !170
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #4

declare dso_local i32 @printf(i8*, ...) #3

declare dso_local i32 @__gmp_printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!35, !36, !37}
!llvm.ident = !{!38}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "cache", scope: !2, file: !3, line: 13, type: !25, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "fibonacci-sequence-5.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Fibonacci-sequence")
!4 = !{}
!5 = !{!0, !6, !23}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "tmp1", scope: !2, file: !3, line: 38, type: !8, isLocal: false, isDefinition: true)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "mpz_t", file: !9, line: 164, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/gmp.h", directory: "")
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 128, elements: !21)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mpz_struct", file: !9, line: 158, baseType: !12)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !9, line: 150, size: 128, elements: !13)
!13 = !{!14, !16, !17}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_alloc", scope: !12, file: !9, line: 152, baseType: !15, size: 32)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_size", scope: !12, file: !9, line: 154, baseType: !15, size: 32, offset: 32)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "_mp_d", scope: !12, file: !9, line: 157, baseType: !18, size: 64, offset: 64)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "mp_limb_t", file: !9, line: 141, baseType: !20)
!20 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!21 = !{!22}
!22 = !DISubrange(count: 1)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "tmp2", scope: !2, file: !3, line: 38, type: !8, isLocal: false, isDefinition: true)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 2368, elements: !33)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "node", file: !3, line: 5, baseType: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "node", file: !3, line: 6, size: 256, elements: !29)
!29 = !{!30, !31, !32}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !28, file: !3, line: 7, baseType: !15, size: 32)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !28, file: !3, line: 8, baseType: !8, size: 128, offset: 64)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !28, file: !3, line: 9, baseType: !26, size: 64, offset: 192)
!33 = !{!34}
!34 = !DISubrange(count: 37)
!35 = !{i32 7, !"Dwarf Version", i32 4}
!36 = !{i32 2, !"Debug Info Version", i32 3}
!37 = !{i32 1, !"wchar_size", i32 4}
!38 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!39 = distinct !DISubprogram(name: "find_cache", scope: !3, file: !3, line: 16, type: !40, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DISubroutineType(types: !41)
!41 = !{!26, !15}
!42 = !DILocalVariable(name: "n", arg: 1, scope: !39, file: !3, line: 16, type: !15)
!43 = !DILocation(line: 0, scope: !39)
!44 = !DILocation(line: 18, column: 14, scope: !39)
!45 = !DILocalVariable(name: "idx", scope: !39, file: !3, line: 18, type: !15)
!46 = !DILocation(line: 21, column: 11, scope: !47)
!47 = distinct !DILexicalBlock(scope: !39, file: !3, line: 21, column: 2)
!48 = !DILocalVariable(name: "p", scope: !39, file: !3, line: 19, type: !26)
!49 = !DILocation(line: 21, column: 7, scope: !47)
!50 = !DILocation(line: 0, scope: !47)
!51 = !DILocation(line: 21, column: 23, scope: !52)
!52 = distinct !DILexicalBlock(scope: !47, file: !3, line: 21, column: 2)
!53 = !DILocation(line: 21, column: 25, scope: !52)
!54 = !DILocation(line: 21, column: 31, scope: !52)
!55 = !DILocation(line: 21, column: 33, scope: !52)
!56 = !DILocation(line: 0, scope: !52)
!57 = !DILocation(line: 21, column: 2, scope: !47)
!58 = !DILocation(line: 21, column: 46, scope: !52)
!59 = !DILocation(line: 21, column: 2, scope: !52)
!60 = distinct !{!60, !57, !61}
!61 = !DILocation(line: 21, column: 51, scope: !47)
!62 = !DILocation(line: 22, column: 6, scope: !63)
!63 = distinct !DILexicalBlock(scope: !39, file: !3, line: 22, column: 6)
!64 = !DILocation(line: 22, column: 6, scope: !39)
!65 = !{!"if"}
!66 = !DILocation(line: 22, column: 9, scope: !63)
!67 = !DILocation(line: 24, column: 6, scope: !39)
!68 = !DILocation(line: 25, column: 12, scope: !39)
!69 = !DILocation(line: 25, column: 5, scope: !39)
!70 = !DILocation(line: 25, column: 10, scope: !39)
!71 = !DILocation(line: 26, column: 2, scope: !39)
!72 = !DILocation(line: 26, column: 13, scope: !39)
!73 = !DILocation(line: 28, column: 8, scope: !74)
!74 = distinct !DILexicalBlock(scope: !39, file: !3, line: 28, column: 6)
!75 = !DILocation(line: 28, column: 6, scope: !39)
!76 = !DILocation(line: 29, column: 6, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !3, line: 28, column: 13)
!78 = !DILocation(line: 29, column: 8, scope: !77)
!79 = !DILocation(line: 30, column: 22, scope: !77)
!80 = !DILocation(line: 30, column: 19, scope: !77)
!81 = !DILocation(line: 30, column: 3, scope: !77)
!82 = !DILocation(line: 31, column: 2, scope: !77)
!83 = !DILocation(line: 32, column: 6, scope: !84)
!84 = distinct !DILexicalBlock(scope: !74, file: !3, line: 31, column: 9)
!85 = !DILocation(line: 32, column: 8, scope: !84)
!86 = !DILocation(line: 33, column: 15, scope: !84)
!87 = !DILocation(line: 33, column: 12, scope: !84)
!88 = !DILocation(line: 33, column: 3, scope: !84)
!89 = !DILocation(line: 35, column: 2, scope: !39)
!90 = !DILocation(line: 36, column: 1, scope: !39)
!91 = distinct !DISubprogram(name: "fib", scope: !3, file: !3, line: 39, type: !92, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!92 = !DISubroutineType(types: !93)
!93 = !{!94, !15}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!95 = !DILocalVariable(name: "n", arg: 1, scope: !91, file: !3, line: 39, type: !15)
!96 = !DILocation(line: 0, scope: !91)
!97 = !DILocation(line: 42, column: 12, scope: !91)
!98 = !DILocalVariable(name: "p", scope: !91, file: !3, line: 42, type: !26)
!99 = !DILocation(line: 44, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !91, file: !3, line: 44, column: 6)
!101 = !DILocation(line: 44, column: 11, scope: !100)
!102 = !DILocation(line: 44, column: 6, scope: !91)
!103 = !DILocation(line: 45, column: 6, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !3, line: 44, column: 16)
!105 = !DILocation(line: 45, column: 8, scope: !104)
!106 = !DILocation(line: 46, column: 9, scope: !104)
!107 = !DILocalVariable(name: "x", scope: !91, file: !3, line: 41, type: !15)
!108 = !DILocation(line: 48, column: 23, scope: !104)
!109 = !DILocation(line: 48, column: 18, scope: !104)
!110 = !DILocation(line: 48, column: 17, scope: !104)
!111 = !DILocation(line: 48, column: 35, scope: !104)
!112 = !DILocation(line: 48, column: 39, scope: !104)
!113 = !DILocation(line: 48, column: 29, scope: !104)
!114 = !DILocation(line: 48, column: 28, scope: !104)
!115 = !DILocation(line: 48, column: 3, scope: !104)
!116 = !DILocation(line: 49, column: 18, scope: !104)
!117 = !DILocation(line: 49, column: 17, scope: !104)
!118 = !DILocation(line: 49, column: 33, scope: !104)
!119 = !DILocation(line: 49, column: 27, scope: !104)
!120 = !DILocation(line: 49, column: 26, scope: !104)
!121 = !DILocation(line: 49, column: 3, scope: !104)
!122 = !DILocation(line: 50, column: 14, scope: !104)
!123 = !DILocation(line: 50, column: 11, scope: !104)
!124 = !DILocation(line: 50, column: 3, scope: !104)
!125 = !DILocation(line: 51, column: 2, scope: !104)
!126 = !DILocation(line: 52, column: 13, scope: !91)
!127 = !DILocation(line: 52, column: 2, scope: !91)
!128 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 55, type: !129, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!129 = !DISubroutineType(types: !130)
!130 = !{!15, !15, !131}
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !132, size: 64)
!132 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !133, size: 64)
!133 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!134 = !DILocalVariable(name: "argc", arg: 1, scope: !128, file: !3, line: 55, type: !15)
!135 = !DILocation(line: 0, scope: !128)
!136 = !DILocalVariable(name: "argv", arg: 2, scope: !128, file: !3, line: 55, type: !131)
!137 = !DILocation(line: 58, column: 11, scope: !138)
!138 = distinct !DILexicalBlock(scope: !128, file: !3, line: 58, column: 6)
!139 = !DILocation(line: 58, column: 6, scope: !128)
!140 = !DILocation(line: 58, column: 16, scope: !138)
!141 = !DILocation(line: 60, column: 2, scope: !128)
!142 = !DILocation(line: 61, column: 2, scope: !128)
!143 = !DILocalVariable(name: "i", scope: !128, file: !3, line: 57, type: !15)
!144 = !DILocation(line: 63, column: 7, scope: !145)
!145 = distinct !DILexicalBlock(scope: !128, file: !3, line: 63, column: 2)
!146 = !DILocation(line: 0, scope: !145)
!147 = !DILocation(line: 63, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !3, line: 63, column: 2)
!149 = !DILocation(line: 63, column: 2, scope: !145)
!150 = !DILocation(line: 64, column: 12, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !3, line: 63, column: 29)
!152 = !DILocation(line: 64, column: 7, scope: !151)
!153 = !DILocalVariable(name: "n", scope: !128, file: !3, line: 57, type: !15)
!154 = !DILocation(line: 65, column: 9, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !3, line: 65, column: 7)
!156 = !DILocation(line: 65, column: 7, scope: !151)
!157 = !DILocation(line: 66, column: 30, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !3, line: 65, column: 14)
!159 = !DILocation(line: 66, column: 4, scope: !158)
!160 = !DILocation(line: 67, column: 4, scope: !158)
!161 = !DILocation(line: 71, column: 24, scope: !151)
!162 = !DILocation(line: 71, column: 23, scope: !151)
!163 = !DILocation(line: 71, column: 3, scope: !151)
!164 = !DILocation(line: 72, column: 2, scope: !151)
!165 = !DILocation(line: 63, column: 25, scope: !148)
!166 = !DILocation(line: 63, column: 2, scope: !148)
!167 = distinct !{!167, !149, !168}
!168 = !DILocation(line: 72, column: 2, scope: !145)
!169 = !DILocation(line: 73, column: 2, scope: !128)
!170 = !DILocation(line: 74, column: 1, scope: !128)
