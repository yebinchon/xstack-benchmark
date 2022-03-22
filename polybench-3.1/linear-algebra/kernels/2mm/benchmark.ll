; ModuleID = 'benchmark.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@polybench_t_start = common dso_local local_unnamed_addr global double 0.000000e+00, align 8, !dbg !0
@polybench_t_end = common dso_local local_unnamed_addr global double 0.000000e+00, align 8, !dbg !20
@polybench_c_start = common dso_local local_unnamed_addr global i64 0, align 8, !dbg !22
@polybench_c_end = common dso_local local_unnamed_addr global i64 0, align 8, !dbg !25
@polybench_papi_counters_threadid = dso_local local_unnamed_addr global i32 0, align 4, !dbg !27
@polybench_program_total_flops = dso_local local_unnamed_addr global double 0.000000e+00, align 8, !dbg !29
@0 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@1 = private unnamed_addr constant [42 x i8] c";polybench.c;polybench_flush_cache;93;1;;\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"tmp <= 10.0\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"polybench.c\00", align 1
@__PRETTY_FUNCTION__.polybench_flush_cache = private unnamed_addr constant [29 x i8] c"void polybench_flush_cache()\00", align 1
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@3 = private unnamed_addr constant [43 x i8] c";polybench.c;polybench_flush_cache;93;25;;\00", align 1
@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"%0.6f\0A\00", align 1
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.4 = private unnamed_addr constant [51 x i8] c"[PolyBench] posix_memalign: cannot allocate memory\00", align 1
@.str.1.1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @polybench_flush_cache() local_unnamed_addr #0 !dbg !46 {
entry:
  %cs = alloca i32, align 4
  %flush = alloca double*, align 8
  %tmp = alloca double, align 8
  %.kmpc_loc.addr = alloca %struct.ident_t, align 8
  %0 = bitcast %struct.ident_t* %.kmpc_loc.addr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %0, i8* nonnull align 8 dereferenceable(24) bitcast (%struct.ident_t* @0 to i8*), i64 16, i1 false)
  %1 = bitcast i32* %cs to i8*, !dbg !54
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #10, !dbg !54
  call void @llvm.dbg.value(metadata i32 4194560, metadata !50, metadata !DIExpression()), !dbg !55
  store i32 4194560, i32* %cs, align 4, !dbg !56, !tbaa !57
  %2 = bitcast double** %flush to i8*, !dbg !61
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #10, !dbg !61
  call void @llvm.dbg.value(metadata i32 4194560, metadata !50, metadata !DIExpression()), !dbg !55
  %call = tail call noalias dereferenceable_or_null(33556480) i8* @calloc(i64 4194560, i64 8) #10, !dbg !62
  call void @llvm.dbg.value(metadata i8* %call, metadata !51, metadata !DIExpression()), !dbg !55
  %3 = bitcast double** %flush to i8**, !dbg !63
  store i8* %call, i8** %3, align 8, !dbg !63, !tbaa !64
  %4 = bitcast double* %tmp to i8*, !dbg !66
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #10, !dbg !66
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !53, metadata !DIExpression()), !dbg !55
  store double 0.000000e+00, double* %tmp, align 8, !dbg !67, !tbaa !68
  %5 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i64 0, i32 4, !dbg !70
  store i8* getelementptr inbounds ([42 x i8], [42 x i8]* @1, i64 0, i64 0), i8** %5, align 8, !dbg !70, !tbaa !71
  call void @llvm.dbg.value(metadata i32* %cs, metadata !50, metadata !DIExpression(DW_OP_deref)), !dbg !55
  call void @llvm.dbg.value(metadata double** %flush, metadata !51, metadata !DIExpression(DW_OP_deref)), !dbg !55
  call void @llvm.dbg.value(metadata double* %tmp, metadata !53, metadata !DIExpression(DW_OP_deref)), !dbg !55
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* nonnull %.kmpc_loc.addr, i32 3, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, double*, double**)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* nonnull %cs, double* nonnull %tmp, double** nonnull %flush) #10, !dbg !70
  %6 = load double, double* %tmp, align 8, !dbg !73, !tbaa !68
  call void @llvm.dbg.value(metadata double %6, metadata !53, metadata !DIExpression()), !dbg !55
  %cmp = fcmp ugt double %6, 1.000000e+01, !dbg !73
  br i1 %cmp, label %if.else, label %if.end, !dbg !76

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), i32 97, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.polybench_flush_cache, i64 0, i64 0)) #11, !dbg !73
  unreachable, !dbg !73

if.end:                                           ; preds = %entry
  %7 = load i8*, i8** %3, align 8, !dbg !77, !tbaa !64
  call void @llvm.dbg.value(metadata double* undef, metadata !51, metadata !DIExpression()), !dbg !55
  call void @free(i8* %7) #10, !dbg !78
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #10, !dbg !79
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #10, !dbg !79
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #10, !dbg !79
  ret void, !dbg !79
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

; Function Attrs: nofree nounwind
declare dso_local noalias i8* @calloc(i64, i64) local_unnamed_addr #3

; Function Attrs: norecurse nounwind uwtable
define internal void @.omp_outlined.(i32* noalias nocapture readonly %.global_tid., i32* noalias nocapture readnone %.bound_tid., i32* nocapture readonly dereferenceable(4) %cs, double* nocapture dereferenceable(8) %tmp, double** nocapture readonly dereferenceable(8) %flush) #4 !dbg !80 {
entry:
  %.omp.lb.i = alloca i32, align 4
  %.omp.ub.i = alloca i32, align 4
  %.omp.stride.i = alloca i32, align 4
  %.omp.is_last.i = alloca i32, align 4
  %.kmpc_loc.addr.i = alloca %struct.ident_t, align 8
  call void @llvm.dbg.value(metadata i32* %.global_tid., metadata !91, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.value(metadata i32* %.bound_tid., metadata !92, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.value(metadata i32* %cs, metadata !93, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.value(metadata double* %tmp, metadata !94, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.value(metadata double** %flush, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = bitcast %struct.ident_t* %.kmpc_loc.addr.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %0)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %0, i8* nonnull align 8 dereferenceable(24) bitcast (%struct.ident_t* @2 to i8*), i64 24, i1 false) #10, !noalias !97
  call void @llvm.dbg.value(metadata i32* %.global_tid., metadata !100, metadata !DIExpression()) #10, !dbg !114
  call void @llvm.dbg.value(metadata i32* undef, metadata !103, metadata !DIExpression()) #10, !dbg !114
  call void @llvm.dbg.value(metadata i32* %cs, metadata !104, metadata !DIExpression()) #10, !dbg !114
  call void @llvm.dbg.value(metadata double* %tmp, metadata !105, metadata !DIExpression()) #10, !dbg !114
  call void @llvm.dbg.value(metadata double** %flush, metadata !106, metadata !DIExpression()) #10, !dbg !114
  %1 = load i32, i32* %cs, align 4, !dbg !116, !tbaa !57, !noalias !97
  call void @llvm.dbg.value(metadata i32 %1, metadata !108, metadata !DIExpression()) #10, !dbg !114
  %sub3.i = add nsw i32 %1, -1, !dbg !117
  call void @llvm.dbg.value(metadata i32 %sub3.i, metadata !108, metadata !DIExpression()) #10, !dbg !114
  call void @llvm.dbg.value(metadata i32 0, metadata !109, metadata !DIExpression()) #10, !dbg !114
  %cmp.i = icmp sgt i32 %1, 0, !dbg !117
  br i1 %cmp.i, label %omp.precond.then.i, label %.omp_outlined._debug__.exit, !dbg !117

omp.precond.then.i:                               ; preds = %entry
  %2 = bitcast i32* %.omp.lb.i to i8*, !dbg !117
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #10, !dbg !117, !noalias !97
  call void @llvm.dbg.value(metadata i32 0, metadata !110, metadata !DIExpression()) #10, !dbg !114
  store i32 0, i32* %.omp.lb.i, align 4, !dbg !118, !tbaa !57, !noalias !97
  %3 = bitcast i32* %.omp.ub.i to i8*, !dbg !117
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #10, !dbg !117, !noalias !97
  call void @llvm.dbg.value(metadata i32 %sub3.i, metadata !111, metadata !DIExpression()) #10, !dbg !114
  store i32 %sub3.i, i32* %.omp.ub.i, align 4, !dbg !118, !tbaa !57, !noalias !97
  %4 = bitcast i32* %.omp.stride.i to i8*, !dbg !117
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #10, !dbg !117, !noalias !97
  call void @llvm.dbg.value(metadata i32 1, metadata !112, metadata !DIExpression()) #10, !dbg !114
  store i32 1, i32* %.omp.stride.i, align 4, !dbg !118, !tbaa !57, !noalias !97
  %5 = bitcast i32* %.omp.is_last.i to i8*, !dbg !117
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #10, !dbg !117, !noalias !97
  call void @llvm.dbg.value(metadata i32 0, metadata !113, metadata !DIExpression()) #10, !dbg !114
  store i32 0, i32* %.omp.is_last.i, align 4, !dbg !118, !tbaa !57, !noalias !97
  %6 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr.i, i64 0, i32 4, !dbg !117
  store i8* getelementptr inbounds ([42 x i8], [42 x i8]* @1, i64 0, i64 0), i8** %6, align 8, !dbg !117, !tbaa !71, !noalias !97
  %7 = load i32, i32* %.global_tid., align 4, !dbg !117, !tbaa !57, !alias.scope !97
  call void @llvm.dbg.value(metadata i32* %.omp.lb.i, metadata !110, metadata !DIExpression(DW_OP_deref)) #10, !dbg !114
  call void @llvm.dbg.value(metadata i32* %.omp.ub.i, metadata !111, metadata !DIExpression(DW_OP_deref)) #10, !dbg !114
  call void @llvm.dbg.value(metadata i32* %.omp.stride.i, metadata !112, metadata !DIExpression(DW_OP_deref)) #10, !dbg !114
  call void @llvm.dbg.value(metadata i32* %.omp.is_last.i, metadata !113, metadata !DIExpression(DW_OP_deref)) #10, !dbg !114
  call void @__kmpc_for_static_init_4(%struct.ident_t* nonnull %.kmpc_loc.addr.i, i32 %7, i32 34, i32* nonnull %.omp.is_last.i, i32* nonnull %.omp.lb.i, i32* nonnull %.omp.ub.i, i32* nonnull %.omp.stride.i, i32 1, i32 1) #10, !dbg !117, !noalias !97
  %8 = load i32, i32* %.omp.ub.i, align 4, !dbg !118, !tbaa !57, !noalias !97
  call void @llvm.dbg.value(metadata i32 %8, metadata !111, metadata !DIExpression()) #10, !dbg !114
  %cmp6.i = icmp slt i32 %8, %1, !dbg !118
  %cond.i = select i1 %cmp6.i, i32 %8, i32 %sub3.i, !dbg !118
  call void @llvm.dbg.value(metadata i32 %cond.i, metadata !111, metadata !DIExpression()) #10, !dbg !114
  store i32 %cond.i, i32* %.omp.ub.i, align 4, !dbg !118, !tbaa !57, !noalias !97
  %9 = load i32, i32* %.omp.lb.i, align 4, !dbg !118, !tbaa !57, !noalias !97
  call void @llvm.dbg.value(metadata i32 %9, metadata !110, metadata !DIExpression()) #10, !dbg !114
  call void @llvm.dbg.value(metadata i32 %9, metadata !107, metadata !DIExpression()) #10, !dbg !114
  call void @llvm.dbg.value(metadata i32 %cond.i, metadata !111, metadata !DIExpression()) #10, !dbg !114
  %cmp71.i = icmp sgt i32 %9, %cond.i, !dbg !117
  br i1 %cmp71.i, label %omp.loop.exit.i, label %omp.inner.for.body.lr.ph.i, !dbg !117

omp.inner.for.body.lr.ph.i:                       ; preds = %omp.precond.then.i
  %10 = load double*, double** %flush, align 8, !dbg !114, !tbaa !64, !noalias !97
  %11 = sext i32 %9 to i64, !dbg !117
  %12 = sext i32 %cond.i to i64, !dbg !117
  %.pre.i = load double, double* %tmp, align 8, !dbg !119, !tbaa !68, !noalias !97
  br label %omp.inner.for.body.i, !dbg !117

omp.inner.for.body.i:                             ; preds = %omp.inner.for.body.i, %omp.inner.for.body.lr.ph.i
  %13 = phi double [ %add9.i, %omp.inner.for.body.i ], [ %.pre.i, %omp.inner.for.body.lr.ph.i ], !dbg !119
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %omp.inner.for.body.i ], [ %11, %omp.inner.for.body.lr.ph.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i, metadata !107, metadata !DIExpression()) #10, !dbg !114
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i, metadata !109, metadata !DIExpression()) #10, !dbg !114
  %arrayidx.i = getelementptr inbounds double, double* %10, i64 %indvars.iv.i, !dbg !120
  %14 = load double, double* %arrayidx.i, align 8, !dbg !120, !tbaa !68, !noalias !97
  %add9.i = fadd double %13, %14, !dbg !119
  store double %add9.i, double* %tmp, align 8, !dbg !119, !tbaa !68, !noalias !97
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, 1, !dbg !117
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i, metadata !107, metadata !DIExpression()) #10, !dbg !114
  call void @llvm.dbg.value(metadata i32 %cond.i, metadata !111, metadata !DIExpression()) #10, !dbg !114
  %cmp7.i = icmp slt i64 %indvars.iv.i, %12, !dbg !117
  br i1 %cmp7.i, label %omp.inner.for.body.i, label %omp.loop.exit.i.loopexit, !dbg !117, !llvm.loop !121

