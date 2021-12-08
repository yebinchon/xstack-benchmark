; ModuleID = 'arithmetic-rational.ll'
source_filename = "arithmetic-rational.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.frac = type { i64, i64 }

@.str = private unnamed_addr constant [27 x i8] c"divide by zero: %lld/%lld\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @gcd(i64 %m, i64 %n) #0 !dbg !9 {
entry:
  call void @llvm.dbg.value(metadata i64 %m, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i64 %n, metadata !16, metadata !DIExpression()), !dbg !15
  br label %while.cond, !dbg !17

while.cond:                                       ; preds = %while.body, %entry
  %n.addr.0 = phi i64 [ %n, %entry ], [ %rem, %while.body ]
  %m.addr.0 = phi i64 [ %m, %entry ], [ %n.addr.0, %while.body ]
  call void @llvm.dbg.value(metadata i64 %m.addr.0, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i64 %n.addr.0, metadata !16, metadata !DIExpression()), !dbg !15
  %tobool = icmp ne i64 %n.addr.0, 0, !dbg !17
  br i1 %tobool, label %while.body, label %while.end, !dbg !17

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.value(metadata i64 %n.addr.0, metadata !18, metadata !DIExpression()), !dbg !15
  %rem = srem i64 %m.addr.0, %n.addr.0, !dbg !19
  call void @llvm.dbg.value(metadata i64 %rem, metadata !16, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i64 %n.addr.0, metadata !14, metadata !DIExpression()), !dbg !15
  br label %while.cond, !dbg !17, !llvm.loop !21

while.end:                                        ; preds = %while.cond
  ret i64 %m.addr.0, !dbg !23
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i64 } @frac_new(i64 %num, i64 %den) #0 !dbg !24 {
entry:
  %retval = alloca %struct.frac, align 8
  call void @llvm.dbg.value(metadata i64 %num, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.value(metadata i64 %den, metadata !34, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata %struct.frac* %retval, metadata !35, metadata !DIExpression()), !dbg !36
  %tobool = icmp ne i64 %den, 0, !dbg !37
  br i1 %tobool, label %if.end, label %if.then, !dbg !39, !cf.info !40

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i64 0, i64 0), i64 %num, i64 %den), !dbg !41
  call void @abort() #5, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %entry
  %call1 = call i64 @gcd(i64 %num, i64 %den), !dbg !44
  %conv = trunc i64 %call1 to i32, !dbg !44
  call void @llvm.dbg.value(metadata i32 %conv, metadata !45, metadata !DIExpression()), !dbg !33
  %tobool2 = icmp ne i32 %conv, 0, !dbg !47
  br i1 %tobool2, label %if.then3, label %if.else, !dbg !49, !cf.info !40

