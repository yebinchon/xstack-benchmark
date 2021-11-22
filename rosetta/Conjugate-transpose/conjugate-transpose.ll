; ModuleID = 'conjugate-transpose.c'
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
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !103, !cf.info !104

land.lhs.true:                                    ; preds = %entry
  %cols = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 1, !dbg !105
  %15 = load i32, i32* %cols, align 4, !dbg !105
  %cols2 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !106
  %16 = load i32, i32* %cols2, align 4, !dbg !106
  %cmp3 = icmp eq i32 %15, %16, !dbg !107
  br i1 %cmp3, label %if.then, label %if.else, !dbg !108, !cf.info !104

if.then:                                          ; preds = %land.lhs.true
  store i32 0, i32* %i, align 4, !dbg !109
  br label %for.cond, !dbg !112

for.cond:                                         ; preds = %for.inc18, %if.then
  %17 = load i32, i32* %i, align 4, !dbg !113
  %rows4 = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 0, !dbg !115
  %18 = load i32, i32* %rows4, align 8, !dbg !115
  %cmp5 = icmp slt i32 %17, %18, !dbg !116
  br i1 %cmp5, label %for.body, label %for.end20, !dbg !117

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !118
  br label %for.cond6, !dbg !121

for.cond6:                                        ; preds = %for.inc, %for.body
  %19 = load i32, i32* %j, align 4, !dbg !122
  %cols7 = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 1, !dbg !124
  %20 = load i32, i32* %cols7, align 4, !dbg !124
  %cmp8 = icmp slt i32 %19, %20, !dbg !125
  br i1 %cmp8, label %for.body9, label %for.end, !dbg !126

for.body9:                                        ; preds = %for.cond6
  %z = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 2, !dbg !127
  %21 = load { double, double }**, { double, double }*** %z, align 8, !dbg !127
  %22 = load i32, i32* %i, align 4, !dbg !130
  %idxprom = sext i32 %22 to i64, !dbg !131
  %arrayidx = getelementptr inbounds { double, double }*, { double, double }** %21, i64 %idxprom, !dbg !131
  %23 = load { double, double }*, { double, double }** %arrayidx, align 8, !dbg !131
  %24 = load i32, i32* %j, align 4, !dbg !132
  %idxprom10 = sext i32 %24 to i64, !dbg !131
  %arrayidx11 = getelementptr inbounds { double, double }, { double, double }* %23, i64 %idxprom10, !dbg !131
  %arrayidx11.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx11, i32 0, i32 0, !dbg !131
  %arrayidx11.real = load double, double* %arrayidx11.realp, align 8, !dbg !131
  %arrayidx11.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx11, i32 0, i32 1, !dbg !131
  %arrayidx11.imag = load double, double* %arrayidx11.imagp, align 8, !dbg !131
  %z12 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !133
  %25 = load { double, double }**, { double, double }*** %z12, align 8, !dbg !133
  %26 = load i32, i32* %i, align 4, !dbg !134
  %idxprom13 = sext i32 %26 to i64, !dbg !135
  %arrayidx14 = getelementptr inbounds { double, double }*, { double, double }** %25, i64 %idxprom13, !dbg !135
  %27 = load { double, double }*, { double, double }** %arrayidx14, align 8, !dbg !135
  %28 = load i32, i32* %j, align 4, !dbg !136
  %idxprom15 = sext i32 %28 to i64, !dbg !135
  %arrayidx16 = getelementptr inbounds { double, double }, { double, double }* %27, i64 %idxprom15, !dbg !135
  %arrayidx16.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx16, i32 0, i32 0, !dbg !135
  %arrayidx16.real = load double, double* %arrayidx16.realp, align 8, !dbg !135
  %arrayidx16.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx16, i32 0, i32 1, !dbg !135
  %arrayidx16.imag = load double, double* %arrayidx16.imagp, align 8, !dbg !135
  %cmp.r = fcmp une double %arrayidx11.real, %arrayidx16.real, !dbg !137
  %cmp.i = fcmp une double %arrayidx11.imag, %arrayidx16.imag, !dbg !137
  %or.ri = or i1 %cmp.r, %cmp.i, !dbg !137
  br i1 %or.ri, label %if.then17, label %if.end, !dbg !138, !cf.info !104

if.then17:                                        ; preds = %for.body9
  store i32 0, i32* %retval, align 4, !dbg !139
  br label %return, !dbg !139

if.end:                                           ; preds = %for.body9
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %if.end
  %29 = load i32, i32* %j, align 4, !dbg !141
  %inc = add nsw i32 %29, 1, !dbg !141
  store i32 %inc, i32* %j, align 4, !dbg !141
  br label %for.cond6, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond6
  br label %for.inc18, !dbg !145

for.inc18:                                        ; preds = %for.end
  %30 = load i32, i32* %i, align 4, !dbg !146
  %inc19 = add nsw i32 %30, 1, !dbg !146
  store i32 %inc19, i32* %i, align 4, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end20:                                        ; preds = %for.cond
  br label %if.end21, !dbg !150

if.else:                                          ; preds = %land.lhs.true, %entry
  store i32 0, i32* %retval, align 4, !dbg !151
  br label %return, !dbg !151

if.end21:                                         ; preds = %for.end20
  store i32 1, i32* %retval, align 4, !dbg !152
  br label %return, !dbg !152

return:                                           ; preds = %if.end21, %if.else, %if.then17
  %31 = load i32, i32* %retval, align 4, !dbg !153
  ret i32 %31, !dbg !153
}

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, { double, double }** } @multiply(i64 %a.coerce0, { double, double }** %a.coerce1, i64 %b.coerce0, { double, double }** %b.coerce1) #3 !dbg !154 {
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
  call void @llvm.dbg.declare(metadata %struct.matrix* %a, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata %struct.matrix* %b, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata %struct.matrix* %retval, metadata !161, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata i32* %i, metadata !163, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata i32* %j, metadata !165, metadata !DIExpression()), !dbg !166
  %cols = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !167
  %6 = load i32, i32* %cols, align 4, !dbg !167
  %rows = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 0, !dbg !169
  %7 = load i32, i32* %rows, align 8, !dbg !169
  %cmp = icmp eq i32 %6, %7, !dbg !170
  br i1 %cmp, label %if.then, label %if.end, !dbg !171, !cf.info !104

if.then:                                          ; preds = %entry
  %rows1 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !172
  %8 = load i32, i32* %rows1, align 8, !dbg !172
  %rows2 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 0, !dbg !174
  store i32 %8, i32* %rows2, align 8, !dbg !175
  %cols3 = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 1, !dbg !176
  %9 = load i32, i32* %cols3, align 4, !dbg !176
  %cols4 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 1, !dbg !177
  store i32 %9, i32* %cols4, align 4, !dbg !178
  %rows5 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 0, !dbg !179
  %10 = load i32, i32* %rows5, align 8, !dbg !179
  %conv = sext i32 %10 to i64, !dbg !180
  %mul = mul i64 %conv, 8, !dbg !181
  %call = call noalias i8* @malloc(i64 %mul) #6, !dbg !182
  %11 = bitcast i8* %call to { double, double }**, !dbg !182
  %z = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 2, !dbg !183
  store { double, double }** %11, { double, double }*** %z, align 8, !dbg !184
  store i32 0, i32* %i, align 4, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc53, %if.then
  %12 = load i32, i32* %i, align 4, !dbg !188
  %rows6 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 0, !dbg !190
  %13 = load i32, i32* %rows6, align 8, !dbg !190
  %cmp7 = icmp slt i32 %12, %13, !dbg !191
  br i1 %cmp7, label %for.body, label %for.end55, !dbg !192

for.body:                                         ; preds = %for.cond
  %cols9 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 1, !dbg !193
  %14 = load i32, i32* %cols9, align 4, !dbg !193
  %conv10 = sext i32 %14 to i64, !dbg !195
  %mul11 = mul i64 %conv10, 16, !dbg !196
  %call12 = call noalias i8* @malloc(i64 %mul11) #6, !dbg !197
  %15 = bitcast i8* %call12 to { double, double }*, !dbg !197
  %z13 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 2, !dbg !198
  %16 = load { double, double }**, { double, double }*** %z13, align 8, !dbg !198
  %17 = load i32, i32* %i, align 4, !dbg !199
  %idxprom = sext i32 %17 to i64, !dbg !200
  %arrayidx = getelementptr inbounds { double, double }*, { double, double }** %16, i64 %idxprom, !dbg !200
  store { double, double }* %15, { double, double }** %arrayidx, align 8, !dbg !201
  br i1 false, label %complex_mul_imag_nan, label %complex_mul_cont, !dbg !202, !prof !203

complex_mul_imag_nan:                             ; preds = %for.body
  br i1 false, label %complex_mul_libcall, label %complex_mul_cont, !dbg !202, !prof !203

complex_mul_libcall:                              ; preds = %complex_mul_imag_nan
  %call14 = call <2 x float> @__mulsc3(float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 1.000000e+00) #6, !dbg !202
  %18 = bitcast { float, float }* %coerce to <2 x float>*, !dbg !202
  store <2 x float> %call14, <2 x float>* %18, align 4, !dbg !202
  %coerce.realp = getelementptr inbounds { float, float }, { float, float }* %coerce, i32 0, i32 0, !dbg !202
  %coerce.real = load float, float* %coerce.realp, align 4, !dbg !202
  %coerce.imagp = getelementptr inbounds { float, float }, { float, float }* %coerce, i32 0, i32 1, !dbg !202
  %coerce.imag = load float, float* %coerce.imagp, align 4, !dbg !202
  br label %complex_mul_cont, !dbg !202

complex_mul_cont:                                 ; preds = %complex_mul_libcall, %complex_mul_imag_nan, %for.body
  %real_mul_phi = phi float [ 0.000000e+00, %for.body ], [ 0.000000e+00, %complex_mul_imag_nan ], [ %coerce.real, %complex_mul_libcall ], !dbg !202
  %imag_mul_phi = phi float [ 0.000000e+00, %for.body ], [ 0.000000e+00, %complex_mul_imag_nan ], [ %coerce.imag, %complex_mul_libcall ], !dbg !202
  %add.r = fadd float 0.000000e+00, %real_mul_phi, !dbg !204
  %add.i = fadd float 0.000000e+00, %imag_mul_phi, !dbg !204
  %conv15 = fpext float %add.r to double, !dbg !205
  %conv16 = fpext float %add.i to double, !dbg !205
  %z17 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 2, !dbg !206
  %19 = load { double, double }**, { double, double }*** %z17, align 8, !dbg !206
  %20 = load i32, i32* %i, align 4, !dbg !207
  %idxprom18 = sext i32 %20 to i64, !dbg !208
  %arrayidx19 = getelementptr inbounds { double, double }*, { double, double }** %19, i64 %idxprom18, !dbg !208
  %21 = load { double, double }*, { double, double }** %arrayidx19, align 8, !dbg !208
  %22 = load i32, i32* %j, align 4, !dbg !209
  %idxprom20 = sext i32 %22 to i64, !dbg !208
  %arrayidx21 = getelementptr inbounds { double, double }, { double, double }* %21, i64 %idxprom20, !dbg !208
  %arrayidx21.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx21, i32 0, i32 0, !dbg !210
  %arrayidx21.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx21, i32 0, i32 1, !dbg !210
  store double %conv15, double* %arrayidx21.realp, align 8, !dbg !210
  store double %conv16, double* %arrayidx21.imagp, align 8, !dbg !210
  store i32 0, i32* %j, align 4, !dbg !211
  br label %for.cond22, !dbg !213

for.cond22:                                       ; preds = %for.inc, %complex_mul_cont
  %23 = load i32, i32* %j, align 4, !dbg !214
  %cols23 = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 1, !dbg !216
  %24 = load i32, i32* %cols23, align 4, !dbg !216
  %cmp24 = icmp slt i32 %23, %24, !dbg !217
  br i1 %cmp24, label %for.body26, label %for.end, !dbg !218

