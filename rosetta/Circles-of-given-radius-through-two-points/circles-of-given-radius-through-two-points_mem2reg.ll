; ModuleID = 'circles-of-given-radius-through-two-points.ll'
source_filename = "circles-of-given-radius-through-two-points.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.point = type { double, double }

@.str = private unnamed_addr constant [45 x i8] c"\0ANo circles can be drawn through (%.4f,%.4f)\00", align 1
@.str.1 = private unnamed_addr constant [58 x i8] c"\0AInfinitely many circles can be drawn through (%.4f,%.4f)\00", align 1
@.str.2 = private unnamed_addr constant [100 x i8] c"\0AGiven points are opposite ends of a diameter of the circle with center (%.4f,%.4f) and radius %.4f\00", align 1
@.str.3 = private unnamed_addr constant [92 x i8] c"\0AGiven points are farther away from each other than a diameter of a circle with radius %.4f\00", align 1
@.str.4 = private unnamed_addr constant [27 x i8] c"\0ATwo circles are possible.\00", align 1
@.str.5 = private unnamed_addr constant [99 x i8] c"\0ACircle C1 with center (%.4f,%.4f), radius %.4f and Circle C2 with center (%.4f,%.4f), radius %.4f\00", align 1
@__const.main.cases = private unnamed_addr constant [10 x %struct.point] [%struct.point { double 1.234000e-01, double 9.876000e-01 }, %struct.point { double 8.765000e-01, double 2.345000e-01 }, %struct.point { double 0.000000e+00, double 2.000000e+00 }, %struct.point zeroinitializer, %struct.point { double 1.234000e-01, double 9.876000e-01 }, %struct.point { double 1.234000e-01, double 9.876000e-01 }, %struct.point { double 1.234000e-01, double 9.876000e-01 }, %struct.point { double 8.765000e-01, double 2.345000e-01 }, %struct.point { double 1.234000e-01, double 9.876000e-01 }, %struct.point { double 1.234000e-01, double 9.876000e-01 }], align 16
@.str.6 = private unnamed_addr constant [10 x i8] c"\0ACase %d)\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @distance(double %p1.coerce0, double %p1.coerce1, double %p2.coerce0, double %p2.coerce1) #0 !dbg !7 {
entry:
  %p1 = alloca %struct.point, align 8
  %p2 = alloca %struct.point, align 8
  %0 = bitcast %struct.point* %p1 to { double, double }*
  %1 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 0
  store double %p1.coerce0, double* %1, align 8
  %2 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 1
  store double %p1.coerce1, double* %2, align 8
  %3 = bitcast %struct.point* %p2 to { double, double }*
  %4 = getelementptr inbounds { double, double }, { double, double }* %3, i32 0, i32 0
  store double %p2.coerce0, double* %4, align 8
  %5 = getelementptr inbounds { double, double }, { double, double }* %3, i32 0, i32 1
  store double %p2.coerce1, double* %5, align 8
  call void @llvm.dbg.declare(metadata %struct.point* %p1, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata %struct.point* %p2, metadata !18, metadata !DIExpression()), !dbg !19
  %x = getelementptr inbounds %struct.point, %struct.point* %p1, i32 0, i32 0, !dbg !20
  %6 = load double, double* %x, align 8, !dbg !20
  %x1 = getelementptr inbounds %struct.point, %struct.point* %p2, i32 0, i32 0, !dbg !21
  %7 = load double, double* %x1, align 8, !dbg !21
  %sub = fsub double %6, %7, !dbg !22
  %x2 = getelementptr inbounds %struct.point, %struct.point* %p1, i32 0, i32 0, !dbg !23
  %8 = load double, double* %x2, align 8, !dbg !23
  %x3 = getelementptr inbounds %struct.point, %struct.point* %p2, i32 0, i32 0, !dbg !24
  %9 = load double, double* %x3, align 8, !dbg !24
  %sub4 = fsub double %8, %9, !dbg !25
  %mul = fmul double %sub, %sub4, !dbg !26
  %y = getelementptr inbounds %struct.point, %struct.point* %p1, i32 0, i32 1, !dbg !27
  %10 = load double, double* %y, align 8, !dbg !27
  %y5 = getelementptr inbounds %struct.point, %struct.point* %p2, i32 0, i32 1, !dbg !28
  %11 = load double, double* %y5, align 8, !dbg !28
  %sub6 = fsub double %10, %11, !dbg !29
  %y7 = getelementptr inbounds %struct.point, %struct.point* %p1, i32 0, i32 1, !dbg !30
  %12 = load double, double* %y7, align 8, !dbg !30
  %y8 = getelementptr inbounds %struct.point, %struct.point* %p2, i32 0, i32 1, !dbg !31
  %13 = load double, double* %y8, align 8, !dbg !31
  %sub9 = fsub double %12, %13, !dbg !32
  %mul10 = fmul double %sub6, %sub9, !dbg !33
  %add = fadd double %mul, %mul10, !dbg !34
  %call = call double @sqrt(double %add) #5, !dbg !35
  ret double %call, !dbg !36
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @findCircles(double %p1.coerce0, double %p1.coerce1, double %p2.coerce0, double %p2.coerce1, double %radius) #0 !dbg !37 {
entry:
  %p1 = alloca %struct.point, align 8
  %p2 = alloca %struct.point, align 8
  %0 = bitcast %struct.point* %p1 to { double, double }*
  %1 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 0
  store double %p1.coerce0, double* %1, align 8
  %2 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 1
  store double %p1.coerce1, double* %2, align 8
  %3 = bitcast %struct.point* %p2 to { double, double }*
  %4 = getelementptr inbounds { double, double }, { double, double }* %3, i32 0, i32 0
  store double %p2.coerce0, double* %4, align 8
  %5 = getelementptr inbounds { double, double }, { double, double }* %3, i32 0, i32 1
  store double %p2.coerce1, double* %5, align 8
  call void @llvm.dbg.declare(metadata %struct.point* %p1, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata %struct.point* %p2, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.value(metadata double %radius, metadata !44, metadata !DIExpression()), !dbg !45
  %6 = bitcast %struct.point* %p1 to { double, double }*, !dbg !46
  %7 = getelementptr inbounds { double, double }, { double, double }* %6, i32 0, i32 0, !dbg !46
  %8 = load double, double* %7, align 8, !dbg !46
  %9 = getelementptr inbounds { double, double }, { double, double }* %6, i32 0, i32 1, !dbg !46
  %10 = load double, double* %9, align 8, !dbg !46
  %11 = bitcast %struct.point* %p2 to { double, double }*, !dbg !46
  %12 = getelementptr inbounds { double, double }, { double, double }* %11, i32 0, i32 0, !dbg !46
  %13 = load double, double* %12, align 8, !dbg !46
  %14 = getelementptr inbounds { double, double }, { double, double }* %11, i32 0, i32 1, !dbg !46
  %15 = load double, double* %14, align 8, !dbg !46
  %call = call double @distance(double %8, double %10, double %13, double %15), !dbg !46
  call void @llvm.dbg.value(metadata double %call, metadata !47, metadata !DIExpression()), !dbg !45
  %cmp = fcmp oeq double %call, 0.000000e+00, !dbg !48
  br i1 %cmp, label %if.then, label %if.else, !dbg !50

if.then:                                          ; preds = %entry
  %cmp1 = fcmp oeq double %radius, 0.000000e+00, !dbg !51
  br i1 %cmp1, label %cond.true, label %cond.false, !dbg !53

cond.true:                                        ; preds = %if.then
  %x = getelementptr inbounds %struct.point, %struct.point* %p1, i32 0, i32 0, !dbg !54
  %16 = load double, double* %x, align 8, !dbg !54
  %y = getelementptr inbounds %struct.point, %struct.point* %p1, i32 0, i32 1, !dbg !55
  %17 = load double, double* %y, align 8, !dbg !55
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i64 0, i64 0), double %16, double %17), !dbg !56
  br label %cond.end, !dbg !53

