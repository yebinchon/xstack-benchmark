; ModuleID = 'amicable-pairs.ll'
source_filename = "amicable-pairs.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%u %u\0A\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"\0ATop %u count : %u\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !7 {
entry:
  %pows = alloca [32 x i32], align 16
  call void @llvm.dbg.value(metadata i32 %argc, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i8** %argv, metadata !16, metadata !DIExpression()), !dbg !15
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !17
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !17
  %call = call i32 @atoi(i8* %0) #6, !dbg !18
  call void @llvm.dbg.value(metadata i32 %call, metadata !19, metadata !DIExpression()), !dbg !15
  %add = add i32 %call, 1, !dbg !22
  %conv = zext i32 %add to i64, !dbg !23
  %mul = mul i64 %conv, 4, !dbg !24
  %call1 = call noalias i8* @malloc(i64 %mul) #7, !dbg !25
  %1 = bitcast i8* %call1 to i32*, !dbg !25
  call void @llvm.dbg.value(metadata i32* %1, metadata !26, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata [32 x i32]* %pows, metadata !28, metadata !DIExpression()), !dbg !32
  %2 = bitcast [32 x i32]* %pows to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 128, i1 false), !dbg !32
  %3 = bitcast i8* %2 to <{ i32, [31 x i32] }>*, !dbg !32
  %4 = getelementptr inbounds <{ i32, [31 x i32] }>, <{ i32, [31 x i32] }>* %3, i32 0, i32 0, !dbg !32
  store i32 1, i32* %4, align 16, !dbg !32
  call void @llvm.dbg.value(metadata i32 0, metadata !33, metadata !DIExpression()), !dbg !35
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !35
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !33, metadata !DIExpression()), !dbg !35
  %cmp = icmp ule i32 %i.0, %call, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %idxprom = zext i32 %i.0 to i64, !dbg !40
  %arrayidx3 = getelementptr inbounds i32, i32* %1, i64 %idxprom, !dbg !40
  store i32 1, i32* %arrayidx3, align 4, !dbg !41
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !42
  call void @llvm.dbg.value(metadata i32 %inc, metadata !33, metadata !DIExpression()), !dbg !35
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 2, metadata !46, metadata !DIExpression()), !dbg !48
  br label %for.cond4, !dbg !49

for.cond4:                                        ; preds = %for.inc62, %for.end
  %p.0 = phi i32 [ 2, %for.end ], [ %inc63, %for.inc62 ], !dbg !48
  call void @llvm.dbg.value(metadata i32 %p.0, metadata !46, metadata !DIExpression()), !dbg !48
  %add5 = add i32 %p.0, %p.0, !dbg !50
  %cmp6 = icmp ule i32 %add5, %call, !dbg !52
  br i1 %cmp6, label %for.body8, label %for.end64, !dbg !53

for.body8:                                        ; preds = %for.cond4
  %idxprom9 = zext i32 %p.0 to i64, !dbg !54
  %arrayidx10 = getelementptr inbounds i32, i32* %1, i64 %idxprom9, !dbg !54
  %5 = load i32, i32* %arrayidx10, align 4, !dbg !54
  %cmp11 = icmp ugt i32 %5, 1, !dbg !57
  br i1 %cmp11, label %if.then, label %if.end, !dbg !58

if.then:                                          ; preds = %for.body8
  %idxprom13 = zext i32 %p.0 to i64, !dbg !59
  %arrayidx14 = getelementptr inbounds i32, i32* %1, i64 %idxprom13, !dbg !59
  %6 = load i32, i32* %arrayidx14, align 4, !dbg !61
  %sub = sub i32 %6, %p.0, !dbg !61
  store i32 %sub, i32* %arrayidx14, align 4, !dbg !61
  br label %for.inc62, !dbg !62

if.end:                                           ; preds = %for.body8
  call void @llvm.dbg.value(metadata i32 1, metadata !63, metadata !DIExpression()), !dbg !64
  br label %for.cond15, !dbg !65