for.body26:                                       ; preds = %for.cond22
  %z27 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !219
  %25 = load { double, double }**, { double, double }*** %z27, align 8, !dbg !219
  %26 = load i32, i32* %i, align 4, !dbg !221
  %idxprom28 = sext i32 %26 to i64, !dbg !222
  %arrayidx29 = getelementptr inbounds { double, double }*, { double, double }** %25, i64 %idxprom28, !dbg !222
  %27 = load { double, double }*, { double, double }** %arrayidx29, align 8, !dbg !222
  %28 = load i32, i32* %j, align 4, !dbg !223
  %idxprom30 = sext i32 %28 to i64, !dbg !222
  %arrayidx31 = getelementptr inbounds { double, double }, { double, double }* %27, i64 %idxprom30, !dbg !222
  %arrayidx31.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx31, i32 0, i32 0, !dbg !222
  %arrayidx31.real = load double, double* %arrayidx31.realp, align 8, !dbg !222
  %arrayidx31.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx31, i32 0, i32 1, !dbg !222
  %arrayidx31.imag = load double, double* %arrayidx31.imagp, align 8, !dbg !222
  %z32 = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 2, !dbg !224
  %29 = load { double, double }**, { double, double }*** %z32, align 8, !dbg !224
  %30 = load i32, i32* %j, align 4, !dbg !225
  %idxprom33 = sext i32 %30 to i64, !dbg !226
  %arrayidx34 = getelementptr inbounds { double, double }*, { double, double }** %29, i64 %idxprom33, !dbg !226
  %31 = load { double, double }*, { double, double }** %arrayidx34, align 8, !dbg !226
  %32 = load i32, i32* %i, align 4, !dbg !227
  %idxprom35 = sext i32 %32 to i64, !dbg !226
  %arrayidx36 = getelementptr inbounds { double, double }, { double, double }* %31, i64 %idxprom35, !dbg !226
  %arrayidx36.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx36, i32 0, i32 0, !dbg !226
  %arrayidx36.real = load double, double* %arrayidx36.realp, align 8, !dbg !226
  %arrayidx36.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx36, i32 0, i32 1, !dbg !226
  %arrayidx36.imag = load double, double* %arrayidx36.imagp, align 8, !dbg !226
  %mul_ac = fmul double %arrayidx31.real, %arrayidx36.real, !dbg !228
  %mul_bd = fmul double %arrayidx31.imag, %arrayidx36.imag, !dbg !228
  %mul_ad = fmul double %arrayidx31.real, %arrayidx36.imag, !dbg !228
  %mul_bc = fmul double %arrayidx31.imag, %arrayidx36.real, !dbg !228
  %mul_r = fsub double %mul_ac, %mul_bd, !dbg !228
  %mul_i = fadd double %mul_ad, %mul_bc, !dbg !228
  %isnan_cmp = fcmp uno double %mul_r, %mul_r, !dbg !228
  br i1 %isnan_cmp, label %complex_mul_imag_nan37, label %complex_mul_cont41, !dbg !228, !prof !203

complex_mul_imag_nan37:                           ; preds = %for.body26
  %isnan_cmp38 = fcmp uno double %mul_i, %mul_i, !dbg !228
  br i1 %isnan_cmp38, label %complex_mul_libcall39, label %complex_mul_cont41, !dbg !228, !prof !203

complex_mul_libcall39:                            ; preds = %complex_mul_imag_nan37
  %call40 = call { double, double } @__muldc3(double %arrayidx31.real, double %arrayidx31.imag, double %arrayidx36.real, double %arrayidx36.imag) #6, !dbg !228
  %33 = extractvalue { double, double } %call40, 0, !dbg !228
  %34 = extractvalue { double, double } %call40, 1, !dbg !228
  br label %complex_mul_cont41, !dbg !228

complex_mul_cont41:                               ; preds = %complex_mul_libcall39, %complex_mul_imag_nan37, %for.body26
  %real_mul_phi42 = phi double [ %mul_r, %for.body26 ], [ %mul_r, %complex_mul_imag_nan37 ], [ %33, %complex_mul_libcall39 ], !dbg !228
  %imag_mul_phi43 = phi double [ %mul_i, %for.body26 ], [ %mul_i, %complex_mul_imag_nan37 ], [ %34, %complex_mul_libcall39 ], !dbg !228
  %z44 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 2, !dbg !229
  %35 = load { double, double }**, { double, double }*** %z44, align 8, !dbg !229
  %36 = load i32, i32* %i, align 4, !dbg !230
  %idxprom45 = sext i32 %36 to i64, !dbg !231
  %arrayidx46 = getelementptr inbounds { double, double }*, { double, double }** %35, i64 %idxprom45, !dbg !231
  %37 = load { double, double }*, { double, double }** %arrayidx46, align 8, !dbg !231
  %38 = load i32, i32* %j, align 4, !dbg !232
  %idxprom47 = sext i32 %38 to i64, !dbg !231
  %arrayidx48 = getelementptr inbounds { double, double }, { double, double }* %37, i64 %idxprom47, !dbg !231
  %arrayidx48.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx48, i32 0, i32 0, !dbg !233
  %arrayidx48.real = load double, double* %arrayidx48.realp, align 8, !dbg !233
  %arrayidx48.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx48, i32 0, i32 1, !dbg !233
  %arrayidx48.imag = load double, double* %arrayidx48.imagp, align 8, !dbg !233
  %add.r49 = fadd double %arrayidx48.real, %real_mul_phi42, !dbg !233
  %add.i50 = fadd double %arrayidx48.imag, %imag_mul_phi43, !dbg !233
  %arrayidx48.realp51 = getelementptr inbounds { double, double }, { double, double }* %arrayidx48, i32 0, i32 0, !dbg !233
  %arrayidx48.imagp52 = getelementptr inbounds { double, double }, { double, double }* %arrayidx48, i32 0, i32 1, !dbg !233
  store double %add.r49, double* %arrayidx48.realp51, align 8, !dbg !233
  store double %add.i50, double* %arrayidx48.imagp52, align 8, !dbg !233
  br label %for.inc, !dbg !234

for.inc:                                          ; preds = %complex_mul_cont41
  %39 = load i32, i32* %j, align 4, !dbg !235
  %inc = add nsw i32 %39, 1, !dbg !235
  store i32 %inc, i32* %j, align 4, !dbg !235
  br label %for.cond22, !dbg !236, !llvm.loop !237

for.end:                                          ; preds = %for.cond22
  br label %for.inc53, !dbg !239

for.inc53:                                        ; preds = %for.end
  %40 = load i32, i32* %i, align 4, !dbg !240
  %inc54 = add nsw i32 %40, 1, !dbg !240
  store i32 %inc54, i32* %i, align 4, !dbg !240
  br label %for.cond, !dbg !241, !llvm.loop !242

for.end55:                                        ; preds = %for.cond
  br label %if.end, !dbg !244

if.end:                                           ; preds = %for.end55, %entry
  %41 = bitcast %struct.matrix* %retval to { i64, { double, double }** }*, !dbg !245
  %42 = load { i64, { double, double }** }, { i64, { double, double }** }* %41, align 8, !dbg !245
  ret { i64, { double, double }** } %42, !dbg !245
}

declare dso_local <2 x float> @__mulsc3(float, float, float, float)

declare dso_local { double, double } @__muldc3(double, double, double, double)

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @isNormal(i64 %a.coerce0, { double, double }** %a.coerce1) #0 !dbg !246 {
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
  call void @llvm.dbg.declare(metadata %struct.matrix* %a, metadata !247, metadata !DIExpression()), !dbg !248
  call void @llvm.dbg.declare(metadata i32* %i, metadata !249, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.declare(metadata i32* %j, metadata !251, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.declare(metadata %struct.matrix* %a_ah, metadata !253, metadata !DIExpression()), !dbg !254
  call void @llvm.dbg.declare(metadata %struct.matrix* %ah_a, metadata !255, metadata !DIExpression()), !dbg !256
  %rows = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !257
  %3 = load i32, i32* %rows, align 8, !dbg !257
  %cols = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !259
  %4 = load i32, i32* %cols, align 4, !dbg !259
  %cmp = icmp ne i32 %3, %4, !dbg !260
  br i1 %cmp, label %if.then, label %if.end, !dbg !261, !cf.info !104

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !262
  br label %return, !dbg !262

if.end:                                           ; preds = %entry
  %5 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !263
  %6 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %5, i32 0, i32 0, !dbg !263
  %7 = load i64, i64* %6, align 8, !dbg !263
  %8 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %5, i32 0, i32 1, !dbg !263
  %9 = load { double, double }**, { double, double }*** %8, align 8, !dbg !263
  %call = call { i64, { double, double }** } @transpose(i64 %7, { double, double }** %9), !dbg !263
  %10 = bitcast %struct.matrix* %agg.tmp to { i64, { double, double }** }*, !dbg !263
  %11 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %10, i32 0, i32 0, !dbg !263
  %12 = extractvalue { i64, { double, double }** } %call, 0, !dbg !263
  store i64 %12, i64* %11, align 8, !dbg !263
  %13 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %10, i32 0, i32 1, !dbg !263
  %14 = extractvalue { i64, { double, double }** } %call, 1, !dbg !263
  store { double, double }** %14, { double, double }*** %13, align 8, !dbg !263
  %15 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !264
  %16 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %15, i32 0, i32 0, !dbg !264
  %17 = load i64, i64* %16, align 8, !dbg !264
  %18 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %15, i32 0, i32 1, !dbg !264
  %19 = load { double, double }**, { double, double }*** %18, align 8, !dbg !264
  %20 = bitcast %struct.matrix* %agg.tmp to { i64, { double, double }** }*, !dbg !264
  %21 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %20, i32 0, i32 0, !dbg !264
  %22 = load i64, i64* %21, align 8, !dbg !264
  %23 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %20, i32 0, i32 1, !dbg !264
  %24 = load { double, double }**, { double, double }*** %23, align 8, !dbg !264
  %call1 = call { i64, { double, double }** } @multiply(i64 %17, { double, double }** %19, i64 %22, { double, double }** %24), !dbg !264
  %25 = bitcast %struct.matrix* %tmp to { i64, { double, double }** }*, !dbg !264
  %26 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %25, i32 0, i32 0, !dbg !264
  %27 = extractvalue { i64, { double, double }** } %call1, 0, !dbg !264
  store i64 %27, i64* %26, align 8, !dbg !264
  %28 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %25, i32 0, i32 1, !dbg !264
  %29 = extractvalue { i64, { double, double }** } %call1, 1, !dbg !264
  store { double, double }** %29, { double, double }*** %28, align 8, !dbg !264
  %30 = bitcast %struct.matrix* %a_ah to i8*, !dbg !264
  %31 = bitcast %struct.matrix* %tmp to i8*, !dbg !264
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %30, i8* align 8 %31, i64 16, i1 false), !dbg !264
  %32 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !265
  %33 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %32, i32 0, i32 0, !dbg !265
  %34 = load i64, i64* %33, align 8, !dbg !265
  %35 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %32, i32 0, i32 1, !dbg !265
  %36 = load { double, double }**, { double, double }*** %35, align 8, !dbg !265
  %call4 = call { i64, { double, double }** } @transpose(i64 %34, { double, double }** %36), !dbg !265
  %37 = bitcast %struct.matrix* %agg.tmp3 to { i64, { double, double }** }*, !dbg !265
  %38 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %37, i32 0, i32 0, !dbg !265
  %39 = extractvalue { i64, { double, double }** } %call4, 0, !dbg !265
  store i64 %39, i64* %38, align 8, !dbg !265
  %40 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %37, i32 0, i32 1, !dbg !265
  %41 = extractvalue { i64, { double, double }** } %call4, 1, !dbg !265
  store { double, double }** %41, { double, double }*** %40, align 8, !dbg !265
  %42 = bitcast %struct.matrix* %agg.tmp3 to { i64, { double, double }** }*, !dbg !266
  %43 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %42, i32 0, i32 0, !dbg !266
  %44 = load i64, i64* %43, align 8, !dbg !266
  %45 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %42, i32 0, i32 1, !dbg !266
  %46 = load { double, double }**, { double, double }*** %45, align 8, !dbg !266
  %47 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !266
  %48 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %47, i32 0, i32 0, !dbg !266
  %49 = load i64, i64* %48, align 8, !dbg !266
  %50 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %47, i32 0, i32 1, !dbg !266
  %51 = load { double, double }**, { double, double }*** %50, align 8, !dbg !266
  %call5 = call { i64, { double, double }** } @multiply(i64 %44, { double, double }** %46, i64 %49, { double, double }** %51), !dbg !266
  %52 = bitcast %struct.matrix* %tmp2 to { i64, { double, double }** }*, !dbg !266
  %53 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %52, i32 0, i32 0, !dbg !266
  %54 = extractvalue { i64, { double, double }** } %call5, 0, !dbg !266
  store i64 %54, i64* %53, align 8, !dbg !266
  %55 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %52, i32 0, i32 1, !dbg !266
  %56 = extractvalue { i64, { double, double }** } %call5, 1, !dbg !266
  store { double, double }** %56, { double, double }*** %55, align 8, !dbg !266
  %57 = bitcast %struct.matrix* %ah_a to i8*, !dbg !266
  %58 = bitcast %struct.matrix* %tmp2 to i8*, !dbg !266
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %57, i8* align 8 %58, i64 16, i1 false), !dbg !266
  store i32 0, i32* %i, align 4, !dbg !267
  br label %for.cond, !dbg !269

