; ModuleID = 'benchmark.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@0 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@1 = private unnamed_addr constant [25 x i8] c";2mm.c;kernel_2mm;76;1;;\00", align 1
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@3 = private unnamed_addr constant [25 x i8] c";2mm.c;kernel_2mm;78;3;;\00", align 1
@4 = private unnamed_addr constant [26 x i8] c";2mm.c;kernel_2mm;78;33;;\00", align 1
@5 = private unnamed_addr constant [25 x i8] c";2mm.c;kernel_2mm;86;3;;\00", align 1
@6 = private unnamed_addr constant [26 x i8] c";2mm.c;kernel_2mm;86;33;;\00", align 1
@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 !dbg !22 {
entry:
  %ni.addr.i = alloca i32, align 4
  %nj.addr.i = alloca i32, align 4
  %nk.addr.i = alloca i32, align 4
  %nl.addr.i = alloca i32, align 4
  %alpha.addr.i = alloca double, align 8
  %beta.addr.i = alloca double, align 8
  %tmp.addr.i = alloca double*, align 8
  %A.addr.i = alloca double*, align 8
  %B.addr.i = alloca double*, align 8
  %C.addr.i = alloca double*, align 8
  %D.addr.i = alloca double*, align 8
  %.kmpc_loc.addr.i = alloca %struct.ident_t, align 8
  call void @llvm.dbg.value(metadata i32 %argc, metadata !26, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.value(metadata i8** %argv, metadata !27, metadata !DIExpression()), !dbg !40
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !41
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !41, !tbaa !42
  call void @llvm.dbg.value(metadata i8* %0, metadata !46, metadata !DIExpression()) #7, !dbg !53
  %call.i = tail call i64 @strtol(i8* nocapture nonnull %0, i8** null, i32 10) #7, !dbg !55
  %conv.i = trunc i64 %call.i to i32, !dbg !56
  call void @llvm.dbg.value(metadata i32 %conv.i, metadata !28, metadata !DIExpression()), !dbg !40
  %arrayidx1 = getelementptr inbounds i8*, i8** %argv, i64 2, !dbg !57
  %1 = load i8*, i8** %arrayidx1, align 8, !dbg !57, !tbaa !42
  call void @llvm.dbg.value(metadata i8* %1, metadata !46, metadata !DIExpression()) #7, !dbg !58
  %call.i88 = tail call i64 @strtol(i8* nocapture nonnull %1, i8** null, i32 10) #7, !dbg !60
  %conv.i89 = trunc i64 %call.i88 to i32, !dbg !61
  call void @llvm.dbg.value(metadata i32 %conv.i89, metadata !29, metadata !DIExpression()), !dbg !40
  %arrayidx3 = getelementptr inbounds i8*, i8** %argv, i64 3, !dbg !62
  %2 = load i8*, i8** %arrayidx3, align 8, !dbg !62, !tbaa !42
  call void @llvm.dbg.value(metadata i8* %2, metadata !46, metadata !DIExpression()) #7, !dbg !63
  %call.i90 = tail call i64 @strtol(i8* nocapture nonnull %2, i8** null, i32 10) #7, !dbg !65
  %conv.i91 = trunc i64 %call.i90 to i32, !dbg !66
  call void @llvm.dbg.value(metadata i32 %conv.i91, metadata !30, metadata !DIExpression()), !dbg !40
  %arrayidx5 = getelementptr inbounds i8*, i8** %argv, i64 4, !dbg !67
  %3 = load i8*, i8** %arrayidx5, align 8, !dbg !67, !tbaa !42
  call void @llvm.dbg.value(metadata i8* %3, metadata !46, metadata !DIExpression()) #7, !dbg !68
  %call.i92 = tail call i64 @strtol(i8* nocapture nonnull %3, i8** null, i32 10) #7, !dbg !70
  %conv.i93 = trunc i64 %call.i92 to i32, !dbg !71
  call void @llvm.dbg.value(metadata i32 %conv.i93, metadata !31, metadata !DIExpression()), !dbg !40
  %arrayidx7 = getelementptr inbounds i8*, i8** %argv, i64 5, !dbg !72
  %4 = load i8*, i8** %arrayidx7, align 8, !dbg !72, !tbaa !42
  call void @llvm.dbg.value(metadata i8* %4, metadata !46, metadata !DIExpression()) #7, !dbg !73
  %call.i94 = tail call i64 @strtol(i8* nocapture nonnull %4, i8** null, i32 10) #7, !dbg !75
  %conv.i95 = trunc i64 %call.i94 to i32, !dbg !76
  call void @llvm.dbg.value(metadata i32 %conv.i95, metadata !32, metadata !DIExpression()), !dbg !40
  %mul = shl i64 %call.i88, 32, !dbg !77
  %sext = mul i64 %mul, %call.i90, !dbg !78
  %mul9 = ashr exact i64 %sext, 29, !dbg !79
  %call10 = tail call noalias i8* @malloc(i64 %mul9) #7, !dbg !80
  call void @llvm.dbg.value(metadata i8* %call10, metadata !35, metadata !DIExpression()), !dbg !40
  %sext110 = mul i64 %mul, %call.i92, !dbg !81
  %mul13 = ashr exact i64 %sext110, 29, !dbg !82
  %call14 = tail call noalias i8* @malloc(i64 %mul13) #7, !dbg !83
  %5 = bitcast i8* %call14 to double*, !dbg !84
  call void @llvm.dbg.value(metadata double* %5, metadata !36, metadata !DIExpression()), !dbg !40
  %mul15 = shl i64 %call.i90, 32, !dbg !85
  %sext111 = mul i64 %mul15, %call.i92, !dbg !86
  %mul17 = ashr exact i64 %sext111, 29, !dbg !87
  %call18 = tail call noalias i8* @malloc(i64 %mul17) #7, !dbg !88
  %6 = bitcast i8* %call18 to double*, !dbg !89
  call void @llvm.dbg.value(metadata double* %6, metadata !37, metadata !DIExpression()), !dbg !40
  %sext112 = mul i64 %mul15, %call.i94, !dbg !90
  %mul21 = ashr exact i64 %sext112, 29, !dbg !91
  %call22 = tail call noalias i8* @malloc(i64 %mul21) #7, !dbg !92
  %7 = bitcast i8* %call22 to double*, !dbg !93
  call void @llvm.dbg.value(metadata double* %7, metadata !38, metadata !DIExpression()), !dbg !40
  %sext113 = mul i64 %mul, %call.i94, !dbg !94
  %mul25 = ashr exact i64 %sext113, 29, !dbg !95
  %call26 = tail call noalias i8* @malloc(i64 %mul25) #7, !dbg !96
  %8 = bitcast i8* %call26 to double*, !dbg !97
  call void @llvm.dbg.value(metadata double* %8, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.value(metadata i32 %conv.i89, metadata !98, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.value(metadata i32 %conv.i91, metadata !107, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.value(metadata i32 %conv.i93, metadata !108, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.value(metadata i32 %conv.i95, metadata !109, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.value(metadata double* %5, metadata !112, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.value(metadata double* %6, metadata !113, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.value(metadata double* %7, metadata !114, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.value(metadata double* %8, metadata !115, metadata !DIExpression()), !dbg !118
  %9 = and i64 %call.i94, 4294967295
  %10 = and i64 %call.i90, 4294967295
  call void @llvm.dbg.value(metadata i32 0, metadata !116, metadata !DIExpression()), !dbg !118
  %cmp143.i = icmp sgt i32 %conv.i89, 0, !dbg !120
  br i1 %cmp143.i, label %for.cond1.preheader.lr.ph.i, label %for.cond11.preheader.i, !dbg !123

for.cond1.preheader.lr.ph.i:                      ; preds = %entry
  %cmp2141.i = icmp sgt i32 %conv.i93, 0, !dbg !124
  %conv5.i = sitofp i32 %conv.i89 to double, !dbg !124
  %wide.trip.count174.i = and i64 %call.i88, 4294967295, !dbg !120
  %wide.trip.count170.i = and i64 %call.i92, 4294967295, !dbg !124
  br label %for.cond1.preheader.i, !dbg !123

for.cond1.preheader.i:                            ; preds = %for.inc8.i, %for.cond1.preheader.lr.ph.i
  %indvars.iv172.i = phi i64 [ 0, %for.cond1.preheader.lr.ph.i ], [ %indvars.iv.next173.i, %for.inc8.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv172.i, metadata !116, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.value(metadata i32 0, metadata !117, metadata !DIExpression()), !dbg !118
  br i1 %cmp2141.i, label %for.body3.lr.ph.i, label %for.inc8.i, !dbg !127

for.body3.lr.ph.i:                                ; preds = %for.cond1.preheader.i
  %11 = trunc i64 %indvars.iv172.i to i32, !dbg !124
  %conv.i96 = sitofp i32 %11 to double, !dbg !124
  %12 = mul nuw nsw i64 %indvars.iv172.i, %9, !dbg !124
  %arrayidx.i = getelementptr inbounds double, double* %5, i64 %12, !dbg !124
  br label %for.body3.i, !dbg !127

for.cond11.preheader.i.loopexit:                  ; preds = %for.inc8.i
  br label %for.cond11.preheader.i, !dbg !128

for.cond11.preheader.i:                           ; preds = %for.cond11.preheader.i.loopexit, %entry
  call void @llvm.dbg.value(metadata i32 0, metadata !116, metadata !DIExpression()), !dbg !118
  %cmp12138.i = icmp sgt i32 %conv.i93, 0, !dbg !128
  br i1 %cmp12138.i, label %for.cond15.preheader.lr.ph.i, label %for.cond34.preheader.i, !dbg !131

for.cond15.preheader.lr.ph.i:                     ; preds = %for.cond11.preheader.i
  %cmp16136.i = icmp sgt i32 %conv.i91, 0, !dbg !132
  %conv22.i = sitofp i32 %conv.i91 to double, !dbg !132
  %wide.trip.count166.i = and i64 %call.i92, 4294967295, !dbg !128
  br label %for.cond15.preheader.i, !dbg !131

for.body3.i:                                      ; preds = %for.body3.i, %for.body3.lr.ph.i
  %indvars.iv168.i = phi i64 [ 0, %for.body3.lr.ph.i ], [ %indvars.iv.next169.i, %for.body3.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv168.i, metadata !117, metadata !DIExpression()), !dbg !118
  %13 = trunc i64 %indvars.iv168.i to i32, !dbg !135
  %conv4.i = sitofp i32 %13 to double, !dbg !135
  %mul.i = fmul double %conv.i96, %conv4.i, !dbg !136
  %div.i = fdiv double %mul.i, %conv5.i, !dbg !137
  %arrayidx7.i = getelementptr inbounds double, double* %arrayidx.i, i64 %indvars.iv168.i, !dbg !138
  store double %div.i, double* %arrayidx7.i, align 8, !dbg !139, !tbaa !140
  %indvars.iv.next169.i = add nuw nsw i64 %indvars.iv168.i, 1, !dbg !142
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next169.i, metadata !117, metadata !DIExpression()), !dbg !118
  %exitcond171.i = icmp eq i64 %indvars.iv.next169.i, %wide.trip.count170.i, !dbg !143
  br i1 %exitcond171.i, label %for.inc8.i.loopexit, label %for.body3.i, !dbg !127, !llvm.loop !144

for.inc8.i.loopexit:                              ; preds = %for.body3.i
  br label %for.inc8.i, !dbg !146

for.inc8.i:                                       ; preds = %for.inc8.i.loopexit, %for.cond1.preheader.i
  %indvars.iv.next173.i = add nuw nsw i64 %indvars.iv172.i, 1, !dbg !146
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next173.i, metadata !116, metadata !DIExpression()), !dbg !118
  %exitcond175.i = icmp eq i64 %indvars.iv.next173.i, %wide.trip.count174.i, !dbg !120
  br i1 %exitcond175.i, label %for.cond11.preheader.i.loopexit, label %for.cond1.preheader.i, !dbg !123, !llvm.loop !147

for.cond15.preheader.i:                           ; preds = %for.inc31.i, %for.cond15.preheader.lr.ph.i
  %indvars.iv164.i = phi i64 [ 0, %for.cond15.preheader.lr.ph.i ], [ %indvars.iv.next165.i, %for.inc31.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv164.i, metadata !116, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.value(metadata i32 0, metadata !117, metadata !DIExpression()), !dbg !118
  br i1 %cmp16136.i, label %for.body18.lr.ph.i, label %for.inc31.i, !dbg !149

for.body18.lr.ph.i:                               ; preds = %for.cond15.preheader.i
  %14 = trunc i64 %indvars.iv164.i to i32, !dbg !132
  %conv19.i = sitofp i32 %14 to double, !dbg !132
  %15 = mul nuw nsw i64 %indvars.iv164.i, %10, !dbg !132
  %arrayidx25.i = getelementptr inbounds double, double* %6, i64 %15, !dbg !132
  br label %for.body18.i, !dbg !149

for.cond34.preheader.i.loopexit:                  ; preds = %for.inc31.i
  br label %for.cond34.preheader.i, !dbg !150

for.cond34.preheader.i:                           ; preds = %for.cond34.preheader.i.loopexit, %for.cond11.preheader.i
  call void @llvm.dbg.value(metadata i32 0, metadata !116, metadata !DIExpression()), !dbg !118
  %cmp35133.i = icmp sgt i32 %conv.i95, 0, !dbg !150
  br i1 %cmp35133.i, label %for.cond38.preheader.lr.ph.i, label %for.cond58.preheader.i, !dbg !153

for.cond38.preheader.lr.ph.i:                     ; preds = %for.cond34.preheader.i
  %cmp39131.i = icmp sgt i32 %conv.i91, 0, !dbg !154
  %conv46.i = sitofp i32 %conv.i95 to double, !dbg !154
  br label %for.cond38.preheader.i, !dbg !153

for.body18.i:                                     ; preds = %for.body18.i, %for.body18.lr.ph.i
  %indvars.iv160.i = phi i64 [ 0, %for.body18.lr.ph.i ], [ %indvars.iv.next161.i, %for.body18.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv160.i, metadata !117, metadata !DIExpression()), !dbg !118
  %indvars.iv.next161.i = add nuw nsw i64 %indvars.iv160.i, 1, !dbg !157
  %16 = trunc i64 %indvars.iv.next161.i to i32, !dbg !158
  %conv20.i = sitofp i32 %16 to double, !dbg !158
  %mul21.i = fmul double %conv19.i, %conv20.i, !dbg !159
  %div23.i = fdiv double %mul21.i, %conv22.i, !dbg !160
  %arrayidx27.i = getelementptr inbounds double, double* %arrayidx25.i, i64 %indvars.iv160.i, !dbg !161
  store double %div23.i, double* %arrayidx27.i, align 8, !dbg !162, !tbaa !140
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next161.i, metadata !117, metadata !DIExpression()), !dbg !118
  %exitcond163.i = icmp eq i64 %indvars.iv.next161.i, %10, !dbg !163
  br i1 %exitcond163.i, label %for.inc31.i.loopexit, label %for.body18.i, !dbg !149, !llvm.loop !164

for.inc31.i.loopexit:                             ; preds = %for.body18.i
  br label %for.inc31.i, !dbg !166

for.inc31.i:                                      ; preds = %for.inc31.i.loopexit, %for.cond15.preheader.i
  %indvars.iv.next165.i = add nuw nsw i64 %indvars.iv164.i, 1, !dbg !166
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next165.i, metadata !116, metadata !DIExpression()), !dbg !118
  %exitcond167.i = icmp eq i64 %indvars.iv.next165.i, %wide.trip.count166.i, !dbg !128
  br i1 %exitcond167.i, label %for.cond34.preheader.i.loopexit, label %for.cond15.preheader.i, !dbg !131, !llvm.loop !167

for.cond38.preheader.i:                           ; preds = %for.inc55.i, %for.cond38.preheader.lr.ph.i
  %indvars.iv156.i = phi i64 [ 0, %for.cond38.preheader.lr.ph.i ], [ %indvars.iv.next157.i, %for.inc55.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv156.i, metadata !116, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.value(metadata i32 0, metadata !117, metadata !DIExpression()), !dbg !118
  br i1 %cmp39131.i, label %for.body41.lr.ph.i, label %for.inc55.i, !dbg !169

for.body41.lr.ph.i:                               ; preds = %for.cond38.preheader.i
  %17 = trunc i64 %indvars.iv156.i to i32, !dbg !154
  %conv42.i = sitofp i32 %17 to double, !dbg !154
  %18 = mul nuw nsw i64 %indvars.iv156.i, %10, !dbg !154
  %arrayidx49.i = getelementptr inbounds double, double* %7, i64 %18, !dbg !154
  br label %for.body41.i, !dbg !169

for.cond58.preheader.i.loopexit:                  ; preds = %for.inc55.i
  br label %for.cond58.preheader.i, !dbg !170

for.cond58.preheader.i:                           ; preds = %for.cond58.preheader.i.loopexit, %for.cond34.preheader.i
  call void @llvm.dbg.value(metadata i32 0, metadata !116, metadata !DIExpression()), !dbg !118
  br i1 %cmp143.i, label %for.cond62.preheader.lr.ph.i, label %for.cond58.preheader.i.init_array.exit_crit_edge, !dbg !170

for.cond58.preheader.i.init_array.exit_crit_edge: ; preds = %for.cond58.preheader.i
  %.pre = and i64 %call.i88, 4294967295
  br label %init_array.exit, !dbg !170

for.cond62.preheader.lr.ph.i:                     ; preds = %for.cond58.preheader.i
  %conv70.i = sitofp i32 %conv.i93 to double, !dbg !172
  %wide.trip.count149.i = and i64 %call.i88, 4294967295, !dbg !176
  br label %for.cond62.preheader.i, !dbg !170

for.body41.i:                                     ; preds = %for.body41.i, %for.body41.lr.ph.i
  %indvars.iv151.i = phi i64 [ 0, %for.body41.lr.ph.i ], [ %indvars.iv.next152.i, %for.body41.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv151.i, metadata !117, metadata !DIExpression()), !dbg !118
  %19 = trunc i64 %indvars.iv151.i to i32, !dbg !177
  %20 = add i32 %19, 3, !dbg !177
  %conv44.i = sitofp i32 %20 to double, !dbg !177
  %mul45.i = fmul double %conv42.i, %conv44.i, !dbg !178
  %div47.i = fdiv double %mul45.i, %conv46.i, !dbg !179
  %arrayidx51.i = getelementptr inbounds double, double* %arrayidx49.i, i64 %indvars.iv151.i, !dbg !180
  store double %div47.i, double* %arrayidx51.i, align 8, !dbg !181, !tbaa !140
  %indvars.iv.next152.i = add nuw nsw i64 %indvars.iv151.i, 1, !dbg !182
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next152.i, metadata !117, metadata !DIExpression()), !dbg !118
  %exitcond155.i = icmp eq i64 %indvars.iv.next152.i, %10, !dbg !183
  br i1 %exitcond155.i, label %for.inc55.i.loopexit, label %for.body41.i, !dbg !169, !llvm.loop !184

for.inc55.i.loopexit:                             ; preds = %for.body41.i
  br label %for.inc55.i, !dbg !186

for.inc55.i:                                      ; preds = %for.inc55.i.loopexit, %for.cond38.preheader.i
  %indvars.iv.next157.i = add nuw nsw i64 %indvars.iv156.i, 1, !dbg !186
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next157.i, metadata !116, metadata !DIExpression()), !dbg !118
  %exitcond159.i = icmp eq i64 %indvars.iv.next157.i, %9, !dbg !150
  br i1 %exitcond159.i, label %for.cond58.preheader.i.loopexit, label %for.cond38.preheader.i, !dbg !153, !llvm.loop !187

for.cond62.preheader.i:                           ; preds = %for.inc79.i, %for.cond62.preheader.lr.ph.i
  %indvars.iv147.i = phi i64 [ 0, %for.cond62.preheader.lr.ph.i ], [ %indvars.iv.next148.i, %for.inc79.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv147.i, metadata !116, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.value(metadata i32 0, metadata !117, metadata !DIExpression()), !dbg !118
  br i1 %cmp35133.i, label %for.body65.lr.ph.i, label %for.inc79.i, !dbg !189

for.body65.lr.ph.i:                               ; preds = %for.cond62.preheader.i
  %21 = trunc i64 %indvars.iv147.i to i32, !dbg !172
  %conv66.i = sitofp i32 %21 to double, !dbg !172
  %22 = mul nuw nsw i64 %indvars.iv147.i, %9, !dbg !172
  %arrayidx73.i = getelementptr inbounds double, double* %8, i64 %22, !dbg !172
  br label %for.body65.i, !dbg !189

for.body65.i:                                     ; preds = %for.body65.i, %for.body65.lr.ph.i
  %indvars.iv.i = phi i64 [ 0, %for.body65.lr.ph.i ], [ %indvars.iv.next.i, %for.body65.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i, metadata !117, metadata !DIExpression()), !dbg !118
  %23 = trunc i64 %indvars.iv.i to i32, !dbg !190
  %24 = add i32 %23, 2, !dbg !190
  %conv68.i = sitofp i32 %24 to double, !dbg !190
  %mul69.i = fmul double %conv66.i, %conv68.i, !dbg !191
  %div71.i = fdiv double %mul69.i, %conv70.i, !dbg !192
  %arrayidx75.i = getelementptr inbounds double, double* %arrayidx73.i, i64 %indvars.iv.i, !dbg !193
  store double %div71.i, double* %arrayidx75.i, align 8, !dbg !194, !tbaa !140
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !195
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i, metadata !117, metadata !DIExpression()), !dbg !118
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, %9, !dbg !196
  br i1 %exitcond.i, label %for.inc79.i.loopexit, label %for.body65.i, !dbg !189, !llvm.loop !197

for.inc79.i.loopexit:                             ; preds = %for.body65.i
  br label %for.inc79.i, !dbg !199

for.inc79.i:                                      ; preds = %for.inc79.i.loopexit, %for.cond62.preheader.i
  %indvars.iv.next148.i = add nuw nsw i64 %indvars.iv147.i, 1, !dbg !199
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next148.i, metadata !116, metadata !DIExpression()), !dbg !118
  %exitcond150.i = icmp eq i64 %indvars.iv.next148.i, %wide.trip.count149.i, !dbg !176
  br i1 %exitcond150.i, label %init_array.exit.loopexit, label %for.cond62.preheader.i, !dbg !170, !llvm.loop !200

init_array.exit.loopexit:                         ; preds = %for.inc79.i
  br label %init_array.exit

init_array.exit:                                  ; preds = %init_array.exit.loopexit, %for.cond58.preheader.i.init_array.exit_crit_edge
  %.pre-phi = phi i64 [ %.pre, %for.cond58.preheader.i.init_array.exit_crit_edge ], [ %wide.trip.count149.i, %init_array.exit.loopexit ]
  call void @llvm.dbg.value(metadata double 3.241200e+04, metadata !33, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.value(metadata double 2.123000e+03, metadata !34, metadata !DIExpression()), !dbg !40
  %25 = bitcast i32* %ni.addr.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %25)
  %26 = bitcast i32* %nj.addr.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %26)
  %27 = bitcast i32* %nk.addr.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %27)
  %28 = bitcast i32* %nl.addr.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %28)
  %29 = bitcast double* %alpha.addr.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %29)
  %30 = bitcast double* %beta.addr.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %30)
  %31 = bitcast double** %tmp.addr.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %31)
  %32 = bitcast double** %A.addr.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %32)
  %33 = bitcast double** %B.addr.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %33)
  %34 = bitcast double** %C.addr.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %34)
  %35 = bitcast double** %D.addr.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %35)
  %36 = bitcast %struct.ident_t* %.kmpc_loc.addr.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %36)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %36, i8* nonnull align 8 dereferenceable(24) bitcast (%struct.ident_t* @0 to i8*), i64 16, i1 false) #7
  call void @llvm.dbg.value(metadata i32 %conv.i89, metadata !202, metadata !DIExpression()) #7, !dbg !220
  store i32 %conv.i89, i32* %ni.addr.i, align 4, !tbaa !222
  call void @llvm.dbg.value(metadata i32 %conv.i91, metadata !207, metadata !DIExpression()) #7, !dbg !220
  store i32 %conv.i91, i32* %nj.addr.i, align 4, !tbaa !222
  call void @llvm.dbg.value(metadata i32 %conv.i93, metadata !208, metadata !DIExpression()) #7, !dbg !220
  store i32 %conv.i93, i32* %nk.addr.i, align 4, !tbaa !222
  call void @llvm.dbg.value(metadata i32 %conv.i95, metadata !209, metadata !DIExpression()) #7, !dbg !220
  store i32 %conv.i95, i32* %nl.addr.i, align 4, !tbaa !222
  call void @llvm.dbg.value(metadata double 3.241200e+04, metadata !210, metadata !DIExpression()) #7, !dbg !220
  store double 3.241200e+04, double* %alpha.addr.i, align 8, !tbaa !140
  call void @llvm.dbg.value(metadata double 2.123000e+03, metadata !211, metadata !DIExpression()) #7, !dbg !220
  store double 2.123000e+03, double* %beta.addr.i, align 8, !tbaa !140
  call void @llvm.dbg.value(metadata i8* %call10, metadata !212, metadata !DIExpression()) #7, !dbg !220
  %37 = bitcast double** %tmp.addr.i to i8**
  store i8* %call10, i8** %37, align 8, !tbaa !42
  call void @llvm.dbg.value(metadata double* %5, metadata !213, metadata !DIExpression()) #7, !dbg !220
  %38 = bitcast double** %A.addr.i to i8**
  store i8* %call14, i8** %38, align 8, !tbaa !42
  call void @llvm.dbg.value(metadata double* %6, metadata !214, metadata !DIExpression()) #7, !dbg !220
  %39 = bitcast double** %B.addr.i to i8**
  store i8* %call18, i8** %39, align 8, !tbaa !42
  call void @llvm.dbg.value(metadata double* %7, metadata !215, metadata !DIExpression()) #7, !dbg !220
  %40 = bitcast double** %C.addr.i to i8**
  store i8* %call22, i8** %40, align 8, !tbaa !42
  call void @llvm.dbg.value(metadata double* %8, metadata !216, metadata !DIExpression()) #7, !dbg !220
  %41 = bitcast double** %D.addr.i to i8**
  store i8* %call26, i8** %41, align 8, !tbaa !42
  call void @llvm.dbg.value(metadata i32 %conv.i89, metadata !202, metadata !DIExpression()) #7, !dbg !220
  call void @llvm.dbg.value(metadata i32 %conv.i91, metadata !207, metadata !DIExpression()) #7, !dbg !220
  call void @llvm.dbg.value(metadata i32 %conv.i93, metadata !208, metadata !DIExpression()) #7, !dbg !220
  %42 = and i64 %call.i92, 4294967295
  call void @llvm.dbg.value(metadata i32 %conv.i95, metadata !209, metadata !DIExpression()) #7, !dbg !220
  %43 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr.i, i64 0, i32 4, !dbg !224
  store i8* getelementptr inbounds ([25 x i8], [25 x i8]* @1, i64 0, i64 0), i8** %43, align 8, !dbg !224, !tbaa !225
  call void @llvm.dbg.value(metadata i32* %ni.addr.i, metadata !202, metadata !DIExpression(DW_OP_deref)) #7, !dbg !220
  call void @llvm.dbg.value(metadata i32* %nj.addr.i, metadata !207, metadata !DIExpression(DW_OP_deref)) #7, !dbg !220
  call void @llvm.dbg.value(metadata i32* %nk.addr.i, metadata !208, metadata !DIExpression(DW_OP_deref)) #7, !dbg !220
  call void @llvm.dbg.value(metadata i32* %nl.addr.i, metadata !209, metadata !DIExpression(DW_OP_deref)) #7, !dbg !220
  call void @llvm.dbg.value(metadata double* %alpha.addr.i, metadata !210, metadata !DIExpression(DW_OP_deref)) #7, !dbg !220
  call void @llvm.dbg.value(metadata double* %beta.addr.i, metadata !211, metadata !DIExpression(DW_OP_deref)) #7, !dbg !220
  call void @llvm.dbg.value(metadata double** %tmp.addr.i, metadata !212, metadata !DIExpression(DW_OP_deref)) #7, !dbg !220
  call void @llvm.dbg.value(metadata double** %A.addr.i, metadata !213, metadata !DIExpression(DW_OP_deref)) #7, !dbg !220
  call void @llvm.dbg.value(metadata double** %B.addr.i, metadata !214, metadata !DIExpression(DW_OP_deref)) #7, !dbg !220
  call void @llvm.dbg.value(metadata double** %C.addr.i, metadata !215, metadata !DIExpression(DW_OP_deref)) #7, !dbg !220
  call void @llvm.dbg.value(metadata double** %D.addr.i, metadata !216, metadata !DIExpression(DW_OP_deref)) #7, !dbg !220
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* nonnull %.kmpc_loc.addr.i, i32 21, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, i32*, i64, i64, double**, i32*, double*, i64, i64, double**, i64, i64, double**, i32*, i64, i64, double**, double*, i64, i64, double**)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* nonnull %ni.addr.i, i32* nonnull %nj.addr.i, i64 %.pre-phi, i64 %10, double** nonnull %tmp.addr.i, i32* nonnull %nk.addr.i, double* nonnull %alpha.addr.i, i64 %.pre-phi, i64 %42, double** nonnull %A.addr.i, i64 %42, i64 %10, double** nonnull %B.addr.i, i32* nonnull %nl.addr.i, i64 %.pre-phi, i64 %9, double** nonnull %D.addr.i, double* nonnull %beta.addr.i, i64 %9, i64 %10, double** nonnull %C.addr.i) #7, !dbg !224
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %25), !dbg !227
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %26), !dbg !227
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %27), !dbg !227
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %28), !dbg !227
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %29), !dbg !227
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %30), !dbg !227
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %31), !dbg !227
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %32), !dbg !227
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %33), !dbg !227
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %34), !dbg !227
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %35), !dbg !227
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %36), !dbg !227
  %cmp = icmp eq i32 %conv.i, 1, !dbg !228
  br i1 %cmp, label %if.then, label %if.end, !dbg !230

