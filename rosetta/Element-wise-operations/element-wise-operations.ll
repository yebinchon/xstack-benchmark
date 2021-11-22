; ModuleID = 'element-wise-operations.c'
source_filename = "element-wise-operations.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @eop_add(double** %a, double** %b, double** %c, i32 %w, i32 %h) #0 !dbg !7 {
entry:
  %a.addr = alloca double**, align 8
  %b.addr = alloca double**, align 8
  %c.addr = alloca double**, align 8
  %w.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double** %a, double*** %a.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %a.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store double** %b, double*** %b.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %b.addr, metadata !16, metadata !DIExpression()), !dbg !15
  store double** %c, double*** %c.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %c.addr, metadata !17, metadata !DIExpression()), !dbg !15
  store i32 %w, i32* %w.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %w.addr, metadata !18, metadata !DIExpression()), !dbg !15
  store i32 %h, i32* %h.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %h.addr, metadata !19, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %j, metadata !21, metadata !DIExpression()), !dbg !15
  store i32 0, i32* %i, align 4, !dbg !22
  br label %for.cond, !dbg !22

for.cond:                                         ; preds = %for.inc14, %entry
  %0 = load i32, i32* %i, align 4, !dbg !24
  %1 = load i32, i32* %h.addr, align 4, !dbg !24
  %cmp = icmp slt i32 %0, %1, !dbg !24
  br i1 %cmp, label %for.body, label %for.end16, !dbg !22

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !26
  br label %for.cond1, !dbg !26

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !28
  %3 = load i32, i32* %w.addr, align 4, !dbg !28
  %cmp2 = icmp slt i32 %2, %3, !dbg !28
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !26

for.body3:                                        ; preds = %for.cond1
  %4 = load double**, double*** %a.addr, align 8, !dbg !28
  %5 = load i32, i32* %i, align 4, !dbg !28
  %idxprom = sext i32 %5 to i64, !dbg !28
  %arrayidx = getelementptr inbounds double*, double** %4, i64 %idxprom, !dbg !28
  %6 = load double*, double** %arrayidx, align 8, !dbg !28
  %7 = load i32, i32* %j, align 4, !dbg !28
  %idxprom4 = sext i32 %7 to i64, !dbg !28
  %arrayidx5 = getelementptr inbounds double, double* %6, i64 %idxprom4, !dbg !28
  %8 = load double, double* %arrayidx5, align 8, !dbg !28
  %9 = load double**, double*** %b.addr, align 8, !dbg !28
  %10 = load i32, i32* %i, align 4, !dbg !28
  %idxprom6 = sext i32 %10 to i64, !dbg !28
  %arrayidx7 = getelementptr inbounds double*, double** %9, i64 %idxprom6, !dbg !28
  %11 = load double*, double** %arrayidx7, align 8, !dbg !28
  %12 = load i32, i32* %j, align 4, !dbg !28
  %idxprom8 = sext i32 %12 to i64, !dbg !28
  %arrayidx9 = getelementptr inbounds double, double* %11, i64 %idxprom8, !dbg !28
  %13 = load double, double* %arrayidx9, align 8, !dbg !28
  %add = fadd double %8, %13, !dbg !28
  %14 = load double**, double*** %c.addr, align 8, !dbg !28
  %15 = load i32, i32* %i, align 4, !dbg !28
  %idxprom10 = sext i32 %15 to i64, !dbg !28
  %arrayidx11 = getelementptr inbounds double*, double** %14, i64 %idxprom10, !dbg !28
  %16 = load double*, double** %arrayidx11, align 8, !dbg !28
  %17 = load i32, i32* %j, align 4, !dbg !28
  %idxprom12 = sext i32 %17 to i64, !dbg !28
  %arrayidx13 = getelementptr inbounds double, double* %16, i64 %idxprom12, !dbg !28
  store double %add, double* %arrayidx13, align 8, !dbg !28
  br label %for.inc, !dbg !28

for.inc:                                          ; preds = %for.body3
  %18 = load i32, i32* %j, align 4, !dbg !28
  %inc = add nsw i32 %18, 1, !dbg !28
  store i32 %inc, i32* %j, align 4, !dbg !28
  br label %for.cond1, !dbg !28, !llvm.loop !30

for.end:                                          ; preds = %for.cond1
  br label %for.inc14, !dbg !26

for.inc14:                                        ; preds = %for.end
  %19 = load i32, i32* %i, align 4, !dbg !24
  %inc15 = add nsw i32 %19, 1, !dbg !24
  store i32 %inc15, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !24, !llvm.loop !31

for.end16:                                        ; preds = %for.cond
  ret void, !dbg !15
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @eop_sub(double** %a, double** %b, double** %c, i32 %w, i32 %h) #0 !dbg !32 {
entry:
  %a.addr = alloca double**, align 8
  %b.addr = alloca double**, align 8
  %c.addr = alloca double**, align 8
  %w.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double** %a, double*** %a.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %a.addr, metadata !33, metadata !DIExpression()), !dbg !34
  store double** %b, double*** %b.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %b.addr, metadata !35, metadata !DIExpression()), !dbg !34
  store double** %c, double*** %c.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %c.addr, metadata !36, metadata !DIExpression()), !dbg !34
  store i32 %w, i32* %w.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %w.addr, metadata !37, metadata !DIExpression()), !dbg !34
  store i32 %h, i32* %h.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %h.addr, metadata !38, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !39, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32* %j, metadata !40, metadata !DIExpression()), !dbg !34
  store i32 0, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc14, %entry
  %0 = load i32, i32* %i, align 4, !dbg !43
  %1 = load i32, i32* %h.addr, align 4, !dbg !43
  %cmp = icmp slt i32 %0, %1, !dbg !43
  br i1 %cmp, label %for.body, label %for.end16, !dbg !41

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !45
  br label %for.cond1, !dbg !45

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !47
  %3 = load i32, i32* %w.addr, align 4, !dbg !47
  %cmp2 = icmp slt i32 %2, %3, !dbg !47
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !45

