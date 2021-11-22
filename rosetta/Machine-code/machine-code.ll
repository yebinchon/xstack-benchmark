; ModuleID = 'machine-code.c'
source_filename = "machine-code.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.test.code = private unnamed_addr constant [9 x i8] c"\8BD$\04\03D$\08\C3", align 1
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @test(i32 %a, i32 %b) #0 !dbg !12 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %code = alloca [9 x i8], align 1
  %buf = alloca i8*, align 8
  %c = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata [9 x i8]* %code, metadata !17, metadata !DIExpression()), !dbg !22
  %0 = bitcast [9 x i8]* %code to i8*, !dbg !22
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([9 x i8], [9 x i8]* @__const.test.code, i32 0, i32 0), i64 9, i1 false), !dbg !22
  call void @llvm.dbg.declare(metadata i8** %buf, metadata !23, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32* %c, metadata !26, metadata !DIExpression()), !dbg !27
  %call = call i8* @mmap(i8* null, i64 9, i32 7, i32 34, i32 -1, i64 0) #5, !dbg !28
  store i8* %call, i8** %buf, align 8, !dbg !29
  %1 = load i8*, i8** %buf, align 8, !dbg !30
  %arraydecay = getelementptr inbounds [9 x i8], [9 x i8]* %code, i64 0, i64 0, !dbg !31
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 %arraydecay, i64 9, i1 false), !dbg !31
  %2 = load i8*, i8** %buf, align 8, !dbg !32
  %3 = bitcast i8* %2 to i32 (i32, i32)*, !dbg !33
  %4 = load i32, i32* %a.addr, align 4, !dbg !34
  %5 = load i32, i32* %b.addr, align 4, !dbg !35
  %call1 = call i32 %3(i32 %4, i32 %5), !dbg !36
  store i32 %call1, i32* %c, align 4, !dbg !37
  %6 = load i8*, i8** %buf, align 8, !dbg !38
  %call2 = call i32 @munmap(i8* %6, i64 9) #5, !dbg !39
  %7 = load i32, i32* %c, align 4, !dbg !40
  ret i32 %7, !dbg !41
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @mmap(i8*, i64, i32, i32, i32, i64) #3

; Function Attrs: nounwind
declare dso_local i32 @munmap(i8*, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 @test(i32 7, i32 12), !dbg !45
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %call), !dbg !46
  ret i32 0, !dbg !47
}

declare dso_local i32 @printf(i8*, ...) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "machine-code.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Machine-code")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7, !7}
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!12 = distinct !DISubprogram(name: "test", scope: !1, file: !1, line: 5, type: !5, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DILocalVariable(name: "a", arg: 1, scope: !12, file: !1, line: 5, type: !7)
!14 = !DILocation(line: 5, column: 15, scope: !12)
!15 = !DILocalVariable(name: "b", arg: 2, scope: !12, file: !1, line: 5, type: !7)
!16 = !DILocation(line: 5, column: 22, scope: !12)
!17 = !DILocalVariable(name: "code", scope: !12, file: !1, line: 12, type: !18)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 72, elements: !20)
!19 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!20 = !{!21}
!21 = !DISubrange(count: 9)
!22 = !DILocation(line: 12, column: 8, scope: !12)
!23 = !DILocalVariable(name: "buf", scope: !12, file: !1, line: 13, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!25 = !DILocation(line: 13, column: 9, scope: !12)
!26 = !DILocalVariable(name: "c", scope: !12, file: !1, line: 14, type: !7)
!27 = !DILocation(line: 14, column: 7, scope: !12)
!28 = !DILocation(line: 16, column: 9, scope: !12)
!29 = !DILocation(line: 16, column: 7, scope: !12)
!30 = !DILocation(line: 19, column: 11, scope: !12)
!31 = !DILocation(line: 19, column: 3, scope: !12)
!32 = !DILocation(line: 21, column: 28, scope: !12)
!33 = !DILocation(line: 21, column: 8, scope: !12)
!34 = !DILocation(line: 21, column: 33, scope: !12)
!35 = !DILocation(line: 21, column: 36, scope: !12)
!36 = !DILocation(line: 21, column: 7, scope: !12)
!37 = !DILocation(line: 21, column: 5, scope: !12)
!38 = !DILocation(line: 23, column: 11, scope: !12)
!39 = !DILocation(line: 23, column: 3, scope: !12)
!40 = !DILocation(line: 24, column: 10, scope: !12)
!41 = !DILocation(line: 24, column: 3, scope: !12)
!42 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 27, type: !43, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{!7}
!45 = !DILocation(line: 29, column: 18, scope: !42)
!46 = !DILocation(line: 29, column: 3, scope: !42)
!47 = !DILocation(line: 30, column: 3, scope: !42)
