; ModuleID = 'echo-server.c'
source_filename = "echo-server.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr = type { i16, [14 x i8] }
%struct.addrinfo = type { i32, i32, i32, i32, i32, %struct.sockaddr*, i8*, %struct.addrinfo* }
%struct.sigaction = type { %union.anon, %struct.__sigset_t, i32, void ()* }
%union.anon = type { void (i32)* }
%struct.__sigset_t = type { [16 x i64] }

@.str = private unnamed_addr constant [7 x i8] c"accept\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"12321\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"getaddrinfo\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"socket\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"sigaction\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"bind\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"listen\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @wait_for_zombie(i32 %s) #0 !dbg !20 {
entry:
  %s.addr = alloca i32, align 4
  store i32 %s, i32* %s.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %s.addr, metadata !25, metadata !DIExpression()), !dbg !26
  br label %while.cond, !dbg !27

while.cond:                                       ; preds = %while.body, %entry
  %call = call i32 @waitpid(i32 -1, i32* null, i32 1), !dbg !28
  %cmp = icmp sgt i32 %call, 0, !dbg !29
  br i1 %cmp, label %while.body, label %while.end, !dbg !27

while.body:                                       ; preds = %while.cond
  br label %while.cond, !dbg !27, !llvm.loop !30

while.end:                                        ; preds = %while.cond
  ret void, !dbg !32
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @waitpid(i32, i32*, i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @echo_lines(i32 %csock) #0 !dbg !33 {
entry:
  %csock.addr = alloca i32, align 4
  %buf = alloca [256 x i8], align 16
  %r = alloca i32, align 4
  store i32 %csock, i32* %csock.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %csock.addr, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata [256 x i8]* %buf, metadata !36, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i32* %r, metadata !42, metadata !DIExpression()), !dbg !43
  br label %while.cond, !dbg !44

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %csock.addr, align 4, !dbg !45
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %buf, i64 0, i64 0, !dbg !46
  %call = call i64 @read(i32 %0, i8* %arraydecay, i64 256), !dbg !47
  %conv = trunc i64 %call to i32, !dbg !47
  store i32 %conv, i32* %r, align 4, !dbg !48
  %cmp = icmp sgt i32 %conv, 0, !dbg !49
  br i1 %cmp, label %while.body, label %while.end, !dbg !44

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %csock.addr, align 4, !dbg !50
  %arraydecay2 = getelementptr inbounds [256 x i8], [256 x i8]* %buf, i64 0, i64 0, !dbg !52
  %2 = load i32, i32* %r, align 4, !dbg !53
  %conv3 = sext i32 %2 to i64, !dbg !53
  %call4 = call i64 @write(i32 %1, i8* %arraydecay2, i64 %conv3), !dbg !54
  br label %while.cond, !dbg !44, !llvm.loop !55

while.end:                                        ; preds = %while.cond
  call void @exit(i32 0) #6, !dbg !57
  unreachable, !dbg !57
}

declare dso_local i64 @read(i32, i8*, i64) #2

declare dso_local i64 @write(i32, i8*, i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @take_connections_forever(i32 %ssock) #0 !dbg !58 {
entry:
  %ssock.addr = alloca i32, align 4
  %addr = alloca %struct.sockaddr, align 2
  %addr_size = alloca i32, align 4
  %csock = alloca i32, align 4
  store i32 %ssock, i32* %ssock.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ssock.addr, metadata !59, metadata !DIExpression()), !dbg !60
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %if.end7, %entry
  call void @llvm.dbg.declare(metadata %struct.sockaddr* %addr, metadata !62, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32* %addr_size, metadata !78, metadata !DIExpression()), !dbg !82
  store i32 16, i32* %addr_size, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata i32* %csock, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = load i32, i32* %ssock.addr, align 4, !dbg !85
  %call = call i32 @accept(i32 %0, %struct.sockaddr* %addr, i32* %addr_size), !dbg !86
  store i32 %call, i32* %csock, align 4, !dbg !87
  %1 = load i32, i32* %csock, align 4, !dbg !88
  %cmp = icmp eq i32 %1, -1, !dbg !90
  br i1 %cmp, label %if.then, label %if.else, !dbg !91, !cf.info !92

if.then:                                          ; preds = %for.cond
  call void @perror(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0)), !dbg !93
  br label %if.end7, !dbg !95

