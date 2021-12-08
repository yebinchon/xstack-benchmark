; ModuleID = 'bitcoin-public-point-to-address.ll'
source_filename = "bitcoin-public-point-to-address.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%2hhx\00", align 1
@base58.tmpl = internal global i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.1, i32 0, i32 0), align 8, !dbg !0
@.str.1 = private unnamed_addr constant [59 x i8] c"123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz\00", align 1
@base58.buf = internal global [40 x i8] zeroinitializer, align 16, !dbg !33
@.str.2 = private unnamed_addr constant [24 x i8] c"bad public point string\00", align 1
@coin_err = common dso_local global i8* null, align 8, !dbg !38
@.str.3 = private unnamed_addr constant [65 x i8] c"50863AD64A87AE8A2FE83C1AF1A8403CB53F53E486D8511DAD8A04887E5B2352\00", align 1
@.str.4 = private unnamed_addr constant [65 x i8] c"2CD470243453A299FA9E77237716103ABC11A1DF38855ED6F2EE187E9C582BA6\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_hex(i8* %s) #0 !dbg !47 {
entry:
  call void @llvm.dbg.value(metadata i8* %s, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i32 0, metadata !52, metadata !DIExpression()), !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !55
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !52, metadata !DIExpression()), !dbg !51
  %cmp = icmp slt i32 %i.0, 64, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %call = call i16** @__ctype_b_loc() #6, !dbg !59
  %0 = load i16*, i16** %call, align 8, !dbg !59
  %idxprom = sext i32 %i.0 to i64, !dbg !59
  %arrayidx = getelementptr inbounds i8, i8* %s, i64 %idxprom, !dbg !59
  %1 = load i8, i8* %arrayidx, align 1, !dbg !59
  %conv = sext i8 %1 to i32, !dbg !59
  %idxprom1 = sext i32 %conv to i64, !dbg !59
  %arrayidx2 = getelementptr inbounds i16, i16* %0, i64 %idxprom1, !dbg !59
  %2 = load i16, i16* %arrayidx2, align 2, !dbg !59
  %conv3 = zext i16 %2 to i32, !dbg !59
  %and = and i32 %conv3, 4096, !dbg !59
  %tobool = icmp ne i32 %and, 0, !dbg !59
  br i1 %tobool, label %if.end, label %if.then, !dbg !61

if.then:                                          ; preds = %for.body
  br label %return, !dbg !62

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1, !dbg !63
  call void @llvm.dbg.value(metadata i32 %inc, metadata !52, metadata !DIExpression()), !dbg !51
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  br label %return, !dbg !67

return:                                           ; preds = %for.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ 1, %for.end ], !dbg !51
  ret i32 %retval.0, !dbg !68
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readnone
declare dso_local i16** @__ctype_b_loc() #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_to_byte(i8* %src, i8* %dst, i32 %n) #0 !dbg !69 {
entry:
  call void @llvm.dbg.value(metadata i8* %src, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.value(metadata i8* %dst, metadata !74, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.value(metadata i32 %n, metadata !75, metadata !DIExpression()), !dbg !73
  br label %while.cond, !dbg !76

while.cond:                                       ; preds = %while.body, %entry
  %n.addr.0 = phi i32 [ %n, %entry ], [ %dec, %while.body ]
  call void @llvm.dbg.value(metadata i32 %n.addr.0, metadata !75, metadata !DIExpression()), !dbg !73
  %dec = add nsw i32 %n.addr.0, -1, !dbg !77
  call void @llvm.dbg.value(metadata i32 %dec, metadata !75, metadata !DIExpression()), !dbg !73
  %tobool = icmp ne i32 %n.addr.0, 0, !dbg !76
  br i1 %tobool, label %while.body, label %while.end, !dbg !76

while.body:                                       ; preds = %while.cond
  %mul = mul nsw i32 %dec, 2, !dbg !78
  %idx.ext = sext i32 %mul to i64, !dbg !79
  %add.ptr = getelementptr inbounds i8, i8* %src, i64 %idx.ext, !dbg !79
  %idx.ext1 = sext i32 %dec to i64, !dbg !80
  %add.ptr2 = getelementptr inbounds i8, i8* %dst, i64 %idx.ext1, !dbg !80
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %add.ptr, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i8* %add.ptr2) #7, !dbg !81
  br label %while.cond, !dbg !76, !llvm.loop !82

while.end:                                        ; preds = %while.cond
  ret void, !dbg !84
}

