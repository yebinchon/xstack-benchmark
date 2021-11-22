; ModuleID = 'arithmetic-rational.c'
source_filename = "arithmetic-rational.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.frac = type { i64, i64 }

@.str = private unnamed_addr constant [27 x i8] c"divide by zero: %lld/%lld\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @gcd(i64 %m, i64 %n) #0 !dbg !9 {
entry:
  %m.addr = alloca i64, align 8
  %n.addr = alloca i64, align 8
  %t = alloca i64, align 8
  store i64 %m, i64* %m.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %m.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i64* %t, metadata !18, metadata !DIExpression()), !dbg !19
  br label %while.cond, !dbg !20

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i64, i64* %n.addr, align 8, !dbg !21
  %tobool = icmp ne i64 %0, 0, !dbg !20
  br i1 %tobool, label %while.body, label %while.end, !dbg !20

while.body:                                       ; preds = %while.cond
  %1 = load i64, i64* %n.addr, align 8, !dbg !22
  store i64 %1, i64* %t, align 8, !dbg !24
  %2 = load i64, i64* %m.addr, align 8, !dbg !25
  %3 = load i64, i64* %n.addr, align 8, !dbg !26
  %rem = srem i64 %2, %3, !dbg !27
  store i64 %rem, i64* %n.addr, align 8, !dbg !28
  %4 = load i64, i64* %t, align 8, !dbg !29
  store i64 %4, i64* %m.addr, align 8, !dbg !30
  br label %while.cond, !dbg !20, !llvm.loop !31

while.end:                                        ; preds = %while.cond
  %5 = load i64, i64* %m.addr, align 8, !dbg !33
  ret i64 %5, !dbg !34
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i64 } @frac_new(i64 %num, i64 %den) #0 !dbg !35 {
entry:
  %retval = alloca %struct.frac, align 8
  %num.addr = alloca i64, align 8
  %den.addr = alloca i64, align 8
  %g = alloca i32, align 4
  store i64 %num, i64* %num.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %num.addr, metadata !43, metadata !DIExpression()), !dbg !44
  store i64 %den, i64* %den.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %den.addr, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata %struct.frac* %retval, metadata !47, metadata !DIExpression()), !dbg !48
  %0 = load i64, i64* %den.addr, align 8, !dbg !49
  %tobool = icmp ne i64 %0, 0, !dbg !49
  br i1 %tobool, label %if.end, label %if.then, !dbg !51, !cf.info !52

if.then:                                          ; preds = %entry
  %1 = load i64, i64* %num.addr, align 8, !dbg !53
  %2 = load i64, i64* %den.addr, align 8, !dbg !55
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i64 0, i64 0), i64 %1, i64 %2), !dbg !56
  call void @abort() #5, !dbg !57
  unreachable, !dbg !57

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %g, metadata !58, metadata !DIExpression()), !dbg !60
  %3 = load i64, i64* %num.addr, align 8, !dbg !61
  %4 = load i64, i64* %den.addr, align 8, !dbg !62
  %call1 = call i64 @gcd(i64 %3, i64 %4), !dbg !63
  %conv = trunc i64 %call1 to i32, !dbg !63
  store i32 %conv, i32* %g, align 4, !dbg !60
  %5 = load i32, i32* %g, align 4, !dbg !64
  %tobool2 = icmp ne i32 %5, 0, !dbg !64
  br i1 %tobool2, label %if.then3, label %if.else, !dbg !66, !cf.info !52

if.then3:                                         ; preds = %if.end
  %6 = load i32, i32* %g, align 4, !dbg !67
  %conv4 = sext i32 %6 to i64, !dbg !67
  %7 = load i64, i64* %num.addr, align 8, !dbg !69
  %div = sdiv i64 %7, %conv4, !dbg !69
  store i64 %div, i64* %num.addr, align 8, !dbg !69
  %8 = load i32, i32* %g, align 4, !dbg !70
  %conv5 = sext i32 %8 to i64, !dbg !70
  %9 = load i64, i64* %den.addr, align 8, !dbg !71
  %div6 = sdiv i64 %9, %conv5, !dbg !71
  store i64 %div6, i64* %den.addr, align 8, !dbg !71
  br label %if.end7, !dbg !72

if.else:                                          ; preds = %if.end
  store i64 0, i64* %num.addr, align 8, !dbg !73
  store i64 1, i64* %den.addr, align 8, !dbg !75
  br label %if.end7

if.end7:                                          ; preds = %if.else, %if.then3
  %10 = load i64, i64* %den.addr, align 8, !dbg !76
  %cmp = icmp slt i64 %10, 0, !dbg !78
  br i1 %cmp, label %if.then9, label %if.end11, !dbg !79, !cf.info !52

if.then9:                                         ; preds = %if.end7
  %11 = load i64, i64* %den.addr, align 8, !dbg !80
  %sub = sub nsw i64 0, %11, !dbg !82
  store i64 %sub, i64* %den.addr, align 8, !dbg !83
  %12 = load i64, i64* %num.addr, align 8, !dbg !84
  %sub10 = sub nsw i64 0, %12, !dbg !85
  store i64 %sub10, i64* %num.addr, align 8, !dbg !86
  br label %if.end11, !dbg !87

