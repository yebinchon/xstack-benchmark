; ModuleID = 'doubly-linked-list-traversal.c'
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
  %le = alloca %struct.sListEntry*, align 8
  call void @llvm.dbg.declare(metadata %struct.sListEntry** %le, metadata !32, metadata !DIExpression()), !dbg !34
  %call = call noalias i8* @malloc(i64 24) #4, !dbg !35
  %0 = bitcast i8* %call to %struct.sListEntry*, !dbg !35
  store %struct.sListEntry* %0, %struct.sListEntry** %le, align 8, !dbg !34
  %1 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !36
  %tobool = icmp ne %struct.sListEntry* %1, null, !dbg !36
  br i1 %tobool, label %if.then, label %if.end, !dbg !38, !cf.info !39

if.then:                                          ; preds = %entry
  %2 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !40
  %value = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %2, i32 0, i32 0, !dbg !42
  store i8* null, i8** %value, align 8, !dbg !43
  %3 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !44
  %prev = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %3, i32 0, i32 2, !dbg !45
  store %struct.sListEntry* null, %struct.sListEntry** %prev, align 8, !dbg !46
  %4 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !47
  %next = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %4, i32 0, i32 1, !dbg !48
  store %struct.sListEntry* null, %struct.sListEntry** %next, align 8, !dbg !49
  br label %if.end, !dbg !50

if.end:                                           ; preds = %if.then, %entry
  %5 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !51
  ret %struct.sListEntry* %5, !dbg !52
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @LL_Append(%struct.sListEntry* %ll, i8* %newVal) #0 !dbg !53 {
entry:
  %ll.addr = alloca %struct.sListEntry*, align 8
  %newVal.addr = alloca i8*, align 8
  %le = alloca %struct.sListEntry*, align 8
  store %struct.sListEntry* %ll, %struct.sListEntry** %ll.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.sListEntry** %ll.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8* %newVal, i8** %newVal.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %newVal.addr, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata %struct.sListEntry** %le, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call noalias i8* @malloc(i64 24) #4, !dbg !62
  %0 = bitcast i8* %call to %struct.sListEntry*, !dbg !62
  store %struct.sListEntry* %0, %struct.sListEntry** %le, align 8, !dbg !61
  %1 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !63
  %tobool = icmp ne %struct.sListEntry* %1, null, !dbg !63
  br i1 %tobool, label %if.then, label %if.end10, !dbg !65, !cf.info !39

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %newVal.addr, align 8, !dbg !66
  %call1 = call noalias i8* @strdup(i8* %2) #4, !dbg !68
  %3 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !69
  %value = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %3, i32 0, i32 0, !dbg !70
  store i8* %call1, i8** %value, align 8, !dbg !71
  %4 = load %struct.sListEntry*, %struct.sListEntry** %ll.addr, align 8, !dbg !72
  %prev = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %4, i32 0, i32 2, !dbg !73
  %5 = load %struct.sListEntry*, %struct.sListEntry** %prev, align 8, !dbg !73
  %6 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !74
  %prev2 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %6, i32 0, i32 2, !dbg !75
  store %struct.sListEntry* %5, %struct.sListEntry** %prev2, align 8, !dbg !76
  %7 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !77
  %next = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %7, i32 0, i32 1, !dbg !78
  store %struct.sListEntry* null, %struct.sListEntry** %next, align 8, !dbg !79
  %8 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !80
  %prev3 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %8, i32 0, i32 2, !dbg !82
  %9 = load %struct.sListEntry*, %struct.sListEntry** %prev3, align 8, !dbg !82
  %tobool4 = icmp ne %struct.sListEntry* %9, null, !dbg !80
  br i1 %tobool4, label %if.then5, label %if.else, !dbg !83, !cf.info !39

if.then5:                                         ; preds = %if.then
  %10 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !84
  %11 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !85
  %prev6 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %11, i32 0, i32 2, !dbg !86
  %12 = load %struct.sListEntry*, %struct.sListEntry** %prev6, align 8, !dbg !86
  %next7 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %12, i32 0, i32 1, !dbg !87
  store %struct.sListEntry* %10, %struct.sListEntry** %next7, align 8, !dbg !88
  br label %if.end, !dbg !85

if.else:                                          ; preds = %if.then
  %13 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !89
  %14 = load %struct.sListEntry*, %struct.sListEntry** %ll.addr, align 8, !dbg !90
  %next8 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %14, i32 0, i32 1, !dbg !91
  store %struct.sListEntry* %13, %struct.sListEntry** %next8, align 8, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then5
  %15 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !93
  %16 = load %struct.sListEntry*, %struct.sListEntry** %ll.addr, align 8, !dbg !94
  %prev9 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %16, i32 0, i32 2, !dbg !95
  store %struct.sListEntry* %15, %struct.sListEntry** %prev9, align 8, !dbg !96
  br label %if.end10, !dbg !97

if.end10:                                         ; preds = %if.end, %entry
  %17 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !98
  %cmp = icmp ne %struct.sListEntry* %17, null, !dbg !99
  %conv = zext i1 %cmp to i32, !dbg !99
  ret i32 %conv, !dbg !100
}

