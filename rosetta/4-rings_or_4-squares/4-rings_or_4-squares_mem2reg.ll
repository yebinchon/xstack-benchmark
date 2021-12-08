; ModuleID = '4-rings_or_4-squares.ll'
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
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !47

lor.lhs.false:                                    ; preds = %for.body
  %4 = load i32, i32* @f, align 4, !dbg !48
  %5 = load i32, i32* @a, align 4, !dbg !49
  %cmp1 = icmp ne i32 %4, %5, !dbg !50
  br i1 %cmp1, label %land.lhs.true, label %if.end30, !dbg !51

land.lhs.true:                                    ; preds = %lor.lhs.false
  %6 = load i32, i32* @f, align 4, !dbg !52
  %7 = load i32, i32* @c, align 4, !dbg !53
  %cmp2 = icmp ne i32 %6, %7, !dbg !54
  br i1 %cmp2, label %land.lhs.true3, label %if.end30, !dbg !55

land.lhs.true3:                                   ; preds = %land.lhs.true
  %8 = load i32, i32* @f, align 4, !dbg !56
  %9 = load i32, i32* @d, align 4, !dbg !57
  %cmp4 = icmp ne i32 %8, %9, !dbg !58
  br i1 %cmp4, label %land.lhs.true5, label %if.end30, !dbg !59

land.lhs.true5:                                   ; preds = %land.lhs.true3
  %10 = load i32, i32* @f, align 4, !dbg !60
  %11 = load i32, i32* @g, align 4, !dbg !61
  %cmp6 = icmp ne i32 %10, %11, !dbg !62
  br i1 %cmp6, label %land.lhs.true7, label %if.end30, !dbg !63

land.lhs.true7:                                   ; preds = %land.lhs.true5
  %12 = load i32, i32* @f, align 4, !dbg !64
  %13 = load i32, i32* @e, align 4, !dbg !65
  %cmp8 = icmp ne i32 %12, %13, !dbg !66
  br i1 %cmp8, label %if.then, label %if.end30, !dbg !67

if.then:                                          ; preds = %land.lhs.true7, %for.body
  %14 = load i32, i32* @e, align 4, !dbg !68
  %15 = load i32, i32* @f, align 4, !dbg !70
  %add = add nsw i32 %14, %15, !dbg !71
  %16 = load i32, i32* @c, align 4, !dbg !72
  %sub = sub nsw i32 %add, %16, !dbg !73
  store i32 %sub, i32* @b, align 4, !dbg !74
  %17 = load i32, i32* @b, align 4, !dbg !75
  %18 = load i32, i32* @lo, align 4, !dbg !77
  %cmp9 = icmp sge i32 %17, %18, !dbg !78
  br i1 %cmp9, label %land.lhs.true10, label %if.end29, !dbg !79

land.lhs.true10:                                  ; preds = %if.then
  %19 = load i32, i32* @b, align 4, !dbg !80
  %20 = load i32, i32* @hi, align 4, !dbg !81
  %cmp11 = icmp sle i32 %19, %20, !dbg !82
  br i1 %cmp11, label %land.lhs.true12, label %if.end29, !dbg !83

land.lhs.true12:                                  ; preds = %land.lhs.true10
  %21 = load i32, i32* @unique, align 4, !dbg !84
  %tobool13 = icmp ne i32 %21, 0, !dbg !84
  br i1 %tobool13, label %lor.lhs.false14, label %if.then26, !dbg !85

lor.lhs.false14:                                  ; preds = %land.lhs.true12
  %22 = load i32, i32* @b, align 4, !dbg !86
  %23 = load i32, i32* @a, align 4, !dbg !87
  %cmp15 = icmp ne i32 %22, %23, !dbg !88
  br i1 %cmp15, label %land.lhs.true16, label %if.end29, !dbg !89

land.lhs.true16:                                  ; preds = %lor.lhs.false14
  %24 = load i32, i32* @b, align 4, !dbg !90
  %25 = load i32, i32* @c, align 4, !dbg !91
  %cmp17 = icmp ne i32 %24, %25, !dbg !92
  br i1 %cmp17, label %land.lhs.true18, label %if.end29, !dbg !93

land.lhs.true18:                                  ; preds = %land.lhs.true16
  %26 = load i32, i32* @b, align 4, !dbg !94
  %27 = load i32, i32* @d, align 4, !dbg !95
  %cmp19 = icmp ne i32 %26, %27, !dbg !96
  br i1 %cmp19, label %land.lhs.true20, label %if.end29, !dbg !97

