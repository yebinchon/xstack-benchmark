; ModuleID = 'conjugate-transpose.ll'
source_filename = "conjugate-transpose.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.matrix = type { i32, i32, { double, double }** }

@.str = private unnamed_addr constant [25 x i8] c"Enter rows and columns :\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%d%d\00", align 1
@.str.2 = private unnamed_addr constant [42 x i8] c"Randomly Generated Complex Matrix A is : \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"\09%f + %fi\00", align 1
@.str.5 = private unnamed_addr constant [38 x i8] c"\0A\0ATranspose of Complex Matrix A is : \00", align 1
@.str.6 = private unnamed_addr constant [32 x i8] c"\0A\0AComplex Matrix A %s hermitian\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"is\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"is not\00", align 1
@.str.9 = private unnamed_addr constant [30 x i8] c"\0A\0AComplex Matrix A %s unitary\00", align 1
@.str.10 = private unnamed_addr constant [29 x i8] c"\0A\0AComplex Matrix A %s normal\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, { double, double }** } @transpose(i64 %a.coerce0, { double, double }** %a.coerce1) #0 !dbg !7 {
entry:
  %retval = alloca %struct.matrix, align 8
  %a = alloca %struct.matrix, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %0 = bitcast %struct.matrix* %a to { i64, { double, double }** }*
  %1 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %0, i32 0, i32 0
  store i64 %a.coerce0, i64* %1, align 8
  %2 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %0, i32 0, i32 1
  store { double, double }** %a.coerce1, { double, double }*** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.matrix* %a, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %j, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct.matrix* %retval, metadata !26, metadata !DIExpression()), !dbg !27
  %cols = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !28
  %3 = load i32, i32* %cols, align 4, !dbg !28
  %rows = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 0, !dbg !29
  store i32 %3, i32* %rows, align 8, !dbg !30
  %rows1 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !31
  %4 = load i32, i32* %rows1, align 8, !dbg !31
  %cols2 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 1, !dbg !32
  store i32 %4, i32* %cols2, align 4, !dbg !33
  %rows3 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 0, !dbg !34
  %5 = load i32, i32* %rows3, align 8, !dbg !34
  %conv = sext i32 %5 to i64, !dbg !35
  %mul = mul i64 %conv, 8, !dbg !36
  %call = call noalias i8* @malloc(i64 %mul) #6, !dbg !37
  %6 = bitcast i8* %call to { double, double }**, !dbg !37
  %z = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 2, !dbg !38
  store { double, double }** %6, { double, double }*** %z, align 8, !dbg !39
  store i32 0, i32* %i, align 4, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc26, %entry
  %7 = load i32, i32* %i, align 4, !dbg !43
  %rows4 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 0, !dbg !45
  %8 = load i32, i32* %rows4, align 8, !dbg !45
  %cmp = icmp slt i32 %7, %8, !dbg !46
  br i1 %cmp, label %for.body, label %for.end28, !dbg !47

for.body:                                         ; preds = %for.cond
  %cols6 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 1, !dbg !48
  %9 = load i32, i32* %cols6, align 4, !dbg !48
  %conv7 = sext i32 %9 to i64, !dbg !50
  %mul8 = mul i64 %conv7, 16, !dbg !51
  %call9 = call noalias i8* @malloc(i64 %mul8) #6, !dbg !52
  %10 = bitcast i8* %call9 to { double, double }*, !dbg !52
  %z10 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 2, !dbg !53
  %11 = load { double, double }**, { double, double }*** %z10, align 8, !dbg !53
  %12 = load i32, i32* %i, align 4, !dbg !54
  %idxprom = sext i32 %12 to i64, !dbg !55
  %arrayidx = getelementptr inbounds { double, double }*, { double, double }** %11, i64 %idxprom, !dbg !55
  store { double, double }* %10, { double, double }** %arrayidx, align 8, !dbg !56
  store i32 0, i32* %j, align 4, !dbg !57
  br label %for.cond11, !dbg !59

for.cond11:                                       ; preds = %for.inc, %for.body
  %13 = load i32, i32* %j, align 4, !dbg !60
  %cols12 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 1, !dbg !62
  %14 = load i32, i32* %cols12, align 4, !dbg !62
  %cmp13 = icmp slt i32 %13, %14, !dbg !63
  br i1 %cmp13, label %for.body15, label %for.end, !dbg !64

for.body15:                                       ; preds = %for.cond11
  %z16 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !65
  %15 = load { double, double }**, { double, double }*** %z16, align 8, !dbg !65
  %16 = load i32, i32* %j, align 4, !dbg !67
  %idxprom17 = sext i32 %16 to i64, !dbg !68
  %arrayidx18 = getelementptr inbounds { double, double }*, { double, double }** %15, i64 %idxprom17, !dbg !68
  %17 = load { double, double }*, { double, double }** %arrayidx18, align 8, !dbg !68
  %18 = load i32, i32* %i, align 4, !dbg !69
  %idxprom19 = sext i32 %18 to i64, !dbg !68
  %arrayidx20 = getelementptr inbounds { double, double }, { double, double }* %17, i64 %idxprom19, !dbg !68
  %arrayidx20.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx20, i32 0, i32 0, !dbg !68
  %arrayidx20.real = load double, double* %arrayidx20.realp, align 8, !dbg !68
  %arrayidx20.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx20, i32 0, i32 1, !dbg !68
  %arrayidx20.imag = load double, double* %arrayidx20.imagp, align 8, !dbg !68
  %neg = fneg double %arrayidx20.imag, !dbg !70
  %z21 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 2, !dbg !71
  %19 = load { double, double }**, { double, double }*** %z21, align 8, !dbg !71
  %20 = load i32, i32* %i, align 4, !dbg !72
  %idxprom22 = sext i32 %20 to i64, !dbg !73
  %arrayidx23 = getelementptr inbounds { double, double }*, { double, double }** %19, i64 %idxprom22, !dbg !73
  %21 = load { double, double }*, { double, double }** %arrayidx23, align 8, !dbg !73
  %22 = load i32, i32* %j, align 4, !dbg !74
  %idxprom24 = sext i32 %22 to i64, !dbg !73
  %arrayidx25 = getelementptr inbounds { double, double }, { double, double }* %21, i64 %idxprom24, !dbg !73
  %arrayidx25.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx25, i32 0, i32 0, !dbg !75
  %arrayidx25.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx25, i32 0, i32 1, !dbg !75
  store double %arrayidx20.real, double* %arrayidx25.realp, align 8, !dbg !75
  store double %neg, double* %arrayidx25.imagp, align 8, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body15
  %23 = load i32, i32* %j, align 4, !dbg !77
  %inc = add nsw i32 %23, 1, !dbg !77
  store i32 %inc, i32* %j, align 4, !dbg !77
  br label %for.cond11, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond11
  br label %for.inc26, !dbg !81

for.inc26:                                        ; preds = %for.end
  %24 = load i32, i32* %i, align 4, !dbg !82
  %inc27 = add nsw i32 %24, 1, !dbg !82
  store i32 %inc27, i32* %i, align 4, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end28:                                        ; preds = %for.cond
  %25 = bitcast %struct.matrix* %retval to { i64, { double, double }** }*, !dbg !86
  %26 = load { i64, { double, double }** }, { i64, { double, double }** }* %25, align 8, !dbg !86
  ret { i64, { double, double }** } %26, !dbg !86
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @isHermitian(i64 %a.coerce0, { double, double }** %a.coerce1) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.matrix, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %b = alloca %struct.matrix, align 8
  %0 = bitcast %struct.matrix* %a to { i64, { double, double }** }*
  %1 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %0, i32 0, i32 0
  store i64 %a.coerce0, i64* %1, align 8
  %2 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %0, i32 0, i32 1
  store { double, double }** %a.coerce1, { double, double }*** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.matrix* %a, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i32* %i, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata i32* %j, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata %struct.matrix* %b, metadata !96, metadata !DIExpression()), !dbg !97
  %3 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !98
  %4 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %3, i32 0, i32 0, !dbg !98
  %5 = load i64, i64* %4, align 8, !dbg !98
  %6 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %3, i32 0, i32 1, !dbg !98
  %7 = load { double, double }**, { double, double }*** %6, align 8, !dbg !98
  %call = call { i64, { double, double }** } @transpose(i64 %5, { double, double }** %7), !dbg !98
  %8 = bitcast %struct.matrix* %b to { i64, { double, double }** }*, !dbg !98
  %9 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %8, i32 0, i32 0, !dbg !98
  %10 = extractvalue { i64, { double, double }** } %call, 0, !dbg !98
  store i64 %10, i64* %9, align 8, !dbg !98
  %11 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %8, i32 0, i32 1, !dbg !98
  %12 = extractvalue { i64, { double, double }** } %call, 1, !dbg !98
  store { double, double }** %12, { double, double }*** %11, align 8, !dbg !98
  %rows = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 0, !dbg !99
  %13 = load i32, i32* %rows, align 8, !dbg !99
  %rows1 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !101
  %14 = load i32, i32* %rows1, align 8, !dbg !101
  %cmp = icmp eq i32 %13, %14, !dbg !102
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !103

land.lhs.true:                                    ; preds = %entry
  %cols = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 1, !dbg !104
  %15 = load i32, i32* %cols, align 4, !dbg !104
  %cols2 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !105
  %16 = load i32, i32* %cols2, align 4, !dbg !105
  %cmp3 = icmp eq i32 %15, %16, !dbg !106
  br i1 %cmp3, label %if.then, label %if.else, !dbg !107

if.then:                                          ; preds = %land.lhs.true
  store i32 0, i32* %i, align 4, !dbg !108
  br label %for.cond, !dbg !111

for.cond:                                         ; preds = %for.inc18, %if.then
  %17 = load i32, i32* %i, align 4, !dbg !112
  %rows4 = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 0, !dbg !114
  %18 = load i32, i32* %rows4, align 8, !dbg !114
  %cmp5 = icmp slt i32 %17, %18, !dbg !115
  br i1 %cmp5, label %for.body, label %for.end20, !dbg !116

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !117
  br label %for.cond6, !dbg !120

for.cond6:                                        ; preds = %for.inc, %for.body
  %19 = load i32, i32* %j, align 4, !dbg !121
  %cols7 = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 1, !dbg !123
  %20 = load i32, i32* %cols7, align 4, !dbg !123
  %cmp8 = icmp slt i32 %19, %20, !dbg !124
  br i1 %cmp8, label %for.body9, label %for.end, !dbg !125

for.body9:                                        ; preds = %for.cond6
  %z = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 2, !dbg !126
  %21 = load { double, double }**, { double, double }*** %z, align 8, !dbg !126
  %22 = load i32, i32* %i, align 4, !dbg !129
  %idxprom = sext i32 %22 to i64, !dbg !130
  %arrayidx = getelementptr inbounds { double, double }*, { double, double }** %21, i64 %idxprom, !dbg !130
  %23 = load { double, double }*, { double, double }** %arrayidx, align 8, !dbg !130
  %24 = load i32, i32* %j, align 4, !dbg !131
  %idxprom10 = sext i32 %24 to i64, !dbg !130
  %arrayidx11 = getelementptr inbounds { double, double }, { double, double }* %23, i64 %idxprom10, !dbg !130
  %arrayidx11.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx11, i32 0, i32 0, !dbg !130
  %arrayidx11.real = load double, double* %arrayidx11.realp, align 8, !dbg !130
  %arrayidx11.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx11, i32 0, i32 1, !dbg !130
  %arrayidx11.imag = load double, double* %arrayidx11.imagp, align 8, !dbg !130
  %z12 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !132
  %25 = load { double, double }**, { double, double }*** %z12, align 8, !dbg !132
  %26 = load i32, i32* %i, align 4, !dbg !133
  %idxprom13 = sext i32 %26 to i64, !dbg !134
  %arrayidx14 = getelementptr inbounds { double, double }*, { double, double }** %25, i64 %idxprom13, !dbg !134
  %27 = load { double, double }*, { double, double }** %arrayidx14, align 8, !dbg !134
  %28 = load i32, i32* %j, align 4, !dbg !135
  %idxprom15 = sext i32 %28 to i64, !dbg !134
  %arrayidx16 = getelementptr inbounds { double, double }, { double, double }* %27, i64 %idxprom15, !dbg !134
  %arrayidx16.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx16, i32 0, i32 0, !dbg !134
  %arrayidx16.real = load double, double* %arrayidx16.realp, align 8, !dbg !134
  %arrayidx16.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx16, i32 0, i32 1, !dbg !134
  %arrayidx16.imag = load double, double* %arrayidx16.imagp, align 8, !dbg !134
  %cmp.r = fcmp une double %arrayidx11.real, %arrayidx16.real, !dbg !136
  %cmp.i = fcmp une double %arrayidx11.imag, %arrayidx16.imag, !dbg !136
  %or.ri = or i1 %cmp.r, %cmp.i, !dbg !136
  br i1 %or.ri, label %if.then17, label %if.end, !dbg !137

if.then17:                                        ; preds = %for.body9
  store i32 0, i32* %retval, align 4, !dbg !138
  br label %return, !dbg !138

if.end:                                           ; preds = %for.body9
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %if.end
  %29 = load i32, i32* %j, align 4, !dbg !140
  %inc = add nsw i32 %29, 1, !dbg !140
  store i32 %inc, i32* %j, align 4, !dbg !140
  br label %for.cond6, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond6
  br label %for.inc18, !dbg !144

for.inc18:                                        ; preds = %for.end
  %30 = load i32, i32* %i, align 4, !dbg !145
  %inc19 = add nsw i32 %30, 1, !dbg !145
  store i32 %inc19, i32* %i, align 4, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end20:                                        ; preds = %for.cond
  br label %if.end21, !dbg !149

if.else:                                          ; preds = %land.lhs.true, %entry
  store i32 0, i32* %retval, align 4, !dbg !150
  br label %return, !dbg !150