omp.loop.exit.i.loopexit:                         ; preds = %omp.inner.for.body.i
  br label %omp.loop.exit.i, !dbg !122

omp.loop.exit.i:                                  ; preds = %omp.loop.exit.i.loopexit, %omp.precond.then.i
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @3, i64 0, i64 0), i8** %6, align 8, !dbg !122, !tbaa !71, !noalias !97
  call void @__kmpc_for_static_fini(%struct.ident_t* nonnull %.kmpc_loc.addr.i, i32 %7) #10, !dbg !122, !noalias !97
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #10, !dbg !122, !noalias !97
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #10, !dbg !122, !noalias !97
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #10, !dbg !122, !noalias !97
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #10, !dbg !122, !noalias !97
  br label %.omp_outlined._debug__.exit, !dbg !122

.omp_outlined._debug__.exit:                      ; preds = %omp.loop.exit.i, %entry
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %0), !dbg !124
  ret void, !dbg !125
}

declare !callback !126 dso_local void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) local_unnamed_addr

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #5

; Function Attrs: nounwind
declare !dbg !8 dso_local void @free(i8* nocapture) local_unnamed_addr #6

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

declare dso_local void @__kmpc_for_static_init_4(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32) local_unnamed_addr

declare dso_local void @__kmpc_for_static_fini(%struct.ident_t*, i32) local_unnamed_addr

; Function Attrs: nounwind uwtable
define dso_local void @polybench_prepare_instruments() local_unnamed_addr #0 !dbg !128 {
entry:
  %cs.i = alloca i32, align 4
  %flush.i = alloca double*, align 8
  %tmp.i = alloca double, align 8
  %.kmpc_loc.addr.i = alloca %struct.ident_t, align 8
  %0 = bitcast %struct.ident_t* %.kmpc_loc.addr.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %0)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %0, i8* nonnull align 8 dereferenceable(24) bitcast (%struct.ident_t* @0 to i8*), i64 16, i1 false) #10
  %1 = bitcast i32* %cs.i to i8*, !dbg !129
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #10, !dbg !129
  call void @llvm.dbg.value(metadata i32 4194560, metadata !50, metadata !DIExpression()) #10, !dbg !131
  store i32 4194560, i32* %cs.i, align 4, !dbg !132, !tbaa !57
  %2 = bitcast double** %flush.i to i8*, !dbg !133
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #10, !dbg !133
  call void @llvm.dbg.value(metadata i32 4194560, metadata !50, metadata !DIExpression()) #10, !dbg !131
  %call.i = tail call noalias dereferenceable_or_null(33556480) i8* @calloc(i64 4194560, i64 8) #10, !dbg !134
  call void @llvm.dbg.value(metadata i8* %call.i, metadata !51, metadata !DIExpression()) #10, !dbg !131
  %3 = bitcast double** %flush.i to i8**, !dbg !135
  store i8* %call.i, i8** %3, align 8, !dbg !135, !tbaa !64
  %4 = bitcast double* %tmp.i to i8*, !dbg !136
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #10, !dbg !136
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !53, metadata !DIExpression()) #10, !dbg !131
  store double 0.000000e+00, double* %tmp.i, align 8, !dbg !137, !tbaa !68
  %5 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr.i, i64 0, i32 4, !dbg !138
  store i8* getelementptr inbounds ([42 x i8], [42 x i8]* @1, i64 0, i64 0), i8** %5, align 8, !dbg !138, !tbaa !71
  call void @llvm.dbg.value(metadata i32* %cs.i, metadata !50, metadata !DIExpression(DW_OP_deref)) #10, !dbg !131
  call void @llvm.dbg.value(metadata double** %flush.i, metadata !51, metadata !DIExpression(DW_OP_deref)) #10, !dbg !131
  call void @llvm.dbg.value(metadata double* %tmp.i, metadata !53, metadata !DIExpression(DW_OP_deref)) #10, !dbg !131
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* nonnull %.kmpc_loc.addr.i, i32 3, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, double*, double**)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* nonnull %cs.i, double* nonnull %tmp.i, double** nonnull %flush.i) #10, !dbg !138
  %6 = load double, double* %tmp.i, align 8, !dbg !139, !tbaa !68
  call void @llvm.dbg.value(metadata double %6, metadata !53, metadata !DIExpression()) #10, !dbg !131
  %cmp.i = fcmp ugt double %6, 1.000000e+01, !dbg !139
  br i1 %cmp.i, label %if.else.i, label %polybench_flush_cache.exit, !dbg !140

if.else.i:                                        ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), i32 97, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.polybench_flush_cache, i64 0, i64 0)) #11, !dbg !139
  unreachable, !dbg !139

polybench_flush_cache.exit:                       ; preds = %entry
  %7 = load i8*, i8** %3, align 8, !dbg !141, !tbaa !64
  call void @llvm.dbg.value(metadata double* undef, metadata !51, metadata !DIExpression()) #10, !dbg !131
  call void @free(i8* %7) #10, !dbg !142
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #10, !dbg !143
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #10, !dbg !143
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #10, !dbg !143
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %0), !dbg !143
  ret void, !dbg !144
}

; Function Attrs: nounwind uwtable
define dso_local void @polybench_timer_start() local_unnamed_addr #0 !dbg !145 {
entry:
  %cs.i.i = alloca i32, align 4
  %flush.i.i = alloca double*, align 8
  %tmp.i.i = alloca double, align 8
  %.kmpc_loc.addr.i.i = alloca %struct.ident_t, align 8
  %0 = bitcast %struct.ident_t* %.kmpc_loc.addr.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %0) #10
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %0, i8* nonnull align 8 dereferenceable(24) bitcast (%struct.ident_t* @0 to i8*), i64 16, i1 false) #10
  %1 = bitcast i32* %cs.i.i to i8*, !dbg !146
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #10, !dbg !146
  call void @llvm.dbg.value(metadata i32 4194560, metadata !50, metadata !DIExpression()) #10, !dbg !149
  store i32 4194560, i32* %cs.i.i, align 4, !dbg !150, !tbaa !57
  %2 = bitcast double** %flush.i.i to i8*, !dbg !151
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #10, !dbg !151
  call void @llvm.dbg.value(metadata i32 4194560, metadata !50, metadata !DIExpression()) #10, !dbg !149
  %call.i.i = tail call noalias dereferenceable_or_null(33556480) i8* @calloc(i64 4194560, i64 8) #10, !dbg !152
  call void @llvm.dbg.value(metadata i8* %call.i.i, metadata !51, metadata !DIExpression()) #10, !dbg !149
  %3 = bitcast double** %flush.i.i to i8**, !dbg !153
  store i8* %call.i.i, i8** %3, align 8, !dbg !153, !tbaa !64
  %4 = bitcast double* %tmp.i.i to i8*, !dbg !154
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #10, !dbg !154
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !53, metadata !DIExpression()) #10, !dbg !149
  store double 0.000000e+00, double* %tmp.i.i, align 8, !dbg !155, !tbaa !68
  %5 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr.i.i, i64 0, i32 4, !dbg !156
  store i8* getelementptr inbounds ([42 x i8], [42 x i8]* @1, i64 0, i64 0), i8** %5, align 8, !dbg !156, !tbaa !71
  call void @llvm.dbg.value(metadata i32* %cs.i.i, metadata !50, metadata !DIExpression(DW_OP_deref)) #10, !dbg !149
  call void @llvm.dbg.value(metadata double** %flush.i.i, metadata !51, metadata !DIExpression(DW_OP_deref)) #10, !dbg !149
  call void @llvm.dbg.value(metadata double* %tmp.i.i, metadata !53, metadata !DIExpression(DW_OP_deref)) #10, !dbg !149
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* nonnull %.kmpc_loc.addr.i.i, i32 3, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, double*, double**)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* nonnull %cs.i.i, double* nonnull %tmp.i.i, double** nonnull %flush.i.i) #10, !dbg !156
  %6 = load double, double* %tmp.i.i, align 8, !dbg !157, !tbaa !68
  call void @llvm.dbg.value(metadata double %6, metadata !53, metadata !DIExpression()) #10, !dbg !149
  %cmp.i.i = fcmp ugt double %6, 1.000000e+01, !dbg !157
  br i1 %cmp.i.i, label %if.else.i.i, label %polybench_prepare_instruments.exit, !dbg !158

if.else.i.i:                                      ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), i32 97, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.polybench_flush_cache, i64 0, i64 0)) #11, !dbg !157
  unreachable, !dbg !157

polybench_prepare_instruments.exit:               ; preds = %entry
  %7 = load i8*, i8** %3, align 8, !dbg !159, !tbaa !64
  call void @llvm.dbg.value(metadata double* undef, metadata !51, metadata !DIExpression()) #10, !dbg !149
  call void @free(i8* %7) #10, !dbg !160
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #10, !dbg !161
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #10, !dbg !161
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #10, !dbg !161
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %0) #10, !dbg !161
  store double 0.000000e+00, double* @polybench_t_start, align 8, !dbg !162, !tbaa !68
  ret void, !dbg !163
}

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define dso_local void @polybench_timer_stop() local_unnamed_addr #7 !dbg !164 {
entry:
  store double 0.000000e+00, double* @polybench_t_end, align 8, !dbg !165, !tbaa !68
  ret void, !dbg !166
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @polybench_timer_print() local_unnamed_addr #8 !dbg !167 {
entry:
  %0 = load double, double* @polybench_t_end, align 8, !dbg !168, !tbaa !68
  %1 = load double, double* @polybench_t_start, align 8, !dbg !169, !tbaa !68
  %sub = fsub double %0, %1, !dbg !170
  %call = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0), double %sub), !dbg !171
  ret void, !dbg !172
}