if.else:                                          ; preds = %for.cond
  %call1 = call i32 @fork() #7, !dbg !96
  %cmp2 = icmp eq i32 %call1, 0, !dbg !98
  br i1 %cmp2, label %if.then3, label %if.else5, !dbg !99, !cf.info !92

if.then3:                                         ; preds = %if.else
  %2 = load i32, i32* %ssock.addr, align 4, !dbg !100
  %call4 = call i32 @close(i32 %2), !dbg !102
  %3 = load i32, i32* %csock, align 4, !dbg !103
  call void @echo_lines(i32 %3), !dbg !104
  br label %if.end, !dbg !105

if.else5:                                         ; preds = %if.else
  %4 = load i32, i32* %csock, align 4, !dbg !106
  %call6 = call i32 @close(i32 %4), !dbg !108
  br label %if.end

if.end:                                           ; preds = %if.else5, %if.then3
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  br label %for.cond, !dbg !109, !llvm.loop !110
}

declare dso_local i32 @accept(i32, %struct.sockaddr*, i32*) #2

declare dso_local void @perror(i8*) #2

; Function Attrs: nounwind
declare dso_local i32 @fork() #4

declare dso_local i32 @close(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !113 {
entry:
  %retval = alloca i32, align 4
  %hints = alloca %struct.addrinfo, align 8
  %res = alloca %struct.addrinfo*, align 8
  %sa = alloca %struct.sigaction, align 8
  %sock = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.addrinfo* %hints, metadata !116, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata %struct.addrinfo** %res, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata %struct.sigaction* %sa, metadata !134, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.declare(metadata i32* %sock, metadata !244, metadata !DIExpression()), !dbg !245
  %0 = bitcast %struct.addrinfo* %hints to i8*, !dbg !246
  call void @llvm.memset.p0i8.i64(i8* align 8 %0, i8 0, i64 48, i1 false), !dbg !246
  %ai_family = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %hints, i32 0, i32 1, !dbg !247
  store i32 0, i32* %ai_family, align 4, !dbg !248
  %ai_socktype = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %hints, i32 0, i32 2, !dbg !249
  store i32 1, i32* %ai_socktype, align 8, !dbg !250
  %ai_flags = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %hints, i32 0, i32 0, !dbg !251
  store i32 1, i32* %ai_flags, align 8, !dbg !252
  %call = call i32 @getaddrinfo(i8* null, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), %struct.addrinfo* %hints, %struct.addrinfo** %res), !dbg !253
  %cmp = icmp ne i32 %call, 0, !dbg !255
  br i1 %cmp, label %if.then, label %if.end, !dbg !256, !cf.info !92

if.then:                                          ; preds = %entry
  call void @perror(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0)), !dbg !257
  call void @exit(i32 1) #6, !dbg !259
  unreachable, !dbg !259

if.end:                                           ; preds = %entry
  %1 = load %struct.addrinfo*, %struct.addrinfo** %res, align 8, !dbg !260
  %ai_family1 = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %1, i32 0, i32 1, !dbg !262
  %2 = load i32, i32* %ai_family1, align 4, !dbg !262
  %3 = load %struct.addrinfo*, %struct.addrinfo** %res, align 8, !dbg !263
  %ai_socktype2 = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %3, i32 0, i32 2, !dbg !264
  %4 = load i32, i32* %ai_socktype2, align 8, !dbg !264
  %5 = load %struct.addrinfo*, %struct.addrinfo** %res, align 8, !dbg !265
  %ai_protocol = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %5, i32 0, i32 3, !dbg !266
  %6 = load i32, i32* %ai_protocol, align 4, !dbg !266
  %call3 = call i32 @socket(i32 %2, i32 %4, i32 %6) #7, !dbg !267
  store i32 %call3, i32* %sock, align 4, !dbg !268
  %cmp4 = icmp eq i32 %call3, -1, !dbg !269
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !270, !cf.info !92

if.then5:                                         ; preds = %if.end
  call void @perror(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)), !dbg !271
  call void @exit(i32 1) #6, !dbg !273
  unreachable, !dbg !273

