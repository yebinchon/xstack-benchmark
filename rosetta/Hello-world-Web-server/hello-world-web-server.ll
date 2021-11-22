; ModuleID = 'hello-world-web-server.c'
source_filename = "hello-world-web-server.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@response = dso_local global [300 x i8] c"HTTP/1.1 200 OK\0D\0AContent-Type: text/html; charset=UTF-8\0D\0A\0D\0A<!DOCTYPE html><html><head><title>Bye-bye baby bye-bye</title><style>body { background-color: #111 }h1 { font-size:4cm; text-align: center; color: black; text-shadow: 0 0 2mm red}</style></head><body><h1>Goodbye, world!</h1></body></html>\0D\0A\00", align 16, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"can't open socket\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"Can't bind\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"got connection\0A\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"Can't accept\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %one = alloca i32, align 4
  %client_fd = alloca i32, align 4
  %svr_addr = alloca %struct.sockaddr_in, align 4
  %cli_addr = alloca %struct.sockaddr_in, align 4
  %sin_len = alloca i32, align 4
  %sock = alloca i32, align 4
  %port = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %one, metadata !51, metadata !DIExpression()), !dbg !52
  store i32 1, i32* %one, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata i32* %client_fd, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %svr_addr, metadata !55, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %cli_addr, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32* %sin_len, metadata !75, metadata !DIExpression()), !dbg !79
  store i32 16, i32* %sin_len, align 4, !dbg !79
  call void @llvm.dbg.declare(metadata i32* %sock, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i32 @socket(i32 2, i32 1, i32 0) #6, !dbg !82
  store i32 %call, i32* %sock, align 4, !dbg !81
  %0 = load i32, i32* %sock, align 4, !dbg !83
  %cmp = icmp slt i32 %0, 0, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86, !cf.info !87

if.then:                                          ; preds = %entry
  call void (i32, i8*, ...) @err(i32 1, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)) #7, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %sock, align 4, !dbg !89
  %2 = bitcast i32* %one to i8*, !dbg !90
  %call1 = call i32 @setsockopt(i32 %1, i32 1, i32 2, i8* %2, i32 4) #6, !dbg !91
  call void @llvm.dbg.declare(metadata i32* %port, metadata !92, metadata !DIExpression()), !dbg !93
  store i32 8080, i32* %port, align 4, !dbg !93
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %svr_addr, i32 0, i32 0, !dbg !94
  store i16 2, i16* %sin_family, align 4, !dbg !95
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %svr_addr, i32 0, i32 2, !dbg !96
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !97
  store i32 0, i32* %s_addr, align 4, !dbg !98
  %3 = load i32, i32* %port, align 4, !dbg !99
  %conv = trunc i32 %3 to i16, !dbg !99
  %call2 = call zeroext i16 @htons(i16 zeroext %conv) #8, !dbg !100
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %svr_addr, i32 0, i32 1, !dbg !101
  store i16 %call2, i16* %sin_port, align 2, !dbg !102
  %4 = load i32, i32* %sock, align 4, !dbg !103
  %5 = bitcast %struct.sockaddr_in* %svr_addr to %struct.sockaddr*, !dbg !105
  %call3 = call i32 @bind(i32 %4, %struct.sockaddr* %5, i32 16) #6, !dbg !106
  %cmp4 = icmp eq i32 %call3, -1, !dbg !107
  br i1 %cmp4, label %if.then6, label %if.end8, !dbg !108, !cf.info !87

if.then6:                                         ; preds = %if.end
  %6 = load i32, i32* %sock, align 4, !dbg !109
  %call7 = call i32 @close(i32 %6), !dbg !111
  call void (i32, i8*, ...) @err(i32 1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0)) #7, !dbg !112
  unreachable, !dbg !112

if.end8:                                          ; preds = %if.end
  %7 = load i32, i32* %sock, align 4, !dbg !113
  %call9 = call i32 @listen(i32 %7, i32 5) #6, !dbg !114
  br label %while.body, !dbg !115

while.body:                                       ; preds = %if.end8, %if.then14, %if.end15
  %8 = load i32, i32* %sock, align 4, !dbg !116
  %9 = bitcast %struct.sockaddr_in* %cli_addr to %struct.sockaddr*, !dbg !118
  %call10 = call i32 @accept(i32 %8, %struct.sockaddr* %9, i32* %sin_len), !dbg !119
  store i32 %call10, i32* %client_fd, align 4, !dbg !120
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !121
  %10 = load i32, i32* %client_fd, align 4, !dbg !122
  %cmp12 = icmp eq i32 %10, -1, !dbg !124
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !125, !cf.info !87

