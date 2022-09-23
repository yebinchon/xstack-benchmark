; ModuleID = 'benchmark.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.loc.dummy = private constant %struct.ident_t { i32 0, i32 0, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.ident, i32 0, i32 0) }, align 8
@.loc.dummy.3 = private constant %struct.ident_t { i32 0, i32 0, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.ident.2, i32 0, i32 0) }, align 8
@.str.ident.2 = private constant [23 x i8] c"Source location dummy.\00", align 1
@.str.ident = private constant [23 x i8] c"Source location dummy.\00", align 1
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @kernel_jacobi_1d_imper(i32 %tsteps, i32 %n, double* %A, double* %B) local_unnamed_addr #0 !dbg !22 {
entry:
  %polly.par.userContext60 = alloca { i32, i32, i64, double*, double* }, align 8
  %polly.par.userContext = alloca { i32, i32, i64, double*, double* }, align 8
  %0 = sext i32 %tsteps to i64
  %polly.loop_guard = icmp sgt i32 %tsteps, 0
  br i1 %polly.loop_guard, label %polly.loop_header.preheader, label %polly.exiting

polly.loop_header.preheader:                      ; preds = %entry
  %1 = sext i32 %n to i64
  %polly.subfn.storeaddr.tsteps = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext, i64 0, i32 0
  %polly.subfn.storeaddr.n = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext, i64 0, i32 1
  %polly.subfn.storeaddr.polly.indvar = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext, i64 0, i32 2
  %polly.subfn.storeaddr.A = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext, i64 0, i32 3
  %polly.subfn.storeaddr.B = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext, i64 0, i32 4
  %2 = add nsw i64 %1, -2
  %polly.subfn.storeaddr.tsteps61 = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext60, i64 0, i32 0
  %polly.subfn.storeaddr.n62 = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext60, i64 0, i32 1
  %polly.subfn.storeaddr.polly.indvar63 = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext60, i64 0, i32 2
  %polly.subfn.storeaddr.B64 = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext60, i64 0, i32 3
  %polly.subfn.storeaddr.A65 = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext60, i64 0, i32 4
  br label %polly.loop_header

polly.exiting.loopexit:                           ; preds = %polly.loop_header
  br label %polly.exiting, !dbg !34

polly.exiting:                                    ; preds = %polly.exiting.loopexit, %entry
  ret void, !dbg !34

polly.loop_header:                                ; preds = %polly.loop_header, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_header ], [ 0, %polly.loop_header.preheader ]
  store i32 %tsteps, i32* %polly.subfn.storeaddr.tsteps, align 8
  store i32 %n, i32* %polly.subfn.storeaddr.n, align 4
  store i64 %polly.indvar, i64* %polly.subfn.storeaddr.polly.indvar, align 8
  store double* %A, double** %polly.subfn.storeaddr.A, align 8
  store double* %B, double** %polly.subfn.storeaddr.B, align 8
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* nonnull @.loc.dummy, i32 4, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i64, i64, i64, i8*)* @kernel_jacobi_1d_imper_polly_subfn to void (i32*, i32*, ...)*), i64 0, i64 %2, i64 1, { i32, i32, i64, double*, double* }* nonnull %polly.par.userContext) #8
  store i32 %tsteps, i32* %polly.subfn.storeaddr.tsteps61, align 8
  store i32 %n, i32* %polly.subfn.storeaddr.n62, align 4
  store i64 %polly.indvar, i64* %polly.subfn.storeaddr.polly.indvar63, align 8
  store double* %B, double** %polly.subfn.storeaddr.B64, align 8
  store double* %A, double** %polly.subfn.storeaddr.A65, align 8
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* nonnull @.loc.dummy.3, i32 4, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i64, i64, i64, i8*)* @kernel_jacobi_1d_imper_polly_subfn_4 to void (i32*, i32*, ...)*), i64 0, i64 %2, i64 1, { i32, i32, i64, double*, double* }* nonnull %polly.par.userContext60) #8
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond = icmp eq i64 %polly.indvar_next, %0
  br i1 %exitcond, label %polly.exiting.loopexit, label %polly.loop_header
}

