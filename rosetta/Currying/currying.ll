; ModuleID = 'currying.c'
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
  %retval = alloca i64, align 8
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !12, metadata !DIExpression()), !dbg !13
  %0 = load i32, i32* %n.addr, align 4, !dbg !14
  %cmp = icmp sgt i32 %0, 1, !dbg !16
  br i1 %cmp, label %if.then, label %if.end, !dbg !17, !cf.info !18

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !19
  %conv = sext i32 %1 to i64, !dbg !19
  %2 = load i32, i32* %n.addr, align 4, !dbg !20
  %sub = sub nsw i32 %2, 1, !dbg !21
  %call = call i64 @factorial(i32 %sub), !dbg !22
  %mul = mul nsw i64 %conv, %call, !dbg !23
  store i64 %mul, i64* %retval, align 8, !dbg !24
  br label %return, !dbg !24

if.end:                                           ; preds = %entry
  store i64 1, i64* %retval, align 8, !dbg !25
  br label %return, !dbg !25

return:                                           ; preds = %if.end, %if.then
  %3 = load i64, i64* %retval, align 8, !dbg !26
  ret i64 %3, !dbg !26
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @sumOfFactorials(i32 %num, ...) #0 !dbg !27 {
entry:
  %num.addr = alloca i32, align 4
  %vaList = alloca [1 x %struct.__va_list_tag], align 16
  %sum = alloca i64, align 8
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [1 x %struct.__va_list_tag]* %vaList, metadata !32, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %sum, metadata !50, metadata !DIExpression()), !dbg !51
  store i64 0, i64* %sum, align 8, !dbg !51
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %vaList, i64 0, i64 0, !dbg !52
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*, !dbg !52
  call void @llvm.va_start(i8* %arraydecay1), !dbg !52
  br label %while.cond, !dbg !53

while.cond:                                       ; preds = %vaarg.end, %entry
  %0 = load i32, i32* %num.addr, align 4, !dbg !54
  %dec = add nsw i32 %0, -1, !dbg !54
  store i32 %dec, i32* %num.addr, align 4, !dbg !54
  %tobool = icmp ne i32 %0, 0, !dbg !53
  br i1 %tobool, label %while.body, label %while.end, !dbg !53

while.body:                                       ; preds = %while.cond
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %vaList, i64 0, i64 0, !dbg !55
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %arraydecay2, i32 0, i32 0, !dbg !55
  %gp_offset = load i32, i32* %gp_offset_p, align 16, !dbg !55
  %fits_in_gp = icmp ule i32 %gp_offset, 40, !dbg !55
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem, !dbg !55

vaarg.in_reg:                                     ; preds = %while.body
  %1 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %arraydecay2, i32 0, i32 3, !dbg !55
  %reg_save_area = load i8*, i8** %1, align 16, !dbg !55
  %2 = getelementptr i8, i8* %reg_save_area, i32 %gp_offset, !dbg !55
  %3 = bitcast i8* %2 to i32*, !dbg !55
  %4 = add i32 %gp_offset, 8, !dbg !55
  store i32 %4, i32* %gp_offset_p, align 16, !dbg !55
  br label %vaarg.end, !dbg !55

vaarg.in_mem:                                     ; preds = %while.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %arraydecay2, i32 0, i32 2, !dbg !55
  %overflow_arg_area = load i8*, i8** %overflow_arg_area_p, align 8, !dbg !55
  %5 = bitcast i8* %overflow_arg_area to i32*, !dbg !55
  %overflow_arg_area.next = getelementptr i8, i8* %overflow_arg_area, i32 8, !dbg !55
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8, !dbg !55
  br label %vaarg.end, !dbg !55

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %3, %vaarg.in_reg ], [ %5, %vaarg.in_mem ], !dbg !55
  %6 = load i32, i32* %vaarg.addr, align 4, !dbg !55
  %call = call i64 @factorial(i32 %6), !dbg !56
  %7 = load i64, i64* %sum, align 8, !dbg !57
  %add = add nsw i64 %7, %call, !dbg !57
  store i64 %add, i64* %sum, align 8, !dbg !57
  br label %while.cond, !dbg !53, !llvm.loop !58