; Function Attrs: nofree nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local i8* @polybench_alloc_data(i32 %n, i32 %elt_size) local_unnamed_addr #0 !dbg !173 {
entry:
  %new.i = alloca i8*, align 8
  call void @llvm.dbg.value(metadata i32 %n, metadata !175, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.value(metadata i32 %elt_size, metadata !176, metadata !DIExpression()), !dbg !178
  %mul = mul nsw i32 %elt_size, %n, !dbg !179
  %conv = sext i32 %mul to i64, !dbg !180
  call void @llvm.dbg.value(metadata i64 %conv, metadata !181, metadata !DIExpression()) #10, !dbg !190
  %0 = bitcast i8** %new.i to i8*, !dbg !192
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #10, !dbg !192
  call void @llvm.dbg.value(metadata i8* null, metadata !188, metadata !DIExpression()) #10, !dbg !190
  store i8* null, i8** %new.i, align 8, !dbg !193, !tbaa !64
  call void @llvm.dbg.value(metadata i8** %new.i, metadata !188, metadata !DIExpression(DW_OP_deref)) #10, !dbg !190
  %call.i = call i32 @posix_memalign(i8** nonnull %new.i, i64 32, i64 %conv) #10, !dbg !194
  call void @llvm.dbg.value(metadata i32 %call.i, metadata !189, metadata !DIExpression()) #10, !dbg !190
  %1 = load i8*, i8** %new.i, align 8, !dbg !195, !tbaa !64
  call void @llvm.dbg.value(metadata i8* %1, metadata !188, metadata !DIExpression()) #10, !dbg !190
  %tobool.i = icmp eq i8* %1, null, !dbg !195
  %tobool1.i = icmp ne i32 %call.i, 0, !dbg !197
  %or.cond.i = or i1 %tobool1.i, %tobool.i, !dbg !198
  br i1 %or.cond.i, label %if.then.i, label %xmalloc.exit, !dbg !198

if.then.i:                                        ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !199, !tbaa !64
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.4, i64 0, i64 0), i64 50, i64 1, %struct._IO_FILE* %2) #12, !dbg !201
  call void @exit(i32 1) #11, !dbg !202
  unreachable, !dbg !202

xmalloc.exit:                                     ; preds = %entry
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #10, !dbg !203
  call void @llvm.dbg.value(metadata i8* %1, metadata !177, metadata !DIExpression()), !dbg !178
  ret i8* %1, !dbg !204
}

