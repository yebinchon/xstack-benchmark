; ModuleID = 'canny-edge-detector.c'
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
  br i1 %cmp, label %if.then, label %if.end, !dbg !129, !cf.info !130

if.then:                                          ; preds = %entry
  call void @perror(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)), !dbg !131
  store i16* null, i16** %retval, align 8, !dbg !133
  br label %return, !dbg !133

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.bmpfile_magic_t* %mag, metadata !134, metadata !DIExpression()), !dbg !142
  %2 = bitcast %struct.bmpfile_magic_t* %mag to i8*, !dbg !143
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !145
  %call1 = call i64 @fread(i8* %2, i64 2, i64 1, %struct._IO_FILE* %3), !dbg !146
  %cmp2 = icmp ne i64 %call1, 1, !dbg !147
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !148, !cf.info !130

if.then3:                                         ; preds = %if.end
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !149
  %call4 = call i32 @fclose(%struct._IO_FILE* %4), !dbg !151
  store i16* null, i16** %retval, align 8, !dbg !152
  br label %return, !dbg !152

if.end5:                                          ; preds = %if.end
  %magic = getelementptr inbounds %struct.bmpfile_magic_t, %struct.bmpfile_magic_t* %mag, i32 0, i32 0, !dbg !153
  %arraydecay = getelementptr inbounds [2 x i8], [2 x i8]* %magic, i64 0, i64 0, !dbg !155
  %5 = bitcast i8* %arraydecay to i16*, !dbg !155
  %6 = load i16, i16* %5, align 1, !dbg !155
  %conv = zext i16 %6 to i32, !dbg !155
  %cmp6 = icmp ne i32 %conv, 19778, !dbg !156
  br i1 %cmp6, label %if.then8, label %if.end16, !dbg !157, !cf.info !130

if.then8:                                         ; preds = %if.end5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !158
  %magic9 = getelementptr inbounds %struct.bmpfile_magic_t, %struct.bmpfile_magic_t* %mag, i32 0, i32 0, !dbg !160
  %arrayidx = getelementptr inbounds [2 x i8], [2 x i8]* %magic9, i64 0, i64 0, !dbg !161
  %8 = load i8, i8* %arrayidx, align 1, !dbg !161
  %conv10 = zext i8 %8 to i32, !dbg !161
  %magic11 = getelementptr inbounds %struct.bmpfile_magic_t, %struct.bmpfile_magic_t* %mag, i32 0, i32 0, !dbg !162
  %arrayidx12 = getelementptr inbounds [2 x i8], [2 x i8]* %magic11, i64 0, i64 1, !dbg !163
  %9 = load i8, i8* %arrayidx12, align 1, !dbg !163
  %conv13 = zext i8 %9 to i32, !dbg !163
  %call14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i32 %conv10, i32 %conv13), !dbg !164
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !165
  %call15 = call i32 @fclose(%struct._IO_FILE* %10), !dbg !166
  store i16* null, i16** %retval, align 8, !dbg !167
  br label %return, !dbg !167

if.end16:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata %struct.bmpfile_header_t* %bitmapFileHeader, metadata !168, metadata !DIExpression()), !dbg !176
  %11 = bitcast %struct.bmpfile_header_t* %bitmapFileHeader to i8*, !dbg !177
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !179
  %call17 = call i64 @fread(i8* %11, i64 12, i64 1, %struct._IO_FILE* %12), !dbg !180
  %cmp18 = icmp ne i64 %call17, 1, !dbg !181
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !182, !cf.info !130

if.then20:                                        ; preds = %if.end16
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !183
  %call21 = call i32 @fclose(%struct._IO_FILE* %13), !dbg !185
  store i16* null, i16** %retval, align 8, !dbg !186
  br label %return, !dbg !186

if.end22:                                         ; preds = %if.end16
  %14 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bitmapInfoHeader.addr, align 8, !dbg !187
  %15 = bitcast %struct.bitmap_info_header_t* %14 to i8*, !dbg !187
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !189
  %call23 = call i64 @fread(i8* %15, i64 40, i64 1, %struct._IO_FILE* %16), !dbg !190
  %cmp24 = icmp ne i64 %call23, 1, !dbg !191
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !192, !cf.info !130

if.then26:                                        ; preds = %if.end22
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !193
  %call27 = call i32 @fclose(%struct._IO_FILE* %17), !dbg !195
  store i16* null, i16** %retval, align 8, !dbg !196
  br label %return, !dbg !196

if.end28:                                         ; preds = %if.end22
  %18 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bitmapInfoHeader.addr, align 8, !dbg !197
  %compress_type = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %18, i32 0, i32 5, !dbg !199
  %19 = load i32, i32* %compress_type, align 4, !dbg !199
  %cmp29 = icmp ne i32 %19, 0, !dbg !200
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !201, !cf.info !130

if.then31:                                        ; preds = %if.end28
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !202
  %call32 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.3, i64 0, i64 0)), !dbg !203
  br label %if.end33, !dbg !203

if.end33:                                         ; preds = %if.then31, %if.end28
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !204
  %bmp_offset = getelementptr inbounds %struct.bmpfile_header_t, %struct.bmpfile_header_t* %bitmapFileHeader, i32 0, i32 3, !dbg !206
  %22 = load i32, i32* %bmp_offset, align 4, !dbg !206
  %conv34 = zext i32 %22 to i64, !dbg !207
  %call35 = call i32 @fseek(%struct._IO_FILE* %21, i64 %conv34, i32 0), !dbg !208
  %tobool = icmp ne i32 %call35, 0, !dbg !208
  br i1 %tobool, label %if.then36, label %if.end38, !dbg !209, !cf.info !130

if.then36:                                        ; preds = %if.end33
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !210
  %call37 = call i32 @fclose(%struct._IO_FILE* %23), !dbg !212
  store i16* null, i16** %retval, align 8, !dbg !213
  br label %return, !dbg !213

if.end38:                                         ; preds = %if.end33
  call void @llvm.dbg.declare(metadata i16** %bitmapImage, metadata !214, metadata !DIExpression()), !dbg !215
  %24 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bitmapInfoHeader.addr, align 8, !dbg !216
  %bmp_bytesz = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %24, i32 0, i32 6, !dbg !217
  %25 = load i32, i32* %bmp_bytesz, align 4, !dbg !217
  %conv39 = zext i32 %25 to i64, !dbg !216
  %mul = mul i64 %conv39, 2, !dbg !218
  %call40 = call noalias i8* @malloc(i64 %mul) #6, !dbg !219
  %26 = bitcast i8* %call40 to i16*, !dbg !219
  store i16* %26, i16** %bitmapImage, align 8, !dbg !215
  %27 = load i16*, i16** %bitmapImage, align 8, !dbg !220
  %cmp41 = icmp eq i16* %27, null, !dbg !222
  br i1 %cmp41, label %if.then43, label %if.end45, !dbg !223, !cf.info !130

if.then43:                                        ; preds = %if.end38
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !224
  %call44 = call i32 @fclose(%struct._IO_FILE* %28), !dbg !226
  store i16* null, i16** %retval, align 8, !dbg !227
  br label %return, !dbg !227

if.end45:                                         ; preds = %if.end38
  call void @llvm.dbg.declare(metadata i64* %pad, metadata !228, metadata !DIExpression()), !dbg !229
  call void @llvm.dbg.declare(metadata i64* %count, metadata !230, metadata !DIExpression()), !dbg !231
  store i64 0, i64* %count, align 8, !dbg !231
  call void @llvm.dbg.declare(metadata i8* %c, metadata !232, metadata !DIExpression()), !dbg !233
  %29 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bitmapInfoHeader.addr, align 8, !dbg !234
  %bitspp = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %29, i32 0, i32 4, !dbg !235
  %30 = load i16, i16* %bitspp, align 2, !dbg !235
  %conv46 = zext i16 %30 to i32, !dbg !234
  %31 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bitmapInfoHeader.addr, align 8, !dbg !236
  %width = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %31, i32 0, i32 1, !dbg !237
  %32 = load i32, i32* %width, align 4, !dbg !237
  %mul47 = mul nsw i32 %conv46, %32, !dbg !238
  %conv48 = sitofp i32 %mul47 to double, !dbg !234
  %div = fdiv double %conv48, 3.200000e+01, !dbg !239
  %33 = call double @llvm.ceil.f64(double %div), !dbg !240
  %mul49 = fmul double 4.000000e+00, %33, !dbg !241
  %34 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bitmapInfoHeader.addr, align 8, !dbg !242
  %width50 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %34, i32 0, i32 1, !dbg !243
  %35 = load i32, i32* %width50, align 4, !dbg !243
  %conv51 = sitofp i32 %35 to double, !dbg !242
  %sub = fsub double %mul49, %conv51, !dbg !244
  %conv52 = fptoui double %sub to i64, !dbg !245
  store i64 %conv52, i64* %pad, align 8, !dbg !246
  call void @llvm.dbg.declare(metadata i64* %i, metadata !247, metadata !DIExpression()), !dbg !249
  store i64 0, i64* %i, align 8, !dbg !249
  br label %for.cond, !dbg !250

for.cond:                                         ; preds = %for.inc72, %if.end45
  %36 = load i64, i64* %i, align 8, !dbg !251
  %37 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bitmapInfoHeader.addr, align 8, !dbg !253
  %height = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %37, i32 0, i32 2, !dbg !254
  %38 = load i32, i32* %height, align 4, !dbg !254
  %conv53 = sext i32 %38 to i64, !dbg !253
  %cmp54 = icmp ult i64 %36, %conv53, !dbg !255
  br i1 %cmp54, label %for.body, label %for.end74, !dbg !256

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %j, metadata !257, metadata !DIExpression()), !dbg !260
  store i64 0, i64* %j, align 8, !dbg !260
  br label %for.cond56, !dbg !261

for.cond56:                                       ; preds = %for.inc, %for.body
  %39 = load i64, i64* %j, align 8, !dbg !262
  %40 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bitmapInfoHeader.addr, align 8, !dbg !264
  %width57 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %40, i32 0, i32 1, !dbg !265
  %41 = load i32, i32* %width57, align 4, !dbg !265
  %conv58 = sext i32 %41 to i64, !dbg !264
  %cmp59 = icmp ult i64 %39, %conv58, !dbg !266
  br i1 %cmp59, label %for.body61, label %for.end, !dbg !267

for.body61:                                       ; preds = %for.cond56
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !268
  %call62 = call i64 @fread(i8* %c, i64 1, i64 1, %struct._IO_FILE* %42), !dbg !271
  %cmp63 = icmp ne i64 %call62, 1, !dbg !272
  br i1 %cmp63, label %if.then65, label %if.end67, !dbg !273, !cf.info !130

if.then65:                                        ; preds = %for.body61
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !274
  %call66 = call i32 @fclose(%struct._IO_FILE* %43), !dbg !276
  store i16* null, i16** %retval, align 8, !dbg !277
  br label %return, !dbg !277

if.end67:                                         ; preds = %for.body61
  %44 = load i8, i8* %c, align 1, !dbg !278
  %conv68 = zext i8 %44 to i16, !dbg !279
  %45 = load i16*, i16** %bitmapImage, align 8, !dbg !280
  %46 = load i64, i64* %count, align 8, !dbg !281
  %inc = add i64 %46, 1, !dbg !281
  store i64 %inc, i64* %count, align 8, !dbg !281
  %arrayidx69 = getelementptr inbounds i16, i16* %45, i64 %46, !dbg !280
  store i16 %conv68, i16* %arrayidx69, align 2, !dbg !282
  br label %for.inc, !dbg !283

for.inc:                                          ; preds = %if.end67
  %47 = load i64, i64* %j, align 8, !dbg !284
  %inc70 = add i64 %47, 1, !dbg !284
  store i64 %inc70, i64* %j, align 8, !dbg !284
  br label %for.cond56, !dbg !285, !llvm.loop !286

for.end:                                          ; preds = %for.cond56
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !288
  %49 = load i64, i64* %pad, align 8, !dbg !289
  %call71 = call i32 @fseek(%struct._IO_FILE* %48, i64 %49, i32 1), !dbg !290
  br label %for.inc72, !dbg !291

for.inc72:                                        ; preds = %for.end
  %50 = load i64, i64* %i, align 8, !dbg !292
  %inc73 = add i64 %50, 1, !dbg !292
  store i64 %inc73, i64* %i, align 8, !dbg !292
  br label %for.cond, !dbg !293, !llvm.loop !294

for.end74:                                        ; preds = %for.cond
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !296
  %call75 = call i32 @fclose(%struct._IO_FILE* %51), !dbg !297
  %52 = load i16*, i16** %bitmapImage, align 8, !dbg !298
  store i16* %52, i16** %retval, align 8, !dbg !299
  br label %return, !dbg !299

return:                                           ; preds = %for.end74, %if.then65, %if.then43, %if.then36, %if.then26, %if.then20, %if.then8, %if.then3, %if.then
  %53 = load i16*, i16** %retval, align 8, !dbg !300
  ret i16* %53, !dbg !300
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
define dso_local zeroext i1 @save_bmp(i8* %filename, %struct.bitmap_info_header_t* %bmp_ih, i16* %data) #0 !dbg !301 {
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
  call void @llvm.dbg.declare(metadata i8** %filename.addr, metadata !309, metadata !DIExpression()), !dbg !310
  store %struct.bitmap_info_header_t* %bmp_ih, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.bitmap_info_header_t** %bmp_ih.addr, metadata !311, metadata !DIExpression()), !dbg !312
  store i16* %data, i16** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i16** %data.addr, metadata !313, metadata !DIExpression()), !dbg !314
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %filePtr, metadata !315, metadata !DIExpression()), !dbg !316
  %0 = load i8*, i8** %filename.addr, align 8, !dbg !317
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0)), !dbg !318
  store %struct._IO_FILE* %call, %struct._IO_FILE** %filePtr, align 8, !dbg !316
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !319
  %cmp = icmp eq %struct._IO_FILE* %1, null, !dbg !321
  br i1 %cmp, label %if.then, label %if.end, !dbg !322, !cf.info !130

if.then:                                          ; preds = %entry
  store i1 true, i1* %retval, align 1, !dbg !323
  br label %return, !dbg !323

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.bmpfile_magic_t* %mag, metadata !324, metadata !DIExpression()), !dbg !325
  %2 = bitcast %struct.bmpfile_magic_t* %mag to i8*, !dbg !325
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds (%struct.bmpfile_magic_t, %struct.bmpfile_magic_t* @__const.save_bmp.mag, i32 0, i32 0, i32 0), i64 2, i1 false), !dbg !325
  %3 = bitcast %struct.bmpfile_magic_t* %mag to i8*, !dbg !326
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !328
  %call1 = call i64 @fwrite(i8* %3, i64 2, i64 1, %struct._IO_FILE* %4), !dbg !329
  %cmp2 = icmp ne i64 %call1, 1, !dbg !330
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !331, !cf.info !130

if.then3:                                         ; preds = %if.end
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !332
  %call4 = call i32 @fclose(%struct._IO_FILE* %5), !dbg !334
  store i1 true, i1* %retval, align 1, !dbg !335
  br label %return, !dbg !335

if.end5:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %offset, metadata !336, metadata !DIExpression()), !dbg !338
  %6 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !339
  %bitspp = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %6, i32 0, i32 4, !dbg !340
  %7 = load i16, i16* %bitspp, align 2, !dbg !340
  %conv = zext i16 %7 to i32, !dbg !339
  %shl = shl i32 1, %conv, !dbg !341
  %mul = mul i32 %shl, 4, !dbg !342
  %conv6 = zext i32 %mul to i64, !dbg !343
  %add = add i64 54, %conv6, !dbg !344
  %conv7 = trunc i64 %add to i32, !dbg !345
  store i32 %conv7, i32* %offset, align 4, !dbg !338
  call void @llvm.dbg.declare(metadata %struct.bmpfile_header_t* %bmp_fh, metadata !346, metadata !DIExpression()), !dbg !348
  %filesz = getelementptr inbounds %struct.bmpfile_header_t, %struct.bmpfile_header_t* %bmp_fh, i32 0, i32 0, !dbg !349
  %8 = load i32, i32* %offset, align 4, !dbg !350
  %9 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !351
  %bmp_bytesz = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %9, i32 0, i32 6, !dbg !352
  %10 = load i32, i32* %bmp_bytesz, align 4, !dbg !352
  %add8 = add i32 %8, %10, !dbg !353
  store i32 %add8, i32* %filesz, align 4, !dbg !349
  %creator1 = getelementptr inbounds %struct.bmpfile_header_t, %struct.bmpfile_header_t* %bmp_fh, i32 0, i32 1, !dbg !349
  store i16 0, i16* %creator1, align 4, !dbg !349
  %creator2 = getelementptr inbounds %struct.bmpfile_header_t, %struct.bmpfile_header_t* %bmp_fh, i32 0, i32 2, !dbg !349
  store i16 0, i16* %creator2, align 2, !dbg !349
  %bmp_offset = getelementptr inbounds %struct.bmpfile_header_t, %struct.bmpfile_header_t* %bmp_fh, i32 0, i32 3, !dbg !349
  %11 = load i32, i32* %offset, align 4, !dbg !354
  store i32 %11, i32* %bmp_offset, align 4, !dbg !349
  %12 = bitcast %struct.bmpfile_header_t* %bmp_fh to i8*, !dbg !355
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !357
  %call9 = call i64 @fwrite(i8* %12, i64 12, i64 1, %struct._IO_FILE* %13), !dbg !358
  %cmp10 = icmp ne i64 %call9, 1, !dbg !359
  br i1 %cmp10, label %if.then12, label %if.end14, !dbg !360, !cf.info !130

if.then12:                                        ; preds = %if.end5
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !361
  %call13 = call i32 @fclose(%struct._IO_FILE* %14), !dbg !363
  store i1 true, i1* %retval, align 1, !dbg !364
  br label %return, !dbg !364

if.end14:                                         ; preds = %if.end5
  %15 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !365
  %16 = bitcast %struct.bitmap_info_header_t* %15 to i8*, !dbg !365
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !367
  %call15 = call i64 @fwrite(i8* %16, i64 40, i64 1, %struct._IO_FILE* %17), !dbg !368
  %cmp16 = icmp ne i64 %call15, 1, !dbg !369
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !370, !cf.info !130

if.then18:                                        ; preds = %if.end14
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !371
  %call19 = call i32 @fclose(%struct._IO_FILE* %18), !dbg !373
  store i1 true, i1* %retval, align 1, !dbg !374
  br label %return, !dbg !374

if.end20:                                         ; preds = %if.end14
  call void @llvm.dbg.declare(metadata i64* %i, metadata !375, metadata !DIExpression()), !dbg !377
  store i64 0, i64* %i, align 8, !dbg !377
  br label %for.cond, !dbg !378

for.cond:                                         ; preds = %for.inc, %if.end20
  %19 = load i64, i64* %i, align 8, !dbg !379
  %20 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !381
  %bitspp21 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %20, i32 0, i32 4, !dbg !382
  %21 = load i16, i16* %bitspp21, align 2, !dbg !382
  %conv22 = zext i16 %21 to i32, !dbg !381
  %shl23 = shl i32 1, %conv22, !dbg !383
  %conv24 = zext i32 %shl23 to i64, !dbg !384
  %cmp25 = icmp ult i64 %19, %conv24, !dbg !385
  br i1 %cmp25, label %for.body, label %for.end, !dbg !386

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct.rgb_t* %color, metadata !387, metadata !DIExpression()), !dbg !397
  %r = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %color, i32 0, i32 0, !dbg !398
  %22 = load i64, i64* %i, align 8, !dbg !399
  %conv27 = trunc i64 %22 to i8, !dbg !400
  store i8 %conv27, i8* %r, align 1, !dbg !398
  %g = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %color, i32 0, i32 1, !dbg !398
  %23 = load i64, i64* %i, align 8, !dbg !401
  %conv28 = trunc i64 %23 to i8, !dbg !402
  store i8 %conv28, i8* %g, align 1, !dbg !398
  %b = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %color, i32 0, i32 2, !dbg !398
  %24 = load i64, i64* %i, align 8, !dbg !403
  %conv29 = trunc i64 %24 to i8, !dbg !404
  store i8 %conv29, i8* %b, align 1, !dbg !398
  %nothing = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %color, i32 0, i32 3, !dbg !398
  store i8 0, i8* %nothing, align 1, !dbg !398
  %25 = bitcast %struct.rgb_t* %color to i8*, !dbg !405
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !407
  %call30 = call i64 @fwrite(i8* %25, i64 4, i64 1, %struct._IO_FILE* %26), !dbg !408
  %cmp31 = icmp ne i64 %call30, 1, !dbg !409
  br i1 %cmp31, label %if.then33, label %if.end35, !dbg !410, !cf.info !130

if.then33:                                        ; preds = %for.body
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !411
  %call34 = call i32 @fclose(%struct._IO_FILE* %27), !dbg !413
  store i1 true, i1* %retval, align 1, !dbg !414
  br label %return, !dbg !414

if.end35:                                         ; preds = %for.body
  br label %for.inc, !dbg !415

for.inc:                                          ; preds = %if.end35
  %28 = load i64, i64* %i, align 8, !dbg !416
  %inc = add i64 %28, 1, !dbg !416
  store i64 %inc, i64* %i, align 8, !dbg !416
  br label %for.cond, !dbg !417, !llvm.loop !418

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %pad, metadata !420, metadata !DIExpression()), !dbg !421
  %29 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !422
  %bitspp36 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %29, i32 0, i32 4, !dbg !423
  %30 = load i16, i16* %bitspp36, align 2, !dbg !423
  %conv37 = zext i16 %30 to i32, !dbg !422
  %31 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !424
  %width = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %31, i32 0, i32 1, !dbg !425
  %32 = load i32, i32* %width, align 4, !dbg !425
  %mul38 = mul nsw i32 %conv37, %32, !dbg !426
  %conv39 = sitofp i32 %mul38 to double, !dbg !422
  %div = fdiv double %conv39, 3.200000e+01, !dbg !427
  %33 = call double @llvm.ceil.f64(double %div), !dbg !428
  %mul40 = fmul double 4.000000e+00, %33, !dbg !429
  %34 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !430
  %width41 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %34, i32 0, i32 1, !dbg !431
  %35 = load i32, i32* %width41, align 4, !dbg !431
  %conv42 = sitofp i32 %35 to double, !dbg !430
  %sub = fsub double %mul40, %conv42, !dbg !432
  %conv43 = fptoui double %sub to i64, !dbg !433
  store i64 %conv43, i64* %pad, align 8, !dbg !421
  call void @llvm.dbg.declare(metadata i8* %c, metadata !434, metadata !DIExpression()), !dbg !435
  call void @llvm.dbg.declare(metadata i64* %i44, metadata !436, metadata !DIExpression()), !dbg !438
  store i64 0, i64* %i44, align 8, !dbg !438
  br label %for.cond45, !dbg !439

for.cond45:                                       ; preds = %for.inc84, %for.end
  %36 = load i64, i64* %i44, align 8, !dbg !440
  %37 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !442
  %height = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %37, i32 0, i32 2, !dbg !443
  %38 = load i32, i32* %height, align 4, !dbg !443
  %conv46 = sext i32 %38 to i64, !dbg !442
  %cmp47 = icmp ult i64 %36, %conv46, !dbg !444
  br i1 %cmp47, label %for.body49, label %for.end86, !dbg !445

for.body49:                                       ; preds = %for.cond45
  call void @llvm.dbg.declare(metadata i64* %j, metadata !446, metadata !DIExpression()), !dbg !449
  store i64 0, i64* %j, align 8, !dbg !449
  br label %for.cond50, !dbg !450

for.cond50:                                       ; preds = %for.inc67, %for.body49
  %39 = load i64, i64* %j, align 8, !dbg !451
  %40 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !453
  %width51 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %40, i32 0, i32 1, !dbg !454
  %41 = load i32, i32* %width51, align 4, !dbg !454
  %conv52 = sext i32 %41 to i64, !dbg !453
  %cmp53 = icmp ult i64 %39, %conv52, !dbg !455
  br i1 %cmp53, label %for.body55, label %for.end69, !dbg !456

for.body55:                                       ; preds = %for.cond50
  %42 = load i16*, i16** %data.addr, align 8, !dbg !457
  %43 = load i64, i64* %j, align 8, !dbg !459
  %44 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !460
  %width56 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %44, i32 0, i32 1, !dbg !461
  %45 = load i32, i32* %width56, align 4, !dbg !461
  %conv57 = sext i32 %45 to i64, !dbg !460
  %46 = load i64, i64* %i44, align 8, !dbg !462
  %mul58 = mul i64 %conv57, %46, !dbg !463
  %add59 = add i64 %43, %mul58, !dbg !464
  %arrayidx = getelementptr inbounds i16, i16* %42, i64 %add59, !dbg !457
  %47 = load i16, i16* %arrayidx, align 2, !dbg !457
  %conv60 = trunc i16 %47 to i8, !dbg !465
  store i8 %conv60, i8* %c, align 1, !dbg !466
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !467
  %call61 = call i64 @fwrite(i8* %c, i64 1, i64 1, %struct._IO_FILE* %48), !dbg !469
  %cmp62 = icmp ne i64 %call61, 1, !dbg !470
  br i1 %cmp62, label %if.then64, label %if.end66, !dbg !471, !cf.info !130

if.then64:                                        ; preds = %for.body55
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !472
  %call65 = call i32 @fclose(%struct._IO_FILE* %49), !dbg !474
  store i1 true, i1* %retval, align 1, !dbg !475
  br label %return, !dbg !475

if.end66:                                         ; preds = %for.body55
  br label %for.inc67, !dbg !476