if.end21:                                         ; preds = %for.end20
  store i32 1, i32* %retval, align 4, !dbg !151
  br label %return, !dbg !151

return:                                           ; preds = %if.end21, %if.else, %if.then17
  %31 = load i32, i32* %retval, align 4, !dbg !152
  ret i32 %31, !dbg !152
}

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, { double, double }** } @multiply(i64 %a.coerce0, { double, double }** %a.coerce1, i64 %b.coerce0, { double, double }** %b.coerce1) #3 !dbg !153 {
entry:
  %retval = alloca %struct.matrix, align 8
  %a = alloca %struct.matrix, align 8
  %b = alloca %struct.matrix, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %coerce = alloca { float, float }, align 4
  %0 = bitcast %struct.matrix* %a to { i64, { double, double }** }*
  %1 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %0, i32 0, i32 0
  store i64 %a.coerce0, i64* %1, align 8
  %2 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %0, i32 0, i32 1
  store { double, double }** %a.coerce1, { double, double }*** %2, align 8
  %3 = bitcast %struct.matrix* %b to { i64, { double, double }** }*
  %4 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %3, i32 0, i32 0
  store i64 %b.coerce0, i64* %4, align 8
  %5 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %3, i32 0, i32 1
  store { double, double }** %b.coerce1, { double, double }*** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.matrix* %a, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata %struct.matrix* %b, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata %struct.matrix* %retval, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata i32* %i, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata i32* %j, metadata !164, metadata !DIExpression()), !dbg !165
  %cols = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !166
  %6 = load i32, i32* %cols, align 4, !dbg !166
  %rows = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 0, !dbg !168
  %7 = load i32, i32* %rows, align 8, !dbg !168
  %cmp = icmp eq i32 %6, %7, !dbg !169
  br i1 %cmp, label %if.then, label %if.end, !dbg !170

if.then:                                          ; preds = %entry
  %rows1 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !171
  %8 = load i32, i32* %rows1, align 8, !dbg !171
  %rows2 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 0, !dbg !173
  store i32 %8, i32* %rows2, align 8, !dbg !174
  %cols3 = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 1, !dbg !175
  %9 = load i32, i32* %cols3, align 4, !dbg !175
  %cols4 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 1, !dbg !176
  store i32 %9, i32* %cols4, align 4, !dbg !177
  %rows5 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 0, !dbg !178
  %10 = load i32, i32* %rows5, align 8, !dbg !178
  %conv = sext i32 %10 to i64, !dbg !179
  %mul = mul i64 %conv, 8, !dbg !180
  %call = call noalias i8* @malloc(i64 %mul) #6, !dbg !181
  %11 = bitcast i8* %call to { double, double }**, !dbg !181
  %z = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 2, !dbg !182
  store { double, double }** %11, { double, double }*** %z, align 8, !dbg !183
  store i32 0, i32* %i, align 4, !dbg !184
  br label %for.cond, !dbg !186

for.cond:                                         ; preds = %for.inc53, %if.then
  %12 = load i32, i32* %i, align 4, !dbg !187
  %rows6 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 0, !dbg !189
  %13 = load i32, i32* %rows6, align 8, !dbg !189
  %cmp7 = icmp slt i32 %12, %13, !dbg !190
  br i1 %cmp7, label %for.body, label %for.end55, !dbg !191

for.body:                                         ; preds = %for.cond
  %cols9 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 1, !dbg !192
  %14 = load i32, i32* %cols9, align 4, !dbg !192
  %conv10 = sext i32 %14 to i64, !dbg !194
  %mul11 = mul i64 %conv10, 16, !dbg !195
  %call12 = call noalias i8* @malloc(i64 %mul11) #6, !dbg !196
  %15 = bitcast i8* %call12 to { double, double }*, !dbg !196
  %z13 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 2, !dbg !197
  %16 = load { double, double }**, { double, double }*** %z13, align 8, !dbg !197
  %17 = load i32, i32* %i, align 4, !dbg !198
  %idxprom = sext i32 %17 to i64, !dbg !199
  %arrayidx = getelementptr inbounds { double, double }*, { double, double }** %16, i64 %idxprom, !dbg !199
  store { double, double }* %15, { double, double }** %arrayidx, align 8, !dbg !200
  br i1 false, label %complex_mul_imag_nan, label %complex_mul_cont, !dbg !201, !prof !202

complex_mul_imag_nan:                             ; preds = %for.body
  br i1 false, label %complex_mul_libcall, label %complex_mul_cont, !dbg !201, !prof !202

complex_mul_libcall:                              ; preds = %complex_mul_imag_nan
  %call14 = call <2 x float> @__mulsc3(float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 1.000000e+00) #6, !dbg !201
  %18 = bitcast { float, float }* %coerce to <2 x float>*, !dbg !201
  store <2 x float> %call14, <2 x float>* %18, align 4, !dbg !201
  %coerce.realp = getelementptr inbounds { float, float }, { float, float }* %coerce, i32 0, i32 0, !dbg !201
  %coerce.real = load float, float* %coerce.realp, align 4, !dbg !201
  %coerce.imagp = getelementptr inbounds { float, float }, { float, float }* %coerce, i32 0, i32 1, !dbg !201
  %coerce.imag = load float, float* %coerce.imagp, align 4, !dbg !201
  br label %complex_mul_cont, !dbg !201

complex_mul_cont:                                 ; preds = %complex_mul_libcall, %complex_mul_imag_nan, %for.body
  %real_mul_phi = phi float [ 0.000000e+00, %for.body ], [ 0.000000e+00, %complex_mul_imag_nan ], [ %coerce.real, %complex_mul_libcall ], !dbg !201
  %imag_mul_phi = phi float [ 0.000000e+00, %for.body ], [ 0.000000e+00, %complex_mul_imag_nan ], [ %coerce.imag, %complex_mul_libcall ], !dbg !201
  %add.r = fadd float 0.000000e+00, %real_mul_phi, !dbg !203
  %add.i = fadd float 0.000000e+00, %imag_mul_phi, !dbg !203
  %conv15 = fpext float %add.r to double, !dbg !204
  %conv16 = fpext float %add.i to double, !dbg !204
  %z17 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 2, !dbg !205
  %19 = load { double, double }**, { double, double }*** %z17, align 8, !dbg !205
  %20 = load i32, i32* %i, align 4, !dbg !206
  %idxprom18 = sext i32 %20 to i64, !dbg !207
  %arrayidx19 = getelementptr inbounds { double, double }*, { double, double }** %19, i64 %idxprom18, !dbg !207
  %21 = load { double, double }*, { double, double }** %arrayidx19, align 8, !dbg !207
  %22 = load i32, i32* %j, align 4, !dbg !208
  %idxprom20 = sext i32 %22 to i64, !dbg !207
  %arrayidx21 = getelementptr inbounds { double, double }, { double, double }* %21, i64 %idxprom20, !dbg !207
  %arrayidx21.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx21, i32 0, i32 0, !dbg !209
  %arrayidx21.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx21, i32 0, i32 1, !dbg !209
  store double %conv15, double* %arrayidx21.realp, align 8, !dbg !209
  store double %conv16, double* %arrayidx21.imagp, align 8, !dbg !209
  store i32 0, i32* %j, align 4, !dbg !210
  br label %for.cond22, !dbg !212

for.cond22:                                       ; preds = %for.inc, %complex_mul_cont
  %23 = load i32, i32* %j, align 4, !dbg !213
  %cols23 = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 1, !dbg !215
  %24 = load i32, i32* %cols23, align 4, !dbg !215
  %cmp24 = icmp slt i32 %23, %24, !dbg !216
  br i1 %cmp24, label %for.body26, label %for.end, !dbg !217

for.body26:                                       ; preds = %for.cond22
  %z27 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !218
  %25 = load { double, double }**, { double, double }*** %z27, align 8, !dbg !218
  %26 = load i32, i32* %i, align 4, !dbg !220
  %idxprom28 = sext i32 %26 to i64, !dbg !221
  %arrayidx29 = getelementptr inbounds { double, double }*, { double, double }** %25, i64 %idxprom28, !dbg !221
  %27 = load { double, double }*, { double, double }** %arrayidx29, align 8, !dbg !221
  %28 = load i32, i32* %j, align 4, !dbg !222
  %idxprom30 = sext i32 %28 to i64, !dbg !221
  %arrayidx31 = getelementptr inbounds { double, double }, { double, double }* %27, i64 %idxprom30, !dbg !221
  %arrayidx31.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx31, i32 0, i32 0, !dbg !221
  %arrayidx31.real = load double, double* %arrayidx31.realp, align 8, !dbg !221
  %arrayidx31.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx31, i32 0, i32 1, !dbg !221
  %arrayidx31.imag = load double, double* %arrayidx31.imagp, align 8, !dbg !221
  %z32 = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 2, !dbg !223
  %29 = load { double, double }**, { double, double }*** %z32, align 8, !dbg !223
  %30 = load i32, i32* %j, align 4, !dbg !224
  %idxprom33 = sext i32 %30 to i64, !dbg !225
  %arrayidx34 = getelementptr inbounds { double, double }*, { double, double }** %29, i64 %idxprom33, !dbg !225
  %31 = load { double, double }*, { double, double }** %arrayidx34, align 8, !dbg !225
  %32 = load i32, i32* %i, align 4, !dbg !226
  %idxprom35 = sext i32 %32 to i64, !dbg !225
  %arrayidx36 = getelementptr inbounds { double, double }, { double, double }* %31, i64 %idxprom35, !dbg !225
  %arrayidx36.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx36, i32 0, i32 0, !dbg !225
  %arrayidx36.real = load double, double* %arrayidx36.realp, align 8, !dbg !225
  %arrayidx36.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx36, i32 0, i32 1, !dbg !225
  %arrayidx36.imag = load double, double* %arrayidx36.imagp, align 8, !dbg !225
  %mul_ac = fmul double %arrayidx31.real, %arrayidx36.real, !dbg !227
  %mul_bd = fmul double %arrayidx31.imag, %arrayidx36.imag, !dbg !227
  %mul_ad = fmul double %arrayidx31.real, %arrayidx36.imag, !dbg !227
  %mul_bc = fmul double %arrayidx31.imag, %arrayidx36.real, !dbg !227
  %mul_r = fsub double %mul_ac, %mul_bd, !dbg !227
  %mul_i = fadd double %mul_ad, %mul_bc, !dbg !227
  %isnan_cmp = fcmp uno double %mul_r, %mul_r, !dbg !227
  br i1 %isnan_cmp, label %complex_mul_imag_nan37, label %complex_mul_cont41, !dbg !227, !prof !202

complex_mul_imag_nan37:                           ; preds = %for.body26
  %isnan_cmp38 = fcmp uno double %mul_i, %mul_i, !dbg !227
  br i1 %isnan_cmp38, label %complex_mul_libcall39, label %complex_mul_cont41, !dbg !227, !prof !202

complex_mul_libcall39:                            ; preds = %complex_mul_imag_nan37
  %call40 = call { double, double } @__muldc3(double %arrayidx31.real, double %arrayidx31.imag, double %arrayidx36.real, double %arrayidx36.imag) #6, !dbg !227
  %33 = extractvalue { double, double } %call40, 0, !dbg !227
  %34 = extractvalue { double, double } %call40, 1, !dbg !227
  br label %complex_mul_cont41, !dbg !227

complex_mul_cont41:                               ; preds = %complex_mul_libcall39, %complex_mul_imag_nan37, %for.body26
  %real_mul_phi42 = phi double [ %mul_r, %for.body26 ], [ %mul_r, %complex_mul_imag_nan37 ], [ %33, %complex_mul_libcall39 ], !dbg !227
  %imag_mul_phi43 = phi double [ %mul_i, %for.body26 ], [ %mul_i, %complex_mul_imag_nan37 ], [ %34, %complex_mul_libcall39 ], !dbg !227
  %z44 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 2, !dbg !228
  %35 = load { double, double }**, { double, double }*** %z44, align 8, !dbg !228
  %36 = load i32, i32* %i, align 4, !dbg !229
  %idxprom45 = sext i32 %36 to i64, !dbg !230
  %arrayidx46 = getelementptr inbounds { double, double }*, { double, double }** %35, i64 %idxprom45, !dbg !230
  %37 = load { double, double }*, { double, double }** %arrayidx46, align 8, !dbg !230
  %38 = load i32, i32* %j, align 4, !dbg !231
  %idxprom47 = sext i32 %38 to i64, !dbg !230
  %arrayidx48 = getelementptr inbounds { double, double }, { double, double }* %37, i64 %idxprom47, !dbg !230
  %arrayidx48.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx48, i32 0, i32 0, !dbg !232
  %arrayidx48.real = load double, double* %arrayidx48.realp, align 8, !dbg !232
  %arrayidx48.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx48, i32 0, i32 1, !dbg !232
  %arrayidx48.imag = load double, double* %arrayidx48.imagp, align 8, !dbg !232
  %add.r49 = fadd double %arrayidx48.real, %real_mul_phi42, !dbg !232
  %add.i50 = fadd double %arrayidx48.imag, %imag_mul_phi43, !dbg !232
  %arrayidx48.realp51 = getelementptr inbounds { double, double }, { double, double }* %arrayidx48, i32 0, i32 0, !dbg !232
  %arrayidx48.imagp52 = getelementptr inbounds { double, double }, { double, double }* %arrayidx48, i32 0, i32 1, !dbg !232
  store double %add.r49, double* %arrayidx48.realp51, align 8, !dbg !232
  store double %add.i50, double* %arrayidx48.imagp52, align 8, !dbg !232
  br label %for.inc, !dbg !233

for.inc:                                          ; preds = %complex_mul_cont41
  %39 = load i32, i32* %j, align 4, !dbg !234
  %inc = add nsw i32 %39, 1, !dbg !234
  store i32 %inc, i32* %j, align 4, !dbg !234
  br label %for.cond22, !dbg !235, !llvm.loop !236

