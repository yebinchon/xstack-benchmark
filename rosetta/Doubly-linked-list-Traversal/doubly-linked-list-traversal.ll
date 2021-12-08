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
  %le = alloca %struct.sListEntry*, align 8
  call void @llvm.dbg.declare(metadata %struct.sListEntry** %le, metadata !32, metadata !DIExpression()), !dbg !34
  %call = call noalias i8* @malloc(i64 24) #4, !dbg !35
  %0 = bitcast i8* %call to %struct.sListEntry*, !dbg !35
  store %struct.sListEntry* %0, %struct.sListEntry** %le, align 8, !dbg !34
  %1 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !36
  %tobool = icmp ne %struct.sListEntry* %1, null, !dbg !36
  br i1 %tobool, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %2 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !39
  %value = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %2, i32 0, i32 0, !dbg !41
  store i8* null, i8** %value, align 8, !dbg !42
  %3 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !43
  %prev = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %3, i32 0, i32 2, !dbg !44
  store %struct.sListEntry* null, %struct.sListEntry** %prev, align 8, !dbg !45
  %4 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !46
  %next = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %4, i32 0, i32 1, !dbg !47
  store %struct.sListEntry* null, %struct.sListEntry** %next, align 8, !dbg !48
  br label %if.end, !dbg !49

if.end:                                           ; preds = %if.then, %entry
  %5 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !50
  ret %struct.sListEntry* %5, !dbg !51
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @LL_Append(%struct.sListEntry* %ll, i8* %newVal) #0 !dbg !52 {
entry:
  %ll.addr = alloca %struct.sListEntry*, align 8
  %newVal.addr = alloca i8*, align 8
  %le = alloca %struct.sListEntry*, align 8
  store %struct.sListEntry* %ll, %struct.sListEntry** %ll.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.sListEntry** %ll.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8* %newVal, i8** %newVal.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %newVal.addr, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata %struct.sListEntry** %le, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call noalias i8* @malloc(i64 24) #4, !dbg !61
  %0 = bitcast i8* %call to %struct.sListEntry*, !dbg !61
  store %struct.sListEntry* %0, %struct.sListEntry** %le, align 8, !dbg !60
  %1 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !62
  %tobool = icmp ne %struct.sListEntry* %1, null, !dbg !62
  br i1 %tobool, label %if.then, label %if.end10, !dbg !64

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %newVal.addr, align 8, !dbg !65
  %call1 = call noalias i8* @strdup(i8* %2) #4, !dbg !67
  %3 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !68
  %value = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %3, i32 0, i32 0, !dbg !69
  store i8* %call1, i8** %value, align 8, !dbg !70
  %4 = load %struct.sListEntry*, %struct.sListEntry** %ll.addr, align 8, !dbg !71
  %prev = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %4, i32 0, i32 2, !dbg !72
  %5 = load %struct.sListEntry*, %struct.sListEntry** %prev, align 8, !dbg !72
  %6 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !73
  %prev2 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %6, i32 0, i32 2, !dbg !74
  store %struct.sListEntry* %5, %struct.sListEntry** %prev2, align 8, !dbg !75
  %7 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !76
  %next = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %7, i32 0, i32 1, !dbg !77
  store %struct.sListEntry* null, %struct.sListEntry** %next, align 8, !dbg !78
  %8 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !79
  %prev3 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %8, i32 0, i32 2, !dbg !81
  %9 = load %struct.sListEntry*, %struct.sListEntry** %prev3, align 8, !dbg !81
  %tobool4 = icmp ne %struct.sListEntry* %9, null, !dbg !79
  br i1 %tobool4, label %if.then5, label %if.else, !dbg !82

if.then5:                                         ; preds = %if.then
  %10 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !83
  %11 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !84
  %prev6 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %11, i32 0, i32 2, !dbg !85
  %12 = load %struct.sListEntry*, %struct.sListEntry** %prev6, align 8, !dbg !85
  %next7 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %12, i32 0, i32 1, !dbg !86
  store %struct.sListEntry* %10, %struct.sListEntry** %next7, align 8, !dbg !87
  br label %if.end, !dbg !84

if.else:                                          ; preds = %if.then
  %13 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !88
  %14 = load %struct.sListEntry*, %struct.sListEntry** %ll.addr, align 8, !dbg !89
  %next8 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %14, i32 0, i32 1, !dbg !90
  store %struct.sListEntry* %13, %struct.sListEntry** %next8, align 8, !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then5
  %15 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !92
  %16 = load %struct.sListEntry*, %struct.sListEntry** %ll.addr, align 8, !dbg !93
  %prev9 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %16, i32 0, i32 2, !dbg !94
  store %struct.sListEntry* %15, %struct.sListEntry** %prev9, align 8, !dbg !95
  br label %if.end10, !dbg !96

if.end10:                                         ; preds = %if.end, %entry
  %17 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !97
  %cmp = icmp ne %struct.sListEntry* %17, null, !dbg !98
  %conv = zext i1 %cmp to i32, !dbg !98
  ret i32 %conv, !dbg !99
}

