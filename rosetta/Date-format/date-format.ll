; ModuleID = 'date-format.bc'
source_filename = "date-format.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

@.str = private unnamed_addr constant [8 x i8] c"January\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"February\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"March\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"April\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"May\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"June\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"July\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"August\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"September\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"October\00", align 1
@.str.10 = private unnamed_addr constant [9 x i8] c"November\00", align 1
@.str.11 = private unnamed_addr constant [9 x i8] c"December\00", align 1
@__const.main.months = private unnamed_addr constant [12 x i8*] [i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.11, i32 0, i32 0)], align 16
@.str.12 = private unnamed_addr constant [7 x i8] c"Sunday\00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"Monday\00", align 1
@.str.14 = private unnamed_addr constant [8 x i8] c"Tuesday\00", align 1
@.str.15 = private unnamed_addr constant [10 x i8] c"Wednesday\00", align 1
@.str.16 = private unnamed_addr constant [9 x i8] c"Thursday\00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c"Friday\00", align 1
@.str.18 = private unnamed_addr constant [9 x i8] c"Saturday\00", align 1
@__const.main.days = private unnamed_addr constant [7 x i8*] [i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.18, i32 0, i32 0)], align 16
@.str.19 = private unnamed_addr constant [10 x i8] c"%d-%d-%d\0A\00", align 1
@.str.20 = private unnamed_addr constant [15 x i8] c"%s, %s %d, %d\0A\00", align 1
@.str.21 = private unnamed_addr constant [14 x i8] c"%A, %B %e, %Y\00", align 1
@.str.22 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %buf = alloca [50 x i8], align 16
  %seconds = alloca i64, align 8
  %now = alloca %struct.tm*, align 8
  %months = alloca [12 x i8*], align 16
  %days = alloca [7 x i8*], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [50 x i8]* %buf, metadata !11, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i64* %seconds, metadata !17, metadata !DIExpression()), !dbg !23
  %call = call i64 @time(i64* null) #5, !dbg !24
  store i64 %call, i64* %seconds, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata %struct.tm** %now, metadata !25, metadata !DIExpression()), !dbg !43
  %call1 = call %struct.tm* @localtime(i64* %seconds) #5, !dbg !44
  store %struct.tm* %call1, %struct.tm** %now, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [12 x i8*]* %months, metadata !45, metadata !DIExpression()), !dbg !49
  %0 = bitcast [12 x i8*]* %months to i8*, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([12 x i8*]* @__const.main.months to i8*), i64 96, i1 false), !dbg !49
  call void @llvm.dbg.declare(metadata [7 x i8*]* %days, metadata !50, metadata !DIExpression()), !dbg !54
  %1 = bitcast [7 x i8*]* %days to i8*, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([7 x i8*]* @__const.main.days to i8*), i64 56, i1 false), !dbg !54
  %2 = load %struct.tm*, %struct.tm** %now, align 8, !dbg !55
  %tm_year = getelementptr inbounds %struct.tm, %struct.tm* %2, i32 0, i32 5, !dbg !56
  %3 = load i32, i32* %tm_year, align 4, !dbg !56
  %add = add nsw i32 %3, 1900, !dbg !57
  %4 = load %struct.tm*, %struct.tm** %now, align 8, !dbg !58
  %tm_mon = getelementptr inbounds %struct.tm, %struct.tm* %4, i32 0, i32 4, !dbg !59
  %5 = load i32, i32* %tm_mon, align 8, !dbg !59
  %add2 = add nsw i32 %5, 1, !dbg !60
  %6 = load %struct.tm*, %struct.tm** %now, align 8, !dbg !61
  %tm_mday = getelementptr inbounds %struct.tm, %struct.tm* %6, i32 0, i32 3, !dbg !62
  %7 = load i32, i32* %tm_mday, align 4, !dbg !62
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.19, i64 0, i64 0), i32 %add, i32 %add2, i32 %7), !dbg !63
  %8 = load %struct.tm*, %struct.tm** %now, align 8, !dbg !64
  %tm_wday = getelementptr inbounds %struct.tm, %struct.tm* %8, i32 0, i32 6, !dbg !65
  %9 = load i32, i32* %tm_wday, align 8, !dbg !65
  %idxprom = sext i32 %9 to i64, !dbg !66
  %arrayidx = getelementptr inbounds [7 x i8*], [7 x i8*]* %days, i64 0, i64 %idxprom, !dbg !66
  %10 = load i8*, i8** %arrayidx, align 8, !dbg !66
  %11 = load %struct.tm*, %struct.tm** %now, align 8, !dbg !67
  %tm_mon4 = getelementptr inbounds %struct.tm, %struct.tm* %11, i32 0, i32 4, !dbg !68
  %12 = load i32, i32* %tm_mon4, align 8, !dbg !68
  %idxprom5 = sext i32 %12 to i64, !dbg !69
  %arrayidx6 = getelementptr inbounds [12 x i8*], [12 x i8*]* %months, i64 0, i64 %idxprom5, !dbg !69
  %13 = load i8*, i8** %arrayidx6, align 8, !dbg !69
  %14 = load %struct.tm*, %struct.tm** %now, align 8, !dbg !70
  %tm_mday7 = getelementptr inbounds %struct.tm, %struct.tm* %14, i32 0, i32 3, !dbg !71
  %15 = load i32, i32* %tm_mday7, align 4, !dbg !71
  %16 = load %struct.tm*, %struct.tm** %now, align 8, !dbg !72
  %tm_year8 = getelementptr inbounds %struct.tm, %struct.tm* %16, i32 0, i32 5, !dbg !73
  %17 = load i32, i32* %tm_year8, align 4, !dbg !73
  %add9 = add nsw i32 %17, 1900, !dbg !74
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.20, i64 0, i64 0), i8* %10, i8* %13, i32 %15, i32 %add9), !dbg !75
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %buf, i64 0, i64 0, !dbg !76
  %18 = load %struct.tm*, %struct.tm** %now, align 8, !dbg !77
  %call11 = call i64 @strftime(i8* %arraydecay, i64 50, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.21, i64 0, i64 0), %struct.tm* %18) #5, !dbg !78
  %arraydecay12 = getelementptr inbounds [50 x i8], [50 x i8]* %buf, i64 0, i64 0, !dbg !79
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.22, i64 0, i64 0), i8* %arraydecay12), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: nounwind
declare dso_local %struct.tm* @localtime(i64*) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: nounwind
declare dso_local i64 @strftime(i8*, i64, i8*, %struct.tm*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "date-format.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Date-format")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !8, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "buf", scope: !7, file: !1, line: 8, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 400, elements: !14)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !{!15}
!15 = !DISubrange(count: 50)
!16 = !DILocation(line: 8, column: 8, scope: !7)
!17 = !DILocalVariable(name: "seconds", scope: !7, file: !1, line: 9, type: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !19, line: 7, baseType: !20)
!19 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/time_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !21, line: 160, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!22 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!23 = !DILocation(line: 9, column: 10, scope: !7)
!24 = !DILocation(line: 9, column: 20, scope: !7)
!25 = !DILocalVariable(name: "now", scope: !7, file: !1, line: 10, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !28, line: 7, size: 448, elements: !29)
!28 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h", directory: "")
!29 = !{!30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !27, file: !28, line: 9, baseType: !10, size: 32)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !27, file: !28, line: 10, baseType: !10, size: 32, offset: 32)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !27, file: !28, line: 11, baseType: !10, size: 32, offset: 64)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !27, file: !28, line: 12, baseType: !10, size: 32, offset: 96)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !27, file: !28, line: 13, baseType: !10, size: 32, offset: 128)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !27, file: !28, line: 14, baseType: !10, size: 32, offset: 160)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !27, file: !28, line: 15, baseType: !10, size: 32, offset: 192)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !27, file: !28, line: 16, baseType: !10, size: 32, offset: 224)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !27, file: !28, line: 17, baseType: !10, size: 32, offset: 256)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !27, file: !28, line: 20, baseType: !22, size: 64, offset: 320)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !27, file: !28, line: 21, baseType: !41, size: 64, offset: 384)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!43 = !DILocation(line: 10, column: 14, scope: !7)
!44 = !DILocation(line: 10, column: 20, scope: !7)
!45 = !DILocalVariable(name: "months", scope: !7, file: !1, line: 11, type: !46)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !41, size: 768, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 12)
!49 = !DILocation(line: 11, column: 15, scope: !7)
!50 = !DILocalVariable(name: "days", scope: !7, file: !1, line: 14, type: !51)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !41, size: 448, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 7)
!54 = !DILocation(line: 14, column: 15, scope: !7)
!55 = !DILocation(line: 16, column: 31, scope: !7)
!56 = !DILocation(line: 16, column: 36, scope: !7)
!57 = !DILocation(line: 16, column: 44, scope: !7)
!58 = !DILocation(line: 16, column: 52, scope: !7)
!59 = !DILocation(line: 16, column: 57, scope: !7)
!60 = !DILocation(line: 16, column: 64, scope: !7)
!61 = !DILocation(line: 16, column: 69, scope: !7)
!62 = !DILocation(line: 16, column: 74, scope: !7)
!63 = !DILocation(line: 16, column: 10, scope: !7)
!64 = !DILocation(line: 17, column: 40, scope: !7)
!65 = !DILocation(line: 17, column: 45, scope: !7)
!66 = !DILocation(line: 17, column: 35, scope: !7)
!67 = !DILocation(line: 17, column: 62, scope: !7)
!68 = !DILocation(line: 17, column: 67, scope: !7)
!69 = !DILocation(line: 17, column: 55, scope: !7)
!70 = !DILocation(line: 18, column: 16, scope: !7)
!71 = !DILocation(line: 18, column: 21, scope: !7)
!72 = !DILocation(line: 18, column: 30, scope: !7)
!73 = !DILocation(line: 18, column: 35, scope: !7)
!74 = !DILocation(line: 18, column: 43, scope: !7)
!75 = !DILocation(line: 17, column: 10, scope: !7)
!76 = !DILocation(line: 20, column: 19, scope: !7)
!77 = !DILocation(line: 20, column: 50, scope: !7)
!78 = !DILocation(line: 20, column: 10, scope: !7)
!79 = !DILocation(line: 21, column: 25, scope: !7)
!80 = !DILocation(line: 21, column: 10, scope: !7)
!81 = !DILocation(line: 22, column: 3, scope: !7)