for.body3:                                        ; preds = %for.cond1
  %4 = load double**, double*** %a.addr, align 8, !dbg !47
  %5 = load i32, i32* %i, align 4, !dbg !47
  %idxprom = sext i32 %5 to i64, !dbg !47
  %arrayidx = getelementptr inbounds double*, double** %4, i64 %idxprom, !dbg !47
  %6 = load double*, double** %arrayidx, align 8, !dbg !47
  %7 = load i32, i32* %j, align 4, !dbg !47
  %idxprom4 = sext i32 %7 to i64, !dbg !47
  %arrayidx5 = getelementptr inbounds double, double* %6, i64 %idxprom4, !dbg !47
  %8 = load double, double* %arrayidx5, align 8, !dbg !47
  %9 = load double**, double*** %b.addr, align 8, !dbg !47
  %10 = load i32, i32* %i, align 4, !dbg !47
  %idxprom6 = sext i32 %10 to i64, !dbg !47
  %arrayidx7 = getelementptr inbounds double*, double** %9, i64 %idxprom6, !dbg !47
  %11 = load double*, double** %arrayidx7, align 8, !dbg !47
  %12 = load i32, i32* %j, align 4, !dbg !47
  %idxprom8 = sext i32 %12 to i64, !dbg !47
  %arrayidx9 = getelementptr inbounds double, double* %11, i64 %idxprom8, !dbg !47
  %13 = load double, double* %arrayidx9, align 8, !dbg !47
  %sub = fsub double %8, %13, !dbg !47
  %14 = load double**, double*** %c.addr, align 8, !dbg !47
  %15 = load i32, i32* %i, align 4, !dbg !47
  %idxprom10 = sext i32 %15 to i64, !dbg !47
  %arrayidx11 = getelementptr inbounds double*, double** %14, i64 %idxprom10, !dbg !47
  %16 = load double*, double** %arrayidx11, align 8, !dbg !47
  %17 = load i32, i32* %j, align 4, !dbg !47
  %idxprom12 = sext i32 %17 to i64, !dbg !47
  %arrayidx13 = getelementptr inbounds double, double* %16, i64 %idxprom12, !dbg !47
  store double %sub, double* %arrayidx13, align 8, !dbg !47
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body3
  %18 = load i32, i32* %j, align 4, !dbg !47
  %inc = add nsw i32 %18, 1, !dbg !47
  store i32 %inc, i32* %j, align 4, !dbg !47
  br label %for.cond1, !dbg !47, !llvm.loop !49

for.end:                                          ; preds = %for.cond1
  br label %for.inc14, !dbg !45

for.inc14:                                        ; preds = %for.end
  %19 = load i32, i32* %i, align 4, !dbg !43
  %inc15 = add nsw i32 %19, 1, !dbg !43
  store i32 %inc15, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !43, !llvm.loop !50

for.end16:                                        ; preds = %for.cond
  ret void, !dbg !34
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @eop_mul(double** %a, double** %b, double** %c, i32 %w, i32 %h) #0 !dbg !51 {
entry:
  %a.addr = alloca double**, align 8
  %b.addr = alloca double**, align 8
  %c.addr = alloca double**, align 8
  %w.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double** %a, double*** %a.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %a.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store double** %b, double*** %b.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %b.addr, metadata !54, metadata !DIExpression()), !dbg !53
  store double** %c, double*** %c.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %c.addr, metadata !55, metadata !DIExpression()), !dbg !53
  store i32 %w, i32* %w.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %w.addr, metadata !56, metadata !DIExpression()), !dbg !53
  store i32 %h, i32* %h.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %h.addr, metadata !57, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i32* %i, metadata !58, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i32* %j, metadata !59, metadata !DIExpression()), !dbg !53
  store i32 0, i32* %i, align 4, !dbg !60
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc14, %entry
  %0 = load i32, i32* %i, align 4, !dbg !62
  %1 = load i32, i32* %h.addr, align 4, !dbg !62
  %cmp = icmp slt i32 %0, %1, !dbg !62
  br i1 %cmp, label %for.body, label %for.end16, !dbg !60

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !64
  br label %for.cond1, !dbg !64

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !66
  %3 = load i32, i32* %w.addr, align 4, !dbg !66
  %cmp2 = icmp slt i32 %2, %3, !dbg !66
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !64

for.body3:                                        ; preds = %for.cond1
  %4 = load double**, double*** %a.addr, align 8, !dbg !66
  %5 = load i32, i32* %i, align 4, !dbg !66
  %idxprom = sext i32 %5 to i64, !dbg !66
  %arrayidx = getelementptr inbounds double*, double** %4, i64 %idxprom, !dbg !66
  %6 = load double*, double** %arrayidx, align 8, !dbg !66
  %7 = load i32, i32* %j, align 4, !dbg !66
  %idxprom4 = sext i32 %7 to i64, !dbg !66
  %arrayidx5 = getelementptr inbounds double, double* %6, i64 %idxprom4, !dbg !66
  %8 = load double, double* %arrayidx5, align 8, !dbg !66
  %9 = load double**, double*** %b.addr, align 8, !dbg !66
  %10 = load i32, i32* %i, align 4, !dbg !66
  %idxprom6 = sext i32 %10 to i64, !dbg !66
  %arrayidx7 = getelementptr inbounds double*, double** %9, i64 %idxprom6, !dbg !66
  %11 = load double*, double** %arrayidx7, align 8, !dbg !66
  %12 = load i32, i32* %j, align 4, !dbg !66
  %idxprom8 = sext i32 %12 to i64, !dbg !66
  %arrayidx9 = getelementptr inbounds double, double* %11, i64 %idxprom8, !dbg !66
  %13 = load double, double* %arrayidx9, align 8, !dbg !66
  %mul = fmul double %8, %13, !dbg !66
  %14 = load double**, double*** %c.addr, align 8, !dbg !66
  %15 = load i32, i32* %i, align 4, !dbg !66
  %idxprom10 = sext i32 %15 to i64, !dbg !66
  %arrayidx11 = getelementptr inbounds double*, double** %14, i64 %idxprom10, !dbg !66
  %16 = load double*, double** %arrayidx11, align 8, !dbg !66
  %17 = load i32, i32* %j, align 4, !dbg !66
  %idxprom12 = sext i32 %17 to i64, !dbg !66
  %arrayidx13 = getelementptr inbounds double, double* %16, i64 %idxprom12, !dbg !66
  store double %mul, double* %arrayidx13, align 8, !dbg !66
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body3
  %18 = load i32, i32* %j, align 4, !dbg !66
  %inc = add nsw i32 %18, 1, !dbg !66
  store i32 %inc, i32* %j, align 4, !dbg !66
  br label %for.cond1, !dbg !66, !llvm.loop !68

for.end:                                          ; preds = %for.cond1
  br label %for.inc14, !dbg !64

for.inc14:                                        ; preds = %for.end
  %19 = load i32, i32* %i, align 4, !dbg !62
  %inc15 = add nsw i32 %19, 1, !dbg !62
  store i32 %inc15, i32* %i, align 4, !dbg !62
  br label %for.cond, !dbg !62, !llvm.loop !69