for.cond:                                         ; preds = %for.inc21, %if.end
  %59 = load i32, i32* %i, align 4, !dbg !270
  %rows6 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !272
  %60 = load i32, i32* %rows6, align 8, !dbg !272
  %cmp7 = icmp slt i32 %59, %60, !dbg !273
  br i1 %cmp7, label %for.body, label %for.end23, !dbg !274

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !275
  br label %for.cond8, !dbg !278

for.cond8:                                        ; preds = %for.inc, %for.body
  %61 = load i32, i32* %j, align 4, !dbg !279
  %cols9 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !281
  %62 = load i32, i32* %cols9, align 4, !dbg !281
  %cmp10 = icmp slt i32 %61, %62, !dbg !282
  br i1 %cmp10, label %for.body11, label %for.end, !dbg !283

for.body11:                                       ; preds = %for.cond8
  %z = getelementptr inbounds %struct.matrix, %struct.matrix* %a_ah, i32 0, i32 2, !dbg !284
  %63 = load { double, double }**, { double, double }*** %z, align 8, !dbg !284
  %64 = load i32, i32* %i, align 4, !dbg !287
  %idxprom = sext i32 %64 to i64, !dbg !288
  %arrayidx = getelementptr inbounds { double, double }*, { double, double }** %63, i64 %idxprom, !dbg !288
  %65 = load { double, double }*, { double, double }** %arrayidx, align 8, !dbg !288
  %66 = load i32, i32* %j, align 4, !dbg !289
  %idxprom12 = sext i32 %66 to i64, !dbg !288
  %arrayidx13 = getelementptr inbounds { double, double }, { double, double }* %65, i64 %idxprom12, !dbg !288
  %arrayidx13.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx13, i32 0, i32 0, !dbg !288
  %arrayidx13.real = load double, double* %arrayidx13.realp, align 8, !dbg !288
  %arrayidx13.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx13, i32 0, i32 1, !dbg !288
  %arrayidx13.imag = load double, double* %arrayidx13.imagp, align 8, !dbg !288
  %z14 = getelementptr inbounds %struct.matrix, %struct.matrix* %ah_a, i32 0, i32 2, !dbg !290
  %67 = load { double, double }**, { double, double }*** %z14, align 8, !dbg !290
  %68 = load i32, i32* %i, align 4, !dbg !291
  %idxprom15 = sext i32 %68 to i64, !dbg !292
  %arrayidx16 = getelementptr inbounds { double, double }*, { double, double }** %67, i64 %idxprom15, !dbg !292
  %69 = load { double, double }*, { double, double }** %arrayidx16, align 8, !dbg !292
  %70 = load i32, i32* %j, align 4, !dbg !293
  %idxprom17 = sext i32 %70 to i64, !dbg !292
  %arrayidx18 = getelementptr inbounds { double, double }, { double, double }* %69, i64 %idxprom17, !dbg !292
  %arrayidx18.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx18, i32 0, i32 0, !dbg !292
  %arrayidx18.real = load double, double* %arrayidx18.realp, align 8, !dbg !292
  %arrayidx18.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx18, i32 0, i32 1, !dbg !292
  %arrayidx18.imag = load double, double* %arrayidx18.imagp, align 8, !dbg !292
  %cmp.r = fcmp une double %arrayidx13.real, %arrayidx18.real, !dbg !294
  %cmp.i = fcmp une double %arrayidx13.imag, %arrayidx18.imag, !dbg !294
  %or.ri = or i1 %cmp.r, %cmp.i, !dbg !294
  br i1 %or.ri, label %if.then19, label %if.end20, !dbg !295, !cf.info !104

if.then19:                                        ; preds = %for.body11
  store i32 0, i32* %retval, align 4, !dbg !296
  br label %return, !dbg !296

if.end20:                                         ; preds = %for.body11
  br label %for.inc, !dbg !297

for.inc:                                          ; preds = %if.end20
  %71 = load i32, i32* %j, align 4, !dbg !298
  %inc = add nsw i32 %71, 1, !dbg !298
  store i32 %inc, i32* %j, align 4, !dbg !298
  br label %for.cond8, !dbg !299, !llvm.loop !300

for.end:                                          ; preds = %for.cond8
  br label %for.inc21, !dbg !302

for.inc21:                                        ; preds = %for.end
  %72 = load i32, i32* %i, align 4, !dbg !303
  %inc22 = add nsw i32 %72, 1, !dbg !303
  store i32 %inc22, i32* %i, align 4, !dbg !303
  br label %for.cond, !dbg !304, !llvm.loop !305

for.end23:                                        ; preds = %for.cond
  store i32 1, i32* %retval, align 4, !dbg !307
  br label %return, !dbg !307

