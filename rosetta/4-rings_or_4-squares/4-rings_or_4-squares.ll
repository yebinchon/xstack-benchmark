; ModuleID = '4-rings_or_4-squares.c'
source_filename = "4-rings_or_4-squares.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@lo = common dso_local global i32 0, align 4, !dbg !0
@f = common dso_local global i32 0, align 4, !dbg !17
@hi = common dso_local global i32 0, align 4, !dbg !21
@unique = common dso_local global i32 0, align 4, !dbg !23
@a = common dso_local global i32 0, align 4, !dbg !6
@c = common dso_local global i32 0, align 4, !dbg !11
@d = common dso_local global i32 0, align 4, !dbg !13
@g = common dso_local global i32 0, align 4, !dbg !19
@e = common dso_local global i32 0, align 4, !dbg !15
@b = common dso_local global i32 0, align 4, !dbg !9
@solutions = common dso_local global i32 0, align 4, !dbg !27
@show = common dso_local global i32 0, align 4, !dbg !25
@.str = private unnamed_addr constant [22 x i8] c"%d %d %d %d %d %d %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [34 x i8] c"\0A%d unique solutions in %d to %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [38 x i8] c"\0A%d non-unique solutions in %d to %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @bf() #0 !dbg !33 {
entry:
  %0 = load i32, i32* @lo, align 4, !dbg !36
  store i32 %0, i32* @f, align 4, !dbg !38
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* @f, align 4, !dbg !40
  %2 = load i32, i32* @hi, align 4, !dbg !42
  %cmp = icmp sle i32 %1, %2, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* @unique, align 4, !dbg !45
  %tobool = icmp ne i32 %3, 0, !dbg !45
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !47, !cf.info !48

lor.lhs.false:                                    ; preds = %for.body
  %4 = load i32, i32* @f, align 4, !dbg !49
  %5 = load i32, i32* @a, align 4, !dbg !50
  %cmp1 = icmp ne i32 %4, %5, !dbg !51
  br i1 %cmp1, label %land.lhs.true, label %if.end30, !dbg !52, !cf.info !48

land.lhs.true:                                    ; preds = %lor.lhs.false
  %6 = load i32, i32* @f, align 4, !dbg !53
  %7 = load i32, i32* @c, align 4, !dbg !54
  %cmp2 = icmp ne i32 %6, %7, !dbg !55
  br i1 %cmp2, label %land.lhs.true3, label %if.end30, !dbg !56, !cf.info !48

land.lhs.true3:                                   ; preds = %land.lhs.true
  %8 = load i32, i32* @f, align 4, !dbg !57
  %9 = load i32, i32* @d, align 4, !dbg !58
  %cmp4 = icmp ne i32 %8, %9, !dbg !59
  br i1 %cmp4, label %land.lhs.true5, label %if.end30, !dbg !60, !cf.info !48

land.lhs.true5:                                   ; preds = %land.lhs.true3
  %10 = load i32, i32* @f, align 4, !dbg !61
  %11 = load i32, i32* @g, align 4, !dbg !62
  %cmp6 = icmp ne i32 %10, %11, !dbg !63
  br i1 %cmp6, label %land.lhs.true7, label %if.end30, !dbg !64, !cf.info !48

land.lhs.true7:                                   ; preds = %land.lhs.true5
  %12 = load i32, i32* @f, align 4, !dbg !65
  %13 = load i32, i32* @e, align 4, !dbg !66
  %cmp8 = icmp ne i32 %12, %13, !dbg !67
  br i1 %cmp8, label %if.then, label %if.end30, !dbg !68, !cf.info !48

if.then:                                          ; preds = %land.lhs.true7, %for.body
  %14 = load i32, i32* @e, align 4, !dbg !69
  %15 = load i32, i32* @f, align 4, !dbg !71
  %add = add nsw i32 %14, %15, !dbg !72
  %16 = load i32, i32* @c, align 4, !dbg !73
  %sub = sub nsw i32 %add, %16, !dbg !74
  store i32 %sub, i32* @b, align 4, !dbg !75
  %17 = load i32, i32* @b, align 4, !dbg !76
  %18 = load i32, i32* @lo, align 4, !dbg !78
  %cmp9 = icmp sge i32 %17, %18, !dbg !79
  br i1 %cmp9, label %land.lhs.true10, label %if.end29, !dbg !80, !cf.info !48

land.lhs.true10:                                  ; preds = %if.then
  %19 = load i32, i32* @b, align 4, !dbg !81
  %20 = load i32, i32* @hi, align 4, !dbg !82
  %cmp11 = icmp sle i32 %19, %20, !dbg !83
  br i1 %cmp11, label %land.lhs.true12, label %if.end29, !dbg !84, !cf.info !48

land.lhs.true12:                                  ; preds = %land.lhs.true10
  %21 = load i32, i32* @unique, align 4, !dbg !85
  %tobool13 = icmp ne i32 %21, 0, !dbg !85
  br i1 %tobool13, label %lor.lhs.false14, label %if.then26, !dbg !86, !cf.info !48