if.end11:                                         ; preds = %if.then9, %if.end7
  %13 = load i64, i64* %num.addr, align 8, !dbg !88
  %num12 = getelementptr inbounds %struct.frac, %struct.frac* %retval, i32 0, i32 0, !dbg !89
  store i64 %13, i64* %num12, align 8, !dbg !90
  %14 = load i64, i64* %den.addr, align 8, !dbg !91
  %den13 = getelementptr inbounds %struct.frac, %struct.frac* %retval, i32 0, i32 1, !dbg !92
  store i64 %14, i64* %den13, align 8, !dbg !93
  %15 = bitcast %struct.frac* %retval to { i64, i64 }*, !dbg !94
  %16 = load { i64, i64 }, { i64, i64 }* %15, align 8, !dbg !94
  ret { i64, i64 } %16, !dbg !94
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noreturn nounwind
declare dso_local void @abort() #3

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i64 } @frac_add(i64 %a.coerce0, i64 %a.coerce1, i64 %b.coerce0, i64 %b.coerce1) #0 !dbg !95 {
entry:
  %retval = alloca %struct.frac, align 8
  %a = alloca %struct.frac, align 8
  %b = alloca %struct.frac, align 8
  %0 = bitcast %struct.frac* %a to { i64, i64 }*
  %1 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 0
  store i64 %a.coerce0, i64* %1, align 8
  %2 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 1
  store i64 %a.coerce1, i64* %2, align 8
  %3 = bitcast %struct.frac* %b to { i64, i64 }*
  %4 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %3, i32 0, i32 0
  store i64 %b.coerce0, i64* %4, align 8
  %5 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %3, i32 0, i32 1
  store i64 %b.coerce1, i64* %5, align 8
  call void @llvm.dbg.declare(metadata %struct.frac* %a, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata %struct.frac* %b, metadata !100, metadata !DIExpression()), !dbg !99
  %num = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 0, !dbg !99
  %6 = load i64, i64* %num, align 8, !dbg !99
  %den = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 1, !dbg !99
  %7 = load i64, i64* %den, align 8, !dbg !99
  %mul = mul nsw i64 %6, %7, !dbg !99
  %num1 = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 0, !dbg !99
  %8 = load i64, i64* %num1, align 8, !dbg !99
  %den2 = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 1, !dbg !99
  %9 = load i64, i64* %den2, align 8, !dbg !99
  %mul3 = mul nsw i64 %8, %9, !dbg !99
  %add = add nsw i64 %mul, %mul3, !dbg !99
  %den4 = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 1, !dbg !99
  %10 = load i64, i64* %den4, align 8, !dbg !99
  %den5 = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 1, !dbg !99
  %11 = load i64, i64* %den5, align 8, !dbg !99
  %mul6 = mul nsw i64 %10, %11, !dbg !99
  %call = call { i64, i64 } @frac_new(i64 %add, i64 %mul6), !dbg !99
  %12 = bitcast %struct.frac* %retval to { i64, i64 }*, !dbg !99
  %13 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 0, !dbg !99
  %14 = extractvalue { i64, i64 } %call, 0, !dbg !99
  store i64 %14, i64* %13, align 8, !dbg !99
  %15 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 1, !dbg !99
  %16 = extractvalue { i64, i64 } %call, 1, !dbg !99
  store i64 %16, i64* %15, align 8, !dbg !99
  %17 = bitcast %struct.frac* %retval to { i64, i64 }*, !dbg !99
  %18 = load { i64, i64 }, { i64, i64 }* %17, align 8, !dbg !99
  ret { i64, i64 } %18, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i64 } @frac_sub(i64 %a.coerce0, i64 %a.coerce1, i64 %b.coerce0, i64 %b.coerce1) #0 !dbg !101 {
entry:
  %retval = alloca %struct.frac, align 8
  %a = alloca %struct.frac, align 8
  %b = alloca %struct.frac, align 8
  %0 = bitcast %struct.frac* %a to { i64, i64 }*
  %1 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 0
  store i64 %a.coerce0, i64* %1, align 8
  %2 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 1
  store i64 %a.coerce1, i64* %2, align 8
  %3 = bitcast %struct.frac* %b to { i64, i64 }*
  %4 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %3, i32 0, i32 0
  store i64 %b.coerce0, i64* %4, align 8
  %5 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %3, i32 0, i32 1
  store i64 %b.coerce1, i64* %5, align 8
  call void @llvm.dbg.declare(metadata %struct.frac* %a, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata %struct.frac* %b, metadata !104, metadata !DIExpression()), !dbg !103
  %num = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 0, !dbg !103
  %6 = load i64, i64* %num, align 8, !dbg !103
  %den = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 1, !dbg !103
  %7 = load i64, i64* %den, align 8, !dbg !103
  %mul = mul nsw i64 %6, %7, !dbg !103
  %num1 = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 0, !dbg !103
  %8 = load i64, i64* %num1, align 8, !dbg !103
  %sub = sub nsw i64 %mul, %8, !dbg !103
  %den2 = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 1, !dbg !103
  %9 = load i64, i64* %den2, align 8, !dbg !103
  %add = add nsw i64 %sub, %9, !dbg !103
  %den3 = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 1, !dbg !103
  %10 = load i64, i64* %den3, align 8, !dbg !103
  %den4 = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 1, !dbg !103
  %11 = load i64, i64* %den4, align 8, !dbg !103
  %mul5 = mul nsw i64 %10, %11, !dbg !103
  %call = call { i64, i64 } @frac_new(i64 %add, i64 %mul5), !dbg !103
  %12 = bitcast %struct.frac* %retval to { i64, i64 }*, !dbg !103
  %13 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 0, !dbg !103
  %14 = extractvalue { i64, i64 } %call, 0, !dbg !103
  store i64 %14, i64* %13, align 8, !dbg !103
  %15 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 1, !dbg !103
  %16 = extractvalue { i64, i64 } %call, 1, !dbg !103
  store i64 %16, i64* %15, align 8, !dbg !103
  %17 = bitcast %struct.frac* %retval to { i64, i64 }*, !dbg !103
  %18 = load { i64, i64 }, { i64, i64 }* %17, align 8, !dbg !103
  ret { i64, i64 } %18, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i64 } @frac_mul(i64 %a.coerce0, i64 %a.coerce1, i64 %b.coerce0, i64 %b.coerce1) #0 !dbg !105 {