; Function Attrs: nounwind
declare dso_local i32 @__isoc99_sscanf(i8*, i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @base58(i8* %s, i8* %out) #0 !dbg !2 {
entry:
  call void @llvm.dbg.value(metadata i8* %s, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.value(metadata i8* %out, metadata !87, metadata !DIExpression()), !dbg !86
  %tobool = icmp ne i8* %out, null, !dbg !88
  br i1 %tobool, label %if.end, label %if.then, !dbg !90

if.then:                                          ; preds = %entry
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([40 x i8], [40 x i8]* @base58.buf, i64 0, i64 0), metadata !87, metadata !DIExpression()), !dbg !86
  br label %if.end, !dbg !91

if.end:                                           ; preds = %if.then, %entry
  %out.addr.0 = phi i8* [ %out, %entry ], [ getelementptr inbounds ([40 x i8], [40 x i8]* @base58.buf, i64 0, i64 0), %if.then ]
  call void @llvm.dbg.value(metadata i8* %out.addr.0, metadata !87, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.value(metadata i32 34, metadata !92, metadata !DIExpression()), !dbg !86
  %arrayidx = getelementptr inbounds i8, i8* %out.addr.0, i64 34, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  br label %while.cond, !dbg !95

while.cond:                                       ; preds = %for.end, %if.end
  %n.0 = phi i32 [ 34, %if.end ], [ %dec, %for.end ], !dbg !86
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !92, metadata !DIExpression()), !dbg !86
  %dec = add nsw i32 %n.0, -1, !dbg !96
  call void @llvm.dbg.value(metadata i32 %dec, metadata !92, metadata !DIExpression()), !dbg !86
  %tobool1 = icmp ne i32 %n.0, 0, !dbg !95
  br i1 %tobool1, label %while.body, label %while.end, !dbg !95

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !97, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.value(metadata i32 0, metadata !98, metadata !DIExpression()), !dbg !86
  br label %for.cond, !dbg !99

for.cond:                                         ; preds = %for.inc, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.inc ], !dbg !102
  %c.0 = phi i32 [ 0, %while.body ], [ %rem, %for.inc ], !dbg !102
  call void @llvm.dbg.value(metadata i32 %c.0, metadata !98, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !97, metadata !DIExpression()), !dbg !86
  %cmp = icmp slt i32 %i.0, 25, !dbg !103
  br i1 %cmp, label %for.body, label %for.end, !dbg !105

for.body:                                         ; preds = %for.cond
  %mul = mul nsw i32 %c.0, 256, !dbg !106
  %idxprom = sext i32 %i.0 to i64, !dbg !108
  %arrayidx2 = getelementptr inbounds i8, i8* %s, i64 %idxprom, !dbg !108
  %0 = load i8, i8* %arrayidx2, align 1, !dbg !108
  %conv = zext i8 %0 to i32, !dbg !108
  %add = add nsw i32 %mul, %conv, !dbg !109
  call void @llvm.dbg.value(metadata i32 %add, metadata !98, metadata !DIExpression()), !dbg !86
  %div = sdiv i32 %add, 58, !dbg !110
  %conv3 = trunc i32 %div to i8, !dbg !111
  %idxprom4 = sext i32 %i.0 to i64, !dbg !112
  %arrayidx5 = getelementptr inbounds i8, i8* %s, i64 %idxprom4, !dbg !112
  store i8 %conv3, i8* %arrayidx5, align 1, !dbg !113
  %rem = srem i32 %add, 58, !dbg !114
  call void @llvm.dbg.value(metadata i32 %rem, metadata !98, metadata !DIExpression()), !dbg !86
  br label %for.inc, !dbg !115

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !116
  call void @llvm.dbg.value(metadata i32 %inc, metadata !97, metadata !DIExpression()), !dbg !86
  br label %for.cond, !dbg !117, !llvm.loop !118

