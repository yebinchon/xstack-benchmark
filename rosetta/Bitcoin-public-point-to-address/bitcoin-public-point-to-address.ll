; ModuleID = 'bitcoin-public-point-to-address.c'
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
  %retval = alloca i32, align 4
  %s.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i32* %i, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 0, i32* %i, align 4, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !57
  %cmp = icmp slt i32 %0, 64, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %call = call i16** @__ctype_b_loc() #6, !dbg !61
  %1 = load i16*, i16** %call, align 8, !dbg !61
  %2 = load i8*, i8** %s.addr, align 8, !dbg !61
  %3 = load i32, i32* %i, align 4, !dbg !61
  %idxprom = sext i32 %3 to i64, !dbg !61
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 %idxprom, !dbg !61
  %4 = load i8, i8* %arrayidx, align 1, !dbg !61
  %conv = sext i8 %4 to i32, !dbg !61
  %idxprom1 = sext i32 %conv to i64, !dbg !61
  %arrayidx2 = getelementptr inbounds i16, i16* %1, i64 %idxprom1, !dbg !61
  %5 = load i16, i16* %arrayidx2, align 2, !dbg !61
  %conv3 = zext i16 %5 to i32, !dbg !61
  %and = and i32 %conv3, 4096, !dbg !61
  %tobool = icmp ne i32 %and, 0, !dbg !61
  br i1 %tobool, label %if.end, label %if.then, !dbg !63, !cf.info !64

if.then:                                          ; preds = %for.body
  store i32 0, i32* %retval, align 4, !dbg !65
  br label %return, !dbg !65

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %if.end
  %6 = load i32, i32* %i, align 4, !dbg !66
  %inc = add nsw i32 %6, 1, !dbg !66
  store i32 %inc, i32* %i, align 4, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %retval, align 4, !dbg !70
  br label %return, !dbg !70

return:                                           ; preds = %for.end, %if.then
  %7 = load i32, i32* %retval, align 4, !dbg !71
  ret i32 %7, !dbg !71
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readnone
declare dso_local i16** @__ctype_b_loc() #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @str_to_byte(i8* %src, i8* %dst, i32 %n) #0 !dbg !72 {
entry:
  %src.addr = alloca i8*, align 8
  %dst.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  store i8* %src, i8** %src.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %src.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8* %dst, i8** %dst.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dst.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !79, metadata !DIExpression()), !dbg !80
  br label %while.cond, !dbg !81

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %n.addr, align 4, !dbg !82
  %dec = add nsw i32 %0, -1, !dbg !82
  store i32 %dec, i32* %n.addr, align 4, !dbg !82
  %tobool = icmp ne i32 %0, 0, !dbg !81
  br i1 %tobool, label %while.body, label %while.end, !dbg !81

while.body:                                       ; preds = %while.cond
  %1 = load i8*, i8** %src.addr, align 8, !dbg !83
  %2 = load i32, i32* %n.addr, align 4, !dbg !84
  %mul = mul nsw i32 %2, 2, !dbg !85
  %idx.ext = sext i32 %mul to i64, !dbg !86
  %add.ptr = getelementptr inbounds i8, i8* %1, i64 %idx.ext, !dbg !86
  %3 = load i8*, i8** %dst.addr, align 8, !dbg !87
  %4 = load i32, i32* %n.addr, align 4, !dbg !88
  %idx.ext1 = sext i32 %4 to i64, !dbg !89
  %add.ptr2 = getelementptr inbounds i8, i8* %3, i64 %idx.ext1, !dbg !89
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %add.ptr, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i8* %add.ptr2) #7, !dbg !90
  br label %while.cond, !dbg !81, !llvm.loop !91

while.end:                                        ; preds = %while.cond
  ret void, !dbg !93
}