for.end16:                                        ; preds = %for.cond
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @eop_div(double** %a, double** %b, double** %c, i32 %w, i32 %h) #0 !dbg !70 {
entry:
  %a.addr = alloca double**, align 8
  %b.addr = alloca double**, align 8
  %c.addr = alloca double**, align 8
  %w.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double** %a, double*** %a.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %a.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store double** %b, double*** %b.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %b.addr, metadata !73, metadata !DIExpression()), !dbg !72
  store double** %c, double*** %c.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %c.addr, metadata !74, metadata !DIExpression()), !dbg !72
  store i32 %w, i32* %w.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %w.addr, metadata !75, metadata !DIExpression()), !dbg !72
  store i32 %h, i32* %h.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %h.addr, metadata !76, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32* %i, metadata !77, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32* %j, metadata !78, metadata !DIExpression()), !dbg !72
  store i32 0, i32* %i, align 4, !dbg !79
  br label %for.cond, !dbg !79

for.cond:                                         ; preds = %for.inc14, %entry
  %0 = load i32, i32* %i, align 4, !dbg !81
  %1 = load i32, i32* %h.addr, align 4, !dbg !81
  %cmp = icmp slt i32 %0, %1, !dbg !81
  br i1 %cmp, label %for.body, label %for.end16, !dbg !79

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !83
  br label %for.cond1, !dbg !83

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !85
  %3 = load i32, i32* %w.addr, align 4, !dbg !85
  %cmp2 = icmp slt i32 %2, %3, !dbg !85
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !83

for.body3:                                        ; preds = %for.cond1
  %4 = load double**, double*** %a.addr, align 8, !dbg !85
  %5 = load i32, i32* %i, align 4, !dbg !85
  %idxprom = sext i32 %5 to i64, !dbg !85
  %arrayidx = getelementptr inbounds double*, double** %4, i64 %idxprom, !dbg !85
  %6 = load double*, double** %arrayidx, align 8, !dbg !85
  %7 = load i32, i32* %j, align 4, !dbg !85
  %idxprom4 = sext i32 %7 to i64, !dbg !85
  %arrayidx5 = getelementptr inbounds double, double* %6, i64 %idxprom4, !dbg !85
  %8 = load double, double* %arrayidx5, align 8, !dbg !85
  %9 = load double**, double*** %b.addr, align 8, !dbg !85
  %10 = load i32, i32* %i, align 4, !dbg !85
  %idxprom6 = sext i32 %10 to i64, !dbg !85
  %arrayidx7 = getelementptr inbounds double*, double** %9, i64 %idxprom6, !dbg !85
  %11 = load double*, double** %arrayidx7, align 8, !dbg !85
  %12 = load i32, i32* %j, align 4, !dbg !85
  %idxprom8 = sext i32 %12 to i64, !dbg !85
  %arrayidx9 = getelementptr inbounds double, double* %11, i64 %idxprom8, !dbg !85
  %13 = load double, double* %arrayidx9, align 8, !dbg !85
  %div = fdiv double %8, %13, !dbg !85
  %14 = load double**, double*** %c.addr, align 8, !dbg !85
  %15 = load i32, i32* %i, align 4, !dbg !85
  %idxprom10 = sext i32 %15 to i64, !dbg !85
  %arrayidx11 = getelementptr inbounds double*, double** %14, i64 %idxprom10, !dbg !85
  %16 = load double*, double** %arrayidx11, align 8, !dbg !85
  %17 = load i32, i32* %j, align 4, !dbg !85
  %idxprom12 = sext i32 %17 to i64, !dbg !85
  %arrayidx13 = getelementptr inbounds double, double* %16, i64 %idxprom12, !dbg !85
  store double %div, double* %arrayidx13, align 8, !dbg !85
  br label %for.inc, !dbg !85

for.inc:                                          ; preds = %for.body3
  %18 = load i32, i32* %j, align 4, !dbg !85
  %inc = add nsw i32 %18, 1, !dbg !85
  store i32 %inc, i32* %j, align 4, !dbg !85
  br label %for.cond1, !dbg !85, !llvm.loop !87

for.end:                                          ; preds = %for.cond1
  br label %for.inc14, !dbg !83

for.inc14:                                        ; preds = %for.end
  %19 = load i32, i32* %i, align 4, !dbg !81
  %inc15 = add nsw i32 %19, 1, !dbg !81
  store i32 %inc15, i32* %i, align 4, !dbg !81
  br label %for.cond, !dbg !81, !llvm.loop !88

for.end16:                                        ; preds = %for.cond
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @eop_s_mul(double** %a, double %s, double** %b, i32 %w, i32 %h) #0 !dbg !89 {
entry:
  %a.addr = alloca double**, align 8
  %s.addr = alloca double, align 8
  %b.addr = alloca double**, align 8
  %w.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %x = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double** %a, double*** %a.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %a.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store double %s, double* %s.addr, align 8
  call void @llvm.dbg.declare(metadata double* %s.addr, metadata !94, metadata !DIExpression()), !dbg !93
  store double** %b, double*** %b.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %b.addr, metadata !95, metadata !DIExpression()), !dbg !93
  store i32 %w, i32* %w.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %w.addr, metadata !96, metadata !DIExpression()), !dbg !93
  store i32 %h, i32* %h.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %h.addr, metadata !97, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata double* %x, metadata !98, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata i32* %i, metadata !99, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata i32* %j, metadata !100, metadata !DIExpression()), !dbg !93
  store i32 0, i32* %i, align 4, !dbg !101
  br label %for.cond, !dbg !101

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = load i32, i32* %i, align 4, !dbg !103
  %1 = load i32, i32* %h.addr, align 4, !dbg !103
  %cmp = icmp slt i32 %0, %1, !dbg !103
  br i1 %cmp, label %for.body, label %for.end12, !dbg !101

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !105
  br label %for.cond1, !dbg !105

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !107
  %3 = load i32, i32* %w.addr, align 4, !dbg !107
  %cmp2 = icmp slt i32 %2, %3, !dbg !107
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !105

for.body3:                                        ; preds = %for.cond1
  %4 = load double**, double*** %a.addr, align 8, !dbg !109
  %5 = load i32, i32* %i, align 4, !dbg !109
  %idxprom = sext i32 %5 to i64, !dbg !109
  %arrayidx = getelementptr inbounds double*, double** %4, i64 %idxprom, !dbg !109
  %6 = load double*, double** %arrayidx, align 8, !dbg !109
  %7 = load i32, i32* %j, align 4, !dbg !109
  %idxprom4 = sext i32 %7 to i64, !dbg !109
  %arrayidx5 = getelementptr inbounds double, double* %6, i64 %idxprom4, !dbg !109
  %8 = load double, double* %arrayidx5, align 8, !dbg !109
  store double %8, double* %x, align 8, !dbg !109
  %9 = load double, double* %x, align 8, !dbg !109
  %10 = load double, double* %s.addr, align 8, !dbg !109
  %mul = fmul double %9, %10, !dbg !109
  %11 = load double**, double*** %b.addr, align 8, !dbg !109
  %12 = load i32, i32* %i, align 4, !dbg !109
  %idxprom6 = sext i32 %12 to i64, !dbg !109
  %arrayidx7 = getelementptr inbounds double*, double** %11, i64 %idxprom6, !dbg !109
  %13 = load double*, double** %arrayidx7, align 8, !dbg !109
  %14 = load i32, i32* %j, align 4, !dbg !109
  %idxprom8 = sext i32 %14 to i64, !dbg !109
  %arrayidx9 = getelementptr inbounds double, double* %13, i64 %idxprom8, !dbg !109
  store double %mul, double* %arrayidx9, align 8, !dbg !109
  br label %for.inc, !dbg !109

