; ModuleID = 'best-shuffle-1.ll'
source_filename = "best-shuffle-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"len == strlen(result)\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"best-shuffle-1.c\00", align 1
@__PRETTY_FUNCTION__.best_shuffle = private unnamed_addr constant [40 x i8] c"void best_shuffle(const char *, char *)\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"fmax > 0 && fmax <= len\00", align 1
@.str.3 = private unnamed_addr constant [22 x i8] c"grp > 0 && grp <= len\00", align 1
@.str.4 = private unnamed_addr constant [22 x i8] c"lng > 0 && lng <= len\00", align 1
@.str.5 = private unnamed_addr constant [20 x i8] c"len == strlen(txt2)\00", align 1
@__PRETTY_FUNCTION__.display = private unnamed_addr constant [41 x i8] c"void display(const char *, const char *)\00", align 1
@.str.6 = private unnamed_addr constant [14 x i8] c"%s, %s, (%u)\0A\00", align 1
@.str.7 = private unnamed_addr constant [12 x i8] c"abracadabra\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"seesaw\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"elk\00", align 1
@.str.10 = private unnamed_addr constant [8 x i8] c"grrrrrr\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"up\00", align 1
@.str.12 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.13 = private unnamed_addr constant [9 x i8] c"aabbbbaa\00", align 1
@.str.14 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"xxxxx\00", align 1
@__const.main.data = private unnamed_addr constant [9 x i8*] [i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i32 0, i32 0)], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @best_shuffle(i8* %txt, i8* %result) #0 !dbg !10 {
entry:
  %txt.addr = alloca i8*, align 8
  %result.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  %counts = alloca [255 x i64], align 16
  %fmax = alloca i64, align 8
  %i = alloca i64, align 8
  %fnew = alloca i64, align 8
  %ndx1 = alloca i64*, align 8
  %ch = alloca i64, align 8
  %i23 = alloca i64, align 8
  %j = alloca i64, align 8
  %ndx2 = alloca i64*, align 8
  %i52 = alloca i64, align 8
  %n = alloca i64, align 8
  %m = alloca i64, align 8
  %grp = alloca i64, align 8
  %lng = alloca i64, align 8
  %i86 = alloca i64, align 8
  %j87 = alloca i64, align 8
  %first = alloca i64, align 8
  %glen = alloca i64, align 8
  %k = alloca i64, align 8
  %i117 = alloca i64, align 8
  store i8* %txt, i8** %txt.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %txt.addr, metadata !17, metadata !DIExpression()), !dbg !18
  store i8* %result, i8** %result.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %result.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i64* %len, metadata !21, metadata !DIExpression()), !dbg !26
  %0 = load i8*, i8** %txt.addr, align 8, !dbg !27
  %call = call i64 @strlen(i8* %0) #8, !dbg !28
  store i64 %call, i64* %len, align 8, !dbg !26
  %1 = load i64, i64* %len, align 8, !dbg !29
  %cmp = icmp eq i64 %1, 0, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  br label %return, !dbg !33

if.end:                                           ; preds = %entry
  %2 = load i64, i64* %len, align 8, !dbg !34
  %3 = load i8*, i8** %result.addr, align 8, !dbg !34
  %call1 = call i64 @strlen(i8* %3) #8, !dbg !34
  %cmp2 = icmp eq i64 %2, %call1, !dbg !34
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !37

if.then3:                                         ; preds = %if.end
  br label %if.end4, !dbg !37

if.else:                                          ; preds = %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 16, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__PRETTY_FUNCTION__.best_shuffle, i64 0, i64 0)) #9, !dbg !34
  unreachable, !dbg !34

if.end4:                                          ; preds = %if.then3
  call void @llvm.dbg.declare(metadata [255 x i64]* %counts, metadata !38, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [255 x i64], [255 x i64]* %counts, i64 0, i64 0, !dbg !43
  %4 = bitcast i64* %arraydecay to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 1020, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %fmax, metadata !44, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %fmax, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !48
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.end4
  %5 = load i64, i64* %i, align 8, !dbg !50
  %6 = load i64, i64* %len, align 8, !dbg !52
  %cmp5 = icmp ult i64 %5, %6, !dbg !53
  br i1 %cmp5, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %txt.addr, align 8, !dbg !55
  %8 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !55
  %9 = load i8, i8* %arrayidx, align 1, !dbg !55
  %idxprom = zext i8 %9 to i64, !dbg !58
  %arrayidx6 = getelementptr inbounds [255 x i64], [255 x i64]* %counts, i64 0, i64 %idxprom, !dbg !58
  %10 = load i64, i64* %arrayidx6, align 8, !dbg !59
  %inc = add i64 %10, 1, !dbg !59
  store i64 %inc, i64* %arrayidx6, align 8, !dbg !59
  call void @llvm.dbg.declare(metadata i64* %fnew, metadata !60, metadata !DIExpression()), !dbg !61
  %11 = load i8*, i8** %txt.addr, align 8, !dbg !62
  %12 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx7 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !62
  %13 = load i8, i8* %arrayidx7, align 1, !dbg !62
  %idxprom8 = zext i8 %13 to i64, !dbg !64
  %arrayidx9 = getelementptr inbounds [255 x i64], [255 x i64]* %counts, i64 0, i64 %idxprom8, !dbg !64
  %14 = load i64, i64* %arrayidx9, align 8, !dbg !64
  store i64 %14, i64* %fnew, align 8, !dbg !61
  %15 = load i64, i64* %fmax, align 8, !dbg !65
  %16 = load i64, i64* %fnew, align 8, !dbg !67
  %cmp10 = icmp ult i64 %15, %16, !dbg !68
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !69

if.then11:                                        ; preds = %for.body
  %17 = load i64, i64* %fnew, align 8, !dbg !70
  store i64 %17, i64* %fmax, align 8, !dbg !71
  br label %if.end12, !dbg !72

if.end12:                                         ; preds = %if.then11, %for.body
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %if.end12
  %18 = load i64, i64* %i, align 8, !dbg !74
  %inc13 = add i64 %18, 1, !dbg !74
  store i64 %inc13, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %19 = load i64, i64* %fmax, align 8, !dbg !78
  %cmp14 = icmp ugt i64 %19, 0, !dbg !78
  br i1 %cmp14, label %land.lhs.true, label %if.else17, !dbg !78

land.lhs.true:                                    ; preds = %for.end
  %20 = load i64, i64* %fmax, align 8, !dbg !78
  %21 = load i64, i64* %len, align 8, !dbg !78
  %cmp15 = icmp ule i64 %20, %21, !dbg !78
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !81

if.then16:                                        ; preds = %land.lhs.true
  br label %if.end18, !dbg !81

if.else17:                                        ; preds = %land.lhs.true, %for.end
  call void @__assert_fail(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 29, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__PRETTY_FUNCTION__.best_shuffle, i64 0, i64 0)) #9, !dbg !78
  unreachable, !dbg !78

if.end18:                                         ; preds = %if.then16
  call void @llvm.dbg.declare(metadata i64** %ndx1, metadata !82, metadata !DIExpression()), !dbg !84
  %22 = load i64, i64* %len, align 8, !dbg !85
  %mul = mul i64 %22, 8, !dbg !86
  %call19 = call noalias i8* @malloc(i64 %mul) #7, !dbg !87
  %23 = bitcast i8* %call19 to i64*, !dbg !87
  store i64* %23, i64** %ndx1, align 8, !dbg !84
  %24 = load i64*, i64** %ndx1, align 8, !dbg !88
  %cmp20 = icmp eq i64* %24, null, !dbg !90
  br i1 %cmp20, label %if.then21, label %if.end22, !dbg !91