; Function Attrs: nounwind
declare dso_local noalias i8* @strdup(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @LI_Insert(%struct.sListIterator* %iter, i8* %newVal) #0 !dbg !101 {
entry:
  %iter.addr = alloca %struct.sListIterator*, align 8
  %newVal.addr = alloca i8*, align 8
  %crnt = alloca %struct.sListEntry*, align 8
  %le = alloca %struct.sListEntry*, align 8
  store %struct.sListIterator* %iter, %struct.sListIterator** %iter.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.sListIterator** %iter.addr, metadata !110, metadata !DIExpression()), !dbg !111
  store i8* %newVal, i8** %newVal.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %newVal.addr, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata %struct.sListEntry** %crnt, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !116
  %link = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %0, i32 0, i32 0, !dbg !117
  %1 = load %struct.sListEntry*, %struct.sListEntry** %link, align 8, !dbg !117
  store %struct.sListEntry* %1, %struct.sListEntry** %crnt, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata %struct.sListEntry** %le, metadata !118, metadata !DIExpression()), !dbg !119
  %call = call noalias i8* @malloc(i64 24) #4, !dbg !120
  %2 = bitcast i8* %call to %struct.sListEntry*, !dbg !120
  store %struct.sListEntry* %2, %struct.sListEntry** %le, align 8, !dbg !119
  %3 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !121
  %tobool = icmp ne %struct.sListEntry* %3, null, !dbg !121
  br i1 %tobool, label %if.then, label %if.end35, !dbg !123, !cf.info !39

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %newVal.addr, align 8, !dbg !124
  %call1 = call noalias i8* @strdup(i8* %4) #4, !dbg !126
  %5 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !127
  %value = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %5, i32 0, i32 0, !dbg !128
  store i8* %call1, i8** %value, align 8, !dbg !129
  %6 = load %struct.sListEntry*, %struct.sListEntry** %crnt, align 8, !dbg !130
  %7 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !132
  %head = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %7, i32 0, i32 1, !dbg !133
  %8 = load %struct.sListEntry*, %struct.sListEntry** %head, align 8, !dbg !133
  %cmp = icmp eq %struct.sListEntry* %6, %8, !dbg !134
  br i1 %cmp, label %if.then2, label %if.else11, !dbg !135, !cf.info !39

if.then2:                                         ; preds = %if.then
  %9 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !136
  %prev = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %9, i32 0, i32 2, !dbg !138
  store %struct.sListEntry* null, %struct.sListEntry** %prev, align 8, !dbg !139
  %10 = load %struct.sListEntry*, %struct.sListEntry** %crnt, align 8, !dbg !140
  %next = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %10, i32 0, i32 1, !dbg !141
  %11 = load %struct.sListEntry*, %struct.sListEntry** %next, align 8, !dbg !141
  %12 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !142
  %next3 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %12, i32 0, i32 1, !dbg !143
  store %struct.sListEntry* %11, %struct.sListEntry** %next3, align 8, !dbg !144
  %13 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !145
  %14 = load %struct.sListEntry*, %struct.sListEntry** %crnt, align 8, !dbg !146
  %next4 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %14, i32 0, i32 1, !dbg !147
  store %struct.sListEntry* %13, %struct.sListEntry** %next4, align 8, !dbg !148
  %15 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !149
  %next5 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %15, i32 0, i32 1, !dbg !151
  %16 = load %struct.sListEntry*, %struct.sListEntry** %next5, align 8, !dbg !151
  %tobool6 = icmp ne %struct.sListEntry* %16, null, !dbg !149
  br i1 %tobool6, label %if.then7, label %if.else, !dbg !152, !cf.info !39

if.then7:                                         ; preds = %if.then2
  %17 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !153
  %18 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !154
  %next8 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %18, i32 0, i32 1, !dbg !155
  %19 = load %struct.sListEntry*, %struct.sListEntry** %next8, align 8, !dbg !155
  %prev9 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %19, i32 0, i32 2, !dbg !156
  store %struct.sListEntry* %17, %struct.sListEntry** %prev9, align 8, !dbg !157
  br label %if.end, !dbg !154

if.else:                                          ; preds = %if.then2
  %20 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !158
  %21 = load %struct.sListEntry*, %struct.sListEntry** %crnt, align 8, !dbg !159
  %prev10 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %21, i32 0, i32 2, !dbg !160
  store %struct.sListEntry* %20, %struct.sListEntry** %prev10, align 8, !dbg !161
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then7
  br label %if.end34, !dbg !162

if.else11:                                        ; preds = %if.then
  %22 = load %struct.sListEntry*, %struct.sListEntry** %crnt, align 8, !dbg !163
  %cmp12 = icmp eq %struct.sListEntry* %22, null, !dbg !165
  br i1 %cmp12, label %cond.true, label %cond.false, !dbg !166

cond.true:                                        ; preds = %if.else11
  %23 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !167
  %head13 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %23, i32 0, i32 1, !dbg !168
  %24 = load %struct.sListEntry*, %struct.sListEntry** %head13, align 8, !dbg !168
  %prev14 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %24, i32 0, i32 2, !dbg !169
  %25 = load %struct.sListEntry*, %struct.sListEntry** %prev14, align 8, !dbg !169
  br label %cond.end, !dbg !166

cond.false:                                       ; preds = %if.else11
  %26 = load %struct.sListEntry*, %struct.sListEntry** %crnt, align 8, !dbg !170
  %prev15 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %26, i32 0, i32 2, !dbg !171
  %27 = load %struct.sListEntry*, %struct.sListEntry** %prev15, align 8, !dbg !171
  br label %cond.end, !dbg !166

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.sListEntry* [ %25, %cond.true ], [ %27, %cond.false ], !dbg !166
  %28 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !172
  %prev16 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %28, i32 0, i32 2, !dbg !173
  store %struct.sListEntry* %cond, %struct.sListEntry** %prev16, align 8, !dbg !174
  %29 = load %struct.sListEntry*, %struct.sListEntry** %crnt, align 8, !dbg !175
  %30 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !176
  %next17 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %30, i32 0, i32 1, !dbg !177
  store %struct.sListEntry* %29, %struct.sListEntry** %next17, align 8, !dbg !178
  %31 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !179
  %prev18 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %31, i32 0, i32 2, !dbg !181
  %32 = load %struct.sListEntry*, %struct.sListEntry** %prev18, align 8, !dbg !181
  %tobool19 = icmp ne %struct.sListEntry* %32, null, !dbg !179
  br i1 %tobool19, label %if.then20, label %if.else23, !dbg !182, !cf.info !39

