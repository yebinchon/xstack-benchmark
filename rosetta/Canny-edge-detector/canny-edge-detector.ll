; ModuleID = 'canny-edge-detector.ll'
source_filename = "canny-edge-detector.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.bmpfile_magic_t = type { [2 x i8] }
%struct.bitmap_info_header_t = type { i32, i32, i32, i16, i16, i32, i32, i32, i32, i32, i32 }
%struct.bmpfile_header_t = type { i32, i16, i16, i32 }
%struct.rgb_t = type { i8, i8, i8, i8 }

@.str = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"fopen()\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [28 x i8] c"Not a BMP file: magic=%c%c\0A\00", align 1
@.str.3 = private unnamed_addr constant [40 x i8] c"Warning, compression is not supported.\0A\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@__const.save_bmp.mag = private unnamed_addr constant %struct.bmpfile_magic_t { [2 x i8] c"BM" }, align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"kn % 2 == 1\00", align 1
@.str.6 = private unnamed_addr constant [22 x i8] c"canny-edge-detector.c\00", align 1
@__PRETTY_FUNCTION__.convolution = private unnamed_addr constant [106 x i8] c"void convolution(const pixel_t *, pixel_t *, const float *, const int, const int, const int, const _Bool)\00", align 1
@.str.7 = private unnamed_addr constant [19 x i8] c"nx > kn && ny > kn\00", align 1
@.str.8 = private unnamed_addr constant [43 x i8] c"gaussian_filter: kernel size %d, sigma=%g\0A\00", align 1
@.str.9 = private unnamed_addr constant [52 x i8] c"canny_edge_detection: Failed memory allocation(s).\0A\00", align 1
@.str.10 = private unnamed_addr constant [21 x i8] c"Usage: %s image.bmp\0A\00", align 1
@main.ih = internal global %struct.bitmap_info_header_t zeroinitializer, align 4, !dbg !0
@.str.11 = private unnamed_addr constant [29 x i8] c"main: BMP image not loaded.\0A\00", align 1
@.str.12 = private unnamed_addr constant [20 x i8] c"Info: %d x %d x %d\0A\00", align 1
@.str.13 = private unnamed_addr constant [36 x i8] c"main: failed canny_edge_detection.\0A\00", align 1
@.str.14 = private unnamed_addr constant [8 x i8] c"out.bmp\00", align 1
@.str.15 = private unnamed_addr constant [28 x i8] c"main: BMP image not saved.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i16* @load_bmp(i8* %filename, %struct.bitmap_info_header_t* %bitmapInfoHeader) #0 !dbg !56 {
entry:
  %retval = alloca i16*, align 8
  %filename.addr = alloca i8*, align 8
  %bitmapInfoHeader.addr = alloca %struct.bitmap_info_header_t*, align 8
  %filePtr = alloca %struct._IO_FILE*, align 8
  %mag = alloca %struct.bmpfile_magic_t, align 1
  %bitmapFileHeader = alloca %struct.bmpfile_header_t, align 4
  %bitmapImage = alloca i16*, align 8
  %pad = alloca i64, align 8
  %count = alloca i64, align 8
  %c = alloca i8, align 1
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  store i8* %filename, i8** %filename.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %filename.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store %struct.bitmap_info_header_t* %bitmapInfoHeader, %struct.bitmap_info_header_t** %bitmapInfoHeader.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.bitmap_info_header_t** %bitmapInfoHeader.addr, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %filePtr, metadata !64, metadata !DIExpression()), !dbg !123
  %0 = load i8*, i8** %filename.addr, align 8, !dbg !124
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0)), !dbg !125
  store %struct._IO_FILE* %call, %struct._IO_FILE** %filePtr, align 8, !dbg !123
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !126
  %cmp = icmp eq %struct._IO_FILE* %1, null, !dbg !128
  br i1 %cmp, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  call void @perror(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)), !dbg !130
  store i16* null, i16** %retval, align 8, !dbg !132
  br label %return, !dbg !132

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.bmpfile_magic_t* %mag, metadata !133, metadata !DIExpression()), !dbg !141
  %2 = bitcast %struct.bmpfile_magic_t* %mag to i8*, !dbg !142
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !144
  %call1 = call i64 @fread(i8* %2, i64 2, i64 1, %struct._IO_FILE* %3), !dbg !145
  %cmp2 = icmp ne i64 %call1, 1, !dbg !146
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !147

if.then3:                                         ; preds = %if.end
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !148
  %call4 = call i32 @fclose(%struct._IO_FILE* %4), !dbg !150
  store i16* null, i16** %retval, align 8, !dbg !151
  br label %return, !dbg !151

if.end5:                                          ; preds = %if.end
  %magic = getelementptr inbounds %struct.bmpfile_magic_t, %struct.bmpfile_magic_t* %mag, i32 0, i32 0, !dbg !152
  %arraydecay = getelementptr inbounds [2 x i8], [2 x i8]* %magic, i64 0, i64 0, !dbg !154
  %5 = bitcast i8* %arraydecay to i16*, !dbg !154
  %6 = load i16, i16* %5, align 1, !dbg !154
  %conv = zext i16 %6 to i32, !dbg !154
  %cmp6 = icmp ne i32 %conv, 19778, !dbg !155
  br i1 %cmp6, label %if.then8, label %if.end16, !dbg !156

if.then8:                                         ; preds = %if.end5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !157
  %magic9 = getelementptr inbounds %struct.bmpfile_magic_t, %struct.bmpfile_magic_t* %mag, i32 0, i32 0, !dbg !159
  %arrayidx = getelementptr inbounds [2 x i8], [2 x i8]* %magic9, i64 0, i64 0, !dbg !160
  %8 = load i8, i8* %arrayidx, align 1, !dbg !160
  %conv10 = zext i8 %8 to i32, !dbg !160
  %magic11 = getelementptr inbounds %struct.bmpfile_magic_t, %struct.bmpfile_magic_t* %mag, i32 0, i32 0, !dbg !161
  %arrayidx12 = getelementptr inbounds [2 x i8], [2 x i8]* %magic11, i64 0, i64 1, !dbg !162
  %9 = load i8, i8* %arrayidx12, align 1, !dbg !162
  %conv13 = zext i8 %9 to i32, !dbg !162
  %call14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i32 %conv10, i32 %conv13), !dbg !163
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !164
  %call15 = call i32 @fclose(%struct._IO_FILE* %10), !dbg !165
  store i16* null, i16** %retval, align 8, !dbg !166
  br label %return, !dbg !166

if.end16:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata %struct.bmpfile_header_t* %bitmapFileHeader, metadata !167, metadata !DIExpression()), !dbg !175
  %11 = bitcast %struct.bmpfile_header_t* %bitmapFileHeader to i8*, !dbg !176
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !178
  %call17 = call i64 @fread(i8* %11, i64 12, i64 1, %struct._IO_FILE* %12), !dbg !179
  %cmp18 = icmp ne i64 %call17, 1, !dbg !180
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !181

if.then20:                                        ; preds = %if.end16
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !182
  %call21 = call i32 @fclose(%struct._IO_FILE* %13), !dbg !184
  store i16* null, i16** %retval, align 8, !dbg !185
  br label %return, !dbg !185

if.end22:                                         ; preds = %if.end16
  %14 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bitmapInfoHeader.addr, align 8, !dbg !186
  %15 = bitcast %struct.bitmap_info_header_t* %14 to i8*, !dbg !186
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !188
  %call23 = call i64 @fread(i8* %15, i64 40, i64 1, %struct._IO_FILE* %16), !dbg !189
  %cmp24 = icmp ne i64 %call23, 1, !dbg !190
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !191

if.then26:                                        ; preds = %if.end22
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !192
  %call27 = call i32 @fclose(%struct._IO_FILE* %17), !dbg !194
  store i16* null, i16** %retval, align 8, !dbg !195
  br label %return, !dbg !195

if.end28:                                         ; preds = %if.end22
  %18 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bitmapInfoHeader.addr, align 8, !dbg !196
  %compress_type = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %18, i32 0, i32 5, !dbg !198
  %19 = load i32, i32* %compress_type, align 4, !dbg !198
  %cmp29 = icmp ne i32 %19, 0, !dbg !199
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !200

if.then31:                                        ; preds = %if.end28
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !201
  %call32 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.3, i64 0, i64 0)), !dbg !202
  br label %if.end33, !dbg !202

if.end33:                                         ; preds = %if.then31, %if.end28
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !203
  %bmp_offset = getelementptr inbounds %struct.bmpfile_header_t, %struct.bmpfile_header_t* %bitmapFileHeader, i32 0, i32 3, !dbg !205
  %22 = load i32, i32* %bmp_offset, align 4, !dbg !205
  %conv34 = zext i32 %22 to i64, !dbg !206
  %call35 = call i32 @fseek(%struct._IO_FILE* %21, i64 %conv34, i32 0), !dbg !207
  %tobool = icmp ne i32 %call35, 0, !dbg !207
  br i1 %tobool, label %if.then36, label %if.end38, !dbg !208

if.then36:                                        ; preds = %if.end33
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !209
  %call37 = call i32 @fclose(%struct._IO_FILE* %23), !dbg !211
  store i16* null, i16** %retval, align 8, !dbg !212
  br label %return, !dbg !212

if.end38:                                         ; preds = %if.end33
  call void @llvm.dbg.declare(metadata i16** %bitmapImage, metadata !213, metadata !DIExpression()), !dbg !214
  %24 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bitmapInfoHeader.addr, align 8, !dbg !215
  %bmp_bytesz = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %24, i32 0, i32 6, !dbg !216
  %25 = load i32, i32* %bmp_bytesz, align 4, !dbg !216
  %conv39 = zext i32 %25 to i64, !dbg !215
  %mul = mul i64 %conv39, 2, !dbg !217
  %call40 = call noalias i8* @malloc(i64 %mul) #6, !dbg !218
  %26 = bitcast i8* %call40 to i16*, !dbg !218
  store i16* %26, i16** %bitmapImage, align 8, !dbg !214
  %27 = load i16*, i16** %bitmapImage, align 8, !dbg !219
  %cmp41 = icmp eq i16* %27, null, !dbg !221
  br i1 %cmp41, label %if.then43, label %if.end45, !dbg !222

if.then43:                                        ; preds = %if.end38
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !223
  %call44 = call i32 @fclose(%struct._IO_FILE* %28), !dbg !225
  store i16* null, i16** %retval, align 8, !dbg !226
  br label %return, !dbg !226

if.end45:                                         ; preds = %if.end38
  call void @llvm.dbg.declare(metadata i64* %pad, metadata !227, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.declare(metadata i64* %count, metadata !229, metadata !DIExpression()), !dbg !230
  store i64 0, i64* %count, align 8, !dbg !230
  call void @llvm.dbg.declare(metadata i8* %c, metadata !231, metadata !DIExpression()), !dbg !232
  %29 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bitmapInfoHeader.addr, align 8, !dbg !233
  %bitspp = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %29, i32 0, i32 4, !dbg !234
  %30 = load i16, i16* %bitspp, align 2, !dbg !234
  %conv46 = zext i16 %30 to i32, !dbg !233
  %31 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bitmapInfoHeader.addr, align 8, !dbg !235
  %width = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %31, i32 0, i32 1, !dbg !236
  %32 = load i32, i32* %width, align 4, !dbg !236
  %mul47 = mul nsw i32 %conv46, %32, !dbg !237
  %conv48 = sitofp i32 %mul47 to double, !dbg !233
  %div = fdiv double %conv48, 3.200000e+01, !dbg !238
  %33 = call double @llvm.ceil.f64(double %div), !dbg !239
  %mul49 = fmul double 4.000000e+00, %33, !dbg !240
  %34 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bitmapInfoHeader.addr, align 8, !dbg !241
  %width50 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %34, i32 0, i32 1, !dbg !242
  %35 = load i32, i32* %width50, align 4, !dbg !242
  %conv51 = sitofp i32 %35 to double, !dbg !241
  %sub = fsub double %mul49, %conv51, !dbg !243
  %conv52 = fptoui double %sub to i64, !dbg !244
  store i64 %conv52, i64* %pad, align 8, !dbg !245
  call void @llvm.dbg.declare(metadata i64* %i, metadata !246, metadata !DIExpression()), !dbg !248
  store i64 0, i64* %i, align 8, !dbg !248
  br label %for.cond, !dbg !249

for.cond:                                         ; preds = %for.inc72, %if.end45
  %36 = load i64, i64* %i, align 8, !dbg !250
  %37 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bitmapInfoHeader.addr, align 8, !dbg !252
  %height = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %37, i32 0, i32 2, !dbg !253
  %38 = load i32, i32* %height, align 4, !dbg !253
  %conv53 = sext i32 %38 to i64, !dbg !252
  %cmp54 = icmp ult i64 %36, %conv53, !dbg !254
  br i1 %cmp54, label %for.body, label %for.end74, !dbg !255

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %j, metadata !256, metadata !DIExpression()), !dbg !259
  store i64 0, i64* %j, align 8, !dbg !259
  br label %for.cond56, !dbg !260

for.cond56:                                       ; preds = %for.inc, %for.body
  %39 = load i64, i64* %j, align 8, !dbg !261
  %40 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bitmapInfoHeader.addr, align 8, !dbg !263
  %width57 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %40, i32 0, i32 1, !dbg !264
  %41 = load i32, i32* %width57, align 4, !dbg !264
  %conv58 = sext i32 %41 to i64, !dbg !263
  %cmp59 = icmp ult i64 %39, %conv58, !dbg !265
  br i1 %cmp59, label %for.body61, label %for.end, !dbg !266

for.body61:                                       ; preds = %for.cond56
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !267
  %call62 = call i64 @fread(i8* %c, i64 1, i64 1, %struct._IO_FILE* %42), !dbg !270
  %cmp63 = icmp ne i64 %call62, 1, !dbg !271
  br i1 %cmp63, label %if.then65, label %if.end67, !dbg !272

if.then65:                                        ; preds = %for.body61
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !273
  %call66 = call i32 @fclose(%struct._IO_FILE* %43), !dbg !275
  store i16* null, i16** %retval, align 8, !dbg !276
  br label %return, !dbg !276

if.end67:                                         ; preds = %for.body61
  %44 = load i8, i8* %c, align 1, !dbg !277
  %conv68 = zext i8 %44 to i16, !dbg !278
  %45 = load i16*, i16** %bitmapImage, align 8, !dbg !279
  %46 = load i64, i64* %count, align 8, !dbg !280
  %inc = add i64 %46, 1, !dbg !280
  store i64 %inc, i64* %count, align 8, !dbg !280
  %arrayidx69 = getelementptr inbounds i16, i16* %45, i64 %46, !dbg !279
  store i16 %conv68, i16* %arrayidx69, align 2, !dbg !281
  br label %for.inc, !dbg !282

for.inc:                                          ; preds = %if.end67
  %47 = load i64, i64* %j, align 8, !dbg !283
  %inc70 = add i64 %47, 1, !dbg !283
  store i64 %inc70, i64* %j, align 8, !dbg !283
  br label %for.cond56, !dbg !284, !llvm.loop !285

for.end:                                          ; preds = %for.cond56
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !287
  %49 = load i64, i64* %pad, align 8, !dbg !288
  %call71 = call i32 @fseek(%struct._IO_FILE* %48, i64 %49, i32 1), !dbg !289
  br label %for.inc72, !dbg !290

for.inc72:                                        ; preds = %for.end
  %50 = load i64, i64* %i, align 8, !dbg !291
  %inc73 = add i64 %50, 1, !dbg !291
  store i64 %inc73, i64* %i, align 8, !dbg !291
  br label %for.cond, !dbg !292, !llvm.loop !293

for.end74:                                        ; preds = %for.cond
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !295
  %call75 = call i32 @fclose(%struct._IO_FILE* %51), !dbg !296
  %52 = load i16*, i16** %bitmapImage, align 8, !dbg !297
  store i16* %52, i16** %retval, align 8, !dbg !298
  br label %return, !dbg !298

return:                                           ; preds = %for.end74, %if.then65, %if.then43, %if.then36, %if.then26, %if.then20, %if.then8, %if.then3, %if.then
  %53 = load i16*, i16** %retval, align 8, !dbg !299
  ret i16* %53, !dbg !299
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #2

declare dso_local void @perror(i8*) #2

declare dso_local i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #2

declare dso_local i32 @fclose(%struct._IO_FILE*) #2

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

declare dso_local i32 @fseek(%struct._IO_FILE*, i64, i32) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.ceil.f64(double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i1 @save_bmp(i8* %filename, %struct.bitmap_info_header_t* %bmp_ih, i16* %data) #0 !dbg !300 {
entry:
  %retval = alloca i1, align 1
  %filename.addr = alloca i8*, align 8
  %bmp_ih.addr = alloca %struct.bitmap_info_header_t*, align 8
  %data.addr = alloca i16*, align 8
  %filePtr = alloca %struct._IO_FILE*, align 8
  %mag = alloca %struct.bmpfile_magic_t, align 1
  %offset = alloca i32, align 4
  %bmp_fh = alloca %struct.bmpfile_header_t, align 4
  %i = alloca i64, align 8
  %color = alloca %struct.rgb_t, align 1
  %pad = alloca i64, align 8
  %c = alloca i8, align 1
  %i44 = alloca i64, align 8
  %j = alloca i64, align 8
  %j70 = alloca i64, align 8
  store i8* %filename, i8** %filename.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %filename.addr, metadata !308, metadata !DIExpression()), !dbg !309
  store %struct.bitmap_info_header_t* %bmp_ih, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.bitmap_info_header_t** %bmp_ih.addr, metadata !310, metadata !DIExpression()), !dbg !311
  store i16* %data, i16** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i16** %data.addr, metadata !312, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %filePtr, metadata !314, metadata !DIExpression()), !dbg !315
  %0 = load i8*, i8** %filename.addr, align 8, !dbg !316
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0)), !dbg !317
  store %struct._IO_FILE* %call, %struct._IO_FILE** %filePtr, align 8, !dbg !315
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !318
  %cmp = icmp eq %struct._IO_FILE* %1, null, !dbg !320
  br i1 %cmp, label %if.then, label %if.end, !dbg !321

if.then:                                          ; preds = %entry
  store i1 true, i1* %retval, align 1, !dbg !322
  br label %return, !dbg !322

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.bmpfile_magic_t* %mag, metadata !323, metadata !DIExpression()), !dbg !324
  %2 = bitcast %struct.bmpfile_magic_t* %mag to i8*, !dbg !324
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds (%struct.bmpfile_magic_t, %struct.bmpfile_magic_t* @__const.save_bmp.mag, i32 0, i32 0, i32 0), i64 2, i1 false), !dbg !324
  %3 = bitcast %struct.bmpfile_magic_t* %mag to i8*, !dbg !325
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !327
  %call1 = call i64 @fwrite(i8* %3, i64 2, i64 1, %struct._IO_FILE* %4), !dbg !328
  %cmp2 = icmp ne i64 %call1, 1, !dbg !329
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !330

if.then3:                                         ; preds = %if.end
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !331
  %call4 = call i32 @fclose(%struct._IO_FILE* %5), !dbg !333
  store i1 true, i1* %retval, align 1, !dbg !334
  br label %return, !dbg !334

if.end5:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %offset, metadata !335, metadata !DIExpression()), !dbg !337
  %6 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !338
  %bitspp = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %6, i32 0, i32 4, !dbg !339
  %7 = load i16, i16* %bitspp, align 2, !dbg !339
  %conv = zext i16 %7 to i32, !dbg !338
  %shl = shl i32 1, %conv, !dbg !340
  %mul = mul i32 %shl, 4, !dbg !341
  %conv6 = zext i32 %mul to i64, !dbg !342
  %add = add i64 54, %conv6, !dbg !343
  %conv7 = trunc i64 %add to i32, !dbg !344
  store i32 %conv7, i32* %offset, align 4, !dbg !337
  call void @llvm.dbg.declare(metadata %struct.bmpfile_header_t* %bmp_fh, metadata !345, metadata !DIExpression()), !dbg !347
  %filesz = getelementptr inbounds %struct.bmpfile_header_t, %struct.bmpfile_header_t* %bmp_fh, i32 0, i32 0, !dbg !348
  %8 = load i32, i32* %offset, align 4, !dbg !349
  %9 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !350
  %bmp_bytesz = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %9, i32 0, i32 6, !dbg !351
  %10 = load i32, i32* %bmp_bytesz, align 4, !dbg !351
  %add8 = add i32 %8, %10, !dbg !352
  store i32 %add8, i32* %filesz, align 4, !dbg !348
  %creator1 = getelementptr inbounds %struct.bmpfile_header_t, %struct.bmpfile_header_t* %bmp_fh, i32 0, i32 1, !dbg !348
  store i16 0, i16* %creator1, align 4, !dbg !348
  %creator2 = getelementptr inbounds %struct.bmpfile_header_t, %struct.bmpfile_header_t* %bmp_fh, i32 0, i32 2, !dbg !348
  store i16 0, i16* %creator2, align 2, !dbg !348
  %bmp_offset = getelementptr inbounds %struct.bmpfile_header_t, %struct.bmpfile_header_t* %bmp_fh, i32 0, i32 3, !dbg !348
  %11 = load i32, i32* %offset, align 4, !dbg !353
  store i32 %11, i32* %bmp_offset, align 4, !dbg !348
  %12 = bitcast %struct.bmpfile_header_t* %bmp_fh to i8*, !dbg !354
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !356
  %call9 = call i64 @fwrite(i8* %12, i64 12, i64 1, %struct._IO_FILE* %13), !dbg !357
  %cmp10 = icmp ne i64 %call9, 1, !dbg !358
  br i1 %cmp10, label %if.then12, label %if.end14, !dbg !359

if.then12:                                        ; preds = %if.end5
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !360
  %call13 = call i32 @fclose(%struct._IO_FILE* %14), !dbg !362
  store i1 true, i1* %retval, align 1, !dbg !363
  br label %return, !dbg !363

if.end14:                                         ; preds = %if.end5
  %15 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !364
  %16 = bitcast %struct.bitmap_info_header_t* %15 to i8*, !dbg !364
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !366
  %call15 = call i64 @fwrite(i8* %16, i64 40, i64 1, %struct._IO_FILE* %17), !dbg !367
  %cmp16 = icmp ne i64 %call15, 1, !dbg !368
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !369

if.then18:                                        ; preds = %if.end14
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !370
  %call19 = call i32 @fclose(%struct._IO_FILE* %18), !dbg !372
  store i1 true, i1* %retval, align 1, !dbg !373
  br label %return, !dbg !373

if.end20:                                         ; preds = %if.end14
  call void @llvm.dbg.declare(metadata i64* %i, metadata !374, metadata !DIExpression()), !dbg !376
  store i64 0, i64* %i, align 8, !dbg !376
  br label %for.cond, !dbg !377

for.cond:                                         ; preds = %for.inc, %if.end20
  %19 = load i64, i64* %i, align 8, !dbg !378
  %20 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !380
  %bitspp21 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %20, i32 0, i32 4, !dbg !381
  %21 = load i16, i16* %bitspp21, align 2, !dbg !381
  %conv22 = zext i16 %21 to i32, !dbg !380
  %shl23 = shl i32 1, %conv22, !dbg !382
  %conv24 = zext i32 %shl23 to i64, !dbg !383
  %cmp25 = icmp ult i64 %19, %conv24, !dbg !384
  br i1 %cmp25, label %for.body, label %for.end, !dbg !385

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct.rgb_t* %color, metadata !386, metadata !DIExpression()), !dbg !396
  %r = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %color, i32 0, i32 0, !dbg !397
  %22 = load i64, i64* %i, align 8, !dbg !398
  %conv27 = trunc i64 %22 to i8, !dbg !399
  store i8 %conv27, i8* %r, align 1, !dbg !397
  %g = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %color, i32 0, i32 1, !dbg !397
  %23 = load i64, i64* %i, align 8, !dbg !400
  %conv28 = trunc i64 %23 to i8, !dbg !401
  store i8 %conv28, i8* %g, align 1, !dbg !397
  %b = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %color, i32 0, i32 2, !dbg !397
  %24 = load i64, i64* %i, align 8, !dbg !402
  %conv29 = trunc i64 %24 to i8, !dbg !403
  store i8 %conv29, i8* %b, align 1, !dbg !397
  %nothing = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %color, i32 0, i32 3, !dbg !397
  store i8 0, i8* %nothing, align 1, !dbg !397
  %25 = bitcast %struct.rgb_t* %color to i8*, !dbg !404
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !406
  %call30 = call i64 @fwrite(i8* %25, i64 4, i64 1, %struct._IO_FILE* %26), !dbg !407
  %cmp31 = icmp ne i64 %call30, 1, !dbg !408
  br i1 %cmp31, label %if.then33, label %if.end35, !dbg !409

if.then33:                                        ; preds = %for.body
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !410
  %call34 = call i32 @fclose(%struct._IO_FILE* %27), !dbg !412
  store i1 true, i1* %retval, align 1, !dbg !413
  br label %return, !dbg !413

if.end35:                                         ; preds = %for.body
  br label %for.inc, !dbg !414

for.inc:                                          ; preds = %if.end35
  %28 = load i64, i64* %i, align 8, !dbg !415
  %inc = add i64 %28, 1, !dbg !415
  store i64 %inc, i64* %i, align 8, !dbg !415
  br label %for.cond, !dbg !416, !llvm.loop !417

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %pad, metadata !419, metadata !DIExpression()), !dbg !420
  %29 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !421
  %bitspp36 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %29, i32 0, i32 4, !dbg !422
  %30 = load i16, i16* %bitspp36, align 2, !dbg !422
  %conv37 = zext i16 %30 to i32, !dbg !421
  %31 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !423
  %width = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %31, i32 0, i32 1, !dbg !424
  %32 = load i32, i32* %width, align 4, !dbg !424
  %mul38 = mul nsw i32 %conv37, %32, !dbg !425
  %conv39 = sitofp i32 %mul38 to double, !dbg !421
  %div = fdiv double %conv39, 3.200000e+01, !dbg !426
  %33 = call double @llvm.ceil.f64(double %div), !dbg !427
  %mul40 = fmul double 4.000000e+00, %33, !dbg !428
  %34 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !429
  %width41 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %34, i32 0, i32 1, !dbg !430
  %35 = load i32, i32* %width41, align 4, !dbg !430
  %conv42 = sitofp i32 %35 to double, !dbg !429
  %sub = fsub double %mul40, %conv42, !dbg !431
  %conv43 = fptoui double %sub to i64, !dbg !432
  store i64 %conv43, i64* %pad, align 8, !dbg !420
  call void @llvm.dbg.declare(metadata i8* %c, metadata !433, metadata !DIExpression()), !dbg !434
  call void @llvm.dbg.declare(metadata i64* %i44, metadata !435, metadata !DIExpression()), !dbg !437
  store i64 0, i64* %i44, align 8, !dbg !437
  br label %for.cond45, !dbg !438

for.cond45:                                       ; preds = %for.inc84, %for.end
  %36 = load i64, i64* %i44, align 8, !dbg !439
  %37 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !441
  %height = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %37, i32 0, i32 2, !dbg !442
  %38 = load i32, i32* %height, align 4, !dbg !442
  %conv46 = sext i32 %38 to i64, !dbg !441
  %cmp47 = icmp ult i64 %36, %conv46, !dbg !443
  br i1 %cmp47, label %for.body49, label %for.end86, !dbg !444

