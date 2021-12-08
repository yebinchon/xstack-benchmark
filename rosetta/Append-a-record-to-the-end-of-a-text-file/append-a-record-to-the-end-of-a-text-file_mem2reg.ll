; ModuleID = 'append-a-record-to-the-end-of-a-text-file.ll'
source_filename = "append-a-record-to-the-end-of-a-text-file.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.passwd_t = type { i8*, i8*, i32, i32, %struct.gecos_t, i8*, i8* }
%struct.gecos_t = type { i8*, i8*, i8*, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [7 x i8] c"jsmith\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"Joe Smith\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"Room 1007\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"(234)555-8917\00", align 1
@.str.5 = private unnamed_addr constant [14 x i8] c"(234)555-0077\00", align 1
@.str.6 = private unnamed_addr constant [23 x i8] c"jsmith@rosettacode.org\00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"/home/jsmith\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"/bin/bash\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"jdoe\00", align 1
@.str.10 = private unnamed_addr constant [9 x i8] c"Jane Doe\00", align 1
@.str.11 = private unnamed_addr constant [10 x i8] c"Room 1004\00", align 1
@.str.12 = private unnamed_addr constant [14 x i8] c"(234)555-8914\00", align 1
@.str.13 = private unnamed_addr constant [14 x i8] c"(234)555-0044\00", align 1
@.str.14 = private unnamed_addr constant [21 x i8] c"jdoe@rosettacode.org\00", align 1
@.str.15 = private unnamed_addr constant [11 x i8] c"/home/jdoe\00", align 1
@passwd_list = dso_local global [2 x %struct.passwd_t] [%struct.passwd_t { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0), i32 1001, i32 1000, %struct.gecos_t { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i32 0, i32 0) }, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i32 0, i32 0) }, %struct.passwd_t { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0), i32 1002, i32 1000, %struct.gecos_t { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.14, i32 0, i32 0) }, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i32 0, i32 0) }], align 16, !dbg !0
@.str.16 = private unnamed_addr constant [11 x i8] c"passwd.txt\00", align 1
@.str.17 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.18 = private unnamed_addr constant [34 x i8] c"%s:%s:%d:%d:%s,%s,%s,%s,%s:%s:%s\0A\00", align 1
@.str.19 = private unnamed_addr constant [3 x i8] c"a+\00", align 1
@.str.20 = private unnamed_addr constant [4 x i8] c"xyz\00", align 1
@.str.21 = private unnamed_addr constant [5 x i8] c"X Yz\00", align 1
@.str.22 = private unnamed_addr constant [10 x i8] c"Room 1003\00", align 1
@.str.23 = private unnamed_addr constant [14 x i8] c"(234)555-8913\00", align 1
@.str.24 = private unnamed_addr constant [14 x i8] c"(234)555-0033\00", align 1
@.str.25 = private unnamed_addr constant [20 x i8] c"xyz@rosettacode.org\00", align 1
@.str.26 = private unnamed_addr constant [10 x i8] c"/home/xyz\00", align 1
@__const.main.new_rec = private unnamed_addr constant %struct.passwd_t { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0), i32 1003, i32 1000, %struct.gecos_t { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.25, i32 0, i32 0) }, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i32 0, i32 0) }, align 8
@.str.27 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.28 = private unnamed_addr constant [7 x i8] c"%[^\0A]\0A\00", align 1
@.str.29 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.30 = private unnamed_addr constant [21 x i8] c"Appended record: %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !36 {
entry:
  %passwd_buf = alloca [8192 x i8], align 16
  %new_rec = alloca %struct.passwd_t, align 8
  %call = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.16, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.17, i64 0, i64 0)), !dbg !39
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call, metadata !40, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.value(metadata i32 0, metadata !103, metadata !DIExpression()), !dbg !102
  br label %for.cond, !dbg !104