if.then20:                                        ; preds = %cond.end
  %33 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !183
  %34 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !184
  %prev21 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %34, i32 0, i32 2, !dbg !185
  %35 = load %struct.sListEntry*, %struct.sListEntry** %prev21, align 8, !dbg !185
  %next22 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %35, i32 0, i32 1, !dbg !186
  store %struct.sListEntry* %33, %struct.sListEntry** %next22, align 8, !dbg !187
  br label %if.end26, !dbg !184

if.else23:                                        ; preds = %cond.end
  %36 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !188
  %37 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !189
  %head24 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %37, i32 0, i32 1, !dbg !190
  %38 = load %struct.sListEntry*, %struct.sListEntry** %head24, align 8, !dbg !190
  %next25 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %38, i32 0, i32 1, !dbg !191
  store %struct.sListEntry* %36, %struct.sListEntry** %next25, align 8, !dbg !192
  br label %if.end26

if.end26:                                         ; preds = %if.else23, %if.then20
  %39 = load %struct.sListEntry*, %struct.sListEntry** %crnt, align 8, !dbg !193
  %tobool27 = icmp ne %struct.sListEntry* %39, null, !dbg !193
  br i1 %tobool27, label %if.then28, label %if.else30, !dbg !195, !cf.info !39

if.then28:                                        ; preds = %if.end26
  %40 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !196
  %41 = load %struct.sListEntry*, %struct.sListEntry** %crnt, align 8, !dbg !197
  %prev29 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %41, i32 0, i32 2, !dbg !198
  store %struct.sListEntry* %40, %struct.sListEntry** %prev29, align 8, !dbg !199
  br label %if.end33, !dbg !197

if.else30:                                        ; preds = %if.end26
  %42 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !200
  %43 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !201
  %head31 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %43, i32 0, i32 1, !dbg !202
  %44 = load %struct.sListEntry*, %struct.sListEntry** %head31, align 8, !dbg !202
  %prev32 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %44, i32 0, i32 2, !dbg !203
  store %struct.sListEntry* %42, %struct.sListEntry** %prev32, align 8, !dbg !204
  br label %if.end33

if.end33:                                         ; preds = %if.else30, %if.then28
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %if.end
  br label %if.end35, !dbg !205

if.end35:                                         ; preds = %if.end34, %entry
  %45 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !206
  %cmp36 = icmp ne %struct.sListEntry* %45, null, !dbg !207
  %conv = zext i1 %cmp36 to i32, !dbg !207
  ret i32 %conv, !dbg !208
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.sListIterator* @LL_GetIterator(%struct.sListEntry* %ll) #0 !dbg !209 {
entry:
  %ll.addr = alloca %struct.sListEntry*, align 8
  %liter = alloca %struct.sListIterator*, align 8
  store %struct.sListEntry* %ll, %struct.sListEntry** %ll.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.sListEntry** %ll.addr, metadata !212, metadata !DIExpression()), !dbg !213
  call void @llvm.dbg.declare(metadata %struct.sListIterator** %liter, metadata !214, metadata !DIExpression()), !dbg !215
  %call = call noalias i8* @malloc(i64 16) #4, !dbg !216
  %0 = bitcast i8* %call to %struct.sListIterator*, !dbg !216
  store %struct.sListIterator* %0, %struct.sListIterator** %liter, align 8, !dbg !215
  %1 = load %struct.sListEntry*, %struct.sListEntry** %ll.addr, align 8, !dbg !217
  %2 = load %struct.sListIterator*, %struct.sListIterator** %liter, align 8, !dbg !218
  %head = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %2, i32 0, i32 1, !dbg !219
  store %struct.sListEntry* %1, %struct.sListEntry** %head, align 8, !dbg !220
  %3 = load %struct.sListEntry*, %struct.sListEntry** %ll.addr, align 8, !dbg !221
  %4 = load %struct.sListIterator*, %struct.sListIterator** %liter, align 8, !dbg !222
  %link = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %4, i32 0, i32 0, !dbg !223
  store %struct.sListEntry* %3, %struct.sListEntry** %link, align 8, !dbg !224
  %5 = load %struct.sListIterator*, %struct.sListIterator** %liter, align 8, !dbg !225
  ret %struct.sListIterator* %5, !dbg !226
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @LLI_AtEnd(%struct.sListIterator* %iter) #0 !dbg !227 {
entry:
  %iter.addr = alloca %struct.sListIterator*, align 8
  store %struct.sListIterator* %iter, %struct.sListIterator** %iter.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.sListIterator** %iter.addr, metadata !230, metadata !DIExpression()), !dbg !231
  %0 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !232
  %link = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %0, i32 0, i32 0, !dbg !233
  %1 = load %struct.sListEntry*, %struct.sListEntry** %link, align 8, !dbg !233
  %cmp = icmp eq %struct.sListEntry* %1, null, !dbg !234
  %conv = zext i1 %cmp to i32, !dbg !234
  ret i32 %conv, !dbg !235
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @LLI_Value(%struct.sListIterator* %iter) #0 !dbg !236 {
entry:
  %iter.addr = alloca %struct.sListIterator*, align 8
  store %struct.sListIterator* %iter, %struct.sListIterator** %iter.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.sListIterator** %iter.addr, metadata !239, metadata !DIExpression()), !dbg !240
  %0 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !241
  %link = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %0, i32 0, i32 0, !dbg !242
  %1 = load %struct.sListEntry*, %struct.sListEntry** %link, align 8, !dbg !242
  %tobool = icmp ne %struct.sListEntry* %1, null, !dbg !243
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !243

