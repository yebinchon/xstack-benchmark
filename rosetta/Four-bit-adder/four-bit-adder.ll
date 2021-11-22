; ModuleID = 'four-bit-adder.c'
source_filename = "four-bit-adder.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [47 x i8] c"%d%d%d%d + %d%d%d%d = %d%d%d%d, overflow = %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @halfadder(i8* %a, i8* %b, i8* %s, i8* %c) #0 !dbg !7 {
entry:
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %s.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %a, i8** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a.addr, metadata !15, metadata !DIExpression()), !dbg !16
  store i8* %b, i8** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b.addr, metadata !17, metadata !DIExpression()), !dbg !18
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !19, metadata !DIExpression()), !dbg !20
  store i8* %c, i8** %c.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %c.addr, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = load i8*, i8** %a.addr, align 8, !dbg !23
  %1 = load i8, i8* %0, align 1, !dbg !23
  %conv = sext i8 %1 to i32, !dbg !23
  %neg = xor i32 %conv, -1, !dbg !23
  %and = and i32 %neg, 1, !dbg !23
  %2 = load i8*, i8** %b.addr, align 8, !dbg !23
  %3 = load i8, i8* %2, align 1, !dbg !23
  %conv1 = sext i8 %3 to i32, !dbg !23
  %and2 = and i32 %and, %conv1, !dbg !23
  %4 = load i8*, i8** %a.addr, align 8, !dbg !23
  %5 = load i8, i8* %4, align 1, !dbg !23
  %conv3 = sext i8 %5 to i32, !dbg !23
  %6 = load i8*, i8** %b.addr, align 8, !dbg !23
  %7 = load i8, i8* %6, align 1, !dbg !23
  %conv4 = sext i8 %7 to i32, !dbg !23
  %neg5 = xor i32 %conv4, -1, !dbg !23
  %and6 = and i32 %neg5, 1, !dbg !23
  %and7 = and i32 %conv3, %and6, !dbg !23
  %or = or i32 %and2, %and7, !dbg !23
  %conv8 = trunc i32 %or to i8, !dbg !23
  %8 = load i8*, i8** %s.addr, align 8, !dbg !24
  store i8 %conv8, i8* %8, align 1, !dbg !25
  %9 = load i8*, i8** %a.addr, align 8, !dbg !26
  %10 = load i8, i8* %9, align 1, !dbg !26
  %conv9 = sext i8 %10 to i32, !dbg !26
  %11 = load i8*, i8** %b.addr, align 8, !dbg !27
  %12 = load i8, i8* %11, align 1, !dbg !27
  %conv10 = sext i8 %12 to i32, !dbg !27
  %and11 = and i32 %conv9, %conv10, !dbg !28
  %conv12 = trunc i32 %and11 to i8, !dbg !26
  %13 = load i8*, i8** %c.addr, align 8, !dbg !29
  store i8 %conv12, i8* %13, align 1, !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @fulladder(i8* %a, i8* %b, i8* %ic, i8* %s, i8* %oc) #0 !dbg !32 {
entry:
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %ic.addr = alloca i8*, align 8
  %s.addr = alloca i8*, align 8
  %oc.addr = alloca i8*, align 8
  %_ps = alloca i8, align 1
  %ps = alloca i8*, align 8
  %_pc = alloca i8, align 1
  %pc = alloca i8*, align 8
  %_tc = alloca i8, align 1
  %tc = alloca i8*, align 8
  store i8* %a, i8** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a.addr, metadata !35, metadata !DIExpression()), !dbg !36
  store i8* %b, i8** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b.addr, metadata !37, metadata !DIExpression()), !dbg !38
  store i8* %ic, i8** %ic.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %ic.addr, metadata !39, metadata !DIExpression()), !dbg !40
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !41, metadata !DIExpression()), !dbg !42
  store i8* %oc, i8** %oc.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %oc.addr, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i8* %_ps, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i8** %ps, metadata !47, metadata !DIExpression()), !dbg !46
  store i8* %_ps, i8** %ps, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i8* %_pc, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i8** %pc, metadata !50, metadata !DIExpression()), !dbg !49
  store i8* %_pc, i8** %pc, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata i8* %_tc, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i8** %tc, metadata !53, metadata !DIExpression()), !dbg !52
  store i8* %_tc, i8** %tc, align 8, !dbg !52
  %0 = load i8*, i8** %a.addr, align 8, !dbg !54
  %1 = load i8*, i8** %b.addr, align 8, !dbg !55
  %2 = load i8*, i8** %ps, align 8, !dbg !56
  %3 = load i8*, i8** %pc, align 8, !dbg !57
  call void @halfadder(i8* %0, i8* %1, i8* %2, i8* %3), !dbg !58
  %4 = load i8*, i8** %ps, align 8, !dbg !59
  %5 = load i8*, i8** %ic.addr, align 8, !dbg !60
  %6 = load i8*, i8** %s.addr, align 8, !dbg !61
  %7 = load i8*, i8** %tc, align 8, !dbg !62
  call void @halfadder(i8* %4, i8* %5, i8* %6, i8* %7), !dbg !63
  %8 = load i8*, i8** %tc, align 8, !dbg !64
  %9 = load i8, i8* %8, align 1, !dbg !64
  %conv = sext i8 %9 to i32, !dbg !64
  %10 = load i8*, i8** %pc, align 8, !dbg !65
  %11 = load i8, i8* %10, align 1, !dbg !65
  %conv1 = sext i8 %11 to i32, !dbg !65
  %or = or i32 %conv, %conv1, !dbg !66
  %conv2 = trunc i32 %or to i8, !dbg !64
  %12 = load i8*, i8** %oc.addr, align 8, !dbg !67
  store i8 %conv2, i8* %12, align 1, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @fourbitsadder(i8* %a0, i8* %a1, i8* %a2, i8* %a3, i8* %b0, i8* %b1, i8* %b2, i8* %b3, i8* %o0, i8* %o1, i8* %o2, i8* %o3, i8* %overflow) #0 !dbg !70 {