for.inc:                                          ; preds = %for.body3
  %15 = load i32, i32* %j, align 4, !dbg !107
  %inc = add nsw i32 %15, 1, !dbg !107
  store i32 %inc, i32* %j, align 4, !dbg !107
  br label %for.cond1, !dbg !107, !llvm.loop !111

for.end:                                          ; preds = %for.cond1
  br label %for.inc10, !dbg !105

for.inc10:                                        ; preds = %for.end
  %16 = load i32, i32* %i, align 4, !dbg !103
  %inc11 = add nsw i32 %16, 1, !dbg !103
  store i32 %inc11, i32* %i, align 4, !dbg !103
  br label %for.cond, !dbg !103, !llvm.loop !112

for.end12:                                        ; preds = %for.cond
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @eop_s_div(double** %a, double %s, double** %b, i32 %w, i32 %h) #0 !dbg !113 {
entry:
  %a.addr = alloca double**, align 8
  %s.addr = alloca double, align 8
  %b.addr = alloca double**, align 8
  %w.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %x = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double** %a, double*** %a.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %a.addr, metadata !114, metadata !DIExpression()), !dbg !115
  store double %s, double* %s.addr, align 8
  call void @llvm.dbg.declare(metadata double* %s.addr, metadata !116, metadata !DIExpression()), !dbg !115
  store double** %b, double*** %b.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %b.addr, metadata !117, metadata !DIExpression()), !dbg !115
  store i32 %w, i32* %w.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %w.addr, metadata !118, metadata !DIExpression()), !dbg !115
  store i32 %h, i32* %h.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %h.addr, metadata !119, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata double* %x, metadata !120, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32* %i, metadata !121, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32* %j, metadata !122, metadata !DIExpression()), !dbg !115
  store i32 0, i32* %i, align 4, !dbg !123
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = load i32, i32* %i, align 4, !dbg !125
  %1 = load i32, i32* %h.addr, align 4, !dbg !125
  %cmp = icmp slt i32 %0, %1, !dbg !125
  br i1 %cmp, label %for.body, label %for.end12, !dbg !123

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !127
  br label %for.cond1, !dbg !127

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !129
  %3 = load i32, i32* %w.addr, align 4, !dbg !129
  %cmp2 = icmp slt i32 %2, %3, !dbg !129
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !127

for.body3:                                        ; preds = %for.cond1
  %4 = load double**, double*** %a.addr, align 8, !dbg !131
  %5 = load i32, i32* %i, align 4, !dbg !131
  %idxprom = sext i32 %5 to i64, !dbg !131
  %arrayidx = getelementptr inbounds double*, double** %4, i64 %idxprom, !dbg !131
  %6 = load double*, double** %arrayidx, align 8, !dbg !131
  %7 = load i32, i32* %j, align 4, !dbg !131
  %idxprom4 = sext i32 %7 to i64, !dbg !131
  %arrayidx5 = getelementptr inbounds double, double* %6, i64 %idxprom4, !dbg !131
  %8 = load double, double* %arrayidx5, align 8, !dbg !131
  store double %8, double* %x, align 8, !dbg !131
  %9 = load double, double* %x, align 8, !dbg !131
  %10 = load double, double* %s.addr, align 8, !dbg !131
  %div = fdiv double %9, %10, !dbg !131
  %11 = load double**, double*** %b.addr, align 8, !dbg !131
  %12 = load i32, i32* %i, align 4, !dbg !131
  %idxprom6 = sext i32 %12 to i64, !dbg !131
  %arrayidx7 = getelementptr inbounds double*, double** %11, i64 %idxprom6, !dbg !131
  %13 = load double*, double** %arrayidx7, align 8, !dbg !131
  %14 = load i32, i32* %j, align 4, !dbg !131
  %idxprom8 = sext i32 %14 to i64, !dbg !131
  %arrayidx9 = getelementptr inbounds double, double* %13, i64 %idxprom8, !dbg !131
  store double %div, double* %arrayidx9, align 8, !dbg !131
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body3
  %15 = load i32, i32* %j, align 4, !dbg !129
  %inc = add nsw i32 %15, 1, !dbg !129
  store i32 %inc, i32* %j, align 4, !dbg !129
  br label %for.cond1, !dbg !129, !llvm.loop !133

for.end:                                          ; preds = %for.cond1
  br label %for.inc10, !dbg !127

for.inc10:                                        ; preds = %for.end
  %16 = load i32, i32* %i, align 4, !dbg !125
  %inc11 = add nsw i32 %16, 1, !dbg !125
  store i32 %inc11, i32* %i, align 4, !dbg !125
  br label %for.cond, !dbg !125, !llvm.loop !134

for.end12:                                        ; preds = %for.cond
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @eop_s_add(double** %a, double %s, double** %b, i32 %w, i32 %h) #0 !dbg !135 {
entry:
  %a.addr = alloca double**, align 8
  %s.addr = alloca double, align 8
  %b.addr = alloca double**, align 8
  %w.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %x = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double** %a, double*** %a.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %a.addr, metadata !136, metadata !DIExpression()), !dbg !137
  store double %s, double* %s.addr, align 8
  call void @llvm.dbg.declare(metadata double* %s.addr, metadata !138, metadata !DIExpression()), !dbg !137
  store double** %b, double*** %b.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %b.addr, metadata !139, metadata !DIExpression()), !dbg !137
  store i32 %w, i32* %w.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %w.addr, metadata !140, metadata !DIExpression()), !dbg !137
  store i32 %h, i32* %h.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %h.addr, metadata !141, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata double* %x, metadata !142, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i32* %i, metadata !143, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i32* %j, metadata !144, metadata !DIExpression()), !dbg !137
  store i32 0, i32* %i, align 4, !dbg !145
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = load i32, i32* %i, align 4, !dbg !147
  %1 = load i32, i32* %h.addr, align 4, !dbg !147
  %cmp = icmp slt i32 %0, %1, !dbg !147
  br i1 %cmp, label %for.body, label %for.end12, !dbg !145

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !149
  br label %for.cond1, !dbg !149

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !151
  %3 = load i32, i32* %w.addr, align 4, !dbg !151
  %cmp2 = icmp slt i32 %2, %3, !dbg !151
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !149