cond.true:                                        ; preds = %entry
  %2 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !244
  %link1 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %2, i32 0, i32 0, !dbg !245
  %3 = load %struct.sListEntry*, %struct.sListEntry** %link1, align 8, !dbg !245
  %value = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %3, i32 0, i32 0, !dbg !246
  %4 = load i8*, i8** %value, align 8, !dbg !246
  br label %cond.end, !dbg !243

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !243

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %4, %cond.true ], [ null, %cond.false ], !dbg !243
  ret i8* %cond, !dbg !247
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @LLI_Next(%struct.sListIterator* %iter) #0 !dbg !248 {
entry:
  %iter.addr = alloca %struct.sListIterator*, align 8
  store %struct.sListIterator* %iter, %struct.sListIterator** %iter.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.sListIterator** %iter.addr, metadata !249, metadata !DIExpression()), !dbg !250
  %0 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !251
  %link = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %0, i32 0, i32 0, !dbg !253
  %1 = load %struct.sListEntry*, %struct.sListEntry** %link, align 8, !dbg !253
  %tobool = icmp ne %struct.sListEntry* %1, null, !dbg !251
  br i1 %tobool, label %if.then, label %if.end, !dbg !254, !cf.info !39

if.then:                                          ; preds = %entry
  %2 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !255
  %link1 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %2, i32 0, i32 0, !dbg !256
  %3 = load %struct.sListEntry*, %struct.sListEntry** %link1, align 8, !dbg !256
  %next = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %3, i32 0, i32 1, !dbg !257
  %4 = load %struct.sListEntry*, %struct.sListEntry** %next, align 8, !dbg !257
  %5 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !258
  %link2 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %5, i32 0, i32 0, !dbg !259
  store %struct.sListEntry* %4, %struct.sListEntry** %link2, align 8, !dbg !260
  br label %if.end, !dbg !258

if.end:                                           ; preds = %if.then, %entry
  %6 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !261
  %link3 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %6, i32 0, i32 0, !dbg !262
  %7 = load %struct.sListEntry*, %struct.sListEntry** %link3, align 8, !dbg !262
  %cmp = icmp ne %struct.sListEntry* %7, null, !dbg !263
  %conv = zext i1 %cmp to i32, !dbg !263
  ret i32 %conv, !dbg !264
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @LLI_Prev(%struct.sListIterator* %iter) #0 !dbg !265 {
entry:
  %iter.addr = alloca %struct.sListIterator*, align 8
  store %struct.sListIterator* %iter, %struct.sListIterator** %iter.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.sListIterator** %iter.addr, metadata !266, metadata !DIExpression()), !dbg !267
  %0 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !268
  %link = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %0, i32 0, i32 0, !dbg !270
  %1 = load %struct.sListEntry*, %struct.sListEntry** %link, align 8, !dbg !270
  %tobool = icmp ne %struct.sListEntry* %1, null, !dbg !268
  br i1 %tobool, label %if.then, label %if.end, !dbg !271, !cf.info !39

if.then:                                          ; preds = %entry
  %2 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !272
  %link1 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %2, i32 0, i32 0, !dbg !273
  %3 = load %struct.sListEntry*, %struct.sListEntry** %link1, align 8, !dbg !273
  %prev = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %3, i32 0, i32 2, !dbg !274
  %4 = load %struct.sListEntry*, %struct.sListEntry** %prev, align 8, !dbg !274
  %5 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !275
  %link2 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %5, i32 0, i32 0, !dbg !276
  store %struct.sListEntry* %4, %struct.sListEntry** %link2, align 8, !dbg !277
  br label %if.end, !dbg !275

if.end:                                           ; preds = %if.then, %entry
  %6 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !278
  %link3 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %6, i32 0, i32 0, !dbg !279
  %7 = load %struct.sListEntry*, %struct.sListEntry** %link3, align 8, !dbg !279
  %cmp = icmp ne %struct.sListEntry* %7, null, !dbg !280
  %conv = zext i1 %cmp to i32, !dbg !280
  ret i32 %conv, !dbg !281
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !2 {
entry:
  %retval = alloca i32, align 4
  %ix = alloca i32, align 4
  %ll = alloca %struct.sListEntry*, align 8
  %iter = alloca %struct.sListIterator*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %ix, metadata !282, metadata !DIExpression()), !dbg !283
  call void @llvm.dbg.declare(metadata %struct.sListEntry** %ll, metadata !284, metadata !DIExpression()), !dbg !285
  %call = call %struct.sListEntry* @NewList(), !dbg !286
  store %struct.sListEntry* %call, %struct.sListEntry** %ll, align 8, !dbg !285
  call void @llvm.dbg.declare(metadata %struct.sListIterator** %iter, metadata !287, metadata !DIExpression()), !dbg !288
  store i32 0, i32* %ix, align 4, !dbg !289
  br label %for.cond, !dbg !291

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %ix, align 4, !dbg !292
  %cmp = icmp slt i32 %0, 6, !dbg !294
  br i1 %cmp, label %for.body, label %for.end, !dbg !295

for.body:                                         ; preds = %for.cond
  %1 = load %struct.sListEntry*, %struct.sListEntry** %ll, align 8, !dbg !296
  %2 = load i32, i32* %ix, align 4, !dbg !297
  %idxprom = sext i32 %2 to i64, !dbg !298
  %arrayidx = getelementptr inbounds [6 x i8*], [6 x i8*]* @main.contents, i64 0, i64 %idxprom, !dbg !298
  %3 = load i8*, i8** %arrayidx, align 8, !dbg !298
  %call1 = call i32 @LL_Append(%struct.sListEntry* %1, i8* %3), !dbg !299
  br label %for.inc, !dbg !299

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %ix, align 4, !dbg !300
  %inc = add nsw i32 %4, 1, !dbg !300
  store i32 %inc, i32* %ix, align 4, !dbg !300
  br label %for.cond, !dbg !301, !llvm.loop !302

for.end:                                          ; preds = %for.cond
  %5 = load %struct.sListEntry*, %struct.sListEntry** %ll, align 8, !dbg !304
  %call2 = call %struct.sListIterator* @LL_GetIterator(%struct.sListEntry* %5), !dbg !305
  store %struct.sListIterator* %call2, %struct.sListIterator** %iter, align 8, !dbg !306
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i64 0, i64 0)), !dbg !307
  br label %while.cond, !dbg !308