if.then3:                                         ; preds = %if.end
  %conv4 = sext i32 %conv to i64, !dbg !50
  %div = sdiv i64 %num, %conv4, !dbg !52
  call void @llvm.dbg.value(metadata i64 %div, metadata !32, metadata !DIExpression()), !dbg !33
  %conv5 = sext i32 %conv to i64, !dbg !53
  %div6 = sdiv i64 %den, %conv5, !dbg !54
  call void @llvm.dbg.value(metadata i64 %div6, metadata !34, metadata !DIExpression()), !dbg !33
  br label %if.end7, !dbg !55

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.value(metadata i64 0, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.value(metadata i64 1, metadata !34, metadata !DIExpression()), !dbg !33
  br label %if.end7

if.end7:                                          ; preds = %if.else, %if.then3
  %den.addr.0 = phi i64 [ %div6, %if.then3 ], [ 1, %if.else ], !dbg !56
  %num.addr.0 = phi i64 [ %div, %if.then3 ], [ 0, %if.else ], !dbg !56
  call void @llvm.dbg.value(metadata i64 %num.addr.0, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.value(metadata i64 %den.addr.0, metadata !34, metadata !DIExpression()), !dbg !33
  %cmp = icmp slt i64 %den.addr.0, 0, !dbg !57
  br i1 %cmp, label %if.then9, label %if.end11, !dbg !59, !cf.info !40

if.then9:                                         ; preds = %if.end7
  %sub = sub nsw i64 0, %den.addr.0, !dbg !60
  call void @llvm.dbg.value(metadata i64 %sub, metadata !34, metadata !DIExpression()), !dbg !33
  %sub10 = sub nsw i64 0, %num.addr.0, !dbg !62
  call void @llvm.dbg.value(metadata i64 %sub10, metadata !32, metadata !DIExpression()), !dbg !33
  br label %if.end11, !dbg !63

if.end11:                                         ; preds = %if.then9, %if.end7
  %den.addr.1 = phi i64 [ %sub, %if.then9 ], [ %den.addr.0, %if.end7 ], !dbg !33
  %num.addr.1 = phi i64 [ %sub10, %if.then9 ], [ %num.addr.0, %if.end7 ], !dbg !33
  call void @llvm.dbg.value(metadata i64 %num.addr.1, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.value(metadata i64 %den.addr.1, metadata !34, metadata !DIExpression()), !dbg !33
  %num12 = getelementptr inbounds %struct.frac, %struct.frac* %retval, i32 0, i32 0, !dbg !64
  store i64 %num.addr.1, i64* %num12, align 8, !dbg !65
  %den13 = getelementptr inbounds %struct.frac, %struct.frac* %retval, i32 0, i32 1, !dbg !66
  store i64 %den.addr.1, i64* %den13, align 8, !dbg !67
  %0 = bitcast %struct.frac* %retval to { i64, i64 }*, !dbg !68
  %1 = load { i64, i64 }, { i64, i64 }* %0, align 8, !dbg !68
  ret { i64, i64 } %1, !dbg !68
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noreturn nounwind
declare dso_local void @abort() #3

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i64 } @frac_add(i64 %a.coerce0, i64 %a.coerce1, i64 %b.coerce0, i64 %b.coerce1) #0 !dbg !69 {
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
  call void @llvm.dbg.declare(metadata %struct.frac* %a, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata %struct.frac* %b, metadata !74, metadata !DIExpression()), !dbg !73
  %num = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 0, !dbg !73
  %6 = load i64, i64* %num, align 8, !dbg !73
  %den = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 1, !dbg !73
  %7 = load i64, i64* %den, align 8, !dbg !73
  %mul = mul nsw i64 %6, %7, !dbg !73
  %num1 = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 0, !dbg !73
  %8 = load i64, i64* %num1, align 8, !dbg !73
  %den2 = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 1, !dbg !73
  %9 = load i64, i64* %den2, align 8, !dbg !73
  %mul3 = mul nsw i64 %8, %9, !dbg !73
  %add = add nsw i64 %mul, %mul3, !dbg !73
  %den4 = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 1, !dbg !73
  %10 = load i64, i64* %den4, align 8, !dbg !73
  %den5 = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 1, !dbg !73
  %11 = load i64, i64* %den5, align 8, !dbg !73
  %mul6 = mul nsw i64 %10, %11, !dbg !73
  %call = call { i64, i64 } @frac_new(i64 %add, i64 %mul6), !dbg !73
  %12 = bitcast %struct.frac* %retval to { i64, i64 }*, !dbg !73
  %13 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 0, !dbg !73
  %14 = extractvalue { i64, i64 } %call, 0, !dbg !73
  store i64 %14, i64* %13, align 8, !dbg !73
  %15 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 1, !dbg !73
  %16 = extractvalue { i64, i64 } %call, 1, !dbg !73
  store i64 %16, i64* %15, align 8, !dbg !73
  %17 = bitcast %struct.frac* %retval to { i64, i64 }*, !dbg !73
  %18 = load { i64, i64 }, { i64, i64 }* %17, align 8, !dbg !73
  ret { i64, i64 } %18, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i64 } @frac_sub(i64 %a.coerce0, i64 %a.coerce1, i64 %b.coerce0, i64 %b.coerce1) #0 !dbg !75 {
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
  call void @llvm.dbg.declare(metadata %struct.frac* %a, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata %struct.frac* %b, metadata !78, metadata !DIExpression()), !dbg !77
  %num = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 0, !dbg !77
  %6 = load i64, i64* %num, align 8, !dbg !77
  %den = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 1, !dbg !77
  %7 = load i64, i64* %den, align 8, !dbg !77
  %mul = mul nsw i64 %6, %7, !dbg !77
  %num1 = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 0, !dbg !77
  %8 = load i64, i64* %num1, align 8, !dbg !77
  %sub = sub nsw i64 %mul, %8, !dbg !77
  %den2 = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 1, !dbg !77
  %9 = load i64, i64* %den2, align 8, !dbg !77
  %add = add nsw i64 %sub, %9, !dbg !77
  %den3 = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 1, !dbg !77
  %10 = load i64, i64* %den3, align 8, !dbg !77
  %den4 = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 1, !dbg !77
  %11 = load i64, i64* %den4, align 8, !dbg !77
  %mul5 = mul nsw i64 %10, %11, !dbg !77
  %call = call { i64, i64 } @frac_new(i64 %add, i64 %mul5), !dbg !77
  %12 = bitcast %struct.frac* %retval to { i64, i64 }*, !dbg !77
  %13 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 0, !dbg !77
  %14 = extractvalue { i64, i64 } %call, 0, !dbg !77
  store i64 %14, i64* %13, align 8, !dbg !77
  %15 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 1, !dbg !77
  %16 = extractvalue { i64, i64 } %call, 1, !dbg !77
  store i64 %16, i64* %15, align 8, !dbg !77
  %17 = bitcast %struct.frac* %retval to { i64, i64 }*, !dbg !77
  %18 = load { i64, i64 }, { i64, i64 }* %17, align 8, !dbg !77
  ret { i64, i64 } %18, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i64 } @frac_mul(i64 %a.coerce0, i64 %a.coerce1, i64 %b.coerce0, i64 %b.coerce1) #0 !dbg !79 {
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
  call void @llvm.dbg.declare(metadata %struct.frac* %a, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata %struct.frac* %b, metadata !82, metadata !DIExpression()), !dbg !81
  %num = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 0, !dbg !81
  %6 = load i64, i64* %num, align 8, !dbg !81
  %num1 = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 0, !dbg !81
  %7 = load i64, i64* %num1, align 8, !dbg !81
  %mul = mul nsw i64 %6, %7, !dbg !81
  %den = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 1, !dbg !81
  %8 = load i64, i64* %den, align 8, !dbg !81
  %den2 = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 1, !dbg !81
  %9 = load i64, i64* %den2, align 8, !dbg !81
  %mul3 = mul nsw i64 %8, %9, !dbg !81
  %call = call { i64, i64 } @frac_new(i64 %mul, i64 %mul3), !dbg !81
  %10 = bitcast %struct.frac* %retval to { i64, i64 }*, !dbg !81
  %11 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %10, i32 0, i32 0, !dbg !81
  %12 = extractvalue { i64, i64 } %call, 0, !dbg !81
  store i64 %12, i64* %11, align 8, !dbg !81
  %13 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %10, i32 0, i32 1, !dbg !81
  %14 = extractvalue { i64, i64 } %call, 1, !dbg !81
  store i64 %14, i64* %13, align 8, !dbg !81
  %15 = bitcast %struct.frac* %retval to { i64, i64 }*, !dbg !81
  %16 = load { i64, i64 }, { i64, i64 }* %15, align 8, !dbg !81
  ret { i64, i64 } %16, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i64 } @frac_div(i64 %a.coerce0, i64 %a.coerce1, i64 %b.coerce0, i64 %b.coerce1) #0 !dbg !83 {
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
  call void @llvm.dbg.declare(metadata %struct.frac* %a, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata %struct.frac* %b, metadata !86, metadata !DIExpression()), !dbg !85
  %num = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 0, !dbg !85
  %6 = load i64, i64* %num, align 8, !dbg !85
  %den = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 1, !dbg !85
  %7 = load i64, i64* %den, align 8, !dbg !85
  %mul = mul nsw i64 %6, %7, !dbg !85
  %den1 = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 1, !dbg !85
  %8 = load i64, i64* %den1, align 8, !dbg !85
  %num2 = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 0, !dbg !85
  %9 = load i64, i64* %num2, align 8, !dbg !85
  %mul3 = mul nsw i64 %8, %9, !dbg !85
  %call = call { i64, i64 } @frac_new(i64 %mul, i64 %mul3), !dbg !85
  %10 = bitcast %struct.frac* %retval to { i64, i64 }*, !dbg !85
  %11 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %10, i32 0, i32 0, !dbg !85
  %12 = extractvalue { i64, i64 } %call, 0, !dbg !85
  store i64 %12, i64* %11, align 8, !dbg !85
  %13 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %10, i32 0, i32 1, !dbg !85
  %14 = extractvalue { i64, i64 } %call, 1, !dbg !85
  store i64 %14, i64* %13, align 8, !dbg !85
  %15 = bitcast %struct.frac* %retval to { i64, i64 }*, !dbg !85
  %16 = load { i64, i64 }, { i64, i64 }* %15, align 8, !dbg !85
  ret { i64, i64 } %16, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @frac_cmp(i64 %a.coerce0, i64 %a.coerce1, i64 %b.coerce0, i64 %b.coerce1) #0 !dbg !87 {
