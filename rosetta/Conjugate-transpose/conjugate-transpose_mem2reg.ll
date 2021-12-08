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
  %0 = bitcast %struct.matrix* %a to { i64, { double, double }** }*
  %1 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %0, i32 0, i32 0
  store i64 %a.coerce0, i64* %1, align 8
  %2 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %0, i32 0, i32 1
  store { double, double }** %a.coerce1, { double, double }*** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.matrix* %a, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %struct.matrix* %retval, metadata !22, metadata !DIExpression()), !dbg !23
  %cols = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !24
  %3 = load i32, i32* %cols, align 4, !dbg !24
  %rows = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 0, !dbg !25
  store i32 %3, i32* %rows, align 8, !dbg !26
  %rows1 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !27
  %4 = load i32, i32* %rows1, align 8, !dbg !27
  %cols2 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 1, !dbg !28
  store i32 %4, i32* %cols2, align 4, !dbg !29
  %rows3 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 0, !dbg !30
  %5 = load i32, i32* %rows3, align 8, !dbg !30
  %conv = sext i32 %5 to i64, !dbg !31
  %mul = mul i64 %conv, 8, !dbg !32
  %call = call noalias i8* @malloc(i64 %mul) #6, !dbg !33
  %6 = bitcast i8* %call to { double, double }**, !dbg !33
  %z = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 2, !dbg !34
  store { double, double }** %6, { double, double }*** %z, align 8, !dbg !35
  call void @llvm.dbg.value(metadata i32 0, metadata !36, metadata !DIExpression()), !dbg !37
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc26, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc27, %for.inc26 ], !dbg !40
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !36, metadata !DIExpression()), !dbg !37
  %rows4 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 0, !dbg !41
  %7 = load i32, i32* %rows4, align 8, !dbg !41
  %cmp = icmp slt i32 %i.0, %7, !dbg !43
  br i1 %cmp, label %for.body, label %for.end28, !dbg !44

for.body:                                         ; preds = %for.cond
  %cols6 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 1, !dbg !45
  %8 = load i32, i32* %cols6, align 4, !dbg !45
  %conv7 = sext i32 %8 to i64, !dbg !47
  %mul8 = mul i64 %conv7, 16, !dbg !48
  %call9 = call noalias i8* @malloc(i64 %mul8) #6, !dbg !49
  %9 = bitcast i8* %call9 to { double, double }*, !dbg !49
  %z10 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 2, !dbg !50
  %10 = load { double, double }**, { double, double }*** %z10, align 8, !dbg !50
  %idxprom = sext i32 %i.0 to i64, !dbg !51
  %arrayidx = getelementptr inbounds { double, double }*, { double, double }** %10, i64 %idxprom, !dbg !51
  store { double, double }* %9, { double, double }** %arrayidx, align 8, !dbg !52
  call void @llvm.dbg.value(metadata i32 0, metadata !53, metadata !DIExpression()), !dbg !37
  br label %for.cond11, !dbg !54

for.cond11:                                       ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !56
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !53, metadata !DIExpression()), !dbg !37
  %cols12 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 1, !dbg !57
  %11 = load i32, i32* %cols12, align 4, !dbg !57
  %cmp13 = icmp slt i32 %j.0, %11, !dbg !59
  br i1 %cmp13, label %for.body15, label %for.end, !dbg !60

for.body15:                                       ; preds = %for.cond11
  %z16 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !61
  %12 = load { double, double }**, { double, double }*** %z16, align 8, !dbg !61
  %idxprom17 = sext i32 %j.0 to i64, !dbg !63
  %arrayidx18 = getelementptr inbounds { double, double }*, { double, double }** %12, i64 %idxprom17, !dbg !63
  %13 = load { double, double }*, { double, double }** %arrayidx18, align 8, !dbg !63
  %idxprom19 = sext i32 %i.0 to i64, !dbg !63
  %arrayidx20 = getelementptr inbounds { double, double }, { double, double }* %13, i64 %idxprom19, !dbg !63
  %arrayidx20.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx20, i32 0, i32 0, !dbg !63
  %arrayidx20.real = load double, double* %arrayidx20.realp, align 8, !dbg !63
  %arrayidx20.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx20, i32 0, i32 1, !dbg !63
  %arrayidx20.imag = load double, double* %arrayidx20.imagp, align 8, !dbg !63
  %neg = fneg double %arrayidx20.imag, !dbg !64
  %z21 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 2, !dbg !65
  %14 = load { double, double }**, { double, double }*** %z21, align 8, !dbg !65
  %idxprom22 = sext i32 %i.0 to i64, !dbg !66
  %arrayidx23 = getelementptr inbounds { double, double }*, { double, double }** %14, i64 %idxprom22, !dbg !66
  %15 = load { double, double }*, { double, double }** %arrayidx23, align 8, !dbg !66
  %idxprom24 = sext i32 %j.0 to i64, !dbg !66
  %arrayidx25 = getelementptr inbounds { double, double }, { double, double }* %15, i64 %idxprom24, !dbg !66
  %arrayidx25.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx25, i32 0, i32 0, !dbg !67
  %arrayidx25.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx25, i32 0, i32 1, !dbg !67
  store double %arrayidx20.real, double* %arrayidx25.realp, align 8, !dbg !67
  store double %neg, double* %arrayidx25.imagp, align 8, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body15
  %inc = add nsw i32 %j.0, 1, !dbg !69
  call void @llvm.dbg.value(metadata i32 %inc, metadata !53, metadata !DIExpression()), !dbg !37
  br label %for.cond11, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond11
  br label %for.inc26, !dbg !73

for.inc26:                                        ; preds = %for.end
  %inc27 = add nsw i32 %i.0, 1, !dbg !74
  call void @llvm.dbg.value(metadata i32 %inc27, metadata !36, metadata !DIExpression()), !dbg !37
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end28:                                        ; preds = %for.cond
  %16 = bitcast %struct.matrix* %retval to { i64, { double, double }** }*, !dbg !78
  %17 = load { i64, { double, double }** }, { i64, { double, double }** }* %16, align 8, !dbg !78
  ret { i64, { double, double }** } %17, !dbg !78
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @isHermitian(i64 %a.coerce0, { double, double }** %a.coerce1) #0 !dbg !79 {
entry:
  %a = alloca %struct.matrix, align 8
  %b = alloca %struct.matrix, align 8
  %0 = bitcast %struct.matrix* %a to { i64, { double, double }** }*
  %1 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %0, i32 0, i32 0
  store i64 %a.coerce0, i64* %1, align 8
  %2 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %0, i32 0, i32 1
  store { double, double }** %a.coerce1, { double, double }*** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.matrix* %a, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata %struct.matrix* %b, metadata !84, metadata !DIExpression()), !dbg !85
  %3 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !86
  %4 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %3, i32 0, i32 0, !dbg !86
  %5 = load i64, i64* %4, align 8, !dbg !86
  %6 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %3, i32 0, i32 1, !dbg !86
  %7 = load { double, double }**, { double, double }*** %6, align 8, !dbg !86
  %call = call { i64, { double, double }** } @transpose(i64 %5, { double, double }** %7), !dbg !86
  %8 = bitcast %struct.matrix* %b to { i64, { double, double }** }*, !dbg !86
  %9 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %8, i32 0, i32 0, !dbg !86
  %10 = extractvalue { i64, { double, double }** } %call, 0, !dbg !86
  store i64 %10, i64* %9, align 8, !dbg !86
  %11 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %8, i32 0, i32 1, !dbg !86
  %12 = extractvalue { i64, { double, double }** } %call, 1, !dbg !86
  store { double, double }** %12, { double, double }*** %11, align 8, !dbg !86
  %rows = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 0, !dbg !87
  %13 = load i32, i32* %rows, align 8, !dbg !87
  %rows1 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !89
  %14 = load i32, i32* %rows1, align 8, !dbg !89
  %cmp = icmp eq i32 %13, %14, !dbg !90
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !91

land.lhs.true:                                    ; preds = %entry
  %cols = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 1, !dbg !92
  %15 = load i32, i32* %cols, align 4, !dbg !92
  %cols2 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !93
  %16 = load i32, i32* %cols2, align 4, !dbg !93
  %cmp3 = icmp eq i32 %15, %16, !dbg !94
  br i1 %cmp3, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %land.lhs.true
  call void @llvm.dbg.value(metadata i32 0, metadata !96, metadata !DIExpression()), !dbg !97
  br label %for.cond, !dbg !98

for.cond:                                         ; preds = %for.inc18, %if.then
  %i.0 = phi i32 [ 0, %if.then ], [ %inc19, %for.inc18 ], !dbg !101
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !96, metadata !DIExpression()), !dbg !97
  %rows4 = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 0, !dbg !102
  %17 = load i32, i32* %rows4, align 8, !dbg !102
  %cmp5 = icmp slt i32 %i.0, %17, !dbg !104
  br i1 %cmp5, label %for.body, label %for.end20, !dbg !105

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !106, metadata !DIExpression()), !dbg !97
  br label %for.cond6, !dbg !107

for.cond6:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !110
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !106, metadata !DIExpression()), !dbg !97
  %cols7 = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 1, !dbg !111
  %18 = load i32, i32* %cols7, align 4, !dbg !111
  %cmp8 = icmp slt i32 %j.0, %18, !dbg !113
  br i1 %cmp8, label %for.body9, label %for.end, !dbg !114

for.body9:                                        ; preds = %for.cond6
  %z = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 2, !dbg !115
  %19 = load { double, double }**, { double, double }*** %z, align 8, !dbg !115
  %idxprom = sext i32 %i.0 to i64, !dbg !118
  %arrayidx = getelementptr inbounds { double, double }*, { double, double }** %19, i64 %idxprom, !dbg !118
  %20 = load { double, double }*, { double, double }** %arrayidx, align 8, !dbg !118
  %idxprom10 = sext i32 %j.0 to i64, !dbg !118
  %arrayidx11 = getelementptr inbounds { double, double }, { double, double }* %20, i64 %idxprom10, !dbg !118
  %arrayidx11.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx11, i32 0, i32 0, !dbg !118
  %arrayidx11.real = load double, double* %arrayidx11.realp, align 8, !dbg !118
  %arrayidx11.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx11, i32 0, i32 1, !dbg !118
  %arrayidx11.imag = load double, double* %arrayidx11.imagp, align 8, !dbg !118
  %z12 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !119
  %21 = load { double, double }**, { double, double }*** %z12, align 8, !dbg !119
  %idxprom13 = sext i32 %i.0 to i64, !dbg !120
  %arrayidx14 = getelementptr inbounds { double, double }*, { double, double }** %21, i64 %idxprom13, !dbg !120
  %22 = load { double, double }*, { double, double }** %arrayidx14, align 8, !dbg !120
  %idxprom15 = sext i32 %j.0 to i64, !dbg !120
  %arrayidx16 = getelementptr inbounds { double, double }, { double, double }* %22, i64 %idxprom15, !dbg !120
  %arrayidx16.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx16, i32 0, i32 0, !dbg !120
  %arrayidx16.real = load double, double* %arrayidx16.realp, align 8, !dbg !120
  %arrayidx16.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx16, i32 0, i32 1, !dbg !120
  %arrayidx16.imag = load double, double* %arrayidx16.imagp, align 8, !dbg !120
  %cmp.r = fcmp une double %arrayidx11.real, %arrayidx16.real, !dbg !121
  %cmp.i = fcmp une double %arrayidx11.imag, %arrayidx16.imag, !dbg !121
  %or.ri = or i1 %cmp.r, %cmp.i, !dbg !121
  br i1 %or.ri, label %if.then17, label %if.end, !dbg !122

if.then17:                                        ; preds = %for.body9
  br label %return, !dbg !123

if.end:                                           ; preds = %for.body9
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %j.0, 1, !dbg !125
  call void @llvm.dbg.value(metadata i32 %inc, metadata !106, metadata !DIExpression()), !dbg !97
  br label %for.cond6, !dbg !126, !llvm.loop !127

for.end:                                          ; preds = %for.cond6
  br label %for.inc18, !dbg !129

for.inc18:                                        ; preds = %for.end
  %inc19 = add nsw i32 %i.0, 1, !dbg !130
  call void @llvm.dbg.value(metadata i32 %inc19, metadata !96, metadata !DIExpression()), !dbg !97
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end20:                                        ; preds = %for.cond
  br label %if.end21, !dbg !134

if.else:                                          ; preds = %land.lhs.true, %entry
  br label %return, !dbg !135

if.end21:                                         ; preds = %for.end20
  br label %return, !dbg !136