if.then21:                                        ; preds = %if.end18
  call void @exit(i32 1) #9, !dbg !92
  unreachable, !dbg !92

if.end22:                                         ; preds = %if.end18
  call void @llvm.dbg.declare(metadata i64* %ch, metadata !93, metadata !DIExpression()), !dbg !95
  store i64 0, i64* %ch, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i64* %i23, metadata !96, metadata !DIExpression()), !dbg !97
  store i64 0, i64* %i23, align 8, !dbg !97
  br label %for.cond24, !dbg !98

for.cond24:                                       ; preds = %for.inc43, %if.end22
  %25 = load i64, i64* %ch, align 8, !dbg !99
  %cmp25 = icmp ult i64 %25, 255, !dbg !101
  br i1 %cmp25, label %for.body26, label %for.end45, !dbg !102

for.body26:                                       ; preds = %for.cond24
  %26 = load i64, i64* %ch, align 8, !dbg !103
  %arrayidx27 = getelementptr inbounds [255 x i64], [255 x i64]* %counts, i64 0, i64 %26, !dbg !105
  %27 = load i64, i64* %arrayidx27, align 8, !dbg !105
  %tobool = icmp ne i64 %27, 0, !dbg !105
  br i1 %tobool, label %if.then28, label %if.end42, !dbg !106

if.then28:                                        ; preds = %for.body26
  call void @llvm.dbg.declare(metadata i64* %j, metadata !107, metadata !DIExpression()), !dbg !109
  store i64 0, i64* %j, align 8, !dbg !109
  br label %for.cond29, !dbg !110

for.cond29:                                       ; preds = %for.inc39, %if.then28
  %28 = load i64, i64* %j, align 8, !dbg !111
  %29 = load i64, i64* %len, align 8, !dbg !113
  %cmp30 = icmp ult i64 %28, %29, !dbg !114
  br i1 %cmp30, label %for.body31, label %for.end41, !dbg !115

for.body31:                                       ; preds = %for.cond29
  %30 = load i64, i64* %ch, align 8, !dbg !116
  %31 = load i8*, i8** %txt.addr, align 8, !dbg !118
  %32 = load i64, i64* %j, align 8, !dbg !119
  %arrayidx32 = getelementptr inbounds i8, i8* %31, i64 %32, !dbg !118
  %33 = load i8, i8* %arrayidx32, align 1, !dbg !118
  %conv = zext i8 %33 to i64, !dbg !120
  %cmp33 = icmp eq i64 %30, %conv, !dbg !121
  br i1 %cmp33, label %if.then35, label %if.end38, !dbg !122

if.then35:                                        ; preds = %for.body31
  %34 = load i64, i64* %j, align 8, !dbg !123
  %35 = load i64*, i64** %ndx1, align 8, !dbg !125
  %36 = load i64, i64* %i23, align 8, !dbg !126
  %arrayidx36 = getelementptr inbounds i64, i64* %35, i64 %36, !dbg !125
  store i64 %34, i64* %arrayidx36, align 8, !dbg !127
  %37 = load i64, i64* %i23, align 8, !dbg !128
  %inc37 = add i64 %37, 1, !dbg !128
  store i64 %inc37, i64* %i23, align 8, !dbg !128
  br label %if.end38, !dbg !129

if.end38:                                         ; preds = %if.then35, %for.body31
  br label %for.inc39, !dbg !130

for.inc39:                                        ; preds = %if.end38
  %38 = load i64, i64* %j, align 8, !dbg !131
  %inc40 = add i64 %38, 1, !dbg !131
  store i64 %inc40, i64* %j, align 8, !dbg !131
  br label %for.cond29, !dbg !132, !llvm.loop !133

for.end41:                                        ; preds = %for.cond29
  br label %if.end42, !dbg !134

if.end42:                                         ; preds = %for.end41, %for.body26
  br label %for.inc43, !dbg !135

for.inc43:                                        ; preds = %if.end42
  %39 = load i64, i64* %ch, align 8, !dbg !136
  %inc44 = add i64 %39, 1, !dbg !136
  store i64 %inc44, i64* %ch, align 8, !dbg !136
  br label %for.cond24, !dbg !137, !llvm.loop !138

for.end45:                                        ; preds = %for.cond24
  call void @llvm.dbg.declare(metadata i64** %ndx2, metadata !140, metadata !DIExpression()), !dbg !141
  %40 = load i64, i64* %len, align 8, !dbg !142
  %mul46 = mul i64 %40, 8, !dbg !143
  %call47 = call noalias i8* @malloc(i64 %mul46) #7, !dbg !144
  %41 = bitcast i8* %call47 to i64*, !dbg !144
  store i64* %41, i64** %ndx2, align 8, !dbg !141
  %42 = load i64*, i64** %ndx2, align 8, !dbg !145
  %cmp48 = icmp eq i64* %42, null, !dbg !147
  br i1 %cmp48, label %if.then50, label %if.end51, !dbg !148

if.then50:                                        ; preds = %for.end45
  call void @exit(i32 1) #9, !dbg !149
  unreachable, !dbg !149

if.end51:                                         ; preds = %for.end45
  call void @llvm.dbg.declare(metadata i64* %i52, metadata !150, metadata !DIExpression()), !dbg !152
  store i64 0, i64* %i52, align 8, !dbg !152
  call void @llvm.dbg.declare(metadata i64* %n, metadata !153, metadata !DIExpression()), !dbg !154
  store i64 0, i64* %n, align 8, !dbg !154
  call void @llvm.dbg.declare(metadata i64* %m, metadata !155, metadata !DIExpression()), !dbg !156
  store i64 0, i64* %m, align 8, !dbg !156
  br label %for.cond53, !dbg !157

for.cond53:                                       ; preds = %for.inc64, %if.end51
  %43 = load i64, i64* %i52, align 8, !dbg !158
  %44 = load i64, i64* %len, align 8, !dbg !160
  %cmp54 = icmp ult i64 %43, %44, !dbg !161
  br i1 %cmp54, label %for.body56, label %for.end66, !dbg !162

for.body56:                                       ; preds = %for.cond53
  %45 = load i64*, i64** %ndx1, align 8, !dbg !163
  %46 = load i64, i64* %n, align 8, !dbg !165
  %arrayidx57 = getelementptr inbounds i64, i64* %45, i64 %46, !dbg !163
  %47 = load i64, i64* %arrayidx57, align 8, !dbg !163
  %48 = load i64*, i64** %ndx2, align 8, !dbg !166
  %49 = load i64, i64* %i52, align 8, !dbg !167
  %arrayidx58 = getelementptr inbounds i64, i64* %48, i64 %49, !dbg !166
  store i64 %47, i64* %arrayidx58, align 8, !dbg !168
  %50 = load i64, i64* %fmax, align 8, !dbg !169
  %51 = load i64, i64* %n, align 8, !dbg !170
  %add = add i64 %51, %50, !dbg !170
  store i64 %add, i64* %n, align 8, !dbg !170
  %52 = load i64, i64* %n, align 8, !dbg !171
  %53 = load i64, i64* %len, align 8, !dbg !173
  %cmp59 = icmp uge i64 %52, %53, !dbg !174
  br i1 %cmp59, label %if.then61, label %if.end63, !dbg !175

if.then61:                                        ; preds = %for.body56
  %54 = load i64, i64* %m, align 8, !dbg !176
  %inc62 = add i64 %54, 1, !dbg !176
  store i64 %inc62, i64* %m, align 8, !dbg !176
  %55 = load i64, i64* %m, align 8, !dbg !178
  store i64 %55, i64* %n, align 8, !dbg !179
  br label %if.end63, !dbg !180