entry:
  %retval = alloca %struct.frac, align 8
  %a = alloca %struct.frac, align 8
  %b = alloca %struct.frac, align 8
  %0 = bitcast %struct.frac* %a to { i64, i64 }*
  %1 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 0
  store i64 %a.coerce0, i64* %1, align 8
  %2 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 1
  store i64 %a.coerce1, i64* %2, align 8
  %3 = bitcast %struct.frac* %b to { i64, i64 }*
  %4 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %3, i32 0, i32 0
  store i64 %b.coerce0, i64* %4, align 8
  %5 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %3, i32 0, i32 1
  store i64 %b.coerce1, i64* %5, align 8
  call void @llvm.dbg.declare(metadata %struct.frac* %a, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata %struct.frac* %b, metadata !108, metadata !DIExpression()), !dbg !107
  %num = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 0, !dbg !107
  %6 = load i64, i64* %num, align 8, !dbg !107
  %num1 = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 0, !dbg !107
  %7 = load i64, i64* %num1, align 8, !dbg !107
  %mul = mul nsw i64 %6, %7, !dbg !107
  %den = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 1, !dbg !107
  %8 = load i64, i64* %den, align 8, !dbg !107
  %den2 = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 1, !dbg !107
  %9 = load i64, i64* %den2, align 8, !dbg !107
  %mul3 = mul nsw i64 %8, %9, !dbg !107
  %call = call { i64, i64 } @frac_new(i64 %mul, i64 %mul3), !dbg !107
  %10 = bitcast %struct.frac* %retval to { i64, i64 }*, !dbg !107
  %11 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %10, i32 0, i32 0, !dbg !107
  %12 = extractvalue { i64, i64 } %call, 0, !dbg !107
  store i64 %12, i64* %11, align 8, !dbg !107
  %13 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %10, i32 0, i32 1, !dbg !107
  %14 = extractvalue { i64, i64 } %call, 1, !dbg !107
  store i64 %14, i64* %13, align 8, !dbg !107
  %15 = bitcast %struct.frac* %retval to { i64, i64 }*, !dbg !107
  %16 = load { i64, i64 }, { i64, i64 }* %15, align 8, !dbg !107
  ret { i64, i64 } %16, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i64 } @frac_div(i64 %a.coerce0, i64 %a.coerce1, i64 %b.coerce0, i64 %b.coerce1) #0 !dbg !109 {
entry:
  %retval = alloca %struct.frac, align 8
  %a = alloca %struct.frac, align 8
  %b = alloca %struct.frac, align 8
  %0 = bitcast %struct.frac* %a to { i64, i64 }*
  %1 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 0
  store i64 %a.coerce0, i64* %1, align 8
  %2 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 1
  store i64 %a.coerce1, i64* %2, align 8
  %3 = bitcast %struct.frac* %b to { i64, i64 }*
  %4 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %3, i32 0, i32 0
  store i64 %b.coerce0, i64* %4, align 8
  %5 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %3, i32 0, i32 1
  store i64 %b.coerce1, i64* %5, align 8
  call void @llvm.dbg.declare(metadata %struct.frac* %a, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata %struct.frac* %b, metadata !112, metadata !DIExpression()), !dbg !111
  %num = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 0, !dbg !111
  %6 = load i64, i64* %num, align 8, !dbg !111
  %den = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 1, !dbg !111
  %7 = load i64, i64* %den, align 8, !dbg !111
  %mul = mul nsw i64 %6, %7, !dbg !111
  %den1 = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 1, !dbg !111
  %8 = load i64, i64* %den1, align 8, !dbg !111
  %num2 = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 0, !dbg !111
  %9 = load i64, i64* %num2, align 8, !dbg !111
  %mul3 = mul nsw i64 %8, %9, !dbg !111
  %call = call { i64, i64 } @frac_new(i64 %mul, i64 %mul3), !dbg !111
  %10 = bitcast %struct.frac* %retval to { i64, i64 }*, !dbg !111
  %11 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %10, i32 0, i32 0, !dbg !111
  %12 = extractvalue { i64, i64 } %call, 0, !dbg !111
  store i64 %12, i64* %11, align 8, !dbg !111
  %13 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %10, i32 0, i32 1, !dbg !111
  %14 = extractvalue { i64, i64 } %call, 1, !dbg !111
  store i64 %14, i64* %13, align 8, !dbg !111
  %15 = bitcast %struct.frac* %retval to { i64, i64 }*, !dbg !111
  %16 = load { i64, i64 }, { i64, i64 }* %15, align 8, !dbg !111
  ret { i64, i64 } %16, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @frac_cmp(i64 %a.coerce0, i64 %a.coerce1, i64 %b.coerce0, i64 %b.coerce1) #0 !dbg !113 {
entry:
  %a = alloca %struct.frac, align 8
  %b = alloca %struct.frac, align 8
  %l = alloca i32, align 4
  %r = alloca i32, align 4
  %0 = bitcast %struct.frac* %a to { i64, i64 }*
  %1 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 0
  store i64 %a.coerce0, i64* %1, align 8
  %2 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 1
  store i64 %a.coerce1, i64* %2, align 8
  %3 = bitcast %struct.frac* %b to { i64, i64 }*
  %4 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %3, i32 0, i32 0
  store i64 %b.coerce0, i64* %4, align 8
  %5 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %3, i32 0, i32 1
  store i64 %b.coerce1, i64* %5, align 8
  call void @llvm.dbg.declare(metadata %struct.frac* %a, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata %struct.frac* %b, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i32* %l, metadata !120, metadata !DIExpression()), !dbg !121
  %num = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 0, !dbg !122
  %6 = load i64, i64* %num, align 8, !dbg !122
  %den = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 1, !dbg !123
  %7 = load i64, i64* %den, align 8, !dbg !123
  %mul = mul nsw i64 %6, %7, !dbg !124
  %conv = trunc i64 %mul to i32, !dbg !125
  store i32 %conv, i32* %l, align 4, !dbg !121
  call void @llvm.dbg.declare(metadata i32* %r, metadata !126, metadata !DIExpression()), !dbg !127
  %den1 = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 1, !dbg !128
  %8 = load i64, i64* %den1, align 8, !dbg !128
  %num2 = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 0, !dbg !129
  %9 = load i64, i64* %num2, align 8, !dbg !129
  %mul3 = mul nsw i64 %8, %9, !dbg !130
  %conv4 = trunc i64 %mul3 to i32, !dbg !131
  store i32 %conv4, i32* %r, align 4, !dbg !127
  %10 = load i32, i32* %l, align 4, !dbg !132
  %11 = load i32, i32* %r, align 4, !dbg !133
  %cmp = icmp slt i32 %10, %11, !dbg !134
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !132

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !132

