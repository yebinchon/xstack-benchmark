; ModuleID = 'amicable-pairs.ll'
source_filename = "amicable-pairs.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%u %u\0A\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"\0ATop %u count : %u\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %top = alloca i32, align 4
  %divsum = alloca i32*, align 8
  %pows = alloca [32 x i32], align 16
  %i = alloca i32, align 4
  %p = alloca i32, align 4
  %x = alloca i32, align 4
  %k = alloca i32, align 4
  %n = alloca i32, align 4
  %s = alloca i32, align 4
  %i42 = alloca i32, align 4
  %p65 = alloca i32, align 4
  %cnt = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %top, metadata !18, metadata !DIExpression()), !dbg !21
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !22
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !dbg !22
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !22
  %call = call i32 @atoi(i8* %1) #6, !dbg !23
  store i32 %call, i32* %top, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata i32** %divsum, metadata !24, metadata !DIExpression()), !dbg !26
  %2 = load i32, i32* %top, align 4, !dbg !27
  %add = add i32 %2, 1, !dbg !28
  %conv = zext i32 %add to i64, !dbg !29
  %mul = mul i64 %conv, 4, !dbg !30
  %call1 = call noalias i8* @malloc(i64 %mul) #7, !dbg !31
  %3 = bitcast i8* %call1 to i32*, !dbg !31
  store i32* %3, i32** %divsum, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata [32 x i32]* %pows, metadata !32, metadata !DIExpression()), !dbg !36
  %4 = bitcast [32 x i32]* %pows to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 128, i1 false), !dbg !36
  %5 = bitcast i8* %4 to <{ i32, [31 x i32] }>*, !dbg !36
  %6 = getelementptr inbounds <{ i32, [31 x i32] }>, <{ i32, [31 x i32] }>* %5, i32 0, i32 0, !dbg !36
  store i32 1, i32* %6, align 16, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %i, metadata !37, metadata !DIExpression()), !dbg !39
  store i32 0, i32* %i, align 4, !dbg !39
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i32, i32* %i, align 4, !dbg !41
  %8 = load i32, i32* %top, align 4, !dbg !43
  %cmp = icmp ule i32 %7, %8, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %divsum, align 8, !dbg !46
  %10 = load i32, i32* %i, align 4, !dbg !47
  %idxprom = zext i32 %10 to i64, !dbg !46
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 %idxprom, !dbg !46
  store i32 1, i32* %arrayidx3, align 4, !dbg !48
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !49
  %inc = add i32 %11, 1, !dbg !49
  store i32 %inc, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %p, metadata !53, metadata !DIExpression()), !dbg !55
  store i32 2, i32* %p, align 4, !dbg !55
  br label %for.cond4, !dbg !56

for.cond4:                                        ; preds = %for.inc62, %for.end
  %12 = load i32, i32* %p, align 4, !dbg !57
  %13 = load i32, i32* %p, align 4, !dbg !59
  %add5 = add i32 %12, %13, !dbg !60
  %14 = load i32, i32* %top, align 4, !dbg !61
  %cmp6 = icmp ule i32 %add5, %14, !dbg !62
  br i1 %cmp6, label %for.body8, label %for.end64, !dbg !63

for.body8:                                        ; preds = %for.cond4
  %15 = load i32*, i32** %divsum, align 8, !dbg !64
  %16 = load i32, i32* %p, align 4, !dbg !67
  %idxprom9 = zext i32 %16 to i64, !dbg !64
  %arrayidx10 = getelementptr inbounds i32, i32* %15, i64 %idxprom9, !dbg !64
  %17 = load i32, i32* %arrayidx10, align 4, !dbg !64
  %cmp11 = icmp ugt i32 %17, 1, !dbg !68
  br i1 %cmp11, label %if.then, label %if.end, !dbg !69

if.then:                                          ; preds = %for.body8
  %18 = load i32, i32* %p, align 4, !dbg !70
  %19 = load i32*, i32** %divsum, align 8, !dbg !72
  %20 = load i32, i32* %p, align 4, !dbg !73
  %idxprom13 = zext i32 %20 to i64, !dbg !72
  %arrayidx14 = getelementptr inbounds i32, i32* %19, i64 %idxprom13, !dbg !72
  %21 = load i32, i32* %arrayidx14, align 4, !dbg !74
  %sub = sub i32 %21, %18, !dbg !74
  store i32 %sub, i32* %arrayidx14, align 4, !dbg !74
  br label %for.inc62, !dbg !75