for.end:                                          ; preds = %for.cond22
  br label %for.inc53, !dbg !238

for.inc53:                                        ; preds = %for.end
  %40 = load i32, i32* %i, align 4, !dbg !239
  %inc54 = add nsw i32 %40, 1, !dbg !239
  store i32 %inc54, i32* %i, align 4, !dbg !239
  br label %for.cond, !dbg !240, !llvm.loop !241

for.end55:                                        ; preds = %for.cond
  br label %if.end, !dbg !243

if.end:                                           ; preds = %for.end55, %entry
  %41 = bitcast %struct.matrix* %retval to { i64, { double, double }** }*, !dbg !244
  %42 = load { i64, { double, double }** }, { i64, { double, double }** }* %41, align 8, !dbg !244
  ret { i64, { double, double }** } %42, !dbg !244
}

declare dso_local <2 x float> @__mulsc3(float, float, float, float)

declare dso_local { double, double } @__muldc3(double, double, double, double)

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @isNormal(i64 %a.coerce0, { double, double }** %a.coerce1) #0 !dbg !245 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.matrix, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %a_ah = alloca %struct.matrix, align 8
  %ah_a = alloca %struct.matrix, align 8
  %tmp = alloca %struct.matrix, align 8
  %agg.tmp = alloca %struct.matrix, align 8
  %tmp2 = alloca %struct.matrix, align 8
  %agg.tmp3 = alloca %struct.matrix, align 8
  %0 = bitcast %struct.matrix* %a to { i64, { double, double }** }*
  %1 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %0, i32 0, i32 0
  store i64 %a.coerce0, i64* %1, align 8
  %2 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %0, i32 0, i32 1
  store { double, double }** %a.coerce1, { double, double }*** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.matrix* %a, metadata !246, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.declare(metadata i32* %i, metadata !248, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.declare(metadata i32* %j, metadata !250, metadata !DIExpression()), !dbg !251
  call void @llvm.dbg.declare(metadata %struct.matrix* %a_ah, metadata !252, metadata !DIExpression()), !dbg !253
  call void @llvm.dbg.declare(metadata %struct.matrix* %ah_a, metadata !254, metadata !DIExpression()), !dbg !255
  %rows = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !256
  %3 = load i32, i32* %rows, align 8, !dbg !256
  %cols = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !258
  %4 = load i32, i32* %cols, align 4, !dbg !258
  %cmp = icmp ne i32 %3, %4, !dbg !259
  br i1 %cmp, label %if.then, label %if.end, !dbg !260

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !261
  br label %return, !dbg !261

if.end:                                           ; preds = %entry
  %5 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !262
  %6 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %5, i32 0, i32 0, !dbg !262
  %7 = load i64, i64* %6, align 8, !dbg !262
  %8 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %5, i32 0, i32 1, !dbg !262
  %9 = load { double, double }**, { double, double }*** %8, align 8, !dbg !262
  %call = call { i64, { double, double }** } @transpose(i64 %7, { double, double }** %9), !dbg !262
  %10 = bitcast %struct.matrix* %agg.tmp to { i64, { double, double }** }*, !dbg !262
  %11 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %10, i32 0, i32 0, !dbg !262
  %12 = extractvalue { i64, { double, double }** } %call, 0, !dbg !262
  store i64 %12, i64* %11, align 8, !dbg !262
  %13 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %10, i32 0, i32 1, !dbg !262
  %14 = extractvalue { i64, { double, double }** } %call, 1, !dbg !262
  store { double, double }** %14, { double, double }*** %13, align 8, !dbg !262
  %15 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !263
  %16 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %15, i32 0, i32 0, !dbg !263
  %17 = load i64, i64* %16, align 8, !dbg !263
  %18 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %15, i32 0, i32 1, !dbg !263
  %19 = load { double, double }**, { double, double }*** %18, align 8, !dbg !263
  %20 = bitcast %struct.matrix* %agg.tmp to { i64, { double, double }** }*, !dbg !263
  %21 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %20, i32 0, i32 0, !dbg !263
  %22 = load i64, i64* %21, align 8, !dbg !263
  %23 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %20, i32 0, i32 1, !dbg !263
  %24 = load { double, double }**, { double, double }*** %23, align 8, !dbg !263
  %call1 = call { i64, { double, double }** } @multiply(i64 %17, { double, double }** %19, i64 %22, { double, double }** %24), !dbg !263
  %25 = bitcast %struct.matrix* %tmp to { i64, { double, double }** }*, !dbg !263
  %26 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %25, i32 0, i32 0, !dbg !263
  %27 = extractvalue { i64, { double, double }** } %call1, 0, !dbg !263
  store i64 %27, i64* %26, align 8, !dbg !263
  %28 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %25, i32 0, i32 1, !dbg !263
  %29 = extractvalue { i64, { double, double }** } %call1, 1, !dbg !263
  store { double, double }** %29, { double, double }*** %28, align 8, !dbg !263
  %30 = bitcast %struct.matrix* %a_ah to i8*, !dbg !263
  %31 = bitcast %struct.matrix* %tmp to i8*, !dbg !263
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %30, i8* align 8 %31, i64 16, i1 false), !dbg !263
  %32 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !264
  %33 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %32, i32 0, i32 0, !dbg !264
  %34 = load i64, i64* %33, align 8, !dbg !264
  %35 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %32, i32 0, i32 1, !dbg !264
  %36 = load { double, double }**, { double, double }*** %35, align 8, !dbg !264
  %call4 = call { i64, { double, double }** } @transpose(i64 %34, { double, double }** %36), !dbg !264
  %37 = bitcast %struct.matrix* %agg.tmp3 to { i64, { double, double }** }*, !dbg !264
  %38 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %37, i32 0, i32 0, !dbg !264
  %39 = extractvalue { i64, { double, double }** } %call4, 0, !dbg !264
  store i64 %39, i64* %38, align 8, !dbg !264
  %40 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %37, i32 0, i32 1, !dbg !264
  %41 = extractvalue { i64, { double, double }** } %call4, 1, !dbg !264
  store { double, double }** %41, { double, double }*** %40, align 8, !dbg !264
  %42 = bitcast %struct.matrix* %agg.tmp3 to { i64, { double, double }** }*, !dbg !265
  %43 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %42, i32 0, i32 0, !dbg !265
  %44 = load i64, i64* %43, align 8, !dbg !265
  %45 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %42, i32 0, i32 1, !dbg !265
  %46 = load { double, double }**, { double, double }*** %45, align 8, !dbg !265
  %47 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !265
  %48 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %47, i32 0, i32 0, !dbg !265
  %49 = load i64, i64* %48, align 8, !dbg !265
  %50 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %47, i32 0, i32 1, !dbg !265
  %51 = load { double, double }**, { double, double }*** %50, align 8, !dbg !265
  %call5 = call { i64, { double, double }** } @multiply(i64 %44, { double, double }** %46, i64 %49, { double, double }** %51), !dbg !265
  %52 = bitcast %struct.matrix* %tmp2 to { i64, { double, double }** }*, !dbg !265
  %53 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %52, i32 0, i32 0, !dbg !265
  %54 = extractvalue { i64, { double, double }** } %call5, 0, !dbg !265
  store i64 %54, i64* %53, align 8, !dbg !265
  %55 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %52, i32 0, i32 1, !dbg !265
  %56 = extractvalue { i64, { double, double }** } %call5, 1, !dbg !265
  store { double, double }** %56, { double, double }*** %55, align 8, !dbg !265
  %57 = bitcast %struct.matrix* %ah_a to i8*, !dbg !265
  %58 = bitcast %struct.matrix* %tmp2 to i8*, !dbg !265
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %57, i8* align 8 %58, i64 16, i1 false), !dbg !265
  store i32 0, i32* %i, align 4, !dbg !266
  br label %for.cond, !dbg !268

for.cond:                                         ; preds = %for.inc21, %if.end
  %59 = load i32, i32* %i, align 4, !dbg !269
  %rows6 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !271
  %60 = load i32, i32* %rows6, align 8, !dbg !271
  %cmp7 = icmp slt i32 %59, %60, !dbg !272
  br i1 %cmp7, label %for.body, label %for.end23, !dbg !273

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !274
  br label %for.cond8, !dbg !277

for.cond8:                                        ; preds = %for.inc, %for.body
  %61 = load i32, i32* %j, align 4, !dbg !278
  %cols9 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !280
  %62 = load i32, i32* %cols9, align 4, !dbg !280
  %cmp10 = icmp slt i32 %61, %62, !dbg !281
  br i1 %cmp10, label %for.body11, label %for.end, !dbg !282

for.body11:                                       ; preds = %for.cond8
  %z = getelementptr inbounds %struct.matrix, %struct.matrix* %a_ah, i32 0, i32 2, !dbg !283
  %63 = load { double, double }**, { double, double }*** %z, align 8, !dbg !283
  %64 = load i32, i32* %i, align 4, !dbg !286
  %idxprom = sext i32 %64 to i64, !dbg !287
  %arrayidx = getelementptr inbounds { double, double }*, { double, double }** %63, i64 %idxprom, !dbg !287
  %65 = load { double, double }*, { double, double }** %arrayidx, align 8, !dbg !287
  %66 = load i32, i32* %j, align 4, !dbg !288
  %idxprom12 = sext i32 %66 to i64, !dbg !287
  %arrayidx13 = getelementptr inbounds { double, double }, { double, double }* %65, i64 %idxprom12, !dbg !287
  %arrayidx13.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx13, i32 0, i32 0, !dbg !287
  %arrayidx13.real = load double, double* %arrayidx13.realp, align 8, !dbg !287
  %arrayidx13.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx13, i32 0, i32 1, !dbg !287
  %arrayidx13.imag = load double, double* %arrayidx13.imagp, align 8, !dbg !287
  %z14 = getelementptr inbounds %struct.matrix, %struct.matrix* %ah_a, i32 0, i32 2, !dbg !289
  %67 = load { double, double }**, { double, double }*** %z14, align 8, !dbg !289
  %68 = load i32, i32* %i, align 4, !dbg !290
  %idxprom15 = sext i32 %68 to i64, !dbg !291
  %arrayidx16 = getelementptr inbounds { double, double }*, { double, double }** %67, i64 %idxprom15, !dbg !291
  %69 = load { double, double }*, { double, double }** %arrayidx16, align 8, !dbg !291
  %70 = load i32, i32* %j, align 4, !dbg !292
  %idxprom17 = sext i32 %70 to i64, !dbg !291
  %arrayidx18 = getelementptr inbounds { double, double }, { double, double }* %69, i64 %idxprom17, !dbg !291
  %arrayidx18.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx18, i32 0, i32 0, !dbg !291
  %arrayidx18.real = load double, double* %arrayidx18.realp, align 8, !dbg !291
  %arrayidx18.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx18, i32 0, i32 1, !dbg !291
  %arrayidx18.imag = load double, double* %arrayidx18.imagp, align 8, !dbg !291
  %cmp.r = fcmp une double %arrayidx13.real, %arrayidx18.real, !dbg !293
  %cmp.i = fcmp une double %arrayidx13.imag, %arrayidx18.imag, !dbg !293
  %or.ri = or i1 %cmp.r, %cmp.i, !dbg !293
  br i1 %or.ri, label %if.then19, label %if.end20, !dbg !294

if.then19:                                        ; preds = %for.body11
  store i32 0, i32* %retval, align 4, !dbg !295
  br label %return, !dbg !295

if.end20:                                         ; preds = %for.body11
  br label %for.inc, !dbg !296

for.inc:                                          ; preds = %if.end20
  %71 = load i32, i32* %j, align 4, !dbg !297
  %inc = add nsw i32 %71, 1, !dbg !297
  store i32 %inc, i32* %j, align 4, !dbg !297
  br label %for.cond8, !dbg !298, !llvm.loop !299

for.end:                                          ; preds = %for.cond8
  br label %for.inc21, !dbg !301

for.inc21:                                        ; preds = %for.end
  %72 = load i32, i32* %i, align 4, !dbg !302
  %inc22 = add nsw i32 %72, 1, !dbg !302
  store i32 %inc22, i32* %i, align 4, !dbg !302
  br label %for.cond, !dbg !303, !llvm.loop !304

for.end23:                                        ; preds = %for.cond
  store i32 1, i32* %retval, align 4, !dbg !306
  br label %return, !dbg !306