cond.false:                                       ; preds = %entry
  %12 = load i32, i32* %l, align 4, !dbg !135
  %13 = load i32, i32* %r, align 4, !dbg !136
  %cmp6 = icmp sgt i32 %12, %13, !dbg !137
  %conv7 = zext i1 %cmp6 to i32, !dbg !137
  br label %cond.end, !dbg !132

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ -1, %cond.true ], [ %conv7, %cond.false ], !dbg !132
  ret i32 %cond, !dbg !138
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @frtoi(i64 %a.coerce0, i64 %a.coerce1) #0 !dbg !139 {
entry:
  %a = alloca %struct.frac, align 8
  %0 = bitcast %struct.frac* %a to { i64, i64 }*
  %1 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 0
  store i64 %a.coerce0, i64* %1, align 8
  %2 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 1
  store i64 %a.coerce1, i64* %2, align 8
  call void @llvm.dbg.declare(metadata %struct.frac* %a, metadata !142, metadata !DIExpression()), !dbg !143
  %den = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 1, !dbg !144
  %3 = load i64, i64* %den, align 8, !dbg !144
  %num = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 0, !dbg !145
  %4 = load i64, i64* %num, align 8, !dbg !145
  %div = sdiv i64 %3, %4, !dbg !146
  %conv = trunc i64 %div to i32, !dbg !147
  ret i32 %conv, !dbg !148
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @frtod(i64 %a.coerce0, i64 %a.coerce1) #0 !dbg !149 {
entry:
  %a = alloca %struct.frac, align 8
  %0 = bitcast %struct.frac* %a to { i64, i64 }*
  %1 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 0
  store i64 %a.coerce0, i64* %1, align 8
  %2 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 1
  store i64 %a.coerce1, i64* %2, align 8
  call void @llvm.dbg.declare(metadata %struct.frac* %a, metadata !152, metadata !DIExpression()), !dbg !153
  %den = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 1, !dbg !154
  %3 = load i64, i64* %den, align 8, !dbg !154
  %conv = sitofp i64 %3 to double, !dbg !155
  %num = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 0, !dbg !156
  %4 = load i64, i64* %num, align 8, !dbg !156
  %conv1 = sitofp i64 %4 to double, !dbg !157
  %div = fdiv double %conv, %conv1, !dbg !158
  ret double %div, !dbg !159
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !160 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  %k = alloca i32, align 4
  %sum = alloca %struct.frac, align 8
  %kf = alloca %struct.frac, align 8
  %tmp = alloca %struct.frac, align 8
  %tmp5 = alloca %struct.frac, align 8
  %tmp8 = alloca %struct.frac, align 8
  %tmp10 = alloca %struct.frac, align 8
  %tmp13 = alloca %struct.frac, align 8
  %agg.tmp = alloca %struct.frac, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !163, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata i32* %k, metadata !165, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.declare(metadata %struct.frac* %sum, metadata !167, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata %struct.frac* %kf, metadata !169, metadata !DIExpression()), !dbg !170
  store i32 2, i32* %n, align 4, !dbg !171
  br label %for.cond, !dbg !173

for.cond:                                         ; preds = %for.inc22, %entry
  %0 = load i32, i32* %n, align 4, !dbg !174
  %cmp = icmp slt i32 %0, 524288, !dbg !176
  br i1 %cmp, label %for.body, label %for.end24, !dbg !177

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %n, align 4, !dbg !178
  %conv = sext i32 %1 to i64, !dbg !178
  %call = call { i64, i64 } @frac_new(i64 1, i64 %conv), !dbg !180
  %2 = bitcast %struct.frac* %tmp to { i64, i64 }*, !dbg !180
  %3 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %2, i32 0, i32 0, !dbg !180
  %4 = extractvalue { i64, i64 } %call, 0, !dbg !180
  store i64 %4, i64* %3, align 8, !dbg !180
  %5 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %2, i32 0, i32 1, !dbg !180
  %6 = extractvalue { i64, i64 } %call, 1, !dbg !180
  store i64 %6, i64* %5, align 8, !dbg !180
  %7 = bitcast %struct.frac* %sum to i8*, !dbg !180
  %8 = bitcast %struct.frac* %tmp to i8*, !dbg !180
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 8 %8, i64 16, i1 false), !dbg !180
  store i32 2, i32* %k, align 4, !dbg !181
  br label %for.cond1, !dbg !183

for.cond1:                                        ; preds = %for.inc, %for.body
  %9 = load i32, i32* %k, align 4, !dbg !184
  %10 = load i32, i32* %k, align 4, !dbg !186
  %mul = mul nsw i32 %9, %10, !dbg !187
  %11 = load i32, i32* %n, align 4, !dbg !188
  %cmp2 = icmp slt i32 %mul, %11, !dbg !189
  br i1 %cmp2, label %for.body4, label %for.end, !dbg !190