for.body3:                                        ; preds = %for.cond1
  %4 = load double**, double*** %a.addr, align 8, !dbg !153
  %5 = load i32, i32* %i, align 4, !dbg !153
  %idxprom = sext i32 %5 to i64, !dbg !153
  %arrayidx = getelementptr inbounds double*, double** %4, i64 %idxprom, !dbg !153
  %6 = load double*, double** %arrayidx, align 8, !dbg !153
  %7 = load i32, i32* %j, align 4, !dbg !153
  %idxprom4 = sext i32 %7 to i64, !dbg !153
  %arrayidx5 = getelementptr inbounds double, double* %6, i64 %idxprom4, !dbg !153
  %8 = load double, double* %arrayidx5, align 8, !dbg !153
  store double %8, double* %x, align 8, !dbg !153
  %9 = load double, double* %x, align 8, !dbg !153
  %10 = load double, double* %s.addr, align 8, !dbg !153
  %add = fadd double %9, %10, !dbg !153
  %11 = load double**, double*** %b.addr, align 8, !dbg !153
  %12 = load i32, i32* %i, align 4, !dbg !153
  %idxprom6 = sext i32 %12 to i64, !dbg !153
  %arrayidx7 = getelementptr inbounds double*, double** %11, i64 %idxprom6, !dbg !153
  %13 = load double*, double** %arrayidx7, align 8, !dbg !153
  %14 = load i32, i32* %j, align 4, !dbg !153
  %idxprom8 = sext i32 %14 to i64, !dbg !153
  %arrayidx9 = getelementptr inbounds double, double* %13, i64 %idxprom8, !dbg !153
  store double %add, double* %arrayidx9, align 8, !dbg !153
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body3
  %15 = load i32, i32* %j, align 4, !dbg !151
  %inc = add nsw i32 %15, 1, !dbg !151
  store i32 %inc, i32* %j, align 4, !dbg !151
  br label %for.cond1, !dbg !151, !llvm.loop !155

for.end:                                          ; preds = %for.cond1
  br label %for.inc10, !dbg !149

for.inc10:                                        ; preds = %for.end
  %16 = load i32, i32* %i, align 4, !dbg !147
  %inc11 = add nsw i32 %16, 1, !dbg !147
  store i32 %inc11, i32* %i, align 4, !dbg !147
  br label %for.cond, !dbg !147, !llvm.loop !156

for.end12:                                        ; preds = %for.cond
  ret void, !dbg !137
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @eop_s_sub(double** %a, double %s, double** %b, i32 %w, i32 %h) #0 !dbg !157 {
entry:
  %a.addr = alloca double**, align 8
  %s.addr = alloca double, align 8
  %b.addr = alloca double**, align 8
  %w.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %x = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double** %a, double*** %a.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %a.addr, metadata !158, metadata !DIExpression()), !dbg !159
  store double %s, double* %s.addr, align 8
  call void @llvm.dbg.declare(metadata double* %s.addr, metadata !160, metadata !DIExpression()), !dbg !159
  store double** %b, double*** %b.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %b.addr, metadata !161, metadata !DIExpression()), !dbg !159
  store i32 %w, i32* %w.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %w.addr, metadata !162, metadata !DIExpression()), !dbg !159
  store i32 %h, i32* %h.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %h.addr, metadata !163, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata double* %x, metadata !164, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata i32* %i, metadata !165, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata i32* %j, metadata !166, metadata !DIExpression()), !dbg !159
  store i32 0, i32* %i, align 4, !dbg !167
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = load i32, i32* %i, align 4, !dbg !169
  %1 = load i32, i32* %h.addr, align 4, !dbg !169
  %cmp = icmp slt i32 %0, %1, !dbg !169
  br i1 %cmp, label %for.body, label %for.end12, !dbg !167

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !171
  br label %for.cond1, !dbg !171

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !173
  %3 = load i32, i32* %w.addr, align 4, !dbg !173
  %cmp2 = icmp slt i32 %2, %3, !dbg !173
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !171

for.body3:                                        ; preds = %for.cond1
  %4 = load double**, double*** %a.addr, align 8, !dbg !175
  %5 = load i32, i32* %i, align 4, !dbg !175
  %idxprom = sext i32 %5 to i64, !dbg !175
  %arrayidx = getelementptr inbounds double*, double** %4, i64 %idxprom, !dbg !175
  %6 = load double*, double** %arrayidx, align 8, !dbg !175
  %7 = load i32, i32* %j, align 4, !dbg !175
  %idxprom4 = sext i32 %7 to i64, !dbg !175
  %arrayidx5 = getelementptr inbounds double, double* %6, i64 %idxprom4, !dbg !175
  %8 = load double, double* %arrayidx5, align 8, !dbg !175
  store double %8, double* %x, align 8, !dbg !175
  %9 = load double, double* %x, align 8, !dbg !175
  %10 = load double, double* %s.addr, align 8, !dbg !175
  %sub = fsub double %9, %10, !dbg !175
  %11 = load double**, double*** %b.addr, align 8, !dbg !175
  %12 = load i32, i32* %i, align 4, !dbg !175
  %idxprom6 = sext i32 %12 to i64, !dbg !175
  %arrayidx7 = getelementptr inbounds double*, double** %11, i64 %idxprom6, !dbg !175
  %13 = load double*, double** %arrayidx7, align 8, !dbg !175
  %14 = load i32, i32* %j, align 4, !dbg !175
  %idxprom8 = sext i32 %14 to i64, !dbg !175
  %arrayidx9 = getelementptr inbounds double, double* %13, i64 %idxprom8, !dbg !175
  store double %sub, double* %arrayidx9, align 8, !dbg !175
  br label %for.inc, !dbg !175

for.inc:                                          ; preds = %for.body3
  %15 = load i32, i32* %j, align 4, !dbg !173
  %inc = add nsw i32 %15, 1, !dbg !173
  store i32 %inc, i32* %j, align 4, !dbg !173
  br label %for.cond1, !dbg !173, !llvm.loop !177

for.end:                                          ; preds = %for.cond1
  br label %for.inc10, !dbg !171

for.inc10:                                        ; preds = %for.end
  %16 = load i32, i32* %i, align 4, !dbg !169
  %inc11 = add nsw i32 %16, 1, !dbg !169
  store i32 %inc11, i32* %i, align 4, !dbg !169
  br label %for.cond, !dbg !169, !llvm.loop !178