return:                                           ; preds = %for.end23, %if.then19, %if.then
  %73 = load i32, i32* %retval, align 4, !dbg !308
  ret i32 %73, !dbg !308
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @isUnitary(i64 %a.coerce0, { double, double }** %a.coerce1) #0 !dbg !309 {
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
  call void @llvm.dbg.declare(metadata %struct.matrix* %a, metadata !310, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.declare(metadata %struct.matrix* %b, metadata !312, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.declare(metadata i32* %i, metadata !314, metadata !DIExpression()), !dbg !315
  call void @llvm.dbg.declare(metadata i32* %j, metadata !316, metadata !DIExpression()), !dbg !317
  %3 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !318
  %4 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %3, i32 0, i32 0, !dbg !318
  %5 = load i64, i64* %4, align 8, !dbg !318
  %6 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %3, i32 0, i32 1, !dbg !318
  %7 = load { double, double }**, { double, double }*** %6, align 8, !dbg !318
  %call = call i32 @isNormal(i64 %5, { double, double }** %7), !dbg !318
  %cmp = icmp eq i32 %call, 1, !dbg !320
  br i1 %cmp, label %if.then, label %if.end24, !dbg !321, !cf.info !104

if.then:                                          ; preds = %entry
  %8 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !322
  %9 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %8, i32 0, i32 0, !dbg !322
  %10 = load i64, i64* %9, align 8, !dbg !322
  %11 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %8, i32 0, i32 1, !dbg !322
  %12 = load { double, double }**, { double, double }*** %11, align 8, !dbg !322
  %call1 = call { i64, { double, double }** } @transpose(i64 %10, { double, double }** %12), !dbg !322
  %13 = bitcast %struct.matrix* %agg.tmp to { i64, { double, double }** }*, !dbg !322
  %14 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %13, i32 0, i32 0, !dbg !322
  %15 = extractvalue { i64, { double, double }** } %call1, 0, !dbg !322
  store i64 %15, i64* %14, align 8, !dbg !322
  %16 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %13, i32 0, i32 1, !dbg !322
  %17 = extractvalue { i64, { double, double }** } %call1, 1, !dbg !322
  store { double, double }** %17, { double, double }*** %16, align 8, !dbg !322
  %18 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !324
  %19 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %18, i32 0, i32 0, !dbg !324
  %20 = load i64, i64* %19, align 8, !dbg !324
  %21 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %18, i32 0, i32 1, !dbg !324
  %22 = load { double, double }**, { double, double }*** %21, align 8, !dbg !324
  %23 = bitcast %struct.matrix* %agg.tmp to { i64, { double, double }** }*, !dbg !324
  %24 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %23, i32 0, i32 0, !dbg !324
  %25 = load i64, i64* %24, align 8, !dbg !324
  %26 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %23, i32 0, i32 1, !dbg !324
  %27 = load { double, double }**, { double, double }*** %26, align 8, !dbg !324
  %call2 = call { i64, { double, double }** } @multiply(i64 %20, { double, double }** %22, i64 %25, { double, double }** %27), !dbg !324
  %28 = bitcast %struct.matrix* %tmp to { i64, { double, double }** }*, !dbg !324
  %29 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %28, i32 0, i32 0, !dbg !324
  %30 = extractvalue { i64, { double, double }** } %call2, 0, !dbg !324
  store i64 %30, i64* %29, align 8, !dbg !324
  %31 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %28, i32 0, i32 1, !dbg !324
  %32 = extractvalue { i64, { double, double }** } %call2, 1, !dbg !324
  store { double, double }** %32, { double, double }*** %31, align 8, !dbg !324
  %33 = bitcast %struct.matrix* %b to i8*, !dbg !324
  %34 = bitcast %struct.matrix* %tmp to i8*, !dbg !324
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %33, i8* align 8 %34, i64 16, i1 false), !dbg !324
  store i32 0, i32* %i, align 4, !dbg !325
  br label %for.cond, !dbg !327

for.cond:                                         ; preds = %for.inc21, %if.then
  %35 = load i32, i32* %i, align 4, !dbg !328
  %rows = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 0, !dbg !330
  %36 = load i32, i32* %rows, align 8, !dbg !330
  %cmp3 = icmp slt i32 %35, %36, !dbg !331
  br i1 %cmp3, label %for.body, label %for.end23, !dbg !332

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !333
  br label %for.cond4, !dbg !336

for.cond4:                                        ; preds = %for.inc, %for.body
  %37 = load i32, i32* %j, align 4, !dbg !337
  %cols = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 1, !dbg !339
  %38 = load i32, i32* %cols, align 4, !dbg !339
  %cmp5 = icmp slt i32 %37, %38, !dbg !340
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !341

for.body6:                                        ; preds = %for.cond4
  %39 = load i32, i32* %i, align 4, !dbg !342
  %40 = load i32, i32* %j, align 4, !dbg !345
  %cmp7 = icmp eq i32 %39, %40, !dbg !346
  br i1 %cmp7, label %land.lhs.true, label %lor.lhs.false, !dbg !347, !cf.info !104

land.lhs.true:                                    ; preds = %for.body6
  %z = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 2, !dbg !348
  %41 = load { double, double }**, { double, double }*** %z, align 8, !dbg !348
  %42 = load i32, i32* %i, align 4, !dbg !349
  %idxprom = sext i32 %42 to i64, !dbg !350
  %arrayidx = getelementptr inbounds { double, double }*, { double, double }** %41, i64 %idxprom, !dbg !350
  %43 = load { double, double }*, { double, double }** %arrayidx, align 8, !dbg !350
  %44 = load i32, i32* %j, align 4, !dbg !351
  %idxprom8 = sext i32 %44 to i64, !dbg !350
  %arrayidx9 = getelementptr inbounds { double, double }, { double, double }* %43, i64 %idxprom8, !dbg !350
  %arrayidx9.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx9, i32 0, i32 0, !dbg !350
  %arrayidx9.real = load double, double* %arrayidx9.realp, align 8, !dbg !350
  %arrayidx9.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx9, i32 0, i32 1, !dbg !350
  %arrayidx9.imag = load double, double* %arrayidx9.imagp, align 8, !dbg !350
  %cmp.r = fcmp une double %arrayidx9.real, 1.000000e+00, !dbg !352
  %cmp.i = fcmp une double %arrayidx9.imag, 0.000000e+00, !dbg !352
  %or.ri = or i1 %cmp.r, %cmp.i, !dbg !352
  br i1 %or.ri, label %if.then20, label %lor.lhs.false, !dbg !353, !cf.info !104

lor.lhs.false:                                    ; preds = %land.lhs.true, %for.body6
  %45 = load i32, i32* %i, align 4, !dbg !354
  %46 = load i32, i32* %j, align 4, !dbg !355
  %cmp10 = icmp ne i32 %45, %46, !dbg !356
  br i1 %cmp10, label %land.lhs.true11, label %if.end, !dbg !357, !cf.info !104

land.lhs.true11:                                  ; preds = %lor.lhs.false
  %z12 = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 2, !dbg !358
  %47 = load { double, double }**, { double, double }*** %z12, align 8, !dbg !358
  %48 = load i32, i32* %i, align 4, !dbg !359
  %idxprom13 = sext i32 %48 to i64, !dbg !360
  %arrayidx14 = getelementptr inbounds { double, double }*, { double, double }** %47, i64 %idxprom13, !dbg !360
  %49 = load { double, double }*, { double, double }** %arrayidx14, align 8, !dbg !360
  %50 = load i32, i32* %j, align 4, !dbg !361
  %idxprom15 = sext i32 %50 to i64, !dbg !360
  %arrayidx16 = getelementptr inbounds { double, double }, { double, double }* %49, i64 %idxprom15, !dbg !360
  %arrayidx16.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx16, i32 0, i32 0, !dbg !360
  %arrayidx16.real = load double, double* %arrayidx16.realp, align 8, !dbg !360
  %arrayidx16.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx16, i32 0, i32 1, !dbg !360
  %arrayidx16.imag = load double, double* %arrayidx16.imagp, align 8, !dbg !360
  %cmp.r17 = fcmp une double %arrayidx16.real, 0.000000e+00, !dbg !362
  %cmp.i18 = fcmp une double %arrayidx16.imag, 0.000000e+00, !dbg !362
  %or.ri19 = or i1 %cmp.r17, %cmp.i18, !dbg !362
  br i1 %or.ri19, label %if.then20, label %if.end, !dbg !363, !cf.info !104

if.then20:                                        ; preds = %land.lhs.true11, %land.lhs.true
  store i32 0, i32* %retval, align 4, !dbg !364
  br label %return, !dbg !364

if.end:                                           ; preds = %land.lhs.true11, %lor.lhs.false
  br label %for.inc, !dbg !365

for.inc:                                          ; preds = %if.end
  %51 = load i32, i32* %j, align 4, !dbg !366
  %inc = add nsw i32 %51, 1, !dbg !366
  store i32 %inc, i32* %j, align 4, !dbg !366
  br label %for.cond4, !dbg !367, !llvm.loop !368

for.end:                                          ; preds = %for.cond4
  br label %for.inc21, !dbg !370

for.inc21:                                        ; preds = %for.end
  %52 = load i32, i32* %i, align 4, !dbg !371
  %inc22 = add nsw i32 %52, 1, !dbg !371
  store i32 %inc22, i32* %i, align 4, !dbg !371
  br label %for.cond, !dbg !372, !llvm.loop !373

for.end23:                                        ; preds = %for.cond
  store i32 1, i32* %retval, align 4, !dbg !375
  br label %return, !dbg !375

if.end24:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !376
  br label %return, !dbg !376

return:                                           ; preds = %if.end24, %for.end23, %if.then20
  %53 = load i32, i32* %retval, align 4, !dbg !377
  ret i32 %53, !dbg !377
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #3 !dbg !378 {
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
  call void @llvm.dbg.declare(metadata { double, double }* %z, metadata !381, metadata !DIExpression()), !dbg !382
  br i1 false, label %complex_mul_imag_nan, label %complex_mul_cont, !dbg !383, !prof !203

complex_mul_imag_nan:                             ; preds = %entry
  br i1 false, label %complex_mul_libcall, label %complex_mul_cont, !dbg !383, !prof !203

complex_mul_libcall:                              ; preds = %complex_mul_imag_nan
  %call = call <2 x float> @__mulsc3(float 4.000000e+00, float 0.000000e+00, float 0.000000e+00, float 1.000000e+00) #6, !dbg !383
  %0 = bitcast { float, float }* %coerce to <2 x float>*, !dbg !383
  store <2 x float> %call, <2 x float>* %0, align 4, !dbg !383
  %coerce.realp = getelementptr inbounds { float, float }, { float, float }* %coerce, i32 0, i32 0, !dbg !383
  %coerce.real = load float, float* %coerce.realp, align 4, !dbg !383
  %coerce.imagp = getelementptr inbounds { float, float }, { float, float }* %coerce, i32 0, i32 1, !dbg !383
  %coerce.imag = load float, float* %coerce.imagp, align 4, !dbg !383
  br label %complex_mul_cont, !dbg !383

complex_mul_cont:                                 ; preds = %complex_mul_libcall, %complex_mul_imag_nan, %entry
  %real_mul_phi = phi float [ 0.000000e+00, %entry ], [ 0.000000e+00, %complex_mul_imag_nan ], [ %coerce.real, %complex_mul_libcall ], !dbg !383
  %imag_mul_phi = phi float [ 4.000000e+00, %entry ], [ 4.000000e+00, %complex_mul_imag_nan ], [ %coerce.imag, %complex_mul_libcall ], !dbg !383
  %add.r = fadd float 3.000000e+00, %real_mul_phi, !dbg !384
  %add.i = fadd float 0.000000e+00, %imag_mul_phi, !dbg !384
  %conv = fpext float %add.r to double, !dbg !385
  %conv1 = fpext float %add.i to double, !dbg !385
  %z.realp = getelementptr inbounds { double, double }, { double, double }* %z, i32 0, i32 0, !dbg !382
  %z.imagp = getelementptr inbounds { double, double }, { double, double }* %z, i32 0, i32 1, !dbg !382
  store double %conv, double* %z.realp, align 8, !dbg !382
  store double %conv1, double* %z.imagp, align 8, !dbg !382
  call void @llvm.dbg.declare(metadata %struct.matrix* %a, metadata !386, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.declare(metadata %struct.matrix* %aT, metadata !388, metadata !DIExpression()), !dbg !389
  call void @llvm.dbg.declare(metadata i32* %i, metadata !390, metadata !DIExpression()), !dbg !391
  call void @llvm.dbg.declare(metadata i32* %j, metadata !392, metadata !DIExpression()), !dbg !393
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0)), !dbg !394
  %rows = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !395
  %cols = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !396
  %call3 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i32* %rows, i32* %cols), !dbg !397
  %rows4 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !398
  %1 = load i32, i32* %rows4, align 8, !dbg !398
  %conv5 = sext i32 %1 to i64, !dbg !399
  %mul = mul i64 %conv5, 8, !dbg !400
  %call6 = call noalias i8* @malloc(i64 %mul) #6, !dbg !401
  %2 = bitcast i8* %call6 to { double, double }**, !dbg !401
  %z7 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !402
  store { double, double }** %2, { double, double }*** %z7, align 8, !dbg !403
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.2, i64 0, i64 0)), !dbg !404
  store i32 0, i32* %i, align 4, !dbg !405
  br label %for.cond, !dbg !407

for.cond:                                         ; preds = %for.inc55, %complex_mul_cont
  %3 = load i32, i32* %i, align 4, !dbg !408
  %rows9 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !410
  %4 = load i32, i32* %rows9, align 8, !dbg !410
  %cmp = icmp slt i32 %3, %4, !dbg !411
  br i1 %cmp, label %for.body, label %for.end57, !dbg !412

for.body:                                         ; preds = %for.cond
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !413
  %cols12 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !415
  %5 = load i32, i32* %cols12, align 4, !dbg !415
  %conv13 = sext i32 %5 to i64, !dbg !416
  %mul14 = mul i64 %conv13, 16, !dbg !417
  %call15 = call noalias i8* @malloc(i64 %mul14) #6, !dbg !418
  %6 = bitcast i8* %call15 to { double, double }*, !dbg !418
  %z16 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !419
  %7 = load { double, double }**, { double, double }*** %z16, align 8, !dbg !419
  %8 = load i32, i32* %i, align 4, !dbg !420
  %idxprom = sext i32 %8 to i64, !dbg !421
  %arrayidx = getelementptr inbounds { double, double }*, { double, double }** %7, i64 %idxprom, !dbg !421
  store { double, double }* %6, { double, double }** %arrayidx, align 8, !dbg !422
  store i32 0, i32* %j, align 4, !dbg !423
  br label %for.cond17, !dbg !425

for.cond17:                                       ; preds = %for.inc, %for.body
  %9 = load i32, i32* %j, align 4, !dbg !426
  %cols18 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !428
  %10 = load i32, i32* %cols18, align 4, !dbg !428
  %cmp19 = icmp slt i32 %9, %10, !dbg !429
  br i1 %cmp19, label %for.body21, label %for.end, !dbg !430

for.body21:                                       ; preds = %for.cond17
  %call22 = call i32 @rand() #6, !dbg !431
  %rem = srem i32 %call22, 10, !dbg !433
  %conv23 = sitofp i32 %rem to float, !dbg !431
  %call24 = call i32 @rand() #6, !dbg !434
  %rem25 = srem i32 %call24, 10, !dbg !435
  %conv26 = sitofp i32 %rem25 to float, !dbg !434
  %mul_ac = fmul float %conv26, 0.000000e+00, !dbg !436
  %mul_ad = fmul float %conv26, 1.000000e+00, !dbg !436
  %mul_r = fsub float %mul_ac, 0.000000e+00, !dbg !436
  %mul_i = fadd float %mul_ad, 0.000000e+00, !dbg !436
  %isnan_cmp = fcmp uno float %mul_r, %mul_r, !dbg !436
  br i1 %isnan_cmp, label %complex_mul_imag_nan27, label %complex_mul_cont32, !dbg !436, !prof !203

complex_mul_imag_nan27:                           ; preds = %for.body21
  %isnan_cmp28 = fcmp uno float %mul_i, %mul_i, !dbg !436
  br i1 %isnan_cmp28, label %complex_mul_libcall29, label %complex_mul_cont32, !dbg !436, !prof !203

complex_mul_libcall29:                            ; preds = %complex_mul_imag_nan27
  %call30 = call <2 x float> @__mulsc3(float %conv26, float 0.000000e+00, float 0.000000e+00, float 1.000000e+00) #6, !dbg !436
  %11 = bitcast { float, float }* %coerce31 to <2 x float>*, !dbg !436
  store <2 x float> %call30, <2 x float>* %11, align 4, !dbg !436
  %coerce31.realp = getelementptr inbounds { float, float }, { float, float }* %coerce31, i32 0, i32 0, !dbg !436
  %coerce31.real = load float, float* %coerce31.realp, align 4, !dbg !436
  %coerce31.imagp = getelementptr inbounds { float, float }, { float, float }* %coerce31, i32 0, i32 1, !dbg !436
  %coerce31.imag = load float, float* %coerce31.imagp, align 4, !dbg !436
  br label %complex_mul_cont32, !dbg !436