for.body49:                                       ; preds = %for.cond45
  call void @llvm.dbg.declare(metadata i64* %j, metadata !445, metadata !DIExpression()), !dbg !448
  store i64 0, i64* %j, align 8, !dbg !448
  br label %for.cond50, !dbg !449

for.cond50:                                       ; preds = %for.inc67, %for.body49
  %39 = load i64, i64* %j, align 8, !dbg !450
  %40 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !452
  %width51 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %40, i32 0, i32 1, !dbg !453
  %41 = load i32, i32* %width51, align 4, !dbg !453
  %conv52 = sext i32 %41 to i64, !dbg !452
  %cmp53 = icmp ult i64 %39, %conv52, !dbg !454
  br i1 %cmp53, label %for.body55, label %for.end69, !dbg !455

for.body55:                                       ; preds = %for.cond50
  %42 = load i16*, i16** %data.addr, align 8, !dbg !456
  %43 = load i64, i64* %j, align 8, !dbg !458
  %44 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !459
  %width56 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %44, i32 0, i32 1, !dbg !460
  %45 = load i32, i32* %width56, align 4, !dbg !460
  %conv57 = sext i32 %45 to i64, !dbg !459
  %46 = load i64, i64* %i44, align 8, !dbg !461
  %mul58 = mul i64 %conv57, %46, !dbg !462
  %add59 = add i64 %43, %mul58, !dbg !463
  %arrayidx = getelementptr inbounds i16, i16* %42, i64 %add59, !dbg !456
  %47 = load i16, i16* %arrayidx, align 2, !dbg !456
  %conv60 = trunc i16 %47 to i8, !dbg !464
  store i8 %conv60, i8* %c, align 1, !dbg !465
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !466
  %call61 = call i64 @fwrite(i8* %c, i64 1, i64 1, %struct._IO_FILE* %48), !dbg !468
  %cmp62 = icmp ne i64 %call61, 1, !dbg !469
  br i1 %cmp62, label %if.then64, label %if.end66, !dbg !470

if.then64:                                        ; preds = %for.body55
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !471
  %call65 = call i32 @fclose(%struct._IO_FILE* %49), !dbg !473
  store i1 true, i1* %retval, align 1, !dbg !474
  br label %return, !dbg !474

if.end66:                                         ; preds = %for.body55
  br label %for.inc67, !dbg !475

for.inc67:                                        ; preds = %if.end66
  %50 = load i64, i64* %j, align 8, !dbg !476
  %inc68 = add i64 %50, 1, !dbg !476
  store i64 %inc68, i64* %j, align 8, !dbg !476
  br label %for.cond50, !dbg !477, !llvm.loop !478

for.end69:                                        ; preds = %for.cond50
  store i8 0, i8* %c, align 1, !dbg !480
  call void @llvm.dbg.declare(metadata i64* %j70, metadata !481, metadata !DIExpression()), !dbg !483
  store i64 0, i64* %j70, align 8, !dbg !483
  br label %for.cond71, !dbg !484

for.cond71:                                       ; preds = %for.inc81, %for.end69
  %51 = load i64, i64* %j70, align 8, !dbg !485
  %52 = load i64, i64* %pad, align 8, !dbg !487
  %cmp72 = icmp ult i64 %51, %52, !dbg !488
  br i1 %cmp72, label %for.body74, label %for.end83, !dbg !489

for.body74:                                       ; preds = %for.cond71
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !490
  %call75 = call i64 @fwrite(i8* %c, i64 1, i64 1, %struct._IO_FILE* %53), !dbg !492
  %cmp76 = icmp ne i64 %call75, 1, !dbg !493
  br i1 %cmp76, label %if.then78, label %if.end80, !dbg !494

if.then78:                                        ; preds = %for.body74
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !495
  %call79 = call i32 @fclose(%struct._IO_FILE* %54), !dbg !497
  store i1 true, i1* %retval, align 1, !dbg !498
  br label %return, !dbg !498

if.end80:                                         ; preds = %for.body74
  br label %for.inc81, !dbg !499

for.inc81:                                        ; preds = %if.end80
  %55 = load i64, i64* %j70, align 8, !dbg !500
  %inc82 = add i64 %55, 1, !dbg !500
  store i64 %inc82, i64* %j70, align 8, !dbg !500
  br label %for.cond71, !dbg !501, !llvm.loop !502

for.end83:                                        ; preds = %for.cond71
  br label %for.inc84, !dbg !504

for.inc84:                                        ; preds = %for.end83
  %56 = load i64, i64* %i44, align 8, !dbg !505
  %inc85 = add i64 %56, 1, !dbg !505
  store i64 %inc85, i64* %i44, align 8, !dbg !505
  br label %for.cond45, !dbg !506, !llvm.loop !507

for.end86:                                        ; preds = %for.cond45
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !509
  %call87 = call i32 @fclose(%struct._IO_FILE* %57), !dbg !510
  store i1 false, i1* %retval, align 1, !dbg !511
  br label %return, !dbg !511

return:                                           ; preds = %for.end86, %if.then78, %if.then64, %if.then33, %if.then18, %if.then12, %if.then3, %if.then
  %58 = load i1, i1* %retval, align 1, !dbg !512
  ret i1 %58, !dbg !512
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @convolution(i16* %in, i16* %out, float* %kernel, i32 %nx, i32 %ny, i32 %kn, i1 zeroext %normalize) #0 !dbg !513 {
entry:
  %in.addr = alloca i16*, align 8
  %out.addr = alloca i16*, align 8
  %kernel.addr = alloca float*, align 8
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %kn.addr = alloca i32, align 4
  %normalize.addr = alloca i8, align 1
  %khalf = alloca i32, align 4
  %min = alloca float, align 4
  %max = alloca float, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %pixel = alloca float, align 4
  %c = alloca i64, align 8
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %m45 = alloca i32, align 4
  %n51 = alloca i32, align 4
  %pixel57 = alloca float, align 4
  %c58 = alloca i64, align 8
  %j59 = alloca i32, align 4
  %i65 = alloca i32, align 4
  store i16* %in, i16** %in.addr, align 8
  call void @llvm.dbg.declare(metadata i16** %in.addr, metadata !519, metadata !DIExpression()), !dbg !520
  store i16* %out, i16** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i16** %out.addr, metadata !521, metadata !DIExpression()), !dbg !522
  store float* %kernel, float** %kernel.addr, align 8
  call void @llvm.dbg.declare(metadata float** %kernel.addr, metadata !523, metadata !DIExpression()), !dbg !524
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !525, metadata !DIExpression()), !dbg !526
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !527, metadata !DIExpression()), !dbg !528
  store i32 %kn, i32* %kn.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %kn.addr, metadata !529, metadata !DIExpression()), !dbg !530
  %frombool = zext i1 %normalize to i8
  store i8 %frombool, i8* %normalize.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %normalize.addr, metadata !531, metadata !DIExpression()), !dbg !532
  %0 = load i32, i32* %kn.addr, align 4, !dbg !533
  %rem = srem i32 %0, 2, !dbg !533
  %cmp = icmp eq i32 %rem, 1, !dbg !533
  br i1 %cmp, label %if.then, label %if.else, !dbg !536

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !536

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.6, i64 0, i64 0), i32 223, i8* getelementptr inbounds ([106 x i8], [106 x i8]* @__PRETTY_FUNCTION__.convolution, i64 0, i64 0)) #7, !dbg !533
  unreachable, !dbg !533

if.end:                                           ; preds = %if.then
  %1 = load i32, i32* %nx.addr, align 4, !dbg !537
  %2 = load i32, i32* %kn.addr, align 4, !dbg !537
  %cmp1 = icmp sgt i32 %1, %2, !dbg !537
  br i1 %cmp1, label %land.lhs.true, label %if.else4, !dbg !537

land.lhs.true:                                    ; preds = %if.end
  %3 = load i32, i32* %ny.addr, align 4, !dbg !537
  %4 = load i32, i32* %kn.addr, align 4, !dbg !537
  %cmp2 = icmp sgt i32 %3, %4, !dbg !537
  br i1 %cmp2, label %if.then3, label %if.else4, !dbg !540

if.then3:                                         ; preds = %land.lhs.true
  br label %if.end5, !dbg !540

if.else4:                                         ; preds = %land.lhs.true, %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.6, i64 0, i64 0), i32 224, i8* getelementptr inbounds ([106 x i8], [106 x i8]* @__PRETTY_FUNCTION__.convolution, i64 0, i64 0)) #7, !dbg !537
  unreachable, !dbg !537

if.end5:                                          ; preds = %if.then3
  call void @llvm.dbg.declare(metadata i32* %khalf, metadata !541, metadata !DIExpression()), !dbg !542
  %5 = load i32, i32* %kn.addr, align 4, !dbg !543
  %div = sdiv i32 %5, 2, !dbg !544
  store i32 %div, i32* %khalf, align 4, !dbg !542
  call void @llvm.dbg.declare(metadata float* %min, metadata !545, metadata !DIExpression()), !dbg !546
  store float 0x47EFFFFFE0000000, float* %min, align 4, !dbg !546
  call void @llvm.dbg.declare(metadata float* %max, metadata !547, metadata !DIExpression()), !dbg !548
  store float 0xC7EFFFFFE0000000, float* %max, align 4, !dbg !548
  %6 = load i8, i8* %normalize.addr, align 1, !dbg !549
  %tobool = trunc i8 %6 to i1, !dbg !549
  br i1 %tobool, label %if.then6, label %if.end44, !dbg !551

if.then6:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %m, metadata !552, metadata !DIExpression()), !dbg !554
  %7 = load i32, i32* %khalf, align 4, !dbg !555
  store i32 %7, i32* %m, align 4, !dbg !554
  br label %for.cond, !dbg !556

for.cond:                                         ; preds = %for.inc41, %if.then6
  %8 = load i32, i32* %m, align 4, !dbg !557
  %9 = load i32, i32* %nx.addr, align 4, !dbg !559
  %10 = load i32, i32* %khalf, align 4, !dbg !560
  %sub = sub nsw i32 %9, %10, !dbg !561
  %cmp7 = icmp slt i32 %8, %sub, !dbg !562
  br i1 %cmp7, label %for.body, label %for.end43, !dbg !563

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %n, metadata !564, metadata !DIExpression()), !dbg !566
  %11 = load i32, i32* %khalf, align 4, !dbg !567
  store i32 %11, i32* %n, align 4, !dbg !566
  br label %for.cond8, !dbg !568

for.cond8:                                        ; preds = %for.inc38, %for.body
  %12 = load i32, i32* %n, align 4, !dbg !569
  %13 = load i32, i32* %ny.addr, align 4, !dbg !571
  %14 = load i32, i32* %khalf, align 4, !dbg !572
  %sub9 = sub nsw i32 %13, %14, !dbg !573
  %cmp10 = icmp slt i32 %12, %sub9, !dbg !574
  br i1 %cmp10, label %for.body11, label %for.end40, !dbg !575

for.body11:                                       ; preds = %for.cond8
  call void @llvm.dbg.declare(metadata float* %pixel, metadata !576, metadata !DIExpression()), !dbg !578
  store float 0.000000e+00, float* %pixel, align 4, !dbg !578
  call void @llvm.dbg.declare(metadata i64* %c, metadata !579, metadata !DIExpression()), !dbg !580
  store i64 0, i64* %c, align 8, !dbg !580
  call void @llvm.dbg.declare(metadata i32* %j, metadata !581, metadata !DIExpression()), !dbg !583
  %15 = load i32, i32* %khalf, align 4, !dbg !584
  %sub12 = sub nsw i32 0, %15, !dbg !585
  store i32 %sub12, i32* %j, align 4, !dbg !583
  br label %for.cond13, !dbg !586

for.cond13:                                       ; preds = %for.inc27, %for.body11
  %16 = load i32, i32* %j, align 4, !dbg !587
  %17 = load i32, i32* %khalf, align 4, !dbg !589
  %cmp14 = icmp sle i32 %16, %17, !dbg !590
  br i1 %cmp14, label %for.body15, label %for.end29, !dbg !591

for.body15:                                       ; preds = %for.cond13
  call void @llvm.dbg.declare(metadata i32* %i, metadata !592, metadata !DIExpression()), !dbg !594
  %18 = load i32, i32* %khalf, align 4, !dbg !595
  %sub16 = sub nsw i32 0, %18, !dbg !596
  store i32 %sub16, i32* %i, align 4, !dbg !594
  br label %for.cond17, !dbg !597

for.cond17:                                       ; preds = %for.inc, %for.body15
  %19 = load i32, i32* %i, align 4, !dbg !598
  %20 = load i32, i32* %khalf, align 4, !dbg !600
  %cmp18 = icmp sle i32 %19, %20, !dbg !601
  br i1 %cmp18, label %for.body19, label %for.end, !dbg !602

for.body19:                                       ; preds = %for.cond17
  %21 = load i16*, i16** %in.addr, align 8, !dbg !603
  %22 = load i32, i32* %n, align 4, !dbg !605
  %23 = load i32, i32* %j, align 4, !dbg !606
  %sub20 = sub nsw i32 %22, %23, !dbg !607
  %24 = load i32, i32* %nx.addr, align 4, !dbg !608
  %mul = mul nsw i32 %sub20, %24, !dbg !609
  %25 = load i32, i32* %m, align 4, !dbg !610
  %add = add nsw i32 %mul, %25, !dbg !611
  %26 = load i32, i32* %i, align 4, !dbg !612
  %sub21 = sub nsw i32 %add, %26, !dbg !613
  %idxprom = sext i32 %sub21 to i64, !dbg !603
  %arrayidx = getelementptr inbounds i16, i16* %21, i64 %idxprom, !dbg !603
  %27 = load i16, i16* %arrayidx, align 2, !dbg !603
  %conv = sext i16 %27 to i32, !dbg !603
  %conv22 = sitofp i32 %conv to float, !dbg !603
  %28 = load float*, float** %kernel.addr, align 8, !dbg !614
  %29 = load i64, i64* %c, align 8, !dbg !615
  %arrayidx23 = getelementptr inbounds float, float* %28, i64 %29, !dbg !614
  %30 = load float, float* %arrayidx23, align 4, !dbg !614
  %mul24 = fmul float %conv22, %30, !dbg !616
  %31 = load float, float* %pixel, align 4, !dbg !617
  %add25 = fadd float %31, %mul24, !dbg !617
  store float %add25, float* %pixel, align 4, !dbg !617
  %32 = load i64, i64* %c, align 8, !dbg !618
  %inc = add i64 %32, 1, !dbg !618
  store i64 %inc, i64* %c, align 8, !dbg !618
  br label %for.inc, !dbg !619

for.inc:                                          ; preds = %for.body19
  %33 = load i32, i32* %i, align 4, !dbg !620
  %inc26 = add nsw i32 %33, 1, !dbg !620
  store i32 %inc26, i32* %i, align 4, !dbg !620
  br label %for.cond17, !dbg !621, !llvm.loop !622

for.end:                                          ; preds = %for.cond17
  br label %for.inc27, !dbg !623

for.inc27:                                        ; preds = %for.end
  %34 = load i32, i32* %j, align 4, !dbg !624
  %inc28 = add nsw i32 %34, 1, !dbg !624
  store i32 %inc28, i32* %j, align 4, !dbg !624
  br label %for.cond13, !dbg !625, !llvm.loop !626

for.end29:                                        ; preds = %for.cond13
  %35 = load float, float* %pixel, align 4, !dbg !628
  %36 = load float, float* %min, align 4, !dbg !630
  %cmp30 = fcmp olt float %35, %36, !dbg !631
  br i1 %cmp30, label %if.then32, label %if.end33, !dbg !632

if.then32:                                        ; preds = %for.end29
  %37 = load float, float* %pixel, align 4, !dbg !633
  store float %37, float* %min, align 4, !dbg !634
  br label %if.end33, !dbg !635

if.end33:                                         ; preds = %if.then32, %for.end29
  %38 = load float, float* %pixel, align 4, !dbg !636
  %39 = load float, float* %max, align 4, !dbg !638
  %cmp34 = fcmp ogt float %38, %39, !dbg !639
  br i1 %cmp34, label %if.then36, label %if.end37, !dbg !640

if.then36:                                        ; preds = %if.end33
  %40 = load float, float* %pixel, align 4, !dbg !641
  store float %40, float* %max, align 4, !dbg !642
  br label %if.end37, !dbg !643

if.end37:                                         ; preds = %if.then36, %if.end33
  br label %for.inc38, !dbg !644

for.inc38:                                        ; preds = %if.end37
  %41 = load i32, i32* %n, align 4, !dbg !645
  %inc39 = add nsw i32 %41, 1, !dbg !645
  store i32 %inc39, i32* %n, align 4, !dbg !645
  br label %for.cond8, !dbg !646, !llvm.loop !647

for.end40:                                        ; preds = %for.cond8
  br label %for.inc41, !dbg !648

for.inc41:                                        ; preds = %for.end40
  %42 = load i32, i32* %m, align 4, !dbg !649
  %inc42 = add nsw i32 %42, 1, !dbg !649
  store i32 %inc42, i32* %m, align 4, !dbg !649
  br label %for.cond, !dbg !650, !llvm.loop !651

for.end43:                                        ; preds = %for.cond
  br label %if.end44, !dbg !652

if.end44:                                         ; preds = %for.end43, %if.end5
  call void @llvm.dbg.declare(metadata i32* %m45, metadata !653, metadata !DIExpression()), !dbg !655
  %43 = load i32, i32* %khalf, align 4, !dbg !656
  store i32 %43, i32* %m45, align 4, !dbg !655
  br label %for.cond46, !dbg !657

for.cond46:                                       ; preds = %for.inc104, %if.end44
  %44 = load i32, i32* %m45, align 4, !dbg !658
  %45 = load i32, i32* %nx.addr, align 4, !dbg !660
  %46 = load i32, i32* %khalf, align 4, !dbg !661
  %sub47 = sub nsw i32 %45, %46, !dbg !662
  %cmp48 = icmp slt i32 %44, %sub47, !dbg !663
  br i1 %cmp48, label %for.body50, label %for.end106, !dbg !664

for.body50:                                       ; preds = %for.cond46
  call void @llvm.dbg.declare(metadata i32* %n51, metadata !665, metadata !DIExpression()), !dbg !667
  %47 = load i32, i32* %khalf, align 4, !dbg !668
  store i32 %47, i32* %n51, align 4, !dbg !667
  br label %for.cond52, !dbg !669

for.cond52:                                       ; preds = %for.inc101, %for.body50
  %48 = load i32, i32* %n51, align 4, !dbg !670
  %49 = load i32, i32* %ny.addr, align 4, !dbg !672
  %50 = load i32, i32* %khalf, align 4, !dbg !673
  %sub53 = sub nsw i32 %49, %50, !dbg !674
  %cmp54 = icmp slt i32 %48, %sub53, !dbg !675
  br i1 %cmp54, label %for.body56, label %for.end103, !dbg !676

for.body56:                                       ; preds = %for.cond52
  call void @llvm.dbg.declare(metadata float* %pixel57, metadata !677, metadata !DIExpression()), !dbg !679
  store float 0.000000e+00, float* %pixel57, align 4, !dbg !679
  call void @llvm.dbg.declare(metadata i64* %c58, metadata !680, metadata !DIExpression()), !dbg !681
  store i64 0, i64* %c58, align 8, !dbg !681
  call void @llvm.dbg.declare(metadata i32* %j59, metadata !682, metadata !DIExpression()), !dbg !684
  %51 = load i32, i32* %khalf, align 4, !dbg !685
  %sub60 = sub nsw i32 0, %51, !dbg !686
  store i32 %sub60, i32* %j59, align 4, !dbg !684
  br label %for.cond61, !dbg !687

for.cond61:                                       ; preds = %for.inc86, %for.body56
  %52 = load i32, i32* %j59, align 4, !dbg !688
  %53 = load i32, i32* %khalf, align 4, !dbg !690
  %cmp62 = icmp sle i32 %52, %53, !dbg !691
  br i1 %cmp62, label %for.body64, label %for.end88, !dbg !692

for.body64:                                       ; preds = %for.cond61
  call void @llvm.dbg.declare(metadata i32* %i65, metadata !693, metadata !DIExpression()), !dbg !695
  %54 = load i32, i32* %khalf, align 4, !dbg !696
  %sub66 = sub nsw i32 0, %54, !dbg !697
  store i32 %sub66, i32* %i65, align 4, !dbg !695
  br label %for.cond67, !dbg !698

for.cond67:                                       ; preds = %for.inc83, %for.body64
  %55 = load i32, i32* %i65, align 4, !dbg !699
  %56 = load i32, i32* %khalf, align 4, !dbg !701
  %cmp68 = icmp sle i32 %55, %56, !dbg !702
  br i1 %cmp68, label %for.body70, label %for.end85, !dbg !703

for.body70:                                       ; preds = %for.cond67
  %57 = load i16*, i16** %in.addr, align 8, !dbg !704
  %58 = load i32, i32* %n51, align 4, !dbg !706
  %59 = load i32, i32* %j59, align 4, !dbg !707
  %sub71 = sub nsw i32 %58, %59, !dbg !708
  %60 = load i32, i32* %nx.addr, align 4, !dbg !709
  %mul72 = mul nsw i32 %sub71, %60, !dbg !710
  %61 = load i32, i32* %m45, align 4, !dbg !711
  %add73 = add nsw i32 %mul72, %61, !dbg !712
  %62 = load i32, i32* %i65, align 4, !dbg !713
  %sub74 = sub nsw i32 %add73, %62, !dbg !714
  %idxprom75 = sext i32 %sub74 to i64, !dbg !704
  %arrayidx76 = getelementptr inbounds i16, i16* %57, i64 %idxprom75, !dbg !704
  %63 = load i16, i16* %arrayidx76, align 2, !dbg !704
  %conv77 = sext i16 %63 to i32, !dbg !704
  %conv78 = sitofp i32 %conv77 to float, !dbg !704
  %64 = load float*, float** %kernel.addr, align 8, !dbg !715
  %65 = load i64, i64* %c58, align 8, !dbg !716
  %arrayidx79 = getelementptr inbounds float, float* %64, i64 %65, !dbg !715
  %66 = load float, float* %arrayidx79, align 4, !dbg !715
  %mul80 = fmul float %conv78, %66, !dbg !717
  %67 = load float, float* %pixel57, align 4, !dbg !718
  %add81 = fadd float %67, %mul80, !dbg !718
  store float %add81, float* %pixel57, align 4, !dbg !718
  %68 = load i64, i64* %c58, align 8, !dbg !719
  %inc82 = add i64 %68, 1, !dbg !719
  store i64 %inc82, i64* %c58, align 8, !dbg !719
  br label %for.inc83, !dbg !720

for.inc83:                                        ; preds = %for.body70
  %69 = load i32, i32* %i65, align 4, !dbg !721
  %inc84 = add nsw i32 %69, 1, !dbg !721
  store i32 %inc84, i32* %i65, align 4, !dbg !721
  br label %for.cond67, !dbg !722, !llvm.loop !723

for.end85:                                        ; preds = %for.cond67
  br label %for.inc86, !dbg !724

for.inc86:                                        ; preds = %for.end85
  %70 = load i32, i32* %j59, align 4, !dbg !725
  %inc87 = add nsw i32 %70, 1, !dbg !725
  store i32 %inc87, i32* %j59, align 4, !dbg !725
  br label %for.cond61, !dbg !726, !llvm.loop !727

for.end88:                                        ; preds = %for.cond61
  %71 = load i8, i8* %normalize.addr, align 1, !dbg !729
  %tobool89 = trunc i8 %71 to i1, !dbg !729
  br i1 %tobool89, label %if.then90, label %if.end95, !dbg !731

if.then90:                                        ; preds = %for.end88
  %72 = load float, float* %pixel57, align 4, !dbg !732
  %73 = load float, float* %min, align 4, !dbg !733
  %sub91 = fsub float %72, %73, !dbg !734
  %mul92 = fmul float 2.550000e+02, %sub91, !dbg !735
  %74 = load float, float* %max, align 4, !dbg !736
  %75 = load float, float* %min, align 4, !dbg !737
  %sub93 = fsub float %74, %75, !dbg !738
  %div94 = fdiv float %mul92, %sub93, !dbg !739
  store float %div94, float* %pixel57, align 4, !dbg !740
  br label %if.end95, !dbg !741

if.end95:                                         ; preds = %if.then90, %for.end88
  %76 = load float, float* %pixel57, align 4, !dbg !742
  %conv96 = fptosi float %76 to i16, !dbg !743
  %77 = load i16*, i16** %out.addr, align 8, !dbg !744
  %78 = load i32, i32* %n51, align 4, !dbg !745
  %79 = load i32, i32* %nx.addr, align 4, !dbg !746
  %mul97 = mul nsw i32 %78, %79, !dbg !747
  %80 = load i32, i32* %m45, align 4, !dbg !748
  %add98 = add nsw i32 %mul97, %80, !dbg !749
  %idxprom99 = sext i32 %add98 to i64, !dbg !744
  %arrayidx100 = getelementptr inbounds i16, i16* %77, i64 %idxprom99, !dbg !744
  store i16 %conv96, i16* %arrayidx100, align 2, !dbg !750
  br label %for.inc101, !dbg !751

for.inc101:                                       ; preds = %if.end95
  %81 = load i32, i32* %n51, align 4, !dbg !752
  %inc102 = add nsw i32 %81, 1, !dbg !752
  store i32 %inc102, i32* %n51, align 4, !dbg !752
  br label %for.cond52, !dbg !753, !llvm.loop !754

for.end103:                                       ; preds = %for.cond52
  br label %for.inc104, !dbg !755

for.inc104:                                       ; preds = %for.end103
  %82 = load i32, i32* %m45, align 4, !dbg !756
  %inc105 = add nsw i32 %82, 1, !dbg !756
  store i32 %inc105, i32* %m45, align 4, !dbg !756
  br label %for.cond46, !dbg !757, !llvm.loop !758