while.cond:                                       ; preds = %while.body, %for.end
  %6 = load %struct.sListIterator*, %struct.sListIterator** %iter, align 8, !dbg !309
  %call4 = call i32 @LLI_Next(%struct.sListIterator* %6), !dbg !310
  %tobool = icmp ne i32 %call4, 0, !dbg !308
  br i1 %tobool, label %while.body, label %while.end, !dbg !308

while.body:                                       ; preds = %while.cond
  %7 = load %struct.sListIterator*, %struct.sListIterator** %iter, align 8, !dbg !311
  %call5 = call i8* @LLI_Value(%struct.sListIterator* %7), !dbg !312
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i64 0, i64 0), i8* %call5), !dbg !313
  br label %while.cond, !dbg !308, !llvm.loop !314

while.end:                                        ; preds = %while.cond
  %8 = load %struct.sListIterator*, %struct.sListIterator** %iter, align 8, !dbg !316
  %9 = bitcast %struct.sListIterator* %8 to i8*, !dbg !316
  call void @free(i8* %9) #4, !dbg !316
  store %struct.sListIterator* null, %struct.sListIterator** %iter, align 8, !dbg !316
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i64 0, i64 0)), !dbg !318
  %10 = load %struct.sListEntry*, %struct.sListEntry** %ll, align 8, !dbg !319
  %call8 = call %struct.sListIterator* @LL_GetIterator(%struct.sListEntry* %10), !dbg !320
  store %struct.sListIterator* %call8, %struct.sListIterator** %iter, align 8, !dbg !321
  br label %while.cond9, !dbg !322

while.cond9:                                      ; preds = %while.body12, %while.end
  %11 = load %struct.sListIterator*, %struct.sListIterator** %iter, align 8, !dbg !323
  %call10 = call i32 @LLI_Prev(%struct.sListIterator* %11), !dbg !324
  %tobool11 = icmp ne i32 %call10, 0, !dbg !322
  br i1 %tobool11, label %while.body12, label %while.end15, !dbg !322

while.body12:                                     ; preds = %while.cond9
  %12 = load %struct.sListIterator*, %struct.sListIterator** %iter, align 8, !dbg !325
  %call13 = call i8* @LLI_Value(%struct.sListIterator* %12), !dbg !326
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i64 0, i64 0), i8* %call13), !dbg !327
  br label %while.cond9, !dbg !322, !llvm.loop !328

