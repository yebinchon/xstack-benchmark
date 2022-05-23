; ModuleID = 'benchmark.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 !dbg !22 {
entry:
  call void @llvm.dbg.value(metadata i32 %argc, metadata !26, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.value(metadata i8** %argv, metadata !27, metadata !DIExpression()), !dbg !40
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !41
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !41, !tbaa !42
  call void @llvm.dbg.value(metadata i8* %0, metadata !46, metadata !DIExpression()) #5, !dbg !53
  %call.i = tail call i64 @strtol(i8* nocapture nonnull %0, i8** null, i32 10) #5, !dbg !55
  %conv.i = trunc i64 %call.i to i32, !dbg !56
  call void @llvm.dbg.value(metadata i32 %conv.i, metadata !28, metadata !DIExpression()), !dbg !40
  %arrayidx1 = getelementptr inbounds i8*, i8** %argv, i64 2, !dbg !57
  %1 = load i8*, i8** %arrayidx1, align 8, !dbg !57, !tbaa !42
  call void @llvm.dbg.value(metadata i8* %1, metadata !46, metadata !DIExpression()) #5, !dbg !58
  %call.i243 = tail call i64 @strtol(i8* nocapture nonnull %1, i8** null, i32 10) #5, !dbg !60
  %conv.i244 = trunc i64 %call.i243 to i32, !dbg !61
  call void @llvm.dbg.value(metadata i32 %conv.i244, metadata !29, metadata !DIExpression()), !dbg !40
  %arrayidx3 = getelementptr inbounds i8*, i8** %argv, i64 3, !dbg !62
  %2 = load i8*, i8** %arrayidx3, align 8, !dbg !62, !tbaa !42
  call void @llvm.dbg.value(metadata i8* %2, metadata !46, metadata !DIExpression()) #5, !dbg !63
  %call.i245 = tail call i64 @strtol(i8* nocapture nonnull %2, i8** null, i32 10) #5, !dbg !65
  %conv.i246 = trunc i64 %call.i245 to i32, !dbg !66
  call void @llvm.dbg.value(metadata i32 %conv.i246, metadata !30, metadata !DIExpression()), !dbg !40
  %arrayidx5 = getelementptr inbounds i8*, i8** %argv, i64 4, !dbg !67
  %3 = load i8*, i8** %arrayidx5, align 8, !dbg !67, !tbaa !42
  call void @llvm.dbg.value(metadata i8* %3, metadata !46, metadata !DIExpression()) #5, !dbg !68
  %call.i247 = tail call i64 @strtol(i8* nocapture nonnull %3, i8** null, i32 10) #5, !dbg !70
  %conv.i248 = trunc i64 %call.i247 to i32, !dbg !71
  call void @llvm.dbg.value(metadata i32 %conv.i248, metadata !31, metadata !DIExpression()), !dbg !40
  %4 = and i64 %call.i245, 4294967295, !dbg !72
  %mul = shl i64 %call.i243, 32, !dbg !73
  %sext = mul i64 %mul, %call.i245, !dbg !74
  %mul7 = ashr exact i64 %sext, 29, !dbg !75
  %call8 = tail call noalias i8* @malloc(i64 %mul7) #5, !dbg !76
  %5 = bitcast i8* %call8 to double*, !dbg !77
  call void @llvm.dbg.value(metadata double* %5, metadata !34, metadata !DIExpression()), !dbg !40
  %6 = and i64 %call.i247, 4294967295, !dbg !78
  %sext249 = mul i64 %mul, %call.i247, !dbg !79
  %mul11 = ashr exact i64 %sext249, 29, !dbg !80
  %call12 = tail call noalias i8* @malloc(i64 %mul11) #5, !dbg !81
  %7 = bitcast i8* %call12 to double*, !dbg !82
  call void @llvm.dbg.value(metadata double* %7, metadata !35, metadata !DIExpression()), !dbg !40
  %mul13 = shl i64 %call.i245, 32, !dbg !83
  %sext250 = mul i64 %mul13, %call.i247, !dbg !84
  %mul15 = ashr exact i64 %sext250, 29, !dbg !85
  %call16 = tail call noalias i8* @malloc(i64 %mul15) #5, !dbg !86
  %8 = bitcast i8* %call16 to double*, !dbg !87
  call void @llvm.dbg.value(metadata double* %8, metadata !36, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.value(metadata double 3.241200e+04, metadata !32, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.value(metadata double 2.123000e+03, metadata !33, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.value(metadata i32 0, metadata !37, metadata !DIExpression()), !dbg !40
  %cmp275 = icmp sgt i32 %conv.i244, 0, !dbg !88
  br i1 %cmp275, label %for.cond18.preheader.lr.ph, label %for.cond55.preheader, !dbg !91

for.cond18.preheader.lr.ph:                       ; preds = %entry
  %cmp19273 = icmp sgt i32 %conv.i246, 0, !dbg !92
  %conv25 = sitofp i32 %conv.i244 to double, !dbg !92
  %wide.trip.count316 = and i64 %call.i243, 4294967295, !dbg !88
  %wide.trip.count312 = and i64 %call.i245, 4294967295, !dbg !92
  br label %for.cond18.preheader, !dbg !91

for.cond18.preheader:                             ; preds = %for.inc29, %for.cond18.preheader.lr.ph
  %indvars.iv314 = phi i64 [ 0, %for.cond18.preheader.lr.ph ], [ %indvars.iv.next315, %for.inc29 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv314, metadata !37, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.value(metadata i32 0, metadata !38, metadata !DIExpression()), !dbg !40
  br i1 %cmp19273, label %for.body21.lr.ph, label %for.inc29, !dbg !95

for.body21.lr.ph:                                 ; preds = %for.cond18.preheader
  %9 = trunc i64 %indvars.iv314 to i32, !dbg !92
  %conv22 = sitofp i32 %9 to double, !dbg !92
  %10 = mul nuw nsw i64 %4, %indvars.iv314, !dbg !92
  %arrayidx26 = getelementptr inbounds double, double* %5, i64 %10, !dbg !92
  br label %for.body21, !dbg !95

for.cond32.preheader:                             ; preds = %for.inc29
  call void @llvm.dbg.value(metadata i32 0, metadata !37, metadata !DIExpression()), !dbg !40
  br i1 %cmp275, label %for.cond36.preheader.lr.ph, label %for.cond55.preheader, !dbg !96

for.cond36.preheader.lr.ph:                       ; preds = %for.cond32.preheader
  %cmp37268 = icmp sgt i32 %conv.i248, 0, !dbg !98
  %conv43 = sitofp i32 %conv.i244 to double, !dbg !98
  %wide.trip.count308 = and i64 %call.i243, 4294967295, !dbg !102
  %wide.trip.count304 = and i64 %call.i247, 4294967295, !dbg !98
  br label %for.cond36.preheader, !dbg !96

for.body21:                                       ; preds = %for.body21, %for.body21.lr.ph
  %indvars.iv310 = phi i64 [ 0, %for.body21.lr.ph ], [ %indvars.iv.next311, %for.body21 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv310, metadata !38, metadata !DIExpression()), !dbg !40
  %11 = trunc i64 %indvars.iv310 to i32, !dbg !103
  %conv23 = sitofp i32 %11 to double, !dbg !103
  %mul24 = fmul double %conv22, %conv23, !dbg !104
  %div = fdiv double %mul24, %conv25, !dbg !105
  %arrayidx28 = getelementptr inbounds double, double* %arrayidx26, i64 %indvars.iv310, !dbg !106
  store double %div, double* %arrayidx28, align 8, !dbg !107, !tbaa !108
  %indvars.iv.next311 = add nuw nsw i64 %indvars.iv310, 1, !dbg !110
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next311, metadata !38, metadata !DIExpression()), !dbg !40
  %exitcond313 = icmp eq i64 %indvars.iv.next311, %wide.trip.count312, !dbg !111
  br i1 %exitcond313, label %for.inc29.loopexit, label %for.body21, !dbg !95, !llvm.loop !112

for.inc29.loopexit:                               ; preds = %for.body21
  br label %for.inc29, !dbg !114

for.inc29:                                        ; preds = %for.inc29.loopexit, %for.cond18.preheader
  %indvars.iv.next315 = add nuw nsw i64 %indvars.iv314, 1, !dbg !114
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next315, metadata !37, metadata !DIExpression()), !dbg !40
  %exitcond317 = icmp eq i64 %indvars.iv.next315, %wide.trip.count316, !dbg !88
  br i1 %exitcond317, label %for.cond32.preheader, label %for.cond18.preheader, !dbg !91, !llvm.loop !115

for.cond36.preheader:                             ; preds = %for.inc52, %for.cond36.preheader.lr.ph
  %indvars.iv306 = phi i64 [ 0, %for.cond36.preheader.lr.ph ], [ %indvars.iv.next307, %for.inc52 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv306, metadata !37, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.value(metadata i32 0, metadata !38, metadata !DIExpression()), !dbg !40
  br i1 %cmp37268, label %for.body39.lr.ph, label %for.inc52, !dbg !117

for.body39.lr.ph:                                 ; preds = %for.cond36.preheader
  %12 = trunc i64 %indvars.iv306 to i32, !dbg !98
  %conv40 = sitofp i32 %12 to double, !dbg !98
  %13 = mul nuw nsw i64 %6, %indvars.iv306, !dbg !98
  %arrayidx46 = getelementptr inbounds double, double* %7, i64 %13, !dbg !98
  br label %for.body39, !dbg !117

for.cond55.preheader.loopexit:                    ; preds = %for.inc52
  br label %for.cond55.preheader, !dbg !118

for.cond55.preheader:                             ; preds = %for.cond55.preheader.loopexit, %for.cond32.preheader, %entry
  call void @llvm.dbg.value(metadata i32 0, metadata !37, metadata !DIExpression()), !dbg !40
  %cmp56265 = icmp sgt i32 %conv.i248, 0, !dbg !118
  br i1 %cmp56265, label %for.cond59.preheader.lr.ph, label %for.cond78.preheader, !dbg !121

for.cond59.preheader.lr.ph:                       ; preds = %for.cond55.preheader
  %cmp60263 = icmp sgt i32 %conv.i246, 0, !dbg !122
  %conv66 = sitofp i32 %conv.i244 to double, !dbg !122
  %wide.trip.count300 = and i64 %call.i247, 4294967295, !dbg !118
  %wide.trip.count296 = and i64 %call.i245, 4294967295, !dbg !122
  br label %for.cond59.preheader, !dbg !121

for.body39:                                       ; preds = %for.body39, %for.body39.lr.ph
  %indvars.iv302 = phi i64 [ 0, %for.body39.lr.ph ], [ %indvars.iv.next303, %for.body39 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv302, metadata !38, metadata !DIExpression()), !dbg !40
  %14 = trunc i64 %indvars.iv302 to i32, !dbg !125
  %conv41 = sitofp i32 %14 to double, !dbg !125
  %mul42 = fmul double %conv40, %conv41, !dbg !126
  %div44 = fdiv double %mul42, %conv43, !dbg !127
  %arrayidx48 = getelementptr inbounds double, double* %arrayidx46, i64 %indvars.iv302, !dbg !128
  store double %div44, double* %arrayidx48, align 8, !dbg !129, !tbaa !108
  %indvars.iv.next303 = add nuw nsw i64 %indvars.iv302, 1, !dbg !130
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next303, metadata !38, metadata !DIExpression()), !dbg !40
  %exitcond305 = icmp eq i64 %indvars.iv.next303, %wide.trip.count304, !dbg !131
  br i1 %exitcond305, label %for.inc52.loopexit, label %for.body39, !dbg !117, !llvm.loop !132

for.inc52.loopexit:                               ; preds = %for.body39
  br label %for.inc52, !dbg !134

for.inc52:                                        ; preds = %for.inc52.loopexit, %for.cond36.preheader
  %indvars.iv.next307 = add nuw nsw i64 %indvars.iv306, 1, !dbg !134
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next307, metadata !37, metadata !DIExpression()), !dbg !40
  %exitcond309 = icmp eq i64 %indvars.iv.next307, %wide.trip.count308, !dbg !102
  br i1 %exitcond309, label %for.cond55.preheader.loopexit, label %for.cond36.preheader, !dbg !96, !llvm.loop !135

for.cond59.preheader:                             ; preds = %for.inc75, %for.cond59.preheader.lr.ph
  %indvars.iv298 = phi i64 [ 0, %for.cond59.preheader.lr.ph ], [ %indvars.iv.next299, %for.inc75 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv298, metadata !37, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.value(metadata i32 0, metadata !38, metadata !DIExpression()), !dbg !40
  br i1 %cmp60263, label %for.body62.lr.ph, label %for.inc75, !dbg !137

for.body62.lr.ph:                                 ; preds = %for.cond59.preheader
  %15 = trunc i64 %indvars.iv298 to i32, !dbg !122
  %conv63 = sitofp i32 %15 to double, !dbg !122
  %16 = mul nuw nsw i64 %4, %indvars.iv298, !dbg !122
  %arrayidx69 = getelementptr inbounds double, double* %8, i64 %16, !dbg !122
  br label %for.body62, !dbg !137

for.cond78.preheader.loopexit:                    ; preds = %for.inc75
  br label %for.cond78.preheader, !dbg !138

for.cond78.preheader:                             ; preds = %for.cond78.preheader.loopexit, %for.cond55.preheader
  call void @llvm.dbg.value(metadata i32 0, metadata !37, metadata !DIExpression()), !dbg !40
  br i1 %cmp275, label %for.cond82.preheader.lr.ph, label %for.end117, !dbg !138

for.cond82.preheader.lr.ph:                       ; preds = %for.cond78.preheader
  %cmp83258 = icmp sgt i32 %conv.i246, 0, !dbg !140
  %wide.trip.count292 = and i64 %call.i243, 4294967295, !dbg !144
  %wide.trip.count288 = and i64 %call.i245, 4294967295, !dbg !140
  %wide.trip.count284 = and i64 %call.i247, 4294967295, !dbg !145
  br label %for.cond82.preheader, !dbg !138

for.body62:                                       ; preds = %for.body62, %for.body62.lr.ph
  %indvars.iv294 = phi i64 [ 0, %for.body62.lr.ph ], [ %indvars.iv.next295, %for.body62 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv294, metadata !38, metadata !DIExpression()), !dbg !40
  %17 = trunc i64 %indvars.iv294 to i32, !dbg !149
  %conv64 = sitofp i32 %17 to double, !dbg !149
  %mul65 = fmul double %conv63, %conv64, !dbg !150
  %div67 = fdiv double %mul65, %conv66, !dbg !151
  %arrayidx71 = getelementptr inbounds double, double* %arrayidx69, i64 %indvars.iv294, !dbg !152
  store double %div67, double* %arrayidx71, align 8, !dbg !153, !tbaa !108
  %indvars.iv.next295 = add nuw nsw i64 %indvars.iv294, 1, !dbg !154
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next295, metadata !38, metadata !DIExpression()), !dbg !40
  %exitcond297 = icmp eq i64 %indvars.iv.next295, %wide.trip.count296, !dbg !155
  br i1 %exitcond297, label %for.inc75.loopexit, label %for.body62, !dbg !137, !llvm.loop !156

for.inc75.loopexit:                               ; preds = %for.body62
  br label %for.inc75, !dbg !158

for.inc75:                                        ; preds = %for.inc75.loopexit, %for.cond59.preheader
  %indvars.iv.next299 = add nuw nsw i64 %indvars.iv298, 1, !dbg !158
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next299, metadata !37, metadata !DIExpression()), !dbg !40
  %exitcond301 = icmp eq i64 %indvars.iv.next299, %wide.trip.count300, !dbg !118
  br i1 %exitcond301, label %for.cond78.preheader.loopexit, label %for.cond59.preheader, !dbg !121, !llvm.loop !159

for.cond82.preheader:                             ; preds = %for.inc115, %for.cond82.preheader.lr.ph
  %indvars.iv290 = phi i64 [ 0, %for.cond82.preheader.lr.ph ], [ %indvars.iv.next291, %for.inc115 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv290, metadata !37, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.value(metadata i32 0, metadata !38, metadata !DIExpression()), !dbg !40
  br i1 %cmp83258, label %for.body85.lr.ph, label %for.inc115, !dbg !161

for.body85.lr.ph:                                 ; preds = %for.cond82.preheader
  %18 = mul nuw nsw i64 %4, %indvars.iv290, !dbg !162
  %arrayidx87 = getelementptr inbounds double, double* %5, i64 %18, !dbg !162
  %19 = mul nuw nsw i64 %6, %indvars.iv290, !dbg !145
  %arrayidx96 = getelementptr inbounds double, double* %7, i64 %19, !dbg !145
  br label %for.body85, !dbg !161

for.body85:                                       ; preds = %for.inc112, %for.body85.lr.ph
  %indvars.iv286 = phi i64 [ 0, %for.body85.lr.ph ], [ %indvars.iv.next287, %for.inc112 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv286, metadata !38, metadata !DIExpression()), !dbg !40
  %arrayidx89 = getelementptr inbounds double, double* %arrayidx87, i64 %indvars.iv286, !dbg !163
  %20 = load double, double* %arrayidx89, align 8, !dbg !164, !tbaa !108
  %mul90 = fmul double %20, 2.123000e+03, !dbg !164
  store double %mul90, double* %arrayidx89, align 8, !dbg !164, !tbaa !108
  call void @llvm.dbg.value(metadata i32 0, metadata !39, metadata !DIExpression()), !dbg !40
  br i1 %cmp56265, label %for.body94.lr.ph, label %for.inc112, !dbg !165

for.body94.lr.ph:                                 ; preds = %for.body85
  %arrayidx101 = getelementptr inbounds double, double* %8, i64 %indvars.iv286, !dbg !145
  br label %for.body94, !dbg !165

for.body94:                                       ; preds = %for.body94, %for.body94.lr.ph
  %indvars.iv282 = phi i64 [ 0, %for.body94.lr.ph ], [ %indvars.iv.next283, %for.body94 ], !dbg !40
  %21 = phi double [ %mul90, %for.body94.lr.ph ], [ %add, %for.body94 ], !dbg !40
  call void @llvm.dbg.value(metadata i64 %indvars.iv282, metadata !39, metadata !DIExpression()), !dbg !40
  %arrayidx98 = getelementptr inbounds double, double* %arrayidx96, i64 %indvars.iv282, !dbg !166
  %22 = load double, double* %arrayidx98, align 8, !dbg !166, !tbaa !108
  %mul99 = fmul double %22, 3.241200e+04, !dbg !167
  %23 = mul nuw nsw i64 %4, %indvars.iv282, !dbg !168
  %arrayidx103 = getelementptr inbounds double, double* %arrayidx101, i64 %23, !dbg !168
  %24 = load double, double* %arrayidx103, align 8, !dbg !168, !tbaa !108
  %mul104 = fmul double %mul99, %24, !dbg !169
  %add = fadd double %21, %mul104, !dbg !170
  %indvars.iv.next283 = add nuw nsw i64 %indvars.iv282, 1, !dbg !171
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next283, metadata !39, metadata !DIExpression()), !dbg !40
  %exitcond285 = icmp eq i64 %indvars.iv.next283, %wide.trip.count284, !dbg !172
  br i1 %exitcond285, label %for.cond91.for.inc112_crit_edge, label %for.body94, !dbg !165, !llvm.loop !173

for.cond91.for.inc112_crit_edge:                  ; preds = %for.body94
  store double %add, double* %arrayidx89, align 8, !dbg !170, !tbaa !108
  br label %for.inc112, !dbg !165

for.inc112:                                       ; preds = %for.cond91.for.inc112_crit_edge, %for.body85
  %indvars.iv.next287 = add nuw nsw i64 %indvars.iv286, 1, !dbg !175
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next287, metadata !38, metadata !DIExpression()), !dbg !40
  %exitcond289 = icmp eq i64 %indvars.iv.next287, %wide.trip.count288, !dbg !176
  br i1 %exitcond289, label %for.inc115.loopexit, label %for.body85, !dbg !161, !llvm.loop !177

