; ModuleID = 'doubly-linked-list-traversal.ll'
source_filename = "doubly-linked-list-traversal.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sListEntry = type { i8*, %struct.sListEntry*, %struct.sListEntry* }
%struct.sListIterator = type { %struct.sListEntry*, %struct.sListEntry* }

@main.contents = internal global [6 x i8*] [i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0)], align 16, !dbg !0
@.str = private unnamed_addr constant [5 x i8] c"Read\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"Orage\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"Yeller\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"Glean\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"Blew\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"Burple\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"forward\0A\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"value=%s\0A\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"\0Areverse\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.sListEntry* @NewList() #0 !dbg !22 {
entry:
  %call = call noalias i8* @malloc(i64 24) #4, !dbg !32
  %0 = bitcast i8* %call to %struct.sListEntry*, !dbg !32
  call void @llvm.dbg.value(metadata %struct.sListEntry* %0, metadata !33, metadata !DIExpression()), !dbg !35
  %tobool = icmp ne %struct.sListEntry* %0, null, !dbg !36
  br i1 %tobool, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %value = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %0, i32 0, i32 0, !dbg !39
  store i8* null, i8** %value, align 8, !dbg !41
  %prev = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %0, i32 0, i32 2, !dbg !42
  store %struct.sListEntry* null, %struct.sListEntry** %prev, align 8, !dbg !43
  %next = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %0, i32 0, i32 1, !dbg !44
  store %struct.sListEntry* null, %struct.sListEntry** %next, align 8, !dbg !45
  br label %if.end, !dbg !46

if.end:                                           ; preds = %if.then, %entry
  ret %struct.sListEntry* %0, !dbg !47
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @LL_Append(%struct.sListEntry* %ll, i8* %newVal) #0 !dbg !48 {
entry:
  call void @llvm.dbg.value(metadata %struct.sListEntry* %ll, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i8* %newVal, metadata !53, metadata !DIExpression()), !dbg !52
  %call = call noalias i8* @malloc(i64 24) #4, !dbg !54
  %0 = bitcast i8* %call to %struct.sListEntry*, !dbg !54
  call void @llvm.dbg.value(metadata %struct.sListEntry* %0, metadata !55, metadata !DIExpression()), !dbg !52
  %tobool = icmp ne %struct.sListEntry* %0, null, !dbg !56
  br i1 %tobool, label %if.then, label %if.end10, !dbg !58

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @strdup(i8* %newVal) #4, !dbg !59
  %value = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %0, i32 0, i32 0, !dbg !61
  store i8* %call1, i8** %value, align 8, !dbg !62
  %prev = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %ll, i32 0, i32 2, !dbg !63
  %1 = load %struct.sListEntry*, %struct.sListEntry** %prev, align 8, !dbg !63
  %prev2 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %0, i32 0, i32 2, !dbg !64
  store %struct.sListEntry* %1, %struct.sListEntry** %prev2, align 8, !dbg !65
  %next = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %0, i32 0, i32 1, !dbg !66
  store %struct.sListEntry* null, %struct.sListEntry** %next, align 8, !dbg !67
  %prev3 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %0, i32 0, i32 2, !dbg !68
  %2 = load %struct.sListEntry*, %struct.sListEntry** %prev3, align 8, !dbg !68
  %tobool4 = icmp ne %struct.sListEntry* %2, null, !dbg !70
  br i1 %tobool4, label %if.then5, label %if.else, !dbg !71

if.then5:                                         ; preds = %if.then
  %prev6 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %0, i32 0, i32 2, !dbg !72
  %3 = load %struct.sListEntry*, %struct.sListEntry** %prev6, align 8, !dbg !72
  %next7 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %3, i32 0, i32 1, !dbg !73
  store %struct.sListEntry* %0, %struct.sListEntry** %next7, align 8, !dbg !74
  br label %if.end, !dbg !75

if.else:                                          ; preds = %if.then
  %next8 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %ll, i32 0, i32 1, !dbg !76
  store %struct.sListEntry* %0, %struct.sListEntry** %next8, align 8, !dbg !77
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then5
  %prev9 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %ll, i32 0, i32 2, !dbg !78
  store %struct.sListEntry* %0, %struct.sListEntry** %prev9, align 8, !dbg !79
  br label %if.end10, !dbg !80

if.end10:                                         ; preds = %if.end, %entry
  %cmp = icmp ne %struct.sListEntry* %0, null, !dbg !81
  %conv = zext i1 %cmp to i32, !dbg !81
  ret i32 %conv, !dbg !82
}