if.end6:                                          ; preds = %if.end
  %__sigaction_handler = getelementptr inbounds %struct.sigaction, %struct.sigaction* %sa, i32 0, i32 0, !dbg !274
  %sa_handler = bitcast %union.anon* %__sigaction_handler to void (i32)**, !dbg !274
  store void (i32)* @wait_for_zombie, void (i32)** %sa_handler, align 8, !dbg !275
  %sa_mask = getelementptr inbounds %struct.sigaction, %struct.sigaction* %sa, i32 0, i32 1, !dbg !276
  %call7 = call i32 @sigemptyset(%struct.__sigset_t* %sa_mask) #7, !dbg !277
  %sa_flags = getelementptr inbounds %struct.sigaction, %struct.sigaction* %sa, i32 0, i32 2, !dbg !278
  store i32 268435456, i32* %sa_flags, align 8, !dbg !279
  %call8 = call i32 @sigaction(i32 17, %struct.sigaction* %sa, %struct.sigaction* null) #7, !dbg !280
  %cmp9 = icmp eq i32 %call8, -1, !dbg !282
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !283, !cf.info !92

if.then10:                                        ; preds = %if.end6
  call void @perror(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0)), !dbg !284
  call void @exit(i32 1) #6, !dbg !286
  unreachable, !dbg !286

if.end11:                                         ; preds = %if.end6
  %7 = load i32, i32* %sock, align 4, !dbg !287
  %8 = load %struct.addrinfo*, %struct.addrinfo** %res, align 8, !dbg !289
  %ai_addr = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %8, i32 0, i32 5, !dbg !290
  %9 = load %struct.sockaddr*, %struct.sockaddr** %ai_addr, align 8, !dbg !290
  %10 = load %struct.addrinfo*, %struct.addrinfo** %res, align 8, !dbg !291
  %ai_addrlen = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %10, i32 0, i32 4, !dbg !292
  %11 = load i32, i32* %ai_addrlen, align 8, !dbg !292
  %call12 = call i32 @bind(i32 %7, %struct.sockaddr* %9, i32 %11) #7, !dbg !293
  %cmp13 = icmp ne i32 %call12, 0, !dbg !294
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !295, !cf.info !92

if.then14:                                        ; preds = %if.end11
  call void @perror(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0)), !dbg !296
  call void @exit(i32 1) #6, !dbg !298
  unreachable, !dbg !298

if.end15:                                         ; preds = %if.end11
  %12 = load %struct.addrinfo*, %struct.addrinfo** %res, align 8, !dbg !299
  call void @freeaddrinfo(%struct.addrinfo* %12) #7, !dbg !300
  %13 = load i32, i32* %sock, align 4, !dbg !301
  %call16 = call i32 @listen(i32 %13, i32 20) #7, !dbg !303
  %cmp17 = icmp ne i32 %call16, 0, !dbg !304
  br i1 %cmp17, label %if.then18, label %if.end19, !dbg !305, !cf.info !92

if.then18:                                        ; preds = %if.end15
  call void @perror(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0)), !dbg !306
  call void @exit(i32 1) #6, !dbg !308
  unreachable, !dbg !308

if.end19:                                         ; preds = %if.end15
  %14 = load i32, i32* %sock, align 4, !dbg !309
  call void @take_connections_forever(i32 %14), !dbg !310
  ret i32 0, !dbg !311
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare dso_local i32 @getaddrinfo(i8*, i8*, %struct.addrinfo*, %struct.addrinfo**) #2

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #4

; Function Attrs: nounwind
declare dso_local i32 @sigemptyset(%struct.__sigset_t*) #4

; Function Attrs: nounwind
declare dso_local i32 @sigaction(i32, %struct.sigaction*, %struct.sigaction*) #4

; Function Attrs: nounwind
declare dso_local i32 @bind(i32, %struct.sockaddr*, i32) #4

; Function Attrs: nounwind
declare dso_local void @freeaddrinfo(%struct.addrinfo*) #4