for.end:                                          ; preds = %for.cond
  %1 = load i8*, i8** @base58.tmpl, align 8, !dbg !120
  %idxprom6 = sext i32 %c.0 to i64, !dbg !120
  %arrayidx7 = getelementptr inbounds i8, i8* %1, i64 %idxprom6, !dbg !120
  %2 = load i8, i8* %arrayidx7, align 1, !dbg !120
  %idxprom8 = sext i32 %dec to i64, !dbg !121
  %arrayidx9 = getelementptr inbounds i8, i8* %out.addr.0, i64 %idxprom8, !dbg !121
  store i8 %2, i8* %arrayidx9, align 1, !dbg !122
  br label %while.cond, !dbg !95, !llvm.loop !123

while.end:                                        ; preds = %while.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression()), !dbg !86
  br label %for.cond10, !dbg !125

for.cond10:                                       ; preds = %for.inc17, %while.end
  %n.1 = phi i32 [ 0, %while.end ], [ %inc18, %for.inc17 ], !dbg !127
  call void @llvm.dbg.value(metadata i32 %n.1, metadata !92, metadata !DIExpression()), !dbg !86
  %idxprom11 = sext i32 %n.1 to i64, !dbg !128
  %arrayidx12 = getelementptr inbounds i8, i8* %out.addr.0, i64 %idxprom11, !dbg !128
  %3 = load i8, i8* %arrayidx12, align 1, !dbg !128
  %conv13 = sext i8 %3 to i32, !dbg !128
  %cmp14 = icmp eq i32 %conv13, 49, !dbg !130
  br i1 %cmp14, label %for.body16, label %for.end19, !dbg !131

for.body16:                                       ; preds = %for.cond10
  br label %for.inc17, !dbg !131

for.inc17:                                        ; preds = %for.body16
  %inc18 = add nsw i32 %n.1, 1, !dbg !132
  call void @llvm.dbg.value(metadata i32 %inc18, metadata !92, metadata !DIExpression()), !dbg !86
  br label %for.cond10, !dbg !133, !llvm.loop !134