for.inc67:                                        ; preds = %if.end66
  %50 = load i64, i64* %j, align 8, !dbg !477
  %inc68 = add i64 %50, 1, !dbg !477
  store i64 %inc68, i64* %j, align 8, !dbg !477
  br label %for.cond50, !dbg !478, !llvm.loop !479

for.end69:                                        ; preds = %for.cond50
  store i8 0, i8* %c, align 1, !dbg !481
  call void @llvm.dbg.declare(metadata i64* %j70, metadata !482, metadata !DIExpression()), !dbg !484
  store i64 0, i64* %j70, align 8, !dbg !484
  br label %for.cond71, !dbg !485

for.cond71:                                       ; preds = %for.inc81, %for.end69
  %51 = load i64, i64* %j70, align 8, !dbg !486
  %52 = load i64, i64* %pad, align 8, !dbg !488
  %cmp72 = icmp ult i64 %51, %52, !dbg !489
  br i1 %cmp72, label %for.body74, label %for.end83, !dbg !490

for.body74:                                       ; preds = %for.cond71
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !491
  %call75 = call i64 @fwrite(i8* %c, i64 1, i64 1, %struct._IO_FILE* %53), !dbg !493
  %cmp76 = icmp ne i64 %call75, 1, !dbg !494
  br i1 %cmp76, label %if.then78, label %if.end80, !dbg !495, !cf.info !130

if.then78:                                        ; preds = %for.body74
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !496
  %call79 = call i32 @fclose(%struct._IO_FILE* %54), !dbg !498
  store i1 true, i1* %retval, align 1, !dbg !499
  br label %return, !dbg !499

if.end80:                                         ; preds = %for.body74
  br label %for.inc81, !dbg !500

for.inc81:                                        ; preds = %if.end80
  %55 = load i64, i64* %j70, align 8, !dbg !501
  %inc82 = add i64 %55, 1, !dbg !501
  store i64 %inc82, i64* %j70, align 8, !dbg !501
  br label %for.cond71, !dbg !502, !llvm.loop !503

for.end83:                                        ; preds = %for.cond71
  br label %for.inc84, !dbg !505

for.inc84:                                        ; preds = %for.end83
  %56 = load i64, i64* %i44, align 8, !dbg !506
  %inc85 = add i64 %56, 1, !dbg !506
  store i64 %inc85, i64* %i44, align 8, !dbg !506
  br label %for.cond45, !dbg !507, !llvm.loop !508

for.end86:                                        ; preds = %for.cond45
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** %filePtr, align 8, !dbg !510
  %call87 = call i32 @fclose(%struct._IO_FILE* %57), !dbg !511
  store i1 false, i1* %retval, align 1, !dbg !512
  br label %return, !dbg !512

return:                                           ; preds = %for.end86, %if.then78, %if.then64, %if.then33, %if.then18, %if.then12, %if.then3, %if.then
  %58 = load i1, i1* %retval, align 1, !dbg !513
  ret i1 %58, !dbg !513
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @convolution(i16* %in, i16* %out, float* %kernel, i32 %nx, i32 %ny, i32 %kn, i1 zeroext %normalize) #0 !dbg !514 {
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
  call void @llvm.dbg.declare(metadata i16** %in.addr, metadata !520, metadata !DIExpression()), !dbg !521
  store i16* %out, i16** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i16** %out.addr, metadata !522, metadata !DIExpression()), !dbg !523
  store float* %kernel, float** %kernel.addr, align 8
  call void @llvm.dbg.declare(metadata float** %kernel.addr, metadata !524, metadata !DIExpression()), !dbg !525
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !526, metadata !DIExpression()), !dbg !527
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !528, metadata !DIExpression()), !dbg !529
  store i32 %kn, i32* %kn.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %kn.addr, metadata !530, metadata !DIExpression()), !dbg !531
  %frombool = zext i1 %normalize to i8
  store i8 %frombool, i8* %normalize.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %normalize.addr, metadata !532, metadata !DIExpression()), !dbg !533
  %0 = load i32, i32* %kn.addr, align 4, !dbg !534
  %rem = srem i32 %0, 2, !dbg !534
  %cmp = icmp eq i32 %rem, 1, !dbg !534
  br i1 %cmp, label %if.then, label %if.else, !dbg !537, !cf.info !130

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !537

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.6, i64 0, i64 0), i32 223, i8* getelementptr inbounds ([106 x i8], [106 x i8]* @__PRETTY_FUNCTION__.convolution, i64 0, i64 0)) #7, !dbg !534
  unreachable, !dbg !534

if.end:                                           ; preds = %if.then
  %1 = load i32, i32* %nx.addr, align 4, !dbg !538
  %2 = load i32, i32* %kn.addr, align 4, !dbg !538
  %cmp1 = icmp sgt i32 %1, %2, !dbg !538
  br i1 %cmp1, label %land.lhs.true, label %if.else4, !dbg !538, !cf.info !130

land.lhs.true:                                    ; preds = %if.end
  %3 = load i32, i32* %ny.addr, align 4, !dbg !538
  %4 = load i32, i32* %kn.addr, align 4, !dbg !538
  %cmp2 = icmp sgt i32 %3, %4, !dbg !538
  br i1 %cmp2, label %if.then3, label %if.else4, !dbg !541, !cf.info !130

if.then3:                                         ; preds = %land.lhs.true
  br label %if.end5, !dbg !541

if.else4:                                         ; preds = %land.lhs.true, %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.6, i64 0, i64 0), i32 224, i8* getelementptr inbounds ([106 x i8], [106 x i8]* @__PRETTY_FUNCTION__.convolution, i64 0, i64 0)) #7, !dbg !538
  unreachable, !dbg !538

if.end5:                                          ; preds = %if.then3
  call void @llvm.dbg.declare(metadata i32* %khalf, metadata !542, metadata !DIExpression()), !dbg !543
  %5 = load i32, i32* %kn.addr, align 4, !dbg !544
  %div = sdiv i32 %5, 2, !dbg !545
  store i32 %div, i32* %khalf, align 4, !dbg !543
  call void @llvm.dbg.declare(metadata float* %min, metadata !546, metadata !DIExpression()), !dbg !547
  store float 0x47EFFFFFE0000000, float* %min, align 4, !dbg !547
  call void @llvm.dbg.declare(metadata float* %max, metadata !548, metadata !DIExpression()), !dbg !549
  store float 0xC7EFFFFFE0000000, float* %max, align 4, !dbg !549
  %6 = load i8, i8* %normalize.addr, align 1, !dbg !550
  %tobool = trunc i8 %6 to i1, !dbg !550
  br i1 %tobool, label %if.then6, label %if.end44, !dbg !552, !cf.info !130

if.then6:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %m, metadata !553, metadata !DIExpression()), !dbg !555
  %7 = load i32, i32* %khalf, align 4, !dbg !556
  store i32 %7, i32* %m, align 4, !dbg !555
  br label %for.cond, !dbg !557

for.cond:                                         ; preds = %for.inc41, %if.then6
  %8 = load i32, i32* %m, align 4, !dbg !558
  %9 = load i32, i32* %nx.addr, align 4, !dbg !560
  %10 = load i32, i32* %khalf, align 4, !dbg !561
  %sub = sub nsw i32 %9, %10, !dbg !562
  %cmp7 = icmp slt i32 %8, %sub, !dbg !563
  br i1 %cmp7, label %for.body, label %for.end43, !dbg !564

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %n, metadata !565, metadata !DIExpression()), !dbg !567
  %11 = load i32, i32* %khalf, align 4, !dbg !568
  store i32 %11, i32* %n, align 4, !dbg !567
  br label %for.cond8, !dbg !569

for.cond8:                                        ; preds = %for.inc38, %for.body
  %12 = load i32, i32* %n, align 4, !dbg !570
  %13 = load i32, i32* %ny.addr, align 4, !dbg !572
  %14 = load i32, i32* %khalf, align 4, !dbg !573
  %sub9 = sub nsw i32 %13, %14, !dbg !574
  %cmp10 = icmp slt i32 %12, %sub9, !dbg !575
  br i1 %cmp10, label %for.body11, label %for.end40, !dbg !576

for.body11:                                       ; preds = %for.cond8
  call void @llvm.dbg.declare(metadata float* %pixel, metadata !577, metadata !DIExpression()), !dbg !579
  store float 0.000000e+00, float* %pixel, align 4, !dbg !579
  call void @llvm.dbg.declare(metadata i64* %c, metadata !580, metadata !DIExpression()), !dbg !581
  store i64 0, i64* %c, align 8, !dbg !581
  call void @llvm.dbg.declare(metadata i32* %j, metadata !582, metadata !DIExpression()), !dbg !584
  %15 = load i32, i32* %khalf, align 4, !dbg !585
  %sub12 = sub nsw i32 0, %15, !dbg !586
  store i32 %sub12, i32* %j, align 4, !dbg !584
  br label %for.cond13, !dbg !587

for.cond13:                                       ; preds = %for.inc27, %for.body11
  %16 = load i32, i32* %j, align 4, !dbg !588
  %17 = load i32, i32* %khalf, align 4, !dbg !590
  %cmp14 = icmp sle i32 %16, %17, !dbg !591
  br i1 %cmp14, label %for.body15, label %for.end29, !dbg !592

for.body15:                                       ; preds = %for.cond13
  call void @llvm.dbg.declare(metadata i32* %i, metadata !593, metadata !DIExpression()), !dbg !595
  %18 = load i32, i32* %khalf, align 4, !dbg !596
  %sub16 = sub nsw i32 0, %18, !dbg !597
  store i32 %sub16, i32* %i, align 4, !dbg !595
  br label %for.cond17, !dbg !598

for.cond17:                                       ; preds = %for.inc, %for.body15
  %19 = load i32, i32* %i, align 4, !dbg !599
  %20 = load i32, i32* %khalf, align 4, !dbg !601
  %cmp18 = icmp sle i32 %19, %20, !dbg !602
  br i1 %cmp18, label %for.body19, label %for.end, !dbg !603

for.body19:                                       ; preds = %for.cond17
  %21 = load i16*, i16** %in.addr, align 8, !dbg !604
  %22 = load i32, i32* %n, align 4, !dbg !606
  %23 = load i32, i32* %j, align 4, !dbg !607
  %sub20 = sub nsw i32 %22, %23, !dbg !608
  %24 = load i32, i32* %nx.addr, align 4, !dbg !609
  %mul = mul nsw i32 %sub20, %24, !dbg !610
  %25 = load i32, i32* %m, align 4, !dbg !611
  %add = add nsw i32 %mul, %25, !dbg !612
  %26 = load i32, i32* %i, align 4, !dbg !613
  %sub21 = sub nsw i32 %add, %26, !dbg !614
  %idxprom = sext i32 %sub21 to i64, !dbg !604
  %arrayidx = getelementptr inbounds i16, i16* %21, i64 %idxprom, !dbg !604
  %27 = load i16, i16* %arrayidx, align 2, !dbg !604
  %conv = sext i16 %27 to i32, !dbg !604
  %conv22 = sitofp i32 %conv to float, !dbg !604
  %28 = load float*, float** %kernel.addr, align 8, !dbg !615
  %29 = load i64, i64* %c, align 8, !dbg !616
  %arrayidx23 = getelementptr inbounds float, float* %28, i64 %29, !dbg !615
  %30 = load float, float* %arrayidx23, align 4, !dbg !615
  %mul24 = fmul float %conv22, %30, !dbg !617
  %31 = load float, float* %pixel, align 4, !dbg !618
  %add25 = fadd float %31, %mul24, !dbg !618
  store float %add25, float* %pixel, align 4, !dbg !618
  %32 = load i64, i64* %c, align 8, !dbg !619
  %inc = add i64 %32, 1, !dbg !619
  store i64 %inc, i64* %c, align 8, !dbg !619
  br label %for.inc, !dbg !620

for.inc:                                          ; preds = %for.body19
  %33 = load i32, i32* %i, align 4, !dbg !621
  %inc26 = add nsw i32 %33, 1, !dbg !621
  store i32 %inc26, i32* %i, align 4, !dbg !621
  br label %for.cond17, !dbg !622, !llvm.loop !623

for.end:                                          ; preds = %for.cond17
  br label %for.inc27, !dbg !624

for.inc27:                                        ; preds = %for.end
  %34 = load i32, i32* %j, align 4, !dbg !625
  %inc28 = add nsw i32 %34, 1, !dbg !625
  store i32 %inc28, i32* %j, align 4, !dbg !625
  br label %for.cond13, !dbg !626, !llvm.loop !627

for.end29:                                        ; preds = %for.cond13
  %35 = load float, float* %pixel, align 4, !dbg !629
  %36 = load float, float* %min, align 4, !dbg !631
  %cmp30 = fcmp olt float %35, %36, !dbg !632
  br i1 %cmp30, label %if.then32, label %if.end33, !dbg !633, !cf.info !130

if.then32:                                        ; preds = %for.end29
  %37 = load float, float* %pixel, align 4, !dbg !634
  store float %37, float* %min, align 4, !dbg !635
  br label %if.end33, !dbg !636

if.end33:                                         ; preds = %if.then32, %for.end29
  %38 = load float, float* %pixel, align 4, !dbg !637
  %39 = load float, float* %max, align 4, !dbg !639
  %cmp34 = fcmp ogt float %38, %39, !dbg !640
  br i1 %cmp34, label %if.then36, label %if.end37, !dbg !641, !cf.info !130

if.then36:                                        ; preds = %if.end33
  %40 = load float, float* %pixel, align 4, !dbg !642
  store float %40, float* %max, align 4, !dbg !643
  br label %if.end37, !dbg !644

if.end37:                                         ; preds = %if.then36, %if.end33
  br label %for.inc38, !dbg !645

for.inc38:                                        ; preds = %if.end37
  %41 = load i32, i32* %n, align 4, !dbg !646
  %inc39 = add nsw i32 %41, 1, !dbg !646
  store i32 %inc39, i32* %n, align 4, !dbg !646
  br label %for.cond8, !dbg !647, !llvm.loop !648

for.end40:                                        ; preds = %for.cond8
  br label %for.inc41, !dbg !649

for.inc41:                                        ; preds = %for.end40
  %42 = load i32, i32* %m, align 4, !dbg !650
  %inc42 = add nsw i32 %42, 1, !dbg !650
  store i32 %inc42, i32* %m, align 4, !dbg !650
  br label %for.cond, !dbg !651, !llvm.loop !652

for.end43:                                        ; preds = %for.cond
  br label %if.end44, !dbg !653

if.end44:                                         ; preds = %for.end43, %if.end5
  call void @llvm.dbg.declare(metadata i32* %m45, metadata !654, metadata !DIExpression()), !dbg !656
  %43 = load i32, i32* %khalf, align 4, !dbg !657
  store i32 %43, i32* %m45, align 4, !dbg !656
  br label %for.cond46, !dbg !658

for.cond46:                                       ; preds = %for.inc104, %if.end44
  %44 = load i32, i32* %m45, align 4, !dbg !659
  %45 = load i32, i32* %nx.addr, align 4, !dbg !661
  %46 = load i32, i32* %khalf, align 4, !dbg !662
  %sub47 = sub nsw i32 %45, %46, !dbg !663
  %cmp48 = icmp slt i32 %44, %sub47, !dbg !664
  br i1 %cmp48, label %for.body50, label %for.end106, !dbg !665

for.body50:                                       ; preds = %for.cond46
  call void @llvm.dbg.declare(metadata i32* %n51, metadata !666, metadata !DIExpression()), !dbg !668
  %47 = load i32, i32* %khalf, align 4, !dbg !669
  store i32 %47, i32* %n51, align 4, !dbg !668
  br label %for.cond52, !dbg !670

for.cond52:                                       ; preds = %for.inc101, %for.body50
  %48 = load i32, i32* %n51, align 4, !dbg !671
  %49 = load i32, i32* %ny.addr, align 4, !dbg !673
  %50 = load i32, i32* %khalf, align 4, !dbg !674
  %sub53 = sub nsw i32 %49, %50, !dbg !675
  %cmp54 = icmp slt i32 %48, %sub53, !dbg !676
  br i1 %cmp54, label %for.body56, label %for.end103, !dbg !677

for.body56:                                       ; preds = %for.cond52
  call void @llvm.dbg.declare(metadata float* %pixel57, metadata !678, metadata !DIExpression()), !dbg !680
  store float 0.000000e+00, float* %pixel57, align 4, !dbg !680
  call void @llvm.dbg.declare(metadata i64* %c58, metadata !681, metadata !DIExpression()), !dbg !682
  store i64 0, i64* %c58, align 8, !dbg !682
  call void @llvm.dbg.declare(metadata i32* %j59, metadata !683, metadata !DIExpression()), !dbg !685
  %51 = load i32, i32* %khalf, align 4, !dbg !686
  %sub60 = sub nsw i32 0, %51, !dbg !687
  store i32 %sub60, i32* %j59, align 4, !dbg !685
  br label %for.cond61, !dbg !688

for.cond61:                                       ; preds = %for.inc86, %for.body56
  %52 = load i32, i32* %j59, align 4, !dbg !689
  %53 = load i32, i32* %khalf, align 4, !dbg !691
  %cmp62 = icmp sle i32 %52, %53, !dbg !692
  br i1 %cmp62, label %for.body64, label %for.end88, !dbg !693

for.body64:                                       ; preds = %for.cond61
  call void @llvm.dbg.declare(metadata i32* %i65, metadata !694, metadata !DIExpression()), !dbg !696
  %54 = load i32, i32* %khalf, align 4, !dbg !697
  %sub66 = sub nsw i32 0, %54, !dbg !698
  store i32 %sub66, i32* %i65, align 4, !dbg !696
  br label %for.cond67, !dbg !699

for.cond67:                                       ; preds = %for.inc83, %for.body64
  %55 = load i32, i32* %i65, align 4, !dbg !700
  %56 = load i32, i32* %khalf, align 4, !dbg !702
  %cmp68 = icmp sle i32 %55, %56, !dbg !703
  br i1 %cmp68, label %for.body70, label %for.end85, !dbg !704

for.body70:                                       ; preds = %for.cond67
  %57 = load i16*, i16** %in.addr, align 8, !dbg !705
  %58 = load i32, i32* %n51, align 4, !dbg !707
  %59 = load i32, i32* %j59, align 4, !dbg !708
  %sub71 = sub nsw i32 %58, %59, !dbg !709
  %60 = load i32, i32* %nx.addr, align 4, !dbg !710
  %mul72 = mul nsw i32 %sub71, %60, !dbg !711
  %61 = load i32, i32* %m45, align 4, !dbg !712
  %add73 = add nsw i32 %mul72, %61, !dbg !713
  %62 = load i32, i32* %i65, align 4, !dbg !714
  %sub74 = sub nsw i32 %add73, %62, !dbg !715
  %idxprom75 = sext i32 %sub74 to i64, !dbg !705
  %arrayidx76 = getelementptr inbounds i16, i16* %57, i64 %idxprom75, !dbg !705
  %63 = load i16, i16* %arrayidx76, align 2, !dbg !705
  %conv77 = sext i16 %63 to i32, !dbg !705
  %conv78 = sitofp i32 %conv77 to float, !dbg !705
  %64 = load float*, float** %kernel.addr, align 8, !dbg !716
  %65 = load i64, i64* %c58, align 8, !dbg !717
  %arrayidx79 = getelementptr inbounds float, float* %64, i64 %65, !dbg !716
  %66 = load float, float* %arrayidx79, align 4, !dbg !716
  %mul80 = fmul float %conv78, %66, !dbg !718
  %67 = load float, float* %pixel57, align 4, !dbg !719
  %add81 = fadd float %67, %mul80, !dbg !719
  store float %add81, float* %pixel57, align 4, !dbg !719
  %68 = load i64, i64* %c58, align 8, !dbg !720
  %inc82 = add i64 %68, 1, !dbg !720
  store i64 %inc82, i64* %c58, align 8, !dbg !720
  br label %for.inc83, !dbg !721

for.inc83:                                        ; preds = %for.body70
  %69 = load i32, i32* %i65, align 4, !dbg !722
  %inc84 = add nsw i32 %69, 1, !dbg !722
  store i32 %inc84, i32* %i65, align 4, !dbg !722
  br label %for.cond67, !dbg !723, !llvm.loop !724

for.end85:                                        ; preds = %for.cond67
  br label %for.inc86, !dbg !725

for.inc86:                                        ; preds = %for.end85
  %70 = load i32, i32* %j59, align 4, !dbg !726
  %inc87 = add nsw i32 %70, 1, !dbg !726
  store i32 %inc87, i32* %j59, align 4, !dbg !726
  br label %for.cond61, !dbg !727, !llvm.loop !728

for.end88:                                        ; preds = %for.cond61
  %71 = load i8, i8* %normalize.addr, align 1, !dbg !730
  %tobool89 = trunc i8 %71 to i1, !dbg !730
  br i1 %tobool89, label %if.then90, label %if.end95, !dbg !732, !cf.info !130

if.then90:                                        ; preds = %for.end88
  %72 = load float, float* %pixel57, align 4, !dbg !733
  %73 = load float, float* %min, align 4, !dbg !734
  %sub91 = fsub float %72, %73, !dbg !735
  %mul92 = fmul float 2.550000e+02, %sub91, !dbg !736
  %74 = load float, float* %max, align 4, !dbg !737
  %75 = load float, float* %min, align 4, !dbg !738
  %sub93 = fsub float %74, %75, !dbg !739
  %div94 = fdiv float %mul92, %sub93, !dbg !740
  store float %div94, float* %pixel57, align 4, !dbg !741
  br label %if.end95, !dbg !742

if.end95:                                         ; preds = %if.then90, %for.end88
  %76 = load float, float* %pixel57, align 4, !dbg !743
  %conv96 = fptosi float %76 to i16, !dbg !744
  %77 = load i16*, i16** %out.addr, align 8, !dbg !745
  %78 = load i32, i32* %n51, align 4, !dbg !746
  %79 = load i32, i32* %nx.addr, align 4, !dbg !747
  %mul97 = mul nsw i32 %78, %79, !dbg !748
  %80 = load i32, i32* %m45, align 4, !dbg !749
  %add98 = add nsw i32 %mul97, %80, !dbg !750
  %idxprom99 = sext i32 %add98 to i64, !dbg !745
  %arrayidx100 = getelementptr inbounds i16, i16* %77, i64 %idxprom99, !dbg !745
  store i16 %conv96, i16* %arrayidx100, align 2, !dbg !751
  br label %for.inc101, !dbg !752

for.inc101:                                       ; preds = %if.end95
  %81 = load i32, i32* %n51, align 4, !dbg !753
  %inc102 = add nsw i32 %81, 1, !dbg !753
  store i32 %inc102, i32* %n51, align 4, !dbg !753
  br label %for.cond52, !dbg !754, !llvm.loop !755

for.end103:                                       ; preds = %for.cond52
  br label %for.inc104, !dbg !756

for.inc104:                                       ; preds = %for.end103
  %82 = load i32, i32* %m45, align 4, !dbg !757
  %inc105 = add nsw i32 %82, 1, !dbg !757
  store i32 %inc105, i32* %m45, align 4, !dbg !757
  br label %for.cond46, !dbg !758, !llvm.loop !759

for.end106:                                       ; preds = %for.cond46
  ret void, !dbg !761
}

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @gaussian_filter(i16* %in, i16* %out, i32 %nx, i32 %ny, float %sigma) #0 !dbg !762 {
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
  call void @llvm.dbg.declare(metadata i16** %in.addr, metadata !765, metadata !DIExpression()), !dbg !766
  store i16* %out, i16** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i16** %out.addr, metadata !767, metadata !DIExpression()), !dbg !768
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !769, metadata !DIExpression()), !dbg !770
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !771, metadata !DIExpression()), !dbg !772
  store float %sigma, float* %sigma.addr, align 4
  call void @llvm.dbg.declare(metadata float* %sigma.addr, metadata !773, metadata !DIExpression()), !dbg !774
  call void @llvm.dbg.declare(metadata i32* %n, metadata !775, metadata !DIExpression()), !dbg !776
  %0 = load float, float* %sigma.addr, align 4, !dbg !777
  %mul = fmul float 2.000000e+00, %0, !dbg !778
  %conv = fptosi float %mul to i32, !dbg !779
  %mul1 = mul nsw i32 2, %conv, !dbg !780
  %add = add nsw i32 %mul1, 3, !dbg !781
  store i32 %add, i32* %n, align 4, !dbg !776
  call void @llvm.dbg.declare(metadata float* %mean, metadata !782, metadata !DIExpression()), !dbg !783
  %1 = load i32, i32* %n, align 4, !dbg !784
  %conv2 = sitofp i32 %1 to double, !dbg !784
  %div = fdiv double %conv2, 2.000000e+00, !dbg !785
  %2 = call double @llvm.floor.f64(double %div), !dbg !786
  %conv3 = fptrunc double %2 to float, !dbg !787
  store float %conv3, float* %mean, align 4, !dbg !783
  %3 = load i32, i32* %n, align 4, !dbg !788
  %4 = load i32, i32* %n, align 4, !dbg !789
  %mul4 = mul nsw i32 %3, %4, !dbg !790
  %5 = zext i32 %mul4 to i64, !dbg !791
  %6 = call i8* @llvm.stacksave(), !dbg !791
  store i8* %6, i8** %saved_stack, align 8, !dbg !791
  %vla = alloca float, i64 %5, align 16, !dbg !791
  store i64 %5, i64* %__vla_expr0, align 8, !dbg !791
  call void @llvm.dbg.declare(metadata i64* %__vla_expr0, metadata !792, metadata !DIExpression()), !dbg !793
  call void @llvm.dbg.declare(metadata float* %vla, metadata !794, metadata !DIExpression()), !dbg !798
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !799
  %8 = load i32, i32* %n, align 4, !dbg !800
  %9 = load float, float* %sigma.addr, align 4, !dbg !801
  %conv5 = fpext float %9 to double, !dbg !801
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.8, i64 0, i64 0), i32 %8, double %conv5), !dbg !802
  call void @llvm.dbg.declare(metadata i64* %c, metadata !803, metadata !DIExpression()), !dbg !804
  store i64 0, i64* %c, align 8, !dbg !804
  call void @llvm.dbg.declare(metadata i32* %i, metadata !805, metadata !DIExpression()), !dbg !807
  store i32 0, i32* %i, align 4, !dbg !807
  br label %for.cond, !dbg !808