lor.lhs.false14:                                  ; preds = %land.lhs.true12
  %22 = load i32, i32* @b, align 4, !dbg !87
  %23 = load i32, i32* @a, align 4, !dbg !88
  %cmp15 = icmp ne i32 %22, %23, !dbg !89
  br i1 %cmp15, label %land.lhs.true16, label %if.end29, !dbg !90, !cf.info !48

land.lhs.true16:                                  ; preds = %lor.lhs.false14
  %24 = load i32, i32* @b, align 4, !dbg !91
  %25 = load i32, i32* @c, align 4, !dbg !92
  %cmp17 = icmp ne i32 %24, %25, !dbg !93
  br i1 %cmp17, label %land.lhs.true18, label %if.end29, !dbg !94, !cf.info !48

land.lhs.true18:                                  ; preds = %land.lhs.true16
  %26 = load i32, i32* @b, align 4, !dbg !95
  %27 = load i32, i32* @d, align 4, !dbg !96
  %cmp19 = icmp ne i32 %26, %27, !dbg !97
  br i1 %cmp19, label %land.lhs.true20, label %if.end29, !dbg !98, !cf.info !48

land.lhs.true20:                                  ; preds = %land.lhs.true18
  %28 = load i32, i32* @b, align 4, !dbg !99
  %29 = load i32, i32* @g, align 4, !dbg !100
  %cmp21 = icmp ne i32 %28, %29, !dbg !101
  br i1 %cmp21, label %land.lhs.true22, label %if.end29, !dbg !102, !cf.info !48

land.lhs.true22:                                  ; preds = %land.lhs.true20
  %30 = load i32, i32* @b, align 4, !dbg !103
  %31 = load i32, i32* @e, align 4, !dbg !104
  %cmp23 = icmp ne i32 %30, %31, !dbg !105
  br i1 %cmp23, label %land.lhs.true24, label %if.end29, !dbg !106, !cf.info !48

land.lhs.true24:                                  ; preds = %land.lhs.true22
  %32 = load i32, i32* @b, align 4, !dbg !107
  %33 = load i32, i32* @f, align 4, !dbg !108
  %cmp25 = icmp ne i32 %32, %33, !dbg !109
  br i1 %cmp25, label %if.then26, label %if.end29, !dbg !110, !cf.info !48

if.then26:                                        ; preds = %land.lhs.true24, %land.lhs.true12
  %34 = load i32, i32* @solutions, align 4, !dbg !111
  %inc = add nsw i32 %34, 1, !dbg !111
  store i32 %inc, i32* @solutions, align 4, !dbg !111
  %35 = load i32, i32* @show, align 4, !dbg !113
  %tobool27 = icmp ne i32 %35, 0, !dbg !113
  br i1 %tobool27, label %if.then28, label %if.end, !dbg !115, !cf.info !48

if.then28:                                        ; preds = %if.then26
  %36 = load i32, i32* @a, align 4, !dbg !116
  %37 = load i32, i32* @b, align 4, !dbg !117
  %38 = load i32, i32* @c, align 4, !dbg !118
  %39 = load i32, i32* @d, align 4, !dbg !119
  %40 = load i32, i32* @e, align 4, !dbg !120
  %41 = load i32, i32* @f, align 4, !dbg !121
  %42 = load i32, i32* @g, align 4, !dbg !122
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i32 %36, i32 %37, i32 %38, i32 %39, i32 %40, i32 %41, i32 %42), !dbg !123
  br label %if.end, !dbg !123

if.end:                                           ; preds = %if.then28, %if.then26
  br label %if.end29, !dbg !124

if.end29:                                         ; preds = %if.end, %land.lhs.true24, %land.lhs.true22, %land.lhs.true20, %land.lhs.true18, %land.lhs.true16, %lor.lhs.false14, %land.lhs.true10, %if.then
  br label %if.end30, !dbg !125

if.end30:                                         ; preds = %if.end29, %land.lhs.true7, %land.lhs.true5, %land.lhs.true3, %land.lhs.true, %lor.lhs.false
  br label %for.inc, !dbg !126

for.inc:                                          ; preds = %if.end30
  %43 = load i32, i32* @f, align 4, !dbg !127
  %inc31 = add nsw i32 %43, 1, !dbg !127
  store i32 %inc31, i32* @f, align 4, !dbg !127
  br label %for.cond, !dbg !128, !llvm.loop !129

for.end:                                          ; preds = %for.cond
  ret void, !dbg !131
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @ge() #0 !dbg !132 {
entry:
  %0 = load i32, i32* @lo, align 4, !dbg !133
  store i32 %0, i32* @e, align 4, !dbg !135
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* @e, align 4, !dbg !137
  %2 = load i32, i32* @hi, align 4, !dbg !139
  %cmp = icmp sle i32 %1, %2, !dbg !140
  br i1 %cmp, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* @unique, align 4, !dbg !142
  %tobool = icmp ne i32 %3, 0, !dbg !142
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !144, !cf.info !48

lor.lhs.false:                                    ; preds = %for.body
  %4 = load i32, i32* @e, align 4, !dbg !145
  %5 = load i32, i32* @a, align 4, !dbg !146
  %cmp1 = icmp ne i32 %4, %5, !dbg !147
  br i1 %cmp1, label %land.lhs.true, label %if.end19, !dbg !148, !cf.info !48