complex_mul_cont32:                               ; preds = %complex_mul_libcall29, %complex_mul_imag_nan27, %for.body21
  %real_mul_phi33 = phi float [ %mul_r, %for.body21 ], [ %mul_r, %complex_mul_imag_nan27 ], [ %coerce31.real, %complex_mul_libcall29 ], !dbg !436
  %imag_mul_phi34 = phi float [ %mul_i, %for.body21 ], [ %mul_i, %complex_mul_imag_nan27 ], [ %coerce31.imag, %complex_mul_libcall29 ], !dbg !436
  %add.r35 = fadd float %conv23, %real_mul_phi33, !dbg !437
  %add.i36 = fadd float 0.000000e+00, %imag_mul_phi34, !dbg !437
  %conv37 = fpext float %add.r35 to double, !dbg !431
  %conv38 = fpext float %add.i36 to double, !dbg !431
  %z39 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !438
  %12 = load { double, double }**, { double, double }*** %z39, align 8, !dbg !438
  %13 = load i32, i32* %i, align 4, !dbg !439
  %idxprom40 = sext i32 %13 to i64, !dbg !440
  %arrayidx41 = getelementptr inbounds { double, double }*, { double, double }** %12, i64 %idxprom40, !dbg !440
  %14 = load { double, double }*, { double, double }** %arrayidx41, align 8, !dbg !440
  %15 = load i32, i32* %j, align 4, !dbg !441
  %idxprom42 = sext i32 %15 to i64, !dbg !440
  %arrayidx43 = getelementptr inbounds { double, double }, { double, double }* %14, i64 %idxprom42, !dbg !440
  %arrayidx43.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx43, i32 0, i32 0, !dbg !442
  %arrayidx43.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx43, i32 0, i32 1, !dbg !442
  store double %conv37, double* %arrayidx43.realp, align 8, !dbg !442
  store double %conv38, double* %arrayidx43.imagp, align 8, !dbg !442
  %z44 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !443
  %16 = load { double, double }**, { double, double }*** %z44, align 8, !dbg !443
  %17 = load i32, i32* %i, align 4, !dbg !444
  %idxprom45 = sext i32 %17 to i64, !dbg !445
  %arrayidx46 = getelementptr inbounds { double, double }*, { double, double }** %16, i64 %idxprom45, !dbg !445
  %18 = load { double, double }*, { double, double }** %arrayidx46, align 8, !dbg !445
  %19 = load i32, i32* %j, align 4, !dbg !446
  %idxprom47 = sext i32 %19 to i64, !dbg !445
  %arrayidx48 = getelementptr inbounds { double, double }, { double, double }* %18, i64 %idxprom47, !dbg !445
  %arrayidx48.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx48, i32 0, i32 0, !dbg !445
  %arrayidx48.real = load double, double* %arrayidx48.realp, align 8, !dbg !445
  %arrayidx48.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx48, i32 0, i32 1, !dbg !445
  %arrayidx48.imag = load double, double* %arrayidx48.imagp, align 8, !dbg !445
  %z49 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !447
  %20 = load { double, double }**, { double, double }*** %z49, align 8, !dbg !447
  %21 = load i32, i32* %i, align 4, !dbg !448
  %idxprom50 = sext i32 %21 to i64, !dbg !449
  %arrayidx51 = getelementptr inbounds { double, double }*, { double, double }** %20, i64 %idxprom50, !dbg !449
  %22 = load { double, double }*, { double, double }** %arrayidx51, align 8, !dbg !449
  %23 = load i32, i32* %j, align 4, !dbg !450
  %idxprom52 = sext i32 %23 to i64, !dbg !449
  %arrayidx53 = getelementptr inbounds { double, double }, { double, double }* %22, i64 %idxprom52, !dbg !449
  %arrayidx53.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx53, i32 0, i32 0, !dbg !449
  %arrayidx53.real = load double, double* %arrayidx53.realp, align 8, !dbg !449
  %arrayidx53.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx53, i32 0, i32 1, !dbg !449
  %arrayidx53.imag = load double, double* %arrayidx53.imagp, align 8, !dbg !449
  %call54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), double %arrayidx48.real, double %arrayidx53.imag), !dbg !451
  br label %for.inc, !dbg !452

for.inc:                                          ; preds = %complex_mul_cont32
  %24 = load i32, i32* %j, align 4, !dbg !453
  %inc = add nsw i32 %24, 1, !dbg !453
  store i32 %inc, i32* %j, align 4, !dbg !453
  br label %for.cond17, !dbg !454, !llvm.loop !455

for.end:                                          ; preds = %for.cond17
  br label %for.inc55, !dbg !457

for.inc55:                                        ; preds = %for.end
  %25 = load i32, i32* %i, align 4, !dbg !458
  %inc56 = add nsw i32 %25, 1, !dbg !458
  store i32 %inc56, i32* %i, align 4, !dbg !458
  br label %for.cond, !dbg !459, !llvm.loop !460

for.end57:                                        ; preds = %for.cond
  %26 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !462
  %27 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %26, i32 0, i32 0, !dbg !462
  %28 = load i64, i64* %27, align 8, !dbg !462
  %29 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %26, i32 0, i32 1, !dbg !462
  %30 = load { double, double }**, { double, double }*** %29, align 8, !dbg !462
  %call58 = call { i64, { double, double }** } @transpose(i64 %28, { double, double }** %30), !dbg !462
  %31 = bitcast %struct.matrix* %tmp to { i64, { double, double }** }*, !dbg !462
  %32 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %31, i32 0, i32 0, !dbg !462
  %33 = extractvalue { i64, { double, double }** } %call58, 0, !dbg !462
  store i64 %33, i64* %32, align 8, !dbg !462
  %34 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %31, i32 0, i32 1, !dbg !462
  %35 = extractvalue { i64, { double, double }** } %call58, 1, !dbg !462
  store { double, double }** %35, { double, double }*** %34, align 8, !dbg !462
  %36 = bitcast %struct.matrix* %aT to i8*, !dbg !462
  %37 = bitcast %struct.matrix* %tmp to i8*, !dbg !462
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %36, i8* align 8 %37, i64 16, i1 false), !dbg !462
  %call59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.5, i64 0, i64 0)), !dbg !463
  store i32 0, i32* %i, align 4, !dbg !464
  br label %for.cond60, !dbg !466

for.cond60:                                       ; preds = %for.inc120, %for.end57
  %38 = load i32, i32* %i, align 4, !dbg !467
  %rows61 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 0, !dbg !469
  %39 = load i32, i32* %rows61, align 8, !dbg !469
  %cmp62 = icmp slt i32 %38, %39, !dbg !470
  br i1 %cmp62, label %for.body64, label %for.end122, !dbg !471

for.body64:                                       ; preds = %for.cond60
  %call65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !472
  %cols66 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 1, !dbg !474
  %40 = load i32, i32* %cols66, align 4, !dbg !474
  %conv67 = sext i32 %40 to i64, !dbg !475
  %mul68 = mul i64 %conv67, 16, !dbg !476
  %call69 = call noalias i8* @malloc(i64 %mul68) #6, !dbg !477
  %41 = bitcast i8* %call69 to { double, double }*, !dbg !477
  %z70 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 2, !dbg !478
  %42 = load { double, double }**, { double, double }*** %z70, align 8, !dbg !478
  %43 = load i32, i32* %i, align 4, !dbg !479
  %idxprom71 = sext i32 %43 to i64, !dbg !480
  %arrayidx72 = getelementptr inbounds { double, double }*, { double, double }** %42, i64 %idxprom71, !dbg !480
  store { double, double }* %41, { double, double }** %arrayidx72, align 8, !dbg !481
  store i32 0, i32* %j, align 4, !dbg !482
  br label %for.cond73, !dbg !484

for.cond73:                                       ; preds = %for.inc117, %for.body64
  %44 = load i32, i32* %j, align 4, !dbg !485
  %cols74 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 1, !dbg !487
  %45 = load i32, i32* %cols74, align 4, !dbg !487
  %cmp75 = icmp slt i32 %44, %45, !dbg !488
  br i1 %cmp75, label %for.body77, label %for.end119, !dbg !489

for.body77:                                       ; preds = %for.cond73
  %call78 = call i32 @rand() #6, !dbg !490
  %rem79 = srem i32 %call78, 10, !dbg !492
  %conv80 = sitofp i32 %rem79 to float, !dbg !490
  %call81 = call i32 @rand() #6, !dbg !493
  %rem82 = srem i32 %call81, 10, !dbg !494
  %conv83 = sitofp i32 %rem82 to float, !dbg !493
  %mul_ac84 = fmul float %conv83, 0.000000e+00, !dbg !495
  %mul_ad85 = fmul float %conv83, 1.000000e+00, !dbg !495
  %mul_r86 = fsub float %mul_ac84, 0.000000e+00, !dbg !495
  %mul_i87 = fadd float %mul_ad85, 0.000000e+00, !dbg !495
  %isnan_cmp88 = fcmp uno float %mul_r86, %mul_r86, !dbg !495
  br i1 %isnan_cmp88, label %complex_mul_imag_nan89, label %complex_mul_cont94, !dbg !495, !prof !203

complex_mul_imag_nan89:                           ; preds = %for.body77
  %isnan_cmp90 = fcmp uno float %mul_i87, %mul_i87, !dbg !495
  br i1 %isnan_cmp90, label %complex_mul_libcall91, label %complex_mul_cont94, !dbg !495, !prof !203

complex_mul_libcall91:                            ; preds = %complex_mul_imag_nan89
  %call92 = call <2 x float> @__mulsc3(float %conv83, float 0.000000e+00, float 0.000000e+00, float 1.000000e+00) #6, !dbg !495
  %46 = bitcast { float, float }* %coerce93 to <2 x float>*, !dbg !495
  store <2 x float> %call92, <2 x float>* %46, align 4, !dbg !495
  %coerce93.realp = getelementptr inbounds { float, float }, { float, float }* %coerce93, i32 0, i32 0, !dbg !495
  %coerce93.real = load float, float* %coerce93.realp, align 4, !dbg !495
  %coerce93.imagp = getelementptr inbounds { float, float }, { float, float }* %coerce93, i32 0, i32 1, !dbg !495
  %coerce93.imag = load float, float* %coerce93.imagp, align 4, !dbg !495
  br label %complex_mul_cont94, !dbg !495