if.end:                                           ; preds = %for.body8
  call void @llvm.dbg.declare(metadata i32* %x, metadata !76, metadata !DIExpression()), !dbg !77
  store i32 1, i32* %x, align 4, !dbg !78
  br label %for.cond15, !dbg !80

for.cond15:                                       ; preds = %for.inc28, %if.end
  %22 = load i32, i32* %x, align 4, !dbg !81
  %sub16 = sub i32 %22, 1, !dbg !83
  %idxprom17 = zext i32 %sub16 to i64, !dbg !84
  %arrayidx18 = getelementptr inbounds [32 x i32], [32 x i32]* %pows, i64 0, i64 %idxprom17, !dbg !84
  %23 = load i32, i32* %arrayidx18, align 4, !dbg !84
  %24 = load i32, i32* %top, align 4, !dbg !85
  %25 = load i32, i32* %p, align 4, !dbg !86
  %div = udiv i32 %24, %25, !dbg !87
  %cmp19 = icmp ule i32 %23, %div, !dbg !88
  br i1 %cmp19, label %for.body21, label %for.end30, !dbg !89

for.body21:                                       ; preds = %for.cond15
  %26 = load i32, i32* %p, align 4, !dbg !90
  %27 = load i32, i32* %x, align 4, !dbg !91
  %sub22 = sub i32 %27, 1, !dbg !92
  %idxprom23 = zext i32 %sub22 to i64, !dbg !93
  %arrayidx24 = getelementptr inbounds [32 x i32], [32 x i32]* %pows, i64 0, i64 %idxprom23, !dbg !93
  %28 = load i32, i32* %arrayidx24, align 4, !dbg !93
  %mul25 = mul i32 %26, %28, !dbg !94
  %29 = load i32, i32* %x, align 4, !dbg !95
  %idxprom26 = zext i32 %29 to i64, !dbg !96
  %arrayidx27 = getelementptr inbounds [32 x i32], [32 x i32]* %pows, i64 0, i64 %idxprom26, !dbg !96
  store i32 %mul25, i32* %arrayidx27, align 4, !dbg !97
  br label %for.inc28, !dbg !96

for.inc28:                                        ; preds = %for.body21
  %30 = load i32, i32* %x, align 4, !dbg !98
  %inc29 = add i32 %30, 1, !dbg !98
  store i32 %inc29, i32* %x, align 4, !dbg !98
  br label %for.cond15, !dbg !99, !llvm.loop !100

for.end30:                                        ; preds = %for.cond15
  call void @llvm.dbg.declare(metadata i32* %k, metadata !102, metadata !DIExpression()), !dbg !103
  %31 = load i32, i32* %p, align 4, !dbg !104
  %sub31 = sub i32 %31, 1, !dbg !105
  store i32 %sub31, i32* %k, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata i32* %n, metadata !106, metadata !DIExpression()), !dbg !108
  %32 = load i32, i32* %p, align 4, !dbg !109
  %33 = load i32, i32* %p, align 4, !dbg !110
  %add32 = add i32 %32, %33, !dbg !111
  store i32 %add32, i32* %n, align 4, !dbg !108
  br label %for.cond33, !dbg !112

for.cond33:                                       ; preds = %for.inc59, %for.end30
  %34 = load i32, i32* %n, align 4, !dbg !113
  %35 = load i32, i32* %top, align 4, !dbg !115
  %cmp34 = icmp ule i32 %34, %35, !dbg !116
  br i1 %cmp34, label %for.body36, label %for.end61, !dbg !117

for.body36:                                       ; preds = %for.cond33
  call void @llvm.dbg.declare(metadata i32* %s, metadata !118, metadata !DIExpression()), !dbg !120
  %arrayidx37 = getelementptr inbounds [32 x i32], [32 x i32]* %pows, i64 0, i64 1, !dbg !121
  %36 = load i32, i32* %arrayidx37, align 4, !dbg !121
  %add38 = add i32 1, %36, !dbg !122
  store i32 %add38, i32* %s, align 4, !dbg !120
  %37 = load i32, i32* %k, align 4, !dbg !123
  %dec = add i32 %37, -1, !dbg !123
  store i32 %dec, i32* %k, align 4, !dbg !123
  %38 = load i32, i32* %k, align 4, !dbg !124
  %cmp39 = icmp eq i32 %38, 0, !dbg !126
  br i1 %cmp39, label %if.then41, label %if.end55, !dbg !127