define internal void @kernel_jacobi_1d_imper_polly_subfn(i32* nocapture readonly %polly.kmpc.global_tid, i32* nocapture readnone %polly.kmpc.bound_tid, i64 %polly.kmpc.lb, i64 %polly.kmpc.ub, i64 %polly.kmpc.inc, i8* nocapture readonly %polly.kmpc.shared) #1 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %polly.par.lastIterPtr = alloca i32, align 4
  %polly.par.StridePtr = alloca i64, align 8
  %0 = getelementptr inbounds i8, i8* %polly.kmpc.shared, i64 16
  %1 = bitcast i8* %0 to double**
  %polly.subfunc.arg.A = load double*, double** %1, align 8
  %2 = getelementptr inbounds i8, i8* %polly.kmpc.shared, i64 24
  %3 = bitcast i8* %2 to double**
  %polly.subfunc.arg.B = load double*, double** %3, align 8
  %polly.par.global_tid = load i32, i32* %polly.kmpc.global_tid, align 8
  store i64 %polly.kmpc.lb, i64* %polly.par.LBPtr, align 8
  store i64 %polly.kmpc.ub, i64* %polly.par.UBPtr, align 8
  store i32 0, i32* %polly.par.lastIterPtr, align 8
  store i64 %polly.kmpc.inc, i64* %polly.par.StridePtr, align 8
  %polly.indvar.UBAdjusted = add i64 %polly.kmpc.ub, -1
  call void @__kmpc_for_static_init_8(%struct.ident_t* nonnull @.loc.dummy, i32 %polly.par.global_tid, i32 34, i32* nonnull %polly.par.lastIterPtr, i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr, i64* nonnull %polly.par.StridePtr, i64 1, i64 1)
  %polly.indvar.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.indvar.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.adjustedUBOutOfBounds = icmp slt i64 %polly.indvar.UB, %polly.indvar.UBAdjusted
  %4 = select i1 %polly.adjustedUBOutOfBounds, i64 %polly.indvar.UB, i64 %polly.indvar.UBAdjusted
  store i64 %4, i64* %polly.par.UBPtr, align 8
  %polly.hasIteration = icmp sgt i64 %polly.indvar.LB, %4
  br i1 %polly.hasIteration, label %polly.par.exit, label %polly.loop_preheader

polly.par.exit.loopexit:                          ; preds = %polly.loop_header
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @__kmpc_for_static_fini(%struct.ident_t* nonnull @.loc.dummy, i32 %polly.par.global_tid)
  ret void

polly.loop_header:                                ; preds = %polly.loop_preheader, %polly.loop_header
  %polly.indvar = phi i64 [ %polly.indvar.LB, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_header ]
  %scevgep = getelementptr double, double* %polly.subfunc.arg.A, i64 %polly.indvar
  %_p_scalar_ = load double, double* %scevgep, align 8, !alias.scope !35, !noalias !37
  %scevgep2 = getelementptr double, double* %scevgep1, i64 %polly.indvar
  %_p_scalar_3 = load double, double* %scevgep2, align 8, !alias.scope !35, !noalias !37
  %p_add = fadd double %_p_scalar_, %_p_scalar_3, !dbg !39
  %scevgep5 = getelementptr double, double* %scevgep4, i64 %polly.indvar
  %_p_scalar_6 = load double, double* %scevgep5, align 8, !alias.scope !35, !noalias !37
  %p_add10 = fadd double %p_add, %_p_scalar_6, !dbg !45
  %p_div = fdiv double %p_add10, 3.000000e+00, !dbg !46
  %scevgep8 = getelementptr double, double* %scevgep7, i64 %polly.indvar
  store double %p_div, double* %scevgep8, align 8, !alias.scope !38, !noalias !47
  %polly.indvar_next = add nsw i64 %polly.indvar, %polly.kmpc.inc
  %polly.loop_cond = icmp sgt i64 %polly.indvar_next, %4
  br i1 %polly.loop_cond, label %polly.par.exit.loopexit, label %polly.loop_header