for.end106:                                       ; preds = %for.cond46
  ret void, !dbg !760
}

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @gaussian_filter(i16* %in, i16* %out, i32 %nx, i32 %ny, float %sigma) #0 !dbg !761 {
entry:
  %in.addr = alloca i16*, align 8
  %out.addr = alloca i16*, align 8
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %sigma.addr = alloca float, align 4
  %n = alloca i32, align 4
  %mean = alloca float, align 4
  %saved_stack = alloca i8*, align 8
  %__vla_expr0 = alloca i64, align 8
  %c = alloca i64, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i16* %in, i16** %in.addr, align 8
  call void @llvm.dbg.declare(metadata i16** %in.addr, metadata !764, metadata !DIExpression()), !dbg !765
  store i16* %out, i16** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i16** %out.addr, metadata !766, metadata !DIExpression()), !dbg !767
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !768, metadata !DIExpression()), !dbg !769
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !770, metadata !DIExpression()), !dbg !771
  store float %sigma, float* %sigma.addr, align 4
  call void @llvm.dbg.declare(metadata float* %sigma.addr, metadata !772, metadata !DIExpression()), !dbg !773
  call void @llvm.dbg.declare(metadata i32* %n, metadata !774, metadata !DIExpression()), !dbg !775
  %0 = load float, float* %sigma.addr, align 4, !dbg !776
  %mul = fmul float 2.000000e+00, %0, !dbg !777
  %conv = fptosi float %mul to i32, !dbg !778
  %mul1 = mul nsw i32 2, %conv, !dbg !779
  %add = add nsw i32 %mul1, 3, !dbg !780
  store i32 %add, i32* %n, align 4, !dbg !775
  call void @llvm.dbg.declare(metadata float* %mean, metadata !781, metadata !DIExpression()), !dbg !782
  %1 = load i32, i32* %n, align 4, !dbg !783
  %conv2 = sitofp i32 %1 to double, !dbg !783
  %div = fdiv double %conv2, 2.000000e+00, !dbg !784
  %2 = call double @llvm.floor.f64(double %div), !dbg !785
  %conv3 = fptrunc double %2 to float, !dbg !786
  store float %conv3, float* %mean, align 4, !dbg !782
  %3 = load i32, i32* %n, align 4, !dbg !787
  %4 = load i32, i32* %n, align 4, !dbg !788
  %mul4 = mul nsw i32 %3, %4, !dbg !789
  %5 = zext i32 %mul4 to i64, !dbg !790
  %6 = call i8* @llvm.stacksave(), !dbg !790
  store i8* %6, i8** %saved_stack, align 8, !dbg !790
  %vla = alloca float, i64 %5, align 16, !dbg !790
  store i64 %5, i64* %__vla_expr0, align 8, !dbg !790
  call void @llvm.dbg.declare(metadata i64* %__vla_expr0, metadata !791, metadata !DIExpression()), !dbg !792
  call void @llvm.dbg.declare(metadata float* %vla, metadata !793, metadata !DIExpression()), !dbg !797
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !798
  %8 = load i32, i32* %n, align 4, !dbg !799
  %9 = load float, float* %sigma.addr, align 4, !dbg !800
  %conv5 = fpext float %9 to double, !dbg !800
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.8, i64 0, i64 0), i32 %8, double %conv5), !dbg !801
  call void @llvm.dbg.declare(metadata i64* %c, metadata !802, metadata !DIExpression()), !dbg !803
  store i64 0, i64* %c, align 8, !dbg !803
  call void @llvm.dbg.declare(metadata i32* %i, metadata !804, metadata !DIExpression()), !dbg !806
  store i32 0, i32* %i, align 4, !dbg !806
  br label %for.cond, !dbg !807

for.cond:                                         ; preds = %for.inc30, %entry
  %10 = load i32, i32* %i, align 4, !dbg !808
  %11 = load i32, i32* %n, align 4, !dbg !810
  %cmp = icmp slt i32 %10, %11, !dbg !811
  br i1 %cmp, label %for.body, label %for.end32, !dbg !812

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !813, metadata !DIExpression()), !dbg !815
  store i32 0, i32* %j, align 4, !dbg !815
  br label %for.cond7, !dbg !816

for.cond7:                                        ; preds = %for.inc, %for.body
  %12 = load i32, i32* %j, align 4, !dbg !817
  %13 = load i32, i32* %n, align 4, !dbg !819
  %cmp8 = icmp slt i32 %12, %13, !dbg !820
  br i1 %cmp8, label %for.body10, label %for.end, !dbg !821

for.body10:                                       ; preds = %for.cond7
  %14 = load i32, i32* %i, align 4, !dbg !822
  %conv11 = sitofp i32 %14 to float, !dbg !822
  %15 = load float, float* %mean, align 4, !dbg !824
  %sub = fsub float %conv11, %15, !dbg !825
  %16 = load float, float* %sigma.addr, align 4, !dbg !826
  %div12 = fdiv float %sub, %16, !dbg !827
  %conv13 = fpext float %div12 to double, !dbg !828
  %call14 = call double @pow(double %conv13, double 2.000000e+00) #6, !dbg !829
  %17 = load i32, i32* %j, align 4, !dbg !830
  %conv15 = sitofp i32 %17 to float, !dbg !830
  %18 = load float, float* %mean, align 4, !dbg !831
  %sub16 = fsub float %conv15, %18, !dbg !832
  %19 = load float, float* %sigma.addr, align 4, !dbg !833
  %div17 = fdiv float %sub16, %19, !dbg !834
  %conv18 = fpext float %div17 to double, !dbg !835
  %call19 = call double @pow(double %conv18, double 2.000000e+00) #6, !dbg !836
  %add20 = fadd double %call14, %call19, !dbg !837
  %mul21 = fmul double -5.000000e-01, %add20, !dbg !838
  %call22 = call double @exp(double %mul21) #6, !dbg !839
  %20 = load float, float* %sigma.addr, align 4, !dbg !840
  %conv23 = fpext float %20 to double, !dbg !840
  %mul24 = fmul double 0x401921FB54442D18, %conv23, !dbg !841
  %21 = load float, float* %sigma.addr, align 4, !dbg !842
  %conv25 = fpext float %21 to double, !dbg !842
  %mul26 = fmul double %mul24, %conv25, !dbg !843
  %div27 = fdiv double %call22, %mul26, !dbg !844
  %conv28 = fptrunc double %div27 to float, !dbg !839
  %22 = load i64, i64* %c, align 8, !dbg !845
  %arrayidx = getelementptr inbounds float, float* %vla, i64 %22, !dbg !846
  store float %conv28, float* %arrayidx, align 4, !dbg !847
  %23 = load i64, i64* %c, align 8, !dbg !848
  %inc = add i64 %23, 1, !dbg !848
  store i64 %inc, i64* %c, align 8, !dbg !848
  br label %for.inc, !dbg !849

for.inc:                                          ; preds = %for.body10
  %24 = load i32, i32* %j, align 4, !dbg !850
  %inc29 = add nsw i32 %24, 1, !dbg !850
  store i32 %inc29, i32* %j, align 4, !dbg !850
  br label %for.cond7, !dbg !851, !llvm.loop !852

for.end:                                          ; preds = %for.cond7
  br label %for.inc30, !dbg !853

for.inc30:                                        ; preds = %for.end
  %25 = load i32, i32* %i, align 4, !dbg !854
  %inc31 = add nsw i32 %25, 1, !dbg !854
  store i32 %inc31, i32* %i, align 4, !dbg !854
  br label %for.cond, !dbg !855, !llvm.loop !856

for.end32:                                        ; preds = %for.cond
  %26 = load i16*, i16** %in.addr, align 8, !dbg !858
  %27 = load i16*, i16** %out.addr, align 8, !dbg !859
  %28 = load i32, i32* %nx.addr, align 4, !dbg !860
  %29 = load i32, i32* %ny.addr, align 4, !dbg !861
  %30 = load i32, i32* %n, align 4, !dbg !862
  call void @convolution(i16* %26, i16* %27, float* %vla, i32 %28, i32 %29, i32 %30, i1 zeroext true), !dbg !863
  %31 = load i8*, i8** %saved_stack, align 8, !dbg !864
  call void @llvm.stackrestore(i8* %31), !dbg !864
  ret void, !dbg !864
}

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.floor.f64(double) #1

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #6

; Function Attrs: nounwind
declare dso_local double @exp(double) #3

; Function Attrs: nounwind
declare dso_local double @pow(double, double) #3

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local i16* @canny_edge_detection(i16* %in, %struct.bitmap_info_header_t* %bmp_ih, i32 %tmin, i32 %tmax, float %sigma) #0 !dbg !865 {
entry:
  %in.addr = alloca i16*, align 8
  %bmp_ih.addr = alloca %struct.bitmap_info_header_t*, align 8
  %tmin.addr = alloca i32, align 4
  %tmax.addr = alloca i32, align 4
  %sigma.addr = alloca float, align 4
  %nx = alloca i32, align 4
  %ny = alloca i32, align 4
  %G = alloca i16*, align 8
  %after_Gx = alloca i16*, align 8
  %after_Gy = alloca i16*, align 8
  %nms = alloca i16*, align 8
  %out = alloca i16*, align 8
  %Gx = alloca [9 x float], align 16
  %Gy = alloca [9 x float], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %c = alloca i32, align 4
  %i50 = alloca i32, align 4
  %j56 = alloca i32, align 4
  %c62 = alloca i32, align 4
  %nn = alloca i32, align 4
  %ss = alloca i32, align 4
  %ww = alloca i32, align 4
  %ee = alloca i32, align 4
  %nw = alloca i32, align 4
  %ne = alloca i32, align 4
  %sw = alloca i32, align 4
  %se = alloca i32, align 4
  %dir = alloca float, align 4
  %edges = alloca i32*, align 8
  %c200 = alloca i64, align 8
  %j201 = alloca i32, align 4
  %i207 = alloca i32, align 4
  %nedges = alloca i32, align 4
  %t = alloca i32, align 4
  %nbs = alloca [8 x i32], align 16
  %k = alloca i32, align 4
  store i16* %in, i16** %in.addr, align 8
  call void @llvm.dbg.declare(metadata i16** %in.addr, metadata !868, metadata !DIExpression()), !dbg !869
  store %struct.bitmap_info_header_t* %bmp_ih, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.bitmap_info_header_t** %bmp_ih.addr, metadata !870, metadata !DIExpression()), !dbg !871
  store i32 %tmin, i32* %tmin.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %tmin.addr, metadata !872, metadata !DIExpression()), !dbg !873
  store i32 %tmax, i32* %tmax.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %tmax.addr, metadata !874, metadata !DIExpression()), !dbg !875
  store float %sigma, float* %sigma.addr, align 4
  call void @llvm.dbg.declare(metadata float* %sigma.addr, metadata !876, metadata !DIExpression()), !dbg !877
  call void @llvm.dbg.declare(metadata i32* %nx, metadata !878, metadata !DIExpression()), !dbg !879
  %0 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !880
  %width = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %0, i32 0, i32 1, !dbg !881
  %1 = load i32, i32* %width, align 4, !dbg !881
  store i32 %1, i32* %nx, align 4, !dbg !879
  call void @llvm.dbg.declare(metadata i32* %ny, metadata !882, metadata !DIExpression()), !dbg !883
  %2 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !884
  %height = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %2, i32 0, i32 2, !dbg !885
  %3 = load i32, i32* %height, align 4, !dbg !885
  store i32 %3, i32* %ny, align 4, !dbg !883
  call void @llvm.dbg.declare(metadata i16** %G, metadata !886, metadata !DIExpression()), !dbg !887
  %4 = load i32, i32* %nx, align 4, !dbg !888
  %5 = load i32, i32* %ny, align 4, !dbg !889
  %mul = mul nsw i32 %4, %5, !dbg !890
  %conv = sext i32 %mul to i64, !dbg !888
  %mul1 = mul i64 %conv, 2, !dbg !891
  %call = call noalias i8* @calloc(i64 %mul1, i64 1) #6, !dbg !892
  %6 = bitcast i8* %call to i16*, !dbg !892
  store i16* %6, i16** %G, align 8, !dbg !887
  call void @llvm.dbg.declare(metadata i16** %after_Gx, metadata !893, metadata !DIExpression()), !dbg !894
  %7 = load i32, i32* %nx, align 4, !dbg !895
  %8 = load i32, i32* %ny, align 4, !dbg !896
  %mul2 = mul nsw i32 %7, %8, !dbg !897
  %conv3 = sext i32 %mul2 to i64, !dbg !895
  %mul4 = mul i64 %conv3, 2, !dbg !898
  %call5 = call noalias i8* @calloc(i64 %mul4, i64 1) #6, !dbg !899
  %9 = bitcast i8* %call5 to i16*, !dbg !899
  store i16* %9, i16** %after_Gx, align 8, !dbg !894
  call void @llvm.dbg.declare(metadata i16** %after_Gy, metadata !900, metadata !DIExpression()), !dbg !901
  %10 = load i32, i32* %nx, align 4, !dbg !902
  %11 = load i32, i32* %ny, align 4, !dbg !903
  %mul6 = mul nsw i32 %10, %11, !dbg !904
  %conv7 = sext i32 %mul6 to i64, !dbg !902
  %mul8 = mul i64 %conv7, 2, !dbg !905
  %call9 = call noalias i8* @calloc(i64 %mul8, i64 1) #6, !dbg !906
  %12 = bitcast i8* %call9 to i16*, !dbg !906
  store i16* %12, i16** %after_Gy, align 8, !dbg !901
  call void @llvm.dbg.declare(metadata i16** %nms, metadata !907, metadata !DIExpression()), !dbg !908
  %13 = load i32, i32* %nx, align 4, !dbg !909
  %14 = load i32, i32* %ny, align 4, !dbg !910
  %mul10 = mul nsw i32 %13, %14, !dbg !911
  %conv11 = sext i32 %mul10 to i64, !dbg !909
  %mul12 = mul i64 %conv11, 2, !dbg !912
  %call13 = call noalias i8* @calloc(i64 %mul12, i64 1) #6, !dbg !913
  %15 = bitcast i8* %call13 to i16*, !dbg !913
  store i16* %15, i16** %nms, align 8, !dbg !908
  call void @llvm.dbg.declare(metadata i16** %out, metadata !914, metadata !DIExpression()), !dbg !915
  %16 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !916
  %bmp_bytesz = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %16, i32 0, i32 6, !dbg !917
  %17 = load i32, i32* %bmp_bytesz, align 4, !dbg !917
  %conv14 = zext i32 %17 to i64, !dbg !916
  %mul15 = mul i64 %conv14, 2, !dbg !918
  %call16 = call noalias i8* @malloc(i64 %mul15) #6, !dbg !919
  %18 = bitcast i8* %call16 to i16*, !dbg !919
  store i16* %18, i16** %out, align 8, !dbg !915
  %19 = load i16*, i16** %G, align 8, !dbg !920
  %cmp = icmp eq i16* %19, null, !dbg !922
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !923

lor.lhs.false:                                    ; preds = %entry
  %20 = load i16*, i16** %after_Gx, align 8, !dbg !924
  %cmp18 = icmp eq i16* %20, null, !dbg !925
  br i1 %cmp18, label %if.then, label %lor.lhs.false20, !dbg !926

lor.lhs.false20:                                  ; preds = %lor.lhs.false
  %21 = load i16*, i16** %after_Gy, align 8, !dbg !927
  %cmp21 = icmp eq i16* %21, null, !dbg !928
  br i1 %cmp21, label %if.then, label %lor.lhs.false23, !dbg !929

lor.lhs.false23:                                  ; preds = %lor.lhs.false20
  %22 = load i16*, i16** %nms, align 8, !dbg !930
  %cmp24 = icmp eq i16* %22, null, !dbg !931
  br i1 %cmp24, label %if.then, label %lor.lhs.false26, !dbg !932

lor.lhs.false26:                                  ; preds = %lor.lhs.false23
  %23 = load i16*, i16** %out, align 8, !dbg !933
  %cmp27 = icmp eq i16* %23, null, !dbg !934
  br i1 %cmp27, label %if.then, label %if.end, !dbg !935

if.then:                                          ; preds = %lor.lhs.false26, %lor.lhs.false23, %lor.lhs.false20, %lor.lhs.false, %entry
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !936
  %call29 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.9, i64 0, i64 0)), !dbg !938
  call void @exit(i32 1) #7, !dbg !939
  unreachable, !dbg !939

if.end:                                           ; preds = %lor.lhs.false26
  %25 = load i16*, i16** %in.addr, align 8, !dbg !940
  %26 = load i16*, i16** %out, align 8, !dbg !941
  %27 = load i32, i32* %nx, align 4, !dbg !942
  %28 = load i32, i32* %ny, align 4, !dbg !943
  %29 = load float, float* %sigma.addr, align 4, !dbg !944
  call void @gaussian_filter(i16* %25, i16* %26, i32 %27, i32 %28, float %29), !dbg !945
  call void @llvm.dbg.declare(metadata [9 x float]* %Gx, metadata !946, metadata !DIExpression()), !dbg !950
  %30 = bitcast [9 x float]* %Gx to i8*, !dbg !950
  call void @llvm.memset.p0i8.i64(i8* align 16 %30, i8 0, i64 36, i1 false), !dbg !950
  %31 = bitcast i8* %30 to [9 x float]*, !dbg !950
  %32 = getelementptr inbounds [9 x float], [9 x float]* %31, i32 0, i32 0, !dbg !950
  store float -1.000000e+00, float* %32, align 16, !dbg !950
  %33 = getelementptr inbounds [9 x float], [9 x float]* %31, i32 0, i32 2, !dbg !950
  store float 1.000000e+00, float* %33, align 8, !dbg !950
  %34 = getelementptr inbounds [9 x float], [9 x float]* %31, i32 0, i32 3, !dbg !950
  store float -2.000000e+00, float* %34, align 4, !dbg !950
  %35 = getelementptr inbounds [9 x float], [9 x float]* %31, i32 0, i32 5, !dbg !950
  store float 2.000000e+00, float* %35, align 4, !dbg !950
  %36 = getelementptr inbounds [9 x float], [9 x float]* %31, i32 0, i32 6, !dbg !950
  store float -1.000000e+00, float* %36, align 8, !dbg !950
  %37 = getelementptr inbounds [9 x float], [9 x float]* %31, i32 0, i32 8, !dbg !950
  store float 1.000000e+00, float* %37, align 16, !dbg !950
  %38 = load i16*, i16** %out, align 8, !dbg !951
  %39 = load i16*, i16** %after_Gx, align 8, !dbg !952
  %arraydecay = getelementptr inbounds [9 x float], [9 x float]* %Gx, i64 0, i64 0, !dbg !953
  %40 = load i32, i32* %nx, align 4, !dbg !954
  %41 = load i32, i32* %ny, align 4, !dbg !955
  call void @convolution(i16* %38, i16* %39, float* %arraydecay, i32 %40, i32 %41, i32 3, i1 zeroext false), !dbg !956
  call void @llvm.dbg.declare(metadata [9 x float]* %Gy, metadata !957, metadata !DIExpression()), !dbg !958
  %42 = bitcast [9 x float]* %Gy to i8*, !dbg !958
  call void @llvm.memset.p0i8.i64(i8* align 16 %42, i8 0, i64 36, i1 false), !dbg !958
  %43 = bitcast i8* %42 to [9 x float]*, !dbg !958
  %44 = getelementptr inbounds [9 x float], [9 x float]* %43, i32 0, i32 0, !dbg !958
  store float 1.000000e+00, float* %44, align 16, !dbg !958
  %45 = getelementptr inbounds [9 x float], [9 x float]* %43, i32 0, i32 1, !dbg !958
  store float 2.000000e+00, float* %45, align 4, !dbg !958
  %46 = getelementptr inbounds [9 x float], [9 x float]* %43, i32 0, i32 2, !dbg !958
  store float 1.000000e+00, float* %46, align 8, !dbg !958
  %47 = getelementptr inbounds [9 x float], [9 x float]* %43, i32 0, i32 6, !dbg !958
  store float -1.000000e+00, float* %47, align 8, !dbg !958
  %48 = getelementptr inbounds [9 x float], [9 x float]* %43, i32 0, i32 7, !dbg !958
  store float -2.000000e+00, float* %48, align 4, !dbg !958
  %49 = getelementptr inbounds [9 x float], [9 x float]* %43, i32 0, i32 8, !dbg !958
  store float -1.000000e+00, float* %49, align 16, !dbg !958
  %50 = load i16*, i16** %out, align 8, !dbg !959
  %51 = load i16*, i16** %after_Gy, align 8, !dbg !960
  %arraydecay30 = getelementptr inbounds [9 x float], [9 x float]* %Gy, i64 0, i64 0, !dbg !961
  %52 = load i32, i32* %nx, align 4, !dbg !962
  %53 = load i32, i32* %ny, align 4, !dbg !963
  call void @convolution(i16* %50, i16* %51, float* %arraydecay30, i32 %52, i32 %53, i32 3, i1 zeroext false), !dbg !964
  call void @llvm.dbg.declare(metadata i32* %i, metadata !965, metadata !DIExpression()), !dbg !967
  store i32 1, i32* %i, align 4, !dbg !967
  br label %for.cond, !dbg !968

for.cond:                                         ; preds = %for.inc47, %if.end
  %54 = load i32, i32* %i, align 4, !dbg !969
  %55 = load i32, i32* %nx, align 4, !dbg !971
  %sub = sub nsw i32 %55, 1, !dbg !972
  %cmp31 = icmp slt i32 %54, %sub, !dbg !973
  br i1 %cmp31, label %for.body, label %for.end49, !dbg !974

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !975, metadata !DIExpression()), !dbg !977
  store i32 1, i32* %j, align 4, !dbg !977
  br label %for.cond33, !dbg !978

for.cond33:                                       ; preds = %for.inc, %for.body
  %56 = load i32, i32* %j, align 4, !dbg !979
  %57 = load i32, i32* %ny, align 4, !dbg !981
  %sub34 = sub nsw i32 %57, 1, !dbg !982
  %cmp35 = icmp slt i32 %56, %sub34, !dbg !983
  br i1 %cmp35, label %for.body37, label %for.end, !dbg !984

for.body37:                                       ; preds = %for.cond33
  call void @llvm.dbg.declare(metadata i32* %c, metadata !985, metadata !DIExpression()), !dbg !987
  %58 = load i32, i32* %i, align 4, !dbg !988
  %59 = load i32, i32* %nx, align 4, !dbg !989
  %60 = load i32, i32* %j, align 4, !dbg !990
  %mul38 = mul nsw i32 %59, %60, !dbg !991
  %add = add nsw i32 %58, %mul38, !dbg !992
  store i32 %add, i32* %c, align 4, !dbg !987
  %61 = load i16*, i16** %after_Gx, align 8, !dbg !993
  %62 = load i32, i32* %c, align 4, !dbg !994
  %idxprom = sext i32 %62 to i64, !dbg !993
  %arrayidx = getelementptr inbounds i16, i16* %61, i64 %idxprom, !dbg !993
  %63 = load i16, i16* %arrayidx, align 2, !dbg !993
  %conv39 = sitofp i16 %63 to double, !dbg !993
  %64 = load i16*, i16** %after_Gy, align 8, !dbg !995
  %65 = load i32, i32* %c, align 4, !dbg !996
  %idxprom40 = sext i32 %65 to i64, !dbg !995
  %arrayidx41 = getelementptr inbounds i16, i16* %64, i64 %idxprom40, !dbg !995
  %66 = load i16, i16* %arrayidx41, align 2, !dbg !995
  %conv42 = sitofp i16 %66 to double, !dbg !995
  %call43 = call double @hypot(double %conv39, double %conv42) #6, !dbg !997
  %conv44 = fptosi double %call43 to i16, !dbg !998
  %67 = load i16*, i16** %G, align 8, !dbg !999
  %68 = load i32, i32* %c, align 4, !dbg !1000
  %idxprom45 = sext i32 %68 to i64, !dbg !999
  %arrayidx46 = getelementptr inbounds i16, i16* %67, i64 %idxprom45, !dbg !999
  store i16 %conv44, i16* %arrayidx46, align 2, !dbg !1001
  br label %for.inc, !dbg !1002

for.inc:                                          ; preds = %for.body37
  %69 = load i32, i32* %j, align 4, !dbg !1003
  %inc = add nsw i32 %69, 1, !dbg !1003
  store i32 %inc, i32* %j, align 4, !dbg !1003
  br label %for.cond33, !dbg !1004, !llvm.loop !1005

for.end:                                          ; preds = %for.cond33
  br label %for.inc47, !dbg !1006

for.inc47:                                        ; preds = %for.end
  %70 = load i32, i32* %i, align 4, !dbg !1007
  %inc48 = add nsw i32 %70, 1, !dbg !1007
  store i32 %inc48, i32* %i, align 4, !dbg !1007
  br label %for.cond, !dbg !1008, !llvm.loop !1009

for.end49:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i50, metadata !1011, metadata !DIExpression()), !dbg !1013
  store i32 1, i32* %i50, align 4, !dbg !1013
  br label %for.cond51, !dbg !1014

for.cond51:                                       ; preds = %for.inc189, %for.end49
  %71 = load i32, i32* %i50, align 4, !dbg !1015
  %72 = load i32, i32* %nx, align 4, !dbg !1017
  %sub52 = sub nsw i32 %72, 1, !dbg !1018
  %cmp53 = icmp slt i32 %71, %sub52, !dbg !1019
  br i1 %cmp53, label %for.body55, label %for.end191, !dbg !1020

for.body55:                                       ; preds = %for.cond51
  call void @llvm.dbg.declare(metadata i32* %j56, metadata !1021, metadata !DIExpression()), !dbg !1023
  store i32 1, i32* %j56, align 4, !dbg !1023
  br label %for.cond57, !dbg !1024

for.cond57:                                       ; preds = %for.inc186, %for.body55
  %73 = load i32, i32* %j56, align 4, !dbg !1025
  %74 = load i32, i32* %ny, align 4, !dbg !1027
  %sub58 = sub nsw i32 %74, 1, !dbg !1028
  %cmp59 = icmp slt i32 %73, %sub58, !dbg !1029
  br i1 %cmp59, label %for.body61, label %for.end188, !dbg !1030