cond.false:                                       ; preds = %if.then
  %x3 = getelementptr inbounds %struct.point, %struct.point* %p1, i32 0, i32 0, !dbg !57
  %18 = load double, double* %x3, align 8, !dbg !57
  %y4 = getelementptr inbounds %struct.point, %struct.point* %p1, i32 0, i32 1, !dbg !58
  %19 = load double, double* %y4, align 8, !dbg !58
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.1, i64 0, i64 0), double %18, double %19), !dbg !59
  br label %cond.end, !dbg !53

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call2, %cond.true ], [ %call5, %cond.false ], !dbg !53
  br label %if.end68, !dbg !60

if.else:                                          ; preds = %entry
  %mul = fmul double 2.000000e+00, %radius, !dbg !61
  %cmp6 = fcmp oeq double %call, %mul, !dbg !63
  br i1 %cmp6, label %if.then7, label %if.else15, !dbg !64

if.then7:                                         ; preds = %if.else
  %x8 = getelementptr inbounds %struct.point, %struct.point* %p1, i32 0, i32 0, !dbg !65
  %20 = load double, double* %x8, align 8, !dbg !65
  %x9 = getelementptr inbounds %struct.point, %struct.point* %p2, i32 0, i32 0, !dbg !67
  %21 = load double, double* %x9, align 8, !dbg !67
  %add = fadd double %20, %21, !dbg !68
  %div = fdiv double %add, 2.000000e+00, !dbg !69
  %y10 = getelementptr inbounds %struct.point, %struct.point* %p1, i32 0, i32 1, !dbg !70
  %22 = load double, double* %y10, align 8, !dbg !70
  %y11 = getelementptr inbounds %struct.point, %struct.point* %p2, i32 0, i32 1, !dbg !71
  %23 = load double, double* %y11, align 8, !dbg !71
  %add12 = fadd double %22, %23, !dbg !72
  %div13 = fdiv double %add12, 2.000000e+00, !dbg !73
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i64 0, i64 0), double %div, double %div13, double %radius), !dbg !74
  br label %if.end67, !dbg !75