; Function Attrs: nofree nounwind
declare !dbg !13 dso_local i32 @posix_memalign(i8**, i64, i64) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #9

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 !dbg !205 {
entry:
  call void @llvm.dbg.value(metadata i32 %argc, metadata !212, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.value(metadata i8** %argv, metadata !213, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.value(metadata i32 1024, metadata !214, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.value(metadata i32 1024, metadata !215, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.value(metadata i32 1024, metadata !216, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.value(metadata i32 1024, metadata !217, metadata !DIExpression()), !dbg !225
  %call = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #10, !dbg !226
  call void @llvm.dbg.value(metadata i8* %call, metadata !220, metadata !DIExpression()), !dbg !225
  %call1 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #10, !dbg !227
  call void @llvm.dbg.value(metadata i8* %call1, metadata !221, metadata !DIExpression()), !dbg !225
  %call2 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #10, !dbg !228
  call void @llvm.dbg.value(metadata i8* %call2, metadata !222, metadata !DIExpression()), !dbg !225
  %call3 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #10, !dbg !229
  call void @llvm.dbg.value(metadata i8* %call3, metadata !223, metadata !DIExpression()), !dbg !225
  %call4 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #10, !dbg !230
  call void @llvm.dbg.value(metadata i8* %call4, metadata !224, metadata !DIExpression()), !dbg !225
  %arraydecay = bitcast i8* %call1 to [1024 x double]*, !dbg !231
  %arraydecay6 = bitcast i8* %call3 to [1024 x double]*, !dbg !232
  call void @llvm.dbg.value(metadata i32 1024, metadata !233, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.value(metadata i32 1024, metadata !241, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.value(metadata i32 1024, metadata !242, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.value(metadata i32 1024, metadata !243, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.value(metadata [1024 x double]* %arraydecay, metadata !246, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.value(metadata [1024 x double]* %arraydecay5, metadata !247, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.value(metadata [1024 x double]* %arraydecay6, metadata !248, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.value(metadata [1024 x double]* %arraydecay7, metadata !249, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.value(metadata i32 0, metadata !250, metadata !DIExpression()), !dbg !252
  br label %for.cond1.preheader.i, !dbg !254

for.cond1.preheader.i:                            ; preds = %for.inc8.i, %entry
  %indvars.iv29.i = phi i64 [ 0, %entry ], [ %indvars.iv.next30.i, %for.inc8.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv29.i, metadata !250, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.value(metadata i32 0, metadata !251, metadata !DIExpression()), !dbg !252
  %0 = trunc i64 %indvars.iv29.i to i32, !dbg !256
  %conv.i = sitofp i32 %0 to double, !dbg !256
  br label %for.body3.i, !dbg !260

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv26.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next27.i.1, %for.body3.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv26.i, metadata !251, metadata !DIExpression()), !dbg !252
  %1 = trunc i64 %indvars.iv26.i to i32, !dbg !261
  %conv4.i = sitofp i32 %1 to double, !dbg !261
  %mul.i = fmul double %conv.i, %conv4.i, !dbg !262
  %div.i = fmul double %mul.i, 0x3F50000000000000, !dbg !263
  %arrayidx7.i = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay, i64 %indvars.iv29.i, i64 %indvars.iv26.i, !dbg !264
  store double %div.i, double* %arrayidx7.i, align 8, !dbg !265, !tbaa !68
  %indvars.iv.next27.i = or i64 %indvars.iv26.i, 1, !dbg !266
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next27.i, metadata !251, metadata !DIExpression()), !dbg !252
  %2 = trunc i64 %indvars.iv.next27.i to i32, !dbg !261
  %conv4.i.1 = sitofp i32 %2 to double, !dbg !261
  %mul.i.1 = fmul double %conv.i, %conv4.i.1, !dbg !262
  %div.i.1 = fmul double %mul.i.1, 0x3F50000000000000, !dbg !263
  %arrayidx7.i.1 = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay, i64 %indvars.iv29.i, i64 %indvars.iv.next27.i, !dbg !264
  store double %div.i.1, double* %arrayidx7.i.1, align 8, !dbg !265, !tbaa !68
  %indvars.iv.next27.i.1 = add nuw nsw i64 %indvars.iv26.i, 2, !dbg !266
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next27.i.1, metadata !251, metadata !DIExpression()), !dbg !252
  %exitcond28.i.1 = icmp eq i64 %indvars.iv.next27.i.1, 1024, !dbg !267
  br i1 %exitcond28.i.1, label %for.inc8.i, label %for.body3.i, !dbg !260, !llvm.loop !268

for.inc8.i:                                       ; preds = %for.body3.i
  %indvars.iv.next30.i = add nuw nsw i64 %indvars.iv29.i, 1, !dbg !270
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next30.i, metadata !250, metadata !DIExpression()), !dbg !252
  %exitcond31.i = icmp eq i64 %indvars.iv.next30.i, 1024, !dbg !271
  br i1 %exitcond31.i, label %for.cond15.preheader.i.preheader, label %for.cond1.preheader.i, !dbg !254, !llvm.loop !272

for.cond15.preheader.i.preheader:                 ; preds = %for.inc8.i
  %arraydecay5 = bitcast i8* %call2 to [1024 x double]*, !dbg !274
  %arraydecay7 = bitcast i8* %call4 to [1024 x double]*, !dbg !275
  br label %for.cond15.preheader.i, !dbg !276

for.cond15.preheader.i:                           ; preds = %for.inc31.i, %for.cond15.preheader.i.preheader
  %indvars.iv23.i = phi i64 [ %indvars.iv.next24.i, %for.inc31.i ], [ 0, %for.cond15.preheader.i.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv23.i, metadata !250, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.value(metadata i32 0, metadata !251, metadata !DIExpression()), !dbg !252
  %3 = trunc i64 %indvars.iv23.i to i32, !dbg !278
  %conv19.i = sitofp i32 %3 to double, !dbg !278
  br label %for.body18.i, !dbg !282

for.body18.i:                                     ; preds = %for.body18.i, %for.cond15.preheader.i
  %indvars.iv20.i = phi i64 [ 0, %for.cond15.preheader.i ], [ %indvars.iv.next21.i.1, %for.body18.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv20.i, metadata !251, metadata !DIExpression()), !dbg !252
  %indvars.iv.next21.i = or i64 %indvars.iv20.i, 1, !dbg !283
  %4 = trunc i64 %indvars.iv.next21.i to i32, !dbg !284
  %conv20.i = sitofp i32 %4 to double, !dbg !284
  %mul21.i = fmul double %conv19.i, %conv20.i, !dbg !285
  %div23.i = fmul double %mul21.i, 0x3F50000000000000, !dbg !286
  %arrayidx27.i = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay5, i64 %indvars.iv23.i, i64 %indvars.iv20.i, !dbg !287
  store double %div23.i, double* %arrayidx27.i, align 8, !dbg !288, !tbaa !68
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next21.i, metadata !251, metadata !DIExpression()), !dbg !252
  %indvars.iv.next21.i.1 = add nuw nsw i64 %indvars.iv20.i, 2, !dbg !283
  %5 = trunc i64 %indvars.iv.next21.i.1 to i32, !dbg !284
  %conv20.i.1 = sitofp i32 %5 to double, !dbg !284
  %mul21.i.1 = fmul double %conv19.i, %conv20.i.1, !dbg !285
  %div23.i.1 = fmul double %mul21.i.1, 0x3F50000000000000, !dbg !286
  %arrayidx27.i.1 = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay5, i64 %indvars.iv23.i, i64 %indvars.iv.next21.i, !dbg !287
  store double %div23.i.1, double* %arrayidx27.i.1, align 8, !dbg !288, !tbaa !68
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next21.i.1, metadata !251, metadata !DIExpression()), !dbg !252
  %exitcond22.i.1 = icmp eq i64 %indvars.iv.next21.i.1, 1024, !dbg !289
  br i1 %exitcond22.i.1, label %for.inc31.i, label %for.body18.i, !dbg !282, !llvm.loop !290

for.inc31.i:                                      ; preds = %for.body18.i
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1, !dbg !292
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next24.i, metadata !250, metadata !DIExpression()), !dbg !252
  %exitcond25.i = icmp eq i64 %indvars.iv.next24.i, 1024, !dbg !293
  br i1 %exitcond25.i, label %for.cond38.preheader.i.preheader, label %for.cond15.preheader.i, !dbg !276, !llvm.loop !294

for.cond38.preheader.i.preheader:                 ; preds = %for.inc31.i
  br label %for.cond38.preheader.i, !dbg !296

for.cond38.preheader.i:                           ; preds = %for.inc55.i, %for.cond38.preheader.i.preheader
  %indvars.iv17.i = phi i64 [ %indvars.iv.next18.i, %for.inc55.i ], [ 0, %for.cond38.preheader.i.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv17.i, metadata !250, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.value(metadata i32 0, metadata !251, metadata !DIExpression()), !dbg !252
  %6 = trunc i64 %indvars.iv17.i to i32, !dbg !298
  %conv42.i = sitofp i32 %6 to double, !dbg !298
  br label %for.body41.i, !dbg !302

for.body41.i:                                     ; preds = %for.body41.i, %for.cond38.preheader.i
  %indvars.iv13.i = phi i64 [ 0, %for.cond38.preheader.i ], [ %indvars.iv.next14.i.1, %for.body41.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv13.i, metadata !251, metadata !DIExpression()), !dbg !252
  %7 = trunc i64 %indvars.iv13.i to i32, !dbg !303
  %8 = add nuw nsw i32 %7, 3, !dbg !303
  %conv44.i = sitofp i32 %8 to double, !dbg !303
  %mul45.i = fmul double %conv42.i, %conv44.i, !dbg !304
  %div47.i = fmul double %mul45.i, 0x3F50000000000000, !dbg !305
  %arrayidx51.i = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay6, i64 %indvars.iv17.i, i64 %indvars.iv13.i, !dbg !306
  store double %div47.i, double* %arrayidx51.i, align 8, !dbg !307, !tbaa !68
  %indvars.iv.next14.i = or i64 %indvars.iv13.i, 1, !dbg !308
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next14.i, metadata !251, metadata !DIExpression()), !dbg !252
  %9 = trunc i64 %indvars.iv.next14.i to i32, !dbg !303
  %10 = add nuw nsw i32 %9, 3, !dbg !303
  %conv44.i.1 = sitofp i32 %10 to double, !dbg !303
  %mul45.i.1 = fmul double %conv42.i, %conv44.i.1, !dbg !304
  %div47.i.1 = fmul double %mul45.i.1, 0x3F50000000000000, !dbg !305
  %arrayidx51.i.1 = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay6, i64 %indvars.iv17.i, i64 %indvars.iv.next14.i, !dbg !306
  store double %div47.i.1, double* %arrayidx51.i.1, align 8, !dbg !307, !tbaa !68
  %indvars.iv.next14.i.1 = add nuw nsw i64 %indvars.iv13.i, 2, !dbg !308
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next14.i.1, metadata !251, metadata !DIExpression()), !dbg !252
  %exitcond16.i.1 = icmp eq i64 %indvars.iv.next14.i.1, 1024, !dbg !309
  br i1 %exitcond16.i.1, label %for.inc55.i, label %for.body41.i, !dbg !302, !llvm.loop !310

for.inc55.i:                                      ; preds = %for.body41.i
  %indvars.iv.next18.i = add nuw nsw i64 %indvars.iv17.i, 1, !dbg !312
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next18.i, metadata !250, metadata !DIExpression()), !dbg !252
  %exitcond19.i = icmp eq i64 %indvars.iv.next18.i, 1024, !dbg !313
  br i1 %exitcond19.i, label %for.cond62.preheader.i.preheader, label %for.cond38.preheader.i, !dbg !296, !llvm.loop !314

for.cond62.preheader.i.preheader:                 ; preds = %for.inc55.i
  br label %for.cond62.preheader.i, !dbg !316

for.cond62.preheader.i:                           ; preds = %for.inc79.i, %for.cond62.preheader.i.preheader
  %indvars.iv10.i = phi i64 [ %indvars.iv.next11.i, %for.inc79.i ], [ 0, %for.cond62.preheader.i.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv10.i, metadata !250, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.value(metadata i32 0, metadata !251, metadata !DIExpression()), !dbg !252
  %11 = trunc i64 %indvars.iv10.i to i32, !dbg !318
  %conv66.i = sitofp i32 %11 to double, !dbg !318
  br label %for.body65.i, !dbg !322

for.body65.i:                                     ; preds = %for.body65.i, %for.cond62.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond62.preheader.i ], [ %indvars.iv.next.i.1, %for.body65.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i, metadata !251, metadata !DIExpression()), !dbg !252
  %12 = trunc i64 %indvars.iv.i to i32, !dbg !323
  %13 = add nuw nsw i32 %12, 2, !dbg !323
  %conv68.i = sitofp i32 %13 to double, !dbg !323
  %mul69.i = fmul double %conv66.i, %conv68.i, !dbg !324
  %div71.i = fmul double %mul69.i, 0x3F50000000000000, !dbg !325
  %arrayidx75.i = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay7, i64 %indvars.iv10.i, i64 %indvars.iv.i, !dbg !326
  store double %div71.i, double* %arrayidx75.i, align 8, !dbg !327, !tbaa !68
  %indvars.iv.next.i = or i64 %indvars.iv.i, 1, !dbg !328
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i, metadata !251, metadata !DIExpression()), !dbg !252
  %14 = trunc i64 %indvars.iv.next.i to i32, !dbg !323
  %15 = add nuw nsw i32 %14, 2, !dbg !323
  %conv68.i.1 = sitofp i32 %15 to double, !dbg !323
  %mul69.i.1 = fmul double %conv66.i, %conv68.i.1, !dbg !324
  %div71.i.1 = fmul double %mul69.i.1, 0x3F50000000000000, !dbg !325
  %arrayidx75.i.1 = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay7, i64 %indvars.iv10.i, i64 %indvars.iv.next.i, !dbg !326
  store double %div71.i.1, double* %arrayidx75.i.1, align 8, !dbg !327, !tbaa !68
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.i, 2, !dbg !328
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.1, metadata !251, metadata !DIExpression()), !dbg !252
  %exitcond.i.1 = icmp eq i64 %indvars.iv.next.i.1, 1024, !dbg !329
  br i1 %exitcond.i.1, label %for.inc79.i, label %for.body65.i, !dbg !322, !llvm.loop !330

for.inc79.i:                                      ; preds = %for.body65.i
  %indvars.iv.next11.i = add nuw nsw i64 %indvars.iv10.i, 1, !dbg !332
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next11.i, metadata !250, metadata !DIExpression()), !dbg !252
  %exitcond12.i = icmp eq i64 %indvars.iv.next11.i, 1024, !dbg !333
  br i1 %exitcond12.i, label %init_array.exit, label %for.cond62.preheader.i, !dbg !316, !llvm.loop !334

init_array.exit:                                  ; preds = %for.inc79.i
  call void @llvm.dbg.value(metadata double 3.241200e+04, metadata !218, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.value(metadata double 2.123000e+03, metadata !219, metadata !DIExpression()), !dbg !225
  %arraydecay8 = bitcast i8* %call to [1024 x double]*, !dbg !336
  call void @llvm.dbg.value(metadata i32 1024, metadata !337, metadata !DIExpression()), !dbg !355
  call void @llvm.dbg.value(metadata i32 1024, metadata !342, metadata !DIExpression()), !dbg !355
  call void @llvm.dbg.value(metadata i32 1024, metadata !343, metadata !DIExpression()), !dbg !355
  call void @llvm.dbg.value(metadata i32 1024, metadata !344, metadata !DIExpression()), !dbg !355
  call void @llvm.dbg.value(metadata double 3.241200e+04, metadata !345, metadata !DIExpression()), !dbg !355
  call void @llvm.dbg.value(metadata double 2.123000e+03, metadata !346, metadata !DIExpression()), !dbg !355
  call void @llvm.dbg.value(metadata [1024 x double]* %arraydecay8, metadata !347, metadata !DIExpression()), !dbg !355
  call void @llvm.dbg.value(metadata [1024 x double]* %arraydecay, metadata !348, metadata !DIExpression()), !dbg !355
  call void @llvm.dbg.value(metadata [1024 x double]* %arraydecay5, metadata !349, metadata !DIExpression()), !dbg !355
  call void @llvm.dbg.value(metadata [1024 x double]* %arraydecay6, metadata !350, metadata !DIExpression()), !dbg !355
  call void @llvm.dbg.value(metadata [1024 x double]* %arraydecay7, metadata !351, metadata !DIExpression()), !dbg !355
  call void @llvm.dbg.value(metadata i32 0, metadata !352, metadata !DIExpression()), !dbg !355
  br label %for.cond1.preheader.i45, !dbg !357

for.cond1.preheader.i45:                          ; preds = %for.inc25.i, %init_array.exit
  %indvar.i = phi i64 [ 0, %init_array.exit ], [ %indvar.next.i, %for.inc25.i ]
  call void @llvm.dbg.value(metadata i64 %indvar.i, metadata !352, metadata !DIExpression()), !dbg !355
  call void @llvm.dbg.value(metadata i32 0, metadata !353, metadata !DIExpression()), !dbg !355
  br label %for.body3.i46, !dbg !359

for.body3.i46:                                    ; preds = %for.inc22.i, %for.cond1.preheader.i45
  %indvars.iv16.i = phi i64 [ 0, %for.cond1.preheader.i45 ], [ %indvars.iv.next17.i, %for.inc22.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv16.i, metadata !353, metadata !DIExpression()), !dbg !355
  %arrayidx5.i = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay8, i64 %indvar.i, i64 %indvars.iv16.i, !dbg !362
  store double 0.000000e+00, double* %arrayidx5.i, align 8, !dbg !365, !tbaa !68
  call void @llvm.dbg.value(metadata i32 0, metadata !354, metadata !DIExpression()), !dbg !355
  br label %for.body8.i, !dbg !366

for.body8.i:                                      ; preds = %for.body8.i, %for.body3.i46
  %16 = phi double [ 0.000000e+00, %for.body3.i46 ], [ %add.i.1, %for.body8.i ], !dbg !368
  %indvars.iv13.i47 = phi i64 [ 0, %for.body3.i46 ], [ %indvars.iv.next14.i49.1, %for.body8.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv13.i47, metadata !354, metadata !DIExpression()), !dbg !355
  %arrayidx12.i = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay, i64 %indvar.i, i64 %indvars.iv13.i47, !dbg !370
  %17 = load double, double* %arrayidx12.i, align 8, !dbg !370, !tbaa !68
  %mul.i48 = fmul double %17, 3.241200e+04, !dbg !371
  %arrayidx16.i = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay5, i64 %indvars.iv13.i47, i64 %indvars.iv16.i, !dbg !372
  %18 = load double, double* %arrayidx16.i, align 8, !dbg !372, !tbaa !68
  %mul17.i = fmul double %mul.i48, %18, !dbg !373
  %add.i = fadd double %16, %mul17.i, !dbg !368
  store double %add.i, double* %arrayidx5.i, align 8, !dbg !368, !tbaa !68
  %indvars.iv.next14.i49 = or i64 %indvars.iv13.i47, 1, !dbg !374
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next14.i49, metadata !354, metadata !DIExpression()), !dbg !355
  %arrayidx12.i.1 = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay, i64 %indvar.i, i64 %indvars.iv.next14.i49, !dbg !370
  %19 = load double, double* %arrayidx12.i.1, align 8, !dbg !370, !tbaa !68
  %mul.i48.1 = fmul double %19, 3.241200e+04, !dbg !371
  %arrayidx16.i.1 = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay5, i64 %indvars.iv.next14.i49, i64 %indvars.iv16.i, !dbg !372
  %20 = load double, double* %arrayidx16.i.1, align 8, !dbg !372, !tbaa !68
  %mul17.i.1 = fmul double %mul.i48.1, %20, !dbg !373
  %add.i.1 = fadd double %add.i, %mul17.i.1, !dbg !368
  store double %add.i.1, double* %arrayidx5.i, align 8, !dbg !368, !tbaa !68
  %indvars.iv.next14.i49.1 = add nuw nsw i64 %indvars.iv13.i47, 2, !dbg !374
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next14.i49.1, metadata !354, metadata !DIExpression()), !dbg !355
  %exitcond15.i.1 = icmp eq i64 %indvars.iv.next14.i49.1, 1024, !dbg !375
  br i1 %exitcond15.i.1, label %for.inc22.i, label %for.body8.i, !dbg !366, !llvm.loop !376

for.inc22.i:                                      ; preds = %for.body8.i
  %indvars.iv.next17.i = add nuw nsw i64 %indvars.iv16.i, 1, !dbg !378
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next17.i, metadata !353, metadata !DIExpression()), !dbg !355
  %exitcond18.i = icmp eq i64 %indvars.iv.next17.i, 1024, !dbg !379
  br i1 %exitcond18.i, label %for.inc25.i, label %for.body3.i46, !dbg !359, !llvm.loop !380

for.inc25.i:                                      ; preds = %for.inc22.i
  %indvar.next.i = add nuw nsw i64 %indvar.i, 1, !dbg !382
  call void @llvm.dbg.value(metadata i64 %indvar.next.i, metadata !352, metadata !DIExpression()), !dbg !355
  %exitcond20.i = icmp eq i64 %indvar.next.i, 1024, !dbg !383
  br i1 %exitcond20.i, label %for.cond31.preheader.i.preheader, label %for.cond1.preheader.i45, !dbg !357, !llvm.loop !384

for.cond31.preheader.i.preheader:                 ; preds = %for.inc25.i
  br label %for.cond31.preheader.i, !dbg !386

for.cond31.preheader.i:                           ; preds = %for.inc62.i, %for.cond31.preheader.i.preheader
  %indvars.iv10.i50 = phi i64 [ %indvars.iv.next11.i55, %for.inc62.i ], [ 0, %for.cond31.preheader.i.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv10.i50, metadata !352, metadata !DIExpression()), !dbg !355
  call void @llvm.dbg.value(metadata i32 0, metadata !353, metadata !DIExpression()), !dbg !355
  br label %for.body33.i, !dbg !388

for.body33.i:                                     ; preds = %for.inc59.i, %for.cond31.preheader.i
  %indvars.iv7.i = phi i64 [ 0, %for.cond31.preheader.i ], [ %indvars.iv.next8.i, %for.inc59.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv7.i, metadata !353, metadata !DIExpression()), !dbg !355
  %arrayidx37.i = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay7, i64 %indvars.iv10.i50, i64 %indvars.iv7.i, !dbg !391
  %21 = load double, double* %arrayidx37.i, align 8, !dbg !394, !tbaa !68
  %mul38.i = fmul double %21, 2.123000e+03, !dbg !394
  store double %mul38.i, double* %arrayidx37.i, align 8, !dbg !394, !tbaa !68
  call void @llvm.dbg.value(metadata i32 0, metadata !354, metadata !DIExpression()), !dbg !355
  br label %for.body41.i54, !dbg !395

for.body41.i54:                                   ; preds = %for.body41.i54, %for.body33.i
  %22 = phi double [ %mul38.i, %for.body33.i ], [ %add55.i.1, %for.body41.i54 ], !dbg !397
  %indvars.iv.i51 = phi i64 [ 0, %for.body33.i ], [ %indvars.iv.next.i52.1, %for.body41.i54 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i51, metadata !354, metadata !DIExpression()), !dbg !355
  %arrayidx45.i = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay8, i64 %indvars.iv10.i50, i64 %indvars.iv.i51, !dbg !399
  %23 = load double, double* %arrayidx45.i, align 8, !dbg !399, !tbaa !68
  %arrayidx49.i = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay6, i64 %indvars.iv.i51, i64 %indvars.iv7.i, !dbg !400
  %24 = load double, double* %arrayidx49.i, align 8, !dbg !400, !tbaa !68
  %mul50.i = fmul double %23, %24, !dbg !401
  %add55.i = fadd double %22, %mul50.i, !dbg !397
  store double %add55.i, double* %arrayidx37.i, align 8, !dbg !397, !tbaa !68
  %indvars.iv.next.i52 = or i64 %indvars.iv.i51, 1, !dbg !402
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i52, metadata !354, metadata !DIExpression()), !dbg !355
  %arrayidx45.i.1 = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay8, i64 %indvars.iv10.i50, i64 %indvars.iv.next.i52, !dbg !399
  %25 = load double, double* %arrayidx45.i.1, align 8, !dbg !399, !tbaa !68
  %arrayidx49.i.1 = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay6, i64 %indvars.iv.next.i52, i64 %indvars.iv7.i, !dbg !400
  %26 = load double, double* %arrayidx49.i.1, align 8, !dbg !400, !tbaa !68
  %mul50.i.1 = fmul double %25, %26, !dbg !401
  %add55.i.1 = fadd double %add55.i, %mul50.i.1, !dbg !397
  store double %add55.i.1, double* %arrayidx37.i, align 8, !dbg !397, !tbaa !68
  %indvars.iv.next.i52.1 = add nuw nsw i64 %indvars.iv.i51, 2, !dbg !402
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i52.1, metadata !354, metadata !DIExpression()), !dbg !355
  %exitcond.i53.1 = icmp eq i64 %indvars.iv.next.i52.1, 1024, !dbg !403
  br i1 %exitcond.i53.1, label %for.inc59.i, label %for.body41.i54, !dbg !395, !llvm.loop !404