polly.loop_preheader:                             ; preds = %polly.par.setup
  %scevgep1 = getelementptr double, double* %polly.subfunc.arg.A, i64 1
  %scevgep4 = getelementptr double, double* %polly.subfunc.arg.A, i64 2
  %scevgep7 = getelementptr double, double* %polly.subfunc.arg.B, i64 1
  br label %polly.loop_header
}

declare void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) local_unnamed_addr

define internal void @kernel_jacobi_1d_imper_polly_subfn_4(i32* nocapture readonly %polly.kmpc.global_tid, i32* nocapture readnone %polly.kmpc.bound_tid, i64 %polly.kmpc.lb, i64 %polly.kmpc.ub, i64 %polly.kmpc.inc, i8* nocapture readonly %polly.kmpc.shared) #1 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %polly.par.lastIterPtr = alloca i32, align 4
  %polly.par.StridePtr = alloca i64, align 8
  %0 = getelementptr inbounds i8, i8* %polly.kmpc.shared, i64 16
  %1 = bitcast i8* %0 to double**
  %polly.subfunc.arg.B = load double*, double** %1, align 8
  %2 = getelementptr inbounds i8, i8* %polly.kmpc.shared, i64 24
  %3 = bitcast i8* %2 to double**
  %polly.subfunc.arg.A = load double*, double** %3, align 8
  %polly.par.global_tid = load i32, i32* %polly.kmpc.global_tid, align 8
  store i64 %polly.kmpc.lb, i64* %polly.par.LBPtr, align 8
  store i64 %polly.kmpc.ub, i64* %polly.par.UBPtr, align 8
  store i32 0, i32* %polly.par.lastIterPtr, align 8
  store i64 %polly.kmpc.inc, i64* %polly.par.StridePtr, align 8
  %polly.indvar.UBAdjusted = add i64 %polly.kmpc.ub, -1
  call void @__kmpc_for_static_init_8(%struct.ident_t* nonnull @.loc.dummy.3, i32 %polly.par.global_tid, i32 34, i32* nonnull %polly.par.lastIterPtr, i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr, i64* nonnull %polly.par.StridePtr, i64 1, i64 1)
  %polly.indvar.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.indvar.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.adjustedUBOutOfBounds = icmp slt i64 %polly.indvar.UB, %polly.indvar.UBAdjusted
  %4 = select i1 %polly.adjustedUBOutOfBounds, i64 %polly.indvar.UB, i64 %polly.indvar.UBAdjusted
  store i64 %4, i64* %polly.par.UBPtr, align 8
  %polly.hasIteration = icmp sgt i64 %polly.indvar.LB, %4
  br i1 %polly.hasIteration, label %polly.par.exit, label %polly.loop_preheader

polly.par.exit.loopexit:                          ; preds = %polly.loop_header
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @__kmpc_for_static_fini(%struct.ident_t* nonnull @.loc.dummy.3, i32 %polly.par.global_tid)
  ret void

polly.loop_header:                                ; preds = %polly.loop_preheader, %polly.loop_header
  %polly.indvar = phi i64 [ %polly.indvar.LB, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_header ]
  %scevgep1 = getelementptr double, double* %scevgep, i64 %polly.indvar
  %scevgep12 = bitcast double* %scevgep1 to i64*
  %_p_scalar_ = load i64, i64* %scevgep12, align 8, !alias.scope !38, !noalias !47
  %scevgep4 = getelementptr double, double* %scevgep3, i64 %polly.indvar
  %scevgep45 = bitcast double* %scevgep4 to i64*
  store i64 %_p_scalar_, i64* %scevgep45, align 8, !alias.scope !35, !noalias !37
  %polly.indvar_next = add nsw i64 %polly.indvar, %polly.kmpc.inc
  %polly.loop_cond = icmp sgt i64 %polly.indvar_next, %4
  br i1 %polly.loop_cond, label %polly.par.exit.loopexit, label %polly.loop_header

polly.loop_preheader:                             ; preds = %polly.par.setup
  %scevgep = getelementptr double, double* %polly.subfunc.arg.B, i64 1
  %scevgep3 = getelementptr double, double* %polly.subfunc.arg.A, i64 1
  br label %polly.loop_header
}