for.cond15:                                       ; preds = %for.inc28, %if.end
  %x.0 = phi i32 [ 1, %if.end ], [ %inc29, %for.inc28 ], !dbg !67
  call void @llvm.dbg.value(metadata i32 %x.0, metadata !63, metadata !DIExpression()), !dbg !64
  %sub16 = sub i32 %x.0, 1, !dbg !68
  %idxprom17 = zext i32 %sub16 to i64, !dbg !70
  %arrayidx18 = getelementptr inbounds [32 x i32], [32 x i32]* %pows, i64 0, i64 %idxprom17, !dbg !70
  %7 = load i32, i32* %arrayidx18, align 4, !dbg !70
  %div = udiv i32 %call, %p.0, !dbg !71
  %cmp19 = icmp ule i32 %7, %div, !dbg !72
  br i1 %cmp19, label %for.body21, label %for.end30, !dbg !73

for.body21:                                       ; preds = %for.cond15
  %sub22 = sub i32 %x.0, 1, !dbg !74
  %idxprom23 = zext i32 %sub22 to i64, !dbg !75
  %arrayidx24 = getelementptr inbounds [32 x i32], [32 x i32]* %pows, i64 0, i64 %idxprom23, !dbg !75
  %8 = load i32, i32* %arrayidx24, align 4, !dbg !75
  %mul25 = mul i32 %p.0, %8, !dbg !76
  %idxprom26 = zext i32 %x.0 to i64, !dbg !77
  %arrayidx27 = getelementptr inbounds [32 x i32], [32 x i32]* %pows, i64 0, i64 %idxprom26, !dbg !77
  store i32 %mul25, i32* %arrayidx27, align 4, !dbg !78
  br label %for.inc28, !dbg !77

for.inc28:                                        ; preds = %for.body21
  %inc29 = add i32 %x.0, 1, !dbg !79
  call void @llvm.dbg.value(metadata i32 %inc29, metadata !63, metadata !DIExpression()), !dbg !64
  br label %for.cond15, !dbg !80, !llvm.loop !81

for.end30:                                        ; preds = %for.cond15
  %sub31 = sub i32 %p.0, 1, !dbg !83
  call void @llvm.dbg.value(metadata i32 %sub31, metadata !84, metadata !DIExpression()), !dbg !64
  %add32 = add i32 %p.0, %p.0, !dbg !85
  call void @llvm.dbg.value(metadata i32 %add32, metadata !87, metadata !DIExpression()), !dbg !88
  br label %for.cond33, !dbg !89

for.cond33:                                       ; preds = %for.inc59, %for.end30
  %n.0 = phi i32 [ %add32, %for.end30 ], [ %add60, %for.inc59 ], !dbg !88
  %k.0 = phi i32 [ %sub31, %for.end30 ], [ %k.1, %for.inc59 ], !dbg !64
  call void @llvm.dbg.value(metadata i32 %k.0, metadata !84, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !87, metadata !DIExpression()), !dbg !88
  %cmp34 = icmp ule i32 %n.0, %call, !dbg !90
  br i1 %cmp34, label %for.body36, label %for.end61, !dbg !92

for.body36:                                       ; preds = %for.cond33
  %arrayidx37 = getelementptr inbounds [32 x i32], [32 x i32]* %pows, i64 0, i64 1, !dbg !93
  %9 = load i32, i32* %arrayidx37, align 4, !dbg !93
  %add38 = add i32 1, %9, !dbg !95
  call void @llvm.dbg.value(metadata i32 %add38, metadata !96, metadata !DIExpression()), !dbg !97
  %dec = add i32 %k.0, -1, !dbg !98
  call void @llvm.dbg.value(metadata i32 %dec, metadata !84, metadata !DIExpression()), !dbg !64
  %cmp39 = icmp eq i32 %dec, 0, !dbg !99
  br i1 %cmp39, label %if.then41, label %if.end55, !dbg !101

if.then41:                                        ; preds = %for.body36
  call void @llvm.dbg.value(metadata i32 2, metadata !102, metadata !DIExpression()), !dbg !105
  br label %for.cond43, !dbg !106