if.then:                                          ; preds = %init_array.exit
  call void @llvm.dbg.value(metadata i32 %conv.i89, metadata !231, metadata !DIExpression()) #7, !dbg !240
  call void @llvm.dbg.value(metadata i32 %conv.i95, metadata !236, metadata !DIExpression()) #7, !dbg !240
  call void @llvm.dbg.value(metadata double* %8, metadata !237, metadata !DIExpression()) #7, !dbg !240
  call void @llvm.dbg.value(metadata i32 0, metadata !238, metadata !DIExpression()) #7, !dbg !240
  br i1 %cmp143.i, label %for.cond1.preheader.i98.preheader, label %print_array.exit, !dbg !242

for.cond1.preheader.i98.preheader:                ; preds = %if.then
  br label %for.cond1.preheader.i98, !dbg !242

for.cond1.preheader.i98:                          ; preds = %for.inc8.i107, %for.cond1.preheader.i98.preheader
  %indvars.iv31.i = phi i64 [ %indvars.iv.next32.i, %for.inc8.i107 ], [ 0, %for.cond1.preheader.i98.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv31.i, metadata !238, metadata !DIExpression()) #7, !dbg !240
  call void @llvm.dbg.value(metadata i32 0, metadata !239, metadata !DIExpression()) #7, !dbg !240
  br i1 %cmp35133.i, label %for.body3.lr.ph.i101, label %for.inc8.i107, !dbg !244