for.inc59.i:                                      ; preds = %for.body41.i54
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1, !dbg !406
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next8.i, metadata !353, metadata !DIExpression()), !dbg !355
  %exitcond9.i = icmp eq i64 %indvars.iv.next8.i, 1024, !dbg !407
  br i1 %exitcond9.i, label %for.inc62.i, label %for.body33.i, !dbg !388, !llvm.loop !408

for.inc62.i:                                      ; preds = %for.inc59.i
  %indvars.iv.next11.i55 = add nuw nsw i64 %indvars.iv10.i50, 1, !dbg !410
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next11.i55, metadata !352, metadata !DIExpression()), !dbg !355
  %exitcond12.i56 = icmp eq i64 %indvars.iv.next11.i55, 1024, !dbg !411
  br i1 %exitcond12.i56, label %kernel_2mm.exit, label %for.cond31.preheader.i, !dbg !386, !llvm.loop !412

kernel_2mm.exit:                                  ; preds = %for.inc62.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !414
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !414

land.lhs.true:                                    ; preds = %kernel_2mm.exit
  %27 = load i8*, i8** %argv, align 8, !dbg !414, !tbaa !64
  %strcmpload = load i8, i8* %27, align 1, !dbg !414
  %tobool = icmp eq i8 %strcmpload, 0, !dbg !414
  br i1 %tobool, label %for.cond1.preheader.i58.preheader, label %if.end, !dbg !416

for.cond1.preheader.i58.preheader:                ; preds = %land.lhs.true
  br label %for.cond1.preheader.i58, !dbg !417

for.cond1.preheader.i58:                          ; preds = %for.inc8.i65, %for.cond1.preheader.i58.preheader
  %indvars.iv7.i57 = phi i64 [ %indvars.iv.next8.i64, %for.inc8.i65 ], [ 0, %for.cond1.preheader.i58.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv7.i57, metadata !426, metadata !DIExpression()) #10, !dbg !429
  call void @llvm.dbg.value(metadata i32 0, metadata !427, metadata !DIExpression()) #10, !dbg !429
  %28 = shl i64 %indvars.iv7.i57, 10, !dbg !430
  br label %for.body3.i61, !dbg !436

for.body3.i61:                                    ; preds = %for.inc.i, %for.cond1.preheader.i58
  %indvars.iv.i59 = phi i64 [ 0, %for.cond1.preheader.i58 ], [ %indvars.iv.next.i62, %for.inc.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i59, metadata !427, metadata !DIExpression()) #10, !dbg !429
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !437, !tbaa !64
  %arrayidx5.i60 = getelementptr inbounds [1024 x double], [1024 x double]* %arraydecay7, i64 %indvars.iv7.i57, i64 %indvars.iv.i59, !dbg !438
  %30 = load double, double* %arrayidx5.i60, align 8, !dbg !438, !tbaa !68
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1.1, i64 0, i64 0), double %30) #12, !dbg !439
  %31 = add nuw nsw i64 %indvars.iv.i59, %28, !dbg !440
  %32 = trunc i64 %31 to i32, !dbg !441
  %rem.i = urem i32 %32, 20, !dbg !441
  %cmp6.i = icmp eq i32 %rem.i, 0, !dbg !442
  br i1 %cmp6.i, label %if.then.i, label %for.inc.i, !dbg !443

if.then.i:                                        ; preds = %for.body3.i61
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !444, !tbaa !64
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %33) #12, !dbg !445
  br label %for.inc.i, !dbg !445

for.inc.i:                                        ; preds = %if.then.i, %for.body3.i61
  %indvars.iv.next.i62 = add nuw nsw i64 %indvars.iv.i59, 1, !dbg !446
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i62, metadata !427, metadata !DIExpression()) #10, !dbg !429
  %exitcond.i63 = icmp eq i64 %indvars.iv.next.i62, 1024, !dbg !447
  br i1 %exitcond.i63, label %for.inc8.i65, label %for.body3.i61, !dbg !436, !llvm.loop !448

for.inc8.i65:                                     ; preds = %for.inc.i
  %indvars.iv.next8.i64 = add nuw nsw i64 %indvars.iv7.i57, 1, !dbg !450
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next8.i64, metadata !426, metadata !DIExpression()) #10, !dbg !429
  %exitcond10.i = icmp eq i64 %indvars.iv.next8.i64, 1024, !dbg !451
  br i1 %exitcond10.i, label %print_array.exit, label %for.cond1.preheader.i58, !dbg !417, !llvm.loop !452

print_array.exit:                                 ; preds = %for.inc8.i65
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !454, !tbaa !64
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %34) #12, !dbg !455
  br label %if.end, !dbg !414

if.end:                                           ; preds = %print_array.exit, %land.lhs.true, %kernel_2mm.exit
  %call15 = tail call i32 (i8*, ...) bitcast (void (i8*)* @free to i32 (i8*, ...)*)(i8* %call) #10, !dbg !456
  %call16 = tail call i32 (i8*, ...) bitcast (void (i8*)* @free to i32 (i8*, ...)*)(i8* %call1) #10, !dbg !457
  %call17 = tail call i32 (i8*, ...) bitcast (void (i8*)* @free to i32 (i8*, ...)*)(i8* %call2) #10, !dbg !458
  %call18 = tail call i32 (i8*, ...) bitcast (void (i8*)* @free to i32 (i8*, ...)*)(i8* %call3) #10, !dbg !459
  %call19 = tail call i32 (i8*, ...) bitcast (void (i8*)* @free to i32 (i8*, ...)*)(i8* nonnull %call4) #10, !dbg !460
  ret i32 0, !dbg !461
}

; Function Attrs: nofree nounwind
declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #9

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nofree norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nofree nounwind }
attributes #10 = { nounwind }
attributes #11 = { noreturn nounwind }
attributes #12 = { cold nounwind }