land.lhs.true:                                    ; preds = %lor.lhs.false
  %6 = load i32, i32* @e, align 4, !dbg !149
  %7 = load i32, i32* @c, align 4, !dbg !150
  %cmp2 = icmp ne i32 %6, %7, !dbg !151
  br i1 %cmp2, label %land.lhs.true3, label %if.end19, !dbg !152, !cf.info !48

land.lhs.true3:                                   ; preds = %land.lhs.true
  %8 = load i32, i32* @e, align 4, !dbg !153
  %9 = load i32, i32* @d, align 4, !dbg !154
  %cmp4 = icmp ne i32 %8, %9, !dbg !155
  br i1 %cmp4, label %if.then, label %if.end19, !dbg !156, !cf.info !48

if.then:                                          ; preds = %land.lhs.true3, %for.body
  %10 = load i32, i32* @d, align 4, !dbg !157
  %11 = load i32, i32* @e, align 4, !dbg !159
  %add = add nsw i32 %10, %11, !dbg !160
  store i32 %add, i32* @g, align 4, !dbg !161
  %12 = load i32, i32* @g, align 4, !dbg !162
  %13 = load i32, i32* @lo, align 4, !dbg !164
  %cmp5 = icmp sge i32 %12, %13, !dbg !165
  br i1 %cmp5, label %land.lhs.true6, label %if.end, !dbg !166, !cf.info !48

land.lhs.true6:                                   ; preds = %if.then
  %14 = load i32, i32* @g, align 4, !dbg !167
  %15 = load i32, i32* @hi, align 4, !dbg !168
  %cmp7 = icmp sle i32 %14, %15, !dbg !169
  br i1 %cmp7, label %land.lhs.true8, label %if.end, !dbg !170, !cf.info !48

land.lhs.true8:                                   ; preds = %land.lhs.true6
  %16 = load i32, i32* @unique, align 4, !dbg !171
  %tobool9 = icmp ne i32 %16, 0, !dbg !171
  br i1 %tobool9, label %lor.lhs.false10, label %if.then18, !dbg !172, !cf.info !48

lor.lhs.false10:                                  ; preds = %land.lhs.true8
  %17 = load i32, i32* @g, align 4, !dbg !173
  %18 = load i32, i32* @a, align 4, !dbg !174
  %cmp11 = icmp ne i32 %17, %18, !dbg !175
  br i1 %cmp11, label %land.lhs.true12, label %if.end, !dbg !176, !cf.info !48

land.lhs.true12:                                  ; preds = %lor.lhs.false10
  %19 = load i32, i32* @g, align 4, !dbg !177
  %20 = load i32, i32* @c, align 4, !dbg !178
  %cmp13 = icmp ne i32 %19, %20, !dbg !179
  br i1 %cmp13, label %land.lhs.true14, label %if.end, !dbg !180, !cf.info !48

land.lhs.true14:                                  ; preds = %land.lhs.true12
  %21 = load i32, i32* @g, align 4, !dbg !181
  %22 = load i32, i32* @d, align 4, !dbg !182
  %cmp15 = icmp ne i32 %21, %22, !dbg !183
  br i1 %cmp15, label %land.lhs.true16, label %if.end, !dbg !184, !cf.info !48

land.lhs.true16:                                  ; preds = %land.lhs.true14
  %23 = load i32, i32* @g, align 4, !dbg !185
  %24 = load i32, i32* @e, align 4, !dbg !186
  %cmp17 = icmp ne i32 %23, %24, !dbg !187
  br i1 %cmp17, label %if.then18, label %if.end, !dbg !188, !cf.info !48

if.then18:                                        ; preds = %land.lhs.true16, %land.lhs.true8
  call void @bf(), !dbg !189
  br label %if.end, !dbg !189

if.end:                                           ; preds = %if.then18, %land.lhs.true16, %land.lhs.true14, %land.lhs.true12, %lor.lhs.false10, %land.lhs.true6, %if.then
  br label %if.end19, !dbg !190

if.end19:                                         ; preds = %if.end, %land.lhs.true3, %land.lhs.true, %lor.lhs.false
  br label %for.inc, !dbg !191

for.inc:                                          ; preds = %if.end19
  %25 = load i32, i32* @e, align 4, !dbg !192
  %inc = add nsw i32 %25, 1, !dbg !192
  store i32 %inc, i32* @e, align 4, !dbg !192
  br label %for.cond, !dbg !193, !llvm.loop !194

for.end:                                          ; preds = %for.cond
  ret void, !dbg !196
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @acd() #0 !dbg !197 {
entry:
  %0 = load i32, i32* @lo, align 4, !dbg !198
  store i32 %0, i32* @c, align 4, !dbg !200
  br label %for.cond, !dbg !201

for.cond:                                         ; preds = %for.inc15, %entry
  %1 = load i32, i32* @c, align 4, !dbg !202
  %2 = load i32, i32* @hi, align 4, !dbg !204
  %cmp = icmp sle i32 %1, %2, !dbg !205
  br i1 %cmp, label %for.body, label %for.end17, !dbg !206

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* @lo, align 4, !dbg !207
  store i32 %3, i32* @d, align 4, !dbg !209
  br label %for.cond1, !dbg !210

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* @d, align 4, !dbg !211
  %5 = load i32, i32* @hi, align 4, !dbg !213
  %cmp2 = icmp sle i32 %4, %5, !dbg !214
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !215