if.else15:                                        ; preds = %if.else
  %mul16 = fmul double 2.000000e+00, %radius, !dbg !76
  %cmp17 = fcmp ogt double %call, %mul16, !dbg !78
  br i1 %cmp17, label %if.then18, label %if.else20, !dbg !79

if.then18:                                        ; preds = %if.else15
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([92 x i8], [92 x i8]* @.str.3, i64 0, i64 0), double %radius), !dbg !80
  br label %if.end, !dbg !82

if.else20:                                        ; preds = %if.else15
  %call21 = call double @pow(double %radius, double 2.000000e+00) #5, !dbg !83
  %div22 = fdiv double %call, 2.000000e+00, !dbg !85
  %call23 = call double @pow(double %div22, double 2.000000e+00) #5, !dbg !86
  %sub = fsub double %call21, %call23, !dbg !87
  %call24 = call double @sqrt(double %sub) #5, !dbg !88
  call void @llvm.dbg.value(metadata double %call24, metadata !89, metadata !DIExpression()), !dbg !45
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  %x26 = getelementptr inbounds %struct.point, %struct.point* %p1, i32 0, i32 0, !dbg !91
  %24 = load double, double* %x26, align 8, !dbg !91
  %x27 = getelementptr inbounds %struct.point, %struct.point* %p2, i32 0, i32 0, !dbg !92
  %25 = load double, double* %x27, align 8, !dbg !92
  %add28 = fadd double %24, %25, !dbg !93
  %div29 = fdiv double %add28, 2.000000e+00, !dbg !94
  %y30 = getelementptr inbounds %struct.point, %struct.point* %p1, i32 0, i32 1, !dbg !95
  %26 = load double, double* %y30, align 8, !dbg !95
  %y31 = getelementptr inbounds %struct.point, %struct.point* %p2, i32 0, i32 1, !dbg !96
  %27 = load double, double* %y31, align 8, !dbg !96
  %sub32 = fsub double %26, %27, !dbg !97
  %mul33 = fmul double %call24, %sub32, !dbg !98
  %div34 = fdiv double %mul33, %call, !dbg !99
  %add35 = fadd double %div29, %div34, !dbg !100
  %y36 = getelementptr inbounds %struct.point, %struct.point* %p1, i32 0, i32 1, !dbg !101
  %28 = load double, double* %y36, align 8, !dbg !101
  %y37 = getelementptr inbounds %struct.point, %struct.point* %p2, i32 0, i32 1, !dbg !102
  %29 = load double, double* %y37, align 8, !dbg !102
  %add38 = fadd double %28, %29, !dbg !103
  %div39 = fdiv double %add38, 2.000000e+00, !dbg !104
  %x40 = getelementptr inbounds %struct.point, %struct.point* %p2, i32 0, i32 0, !dbg !105
  %30 = load double, double* %x40, align 8, !dbg !105
  %x41 = getelementptr inbounds %struct.point, %struct.point* %p1, i32 0, i32 0, !dbg !106
  %31 = load double, double* %x41, align 8, !dbg !106
  %sub42 = fsub double %30, %31, !dbg !107
  %mul43 = fmul double %call24, %sub42, !dbg !108
  %div44 = fdiv double %mul43, %call, !dbg !109
  %add45 = fadd double %div39, %div44, !dbg !110
  %x46 = getelementptr inbounds %struct.point, %struct.point* %p1, i32 0, i32 0, !dbg !111
  %32 = load double, double* %x46, align 8, !dbg !111
  %x47 = getelementptr inbounds %struct.point, %struct.point* %p2, i32 0, i32 0, !dbg !112
  %33 = load double, double* %x47, align 8, !dbg !112
  %add48 = fadd double %32, %33, !dbg !113
  %div49 = fdiv double %add48, 2.000000e+00, !dbg !114
  %y50 = getelementptr inbounds %struct.point, %struct.point* %p1, i32 0, i32 1, !dbg !115
  %34 = load double, double* %y50, align 8, !dbg !115
  %y51 = getelementptr inbounds %struct.point, %struct.point* %p2, i32 0, i32 1, !dbg !116
  %35 = load double, double* %y51, align 8, !dbg !116
  %sub52 = fsub double %34, %35, !dbg !117
  %mul53 = fmul double %call24, %sub52, !dbg !118
  %div54 = fdiv double %mul53, %call, !dbg !119
  %sub55 = fsub double %div49, %div54, !dbg !120
  %y56 = getelementptr inbounds %struct.point, %struct.point* %p1, i32 0, i32 1, !dbg !121
  %36 = load double, double* %y56, align 8, !dbg !121
  %y57 = getelementptr inbounds %struct.point, %struct.point* %p2, i32 0, i32 1, !dbg !122
  %37 = load double, double* %y57, align 8, !dbg !122
  %add58 = fadd double %36, %37, !dbg !123
  %div59 = fdiv double %add58, 2.000000e+00, !dbg !124
  %x60 = getelementptr inbounds %struct.point, %struct.point* %p2, i32 0, i32 0, !dbg !125
  %38 = load double, double* %x60, align 8, !dbg !125
  %x61 = getelementptr inbounds %struct.point, %struct.point* %p1, i32 0, i32 0, !dbg !126
  %39 = load double, double* %x61, align 8, !dbg !126
  %sub62 = fsub double %38, %39, !dbg !127
  %mul63 = fmul double %call24, %sub62, !dbg !128
  %div64 = fdiv double %mul63, %call, !dbg !129
  %sub65 = fsub double %div59, %div64, !dbg !130
  %call66 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([99 x i8], [99 x i8]* @.str.5, i64 0, i64 0), double %add35, double %add45, double %radius, double %sub55, double %sub65, double %radius), !dbg !131
  br label %if.end