for.body3.lr.ph.i101:                             ; preds = %for.cond1.preheader.i98
  %44 = mul nuw nsw i64 %indvars.iv31.i, %9, !dbg !247
  %arrayidx.i99 = getelementptr inbounds double, double* %8, i64 %44, !dbg !247
  %45 = trunc i64 %indvars.iv31.i to i32, !dbg !250
  %mul.i100 = mul nsw i32 %45, %conv.i89, !dbg !250
  br label %for.body3.i104, !dbg !244

for.body3.i104:                                   ; preds = %for.inc.i, %for.body3.lr.ph.i101
  %indvars.iv.i102 = phi i64 [ 0, %for.body3.lr.ph.i101 ], [ %indvars.iv.next.i105, %for.inc.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i102, metadata !239, metadata !DIExpression()) #7, !dbg !240
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !252, !tbaa !42
  %arrayidx5.i = getelementptr inbounds double, double* %arrayidx.i99, i64 %indvars.iv.i102, !dbg !253
  %47 = load double, double* %arrayidx5.i, align 8, !dbg !253, !tbaa !140
  %call.i103 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), double %47) #8, !dbg !254
  %48 = trunc i64 %indvars.iv.i102 to i32, !dbg !255
  %add.i = add nsw i32 %mul.i100, %48, !dbg !255
  %rem.i = srem i32 %add.i, 20, !dbg !256
  %cmp6.i = icmp eq i32 %rem.i, 0, !dbg !257
  br i1 %cmp6.i, label %if.then.i, label %for.inc.i, !dbg !258

if.then.i:                                        ; preds = %for.body3.i104
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !259, !tbaa !42
  %fputc25.i = call i32 @fputc(i32 10, %struct._IO_FILE* %49) #8, !dbg !260
  br label %for.inc.i, !dbg !260

for.inc.i:                                        ; preds = %if.then.i, %for.body3.i104
  %indvars.iv.next.i105 = add nuw nsw i64 %indvars.iv.i102, 1, !dbg !261
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i105, metadata !239, metadata !DIExpression()) #7, !dbg !240
  %exitcond.i106 = icmp eq i64 %indvars.iv.next.i105, %9, !dbg !262
  br i1 %exitcond.i106, label %for.inc8.i107.loopexit, label %for.body3.i104, !dbg !244, !llvm.loop !263

for.inc8.i107.loopexit:                           ; preds = %for.inc.i
  br label %for.inc8.i107, !dbg !265

for.inc8.i107:                                    ; preds = %for.inc8.i107.loopexit, %for.cond1.preheader.i98
  %indvars.iv.next32.i = add nuw nsw i64 %indvars.iv31.i, 1, !dbg !265
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next32.i, metadata !238, metadata !DIExpression()) #7, !dbg !240
  %exitcond34.i = icmp eq i64 %indvars.iv.next32.i, %.pre-phi, !dbg !266
  br i1 %exitcond34.i, label %print_array.exit.loopexit, label %for.cond1.preheader.i98, !dbg !242, !llvm.loop !267

print_array.exit.loopexit:                        ; preds = %for.inc8.i107
  br label %print_array.exit, !dbg !269

print_array.exit:                                 ; preds = %print_array.exit.loopexit, %if.then
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !269, !tbaa !42
  %fputc.i = call i32 @fputc(i32 10, %struct._IO_FILE* %50) #8, !dbg !270
  br label %if.end, !dbg !271

if.end:                                           ; preds = %print_array.exit, %init_array.exit
  call void @free(i8* %call10) #7, !dbg !272
  call void @free(i8* %call14) #7, !dbg !273
  call void @free(i8* %call18) #7, !dbg !274
  call void @free(i8* %call22) #7, !dbg !275
  call void @free(i8* %call26) #7, !dbg !276
  ret i32 0, !dbg !277
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nofree nounwind
declare dso_local i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare dso_local noalias i8* @malloc(i64) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: norecurse nounwind uwtable
define internal void @.omp_outlined.(i32* noalias nocapture readonly %.global_tid., i32* noalias nocapture readnone %.bound_tid., i32* nocapture readonly dereferenceable(4) %ni, i32* nocapture readonly dereferenceable(4) %nj, i64 %vla, i64 %vla1, double** nocapture readonly dereferenceable(8) %tmp, i32* nocapture readonly dereferenceable(4) %nk, double* nocapture readonly dereferenceable(8) %alpha, i64 %vla3, i64 %vla5, double** nocapture readonly dereferenceable(8) %A, i64 %vla7, i64 %vla9, double** nocapture readonly dereferenceable(8) %B, i32* nocapture readonly dereferenceable(4) %nl, i64 %vla11, i64 %vla13, double** nocapture readonly dereferenceable(8) %D, double* nocapture readonly dereferenceable(8) %beta, i64 %vla15, i64 %vla17, double** nocapture readonly dereferenceable(8) %C) #4 !dbg !278 {
entry:
  %.omp.lb.i = alloca i32, align 4
  %.omp.ub.i = alloca i32, align 4
  %.omp.stride.i = alloca i32, align 4
  %.omp.is_last.i = alloca i32, align 4
  %.kmpc_loc.addr.i = alloca %struct.ident_t, align 8
  %.omp.lb64.i = alloca i32, align 4
  %.omp.ub65.i = alloca i32, align 4
  %.omp.stride66.i = alloca i32, align 4
  %.omp.is_last67.i = alloca i32, align 4
  call void @llvm.dbg.value(metadata i32* %.global_tid., metadata !290, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i32* %.bound_tid., metadata !291, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i32* %ni, metadata !292, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i32* %nj, metadata !293, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i64 %vla, metadata !294, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i64 %vla1, metadata !295, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata double** %tmp, metadata !296, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i32* %nk, metadata !297, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata double* %alpha, metadata !298, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i64 %vla3, metadata !299, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i64 %vla5, metadata !300, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata double** %A, metadata !301, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i64 %vla7, metadata !302, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i64 %vla9, metadata !303, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata double** %B, metadata !304, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i32* %nl, metadata !305, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i64 %vla11, metadata !306, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i64 %vla13, metadata !307, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata double** %D, metadata !308, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata double* %beta, metadata !309, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i64 %vla15, metadata !310, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata i64 %vla17, metadata !311, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.value(metadata double** %C, metadata !312, metadata !DIExpression()), !dbg !313
  %0 = bitcast %struct.ident_t* %.kmpc_loc.addr.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %0)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %0, i8* nonnull align 8 dereferenceable(24) bitcast (%struct.ident_t* @2 to i8*), i64 24, i1 false) #7, !noalias !314
  call void @llvm.dbg.value(metadata i32* %.global_tid., metadata !317, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata i32* undef, metadata !320, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata i32* %ni, metadata !321, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata i32* %nj, metadata !322, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata i64 undef, metadata !323, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata i64 %vla1, metadata !324, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata double** %tmp, metadata !325, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata i32* %nk, metadata !326, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata double* %alpha, metadata !327, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata i64 undef, metadata !328, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata i64 %vla5, metadata !329, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata double** %A, metadata !330, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata i64 undef, metadata !331, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata i64 %vla9, metadata !332, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata double** %B, metadata !333, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata i32* %nl, metadata !334, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata i64 undef, metadata !335, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata i64 %vla13, metadata !336, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata double** %D, metadata !337, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata double* %beta, metadata !338, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata i64 undef, metadata !339, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata i64 %vla17, metadata !340, metadata !DIExpression()) #7, !dbg !363
  call void @llvm.dbg.value(metadata double** %C, metadata !341, metadata !DIExpression()) #7, !dbg !363
  %1 = load i32, i32* %ni, align 4, !dbg !365, !tbaa !222, !noalias !314
  call void @llvm.dbg.value(metadata i32 %1, metadata !345, metadata !DIExpression()) #7, !dbg !366
  %sub21.i = add nsw i32 %1, -1, !dbg !367
  call void @llvm.dbg.value(metadata i32 %sub21.i, metadata !345, metadata !DIExpression()) #7, !dbg !366
  call void @llvm.dbg.value(metadata i32 0, metadata !346, metadata !DIExpression()) #7, !dbg !366
  %cmp.i = icmp sgt i32 %1, 0, !dbg !367
  br i1 %cmp.i, label %omp.precond.then.i, label %entry.omp.precond.end_crit_edge.i, !dbg !368