if.then41:                                        ; preds = %for.body36
  call void @llvm.dbg.declare(metadata i32* %i42, metadata !128, metadata !DIExpression()), !dbg !131
  store i32 2, i32* %i42, align 4, !dbg !131
  br label %for.cond43, !dbg !132

for.cond43:                                       ; preds = %for.inc49, %if.then41
  %39 = load i32, i32* %i42, align 4, !dbg !133
  %40 = load i32, i32* %x, align 4, !dbg !135
  %cmp44 = icmp ult i32 %39, %40, !dbg !136
  br i1 %cmp44, label %land.rhs, label %land.end, !dbg !137

land.rhs:                                         ; preds = %for.cond43
  %41 = load i32, i32* %n, align 4, !dbg !138
  %42 = load i32, i32* %i42, align 4, !dbg !139
  %idxprom46 = zext i32 %42 to i64, !dbg !140
  %arrayidx47 = getelementptr inbounds [32 x i32], [32 x i32]* %pows, i64 0, i64 %idxprom46, !dbg !140
  %43 = load i32, i32* %arrayidx47, align 4, !dbg !140
  %rem = urem i32 %41, %43, !dbg !141
  %tobool = icmp ne i32 %rem, 0, !dbg !142
  %lnot = xor i1 %tobool, true, !dbg !142
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond43
  %44 = phi i1 [ false, %for.cond43 ], [ %lnot, %land.rhs ], !dbg !143
  br i1 %44, label %for.body48, label %for.end54, !dbg !144

for.body48:                                       ; preds = %land.end
  br label %for.inc49, !dbg !144

for.inc49:                                        ; preds = %for.body48
  %45 = load i32, i32* %i42, align 4, !dbg !145
  %inc50 = add i32 %45, 1, !dbg !145
  store i32 %inc50, i32* %i42, align 4, !dbg !145
  %idxprom51 = zext i32 %45 to i64, !dbg !146
  %arrayidx52 = getelementptr inbounds [32 x i32], [32 x i32]* %pows, i64 0, i64 %idxprom51, !dbg !146
  %46 = load i32, i32* %arrayidx52, align 4, !dbg !146
  %47 = load i32, i32* %s, align 4, !dbg !147
  %add53 = add i32 %47, %46, !dbg !147
  store i32 %add53, i32* %s, align 4, !dbg !147
  br label %for.cond43, !dbg !148, !llvm.loop !149

for.end54:                                        ; preds = %land.end
  %48 = load i32, i32* %p, align 4, !dbg !151
  store i32 %48, i32* %k, align 4, !dbg !152
  br label %if.end55, !dbg !153

if.end55:                                         ; preds = %for.end54, %for.body36
  %49 = load i32, i32* %s, align 4, !dbg !154
  %50 = load i32*, i32** %divsum, align 8, !dbg !155
  %51 = load i32, i32* %n, align 4, !dbg !156
  %idxprom56 = zext i32 %51 to i64, !dbg !155
  %arrayidx57 = getelementptr inbounds i32, i32* %50, i64 %idxprom56, !dbg !155
  %52 = load i32, i32* %arrayidx57, align 4, !dbg !157
  %mul58 = mul i32 %52, %49, !dbg !157
  store i32 %mul58, i32* %arrayidx57, align 4, !dbg !157
  br label %for.inc59, !dbg !158

for.inc59:                                        ; preds = %if.end55
  %53 = load i32, i32* %p, align 4, !dbg !159
  %54 = load i32, i32* %n, align 4, !dbg !160
  %add60 = add i32 %54, %53, !dbg !160
  store i32 %add60, i32* %n, align 4, !dbg !160
  br label %for.cond33, !dbg !161, !llvm.loop !162

for.end61:                                        ; preds = %for.cond33
  br label %for.inc62, !dbg !164

for.inc62:                                        ; preds = %for.end61, %if.then
  %55 = load i32, i32* %p, align 4, !dbg !165
  %inc63 = add i32 %55, 1, !dbg !165
  store i32 %inc63, i32* %p, align 4, !dbg !165
  br label %for.cond4, !dbg !166, !llvm.loop !167

for.end64:                                        ; preds = %for.cond4
  call void @llvm.dbg.declare(metadata i32* %p65, metadata !169, metadata !DIExpression()), !dbg !171
  %56 = load i32, i32* %top, align 4, !dbg !172
  %shr = lshr i32 %56, 1, !dbg !173
  %add66 = add i32 %shr, 1, !dbg !174
  store i32 %add66, i32* %p65, align 4, !dbg !171
  br label %for.cond67, !dbg !175