for.inc115.loopexit:                              ; preds = %for.inc112
  br label %for.inc115, !dbg !179

for.inc115:                                       ; preds = %for.inc115.loopexit, %for.cond82.preheader
  %indvars.iv.next291 = add nuw nsw i64 %indvars.iv290, 1, !dbg !179
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next291, metadata !37, metadata !DIExpression()), !dbg !40
  %exitcond293 = icmp eq i64 %indvars.iv.next291, %wide.trip.count292, !dbg !144
  br i1 %exitcond293, label %for.end117.loopexit, label %for.cond82.preheader, !dbg !138, !llvm.loop !180

for.end117.loopexit:                              ; preds = %for.inc115
  br label %for.end117, !dbg !182

for.end117:                                       ; preds = %for.end117.loopexit, %for.cond78.preheader
  %cmp118 = icmp eq i32 %conv.i, 1, !dbg !182
  br i1 %cmp118, label %for.cond120.preheader, label %if.end146, !dbg !184

for.cond120.preheader:                            ; preds = %for.end117
  call void @llvm.dbg.value(metadata i32 0, metadata !37, metadata !DIExpression()), !dbg !40
  br i1 %cmp275, label %for.cond124.preheader.lr.ph, label %for.end144, !dbg !185

for.cond124.preheader.lr.ph:                      ; preds = %for.cond120.preheader
  %cmp125251 = icmp sgt i32 %conv.i246, 0, !dbg !188
  %wide.trip.count280 = and i64 %call.i243, 4294967295, !dbg !192
  %wide.trip.count = and i64 %call.i245, 4294967295, !dbg !188
  br label %for.cond124.preheader, !dbg !185