entry.omp.precond.end_crit_edge.i:                ; preds = %entry
  %.pre.i = load i32, i32* %.global_tid., align 4, !dbg !369, !tbaa !222, !alias.scope !314
  br label %omp.precond.end.i, !dbg !368

omp.precond.then.i:                               ; preds = %entry
  %2 = bitcast i32* %.omp.lb.i to i8*, !dbg !368
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #7, !dbg !368, !noalias !314
  call void @llvm.dbg.value(metadata i32 0, metadata !347, metadata !DIExpression()) #7, !dbg !366
  store i32 0, i32* %.omp.lb.i, align 4, !dbg !370, !tbaa !222, !noalias !314
  %3 = bitcast i32* %.omp.ub.i to i8*, !dbg !368
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #7, !dbg !368, !noalias !314
  call void @llvm.dbg.value(metadata i32 %sub21.i, metadata !348, metadata !DIExpression()) #7, !dbg !366
  store i32 %sub21.i, i32* %.omp.ub.i, align 4, !dbg !370, !tbaa !222, !noalias !314
  %4 = bitcast i32* %.omp.stride.i to i8*, !dbg !368
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #7, !dbg !368, !noalias !314
  call void @llvm.dbg.value(metadata i32 1, metadata !349, metadata !DIExpression()) #7, !dbg !366
  store i32 1, i32* %.omp.stride.i, align 4, !dbg !370, !tbaa !222, !noalias !314
  %5 = bitcast i32* %.omp.is_last.i to i8*, !dbg !368
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #7, !dbg !368, !noalias !314
  call void @llvm.dbg.value(metadata i32 0, metadata !350, metadata !DIExpression()) #7, !dbg !366
  store i32 0, i32* %.omp.is_last.i, align 4, !dbg !370, !tbaa !222, !noalias !314
  %6 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr.i, i64 0, i32 4, !dbg !368
  store i8* getelementptr inbounds ([25 x i8], [25 x i8]* @3, i64 0, i64 0), i8** %6, align 8, !dbg !368, !tbaa !225, !noalias !314
  %7 = load i32, i32* %.global_tid., align 4, !dbg !368, !tbaa !222, !alias.scope !314
  call void @llvm.dbg.value(metadata i32* %.omp.lb.i, metadata !347, metadata !DIExpression(DW_OP_deref)) #7, !dbg !366
  call void @llvm.dbg.value(metadata i32* %.omp.ub.i, metadata !348, metadata !DIExpression(DW_OP_deref)) #7, !dbg !366
  call void @llvm.dbg.value(metadata i32* %.omp.stride.i, metadata !349, metadata !DIExpression(DW_OP_deref)) #7, !dbg !366
  call void @llvm.dbg.value(metadata i32* %.omp.is_last.i, metadata !350, metadata !DIExpression(DW_OP_deref)) #7, !dbg !366
  call void @__kmpc_for_static_init_4(%struct.ident_t* nonnull %.kmpc_loc.addr.i, i32 %7, i32 34, i32* nonnull %.omp.is_last.i, i32* nonnull %.omp.lb.i, i32* nonnull %.omp.ub.i, i32* nonnull %.omp.stride.i, i32 1, i32 1) #7, !dbg !368, !noalias !314
  %8 = load i32, i32* %.omp.ub.i, align 4, !dbg !370, !tbaa !222, !noalias !314
  call void @llvm.dbg.value(metadata i32 %8, metadata !348, metadata !DIExpression()) #7, !dbg !366
  %cmp24.i = icmp slt i32 %8, %1, !dbg !370
  %cond.i = select i1 %cmp24.i, i32 %8, i32 %sub21.i, !dbg !370
  call void @llvm.dbg.value(metadata i32 %cond.i, metadata !348, metadata !DIExpression()) #7, !dbg !366
  store i32 %cond.i, i32* %.omp.ub.i, align 4, !dbg !370, !tbaa !222, !noalias !314
  %9 = load i32, i32* %.omp.lb.i, align 4, !dbg !370, !tbaa !222, !noalias !314
  call void @llvm.dbg.value(metadata i32 %9, metadata !347, metadata !DIExpression()) #7, !dbg !366
  call void @llvm.dbg.value(metadata i32 %9, metadata !342, metadata !DIExpression()) #7, !dbg !366
  call void @llvm.dbg.value(metadata i32 %cond.i, metadata !348, metadata !DIExpression()) #7, !dbg !366
  %cmp2512.i = icmp sgt i32 %9, %cond.i, !dbg !367
  br i1 %cmp2512.i, label %omp.loop.exit.i, label %for.cond.preheader.lr.ph.i, !dbg !368

for.cond.preheader.lr.ph.i:                       ; preds = %omp.precond.then.i
  %10 = load i32, i32* %nj, align 4, !dbg !371, !noalias !314
  %cmp2710.i = icmp sgt i32 %10, 0, !dbg !371
  %11 = load double*, double** %tmp, align 8, !dbg !374, !noalias !314
  %12 = load i32, i32* %nk, align 4, !dbg !376, !noalias !314
  %cmp318.i = icmp sgt i32 %12, 0, !dbg !376
  %13 = sext i32 %9 to i64, !dbg !368
  %14 = sext i32 %cond.i to i64, !dbg !368
  %wide.trip.count23.i = zext i32 %10 to i64, !dbg !371
  br label %for.cond.preheader.i, !dbg !368

for.cond.preheader.i:                             ; preds = %omp.inner.for.inc.i, %for.cond.preheader.lr.ph.i
  %indvars.iv26.i = phi i64 [ %indvars.iv.next27.i, %omp.inner.for.inc.i ], [ %13, %for.cond.preheader.lr.ph.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv26.i, metadata !342, metadata !DIExpression()) #7, !dbg !366
  call void @llvm.dbg.value(metadata i32 0, metadata !351, metadata !DIExpression()) #7, !dbg !366
  br i1 %cmp2710.i, label %for.body.lr.ph.i, label %omp.inner.for.inc.i, !dbg !379

for.body.lr.ph.i:                                 ; preds = %for.cond.preheader.i
  %15 = mul nsw i64 %indvars.iv26.i, %vla1, !dbg !374
  %arrayidx.i = getelementptr inbounds double, double* %11, i64 %15, !dbg !374
  %16 = load double*, double** %A, align 8, !dbg !376, !noalias !314
  %17 = mul nsw i64 %indvars.iv26.i, %vla5, !dbg !376
  %arrayidx34.i = getelementptr inbounds double, double* %16, i64 %17, !dbg !376
  %18 = load double*, double** %B, align 8, !dbg !376, !noalias !314
  %19 = load i32, i32* %nk, align 4, !dbg !376, !noalias !314
  %20 = sext i32 %19 to i64, !dbg !379
  br label %for.body.i, !dbg !379

for.body.i:                                       ; preds = %for.inc48.i, %for.body.lr.ph.i
  %indvars.iv21.i = phi i64 [ 0, %for.body.lr.ph.i ], [ %indvars.iv.next22.i, %for.inc48.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv21.i, metadata !351, metadata !DIExpression()) #7, !dbg !366
  %arrayidx29.i = getelementptr inbounds double, double* %arrayidx.i, i64 %indvars.iv21.i, !dbg !380
  store double 0.000000e+00, double* %arrayidx29.i, align 8, !dbg !381, !tbaa !140, !noalias !314
  call void @llvm.dbg.value(metadata i32 0, metadata !352, metadata !DIExpression()) #7, !dbg !366
  br i1 %cmp318.i, label %for.body32.lr.ph.i, label %for.inc48.i, !dbg !382

for.body32.lr.ph.i:                               ; preds = %for.body.i
  %arrayidx39.i = getelementptr inbounds double, double* %18, i64 %indvars.iv21.i, !dbg !376
  br label %for.body32.i, !dbg !382

for.body32.i:                                     ; preds = %for.body32.i, %for.body32.lr.ph.i
  %21 = phi double [ 0.000000e+00, %for.body32.lr.ph.i ], [ %add47.i, %for.body32.i ], !dbg !383
  %indvars.iv19.i = phi i64 [ 0, %for.body32.lr.ph.i ], [ %indvars.iv.next20.i, %for.body32.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv19.i, metadata !352, metadata !DIExpression()) #7, !dbg !366
  %22 = load double, double* %alpha, align 8, !dbg !384, !tbaa !140, !noalias !314
  %arrayidx36.i = getelementptr inbounds double, double* %arrayidx34.i, i64 %indvars.iv19.i, !dbg !385
  %23 = load double, double* %arrayidx36.i, align 8, !dbg !385, !tbaa !140, !noalias !314
  %mul37.i = fmul double %22, %23, !dbg !386
  %24 = mul nsw i64 %indvars.iv19.i, %vla9, !dbg !387
  %arrayidx41.i = getelementptr inbounds double, double* %arrayidx39.i, i64 %24, !dbg !387
  %25 = load double, double* %arrayidx41.i, align 8, !dbg !387, !tbaa !140, !noalias !314
  %mul42.i = fmul double %mul37.i, %25, !dbg !388
  %add47.i = fadd double %21, %mul42.i, !dbg !383
  store double %add47.i, double* %arrayidx29.i, align 8, !dbg !383, !tbaa !140, !noalias !314
  %indvars.iv.next20.i = add nuw nsw i64 %indvars.iv19.i, 1, !dbg !389
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next20.i, metadata !352, metadata !DIExpression()) #7, !dbg !366
  %cmp31.i = icmp slt i64 %indvars.iv.next20.i, %20, !dbg !390
  br i1 %cmp31.i, label %for.body32.i, label %for.inc48.i.loopexit, !dbg !382, !llvm.loop !391

for.inc48.i.loopexit:                             ; preds = %for.body32.i
  br label %for.inc48.i, !dbg !393

for.inc48.i:                                      ; preds = %for.inc48.i.loopexit, %for.body.i
  %indvars.iv.next22.i = add nuw nsw i64 %indvars.iv21.i, 1, !dbg !393
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next22.i, metadata !351, metadata !DIExpression()) #7, !dbg !366
  %exitcond24.i = icmp eq i64 %indvars.iv.next22.i, %wide.trip.count23.i, !dbg !394
  br i1 %exitcond24.i, label %omp.inner.for.inc.i.loopexit, label %for.body.i, !dbg !379, !llvm.loop !395

omp.inner.for.inc.i.loopexit:                     ; preds = %for.inc48.i
  br label %omp.inner.for.inc.i, !dbg !367

omp.inner.for.inc.i:                              ; preds = %omp.inner.for.inc.i.loopexit, %for.cond.preheader.i
  %indvars.iv.next27.i = add nsw i64 %indvars.iv26.i, 1, !dbg !367
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next27.i, metadata !342, metadata !DIExpression()) #7, !dbg !366
  call void @llvm.dbg.value(metadata i32 %cond.i, metadata !348, metadata !DIExpression()) #7, !dbg !366
  %cmp25.i = icmp slt i64 %indvars.iv26.i, %14, !dbg !367
  br i1 %cmp25.i, label %for.cond.preheader.i, label %omp.loop.exit.i.loopexit, !dbg !368, !llvm.loop !397

omp.loop.exit.i.loopexit:                         ; preds = %omp.inner.for.inc.i
  br label %omp.loop.exit.i, !dbg !398

omp.loop.exit.i:                                  ; preds = %omp.loop.exit.i.loopexit, %omp.precond.then.i
  store i8* getelementptr inbounds ([26 x i8], [26 x i8]* @4, i64 0, i64 0), i8** %6, align 8, !dbg !398, !tbaa !225, !noalias !314
  call void @__kmpc_for_static_fini(%struct.ident_t* nonnull %.kmpc_loc.addr.i, i32 %7) #7, !dbg !398, !noalias !314
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #7, !dbg !398, !noalias !314
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #7, !dbg !398, !noalias !314
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #7, !dbg !398, !noalias !314
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #7, !dbg !398, !noalias !314
  br label %omp.precond.end.i, !dbg !398