for.body4:                                        ; preds = %for.cond1
  %12 = load i32, i32* %n, align 4, !dbg !191
  %13 = load i32, i32* %k, align 4, !dbg !194
  %rem = srem i32 %12, %13, !dbg !195
  %tobool = icmp ne i32 %rem, 0, !dbg !195
  br i1 %tobool, label %if.then, label %if.end, !dbg !196, !cf.info !52

if.then:                                          ; preds = %for.body4
  br label %for.inc, !dbg !197

if.end:                                           ; preds = %for.body4
  %14 = load i32, i32* %k, align 4, !dbg !198
  %conv6 = sext i32 %14 to i64, !dbg !198
  %call7 = call { i64, i64 } @frac_new(i64 1, i64 %conv6), !dbg !199
  %15 = bitcast %struct.frac* %tmp5 to { i64, i64 }*, !dbg !199
  %16 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %15, i32 0, i32 0, !dbg !199
  %17 = extractvalue { i64, i64 } %call7, 0, !dbg !199
  store i64 %17, i64* %16, align 8, !dbg !199
  %18 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %15, i32 0, i32 1, !dbg !199
  %19 = extractvalue { i64, i64 } %call7, 1, !dbg !199
  store i64 %19, i64* %18, align 8, !dbg !199
  %20 = bitcast %struct.frac* %kf to i8*, !dbg !199
  %21 = bitcast %struct.frac* %tmp5 to i8*, !dbg !199
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %20, i8* align 8 %21, i64 16, i1 false), !dbg !199
  %22 = bitcast %struct.frac* %sum to { i64, i64 }*, !dbg !200
  %23 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %22, i32 0, i32 0, !dbg !200
  %24 = load i64, i64* %23, align 8, !dbg !200
  %25 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %22, i32 0, i32 1, !dbg !200
  %26 = load i64, i64* %25, align 8, !dbg !200
  %27 = bitcast %struct.frac* %kf to { i64, i64 }*, !dbg !200
  %28 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %27, i32 0, i32 0, !dbg !200
  %29 = load i64, i64* %28, align 8, !dbg !200
  %30 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %27, i32 0, i32 1, !dbg !200
  %31 = load i64, i64* %30, align 8, !dbg !200
  %call9 = call { i64, i64 } @frac_add(i64 %24, i64 %26, i64 %29, i64 %31), !dbg !200
  %32 = bitcast %struct.frac* %tmp8 to { i64, i64 }*, !dbg !200
  %33 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %32, i32 0, i32 0, !dbg !200
  %34 = extractvalue { i64, i64 } %call9, 0, !dbg !200
  store i64 %34, i64* %33, align 8, !dbg !200
  %35 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %32, i32 0, i32 1, !dbg !200
  %36 = extractvalue { i64, i64 } %call9, 1, !dbg !200
  store i64 %36, i64* %35, align 8, !dbg !200
  %37 = bitcast %struct.frac* %sum to i8*, !dbg !200
  %38 = bitcast %struct.frac* %tmp8 to i8*, !dbg !200
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %37, i8* align 8 %38, i64 16, i1 false), !dbg !200
  %39 = load i32, i32* %n, align 4, !dbg !201
  %40 = load i32, i32* %k, align 4, !dbg !202
  %div = sdiv i32 %39, %40, !dbg !203
  %conv11 = sext i32 %div to i64, !dbg !201
  %call12 = call { i64, i64 } @frac_new(i64 1, i64 %conv11), !dbg !204
  %41 = bitcast %struct.frac* %tmp10 to { i64, i64 }*, !dbg !204
  %42 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %41, i32 0, i32 0, !dbg !204
  %43 = extractvalue { i64, i64 } %call12, 0, !dbg !204
  store i64 %43, i64* %42, align 8, !dbg !204
  %44 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %41, i32 0, i32 1, !dbg !204
  %45 = extractvalue { i64, i64 } %call12, 1, !dbg !204
  store i64 %45, i64* %44, align 8, !dbg !204
  %46 = bitcast %struct.frac* %kf to i8*, !dbg !204
  %47 = bitcast %struct.frac* %tmp10 to i8*, !dbg !204
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %46, i8* align 8 %47, i64 16, i1 false), !dbg !204
  %48 = bitcast %struct.frac* %sum to { i64, i64 }*, !dbg !205
  %49 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %48, i32 0, i32 0, !dbg !205
  %50 = load i64, i64* %49, align 8, !dbg !205
  %51 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %48, i32 0, i32 1, !dbg !205
  %52 = load i64, i64* %51, align 8, !dbg !205
  %53 = bitcast %struct.frac* %kf to { i64, i64 }*, !dbg !205
  %54 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %53, i32 0, i32 0, !dbg !205
  %55 = load i64, i64* %54, align 8, !dbg !205
  %56 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %53, i32 0, i32 1, !dbg !205
  %57 = load i64, i64* %56, align 8, !dbg !205
  %call14 = call { i64, i64 } @frac_add(i64 %50, i64 %52, i64 %55, i64 %57), !dbg !205
  %58 = bitcast %struct.frac* %tmp13 to { i64, i64 }*, !dbg !205
  %59 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %58, i32 0, i32 0, !dbg !205
  %60 = extractvalue { i64, i64 } %call14, 0, !dbg !205
  store i64 %60, i64* %59, align 8, !dbg !205
  %61 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %58, i32 0, i32 1, !dbg !205
  %62 = extractvalue { i64, i64 } %call14, 1, !dbg !205
  store i64 %62, i64* %61, align 8, !dbg !205
  %63 = bitcast %struct.frac* %sum to i8*, !dbg !205
  %64 = bitcast %struct.frac* %tmp13 to i8*, !dbg !205
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %63, i8* align 8 %64, i64 16, i1 false), !dbg !205
  br label %for.inc, !dbg !206