for.cond124.preheader:                            ; preds = %for.inc142, %for.cond124.preheader.lr.ph
  %indvars.iv278 = phi i64 [ 0, %for.cond124.preheader.lr.ph ], [ %indvars.iv.next279, %for.inc142 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv278, metadata !37, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.value(metadata i32 0, metadata !38, metadata !DIExpression()), !dbg !40
  br i1 %cmp125251, label %for.body127.lr.ph, label %for.inc142, !dbg !193

for.body127.lr.ph:                                ; preds = %for.cond124.preheader
  %25 = mul nuw nsw i64 %4, %indvars.iv278, !dbg !194
  %arrayidx129 = getelementptr inbounds double, double* %5, i64 %25, !dbg !194
  %26 = trunc i64 %indvars.iv278 to i32, !dbg !196
  %mul133 = mul nsw i32 %26, %conv.i244, !dbg !196
  br label %for.body127, !dbg !193

for.body127:                                      ; preds = %for.inc139, %for.body127.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body127.lr.ph ], [ %indvars.iv.next, %for.inc139 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !38, metadata !DIExpression()), !dbg !40
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !198, !tbaa !42
  %arrayidx131 = getelementptr inbounds double, double* %arrayidx129, i64 %indvars.iv, !dbg !199
  %28 = load double, double* %arrayidx131, align 8, !dbg !199, !tbaa !108
  %call132 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), double %28) #6, !dbg !200
  %29 = trunc i64 %indvars.iv to i32, !dbg !201
  %add134 = add nsw i32 %mul133, %29, !dbg !201
  %rem = srem i32 %add134, 20, !dbg !202
  %cmp135 = icmp eq i32 %rem, 0, !dbg !203
  br i1 %cmp135, label %if.then137, label %for.inc139, !dbg !204