for.cond:                                         ; preds = %for.inc30, %entry
  %10 = load i32, i32* %i, align 4, !dbg !809
  %11 = load i32, i32* %n, align 4, !dbg !811
  %cmp = icmp slt i32 %10, %11, !dbg !812
  br i1 %cmp, label %for.body, label %for.end32, !dbg !813

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !814, metadata !DIExpression()), !dbg !816
  store i32 0, i32* %j, align 4, !dbg !816
  br label %for.cond7, !dbg !817

for.cond7:                                        ; preds = %for.inc, %for.body
  %12 = load i32, i32* %j, align 4, !dbg !818
  %13 = load i32, i32* %n, align 4, !dbg !820
  %cmp8 = icmp slt i32 %12, %13, !dbg !821
  br i1 %cmp8, label %for.body10, label %for.end, !dbg !822

for.body10:                                       ; preds = %for.cond7
  %14 = load i32, i32* %i, align 4, !dbg !823
  %conv11 = sitofp i32 %14 to float, !dbg !823
  %15 = load float, float* %mean, align 4, !dbg !825
  %sub = fsub float %conv11, %15, !dbg !826
  %16 = load float, float* %sigma.addr, align 4, !dbg !827
  %div12 = fdiv float %sub, %16, !dbg !828
  %conv13 = fpext float %div12 to double, !dbg !829
  %call14 = call double @pow(double %conv13, double 2.000000e+00) #6, !dbg !830
  %17 = load i32, i32* %j, align 4, !dbg !831
  %conv15 = sitofp i32 %17 to float, !dbg !831
  %18 = load float, float* %mean, align 4, !dbg !832
  %sub16 = fsub float %conv15, %18, !dbg !833
  %19 = load float, float* %sigma.addr, align 4, !dbg !834
  %div17 = fdiv float %sub16, %19, !dbg !835
  %conv18 = fpext float %div17 to double, !dbg !836
  %call19 = call double @pow(double %conv18, double 2.000000e+00) #6, !dbg !837
  %add20 = fadd double %call14, %call19, !dbg !838
  %mul21 = fmul double -5.000000e-01, %add20, !dbg !839
  %call22 = call double @exp(double %mul21) #6, !dbg !840
  %20 = load float, float* %sigma.addr, align 4, !dbg !841
  %conv23 = fpext float %20 to double, !dbg !841
  %mul24 = fmul double 0x401921FB54442D18, %conv23, !dbg !842
  %21 = load float, float* %sigma.addr, align 4, !dbg !843
  %conv25 = fpext float %21 to double, !dbg !843
  %mul26 = fmul double %mul24, %conv25, !dbg !844
  %div27 = fdiv double %call22, %mul26, !dbg !845
  %conv28 = fptrunc double %div27 to float, !dbg !840
  %22 = load i64, i64* %c, align 8, !dbg !846
  %arrayidx = getelementptr inbounds float, float* %vla, i64 %22, !dbg !847
  store float %conv28, float* %arrayidx, align 4, !dbg !848
  %23 = load i64, i64* %c, align 8, !dbg !849
  %inc = add i64 %23, 1, !dbg !849
  store i64 %inc, i64* %c, align 8, !dbg !849
  br label %for.inc, !dbg !850

for.inc:                                          ; preds = %for.body10
  %24 = load i32, i32* %j, align 4, !dbg !851
  %inc29 = add nsw i32 %24, 1, !dbg !851
  store i32 %inc29, i32* %j, align 4, !dbg !851
  br label %for.cond7, !dbg !852, !llvm.loop !853

for.end:                                          ; preds = %for.cond7
  br label %for.inc30, !dbg !854

for.inc30:                                        ; preds = %for.end
  %25 = load i32, i32* %i, align 4, !dbg !855
  %inc31 = add nsw i32 %25, 1, !dbg !855
  store i32 %inc31, i32* %i, align 4, !dbg !855
  br label %for.cond, !dbg !856, !llvm.loop !857

for.end32:                                        ; preds = %for.cond
  %26 = load i16*, i16** %in.addr, align 8, !dbg !859
  %27 = load i16*, i16** %out.addr, align 8, !dbg !860
  %28 = load i32, i32* %nx.addr, align 4, !dbg !861
  %29 = load i32, i32* %ny.addr, align 4, !dbg !862
  %30 = load i32, i32* %n, align 4, !dbg !863
  call void @convolution(i16* %26, i16* %27, float* %vla, i32 %28, i32 %29, i32 %30, i1 zeroext true), !dbg !864
  %31 = load i8*, i8** %saved_stack, align 8, !dbg !865
  call void @llvm.stackrestore(i8* %31), !dbg !865
  ret void, !dbg !865
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
define dso_local i16* @canny_edge_detection(i16* %in, %struct.bitmap_info_header_t* %bmp_ih, i32 %tmin, i32 %tmax, float %sigma) #0 !dbg !866 {
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
  call void @llvm.dbg.declare(metadata i16** %in.addr, metadata !869, metadata !DIExpression()), !dbg !870
  store %struct.bitmap_info_header_t* %bmp_ih, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.bitmap_info_header_t** %bmp_ih.addr, metadata !871, metadata !DIExpression()), !dbg !872
  store i32 %tmin, i32* %tmin.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %tmin.addr, metadata !873, metadata !DIExpression()), !dbg !874
  store i32 %tmax, i32* %tmax.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %tmax.addr, metadata !875, metadata !DIExpression()), !dbg !876
  store float %sigma, float* %sigma.addr, align 4
  call void @llvm.dbg.declare(metadata float* %sigma.addr, metadata !877, metadata !DIExpression()), !dbg !878
  call void @llvm.dbg.declare(metadata i32* %nx, metadata !879, metadata !DIExpression()), !dbg !880
  %0 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !881
  %width = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %0, i32 0, i32 1, !dbg !882
  %1 = load i32, i32* %width, align 4, !dbg !882
  store i32 %1, i32* %nx, align 4, !dbg !880
  call void @llvm.dbg.declare(metadata i32* %ny, metadata !883, metadata !DIExpression()), !dbg !884
  %2 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !885
  %height = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %2, i32 0, i32 2, !dbg !886
  %3 = load i32, i32* %height, align 4, !dbg !886
  store i32 %3, i32* %ny, align 4, !dbg !884
  call void @llvm.dbg.declare(metadata i16** %G, metadata !887, metadata !DIExpression()), !dbg !888
  %4 = load i32, i32* %nx, align 4, !dbg !889
  %5 = load i32, i32* %ny, align 4, !dbg !890
  %mul = mul nsw i32 %4, %5, !dbg !891
  %conv = sext i32 %mul to i64, !dbg !889
  %mul1 = mul i64 %conv, 2, !dbg !892
  %call = call noalias i8* @calloc(i64 %mul1, i64 1) #6, !dbg !893
  %6 = bitcast i8* %call to i16*, !dbg !893
  store i16* %6, i16** %G, align 8, !dbg !888
  call void @llvm.dbg.declare(metadata i16** %after_Gx, metadata !894, metadata !DIExpression()), !dbg !895
  %7 = load i32, i32* %nx, align 4, !dbg !896
  %8 = load i32, i32* %ny, align 4, !dbg !897
  %mul2 = mul nsw i32 %7, %8, !dbg !898
  %conv3 = sext i32 %mul2 to i64, !dbg !896
  %mul4 = mul i64 %conv3, 2, !dbg !899
  %call5 = call noalias i8* @calloc(i64 %mul4, i64 1) #6, !dbg !900
  %9 = bitcast i8* %call5 to i16*, !dbg !900
  store i16* %9, i16** %after_Gx, align 8, !dbg !895
  call void @llvm.dbg.declare(metadata i16** %after_Gy, metadata !901, metadata !DIExpression()), !dbg !902
  %10 = load i32, i32* %nx, align 4, !dbg !903
  %11 = load i32, i32* %ny, align 4, !dbg !904
  %mul6 = mul nsw i32 %10, %11, !dbg !905
  %conv7 = sext i32 %mul6 to i64, !dbg !903
  %mul8 = mul i64 %conv7, 2, !dbg !906
  %call9 = call noalias i8* @calloc(i64 %mul8, i64 1) #6, !dbg !907
  %12 = bitcast i8* %call9 to i16*, !dbg !907
  store i16* %12, i16** %after_Gy, align 8, !dbg !902
  call void @llvm.dbg.declare(metadata i16** %nms, metadata !908, metadata !DIExpression()), !dbg !909
  %13 = load i32, i32* %nx, align 4, !dbg !910
  %14 = load i32, i32* %ny, align 4, !dbg !911
  %mul10 = mul nsw i32 %13, %14, !dbg !912
  %conv11 = sext i32 %mul10 to i64, !dbg !910
  %mul12 = mul i64 %conv11, 2, !dbg !913
  %call13 = call noalias i8* @calloc(i64 %mul12, i64 1) #6, !dbg !914
  %15 = bitcast i8* %call13 to i16*, !dbg !914
  store i16* %15, i16** %nms, align 8, !dbg !909
  call void @llvm.dbg.declare(metadata i16** %out, metadata !915, metadata !DIExpression()), !dbg !916
  %16 = load %struct.bitmap_info_header_t*, %struct.bitmap_info_header_t** %bmp_ih.addr, align 8, !dbg !917
  %bmp_bytesz = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %16, i32 0, i32 6, !dbg !918
  %17 = load i32, i32* %bmp_bytesz, align 4, !dbg !918
  %conv14 = zext i32 %17 to i64, !dbg !917
  %mul15 = mul i64 %conv14, 2, !dbg !919
  %call16 = call noalias i8* @malloc(i64 %mul15) #6, !dbg !920
  %18 = bitcast i8* %call16 to i16*, !dbg !920
  store i16* %18, i16** %out, align 8, !dbg !916
  %19 = load i16*, i16** %G, align 8, !dbg !921
  %cmp = icmp eq i16* %19, null, !dbg !923
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !924, !cf.info !130

lor.lhs.false:                                    ; preds = %entry
  %20 = load i16*, i16** %after_Gx, align 8, !dbg !925
  %cmp18 = icmp eq i16* %20, null, !dbg !926
  br i1 %cmp18, label %if.then, label %lor.lhs.false20, !dbg !927, !cf.info !130

lor.lhs.false20:                                  ; preds = %lor.lhs.false
  %21 = load i16*, i16** %after_Gy, align 8, !dbg !928
  %cmp21 = icmp eq i16* %21, null, !dbg !929
  br i1 %cmp21, label %if.then, label %lor.lhs.false23, !dbg !930, !cf.info !130

lor.lhs.false23:                                  ; preds = %lor.lhs.false20
  %22 = load i16*, i16** %nms, align 8, !dbg !931
  %cmp24 = icmp eq i16* %22, null, !dbg !932
  br i1 %cmp24, label %if.then, label %lor.lhs.false26, !dbg !933, !cf.info !130

lor.lhs.false26:                                  ; preds = %lor.lhs.false23
  %23 = load i16*, i16** %out, align 8, !dbg !934
  %cmp27 = icmp eq i16* %23, null, !dbg !935
  br i1 %cmp27, label %if.then, label %if.end, !dbg !936, !cf.info !130

if.then:                                          ; preds = %lor.lhs.false26, %lor.lhs.false23, %lor.lhs.false20, %lor.lhs.false, %entry
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !937
  %call29 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.9, i64 0, i64 0)), !dbg !939
  call void @exit(i32 1) #7, !dbg !940
  unreachable, !dbg !940

if.end:                                           ; preds = %lor.lhs.false26
  %25 = load i16*, i16** %in.addr, align 8, !dbg !941
  %26 = load i16*, i16** %out, align 8, !dbg !942
  %27 = load i32, i32* %nx, align 4, !dbg !943
  %28 = load i32, i32* %ny, align 4, !dbg !944
  %29 = load float, float* %sigma.addr, align 4, !dbg !945
  call void @gaussian_filter(i16* %25, i16* %26, i32 %27, i32 %28, float %29), !dbg !946
  call void @llvm.dbg.declare(metadata [9 x float]* %Gx, metadata !947, metadata !DIExpression()), !dbg !951
  %30 = bitcast [9 x float]* %Gx to i8*, !dbg !951
  call void @llvm.memset.p0i8.i64(i8* align 16 %30, i8 0, i64 36, i1 false), !dbg !951
  %31 = bitcast i8* %30 to [9 x float]*, !dbg !951
  %32 = getelementptr inbounds [9 x float], [9 x float]* %31, i32 0, i32 0, !dbg !951
  store float -1.000000e+00, float* %32, align 16, !dbg !951
  %33 = getelementptr inbounds [9 x float], [9 x float]* %31, i32 0, i32 2, !dbg !951
  store float 1.000000e+00, float* %33, align 8, !dbg !951
  %34 = getelementptr inbounds [9 x float], [9 x float]* %31, i32 0, i32 3, !dbg !951
  store float -2.000000e+00, float* %34, align 4, !dbg !951
  %35 = getelementptr inbounds [9 x float], [9 x float]* %31, i32 0, i32 5, !dbg !951
  store float 2.000000e+00, float* %35, align 4, !dbg !951
  %36 = getelementptr inbounds [9 x float], [9 x float]* %31, i32 0, i32 6, !dbg !951
  store float -1.000000e+00, float* %36, align 8, !dbg !951
  %37 = getelementptr inbounds [9 x float], [9 x float]* %31, i32 0, i32 8, !dbg !951
  store float 1.000000e+00, float* %37, align 16, !dbg !951
  %38 = load i16*, i16** %out, align 8, !dbg !952
  %39 = load i16*, i16** %after_Gx, align 8, !dbg !953
  %arraydecay = getelementptr inbounds [9 x float], [9 x float]* %Gx, i64 0, i64 0, !dbg !954
  %40 = load i32, i32* %nx, align 4, !dbg !955
  %41 = load i32, i32* %ny, align 4, !dbg !956
  call void @convolution(i16* %38, i16* %39, float* %arraydecay, i32 %40, i32 %41, i32 3, i1 zeroext false), !dbg !957
  call void @llvm.dbg.declare(metadata [9 x float]* %Gy, metadata !958, metadata !DIExpression()), !dbg !959
  %42 = bitcast [9 x float]* %Gy to i8*, !dbg !959
  call void @llvm.memset.p0i8.i64(i8* align 16 %42, i8 0, i64 36, i1 false), !dbg !959
  %43 = bitcast i8* %42 to [9 x float]*, !dbg !959
  %44 = getelementptr inbounds [9 x float], [9 x float]* %43, i32 0, i32 0, !dbg !959
  store float 1.000000e+00, float* %44, align 16, !dbg !959
  %45 = getelementptr inbounds [9 x float], [9 x float]* %43, i32 0, i32 1, !dbg !959
  store float 2.000000e+00, float* %45, align 4, !dbg !959
  %46 = getelementptr inbounds [9 x float], [9 x float]* %43, i32 0, i32 2, !dbg !959
  store float 1.000000e+00, float* %46, align 8, !dbg !959
  %47 = getelementptr inbounds [9 x float], [9 x float]* %43, i32 0, i32 6, !dbg !959
  store float -1.000000e+00, float* %47, align 8, !dbg !959
  %48 = getelementptr inbounds [9 x float], [9 x float]* %43, i32 0, i32 7, !dbg !959
  store float -2.000000e+00, float* %48, align 4, !dbg !959
  %49 = getelementptr inbounds [9 x float], [9 x float]* %43, i32 0, i32 8, !dbg !959
  store float -1.000000e+00, float* %49, align 16, !dbg !959
  %50 = load i16*, i16** %out, align 8, !dbg !960
  %51 = load i16*, i16** %after_Gy, align 8, !dbg !961
  %arraydecay30 = getelementptr inbounds [9 x float], [9 x float]* %Gy, i64 0, i64 0, !dbg !962
  %52 = load i32, i32* %nx, align 4, !dbg !963
  %53 = load i32, i32* %ny, align 4, !dbg !964
  call void @convolution(i16* %50, i16* %51, float* %arraydecay30, i32 %52, i32 %53, i32 3, i1 zeroext false), !dbg !965
  call void @llvm.dbg.declare(metadata i32* %i, metadata !966, metadata !DIExpression()), !dbg !968
  store i32 1, i32* %i, align 4, !dbg !968
  br label %for.cond, !dbg !969

for.cond:                                         ; preds = %for.inc47, %if.end
  %54 = load i32, i32* %i, align 4, !dbg !970
  %55 = load i32, i32* %nx, align 4, !dbg !972
  %sub = sub nsw i32 %55, 1, !dbg !973
  %cmp31 = icmp slt i32 %54, %sub, !dbg !974
  br i1 %cmp31, label %for.body, label %for.end49, !dbg !975

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !976, metadata !DIExpression()), !dbg !978
  store i32 1, i32* %j, align 4, !dbg !978
  br label %for.cond33, !dbg !979

for.cond33:                                       ; preds = %for.inc, %for.body
  %56 = load i32, i32* %j, align 4, !dbg !980
  %57 = load i32, i32* %ny, align 4, !dbg !982
  %sub34 = sub nsw i32 %57, 1, !dbg !983
  %cmp35 = icmp slt i32 %56, %sub34, !dbg !984
  br i1 %cmp35, label %for.body37, label %for.end, !dbg !985

for.body37:                                       ; preds = %for.cond33
  call void @llvm.dbg.declare(metadata i32* %c, metadata !986, metadata !DIExpression()), !dbg !988
  %58 = load i32, i32* %i, align 4, !dbg !989
  %59 = load i32, i32* %nx, align 4, !dbg !990
  %60 = load i32, i32* %j, align 4, !dbg !991
  %mul38 = mul nsw i32 %59, %60, !dbg !992
  %add = add nsw i32 %58, %mul38, !dbg !993
  store i32 %add, i32* %c, align 4, !dbg !988
  %61 = load i16*, i16** %after_Gx, align 8, !dbg !994
  %62 = load i32, i32* %c, align 4, !dbg !995
  %idxprom = sext i32 %62 to i64, !dbg !994
  %arrayidx = getelementptr inbounds i16, i16* %61, i64 %idxprom, !dbg !994
  %63 = load i16, i16* %arrayidx, align 2, !dbg !994
  %conv39 = sitofp i16 %63 to double, !dbg !994
  %64 = load i16*, i16** %after_Gy, align 8, !dbg !996
  %65 = load i32, i32* %c, align 4, !dbg !997
  %idxprom40 = sext i32 %65 to i64, !dbg !996
  %arrayidx41 = getelementptr inbounds i16, i16* %64, i64 %idxprom40, !dbg !996
  %66 = load i16, i16* %arrayidx41, align 2, !dbg !996
  %conv42 = sitofp i16 %66 to double, !dbg !996
  %call43 = call double @hypot(double %conv39, double %conv42) #6, !dbg !998
  %conv44 = fptosi double %call43 to i16, !dbg !999
  %67 = load i16*, i16** %G, align 8, !dbg !1000
  %68 = load i32, i32* %c, align 4, !dbg !1001
  %idxprom45 = sext i32 %68 to i64, !dbg !1000
  %arrayidx46 = getelementptr inbounds i16, i16* %67, i64 %idxprom45, !dbg !1000
  store i16 %conv44, i16* %arrayidx46, align 2, !dbg !1002
  br label %for.inc, !dbg !1003

for.inc:                                          ; preds = %for.body37
  %69 = load i32, i32* %j, align 4, !dbg !1004
  %inc = add nsw i32 %69, 1, !dbg !1004
  store i32 %inc, i32* %j, align 4, !dbg !1004
  br label %for.cond33, !dbg !1005, !llvm.loop !1006

for.end:                                          ; preds = %for.cond33
  br label %for.inc47, !dbg !1007

for.inc47:                                        ; preds = %for.end
  %70 = load i32, i32* %i, align 4, !dbg !1008
  %inc48 = add nsw i32 %70, 1, !dbg !1008
  store i32 %inc48, i32* %i, align 4, !dbg !1008
  br label %for.cond, !dbg !1009, !llvm.loop !1010

for.end49:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i50, metadata !1012, metadata !DIExpression()), !dbg !1014
  store i32 1, i32* %i50, align 4, !dbg !1014
  br label %for.cond51, !dbg !1015

for.cond51:                                       ; preds = %for.inc189, %for.end49
  %71 = load i32, i32* %i50, align 4, !dbg !1016
  %72 = load i32, i32* %nx, align 4, !dbg !1018
  %sub52 = sub nsw i32 %72, 1, !dbg !1019
  %cmp53 = icmp slt i32 %71, %sub52, !dbg !1020
  br i1 %cmp53, label %for.body55, label %for.end191, !dbg !1021

for.body55:                                       ; preds = %for.cond51
  call void @llvm.dbg.declare(metadata i32* %j56, metadata !1022, metadata !DIExpression()), !dbg !1024
  store i32 1, i32* %j56, align 4, !dbg !1024
  br label %for.cond57, !dbg !1025

for.cond57:                                       ; preds = %for.inc186, %for.body55
  %73 = load i32, i32* %j56, align 4, !dbg !1026
  %74 = load i32, i32* %ny, align 4, !dbg !1028
  %sub58 = sub nsw i32 %74, 1, !dbg !1029
  %cmp59 = icmp slt i32 %73, %sub58, !dbg !1030
  br i1 %cmp59, label %for.body61, label %for.end188, !dbg !1031

for.body61:                                       ; preds = %for.cond57
  call void @llvm.dbg.declare(metadata i32* %c62, metadata !1032, metadata !DIExpression()), !dbg !1034
  %75 = load i32, i32* %i50, align 4, !dbg !1035
  %76 = load i32, i32* %nx, align 4, !dbg !1036
  %77 = load i32, i32* %j56, align 4, !dbg !1037
  %mul63 = mul nsw i32 %76, %77, !dbg !1038
  %add64 = add nsw i32 %75, %mul63, !dbg !1039
  store i32 %add64, i32* %c62, align 4, !dbg !1034
  call void @llvm.dbg.declare(metadata i32* %nn, metadata !1040, metadata !DIExpression()), !dbg !1041
  %78 = load i32, i32* %c62, align 4, !dbg !1042
  %79 = load i32, i32* %nx, align 4, !dbg !1043
  %sub65 = sub nsw i32 %78, %79, !dbg !1044
  store i32 %sub65, i32* %nn, align 4, !dbg !1041
  call void @llvm.dbg.declare(metadata i32* %ss, metadata !1045, metadata !DIExpression()), !dbg !1046
  %80 = load i32, i32* %c62, align 4, !dbg !1047
  %81 = load i32, i32* %nx, align 4, !dbg !1048
  %add66 = add nsw i32 %80, %81, !dbg !1049
  store i32 %add66, i32* %ss, align 4, !dbg !1046
  call void @llvm.dbg.declare(metadata i32* %ww, metadata !1050, metadata !DIExpression()), !dbg !1051
  %82 = load i32, i32* %c62, align 4, !dbg !1052
  %add67 = add nsw i32 %82, 1, !dbg !1053
  store i32 %add67, i32* %ww, align 4, !dbg !1051
  call void @llvm.dbg.declare(metadata i32* %ee, metadata !1054, metadata !DIExpression()), !dbg !1055
  %83 = load i32, i32* %c62, align 4, !dbg !1056
  %sub68 = sub nsw i32 %83, 1, !dbg !1057
  store i32 %sub68, i32* %ee, align 4, !dbg !1055
  call void @llvm.dbg.declare(metadata i32* %nw, metadata !1058, metadata !DIExpression()), !dbg !1059
  %84 = load i32, i32* %nn, align 4, !dbg !1060
  %add69 = add nsw i32 %84, 1, !dbg !1061
  store i32 %add69, i32* %nw, align 4, !dbg !1059
  call void @llvm.dbg.declare(metadata i32* %ne, metadata !1062, metadata !DIExpression()), !dbg !1063
  %85 = load i32, i32* %nn, align 4, !dbg !1064
  %sub70 = sub nsw i32 %85, 1, !dbg !1065
  store i32 %sub70, i32* %ne, align 4, !dbg !1063
  call void @llvm.dbg.declare(metadata i32* %sw, metadata !1066, metadata !DIExpression()), !dbg !1067
  %86 = load i32, i32* %ss, align 4, !dbg !1068
  %add71 = add nsw i32 %86, 1, !dbg !1069
  store i32 %add71, i32* %sw, align 4, !dbg !1067
  call void @llvm.dbg.declare(metadata i32* %se, metadata !1070, metadata !DIExpression()), !dbg !1071
  %87 = load i32, i32* %ss, align 4, !dbg !1072
  %sub72 = sub nsw i32 %87, 1, !dbg !1073
  store i32 %sub72, i32* %se, align 4, !dbg !1071
  call void @llvm.dbg.declare(metadata float* %dir, metadata !1074, metadata !DIExpression()), !dbg !1075
  %88 = load i16*, i16** %after_Gy, align 8, !dbg !1076
  %89 = load i32, i32* %c62, align 4, !dbg !1077
  %idxprom73 = sext i32 %89 to i64, !dbg !1076
  %arrayidx74 = getelementptr inbounds i16, i16* %88, i64 %idxprom73, !dbg !1076
  %90 = load i16, i16* %arrayidx74, align 2, !dbg !1076
  %conv75 = sitofp i16 %90 to double, !dbg !1076
  %91 = load i16*, i16** %after_Gx, align 8, !dbg !1078
  %92 = load i32, i32* %c62, align 4, !dbg !1079
  %idxprom76 = sext i32 %92 to i64, !dbg !1078
  %arrayidx77 = getelementptr inbounds i16, i16* %91, i64 %idxprom76, !dbg !1078
  %93 = load i16, i16* %arrayidx77, align 2, !dbg !1078
  %conv78 = sitofp i16 %93 to double, !dbg !1078
  %call79 = call double @atan2(double %conv75, double %conv78) #6, !dbg !1080
  %add80 = fadd double %call79, 0x400921FB54442D18, !dbg !1081
  %call81 = call double @fmod(double %add80, double 0x400921FB54442D18) #6, !dbg !1082
  %div = fdiv double %call81, 0x400921FB54442D18, !dbg !1083
  %conv82 = fptrunc double %div to float, !dbg !1084
  %mul83 = fmul float %conv82, 8.000000e+00, !dbg !1085
  store float %mul83, float* %dir, align 4, !dbg !1075
  %94 = load float, float* %dir, align 4, !dbg !1086
  %cmp84 = fcmp ole float %94, 1.000000e+00, !dbg !1088
  br i1 %cmp84, label %land.lhs.true, label %lor.lhs.false86, !dbg !1089, !cf.info !130