for.inc:                                          ; preds = %if.end, %if.then
  %65 = load i32, i32* %k, align 4, !dbg !207
  %inc = add nsw i32 %65, 1, !dbg !207
  store i32 %inc, i32* %k, align 4, !dbg !207
  br label %for.cond1, !dbg !208, !llvm.loop !209

for.end:                                          ; preds = %for.cond1
  %call15 = call { i64, i64 } @frac_new(i64 1, i64 1), !dbg !211
  %66 = bitcast %struct.frac* %agg.tmp to { i64, i64 }*, !dbg !211
  %67 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %66, i32 0, i32 0, !dbg !211
  %68 = extractvalue { i64, i64 } %call15, 0, !dbg !211
  store i64 %68, i64* %67, align 8, !dbg !211
  %69 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %66, i32 0, i32 1, !dbg !211
  %70 = extractvalue { i64, i64 } %call15, 1, !dbg !211
  store i64 %70, i64* %69, align 8, !dbg !211
  %71 = bitcast %struct.frac* %sum to { i64, i64 }*, !dbg !211
  %72 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %71, i32 0, i32 0, !dbg !211
  %73 = load i64, i64* %72, align 8, !dbg !211
  %74 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %71, i32 0, i32 1, !dbg !211
  %75 = load i64, i64* %74, align 8, !dbg !211
  %76 = bitcast %struct.frac* %agg.tmp to { i64, i64 }*, !dbg !211
  %77 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %76, i32 0, i32 0, !dbg !211
  %78 = load i64, i64* %77, align 8, !dbg !211
  %79 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %76, i32 0, i32 1, !dbg !211
  %80 = load i64, i64* %79, align 8, !dbg !211
  %call16 = call i32 @frac_cmp(i64 %73, i64 %75, i64 %78, i64 %80), !dbg !211
  %cmp17 = icmp eq i32 %call16, 0, !dbg !213
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !214, !cf.info !52

if.then19:                                        ; preds = %for.end
  %81 = load i32, i32* %n, align 4, !dbg !215
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %81), !dbg !216
  br label %if.end21, !dbg !216

if.end21:                                         ; preds = %if.then19, %for.end
  br label %for.inc22, !dbg !217

for.inc22:                                        ; preds = %if.end21
  %82 = load i32, i32* %n, align 4, !dbg !218
  %inc23 = add nsw i32 %82, 1, !dbg !218
  store i32 %inc23, i32* %n, align 4, !dbg !218
  br label %for.cond, !dbg !219, !llvm.loop !220