if.then137:                                       ; preds = %for.body127
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !205, !tbaa !42
  %fputc242 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #6, !dbg !206
  br label %for.inc139, !dbg !206

for.inc139:                                       ; preds = %if.then137, %for.body127
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !207
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !38, metadata !DIExpression()), !dbg !40
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !208
  br i1 %exitcond, label %for.inc142.loopexit, label %for.body127, !dbg !193, !llvm.loop !209

for.inc142.loopexit:                              ; preds = %for.inc139
  br label %for.inc142, !dbg !211

for.inc142:                                       ; preds = %for.inc142.loopexit, %for.cond124.preheader
  %indvars.iv.next279 = add nuw nsw i64 %indvars.iv278, 1, !dbg !211
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next279, metadata !37, metadata !DIExpression()), !dbg !40
  %exitcond281 = icmp eq i64 %indvars.iv.next279, %wide.trip.count280, !dbg !192
  br i1 %exitcond281, label %for.end144.loopexit, label %for.cond124.preheader, !dbg !185, !llvm.loop !212

for.end144.loopexit:                              ; preds = %for.inc142
  br label %for.end144, !dbg !214

for.end144:                                       ; preds = %for.end144.loopexit, %for.cond120.preheader
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !214, !tbaa !42
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %31) #6, !dbg !215
  br label %if.end146, !dbg !216