; Function Attrs: nounwind
declare dso_local i32 @__isoc99_sscanf(i8*, i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @base58(i8* %s, i8* %out) #0 !dbg !2 {
entry:
  %s.addr = alloca i8*, align 8
  %out.addr = alloca i8*, align 8
  %c = alloca i32, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8* %out, i8** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %out.addr, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i32* %c, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32* %i, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32* %n, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = load i8*, i8** %out.addr, align 8, !dbg !104
  %tobool = icmp ne i8* %0, null, !dbg !104
  br i1 %tobool, label %if.end, label %if.then, !dbg !106, !cf.info !64

if.then:                                          ; preds = %entry
  store i8* getelementptr inbounds ([40 x i8], [40 x i8]* @base58.buf, i64 0, i64 0), i8** %out.addr, align 8, !dbg !107
  br label %if.end, !dbg !108

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8*, i8** %out.addr, align 8, !dbg !109
  store i32 34, i32* %n, align 4, !dbg !110
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 34, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  br label %while.cond, !dbg !112

while.cond:                                       ; preds = %for.end, %if.end
  %2 = load i32, i32* %n, align 4, !dbg !113
  %dec = add nsw i32 %2, -1, !dbg !113
  store i32 %dec, i32* %n, align 4, !dbg !113
  %tobool1 = icmp ne i32 %2, 0, !dbg !112
  br i1 %tobool1, label %while.body, label %while.end, !dbg !112

while.body:                                       ; preds = %while.cond
  store i32 0, i32* %i, align 4, !dbg !114
  store i32 0, i32* %c, align 4, !dbg !117
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %while.body
  %3 = load i32, i32* %i, align 4, !dbg !119
  %cmp = icmp slt i32 %3, 25, !dbg !121
  br i1 %cmp, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %c, align 4, !dbg !123
  %mul = mul nsw i32 %4, 256, !dbg !125
  %5 = load i8*, i8** %s.addr, align 8, !dbg !126
  %6 = load i32, i32* %i, align 4, !dbg !127
  %idxprom = sext i32 %6 to i64, !dbg !126
  %arrayidx2 = getelementptr inbounds i8, i8* %5, i64 %idxprom, !dbg !126
  %7 = load i8, i8* %arrayidx2, align 1, !dbg !126
  %conv = zext i8 %7 to i32, !dbg !126
  %add = add nsw i32 %mul, %conv, !dbg !128
  store i32 %add, i32* %c, align 4, !dbg !129
  %8 = load i32, i32* %c, align 4, !dbg !130
  %div = sdiv i32 %8, 58, !dbg !131
  %conv3 = trunc i32 %div to i8, !dbg !130
  %9 = load i8*, i8** %s.addr, align 8, !dbg !132
  %10 = load i32, i32* %i, align 4, !dbg !133
  %idxprom4 = sext i32 %10 to i64, !dbg !132
  %arrayidx5 = getelementptr inbounds i8, i8* %9, i64 %idxprom4, !dbg !132
  store i8 %conv3, i8* %arrayidx5, align 1, !dbg !134
  %11 = load i32, i32* %c, align 4, !dbg !135
  %rem = srem i32 %11, 58, !dbg !135
  store i32 %rem, i32* %c, align 4, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !137
  %inc = add nsw i32 %12, 1, !dbg !137
  store i32 %inc, i32* %i, align 4, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %13 = load i8*, i8** @base58.tmpl, align 8, !dbg !141
  %14 = load i32, i32* %c, align 4, !dbg !142
  %idxprom6 = sext i32 %14 to i64, !dbg !141
  %arrayidx7 = getelementptr inbounds i8, i8* %13, i64 %idxprom6, !dbg !141
  %15 = load i8, i8* %arrayidx7, align 1, !dbg !141
  %16 = load i8*, i8** %out.addr, align 8, !dbg !143
  %17 = load i32, i32* %n, align 4, !dbg !144
  %idxprom8 = sext i32 %17 to i64, !dbg !143
  %arrayidx9 = getelementptr inbounds i8, i8* %16, i64 %idxprom8, !dbg !143
  store i8 %15, i8* %arrayidx9, align 1, !dbg !145
  br label %while.cond, !dbg !112, !llvm.loop !146

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %n, align 4, !dbg !148
  br label %for.cond10, !dbg !150

for.cond10:                                       ; preds = %for.inc17, %while.end
  %18 = load i8*, i8** %out.addr, align 8, !dbg !151
  %19 = load i32, i32* %n, align 4, !dbg !153
  %idxprom11 = sext i32 %19 to i64, !dbg !151
  %arrayidx12 = getelementptr inbounds i8, i8* %18, i64 %idxprom11, !dbg !151
  %20 = load i8, i8* %arrayidx12, align 1, !dbg !151
  %conv13 = sext i8 %20 to i32, !dbg !151
  %cmp14 = icmp eq i32 %conv13, 49, !dbg !154
  br i1 %cmp14, label %for.body16, label %for.end19, !dbg !155

for.body16:                                       ; preds = %for.cond10
  br label %for.inc17, !dbg !155

for.inc17:                                        ; preds = %for.body16
  %21 = load i32, i32* %n, align 4, !dbg !156
  %inc18 = add nsw i32 %21, 1, !dbg !156
  store i32 %inc18, i32* %n, align 4, !dbg !156
  br label %for.cond10, !dbg !157, !llvm.loop !158

for.end19:                                        ; preds = %for.cond10
  %22 = load i8*, i8** %out.addr, align 8, !dbg !160
  %23 = load i8*, i8** %out.addr, align 8, !dbg !161
  %24 = load i32, i32* %n, align 4, !dbg !162
  %idx.ext = sext i32 %24 to i64, !dbg !163
  %add.ptr = getelementptr inbounds i8, i8* %23, i64 %idx.ext, !dbg !163
  %25 = load i32, i32* %n, align 4, !dbg !164
  %sub = sub nsw i32 34, %25, !dbg !165
  %conv20 = sext i32 %sub to i64, !dbg !166
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %22, i8* align 1 %add.ptr, i64 %conv20, i1 false), !dbg !167
  %26 = load i8*, i8** %out.addr, align 8, !dbg !168
  ret i8* %26, !dbg !169
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @coin_encode(i8* %x, i8* %y, i8* %out) #0 !dbg !170 {
entry:
  %retval = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %out.addr = alloca i8*, align 8
  %s = alloca [65 x i8], align 16
  %rmd = alloca [25 x i8], align 16
  store i8* %x, i8** %x.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %x.addr, metadata !173, metadata !DIExpression()), !dbg !174
  store i8* %y, i8** %y.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %y.addr, metadata !175, metadata !DIExpression()), !dbg !176
  store i8* %out, i8** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %out.addr, metadata !177, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata [65 x i8]* %s, metadata !179, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.declare(metadata [25 x i8]* %rmd, metadata !184, metadata !DIExpression()), !dbg !188
  %0 = load i8*, i8** %x.addr, align 8, !dbg !189
  %call = call i32 @is_hex(i8* %0), !dbg !191
  %tobool = icmp ne i32 %call, 0, !dbg !191
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !192, !cf.info !64

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %y.addr, align 8, !dbg !193
  %call1 = call i32 @is_hex(i8* %1), !dbg !194
  %tobool2 = icmp ne i32 %call1, 0, !dbg !194
  br i1 %tobool2, label %if.end, label %if.then, !dbg !195, !cf.info !64

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0), i8** @coin_err, align 8, !dbg !196
  store i8* null, i8** %retval, align 8, !dbg !198
  br label %return, !dbg !198