entry:
  %a0.addr = alloca i8*, align 8
  %a1.addr = alloca i8*, align 8
  %a2.addr = alloca i8*, align 8
  %a3.addr = alloca i8*, align 8
  %b0.addr = alloca i8*, align 8
  %b1.addr = alloca i8*, align 8
  %b2.addr = alloca i8*, align 8
  %b3.addr = alloca i8*, align 8
  %o0.addr = alloca i8*, align 8
  %o1.addr = alloca i8*, align 8
  %o2.addr = alloca i8*, align 8
  %o3.addr = alloca i8*, align 8
  %overflow.addr = alloca i8*, align 8
  %_zero = alloca i8, align 1
  %zero = alloca i8*, align 8
  %_tc0 = alloca i8, align 1
  %tc0 = alloca i8*, align 8
  %_tc1 = alloca i8, align 1
  %tc1 = alloca i8*, align 8
  %_tc2 = alloca i8, align 1
  %tc2 = alloca i8*, align 8
  store i8* %a0, i8** %a0.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a0.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8* %a1, i8** %a1.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a1.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8* %a2, i8** %a2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a2.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8* %a3, i8** %a3.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %a3.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8* %b0, i8** %b0.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b0.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8* %b1, i8** %b1.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b1.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8* %b2, i8** %b2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b2.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8* %b3, i8** %b3.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %b3.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8* %o0, i8** %o0.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %o0.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8* %o1, i8** %o1.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %o1.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8* %o2, i8** %o2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %o2.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8* %o3, i8** %o3.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %o3.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8* %overflow, i8** %overflow.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %overflow.addr, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i8* %_zero, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i8** %zero, metadata !101, metadata !DIExpression()), !dbg !100
  store i8* %_zero, i8** %zero, align 8, !dbg !100
  %0 = load i8*, i8** %zero, align 8, !dbg !102
  store i8 0, i8* %0, align 1, !dbg !103
  call void @llvm.dbg.declare(metadata i8* %_tc0, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i8** %tc0, metadata !106, metadata !DIExpression()), !dbg !105
  store i8* %_tc0, i8** %tc0, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i8* %_tc1, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i8** %tc1, metadata !109, metadata !DIExpression()), !dbg !108
  store i8* %_tc1, i8** %tc1, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i8* %_tc2, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i8** %tc2, metadata !112, metadata !DIExpression()), !dbg !111
  store i8* %_tc2, i8** %tc2, align 8, !dbg !111
  %1 = load i8*, i8** %a0.addr, align 8, !dbg !113
  %2 = load i8*, i8** %b0.addr, align 8, !dbg !114
  %3 = load i8*, i8** %zero, align 8, !dbg !115
  %4 = load i8*, i8** %o0.addr, align 8, !dbg !116
  %5 = load i8*, i8** %tc0, align 8, !dbg !117
  call void @fulladder(i8* %1, i8* %2, i8* %3, i8* %4, i8* %5), !dbg !118
  %6 = load i8*, i8** %a1.addr, align 8, !dbg !119
  %7 = load i8*, i8** %b1.addr, align 8, !dbg !120
  %8 = load i8*, i8** %tc0, align 8, !dbg !121
  %9 = load i8*, i8** %o1.addr, align 8, !dbg !122
  %10 = load i8*, i8** %tc1, align 8, !dbg !123
  call void @fulladder(i8* %6, i8* %7, i8* %8, i8* %9, i8* %10), !dbg !124
  %11 = load i8*, i8** %a2.addr, align 8, !dbg !125
  %12 = load i8*, i8** %b2.addr, align 8, !dbg !126
  %13 = load i8*, i8** %tc1, align 8, !dbg !127
  %14 = load i8*, i8** %o2.addr, align 8, !dbg !128
  %15 = load i8*, i8** %tc2, align 8, !dbg !129
  call void @fulladder(i8* %11, i8* %12, i8* %13, i8* %14, i8* %15), !dbg !130
  %16 = load i8*, i8** %a3.addr, align 8, !dbg !131
  %17 = load i8*, i8** %b3.addr, align 8, !dbg !132
  %18 = load i8*, i8** %tc2, align 8, !dbg !133
  %19 = load i8*, i8** %o3.addr, align 8, !dbg !134
  %20 = load i8*, i8** %overflow.addr, align 8, !dbg !135
  call void @fulladder(i8* %16, i8* %17, i8* %18, i8* %19, i8* %20), !dbg !136
  ret void, !dbg !137
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !138 {
entry:
  %retval = alloca i32, align 4
  %_a0 = alloca i8, align 1
  %a0 = alloca i8*, align 8
  %_a1 = alloca i8, align 1
  %a1 = alloca i8*, align 8
  %_a2 = alloca i8, align 1
  %a2 = alloca i8*, align 8
  %_a3 = alloca i8, align 1
  %a3 = alloca i8*, align 8
  %_b0 = alloca i8, align 1
  %b0 = alloca i8*, align 8
  %_b1 = alloca i8, align 1
  %b1 = alloca i8*, align 8
  %_b2 = alloca i8, align 1
  %b2 = alloca i8*, align 8
  %_b3 = alloca i8, align 1
  %b3 = alloca i8*, align 8
  %_s0 = alloca i8, align 1
  %s0 = alloca i8*, align 8
  %_s1 = alloca i8, align 1
  %s1 = alloca i8*, align 8
  %_s2 = alloca i8, align 1
  %s2 = alloca i8*, align 8
  %_s3 = alloca i8, align 1
  %s3 = alloca i8*, align 8
  %_overflow = alloca i8, align 1
  %overflow = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i8* %_a0, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i8** %a0, metadata !144, metadata !DIExpression()), !dbg !143
  store i8* %_a0, i8** %a0, align 8, !dbg !143
  call void @llvm.dbg.declare(metadata i8* %_a1, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i8** %a1, metadata !147, metadata !DIExpression()), !dbg !146
  store i8* %_a1, i8** %a1, align 8, !dbg !146
  call void @llvm.dbg.declare(metadata i8* %_a2, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata i8** %a2, metadata !150, metadata !DIExpression()), !dbg !149
  store i8* %_a2, i8** %a2, align 8, !dbg !149
  call void @llvm.dbg.declare(metadata i8* %_a3, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata i8** %a3, metadata !153, metadata !DIExpression()), !dbg !152
  store i8* %_a3, i8** %a3, align 8, !dbg !152
  call void @llvm.dbg.declare(metadata i8* %_b0, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata i8** %b0, metadata !156, metadata !DIExpression()), !dbg !155
  store i8* %_b0, i8** %b0, align 8, !dbg !155
  call void @llvm.dbg.declare(metadata i8* %_b1, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata i8** %b1, metadata !159, metadata !DIExpression()), !dbg !158
  store i8* %_b1, i8** %b1, align 8, !dbg !158
  call void @llvm.dbg.declare(metadata i8* %_b2, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata i8** %b2, metadata !162, metadata !DIExpression()), !dbg !161
  store i8* %_b2, i8** %b2, align 8, !dbg !161
  call void @llvm.dbg.declare(metadata i8* %_b3, metadata !163, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata i8** %b3, metadata !165, metadata !DIExpression()), !dbg !164
  store i8* %_b3, i8** %b3, align 8, !dbg !164
  call void @llvm.dbg.declare(metadata i8* %_s0, metadata !166, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata i8** %s0, metadata !168, metadata !DIExpression()), !dbg !167
  store i8* %_s0, i8** %s0, align 8, !dbg !167
  call void @llvm.dbg.declare(metadata i8* %_s1, metadata !169, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.declare(metadata i8** %s1, metadata !171, metadata !DIExpression()), !dbg !170
  store i8* %_s1, i8** %s1, align 8, !dbg !170
  call void @llvm.dbg.declare(metadata i8* %_s2, metadata !172, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.declare(metadata i8** %s2, metadata !174, metadata !DIExpression()), !dbg !173
  store i8* %_s2, i8** %s2, align 8, !dbg !173
  call void @llvm.dbg.declare(metadata i8* %_s3, metadata !175, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.declare(metadata i8** %s3, metadata !177, metadata !DIExpression()), !dbg !176
  store i8* %_s3, i8** %s3, align 8, !dbg !176
  call void @llvm.dbg.declare(metadata i8* %_overflow, metadata !178, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata i8** %overflow, metadata !180, metadata !DIExpression()), !dbg !179
  store i8* %_overflow, i8** %overflow, align 8, !dbg !179
  %0 = load i8*, i8** %a3, align 8, !dbg !181
  store i8 0, i8* %0, align 1, !dbg !182
  %1 = load i8*, i8** %b3, align 8, !dbg !183
  store i8 1, i8* %1, align 1, !dbg !184
  %2 = load i8*, i8** %a2, align 8, !dbg !185
  store i8 0, i8* %2, align 1, !dbg !186
  %3 = load i8*, i8** %b2, align 8, !dbg !187
  store i8 1, i8* %3, align 1, !dbg !188
  %4 = load i8*, i8** %a1, align 8, !dbg !189
  store i8 1, i8* %4, align 1, !dbg !190
  %5 = load i8*, i8** %b1, align 8, !dbg !191
  store i8 1, i8* %5, align 1, !dbg !192
  %6 = load i8*, i8** %a0, align 8, !dbg !193
  store i8 0, i8* %6, align 1, !dbg !194
  %7 = load i8*, i8** %b0, align 8, !dbg !195
  store i8 0, i8* %7, align 1, !dbg !196
  %8 = load i8*, i8** %a0, align 8, !dbg !197
  %9 = load i8*, i8** %a1, align 8, !dbg !198
  %10 = load i8*, i8** %a2, align 8, !dbg !199
  %11 = load i8*, i8** %a3, align 8, !dbg !200
  %12 = load i8*, i8** %b0, align 8, !dbg !201
  %13 = load i8*, i8** %b1, align 8, !dbg !202
  %14 = load i8*, i8** %b2, align 8, !dbg !203
  %15 = load i8*, i8** %b3, align 8, !dbg !204
  %16 = load i8*, i8** %s0, align 8, !dbg !205
  %17 = load i8*, i8** %s1, align 8, !dbg !206
  %18 = load i8*, i8** %s2, align 8, !dbg !207
  %19 = load i8*, i8** %s3, align 8, !dbg !208
  %20 = load i8*, i8** %overflow, align 8, !dbg !209
  call void @fourbitsadder(i8* %8, i8* %9, i8* %10, i8* %11, i8* %12, i8* %13, i8* %14, i8* %15, i8* %16, i8* %17, i8* %18, i8* %19, i8* %20), !dbg !210
  %21 = load i8*, i8** %a3, align 8, !dbg !211
  %22 = load i8, i8* %21, align 1, !dbg !211
  %conv = sext i8 %22 to i32, !dbg !211
  %23 = load i8*, i8** %a2, align 8, !dbg !212
  %24 = load i8, i8* %23, align 1, !dbg !212
  %conv1 = sext i8 %24 to i32, !dbg !212
  %25 = load i8*, i8** %a1, align 8, !dbg !213
  %26 = load i8, i8* %25, align 1, !dbg !213
  %conv2 = sext i8 %26 to i32, !dbg !213
  %27 = load i8*, i8** %a0, align 8, !dbg !214
  %28 = load i8, i8* %27, align 1, !dbg !214
  %conv3 = sext i8 %28 to i32, !dbg !214
  %29 = load i8*, i8** %b3, align 8, !dbg !215
  %30 = load i8, i8* %29, align 1, !dbg !215
  %conv4 = sext i8 %30 to i32, !dbg !215
  %31 = load i8*, i8** %b2, align 8, !dbg !216
  %32 = load i8, i8* %31, align 1, !dbg !216
  %conv5 = sext i8 %32 to i32, !dbg !216
  %33 = load i8*, i8** %b1, align 8, !dbg !217
  %34 = load i8, i8* %33, align 1, !dbg !217
  %conv6 = sext i8 %34 to i32, !dbg !217
  %35 = load i8*, i8** %b0, align 8, !dbg !218
  %36 = load i8, i8* %35, align 1, !dbg !218
  %conv7 = sext i8 %36 to i32, !dbg !218
  %37 = load i8*, i8** %s3, align 8, !dbg !219
  %38 = load i8, i8* %37, align 1, !dbg !219
  %conv8 = sext i8 %38 to i32, !dbg !219
  %39 = load i8*, i8** %s2, align 8, !dbg !220
  %40 = load i8, i8* %39, align 1, !dbg !220
  %conv9 = sext i8 %40 to i32, !dbg !220
  %41 = load i8*, i8** %s1, align 8, !dbg !221
  %42 = load i8, i8* %41, align 1, !dbg !221
  %conv10 = sext i8 %42 to i32, !dbg !221
  %43 = load i8*, i8** %s0, align 8, !dbg !222
  %44 = load i8, i8* %43, align 1, !dbg !222
  %conv11 = sext i8 %44 to i32, !dbg !222
  %45 = load i8*, i8** %overflow, align 8, !dbg !223
  %46 = load i8, i8* %45, align 1, !dbg !223
  %conv12 = sext i8 %46 to i32, !dbg !223
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str, i64 0, i64 0), i32 %conv, i32 %conv1, i32 %conv2, i32 %conv3, i32 %conv4, i32 %conv5, i32 %conv6, i32 %conv7, i32 %conv8, i32 %conv9, i32 %conv10, i32 %conv11, i32 %conv12), !dbg !224
  ret i32 0, !dbg !225
}

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "four-bit-adder.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Four-bit-adder")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "halfadder", scope: !1, file: !1, line: 16, type: !8, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10, !10, !14, !14}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "pin_t", file: !1, line: 3, baseType: !13)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!15 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 16, type: !10)
!16 = !DILocation(line: 16, column: 19, scope: !7)
!17 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 16, type: !10)
!18 = !DILocation(line: 16, column: 25, scope: !7)
!19 = !DILocalVariable(name: "s", arg: 3, scope: !7, file: !1, line: 16, type: !14)
!20 = !DILocation(line: 16, column: 32, scope: !7)
!21 = !DILocalVariable(name: "c", arg: 4, scope: !7, file: !1, line: 16, type: !14)
!22 = !DILocation(line: 16, column: 39, scope: !7)
!23 = !DILocation(line: 18, column: 10, scope: !7)
!24 = !DILocation(line: 18, column: 3, scope: !7)
!25 = !DILocation(line: 18, column: 8, scope: !7)
!26 = !DILocation(line: 19, column: 10, scope: !7)
!27 = !DILocation(line: 19, column: 17, scope: !7)
!28 = !DILocation(line: 19, column: 15, scope: !7)
!29 = !DILocation(line: 19, column: 3, scope: !7)
!30 = !DILocation(line: 19, column: 8, scope: !7)
!31 = !DILocation(line: 20, column: 1, scope: !7)
!32 = distinct !DISubprogram(name: "fulladder", scope: !1, file: !1, line: 22, type: !33, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{null, !10, !10, !10, !14, !14}
!35 = !DILocalVariable(name: "a", arg: 1, scope: !32, file: !1, line: 22, type: !10)
!36 = !DILocation(line: 22, column: 19, scope: !32)
!37 = !DILocalVariable(name: "b", arg: 2, scope: !32, file: !1, line: 22, type: !10)
!38 = !DILocation(line: 22, column: 25, scope: !32)
!39 = !DILocalVariable(name: "ic", arg: 3, scope: !32, file: !1, line: 22, type: !10)
!40 = !DILocation(line: 22, column: 31, scope: !32)
!41 = !DILocalVariable(name: "s", arg: 4, scope: !32, file: !1, line: 22, type: !14)
!42 = !DILocation(line: 22, column: 39, scope: !32)
!43 = !DILocalVariable(name: "oc", arg: 5, scope: !32, file: !1, line: 22, type: !14)
!44 = !DILocation(line: 22, column: 46, scope: !32)
!45 = !DILocalVariable(name: "_ps", scope: !32, file: !1, line: 24, type: !12)
!46 = !DILocation(line: 24, column: 3, scope: !32)
!47 = !DILocalVariable(name: "ps", scope: !32, file: !1, line: 24, type: !14)
!48 = !DILocalVariable(name: "_pc", scope: !32, file: !1, line: 24, type: !12)
!49 = !DILocation(line: 24, column: 12, scope: !32)
!50 = !DILocalVariable(name: "pc", scope: !32, file: !1, line: 24, type: !14)
!51 = !DILocalVariable(name: "_tc", scope: !32, file: !1, line: 24, type: !12)
!52 = !DILocation(line: 24, column: 21, scope: !32)
!53 = !DILocalVariable(name: "tc", scope: !32, file: !1, line: 24, type: !14)
!54 = !DILocation(line: 26, column: 22, scope: !32)
!55 = !DILocation(line: 26, column: 25, scope: !32)
!56 = !DILocation(line: 26, column: 38, scope: !32)
!57 = !DILocation(line: 26, column: 42, scope: !32)
!58 = !DILocation(line: 26, column: 3, scope: !32)
!59 = !DILocation(line: 27, column: 22, scope: !32)
!60 = !DILocation(line: 27, column: 26, scope: !32)
!61 = !DILocation(line: 27, column: 40, scope: !32)
!62 = !DILocation(line: 27, column: 43, scope: !32)
!63 = !DILocation(line: 27, column: 3, scope: !32)
!64 = !DILocation(line: 28, column: 11, scope: !32)
!65 = !DILocation(line: 28, column: 19, scope: !32)
!66 = !DILocation(line: 28, column: 17, scope: !32)
!67 = !DILocation(line: 28, column: 3, scope: !32)
!68 = !DILocation(line: 28, column: 9, scope: !32)
!69 = !DILocation(line: 29, column: 1, scope: !32)
!70 = distinct !DISubprogram(name: "fourbitsadder", scope: !1, file: !1, line: 31, type: !71, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{null, !10, !10, !10, !10, !10, !10, !10, !10, !14, !14, !14, !14, !14}
!73 = !DILocalVariable(name: "a0", arg: 1, scope: !70, file: !1, line: 31, type: !10)
!74 = !DILocation(line: 31, column: 23, scope: !70)
!75 = !DILocalVariable(name: "a1", arg: 2, scope: !70, file: !1, line: 31, type: !10)
!76 = !DILocation(line: 31, column: 30, scope: !70)
!77 = !DILocalVariable(name: "a2", arg: 3, scope: !70, file: !1, line: 31, type: !10)
!78 = !DILocation(line: 31, column: 37, scope: !70)
!79 = !DILocalVariable(name: "a3", arg: 4, scope: !70, file: !1, line: 31, type: !10)
!80 = !DILocation(line: 31, column: 44, scope: !70)
!81 = !DILocalVariable(name: "b0", arg: 5, scope: !70, file: !1, line: 32, type: !10)
!82 = !DILocation(line: 32, column: 9, scope: !70)
!83 = !DILocalVariable(name: "b1", arg: 6, scope: !70, file: !1, line: 32, type: !10)
!84 = !DILocation(line: 32, column: 16, scope: !70)
!85 = !DILocalVariable(name: "b2", arg: 7, scope: !70, file: !1, line: 32, type: !10)
!86 = !DILocation(line: 32, column: 23, scope: !70)
!87 = !DILocalVariable(name: "b3", arg: 8, scope: !70, file: !1, line: 32, type: !10)
!88 = !DILocation(line: 32, column: 30, scope: !70)
!89 = !DILocalVariable(name: "o0", arg: 9, scope: !70, file: !1, line: 33, type: !14)
!90 = !DILocation(line: 33, column: 10, scope: !70)
!91 = !DILocalVariable(name: "o1", arg: 10, scope: !70, file: !1, line: 33, type: !14)
!92 = !DILocation(line: 33, column: 18, scope: !70)
!93 = !DILocalVariable(name: "o2", arg: 11, scope: !70, file: !1, line: 33, type: !14)
!94 = !DILocation(line: 33, column: 26, scope: !70)
!95 = !DILocalVariable(name: "o3", arg: 12, scope: !70, file: !1, line: 33, type: !14)
!96 = !DILocation(line: 33, column: 34, scope: !70)
!97 = !DILocalVariable(name: "overflow", arg: 13, scope: !70, file: !1, line: 34, type: !14)
!98 = !DILocation(line: 34, column: 10, scope: !70)
!99 = !DILocalVariable(name: "_zero", scope: !70, file: !1, line: 36, type: !12)
!100 = !DILocation(line: 36, column: 3, scope: !70)
!101 = !DILocalVariable(name: "zero", scope: !70, file: !1, line: 36, type: !14)
!102 = !DILocation(line: 36, column: 14, scope: !70)
!103 = !DILocation(line: 36, column: 22, scope: !70)
!104 = !DILocalVariable(name: "_tc0", scope: !70, file: !1, line: 37, type: !12)
!105 = !DILocation(line: 37, column: 3, scope: !70)
!106 = !DILocalVariable(name: "tc0", scope: !70, file: !1, line: 37, type: !14)
!107 = !DILocalVariable(name: "_tc1", scope: !70, file: !1, line: 37, type: !12)
!108 = !DILocation(line: 37, column: 13, scope: !70)
!109 = !DILocalVariable(name: "tc1", scope: !70, file: !1, line: 37, type: !14)
!110 = !DILocalVariable(name: "_tc2", scope: !70, file: !1, line: 37, type: !12)
!111 = !DILocation(line: 37, column: 23, scope: !70)
!112 = !DILocalVariable(name: "tc2", scope: !70, file: !1, line: 37, type: !14)
!113 = !DILocation(line: 39, column: 22, scope: !70)
!114 = !DILocation(line: 39, column: 26, scope: !70)
!115 = !DILocation(line: 39, column: 30, scope: !70)
!116 = !DILocation(line: 39, column: 46, scope: !70)
!117 = !DILocation(line: 39, column: 50, scope: !70)
!118 = !DILocation(line: 39, column: 3, scope: !70)
!119 = !DILocation(line: 40, column: 22, scope: !70)
!120 = !DILocation(line: 40, column: 26, scope: !70)
!121 = !DILocation(line: 40, column: 30, scope: !70)
!122 = !DILocation(line: 40, column: 46, scope: !70)
!123 = !DILocation(line: 40, column: 50, scope: !70)
!124 = !DILocation(line: 40, column: 3, scope: !70)
!125 = !DILocation(line: 41, column: 22, scope: !70)
!126 = !DILocation(line: 41, column: 26, scope: !70)
!127 = !DILocation(line: 41, column: 30, scope: !70)
!128 = !DILocation(line: 41, column: 46, scope: !70)
!129 = !DILocation(line: 41, column: 50, scope: !70)
!130 = !DILocation(line: 41, column: 3, scope: !70)
!131 = !DILocation(line: 42, column: 22, scope: !70)
!132 = !DILocation(line: 42, column: 26, scope: !70)
!133 = !DILocation(line: 42, column: 30, scope: !70)
!134 = !DILocation(line: 42, column: 46, scope: !70)
!135 = !DILocation(line: 42, column: 50, scope: !70)
!136 = !DILocation(line: 42, column: 3, scope: !70)
!137 = !DILocation(line: 43, column: 1, scope: !70)
!138 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 46, type: !139, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!139 = !DISubroutineType(types: !140)
!140 = !{!141}
!141 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!142 = !DILocalVariable(name: "_a0", scope: !138, file: !1, line: 48, type: !12)
!143 = !DILocation(line: 48, column: 3, scope: !138)
!144 = !DILocalVariable(name: "a0", scope: !138, file: !1, line: 48, type: !14)
!145 = !DILocalVariable(name: "_a1", scope: !138, file: !1, line: 48, type: !12)
!146 = !DILocation(line: 48, column: 12, scope: !138)
!147 = !DILocalVariable(name: "a1", scope: !138, file: !1, line: 48, type: !14)
!148 = !DILocalVariable(name: "_a2", scope: !138, file: !1, line: 48, type: !12)
!149 = !DILocation(line: 48, column: 21, scope: !138)
!150 = !DILocalVariable(name: "a2", scope: !138, file: !1, line: 48, type: !14)
!151 = !DILocalVariable(name: "_a3", scope: !138, file: !1, line: 48, type: !12)
!152 = !DILocation(line: 48, column: 30, scope: !138)
!153 = !DILocalVariable(name: "a3", scope: !138, file: !1, line: 48, type: !14)
!154 = !DILocalVariable(name: "_b0", scope: !138, file: !1, line: 49, type: !12)
!155 = !DILocation(line: 49, column: 3, scope: !138)
!156 = !DILocalVariable(name: "b0", scope: !138, file: !1, line: 49, type: !14)
!157 = !DILocalVariable(name: "_b1", scope: !138, file: !1, line: 49, type: !12)
!158 = !DILocation(line: 49, column: 12, scope: !138)
!159 = !DILocalVariable(name: "b1", scope: !138, file: !1, line: 49, type: !14)
!160 = !DILocalVariable(name: "_b2", scope: !138, file: !1, line: 49, type: !12)
!161 = !DILocation(line: 49, column: 21, scope: !138)
!162 = !DILocalVariable(name: "b2", scope: !138, file: !1, line: 49, type: !14)
!163 = !DILocalVariable(name: "_b3", scope: !138, file: !1, line: 49, type: !12)
!164 = !DILocation(line: 49, column: 30, scope: !138)
!165 = !DILocalVariable(name: "b3", scope: !138, file: !1, line: 49, type: !14)
!166 = !DILocalVariable(name: "_s0", scope: !138, file: !1, line: 50, type: !12)
!167 = !DILocation(line: 50, column: 3, scope: !138)
!168 = !DILocalVariable(name: "s0", scope: !138, file: !1, line: 50, type: !14)
!169 = !DILocalVariable(name: "_s1", scope: !138, file: !1, line: 50, type: !12)
!170 = !DILocation(line: 50, column: 12, scope: !138)
!171 = !DILocalVariable(name: "s1", scope: !138, file: !1, line: 50, type: !14)
!172 = !DILocalVariable(name: "_s2", scope: !138, file: !1, line: 50, type: !12)
!173 = !DILocation(line: 50, column: 21, scope: !138)
!174 = !DILocalVariable(name: "s2", scope: !138, file: !1, line: 50, type: !14)
!175 = !DILocalVariable(name: "_s3", scope: !138, file: !1, line: 50, type: !12)
!176 = !DILocation(line: 50, column: 30, scope: !138)
!177 = !DILocalVariable(name: "s3", scope: !138, file: !1, line: 50, type: !14)
!178 = !DILocalVariable(name: "_overflow", scope: !138, file: !1, line: 51, type: !12)
!179 = !DILocation(line: 51, column: 3, scope: !138)
!180 = !DILocalVariable(name: "overflow", scope: !138, file: !1, line: 51, type: !14)
!181 = !DILocation(line: 53, column: 3, scope: !138)
!182 = !DILocation(line: 53, column: 9, scope: !138)
!183 = !DILocation(line: 53, column: 14, scope: !138)
!184 = !DILocation(line: 53, column: 20, scope: !138)
!185 = !DILocation(line: 54, column: 3, scope: !138)
!186 = !DILocation(line: 54, column: 9, scope: !138)
!187 = !DILocation(line: 54, column: 14, scope: !138)
!188 = !DILocation(line: 54, column: 20, scope: !138)
!189 = !DILocation(line: 55, column: 3, scope: !138)
!190 = !DILocation(line: 55, column: 9, scope: !138)
!191 = !DILocation(line: 55, column: 14, scope: !138)
!192 = !DILocation(line: 55, column: 20, scope: !138)
!193 = !DILocation(line: 56, column: 3, scope: !138)
!194 = !DILocation(line: 56, column: 9, scope: !138)
!195 = !DILocation(line: 56, column: 14, scope: !138)
!196 = !DILocation(line: 56, column: 20, scope: !138)
!197 = !DILocation(line: 58, column: 17, scope: !138)
!198 = !DILocation(line: 58, column: 21, scope: !138)
!199 = !DILocation(line: 58, column: 25, scope: !138)
!200 = !DILocation(line: 58, column: 29, scope: !138)
!201 = !DILocation(line: 59, column: 3, scope: !138)
!202 = !DILocation(line: 59, column: 7, scope: !138)
!203 = !DILocation(line: 59, column: 11, scope: !138)
!204 = !DILocation(line: 59, column: 15, scope: !138)
!205 = !DILocation(line: 60, column: 3, scope: !138)
!206 = !DILocation(line: 60, column: 7, scope: !138)
!207 = !DILocation(line: 60, column: 11, scope: !138)
!208 = !DILocation(line: 60, column: 15, scope: !138)
!209 = !DILocation(line: 61, column: 3, scope: !138)
!210 = !DILocation(line: 58, column: 3, scope: !138)
!211 = !DILocation(line: 64, column: 3, scope: !138)
!212 = !DILocation(line: 64, column: 10, scope: !138)
!213 = !DILocation(line: 64, column: 17, scope: !138)
!214 = !DILocation(line: 64, column: 24, scope: !138)
!215 = !DILocation(line: 65, column: 3, scope: !138)
!216 = !DILocation(line: 65, column: 10, scope: !138)
!217 = !DILocation(line: 65, column: 17, scope: !138)
!218 = !DILocation(line: 65, column: 24, scope: !138)
!219 = !DILocation(line: 66, column: 3, scope: !138)
!220 = !DILocation(line: 66, column: 10, scope: !138)
!221 = !DILocation(line: 66, column: 17, scope: !138)
!222 = !DILocation(line: 66, column: 24, scope: !138)
!223 = !DILocation(line: 67, column: 3, scope: !138)
!224 = !DILocation(line: 63, column: 3, scope: !138)
!225 = !DILocation(line: 69, column: 3, scope: !138)