if.end146:                                        ; preds = %for.end144, %for.end117
  tail call void @free(i8* %call8) #5, !dbg !217
  tail call void @free(i8* %call12) #5, !dbg !218
  tail call void @free(i8* %call16) #5, !dbg !219
  ret i32 0, !dbg !220
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nofree nounwind
declare dso_local i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare dso_local noalias i8* @malloc(i64) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare !dbg !10 dso_local void @free(i8* nocapture) local_unnamed_addr #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold }

!llvm.dbg.cu = !{!0}
!llvm.ident = !{!18}
!llvm.module.flags = !{!19, !20, !21}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "gemm.c", directory: "/u/zujunt/xstack/xstack-benchmark/polybench-inlined/gemm")
!2 = !{}
!3 = !{!4, !6, !9, !10, !14, !15}
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
!18 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 37, type: !23, scopeLine: 38, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !25)
!23 = !DISubroutineType(types: !24)
!24 = !{!14, !14, !15}
!25 = !{!26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39}
!26 = !DILocalVariable(name: "argc", arg: 1, scope: !22, file: !1, line: 37, type: !14)
!27 = !DILocalVariable(name: "argv", arg: 2, scope: !22, file: !1, line: 37, type: !15)
!28 = !DILocalVariable(name: "dump_code", scope: !22, file: !1, line: 40, type: !14)
!29 = !DILocalVariable(name: "ni", scope: !22, file: !1, line: 41, type: !14)
!30 = !DILocalVariable(name: "nj", scope: !22, file: !1, line: 42, type: !14)
!31 = !DILocalVariable(name: "nk", scope: !22, file: !1, line: 43, type: !14)
!32 = !DILocalVariable(name: "alpha", scope: !22, file: !1, line: 45, type: !6)
!33 = !DILocalVariable(name: "beta", scope: !22, file: !1, line: 46, type: !6)
!34 = !DILocalVariable(name: "C", scope: !22, file: !1, line: 47, type: !4)
!35 = !DILocalVariable(name: "A", scope: !22, file: !1, line: 48, type: !4)
!36 = !DILocalVariable(name: "B", scope: !22, file: !1, line: 49, type: !4)
!37 = !DILocalVariable(name: "i", scope: !22, file: !1, line: 52, type: !14)
!38 = !DILocalVariable(name: "j", scope: !22, file: !1, line: 52, type: !14)
!39 = !DILocalVariable(name: "k", scope: !22, file: !1, line: 52, type: !14)
!40 = !DILocation(line: 0, scope: !22)
!41 = !DILocation(line: 40, column: 24, scope: !22)
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
!54 = distinct !DILocation(line: 40, column: 19, scope: !22)
!55 = !DILocation(line: 363, column: 16, scope: !47, inlinedAt: !54)
!56 = !DILocation(line: 363, column: 10, scope: !47, inlinedAt: !54)
!57 = !DILocation(line: 41, column: 17, scope: !22)
!58 = !DILocation(line: 0, scope: !47, inlinedAt: !59)
!59 = distinct !DILocation(line: 41, column: 12, scope: !22)
!60 = !DILocation(line: 363, column: 16, scope: !47, inlinedAt: !59)
!61 = !DILocation(line: 363, column: 10, scope: !47, inlinedAt: !59)
!62 = !DILocation(line: 42, column: 17, scope: !22)
!63 = !DILocation(line: 0, scope: !47, inlinedAt: !64)
!64 = distinct !DILocation(line: 42, column: 12, scope: !22)
!65 = !DILocation(line: 363, column: 16, scope: !47, inlinedAt: !64)
!66 = !DILocation(line: 363, column: 10, scope: !47, inlinedAt: !64)
!67 = !DILocation(line: 43, column: 17, scope: !22)
!68 = !DILocation(line: 0, scope: !47, inlinedAt: !69)
!69 = distinct !DILocation(line: 43, column: 12, scope: !22)
!70 = !DILocation(line: 363, column: 16, scope: !47, inlinedAt: !69)
!71 = !DILocation(line: 363, column: 10, scope: !47, inlinedAt: !69)
!72 = !DILocation(line: 47, column: 3, scope: !22)
!73 = !DILocation(line: 47, column: 59, scope: !22)
!74 = !DILocation(line: 47, column: 54, scope: !22)
!75 = !DILocation(line: 47, column: 66, scope: !22)
!76 = !DILocation(line: 47, column: 47, scope: !22)
!77 = !DILocation(line: 47, column: 28, scope: !22)
!78 = !DILocation(line: 48, column: 3, scope: !22)
!79 = !DILocation(line: 48, column: 54, scope: !22)
!80 = !DILocation(line: 48, column: 66, scope: !22)
!81 = !DILocation(line: 48, column: 47, scope: !22)
!82 = !DILocation(line: 48, column: 28, scope: !22)
!83 = !DILocation(line: 49, column: 59, scope: !22)
!84 = !DILocation(line: 49, column: 54, scope: !22)
!85 = !DILocation(line: 49, column: 66, scope: !22)
!86 = !DILocation(line: 49, column: 47, scope: !22)
!87 = !DILocation(line: 49, column: 28, scope: !22)
!88 = !DILocation(line: 56, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !90, file: !1, line: 56, column: 3)
!90 = distinct !DILexicalBlock(scope: !22, file: !1, line: 56, column: 3)
!91 = !DILocation(line: 56, column: 3, scope: !90)
!92 = !DILocation(line: 0, scope: !93)
!93 = distinct !DILexicalBlock(scope: !94, file: !1, line: 57, column: 5)
!94 = distinct !DILexicalBlock(scope: !89, file: !1, line: 57, column: 5)
!95 = !DILocation(line: 57, column: 5, scope: !94)
!96 = !DILocation(line: 59, column: 3, scope: !97)
!97 = distinct !DILexicalBlock(scope: !22, file: !1, line: 59, column: 3)
!98 = !DILocation(line: 0, scope: !99)
!99 = distinct !DILexicalBlock(scope: !100, file: !1, line: 60, column: 5)
!100 = distinct !DILexicalBlock(scope: !101, file: !1, line: 60, column: 5)
!101 = distinct !DILexicalBlock(scope: !97, file: !1, line: 59, column: 3)
!102 = !DILocation(line: 59, column: 17, scope: !101)
!103 = !DILocation(line: 58, column: 32, scope: !93)
!104 = !DILocation(line: 58, column: 31, scope: !93)
!105 = !DILocation(line: 58, column: 35, scope: !93)
!106 = !DILocation(line: 58, column: 7, scope: !93)
!107 = !DILocation(line: 58, column: 18, scope: !93)
!108 = !{!109, !109, i64 0}
!109 = !{!"double", !44, i64 0}
!110 = !DILocation(line: 57, column: 26, scope: !93)
!111 = !DILocation(line: 57, column: 19, scope: !93)
!112 = distinct !{!112, !95, !113}
!113 = !DILocation(line: 58, column: 37, scope: !94)
!114 = !DILocation(line: 56, column: 24, scope: !89)
!115 = distinct !{!115, !91, !116}
!116 = !DILocation(line: 58, column: 37, scope: !90)
!117 = !DILocation(line: 60, column: 5, scope: !100)
!118 = !DILocation(line: 62, column: 17, scope: !119)
!119 = distinct !DILexicalBlock(scope: !120, file: !1, line: 62, column: 3)
!120 = distinct !DILexicalBlock(scope: !22, file: !1, line: 62, column: 3)
!121 = !DILocation(line: 62, column: 3, scope: !120)
!122 = !DILocation(line: 0, scope: !123)
!123 = distinct !DILexicalBlock(scope: !124, file: !1, line: 63, column: 5)
!124 = distinct !DILexicalBlock(scope: !119, file: !1, line: 63, column: 5)
!125 = !DILocation(line: 61, column: 32, scope: !99)
!126 = !DILocation(line: 61, column: 31, scope: !99)
!127 = !DILocation(line: 61, column: 35, scope: !99)
!128 = !DILocation(line: 61, column: 7, scope: !99)
!129 = !DILocation(line: 61, column: 18, scope: !99)
!130 = !DILocation(line: 60, column: 26, scope: !99)
!131 = !DILocation(line: 60, column: 19, scope: !99)
!132 = distinct !{!132, !117, !133}
!133 = !DILocation(line: 61, column: 37, scope: !100)
!134 = !DILocation(line: 59, column: 24, scope: !101)
!135 = distinct !{!135, !96, !136}
!136 = !DILocation(line: 61, column: 37, scope: !97)
!137 = !DILocation(line: 63, column: 5, scope: !124)
!138 = !DILocation(line: 67, column: 3, scope: !139)
!139 = distinct !DILexicalBlock(scope: !22, file: !1, line: 67, column: 3)
!140 = !DILocation(line: 0, scope: !141)
!141 = distinct !DILexicalBlock(scope: !142, file: !1, line: 68, column: 5)
!142 = distinct !DILexicalBlock(scope: !143, file: !1, line: 68, column: 5)
!143 = distinct !DILexicalBlock(scope: !139, file: !1, line: 67, column: 3)
!144 = !DILocation(line: 67, column: 17, scope: !143)
!145 = !DILocation(line: 0, scope: !146)
!146 = distinct !DILexicalBlock(scope: !147, file: !1, line: 71, column: 7)
!147 = distinct !DILexicalBlock(scope: !148, file: !1, line: 71, column: 7)
!148 = distinct !DILexicalBlock(scope: !141, file: !1, line: 69, column: 5)
!149 = !DILocation(line: 64, column: 32, scope: !123)
!150 = !DILocation(line: 64, column: 31, scope: !123)
!151 = !DILocation(line: 64, column: 35, scope: !123)
!152 = !DILocation(line: 64, column: 7, scope: !123)
!153 = !DILocation(line: 64, column: 18, scope: !123)
!154 = !DILocation(line: 63, column: 26, scope: !123)
!155 = !DILocation(line: 63, column: 19, scope: !123)
!156 = distinct !{!156, !137, !157}
!157 = !DILocation(line: 64, column: 37, scope: !124)
!158 = !DILocation(line: 62, column: 24, scope: !119)
!159 = distinct !{!159, !121, !160}
!160 = !DILocation(line: 64, column: 37, scope: !120)
!161 = !DILocation(line: 68, column: 5, scope: !142)
!162 = !DILocation(line: 0, scope: !148)
!163 = !DILocation(line: 70, column: 7, scope: !148)
!164 = !DILocation(line: 70, column: 18, scope: !148)
!165 = !DILocation(line: 71, column: 7, scope: !147)
!166 = !DILocation(line: 72, column: 31, scope: !146)
!167 = !DILocation(line: 72, column: 29, scope: !146)
!168 = !DILocation(line: 72, column: 44, scope: !146)
!169 = !DILocation(line: 72, column: 42, scope: !146)
!170 = !DILocation(line: 72, column: 20, scope: !146)
!171 = !DILocation(line: 71, column: 27, scope: !146)
!172 = !DILocation(line: 71, column: 21, scope: !146)
!173 = distinct !{!173, !165, !174}
!174 = !DILocation(line: 72, column: 53, scope: !147)
!175 = !DILocation(line: 68, column: 26, scope: !141)
!176 = !DILocation(line: 68, column: 19, scope: !141)
!177 = distinct !{!177, !161, !178}
!178 = !DILocation(line: 73, column: 5, scope: !142)
!179 = !DILocation(line: 67, column: 24, scope: !143)
!180 = distinct !{!180, !138, !181}
!181 = !DILocation(line: 73, column: 5, scope: !139)
!182 = !DILocation(line: 77, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !22, file: !1, line: 77, column: 7)
!184 = !DILocation(line: 77, column: 7, scope: !22)
!185 = !DILocation(line: 78, column: 3, scope: !186)
!186 = distinct !DILexicalBlock(scope: !187, file: !1, line: 78, column: 3)
!187 = distinct !DILexicalBlock(scope: !183, file: !1, line: 77, column: 22)
!188 = !DILocation(line: 0, scope: !189)
!189 = distinct !DILexicalBlock(scope: !190, file: !1, line: 79, column: 5)
!190 = distinct !DILexicalBlock(scope: !191, file: !1, line: 79, column: 5)
!191 = distinct !DILexicalBlock(scope: !186, file: !1, line: 78, column: 3)
!192 = !DILocation(line: 78, column: 17, scope: !191)
!193 = !DILocation(line: 79, column: 5, scope: !190)
!194 = !DILocation(line: 0, scope: !195)
!195 = distinct !DILexicalBlock(scope: !189, file: !1, line: 79, column: 30)
!196 = !DILocation(line: 0, scope: !197)
!197 = distinct !DILexicalBlock(scope: !195, file: !1, line: 81, column: 11)
!198 = !DILocation(line: 80, column: 16, scope: !195)
!199 = !DILocation(line: 80, column: 35, scope: !195)
!200 = !DILocation(line: 80, column: 7, scope: !195)
!201 = !DILocation(line: 81, column: 19, scope: !197)
!202 = !DILocation(line: 81, column: 24, scope: !197)
!203 = !DILocation(line: 81, column: 29, scope: !197)
!204 = !DILocation(line: 81, column: 11, scope: !195)
!205 = !DILocation(line: 81, column: 44, scope: !197)
!206 = !DILocation(line: 81, column: 35, scope: !197)
!207 = !DILocation(line: 79, column: 26, scope: !189)
!208 = !DILocation(line: 79, column: 19, scope: !189)
!209 = distinct !{!209, !193, !210}
!210 = !DILocation(line: 82, column: 5, scope: !190)
!211 = !DILocation(line: 78, column: 24, scope: !191)
!212 = distinct !{!212, !185, !213}
!213 = !DILocation(line: 82, column: 5, scope: !186)
!214 = !DILocation(line: 83, column: 12, scope: !187)
!215 = !DILocation(line: 83, column: 3, scope: !187)
!216 = !DILocation(line: 84, column: 3, scope: !187)
!217 = !DILocation(line: 86, column: 3, scope: !22)
!218 = !DILocation(line: 87, column: 3, scope: !22)
!219 = !DILocation(line: 88, column: 3, scope: !22)
!220 = !DILocation(line: 90, column: 3, scope: !22)