entry:
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
  call void @llvm.dbg.declare(metadata %struct.frac* %a, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata %struct.frac* %b, metadata !92, metadata !DIExpression()), !dbg !93
  %num = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 0, !dbg !94
  %6 = load i64, i64* %num, align 8, !dbg !94
  %den = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 1, !dbg !95
  %7 = load i64, i64* %den, align 8, !dbg !95
  %mul = mul nsw i64 %6, %7, !dbg !96
  %conv = trunc i64 %mul to i32, !dbg !97
  call void @llvm.dbg.value(metadata i32 %conv, metadata !98, metadata !DIExpression()), !dbg !99
  %den1 = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 1, !dbg !100
  %8 = load i64, i64* %den1, align 8, !dbg !100
  %num2 = getelementptr inbounds %struct.frac, %struct.frac* %b, i32 0, i32 0, !dbg !101
  %9 = load i64, i64* %num2, align 8, !dbg !101
  %mul3 = mul nsw i64 %8, %9, !dbg !102
  %conv4 = trunc i64 %mul3 to i32, !dbg !103
  call void @llvm.dbg.value(metadata i32 %conv4, metadata !104, metadata !DIExpression()), !dbg !99
  %cmp = icmp slt i32 %conv, %conv4, !dbg !105
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !106

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !106