for.cond67:                                       ; preds = %for.inc80, %for.end64
  %57 = load i32, i32* %p65, align 4, !dbg !176
  %58 = load i32, i32* %top, align 4, !dbg !178
  %cmp68 = icmp ule i32 %57, %58, !dbg !179
  br i1 %cmp68, label %for.body70, label %for.end82, !dbg !180

for.body70:                                       ; preds = %for.cond67
  %59 = load i32*, i32** %divsum, align 8, !dbg !181
  %60 = load i32, i32* %p65, align 4, !dbg !184
  %idxprom71 = zext i32 %60 to i64, !dbg !181
  %arrayidx72 = getelementptr inbounds i32, i32* %59, i64 %idxprom71, !dbg !181
  %61 = load i32, i32* %arrayidx72, align 4, !dbg !181
  %cmp73 = icmp ugt i32 %61, 1, !dbg !185
  br i1 %cmp73, label %if.then75, label %if.end79, !dbg !186

if.then75:                                        ; preds = %for.body70
  %62 = load i32, i32* %p65, align 4, !dbg !187
  %63 = load i32*, i32** %divsum, align 8, !dbg !189
  %64 = load i32, i32* %p65, align 4, !dbg !190
  %idxprom76 = zext i32 %64 to i64, !dbg !189
  %arrayidx77 = getelementptr inbounds i32, i32* %63, i64 %idxprom76, !dbg !189
  %65 = load i32, i32* %arrayidx77, align 4, !dbg !191
  %sub78 = sub i32 %65, %62, !dbg !191
  store i32 %sub78, i32* %arrayidx77, align 4, !dbg !191
  br label %if.end79, !dbg !192

if.end79:                                         ; preds = %if.then75, %for.body70
  br label %for.inc80, !dbg !193

for.inc80:                                        ; preds = %if.end79
  %66 = load i32, i32* %p65, align 4, !dbg !194
  %inc81 = add i32 %66, 1, !dbg !194
  store i32 %inc81, i32* %p65, align 4, !dbg !194
  br label %for.cond67, !dbg !195, !llvm.loop !196

for.end82:                                        ; preds = %for.cond67
  call void @llvm.dbg.declare(metadata i32* %cnt, metadata !198, metadata !DIExpression()), !dbg !199
  store i32 0, i32* %cnt, align 4, !dbg !199
  call void @llvm.dbg.declare(metadata i32* %a, metadata !200, metadata !DIExpression()), !dbg !202
  store i32 1, i32* %a, align 4, !dbg !202
  br label %for.cond83, !dbg !203

for.cond83:                                       ; preds = %for.inc102, %for.end82
  %67 = load i32, i32* %a, align 4, !dbg !204
  %68 = load i32, i32* %top, align 4, !dbg !206
  %cmp84 = icmp ule i32 %67, %68, !dbg !207
  br i1 %cmp84, label %for.body86, label %for.end104, !dbg !208

for.body86:                                       ; preds = %for.cond83
  call void @llvm.dbg.declare(metadata i32* %b, metadata !209, metadata !DIExpression()), !dbg !211
  %69 = load i32*, i32** %divsum, align 8, !dbg !212
  %70 = load i32, i32* %a, align 4, !dbg !213
  %idxprom87 = zext i32 %70 to i64, !dbg !212
  %arrayidx88 = getelementptr inbounds i32, i32* %69, i64 %idxprom87, !dbg !212
  %71 = load i32, i32* %arrayidx88, align 4, !dbg !212
  store i32 %71, i32* %b, align 4, !dbg !211
  %72 = load i32, i32* %b, align 4, !dbg !214
  %73 = load i32, i32* %a, align 4, !dbg !216
  %cmp89 = icmp ugt i32 %72, %73, !dbg !217
  br i1 %cmp89, label %land.lhs.true, label %if.end101, !dbg !218

land.lhs.true:                                    ; preds = %for.body86
  %74 = load i32, i32* %b, align 4, !dbg !219
  %75 = load i32, i32* %top, align 4, !dbg !220
  %cmp91 = icmp ule i32 %74, %75, !dbg !221
  br i1 %cmp91, label %land.lhs.true93, label %if.end101, !dbg !222