!llvm.dbg.cu = !{!2, !31}
!llvm.ident = !{!42, !42}
!llvm.module.flags = !{!43, !44, !45}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "polybench_t_start", scope: !2, file: !3, line: 51, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (git@github.com:SusanTan/llvm-project.git fcc6352b59353e5ddb5bfbd85a3919893d4595c9)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !19, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "polybench.c", directory: "/scratch/yc0769/xstack-benchmark/xstack-benchmark/polybench-3.1/linear-algebra/kernels/2mm")
!4 = !{}
!5 = !{!6, !8, !12, !13}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!8 = !DISubprogram(name: "free", scope: !9, file: !9, line: 565, type: !10, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !4)
!9 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DISubprogram(name: "posix_memalign", scope: !9, file: !9, line: 580, type: !14, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{!16, !17, !18, !18}
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!18 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!19 = !{!0, !20, !22, !25, !27, !29}
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "polybench_t_end", scope: !2, file: !3, line: 51, type: !7, isLocal: false, isDefinition: true)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "polybench_c_start", scope: !2, file: !3, line: 53, type: !24, isLocal: false, isDefinition: true)
!24 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(name: "polybench_c_end", scope: !2, file: !3, line: 53, type: !24, isLocal: false, isDefinition: true)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "polybench_papi_counters_threadid", scope: !2, file: !3, line: 33, type: !16, isLocal: false, isDefinition: true)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "polybench_program_total_flops", scope: !2, file: !3, line: 34, type: !7, isLocal: false, isDefinition: true)
!31 = distinct !DICompileUnit(language: DW_LANG_C99, file: !32, producer: "clang version 10.0.1 (git@github.com:SusanTan/llvm-project.git fcc6352b59353e5ddb5bfbd85a3919893d4595c9)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !33, splitDebugInlining: false, nameTableKind: None)
!32 = !DIFile(filename: "2mm.c", directory: "/scratch/yc0769/xstack-benchmark/xstack-benchmark/polybench-3.1/linear-algebra/kernels/2mm")
!33 = !{!34, !38, !12, !7}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 67108864, elements: !36)
!36 = !{!37, !37}
!37 = !DISubrange(count: 1024)
!38 = !DISubprogram(name: "polybench_alloc_data", scope: !39, file: !39, line: 188, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !4)
!39 = !DIFile(filename: "./polybench.h", directory: "/scratch/yc0769/xstack-benchmark/xstack-benchmark/polybench-3.1/linear-algebra/kernels/2mm")
!40 = !DISubroutineType(types: !41)
!41 = !{!12, !16, !16}
!42 = !{!"clang version 10.0.1 (git@github.com:SusanTan/llvm-project.git fcc6352b59353e5ddb5bfbd85a3919893d4595c9)"}
!43 = !{i32 7, !"Dwarf Version", i32 4}
!44 = !{i32 2, !"Debug Info Version", i32 3}
!45 = !{i32 1, !"wchar_size", i32 4}
!46 = distinct !DISubprogram(name: "polybench_flush_cache", scope: !3, file: !3, line: 86, type: !47, scopeLine: 87, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !49)
!47 = !DISubroutineType(types: !48)
!48 = !{null}
!49 = !{!50, !51, !52, !53}
!50 = !DILocalVariable(name: "cs", scope: !46, file: !3, line: 88, type: !16)
!51 = !DILocalVariable(name: "flush", scope: !46, file: !3, line: 89, type: !6)
!52 = !DILocalVariable(name: "i", scope: !46, file: !3, line: 90, type: !16)
!53 = !DILocalVariable(name: "tmp", scope: !46, file: !3, line: 91, type: !7)
!54 = !DILocation(line: 88, column: 3, scope: !46)
!55 = !DILocation(line: 0, scope: !46)
!56 = !DILocation(line: 88, column: 7, scope: !46)
!57 = !{!58, !58, i64 0}
!58 = !{!"int", !59, i64 0}
!59 = !{!"omnipotent char", !60, i64 0}
!60 = !{!"Simple C/C++ TBAA"}
!61 = !DILocation(line: 89, column: 3, scope: !46)
!62 = !DILocation(line: 89, column: 29, scope: !46)
!63 = !DILocation(line: 89, column: 11, scope: !46)
!64 = !{!65, !65, i64 0}
!65 = !{!"any pointer", !59, i64 0}
!66 = !DILocation(line: 91, column: 3, scope: !46)
!67 = !DILocation(line: 91, column: 10, scope: !46)
!68 = !{!69, !69, i64 0}
!69 = !{!"double", !59, i64 0}
!70 = !DILocation(line: 93, column: 1, scope: !46)
!71 = !{!72, !65, i64 16}
!72 = !{!"ident_t", !58, i64 0, !58, i64 4, !58, i64 8, !58, i64 12, !65, i64 16}
!73 = !DILocation(line: 97, column: 3, scope: !74)
!74 = distinct !DILexicalBlock(scope: !75, file: !3, line: 97, column: 3)
!75 = distinct !DILexicalBlock(scope: !46, file: !3, line: 97, column: 3)
!76 = !DILocation(line: 97, column: 3, scope: !75)
!77 = !DILocation(line: 98, column: 9, scope: !46)
!78 = !DILocation(line: 98, column: 3, scope: !46)
!79 = !DILocation(line: 99, column: 1, scope: !46)
!80 = distinct !DISubprogram(name: ".omp_outlined.", scope: !3, file: !3, line: 95, type: !81, scopeLine: 95, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !90)
!81 = !DISubroutineType(types: !82)
!82 = !{null, !83, !83, !87, !88, !89}
!83 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !84)
!84 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !85)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !16)
!87 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !16, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !7, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !6, size: 64)
!90 = !{!91, !92, !93, !94, !95}
!91 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !80, type: !83, flags: DIFlagArtificial)
!92 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !80, type: !83, flags: DIFlagArtificial)
!93 = !DILocalVariable(name: "cs", arg: 3, scope: !80, type: !87, flags: DIFlagArtificial)
!94 = !DILocalVariable(name: "tmp", arg: 4, scope: !80, type: !88, flags: DIFlagArtificial)
!95 = !DILocalVariable(name: "flush", arg: 5, scope: !80, type: !89, flags: DIFlagArtificial)
!96 = !DILocation(line: 0, scope: !80)
!97 = !{!98}
!98 = distinct !{!98, !99, !".omp_outlined._debug__: %.global_tid."}
!99 = distinct !{!99, !".omp_outlined._debug__"}
!100 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !101, type: !83, flags: DIFlagArtificial)
!101 = distinct !DISubprogram(name: ".omp_outlined._debug__", scope: !3, file: !3, line: 95, type: !81, scopeLine: 95, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !102)
!102 = !{!100, !103, !104, !105, !106, !107, !108, !108, !109, !110, !111, !112, !113, !109}
!103 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !101, type: !83, flags: DIFlagArtificial)
!104 = !DILocalVariable(name: "cs", arg: 3, scope: !101, file: !3, line: 88, type: !87)
!105 = !DILocalVariable(name: "tmp", arg: 4, scope: !101, file: !3, line: 91, type: !88)
!106 = !DILocalVariable(name: "flush", arg: 5, scope: !101, file: !3, line: 89, type: !89)
!107 = !DILocalVariable(name: ".omp.iv", scope: !101, type: !16, flags: DIFlagArtificial)
!108 = !DILocalVariable(name: ".capture_expr.", scope: !101, type: !16, flags: DIFlagArtificial)
!109 = !DILocalVariable(name: "i", scope: !101, type: !16, flags: DIFlagArtificial)
!110 = !DILocalVariable(name: ".omp.lb", scope: !101, type: !16, flags: DIFlagArtificial)
!111 = !DILocalVariable(name: ".omp.ub", scope: !101, type: !16, flags: DIFlagArtificial)
!112 = !DILocalVariable(name: ".omp.stride", scope: !101, type: !16, flags: DIFlagArtificial)
!113 = !DILocalVariable(name: ".omp.is_last", scope: !101, type: !16, flags: DIFlagArtificial)
!114 = !DILocation(line: 0, scope: !101, inlinedAt: !115)
!115 = distinct !DILocation(line: 95, column: 3, scope: !80)
!116 = !DILocation(line: 95, column: 19, scope: !101, inlinedAt: !115)
!117 = !DILocation(line: 95, column: 3, scope: !101, inlinedAt: !115)
!118 = !DILocation(line: 95, column: 8, scope: !101, inlinedAt: !115)
!119 = !DILocation(line: 96, column: 9, scope: !101, inlinedAt: !115)
!120 = !DILocation(line: 96, column: 12, scope: !101, inlinedAt: !115)
!121 = distinct !{!121, !122, !123}
!122 = !DILocation(line: 93, column: 1, scope: !101, inlinedAt: !115)
!123 = !DILocation(line: 93, column: 25, scope: !101, inlinedAt: !115)
!124 = !DILocation(line: 96, column: 19, scope: !101, inlinedAt: !115)
!125 = !DILocation(line: 95, column: 3, scope: !80)
!126 = !{!127}
!127 = !{i64 2, i64 -1, i64 -1, i1 true}
!128 = distinct !DISubprogram(name: "polybench_prepare_instruments", scope: !3, file: !3, line: 322, type: !47, scopeLine: 323, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!129 = !DILocation(line: 88, column: 3, scope: !46, inlinedAt: !130)
!130 = distinct !DILocation(line: 325, column: 3, scope: !128)
!131 = !DILocation(line: 0, scope: !46, inlinedAt: !130)
!132 = !DILocation(line: 88, column: 7, scope: !46, inlinedAt: !130)
!133 = !DILocation(line: 89, column: 3, scope: !46, inlinedAt: !130)
!134 = !DILocation(line: 89, column: 29, scope: !46, inlinedAt: !130)
!135 = !DILocation(line: 89, column: 11, scope: !46, inlinedAt: !130)
!136 = !DILocation(line: 91, column: 3, scope: !46, inlinedAt: !130)
!137 = !DILocation(line: 91, column: 10, scope: !46, inlinedAt: !130)
!138 = !DILocation(line: 93, column: 1, scope: !46, inlinedAt: !130)
!139 = !DILocation(line: 97, column: 3, scope: !74, inlinedAt: !130)
!140 = !DILocation(line: 97, column: 3, scope: !75, inlinedAt: !130)
!141 = !DILocation(line: 98, column: 9, scope: !46, inlinedAt: !130)
!142 = !DILocation(line: 98, column: 3, scope: !46, inlinedAt: !130)
!143 = !DILocation(line: 99, column: 1, scope: !46, inlinedAt: !130)
!144 = !DILocation(line: 330, column: 1, scope: !128)
!145 = distinct !DISubprogram(name: "polybench_timer_start", scope: !3, file: !3, line: 333, type: !47, scopeLine: 334, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!146 = !DILocation(line: 88, column: 3, scope: !46, inlinedAt: !147)
!147 = distinct !DILocation(line: 325, column: 3, scope: !128, inlinedAt: !148)
!148 = distinct !DILocation(line: 335, column: 3, scope: !145)
!149 = !DILocation(line: 0, scope: !46, inlinedAt: !147)
!150 = !DILocation(line: 88, column: 7, scope: !46, inlinedAt: !147)
!151 = !DILocation(line: 89, column: 3, scope: !46, inlinedAt: !147)
!152 = !DILocation(line: 89, column: 29, scope: !46, inlinedAt: !147)
!153 = !DILocation(line: 89, column: 11, scope: !46, inlinedAt: !147)
!154 = !DILocation(line: 91, column: 3, scope: !46, inlinedAt: !147)
!155 = !DILocation(line: 91, column: 10, scope: !46, inlinedAt: !147)
!156 = !DILocation(line: 93, column: 1, scope: !46, inlinedAt: !147)
!157 = !DILocation(line: 97, column: 3, scope: !74, inlinedAt: !147)
!158 = !DILocation(line: 97, column: 3, scope: !75, inlinedAt: !147)
!159 = !DILocation(line: 98, column: 9, scope: !46, inlinedAt: !147)
!160 = !DILocation(line: 98, column: 3, scope: !46, inlinedAt: !147)
!161 = !DILocation(line: 99, column: 1, scope: !46, inlinedAt: !147)
!162 = !DILocation(line: 337, column: 21, scope: !145)
!163 = !DILocation(line: 341, column: 1, scope: !145)
!164 = distinct !DISubprogram(name: "polybench_timer_stop", scope: !3, file: !3, line: 344, type: !47, scopeLine: 345, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!165 = !DILocation(line: 347, column: 19, scope: !164)
!166 = !DILocation(line: 354, column: 1, scope: !164)
!167 = distinct !DISubprogram(name: "polybench_timer_print", scope: !3, file: !3, line: 357, type: !47, scopeLine: 358, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!168 = !DILocation(line: 371, column: 26, scope: !167)
!169 = !DILocation(line: 371, column: 44, scope: !167)
!170 = !DILocation(line: 371, column: 42, scope: !167)
!171 = !DILocation(line: 371, column: 7, scope: !167)
!172 = !DILocation(line: 376, column: 1, scope: !167)
!173 = distinct !DISubprogram(name: "polybench_alloc_data", scope: !3, file: !3, line: 395, type: !40, scopeLine: 396, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !174)
!174 = !{!175, !176, !177}
!175 = !DILocalVariable(name: "n", arg: 1, scope: !173, file: !3, line: 395, type: !16)
!176 = !DILocalVariable(name: "elt_size", arg: 2, scope: !173, file: !3, line: 395, type: !16)
!177 = !DILocalVariable(name: "ret", scope: !173, file: !3, line: 397, type: !12)
!178 = !DILocation(line: 0, scope: !173)
!179 = !DILocation(line: 397, column: 26, scope: !173)
!180 = !DILocation(line: 397, column: 24, scope: !173)
!181 = !DILocalVariable(name: "num", arg: 1, scope: !182, file: !3, line: 382, type: !185)
!182 = distinct !DISubprogram(name: "xmalloc", scope: !3, file: !3, line: 382, type: !183, scopeLine: 383, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !187)
!183 = !DISubroutineType(types: !184)
!184 = !{!12, !185}
!185 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !186, line: 46, baseType: !18)
!186 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!187 = !{!181, !188, !189}
!188 = !DILocalVariable(name: "new", scope: !182, file: !3, line: 384, type: !12)
!189 = !DILocalVariable(name: "ret", scope: !182, file: !3, line: 385, type: !16)
!190 = !DILocation(line: 0, scope: !182, inlinedAt: !191)
!191 = distinct !DILocation(line: 397, column: 15, scope: !173)
!192 = !DILocation(line: 384, column: 3, scope: !182, inlinedAt: !191)
!193 = !DILocation(line: 384, column: 9, scope: !182, inlinedAt: !191)
!194 = !DILocation(line: 385, column: 13, scope: !182, inlinedAt: !191)
!195 = !DILocation(line: 386, column: 9, scope: !196, inlinedAt: !191)
!196 = distinct !DILexicalBlock(scope: !182, file: !3, line: 386, column: 7)
!197 = !DILocation(line: 386, column: 16, scope: !196, inlinedAt: !191)
!198 = !DILocation(line: 386, column: 13, scope: !196, inlinedAt: !191)
!199 = !DILocation(line: 388, column: 16, scope: !200, inlinedAt: !191)
!200 = distinct !DILexicalBlock(scope: !196, file: !3, line: 387, column: 5)
!201 = !DILocation(line: 388, column: 7, scope: !200, inlinedAt: !191)
!202 = !DILocation(line: 389, column: 7, scope: !200, inlinedAt: !191)
!203 = !DILocation(line: 392, column: 1, scope: !182, inlinedAt: !191)
!204 = !DILocation(line: 399, column: 3, scope: !173)
!205 = distinct !DISubprogram(name: "main", scope: !32, file: !32, line: 102, type: !206, scopeLine: 103, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !31, retainedNodes: !211)
!206 = !DISubroutineType(types: !207)
!207 = !{!16, !16, !208}
!208 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !209, size: 64)
!209 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !210, size: 64)
!210 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!211 = !{!212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224}
!212 = !DILocalVariable(name: "argc", arg: 1, scope: !205, file: !32, line: 102, type: !16)
!213 = !DILocalVariable(name: "argv", arg: 2, scope: !205, file: !32, line: 102, type: !208)
!214 = !DILocalVariable(name: "ni", scope: !205, file: !32, line: 105, type: !16)
!215 = !DILocalVariable(name: "nj", scope: !205, file: !32, line: 106, type: !16)
!216 = !DILocalVariable(name: "nk", scope: !205, file: !32, line: 107, type: !16)
!217 = !DILocalVariable(name: "nl", scope: !205, file: !32, line: 108, type: !16)
!218 = !DILocalVariable(name: "alpha", scope: !205, file: !32, line: 111, type: !7)
!219 = !DILocalVariable(name: "beta", scope: !205, file: !32, line: 112, type: !7)
!220 = !DILocalVariable(name: "tmp", scope: !205, file: !32, line: 113, type: !34)
!221 = !DILocalVariable(name: "A", scope: !205, file: !32, line: 114, type: !34)
!222 = !DILocalVariable(name: "B", scope: !205, file: !32, line: 115, type: !34)
!223 = !DILocalVariable(name: "C", scope: !205, file: !32, line: 116, type: !34)
!224 = !DILocalVariable(name: "D", scope: !205, file: !32, line: 117, type: !34)
!225 = !DILocation(line: 0, scope: !205)
!226 = !DILocation(line: 113, column: 3, scope: !205)
!227 = !DILocation(line: 114, column: 3, scope: !205)
!228 = !DILocation(line: 115, column: 3, scope: !205)
!229 = !DILocation(line: 116, column: 3, scope: !205)
!230 = !DILocation(line: 117, column: 3, scope: !205)
!231 = !DILocation(line: 121, column: 8, scope: !205)
!232 = !DILocation(line: 123, column: 8, scope: !205)
!233 = !DILocalVariable(name: "ni", arg: 1, scope: !234, file: !32, line: 23, type: !16)
!234 = distinct !DISubprogram(name: "init_array", scope: !32, file: !32, line: 23, type: !235, scopeLine: 30, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !31, retainedNodes: !240)
!235 = !DISubroutineType(types: !236)
!236 = !{null, !16, !16, !16, !16, !6, !6, !237, !237, !237, !237}
!237 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !238, size: 64)
!238 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 65536, elements: !239)
!239 = !{!37}
!240 = !{!233, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251}
!241 = !DILocalVariable(name: "nj", arg: 2, scope: !234, file: !32, line: 23, type: !16)
!242 = !DILocalVariable(name: "nk", arg: 3, scope: !234, file: !32, line: 23, type: !16)
!243 = !DILocalVariable(name: "nl", arg: 4, scope: !234, file: !32, line: 23, type: !16)
!244 = !DILocalVariable(name: "alpha", arg: 5, scope: !234, file: !32, line: 24, type: !6)
!245 = !DILocalVariable(name: "beta", arg: 6, scope: !234, file: !32, line: 25, type: !6)
!246 = !DILocalVariable(name: "A", arg: 7, scope: !234, file: !32, line: 26, type: !237)
!247 = !DILocalVariable(name: "B", arg: 8, scope: !234, file: !32, line: 27, type: !237)
!248 = !DILocalVariable(name: "C", arg: 9, scope: !234, file: !32, line: 28, type: !237)
!249 = !DILocalVariable(name: "D", arg: 10, scope: !234, file: !32, line: 29, type: !237)
!250 = !DILocalVariable(name: "i", scope: !234, file: !32, line: 31, type: !16)
!251 = !DILocalVariable(name: "j", scope: !234, file: !32, line: 31, type: !16)
!252 = !DILocation(line: 0, scope: !234, inlinedAt: !253)
!253 = distinct !DILocation(line: 120, column: 3, scope: !205)
!254 = !DILocation(line: 35, column: 3, scope: !255, inlinedAt: !253)
!255 = distinct !DILexicalBlock(scope: !234, file: !32, line: 35, column: 3)
!256 = !DILocation(line: 0, scope: !257, inlinedAt: !253)
!257 = distinct !DILexicalBlock(scope: !258, file: !32, line: 36, column: 5)
!258 = distinct !DILexicalBlock(scope: !259, file: !32, line: 36, column: 5)
!259 = distinct !DILexicalBlock(scope: !255, file: !32, line: 35, column: 3)
!260 = !DILocation(line: 36, column: 5, scope: !258, inlinedAt: !253)
!261 = !DILocation(line: 37, column: 32, scope: !257, inlinedAt: !253)
!262 = !DILocation(line: 37, column: 31, scope: !257, inlinedAt: !253)
!263 = !DILocation(line: 37, column: 35, scope: !257, inlinedAt: !253)
!264 = !DILocation(line: 37, column: 7, scope: !257, inlinedAt: !253)
!265 = !DILocation(line: 37, column: 15, scope: !257, inlinedAt: !253)
!266 = !DILocation(line: 36, column: 26, scope: !257, inlinedAt: !253)
!267 = !DILocation(line: 36, column: 19, scope: !257, inlinedAt: !253)
!268 = distinct !{!268, !260, !269}
!269 = !DILocation(line: 37, column: 37, scope: !258, inlinedAt: !253)
!270 = !DILocation(line: 35, column: 24, scope: !259, inlinedAt: !253)
!271 = !DILocation(line: 35, column: 17, scope: !259, inlinedAt: !253)
!272 = distinct !{!272, !254, !273}
!273 = !DILocation(line: 37, column: 37, scope: !255, inlinedAt: !253)
!274 = !DILocation(line: 122, column: 8, scope: !205)
!275 = !DILocation(line: 124, column: 8, scope: !205)
!276 = !DILocation(line: 38, column: 3, scope: !277, inlinedAt: !253)
!277 = distinct !DILexicalBlock(scope: !234, file: !32, line: 38, column: 3)
!278 = !DILocation(line: 0, scope: !279, inlinedAt: !253)
!279 = distinct !DILexicalBlock(scope: !280, file: !32, line: 39, column: 5)
!280 = distinct !DILexicalBlock(scope: !281, file: !32, line: 39, column: 5)
!281 = distinct !DILexicalBlock(scope: !277, file: !32, line: 38, column: 3)
!282 = !DILocation(line: 39, column: 5, scope: !280, inlinedAt: !253)
!283 = !DILocation(line: 40, column: 34, scope: !279, inlinedAt: !253)
!284 = !DILocation(line: 40, column: 32, scope: !279, inlinedAt: !253)
!285 = !DILocation(line: 40, column: 31, scope: !279, inlinedAt: !253)
!286 = !DILocation(line: 40, column: 39, scope: !279, inlinedAt: !253)
!287 = !DILocation(line: 40, column: 7, scope: !279, inlinedAt: !253)
!288 = !DILocation(line: 40, column: 15, scope: !279, inlinedAt: !253)
!289 = !DILocation(line: 39, column: 19, scope: !279, inlinedAt: !253)
!290 = distinct !{!290, !282, !291}
!291 = !DILocation(line: 40, column: 41, scope: !280, inlinedAt: !253)
!292 = !DILocation(line: 38, column: 24, scope: !281, inlinedAt: !253)
!293 = !DILocation(line: 38, column: 17, scope: !281, inlinedAt: !253)
!294 = distinct !{!294, !276, !295}
!295 = !DILocation(line: 40, column: 41, scope: !277, inlinedAt: !253)
!296 = !DILocation(line: 41, column: 3, scope: !297, inlinedAt: !253)
!297 = distinct !DILexicalBlock(scope: !234, file: !32, line: 41, column: 3)
!298 = !DILocation(line: 0, scope: !299, inlinedAt: !253)
!299 = distinct !DILexicalBlock(scope: !300, file: !32, line: 42, column: 5)
!300 = distinct !DILexicalBlock(scope: !301, file: !32, line: 42, column: 5)
!301 = distinct !DILexicalBlock(scope: !297, file: !32, line: 41, column: 3)
!302 = !DILocation(line: 42, column: 5, scope: !300, inlinedAt: !253)
!303 = !DILocation(line: 43, column: 32, scope: !299, inlinedAt: !253)
!304 = !DILocation(line: 43, column: 31, scope: !299, inlinedAt: !253)
!305 = !DILocation(line: 43, column: 39, scope: !299, inlinedAt: !253)
!306 = !DILocation(line: 43, column: 7, scope: !299, inlinedAt: !253)
!307 = !DILocation(line: 43, column: 15, scope: !299, inlinedAt: !253)
!308 = !DILocation(line: 42, column: 26, scope: !299, inlinedAt: !253)
!309 = !DILocation(line: 42, column: 19, scope: !299, inlinedAt: !253)
!310 = distinct !{!310, !302, !311}
!311 = !DILocation(line: 43, column: 41, scope: !300, inlinedAt: !253)
!312 = !DILocation(line: 41, column: 24, scope: !301, inlinedAt: !253)
!313 = !DILocation(line: 41, column: 17, scope: !301, inlinedAt: !253)
!314 = distinct !{!314, !296, !315}
!315 = !DILocation(line: 43, column: 41, scope: !297, inlinedAt: !253)
!316 = !DILocation(line: 44, column: 3, scope: !317, inlinedAt: !253)
!317 = distinct !DILexicalBlock(scope: !234, file: !32, line: 44, column: 3)
!318 = !DILocation(line: 0, scope: !319, inlinedAt: !253)
!319 = distinct !DILexicalBlock(scope: !320, file: !32, line: 45, column: 5)
!320 = distinct !DILexicalBlock(scope: !321, file: !32, line: 45, column: 5)
!321 = distinct !DILexicalBlock(scope: !317, file: !32, line: 44, column: 3)
!322 = !DILocation(line: 45, column: 5, scope: !320, inlinedAt: !253)
!323 = !DILocation(line: 46, column: 32, scope: !319, inlinedAt: !253)
!324 = !DILocation(line: 46, column: 31, scope: !319, inlinedAt: !253)
!325 = !DILocation(line: 46, column: 39, scope: !319, inlinedAt: !253)
!326 = !DILocation(line: 46, column: 7, scope: !319, inlinedAt: !253)
!327 = !DILocation(line: 46, column: 15, scope: !319, inlinedAt: !253)
!328 = !DILocation(line: 45, column: 26, scope: !319, inlinedAt: !253)
!329 = !DILocation(line: 45, column: 19, scope: !319, inlinedAt: !253)
!330 = distinct !{!330, !322, !331}
!331 = !DILocation(line: 46, column: 41, scope: !320, inlinedAt: !253)
!332 = !DILocation(line: 44, column: 24, scope: !321, inlinedAt: !253)
!333 = !DILocation(line: 44, column: 17, scope: !321, inlinedAt: !253)
!334 = distinct !{!334, !316, !335}
!335 = !DILocation(line: 46, column: 41, scope: !317, inlinedAt: !253)
!336 = !DILocation(line: 132, column: 8, scope: !205)
!337 = !DILocalVariable(name: "ni", arg: 1, scope: !338, file: !32, line: 70, type: !16)
!338 = distinct !DISubprogram(name: "kernel_2mm", scope: !32, file: !32, line: 70, type: !339, scopeLine: 78, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !31, retainedNodes: !341)
!339 = !DISubroutineType(types: !340)
!340 = !{null, !16, !16, !16, !16, !7, !7, !237, !237, !237, !237, !237}
!341 = !{!337, !342, !343, !344, !345, !346, !347, !348, !349, !350, !351, !352, !353, !354}
!342 = !DILocalVariable(name: "nj", arg: 2, scope: !338, file: !32, line: 70, type: !16)
!343 = !DILocalVariable(name: "nk", arg: 3, scope: !338, file: !32, line: 70, type: !16)
!344 = !DILocalVariable(name: "nl", arg: 4, scope: !338, file: !32, line: 70, type: !16)
!345 = !DILocalVariable(name: "alpha", arg: 5, scope: !338, file: !32, line: 71, type: !7)
!346 = !DILocalVariable(name: "beta", arg: 6, scope: !338, file: !32, line: 72, type: !7)
!347 = !DILocalVariable(name: "tmp", arg: 7, scope: !338, file: !32, line: 73, type: !237)
!348 = !DILocalVariable(name: "A", arg: 8, scope: !338, file: !32, line: 74, type: !237)
!349 = !DILocalVariable(name: "B", arg: 9, scope: !338, file: !32, line: 75, type: !237)
!350 = !DILocalVariable(name: "C", arg: 10, scope: !338, file: !32, line: 76, type: !237)
!351 = !DILocalVariable(name: "D", arg: 11, scope: !338, file: !32, line: 77, type: !237)
!352 = !DILocalVariable(name: "i", scope: !338, file: !32, line: 79, type: !16)
!353 = !DILocalVariable(name: "j", scope: !338, file: !32, line: 79, type: !16)
!354 = !DILocalVariable(name: "k", scope: !338, file: !32, line: 79, type: !16)
!355 = !DILocation(line: 0, scope: !338, inlinedAt: !356)
!356 = distinct !DILocation(line: 130, column: 3, scope: !205)
!357 = !DILocation(line: 83, column: 3, scope: !358, inlinedAt: !356)
!358 = distinct !DILexicalBlock(scope: !338, file: !32, line: 83, column: 3)
!359 = !DILocation(line: 84, column: 5, scope: !360, inlinedAt: !356)
!360 = distinct !DILexicalBlock(scope: !361, file: !32, line: 84, column: 5)
!361 = distinct !DILexicalBlock(scope: !358, file: !32, line: 83, column: 3)
!362 = !DILocation(line: 86, column: 2, scope: !363, inlinedAt: !356)
!363 = distinct !DILexicalBlock(scope: !364, file: !32, line: 85, column: 7)
!364 = distinct !DILexicalBlock(scope: !360, file: !32, line: 84, column: 5)
!365 = !DILocation(line: 86, column: 12, scope: !363, inlinedAt: !356)
!366 = !DILocation(line: 87, column: 2, scope: !367, inlinedAt: !356)
!367 = distinct !DILexicalBlock(scope: !363, file: !32, line: 87, column: 2)
!368 = !DILocation(line: 88, column: 14, scope: !369, inlinedAt: !356)
!369 = distinct !DILexicalBlock(scope: !367, file: !32, line: 87, column: 2)
!370 = !DILocation(line: 88, column: 25, scope: !369, inlinedAt: !356)
!371 = !DILocation(line: 88, column: 23, scope: !369, inlinedAt: !356)
!372 = !DILocation(line: 88, column: 35, scope: !369, inlinedAt: !356)
!373 = !DILocation(line: 88, column: 33, scope: !369, inlinedAt: !356)
!374 = !DILocation(line: 87, column: 22, scope: !369, inlinedAt: !356)
!375 = !DILocation(line: 87, column: 16, scope: !369, inlinedAt: !356)
!376 = distinct !{!376, !366, !377}
!377 = !DILocation(line: 88, column: 41, scope: !367, inlinedAt: !356)
!378 = !DILocation(line: 84, column: 26, scope: !364, inlinedAt: !356)
!379 = !DILocation(line: 84, column: 19, scope: !364, inlinedAt: !356)
!380 = distinct !{!380, !359, !381}
!381 = !DILocation(line: 89, column: 7, scope: !360, inlinedAt: !356)
!382 = !DILocation(line: 83, column: 24, scope: !361, inlinedAt: !356)
!383 = !DILocation(line: 83, column: 17, scope: !361, inlinedAt: !356)
!384 = distinct !{!384, !357, !385}
!385 = !DILocation(line: 89, column: 7, scope: !358, inlinedAt: !356)
!386 = !DILocation(line: 90, column: 3, scope: !387, inlinedAt: !356)
!387 = distinct !DILexicalBlock(scope: !338, file: !32, line: 90, column: 3)
!388 = !DILocation(line: 91, column: 5, scope: !389, inlinedAt: !356)
!389 = distinct !DILexicalBlock(scope: !390, file: !32, line: 91, column: 5)
!390 = distinct !DILexicalBlock(scope: !387, file: !32, line: 90, column: 3)
!391 = !DILocation(line: 93, column: 2, scope: !392, inlinedAt: !356)
!392 = distinct !DILexicalBlock(scope: !393, file: !32, line: 92, column: 7)
!393 = distinct !DILexicalBlock(scope: !389, file: !32, line: 91, column: 5)
!394 = !DILocation(line: 93, column: 10, scope: !392, inlinedAt: !356)
!395 = !DILocation(line: 94, column: 2, scope: !396, inlinedAt: !356)
!396 = distinct !DILexicalBlock(scope: !392, file: !32, line: 94, column: 2)
!397 = !DILocation(line: 95, column: 12, scope: !398, inlinedAt: !356)
!398 = distinct !DILexicalBlock(scope: !396, file: !32, line: 94, column: 2)
!399 = !DILocation(line: 95, column: 15, scope: !398, inlinedAt: !356)
!400 = !DILocation(line: 95, column: 27, scope: !398, inlinedAt: !356)
!401 = !DILocation(line: 95, column: 25, scope: !398, inlinedAt: !356)
!402 = !DILocation(line: 94, column: 22, scope: !398, inlinedAt: !356)
!403 = !DILocation(line: 94, column: 16, scope: !398, inlinedAt: !356)
!404 = distinct !{!404, !395, !405}
!405 = !DILocation(line: 95, column: 33, scope: !396, inlinedAt: !356)
!406 = !DILocation(line: 91, column: 26, scope: !393, inlinedAt: !356)
!407 = !DILocation(line: 91, column: 19, scope: !393, inlinedAt: !356)
!408 = distinct !{!408, !388, !409}
!409 = !DILocation(line: 96, column: 7, scope: !389, inlinedAt: !356)
!410 = !DILocation(line: 90, column: 24, scope: !390, inlinedAt: !356)
!411 = !DILocation(line: 90, column: 17, scope: !390, inlinedAt: !356)
!412 = distinct !{!412, !386, !413}
!413 = !DILocation(line: 96, column: 7, scope: !387, inlinedAt: !356)
!414 = !DILocation(line: 144, column: 3, scope: !415)
!415 = distinct !DILexicalBlock(scope: !205, file: !32, line: 144, column: 3)
!416 = !DILocation(line: 144, column: 3, scope: !205)
!417 = !DILocation(line: 58, column: 3, scope: !418, inlinedAt: !428)
!418 = distinct !DILexicalBlock(scope: !419, file: !32, line: 58, column: 3)
!419 = distinct !DISubprogram(name: "print_array", scope: !32, file: !32, line: 53, type: !420, scopeLine: 55, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !31, retainedNodes: !422)
!420 = !DISubroutineType(types: !421)
!421 = !{null, !16, !16, !237}
!422 = !{!423, !424, !425, !426, !427}
!423 = !DILocalVariable(name: "ni", arg: 1, scope: !419, file: !32, line: 53, type: !16)
!424 = !DILocalVariable(name: "nl", arg: 2, scope: !419, file: !32, line: 53, type: !16)
!425 = !DILocalVariable(name: "D", arg: 3, scope: !419, file: !32, line: 54, type: !237)
!426 = !DILocalVariable(name: "i", scope: !419, file: !32, line: 56, type: !16)
!427 = !DILocalVariable(name: "j", scope: !419, file: !32, line: 56, type: !16)
!428 = distinct !DILocation(line: 144, column: 3, scope: !415)
!429 = !DILocation(line: 0, scope: !419, inlinedAt: !428)
!430 = !DILocation(line: 0, scope: !431, inlinedAt: !428)
!431 = distinct !DILexicalBlock(scope: !432, file: !32, line: 61, column: 6)
!432 = distinct !DILexicalBlock(scope: !433, file: !32, line: 59, column: 30)
!433 = distinct !DILexicalBlock(scope: !434, file: !32, line: 59, column: 5)
!434 = distinct !DILexicalBlock(scope: !435, file: !32, line: 59, column: 5)
!435 = distinct !DILexicalBlock(scope: !418, file: !32, line: 58, column: 3)
!436 = !DILocation(line: 59, column: 5, scope: !434, inlinedAt: !428)
!437 = !DILocation(line: 60, column: 11, scope: !432, inlinedAt: !428)
!438 = !DILocation(line: 60, column: 41, scope: !432, inlinedAt: !428)
!439 = !DILocation(line: 60, column: 2, scope: !432, inlinedAt: !428)
!440 = !DILocation(line: 61, column: 14, scope: !431, inlinedAt: !428)
!441 = !DILocation(line: 61, column: 19, scope: !431, inlinedAt: !428)
!442 = !DILocation(line: 61, column: 24, scope: !431, inlinedAt: !428)
!443 = !DILocation(line: 61, column: 6, scope: !432, inlinedAt: !428)
!444 = !DILocation(line: 61, column: 39, scope: !431, inlinedAt: !428)
!445 = !DILocation(line: 61, column: 30, scope: !431, inlinedAt: !428)
!446 = !DILocation(line: 59, column: 26, scope: !433, inlinedAt: !428)
!447 = !DILocation(line: 59, column: 19, scope: !433, inlinedAt: !428)
!448 = distinct !{!448, !436, !449}
!449 = !DILocation(line: 62, column: 5, scope: !434, inlinedAt: !428)
!450 = !DILocation(line: 58, column: 24, scope: !435, inlinedAt: !428)
!451 = !DILocation(line: 58, column: 17, scope: !435, inlinedAt: !428)
!452 = distinct !{!452, !417, !453}
!453 = !DILocation(line: 62, column: 5, scope: !418, inlinedAt: !428)
!454 = !DILocation(line: 63, column: 12, scope: !419, inlinedAt: !428)
!455 = !DILocation(line: 63, column: 3, scope: !419, inlinedAt: !428)
!456 = !DILocation(line: 147, column: 3, scope: !205)
!457 = !DILocation(line: 148, column: 3, scope: !205)
!458 = !DILocation(line: 149, column: 3, scope: !205)
!459 = !DILocation(line: 150, column: 3, scope: !205)
!460 = !DILocation(line: 151, column: 3, scope: !205)
!461 = !DILocation(line: 153, column: 3, scope: !205)
