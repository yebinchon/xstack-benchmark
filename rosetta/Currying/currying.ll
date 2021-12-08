; ModuleID = 'currying.bc'
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
  br i1 %cmp, label %if.then, label %if.end, !dbg !17

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !18
  %conv = sext i32 %1 to i64, !dbg !18
  %2 = load i32, i32* %n.addr, align 4, !dbg !19
  %sub = sub nsw i32 %2, 1, !dbg !20
  %call = call i64 @factorial(i32 %sub), !dbg !21
  %mul = mul nsw i64 %conv, %call, !dbg !22
  store i64 %mul, i64* %retval, align 8, !dbg !23
  br label %return, !dbg !23

if.end:                                           ; preds = %entry
  store i64 1, i64* %retval, align 8, !dbg !24
  br label %return, !dbg !24

return:                                           ; preds = %if.end, %if.then
  %3 = load i64, i64* %retval, align 8, !dbg !25
  ret i64 %3, !dbg !25
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @sumOfFactorials(i32 %num, ...) #0 !dbg !26 {
entry:
  %num.addr = alloca i32, align 4
  %vaList = alloca [1 x %struct.__va_list_tag], align 16
  %sum = alloca i64, align 8
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [1 x %struct.__va_list_tag]* %vaList, metadata !31, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %sum, metadata !49, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %sum, align 8, !dbg !50
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %vaList, i64 0, i64 0, !dbg !51
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*, !dbg !51
  call void @llvm.va_start(i8* %arraydecay1), !dbg !51
  br label %while.cond, !dbg !52

while.cond:                                       ; preds = %vaarg.end, %entry
  %0 = load i32, i32* %num.addr, align 4, !dbg !53
  %dec = add nsw i32 %0, -1, !dbg !53
  store i32 %dec, i32* %num.addr, align 4, !dbg !53
  %tobool = icmp ne i32 %0, 0, !dbg !52
  br i1 %tobool, label %while.body, label %while.end, !dbg !52

while.body:                                       ; preds = %while.cond
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %vaList, i64 0, i64 0, !dbg !54
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %arraydecay2, i32 0, i32 0, !dbg !54
  %gp_offset = load i32, i32* %gp_offset_p, align 16, !dbg !54
  %fits_in_gp = icmp ule i32 %gp_offset, 40, !dbg !54
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem, !dbg !54

vaarg.in_reg:                                     ; preds = %while.body
  %1 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %arraydecay2, i32 0, i32 3, !dbg !54
  %reg_save_area = load i8*, i8** %1, align 16, !dbg !54
  %2 = getelementptr i8, i8* %reg_save_area, i32 %gp_offset, !dbg !54
  %3 = bitcast i8* %2 to i32*, !dbg !54
  %4 = add i32 %gp_offset, 8, !dbg !54
  store i32 %4, i32* %gp_offset_p, align 16, !dbg !54
  br label %vaarg.end, !dbg !54

vaarg.in_mem:                                     ; preds = %while.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %arraydecay2, i32 0, i32 2, !dbg !54
  %overflow_arg_area = load i8*, i8** %overflow_arg_area_p, align 8, !dbg !54
  %5 = bitcast i8* %overflow_arg_area to i32*, !dbg !54
  %overflow_arg_area.next = getelementptr i8, i8* %overflow_arg_area, i32 8, !dbg !54
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8, !dbg !54
  br label %vaarg.end, !dbg !54

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %3, %vaarg.in_reg ], [ %5, %vaarg.in_mem ], !dbg !54
  %6 = load i32, i32* %vaarg.addr, align 4, !dbg !54
  %call = call i64 @factorial(i32 %6), !dbg !55
  %7 = load i64, i64* %sum, align 8, !dbg !56
  %add = add nsw i64 %7, %call, !dbg !56
  store i64 %add, i64* %sum, align 8, !dbg !56
  br label %while.cond, !dbg !52, !llvm.loop !57