declare void @__kmpc_for_static_init_8(%struct.ident_t*, i32, i32, i32*, i64*, i64*, i64*, i64, i64) local_unnamed_addr

declare void @__kmpc_for_static_fini(%struct.ident_t*, i32) local_unnamed_addr

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #2 !dbg !48 {
entry:
  %polly.par.userContext60.i = alloca { i32, i32, i64, double*, double* }, align 8
  %polly.par.userContext.i = alloca { i32, i32, i64, double*, double* }, align 8
  call void @llvm.dbg.value(metadata i32 %argc, metadata !52, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i8** %argv, metadata !53, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i32 4000, metadata !54, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i32 100, metadata !55, metadata !DIExpression()), !dbg !59
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !60
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !60, !tbaa !61
  call void @llvm.dbg.value(metadata i8* %0, metadata !65, metadata !DIExpression()) #8, !dbg !72
  %call.i = tail call i64 @strtol(i8* nocapture nonnull %0, i8** null, i32 10) #8, !dbg !74
  call void @llvm.dbg.value(metadata i32 %conv.i, metadata !56, metadata !DIExpression()), !dbg !59
  %call1 = tail call noalias dereferenceable_or_null(32000) i8* @malloc(i64 32000) #8, !dbg !75
  %1 = bitcast i8* %call1 to double*, !dbg !76
  call void @llvm.dbg.value(metadata double* %1, metadata !57, metadata !DIExpression()), !dbg !59
  %call4 = tail call noalias dereferenceable_or_null(32000) i8* @malloc(i64 32000) #8, !dbg !77
  %2 = bitcast i8* %call4 to double*, !dbg !78
  call void @llvm.dbg.value(metadata double* %2, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i32 4000, metadata !79, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.value(metadata double* %1, metadata !84, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.value(metadata double* %2, metadata !85, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.value(metadata i32 0, metadata !86, metadata !DIExpression()), !dbg !87
  br label %for.body.i, !dbg !89

for.body.i:                                       ; preds = %for.body.i, %entry
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.body.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i, metadata !86, metadata !DIExpression()), !dbg !87
  %3 = trunc i64 %indvars.iv.i to i32, !dbg !91
  %conv.i30 = sitofp i32 %3 to double, !dbg !91
  %add.i = fadd double %conv.i30, 2.000000e+00, !dbg !94
  %div.i = fdiv double %add.i, 4.000000e+03, !dbg !95
  %arrayidx.i = getelementptr inbounds double, double* %1, i64 %indvars.iv.i, !dbg !96
  store double %div.i, double* %arrayidx.i, align 8, !dbg !97, !tbaa !98
  %add3.i = fadd double %conv.i30, 3.000000e+00, !dbg !100
  %div5.i = fdiv double %add3.i, 4.000000e+03, !dbg !101
  %arrayidx7.i = getelementptr inbounds double, double* %2, i64 %indvars.iv.i, !dbg !102
  store double %div5.i, double* %arrayidx7.i, align 8, !dbg !103, !tbaa !98
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !104
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i, metadata !86, metadata !DIExpression()), !dbg !87
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 4000, !dbg !105
  br i1 %exitcond.i, label %init_array.exit, label %for.body.i, !dbg !89, !llvm.loop !106

init_array.exit:                                  ; preds = %for.body.i
  %conv.i = trunc i64 %call.i to i32, !dbg !108
  %4 = bitcast { i32, i32, i64, double*, double* }* %polly.par.userContext60.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %4)
  %5 = bitcast { i32, i32, i64, double*, double* }* %polly.par.userContext.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %5)
  %polly.subfn.storeaddr.tsteps.i = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext.i, i64 0, i32 0
  %polly.subfn.storeaddr.n.i = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext.i, i64 0, i32 1
  %polly.subfn.storeaddr.polly.indvar.i = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext.i, i64 0, i32 2
  %polly.subfn.storeaddr.A.i = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext.i, i64 0, i32 3
  %polly.subfn.storeaddr.B.i = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext.i, i64 0, i32 4
  %polly.subfn.storeaddr.tsteps61.i = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext60.i, i64 0, i32 0
  %polly.subfn.storeaddr.n62.i = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext60.i, i64 0, i32 1
  %polly.subfn.storeaddr.polly.indvar63.i = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext60.i, i64 0, i32 2
  %polly.subfn.storeaddr.B64.i = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext60.i, i64 0, i32 3
  %polly.subfn.storeaddr.A65.i = getelementptr inbounds { i32, i32, i64, double*, double* }, { i32, i32, i64, double*, double* }* %polly.par.userContext60.i, i64 0, i32 4
  %6 = bitcast double** %polly.subfn.storeaddr.A.i to i8**
  %7 = bitcast double** %polly.subfn.storeaddr.B.i to i8**
  %8 = bitcast double** %polly.subfn.storeaddr.B64.i to i8**
  %9 = bitcast double** %polly.subfn.storeaddr.A65.i to i8**
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %polly.loop_header.i, %init_array.exit
  %polly.indvar.i = phi i64 [ %polly.indvar_next.i, %polly.loop_header.i ], [ 0, %init_array.exit ]
  store i32 100, i32* %polly.subfn.storeaddr.tsteps.i, align 8
  store i32 4000, i32* %polly.subfn.storeaddr.n.i, align 4
  store i64 %polly.indvar.i, i64* %polly.subfn.storeaddr.polly.indvar.i, align 8
  store i8* %call1, i8** %6, align 8
  store i8* %call4, i8** %7, align 8
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* nonnull @.loc.dummy, i32 4, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i64, i64, i64, i8*)* @kernel_jacobi_1d_imper_polly_subfn to void (i32*, i32*, ...)*), i64 0, i64 3998, i64 1, { i32, i32, i64, double*, double* }* nonnull %polly.par.userContext.i) #8
  store i32 100, i32* %polly.subfn.storeaddr.tsteps61.i, align 8
  store i32 4000, i32* %polly.subfn.storeaddr.n62.i, align 4
  store i64 %polly.indvar.i, i64* %polly.subfn.storeaddr.polly.indvar63.i, align 8
  store i8* %call4, i8** %8, align 8
  store i8* %call1, i8** %9, align 8
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* nonnull @.loc.dummy.3, i32 4, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i64, i64, i64, i8*)* @kernel_jacobi_1d_imper_polly_subfn_4 to void (i32*, i32*, ...)*), i64 0, i64 3998, i64 1, { i32, i32, i64, double*, double* }* nonnull %polly.par.userContext60.i) #8
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1
  %exitcond.i37 = icmp eq i64 %polly.indvar_next.i, 100
  br i1 %exitcond.i37, label %kernel_jacobi_1d_imper.exit, label %polly.loop_header.i