land.lhs.true20:                                  ; preds = %land.lhs.true18
  %28 = load i32, i32* @b, align 4, !dbg !98
  %29 = load i32, i32* @g, align 4, !dbg !99
  %cmp21 = icmp ne i32 %28, %29, !dbg !100
  br i1 %cmp21, label %land.lhs.true22, label %if.end29, !dbg !101

land.lhs.true22:                                  ; preds = %land.lhs.true20
  %30 = load i32, i32* @b, align 4, !dbg !102
  %31 = load i32, i32* @e, align 4, !dbg !103
  %cmp23 = icmp ne i32 %30, %31, !dbg !104
  br i1 %cmp23, label %land.lhs.true24, label %if.end29, !dbg !105

land.lhs.true24:                                  ; preds = %land.lhs.true22
  %32 = load i32, i32* @b, align 4, !dbg !106
  %33 = load i32, i32* @f, align 4, !dbg !107
  %cmp25 = icmp ne i32 %32, %33, !dbg !108
  br i1 %cmp25, label %if.then26, label %if.end29, !dbg !109

if.then26:                                        ; preds = %land.lhs.true24, %land.lhs.true12
  %34 = load i32, i32* @solutions, align 4, !dbg !110
  %inc = add nsw i32 %34, 1, !dbg !110
  store i32 %inc, i32* @solutions, align 4, !dbg !110
  %35 = load i32, i32* @show, align 4, !dbg !112
  %tobool27 = icmp ne i32 %35, 0, !dbg !112
  br i1 %tobool27, label %if.then28, label %if.end, !dbg !114

if.then28:                                        ; preds = %if.then26
  %36 = load i32, i32* @a, align 4, !dbg !115
  %37 = load i32, i32* @b, align 4, !dbg !116
  %38 = load i32, i32* @c, align 4, !dbg !117
  %39 = load i32, i32* @d, align 4, !dbg !118
  %40 = load i32, i32* @e, align 4, !dbg !119
  %41 = load i32, i32* @f, align 4, !dbg !120
  %42 = load i32, i32* @g, align 4, !dbg !121
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i32 %36, i32 %37, i32 %38, i32 %39, i32 %40, i32 %41, i32 %42), !dbg !122
  br label %if.end, !dbg !122

if.end:                                           ; preds = %if.then28, %if.then26
  br label %if.end29, !dbg !123

if.end29:                                         ; preds = %if.end, %land.lhs.true24, %land.lhs.true22, %land.lhs.true20, %land.lhs.true18, %land.lhs.true16, %lor.lhs.false14, %land.lhs.true10, %if.then
  br label %if.end30, !dbg !124

if.end30:                                         ; preds = %if.end29, %land.lhs.true7, %land.lhs.true5, %land.lhs.true3, %land.lhs.true, %lor.lhs.false
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %if.end30
  %43 = load i32, i32* @f, align 4, !dbg !126
  %inc31 = add nsw i32 %43, 1, !dbg !126
  store i32 %inc31, i32* @f, align 4, !dbg !126
  br label %for.cond, !dbg !127, !llvm.loop !128

for.end:                                          ; preds = %for.cond
  ret void, !dbg !130
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @ge() #0 !dbg !131 {
entry:
  %0 = load i32, i32* @lo, align 4, !dbg !132
  store i32 %0, i32* @e, align 4, !dbg !134
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* @e, align 4, !dbg !136
  %2 = load i32, i32* @hi, align 4, !dbg !138
  %cmp = icmp sle i32 %1, %2, !dbg !139
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* @unique, align 4, !dbg !141
  %tobool = icmp ne i32 %3, 0, !dbg !141
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !143

lor.lhs.false:                                    ; preds = %for.body
  %4 = load i32, i32* @e, align 4, !dbg !144
  %5 = load i32, i32* @a, align 4, !dbg !145
  %cmp1 = icmp ne i32 %4, %5, !dbg !146
  br i1 %cmp1, label %land.lhs.true, label %if.end19, !dbg !147

land.lhs.true:                                    ; preds = %lor.lhs.false
  %6 = load i32, i32* @e, align 4, !dbg !148
  %7 = load i32, i32* @c, align 4, !dbg !149
  %cmp2 = icmp ne i32 %6, %7, !dbg !150
  br i1 %cmp2, label %land.lhs.true3, label %if.end19, !dbg !151

land.lhs.true3:                                   ; preds = %land.lhs.true
  %8 = load i32, i32* @e, align 4, !dbg !152
  %9 = load i32, i32* @d, align 4, !dbg !153
  %cmp4 = icmp ne i32 %8, %9, !dbg !154
  br i1 %cmp4, label %if.then, label %if.end19, !dbg !155

