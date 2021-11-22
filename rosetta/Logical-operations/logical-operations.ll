; ModuleID = 'logical-operations.c'
source_filename = "logical-operations.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"a and b is %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"a or b is %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"not a is %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_logic(i32 %a, i32 %b) #0 !dbg !7 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !13, metadata !DIExpression()), !dbg !14
  %0 = load i32, i32* %a.addr, align 4, !dbg !15
  %tobool = icmp ne i32 %0, 0, !dbg !15
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !16

land.rhs:                                         ; preds = %entry
  %1 = load i32, i32* %b.addr, align 4, !dbg !17
  %tobool1 = icmp ne i32 %1, 0, !dbg !16
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %2 = phi i1 [ false, %entry ], [ %tobool1, %land.rhs ], !dbg !18
  %land.ext = zext i1 %2 to i32, !dbg !16
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i32 %land.ext), !dbg !19
  %3 = load i32, i32* %a.addr, align 4, !dbg !20
  %tobool2 = icmp ne i32 %3, 0, !dbg !20
  br i1 %tobool2, label %lor.end, label %lor.rhs, !dbg !21

lor.rhs:                                          ; preds = %land.end
  %4 = load i32, i32* %b.addr, align 4, !dbg !22
  %tobool3 = icmp ne i32 %4, 0, !dbg !21
  br label %lor.end, !dbg !21

lor.end:                                          ; preds = %lor.rhs, %land.end
  %5 = phi i1 [ true, %land.end ], [ %tobool3, %lor.rhs ]
  %lor.ext = zext i1 %5 to i32, !dbg !21
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 %lor.ext), !dbg !23
  %6 = load i32, i32* %a.addr, align 4, !dbg !24
  %tobool5 = icmp ne i32 %6, 0, !dbg !25
  %lnot = xor i1 %tobool5, true, !dbg !25
  %lnot.ext = zext i1 %lnot to i32, !dbg !25
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 %lnot.ext), !dbg !26
  ret void, !dbg !27
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "logical-operations.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Logical-operations")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "print_logic", scope: !1, file: !1, line: 1, type: !8, scopeLine: 2, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 1, type: !10)
!12 = !DILocation(line: 1, column: 22, scope: !7)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 1, type: !10)
!14 = !DILocation(line: 1, column: 29, scope: !7)
!15 = !DILocation(line: 3, column: 29, scope: !7)
!16 = !DILocation(line: 3, column: 31, scope: !7)
!17 = !DILocation(line: 3, column: 34, scope: !7)
!18 = !DILocation(line: 0, scope: !7)
!19 = !DILocation(line: 3, column: 3, scope: !7)
!20 = !DILocation(line: 4, column: 28, scope: !7)
!21 = !DILocation(line: 4, column: 30, scope: !7)
!22 = !DILocation(line: 4, column: 33, scope: !7)
!23 = !DILocation(line: 4, column: 3, scope: !7)
!24 = !DILocation(line: 5, column: 28, scope: !7)
!25 = !DILocation(line: 5, column: 27, scope: !7)
!26 = !DILocation(line: 5, column: 3, scope: !7)
!27 = !DILocation(line: 6, column: 1, scope: !7)