; Function Attrs: nounwind
declare dso_local noalias i8* @strdup(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @LI_Insert(%struct.sListIterator* %iter, i8* %newVal) #0 !dbg !100 {
entry:
  %iter.addr = alloca %struct.sListIterator*, align 8
  %newVal.addr = alloca i8*, align 8
  %crnt = alloca %struct.sListEntry*, align 8
  %le = alloca %struct.sListEntry*, align 8
  store %struct.sListIterator* %iter, %struct.sListIterator** %iter.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.sListIterator** %iter.addr, metadata !109, metadata !DIExpression()), !dbg !110
  store i8* %newVal, i8** %newVal.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %newVal.addr, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata %struct.sListEntry** %crnt, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !115
  %link = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %0, i32 0, i32 0, !dbg !116
  %1 = load %struct.sListEntry*, %struct.sListEntry** %link, align 8, !dbg !116
  store %struct.sListEntry* %1, %struct.sListEntry** %crnt, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata %struct.sListEntry** %le, metadata !117, metadata !DIExpression()), !dbg !118
  %call = call noalias i8* @malloc(i64 24) #4, !dbg !119
  %2 = bitcast i8* %call to %struct.sListEntry*, !dbg !119
  store %struct.sListEntry* %2, %struct.sListEntry** %le, align 8, !dbg !118
  %3 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !120
  %tobool = icmp ne %struct.sListEntry* %3, null, !dbg !120
  br i1 %tobool, label %if.then, label %if.end35, !dbg !122

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %newVal.addr, align 8, !dbg !123
  %call1 = call noalias i8* @strdup(i8* %4) #4, !dbg !125
  %5 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !126
  %value = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %5, i32 0, i32 0, !dbg !127
  store i8* %call1, i8** %value, align 8, !dbg !128
  %6 = load %struct.sListEntry*, %struct.sListEntry** %crnt, align 8, !dbg !129
  %7 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !131
  %head = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %7, i32 0, i32 1, !dbg !132
  %8 = load %struct.sListEntry*, %struct.sListEntry** %head, align 8, !dbg !132
  %cmp = icmp eq %struct.sListEntry* %6, %8, !dbg !133
  br i1 %cmp, label %if.then2, label %if.else11, !dbg !134

if.then2:                                         ; preds = %if.then
  %9 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !135
  %prev = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %9, i32 0, i32 2, !dbg !137
  store %struct.sListEntry* null, %struct.sListEntry** %prev, align 8, !dbg !138
  %10 = load %struct.sListEntry*, %struct.sListEntry** %crnt, align 8, !dbg !139
  %next = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %10, i32 0, i32 1, !dbg !140
  %11 = load %struct.sListEntry*, %struct.sListEntry** %next, align 8, !dbg !140
  %12 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !141
  %next3 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %12, i32 0, i32 1, !dbg !142
  store %struct.sListEntry* %11, %struct.sListEntry** %next3, align 8, !dbg !143
  %13 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !144
  %14 = load %struct.sListEntry*, %struct.sListEntry** %crnt, align 8, !dbg !145
  %next4 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %14, i32 0, i32 1, !dbg !146
  store %struct.sListEntry* %13, %struct.sListEntry** %next4, align 8, !dbg !147
  %15 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !148
  %next5 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %15, i32 0, i32 1, !dbg !150
  %16 = load %struct.sListEntry*, %struct.sListEntry** %next5, align 8, !dbg !150
  %tobool6 = icmp ne %struct.sListEntry* %16, null, !dbg !148
  br i1 %tobool6, label %if.then7, label %if.else, !dbg !151

if.then7:                                         ; preds = %if.then2
  %17 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !152
  %18 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !153
  %next8 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %18, i32 0, i32 1, !dbg !154
  %19 = load %struct.sListEntry*, %struct.sListEntry** %next8, align 8, !dbg !154
  %prev9 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %19, i32 0, i32 2, !dbg !155
  store %struct.sListEntry* %17, %struct.sListEntry** %prev9, align 8, !dbg !156
  br label %if.end, !dbg !153

if.else:                                          ; preds = %if.then2
  %20 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !157
  %21 = load %struct.sListEntry*, %struct.sListEntry** %crnt, align 8, !dbg !158
  %prev10 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %21, i32 0, i32 2, !dbg !159
  store %struct.sListEntry* %20, %struct.sListEntry** %prev10, align 8, !dbg !160
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then7
  br label %if.end34, !dbg !161

if.else11:                                        ; preds = %if.then
  %22 = load %struct.sListEntry*, %struct.sListEntry** %crnt, align 8, !dbg !162
  %cmp12 = icmp eq %struct.sListEntry* %22, null, !dbg !164
  br i1 %cmp12, label %cond.true, label %cond.false, !dbg !165

cond.true:                                        ; preds = %if.else11
  %23 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !166
  %head13 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %23, i32 0, i32 1, !dbg !167
  %24 = load %struct.sListEntry*, %struct.sListEntry** %head13, align 8, !dbg !167
  %prev14 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %24, i32 0, i32 2, !dbg !168
  %25 = load %struct.sListEntry*, %struct.sListEntry** %prev14, align 8, !dbg !168
  br label %cond.end, !dbg !165

cond.false:                                       ; preds = %if.else11
  %26 = load %struct.sListEntry*, %struct.sListEntry** %crnt, align 8, !dbg !169
  %prev15 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %26, i32 0, i32 2, !dbg !170
  %27 = load %struct.sListEntry*, %struct.sListEntry** %prev15, align 8, !dbg !170
  br label %cond.end, !dbg !165

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.sListEntry* [ %25, %cond.true ], [ %27, %cond.false ], !dbg !165
  %28 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !171
  %prev16 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %28, i32 0, i32 2, !dbg !172
  store %struct.sListEntry* %cond, %struct.sListEntry** %prev16, align 8, !dbg !173
  %29 = load %struct.sListEntry*, %struct.sListEntry** %crnt, align 8, !dbg !174
  %30 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !175
  %next17 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %30, i32 0, i32 1, !dbg !176
  store %struct.sListEntry* %29, %struct.sListEntry** %next17, align 8, !dbg !177
  %31 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !178
  %prev18 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %31, i32 0, i32 2, !dbg !180
  %32 = load %struct.sListEntry*, %struct.sListEntry** %prev18, align 8, !dbg !180
  %tobool19 = icmp ne %struct.sListEntry* %32, null, !dbg !178
  br i1 %tobool19, label %if.then20, label %if.else23, !dbg !181

if.then20:                                        ; preds = %cond.end
  %33 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !182
  %34 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !183
  %prev21 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %34, i32 0, i32 2, !dbg !184
  %35 = load %struct.sListEntry*, %struct.sListEntry** %prev21, align 8, !dbg !184
  %next22 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %35, i32 0, i32 1, !dbg !185
  store %struct.sListEntry* %33, %struct.sListEntry** %next22, align 8, !dbg !186
  br label %if.end26, !dbg !183