if.then:                                          ; preds = %land.lhs.true3, %for.body
  %10 = load i32, i32* @d, align 4, !dbg !156
  %11 = load i32, i32* @e, align 4, !dbg !158
  %add = add nsw i32 %10, %11, !dbg !159
  store i32 %add, i32* @g, align 4, !dbg !160
  %12 = load i32, i32* @g, align 4, !dbg !161
  %13 = load i32, i32* @lo, align 4, !dbg !163
  %cmp5 = icmp sge i32 %12, %13, !dbg !164
  br i1 %cmp5, label %land.lhs.true6, label %if.end, !dbg !165

land.lhs.true6:                                   ; preds = %if.then
  %14 = load i32, i32* @g, align 4, !dbg !166
  %15 = load i32, i32* @hi, align 4, !dbg !167
  %cmp7 = icmp sle i32 %14, %15, !dbg !168
  br i1 %cmp7, label %land.lhs.true8, label %if.end, !dbg !169

land.lhs.true8:                                   ; preds = %land.lhs.true6
  %16 = load i32, i32* @unique, align 4, !dbg !170
  %tobool9 = icmp ne i32 %16, 0, !dbg !170
  br i1 %tobool9, label %lor.lhs.false10, label %if.then18, !dbg !171

lor.lhs.false10:                                  ; preds = %land.lhs.true8
  %17 = load i32, i32* @g, align 4, !dbg !172
  %18 = load i32, i32* @a, align 4, !dbg !173
  %cmp11 = icmp ne i32 %17, %18, !dbg !174
  br i1 %cmp11, label %land.lhs.true12, label %if.end, !dbg !175

land.lhs.true12:                                  ; preds = %lor.lhs.false10
  %19 = load i32, i32* @g, align 4, !dbg !176
  %20 = load i32, i32* @c, align 4, !dbg !177
  %cmp13 = icmp ne i32 %19, %20, !dbg !178
  br i1 %cmp13, label %land.lhs.true14, label %if.end, !dbg !179

land.lhs.true14:                                  ; preds = %land.lhs.true12
  %21 = load i32, i32* @g, align 4, !dbg !180
  %22 = load i32, i32* @d, align 4, !dbg !181
  %cmp15 = icmp ne i32 %21, %22, !dbg !182
  br i1 %cmp15, label %land.lhs.true16, label %if.end, !dbg !183

land.lhs.true16:                                  ; preds = %land.lhs.true14
  %23 = load i32, i32* @g, align 4, !dbg !184
  %24 = load i32, i32* @e, align 4, !dbg !185
  %cmp17 = icmp ne i32 %23, %24, !dbg !186
  br i1 %cmp17, label %if.then18, label %if.end, !dbg !187

if.then18:                                        ; preds = %land.lhs.true16, %land.lhs.true8
  call void @bf(), !dbg !188
  br label %if.end, !dbg !188

if.end:                                           ; preds = %if.then18, %land.lhs.true16, %land.lhs.true14, %land.lhs.true12, %lor.lhs.false10, %land.lhs.true6, %if.then
  br label %if.end19, !dbg !189

if.end19:                                         ; preds = %if.end, %land.lhs.true3, %land.lhs.true, %lor.lhs.false
  br label %for.inc, !dbg !190

for.inc:                                          ; preds = %if.end19
  %25 = load i32, i32* @e, align 4, !dbg !191
  %inc = add nsw i32 %25, 1, !dbg !191
  store i32 %inc, i32* @e, align 4, !dbg !191
  br label %for.cond, !dbg !192, !llvm.loop !193

for.end:                                          ; preds = %for.cond
  ret void, !dbg !195
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @acd() #0 !dbg !196 {
entry:
  %0 = load i32, i32* @lo, align 4, !dbg !197
  store i32 %0, i32* @c, align 4, !dbg !199
  br label %for.cond, !dbg !200

for.cond:                                         ; preds = %for.inc15, %entry
  %1 = load i32, i32* @c, align 4, !dbg !201
  %2 = load i32, i32* @hi, align 4, !dbg !203
  %cmp = icmp sle i32 %1, %2, !dbg !204
  br i1 %cmp, label %for.body, label %for.end17, !dbg !205

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* @lo, align 4, !dbg !206
  store i32 %3, i32* @d, align 4, !dbg !208
  br label %for.cond1, !dbg !209

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* @d, align 4, !dbg !210
  %5 = load i32, i32* @hi, align 4, !dbg !212
  %cmp2 = icmp sle i32 %4, %5, !dbg !213
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !214