cond.false:                                       ; preds = %entry
  %cmp6 = icmp sgt i32 %conv, %conv4, !dbg !107
  %conv7 = zext i1 %cmp6 to i32, !dbg !107
  br label %cond.end, !dbg !106

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ -1, %cond.true ], [ %conv7, %cond.false ], !dbg !106
  ret i32 %cond, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @frtoi(i64 %a.coerce0, i64 %a.coerce1) #0 !dbg !109 {
entry:
  %a = alloca %struct.frac, align 8
  %0 = bitcast %struct.frac* %a to { i64, i64 }*
  %1 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 0
  store i64 %a.coerce0, i64* %1, align 8
  %2 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 1
  store i64 %a.coerce1, i64* %2, align 8
  call void @llvm.dbg.declare(metadata %struct.frac* %a, metadata !112, metadata !DIExpression()), !dbg !113
  %den = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 1, !dbg !114
  %3 = load i64, i64* %den, align 8, !dbg !114
  %num = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 0, !dbg !115
  %4 = load i64, i64* %num, align 8, !dbg !115
  %div = sdiv i64 %3, %4, !dbg !116
  %conv = trunc i64 %div to i32, !dbg !117
  ret i32 %conv, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @frtod(i64 %a.coerce0, i64 %a.coerce1) #0 !dbg !119 {
entry:
  %a = alloca %struct.frac, align 8
  %0 = bitcast %struct.frac* %a to { i64, i64 }*
  %1 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 0
  store i64 %a.coerce0, i64* %1, align 8
  %2 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 1
  store i64 %a.coerce1, i64* %2, align 8
  call void @llvm.dbg.declare(metadata %struct.frac* %a, metadata !122, metadata !DIExpression()), !dbg !123
  %den = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 1, !dbg !124
  %3 = load i64, i64* %den, align 8, !dbg !124
  %conv = sitofp i64 %3 to double, !dbg !125
  %num = getelementptr inbounds %struct.frac, %struct.frac* %a, i32 0, i32 0, !dbg !126
  %4 = load i64, i64* %num, align 8, !dbg !126
  %conv1 = sitofp i64 %4 to double, !dbg !127
  %div = fdiv double %conv, %conv1, !dbg !128
  ret double %div, !dbg !129
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !130 {
entry:
  %sum = alloca %struct.frac, align 8
  %kf = alloca %struct.frac, align 8
  %tmp = alloca %struct.frac, align 8
  %tmp5 = alloca %struct.frac, align 8
  %tmp8 = alloca %struct.frac, align 8
  %tmp10 = alloca %struct.frac, align 8
  %tmp13 = alloca %struct.frac, align 8
  %agg.tmp = alloca %struct.frac, align 8
  call void @llvm.dbg.declare(metadata %struct.frac* %sum, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata %struct.frac* %kf, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata i32 2, metadata !137, metadata !DIExpression()), !dbg !138
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc22, %entry
  %n.0 = phi i32 [ 2, %entry ], [ %inc23, %for.inc22 ], !dbg !141
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !137, metadata !DIExpression()), !dbg !138
  %cmp = icmp slt i32 %n.0, 524288, !dbg !142
  br i1 %cmp, label %for.body, label %for.end24, !dbg !144

for.body:                                         ; preds = %for.cond
  %conv = sext i32 %n.0 to i64, !dbg !145
  %call = call { i64, i64 } @frac_new(i64 1, i64 %conv), !dbg !147
  %0 = bitcast %struct.frac* %tmp to { i64, i64 }*, !dbg !147
  %1 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 0, !dbg !147
  %2 = extractvalue { i64, i64 } %call, 0, !dbg !147
  store i64 %2, i64* %1, align 8, !dbg !147
  %3 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 1, !dbg !147
  %4 = extractvalue { i64, i64 } %call, 1, !dbg !147
  store i64 %4, i64* %3, align 8, !dbg !147
  %5 = bitcast %struct.frac* %sum to i8*, !dbg !147
  %6 = bitcast %struct.frac* %tmp to i8*, !dbg !147
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %5, i8* align 8 %6, i64 16, i1 false), !dbg !147
  call void @llvm.dbg.value(metadata i32 2, metadata !148, metadata !DIExpression()), !dbg !138
  br label %for.cond1, !dbg !149

for.cond1:                                        ; preds = %for.inc, %for.body
  %k.0 = phi i32 [ 2, %for.body ], [ %inc, %for.inc ], !dbg !151
  call void @llvm.dbg.value(metadata i32 %k.0, metadata !148, metadata !DIExpression()), !dbg !138
  %mul = mul nsw i32 %k.0, %k.0, !dbg !152
  %cmp2 = icmp slt i32 %mul, %n.0, !dbg !154
  br i1 %cmp2, label %for.body4, label %for.end, !dbg !155