for.body3:                                        ; preds = %for.cond1
  %6 = load i32, i32* @unique, align 4, !dbg !216
  %tobool = icmp ne i32 %6, 0, !dbg !216
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !218, !cf.info !48

lor.lhs.false:                                    ; preds = %for.body3
  %7 = load i32, i32* @c, align 4, !dbg !219
  %8 = load i32, i32* @d, align 4, !dbg !220
  %cmp4 = icmp ne i32 %7, %8, !dbg !221
  br i1 %cmp4, label %if.then, label %if.end14, !dbg !222, !cf.info !48

if.then:                                          ; preds = %lor.lhs.false, %for.body3
  %9 = load i32, i32* @c, align 4, !dbg !223
  %10 = load i32, i32* @d, align 4, !dbg !225
  %add = add nsw i32 %9, %10, !dbg !226
  store i32 %add, i32* @a, align 4, !dbg !227
  %11 = load i32, i32* @a, align 4, !dbg !228
  %12 = load i32, i32* @lo, align 4, !dbg !230
  %cmp5 = icmp sge i32 %11, %12, !dbg !231
  br i1 %cmp5, label %land.lhs.true, label %if.end, !dbg !232, !cf.info !48

land.lhs.true:                                    ; preds = %if.then
  %13 = load i32, i32* @a, align 4, !dbg !233
  %14 = load i32, i32* @hi, align 4, !dbg !234
  %cmp6 = icmp sle i32 %13, %14, !dbg !235
  br i1 %cmp6, label %land.lhs.true7, label %if.end, !dbg !236, !cf.info !48

land.lhs.true7:                                   ; preds = %land.lhs.true
  %15 = load i32, i32* @unique, align 4, !dbg !237
  %tobool8 = icmp ne i32 %15, 0, !dbg !237
  br i1 %tobool8, label %lor.lhs.false9, label %if.then13, !dbg !238, !cf.info !48

lor.lhs.false9:                                   ; preds = %land.lhs.true7
  %16 = load i32, i32* @c, align 4, !dbg !239
  %cmp10 = icmp ne i32 %16, 0, !dbg !240
  br i1 %cmp10, label %land.lhs.true11, label %if.end, !dbg !241, !cf.info !48

land.lhs.true11:                                  ; preds = %lor.lhs.false9
  %17 = load i32, i32* @d, align 4, !dbg !242
  %cmp12 = icmp ne i32 %17, 0, !dbg !243
  br i1 %cmp12, label %if.then13, label %if.end, !dbg !244, !cf.info !48

if.then13:                                        ; preds = %land.lhs.true11, %land.lhs.true7
  call void @ge(), !dbg !245
  br label %if.end, !dbg !245

if.end:                                           ; preds = %if.then13, %land.lhs.true11, %lor.lhs.false9, %land.lhs.true, %if.then
  br label %if.end14, !dbg !246

if.end14:                                         ; preds = %if.end, %lor.lhs.false
  br label %for.inc, !dbg !247

for.inc:                                          ; preds = %if.end14
  %18 = load i32, i32* @d, align 4, !dbg !248
  %inc = add nsw i32 %18, 1, !dbg !248
  store i32 %inc, i32* @d, align 4, !dbg !248
  br label %for.cond1, !dbg !249, !llvm.loop !250

for.end:                                          ; preds = %for.cond1
  br label %for.inc15, !dbg !251

for.inc15:                                        ; preds = %for.end
  %19 = load i32, i32* @c, align 4, !dbg !252
  %inc16 = add nsw i32 %19, 1, !dbg !252
  store i32 %inc16, i32* @c, align 4, !dbg !252
  br label %for.cond, !dbg !253, !llvm.loop !254

for.end17:                                        ; preds = %for.cond
  ret void, !dbg !256
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @foursquares(i32 %plo, i32 %phi, i32 %punique, i32 %pshow) #0 !dbg !257 {
entry:
  %plo.addr = alloca i32, align 4
  %phi.addr = alloca i32, align 4
  %punique.addr = alloca i32, align 4
  %pshow.addr = alloca i32, align 4
  store i32 %plo, i32* %plo.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %plo.addr, metadata !260, metadata !DIExpression()), !dbg !261
  store i32 %phi, i32* %phi.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %phi.addr, metadata !262, metadata !DIExpression()), !dbg !263
  store i32 %punique, i32* %punique.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %punique.addr, metadata !264, metadata !DIExpression()), !dbg !265
  store i32 %pshow, i32* %pshow.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %pshow.addr, metadata !266, metadata !DIExpression()), !dbg !267
  %0 = load i32, i32* %plo.addr, align 4, !dbg !268
  store i32 %0, i32* @lo, align 4, !dbg !269
  %1 = load i32, i32* %phi.addr, align 4, !dbg !270
  store i32 %1, i32* @hi, align 4, !dbg !271
  %2 = load i32, i32* %punique.addr, align 4, !dbg !272
  store i32 %2, i32* @unique, align 4, !dbg !273
  %3 = load i32, i32* %pshow.addr, align 4, !dbg !274
  store i32 %3, i32* @show, align 4, !dbg !275
  store i32 0, i32* @solutions, align 4, !dbg !276
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !277
  call void @acd(), !dbg !278
  %4 = load i32, i32* @unique, align 4, !dbg !279
  %tobool = icmp ne i32 %4, 0, !dbg !279
  br i1 %tobool, label %if.then, label %if.else, !dbg !281, !cf.info !48

