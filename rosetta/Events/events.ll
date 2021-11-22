; ModuleID = 'events.c'
source_filename = "events.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [26 x i8] c"received signal from pipe\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %p = alloca [2 x i32], align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [2 x i32]* %p, metadata !11, metadata !DIExpression()), !dbg !15
  %arraydecay = getelementptr inbounds [2 x i32], [2 x i32]* %p, i64 0, i64 0, !dbg !16
  %call = call i32 @pipe(i32* %arraydecay) #4, !dbg !17
  %call1 = call i32 @fork() #4, !dbg !18
  %tobool = icmp ne i32 %call1, 0, !dbg !18
  br i1 %tobool, label %if.then, label %if.else, !dbg !20, !cf.info !21

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %p, i64 0, i64 0, !dbg !22
  %0 = load i32, i32* %arrayidx, align 4, !dbg !22
  %call2 = call i32 @close(i32 %0), !dbg !24
  %call3 = call i32 @sleep(i32 1), !dbg !25
  %arrayidx4 = getelementptr inbounds [2 x i32], [2 x i32]* %p, i64 0, i64 1, !dbg !26
  %1 = load i32, i32* %arrayidx4, align 4, !dbg !26
  %arraydecay5 = getelementptr inbounds [2 x i32], [2 x i32]* %p, i64 0, i64 0, !dbg !27
  %2 = bitcast i32* %arraydecay5 to i8*, !dbg !27
  %call6 = call i64 @write(i32 %1, i8* %2, i64 1), !dbg !28
  %call7 = call i32 (i32, ...) bitcast (i32 (...)* @wait to i32 (i32, ...)*)(i32 0), !dbg !29
  br label %if.end, !dbg !30

if.else:                                          ; preds = %entry
  %arrayidx8 = getelementptr inbounds [2 x i32], [2 x i32]* %p, i64 0, i64 1, !dbg !31
  %3 = load i32, i32* %arrayidx8, align 4, !dbg !31
  %call9 = call i32 @close(i32 %3), !dbg !33
  %arrayidx10 = getelementptr inbounds [2 x i32], [2 x i32]* %p, i64 0, i64 0, !dbg !34
  %4 = load i32, i32* %arrayidx10, align 4, !dbg !34
  %arraydecay11 = getelementptr inbounds [2 x i32], [2 x i32]* %p, i64 0, i64 0, !dbg !35
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay11, i64 1, !dbg !36
  %5 = bitcast i32* %add.ptr to i8*, !dbg !35
  %call12 = call i64 @read(i32 %4, i8* %5, i64 1), !dbg !37
  %call13 = call i32 @puts(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i64 0, i64 0)), !dbg !38
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0, !dbg !39
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @pipe(i32*) #2

; Function Attrs: nounwind
declare dso_local i32 @fork() #2

declare dso_local i32 @close(i32) #3

declare dso_local i32 @sleep(i32) #3

declare dso_local i64 @write(i32, i8*, i64) #3

declare dso_local i32 @wait(...) #3

declare dso_local i64 @read(i32, i8*, i64) #3

declare dso_local i32 @puts(i8*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "events.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Events")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "p", scope: !7, file: !1, line: 6, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 64, elements: !13)
!13 = !{!14}
!14 = !DISubrange(count: 2)
!15 = !DILocation(line: 6, column: 6, scope: !7)
!16 = !DILocation(line: 7, column: 7, scope: !7)
!17 = !DILocation(line: 7, column: 2, scope: !7)
!18 = !DILocation(line: 8, column: 6, scope: !19)
!19 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 6)
!20 = !DILocation(line: 8, column: 6, scope: !7)
!21 = !{!"if"}
!22 = !DILocation(line: 9, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !19, file: !1, line: 8, column: 14)
!24 = !DILocation(line: 9, column: 3, scope: !23)
!25 = !DILocation(line: 10, column: 3, scope: !23)
!26 = !DILocation(line: 11, column: 9, scope: !23)
!27 = !DILocation(line: 11, column: 15, scope: !23)
!28 = !DILocation(line: 11, column: 3, scope: !23)
!29 = !DILocation(line: 12, column: 3, scope: !23)
!30 = !DILocation(line: 13, column: 2, scope: !23)
!31 = !DILocation(line: 14, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !19, file: !1, line: 13, column: 9)
!33 = !DILocation(line: 14, column: 3, scope: !32)
!34 = !DILocation(line: 15, column: 8, scope: !32)
!35 = !DILocation(line: 15, column: 14, scope: !32)
!36 = !DILocation(line: 15, column: 16, scope: !32)
!37 = !DILocation(line: 15, column: 3, scope: !32)
!38 = !DILocation(line: 16, column: 3, scope: !32)
!39 = !DILocation(line: 18, column: 2, scope: !7)