for.body3:                                        ; preds = %for.cond1
  %6 = load i32, i32* @unique, align 4, !dbg !215
  %tobool = icmp ne i32 %6, 0, !dbg !215
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !217

lor.lhs.false:                                    ; preds = %for.body3
  %7 = load i32, i32* @c, align 4, !dbg !218
  %8 = load i32, i32* @d, align 4, !dbg !219
  %cmp4 = icmp ne i32 %7, %8, !dbg !220
  br i1 %cmp4, label %if.then, label %if.end14, !dbg !221

if.then:                                          ; preds = %lor.lhs.false, %for.body3
  %9 = load i32, i32* @c, align 4, !dbg !222
  %10 = load i32, i32* @d, align 4, !dbg !224
  %add = add nsw i32 %9, %10, !dbg !225
  store i32 %add, i32* @a, align 4, !dbg !226
  %11 = load i32, i32* @a, align 4, !dbg !227
  %12 = load i32, i32* @lo, align 4, !dbg !229
  %cmp5 = icmp sge i32 %11, %12, !dbg !230
  br i1 %cmp5, label %land.lhs.true, label %if.end, !dbg !231

land.lhs.true:                                    ; preds = %if.then
  %13 = load i32, i32* @a, align 4, !dbg !232
  %14 = load i32, i32* @hi, align 4, !dbg !233
  %cmp6 = icmp sle i32 %13, %14, !dbg !234
  br i1 %cmp6, label %land.lhs.true7, label %if.end, !dbg !235

land.lhs.true7:                                   ; preds = %land.lhs.true
  %15 = load i32, i32* @unique, align 4, !dbg !236
  %tobool8 = icmp ne i32 %15, 0, !dbg !236
  br i1 %tobool8, label %lor.lhs.false9, label %if.then13, !dbg !237

lor.lhs.false9:                                   ; preds = %land.lhs.true7
  %16 = load i32, i32* @c, align 4, !dbg !238
  %cmp10 = icmp ne i32 %16, 0, !dbg !239
  br i1 %cmp10, label %land.lhs.true11, label %if.end, !dbg !240

land.lhs.true11:                                  ; preds = %lor.lhs.false9
  %17 = load i32, i32* @d, align 4, !dbg !241
  %cmp12 = icmp ne i32 %17, 0, !dbg !242
  br i1 %cmp12, label %if.then13, label %if.end, !dbg !243

if.then13:                                        ; preds = %land.lhs.true11, %land.lhs.true7
  call void @ge(), !dbg !244
  br label %if.end, !dbg !244

if.end:                                           ; preds = %if.then13, %land.lhs.true11, %lor.lhs.false9, %land.lhs.true, %if.then
  br label %if.end14, !dbg !245

if.end14:                                         ; preds = %if.end, %lor.lhs.false
  br label %for.inc, !dbg !246

for.inc:                                          ; preds = %if.end14
  %18 = load i32, i32* @d, align 4, !dbg !247
  %inc = add nsw i32 %18, 1, !dbg !247
  store i32 %inc, i32* @d, align 4, !dbg !247
  br label %for.cond1, !dbg !248, !llvm.loop !249

for.end:                                          ; preds = %for.cond1
  br label %for.inc15, !dbg !250

for.inc15:                                        ; preds = %for.end
  %19 = load i32, i32* @c, align 4, !dbg !251
  %inc16 = add nsw i32 %19, 1, !dbg !251
  store i32 %inc16, i32* @c, align 4, !dbg !251
  br label %for.cond, !dbg !252, !llvm.loop !253

for.end17:                                        ; preds = %for.cond
  ret void, !dbg !255
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @foursquares(i32 %plo, i32 %phi, i32 %punique, i32 %pshow) #0 !dbg !256 {
entry:
  call void @llvm.dbg.value(metadata i32 %plo, metadata !259, metadata !DIExpression()), !dbg !260
  call void @llvm.dbg.value(metadata i32 %phi, metadata !261, metadata !DIExpression()), !dbg !260
  call void @llvm.dbg.value(metadata i32 %punique, metadata !262, metadata !DIExpression()), !dbg !260
  call void @llvm.dbg.value(metadata i32 %pshow, metadata !263, metadata !DIExpression()), !dbg !260
  store i32 %plo, i32* @lo, align 4, !dbg !264
  store i32 %phi, i32* @hi, align 4, !dbg !265
  store i32 %punique, i32* @unique, align 4, !dbg !266
  store i32 %pshow, i32* @show, align 4, !dbg !267
  store i32 0, i32* @solutions, align 4, !dbg !268
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !269
  call void @acd(), !dbg !270
  %0 = load i32, i32* @unique, align 4, !dbg !271
  %tobool = icmp ne i32 %0, 0, !dbg !271
  br i1 %tobool, label %if.then, label %if.else, !dbg !273

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @solutions, align 4, !dbg !274
  %2 = load i32, i32* @lo, align 4, !dbg !275
  %3 = load i32, i32* @hi, align 4, !dbg !276
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i32 %1, i32 %2, i32 %3), !dbg !277
  br label %if.end, !dbg !277