if.end:                                           ; preds = %lor.lhs.false
  %arrayidx = getelementptr inbounds [65 x i8], [65 x i8]* %s, i64 0, i64 0, !dbg !199
  store i8 4, i8* %arrayidx, align 16, !dbg !200
  %2 = load i8*, i8** %x.addr, align 8, !dbg !201
  %arraydecay = getelementptr inbounds [65 x i8], [65 x i8]* %s, i64 0, i64 0, !dbg !202
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay, i64 1, !dbg !203
  call void @str_to_byte(i8* %2, i8* %add.ptr, i32 32), !dbg !204
  %3 = load i8*, i8** %y.addr, align 8, !dbg !205
  %arraydecay3 = getelementptr inbounds [65 x i8], [65 x i8]* %s, i64 0, i64 0, !dbg !206
  %add.ptr4 = getelementptr inbounds i8, i8* %arraydecay3, i64 33, !dbg !207
  call void @str_to_byte(i8* %3, i8* %add.ptr4, i32 32), !dbg !208
  %arrayidx5 = getelementptr inbounds [25 x i8], [25 x i8]* %rmd, i64 0, i64 0, !dbg !209
  store i8 0, i8* %arrayidx5, align 16, !dbg !210
  %arraydecay6 = getelementptr inbounds [65 x i8], [65 x i8]* %s, i64 0, i64 0, !dbg !211
  %call7 = call i8* @SHA256(i8* %arraydecay6, i64 65, i8* null), !dbg !212
  %arraydecay8 = getelementptr inbounds [25 x i8], [25 x i8]* %rmd, i64 0, i64 0, !dbg !213
  %add.ptr9 = getelementptr inbounds i8, i8* %arraydecay8, i64 1, !dbg !214
  %call10 = call i8* @RIPEMD160(i8* %call7, i64 32, i8* %add.ptr9), !dbg !215
  %arraydecay11 = getelementptr inbounds [25 x i8], [25 x i8]* %rmd, i64 0, i64 0, !dbg !216
  %add.ptr12 = getelementptr inbounds i8, i8* %arraydecay11, i64 21, !dbg !217
  %arraydecay13 = getelementptr inbounds [25 x i8], [25 x i8]* %rmd, i64 0, i64 0, !dbg !218
  %call14 = call i8* @SHA256(i8* %arraydecay13, i64 21, i8* null), !dbg !219
  %call15 = call i8* @SHA256(i8* %call14, i64 32, i8* null), !dbg !220
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %add.ptr12, i8* align 1 %call15, i64 4, i1 false), !dbg !221
  %arraydecay16 = getelementptr inbounds [25 x i8], [25 x i8]* %rmd, i64 0, i64 0, !dbg !222
  %4 = load i8*, i8** %out.addr, align 8, !dbg !223
  %call17 = call i8* @base58(i8* %arraydecay16, i8* %4), !dbg !224
  store i8* %call17, i8** %retval, align 8, !dbg !225
  br label %return, !dbg !225