for.end12:                                        ; preds = %for.cond
  ret void, !dbg !159
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @eop_s_pow(double** %a, double %s, double** %b, i32 %w, i32 %h) #0 !dbg !179 {
entry:
  %a.addr = alloca double**, align 8
  %s.addr = alloca double, align 8
  %b.addr = alloca double**, align 8
  %w.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %x = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double** %a, double*** %a.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %a.addr, metadata !180, metadata !DIExpression()), !dbg !181
  store double %s, double* %s.addr, align 8
  call void @llvm.dbg.declare(metadata double* %s.addr, metadata !182, metadata !DIExpression()), !dbg !181
  store double** %b, double*** %b.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %b.addr, metadata !183, metadata !DIExpression()), !dbg !181
  store i32 %w, i32* %w.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %w.addr, metadata !184, metadata !DIExpression()), !dbg !181
  store i32 %h, i32* %h.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %h.addr, metadata !185, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata double* %x, metadata !186, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata i32* %i, metadata !187, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata i32* %j, metadata !188, metadata !DIExpression()), !dbg !181
  store i32 0, i32* %i, align 4, !dbg !189
  br label %for.cond, !dbg !189

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = load i32, i32* %i, align 4, !dbg !191
  %1 = load i32, i32* %h.addr, align 4, !dbg !191
  %cmp = icmp slt i32 %0, %1, !dbg !191
  br i1 %cmp, label %for.body, label %for.end12, !dbg !189

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !193
  br label %for.cond1, !dbg !193

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !195
  %3 = load i32, i32* %w.addr, align 4, !dbg !195
  %cmp2 = icmp slt i32 %2, %3, !dbg !195
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !193

for.body3:                                        ; preds = %for.cond1
  %4 = load double**, double*** %a.addr, align 8, !dbg !197
  %5 = load i32, i32* %i, align 4, !dbg !197
  %idxprom = sext i32 %5 to i64, !dbg !197
  %arrayidx = getelementptr inbounds double*, double** %4, i64 %idxprom, !dbg !197
  %6 = load double*, double** %arrayidx, align 8, !dbg !197
  %7 = load i32, i32* %j, align 4, !dbg !197
  %idxprom4 = sext i32 %7 to i64, !dbg !197
  %arrayidx5 = getelementptr inbounds double, double* %6, i64 %idxprom4, !dbg !197
  %8 = load double, double* %arrayidx5, align 8, !dbg !197
  store double %8, double* %x, align 8, !dbg !197
  %9 = load double, double* %x, align 8, !dbg !197
  %10 = load double, double* %s.addr, align 8, !dbg !197
  %call = call double @pow(double %9, double %10) #3, !dbg !197
  %11 = load double**, double*** %b.addr, align 8, !dbg !197
  %12 = load i32, i32* %i, align 4, !dbg !197
  %idxprom6 = sext i32 %12 to i64, !dbg !197
  %arrayidx7 = getelementptr inbounds double*, double** %11, i64 %idxprom6, !dbg !197
  %13 = load double*, double** %arrayidx7, align 8, !dbg !197
  %14 = load i32, i32* %j, align 4, !dbg !197
  %idxprom8 = sext i32 %14 to i64, !dbg !197
  %arrayidx9 = getelementptr inbounds double, double* %13, i64 %idxprom8, !dbg !197
  store double %call, double* %arrayidx9, align 8, !dbg !197
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %for.body3
  %15 = load i32, i32* %j, align 4, !dbg !195
  %inc = add nsw i32 %15, 1, !dbg !195
  store i32 %inc, i32* %j, align 4, !dbg !195
  br label %for.cond1, !dbg !195, !llvm.loop !199

for.end:                                          ; preds = %for.cond1
  br label %for.inc10, !dbg !193

for.inc10:                                        ; preds = %for.end
  %16 = load i32, i32* %i, align 4, !dbg !191
  %inc11 = add nsw i32 %16, 1, !dbg !191
  store i32 %inc11, i32* %i, align 4, !dbg !191
  br label %for.cond, !dbg !191, !llvm.loop !200

for.end12:                                        ; preds = %for.cond
  ret void, !dbg !181
}