return:                                           ; preds = %for.end23, %if.then19, %if.then
  %73 = load i32, i32* %retval, align 4, !dbg !307
  ret i32 %73, !dbg !307
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @isUnitary(i64 %a.coerce0, { double, double }** %a.coerce1) #0 !dbg !308 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.matrix, align 8
  %b = alloca %struct.matrix, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %tmp = alloca %struct.matrix, align 8
  %agg.tmp = alloca %struct.matrix, align 8
  %0 = bitcast %struct.matrix* %a to { i64, { double, double }** }*
  %1 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %0, i32 0, i32 0
  store i64 %a.coerce0, i64* %1, align 8
  %2 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %0, i32 0, i32 1
  store { double, double }** %a.coerce1, { double, double }*** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.matrix* %a, metadata !309, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.declare(metadata %struct.matrix* %b, metadata !311, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.declare(metadata i32* %i, metadata !313, metadata !DIExpression()), !dbg !314
  call void @llvm.dbg.declare(metadata i32* %j, metadata !315, metadata !DIExpression()), !dbg !316
  %3 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !317
  %4 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %3, i32 0, i32 0, !dbg !317
  %5 = load i64, i64* %4, align 8, !dbg !317
  %6 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %3, i32 0, i32 1, !dbg !317
  %7 = load { double, double }**, { double, double }*** %6, align 8, !dbg !317
  %call = call i32 @isNormal(i64 %5, { double, double }** %7), !dbg !317
  %cmp = icmp eq i32 %call, 1, !dbg !319
  br i1 %cmp, label %if.then, label %if.end24, !dbg !320

if.then:                                          ; preds = %entry
  %8 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !321
  %9 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %8, i32 0, i32 0, !dbg !321
  %10 = load i64, i64* %9, align 8, !dbg !321
  %11 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %8, i32 0, i32 1, !dbg !321
  %12 = load { double, double }**, { double, double }*** %11, align 8, !dbg !321
  %call1 = call { i64, { double, double }** } @transpose(i64 %10, { double, double }** %12), !dbg !321
  %13 = bitcast %struct.matrix* %agg.tmp to { i64, { double, double }** }*, !dbg !321
  %14 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %13, i32 0, i32 0, !dbg !321
  %15 = extractvalue { i64, { double, double }** } %call1, 0, !dbg !321
  store i64 %15, i64* %14, align 8, !dbg !321
  %16 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %13, i32 0, i32 1, !dbg !321
  %17 = extractvalue { i64, { double, double }** } %call1, 1, !dbg !321
  store { double, double }** %17, { double, double }*** %16, align 8, !dbg !321
  %18 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !323
  %19 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %18, i32 0, i32 0, !dbg !323
  %20 = load i64, i64* %19, align 8, !dbg !323
  %21 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %18, i32 0, i32 1, !dbg !323
  %22 = load { double, double }**, { double, double }*** %21, align 8, !dbg !323
  %23 = bitcast %struct.matrix* %agg.tmp to { i64, { double, double }** }*, !dbg !323
  %24 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %23, i32 0, i32 0, !dbg !323
  %25 = load i64, i64* %24, align 8, !dbg !323
  %26 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %23, i32 0, i32 1, !dbg !323
  %27 = load { double, double }**, { double, double }*** %26, align 8, !dbg !323
  %call2 = call { i64, { double, double }** } @multiply(i64 %20, { double, double }** %22, i64 %25, { double, double }** %27), !dbg !323
  %28 = bitcast %struct.matrix* %tmp to { i64, { double, double }** }*, !dbg !323
  %29 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %28, i32 0, i32 0, !dbg !323
  %30 = extractvalue { i64, { double, double }** } %call2, 0, !dbg !323
  store i64 %30, i64* %29, align 8, !dbg !323
  %31 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %28, i32 0, i32 1, !dbg !323
  %32 = extractvalue { i64, { double, double }** } %call2, 1, !dbg !323
  store { double, double }** %32, { double, double }*** %31, align 8, !dbg !323
  %33 = bitcast %struct.matrix* %b to i8*, !dbg !323
  %34 = bitcast %struct.matrix* %tmp to i8*, !dbg !323
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %33, i8* align 8 %34, i64 16, i1 false), !dbg !323
  store i32 0, i32* %i, align 4, !dbg !324
  br label %for.cond, !dbg !326

for.cond:                                         ; preds = %for.inc21, %if.then
  %35 = load i32, i32* %i, align 4, !dbg !327
  %rows = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 0, !dbg !329
  %36 = load i32, i32* %rows, align 8, !dbg !329
  %cmp3 = icmp slt i32 %35, %36, !dbg !330
  br i1 %cmp3, label %for.body, label %for.end23, !dbg !331

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !332
  br label %for.cond4, !dbg !335

for.cond4:                                        ; preds = %for.inc, %for.body
  %37 = load i32, i32* %j, align 4, !dbg !336
  %cols = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 1, !dbg !338
  %38 = load i32, i32* %cols, align 4, !dbg !338
  %cmp5 = icmp slt i32 %37, %38, !dbg !339
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !340

for.body6:                                        ; preds = %for.cond4
  %39 = load i32, i32* %i, align 4, !dbg !341
  %40 = load i32, i32* %j, align 4, !dbg !344
  %cmp7 = icmp eq i32 %39, %40, !dbg !345
  br i1 %cmp7, label %land.lhs.true, label %lor.lhs.false, !dbg !346

land.lhs.true:                                    ; preds = %for.body6
  %z = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 2, !dbg !347
  %41 = load { double, double }**, { double, double }*** %z, align 8, !dbg !347
  %42 = load i32, i32* %i, align 4, !dbg !348
  %idxprom = sext i32 %42 to i64, !dbg !349
  %arrayidx = getelementptr inbounds { double, double }*, { double, double }** %41, i64 %idxprom, !dbg !349
  %43 = load { double, double }*, { double, double }** %arrayidx, align 8, !dbg !349
  %44 = load i32, i32* %j, align 4, !dbg !350
  %idxprom8 = sext i32 %44 to i64, !dbg !349
  %arrayidx9 = getelementptr inbounds { double, double }, { double, double }* %43, i64 %idxprom8, !dbg !349
  %arrayidx9.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx9, i32 0, i32 0, !dbg !349
  %arrayidx9.real = load double, double* %arrayidx9.realp, align 8, !dbg !349
  %arrayidx9.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx9, i32 0, i32 1, !dbg !349
  %arrayidx9.imag = load double, double* %arrayidx9.imagp, align 8, !dbg !349
  %cmp.r = fcmp une double %arrayidx9.real, 1.000000e+00, !dbg !351
  %cmp.i = fcmp une double %arrayidx9.imag, 0.000000e+00, !dbg !351
  %or.ri = or i1 %cmp.r, %cmp.i, !dbg !351
  br i1 %or.ri, label %if.then20, label %lor.lhs.false, !dbg !352

lor.lhs.false:                                    ; preds = %land.lhs.true, %for.body6
  %45 = load i32, i32* %i, align 4, !dbg !353
  %46 = load i32, i32* %j, align 4, !dbg !354
  %cmp10 = icmp ne i32 %45, %46, !dbg !355
  br i1 %cmp10, label %land.lhs.true11, label %if.end, !dbg !356

land.lhs.true11:                                  ; preds = %lor.lhs.false
  %z12 = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 2, !dbg !357
  %47 = load { double, double }**, { double, double }*** %z12, align 8, !dbg !357
  %48 = load i32, i32* %i, align 4, !dbg !358
  %idxprom13 = sext i32 %48 to i64, !dbg !359
  %arrayidx14 = getelementptr inbounds { double, double }*, { double, double }** %47, i64 %idxprom13, !dbg !359
  %49 = load { double, double }*, { double, double }** %arrayidx14, align 8, !dbg !359
  %50 = load i32, i32* %j, align 4, !dbg !360
  %idxprom15 = sext i32 %50 to i64, !dbg !359
  %arrayidx16 = getelementptr inbounds { double, double }, { double, double }* %49, i64 %idxprom15, !dbg !359
  %arrayidx16.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx16, i32 0, i32 0, !dbg !359
  %arrayidx16.real = load double, double* %arrayidx16.realp, align 8, !dbg !359
  %arrayidx16.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx16, i32 0, i32 1, !dbg !359
  %arrayidx16.imag = load double, double* %arrayidx16.imagp, align 8, !dbg !359
  %cmp.r17 = fcmp une double %arrayidx16.real, 0.000000e+00, !dbg !361
  %cmp.i18 = fcmp une double %arrayidx16.imag, 0.000000e+00, !dbg !361
  %or.ri19 = or i1 %cmp.r17, %cmp.i18, !dbg !361
  br i1 %or.ri19, label %if.then20, label %if.end, !dbg !362

if.then20:                                        ; preds = %land.lhs.true11, %land.lhs.true
  store i32 0, i32* %retval, align 4, !dbg !363
  br label %return, !dbg !363

if.end:                                           ; preds = %land.lhs.true11, %lor.lhs.false
  br label %for.inc, !dbg !364

for.inc:                                          ; preds = %if.end
  %51 = load i32, i32* %j, align 4, !dbg !365
  %inc = add nsw i32 %51, 1, !dbg !365
  store i32 %inc, i32* %j, align 4, !dbg !365
  br label %for.cond4, !dbg !366, !llvm.loop !367

for.end:                                          ; preds = %for.cond4
  br label %for.inc21, !dbg !369

for.inc21:                                        ; preds = %for.end
  %52 = load i32, i32* %i, align 4, !dbg !370
  %inc22 = add nsw i32 %52, 1, !dbg !370
  store i32 %inc22, i32* %i, align 4, !dbg !370
  br label %for.cond, !dbg !371, !llvm.loop !372

for.end23:                                        ; preds = %for.cond
  store i32 1, i32* %retval, align 4, !dbg !374
  br label %return, !dbg !374

if.end24:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !375
  br label %return, !dbg !375

return:                                           ; preds = %if.end24, %for.end23, %if.then20
  %53 = load i32, i32* %retval, align 4, !dbg !376
  ret i32 %53, !dbg !376
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #3 !dbg !377 {
entry:
  %retval = alloca i32, align 4
  %z = alloca { double, double }, align 8
  %coerce = alloca { float, float }, align 4
  %a = alloca %struct.matrix, align 8
  %aT = alloca %struct.matrix, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %coerce31 = alloca { float, float }, align 4
  %tmp = alloca %struct.matrix, align 8
  %coerce93 = alloca { float, float }, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata { double, double }* %z, metadata !380, metadata !DIExpression()), !dbg !381
  br i1 false, label %complex_mul_imag_nan, label %complex_mul_cont, !dbg !382, !prof !202

complex_mul_imag_nan:                             ; preds = %entry
  br i1 false, label %complex_mul_libcall, label %complex_mul_cont, !dbg !382, !prof !202

complex_mul_libcall:                              ; preds = %complex_mul_imag_nan
  %call = call <2 x float> @__mulsc3(float 4.000000e+00, float 0.000000e+00, float 0.000000e+00, float 1.000000e+00) #6, !dbg !382
  %0 = bitcast { float, float }* %coerce to <2 x float>*, !dbg !382
  store <2 x float> %call, <2 x float>* %0, align 4, !dbg !382
  %coerce.realp = getelementptr inbounds { float, float }, { float, float }* %coerce, i32 0, i32 0, !dbg !382
  %coerce.real = load float, float* %coerce.realp, align 4, !dbg !382
  %coerce.imagp = getelementptr inbounds { float, float }, { float, float }* %coerce, i32 0, i32 1, !dbg !382
  %coerce.imag = load float, float* %coerce.imagp, align 4, !dbg !382
  br label %complex_mul_cont, !dbg !382

complex_mul_cont:                                 ; preds = %complex_mul_libcall, %complex_mul_imag_nan, %entry
  %real_mul_phi = phi float [ 0.000000e+00, %entry ], [ 0.000000e+00, %complex_mul_imag_nan ], [ %coerce.real, %complex_mul_libcall ], !dbg !382
  %imag_mul_phi = phi float [ 4.000000e+00, %entry ], [ 4.000000e+00, %complex_mul_imag_nan ], [ %coerce.imag, %complex_mul_libcall ], !dbg !382
  %add.r = fadd float 3.000000e+00, %real_mul_phi, !dbg !383
  %add.i = fadd float 0.000000e+00, %imag_mul_phi, !dbg !383
  %conv = fpext float %add.r to double, !dbg !384
  %conv1 = fpext float %add.i to double, !dbg !384
  %z.realp = getelementptr inbounds { double, double }, { double, double }* %z, i32 0, i32 0, !dbg !381
  %z.imagp = getelementptr inbounds { double, double }, { double, double }* %z, i32 0, i32 1, !dbg !381
  store double %conv, double* %z.realp, align 8, !dbg !381
  store double %conv1, double* %z.imagp, align 8, !dbg !381
  call void @llvm.dbg.declare(metadata %struct.matrix* %a, metadata !385, metadata !DIExpression()), !dbg !386
  call void @llvm.dbg.declare(metadata %struct.matrix* %aT, metadata !387, metadata !DIExpression()), !dbg !388
  call void @llvm.dbg.declare(metadata i32* %i, metadata !389, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.declare(metadata i32* %j, metadata !391, metadata !DIExpression()), !dbg !392
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0)), !dbg !393
  %rows = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !394
  %cols = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !395
  %call3 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i32* %rows, i32* %cols), !dbg !396
  %rows4 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !397
  %1 = load i32, i32* %rows4, align 8, !dbg !397
  %conv5 = sext i32 %1 to i64, !dbg !398
  %mul = mul i64 %conv5, 8, !dbg !399
  %call6 = call noalias i8* @malloc(i64 %mul) #6, !dbg !400
  %2 = bitcast i8* %call6 to { double, double }**, !dbg !400
  %z7 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !401
  store { double, double }** %2, { double, double }*** %z7, align 8, !dbg !402
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.2, i64 0, i64 0)), !dbg !403
  store i32 0, i32* %i, align 4, !dbg !404
  br label %for.cond, !dbg !406

for.cond:                                         ; preds = %for.inc55, %complex_mul_cont
  %3 = load i32, i32* %i, align 4, !dbg !407
  %rows9 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !409
  %4 = load i32, i32* %rows9, align 8, !dbg !409
  %cmp = icmp slt i32 %3, %4, !dbg !410
  br i1 %cmp, label %for.body, label %for.end57, !dbg !411

for.body:                                         ; preds = %for.cond
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !412
  %cols12 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !414
  %5 = load i32, i32* %cols12, align 4, !dbg !414
  %conv13 = sext i32 %5 to i64, !dbg !415
  %mul14 = mul i64 %conv13, 16, !dbg !416
  %call15 = call noalias i8* @malloc(i64 %mul14) #6, !dbg !417
  %6 = bitcast i8* %call15 to { double, double }*, !dbg !417
  %z16 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !418
  %7 = load { double, double }**, { double, double }*** %z16, align 8, !dbg !418
  %8 = load i32, i32* %i, align 4, !dbg !419
  %idxprom = sext i32 %8 to i64, !dbg !420
  %arrayidx = getelementptr inbounds { double, double }*, { double, double }** %7, i64 %idxprom, !dbg !420
  store { double, double }* %6, { double, double }** %arrayidx, align 8, !dbg !421
  store i32 0, i32* %j, align 4, !dbg !422
  br label %for.cond17, !dbg !424