land.lhs.true93:                                  ; preds = %land.lhs.true
  %76 = load i32*, i32** %divsum, align 8, !dbg !223
  %77 = load i32, i32* %b, align 4, !dbg !224
  %idxprom94 = zext i32 %77 to i64, !dbg !223
  %arrayidx95 = getelementptr inbounds i32, i32* %76, i64 %idxprom94, !dbg !223
  %78 = load i32, i32* %arrayidx95, align 4, !dbg !223
  %79 = load i32, i32* %a, align 4, !dbg !225
  %cmp96 = icmp eq i32 %78, %79, !dbg !226
  br i1 %cmp96, label %if.then98, label %if.end101, !dbg !227

if.then98:                                        ; preds = %land.lhs.true93
  %80 = load i32, i32* %a, align 4, !dbg !228
  %81 = load i32, i32* %b, align 4, !dbg !230
  %call99 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 %80, i32 %81), !dbg !231
  %82 = load i32, i32* %cnt, align 4, !dbg !232
  %inc100 = add i32 %82, 1, !dbg !232
  store i32 %inc100, i32* %cnt, align 4, !dbg !232
  br label %if.end101, !dbg !233

if.end101:                                        ; preds = %if.then98, %land.lhs.true93, %land.lhs.true, %for.body86
  br label %for.inc102, !dbg !234

for.inc102:                                       ; preds = %if.end101
  %83 = load i32, i32* %a, align 4, !dbg !235
  %inc103 = add i32 %83, 1, !dbg !235
  store i32 %inc103, i32* %a, align 4, !dbg !235
  br label %for.cond83, !dbg !236, !llvm.loop !237