kernel_jacobi_1d_imper.exit:                      ; preds = %polly.loop_header.i
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %4), !dbg !109
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %5), !dbg !109
  %cmp8 = icmp eq i32 %conv.i, 1, !dbg !111
  br i1 %cmp8, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %kernel_jacobi_1d_imper.exit
  call void @llvm.dbg.value(metadata i32 4000, metadata !114, metadata !DIExpression()) #8, !dbg !121
  call void @llvm.dbg.value(metadata double* %1, metadata !119, metadata !DIExpression()) #8, !dbg !121
  call void @llvm.dbg.value(metadata i32 0, metadata !120, metadata !DIExpression()) #8, !dbg !121
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !121, !tbaa !61
  br label %for.body.i34, !dbg !123

for.body.i34:                                     ; preds = %for.inc.i, %if.then
  %indvars.iv.i31 = phi i64 [ 0, %if.then ], [ %indvars.iv.next.i35, %for.inc.i ]
  %11 = phi %struct._IO_FILE* [ %10, %if.then ], [ %15, %for.inc.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i31, metadata !120, metadata !DIExpression()) #8, !dbg !121
  %arrayidx.i32 = getelementptr inbounds double, double* %1, i64 %indvars.iv.i31, !dbg !125
  %12 = load double, double* %arrayidx.i32, align 8, !dbg !125, !tbaa !98
  %call.i33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), double %12) #9, !dbg !128
  %13 = trunc i64 %indvars.iv.i31 to i32, !dbg !129
  %rem.i = urem i32 %13, 20, !dbg !129
  %cmp1.i = icmp eq i32 %rem.i, 0, !dbg !131
  br i1 %cmp1.i, label %if.then.i, label %for.inc.i, !dbg !132

