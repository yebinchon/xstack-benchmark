; ModuleID = 'checkpoint-synchronization.bc'
source_filename = "checkpoint-synchronization.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [19 x i8] c"%d: taking job %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"%d: done job\0A\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"[%d] leaving\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %jobs = alloca i32, align 4
  %tid = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %jobs, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 41, i32* %jobs, align 4, !dbg !14
  call void @llvm.dbg.declare(metadata i32* %tid, metadata !15, metadata !DIExpression()), !dbg !16
  call void @omp_set_num_threads(i32 5), !dbg !17
  %call = call i32 @omp_get_thread_num(), !dbg !18
  store i32 %call, i32* %tid, align 4, !dbg !20
  br label %while.cond, !dbg !21

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* %jobs, align 4, !dbg !22
  %cmp = icmp sgt i32 %0, 0, !dbg !23
  br i1 %cmp, label %while.body, label %while.end.loopexit, !dbg !21

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %jobs, align 4, !dbg !24
  %tobool = icmp ne i32 %1, 0, !dbg !24
  br i1 %tobool, label %if.end, label %if.then, !dbg !27

if.then:                                          ; preds = %while.body
  br label %while.end, !dbg !28

if.end:                                           ; preds = %while.body
  %2 = load i32, i32* %tid, align 4, !dbg !29
  %3 = load i32, i32* %jobs, align 4, !dbg !30
  %dec = add nsw i32 %3, -1, !dbg !30
  store i32 %dec, i32* %jobs, align 4, !dbg !30
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), i32 %2, i32 %3), !dbg !31
  %call2 = call i32 @rand() #4, !dbg !32
  %conv = sitofp i32 %call2 to double, !dbg !32
  %div = fdiv double %conv, 0x41DFFFFFFFC00000, !dbg !33
  %mul = fmul double %div, 3.000000e+06, !dbg !34
  %add = fadd double 1.000000e+05, %mul, !dbg !35
  %conv3 = fptoui double %add to i32, !dbg !36
  %call4 = call i32 @usleep(i32 %conv3), !dbg !37
  %4 = load i32, i32* %tid, align 4, !dbg !38
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 %4), !dbg !39
  br label %while.cond, !dbg !21, !llvm.loop !40

while.end.loopexit:                               ; preds = %while.cond
  br label %while.end, !dbg !42

while.end:                                        ; preds = %while.end.loopexit, %if.then
  %5 = load i32, i32* %tid, align 4, !dbg !42
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0), i32 %5), !dbg !43
  ret i32 0, !dbg !44
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @omp_set_num_threads(i32) #2

declare dso_local i32 @omp_get_thread_num() #2

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local i32 @usleep(i32) #2

; Function Attrs: nounwind
declare dso_local i32 @rand() #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "checkpoint-synchronization.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Checkpoint-synchronization")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!9 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !10, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "jobs", scope: !9, file: !1, line: 8, type: !12)
!14 = !DILocation(line: 8, column: 13, scope: !9)
!15 = !DILocalVariable(name: "tid", scope: !9, file: !1, line: 8, type: !12)
!16 = !DILocation(line: 8, column: 24, scope: !9)
!17 = !DILocation(line: 9, column: 9, scope: !9)
!18 = !DILocation(line: 13, column: 23, scope: !19)
!19 = distinct !DILexicalBlock(scope: !9, file: !1, line: 12, column: 9)
!20 = !DILocation(line: 13, column: 21, scope: !19)
!21 = !DILocation(line: 14, column: 17, scope: !19)
!22 = !DILocation(line: 14, column: 24, scope: !19)
!23 = !DILocation(line: 14, column: 29, scope: !19)
!24 = !DILocation(line: 17, column: 30, scope: !25)
!25 = distinct !DILexicalBlock(scope: !26, file: !1, line: 17, column: 29)
!26 = distinct !DILexicalBlock(scope: !19, file: !1, line: 14, column: 34)
!27 = !DILocation(line: 17, column: 29, scope: !26)
!28 = !DILocation(line: 17, column: 36, scope: !25)
!29 = !DILocation(line: 19, column: 55, scope: !26)
!30 = !DILocation(line: 19, column: 64, scope: !26)
!31 = !DILocation(line: 19, column: 25, scope: !26)
!32 = !DILocation(line: 20, column: 41, scope: !26)
!33 = !DILocation(line: 20, column: 48, scope: !26)
!34 = !DILocation(line: 20, column: 68, scope: !26)
!35 = !DILocation(line: 20, column: 39, scope: !26)
!36 = !DILocation(line: 20, column: 32, scope: !26)
!37 = !DILocation(line: 20, column: 25, scope: !26)
!38 = !DILocation(line: 21, column: 50, scope: !26)
!39 = !DILocation(line: 21, column: 25, scope: !26)
!40 = distinct !{!40, !21, !41}
!41 = !DILocation(line: 22, column: 17, scope: !19)
!42 = !DILocation(line: 24, column: 42, scope: !19)
!43 = !DILocation(line: 24, column: 17, scope: !19)
!44 = !DILocation(line: 30, column: 9, scope: !9)