if.end63:                                         ; preds = %if.then61, %for.body56
  br label %for.inc64, !dbg !181

for.inc64:                                        ; preds = %if.end63
  %56 = load i64, i64* %i52, align 8, !dbg !182
  %inc65 = add i64 %56, 1, !dbg !182
  store i64 %inc65, i64* %i52, align 8, !dbg !182
  br label %for.cond53, !dbg !183, !llvm.loop !184

for.end66:                                        ; preds = %for.cond53
  call void @llvm.dbg.declare(metadata i64* %grp, metadata !186, metadata !DIExpression()), !dbg !187
  %57 = load i64, i64* %len, align 8, !dbg !188
  %sub = sub i64 %57, 1, !dbg !189
  %58 = load i64, i64* %fmax, align 8, !dbg !190
  %div = udiv i64 %sub, %58, !dbg !191
  %add67 = add i64 1, %div, !dbg !192
  store i64 %add67, i64* %grp, align 8, !dbg !187
  %59 = load i64, i64* %grp, align 8, !dbg !193
  %cmp68 = icmp ugt i64 %59, 0, !dbg !193
  br i1 %cmp68, label %land.lhs.true70, label %if.else74, !dbg !193

land.lhs.true70:                                  ; preds = %for.end66
  %60 = load i64, i64* %grp, align 8, !dbg !193
  %61 = load i64, i64* %len, align 8, !dbg !193
  %cmp71 = icmp ule i64 %60, %61, !dbg !193
  br i1 %cmp71, label %if.then73, label %if.else74, !dbg !196

if.then73:                                        ; preds = %land.lhs.true70
  br label %if.end75, !dbg !196

if.else74:                                        ; preds = %land.lhs.true70, %for.end66
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 58, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__PRETTY_FUNCTION__.best_shuffle, i64 0, i64 0)) #9, !dbg !193
  unreachable, !dbg !193

if.end75:                                         ; preds = %if.then73
  call void @llvm.dbg.declare(metadata i64* %lng, metadata !197, metadata !DIExpression()), !dbg !198
  %62 = load i64, i64* %len, align 8, !dbg !199
  %sub76 = sub i64 %62, 1, !dbg !200
  %63 = load i64, i64* %fmax, align 8, !dbg !201
  %rem = urem i64 %sub76, %63, !dbg !202
  %add77 = add i64 1, %rem, !dbg !203
  store i64 %add77, i64* %lng, align 8, !dbg !198
  %64 = load i64, i64* %lng, align 8, !dbg !204
  %cmp78 = icmp ugt i64 %64, 0, !dbg !204
  br i1 %cmp78, label %land.lhs.true80, label %if.else84, !dbg !204

land.lhs.true80:                                  ; preds = %if.end75
  %65 = load i64, i64* %lng, align 8, !dbg !204
  %66 = load i64, i64* %len, align 8, !dbg !204
  %cmp81 = icmp ule i64 %65, %66, !dbg !204
  br i1 %cmp81, label %if.then83, label %if.else84, !dbg !207

if.then83:                                        ; preds = %land.lhs.true80
  br label %if.end85, !dbg !207

if.else84:                                        ; preds = %land.lhs.true80, %if.end75
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 62, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__PRETTY_FUNCTION__.best_shuffle, i64 0, i64 0)) #9, !dbg !204
  unreachable, !dbg !204

if.end85:                                         ; preds = %if.then83
  call void @llvm.dbg.declare(metadata i64* %i86, metadata !208, metadata !DIExpression()), !dbg !210
  store i64 0, i64* %i86, align 8, !dbg !210
  call void @llvm.dbg.declare(metadata i64* %j87, metadata !211, metadata !DIExpression()), !dbg !212
  store i64 0, i64* %j87, align 8, !dbg !212
  br label %for.cond88, !dbg !213

for.cond88:                                       ; preds = %for.inc113, %if.end85
  %67 = load i64, i64* %i86, align 8, !dbg !214
  %68 = load i64, i64* %fmax, align 8, !dbg !216
  %cmp89 = icmp ult i64 %67, %68, !dbg !217
  br i1 %cmp89, label %for.body91, label %for.end115, !dbg !218

for.body91:                                       ; preds = %for.cond88
  call void @llvm.dbg.declare(metadata i64* %first, metadata !219, metadata !DIExpression()), !dbg !221
  %69 = load i64*, i64** %ndx2, align 8, !dbg !222
  %70 = load i64, i64* %j87, align 8, !dbg !223
  %arrayidx92 = getelementptr inbounds i64, i64* %69, i64 %70, !dbg !222
  %71 = load i64, i64* %arrayidx92, align 8, !dbg !222
  store i64 %71, i64* %first, align 8, !dbg !221
  call void @llvm.dbg.declare(metadata i64* %glen, metadata !224, metadata !DIExpression()), !dbg !225
  %72 = load i64, i64* %grp, align 8, !dbg !226
  %73 = load i64, i64* %i86, align 8, !dbg !227
  %74 = load i64, i64* %lng, align 8, !dbg !228
  %cmp93 = icmp ult i64 %73, %74, !dbg !229
  %75 = zext i1 %cmp93 to i64, !dbg !227
  %cond = select i1 %cmp93, i32 0, i32 1, !dbg !227
  %conv95 = sext i32 %cond to i64, !dbg !230
  %sub96 = sub i64 %72, %conv95, !dbg !231
  store i64 %sub96, i64* %glen, align 8, !dbg !225
  call void @llvm.dbg.declare(metadata i64* %k, metadata !232, metadata !DIExpression()), !dbg !234
  store i64 1, i64* %k, align 8, !dbg !234
  br label %for.cond97, !dbg !235

for.cond97:                                       ; preds = %for.inc106, %for.body91
  %76 = load i64, i64* %k, align 8, !dbg !236
  %77 = load i64, i64* %glen, align 8, !dbg !238
  %cmp98 = icmp ult i64 %76, %77, !dbg !239
  br i1 %cmp98, label %for.body100, label %for.end108, !dbg !240

for.body100:                                      ; preds = %for.cond97
  %78 = load i64*, i64** %ndx2, align 8, !dbg !241
  %79 = load i64, i64* %j87, align 8, !dbg !242
  %80 = load i64, i64* %k, align 8, !dbg !243
  %add101 = add i64 %79, %80, !dbg !244
  %arrayidx102 = getelementptr inbounds i64, i64* %78, i64 %add101, !dbg !241
  %81 = load i64, i64* %arrayidx102, align 8, !dbg !241
  %82 = load i64*, i64** %ndx1, align 8, !dbg !245
  %83 = load i64, i64* %j87, align 8, !dbg !246
  %84 = load i64, i64* %k, align 8, !dbg !247
  %add103 = add i64 %83, %84, !dbg !248
  %sub104 = sub i64 %add103, 1, !dbg !249
  %arrayidx105 = getelementptr inbounds i64, i64* %82, i64 %sub104, !dbg !245
  store i64 %81, i64* %arrayidx105, align 8, !dbg !250
  br label %for.inc106, !dbg !245

for.inc106:                                       ; preds = %for.body100
  %85 = load i64, i64* %k, align 8, !dbg !251
  %inc107 = add i64 %85, 1, !dbg !251
  store i64 %inc107, i64* %k, align 8, !dbg !251
  br label %for.cond97, !dbg !252, !llvm.loop !253