return:                                           ; preds = %if.end21, %if.else, %if.then17
  %retval.0 = phi i32 [ 0, %if.then17 ], [ 1, %if.end21 ], [ 0, %if.else ], !dbg !97
  ret i32 %retval.0, !dbg !137
}

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, { double, double }** } @multiply(i64 %a.coerce0, { double, double }** %a.coerce1, i64 %b.coerce0, { double, double }** %b.coerce1) #3 !dbg !138 {
entry:
  %retval = alloca %struct.matrix, align 8
  %a = alloca %struct.matrix, align 8
  %b = alloca %struct.matrix, align 8
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
  call void @llvm.dbg.declare(metadata %struct.matrix* %a, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata %struct.matrix* %b, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata %struct.matrix* %retval, metadata !145, metadata !DIExpression()), !dbg !146
  %cols = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !147
  %6 = load i32, i32* %cols, align 4, !dbg !147
  %rows = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 0, !dbg !149
  %7 = load i32, i32* %rows, align 8, !dbg !149
  %cmp = icmp eq i32 %6, %7, !dbg !150
  br i1 %cmp, label %if.then, label %if.end, !dbg !151

if.then:                                          ; preds = %entry
  %rows1 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !152
  %8 = load i32, i32* %rows1, align 8, !dbg !152
  %rows2 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 0, !dbg !154
  store i32 %8, i32* %rows2, align 8, !dbg !155
  %cols3 = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 1, !dbg !156
  %9 = load i32, i32* %cols3, align 4, !dbg !156
  %cols4 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 1, !dbg !157
  store i32 %9, i32* %cols4, align 4, !dbg !158
  %rows5 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 0, !dbg !159
  %10 = load i32, i32* %rows5, align 8, !dbg !159
  %conv = sext i32 %10 to i64, !dbg !160
  %mul = mul i64 %conv, 8, !dbg !161
  %call = call noalias i8* @malloc(i64 %mul) #6, !dbg !162
  %11 = bitcast i8* %call to { double, double }**, !dbg !162
  %z = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 2, !dbg !163
  store { double, double }** %11, { double, double }*** %z, align 8, !dbg !164
  call void @llvm.dbg.value(metadata i32 0, metadata !165, metadata !DIExpression()), !dbg !166
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc53, %if.then
  %j.0 = phi i32 [ undef, %if.then ], [ %j.1, %for.inc53 ]
  %i.0 = phi i32 [ 0, %if.then ], [ %inc54, %for.inc53 ], !dbg !169
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !165, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !170, metadata !DIExpression()), !dbg !166
  %rows6 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 0, !dbg !171
  %12 = load i32, i32* %rows6, align 8, !dbg !171
  %cmp7 = icmp slt i32 %i.0, %12, !dbg !173
  br i1 %cmp7, label %for.body, label %for.end55, !dbg !174

for.body:                                         ; preds = %for.cond
  %cols9 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 1, !dbg !175
  %13 = load i32, i32* %cols9, align 4, !dbg !175
  %conv10 = sext i32 %13 to i64, !dbg !177
  %mul11 = mul i64 %conv10, 16, !dbg !178
  %call12 = call noalias i8* @malloc(i64 %mul11) #6, !dbg !179
  %14 = bitcast i8* %call12 to { double, double }*, !dbg !179
  %z13 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 2, !dbg !180
  %15 = load { double, double }**, { double, double }*** %z13, align 8, !dbg !180
  %idxprom = sext i32 %i.0 to i64, !dbg !181
  %arrayidx = getelementptr inbounds { double, double }*, { double, double }** %15, i64 %idxprom, !dbg !181
  store { double, double }* %14, { double, double }** %arrayidx, align 8, !dbg !182
  br i1 false, label %complex_mul_imag_nan, label %complex_mul_cont, !dbg !183, !prof !184

complex_mul_imag_nan:                             ; preds = %for.body
  br i1 false, label %complex_mul_libcall, label %complex_mul_cont, !dbg !183, !prof !184

complex_mul_libcall:                              ; preds = %complex_mul_imag_nan
  %call14 = call <2 x float> @__mulsc3(float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 1.000000e+00) #6, !dbg !183
  %16 = bitcast { float, float }* %coerce to <2 x float>*, !dbg !183
  store <2 x float> %call14, <2 x float>* %16, align 4, !dbg !183
  %coerce.realp = getelementptr inbounds { float, float }, { float, float }* %coerce, i32 0, i32 0, !dbg !183
  %coerce.real = load float, float* %coerce.realp, align 4, !dbg !183
  %coerce.imagp = getelementptr inbounds { float, float }, { float, float }* %coerce, i32 0, i32 1, !dbg !183
  %coerce.imag = load float, float* %coerce.imagp, align 4, !dbg !183
  br label %complex_mul_cont, !dbg !183

complex_mul_cont:                                 ; preds = %complex_mul_libcall, %complex_mul_imag_nan, %for.body
  %real_mul_phi = phi float [ 0.000000e+00, %for.body ], [ 0.000000e+00, %complex_mul_imag_nan ], [ %coerce.real, %complex_mul_libcall ], !dbg !183
  %imag_mul_phi = phi float [ 0.000000e+00, %for.body ], [ 0.000000e+00, %complex_mul_imag_nan ], [ %coerce.imag, %complex_mul_libcall ], !dbg !183
  %add.r = fadd float 0.000000e+00, %real_mul_phi, !dbg !185
  %add.i = fadd float 0.000000e+00, %imag_mul_phi, !dbg !185
  %conv15 = fpext float %add.r to double, !dbg !186
  %conv16 = fpext float %add.i to double, !dbg !186
  %z17 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 2, !dbg !187
  %17 = load { double, double }**, { double, double }*** %z17, align 8, !dbg !187
  %idxprom18 = sext i32 %i.0 to i64, !dbg !188
  %arrayidx19 = getelementptr inbounds { double, double }*, { double, double }** %17, i64 %idxprom18, !dbg !188
  %18 = load { double, double }*, { double, double }** %arrayidx19, align 8, !dbg !188
  %idxprom20 = sext i32 %j.0 to i64, !dbg !188
  %arrayidx21 = getelementptr inbounds { double, double }, { double, double }* %18, i64 %idxprom20, !dbg !188
  %arrayidx21.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx21, i32 0, i32 0, !dbg !189
  %arrayidx21.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx21, i32 0, i32 1, !dbg !189
  store double %conv15, double* %arrayidx21.realp, align 8, !dbg !189
  store double %conv16, double* %arrayidx21.imagp, align 8, !dbg !189
  call void @llvm.dbg.value(metadata i32 0, metadata !170, metadata !DIExpression()), !dbg !166
  br label %for.cond22, !dbg !190

for.cond22:                                       ; preds = %for.inc, %complex_mul_cont
  %j.1 = phi i32 [ 0, %complex_mul_cont ], [ %inc, %for.inc ], !dbg !192
  call void @llvm.dbg.value(metadata i32 %j.1, metadata !170, metadata !DIExpression()), !dbg !166
  %cols23 = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 1, !dbg !193
  %19 = load i32, i32* %cols23, align 4, !dbg !193
  %cmp24 = icmp slt i32 %j.1, %19, !dbg !195
  br i1 %cmp24, label %for.body26, label %for.end, !dbg !196

for.body26:                                       ; preds = %for.cond22
  %z27 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !197
  %20 = load { double, double }**, { double, double }*** %z27, align 8, !dbg !197
  %idxprom28 = sext i32 %i.0 to i64, !dbg !199
  %arrayidx29 = getelementptr inbounds { double, double }*, { double, double }** %20, i64 %idxprom28, !dbg !199
  %21 = load { double, double }*, { double, double }** %arrayidx29, align 8, !dbg !199
  %idxprom30 = sext i32 %j.1 to i64, !dbg !199
  %arrayidx31 = getelementptr inbounds { double, double }, { double, double }* %21, i64 %idxprom30, !dbg !199
  %arrayidx31.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx31, i32 0, i32 0, !dbg !199
  %arrayidx31.real = load double, double* %arrayidx31.realp, align 8, !dbg !199
  %arrayidx31.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx31, i32 0, i32 1, !dbg !199
  %arrayidx31.imag = load double, double* %arrayidx31.imagp, align 8, !dbg !199
  %z32 = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 2, !dbg !200
  %22 = load { double, double }**, { double, double }*** %z32, align 8, !dbg !200
  %idxprom33 = sext i32 %j.1 to i64, !dbg !201
  %arrayidx34 = getelementptr inbounds { double, double }*, { double, double }** %22, i64 %idxprom33, !dbg !201
  %23 = load { double, double }*, { double, double }** %arrayidx34, align 8, !dbg !201
  %idxprom35 = sext i32 %i.0 to i64, !dbg !201
  %arrayidx36 = getelementptr inbounds { double, double }, { double, double }* %23, i64 %idxprom35, !dbg !201
  %arrayidx36.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx36, i32 0, i32 0, !dbg !201
  %arrayidx36.real = load double, double* %arrayidx36.realp, align 8, !dbg !201
  %arrayidx36.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx36, i32 0, i32 1, !dbg !201
  %arrayidx36.imag = load double, double* %arrayidx36.imagp, align 8, !dbg !201
  %mul_ac = fmul double %arrayidx31.real, %arrayidx36.real, !dbg !202
  %mul_bd = fmul double %arrayidx31.imag, %arrayidx36.imag, !dbg !202
  %mul_ad = fmul double %arrayidx31.real, %arrayidx36.imag, !dbg !202
  %mul_bc = fmul double %arrayidx31.imag, %arrayidx36.real, !dbg !202
  %mul_r = fsub double %mul_ac, %mul_bd, !dbg !202
  %mul_i = fadd double %mul_ad, %mul_bc, !dbg !202
  %isnan_cmp = fcmp uno double %mul_r, %mul_r, !dbg !202
  br i1 %isnan_cmp, label %complex_mul_imag_nan37, label %complex_mul_cont41, !dbg !202, !prof !184

complex_mul_imag_nan37:                           ; preds = %for.body26
  %isnan_cmp38 = fcmp uno double %mul_i, %mul_i, !dbg !202
  br i1 %isnan_cmp38, label %complex_mul_libcall39, label %complex_mul_cont41, !dbg !202, !prof !184

complex_mul_libcall39:                            ; preds = %complex_mul_imag_nan37
  %call40 = call { double, double } @__muldc3(double %arrayidx31.real, double %arrayidx31.imag, double %arrayidx36.real, double %arrayidx36.imag) #6, !dbg !202
  %24 = extractvalue { double, double } %call40, 0, !dbg !202
  %25 = extractvalue { double, double } %call40, 1, !dbg !202
  br label %complex_mul_cont41, !dbg !202

complex_mul_cont41:                               ; preds = %complex_mul_libcall39, %complex_mul_imag_nan37, %for.body26
  %real_mul_phi42 = phi double [ %mul_r, %for.body26 ], [ %mul_r, %complex_mul_imag_nan37 ], [ %24, %complex_mul_libcall39 ], !dbg !202
  %imag_mul_phi43 = phi double [ %mul_i, %for.body26 ], [ %mul_i, %complex_mul_imag_nan37 ], [ %25, %complex_mul_libcall39 ], !dbg !202
  %z44 = getelementptr inbounds %struct.matrix, %struct.matrix* %retval, i32 0, i32 2, !dbg !203
  %26 = load { double, double }**, { double, double }*** %z44, align 8, !dbg !203
  %idxprom45 = sext i32 %i.0 to i64, !dbg !204
  %arrayidx46 = getelementptr inbounds { double, double }*, { double, double }** %26, i64 %idxprom45, !dbg !204
  %27 = load { double, double }*, { double, double }** %arrayidx46, align 8, !dbg !204
  %idxprom47 = sext i32 %j.1 to i64, !dbg !204
  %arrayidx48 = getelementptr inbounds { double, double }, { double, double }* %27, i64 %idxprom47, !dbg !204
  %arrayidx48.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx48, i32 0, i32 0, !dbg !205
  %arrayidx48.real = load double, double* %arrayidx48.realp, align 8, !dbg !205
  %arrayidx48.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx48, i32 0, i32 1, !dbg !205
  %arrayidx48.imag = load double, double* %arrayidx48.imagp, align 8, !dbg !205
  %add.r49 = fadd double %arrayidx48.real, %real_mul_phi42, !dbg !205
  %add.i50 = fadd double %arrayidx48.imag, %imag_mul_phi43, !dbg !205
  %arrayidx48.realp51 = getelementptr inbounds { double, double }, { double, double }* %arrayidx48, i32 0, i32 0, !dbg !205
  %arrayidx48.imagp52 = getelementptr inbounds { double, double }, { double, double }* %arrayidx48, i32 0, i32 1, !dbg !205
  store double %add.r49, double* %arrayidx48.realp51, align 8, !dbg !205
  store double %add.i50, double* %arrayidx48.imagp52, align 8, !dbg !205
  br label %for.inc, !dbg !206

for.inc:                                          ; preds = %complex_mul_cont41
  %inc = add nsw i32 %j.1, 1, !dbg !207
  call void @llvm.dbg.value(metadata i32 %inc, metadata !170, metadata !DIExpression()), !dbg !166
  br label %for.cond22, !dbg !208, !llvm.loop !209