if.else23:                                        ; preds = %cond.end
  %36 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !187
  %37 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !188
  %head24 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %37, i32 0, i32 1, !dbg !189
  %38 = load %struct.sListEntry*, %struct.sListEntry** %head24, align 8, !dbg !189
  %next25 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %38, i32 0, i32 1, !dbg !190
  store %struct.sListEntry* %36, %struct.sListEntry** %next25, align 8, !dbg !191
  br label %if.end26

if.end26:                                         ; preds = %if.else23, %if.then20
  %39 = load %struct.sListEntry*, %struct.sListEntry** %crnt, align 8, !dbg !192
  %tobool27 = icmp ne %struct.sListEntry* %39, null, !dbg !192
  br i1 %tobool27, label %if.then28, label %if.else30, !dbg !194

if.then28:                                        ; preds = %if.end26
  %40 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !195
  %41 = load %struct.sListEntry*, %struct.sListEntry** %crnt, align 8, !dbg !196
  %prev29 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %41, i32 0, i32 2, !dbg !197
  store %struct.sListEntry* %40, %struct.sListEntry** %prev29, align 8, !dbg !198
  br label %if.end33, !dbg !196

if.else30:                                        ; preds = %if.end26
  %42 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !199
  %43 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !200
  %head31 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %43, i32 0, i32 1, !dbg !201
  %44 = load %struct.sListEntry*, %struct.sListEntry** %head31, align 8, !dbg !201
  %prev32 = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %44, i32 0, i32 2, !dbg !202
  store %struct.sListEntry* %42, %struct.sListEntry** %prev32, align 8, !dbg !203
  br label %if.end33

if.end33:                                         ; preds = %if.else30, %if.then28
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %if.end
  br label %if.end35, !dbg !204

if.end35:                                         ; preds = %if.end34, %entry
  %45 = load %struct.sListEntry*, %struct.sListEntry** %le, align 8, !dbg !205
  %cmp36 = icmp ne %struct.sListEntry* %45, null, !dbg !206
  %conv = zext i1 %cmp36 to i32, !dbg !206
  ret i32 %conv, !dbg !207
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.sListIterator* @LL_GetIterator(%struct.sListEntry* %ll) #0 !dbg !208 {
entry:
  %ll.addr = alloca %struct.sListEntry*, align 8
  %liter = alloca %struct.sListIterator*, align 8
  store %struct.sListEntry* %ll, %struct.sListEntry** %ll.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.sListEntry** %ll.addr, metadata !211, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.declare(metadata %struct.sListIterator** %liter, metadata !213, metadata !DIExpression()), !dbg !214
  %call = call noalias i8* @malloc(i64 16) #4, !dbg !215
  %0 = bitcast i8* %call to %struct.sListIterator*, !dbg !215
  store %struct.sListIterator* %0, %struct.sListIterator** %liter, align 8, !dbg !214
  %1 = load %struct.sListEntry*, %struct.sListEntry** %ll.addr, align 8, !dbg !216
  %2 = load %struct.sListIterator*, %struct.sListIterator** %liter, align 8, !dbg !217
  %head = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %2, i32 0, i32 1, !dbg !218
  store %struct.sListEntry* %1, %struct.sListEntry** %head, align 8, !dbg !219
  %3 = load %struct.sListEntry*, %struct.sListEntry** %ll.addr, align 8, !dbg !220
  %4 = load %struct.sListIterator*, %struct.sListIterator** %liter, align 8, !dbg !221
  %link = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %4, i32 0, i32 0, !dbg !222
  store %struct.sListEntry* %3, %struct.sListEntry** %link, align 8, !dbg !223
  %5 = load %struct.sListIterator*, %struct.sListIterator** %liter, align 8, !dbg !224
  ret %struct.sListIterator* %5, !dbg !225
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @LLI_AtEnd(%struct.sListIterator* %iter) #0 !dbg !226 {
entry:
  %iter.addr = alloca %struct.sListIterator*, align 8
  store %struct.sListIterator* %iter, %struct.sListIterator** %iter.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.sListIterator** %iter.addr, metadata !229, metadata !DIExpression()), !dbg !230
  %0 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !231
  %link = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %0, i32 0, i32 0, !dbg !232
  %1 = load %struct.sListEntry*, %struct.sListEntry** %link, align 8, !dbg !232
  %cmp = icmp eq %struct.sListEntry* %1, null, !dbg !233
  %conv = zext i1 %cmp to i32, !dbg !233
  ret i32 %conv, !dbg !234
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @LLI_Value(%struct.sListIterator* %iter) #0 !dbg !235 {
entry:
  %iter.addr = alloca %struct.sListIterator*, align 8
  store %struct.sListIterator* %iter, %struct.sListIterator** %iter.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.sListIterator** %iter.addr, metadata !238, metadata !DIExpression()), !dbg !239
  %0 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !240
  %link = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %0, i32 0, i32 0, !dbg !241
  %1 = load %struct.sListEntry*, %struct.sListEntry** %link, align 8, !dbg !241
  %tobool = icmp ne %struct.sListEntry* %1, null, !dbg !242
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !242

cond.true:                                        ; preds = %entry
  %2 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !243
  %link1 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %2, i32 0, i32 0, !dbg !244
  %3 = load %struct.sListEntry*, %struct.sListEntry** %link1, align 8, !dbg !244
  %value = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %3, i32 0, i32 0, !dbg !245
  %4 = load i8*, i8** %value, align 8, !dbg !245
  br label %cond.end, !dbg !242

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !242

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %4, %cond.true ], [ null, %cond.false ], !dbg !242
  ret i8* %cond, !dbg !246
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @LLI_Next(%struct.sListIterator* %iter) #0 !dbg !247 {
entry:
  %iter.addr = alloca %struct.sListIterator*, align 8
  store %struct.sListIterator* %iter, %struct.sListIterator** %iter.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.sListIterator** %iter.addr, metadata !248, metadata !DIExpression()), !dbg !249
  %0 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !250
  %link = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %0, i32 0, i32 0, !dbg !252
  %1 = load %struct.sListEntry*, %struct.sListEntry** %link, align 8, !dbg !252
  %tobool = icmp ne %struct.sListEntry* %1, null, !dbg !250
  br i1 %tobool, label %if.then, label %if.end, !dbg !253