omp.precond.end.i:                                ; preds = %omp.loop.exit.i, %entry.omp.precond.end_crit_edge.i
  %26 = phi i32 [ %.pre.i, %entry.omp.precond.end_crit_edge.i ], [ %7, %omp.loop.exit.i ], !dbg !369
  %27 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr.i, i64 0, i32 4, !dbg !369
  store i8* getelementptr inbounds ([25 x i8], [25 x i8]* @3, i64 0, i64 0), i8** %27, align 8, !dbg !369, !tbaa !225, !noalias !314
  call void @__kmpc_barrier(%struct.ident_t* nonnull %.kmpc_loc.addr.i, i32 %26) #7, !dbg !369, !noalias !314
  %28 = load i32, i32* %ni, align 4, !dbg !399, !tbaa !222, !noalias !314
  call void @llvm.dbg.value(metadata i32 %28, metadata !355, metadata !DIExpression()) #7, !dbg !400
  %sub57.i = add nsw i32 %28, -1, !dbg !401
  call void @llvm.dbg.value(metadata i32 %sub57.i, metadata !355, metadata !DIExpression()) #7, !dbg !400
  call void @llvm.dbg.value(metadata i32 0, metadata !356, metadata !DIExpression()) #7, !dbg !400
  %cmp62.i = icmp sgt i32 %28, 0, !dbg !401
  br i1 %cmp62.i, label %omp.precond.then63.i, label %.omp_outlined._debug__.exit, !dbg !402

omp.precond.then63.i:                             ; preds = %omp.precond.end.i
  %29 = bitcast i32* %.omp.lb64.i to i8*, !dbg !402
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %29) #7, !dbg !402, !noalias !314
  call void @llvm.dbg.value(metadata i32 0, metadata !357, metadata !DIExpression()) #7, !dbg !400
  store i32 0, i32* %.omp.lb64.i, align 4, !dbg !403, !tbaa !222, !noalias !314
  %30 = bitcast i32* %.omp.ub65.i to i8*, !dbg !402
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %30) #7, !dbg !402, !noalias !314
  call void @llvm.dbg.value(metadata i32 %sub57.i, metadata !358, metadata !DIExpression()) #7, !dbg !400
  store i32 %sub57.i, i32* %.omp.ub65.i, align 4, !dbg !403, !tbaa !222, !noalias !314
  %31 = bitcast i32* %.omp.stride66.i to i8*, !dbg !402
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %31) #7, !dbg !402, !noalias !314
  call void @llvm.dbg.value(metadata i32 1, metadata !359, metadata !DIExpression()) #7, !dbg !400
  store i32 1, i32* %.omp.stride66.i, align 4, !dbg !403, !tbaa !222, !noalias !314
  %32 = bitcast i32* %.omp.is_last67.i to i8*, !dbg !402
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %32) #7, !dbg !402, !noalias !314
  call void @llvm.dbg.value(metadata i32 0, metadata !360, metadata !DIExpression()) #7, !dbg !400
  store i32 0, i32* %.omp.is_last67.i, align 4, !dbg !403, !tbaa !222, !noalias !314
  store i8* getelementptr inbounds ([25 x i8], [25 x i8]* @5, i64 0, i64 0), i8** %27, align 8, !dbg !402, !tbaa !225, !noalias !314
  call void @llvm.dbg.value(metadata i32* %.omp.lb64.i, metadata !357, metadata !DIExpression(DW_OP_deref)) #7, !dbg !400
  call void @llvm.dbg.value(metadata i32* %.omp.ub65.i, metadata !358, metadata !DIExpression(DW_OP_deref)) #7, !dbg !400
  call void @llvm.dbg.value(metadata i32* %.omp.stride66.i, metadata !359, metadata !DIExpression(DW_OP_deref)) #7, !dbg !400
  call void @llvm.dbg.value(metadata i32* %.omp.is_last67.i, metadata !360, metadata !DIExpression(DW_OP_deref)) #7, !dbg !400
  call void @__kmpc_for_static_init_4(%struct.ident_t* nonnull %.kmpc_loc.addr.i, i32 %26, i32 34, i32* nonnull %.omp.is_last67.i, i32* nonnull %.omp.lb64.i, i32* nonnull %.omp.ub65.i, i32* nonnull %.omp.stride66.i, i32 1, i32 1) #7, !dbg !402, !noalias !314
  %33 = load i32, i32* %.omp.ub65.i, align 4, !dbg !403, !tbaa !222, !noalias !314
  call void @llvm.dbg.value(metadata i32 %33, metadata !358, metadata !DIExpression()) #7, !dbg !400
  %cmp71.i = icmp slt i32 %33, %28, !dbg !403
  %cond75.i = select i1 %cmp71.i, i32 %33, i32 %sub57.i, !dbg !403
  call void @llvm.dbg.value(metadata i32 %cond75.i, metadata !358, metadata !DIExpression()) #7, !dbg !400
  store i32 %cond75.i, i32* %.omp.ub65.i, align 4, !dbg !403, !tbaa !222, !noalias !314
  %34 = load i32, i32* %.omp.lb64.i, align 4, !dbg !403, !tbaa !222, !noalias !314
  call void @llvm.dbg.value(metadata i32 %34, metadata !357, metadata !DIExpression()) #7, !dbg !400
  call void @llvm.dbg.value(metadata i32 %34, metadata !353, metadata !DIExpression()) #7, !dbg !400
  call void @llvm.dbg.value(metadata i32 %cond75.i, metadata !358, metadata !DIExpression()) #7, !dbg !400
  %cmp775.i = icmp sgt i32 %34, %cond75.i, !dbg !401
  br i1 %cmp775.i, label %omp.loop.exit117.i, label %for.cond82.preheader.lr.ph.i, !dbg !402

for.cond82.preheader.lr.ph.i:                     ; preds = %omp.precond.then63.i
  %35 = load i32, i32* %nl, align 4, !dbg !404, !noalias !314
  %cmp833.i = icmp sgt i32 %35, 0, !dbg !404
  %36 = load double*, double** %D, align 8, !dbg !407, !noalias !314
  %37 = load i32, i32* %nj, align 4, !dbg !409, !noalias !314
  %cmp911.i = icmp sgt i32 %37, 0, !dbg !409
  %38 = sext i32 %34 to i64, !dbg !402
  %39 = sext i32 %cond75.i to i64, !dbg !402
  %wide.trip.count.i = zext i32 %35 to i64, !dbg !404
  br label %for.cond82.preheader.i, !dbg !402

for.cond82.preheader.i:                           ; preds = %omp.inner.for.inc114.i, %for.cond82.preheader.lr.ph.i
  %indvars.iv17.i = phi i64 [ %indvars.iv.next18.i, %omp.inner.for.inc114.i ], [ %38, %for.cond82.preheader.lr.ph.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv17.i, metadata !353, metadata !DIExpression()) #7, !dbg !400
  call void @llvm.dbg.value(metadata i32 0, metadata !361, metadata !DIExpression()) #7, !dbg !400
  br i1 %cmp833.i, label %for.body84.lr.ph.i, label %omp.inner.for.inc114.i, !dbg !412

for.body84.lr.ph.i:                               ; preds = %for.cond82.preheader.i
  %40 = mul nsw i64 %indvars.iv17.i, %vla13, !dbg !407
  %arrayidx86.i = getelementptr inbounds double, double* %36, i64 %40, !dbg !407
  %41 = load double*, double** %tmp, align 8, !dbg !409, !noalias !314
  %42 = mul nsw i64 %indvars.iv17.i, %vla1, !dbg !409
  %arrayidx94.i = getelementptr inbounds double, double* %41, i64 %42, !dbg !409
  %43 = load double*, double** %C, align 8, !dbg !409, !noalias !314
  %44 = load i32, i32* %nj, align 4, !dbg !409, !noalias !314
  %45 = sext i32 %44 to i64, !dbg !412
  br label %for.body84.i, !dbg !412

for.body84.i:                                     ; preds = %for.inc110.i, %for.body84.lr.ph.i
  %indvars.iv15.i = phi i64 [ 0, %for.body84.lr.ph.i ], [ %indvars.iv.next16.i, %for.inc110.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv15.i, metadata !361, metadata !DIExpression()) #7, !dbg !400
  %46 = load double, double* %beta, align 8, !dbg !413, !tbaa !140, !noalias !314
  %arrayidx88.i = getelementptr inbounds double, double* %arrayidx86.i, i64 %indvars.iv15.i, !dbg !414
  %47 = load double, double* %arrayidx88.i, align 8, !dbg !415, !tbaa !140, !noalias !314
  %mul89.i = fmul double %46, %47, !dbg !415
  store double %mul89.i, double* %arrayidx88.i, align 8, !dbg !415, !tbaa !140, !noalias !314
  call void @llvm.dbg.value(metadata i32 0, metadata !362, metadata !DIExpression()) #7, !dbg !400
  br i1 %cmp911.i, label %for.body92.lr.ph.i, label %for.inc110.i, !dbg !416

for.body92.lr.ph.i:                               ; preds = %for.body84.i
  %arrayidx98.i = getelementptr inbounds double, double* %43, i64 %indvars.iv15.i, !dbg !409
  br label %for.body92.i, !dbg !416

for.body92.i:                                     ; preds = %for.body92.i, %for.body92.lr.ph.i
  %48 = phi double [ %mul89.i, %for.body92.lr.ph.i ], [ %add106.i, %for.body92.i ], !dbg !417
  %indvars.iv.i = phi i64 [ 0, %for.body92.lr.ph.i ], [ %indvars.iv.next.i, %for.body92.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i, metadata !362, metadata !DIExpression()) #7, !dbg !400
  %arrayidx96.i = getelementptr inbounds double, double* %arrayidx94.i, i64 %indvars.iv.i, !dbg !418
  %49 = load double, double* %arrayidx96.i, align 8, !dbg !418, !tbaa !140, !noalias !314
  %50 = mul nsw i64 %indvars.iv.i, %vla17, !dbg !419
  %arrayidx100.i = getelementptr inbounds double, double* %arrayidx98.i, i64 %50, !dbg !419
  %51 = load double, double* %arrayidx100.i, align 8, !dbg !419, !tbaa !140, !noalias !314
  %mul101.i = fmul double %49, %51, !dbg !420
  %add106.i = fadd double %48, %mul101.i, !dbg !417
  store double %add106.i, double* %arrayidx88.i, align 8, !dbg !417, !tbaa !140, !noalias !314
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !421
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i, metadata !362, metadata !DIExpression()) #7, !dbg !400
  %cmp91.i = icmp slt i64 %indvars.iv.next.i, %45, !dbg !422
  br i1 %cmp91.i, label %for.body92.i, label %for.inc110.i.loopexit, !dbg !416, !llvm.loop !423

for.inc110.i.loopexit:                            ; preds = %for.body92.i
  br label %for.inc110.i, !dbg !425

for.inc110.i:                                     ; preds = %for.inc110.i.loopexit, %for.body84.i
  %indvars.iv.next16.i = add nuw nsw i64 %indvars.iv15.i, 1, !dbg !425
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next16.i, metadata !361, metadata !DIExpression()) #7, !dbg !400
  %exitcond.i = icmp eq i64 %indvars.iv.next16.i, %wide.trip.count.i, !dbg !426
  br i1 %exitcond.i, label %omp.inner.for.inc114.i.loopexit, label %for.body84.i, !dbg !412, !llvm.loop !427

omp.inner.for.inc114.i.loopexit:                  ; preds = %for.inc110.i
  br label %omp.inner.for.inc114.i, !dbg !401

omp.inner.for.inc114.i:                           ; preds = %omp.inner.for.inc114.i.loopexit, %for.cond82.preheader.i
  %indvars.iv.next18.i = add nsw i64 %indvars.iv17.i, 1, !dbg !401
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next18.i, metadata !353, metadata !DIExpression()) #7, !dbg !400
  call void @llvm.dbg.value(metadata i32 %cond75.i, metadata !358, metadata !DIExpression()) #7, !dbg !400
  %cmp77.i = icmp slt i64 %indvars.iv17.i, %39, !dbg !401
  br i1 %cmp77.i, label %for.cond82.preheader.i, label %omp.loop.exit117.i.loopexit, !dbg !402, !llvm.loop !429

omp.loop.exit117.i.loopexit:                      ; preds = %omp.inner.for.inc114.i
  br label %omp.loop.exit117.i, !dbg !430