; Function Attrs: nounwind
declare dso_local noalias i8* @strdup(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @LI_Insert(%struct.sListIterator* %iter, i8* %newVal) #0 !dbg !83 {
entry:
  call void @llvm.dbg.value(metadata %struct.sListIterator* %iter, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.value(metadata i8* %newVal, metadata !94, metadata !DIExpression()), !dbg !93
  %link = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %iter, i32 0, i32 0, !dbg !95
  %0 = load %struct.sListEntry*, %struct.sListEntry** %link, align 8, !dbg !95
  call void @llvm.dbg.value(metadata %struct.sListEntry* %0, metadata !96, metadata !DIExpression()), !dbg !93
  %call = call noalias i8* @malloc(i64 24) #4, !dbg !97
  %1 = bitcast i8* %call to %struct.sListEntry*, !dbg !97
  call void @llvm.dbg.value(metadata %struct.sListEntry* %1, metadata !98, metadata !DIExpression()), !dbg !93
  %tobool = icmp ne %struct.sListEntry* %1, null, !dbg !99
  br i1 %tobool, label %if.then, label %if.end35, !dbg !101

if.then:                                          ; preds = %entry
  %call1 = call noalias i8* @strdup(i8* %newVal) #4, !dbg !102
  %value = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %1, i32 0, i32 0, !dbg !104
  store i8* %call1, i8** %value, align 8, !dbg !105
  %head = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %iter, i32 0, i32 1, !dbg !106
  %2 = load %struct.sListEntry*, %struct.sListEntry** %head, align 8, !dbg !106
  %cmp = icmp eq %struct.sListEntry* %0, %2, !dbg !108
  br i1 %cmp, label %if.then2, label %if.else11, !dbg !109

if.then2:                                         ; preds = %if.then
  %prev = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %1, i32 0, i32 2, !dbg !110
  store %struct.sListEntry* null, %struct.sListEntry** %prev, align 8, !dbg !112
  %next = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %0, i32 0, i32 1, !dbg !113
  %3 = load %struct.sListEntry*, %struct.sListEntry** %next, align 8, !dbg !113
  %next3 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %1, i32 0, i32 1, !dbg !114
  store %struct.sListEntry* %3, %struct.sListEntry** %next3, align 8, !dbg !115
  %next4 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %0, i32 0, i32 1, !dbg !116
  store %struct.sListEntry* %1, %struct.sListEntry** %next4, align 8, !dbg !117
  %next5 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %1, i32 0, i32 1, !dbg !118
  %4 = load %struct.sListEntry*, %struct.sListEntry** %next5, align 8, !dbg !118
  %tobool6 = icmp ne %struct.sListEntry* %4, null, !dbg !120
  br i1 %tobool6, label %if.then7, label %if.else, !dbg !121

if.then7:                                         ; preds = %if.then2
  %next8 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %1, i32 0, i32 1, !dbg !122
  %5 = load %struct.sListEntry*, %struct.sListEntry** %next8, align 8, !dbg !122
  %prev9 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %5, i32 0, i32 2, !dbg !123
  store %struct.sListEntry* %1, %struct.sListEntry** %prev9, align 8, !dbg !124
  br label %if.end, !dbg !125

if.else:                                          ; preds = %if.then2
  %prev10 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %0, i32 0, i32 2, !dbg !126
  store %struct.sListEntry* %1, %struct.sListEntry** %prev10, align 8, !dbg !127
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then7
  br label %if.end34, !dbg !128

if.else11:                                        ; preds = %if.then
  %cmp12 = icmp eq %struct.sListEntry* %0, null, !dbg !129
  br i1 %cmp12, label %cond.true, label %cond.false, !dbg !131

cond.true:                                        ; preds = %if.else11
  %head13 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %iter, i32 0, i32 1, !dbg !132
  %6 = load %struct.sListEntry*, %struct.sListEntry** %head13, align 8, !dbg !132
  %prev14 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %6, i32 0, i32 2, !dbg !133
  %7 = load %struct.sListEntry*, %struct.sListEntry** %prev14, align 8, !dbg !133
  br label %cond.end, !dbg !131

cond.false:                                       ; preds = %if.else11
  %prev15 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %0, i32 0, i32 2, !dbg !134
  %8 = load %struct.sListEntry*, %struct.sListEntry** %prev15, align 8, !dbg !134
  br label %cond.end, !dbg !131

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.sListEntry* [ %7, %cond.true ], [ %8, %cond.false ], !dbg !131
  %prev16 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %1, i32 0, i32 2, !dbg !135
  store %struct.sListEntry* %cond, %struct.sListEntry** %prev16, align 8, !dbg !136
  %next17 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %1, i32 0, i32 1, !dbg !137
  store %struct.sListEntry* %0, %struct.sListEntry** %next17, align 8, !dbg !138
  %prev18 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %1, i32 0, i32 2, !dbg !139
  %9 = load %struct.sListEntry*, %struct.sListEntry** %prev18, align 8, !dbg !139
  %tobool19 = icmp ne %struct.sListEntry* %9, null, !dbg !141
  br i1 %tobool19, label %if.then20, label %if.else23, !dbg !142

if.then20:                                        ; preds = %cond.end
  %prev21 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %1, i32 0, i32 2, !dbg !143
  %10 = load %struct.sListEntry*, %struct.sListEntry** %prev21, align 8, !dbg !143
  %next22 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %10, i32 0, i32 1, !dbg !144
  store %struct.sListEntry* %1, %struct.sListEntry** %next22, align 8, !dbg !145
  br label %if.end26, !dbg !146

if.else23:                                        ; preds = %cond.end
  %head24 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %iter, i32 0, i32 1, !dbg !147
  %11 = load %struct.sListEntry*, %struct.sListEntry** %head24, align 8, !dbg !147
  %next25 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %11, i32 0, i32 1, !dbg !148
  store %struct.sListEntry* %1, %struct.sListEntry** %next25, align 8, !dbg !149
  br label %if.end26

if.end26:                                         ; preds = %if.else23, %if.then20
  %tobool27 = icmp ne %struct.sListEntry* %0, null, !dbg !150
  br i1 %tobool27, label %if.then28, label %if.else30, !dbg !152

if.then28:                                        ; preds = %if.end26
  %prev29 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %0, i32 0, i32 2, !dbg !153
  store %struct.sListEntry* %1, %struct.sListEntry** %prev29, align 8, !dbg !154
  br label %if.end33, !dbg !155

if.else30:                                        ; preds = %if.end26
  %head31 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %iter, i32 0, i32 1, !dbg !156
  %12 = load %struct.sListEntry*, %struct.sListEntry** %head31, align 8, !dbg !156
  %prev32 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %12, i32 0, i32 2, !dbg !157
  store %struct.sListEntry* %1, %struct.sListEntry** %prev32, align 8, !dbg !158
  br label %if.end33

if.end33:                                         ; preds = %if.else30, %if.then28
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %if.end
  br label %if.end35, !dbg !159

if.end35:                                         ; preds = %if.end34, %entry
  %cmp36 = icmp ne %struct.sListEntry* %1, null, !dbg !160
  %conv = zext i1 %cmp36 to i32, !dbg !160
  ret i32 %conv, !dbg !161
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.sListIterator* @LL_GetIterator(%struct.sListEntry* %ll) #0 !dbg !162 {
entry:
  call void @llvm.dbg.value(metadata %struct.sListEntry* %ll, metadata !165, metadata !DIExpression()), !dbg !166
  %call = call noalias i8* @malloc(i64 16) #4, !dbg !167
  %0 = bitcast i8* %call to %struct.sListIterator*, !dbg !167
  call void @llvm.dbg.value(metadata %struct.sListIterator* %0, metadata !168, metadata !DIExpression()), !dbg !166
  %head = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %0, i32 0, i32 1, !dbg !169
  store %struct.sListEntry* %ll, %struct.sListEntry** %head, align 8, !dbg !170
  %link = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %0, i32 0, i32 0, !dbg !171
  store %struct.sListEntry* %ll, %struct.sListEntry** %link, align 8, !dbg !172
  ret %struct.sListIterator* %0, !dbg !173
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @LLI_AtEnd(%struct.sListIterator* %iter) #0 !dbg !174 {
entry:
  call void @llvm.dbg.value(metadata %struct.sListIterator* %iter, metadata !177, metadata !DIExpression()), !dbg !178
  %link = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %iter, i32 0, i32 0, !dbg !179
  %0 = load %struct.sListEntry*, %struct.sListEntry** %link, align 8, !dbg !179
  %cmp = icmp eq %struct.sListEntry* %0, null, !dbg !180
  %conv = zext i1 %cmp to i32, !dbg !180
  ret i32 %conv, !dbg !181
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @LLI_Value(%struct.sListIterator* %iter) #0 !dbg !182 {
entry:
  call void @llvm.dbg.value(metadata %struct.sListIterator* %iter, metadata !185, metadata !DIExpression()), !dbg !186
  %link = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %iter, i32 0, i32 0, !dbg !187
  %0 = load %struct.sListEntry*, %struct.sListEntry** %link, align 8, !dbg !187
  %tobool = icmp ne %struct.sListEntry* %0, null, !dbg !188
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !188

cond.true:                                        ; preds = %entry
  %link1 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %iter, i32 0, i32 0, !dbg !189
  %1 = load %struct.sListEntry*, %struct.sListEntry** %link1, align 8, !dbg !189
  %value = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %1, i32 0, i32 0, !dbg !190
  %2 = load i8*, i8** %value, align 8, !dbg !190
  br label %cond.end, !dbg !188

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !188

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %2, %cond.true ], [ null, %cond.false ], !dbg !188
  ret i8* %cond, !dbg !191
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @LLI_Next(%struct.sListIterator* %iter) #0 !dbg !192 {
entry:
  call void @llvm.dbg.value(metadata %struct.sListIterator* %iter, metadata !193, metadata !DIExpression()), !dbg !194
  %link = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %iter, i32 0, i32 0, !dbg !195
  %0 = load %struct.sListEntry*, %struct.sListEntry** %link, align 8, !dbg !195
  %tobool = icmp ne %struct.sListEntry* %0, null, !dbg !197
  br i1 %tobool, label %if.then, label %if.end, !dbg !198

if.then:                                          ; preds = %entry
  %link1 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %iter, i32 0, i32 0, !dbg !199
  %1 = load %struct.sListEntry*, %struct.sListEntry** %link1, align 8, !dbg !199
  %next = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %1, i32 0, i32 1, !dbg !200
  %2 = load %struct.sListEntry*, %struct.sListEntry** %next, align 8, !dbg !200
  %link2 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %iter, i32 0, i32 0, !dbg !201
  store %struct.sListEntry* %2, %struct.sListEntry** %link2, align 8, !dbg !202
  br label %if.end, !dbg !203

if.end:                                           ; preds = %if.then, %entry
  %link3 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %iter, i32 0, i32 0, !dbg !204
  %3 = load %struct.sListEntry*, %struct.sListEntry** %link3, align 8, !dbg !204
  %cmp = icmp ne %struct.sListEntry* %3, null, !dbg !205
  %conv = zext i1 %cmp to i32, !dbg !205
  ret i32 %conv, !dbg !206
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @LLI_Prev(%struct.sListIterator* %iter) #0 !dbg !207 {
entry:
  call void @llvm.dbg.value(metadata %struct.sListIterator* %iter, metadata !208, metadata !DIExpression()), !dbg !209
  %link = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %iter, i32 0, i32 0, !dbg !210
  %0 = load %struct.sListEntry*, %struct.sListEntry** %link, align 8, !dbg !210
  %tobool = icmp ne %struct.sListEntry* %0, null, !dbg !212
  br i1 %tobool, label %if.then, label %if.end, !dbg !213

if.then:                                          ; preds = %entry
  %link1 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %iter, i32 0, i32 0, !dbg !214
  %1 = load %struct.sListEntry*, %struct.sListEntry** %link1, align 8, !dbg !214
  %prev = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %1, i32 0, i32 2, !dbg !215
  %2 = load %struct.sListEntry*, %struct.sListEntry** %prev, align 8, !dbg !215
  %link2 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %iter, i32 0, i32 0, !dbg !216
  store %struct.sListEntry* %2, %struct.sListEntry** %link2, align 8, !dbg !217
  br label %if.end, !dbg !218

if.end:                                           ; preds = %if.then, %entry
  %link3 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %iter, i32 0, i32 0, !dbg !219
  %3 = load %struct.sListEntry*, %struct.sListEntry** %link3, align 8, !dbg !219
  %cmp = icmp ne %struct.sListEntry* %3, null, !dbg !220
  %conv = zext i1 %cmp to i32, !dbg !220
  ret i32 %conv, !dbg !221
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !2 {
entry:
  %call = call %struct.sListEntry* @NewList(), !dbg !222
  call void @llvm.dbg.value(metadata %struct.sListEntry* %call, metadata !223, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.value(metadata i32 0, metadata !225, metadata !DIExpression()), !dbg !224
  br label %for.cond, !dbg !226

for.cond:                                         ; preds = %for.inc, %entry
  %ix.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !228
  call void @llvm.dbg.value(metadata i32 %ix.0, metadata !225, metadata !DIExpression()), !dbg !224
  %cmp = icmp slt i32 %ix.0, 6, !dbg !229
  br i1 %cmp, label %for.body, label %for.end, !dbg !231

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %ix.0 to i64, !dbg !232
  %arrayidx = getelementptr inbounds [6 x i8*], [6 x i8*]* @main.contents, i64 0, i64 %idxprom, !dbg !232
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !232
  %call1 = call i32 @LL_Append(%struct.sListEntry* %call, i8* %0), !dbg !233
  br label %for.inc, !dbg !233

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %ix.0, 1, !dbg !234
  call void @llvm.dbg.value(metadata i32 %inc, metadata !225, metadata !DIExpression()), !dbg !224
  br label %for.cond, !dbg !235, !llvm.loop !236

for.end:                                          ; preds = %for.cond
  %call2 = call %struct.sListIterator* @LL_GetIterator(%struct.sListEntry* %call), !dbg !238
  call void @llvm.dbg.value(metadata %struct.sListIterator* %call2, metadata !239, metadata !DIExpression()), !dbg !224
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i64 0, i64 0)), !dbg !240
  br label %while.cond, !dbg !241

while.cond:                                       ; preds = %while.body, %for.end
  %call4 = call i32 @LLI_Next(%struct.sListIterator* %call2), !dbg !242
  %tobool = icmp ne i32 %call4, 0, !dbg !241
  br i1 %tobool, label %while.body, label %while.end, !dbg !241

while.body:                                       ; preds = %while.cond
  %call5 = call i8* @LLI_Value(%struct.sListIterator* %call2), !dbg !243
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i64 0, i64 0), i8* %call5), !dbg !244
  br label %while.cond, !dbg !241, !llvm.loop !245