for.end108:                                       ; preds = %for.cond97
  %86 = load i64, i64* %first, align 8, !dbg !255
  %87 = load i64*, i64** %ndx1, align 8, !dbg !256
  %88 = load i64, i64* %j87, align 8, !dbg !257
  %89 = load i64, i64* %glen, align 8, !dbg !258
  %add109 = add i64 %88, %89, !dbg !259
  %sub110 = sub i64 %add109, 1, !dbg !260
  %arrayidx111 = getelementptr inbounds i64, i64* %87, i64 %sub110, !dbg !256
  store i64 %86, i64* %arrayidx111, align 8, !dbg !261
  %90 = load i64, i64* %glen, align 8, !dbg !262
  %91 = load i64, i64* %j87, align 8, !dbg !263
  %add112 = add i64 %91, %90, !dbg !263
  store i64 %add112, i64* %j87, align 8, !dbg !263
  br label %for.inc113, !dbg !264

for.inc113:                                       ; preds = %for.end108
  %92 = load i64, i64* %i86, align 8, !dbg !265
  %inc114 = add i64 %92, 1, !dbg !265
  store i64 %inc114, i64* %i86, align 8, !dbg !265
  br label %for.cond88, !dbg !266, !llvm.loop !267

for.end115:                                       ; preds = %for.cond88
  %93 = load i8*, i8** %result.addr, align 8, !dbg !269
  %94 = load i64, i64* %len, align 8, !dbg !270
  %arrayidx116 = getelementptr inbounds i8, i8* %93, i64 %94, !dbg !269
  store i8 0, i8* %arrayidx116, align 1, !dbg !271
  call void @llvm.dbg.declare(metadata i64* %i117, metadata !272, metadata !DIExpression()), !dbg !274
  store i64 0, i64* %i117, align 8, !dbg !274
  br label %for.cond118, !dbg !275

for.cond118:                                      ; preds = %for.inc126, %for.end115
  %95 = load i64, i64* %i117, align 8, !dbg !276
  %96 = load i64, i64* %len, align 8, !dbg !278
  %cmp119 = icmp ult i64 %95, %96, !dbg !279
  br i1 %cmp119, label %for.body121, label %for.end128, !dbg !280

for.body121:                                      ; preds = %for.cond118
  %97 = load i8*, i8** %txt.addr, align 8, !dbg !281
  %98 = load i64*, i64** %ndx1, align 8, !dbg !282
  %99 = load i64, i64* %i117, align 8, !dbg !283
  %arrayidx122 = getelementptr inbounds i64, i64* %98, i64 %99, !dbg !282
  %100 = load i64, i64* %arrayidx122, align 8, !dbg !282
  %arrayidx123 = getelementptr inbounds i8, i8* %97, i64 %100, !dbg !281
  %101 = load i8, i8* %arrayidx123, align 1, !dbg !281
  %102 = load i8*, i8** %result.addr, align 8, !dbg !284
  %103 = load i64*, i64** %ndx2, align 8, !dbg !285
  %104 = load i64, i64* %i117, align 8, !dbg !286
  %arrayidx124 = getelementptr inbounds i64, i64* %103, i64 %104, !dbg !285
  %105 = load i64, i64* %arrayidx124, align 8, !dbg !285
  %arrayidx125 = getelementptr inbounds i8, i8* %102, i64 %105, !dbg !284
  store i8 %101, i8* %arrayidx125, align 1, !dbg !287
  br label %for.inc126, !dbg !284

for.inc126:                                       ; preds = %for.body121
  %106 = load i64, i64* %i117, align 8, !dbg !288
  %inc127 = add i64 %106, 1, !dbg !288
  store i64 %inc127, i64* %i117, align 8, !dbg !288
  br label %for.cond118, !dbg !289, !llvm.loop !290

for.end128:                                       ; preds = %for.cond118
  %107 = load i64*, i64** %ndx1, align 8, !dbg !292
  %108 = bitcast i64* %107 to i8*, !dbg !292
  call void @free(i8* %108) #7, !dbg !293
  %109 = load i64*, i64** %ndx2, align 8, !dbg !294
  %110 = bitcast i64* %109 to i8*, !dbg !294
  call void @free(i8* %110) #7, !dbg !295
  br label %return, !dbg !296

return:                                           ; preds = %for.end128, %if.then
  ret void, !dbg !296
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @display(i8* %txt1, i8* %txt2) #0 !dbg !297 {
entry:
  %txt1.addr = alloca i8*, align 8
  %txt2.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  %score = alloca i32, align 4
  %i = alloca i64, align 8
  store i8* %txt1, i8** %txt1.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %txt1.addr, metadata !300, metadata !DIExpression()), !dbg !301
  store i8* %txt2, i8** %txt2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %txt2.addr, metadata !302, metadata !DIExpression()), !dbg !303
  call void @llvm.dbg.declare(metadata i64* %len, metadata !304, metadata !DIExpression()), !dbg !305
  %0 = load i8*, i8** %txt1.addr, align 8, !dbg !306
  %call = call i64 @strlen(i8* %0) #8, !dbg !307
  store i64 %call, i64* %len, align 8, !dbg !305
  %1 = load i64, i64* %len, align 8, !dbg !308
  %2 = load i8*, i8** %txt2.addr, align 8, !dbg !308
  %call1 = call i64 @strlen(i8* %2) #8, !dbg !308
  %cmp = icmp eq i64 %1, %call1, !dbg !308
  br i1 %cmp, label %if.then, label %if.else, !dbg !311

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !311

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 85, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__PRETTY_FUNCTION__.display, i64 0, i64 0)) #9, !dbg !308
  unreachable, !dbg !308

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i32* %score, metadata !312, metadata !DIExpression()), !dbg !314
  store i32 0, i32* %score, align 4, !dbg !314
  call void @llvm.dbg.declare(metadata i64* %i, metadata !315, metadata !DIExpression()), !dbg !317
  store i64 0, i64* %i, align 8, !dbg !317
  br label %for.cond, !dbg !318

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !319
  %4 = load i64, i64* %len, align 8, !dbg !321
  %cmp2 = icmp ult i64 %3, %4, !dbg !322
  br i1 %cmp2, label %for.body, label %for.end, !dbg !323

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %txt1.addr, align 8, !dbg !324
  %6 = load i64, i64* %i, align 8, !dbg !326
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !324
  %7 = load i8, i8* %arrayidx, align 1, !dbg !324
  %conv = sext i8 %7 to i32, !dbg !324
  %8 = load i8*, i8** %txt2.addr, align 8, !dbg !327
  %9 = load i64, i64* %i, align 8, !dbg !328
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !327
  %10 = load i8, i8* %arrayidx3, align 1, !dbg !327
  %conv4 = sext i8 %10 to i32, !dbg !327
  %cmp5 = icmp eq i32 %conv, %conv4, !dbg !329
  br i1 %cmp5, label %if.then7, label %if.end8, !dbg !330

if.then7:                                         ; preds = %for.body
  %11 = load i32, i32* %score, align 4, !dbg !331
  %inc = add nsw i32 %11, 1, !dbg !331
  store i32 %inc, i32* %score, align 4, !dbg !331
  br label %if.end8, !dbg !332

if.end8:                                          ; preds = %if.then7, %for.body
  br label %for.inc, !dbg !333

for.inc:                                          ; preds = %if.end8
  %12 = load i64, i64* %i, align 8, !dbg !334
  %inc9 = add i64 %12, 1, !dbg !334
  store i64 %inc9, i64* %i, align 8, !dbg !334
  br label %for.cond, !dbg !335, !llvm.loop !336

for.end:                                          ; preds = %for.cond
  %13 = load i8*, i8** %txt1.addr, align 8, !dbg !338
  %14 = load i8*, i8** %txt2.addr, align 8, !dbg !339
  %15 = load i32, i32* %score, align 4, !dbg !340
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.6, i64 0, i64 0), i8* %13, i8* %14, i32 %15), !dbg !341
  ret void, !dbg !342
}