for.body4:                                        ; preds = %for.cond1
  %rem = srem i32 %n.0, %k.0, !dbg !156
  %tobool = icmp ne i32 %rem, 0, !dbg !156
  br i1 %tobool, label %if.then, label %if.end, !dbg !159, !cf.info !40

if.then:                                          ; preds = %for.body4
  br label %for.inc, !dbg !160

if.end:                                           ; preds = %for.body4
  %conv6 = sext i32 %k.0 to i64, !dbg !161
  %call7 = call { i64, i64 } @frac_new(i64 1, i64 %conv6), !dbg !162
  %7 = bitcast %struct.frac* %tmp5 to { i64, i64 }*, !dbg !162
  %8 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %7, i32 0, i32 0, !dbg !162
  %9 = extractvalue { i64, i64 } %call7, 0, !dbg !162
  store i64 %9, i64* %8, align 8, !dbg !162
  %10 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %7, i32 0, i32 1, !dbg !162
  %11 = extractvalue { i64, i64 } %call7, 1, !dbg !162
  store i64 %11, i64* %10, align 8, !dbg !162
  %12 = bitcast %struct.frac* %kf to i8*, !dbg !162
  %13 = bitcast %struct.frac* %tmp5 to i8*, !dbg !162
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %12, i8* align 8 %13, i64 16, i1 false), !dbg !162
  %14 = bitcast %struct.frac* %sum to { i64, i64 }*, !dbg !163
  %15 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %14, i32 0, i32 0, !dbg !163
  %16 = load i64, i64* %15, align 8, !dbg !163
  %17 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %14, i32 0, i32 1, !dbg !163
  %18 = load i64, i64* %17, align 8, !dbg !163
  %19 = bitcast %struct.frac* %kf to { i64, i64 }*, !dbg !163
  %20 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %19, i32 0, i32 0, !dbg !163
  %21 = load i64, i64* %20, align 8, !dbg !163
  %22 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %19, i32 0, i32 1, !dbg !163
  %23 = load i64, i64* %22, align 8, !dbg !163
  %call9 = call { i64, i64 } @frac_add(i64 %16, i64 %18, i64 %21, i64 %23), !dbg !163
  %24 = bitcast %struct.frac* %tmp8 to { i64, i64 }*, !dbg !163
  %25 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %24, i32 0, i32 0, !dbg !163
  %26 = extractvalue { i64, i64 } %call9, 0, !dbg !163
  store i64 %26, i64* %25, align 8, !dbg !163
  %27 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %24, i32 0, i32 1, !dbg !163
  %28 = extractvalue { i64, i64 } %call9, 1, !dbg !163
  store i64 %28, i64* %27, align 8, !dbg !163
  %29 = bitcast %struct.frac* %sum to i8*, !dbg !163
  %30 = bitcast %struct.frac* %tmp8 to i8*, !dbg !163
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %29, i8* align 8 %30, i64 16, i1 false), !dbg !163
  %div = sdiv i32 %n.0, %k.0, !dbg !164
  %conv11 = sext i32 %div to i64, !dbg !165
  %call12 = call { i64, i64 } @frac_new(i64 1, i64 %conv11), !dbg !166
  %31 = bitcast %struct.frac* %tmp10 to { i64, i64 }*, !dbg !166
  %32 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %31, i32 0, i32 0, !dbg !166
  %33 = extractvalue { i64, i64 } %call12, 0, !dbg !166
  store i64 %33, i64* %32, align 8, !dbg !166
  %34 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %31, i32 0, i32 1, !dbg !166
  %35 = extractvalue { i64, i64 } %call12, 1, !dbg !166
  store i64 %35, i64* %34, align 8, !dbg !166
  %36 = bitcast %struct.frac* %kf to i8*, !dbg !166
  %37 = bitcast %struct.frac* %tmp10 to i8*, !dbg !166
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %36, i8* align 8 %37, i64 16, i1 false), !dbg !166
  %38 = bitcast %struct.frac* %sum to { i64, i64 }*, !dbg !167
  %39 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %38, i32 0, i32 0, !dbg !167
  %40 = load i64, i64* %39, align 8, !dbg !167
  %41 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %38, i32 0, i32 1, !dbg !167
  %42 = load i64, i64* %41, align 8, !dbg !167
  %43 = bitcast %struct.frac* %kf to { i64, i64 }*, !dbg !167
  %44 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %43, i32 0, i32 0, !dbg !167
  %45 = load i64, i64* %44, align 8, !dbg !167
  %46 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %43, i32 0, i32 1, !dbg !167
  %47 = load i64, i64* %46, align 8, !dbg !167
  %call14 = call { i64, i64 } @frac_add(i64 %40, i64 %42, i64 %45, i64 %47), !dbg !167
  %48 = bitcast %struct.frac* %tmp13 to { i64, i64 }*, !dbg !167
  %49 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %48, i32 0, i32 0, !dbg !167
  %50 = extractvalue { i64, i64 } %call14, 0, !dbg !167
  store i64 %50, i64* %49, align 8, !dbg !167
  %51 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %48, i32 0, i32 1, !dbg !167
  %52 = extractvalue { i64, i64 } %call14, 1, !dbg !167
  store i64 %52, i64* %51, align 8, !dbg !167
  %53 = bitcast %struct.frac* %sum to i8*, !dbg !167
  %54 = bitcast %struct.frac* %tmp13 to i8*, !dbg !167
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %53, i8* align 8 %54, i64 16, i1 false), !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %if.end, %if.then
  %inc = add nsw i32 %k.0, 1, !dbg !169
  call void @llvm.dbg.value(metadata i32 %inc, metadata !148, metadata !DIExpression()), !dbg !138
  br label %for.cond1, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond1
  %call15 = call { i64, i64 } @frac_new(i64 1, i64 1), !dbg !173
  %55 = bitcast %struct.frac* %agg.tmp to { i64, i64 }*, !dbg !173
  %56 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %55, i32 0, i32 0, !dbg !173
  %57 = extractvalue { i64, i64 } %call15, 0, !dbg !173
  store i64 %57, i64* %56, align 8, !dbg !173
  %58 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %55, i32 0, i32 1, !dbg !173
  %59 = extractvalue { i64, i64 } %call15, 1, !dbg !173
  store i64 %59, i64* %58, align 8, !dbg !173
  %60 = bitcast %struct.frac* %sum to { i64, i64 }*, !dbg !173
  %61 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %60, i32 0, i32 0, !dbg !173
  %62 = load i64, i64* %61, align 8, !dbg !173
  %63 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %60, i32 0, i32 1, !dbg !173
  %64 = load i64, i64* %63, align 8, !dbg !173
  %65 = bitcast %struct.frac* %agg.tmp to { i64, i64 }*, !dbg !173
  %66 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %65, i32 0, i32 0, !dbg !173
  %67 = load i64, i64* %66, align 8, !dbg !173
  %68 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %65, i32 0, i32 1, !dbg !173
  %69 = load i64, i64* %68, align 8, !dbg !173
  %call16 = call i32 @frac_cmp(i64 %62, i64 %64, i64 %67, i64 %69), !dbg !173
  %cmp17 = icmp eq i32 %call16, 0, !dbg !175
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !176, !cf.info !40