for.cond17:                                       ; preds = %for.inc, %for.body
  %9 = load i32, i32* %j, align 4, !dbg !425
  %cols18 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !427
  %10 = load i32, i32* %cols18, align 4, !dbg !427
  %cmp19 = icmp slt i32 %9, %10, !dbg !428
  br i1 %cmp19, label %for.body21, label %for.end, !dbg !429

for.body21:                                       ; preds = %for.cond17
  %call22 = call i32 @rand() #6, !dbg !430
  %rem = srem i32 %call22, 10, !dbg !432
  %conv23 = sitofp i32 %rem to float, !dbg !430
  %call24 = call i32 @rand() #6, !dbg !433
  %rem25 = srem i32 %call24, 10, !dbg !434
  %conv26 = sitofp i32 %rem25 to float, !dbg !433
  %mul_ac = fmul float %conv26, 0.000000e+00, !dbg !435
  %mul_ad = fmul float %conv26, 1.000000e+00, !dbg !435
  %mul_r = fsub float %mul_ac, 0.000000e+00, !dbg !435
  %mul_i = fadd float %mul_ad, 0.000000e+00, !dbg !435
  %isnan_cmp = fcmp uno float %mul_r, %mul_r, !dbg !435
  br i1 %isnan_cmp, label %complex_mul_imag_nan27, label %complex_mul_cont32, !dbg !435, !prof !202

complex_mul_imag_nan27:                           ; preds = %for.body21
  %isnan_cmp28 = fcmp uno float %mul_i, %mul_i, !dbg !435
  br i1 %isnan_cmp28, label %complex_mul_libcall29, label %complex_mul_cont32, !dbg !435, !prof !202

complex_mul_libcall29:                            ; preds = %complex_mul_imag_nan27
  %call30 = call <2 x float> @__mulsc3(float %conv26, float 0.000000e+00, float 0.000000e+00, float 1.000000e+00) #6, !dbg !435
  %11 = bitcast { float, float }* %coerce31 to <2 x float>*, !dbg !435
  store <2 x float> %call30, <2 x float>* %11, align 4, !dbg !435
  %coerce31.realp = getelementptr inbounds { float, float }, { float, float }* %coerce31, i32 0, i32 0, !dbg !435
  %coerce31.real = load float, float* %coerce31.realp, align 4, !dbg !435
  %coerce31.imagp = getelementptr inbounds { float, float }, { float, float }* %coerce31, i32 0, i32 1, !dbg !435
  %coerce31.imag = load float, float* %coerce31.imagp, align 4, !dbg !435
  br label %complex_mul_cont32, !dbg !435

complex_mul_cont32:                               ; preds = %complex_mul_libcall29, %complex_mul_imag_nan27, %for.body21
  %real_mul_phi33 = phi float [ %mul_r, %for.body21 ], [ %mul_r, %complex_mul_imag_nan27 ], [ %coerce31.real, %complex_mul_libcall29 ], !dbg !435
  %imag_mul_phi34 = phi float [ %mul_i, %for.body21 ], [ %mul_i, %complex_mul_imag_nan27 ], [ %coerce31.imag, %complex_mul_libcall29 ], !dbg !435
  %add.r35 = fadd float %conv23, %real_mul_phi33, !dbg !436
  %add.i36 = fadd float 0.000000e+00, %imag_mul_phi34, !dbg !436
  %conv37 = fpext float %add.r35 to double, !dbg !430
  %conv38 = fpext float %add.i36 to double, !dbg !430
  %z39 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !437
  %12 = load { double, double }**, { double, double }*** %z39, align 8, !dbg !437
  %13 = load i32, i32* %i, align 4, !dbg !438
  %idxprom40 = sext i32 %13 to i64, !dbg !439
  %arrayidx41 = getelementptr inbounds { double, double }*, { double, double }** %12, i64 %idxprom40, !dbg !439
  %14 = load { double, double }*, { double, double }** %arrayidx41, align 8, !dbg !439
  %15 = load i32, i32* %j, align 4, !dbg !440
  %idxprom42 = sext i32 %15 to i64, !dbg !439
  %arrayidx43 = getelementptr inbounds { double, double }, { double, double }* %14, i64 %idxprom42, !dbg !439
  %arrayidx43.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx43, i32 0, i32 0, !dbg !441
  %arrayidx43.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx43, i32 0, i32 1, !dbg !441
  store double %conv37, double* %arrayidx43.realp, align 8, !dbg !441
  store double %conv38, double* %arrayidx43.imagp, align 8, !dbg !441
  %z44 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !442
  %16 = load { double, double }**, { double, double }*** %z44, align 8, !dbg !442
  %17 = load i32, i32* %i, align 4, !dbg !443
  %idxprom45 = sext i32 %17 to i64, !dbg !444
  %arrayidx46 = getelementptr inbounds { double, double }*, { double, double }** %16, i64 %idxprom45, !dbg !444
  %18 = load { double, double }*, { double, double }** %arrayidx46, align 8, !dbg !444
  %19 = load i32, i32* %j, align 4, !dbg !445
  %idxprom47 = sext i32 %19 to i64, !dbg !444
  %arrayidx48 = getelementptr inbounds { double, double }, { double, double }* %18, i64 %idxprom47, !dbg !444
  %arrayidx48.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx48, i32 0, i32 0, !dbg !444
  %arrayidx48.real = load double, double* %arrayidx48.realp, align 8, !dbg !444
  %arrayidx48.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx48, i32 0, i32 1, !dbg !444
  %arrayidx48.imag = load double, double* %arrayidx48.imagp, align 8, !dbg !444
  %z49 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !446
  %20 = load { double, double }**, { double, double }*** %z49, align 8, !dbg !446
  %21 = load i32, i32* %i, align 4, !dbg !447
  %idxprom50 = sext i32 %21 to i64, !dbg !448
  %arrayidx51 = getelementptr inbounds { double, double }*, { double, double }** %20, i64 %idxprom50, !dbg !448
  %22 = load { double, double }*, { double, double }** %arrayidx51, align 8, !dbg !448
  %23 = load i32, i32* %j, align 4, !dbg !449
  %idxprom52 = sext i32 %23 to i64, !dbg !448
  %arrayidx53 = getelementptr inbounds { double, double }, { double, double }* %22, i64 %idxprom52, !dbg !448
  %arrayidx53.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx53, i32 0, i32 0, !dbg !448
  %arrayidx53.real = load double, double* %arrayidx53.realp, align 8, !dbg !448
  %arrayidx53.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx53, i32 0, i32 1, !dbg !448
  %arrayidx53.imag = load double, double* %arrayidx53.imagp, align 8, !dbg !448
  %call54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), double %arrayidx48.real, double %arrayidx53.imag), !dbg !450
  br label %for.inc, !dbg !451

for.inc:                                          ; preds = %complex_mul_cont32
  %24 = load i32, i32* %j, align 4, !dbg !452
  %inc = add nsw i32 %24, 1, !dbg !452
  store i32 %inc, i32* %j, align 4, !dbg !452
  br label %for.cond17, !dbg !453, !llvm.loop !454

for.end:                                          ; preds = %for.cond17
  br label %for.inc55, !dbg !456

for.inc55:                                        ; preds = %for.end
  %25 = load i32, i32* %i, align 4, !dbg !457
  %inc56 = add nsw i32 %25, 1, !dbg !457
  store i32 %inc56, i32* %i, align 4, !dbg !457
  br label %for.cond, !dbg !458, !llvm.loop !459

for.end57:                                        ; preds = %for.cond
  %26 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !461
  %27 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %26, i32 0, i32 0, !dbg !461
  %28 = load i64, i64* %27, align 8, !dbg !461
  %29 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %26, i32 0, i32 1, !dbg !461
  %30 = load { double, double }**, { double, double }*** %29, align 8, !dbg !461
  %call58 = call { i64, { double, double }** } @transpose(i64 %28, { double, double }** %30), !dbg !461
  %31 = bitcast %struct.matrix* %tmp to { i64, { double, double }** }*, !dbg !461
  %32 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %31, i32 0, i32 0, !dbg !461
  %33 = extractvalue { i64, { double, double }** } %call58, 0, !dbg !461
  store i64 %33, i64* %32, align 8, !dbg !461
  %34 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %31, i32 0, i32 1, !dbg !461
  %35 = extractvalue { i64, { double, double }** } %call58, 1, !dbg !461
  store { double, double }** %35, { double, double }*** %34, align 8, !dbg !461
  %36 = bitcast %struct.matrix* %aT to i8*, !dbg !461
  %37 = bitcast %struct.matrix* %tmp to i8*, !dbg !461
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %36, i8* align 8 %37, i64 16, i1 false), !dbg !461
  %call59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.5, i64 0, i64 0)), !dbg !462
  store i32 0, i32* %i, align 4, !dbg !463
  br label %for.cond60, !dbg !465

for.cond60:                                       ; preds = %for.inc120, %for.end57
  %38 = load i32, i32* %i, align 4, !dbg !466
  %rows61 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 0, !dbg !468
  %39 = load i32, i32* %rows61, align 8, !dbg !468
  %cmp62 = icmp slt i32 %38, %39, !dbg !469
  br i1 %cmp62, label %for.body64, label %for.end122, !dbg !470

for.body64:                                       ; preds = %for.cond60
  %call65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !471
  %cols66 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 1, !dbg !473
  %40 = load i32, i32* %cols66, align 4, !dbg !473
  %conv67 = sext i32 %40 to i64, !dbg !474
  %mul68 = mul i64 %conv67, 16, !dbg !475
  %call69 = call noalias i8* @malloc(i64 %mul68) #6, !dbg !476
  %41 = bitcast i8* %call69 to { double, double }*, !dbg !476
  %z70 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 2, !dbg !477
  %42 = load { double, double }**, { double, double }*** %z70, align 8, !dbg !477
  %43 = load i32, i32* %i, align 4, !dbg !478
  %idxprom71 = sext i32 %43 to i64, !dbg !479
  %arrayidx72 = getelementptr inbounds { double, double }*, { double, double }** %42, i64 %idxprom71, !dbg !479
  store { double, double }* %41, { double, double }** %arrayidx72, align 8, !dbg !480
  store i32 0, i32* %j, align 4, !dbg !481
  br label %for.cond73, !dbg !483

for.cond73:                                       ; preds = %for.inc117, %for.body64
  %44 = load i32, i32* %j, align 4, !dbg !484
  %cols74 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 1, !dbg !486
  %45 = load i32, i32* %cols74, align 4, !dbg !486
  %cmp75 = icmp slt i32 %44, %45, !dbg !487
  br i1 %cmp75, label %for.body77, label %for.end119, !dbg !488

for.body77:                                       ; preds = %for.cond73
  %call78 = call i32 @rand() #6, !dbg !489
  %rem79 = srem i32 %call78, 10, !dbg !491
  %conv80 = sitofp i32 %rem79 to float, !dbg !489
  %call81 = call i32 @rand() #6, !dbg !492
  %rem82 = srem i32 %call81, 10, !dbg !493
  %conv83 = sitofp i32 %rem82 to float, !dbg !492
  %mul_ac84 = fmul float %conv83, 0.000000e+00, !dbg !494
  %mul_ad85 = fmul float %conv83, 1.000000e+00, !dbg !494
  %mul_r86 = fsub float %mul_ac84, 0.000000e+00, !dbg !494
  %mul_i87 = fadd float %mul_ad85, 0.000000e+00, !dbg !494
  %isnan_cmp88 = fcmp uno float %mul_r86, %mul_r86, !dbg !494
  br i1 %isnan_cmp88, label %complex_mul_imag_nan89, label %complex_mul_cont94, !dbg !494, !prof !202

complex_mul_imag_nan89:                           ; preds = %for.body77
  %isnan_cmp90 = fcmp uno float %mul_i87, %mul_i87, !dbg !494
  br i1 %isnan_cmp90, label %complex_mul_libcall91, label %complex_mul_cont94, !dbg !494, !prof !202

complex_mul_libcall91:                            ; preds = %complex_mul_imag_nan89
  %call92 = call <2 x float> @__mulsc3(float %conv83, float 0.000000e+00, float 0.000000e+00, float 1.000000e+00) #6, !dbg !494
  %46 = bitcast { float, float }* %coerce93 to <2 x float>*, !dbg !494
  store <2 x float> %call92, <2 x float>* %46, align 4, !dbg !494
  %coerce93.realp = getelementptr inbounds { float, float }, { float, float }* %coerce93, i32 0, i32 0, !dbg !494
  %coerce93.real = load float, float* %coerce93.realp, align 4, !dbg !494
  %coerce93.imagp = getelementptr inbounds { float, float }, { float, float }* %coerce93, i32 0, i32 1, !dbg !494
  %coerce93.imag = load float, float* %coerce93.imagp, align 4, !dbg !494
  br label %complex_mul_cont94, !dbg !494