if.then14:                                        ; preds = %while.body
  call void @perror(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0)), !dbg !126
  br label %while.body, !dbg !128, !llvm.loop !129

if.end15:                                         ; preds = %while.body
  %11 = load i32, i32* %client_fd, align 4, !dbg !131
  %call16 = call i64 @write(i32 %11, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @response, i64 0, i64 0), i64 299), !dbg !132
  %12 = load i32, i32* %client_fd, align 4, !dbg !133
  %call17 = call i32 @close(i32 %12), !dbg !134
  br label %while.body, !dbg !115, !llvm.loop !129
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #2

; Function Attrs: noreturn
declare dso_local void @err(i32, i8*, ...) #3

; Function Attrs: nounwind
declare dso_local i32 @setsockopt(i32, i32, i32, i8*, i32) #2

; Function Attrs: nounwind readnone
declare dso_local zeroext i16 @htons(i16 zeroext) #4

; Function Attrs: nounwind
declare dso_local i32 @bind(i32, %struct.sockaddr*, i32) #2

declare dso_local i32 @close(i32) #5

; Function Attrs: nounwind
declare dso_local i32 @listen(i32, i32) #2

declare dso_local i32 @accept(i32, %struct.sockaddr*, i32*) #5

declare dso_local i32 @printf(i8*, ...) #5

declare dso_local void @perror(i8*) #5