for.cond:                                         ; preds = %for.inc, %entry
  %rec_num.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !106
  call void @llvm.dbg.value(metadata i32 %rec_num.0, metadata !103, metadata !DIExpression()), !dbg !102
  %conv = sext i32 %rec_num.0 to i64, !dbg !107
  %cmp = icmp ult i64 %conv, 2, !dbg !109
  br i1 %cmp, label %for.body, label %for.end, !dbg !110

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %rec_num.0 to i64, !dbg !111
  %arrayidx = getelementptr inbounds [2 x %struct.passwd_t], [2 x %struct.passwd_t]* @passwd_list, i64 0, i64 %idxprom, !dbg !111
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.18, i64 0, i64 0), %struct.passwd_t* byval(%struct.passwd_t) align 8 %arrayidx), !dbg !112
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %rec_num.0, 1, !dbg !113
  call void @llvm.dbg.value(metadata i32 %inc, metadata !103, metadata !DIExpression()), !dbg !102
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  %call3 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !117
  %call4 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.16, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i64 0, i64 0)), !dbg !118
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call4, metadata !40, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [8192 x i8]* %passwd_buf, metadata !119, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata %struct.passwd_t* %new_rec, metadata !124, metadata !DIExpression()), !dbg !125
  %0 = bitcast %struct.passwd_t* %new_rec to i8*, !dbg !125
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 bitcast (%struct.passwd_t* @__const.main.new_rec to i8*), i64 80, i1 false), !dbg !125
  %arraydecay = getelementptr inbounds [8192 x i8], [8192 x i8]* %passwd_buf, i64 0, i64 0, !dbg !126
  %call5 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.18, i64 0, i64 0), %struct.passwd_t* byval(%struct.passwd_t) align 8 %new_rec) #6, !dbg !127
  %call6 = call i32 @fileno(%struct._IO_FILE* %call4) #6, !dbg !128
  %arraydecay7 = getelementptr inbounds [8192 x i8], [8192 x i8]* %passwd_buf, i64 0, i64 0, !dbg !129
  %arraydecay8 = getelementptr inbounds [8192 x i8], [8192 x i8]* %passwd_buf, i64 0, i64 0, !dbg !130
  %call9 = call i64 @strlen(i8* %arraydecay8) #7, !dbg !131
  %call10 = call i32 (i32, i8*, i64, ...) bitcast (i32 (...)* @write to i32 (i32, i8*, i64, ...)*)(i32 %call6, i8* %arraydecay7, i64 %call9), !dbg !132
  %call11 = call i32 (%struct._IO_FILE*, ...) bitcast (i32 (...)* @close to i32 (%struct._IO_FILE*, ...)*)(%struct._IO_FILE* %call4), !dbg !133
  %call12 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.16, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.27, i64 0, i64 0)), !dbg !134
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call12, metadata !40, metadata !DIExpression()), !dbg !102
  br label %while.cond, !dbg !135

while.cond:                                       ; preds = %while.body, %for.end
  %call13 = call i32 @feof(%struct._IO_FILE* %call12) #6, !dbg !136
  %tobool = icmp ne i32 %call13, 0, !dbg !137
  %lnot = xor i1 %tobool, true, !dbg !137
  br i1 %lnot, label %while.body, label %while.end, !dbg !135

while.body:                                       ; preds = %while.cond
  %arraydecay14 = getelementptr inbounds [8192 x i8], [8192 x i8]* %passwd_buf, i64 0, i64 0, !dbg !138
  %call15 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %call12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.28, i64 0, i64 0), i8* %arraydecay14, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.29, i64 0, i64 0)), !dbg !139
  br label %while.cond, !dbg !135, !llvm.loop !140

while.end:                                        ; preds = %while.cond
  %arraydecay16 = getelementptr inbounds [8192 x i8], [8192 x i8]* %passwd_buf, i64 0, i64 0, !dbg !142
  %call17 = call i8* @strstr(i8* %arraydecay16, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i64 0, i64 0)) #7, !dbg !144
  %tobool18 = icmp ne i8* %call17, null, !dbg !144
  br i1 %tobool18, label %if.then, label %if.end, !dbg !145, !cf.info !146

if.then:                                          ; preds = %while.end
  %arraydecay19 = getelementptr inbounds [8192 x i8], [8192 x i8]* %passwd_buf, i64 0, i64 0, !dbg !147
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.30, i64 0, i64 0), i8* %arraydecay19), !dbg !148
  br label %if.end, !dbg !148

if.end:                                           ; preds = %if.then, %while.end
  ret i32 0, !dbg !149
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #2

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

declare dso_local i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8*, i8*, ...) #4

declare dso_local i32 @write(...) #2

; Function Attrs: nounwind
declare dso_local i32 @fileno(%struct._IO_FILE*) #4

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #5

declare dso_local i32 @close(...) #2