complex_mul_cont94:                               ; preds = %complex_mul_libcall91, %complex_mul_imag_nan89, %for.body77
  %real_mul_phi95 = phi float [ %mul_r86, %for.body77 ], [ %mul_r86, %complex_mul_imag_nan89 ], [ %coerce93.real, %complex_mul_libcall91 ], !dbg !495
  %imag_mul_phi96 = phi float [ %mul_i87, %for.body77 ], [ %mul_i87, %complex_mul_imag_nan89 ], [ %coerce93.imag, %complex_mul_libcall91 ], !dbg !495
  %add.r97 = fadd float %conv80, %real_mul_phi95, !dbg !496
  %add.i98 = fadd float 0.000000e+00, %imag_mul_phi96, !dbg !496
  %conv99 = fpext float %add.r97 to double, !dbg !490
  %conv100 = fpext float %add.i98 to double, !dbg !490
  %z101 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 2, !dbg !497
  %47 = load { double, double }**, { double, double }*** %z101, align 8, !dbg !497
  %48 = load i32, i32* %i, align 4, !dbg !498
  %idxprom102 = sext i32 %48 to i64, !dbg !499
  %arrayidx103 = getelementptr inbounds { double, double }*, { double, double }** %47, i64 %idxprom102, !dbg !499
  %49 = load { double, double }*, { double, double }** %arrayidx103, align 8, !dbg !499
  %50 = load i32, i32* %j, align 4, !dbg !500
  %idxprom104 = sext i32 %50 to i64, !dbg !499
  %arrayidx105 = getelementptr inbounds { double, double }, { double, double }* %49, i64 %idxprom104, !dbg !499
  %arrayidx105.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx105, i32 0, i32 0, !dbg !501
  %arrayidx105.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx105, i32 0, i32 1, !dbg !501
  store double %conv99, double* %arrayidx105.realp, align 8, !dbg !501
  store double %conv100, double* %arrayidx105.imagp, align 8, !dbg !501
  %z106 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 2, !dbg !502
  %51 = load { double, double }**, { double, double }*** %z106, align 8, !dbg !502
  %52 = load i32, i32* %i, align 4, !dbg !503
  %idxprom107 = sext i32 %52 to i64, !dbg !504
  %arrayidx108 = getelementptr inbounds { double, double }*, { double, double }** %51, i64 %idxprom107, !dbg !504
  %53 = load { double, double }*, { double, double }** %arrayidx108, align 8, !dbg !504
  %54 = load i32, i32* %j, align 4, !dbg !505
  %idxprom109 = sext i32 %54 to i64, !dbg !504
  %arrayidx110 = getelementptr inbounds { double, double }, { double, double }* %53, i64 %idxprom109, !dbg !504
  %arrayidx110.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx110, i32 0, i32 0, !dbg !504
  %arrayidx110.real = load double, double* %arrayidx110.realp, align 8, !dbg !504
  %arrayidx110.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx110, i32 0, i32 1, !dbg !504
  %arrayidx110.imag = load double, double* %arrayidx110.imagp, align 8, !dbg !504
  %z111 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 2, !dbg !506
  %55 = load { double, double }**, { double, double }*** %z111, align 8, !dbg !506
  %56 = load i32, i32* %i, align 4, !dbg !507
  %idxprom112 = sext i32 %56 to i64, !dbg !508
  %arrayidx113 = getelementptr inbounds { double, double }*, { double, double }** %55, i64 %idxprom112, !dbg !508
  %57 = load { double, double }*, { double, double }** %arrayidx113, align 8, !dbg !508
  %58 = load i32, i32* %j, align 4, !dbg !509
  %idxprom114 = sext i32 %58 to i64, !dbg !508
  %arrayidx115 = getelementptr inbounds { double, double }, { double, double }* %57, i64 %idxprom114, !dbg !508
  %arrayidx115.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx115, i32 0, i32 0, !dbg !508
  %arrayidx115.real = load double, double* %arrayidx115.realp, align 8, !dbg !508
  %arrayidx115.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx115, i32 0, i32 1, !dbg !508
  %arrayidx115.imag = load double, double* %arrayidx115.imagp, align 8, !dbg !508
  %call116 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), double %arrayidx110.real, double %arrayidx115.imag), !dbg !510
  br label %for.inc117, !dbg !511

for.inc117:                                       ; preds = %complex_mul_cont94
  %59 = load i32, i32* %j, align 4, !dbg !512
  %inc118 = add nsw i32 %59, 1, !dbg !512
  store i32 %inc118, i32* %j, align 4, !dbg !512
  br label %for.cond73, !dbg !513, !llvm.loop !514

for.end119:                                       ; preds = %for.cond73
  br label %for.inc120, !dbg !516

for.inc120:                                       ; preds = %for.end119
  %60 = load i32, i32* %i, align 4, !dbg !517
  %inc121 = add nsw i32 %60, 1, !dbg !517
  store i32 %inc121, i32* %i, align 4, !dbg !517
  br label %for.cond60, !dbg !518, !llvm.loop !519