omp.loop.exit117.i:                               ; preds = %omp.loop.exit117.i.loopexit, %omp.precond.then63.i
  store i8* getelementptr inbounds ([26 x i8], [26 x i8]* @6, i64 0, i64 0), i8** %27, align 8, !dbg !430, !tbaa !225, !noalias !314
  call void @__kmpc_for_static_fini(%struct.ident_t* nonnull %.kmpc_loc.addr.i, i32 %26) #7, !dbg !430, !noalias !314
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %32) #7, !dbg !430, !noalias !314
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %31) #7, !dbg !430, !noalias !314
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %30) #7, !dbg !430, !noalias !314
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %29) #7, !dbg !430, !noalias !314
  br label %.omp_outlined._debug__.exit, !dbg !430

.omp_outlined._debug__.exit:                      ; preds = %omp.loop.exit117.i, %omp.precond.end.i
  store i8* getelementptr inbounds ([25 x i8], [25 x i8]* @5, i64 0, i64 0), i8** %27, align 8, !dbg !431, !tbaa !225, !noalias !314
  call void @__kmpc_barrier(%struct.ident_t* nonnull %.kmpc_loc.addr.i, i32 %26) #7, !dbg !431, !noalias !314
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %0), !dbg !432
  ret void, !dbg !433
}

declare !callback !434 dso_local void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) local_unnamed_addr

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nofree nounwind
declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare !dbg !10 dso_local void @free(i8* nocapture) local_unnamed_addr #6

declare dso_local void @__kmpc_for_static_init_4(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32) local_unnamed_addr

declare dso_local void @__kmpc_for_static_fini(%struct.ident_t*, i32) local_unnamed_addr

declare dso_local void @__kmpc_barrier(%struct.ident_t*, i32) local_unnamed_addr

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nofree nounwind }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { cold nounwind }