for.body61:                                       ; preds = %for.cond57
  call void @llvm.dbg.declare(metadata i32* %c62, metadata !1031, metadata !DIExpression()), !dbg !1033
  %75 = load i32, i32* %i50, align 4, !dbg !1034
  %76 = load i32, i32* %nx, align 4, !dbg !1035
  %77 = load i32, i32* %j56, align 4, !dbg !1036
  %mul63 = mul nsw i32 %76, %77, !dbg !1037
  %add64 = add nsw i32 %75, %mul63, !dbg !1038
  store i32 %add64, i32* %c62, align 4, !dbg !1033
  call void @llvm.dbg.declare(metadata i32* %nn, metadata !1039, metadata !DIExpression()), !dbg !1040
  %78 = load i32, i32* %c62, align 4, !dbg !1041
  %79 = load i32, i32* %nx, align 4, !dbg !1042
  %sub65 = sub nsw i32 %78, %79, !dbg !1043
  store i32 %sub65, i32* %nn, align 4, !dbg !1040
  call void @llvm.dbg.declare(metadata i32* %ss, metadata !1044, metadata !DIExpression()), !dbg !1045
  %80 = load i32, i32* %c62, align 4, !dbg !1046
  %81 = load i32, i32* %nx, align 4, !dbg !1047
  %add66 = add nsw i32 %80, %81, !dbg !1048
  store i32 %add66, i32* %ss, align 4, !dbg !1045
  call void @llvm.dbg.declare(metadata i32* %ww, metadata !1049, metadata !DIExpression()), !dbg !1050
  %82 = load i32, i32* %c62, align 4, !dbg !1051
  %add67 = add nsw i32 %82, 1, !dbg !1052
  store i32 %add67, i32* %ww, align 4, !dbg !1050
  call void @llvm.dbg.declare(metadata i32* %ee, metadata !1053, metadata !DIExpression()), !dbg !1054
  %83 = load i32, i32* %c62, align 4, !dbg !1055
  %sub68 = sub nsw i32 %83, 1, !dbg !1056
  store i32 %sub68, i32* %ee, align 4, !dbg !1054
  call void @llvm.dbg.declare(metadata i32* %nw, metadata !1057, metadata !DIExpression()), !dbg !1058
  %84 = load i32, i32* %nn, align 4, !dbg !1059
  %add69 = add nsw i32 %84, 1, !dbg !1060
  store i32 %add69, i32* %nw, align 4, !dbg !1058
  call void @llvm.dbg.declare(metadata i32* %ne, metadata !1061, metadata !DIExpression()), !dbg !1062
  %85 = load i32, i32* %nn, align 4, !dbg !1063
  %sub70 = sub nsw i32 %85, 1, !dbg !1064
  store i32 %sub70, i32* %ne, align 4, !dbg !1062
  call void @llvm.dbg.declare(metadata i32* %sw, metadata !1065, metadata !DIExpression()), !dbg !1066
  %86 = load i32, i32* %ss, align 4, !dbg !1067
  %add71 = add nsw i32 %86, 1, !dbg !1068
  store i32 %add71, i32* %sw, align 4, !dbg !1066
  call void @llvm.dbg.declare(metadata i32* %se, metadata !1069, metadata !DIExpression()), !dbg !1070
  %87 = load i32, i32* %ss, align 4, !dbg !1071
  %sub72 = sub nsw i32 %87, 1, !dbg !1072
  store i32 %sub72, i32* %se, align 4, !dbg !1070
  call void @llvm.dbg.declare(metadata float* %dir, metadata !1073, metadata !DIExpression()), !dbg !1074
  %88 = load i16*, i16** %after_Gy, align 8, !dbg !1075
  %89 = load i32, i32* %c62, align 4, !dbg !1076
  %idxprom73 = sext i32 %89 to i64, !dbg !1075
  %arrayidx74 = getelementptr inbounds i16, i16* %88, i64 %idxprom73, !dbg !1075
  %90 = load i16, i16* %arrayidx74, align 2, !dbg !1075
  %conv75 = sitofp i16 %90 to double, !dbg !1075
  %91 = load i16*, i16** %after_Gx, align 8, !dbg !1077
  %92 = load i32, i32* %c62, align 4, !dbg !1078
  %idxprom76 = sext i32 %92 to i64, !dbg !1077
  %arrayidx77 = getelementptr inbounds i16, i16* %91, i64 %idxprom76, !dbg !1077
  %93 = load i16, i16* %arrayidx77, align 2, !dbg !1077
  %conv78 = sitofp i16 %93 to double, !dbg !1077
  %call79 = call double @atan2(double %conv75, double %conv78) #6, !dbg !1079
  %add80 = fadd double %call79, 0x400921FB54442D18, !dbg !1080
  %call81 = call double @fmod(double %add80, double 0x400921FB54442D18) #6, !dbg !1081
  %div = fdiv double %call81, 0x400921FB54442D18, !dbg !1082
  %conv82 = fptrunc double %div to float, !dbg !1083
  %mul83 = fmul float %conv82, 8.000000e+00, !dbg !1084
  store float %mul83, float* %dir, align 4, !dbg !1074
  %94 = load float, float* %dir, align 4, !dbg !1085
  %cmp84 = fcmp ole float %94, 1.000000e+00, !dbg !1087
  br i1 %cmp84, label %land.lhs.true, label %lor.lhs.false86, !dbg !1088

lor.lhs.false86:                                  ; preds = %for.body61
  %95 = load float, float* %dir, align 4, !dbg !1089
  %cmp87 = fcmp ogt float %95, 7.000000e+00, !dbg !1090
  br i1 %cmp87, label %land.lhs.true, label %lor.lhs.false106, !dbg !1091

land.lhs.true:                                    ; preds = %lor.lhs.false86, %for.body61
  %96 = load i16*, i16** %G, align 8, !dbg !1092
  %97 = load i32, i32* %c62, align 4, !dbg !1093
  %idxprom89 = sext i32 %97 to i64, !dbg !1092
  %arrayidx90 = getelementptr inbounds i16, i16* %96, i64 %idxprom89, !dbg !1092
  %98 = load i16, i16* %arrayidx90, align 2, !dbg !1092
  %conv91 = sext i16 %98 to i32, !dbg !1092
  %99 = load i16*, i16** %G, align 8, !dbg !1094
  %100 = load i32, i32* %ee, align 4, !dbg !1095
  %idxprom92 = sext i32 %100 to i64, !dbg !1094
  %arrayidx93 = getelementptr inbounds i16, i16* %99, i64 %idxprom92, !dbg !1094
  %101 = load i16, i16* %arrayidx93, align 2, !dbg !1094
  %conv94 = sext i16 %101 to i32, !dbg !1094
  %cmp95 = icmp sgt i32 %conv91, %conv94, !dbg !1096
  br i1 %cmp95, label %land.lhs.true97, label %lor.lhs.false106, !dbg !1097

land.lhs.true97:                                  ; preds = %land.lhs.true
  %102 = load i16*, i16** %G, align 8, !dbg !1098
  %103 = load i32, i32* %c62, align 4, !dbg !1099
  %idxprom98 = sext i32 %103 to i64, !dbg !1098
  %arrayidx99 = getelementptr inbounds i16, i16* %102, i64 %idxprom98, !dbg !1098
  %104 = load i16, i16* %arrayidx99, align 2, !dbg !1098
  %conv100 = sext i16 %104 to i32, !dbg !1098
  %105 = load i16*, i16** %G, align 8, !dbg !1100
  %106 = load i32, i32* %ww, align 4, !dbg !1101
  %idxprom101 = sext i32 %106 to i64, !dbg !1100
  %arrayidx102 = getelementptr inbounds i16, i16* %105, i64 %idxprom101, !dbg !1100
  %107 = load i16, i16* %arrayidx102, align 2, !dbg !1100
  %conv103 = sext i16 %107 to i32, !dbg !1100
  %cmp104 = icmp sgt i32 %conv100, %conv103, !dbg !1102
  br i1 %cmp104, label %if.then178, label %lor.lhs.false106, !dbg !1103

lor.lhs.false106:                                 ; preds = %land.lhs.true97, %land.lhs.true, %lor.lhs.false86
  %108 = load float, float* %dir, align 4, !dbg !1104
  %cmp107 = fcmp ogt float %108, 1.000000e+00, !dbg !1105
  br i1 %cmp107, label %land.lhs.true109, label %lor.lhs.false130, !dbg !1106

land.lhs.true109:                                 ; preds = %lor.lhs.false106
  %109 = load float, float* %dir, align 4, !dbg !1107
  %cmp110 = fcmp ole float %109, 3.000000e+00, !dbg !1108
  br i1 %cmp110, label %land.lhs.true112, label %lor.lhs.false130, !dbg !1109

land.lhs.true112:                                 ; preds = %land.lhs.true109
  %110 = load i16*, i16** %G, align 8, !dbg !1110
  %111 = load i32, i32* %c62, align 4, !dbg !1111
  %idxprom113 = sext i32 %111 to i64, !dbg !1110
  %arrayidx114 = getelementptr inbounds i16, i16* %110, i64 %idxprom113, !dbg !1110
  %112 = load i16, i16* %arrayidx114, align 2, !dbg !1110
  %conv115 = sext i16 %112 to i32, !dbg !1110
  %113 = load i16*, i16** %G, align 8, !dbg !1112
  %114 = load i32, i32* %nw, align 4, !dbg !1113
  %idxprom116 = sext i32 %114 to i64, !dbg !1112
  %arrayidx117 = getelementptr inbounds i16, i16* %113, i64 %idxprom116, !dbg !1112
  %115 = load i16, i16* %arrayidx117, align 2, !dbg !1112
  %conv118 = sext i16 %115 to i32, !dbg !1112
  %cmp119 = icmp sgt i32 %conv115, %conv118, !dbg !1114
  br i1 %cmp119, label %land.lhs.true121, label %lor.lhs.false130, !dbg !1115

land.lhs.true121:                                 ; preds = %land.lhs.true112
  %116 = load i16*, i16** %G, align 8, !dbg !1116
  %117 = load i32, i32* %c62, align 4, !dbg !1117
  %idxprom122 = sext i32 %117 to i64, !dbg !1116
  %arrayidx123 = getelementptr inbounds i16, i16* %116, i64 %idxprom122, !dbg !1116
  %118 = load i16, i16* %arrayidx123, align 2, !dbg !1116
  %conv124 = sext i16 %118 to i32, !dbg !1116
  %119 = load i16*, i16** %G, align 8, !dbg !1118
  %120 = load i32, i32* %se, align 4, !dbg !1119
  %idxprom125 = sext i32 %120 to i64, !dbg !1118
  %arrayidx126 = getelementptr inbounds i16, i16* %119, i64 %idxprom125, !dbg !1118
  %121 = load i16, i16* %arrayidx126, align 2, !dbg !1118
  %conv127 = sext i16 %121 to i32, !dbg !1118
  %cmp128 = icmp sgt i32 %conv124, %conv127, !dbg !1120
  br i1 %cmp128, label %if.then178, label %lor.lhs.false130, !dbg !1121

lor.lhs.false130:                                 ; preds = %land.lhs.true121, %land.lhs.true112, %land.lhs.true109, %lor.lhs.false106
  %122 = load float, float* %dir, align 4, !dbg !1122
  %cmp131 = fcmp ogt float %122, 3.000000e+00, !dbg !1123
  br i1 %cmp131, label %land.lhs.true133, label %lor.lhs.false154, !dbg !1124

land.lhs.true133:                                 ; preds = %lor.lhs.false130
  %123 = load float, float* %dir, align 4, !dbg !1125
  %cmp134 = fcmp ole float %123, 5.000000e+00, !dbg !1126
  br i1 %cmp134, label %land.lhs.true136, label %lor.lhs.false154, !dbg !1127

land.lhs.true136:                                 ; preds = %land.lhs.true133
  %124 = load i16*, i16** %G, align 8, !dbg !1128
  %125 = load i32, i32* %c62, align 4, !dbg !1129
  %idxprom137 = sext i32 %125 to i64, !dbg !1128
  %arrayidx138 = getelementptr inbounds i16, i16* %124, i64 %idxprom137, !dbg !1128
  %126 = load i16, i16* %arrayidx138, align 2, !dbg !1128
  %conv139 = sext i16 %126 to i32, !dbg !1128
  %127 = load i16*, i16** %G, align 8, !dbg !1130
  %128 = load i32, i32* %nn, align 4, !dbg !1131
  %idxprom140 = sext i32 %128 to i64, !dbg !1130
  %arrayidx141 = getelementptr inbounds i16, i16* %127, i64 %idxprom140, !dbg !1130
  %129 = load i16, i16* %arrayidx141, align 2, !dbg !1130
  %conv142 = sext i16 %129 to i32, !dbg !1130
  %cmp143 = icmp sgt i32 %conv139, %conv142, !dbg !1132
  br i1 %cmp143, label %land.lhs.true145, label %lor.lhs.false154, !dbg !1133

land.lhs.true145:                                 ; preds = %land.lhs.true136
  %130 = load i16*, i16** %G, align 8, !dbg !1134
  %131 = load i32, i32* %c62, align 4, !dbg !1135
  %idxprom146 = sext i32 %131 to i64, !dbg !1134
  %arrayidx147 = getelementptr inbounds i16, i16* %130, i64 %idxprom146, !dbg !1134
  %132 = load i16, i16* %arrayidx147, align 2, !dbg !1134
  %conv148 = sext i16 %132 to i32, !dbg !1134
  %133 = load i16*, i16** %G, align 8, !dbg !1136
  %134 = load i32, i32* %ss, align 4, !dbg !1137
  %idxprom149 = sext i32 %134 to i64, !dbg !1136
  %arrayidx150 = getelementptr inbounds i16, i16* %133, i64 %idxprom149, !dbg !1136
  %135 = load i16, i16* %arrayidx150, align 2, !dbg !1136
  %conv151 = sext i16 %135 to i32, !dbg !1136
  %cmp152 = icmp sgt i32 %conv148, %conv151, !dbg !1138
  br i1 %cmp152, label %if.then178, label %lor.lhs.false154, !dbg !1139

lor.lhs.false154:                                 ; preds = %land.lhs.true145, %land.lhs.true136, %land.lhs.true133, %lor.lhs.false130
  %136 = load float, float* %dir, align 4, !dbg !1140
  %cmp155 = fcmp ogt float %136, 5.000000e+00, !dbg !1141
  br i1 %cmp155, label %land.lhs.true157, label %if.else, !dbg !1142

land.lhs.true157:                                 ; preds = %lor.lhs.false154
  %137 = load float, float* %dir, align 4, !dbg !1143
  %cmp158 = fcmp ole float %137, 7.000000e+00, !dbg !1144
  br i1 %cmp158, label %land.lhs.true160, label %if.else, !dbg !1145

land.lhs.true160:                                 ; preds = %land.lhs.true157
  %138 = load i16*, i16** %G, align 8, !dbg !1146
  %139 = load i32, i32* %c62, align 4, !dbg !1147
  %idxprom161 = sext i32 %139 to i64, !dbg !1146
  %arrayidx162 = getelementptr inbounds i16, i16* %138, i64 %idxprom161, !dbg !1146
  %140 = load i16, i16* %arrayidx162, align 2, !dbg !1146
  %conv163 = sext i16 %140 to i32, !dbg !1146
  %141 = load i16*, i16** %G, align 8, !dbg !1148
  %142 = load i32, i32* %ne, align 4, !dbg !1149
  %idxprom164 = sext i32 %142 to i64, !dbg !1148
  %arrayidx165 = getelementptr inbounds i16, i16* %141, i64 %idxprom164, !dbg !1148
  %143 = load i16, i16* %arrayidx165, align 2, !dbg !1148
  %conv166 = sext i16 %143 to i32, !dbg !1148
  %cmp167 = icmp sgt i32 %conv163, %conv166, !dbg !1150
  br i1 %cmp167, label %land.lhs.true169, label %if.else, !dbg !1151

land.lhs.true169:                                 ; preds = %land.lhs.true160
  %144 = load i16*, i16** %G, align 8, !dbg !1152
  %145 = load i32, i32* %c62, align 4, !dbg !1153
  %idxprom170 = sext i32 %145 to i64, !dbg !1152
  %arrayidx171 = getelementptr inbounds i16, i16* %144, i64 %idxprom170, !dbg !1152
  %146 = load i16, i16* %arrayidx171, align 2, !dbg !1152
  %conv172 = sext i16 %146 to i32, !dbg !1152
  %147 = load i16*, i16** %G, align 8, !dbg !1154
  %148 = load i32, i32* %sw, align 4, !dbg !1155
  %idxprom173 = sext i32 %148 to i64, !dbg !1154
  %arrayidx174 = getelementptr inbounds i16, i16* %147, i64 %idxprom173, !dbg !1154
  %149 = load i16, i16* %arrayidx174, align 2, !dbg !1154
  %conv175 = sext i16 %149 to i32, !dbg !1154
  %cmp176 = icmp sgt i32 %conv172, %conv175, !dbg !1156
  br i1 %cmp176, label %if.then178, label %if.else, !dbg !1157

if.then178:                                       ; preds = %land.lhs.true169, %land.lhs.true145, %land.lhs.true121, %land.lhs.true97
  %150 = load i16*, i16** %G, align 8, !dbg !1158
  %151 = load i32, i32* %c62, align 4, !dbg !1159
  %idxprom179 = sext i32 %151 to i64, !dbg !1158
  %arrayidx180 = getelementptr inbounds i16, i16* %150, i64 %idxprom179, !dbg !1158
  %152 = load i16, i16* %arrayidx180, align 2, !dbg !1158
  %153 = load i16*, i16** %nms, align 8, !dbg !1160
  %154 = load i32, i32* %c62, align 4, !dbg !1161
  %idxprom181 = sext i32 %154 to i64, !dbg !1160
  %arrayidx182 = getelementptr inbounds i16, i16* %153, i64 %idxprom181, !dbg !1160
  store i16 %152, i16* %arrayidx182, align 2, !dbg !1162
  br label %if.end185, !dbg !1160

if.else:                                          ; preds = %land.lhs.true169, %land.lhs.true160, %land.lhs.true157, %lor.lhs.false154
  %155 = load i16*, i16** %nms, align 8, !dbg !1163
  %156 = load i32, i32* %c62, align 4, !dbg !1164
  %idxprom183 = sext i32 %156 to i64, !dbg !1163
  %arrayidx184 = getelementptr inbounds i16, i16* %155, i64 %idxprom183, !dbg !1163
  store i16 0, i16* %arrayidx184, align 2, !dbg !1165
  br label %if.end185

if.end185:                                        ; preds = %if.else, %if.then178
  br label %for.inc186, !dbg !1166

for.inc186:                                       ; preds = %if.end185
  %157 = load i32, i32* %j56, align 4, !dbg !1167
  %inc187 = add nsw i32 %157, 1, !dbg !1167
  store i32 %inc187, i32* %j56, align 4, !dbg !1167
  br label %for.cond57, !dbg !1168, !llvm.loop !1169

for.end188:                                       ; preds = %for.cond57
  br label %for.inc189, !dbg !1170

for.inc189:                                       ; preds = %for.end188
  %158 = load i32, i32* %i50, align 4, !dbg !1171
  %inc190 = add nsw i32 %158, 1, !dbg !1171
  store i32 %inc190, i32* %i50, align 4, !dbg !1171
  br label %for.cond51, !dbg !1172, !llvm.loop !1173

for.end191:                                       ; preds = %for.cond51
  call void @llvm.dbg.declare(metadata i32** %edges, metadata !1175, metadata !DIExpression()), !dbg !1176
  %159 = load i16*, i16** %after_Gy, align 8, !dbg !1177
  %160 = bitcast i16* %159 to i32*, !dbg !1178
  store i32* %160, i32** %edges, align 8, !dbg !1176
  %161 = load i16*, i16** %out, align 8, !dbg !1179
  %162 = bitcast i16* %161 to i8*, !dbg !1180
  %163 = load i32, i32* %nx, align 4, !dbg !1181
  %conv192 = sext i32 %163 to i64, !dbg !1181
  %mul193 = mul i64 2, %conv192, !dbg !1182
  %164 = load i32, i32* %ny, align 4, !dbg !1183
  %conv194 = sext i32 %164 to i64, !dbg !1183
  %mul195 = mul i64 %mul193, %conv194, !dbg !1184
  call void @llvm.memset.p0i8.i64(i8* align 2 %162, i8 0, i64 %mul195, i1 false), !dbg !1180
  %165 = load i32*, i32** %edges, align 8, !dbg !1185
  %166 = bitcast i32* %165 to i8*, !dbg !1186
  %167 = load i32, i32* %nx, align 4, !dbg !1187
  %conv196 = sext i32 %167 to i64, !dbg !1187
  %mul197 = mul i64 2, %conv196, !dbg !1188
  %168 = load i32, i32* %ny, align 4, !dbg !1189
  %conv198 = sext i32 %168 to i64, !dbg !1189
  %mul199 = mul i64 %mul197, %conv198, !dbg !1190
  call void @llvm.memset.p0i8.i64(i8* align 4 %166, i8 0, i64 %mul199, i1 false), !dbg !1186
  call void @llvm.dbg.declare(metadata i64* %c200, metadata !1191, metadata !DIExpression()), !dbg !1192
  store i64 1, i64* %c200, align 8, !dbg !1192
  call void @llvm.dbg.declare(metadata i32* %j201, metadata !1193, metadata !DIExpression()), !dbg !1195
  store i32 1, i32* %j201, align 4, !dbg !1195
  br label %for.cond202, !dbg !1196

for.cond202:                                      ; preds = %for.inc288, %for.end191
  %169 = load i32, i32* %j201, align 4, !dbg !1197
  %170 = load i32, i32* %ny, align 4, !dbg !1199
  %sub203 = sub nsw i32 %170, 1, !dbg !1200
  %cmp204 = icmp slt i32 %169, %sub203, !dbg !1201
  br i1 %cmp204, label %for.body206, label %for.end290, !dbg !1202

for.body206:                                      ; preds = %for.cond202
  call void @llvm.dbg.declare(metadata i32* %i207, metadata !1203, metadata !DIExpression()), !dbg !1205
  store i32 1, i32* %i207, align 4, !dbg !1205
  br label %for.cond208, !dbg !1206

for.cond208:                                      ; preds = %for.inc285, %for.body206
  %171 = load i32, i32* %i207, align 4, !dbg !1207
  %172 = load i32, i32* %nx, align 4, !dbg !1209
  %sub209 = sub nsw i32 %172, 1, !dbg !1210
  %cmp210 = icmp slt i32 %171, %sub209, !dbg !1211
  br i1 %cmp210, label %for.body212, label %for.end287, !dbg !1212

for.body212:                                      ; preds = %for.cond208
  %173 = load i16*, i16** %nms, align 8, !dbg !1213
  %174 = load i64, i64* %c200, align 8, !dbg !1216
  %arrayidx213 = getelementptr inbounds i16, i16* %173, i64 %174, !dbg !1213
  %175 = load i16, i16* %arrayidx213, align 2, !dbg !1213
  %conv214 = sext i16 %175 to i32, !dbg !1213
  %176 = load i32, i32* %tmax.addr, align 4, !dbg !1217
  %cmp215 = icmp sge i32 %conv214, %176, !dbg !1218
  br i1 %cmp215, label %land.lhs.true217, label %if.end283, !dbg !1219

land.lhs.true217:                                 ; preds = %for.body212
  %177 = load i16*, i16** %out, align 8, !dbg !1220
  %178 = load i64, i64* %c200, align 8, !dbg !1221
  %arrayidx218 = getelementptr inbounds i16, i16* %177, i64 %178, !dbg !1220
  %179 = load i16, i16* %arrayidx218, align 2, !dbg !1220
  %conv219 = sext i16 %179 to i32, !dbg !1220
  %cmp220 = icmp eq i32 %conv219, 0, !dbg !1222
  br i1 %cmp220, label %if.then222, label %if.end283, !dbg !1223

if.then222:                                       ; preds = %land.lhs.true217
  %180 = load i16*, i16** %out, align 8, !dbg !1224
  %181 = load i64, i64* %c200, align 8, !dbg !1226
  %arrayidx223 = getelementptr inbounds i16, i16* %180, i64 %181, !dbg !1224
  store i16 255, i16* %arrayidx223, align 2, !dbg !1227
  call void @llvm.dbg.declare(metadata i32* %nedges, metadata !1228, metadata !DIExpression()), !dbg !1229
  store i32 1, i32* %nedges, align 4, !dbg !1229
  %182 = load i64, i64* %c200, align 8, !dbg !1230
  %conv224 = trunc i64 %182 to i32, !dbg !1230
  %183 = load i32*, i32** %edges, align 8, !dbg !1231
  %arrayidx225 = getelementptr inbounds i32, i32* %183, i64 0, !dbg !1231
  store i32 %conv224, i32* %arrayidx225, align 4, !dbg !1232
  br label %do.body, !dbg !1233

do.body:                                          ; preds = %do.cond, %if.then222
  %184 = load i32, i32* %nedges, align 4, !dbg !1234
  %dec = add nsw i32 %184, -1, !dbg !1234
  store i32 %dec, i32* %nedges, align 4, !dbg !1234
  call void @llvm.dbg.declare(metadata i32* %t, metadata !1236, metadata !DIExpression()), !dbg !1237
  %185 = load i32*, i32** %edges, align 8, !dbg !1238
  %186 = load i32, i32* %nedges, align 4, !dbg !1239
  %idxprom226 = sext i32 %186 to i64, !dbg !1238
  %arrayidx227 = getelementptr inbounds i32, i32* %185, i64 %idxprom226, !dbg !1238
  %187 = load i32, i32* %arrayidx227, align 4, !dbg !1238
  store i32 %187, i32* %t, align 4, !dbg !1237
  call void @llvm.dbg.declare(metadata [8 x i32]* %nbs, metadata !1240, metadata !DIExpression()), !dbg !1244
  %188 = load i32, i32* %t, align 4, !dbg !1245
  %189 = load i32, i32* %nx, align 4, !dbg !1246
  %sub228 = sub nsw i32 %188, %189, !dbg !1247
  %arrayidx229 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 0, !dbg !1248
  store i32 %sub228, i32* %arrayidx229, align 16, !dbg !1249
  %190 = load i32, i32* %t, align 4, !dbg !1250
  %191 = load i32, i32* %nx, align 4, !dbg !1251
  %add230 = add nsw i32 %190, %191, !dbg !1252
  %arrayidx231 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 1, !dbg !1253
  store i32 %add230, i32* %arrayidx231, align 4, !dbg !1254
  %192 = load i32, i32* %t, align 4, !dbg !1255
  %add232 = add nsw i32 %192, 1, !dbg !1256
  %arrayidx233 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 2, !dbg !1257
  store i32 %add232, i32* %arrayidx233, align 8, !dbg !1258
  %193 = load i32, i32* %t, align 4, !dbg !1259
  %sub234 = sub nsw i32 %193, 1, !dbg !1260
  %arrayidx235 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 3, !dbg !1261
  store i32 %sub234, i32* %arrayidx235, align 4, !dbg !1262
  %arrayidx236 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 0, !dbg !1263
  %194 = load i32, i32* %arrayidx236, align 16, !dbg !1263
  %add237 = add nsw i32 %194, 1, !dbg !1264
  %arrayidx238 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 4, !dbg !1265
  store i32 %add237, i32* %arrayidx238, align 16, !dbg !1266
  %arrayidx239 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 0, !dbg !1267
  %195 = load i32, i32* %arrayidx239, align 16, !dbg !1267
  %sub240 = sub nsw i32 %195, 1, !dbg !1268
  %arrayidx241 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 5, !dbg !1269
  store i32 %sub240, i32* %arrayidx241, align 4, !dbg !1270
  %arrayidx242 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 1, !dbg !1271
  %196 = load i32, i32* %arrayidx242, align 4, !dbg !1271
  %add243 = add nsw i32 %196, 1, !dbg !1272
  %arrayidx244 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 6, !dbg !1273
  store i32 %add243, i32* %arrayidx244, align 8, !dbg !1274
  %arrayidx245 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 1, !dbg !1275
  %197 = load i32, i32* %arrayidx245, align 4, !dbg !1275
  %sub246 = sub nsw i32 %197, 1, !dbg !1276
  %arrayidx247 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 7, !dbg !1277
  store i32 %sub246, i32* %arrayidx247, align 4, !dbg !1278
  call void @llvm.dbg.declare(metadata i32* %k, metadata !1279, metadata !DIExpression()), !dbg !1281
  store i32 0, i32* %k, align 4, !dbg !1281
  br label %for.cond248, !dbg !1282

for.cond248:                                      ; preds = %for.inc278, %do.body
  %198 = load i32, i32* %k, align 4, !dbg !1283
  %cmp249 = icmp slt i32 %198, 8, !dbg !1285
  br i1 %cmp249, label %for.body251, label %for.end280, !dbg !1286

for.body251:                                      ; preds = %for.cond248
  %199 = load i16*, i16** %nms, align 8, !dbg !1287
  %200 = load i32, i32* %k, align 4, !dbg !1289
  %idxprom252 = sext i32 %200 to i64, !dbg !1290
  %arrayidx253 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 %idxprom252, !dbg !1290
  %201 = load i32, i32* %arrayidx253, align 4, !dbg !1290
  %idxprom254 = sext i32 %201 to i64, !dbg !1287
  %arrayidx255 = getelementptr inbounds i16, i16* %199, i64 %idxprom254, !dbg !1287
  %202 = load i16, i16* %arrayidx255, align 2, !dbg !1287
  %conv256 = sext i16 %202 to i32, !dbg !1287
  %203 = load i32, i32* %tmin.addr, align 4, !dbg !1291
  %cmp257 = icmp sge i32 %conv256, %203, !dbg !1292
  br i1 %cmp257, label %land.lhs.true259, label %if.end277, !dbg !1293