for.end:                                          ; preds = %for.cond22
  br label %for.inc53, !dbg !211

for.inc53:                                        ; preds = %for.end
  %inc54 = add nsw i32 %i.0, 1, !dbg !212
  call void @llvm.dbg.value(metadata i32 %inc54, metadata !165, metadata !DIExpression()), !dbg !166
  br label %for.cond, !dbg !213, !llvm.loop !214

for.end55:                                        ; preds = %for.cond
  br label %if.end, !dbg !216

if.end:                                           ; preds = %for.end55, %entry
  %28 = bitcast %struct.matrix* %retval to { i64, { double, double }** }*, !dbg !217
  %29 = load { i64, { double, double }** }, { i64, { double, double }** }* %28, align 8, !dbg !217
  ret { i64, { double, double }** } %29, !dbg !217
}

declare dso_local <2 x float> @__mulsc3(float, float, float, float)

declare dso_local { double, double } @__muldc3(double, double, double, double)

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @isNormal(i64 %a.coerce0, { double, double }** %a.coerce1) #0 !dbg !218 {
entry:
  %a = alloca %struct.matrix, align 8
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
  call void @llvm.dbg.declare(metadata %struct.matrix* %a, metadata !219, metadata !DIExpression()), !dbg !220
  call void @llvm.dbg.declare(metadata %struct.matrix* %a_ah, metadata !221, metadata !DIExpression()), !dbg !222
  call void @llvm.dbg.declare(metadata %struct.matrix* %ah_a, metadata !223, metadata !DIExpression()), !dbg !224
  %rows = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !225
  %3 = load i32, i32* %rows, align 8, !dbg !225
  %cols = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !227
  %4 = load i32, i32* %cols, align 4, !dbg !227
  %cmp = icmp ne i32 %3, %4, !dbg !228
  br i1 %cmp, label %if.then, label %if.end, !dbg !229

if.then:                                          ; preds = %entry
  br label %return, !dbg !230

if.end:                                           ; preds = %entry
  %5 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !231
  %6 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %5, i32 0, i32 0, !dbg !231
  %7 = load i64, i64* %6, align 8, !dbg !231
  %8 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %5, i32 0, i32 1, !dbg !231
  %9 = load { double, double }**, { double, double }*** %8, align 8, !dbg !231
  %call = call { i64, { double, double }** } @transpose(i64 %7, { double, double }** %9), !dbg !231
  %10 = bitcast %struct.matrix* %agg.tmp to { i64, { double, double }** }*, !dbg !231
  %11 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %10, i32 0, i32 0, !dbg !231
  %12 = extractvalue { i64, { double, double }** } %call, 0, !dbg !231
  store i64 %12, i64* %11, align 8, !dbg !231
  %13 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %10, i32 0, i32 1, !dbg !231
  %14 = extractvalue { i64, { double, double }** } %call, 1, !dbg !231
  store { double, double }** %14, { double, double }*** %13, align 8, !dbg !231
  %15 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !232
  %16 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %15, i32 0, i32 0, !dbg !232
  %17 = load i64, i64* %16, align 8, !dbg !232
  %18 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %15, i32 0, i32 1, !dbg !232
  %19 = load { double, double }**, { double, double }*** %18, align 8, !dbg !232
  %20 = bitcast %struct.matrix* %agg.tmp to { i64, { double, double }** }*, !dbg !232
  %21 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %20, i32 0, i32 0, !dbg !232
  %22 = load i64, i64* %21, align 8, !dbg !232
  %23 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %20, i32 0, i32 1, !dbg !232
  %24 = load { double, double }**, { double, double }*** %23, align 8, !dbg !232
  %call1 = call { i64, { double, double }** } @multiply(i64 %17, { double, double }** %19, i64 %22, { double, double }** %24), !dbg !232
  %25 = bitcast %struct.matrix* %tmp to { i64, { double, double }** }*, !dbg !232
  %26 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %25, i32 0, i32 0, !dbg !232
  %27 = extractvalue { i64, { double, double }** } %call1, 0, !dbg !232
  store i64 %27, i64* %26, align 8, !dbg !232
  %28 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %25, i32 0, i32 1, !dbg !232
  %29 = extractvalue { i64, { double, double }** } %call1, 1, !dbg !232
  store { double, double }** %29, { double, double }*** %28, align 8, !dbg !232
  %30 = bitcast %struct.matrix* %a_ah to i8*, !dbg !232
  %31 = bitcast %struct.matrix* %tmp to i8*, !dbg !232
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %30, i8* align 8 %31, i64 16, i1 false), !dbg !232
  %32 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !233
  %33 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %32, i32 0, i32 0, !dbg !233
  %34 = load i64, i64* %33, align 8, !dbg !233
  %35 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %32, i32 0, i32 1, !dbg !233
  %36 = load { double, double }**, { double, double }*** %35, align 8, !dbg !233
  %call4 = call { i64, { double, double }** } @transpose(i64 %34, { double, double }** %36), !dbg !233
  %37 = bitcast %struct.matrix* %agg.tmp3 to { i64, { double, double }** }*, !dbg !233
  %38 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %37, i32 0, i32 0, !dbg !233
  %39 = extractvalue { i64, { double, double }** } %call4, 0, !dbg !233
  store i64 %39, i64* %38, align 8, !dbg !233
  %40 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %37, i32 0, i32 1, !dbg !233
  %41 = extractvalue { i64, { double, double }** } %call4, 1, !dbg !233
  store { double, double }** %41, { double, double }*** %40, align 8, !dbg !233
  %42 = bitcast %struct.matrix* %agg.tmp3 to { i64, { double, double }** }*, !dbg !234
  %43 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %42, i32 0, i32 0, !dbg !234
  %44 = load i64, i64* %43, align 8, !dbg !234
  %45 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %42, i32 0, i32 1, !dbg !234
  %46 = load { double, double }**, { double, double }*** %45, align 8, !dbg !234
  %47 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !234
  %48 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %47, i32 0, i32 0, !dbg !234
  %49 = load i64, i64* %48, align 8, !dbg !234
  %50 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %47, i32 0, i32 1, !dbg !234
  %51 = load { double, double }**, { double, double }*** %50, align 8, !dbg !234
  %call5 = call { i64, { double, double }** } @multiply(i64 %44, { double, double }** %46, i64 %49, { double, double }** %51), !dbg !234
  %52 = bitcast %struct.matrix* %tmp2 to { i64, { double, double }** }*, !dbg !234
  %53 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %52, i32 0, i32 0, !dbg !234
  %54 = extractvalue { i64, { double, double }** } %call5, 0, !dbg !234
  store i64 %54, i64* %53, align 8, !dbg !234
  %55 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %52, i32 0, i32 1, !dbg !234
  %56 = extractvalue { i64, { double, double }** } %call5, 1, !dbg !234
  store { double, double }** %56, { double, double }*** %55, align 8, !dbg !234
  %57 = bitcast %struct.matrix* %ah_a to i8*, !dbg !234
  %58 = bitcast %struct.matrix* %tmp2 to i8*, !dbg !234
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %57, i8* align 8 %58, i64 16, i1 false), !dbg !234
  call void @llvm.dbg.value(metadata i32 0, metadata !235, metadata !DIExpression()), !dbg !236
  br label %for.cond, !dbg !237

for.cond:                                         ; preds = %for.inc21, %if.end
  %i.0 = phi i32 [ 0, %if.end ], [ %inc22, %for.inc21 ], !dbg !239
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !235, metadata !DIExpression()), !dbg !236
  %rows6 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !240
  %59 = load i32, i32* %rows6, align 8, !dbg !240
  %cmp7 = icmp slt i32 %i.0, %59, !dbg !242
  br i1 %cmp7, label %for.body, label %for.end23, !dbg !243

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !244, metadata !DIExpression()), !dbg !236
  br label %for.cond8, !dbg !245

for.cond8:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !248
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !244, metadata !DIExpression()), !dbg !236
  %cols9 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !249
  %60 = load i32, i32* %cols9, align 4, !dbg !249
  %cmp10 = icmp slt i32 %j.0, %60, !dbg !251
  br i1 %cmp10, label %for.body11, label %for.end, !dbg !252

for.body11:                                       ; preds = %for.cond8
  %z = getelementptr inbounds %struct.matrix, %struct.matrix* %a_ah, i32 0, i32 2, !dbg !253
  %61 = load { double, double }**, { double, double }*** %z, align 8, !dbg !253
  %idxprom = sext i32 %i.0 to i64, !dbg !256
  %arrayidx = getelementptr inbounds { double, double }*, { double, double }** %61, i64 %idxprom, !dbg !256
  %62 = load { double, double }*, { double, double }** %arrayidx, align 8, !dbg !256
  %idxprom12 = sext i32 %j.0 to i64, !dbg !256
  %arrayidx13 = getelementptr inbounds { double, double }, { double, double }* %62, i64 %idxprom12, !dbg !256
  %arrayidx13.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx13, i32 0, i32 0, !dbg !256
  %arrayidx13.real = load double, double* %arrayidx13.realp, align 8, !dbg !256
  %arrayidx13.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx13, i32 0, i32 1, !dbg !256
  %arrayidx13.imag = load double, double* %arrayidx13.imagp, align 8, !dbg !256
  %z14 = getelementptr inbounds %struct.matrix, %struct.matrix* %ah_a, i32 0, i32 2, !dbg !257
  %63 = load { double, double }**, { double, double }*** %z14, align 8, !dbg !257
  %idxprom15 = sext i32 %i.0 to i64, !dbg !258
  %arrayidx16 = getelementptr inbounds { double, double }*, { double, double }** %63, i64 %idxprom15, !dbg !258
  %64 = load { double, double }*, { double, double }** %arrayidx16, align 8, !dbg !258
  %idxprom17 = sext i32 %j.0 to i64, !dbg !258
  %arrayidx18 = getelementptr inbounds { double, double }, { double, double }* %64, i64 %idxprom17, !dbg !258
  %arrayidx18.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx18, i32 0, i32 0, !dbg !258
  %arrayidx18.real = load double, double* %arrayidx18.realp, align 8, !dbg !258
  %arrayidx18.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx18, i32 0, i32 1, !dbg !258
  %arrayidx18.imag = load double, double* %arrayidx18.imagp, align 8, !dbg !258
  %cmp.r = fcmp une double %arrayidx13.real, %arrayidx18.real, !dbg !259
  %cmp.i = fcmp une double %arrayidx13.imag, %arrayidx18.imag, !dbg !259
  %or.ri = or i1 %cmp.r, %cmp.i, !dbg !259
  br i1 %or.ri, label %if.then19, label %if.end20, !dbg !260

if.then19:                                        ; preds = %for.body11
  br label %return, !dbg !261

if.end20:                                         ; preds = %for.body11
  br label %for.inc, !dbg !262

for.inc:                                          ; preds = %if.end20
  %inc = add nsw i32 %j.0, 1, !dbg !263
  call void @llvm.dbg.value(metadata i32 %inc, metadata !244, metadata !DIExpression()), !dbg !236
  br label %for.cond8, !dbg !264, !llvm.loop !265

for.end:                                          ; preds = %for.cond8
  br label %for.inc21, !dbg !267

for.inc21:                                        ; preds = %for.end
  %inc22 = add nsw i32 %i.0, 1, !dbg !268
  call void @llvm.dbg.value(metadata i32 %inc22, metadata !235, metadata !DIExpression()), !dbg !236
  br label %for.cond, !dbg !269, !llvm.loop !270

for.end23:                                        ; preds = %for.cond
  br label %return, !dbg !272

return:                                           ; preds = %for.end23, %if.then19, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ 0, %if.then19 ], [ 1, %for.end23 ], !dbg !236
  ret i32 %retval.0, !dbg !273
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @isUnitary(i64 %a.coerce0, { double, double }** %a.coerce1) #0 !dbg !274 {
entry:
  %a = alloca %struct.matrix, align 8
  %b = alloca %struct.matrix, align 8
  %tmp = alloca %struct.matrix, align 8
  %agg.tmp = alloca %struct.matrix, align 8
  %0 = bitcast %struct.matrix* %a to { i64, { double, double }** }*
  %1 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %0, i32 0, i32 0
  store i64 %a.coerce0, i64* %1, align 8
  %2 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %0, i32 0, i32 1
  store { double, double }** %a.coerce1, { double, double }*** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.matrix* %a, metadata !275, metadata !DIExpression()), !dbg !276
  call void @llvm.dbg.declare(metadata %struct.matrix* %b, metadata !277, metadata !DIExpression()), !dbg !278
  %3 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !279
  %4 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %3, i32 0, i32 0, !dbg !279
  %5 = load i64, i64* %4, align 8, !dbg !279
  %6 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %3, i32 0, i32 1, !dbg !279
  %7 = load { double, double }**, { double, double }*** %6, align 8, !dbg !279
  %call = call i32 @isNormal(i64 %5, { double, double }** %7), !dbg !279
  %cmp = icmp eq i32 %call, 1, !dbg !281
  br i1 %cmp, label %if.then, label %if.end24, !dbg !282