!llvm.dbg.cu = !{!0}
!llvm.ident = !{!18}
!llvm.module.flags = !{!19, !20, !21}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (git@github.com:SusanTan/llvm-project.git fcc6352b59353e5ddb5bfbd85a3919893d4595c9)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "2mm.c", directory: "/scratch/yc0769/xstack-benchmark/xstack-benchmark/polybench-parallel/2mm")
!2 = !{}
!3 = !{!4, !9, !10, !14, !15, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, elements: !7)
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = !{!8, !8}
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
!18 = !{!"clang version 10.0.1 (git@github.com:SusanTan/llvm-project.git fcc6352b59353e5ddb5bfbd85a3919893d4595c9)"}
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 99, type: !23, scopeLine: 100, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !25)
!23 = !DISubroutineType(types: !24)
!24 = !{!14, !14, !15}
!25 = !{!26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39}
!26 = !DILocalVariable(name: "argc", arg: 1, scope: !22, file: !1, line: 99, type: !14)
!27 = !DILocalVariable(name: "argv", arg: 2, scope: !22, file: !1, line: 99, type: !15)
!28 = !DILocalVariable(name: "dump_code", scope: !22, file: !1, line: 101, type: !14)
!29 = !DILocalVariable(name: "ni", scope: !22, file: !1, line: 102, type: !14)
!30 = !DILocalVariable(name: "nj", scope: !22, file: !1, line: 103, type: !14)
!31 = !DILocalVariable(name: "nk", scope: !22, file: !1, line: 104, type: !14)
!32 = !DILocalVariable(name: "nl", scope: !22, file: !1, line: 105, type: !14)
!33 = !DILocalVariable(name: "alpha", scope: !22, file: !1, line: 108, type: !6)
!34 = !DILocalVariable(name: "beta", scope: !22, file: !1, line: 109, type: !6)
!35 = !DILocalVariable(name: "tmp", scope: !22, file: !1, line: 110, type: !4)
!36 = !DILocalVariable(name: "A", scope: !22, file: !1, line: 111, type: !4)
!37 = !DILocalVariable(name: "B", scope: !22, file: !1, line: 112, type: !4)
!38 = !DILocalVariable(name: "C", scope: !22, file: !1, line: 113, type: !4)
!39 = !DILocalVariable(name: "D", scope: !22, file: !1, line: 114, type: !4)
!40 = !DILocation(line: 0, scope: !22)
!41 = !DILocation(line: 101, column: 24, scope: !22)
!42 = !{!43, !43, i64 0}
!43 = !{!"any pointer", !44, i64 0}
!44 = !{!"omnipotent char", !45, i64 0}
!45 = !{!"Simple C/C++ TBAA"}
!46 = !DILocalVariable(name: "__nptr", arg: 1, scope: !47, file: !11, line: 361, type: !50)
!47 = distinct !DISubprogram(name: "atoi", scope: !11, file: !11, line: 361, type: !48, scopeLine: 362, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !52)
!48 = !DISubroutineType(types: !49)
!49 = !{!14, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!52 = !{!46}
!53 = !DILocation(line: 0, scope: !47, inlinedAt: !54)
!54 = distinct !DILocation(line: 101, column: 19, scope: !22)
!55 = !DILocation(line: 363, column: 16, scope: !47, inlinedAt: !54)
!56 = !DILocation(line: 363, column: 10, scope: !47, inlinedAt: !54)
!57 = !DILocation(line: 102, column: 17, scope: !22)
!58 = !DILocation(line: 0, scope: !47, inlinedAt: !59)
!59 = distinct !DILocation(line: 102, column: 12, scope: !22)
!60 = !DILocation(line: 363, column: 16, scope: !47, inlinedAt: !59)
!61 = !DILocation(line: 363, column: 10, scope: !47, inlinedAt: !59)
!62 = !DILocation(line: 103, column: 17, scope: !22)
!63 = !DILocation(line: 0, scope: !47, inlinedAt: !64)
!64 = distinct !DILocation(line: 103, column: 12, scope: !22)
!65 = !DILocation(line: 363, column: 16, scope: !47, inlinedAt: !64)
!66 = !DILocation(line: 363, column: 10, scope: !47, inlinedAt: !64)
!67 = !DILocation(line: 104, column: 17, scope: !22)
!68 = !DILocation(line: 0, scope: !47, inlinedAt: !69)
!69 = distinct !DILocation(line: 104, column: 12, scope: !22)
!70 = !DILocation(line: 363, column: 16, scope: !47, inlinedAt: !69)
!71 = !DILocation(line: 363, column: 10, scope: !47, inlinedAt: !69)
!72 = !DILocation(line: 105, column: 17, scope: !22)
!73 = !DILocation(line: 0, scope: !47, inlinedAt: !74)
!74 = distinct !DILocation(line: 105, column: 12, scope: !22)
!75 = !DILocation(line: 363, column: 16, scope: !47, inlinedAt: !74)
!76 = !DILocation(line: 363, column: 10, scope: !47, inlinedAt: !74)
!77 = !DILocation(line: 110, column: 63, scope: !22)
!78 = !DILocation(line: 110, column: 58, scope: !22)
!79 = !DILocation(line: 110, column: 70, scope: !22)
!80 = !DILocation(line: 110, column: 51, scope: !22)
!81 = !DILocation(line: 111, column: 54, scope: !22)
!82 = !DILocation(line: 111, column: 66, scope: !22)
!83 = !DILocation(line: 111, column: 47, scope: !22)
!84 = !DILocation(line: 111, column: 28, scope: !22)
!85 = !DILocation(line: 112, column: 59, scope: !22)
!86 = !DILocation(line: 112, column: 54, scope: !22)
!87 = !DILocation(line: 112, column: 66, scope: !22)
!88 = !DILocation(line: 112, column: 47, scope: !22)
!89 = !DILocation(line: 112, column: 28, scope: !22)
!90 = !DILocation(line: 113, column: 54, scope: !22)
!91 = !DILocation(line: 113, column: 66, scope: !22)
!92 = !DILocation(line: 113, column: 47, scope: !22)
!93 = !DILocation(line: 113, column: 28, scope: !22)
!94 = !DILocation(line: 114, column: 54, scope: !22)
!95 = !DILocation(line: 114, column: 66, scope: !22)
!96 = !DILocation(line: 114, column: 47, scope: !22)
!97 = !DILocation(line: 114, column: 28, scope: !22)
!98 = !DILocalVariable(name: "ni", arg: 1, scope: !99, file: !1, line: 16, type: !14)
!99 = distinct !DISubprogram(name: "init_array", scope: !1, file: !1, line: 16, type: !100, scopeLine: 23, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !106)
!100 = !DISubroutineType(types: !101)
!101 = !{null, !14, !14, !14, !14, !102, !102, !103, !103, !103, !103}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, elements: !105)
!105 = !{!8}
!106 = !{!98, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117}
!107 = !DILocalVariable(name: "nj", arg: 2, scope: !99, file: !1, line: 16, type: !14)
!108 = !DILocalVariable(name: "nk", arg: 3, scope: !99, file: !1, line: 16, type: !14)
!109 = !DILocalVariable(name: "nl", arg: 4, scope: !99, file: !1, line: 16, type: !14)
!110 = !DILocalVariable(name: "alpha", arg: 5, scope: !99, file: !1, line: 17, type: !102)
!111 = !DILocalVariable(name: "beta", arg: 6, scope: !99, file: !1, line: 18, type: !102)
!112 = !DILocalVariable(name: "A", arg: 7, scope: !99, file: !1, line: 19, type: !103)
!113 = !DILocalVariable(name: "B", arg: 8, scope: !99, file: !1, line: 20, type: !103)
!114 = !DILocalVariable(name: "C", arg: 9, scope: !99, file: !1, line: 21, type: !103)
!115 = !DILocalVariable(name: "D", arg: 10, scope: !99, file: !1, line: 22, type: !103)
!116 = !DILocalVariable(name: "i", scope: !99, file: !1, line: 24, type: !14)
!117 = !DILocalVariable(name: "j", scope: !99, file: !1, line: 24, type: !14)
!118 = !DILocation(line: 0, scope: !99, inlinedAt: !119)
!119 = distinct !DILocation(line: 117, column: 3, scope: !22)
!120 = !DILocation(line: 28, column: 17, scope: !121, inlinedAt: !119)
!121 = distinct !DILexicalBlock(scope: !122, file: !1, line: 28, column: 3)
!122 = distinct !DILexicalBlock(scope: !99, file: !1, line: 28, column: 3)
!123 = !DILocation(line: 28, column: 3, scope: !122, inlinedAt: !119)
!124 = !DILocation(line: 0, scope: !125, inlinedAt: !119)
!125 = distinct !DILexicalBlock(scope: !126, file: !1, line: 29, column: 5)
!126 = distinct !DILexicalBlock(scope: !121, file: !1, line: 29, column: 5)
!127 = !DILocation(line: 29, column: 5, scope: !126, inlinedAt: !119)
!128 = !DILocation(line: 31, column: 17, scope: !129, inlinedAt: !119)
!129 = distinct !DILexicalBlock(scope: !130, file: !1, line: 31, column: 3)
!130 = distinct !DILexicalBlock(scope: !99, file: !1, line: 31, column: 3)
!131 = !DILocation(line: 31, column: 3, scope: !130, inlinedAt: !119)
!132 = !DILocation(line: 0, scope: !133, inlinedAt: !119)
!133 = distinct !DILexicalBlock(scope: !134, file: !1, line: 32, column: 5)
!134 = distinct !DILexicalBlock(scope: !129, file: !1, line: 32, column: 5)
!135 = !DILocation(line: 30, column: 29, scope: !125, inlinedAt: !119)
!136 = !DILocation(line: 30, column: 28, scope: !125, inlinedAt: !119)
!137 = !DILocation(line: 30, column: 32, scope: !125, inlinedAt: !119)
!138 = !DILocation(line: 30, column: 7, scope: !125, inlinedAt: !119)
!139 = !DILocation(line: 30, column: 15, scope: !125, inlinedAt: !119)
!140 = !{!141, !141, i64 0}
!141 = !{!"double", !44, i64 0}
!142 = !DILocation(line: 29, column: 26, scope: !125, inlinedAt: !119)
!143 = !DILocation(line: 29, column: 19, scope: !125, inlinedAt: !119)
!144 = distinct !{!144, !127, !145}
!145 = !DILocation(line: 30, column: 34, scope: !126, inlinedAt: !119)
!146 = !DILocation(line: 28, column: 24, scope: !121, inlinedAt: !119)
!147 = distinct !{!147, !123, !148}
!148 = !DILocation(line: 30, column: 34, scope: !122, inlinedAt: !119)
!149 = !DILocation(line: 32, column: 5, scope: !134, inlinedAt: !119)
!150 = !DILocation(line: 34, column: 17, scope: !151, inlinedAt: !119)
!151 = distinct !DILexicalBlock(scope: !152, file: !1, line: 34, column: 3)
!152 = distinct !DILexicalBlock(scope: !99, file: !1, line: 34, column: 3)
!153 = !DILocation(line: 34, column: 3, scope: !152, inlinedAt: !119)
!154 = !DILocation(line: 0, scope: !155, inlinedAt: !119)
!155 = distinct !DILexicalBlock(scope: !156, file: !1, line: 35, column: 5)
!156 = distinct !DILexicalBlock(scope: !151, file: !1, line: 35, column: 5)
!157 = !DILocation(line: 33, column: 31, scope: !133, inlinedAt: !119)
!158 = !DILocation(line: 33, column: 29, scope: !133, inlinedAt: !119)
!159 = !DILocation(line: 33, column: 28, scope: !133, inlinedAt: !119)
!160 = !DILocation(line: 33, column: 36, scope: !133, inlinedAt: !119)
!161 = !DILocation(line: 33, column: 7, scope: !133, inlinedAt: !119)
!162 = !DILocation(line: 33, column: 15, scope: !133, inlinedAt: !119)
!163 = !DILocation(line: 32, column: 19, scope: !133, inlinedAt: !119)
!164 = distinct !{!164, !149, !165}
!165 = !DILocation(line: 33, column: 38, scope: !134, inlinedAt: !119)
!166 = !DILocation(line: 31, column: 24, scope: !129, inlinedAt: !119)
!167 = distinct !{!167, !131, !168}
!168 = !DILocation(line: 33, column: 38, scope: !130, inlinedAt: !119)
!169 = !DILocation(line: 35, column: 5, scope: !156, inlinedAt: !119)
!170 = !DILocation(line: 37, column: 3, scope: !171, inlinedAt: !119)
!171 = distinct !DILexicalBlock(scope: !99, file: !1, line: 37, column: 3)
!172 = !DILocation(line: 0, scope: !173, inlinedAt: !119)
!173 = distinct !DILexicalBlock(scope: !174, file: !1, line: 38, column: 5)
!174 = distinct !DILexicalBlock(scope: !175, file: !1, line: 38, column: 5)
!175 = distinct !DILexicalBlock(scope: !171, file: !1, line: 37, column: 3)
!176 = !DILocation(line: 37, column: 17, scope: !175, inlinedAt: !119)
!177 = !DILocation(line: 36, column: 29, scope: !155, inlinedAt: !119)
!178 = !DILocation(line: 36, column: 28, scope: !155, inlinedAt: !119)
!179 = !DILocation(line: 36, column: 36, scope: !155, inlinedAt: !119)
!180 = !DILocation(line: 36, column: 7, scope: !155, inlinedAt: !119)
!181 = !DILocation(line: 36, column: 15, scope: !155, inlinedAt: !119)
!182 = !DILocation(line: 35, column: 26, scope: !155, inlinedAt: !119)
!183 = !DILocation(line: 35, column: 19, scope: !155, inlinedAt: !119)
!184 = distinct !{!184, !169, !185}
!185 = !DILocation(line: 36, column: 38, scope: !156, inlinedAt: !119)
!186 = !DILocation(line: 34, column: 24, scope: !151, inlinedAt: !119)
!187 = distinct !{!187, !153, !188}
!188 = !DILocation(line: 36, column: 38, scope: !152, inlinedAt: !119)
!189 = !DILocation(line: 38, column: 5, scope: !174, inlinedAt: !119)
!190 = !DILocation(line: 39, column: 29, scope: !173, inlinedAt: !119)
!191 = !DILocation(line: 39, column: 28, scope: !173, inlinedAt: !119)
!192 = !DILocation(line: 39, column: 36, scope: !173, inlinedAt: !119)
!193 = !DILocation(line: 39, column: 7, scope: !173, inlinedAt: !119)
!194 = !DILocation(line: 39, column: 15, scope: !173, inlinedAt: !119)
!195 = !DILocation(line: 38, column: 26, scope: !173, inlinedAt: !119)
!196 = !DILocation(line: 38, column: 19, scope: !173, inlinedAt: !119)
!197 = distinct !{!197, !189, !198}
!198 = !DILocation(line: 39, column: 38, scope: !174, inlinedAt: !119)
!199 = !DILocation(line: 37, column: 24, scope: !175, inlinedAt: !119)
!200 = distinct !{!200, !170, !201}
!201 = !DILocation(line: 39, column: 38, scope: !171, inlinedAt: !119)
!202 = !DILocalVariable(name: "ni", arg: 1, scope: !203, file: !1, line: 63, type: !14)
!203 = distinct !DISubprogram(name: "kernel_2mm", scope: !1, file: !1, line: 63, type: !204, scopeLine: 71, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !206)
!204 = !DISubroutineType(types: !205)
!205 = !{null, !14, !14, !14, !14, !6, !6, !103, !103, !103, !103, !103}
!206 = !{!202, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219}
!207 = !DILocalVariable(name: "nj", arg: 2, scope: !203, file: !1, line: 63, type: !14)
!208 = !DILocalVariable(name: "nk", arg: 3, scope: !203, file: !1, line: 63, type: !14)
!209 = !DILocalVariable(name: "nl", arg: 4, scope: !203, file: !1, line: 63, type: !14)
!210 = !DILocalVariable(name: "alpha", arg: 5, scope: !203, file: !1, line: 64, type: !6)
!211 = !DILocalVariable(name: "beta", arg: 6, scope: !203, file: !1, line: 65, type: !6)
!212 = !DILocalVariable(name: "tmp", arg: 7, scope: !203, file: !1, line: 66, type: !103)
!213 = !DILocalVariable(name: "A", arg: 8, scope: !203, file: !1, line: 67, type: !103)
!214 = !DILocalVariable(name: "B", arg: 9, scope: !203, file: !1, line: 68, type: !103)
!215 = !DILocalVariable(name: "C", arg: 10, scope: !203, file: !1, line: 69, type: !103)
!216 = !DILocalVariable(name: "D", arg: 11, scope: !203, file: !1, line: 70, type: !103)
!217 = !DILocalVariable(name: "i", scope: !203, file: !1, line: 72, type: !14)
!218 = !DILocalVariable(name: "j", scope: !203, file: !1, line: 72, type: !14)
!219 = !DILocalVariable(name: "k", scope: !203, file: !1, line: 72, type: !14)
!220 = !DILocation(line: 0, scope: !203, inlinedAt: !221)
!221 = distinct !DILocation(line: 126, column: 3, scope: !22)
!222 = !{!223, !223, i64 0}
!223 = !{!"int", !44, i64 0}
!224 = !DILocation(line: 76, column: 1, scope: !203, inlinedAt: !221)
!225 = !{!226, !43, i64 16}
!226 = !{!"ident_t", !223, i64 0, !223, i64 4, !223, i64 8, !223, i64 12, !43, i64 16}
!227 = !DILocation(line: 96, column: 1, scope: !203, inlinedAt: !221)
!228 = !DILocation(line: 138, column: 17, scope: !229)
!229 = distinct !DILexicalBlock(scope: !22, file: !1, line: 138, column: 7)
!230 = !DILocation(line: 138, column: 7, scope: !22)
!231 = !DILocalVariable(name: "ni", arg: 1, scope: !232, file: !1, line: 46, type: !14)
!232 = distinct !DISubprogram(name: "print_array", scope: !1, file: !1, line: 46, type: !233, scopeLine: 48, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !235)
!233 = !DISubroutineType(types: !234)
!234 = !{null, !14, !14, !103}
!235 = !{!231, !236, !237, !238, !239}
!236 = !DILocalVariable(name: "nl", arg: 2, scope: !232, file: !1, line: 46, type: !14)
!237 = !DILocalVariable(name: "D", arg: 3, scope: !232, file: !1, line: 47, type: !103)
!238 = !DILocalVariable(name: "i", scope: !232, file: !1, line: 49, type: !14)
!239 = !DILocalVariable(name: "j", scope: !232, file: !1, line: 49, type: !14)
!240 = !DILocation(line: 0, scope: !232, inlinedAt: !241)
!241 = distinct !DILocation(line: 138, column: 23, scope: !229)
!242 = !DILocation(line: 51, column: 3, scope: !243, inlinedAt: !241)
!243 = distinct !DILexicalBlock(scope: !232, file: !1, line: 51, column: 3)
!244 = !DILocation(line: 52, column: 5, scope: !245, inlinedAt: !241)
!245 = distinct !DILexicalBlock(scope: !246, file: !1, line: 52, column: 5)
!246 = distinct !DILexicalBlock(scope: !243, file: !1, line: 51, column: 3)
!247 = !DILocation(line: 0, scope: !248, inlinedAt: !241)
!248 = distinct !DILexicalBlock(scope: !249, file: !1, line: 52, column: 30)
!249 = distinct !DILexicalBlock(scope: !245, file: !1, line: 52, column: 5)
!250 = !DILocation(line: 0, scope: !251, inlinedAt: !241)
!251 = distinct !DILexicalBlock(scope: !248, file: !1, line: 54, column: 11)
!252 = !DILocation(line: 53, column: 16, scope: !248, inlinedAt: !241)
!253 = !DILocation(line: 53, column: 35, scope: !248, inlinedAt: !241)
!254 = !DILocation(line: 53, column: 7, scope: !248, inlinedAt: !241)
!255 = !DILocation(line: 54, column: 19, scope: !251, inlinedAt: !241)
!256 = !DILocation(line: 54, column: 24, scope: !251, inlinedAt: !241)
!257 = !DILocation(line: 54, column: 29, scope: !251, inlinedAt: !241)
!258 = !DILocation(line: 54, column: 11, scope: !248, inlinedAt: !241)
!259 = !DILocation(line: 54, column: 44, scope: !251, inlinedAt: !241)
!260 = !DILocation(line: 54, column: 35, scope: !251, inlinedAt: !241)
!261 = !DILocation(line: 52, column: 26, scope: !249, inlinedAt: !241)
!262 = !DILocation(line: 52, column: 19, scope: !249, inlinedAt: !241)
!263 = distinct !{!263, !244, !264}
!264 = !DILocation(line: 55, column: 5, scope: !245, inlinedAt: !241)
!265 = !DILocation(line: 51, column: 24, scope: !246, inlinedAt: !241)
!266 = !DILocation(line: 51, column: 17, scope: !246, inlinedAt: !241)
!267 = distinct !{!267, !242, !268}
!268 = !DILocation(line: 55, column: 5, scope: !243, inlinedAt: !241)
!269 = !DILocation(line: 56, column: 12, scope: !232, inlinedAt: !241)
!270 = !DILocation(line: 56, column: 3, scope: !232, inlinedAt: !241)
!271 = !DILocation(line: 138, column: 23, scope: !229)
!272 = !DILocation(line: 141, column: 3, scope: !22)
!273 = !DILocation(line: 142, column: 3, scope: !22)
!274 = !DILocation(line: 143, column: 3, scope: !22)
!275 = !DILocation(line: 144, column: 3, scope: !22)
!276 = !DILocation(line: 145, column: 3, scope: !22)
!277 = !DILocation(line: 147, column: 3, scope: !22)
!278 = distinct !DISubprogram(name: ".omp_outlined.", scope: !1, file: !1, line: 77, type: !279, scopeLine: 77, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !289)
!279 = !DISubroutineType(types: !280)
!280 = !{null, !281, !281, !285, !285, !286, !286, !287, !285, !288, !286, !286, !287, !286, !286, !287, !285, !286, !286, !287, !288, !286, !286, !287}
!281 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !282)
!282 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !283)
!283 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !284, size: 64)
!284 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!285 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !14, size: 64)
!286 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!287 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !102, size: 64)
!288 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !6, size: 64)
!289 = !{!290, !291, !292, !293, !294, !295, !296, !297, !298, !299, !300, !301, !302, !303, !304, !305, !306, !307, !308, !309, !310, !311, !312}
!290 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !278, type: !281, flags: DIFlagArtificial)
!291 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !278, type: !281, flags: DIFlagArtificial)
!292 = !DILocalVariable(name: "ni", arg: 3, scope: !278, type: !285, flags: DIFlagArtificial)
!293 = !DILocalVariable(name: "nj", arg: 4, scope: !278, type: !285, flags: DIFlagArtificial)
!294 = !DILocalVariable(name: "vla", arg: 5, scope: !278, type: !286, flags: DIFlagArtificial)
!295 = !DILocalVariable(name: "vla", arg: 6, scope: !278, type: !286, flags: DIFlagArtificial)
!296 = !DILocalVariable(name: "tmp", arg: 7, scope: !278, type: !287, flags: DIFlagArtificial)
!297 = !DILocalVariable(name: "nk", arg: 8, scope: !278, type: !285, flags: DIFlagArtificial)
!298 = !DILocalVariable(name: "alpha", arg: 9, scope: !278, type: !288, flags: DIFlagArtificial)
!299 = !DILocalVariable(name: "vla", arg: 10, scope: !278, type: !286, flags: DIFlagArtificial)
!300 = !DILocalVariable(name: "vla", arg: 11, scope: !278, type: !286, flags: DIFlagArtificial)
!301 = !DILocalVariable(name: "A", arg: 12, scope: !278, type: !287, flags: DIFlagArtificial)
!302 = !DILocalVariable(name: "vla", arg: 13, scope: !278, type: !286, flags: DIFlagArtificial)
!303 = !DILocalVariable(name: "vla", arg: 14, scope: !278, type: !286, flags: DIFlagArtificial)
!304 = !DILocalVariable(name: "B", arg: 15, scope: !278, type: !287, flags: DIFlagArtificial)
!305 = !DILocalVariable(name: "nl", arg: 16, scope: !278, type: !285, flags: DIFlagArtificial)
!306 = !DILocalVariable(name: "vla", arg: 17, scope: !278, type: !286, flags: DIFlagArtificial)
!307 = !DILocalVariable(name: "vla", arg: 18, scope: !278, type: !286, flags: DIFlagArtificial)
!308 = !DILocalVariable(name: "D", arg: 19, scope: !278, type: !287, flags: DIFlagArtificial)
!309 = !DILocalVariable(name: "beta", arg: 20, scope: !278, type: !288, flags: DIFlagArtificial)
!310 = !DILocalVariable(name: "vla", arg: 21, scope: !278, type: !286, flags: DIFlagArtificial)
!311 = !DILocalVariable(name: "vla", arg: 22, scope: !278, type: !286, flags: DIFlagArtificial)
!312 = !DILocalVariable(name: "C", arg: 23, scope: !278, type: !287, flags: DIFlagArtificial)
!313 = !DILocation(line: 0, scope: !278)
!314 = !{!315}
!315 = distinct !{!315, !316, !".omp_outlined._debug__: %.global_tid."}
!316 = distinct !{!316, !".omp_outlined._debug__"}
!317 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !318, type: !281, flags: DIFlagArtificial)
!318 = distinct !DISubprogram(name: ".omp_outlined._debug__", scope: !1, file: !1, line: 77, type: !279, scopeLine: 77, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !319)
!319 = !{!317, !320, !321, !322, !323, !324, !325, !326, !327, !328, !329, !330, !331, !332, !333, !334, !335, !336, !337, !338, !339, !340, !341, !342, !345, !345, !346, !347, !348, !349, !350, !351, !352, !346, !353, !355, !355, !356, !357, !358, !359, !360, !361, !362, !356}
!320 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !318, type: !281, flags: DIFlagArtificial)
!321 = !DILocalVariable(name: "ni", arg: 3, scope: !318, file: !1, line: 63, type: !285)
!322 = !DILocalVariable(name: "nj", arg: 4, scope: !318, file: !1, line: 63, type: !285)
!323 = !DILocalVariable(name: "vla", arg: 5, scope: !318, type: !286, flags: DIFlagArtificial)
!324 = !DILocalVariable(name: "vla", arg: 6, scope: !318, type: !286, flags: DIFlagArtificial)
!325 = !DILocalVariable(name: "tmp", arg: 7, scope: !318, file: !1, line: 66, type: !287)
!326 = !DILocalVariable(name: "nk", arg: 8, scope: !318, file: !1, line: 63, type: !285)
!327 = !DILocalVariable(name: "alpha", arg: 9, scope: !318, file: !1, line: 64, type: !288)
!328 = !DILocalVariable(name: "vla", arg: 10, scope: !318, type: !286, flags: DIFlagArtificial)
!329 = !DILocalVariable(name: "vla", arg: 11, scope: !318, type: !286, flags: DIFlagArtificial)
!330 = !DILocalVariable(name: "A", arg: 12, scope: !318, file: !1, line: 67, type: !287)
!331 = !DILocalVariable(name: "vla", arg: 13, scope: !318, type: !286, flags: DIFlagArtificial)
!332 = !DILocalVariable(name: "vla", arg: 14, scope: !318, type: !286, flags: DIFlagArtificial)
!333 = !DILocalVariable(name: "B", arg: 15, scope: !318, file: !1, line: 68, type: !287)
!334 = !DILocalVariable(name: "nl", arg: 16, scope: !318, file: !1, line: 63, type: !285)
!335 = !DILocalVariable(name: "vla", arg: 17, scope: !318, type: !286, flags: DIFlagArtificial)
!336 = !DILocalVariable(name: "vla", arg: 18, scope: !318, type: !286, flags: DIFlagArtificial)
!337 = !DILocalVariable(name: "D", arg: 19, scope: !318, file: !1, line: 70, type: !287)
!338 = !DILocalVariable(name: "beta", arg: 20, scope: !318, file: !1, line: 65, type: !288)
!339 = !DILocalVariable(name: "vla", arg: 21, scope: !318, type: !286, flags: DIFlagArtificial)
!340 = !DILocalVariable(name: "vla", arg: 22, scope: !318, type: !286, flags: DIFlagArtificial)
!341 = !DILocalVariable(name: "C", arg: 23, scope: !318, file: !1, line: 69, type: !287)
!342 = !DILocalVariable(name: ".omp.iv", scope: !343, type: !14, flags: DIFlagArtificial)
!343 = distinct !DILexicalBlock(scope: !344, file: !1, line: 78, column: 3)
!344 = distinct !DILexicalBlock(scope: !318, file: !1, line: 77, column: 3)
!345 = !DILocalVariable(name: ".capture_expr.", scope: !343, type: !14, flags: DIFlagArtificial)
!346 = !DILocalVariable(name: "i", scope: !343, type: !14, flags: DIFlagArtificial)
!347 = !DILocalVariable(name: ".omp.lb", scope: !343, type: !14, flags: DIFlagArtificial)
!348 = !DILocalVariable(name: ".omp.ub", scope: !343, type: !14, flags: DIFlagArtificial)
!349 = !DILocalVariable(name: ".omp.stride", scope: !343, type: !14, flags: DIFlagArtificial)
!350 = !DILocalVariable(name: ".omp.is_last", scope: !343, type: !14, flags: DIFlagArtificial)
!351 = !DILocalVariable(name: "j", scope: !343, type: !14, flags: DIFlagArtificial)
!352 = !DILocalVariable(name: "k", scope: !343, type: !14, flags: DIFlagArtificial)
!353 = !DILocalVariable(name: ".omp.iv", scope: !354, type: !14, flags: DIFlagArtificial)
!354 = distinct !DILexicalBlock(scope: !344, file: !1, line: 86, column: 3)
!355 = !DILocalVariable(name: ".capture_expr.", scope: !354, type: !14, flags: DIFlagArtificial)
!356 = !DILocalVariable(name: "i", scope: !354, type: !14, flags: DIFlagArtificial)
!357 = !DILocalVariable(name: ".omp.lb", scope: !354, type: !14, flags: DIFlagArtificial)
!358 = !DILocalVariable(name: ".omp.ub", scope: !354, type: !14, flags: DIFlagArtificial)
!359 = !DILocalVariable(name: ".omp.stride", scope: !354, type: !14, flags: DIFlagArtificial)
!360 = !DILocalVariable(name: ".omp.is_last", scope: !354, type: !14, flags: DIFlagArtificial)
!361 = !DILocalVariable(name: "j", scope: !354, type: !14, flags: DIFlagArtificial)
!362 = !DILocalVariable(name: "k", scope: !354, type: !14, flags: DIFlagArtificial)
!363 = !DILocation(line: 0, scope: !318, inlinedAt: !364)
!364 = distinct !DILocation(line: 77, column: 3, scope: !278)
!365 = !DILocation(line: 79, column: 19, scope: !343, inlinedAt: !364)
!366 = !DILocation(line: 0, scope: !343, inlinedAt: !364)
!367 = !DILocation(line: 79, column: 3, scope: !343, inlinedAt: !364)
!368 = !DILocation(line: 78, column: 3, scope: !344, inlinedAt: !364)
!369 = !DILocation(line: 78, column: 33, scope: !343, inlinedAt: !364)
!370 = !DILocation(line: 79, column: 8, scope: !343, inlinedAt: !364)
!371 = !DILocation(line: 0, scope: !372, inlinedAt: !364)
!372 = distinct !DILexicalBlock(scope: !373, file: !1, line: 80, column: 5)
!373 = distinct !DILexicalBlock(scope: !343, file: !1, line: 80, column: 5)
!374 = !DILocation(line: 0, scope: !375, inlinedAt: !364)
!375 = distinct !DILexicalBlock(scope: !372, file: !1, line: 81, column: 5)
!376 = !DILocation(line: 0, scope: !377, inlinedAt: !364)
!377 = distinct !DILexicalBlock(scope: !378, file: !1, line: 83, column: 7)
!378 = distinct !DILexicalBlock(scope: !375, file: !1, line: 83, column: 7)
!379 = !DILocation(line: 80, column: 5, scope: !373, inlinedAt: !364)
!380 = !DILocation(line: 82, column: 7, scope: !375, inlinedAt: !364)
!381 = !DILocation(line: 82, column: 17, scope: !375, inlinedAt: !364)
!382 = !DILocation(line: 83, column: 7, scope: !378, inlinedAt: !364)
!383 = !DILocation(line: 84, column: 19, scope: !377, inlinedAt: !364)
!384 = !DILocation(line: 84, column: 22, scope: !377, inlinedAt: !364)
!385 = !DILocation(line: 84, column: 30, scope: !377, inlinedAt: !364)
!386 = !DILocation(line: 84, column: 28, scope: !377, inlinedAt: !364)
!387 = !DILocation(line: 84, column: 40, scope: !377, inlinedAt: !364)
!388 = !DILocation(line: 84, column: 38, scope: !377, inlinedAt: !364)
!389 = !DILocation(line: 83, column: 27, scope: !377, inlinedAt: !364)
!390 = !DILocation(line: 83, column: 21, scope: !377, inlinedAt: !364)
!391 = distinct !{!391, !382, !392}
!392 = !DILocation(line: 84, column: 46, scope: !378, inlinedAt: !364)
!393 = !DILocation(line: 80, column: 26, scope: !372, inlinedAt: !364)
!394 = !DILocation(line: 80, column: 19, scope: !372, inlinedAt: !364)
!395 = distinct !{!395, !379, !396}
!396 = !DILocation(line: 85, column: 5, scope: !373, inlinedAt: !364)
!397 = distinct !{!397, !398, !369}
!398 = !DILocation(line: 78, column: 3, scope: !343, inlinedAt: !364)
!399 = !DILocation(line: 87, column: 19, scope: !354, inlinedAt: !364)
!400 = !DILocation(line: 0, scope: !354, inlinedAt: !364)
!401 = !DILocation(line: 87, column: 3, scope: !354, inlinedAt: !364)
!402 = !DILocation(line: 86, column: 3, scope: !344, inlinedAt: !364)
!403 = !DILocation(line: 87, column: 8, scope: !354, inlinedAt: !364)
!404 = !DILocation(line: 0, scope: !405, inlinedAt: !364)
!405 = distinct !DILexicalBlock(scope: !406, file: !1, line: 88, column: 5)
!406 = distinct !DILexicalBlock(scope: !354, file: !1, line: 88, column: 5)
!407 = !DILocation(line: 0, scope: !408, inlinedAt: !364)
!408 = distinct !DILexicalBlock(scope: !405, file: !1, line: 89, column: 5)
!409 = !DILocation(line: 0, scope: !410, inlinedAt: !364)
!410 = distinct !DILexicalBlock(scope: !411, file: !1, line: 91, column: 7)
!411 = distinct !DILexicalBlock(scope: !408, file: !1, line: 91, column: 7)
!412 = !DILocation(line: 88, column: 5, scope: !406, inlinedAt: !364)
!413 = !DILocation(line: 90, column: 18, scope: !408, inlinedAt: !364)
!414 = !DILocation(line: 90, column: 7, scope: !408, inlinedAt: !364)
!415 = !DILocation(line: 90, column: 15, scope: !408, inlinedAt: !364)
!416 = !DILocation(line: 91, column: 7, scope: !411, inlinedAt: !364)
!417 = !DILocation(line: 92, column: 17, scope: !410, inlinedAt: !364)
!418 = !DILocation(line: 92, column: 20, scope: !410, inlinedAt: !364)
!419 = !DILocation(line: 92, column: 32, scope: !410, inlinedAt: !364)
!420 = !DILocation(line: 92, column: 30, scope: !410, inlinedAt: !364)
!421 = !DILocation(line: 91, column: 27, scope: !410, inlinedAt: !364)
!422 = !DILocation(line: 91, column: 21, scope: !410, inlinedAt: !364)
!423 = distinct !{!423, !416, !424}
!424 = !DILocation(line: 92, column: 38, scope: !411, inlinedAt: !364)
!425 = !DILocation(line: 88, column: 26, scope: !405, inlinedAt: !364)
!426 = !DILocation(line: 88, column: 19, scope: !405, inlinedAt: !364)
!427 = distinct !{!427, !412, !428}
!428 = !DILocation(line: 93, column: 5, scope: !406, inlinedAt: !364)
!429 = distinct !{!429, !430, !431}
!430 = !DILocation(line: 86, column: 3, scope: !354, inlinedAt: !364)
!431 = !DILocation(line: 86, column: 33, scope: !354, inlinedAt: !364)
!432 = !DILocation(line: 94, column: 3, scope: !318, inlinedAt: !364)
!433 = !DILocation(line: 77, column: 3, scope: !278)
!434 = !{!435}
!435 = !{i64 2, i64 -1, i64 -1, i1 true}