for.cond43:                                       ; preds = %for.inc49, %if.then41
  %s.0 = phi i32 [ %add38, %if.then41 ], [ %add53, %for.inc49 ], !dbg !97
  %i42.0 = phi i32 [ 2, %if.then41 ], [ %inc50, %for.inc49 ], !dbg !105
  call void @llvm.dbg.value(metadata i32 %i42.0, metadata !102, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.value(metadata i32 %s.0, metadata !96, metadata !DIExpression()), !dbg !97
  %cmp44 = icmp ult i32 %i42.0, %x.0, !dbg !107
  br i1 %cmp44, label %land.rhs, label %land.end, !dbg !109

land.rhs:                                         ; preds = %for.cond43
  %idxprom46 = zext i32 %i42.0 to i64, !dbg !110
  %arrayidx47 = getelementptr inbounds [32 x i32], [32 x i32]* %pows, i64 0, i64 %idxprom46, !dbg !110
  %10 = load i32, i32* %arrayidx47, align 4, !dbg !110
  %rem = urem i32 %n.0, %10, !dbg !111
  %tobool = icmp ne i32 %rem, 0, !dbg !112
  %lnot = xor i1 %tobool, true, !dbg !112
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond43
  %11 = phi i1 [ false, %for.cond43 ], [ %lnot, %land.rhs ], !dbg !113
  br i1 %11, label %for.body48, label %for.end54, !dbg !114

for.body48:                                       ; preds = %land.end
  br label %for.inc49, !dbg !114

for.inc49:                                        ; preds = %for.body48
  %inc50 = add i32 %i42.0, 1, !dbg !115
  call void @llvm.dbg.value(metadata i32 %inc50, metadata !102, metadata !DIExpression()), !dbg !105
  %idxprom51 = zext i32 %i42.0 to i64, !dbg !116
  %arrayidx52 = getelementptr inbounds [32 x i32], [32 x i32]* %pows, i64 0, i64 %idxprom51, !dbg !116
  %12 = load i32, i32* %arrayidx52, align 4, !dbg !116
  %add53 = add i32 %s.0, %12, !dbg !117
  call void @llvm.dbg.value(metadata i32 %add53, metadata !96, metadata !DIExpression()), !dbg !97
  br label %for.cond43, !dbg !118, !llvm.loop !119

for.end54:                                        ; preds = %land.end
  call void @llvm.dbg.value(metadata i32 %p.0, metadata !84, metadata !DIExpression()), !dbg !64
  br label %if.end55, !dbg !121

if.end55:                                         ; preds = %for.end54, %for.body36
  %k.1 = phi i32 [ %p.0, %for.end54 ], [ %dec, %for.body36 ], !dbg !97
  %s.1 = phi i32 [ %s.0, %for.end54 ], [ %add38, %for.body36 ], !dbg !122
  call void @llvm.dbg.value(metadata i32 %s.1, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.value(metadata i32 %k.1, metadata !84, metadata !DIExpression()), !dbg !64
  %idxprom56 = zext i32 %n.0 to i64, !dbg !123
  %arrayidx57 = getelementptr inbounds i32, i32* %1, i64 %idxprom56, !dbg !123
  %13 = load i32, i32* %arrayidx57, align 4, !dbg !124
  %mul58 = mul i32 %13, %s.1, !dbg !124
  store i32 %mul58, i32* %arrayidx57, align 4, !dbg !124
  br label %for.inc59, !dbg !125

for.inc59:                                        ; preds = %if.end55
  %add60 = add i32 %n.0, %p.0, !dbg !126
  call void @llvm.dbg.value(metadata i32 %add60, metadata !87, metadata !DIExpression()), !dbg !88
  br label %for.cond33, !dbg !127, !llvm.loop !128

for.end61:                                        ; preds = %for.cond33
  br label %for.inc62, !dbg !130

for.inc62:                                        ; preds = %for.end61, %if.then
  %inc63 = add i32 %p.0, 1, !dbg !131
  call void @llvm.dbg.value(metadata i32 %inc63, metadata !46, metadata !DIExpression()), !dbg !48
  br label %for.cond4, !dbg !132, !llvm.loop !133

for.end64:                                        ; preds = %for.cond4
  %shr = lshr i32 %call, 1, !dbg !135
  %add66 = add i32 %shr, 1, !dbg !137
  call void @llvm.dbg.value(metadata i32 %add66, metadata !138, metadata !DIExpression()), !dbg !139
  br label %for.cond67, !dbg !140

for.cond67:                                       ; preds = %for.inc80, %for.end64
  %p65.0 = phi i32 [ %add66, %for.end64 ], [ %inc81, %for.inc80 ], !dbg !139
  call void @llvm.dbg.value(metadata i32 %p65.0, metadata !138, metadata !DIExpression()), !dbg !139
  %cmp68 = icmp ule i32 %p65.0, %call, !dbg !141
  br i1 %cmp68, label %for.body70, label %for.end82, !dbg !143

for.body70:                                       ; preds = %for.cond67
  %idxprom71 = zext i32 %p65.0 to i64, !dbg !144
  %arrayidx72 = getelementptr inbounds i32, i32* %1, i64 %idxprom71, !dbg !144
  %14 = load i32, i32* %arrayidx72, align 4, !dbg !144
  %cmp73 = icmp ugt i32 %14, 1, !dbg !147
  br i1 %cmp73, label %if.then75, label %if.end79, !dbg !148

if.then75:                                        ; preds = %for.body70
  %idxprom76 = zext i32 %p65.0 to i64, !dbg !149
  %arrayidx77 = getelementptr inbounds i32, i32* %1, i64 %idxprom76, !dbg !149
  %15 = load i32, i32* %arrayidx77, align 4, !dbg !151
  %sub78 = sub i32 %15, %p65.0, !dbg !151
  store i32 %sub78, i32* %arrayidx77, align 4, !dbg !151
  br label %if.end79, !dbg !152

if.end79:                                         ; preds = %if.then75, %for.body70
  br label %for.inc80, !dbg !153

for.inc80:                                        ; preds = %if.end79
  %inc81 = add i32 %p65.0, 1, !dbg !154
  call void @llvm.dbg.value(metadata i32 %inc81, metadata !138, metadata !DIExpression()), !dbg !139
  br label %for.cond67, !dbg !155, !llvm.loop !156

for.end82:                                        ; preds = %for.cond67
  call void @llvm.dbg.value(metadata i32 0, metadata !158, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 1, metadata !159, metadata !DIExpression()), !dbg !161
  br label %for.cond83, !dbg !162

for.cond83:                                       ; preds = %for.inc102, %for.end82
  %cnt.0 = phi i32 [ 0, %for.end82 ], [ %cnt.1, %for.inc102 ], !dbg !15
  %a.0 = phi i32 [ 1, %for.end82 ], [ %inc103, %for.inc102 ], !dbg !161
  call void @llvm.dbg.value(metadata i32 %a.0, metadata !159, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.value(metadata i32 %cnt.0, metadata !158, metadata !DIExpression()), !dbg !15
  %cmp84 = icmp ule i32 %a.0, %call, !dbg !163
  br i1 %cmp84, label %for.body86, label %for.end104, !dbg !165

for.body86:                                       ; preds = %for.cond83
  %idxprom87 = zext i32 %a.0 to i64, !dbg !166
  %arrayidx88 = getelementptr inbounds i32, i32* %1, i64 %idxprom87, !dbg !166
  %16 = load i32, i32* %arrayidx88, align 4, !dbg !166
  call void @llvm.dbg.value(metadata i32 %16, metadata !168, metadata !DIExpression()), !dbg !169
  %cmp89 = icmp ugt i32 %16, %a.0, !dbg !170
  br i1 %cmp89, label %land.lhs.true, label %if.end101, !dbg !172

land.lhs.true:                                    ; preds = %for.body86
  %cmp91 = icmp ule i32 %16, %call, !dbg !173
  br i1 %cmp91, label %land.lhs.true93, label %if.end101, !dbg !174

land.lhs.true93:                                  ; preds = %land.lhs.true
  %idxprom94 = zext i32 %16 to i64, !dbg !175
  %arrayidx95 = getelementptr inbounds i32, i32* %1, i64 %idxprom94, !dbg !175
  %17 = load i32, i32* %arrayidx95, align 4, !dbg !175
  %cmp96 = icmp eq i32 %17, %a.0, !dbg !176
  br i1 %cmp96, label %if.then98, label %if.end101, !dbg !177

if.then98:                                        ; preds = %land.lhs.true93
  %call99 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 %a.0, i32 %16), !dbg !178
  %inc100 = add i32 %cnt.0, 1, !dbg !180
  call void @llvm.dbg.value(metadata i32 %inc100, metadata !158, metadata !DIExpression()), !dbg !15
  br label %if.end101, !dbg !181

if.end101:                                        ; preds = %if.then98, %land.lhs.true93, %land.lhs.true, %for.body86
  %cnt.1 = phi i32 [ %inc100, %if.then98 ], [ %cnt.0, %land.lhs.true93 ], [ %cnt.0, %land.lhs.true ], [ %cnt.0, %for.body86 ], !dbg !15
  call void @llvm.dbg.value(metadata i32 %cnt.1, metadata !158, metadata !DIExpression()), !dbg !15
  br label %for.inc102, !dbg !182

for.inc102:                                       ; preds = %if.end101
  %inc103 = add i32 %a.0, 1, !dbg !183
  call void @llvm.dbg.value(metadata i32 %inc103, metadata !159, metadata !DIExpression()), !dbg !161
  br label %for.cond83, !dbg !184, !llvm.loop !185

for.end104:                                       ; preds = %for.cond83
  %call105 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.1, i64 0, i64 0), i32 %call, i32 %cnt.0), !dbg !187
  ret i32 0, !dbg !188
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local i32 @printf(i8*, ...) #5

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "amicable-pairs.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Amicable-pairs")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !8, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "argc", arg: 1, scope: !7, file: !1, line: 6, type: !10)
!15 = !DILocation(line: 0, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 6, type: !11)
!17 = !DILocation(line: 8, column: 19, scope: !7)
!18 = !DILocation(line: 8, column: 14, scope: !7)
!19 = !DILocalVariable(name: "top", scope: !7, file: !1, line: 8, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint", file: !1, line: 4, baseType: !21)
!21 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!22 = !DILocation(line: 9, column: 30, scope: !7)
!23 = !DILocation(line: 9, column: 25, scope: !7)
!24 = !DILocation(line: 9, column: 35, scope: !7)
!25 = !DILocation(line: 9, column: 18, scope: !7)
!26 = !DILocalVariable(name: "divsum", scope: !7, file: !1, line: 9, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!28 = !DILocalVariable(name: "pows", scope: !7, file: !1, line: 10, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 1024, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 32)
!32 = !DILocation(line: 10, column: 8, scope: !7)
!33 = !DILocalVariable(name: "i", scope: !34, file: !1, line: 12, type: !20)
!34 = distinct !DILexicalBlock(scope: !7, file: !1, line: 12, column: 3)
!35 = !DILocation(line: 0, scope: !34)
!36 = !DILocation(line: 12, column: 8, scope: !34)
!37 = !DILocation(line: 12, column: 22, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !1, line: 12, column: 3)
!39 = !DILocation(line: 12, column: 3, scope: !34)
!40 = !DILocation(line: 12, column: 35, scope: !38)
!41 = !DILocation(line: 12, column: 45, scope: !38)
!42 = !DILocation(line: 12, column: 31, scope: !38)
!43 = !DILocation(line: 12, column: 3, scope: !38)
!44 = distinct !{!44, !39, !45}
!45 = !DILocation(line: 12, column: 47, scope: !34)
!46 = !DILocalVariable(name: "p", scope: !47, file: !1, line: 16, type: !20)
!47 = distinct !DILexicalBlock(scope: !7, file: !1, line: 16, column: 3)
!48 = !DILocation(line: 0, scope: !47)
!49 = !DILocation(line: 16, column: 8, scope: !47)
!50 = !DILocation(line: 16, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 16, column: 3)
!52 = !DILocation(line: 16, column: 24, scope: !51)
!53 = !DILocation(line: 16, column: 3, scope: !47)
!54 = !DILocation(line: 17, column: 9, scope: !55)
!55 = distinct !DILexicalBlock(scope: !56, file: !1, line: 17, column: 9)
!56 = distinct !DILexicalBlock(scope: !51, file: !1, line: 16, column: 37)
!57 = !DILocation(line: 17, column: 19, scope: !55)
!58 = !DILocation(line: 17, column: 9, scope: !56)
!59 = !DILocation(line: 18, column: 7, scope: !60)
!60 = distinct !DILexicalBlock(scope: !55, file: !1, line: 17, column: 24)
!61 = !DILocation(line: 18, column: 17, scope: !60)
!62 = !DILocation(line: 19, column: 7, scope: !60)
!63 = !DILocalVariable(name: "x", scope: !56, file: !1, line: 21, type: !20)
!64 = !DILocation(line: 0, scope: !56)
!65 = !DILocation(line: 23, column: 10, scope: !66)
!66 = distinct !DILexicalBlock(scope: !56, file: !1, line: 23, column: 5)
!67 = !DILocation(line: 0, scope: !66)
!68 = !DILocation(line: 23, column: 24, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !1, line: 23, column: 5)
!70 = !DILocation(line: 23, column: 17, scope: !69)
!71 = !DILocation(line: 23, column: 35, scope: !69)
!72 = !DILocation(line: 23, column: 29, scope: !69)
!73 = !DILocation(line: 23, column: 5, scope: !66)
!74 = !DILocation(line: 24, column: 26, scope: !69)
!75 = !DILocation(line: 24, column: 19, scope: !69)
!76 = !DILocation(line: 24, column: 18, scope: !69)
!77 = !DILocation(line: 24, column: 7, scope: !69)
!78 = !DILocation(line: 24, column: 15, scope: !69)
!79 = !DILocation(line: 23, column: 40, scope: !69)
!80 = !DILocation(line: 23, column: 5, scope: !69)
!81 = distinct !{!81, !73, !82}
!82 = !DILocation(line: 24, column: 29, scope: !66)
!83 = !DILocation(line: 29, column: 14, scope: !56)
!84 = !DILocalVariable(name: "k", scope: !56, file: !1, line: 29, type: !20)
!85 = !DILocation(line: 30, column: 20, scope: !86)
!86 = distinct !DILexicalBlock(scope: !56, file: !1, line: 30, column: 5)
!87 = !DILocalVariable(name: "n", scope: !86, file: !1, line: 30, type: !20)
!88 = !DILocation(line: 0, scope: !86)
!89 = !DILocation(line: 30, column: 10, scope: !86)
!90 = !DILocation(line: 30, column: 26, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !1, line: 30, column: 5)
!92 = !DILocation(line: 30, column: 5, scope: !86)
!93 = !DILocation(line: 31, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !1, line: 30, column: 42)
!95 = !DILocation(line: 31, column: 15, scope: !94)
!96 = !DILocalVariable(name: "s", scope: !94, file: !1, line: 31, type: !20)
!97 = !DILocation(line: 0, scope: !94)
!98 = !DILocation(line: 32, column: 8, scope: !94)
!99 = !DILocation(line: 34, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !1, line: 34, column: 12)
!101 = !DILocation(line: 34, column: 12, scope: !94)
!102 = !DILocalVariable(name: "i", scope: !103, file: !1, line: 35, type: !20)
!103 = distinct !DILexicalBlock(scope: !104, file: !1, line: 35, column: 9)
!104 = distinct !DILexicalBlock(scope: !100, file: !1, line: 34, column: 18)
!105 = !DILocation(line: 0, scope: !103)
!106 = !DILocation(line: 35, column: 14, scope: !103)
!107 = !DILocation(line: 35, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !103, file: !1, line: 35, column: 9)
!109 = !DILocation(line: 35, column: 32, scope: !108)
!110 = !DILocation(line: 35, column: 39, scope: !108)
!111 = !DILocation(line: 35, column: 38, scope: !108)
!112 = !DILocation(line: 35, column: 35, scope: !108)
!113 = !DILocation(line: 0, scope: !108)
!114 = !DILocation(line: 35, column: 9, scope: !103)
!115 = !DILocation(line: 35, column: 60, scope: !108)
!116 = !DILocation(line: 35, column: 54, scope: !108)
!117 = !DILocation(line: 35, column: 51, scope: !108)
!118 = !DILocation(line: 35, column: 9, scope: !108)
!119 = distinct !{!119, !114, !120}
!120 = !DILocation(line: 35, column: 64, scope: !103)
!121 = !DILocation(line: 36, column: 16, scope: !104)
!122 = !DILocation(line: 31, column: 12, scope: !94)
!123 = !DILocation(line: 37, column: 7, scope: !94)
!124 = !DILocation(line: 37, column: 17, scope: !94)
!125 = !DILocation(line: 38, column: 5, scope: !94)
!126 = !DILocation(line: 30, column: 36, scope: !91)
!127 = !DILocation(line: 30, column: 5, scope: !91)
!128 = distinct !{!128, !92, !129}
!129 = !DILocation(line: 38, column: 5, scope: !86)
!130 = !DILocation(line: 39, column: 3, scope: !56)
!131 = !DILocation(line: 16, column: 33, scope: !51)
!132 = !DILocation(line: 16, column: 3, scope: !51)
!133 = distinct !{!133, !53, !134}
!134 = !DILocation(line: 39, column: 3, scope: !47)
!135 = !DILocation(line: 42, column: 22, scope: !136)
!136 = distinct !DILexicalBlock(scope: !7, file: !1, line: 42, column: 3)
!137 = !DILocation(line: 42, column: 27, scope: !136)
!138 = !DILocalVariable(name: "p", scope: !136, file: !1, line: 42, type: !20)
!139 = !DILocation(line: 0, scope: !136)
!140 = !DILocation(line: 42, column: 8, scope: !136)
!141 = !DILocation(line: 42, column: 33, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !1, line: 42, column: 3)
!143 = !DILocation(line: 42, column: 3, scope: !136)
!144 = !DILocation(line: 43, column: 9, scope: !145)
!145 = distinct !DILexicalBlock(scope: !146, file: !1, line: 43, column: 9)
!146 = distinct !DILexicalBlock(scope: !142, file: !1, line: 42, column: 46)
!147 = !DILocation(line: 43, column: 19, scope: !145)
!148 = !DILocation(line: 43, column: 9, scope: !146)
!149 = !DILocation(line: 44, column: 7, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !1, line: 43, column: 23)
!151 = !DILocation(line: 44, column: 17, scope: !150)
!152 = !DILocation(line: 44, column: 22, scope: !150)
!153 = !DILocation(line: 45, column: 3, scope: !146)
!154 = !DILocation(line: 42, column: 42, scope: !142)
!155 = !DILocation(line: 42, column: 3, scope: !142)
!156 = distinct !{!156, !143, !157}
!157 = !DILocation(line: 45, column: 3, scope: !136)
!158 = !DILocalVariable(name: "cnt", scope: !7, file: !1, line: 47, type: !20)
!159 = !DILocalVariable(name: "a", scope: !160, file: !1, line: 48, type: !20)
!160 = distinct !DILexicalBlock(scope: !7, file: !1, line: 48, column: 3)
!161 = !DILocation(line: 0, scope: !160)
!162 = !DILocation(line: 48, column: 8, scope: !160)
!163 = !DILocation(line: 48, column: 22, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !1, line: 48, column: 3)
!165 = !DILocation(line: 48, column: 3, scope: !160)
!166 = !DILocation(line: 49, column: 14, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !1, line: 48, column: 35)
!168 = !DILocalVariable(name: "b", scope: !167, file: !1, line: 49, type: !20)
!169 = !DILocation(line: 0, scope: !167)
!170 = !DILocation(line: 50, column: 11, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !1, line: 50, column: 9)
!172 = !DILocation(line: 50, column: 15, scope: !171)
!173 = !DILocation(line: 50, column: 20, scope: !171)
!174 = !DILocation(line: 50, column: 27, scope: !171)
!175 = !DILocation(line: 50, column: 30, scope: !171)
!176 = !DILocation(line: 50, column: 40, scope: !171)
!177 = !DILocation(line: 50, column: 9, scope: !167)
!178 = !DILocation(line: 51, column: 7, scope: !179)
!179 = distinct !DILexicalBlock(scope: !171, file: !1, line: 50, column: 45)
!180 = !DILocation(line: 52, column: 10, scope: !179)
!181 = !DILocation(line: 52, column: 13, scope: !179)
!182 = !DILocation(line: 53, column: 3, scope: !167)
!183 = !DILocation(line: 48, column: 31, scope: !164)
!184 = !DILocation(line: 48, column: 3, scope: !164)
!185 = distinct !{!185, !165, !186}
!186 = !DILocation(line: 53, column: 3, scope: !160)
!187 = !DILocation(line: 54, column: 3, scope: !7)
!188 = !DILocation(line: 55, column: 3, scope: !7)