if.then.i:                                        ; preds = %for.body.i34
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !133, !tbaa !61
  %fputc11.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #9, !dbg !134
  br label %for.inc.i, !dbg !134

for.inc.i:                                        ; preds = %if.then.i, %for.body.i34
  %indvars.iv.next.i35 = add nuw nsw i64 %indvars.iv.i31, 1, !dbg !135
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i35, metadata !120, metadata !DIExpression()) #8, !dbg !121
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !121, !tbaa !61
  %exitcond.i36 = icmp eq i64 %indvars.iv.next.i35, 4000, !dbg !136
  br i1 %exitcond.i36, label %print_array.exit, label %for.body.i34, !dbg !123, !llvm.loop !137

print_array.exit:                                 ; preds = %for.inc.i
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #9, !dbg !139
  br label %if.end, !dbg !140

if.end:                                           ; preds = %print_array.exit, %kernel_jacobi_1d_imper.exit
  tail call void @free(i8* %call1) #8, !dbg !141
  tail call void @free(i8* %call4) #8, !dbg !142
  ret i32 0, !dbg !143
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

; Function Attrs: nofree nounwind
declare dso_local i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare dso_local noalias i8* @malloc(i64) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: nofree nounwind
declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #6

; Function Attrs: nounwind
declare !dbg !10 dso_local void @free(i8* nocapture) local_unnamed_addr #7

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "polly.skip.fn" }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone speculatable willreturn }
attributes #4 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nofree nounwind }
attributes #7 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { cold nounwind }