if.then:                                          ; preds = %entry
  %2 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !254
  %link1 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %2, i32 0, i32 0, !dbg !255
  %3 = load %struct.sListEntry*, %struct.sListEntry** %link1, align 8, !dbg !255
  %next = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %3, i32 0, i32 1, !dbg !256
  %4 = load %struct.sListEntry*, %struct.sListEntry** %next, align 8, !dbg !256
  %5 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !257
  %link2 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %5, i32 0, i32 0, !dbg !258
  store %struct.sListEntry* %4, %struct.sListEntry** %link2, align 8, !dbg !259
  br label %if.end, !dbg !257

if.end:                                           ; preds = %if.then, %entry
  %6 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !260
  %link3 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %6, i32 0, i32 0, !dbg !261
  %7 = load %struct.sListEntry*, %struct.sListEntry** %link3, align 8, !dbg !261
  %cmp = icmp ne %struct.sListEntry* %7, null, !dbg !262
  %conv = zext i1 %cmp to i32, !dbg !262
  ret i32 %conv, !dbg !263
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @LLI_Prev(%struct.sListIterator* %iter) #0 !dbg !264 {
entry:
  %iter.addr = alloca %struct.sListIterator*, align 8
  store %struct.sListIterator* %iter, %struct.sListIterator** %iter.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.sListIterator** %iter.addr, metadata !265, metadata !DIExpression()), !dbg !266
  %0 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !267
  %link = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %0, i32 0, i32 0, !dbg !269
  %1 = load %struct.sListEntry*, %struct.sListEntry** %link, align 8, !dbg !269
  %tobool = icmp ne %struct.sListEntry* %1, null, !dbg !267
  br i1 %tobool, label %if.then, label %if.end, !dbg !270

if.then:                                          ; preds = %entry
  %2 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !271
  %link1 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %2, i32 0, i32 0, !dbg !272
  %3 = load %struct.sListEntry*, %struct.sListEntry** %link1, align 8, !dbg !272
  %prev = getelementptr inbounds %struct.sListEntry, %struct.sListEntry* %3, i32 0, i32 2, !dbg !273
  %4 = load %struct.sListEntry*, %struct.sListEntry** %prev, align 8, !dbg !273
  %5 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !274
  %link2 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %5, i32 0, i32 0, !dbg !275
  store %struct.sListEntry* %4, %struct.sListEntry** %link2, align 8, !dbg !276
  br label %if.end, !dbg !274

if.end:                                           ; preds = %if.then, %entry
  %6 = load %struct.sListIterator*, %struct.sListIterator** %iter.addr, align 8, !dbg !277
  %link3 = getelementptr inbounds %struct.sListIterator, %struct.sListIterator* %6, i32 0, i32 0, !dbg !278
  %7 = load %struct.sListEntry*, %struct.sListEntry** %link3, align 8, !dbg !278
  %cmp = icmp ne %struct.sListEntry* %7, null, !dbg !279
  %conv = zext i1 %cmp to i32, !dbg !279
  ret i32 %conv, !dbg !280
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !2 {
entry:
  %retval = alloca i32, align 4
  %ix = alloca i32, align 4
  %ll = alloca %struct.sListEntry*, align 8
  %iter = alloca %struct.sListIterator*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %ix, metadata !281, metadata !DIExpression()), !dbg !282
  call void @llvm.dbg.declare(metadata %struct.sListEntry** %ll, metadata !283, metadata !DIExpression()), !dbg !284
  %call = call %struct.sListEntry* @NewList(), !dbg !285
  store %struct.sListEntry* %call, %struct.sListEntry** %ll, align 8, !dbg !284
  call void @llvm.dbg.declare(metadata %struct.sListIterator** %iter, metadata !286, metadata !DIExpression()), !dbg !287
  store i32 0, i32* %ix, align 4, !dbg !288
  br label %for.cond, !dbg !290

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %ix, align 4, !dbg !291
  %cmp = icmp slt i32 %0, 6, !dbg !293
  br i1 %cmp, label %for.body, label %for.end, !dbg !294

for.body:                                         ; preds = %for.cond
  %1 = load %struct.sListEntry*, %struct.sListEntry** %ll, align 8, !dbg !295
  %2 = load i32, i32* %ix, align 4, !dbg !296
  %idxprom = sext i32 %2 to i64, !dbg !297
  %arrayidx = getelementptr inbounds [6 x i8*], [6 x i8*]* @main.contents, i64 0, i64 %idxprom, !dbg !297
  %3 = load i8*, i8** %arrayidx, align 8, !dbg !297
  %call1 = call i32 @LL_Append(%struct.sListEntry* %1, i8* %3), !dbg !298
  br label %for.inc, !dbg !298

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %ix, align 4, !dbg !299
  %inc = add nsw i32 %4, 1, !dbg !299
  store i32 %inc, i32* %ix, align 4, !dbg !299
  br label %for.cond, !dbg !300, !llvm.loop !301

for.end:                                          ; preds = %for.cond
  %5 = load %struct.sListEntry*, %struct.sListEntry** %ll, align 8, !dbg !303
  %call2 = call %struct.sListIterator* @LL_GetIterator(%struct.sListEntry* %5), !dbg !304
  store %struct.sListIterator* %call2, %struct.sListIterator** %iter, align 8, !dbg !305
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i64 0, i64 0)), !dbg !306
  br label %while.cond, !dbg !307