if.else:                                          ; preds = %entry
  %4 = load i32, i32* @solutions, align 4, !dbg !278
  %5 = load i32, i32* @lo, align 4, !dbg !279
  %6 = load i32, i32* @hi, align 4, !dbg !280
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i64 0, i64 0), i32 %4, i32 %5, i32 %6), !dbg !281
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !282
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !283 {
entry:
  call void @foursquares(i32 1, i32 7, i32 1, i32 1), !dbg !286
  call void @foursquares(i32 3, i32 9, i32 1, i32 1), !dbg !287
  call void @foursquares(i32 0, i32 9, i32 0, i32 0), !dbg !288
  ret i32 0, !dbg !289
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!29, !30, !31}
!llvm.ident = !{!32}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "lo", scope: !2, file: !3, line: 7, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
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
!32 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
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
!48 = !DILocation(line: 12, column: 24, scope: !46)
!49 = !DILocation(line: 12, column: 29, scope: !46)
!50 = !DILocation(line: 12, column: 26, scope: !46)
!51 = !DILocation(line: 12, column: 32, scope: !46)
!52 = !DILocation(line: 12, column: 36, scope: !46)
!53 = !DILocation(line: 12, column: 41, scope: !46)
!54 = !DILocation(line: 12, column: 38, scope: !46)
!55 = !DILocation(line: 12, column: 44, scope: !46)
!56 = !DILocation(line: 12, column: 48, scope: !46)
!57 = !DILocation(line: 12, column: 53, scope: !46)
!58 = !DILocation(line: 12, column: 50, scope: !46)
!59 = !DILocation(line: 12, column: 56, scope: !46)
!60 = !DILocation(line: 12, column: 60, scope: !46)
!61 = !DILocation(line: 12, column: 65, scope: !46)
!62 = !DILocation(line: 12, column: 62, scope: !46)
!63 = !DILocation(line: 12, column: 68, scope: !46)
!64 = !DILocation(line: 12, column: 72, scope: !46)
!65 = !DILocation(line: 12, column: 77, scope: !46)
!66 = !DILocation(line: 12, column: 74, scope: !46)
!67 = !DILocation(line: 12, column: 9, scope: !41)
!68 = !DILocation(line: 13, column: 11, scope: !69)
!69 = distinct !DILexicalBlock(scope: !46, file: !3, line: 12, column: 82)
!70 = !DILocation(line: 13, column: 15, scope: !69)
!71 = !DILocation(line: 13, column: 13, scope: !69)
!72 = !DILocation(line: 13, column: 19, scope: !69)
!73 = !DILocation(line: 13, column: 17, scope: !69)
!74 = !DILocation(line: 13, column: 9, scope: !69)
!75 = !DILocation(line: 14, column: 12, scope: !76)
!76 = distinct !DILexicalBlock(scope: !69, file: !3, line: 14, column: 11)
!77 = !DILocation(line: 14, column: 17, scope: !76)
!78 = !DILocation(line: 14, column: 14, scope: !76)
!79 = !DILocation(line: 14, column: 21, scope: !76)
!80 = !DILocation(line: 14, column: 25, scope: !76)
!81 = !DILocation(line: 14, column: 30, scope: !76)
!82 = !DILocation(line: 14, column: 27, scope: !76)
!83 = !DILocation(line: 14, column: 34, scope: !76)
!84 = !DILocation(line: 15, column: 14, scope: !76)
!85 = !DILocation(line: 15, column: 22, scope: !76)
!86 = !DILocation(line: 15, column: 27, scope: !76)
!87 = !DILocation(line: 15, column: 32, scope: !76)
!88 = !DILocation(line: 15, column: 29, scope: !76)
!89 = !DILocation(line: 15, column: 35, scope: !76)
!90 = !DILocation(line: 15, column: 39, scope: !76)
!91 = !DILocation(line: 15, column: 44, scope: !76)
!92 = !DILocation(line: 15, column: 41, scope: !76)
!93 = !DILocation(line: 15, column: 47, scope: !76)
!94 = !DILocation(line: 16, column: 14, scope: !76)
!95 = !DILocation(line: 16, column: 19, scope: !76)
!96 = !DILocation(line: 16, column: 16, scope: !76)
!97 = !DILocation(line: 16, column: 22, scope: !76)
!98 = !DILocation(line: 16, column: 26, scope: !76)
!99 = !DILocation(line: 16, column: 31, scope: !76)
!100 = !DILocation(line: 16, column: 28, scope: !76)
!101 = !DILocation(line: 16, column: 34, scope: !76)
!102 = !DILocation(line: 16, column: 38, scope: !76)
!103 = !DILocation(line: 16, column: 43, scope: !76)
!104 = !DILocation(line: 16, column: 40, scope: !76)
!105 = !DILocation(line: 16, column: 46, scope: !76)
!106 = !DILocation(line: 16, column: 50, scope: !76)
!107 = !DILocation(line: 16, column: 55, scope: !76)
!108 = !DILocation(line: 16, column: 52, scope: !76)
!109 = !DILocation(line: 14, column: 11, scope: !69)
!110 = !DILocation(line: 17, column: 18, scope: !111)
!111 = distinct !DILexicalBlock(scope: !76, file: !3, line: 16, column: 61)
!112 = !DILocation(line: 18, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !111, file: !3, line: 18, column: 13)
!114 = !DILocation(line: 18, column: 13, scope: !111)
!115 = !DILocation(line: 19, column: 43, scope: !113)
!116 = !DILocation(line: 19, column: 45, scope: !113)
!117 = !DILocation(line: 19, column: 47, scope: !113)
!118 = !DILocation(line: 19, column: 49, scope: !113)
!119 = !DILocation(line: 19, column: 51, scope: !113)
!120 = !DILocation(line: 19, column: 53, scope: !113)
!121 = !DILocation(line: 19, column: 55, scope: !113)
!122 = !DILocation(line: 19, column: 11, scope: !113)
!123 = !DILocation(line: 20, column: 7, scope: !111)
!124 = !DILocation(line: 21, column: 5, scope: !69)
!125 = !DILocation(line: 12, column: 79, scope: !46)
!126 = !DILocation(line: 11, column: 25, scope: !41)
!127 = !DILocation(line: 11, column: 3, scope: !41)
!128 = distinct !{!128, !44, !129}
!129 = !DILocation(line: 21, column: 5, scope: !37)
!130 = !DILocation(line: 22, column: 1, scope: !33)
!131 = distinct !DISubprogram(name: "ge", scope: !3, file: !3, line: 24, type: !34, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!132 = !DILocation(line: 25, column: 12, scope: !133)
!133 = distinct !DILexicalBlock(scope: !131, file: !3, line: 25, column: 3)
!134 = !DILocation(line: 25, column: 10, scope: !133)
!135 = !DILocation(line: 25, column: 8, scope: !133)
!136 = !DILocation(line: 25, column: 15, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !3, line: 25, column: 3)
!138 = !DILocation(line: 25, column: 20, scope: !137)
!139 = !DILocation(line: 25, column: 17, scope: !137)
!140 = !DILocation(line: 25, column: 3, scope: !133)
!141 = !DILocation(line: 26, column: 11, scope: !142)
!142 = distinct !DILexicalBlock(scope: !137, file: !3, line: 26, column: 9)
!143 = !DILocation(line: 26, column: 19, scope: !142)
!144 = !DILocation(line: 26, column: 24, scope: !142)
!145 = !DILocation(line: 26, column: 29, scope: !142)
!146 = !DILocation(line: 26, column: 26, scope: !142)
!147 = !DILocation(line: 26, column: 32, scope: !142)
!148 = !DILocation(line: 26, column: 36, scope: !142)
!149 = !DILocation(line: 26, column: 41, scope: !142)
!150 = !DILocation(line: 26, column: 38, scope: !142)
!151 = !DILocation(line: 26, column: 44, scope: !142)
!152 = !DILocation(line: 26, column: 48, scope: !142)
!153 = !DILocation(line: 26, column: 53, scope: !142)
!154 = !DILocation(line: 26, column: 50, scope: !142)
!155 = !DILocation(line: 26, column: 9, scope: !137)
!156 = !DILocation(line: 27, column: 11, scope: !157)
!157 = distinct !DILexicalBlock(scope: !142, file: !3, line: 26, column: 58)
!158 = !DILocation(line: 27, column: 15, scope: !157)
!159 = !DILocation(line: 27, column: 13, scope: !157)
!160 = !DILocation(line: 27, column: 9, scope: !157)
!161 = !DILocation(line: 28, column: 12, scope: !162)
!162 = distinct !DILexicalBlock(scope: !157, file: !3, line: 28, column: 11)
!163 = !DILocation(line: 28, column: 17, scope: !162)
!164 = !DILocation(line: 28, column: 14, scope: !162)
!165 = !DILocation(line: 28, column: 21, scope: !162)
!166 = !DILocation(line: 28, column: 25, scope: !162)
!167 = !DILocation(line: 28, column: 30, scope: !162)
!168 = !DILocation(line: 28, column: 27, scope: !162)
!169 = !DILocation(line: 28, column: 34, scope: !162)
!170 = !DILocation(line: 29, column: 14, scope: !162)
!171 = !DILocation(line: 29, column: 22, scope: !162)
!172 = !DILocation(line: 29, column: 27, scope: !162)
!173 = !DILocation(line: 29, column: 32, scope: !162)
!174 = !DILocation(line: 29, column: 29, scope: !162)
!175 = !DILocation(line: 29, column: 35, scope: !162)
!176 = !DILocation(line: 29, column: 39, scope: !162)
!177 = !DILocation(line: 29, column: 44, scope: !162)
!178 = !DILocation(line: 29, column: 41, scope: !162)
!179 = !DILocation(line: 29, column: 47, scope: !162)
!180 = !DILocation(line: 30, column: 14, scope: !162)
!181 = !DILocation(line: 30, column: 19, scope: !162)
!182 = !DILocation(line: 30, column: 16, scope: !162)
!183 = !DILocation(line: 30, column: 22, scope: !162)
!184 = !DILocation(line: 30, column: 26, scope: !162)
!185 = !DILocation(line: 30, column: 31, scope: !162)
!186 = !DILocation(line: 30, column: 28, scope: !162)
!187 = !DILocation(line: 28, column: 11, scope: !157)
!188 = !DILocation(line: 31, column: 9, scope: !162)
!189 = !DILocation(line: 32, column: 5, scope: !157)
!190 = !DILocation(line: 26, column: 55, scope: !142)
!191 = !DILocation(line: 25, column: 25, scope: !137)
!192 = !DILocation(line: 25, column: 3, scope: !137)
!193 = distinct !{!193, !140, !194}
!194 = !DILocation(line: 32, column: 5, scope: !133)
!195 = !DILocation(line: 33, column: 1, scope: !131)
!196 = distinct !DISubprogram(name: "acd", scope: !3, file: !3, line: 35, type: !34, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!197 = !DILocation(line: 36, column: 12, scope: !198)
!198 = distinct !DILexicalBlock(scope: !196, file: !3, line: 36, column: 3)
!199 = !DILocation(line: 36, column: 10, scope: !198)
!200 = !DILocation(line: 36, column: 8, scope: !198)
!201 = !DILocation(line: 36, column: 15, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !3, line: 36, column: 3)
!203 = !DILocation(line: 36, column: 20, scope: !202)
!204 = !DILocation(line: 36, column: 17, scope: !202)
!205 = !DILocation(line: 36, column: 3, scope: !198)
!206 = !DILocation(line: 37, column: 14, scope: !207)
!207 = distinct !DILexicalBlock(scope: !202, file: !3, line: 37, column: 5)
!208 = !DILocation(line: 37, column: 12, scope: !207)
!209 = !DILocation(line: 37, column: 10, scope: !207)
!210 = !DILocation(line: 37, column: 17, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !3, line: 37, column: 5)
!212 = !DILocation(line: 37, column: 22, scope: !211)
!213 = !DILocation(line: 37, column: 19, scope: !211)
!214 = !DILocation(line: 37, column: 5, scope: !207)
!215 = !DILocation(line: 38, column: 13, scope: !216)
!216 = distinct !DILexicalBlock(scope: !211, file: !3, line: 38, column: 11)
!217 = !DILocation(line: 38, column: 21, scope: !216)
!218 = !DILocation(line: 38, column: 25, scope: !216)
!219 = !DILocation(line: 38, column: 30, scope: !216)
!220 = !DILocation(line: 38, column: 27, scope: !216)
!221 = !DILocation(line: 38, column: 11, scope: !211)
!222 = !DILocation(line: 39, column: 13, scope: !223)
!223 = distinct !DILexicalBlock(scope: !216, file: !3, line: 38, column: 34)
!224 = !DILocation(line: 39, column: 17, scope: !223)
!225 = !DILocation(line: 39, column: 15, scope: !223)
!226 = !DILocation(line: 39, column: 11, scope: !223)
!227 = !DILocation(line: 40, column: 14, scope: !228)
!228 = distinct !DILexicalBlock(scope: !223, file: !3, line: 40, column: 13)
!229 = !DILocation(line: 40, column: 19, scope: !228)
!230 = !DILocation(line: 40, column: 16, scope: !228)
!231 = !DILocation(line: 40, column: 23, scope: !228)
!232 = !DILocation(line: 40, column: 27, scope: !228)
!233 = !DILocation(line: 40, column: 32, scope: !228)
!234 = !DILocation(line: 40, column: 29, scope: !228)
!235 = !DILocation(line: 40, column: 36, scope: !228)
!236 = !DILocation(line: 41, column: 16, scope: !228)
!237 = !DILocation(line: 41, column: 24, scope: !228)
!238 = !DILocation(line: 41, column: 29, scope: !228)
!239 = !DILocation(line: 41, column: 31, scope: !228)
!240 = !DILocation(line: 41, column: 37, scope: !228)
!241 = !DILocation(line: 41, column: 41, scope: !228)
!242 = !DILocation(line: 41, column: 43, scope: !228)
!243 = !DILocation(line: 40, column: 13, scope: !223)
!244 = !DILocation(line: 42, column: 11, scope: !228)
!245 = !DILocation(line: 43, column: 7, scope: !223)
!246 = !DILocation(line: 38, column: 31, scope: !216)
!247 = !DILocation(line: 37, column: 27, scope: !211)
!248 = !DILocation(line: 37, column: 5, scope: !211)
!249 = distinct !{!249, !214, !250}
!250 = !DILocation(line: 43, column: 7, scope: !207)
!251 = !DILocation(line: 36, column: 25, scope: !202)
!252 = !DILocation(line: 36, column: 3, scope: !202)
!253 = distinct !{!253, !205, !254}
!254 = !DILocation(line: 43, column: 7, scope: !198)
!255 = !DILocation(line: 44, column: 1, scope: !196)
!256 = distinct !DISubprogram(name: "foursquares", scope: !3, file: !3, line: 46, type: !257, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!257 = !DISubroutineType(types: !258)
!258 = !{null, !8, !8, !8, !8}
!259 = !DILocalVariable(name: "plo", arg: 1, scope: !256, file: !3, line: 46, type: !8)
!260 = !DILocation(line: 0, scope: !256)
!261 = !DILocalVariable(name: "phi", arg: 2, scope: !256, file: !3, line: 46, type: !8)
!262 = !DILocalVariable(name: "punique", arg: 3, scope: !256, file: !3, line: 46, type: !8)
!263 = !DILocalVariable(name: "pshow", arg: 4, scope: !256, file: !3, line: 46, type: !8)
!264 = !DILocation(line: 47, column: 6, scope: !256)
!265 = !DILocation(line: 48, column: 6, scope: !256)
!266 = !DILocation(line: 49, column: 10, scope: !256)
!267 = !DILocation(line: 50, column: 8, scope: !256)
!268 = !DILocation(line: 51, column: 13, scope: !256)
!269 = !DILocation(line: 53, column: 3, scope: !256)
!270 = !DILocation(line: 55, column: 3, scope: !256)
!271 = !DILocation(line: 57, column: 7, scope: !272)
!272 = distinct !DILexicalBlock(scope: !256, file: !3, line: 57, column: 7)
!273 = !DILocation(line: 57, column: 7, scope: !256)
!274 = !DILocation(line: 58, column: 50, scope: !272)
!275 = !DILocation(line: 58, column: 60, scope: !272)
!276 = !DILocation(line: 58, column: 63, scope: !272)
!277 = !DILocation(line: 58, column: 5, scope: !272)
!278 = !DILocation(line: 60, column: 54, scope: !272)
!279 = !DILocation(line: 60, column: 64, scope: !272)
!280 = !DILocation(line: 60, column: 67, scope: !272)
!281 = !DILocation(line: 60, column: 5, scope: !272)
!282 = !DILocation(line: 61, column: 1, scope: !256)
!283 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 63, type: !284, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!284 = !DISubroutineType(types: !285)
!285 = !{!8}
!286 = !DILocation(line: 64, column: 3, scope: !283)
!287 = !DILocation(line: 65, column: 3, scope: !283)
!288 = !DILocation(line: 66, column: 3, scope: !283)
!289 = !DILocation(line: 68, column: 3, scope: !283)