lor.lhs.false86:                                  ; preds = %for.body61
  %95 = load float, float* %dir, align 4, !dbg !1090
  %cmp87 = fcmp ogt float %95, 7.000000e+00, !dbg !1091
  br i1 %cmp87, label %land.lhs.true, label %lor.lhs.false106, !dbg !1092, !cf.info !130

land.lhs.true:                                    ; preds = %lor.lhs.false86, %for.body61
  %96 = load i16*, i16** %G, align 8, !dbg !1093
  %97 = load i32, i32* %c62, align 4, !dbg !1094
  %idxprom89 = sext i32 %97 to i64, !dbg !1093
  %arrayidx90 = getelementptr inbounds i16, i16* %96, i64 %idxprom89, !dbg !1093
  %98 = load i16, i16* %arrayidx90, align 2, !dbg !1093
  %conv91 = sext i16 %98 to i32, !dbg !1093
  %99 = load i16*, i16** %G, align 8, !dbg !1095
  %100 = load i32, i32* %ee, align 4, !dbg !1096
  %idxprom92 = sext i32 %100 to i64, !dbg !1095
  %arrayidx93 = getelementptr inbounds i16, i16* %99, i64 %idxprom92, !dbg !1095
  %101 = load i16, i16* %arrayidx93, align 2, !dbg !1095
  %conv94 = sext i16 %101 to i32, !dbg !1095
  %cmp95 = icmp sgt i32 %conv91, %conv94, !dbg !1097
  br i1 %cmp95, label %land.lhs.true97, label %lor.lhs.false106, !dbg !1098, !cf.info !130

land.lhs.true97:                                  ; preds = %land.lhs.true
  %102 = load i16*, i16** %G, align 8, !dbg !1099
  %103 = load i32, i32* %c62, align 4, !dbg !1100
  %idxprom98 = sext i32 %103 to i64, !dbg !1099
  %arrayidx99 = getelementptr inbounds i16, i16* %102, i64 %idxprom98, !dbg !1099
  %104 = load i16, i16* %arrayidx99, align 2, !dbg !1099
  %conv100 = sext i16 %104 to i32, !dbg !1099
  %105 = load i16*, i16** %G, align 8, !dbg !1101
  %106 = load i32, i32* %ww, align 4, !dbg !1102
  %idxprom101 = sext i32 %106 to i64, !dbg !1101
  %arrayidx102 = getelementptr inbounds i16, i16* %105, i64 %idxprom101, !dbg !1101
  %107 = load i16, i16* %arrayidx102, align 2, !dbg !1101
  %conv103 = sext i16 %107 to i32, !dbg !1101
  %cmp104 = icmp sgt i32 %conv100, %conv103, !dbg !1103
  br i1 %cmp104, label %if.then178, label %lor.lhs.false106, !dbg !1104, !cf.info !130

lor.lhs.false106:                                 ; preds = %land.lhs.true97, %land.lhs.true, %lor.lhs.false86
  %108 = load float, float* %dir, align 4, !dbg !1105
  %cmp107 = fcmp ogt float %108, 1.000000e+00, !dbg !1106
  br i1 %cmp107, label %land.lhs.true109, label %lor.lhs.false130, !dbg !1107, !cf.info !130

land.lhs.true109:                                 ; preds = %lor.lhs.false106
  %109 = load float, float* %dir, align 4, !dbg !1108
  %cmp110 = fcmp ole float %109, 3.000000e+00, !dbg !1109
  br i1 %cmp110, label %land.lhs.true112, label %lor.lhs.false130, !dbg !1110, !cf.info !130

land.lhs.true112:                                 ; preds = %land.lhs.true109
  %110 = load i16*, i16** %G, align 8, !dbg !1111
  %111 = load i32, i32* %c62, align 4, !dbg !1112
  %idxprom113 = sext i32 %111 to i64, !dbg !1111
  %arrayidx114 = getelementptr inbounds i16, i16* %110, i64 %idxprom113, !dbg !1111
  %112 = load i16, i16* %arrayidx114, align 2, !dbg !1111
  %conv115 = sext i16 %112 to i32, !dbg !1111
  %113 = load i16*, i16** %G, align 8, !dbg !1113
  %114 = load i32, i32* %nw, align 4, !dbg !1114
  %idxprom116 = sext i32 %114 to i64, !dbg !1113
  %arrayidx117 = getelementptr inbounds i16, i16* %113, i64 %idxprom116, !dbg !1113
  %115 = load i16, i16* %arrayidx117, align 2, !dbg !1113
  %conv118 = sext i16 %115 to i32, !dbg !1113
  %cmp119 = icmp sgt i32 %conv115, %conv118, !dbg !1115
  br i1 %cmp119, label %land.lhs.true121, label %lor.lhs.false130, !dbg !1116, !cf.info !130

land.lhs.true121:                                 ; preds = %land.lhs.true112
  %116 = load i16*, i16** %G, align 8, !dbg !1117
  %117 = load i32, i32* %c62, align 4, !dbg !1118
  %idxprom122 = sext i32 %117 to i64, !dbg !1117
  %arrayidx123 = getelementptr inbounds i16, i16* %116, i64 %idxprom122, !dbg !1117
  %118 = load i16, i16* %arrayidx123, align 2, !dbg !1117
  %conv124 = sext i16 %118 to i32, !dbg !1117
  %119 = load i16*, i16** %G, align 8, !dbg !1119
  %120 = load i32, i32* %se, align 4, !dbg !1120
  %idxprom125 = sext i32 %120 to i64, !dbg !1119
  %arrayidx126 = getelementptr inbounds i16, i16* %119, i64 %idxprom125, !dbg !1119
  %121 = load i16, i16* %arrayidx126, align 2, !dbg !1119
  %conv127 = sext i16 %121 to i32, !dbg !1119
  %cmp128 = icmp sgt i32 %conv124, %conv127, !dbg !1121
  br i1 %cmp128, label %if.then178, label %lor.lhs.false130, !dbg !1122, !cf.info !130

lor.lhs.false130:                                 ; preds = %land.lhs.true121, %land.lhs.true112, %land.lhs.true109, %lor.lhs.false106
  %122 = load float, float* %dir, align 4, !dbg !1123
  %cmp131 = fcmp ogt float %122, 3.000000e+00, !dbg !1124
  br i1 %cmp131, label %land.lhs.true133, label %lor.lhs.false154, !dbg !1125, !cf.info !130

land.lhs.true133:                                 ; preds = %lor.lhs.false130
  %123 = load float, float* %dir, align 4, !dbg !1126
  %cmp134 = fcmp ole float %123, 5.000000e+00, !dbg !1127
  br i1 %cmp134, label %land.lhs.true136, label %lor.lhs.false154, !dbg !1128, !cf.info !130

land.lhs.true136:                                 ; preds = %land.lhs.true133
  %124 = load i16*, i16** %G, align 8, !dbg !1129
  %125 = load i32, i32* %c62, align 4, !dbg !1130
  %idxprom137 = sext i32 %125 to i64, !dbg !1129
  %arrayidx138 = getelementptr inbounds i16, i16* %124, i64 %idxprom137, !dbg !1129
  %126 = load i16, i16* %arrayidx138, align 2, !dbg !1129
  %conv139 = sext i16 %126 to i32, !dbg !1129
  %127 = load i16*, i16** %G, align 8, !dbg !1131
  %128 = load i32, i32* %nn, align 4, !dbg !1132
  %idxprom140 = sext i32 %128 to i64, !dbg !1131
  %arrayidx141 = getelementptr inbounds i16, i16* %127, i64 %idxprom140, !dbg !1131
  %129 = load i16, i16* %arrayidx141, align 2, !dbg !1131
  %conv142 = sext i16 %129 to i32, !dbg !1131
  %cmp143 = icmp sgt i32 %conv139, %conv142, !dbg !1133
  br i1 %cmp143, label %land.lhs.true145, label %lor.lhs.false154, !dbg !1134, !cf.info !130

land.lhs.true145:                                 ; preds = %land.lhs.true136
  %130 = load i16*, i16** %G, align 8, !dbg !1135
  %131 = load i32, i32* %c62, align 4, !dbg !1136
  %idxprom146 = sext i32 %131 to i64, !dbg !1135
  %arrayidx147 = getelementptr inbounds i16, i16* %130, i64 %idxprom146, !dbg !1135
  %132 = load i16, i16* %arrayidx147, align 2, !dbg !1135
  %conv148 = sext i16 %132 to i32, !dbg !1135
  %133 = load i16*, i16** %G, align 8, !dbg !1137
  %134 = load i32, i32* %ss, align 4, !dbg !1138
  %idxprom149 = sext i32 %134 to i64, !dbg !1137
  %arrayidx150 = getelementptr inbounds i16, i16* %133, i64 %idxprom149, !dbg !1137
  %135 = load i16, i16* %arrayidx150, align 2, !dbg !1137
  %conv151 = sext i16 %135 to i32, !dbg !1137
  %cmp152 = icmp sgt i32 %conv148, %conv151, !dbg !1139
  br i1 %cmp152, label %if.then178, label %lor.lhs.false154, !dbg !1140, !cf.info !130

lor.lhs.false154:                                 ; preds = %land.lhs.true145, %land.lhs.true136, %land.lhs.true133, %lor.lhs.false130
  %136 = load float, float* %dir, align 4, !dbg !1141
  %cmp155 = fcmp ogt float %136, 5.000000e+00, !dbg !1142
  br i1 %cmp155, label %land.lhs.true157, label %if.else, !dbg !1143, !cf.info !130

land.lhs.true157:                                 ; preds = %lor.lhs.false154
  %137 = load float, float* %dir, align 4, !dbg !1144
  %cmp158 = fcmp ole float %137, 7.000000e+00, !dbg !1145
  br i1 %cmp158, label %land.lhs.true160, label %if.else, !dbg !1146, !cf.info !130

land.lhs.true160:                                 ; preds = %land.lhs.true157
  %138 = load i16*, i16** %G, align 8, !dbg !1147
  %139 = load i32, i32* %c62, align 4, !dbg !1148
  %idxprom161 = sext i32 %139 to i64, !dbg !1147
  %arrayidx162 = getelementptr inbounds i16, i16* %138, i64 %idxprom161, !dbg !1147
  %140 = load i16, i16* %arrayidx162, align 2, !dbg !1147
  %conv163 = sext i16 %140 to i32, !dbg !1147
  %141 = load i16*, i16** %G, align 8, !dbg !1149
  %142 = load i32, i32* %ne, align 4, !dbg !1150
  %idxprom164 = sext i32 %142 to i64, !dbg !1149
  %arrayidx165 = getelementptr inbounds i16, i16* %141, i64 %idxprom164, !dbg !1149
  %143 = load i16, i16* %arrayidx165, align 2, !dbg !1149
  %conv166 = sext i16 %143 to i32, !dbg !1149
  %cmp167 = icmp sgt i32 %conv163, %conv166, !dbg !1151
  br i1 %cmp167, label %land.lhs.true169, label %if.else, !dbg !1152, !cf.info !130

land.lhs.true169:                                 ; preds = %land.lhs.true160
  %144 = load i16*, i16** %G, align 8, !dbg !1153
  %145 = load i32, i32* %c62, align 4, !dbg !1154
  %idxprom170 = sext i32 %145 to i64, !dbg !1153
  %arrayidx171 = getelementptr inbounds i16, i16* %144, i64 %idxprom170, !dbg !1153
  %146 = load i16, i16* %arrayidx171, align 2, !dbg !1153
  %conv172 = sext i16 %146 to i32, !dbg !1153
  %147 = load i16*, i16** %G, align 8, !dbg !1155
  %148 = load i32, i32* %sw, align 4, !dbg !1156
  %idxprom173 = sext i32 %148 to i64, !dbg !1155
  %arrayidx174 = getelementptr inbounds i16, i16* %147, i64 %idxprom173, !dbg !1155
  %149 = load i16, i16* %arrayidx174, align 2, !dbg !1155
  %conv175 = sext i16 %149 to i32, !dbg !1155
  %cmp176 = icmp sgt i32 %conv172, %conv175, !dbg !1157
  br i1 %cmp176, label %if.then178, label %if.else, !dbg !1158, !cf.info !130

if.then178:                                       ; preds = %land.lhs.true169, %land.lhs.true145, %land.lhs.true121, %land.lhs.true97
  %150 = load i16*, i16** %G, align 8, !dbg !1159
  %151 = load i32, i32* %c62, align 4, !dbg !1160
  %idxprom179 = sext i32 %151 to i64, !dbg !1159
  %arrayidx180 = getelementptr inbounds i16, i16* %150, i64 %idxprom179, !dbg !1159
  %152 = load i16, i16* %arrayidx180, align 2, !dbg !1159
  %153 = load i16*, i16** %nms, align 8, !dbg !1161
  %154 = load i32, i32* %c62, align 4, !dbg !1162
  %idxprom181 = sext i32 %154 to i64, !dbg !1161
  %arrayidx182 = getelementptr inbounds i16, i16* %153, i64 %idxprom181, !dbg !1161
  store i16 %152, i16* %arrayidx182, align 2, !dbg !1163
  br label %if.end185, !dbg !1161

if.else:                                          ; preds = %land.lhs.true169, %land.lhs.true160, %land.lhs.true157, %lor.lhs.false154
  %155 = load i16*, i16** %nms, align 8, !dbg !1164
  %156 = load i32, i32* %c62, align 4, !dbg !1165
  %idxprom183 = sext i32 %156 to i64, !dbg !1164
  %arrayidx184 = getelementptr inbounds i16, i16* %155, i64 %idxprom183, !dbg !1164
  store i16 0, i16* %arrayidx184, align 2, !dbg !1166
  br label %if.end185

if.end185:                                        ; preds = %if.else, %if.then178
  br label %for.inc186, !dbg !1167

for.inc186:                                       ; preds = %if.end185
  %157 = load i32, i32* %j56, align 4, !dbg !1168
  %inc187 = add nsw i32 %157, 1, !dbg !1168
  store i32 %inc187, i32* %j56, align 4, !dbg !1168
  br label %for.cond57, !dbg !1169, !llvm.loop !1170

for.end188:                                       ; preds = %for.cond57
  br label %for.inc189, !dbg !1171

for.inc189:                                       ; preds = %for.end188
  %158 = load i32, i32* %i50, align 4, !dbg !1172
  %inc190 = add nsw i32 %158, 1, !dbg !1172
  store i32 %inc190, i32* %i50, align 4, !dbg !1172
  br label %for.cond51, !dbg !1173, !llvm.loop !1174

for.end191:                                       ; preds = %for.cond51
  call void @llvm.dbg.declare(metadata i32** %edges, metadata !1176, metadata !DIExpression()), !dbg !1177
  %159 = load i16*, i16** %after_Gy, align 8, !dbg !1178
  %160 = bitcast i16* %159 to i32*, !dbg !1179
  store i32* %160, i32** %edges, align 8, !dbg !1177
  %161 = load i16*, i16** %out, align 8, !dbg !1180
  %162 = bitcast i16* %161 to i8*, !dbg !1181
  %163 = load i32, i32* %nx, align 4, !dbg !1182
  %conv192 = sext i32 %163 to i64, !dbg !1182
  %mul193 = mul i64 2, %conv192, !dbg !1183
  %164 = load i32, i32* %ny, align 4, !dbg !1184
  %conv194 = sext i32 %164 to i64, !dbg !1184
  %mul195 = mul i64 %mul193, %conv194, !dbg !1185
  call void @llvm.memset.p0i8.i64(i8* align 2 %162, i8 0, i64 %mul195, i1 false), !dbg !1181
  %165 = load i32*, i32** %edges, align 8, !dbg !1186
  %166 = bitcast i32* %165 to i8*, !dbg !1187
  %167 = load i32, i32* %nx, align 4, !dbg !1188
  %conv196 = sext i32 %167 to i64, !dbg !1188
  %mul197 = mul i64 2, %conv196, !dbg !1189
  %168 = load i32, i32* %ny, align 4, !dbg !1190
  %conv198 = sext i32 %168 to i64, !dbg !1190
  %mul199 = mul i64 %mul197, %conv198, !dbg !1191
  call void @llvm.memset.p0i8.i64(i8* align 4 %166, i8 0, i64 %mul199, i1 false), !dbg !1187
  call void @llvm.dbg.declare(metadata i64* %c200, metadata !1192, metadata !DIExpression()), !dbg !1193
  store i64 1, i64* %c200, align 8, !dbg !1193
  call void @llvm.dbg.declare(metadata i32* %j201, metadata !1194, metadata !DIExpression()), !dbg !1196
  store i32 1, i32* %j201, align 4, !dbg !1196
  br label %for.cond202, !dbg !1197

for.cond202:                                      ; preds = %for.inc288, %for.end191
  %169 = load i32, i32* %j201, align 4, !dbg !1198
  %170 = load i32, i32* %ny, align 4, !dbg !1200
  %sub203 = sub nsw i32 %170, 1, !dbg !1201
  %cmp204 = icmp slt i32 %169, %sub203, !dbg !1202
  br i1 %cmp204, label %for.body206, label %for.end290, !dbg !1203

for.body206:                                      ; preds = %for.cond202
  call void @llvm.dbg.declare(metadata i32* %i207, metadata !1204, metadata !DIExpression()), !dbg !1206
  store i32 1, i32* %i207, align 4, !dbg !1206
  br label %for.cond208, !dbg !1207

for.cond208:                                      ; preds = %for.inc285, %for.body206
  %171 = load i32, i32* %i207, align 4, !dbg !1208
  %172 = load i32, i32* %nx, align 4, !dbg !1210
  %sub209 = sub nsw i32 %172, 1, !dbg !1211
  %cmp210 = icmp slt i32 %171, %sub209, !dbg !1212
  br i1 %cmp210, label %for.body212, label %for.end287, !dbg !1213

for.body212:                                      ; preds = %for.cond208
  %173 = load i16*, i16** %nms, align 8, !dbg !1214
  %174 = load i64, i64* %c200, align 8, !dbg !1217
  %arrayidx213 = getelementptr inbounds i16, i16* %173, i64 %174, !dbg !1214
  %175 = load i16, i16* %arrayidx213, align 2, !dbg !1214
  %conv214 = sext i16 %175 to i32, !dbg !1214
  %176 = load i32, i32* %tmax.addr, align 4, !dbg !1218
  %cmp215 = icmp sge i32 %conv214, %176, !dbg !1219
  br i1 %cmp215, label %land.lhs.true217, label %if.end283, !dbg !1220, !cf.info !130

land.lhs.true217:                                 ; preds = %for.body212
  %177 = load i16*, i16** %out, align 8, !dbg !1221
  %178 = load i64, i64* %c200, align 8, !dbg !1222
  %arrayidx218 = getelementptr inbounds i16, i16* %177, i64 %178, !dbg !1221
  %179 = load i16, i16* %arrayidx218, align 2, !dbg !1221
  %conv219 = sext i16 %179 to i32, !dbg !1221
  %cmp220 = icmp eq i32 %conv219, 0, !dbg !1223
  br i1 %cmp220, label %if.then222, label %if.end283, !dbg !1224, !cf.info !130

if.then222:                                       ; preds = %land.lhs.true217
  %180 = load i16*, i16** %out, align 8, !dbg !1225
  %181 = load i64, i64* %c200, align 8, !dbg !1227
  %arrayidx223 = getelementptr inbounds i16, i16* %180, i64 %181, !dbg !1225
  store i16 255, i16* %arrayidx223, align 2, !dbg !1228
  call void @llvm.dbg.declare(metadata i32* %nedges, metadata !1229, metadata !DIExpression()), !dbg !1230
  store i32 1, i32* %nedges, align 4, !dbg !1230
  %182 = load i64, i64* %c200, align 8, !dbg !1231
  %conv224 = trunc i64 %182 to i32, !dbg !1231
  %183 = load i32*, i32** %edges, align 8, !dbg !1232
  %arrayidx225 = getelementptr inbounds i32, i32* %183, i64 0, !dbg !1232
  store i32 %conv224, i32* %arrayidx225, align 4, !dbg !1233
  br label %do.body, !dbg !1234

do.body:                                          ; preds = %do.cond, %if.then222
  %184 = load i32, i32* %nedges, align 4, !dbg !1235
  %dec = add nsw i32 %184, -1, !dbg !1235
  store i32 %dec, i32* %nedges, align 4, !dbg !1235
  call void @llvm.dbg.declare(metadata i32* %t, metadata !1237, metadata !DIExpression()), !dbg !1238
  %185 = load i32*, i32** %edges, align 8, !dbg !1239
  %186 = load i32, i32* %nedges, align 4, !dbg !1240
  %idxprom226 = sext i32 %186 to i64, !dbg !1239
  %arrayidx227 = getelementptr inbounds i32, i32* %185, i64 %idxprom226, !dbg !1239
  %187 = load i32, i32* %arrayidx227, align 4, !dbg !1239
  store i32 %187, i32* %t, align 4, !dbg !1238
  call void @llvm.dbg.declare(metadata [8 x i32]* %nbs, metadata !1241, metadata !DIExpression()), !dbg !1245
  %188 = load i32, i32* %t, align 4, !dbg !1246
  %189 = load i32, i32* %nx, align 4, !dbg !1247
  %sub228 = sub nsw i32 %188, %189, !dbg !1248
  %arrayidx229 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 0, !dbg !1249
  store i32 %sub228, i32* %arrayidx229, align 16, !dbg !1250
  %190 = load i32, i32* %t, align 4, !dbg !1251
  %191 = load i32, i32* %nx, align 4, !dbg !1252
  %add230 = add nsw i32 %190, %191, !dbg !1253
  %arrayidx231 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 1, !dbg !1254
  store i32 %add230, i32* %arrayidx231, align 4, !dbg !1255
  %192 = load i32, i32* %t, align 4, !dbg !1256
  %add232 = add nsw i32 %192, 1, !dbg !1257
  %arrayidx233 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 2, !dbg !1258
  store i32 %add232, i32* %arrayidx233, align 8, !dbg !1259
  %193 = load i32, i32* %t, align 4, !dbg !1260
  %sub234 = sub nsw i32 %193, 1, !dbg !1261
  %arrayidx235 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 3, !dbg !1262
  store i32 %sub234, i32* %arrayidx235, align 4, !dbg !1263
  %arrayidx236 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 0, !dbg !1264
  %194 = load i32, i32* %arrayidx236, align 16, !dbg !1264
  %add237 = add nsw i32 %194, 1, !dbg !1265
  %arrayidx238 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 4, !dbg !1266
  store i32 %add237, i32* %arrayidx238, align 16, !dbg !1267
  %arrayidx239 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 0, !dbg !1268
  %195 = load i32, i32* %arrayidx239, align 16, !dbg !1268
  %sub240 = sub nsw i32 %195, 1, !dbg !1269
  %arrayidx241 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 5, !dbg !1270
  store i32 %sub240, i32* %arrayidx241, align 4, !dbg !1271
  %arrayidx242 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 1, !dbg !1272
  %196 = load i32, i32* %arrayidx242, align 4, !dbg !1272
  %add243 = add nsw i32 %196, 1, !dbg !1273
  %arrayidx244 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 6, !dbg !1274
  store i32 %add243, i32* %arrayidx244, align 8, !dbg !1275
  %arrayidx245 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 1, !dbg !1276
  %197 = load i32, i32* %arrayidx245, align 4, !dbg !1276
  %sub246 = sub nsw i32 %197, 1, !dbg !1277
  %arrayidx247 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 7, !dbg !1278
  store i32 %sub246, i32* %arrayidx247, align 4, !dbg !1279
  call void @llvm.dbg.declare(metadata i32* %k, metadata !1280, metadata !DIExpression()), !dbg !1282
  store i32 0, i32* %k, align 4, !dbg !1282
  br label %for.cond248, !dbg !1283

for.cond248:                                      ; preds = %for.inc278, %do.body
  %198 = load i32, i32* %k, align 4, !dbg !1284
  %cmp249 = icmp slt i32 %198, 8, !dbg !1286
  br i1 %cmp249, label %for.body251, label %for.end280, !dbg !1287