declare dso_local i32 @printf(i8*, ...) #6

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !343 {
entry:
  %retval = alloca i32, align 4
  %data = alloca [9 x i8*], align 16
  %data_len = alloca i64, align 8
  %i = alloca i64, align 8
  %shuf_len = alloca i64, align 8
  %saved_stack = alloca i8*, align 8
  %__vla_expr0 = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [9 x i8*]* %data, metadata !346, metadata !DIExpression()), !dbg !350
  %0 = bitcast [9 x i8*]* %data to i8*, !dbg !350
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([9 x i8*]* @__const.main.data to i8*), i64 72, i1 false), !dbg !350
  call void @llvm.dbg.declare(metadata i64* %data_len, metadata !351, metadata !DIExpression()), !dbg !352
  store i64 9, i64* %data_len, align 8, !dbg !352
  call void @llvm.dbg.declare(metadata i64* %i, metadata !353, metadata !DIExpression()), !dbg !355
  store i64 0, i64* %i, align 8, !dbg !355
  br label %for.cond, !dbg !356

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !357
  %cmp = icmp ult i64 %1, 9, !dbg !359
  br i1 %cmp, label %for.body, label %for.end, !dbg !360

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %shuf_len, metadata !361, metadata !DIExpression()), !dbg !363
  %2 = load i64, i64* %i, align 8, !dbg !364
  %arrayidx = getelementptr inbounds [9 x i8*], [9 x i8*]* %data, i64 0, i64 %2, !dbg !365
  %3 = load i8*, i8** %arrayidx, align 8, !dbg !365
  %call = call i64 @strlen(i8* %3) #8, !dbg !366
  %add = add i64 %call, 1, !dbg !367
  store i64 %add, i64* %shuf_len, align 8, !dbg !363
  %4 = load i64, i64* %shuf_len, align 8, !dbg !368
  %5 = call i8* @llvm.stacksave(), !dbg !369
  store i8* %5, i8** %saved_stack, align 8, !dbg !369
  %vla = alloca i8, i64 %4, align 16, !dbg !369
  store i64 %4, i64* %__vla_expr0, align 8, !dbg !369
  call void @llvm.dbg.declare(metadata i64* %__vla_expr0, metadata !370, metadata !DIExpression()), !dbg !371
  call void @llvm.dbg.declare(metadata i8* %vla, metadata !372, metadata !DIExpression()), !dbg !376
  call void @llvm.memset.p0i8.i64(i8* align 16 %vla, i8 -1, i64 %4, i1 false), !dbg !377
  %6 = load i64, i64* %shuf_len, align 8, !dbg !378
  %sub = sub i64 %6, 1, !dbg !379
  %arrayidx1 = getelementptr inbounds i8, i8* %vla, i64 %sub, !dbg !380
  store i8 0, i8* %arrayidx1, align 1, !dbg !381
  %7 = load i64, i64* %i, align 8, !dbg !382
  %arrayidx2 = getelementptr inbounds [9 x i8*], [9 x i8*]* %data, i64 0, i64 %7, !dbg !383
  %8 = load i8*, i8** %arrayidx2, align 8, !dbg !383
  call void @best_shuffle(i8* %8, i8* %vla), !dbg !384
  %9 = load i64, i64* %i, align 8, !dbg !385
  %arrayidx3 = getelementptr inbounds [9 x i8*], [9 x i8*]* %data, i64 0, i64 %9, !dbg !386
  %10 = load i8*, i8** %arrayidx3, align 8, !dbg !386
  call void @display(i8* %10, i8* %vla), !dbg !387
  %11 = load i8*, i8** %saved_stack, align 8, !dbg !388
  call void @llvm.stackrestore(i8* %11), !dbg !388
  br label %for.inc, !dbg !389

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !390
  %inc = add i64 %12, 1, !dbg !390
  store i64 %inc, i64* %i, align 8, !dbg !390
  br label %for.cond, !dbg !391, !llvm.loop !392

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !394
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #7

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #7

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "best-shuffle-1.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Best-shuffle")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!10 = distinct !DISubprogram(name: "best_shuffle", scope: !1, file: !1, line: 9, type: !11, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13, !16}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!17 = !DILocalVariable(name: "txt", arg: 1, scope: !10, file: !1, line: 9, type: !13)
!18 = !DILocation(line: 9, column: 31, scope: !10)
!19 = !DILocalVariable(name: "result", arg: 2, scope: !10, file: !1, line: 9, type: !16)
!20 = !DILocation(line: 9, column: 42, scope: !10)
!21 = !DILocalVariable(name: "len", scope: !10, file: !1, line: 10, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !24, line: 46, baseType: !25)
!24 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!25 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!26 = !DILocation(line: 10, column: 18, scope: !10)
!27 = !DILocation(line: 10, column: 31, scope: !10)
!28 = !DILocation(line: 10, column: 24, scope: !10)
!29 = !DILocation(line: 11, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !10, file: !1, line: 11, column: 9)
!31 = !DILocation(line: 11, column: 13, scope: !30)
!32 = !DILocation(line: 11, column: 9, scope: !10)
!33 = !DILocation(line: 12, column: 9, scope: !30)
!34 = !DILocation(line: 16, column: 5, scope: !35)
!35 = distinct !DILexicalBlock(scope: !36, file: !1, line: 16, column: 5)
!36 = distinct !DILexicalBlock(scope: !10, file: !1, line: 16, column: 5)
!37 = !DILocation(line: 16, column: 5, scope: !36)
!38 = !DILocalVariable(name: "counts", scope: !10, file: !1, line: 20, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 16320, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 255)
!42 = !DILocation(line: 20, column: 12, scope: !10)
!43 = !DILocation(line: 21, column: 5, scope: !10)
!44 = !DILocalVariable(name: "fmax", scope: !10, file: !1, line: 22, type: !23)
!45 = !DILocation(line: 22, column: 12, scope: !10)
!46 = !DILocalVariable(name: "i", scope: !47, file: !1, line: 23, type: !23)
!47 = distinct !DILexicalBlock(scope: !10, file: !1, line: 23, column: 5)
!48 = !DILocation(line: 23, column: 17, scope: !47)
!49 = !DILocation(line: 23, column: 10, scope: !47)
!50 = !DILocation(line: 23, column: 24, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 23, column: 5)
!52 = !DILocation(line: 23, column: 28, scope: !51)
!53 = !DILocation(line: 23, column: 26, scope: !51)
!54 = !DILocation(line: 23, column: 5, scope: !47)
!55 = !DILocation(line: 24, column: 31, scope: !56)
!56 = distinct !DILexicalBlock(scope: !51, file: !1, line: 23, column: 38)
!57 = !DILocation(line: 24, column: 35, scope: !56)
!58 = !DILocation(line: 24, column: 9, scope: !56)
!59 = !DILocation(line: 24, column: 38, scope: !56)
!60 = !DILocalVariable(name: "fnew", scope: !56, file: !1, line: 25, type: !22)
!61 = !DILocation(line: 25, column: 22, scope: !56)
!62 = !DILocation(line: 25, column: 51, scope: !56)
!63 = !DILocation(line: 25, column: 55, scope: !56)
!64 = !DILocation(line: 25, column: 29, scope: !56)
!65 = !DILocation(line: 26, column: 13, scope: !66)
!66 = distinct !DILexicalBlock(scope: !56, file: !1, line: 26, column: 13)
!67 = !DILocation(line: 26, column: 20, scope: !66)
!68 = !DILocation(line: 26, column: 18, scope: !66)
!69 = !DILocation(line: 26, column: 13, scope: !56)
!70 = !DILocation(line: 27, column: 21, scope: !66)
!71 = !DILocation(line: 27, column: 19, scope: !66)
!72 = !DILocation(line: 27, column: 14, scope: !66)
!73 = !DILocation(line: 28, column: 5, scope: !56)
!74 = !DILocation(line: 23, column: 34, scope: !51)
!75 = !DILocation(line: 23, column: 5, scope: !51)
!76 = distinct !{!76, !54, !77}
!77 = !DILocation(line: 28, column: 5, scope: !47)
!78 = !DILocation(line: 29, column: 5, scope: !79)
!79 = distinct !DILexicalBlock(scope: !80, file: !1, line: 29, column: 5)
!80 = distinct !DILexicalBlock(scope: !10, file: !1, line: 29, column: 5)
!81 = !DILocation(line: 29, column: 5, scope: !80)
!82 = !DILocalVariable(name: "ndx1", scope: !10, file: !1, line: 32, type: !83)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!84 = !DILocation(line: 32, column: 13, scope: !10)
!85 = !DILocation(line: 32, column: 27, scope: !10)
!86 = !DILocation(line: 32, column: 31, scope: !10)
!87 = !DILocation(line: 32, column: 20, scope: !10)
!88 = !DILocation(line: 33, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !10, file: !1, line: 33, column: 9)
!90 = !DILocation(line: 33, column: 14, scope: !89)
!91 = !DILocation(line: 33, column: 9, scope: !10)
!92 = !DILocation(line: 34, column: 9, scope: !89)
!93 = !DILocalVariable(name: "ch", scope: !94, file: !1, line: 35, type: !23)
!94 = distinct !DILexicalBlock(scope: !10, file: !1, line: 35, column: 5)
!95 = !DILocation(line: 35, column: 17, scope: !94)
!96 = !DILocalVariable(name: "i", scope: !94, file: !1, line: 35, type: !23)
!97 = !DILocation(line: 35, column: 25, scope: !94)
!98 = !DILocation(line: 35, column: 10, scope: !94)
!99 = !DILocation(line: 35, column: 32, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !1, line: 35, column: 5)
!101 = !DILocation(line: 35, column: 35, scope: !100)
!102 = !DILocation(line: 35, column: 5, scope: !94)
!103 = !DILocation(line: 36, column: 19, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !1, line: 36, column: 12)
!105 = !DILocation(line: 36, column: 12, scope: !104)
!106 = !DILocation(line: 36, column: 12, scope: !100)
!107 = !DILocalVariable(name: "j", scope: !108, file: !1, line: 37, type: !23)
!108 = distinct !DILexicalBlock(scope: !104, file: !1, line: 37, column: 13)
!109 = !DILocation(line: 37, column: 25, scope: !108)
!110 = !DILocation(line: 37, column: 18, scope: !108)
!111 = !DILocation(line: 37, column: 32, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !1, line: 37, column: 13)
!113 = !DILocation(line: 37, column: 36, scope: !112)
!114 = !DILocation(line: 37, column: 34, scope: !112)
!115 = !DILocation(line: 37, column: 13, scope: !108)
!116 = !DILocation(line: 38, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !1, line: 38, column: 21)
!118 = !DILocation(line: 38, column: 42, scope: !117)
!119 = !DILocation(line: 38, column: 46, scope: !117)
!120 = !DILocation(line: 38, column: 27, scope: !117)
!121 = !DILocation(line: 38, column: 24, scope: !117)
!122 = !DILocation(line: 38, column: 21, scope: !112)
!123 = !DILocation(line: 39, column: 31, scope: !124)
!124 = distinct !DILexicalBlock(scope: !117, file: !1, line: 38, column: 50)
!125 = !DILocation(line: 39, column: 21, scope: !124)
!126 = !DILocation(line: 39, column: 26, scope: !124)
!127 = !DILocation(line: 39, column: 29, scope: !124)
!128 = !DILocation(line: 40, column: 22, scope: !124)
!129 = !DILocation(line: 41, column: 17, scope: !124)
!130 = !DILocation(line: 38, column: 47, scope: !117)
!131 = !DILocation(line: 37, column: 42, scope: !112)
!132 = !DILocation(line: 37, column: 13, scope: !112)
!133 = distinct !{!133, !115, !134}
!134 = !DILocation(line: 41, column: 17, scope: !108)
!135 = !DILocation(line: 36, column: 21, scope: !104)
!136 = !DILocation(line: 35, column: 50, scope: !100)
!137 = !DILocation(line: 35, column: 5, scope: !100)
!138 = distinct !{!138, !102, !139}
!139 = !DILocation(line: 41, column: 17, scope: !94)
!140 = !DILocalVariable(name: "ndx2", scope: !10, file: !1, line: 44, type: !83)
!141 = !DILocation(line: 44, column: 13, scope: !10)
!142 = !DILocation(line: 44, column: 27, scope: !10)
!143 = !DILocation(line: 44, column: 31, scope: !10)
!144 = !DILocation(line: 44, column: 20, scope: !10)
!145 = !DILocation(line: 45, column: 9, scope: !146)
!146 = distinct !DILexicalBlock(scope: !10, file: !1, line: 45, column: 9)
!147 = !DILocation(line: 45, column: 14, scope: !146)
!148 = !DILocation(line: 45, column: 9, scope: !10)
!149 = !DILocation(line: 46, column: 9, scope: !146)
!150 = !DILocalVariable(name: "i", scope: !151, file: !1, line: 47, type: !23)
!151 = distinct !DILexicalBlock(scope: !10, file: !1, line: 47, column: 5)
!152 = !DILocation(line: 47, column: 17, scope: !151)
!153 = !DILocalVariable(name: "n", scope: !151, file: !1, line: 47, type: !23)
!154 = !DILocation(line: 47, column: 24, scope: !151)
!155 = !DILocalVariable(name: "m", scope: !151, file: !1, line: 47, type: !23)
!156 = !DILocation(line: 47, column: 31, scope: !151)
!157 = !DILocation(line: 47, column: 10, scope: !151)
!158 = !DILocation(line: 47, column: 38, scope: !159)
!159 = distinct !DILexicalBlock(scope: !151, file: !1, line: 47, column: 5)
!160 = !DILocation(line: 47, column: 42, scope: !159)
!161 = !DILocation(line: 47, column: 40, scope: !159)
!162 = !DILocation(line: 47, column: 5, scope: !151)
!163 = !DILocation(line: 48, column: 19, scope: !164)
!164 = distinct !DILexicalBlock(scope: !159, file: !1, line: 47, column: 52)
!165 = !DILocation(line: 48, column: 24, scope: !164)
!166 = !DILocation(line: 48, column: 9, scope: !164)
!167 = !DILocation(line: 48, column: 14, scope: !164)
!168 = !DILocation(line: 48, column: 17, scope: !164)
!169 = !DILocation(line: 49, column: 14, scope: !164)
!170 = !DILocation(line: 49, column: 11, scope: !164)
!171 = !DILocation(line: 50, column: 13, scope: !172)
!172 = distinct !DILexicalBlock(scope: !164, file: !1, line: 50, column: 13)
!173 = !DILocation(line: 50, column: 18, scope: !172)
!174 = !DILocation(line: 50, column: 15, scope: !172)
!175 = !DILocation(line: 50, column: 13, scope: !164)
!176 = !DILocation(line: 51, column: 14, scope: !177)
!177 = distinct !DILexicalBlock(scope: !172, file: !1, line: 50, column: 23)
!178 = !DILocation(line: 52, column: 17, scope: !177)
!179 = !DILocation(line: 52, column: 15, scope: !177)
!180 = !DILocation(line: 53, column: 9, scope: !177)
!181 = !DILocation(line: 54, column: 5, scope: !164)
!182 = !DILocation(line: 47, column: 48, scope: !159)
!183 = !DILocation(line: 47, column: 5, scope: !159)
!184 = distinct !{!184, !162, !185}
!185 = !DILocation(line: 54, column: 5, scope: !151)
!186 = !DILocalVariable(name: "grp", scope: !10, file: !1, line: 57, type: !22)
!187 = !DILocation(line: 57, column: 18, scope: !10)
!188 = !DILocation(line: 57, column: 29, scope: !10)
!189 = !DILocation(line: 57, column: 33, scope: !10)
!190 = !DILocation(line: 57, column: 40, scope: !10)
!191 = !DILocation(line: 57, column: 38, scope: !10)
!192 = !DILocation(line: 57, column: 26, scope: !10)
!193 = !DILocation(line: 58, column: 5, scope: !194)
!194 = distinct !DILexicalBlock(scope: !195, file: !1, line: 58, column: 5)
!195 = distinct !DILexicalBlock(scope: !10, file: !1, line: 58, column: 5)
!196 = !DILocation(line: 58, column: 5, scope: !195)
!197 = !DILocalVariable(name: "lng", scope: !10, file: !1, line: 61, type: !22)
!198 = !DILocation(line: 61, column: 18, scope: !10)
!199 = !DILocation(line: 61, column: 29, scope: !10)
!200 = !DILocation(line: 61, column: 33, scope: !10)
!201 = !DILocation(line: 61, column: 40, scope: !10)
!202 = !DILocation(line: 61, column: 38, scope: !10)
!203 = !DILocation(line: 61, column: 26, scope: !10)
!204 = !DILocation(line: 62, column: 5, scope: !205)
!205 = distinct !DILexicalBlock(scope: !206, file: !1, line: 62, column: 5)
!206 = distinct !DILexicalBlock(scope: !10, file: !1, line: 62, column: 5)
!207 = !DILocation(line: 62, column: 5, scope: !206)
!208 = !DILocalVariable(name: "i", scope: !209, file: !1, line: 65, type: !23)
!209 = distinct !DILexicalBlock(scope: !10, file: !1, line: 65, column: 5)
!210 = !DILocation(line: 65, column: 17, scope: !209)
!211 = !DILocalVariable(name: "j", scope: !209, file: !1, line: 65, type: !23)
!212 = !DILocation(line: 65, column: 24, scope: !209)
!213 = !DILocation(line: 65, column: 10, scope: !209)
!214 = !DILocation(line: 65, column: 31, scope: !215)
!215 = distinct !DILexicalBlock(scope: !209, file: !1, line: 65, column: 5)
!216 = !DILocation(line: 65, column: 35, scope: !215)
!217 = !DILocation(line: 65, column: 33, scope: !215)
!218 = !DILocation(line: 65, column: 5, scope: !209)
!219 = !DILocalVariable(name: "first", scope: !220, file: !1, line: 66, type: !22)
!220 = distinct !DILexicalBlock(scope: !215, file: !1, line: 65, column: 46)
!221 = !DILocation(line: 66, column: 22, scope: !220)
!222 = !DILocation(line: 66, column: 30, scope: !220)
!223 = !DILocation(line: 66, column: 35, scope: !220)
!224 = !DILocalVariable(name: "glen", scope: !220, file: !1, line: 67, type: !22)
!225 = !DILocation(line: 67, column: 22, scope: !220)
!226 = !DILocation(line: 67, column: 29, scope: !220)
!227 = !DILocation(line: 67, column: 36, scope: !220)
!228 = !DILocation(line: 67, column: 40, scope: !220)
!229 = !DILocation(line: 67, column: 38, scope: !220)
!230 = !DILocation(line: 67, column: 35, scope: !220)
!231 = !DILocation(line: 67, column: 33, scope: !220)
!232 = !DILocalVariable(name: "k", scope: !233, file: !1, line: 68, type: !23)
!233 = distinct !DILexicalBlock(scope: !220, file: !1, line: 68, column: 9)
!234 = !DILocation(line: 68, column: 21, scope: !233)
!235 = !DILocation(line: 68, column: 14, scope: !233)
!236 = !DILocation(line: 68, column: 28, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !1, line: 68, column: 9)
!238 = !DILocation(line: 68, column: 32, scope: !237)
!239 = !DILocation(line: 68, column: 30, scope: !237)
!240 = !DILocation(line: 68, column: 9, scope: !233)
!241 = !DILocation(line: 69, column: 31, scope: !237)
!242 = !DILocation(line: 69, column: 36, scope: !237)
!243 = !DILocation(line: 69, column: 40, scope: !237)
!244 = !DILocation(line: 69, column: 38, scope: !237)
!245 = !DILocation(line: 69, column: 13, scope: !237)
!246 = !DILocation(line: 69, column: 18, scope: !237)
!247 = !DILocation(line: 69, column: 22, scope: !237)
!248 = !DILocation(line: 69, column: 20, scope: !237)
!249 = !DILocation(line: 69, column: 24, scope: !237)
!250 = !DILocation(line: 69, column: 29, scope: !237)
!251 = !DILocation(line: 68, column: 39, scope: !237)
!252 = !DILocation(line: 68, column: 9, scope: !237)
!253 = distinct !{!253, !240, !254}
!254 = !DILocation(line: 69, column: 41, scope: !233)
!255 = !DILocation(line: 70, column: 30, scope: !220)
!256 = !DILocation(line: 70, column: 9, scope: !220)
!257 = !DILocation(line: 70, column: 14, scope: !220)
!258 = !DILocation(line: 70, column: 18, scope: !220)
!259 = !DILocation(line: 70, column: 16, scope: !220)
!260 = !DILocation(line: 70, column: 23, scope: !220)
!261 = !DILocation(line: 70, column: 28, scope: !220)
!262 = !DILocation(line: 71, column: 14, scope: !220)
!263 = !DILocation(line: 71, column: 11, scope: !220)
!264 = !DILocation(line: 72, column: 5, scope: !220)
!265 = !DILocation(line: 65, column: 42, scope: !215)
!266 = !DILocation(line: 65, column: 5, scope: !215)
!267 = distinct !{!267, !218, !268}
!268 = !DILocation(line: 72, column: 5, scope: !209)
!269 = !DILocation(line: 75, column: 5, scope: !10)
!270 = !DILocation(line: 75, column: 12, scope: !10)
!271 = !DILocation(line: 75, column: 17, scope: !10)
!272 = !DILocalVariable(name: "i", scope: !273, file: !1, line: 76, type: !23)
!273 = distinct !DILexicalBlock(scope: !10, file: !1, line: 76, column: 5)
!274 = !DILocation(line: 76, column: 17, scope: !273)
!275 = !DILocation(line: 76, column: 10, scope: !273)
!276 = !DILocation(line: 76, column: 24, scope: !277)
!277 = distinct !DILexicalBlock(scope: !273, file: !1, line: 76, column: 5)
!278 = !DILocation(line: 76, column: 28, scope: !277)
!279 = !DILocation(line: 76, column: 26, scope: !277)
!280 = !DILocation(line: 76, column: 5, scope: !273)
!281 = !DILocation(line: 77, column: 27, scope: !277)
!282 = !DILocation(line: 77, column: 31, scope: !277)
!283 = !DILocation(line: 77, column: 36, scope: !277)
!284 = !DILocation(line: 77, column: 9, scope: !277)
!285 = !DILocation(line: 77, column: 16, scope: !277)
!286 = !DILocation(line: 77, column: 21, scope: !277)
!287 = !DILocation(line: 77, column: 25, scope: !277)
!288 = !DILocation(line: 76, column: 34, scope: !277)
!289 = !DILocation(line: 76, column: 5, scope: !277)
!290 = distinct !{!290, !280, !291}
!291 = !DILocation(line: 77, column: 38, scope: !273)
!292 = !DILocation(line: 79, column: 10, scope: !10)
!293 = !DILocation(line: 79, column: 5, scope: !10)
!294 = !DILocation(line: 80, column: 10, scope: !10)
!295 = !DILocation(line: 80, column: 5, scope: !10)
!296 = !DILocation(line: 81, column: 1, scope: !10)
!297 = distinct !DISubprogram(name: "display", scope: !1, file: !1, line: 83, type: !298, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!298 = !DISubroutineType(types: !299)
!299 = !{null, !13, !13}
!300 = !DILocalVariable(name: "txt1", arg: 1, scope: !297, file: !1, line: 83, type: !13)
!301 = !DILocation(line: 83, column: 26, scope: !297)
!302 = !DILocalVariable(name: "txt2", arg: 2, scope: !297, file: !1, line: 83, type: !13)
!303 = !DILocation(line: 83, column: 44, scope: !297)
!304 = !DILocalVariable(name: "len", scope: !297, file: !1, line: 84, type: !22)
!305 = !DILocation(line: 84, column: 18, scope: !297)
!306 = !DILocation(line: 84, column: 31, scope: !297)
!307 = !DILocation(line: 84, column: 24, scope: !297)
!308 = !DILocation(line: 85, column: 5, scope: !309)
!309 = distinct !DILexicalBlock(scope: !310, file: !1, line: 85, column: 5)
!310 = distinct !DILexicalBlock(scope: !297, file: !1, line: 85, column: 5)
!311 = !DILocation(line: 85, column: 5, scope: !310)
!312 = !DILocalVariable(name: "score", scope: !297, file: !1, line: 86, type: !313)
!313 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!314 = !DILocation(line: 86, column: 9, scope: !297)
!315 = !DILocalVariable(name: "i", scope: !316, file: !1, line: 87, type: !23)
!316 = distinct !DILexicalBlock(scope: !297, file: !1, line: 87, column: 5)
!317 = !DILocation(line: 87, column: 17, scope: !316)
!318 = !DILocation(line: 87, column: 10, scope: !316)
!319 = !DILocation(line: 87, column: 24, scope: !320)
!320 = distinct !DILexicalBlock(scope: !316, file: !1, line: 87, column: 5)
!321 = !DILocation(line: 87, column: 28, scope: !320)
!322 = !DILocation(line: 87, column: 26, scope: !320)
!323 = !DILocation(line: 87, column: 5, scope: !316)
!324 = !DILocation(line: 88, column: 13, scope: !325)
!325 = distinct !DILexicalBlock(scope: !320, file: !1, line: 88, column: 13)
!326 = !DILocation(line: 88, column: 18, scope: !325)
!327 = !DILocation(line: 88, column: 24, scope: !325)
!328 = !DILocation(line: 88, column: 29, scope: !325)
!329 = !DILocation(line: 88, column: 21, scope: !325)
!330 = !DILocation(line: 88, column: 13, scope: !320)
!331 = !DILocation(line: 89, column: 18, scope: !325)
!332 = !DILocation(line: 89, column: 13, scope: !325)
!333 = !DILocation(line: 88, column: 30, scope: !325)
!334 = !DILocation(line: 87, column: 34, scope: !320)
!335 = !DILocation(line: 87, column: 5, scope: !320)
!336 = distinct !{!336, !323, !337}
!337 = !DILocation(line: 89, column: 18, scope: !316)
!338 = !DILocation(line: 90, column: 36, scope: !297)
!339 = !DILocation(line: 90, column: 42, scope: !297)
!340 = !DILocation(line: 90, column: 48, scope: !297)
!341 = !DILocation(line: 90, column: 11, scope: !297)
!342 = !DILocation(line: 91, column: 1, scope: !297)
!343 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 93, type: !344, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!344 = !DISubroutineType(types: !345)
!345 = !{!313}
!346 = !DILocalVariable(name: "data", scope: !343, file: !1, line: 94, type: !347)
!347 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 576, elements: !348)
!348 = !{!349}
!349 = !DISubrange(count: 9)
!350 = !DILocation(line: 94, column: 17, scope: !343)
!351 = !DILocalVariable(name: "data_len", scope: !343, file: !1, line: 96, type: !22)
!352 = !DILocation(line: 96, column: 18, scope: !343)
!353 = !DILocalVariable(name: "i", scope: !354, file: !1, line: 97, type: !23)
!354 = distinct !DILexicalBlock(scope: !343, file: !1, line: 97, column: 5)
!355 = !DILocation(line: 97, column: 17, scope: !354)
!356 = !DILocation(line: 97, column: 10, scope: !354)
!357 = !DILocation(line: 97, column: 24, scope: !358)
!358 = distinct !DILexicalBlock(scope: !354, file: !1, line: 97, column: 5)
!359 = !DILocation(line: 97, column: 26, scope: !358)
!360 = !DILocation(line: 97, column: 5, scope: !354)
!361 = !DILocalVariable(name: "shuf_len", scope: !362, file: !1, line: 98, type: !22)
!362 = distinct !DILexicalBlock(scope: !358, file: !1, line: 97, column: 43)
!363 = !DILocation(line: 98, column: 22, scope: !362)
!364 = !DILocation(line: 98, column: 45, scope: !362)
!365 = !DILocation(line: 98, column: 40, scope: !362)
!366 = !DILocation(line: 98, column: 33, scope: !362)
!367 = !DILocation(line: 98, column: 49, scope: !362)
!368 = !DILocation(line: 99, column: 19, scope: !362)
!369 = !DILocation(line: 99, column: 9, scope: !362)
!370 = !DILocalVariable(name: "__vla_expr0", scope: !362, type: !25, flags: DIFlagArtificial)
!371 = !DILocation(line: 0, scope: !362)
!372 = !DILocalVariable(name: "shuf", scope: !362, file: !1, line: 99, type: !373)
!373 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, elements: !374)
!374 = !{!375}
!375 = !DISubrange(count: !370)
!376 = !DILocation(line: 99, column: 14, scope: !362)
!377 = !DILocation(line: 102, column: 9, scope: !362)
!378 = !DILocation(line: 103, column: 14, scope: !362)
!379 = !DILocation(line: 103, column: 23, scope: !362)
!380 = !DILocation(line: 103, column: 9, scope: !362)
!381 = !DILocation(line: 103, column: 28, scope: !362)
!382 = !DILocation(line: 106, column: 27, scope: !362)
!383 = !DILocation(line: 106, column: 22, scope: !362)
!384 = !DILocation(line: 106, column: 9, scope: !362)
!385 = !DILocation(line: 107, column: 22, scope: !362)
!386 = !DILocation(line: 107, column: 17, scope: !362)
!387 = !DILocation(line: 107, column: 9, scope: !362)
!388 = !DILocation(line: 108, column: 5, scope: !358)
!389 = !DILocation(line: 108, column: 5, scope: !362)
!390 = !DILocation(line: 97, column: 39, scope: !358)
!391 = !DILocation(line: 97, column: 5, scope: !358)
!392 = distinct !{!392, !360, !393}
!393 = !DILocation(line: 108, column: 5, scope: !354)
!394 = !DILocation(line: 110, column: 5, scope: !343)