if.then:                                          ; preds = %entry
  %8 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !283
  %9 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %8, i32 0, i32 0, !dbg !283
  %10 = load i64, i64* %9, align 8, !dbg !283
  %11 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %8, i32 0, i32 1, !dbg !283
  %12 = load { double, double }**, { double, double }*** %11, align 8, !dbg !283
  %call1 = call { i64, { double, double }** } @transpose(i64 %10, { double, double }** %12), !dbg !283
  %13 = bitcast %struct.matrix* %agg.tmp to { i64, { double, double }** }*, !dbg !283
  %14 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %13, i32 0, i32 0, !dbg !283
  %15 = extractvalue { i64, { double, double }** } %call1, 0, !dbg !283
  store i64 %15, i64* %14, align 8, !dbg !283
  %16 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %13, i32 0, i32 1, !dbg !283
  %17 = extractvalue { i64, { double, double }** } %call1, 1, !dbg !283
  store { double, double }** %17, { double, double }*** %16, align 8, !dbg !283
  %18 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !285
  %19 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %18, i32 0, i32 0, !dbg !285
  %20 = load i64, i64* %19, align 8, !dbg !285
  %21 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %18, i32 0, i32 1, !dbg !285
  %22 = load { double, double }**, { double, double }*** %21, align 8, !dbg !285
  %23 = bitcast %struct.matrix* %agg.tmp to { i64, { double, double }** }*, !dbg !285
  %24 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %23, i32 0, i32 0, !dbg !285
  %25 = load i64, i64* %24, align 8, !dbg !285
  %26 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %23, i32 0, i32 1, !dbg !285
  %27 = load { double, double }**, { double, double }*** %26, align 8, !dbg !285
  %call2 = call { i64, { double, double }** } @multiply(i64 %20, { double, double }** %22, i64 %25, { double, double }** %27), !dbg !285
  %28 = bitcast %struct.matrix* %tmp to { i64, { double, double }** }*, !dbg !285
  %29 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %28, i32 0, i32 0, !dbg !285
  %30 = extractvalue { i64, { double, double }** } %call2, 0, !dbg !285
  store i64 %30, i64* %29, align 8, !dbg !285
  %31 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %28, i32 0, i32 1, !dbg !285
  %32 = extractvalue { i64, { double, double }** } %call2, 1, !dbg !285
  store { double, double }** %32, { double, double }*** %31, align 8, !dbg !285
  %33 = bitcast %struct.matrix* %b to i8*, !dbg !285
  %34 = bitcast %struct.matrix* %tmp to i8*, !dbg !285
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %33, i8* align 8 %34, i64 16, i1 false), !dbg !285
  call void @llvm.dbg.value(metadata i32 0, metadata !286, metadata !DIExpression()), !dbg !287
  br label %for.cond, !dbg !288

for.cond:                                         ; preds = %for.inc21, %if.then
  %i.0 = phi i32 [ 0, %if.then ], [ %inc22, %for.inc21 ], !dbg !290
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !286, metadata !DIExpression()), !dbg !287
  %rows = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 0, !dbg !291
  %35 = load i32, i32* %rows, align 8, !dbg !291
  %cmp3 = icmp slt i32 %i.0, %35, !dbg !293
  br i1 %cmp3, label %for.body, label %for.end23, !dbg !294

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !295, metadata !DIExpression()), !dbg !287
  br label %for.cond4, !dbg !296

for.cond4:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !299
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !295, metadata !DIExpression()), !dbg !287
  %cols = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 1, !dbg !300
  %36 = load i32, i32* %cols, align 4, !dbg !300
  %cmp5 = icmp slt i32 %j.0, %36, !dbg !302
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !303

for.body6:                                        ; preds = %for.cond4
  %cmp7 = icmp eq i32 %i.0, %j.0, !dbg !304
  br i1 %cmp7, label %land.lhs.true, label %lor.lhs.false, !dbg !307

land.lhs.true:                                    ; preds = %for.body6
  %z = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 2, !dbg !308
  %37 = load { double, double }**, { double, double }*** %z, align 8, !dbg !308
  %idxprom = sext i32 %i.0 to i64, !dbg !309
  %arrayidx = getelementptr inbounds { double, double }*, { double, double }** %37, i64 %idxprom, !dbg !309
  %38 = load { double, double }*, { double, double }** %arrayidx, align 8, !dbg !309
  %idxprom8 = sext i32 %j.0 to i64, !dbg !309
  %arrayidx9 = getelementptr inbounds { double, double }, { double, double }* %38, i64 %idxprom8, !dbg !309
  %arrayidx9.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx9, i32 0, i32 0, !dbg !309
  %arrayidx9.real = load double, double* %arrayidx9.realp, align 8, !dbg !309
  %arrayidx9.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx9, i32 0, i32 1, !dbg !309
  %arrayidx9.imag = load double, double* %arrayidx9.imagp, align 8, !dbg !309
  %cmp.r = fcmp une double %arrayidx9.real, 1.000000e+00, !dbg !310
  %cmp.i = fcmp une double %arrayidx9.imag, 0.000000e+00, !dbg !310
  %or.ri = or i1 %cmp.r, %cmp.i, !dbg !310
  br i1 %or.ri, label %if.then20, label %lor.lhs.false, !dbg !311

lor.lhs.false:                                    ; preds = %land.lhs.true, %for.body6
  %cmp10 = icmp ne i32 %i.0, %j.0, !dbg !312
  br i1 %cmp10, label %land.lhs.true11, label %if.end, !dbg !313

land.lhs.true11:                                  ; preds = %lor.lhs.false
  %z12 = getelementptr inbounds %struct.matrix, %struct.matrix* %b, i32 0, i32 2, !dbg !314
  %39 = load { double, double }**, { double, double }*** %z12, align 8, !dbg !314
  %idxprom13 = sext i32 %i.0 to i64, !dbg !315
  %arrayidx14 = getelementptr inbounds { double, double }*, { double, double }** %39, i64 %idxprom13, !dbg !315
  %40 = load { double, double }*, { double, double }** %arrayidx14, align 8, !dbg !315
  %idxprom15 = sext i32 %j.0 to i64, !dbg !315
  %arrayidx16 = getelementptr inbounds { double, double }, { double, double }* %40, i64 %idxprom15, !dbg !315
  %arrayidx16.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx16, i32 0, i32 0, !dbg !315
  %arrayidx16.real = load double, double* %arrayidx16.realp, align 8, !dbg !315
  %arrayidx16.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx16, i32 0, i32 1, !dbg !315
  %arrayidx16.imag = load double, double* %arrayidx16.imagp, align 8, !dbg !315
  %cmp.r17 = fcmp une double %arrayidx16.real, 0.000000e+00, !dbg !316
  %cmp.i18 = fcmp une double %arrayidx16.imag, 0.000000e+00, !dbg !316
  %or.ri19 = or i1 %cmp.r17, %cmp.i18, !dbg !316
  br i1 %or.ri19, label %if.then20, label %if.end, !dbg !317

if.then20:                                        ; preds = %land.lhs.true11, %land.lhs.true
  br label %return, !dbg !318

if.end:                                           ; preds = %land.lhs.true11, %lor.lhs.false
  br label %for.inc, !dbg !319

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %j.0, 1, !dbg !320
  call void @llvm.dbg.value(metadata i32 %inc, metadata !295, metadata !DIExpression()), !dbg !287
  br label %for.cond4, !dbg !321, !llvm.loop !322

for.end:                                          ; preds = %for.cond4
  br label %for.inc21, !dbg !324

for.inc21:                                        ; preds = %for.end
  %inc22 = add nsw i32 %i.0, 1, !dbg !325
  call void @llvm.dbg.value(metadata i32 %inc22, metadata !286, metadata !DIExpression()), !dbg !287
  br label %for.cond, !dbg !326, !llvm.loop !327

for.end23:                                        ; preds = %for.cond
  br label %return, !dbg !329

if.end24:                                         ; preds = %entry
  br label %return, !dbg !330

return:                                           ; preds = %if.end24, %for.end23, %if.then20
  %retval.0 = phi i32 [ 0, %if.then20 ], [ 1, %for.end23 ], [ 0, %if.end24 ], !dbg !287
  ret i32 %retval.0, !dbg !331
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #3 !dbg !332 {
entry:
  %z = alloca { double, double }, align 8
  %coerce = alloca { float, float }, align 4
  %a = alloca %struct.matrix, align 8
  %aT = alloca %struct.matrix, align 8
  %coerce31 = alloca { float, float }, align 4
  %tmp = alloca %struct.matrix, align 8
  %coerce93 = alloca { float, float }, align 4
  call void @llvm.dbg.declare(metadata { double, double }* %z, metadata !335, metadata !DIExpression()), !dbg !336
  br i1 false, label %complex_mul_imag_nan, label %complex_mul_cont, !dbg !337, !prof !184

complex_mul_imag_nan:                             ; preds = %entry
  br i1 false, label %complex_mul_libcall, label %complex_mul_cont, !dbg !337, !prof !184

complex_mul_libcall:                              ; preds = %complex_mul_imag_nan
  %call = call <2 x float> @__mulsc3(float 4.000000e+00, float 0.000000e+00, float 0.000000e+00, float 1.000000e+00) #6, !dbg !337
  %0 = bitcast { float, float }* %coerce to <2 x float>*, !dbg !337
  store <2 x float> %call, <2 x float>* %0, align 4, !dbg !337
  %coerce.realp = getelementptr inbounds { float, float }, { float, float }* %coerce, i32 0, i32 0, !dbg !337
  %coerce.real = load float, float* %coerce.realp, align 4, !dbg !337
  %coerce.imagp = getelementptr inbounds { float, float }, { float, float }* %coerce, i32 0, i32 1, !dbg !337
  %coerce.imag = load float, float* %coerce.imagp, align 4, !dbg !337
  br label %complex_mul_cont, !dbg !337

complex_mul_cont:                                 ; preds = %complex_mul_libcall, %complex_mul_imag_nan, %entry
  %real_mul_phi = phi float [ 0.000000e+00, %entry ], [ 0.000000e+00, %complex_mul_imag_nan ], [ %coerce.real, %complex_mul_libcall ], !dbg !337
  %imag_mul_phi = phi float [ 4.000000e+00, %entry ], [ 4.000000e+00, %complex_mul_imag_nan ], [ %coerce.imag, %complex_mul_libcall ], !dbg !337
  %add.r = fadd float 3.000000e+00, %real_mul_phi, !dbg !338
  %add.i = fadd float 0.000000e+00, %imag_mul_phi, !dbg !338
  %conv = fpext float %add.r to double, !dbg !339
  %conv1 = fpext float %add.i to double, !dbg !339
  %z.realp = getelementptr inbounds { double, double }, { double, double }* %z, i32 0, i32 0, !dbg !336
  %z.imagp = getelementptr inbounds { double, double }, { double, double }* %z, i32 0, i32 1, !dbg !336
  store double %conv, double* %z.realp, align 8, !dbg !336
  store double %conv1, double* %z.imagp, align 8, !dbg !336
  call void @llvm.dbg.declare(metadata %struct.matrix* %a, metadata !340, metadata !DIExpression()), !dbg !341
  call void @llvm.dbg.declare(metadata %struct.matrix* %aT, metadata !342, metadata !DIExpression()), !dbg !343
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0)), !dbg !344
  %rows = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !345
  %cols = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !346
  %call3 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i32* %rows, i32* %cols), !dbg !347
  %rows4 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !348
  %1 = load i32, i32* %rows4, align 8, !dbg !348
  %conv5 = sext i32 %1 to i64, !dbg !349
  %mul = mul i64 %conv5, 8, !dbg !350
  %call6 = call noalias i8* @malloc(i64 %mul) #6, !dbg !351
  %2 = bitcast i8* %call6 to { double, double }**, !dbg !351
  %z7 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !352
  store { double, double }** %2, { double, double }*** %z7, align 8, !dbg !353
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.2, i64 0, i64 0)), !dbg !354
  call void @llvm.dbg.value(metadata i32 0, metadata !355, metadata !DIExpression()), !dbg !356
  br label %for.cond, !dbg !357

for.cond:                                         ; preds = %for.inc55, %complex_mul_cont
  %i.0 = phi i32 [ 0, %complex_mul_cont ], [ %inc56, %for.inc55 ], !dbg !359
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !355, metadata !DIExpression()), !dbg !356
  %rows9 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 0, !dbg !360
  %3 = load i32, i32* %rows9, align 8, !dbg !360
  %cmp = icmp slt i32 %i.0, %3, !dbg !362
  br i1 %cmp, label %for.body, label %for.end57, !dbg !363