for.end104:                                       ; preds = %for.cond83
  %84 = load i32, i32* %top, align 4, !dbg !239
  %85 = load i32, i32* %cnt, align 4, !dbg !240
  %call105 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.1, i64 0, i64 0), i32 %84, i32 %85), !dbg !241
  ret i32 0, !dbg !242
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
!15 = !DILocation(line: 6, column: 14, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 6, type: !11)
!17 = !DILocation(line: 6, column: 27, scope: !7)
!18 = !DILocalVariable(name: "top", scope: !7, file: !1, line: 8, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint", file: !1, line: 4, baseType: !20)
!20 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!21 = !DILocation(line: 8, column: 8, scope: !7)
!22 = !DILocation(line: 8, column: 19, scope: !7)
!23 = !DILocation(line: 8, column: 14, scope: !7)
!24 = !DILocalVariable(name: "divsum", scope: !7, file: !1, line: 9, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!26 = !DILocation(line: 9, column: 9, scope: !7)
!27 = !DILocation(line: 9, column: 26, scope: !7)
!28 = !DILocation(line: 9, column: 30, scope: !7)
!29 = !DILocation(line: 9, column: 25, scope: !7)
!30 = !DILocation(line: 9, column: 35, scope: !7)
!31 = !DILocation(line: 9, column: 18, scope: !7)
!32 = !DILocalVariable(name: "pows", scope: !7, file: !1, line: 10, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 1024, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 32)
!36 = !DILocation(line: 10, column: 8, scope: !7)
!37 = !DILocalVariable(name: "i", scope: !38, file: !1, line: 12, type: !19)
!38 = distinct !DILexicalBlock(scope: !7, file: !1, line: 12, column: 3)
!39 = !DILocation(line: 12, column: 13, scope: !38)
!40 = !DILocation(line: 12, column: 8, scope: !38)
!41 = !DILocation(line: 12, column: 20, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !1, line: 12, column: 3)
!43 = !DILocation(line: 12, column: 25, scope: !42)
!44 = !DILocation(line: 12, column: 22, scope: !42)
!45 = !DILocation(line: 12, column: 3, scope: !38)
!46 = !DILocation(line: 12, column: 35, scope: !42)
!47 = !DILocation(line: 12, column: 42, scope: !42)
!48 = !DILocation(line: 12, column: 45, scope: !42)
!49 = !DILocation(line: 12, column: 31, scope: !42)
!50 = !DILocation(line: 12, column: 3, scope: !42)
!51 = distinct !{!51, !45, !52}
!52 = !DILocation(line: 12, column: 47, scope: !38)
!53 = !DILocalVariable(name: "p", scope: !54, file: !1, line: 16, type: !19)
!54 = distinct !DILexicalBlock(scope: !7, file: !1, line: 16, column: 3)
!55 = !DILocation(line: 16, column: 13, scope: !54)
!56 = !DILocation(line: 16, column: 8, scope: !54)
!57 = !DILocation(line: 16, column: 20, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !1, line: 16, column: 3)
!59 = !DILocation(line: 16, column: 22, scope: !58)
!60 = !DILocation(line: 16, column: 21, scope: !58)
!61 = !DILocation(line: 16, column: 27, scope: !58)
!62 = !DILocation(line: 16, column: 24, scope: !58)
!63 = !DILocation(line: 16, column: 3, scope: !54)
!64 = !DILocation(line: 17, column: 9, scope: !65)
!65 = distinct !DILexicalBlock(scope: !66, file: !1, line: 17, column: 9)
!66 = distinct !DILexicalBlock(scope: !58, file: !1, line: 16, column: 37)
!67 = !DILocation(line: 17, column: 16, scope: !65)
!68 = !DILocation(line: 17, column: 19, scope: !65)
!69 = !DILocation(line: 17, column: 9, scope: !66)
!70 = !DILocation(line: 18, column: 20, scope: !71)
!71 = distinct !DILexicalBlock(scope: !65, file: !1, line: 17, column: 24)
!72 = !DILocation(line: 18, column: 7, scope: !71)
!73 = !DILocation(line: 18, column: 14, scope: !71)
!74 = !DILocation(line: 18, column: 17, scope: !71)
!75 = !DILocation(line: 19, column: 7, scope: !71)
!76 = !DILocalVariable(name: "x", scope: !66, file: !1, line: 21, type: !19)
!77 = !DILocation(line: 21, column: 10, scope: !66)
!78 = !DILocation(line: 23, column: 12, scope: !79)
!79 = distinct !DILexicalBlock(scope: !66, file: !1, line: 23, column: 5)
!80 = !DILocation(line: 23, column: 10, scope: !79)
!81 = !DILocation(line: 23, column: 22, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !1, line: 23, column: 5)
!83 = !DILocation(line: 23, column: 24, scope: !82)
!84 = !DILocation(line: 23, column: 17, scope: !82)
!85 = !DILocation(line: 23, column: 32, scope: !82)
!86 = !DILocation(line: 23, column: 36, scope: !82)
!87 = !DILocation(line: 23, column: 35, scope: !82)
!88 = !DILocation(line: 23, column: 29, scope: !82)
!89 = !DILocation(line: 23, column: 5, scope: !79)
!90 = !DILocation(line: 24, column: 17, scope: !82)
!91 = !DILocation(line: 24, column: 24, scope: !82)
!92 = !DILocation(line: 24, column: 26, scope: !82)
!93 = !DILocation(line: 24, column: 19, scope: !82)
!94 = !DILocation(line: 24, column: 18, scope: !82)
!95 = !DILocation(line: 24, column: 12, scope: !82)
!96 = !DILocation(line: 24, column: 7, scope: !82)
!97 = !DILocation(line: 24, column: 15, scope: !82)
!98 = !DILocation(line: 23, column: 40, scope: !82)
!99 = !DILocation(line: 23, column: 5, scope: !82)
!100 = distinct !{!100, !89, !101}
!101 = !DILocation(line: 24, column: 29, scope: !79)
!102 = !DILocalVariable(name: "k", scope: !66, file: !1, line: 29, type: !19)
!103 = !DILocation(line: 29, column: 10, scope: !66)
!104 = !DILocation(line: 29, column: 13, scope: !66)
!105 = !DILocation(line: 29, column: 14, scope: !66)
!106 = !DILocalVariable(name: "n", scope: !107, file: !1, line: 30, type: !19)
!107 = distinct !DILexicalBlock(scope: !66, file: !1, line: 30, column: 5)
!108 = !DILocation(line: 30, column: 15, scope: !107)
!109 = !DILocation(line: 30, column: 19, scope: !107)
!110 = !DILocation(line: 30, column: 21, scope: !107)
!111 = !DILocation(line: 30, column: 20, scope: !107)
!112 = !DILocation(line: 30, column: 10, scope: !107)
!113 = !DILocation(line: 30, column: 24, scope: !114)
!114 = distinct !DILexicalBlock(scope: !107, file: !1, line: 30, column: 5)
!115 = !DILocation(line: 30, column: 29, scope: !114)
!116 = !DILocation(line: 30, column: 26, scope: !114)
!117 = !DILocation(line: 30, column: 5, scope: !107)
!118 = !DILocalVariable(name: "s", scope: !119, file: !1, line: 31, type: !19)
!119 = distinct !DILexicalBlock(scope: !114, file: !1, line: 30, column: 42)
!120 = !DILocation(line: 31, column: 12, scope: !119)
!121 = !DILocation(line: 31, column: 16, scope: !119)
!122 = !DILocation(line: 31, column: 15, scope: !119)
!123 = !DILocation(line: 32, column: 8, scope: !119)
!124 = !DILocation(line: 34, column: 12, scope: !125)
!125 = distinct !DILexicalBlock(scope: !119, file: !1, line: 34, column: 12)
!126 = !DILocation(line: 34, column: 13, scope: !125)
!127 = !DILocation(line: 34, column: 12, scope: !119)
!128 = !DILocalVariable(name: "i", scope: !129, file: !1, line: 35, type: !19)
!129 = distinct !DILexicalBlock(scope: !130, file: !1, line: 35, column: 9)
!130 = distinct !DILexicalBlock(scope: !125, file: !1, line: 34, column: 18)
!131 = !DILocation(line: 35, column: 19, scope: !129)
!132 = !DILocation(line: 35, column: 14, scope: !129)
!133 = !DILocation(line: 35, column: 26, scope: !134)
!134 = distinct !DILexicalBlock(scope: !129, file: !1, line: 35, column: 9)
!135 = !DILocation(line: 35, column: 30, scope: !134)
!136 = !DILocation(line: 35, column: 28, scope: !134)
!137 = !DILocation(line: 35, column: 32, scope: !134)
!138 = !DILocation(line: 35, column: 37, scope: !134)
!139 = !DILocation(line: 35, column: 44, scope: !134)
!140 = !DILocation(line: 35, column: 39, scope: !134)
!141 = !DILocation(line: 35, column: 38, scope: !134)
!142 = !DILocation(line: 35, column: 35, scope: !134)
!143 = !DILocation(line: 0, scope: !134)
!144 = !DILocation(line: 35, column: 9, scope: !129)
!145 = !DILocation(line: 35, column: 60, scope: !134)
!146 = !DILocation(line: 35, column: 54, scope: !134)
!147 = !DILocation(line: 35, column: 51, scope: !134)
!148 = !DILocation(line: 35, column: 9, scope: !134)
!149 = distinct !{!149, !144, !150}
!150 = !DILocation(line: 35, column: 64, scope: !129)
!151 = !DILocation(line: 36, column: 13, scope: !130)
!152 = !DILocation(line: 36, column: 11, scope: !130)
!153 = !DILocation(line: 36, column: 16, scope: !130)
!154 = !DILocation(line: 37, column: 20, scope: !119)
!155 = !DILocation(line: 37, column: 7, scope: !119)
!156 = !DILocation(line: 37, column: 14, scope: !119)
!157 = !DILocation(line: 37, column: 17, scope: !119)
!158 = !DILocation(line: 38, column: 5, scope: !119)
!159 = !DILocation(line: 30, column: 39, scope: !114)
!160 = !DILocation(line: 30, column: 36, scope: !114)
!161 = !DILocation(line: 30, column: 5, scope: !114)
!162 = distinct !{!162, !117, !163}
!163 = !DILocation(line: 38, column: 5, scope: !107)
!164 = !DILocation(line: 39, column: 3, scope: !66)
!165 = !DILocation(line: 16, column: 33, scope: !58)
!166 = !DILocation(line: 16, column: 3, scope: !58)
!167 = distinct !{!167, !63, !168}
!168 = !DILocation(line: 39, column: 3, scope: !54)
!169 = !DILocalVariable(name: "p", scope: !170, file: !1, line: 42, type: !19)
!170 = distinct !DILexicalBlock(scope: !7, file: !1, line: 42, column: 3)
!171 = !DILocation(line: 42, column: 13, scope: !170)
!172 = !DILocation(line: 42, column: 18, scope: !170)
!173 = !DILocation(line: 42, column: 22, scope: !170)
!174 = !DILocation(line: 42, column: 27, scope: !170)
!175 = !DILocation(line: 42, column: 8, scope: !170)
!176 = !DILocation(line: 42, column: 31, scope: !177)
!177 = distinct !DILexicalBlock(scope: !170, file: !1, line: 42, column: 3)
!178 = !DILocation(line: 42, column: 36, scope: !177)
!179 = !DILocation(line: 42, column: 33, scope: !177)
!180 = !DILocation(line: 42, column: 3, scope: !170)
!181 = !DILocation(line: 43, column: 9, scope: !182)
!182 = distinct !DILexicalBlock(scope: !183, file: !1, line: 43, column: 9)
!183 = distinct !DILexicalBlock(scope: !177, file: !1, line: 42, column: 46)
!184 = !DILocation(line: 43, column: 16, scope: !182)
!185 = !DILocation(line: 43, column: 19, scope: !182)
!186 = !DILocation(line: 43, column: 9, scope: !183)
!187 = !DILocation(line: 44, column: 20, scope: !188)
!188 = distinct !DILexicalBlock(scope: !182, file: !1, line: 43, column: 23)
!189 = !DILocation(line: 44, column: 7, scope: !188)
!190 = !DILocation(line: 44, column: 14, scope: !188)
!191 = !DILocation(line: 44, column: 17, scope: !188)
!192 = !DILocation(line: 44, column: 22, scope: !188)
!193 = !DILocation(line: 45, column: 3, scope: !183)
!194 = !DILocation(line: 42, column: 42, scope: !177)
!195 = !DILocation(line: 42, column: 3, scope: !177)
!196 = distinct !{!196, !180, !197}
!197 = !DILocation(line: 45, column: 3, scope: !170)
!198 = !DILocalVariable(name: "cnt", scope: !7, file: !1, line: 47, type: !19)
!199 = !DILocation(line: 47, column: 8, scope: !7)
!200 = !DILocalVariable(name: "a", scope: !201, file: !1, line: 48, type: !19)
!201 = distinct !DILexicalBlock(scope: !7, file: !1, line: 48, column: 3)
!202 = !DILocation(line: 48, column: 13, scope: !201)
!203 = !DILocation(line: 48, column: 8, scope: !201)
!204 = !DILocation(line: 48, column: 20, scope: !205)
!205 = distinct !DILexicalBlock(scope: !201, file: !1, line: 48, column: 3)
!206 = !DILocation(line: 48, column: 25, scope: !205)
!207 = !DILocation(line: 48, column: 22, scope: !205)
!208 = !DILocation(line: 48, column: 3, scope: !201)
!209 = !DILocalVariable(name: "b", scope: !210, file: !1, line: 49, type: !19)
!210 = distinct !DILexicalBlock(scope: !205, file: !1, line: 48, column: 35)
!211 = !DILocation(line: 49, column: 10, scope: !210)
!212 = !DILocation(line: 49, column: 14, scope: !210)
!213 = !DILocation(line: 49, column: 21, scope: !210)
!214 = !DILocation(line: 50, column: 9, scope: !215)
!215 = distinct !DILexicalBlock(scope: !210, file: !1, line: 50, column: 9)
!216 = !DILocation(line: 50, column: 13, scope: !215)
!217 = !DILocation(line: 50, column: 11, scope: !215)
!218 = !DILocation(line: 50, column: 15, scope: !215)
!219 = !DILocation(line: 50, column: 18, scope: !215)
!220 = !DILocation(line: 50, column: 23, scope: !215)
!221 = !DILocation(line: 50, column: 20, scope: !215)
!222 = !DILocation(line: 50, column: 27, scope: !215)
!223 = !DILocation(line: 50, column: 30, scope: !215)
!224 = !DILocation(line: 50, column: 37, scope: !215)
!225 = !DILocation(line: 50, column: 43, scope: !215)
!226 = !DILocation(line: 50, column: 40, scope: !215)
!227 = !DILocation(line: 50, column: 9, scope: !210)
!228 = !DILocation(line: 51, column: 25, scope: !229)
!229 = distinct !DILexicalBlock(scope: !215, file: !1, line: 50, column: 45)
!230 = !DILocation(line: 51, column: 28, scope: !229)
!231 = !DILocation(line: 51, column: 7, scope: !229)
!232 = !DILocation(line: 52, column: 10, scope: !229)
!233 = !DILocation(line: 52, column: 13, scope: !229)
!234 = !DILocation(line: 53, column: 3, scope: !210)
!235 = !DILocation(line: 48, column: 31, scope: !205)
!236 = !DILocation(line: 48, column: 3, scope: !205)
!237 = distinct !{!237, !208, !238}
!238 = !DILocation(line: 53, column: 3, scope: !201)
!239 = !DILocation(line: 54, column: 34, scope: !7)
!240 = !DILocation(line: 54, column: 38, scope: !7)
!241 = !DILocation(line: 54, column: 3, scope: !7)
!242 = !DILocation(line: 55, column: 3, scope: !7)