if.end:                                           ; preds = %if.else20, %if.then18
  br label %if.end67

if.end67:                                         ; preds = %if.end, %if.then7
  br label %if.end68

if.end68:                                         ; preds = %if.end67, %cond.end
  ret void, !dbg !132
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local double @pow(double, double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !133 {
entry:
  %cases = alloca [10 x %struct.point], align 16
  %radii = alloca [5 x double], align 16
  call void @llvm.dbg.declare(metadata [10 x %struct.point]* %cases, metadata !137, metadata !DIExpression()), !dbg !141
  %0 = bitcast [10 x %struct.point]* %cases to i8*, !dbg !141
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([10 x %struct.point]* @__const.main.cases to i8*), i64 160, i1 false), !dbg !141
  call void @llvm.dbg.declare(metadata [5 x double]* %radii, metadata !142, metadata !DIExpression()), !dbg !146
  %1 = bitcast [5 x double]* %radii to i8*, !dbg !146
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !146
  %2 = bitcast i8* %1 to [5 x double]*, !dbg !146
  %3 = getelementptr inbounds [5 x double], [5 x double]* %2, i32 0, i32 0, !dbg !146
  store double 2.000000e+00, double* %3, align 16, !dbg !146
  %4 = getelementptr inbounds [5 x double], [5 x double]* %2, i32 0, i32 1, !dbg !146
  store double 1.000000e+00, double* %4, align 8, !dbg !146
  %5 = getelementptr inbounds [5 x double], [5 x double]* %2, i32 0, i32 2, !dbg !146
  store double 2.000000e+00, double* %5, align 16, !dbg !146
  %6 = getelementptr inbounds [5 x double], [5 x double]* %2, i32 0, i32 3, !dbg !146
  store double 5.000000e-01, double* %6, align 8, !dbg !146
  call void @llvm.dbg.value(metadata i32 0, metadata !147, metadata !DIExpression()), !dbg !148
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !151
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !147, metadata !DIExpression()), !dbg !148
  %cmp = icmp slt i32 %i.0, 5, !dbg !152
  br i1 %cmp, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %add = add nsw i32 %i.0, 1, !dbg !155
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6, i64 0, i64 0), i32 %add), !dbg !157
  %mul = mul nsw i32 2, %i.0, !dbg !158
  %idxprom = sext i32 %mul to i64, !dbg !159
  %arrayidx = getelementptr inbounds [10 x %struct.point], [10 x %struct.point]* %cases, i64 0, i64 %idxprom, !dbg !159
  %mul1 = mul nsw i32 2, %i.0, !dbg !160
  %add2 = add nsw i32 %mul1, 1, !dbg !161
  %idxprom3 = sext i32 %add2 to i64, !dbg !162
  %arrayidx4 = getelementptr inbounds [10 x %struct.point], [10 x %struct.point]* %cases, i64 0, i64 %idxprom3, !dbg !162
  %idxprom5 = sext i32 %i.0 to i64, !dbg !163
  %arrayidx6 = getelementptr inbounds [5 x double], [5 x double]* %radii, i64 0, i64 %idxprom5, !dbg !163
  %7 = load double, double* %arrayidx6, align 8, !dbg !163
  %8 = bitcast %struct.point* %arrayidx to { double, double }*, !dbg !164
  %9 = getelementptr inbounds { double, double }, { double, double }* %8, i32 0, i32 0, !dbg !164
  %10 = load double, double* %9, align 16, !dbg !164
  %11 = getelementptr inbounds { double, double }, { double, double }* %8, i32 0, i32 1, !dbg !164
  %12 = load double, double* %11, align 8, !dbg !164
  %13 = bitcast %struct.point* %arrayidx4 to { double, double }*, !dbg !164
  %14 = getelementptr inbounds { double, double }, { double, double }* %13, i32 0, i32 0, !dbg !164
  %15 = load double, double* %14, align 16, !dbg !164
  %16 = getelementptr inbounds { double, double }, { double, double }* %13, i32 0, i32 1, !dbg !164
  %17 = load double, double* %16, align 8, !dbg !164
  call void @findCircles(double %10, double %12, double %15, double %17, double %7), !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !166
  call void @llvm.dbg.value(metadata i32 %inc, metadata !147, metadata !DIExpression()), !dbg !148
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !170
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "circles-of-given-radius-through-two-points.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Circles-of-given-radius-through-two-points")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "distance", scope: !1, file: !1, line: 8, type: !8, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !11}
!10 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "point", file: !1, line: 6, baseType: !12)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 4, size: 128, elements: !13)
!13 = !{!14, !15}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !12, file: !1, line: 5, baseType: !10, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !12, file: !1, line: 5, baseType: !10, size: 64, offset: 64)
!16 = !DILocalVariable(name: "p1", arg: 1, scope: !7, file: !1, line: 8, type: !11)
!17 = !DILocation(line: 8, column: 23, scope: !7)
!18 = !DILocalVariable(name: "p2", arg: 2, scope: !7, file: !1, line: 8, type: !11)
!19 = !DILocation(line: 8, column: 32, scope: !7)
!20 = !DILocation(line: 10, column: 18, scope: !7)
!21 = !DILocation(line: 10, column: 23, scope: !7)
!22 = !DILocation(line: 10, column: 19, scope: !7)
!23 = !DILocation(line: 10, column: 30, scope: !7)
!24 = !DILocation(line: 10, column: 35, scope: !7)
!25 = !DILocation(line: 10, column: 31, scope: !7)
!26 = !DILocation(line: 10, column: 25, scope: !7)
!27 = !DILocation(line: 10, column: 42, scope: !7)
!28 = !DILocation(line: 10, column: 47, scope: !7)
!29 = !DILocation(line: 10, column: 43, scope: !7)
!30 = !DILocation(line: 10, column: 54, scope: !7)
!31 = !DILocation(line: 10, column: 59, scope: !7)
!32 = !DILocation(line: 10, column: 55, scope: !7)
!33 = !DILocation(line: 10, column: 49, scope: !7)
!34 = !DILocation(line: 10, column: 37, scope: !7)
!35 = !DILocation(line: 10, column: 9, scope: !7)
!36 = !DILocation(line: 10, column: 2, scope: !7)
!37 = distinct !DISubprogram(name: "findCircles", scope: !1, file: !1, line: 13, type: !38, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{null, !11, !11, !10}
!40 = !DILocalVariable(name: "p1", arg: 1, scope: !37, file: !1, line: 13, type: !11)
!41 = !DILocation(line: 13, column: 24, scope: !37)
!42 = !DILocalVariable(name: "p2", arg: 2, scope: !37, file: !1, line: 13, type: !11)
!43 = !DILocation(line: 13, column: 33, scope: !37)
!44 = !DILocalVariable(name: "radius", arg: 3, scope: !37, file: !1, line: 13, type: !10)
!45 = !DILocation(line: 0, scope: !37)
!46 = !DILocation(line: 15, column: 22, scope: !37)
!47 = !DILocalVariable(name: "separation", scope: !37, file: !1, line: 15, type: !10)
!48 = !DILocation(line: 17, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !37, file: !1, line: 17, column: 5)
!50 = !DILocation(line: 17, column: 5, scope: !37)
!51 = !DILocation(line: 19, column: 10, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !1, line: 18, column: 2)
!53 = !DILocation(line: 19, column: 3, scope: !52)
!54 = !DILocation(line: 19, column: 77, scope: !52)
!55 = !DILocation(line: 19, column: 82, scope: !52)
!56 = !DILocation(line: 19, column: 19, scope: !52)
!57 = !DILocation(line: 20, column: 80, scope: !52)
!58 = !DILocation(line: 20, column: 85, scope: !52)
!59 = !DILocation(line: 20, column: 9, scope: !52)
!60 = !DILocation(line: 21, column: 2, scope: !52)
!61 = !DILocation(line: 23, column: 25, scope: !62)
!62 = distinct !DILexicalBlock(scope: !49, file: !1, line: 23, column: 10)
!63 = !DILocation(line: 23, column: 21, scope: !62)
!64 = !DILocation(line: 23, column: 10, scope: !49)
!65 = !DILocation(line: 25, column: 117, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !1, line: 24, column: 2)
!67 = !DILocation(line: 25, column: 122, scope: !66)
!68 = !DILocation(line: 25, column: 118, scope: !66)
!69 = !DILocation(line: 25, column: 124, scope: !66)
!70 = !DILocation(line: 25, column: 131, scope: !66)
!71 = !DILocation(line: 25, column: 136, scope: !66)
!72 = !DILocation(line: 25, column: 132, scope: !66)
!73 = !DILocation(line: 25, column: 138, scope: !66)
!74 = !DILocation(line: 25, column: 3, scope: !66)
!75 = !DILocation(line: 26, column: 2, scope: !66)
!76 = !DILocation(line: 28, column: 24, scope: !77)
!77 = distinct !DILexicalBlock(scope: !62, file: !1, line: 28, column: 10)
!78 = !DILocation(line: 28, column: 21, scope: !77)
!79 = !DILocation(line: 28, column: 10, scope: !62)
!80 = !DILocation(line: 30, column: 3, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !1, line: 29, column: 2)
!82 = !DILocation(line: 31, column: 2, scope: !81)
!83 = !DILocation(line: 35, column: 24, scope: !84)
!84 = distinct !DILexicalBlock(scope: !77, file: !1, line: 34, column: 2)
!85 = !DILocation(line: 35, column: 54, scope: !84)
!86 = !DILocation(line: 35, column: 40, scope: !84)
!87 = !DILocation(line: 35, column: 38, scope: !84)
!88 = !DILocation(line: 35, column: 19, scope: !84)
!89 = !DILocalVariable(name: "mirrorDistance", scope: !37, file: !1, line: 15, type: !10)
!90 = !DILocation(line: 37, column: 3, scope: !84)
!91 = !DILocation(line: 38, column: 116, scope: !84)
!92 = !DILocation(line: 38, column: 121, scope: !84)
!93 = !DILocation(line: 38, column: 117, scope: !84)
!94 = !DILocation(line: 38, column: 123, scope: !84)
!95 = !DILocation(line: 38, column: 147, scope: !84)
!96 = !DILocation(line: 38, column: 152, scope: !84)
!97 = !DILocation(line: 38, column: 148, scope: !84)
!98 = !DILocation(line: 38, column: 142, scope: !84)
!99 = !DILocation(line: 38, column: 154, scope: !84)
!100 = !DILocation(line: 38, column: 126, scope: !84)
!101 = !DILocation(line: 38, column: 170, scope: !84)
!102 = !DILocation(line: 38, column: 175, scope: !84)
!103 = !DILocation(line: 38, column: 171, scope: !84)
!104 = !DILocation(line: 38, column: 177, scope: !84)
!105 = !DILocation(line: 38, column: 201, scope: !84)
!106 = !DILocation(line: 38, column: 206, scope: !84)
!107 = !DILocation(line: 38, column: 202, scope: !84)
!108 = !DILocation(line: 38, column: 196, scope: !84)
!109 = !DILocation(line: 38, column: 208, scope: !84)
!110 = !DILocation(line: 38, column: 180, scope: !84)
!111 = !DILocation(line: 38, column: 231, scope: !84)
!112 = !DILocation(line: 38, column: 236, scope: !84)
!113 = !DILocation(line: 38, column: 232, scope: !84)
!114 = !DILocation(line: 38, column: 238, scope: !84)
!115 = !DILocation(line: 38, column: 262, scope: !84)
!116 = !DILocation(line: 38, column: 267, scope: !84)
!117 = !DILocation(line: 38, column: 263, scope: !84)
!118 = !DILocation(line: 38, column: 257, scope: !84)
!119 = !DILocation(line: 38, column: 269, scope: !84)
!120 = !DILocation(line: 38, column: 241, scope: !84)
!121 = !DILocation(line: 38, column: 285, scope: !84)
!122 = !DILocation(line: 38, column: 290, scope: !84)
!123 = !DILocation(line: 38, column: 286, scope: !84)
!124 = !DILocation(line: 38, column: 292, scope: !84)
!125 = !DILocation(line: 38, column: 316, scope: !84)
!126 = !DILocation(line: 38, column: 321, scope: !84)
!127 = !DILocation(line: 38, column: 317, scope: !84)
!128 = !DILocation(line: 38, column: 311, scope: !84)
!129 = !DILocation(line: 38, column: 323, scope: !84)
!130 = !DILocation(line: 38, column: 295, scope: !84)
!131 = !DILocation(line: 38, column: 3, scope: !84)
!132 = !DILocation(line: 40, column: 1, scope: !37)
!133 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 42, type: !134, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DISubroutineType(types: !135)
!135 = !{!136}
!136 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!137 = !DILocalVariable(name: "cases", scope: !133, file: !1, line: 46, type: !138)
!138 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 1280, elements: !139)
!139 = !{!140}
!140 = !DISubrange(count: 10)
!141 = !DILocation(line: 46, column: 11, scope: !133)
!142 = !DILocalVariable(name: "radii", scope: !133, file: !1, line: 54, type: !143)
!143 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 320, elements: !144)
!144 = !{!145}
!145 = !DISubrange(count: 5)
!146 = !DILocation(line: 54, column: 12, scope: !133)
!147 = !DILocalVariable(name: "i", scope: !133, file: !1, line: 44, type: !136)
!148 = !DILocation(line: 0, scope: !133)
!149 = !DILocation(line: 56, column: 9, scope: !150)
!150 = distinct !DILexicalBlock(scope: !133, file: !1, line: 56, column: 5)
!151 = !DILocation(line: 0, scope: !150)
!152 = !DILocation(line: 56, column: 14, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !1, line: 56, column: 5)
!154 = !DILocation(line: 56, column: 5, scope: !150)
!155 = !DILocation(line: 58, column: 23, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !1, line: 57, column: 5)
!157 = !DILocation(line: 58, column: 2, scope: !156)
!158 = !DILocation(line: 59, column: 21, scope: !156)
!159 = !DILocation(line: 59, column: 14, scope: !156)
!160 = !DILocation(line: 59, column: 32, scope: !156)
!161 = !DILocation(line: 59, column: 34, scope: !156)
!162 = !DILocation(line: 59, column: 25, scope: !156)
!163 = !DILocation(line: 59, column: 38, scope: !156)
!164 = !DILocation(line: 59, column: 2, scope: !156)
!165 = !DILocation(line: 60, column: 5, scope: !156)
!166 = !DILocation(line: 56, column: 18, scope: !153)
!167 = !DILocation(line: 56, column: 5, scope: !153)
!168 = distinct !{!168, !154, !169}
!169 = !DILocation(line: 60, column: 5, scope: !150)
!170 = !DILocation(line: 62, column: 5, scope: !133)