while.end:                                        ; preds = %while.cond
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %vaList, i64 0, i64 0, !dbg !59
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*, !dbg !59
  call void @llvm.va_end(i8* %arraydecay34), !dbg !59
  %8 = load i64, i64* %sum, align 8, !dbg !60
  ret i64 %8, !dbg !61
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i64 (i32, ...) @sumOfFactorials(i32 5, i32 1, i32 2, i32 3, i32 4, i32 5), !dbg !65
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0), i64 %call), !dbg !66
  %call2 = call i64 (i32, ...) @sumOfFactorials(i32 3, i32 3, i32 4, i32 5), !dbg !67
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.1, i64 0, i64 0), i64 %call2), !dbg !68
  %call4 = call i64 (i32, ...) @sumOfFactorials(i32 3, i32 1, i32 2, i32 3), !dbg !69
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i64 %call4), !dbg !70
  ret i32 0, !dbg !71
}

declare dso_local i32 @printf(i8*, ...) #3

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
!13 = !DILocation(line: 4, column: 24, scope: !7)
!14 = !DILocation(line: 5, column: 5, scope: !15)
!15 = distinct !DILexicalBlock(scope: !7, file: !1, line: 5, column: 5)
!16 = !DILocation(line: 5, column: 6, scope: !15)
!17 = !DILocation(line: 5, column: 5, scope: !7)
!18 = !DILocation(line: 6, column: 10, scope: !15)
!19 = !DILocation(line: 6, column: 22, scope: !15)
!20 = !DILocation(line: 6, column: 23, scope: !15)
!21 = !DILocation(line: 6, column: 12, scope: !15)
!22 = !DILocation(line: 6, column: 11, scope: !15)
!23 = !DILocation(line: 6, column: 3, scope: !15)
!24 = !DILocation(line: 7, column: 2, scope: !7)
!25 = !DILocation(line: 8, column: 1, scope: !7)
!26 = distinct !DISubprogram(name: "sumOfFactorials", scope: !1, file: !1, line: 10, type: !27, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DISubroutineType(types: !28)
!28 = !{!10, !11, null}
!29 = !DILocalVariable(name: "num", arg: 1, scope: !26, file: !1, line: 10, type: !11)
!30 = !DILocation(line: 10, column: 30, scope: !26)
!31 = !DILocalVariable(name: "vaList", scope: !26, file: !1, line: 11, type: !32)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !33, line: 52, baseType: !34)
!33 = !DIFile(filename: "/usr/include/stdio.h", directory: "")
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !35, line: 32, baseType: !36)
!35 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stdarg.h", directory: "")
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !1, line: 11, baseType: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 192, elements: !46)
!38 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !1, line: 11, size: 192, elements: !39)
!39 = !{!40, !42, !43, !45}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !38, file: !1, line: 11, baseType: !41, size: 32)
!41 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !38, file: !1, line: 11, baseType: !41, size: 32, offset: 32)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !38, file: !1, line: 11, baseType: !44, size: 64, offset: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !38, file: !1, line: 11, baseType: !44, size: 64, offset: 128)
!46 = !{!47}
!47 = !DISubrange(count: 1)
!48 = !DILocation(line: 11, column: 10, scope: !26)
!49 = !DILocalVariable(name: "sum", scope: !26, file: !1, line: 12, type: !10)
!50 = !DILocation(line: 12, column: 11, scope: !26)
!51 = !DILocation(line: 14, column: 2, scope: !26)
!52 = !DILocation(line: 16, column: 2, scope: !26)
!53 = !DILocation(line: 16, column: 11, scope: !26)
!54 = !DILocation(line: 17, column: 20, scope: !26)
!55 = !DILocation(line: 17, column: 10, scope: !26)
!56 = !DILocation(line: 17, column: 7, scope: !26)
!57 = distinct !{!57, !52, !58}
!58 = !DILocation(line: 17, column: 38, scope: !26)
!59 = !DILocation(line: 19, column: 2, scope: !26)
!60 = !DILocation(line: 21, column: 9, scope: !26)
!61 = !DILocation(line: 21, column: 2, scope: !26)
!62 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 24, type: !63, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!11}
!65 = !DILocation(line: 26, column: 46, scope: !62)
!66 = !DILocation(line: 26, column: 2, scope: !62)
!67 = !DILocation(line: 27, column: 46, scope: !62)
!68 = !DILocation(line: 27, column: 2, scope: !62)
!69 = !DILocation(line: 28, column: 46, scope: !62)
!70 = !DILocation(line: 28, column: 2, scope: !62)
!71 = !DILocation(line: 30, column: 2, scope: !62)