for.body251:                                      ; preds = %for.cond248
  %199 = load i16*, i16** %nms, align 8, !dbg !1288
  %200 = load i32, i32* %k, align 4, !dbg !1290
  %idxprom252 = sext i32 %200 to i64, !dbg !1291
  %arrayidx253 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 %idxprom252, !dbg !1291
  %201 = load i32, i32* %arrayidx253, align 4, !dbg !1291
  %idxprom254 = sext i32 %201 to i64, !dbg !1288
  %arrayidx255 = getelementptr inbounds i16, i16* %199, i64 %idxprom254, !dbg !1288
  %202 = load i16, i16* %arrayidx255, align 2, !dbg !1288
  %conv256 = sext i16 %202 to i32, !dbg !1288
  %203 = load i32, i32* %tmin.addr, align 4, !dbg !1292
  %cmp257 = icmp sge i32 %conv256, %203, !dbg !1293
  br i1 %cmp257, label %land.lhs.true259, label %if.end277, !dbg !1294, !cf.info !130

land.lhs.true259:                                 ; preds = %for.body251
  %204 = load i16*, i16** %out, align 8, !dbg !1295
  %205 = load i32, i32* %k, align 4, !dbg !1296
  %idxprom260 = sext i32 %205 to i64, !dbg !1297
  %arrayidx261 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 %idxprom260, !dbg !1297
  %206 = load i32, i32* %arrayidx261, align 4, !dbg !1297
  %idxprom262 = sext i32 %206 to i64, !dbg !1295
  %arrayidx263 = getelementptr inbounds i16, i16* %204, i64 %idxprom262, !dbg !1295
  %207 = load i16, i16* %arrayidx263, align 2, !dbg !1295
  %conv264 = sext i16 %207 to i32, !dbg !1295
  %cmp265 = icmp eq i32 %conv264, 0, !dbg !1298
  br i1 %cmp265, label %if.then267, label %if.end277, !dbg !1299, !cf.info !130

if.then267:                                       ; preds = %land.lhs.true259
  %208 = load i16*, i16** %out, align 8, !dbg !1300
  %209 = load i32, i32* %k, align 4, !dbg !1302
  %idxprom268 = sext i32 %209 to i64, !dbg !1303
  %arrayidx269 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 %idxprom268, !dbg !1303
  %210 = load i32, i32* %arrayidx269, align 4, !dbg !1303
  %idxprom270 = sext i32 %210 to i64, !dbg !1300
  %arrayidx271 = getelementptr inbounds i16, i16* %208, i64 %idxprom270, !dbg !1300
  store i16 255, i16* %arrayidx271, align 2, !dbg !1304
  %211 = load i32, i32* %k, align 4, !dbg !1305
  %idxprom272 = sext i32 %211 to i64, !dbg !1306
  %arrayidx273 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 %idxprom272, !dbg !1306
  %212 = load i32, i32* %arrayidx273, align 4, !dbg !1306
  %213 = load i32*, i32** %edges, align 8, !dbg !1307
  %214 = load i32, i32* %nedges, align 4, !dbg !1308
  %idxprom274 = sext i32 %214 to i64, !dbg !1307
  %arrayidx275 = getelementptr inbounds i32, i32* %213, i64 %idxprom274, !dbg !1307
  store i32 %212, i32* %arrayidx275, align 4, !dbg !1309
  %215 = load i32, i32* %nedges, align 4, !dbg !1310
  %inc276 = add nsw i32 %215, 1, !dbg !1310
  store i32 %inc276, i32* %nedges, align 4, !dbg !1310
  br label %if.end277, !dbg !1311

if.end277:                                        ; preds = %if.then267, %land.lhs.true259, %for.body251
  br label %for.inc278, !dbg !1312

for.inc278:                                       ; preds = %if.end277
  %216 = load i32, i32* %k, align 4, !dbg !1313
  %inc279 = add nsw i32 %216, 1, !dbg !1313
  store i32 %inc279, i32* %k, align 4, !dbg !1313
  br label %for.cond248, !dbg !1314, !llvm.loop !1315

for.end280:                                       ; preds = %for.cond248
  br label %do.cond, !dbg !1317

do.cond:                                          ; preds = %for.end280
  %217 = load i32, i32* %nedges, align 4, !dbg !1318
  %cmp281 = icmp sgt i32 %217, 0, !dbg !1319
  br i1 %cmp281, label %do.body, label %do.end, !dbg !1317, !llvm.loop !1320

do.end:                                           ; preds = %do.cond
  br label %if.end283, !dbg !1322

if.end283:                                        ; preds = %do.end, %land.lhs.true217, %for.body212
  %218 = load i64, i64* %c200, align 8, !dbg !1323
  %inc284 = add i64 %218, 1, !dbg !1323
  store i64 %inc284, i64* %c200, align 8, !dbg !1323
  br label %for.inc285, !dbg !1324

for.inc285:                                       ; preds = %if.end283
  %219 = load i32, i32* %i207, align 4, !dbg !1325
  %inc286 = add nsw i32 %219, 1, !dbg !1325
  store i32 %inc286, i32* %i207, align 4, !dbg !1325
  br label %for.cond208, !dbg !1326, !llvm.loop !1327

for.end287:                                       ; preds = %for.cond208
  br label %for.inc288, !dbg !1328

for.inc288:                                       ; preds = %for.end287
  %220 = load i32, i32* %j201, align 4, !dbg !1329
  %inc289 = add nsw i32 %220, 1, !dbg !1329
  store i32 %inc289, i32* %j201, align 4, !dbg !1329
  br label %for.cond202, !dbg !1330, !llvm.loop !1331

for.end290:                                       ; preds = %for.cond202
  %221 = load i16*, i16** %after_Gx, align 8, !dbg !1333
  %222 = bitcast i16* %221 to i8*, !dbg !1333
  call void @free(i8* %222) #6, !dbg !1334
  %223 = load i16*, i16** %after_Gy, align 8, !dbg !1335
  %224 = bitcast i16* %223 to i8*, !dbg !1335
  call void @free(i8* %224) #6, !dbg !1336
  %225 = load i16*, i16** %G, align 8, !dbg !1337
  %226 = bitcast i16* %225 to i8*, !dbg !1337
  call void @free(i8* %226) #6, !dbg !1338
  %227 = load i16*, i16** %nms, align 8, !dbg !1339
  %228 = bitcast i16* %227 to i8*, !dbg !1339
  call void @free(i8* %228) #6, !dbg !1340
  %229 = load i16*, i16** %out, align 8, !dbg !1341
  ret i16* %229, !dbg !1342
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !1343, metadata !DIExpression()), !dbg !1344
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !1345, metadata !DIExpression()), !dbg !1346
  %0 = load i32, i32* %argc.addr, align 4, !dbg !1347
  %cmp = icmp slt i32 %0, 2, !dbg !1349
  br i1 %cmp, label %if.then, label %if.end, !dbg !1350, !cf.info !130

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !1351
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 0, !dbg !1351
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !1351
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.10, i64 0, i64 0), i8* %2), !dbg !1353
  store i32 1, i32* %retval, align 4, !dbg !1354
  br label %return, !dbg !1354

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i16** %in_bitmap_data, metadata !1355, metadata !DIExpression()), !dbg !1356
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !1357
  %arrayidx1 = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !1357
  %4 = load i8*, i8** %arrayidx1, align 8, !dbg !1357
  %call2 = call i16* @load_bmp(i8* %4, %struct.bitmap_info_header_t* @main.ih), !dbg !1358
  store i16* %call2, i16** %in_bitmap_data, align 8, !dbg !1356
  %5 = load i16*, i16** %in_bitmap_data, align 8, !dbg !1359
  %cmp3 = icmp eq i16* %5, null, !dbg !1361
  br i1 %cmp3, label %if.then4, label %if.end6, !dbg !1362, !cf.info !130

if.then4:                                         ; preds = %if.end
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1363
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.11, i64 0, i64 0)), !dbg !1365
  store i32 1, i32* %retval, align 4, !dbg !1366
  br label %return, !dbg !1366

if.end6:                                          ; preds = %if.end
  %7 = load i32, i32* getelementptr inbounds (%struct.bitmap_info_header_t, %struct.bitmap_info_header_t* @main.ih, i32 0, i32 1), align 4, !dbg !1367
  %8 = load i32, i32* getelementptr inbounds (%struct.bitmap_info_header_t, %struct.bitmap_info_header_t* @main.ih, i32 0, i32 2), align 4, !dbg !1368
  %9 = load i16, i16* getelementptr inbounds (%struct.bitmap_info_header_t, %struct.bitmap_info_header_t* @main.ih, i32 0, i32 4), align 2, !dbg !1369
  %conv = zext i16 %9 to i32, !dbg !1370
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.12, i64 0, i64 0), i32 %7, i32 %8, i32 %conv), !dbg !1371
  call void @llvm.dbg.declare(metadata i16** %out_bitmap_data, metadata !1372, metadata !DIExpression()), !dbg !1373
  %10 = load i16*, i16** %in_bitmap_data, align 8, !dbg !1374
  %call8 = call i16* @canny_edge_detection(i16* %10, %struct.bitmap_info_header_t* @main.ih, i32 45, i32 50, float 1.000000e+00), !dbg !1375
  store i16* %call8, i16** %out_bitmap_data, align 8, !dbg !1373
  %11 = load i16*, i16** %out_bitmap_data, align 8, !dbg !1376
  %cmp9 = icmp eq i16* %11, null, !dbg !1378
  br i1 %cmp9, label %if.then11, label %if.end13, !dbg !1379, !cf.info !130

if.then11:                                        ; preds = %if.end6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1380
  %call12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.13, i64 0, i64 0)), !dbg !1382
  store i32 1, i32* %retval, align 4, !dbg !1383
  br label %return, !dbg !1383

if.end13:                                         ; preds = %if.end6
  %13 = load i16*, i16** %out_bitmap_data, align 8, !dbg !1384
  %call14 = call zeroext i1 @save_bmp(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.14, i64 0, i64 0), %struct.bitmap_info_header_t* @main.ih, i16* %13), !dbg !1386
  br i1 %call14, label %if.then15, label %if.end17, !dbg !1387, !cf.info !130

if.then15:                                        ; preds = %if.end13
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1388
  %call16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15, i64 0, i64 0)), !dbg !1390
  store i32 1, i32* %retval, align 4, !dbg !1391
  br label %return, !dbg !1391

if.end17:                                         ; preds = %if.end13
  %15 = load i16*, i16** %in_bitmap_data, align 8, !dbg !1392
  %16 = bitcast i16* %15 to i8*, !dbg !1393
  call void @free(i8* %16) #6, !dbg !1394
  %17 = load i16*, i16** %out_bitmap_data, align 8, !dbg !1395
  %18 = bitcast i16* %17 to i8*, !dbg !1396
  call void @free(i8* %18) #6, !dbg !1397
  store i32 0, i32* %retval, align 4, !dbg !1398
  br label %return, !dbg !1398