for.body:                                         ; preds = %for.cond
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !364
  %cols12 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !366
  %4 = load i32, i32* %cols12, align 4, !dbg !366
  %conv13 = sext i32 %4 to i64, !dbg !367
  %mul14 = mul i64 %conv13, 16, !dbg !368
  %call15 = call noalias i8* @malloc(i64 %mul14) #6, !dbg !369
  %5 = bitcast i8* %call15 to { double, double }*, !dbg !369
  %z16 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !370
  %6 = load { double, double }**, { double, double }*** %z16, align 8, !dbg !370
  %idxprom = sext i32 %i.0 to i64, !dbg !371
  %arrayidx = getelementptr inbounds { double, double }*, { double, double }** %6, i64 %idxprom, !dbg !371
  store { double, double }* %5, { double, double }** %arrayidx, align 8, !dbg !372
  call void @llvm.dbg.value(metadata i32 0, metadata !373, metadata !DIExpression()), !dbg !356
  br label %for.cond17, !dbg !374

for.cond17:                                       ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !376
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !373, metadata !DIExpression()), !dbg !356
  %cols18 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 1, !dbg !377
  %7 = load i32, i32* %cols18, align 4, !dbg !377
  %cmp19 = icmp slt i32 %j.0, %7, !dbg !379
  br i1 %cmp19, label %for.body21, label %for.end, !dbg !380

for.body21:                                       ; preds = %for.cond17
  %call22 = call i32 @rand() #6, !dbg !381
  %rem = srem i32 %call22, 10, !dbg !383
  %conv23 = sitofp i32 %rem to float, !dbg !381
  %call24 = call i32 @rand() #6, !dbg !384
  %rem25 = srem i32 %call24, 10, !dbg !385
  %conv26 = sitofp i32 %rem25 to float, !dbg !384
  %mul_ac = fmul float %conv26, 0.000000e+00, !dbg !386
  %mul_ad = fmul float %conv26, 1.000000e+00, !dbg !386
  %mul_r = fsub float %mul_ac, 0.000000e+00, !dbg !386
  %mul_i = fadd float %mul_ad, 0.000000e+00, !dbg !386
  %isnan_cmp = fcmp uno float %mul_r, %mul_r, !dbg !386
  br i1 %isnan_cmp, label %complex_mul_imag_nan27, label %complex_mul_cont32, !dbg !386, !prof !184

complex_mul_imag_nan27:                           ; preds = %for.body21
  %isnan_cmp28 = fcmp uno float %mul_i, %mul_i, !dbg !386
  br i1 %isnan_cmp28, label %complex_mul_libcall29, label %complex_mul_cont32, !dbg !386, !prof !184

complex_mul_libcall29:                            ; preds = %complex_mul_imag_nan27
  %call30 = call <2 x float> @__mulsc3(float %conv26, float 0.000000e+00, float 0.000000e+00, float 1.000000e+00) #6, !dbg !386
  %8 = bitcast { float, float }* %coerce31 to <2 x float>*, !dbg !386
  store <2 x float> %call30, <2 x float>* %8, align 4, !dbg !386
  %coerce31.realp = getelementptr inbounds { float, float }, { float, float }* %coerce31, i32 0, i32 0, !dbg !386
  %coerce31.real = load float, float* %coerce31.realp, align 4, !dbg !386
  %coerce31.imagp = getelementptr inbounds { float, float }, { float, float }* %coerce31, i32 0, i32 1, !dbg !386
  %coerce31.imag = load float, float* %coerce31.imagp, align 4, !dbg !386
  br label %complex_mul_cont32, !dbg !386

complex_mul_cont32:                               ; preds = %complex_mul_libcall29, %complex_mul_imag_nan27, %for.body21
  %real_mul_phi33 = phi float [ %mul_r, %for.body21 ], [ %mul_r, %complex_mul_imag_nan27 ], [ %coerce31.real, %complex_mul_libcall29 ], !dbg !386
  %imag_mul_phi34 = phi float [ %mul_i, %for.body21 ], [ %mul_i, %complex_mul_imag_nan27 ], [ %coerce31.imag, %complex_mul_libcall29 ], !dbg !386
  %add.r35 = fadd float %conv23, %real_mul_phi33, !dbg !387
  %add.i36 = fadd float 0.000000e+00, %imag_mul_phi34, !dbg !387
  %conv37 = fpext float %add.r35 to double, !dbg !381
  %conv38 = fpext float %add.i36 to double, !dbg !381
  %z39 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !388
  %9 = load { double, double }**, { double, double }*** %z39, align 8, !dbg !388
  %idxprom40 = sext i32 %i.0 to i64, !dbg !389
  %arrayidx41 = getelementptr inbounds { double, double }*, { double, double }** %9, i64 %idxprom40, !dbg !389
  %10 = load { double, double }*, { double, double }** %arrayidx41, align 8, !dbg !389
  %idxprom42 = sext i32 %j.0 to i64, !dbg !389
  %arrayidx43 = getelementptr inbounds { double, double }, { double, double }* %10, i64 %idxprom42, !dbg !389
  %arrayidx43.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx43, i32 0, i32 0, !dbg !390
  %arrayidx43.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx43, i32 0, i32 1, !dbg !390
  store double %conv37, double* %arrayidx43.realp, align 8, !dbg !390
  store double %conv38, double* %arrayidx43.imagp, align 8, !dbg !390
  %z44 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !391
  %11 = load { double, double }**, { double, double }*** %z44, align 8, !dbg !391
  %idxprom45 = sext i32 %i.0 to i64, !dbg !392
  %arrayidx46 = getelementptr inbounds { double, double }*, { double, double }** %11, i64 %idxprom45, !dbg !392
  %12 = load { double, double }*, { double, double }** %arrayidx46, align 8, !dbg !392
  %idxprom47 = sext i32 %j.0 to i64, !dbg !392
  %arrayidx48 = getelementptr inbounds { double, double }, { double, double }* %12, i64 %idxprom47, !dbg !392
  %arrayidx48.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx48, i32 0, i32 0, !dbg !392
  %arrayidx48.real = load double, double* %arrayidx48.realp, align 8, !dbg !392
  %arrayidx48.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx48, i32 0, i32 1, !dbg !392
  %arrayidx48.imag = load double, double* %arrayidx48.imagp, align 8, !dbg !392
  %z49 = getelementptr inbounds %struct.matrix, %struct.matrix* %a, i32 0, i32 2, !dbg !393
  %13 = load { double, double }**, { double, double }*** %z49, align 8, !dbg !393
  %idxprom50 = sext i32 %i.0 to i64, !dbg !394
  %arrayidx51 = getelementptr inbounds { double, double }*, { double, double }** %13, i64 %idxprom50, !dbg !394
  %14 = load { double, double }*, { double, double }** %arrayidx51, align 8, !dbg !394
  %idxprom52 = sext i32 %j.0 to i64, !dbg !394
  %arrayidx53 = getelementptr inbounds { double, double }, { double, double }* %14, i64 %idxprom52, !dbg !394
  %arrayidx53.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx53, i32 0, i32 0, !dbg !394
  %arrayidx53.real = load double, double* %arrayidx53.realp, align 8, !dbg !394
  %arrayidx53.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx53, i32 0, i32 1, !dbg !394
  %arrayidx53.imag = load double, double* %arrayidx53.imagp, align 8, !dbg !394
  %call54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), double %arrayidx48.real, double %arrayidx53.imag), !dbg !395
  br label %for.inc, !dbg !396

for.inc:                                          ; preds = %complex_mul_cont32
  %inc = add nsw i32 %j.0, 1, !dbg !397
  call void @llvm.dbg.value(metadata i32 %inc, metadata !373, metadata !DIExpression()), !dbg !356
  br label %for.cond17, !dbg !398, !llvm.loop !399

for.end:                                          ; preds = %for.cond17
  br label %for.inc55, !dbg !401

for.inc55:                                        ; preds = %for.end
  %inc56 = add nsw i32 %i.0, 1, !dbg !402
  call void @llvm.dbg.value(metadata i32 %inc56, metadata !355, metadata !DIExpression()), !dbg !356
  br label %for.cond, !dbg !403, !llvm.loop !404

for.end57:                                        ; preds = %for.cond
  %15 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !406
  %16 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %15, i32 0, i32 0, !dbg !406
  %17 = load i64, i64* %16, align 8, !dbg !406
  %18 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %15, i32 0, i32 1, !dbg !406
  %19 = load { double, double }**, { double, double }*** %18, align 8, !dbg !406
  %call58 = call { i64, { double, double }** } @transpose(i64 %17, { double, double }** %19), !dbg !406
  %20 = bitcast %struct.matrix* %tmp to { i64, { double, double }** }*, !dbg !406
  %21 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %20, i32 0, i32 0, !dbg !406
  %22 = extractvalue { i64, { double, double }** } %call58, 0, !dbg !406
  store i64 %22, i64* %21, align 8, !dbg !406
  %23 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %20, i32 0, i32 1, !dbg !406
  %24 = extractvalue { i64, { double, double }** } %call58, 1, !dbg !406
  store { double, double }** %24, { double, double }*** %23, align 8, !dbg !406
  %25 = bitcast %struct.matrix* %aT to i8*, !dbg !406
  %26 = bitcast %struct.matrix* %tmp to i8*, !dbg !406
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %25, i8* align 8 %26, i64 16, i1 false), !dbg !406
  %call59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.5, i64 0, i64 0)), !dbg !407
  call void @llvm.dbg.value(metadata i32 0, metadata !355, metadata !DIExpression()), !dbg !356
  br label %for.cond60, !dbg !408

for.cond60:                                       ; preds = %for.inc120, %for.end57
  %i.1 = phi i32 [ 0, %for.end57 ], [ %inc121, %for.inc120 ], !dbg !410
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !355, metadata !DIExpression()), !dbg !356
  %rows61 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 0, !dbg !411
  %27 = load i32, i32* %rows61, align 8, !dbg !411
  %cmp62 = icmp slt i32 %i.1, %27, !dbg !413
  br i1 %cmp62, label %for.body64, label %for.end122, !dbg !414

for.body64:                                       ; preds = %for.cond60
  %call65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !415
  %cols66 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 1, !dbg !417
  %28 = load i32, i32* %cols66, align 4, !dbg !417
  %conv67 = sext i32 %28 to i64, !dbg !418
  %mul68 = mul i64 %conv67, 16, !dbg !419
  %call69 = call noalias i8* @malloc(i64 %mul68) #6, !dbg !420
  %29 = bitcast i8* %call69 to { double, double }*, !dbg !420
  %z70 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 2, !dbg !421
  %30 = load { double, double }**, { double, double }*** %z70, align 8, !dbg !421
  %idxprom71 = sext i32 %i.1 to i64, !dbg !422
  %arrayidx72 = getelementptr inbounds { double, double }*, { double, double }** %30, i64 %idxprom71, !dbg !422
  store { double, double }* %29, { double, double }** %arrayidx72, align 8, !dbg !423
  call void @llvm.dbg.value(metadata i32 0, metadata !373, metadata !DIExpression()), !dbg !356
  br label %for.cond73, !dbg !424

for.cond73:                                       ; preds = %for.inc117, %for.body64
  %j.1 = phi i32 [ 0, %for.body64 ], [ %inc118, %for.inc117 ], !dbg !426
  call void @llvm.dbg.value(metadata i32 %j.1, metadata !373, metadata !DIExpression()), !dbg !356
  %cols74 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 1, !dbg !427
  %31 = load i32, i32* %cols74, align 4, !dbg !427
  %cmp75 = icmp slt i32 %j.1, %31, !dbg !429
  br i1 %cmp75, label %for.body77, label %for.end119, !dbg !430

for.body77:                                       ; preds = %for.cond73
  %call78 = call i32 @rand() #6, !dbg !431
  %rem79 = srem i32 %call78, 10, !dbg !433
  %conv80 = sitofp i32 %rem79 to float, !dbg !431
  %call81 = call i32 @rand() #6, !dbg !434
  %rem82 = srem i32 %call81, 10, !dbg !435
  %conv83 = sitofp i32 %rem82 to float, !dbg !434
  %mul_ac84 = fmul float %conv83, 0.000000e+00, !dbg !436
  %mul_ad85 = fmul float %conv83, 1.000000e+00, !dbg !436
  %mul_r86 = fsub float %mul_ac84, 0.000000e+00, !dbg !436
  %mul_i87 = fadd float %mul_ad85, 0.000000e+00, !dbg !436
  %isnan_cmp88 = fcmp uno float %mul_r86, %mul_r86, !dbg !436
  br i1 %isnan_cmp88, label %complex_mul_imag_nan89, label %complex_mul_cont94, !dbg !436, !prof !184