complex_mul_cont94:                               ; preds = %complex_mul_libcall91, %complex_mul_imag_nan89, %for.body77
  %real_mul_phi95 = phi float [ %mul_r86, %for.body77 ], [ %mul_r86, %complex_mul_imag_nan89 ], [ %coerce93.real, %complex_mul_libcall91 ], !dbg !494
  %imag_mul_phi96 = phi float [ %mul_i87, %for.body77 ], [ %mul_i87, %complex_mul_imag_nan89 ], [ %coerce93.imag, %complex_mul_libcall91 ], !dbg !494
  %add.r97 = fadd float %conv80, %real_mul_phi95, !dbg !495
  %add.i98 = fadd float 0.000000e+00, %imag_mul_phi96, !dbg !495
  %conv99 = fpext float %add.r97 to double, !dbg !489
  %conv100 = fpext float %add.i98 to double, !dbg !489
  %z101 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 2, !dbg !496
  %47 = load { double, double }**, { double, double }*** %z101, align 8, !dbg !496
  %48 = load i32, i32* %i, align 4, !dbg !497
  %idxprom102 = sext i32 %48 to i64, !dbg !498
  %arrayidx103 = getelementptr inbounds { double, double }*, { double, double }** %47, i64 %idxprom102, !dbg !498
  %49 = load { double, double }*, { double, double }** %arrayidx103, align 8, !dbg !498
  %50 = load i32, i32* %j, align 4, !dbg !499
  %idxprom104 = sext i32 %50 to i64, !dbg !498
  %arrayidx105 = getelementptr inbounds { double, double }, { double, double }* %49, i64 %idxprom104, !dbg !498
  %arrayidx105.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx105, i32 0, i32 0, !dbg !500
  %arrayidx105.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx105, i32 0, i32 1, !dbg !500
  store double %conv99, double* %arrayidx105.realp, align 8, !dbg !500
  store double %conv100, double* %arrayidx105.imagp, align 8, !dbg !500
  %z106 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 2, !dbg !501
  %51 = load { double, double }**, { double, double }*** %z106, align 8, !dbg !501
  %52 = load i32, i32* %i, align 4, !dbg !502
  %idxprom107 = sext i32 %52 to i64, !dbg !503
  %arrayidx108 = getelementptr inbounds { double, double }*, { double, double }** %51, i64 %idxprom107, !dbg !503
  %53 = load { double, double }*, { double, double }** %arrayidx108, align 8, !dbg !503
  %54 = load i32, i32* %j, align 4, !dbg !504
  %idxprom109 = sext i32 %54 to i64, !dbg !503
  %arrayidx110 = getelementptr inbounds { double, double }, { double, double }* %53, i64 %idxprom109, !dbg !503
  %arrayidx110.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx110, i32 0, i32 0, !dbg !503
  %arrayidx110.real = load double, double* %arrayidx110.realp, align 8, !dbg !503
  %arrayidx110.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx110, i32 0, i32 1, !dbg !503
  %arrayidx110.imag = load double, double* %arrayidx110.imagp, align 8, !dbg !503
  %z111 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 2, !dbg !505
  %55 = load { double, double }**, { double, double }*** %z111, align 8, !dbg !505
  %56 = load i32, i32* %i, align 4, !dbg !506
  %idxprom112 = sext i32 %56 to i64, !dbg !507
  %arrayidx113 = getelementptr inbounds { double, double }*, { double, double }** %55, i64 %idxprom112, !dbg !507
  %57 = load { double, double }*, { double, double }** %arrayidx113, align 8, !dbg !507
  %58 = load i32, i32* %j, align 4, !dbg !508
  %idxprom114 = sext i32 %58 to i64, !dbg !507
  %arrayidx115 = getelementptr inbounds { double, double }, { double, double }* %57, i64 %idxprom114, !dbg !507
  %arrayidx115.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx115, i32 0, i32 0, !dbg !507
  %arrayidx115.real = load double, double* %arrayidx115.realp, align 8, !dbg !507
  %arrayidx115.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx115, i32 0, i32 1, !dbg !507
  %arrayidx115.imag = load double, double* %arrayidx115.imagp, align 8, !dbg !507
  %call116 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), double %arrayidx110.real, double %arrayidx115.imag), !dbg !509
  br label %for.inc117, !dbg !510

for.inc117:                                       ; preds = %complex_mul_cont94
  %59 = load i32, i32* %j, align 4, !dbg !511
  %inc118 = add nsw i32 %59, 1, !dbg !511
  store i32 %inc118, i32* %j, align 4, !dbg !511
  br label %for.cond73, !dbg !512, !llvm.loop !513

for.end119:                                       ; preds = %for.cond73
  br label %for.inc120, !dbg !515

for.inc120:                                       ; preds = %for.end119
  %60 = load i32, i32* %i, align 4, !dbg !516
  %inc121 = add nsw i32 %60, 1, !dbg !516
  store i32 %inc121, i32* %i, align 4, !dbg !516
  br label %for.cond60, !dbg !517, !llvm.loop !518

for.end122:                                       ; preds = %for.cond60
  %61 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !520
  %62 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %61, i32 0, i32 0, !dbg !520
  %63 = load i64, i64* %62, align 8, !dbg !520
  %64 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %61, i32 0, i32 1, !dbg !520
  %65 = load { double, double }**, { double, double }*** %64, align 8, !dbg !520
  %call123 = call i32 @isHermitian(i64 %63, { double, double }** %65), !dbg !520
  %cmp124 = icmp eq i32 %call123, 1, !dbg !521
  %66 = zext i1 %cmp124 to i64, !dbg !520
  %cond = select i1 %cmp124, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i64 0, i64 0), !dbg !520
  %call126 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.6, i64 0, i64 0), i8* %cond), !dbg !522
  %67 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !523
  %68 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %67, i32 0, i32 0, !dbg !523
  %69 = load i64, i64* %68, align 8, !dbg !523
  %70 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %67, i32 0, i32 1, !dbg !523
  %71 = load { double, double }**, { double, double }*** %70, align 8, !dbg !523
  %call127 = call i32 @isUnitary(i64 %69, { double, double }** %71), !dbg !523
  %cmp128 = icmp eq i32 %call127, 1, !dbg !524
  %72 = zext i1 %cmp128 to i64, !dbg !523
  %cond130 = select i1 %cmp128, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i64 0, i64 0), !dbg !523
  %call131 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.9, i64 0, i64 0), i8* %cond130), !dbg !525
  %73 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !526
  %74 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %73, i32 0, i32 0, !dbg !526
  %75 = load i64, i64* %74, align 8, !dbg !526
  %76 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %73, i32 0, i32 1, !dbg !526
  %77 = load { double, double }**, { double, double }*** %76, align 8, !dbg !526
  %call132 = call i32 @isNormal(i64 %75, { double, double }** %77), !dbg !526
  %cmp133 = icmp eq i32 %call132, 1, !dbg !527
  %78 = zext i1 %cmp133 to i64, !dbg !526
  %cond135 = select i1 %cmp133, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i64 0, i64 0), !dbg !526
  %call136 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.10, i64 0, i64 0), i8* %cond135), !dbg !528
  ret i32 0, !dbg !529
}

declare dso_local i32 @printf(i8*, ...) #5