while.cond:                                       ; preds = %while.body, %for.end
  %6 = load %struct.sListIterator*, %struct.sListIterator** %iter, align 8, !dbg !308
  %call4 = call i32 @LLI_Next(%struct.sListIterator* %6), !dbg !309
  %tobool = icmp ne i32 %call4, 0, !dbg !307
  br i1 %tobool, label %while.body, label %while.end, !dbg !307

while.body:                                       ; preds = %while.cond
  %7 = load %struct.sListIterator*, %struct.sListIterator** %iter, align 8, !dbg !310
  %call5 = call i8* @LLI_Value(%struct.sListIterator* %7), !dbg !311
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i64 0, i64 0), i8* %call5), !dbg !312
  br label %while.cond, !dbg !307, !llvm.loop !313

while.end:                                        ; preds = %while.cond
  %8 = load %struct.sListIterator*, %struct.sListIterator** %iter, align 8, !dbg !315
  %9 = bitcast %struct.sListIterator* %8 to i8*, !dbg !315
  call void @free(i8* %9) #4, !dbg !315
  store %struct.sListIterator* null, %struct.sListIterator** %iter, align 8, !dbg !315
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i64 0, i64 0)), !dbg !317
  %10 = load %struct.sListEntry*, %struct.sListEntry** %ll, align 8, !dbg !318
  %call8 = call %struct.sListIterator* @LL_GetIterator(%struct.sListEntry* %10), !dbg !319
  store %struct.sListIterator* %call8, %struct.sListIterator** %iter, align 8, !dbg !320
  br label %while.cond9, !dbg !321

while.cond9:                                      ; preds = %while.body12, %while.end
  %11 = load %struct.sListIterator*, %struct.sListIterator** %iter, align 8, !dbg !322
  %call10 = call i32 @LLI_Prev(%struct.sListIterator* %11), !dbg !323
  %tobool11 = icmp ne i32 %call10, 0, !dbg !321
  br i1 %tobool11, label %while.body12, label %while.end15, !dbg !321

while.body12:                                     ; preds = %while.cond9
  %12 = load %struct.sListIterator*, %struct.sListIterator** %iter, align 8, !dbg !324
  %call13 = call i8* @LLI_Value(%struct.sListIterator* %12), !dbg !325
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i64 0, i64 0), i8* %call13), !dbg !326
  br label %while.cond9, !dbg !321, !llvm.loop !327