return:                                           ; preds = %if.end, %if.then
  %5 = load i8*, i8** %retval, align 8, !dbg !226
  ret i8* %5, !dbg !226
}

declare dso_local i8* @RIPEMD160(i8*, i64, i8*) #5

declare dso_local i8* @SHA256(i8*, i64, i8*) #5

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !227 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i8* @coin_encode(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.4, i64 0, i64 0), i8* null), !dbg !230
  %call1 = call i32 @puts(i8* %call), !dbg !231
  ret i32 0, !dbg !232
}

declare dso_local i32 @puts(i8*) #5

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
!11 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !12, retainedTypes: !29, globals: !32, splitDebugInlining: false, nameTableKind: None)
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
!46 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!47 = distinct !DISubprogram(name: "is_hex", scope: !3, file: !3, line: 12, type: !48, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !11, retainedNodes: !42)
!48 = !DISubroutineType(types: !49)
!49 = !{!30, !40}
!50 = !DILocalVariable(name: "s", arg: 1, scope: !47, file: !3, line: 12, type: !40)
!51 = !DILocation(line: 12, column: 24, scope: !47)
!52 = !DILocalVariable(name: "i", scope: !47, file: !3, line: 13, type: !30)
!53 = !DILocation(line: 13, column: 6, scope: !47)
!54 = !DILocation(line: 14, column: 9, scope: !55)
!55 = distinct !DILexicalBlock(scope: !47, file: !3, line: 14, column: 2)
!56 = !DILocation(line: 14, column: 7, scope: !55)
!57 = !DILocation(line: 14, column: 14, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !3, line: 14, column: 2)
!59 = !DILocation(line: 14, column: 16, scope: !58)
!60 = !DILocation(line: 14, column: 2, scope: !55)
!61 = !DILocation(line: 15, column: 8, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !3, line: 15, column: 7)
!63 = !DILocation(line: 15, column: 7, scope: !58)
!64 = !{!"if"}
!65 = !DILocation(line: 15, column: 24, scope: !62)
!66 = !DILocation(line: 14, column: 23, scope: !58)
!67 = !DILocation(line: 14, column: 2, scope: !58)
!68 = distinct !{!68, !60, !69}
!69 = !DILocation(line: 15, column: 31, scope: !55)
!70 = !DILocation(line: 16, column: 2, scope: !47)
!71 = !DILocation(line: 17, column: 1, scope: !47)
!72 = distinct !DISubprogram(name: "str_to_byte", scope: !3, file: !3, line: 19, type: !73, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !11, retainedNodes: !42)
!73 = !DISubroutineType(types: !74)
!74 = !{null, !40, !8, !30}
!75 = !DILocalVariable(name: "src", arg: 1, scope: !72, file: !3, line: 19, type: !40)
!76 = !DILocation(line: 19, column: 30, scope: !72)
!77 = !DILocalVariable(name: "dst", arg: 2, scope: !72, file: !3, line: 19, type: !8)
!78 = !DILocation(line: 19, column: 41, scope: !72)
!79 = !DILocalVariable(name: "n", arg: 3, scope: !72, file: !3, line: 19, type: !30)
!80 = !DILocation(line: 19, column: 50, scope: !72)
!81 = !DILocation(line: 20, column: 2, scope: !72)
!82 = !DILocation(line: 20, column: 10, scope: !72)
!83 = !DILocation(line: 20, column: 21, scope: !72)
!84 = !DILocation(line: 20, column: 27, scope: !72)
!85 = !DILocation(line: 20, column: 29, scope: !72)
!86 = !DILocation(line: 20, column: 25, scope: !72)
!87 = !DILocation(line: 20, column: 43, scope: !72)
!88 = !DILocation(line: 20, column: 49, scope: !72)
!89 = !DILocation(line: 20, column: 47, scope: !72)
!90 = !DILocation(line: 20, column: 14, scope: !72)
!91 = distinct !{!91, !81, !92}
!92 = !DILocation(line: 20, column: 50, scope: !72)
!93 = !DILocation(line: 21, column: 1, scope: !72)
!94 = !DILocalVariable(name: "s", arg: 1, scope: !2, file: !3, line: 23, type: !8)
!95 = !DILocation(line: 23, column: 20, scope: !2)
!96 = !DILocalVariable(name: "out", arg: 2, scope: !2, file: !3, line: 23, type: !6)
!97 = !DILocation(line: 23, column: 29, scope: !2)
!98 = !DILocalVariable(name: "c", scope: !2, file: !3, line: 29, type: !30)
!99 = !DILocation(line: 29, column: 6, scope: !2)
!100 = !DILocalVariable(name: "i", scope: !2, file: !3, line: 29, type: !30)
!101 = !DILocation(line: 29, column: 9, scope: !2)
!102 = !DILocalVariable(name: "n", scope: !2, file: !3, line: 29, type: !30)
!103 = !DILocation(line: 29, column: 12, scope: !2)
!104 = !DILocation(line: 30, column: 7, scope: !105)
!105 = distinct !DILexicalBlock(scope: !2, file: !3, line: 30, column: 6)
!106 = !DILocation(line: 30, column: 6, scope: !2)
!107 = !DILocation(line: 30, column: 16, scope: !105)
!108 = !DILocation(line: 30, column: 12, scope: !105)
!109 = !DILocation(line: 32, column: 2, scope: !2)
!110 = !DILocation(line: 32, column: 8, scope: !2)
!111 = !DILocation(line: 32, column: 14, scope: !2)
!112 = !DILocation(line: 33, column: 2, scope: !2)
!113 = !DILocation(line: 33, column: 10, scope: !2)
!114 = !DILocation(line: 34, column: 14, scope: !115)
!115 = distinct !DILexicalBlock(scope: !116, file: !3, line: 34, column: 3)
!116 = distinct !DILexicalBlock(scope: !2, file: !3, line: 33, column: 14)
!117 = !DILocation(line: 34, column: 10, scope: !115)
!118 = !DILocation(line: 34, column: 8, scope: !115)
!119 = !DILocation(line: 34, column: 19, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !3, line: 34, column: 3)
!121 = !DILocation(line: 34, column: 21, scope: !120)
!122 = !DILocation(line: 34, column: 3, scope: !115)
!123 = !DILocation(line: 35, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !3, line: 34, column: 32)
!125 = !DILocation(line: 35, column: 10, scope: !124)
!126 = !DILocation(line: 35, column: 18, scope: !124)
!127 = !DILocation(line: 35, column: 20, scope: !124)
!128 = !DILocation(line: 35, column: 16, scope: !124)
!129 = !DILocation(line: 35, column: 6, scope: !124)
!130 = !DILocation(line: 36, column: 11, scope: !124)
!131 = !DILocation(line: 36, column: 13, scope: !124)
!132 = !DILocation(line: 36, column: 4, scope: !124)
!133 = !DILocation(line: 36, column: 6, scope: !124)
!134 = !DILocation(line: 36, column: 9, scope: !124)
!135 = !DILocation(line: 37, column: 6, scope: !124)
!136 = !DILocation(line: 38, column: 3, scope: !124)
!137 = !DILocation(line: 34, column: 28, scope: !120)
!138 = !DILocation(line: 34, column: 3, scope: !120)
!139 = distinct !{!139, !122, !140}
!140 = !DILocation(line: 38, column: 3, scope: !115)
!141 = !DILocation(line: 39, column: 12, scope: !116)
!142 = !DILocation(line: 39, column: 17, scope: !116)
!143 = !DILocation(line: 39, column: 3, scope: !116)
!144 = !DILocation(line: 39, column: 7, scope: !116)
!145 = !DILocation(line: 39, column: 10, scope: !116)
!146 = distinct !{!146, !112, !147}
!147 = !DILocation(line: 40, column: 2, scope: !2)
!148 = !DILocation(line: 42, column: 9, scope: !149)
!149 = distinct !DILexicalBlock(scope: !2, file: !3, line: 42, column: 2)
!150 = !DILocation(line: 42, column: 7, scope: !149)
!151 = !DILocation(line: 42, column: 14, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !3, line: 42, column: 2)
!153 = !DILocation(line: 42, column: 18, scope: !152)
!154 = !DILocation(line: 42, column: 21, scope: !152)
!155 = !DILocation(line: 42, column: 2, scope: !149)
!156 = !DILocation(line: 42, column: 30, scope: !152)
!157 = !DILocation(line: 42, column: 2, scope: !152)
!158 = distinct !{!158, !155, !159}
!159 = !DILocation(line: 42, column: 33, scope: !149)
!160 = !DILocation(line: 43, column: 10, scope: !2)
!161 = !DILocation(line: 43, column: 15, scope: !2)
!162 = !DILocation(line: 43, column: 21, scope: !2)
!163 = !DILocation(line: 43, column: 19, scope: !2)
!164 = !DILocation(line: 43, column: 29, scope: !2)
!165 = !DILocation(line: 43, column: 27, scope: !2)
!166 = !DILocation(line: 43, column: 24, scope: !2)
!167 = !DILocation(line: 43, column: 2, scope: !2)
!168 = !DILocation(line: 45, column: 9, scope: !2)
!169 = !DILocation(line: 45, column: 2, scope: !2)
!170 = distinct !DISubprogram(name: "coin_encode", scope: !3, file: !3, line: 48, type: !171, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !11, retainedNodes: !42)
!171 = !DISubroutineType(types: !172)
!172 = !{!6, !40, !40, !6}
!173 = !DILocalVariable(name: "x", arg: 1, scope: !170, file: !3, line: 48, type: !40)
!174 = !DILocation(line: 48, column: 31, scope: !170)
!175 = !DILocalVariable(name: "y", arg: 2, scope: !170, file: !3, line: 48, type: !40)
!176 = !DILocation(line: 48, column: 46, scope: !170)
!177 = !DILocalVariable(name: "out", arg: 3, scope: !170, file: !3, line: 48, type: !6)
!178 = !DILocation(line: 48, column: 55, scope: !170)
!179 = !DILocalVariable(name: "s", scope: !170, file: !3, line: 49, type: !180)
!180 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 520, elements: !181)
!181 = !{!182}
!182 = !DISubrange(count: 65)
!183 = !DILocation(line: 49, column: 7, scope: !170)
!184 = !DILocalVariable(name: "rmd", scope: !170, file: !3, line: 50, type: !185)
!185 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 200, elements: !186)
!186 = !{!187}
!187 = !DISubrange(count: 25)
!188 = !DILocation(line: 50, column: 7, scope: !170)
!189 = !DILocation(line: 52, column: 14, scope: !190)
!190 = distinct !DILexicalBlock(scope: !170, file: !3, line: 52, column: 6)
!191 = !DILocation(line: 52, column: 7, scope: !190)
!192 = !DILocation(line: 52, column: 17, scope: !190)
!193 = !DILocation(line: 52, column: 29, scope: !190)
!194 = !DILocation(line: 52, column: 22, scope: !190)
!195 = !DILocation(line: 52, column: 6, scope: !170)
!196 = !DILocation(line: 53, column: 12, scope: !197)
!197 = distinct !DILexicalBlock(scope: !190, file: !3, line: 52, column: 34)
!198 = !DILocation(line: 54, column: 3, scope: !197)
!199 = !DILocation(line: 57, column: 2, scope: !170)
!200 = !DILocation(line: 57, column: 7, scope: !170)
!201 = !DILocation(line: 58, column: 14, scope: !170)
!202 = !DILocation(line: 58, column: 17, scope: !170)
!203 = !DILocation(line: 58, column: 19, scope: !170)
!204 = !DILocation(line: 58, column: 2, scope: !170)
!205 = !DILocation(line: 59, column: 14, scope: !170)
!206 = !DILocation(line: 59, column: 17, scope: !170)
!207 = !DILocation(line: 59, column: 19, scope: !170)
!208 = !DILocation(line: 59, column: 2, scope: !170)
!209 = !DILocation(line: 61, column: 2, scope: !170)
!210 = !DILocation(line: 61, column: 9, scope: !170)
!211 = !DILocation(line: 62, column: 19, scope: !170)
!212 = !DILocation(line: 62, column: 12, scope: !170)
!213 = !DILocation(line: 62, column: 52, scope: !170)
!214 = !DILocation(line: 62, column: 56, scope: !170)
!215 = !DILocation(line: 62, column: 2, scope: !170)
!216 = !DILocation(line: 64, column: 9, scope: !170)
!217 = !DILocation(line: 64, column: 13, scope: !170)
!218 = !DILocation(line: 64, column: 33, scope: !170)
!219 = !DILocation(line: 64, column: 26, scope: !170)
!220 = !DILocation(line: 64, column: 19, scope: !170)
!221 = !DILocation(line: 64, column: 2, scope: !170)
!222 = !DILocation(line: 66, column: 16, scope: !170)
!223 = !DILocation(line: 66, column: 21, scope: !170)
!224 = !DILocation(line: 66, column: 9, scope: !170)
!225 = !DILocation(line: 66, column: 2, scope: !170)
!226 = !DILocation(line: 67, column: 1, scope: !170)
!227 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 69, type: !228, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !11, retainedNodes: !42)
!228 = !DISubroutineType(types: !229)
!229 = !{!30}
!230 = !DILocation(line: 70, column: 7, scope: !227)
!231 = !DILocation(line: 70, column: 2, scope: !227)
!232 = !DILocation(line: 74, column: 2, scope: !227)