declare dso_local i32 @__isoc99_scanf(i8*, ...) #5

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="64" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "conjugate-transpose.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Conjugate-transpose")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "transpose", scope: !1, file: !1, line: 14, type: !8, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "matrix", file: !1, line: 11, baseType: !11)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 7, size: 128, elements: !12)
!12 = !{!13, !15, !16}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "rows", scope: !11, file: !1, line: 9, baseType: !14, size: 32)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "cols", scope: !11, file: !1, line: 9, baseType: !14, size: 32, offset: 32)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !11, file: !1, line: 10, baseType: !17, size: 64, offset: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIBasicType(name: "complex", size: 128, encoding: DW_ATE_complex_float)
!20 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 14, type: !10)
!21 = !DILocation(line: 14, column: 19, scope: !7)
!22 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 16, type: !14)
!23 = !DILocation(line: 16, column: 7, scope: !7)
!24 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 16, type: !14)
!25 = !DILocation(line: 16, column: 10, scope: !7)
!26 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 17, type: !10)
!27 = !DILocation(line: 17, column: 10, scope: !7)
!28 = !DILocation(line: 19, column: 14, scope: !7)
!29 = !DILocation(line: 19, column: 5, scope: !7)
!30 = !DILocation(line: 19, column: 10, scope: !7)
!31 = !DILocation(line: 20, column: 14, scope: !7)
!32 = !DILocation(line: 20, column: 5, scope: !7)
!33 = !DILocation(line: 20, column: 10, scope: !7)
!34 = !DILocation(line: 22, column: 19, scope: !7)
!35 = !DILocation(line: 22, column: 17, scope: !7)
!36 = !DILocation(line: 22, column: 24, scope: !7)
!37 = !DILocation(line: 22, column: 9, scope: !7)
!38 = !DILocation(line: 22, column: 5, scope: !7)
!39 = !DILocation(line: 22, column: 7, scope: !7)
!40 = !DILocation(line: 24, column: 10, scope: !41)
!41 = distinct !DILexicalBlock(scope: !7, file: !1, line: 24, column: 3)
!42 = !DILocation(line: 24, column: 8, scope: !41)
!43 = !DILocation(line: 24, column: 15, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !1, line: 24, column: 3)
!45 = !DILocation(line: 24, column: 21, scope: !44)
!46 = !DILocation(line: 24, column: 17, scope: !44)
!47 = !DILocation(line: 24, column: 3, scope: !41)
!48 = !DILocation(line: 26, column: 26, scope: !49)
!49 = distinct !DILexicalBlock(scope: !44, file: !1, line: 25, column: 5)
!50 = !DILocation(line: 26, column: 24, scope: !49)
!51 = !DILocation(line: 26, column: 31, scope: !49)
!52 = !DILocation(line: 26, column: 16, scope: !49)
!53 = !DILocation(line: 26, column: 9, scope: !49)
!54 = !DILocation(line: 26, column: 11, scope: !49)
!55 = !DILocation(line: 26, column: 7, scope: !49)
!56 = !DILocation(line: 26, column: 14, scope: !49)
!57 = !DILocation(line: 27, column: 14, scope: !58)
!58 = distinct !DILexicalBlock(scope: !49, file: !1, line: 27, column: 7)
!59 = !DILocation(line: 27, column: 12, scope: !58)
!60 = !DILocation(line: 27, column: 19, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !1, line: 27, column: 7)
!62 = !DILocation(line: 27, column: 25, scope: !61)
!63 = !DILocation(line: 27, column: 21, scope: !61)
!64 = !DILocation(line: 27, column: 7, scope: !58)
!65 = !DILocation(line: 29, column: 31, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !1, line: 28, column: 9)
!67 = !DILocation(line: 29, column: 33, scope: !66)
!68 = !DILocation(line: 29, column: 29, scope: !66)
!69 = !DILocation(line: 29, column: 36, scope: !66)
!70 = !DILocation(line: 29, column: 23, scope: !66)
!71 = !DILocation(line: 29, column: 13, scope: !66)
!72 = !DILocation(line: 29, column: 15, scope: !66)
!73 = !DILocation(line: 29, column: 11, scope: !66)
!74 = !DILocation(line: 29, column: 18, scope: !66)
!75 = !DILocation(line: 29, column: 21, scope: !66)
!76 = !DILocation(line: 30, column: 9, scope: !66)
!77 = !DILocation(line: 27, column: 32, scope: !61)
!78 = !DILocation(line: 27, column: 7, scope: !61)
!79 = distinct !{!79, !64, !80}
!80 = !DILocation(line: 30, column: 9, scope: !58)
!81 = !DILocation(line: 31, column: 5, scope: !49)
!82 = !DILocation(line: 24, column: 28, scope: !44)
!83 = !DILocation(line: 24, column: 3, scope: !44)
!84 = distinct !{!84, !47, !85}
!85 = !DILocation(line: 31, column: 5, scope: !41)
!86 = !DILocation(line: 33, column: 3, scope: !7)
!87 = distinct !DISubprogram(name: "isHermitian", scope: !1, file: !1, line: 37, type: !88, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!14, !10}
!90 = !DILocalVariable(name: "a", arg: 1, scope: !87, file: !1, line: 37, type: !10)
!91 = !DILocation(line: 37, column: 21, scope: !87)
!92 = !DILocalVariable(name: "i", scope: !87, file: !1, line: 39, type: !14)
!93 = !DILocation(line: 39, column: 7, scope: !87)
!94 = !DILocalVariable(name: "j", scope: !87, file: !1, line: 39, type: !14)
!95 = !DILocation(line: 39, column: 10, scope: !87)
!96 = !DILocalVariable(name: "b", scope: !87, file: !1, line: 40, type: !10)
!97 = !DILocation(line: 40, column: 10, scope: !87)
!98 = !DILocation(line: 40, column: 14, scope: !87)
!99 = !DILocation(line: 42, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !87, file: !1, line: 42, column: 7)
!101 = !DILocation(line: 42, column: 19, scope: !100)
!102 = !DILocation(line: 42, column: 14, scope: !100)
!103 = !DILocation(line: 42, column: 24, scope: !100)
!104 = !DILocation(line: 42, column: 29, scope: !100)
!105 = !DILocation(line: 42, column: 39, scope: !100)
!106 = !DILocation(line: 42, column: 34, scope: !100)
!107 = !DILocation(line: 42, column: 7, scope: !87)
!108 = !DILocation(line: 44, column: 14, scope: !109)
!109 = distinct !DILexicalBlock(scope: !110, file: !1, line: 44, column: 7)
!110 = distinct !DILexicalBlock(scope: !100, file: !1, line: 43, column: 5)
!111 = !DILocation(line: 44, column: 12, scope: !109)
!112 = !DILocation(line: 44, column: 19, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !1, line: 44, column: 7)
!114 = !DILocation(line: 44, column: 25, scope: !113)
!115 = !DILocation(line: 44, column: 21, scope: !113)
!116 = !DILocation(line: 44, column: 7, scope: !109)
!117 = !DILocation(line: 46, column: 18, scope: !118)
!118 = distinct !DILexicalBlock(scope: !119, file: !1, line: 46, column: 11)
!119 = distinct !DILexicalBlock(scope: !113, file: !1, line: 45, column: 9)
!120 = !DILocation(line: 46, column: 16, scope: !118)
!121 = !DILocation(line: 46, column: 23, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !1, line: 46, column: 11)
!123 = !DILocation(line: 46, column: 29, scope: !122)
!124 = !DILocation(line: 46, column: 25, scope: !122)
!125 = !DILocation(line: 46, column: 11, scope: !118)
!126 = !DILocation(line: 48, column: 21, scope: !127)
!127 = distinct !DILexicalBlock(scope: !128, file: !1, line: 48, column: 19)
!128 = distinct !DILexicalBlock(scope: !122, file: !1, line: 47, column: 13)
!129 = !DILocation(line: 48, column: 23, scope: !127)
!130 = !DILocation(line: 48, column: 19, scope: !127)
!131 = !DILocation(line: 48, column: 26, scope: !127)
!132 = !DILocation(line: 48, column: 34, scope: !127)
!133 = !DILocation(line: 48, column: 36, scope: !127)
!134 = !DILocation(line: 48, column: 32, scope: !127)
!135 = !DILocation(line: 48, column: 39, scope: !127)
!136 = !DILocation(line: 48, column: 29, scope: !127)
!137 = !DILocation(line: 48, column: 19, scope: !128)
!138 = !DILocation(line: 49, column: 17, scope: !127)
!139 = !DILocation(line: 50, column: 13, scope: !128)
!140 = !DILocation(line: 46, column: 36, scope: !122)
!141 = !DILocation(line: 46, column: 11, scope: !122)
!142 = distinct !{!142, !125, !143}
!143 = !DILocation(line: 50, column: 13, scope: !118)
!144 = !DILocation(line: 51, column: 9, scope: !119)
!145 = !DILocation(line: 44, column: 32, scope: !113)
!146 = !DILocation(line: 44, column: 7, scope: !113)
!147 = distinct !{!147, !116, !148}
!148 = !DILocation(line: 51, column: 9, scope: !109)
!149 = !DILocation(line: 52, column: 5, scope: !110)
!150 = !DILocation(line: 55, column: 5, scope: !100)
!151 = !DILocation(line: 57, column: 3, scope: !87)
!152 = !DILocation(line: 58, column: 1, scope: !87)
!153 = distinct !DISubprogram(name: "multiply", scope: !1, file: !1, line: 61, type: !154, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!154 = !DISubroutineType(types: !155)
!155 = !{!10, !10, !10}
!156 = !DILocalVariable(name: "a", arg: 1, scope: !153, file: !1, line: 61, type: !10)
!157 = !DILocation(line: 61, column: 18, scope: !153)
!158 = !DILocalVariable(name: "b", arg: 2, scope: !153, file: !1, line: 61, type: !10)
!159 = !DILocation(line: 61, column: 28, scope: !153)
!160 = !DILocalVariable(name: "c", scope: !153, file: !1, line: 63, type: !10)
!161 = !DILocation(line: 63, column: 10, scope: !153)
!162 = !DILocalVariable(name: "i", scope: !153, file: !1, line: 64, type: !14)
!163 = !DILocation(line: 64, column: 7, scope: !153)
!164 = !DILocalVariable(name: "j", scope: !153, file: !1, line: 64, type: !14)
!165 = !DILocation(line: 64, column: 10, scope: !153)
!166 = !DILocation(line: 66, column: 9, scope: !167)
!167 = distinct !DILexicalBlock(scope: !153, file: !1, line: 66, column: 7)
!168 = !DILocation(line: 66, column: 19, scope: !167)
!169 = !DILocation(line: 66, column: 14, scope: !167)
!170 = !DILocation(line: 66, column: 7, scope: !153)
!171 = !DILocation(line: 68, column: 18, scope: !172)
!172 = distinct !DILexicalBlock(scope: !167, file: !1, line: 67, column: 5)
!173 = !DILocation(line: 68, column: 9, scope: !172)
!174 = !DILocation(line: 68, column: 14, scope: !172)
!175 = !DILocation(line: 69, column: 18, scope: !172)
!176 = !DILocation(line: 69, column: 9, scope: !172)
!177 = !DILocation(line: 69, column: 14, scope: !172)
!178 = !DILocation(line: 71, column: 23, scope: !172)
!179 = !DILocation(line: 71, column: 21, scope: !172)
!180 = !DILocation(line: 71, column: 28, scope: !172)
!181 = !DILocation(line: 71, column: 13, scope: !172)
!182 = !DILocation(line: 71, column: 9, scope: !172)
!183 = !DILocation(line: 71, column: 11, scope: !172)
!184 = !DILocation(line: 73, column: 14, scope: !185)
!185 = distinct !DILexicalBlock(scope: !172, file: !1, line: 73, column: 7)
!186 = !DILocation(line: 73, column: 12, scope: !185)
!187 = !DILocation(line: 73, column: 19, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !1, line: 73, column: 7)
!189 = !DILocation(line: 73, column: 25, scope: !188)
!190 = !DILocation(line: 73, column: 21, scope: !188)
!191 = !DILocation(line: 73, column: 7, scope: !185)
!192 = !DILocation(line: 75, column: 30, scope: !193)
!193 = distinct !DILexicalBlock(scope: !188, file: !1, line: 74, column: 9)
!194 = !DILocation(line: 75, column: 28, scope: !193)
!195 = !DILocation(line: 75, column: 35, scope: !193)
!196 = !DILocation(line: 75, column: 20, scope: !193)
!197 = !DILocation(line: 75, column: 13, scope: !193)
!198 = !DILocation(line: 75, column: 15, scope: !193)
!199 = !DILocation(line: 75, column: 11, scope: !193)
!200 = !DILocation(line: 75, column: 18, scope: !193)
!201 = !DILocation(line: 76, column: 29, scope: !193)
!202 = !{!"branch_weights", i32 1, i32 1048575}
!203 = !DILocation(line: 76, column: 25, scope: !193)
!204 = !DILocation(line: 76, column: 23, scope: !193)
!205 = !DILocation(line: 76, column: 13, scope: !193)
!206 = !DILocation(line: 76, column: 15, scope: !193)
!207 = !DILocation(line: 76, column: 11, scope: !193)
!208 = !DILocation(line: 76, column: 18, scope: !193)
!209 = !DILocation(line: 76, column: 21, scope: !193)
!210 = !DILocation(line: 77, column: 18, scope: !211)
!211 = distinct !DILexicalBlock(scope: !193, file: !1, line: 77, column: 11)
!212 = !DILocation(line: 77, column: 16, scope: !211)
!213 = !DILocation(line: 77, column: 23, scope: !214)
!214 = distinct !DILexicalBlock(scope: !211, file: !1, line: 77, column: 11)
!215 = !DILocation(line: 77, column: 29, scope: !214)
!216 = !DILocation(line: 77, column: 25, scope: !214)
!217 = !DILocation(line: 77, column: 11, scope: !211)
!218 = !DILocation(line: 79, column: 30, scope: !219)
!219 = distinct !DILexicalBlock(scope: !214, file: !1, line: 78, column: 13)
!220 = !DILocation(line: 79, column: 32, scope: !219)
!221 = !DILocation(line: 79, column: 28, scope: !219)
!222 = !DILocation(line: 79, column: 35, scope: !219)
!223 = !DILocation(line: 79, column: 42, scope: !219)
!224 = !DILocation(line: 79, column: 44, scope: !219)
!225 = !DILocation(line: 79, column: 40, scope: !219)
!226 = !DILocation(line: 79, column: 47, scope: !219)
!227 = !DILocation(line: 79, column: 38, scope: !219)
!228 = !DILocation(line: 79, column: 17, scope: !219)
!229 = !DILocation(line: 79, column: 19, scope: !219)
!230 = !DILocation(line: 79, column: 15, scope: !219)
!231 = !DILocation(line: 79, column: 22, scope: !219)
!232 = !DILocation(line: 79, column: 25, scope: !219)
!233 = !DILocation(line: 80, column: 13, scope: !219)
!234 = !DILocation(line: 77, column: 36, scope: !214)
!235 = !DILocation(line: 77, column: 11, scope: !214)
!236 = distinct !{!236, !217, !237}
!237 = !DILocation(line: 80, column: 13, scope: !211)
!238 = !DILocation(line: 81, column: 9, scope: !193)
!239 = !DILocation(line: 73, column: 32, scope: !188)
!240 = !DILocation(line: 73, column: 7, scope: !188)
!241 = distinct !{!241, !191, !242}
!242 = !DILocation(line: 81, column: 9, scope: !185)
!243 = !DILocation(line: 83, column: 5, scope: !172)
!244 = !DILocation(line: 85, column: 3, scope: !153)
!245 = distinct !DISubprogram(name: "isNormal", scope: !1, file: !1, line: 89, type: !88, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!246 = !DILocalVariable(name: "a", arg: 1, scope: !245, file: !1, line: 89, type: !10)
!247 = !DILocation(line: 89, column: 18, scope: !245)
!248 = !DILocalVariable(name: "i", scope: !245, file: !1, line: 91, type: !14)
!249 = !DILocation(line: 91, column: 7, scope: !245)
!250 = !DILocalVariable(name: "j", scope: !245, file: !1, line: 91, type: !14)
!251 = !DILocation(line: 91, column: 10, scope: !245)
!252 = !DILocalVariable(name: "a_ah", scope: !245, file: !1, line: 92, type: !10)
!253 = !DILocation(line: 92, column: 10, scope: !245)
!254 = !DILocalVariable(name: "ah_a", scope: !245, file: !1, line: 92, type: !10)
!255 = !DILocation(line: 92, column: 16, scope: !245)
!256 = !DILocation(line: 94, column: 9, scope: !257)
!257 = distinct !DILexicalBlock(scope: !245, file: !1, line: 94, column: 7)
!258 = !DILocation(line: 94, column: 19, scope: !257)
!259 = !DILocation(line: 94, column: 14, scope: !257)
!260 = !DILocation(line: 94, column: 7, scope: !245)
!261 = !DILocation(line: 95, column: 5, scope: !257)
!262 = !DILocation(line: 97, column: 23, scope: !245)
!263 = !DILocation(line: 97, column: 10, scope: !245)
!264 = !DILocation(line: 98, column: 20, scope: !245)
!265 = !DILocation(line: 98, column: 10, scope: !245)
!266 = !DILocation(line: 100, column: 10, scope: !267)
!267 = distinct !DILexicalBlock(scope: !245, file: !1, line: 100, column: 3)
!268 = !DILocation(line: 100, column: 8, scope: !267)
!269 = !DILocation(line: 100, column: 15, scope: !270)
!270 = distinct !DILexicalBlock(scope: !267, file: !1, line: 100, column: 3)
!271 = !DILocation(line: 100, column: 21, scope: !270)
!272 = !DILocation(line: 100, column: 17, scope: !270)
!273 = !DILocation(line: 100, column: 3, scope: !267)
!274 = !DILocation(line: 102, column: 14, scope: !275)
!275 = distinct !DILexicalBlock(scope: !276, file: !1, line: 102, column: 7)
!276 = distinct !DILexicalBlock(scope: !270, file: !1, line: 101, column: 5)
!277 = !DILocation(line: 102, column: 12, scope: !275)
!278 = !DILocation(line: 102, column: 19, scope: !279)
!279 = distinct !DILexicalBlock(scope: !275, file: !1, line: 102, column: 7)
!280 = !DILocation(line: 102, column: 25, scope: !279)
!281 = !DILocation(line: 102, column: 21, scope: !279)
!282 = !DILocation(line: 102, column: 7, scope: !275)
!283 = !DILocation(line: 104, column: 20, scope: !284)
!284 = distinct !DILexicalBlock(scope: !285, file: !1, line: 104, column: 15)
!285 = distinct !DILexicalBlock(scope: !279, file: !1, line: 103, column: 9)
!286 = !DILocation(line: 104, column: 22, scope: !284)
!287 = !DILocation(line: 104, column: 15, scope: !284)
!288 = !DILocation(line: 104, column: 25, scope: !284)
!289 = !DILocation(line: 104, column: 36, scope: !284)
!290 = !DILocation(line: 104, column: 38, scope: !284)
!291 = !DILocation(line: 104, column: 31, scope: !284)
!292 = !DILocation(line: 104, column: 41, scope: !284)
!293 = !DILocation(line: 104, column: 28, scope: !284)
!294 = !DILocation(line: 104, column: 15, scope: !285)
!295 = !DILocation(line: 105, column: 13, scope: !284)
!296 = !DILocation(line: 106, column: 9, scope: !285)
!297 = !DILocation(line: 102, column: 32, scope: !279)
!298 = !DILocation(line: 102, column: 7, scope: !279)
!299 = distinct !{!299, !282, !300}
!300 = !DILocation(line: 106, column: 9, scope: !275)
!301 = !DILocation(line: 107, column: 5, scope: !276)
!302 = !DILocation(line: 100, column: 28, scope: !270)
!303 = !DILocation(line: 100, column: 3, scope: !270)
!304 = distinct !{!304, !273, !305}
!305 = !DILocation(line: 107, column: 5, scope: !267)
!306 = !DILocation(line: 109, column: 3, scope: !245)
!307 = !DILocation(line: 110, column: 1, scope: !245)
!308 = distinct !DISubprogram(name: "isUnitary", scope: !1, file: !1, line: 113, type: !88, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!309 = !DILocalVariable(name: "a", arg: 1, scope: !308, file: !1, line: 113, type: !10)
!310 = !DILocation(line: 113, column: 19, scope: !308)
!311 = !DILocalVariable(name: "b", scope: !308, file: !1, line: 115, type: !10)
!312 = !DILocation(line: 115, column: 10, scope: !308)
!313 = !DILocalVariable(name: "i", scope: !308, file: !1, line: 116, type: !14)
!314 = !DILocation(line: 116, column: 7, scope: !308)
!315 = !DILocalVariable(name: "j", scope: !308, file: !1, line: 116, type: !14)
!316 = !DILocation(line: 116, column: 10, scope: !308)
!317 = !DILocation(line: 117, column: 7, scope: !318)
!318 = distinct !DILexicalBlock(scope: !308, file: !1, line: 117, column: 7)
!319 = !DILocation(line: 117, column: 20, scope: !318)
!320 = !DILocation(line: 117, column: 7, scope: !308)
!321 = !DILocation(line: 119, column: 24, scope: !322)
!322 = distinct !DILexicalBlock(scope: !318, file: !1, line: 118, column: 5)
!323 = !DILocation(line: 119, column: 11, scope: !322)
!324 = !DILocation(line: 121, column: 14, scope: !325)
!325 = distinct !DILexicalBlock(scope: !322, file: !1, line: 121, column: 7)
!326 = !DILocation(line: 121, column: 12, scope: !325)
!327 = !DILocation(line: 121, column: 19, scope: !328)
!328 = distinct !DILexicalBlock(scope: !325, file: !1, line: 121, column: 7)
!329 = !DILocation(line: 121, column: 25, scope: !328)
!330 = !DILocation(line: 121, column: 21, scope: !328)
!331 = !DILocation(line: 121, column: 7, scope: !325)
!332 = !DILocation(line: 123, column: 18, scope: !333)
!333 = distinct !DILexicalBlock(scope: !334, file: !1, line: 123, column: 11)
!334 = distinct !DILexicalBlock(scope: !328, file: !1, line: 122, column: 9)
!335 = !DILocation(line: 123, column: 16, scope: !333)
!336 = !DILocation(line: 123, column: 23, scope: !337)
!337 = distinct !DILexicalBlock(scope: !333, file: !1, line: 123, column: 11)
!338 = !DILocation(line: 123, column: 29, scope: !337)
!339 = !DILocation(line: 123, column: 25, scope: !337)
!340 = !DILocation(line: 123, column: 11, scope: !333)
!341 = !DILocation(line: 125, column: 20, scope: !342)
!342 = distinct !DILexicalBlock(scope: !343, file: !1, line: 125, column: 19)
!343 = distinct !DILexicalBlock(scope: !337, file: !1, line: 124, column: 13)
!344 = !DILocation(line: 125, column: 25, scope: !342)
!345 = !DILocation(line: 125, column: 22, scope: !342)
!346 = !DILocation(line: 125, column: 27, scope: !342)
!347 = !DILocation(line: 125, column: 32, scope: !342)
!348 = !DILocation(line: 125, column: 34, scope: !342)
!349 = !DILocation(line: 125, column: 30, scope: !342)
!350 = !DILocation(line: 125, column: 37, scope: !342)
!351 = !DILocation(line: 125, column: 40, scope: !342)
!352 = !DILocation(line: 125, column: 46, scope: !342)
!353 = !DILocation(line: 125, column: 50, scope: !342)
!354 = !DILocation(line: 125, column: 55, scope: !342)
!355 = !DILocation(line: 125, column: 52, scope: !342)
!356 = !DILocation(line: 125, column: 57, scope: !342)
!357 = !DILocation(line: 125, column: 62, scope: !342)
!358 = !DILocation(line: 125, column: 64, scope: !342)
!359 = !DILocation(line: 125, column: 60, scope: !342)
!360 = !DILocation(line: 125, column: 67, scope: !342)
!361 = !DILocation(line: 125, column: 70, scope: !342)
!362 = !DILocation(line: 125, column: 19, scope: !343)
!363 = !DILocation(line: 126, column: 17, scope: !342)
!364 = !DILocation(line: 127, column: 13, scope: !343)
!365 = !DILocation(line: 123, column: 36, scope: !337)
!366 = !DILocation(line: 123, column: 11, scope: !337)
!367 = distinct !{!367, !340, !368}
!368 = !DILocation(line: 127, column: 13, scope: !333)
!369 = !DILocation(line: 128, column: 9, scope: !334)
!370 = !DILocation(line: 121, column: 32, scope: !328)
!371 = !DILocation(line: 121, column: 7, scope: !328)
!372 = distinct !{!372, !331, !373}
!373 = !DILocation(line: 128, column: 9, scope: !325)
!374 = !DILocation(line: 129, column: 7, scope: !322)
!375 = !DILocation(line: 131, column: 3, scope: !308)
!376 = !DILocation(line: 132, column: 1, scope: !308)
!377 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 136, type: !378, scopeLine: 137, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!378 = !DISubroutineType(types: !379)
!379 = !{!14}
!380 = !DILocalVariable(name: "z", scope: !377, file: !1, line: 138, type: !19)
!381 = !DILocation(line: 138, column: 11, scope: !377)
!382 = !DILocation(line: 138, column: 21, scope: !377)
!383 = !DILocation(line: 138, column: 17, scope: !377)
!384 = !DILocation(line: 138, column: 15, scope: !377)
!385 = !DILocalVariable(name: "a", scope: !377, file: !1, line: 139, type: !10)
!386 = !DILocation(line: 139, column: 10, scope: !377)
!387 = !DILocalVariable(name: "aT", scope: !377, file: !1, line: 139, type: !10)
!388 = !DILocation(line: 139, column: 13, scope: !377)
!389 = !DILocalVariable(name: "i", scope: !377, file: !1, line: 140, type: !14)
!390 = !DILocation(line: 140, column: 7, scope: !377)
!391 = !DILocalVariable(name: "j", scope: !377, file: !1, line: 140, type: !14)
!392 = !DILocation(line: 140, column: 10, scope: !377)
!393 = !DILocation(line: 141, column: 3, scope: !377)
!394 = !DILocation(line: 142, column: 21, scope: !377)
!395 = !DILocation(line: 142, column: 30, scope: !377)
!396 = !DILocation(line: 142, column: 3, scope: !377)
!397 = !DILocation(line: 144, column: 19, scope: !377)
!398 = !DILocation(line: 144, column: 17, scope: !377)
!399 = !DILocation(line: 144, column: 24, scope: !377)
!400 = !DILocation(line: 144, column: 9, scope: !377)
!401 = !DILocation(line: 144, column: 5, scope: !377)
!402 = !DILocation(line: 144, column: 7, scope: !377)
!403 = !DILocation(line: 145, column: 3, scope: !377)
!404 = !DILocation(line: 146, column: 10, scope: !405)
!405 = distinct !DILexicalBlock(scope: !377, file: !1, line: 146, column: 3)
!406 = !DILocation(line: 146, column: 8, scope: !405)
!407 = !DILocation(line: 146, column: 15, scope: !408)
!408 = distinct !DILexicalBlock(scope: !405, file: !1, line: 146, column: 3)
!409 = !DILocation(line: 146, column: 21, scope: !408)
!410 = !DILocation(line: 146, column: 17, scope: !408)
!411 = !DILocation(line: 146, column: 3, scope: !405)
!412 = !DILocation(line: 148, column: 7, scope: !413)
!413 = distinct !DILexicalBlock(scope: !408, file: !1, line: 147, column: 5)
!414 = !DILocation(line: 149, column: 26, scope: !413)
!415 = !DILocation(line: 149, column: 24, scope: !413)
!416 = !DILocation(line: 149, column: 31, scope: !413)
!417 = !DILocation(line: 149, column: 16, scope: !413)
!418 = !DILocation(line: 149, column: 9, scope: !413)
!419 = !DILocation(line: 149, column: 11, scope: !413)
!420 = !DILocation(line: 149, column: 7, scope: !413)
!421 = !DILocation(line: 149, column: 14, scope: !413)
!422 = !DILocation(line: 150, column: 14, scope: !423)
!423 = distinct !DILexicalBlock(scope: !413, file: !1, line: 150, column: 7)
!424 = !DILocation(line: 150, column: 12, scope: !423)
!425 = !DILocation(line: 150, column: 19, scope: !426)
!426 = distinct !DILexicalBlock(scope: !423, file: !1, line: 150, column: 7)
!427 = !DILocation(line: 150, column: 25, scope: !426)
!428 = !DILocation(line: 150, column: 21, scope: !426)
!429 = !DILocation(line: 150, column: 7, scope: !423)
!430 = !DILocation(line: 152, column: 23, scope: !431)
!431 = distinct !DILexicalBlock(scope: !426, file: !1, line: 151, column: 9)
!432 = !DILocation(line: 152, column: 31, scope: !431)
!433 = !DILocation(line: 152, column: 38, scope: !431)
!434 = !DILocation(line: 152, column: 46, scope: !431)
!435 = !DILocation(line: 152, column: 51, scope: !431)
!436 = !DILocation(line: 152, column: 36, scope: !431)
!437 = !DILocation(line: 152, column: 13, scope: !431)
!438 = !DILocation(line: 152, column: 15, scope: !431)
!439 = !DILocation(line: 152, column: 11, scope: !431)
!440 = !DILocation(line: 152, column: 18, scope: !431)
!441 = !DILocation(line: 152, column: 21, scope: !431)
!442 = !DILocation(line: 153, column: 42, scope: !431)
!443 = !DILocation(line: 153, column: 44, scope: !431)
!444 = !DILocation(line: 153, column: 40, scope: !431)
!445 = !DILocation(line: 153, column: 47, scope: !431)
!446 = !DILocation(line: 153, column: 61, scope: !431)
!447 = !DILocation(line: 153, column: 63, scope: !431)
!448 = !DILocation(line: 153, column: 59, scope: !431)
!449 = !DILocation(line: 153, column: 66, scope: !431)
!450 = !DILocation(line: 153, column: 11, scope: !431)
!451 = !DILocation(line: 154, column: 9, scope: !431)
!452 = !DILocation(line: 150, column: 32, scope: !426)
!453 = !DILocation(line: 150, column: 7, scope: !426)
!454 = distinct !{!454, !429, !455}
!455 = !DILocation(line: 154, column: 9, scope: !423)
!456 = !DILocation(line: 155, column: 5, scope: !413)
!457 = !DILocation(line: 146, column: 28, scope: !408)
!458 = !DILocation(line: 146, column: 3, scope: !408)
!459 = distinct !{!459, !411, !460}
!460 = !DILocation(line: 155, column: 5, scope: !405)
!461 = !DILocation(line: 157, column: 8, scope: !377)
!462 = !DILocation(line: 159, column: 3, scope: !377)
!463 = !DILocation(line: 160, column: 10, scope: !464)
!464 = distinct !DILexicalBlock(scope: !377, file: !1, line: 160, column: 3)
!465 = !DILocation(line: 160, column: 8, scope: !464)
!466 = !DILocation(line: 160, column: 15, scope: !467)
!467 = distinct !DILexicalBlock(scope: !464, file: !1, line: 160, column: 3)
!468 = !DILocation(line: 160, column: 22, scope: !467)
!469 = !DILocation(line: 160, column: 17, scope: !467)
!470 = !DILocation(line: 160, column: 3, scope: !464)
!471 = !DILocation(line: 162, column: 7, scope: !472)
!472 = distinct !DILexicalBlock(scope: !467, file: !1, line: 161, column: 5)
!473 = !DILocation(line: 163, column: 28, scope: !472)
!474 = !DILocation(line: 163, column: 25, scope: !472)
!475 = !DILocation(line: 163, column: 33, scope: !472)
!476 = !DILocation(line: 163, column: 17, scope: !472)
!477 = !DILocation(line: 163, column: 10, scope: !472)
!478 = !DILocation(line: 163, column: 12, scope: !472)
!479 = !DILocation(line: 163, column: 7, scope: !472)
!480 = !DILocation(line: 163, column: 15, scope: !472)
!481 = !DILocation(line: 164, column: 14, scope: !482)
!482 = distinct !DILexicalBlock(scope: !472, file: !1, line: 164, column: 7)
!483 = !DILocation(line: 164, column: 12, scope: !482)
!484 = !DILocation(line: 164, column: 19, scope: !485)
!485 = distinct !DILexicalBlock(scope: !482, file: !1, line: 164, column: 7)
!486 = !DILocation(line: 164, column: 26, scope: !485)
!487 = !DILocation(line: 164, column: 21, scope: !485)
!488 = !DILocation(line: 164, column: 7, scope: !482)
!489 = !DILocation(line: 166, column: 24, scope: !490)
!490 = distinct !DILexicalBlock(scope: !485, file: !1, line: 165, column: 9)
!491 = !DILocation(line: 166, column: 32, scope: !490)
!492 = !DILocation(line: 166, column: 39, scope: !490)
!493 = !DILocation(line: 166, column: 47, scope: !490)
!494 = !DILocation(line: 166, column: 52, scope: !490)
!495 = !DILocation(line: 166, column: 37, scope: !490)
!496 = !DILocation(line: 166, column: 14, scope: !490)
!497 = !DILocation(line: 166, column: 16, scope: !490)
!498 = !DILocation(line: 166, column: 11, scope: !490)
!499 = !DILocation(line: 166, column: 19, scope: !490)
!500 = !DILocation(line: 166, column: 22, scope: !490)
!501 = !DILocation(line: 167, column: 43, scope: !490)
!502 = !DILocation(line: 167, column: 45, scope: !490)
!503 = !DILocation(line: 167, column: 40, scope: !490)
!504 = !DILocation(line: 167, column: 48, scope: !490)
!505 = !DILocation(line: 167, column: 63, scope: !490)
!506 = !DILocation(line: 167, column: 65, scope: !490)
!507 = !DILocation(line: 167, column: 60, scope: !490)
!508 = !DILocation(line: 167, column: 68, scope: !490)
!509 = !DILocation(line: 167, column: 11, scope: !490)
!510 = !DILocation(line: 168, column: 9, scope: !490)
!511 = !DILocation(line: 164, column: 33, scope: !485)
!512 = !DILocation(line: 164, column: 7, scope: !485)
!513 = distinct !{!513, !488, !514}
!514 = !DILocation(line: 168, column: 9, scope: !482)
!515 = !DILocation(line: 169, column: 5, scope: !472)
!516 = !DILocation(line: 160, column: 29, scope: !467)
!517 = !DILocation(line: 160, column: 3, scope: !467)
!518 = distinct !{!518, !470, !519}
!519 = !DILocation(line: 169, column: 5, scope: !464)
!520 = !DILocation(line: 172, column: 11, scope: !377)
!521 = !DILocation(line: 172, column: 27, scope: !377)
!522 = !DILocation(line: 171, column: 3, scope: !377)
!523 = !DILocation(line: 174, column: 11, scope: !377)
!524 = !DILocation(line: 174, column: 25, scope: !377)
!525 = !DILocation(line: 173, column: 3, scope: !377)
!526 = !DILocation(line: 176, column: 11, scope: !377)
!527 = !DILocation(line: 176, column: 24, scope: !377)
!528 = !DILocation(line: 175, column: 3, scope: !377)
!529 = !DILocation(line: 180, column: 3, scope: !377)