while.end:                                        ; preds = %while.cond
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %vaList, i64 0, i64 0, !dbg !60
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*, !dbg !60
  call void @llvm.va_end(i8* %arraydecay34), !dbg !60
  %8 = load i64, i64* %sum, align 8, !dbg !61
  ret i64 %8, !dbg !62
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i64 (i32, ...) @sumOfFactorials(i32 5, i32 1, i32 2, i32 3, i32 4, i32 5), !dbg !66
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0), i64 %call), !dbg !67
  %call2 = call i64 (i32, ...) @sumOfFactorials(i32 3, i32 3, i32 4, i32 5), !dbg !68
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.1, i64 0, i64 0), i64 %call2), !dbg !69
  %call4 = call i64 (i32, ...) @sumOfFactorials(i32 3, i32 1, i32 2, i32 3), !dbg !70
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i64 %call4), !dbg !71
  ret i32 0, !dbg !72
}

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "currying.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Currying")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "factorial", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11}
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 4, type: !11)
!13 = !DILocation(line: 4, column: 24, scope: !7)
!14 = !DILocation(line: 5, column: 5, scope: !15)
!15 = distinct !DILexicalBlock(scope: !7, file: !1, line: 5, column: 5)
!16 = !DILocation(line: 5, column: 6, scope: !15)
!17 = !DILocation(line: 5, column: 5, scope: !7)
!18 = !{!"if"}
!19 = !DILocation(line: 6, column: 10, scope: !15)
!20 = !DILocation(line: 6, column: 22, scope: !15)
!21 = !DILocation(line: 6, column: 23, scope: !15)
!22 = !DILocation(line: 6, column: 12, scope: !15)
!23 = !DILocation(line: 6, column: 11, scope: !15)
!24 = !DILocation(line: 6, column: 3, scope: !15)
!25 = !DILocation(line: 7, column: 2, scope: !7)
!26 = !DILocation(line: 8, column: 1, scope: !7)
!27 = distinct !DISubprogram(name: "sumOfFactorials", scope: !1, file: !1, line: 10, type: !28, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{!10, !11, null}
!30 = !DILocalVariable(name: "num", arg: 1, scope: !27, file: !1, line: 10, type: !11)
!31 = !DILocation(line: 10, column: 30, scope: !27)
!32 = !DILocalVariable(name: "vaList", scope: !27, file: !1, line: 11, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !34, line: 52, baseType: !35)
!34 = !DIFile(filename: "/usr/include/stdio.h", directory: "")
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !36, line: 32, baseType: !37)
!36 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stdarg.h", directory: "")
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !1, line: 11, baseType: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !39, size: 192, elements: !47)
!39 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !1, line: 11, size: 192, elements: !40)
!40 = !{!41, !43, !44, !46}
!41 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !39, file: !1, line: 11, baseType: !42, size: 32)
!42 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !39, file: !1, line: 11, baseType: !42, size: 32, offset: 32)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !39, file: !1, line: 11, baseType: !45, size: 64, offset: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !39, file: !1, line: 11, baseType: !45, size: 64, offset: 128)
!47 = !{!48}
!48 = !DISubrange(count: 1)
!49 = !DILocation(line: 11, column: 10, scope: !27)
!50 = !DILocalVariable(name: "sum", scope: !27, file: !1, line: 12, type: !10)
!51 = !DILocation(line: 12, column: 11, scope: !27)
!52 = !DILocation(line: 14, column: 2, scope: !27)
!53 = !DILocation(line: 16, column: 2, scope: !27)
!54 = !DILocation(line: 16, column: 11, scope: !27)
!55 = !DILocation(line: 17, column: 20, scope: !27)
!56 = !DILocation(line: 17, column: 10, scope: !27)
!57 = !DILocation(line: 17, column: 7, scope: !27)
!58 = distinct !{!58, !53, !59}
!59 = !DILocation(line: 17, column: 38, scope: !27)
!60 = !DILocation(line: 19, column: 2, scope: !27)
!61 = !DILocation(line: 21, column: 9, scope: !27)
!62 = !DILocation(line: 21, column: 2, scope: !27)
!63 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 24, type: !64, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!11}
!66 = !DILocation(line: 26, column: 46, scope: !63)
!67 = !DILocation(line: 26, column: 2, scope: !63)
!68 = !DILocation(line: 27, column: 46, scope: !63)
!69 = !DILocation(line: 27, column: 2, scope: !63)
!70 = !DILocation(line: 28, column: 46, scope: !63)
!71 = !DILocation(line: 28, column: 2, scope: !63)
!72 = !DILocation(line: 30, column: 2, scope: !63)