for.end122:                                       ; preds = %for.cond60
  %61 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !521
  %62 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %61, i32 0, i32 0, !dbg !521
  %63 = load i64, i64* %62, align 8, !dbg !521
  %64 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %61, i32 0, i32 1, !dbg !521
  %65 = load { double, double }**, { double, double }*** %64, align 8, !dbg !521
  %call123 = call i32 @isHermitian(i64 %63, { double, double }** %65), !dbg !521
  %cmp124 = icmp eq i32 %call123, 1, !dbg !522
  %66 = zext i1 %cmp124 to i64, !dbg !521
  %cond = select i1 %cmp124, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i64 0, i64 0), !dbg !521
  %call126 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.6, i64 0, i64 0), i8* %cond), !dbg !523
  %67 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !524
  %68 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %67, i32 0, i32 0, !dbg !524
  %69 = load i64, i64* %68, align 8, !dbg !524
  %70 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %67, i32 0, i32 1, !dbg !524
  %71 = load { double, double }**, { double, double }*** %70, align 8, !dbg !524
  %call127 = call i32 @isUnitary(i64 %69, { double, double }** %71), !dbg !524
  %cmp128 = icmp eq i32 %call127, 1, !dbg !525
  %72 = zext i1 %cmp128 to i64, !dbg !524
  %cond130 = select i1 %cmp128, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i64 0, i64 0), !dbg !524
  %call131 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.9, i64 0, i64 0), i8* %cond130), !dbg !526
  %73 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !527
  %74 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %73, i32 0, i32 0, !dbg !527
  %75 = load i64, i64* %74, align 8, !dbg !527
  %76 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %73, i32 0, i32 1, !dbg !527
  %77 = load { double, double }**, { double, double }*** %76, align 8, !dbg !527
  %call132 = call i32 @isNormal(i64 %75, { double, double }** %77), !dbg !527
  %cmp133 = icmp eq i32 %call132, 1, !dbg !528
  %78 = zext i1 %cmp133 to i64, !dbg !527
  %cond135 = select i1 %cmp133, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i64 0, i64 0), !dbg !527
  %call136 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.10, i64 0, i64 0), i8* %cond135), !dbg !529
  ret i32 0, !dbg !530
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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "conjugate-transpose.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Conjugate-transpose")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
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
!104 = !{!"if"}
!105 = !DILocation(line: 42, column: 29, scope: !100)
!106 = !DILocation(line: 42, column: 39, scope: !100)
!107 = !DILocation(line: 42, column: 34, scope: !100)
!108 = !DILocation(line: 42, column: 7, scope: !87)
!109 = !DILocation(line: 44, column: 14, scope: !110)
!110 = distinct !DILexicalBlock(scope: !111, file: !1, line: 44, column: 7)
!111 = distinct !DILexicalBlock(scope: !100, file: !1, line: 43, column: 5)
!112 = !DILocation(line: 44, column: 12, scope: !110)
!113 = !DILocation(line: 44, column: 19, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !1, line: 44, column: 7)
!115 = !DILocation(line: 44, column: 25, scope: !114)
!116 = !DILocation(line: 44, column: 21, scope: !114)
!117 = !DILocation(line: 44, column: 7, scope: !110)
!118 = !DILocation(line: 46, column: 18, scope: !119)
!119 = distinct !DILexicalBlock(scope: !120, file: !1, line: 46, column: 11)
!120 = distinct !DILexicalBlock(scope: !114, file: !1, line: 45, column: 9)
!121 = !DILocation(line: 46, column: 16, scope: !119)
!122 = !DILocation(line: 46, column: 23, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !1, line: 46, column: 11)
!124 = !DILocation(line: 46, column: 29, scope: !123)
!125 = !DILocation(line: 46, column: 25, scope: !123)
!126 = !DILocation(line: 46, column: 11, scope: !119)
!127 = !DILocation(line: 48, column: 21, scope: !128)
!128 = distinct !DILexicalBlock(scope: !129, file: !1, line: 48, column: 19)
!129 = distinct !DILexicalBlock(scope: !123, file: !1, line: 47, column: 13)
!130 = !DILocation(line: 48, column: 23, scope: !128)
!131 = !DILocation(line: 48, column: 19, scope: !128)
!132 = !DILocation(line: 48, column: 26, scope: !128)
!133 = !DILocation(line: 48, column: 34, scope: !128)
!134 = !DILocation(line: 48, column: 36, scope: !128)
!135 = !DILocation(line: 48, column: 32, scope: !128)
!136 = !DILocation(line: 48, column: 39, scope: !128)
!137 = !DILocation(line: 48, column: 29, scope: !128)
!138 = !DILocation(line: 48, column: 19, scope: !129)
!139 = !DILocation(line: 49, column: 17, scope: !128)
!140 = !DILocation(line: 50, column: 13, scope: !129)
!141 = !DILocation(line: 46, column: 36, scope: !123)
!142 = !DILocation(line: 46, column: 11, scope: !123)
!143 = distinct !{!143, !126, !144}
!144 = !DILocation(line: 50, column: 13, scope: !119)
!145 = !DILocation(line: 51, column: 9, scope: !120)
!146 = !DILocation(line: 44, column: 32, scope: !114)
!147 = !DILocation(line: 44, column: 7, scope: !114)
!148 = distinct !{!148, !117, !149}
!149 = !DILocation(line: 51, column: 9, scope: !110)
!150 = !DILocation(line: 52, column: 5, scope: !111)
!151 = !DILocation(line: 55, column: 5, scope: !100)
!152 = !DILocation(line: 57, column: 3, scope: !87)
!153 = !DILocation(line: 58, column: 1, scope: !87)
!154 = distinct !DISubprogram(name: "multiply", scope: !1, file: !1, line: 61, type: !155, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!155 = !DISubroutineType(types: !156)
!156 = !{!10, !10, !10}
!157 = !DILocalVariable(name: "a", arg: 1, scope: !154, file: !1, line: 61, type: !10)
!158 = !DILocation(line: 61, column: 18, scope: !154)
!159 = !DILocalVariable(name: "b", arg: 2, scope: !154, file: !1, line: 61, type: !10)
!160 = !DILocation(line: 61, column: 28, scope: !154)
!161 = !DILocalVariable(name: "c", scope: !154, file: !1, line: 63, type: !10)
!162 = !DILocation(line: 63, column: 10, scope: !154)
!163 = !DILocalVariable(name: "i", scope: !154, file: !1, line: 64, type: !14)
!164 = !DILocation(line: 64, column: 7, scope: !154)
!165 = !DILocalVariable(name: "j", scope: !154, file: !1, line: 64, type: !14)
!166 = !DILocation(line: 64, column: 10, scope: !154)
!167 = !DILocation(line: 66, column: 9, scope: !168)
!168 = distinct !DILexicalBlock(scope: !154, file: !1, line: 66, column: 7)
!169 = !DILocation(line: 66, column: 19, scope: !168)
!170 = !DILocation(line: 66, column: 14, scope: !168)
!171 = !DILocation(line: 66, column: 7, scope: !154)
!172 = !DILocation(line: 68, column: 18, scope: !173)
!173 = distinct !DILexicalBlock(scope: !168, file: !1, line: 67, column: 5)
!174 = !DILocation(line: 68, column: 9, scope: !173)
!175 = !DILocation(line: 68, column: 14, scope: !173)
!176 = !DILocation(line: 69, column: 18, scope: !173)
!177 = !DILocation(line: 69, column: 9, scope: !173)
!178 = !DILocation(line: 69, column: 14, scope: !173)
!179 = !DILocation(line: 71, column: 23, scope: !173)
!180 = !DILocation(line: 71, column: 21, scope: !173)
!181 = !DILocation(line: 71, column: 28, scope: !173)
!182 = !DILocation(line: 71, column: 13, scope: !173)
!183 = !DILocation(line: 71, column: 9, scope: !173)
!184 = !DILocation(line: 71, column: 11, scope: !173)
!185 = !DILocation(line: 73, column: 14, scope: !186)
!186 = distinct !DILexicalBlock(scope: !173, file: !1, line: 73, column: 7)
!187 = !DILocation(line: 73, column: 12, scope: !186)
!188 = !DILocation(line: 73, column: 19, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !1, line: 73, column: 7)
!190 = !DILocation(line: 73, column: 25, scope: !189)
!191 = !DILocation(line: 73, column: 21, scope: !189)
!192 = !DILocation(line: 73, column: 7, scope: !186)
!193 = !DILocation(line: 75, column: 30, scope: !194)
!194 = distinct !DILexicalBlock(scope: !189, file: !1, line: 74, column: 9)
!195 = !DILocation(line: 75, column: 28, scope: !194)
!196 = !DILocation(line: 75, column: 35, scope: !194)
!197 = !DILocation(line: 75, column: 20, scope: !194)
!198 = !DILocation(line: 75, column: 13, scope: !194)
!199 = !DILocation(line: 75, column: 15, scope: !194)
!200 = !DILocation(line: 75, column: 11, scope: !194)
!201 = !DILocation(line: 75, column: 18, scope: !194)
!202 = !DILocation(line: 76, column: 29, scope: !194)
!203 = !{!"branch_weights", i32 1, i32 1048575}
!204 = !DILocation(line: 76, column: 25, scope: !194)
!205 = !DILocation(line: 76, column: 23, scope: !194)
!206 = !DILocation(line: 76, column: 13, scope: !194)
!207 = !DILocation(line: 76, column: 15, scope: !194)
!208 = !DILocation(line: 76, column: 11, scope: !194)
!209 = !DILocation(line: 76, column: 18, scope: !194)
!210 = !DILocation(line: 76, column: 21, scope: !194)
!211 = !DILocation(line: 77, column: 18, scope: !212)
!212 = distinct !DILexicalBlock(scope: !194, file: !1, line: 77, column: 11)
!213 = !DILocation(line: 77, column: 16, scope: !212)
!214 = !DILocation(line: 77, column: 23, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !1, line: 77, column: 11)
!216 = !DILocation(line: 77, column: 29, scope: !215)
!217 = !DILocation(line: 77, column: 25, scope: !215)
!218 = !DILocation(line: 77, column: 11, scope: !212)
!219 = !DILocation(line: 79, column: 30, scope: !220)
!220 = distinct !DILexicalBlock(scope: !215, file: !1, line: 78, column: 13)
!221 = !DILocation(line: 79, column: 32, scope: !220)
!222 = !DILocation(line: 79, column: 28, scope: !220)
!223 = !DILocation(line: 79, column: 35, scope: !220)
!224 = !DILocation(line: 79, column: 42, scope: !220)
!225 = !DILocation(line: 79, column: 44, scope: !220)
!226 = !DILocation(line: 79, column: 40, scope: !220)
!227 = !DILocation(line: 79, column: 47, scope: !220)
!228 = !DILocation(line: 79, column: 38, scope: !220)
!229 = !DILocation(line: 79, column: 17, scope: !220)
!230 = !DILocation(line: 79, column: 19, scope: !220)
!231 = !DILocation(line: 79, column: 15, scope: !220)
!232 = !DILocation(line: 79, column: 22, scope: !220)
!233 = !DILocation(line: 79, column: 25, scope: !220)
!234 = !DILocation(line: 80, column: 13, scope: !220)
!235 = !DILocation(line: 77, column: 36, scope: !215)
!236 = !DILocation(line: 77, column: 11, scope: !215)
!237 = distinct !{!237, !218, !238}
!238 = !DILocation(line: 80, column: 13, scope: !212)
!239 = !DILocation(line: 81, column: 9, scope: !194)
!240 = !DILocation(line: 73, column: 32, scope: !189)
!241 = !DILocation(line: 73, column: 7, scope: !189)
!242 = distinct !{!242, !192, !243}
!243 = !DILocation(line: 81, column: 9, scope: !186)
!244 = !DILocation(line: 83, column: 5, scope: !173)
!245 = !DILocation(line: 85, column: 3, scope: !154)
!246 = distinct !DISubprogram(name: "isNormal", scope: !1, file: !1, line: 89, type: !88, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!247 = !DILocalVariable(name: "a", arg: 1, scope: !246, file: !1, line: 89, type: !10)
!248 = !DILocation(line: 89, column: 18, scope: !246)
!249 = !DILocalVariable(name: "i", scope: !246, file: !1, line: 91, type: !14)
!250 = !DILocation(line: 91, column: 7, scope: !246)
!251 = !DILocalVariable(name: "j", scope: !246, file: !1, line: 91, type: !14)
!252 = !DILocation(line: 91, column: 10, scope: !246)
!253 = !DILocalVariable(name: "a_ah", scope: !246, file: !1, line: 92, type: !10)
!254 = !DILocation(line: 92, column: 10, scope: !246)
!255 = !DILocalVariable(name: "ah_a", scope: !246, file: !1, line: 92, type: !10)
!256 = !DILocation(line: 92, column: 16, scope: !246)
!257 = !DILocation(line: 94, column: 9, scope: !258)
!258 = distinct !DILexicalBlock(scope: !246, file: !1, line: 94, column: 7)
!259 = !DILocation(line: 94, column: 19, scope: !258)
!260 = !DILocation(line: 94, column: 14, scope: !258)
!261 = !DILocation(line: 94, column: 7, scope: !246)
!262 = !DILocation(line: 95, column: 5, scope: !258)
!263 = !DILocation(line: 97, column: 23, scope: !246)
!264 = !DILocation(line: 97, column: 10, scope: !246)
!265 = !DILocation(line: 98, column: 20, scope: !246)
!266 = !DILocation(line: 98, column: 10, scope: !246)
!267 = !DILocation(line: 100, column: 10, scope: !268)
!268 = distinct !DILexicalBlock(scope: !246, file: !1, line: 100, column: 3)
!269 = !DILocation(line: 100, column: 8, scope: !268)
!270 = !DILocation(line: 100, column: 15, scope: !271)
!271 = distinct !DILexicalBlock(scope: !268, file: !1, line: 100, column: 3)
!272 = !DILocation(line: 100, column: 21, scope: !271)
!273 = !DILocation(line: 100, column: 17, scope: !271)
!274 = !DILocation(line: 100, column: 3, scope: !268)
!275 = !DILocation(line: 102, column: 14, scope: !276)
!276 = distinct !DILexicalBlock(scope: !277, file: !1, line: 102, column: 7)
!277 = distinct !DILexicalBlock(scope: !271, file: !1, line: 101, column: 5)
!278 = !DILocation(line: 102, column: 12, scope: !276)
!279 = !DILocation(line: 102, column: 19, scope: !280)
!280 = distinct !DILexicalBlock(scope: !276, file: !1, line: 102, column: 7)
!281 = !DILocation(line: 102, column: 25, scope: !280)
!282 = !DILocation(line: 102, column: 21, scope: !280)
!283 = !DILocation(line: 102, column: 7, scope: !276)
!284 = !DILocation(line: 104, column: 20, scope: !285)
!285 = distinct !DILexicalBlock(scope: !286, file: !1, line: 104, column: 15)
!286 = distinct !DILexicalBlock(scope: !280, file: !1, line: 103, column: 9)
!287 = !DILocation(line: 104, column: 22, scope: !285)
!288 = !DILocation(line: 104, column: 15, scope: !285)
!289 = !DILocation(line: 104, column: 25, scope: !285)
!290 = !DILocation(line: 104, column: 36, scope: !285)
!291 = !DILocation(line: 104, column: 38, scope: !285)
!292 = !DILocation(line: 104, column: 31, scope: !285)
!293 = !DILocation(line: 104, column: 41, scope: !285)
!294 = !DILocation(line: 104, column: 28, scope: !285)
!295 = !DILocation(line: 104, column: 15, scope: !286)
!296 = !DILocation(line: 105, column: 13, scope: !285)
!297 = !DILocation(line: 106, column: 9, scope: !286)
!298 = !DILocation(line: 102, column: 32, scope: !280)
!299 = !DILocation(line: 102, column: 7, scope: !280)
!300 = distinct !{!300, !283, !301}
!301 = !DILocation(line: 106, column: 9, scope: !276)
!302 = !DILocation(line: 107, column: 5, scope: !277)
!303 = !DILocation(line: 100, column: 28, scope: !271)
!304 = !DILocation(line: 100, column: 3, scope: !271)
!305 = distinct !{!305, !274, !306}
!306 = !DILocation(line: 107, column: 5, scope: !268)
!307 = !DILocation(line: 109, column: 3, scope: !246)
!308 = !DILocation(line: 110, column: 1, scope: !246)
!309 = distinct !DISubprogram(name: "isUnitary", scope: !1, file: !1, line: 113, type: !88, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!310 = !DILocalVariable(name: "a", arg: 1, scope: !309, file: !1, line: 113, type: !10)
!311 = !DILocation(line: 113, column: 19, scope: !309)
!312 = !DILocalVariable(name: "b", scope: !309, file: !1, line: 115, type: !10)
!313 = !DILocation(line: 115, column: 10, scope: !309)
!314 = !DILocalVariable(name: "i", scope: !309, file: !1, line: 116, type: !14)
!315 = !DILocation(line: 116, column: 7, scope: !309)
!316 = !DILocalVariable(name: "j", scope: !309, file: !1, line: 116, type: !14)
!317 = !DILocation(line: 116, column: 10, scope: !309)
!318 = !DILocation(line: 117, column: 7, scope: !319)
!319 = distinct !DILexicalBlock(scope: !309, file: !1, line: 117, column: 7)
!320 = !DILocation(line: 117, column: 20, scope: !319)
!321 = !DILocation(line: 117, column: 7, scope: !309)
!322 = !DILocation(line: 119, column: 24, scope: !323)
!323 = distinct !DILexicalBlock(scope: !319, file: !1, line: 118, column: 5)
!324 = !DILocation(line: 119, column: 11, scope: !323)
!325 = !DILocation(line: 121, column: 14, scope: !326)
!326 = distinct !DILexicalBlock(scope: !323, file: !1, line: 121, column: 7)
!327 = !DILocation(line: 121, column: 12, scope: !326)
!328 = !DILocation(line: 121, column: 19, scope: !329)
!329 = distinct !DILexicalBlock(scope: !326, file: !1, line: 121, column: 7)
!330 = !DILocation(line: 121, column: 25, scope: !329)
!331 = !DILocation(line: 121, column: 21, scope: !329)
!332 = !DILocation(line: 121, column: 7, scope: !326)
!333 = !DILocation(line: 123, column: 18, scope: !334)
!334 = distinct !DILexicalBlock(scope: !335, file: !1, line: 123, column: 11)
!335 = distinct !DILexicalBlock(scope: !329, file: !1, line: 122, column: 9)
!336 = !DILocation(line: 123, column: 16, scope: !334)
!337 = !DILocation(line: 123, column: 23, scope: !338)
!338 = distinct !DILexicalBlock(scope: !334, file: !1, line: 123, column: 11)
!339 = !DILocation(line: 123, column: 29, scope: !338)
!340 = !DILocation(line: 123, column: 25, scope: !338)
!341 = !DILocation(line: 123, column: 11, scope: !334)
!342 = !DILocation(line: 125, column: 20, scope: !343)
!343 = distinct !DILexicalBlock(scope: !344, file: !1, line: 125, column: 19)
!344 = distinct !DILexicalBlock(scope: !338, file: !1, line: 124, column: 13)
!345 = !DILocation(line: 125, column: 25, scope: !343)
!346 = !DILocation(line: 125, column: 22, scope: !343)
!347 = !DILocation(line: 125, column: 27, scope: !343)
!348 = !DILocation(line: 125, column: 32, scope: !343)
!349 = !DILocation(line: 125, column: 34, scope: !343)
!350 = !DILocation(line: 125, column: 30, scope: !343)
!351 = !DILocation(line: 125, column: 37, scope: !343)
!352 = !DILocation(line: 125, column: 40, scope: !343)
!353 = !DILocation(line: 125, column: 46, scope: !343)
!354 = !DILocation(line: 125, column: 50, scope: !343)
!355 = !DILocation(line: 125, column: 55, scope: !343)
!356 = !DILocation(line: 125, column: 52, scope: !343)
!357 = !DILocation(line: 125, column: 57, scope: !343)
!358 = !DILocation(line: 125, column: 62, scope: !343)
!359 = !DILocation(line: 125, column: 64, scope: !343)
!360 = !DILocation(line: 125, column: 60, scope: !343)
!361 = !DILocation(line: 125, column: 67, scope: !343)
!362 = !DILocation(line: 125, column: 70, scope: !343)
!363 = !DILocation(line: 125, column: 19, scope: !344)
!364 = !DILocation(line: 126, column: 17, scope: !343)
!365 = !DILocation(line: 127, column: 13, scope: !344)
!366 = !DILocation(line: 123, column: 36, scope: !338)
!367 = !DILocation(line: 123, column: 11, scope: !338)
!368 = distinct !{!368, !341, !369}
!369 = !DILocation(line: 127, column: 13, scope: !334)
!370 = !DILocation(line: 128, column: 9, scope: !335)
!371 = !DILocation(line: 121, column: 32, scope: !329)
!372 = !DILocation(line: 121, column: 7, scope: !329)
!373 = distinct !{!373, !332, !374}
!374 = !DILocation(line: 128, column: 9, scope: !326)
!375 = !DILocation(line: 129, column: 7, scope: !323)
!376 = !DILocation(line: 131, column: 3, scope: !309)
!377 = !DILocation(line: 132, column: 1, scope: !309)
!378 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 136, type: !379, scopeLine: 137, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!379 = !DISubroutineType(types: !380)
!380 = !{!14}
!381 = !DILocalVariable(name: "z", scope: !378, file: !1, line: 138, type: !19)
!382 = !DILocation(line: 138, column: 11, scope: !378)
!383 = !DILocation(line: 138, column: 21, scope: !378)
!384 = !DILocation(line: 138, column: 17, scope: !378)
!385 = !DILocation(line: 138, column: 15, scope: !378)
!386 = !DILocalVariable(name: "a", scope: !378, file: !1, line: 139, type: !10)
!387 = !DILocation(line: 139, column: 10, scope: !378)
!388 = !DILocalVariable(name: "aT", scope: !378, file: !1, line: 139, type: !10)
!389 = !DILocation(line: 139, column: 13, scope: !378)
!390 = !DILocalVariable(name: "i", scope: !378, file: !1, line: 140, type: !14)
!391 = !DILocation(line: 140, column: 7, scope: !378)
!392 = !DILocalVariable(name: "j", scope: !378, file: !1, line: 140, type: !14)
!393 = !DILocation(line: 140, column: 10, scope: !378)
!394 = !DILocation(line: 141, column: 3, scope: !378)
!395 = !DILocation(line: 142, column: 21, scope: !378)
!396 = !DILocation(line: 142, column: 30, scope: !378)
!397 = !DILocation(line: 142, column: 3, scope: !378)
!398 = !DILocation(line: 144, column: 19, scope: !378)
!399 = !DILocation(line: 144, column: 17, scope: !378)
!400 = !DILocation(line: 144, column: 24, scope: !378)
!401 = !DILocation(line: 144, column: 9, scope: !378)
!402 = !DILocation(line: 144, column: 5, scope: !378)
!403 = !DILocation(line: 144, column: 7, scope: !378)
!404 = !DILocation(line: 145, column: 3, scope: !378)
!405 = !DILocation(line: 146, column: 10, scope: !406)
!406 = distinct !DILexicalBlock(scope: !378, file: !1, line: 146, column: 3)
!407 = !DILocation(line: 146, column: 8, scope: !406)
!408 = !DILocation(line: 146, column: 15, scope: !409)
!409 = distinct !DILexicalBlock(scope: !406, file: !1, line: 146, column: 3)
!410 = !DILocation(line: 146, column: 21, scope: !409)
!411 = !DILocation(line: 146, column: 17, scope: !409)
!412 = !DILocation(line: 146, column: 3, scope: !406)
!413 = !DILocation(line: 148, column: 7, scope: !414)
!414 = distinct !DILexicalBlock(scope: !409, file: !1, line: 147, column: 5)
!415 = !DILocation(line: 149, column: 26, scope: !414)
!416 = !DILocation(line: 149, column: 24, scope: !414)
!417 = !DILocation(line: 149, column: 31, scope: !414)
!418 = !DILocation(line: 149, column: 16, scope: !414)
!419 = !DILocation(line: 149, column: 9, scope: !414)
!420 = !DILocation(line: 149, column: 11, scope: !414)
!421 = !DILocation(line: 149, column: 7, scope: !414)
!422 = !DILocation(line: 149, column: 14, scope: !414)
!423 = !DILocation(line: 150, column: 14, scope: !424)
!424 = distinct !DILexicalBlock(scope: !414, file: !1, line: 150, column: 7)
!425 = !DILocation(line: 150, column: 12, scope: !424)
!426 = !DILocation(line: 150, column: 19, scope: !427)
!427 = distinct !DILexicalBlock(scope: !424, file: !1, line: 150, column: 7)
!428 = !DILocation(line: 150, column: 25, scope: !427)
!429 = !DILocation(line: 150, column: 21, scope: !427)
!430 = !DILocation(line: 150, column: 7, scope: !424)
!431 = !DILocation(line: 152, column: 23, scope: !432)
!432 = distinct !DILexicalBlock(scope: !427, file: !1, line: 151, column: 9)
!433 = !DILocation(line: 152, column: 31, scope: !432)
!434 = !DILocation(line: 152, column: 38, scope: !432)
!435 = !DILocation(line: 152, column: 46, scope: !432)
!436 = !DILocation(line: 152, column: 51, scope: !432)
!437 = !DILocation(line: 152, column: 36, scope: !432)
!438 = !DILocation(line: 152, column: 13, scope: !432)
!439 = !DILocation(line: 152, column: 15, scope: !432)
!440 = !DILocation(line: 152, column: 11, scope: !432)
!441 = !DILocation(line: 152, column: 18, scope: !432)
!442 = !DILocation(line: 152, column: 21, scope: !432)
!443 = !DILocation(line: 153, column: 42, scope: !432)
!444 = !DILocation(line: 153, column: 44, scope: !432)
!445 = !DILocation(line: 153, column: 40, scope: !432)
!446 = !DILocation(line: 153, column: 47, scope: !432)
!447 = !DILocation(line: 153, column: 61, scope: !432)
!448 = !DILocation(line: 153, column: 63, scope: !432)
!449 = !DILocation(line: 153, column: 59, scope: !432)
!450 = !DILocation(line: 153, column: 66, scope: !432)
!451 = !DILocation(line: 153, column: 11, scope: !432)
!452 = !DILocation(line: 154, column: 9, scope: !432)
!453 = !DILocation(line: 150, column: 32, scope: !427)
!454 = !DILocation(line: 150, column: 7, scope: !427)
!455 = distinct !{!455, !430, !456}
!456 = !DILocation(line: 154, column: 9, scope: !424)
!457 = !DILocation(line: 155, column: 5, scope: !414)
!458 = !DILocation(line: 146, column: 28, scope: !409)
!459 = !DILocation(line: 146, column: 3, scope: !409)
!460 = distinct !{!460, !412, !461}
!461 = !DILocation(line: 155, column: 5, scope: !406)
!462 = !DILocation(line: 157, column: 8, scope: !378)
!463 = !DILocation(line: 159, column: 3, scope: !378)
!464 = !DILocation(line: 160, column: 10, scope: !465)
!465 = distinct !DILexicalBlock(scope: !378, file: !1, line: 160, column: 3)
!466 = !DILocation(line: 160, column: 8, scope: !465)
!467 = !DILocation(line: 160, column: 15, scope: !468)
!468 = distinct !DILexicalBlock(scope: !465, file: !1, line: 160, column: 3)
!469 = !DILocation(line: 160, column: 22, scope: !468)
!470 = !DILocation(line: 160, column: 17, scope: !468)
!471 = !DILocation(line: 160, column: 3, scope: !465)
!472 = !DILocation(line: 162, column: 7, scope: !473)
!473 = distinct !DILexicalBlock(scope: !468, file: !1, line: 161, column: 5)
!474 = !DILocation(line: 163, column: 28, scope: !473)
!475 = !DILocation(line: 163, column: 25, scope: !473)
!476 = !DILocation(line: 163, column: 33, scope: !473)
!477 = !DILocation(line: 163, column: 17, scope: !473)
!478 = !DILocation(line: 163, column: 10, scope: !473)
!479 = !DILocation(line: 163, column: 12, scope: !473)
!480 = !DILocation(line: 163, column: 7, scope: !473)
!481 = !DILocation(line: 163, column: 15, scope: !473)
!482 = !DILocation(line: 164, column: 14, scope: !483)
!483 = distinct !DILexicalBlock(scope: !473, file: !1, line: 164, column: 7)
!484 = !DILocation(line: 164, column: 12, scope: !483)
!485 = !DILocation(line: 164, column: 19, scope: !486)
!486 = distinct !DILexicalBlock(scope: !483, file: !1, line: 164, column: 7)
!487 = !DILocation(line: 164, column: 26, scope: !486)
!488 = !DILocation(line: 164, column: 21, scope: !486)
!489 = !DILocation(line: 164, column: 7, scope: !483)
!490 = !DILocation(line: 166, column: 24, scope: !491)
!491 = distinct !DILexicalBlock(scope: !486, file: !1, line: 165, column: 9)
!492 = !DILocation(line: 166, column: 32, scope: !491)
!493 = !DILocation(line: 166, column: 39, scope: !491)
!494 = !DILocation(line: 166, column: 47, scope: !491)
!495 = !DILocation(line: 166, column: 52, scope: !491)
!496 = !DILocation(line: 166, column: 37, scope: !491)
!497 = !DILocation(line: 166, column: 14, scope: !491)
!498 = !DILocation(line: 166, column: 16, scope: !491)
!499 = !DILocation(line: 166, column: 11, scope: !491)
!500 = !DILocation(line: 166, column: 19, scope: !491)
!501 = !DILocation(line: 166, column: 22, scope: !491)
!502 = !DILocation(line: 167, column: 43, scope: !491)
!503 = !DILocation(line: 167, column: 45, scope: !491)
!504 = !DILocation(line: 167, column: 40, scope: !491)
!505 = !DILocation(line: 167, column: 48, scope: !491)
!506 = !DILocation(line: 167, column: 63, scope: !491)
!507 = !DILocation(line: 167, column: 65, scope: !491)
!508 = !DILocation(line: 167, column: 60, scope: !491)
!509 = !DILocation(line: 167, column: 68, scope: !491)
!510 = !DILocation(line: 167, column: 11, scope: !491)
!511 = !DILocation(line: 168, column: 9, scope: !491)
!512 = !DILocation(line: 164, column: 33, scope: !486)
!513 = !DILocation(line: 164, column: 7, scope: !486)
!514 = distinct !{!514, !489, !515}
!515 = !DILocation(line: 168, column: 9, scope: !483)
!516 = !DILocation(line: 169, column: 5, scope: !473)
!517 = !DILocation(line: 160, column: 29, scope: !468)
!518 = !DILocation(line: 160, column: 3, scope: !468)
!519 = distinct !{!519, !471, !520}
!520 = !DILocation(line: 169, column: 5, scope: !465)
!521 = !DILocation(line: 172, column: 11, scope: !378)
!522 = !DILocation(line: 172, column: 27, scope: !378)
!523 = !DILocation(line: 171, column: 3, scope: !378)
!524 = !DILocation(line: 174, column: 11, scope: !378)
!525 = !DILocation(line: 174, column: 25, scope: !378)
!526 = !DILocation(line: 173, column: 3, scope: !378)
!527 = !DILocation(line: 176, column: 11, scope: !378)
!528 = !DILocation(line: 176, column: 24, scope: !378)
!529 = !DILocation(line: 175, column: 3, scope: !378)
!530 = !DILocation(line: 180, column: 3, scope: !378)