return:                                           ; preds = %if.end17, %if.then15, %if.then11, %if.then4, %if.then
  %19 = load i32, i32* %retval, align 4, !dbg !1399
  ret i32 %19, !dbg !1399
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
!13 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !14, retainedTypes: !15, globals: !31, splitDebugInlining: false, nameTableKind: None)
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
!55 = !{!"clang version 10.0.1 (https://github.com/SusanTan/llvm-project.git 078de928eea94413164fbdff5fab7bdcf0f60aa7)"}
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
!116 = !DIFile(filename: "/u/NAS_SCRATCH/yc0769/xstack/llvm-install/lib/clang/10.0.1/include/stddef.h", directory: "")
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
!130 = !{!"if"}
!131 = !DILocation(line: 70, column: 9, scope: !132)
!132 = distinct !DILexicalBlock(scope: !127, file: !3, line: 69, column: 26)
!133 = !DILocation(line: 71, column: 9, scope: !132)
!134 = !DILocalVariable(name: "mag", scope: !56, file: !3, line: 74, type: !135)
!135 = !DIDerivedType(tag: DW_TAG_typedef, name: "bmpfile_magic_t", file: !3, line: 31, baseType: !136)
!136 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 29, size: 16, elements: !137)
!137 = !{!138}
!138 = !DIDerivedType(tag: DW_TAG_member, name: "magic", scope: !136, file: !3, line: 30, baseType: !139, size: 16)
!139 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 16, elements: !140)
!140 = !{!141}
!141 = !DISubrange(count: 2)
!142 = !DILocation(line: 74, column: 21, scope: !56)
!143 = !DILocation(line: 75, column: 15, scope: !144)
!144 = distinct !DILexicalBlock(scope: !56, file: !3, line: 75, column: 9)
!145 = !DILocation(line: 75, column: 49, scope: !144)
!146 = !DILocation(line: 75, column: 9, scope: !144)
!147 = !DILocation(line: 75, column: 58, scope: !144)
!148 = !DILocation(line: 75, column: 9, scope: !56)
!149 = !DILocation(line: 76, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !144, file: !3, line: 75, column: 64)
!151 = !DILocation(line: 76, column: 9, scope: !150)
!152 = !DILocation(line: 77, column: 9, scope: !150)
!153 = !DILocation(line: 83, column: 26, scope: !154)
!154 = distinct !DILexicalBlock(scope: !56, file: !3, line: 83, column: 9)
!155 = !DILocation(line: 83, column: 9, scope: !154)
!156 = !DILocation(line: 83, column: 33, scope: !154)
!157 = !DILocation(line: 83, column: 9, scope: !56)
!158 = !DILocation(line: 84, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !3, line: 83, column: 44)
!160 = !DILocation(line: 85, column: 21, scope: !159)
!161 = !DILocation(line: 85, column: 17, scope: !159)
!162 = !DILocation(line: 85, column: 35, scope: !159)
!163 = !DILocation(line: 85, column: 31, scope: !159)
!164 = !DILocation(line: 84, column: 9, scope: !159)
!165 = !DILocation(line: 86, column: 16, scope: !159)
!166 = !DILocation(line: 86, column: 9, scope: !159)
!167 = !DILocation(line: 87, column: 9, scope: !159)
!168 = !DILocalVariable(name: "bitmapFileHeader", scope: !56, file: !3, line: 90, type: !169)
!169 = !DIDerivedType(tag: DW_TAG_typedef, name: "bmpfile_header_t", file: !3, line: 38, baseType: !170)
!170 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 33, size: 96, elements: !171)
!171 = !{!172, !173, !174, !175}
!172 = !DIDerivedType(tag: DW_TAG_member, name: "filesz", scope: !170, file: !3, line: 34, baseType: !36, size: 32)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "creator1", scope: !170, file: !3, line: 35, baseType: !18, size: 16, offset: 32)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "creator2", scope: !170, file: !3, line: 36, baseType: !18, size: 16, offset: 48)
!175 = !DIDerivedType(tag: DW_TAG_member, name: "bmp_offset", scope: !170, file: !3, line: 37, baseType: !36, size: 32, offset: 64)
!176 = !DILocation(line: 90, column: 22, scope: !56)
!177 = !DILocation(line: 92, column: 15, scope: !178)
!178 = distinct !DILexicalBlock(scope: !56, file: !3, line: 92, column: 9)
!179 = !DILocation(line: 93, column: 18, scope: !178)
!180 = !DILocation(line: 92, column: 9, scope: !178)
!181 = !DILocation(line: 93, column: 27, scope: !178)
!182 = !DILocation(line: 92, column: 9, scope: !56)
!183 = !DILocation(line: 94, column: 16, scope: !184)
!184 = distinct !DILexicalBlock(scope: !178, file: !3, line: 93, column: 33)
!185 = !DILocation(line: 94, column: 9, scope: !184)
!186 = !DILocation(line: 95, column: 9, scope: !184)
!187 = !DILocation(line: 99, column: 15, scope: !188)
!188 = distinct !DILexicalBlock(scope: !56, file: !3, line: 99, column: 9)
!189 = !DILocation(line: 100, column: 18, scope: !188)
!190 = !DILocation(line: 99, column: 9, scope: !188)
!191 = !DILocation(line: 100, column: 27, scope: !188)
!192 = !DILocation(line: 99, column: 9, scope: !56)
!193 = !DILocation(line: 101, column: 16, scope: !194)
!194 = distinct !DILexicalBlock(scope: !188, file: !3, line: 100, column: 33)
!195 = !DILocation(line: 101, column: 9, scope: !194)
!196 = !DILocation(line: 102, column: 9, scope: !194)
!197 = !DILocation(line: 105, column: 9, scope: !198)
!198 = distinct !DILexicalBlock(scope: !56, file: !3, line: 105, column: 9)
!199 = !DILocation(line: 105, column: 27, scope: !198)
!200 = !DILocation(line: 105, column: 41, scope: !198)
!201 = !DILocation(line: 105, column: 9, scope: !56)
!202 = !DILocation(line: 106, column: 17, scope: !198)
!203 = !DILocation(line: 106, column: 9, scope: !198)
!204 = !DILocation(line: 109, column: 15, scope: !205)
!205 = distinct !DILexicalBlock(scope: !56, file: !3, line: 109, column: 9)
!206 = !DILocation(line: 109, column: 41, scope: !205)
!207 = !DILocation(line: 109, column: 24, scope: !205)
!208 = !DILocation(line: 109, column: 9, scope: !205)
!209 = !DILocation(line: 109, column: 9, scope: !56)
!210 = !DILocation(line: 110, column: 16, scope: !211)
!211 = distinct !DILexicalBlock(scope: !205, file: !3, line: 109, column: 64)
!212 = !DILocation(line: 110, column: 9, scope: !211)
!213 = !DILocation(line: 111, column: 9, scope: !211)
!214 = !DILocalVariable(name: "bitmapImage", scope: !56, file: !3, line: 115, type: !30)
!215 = !DILocation(line: 115, column: 14, scope: !56)
!216 = !DILocation(line: 115, column: 35, scope: !56)
!217 = !DILocation(line: 115, column: 53, scope: !56)
!218 = !DILocation(line: 115, column: 64, scope: !56)
!219 = !DILocation(line: 115, column: 28, scope: !56)
!220 = !DILocation(line: 119, column: 9, scope: !221)
!221 = distinct !DILexicalBlock(scope: !56, file: !3, line: 119, column: 9)
!222 = !DILocation(line: 119, column: 21, scope: !221)
!223 = !DILocation(line: 119, column: 9, scope: !56)
!224 = !DILocation(line: 120, column: 16, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !3, line: 119, column: 30)
!226 = !DILocation(line: 120, column: 9, scope: !225)
!227 = !DILocation(line: 121, column: 9, scope: !225)
!228 = !DILocalVariable(name: "pad", scope: !56, file: !3, line: 125, type: !115)
!229 = !DILocation(line: 125, column: 12, scope: !56)
!230 = !DILocalVariable(name: "count", scope: !56, file: !3, line: 125, type: !115)
!231 = !DILocation(line: 125, column: 17, scope: !56)
!232 = !DILocalVariable(name: "c", scope: !56, file: !3, line: 126, type: !27)
!233 = !DILocation(line: 126, column: 19, scope: !56)
!234 = !DILocation(line: 127, column: 18, scope: !56)
!235 = !DILocation(line: 127, column: 36, scope: !56)
!236 = !DILocation(line: 127, column: 43, scope: !56)
!237 = !DILocation(line: 127, column: 61, scope: !56)
!238 = !DILocation(line: 127, column: 42, scope: !56)
!239 = !DILocation(line: 127, column: 66, scope: !56)
!240 = !DILocation(line: 127, column: 13, scope: !56)
!241 = !DILocation(line: 127, column: 12, scope: !56)
!242 = !DILocation(line: 127, column: 74, scope: !56)
!243 = !DILocation(line: 127, column: 92, scope: !56)
!244 = !DILocation(line: 127, column: 72, scope: !56)
!245 = !DILocation(line: 127, column: 11, scope: !56)
!246 = !DILocation(line: 127, column: 9, scope: !56)
!247 = !DILocalVariable(name: "i", scope: !248, file: !3, line: 128, type: !115)
!248 = distinct !DILexicalBlock(scope: !56, file: !3, line: 128, column: 5)
!249 = !DILocation(line: 128, column: 16, scope: !248)
!250 = !DILocation(line: 128, column: 9, scope: !248)
!251 = !DILocation(line: 128, column: 21, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !3, line: 128, column: 5)
!253 = !DILocation(line: 128, column: 23, scope: !252)
!254 = !DILocation(line: 128, column: 41, scope: !252)
!255 = !DILocation(line: 128, column: 22, scope: !252)
!256 = !DILocation(line: 128, column: 5, scope: !248)
!257 = !DILocalVariable(name: "j", scope: !258, file: !3, line: 129, type: !115)
!258 = distinct !DILexicalBlock(scope: !259, file: !3, line: 129, column: 6)
!259 = distinct !DILexicalBlock(scope: !252, file: !3, line: 128, column: 53)
!260 = !DILocation(line: 129, column: 17, scope: !258)
!261 = !DILocation(line: 129, column: 10, scope: !258)
!262 = !DILocation(line: 129, column: 22, scope: !263)
!263 = distinct !DILexicalBlock(scope: !258, file: !3, line: 129, column: 6)
!264 = !DILocation(line: 129, column: 24, scope: !263)
!265 = !DILocation(line: 129, column: 42, scope: !263)
!266 = !DILocation(line: 129, column: 23, scope: !263)
!267 = !DILocation(line: 129, column: 6, scope: !258)
!268 = !DILocation(line: 130, column: 47, scope: !269)
!269 = distinct !DILexicalBlock(scope: !270, file: !3, line: 130, column: 11)
!270 = distinct !DILexicalBlock(scope: !263, file: !3, line: 129, column: 53)
!271 = !DILocation(line: 130, column: 11, scope: !269)
!272 = !DILocation(line: 130, column: 56, scope: !269)
!273 = !DILocation(line: 130, column: 11, scope: !270)
!274 = !DILocation(line: 131, column: 15, scope: !275)
!275 = distinct !DILexicalBlock(scope: !269, file: !3, line: 130, column: 62)
!276 = !DILocation(line: 131, column: 8, scope: !275)
!277 = !DILocation(line: 132, column: 8, scope: !275)
!278 = !DILocation(line: 134, column: 40, scope: !270)
!279 = !DILocation(line: 134, column: 30, scope: !270)
!280 = !DILocation(line: 134, column: 7, scope: !270)
!281 = !DILocation(line: 134, column: 24, scope: !270)
!282 = !DILocation(line: 134, column: 28, scope: !270)
!283 = !DILocation(line: 135, column: 6, scope: !270)
!284 = !DILocation(line: 129, column: 50, scope: !263)
!285 = !DILocation(line: 129, column: 6, scope: !263)
!286 = distinct !{!286, !267, !287}
!287 = !DILocation(line: 135, column: 6, scope: !258)
!288 = !DILocation(line: 136, column: 12, scope: !259)
!289 = !DILocation(line: 136, column: 21, scope: !259)
!290 = !DILocation(line: 136, column: 6, scope: !259)
!291 = !DILocation(line: 137, column: 5, scope: !259)
!292 = !DILocation(line: 128, column: 50, scope: !252)
!293 = !DILocation(line: 128, column: 5, scope: !252)
!294 = distinct !{!294, !256, !295}
!295 = !DILocation(line: 137, column: 5, scope: !248)
!296 = !DILocation(line: 143, column: 12, scope: !56)
!297 = !DILocation(line: 143, column: 5, scope: !56)
!298 = !DILocation(line: 144, column: 12, scope: !56)
!299 = !DILocation(line: 144, column: 5, scope: !56)
!300 = !DILocation(line: 145, column: 1, scope: !56)
!301 = distinct !DISubprogram(name: "save_bmp", scope: !3, file: !3, line: 148, type: !302, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !13, retainedNodes: !14)
!302 = !DISubroutineType(types: !303)
!303 = !{!304, !10, !305, !307}
!304 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!305 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !306, size: 64)
!306 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !32)
!307 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !308, size: 64)
!308 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!309 = !DILocalVariable(name: "filename", arg: 1, scope: !301, file: !3, line: 148, type: !10)
!310 = !DILocation(line: 148, column: 27, scope: !301)
!311 = !DILocalVariable(name: "bmp_ih", arg: 2, scope: !301, file: !3, line: 148, type: !305)
!312 = !DILocation(line: 148, column: 65, scope: !301)
!313 = !DILocalVariable(name: "data", arg: 3, scope: !301, file: !3, line: 149, type: !307)
!314 = !DILocation(line: 149, column: 30, scope: !301)
!315 = !DILocalVariable(name: "filePtr", scope: !301, file: !3, line: 151, type: !65)
!316 = !DILocation(line: 151, column: 11, scope: !301)
!317 = !DILocation(line: 151, column: 27, scope: !301)
!318 = !DILocation(line: 151, column: 21, scope: !301)
!319 = !DILocation(line: 152, column: 9, scope: !320)
!320 = distinct !DILexicalBlock(scope: !301, file: !3, line: 152, column: 9)
!321 = !DILocation(line: 152, column: 17, scope: !320)
!322 = !DILocation(line: 152, column: 9, scope: !301)
!323 = !DILocation(line: 153, column: 9, scope: !320)
!324 = !DILocalVariable(name: "mag", scope: !301, file: !3, line: 155, type: !135)
!325 = !DILocation(line: 155, column: 21, scope: !301)
!326 = !DILocation(line: 156, column: 16, scope: !327)
!327 = distinct !DILexicalBlock(scope: !301, file: !3, line: 156, column: 9)
!328 = !DILocation(line: 156, column: 50, scope: !327)
!329 = !DILocation(line: 156, column: 9, scope: !327)
!330 = !DILocation(line: 156, column: 59, scope: !327)
!331 = !DILocation(line: 156, column: 9, scope: !301)
!332 = !DILocation(line: 157, column: 16, scope: !333)
!333 = distinct !DILexicalBlock(scope: !327, file: !3, line: 156, column: 65)
!334 = !DILocation(line: 157, column: 9, scope: !333)
!335 = !DILocation(line: 158, column: 9, scope: !333)
!336 = !DILocalVariable(name: "offset", scope: !301, file: !3, line: 161, type: !337)
!337 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !36)
!338 = !DILocation(line: 161, column: 20, scope: !301)
!339 = !DILocation(line: 164, column: 37, scope: !301)
!340 = !DILocation(line: 164, column: 45, scope: !301)
!341 = !DILocation(line: 164, column: 34, scope: !301)
!342 = !DILocation(line: 164, column: 53, scope: !301)
!343 = !DILocation(line: 164, column: 29, scope: !301)
!344 = !DILocation(line: 163, column: 58, scope: !301)
!345 = !DILocation(line: 161, column: 29, scope: !301)
!346 = !DILocalVariable(name: "bmp_fh", scope: !301, file: !3, line: 166, type: !347)
!347 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !169)
!348 = !DILocation(line: 166, column: 28, scope: !301)
!349 = !DILocation(line: 166, column: 37, scope: !301)
!350 = !DILocation(line: 167, column: 19, scope: !301)
!351 = !DILocation(line: 167, column: 28, scope: !301)
!352 = !DILocation(line: 167, column: 36, scope: !301)
!353 = !DILocation(line: 167, column: 26, scope: !301)
!354 = !DILocation(line: 170, column: 23, scope: !301)
!355 = !DILocation(line: 173, column: 16, scope: !356)
!356 = distinct !DILexicalBlock(scope: !301, file: !3, line: 173, column: 9)
!357 = !DILocation(line: 173, column: 54, scope: !356)
!358 = !DILocation(line: 173, column: 9, scope: !356)
!359 = !DILocation(line: 173, column: 63, scope: !356)
!360 = !DILocation(line: 173, column: 9, scope: !301)
!361 = !DILocation(line: 174, column: 16, scope: !362)
!362 = distinct !DILexicalBlock(scope: !356, file: !3, line: 173, column: 69)
!363 = !DILocation(line: 174, column: 9, scope: !362)
!364 = !DILocation(line: 175, column: 9, scope: !362)
!365 = !DILocation(line: 177, column: 16, scope: !366)
!366 = distinct !DILexicalBlock(scope: !301, file: !3, line: 177, column: 9)
!367 = !DILocation(line: 177, column: 57, scope: !366)
!368 = !DILocation(line: 177, column: 9, scope: !366)
!369 = !DILocation(line: 177, column: 66, scope: !366)
!370 = !DILocation(line: 177, column: 9, scope: !301)
!371 = !DILocation(line: 178, column: 16, scope: !372)
!372 = distinct !DILexicalBlock(scope: !366, file: !3, line: 177, column: 72)
!373 = !DILocation(line: 178, column: 9, scope: !372)
!374 = !DILocation(line: 179, column: 9, scope: !372)
!375 = !DILocalVariable(name: "i", scope: !376, file: !3, line: 183, type: !115)
!376 = distinct !DILexicalBlock(scope: !301, file: !3, line: 183, column: 5)
!377 = !DILocation(line: 183, column: 17, scope: !376)
!378 = !DILocation(line: 183, column: 10, scope: !376)
!379 = !DILocation(line: 183, column: 24, scope: !380)
!380 = distinct !DILexicalBlock(scope: !376, file: !3, line: 183, column: 5)
!381 = !DILocation(line: 183, column: 35, scope: !380)
!382 = !DILocation(line: 183, column: 43, scope: !380)
!383 = !DILocation(line: 183, column: 32, scope: !380)
!384 = !DILocation(line: 183, column: 28, scope: !380)
!385 = !DILocation(line: 183, column: 26, scope: !380)
!386 = !DILocation(line: 183, column: 5, scope: !376)
!387 = !DILocalVariable(name: "color", scope: !388, file: !3, line: 184, type: !389)
!388 = distinct !DILexicalBlock(scope: !380, file: !3, line: 183, column: 57)
!389 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !390)
!390 = !DIDerivedType(tag: DW_TAG_typedef, name: "rgb_t", file: !3, line: 59, baseType: !391)
!391 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 54, size: 32, elements: !392)
!392 = !{!393, !394, !395, !396}
!393 = !DIDerivedType(tag: DW_TAG_member, name: "r", scope: !391, file: !3, line: 55, baseType: !25, size: 8)
!394 = !DIDerivedType(tag: DW_TAG_member, name: "g", scope: !391, file: !3, line: 56, baseType: !25, size: 8, offset: 8)
!395 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !391, file: !3, line: 57, baseType: !25, size: 8, offset: 16)
!396 = !DIDerivedType(tag: DW_TAG_member, name: "nothing", scope: !391, file: !3, line: 58, baseType: !25, size: 8, offset: 24)
!397 = !DILocation(line: 184, column: 21, scope: !388)
!398 = !DILocation(line: 184, column: 29, scope: !388)
!399 = !DILocation(line: 184, column: 39, scope: !388)
!400 = !DILocation(line: 184, column: 30, scope: !388)
!401 = !DILocation(line: 184, column: 51, scope: !388)
!402 = !DILocation(line: 184, column: 42, scope: !388)
!403 = !DILocation(line: 184, column: 63, scope: !388)
!404 = !DILocation(line: 184, column: 54, scope: !388)
!405 = !DILocation(line: 185, column: 20, scope: !406)
!406 = distinct !DILexicalBlock(scope: !388, file: !3, line: 185, column: 13)
!407 = !DILocation(line: 185, column: 46, scope: !406)
!408 = !DILocation(line: 185, column: 13, scope: !406)
!409 = !DILocation(line: 185, column: 55, scope: !406)
!410 = !DILocation(line: 185, column: 13, scope: !388)
!411 = !DILocation(line: 186, column: 20, scope: !412)
!412 = distinct !DILexicalBlock(scope: !406, file: !3, line: 185, column: 61)
!413 = !DILocation(line: 186, column: 13, scope: !412)
!414 = !DILocation(line: 187, column: 13, scope: !412)
!415 = !DILocation(line: 189, column: 5, scope: !388)
!416 = !DILocation(line: 183, column: 53, scope: !380)
!417 = !DILocation(line: 183, column: 5, scope: !380)
!418 = distinct !{!418, !386, !419}
!419 = !DILocation(line: 189, column: 5, scope: !376)
!420 = !DILocalVariable(name: "pad", scope: !301, file: !3, line: 196, type: !115)
!421 = !DILocation(line: 196, column: 12, scope: !301)
!422 = !DILocation(line: 196, column: 25, scope: !301)
!423 = !DILocation(line: 196, column: 33, scope: !301)
!424 = !DILocation(line: 196, column: 40, scope: !301)
!425 = !DILocation(line: 196, column: 48, scope: !301)
!426 = !DILocation(line: 196, column: 39, scope: !301)
!427 = !DILocation(line: 196, column: 53, scope: !301)
!428 = !DILocation(line: 196, column: 20, scope: !301)
!429 = !DILocation(line: 196, column: 19, scope: !301)
!430 = !DILocation(line: 196, column: 61, scope: !301)
!431 = !DILocation(line: 196, column: 69, scope: !301)
!432 = !DILocation(line: 196, column: 59, scope: !301)
!433 = !DILocation(line: 196, column: 18, scope: !301)
!434 = !DILocalVariable(name: "c", scope: !301, file: !3, line: 197, type: !27)
!435 = !DILocation(line: 197, column: 19, scope: !301)
!436 = !DILocalVariable(name: "i", scope: !437, file: !3, line: 198, type: !115)
!437 = distinct !DILexicalBlock(scope: !301, file: !3, line: 198, column: 5)
!438 = !DILocation(line: 198, column: 16, scope: !437)
!439 = !DILocation(line: 198, column: 9, scope: !437)
!440 = !DILocation(line: 198, column: 21, scope: !441)
!441 = distinct !DILexicalBlock(scope: !437, file: !3, line: 198, column: 5)
!442 = !DILocation(line: 198, column: 25, scope: !441)
!443 = !DILocation(line: 198, column: 33, scope: !441)
!444 = !DILocation(line: 198, column: 23, scope: !441)
!445 = !DILocation(line: 198, column: 5, scope: !437)
!446 = !DILocalVariable(name: "j", scope: !447, file: !3, line: 199, type: !115)
!447 = distinct !DILexicalBlock(scope: !448, file: !3, line: 199, column: 6)
!448 = distinct !DILexicalBlock(scope: !441, file: !3, line: 198, column: 46)
!449 = !DILocation(line: 199, column: 17, scope: !447)
!450 = !DILocation(line: 199, column: 10, scope: !447)
!451 = !DILocation(line: 199, column: 22, scope: !452)
!452 = distinct !DILexicalBlock(scope: !447, file: !3, line: 199, column: 6)
!453 = !DILocation(line: 199, column: 26, scope: !452)
!454 = !DILocation(line: 199, column: 34, scope: !452)
!455 = !DILocation(line: 199, column: 24, scope: !452)
!456 = !DILocation(line: 199, column: 6, scope: !447)
!457 = !DILocation(line: 200, column: 27, scope: !458)
!458 = distinct !DILexicalBlock(scope: !452, file: !3, line: 199, column: 46)
!459 = !DILocation(line: 200, column: 32, scope: !458)
!460 = !DILocation(line: 200, column: 36, scope: !458)
!461 = !DILocation(line: 200, column: 44, scope: !458)
!462 = !DILocation(line: 200, column: 50, scope: !458)
!463 = !DILocation(line: 200, column: 49, scope: !458)
!464 = !DILocation(line: 200, column: 34, scope: !458)
!465 = !DILocation(line: 200, column: 11, scope: !458)
!466 = !DILocation(line: 200, column: 9, scope: !458)
!467 = !DILocation(line: 201, column: 39, scope: !468)
!468 = distinct !DILexicalBlock(scope: !458, file: !3, line: 201, column: 11)
!469 = !DILocation(line: 201, column: 11, scope: !468)
!470 = !DILocation(line: 201, column: 48, scope: !468)
!471 = !DILocation(line: 201, column: 11, scope: !458)
!472 = !DILocation(line: 202, column: 15, scope: !473)
!473 = distinct !DILexicalBlock(scope: !468, file: !3, line: 201, column: 54)
!474 = !DILocation(line: 202, column: 8, scope: !473)
!475 = !DILocation(line: 203, column: 8, scope: !473)
!476 = !DILocation(line: 205, column: 6, scope: !458)
!477 = !DILocation(line: 199, column: 42, scope: !452)
!478 = !DILocation(line: 199, column: 6, scope: !452)
!479 = distinct !{!479, !456, !480}
!480 = !DILocation(line: 205, column: 6, scope: !447)
!481 = !DILocation(line: 206, column: 8, scope: !448)
!482 = !DILocalVariable(name: "j", scope: !483, file: !3, line: 207, type: !115)
!483 = distinct !DILexicalBlock(scope: !448, file: !3, line: 207, column: 6)
!484 = !DILocation(line: 207, column: 17, scope: !483)
!485 = !DILocation(line: 207, column: 10, scope: !483)
!486 = !DILocation(line: 207, column: 22, scope: !487)
!487 = distinct !DILexicalBlock(scope: !483, file: !3, line: 207, column: 6)
!488 = !DILocation(line: 207, column: 24, scope: !487)
!489 = !DILocation(line: 207, column: 23, scope: !487)
!490 = !DILocation(line: 207, column: 6, scope: !483)
!491 = !DILocation(line: 208, column: 39, scope: !492)
!492 = distinct !DILexicalBlock(scope: !487, file: !3, line: 208, column: 11)
!493 = !DILocation(line: 208, column: 11, scope: !492)
!494 = !DILocation(line: 208, column: 48, scope: !492)
!495 = !DILocation(line: 208, column: 11, scope: !487)
!496 = !DILocation(line: 209, column: 15, scope: !497)
!497 = distinct !DILexicalBlock(scope: !492, file: !3, line: 208, column: 54)
!498 = !DILocation(line: 209, column: 8, scope: !497)
!499 = !DILocation(line: 210, column: 8, scope: !497)
!500 = !DILocation(line: 208, column: 51, scope: !492)
!501 = !DILocation(line: 207, column: 30, scope: !487)
!502 = !DILocation(line: 207, column: 6, scope: !487)
!503 = distinct !{!503, !490, !504}
!504 = !DILocation(line: 211, column: 7, scope: !483)
!505 = !DILocation(line: 212, column: 5, scope: !448)
!506 = !DILocation(line: 198, column: 42, scope: !441)
!507 = !DILocation(line: 198, column: 5, scope: !441)
!508 = distinct !{!508, !445, !509}
!509 = !DILocation(line: 212, column: 5, scope: !437)
!510 = !DILocation(line: 214, column: 12, scope: !301)
!511 = !DILocation(line: 214, column: 5, scope: !301)
!512 = !DILocation(line: 215, column: 5, scope: !301)
!513 = !DILocation(line: 216, column: 1, scope: !301)
!514 = distinct !DISubprogram(name: "convolution", scope: !3, file: !3, line: 219, type: !515, scopeLine: 222, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !13, retainedNodes: !14)
!515 = !DISubroutineType(types: !516)
!516 = !{null, !307, !30, !517, !7, !7, !7, !519}
!517 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !518, size: 64)
!518 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !28)
!519 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !304)
!520 = !DILocalVariable(name: "in", arg: 1, scope: !514, file: !3, line: 219, type: !307)
!521 = !DILocation(line: 219, column: 33, scope: !514)
!522 = !DILocalVariable(name: "out", arg: 2, scope: !514, file: !3, line: 219, type: !30)
!523 = !DILocation(line: 219, column: 46, scope: !514)
!524 = !DILocalVariable(name: "kernel", arg: 3, scope: !514, file: !3, line: 219, type: !517)
!525 = !DILocation(line: 219, column: 64, scope: !514)
!526 = !DILocalVariable(name: "nx", arg: 4, scope: !514, file: !3, line: 220, type: !7)
!527 = !DILocation(line: 220, column: 28, scope: !514)
!528 = !DILocalVariable(name: "ny", arg: 5, scope: !514, file: !3, line: 220, type: !7)
!529 = !DILocation(line: 220, column: 42, scope: !514)
!530 = !DILocalVariable(name: "kn", arg: 6, scope: !514, file: !3, line: 220, type: !7)
!531 = !DILocation(line: 220, column: 56, scope: !514)
!532 = !DILocalVariable(name: "normalize", arg: 7, scope: !514, file: !3, line: 221, type: !519)
!533 = !DILocation(line: 221, column: 29, scope: !514)
!534 = !DILocation(line: 223, column: 5, scope: !535)
!535 = distinct !DILexicalBlock(scope: !536, file: !3, line: 223, column: 5)
!536 = distinct !DILexicalBlock(scope: !514, file: !3, line: 223, column: 5)
!537 = !DILocation(line: 223, column: 5, scope: !536)
!538 = !DILocation(line: 224, column: 5, scope: !539)
!539 = distinct !DILexicalBlock(scope: !540, file: !3, line: 224, column: 5)
!540 = distinct !DILexicalBlock(scope: !514, file: !3, line: 224, column: 5)
!541 = !DILocation(line: 224, column: 5, scope: !540)
!542 = !DILocalVariable(name: "khalf", scope: !514, file: !3, line: 225, type: !7)
!543 = !DILocation(line: 225, column: 15, scope: !514)
!544 = !DILocation(line: 225, column: 23, scope: !514)
!545 = !DILocation(line: 225, column: 26, scope: !514)
!546 = !DILocalVariable(name: "min", scope: !514, file: !3, line: 226, type: !28)
!547 = !DILocation(line: 226, column: 11, scope: !514)
!548 = !DILocalVariable(name: "max", scope: !514, file: !3, line: 226, type: !28)
!549 = !DILocation(line: 226, column: 26, scope: !514)
!550 = !DILocation(line: 228, column: 9, scope: !551)
!551 = distinct !DILexicalBlock(scope: !514, file: !3, line: 228, column: 9)
!552 = !DILocation(line: 228, column: 9, scope: !514)
!553 = !DILocalVariable(name: "m", scope: !554, file: !3, line: 229, type: !6)
!554 = distinct !DILexicalBlock(scope: !551, file: !3, line: 229, column: 9)
!555 = !DILocation(line: 229, column: 18, scope: !554)
!556 = !DILocation(line: 229, column: 22, scope: !554)
!557 = !DILocation(line: 229, column: 14, scope: !554)
!558 = !DILocation(line: 229, column: 29, scope: !559)
!559 = distinct !DILexicalBlock(scope: !554, file: !3, line: 229, column: 9)
!560 = !DILocation(line: 229, column: 33, scope: !559)
!561 = !DILocation(line: 229, column: 38, scope: !559)
!562 = !DILocation(line: 229, column: 36, scope: !559)
!563 = !DILocation(line: 229, column: 31, scope: !559)
!564 = !DILocation(line: 229, column: 9, scope: !554)
!565 = !DILocalVariable(name: "n", scope: !566, file: !3, line: 230, type: !6)
!566 = distinct !DILexicalBlock(scope: !559, file: !3, line: 230, column: 13)
!567 = !DILocation(line: 230, column: 22, scope: !566)
!568 = !DILocation(line: 230, column: 26, scope: !566)
!569 = !DILocation(line: 230, column: 18, scope: !566)
!570 = !DILocation(line: 230, column: 33, scope: !571)
!571 = distinct !DILexicalBlock(scope: !566, file: !3, line: 230, column: 13)
!572 = !DILocation(line: 230, column: 37, scope: !571)
!573 = !DILocation(line: 230, column: 42, scope: !571)
!574 = !DILocation(line: 230, column: 40, scope: !571)
!575 = !DILocation(line: 230, column: 35, scope: !571)
!576 = !DILocation(line: 230, column: 13, scope: !566)
!577 = !DILocalVariable(name: "pixel", scope: !578, file: !3, line: 231, type: !28)
!578 = distinct !DILexicalBlock(scope: !571, file: !3, line: 230, column: 54)
!579 = !DILocation(line: 231, column: 23, scope: !578)
!580 = !DILocalVariable(name: "c", scope: !578, file: !3, line: 232, type: !115)
!581 = !DILocation(line: 232, column: 24, scope: !578)
!582 = !DILocalVariable(name: "j", scope: !583, file: !3, line: 233, type: !6)
!583 = distinct !DILexicalBlock(scope: !578, file: !3, line: 233, column: 17)
!584 = !DILocation(line: 233, column: 26, scope: !583)
!585 = !DILocation(line: 233, column: 31, scope: !583)
!586 = !DILocation(line: 233, column: 30, scope: !583)
!587 = !DILocation(line: 233, column: 22, scope: !583)
!588 = !DILocation(line: 233, column: 38, scope: !589)
!589 = distinct !DILexicalBlock(scope: !583, file: !3, line: 233, column: 17)
!590 = !DILocation(line: 233, column: 43, scope: !589)
!591 = !DILocation(line: 233, column: 40, scope: !589)
!592 = !DILocation(line: 233, column: 17, scope: !583)
!593 = !DILocalVariable(name: "i", scope: !594, file: !3, line: 234, type: !6)
!594 = distinct !DILexicalBlock(scope: !589, file: !3, line: 234, column: 21)
!595 = !DILocation(line: 234, column: 30, scope: !594)
!596 = !DILocation(line: 234, column: 35, scope: !594)
!597 = !DILocation(line: 234, column: 34, scope: !594)
!598 = !DILocation(line: 234, column: 26, scope: !594)
!599 = !DILocation(line: 234, column: 42, scope: !600)
!600 = distinct !DILexicalBlock(scope: !594, file: !3, line: 234, column: 21)
!601 = !DILocation(line: 234, column: 47, scope: !600)
!602 = !DILocation(line: 234, column: 44, scope: !600)
!603 = !DILocation(line: 234, column: 21, scope: !594)
!604 = !DILocation(line: 235, column: 34, scope: !605)
!605 = distinct !DILexicalBlock(scope: !600, file: !3, line: 234, column: 59)
!606 = !DILocation(line: 235, column: 38, scope: !605)
!607 = !DILocation(line: 235, column: 42, scope: !605)
!608 = !DILocation(line: 235, column: 40, scope: !605)
!609 = !DILocation(line: 235, column: 47, scope: !605)
!610 = !DILocation(line: 235, column: 45, scope: !605)
!611 = !DILocation(line: 235, column: 52, scope: !605)
!612 = !DILocation(line: 235, column: 50, scope: !605)
!613 = !DILocation(line: 235, column: 56, scope: !605)
!614 = !DILocation(line: 235, column: 54, scope: !605)
!615 = !DILocation(line: 235, column: 61, scope: !605)
!616 = !DILocation(line: 235, column: 68, scope: !605)
!617 = !DILocation(line: 235, column: 59, scope: !605)
!618 = !DILocation(line: 235, column: 31, scope: !605)
!619 = !DILocation(line: 236, column: 26, scope: !605)
!620 = !DILocation(line: 237, column: 21, scope: !605)
!621 = !DILocation(line: 234, column: 55, scope: !600)
!622 = !DILocation(line: 234, column: 21, scope: !600)
!623 = distinct !{!623, !603, !624}
!624 = !DILocation(line: 237, column: 21, scope: !594)
!625 = !DILocation(line: 233, column: 51, scope: !589)
!626 = !DILocation(line: 233, column: 17, scope: !589)
!627 = distinct !{!627, !592, !628}
!628 = !DILocation(line: 237, column: 21, scope: !583)
!629 = !DILocation(line: 238, column: 21, scope: !630)
!630 = distinct !DILexicalBlock(scope: !578, file: !3, line: 238, column: 21)
!631 = !DILocation(line: 238, column: 29, scope: !630)
!632 = !DILocation(line: 238, column: 27, scope: !630)
!633 = !DILocation(line: 238, column: 21, scope: !578)
!634 = !DILocation(line: 239, column: 27, scope: !630)
!635 = !DILocation(line: 239, column: 25, scope: !630)
!636 = !DILocation(line: 239, column: 21, scope: !630)
!637 = !DILocation(line: 240, column: 21, scope: !638)
!638 = distinct !DILexicalBlock(scope: !578, file: !3, line: 240, column: 21)
!639 = !DILocation(line: 240, column: 29, scope: !638)
!640 = !DILocation(line: 240, column: 27, scope: !638)
!641 = !DILocation(line: 240, column: 21, scope: !578)
!642 = !DILocation(line: 241, column: 27, scope: !638)
!643 = !DILocation(line: 241, column: 25, scope: !638)
!644 = !DILocation(line: 241, column: 21, scope: !638)
!645 = !DILocation(line: 242, column: 17, scope: !578)
!646 = !DILocation(line: 230, column: 50, scope: !571)
!647 = !DILocation(line: 230, column: 13, scope: !571)
!648 = distinct !{!648, !576, !649}
!649 = !DILocation(line: 242, column: 17, scope: !566)
!650 = !DILocation(line: 229, column: 46, scope: !559)
!651 = !DILocation(line: 229, column: 9, scope: !559)
!652 = distinct !{!652, !564, !653}
!653 = !DILocation(line: 242, column: 17, scope: !554)
!654 = !DILocalVariable(name: "m", scope: !655, file: !3, line: 244, type: !6)
!655 = distinct !DILexicalBlock(scope: !514, file: !3, line: 244, column: 5)
!656 = !DILocation(line: 244, column: 14, scope: !655)
!657 = !DILocation(line: 244, column: 18, scope: !655)
!658 = !DILocation(line: 244, column: 10, scope: !655)
!659 = !DILocation(line: 244, column: 25, scope: !660)
!660 = distinct !DILexicalBlock(scope: !655, file: !3, line: 244, column: 5)
!661 = !DILocation(line: 244, column: 29, scope: !660)
!662 = !DILocation(line: 244, column: 34, scope: !660)
!663 = !DILocation(line: 244, column: 32, scope: !660)
!664 = !DILocation(line: 244, column: 27, scope: !660)
!665 = !DILocation(line: 244, column: 5, scope: !655)
!666 = !DILocalVariable(name: "n", scope: !667, file: !3, line: 245, type: !6)
!667 = distinct !DILexicalBlock(scope: !660, file: !3, line: 245, column: 9)
!668 = !DILocation(line: 245, column: 18, scope: !667)
!669 = !DILocation(line: 245, column: 22, scope: !667)
!670 = !DILocation(line: 245, column: 14, scope: !667)
!671 = !DILocation(line: 245, column: 29, scope: !672)
!672 = distinct !DILexicalBlock(scope: !667, file: !3, line: 245, column: 9)
!673 = !DILocation(line: 245, column: 33, scope: !672)
!674 = !DILocation(line: 245, column: 38, scope: !672)
!675 = !DILocation(line: 245, column: 36, scope: !672)
!676 = !DILocation(line: 245, column: 31, scope: !672)
!677 = !DILocation(line: 245, column: 9, scope: !667)
!678 = !DILocalVariable(name: "pixel", scope: !679, file: !3, line: 246, type: !28)
!679 = distinct !DILexicalBlock(scope: !672, file: !3, line: 245, column: 50)
!680 = !DILocation(line: 246, column: 19, scope: !679)
!681 = !DILocalVariable(name: "c", scope: !679, file: !3, line: 247, type: !115)
!682 = !DILocation(line: 247, column: 20, scope: !679)
!683 = !DILocalVariable(name: "j", scope: !684, file: !3, line: 248, type: !6)
!684 = distinct !DILexicalBlock(scope: !679, file: !3, line: 248, column: 13)
!685 = !DILocation(line: 248, column: 22, scope: !684)
!686 = !DILocation(line: 248, column: 27, scope: !684)
!687 = !DILocation(line: 248, column: 26, scope: !684)
!688 = !DILocation(line: 248, column: 18, scope: !684)
!689 = !DILocation(line: 248, column: 34, scope: !690)
!690 = distinct !DILexicalBlock(scope: !684, file: !3, line: 248, column: 13)
!691 = !DILocation(line: 248, column: 39, scope: !690)
!692 = !DILocation(line: 248, column: 36, scope: !690)
!693 = !DILocation(line: 248, column: 13, scope: !684)
!694 = !DILocalVariable(name: "i", scope: !695, file: !3, line: 249, type: !6)
!695 = distinct !DILexicalBlock(scope: !690, file: !3, line: 249, column: 17)
!696 = !DILocation(line: 249, column: 26, scope: !695)
!697 = !DILocation(line: 249, column: 31, scope: !695)
!698 = !DILocation(line: 249, column: 30, scope: !695)
!699 = !DILocation(line: 249, column: 22, scope: !695)
!700 = !DILocation(line: 249, column: 38, scope: !701)
!701 = distinct !DILexicalBlock(scope: !695, file: !3, line: 249, column: 17)
!702 = !DILocation(line: 249, column: 43, scope: !701)
!703 = !DILocation(line: 249, column: 40, scope: !701)
!704 = !DILocation(line: 249, column: 17, scope: !695)
!705 = !DILocation(line: 250, column: 30, scope: !706)
!706 = distinct !DILexicalBlock(scope: !701, file: !3, line: 249, column: 55)
!707 = !DILocation(line: 250, column: 34, scope: !706)
!708 = !DILocation(line: 250, column: 38, scope: !706)
!709 = !DILocation(line: 250, column: 36, scope: !706)
!710 = !DILocation(line: 250, column: 43, scope: !706)
!711 = !DILocation(line: 250, column: 41, scope: !706)
!712 = !DILocation(line: 250, column: 48, scope: !706)
!713 = !DILocation(line: 250, column: 46, scope: !706)
!714 = !DILocation(line: 250, column: 52, scope: !706)
!715 = !DILocation(line: 250, column: 50, scope: !706)
!716 = !DILocation(line: 250, column: 57, scope: !706)
!717 = !DILocation(line: 250, column: 64, scope: !706)
!718 = !DILocation(line: 250, column: 55, scope: !706)
!719 = !DILocation(line: 250, column: 27, scope: !706)
!720 = !DILocation(line: 251, column: 22, scope: !706)
!721 = !DILocation(line: 252, column: 17, scope: !706)
!722 = !DILocation(line: 249, column: 51, scope: !701)
!723 = !DILocation(line: 249, column: 17, scope: !701)
!724 = distinct !{!724, !704, !725}
!725 = !DILocation(line: 252, column: 17, scope: !695)
!726 = !DILocation(line: 248, column: 47, scope: !690)
!727 = !DILocation(line: 248, column: 13, scope: !690)
!728 = distinct !{!728, !693, !729}
!729 = !DILocation(line: 252, column: 17, scope: !684)
!730 = !DILocation(line: 254, column: 17, scope: !731)
!731 = distinct !DILexicalBlock(scope: !679, file: !3, line: 254, column: 17)
!732 = !DILocation(line: 254, column: 17, scope: !679)
!733 = !DILocation(line: 255, column: 43, scope: !731)
!734 = !DILocation(line: 255, column: 51, scope: !731)
!735 = !DILocation(line: 255, column: 49, scope: !731)
!736 = !DILocation(line: 255, column: 40, scope: !731)
!737 = !DILocation(line: 255, column: 59, scope: !731)
!738 = !DILocation(line: 255, column: 65, scope: !731)
!739 = !DILocation(line: 255, column: 63, scope: !731)
!740 = !DILocation(line: 255, column: 56, scope: !731)
!741 = !DILocation(line: 255, column: 23, scope: !731)
!742 = !DILocation(line: 255, column: 17, scope: !731)
!743 = !DILocation(line: 256, column: 40, scope: !679)
!744 = !DILocation(line: 256, column: 31, scope: !679)
!745 = !DILocation(line: 256, column: 13, scope: !679)
!746 = !DILocation(line: 256, column: 17, scope: !679)
!747 = !DILocation(line: 256, column: 21, scope: !679)
!748 = !DILocation(line: 256, column: 19, scope: !679)
!749 = !DILocation(line: 256, column: 26, scope: !679)
!750 = !DILocation(line: 256, column: 24, scope: !679)
!751 = !DILocation(line: 256, column: 29, scope: !679)
!752 = !DILocation(line: 257, column: 9, scope: !679)
!753 = !DILocation(line: 245, column: 46, scope: !672)
!754 = !DILocation(line: 245, column: 9, scope: !672)
!755 = distinct !{!755, !677, !756}
!756 = !DILocation(line: 257, column: 9, scope: !667)
!757 = !DILocation(line: 244, column: 42, scope: !660)
!758 = !DILocation(line: 244, column: 5, scope: !660)
!759 = distinct !{!759, !665, !760}
!760 = !DILocation(line: 257, column: 9, scope: !655)
!761 = !DILocation(line: 258, column: 1, scope: !514)
!762 = distinct !DISubprogram(name: "gaussian_filter", scope: !3, file: !3, line: 272, type: !763, scopeLine: 274, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !13, retainedNodes: !14)
!763 = !DISubroutineType(types: !764)
!764 = !{null, !307, !30, !7, !7, !518}
!765 = !DILocalVariable(name: "in", arg: 1, scope: !762, file: !3, line: 272, type: !307)
!766 = !DILocation(line: 272, column: 37, scope: !762)
!767 = !DILocalVariable(name: "out", arg: 2, scope: !762, file: !3, line: 272, type: !30)
!768 = !DILocation(line: 272, column: 50, scope: !762)
!769 = !DILocalVariable(name: "nx", arg: 3, scope: !762, file: !3, line: 273, type: !7)
!770 = !DILocation(line: 273, column: 32, scope: !762)
!771 = !DILocalVariable(name: "ny", arg: 4, scope: !762, file: !3, line: 273, type: !7)
!772 = !DILocation(line: 273, column: 46, scope: !762)
!773 = !DILocalVariable(name: "sigma", arg: 5, scope: !762, file: !3, line: 273, type: !518)
!774 = !DILocation(line: 273, column: 62, scope: !762)
!775 = !DILocalVariable(name: "n", scope: !762, file: !3, line: 275, type: !7)
!776 = !DILocation(line: 275, column: 15, scope: !762)
!777 = !DILocation(line: 275, column: 33, scope: !762)
!778 = !DILocation(line: 275, column: 31, scope: !762)
!779 = !DILocation(line: 275, column: 23, scope: !762)
!780 = !DILocation(line: 275, column: 21, scope: !762)
!781 = !DILocation(line: 275, column: 40, scope: !762)
!782 = !DILocalVariable(name: "mean", scope: !762, file: !3, line: 276, type: !518)
!783 = !DILocation(line: 276, column: 17, scope: !762)
!784 = !DILocation(line: 276, column: 37, scope: !762)
!785 = !DILocation(line: 276, column: 39, scope: !762)
!786 = !DILocation(line: 276, column: 31, scope: !762)
!787 = !DILocation(line: 276, column: 24, scope: !762)
!788 = !DILocation(line: 277, column: 18, scope: !762)
!789 = !DILocation(line: 277, column: 22, scope: !762)
!790 = !DILocation(line: 277, column: 20, scope: !762)
!791 = !DILocation(line: 277, column: 5, scope: !762)
!792 = !DILocalVariable(name: "__vla_expr0", scope: !762, type: !117, flags: DIFlagArtificial)
!793 = !DILocation(line: 0, scope: !762)
!794 = !DILocalVariable(name: "kernel", scope: !762, file: !3, line: 277, type: !795)
!795 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, elements: !796)
!796 = !{!797}
!797 = !DISubrange(count: !792)
!798 = !DILocation(line: 277, column: 11, scope: !762)
!799 = !DILocation(line: 279, column: 13, scope: !762)
!800 = !DILocation(line: 280, column: 13, scope: !762)
!801 = !DILocation(line: 280, column: 16, scope: !762)
!802 = !DILocation(line: 279, column: 5, scope: !762)
!803 = !DILocalVariable(name: "c", scope: !762, file: !3, line: 281, type: !115)
!804 = !DILocation(line: 281, column: 12, scope: !762)
!805 = !DILocalVariable(name: "i", scope: !806, file: !3, line: 282, type: !6)
!806 = distinct !DILexicalBlock(scope: !762, file: !3, line: 282, column: 5)
!807 = !DILocation(line: 282, column: 14, scope: !806)
!808 = !DILocation(line: 282, column: 10, scope: !806)
!809 = !DILocation(line: 282, column: 21, scope: !810)
!810 = distinct !DILexicalBlock(scope: !806, file: !3, line: 282, column: 5)
!811 = !DILocation(line: 282, column: 25, scope: !810)
!812 = !DILocation(line: 282, column: 23, scope: !810)
!813 = !DILocation(line: 282, column: 5, scope: !806)
!814 = !DILocalVariable(name: "j", scope: !815, file: !3, line: 283, type: !6)
!815 = distinct !DILexicalBlock(scope: !810, file: !3, line: 283, column: 9)
!816 = !DILocation(line: 283, column: 18, scope: !815)
!817 = !DILocation(line: 283, column: 14, scope: !815)
!818 = !DILocation(line: 283, column: 25, scope: !819)
!819 = distinct !DILexicalBlock(scope: !815, file: !3, line: 283, column: 9)
!820 = !DILocation(line: 283, column: 29, scope: !819)
!821 = !DILocation(line: 283, column: 27, scope: !819)
!822 = !DILocation(line: 283, column: 9, scope: !815)
!823 = !DILocation(line: 284, column: 42, scope: !824)
!824 = distinct !DILexicalBlock(scope: !819, file: !3, line: 283, column: 37)
!825 = !DILocation(line: 284, column: 46, scope: !824)
!826 = !DILocation(line: 284, column: 44, scope: !824)
!827 = !DILocation(line: 284, column: 54, scope: !824)
!828 = !DILocation(line: 284, column: 52, scope: !824)
!829 = !DILocation(line: 284, column: 41, scope: !824)
!830 = !DILocation(line: 284, column: 37, scope: !824)
!831 = !DILocation(line: 285, column: 42, scope: !824)
!832 = !DILocation(line: 285, column: 46, scope: !824)
!833 = !DILocation(line: 285, column: 44, scope: !824)
!834 = !DILocation(line: 285, column: 54, scope: !824)
!835 = !DILocation(line: 285, column: 52, scope: !824)
!836 = !DILocation(line: 285, column: 41, scope: !824)
!837 = !DILocation(line: 285, column: 37, scope: !824)
!838 = !DILocation(line: 284, column: 66, scope: !824)
!839 = !DILocation(line: 284, column: 34, scope: !824)
!840 = !DILocation(line: 284, column: 25, scope: !824)
!841 = !DILocation(line: 286, column: 39, scope: !824)
!842 = !DILocation(line: 286, column: 37, scope: !824)
!843 = !DILocation(line: 286, column: 47, scope: !824)
!844 = !DILocation(line: 286, column: 45, scope: !824)
!845 = !DILocation(line: 286, column: 25, scope: !824)
!846 = !DILocation(line: 284, column: 20, scope: !824)
!847 = !DILocation(line: 284, column: 13, scope: !824)
!848 = !DILocation(line: 284, column: 23, scope: !824)
!849 = !DILocation(line: 287, column: 14, scope: !824)
!850 = !DILocation(line: 288, column: 9, scope: !824)
!851 = !DILocation(line: 283, column: 33, scope: !819)
!852 = !DILocation(line: 283, column: 9, scope: !819)
!853 = distinct !{!853, !822, !854}
!854 = !DILocation(line: 288, column: 9, scope: !815)
!855 = !DILocation(line: 282, column: 29, scope: !810)
!856 = !DILocation(line: 282, column: 5, scope: !810)
!857 = distinct !{!857, !813, !858}
!858 = !DILocation(line: 288, column: 9, scope: !806)
!859 = !DILocation(line: 290, column: 17, scope: !762)
!860 = !DILocation(line: 290, column: 21, scope: !762)
!861 = !DILocation(line: 290, column: 34, scope: !762)
!862 = !DILocation(line: 290, column: 38, scope: !762)
!863 = !DILocation(line: 290, column: 42, scope: !762)
!864 = !DILocation(line: 290, column: 5, scope: !762)
!865 = !DILocation(line: 291, column: 1, scope: !762)
!866 = distinct !DISubprogram(name: "canny_edge_detection", scope: !3, file: !3, line: 302, type: !867, scopeLine: 306, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !13, retainedNodes: !14)
!867 = !DISubroutineType(types: !868)
!868 = !{!30, !307, !305, !7, !7, !518}
!869 = !DILocalVariable(name: "in", arg: 1, scope: !866, file: !3, line: 302, type: !307)
!870 = !DILocation(line: 302, column: 46, scope: !866)
!871 = !DILocalVariable(name: "bmp_ih", arg: 2, scope: !866, file: !3, line: 303, type: !305)
!872 = !DILocation(line: 303, column: 59, scope: !866)
!873 = !DILocalVariable(name: "tmin", arg: 3, scope: !866, file: !3, line: 304, type: !7)
!874 = !DILocation(line: 304, column: 41, scope: !866)
!875 = !DILocalVariable(name: "tmax", arg: 4, scope: !866, file: !3, line: 304, type: !7)
!876 = !DILocation(line: 304, column: 57, scope: !866)
!877 = !DILocalVariable(name: "sigma", arg: 5, scope: !866, file: !3, line: 305, type: !518)
!878 = !DILocation(line: 305, column: 43, scope: !866)
!879 = !DILocalVariable(name: "nx", scope: !866, file: !3, line: 307, type: !7)
!880 = !DILocation(line: 307, column: 15, scope: !866)
!881 = !DILocation(line: 307, column: 20, scope: !866)
!882 = !DILocation(line: 307, column: 28, scope: !866)
!883 = !DILocalVariable(name: "ny", scope: !866, file: !3, line: 308, type: !7)
!884 = !DILocation(line: 308, column: 15, scope: !866)
!885 = !DILocation(line: 308, column: 20, scope: !866)
!886 = !DILocation(line: 308, column: 28, scope: !866)
!887 = !DILocalVariable(name: "G", scope: !866, file: !3, line: 310, type: !30)
!888 = !DILocation(line: 310, column: 14, scope: !866)
!889 = !DILocation(line: 310, column: 25, scope: !866)
!890 = !DILocation(line: 310, column: 30, scope: !866)
!891 = !DILocation(line: 310, column: 28, scope: !866)
!892 = !DILocation(line: 310, column: 33, scope: !866)
!893 = !DILocation(line: 310, column: 18, scope: !866)
!894 = !DILocalVariable(name: "after_Gx", scope: !866, file: !3, line: 311, type: !30)
!895 = !DILocation(line: 311, column: 14, scope: !866)
!896 = !DILocation(line: 311, column: 32, scope: !866)
!897 = !DILocation(line: 311, column: 37, scope: !866)
!898 = !DILocation(line: 311, column: 35, scope: !866)
!899 = !DILocation(line: 311, column: 40, scope: !866)
!900 = !DILocation(line: 311, column: 25, scope: !866)
!901 = !DILocalVariable(name: "after_Gy", scope: !866, file: !3, line: 312, type: !30)
!902 = !DILocation(line: 312, column: 14, scope: !866)
!903 = !DILocation(line: 312, column: 32, scope: !866)
!904 = !DILocation(line: 312, column: 37, scope: !866)
!905 = !DILocation(line: 312, column: 35, scope: !866)
!906 = !DILocation(line: 312, column: 40, scope: !866)
!907 = !DILocation(line: 312, column: 25, scope: !866)
!908 = !DILocalVariable(name: "nms", scope: !866, file: !3, line: 313, type: !30)
!909 = !DILocation(line: 313, column: 14, scope: !866)
!910 = !DILocation(line: 313, column: 27, scope: !866)
!911 = !DILocation(line: 313, column: 32, scope: !866)
!912 = !DILocation(line: 313, column: 30, scope: !866)
!913 = !DILocation(line: 313, column: 35, scope: !866)
!914 = !DILocation(line: 313, column: 20, scope: !866)
!915 = !DILocalVariable(name: "out", scope: !866, file: !3, line: 314, type: !30)
!916 = !DILocation(line: 314, column: 14, scope: !866)
!917 = !DILocation(line: 314, column: 27, scope: !866)
!918 = !DILocation(line: 314, column: 35, scope: !866)
!919 = !DILocation(line: 314, column: 46, scope: !866)
!920 = !DILocation(line: 314, column: 20, scope: !866)
!921 = !DILocation(line: 316, column: 9, scope: !922)
!922 = distinct !DILexicalBlock(scope: !866, file: !3, line: 316, column: 9)
!923 = !DILocation(line: 316, column: 11, scope: !922)
!924 = !DILocation(line: 316, column: 19, scope: !922)
!925 = !DILocation(line: 316, column: 22, scope: !922)
!926 = !DILocation(line: 316, column: 31, scope: !922)
!927 = !DILocation(line: 316, column: 39, scope: !922)
!928 = !DILocation(line: 316, column: 42, scope: !922)
!929 = !DILocation(line: 316, column: 51, scope: !922)
!930 = !DILocation(line: 316, column: 59, scope: !922)
!931 = !DILocation(line: 317, column: 9, scope: !922)
!932 = !DILocation(line: 317, column: 13, scope: !922)
!933 = !DILocation(line: 317, column: 21, scope: !922)
!934 = !DILocation(line: 317, column: 24, scope: !922)
!935 = !DILocation(line: 317, column: 28, scope: !922)
!936 = !DILocation(line: 316, column: 9, scope: !866)
!937 = !DILocation(line: 318, column: 17, scope: !938)
!938 = distinct !DILexicalBlock(scope: !922, file: !3, line: 317, column: 37)
!939 = !DILocation(line: 318, column: 9, scope: !938)
!940 = !DILocation(line: 320, column: 9, scope: !938)
!941 = !DILocation(line: 323, column: 21, scope: !866)
!942 = !DILocation(line: 323, column: 25, scope: !866)
!943 = !DILocation(line: 323, column: 30, scope: !866)
!944 = !DILocation(line: 323, column: 34, scope: !866)
!945 = !DILocation(line: 323, column: 38, scope: !866)
!946 = !DILocation(line: 323, column: 5, scope: !866)
!947 = !DILocalVariable(name: "Gx", scope: !866, file: !3, line: 325, type: !948)
!948 = !DICompositeType(tag: DW_TAG_array_type, baseType: !518, size: 288, elements: !949)
!949 = !{!950}
!950 = !DISubrange(count: 9)
!951 = !DILocation(line: 325, column: 17, scope: !866)
!952 = !DILocation(line: 329, column: 17, scope: !866)
!953 = !DILocation(line: 329, column: 22, scope: !866)
!954 = !DILocation(line: 329, column: 32, scope: !866)
!955 = !DILocation(line: 329, column: 36, scope: !866)
!956 = !DILocation(line: 329, column: 40, scope: !866)
!957 = !DILocation(line: 329, column: 5, scope: !866)
!958 = !DILocalVariable(name: "Gy", scope: !866, file: !3, line: 331, type: !948)
!959 = !DILocation(line: 331, column: 17, scope: !866)
!960 = !DILocation(line: 335, column: 17, scope: !866)
!961 = !DILocation(line: 335, column: 22, scope: !866)
!962 = !DILocation(line: 335, column: 32, scope: !866)
!963 = !DILocation(line: 335, column: 36, scope: !866)
!964 = !DILocation(line: 335, column: 40, scope: !866)
!965 = !DILocation(line: 335, column: 5, scope: !866)
!966 = !DILocalVariable(name: "i", scope: !967, file: !3, line: 337, type: !6)
!967 = distinct !DILexicalBlock(scope: !866, file: !3, line: 337, column: 5)
!968 = !DILocation(line: 337, column: 14, scope: !967)
!969 = !DILocation(line: 337, column: 10, scope: !967)
!970 = !DILocation(line: 337, column: 21, scope: !971)
!971 = distinct !DILexicalBlock(scope: !967, file: !3, line: 337, column: 5)
!972 = !DILocation(line: 337, column: 25, scope: !971)
!973 = !DILocation(line: 337, column: 28, scope: !971)
!974 = !DILocation(line: 337, column: 23, scope: !971)
!975 = !DILocation(line: 337, column: 5, scope: !967)
!976 = !DILocalVariable(name: "j", scope: !977, file: !3, line: 338, type: !6)
!977 = distinct !DILexicalBlock(scope: !971, file: !3, line: 338, column: 9)
!978 = !DILocation(line: 338, column: 18, scope: !977)
!979 = !DILocation(line: 338, column: 14, scope: !977)
!980 = !DILocation(line: 338, column: 25, scope: !981)
!981 = distinct !DILexicalBlock(scope: !977, file: !3, line: 338, column: 9)
!982 = !DILocation(line: 338, column: 29, scope: !981)
!983 = !DILocation(line: 338, column: 32, scope: !981)
!984 = !DILocation(line: 338, column: 27, scope: !981)
!985 = !DILocation(line: 338, column: 9, scope: !977)
!986 = !DILocalVariable(name: "c", scope: !987, file: !3, line: 339, type: !7)
!987 = distinct !DILexicalBlock(scope: !981, file: !3, line: 338, column: 42)
!988 = !DILocation(line: 339, column: 23, scope: !987)
!989 = !DILocation(line: 339, column: 27, scope: !987)
!990 = !DILocation(line: 339, column: 31, scope: !987)
!991 = !DILocation(line: 339, column: 36, scope: !987)
!992 = !DILocation(line: 339, column: 34, scope: !987)
!993 = !DILocation(line: 339, column: 29, scope: !987)
!994 = !DILocation(line: 341, column: 35, scope: !987)
!995 = !DILocation(line: 341, column: 44, scope: !987)
!996 = !DILocation(line: 341, column: 48, scope: !987)
!997 = !DILocation(line: 341, column: 57, scope: !987)
!998 = !DILocation(line: 341, column: 29, scope: !987)
!999 = !DILocation(line: 341, column: 20, scope: !987)
!1000 = !DILocation(line: 341, column: 13, scope: !987)
!1001 = !DILocation(line: 341, column: 15, scope: !987)
!1002 = !DILocation(line: 341, column: 18, scope: !987)
!1003 = !DILocation(line: 342, column: 9, scope: !987)
!1004 = !DILocation(line: 338, column: 38, scope: !981)
!1005 = !DILocation(line: 338, column: 9, scope: !981)
!1006 = distinct !{!1006, !985, !1007}
!1007 = !DILocation(line: 342, column: 9, scope: !977)
!1008 = !DILocation(line: 337, column: 34, scope: !971)
!1009 = !DILocation(line: 337, column: 5, scope: !971)
!1010 = distinct !{!1010, !975, !1011}
!1011 = !DILocation(line: 342, column: 9, scope: !967)
!1012 = !DILocalVariable(name: "i", scope: !1013, file: !3, line: 345, type: !6)
!1013 = distinct !DILexicalBlock(scope: !866, file: !3, line: 345, column: 5)
!1014 = !DILocation(line: 345, column: 14, scope: !1013)
!1015 = !DILocation(line: 345, column: 10, scope: !1013)
!1016 = !DILocation(line: 345, column: 21, scope: !1017)
!1017 = distinct !DILexicalBlock(scope: !1013, file: !3, line: 345, column: 5)
!1018 = !DILocation(line: 345, column: 25, scope: !1017)
!1019 = !DILocation(line: 345, column: 28, scope: !1017)
!1020 = !DILocation(line: 345, column: 23, scope: !1017)
!1021 = !DILocation(line: 345, column: 5, scope: !1013)
!1022 = !DILocalVariable(name: "j", scope: !1023, file: !3, line: 346, type: !6)
!1023 = distinct !DILexicalBlock(scope: !1017, file: !3, line: 346, column: 9)
!1024 = !DILocation(line: 346, column: 18, scope: !1023)
!1025 = !DILocation(line: 346, column: 14, scope: !1023)
!1026 = !DILocation(line: 346, column: 25, scope: !1027)
!1027 = distinct !DILexicalBlock(scope: !1023, file: !3, line: 346, column: 9)
!1028 = !DILocation(line: 346, column: 29, scope: !1027)
!1029 = !DILocation(line: 346, column: 32, scope: !1027)
!1030 = !DILocation(line: 346, column: 27, scope: !1027)
!1031 = !DILocation(line: 346, column: 9, scope: !1023)
!1032 = !DILocalVariable(name: "c", scope: !1033, file: !3, line: 347, type: !7)
!1033 = distinct !DILexicalBlock(scope: !1027, file: !3, line: 346, column: 42)
!1034 = !DILocation(line: 347, column: 23, scope: !1033)
!1035 = !DILocation(line: 347, column: 27, scope: !1033)
!1036 = !DILocation(line: 347, column: 31, scope: !1033)
!1037 = !DILocation(line: 347, column: 36, scope: !1033)
!1038 = !DILocation(line: 347, column: 34, scope: !1033)
!1039 = !DILocation(line: 347, column: 29, scope: !1033)
!1040 = !DILocalVariable(name: "nn", scope: !1033, file: !3, line: 348, type: !7)
!1041 = !DILocation(line: 348, column: 23, scope: !1033)
!1042 = !DILocation(line: 348, column: 28, scope: !1033)
!1043 = !DILocation(line: 348, column: 32, scope: !1033)
!1044 = !DILocation(line: 348, column: 30, scope: !1033)
!1045 = !DILocalVariable(name: "ss", scope: !1033, file: !3, line: 349, type: !7)
!1046 = !DILocation(line: 349, column: 23, scope: !1033)
!1047 = !DILocation(line: 349, column: 28, scope: !1033)
!1048 = !DILocation(line: 349, column: 32, scope: !1033)
!1049 = !DILocation(line: 349, column: 30, scope: !1033)
!1050 = !DILocalVariable(name: "ww", scope: !1033, file: !3, line: 350, type: !7)
!1051 = !DILocation(line: 350, column: 23, scope: !1033)
!1052 = !DILocation(line: 350, column: 28, scope: !1033)
!1053 = !DILocation(line: 350, column: 30, scope: !1033)
!1054 = !DILocalVariable(name: "ee", scope: !1033, file: !3, line: 351, type: !7)
!1055 = !DILocation(line: 351, column: 23, scope: !1033)
!1056 = !DILocation(line: 351, column: 28, scope: !1033)
!1057 = !DILocation(line: 351, column: 30, scope: !1033)
!1058 = !DILocalVariable(name: "nw", scope: !1033, file: !3, line: 352, type: !7)
!1059 = !DILocation(line: 352, column: 23, scope: !1033)
!1060 = !DILocation(line: 352, column: 28, scope: !1033)
!1061 = !DILocation(line: 352, column: 31, scope: !1033)
!1062 = !DILocalVariable(name: "ne", scope: !1033, file: !3, line: 353, type: !7)
!1063 = !DILocation(line: 353, column: 23, scope: !1033)
!1064 = !DILocation(line: 353, column: 28, scope: !1033)
!1065 = !DILocation(line: 353, column: 31, scope: !1033)
!1066 = !DILocalVariable(name: "sw", scope: !1033, file: !3, line: 354, type: !7)
!1067 = !DILocation(line: 354, column: 23, scope: !1033)
!1068 = !DILocation(line: 354, column: 28, scope: !1033)
!1069 = !DILocation(line: 354, column: 31, scope: !1033)
!1070 = !DILocalVariable(name: "se", scope: !1033, file: !3, line: 355, type: !7)
!1071 = !DILocation(line: 355, column: 23, scope: !1033)
!1072 = !DILocation(line: 355, column: 28, scope: !1033)
!1073 = !DILocation(line: 355, column: 31, scope: !1033)
!1074 = !DILocalVariable(name: "dir", scope: !1033, file: !3, line: 357, type: !518)
!1075 = !DILocation(line: 357, column: 25, scope: !1033)
!1076 = !DILocation(line: 357, column: 50, scope: !1033)
!1077 = !DILocation(line: 357, column: 59, scope: !1033)
!1078 = !DILocation(line: 358, column: 50, scope: !1033)
!1079 = !DILocation(line: 358, column: 59, scope: !1033)
!1080 = !DILocation(line: 357, column: 44, scope: !1033)
!1081 = !DILocation(line: 358, column: 63, scope: !1033)
!1082 = !DILocation(line: 357, column: 39, scope: !1033)
!1083 = !DILocation(line: 359, column: 50, scope: !1033)
!1084 = !DILocation(line: 357, column: 31, scope: !1033)
!1085 = !DILocation(line: 359, column: 58, scope: !1033)
!1086 = !DILocation(line: 361, column: 19, scope: !1087)
!1087 = distinct !DILexicalBlock(scope: !1033, file: !3, line: 361, column: 17)
!1088 = !DILocation(line: 361, column: 23, scope: !1087)
!1089 = !DILocation(line: 361, column: 28, scope: !1087)
!1090 = !DILocation(line: 361, column: 31, scope: !1087)
!1091 = !DILocation(line: 361, column: 35, scope: !1087)
!1092 = !DILocation(line: 361, column: 40, scope: !1087)
!1093 = !DILocation(line: 361, column: 43, scope: !1087)
!1094 = !DILocation(line: 361, column: 45, scope: !1087)
!1095 = !DILocation(line: 361, column: 50, scope: !1087)
!1096 = !DILocation(line: 361, column: 52, scope: !1087)
!1097 = !DILocation(line: 361, column: 48, scope: !1087)
!1098 = !DILocation(line: 361, column: 56, scope: !1087)
!1099 = !DILocation(line: 362, column: 18, scope: !1087)
!1100 = !DILocation(line: 362, column: 20, scope: !1087)
!1101 = !DILocation(line: 362, column: 25, scope: !1087)
!1102 = !DILocation(line: 362, column: 27, scope: !1087)
!1103 = !DILocation(line: 362, column: 23, scope: !1087)
!1104 = !DILocation(line: 362, column: 32, scope: !1087)
!1105 = !DILocation(line: 363, column: 19, scope: !1087)
!1106 = !DILocation(line: 363, column: 23, scope: !1087)
!1107 = !DILocation(line: 363, column: 27, scope: !1087)
!1108 = !DILocation(line: 363, column: 30, scope: !1087)
!1109 = !DILocation(line: 363, column: 34, scope: !1087)
!1110 = !DILocation(line: 363, column: 40, scope: !1087)
!1111 = !DILocation(line: 363, column: 43, scope: !1087)
!1112 = !DILocation(line: 363, column: 45, scope: !1087)
!1113 = !DILocation(line: 363, column: 50, scope: !1087)
!1114 = !DILocation(line: 363, column: 52, scope: !1087)
!1115 = !DILocation(line: 363, column: 48, scope: !1087)
!1116 = !DILocation(line: 363, column: 56, scope: !1087)
!1117 = !DILocation(line: 364, column: 18, scope: !1087)
!1118 = !DILocation(line: 364, column: 20, scope: !1087)
!1119 = !DILocation(line: 364, column: 25, scope: !1087)
!1120 = !DILocation(line: 364, column: 27, scope: !1087)
!1121 = !DILocation(line: 364, column: 23, scope: !1087)
!1122 = !DILocation(line: 364, column: 32, scope: !1087)
!1123 = !DILocation(line: 365, column: 19, scope: !1087)
!1124 = !DILocation(line: 365, column: 23, scope: !1087)
!1125 = !DILocation(line: 365, column: 27, scope: !1087)
!1126 = !DILocation(line: 365, column: 30, scope: !1087)
!1127 = !DILocation(line: 365, column: 34, scope: !1087)
!1128 = !DILocation(line: 365, column: 40, scope: !1087)
!1129 = !DILocation(line: 365, column: 43, scope: !1087)
!1130 = !DILocation(line: 365, column: 45, scope: !1087)
!1131 = !DILocation(line: 365, column: 50, scope: !1087)
!1132 = !DILocation(line: 365, column: 52, scope: !1087)
!1133 = !DILocation(line: 365, column: 48, scope: !1087)
!1134 = !DILocation(line: 365, column: 56, scope: !1087)
!1135 = !DILocation(line: 366, column: 18, scope: !1087)
!1136 = !DILocation(line: 366, column: 20, scope: !1087)
!1137 = !DILocation(line: 366, column: 25, scope: !1087)
!1138 = !DILocation(line: 366, column: 27, scope: !1087)
!1139 = !DILocation(line: 366, column: 23, scope: !1087)
!1140 = !DILocation(line: 366, column: 32, scope: !1087)
!1141 = !DILocation(line: 367, column: 19, scope: !1087)
!1142 = !DILocation(line: 367, column: 23, scope: !1087)
!1143 = !DILocation(line: 367, column: 27, scope: !1087)
!1144 = !DILocation(line: 367, column: 30, scope: !1087)
!1145 = !DILocation(line: 367, column: 34, scope: !1087)
!1146 = !DILocation(line: 367, column: 40, scope: !1087)
!1147 = !DILocation(line: 367, column: 43, scope: !1087)
!1148 = !DILocation(line: 367, column: 45, scope: !1087)
!1149 = !DILocation(line: 367, column: 50, scope: !1087)
!1150 = !DILocation(line: 367, column: 52, scope: !1087)
!1151 = !DILocation(line: 367, column: 48, scope: !1087)
!1152 = !DILocation(line: 367, column: 56, scope: !1087)
!1153 = !DILocation(line: 368, column: 18, scope: !1087)
!1154 = !DILocation(line: 368, column: 20, scope: !1087)
!1155 = !DILocation(line: 368, column: 25, scope: !1087)
!1156 = !DILocation(line: 368, column: 27, scope: !1087)
!1157 = !DILocation(line: 368, column: 23, scope: !1087)
!1158 = !DILocation(line: 361, column: 17, scope: !1033)
!1159 = !DILocation(line: 369, column: 26, scope: !1087)
!1160 = !DILocation(line: 369, column: 28, scope: !1087)
!1161 = !DILocation(line: 369, column: 17, scope: !1087)
!1162 = !DILocation(line: 369, column: 21, scope: !1087)
!1163 = !DILocation(line: 369, column: 24, scope: !1087)
!1164 = !DILocation(line: 371, column: 17, scope: !1087)
!1165 = !DILocation(line: 371, column: 21, scope: !1087)
!1166 = !DILocation(line: 371, column: 24, scope: !1087)
!1167 = !DILocation(line: 372, column: 9, scope: !1033)
!1168 = !DILocation(line: 346, column: 38, scope: !1027)
!1169 = !DILocation(line: 346, column: 9, scope: !1027)
!1170 = distinct !{!1170, !1031, !1171}
!1171 = !DILocation(line: 372, column: 9, scope: !1023)
!1172 = !DILocation(line: 345, column: 34, scope: !1017)
!1173 = !DILocation(line: 345, column: 5, scope: !1017)
!1174 = distinct !{!1174, !1021, !1175}
!1175 = !DILocation(line: 372, column: 9, scope: !1013)
!1176 = !DILocalVariable(name: "edges", scope: !866, file: !3, line: 376, type: !29)
!1177 = !DILocation(line: 376, column: 10, scope: !866)
!1178 = !DILocation(line: 376, column: 25, scope: !866)
!1179 = !DILocation(line: 376, column: 18, scope: !866)
!1180 = !DILocation(line: 377, column: 12, scope: !866)
!1181 = !DILocation(line: 377, column: 5, scope: !866)
!1182 = !DILocation(line: 377, column: 38, scope: !866)
!1183 = !DILocation(line: 377, column: 36, scope: !866)
!1184 = !DILocation(line: 377, column: 43, scope: !866)
!1185 = !DILocation(line: 377, column: 41, scope: !866)
!1186 = !DILocation(line: 378, column: 12, scope: !866)
!1187 = !DILocation(line: 378, column: 5, scope: !866)
!1188 = !DILocation(line: 378, column: 40, scope: !866)
!1189 = !DILocation(line: 378, column: 38, scope: !866)
!1190 = !DILocation(line: 378, column: 45, scope: !866)
!1191 = !DILocation(line: 378, column: 43, scope: !866)
!1192 = !DILocalVariable(name: "c", scope: !866, file: !3, line: 381, type: !115)
!1193 = !DILocation(line: 381, column: 12, scope: !866)
!1194 = !DILocalVariable(name: "j", scope: !1195, file: !3, line: 382, type: !6)
!1195 = distinct !DILexicalBlock(scope: !866, file: !3, line: 382, column: 5)
!1196 = !DILocation(line: 382, column: 14, scope: !1195)
!1197 = !DILocation(line: 382, column: 10, scope: !1195)
!1198 = !DILocation(line: 382, column: 21, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1195, file: !3, line: 382, column: 5)
!1200 = !DILocation(line: 382, column: 25, scope: !1199)
!1201 = !DILocation(line: 382, column: 28, scope: !1199)
!1202 = !DILocation(line: 382, column: 23, scope: !1199)
!1203 = !DILocation(line: 382, column: 5, scope: !1195)
!1204 = !DILocalVariable(name: "i", scope: !1205, file: !3, line: 383, type: !6)
!1205 = distinct !DILexicalBlock(scope: !1199, file: !3, line: 383, column: 9)
!1206 = !DILocation(line: 383, column: 18, scope: !1205)
!1207 = !DILocation(line: 383, column: 14, scope: !1205)
!1208 = !DILocation(line: 383, column: 25, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1205, file: !3, line: 383, column: 9)
!1210 = !DILocation(line: 383, column: 29, scope: !1209)
!1211 = !DILocation(line: 383, column: 32, scope: !1209)
!1212 = !DILocation(line: 383, column: 27, scope: !1209)
!1213 = !DILocation(line: 383, column: 9, scope: !1205)
!1214 = !DILocation(line: 384, column: 17, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1216, file: !3, line: 384, column: 17)
!1216 = distinct !DILexicalBlock(scope: !1209, file: !3, line: 383, column: 42)
!1217 = !DILocation(line: 384, column: 21, scope: !1215)
!1218 = !DILocation(line: 384, column: 27, scope: !1215)
!1219 = !DILocation(line: 384, column: 24, scope: !1215)
!1220 = !DILocation(line: 384, column: 32, scope: !1215)
!1221 = !DILocation(line: 384, column: 35, scope: !1215)
!1222 = !DILocation(line: 384, column: 39, scope: !1215)
!1223 = !DILocation(line: 384, column: 42, scope: !1215)
!1224 = !DILocation(line: 384, column: 17, scope: !1216)
!1225 = !DILocation(line: 385, column: 17, scope: !1226)
!1226 = distinct !DILexicalBlock(scope: !1215, file: !3, line: 384, column: 48)
!1227 = !DILocation(line: 385, column: 21, scope: !1226)
!1228 = !DILocation(line: 385, column: 24, scope: !1226)
!1229 = !DILocalVariable(name: "nedges", scope: !1226, file: !3, line: 386, type: !6)
!1230 = !DILocation(line: 386, column: 21, scope: !1226)
!1231 = !DILocation(line: 387, column: 28, scope: !1226)
!1232 = !DILocation(line: 387, column: 17, scope: !1226)
!1233 = !DILocation(line: 387, column: 26, scope: !1226)
!1234 = !DILocation(line: 389, column: 17, scope: !1226)
!1235 = !DILocation(line: 390, column: 27, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1226, file: !3, line: 389, column: 20)
!1237 = !DILocalVariable(name: "t", scope: !1236, file: !3, line: 391, type: !7)
!1238 = !DILocation(line: 391, column: 31, scope: !1236)
!1239 = !DILocation(line: 391, column: 35, scope: !1236)
!1240 = !DILocation(line: 391, column: 41, scope: !1236)
!1241 = !DILocalVariable(name: "nbs", scope: !1236, file: !3, line: 393, type: !1242)
!1242 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 256, elements: !1243)
!1243 = !{!1244}
!1244 = !DISubrange(count: 8)
!1245 = !DILocation(line: 393, column: 25, scope: !1236)
!1246 = !DILocation(line: 394, column: 30, scope: !1236)
!1247 = !DILocation(line: 394, column: 34, scope: !1236)
!1248 = !DILocation(line: 394, column: 32, scope: !1236)
!1249 = !DILocation(line: 394, column: 21, scope: !1236)
!1250 = !DILocation(line: 394, column: 28, scope: !1236)
!1251 = !DILocation(line: 395, column: 30, scope: !1236)
!1252 = !DILocation(line: 395, column: 34, scope: !1236)
!1253 = !DILocation(line: 395, column: 32, scope: !1236)
!1254 = !DILocation(line: 395, column: 21, scope: !1236)
!1255 = !DILocation(line: 395, column: 28, scope: !1236)
!1256 = !DILocation(line: 396, column: 30, scope: !1236)
!1257 = !DILocation(line: 396, column: 32, scope: !1236)
!1258 = !DILocation(line: 396, column: 21, scope: !1236)
!1259 = !DILocation(line: 396, column: 28, scope: !1236)
!1260 = !DILocation(line: 397, column: 30, scope: !1236)
!1261 = !DILocation(line: 397, column: 32, scope: !1236)
!1262 = !DILocation(line: 397, column: 21, scope: !1236)
!1263 = !DILocation(line: 397, column: 28, scope: !1236)
!1264 = !DILocation(line: 398, column: 30, scope: !1236)
!1265 = !DILocation(line: 398, column: 37, scope: !1236)
!1266 = !DILocation(line: 398, column: 21, scope: !1236)
!1267 = !DILocation(line: 398, column: 28, scope: !1236)
!1268 = !DILocation(line: 399, column: 30, scope: !1236)
!1269 = !DILocation(line: 399, column: 37, scope: !1236)
!1270 = !DILocation(line: 399, column: 21, scope: !1236)
!1271 = !DILocation(line: 399, column: 28, scope: !1236)
!1272 = !DILocation(line: 400, column: 30, scope: !1236)
!1273 = !DILocation(line: 400, column: 37, scope: !1236)
!1274 = !DILocation(line: 400, column: 21, scope: !1236)
!1275 = !DILocation(line: 400, column: 28, scope: !1236)
!1276 = !DILocation(line: 401, column: 30, scope: !1236)
!1277 = !DILocation(line: 401, column: 37, scope: !1236)
!1278 = !DILocation(line: 401, column: 21, scope: !1236)
!1279 = !DILocation(line: 401, column: 28, scope: !1236)
!1280 = !DILocalVariable(name: "k", scope: !1281, file: !3, line: 403, type: !6)
!1281 = distinct !DILexicalBlock(scope: !1236, file: !3, line: 403, column: 21)
!1282 = !DILocation(line: 403, column: 30, scope: !1281)
!1283 = !DILocation(line: 403, column: 26, scope: !1281)
!1284 = !DILocation(line: 403, column: 37, scope: !1285)
!1285 = distinct !DILexicalBlock(scope: !1281, file: !3, line: 403, column: 21)
!1286 = !DILocation(line: 403, column: 39, scope: !1285)
!1287 = !DILocation(line: 403, column: 21, scope: !1281)
!1288 = !DILocation(line: 404, column: 29, scope: !1289)
!1289 = distinct !DILexicalBlock(scope: !1285, file: !3, line: 404, column: 29)
!1290 = !DILocation(line: 404, column: 37, scope: !1289)
!1291 = !DILocation(line: 404, column: 33, scope: !1289)
!1292 = !DILocation(line: 404, column: 44, scope: !1289)
!1293 = !DILocation(line: 404, column: 41, scope: !1289)
!1294 = !DILocation(line: 404, column: 49, scope: !1289)
!1295 = !DILocation(line: 404, column: 52, scope: !1289)
!1296 = !DILocation(line: 404, column: 60, scope: !1289)
!1297 = !DILocation(line: 404, column: 56, scope: !1289)
!1298 = !DILocation(line: 404, column: 64, scope: !1289)
!1299 = !DILocation(line: 404, column: 29, scope: !1285)
!1300 = !DILocation(line: 405, column: 29, scope: !1301)
!1301 = distinct !DILexicalBlock(scope: !1289, file: !3, line: 404, column: 70)
!1302 = !DILocation(line: 405, column: 37, scope: !1301)
!1303 = !DILocation(line: 405, column: 33, scope: !1301)
!1304 = !DILocation(line: 405, column: 41, scope: !1301)
!1305 = !DILocation(line: 406, column: 49, scope: !1301)
!1306 = !DILocation(line: 406, column: 45, scope: !1301)
!1307 = !DILocation(line: 406, column: 29, scope: !1301)
!1308 = !DILocation(line: 406, column: 35, scope: !1301)
!1309 = !DILocation(line: 406, column: 43, scope: !1301)
!1310 = !DILocation(line: 407, column: 35, scope: !1301)
!1311 = !DILocation(line: 408, column: 25, scope: !1301)
!1312 = !DILocation(line: 404, column: 67, scope: !1289)
!1313 = !DILocation(line: 403, column: 45, scope: !1285)
!1314 = !DILocation(line: 403, column: 21, scope: !1285)
!1315 = distinct !{!1315, !1287, !1316}
!1316 = !DILocation(line: 408, column: 25, scope: !1281)
!1317 = !DILocation(line: 409, column: 17, scope: !1236)
!1318 = !DILocation(line: 409, column: 26, scope: !1226)
!1319 = !DILocation(line: 409, column: 33, scope: !1226)
!1320 = distinct !{!1320, !1234, !1321}
!1321 = !DILocation(line: 409, column: 36, scope: !1226)
!1322 = !DILocation(line: 410, column: 13, scope: !1226)
!1323 = !DILocation(line: 411, column: 14, scope: !1216)
!1324 = !DILocation(line: 412, column: 9, scope: !1216)
!1325 = !DILocation(line: 383, column: 38, scope: !1209)
!1326 = !DILocation(line: 383, column: 9, scope: !1209)
!1327 = distinct !{!1327, !1213, !1328}
!1328 = !DILocation(line: 412, column: 9, scope: !1205)
!1329 = !DILocation(line: 382, column: 34, scope: !1199)
!1330 = !DILocation(line: 382, column: 5, scope: !1199)
!1331 = distinct !{!1331, !1203, !1332}
!1332 = !DILocation(line: 412, column: 9, scope: !1195)
!1333 = !DILocation(line: 414, column: 10, scope: !866)
!1334 = !DILocation(line: 414, column: 5, scope: !866)
!1335 = !DILocation(line: 415, column: 10, scope: !866)
!1336 = !DILocation(line: 415, column: 5, scope: !866)
!1337 = !DILocation(line: 416, column: 10, scope: !866)
!1338 = !DILocation(line: 416, column: 5, scope: !866)
!1339 = !DILocation(line: 417, column: 10, scope: !866)
!1340 = !DILocation(line: 417, column: 5, scope: !866)
!1341 = !DILocation(line: 419, column: 12, scope: !866)
!1342 = !DILocation(line: 419, column: 5, scope: !866)
!1343 = !DILocalVariable(name: "argc", arg: 1, scope: !2, file: !3, line: 422, type: !7)
!1344 = !DILocation(line: 422, column: 20, scope: !2)
!1345 = !DILocalVariable(name: "argv", arg: 2, scope: !2, file: !3, line: 422, type: !8)
!1346 = !DILocation(line: 422, column: 46, scope: !2)
!1347 = !DILocation(line: 424, column: 9, scope: !1348)
!1348 = distinct !DILexicalBlock(scope: !2, file: !3, line: 424, column: 9)
!1349 = !DILocation(line: 424, column: 14, scope: !1348)
!1350 = !DILocation(line: 424, column: 9, scope: !2)
!1351 = !DILocation(line: 425, column: 41, scope: !1352)
!1352 = distinct !DILexicalBlock(scope: !1348, file: !3, line: 424, column: 19)
!1353 = !DILocation(line: 425, column: 9, scope: !1352)
!1354 = !DILocation(line: 426, column: 9, scope: !1352)
!1355 = !DILocalVariable(name: "in_bitmap_data", scope: !2, file: !3, line: 430, type: !307)
!1356 = !DILocation(line: 430, column: 20, scope: !2)
!1357 = !DILocation(line: 430, column: 46, scope: !2)
!1358 = !DILocation(line: 430, column: 37, scope: !2)
!1359 = !DILocation(line: 431, column: 9, scope: !1360)
!1360 = distinct !DILexicalBlock(scope: !2, file: !3, line: 431, column: 9)
!1361 = !DILocation(line: 431, column: 24, scope: !1360)
!1362 = !DILocation(line: 431, column: 9, scope: !2)
!1363 = !DILocation(line: 432, column: 17, scope: !1364)
!1364 = distinct !DILexicalBlock(scope: !1360, file: !3, line: 431, column: 33)
!1365 = !DILocation(line: 432, column: 9, scope: !1364)
!1366 = !DILocation(line: 433, column: 9, scope: !1364)
!1367 = !DILocation(line: 436, column: 39, scope: !2)
!1368 = !DILocation(line: 436, column: 49, scope: !2)
!1369 = !DILocation(line: 436, column: 60, scope: !2)
!1370 = !DILocation(line: 436, column: 57, scope: !2)
!1371 = !DILocation(line: 436, column: 5, scope: !2)
!1372 = !DILocalVariable(name: "out_bitmap_data", scope: !2, file: !3, line: 438, type: !307)
!1373 = !DILocation(line: 438, column: 20, scope: !2)
!1374 = !DILocation(line: 439, column: 30, scope: !2)
!1375 = !DILocation(line: 439, column: 9, scope: !2)
!1376 = !DILocation(line: 440, column: 9, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !2, file: !3, line: 440, column: 9)
!1378 = !DILocation(line: 440, column: 25, scope: !1377)
!1379 = !DILocation(line: 440, column: 9, scope: !2)
!1380 = !DILocation(line: 441, column: 17, scope: !1381)
!1381 = distinct !DILexicalBlock(scope: !1377, file: !3, line: 440, column: 34)
!1382 = !DILocation(line: 441, column: 9, scope: !1381)
!1383 = !DILocation(line: 442, column: 9, scope: !1381)
!1384 = !DILocation(line: 445, column: 34, scope: !1385)
!1385 = distinct !DILexicalBlock(scope: !2, file: !3, line: 445, column: 9)
!1386 = !DILocation(line: 445, column: 9, scope: !1385)
!1387 = !DILocation(line: 445, column: 9, scope: !2)
!1388 = !DILocation(line: 446, column: 17, scope: !1389)
!1389 = distinct !DILexicalBlock(scope: !1385, file: !3, line: 445, column: 52)
!1390 = !DILocation(line: 446, column: 9, scope: !1389)
!1391 = !DILocation(line: 447, column: 9, scope: !1389)
!1392 = !DILocation(line: 450, column: 20, scope: !2)
!1393 = !DILocation(line: 450, column: 10, scope: !2)
!1394 = !DILocation(line: 450, column: 5, scope: !2)
!1395 = !DILocation(line: 451, column: 20, scope: !2)
!1396 = !DILocation(line: 451, column: 10, scope: !2)
!1397 = !DILocation(line: 451, column: 5, scope: !2)
!1398 = !DILocation(line: 452, column: 5, scope: !2)
!1399 = !DILocation(line: 453, column: 1, scope: !2)