land.lhs.true259:                                 ; preds = %for.body251
  %204 = load i16*, i16** %out, align 8, !dbg !1294
  %205 = load i32, i32* %k, align 4, !dbg !1295
  %idxprom260 = sext i32 %205 to i64, !dbg !1296
  %arrayidx261 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 %idxprom260, !dbg !1296
  %206 = load i32, i32* %arrayidx261, align 4, !dbg !1296
  %idxprom262 = sext i32 %206 to i64, !dbg !1294
  %arrayidx263 = getelementptr inbounds i16, i16* %204, i64 %idxprom262, !dbg !1294
  %207 = load i16, i16* %arrayidx263, align 2, !dbg !1294
  %conv264 = sext i16 %207 to i32, !dbg !1294
  %cmp265 = icmp eq i32 %conv264, 0, !dbg !1297
  br i1 %cmp265, label %if.then267, label %if.end277, !dbg !1298

if.then267:                                       ; preds = %land.lhs.true259
  %208 = load i16*, i16** %out, align 8, !dbg !1299
  %209 = load i32, i32* %k, align 4, !dbg !1301
  %idxprom268 = sext i32 %209 to i64, !dbg !1302
  %arrayidx269 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 %idxprom268, !dbg !1302
  %210 = load i32, i32* %arrayidx269, align 4, !dbg !1302
  %idxprom270 = sext i32 %210 to i64, !dbg !1299
  %arrayidx271 = getelementptr inbounds i16, i16* %208, i64 %idxprom270, !dbg !1299
  store i16 255, i16* %arrayidx271, align 2, !dbg !1303
  %211 = load i32, i32* %k, align 4, !dbg !1304
  %idxprom272 = sext i32 %211 to i64, !dbg !1305
  %arrayidx273 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 %idxprom272, !dbg !1305
  %212 = load i32, i32* %arrayidx273, align 4, !dbg !1305
  %213 = load i32*, i32** %edges, align 8, !dbg !1306
  %214 = load i32, i32* %nedges, align 4, !dbg !1307
  %idxprom274 = sext i32 %214 to i64, !dbg !1306
  %arrayidx275 = getelementptr inbounds i32, i32* %213, i64 %idxprom274, !dbg !1306
  store i32 %212, i32* %arrayidx275, align 4, !dbg !1308
  %215 = load i32, i32* %nedges, align 4, !dbg !1309
  %inc276 = add nsw i32 %215, 1, !dbg !1309
  store i32 %inc276, i32* %nedges, align 4, !dbg !1309
  br label %if.end277, !dbg !1310

if.end277:                                        ; preds = %if.then267, %land.lhs.true259, %for.body251
  br label %for.inc278, !dbg !1311

for.inc278:                                       ; preds = %if.end277
  %216 = load i32, i32* %k, align 4, !dbg !1312
  %inc279 = add nsw i32 %216, 1, !dbg !1312
  store i32 %inc279, i32* %k, align 4, !dbg !1312
  br label %for.cond248, !dbg !1313, !llvm.loop !1314

for.end280:                                       ; preds = %for.cond248
  br label %do.cond, !dbg !1316

do.cond:                                          ; preds = %for.end280
  %217 = load i32, i32* %nedges, align 4, !dbg !1317
  %cmp281 = icmp sgt i32 %217, 0, !dbg !1318
  br i1 %cmp281, label %do.body, label %do.end, !dbg !1316, !llvm.loop !1319

do.end:                                           ; preds = %do.cond
  br label %if.end283, !dbg !1321

if.end283:                                        ; preds = %do.end, %land.lhs.true217, %for.body212
  %218 = load i64, i64* %c200, align 8, !dbg !1322
  %inc284 = add i64 %218, 1, !dbg !1322
  store i64 %inc284, i64* %c200, align 8, !dbg !1322
  br label %for.inc285, !dbg !1323

for.inc285:                                       ; preds = %if.end283
  %219 = load i32, i32* %i207, align 4, !dbg !1324
  %inc286 = add nsw i32 %219, 1, !dbg !1324
  store i32 %inc286, i32* %i207, align 4, !dbg !1324
  br label %for.cond208, !dbg !1325, !llvm.loop !1326

for.end287:                                       ; preds = %for.cond208
  br label %for.inc288, !dbg !1327

for.inc288:                                       ; preds = %for.end287
  %220 = load i32, i32* %j201, align 4, !dbg !1328
  %inc289 = add nsw i32 %220, 1, !dbg !1328
  store i32 %inc289, i32* %j201, align 4, !dbg !1328
  br label %for.cond202, !dbg !1329, !llvm.loop !1330

for.end290:                                       ; preds = %for.cond202
  %221 = load i16*, i16** %after_Gx, align 8, !dbg !1332
  %222 = bitcast i16* %221 to i8*, !dbg !1332
  call void @free(i8* %222) #6, !dbg !1333
  %223 = load i16*, i16** %after_Gy, align 8, !dbg !1334
  %224 = bitcast i16* %223 to i8*, !dbg !1334
  call void @free(i8* %224) #6, !dbg !1335
  %225 = load i16*, i16** %G, align 8, !dbg !1336
  %226 = bitcast i16* %225 to i8*, !dbg !1336
  call void @free(i8* %226) #6, !dbg !1337
  %227 = load i16*, i16** %nms, align 8, !dbg !1338
  %228 = bitcast i16* %227 to i8*, !dbg !1338
  call void @free(i8* %228) #6, !dbg !1339
  %229 = load i16*, i16** %out, align 8, !dbg !1340
  ret i16* %229, !dbg !1341
}

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local double @hypot(double, double) #3

; Function Attrs: nounwind
declare dso_local double @fmod(double, double) #3

; Function Attrs: nounwind
declare dso_local double @atan2(double, double) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !2 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %in_bitmap_data = alloca i16*, align 8
  %out_bitmap_data = alloca i16*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !1342, metadata !DIExpression()), !dbg !1343
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !1344, metadata !DIExpression()), !dbg !1345
  %0 = load i32, i32* %argc.addr, align 4, !dbg !1346
  %cmp = icmp slt i32 %0, 2, !dbg !1348
  br i1 %cmp, label %if.then, label %if.end, !dbg !1349

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !1350
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 0, !dbg !1350
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !1350
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.10, i64 0, i64 0), i8* %2), !dbg !1352
  store i32 1, i32* %retval, align 4, !dbg !1353
  br label %return, !dbg !1353

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i16** %in_bitmap_data, metadata !1354, metadata !DIExpression()), !dbg !1355
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !1356
  %arrayidx1 = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !1356
  %4 = load i8*, i8** %arrayidx1, align 8, !dbg !1356
  %call2 = call i16* @load_bmp(i8* %4, %struct.bitmap_info_header_t* @main.ih), !dbg !1357
  store i16* %call2, i16** %in_bitmap_data, align 8, !dbg !1355
  %5 = load i16*, i16** %in_bitmap_data, align 8, !dbg !1358
  %cmp3 = icmp eq i16* %5, null, !dbg !1360
  br i1 %cmp3, label %if.then4, label %if.end6, !dbg !1361

if.then4:                                         ; preds = %if.end
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1362
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.11, i64 0, i64 0)), !dbg !1364
  store i32 1, i32* %retval, align 4, !dbg !1365
  br label %return, !dbg !1365

if.end6:                                          ; preds = %if.end
  %7 = load i32, i32* getelementptr inbounds (%struct.bitmap_info_header_t, %struct.bitmap_info_header_t* @main.ih, i32 0, i32 1), align 4, !dbg !1366
  %8 = load i32, i32* getelementptr inbounds (%struct.bitmap_info_header_t, %struct.bitmap_info_header_t* @main.ih, i32 0, i32 2), align 4, !dbg !1367
  %9 = load i16, i16* getelementptr inbounds (%struct.bitmap_info_header_t, %struct.bitmap_info_header_t* @main.ih, i32 0, i32 4), align 2, !dbg !1368
  %conv = zext i16 %9 to i32, !dbg !1369
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.12, i64 0, i64 0), i32 %7, i32 %8, i32 %conv), !dbg !1370
  call void @llvm.dbg.declare(metadata i16** %out_bitmap_data, metadata !1371, metadata !DIExpression()), !dbg !1372
  %10 = load i16*, i16** %in_bitmap_data, align 8, !dbg !1373
  %call8 = call i16* @canny_edge_detection(i16* %10, %struct.bitmap_info_header_t* @main.ih, i32 45, i32 50, float 1.000000e+00), !dbg !1374
  store i16* %call8, i16** %out_bitmap_data, align 8, !dbg !1372
  %11 = load i16*, i16** %out_bitmap_data, align 8, !dbg !1375
  %cmp9 = icmp eq i16* %11, null, !dbg !1377
  br i1 %cmp9, label %if.then11, label %if.end13, !dbg !1378

if.then11:                                        ; preds = %if.end6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1379
  %call12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.13, i64 0, i64 0)), !dbg !1381
  store i32 1, i32* %retval, align 4, !dbg !1382
  br label %return, !dbg !1382

if.end13:                                         ; preds = %if.end6
  %13 = load i16*, i16** %out_bitmap_data, align 8, !dbg !1383
  %call14 = call zeroext i1 @save_bmp(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.14, i64 0, i64 0), %struct.bitmap_info_header_t* @main.ih, i16* %13), !dbg !1385
  br i1 %call14, label %if.then15, label %if.end17, !dbg !1386

if.then15:                                        ; preds = %if.end13
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1387
  %call16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15, i64 0, i64 0)), !dbg !1389
  store i32 1, i32* %retval, align 4, !dbg !1390
  br label %return, !dbg !1390

if.end17:                                         ; preds = %if.end13
  %15 = load i16*, i16** %in_bitmap_data, align 8, !dbg !1391
  %16 = bitcast i16* %15 to i8*, !dbg !1392
  call void @free(i8* %16) #6, !dbg !1393
  %17 = load i16*, i16** %out_bitmap_data, align 8, !dbg !1394
  %18 = bitcast i16* %17 to i8*, !dbg !1395
  call void @free(i8* %18) #6, !dbg !1396
  store i32 0, i32* %retval, align 4, !dbg !1397
  br label %return, !dbg !1397