for.end19:                                        ; preds = %for.cond10
  %idx.ext = sext i32 %n.1 to i64, !dbg !136
  %add.ptr = getelementptr inbounds i8, i8* %out.addr.0, i64 %idx.ext, !dbg !136
  %sub = sub nsw i32 34, %n.1, !dbg !137
  %conv20 = sext i32 %sub to i64, !dbg !138
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %out.addr.0, i8* align 1 %add.ptr, i64 %conv20, i1 false), !dbg !139
  ret i8* %out.addr.0, !dbg !140
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @coin_encode(i8* %x, i8* %y, i8* %out) #0 !dbg !141 {
entry:
  %s = alloca [65 x i8], align 16
  %rmd = alloca [25 x i8], align 16
  call void @llvm.dbg.value(metadata i8* %x, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.value(metadata i8* %y, metadata !146, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.value(metadata i8* %out, metadata !147, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata [65 x i8]* %s, metadata !148, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata [25 x i8]* %rmd, metadata !153, metadata !DIExpression()), !dbg !157
  %call = call i32 @is_hex(i8* %x), !dbg !158
  %tobool = icmp ne i32 %call, 0, !dbg !158
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !160

lor.lhs.false:                                    ; preds = %entry
  %call1 = call i32 @is_hex(i8* %y), !dbg !161
  %tobool2 = icmp ne i32 %call1, 0, !dbg !161
  br i1 %tobool2, label %if.end, label %if.then, !dbg !162

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0), i8** @coin_err, align 8, !dbg !163
  br label %return, !dbg !165

if.end:                                           ; preds = %lor.lhs.false
  %arrayidx = getelementptr inbounds [65 x i8], [65 x i8]* %s, i64 0, i64 0, !dbg !166
  store i8 4, i8* %arrayidx, align 16, !dbg !167
  %arraydecay = getelementptr inbounds [65 x i8], [65 x i8]* %s, i64 0, i64 0, !dbg !168
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay, i64 1, !dbg !169
  call void @str_to_byte(i8* %x, i8* %add.ptr, i32 32), !dbg !170
  %arraydecay3 = getelementptr inbounds [65 x i8], [65 x i8]* %s, i64 0, i64 0, !dbg !171
  %add.ptr4 = getelementptr inbounds i8, i8* %arraydecay3, i64 33, !dbg !172
  call void @str_to_byte(i8* %y, i8* %add.ptr4, i32 32), !dbg !173
  %arrayidx5 = getelementptr inbounds [25 x i8], [25 x i8]* %rmd, i64 0, i64 0, !dbg !174
  store i8 0, i8* %arrayidx5, align 16, !dbg !175
  %arraydecay6 = getelementptr inbounds [65 x i8], [65 x i8]* %s, i64 0, i64 0, !dbg !176
  %call7 = call i8* @SHA256(i8* %arraydecay6, i64 65, i8* null), !dbg !177
  %arraydecay8 = getelementptr inbounds [25 x i8], [25 x i8]* %rmd, i64 0, i64 0, !dbg !178
  %add.ptr9 = getelementptr inbounds i8, i8* %arraydecay8, i64 1, !dbg !179
  %call10 = call i8* @RIPEMD160(i8* %call7, i64 32, i8* %add.ptr9), !dbg !180
  %arraydecay11 = getelementptr inbounds [25 x i8], [25 x i8]* %rmd, i64 0, i64 0, !dbg !181
  %add.ptr12 = getelementptr inbounds i8, i8* %arraydecay11, i64 21, !dbg !182
  %arraydecay13 = getelementptr inbounds [25 x i8], [25 x i8]* %rmd, i64 0, i64 0, !dbg !183
  %call14 = call i8* @SHA256(i8* %arraydecay13, i64 21, i8* null), !dbg !184
  %call15 = call i8* @SHA256(i8* %call14, i64 32, i8* null), !dbg !185
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %add.ptr12, i8* align 1 %call15, i64 4, i1 false), !dbg !186
  %arraydecay16 = getelementptr inbounds [25 x i8], [25 x i8]* %rmd, i64 0, i64 0, !dbg !187
  %call17 = call i8* @base58(i8* %arraydecay16, i8* %out), !dbg !188
  br label %return, !dbg !189

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i8* [ %call17, %if.end ], [ null, %if.then ], !dbg !145
  ret i8* %retval.0, !dbg !190
}

declare dso_local i8* @RIPEMD160(i8*, i64, i8*) #5

declare dso_local i8* @SHA256(i8*, i64, i8*) #5

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !191 {
entry:
  %call = call i8* @coin_encode(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.4, i64 0, i64 0), i8* null), !dbg !194
  %call1 = call i32 @puts(i8* %call), !dbg !195
  ret i32 0, !dbg !196
}

