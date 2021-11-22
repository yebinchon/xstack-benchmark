; ModuleID = 'handle-a-signal.c'
source_filename = "handle-a-signal.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@gotint = dso_local global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [35 x i8] c"Program has run for %5.3f seconds\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @handleSigint() #0 !dbg !20 {
entry:
  store volatile i32 1, i32* @gotint, align 4, !dbg !23
  ret void, !dbg !24
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !25 {
entry:
  %retval = alloca i32, align 4
  %startTime = alloca i64, align 8
  %i = alloca i32, align 4
  %endTime = alloca i64, align 8
  %td = alloca double, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i64* %startTime, metadata !28, metadata !DIExpression()), !dbg !31
  %call = call i64 @clock() #4, !dbg !32
  store i64 %call, i64* %startTime, align 8, !dbg !31
  %call1 = call void (i32)* @signal(i32 2, void (i32)* bitcast (void ()* @handleSigint to void (i32)*)) #4, !dbg !33
  call void @llvm.dbg.declare(metadata i32* %i, metadata !34, metadata !DIExpression()), !dbg !35
  store i32 0, i32* %i, align 4, !dbg !35
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %if.end5, %entry
  %0 = load volatile i32, i32* @gotint, align 4, !dbg !37
  %tobool = icmp ne i32 %0, 0, !dbg !37
  br i1 %tobool, label %if.then, label %if.end, !dbg !42, !cf.info !43

if.then:                                          ; preds = %for.cond
  br label %for.end, !dbg !44

if.end:                                           ; preds = %for.cond
  %call2 = call i32 @usleep(i32 500000), !dbg !45
  %1 = load volatile i32, i32* @gotint, align 4, !dbg !46
  %tobool3 = icmp ne i32 %1, 0, !dbg !46
  br i1 %tobool3, label %if.then4, label %if.end5, !dbg !48, !cf.info !43

if.then4:                                         ; preds = %if.end
  br label %for.end, !dbg !49

if.end5:                                          ; preds = %if.end
  %2 = load i32, i32* %i, align 4, !dbg !50
  %inc = add nsw i32 %2, 1, !dbg !50
  store i32 %inc, i32* %i, align 4, !dbg !50
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %inc), !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %if.then4, %if.then
  call void @llvm.dbg.declare(metadata i64* %endTime, metadata !56, metadata !DIExpression()), !dbg !57
  %call7 = call i64 @clock() #4, !dbg !58
  store i64 %call7, i64* %endTime, align 8, !dbg !57
  call void @llvm.dbg.declare(metadata double* %td, metadata !59, metadata !DIExpression()), !dbg !60
  %3 = load i64, i64* %endTime, align 8, !dbg !61
  %4 = load i64, i64* %startTime, align 8, !dbg !62
  %sub = sub nsw i64 %3, %4, !dbg !63
  %conv = sitofp i64 %sub to double, !dbg !64
  %div = fdiv double %conv, 1.000000e+06, !dbg !65
  store double %div, double* %td, align 8, !dbg !60
  %5 = load double, double* %td, align 8, !dbg !66
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.1, i64 0, i64 0), double %5), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i64 @clock() #2

; Function Attrs: nounwind
declare dso_local void (i32)* @signal(i32, void (i32)*) #2

declare dso_local i32 @usleep(i32) #3

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "gotint", scope: !2, file: !3, line: 7, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "handle-a-signal.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Handle-a-signal")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !8, line: 156, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !{!0}
!11 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !12)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "sig_atomic_t", file: !13, line: 8, baseType: !14)
!13 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/sig_atomic_t.h", directory: "")
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sig_atomic_t", file: !8, line: 214, baseType: !15)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!20 = distinct !DISubprogram(name: "handleSigint", scope: !3, file: !3, line: 9, type: !21, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocation(line: 14, column: 12, scope: !20)
!24 = !DILocation(line: 15, column: 1, scope: !20)
!25 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 17, type: !26, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!26 = !DISubroutineType(types: !27)
!27 = !{!15}
!28 = !DILocalVariable(name: "startTime", scope: !25, file: !3, line: 18, type: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !30, line: 7, baseType: !7)
!30 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h", directory: "")
!31 = !DILocation(line: 18, column: 13, scope: !25)
!32 = !DILocation(line: 18, column: 25, scope: !25)
!33 = !DILocation(line: 19, column: 5, scope: !25)
!34 = !DILocalVariable(name: "i", scope: !25, file: !3, line: 20, type: !15)
!35 = !DILocation(line: 20, column: 9, scope: !25)
!36 = !DILocation(line: 21, column: 5, scope: !25)
!37 = !DILocation(line: 22, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !39, file: !3, line: 22, column: 13)
!39 = distinct !DILexicalBlock(scope: !40, file: !3, line: 21, column: 14)
!40 = distinct !DILexicalBlock(scope: !41, file: !3, line: 21, column: 5)
!41 = distinct !DILexicalBlock(scope: !25, file: !3, line: 21, column: 5)
!42 = !DILocation(line: 22, column: 13, scope: !39)
!43 = !{!"if"}
!44 = !DILocation(line: 23, column: 13, scope: !38)
!45 = !DILocation(line: 24, column: 9, scope: !39)
!46 = !DILocation(line: 25, column: 13, scope: !47)
!47 = distinct !DILexicalBlock(scope: !39, file: !3, line: 25, column: 13)
!48 = !DILocation(line: 25, column: 13, scope: !39)
!49 = !DILocation(line: 26, column: 13, scope: !47)
!50 = !DILocation(line: 27, column: 17, scope: !39)
!51 = !DILocation(line: 27, column: 2, scope: !39)
!52 = !DILocation(line: 21, column: 5, scope: !40)
!53 = distinct !{!53, !54, !55}
!54 = !DILocation(line: 21, column: 5, scope: !41)
!55 = !DILocation(line: 28, column: 5, scope: !41)
!56 = !DILocalVariable(name: "endTime", scope: !25, file: !3, line: 29, type: !29)
!57 = !DILocation(line: 29, column: 13, scope: !25)
!58 = !DILocation(line: 29, column: 23, scope: !25)
!59 = !DILocalVariable(name: "td", scope: !25, file: !3, line: 30, type: !6)
!60 = !DILocation(line: 30, column: 12, scope: !25)
!61 = !DILocation(line: 30, column: 18, scope: !25)
!62 = !DILocation(line: 30, column: 28, scope: !25)
!63 = !DILocation(line: 30, column: 26, scope: !25)
!64 = !DILocation(line: 30, column: 17, scope: !25)
!65 = !DILocation(line: 30, column: 39, scope: !25)
!66 = !DILocation(line: 31, column: 51, scope: !25)
!67 = !DILocation(line: 31, column: 5, scope: !25)
!68 = !DILocation(line: 32, column: 5, scope: !25)