; Function Attrs: nounwind
declare dso_local i32 @feof(%struct._IO_FILE*) #4

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind readonly
declare dso_local i8* @strstr(i8*, i8*) #5

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!32, !33, !34}
!llvm.ident = !{!35}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "passwd_list", scope: !2, file: !3, line: 11, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "append-a-record-to-the-end-of-a-text-file.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Append-a-record-to-the-end-of-a-text-file")
!4 = !{}
!5 = !{!0}
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1280, elements: !30)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "passwd_t", file: !3, line: 6, baseType: !8)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 6, size: 640, elements: !9)
!9 = !{!10, !15, !16, !18, !19, !28, !29}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "account", scope: !8, file: !3, line: 6, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "STRING", file: !3, line: 4, baseType: !12)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "password", scope: !8, file: !3, line: 6, baseType: !11, size: 64, offset: 64)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "uid", scope: !8, file: !3, line: 6, baseType: !17, size: 32, offset: 128)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "gid", scope: !8, file: !3, line: 6, baseType: !17, size: 32, offset: 160)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "gecos", scope: !8, file: !3, line: 6, baseType: !20, size: 320, offset: 192)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "gecos_t", file: !3, line: 5, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 5, size: 320, elements: !22)
!22 = !{!23, !24, !25, !26, !27}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "fullname", scope: !21, file: !3, line: 5, baseType: !11, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "office", scope: !21, file: !3, line: 5, baseType: !11, size: 64, offset: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "extension", scope: !21, file: !3, line: 5, baseType: !11, size: 64, offset: 128)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "homephone", scope: !21, file: !3, line: 5, baseType: !11, size: 64, offset: 192)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "email", scope: !21, file: !3, line: 5, baseType: !11, size: 64, offset: 256)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "directory", scope: !8, file: !3, line: 6, baseType: !11, size: 64, offset: 512)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "shell", scope: !8, file: !3, line: 6, baseType: !11, size: 64, offset: 576)
!30 = !{!31}
!31 = !DISubrange(count: 2)
!32 = !{i32 7, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 3}
!34 = !{i32 1, !"wchar_size", i32 4}
!35 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!36 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 20, type: !37, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!37 = !DISubroutineType(types: !38)
!38 = !{!17}
!39 = !DILocation(line: 24, column: 21, scope: !36)
!40 = !DILocalVariable(name: "passwd_text", scope: !36, file: !3, line: 24, type: !41)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !43, line: 7, baseType: !44)
!43 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!44 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !45, line: 49, size: 1728, elements: !46)
!45 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!46 = !{!47, !48, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !63, !65, !66, !67, !71, !73, !75, !79, !82, !84, !87, !90, !91, !93, !97, !98}
!47 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !44, file: !45, line: 51, baseType: !17, size: 32)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !44, file: !45, line: 54, baseType: !49, size: 64, offset: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !44, file: !45, line: 55, baseType: !49, size: 64, offset: 128)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !44, file: !45, line: 56, baseType: !49, size: 64, offset: 192)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !44, file: !45, line: 57, baseType: !49, size: 64, offset: 256)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !44, file: !45, line: 58, baseType: !49, size: 64, offset: 320)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !44, file: !45, line: 59, baseType: !49, size: 64, offset: 384)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !44, file: !45, line: 60, baseType: !49, size: 64, offset: 448)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !44, file: !45, line: 61, baseType: !49, size: 64, offset: 512)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !44, file: !45, line: 64, baseType: !49, size: 64, offset: 576)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !44, file: !45, line: 65, baseType: !49, size: 64, offset: 640)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !44, file: !45, line: 66, baseType: !49, size: 64, offset: 704)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !44, file: !45, line: 68, baseType: !61, size: 64, offset: 768)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !45, line: 36, flags: DIFlagFwdDecl)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !44, file: !45, line: 70, baseType: !64, size: 64, offset: 832)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !44, file: !45, line: 72, baseType: !17, size: 32, offset: 896)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !44, file: !45, line: 73, baseType: !17, size: 32, offset: 928)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !44, file: !45, line: 74, baseType: !68, size: 64, offset: 960)
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !69, line: 152, baseType: !70)
!69 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!70 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !44, file: !45, line: 77, baseType: !72, size: 16, offset: 1024)
!72 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !44, file: !45, line: 78, baseType: !74, size: 8, offset: 1040)
!74 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !44, file: !45, line: 79, baseType: !76, size: 8, offset: 1048)
!76 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 8, elements: !77)
!77 = !{!78}
!78 = !DISubrange(count: 1)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !44, file: !45, line: 81, baseType: !80, size: 64, offset: 1088)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !45, line: 43, baseType: null)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !44, file: !45, line: 89, baseType: !83, size: 64, offset: 1152)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !69, line: 153, baseType: !70)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !44, file: !45, line: 91, baseType: !85, size: 64, offset: 1216)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !45, line: 37, flags: DIFlagFwdDecl)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !44, file: !45, line: 92, baseType: !88, size: 64, offset: 1280)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !45, line: 38, flags: DIFlagFwdDecl)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !44, file: !45, line: 93, baseType: !64, size: 64, offset: 1344)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !44, file: !45, line: 94, baseType: !92, size: 64, offset: 1408)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !44, file: !45, line: 95, baseType: !94, size: 64, offset: 1472)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !95, line: 46, baseType: !96)
!95 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
!96 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !44, file: !45, line: 96, baseType: !17, size: 32, offset: 1536)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !44, file: !45, line: 98, baseType: !99, size: 160, offset: 1568)
!99 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 160, elements: !100)
!100 = !{!101}
!101 = !DISubrange(count: 20)
!102 = !DILocation(line: 0, scope: !36)
!103 = !DILocalVariable(name: "rec_num", scope: !36, file: !3, line: 25, type: !17)
!104 = !DILocation(line: 26, column: 7, scope: !105)
!105 = distinct !DILexicalBlock(scope: !36, file: !3, line: 26, column: 3)
!106 = !DILocation(line: 0, scope: !105)
!107 = !DILocation(line: 26, column: 18, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !3, line: 26, column: 3)
!109 = !DILocation(line: 26, column: 26, scope: !108)
!110 = !DILocation(line: 26, column: 3, scope: !105)
!111 = !DILocation(line: 27, column: 42, scope: !108)
!112 = !DILocation(line: 27, column: 5, scope: !108)
!113 = !DILocation(line: 26, column: 72, scope: !108)
!114 = !DILocation(line: 26, column: 3, scope: !108)
!115 = distinct !{!115, !110, !116}
!116 = !DILocation(line: 27, column: 62, scope: !105)
!117 = !DILocation(line: 28, column: 3, scope: !36)
!118 = !DILocation(line: 33, column: 15, scope: !36)
!119 = !DILocalVariable(name: "passwd_buf", scope: !36, file: !3, line: 34, type: !120)
!120 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 65536, elements: !121)
!121 = !{!122}
!122 = !DISubrange(count: 8192)
!123 = !DILocation(line: 34, column: 8, scope: !36)
!124 = !DILocalVariable(name: "new_rec", scope: !36, file: !3, line: 35, type: !7)
!125 = !DILocation(line: 35, column: 12, scope: !36)
!126 = !DILocation(line: 39, column: 11, scope: !36)
!127 = !DILocation(line: 39, column: 3, scope: !36)
!128 = !DILocation(line: 42, column: 9, scope: !36)
!129 = !DILocation(line: 42, column: 30, scope: !36)
!130 = !DILocation(line: 42, column: 49, scope: !36)
!131 = !DILocation(line: 42, column: 42, scope: !36)
!132 = !DILocation(line: 42, column: 3, scope: !36)
!133 = !DILocation(line: 43, column: 3, scope: !36)
!134 = !DILocation(line: 48, column: 15, scope: !36)
!135 = !DILocation(line: 49, column: 3, scope: !36)
!136 = !DILocation(line: 49, column: 10, scope: !36)
!137 = !DILocation(line: 49, column: 9, scope: !36)
!138 = !DILocation(line: 50, column: 37, scope: !36)
!139 = !DILocation(line: 50, column: 5, scope: !36)
!140 = distinct !{!140, !135, !141}
!141 = !DILocation(line: 50, column: 53, scope: !36)
!142 = !DILocation(line: 51, column: 13, scope: !143)
!143 = distinct !DILexicalBlock(scope: !36, file: !3, line: 51, column: 6)
!144 = !DILocation(line: 51, column: 6, scope: !143)
!145 = !DILocation(line: 51, column: 6, scope: !36)
!146 = !{!"if"}
!147 = !DILocation(line: 52, column: 37, scope: !143)
!148 = !DILocation(line: 52, column: 5, scope: !143)
!149 = !DILocation(line: 53, column: 1, scope: !36)