while.end15:                                      ; preds = %while.cond9
  %13 = load %struct.sListIterator*, %struct.sListIterator** %iter, align 8, !dbg !330
  %14 = bitcast %struct.sListIterator* %13 to i8*, !dbg !330
  call void @free(i8* %14) #4, !dbg !330
  store %struct.sListIterator* null, %struct.sListIterator** %iter, align 8, !dbg !330
  ret i32 0, !dbg !332
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

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
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, retainedTypes: !9, globals: !11, splitDebugInlining: false, nameTableKind: None)
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
!21 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
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
!32 = !DILocalVariable(name: "le", scope: !22, file: !3, line: 18, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "ListEntry", file: !3, line: 10, baseType: !26)
!34 = !DILocation(line: 18, column: 15, scope: !22)
!35 = !DILocation(line: 18, column: 20, scope: !22)
!36 = !DILocation(line: 19, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !22, file: !3, line: 19, column: 9)
!38 = !DILocation(line: 19, column: 9, scope: !22)
!39 = !{!"if"}
!40 = !DILocation(line: 20, column: 9, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !3, line: 19, column: 13)
!42 = !DILocation(line: 20, column: 13, scope: !41)
!43 = !DILocation(line: 20, column: 19, scope: !41)
!44 = !DILocation(line: 21, column: 20, scope: !41)
!45 = !DILocation(line: 21, column: 24, scope: !41)
!46 = !DILocation(line: 21, column: 29, scope: !41)
!47 = !DILocation(line: 21, column: 9, scope: !41)
!48 = !DILocation(line: 21, column: 13, scope: !41)
!49 = !DILocation(line: 21, column: 18, scope: !41)
!50 = !DILocation(line: 22, column: 5, scope: !41)
!51 = !DILocation(line: 23, column: 12, scope: !22)
!52 = !DILocation(line: 23, column: 5, scope: !22)
!53 = distinct !DISubprogram(name: "LL_Append", scope: !3, file: !3, line: 26, type: !54, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!54 = !DISubroutineType(types: !55)
!55 = !{!6, !25, !13}
!56 = !DILocalVariable(name: "ll", arg: 1, scope: !53, file: !3, line: 26, type: !25)
!57 = !DILocation(line: 26, column: 26, scope: !53)
!58 = !DILocalVariable(name: "newVal", arg: 2, scope: !53, file: !3, line: 26, type: !13)
!59 = !DILocation(line: 26, column: 42, scope: !53)
!60 = !DILocalVariable(name: "le", scope: !53, file: !3, line: 28, type: !33)
!61 = !DILocation(line: 28, column: 15, scope: !53)
!62 = !DILocation(line: 28, column: 20, scope: !53)
!63 = !DILocation(line: 29, column: 9, scope: !64)
!64 = distinct !DILexicalBlock(scope: !53, file: !3, line: 29, column: 9)
!65 = !DILocation(line: 29, column: 9, scope: !53)
!66 = !DILocation(line: 30, column: 28, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !3, line: 29, column: 13)
!68 = !DILocation(line: 30, column: 21, scope: !67)
!69 = !DILocation(line: 30, column: 9, scope: !67)
!70 = !DILocation(line: 30, column: 13, scope: !67)
!71 = !DILocation(line: 30, column: 19, scope: !67)
!72 = !DILocation(line: 31, column: 20, scope: !67)
!73 = !DILocation(line: 31, column: 24, scope: !67)
!74 = !DILocation(line: 31, column: 9, scope: !67)
!75 = !DILocation(line: 31, column: 13, scope: !67)
!76 = !DILocation(line: 31, column: 18, scope: !67)
!77 = !DILocation(line: 32, column: 9, scope: !67)
!78 = !DILocation(line: 32, column: 13, scope: !67)
!79 = !DILocation(line: 32, column: 18, scope: !67)
!80 = !DILocation(line: 33, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !67, file: !3, line: 33, column: 13)
!82 = !DILocation(line: 33, column: 17, scope: !81)
!83 = !DILocation(line: 33, column: 13, scope: !67)
!84 = !DILocation(line: 34, column: 30, scope: !81)
!85 = !DILocation(line: 34, column: 13, scope: !81)
!86 = !DILocation(line: 34, column: 17, scope: !81)
!87 = !DILocation(line: 34, column: 23, scope: !81)
!88 = !DILocation(line: 34, column: 28, scope: !81)
!89 = !DILocation(line: 36, column: 24, scope: !81)
!90 = !DILocation(line: 36, column: 13, scope: !81)
!91 = !DILocation(line: 36, column: 17, scope: !81)
!92 = !DILocation(line: 36, column: 22, scope: !81)
!93 = !DILocation(line: 37, column: 20, scope: !67)
!94 = !DILocation(line: 37, column: 9, scope: !67)
!95 = !DILocation(line: 37, column: 13, scope: !67)
!96 = !DILocation(line: 37, column: 18, scope: !67)
!97 = !DILocation(line: 38, column: 5, scope: !67)
!98 = !DILocation(line: 39, column: 13, scope: !53)
!99 = !DILocation(line: 39, column: 15, scope: !53)
!100 = !DILocation(line: 39, column: 5, scope: !53)
!101 = distinct !DISubprogram(name: "LI_Insert", scope: !3, file: !3, line: 42, type: !102, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!102 = !DISubroutineType(types: !103)
!103 = !{!6, !104, !13}
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "LIterator", file: !3, line: 15, baseType: !105)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sListIterator", file: !3, line: 12, size: 128, elements: !107)
!107 = !{!108, !109}
!108 = !DIDerivedType(tag: DW_TAG_member, name: "link", scope: !106, file: !3, line: 13, baseType: !33, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "head", scope: !106, file: !3, line: 14, baseType: !25, size: 64, offset: 64)
!110 = !DILocalVariable(name: "iter", arg: 1, scope: !101, file: !3, line: 42, type: !104)
!111 = !DILocation(line: 42, column: 25, scope: !101)
!112 = !DILocalVariable(name: "newVal", arg: 2, scope: !101, file: !3, line: 42, type: !13)
!113 = !DILocation(line: 42, column: 43, scope: !101)
!114 = !DILocalVariable(name: "crnt", scope: !101, file: !3, line: 44, type: !33)
!115 = !DILocation(line: 44, column: 15, scope: !101)
!116 = !DILocation(line: 44, column: 22, scope: !101)
!117 = !DILocation(line: 44, column: 28, scope: !101)
!118 = !DILocalVariable(name: "le", scope: !101, file: !3, line: 45, type: !33)
!119 = !DILocation(line: 45, column: 15, scope: !101)
!120 = !DILocation(line: 45, column: 20, scope: !101)
!121 = !DILocation(line: 46, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !101, file: !3, line: 46, column: 9)
!123 = !DILocation(line: 46, column: 9, scope: !101)
!124 = !DILocation(line: 47, column: 28, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !3, line: 46, column: 13)
!126 = !DILocation(line: 47, column: 21, scope: !125)
!127 = !DILocation(line: 47, column: 9, scope: !125)
!128 = !DILocation(line: 47, column: 13, scope: !125)
!129 = !DILocation(line: 47, column: 19, scope: !125)
!130 = !DILocation(line: 48, column: 14, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !3, line: 48, column: 14)
!132 = !DILocation(line: 48, column: 22, scope: !131)
!133 = !DILocation(line: 48, column: 28, scope: !131)
!134 = !DILocation(line: 48, column: 19, scope: !131)
!135 = !DILocation(line: 48, column: 14, scope: !125)
!136 = !DILocation(line: 49, column: 13, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !3, line: 48, column: 34)
!138 = !DILocation(line: 49, column: 17, scope: !137)
!139 = !DILocation(line: 49, column: 22, scope: !137)
!140 = !DILocation(line: 50, column: 24, scope: !137)
!141 = !DILocation(line: 50, column: 30, scope: !137)
!142 = !DILocation(line: 50, column: 13, scope: !137)
!143 = !DILocation(line: 50, column: 17, scope: !137)
!144 = !DILocation(line: 50, column: 22, scope: !137)
!145 = !DILocation(line: 51, column: 26, scope: !137)
!146 = !DILocation(line: 51, column: 13, scope: !137)
!147 = !DILocation(line: 51, column: 19, scope: !137)
!148 = !DILocation(line: 51, column: 24, scope: !137)
!149 = !DILocation(line: 52, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !137, file: !3, line: 52, column: 17)
!151 = !DILocation(line: 52, column: 21, scope: !150)
!152 = !DILocation(line: 52, column: 17, scope: !137)
!153 = !DILocation(line: 53, column: 34, scope: !150)
!154 = !DILocation(line: 53, column: 17, scope: !150)
!155 = !DILocation(line: 53, column: 21, scope: !150)
!156 = !DILocation(line: 53, column: 27, scope: !150)
!157 = !DILocation(line: 53, column: 32, scope: !150)
!158 = !DILocation(line: 55, column: 30, scope: !150)
!159 = !DILocation(line: 55, column: 17, scope: !150)
!160 = !DILocation(line: 55, column: 23, scope: !150)
!161 = !DILocation(line: 55, column: 28, scope: !150)
!162 = !DILocation(line: 56, column: 9, scope: !137)
!163 = !DILocation(line: 58, column: 26, scope: !164)
!164 = distinct !DILexicalBlock(scope: !131, file: !3, line: 57, column: 14)
!165 = !DILocation(line: 58, column: 31, scope: !164)
!166 = !DILocation(line: 58, column: 24, scope: !164)
!167 = !DILocation(line: 58, column: 41, scope: !164)
!168 = !DILocation(line: 58, column: 47, scope: !164)
!169 = !DILocation(line: 58, column: 53, scope: !164)
!170 = !DILocation(line: 58, column: 60, scope: !164)
!171 = !DILocation(line: 58, column: 66, scope: !164)
!172 = !DILocation(line: 58, column: 13, scope: !164)
!173 = !DILocation(line: 58, column: 17, scope: !164)
!174 = !DILocation(line: 58, column: 22, scope: !164)
!175 = !DILocation(line: 59, column: 24, scope: !164)
!176 = !DILocation(line: 59, column: 13, scope: !164)
!177 = !DILocation(line: 59, column: 17, scope: !164)
!178 = !DILocation(line: 59, column: 22, scope: !164)
!179 = !DILocation(line: 60, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !164, file: !3, line: 60, column: 17)
!181 = !DILocation(line: 60, column: 21, scope: !180)
!182 = !DILocation(line: 60, column: 17, scope: !164)
!183 = !DILocation(line: 61, column: 34, scope: !180)
!184 = !DILocation(line: 61, column: 17, scope: !180)
!185 = !DILocation(line: 61, column: 21, scope: !180)
!186 = !DILocation(line: 61, column: 27, scope: !180)
!187 = !DILocation(line: 61, column: 32, scope: !180)
!188 = !DILocation(line: 63, column: 36, scope: !180)
!189 = !DILocation(line: 63, column: 17, scope: !180)
!190 = !DILocation(line: 63, column: 23, scope: !180)
!191 = !DILocation(line: 63, column: 29, scope: !180)
!192 = !DILocation(line: 63, column: 34, scope: !180)
!193 = !DILocation(line: 64, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !164, file: !3, line: 64, column: 17)
!195 = !DILocation(line: 64, column: 17, scope: !164)
!196 = !DILocation(line: 65, column: 30, scope: !194)
!197 = !DILocation(line: 65, column: 17, scope: !194)
!198 = !DILocation(line: 65, column: 23, scope: !194)
!199 = !DILocation(line: 65, column: 28, scope: !194)
!200 = !DILocation(line: 67, column: 36, scope: !194)
!201 = !DILocation(line: 67, column: 17, scope: !194)
!202 = !DILocation(line: 67, column: 23, scope: !194)
!203 = !DILocation(line: 67, column: 29, scope: !194)
!204 = !DILocation(line: 67, column: 34, scope: !194)
!205 = !DILocation(line: 69, column: 5, scope: !125)
!206 = !DILocation(line: 70, column: 13, scope: !101)
!207 = !DILocation(line: 70, column: 15, scope: !101)
!208 = !DILocation(line: 70, column: 5, scope: !101)
!209 = distinct !DISubprogram(name: "LL_GetIterator", scope: !3, file: !3, line: 73, type: !210, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!210 = !DISubroutineType(types: !211)
!211 = !{!104, !25}
!212 = !DILocalVariable(name: "ll", arg: 1, scope: !209, file: !3, line: 73, type: !25)
!213 = !DILocation(line: 73, column: 37, scope: !209)
!214 = !DILocalVariable(name: "liter", scope: !209, file: !3, line: 75, type: !104)
!215 = !DILocation(line: 75, column: 15, scope: !209)
!216 = !DILocation(line: 75, column: 23, scope: !209)
!217 = !DILocation(line: 76, column: 19, scope: !209)
!218 = !DILocation(line: 76, column: 5, scope: !209)
!219 = !DILocation(line: 76, column: 12, scope: !209)
!220 = !DILocation(line: 76, column: 17, scope: !209)
!221 = !DILocation(line: 77, column: 19, scope: !209)
!222 = !DILocation(line: 77, column: 5, scope: !209)
!223 = !DILocation(line: 77, column: 12, scope: !209)
!224 = !DILocation(line: 77, column: 17, scope: !209)
!225 = !DILocation(line: 78, column: 12, scope: !209)
!226 = !DILocation(line: 78, column: 5, scope: !209)
!227 = distinct !DISubprogram(name: "LLI_AtEnd", scope: !3, file: !3, line: 85, type: !228, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!228 = !DISubroutineType(types: !229)
!229 = !{!6, !104}
!230 = !DILocalVariable(name: "iter", arg: 1, scope: !227, file: !3, line: 85, type: !104)
!231 = !DILocation(line: 85, column: 25, scope: !227)
!232 = !DILocation(line: 87, column: 12, scope: !227)
!233 = !DILocation(line: 87, column: 18, scope: !227)
!234 = !DILocation(line: 87, column: 23, scope: !227)
!235 = !DILocation(line: 87, column: 5, scope: !227)
!236 = distinct !DISubprogram(name: "LLI_Value", scope: !3, file: !3, line: 89, type: !237, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!237 = !DISubroutineType(types: !238)
!238 = !{!13, !104}
!239 = !DILocalVariable(name: "iter", arg: 1, scope: !236, file: !3, line: 89, type: !104)
!240 = !DILocation(line: 89, column: 33, scope: !236)
!241 = !DILocation(line: 91, column: 13, scope: !236)
!242 = !DILocation(line: 91, column: 19, scope: !236)
!243 = !DILocation(line: 91, column: 12, scope: !236)
!244 = !DILocation(line: 91, column: 26, scope: !236)
!245 = !DILocation(line: 91, column: 32, scope: !236)
!246 = !DILocation(line: 91, column: 38, scope: !236)
!247 = !DILocation(line: 91, column: 5, scope: !236)
!248 = distinct !DISubprogram(name: "LLI_Next", scope: !3, file: !3, line: 93, type: !228, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!249 = !DILocalVariable(name: "iter", arg: 1, scope: !248, file: !3, line: 93, type: !104)
!250 = !DILocation(line: 93, column: 24, scope: !248)
!251 = !DILocation(line: 95, column: 9, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !3, line: 95, column: 9)
!253 = !DILocation(line: 95, column: 15, scope: !252)
!254 = !DILocation(line: 95, column: 9, scope: !248)
!255 = !DILocation(line: 95, column: 34, scope: !252)
!256 = !DILocation(line: 95, column: 40, scope: !252)
!257 = !DILocation(line: 95, column: 46, scope: !252)
!258 = !DILocation(line: 95, column: 21, scope: !252)
!259 = !DILocation(line: 95, column: 27, scope: !252)
!260 = !DILocation(line: 95, column: 32, scope: !252)
!261 = !DILocation(line: 96, column: 12, scope: !248)
!262 = !DILocation(line: 96, column: 18, scope: !248)
!263 = !DILocation(line: 96, column: 23, scope: !248)
!264 = !DILocation(line: 96, column: 5, scope: !248)
!265 = distinct !DISubprogram(name: "LLI_Prev", scope: !3, file: !3, line: 98, type: !228, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!266 = !DILocalVariable(name: "iter", arg: 1, scope: !265, file: !3, line: 98, type: !104)
!267 = !DILocation(line: 98, column: 24, scope: !265)
!268 = !DILocation(line: 100, column: 9, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !3, line: 100, column: 9)
!270 = !DILocation(line: 100, column: 15, scope: !269)
!271 = !DILocation(line: 100, column: 9, scope: !265)
!272 = !DILocation(line: 100, column: 34, scope: !269)
!273 = !DILocation(line: 100, column: 40, scope: !269)
!274 = !DILocation(line: 100, column: 46, scope: !269)
!275 = !DILocation(line: 100, column: 21, scope: !269)
!276 = !DILocation(line: 100, column: 27, scope: !269)
!277 = !DILocation(line: 100, column: 32, scope: !269)
!278 = !DILocation(line: 101, column: 12, scope: !265)
!279 = !DILocation(line: 101, column: 18, scope: !265)
!280 = !DILocation(line: 101, column: 23, scope: !265)
!281 = !DILocation(line: 101, column: 5, scope: !265)
!282 = !DILocalVariable(name: "ix", scope: !2, file: !3, line: 108, type: !6)
!283 = !DILocation(line: 108, column: 9, scope: !2)
!284 = !DILocalVariable(name: "ll", scope: !2, file: !3, line: 109, type: !25)
!285 = !DILocation(line: 109, column: 16, scope: !2)
!286 = !DILocation(line: 109, column: 21, scope: !2)
!287 = !DILocalVariable(name: "iter", scope: !2, file: !3, line: 110, type: !104)
!288 = !DILocation(line: 110, column: 15, scope: !2)
!289 = !DILocation(line: 112, column: 12, scope: !290)
!290 = distinct !DILexicalBlock(scope: !2, file: !3, line: 112, column: 5)
!291 = !DILocation(line: 112, column: 10, scope: !290)
!292 = !DILocation(line: 112, column: 16, scope: !293)
!293 = distinct !DILexicalBlock(scope: !290, file: !3, line: 112, column: 5)
!294 = !DILocation(line: 112, column: 18, scope: !293)
!295 = !DILocation(line: 112, column: 5, scope: !290)
!296 = !DILocation(line: 113, column: 19, scope: !293)
!297 = !DILocation(line: 113, column: 32, scope: !293)
!298 = !DILocation(line: 113, column: 23, scope: !293)
!299 = !DILocation(line: 113, column: 9, scope: !293)
!300 = !DILocation(line: 112, column: 24, scope: !293)
!301 = !DILocation(line: 112, column: 5, scope: !293)
!302 = distinct !{!302, !295, !303}
!303 = !DILocation(line: 113, column: 35, scope: !290)
!304 = !DILocation(line: 115, column: 27, scope: !2)
!305 = !DILocation(line: 115, column: 12, scope: !2)
!306 = !DILocation(line: 115, column: 10, scope: !2)
!307 = !DILocation(line: 116, column: 5, scope: !2)
!308 = !DILocation(line: 117, column: 5, scope: !2)
!309 = !DILocation(line: 117, column: 20, scope: !2)
!310 = !DILocation(line: 117, column: 11, scope: !2)
!311 = !DILocation(line: 118, column: 40, scope: !2)
!312 = !DILocation(line: 118, column: 30, scope: !2)
!313 = !DILocation(line: 118, column: 9, scope: !2)
!314 = distinct !{!314, !308, !315}
!315 = !DILocation(line: 118, column: 45, scope: !2)
!316 = !DILocation(line: 119, column: 5, scope: !317)
!317 = distinct !DILexicalBlock(scope: !2, file: !3, line: 119, column: 5)
!318 = !DILocation(line: 121, column: 5, scope: !2)
!319 = !DILocation(line: 122, column: 27, scope: !2)
!320 = !DILocation(line: 122, column: 12, scope: !2)
!321 = !DILocation(line: 122, column: 10, scope: !2)
!322 = !DILocation(line: 123, column: 5, scope: !2)
!323 = !DILocation(line: 123, column: 20, scope: !2)
!324 = !DILocation(line: 123, column: 11, scope: !2)
!325 = !DILocation(line: 124, column: 40, scope: !2)
!326 = !DILocation(line: 124, column: 30, scope: !2)
!327 = !DILocation(line: 124, column: 9, scope: !2)
!328 = distinct !{!328, !322, !329}
!329 = !DILocation(line: 124, column: 45, scope: !2)
!330 = !DILocation(line: 125, column: 5, scope: !331)
!331 = distinct !DILexicalBlock(scope: !2, file: !3, line: 125, column: 5)
!332 = !DILocation(line: 127, column: 5, scope: !2)