; Function Attrs: nounwind
declare dso_local i32 @listen(i32, i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "echo-server.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Echo-server")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "__socket_type", file: !4, line: 24, baseType: !5, size: 32, elements: !6)
!4 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket_type.h", directory: "")
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!7, !8, !9, !10, !11, !12, !13, !14, !15}
!7 = !DIEnumerator(name: "SOCK_STREAM", value: 1, isUnsigned: true)
!8 = !DIEnumerator(name: "SOCK_DGRAM", value: 2, isUnsigned: true)
!9 = !DIEnumerator(name: "SOCK_RAW", value: 3, isUnsigned: true)
!10 = !DIEnumerator(name: "SOCK_RDM", value: 4, isUnsigned: true)
!11 = !DIEnumerator(name: "SOCK_SEQPACKET", value: 5, isUnsigned: true)
!12 = !DIEnumerator(name: "SOCK_DCCP", value: 6, isUnsigned: true)
!13 = !DIEnumerator(name: "SOCK_PACKET", value: 10, isUnsigned: true)
!14 = !DIEnumerator(name: "SOCK_CLOEXEC", value: 524288, isUnsigned: true)
!15 = !DIEnumerator(name: "SOCK_NONBLOCK", value: 2048, isUnsigned: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!20 = distinct !DISubprogram(name: "wait_for_zombie", scope: !1, file: !1, line: 20, type: !21, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !23}
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !{}
!25 = !DILocalVariable(name: "s", arg: 1, scope: !20, file: !1, line: 20, type: !23)
!26 = !DILocation(line: 20, column: 26, scope: !20)
!27 = !DILocation(line: 22, column: 5, scope: !20)
!28 = !DILocation(line: 22, column: 11, scope: !20)
!29 = !DILocation(line: 22, column: 38, scope: !20)
!30 = distinct !{!30, !27, !31}
!31 = !DILocation(line: 22, column: 43, scope: !20)
!32 = !DILocation(line: 23, column: 1, scope: !20)
!33 = distinct !DISubprogram(name: "echo_lines", scope: !1, file: !1, line: 29, type: !21, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!34 = !DILocalVariable(name: "csock", arg: 1, scope: !33, file: !1, line: 29, type: !23)
!35 = !DILocation(line: 29, column: 21, scope: !33)
!36 = !DILocalVariable(name: "buf", scope: !33, file: !1, line: 31, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 2048, elements: !39)
!38 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!39 = !{!40}
!40 = !DISubrange(count: 256)
!41 = !DILocation(line: 31, column: 10, scope: !33)
!42 = !DILocalVariable(name: "r", scope: !33, file: !1, line: 32, type: !23)
!43 = !DILocation(line: 32, column: 9, scope: !33)
!44 = !DILocation(line: 34, column: 5, scope: !33)
!45 = !DILocation(line: 34, column: 22, scope: !33)
!46 = !DILocation(line: 34, column: 29, scope: !33)
!47 = !DILocation(line: 34, column: 17, scope: !33)
!48 = !DILocation(line: 34, column: 15, scope: !33)
!49 = !DILocation(line: 34, column: 44, scope: !33)
!50 = !DILocation(line: 35, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !33, file: !1, line: 34, column: 50)
!52 = !DILocation(line: 35, column: 28, scope: !51)
!53 = !DILocation(line: 35, column: 33, scope: !51)
!54 = !DILocation(line: 35, column: 15, scope: !51)
!55 = distinct !{!55, !44, !56}
!56 = !DILocation(line: 36, column: 5, scope: !33)
!57 = !DILocation(line: 37, column: 5, scope: !33)
!58 = distinct !DISubprogram(name: "take_connections_forever", scope: !1, file: !1, line: 44, type: !21, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!59 = !DILocalVariable(name: "ssock", arg: 1, scope: !58, file: !1, line: 44, type: !23)
!60 = !DILocation(line: 44, column: 35, scope: !58)
!61 = !DILocation(line: 46, column: 5, scope: !58)
!62 = !DILocalVariable(name: "addr", scope: !63, file: !1, line: 47, type: !66)
!63 = distinct !DILexicalBlock(scope: !64, file: !1, line: 46, column: 13)
!64 = distinct !DILexicalBlock(scope: !65, file: !1, line: 46, column: 5)
!65 = distinct !DILexicalBlock(scope: !58, file: !1, line: 46, column: 5)
!66 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !67, line: 178, size: 128, elements: !68)
!67 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!68 = !{!69, !73}
!69 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !66, file: !67, line: 180, baseType: !70, size: 16)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !71, line: 28, baseType: !72)
!71 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!72 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !66, file: !67, line: 181, baseType: !74, size: 112, offset: 16)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 112, elements: !75)
!75 = !{!76}
!76 = !DISubrange(count: 14)
!77 = !DILocation(line: 47, column: 25, scope: !63)
!78 = !DILocalVariable(name: "addr_size", scope: !63, file: !1, line: 48, type: !79)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "socklen_t", file: !67, line: 33, baseType: !80)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "__socklen_t", file: !81, line: 209, baseType: !5)
!81 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!82 = !DILocation(line: 48, column: 19, scope: !63)
!83 = !DILocalVariable(name: "csock", scope: !63, file: !1, line: 49, type: !23)
!84 = !DILocation(line: 49, column: 13, scope: !63)
!85 = !DILocation(line: 52, column: 24, scope: !63)
!86 = !DILocation(line: 52, column: 17, scope: !63)
!87 = !DILocation(line: 52, column: 15, scope: !63)
!88 = !DILocation(line: 55, column: 14, scope: !89)
!89 = distinct !DILexicalBlock(scope: !63, file: !1, line: 55, column: 14)
!90 = !DILocation(line: 55, column: 20, scope: !89)
!91 = !DILocation(line: 55, column: 14, scope: !63)
!92 = !{!"if"}
!93 = !DILocation(line: 56, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !89, file: !1, line: 55, column: 28)
!95 = !DILocation(line: 57, column: 9, scope: !94)
!96 = !DILocation(line: 57, column: 21, scope: !97)
!97 = distinct !DILexicalBlock(scope: !89, file: !1, line: 57, column: 21)
!98 = !DILocation(line: 57, column: 28, scope: !97)
!99 = !DILocation(line: 57, column: 21, scope: !89)
!100 = !DILocation(line: 58, column: 19, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !1, line: 57, column: 35)
!102 = !DILocation(line: 58, column: 13, scope: !101)
!103 = !DILocation(line: 59, column: 24, scope: !101)
!104 = !DILocation(line: 59, column: 13, scope: !101)
!105 = !DILocation(line: 60, column: 9, scope: !101)
!106 = !DILocation(line: 61, column: 19, scope: !107)
!107 = distinct !DILexicalBlock(scope: !97, file: !1, line: 60, column: 16)
!108 = !DILocation(line: 61, column: 13, scope: !107)
!109 = !DILocation(line: 46, column: 5, scope: !64)
!110 = distinct !{!110, !111, !112}
!111 = !DILocation(line: 46, column: 5, scope: !65)
!112 = !DILocation(line: 63, column: 5, scope: !65)
!113 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 70, type: !114, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!114 = !DISubroutineType(types: !115)
!115 = !{!23}
!116 = !DILocalVariable(name: "hints", scope: !113, file: !1, line: 72, type: !117)
!117 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "addrinfo", file: !118, line: 565, size: 384, elements: !119)
!118 = !DIFile(filename: "/usr/include/netdb.h", directory: "")
!119 = !{!120, !121, !122, !123, !124, !125, !127, !129}
!120 = !DIDerivedType(tag: DW_TAG_member, name: "ai_flags", scope: !117, file: !118, line: 567, baseType: !23, size: 32)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "ai_family", scope: !117, file: !118, line: 568, baseType: !23, size: 32, offset: 32)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "ai_socktype", scope: !117, file: !118, line: 569, baseType: !23, size: 32, offset: 64)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "ai_protocol", scope: !117, file: !118, line: 570, baseType: !23, size: 32, offset: 96)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "ai_addrlen", scope: !117, file: !118, line: 571, baseType: !79, size: 32, offset: 128)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "ai_addr", scope: !117, file: !118, line: 572, baseType: !126, size: 64, offset: 192)
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "ai_canonname", scope: !117, file: !118, line: 573, baseType: !128, size: 64, offset: 256)
!128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "ai_next", scope: !117, file: !118, line: 574, baseType: !130, size: 64, offset: 320)
!130 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!131 = !DILocation(line: 72, column: 21, scope: !113)
!132 = !DILocalVariable(name: "res", scope: !113, file: !1, line: 72, type: !130)
!133 = !DILocation(line: 72, column: 29, scope: !113)
!134 = !DILocalVariable(name: "sa", scope: !113, file: !1, line: 73, type: !135)
!135 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sigaction", file: !136, line: 27, size: 1216, elements: !137)
!136 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sigaction.h", directory: "")
!137 = !{!138, !228, !238, !239}
!138 = !DIDerivedType(tag: DW_TAG_member, name: "__sigaction_handler", scope: !135, file: !136, line: 38, baseType: !139, size: 64)
!139 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !135, file: !136, line: 31, size: 64, elements: !140)
!140 = !{!141, !145}
!141 = !DIDerivedType(tag: DW_TAG_member, name: "sa_handler", scope: !139, file: !136, line: 34, baseType: !142, size: 64)
!142 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sighandler_t", file: !143, line: 72, baseType: !144)
!143 = !DIFile(filename: "/usr/include/signal.h", directory: "")
!144 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "sa_sigaction", scope: !139, file: !136, line: 36, baseType: !146, size: 64)
!146 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !147, size: 64)
!147 = !DISubroutineType(types: !148)
!148 = !{null, !23, !149, !184}
!149 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !150, size: 64)
!150 = !DIDerivedType(tag: DW_TAG_typedef, name: "siginfo_t", file: !151, line: 124, baseType: !152)
!151 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h", directory: "")
!152 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !151, line: 36, size: 1024, elements: !153)
!153 = !{!154, !155, !156, !157, !158}
!154 = !DIDerivedType(tag: DW_TAG_member, name: "si_signo", scope: !152, file: !151, line: 38, baseType: !23, size: 32)
!155 = !DIDerivedType(tag: DW_TAG_member, name: "si_errno", scope: !152, file: !151, line: 40, baseType: !23, size: 32, offset: 32)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "si_code", scope: !152, file: !151, line: 42, baseType: !23, size: 32, offset: 64)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !152, file: !151, line: 48, baseType: !23, size: 32, offset: 96)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "_sifields", scope: !152, file: !151, line: 123, baseType: !159, size: 896, offset: 128)
!159 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !152, file: !151, line: 51, size: 896, elements: !160)
!160 = !{!161, !165, !172, !185, !191, !201, !217, !222}
!161 = !DIDerivedType(tag: DW_TAG_member, name: "_pad", scope: !159, file: !151, line: 53, baseType: !162, size: 896)
!162 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 896, elements: !163)
!163 = !{!164}
!164 = !DISubrange(count: 28)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "_kill", scope: !159, file: !151, line: 60, baseType: !166, size: 64)
!166 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !159, file: !151, line: 56, size: 64, elements: !167)
!167 = !{!168, !170}
!168 = !DIDerivedType(tag: DW_TAG_member, name: "si_pid", scope: !166, file: !151, line: 58, baseType: !169, size: 32)
!169 = !DIDerivedType(tag: DW_TAG_typedef, name: "__pid_t", file: !81, line: 154, baseType: !23)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "si_uid", scope: !166, file: !151, line: 59, baseType: !171, size: 32, offset: 32)
!171 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !81, line: 146, baseType: !5)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "_timer", scope: !159, file: !151, line: 68, baseType: !173, size: 128)
!173 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !159, file: !151, line: 63, size: 128, elements: !174)
!174 = !{!175, !176, !177}
!175 = !DIDerivedType(tag: DW_TAG_member, name: "si_tid", scope: !173, file: !151, line: 65, baseType: !23, size: 32)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "si_overrun", scope: !173, file: !151, line: 66, baseType: !23, size: 32, offset: 32)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "si_sigval", scope: !173, file: !151, line: 67, baseType: !178, size: 64, offset: 64)
!178 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sigval_t", file: !179, line: 30, baseType: !180)
!179 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__sigval_t.h", directory: "")
!180 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "sigval", file: !179, line: 24, size: 64, elements: !181)
!181 = !{!182, !183}
!182 = !DIDerivedType(tag: DW_TAG_member, name: "sival_int", scope: !180, file: !179, line: 26, baseType: !23, size: 32)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "sival_ptr", scope: !180, file: !179, line: 27, baseType: !184, size: 64)
!184 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!185 = !DIDerivedType(tag: DW_TAG_member, name: "_rt", scope: !159, file: !151, line: 76, baseType: !186, size: 128)
!186 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !159, file: !151, line: 71, size: 128, elements: !187)
!187 = !{!188, !189, !190}
!188 = !DIDerivedType(tag: DW_TAG_member, name: "si_pid", scope: !186, file: !151, line: 73, baseType: !169, size: 32)
!189 = !DIDerivedType(tag: DW_TAG_member, name: "si_uid", scope: !186, file: !151, line: 74, baseType: !171, size: 32, offset: 32)
!190 = !DIDerivedType(tag: DW_TAG_member, name: "si_sigval", scope: !186, file: !151, line: 75, baseType: !178, size: 64, offset: 64)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "_sigchld", scope: !159, file: !151, line: 86, baseType: !192, size: 256)
!192 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !159, file: !151, line: 79, size: 256, elements: !193)
!193 = !{!194, !195, !196, !197, !200}
!194 = !DIDerivedType(tag: DW_TAG_member, name: "si_pid", scope: !192, file: !151, line: 81, baseType: !169, size: 32)
!195 = !DIDerivedType(tag: DW_TAG_member, name: "si_uid", scope: !192, file: !151, line: 82, baseType: !171, size: 32, offset: 32)
!196 = !DIDerivedType(tag: DW_TAG_member, name: "si_status", scope: !192, file: !151, line: 83, baseType: !23, size: 32, offset: 64)
!197 = !DIDerivedType(tag: DW_TAG_member, name: "si_utime", scope: !192, file: !151, line: 84, baseType: !198, size: 64, offset: 128)
!198 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !81, line: 156, baseType: !199)
!199 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "si_stime", scope: !192, file: !151, line: 85, baseType: !198, size: 64, offset: 192)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "_sigfault", scope: !159, file: !151, line: 105, baseType: !202, size: 256)
!202 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !159, file: !151, line: 89, size: 256, elements: !203)
!203 = !{!204, !205, !207}
!204 = !DIDerivedType(tag: DW_TAG_member, name: "si_addr", scope: !202, file: !151, line: 91, baseType: !184, size: 64)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "si_addr_lsb", scope: !202, file: !151, line: 93, baseType: !206, size: 16, offset: 64)
!206 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "_bounds", scope: !202, file: !151, line: 104, baseType: !208, size: 128, offset: 128)
!208 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !202, file: !151, line: 94, size: 128, elements: !209)
!209 = !{!210, !215}
!210 = !DIDerivedType(tag: DW_TAG_member, name: "_addr_bnd", scope: !208, file: !151, line: 101, baseType: !211, size: 128)
!211 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !208, file: !151, line: 97, size: 128, elements: !212)
!212 = !{!213, !214}
!213 = !DIDerivedType(tag: DW_TAG_member, name: "_lower", scope: !211, file: !151, line: 99, baseType: !184, size: 64)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "_upper", scope: !211, file: !151, line: 100, baseType: !184, size: 64, offset: 64)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "_pkey", scope: !208, file: !151, line: 103, baseType: !216, size: 32)
!216 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !81, line: 42, baseType: !5)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "_sigpoll", scope: !159, file: !151, line: 112, baseType: !218, size: 128)
!218 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !159, file: !151, line: 108, size: 128, elements: !219)
!219 = !{!220, !221}
!220 = !DIDerivedType(tag: DW_TAG_member, name: "si_band", scope: !218, file: !151, line: 110, baseType: !199, size: 64)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "si_fd", scope: !218, file: !151, line: 111, baseType: !23, size: 32, offset: 64)
!222 = !DIDerivedType(tag: DW_TAG_member, name: "_sigsys", scope: !159, file: !151, line: 121, baseType: !223, size: 128)
!223 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !159, file: !151, line: 116, size: 128, elements: !224)
!224 = !{!225, !226, !227}
!225 = !DIDerivedType(tag: DW_TAG_member, name: "_call_addr", scope: !223, file: !151, line: 118, baseType: !184, size: 64)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "_syscall", scope: !223, file: !151, line: 119, baseType: !23, size: 32, offset: 64)
!227 = !DIDerivedType(tag: DW_TAG_member, name: "_arch", scope: !223, file: !151, line: 120, baseType: !5, size: 32, offset: 96)
!228 = !DIDerivedType(tag: DW_TAG_member, name: "sa_mask", scope: !135, file: !136, line: 46, baseType: !229, size: 1024, offset: 64)
!229 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sigset_t", file: !230, line: 8, baseType: !231)
!230 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h", directory: "")
!231 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !230, line: 5, size: 1024, elements: !232)
!232 = !{!233}
!233 = !DIDerivedType(tag: DW_TAG_member, name: "__val", scope: !231, file: !230, line: 7, baseType: !234, size: 1024)
!234 = !DICompositeType(tag: DW_TAG_array_type, baseType: !235, size: 1024, elements: !236)
!235 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!236 = !{!237}
!237 = !DISubrange(count: 16)
!238 = !DIDerivedType(tag: DW_TAG_member, name: "sa_flags", scope: !135, file: !136, line: 49, baseType: !23, size: 32, offset: 1088)
!239 = !DIDerivedType(tag: DW_TAG_member, name: "sa_restorer", scope: !135, file: !136, line: 52, baseType: !240, size: 64, offset: 1152)
!240 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !241, size: 64)
!241 = !DISubroutineType(types: !242)
!242 = !{null}
!243 = !DILocation(line: 73, column: 22, scope: !113)
!244 = !DILocalVariable(name: "sock", scope: !113, file: !1, line: 74, type: !23)
!245 = !DILocation(line: 74, column: 9, scope: !113)
!246 = !DILocation(line: 77, column: 5, scope: !113)
!247 = !DILocation(line: 78, column: 11, scope: !113)
!248 = !DILocation(line: 78, column: 21, scope: !113)
!249 = !DILocation(line: 79, column: 11, scope: !113)
!250 = !DILocation(line: 79, column: 23, scope: !113)
!251 = !DILocation(line: 80, column: 11, scope: !113)
!252 = !DILocation(line: 80, column: 20, scope: !113)
!253 = !DILocation(line: 81, column: 10, scope: !254)
!254 = distinct !DILexicalBlock(scope: !113, file: !1, line: 81, column: 10)
!255 = !DILocation(line: 81, column: 52, scope: !254)
!256 = !DILocation(line: 81, column: 10, scope: !113)
!257 = !DILocation(line: 82, column: 9, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !1, line: 81, column: 59)
!259 = !DILocation(line: 83, column: 9, scope: !258)
!260 = !DILocation(line: 87, column: 25, scope: !261)
!261 = distinct !DILexicalBlock(scope: !113, file: !1, line: 87, column: 10)
!262 = !DILocation(line: 87, column: 30, scope: !261)
!263 = !DILocation(line: 87, column: 41, scope: !261)
!264 = !DILocation(line: 87, column: 46, scope: !261)
!265 = !DILocation(line: 87, column: 59, scope: !261)
!266 = !DILocation(line: 87, column: 64, scope: !261)
!267 = !DILocation(line: 87, column: 18, scope: !261)
!268 = !DILocation(line: 87, column: 16, scope: !261)
!269 = !DILocation(line: 87, column: 78, scope: !261)
!270 = !DILocation(line: 87, column: 10, scope: !113)
!271 = !DILocation(line: 88, column: 9, scope: !272)
!272 = distinct !DILexicalBlock(scope: !261, file: !1, line: 87, column: 86)
!273 = !DILocation(line: 89, column: 9, scope: !272)
!274 = !DILocation(line: 93, column: 8, scope: !113)
!275 = !DILocation(line: 93, column: 19, scope: !113)
!276 = !DILocation(line: 94, column: 21, scope: !113)
!277 = !DILocation(line: 94, column: 5, scope: !113)
!278 = !DILocation(line: 95, column: 8, scope: !113)
!279 = !DILocation(line: 95, column: 17, scope: !113)
!280 = !DILocation(line: 96, column: 10, scope: !281)
!281 = distinct !DILexicalBlock(scope: !113, file: !1, line: 96, column: 10)
!282 = !DILocation(line: 96, column: 40, scope: !281)
!283 = !DILocation(line: 96, column: 10, scope: !113)
!284 = !DILocation(line: 97, column: 9, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !1, line: 96, column: 48)
!286 = !DILocation(line: 98, column: 9, scope: !285)
!287 = !DILocation(line: 102, column: 15, scope: !288)
!288 = distinct !DILexicalBlock(scope: !113, file: !1, line: 102, column: 10)
!289 = !DILocation(line: 102, column: 21, scope: !288)
!290 = !DILocation(line: 102, column: 26, scope: !288)
!291 = !DILocation(line: 102, column: 35, scope: !288)
!292 = !DILocation(line: 102, column: 40, scope: !288)
!293 = !DILocation(line: 102, column: 10, scope: !288)
!294 = !DILocation(line: 102, column: 52, scope: !288)
!295 = !DILocation(line: 102, column: 10, scope: !113)
!296 = !DILocation(line: 103, column: 9, scope: !297)
!297 = distinct !DILexicalBlock(scope: !288, file: !1, line: 102, column: 59)
!298 = !DILocation(line: 104, column: 9, scope: !297)
!299 = !DILocation(line: 107, column: 18, scope: !113)
!300 = !DILocation(line: 107, column: 5, scope: !113)
!301 = !DILocation(line: 110, column: 17, scope: !302)
!302 = distinct !DILexicalBlock(scope: !113, file: !1, line: 110, column: 10)
!303 = !DILocation(line: 110, column: 10, scope: !302)
!304 = !DILocation(line: 110, column: 37, scope: !302)
!305 = !DILocation(line: 110, column: 10, scope: !113)
!306 = !DILocation(line: 111, column: 9, scope: !307)
!307 = distinct !DILexicalBlock(scope: !302, file: !1, line: 110, column: 44)
!308 = !DILocation(line: 112, column: 9, scope: !307)
!309 = !DILocation(line: 116, column: 30, scope: !113)
!310 = !DILocation(line: 116, column: 5, scope: !113)
!311 = !DILocation(line: 117, column: 5, scope: !113)