!llvm.dbg.cu = !{!0}
!llvm.ident = !{!18}
!llvm.module.flags = !{!19, !20, !21}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "jacobi-1d-imper.c", directory: "/u/zujunt/xstack/xstack-benchmark/splendid_examples/jacobi-1d-imper")
!2 = !{}
!3 = !{!4, !9, !10, !14, !15, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, elements: !7)
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = !{!8}
!8 = !DISubrange(count: -1)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !DISubprogram(name: "free", scope: !11, file: !11, line: 565, type: !12, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2)
!11 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!12 = !DISubroutineType(types: !13)
!13 = !{null, !9}
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = distinct !DISubprogram(name: "kernel_jacobi_1d_imper", scope: !1, file: !1, line: 50, type: !23, scopeLine: 54, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !26)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !14, !14, !25, !25}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!26 = !{!27, !28, !29, !30, !31, !32, !33}
!27 = !DILocalVariable(name: "tsteps", arg: 1, scope: !22, file: !1, line: 50, type: !14)
!28 = !DILocalVariable(name: "n", arg: 2, scope: !22, file: !1, line: 51, type: !14)
!29 = !DILocalVariable(name: "A", arg: 3, scope: !22, file: !1, line: 52, type: !25)
!30 = !DILocalVariable(name: "B", arg: 4, scope: !22, file: !1, line: 53, type: !25)
!31 = !DILocalVariable(name: "t", scope: !22, file: !1, line: 55, type: !14)
!32 = !DILocalVariable(name: "i", scope: !22, file: !1, line: 55, type: !14)
!33 = !DILocalVariable(name: "j", scope: !22, file: !1, line: 55, type: !14)
!34 = !DILocation(line: 67, column: 2, scope: !22)
!35 = distinct !{!35, !36, !"polly.alias.scope.MemRef0"}
!36 = distinct !{!36, !"polly.alias.scope.domain"}
!37 = !{!38}
!38 = distinct !{!38, !36, !"polly.alias.scope.MemRef1"}
!39 = !DILocation(line: 60, column: 19, scope: !40)
!40 = distinct !DILexicalBlock(scope: !41, file: !1, line: 59, column: 8)
!41 = distinct !DILexicalBlock(scope: !42, file: !1, line: 59, column: 8)
!42 = distinct !DILexicalBlock(scope: !43, file: !1, line: 57, column: 6)
!43 = distinct !DILexicalBlock(scope: !44, file: !1, line: 56, column: 4)
!44 = distinct !DILexicalBlock(scope: !22, file: !1, line: 56, column: 4)
!45 = !DILocation(line: 60, column: 26, scope: !40)
!46 = !DILocation(line: 60, column: 38, scope: !40)
!47 = !{!35}
!48 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 69, type: !49, scopeLine: 70, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !51)
!49 = !DISubroutineType(types: !50)
!50 = !{!14, !14, !15}
!51 = !{!52, !53, !54, !55, !56, !57, !58}
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !1, line: 69, type: !14)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !1, line: 69, type: !15)
!54 = !DILocalVariable(name: "n", scope: !48, file: !1, line: 72, type: !14)
!55 = !DILocalVariable(name: "tsteps", scope: !48, file: !1, line: 73, type: !14)
!56 = !DILocalVariable(name: "dump_code", scope: !48, file: !1, line: 74, type: !14)
!57 = !DILocalVariable(name: "A", scope: !48, file: !1, line: 77, type: !4)
!58 = !DILocalVariable(name: "B", scope: !48, file: !1, line: 78, type: !4)
!59 = !DILocation(line: 0, scope: !48)
!60 = !DILocation(line: 74, column: 24, scope: !48)
!61 = !{!62, !62, i64 0}
!62 = !{!"any pointer", !63, i64 0}
!63 = !{!"omnipotent char", !64, i64 0}
!64 = !{!"Simple C/C++ TBAA"}
!65 = !DILocalVariable(name: "__nptr", arg: 1, scope: !66, file: !11, line: 361, type: !69)
!66 = distinct !DISubprogram(name: "atoi", scope: !11, file: !11, line: 361, type: !67, scopeLine: 362, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !71)
!67 = !DISubroutineType(types: !68)
!68 = !{!14, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!71 = !{!65}
!72 = !DILocation(line: 0, scope: !66, inlinedAt: !73)
!73 = distinct !DILocation(line: 74, column: 19, scope: !48)
!74 = !DILocation(line: 363, column: 16, scope: !66, inlinedAt: !73)
!75 = !DILocation(line: 77, column: 37, scope: !48)
!76 = !DILocation(line: 77, column: 23, scope: !48)
!77 = !DILocation(line: 78, column: 37, scope: !48)
!78 = !DILocation(line: 78, column: 23, scope: !48)
!79 = !DILocalVariable(name: "n", arg: 1, scope: !80, file: !1, line: 19, type: !14)
!80 = distinct !DISubprogram(name: "init_array", scope: !1, file: !1, line: 19, type: !81, scopeLine: 22, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !83)
!81 = !DISubroutineType(types: !82)
!82 = !{null, !14, !25, !25}
!83 = !{!79, !84, !85, !86}
!84 = !DILocalVariable(name: "A", arg: 2, scope: !80, file: !1, line: 20, type: !25)
!85 = !DILocalVariable(name: "B", arg: 3, scope: !80, file: !1, line: 21, type: !25)
!86 = !DILocalVariable(name: "i", scope: !80, file: !1, line: 23, type: !14)
!87 = !DILocation(line: 0, scope: !80, inlinedAt: !88)
!88 = distinct !DILocation(line: 84, column: 3, scope: !48)
!89 = !DILocation(line: 25, column: 3, scope: !90, inlinedAt: !88)
!90 = distinct !DILexicalBlock(scope: !80, file: !1, line: 25, column: 3)
!91 = !DILocation(line: 27, column: 13, scope: !92, inlinedAt: !88)
!92 = distinct !DILexicalBlock(scope: !93, file: !1, line: 26, column: 3)
!93 = distinct !DILexicalBlock(scope: !90, file: !1, line: 25, column: 3)
!94 = !DILocation(line: 27, column: 23, scope: !92, inlinedAt: !88)
!95 = !DILocation(line: 27, column: 28, scope: !92, inlinedAt: !88)
!96 = !DILocation(line: 27, column: 5, scope: !92, inlinedAt: !88)
!97 = !DILocation(line: 27, column: 10, scope: !92, inlinedAt: !88)
!98 = !{!99, !99, i64 0}
!99 = !{!"double", !63, i64 0}
!100 = !DILocation(line: 28, column: 23, scope: !92, inlinedAt: !88)
!101 = !DILocation(line: 28, column: 28, scope: !92, inlinedAt: !88)
!102 = !DILocation(line: 28, column: 5, scope: !92, inlinedAt: !88)
!103 = !DILocation(line: 28, column: 10, scope: !92, inlinedAt: !88)
!104 = !DILocation(line: 25, column: 23, scope: !93, inlinedAt: !88)
!105 = !DILocation(line: 25, column: 17, scope: !93, inlinedAt: !88)
!106 = distinct !{!106, !89, !107}
!107 = !DILocation(line: 29, column: 3, scope: !90, inlinedAt: !88)
!108 = !DILocation(line: 363, column: 10, scope: !66, inlinedAt: !73)
!109 = !DILocation(line: 67, column: 2, scope: !22, inlinedAt: !110)
!110 = distinct !DILocation(line: 87, column: 3, scope: !48)
!111 = !DILocation(line: 91, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !48, file: !1, line: 91, column: 6)
!113 = !DILocation(line: 91, column: 6, scope: !48)
!114 = !DILocalVariable(name: "n", arg: 1, scope: !115, file: !1, line: 36, type: !14)
!115 = distinct !DISubprogram(name: "print_array", scope: !1, file: !1, line: 36, type: !116, scopeLine: 39, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !118)
!116 = !DISubroutineType(types: !117)
!117 = !{null, !14, !25}
!118 = !{!114, !119, !120}
!119 = !DILocalVariable(name: "A", arg: 2, scope: !115, file: !1, line: 37, type: !25)
!120 = !DILocalVariable(name: "i", scope: !115, file: !1, line: 40, type: !14)
!121 = !DILocation(line: 0, scope: !115, inlinedAt: !122)
!122 = distinct !DILocation(line: 91, column: 22, scope: !112)
!123 = !DILocation(line: 42, column: 3, scope: !124, inlinedAt: !122)
!124 = distinct !DILexicalBlock(scope: !115, file: !1, line: 42, column: 3)
!125 = !DILocation(line: 44, column: 32, scope: !126, inlinedAt: !122)
!126 = distinct !DILexicalBlock(scope: !127, file: !1, line: 43, column: 3)
!127 = distinct !DILexicalBlock(scope: !124, file: !1, line: 42, column: 3)
!128 = !DILocation(line: 44, column: 5, scope: !126, inlinedAt: !122)
!129 = !DILocation(line: 45, column: 11, scope: !130, inlinedAt: !122)
!130 = distinct !DILexicalBlock(scope: !126, file: !1, line: 45, column: 9)
!131 = !DILocation(line: 45, column: 16, scope: !130, inlinedAt: !122)
!132 = !DILocation(line: 45, column: 9, scope: !126, inlinedAt: !122)
!133 = !DILocation(line: 45, column: 30, scope: !130, inlinedAt: !122)
!134 = !DILocation(line: 45, column: 22, scope: !130, inlinedAt: !122)
!135 = !DILocation(line: 42, column: 23, scope: !127, inlinedAt: !122)
!136 = !DILocation(line: 42, column: 17, scope: !127, inlinedAt: !122)
!137 = distinct !{!137, !123, !138}
!138 = !DILocation(line: 46, column: 3, scope: !124, inlinedAt: !122)
!139 = !DILocation(line: 47, column: 3, scope: !115, inlinedAt: !122)
!140 = !DILocation(line: 91, column: 22, scope: !112)
!141 = !DILocation(line: 94, column: 3, scope: !48)
!142 = !DILocation(line: 95, column: 3, scope: !48)
!143 = !DILocation(line: 97, column: 3, scope: !48)