complex_mul_imag_nan89:                           ; preds = %for.body77
  %isnan_cmp90 = fcmp uno float %mul_i87, %mul_i87, !dbg !436
  br i1 %isnan_cmp90, label %complex_mul_libcall91, label %complex_mul_cont94, !dbg !436, !prof !184

complex_mul_libcall91:                            ; preds = %complex_mul_imag_nan89
  %call92 = call <2 x float> @__mulsc3(float %conv83, float 0.000000e+00, float 0.000000e+00, float 1.000000e+00) #6, !dbg !436
  %32 = bitcast { float, float }* %coerce93 to <2 x float>*, !dbg !436
  store <2 x float> %call92, <2 x float>* %32, align 4, !dbg !436
  %coerce93.realp = getelementptr inbounds { float, float }, { float, float }* %coerce93, i32 0, i32 0, !dbg !436
  %coerce93.real = load float, float* %coerce93.realp, align 4, !dbg !436
  %coerce93.imagp = getelementptr inbounds { float, float }, { float, float }* %coerce93, i32 0, i32 1, !dbg !436
  %coerce93.imag = load float, float* %coerce93.imagp, align 4, !dbg !436
  br label %complex_mul_cont94, !dbg !436

complex_mul_cont94:                               ; preds = %complex_mul_libcall91, %complex_mul_imag_nan89, %for.body77
  %real_mul_phi95 = phi float [ %mul_r86, %for.body77 ], [ %mul_r86, %complex_mul_imag_nan89 ], [ %coerce93.real, %complex_mul_libcall91 ], !dbg !436
  %imag_mul_phi96 = phi float [ %mul_i87, %for.body77 ], [ %mul_i87, %complex_mul_imag_nan89 ], [ %coerce93.imag, %complex_mul_libcall91 ], !dbg !436
  %add.r97 = fadd float %conv80, %real_mul_phi95, !dbg !437
  %add.i98 = fadd float 0.000000e+00, %imag_mul_phi96, !dbg !437
  %conv99 = fpext float %add.r97 to double, !dbg !431
  %conv100 = fpext float %add.i98 to double, !dbg !431
  %z101 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 2, !dbg !438
  %33 = load { double, double }**, { double, double }*** %z101, align 8, !dbg !438
  %idxprom102 = sext i32 %i.1 to i64, !dbg !439
  %arrayidx103 = getelementptr inbounds { double, double }*, { double, double }** %33, i64 %idxprom102, !dbg !439
  %34 = load { double, double }*, { double, double }** %arrayidx103, align 8, !dbg !439
  %idxprom104 = sext i32 %j.1 to i64, !dbg !439
  %arrayidx105 = getelementptr inbounds { double, double }, { double, double }* %34, i64 %idxprom104, !dbg !439
  %arrayidx105.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx105, i32 0, i32 0, !dbg !440
  %arrayidx105.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx105, i32 0, i32 1, !dbg !440
  store double %conv99, double* %arrayidx105.realp, align 8, !dbg !440
  store double %conv100, double* %arrayidx105.imagp, align 8, !dbg !440
  %z106 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 2, !dbg !441
  %35 = load { double, double }**, { double, double }*** %z106, align 8, !dbg !441
  %idxprom107 = sext i32 %i.1 to i64, !dbg !442
  %arrayidx108 = getelementptr inbounds { double, double }*, { double, double }** %35, i64 %idxprom107, !dbg !442
  %36 = load { double, double }*, { double, double }** %arrayidx108, align 8, !dbg !442
  %idxprom109 = sext i32 %j.1 to i64, !dbg !442
  %arrayidx110 = getelementptr inbounds { double, double }, { double, double }* %36, i64 %idxprom109, !dbg !442
  %arrayidx110.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx110, i32 0, i32 0, !dbg !442
  %arrayidx110.real = load double, double* %arrayidx110.realp, align 8, !dbg !442
  %arrayidx110.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx110, i32 0, i32 1, !dbg !442
  %arrayidx110.imag = load double, double* %arrayidx110.imagp, align 8, !dbg !442
  %z111 = getelementptr inbounds %struct.matrix, %struct.matrix* %aT, i32 0, i32 2, !dbg !443
  %37 = load { double, double }**, { double, double }*** %z111, align 8, !dbg !443
  %idxprom112 = sext i32 %i.1 to i64, !dbg !444
  %arrayidx113 = getelementptr inbounds { double, double }*, { double, double }** %37, i64 %idxprom112, !dbg !444
  %38 = load { double, double }*, { double, double }** %arrayidx113, align 8, !dbg !444
  %idxprom114 = sext i32 %j.1 to i64, !dbg !444
  %arrayidx115 = getelementptr inbounds { double, double }, { double, double }* %38, i64 %idxprom114, !dbg !444
  %arrayidx115.realp = getelementptr inbounds { double, double }, { double, double }* %arrayidx115, i32 0, i32 0, !dbg !444
  %arrayidx115.real = load double, double* %arrayidx115.realp, align 8, !dbg !444
  %arrayidx115.imagp = getelementptr inbounds { double, double }, { double, double }* %arrayidx115, i32 0, i32 1, !dbg !444
  %arrayidx115.imag = load double, double* %arrayidx115.imagp, align 8, !dbg !444
  %call116 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), double %arrayidx110.real, double %arrayidx115.imag), !dbg !445
  br label %for.inc117, !dbg !446

for.inc117:                                       ; preds = %complex_mul_cont94
  %inc118 = add nsw i32 %j.1, 1, !dbg !447
  call void @llvm.dbg.value(metadata i32 %inc118, metadata !373, metadata !DIExpression()), !dbg !356
  br label %for.cond73, !dbg !448, !llvm.loop !449

for.end119:                                       ; preds = %for.cond73
  br label %for.inc120, !dbg !451

for.inc120:                                       ; preds = %for.end119
  %inc121 = add nsw i32 %i.1, 1, !dbg !452
  call void @llvm.dbg.value(metadata i32 %inc121, metadata !355, metadata !DIExpression()), !dbg !356
  br label %for.cond60, !dbg !453, !llvm.loop !454

for.end122:                                       ; preds = %for.cond60
  %39 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !456
  %40 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %39, i32 0, i32 0, !dbg !456
  %41 = load i64, i64* %40, align 8, !dbg !456
  %42 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %39, i32 0, i32 1, !dbg !456
  %43 = load { double, double }**, { double, double }*** %42, align 8, !dbg !456
  %call123 = call i32 @isHermitian(i64 %41, { double, double }** %43), !dbg !456
  %cmp124 = icmp eq i32 %call123, 1, !dbg !457
  %44 = zext i1 %cmp124 to i64, !dbg !456
  %cond = select i1 %cmp124, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i64 0, i64 0), !dbg !456
  %call126 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.6, i64 0, i64 0), i8* %cond), !dbg !458
  %45 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !459
  %46 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %45, i32 0, i32 0, !dbg !459
  %47 = load i64, i64* %46, align 8, !dbg !459
  %48 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %45, i32 0, i32 1, !dbg !459
  %49 = load { double, double }**, { double, double }*** %48, align 8, !dbg !459
  %call127 = call i32 @isUnitary(i64 %47, { double, double }** %49), !dbg !459
  %cmp128 = icmp eq i32 %call127, 1, !dbg !460
  %50 = zext i1 %cmp128 to i64, !dbg !459
  %cond130 = select i1 %cmp128, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i64 0, i64 0), !dbg !459
  %call131 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.9, i64 0, i64 0), i8* %cond130), !dbg !461
  %51 = bitcast %struct.matrix* %a to { i64, { double, double }** }*, !dbg !462
  %52 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %51, i32 0, i32 0, !dbg !462
  %53 = load i64, i64* %52, align 8, !dbg !462
  %54 = getelementptr inbounds { i64, { double, double }** }, { i64, { double, double }** }* %51, i32 0, i32 1, !dbg !462
  %55 = load { double, double }**, { double, double }*** %54, align 8, !dbg !462
  %call132 = call i32 @isNormal(i64 %53, { double, double }** %55), !dbg !462
  %cmp133 = icmp eq i32 %call132, 1, !dbg !463
  %56 = zext i1 %cmp133 to i64, !dbg !462
  %cond135 = select i1 %cmp133, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i64 0, i64 0), !dbg !462
  %call136 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.10, i64 0, i64 0), i8* %cond135), !dbg !464
  ret i32 0, !dbg !465
}

declare dso_local i32 @printf(i8*, ...) #5