if.then:                                          ; preds = %entry
  %5 = load i32, i32* @solutions, align 4, !dbg !282
  %6 = load i32, i32* @lo, align 4, !dbg !283
  %7 = load i32, i32* @hi, align 4, !dbg !284
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i32 %5, i32 %6, i32 %7), !dbg !285
  br label %if.end, !dbg !285

if.else:                                          ; preds = %entry
  %8 = load i32, i32* @solutions, align 4, !dbg !286
  %9 = load i32, i32* @lo, align 4, !dbg !287
  %10 = load i32, i32* @hi, align 4, !dbg !288
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i64 0, i64 0), i32 %8, i32 %9, i32 %10), !dbg !289
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !290
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !291 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @foursquares(i32 1, i32 7, i32 1, i32 1), !dbg !294
  call void @foursquares(i32 3, i32 9, i32 1, i32 1), !dbg !295
  call void @foursquares(i32 0, i32 9, i32 0, i32 0), !dbg !296
  ret i32 0, !dbg !297
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!29, !30, !31}
!llvm.ident = !{!32}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "lo", scope: !2, file: !3, line: 7, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "4-rings_or_4-squares.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/4-rings_or_4-squares")
!4 = !{}
!5 = !{!6, !9, !11, !13, !15, !17, !19, !0, !21, !23, !25, !27}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "b", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "c", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "d", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "e", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "f", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "hi", scope: !2, file: !3, line: 7, type: !8, isLocal: false, isDefinition: true)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "unique", scope: !2, file: !3, line: 7, type: !8, isLocal: false, isDefinition: true)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(name: "show", scope: !2, file: !3, line: 7, type: !8, isLocal: false, isDefinition: true)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "solutions", scope: !2, file: !3, line: 8, type: !8, isLocal: false, isDefinition: true)
!29 = !{i32 7, !"Dwarf Version", i32 4}
!30 = !{i32 2, !"Debug Info Version", i32 3}
!31 = !{i32 1, !"wchar_size", i32 4}
!32 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
!33 = distinct !DISubprogram(name: "bf", scope: !3, file: !3, line: 10, type: !34, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!34 = !DISubroutineType(types: !35)
!35 = !{null}
!36 = !DILocation(line: 11, column: 12, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !3, line: 11, column: 3)
!38 = !DILocation(line: 11, column: 10, scope: !37)
!39 = !DILocation(line: 11, column: 8, scope: !37)
!40 = !DILocation(line: 11, column: 15, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !3, line: 11, column: 3)
!42 = !DILocation(line: 11, column: 20, scope: !41)
!43 = !DILocation(line: 11, column: 17, scope: !41)
!44 = !DILocation(line: 11, column: 3, scope: !37)
!45 = !DILocation(line: 12, column: 11, scope: !46)
!46 = distinct !DILexicalBlock(scope: !41, file: !3, line: 12, column: 9)
!47 = !DILocation(line: 12, column: 19, scope: !46)
!48 = !{!"if"}
!49 = !DILocation(line: 12, column: 24, scope: !46)
!50 = !DILocation(line: 12, column: 29, scope: !46)
!51 = !DILocation(line: 12, column: 26, scope: !46)
!52 = !DILocation(line: 12, column: 32, scope: !46)
!53 = !DILocation(line: 12, column: 36, scope: !46)
!54 = !DILocation(line: 12, column: 41, scope: !46)
!55 = !DILocation(line: 12, column: 38, scope: !46)
!56 = !DILocation(line: 12, column: 44, scope: !46)
!57 = !DILocation(line: 12, column: 48, scope: !46)
!58 = !DILocation(line: 12, column: 53, scope: !46)
!59 = !DILocation(line: 12, column: 50, scope: !46)
!60 = !DILocation(line: 12, column: 56, scope: !46)
!61 = !DILocation(line: 12, column: 60, scope: !46)
!62 = !DILocation(line: 12, column: 65, scope: !46)
!63 = !DILocation(line: 12, column: 62, scope: !46)
!64 = !DILocation(line: 12, column: 68, scope: !46)
!65 = !DILocation(line: 12, column: 72, scope: !46)
!66 = !DILocation(line: 12, column: 77, scope: !46)
!67 = !DILocation(line: 12, column: 74, scope: !46)
!68 = !DILocation(line: 12, column: 9, scope: !41)
!69 = !DILocation(line: 13, column: 11, scope: !70)
!70 = distinct !DILexicalBlock(scope: !46, file: !3, line: 12, column: 82)
!71 = !DILocation(line: 13, column: 15, scope: !70)
!72 = !DILocation(line: 13, column: 13, scope: !70)
!73 = !DILocation(line: 13, column: 19, scope: !70)
!74 = !DILocation(line: 13, column: 17, scope: !70)
!75 = !DILocation(line: 13, column: 9, scope: !70)
!76 = !DILocation(line: 14, column: 12, scope: !77)
!77 = distinct !DILexicalBlock(scope: !70, file: !3, line: 14, column: 11)
!78 = !DILocation(line: 14, column: 17, scope: !77)
!79 = !DILocation(line: 14, column: 14, scope: !77)
!80 = !DILocation(line: 14, column: 21, scope: !77)
!81 = !DILocation(line: 14, column: 25, scope: !77)
!82 = !DILocation(line: 14, column: 30, scope: !77)
!83 = !DILocation(line: 14, column: 27, scope: !77)
!84 = !DILocation(line: 14, column: 34, scope: !77)
!85 = !DILocation(line: 15, column: 14, scope: !77)
!86 = !DILocation(line: 15, column: 22, scope: !77)
!87 = !DILocation(line: 15, column: 27, scope: !77)
!88 = !DILocation(line: 15, column: 32, scope: !77)
!89 = !DILocation(line: 15, column: 29, scope: !77)
!90 = !DILocation(line: 15, column: 35, scope: !77)
!91 = !DILocation(line: 15, column: 39, scope: !77)
!92 = !DILocation(line: 15, column: 44, scope: !77)
!93 = !DILocation(line: 15, column: 41, scope: !77)
!94 = !DILocation(line: 15, column: 47, scope: !77)
!95 = !DILocation(line: 16, column: 14, scope: !77)
!96 = !DILocation(line: 16, column: 19, scope: !77)
!97 = !DILocation(line: 16, column: 16, scope: !77)
!98 = !DILocation(line: 16, column: 22, scope: !77)
!99 = !DILocation(line: 16, column: 26, scope: !77)
!100 = !DILocation(line: 16, column: 31, scope: !77)
!101 = !DILocation(line: 16, column: 28, scope: !77)
!102 = !DILocation(line: 16, column: 34, scope: !77)
!103 = !DILocation(line: 16, column: 38, scope: !77)
!104 = !DILocation(line: 16, column: 43, scope: !77)
!105 = !DILocation(line: 16, column: 40, scope: !77)
!106 = !DILocation(line: 16, column: 46, scope: !77)
!107 = !DILocation(line: 16, column: 50, scope: !77)
!108 = !DILocation(line: 16, column: 55, scope: !77)
!109 = !DILocation(line: 16, column: 52, scope: !77)
!110 = !DILocation(line: 14, column: 11, scope: !70)
!111 = !DILocation(line: 17, column: 18, scope: !112)
!112 = distinct !DILexicalBlock(scope: !77, file: !3, line: 16, column: 61)
!113 = !DILocation(line: 18, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !112, file: !3, line: 18, column: 13)
!115 = !DILocation(line: 18, column: 13, scope: !112)
!116 = !DILocation(line: 19, column: 43, scope: !114)
!117 = !DILocation(line: 19, column: 45, scope: !114)
!118 = !DILocation(line: 19, column: 47, scope: !114)
!119 = !DILocation(line: 19, column: 49, scope: !114)
!120 = !DILocation(line: 19, column: 51, scope: !114)
!121 = !DILocation(line: 19, column: 53, scope: !114)
!122 = !DILocation(line: 19, column: 55, scope: !114)
!123 = !DILocation(line: 19, column: 11, scope: !114)
!124 = !DILocation(line: 20, column: 7, scope: !112)
!125 = !DILocation(line: 21, column: 5, scope: !70)
!126 = !DILocation(line: 12, column: 79, scope: !46)
!127 = !DILocation(line: 11, column: 25, scope: !41)
!128 = !DILocation(line: 11, column: 3, scope: !41)
!129 = distinct !{!129, !44, !130}
!130 = !DILocation(line: 21, column: 5, scope: !37)
!131 = !DILocation(line: 22, column: 1, scope: !33)
!132 = distinct !DISubprogram(name: "ge", scope: !3, file: !3, line: 24, type: !34, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!133 = !DILocation(line: 25, column: 12, scope: !134)
!134 = distinct !DILexicalBlock(scope: !132, file: !3, line: 25, column: 3)
!135 = !DILocation(line: 25, column: 10, scope: !134)
!136 = !DILocation(line: 25, column: 8, scope: !134)
!137 = !DILocation(line: 25, column: 15, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !3, line: 25, column: 3)
!139 = !DILocation(line: 25, column: 20, scope: !138)
!140 = !DILocation(line: 25, column: 17, scope: !138)
!141 = !DILocation(line: 25, column: 3, scope: !134)
!142 = !DILocation(line: 26, column: 11, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !3, line: 26, column: 9)
!144 = !DILocation(line: 26, column: 19, scope: !143)
!145 = !DILocation(line: 26, column: 24, scope: !143)
!146 = !DILocation(line: 26, column: 29, scope: !143)
!147 = !DILocation(line: 26, column: 26, scope: !143)
!148 = !DILocation(line: 26, column: 32, scope: !143)
!149 = !DILocation(line: 26, column: 36, scope: !143)
!150 = !DILocation(line: 26, column: 41, scope: !143)
!151 = !DILocation(line: 26, column: 38, scope: !143)
!152 = !DILocation(line: 26, column: 44, scope: !143)
!153 = !DILocation(line: 26, column: 48, scope: !143)
!154 = !DILocation(line: 26, column: 53, scope: !143)
!155 = !DILocation(line: 26, column: 50, scope: !143)
!156 = !DILocation(line: 26, column: 9, scope: !138)
!157 = !DILocation(line: 27, column: 11, scope: !158)
!158 = distinct !DILexicalBlock(scope: !143, file: !3, line: 26, column: 58)
!159 = !DILocation(line: 27, column: 15, scope: !158)
!160 = !DILocation(line: 27, column: 13, scope: !158)
!161 = !DILocation(line: 27, column: 9, scope: !158)
!162 = !DILocation(line: 28, column: 12, scope: !163)
!163 = distinct !DILexicalBlock(scope: !158, file: !3, line: 28, column: 11)
!164 = !DILocation(line: 28, column: 17, scope: !163)
!165 = !DILocation(line: 28, column: 14, scope: !163)
!166 = !DILocation(line: 28, column: 21, scope: !163)
!167 = !DILocation(line: 28, column: 25, scope: !163)
!168 = !DILocation(line: 28, column: 30, scope: !163)
!169 = !DILocation(line: 28, column: 27, scope: !163)
!170 = !DILocation(line: 28, column: 34, scope: !163)
!171 = !DILocation(line: 29, column: 14, scope: !163)
!172 = !DILocation(line: 29, column: 22, scope: !163)
!173 = !DILocation(line: 29, column: 27, scope: !163)
!174 = !DILocation(line: 29, column: 32, scope: !163)
!175 = !DILocation(line: 29, column: 29, scope: !163)
!176 = !DILocation(line: 29, column: 35, scope: !163)
!177 = !DILocation(line: 29, column: 39, scope: !163)
!178 = !DILocation(line: 29, column: 44, scope: !163)
!179 = !DILocation(line: 29, column: 41, scope: !163)
!180 = !DILocation(line: 29, column: 47, scope: !163)
!181 = !DILocation(line: 30, column: 14, scope: !163)
!182 = !DILocation(line: 30, column: 19, scope: !163)
!183 = !DILocation(line: 30, column: 16, scope: !163)
!184 = !DILocation(line: 30, column: 22, scope: !163)
!185 = !DILocation(line: 30, column: 26, scope: !163)
!186 = !DILocation(line: 30, column: 31, scope: !163)
!187 = !DILocation(line: 30, column: 28, scope: !163)
!188 = !DILocation(line: 28, column: 11, scope: !158)
!189 = !DILocation(line: 31, column: 9, scope: !163)
!190 = !DILocation(line: 32, column: 5, scope: !158)
!191 = !DILocation(line: 26, column: 55, scope: !143)
!192 = !DILocation(line: 25, column: 25, scope: !138)
!193 = !DILocation(line: 25, column: 3, scope: !138)
!194 = distinct !{!194, !141, !195}
!195 = !DILocation(line: 32, column: 5, scope: !134)
!196 = !DILocation(line: 33, column: 1, scope: !132)
!197 = distinct !DISubprogram(name: "acd", scope: !3, file: !3, line: 35, type: !34, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!198 = !DILocation(line: 36, column: 12, scope: !199)
!199 = distinct !DILexicalBlock(scope: !197, file: !3, line: 36, column: 3)
!200 = !DILocation(line: 36, column: 10, scope: !199)
!201 = !DILocation(line: 36, column: 8, scope: !199)
!202 = !DILocation(line: 36, column: 15, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !3, line: 36, column: 3)
!204 = !DILocation(line: 36, column: 20, scope: !203)
!205 = !DILocation(line: 36, column: 17, scope: !203)
!206 = !DILocation(line: 36, column: 3, scope: !199)
!207 = !DILocation(line: 37, column: 14, scope: !208)
!208 = distinct !DILexicalBlock(scope: !203, file: !3, line: 37, column: 5)
!209 = !DILocation(line: 37, column: 12, scope: !208)
!210 = !DILocation(line: 37, column: 10, scope: !208)
!211 = !DILocation(line: 37, column: 17, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !3, line: 37, column: 5)
!213 = !DILocation(line: 37, column: 22, scope: !212)
!214 = !DILocation(line: 37, column: 19, scope: !212)
!215 = !DILocation(line: 37, column: 5, scope: !208)
!216 = !DILocation(line: 38, column: 13, scope: !217)
!217 = distinct !DILexicalBlock(scope: !212, file: !3, line: 38, column: 11)
!218 = !DILocation(line: 38, column: 21, scope: !217)
!219 = !DILocation(line: 38, column: 25, scope: !217)
!220 = !DILocation(line: 38, column: 30, scope: !217)
!221 = !DILocation(line: 38, column: 27, scope: !217)
!222 = !DILocation(line: 38, column: 11, scope: !212)
!223 = !DILocation(line: 39, column: 13, scope: !224)
!224 = distinct !DILexicalBlock(scope: !217, file: !3, line: 38, column: 34)
!225 = !DILocation(line: 39, column: 17, scope: !224)
!226 = !DILocation(line: 39, column: 15, scope: !224)
!227 = !DILocation(line: 39, column: 11, scope: !224)
!228 = !DILocation(line: 40, column: 14, scope: !229)
!229 = distinct !DILexicalBlock(scope: !224, file: !3, line: 40, column: 13)
!230 = !DILocation(line: 40, column: 19, scope: !229)
!231 = !DILocation(line: 40, column: 16, scope: !229)
!232 = !DILocation(line: 40, column: 23, scope: !229)
!233 = !DILocation(line: 40, column: 27, scope: !229)
!234 = !DILocation(line: 40, column: 32, scope: !229)
!235 = !DILocation(line: 40, column: 29, scope: !229)
!236 = !DILocation(line: 40, column: 36, scope: !229)
!237 = !DILocation(line: 41, column: 16, scope: !229)
!238 = !DILocation(line: 41, column: 24, scope: !229)
!239 = !DILocation(line: 41, column: 29, scope: !229)
!240 = !DILocation(line: 41, column: 31, scope: !229)
!241 = !DILocation(line: 41, column: 37, scope: !229)
!242 = !DILocation(line: 41, column: 41, scope: !229)
!243 = !DILocation(line: 41, column: 43, scope: !229)
!244 = !DILocation(line: 40, column: 13, scope: !224)
!245 = !DILocation(line: 42, column: 11, scope: !229)
!246 = !DILocation(line: 43, column: 7, scope: !224)
!247 = !DILocation(line: 38, column: 31, scope: !217)
!248 = !DILocation(line: 37, column: 27, scope: !212)
!249 = !DILocation(line: 37, column: 5, scope: !212)
!250 = distinct !{!250, !215, !251}
!251 = !DILocation(line: 43, column: 7, scope: !208)
!252 = !DILocation(line: 36, column: 25, scope: !203)
!253 = !DILocation(line: 36, column: 3, scope: !203)
!254 = distinct !{!254, !206, !255}
!255 = !DILocation(line: 43, column: 7, scope: !199)
!256 = !DILocation(line: 44, column: 1, scope: !197)
!257 = distinct !DISubprogram(name: "foursquares", scope: !3, file: !3, line: 46, type: !258, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!258 = !DISubroutineType(types: !259)
!259 = !{null, !8, !8, !8, !8}
!260 = !DILocalVariable(name: "plo", arg: 1, scope: !257, file: !3, line: 46, type: !8)
!261 = !DILocation(line: 46, column: 22, scope: !257)
!262 = !DILocalVariable(name: "phi", arg: 2, scope: !257, file: !3, line: 46, type: !8)
!263 = !DILocation(line: 46, column: 30, scope: !257)
!264 = !DILocalVariable(name: "punique", arg: 3, scope: !257, file: !3, line: 46, type: !8)
!265 = !DILocation(line: 46, column: 39, scope: !257)
!266 = !DILocalVariable(name: "pshow", arg: 4, scope: !257, file: !3, line: 46, type: !8)
!267 = !DILocation(line: 46, column: 51, scope: !257)
!268 = !DILocation(line: 47, column: 8, scope: !257)
!269 = !DILocation(line: 47, column: 6, scope: !257)
!270 = !DILocation(line: 48, column: 8, scope: !257)
!271 = !DILocation(line: 48, column: 6, scope: !257)
!272 = !DILocation(line: 49, column: 12, scope: !257)
!273 = !DILocation(line: 49, column: 10, scope: !257)
!274 = !DILocation(line: 50, column: 10, scope: !257)
!275 = !DILocation(line: 50, column: 8, scope: !257)
!276 = !DILocation(line: 51, column: 13, scope: !257)
!277 = !DILocation(line: 53, column: 3, scope: !257)
!278 = !DILocation(line: 55, column: 3, scope: !257)
!279 = !DILocation(line: 57, column: 7, scope: !280)
!280 = distinct !DILexicalBlock(scope: !257, file: !3, line: 57, column: 7)
!281 = !DILocation(line: 57, column: 7, scope: !257)
!282 = !DILocation(line: 58, column: 50, scope: !280)
!283 = !DILocation(line: 58, column: 60, scope: !280)
!284 = !DILocation(line: 58, column: 63, scope: !280)
!285 = !DILocation(line: 58, column: 5, scope: !280)
!286 = !DILocation(line: 60, column: 54, scope: !280)
!287 = !DILocation(line: 60, column: 64, scope: !280)
!288 = !DILocation(line: 60, column: 67, scope: !280)
!289 = !DILocation(line: 60, column: 5, scope: !280)
!290 = !DILocation(line: 61, column: 1, scope: !257)
!291 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 63, type: !292, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!292 = !DISubroutineType(types: !293)
!293 = !{!8}
!294 = !DILocation(line: 64, column: 3, scope: !291)
!295 = !DILocation(line: 65, column: 3, scope: !291)
!296 = !DILocation(line: 66, column: 3, scope: !291)
!297 = !DILocation(line: 68, column: 3, scope: !291)