; Function Attrs: nounwind
declare dso_local double @pow(double, double) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "element-wise-operations.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Element-wise-operations")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!7 = distinct !DISubprogram(name: "eop_add", scope: !1, file: !1, line: 9, type: !8, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10, !10, !10, !13, !13}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 9, type: !10)
!15 = !DILocation(line: 9, column: 1, scope: !7)
!16 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 9, type: !10)
!17 = !DILocalVariable(name: "c", arg: 3, scope: !7, file: !1, line: 9, type: !10)
!18 = !DILocalVariable(name: "w", arg: 4, scope: !7, file: !1, line: 9, type: !13)
!19 = !DILocalVariable(name: "h", arg: 5, scope: !7, file: !1, line: 9, type: !13)
!20 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 9, type: !13)
!21 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 9, type: !13)
!22 = !DILocation(line: 9, column: 1, scope: !23)
!23 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 1)
!24 = !DILocation(line: 9, column: 1, scope: !25)
!25 = distinct !DILexicalBlock(scope: !23, file: !1, line: 9, column: 1)
!26 = !DILocation(line: 9, column: 1, scope: !27)
!27 = distinct !DILexicalBlock(scope: !25, file: !1, line: 9, column: 1)
!28 = !DILocation(line: 9, column: 1, scope: !29)
!29 = distinct !DILexicalBlock(scope: !27, file: !1, line: 9, column: 1)
!30 = distinct !{!30, !26, !26}
!31 = distinct !{!31, !22, !22}
!32 = distinct !DISubprogram(name: "eop_sub", scope: !1, file: !1, line: 9, type: !8, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DILocalVariable(name: "a", arg: 1, scope: !32, file: !1, line: 9, type: !10)
!34 = !DILocation(line: 9, column: 13, scope: !32)
!35 = !DILocalVariable(name: "b", arg: 2, scope: !32, file: !1, line: 9, type: !10)
!36 = !DILocalVariable(name: "c", arg: 3, scope: !32, file: !1, line: 9, type: !10)
!37 = !DILocalVariable(name: "w", arg: 4, scope: !32, file: !1, line: 9, type: !13)
!38 = !DILocalVariable(name: "h", arg: 5, scope: !32, file: !1, line: 9, type: !13)
!39 = !DILocalVariable(name: "i", scope: !32, file: !1, line: 9, type: !13)
!40 = !DILocalVariable(name: "j", scope: !32, file: !1, line: 9, type: !13)
!41 = !DILocation(line: 9, column: 13, scope: !42)
!42 = distinct !DILexicalBlock(scope: !32, file: !1, line: 9, column: 13)
!43 = !DILocation(line: 9, column: 13, scope: !44)
!44 = distinct !DILexicalBlock(scope: !42, file: !1, line: 9, column: 13)
!45 = !DILocation(line: 9, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !44, file: !1, line: 9, column: 13)
!47 = !DILocation(line: 9, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !46, file: !1, line: 9, column: 13)
!49 = distinct !{!49, !45, !45}
!50 = distinct !{!50, !41, !41}
!51 = distinct !DISubprogram(name: "eop_mul", scope: !1, file: !1, line: 9, type: !8, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocalVariable(name: "a", arg: 1, scope: !51, file: !1, line: 9, type: !10)
!53 = !DILocation(line: 9, column: 25, scope: !51)
!54 = !DILocalVariable(name: "b", arg: 2, scope: !51, file: !1, line: 9, type: !10)
!55 = !DILocalVariable(name: "c", arg: 3, scope: !51, file: !1, line: 9, type: !10)
!56 = !DILocalVariable(name: "w", arg: 4, scope: !51, file: !1, line: 9, type: !13)
!57 = !DILocalVariable(name: "h", arg: 5, scope: !51, file: !1, line: 9, type: !13)
!58 = !DILocalVariable(name: "i", scope: !51, file: !1, line: 9, type: !13)
!59 = !DILocalVariable(name: "j", scope: !51, file: !1, line: 9, type: !13)
!60 = !DILocation(line: 9, column: 25, scope: !61)
!61 = distinct !DILexicalBlock(scope: !51, file: !1, line: 9, column: 25)
!62 = !DILocation(line: 9, column: 25, scope: !63)
!63 = distinct !DILexicalBlock(scope: !61, file: !1, line: 9, column: 25)
!64 = !DILocation(line: 9, column: 25, scope: !65)
!65 = distinct !DILexicalBlock(scope: !63, file: !1, line: 9, column: 25)
!66 = !DILocation(line: 9, column: 25, scope: !67)
!67 = distinct !DILexicalBlock(scope: !65, file: !1, line: 9, column: 25)
!68 = distinct !{!68, !64, !64}
!69 = distinct !{!69, !60, !60}
!70 = distinct !DISubprogram(name: "eop_div", scope: !1, file: !1, line: 9, type: !8, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "a", arg: 1, scope: !70, file: !1, line: 9, type: !10)
!72 = !DILocation(line: 9, column: 37, scope: !70)
!73 = !DILocalVariable(name: "b", arg: 2, scope: !70, file: !1, line: 9, type: !10)
!74 = !DILocalVariable(name: "c", arg: 3, scope: !70, file: !1, line: 9, type: !10)
!75 = !DILocalVariable(name: "w", arg: 4, scope: !70, file: !1, line: 9, type: !13)
!76 = !DILocalVariable(name: "h", arg: 5, scope: !70, file: !1, line: 9, type: !13)
!77 = !DILocalVariable(name: "i", scope: !70, file: !1, line: 9, type: !13)
!78 = !DILocalVariable(name: "j", scope: !70, file: !1, line: 9, type: !13)
!79 = !DILocation(line: 9, column: 37, scope: !80)
!80 = distinct !DILexicalBlock(scope: !70, file: !1, line: 9, column: 37)
!81 = !DILocation(line: 9, column: 37, scope: !82)
!82 = distinct !DILexicalBlock(scope: !80, file: !1, line: 9, column: 37)
!83 = !DILocation(line: 9, column: 37, scope: !84)
!84 = distinct !DILexicalBlock(scope: !82, file: !1, line: 9, column: 37)
!85 = !DILocation(line: 9, column: 37, scope: !86)
!86 = distinct !DILexicalBlock(scope: !84, file: !1, line: 9, column: 37)
!87 = distinct !{!87, !83, !83}
!88 = distinct !{!88, !79, !79}
!89 = distinct !DISubprogram(name: "eop_s_mul", scope: !1, file: !1, line: 14, type: !90, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{null, !10, !12, !10, !13, !13}
!92 = !DILocalVariable(name: "a", arg: 1, scope: !89, file: !1, line: 14, type: !10)
!93 = !DILocation(line: 14, column: 1, scope: !89)
!94 = !DILocalVariable(name: "s", arg: 2, scope: !89, file: !1, line: 14, type: !12)
!95 = !DILocalVariable(name: "b", arg: 3, scope: !89, file: !1, line: 14, type: !10)
!96 = !DILocalVariable(name: "w", arg: 4, scope: !89, file: !1, line: 14, type: !13)
!97 = !DILocalVariable(name: "h", arg: 5, scope: !89, file: !1, line: 14, type: !13)
!98 = !DILocalVariable(name: "x", scope: !89, file: !1, line: 14, type: !12)
!99 = !DILocalVariable(name: "i", scope: !89, file: !1, line: 14, type: !13)
!100 = !DILocalVariable(name: "j", scope: !89, file: !1, line: 14, type: !13)
!101 = !DILocation(line: 14, column: 1, scope: !102)
!102 = distinct !DILexicalBlock(scope: !89, file: !1, line: 14, column: 1)
!103 = !DILocation(line: 14, column: 1, scope: !104)
!104 = distinct !DILexicalBlock(scope: !102, file: !1, line: 14, column: 1)
!105 = !DILocation(line: 14, column: 1, scope: !106)
!106 = distinct !DILexicalBlock(scope: !104, file: !1, line: 14, column: 1)
!107 = !DILocation(line: 14, column: 1, scope: !108)
!108 = distinct !DILexicalBlock(scope: !106, file: !1, line: 14, column: 1)
!109 = !DILocation(line: 14, column: 1, scope: !110)
!110 = distinct !DILexicalBlock(scope: !108, file: !1, line: 14, column: 1)
!111 = distinct !{!111, !105, !105}
!112 = distinct !{!112, !101, !101}
!113 = distinct !DISubprogram(name: "eop_s_div", scope: !1, file: !1, line: 14, type: !90, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "a", arg: 1, scope: !113, file: !1, line: 14, type: !10)
!115 = !DILocation(line: 14, column: 15, scope: !113)
!116 = !DILocalVariable(name: "s", arg: 2, scope: !113, file: !1, line: 14, type: !12)
!117 = !DILocalVariable(name: "b", arg: 3, scope: !113, file: !1, line: 14, type: !10)
!118 = !DILocalVariable(name: "w", arg: 4, scope: !113, file: !1, line: 14, type: !13)
!119 = !DILocalVariable(name: "h", arg: 5, scope: !113, file: !1, line: 14, type: !13)
!120 = !DILocalVariable(name: "x", scope: !113, file: !1, line: 14, type: !12)
!121 = !DILocalVariable(name: "i", scope: !113, file: !1, line: 14, type: !13)
!122 = !DILocalVariable(name: "j", scope: !113, file: !1, line: 14, type: !13)
!123 = !DILocation(line: 14, column: 15, scope: !124)
!124 = distinct !DILexicalBlock(scope: !113, file: !1, line: 14, column: 15)
!125 = !DILocation(line: 14, column: 15, scope: !126)
!126 = distinct !DILexicalBlock(scope: !124, file: !1, line: 14, column: 15)
!127 = !DILocation(line: 14, column: 15, scope: !128)
!128 = distinct !DILexicalBlock(scope: !126, file: !1, line: 14, column: 15)
!129 = !DILocation(line: 14, column: 15, scope: !130)
!130 = distinct !DILexicalBlock(scope: !128, file: !1, line: 14, column: 15)
!131 = !DILocation(line: 14, column: 15, scope: !132)
!132 = distinct !DILexicalBlock(scope: !130, file: !1, line: 14, column: 15)
!133 = distinct !{!133, !127, !127}
!134 = distinct !{!134, !123, !123}
!135 = distinct !DISubprogram(name: "eop_s_add", scope: !1, file: !1, line: 14, type: !90, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!136 = !DILocalVariable(name: "a", arg: 1, scope: !135, file: !1, line: 14, type: !10)
!137 = !DILocation(line: 14, column: 29, scope: !135)
!138 = !DILocalVariable(name: "s", arg: 2, scope: !135, file: !1, line: 14, type: !12)
!139 = !DILocalVariable(name: "b", arg: 3, scope: !135, file: !1, line: 14, type: !10)
!140 = !DILocalVariable(name: "w", arg: 4, scope: !135, file: !1, line: 14, type: !13)
!141 = !DILocalVariable(name: "h", arg: 5, scope: !135, file: !1, line: 14, type: !13)
!142 = !DILocalVariable(name: "x", scope: !135, file: !1, line: 14, type: !12)
!143 = !DILocalVariable(name: "i", scope: !135, file: !1, line: 14, type: !13)
!144 = !DILocalVariable(name: "j", scope: !135, file: !1, line: 14, type: !13)
!145 = !DILocation(line: 14, column: 29, scope: !146)
!146 = distinct !DILexicalBlock(scope: !135, file: !1, line: 14, column: 29)
!147 = !DILocation(line: 14, column: 29, scope: !148)
!148 = distinct !DILexicalBlock(scope: !146, file: !1, line: 14, column: 29)
!149 = !DILocation(line: 14, column: 29, scope: !150)
!150 = distinct !DILexicalBlock(scope: !148, file: !1, line: 14, column: 29)
!151 = !DILocation(line: 14, column: 29, scope: !152)
!152 = distinct !DILexicalBlock(scope: !150, file: !1, line: 14, column: 29)
!153 = !DILocation(line: 14, column: 29, scope: !154)
!154 = distinct !DILexicalBlock(scope: !152, file: !1, line: 14, column: 29)
!155 = distinct !{!155, !149, !149}
!156 = distinct !{!156, !145, !145}
!157 = distinct !DISubprogram(name: "eop_s_sub", scope: !1, file: !1, line: 14, type: !90, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!158 = !DILocalVariable(name: "a", arg: 1, scope: !157, file: !1, line: 14, type: !10)
!159 = !DILocation(line: 14, column: 43, scope: !157)
!160 = !DILocalVariable(name: "s", arg: 2, scope: !157, file: !1, line: 14, type: !12)
!161 = !DILocalVariable(name: "b", arg: 3, scope: !157, file: !1, line: 14, type: !10)
!162 = !DILocalVariable(name: "w", arg: 4, scope: !157, file: !1, line: 14, type: !13)
!163 = !DILocalVariable(name: "h", arg: 5, scope: !157, file: !1, line: 14, type: !13)
!164 = !DILocalVariable(name: "x", scope: !157, file: !1, line: 14, type: !12)
!165 = !DILocalVariable(name: "i", scope: !157, file: !1, line: 14, type: !13)
!166 = !DILocalVariable(name: "j", scope: !157, file: !1, line: 14, type: !13)
!167 = !DILocation(line: 14, column: 43, scope: !168)
!168 = distinct !DILexicalBlock(scope: !157, file: !1, line: 14, column: 43)
!169 = !DILocation(line: 14, column: 43, scope: !170)
!170 = distinct !DILexicalBlock(scope: !168, file: !1, line: 14, column: 43)
!171 = !DILocation(line: 14, column: 43, scope: !172)
!172 = distinct !DILexicalBlock(scope: !170, file: !1, line: 14, column: 43)
!173 = !DILocation(line: 14, column: 43, scope: !174)
!174 = distinct !DILexicalBlock(scope: !172, file: !1, line: 14, column: 43)
!175 = !DILocation(line: 14, column: 43, scope: !176)
!176 = distinct !DILexicalBlock(scope: !174, file: !1, line: 14, column: 43)
!177 = distinct !{!177, !171, !171}
!178 = distinct !{!178, !167, !167}
!179 = distinct !DISubprogram(name: "eop_s_pow", scope: !1, file: !1, line: 14, type: !90, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!180 = !DILocalVariable(name: "a", arg: 1, scope: !179, file: !1, line: 14, type: !10)
!181 = !DILocation(line: 14, column: 57, scope: !179)
!182 = !DILocalVariable(name: "s", arg: 2, scope: !179, file: !1, line: 14, type: !12)
!183 = !DILocalVariable(name: "b", arg: 3, scope: !179, file: !1, line: 14, type: !10)
!184 = !DILocalVariable(name: "w", arg: 4, scope: !179, file: !1, line: 14, type: !13)
!185 = !DILocalVariable(name: "h", arg: 5, scope: !179, file: !1, line: 14, type: !13)
!186 = !DILocalVariable(name: "x", scope: !179, file: !1, line: 14, type: !12)
!187 = !DILocalVariable(name: "i", scope: !179, file: !1, line: 14, type: !13)
!188 = !DILocalVariable(name: "j", scope: !179, file: !1, line: 14, type: !13)
!189 = !DILocation(line: 14, column: 57, scope: !190)
!190 = distinct !DILexicalBlock(scope: !179, file: !1, line: 14, column: 57)
!191 = !DILocation(line: 14, column: 57, scope: !192)
!192 = distinct !DILexicalBlock(scope: !190, file: !1, line: 14, column: 57)
!193 = !DILocation(line: 14, column: 57, scope: !194)
!194 = distinct !DILexicalBlock(scope: !192, file: !1, line: 14, column: 57)
!195 = !DILocation(line: 14, column: 57, scope: !196)
!196 = distinct !DILexicalBlock(scope: !194, file: !1, line: 14, column: 57)
!197 = !DILocation(line: 14, column: 57, scope: !198)
!198 = distinct !DILexicalBlock(scope: !196, file: !1, line: 14, column: 57)
!199 = distinct !{!199, !193, !193}
!200 = distinct !{!200, !189, !189}