while.end15:                                      ; preds = %while.cond9
  %13 = load %struct.sListIterator*, %struct.sListIterator** %iter, align 8, !dbg !329
  %14 = bitcast %struct.sListIterator* %13 to i8*, !dbg !329
  call void @free(i8* %14) #4, !dbg !329
  store %struct.sListIterator* null, %struct.sListIterator** %iter, align 8, !dbg !329
  ret i32 0, !dbg !331
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
!32 = !DILocalVariable(name: "le", scope: !22, file: !3, line: 18, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "ListEntry", file: !3, line: 10, baseType: !26)
!34 = !DILocation(line: 18, column: 15, scope: !22)
!35 = !DILocation(line: 18, column: 20, scope: !22)
!36 = !DILocation(line: 19, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !22, file: !3, line: 19, column: 9)
!38 = !DILocation(line: 19, column: 9, scope: !22)
!39 = !DILocation(line: 20, column: 9, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !3, line: 19, column: 13)
!41 = !DILocation(line: 20, column: 13, scope: !40)
!42 = !DILocation(line: 20, column: 19, scope: !40)
!43 = !DILocation(line: 21, column: 20, scope: !40)
!44 = !DILocation(line: 21, column: 24, scope: !40)
!45 = !DILocation(line: 21, column: 29, scope: !40)
!46 = !DILocation(line: 21, column: 9, scope: !40)
!47 = !DILocation(line: 21, column: 13, scope: !40)
!48 = !DILocation(line: 21, column: 18, scope: !40)
!49 = !DILocation(line: 22, column: 5, scope: !40)
!50 = !DILocation(line: 23, column: 12, scope: !22)
!51 = !DILocation(line: 23, column: 5, scope: !22)
!52 = distinct !DISubprogram(name: "LL_Append", scope: !3, file: !3, line: 26, type: !53, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!53 = !DISubroutineType(types: !54)
!54 = !{!6, !25, !13}
!55 = !DILocalVariable(name: "ll", arg: 1, scope: !52, file: !3, line: 26, type: !25)
!56 = !DILocation(line: 26, column: 26, scope: !52)
!57 = !DILocalVariable(name: "newVal", arg: 2, scope: !52, file: !3, line: 26, type: !13)
!58 = !DILocation(line: 26, column: 42, scope: !52)
!59 = !DILocalVariable(name: "le", scope: !52, file: !3, line: 28, type: !33)
!60 = !DILocation(line: 28, column: 15, scope: !52)
!61 = !DILocation(line: 28, column: 20, scope: !52)
!62 = !DILocation(line: 29, column: 9, scope: !63)
!63 = distinct !DILexicalBlock(scope: !52, file: !3, line: 29, column: 9)
!64 = !DILocation(line: 29, column: 9, scope: !52)
!65 = !DILocation(line: 30, column: 28, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !3, line: 29, column: 13)
!67 = !DILocation(line: 30, column: 21, scope: !66)
!68 = !DILocation(line: 30, column: 9, scope: !66)
!69 = !DILocation(line: 30, column: 13, scope: !66)
!70 = !DILocation(line: 30, column: 19, scope: !66)
!71 = !DILocation(line: 31, column: 20, scope: !66)
!72 = !DILocation(line: 31, column: 24, scope: !66)
!73 = !DILocation(line: 31, column: 9, scope: !66)
!74 = !DILocation(line: 31, column: 13, scope: !66)
!75 = !DILocation(line: 31, column: 18, scope: !66)
!76 = !DILocation(line: 32, column: 9, scope: !66)
!77 = !DILocation(line: 32, column: 13, scope: !66)
!78 = !DILocation(line: 32, column: 18, scope: !66)
!79 = !DILocation(line: 33, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !66, file: !3, line: 33, column: 13)
!81 = !DILocation(line: 33, column: 17, scope: !80)
!82 = !DILocation(line: 33, column: 13, scope: !66)
!83 = !DILocation(line: 34, column: 30, scope: !80)
!84 = !DILocation(line: 34, column: 13, scope: !80)
!85 = !DILocation(line: 34, column: 17, scope: !80)
!86 = !DILocation(line: 34, column: 23, scope: !80)
!87 = !DILocation(line: 34, column: 28, scope: !80)
!88 = !DILocation(line: 36, column: 24, scope: !80)
!89 = !DILocation(line: 36, column: 13, scope: !80)
!90 = !DILocation(line: 36, column: 17, scope: !80)
!91 = !DILocation(line: 36, column: 22, scope: !80)
!92 = !DILocation(line: 37, column: 20, scope: !66)
!93 = !DILocation(line: 37, column: 9, scope: !66)
!94 = !DILocation(line: 37, column: 13, scope: !66)
!95 = !DILocation(line: 37, column: 18, scope: !66)
!96 = !DILocation(line: 38, column: 5, scope: !66)
!97 = !DILocation(line: 39, column: 13, scope: !52)
!98 = !DILocation(line: 39, column: 15, scope: !52)
!99 = !DILocation(line: 39, column: 5, scope: !52)
!100 = distinct !DISubprogram(name: "LI_Insert", scope: !3, file: !3, line: 42, type: !101, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!101 = !DISubroutineType(types: !102)
!102 = !{!6, !103, !13}
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "LIterator", file: !3, line: 15, baseType: !104)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sListIterator", file: !3, line: 12, size: 128, elements: !106)
!106 = !{!107, !108}
!107 = !DIDerivedType(tag: DW_TAG_member, name: "link", scope: !105, file: !3, line: 13, baseType: !33, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "head", scope: !105, file: !3, line: 14, baseType: !25, size: 64, offset: 64)
!109 = !DILocalVariable(name: "iter", arg: 1, scope: !100, file: !3, line: 42, type: !103)
!110 = !DILocation(line: 42, column: 25, scope: !100)
!111 = !DILocalVariable(name: "newVal", arg: 2, scope: !100, file: !3, line: 42, type: !13)
!112 = !DILocation(line: 42, column: 43, scope: !100)
!113 = !DILocalVariable(name: "crnt", scope: !100, file: !3, line: 44, type: !33)
!114 = !DILocation(line: 44, column: 15, scope: !100)
!115 = !DILocation(line: 44, column: 22, scope: !100)
!116 = !DILocation(line: 44, column: 28, scope: !100)
!117 = !DILocalVariable(name: "le", scope: !100, file: !3, line: 45, type: !33)
!118 = !DILocation(line: 45, column: 15, scope: !100)
!119 = !DILocation(line: 45, column: 20, scope: !100)
!120 = !DILocation(line: 46, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !100, file: !3, line: 46, column: 9)
!122 = !DILocation(line: 46, column: 9, scope: !100)
!123 = !DILocation(line: 47, column: 28, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !3, line: 46, column: 13)
!125 = !DILocation(line: 47, column: 21, scope: !124)
!126 = !DILocation(line: 47, column: 9, scope: !124)
!127 = !DILocation(line: 47, column: 13, scope: !124)
!128 = !DILocation(line: 47, column: 19, scope: !124)
!129 = !DILocation(line: 48, column: 14, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !3, line: 48, column: 14)
!131 = !DILocation(line: 48, column: 22, scope: !130)
!132 = !DILocation(line: 48, column: 28, scope: !130)
!133 = !DILocation(line: 48, column: 19, scope: !130)
!134 = !DILocation(line: 48, column: 14, scope: !124)
!135 = !DILocation(line: 49, column: 13, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !3, line: 48, column: 34)
!137 = !DILocation(line: 49, column: 17, scope: !136)
!138 = !DILocation(line: 49, column: 22, scope: !136)
!139 = !DILocation(line: 50, column: 24, scope: !136)
!140 = !DILocation(line: 50, column: 30, scope: !136)
!141 = !DILocation(line: 50, column: 13, scope: !136)
!142 = !DILocation(line: 50, column: 17, scope: !136)
!143 = !DILocation(line: 50, column: 22, scope: !136)
!144 = !DILocation(line: 51, column: 26, scope: !136)
!145 = !DILocation(line: 51, column: 13, scope: !136)
!146 = !DILocation(line: 51, column: 19, scope: !136)
!147 = !DILocation(line: 51, column: 24, scope: !136)
!148 = !DILocation(line: 52, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !136, file: !3, line: 52, column: 17)
!150 = !DILocation(line: 52, column: 21, scope: !149)
!151 = !DILocation(line: 52, column: 17, scope: !136)
!152 = !DILocation(line: 53, column: 34, scope: !149)
!153 = !DILocation(line: 53, column: 17, scope: !149)
!154 = !DILocation(line: 53, column: 21, scope: !149)
!155 = !DILocation(line: 53, column: 27, scope: !149)
!156 = !DILocation(line: 53, column: 32, scope: !149)
!157 = !DILocation(line: 55, column: 30, scope: !149)
!158 = !DILocation(line: 55, column: 17, scope: !149)
!159 = !DILocation(line: 55, column: 23, scope: !149)
!160 = !DILocation(line: 55, column: 28, scope: !149)
!161 = !DILocation(line: 56, column: 9, scope: !136)
!162 = !DILocation(line: 58, column: 26, scope: !163)
!163 = distinct !DILexicalBlock(scope: !130, file: !3, line: 57, column: 14)
!164 = !DILocation(line: 58, column: 31, scope: !163)
!165 = !DILocation(line: 58, column: 24, scope: !163)
!166 = !DILocation(line: 58, column: 41, scope: !163)
!167 = !DILocation(line: 58, column: 47, scope: !163)
!168 = !DILocation(line: 58, column: 53, scope: !163)
!169 = !DILocation(line: 58, column: 60, scope: !163)
!170 = !DILocation(line: 58, column: 66, scope: !163)
!171 = !DILocation(line: 58, column: 13, scope: !163)
!172 = !DILocation(line: 58, column: 17, scope: !163)
!173 = !DILocation(line: 58, column: 22, scope: !163)
!174 = !DILocation(line: 59, column: 24, scope: !163)
!175 = !DILocation(line: 59, column: 13, scope: !163)
!176 = !DILocation(line: 59, column: 17, scope: !163)
!177 = !DILocation(line: 59, column: 22, scope: !163)
!178 = !DILocation(line: 60, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !163, file: !3, line: 60, column: 17)
!180 = !DILocation(line: 60, column: 21, scope: !179)
!181 = !DILocation(line: 60, column: 17, scope: !163)
!182 = !DILocation(line: 61, column: 34, scope: !179)
!183 = !DILocation(line: 61, column: 17, scope: !179)
!184 = !DILocation(line: 61, column: 21, scope: !179)
!185 = !DILocation(line: 61, column: 27, scope: !179)
!186 = !DILocation(line: 61, column: 32, scope: !179)
!187 = !DILocation(line: 63, column: 36, scope: !179)
!188 = !DILocation(line: 63, column: 17, scope: !179)
!189 = !DILocation(line: 63, column: 23, scope: !179)
!190 = !DILocation(line: 63, column: 29, scope: !179)
!191 = !DILocation(line: 63, column: 34, scope: !179)
!192 = !DILocation(line: 64, column: 17, scope: !193)
!193 = distinct !DILexicalBlock(scope: !163, file: !3, line: 64, column: 17)
!194 = !DILocation(line: 64, column: 17, scope: !163)
!195 = !DILocation(line: 65, column: 30, scope: !193)
!196 = !DILocation(line: 65, column: 17, scope: !193)
!197 = !DILocation(line: 65, column: 23, scope: !193)
!198 = !DILocation(line: 65, column: 28, scope: !193)
!199 = !DILocation(line: 67, column: 36, scope: !193)
!200 = !DILocation(line: 67, column: 17, scope: !193)
!201 = !DILocation(line: 67, column: 23, scope: !193)
!202 = !DILocation(line: 67, column: 29, scope: !193)
!203 = !DILocation(line: 67, column: 34, scope: !193)
!204 = !DILocation(line: 69, column: 5, scope: !124)
!205 = !DILocation(line: 70, column: 13, scope: !100)
!206 = !DILocation(line: 70, column: 15, scope: !100)
!207 = !DILocation(line: 70, column: 5, scope: !100)
!208 = distinct !DISubprogram(name: "LL_GetIterator", scope: !3, file: !3, line: 73, type: !209, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!209 = !DISubroutineType(types: !210)
!210 = !{!103, !25}
!211 = !DILocalVariable(name: "ll", arg: 1, scope: !208, file: !3, line: 73, type: !25)
!212 = !DILocation(line: 73, column: 37, scope: !208)
!213 = !DILocalVariable(name: "liter", scope: !208, file: !3, line: 75, type: !103)
!214 = !DILocation(line: 75, column: 15, scope: !208)
!215 = !DILocation(line: 75, column: 23, scope: !208)
!216 = !DILocation(line: 76, column: 19, scope: !208)
!217 = !DILocation(line: 76, column: 5, scope: !208)
!218 = !DILocation(line: 76, column: 12, scope: !208)
!219 = !DILocation(line: 76, column: 17, scope: !208)
!220 = !DILocation(line: 77, column: 19, scope: !208)
!221 = !DILocation(line: 77, column: 5, scope: !208)
!222 = !DILocation(line: 77, column: 12, scope: !208)
!223 = !DILocation(line: 77, column: 17, scope: !208)
!224 = !DILocation(line: 78, column: 12, scope: !208)
!225 = !DILocation(line: 78, column: 5, scope: !208)
!226 = distinct !DISubprogram(name: "LLI_AtEnd", scope: !3, file: !3, line: 85, type: !227, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!227 = !DISubroutineType(types: !228)
!228 = !{!6, !103}
!229 = !DILocalVariable(name: "iter", arg: 1, scope: !226, file: !3, line: 85, type: !103)
!230 = !DILocation(line: 85, column: 25, scope: !226)
!231 = !DILocation(line: 87, column: 12, scope: !226)
!232 = !DILocation(line: 87, column: 18, scope: !226)
!233 = !DILocation(line: 87, column: 23, scope: !226)
!234 = !DILocation(line: 87, column: 5, scope: !226)
!235 = distinct !DISubprogram(name: "LLI_Value", scope: !3, file: !3, line: 89, type: !236, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!236 = !DISubroutineType(types: !237)
!237 = !{!13, !103}
!238 = !DILocalVariable(name: "iter", arg: 1, scope: !235, file: !3, line: 89, type: !103)
!239 = !DILocation(line: 89, column: 33, scope: !235)
!240 = !DILocation(line: 91, column: 13, scope: !235)
!241 = !DILocation(line: 91, column: 19, scope: !235)
!242 = !DILocation(line: 91, column: 12, scope: !235)
!243 = !DILocation(line: 91, column: 26, scope: !235)
!244 = !DILocation(line: 91, column: 32, scope: !235)
!245 = !DILocation(line: 91, column: 38, scope: !235)
!246 = !DILocation(line: 91, column: 5, scope: !235)
!247 = distinct !DISubprogram(name: "LLI_Next", scope: !3, file: !3, line: 93, type: !227, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!248 = !DILocalVariable(name: "iter", arg: 1, scope: !247, file: !3, line: 93, type: !103)
!249 = !DILocation(line: 93, column: 24, scope: !247)
!250 = !DILocation(line: 95, column: 9, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !3, line: 95, column: 9)
!252 = !DILocation(line: 95, column: 15, scope: !251)
!253 = !DILocation(line: 95, column: 9, scope: !247)
!254 = !DILocation(line: 95, column: 34, scope: !251)
!255 = !DILocation(line: 95, column: 40, scope: !251)
!256 = !DILocation(line: 95, column: 46, scope: !251)
!257 = !DILocation(line: 95, column: 21, scope: !251)
!258 = !DILocation(line: 95, column: 27, scope: !251)
!259 = !DILocation(line: 95, column: 32, scope: !251)
!260 = !DILocation(line: 96, column: 12, scope: !247)
!261 = !DILocation(line: 96, column: 18, scope: !247)
!262 = !DILocation(line: 96, column: 23, scope: !247)
!263 = !DILocation(line: 96, column: 5, scope: !247)
!264 = distinct !DISubprogram(name: "LLI_Prev", scope: !3, file: !3, line: 98, type: !227, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !8)
!265 = !DILocalVariable(name: "iter", arg: 1, scope: !264, file: !3, line: 98, type: !103)
!266 = !DILocation(line: 98, column: 24, scope: !264)
!267 = !DILocation(line: 100, column: 9, scope: !268)
!268 = distinct !DILexicalBlock(scope: !264, file: !3, line: 100, column: 9)
!269 = !DILocation(line: 100, column: 15, scope: !268)
!270 = !DILocation(line: 100, column: 9, scope: !264)
!271 = !DILocation(line: 100, column: 34, scope: !268)
!272 = !DILocation(line: 100, column: 40, scope: !268)
!273 = !DILocation(line: 100, column: 46, scope: !268)
!274 = !DILocation(line: 100, column: 21, scope: !268)
!275 = !DILocation(line: 100, column: 27, scope: !268)
!276 = !DILocation(line: 100, column: 32, scope: !268)
!277 = !DILocation(line: 101, column: 12, scope: !264)
!278 = !DILocation(line: 101, column: 18, scope: !264)
!279 = !DILocation(line: 101, column: 23, scope: !264)
!280 = !DILocation(line: 101, column: 5, scope: !264)
!281 = !DILocalVariable(name: "ix", scope: !2, file: !3, line: 108, type: !6)
!282 = !DILocation(line: 108, column: 9, scope: !2)
!283 = !DILocalVariable(name: "ll", scope: !2, file: !3, line: 109, type: !25)
!284 = !DILocation(line: 109, column: 16, scope: !2)
!285 = !DILocation(line: 109, column: 21, scope: !2)
!286 = !DILocalVariable(name: "iter", scope: !2, file: !3, line: 110, type: !103)
!287 = !DILocation(line: 110, column: 15, scope: !2)
!288 = !DILocation(line: 112, column: 12, scope: !289)
!289 = distinct !DILexicalBlock(scope: !2, file: !3, line: 112, column: 5)
!290 = !DILocation(line: 112, column: 10, scope: !289)
!291 = !DILocation(line: 112, column: 16, scope: !292)
!292 = distinct !DILexicalBlock(scope: !289, file: !3, line: 112, column: 5)
!293 = !DILocation(line: 112, column: 18, scope: !292)
!294 = !DILocation(line: 112, column: 5, scope: !289)
!295 = !DILocation(line: 113, column: 19, scope: !292)
!296 = !DILocation(line: 113, column: 32, scope: !292)
!297 = !DILocation(line: 113, column: 23, scope: !292)
!298 = !DILocation(line: 113, column: 9, scope: !292)
!299 = !DILocation(line: 112, column: 24, scope: !292)
!300 = !DILocation(line: 112, column: 5, scope: !292)
!301 = distinct !{!301, !294, !302}
!302 = !DILocation(line: 113, column: 35, scope: !289)
!303 = !DILocation(line: 115, column: 27, scope: !2)
!304 = !DILocation(line: 115, column: 12, scope: !2)
!305 = !DILocation(line: 115, column: 10, scope: !2)
!306 = !DILocation(line: 116, column: 5, scope: !2)
!307 = !DILocation(line: 117, column: 5, scope: !2)
!308 = !DILocation(line: 117, column: 20, scope: !2)
!309 = !DILocation(line: 117, column: 11, scope: !2)
!310 = !DILocation(line: 118, column: 40, scope: !2)
!311 = !DILocation(line: 118, column: 30, scope: !2)
!312 = !DILocation(line: 118, column: 9, scope: !2)
!313 = distinct !{!313, !307, !314}
!314 = !DILocation(line: 118, column: 45, scope: !2)
!315 = !DILocation(line: 119, column: 5, scope: !316)
!316 = distinct !DILexicalBlock(scope: !2, file: !3, line: 119, column: 5)
!317 = !DILocation(line: 121, column: 5, scope: !2)
!318 = !DILocation(line: 122, column: 27, scope: !2)
!319 = !DILocation(line: 122, column: 12, scope: !2)
!320 = !DILocation(line: 122, column: 10, scope: !2)
!321 = !DILocation(line: 123, column: 5, scope: !2)
!322 = !DILocation(line: 123, column: 20, scope: !2)
!323 = !DILocation(line: 123, column: 11, scope: !2)
!324 = !DILocation(line: 124, column: 40, scope: !2)
!325 = !DILocation(line: 124, column: 30, scope: !2)
!326 = !DILocation(line: 124, column: 9, scope: !2)
!327 = distinct !{!327, !321, !328}
!328 = !DILocation(line: 124, column: 45, scope: !2)
!329 = !DILocation(line: 125, column: 5, scope: !330)
!330 = distinct !DILexicalBlock(scope: !2, file: !3, line: 125, column: 5)
!331 = !DILocation(line: 127, column: 5, scope: !2)