declare dso_local i32 @__isoc99_scanf(i8*, ...) #5

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!22 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 17, type: !10)
!23 = !DILocation(line: 17, column: 10, scope: !7)
!24 = !DILocation(line: 19, column: 14, scope: !7)
!25 = !DILocation(line: 19, column: 5, scope: !7)
!26 = !DILocation(line: 19, column: 10, scope: !7)
!27 = !DILocation(line: 20, column: 14, scope: !7)
!28 = !DILocation(line: 20, column: 5, scope: !7)
!29 = !DILocation(line: 20, column: 10, scope: !7)
!30 = !DILocation(line: 22, column: 19, scope: !7)
!31 = !DILocation(line: 22, column: 17, scope: !7)
!32 = !DILocation(line: 22, column: 24, scope: !7)
!33 = !DILocation(line: 22, column: 9, scope: !7)
!34 = !DILocation(line: 22, column: 5, scope: !7)
!35 = !DILocation(line: 22, column: 7, scope: !7)
!36 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 16, type: !14)
!37 = !DILocation(line: 0, scope: !7)
!38 = !DILocation(line: 24, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !7, file: !1, line: 24, column: 3)
!40 = !DILocation(line: 0, scope: !39)
!41 = !DILocation(line: 24, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !1, line: 24, column: 3)
!43 = !DILocation(line: 24, column: 17, scope: !42)
!44 = !DILocation(line: 24, column: 3, scope: !39)
!45 = !DILocation(line: 26, column: 26, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !1, line: 25, column: 5)
!47 = !DILocation(line: 26, column: 24, scope: !46)
!48 = !DILocation(line: 26, column: 31, scope: !46)
!49 = !DILocation(line: 26, column: 16, scope: !46)
!50 = !DILocation(line: 26, column: 9, scope: !46)
!51 = !DILocation(line: 26, column: 7, scope: !46)
!52 = !DILocation(line: 26, column: 14, scope: !46)
!53 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 16, type: !14)
!54 = !DILocation(line: 27, column: 12, scope: !55)
!55 = distinct !DILexicalBlock(scope: !46, file: !1, line: 27, column: 7)
!56 = !DILocation(line: 0, scope: !55)
!57 = !DILocation(line: 27, column: 25, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !1, line: 27, column: 7)
!59 = !DILocation(line: 27, column: 21, scope: !58)
!60 = !DILocation(line: 27, column: 7, scope: !55)
!61 = !DILocation(line: 29, column: 31, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !1, line: 28, column: 9)
!63 = !DILocation(line: 29, column: 29, scope: !62)
!64 = !DILocation(line: 29, column: 23, scope: !62)
!65 = !DILocation(line: 29, column: 13, scope: !62)
!66 = !DILocation(line: 29, column: 11, scope: !62)
!67 = !DILocation(line: 29, column: 21, scope: !62)
!68 = !DILocation(line: 30, column: 9, scope: !62)
!69 = !DILocation(line: 27, column: 32, scope: !58)
!70 = !DILocation(line: 27, column: 7, scope: !58)
!71 = distinct !{!71, !60, !72}
!72 = !DILocation(line: 30, column: 9, scope: !55)
!73 = !DILocation(line: 31, column: 5, scope: !46)
!74 = !DILocation(line: 24, column: 28, scope: !42)
!75 = !DILocation(line: 24, column: 3, scope: !42)
!76 = distinct !{!76, !44, !77}
!77 = !DILocation(line: 31, column: 5, scope: !39)
!78 = !DILocation(line: 33, column: 3, scope: !7)
!79 = distinct !DISubprogram(name: "isHermitian", scope: !1, file: !1, line: 37, type: !80, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!14, !10}
!82 = !DILocalVariable(name: "a", arg: 1, scope: !79, file: !1, line: 37, type: !10)
!83 = !DILocation(line: 37, column: 21, scope: !79)
!84 = !DILocalVariable(name: "b", scope: !79, file: !1, line: 40, type: !10)
!85 = !DILocation(line: 40, column: 10, scope: !79)
!86 = !DILocation(line: 40, column: 14, scope: !79)
!87 = !DILocation(line: 42, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !79, file: !1, line: 42, column: 7)
!89 = !DILocation(line: 42, column: 19, scope: !88)
!90 = !DILocation(line: 42, column: 14, scope: !88)
!91 = !DILocation(line: 42, column: 24, scope: !88)
!92 = !DILocation(line: 42, column: 29, scope: !88)
!93 = !DILocation(line: 42, column: 39, scope: !88)
!94 = !DILocation(line: 42, column: 34, scope: !88)
!95 = !DILocation(line: 42, column: 7, scope: !79)
!96 = !DILocalVariable(name: "i", scope: !79, file: !1, line: 39, type: !14)
!97 = !DILocation(line: 0, scope: !79)
!98 = !DILocation(line: 44, column: 12, scope: !99)
!99 = distinct !DILexicalBlock(scope: !100, file: !1, line: 44, column: 7)
!100 = distinct !DILexicalBlock(scope: !88, file: !1, line: 43, column: 5)
!101 = !DILocation(line: 0, scope: !99)
!102 = !DILocation(line: 44, column: 25, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !1, line: 44, column: 7)
!104 = !DILocation(line: 44, column: 21, scope: !103)
!105 = !DILocation(line: 44, column: 7, scope: !99)
!106 = !DILocalVariable(name: "j", scope: !79, file: !1, line: 39, type: !14)
!107 = !DILocation(line: 46, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !109, file: !1, line: 46, column: 11)
!109 = distinct !DILexicalBlock(scope: !103, file: !1, line: 45, column: 9)
!110 = !DILocation(line: 0, scope: !108)
!111 = !DILocation(line: 46, column: 29, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !1, line: 46, column: 11)
!113 = !DILocation(line: 46, column: 25, scope: !112)
!114 = !DILocation(line: 46, column: 11, scope: !108)
!115 = !DILocation(line: 48, column: 21, scope: !116)
!116 = distinct !DILexicalBlock(scope: !117, file: !1, line: 48, column: 19)
!117 = distinct !DILexicalBlock(scope: !112, file: !1, line: 47, column: 13)
!118 = !DILocation(line: 48, column: 19, scope: !116)
!119 = !DILocation(line: 48, column: 34, scope: !116)
!120 = !DILocation(line: 48, column: 32, scope: !116)
!121 = !DILocation(line: 48, column: 29, scope: !116)
!122 = !DILocation(line: 48, column: 19, scope: !117)
!123 = !DILocation(line: 49, column: 17, scope: !116)
!124 = !DILocation(line: 50, column: 13, scope: !117)
!125 = !DILocation(line: 46, column: 36, scope: !112)
!126 = !DILocation(line: 46, column: 11, scope: !112)
!127 = distinct !{!127, !114, !128}
!128 = !DILocation(line: 50, column: 13, scope: !108)
!129 = !DILocation(line: 51, column: 9, scope: !109)
!130 = !DILocation(line: 44, column: 32, scope: !103)
!131 = !DILocation(line: 44, column: 7, scope: !103)
!132 = distinct !{!132, !105, !133}
!133 = !DILocation(line: 51, column: 9, scope: !99)
!134 = !DILocation(line: 52, column: 5, scope: !100)
!135 = !DILocation(line: 55, column: 5, scope: !88)
!136 = !DILocation(line: 57, column: 3, scope: !79)
!137 = !DILocation(line: 58, column: 1, scope: !79)
!138 = distinct !DISubprogram(name: "multiply", scope: !1, file: !1, line: 61, type: !139, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!139 = !DISubroutineType(types: !140)
!140 = !{!10, !10, !10}
!141 = !DILocalVariable(name: "a", arg: 1, scope: !138, file: !1, line: 61, type: !10)
!142 = !DILocation(line: 61, column: 18, scope: !138)
!143 = !DILocalVariable(name: "b", arg: 2, scope: !138, file: !1, line: 61, type: !10)
!144 = !DILocation(line: 61, column: 28, scope: !138)
!145 = !DILocalVariable(name: "c", scope: !138, file: !1, line: 63, type: !10)
!146 = !DILocation(line: 63, column: 10, scope: !138)
!147 = !DILocation(line: 66, column: 9, scope: !148)
!148 = distinct !DILexicalBlock(scope: !138, file: !1, line: 66, column: 7)
!149 = !DILocation(line: 66, column: 19, scope: !148)
!150 = !DILocation(line: 66, column: 14, scope: !148)
!151 = !DILocation(line: 66, column: 7, scope: !138)
!152 = !DILocation(line: 68, column: 18, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !1, line: 67, column: 5)
!154 = !DILocation(line: 68, column: 9, scope: !153)
!155 = !DILocation(line: 68, column: 14, scope: !153)
!156 = !DILocation(line: 69, column: 18, scope: !153)
!157 = !DILocation(line: 69, column: 9, scope: !153)
!158 = !DILocation(line: 69, column: 14, scope: !153)
!159 = !DILocation(line: 71, column: 23, scope: !153)
!160 = !DILocation(line: 71, column: 21, scope: !153)
!161 = !DILocation(line: 71, column: 28, scope: !153)
!162 = !DILocation(line: 71, column: 13, scope: !153)
!163 = !DILocation(line: 71, column: 9, scope: !153)
!164 = !DILocation(line: 71, column: 11, scope: !153)
!165 = !DILocalVariable(name: "i", scope: !138, file: !1, line: 64, type: !14)
!166 = !DILocation(line: 0, scope: !138)
!167 = !DILocation(line: 73, column: 12, scope: !168)
!168 = distinct !DILexicalBlock(scope: !153, file: !1, line: 73, column: 7)
!169 = !DILocation(line: 0, scope: !168)
!170 = !DILocalVariable(name: "j", scope: !138, file: !1, line: 64, type: !14)
!171 = !DILocation(line: 73, column: 25, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !1, line: 73, column: 7)
!173 = !DILocation(line: 73, column: 21, scope: !172)
!174 = !DILocation(line: 73, column: 7, scope: !168)
!175 = !DILocation(line: 75, column: 30, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !1, line: 74, column: 9)
!177 = !DILocation(line: 75, column: 28, scope: !176)
!178 = !DILocation(line: 75, column: 35, scope: !176)
!179 = !DILocation(line: 75, column: 20, scope: !176)
!180 = !DILocation(line: 75, column: 13, scope: !176)
!181 = !DILocation(line: 75, column: 11, scope: !176)
!182 = !DILocation(line: 75, column: 18, scope: !176)
!183 = !DILocation(line: 76, column: 29, scope: !176)
!184 = !{!"branch_weights", i32 1, i32 1048575}
!185 = !DILocation(line: 76, column: 25, scope: !176)
!186 = !DILocation(line: 76, column: 23, scope: !176)
!187 = !DILocation(line: 76, column: 13, scope: !176)
!188 = !DILocation(line: 76, column: 11, scope: !176)
!189 = !DILocation(line: 76, column: 21, scope: !176)
!190 = !DILocation(line: 77, column: 16, scope: !191)
!191 = distinct !DILexicalBlock(scope: !176, file: !1, line: 77, column: 11)
!192 = !DILocation(line: 0, scope: !191)
!193 = !DILocation(line: 77, column: 29, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !1, line: 77, column: 11)
!195 = !DILocation(line: 77, column: 25, scope: !194)
!196 = !DILocation(line: 77, column: 11, scope: !191)
!197 = !DILocation(line: 79, column: 30, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !1, line: 78, column: 13)
!199 = !DILocation(line: 79, column: 28, scope: !198)
!200 = !DILocation(line: 79, column: 42, scope: !198)
!201 = !DILocation(line: 79, column: 40, scope: !198)
!202 = !DILocation(line: 79, column: 38, scope: !198)
!203 = !DILocation(line: 79, column: 17, scope: !198)
!204 = !DILocation(line: 79, column: 15, scope: !198)
!205 = !DILocation(line: 79, column: 25, scope: !198)
!206 = !DILocation(line: 80, column: 13, scope: !198)
!207 = !DILocation(line: 77, column: 36, scope: !194)
!208 = !DILocation(line: 77, column: 11, scope: !194)
!209 = distinct !{!209, !196, !210}
!210 = !DILocation(line: 80, column: 13, scope: !191)
!211 = !DILocation(line: 81, column: 9, scope: !176)
!212 = !DILocation(line: 73, column: 32, scope: !172)
!213 = !DILocation(line: 73, column: 7, scope: !172)
!214 = distinct !{!214, !174, !215}
!215 = !DILocation(line: 81, column: 9, scope: !168)
!216 = !DILocation(line: 83, column: 5, scope: !153)
!217 = !DILocation(line: 85, column: 3, scope: !138)
!218 = distinct !DISubprogram(name: "isNormal", scope: !1, file: !1, line: 89, type: !80, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!219 = !DILocalVariable(name: "a", arg: 1, scope: !218, file: !1, line: 89, type: !10)
!220 = !DILocation(line: 89, column: 18, scope: !218)
!221 = !DILocalVariable(name: "a_ah", scope: !218, file: !1, line: 92, type: !10)
!222 = !DILocation(line: 92, column: 10, scope: !218)
!223 = !DILocalVariable(name: "ah_a", scope: !218, file: !1, line: 92, type: !10)
!224 = !DILocation(line: 92, column: 16, scope: !218)
!225 = !DILocation(line: 94, column: 9, scope: !226)
!226 = distinct !DILexicalBlock(scope: !218, file: !1, line: 94, column: 7)
!227 = !DILocation(line: 94, column: 19, scope: !226)
!228 = !DILocation(line: 94, column: 14, scope: !226)
!229 = !DILocation(line: 94, column: 7, scope: !218)
!230 = !DILocation(line: 95, column: 5, scope: !226)
!231 = !DILocation(line: 97, column: 23, scope: !218)
!232 = !DILocation(line: 97, column: 10, scope: !218)
!233 = !DILocation(line: 98, column: 20, scope: !218)
!234 = !DILocation(line: 98, column: 10, scope: !218)
!235 = !DILocalVariable(name: "i", scope: !218, file: !1, line: 91, type: !14)
!236 = !DILocation(line: 0, scope: !218)
!237 = !DILocation(line: 100, column: 8, scope: !238)
!238 = distinct !DILexicalBlock(scope: !218, file: !1, line: 100, column: 3)
!239 = !DILocation(line: 0, scope: !238)
!240 = !DILocation(line: 100, column: 21, scope: !241)
!241 = distinct !DILexicalBlock(scope: !238, file: !1, line: 100, column: 3)
!242 = !DILocation(line: 100, column: 17, scope: !241)
!243 = !DILocation(line: 100, column: 3, scope: !238)
!244 = !DILocalVariable(name: "j", scope: !218, file: !1, line: 91, type: !14)
!245 = !DILocation(line: 102, column: 12, scope: !246)
!246 = distinct !DILexicalBlock(scope: !247, file: !1, line: 102, column: 7)
!247 = distinct !DILexicalBlock(scope: !241, file: !1, line: 101, column: 5)
!248 = !DILocation(line: 0, scope: !246)
!249 = !DILocation(line: 102, column: 25, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !1, line: 102, column: 7)
!251 = !DILocation(line: 102, column: 21, scope: !250)
!252 = !DILocation(line: 102, column: 7, scope: !246)
!253 = !DILocation(line: 104, column: 20, scope: !254)
!254 = distinct !DILexicalBlock(scope: !255, file: !1, line: 104, column: 15)
!255 = distinct !DILexicalBlock(scope: !250, file: !1, line: 103, column: 9)
!256 = !DILocation(line: 104, column: 15, scope: !254)
!257 = !DILocation(line: 104, column: 36, scope: !254)
!258 = !DILocation(line: 104, column: 31, scope: !254)
!259 = !DILocation(line: 104, column: 28, scope: !254)
!260 = !DILocation(line: 104, column: 15, scope: !255)
!261 = !DILocation(line: 105, column: 13, scope: !254)
!262 = !DILocation(line: 106, column: 9, scope: !255)
!263 = !DILocation(line: 102, column: 32, scope: !250)
!264 = !DILocation(line: 102, column: 7, scope: !250)
!265 = distinct !{!265, !252, !266}
!266 = !DILocation(line: 106, column: 9, scope: !246)
!267 = !DILocation(line: 107, column: 5, scope: !247)
!268 = !DILocation(line: 100, column: 28, scope: !241)
!269 = !DILocation(line: 100, column: 3, scope: !241)
!270 = distinct !{!270, !243, !271}
!271 = !DILocation(line: 107, column: 5, scope: !238)
!272 = !DILocation(line: 109, column: 3, scope: !218)
!273 = !DILocation(line: 110, column: 1, scope: !218)
!274 = distinct !DISubprogram(name: "isUnitary", scope: !1, file: !1, line: 113, type: !80, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!275 = !DILocalVariable(name: "a", arg: 1, scope: !274, file: !1, line: 113, type: !10)
!276 = !DILocation(line: 113, column: 19, scope: !274)
!277 = !DILocalVariable(name: "b", scope: !274, file: !1, line: 115, type: !10)
!278 = !DILocation(line: 115, column: 10, scope: !274)
!279 = !DILocation(line: 117, column: 7, scope: !280)
!280 = distinct !DILexicalBlock(scope: !274, file: !1, line: 117, column: 7)
!281 = !DILocation(line: 117, column: 20, scope: !280)
!282 = !DILocation(line: 117, column: 7, scope: !274)
!283 = !DILocation(line: 119, column: 24, scope: !284)
!284 = distinct !DILexicalBlock(scope: !280, file: !1, line: 118, column: 5)
!285 = !DILocation(line: 119, column: 11, scope: !284)
!286 = !DILocalVariable(name: "i", scope: !274, file: !1, line: 116, type: !14)
!287 = !DILocation(line: 0, scope: !274)
!288 = !DILocation(line: 121, column: 12, scope: !289)
!289 = distinct !DILexicalBlock(scope: !284, file: !1, line: 121, column: 7)
!290 = !DILocation(line: 0, scope: !289)
!291 = !DILocation(line: 121, column: 25, scope: !292)
!292 = distinct !DILexicalBlock(scope: !289, file: !1, line: 121, column: 7)
!293 = !DILocation(line: 121, column: 21, scope: !292)
!294 = !DILocation(line: 121, column: 7, scope: !289)
!295 = !DILocalVariable(name: "j", scope: !274, file: !1, line: 116, type: !14)
!296 = !DILocation(line: 123, column: 16, scope: !297)
!297 = distinct !DILexicalBlock(scope: !298, file: !1, line: 123, column: 11)
!298 = distinct !DILexicalBlock(scope: !292, file: !1, line: 122, column: 9)
!299 = !DILocation(line: 0, scope: !297)
!300 = !DILocation(line: 123, column: 29, scope: !301)
!301 = distinct !DILexicalBlock(scope: !297, file: !1, line: 123, column: 11)
!302 = !DILocation(line: 123, column: 25, scope: !301)
!303 = !DILocation(line: 123, column: 11, scope: !297)
!304 = !DILocation(line: 125, column: 22, scope: !305)
!305 = distinct !DILexicalBlock(scope: !306, file: !1, line: 125, column: 19)
!306 = distinct !DILexicalBlock(scope: !301, file: !1, line: 124, column: 13)
!307 = !DILocation(line: 125, column: 27, scope: !305)
!308 = !DILocation(line: 125, column: 32, scope: !305)
!309 = !DILocation(line: 125, column: 30, scope: !305)
!310 = !DILocation(line: 125, column: 40, scope: !305)
!311 = !DILocation(line: 125, column: 46, scope: !305)
!312 = !DILocation(line: 125, column: 52, scope: !305)
!313 = !DILocation(line: 125, column: 57, scope: !305)
!314 = !DILocation(line: 125, column: 62, scope: !305)
!315 = !DILocation(line: 125, column: 60, scope: !305)
!316 = !DILocation(line: 125, column: 70, scope: !305)
!317 = !DILocation(line: 125, column: 19, scope: !306)
!318 = !DILocation(line: 126, column: 17, scope: !305)
!319 = !DILocation(line: 127, column: 13, scope: !306)
!320 = !DILocation(line: 123, column: 36, scope: !301)
!321 = !DILocation(line: 123, column: 11, scope: !301)
!322 = distinct !{!322, !303, !323}
!323 = !DILocation(line: 127, column: 13, scope: !297)
!324 = !DILocation(line: 128, column: 9, scope: !298)
!325 = !DILocation(line: 121, column: 32, scope: !292)
!326 = !DILocation(line: 121, column: 7, scope: !292)
!327 = distinct !{!327, !294, !328}
!328 = !DILocation(line: 128, column: 9, scope: !289)
!329 = !DILocation(line: 129, column: 7, scope: !284)
!330 = !DILocation(line: 131, column: 3, scope: !274)
!331 = !DILocation(line: 132, column: 1, scope: !274)
!332 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 136, type: !333, scopeLine: 137, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!333 = !DISubroutineType(types: !334)
!334 = !{!14}
!335 = !DILocalVariable(name: "z", scope: !332, file: !1, line: 138, type: !19)
!336 = !DILocation(line: 138, column: 11, scope: !332)
!337 = !DILocation(line: 138, column: 21, scope: !332)
!338 = !DILocation(line: 138, column: 17, scope: !332)
!339 = !DILocation(line: 138, column: 15, scope: !332)
!340 = !DILocalVariable(name: "a", scope: !332, file: !1, line: 139, type: !10)
!341 = !DILocation(line: 139, column: 10, scope: !332)
!342 = !DILocalVariable(name: "aT", scope: !332, file: !1, line: 139, type: !10)
!343 = !DILocation(line: 139, column: 13, scope: !332)
!344 = !DILocation(line: 141, column: 3, scope: !332)
!345 = !DILocation(line: 142, column: 21, scope: !332)
!346 = !DILocation(line: 142, column: 30, scope: !332)
!347 = !DILocation(line: 142, column: 3, scope: !332)
!348 = !DILocation(line: 144, column: 19, scope: !332)
!349 = !DILocation(line: 144, column: 17, scope: !332)
!350 = !DILocation(line: 144, column: 24, scope: !332)
!351 = !DILocation(line: 144, column: 9, scope: !332)
!352 = !DILocation(line: 144, column: 5, scope: !332)
!353 = !DILocation(line: 144, column: 7, scope: !332)
!354 = !DILocation(line: 145, column: 3, scope: !332)
!355 = !DILocalVariable(name: "i", scope: !332, file: !1, line: 140, type: !14)
!356 = !DILocation(line: 0, scope: !332)
!357 = !DILocation(line: 146, column: 8, scope: !358)
!358 = distinct !DILexicalBlock(scope: !332, file: !1, line: 146, column: 3)
!359 = !DILocation(line: 0, scope: !358)
!360 = !DILocation(line: 146, column: 21, scope: !361)
!361 = distinct !DILexicalBlock(scope: !358, file: !1, line: 146, column: 3)
!362 = !DILocation(line: 146, column: 17, scope: !361)
!363 = !DILocation(line: 146, column: 3, scope: !358)
!364 = !DILocation(line: 148, column: 7, scope: !365)
!365 = distinct !DILexicalBlock(scope: !361, file: !1, line: 147, column: 5)
!366 = !DILocation(line: 149, column: 26, scope: !365)
!367 = !DILocation(line: 149, column: 24, scope: !365)
!368 = !DILocation(line: 149, column: 31, scope: !365)
!369 = !DILocation(line: 149, column: 16, scope: !365)
!370 = !DILocation(line: 149, column: 9, scope: !365)
!371 = !DILocation(line: 149, column: 7, scope: !365)
!372 = !DILocation(line: 149, column: 14, scope: !365)
!373 = !DILocalVariable(name: "j", scope: !332, file: !1, line: 140, type: !14)
!374 = !DILocation(line: 150, column: 12, scope: !375)
!375 = distinct !DILexicalBlock(scope: !365, file: !1, line: 150, column: 7)
!376 = !DILocation(line: 0, scope: !375)
!377 = !DILocation(line: 150, column: 25, scope: !378)
!378 = distinct !DILexicalBlock(scope: !375, file: !1, line: 150, column: 7)
!379 = !DILocation(line: 150, column: 21, scope: !378)
!380 = !DILocation(line: 150, column: 7, scope: !375)
!381 = !DILocation(line: 152, column: 23, scope: !382)
!382 = distinct !DILexicalBlock(scope: !378, file: !1, line: 151, column: 9)
!383 = !DILocation(line: 152, column: 31, scope: !382)
!384 = !DILocation(line: 152, column: 38, scope: !382)
!385 = !DILocation(line: 152, column: 46, scope: !382)
!386 = !DILocation(line: 152, column: 51, scope: !382)
!387 = !DILocation(line: 152, column: 36, scope: !382)
!388 = !DILocation(line: 152, column: 13, scope: !382)
!389 = !DILocation(line: 152, column: 11, scope: !382)
!390 = !DILocation(line: 152, column: 21, scope: !382)
!391 = !DILocation(line: 153, column: 42, scope: !382)
!392 = !DILocation(line: 153, column: 40, scope: !382)
!393 = !DILocation(line: 153, column: 61, scope: !382)
!394 = !DILocation(line: 153, column: 59, scope: !382)
!395 = !DILocation(line: 153, column: 11, scope: !382)
!396 = !DILocation(line: 154, column: 9, scope: !382)
!397 = !DILocation(line: 150, column: 32, scope: !378)
!398 = !DILocation(line: 150, column: 7, scope: !378)
!399 = distinct !{!399, !380, !400}
!400 = !DILocation(line: 154, column: 9, scope: !375)
!401 = !DILocation(line: 155, column: 5, scope: !365)
!402 = !DILocation(line: 146, column: 28, scope: !361)
!403 = !DILocation(line: 146, column: 3, scope: !361)
!404 = distinct !{!404, !363, !405}
!405 = !DILocation(line: 155, column: 5, scope: !358)
!406 = !DILocation(line: 157, column: 8, scope: !332)
!407 = !DILocation(line: 159, column: 3, scope: !332)
!408 = !DILocation(line: 160, column: 8, scope: !409)
!409 = distinct !DILexicalBlock(scope: !332, file: !1, line: 160, column: 3)
!410 = !DILocation(line: 0, scope: !409)
!411 = !DILocation(line: 160, column: 22, scope: !412)
!412 = distinct !DILexicalBlock(scope: !409, file: !1, line: 160, column: 3)
!413 = !DILocation(line: 160, column: 17, scope: !412)
!414 = !DILocation(line: 160, column: 3, scope: !409)
!415 = !DILocation(line: 162, column: 7, scope: !416)
!416 = distinct !DILexicalBlock(scope: !412, file: !1, line: 161, column: 5)
!417 = !DILocation(line: 163, column: 28, scope: !416)
!418 = !DILocation(line: 163, column: 25, scope: !416)
!419 = !DILocation(line: 163, column: 33, scope: !416)
!420 = !DILocation(line: 163, column: 17, scope: !416)
!421 = !DILocation(line: 163, column: 10, scope: !416)
!422 = !DILocation(line: 163, column: 7, scope: !416)
!423 = !DILocation(line: 163, column: 15, scope: !416)
!424 = !DILocation(line: 164, column: 12, scope: !425)
!425 = distinct !DILexicalBlock(scope: !416, file: !1, line: 164, column: 7)
!426 = !DILocation(line: 0, scope: !425)
!427 = !DILocation(line: 164, column: 26, scope: !428)
!428 = distinct !DILexicalBlock(scope: !425, file: !1, line: 164, column: 7)
!429 = !DILocation(line: 164, column: 21, scope: !428)
!430 = !DILocation(line: 164, column: 7, scope: !425)
!431 = !DILocation(line: 166, column: 24, scope: !432)
!432 = distinct !DILexicalBlock(scope: !428, file: !1, line: 165, column: 9)
!433 = !DILocation(line: 166, column: 32, scope: !432)
!434 = !DILocation(line: 166, column: 39, scope: !432)
!435 = !DILocation(line: 166, column: 47, scope: !432)
!436 = !DILocation(line: 166, column: 52, scope: !432)
!437 = !DILocation(line: 166, column: 37, scope: !432)
!438 = !DILocation(line: 166, column: 14, scope: !432)
!439 = !DILocation(line: 166, column: 11, scope: !432)
!440 = !DILocation(line: 166, column: 22, scope: !432)
!441 = !DILocation(line: 167, column: 43, scope: !432)
!442 = !DILocation(line: 167, column: 40, scope: !432)
!443 = !DILocation(line: 167, column: 63, scope: !432)
!444 = !DILocation(line: 167, column: 60, scope: !432)
!445 = !DILocation(line: 167, column: 11, scope: !432)
!446 = !DILocation(line: 168, column: 9, scope: !432)
!447 = !DILocation(line: 164, column: 33, scope: !428)
!448 = !DILocation(line: 164, column: 7, scope: !428)
!449 = distinct !{!449, !430, !450}
!450 = !DILocation(line: 168, column: 9, scope: !425)
!451 = !DILocation(line: 169, column: 5, scope: !416)
!452 = !DILocation(line: 160, column: 29, scope: !412)
!453 = !DILocation(line: 160, column: 3, scope: !412)
!454 = distinct !{!454, !414, !455}
!455 = !DILocation(line: 169, column: 5, scope: !409)
!456 = !DILocation(line: 172, column: 11, scope: !332)
!457 = !DILocation(line: 172, column: 27, scope: !332)
!458 = !DILocation(line: 171, column: 3, scope: !332)
!459 = !DILocation(line: 174, column: 11, scope: !332)
!460 = !DILocation(line: 174, column: 25, scope: !332)
!461 = !DILocation(line: 173, column: 3, scope: !332)
!462 = !DILocation(line: 176, column: 11, scope: !332)
!463 = !DILocation(line: 176, column: 24, scope: !332)
!464 = !DILocation(line: 175, column: 3, scope: !332)
!465 = !DILocation(line: 180, column: 3, scope: !332)