for.end24:                                        ; preds = %for.cond
  ret i32 0, !dbg !222
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "arithmetic-rational.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Arithmetic-Rational")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!9 = distinct !DISubprogram(name: "gcd", scope: !1, file: !1, line: 7, type: !10, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !12, !12}
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "fr_int_t", file: !1, line: 4, baseType: !13)
!13 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "m", arg: 1, scope: !9, file: !1, line: 7, type: !12)
!15 = !DILocation(line: 7, column: 23, scope: !9)
!16 = !DILocalVariable(name: "n", arg: 2, scope: !9, file: !1, line: 7, type: !12)
!17 = !DILocation(line: 7, column: 35, scope: !9)
!18 = !DILocalVariable(name: "t", scope: !9, file: !1, line: 9, type: !12)
!19 = !DILocation(line: 9, column: 11, scope: !9)
!20 = !DILocation(line: 10, column: 2, scope: !9)
!21 = !DILocation(line: 10, column: 9, scope: !9)
!22 = !DILocation(line: 10, column: 18, scope: !23)
!23 = distinct !DILexicalBlock(scope: !9, file: !1, line: 10, column: 12)
!24 = !DILocation(line: 10, column: 16, scope: !23)
!25 = !DILocation(line: 10, column: 25, scope: !23)
!26 = !DILocation(line: 10, column: 29, scope: !23)
!27 = !DILocation(line: 10, column: 27, scope: !23)
!28 = !DILocation(line: 10, column: 23, scope: !23)
!29 = !DILocation(line: 10, column: 36, scope: !23)
!30 = !DILocation(line: 10, column: 34, scope: !23)
!31 = distinct !{!31, !20, !32}
!32 = !DILocation(line: 10, column: 39, scope: !9)
!33 = !DILocation(line: 11, column: 9, scope: !9)
!34 = !DILocation(line: 11, column: 2, scope: !9)
!35 = distinct !DISubprogram(name: "frac_new", scope: !1, file: !1, line: 14, type: !36, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DISubroutineType(types: !37)
!37 = !{!38, !12, !12}
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "frac", file: !1, line: 5, baseType: !39)
!39 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 5, size: 128, elements: !40)
!40 = !{!41, !42}
!41 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !39, file: !1, line: 5, baseType: !12, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !39, file: !1, line: 5, baseType: !12, size: 64, offset: 64)
!43 = !DILocalVariable(name: "num", arg: 1, scope: !35, file: !1, line: 14, type: !12)
!44 = !DILocation(line: 14, column: 24, scope: !35)
!45 = !DILocalVariable(name: "den", arg: 2, scope: !35, file: !1, line: 14, type: !12)
!46 = !DILocation(line: 14, column: 38, scope: !35)
!47 = !DILocalVariable(name: "a", scope: !35, file: !1, line: 16, type: !38)
!48 = !DILocation(line: 16, column: 7, scope: !35)
!49 = !DILocation(line: 17, column: 7, scope: !50)
!50 = distinct !DILexicalBlock(scope: !35, file: !1, line: 17, column: 6)
!51 = !DILocation(line: 17, column: 6, scope: !35)
!52 = !{!"if"}
!53 = !DILocation(line: 18, column: 43, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !1, line: 17, column: 12)
!55 = !DILocation(line: 18, column: 48, scope: !54)
!56 = !DILocation(line: 18, column: 3, scope: !54)
!57 = !DILocation(line: 19, column: 3, scope: !54)
!58 = !DILocalVariable(name: "g", scope: !35, file: !1, line: 22, type: !59)
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DILocation(line: 22, column: 6, scope: !35)
!61 = !DILocation(line: 22, column: 14, scope: !35)
!62 = !DILocation(line: 22, column: 19, scope: !35)
!63 = !DILocation(line: 22, column: 10, scope: !35)
!64 = !DILocation(line: 24, column: 6, scope: !65)
!65 = distinct !DILexicalBlock(scope: !35, file: !1, line: 24, column: 6)
!66 = !DILocation(line: 24, column: 6, scope: !35)
!67 = !DILocation(line: 24, column: 18, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !1, line: 24, column: 9)
!69 = !DILocation(line: 24, column: 15, scope: !68)
!70 = !DILocation(line: 24, column: 28, scope: !68)
!71 = !DILocation(line: 24, column: 25, scope: !68)
!72 = !DILocation(line: 24, column: 31, scope: !68)
!73 = !DILocation(line: 25, column: 13, scope: !74)
!74 = distinct !DILexicalBlock(scope: !65, file: !1, line: 25, column: 7)
!75 = !DILocation(line: 25, column: 22, scope: !74)
!76 = !DILocation(line: 27, column: 6, scope: !77)
!77 = distinct !DILexicalBlock(scope: !35, file: !1, line: 27, column: 6)
!78 = !DILocation(line: 27, column: 10, scope: !77)
!79 = !DILocation(line: 27, column: 6, scope: !35)
!80 = !DILocation(line: 28, column: 10, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !1, line: 27, column: 15)
!82 = !DILocation(line: 28, column: 9, scope: !81)
!83 = !DILocation(line: 28, column: 7, scope: !81)
!84 = !DILocation(line: 29, column: 10, scope: !81)
!85 = !DILocation(line: 29, column: 9, scope: !81)
!86 = !DILocation(line: 29, column: 7, scope: !81)
!87 = !DILocation(line: 30, column: 2, scope: !81)
!88 = !DILocation(line: 31, column: 10, scope: !35)
!89 = !DILocation(line: 31, column: 4, scope: !35)
!90 = !DILocation(line: 31, column: 8, scope: !35)
!91 = !DILocation(line: 31, column: 23, scope: !35)
!92 = !DILocation(line: 31, column: 17, scope: !35)
!93 = !DILocation(line: 31, column: 21, scope: !35)
!94 = !DILocation(line: 32, column: 2, scope: !35)
!95 = distinct !DISubprogram(name: "frac_add", scope: !1, file: !1, line: 36, type: !96, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!38, !38, !38}
!98 = !DILocalVariable(name: "a", arg: 1, scope: !95, file: !1, line: 36, type: !38)
!99 = !DILocation(line: 36, column: 1, scope: !95)
!100 = !DILocalVariable(name: "b", arg: 2, scope: !95, file: !1, line: 36, type: !38)
!101 = distinct !DISubprogram(name: "frac_sub", scope: !1, file: !1, line: 37, type: !96, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "a", arg: 1, scope: !101, file: !1, line: 37, type: !38)
!103 = !DILocation(line: 37, column: 1, scope: !101)
!104 = !DILocalVariable(name: "b", arg: 2, scope: !101, file: !1, line: 37, type: !38)
!105 = distinct !DISubprogram(name: "frac_mul", scope: !1, file: !1, line: 38, type: !96, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "a", arg: 1, scope: !105, file: !1, line: 38, type: !38)
!107 = !DILocation(line: 38, column: 1, scope: !105)
!108 = !DILocalVariable(name: "b", arg: 2, scope: !105, file: !1, line: 38, type: !38)
!109 = distinct !DISubprogram(name: "frac_div", scope: !1, file: !1, line: 39, type: !96, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "a", arg: 1, scope: !109, file: !1, line: 39, type: !38)
!111 = !DILocation(line: 39, column: 1, scope: !109)
!112 = !DILocalVariable(name: "b", arg: 2, scope: !109, file: !1, line: 39, type: !38)
!113 = distinct !DISubprogram(name: "frac_cmp", scope: !1, file: !1, line: 41, type: !114, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DISubroutineType(types: !115)
!115 = !{!59, !38, !38}
!116 = !DILocalVariable(name: "a", arg: 1, scope: !113, file: !1, line: 41, type: !38)
!117 = !DILocation(line: 41, column: 19, scope: !113)
!118 = !DILocalVariable(name: "b", arg: 2, scope: !113, file: !1, line: 41, type: !38)
!119 = !DILocation(line: 41, column: 27, scope: !113)
!120 = !DILocalVariable(name: "l", scope: !113, file: !1, line: 42, type: !59)
!121 = !DILocation(line: 42, column: 6, scope: !113)
!122 = !DILocation(line: 42, column: 12, scope: !113)
!123 = !DILocation(line: 42, column: 20, scope: !113)
!124 = !DILocation(line: 42, column: 16, scope: !113)
!125 = !DILocation(line: 42, column: 10, scope: !113)
!126 = !DILocalVariable(name: "r", scope: !113, file: !1, line: 42, type: !59)
!127 = !DILocation(line: 42, column: 25, scope: !113)
!128 = !DILocation(line: 42, column: 31, scope: !113)
!129 = !DILocation(line: 42, column: 39, scope: !113)
!130 = !DILocation(line: 42, column: 35, scope: !113)
!131 = !DILocation(line: 42, column: 29, scope: !113)
!132 = !DILocation(line: 43, column: 9, scope: !113)
!133 = !DILocation(line: 43, column: 13, scope: !113)
!134 = !DILocation(line: 43, column: 11, scope: !113)
!135 = !DILocation(line: 43, column: 22, scope: !113)
!136 = !DILocation(line: 43, column: 26, scope: !113)
!137 = !DILocation(line: 43, column: 24, scope: !113)
!138 = !DILocation(line: 43, column: 2, scope: !113)
!139 = distinct !DISubprogram(name: "frtoi", scope: !1, file: !1, line: 46, type: !140, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!140 = !DISubroutineType(types: !141)
!141 = !{!59, !38}
!142 = !DILocalVariable(name: "a", arg: 1, scope: !139, file: !1, line: 46, type: !38)
!143 = !DILocation(line: 46, column: 16, scope: !139)
!144 = !DILocation(line: 46, column: 30, scope: !139)
!145 = !DILocation(line: 46, column: 38, scope: !139)
!146 = !DILocation(line: 46, column: 34, scope: !139)
!147 = !DILocation(line: 46, column: 28, scope: !139)
!148 = !DILocation(line: 46, column: 21, scope: !139)
!149 = distinct !DISubprogram(name: "frtod", scope: !1, file: !1, line: 47, type: !150, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!150 = !DISubroutineType(types: !151)
!151 = !{!4, !38}
!152 = !DILocalVariable(name: "a", arg: 1, scope: !149, file: !1, line: 47, type: !38)
!153 = !DILocation(line: 47, column: 19, scope: !149)
!154 = !DILocation(line: 47, column: 41, scope: !149)
!155 = !DILocation(line: 47, column: 31, scope: !149)
!156 = !DILocation(line: 47, column: 49, scope: !149)
!157 = !DILocation(line: 47, column: 47, scope: !149)
!158 = !DILocation(line: 47, column: 45, scope: !149)
!159 = !DILocation(line: 47, column: 24, scope: !149)
!160 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 49, type: !161, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!161 = !DISubroutineType(types: !162)
!162 = !{!59}
!163 = !DILocalVariable(name: "n", scope: !160, file: !1, line: 51, type: !59)
!164 = !DILocation(line: 51, column: 6, scope: !160)
!165 = !DILocalVariable(name: "k", scope: !160, file: !1, line: 51, type: !59)
!166 = !DILocation(line: 51, column: 9, scope: !160)
!167 = !DILocalVariable(name: "sum", scope: !160, file: !1, line: 52, type: !38)
!168 = !DILocation(line: 52, column: 7, scope: !160)
!169 = !DILocalVariable(name: "kf", scope: !160, file: !1, line: 52, type: !38)
!170 = !DILocation(line: 52, column: 12, scope: !160)
!171 = !DILocation(line: 54, column: 9, scope: !172)
!172 = distinct !DILexicalBlock(scope: !160, file: !1, line: 54, column: 2)
!173 = !DILocation(line: 54, column: 7, scope: !172)
!174 = !DILocation(line: 54, column: 14, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !1, line: 54, column: 2)
!176 = !DILocation(line: 54, column: 16, scope: !175)
!177 = !DILocation(line: 54, column: 2, scope: !172)
!178 = !DILocation(line: 55, column: 21, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !1, line: 54, column: 30)
!180 = !DILocation(line: 55, column: 9, scope: !179)
!181 = !DILocation(line: 57, column: 10, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !1, line: 57, column: 3)
!183 = !DILocation(line: 57, column: 8, scope: !182)
!184 = !DILocation(line: 57, column: 15, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !1, line: 57, column: 3)
!186 = !DILocation(line: 57, column: 19, scope: !185)
!187 = !DILocation(line: 57, column: 17, scope: !185)
!188 = !DILocation(line: 57, column: 23, scope: !185)
!189 = !DILocation(line: 57, column: 21, scope: !185)
!190 = !DILocation(line: 57, column: 3, scope: !182)
!191 = !DILocation(line: 58, column: 8, scope: !192)
!192 = distinct !DILexicalBlock(scope: !193, file: !1, line: 58, column: 8)
!193 = distinct !DILexicalBlock(scope: !185, file: !1, line: 57, column: 31)
!194 = !DILocation(line: 58, column: 12, scope: !192)
!195 = !DILocation(line: 58, column: 10, scope: !192)
!196 = !DILocation(line: 58, column: 8, scope: !193)
!197 = !DILocation(line: 58, column: 15, scope: !192)
!198 = !DILocation(line: 59, column: 21, scope: !193)
!199 = !DILocation(line: 59, column: 9, scope: !193)
!200 = !DILocation(line: 60, column: 10, scope: !193)
!201 = !DILocation(line: 62, column: 21, scope: !193)
!202 = !DILocation(line: 62, column: 25, scope: !193)
!203 = !DILocation(line: 62, column: 23, scope: !193)
!204 = !DILocation(line: 62, column: 9, scope: !193)
!205 = !DILocation(line: 63, column: 10, scope: !193)
!206 = !DILocation(line: 64, column: 3, scope: !193)
!207 = !DILocation(line: 57, column: 27, scope: !185)
!208 = !DILocation(line: 57, column: 3, scope: !185)
!209 = distinct !{!209, !190, !210}
!210 = !DILocation(line: 64, column: 3, scope: !182)
!211 = !DILocation(line: 65, column: 7, scope: !212)
!212 = distinct !DILexicalBlock(scope: !179, file: !1, line: 65, column: 7)
!213 = !DILocation(line: 65, column: 28, scope: !212)
!214 = !DILocation(line: 65, column: 7, scope: !179)
!215 = !DILocation(line: 65, column: 49, scope: !212)
!216 = !DILocation(line: 65, column: 34, scope: !212)
!217 = !DILocation(line: 66, column: 2, scope: !179)
!218 = !DILocation(line: 54, column: 26, scope: !175)
!219 = !DILocation(line: 54, column: 2, scope: !175)
!220 = distinct !{!220, !177, !221}
!221 = !DILocation(line: 66, column: 2, scope: !172)
!222 = !DILocation(line: 68, column: 2, scope: !160)
