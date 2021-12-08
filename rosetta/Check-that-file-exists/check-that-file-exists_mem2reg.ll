; ModuleID = 'check-that-file-exists.ll'
source_filename = "check-that-file-exists.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@.str = private unnamed_addr constant [33 x i8] c"input.txt is a regular file? %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"input.txt\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"yes\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"no\00", align 1
@.str.4 = private unnamed_addr constant [25 x i8] c"docs is a directory? %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"docs\00", align 1
@.str.6 = private unnamed_addr constant [34 x i8] c"/input.txt is a regular file? %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"/input.txt\00", align 1
@.str.8 = private unnamed_addr constant [26 x i8] c"/docs is a directory? %s\0A\00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"/docs\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @check_reg(i8* %path) #0 !dbg !7 {
entry:
  %sb = alloca %struct.stat, align 8
  call void @llvm.dbg.value(metadata i8* %path, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata %struct.stat* %sb, metadata !16, metadata !DIExpression()), !dbg !58
  %call = call i32 @stat(i8* %path, %struct.stat* %sb) #4, !dbg !59
  %cmp = icmp eq i32 %call, 0, !dbg !60
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !61

land.rhs:                                         ; preds = %entry
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %sb, i32 0, i32 3, !dbg !62
  %0 = load i32, i32* %st_mode, align 8, !dbg !62
  %and = and i32 %0, 61440, !dbg !62
  %cmp1 = icmp eq i32 %and, 32768, !dbg !62
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %1 = phi i1 [ false, %entry ], [ %cmp1, %land.rhs ], !dbg !15
  %land.ext = zext i1 %1 to i32, !dbg !61
  ret i32 %land.ext, !dbg !63
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @stat(i8*, %struct.stat*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @check_dir(i8* %path) #0 !dbg !64 {
entry:
  %sb = alloca %struct.stat, align 8
  call void @llvm.dbg.value(metadata i8* %path, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata %struct.stat* %sb, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i32 @stat(i8* %path, %struct.stat* %sb) #4, !dbg !69
  %cmp = icmp eq i32 %call, 0, !dbg !70
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !71

land.rhs:                                         ; preds = %entry
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %sb, i32 0, i32 3, !dbg !72
  %0 = load i32, i32* %st_mode, align 8, !dbg !72
  %and = and i32 %0, 61440, !dbg !72
  %cmp1 = icmp eq i32 %and, 16384, !dbg !72
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %1 = phi i1 [ false, %entry ], [ %cmp1, %land.rhs ], !dbg !66
  %land.ext = zext i1 %1 to i32, !dbg !71
  ret i32 %land.ext, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !74 {
entry:
  %call = call i32 @check_reg(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  %tobool = icmp ne i32 %call, 0, !dbg !77
  %0 = zext i1 %tobool to i64, !dbg !77
  %cond = select i1 %tobool, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0), !dbg !77
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str, i64 0, i64 0), i8* %cond), !dbg !78
  %call2 = call i32 @check_dir(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0)), !dbg !79
  %tobool3 = icmp ne i32 %call2, 0, !dbg !79
  %1 = zext i1 %tobool3 to i64, !dbg !79
  %cond4 = select i1 %tobool3, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0), !dbg !79
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.4, i64 0, i64 0), i8* %cond4), !dbg !80
  %call6 = call i32 @check_reg(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i64 0, i64 0)), !dbg !81
  %tobool7 = icmp ne i32 %call6, 0, !dbg !81
  %2 = zext i1 %tobool7 to i64, !dbg !81
  %cond8 = select i1 %tobool7, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0), !dbg !81
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.6, i64 0, i64 0), i8* %cond8), !dbg !82
  %call10 = call i32 @check_dir(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9, i64 0, i64 0)), !dbg !83
  %tobool11 = icmp ne i32 %call10, 0, !dbg !83
  %3 = zext i1 %tobool11 to i64, !dbg !83
  %cond12 = select i1 %tobool11, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0), !dbg !83
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.8, i64 0, i64 0), i8* %cond12), !dbg !84
  ret i32 0, !dbg !85
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "check-that-file-exists.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Check-that-file-exists")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "check_reg", scope: !1, file: !1, line: 7, type: !8, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "path", arg: 1, scope: !7, file: !1, line: 7, type: !11)
!15 = !DILocation(line: 0, scope: !7)
!16 = !DILocalVariable(name: "sb", scope: !7, file: !1, line: 8, type: !17)
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !18, line: 46, size: 1152, elements: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stat.h", directory: "")
!19 = !{!20, !24, !26, !28, !31, !33, !35, !36, !37, !40, !42, !44, !52, !53, !54}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !17, file: !18, line: 48, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !22, line: 145, baseType: !23)
!22 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!23 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !17, file: !18, line: 53, baseType: !25, size: 64, offset: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !22, line: 148, baseType: !23)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !17, file: !18, line: 61, baseType: !27, size: 64, offset: 128)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !22, line: 151, baseType: !23)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !17, file: !18, line: 62, baseType: !29, size: 32, offset: 192)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !22, line: 150, baseType: !30)
!30 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !17, file: !18, line: 64, baseType: !32, size: 32, offset: 224)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !22, line: 146, baseType: !30)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !17, file: !18, line: 65, baseType: !34, size: 32, offset: 256)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !22, line: 147, baseType: !30)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !17, file: !18, line: 67, baseType: !10, size: 32, offset: 288)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !17, file: !18, line: 69, baseType: !21, size: 64, offset: 320)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !17, file: !18, line: 74, baseType: !38, size: 64, offset: 384)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !22, line: 152, baseType: !39)
!39 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !17, file: !18, line: 78, baseType: !41, size: 64, offset: 448)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !22, line: 174, baseType: !39)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !17, file: !18, line: 80, baseType: !43, size: 64, offset: 512)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !22, line: 179, baseType: !39)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !17, file: !18, line: 91, baseType: !45, size: 128, offset: 576)
!45 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !46, line: 10, size: 128, elements: !47)
!46 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "")
!47 = !{!48, !50}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !45, file: !46, line: 12, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !22, line: 160, baseType: !39)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !45, file: !46, line: 16, baseType: !51, size: 64, offset: 64)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !22, line: 196, baseType: !39)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !17, file: !18, line: 92, baseType: !45, size: 128, offset: 704)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !17, file: !18, line: 93, baseType: !45, size: 128, offset: 832)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !17, file: !18, line: 106, baseType: !55, size: 192, offset: 960)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 192, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 3)
!58 = !DILocation(line: 8, column: 14, scope: !7)
!59 = !DILocation(line: 9, column: 9, scope: !7)
!60 = !DILocation(line: 9, column: 25, scope: !7)
!61 = !DILocation(line: 9, column: 30, scope: !7)
!62 = !DILocation(line: 9, column: 33, scope: !7)
!63 = !DILocation(line: 9, column: 2, scope: !7)
!64 = distinct !DISubprogram(name: "check_dir", scope: !1, file: !1, line: 13, type: !8, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "path", arg: 1, scope: !64, file: !1, line: 13, type: !11)
!66 = !DILocation(line: 0, scope: !64)
!67 = !DILocalVariable(name: "sb", scope: !64, file: !1, line: 14, type: !17)
!68 = !DILocation(line: 14, column: 14, scope: !64)
!69 = !DILocation(line: 15, column: 9, scope: !64)
!70 = !DILocation(line: 15, column: 25, scope: !64)
!71 = !DILocation(line: 15, column: 30, scope: !64)
!72 = !DILocation(line: 15, column: 33, scope: !64)
!73 = !DILocation(line: 15, column: 2, scope: !64)
!74 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 18, type: !75, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!10}
!77 = !DILocation(line: 20, column: 6, scope: !74)
!78 = !DILocation(line: 19, column: 2, scope: !74)
!79 = !DILocation(line: 22, column: 6, scope: !74)
!80 = !DILocation(line: 21, column: 2, scope: !74)
!81 = !DILocation(line: 24, column: 6, scope: !74)
!82 = !DILocation(line: 23, column: 2, scope: !74)
!83 = !DILocation(line: 26, column: 6, scope: !74)
!84 = !DILocation(line: 25, column: 2, scope: !74)
!85 = !DILocation(line: 27, column: 2, scope: !74)