declare dso_local i32 @puts(i8*) #5

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!11}
!llvm.module.flags = !{!43, !44, !45}
!llvm.ident = !{!46}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "tmpl", scope: !2, file: !3, line: 24, type: !40, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "base58", scope: !3, file: !3, line: 23, type: !4, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !11, retainedNodes: !42)
!3 = !DIFile(filename: "bitcoin-public-point-to-address.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Bitcoin-public-point-to-address")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !8, !6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "byte", file: !3, line: 10, baseType: !10)
!10 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!11 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !12, retainedTypes: !29, globals: !32, splitDebugInlining: false, nameTableKind: None)
!12 = !{!13}
!13 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !14, line: 46, baseType: !15, size: 32, elements: !16)
!14 = !DIFile(filename: "/usr/include/ctype.h", directory: "")
!15 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!16 = !{!17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28}
!17 = !DIEnumerator(name: "_ISupper", value: 256, isUnsigned: true)
!18 = !DIEnumerator(name: "_ISlower", value: 512, isUnsigned: true)
!19 = !DIEnumerator(name: "_ISalpha", value: 1024, isUnsigned: true)
!20 = !DIEnumerator(name: "_ISdigit", value: 2048, isUnsigned: true)
!21 = !DIEnumerator(name: "_ISxdigit", value: 4096, isUnsigned: true)
!22 = !DIEnumerator(name: "_ISspace", value: 8192, isUnsigned: true)
!23 = !DIEnumerator(name: "_ISprint", value: 16384, isUnsigned: true)
!24 = !DIEnumerator(name: "_ISgraph", value: 32768, isUnsigned: true)
!25 = !DIEnumerator(name: "_ISblank", value: 1, isUnsigned: true)
!26 = !DIEnumerator(name: "_IScntrl", value: 2, isUnsigned: true)
!27 = !DIEnumerator(name: "_ISpunct", value: 4, isUnsigned: true)
!28 = !DIEnumerator(name: "_ISalnum", value: 8, isUnsigned: true)
!29 = !{!30, !31}
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!32 = !{!0, !33, !38}
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 27, type: !35, isLocal: true, isDefinition: true)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 320, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 40)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(name: "coin_err", scope: !11, file: !3, line: 8, type: !40, isLocal: false, isDefinition: true)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!42 = !{}
!43 = !{i32 7, !"Dwarf Version", i32 4}
!44 = !{i32 2, !"Debug Info Version", i32 3}
!45 = !{i32 1, !"wchar_size", i32 4}
!46 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!47 = distinct !DISubprogram(name: "is_hex", scope: !3, file: !3, line: 12, type: !48, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !11, retainedNodes: !42)
!48 = !DISubroutineType(types: !49)
!49 = !{!30, !40}
!50 = !DILocalVariable(name: "s", arg: 1, scope: !47, file: !3, line: 12, type: !40)
!51 = !DILocation(line: 0, scope: !47)
!52 = !DILocalVariable(name: "i", scope: !47, file: !3, line: 13, type: !30)
!53 = !DILocation(line: 14, column: 7, scope: !54)
!54 = distinct !DILexicalBlock(scope: !47, file: !3, line: 14, column: 2)
!55 = !DILocation(line: 0, scope: !54)
!56 = !DILocation(line: 14, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !3, line: 14, column: 2)
!58 = !DILocation(line: 14, column: 2, scope: !54)
!59 = !DILocation(line: 15, column: 8, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !3, line: 15, column: 7)
!61 = !DILocation(line: 15, column: 7, scope: !57)
!62 = !DILocation(line: 15, column: 24, scope: !60)
!63 = !DILocation(line: 14, column: 23, scope: !57)
!64 = !DILocation(line: 14, column: 2, scope: !57)
!65 = distinct !{!65, !58, !66}
!66 = !DILocation(line: 15, column: 31, scope: !54)
!67 = !DILocation(line: 16, column: 2, scope: !47)
!68 = !DILocation(line: 17, column: 1, scope: !47)
!69 = distinct !DISubprogram(name: "str_to_byte", scope: !3, file: !3, line: 19, type: !70, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !11, retainedNodes: !42)
!70 = !DISubroutineType(types: !71)
!71 = !{null, !40, !8, !30}
!72 = !DILocalVariable(name: "src", arg: 1, scope: !69, file: !3, line: 19, type: !40)
!73 = !DILocation(line: 0, scope: !69)
!74 = !DILocalVariable(name: "dst", arg: 2, scope: !69, file: !3, line: 19, type: !8)
!75 = !DILocalVariable(name: "n", arg: 3, scope: !69, file: !3, line: 19, type: !30)
!76 = !DILocation(line: 20, column: 2, scope: !69)
!77 = !DILocation(line: 20, column: 10, scope: !69)
!78 = !DILocation(line: 20, column: 29, scope: !69)
!79 = !DILocation(line: 20, column: 25, scope: !69)
!80 = !DILocation(line: 20, column: 47, scope: !69)
!81 = !DILocation(line: 20, column: 14, scope: !69)
!82 = distinct !{!82, !76, !83}
!83 = !DILocation(line: 20, column: 50, scope: !69)
!84 = !DILocation(line: 21, column: 1, scope: !69)
!85 = !DILocalVariable(name: "s", arg: 1, scope: !2, file: !3, line: 23, type: !8)
!86 = !DILocation(line: 0, scope: !2)
!87 = !DILocalVariable(name: "out", arg: 2, scope: !2, file: !3, line: 23, type: !6)
!88 = !DILocation(line: 30, column: 7, scope: !89)
!89 = distinct !DILexicalBlock(scope: !2, file: !3, line: 30, column: 6)
!90 = !DILocation(line: 30, column: 6, scope: !2)
!91 = !DILocation(line: 30, column: 12, scope: !89)
!92 = !DILocalVariable(name: "n", scope: !2, file: !3, line: 29, type: !30)
!93 = !DILocation(line: 32, column: 2, scope: !2)
!94 = !DILocation(line: 32, column: 14, scope: !2)
!95 = !DILocation(line: 33, column: 2, scope: !2)
!96 = !DILocation(line: 33, column: 10, scope: !2)
!97 = !DILocalVariable(name: "i", scope: !2, file: !3, line: 29, type: !30)
!98 = !DILocalVariable(name: "c", scope: !2, file: !3, line: 29, type: !30)
!99 = !DILocation(line: 34, column: 8, scope: !100)
!100 = distinct !DILexicalBlock(scope: !101, file: !3, line: 34, column: 3)
!101 = distinct !DILexicalBlock(scope: !2, file: !3, line: 33, column: 14)
!102 = !DILocation(line: 0, scope: !100)
!103 = !DILocation(line: 34, column: 21, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !3, line: 34, column: 3)
!105 = !DILocation(line: 34, column: 3, scope: !100)
!106 = !DILocation(line: 35, column: 10, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !3, line: 34, column: 32)
!108 = !DILocation(line: 35, column: 18, scope: !107)
!109 = !DILocation(line: 35, column: 16, scope: !107)
!110 = !DILocation(line: 36, column: 13, scope: !107)
!111 = !DILocation(line: 36, column: 11, scope: !107)
!112 = !DILocation(line: 36, column: 4, scope: !107)
!113 = !DILocation(line: 36, column: 9, scope: !107)
!114 = !DILocation(line: 37, column: 6, scope: !107)
!115 = !DILocation(line: 38, column: 3, scope: !107)
!116 = !DILocation(line: 34, column: 28, scope: !104)
!117 = !DILocation(line: 34, column: 3, scope: !104)
!118 = distinct !{!118, !105, !119}
!119 = !DILocation(line: 38, column: 3, scope: !100)
!120 = !DILocation(line: 39, column: 12, scope: !101)
!121 = !DILocation(line: 39, column: 3, scope: !101)
!122 = !DILocation(line: 39, column: 10, scope: !101)
!123 = distinct !{!123, !95, !124}
!124 = !DILocation(line: 40, column: 2, scope: !2)
!125 = !DILocation(line: 42, column: 7, scope: !126)
!126 = distinct !DILexicalBlock(scope: !2, file: !3, line: 42, column: 2)
!127 = !DILocation(line: 0, scope: !126)
!128 = !DILocation(line: 42, column: 14, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !3, line: 42, column: 2)
!130 = !DILocation(line: 42, column: 21, scope: !129)
!131 = !DILocation(line: 42, column: 2, scope: !126)
!132 = !DILocation(line: 42, column: 30, scope: !129)
!133 = !DILocation(line: 42, column: 2, scope: !129)
!134 = distinct !{!134, !131, !135}
!135 = !DILocation(line: 42, column: 33, scope: !126)
!136 = !DILocation(line: 43, column: 19, scope: !2)
!137 = !DILocation(line: 43, column: 27, scope: !2)
!138 = !DILocation(line: 43, column: 24, scope: !2)
!139 = !DILocation(line: 43, column: 2, scope: !2)
!140 = !DILocation(line: 45, column: 2, scope: !2)
!141 = distinct !DISubprogram(name: "coin_encode", scope: !3, file: !3, line: 48, type: !142, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !11, retainedNodes: !42)
!142 = !DISubroutineType(types: !143)
!143 = !{!6, !40, !40, !6}
!144 = !DILocalVariable(name: "x", arg: 1, scope: !141, file: !3, line: 48, type: !40)
!145 = !DILocation(line: 0, scope: !141)
!146 = !DILocalVariable(name: "y", arg: 2, scope: !141, file: !3, line: 48, type: !40)
!147 = !DILocalVariable(name: "out", arg: 3, scope: !141, file: !3, line: 48, type: !6)
!148 = !DILocalVariable(name: "s", scope: !141, file: !3, line: 49, type: !149)
!149 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 520, elements: !150)
!150 = !{!151}
!151 = !DISubrange(count: 65)
!152 = !DILocation(line: 49, column: 7, scope: !141)
!153 = !DILocalVariable(name: "rmd", scope: !141, file: !3, line: 50, type: !154)
!154 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 200, elements: !155)
!155 = !{!156}
!156 = !DISubrange(count: 25)
!157 = !DILocation(line: 50, column: 7, scope: !141)
!158 = !DILocation(line: 52, column: 7, scope: !159)
!159 = distinct !DILexicalBlock(scope: !141, file: !3, line: 52, column: 6)
!160 = !DILocation(line: 52, column: 17, scope: !159)
!161 = !DILocation(line: 52, column: 22, scope: !159)
!162 = !DILocation(line: 52, column: 6, scope: !141)
!163 = !DILocation(line: 53, column: 12, scope: !164)
!164 = distinct !DILexicalBlock(scope: !159, file: !3, line: 52, column: 34)
!165 = !DILocation(line: 54, column: 3, scope: !164)
!166 = !DILocation(line: 57, column: 2, scope: !141)
!167 = !DILocation(line: 57, column: 7, scope: !141)
!168 = !DILocation(line: 58, column: 17, scope: !141)
!169 = !DILocation(line: 58, column: 19, scope: !141)
!170 = !DILocation(line: 58, column: 2, scope: !141)
!171 = !DILocation(line: 59, column: 17, scope: !141)
!172 = !DILocation(line: 59, column: 19, scope: !141)
!173 = !DILocation(line: 59, column: 2, scope: !141)
!174 = !DILocation(line: 61, column: 2, scope: !141)
!175 = !DILocation(line: 61, column: 9, scope: !141)
!176 = !DILocation(line: 62, column: 19, scope: !141)
!177 = !DILocation(line: 62, column: 12, scope: !141)
!178 = !DILocation(line: 62, column: 52, scope: !141)
!179 = !DILocation(line: 62, column: 56, scope: !141)
!180 = !DILocation(line: 62, column: 2, scope: !141)
!181 = !DILocation(line: 64, column: 9, scope: !141)
!182 = !DILocation(line: 64, column: 13, scope: !141)
!183 = !DILocation(line: 64, column: 33, scope: !141)
!184 = !DILocation(line: 64, column: 26, scope: !141)
!185 = !DILocation(line: 64, column: 19, scope: !141)
!186 = !DILocation(line: 64, column: 2, scope: !141)
!187 = !DILocation(line: 66, column: 16, scope: !141)
!188 = !DILocation(line: 66, column: 9, scope: !141)
!189 = !DILocation(line: 66, column: 2, scope: !141)
!190 = !DILocation(line: 67, column: 1, scope: !141)
!191 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 69, type: !192, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !11, retainedNodes: !42)
!192 = !DISubroutineType(types: !193)
!193 = !{!30}
!194 = !DILocation(line: 70, column: 7, scope: !191)
!195 = !DILocation(line: 70, column: 2, scope: !191)
!196 = !DILocation(line: 74, column: 2, scope: !191)