while.end:                                        ; preds = %while.cond
  %1 = bitcast %struct.sListIterator* %call2 to i8*, !dbg !247
  call void @free(i8* %1) #4, !dbg !247
  call void @llvm.dbg.value(metadata %struct.sListIterator* null, metadata !239, metadata !DIExpression()), !dbg !224
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i64 0, i64 0)), !dbg !249
  %call8 = call %struct.sListIterator* @LL_GetIterator(%struct.sListEntry* %call), !dbg !250
  call void @llvm.dbg.value(metadata %struct.sListIterator* %call8, metadata !239, metadata !DIExpression()), !dbg !224
  br label %while.cond9, !dbg !251

while.cond9:                                      ; preds = %while.body12, %while.end
  %call10 = call i32 @LLI_Prev(%struct.sListIterator* %call8), !dbg !252
  %tobool11 = icmp ne i32 %call10, 0, !dbg !251
  br i1 %tobool11, label %while.body12, label %while.end15, !dbg !251

while.body12:                                     ; preds = %while.cond9
  %call13 = call i8* @LLI_Value(%struct.sListIterator* %call8), !dbg !253
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i64 0, i64 0), i8* %call13), !dbg !254
  br label %while.cond9, !dbg !251, !llvm.loop !255

while.end15:                                      ; preds = %while.cond9
  %2 = bitcast %struct.sListIterator* %call8 to i8*, !dbg !257
  call void @free(i8* %2) #4, !dbg !257
  call void @llvm.dbg.value(metadata %struct.sListIterator* null, metadata !239, metadata !DIExpression()), !dbg !224
  ret i32 0, !dbg !259
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "contents", scope: !2, file: !3, line: 106, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 104, type: !4, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!3 = !DIFile(filename: "doubly-linked-list-traversal.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Doubly-linked-list-Traversal")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, retainedTypes: !9, globals: !11, splitDebugInlining: false, nameTableKind: None)
!8 = !{}
!9 = !{!10}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{!0}
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 384, elements: !16)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !{!17}
!17 = !DISubrange(count: 6)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!22 = distinct !DISubprogram(name: "NewList", scope: !3, file: !3, line: 17, type: !23, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!23 = !DISubroutineType(types: !24)
!24 = !{!25}
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "LinkedList", file: !3, line: 10, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sListEntry", file: !3, line: 6, size: 192, elements: !28)
!28 = !{!29, !30, !31}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !27, file: !3, line: 7, baseType: !13, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !27, file: !3, line: 8, baseType: !26, size: 64, offset: 64)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !27, file: !3, line: 9, baseType: !26, size: 64, offset: 128)
!32 = !DILocation(line: 18, column: 20, scope: !22)
!33 = !DILocalVariable(name: "le", scope: !22, file: !3, line: 18, type: !34)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "ListEntry", file: !3, line: 10, baseType: !26)
!35 = !DILocation(line: 0, scope: !22)
!36 = !DILocation(line: 19, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !22, file: !3, line: 19, column: 9)
!38 = !DILocation(line: 19, column: 9, scope: !22)
!39 = !DILocation(line: 20, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !3, line: 19, column: 13)
!41 = !DILocation(line: 20, column: 19, scope: !40)
!42 = !DILocation(line: 21, column: 24, scope: !40)
!43 = !DILocation(line: 21, column: 29, scope: !40)
!44 = !DILocation(line: 21, column: 13, scope: !40)
!45 = !DILocation(line: 21, column: 18, scope: !40)
!46 = !DILocation(line: 22, column: 5, scope: !40)
!47 = !DILocation(line: 23, column: 5, scope: !22)
!48 = distinct !DISubprogram(name: "LL_Append", scope: !3, file: !3, line: 26, type: !49, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!49 = !DISubroutineType(types: !50)
!50 = !{!6, !25, !13}
!51 = !DILocalVariable(name: "ll", arg: 1, scope: !48, file: !3, line: 26, type: !25)
!52 = !DILocation(line: 0, scope: !48)
!53 = !DILocalVariable(name: "newVal", arg: 2, scope: !48, file: !3, line: 26, type: !13)
!54 = !DILocation(line: 28, column: 20, scope: !48)
!55 = !DILocalVariable(name: "le", scope: !48, file: !3, line: 28, type: !34)
!56 = !DILocation(line: 29, column: 9, scope: !57)
!57 = distinct !DILexicalBlock(scope: !48, file: !3, line: 29, column: 9)
!58 = !DILocation(line: 29, column: 9, scope: !48)
!59 = !DILocation(line: 30, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !3, line: 29, column: 13)
!61 = !DILocation(line: 30, column: 13, scope: !60)
!62 = !DILocation(line: 30, column: 19, scope: !60)
!63 = !DILocation(line: 31, column: 24, scope: !60)
!64 = !DILocation(line: 31, column: 13, scope: !60)
!65 = !DILocation(line: 31, column: 18, scope: !60)
!66 = !DILocation(line: 32, column: 13, scope: !60)
!67 = !DILocation(line: 32, column: 18, scope: !60)
!68 = !DILocation(line: 33, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !60, file: !3, line: 33, column: 13)
!70 = !DILocation(line: 33, column: 13, scope: !69)
!71 = !DILocation(line: 33, column: 13, scope: !60)
!72 = !DILocation(line: 34, column: 17, scope: !69)
!73 = !DILocation(line: 34, column: 23, scope: !69)
!74 = !DILocation(line: 34, column: 28, scope: !69)
!75 = !DILocation(line: 34, column: 13, scope: !69)
!76 = !DILocation(line: 36, column: 17, scope: !69)
!77 = !DILocation(line: 36, column: 22, scope: !69)
!78 = !DILocation(line: 37, column: 13, scope: !60)
!79 = !DILocation(line: 37, column: 18, scope: !60)
!80 = !DILocation(line: 38, column: 5, scope: !60)
!81 = !DILocation(line: 39, column: 15, scope: !48)
!82 = !DILocation(line: 39, column: 5, scope: !48)
!83 = distinct !DISubprogram(name: "LI_Insert", scope: !3, file: !3, line: 42, type: !84, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!84 = !DISubroutineType(types: !85)
!85 = !{!6, !86, !13}
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "LIterator", file: !3, line: 15, baseType: !87)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sListIterator", file: !3, line: 12, size: 128, elements: !89)
!89 = !{!90, !91}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "link", scope: !88, file: !3, line: 13, baseType: !34, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "head", scope: !88, file: !3, line: 14, baseType: !25, size: 64, offset: 64)
!92 = !DILocalVariable(name: "iter", arg: 1, scope: !83, file: !3, line: 42, type: !86)
!93 = !DILocation(line: 0, scope: !83)
!94 = !DILocalVariable(name: "newVal", arg: 2, scope: !83, file: !3, line: 42, type: !13)
!95 = !DILocation(line: 44, column: 28, scope: !83)
!96 = !DILocalVariable(name: "crnt", scope: !83, file: !3, line: 44, type: !34)
!97 = !DILocation(line: 45, column: 20, scope: !83)
!98 = !DILocalVariable(name: "le", scope: !83, file: !3, line: 45, type: !34)
!99 = !DILocation(line: 46, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !83, file: !3, line: 46, column: 9)
!101 = !DILocation(line: 46, column: 9, scope: !83)
!102 = !DILocation(line: 47, column: 21, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !3, line: 46, column: 13)
!104 = !DILocation(line: 47, column: 13, scope: !103)
!105 = !DILocation(line: 47, column: 19, scope: !103)
!106 = !DILocation(line: 48, column: 28, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !3, line: 48, column: 14)
!108 = !DILocation(line: 48, column: 19, scope: !107)
!109 = !DILocation(line: 48, column: 14, scope: !103)
!110 = !DILocation(line: 49, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !3, line: 48, column: 34)
!112 = !DILocation(line: 49, column: 22, scope: !111)
!113 = !DILocation(line: 50, column: 30, scope: !111)
!114 = !DILocation(line: 50, column: 17, scope: !111)
!115 = !DILocation(line: 50, column: 22, scope: !111)
!116 = !DILocation(line: 51, column: 19, scope: !111)
!117 = !DILocation(line: 51, column: 24, scope: !111)
!118 = !DILocation(line: 52, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !111, file: !3, line: 52, column: 17)
!120 = !DILocation(line: 52, column: 17, scope: !119)
!121 = !DILocation(line: 52, column: 17, scope: !111)
!122 = !DILocation(line: 53, column: 21, scope: !119)
!123 = !DILocation(line: 53, column: 27, scope: !119)
!124 = !DILocation(line: 53, column: 32, scope: !119)
!125 = !DILocation(line: 53, column: 17, scope: !119)
!126 = !DILocation(line: 55, column: 23, scope: !119)
!127 = !DILocation(line: 55, column: 28, scope: !119)
!128 = !DILocation(line: 56, column: 9, scope: !111)
!129 = !DILocation(line: 58, column: 31, scope: !130)
!130 = distinct !DILexicalBlock(scope: !107, file: !3, line: 57, column: 14)
!131 = !DILocation(line: 58, column: 24, scope: !130)
!132 = !DILocation(line: 58, column: 47, scope: !130)
!133 = !DILocation(line: 58, column: 53, scope: !130)
!134 = !DILocation(line: 58, column: 66, scope: !130)
!135 = !DILocation(line: 58, column: 17, scope: !130)
!136 = !DILocation(line: 58, column: 22, scope: !130)
!137 = !DILocation(line: 59, column: 17, scope: !130)
!138 = !DILocation(line: 59, column: 22, scope: !130)
!139 = !DILocation(line: 60, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !130, file: !3, line: 60, column: 17)
!141 = !DILocation(line: 60, column: 17, scope: !140)
!142 = !DILocation(line: 60, column: 17, scope: !130)
!143 = !DILocation(line: 61, column: 21, scope: !140)
!144 = !DILocation(line: 61, column: 27, scope: !140)
!145 = !DILocation(line: 61, column: 32, scope: !140)
!146 = !DILocation(line: 61, column: 17, scope: !140)
!147 = !DILocation(line: 63, column: 23, scope: !140)
!148 = !DILocation(line: 63, column: 29, scope: !140)
!149 = !DILocation(line: 63, column: 34, scope: !140)
!150 = !DILocation(line: 64, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !130, file: !3, line: 64, column: 17)
!152 = !DILocation(line: 64, column: 17, scope: !130)
!153 = !DILocation(line: 65, column: 23, scope: !151)
!154 = !DILocation(line: 65, column: 28, scope: !151)
!155 = !DILocation(line: 65, column: 17, scope: !151)
!156 = !DILocation(line: 67, column: 23, scope: !151)
!157 = !DILocation(line: 67, column: 29, scope: !151)
!158 = !DILocation(line: 67, column: 34, scope: !151)
!159 = !DILocation(line: 69, column: 5, scope: !103)
!160 = !DILocation(line: 70, column: 15, scope: !83)
!161 = !DILocation(line: 70, column: 5, scope: !83)
!162 = distinct !DISubprogram(name: "LL_GetIterator", scope: !3, file: !3, line: 73, type: !163, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!163 = !DISubroutineType(types: !164)
!164 = !{!86, !25}
!165 = !DILocalVariable(name: "ll", arg: 1, scope: !162, file: !3, line: 73, type: !25)
!166 = !DILocation(line: 0, scope: !162)
!167 = !DILocation(line: 75, column: 23, scope: !162)
!168 = !DILocalVariable(name: "liter", scope: !162, file: !3, line: 75, type: !86)
!169 = !DILocation(line: 76, column: 12, scope: !162)
!170 = !DILocation(line: 76, column: 17, scope: !162)
!171 = !DILocation(line: 77, column: 12, scope: !162)
!172 = !DILocation(line: 77, column: 17, scope: !162)
!173 = !DILocation(line: 78, column: 5, scope: !162)
!174 = distinct !DISubprogram(name: "LLI_AtEnd", scope: !3, file: !3, line: 85, type: !175, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!175 = !DISubroutineType(types: !176)
!176 = !{!6, !86}
!177 = !DILocalVariable(name: "iter", arg: 1, scope: !174, file: !3, line: 85, type: !86)
!178 = !DILocation(line: 0, scope: !174)
!179 = !DILocation(line: 87, column: 18, scope: !174)
!180 = !DILocation(line: 87, column: 23, scope: !174)
!181 = !DILocation(line: 87, column: 5, scope: !174)
!182 = distinct !DISubprogram(name: "LLI_Value", scope: !3, file: !3, line: 89, type: !183, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!183 = !DISubroutineType(types: !184)
!184 = !{!13, !86}
!185 = !DILocalVariable(name: "iter", arg: 1, scope: !182, file: !3, line: 89, type: !86)
!186 = !DILocation(line: 0, scope: !182)
!187 = !DILocation(line: 91, column: 19, scope: !182)
!188 = !DILocation(line: 91, column: 12, scope: !182)
!189 = !DILocation(line: 91, column: 32, scope: !182)
!190 = !DILocation(line: 91, column: 38, scope: !182)
!191 = !DILocation(line: 91, column: 5, scope: !182)
!192 = distinct !DISubprogram(name: "LLI_Next", scope: !3, file: !3, line: 93, type: !175, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!193 = !DILocalVariable(name: "iter", arg: 1, scope: !192, file: !3, line: 93, type: !86)
!194 = !DILocation(line: 0, scope: !192)
!195 = !DILocation(line: 95, column: 15, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !3, line: 95, column: 9)
!197 = !DILocation(line: 95, column: 9, scope: !196)
!198 = !DILocation(line: 95, column: 9, scope: !192)
!199 = !DILocation(line: 95, column: 40, scope: !196)
!200 = !DILocation(line: 95, column: 46, scope: !196)
!201 = !DILocation(line: 95, column: 27, scope: !196)
!202 = !DILocation(line: 95, column: 32, scope: !196)
!203 = !DILocation(line: 95, column: 21, scope: !196)
!204 = !DILocation(line: 96, column: 18, scope: !192)
!205 = !DILocation(line: 96, column: 23, scope: !192)
!206 = !DILocation(line: 96, column: 5, scope: !192)
!207 = distinct !DISubprogram(name: "LLI_Prev", scope: !3, file: !3, line: 98, type: !175, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!208 = !DILocalVariable(name: "iter", arg: 1, scope: !207, file: !3, line: 98, type: !86)
!209 = !DILocation(line: 0, scope: !207)
!210 = !DILocation(line: 100, column: 15, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !3, line: 100, column: 9)
!212 = !DILocation(line: 100, column: 9, scope: !211)
!213 = !DILocation(line: 100, column: 9, scope: !207)
!214 = !DILocation(line: 100, column: 40, scope: !211)
!215 = !DILocation(line: 100, column: 46, scope: !211)
!216 = !DILocation(line: 100, column: 27, scope: !211)
!217 = !DILocation(line: 100, column: 32, scope: !211)
!218 = !DILocation(line: 100, column: 21, scope: !211)
!219 = !DILocation(line: 101, column: 18, scope: !207)
!220 = !DILocation(line: 101, column: 23, scope: !207)
!221 = !DILocation(line: 101, column: 5, scope: !207)
!222 = !DILocation(line: 109, column: 21, scope: !2)
!223 = !DILocalVariable(name: "ll", scope: !2, file: !3, line: 109, type: !25)
!224 = !DILocation(line: 0, scope: !2)
!225 = !DILocalVariable(name: "ix", scope: !2, file: !3, line: 108, type: !6)
!226 = !DILocation(line: 112, column: 10, scope: !227)
!227 = distinct !DILexicalBlock(scope: !2, file: !3, line: 112, column: 5)
!228 = !DILocation(line: 0, scope: !227)
!229 = !DILocation(line: 112, column: 18, scope: !230)
!230 = distinct !DILexicalBlock(scope: !227, file: !3, line: 112, column: 5)
!231 = !DILocation(line: 112, column: 5, scope: !227)
!232 = !DILocation(line: 113, column: 23, scope: !230)
!233 = !DILocation(line: 113, column: 9, scope: !230)
!234 = !DILocation(line: 112, column: 24, scope: !230)
!235 = !DILocation(line: 112, column: 5, scope: !230)
!236 = distinct !{!236, !231, !237}
!237 = !DILocation(line: 113, column: 35, scope: !227)
!238 = !DILocation(line: 115, column: 12, scope: !2)
!239 = !DILocalVariable(name: "iter", scope: !2, file: !3, line: 110, type: !86)
!240 = !DILocation(line: 116, column: 5, scope: !2)
!241 = !DILocation(line: 117, column: 5, scope: !2)
!242 = !DILocation(line: 117, column: 11, scope: !2)
!243 = !DILocation(line: 118, column: 30, scope: !2)
!244 = !DILocation(line: 118, column: 9, scope: !2)
!245 = distinct !{!245, !241, !246}
!246 = !DILocation(line: 118, column: 45, scope: !2)
!247 = !DILocation(line: 119, column: 5, scope: !248)
!248 = distinct !DILexicalBlock(scope: !2, file: !3, line: 119, column: 5)
!249 = !DILocation(line: 121, column: 5, scope: !2)
!250 = !DILocation(line: 122, column: 12, scope: !2)
!251 = !DILocation(line: 123, column: 5, scope: !2)
!252 = !DILocation(line: 123, column: 11, scope: !2)
!253 = !DILocation(line: 124, column: 30, scope: !2)
!254 = !DILocation(line: 124, column: 9, scope: !2)
!255 = distinct !{!255, !251, !256}
!256 = !DILocation(line: 124, column: 45, scope: !2)
!257 = !DILocation(line: 125, column: 5, scope: !258)
!258 = distinct !DILexicalBlock(scope: !2, file: !3, line: 125, column: 5)
!259 = !DILocation(line: 127, column: 5, scope: !2)