declare dso_local i64 @write(i32, i8*, i64) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn }
attributes #8 = { nounwind readnone }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!42, !43, !44}
!llvm.ident = !{!45}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "response", scope: !2, file: !3, line: 11, type: !39, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !18, globals: !38, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "hello-world-web-server.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Hello-world-Web-server")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "__socket_type", file: !6, line: 24, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket_type.h", directory: "")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13, !14, !15, !16, !17}
!9 = !DIEnumerator(name: "SOCK_STREAM", value: 1, isUnsigned: true)
!10 = !DIEnumerator(name: "SOCK_DGRAM", value: 2, isUnsigned: true)
!11 = !DIEnumerator(name: "SOCK_RAW", value: 3, isUnsigned: true)
!12 = !DIEnumerator(name: "SOCK_RDM", value: 4, isUnsigned: true)
!13 = !DIEnumerator(name: "SOCK_SEQPACKET", value: 5, isUnsigned: true)
!14 = !DIEnumerator(name: "SOCK_DCCP", value: 6, isUnsigned: true)
!15 = !DIEnumerator(name: "SOCK_PACKET", value: 10, isUnsigned: true)
!16 = !DIEnumerator(name: "SOCK_CLOEXEC", value: 524288, isUnsigned: true)
!17 = !DIEnumerator(name: "SOCK_NONBLOCK", value: 2048, isUnsigned: true)
!18 = !{!19, !25}
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !20, line: 30, baseType: !21)
!20 = !DIFile(filename: "/usr/include/netinet/in.h", directory: "")
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !22, line: 26, baseType: !23)
!22 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !24, line: 42, baseType: !7)
!24 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !27, line: 178, size: 128, elements: !28)
!27 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!28 = !{!29, !33}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !26, file: !27, line: 180, baseType: !30, size: 16)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !31, line: 28, baseType: !32)
!31 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!32 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !26, file: !27, line: 181, baseType: !34, size: 112, offset: 16)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 112, elements: !36)
!35 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!36 = !{!37}
!37 = !DISubrange(count: 14)
!38 = !{!0}
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 2400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 300)
!42 = !{i32 7, !"Dwarf Version", i32 4}
!43 = !{i32 2, !"Debug Info Version", i32 3}
!44 = !{i32 1, !"wchar_size", i32 4}
!45 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!46 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 19, type: !47, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !50)
!47 = !DISubroutineType(types: !48)
!48 = !{!49}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !{}
!51 = !DILocalVariable(name: "one", scope: !46, file: !3, line: 21, type: !49)
!52 = !DILocation(line: 21, column: 7, scope: !46)
!53 = !DILocalVariable(name: "client_fd", scope: !46, file: !3, line: 21, type: !49)
!54 = !DILocation(line: 21, column: 16, scope: !46)
!55 = !DILocalVariable(name: "svr_addr", scope: !46, file: !3, line: 22, type: !56)
!56 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !20, line: 238, size: 128, elements: !57)
!57 = !{!58, !59, !63, !67}
!58 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !56, file: !20, line: 240, baseType: !30, size: 16)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !56, file: !20, line: 241, baseType: !60, size: 16, offset: 16)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !20, line: 119, baseType: !61)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !22, line: 25, baseType: !62)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !24, line: 40, baseType: !32)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !56, file: !20, line: 242, baseType: !64, size: 32, offset: 32)
!64 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !20, line: 31, size: 32, elements: !65)
!65 = !{!66}
!66 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !64, file: !20, line: 33, baseType: !19, size: 32)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !56, file: !20, line: 245, baseType: !68, size: 64, offset: 64)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 64, elements: !70)
!69 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!70 = !{!71}
!71 = !DISubrange(count: 8)
!72 = !DILocation(line: 22, column: 22, scope: !46)
!73 = !DILocalVariable(name: "cli_addr", scope: !46, file: !3, line: 22, type: !56)
!74 = !DILocation(line: 22, column: 32, scope: !46)
!75 = !DILocalVariable(name: "sin_len", scope: !46, file: !3, line: 23, type: !76)
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "socklen_t", file: !77, line: 274, baseType: !78)
!77 = !DIFile(filename: "/usr/include/unistd.h", directory: "")
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "__socklen_t", file: !24, line: 209, baseType: !7)
!79 = !DILocation(line: 23, column: 13, scope: !46)
!80 = !DILocalVariable(name: "sock", scope: !46, file: !3, line: 25, type: !49)
!81 = !DILocation(line: 25, column: 7, scope: !46)
!82 = !DILocation(line: 25, column: 14, scope: !46)
!83 = !DILocation(line: 26, column: 7, scope: !84)
!84 = distinct !DILexicalBlock(scope: !46, file: !3, line: 26, column: 7)
!85 = !DILocation(line: 26, column: 12, scope: !84)
!86 = !DILocation(line: 26, column: 7, scope: !46)
!87 = !{!"if"}
!88 = !DILocation(line: 27, column: 5, scope: !84)
!89 = !DILocation(line: 29, column: 14, scope: !46)
!90 = !DILocation(line: 29, column: 46, scope: !46)
!91 = !DILocation(line: 29, column: 3, scope: !46)
!92 = !DILocalVariable(name: "port", scope: !46, file: !3, line: 31, type: !49)
!93 = !DILocation(line: 31, column: 7, scope: !46)
!94 = !DILocation(line: 32, column: 12, scope: !46)
!95 = !DILocation(line: 32, column: 23, scope: !46)
!96 = !DILocation(line: 33, column: 12, scope: !46)
!97 = !DILocation(line: 33, column: 21, scope: !46)
!98 = !DILocation(line: 33, column: 28, scope: !46)
!99 = !DILocation(line: 34, column: 29, scope: !46)
!100 = !DILocation(line: 34, column: 23, scope: !46)
!101 = !DILocation(line: 34, column: 12, scope: !46)
!102 = !DILocation(line: 34, column: 21, scope: !46)
!103 = !DILocation(line: 36, column: 12, scope: !104)
!104 = distinct !DILexicalBlock(scope: !46, file: !3, line: 36, column: 7)
!105 = !DILocation(line: 36, column: 18, scope: !104)
!106 = !DILocation(line: 36, column: 7, scope: !104)
!107 = !DILocation(line: 36, column: 67, scope: !104)
!108 = !DILocation(line: 36, column: 7, scope: !46)
!109 = !DILocation(line: 37, column: 11, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !3, line: 36, column: 74)
!111 = !DILocation(line: 37, column: 5, scope: !110)
!112 = !DILocation(line: 38, column: 5, scope: !110)
!113 = !DILocation(line: 41, column: 10, scope: !46)
!114 = !DILocation(line: 41, column: 3, scope: !46)
!115 = !DILocation(line: 42, column: 3, scope: !46)
!116 = !DILocation(line: 43, column: 24, scope: !117)
!117 = distinct !DILexicalBlock(scope: !46, file: !3, line: 42, column: 13)
!118 = !DILocation(line: 43, column: 30, scope: !117)
!119 = !DILocation(line: 43, column: 17, scope: !117)
!120 = !DILocation(line: 43, column: 15, scope: !117)
!121 = !DILocation(line: 44, column: 5, scope: !117)
!122 = !DILocation(line: 46, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !117, file: !3, line: 46, column: 9)
!124 = !DILocation(line: 46, column: 19, scope: !123)
!125 = !DILocation(line: 46, column: 9, scope: !117)
!126 = !DILocation(line: 47, column: 7, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !3, line: 46, column: 26)
!128 = !DILocation(line: 48, column: 7, scope: !127)
!129 = distinct !{!129, !115, !130}
!130 = !DILocation(line: 53, column: 3, scope: !46)
!131 = !DILocation(line: 51, column: 11, scope: !117)
!132 = !DILocation(line: 51, column: 5, scope: !117)
!133 = !DILocation(line: 52, column: 11, scope: !117)
!134 = !DILocation(line: 52, column: 5, scope: !117)