if.then19:                                        ; preds = %for.end
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %n.0), !dbg !177
  br label %if.end21, !dbg !177

if.end21:                                         ; preds = %if.then19, %for.end
  br label %for.inc22, !dbg !178

for.inc22:                                        ; preds = %if.end21
  %inc23 = add nsw i32 %n.0, 1, !dbg !179
  call void @llvm.dbg.value(metadata i32 %inc23, metadata !137, metadata !DIExpression()), !dbg !138
  br label %for.cond, !dbg !180, !llvm.loop !181

for.end24:                                        ; preds = %for.cond
  ret i32 0, !dbg !183
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!15 = !DILocation(line: 0, scope: !9)
!16 = !DILocalVariable(name: "n", arg: 2, scope: !9, file: !1, line: 7, type: !12)
!17 = !DILocation(line: 10, column: 2, scope: !9)
!18 = !DILocalVariable(name: "t", scope: !9, file: !1, line: 9, type: !12)
!19 = !DILocation(line: 10, column: 27, scope: !20)
!20 = distinct !DILexicalBlock(scope: !9, file: !1, line: 10, column: 12)
!21 = distinct !{!21, !17, !22}
!22 = !DILocation(line: 10, column: 39, scope: !9)
!23 = !DILocation(line: 11, column: 2, scope: !9)
!24 = distinct !DISubprogram(name: "frac_new", scope: !1, file: !1, line: 14, type: !25, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{!27, !12, !12}
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "frac", file: !1, line: 5, baseType: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 5, size: 128, elements: !29)
!29 = !{!30, !31}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !28, file: !1, line: 5, baseType: !12, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "den", scope: !28, file: !1, line: 5, baseType: !12, size: 64, offset: 64)
!32 = !DILocalVariable(name: "num", arg: 1, scope: !24, file: !1, line: 14, type: !12)
!33 = !DILocation(line: 0, scope: !24)
!34 = !DILocalVariable(name: "den", arg: 2, scope: !24, file: !1, line: 14, type: !12)
!35 = !DILocalVariable(name: "a", scope: !24, file: !1, line: 16, type: !27)
!36 = !DILocation(line: 16, column: 7, scope: !24)
!37 = !DILocation(line: 17, column: 7, scope: !38)
!38 = distinct !DILexicalBlock(scope: !24, file: !1, line: 17, column: 6)
!39 = !DILocation(line: 17, column: 6, scope: !24)
!40 = !{!"if"}
!41 = !DILocation(line: 18, column: 3, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !1, line: 17, column: 12)
!43 = !DILocation(line: 19, column: 3, scope: !42)
!44 = !DILocation(line: 22, column: 10, scope: !24)
!45 = !DILocalVariable(name: "g", scope: !24, file: !1, line: 22, type: !46)
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DILocation(line: 24, column: 6, scope: !48)
!48 = distinct !DILexicalBlock(scope: !24, file: !1, line: 24, column: 6)
!49 = !DILocation(line: 24, column: 6, scope: !24)
!50 = !DILocation(line: 24, column: 18, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !1, line: 24, column: 9)
!52 = !DILocation(line: 24, column: 15, scope: !51)
!53 = !DILocation(line: 24, column: 28, scope: !51)
!54 = !DILocation(line: 24, column: 25, scope: !51)
!55 = !DILocation(line: 24, column: 31, scope: !51)
!56 = !DILocation(line: 0, scope: !48)
!57 = !DILocation(line: 27, column: 10, scope: !58)
!58 = distinct !DILexicalBlock(scope: !24, file: !1, line: 27, column: 6)
!59 = !DILocation(line: 27, column: 6, scope: !24)
!60 = !DILocation(line: 28, column: 9, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !1, line: 27, column: 15)
!62 = !DILocation(line: 29, column: 9, scope: !61)
!63 = !DILocation(line: 30, column: 2, scope: !61)
!64 = !DILocation(line: 31, column: 4, scope: !24)
!65 = !DILocation(line: 31, column: 8, scope: !24)
!66 = !DILocation(line: 31, column: 17, scope: !24)
!67 = !DILocation(line: 31, column: 21, scope: !24)
!68 = !DILocation(line: 32, column: 2, scope: !24)
!69 = distinct !DISubprogram(name: "frac_add", scope: !1, file: !1, line: 36, type: !70, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!27, !27, !27}
!72 = !DILocalVariable(name: "a", arg: 1, scope: !69, file: !1, line: 36, type: !27)
!73 = !DILocation(line: 36, column: 1, scope: !69)
!74 = !DILocalVariable(name: "b", arg: 2, scope: !69, file: !1, line: 36, type: !27)
!75 = distinct !DISubprogram(name: "frac_sub", scope: !1, file: !1, line: 37, type: !70, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "a", arg: 1, scope: !75, file: !1, line: 37, type: !27)
!77 = !DILocation(line: 37, column: 1, scope: !75)
!78 = !DILocalVariable(name: "b", arg: 2, scope: !75, file: !1, line: 37, type: !27)
!79 = distinct !DISubprogram(name: "frac_mul", scope: !1, file: !1, line: 38, type: !70, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "a", arg: 1, scope: !79, file: !1, line: 38, type: !27)
!81 = !DILocation(line: 38, column: 1, scope: !79)
!82 = !DILocalVariable(name: "b", arg: 2, scope: !79, file: !1, line: 38, type: !27)
!83 = distinct !DISubprogram(name: "frac_div", scope: !1, file: !1, line: 39, type: !70, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "a", arg: 1, scope: !83, file: !1, line: 39, type: !27)
!85 = !DILocation(line: 39, column: 1, scope: !83)
!86 = !DILocalVariable(name: "b", arg: 2, scope: !83, file: !1, line: 39, type: !27)
!87 = distinct !DISubprogram(name: "frac_cmp", scope: !1, file: !1, line: 41, type: !88, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!46, !27, !27}
!90 = !DILocalVariable(name: "a", arg: 1, scope: !87, file: !1, line: 41, type: !27)
!91 = !DILocation(line: 41, column: 19, scope: !87)
!92 = !DILocalVariable(name: "b", arg: 2, scope: !87, file: !1, line: 41, type: !27)
!93 = !DILocation(line: 41, column: 27, scope: !87)
!94 = !DILocation(line: 42, column: 12, scope: !87)
!95 = !DILocation(line: 42, column: 20, scope: !87)
!96 = !DILocation(line: 42, column: 16, scope: !87)
!97 = !DILocation(line: 42, column: 10, scope: !87)
!98 = !DILocalVariable(name: "l", scope: !87, file: !1, line: 42, type: !46)
!99 = !DILocation(line: 0, scope: !87)
!100 = !DILocation(line: 42, column: 31, scope: !87)
!101 = !DILocation(line: 42, column: 39, scope: !87)
!102 = !DILocation(line: 42, column: 35, scope: !87)
!103 = !DILocation(line: 42, column: 29, scope: !87)
!104 = !DILocalVariable(name: "r", scope: !87, file: !1, line: 42, type: !46)
!105 = !DILocation(line: 43, column: 11, scope: !87)
!106 = !DILocation(line: 43, column: 9, scope: !87)
!107 = !DILocation(line: 43, column: 24, scope: !87)
!108 = !DILocation(line: 43, column: 2, scope: !87)
!109 = distinct !DISubprogram(name: "frtoi", scope: !1, file: !1, line: 46, type: !110, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DISubroutineType(types: !111)
!111 = !{!46, !27}
!112 = !DILocalVariable(name: "a", arg: 1, scope: !109, file: !1, line: 46, type: !27)
!113 = !DILocation(line: 46, column: 16, scope: !109)
!114 = !DILocation(line: 46, column: 30, scope: !109)
!115 = !DILocation(line: 46, column: 38, scope: !109)
!116 = !DILocation(line: 46, column: 34, scope: !109)
!117 = !DILocation(line: 46, column: 28, scope: !109)
!118 = !DILocation(line: 46, column: 21, scope: !109)
!119 = distinct !DISubprogram(name: "frtod", scope: !1, file: !1, line: 47, type: !120, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DISubroutineType(types: !121)
!121 = !{!4, !27}
!122 = !DILocalVariable(name: "a", arg: 1, scope: !119, file: !1, line: 47, type: !27)
!123 = !DILocation(line: 47, column: 19, scope: !119)
!124 = !DILocation(line: 47, column: 41, scope: !119)
!125 = !DILocation(line: 47, column: 31, scope: !119)
!126 = !DILocation(line: 47, column: 49, scope: !119)
!127 = !DILocation(line: 47, column: 47, scope: !119)
!128 = !DILocation(line: 47, column: 45, scope: !119)
!129 = !DILocation(line: 47, column: 24, scope: !119)
!130 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 49, type: !131, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!131 = !DISubroutineType(types: !132)
!132 = !{!46}
!133 = !DILocalVariable(name: "sum", scope: !130, file: !1, line: 52, type: !27)
!134 = !DILocation(line: 52, column: 7, scope: !130)
!135 = !DILocalVariable(name: "kf", scope: !130, file: !1, line: 52, type: !27)
!136 = !DILocation(line: 52, column: 12, scope: !130)
!137 = !DILocalVariable(name: "n", scope: !130, file: !1, line: 51, type: !46)
!138 = !DILocation(line: 0, scope: !130)
!139 = !DILocation(line: 54, column: 7, scope: !140)
!140 = distinct !DILexicalBlock(scope: !130, file: !1, line: 54, column: 2)
!141 = !DILocation(line: 0, scope: !140)
!142 = !DILocation(line: 54, column: 16, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !1, line: 54, column: 2)
!144 = !DILocation(line: 54, column: 2, scope: !140)
!145 = !DILocation(line: 55, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !1, line: 54, column: 30)
!147 = !DILocation(line: 55, column: 9, scope: !146)
!148 = !DILocalVariable(name: "k", scope: !130, file: !1, line: 51, type: !46)
!149 = !DILocation(line: 57, column: 8, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !1, line: 57, column: 3)
!151 = !DILocation(line: 0, scope: !150)
!152 = !DILocation(line: 57, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !1, line: 57, column: 3)
!154 = !DILocation(line: 57, column: 21, scope: !153)
!155 = !DILocation(line: 57, column: 3, scope: !150)
!156 = !DILocation(line: 58, column: 10, scope: !157)
!157 = distinct !DILexicalBlock(scope: !158, file: !1, line: 58, column: 8)
!158 = distinct !DILexicalBlock(scope: !153, file: !1, line: 57, column: 31)
!159 = !DILocation(line: 58, column: 8, scope: !158)
!160 = !DILocation(line: 58, column: 15, scope: !157)
!161 = !DILocation(line: 59, column: 21, scope: !158)
!162 = !DILocation(line: 59, column: 9, scope: !158)
!163 = !DILocation(line: 60, column: 10, scope: !158)
!164 = !DILocation(line: 62, column: 23, scope: !158)
!165 = !DILocation(line: 62, column: 21, scope: !158)
!166 = !DILocation(line: 62, column: 9, scope: !158)
!167 = !DILocation(line: 63, column: 10, scope: !158)
!168 = !DILocation(line: 64, column: 3, scope: !158)
!169 = !DILocation(line: 57, column: 27, scope: !153)
!170 = !DILocation(line: 57, column: 3, scope: !153)
!171 = distinct !{!171, !155, !172}
!172 = !DILocation(line: 64, column: 3, scope: !150)
!173 = !DILocation(line: 65, column: 7, scope: !174)
!174 = distinct !DILexicalBlock(scope: !146, file: !1, line: 65, column: 7)
!175 = !DILocation(line: 65, column: 28, scope: !174)
!176 = !DILocation(line: 65, column: 7, scope: !146)
!177 = !DILocation(line: 65, column: 34, scope: !174)
!178 = !DILocation(line: 66, column: 2, scope: !146)
!179 = !DILocation(line: 54, column: 26, scope: !143)
!180 = !DILocation(line: 54, column: 2, scope: !143)
!181 = distinct !{!181, !144, !182}
!182 = !DILocation(line: 66, column: 2, scope: !140)
!183 = !DILocation(line: 68, column: 2, scope: !130)