return:                                           ; preds = %if.end17, %if.then15, %if.then11, %if.then4, %if.then
  %19 = load i32, i32* %retval, align 4, !dbg !1398
  ret i32 %19, !dbg !1398
}

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!13}
!llvm.module.flags = !{!52, !53, !54}
!llvm.ident = !{!55}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "ih", scope: !2, file: !3, line: 429, type: !32, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 422, type: !4, scopeLine: 423, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !13, retainedNodes: !14)
!3 = !DIFile(filename: "canny-edge-detector.c", directory: "/scratch/yc0769/xstack_benchmark/rosetta/Canny-edge-detector")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7, !8}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !14, retainedTypes: !15, globals: !31, splitDebugInlining: false, nameTableKind: None)
!14 = !{}
!15 = !{!16, !17, !23, !25, !27, !6, !28, !29, !30}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !19, line: 25, baseType: !20)
!19 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !21, line: 40, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!22 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "pixel_t", file: !3, line: 63, baseType: !24)
!24 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !19, line: 24, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !21, line: 38, baseType: !27)
!27 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!28 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!31 = !{!0}
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "bitmap_info_header_t", file: !3, line: 52, baseType: !33)
!33 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 40, size: 320, elements: !34)
!34 = !{!35, !39, !43, !44, !45, !46, !47, !48, !49, !50, !51}
!35 = !DIDerivedType(tag: DW_TAG_member, name: "header_sz", scope: !33, file: !3, line: 41, baseType: !36, size: 32)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !19, line: 26, baseType: !37)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !21, line: 42, baseType: !38)
!38 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !33, file: !3, line: 42, baseType: !40, size: 32, offset: 32)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !41, line: 26, baseType: !42)
!41 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !21, line: 41, baseType: !6)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "height", scope: !33, file: !3, line: 43, baseType: !40, size: 32, offset: 64)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "nplanes", scope: !33, file: !3, line: 44, baseType: !18, size: 16, offset: 96)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "bitspp", scope: !33, file: !3, line: 45, baseType: !18, size: 16, offset: 112)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "compress_type", scope: !33, file: !3, line: 46, baseType: !36, size: 32, offset: 128)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "bmp_bytesz", scope: !33, file: !3, line: 47, baseType: !36, size: 32, offset: 160)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "hres", scope: !33, file: !3, line: 48, baseType: !40, size: 32, offset: 192)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "vres", scope: !33, file: !3, line: 49, baseType: !40, size: 32, offset: 224)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "ncolors", scope: !33, file: !3, line: 50, baseType: !36, size: 32, offset: 256)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "nimpcolors", scope: !33, file: !3, line: 51, baseType: !36, size: 32, offset: 288)
!52 = !{i32 7, !"Dwarf Version", i32 4}
!53 = !{i32 2, !"Debug Info Version", i32 3}
!54 = !{i32 1, !"wchar_size", i32 4}
!55 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!56 = distinct !DISubprogram(name: "load_bmp", scope: !3, file: !3, line: 65, type: !57, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !13, retainedNodes: !14)
!57 = !DISubroutineType(types: !58)
!58 = !{!30, !10, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!60 = !DILocalVariable(name: "filename", arg: 1, scope: !56, file: !3, line: 65, type: !10)
!61 = !DILocation(line: 65, column: 31, scope: !56)
!62 = !DILocalVariable(name: "bitmapInfoHeader", arg: 2, scope: !56, file: !3, line: 66, type: !59)
!63 = !DILocation(line: 66, column: 41, scope: !56)
!64 = !DILocalVariable(name: "filePtr", scope: !56, file: !3, line: 68, type: !65)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !67, line: 7, baseType: !68)
!67 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!68 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !69, line: 49, size: 1728, elements: !70)
!69 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!70 = !{!71, !72, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !87, !89, !90, !91, !94, !95, !97, !101, !104, !106, !109, !112, !113, !114, !118, !119}
!71 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !68, file: !69, line: 51, baseType: !6, size: 32)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !68, file: !69, line: 54, baseType: !73, size: 64, offset: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !68, file: !69, line: 55, baseType: !73, size: 64, offset: 128)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !68, file: !69, line: 56, baseType: !73, size: 64, offset: 192)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !68, file: !69, line: 57, baseType: !73, size: 64, offset: 256)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !68, file: !69, line: 58, baseType: !73, size: 64, offset: 320)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !68, file: !69, line: 59, baseType: !73, size: 64, offset: 384)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !68, file: !69, line: 60, baseType: !73, size: 64, offset: 448)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !68, file: !69, line: 61, baseType: !73, size: 64, offset: 512)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !68, file: !69, line: 64, baseType: !73, size: 64, offset: 576)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !68, file: !69, line: 65, baseType: !73, size: 64, offset: 640)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !68, file: !69, line: 66, baseType: !73, size: 64, offset: 704)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !68, file: !69, line: 68, baseType: !85, size: 64, offset: 768)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !69, line: 36, flags: DIFlagFwdDecl)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !68, file: !69, line: 70, baseType: !88, size: 64, offset: 832)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !68, file: !69, line: 72, baseType: !6, size: 32, offset: 896)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !68, file: !69, line: 73, baseType: !6, size: 32, offset: 928)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !68, file: !69, line: 74, baseType: !92, size: 64, offset: 960)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !21, line: 152, baseType: !93)
!93 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !68, file: !69, line: 77, baseType: !22, size: 16, offset: 1024)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !68, file: !69, line: 78, baseType: !96, size: 8, offset: 1040)
!96 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !68, file: !69, line: 79, baseType: !98, size: 8, offset: 1048)
!98 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 8, elements: !99)
!99 = !{!100}
!100 = !DISubrange(count: 1)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !68, file: !69, line: 81, baseType: !102, size: 64, offset: 1088)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !69, line: 43, baseType: null)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !68, file: !69, line: 89, baseType: !105, size: 64, offset: 1152)
!105 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !21, line: 153, baseType: !93)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !68, file: !69, line: 91, baseType: !107, size: 64, offset: 1216)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !69, line: 37, flags: DIFlagFwdDecl)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !68, file: !69, line: 92, baseType: !110, size: 64, offset: 1280)
!110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 64)
!111 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !69, line: 38, flags: DIFlagFwdDecl)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !68, file: !69, line: 93, baseType: !88, size: 64, offset: 1344)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !68, file: !69, line: 94, baseType: !16, size: 64, offset: 1408)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !68, file: !69, line: 95, baseType: !115, size: 64, offset: 1472)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !116, line: 46, baseType: !117)
!116 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/xstack-installs/llvm-install-debug/lib/clang/10.0.1/include/stddef.h", directory: "")
!117 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !68, file: !69, line: 96, baseType: !6, size: 32, offset: 1536)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !68, file: !69, line: 98, baseType: !120, size: 160, offset: 1568)
!120 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 160, elements: !121)
!121 = !{!122}
!122 = !DISubrange(count: 20)
!123 = !DILocation(line: 68, column: 11, scope: !56)
!124 = !DILocation(line: 68, column: 27, scope: !56)
!125 = !DILocation(line: 68, column: 21, scope: !56)
!126 = !DILocation(line: 69, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !56, file: !3, line: 69, column: 9)
!128 = !DILocation(line: 69, column: 17, scope: !127)
!129 = !DILocation(line: 69, column: 9, scope: !56)
!130 = !DILocation(line: 70, column: 9, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !3, line: 69, column: 26)
!132 = !DILocation(line: 71, column: 9, scope: !131)
!133 = !DILocalVariable(name: "mag", scope: !56, file: !3, line: 74, type: !134)
!134 = !DIDerivedType(tag: DW_TAG_typedef, name: "bmpfile_magic_t", file: !3, line: 31, baseType: !135)
!135 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 29, size: 16, elements: !136)
!136 = !{!137}
!137 = !DIDerivedType(tag: DW_TAG_member, name: "magic", scope: !135, file: !3, line: 30, baseType: !138, size: 16)
!138 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 16, elements: !139)
!139 = !{!140}
!140 = !DISubrange(count: 2)
!141 = !DILocation(line: 74, column: 21, scope: !56)
!142 = !DILocation(line: 75, column: 15, scope: !143)
!143 = distinct !DILexicalBlock(scope: !56, file: !3, line: 75, column: 9)
!144 = !DILocation(line: 75, column: 49, scope: !143)
!145 = !DILocation(line: 75, column: 9, scope: !143)
!146 = !DILocation(line: 75, column: 58, scope: !143)
!147 = !DILocation(line: 75, column: 9, scope: !56)
!148 = !DILocation(line: 76, column: 16, scope: !149)
!149 = distinct !DILexicalBlock(scope: !143, file: !3, line: 75, column: 64)
!150 = !DILocation(line: 76, column: 9, scope: !149)
!151 = !DILocation(line: 77, column: 9, scope: !149)
!152 = !DILocation(line: 83, column: 26, scope: !153)
!153 = distinct !DILexicalBlock(scope: !56, file: !3, line: 83, column: 9)
!154 = !DILocation(line: 83, column: 9, scope: !153)
!155 = !DILocation(line: 83, column: 33, scope: !153)
!156 = !DILocation(line: 83, column: 9, scope: !56)
!157 = !DILocation(line: 84, column: 17, scope: !158)
!158 = distinct !DILexicalBlock(scope: !153, file: !3, line: 83, column: 44)
!159 = !DILocation(line: 85, column: 21, scope: !158)
!160 = !DILocation(line: 85, column: 17, scope: !158)
!161 = !DILocation(line: 85, column: 35, scope: !158)
!162 = !DILocation(line: 85, column: 31, scope: !158)
!163 = !DILocation(line: 84, column: 9, scope: !158)
!164 = !DILocation(line: 86, column: 16, scope: !158)
!165 = !DILocation(line: 86, column: 9, scope: !158)
!166 = !DILocation(line: 87, column: 9, scope: !158)
!167 = !DILocalVariable(name: "bitmapFileHeader", scope: !56, file: !3, line: 90, type: !168)
!168 = !DIDerivedType(tag: DW_TAG_typedef, name: "bmpfile_header_t", file: !3, line: 38, baseType: !169)
!169 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 33, size: 96, elements: !170)
!170 = !{!171, !172, !173, !174}
!171 = !DIDerivedType(tag: DW_TAG_member, name: "filesz", scope: !169, file: !3, line: 34, baseType: !36, size: 32)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "creator1", scope: !169, file: !3, line: 35, baseType: !18, size: 16, offset: 32)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "creator2", scope: !169, file: !3, line: 36, baseType: !18, size: 16, offset: 48)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "bmp_offset", scope: !169, file: !3, line: 37, baseType: !36, size: 32, offset: 64)
!175 = !DILocation(line: 90, column: 22, scope: !56)
!176 = !DILocation(line: 92, column: 15, scope: !177)
!177 = distinct !DILexicalBlock(scope: !56, file: !3, line: 92, column: 9)
!178 = !DILocation(line: 93, column: 18, scope: !177)
!179 = !DILocation(line: 92, column: 9, scope: !177)
!180 = !DILocation(line: 93, column: 27, scope: !177)
!181 = !DILocation(line: 92, column: 9, scope: !56)
!182 = !DILocation(line: 94, column: 16, scope: !183)
!183 = distinct !DILexicalBlock(scope: !177, file: !3, line: 93, column: 33)
!184 = !DILocation(line: 94, column: 9, scope: !183)
!185 = !DILocation(line: 95, column: 9, scope: !183)
!186 = !DILocation(line: 99, column: 15, scope: !187)
!187 = distinct !DILexicalBlock(scope: !56, file: !3, line: 99, column: 9)
!188 = !DILocation(line: 100, column: 18, scope: !187)
!189 = !DILocation(line: 99, column: 9, scope: !187)
!190 = !DILocation(line: 100, column: 27, scope: !187)
!191 = !DILocation(line: 99, column: 9, scope: !56)
!192 = !DILocation(line: 101, column: 16, scope: !193)
!193 = distinct !DILexicalBlock(scope: !187, file: !3, line: 100, column: 33)
!194 = !DILocation(line: 101, column: 9, scope: !193)
!195 = !DILocation(line: 102, column: 9, scope: !193)
!196 = !DILocation(line: 105, column: 9, scope: !197)
!197 = distinct !DILexicalBlock(scope: !56, file: !3, line: 105, column: 9)
!198 = !DILocation(line: 105, column: 27, scope: !197)
!199 = !DILocation(line: 105, column: 41, scope: !197)
!200 = !DILocation(line: 105, column: 9, scope: !56)
!201 = !DILocation(line: 106, column: 17, scope: !197)
!202 = !DILocation(line: 106, column: 9, scope: !197)
!203 = !DILocation(line: 109, column: 15, scope: !204)
!204 = distinct !DILexicalBlock(scope: !56, file: !3, line: 109, column: 9)
!205 = !DILocation(line: 109, column: 41, scope: !204)
!206 = !DILocation(line: 109, column: 24, scope: !204)
!207 = !DILocation(line: 109, column: 9, scope: !204)
!208 = !DILocation(line: 109, column: 9, scope: !56)
!209 = !DILocation(line: 110, column: 16, scope: !210)
!210 = distinct !DILexicalBlock(scope: !204, file: !3, line: 109, column: 64)
!211 = !DILocation(line: 110, column: 9, scope: !210)
!212 = !DILocation(line: 111, column: 9, scope: !210)
!213 = !DILocalVariable(name: "bitmapImage", scope: !56, file: !3, line: 115, type: !30)
!214 = !DILocation(line: 115, column: 14, scope: !56)
!215 = !DILocation(line: 115, column: 35, scope: !56)
!216 = !DILocation(line: 115, column: 53, scope: !56)
!217 = !DILocation(line: 115, column: 64, scope: !56)
!218 = !DILocation(line: 115, column: 28, scope: !56)
!219 = !DILocation(line: 119, column: 9, scope: !220)
!220 = distinct !DILexicalBlock(scope: !56, file: !3, line: 119, column: 9)
!221 = !DILocation(line: 119, column: 21, scope: !220)
!222 = !DILocation(line: 119, column: 9, scope: !56)
!223 = !DILocation(line: 120, column: 16, scope: !224)
!224 = distinct !DILexicalBlock(scope: !220, file: !3, line: 119, column: 30)
!225 = !DILocation(line: 120, column: 9, scope: !224)
!226 = !DILocation(line: 121, column: 9, scope: !224)
!227 = !DILocalVariable(name: "pad", scope: !56, file: !3, line: 125, type: !115)
!228 = !DILocation(line: 125, column: 12, scope: !56)
!229 = !DILocalVariable(name: "count", scope: !56, file: !3, line: 125, type: !115)
!230 = !DILocation(line: 125, column: 17, scope: !56)
!231 = !DILocalVariable(name: "c", scope: !56, file: !3, line: 126, type: !27)
!232 = !DILocation(line: 126, column: 19, scope: !56)
!233 = !DILocation(line: 127, column: 18, scope: !56)
!234 = !DILocation(line: 127, column: 36, scope: !56)
!235 = !DILocation(line: 127, column: 43, scope: !56)
!236 = !DILocation(line: 127, column: 61, scope: !56)
!237 = !DILocation(line: 127, column: 42, scope: !56)
!238 = !DILocation(line: 127, column: 66, scope: !56)
!239 = !DILocation(line: 127, column: 13, scope: !56)
!240 = !DILocation(line: 127, column: 12, scope: !56)
!241 = !DILocation(line: 127, column: 74, scope: !56)
!242 = !DILocation(line: 127, column: 92, scope: !56)
!243 = !DILocation(line: 127, column: 72, scope: !56)
!244 = !DILocation(line: 127, column: 11, scope: !56)
!245 = !DILocation(line: 127, column: 9, scope: !56)
!246 = !DILocalVariable(name: "i", scope: !247, file: !3, line: 128, type: !115)
!247 = distinct !DILexicalBlock(scope: !56, file: !3, line: 128, column: 5)
!248 = !DILocation(line: 128, column: 16, scope: !247)
!249 = !DILocation(line: 128, column: 9, scope: !247)
!250 = !DILocation(line: 128, column: 21, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !3, line: 128, column: 5)
!252 = !DILocation(line: 128, column: 23, scope: !251)
!253 = !DILocation(line: 128, column: 41, scope: !251)
!254 = !DILocation(line: 128, column: 22, scope: !251)
!255 = !DILocation(line: 128, column: 5, scope: !247)
!256 = !DILocalVariable(name: "j", scope: !257, file: !3, line: 129, type: !115)
!257 = distinct !DILexicalBlock(scope: !258, file: !3, line: 129, column: 6)
!258 = distinct !DILexicalBlock(scope: !251, file: !3, line: 128, column: 53)
!259 = !DILocation(line: 129, column: 17, scope: !257)
!260 = !DILocation(line: 129, column: 10, scope: !257)
!261 = !DILocation(line: 129, column: 22, scope: !262)
!262 = distinct !DILexicalBlock(scope: !257, file: !3, line: 129, column: 6)
!263 = !DILocation(line: 129, column: 24, scope: !262)
!264 = !DILocation(line: 129, column: 42, scope: !262)
!265 = !DILocation(line: 129, column: 23, scope: !262)
!266 = !DILocation(line: 129, column: 6, scope: !257)
!267 = !DILocation(line: 130, column: 47, scope: !268)
!268 = distinct !DILexicalBlock(scope: !269, file: !3, line: 130, column: 11)
!269 = distinct !DILexicalBlock(scope: !262, file: !3, line: 129, column: 53)
!270 = !DILocation(line: 130, column: 11, scope: !268)
!271 = !DILocation(line: 130, column: 56, scope: !268)
!272 = !DILocation(line: 130, column: 11, scope: !269)
!273 = !DILocation(line: 131, column: 15, scope: !274)
!274 = distinct !DILexicalBlock(scope: !268, file: !3, line: 130, column: 62)
!275 = !DILocation(line: 131, column: 8, scope: !274)
!276 = !DILocation(line: 132, column: 8, scope: !274)
!277 = !DILocation(line: 134, column: 40, scope: !269)
!278 = !DILocation(line: 134, column: 30, scope: !269)
!279 = !DILocation(line: 134, column: 7, scope: !269)
!280 = !DILocation(line: 134, column: 24, scope: !269)
!281 = !DILocation(line: 134, column: 28, scope: !269)
!282 = !DILocation(line: 135, column: 6, scope: !269)
!283 = !DILocation(line: 129, column: 50, scope: !262)
!284 = !DILocation(line: 129, column: 6, scope: !262)
!285 = distinct !{!285, !266, !286}
!286 = !DILocation(line: 135, column: 6, scope: !257)
!287 = !DILocation(line: 136, column: 12, scope: !258)
!288 = !DILocation(line: 136, column: 21, scope: !258)
!289 = !DILocation(line: 136, column: 6, scope: !258)
!290 = !DILocation(line: 137, column: 5, scope: !258)
!291 = !DILocation(line: 128, column: 50, scope: !251)
!292 = !DILocation(line: 128, column: 5, scope: !251)
!293 = distinct !{!293, !255, !294}
!294 = !DILocation(line: 137, column: 5, scope: !247)
!295 = !DILocation(line: 143, column: 12, scope: !56)
!296 = !DILocation(line: 143, column: 5, scope: !56)
!297 = !DILocation(line: 144, column: 12, scope: !56)
!298 = !DILocation(line: 144, column: 5, scope: !56)
!299 = !DILocation(line: 145, column: 1, scope: !56)
!300 = distinct !DISubprogram(name: "save_bmp", scope: !3, file: !3, line: 148, type: !301, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !13, retainedNodes: !14)
!301 = !DISubroutineType(types: !302)
!302 = !{!303, !10, !304, !306}
!303 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!304 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !305, size: 64)
!305 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !32)
!306 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !307, size: 64)
!307 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!308 = !DILocalVariable(name: "filename", arg: 1, scope: !300, file: !3, line: 148, type: !10)
!309 = !DILocation(line: 148, column: 27, scope: !300)
!310 = !DILocalVariable(name: "bmp_ih", arg: 2, scope: !300, file: !3, line: 148, type: !304)
!311 = !DILocation(line: 148, column: 65, scope: !300)
!312 = !DILocalVariable(name: "data", arg: 3, scope: !300, file: !3, line: 149, type: !306)
!313 = !DILocation(line: 149, column: 30, scope: !300)
!314 = !DILocalVariable(name: "filePtr", scope: !300, file: !3, line: 151, type: !65)
!315 = !DILocation(line: 151, column: 11, scope: !300)
!316 = !DILocation(line: 151, column: 27, scope: !300)
!317 = !DILocation(line: 151, column: 21, scope: !300)
!318 = !DILocation(line: 152, column: 9, scope: !319)
!319 = distinct !DILexicalBlock(scope: !300, file: !3, line: 152, column: 9)
!320 = !DILocation(line: 152, column: 17, scope: !319)
!321 = !DILocation(line: 152, column: 9, scope: !300)
!322 = !DILocation(line: 153, column: 9, scope: !319)
!323 = !DILocalVariable(name: "mag", scope: !300, file: !3, line: 155, type: !134)
!324 = !DILocation(line: 155, column: 21, scope: !300)
!325 = !DILocation(line: 156, column: 16, scope: !326)
!326 = distinct !DILexicalBlock(scope: !300, file: !3, line: 156, column: 9)
!327 = !DILocation(line: 156, column: 50, scope: !326)
!328 = !DILocation(line: 156, column: 9, scope: !326)
!329 = !DILocation(line: 156, column: 59, scope: !326)
!330 = !DILocation(line: 156, column: 9, scope: !300)
!331 = !DILocation(line: 157, column: 16, scope: !332)
!332 = distinct !DILexicalBlock(scope: !326, file: !3, line: 156, column: 65)
!333 = !DILocation(line: 157, column: 9, scope: !332)
!334 = !DILocation(line: 158, column: 9, scope: !332)
!335 = !DILocalVariable(name: "offset", scope: !300, file: !3, line: 161, type: !336)
!336 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !36)
!337 = !DILocation(line: 161, column: 20, scope: !300)
!338 = !DILocation(line: 164, column: 37, scope: !300)
!339 = !DILocation(line: 164, column: 45, scope: !300)
!340 = !DILocation(line: 164, column: 34, scope: !300)
!341 = !DILocation(line: 164, column: 53, scope: !300)
!342 = !DILocation(line: 164, column: 29, scope: !300)
!343 = !DILocation(line: 163, column: 58, scope: !300)
!344 = !DILocation(line: 161, column: 29, scope: !300)
!345 = !DILocalVariable(name: "bmp_fh", scope: !300, file: !3, line: 166, type: !346)
!346 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !168)
!347 = !DILocation(line: 166, column: 28, scope: !300)
!348 = !DILocation(line: 166, column: 37, scope: !300)
!349 = !DILocation(line: 167, column: 19, scope: !300)
!350 = !DILocation(line: 167, column: 28, scope: !300)
!351 = !DILocation(line: 167, column: 36, scope: !300)
!352 = !DILocation(line: 167, column: 26, scope: !300)
!353 = !DILocation(line: 170, column: 23, scope: !300)
!354 = !DILocation(line: 173, column: 16, scope: !355)
!355 = distinct !DILexicalBlock(scope: !300, file: !3, line: 173, column: 9)
!356 = !DILocation(line: 173, column: 54, scope: !355)
!357 = !DILocation(line: 173, column: 9, scope: !355)
!358 = !DILocation(line: 173, column: 63, scope: !355)
!359 = !DILocation(line: 173, column: 9, scope: !300)
!360 = !DILocation(line: 174, column: 16, scope: !361)
!361 = distinct !DILexicalBlock(scope: !355, file: !3, line: 173, column: 69)
!362 = !DILocation(line: 174, column: 9, scope: !361)
!363 = !DILocation(line: 175, column: 9, scope: !361)
!364 = !DILocation(line: 177, column: 16, scope: !365)
!365 = distinct !DILexicalBlock(scope: !300, file: !3, line: 177, column: 9)
!366 = !DILocation(line: 177, column: 57, scope: !365)
!367 = !DILocation(line: 177, column: 9, scope: !365)
!368 = !DILocation(line: 177, column: 66, scope: !365)
!369 = !DILocation(line: 177, column: 9, scope: !300)
!370 = !DILocation(line: 178, column: 16, scope: !371)
!371 = distinct !DILexicalBlock(scope: !365, file: !3, line: 177, column: 72)
!372 = !DILocation(line: 178, column: 9, scope: !371)
!373 = !DILocation(line: 179, column: 9, scope: !371)
!374 = !DILocalVariable(name: "i", scope: !375, file: !3, line: 183, type: !115)
!375 = distinct !DILexicalBlock(scope: !300, file: !3, line: 183, column: 5)
!376 = !DILocation(line: 183, column: 17, scope: !375)
!377 = !DILocation(line: 183, column: 10, scope: !375)
!378 = !DILocation(line: 183, column: 24, scope: !379)
!379 = distinct !DILexicalBlock(scope: !375, file: !3, line: 183, column: 5)
!380 = !DILocation(line: 183, column: 35, scope: !379)
!381 = !DILocation(line: 183, column: 43, scope: !379)
!382 = !DILocation(line: 183, column: 32, scope: !379)
!383 = !DILocation(line: 183, column: 28, scope: !379)
!384 = !DILocation(line: 183, column: 26, scope: !379)
!385 = !DILocation(line: 183, column: 5, scope: !375)
!386 = !DILocalVariable(name: "color", scope: !387, file: !3, line: 184, type: !388)
!387 = distinct !DILexicalBlock(scope: !379, file: !3, line: 183, column: 57)
!388 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !389)
!389 = !DIDerivedType(tag: DW_TAG_typedef, name: "rgb_t", file: !3, line: 59, baseType: !390)
!390 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 54, size: 32, elements: !391)
!391 = !{!392, !393, !394, !395}
!392 = !DIDerivedType(tag: DW_TAG_member, name: "r", scope: !390, file: !3, line: 55, baseType: !25, size: 8)
!393 = !DIDerivedType(tag: DW_TAG_member, name: "g", scope: !390, file: !3, line: 56, baseType: !25, size: 8, offset: 8)
!394 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !390, file: !3, line: 57, baseType: !25, size: 8, offset: 16)
!395 = !DIDerivedType(tag: DW_TAG_member, name: "nothing", scope: !390, file: !3, line: 58, baseType: !25, size: 8, offset: 24)
!396 = !DILocation(line: 184, column: 21, scope: !387)
!397 = !DILocation(line: 184, column: 29, scope: !387)
!398 = !DILocation(line: 184, column: 39, scope: !387)
!399 = !DILocation(line: 184, column: 30, scope: !387)
!400 = !DILocation(line: 184, column: 51, scope: !387)
!401 = !DILocation(line: 184, column: 42, scope: !387)
!402 = !DILocation(line: 184, column: 63, scope: !387)
!403 = !DILocation(line: 184, column: 54, scope: !387)
!404 = !DILocation(line: 185, column: 20, scope: !405)
!405 = distinct !DILexicalBlock(scope: !387, file: !3, line: 185, column: 13)
!406 = !DILocation(line: 185, column: 46, scope: !405)
!407 = !DILocation(line: 185, column: 13, scope: !405)
!408 = !DILocation(line: 185, column: 55, scope: !405)
!409 = !DILocation(line: 185, column: 13, scope: !387)
!410 = !DILocation(line: 186, column: 20, scope: !411)
!411 = distinct !DILexicalBlock(scope: !405, file: !3, line: 185, column: 61)
!412 = !DILocation(line: 186, column: 13, scope: !411)
!413 = !DILocation(line: 187, column: 13, scope: !411)
!414 = !DILocation(line: 189, column: 5, scope: !387)
!415 = !DILocation(line: 183, column: 53, scope: !379)
!416 = !DILocation(line: 183, column: 5, scope: !379)
!417 = distinct !{!417, !385, !418}
!418 = !DILocation(line: 189, column: 5, scope: !375)
!419 = !DILocalVariable(name: "pad", scope: !300, file: !3, line: 196, type: !115)
!420 = !DILocation(line: 196, column: 12, scope: !300)
!421 = !DILocation(line: 196, column: 25, scope: !300)
!422 = !DILocation(line: 196, column: 33, scope: !300)
!423 = !DILocation(line: 196, column: 40, scope: !300)
!424 = !DILocation(line: 196, column: 48, scope: !300)
!425 = !DILocation(line: 196, column: 39, scope: !300)
!426 = !DILocation(line: 196, column: 53, scope: !300)
!427 = !DILocation(line: 196, column: 20, scope: !300)
!428 = !DILocation(line: 196, column: 19, scope: !300)
!429 = !DILocation(line: 196, column: 61, scope: !300)
!430 = !DILocation(line: 196, column: 69, scope: !300)
!431 = !DILocation(line: 196, column: 59, scope: !300)
!432 = !DILocation(line: 196, column: 18, scope: !300)
!433 = !DILocalVariable(name: "c", scope: !300, file: !3, line: 197, type: !27)
!434 = !DILocation(line: 197, column: 19, scope: !300)
!435 = !DILocalVariable(name: "i", scope: !436, file: !3, line: 198, type: !115)
!436 = distinct !DILexicalBlock(scope: !300, file: !3, line: 198, column: 5)
!437 = !DILocation(line: 198, column: 16, scope: !436)
!438 = !DILocation(line: 198, column: 9, scope: !436)
!439 = !DILocation(line: 198, column: 21, scope: !440)
!440 = distinct !DILexicalBlock(scope: !436, file: !3, line: 198, column: 5)
!441 = !DILocation(line: 198, column: 25, scope: !440)
!442 = !DILocation(line: 198, column: 33, scope: !440)
!443 = !DILocation(line: 198, column: 23, scope: !440)
!444 = !DILocation(line: 198, column: 5, scope: !436)
!445 = !DILocalVariable(name: "j", scope: !446, file: !3, line: 199, type: !115)
!446 = distinct !DILexicalBlock(scope: !447, file: !3, line: 199, column: 6)
!447 = distinct !DILexicalBlock(scope: !440, file: !3, line: 198, column: 46)
!448 = !DILocation(line: 199, column: 17, scope: !446)
!449 = !DILocation(line: 199, column: 10, scope: !446)
!450 = !DILocation(line: 199, column: 22, scope: !451)
!451 = distinct !DILexicalBlock(scope: !446, file: !3, line: 199, column: 6)
!452 = !DILocation(line: 199, column: 26, scope: !451)
!453 = !DILocation(line: 199, column: 34, scope: !451)
!454 = !DILocation(line: 199, column: 24, scope: !451)
!455 = !DILocation(line: 199, column: 6, scope: !446)
!456 = !DILocation(line: 200, column: 27, scope: !457)
!457 = distinct !DILexicalBlock(scope: !451, file: !3, line: 199, column: 46)
!458 = !DILocation(line: 200, column: 32, scope: !457)
!459 = !DILocation(line: 200, column: 36, scope: !457)
!460 = !DILocation(line: 200, column: 44, scope: !457)
!461 = !DILocation(line: 200, column: 50, scope: !457)
!462 = !DILocation(line: 200, column: 49, scope: !457)
!463 = !DILocation(line: 200, column: 34, scope: !457)
!464 = !DILocation(line: 200, column: 11, scope: !457)
!465 = !DILocation(line: 200, column: 9, scope: !457)
!466 = !DILocation(line: 201, column: 39, scope: !467)
!467 = distinct !DILexicalBlock(scope: !457, file: !3, line: 201, column: 11)
!468 = !DILocation(line: 201, column: 11, scope: !467)
!469 = !DILocation(line: 201, column: 48, scope: !467)
!470 = !DILocation(line: 201, column: 11, scope: !457)
!471 = !DILocation(line: 202, column: 15, scope: !472)
!472 = distinct !DILexicalBlock(scope: !467, file: !3, line: 201, column: 54)
!473 = !DILocation(line: 202, column: 8, scope: !472)
!474 = !DILocation(line: 203, column: 8, scope: !472)
!475 = !DILocation(line: 205, column: 6, scope: !457)
!476 = !DILocation(line: 199, column: 42, scope: !451)
!477 = !DILocation(line: 199, column: 6, scope: !451)
!478 = distinct !{!478, !455, !479}
!479 = !DILocation(line: 205, column: 6, scope: !446)
!480 = !DILocation(line: 206, column: 8, scope: !447)
!481 = !DILocalVariable(name: "j", scope: !482, file: !3, line: 207, type: !115)
!482 = distinct !DILexicalBlock(scope: !447, file: !3, line: 207, column: 6)
!483 = !DILocation(line: 207, column: 17, scope: !482)
!484 = !DILocation(line: 207, column: 10, scope: !482)
!485 = !DILocation(line: 207, column: 22, scope: !486)
!486 = distinct !DILexicalBlock(scope: !482, file: !3, line: 207, column: 6)
!487 = !DILocation(line: 207, column: 24, scope: !486)
!488 = !DILocation(line: 207, column: 23, scope: !486)
!489 = !DILocation(line: 207, column: 6, scope: !482)
!490 = !DILocation(line: 208, column: 39, scope: !491)
!491 = distinct !DILexicalBlock(scope: !486, file: !3, line: 208, column: 11)
!492 = !DILocation(line: 208, column: 11, scope: !491)
!493 = !DILocation(line: 208, column: 48, scope: !491)
!494 = !DILocation(line: 208, column: 11, scope: !486)
!495 = !DILocation(line: 209, column: 15, scope: !496)
!496 = distinct !DILexicalBlock(scope: !491, file: !3, line: 208, column: 54)
!497 = !DILocation(line: 209, column: 8, scope: !496)
!498 = !DILocation(line: 210, column: 8, scope: !496)
!499 = !DILocation(line: 208, column: 51, scope: !491)
!500 = !DILocation(line: 207, column: 30, scope: !486)
!501 = !DILocation(line: 207, column: 6, scope: !486)
!502 = distinct !{!502, !489, !503}
!503 = !DILocation(line: 211, column: 7, scope: !482)
!504 = !DILocation(line: 212, column: 5, scope: !447)
!505 = !DILocation(line: 198, column: 42, scope: !440)
!506 = !DILocation(line: 198, column: 5, scope: !440)
!507 = distinct !{!507, !444, !508}
!508 = !DILocation(line: 212, column: 5, scope: !436)
!509 = !DILocation(line: 214, column: 12, scope: !300)
!510 = !DILocation(line: 214, column: 5, scope: !300)
!511 = !DILocation(line: 215, column: 5, scope: !300)
!512 = !DILocation(line: 216, column: 1, scope: !300)
!513 = distinct !DISubprogram(name: "convolution", scope: !3, file: !3, line: 219, type: !514, scopeLine: 222, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !13, retainedNodes: !14)
!514 = !DISubroutineType(types: !515)
!515 = !{null, !306, !30, !516, !7, !7, !7, !518}
!516 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !517, size: 64)
!517 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !28)
!518 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !303)
!519 = !DILocalVariable(name: "in", arg: 1, scope: !513, file: !3, line: 219, type: !306)
!520 = !DILocation(line: 219, column: 33, scope: !513)
!521 = !DILocalVariable(name: "out", arg: 2, scope: !513, file: !3, line: 219, type: !30)
!522 = !DILocation(line: 219, column: 46, scope: !513)
!523 = !DILocalVariable(name: "kernel", arg: 3, scope: !513, file: !3, line: 219, type: !516)
!524 = !DILocation(line: 219, column: 64, scope: !513)
!525 = !DILocalVariable(name: "nx", arg: 4, scope: !513, file: !3, line: 220, type: !7)
!526 = !DILocation(line: 220, column: 28, scope: !513)
!527 = !DILocalVariable(name: "ny", arg: 5, scope: !513, file: !3, line: 220, type: !7)
!528 = !DILocation(line: 220, column: 42, scope: !513)
!529 = !DILocalVariable(name: "kn", arg: 6, scope: !513, file: !3, line: 220, type: !7)
!530 = !DILocation(line: 220, column: 56, scope: !513)
!531 = !DILocalVariable(name: "normalize", arg: 7, scope: !513, file: !3, line: 221, type: !518)
!532 = !DILocation(line: 221, column: 29, scope: !513)
!533 = !DILocation(line: 223, column: 5, scope: !534)
!534 = distinct !DILexicalBlock(scope: !535, file: !3, line: 223, column: 5)
!535 = distinct !DILexicalBlock(scope: !513, file: !3, line: 223, column: 5)
!536 = !DILocation(line: 223, column: 5, scope: !535)
!537 = !DILocation(line: 224, column: 5, scope: !538)
!538 = distinct !DILexicalBlock(scope: !539, file: !3, line: 224, column: 5)
!539 = distinct !DILexicalBlock(scope: !513, file: !3, line: 224, column: 5)
!540 = !DILocation(line: 224, column: 5, scope: !539)
!541 = !DILocalVariable(name: "khalf", scope: !513, file: !3, line: 225, type: !7)
!542 = !DILocation(line: 225, column: 15, scope: !513)
!543 = !DILocation(line: 225, column: 23, scope: !513)
!544 = !DILocation(line: 225, column: 26, scope: !513)
!545 = !DILocalVariable(name: "min", scope: !513, file: !3, line: 226, type: !28)
!546 = !DILocation(line: 226, column: 11, scope: !513)
!547 = !DILocalVariable(name: "max", scope: !513, file: !3, line: 226, type: !28)
!548 = !DILocation(line: 226, column: 26, scope: !513)
!549 = !DILocation(line: 228, column: 9, scope: !550)
!550 = distinct !DILexicalBlock(scope: !513, file: !3, line: 228, column: 9)
!551 = !DILocation(line: 228, column: 9, scope: !513)
!552 = !DILocalVariable(name: "m", scope: !553, file: !3, line: 229, type: !6)
!553 = distinct !DILexicalBlock(scope: !550, file: !3, line: 229, column: 9)
!554 = !DILocation(line: 229, column: 18, scope: !553)
!555 = !DILocation(line: 229, column: 22, scope: !553)
!556 = !DILocation(line: 229, column: 14, scope: !553)
!557 = !DILocation(line: 229, column: 29, scope: !558)
!558 = distinct !DILexicalBlock(scope: !553, file: !3, line: 229, column: 9)
!559 = !DILocation(line: 229, column: 33, scope: !558)
!560 = !DILocation(line: 229, column: 38, scope: !558)
!561 = !DILocation(line: 229, column: 36, scope: !558)
!562 = !DILocation(line: 229, column: 31, scope: !558)
!563 = !DILocation(line: 229, column: 9, scope: !553)
!564 = !DILocalVariable(name: "n", scope: !565, file: !3, line: 230, type: !6)
!565 = distinct !DILexicalBlock(scope: !558, file: !3, line: 230, column: 13)
!566 = !DILocation(line: 230, column: 22, scope: !565)
!567 = !DILocation(line: 230, column: 26, scope: !565)
!568 = !DILocation(line: 230, column: 18, scope: !565)
!569 = !DILocation(line: 230, column: 33, scope: !570)
!570 = distinct !DILexicalBlock(scope: !565, file: !3, line: 230, column: 13)
!571 = !DILocation(line: 230, column: 37, scope: !570)
!572 = !DILocation(line: 230, column: 42, scope: !570)
!573 = !DILocation(line: 230, column: 40, scope: !570)
!574 = !DILocation(line: 230, column: 35, scope: !570)
!575 = !DILocation(line: 230, column: 13, scope: !565)
!576 = !DILocalVariable(name: "pixel", scope: !577, file: !3, line: 231, type: !28)
!577 = distinct !DILexicalBlock(scope: !570, file: !3, line: 230, column: 54)
!578 = !DILocation(line: 231, column: 23, scope: !577)
!579 = !DILocalVariable(name: "c", scope: !577, file: !3, line: 232, type: !115)
!580 = !DILocation(line: 232, column: 24, scope: !577)
!581 = !DILocalVariable(name: "j", scope: !582, file: !3, line: 233, type: !6)
!582 = distinct !DILexicalBlock(scope: !577, file: !3, line: 233, column: 17)
!583 = !DILocation(line: 233, column: 26, scope: !582)
!584 = !DILocation(line: 233, column: 31, scope: !582)
!585 = !DILocation(line: 233, column: 30, scope: !582)
!586 = !DILocation(line: 233, column: 22, scope: !582)
!587 = !DILocation(line: 233, column: 38, scope: !588)
!588 = distinct !DILexicalBlock(scope: !582, file: !3, line: 233, column: 17)
!589 = !DILocation(line: 233, column: 43, scope: !588)
!590 = !DILocation(line: 233, column: 40, scope: !588)
!591 = !DILocation(line: 233, column: 17, scope: !582)
!592 = !DILocalVariable(name: "i", scope: !593, file: !3, line: 234, type: !6)
!593 = distinct !DILexicalBlock(scope: !588, file: !3, line: 234, column: 21)
!594 = !DILocation(line: 234, column: 30, scope: !593)
!595 = !DILocation(line: 234, column: 35, scope: !593)
!596 = !DILocation(line: 234, column: 34, scope: !593)
!597 = !DILocation(line: 234, column: 26, scope: !593)
!598 = !DILocation(line: 234, column: 42, scope: !599)
!599 = distinct !DILexicalBlock(scope: !593, file: !3, line: 234, column: 21)
!600 = !DILocation(line: 234, column: 47, scope: !599)
!601 = !DILocation(line: 234, column: 44, scope: !599)
!602 = !DILocation(line: 234, column: 21, scope: !593)
!603 = !DILocation(line: 235, column: 34, scope: !604)
!604 = distinct !DILexicalBlock(scope: !599, file: !3, line: 234, column: 59)
!605 = !DILocation(line: 235, column: 38, scope: !604)
!606 = !DILocation(line: 235, column: 42, scope: !604)
!607 = !DILocation(line: 235, column: 40, scope: !604)
!608 = !DILocation(line: 235, column: 47, scope: !604)
!609 = !DILocation(line: 235, column: 45, scope: !604)
!610 = !DILocation(line: 235, column: 52, scope: !604)
!611 = !DILocation(line: 235, column: 50, scope: !604)
!612 = !DILocation(line: 235, column: 56, scope: !604)
!613 = !DILocation(line: 235, column: 54, scope: !604)
!614 = !DILocation(line: 235, column: 61, scope: !604)
!615 = !DILocation(line: 235, column: 68, scope: !604)
!616 = !DILocation(line: 235, column: 59, scope: !604)
!617 = !DILocation(line: 235, column: 31, scope: !604)
!618 = !DILocation(line: 236, column: 26, scope: !604)
!619 = !DILocation(line: 237, column: 21, scope: !604)
!620 = !DILocation(line: 234, column: 55, scope: !599)
!621 = !DILocation(line: 234, column: 21, scope: !599)
!622 = distinct !{!622, !602, !623}
!623 = !DILocation(line: 237, column: 21, scope: !593)
!624 = !DILocation(line: 233, column: 51, scope: !588)
!625 = !DILocation(line: 233, column: 17, scope: !588)
!626 = distinct !{!626, !591, !627}
!627 = !DILocation(line: 237, column: 21, scope: !582)
!628 = !DILocation(line: 238, column: 21, scope: !629)
!629 = distinct !DILexicalBlock(scope: !577, file: !3, line: 238, column: 21)
!630 = !DILocation(line: 238, column: 29, scope: !629)
!631 = !DILocation(line: 238, column: 27, scope: !629)
!632 = !DILocation(line: 238, column: 21, scope: !577)
!633 = !DILocation(line: 239, column: 27, scope: !629)
!634 = !DILocation(line: 239, column: 25, scope: !629)
!635 = !DILocation(line: 239, column: 21, scope: !629)
!636 = !DILocation(line: 240, column: 21, scope: !637)
!637 = distinct !DILexicalBlock(scope: !577, file: !3, line: 240, column: 21)
!638 = !DILocation(line: 240, column: 29, scope: !637)
!639 = !DILocation(line: 240, column: 27, scope: !637)
!640 = !DILocation(line: 240, column: 21, scope: !577)
!641 = !DILocation(line: 241, column: 27, scope: !637)
!642 = !DILocation(line: 241, column: 25, scope: !637)
!643 = !DILocation(line: 241, column: 21, scope: !637)
!644 = !DILocation(line: 242, column: 17, scope: !577)
!645 = !DILocation(line: 230, column: 50, scope: !570)
!646 = !DILocation(line: 230, column: 13, scope: !570)
!647 = distinct !{!647, !575, !648}
!648 = !DILocation(line: 242, column: 17, scope: !565)
!649 = !DILocation(line: 229, column: 46, scope: !558)
!650 = !DILocation(line: 229, column: 9, scope: !558)
!651 = distinct !{!651, !563, !652}
!652 = !DILocation(line: 242, column: 17, scope: !553)
!653 = !DILocalVariable(name: "m", scope: !654, file: !3, line: 244, type: !6)
!654 = distinct !DILexicalBlock(scope: !513, file: !3, line: 244, column: 5)
!655 = !DILocation(line: 244, column: 14, scope: !654)
!656 = !DILocation(line: 244, column: 18, scope: !654)
!657 = !DILocation(line: 244, column: 10, scope: !654)
!658 = !DILocation(line: 244, column: 25, scope: !659)
!659 = distinct !DILexicalBlock(scope: !654, file: !3, line: 244, column: 5)
!660 = !DILocation(line: 244, column: 29, scope: !659)
!661 = !DILocation(line: 244, column: 34, scope: !659)
!662 = !DILocation(line: 244, column: 32, scope: !659)
!663 = !DILocation(line: 244, column: 27, scope: !659)
!664 = !DILocation(line: 244, column: 5, scope: !654)
!665 = !DILocalVariable(name: "n", scope: !666, file: !3, line: 245, type: !6)
!666 = distinct !DILexicalBlock(scope: !659, file: !3, line: 245, column: 9)
!667 = !DILocation(line: 245, column: 18, scope: !666)
!668 = !DILocation(line: 245, column: 22, scope: !666)
!669 = !DILocation(line: 245, column: 14, scope: !666)
!670 = !DILocation(line: 245, column: 29, scope: !671)
!671 = distinct !DILexicalBlock(scope: !666, file: !3, line: 245, column: 9)
!672 = !DILocation(line: 245, column: 33, scope: !671)
!673 = !DILocation(line: 245, column: 38, scope: !671)
!674 = !DILocation(line: 245, column: 36, scope: !671)
!675 = !DILocation(line: 245, column: 31, scope: !671)
!676 = !DILocation(line: 245, column: 9, scope: !666)
!677 = !DILocalVariable(name: "pixel", scope: !678, file: !3, line: 246, type: !28)
!678 = distinct !DILexicalBlock(scope: !671, file: !3, line: 245, column: 50)
!679 = !DILocation(line: 246, column: 19, scope: !678)
!680 = !DILocalVariable(name: "c", scope: !678, file: !3, line: 247, type: !115)
!681 = !DILocation(line: 247, column: 20, scope: !678)
!682 = !DILocalVariable(name: "j", scope: !683, file: !3, line: 248, type: !6)
!683 = distinct !DILexicalBlock(scope: !678, file: !3, line: 248, column: 13)
!684 = !DILocation(line: 248, column: 22, scope: !683)
!685 = !DILocation(line: 248, column: 27, scope: !683)
!686 = !DILocation(line: 248, column: 26, scope: !683)
!687 = !DILocation(line: 248, column: 18, scope: !683)
!688 = !DILocation(line: 248, column: 34, scope: !689)
!689 = distinct !DILexicalBlock(scope: !683, file: !3, line: 248, column: 13)
!690 = !DILocation(line: 248, column: 39, scope: !689)
!691 = !DILocation(line: 248, column: 36, scope: !689)
!692 = !DILocation(line: 248, column: 13, scope: !683)
!693 = !DILocalVariable(name: "i", scope: !694, file: !3, line: 249, type: !6)
!694 = distinct !DILexicalBlock(scope: !689, file: !3, line: 249, column: 17)
!695 = !DILocation(line: 249, column: 26, scope: !694)
!696 = !DILocation(line: 249, column: 31, scope: !694)
!697 = !DILocation(line: 249, column: 30, scope: !694)
!698 = !DILocation(line: 249, column: 22, scope: !694)
!699 = !DILocation(line: 249, column: 38, scope: !700)
!700 = distinct !DILexicalBlock(scope: !694, file: !3, line: 249, column: 17)
!701 = !DILocation(line: 249, column: 43, scope: !700)
!702 = !DILocation(line: 249, column: 40, scope: !700)
!703 = !DILocation(line: 249, column: 17, scope: !694)
!704 = !DILocation(line: 250, column: 30, scope: !705)
!705 = distinct !DILexicalBlock(scope: !700, file: !3, line: 249, column: 55)
!706 = !DILocation(line: 250, column: 34, scope: !705)
!707 = !DILocation(line: 250, column: 38, scope: !705)
!708 = !DILocation(line: 250, column: 36, scope: !705)
!709 = !DILocation(line: 250, column: 43, scope: !705)
!710 = !DILocation(line: 250, column: 41, scope: !705)
!711 = !DILocation(line: 250, column: 48, scope: !705)
!712 = !DILocation(line: 250, column: 46, scope: !705)
!713 = !DILocation(line: 250, column: 52, scope: !705)
!714 = !DILocation(line: 250, column: 50, scope: !705)
!715 = !DILocation(line: 250, column: 57, scope: !705)
!716 = !DILocation(line: 250, column: 64, scope: !705)
!717 = !DILocation(line: 250, column: 55, scope: !705)
!718 = !DILocation(line: 250, column: 27, scope: !705)
!719 = !DILocation(line: 251, column: 22, scope: !705)
!720 = !DILocation(line: 252, column: 17, scope: !705)
!721 = !DILocation(line: 249, column: 51, scope: !700)
!722 = !DILocation(line: 249, column: 17, scope: !700)
!723 = distinct !{!723, !703, !724}
!724 = !DILocation(line: 252, column: 17, scope: !694)
!725 = !DILocation(line: 248, column: 47, scope: !689)
!726 = !DILocation(line: 248, column: 13, scope: !689)
!727 = distinct !{!727, !692, !728}
!728 = !DILocation(line: 252, column: 17, scope: !683)
!729 = !DILocation(line: 254, column: 17, scope: !730)
!730 = distinct !DILexicalBlock(scope: !678, file: !3, line: 254, column: 17)
!731 = !DILocation(line: 254, column: 17, scope: !678)
!732 = !DILocation(line: 255, column: 43, scope: !730)
!733 = !DILocation(line: 255, column: 51, scope: !730)
!734 = !DILocation(line: 255, column: 49, scope: !730)
!735 = !DILocation(line: 255, column: 40, scope: !730)
!736 = !DILocation(line: 255, column: 59, scope: !730)
!737 = !DILocation(line: 255, column: 65, scope: !730)
!738 = !DILocation(line: 255, column: 63, scope: !730)
!739 = !DILocation(line: 255, column: 56, scope: !730)
!740 = !DILocation(line: 255, column: 23, scope: !730)
!741 = !DILocation(line: 255, column: 17, scope: !730)
!742 = !DILocation(line: 256, column: 40, scope: !678)
!743 = !DILocation(line: 256, column: 31, scope: !678)
!744 = !DILocation(line: 256, column: 13, scope: !678)
!745 = !DILocation(line: 256, column: 17, scope: !678)
!746 = !DILocation(line: 256, column: 21, scope: !678)
!747 = !DILocation(line: 256, column: 19, scope: !678)
!748 = !DILocation(line: 256, column: 26, scope: !678)
!749 = !DILocation(line: 256, column: 24, scope: !678)
!750 = !DILocation(line: 256, column: 29, scope: !678)
!751 = !DILocation(line: 257, column: 9, scope: !678)
!752 = !DILocation(line: 245, column: 46, scope: !671)
!753 = !DILocation(line: 245, column: 9, scope: !671)
!754 = distinct !{!754, !676, !755}
!755 = !DILocation(line: 257, column: 9, scope: !666)
!756 = !DILocation(line: 244, column: 42, scope: !659)
!757 = !DILocation(line: 244, column: 5, scope: !659)
!758 = distinct !{!758, !664, !759}
!759 = !DILocation(line: 257, column: 9, scope: !654)
!760 = !DILocation(line: 258, column: 1, scope: !513)
!761 = distinct !DISubprogram(name: "gaussian_filter", scope: !3, file: !3, line: 272, type: !762, scopeLine: 274, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !13, retainedNodes: !14)
!762 = !DISubroutineType(types: !763)
!763 = !{null, !306, !30, !7, !7, !517}
!764 = !DILocalVariable(name: "in", arg: 1, scope: !761, file: !3, line: 272, type: !306)
!765 = !DILocation(line: 272, column: 37, scope: !761)
!766 = !DILocalVariable(name: "out", arg: 2, scope: !761, file: !3, line: 272, type: !30)
!767 = !DILocation(line: 272, column: 50, scope: !761)
!768 = !DILocalVariable(name: "nx", arg: 3, scope: !761, file: !3, line: 273, type: !7)
!769 = !DILocation(line: 273, column: 32, scope: !761)
!770 = !DILocalVariable(name: "ny", arg: 4, scope: !761, file: !3, line: 273, type: !7)
!771 = !DILocation(line: 273, column: 46, scope: !761)
!772 = !DILocalVariable(name: "sigma", arg: 5, scope: !761, file: !3, line: 273, type: !517)
!773 = !DILocation(line: 273, column: 62, scope: !761)
!774 = !DILocalVariable(name: "n", scope: !761, file: !3, line: 275, type: !7)
!775 = !DILocation(line: 275, column: 15, scope: !761)
!776 = !DILocation(line: 275, column: 33, scope: !761)
!777 = !DILocation(line: 275, column: 31, scope: !761)
!778 = !DILocation(line: 275, column: 23, scope: !761)
!779 = !DILocation(line: 275, column: 21, scope: !761)
!780 = !DILocation(line: 275, column: 40, scope: !761)
!781 = !DILocalVariable(name: "mean", scope: !761, file: !3, line: 276, type: !517)
!782 = !DILocation(line: 276, column: 17, scope: !761)
!783 = !DILocation(line: 276, column: 37, scope: !761)
!784 = !DILocation(line: 276, column: 39, scope: !761)
!785 = !DILocation(line: 276, column: 31, scope: !761)
!786 = !DILocation(line: 276, column: 24, scope: !761)
!787 = !DILocation(line: 277, column: 18, scope: !761)
!788 = !DILocation(line: 277, column: 22, scope: !761)
!789 = !DILocation(line: 277, column: 20, scope: !761)
!790 = !DILocation(line: 277, column: 5, scope: !761)
!791 = !DILocalVariable(name: "__vla_expr0", scope: !761, type: !117, flags: DIFlagArtificial)
!792 = !DILocation(line: 0, scope: !761)
!793 = !DILocalVariable(name: "kernel", scope: !761, file: !3, line: 277, type: !794)
!794 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, elements: !795)
!795 = !{!796}
!796 = !DISubrange(count: !791)
!797 = !DILocation(line: 277, column: 11, scope: !761)
!798 = !DILocation(line: 279, column: 13, scope: !761)
!799 = !DILocation(line: 280, column: 13, scope: !761)
!800 = !DILocation(line: 280, column: 16, scope: !761)
!801 = !DILocation(line: 279, column: 5, scope: !761)
!802 = !DILocalVariable(name: "c", scope: !761, file: !3, line: 281, type: !115)
!803 = !DILocation(line: 281, column: 12, scope: !761)
!804 = !DILocalVariable(name: "i", scope: !805, file: !3, line: 282, type: !6)
!805 = distinct !DILexicalBlock(scope: !761, file: !3, line: 282, column: 5)
!806 = !DILocation(line: 282, column: 14, scope: !805)
!807 = !DILocation(line: 282, column: 10, scope: !805)
!808 = !DILocation(line: 282, column: 21, scope: !809)
!809 = distinct !DILexicalBlock(scope: !805, file: !3, line: 282, column: 5)
!810 = !DILocation(line: 282, column: 25, scope: !809)
!811 = !DILocation(line: 282, column: 23, scope: !809)
!812 = !DILocation(line: 282, column: 5, scope: !805)
!813 = !DILocalVariable(name: "j", scope: !814, file: !3, line: 283, type: !6)
!814 = distinct !DILexicalBlock(scope: !809, file: !3, line: 283, column: 9)
!815 = !DILocation(line: 283, column: 18, scope: !814)
!816 = !DILocation(line: 283, column: 14, scope: !814)
!817 = !DILocation(line: 283, column: 25, scope: !818)
!818 = distinct !DILexicalBlock(scope: !814, file: !3, line: 283, column: 9)
!819 = !DILocation(line: 283, column: 29, scope: !818)
!820 = !DILocation(line: 283, column: 27, scope: !818)
!821 = !DILocation(line: 283, column: 9, scope: !814)
!822 = !DILocation(line: 284, column: 42, scope: !823)
!823 = distinct !DILexicalBlock(scope: !818, file: !3, line: 283, column: 37)
!824 = !DILocation(line: 284, column: 46, scope: !823)
!825 = !DILocation(line: 284, column: 44, scope: !823)
!826 = !DILocation(line: 284, column: 54, scope: !823)
!827 = !DILocation(line: 284, column: 52, scope: !823)
!828 = !DILocation(line: 284, column: 41, scope: !823)
!829 = !DILocation(line: 284, column: 37, scope: !823)
!830 = !DILocation(line: 285, column: 42, scope: !823)
!831 = !DILocation(line: 285, column: 46, scope: !823)
!832 = !DILocation(line: 285, column: 44, scope: !823)
!833 = !DILocation(line: 285, column: 54, scope: !823)
!834 = !DILocation(line: 285, column: 52, scope: !823)
!835 = !DILocation(line: 285, column: 41, scope: !823)
!836 = !DILocation(line: 285, column: 37, scope: !823)
!837 = !DILocation(line: 284, column: 66, scope: !823)
!838 = !DILocation(line: 284, column: 34, scope: !823)
!839 = !DILocation(line: 284, column: 25, scope: !823)
!840 = !DILocation(line: 286, column: 39, scope: !823)
!841 = !DILocation(line: 286, column: 37, scope: !823)
!842 = !DILocation(line: 286, column: 47, scope: !823)
!843 = !DILocation(line: 286, column: 45, scope: !823)
!844 = !DILocation(line: 286, column: 25, scope: !823)
!845 = !DILocation(line: 284, column: 20, scope: !823)
!846 = !DILocation(line: 284, column: 13, scope: !823)
!847 = !DILocation(line: 284, column: 23, scope: !823)
!848 = !DILocation(line: 287, column: 14, scope: !823)
!849 = !DILocation(line: 288, column: 9, scope: !823)
!850 = !DILocation(line: 283, column: 33, scope: !818)
!851 = !DILocation(line: 283, column: 9, scope: !818)
!852 = distinct !{!852, !821, !853}
!853 = !DILocation(line: 288, column: 9, scope: !814)
!854 = !DILocation(line: 282, column: 29, scope: !809)
!855 = !DILocation(line: 282, column: 5, scope: !809)
!856 = distinct !{!856, !812, !857}
!857 = !DILocation(line: 288, column: 9, scope: !805)
!858 = !DILocation(line: 290, column: 17, scope: !761)
!859 = !DILocation(line: 290, column: 21, scope: !761)
!860 = !DILocation(line: 290, column: 34, scope: !761)
!861 = !DILocation(line: 290, column: 38, scope: !761)
!862 = !DILocation(line: 290, column: 42, scope: !761)
!863 = !DILocation(line: 290, column: 5, scope: !761)
!864 = !DILocation(line: 291, column: 1, scope: !761)
!865 = distinct !DISubprogram(name: "canny_edge_detection", scope: !3, file: !3, line: 302, type: !866, scopeLine: 306, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !13, retainedNodes: !14)
!866 = !DISubroutineType(types: !867)
!867 = !{!30, !306, !304, !7, !7, !517}
!868 = !DILocalVariable(name: "in", arg: 1, scope: !865, file: !3, line: 302, type: !306)
!869 = !DILocation(line: 302, column: 46, scope: !865)
!870 = !DILocalVariable(name: "bmp_ih", arg: 2, scope: !865, file: !3, line: 303, type: !304)
!871 = !DILocation(line: 303, column: 59, scope: !865)
!872 = !DILocalVariable(name: "tmin", arg: 3, scope: !865, file: !3, line: 304, type: !7)
!873 = !DILocation(line: 304, column: 41, scope: !865)
!874 = !DILocalVariable(name: "tmax", arg: 4, scope: !865, file: !3, line: 304, type: !7)
!875 = !DILocation(line: 304, column: 57, scope: !865)
!876 = !DILocalVariable(name: "sigma", arg: 5, scope: !865, file: !3, line: 305, type: !517)
!877 = !DILocation(line: 305, column: 43, scope: !865)
!878 = !DILocalVariable(name: "nx", scope: !865, file: !3, line: 307, type: !7)
!879 = !DILocation(line: 307, column: 15, scope: !865)
!880 = !DILocation(line: 307, column: 20, scope: !865)
!881 = !DILocation(line: 307, column: 28, scope: !865)
!882 = !DILocalVariable(name: "ny", scope: !865, file: !3, line: 308, type: !7)
!883 = !DILocation(line: 308, column: 15, scope: !865)
!884 = !DILocation(line: 308, column: 20, scope: !865)
!885 = !DILocation(line: 308, column: 28, scope: !865)
!886 = !DILocalVariable(name: "G", scope: !865, file: !3, line: 310, type: !30)
!887 = !DILocation(line: 310, column: 14, scope: !865)
!888 = !DILocation(line: 310, column: 25, scope: !865)
!889 = !DILocation(line: 310, column: 30, scope: !865)
!890 = !DILocation(line: 310, column: 28, scope: !865)
!891 = !DILocation(line: 310, column: 33, scope: !865)
!892 = !DILocation(line: 310, column: 18, scope: !865)
!893 = !DILocalVariable(name: "after_Gx", scope: !865, file: !3, line: 311, type: !30)
!894 = !DILocation(line: 311, column: 14, scope: !865)
!895 = !DILocation(line: 311, column: 32, scope: !865)
!896 = !DILocation(line: 311, column: 37, scope: !865)
!897 = !DILocation(line: 311, column: 35, scope: !865)
!898 = !DILocation(line: 311, column: 40, scope: !865)
!899 = !DILocation(line: 311, column: 25, scope: !865)
!900 = !DILocalVariable(name: "after_Gy", scope: !865, file: !3, line: 312, type: !30)
!901 = !DILocation(line: 312, column: 14, scope: !865)
!902 = !DILocation(line: 312, column: 32, scope: !865)
!903 = !DILocation(line: 312, column: 37, scope: !865)
!904 = !DILocation(line: 312, column: 35, scope: !865)
!905 = !DILocation(line: 312, column: 40, scope: !865)
!906 = !DILocation(line: 312, column: 25, scope: !865)
!907 = !DILocalVariable(name: "nms", scope: !865, file: !3, line: 313, type: !30)
!908 = !DILocation(line: 313, column: 14, scope: !865)
!909 = !DILocation(line: 313, column: 27, scope: !865)
!910 = !DILocation(line: 313, column: 32, scope: !865)
!911 = !DILocation(line: 313, column: 30, scope: !865)
!912 = !DILocation(line: 313, column: 35, scope: !865)
!913 = !DILocation(line: 313, column: 20, scope: !865)
!914 = !DILocalVariable(name: "out", scope: !865, file: !3, line: 314, type: !30)
!915 = !DILocation(line: 314, column: 14, scope: !865)
!916 = !DILocation(line: 314, column: 27, scope: !865)
!917 = !DILocation(line: 314, column: 35, scope: !865)
!918 = !DILocation(line: 314, column: 46, scope: !865)
!919 = !DILocation(line: 314, column: 20, scope: !865)
!920 = !DILocation(line: 316, column: 9, scope: !921)
!921 = distinct !DILexicalBlock(scope: !865, file: !3, line: 316, column: 9)
!922 = !DILocation(line: 316, column: 11, scope: !921)
!923 = !DILocation(line: 316, column: 19, scope: !921)
!924 = !DILocation(line: 316, column: 22, scope: !921)
!925 = !DILocation(line: 316, column: 31, scope: !921)
!926 = !DILocation(line: 316, column: 39, scope: !921)
!927 = !DILocation(line: 316, column: 42, scope: !921)
!928 = !DILocation(line: 316, column: 51, scope: !921)
!929 = !DILocation(line: 316, column: 59, scope: !921)
!930 = !DILocation(line: 317, column: 9, scope: !921)
!931 = !DILocation(line: 317, column: 13, scope: !921)
!932 = !DILocation(line: 317, column: 21, scope: !921)
!933 = !DILocation(line: 317, column: 24, scope: !921)
!934 = !DILocation(line: 317, column: 28, scope: !921)
!935 = !DILocation(line: 316, column: 9, scope: !865)
!936 = !DILocation(line: 318, column: 17, scope: !937)
!937 = distinct !DILexicalBlock(scope: !921, file: !3, line: 317, column: 37)
!938 = !DILocation(line: 318, column: 9, scope: !937)
!939 = !DILocation(line: 320, column: 9, scope: !937)
!940 = !DILocation(line: 323, column: 21, scope: !865)
!941 = !DILocation(line: 323, column: 25, scope: !865)
!942 = !DILocation(line: 323, column: 30, scope: !865)
!943 = !DILocation(line: 323, column: 34, scope: !865)
!944 = !DILocation(line: 323, column: 38, scope: !865)
!945 = !DILocation(line: 323, column: 5, scope: !865)
!946 = !DILocalVariable(name: "Gx", scope: !865, file: !3, line: 325, type: !947)
!947 = !DICompositeType(tag: DW_TAG_array_type, baseType: !517, size: 288, elements: !948)
!948 = !{!949}
!949 = !DISubrange(count: 9)
!950 = !DILocation(line: 325, column: 17, scope: !865)
!951 = !DILocation(line: 329, column: 17, scope: !865)
!952 = !DILocation(line: 329, column: 22, scope: !865)
!953 = !DILocation(line: 329, column: 32, scope: !865)
!954 = !DILocation(line: 329, column: 36, scope: !865)
!955 = !DILocation(line: 329, column: 40, scope: !865)
!956 = !DILocation(line: 329, column: 5, scope: !865)
!957 = !DILocalVariable(name: "Gy", scope: !865, file: !3, line: 331, type: !947)
!958 = !DILocation(line: 331, column: 17, scope: !865)
!959 = !DILocation(line: 335, column: 17, scope: !865)
!960 = !DILocation(line: 335, column: 22, scope: !865)
!961 = !DILocation(line: 335, column: 32, scope: !865)
!962 = !DILocation(line: 335, column: 36, scope: !865)
!963 = !DILocation(line: 335, column: 40, scope: !865)
!964 = !DILocation(line: 335, column: 5, scope: !865)
!965 = !DILocalVariable(name: "i", scope: !966, file: !3, line: 337, type: !6)
!966 = distinct !DILexicalBlock(scope: !865, file: !3, line: 337, column: 5)
!967 = !DILocation(line: 337, column: 14, scope: !966)
!968 = !DILocation(line: 337, column: 10, scope: !966)
!969 = !DILocation(line: 337, column: 21, scope: !970)
!970 = distinct !DILexicalBlock(scope: !966, file: !3, line: 337, column: 5)
!971 = !DILocation(line: 337, column: 25, scope: !970)
!972 = !DILocation(line: 337, column: 28, scope: !970)
!973 = !DILocation(line: 337, column: 23, scope: !970)
!974 = !DILocation(line: 337, column: 5, scope: !966)
!975 = !DILocalVariable(name: "j", scope: !976, file: !3, line: 338, type: !6)
!976 = distinct !DILexicalBlock(scope: !970, file: !3, line: 338, column: 9)
!977 = !DILocation(line: 338, column: 18, scope: !976)
!978 = !DILocation(line: 338, column: 14, scope: !976)
!979 = !DILocation(line: 338, column: 25, scope: !980)
!980 = distinct !DILexicalBlock(scope: !976, file: !3, line: 338, column: 9)
!981 = !DILocation(line: 338, column: 29, scope: !980)
!982 = !DILocation(line: 338, column: 32, scope: !980)
!983 = !DILocation(line: 338, column: 27, scope: !980)
!984 = !DILocation(line: 338, column: 9, scope: !976)
!985 = !DILocalVariable(name: "c", scope: !986, file: !3, line: 339, type: !7)
!986 = distinct !DILexicalBlock(scope: !980, file: !3, line: 338, column: 42)
!987 = !DILocation(line: 339, column: 23, scope: !986)
!988 = !DILocation(line: 339, column: 27, scope: !986)
!989 = !DILocation(line: 339, column: 31, scope: !986)
!990 = !DILocation(line: 339, column: 36, scope: !986)
!991 = !DILocation(line: 339, column: 34, scope: !986)
!992 = !DILocation(line: 339, column: 29, scope: !986)
!993 = !DILocation(line: 341, column: 35, scope: !986)
!994 = !DILocation(line: 341, column: 44, scope: !986)
!995 = !DILocation(line: 341, column: 48, scope: !986)
!996 = !DILocation(line: 341, column: 57, scope: !986)
!997 = !DILocation(line: 341, column: 29, scope: !986)
!998 = !DILocation(line: 341, column: 20, scope: !986)
!999 = !DILocation(line: 341, column: 13, scope: !986)
!1000 = !DILocation(line: 341, column: 15, scope: !986)
!1001 = !DILocation(line: 341, column: 18, scope: !986)
!1002 = !DILocation(line: 342, column: 9, scope: !986)
!1003 = !DILocation(line: 338, column: 38, scope: !980)
!1004 = !DILocation(line: 338, column: 9, scope: !980)
!1005 = distinct !{!1005, !984, !1006}
!1006 = !DILocation(line: 342, column: 9, scope: !976)
!1007 = !DILocation(line: 337, column: 34, scope: !970)
!1008 = !DILocation(line: 337, column: 5, scope: !970)
!1009 = distinct !{!1009, !974, !1010}
!1010 = !DILocation(line: 342, column: 9, scope: !966)
!1011 = !DILocalVariable(name: "i", scope: !1012, file: !3, line: 345, type: !6)
!1012 = distinct !DILexicalBlock(scope: !865, file: !3, line: 345, column: 5)
!1013 = !DILocation(line: 345, column: 14, scope: !1012)
!1014 = !DILocation(line: 345, column: 10, scope: !1012)
!1015 = !DILocation(line: 345, column: 21, scope: !1016)
!1016 = distinct !DILexicalBlock(scope: !1012, file: !3, line: 345, column: 5)
!1017 = !DILocation(line: 345, column: 25, scope: !1016)
!1018 = !DILocation(line: 345, column: 28, scope: !1016)
!1019 = !DILocation(line: 345, column: 23, scope: !1016)
!1020 = !DILocation(line: 345, column: 5, scope: !1012)
!1021 = !DILocalVariable(name: "j", scope: !1022, file: !3, line: 346, type: !6)
!1022 = distinct !DILexicalBlock(scope: !1016, file: !3, line: 346, column: 9)
!1023 = !DILocation(line: 346, column: 18, scope: !1022)
!1024 = !DILocation(line: 346, column: 14, scope: !1022)
!1025 = !DILocation(line: 346, column: 25, scope: !1026)
!1026 = distinct !DILexicalBlock(scope: !1022, file: !3, line: 346, column: 9)
!1027 = !DILocation(line: 346, column: 29, scope: !1026)
!1028 = !DILocation(line: 346, column: 32, scope: !1026)
!1029 = !DILocation(line: 346, column: 27, scope: !1026)
!1030 = !DILocation(line: 346, column: 9, scope: !1022)
!1031 = !DILocalVariable(name: "c", scope: !1032, file: !3, line: 347, type: !7)
!1032 = distinct !DILexicalBlock(scope: !1026, file: !3, line: 346, column: 42)
!1033 = !DILocation(line: 347, column: 23, scope: !1032)
!1034 = !DILocation(line: 347, column: 27, scope: !1032)
!1035 = !DILocation(line: 347, column: 31, scope: !1032)
!1036 = !DILocation(line: 347, column: 36, scope: !1032)
!1037 = !DILocation(line: 347, column: 34, scope: !1032)
!1038 = !DILocation(line: 347, column: 29, scope: !1032)
!1039 = !DILocalVariable(name: "nn", scope: !1032, file: !3, line: 348, type: !7)
!1040 = !DILocation(line: 348, column: 23, scope: !1032)
!1041 = !DILocation(line: 348, column: 28, scope: !1032)
!1042 = !DILocation(line: 348, column: 32, scope: !1032)
!1043 = !DILocation(line: 348, column: 30, scope: !1032)
!1044 = !DILocalVariable(name: "ss", scope: !1032, file: !3, line: 349, type: !7)
!1045 = !DILocation(line: 349, column: 23, scope: !1032)
!1046 = !DILocation(line: 349, column: 28, scope: !1032)
!1047 = !DILocation(line: 349, column: 32, scope: !1032)
!1048 = !DILocation(line: 349, column: 30, scope: !1032)
!1049 = !DILocalVariable(name: "ww", scope: !1032, file: !3, line: 350, type: !7)
!1050 = !DILocation(line: 350, column: 23, scope: !1032)
!1051 = !DILocation(line: 350, column: 28, scope: !1032)
!1052 = !DILocation(line: 350, column: 30, scope: !1032)
!1053 = !DILocalVariable(name: "ee", scope: !1032, file: !3, line: 351, type: !7)
!1054 = !DILocation(line: 351, column: 23, scope: !1032)
!1055 = !DILocation(line: 351, column: 28, scope: !1032)
!1056 = !DILocation(line: 351, column: 30, scope: !1032)
!1057 = !DILocalVariable(name: "nw", scope: !1032, file: !3, line: 352, type: !7)
!1058 = !DILocation(line: 352, column: 23, scope: !1032)
!1059 = !DILocation(line: 352, column: 28, scope: !1032)
!1060 = !DILocation(line: 352, column: 31, scope: !1032)
!1061 = !DILocalVariable(name: "ne", scope: !1032, file: !3, line: 353, type: !7)
!1062 = !DILocation(line: 353, column: 23, scope: !1032)
!1063 = !DILocation(line: 353, column: 28, scope: !1032)
!1064 = !DILocation(line: 353, column: 31, scope: !1032)
!1065 = !DILocalVariable(name: "sw", scope: !1032, file: !3, line: 354, type: !7)
!1066 = !DILocation(line: 354, column: 23, scope: !1032)
!1067 = !DILocation(line: 354, column: 28, scope: !1032)
!1068 = !DILocation(line: 354, column: 31, scope: !1032)
!1069 = !DILocalVariable(name: "se", scope: !1032, file: !3, line: 355, type: !7)
!1070 = !DILocation(line: 355, column: 23, scope: !1032)
!1071 = !DILocation(line: 355, column: 28, scope: !1032)
!1072 = !DILocation(line: 355, column: 31, scope: !1032)
!1073 = !DILocalVariable(name: "dir", scope: !1032, file: !3, line: 357, type: !517)
!1074 = !DILocation(line: 357, column: 25, scope: !1032)
!1075 = !DILocation(line: 357, column: 50, scope: !1032)
!1076 = !DILocation(line: 357, column: 59, scope: !1032)
!1077 = !DILocation(line: 358, column: 50, scope: !1032)
!1078 = !DILocation(line: 358, column: 59, scope: !1032)
!1079 = !DILocation(line: 357, column: 44, scope: !1032)
!1080 = !DILocation(line: 358, column: 63, scope: !1032)
!1081 = !DILocation(line: 357, column: 39, scope: !1032)
!1082 = !DILocation(line: 359, column: 50, scope: !1032)
!1083 = !DILocation(line: 357, column: 31, scope: !1032)
!1084 = !DILocation(line: 359, column: 58, scope: !1032)
!1085 = !DILocation(line: 361, column: 19, scope: !1086)
!1086 = distinct !DILexicalBlock(scope: !1032, file: !3, line: 361, column: 17)
!1087 = !DILocation(line: 361, column: 23, scope: !1086)
!1088 = !DILocation(line: 361, column: 28, scope: !1086)
!1089 = !DILocation(line: 361, column: 31, scope: !1086)
!1090 = !DILocation(line: 361, column: 35, scope: !1086)
!1091 = !DILocation(line: 361, column: 40, scope: !1086)
!1092 = !DILocation(line: 361, column: 43, scope: !1086)
!1093 = !DILocation(line: 361, column: 45, scope: !1086)
!1094 = !DILocation(line: 361, column: 50, scope: !1086)
!1095 = !DILocation(line: 361, column: 52, scope: !1086)
!1096 = !DILocation(line: 361, column: 48, scope: !1086)
!1097 = !DILocation(line: 361, column: 56, scope: !1086)
!1098 = !DILocation(line: 362, column: 18, scope: !1086)
!1099 = !DILocation(line: 362, column: 20, scope: !1086)
!1100 = !DILocation(line: 362, column: 25, scope: !1086)
!1101 = !DILocation(line: 362, column: 27, scope: !1086)
!1102 = !DILocation(line: 362, column: 23, scope: !1086)
!1103 = !DILocation(line: 362, column: 32, scope: !1086)
!1104 = !DILocation(line: 363, column: 19, scope: !1086)
!1105 = !DILocation(line: 363, column: 23, scope: !1086)
!1106 = !DILocation(line: 363, column: 27, scope: !1086)
!1107 = !DILocation(line: 363, column: 30, scope: !1086)
!1108 = !DILocation(line: 363, column: 34, scope: !1086)
!1109 = !DILocation(line: 363, column: 40, scope: !1086)
!1110 = !DILocation(line: 363, column: 43, scope: !1086)
!1111 = !DILocation(line: 363, column: 45, scope: !1086)
!1112 = !DILocation(line: 363, column: 50, scope: !1086)
!1113 = !DILocation(line: 363, column: 52, scope: !1086)
!1114 = !DILocation(line: 363, column: 48, scope: !1086)
!1115 = !DILocation(line: 363, column: 56, scope: !1086)
!1116 = !DILocation(line: 364, column: 18, scope: !1086)
!1117 = !DILocation(line: 364, column: 20, scope: !1086)
!1118 = !DILocation(line: 364, column: 25, scope: !1086)
!1119 = !DILocation(line: 364, column: 27, scope: !1086)
!1120 = !DILocation(line: 364, column: 23, scope: !1086)
!1121 = !DILocation(line: 364, column: 32, scope: !1086)
!1122 = !DILocation(line: 365, column: 19, scope: !1086)
!1123 = !DILocation(line: 365, column: 23, scope: !1086)
!1124 = !DILocation(line: 365, column: 27, scope: !1086)
!1125 = !DILocation(line: 365, column: 30, scope: !1086)
!1126 = !DILocation(line: 365, column: 34, scope: !1086)
!1127 = !DILocation(line: 365, column: 40, scope: !1086)
!1128 = !DILocation(line: 365, column: 43, scope: !1086)
!1129 = !DILocation(line: 365, column: 45, scope: !1086)
!1130 = !DILocation(line: 365, column: 50, scope: !1086)
!1131 = !DILocation(line: 365, column: 52, scope: !1086)
!1132 = !DILocation(line: 365, column: 48, scope: !1086)
!1133 = !DILocation(line: 365, column: 56, scope: !1086)
!1134 = !DILocation(line: 366, column: 18, scope: !1086)
!1135 = !DILocation(line: 366, column: 20, scope: !1086)
!1136 = !DILocation(line: 366, column: 25, scope: !1086)
!1137 = !DILocation(line: 366, column: 27, scope: !1086)
!1138 = !DILocation(line: 366, column: 23, scope: !1086)
!1139 = !DILocation(line: 366, column: 32, scope: !1086)
!1140 = !DILocation(line: 367, column: 19, scope: !1086)
!1141 = !DILocation(line: 367, column: 23, scope: !1086)
!1142 = !DILocation(line: 367, column: 27, scope: !1086)
!1143 = !DILocation(line: 367, column: 30, scope: !1086)
!1144 = !DILocation(line: 367, column: 34, scope: !1086)
!1145 = !DILocation(line: 367, column: 40, scope: !1086)
!1146 = !DILocation(line: 367, column: 43, scope: !1086)
!1147 = !DILocation(line: 367, column: 45, scope: !1086)
!1148 = !DILocation(line: 367, column: 50, scope: !1086)
!1149 = !DILocation(line: 367, column: 52, scope: !1086)
!1150 = !DILocation(line: 367, column: 48, scope: !1086)
!1151 = !DILocation(line: 367, column: 56, scope: !1086)
!1152 = !DILocation(line: 368, column: 18, scope: !1086)
!1153 = !DILocation(line: 368, column: 20, scope: !1086)
!1154 = !DILocation(line: 368, column: 25, scope: !1086)
!1155 = !DILocation(line: 368, column: 27, scope: !1086)
!1156 = !DILocation(line: 368, column: 23, scope: !1086)
!1157 = !DILocation(line: 361, column: 17, scope: !1032)
!1158 = !DILocation(line: 369, column: 26, scope: !1086)
!1159 = !DILocation(line: 369, column: 28, scope: !1086)
!1160 = !DILocation(line: 369, column: 17, scope: !1086)
!1161 = !DILocation(line: 369, column: 21, scope: !1086)
!1162 = !DILocation(line: 369, column: 24, scope: !1086)
!1163 = !DILocation(line: 371, column: 17, scope: !1086)
!1164 = !DILocation(line: 371, column: 21, scope: !1086)
!1165 = !DILocation(line: 371, column: 24, scope: !1086)
!1166 = !DILocation(line: 372, column: 9, scope: !1032)
!1167 = !DILocation(line: 346, column: 38, scope: !1026)
!1168 = !DILocation(line: 346, column: 9, scope: !1026)
!1169 = distinct !{!1169, !1030, !1170}
!1170 = !DILocation(line: 372, column: 9, scope: !1022)
!1171 = !DILocation(line: 345, column: 34, scope: !1016)
!1172 = !DILocation(line: 345, column: 5, scope: !1016)
!1173 = distinct !{!1173, !1020, !1174}
!1174 = !DILocation(line: 372, column: 9, scope: !1012)
!1175 = !DILocalVariable(name: "edges", scope: !865, file: !3, line: 376, type: !29)
!1176 = !DILocation(line: 376, column: 10, scope: !865)
!1177 = !DILocation(line: 376, column: 25, scope: !865)
!1178 = !DILocation(line: 376, column: 18, scope: !865)
!1179 = !DILocation(line: 377, column: 12, scope: !865)
!1180 = !DILocation(line: 377, column: 5, scope: !865)
!1181 = !DILocation(line: 377, column: 38, scope: !865)
!1182 = !DILocation(line: 377, column: 36, scope: !865)
!1183 = !DILocation(line: 377, column: 43, scope: !865)
!1184 = !DILocation(line: 377, column: 41, scope: !865)
!1185 = !DILocation(line: 378, column: 12, scope: !865)
!1186 = !DILocation(line: 378, column: 5, scope: !865)
!1187 = !DILocation(line: 378, column: 40, scope: !865)
!1188 = !DILocation(line: 378, column: 38, scope: !865)
!1189 = !DILocation(line: 378, column: 45, scope: !865)
!1190 = !DILocation(line: 378, column: 43, scope: !865)
!1191 = !DILocalVariable(name: "c", scope: !865, file: !3, line: 381, type: !115)
!1192 = !DILocation(line: 381, column: 12, scope: !865)
!1193 = !DILocalVariable(name: "j", scope: !1194, file: !3, line: 382, type: !6)
!1194 = distinct !DILexicalBlock(scope: !865, file: !3, line: 382, column: 5)
!1195 = !DILocation(line: 382, column: 14, scope: !1194)
!1196 = !DILocation(line: 382, column: 10, scope: !1194)
!1197 = !DILocation(line: 382, column: 21, scope: !1198)
!1198 = distinct !DILexicalBlock(scope: !1194, file: !3, line: 382, column: 5)
!1199 = !DILocation(line: 382, column: 25, scope: !1198)
!1200 = !DILocation(line: 382, column: 28, scope: !1198)
!1201 = !DILocation(line: 382, column: 23, scope: !1198)
!1202 = !DILocation(line: 382, column: 5, scope: !1194)
!1203 = !DILocalVariable(name: "i", scope: !1204, file: !3, line: 383, type: !6)
!1204 = distinct !DILexicalBlock(scope: !1198, file: !3, line: 383, column: 9)
!1205 = !DILocation(line: 383, column: 18, scope: !1204)
!1206 = !DILocation(line: 383, column: 14, scope: !1204)
!1207 = !DILocation(line: 383, column: 25, scope: !1208)
!1208 = distinct !DILexicalBlock(scope: !1204, file: !3, line: 383, column: 9)
!1209 = !DILocation(line: 383, column: 29, scope: !1208)
!1210 = !DILocation(line: 383, column: 32, scope: !1208)
!1211 = !DILocation(line: 383, column: 27, scope: !1208)
!1212 = !DILocation(line: 383, column: 9, scope: !1204)
!1213 = !DILocation(line: 384, column: 17, scope: !1214)
!1214 = distinct !DILexicalBlock(scope: !1215, file: !3, line: 384, column: 17)
!1215 = distinct !DILexicalBlock(scope: !1208, file: !3, line: 383, column: 42)
!1216 = !DILocation(line: 384, column: 21, scope: !1214)
!1217 = !DILocation(line: 384, column: 27, scope: !1214)
!1218 = !DILocation(line: 384, column: 24, scope: !1214)
!1219 = !DILocation(line: 384, column: 32, scope: !1214)
!1220 = !DILocation(line: 384, column: 35, scope: !1214)
!1221 = !DILocation(line: 384, column: 39, scope: !1214)
!1222 = !DILocation(line: 384, column: 42, scope: !1214)
!1223 = !DILocation(line: 384, column: 17, scope: !1215)
!1224 = !DILocation(line: 385, column: 17, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1214, file: !3, line: 384, column: 48)
!1226 = !DILocation(line: 385, column: 21, scope: !1225)
!1227 = !DILocation(line: 385, column: 24, scope: !1225)
!1228 = !DILocalVariable(name: "nedges", scope: !1225, file: !3, line: 386, type: !6)
!1229 = !DILocation(line: 386, column: 21, scope: !1225)
!1230 = !DILocation(line: 387, column: 28, scope: !1225)
!1231 = !DILocation(line: 387, column: 17, scope: !1225)
!1232 = !DILocation(line: 387, column: 26, scope: !1225)
!1233 = !DILocation(line: 389, column: 17, scope: !1225)
!1234 = !DILocation(line: 390, column: 27, scope: !1235)
!1235 = distinct !DILexicalBlock(scope: !1225, file: !3, line: 389, column: 20)
!1236 = !DILocalVariable(name: "t", scope: !1235, file: !3, line: 391, type: !7)
!1237 = !DILocation(line: 391, column: 31, scope: !1235)
!1238 = !DILocation(line: 391, column: 35, scope: !1235)
!1239 = !DILocation(line: 391, column: 41, scope: !1235)
!1240 = !DILocalVariable(name: "nbs", scope: !1235, file: !3, line: 393, type: !1241)
!1241 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 256, elements: !1242)
!1242 = !{!1243}
!1243 = !DISubrange(count: 8)
!1244 = !DILocation(line: 393, column: 25, scope: !1235)
!1245 = !DILocation(line: 394, column: 30, scope: !1235)
!1246 = !DILocation(line: 394, column: 34, scope: !1235)
!1247 = !DILocation(line: 394, column: 32, scope: !1235)
!1248 = !DILocation(line: 394, column: 21, scope: !1235)
!1249 = !DILocation(line: 394, column: 28, scope: !1235)
!1250 = !DILocation(line: 395, column: 30, scope: !1235)
!1251 = !DILocation(line: 395, column: 34, scope: !1235)
!1252 = !DILocation(line: 395, column: 32, scope: !1235)
!1253 = !DILocation(line: 395, column: 21, scope: !1235)
!1254 = !DILocation(line: 395, column: 28, scope: !1235)
!1255 = !DILocation(line: 396, column: 30, scope: !1235)
!1256 = !DILocation(line: 396, column: 32, scope: !1235)
!1257 = !DILocation(line: 396, column: 21, scope: !1235)
!1258 = !DILocation(line: 396, column: 28, scope: !1235)
!1259 = !DILocation(line: 397, column: 30, scope: !1235)
!1260 = !DILocation(line: 397, column: 32, scope: !1235)
!1261 = !DILocation(line: 397, column: 21, scope: !1235)
!1262 = !DILocation(line: 397, column: 28, scope: !1235)
!1263 = !DILocation(line: 398, column: 30, scope: !1235)
!1264 = !DILocation(line: 398, column: 37, scope: !1235)
!1265 = !DILocation(line: 398, column: 21, scope: !1235)
!1266 = !DILocation(line: 398, column: 28, scope: !1235)
!1267 = !DILocation(line: 399, column: 30, scope: !1235)
!1268 = !DILocation(line: 399, column: 37, scope: !1235)
!1269 = !DILocation(line: 399, column: 21, scope: !1235)
!1270 = !DILocation(line: 399, column: 28, scope: !1235)
!1271 = !DILocation(line: 400, column: 30, scope: !1235)
!1272 = !DILocation(line: 400, column: 37, scope: !1235)
!1273 = !DILocation(line: 400, column: 21, scope: !1235)
!1274 = !DILocation(line: 400, column: 28, scope: !1235)
!1275 = !DILocation(line: 401, column: 30, scope: !1235)
!1276 = !DILocation(line: 401, column: 37, scope: !1235)
!1277 = !DILocation(line: 401, column: 21, scope: !1235)
!1278 = !DILocation(line: 401, column: 28, scope: !1235)
!1279 = !DILocalVariable(name: "k", scope: !1280, file: !3, line: 403, type: !6)
!1280 = distinct !DILexicalBlock(scope: !1235, file: !3, line: 403, column: 21)
!1281 = !DILocation(line: 403, column: 30, scope: !1280)
!1282 = !DILocation(line: 403, column: 26, scope: !1280)
!1283 = !DILocation(line: 403, column: 37, scope: !1284)
!1284 = distinct !DILexicalBlock(scope: !1280, file: !3, line: 403, column: 21)
!1285 = !DILocation(line: 403, column: 39, scope: !1284)
!1286 = !DILocation(line: 403, column: 21, scope: !1280)
!1287 = !DILocation(line: 404, column: 29, scope: !1288)
!1288 = distinct !DILexicalBlock(scope: !1284, file: !3, line: 404, column: 29)
!1289 = !DILocation(line: 404, column: 37, scope: !1288)
!1290 = !DILocation(line: 404, column: 33, scope: !1288)
!1291 = !DILocation(line: 404, column: 44, scope: !1288)
!1292 = !DILocation(line: 404, column: 41, scope: !1288)
!1293 = !DILocation(line: 404, column: 49, scope: !1288)
!1294 = !DILocation(line: 404, column: 52, scope: !1288)
!1295 = !DILocation(line: 404, column: 60, scope: !1288)
!1296 = !DILocation(line: 404, column: 56, scope: !1288)
!1297 = !DILocation(line: 404, column: 64, scope: !1288)
!1298 = !DILocation(line: 404, column: 29, scope: !1284)
!1299 = !DILocation(line: 405, column: 29, scope: !1300)
!1300 = distinct !DILexicalBlock(scope: !1288, file: !3, line: 404, column: 70)
!1301 = !DILocation(line: 405, column: 37, scope: !1300)
!1302 = !DILocation(line: 405, column: 33, scope: !1300)
!1303 = !DILocation(line: 405, column: 41, scope: !1300)
!1304 = !DILocation(line: 406, column: 49, scope: !1300)
!1305 = !DILocation(line: 406, column: 45, scope: !1300)
!1306 = !DILocation(line: 406, column: 29, scope: !1300)
!1307 = !DILocation(line: 406, column: 35, scope: !1300)
!1308 = !DILocation(line: 406, column: 43, scope: !1300)
!1309 = !DILocation(line: 407, column: 35, scope: !1300)
!1310 = !DILocation(line: 408, column: 25, scope: !1300)
!1311 = !DILocation(line: 404, column: 67, scope: !1288)
!1312 = !DILocation(line: 403, column: 45, scope: !1284)
!1313 = !DILocation(line: 403, column: 21, scope: !1284)
!1314 = distinct !{!1314, !1286, !1315}
!1315 = !DILocation(line: 408, column: 25, scope: !1280)
!1316 = !DILocation(line: 409, column: 17, scope: !1235)
!1317 = !DILocation(line: 409, column: 26, scope: !1225)
!1318 = !DILocation(line: 409, column: 33, scope: !1225)
!1319 = distinct !{!1319, !1233, !1320}
!1320 = !DILocation(line: 409, column: 36, scope: !1225)
!1321 = !DILocation(line: 410, column: 13, scope: !1225)
!1322 = !DILocation(line: 411, column: 14, scope: !1215)
!1323 = !DILocation(line: 412, column: 9, scope: !1215)
!1324 = !DILocation(line: 383, column: 38, scope: !1208)
!1325 = !DILocation(line: 383, column: 9, scope: !1208)
!1326 = distinct !{!1326, !1212, !1327}
!1327 = !DILocation(line: 412, column: 9, scope: !1204)
!1328 = !DILocation(line: 382, column: 34, scope: !1198)
!1329 = !DILocation(line: 382, column: 5, scope: !1198)
!1330 = distinct !{!1330, !1202, !1331}
!1331 = !DILocation(line: 412, column: 9, scope: !1194)
!1332 = !DILocation(line: 414, column: 10, scope: !865)
!1333 = !DILocation(line: 414, column: 5, scope: !865)
!1334 = !DILocation(line: 415, column: 10, scope: !865)
!1335 = !DILocation(line: 415, column: 5, scope: !865)
!1336 = !DILocation(line: 416, column: 10, scope: !865)
!1337 = !DILocation(line: 416, column: 5, scope: !865)
!1338 = !DILocation(line: 417, column: 10, scope: !865)
!1339 = !DILocation(line: 417, column: 5, scope: !865)
!1340 = !DILocation(line: 419, column: 12, scope: !865)
!1341 = !DILocation(line: 419, column: 5, scope: !865)
!1342 = !DILocalVariable(name: "argc", arg: 1, scope: !2, file: !3, line: 422, type: !7)
!1343 = !DILocation(line: 422, column: 20, scope: !2)
!1344 = !DILocalVariable(name: "argv", arg: 2, scope: !2, file: !3, line: 422, type: !8)
!1345 = !DILocation(line: 422, column: 46, scope: !2)
!1346 = !DILocation(line: 424, column: 9, scope: !1347)
!1347 = distinct !DILexicalBlock(scope: !2, file: !3, line: 424, column: 9)
!1348 = !DILocation(line: 424, column: 14, scope: !1347)
!1349 = !DILocation(line: 424, column: 9, scope: !2)
!1350 = !DILocation(line: 425, column: 41, scope: !1351)
!1351 = distinct !DILexicalBlock(scope: !1347, file: !3, line: 424, column: 19)
!1352 = !DILocation(line: 425, column: 9, scope: !1351)
!1353 = !DILocation(line: 426, column: 9, scope: !1351)
!1354 = !DILocalVariable(name: "in_bitmap_data", scope: !2, file: !3, line: 430, type: !306)
!1355 = !DILocation(line: 430, column: 20, scope: !2)
!1356 = !DILocation(line: 430, column: 46, scope: !2)
!1357 = !DILocation(line: 430, column: 37, scope: !2)
!1358 = !DILocation(line: 431, column: 9, scope: !1359)
!1359 = distinct !DILexicalBlock(scope: !2, file: !3, line: 431, column: 9)
!1360 = !DILocation(line: 431, column: 24, scope: !1359)
!1361 = !DILocation(line: 431, column: 9, scope: !2)
!1362 = !DILocation(line: 432, column: 17, scope: !1363)
!1363 = distinct !DILexicalBlock(scope: !1359, file: !3, line: 431, column: 33)
!1364 = !DILocation(line: 432, column: 9, scope: !1363)
!1365 = !DILocation(line: 433, column: 9, scope: !1363)
!1366 = !DILocation(line: 436, column: 39, scope: !2)
!1367 = !DILocation(line: 436, column: 49, scope: !2)
!1368 = !DILocation(line: 436, column: 60, scope: !2)
!1369 = !DILocation(line: 436, column: 57, scope: !2)
!1370 = !DILocation(line: 436, column: 5, scope: !2)
!1371 = !DILocalVariable(name: "out_bitmap_data", scope: !2, file: !3, line: 438, type: !306)
!1372 = !DILocation(line: 438, column: 20, scope: !2)
!1373 = !DILocation(line: 439, column: 30, scope: !2)
!1374 = !DILocation(line: 439, column: 9, scope: !2)
!1375 = !DILocation(line: 440, column: 9, scope: !1376)
!1376 = distinct !DILexicalBlock(scope: !2, file: !3, line: 440, column: 9)
!1377 = !DILocation(line: 440, column: 25, scope: !1376)
!1378 = !DILocation(line: 440, column: 9, scope: !2)
!1379 = !DILocation(line: 441, column: 17, scope: !1380)
!1380 = distinct !DILexicalBlock(scope: !1376, file: !3, line: 440, column: 34)
!1381 = !DILocation(line: 441, column: 9, scope: !1380)
!1382 = !DILocation(line: 442, column: 9, scope: !1380)
!1383 = !DILocation(line: 445, column: 34, scope: !1384)
!1384 = distinct !DILexicalBlock(scope: !2, file: !3, line: 445, column: 9)
!1385 = !DILocation(line: 445, column: 9, scope: !1384)
!1386 = !DILocation(line: 445, column: 9, scope: !2)
!1387 = !DILocation(line: 446, column: 17, scope: !1388)
!1388 = distinct !DILexicalBlock(scope: !1384, file: !3, line: 445, column: 52)
!1389 = !DILocation(line: 446, column: 9, scope: !1388)
!1390 = !DILocation(line: 447, column: 9, scope: !1388)
!1391 = !DILocation(line: 450, column: 20, scope: !2)
!1392 = !DILocation(line: 450, column: 10, scope: !2)
!1393 = !DILocation(line: 450, column: 5, scope: !2)
!1394 = !DILocation(line: 451, column: 20, scope: !2)
!1395 = !DILocation(line: 451, column: 10, scope: !2)
!1396 = !DILocation(line: 451, column: 5, scope: !2)
!1397 = !DILocation(line: 452, column: 5, scope: !2)
!1398 = !DILocation(line: 453, column: 1, scope: !2)
