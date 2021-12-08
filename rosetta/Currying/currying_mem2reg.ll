; ModuleID = 'currying.ll'
source_filename = "currying.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [34 x i8] c"\0ASum of factorials of [1,5] : %ld\00", align 1
@.str.1 = private unnamed_addr constant [34 x i8] c"\0ASum of factorials of [3,5] : %ld\00", align 1
@.str.2 = private unnamed_addr constant [34 x i8] c"\0ASum of factorials of [1,3] : %ld\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @factorial(i32 %n) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !12, metadata !DIExpression()), !dbg !13
  %cmp = icmp sgt i32 %n, 1, !dbg !14
  br i1 %cmp, label %if.then, label %if.end, !dbg !16

if.then:                                          ; preds = %entry
  %conv = sext i32 %n to i64, !dbg !17
  %sub = sub nsw i32 %n, 1, !dbg !18
  %call = call i64 @factorial(i32 %sub), !dbg !19
  %mul = mul nsw i64 %conv, %call, !dbg !20
  br label %return, !dbg !21

if.end:                                           ; preds = %entry
  br label %return, !dbg !22

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i64 [ %mul, %if.then ], [ 1, %if.end ], !dbg !13
  ret i64 %retval.0, !dbg !23
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @sumOfFactorials(i32 %num, ...) #0 !dbg !24 {
entry:
  %vaList = alloca [1 x %struct.__va_list_tag], align 16
  call void @llvm.dbg.value(metadata i32 %num, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [1 x %struct.__va_list_tag]* %vaList, metadata !29, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.value(metadata i64 0, metadata !47, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %vaList, i64 0, i64 0, !dbg !48
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*, !dbg !48
  call void @llvm.va_start(i8* %arraydecay1), !dbg !48
  br label %while.cond, !dbg !49

while.cond:                                       ; preds = %vaarg.end, %entry
  %sum.0 = phi i64 [ 0, %entry ], [ %add, %vaarg.end ], !dbg !28
  %num.addr.0 = phi i32 [ %num, %entry ], [ %dec, %vaarg.end ]
  call void @llvm.dbg.value(metadata i32 %num.addr.0, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i64 %sum.0, metadata !47, metadata !DIExpression()), !dbg !28
  %dec = add nsw i32 %num.addr.0, -1, !dbg !50
  call void @llvm.dbg.value(metadata i32 %dec, metadata !27, metadata !DIExpression()), !dbg !28
  %tobool = icmp ne i32 %num.addr.0, 0, !dbg !49
  br i1 %tobool, label %while.body, label %while.end, !dbg !49

while.body:                                       ; preds = %while.cond
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %vaList, i64 0, i64 0, !dbg !51
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %arraydecay2, i32 0, i32 0, !dbg !51
  %gp_offset = load i32, i32* %gp_offset_p, align 16, !dbg !51
  %fits_in_gp = icmp ule i32 %gp_offset, 40, !dbg !51
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem, !dbg !51

vaarg.in_reg:                                     ; preds = %while.body
  %0 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %arraydecay2, i32 0, i32 3, !dbg !51
  %reg_save_area = load i8*, i8** %0, align 16, !dbg !51
  %1 = getelementptr i8, i8* %reg_save_area, i32 %gp_offset, !dbg !51
  %2 = bitcast i8* %1 to i32*, !dbg !51
  %3 = add i32 %gp_offset, 8, !dbg !51
  store i32 %3, i32* %gp_offset_p, align 16, !dbg !51
  br label %vaarg.end, !dbg !51

vaarg.in_mem:                                     ; preds = %while.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %arraydecay2, i32 0, i32 2, !dbg !51
  %overflow_arg_area = load i8*, i8** %overflow_arg_area_p, align 8, !dbg !51
  %4 = bitcast i8* %overflow_arg_area to i32*, !dbg !51
  %overflow_arg_area.next = getelementptr i8, i8* %overflow_arg_area, i32 8, !dbg !51
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8, !dbg !51
  br label %vaarg.end, !dbg !51

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ], !dbg !51
  %5 = load i32, i32* %vaarg.addr, align 4, !dbg !51
  %call = call i64 @factorial(i32 %5), !dbg !52
  %add = add nsw i64 %sum.0, %call, !dbg !53
  call void @llvm.dbg.value(metadata i64 %add, metadata !47, metadata !DIExpression()), !dbg !28
  br label %while.cond, !dbg !49, !llvm.loop !54

while.end:                                        ; preds = %while.cond
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %vaList, i64 0, i64 0, !dbg !56
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*, !dbg !56
  call void @llvm.va_end(i8* %arraydecay34), !dbg !56
  ret i64 %sum.0, !dbg !57
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !58 {
entry:
  %call = call i64 (i32, ...) @sumOfFactorials(i32 5, i32 1, i32 2, i32 3, i32 4, i32 5), !dbg !61
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0), i64 %call), !dbg !62
  %call2 = call i64 (i32, ...) @sumOfFactorials(i32 3, i32 3, i32 4, i32 5), !dbg !63
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.1, i64 0, i64 0), i64 %call2), !dbg !64
  %call4 = call i64 (i32, ...) @sumOfFactorials(i32 3, i32 1, i32 2, i32 3), !dbg !65
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i64 %call4), !dbg !66
  ret i32 0, !dbg !67
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "currying.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Currying")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "factorial", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11}
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 4, type: !11)
!13 = !DILocation(line: 0, scope: !7)
!14 = !DILocation(line: 5, column: 6, scope: !15)
!15 = distinct !DILexicalBlock(scope: !7, file: !1, line: 5, column: 5)
!16 = !DILocation(line: 5, column: 5, scope: !7)
!17 = !DILocation(line: 6, column: 10, scope: !15)
!18 = !DILocation(line: 6, column: 23, scope: !15)
!19 = !DILocation(line: 6, column: 12, scope: !15)
!20 = !DILocation(line: 6, column: 11, scope: !15)
!21 = !DILocation(line: 6, column: 3, scope: !15)
!22 = !DILocation(line: 7, column: 2, scope: !7)
!23 = !DILocation(line: 8, column: 1, scope: !7)
!24 = distinct !DISubprogram(name: "sumOfFactorials", scope: !1, file: !1, line: 10, type: !25, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{!10, !11, null}
!27 = !DILocalVariable(name: "num", arg: 1, scope: !24, file: !1, line: 10, type: !11)
!28 = !DILocation(line: 0, scope: !24)
!29 = !DILocalVariable(name: "vaList", scope: !24, file: !1, line: 11, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !31, line: 52, baseType: !32)
!31 = !DIFile(filename: "/usr/include/stdio.h", directory: "")
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !33, line: 32, baseType: !34)
!33 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stdarg.h", directory: "")
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !1, line: 11, baseType: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 192, elements: !44)
!36 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !1, line: 11, size: 192, elements: !37)
!37 = !{!38, !40, !41, !43}
!38 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !36, file: !1, line: 11, baseType: !39, size: 32)
!39 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !36, file: !1, line: 11, baseType: !39, size: 32, offset: 32)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !36, file: !1, line: 11, baseType: !42, size: 64, offset: 64)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !36, file: !1, line: 11, baseType: !42, size: 64, offset: 128)
!44 = !{!45}
!45 = !DISubrange(count: 1)
!46 = !DILocation(line: 11, column: 10, scope: !24)
!47 = !DILocalVariable(name: "sum", scope: !24, file: !1, line: 12, type: !10)
!48 = !DILocation(line: 14, column: 2, scope: !24)
!49 = !DILocation(line: 16, column: 2, scope: !24)
!50 = !DILocation(line: 16, column: 11, scope: !24)
!51 = !DILocation(line: 17, column: 20, scope: !24)
!52 = !DILocation(line: 17, column: 10, scope: !24)
!53 = !DILocation(line: 17, column: 7, scope: !24)
!54 = distinct !{!54, !49, !55}
!55 = !DILocation(line: 17, column: 38, scope: !24)
!56 = !DILocation(line: 19, column: 2, scope: !24)
!57 = !DILocation(line: 21, column: 2, scope: !24)
!58 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 24, type: !59, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!11}
!61 = !DILocation(line: 26, column: 46, scope: !58)
!62 = !DILocation(line: 26, column: 2, scope: !58)
!63 = !DILocation(line: 27, column: 46, scope: !58)
!64 = !DILocation(line: 27, column: 2, scope: !58)
!65 = !DILocation(line: 28, column: 46, scope: !58)
!66 = !DILocation(line: 28, column: 2, scope: !58)
!67 = !DILocation(line: 30, column: 2, scope: !58)
