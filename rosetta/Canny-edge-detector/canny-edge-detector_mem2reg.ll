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
  %mag = alloca %struct.bmpfile_magic_t, align 1
  %bitmapFileHeader = alloca %struct.bmpfile_header_t, align 4
  %c = alloca i8, align 1
  call void @llvm.dbg.value(metadata i8* %filename, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.value(metadata %struct.bitmap_info_header_t* %bitmapInfoHeader, metadata !62, metadata !DIExpression()), !dbg !61
  %call = call %struct._IO_FILE* @fopen(i8* %filename, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call, metadata !64, metadata !DIExpression()), !dbg !61
  %cmp = icmp eq %struct._IO_FILE* %call, null, !dbg !123
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  call void @perror(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)), !dbg !126
  br label %return, !dbg !128

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.bmpfile_magic_t* %mag, metadata !129, metadata !DIExpression()), !dbg !137
  %0 = bitcast %struct.bmpfile_magic_t* %mag to i8*, !dbg !138
  %call1 = call i64 @fread(i8* %0, i64 2, i64 1, %struct._IO_FILE* %call), !dbg !140
  %cmp2 = icmp ne i64 %call1, 1, !dbg !141
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !142

if.then3:                                         ; preds = %if.end
  %call4 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !143
  br label %return, !dbg !145

if.end5:                                          ; preds = %if.end
  %magic = getelementptr inbounds %struct.bmpfile_magic_t, %struct.bmpfile_magic_t* %mag, i32 0, i32 0, !dbg !146
  %arraydecay = getelementptr inbounds [2 x i8], [2 x i8]* %magic, i64 0, i64 0, !dbg !148
  %1 = bitcast i8* %arraydecay to i16*, !dbg !148
  %2 = load i16, i16* %1, align 1, !dbg !148
  %conv = zext i16 %2 to i32, !dbg !148
  %cmp6 = icmp ne i32 %conv, 19778, !dbg !149
  br i1 %cmp6, label %if.then8, label %if.end16, !dbg !150

if.then8:                                         ; preds = %if.end5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !151
  %magic9 = getelementptr inbounds %struct.bmpfile_magic_t, %struct.bmpfile_magic_t* %mag, i32 0, i32 0, !dbg !153
  %arrayidx = getelementptr inbounds [2 x i8], [2 x i8]* %magic9, i64 0, i64 0, !dbg !154
  %4 = load i8, i8* %arrayidx, align 1, !dbg !154
  %conv10 = zext i8 %4 to i32, !dbg !154
  %magic11 = getelementptr inbounds %struct.bmpfile_magic_t, %struct.bmpfile_magic_t* %mag, i32 0, i32 0, !dbg !155
  %arrayidx12 = getelementptr inbounds [2 x i8], [2 x i8]* %magic11, i64 0, i64 1, !dbg !156
  %5 = load i8, i8* %arrayidx12, align 1, !dbg !156
  %conv13 = zext i8 %5 to i32, !dbg !156
  %call14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i32 %conv10, i32 %conv13), !dbg !157
  %call15 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !158
  br label %return, !dbg !159

if.end16:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata %struct.bmpfile_header_t* %bitmapFileHeader, metadata !160, metadata !DIExpression()), !dbg !168
  %6 = bitcast %struct.bmpfile_header_t* %bitmapFileHeader to i8*, !dbg !169
  %call17 = call i64 @fread(i8* %6, i64 12, i64 1, %struct._IO_FILE* %call), !dbg !171
  %cmp18 = icmp ne i64 %call17, 1, !dbg !172
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !173

if.then20:                                        ; preds = %if.end16
  %call21 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !174
  br label %return, !dbg !176

if.end22:                                         ; preds = %if.end16
  %7 = bitcast %struct.bitmap_info_header_t* %bitmapInfoHeader to i8*, !dbg !177
  %call23 = call i64 @fread(i8* %7, i64 40, i64 1, %struct._IO_FILE* %call), !dbg !179
  %cmp24 = icmp ne i64 %call23, 1, !dbg !180
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !181

if.then26:                                        ; preds = %if.end22
  %call27 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !182
  br label %return, !dbg !184

if.end28:                                         ; preds = %if.end22
  %compress_type = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %bitmapInfoHeader, i32 0, i32 5, !dbg !185
  %8 = load i32, i32* %compress_type, align 4, !dbg !185
  %cmp29 = icmp ne i32 %8, 0, !dbg !187
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !188

if.then31:                                        ; preds = %if.end28
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !189
  %call32 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.3, i64 0, i64 0)), !dbg !190
  br label %if.end33, !dbg !190

if.end33:                                         ; preds = %if.then31, %if.end28
  %bmp_offset = getelementptr inbounds %struct.bmpfile_header_t, %struct.bmpfile_header_t* %bitmapFileHeader, i32 0, i32 3, !dbg !191
  %10 = load i32, i32* %bmp_offset, align 4, !dbg !191
  %conv34 = zext i32 %10 to i64, !dbg !193
  %call35 = call i32 @fseek(%struct._IO_FILE* %call, i64 %conv34, i32 0), !dbg !194
  %tobool = icmp ne i32 %call35, 0, !dbg !194
  br i1 %tobool, label %if.then36, label %if.end38, !dbg !195

if.then36:                                        ; preds = %if.end33
  %call37 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !196
  br label %return, !dbg !198

if.end38:                                         ; preds = %if.end33
  %bmp_bytesz = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %bitmapInfoHeader, i32 0, i32 6, !dbg !199
  %11 = load i32, i32* %bmp_bytesz, align 4, !dbg !199
  %conv39 = zext i32 %11 to i64, !dbg !200
  %mul = mul i64 %conv39, 2, !dbg !201
  %call40 = call noalias i8* @malloc(i64 %mul) #6, !dbg !202
  %12 = bitcast i8* %call40 to i16*, !dbg !202
  call void @llvm.dbg.value(metadata i16* %12, metadata !203, metadata !DIExpression()), !dbg !61
  %cmp41 = icmp eq i16* %12, null, !dbg !204
  br i1 %cmp41, label %if.then43, label %if.end45, !dbg !206

if.then43:                                        ; preds = %if.end38
  %call44 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !207
  br label %return, !dbg !209

if.end45:                                         ; preds = %if.end38
  call void @llvm.dbg.value(metadata i64 0, metadata !210, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i8* %c, metadata !211, metadata !DIExpression()), !dbg !212
  %bitspp = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %bitmapInfoHeader, i32 0, i32 4, !dbg !213
  %13 = load i16, i16* %bitspp, align 2, !dbg !213
  %conv46 = zext i16 %13 to i32, !dbg !214
  %width = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %bitmapInfoHeader, i32 0, i32 1, !dbg !215
  %14 = load i32, i32* %width, align 4, !dbg !215
  %mul47 = mul nsw i32 %conv46, %14, !dbg !216
  %conv48 = sitofp i32 %mul47 to double, !dbg !214
  %div = fdiv double %conv48, 3.200000e+01, !dbg !217
  %15 = call double @llvm.ceil.f64(double %div), !dbg !218
  %mul49 = fmul double 4.000000e+00, %15, !dbg !219
  %width50 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %bitmapInfoHeader, i32 0, i32 1, !dbg !220
  %16 = load i32, i32* %width50, align 4, !dbg !220
  %conv51 = sitofp i32 %16 to double, !dbg !221
  %sub = fsub double %mul49, %conv51, !dbg !222
  %conv52 = fptoui double %sub to i64, !dbg !223
  call void @llvm.dbg.value(metadata i64 %conv52, metadata !224, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.value(metadata i64 0, metadata !225, metadata !DIExpression()), !dbg !227
  br label %for.cond, !dbg !228

for.cond:                                         ; preds = %for.inc72, %if.end45
  %count.0 = phi i64 [ 0, %if.end45 ], [ %count.1, %for.inc72 ], !dbg !229
  %i.0 = phi i64 [ 0, %if.end45 ], [ %inc73, %for.inc72 ], !dbg !227
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !225, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.value(metadata i64 %count.0, metadata !210, metadata !DIExpression()), !dbg !61
  %height = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %bitmapInfoHeader, i32 0, i32 2, !dbg !230
  %17 = load i32, i32* %height, align 4, !dbg !230
  %conv53 = sext i32 %17 to i64, !dbg !232
  %cmp54 = icmp ult i64 %i.0, %conv53, !dbg !233
  br i1 %cmp54, label %for.body, label %for.end74, !dbg !234

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i64 0, metadata !235, metadata !DIExpression()), !dbg !238
  br label %for.cond56, !dbg !239

for.cond56:                                       ; preds = %for.inc, %for.body
  %count.1 = phi i64 [ %count.0, %for.body ], [ %inc, %for.inc ], !dbg !61
  %j.0 = phi i64 [ 0, %for.body ], [ %inc70, %for.inc ], !dbg !238
  call void @llvm.dbg.value(metadata i64 %j.0, metadata !235, metadata !DIExpression()), !dbg !238
  call void @llvm.dbg.value(metadata i64 %count.1, metadata !210, metadata !DIExpression()), !dbg !61
  %width57 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %bitmapInfoHeader, i32 0, i32 1, !dbg !240
  %18 = load i32, i32* %width57, align 4, !dbg !240
  %conv58 = sext i32 %18 to i64, !dbg !242
  %cmp59 = icmp ult i64 %j.0, %conv58, !dbg !243
  br i1 %cmp59, label %for.body61, label %for.end, !dbg !244

for.body61:                                       ; preds = %for.cond56
  %call62 = call i64 @fread(i8* %c, i64 1, i64 1, %struct._IO_FILE* %call), !dbg !245
  %cmp63 = icmp ne i64 %call62, 1, !dbg !248
  br i1 %cmp63, label %if.then65, label %if.end67, !dbg !249

if.then65:                                        ; preds = %for.body61
  %call66 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !250
  br label %return, !dbg !252

if.end67:                                         ; preds = %for.body61
  %19 = load i8, i8* %c, align 1, !dbg !253
  %conv68 = zext i8 %19 to i16, !dbg !254
  %inc = add i64 %count.1, 1, !dbg !255
  call void @llvm.dbg.value(metadata i64 %inc, metadata !210, metadata !DIExpression()), !dbg !61
  %arrayidx69 = getelementptr inbounds i16, i16* %12, i64 %count.1, !dbg !256
  store i16 %conv68, i16* %arrayidx69, align 2, !dbg !257
  br label %for.inc, !dbg !258

for.inc:                                          ; preds = %if.end67
  %inc70 = add i64 %j.0, 1, !dbg !259
  call void @llvm.dbg.value(metadata i64 %inc70, metadata !235, metadata !DIExpression()), !dbg !238
  br label %for.cond56, !dbg !260, !llvm.loop !261

for.end:                                          ; preds = %for.cond56
  %call71 = call i32 @fseek(%struct._IO_FILE* %call, i64 %conv52, i32 1), !dbg !263
  br label %for.inc72, !dbg !264

for.inc72:                                        ; preds = %for.end
  %inc73 = add i64 %i.0, 1, !dbg !265
  call void @llvm.dbg.value(metadata i64 %inc73, metadata !225, metadata !DIExpression()), !dbg !227
  br label %for.cond, !dbg !266, !llvm.loop !267

for.end74:                                        ; preds = %for.cond
  %call75 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !269
  br label %return, !dbg !270

return:                                           ; preds = %for.end74, %if.then65, %if.then43, %if.then36, %if.then26, %if.then20, %if.then8, %if.then3, %if.then
  %retval.0 = phi i16* [ null, %if.then ], [ null, %if.then3 ], [ null, %if.then8 ], [ null, %if.then20 ], [ null, %if.then26 ], [ null, %if.then36 ], [ null, %if.then43 ], [ null, %if.then65 ], [ %12, %for.end74 ], !dbg !61
  ret i16* %retval.0, !dbg !271
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
define dso_local zeroext i1 @save_bmp(i8* %filename, %struct.bitmap_info_header_t* %bmp_ih, i16* %data) #0 !dbg !272 {
entry:
  %mag = alloca %struct.bmpfile_magic_t, align 1
  %bmp_fh = alloca %struct.bmpfile_header_t, align 4
  %color = alloca %struct.rgb_t, align 1
  %c = alloca i8, align 1
  call void @llvm.dbg.value(metadata i8* %filename, metadata !280, metadata !DIExpression()), !dbg !281
  call void @llvm.dbg.value(metadata %struct.bitmap_info_header_t* %bmp_ih, metadata !282, metadata !DIExpression()), !dbg !281
  call void @llvm.dbg.value(metadata i16* %data, metadata !283, metadata !DIExpression()), !dbg !281
  %call = call %struct._IO_FILE* @fopen(i8* %filename, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0)), !dbg !284
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call, metadata !285, metadata !DIExpression()), !dbg !281
  %cmp = icmp eq %struct._IO_FILE* %call, null, !dbg !286
  br i1 %cmp, label %if.then, label %if.end, !dbg !288

if.then:                                          ; preds = %entry
  br label %return, !dbg !289

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.bmpfile_magic_t* %mag, metadata !290, metadata !DIExpression()), !dbg !291
  %0 = bitcast %struct.bmpfile_magic_t* %mag to i8*, !dbg !291
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds (%struct.bmpfile_magic_t, %struct.bmpfile_magic_t* @__const.save_bmp.mag, i32 0, i32 0, i32 0), i64 2, i1 false), !dbg !291
  %1 = bitcast %struct.bmpfile_magic_t* %mag to i8*, !dbg !292
  %call1 = call i64 @fwrite(i8* %1, i64 2, i64 1, %struct._IO_FILE* %call), !dbg !294
  %cmp2 = icmp ne i64 %call1, 1, !dbg !295
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !296

if.then3:                                         ; preds = %if.end
  %call4 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !297
  br label %return, !dbg !299

if.end5:                                          ; preds = %if.end
  %bitspp = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %bmp_ih, i32 0, i32 4, !dbg !300
  %2 = load i16, i16* %bitspp, align 2, !dbg !300
  %conv = zext i16 %2 to i32, !dbg !301
  %shl = shl i32 1, %conv, !dbg !302
  %mul = mul i32 %shl, 4, !dbg !303
  %conv6 = zext i32 %mul to i64, !dbg !304
  %add = add i64 54, %conv6, !dbg !305
  %conv7 = trunc i64 %add to i32, !dbg !306
  call void @llvm.dbg.value(metadata i32 %conv7, metadata !307, metadata !DIExpression()), !dbg !281
  call void @llvm.dbg.declare(metadata %struct.bmpfile_header_t* %bmp_fh, metadata !309, metadata !DIExpression()), !dbg !311
  %filesz = getelementptr inbounds %struct.bmpfile_header_t, %struct.bmpfile_header_t* %bmp_fh, i32 0, i32 0, !dbg !312
  %bmp_bytesz = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %bmp_ih, i32 0, i32 6, !dbg !313
  %3 = load i32, i32* %bmp_bytesz, align 4, !dbg !313
  %add8 = add i32 %conv7, %3, !dbg !314
  store i32 %add8, i32* %filesz, align 4, !dbg !312
  %creator1 = getelementptr inbounds %struct.bmpfile_header_t, %struct.bmpfile_header_t* %bmp_fh, i32 0, i32 1, !dbg !312
  store i16 0, i16* %creator1, align 4, !dbg !312
  %creator2 = getelementptr inbounds %struct.bmpfile_header_t, %struct.bmpfile_header_t* %bmp_fh, i32 0, i32 2, !dbg !312
  store i16 0, i16* %creator2, align 2, !dbg !312
  %bmp_offset = getelementptr inbounds %struct.bmpfile_header_t, %struct.bmpfile_header_t* %bmp_fh, i32 0, i32 3, !dbg !312
  store i32 %conv7, i32* %bmp_offset, align 4, !dbg !312
  %4 = bitcast %struct.bmpfile_header_t* %bmp_fh to i8*, !dbg !315
  %call9 = call i64 @fwrite(i8* %4, i64 12, i64 1, %struct._IO_FILE* %call), !dbg !317
  %cmp10 = icmp ne i64 %call9, 1, !dbg !318
  br i1 %cmp10, label %if.then12, label %if.end14, !dbg !319

if.then12:                                        ; preds = %if.end5
  %call13 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !320
  br label %return, !dbg !322

if.end14:                                         ; preds = %if.end5
  %5 = bitcast %struct.bitmap_info_header_t* %bmp_ih to i8*, !dbg !323
  %call15 = call i64 @fwrite(i8* %5, i64 40, i64 1, %struct._IO_FILE* %call), !dbg !325
  %cmp16 = icmp ne i64 %call15, 1, !dbg !326
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !327

if.then18:                                        ; preds = %if.end14
  %call19 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !328
  br label %return, !dbg !330

if.end20:                                         ; preds = %if.end14
  call void @llvm.dbg.value(metadata i64 0, metadata !331, metadata !DIExpression()), !dbg !333
  br label %for.cond, !dbg !334

for.cond:                                         ; preds = %for.inc, %if.end20
  %i.0 = phi i64 [ 0, %if.end20 ], [ %inc, %for.inc ], !dbg !333
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !331, metadata !DIExpression()), !dbg !333
  %bitspp21 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %bmp_ih, i32 0, i32 4, !dbg !335
  %6 = load i16, i16* %bitspp21, align 2, !dbg !335
  %conv22 = zext i16 %6 to i32, !dbg !337
  %shl23 = shl i32 1, %conv22, !dbg !338
  %conv24 = zext i32 %shl23 to i64, !dbg !339
  %cmp25 = icmp ult i64 %i.0, %conv24, !dbg !340
  br i1 %cmp25, label %for.body, label %for.end, !dbg !341

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct.rgb_t* %color, metadata !342, metadata !DIExpression()), !dbg !352
  %r = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %color, i32 0, i32 0, !dbg !353
  %conv27 = trunc i64 %i.0 to i8, !dbg !354
  store i8 %conv27, i8* %r, align 1, !dbg !353
  %g = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %color, i32 0, i32 1, !dbg !353
  %conv28 = trunc i64 %i.0 to i8, !dbg !355
  store i8 %conv28, i8* %g, align 1, !dbg !353
  %b = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %color, i32 0, i32 2, !dbg !353
  %conv29 = trunc i64 %i.0 to i8, !dbg !356
  store i8 %conv29, i8* %b, align 1, !dbg !353
  %nothing = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %color, i32 0, i32 3, !dbg !353
  store i8 0, i8* %nothing, align 1, !dbg !353
  %7 = bitcast %struct.rgb_t* %color to i8*, !dbg !357
  %call30 = call i64 @fwrite(i8* %7, i64 4, i64 1, %struct._IO_FILE* %call), !dbg !359
  %cmp31 = icmp ne i64 %call30, 1, !dbg !360
  br i1 %cmp31, label %if.then33, label %if.end35, !dbg !361

if.then33:                                        ; preds = %for.body
  %call34 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !362
  br label %return, !dbg !364

if.end35:                                         ; preds = %for.body
  br label %for.inc, !dbg !365

for.inc:                                          ; preds = %if.end35
  %inc = add i64 %i.0, 1, !dbg !366
  call void @llvm.dbg.value(metadata i64 %inc, metadata !331, metadata !DIExpression()), !dbg !333
  br label %for.cond, !dbg !367, !llvm.loop !368

for.end:                                          ; preds = %for.cond
  %bitspp36 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %bmp_ih, i32 0, i32 4, !dbg !370
  %8 = load i16, i16* %bitspp36, align 2, !dbg !370
  %conv37 = zext i16 %8 to i32, !dbg !371
  %width = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %bmp_ih, i32 0, i32 1, !dbg !372
  %9 = load i32, i32* %width, align 4, !dbg !372
  %mul38 = mul nsw i32 %conv37, %9, !dbg !373
  %conv39 = sitofp i32 %mul38 to double, !dbg !371
  %div = fdiv double %conv39, 3.200000e+01, !dbg !374
  %10 = call double @llvm.ceil.f64(double %div), !dbg !375
  %mul40 = fmul double 4.000000e+00, %10, !dbg !376
  %width41 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %bmp_ih, i32 0, i32 1, !dbg !377
  %11 = load i32, i32* %width41, align 4, !dbg !377
  %conv42 = sitofp i32 %11 to double, !dbg !378
  %sub = fsub double %mul40, %conv42, !dbg !379
  %conv43 = fptoui double %sub to i64, !dbg !380
  call void @llvm.dbg.value(metadata i64 %conv43, metadata !381, metadata !DIExpression()), !dbg !281
  call void @llvm.dbg.declare(metadata i8* %c, metadata !382, metadata !DIExpression()), !dbg !383
  call void @llvm.dbg.value(metadata i64 0, metadata !384, metadata !DIExpression()), !dbg !386
  br label %for.cond45, !dbg !387

for.cond45:                                       ; preds = %for.inc84, %for.end
  %i44.0 = phi i64 [ 0, %for.end ], [ %inc85, %for.inc84 ], !dbg !386
  call void @llvm.dbg.value(metadata i64 %i44.0, metadata !384, metadata !DIExpression()), !dbg !386
  %height = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %bmp_ih, i32 0, i32 2, !dbg !388
  %12 = load i32, i32* %height, align 4, !dbg !388
  %conv46 = sext i32 %12 to i64, !dbg !390
  %cmp47 = icmp ult i64 %i44.0, %conv46, !dbg !391
  br i1 %cmp47, label %for.body49, label %for.end86, !dbg !392

for.body49:                                       ; preds = %for.cond45
  call void @llvm.dbg.value(metadata i64 0, metadata !393, metadata !DIExpression()), !dbg !396
  br label %for.cond50, !dbg !397

for.cond50:                                       ; preds = %for.inc67, %for.body49
  %j.0 = phi i64 [ 0, %for.body49 ], [ %inc68, %for.inc67 ], !dbg !396
  call void @llvm.dbg.value(metadata i64 %j.0, metadata !393, metadata !DIExpression()), !dbg !396
  %width51 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %bmp_ih, i32 0, i32 1, !dbg !398
  %13 = load i32, i32* %width51, align 4, !dbg !398
  %conv52 = sext i32 %13 to i64, !dbg !400
  %cmp53 = icmp ult i64 %j.0, %conv52, !dbg !401
  br i1 %cmp53, label %for.body55, label %for.end69, !dbg !402

for.body55:                                       ; preds = %for.cond50
  %width56 = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %bmp_ih, i32 0, i32 1, !dbg !403
  %14 = load i32, i32* %width56, align 4, !dbg !403
  %conv57 = sext i32 %14 to i64, !dbg !405
  %mul58 = mul i64 %conv57, %i44.0, !dbg !406
  %add59 = add i64 %j.0, %mul58, !dbg !407
  %arrayidx = getelementptr inbounds i16, i16* %data, i64 %add59, !dbg !408
  %15 = load i16, i16* %arrayidx, align 2, !dbg !408
  %conv60 = trunc i16 %15 to i8, !dbg !409
  store i8 %conv60, i8* %c, align 1, !dbg !410
  %call61 = call i64 @fwrite(i8* %c, i64 1, i64 1, %struct._IO_FILE* %call), !dbg !411
  %cmp62 = icmp ne i64 %call61, 1, !dbg !413
  br i1 %cmp62, label %if.then64, label %if.end66, !dbg !414

if.then64:                                        ; preds = %for.body55
  %call65 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !415
  br label %return, !dbg !417

if.end66:                                         ; preds = %for.body55
  br label %for.inc67, !dbg !418

for.inc67:                                        ; preds = %if.end66
  %inc68 = add i64 %j.0, 1, !dbg !419
  call void @llvm.dbg.value(metadata i64 %inc68, metadata !393, metadata !DIExpression()), !dbg !396
  br label %for.cond50, !dbg !420, !llvm.loop !421

for.end69:                                        ; preds = %for.cond50
  store i8 0, i8* %c, align 1, !dbg !423
  call void @llvm.dbg.value(metadata i64 0, metadata !424, metadata !DIExpression()), !dbg !426
  br label %for.cond71, !dbg !427

for.cond71:                                       ; preds = %for.inc81, %for.end69
  %j70.0 = phi i64 [ 0, %for.end69 ], [ %inc82, %for.inc81 ], !dbg !426
  call void @llvm.dbg.value(metadata i64 %j70.0, metadata !424, metadata !DIExpression()), !dbg !426
  %cmp72 = icmp ult i64 %j70.0, %conv43, !dbg !428
  br i1 %cmp72, label %for.body74, label %for.end83, !dbg !430

for.body74:                                       ; preds = %for.cond71
  %call75 = call i64 @fwrite(i8* %c, i64 1, i64 1, %struct._IO_FILE* %call), !dbg !431
  %cmp76 = icmp ne i64 %call75, 1, !dbg !433
  br i1 %cmp76, label %if.then78, label %if.end80, !dbg !434

if.then78:                                        ; preds = %for.body74
  %call79 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !435
  br label %return, !dbg !437

if.end80:                                         ; preds = %for.body74
  br label %for.inc81, !dbg !438

for.inc81:                                        ; preds = %if.end80
  %inc82 = add i64 %j70.0, 1, !dbg !439
  call void @llvm.dbg.value(metadata i64 %inc82, metadata !424, metadata !DIExpression()), !dbg !426
  br label %for.cond71, !dbg !440, !llvm.loop !441

for.end83:                                        ; preds = %for.cond71
  br label %for.inc84, !dbg !443

for.inc84:                                        ; preds = %for.end83
  %inc85 = add i64 %i44.0, 1, !dbg !444
  call void @llvm.dbg.value(metadata i64 %inc85, metadata !384, metadata !DIExpression()), !dbg !386
  br label %for.cond45, !dbg !445, !llvm.loop !446

for.end86:                                        ; preds = %for.cond45
  %call87 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !448
  br label %return, !dbg !449

return:                                           ; preds = %for.end86, %if.then78, %if.then64, %if.then33, %if.then18, %if.then12, %if.then3, %if.then
  %retval.0 = phi i1 [ true, %if.then ], [ true, %if.then3 ], [ true, %if.then12 ], [ true, %if.then18 ], [ true, %if.then33 ], [ true, %if.then64 ], [ true, %if.then78 ], [ false, %for.end86 ], !dbg !281
  ret i1 %retval.0, !dbg !450
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @convolution(i16* %in, i16* %out, float* %kernel, i32 %nx, i32 %ny, i32 %kn, i1 zeroext %normalize) #0 !dbg !451 {
entry:
  call void @llvm.dbg.value(metadata i16* %in, metadata !457, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.value(metadata i16* %out, metadata !459, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.value(metadata float* %kernel, metadata !460, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.value(metadata i32 %nx, metadata !461, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.value(metadata i32 %ny, metadata !462, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.value(metadata i32 %kn, metadata !463, metadata !DIExpression()), !dbg !458
  %frombool = zext i1 %normalize to i8
  call void @llvm.dbg.value(metadata i8 %frombool, metadata !464, metadata !DIExpression()), !dbg !458
  %rem = srem i32 %kn, 2, !dbg !465
  %cmp = icmp eq i32 %rem, 1, !dbg !465
  br i1 %cmp, label %if.then, label %if.else, !dbg !468

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !468

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.6, i64 0, i64 0), i32 223, i8* getelementptr inbounds ([106 x i8], [106 x i8]* @__PRETTY_FUNCTION__.convolution, i64 0, i64 0)) #7, !dbg !465
  unreachable, !dbg !465

if.end:                                           ; preds = %if.then
  %cmp1 = icmp sgt i32 %nx, %kn, !dbg !469
  br i1 %cmp1, label %land.lhs.true, label %if.else4, !dbg !469

land.lhs.true:                                    ; preds = %if.end
  %cmp2 = icmp sgt i32 %ny, %kn, !dbg !469
  br i1 %cmp2, label %if.then3, label %if.else4, !dbg !472

if.then3:                                         ; preds = %land.lhs.true
  br label %if.end5, !dbg !472

if.else4:                                         ; preds = %land.lhs.true, %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.6, i64 0, i64 0), i32 224, i8* getelementptr inbounds ([106 x i8], [106 x i8]* @__PRETTY_FUNCTION__.convolution, i64 0, i64 0)) #7, !dbg !469
  unreachable, !dbg !469

if.end5:                                          ; preds = %if.then3
  %div = sdiv i32 %kn, 2, !dbg !473
  call void @llvm.dbg.value(metadata i32 %div, metadata !474, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.value(metadata float 0x47EFFFFFE0000000, metadata !475, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.value(metadata float 0xC7EFFFFFE0000000, metadata !476, metadata !DIExpression()), !dbg !458
  %tobool = trunc i8 %frombool to i1, !dbg !477
  br i1 %tobool, label %if.then6, label %if.end44, !dbg !479

if.then6:                                         ; preds = %if.end5
  call void @llvm.dbg.value(metadata i32 %div, metadata !480, metadata !DIExpression()), !dbg !482
  br label %for.cond, !dbg !483

for.cond:                                         ; preds = %for.inc41, %if.then6
  %m.0 = phi i32 [ %div, %if.then6 ], [ %inc42, %for.inc41 ], !dbg !482
  %max.0 = phi float [ 0xC7EFFFFFE0000000, %if.then6 ], [ %max.1, %for.inc41 ], !dbg !484
  %min.0 = phi float [ 0x47EFFFFFE0000000, %if.then6 ], [ %min.1, %for.inc41 ], !dbg !485
  call void @llvm.dbg.value(metadata float %min.0, metadata !475, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.value(metadata float %max.0, metadata !476, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.value(metadata i32 %m.0, metadata !480, metadata !DIExpression()), !dbg !482
  %sub = sub nsw i32 %nx, %div, !dbg !486
  %cmp7 = icmp slt i32 %m.0, %sub, !dbg !488
  br i1 %cmp7, label %for.body, label %for.end43, !dbg !489

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 %div, metadata !490, metadata !DIExpression()), !dbg !492
  br label %for.cond8, !dbg !493

for.cond8:                                        ; preds = %for.inc38, %for.body
  %n.0 = phi i32 [ %div, %for.body ], [ %inc39, %for.inc38 ], !dbg !492
  %max.1 = phi float [ %max.0, %for.body ], [ %max.2, %for.inc38 ], !dbg !458
  %min.1 = phi float [ %min.0, %for.body ], [ %min.2, %for.inc38 ], !dbg !458
  call void @llvm.dbg.value(metadata float %min.1, metadata !475, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.value(metadata float %max.1, metadata !476, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.value(metadata i32 %n.0, metadata !490, metadata !DIExpression()), !dbg !492
  %sub9 = sub nsw i32 %ny, %div, !dbg !494
  %cmp10 = icmp slt i32 %n.0, %sub9, !dbg !496
  br i1 %cmp10, label %for.body11, label %for.end40, !dbg !497

for.body11:                                       ; preds = %for.cond8
  call void @llvm.dbg.value(metadata float 0.000000e+00, metadata !498, metadata !DIExpression()), !dbg !500
  call void @llvm.dbg.value(metadata i64 0, metadata !501, metadata !DIExpression()), !dbg !500
  %sub12 = sub nsw i32 0, %div, !dbg !502
  call void @llvm.dbg.value(metadata i32 %sub12, metadata !504, metadata !DIExpression()), !dbg !505
  br label %for.cond13, !dbg !506

for.cond13:                                       ; preds = %for.inc27, %for.body11
  %c.0 = phi i64 [ 0, %for.body11 ], [ %c.1, %for.inc27 ], !dbg !507
  %pixel.0 = phi float [ 0.000000e+00, %for.body11 ], [ %pixel.1, %for.inc27 ], !dbg !508
  %j.0 = phi i32 [ %sub12, %for.body11 ], [ %inc28, %for.inc27 ], !dbg !505
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !504, metadata !DIExpression()), !dbg !505
  call void @llvm.dbg.value(metadata float %pixel.0, metadata !498, metadata !DIExpression()), !dbg !500
  call void @llvm.dbg.value(metadata i64 %c.0, metadata !501, metadata !DIExpression()), !dbg !500
  %cmp14 = icmp sle i32 %j.0, %div, !dbg !509
  br i1 %cmp14, label %for.body15, label %for.end29, !dbg !511

for.body15:                                       ; preds = %for.cond13
  %sub16 = sub nsw i32 0, %div, !dbg !512
  call void @llvm.dbg.value(metadata i32 %sub16, metadata !514, metadata !DIExpression()), !dbg !515
  br label %for.cond17, !dbg !516

for.cond17:                                       ; preds = %for.inc, %for.body15
  %c.1 = phi i64 [ %c.0, %for.body15 ], [ %inc, %for.inc ], !dbg !500
  %pixel.1 = phi float [ %pixel.0, %for.body15 ], [ %add25, %for.inc ], !dbg !500
  %i.0 = phi i32 [ %sub16, %for.body15 ], [ %inc26, %for.inc ], !dbg !515
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !514, metadata !DIExpression()), !dbg !515
  call void @llvm.dbg.value(metadata float %pixel.1, metadata !498, metadata !DIExpression()), !dbg !500
  call void @llvm.dbg.value(metadata i64 %c.1, metadata !501, metadata !DIExpression()), !dbg !500
  %cmp18 = icmp sle i32 %i.0, %div, !dbg !517
  br i1 %cmp18, label %for.body19, label %for.end, !dbg !519

for.body19:                                       ; preds = %for.cond17
  %sub20 = sub nsw i32 %n.0, %j.0, !dbg !520
  %mul = mul nsw i32 %sub20, %nx, !dbg !522
  %add = add nsw i32 %mul, %m.0, !dbg !523
  %sub21 = sub nsw i32 %add, %i.0, !dbg !524
  %idxprom = sext i32 %sub21 to i64, !dbg !525
  %arrayidx = getelementptr inbounds i16, i16* %in, i64 %idxprom, !dbg !525
  %0 = load i16, i16* %arrayidx, align 2, !dbg !525
  %conv = sext i16 %0 to i32, !dbg !525
  %conv22 = sitofp i32 %conv to float, !dbg !525
  %arrayidx23 = getelementptr inbounds float, float* %kernel, i64 %c.1, !dbg !526
  %1 = load float, float* %arrayidx23, align 4, !dbg !526
  %mul24 = fmul float %conv22, %1, !dbg !527
  %add25 = fadd float %pixel.1, %mul24, !dbg !528
  call void @llvm.dbg.value(metadata float %add25, metadata !498, metadata !DIExpression()), !dbg !500
  %inc = add i64 %c.1, 1, !dbg !529
  call void @llvm.dbg.value(metadata i64 %inc, metadata !501, metadata !DIExpression()), !dbg !500
  br label %for.inc, !dbg !530

for.inc:                                          ; preds = %for.body19
  %inc26 = add nsw i32 %i.0, 1, !dbg !531
  call void @llvm.dbg.value(metadata i32 %inc26, metadata !514, metadata !DIExpression()), !dbg !515
  br label %for.cond17, !dbg !532, !llvm.loop !533

for.end:                                          ; preds = %for.cond17
  br label %for.inc27, !dbg !534

for.inc27:                                        ; preds = %for.end
  %inc28 = add nsw i32 %j.0, 1, !dbg !535
  call void @llvm.dbg.value(metadata i32 %inc28, metadata !504, metadata !DIExpression()), !dbg !505
  br label %for.cond13, !dbg !536, !llvm.loop !537

for.end29:                                        ; preds = %for.cond13
  %cmp30 = fcmp olt float %pixel.0, %min.1, !dbg !539
  br i1 %cmp30, label %if.then32, label %if.end33, !dbg !541

if.then32:                                        ; preds = %for.end29
  call void @llvm.dbg.value(metadata float %pixel.0, metadata !475, metadata !DIExpression()), !dbg !458
  br label %if.end33, !dbg !542

if.end33:                                         ; preds = %if.then32, %for.end29
  %min.2 = phi float [ %pixel.0, %if.then32 ], [ %min.1, %for.end29 ], !dbg !458
  call void @llvm.dbg.value(metadata float %min.2, metadata !475, metadata !DIExpression()), !dbg !458
  %cmp34 = fcmp ogt float %pixel.0, %max.1, !dbg !543
  br i1 %cmp34, label %if.then36, label %if.end37, !dbg !545

if.then36:                                        ; preds = %if.end33
  call void @llvm.dbg.value(metadata float %pixel.0, metadata !476, metadata !DIExpression()), !dbg !458
  br label %if.end37, !dbg !546

if.end37:                                         ; preds = %if.then36, %if.end33
  %max.2 = phi float [ %pixel.0, %if.then36 ], [ %max.1, %if.end33 ], !dbg !458
  call void @llvm.dbg.value(metadata float %max.2, metadata !476, metadata !DIExpression()), !dbg !458
  br label %for.inc38, !dbg !547

for.inc38:                                        ; preds = %if.end37
  %inc39 = add nsw i32 %n.0, 1, !dbg !548
  call void @llvm.dbg.value(metadata i32 %inc39, metadata !490, metadata !DIExpression()), !dbg !492
  br label %for.cond8, !dbg !549, !llvm.loop !550

for.end40:                                        ; preds = %for.cond8
  br label %for.inc41, !dbg !551

for.inc41:                                        ; preds = %for.end40
  %inc42 = add nsw i32 %m.0, 1, !dbg !552
  call void @llvm.dbg.value(metadata i32 %inc42, metadata !480, metadata !DIExpression()), !dbg !482
  br label %for.cond, !dbg !553, !llvm.loop !554

for.end43:                                        ; preds = %for.cond
  br label %if.end44, !dbg !555

if.end44:                                         ; preds = %for.end43, %if.end5
  %max.3 = phi float [ %max.0, %for.end43 ], [ 0xC7EFFFFFE0000000, %if.end5 ], !dbg !484
  %min.3 = phi float [ %min.0, %for.end43 ], [ 0x47EFFFFFE0000000, %if.end5 ], !dbg !485
  call void @llvm.dbg.value(metadata float %min.3, metadata !475, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.value(metadata float %max.3, metadata !476, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.value(metadata i32 %div, metadata !556, metadata !DIExpression()), !dbg !558
  br label %for.cond46, !dbg !559

for.cond46:                                       ; preds = %for.inc104, %if.end44
  %m45.0 = phi i32 [ %div, %if.end44 ], [ %inc105, %for.inc104 ], !dbg !558
  call void @llvm.dbg.value(metadata i32 %m45.0, metadata !556, metadata !DIExpression()), !dbg !558
  %sub47 = sub nsw i32 %nx, %div, !dbg !560
  %cmp48 = icmp slt i32 %m45.0, %sub47, !dbg !562
  br i1 %cmp48, label %for.body50, label %for.end106, !dbg !563

for.body50:                                       ; preds = %for.cond46
  call void @llvm.dbg.value(metadata i32 %div, metadata !564, metadata !DIExpression()), !dbg !566
  br label %for.cond52, !dbg !567

for.cond52:                                       ; preds = %for.inc101, %for.body50
  %n51.0 = phi i32 [ %div, %for.body50 ], [ %inc102, %for.inc101 ], !dbg !566
  call void @llvm.dbg.value(metadata i32 %n51.0, metadata !564, metadata !DIExpression()), !dbg !566
  %sub53 = sub nsw i32 %ny, %div, !dbg !568
  %cmp54 = icmp slt i32 %n51.0, %sub53, !dbg !570
  br i1 %cmp54, label %for.body56, label %for.end103, !dbg !571

for.body56:                                       ; preds = %for.cond52
  call void @llvm.dbg.value(metadata float 0.000000e+00, metadata !572, metadata !DIExpression()), !dbg !574
  call void @llvm.dbg.value(metadata i64 0, metadata !575, metadata !DIExpression()), !dbg !574
  %sub60 = sub nsw i32 0, %div, !dbg !576
  call void @llvm.dbg.value(metadata i32 %sub60, metadata !578, metadata !DIExpression()), !dbg !579
  br label %for.cond61, !dbg !580

for.cond61:                                       ; preds = %for.inc86, %for.body56
  %pixel57.0 = phi float [ 0.000000e+00, %for.body56 ], [ %pixel57.1, %for.inc86 ], !dbg !581
  %c58.0 = phi i64 [ 0, %for.body56 ], [ %c58.1, %for.inc86 ], !dbg !582
  %j59.0 = phi i32 [ %sub60, %for.body56 ], [ %inc87, %for.inc86 ], !dbg !579
  call void @llvm.dbg.value(metadata i32 %j59.0, metadata !578, metadata !DIExpression()), !dbg !579
  call void @llvm.dbg.value(metadata i64 %c58.0, metadata !575, metadata !DIExpression()), !dbg !574
  call void @llvm.dbg.value(metadata float %pixel57.0, metadata !572, metadata !DIExpression()), !dbg !574
  %cmp62 = icmp sle i32 %j59.0, %div, !dbg !583
  br i1 %cmp62, label %for.body64, label %for.end88, !dbg !585

for.body64:                                       ; preds = %for.cond61
  %sub66 = sub nsw i32 0, %div, !dbg !586
  call void @llvm.dbg.value(metadata i32 %sub66, metadata !588, metadata !DIExpression()), !dbg !589
  br label %for.cond67, !dbg !590

for.cond67:                                       ; preds = %for.inc83, %for.body64
  %pixel57.1 = phi float [ %pixel57.0, %for.body64 ], [ %add81, %for.inc83 ], !dbg !574
  %c58.1 = phi i64 [ %c58.0, %for.body64 ], [ %inc82, %for.inc83 ], !dbg !574
  %i65.0 = phi i32 [ %sub66, %for.body64 ], [ %inc84, %for.inc83 ], !dbg !589
  call void @llvm.dbg.value(metadata i32 %i65.0, metadata !588, metadata !DIExpression()), !dbg !589
  call void @llvm.dbg.value(metadata i64 %c58.1, metadata !575, metadata !DIExpression()), !dbg !574
  call void @llvm.dbg.value(metadata float %pixel57.1, metadata !572, metadata !DIExpression()), !dbg !574
  %cmp68 = icmp sle i32 %i65.0, %div, !dbg !591
  br i1 %cmp68, label %for.body70, label %for.end85, !dbg !593

for.body70:                                       ; preds = %for.cond67
  %sub71 = sub nsw i32 %n51.0, %j59.0, !dbg !594
  %mul72 = mul nsw i32 %sub71, %nx, !dbg !596
  %add73 = add nsw i32 %mul72, %m45.0, !dbg !597
  %sub74 = sub nsw i32 %add73, %i65.0, !dbg !598
  %idxprom75 = sext i32 %sub74 to i64, !dbg !599
  %arrayidx76 = getelementptr inbounds i16, i16* %in, i64 %idxprom75, !dbg !599
  %2 = load i16, i16* %arrayidx76, align 2, !dbg !599
  %conv77 = sext i16 %2 to i32, !dbg !599
  %conv78 = sitofp i32 %conv77 to float, !dbg !599
  %arrayidx79 = getelementptr inbounds float, float* %kernel, i64 %c58.1, !dbg !600
  %3 = load float, float* %arrayidx79, align 4, !dbg !600
  %mul80 = fmul float %conv78, %3, !dbg !601
  %add81 = fadd float %pixel57.1, %mul80, !dbg !602
  call void @llvm.dbg.value(metadata float %add81, metadata !572, metadata !DIExpression()), !dbg !574
  %inc82 = add i64 %c58.1, 1, !dbg !603
  call void @llvm.dbg.value(metadata i64 %inc82, metadata !575, metadata !DIExpression()), !dbg !574
  br label %for.inc83, !dbg !604

for.inc83:                                        ; preds = %for.body70
  %inc84 = add nsw i32 %i65.0, 1, !dbg !605
  call void @llvm.dbg.value(metadata i32 %inc84, metadata !588, metadata !DIExpression()), !dbg !589
  br label %for.cond67, !dbg !606, !llvm.loop !607

for.end85:                                        ; preds = %for.cond67
  br label %for.inc86, !dbg !608

for.inc86:                                        ; preds = %for.end85
  %inc87 = add nsw i32 %j59.0, 1, !dbg !609
  call void @llvm.dbg.value(metadata i32 %inc87, metadata !578, metadata !DIExpression()), !dbg !579
  br label %for.cond61, !dbg !610, !llvm.loop !611

for.end88:                                        ; preds = %for.cond61
  %tobool89 = trunc i8 %frombool to i1, !dbg !613
  br i1 %tobool89, label %if.then90, label %if.end95, !dbg !615

if.then90:                                        ; preds = %for.end88
  %sub91 = fsub float %pixel57.0, %min.3, !dbg !616
  %mul92 = fmul float 2.550000e+02, %sub91, !dbg !617
  %sub93 = fsub float %max.3, %min.3, !dbg !618
  %div94 = fdiv float %mul92, %sub93, !dbg !619
  call void @llvm.dbg.value(metadata float %div94, metadata !572, metadata !DIExpression()), !dbg !574
  br label %if.end95, !dbg !620

if.end95:                                         ; preds = %if.then90, %for.end88
  %pixel57.2 = phi float [ %div94, %if.then90 ], [ %pixel57.0, %for.end88 ], !dbg !574
  call void @llvm.dbg.value(metadata float %pixel57.2, metadata !572, metadata !DIExpression()), !dbg !574
  %conv96 = fptosi float %pixel57.2 to i16, !dbg !621
  %mul97 = mul nsw i32 %n51.0, %nx, !dbg !622
  %add98 = add nsw i32 %mul97, %m45.0, !dbg !623
  %idxprom99 = sext i32 %add98 to i64, !dbg !624
  %arrayidx100 = getelementptr inbounds i16, i16* %out, i64 %idxprom99, !dbg !624
  store i16 %conv96, i16* %arrayidx100, align 2, !dbg !625
  br label %for.inc101, !dbg !626

for.inc101:                                       ; preds = %if.end95
  %inc102 = add nsw i32 %n51.0, 1, !dbg !627
  call void @llvm.dbg.value(metadata i32 %inc102, metadata !564, metadata !DIExpression()), !dbg !566
  br label %for.cond52, !dbg !628, !llvm.loop !629

for.end103:                                       ; preds = %for.cond52
  br label %for.inc104, !dbg !630

for.inc104:                                       ; preds = %for.end103
  %inc105 = add nsw i32 %m45.0, 1, !dbg !631
  call void @llvm.dbg.value(metadata i32 %inc105, metadata !556, metadata !DIExpression()), !dbg !558
  br label %for.cond46, !dbg !632, !llvm.loop !633

for.end106:                                       ; preds = %for.cond46
  ret void, !dbg !635
}

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @gaussian_filter(i16* %in, i16* %out, i32 %nx, i32 %ny, float %sigma) #0 !dbg !636 {
entry:
  call void @llvm.dbg.value(metadata i16* %in, metadata !639, metadata !DIExpression()), !dbg !640
  call void @llvm.dbg.value(metadata i16* %out, metadata !641, metadata !DIExpression()), !dbg !640
  call void @llvm.dbg.value(metadata i32 %nx, metadata !642, metadata !DIExpression()), !dbg !640
  call void @llvm.dbg.value(metadata i32 %ny, metadata !643, metadata !DIExpression()), !dbg !640
  call void @llvm.dbg.value(metadata float %sigma, metadata !644, metadata !DIExpression()), !dbg !640
  %mul = fmul float 2.000000e+00, %sigma, !dbg !645
  %conv = fptosi float %mul to i32, !dbg !646
  %mul1 = mul nsw i32 2, %conv, !dbg !647
  %add = add nsw i32 %mul1, 3, !dbg !648
  call void @llvm.dbg.value(metadata i32 %add, metadata !649, metadata !DIExpression()), !dbg !640
  %conv2 = sitofp i32 %add to double, !dbg !650
  %div = fdiv double %conv2, 2.000000e+00, !dbg !651
  %0 = call double @llvm.floor.f64(double %div), !dbg !652
  %conv3 = fptrunc double %0 to float, !dbg !653
  call void @llvm.dbg.value(metadata float %conv3, metadata !654, metadata !DIExpression()), !dbg !640
  %mul4 = mul nsw i32 %add, %add, !dbg !655
  %1 = zext i32 %mul4 to i64, !dbg !656
  %2 = call i8* @llvm.stacksave(), !dbg !656
  %vla = alloca float, i64 %1, align 16, !dbg !656
  call void @llvm.dbg.value(metadata i64 %1, metadata !657, metadata !DIExpression()), !dbg !640
  call void @llvm.dbg.declare(metadata float* %vla, metadata !658, metadata !DIExpression()), !dbg !662
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !663
  %conv5 = fpext float %sigma to double, !dbg !664
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.8, i64 0, i64 0), i32 %add, double %conv5), !dbg !665
  call void @llvm.dbg.value(metadata i64 0, metadata !666, metadata !DIExpression()), !dbg !640
  call void @llvm.dbg.value(metadata i32 0, metadata !667, metadata !DIExpression()), !dbg !669
  br label %for.cond, !dbg !670

for.cond:                                         ; preds = %for.inc30, %entry
  %c.0 = phi i64 [ 0, %entry ], [ %c.1, %for.inc30 ], !dbg !671
  %i.0 = phi i32 [ 0, %entry ], [ %inc31, %for.inc30 ], !dbg !669
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !667, metadata !DIExpression()), !dbg !669
  call void @llvm.dbg.value(metadata i64 %c.0, metadata !666, metadata !DIExpression()), !dbg !640
  %cmp = icmp slt i32 %i.0, %add, !dbg !672
  br i1 %cmp, label %for.body, label %for.end32, !dbg !674

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 0, metadata !675, metadata !DIExpression()), !dbg !677
  br label %for.cond7, !dbg !678

for.cond7:                                        ; preds = %for.inc, %for.body
  %c.1 = phi i64 [ %c.0, %for.body ], [ %inc, %for.inc ], !dbg !640
  %j.0 = phi i32 [ 0, %for.body ], [ %inc29, %for.inc ], !dbg !677
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !675, metadata !DIExpression()), !dbg !677
  call void @llvm.dbg.value(metadata i64 %c.1, metadata !666, metadata !DIExpression()), !dbg !640
  %cmp8 = icmp slt i32 %j.0, %add, !dbg !679
  br i1 %cmp8, label %for.body10, label %for.end, !dbg !681

for.body10:                                       ; preds = %for.cond7
  %conv11 = sitofp i32 %i.0 to float, !dbg !682
  %sub = fsub float %conv11, %conv3, !dbg !684
  %div12 = fdiv float %sub, %sigma, !dbg !685
  %conv13 = fpext float %div12 to double, !dbg !686
  %call14 = call double @pow(double %conv13, double 2.000000e+00) #6, !dbg !687
  %conv15 = sitofp i32 %j.0 to float, !dbg !688
  %sub16 = fsub float %conv15, %conv3, !dbg !689
  %div17 = fdiv float %sub16, %sigma, !dbg !690
  %conv18 = fpext float %div17 to double, !dbg !691
  %call19 = call double @pow(double %conv18, double 2.000000e+00) #6, !dbg !692
  %add20 = fadd double %call14, %call19, !dbg !693
  %mul21 = fmul double -5.000000e-01, %add20, !dbg !694
  %call22 = call double @exp(double %mul21) #6, !dbg !695
  %conv23 = fpext float %sigma to double, !dbg !696
  %mul24 = fmul double 0x401921FB54442D18, %conv23, !dbg !697
  %conv25 = fpext float %sigma to double, !dbg !698
  %mul26 = fmul double %mul24, %conv25, !dbg !699
  %div27 = fdiv double %call22, %mul26, !dbg !700
  %conv28 = fptrunc double %div27 to float, !dbg !695
  %arrayidx = getelementptr inbounds float, float* %vla, i64 %c.1, !dbg !701
  store float %conv28, float* %arrayidx, align 4, !dbg !702
  %inc = add i64 %c.1, 1, !dbg !703
  call void @llvm.dbg.value(metadata i64 %inc, metadata !666, metadata !DIExpression()), !dbg !640
  br label %for.inc, !dbg !704

for.inc:                                          ; preds = %for.body10
  %inc29 = add nsw i32 %j.0, 1, !dbg !705
  call void @llvm.dbg.value(metadata i32 %inc29, metadata !675, metadata !DIExpression()), !dbg !677
  br label %for.cond7, !dbg !706, !llvm.loop !707

for.end:                                          ; preds = %for.cond7
  br label %for.inc30, !dbg !708

for.inc30:                                        ; preds = %for.end
  %inc31 = add nsw i32 %i.0, 1, !dbg !709
  call void @llvm.dbg.value(metadata i32 %inc31, metadata !667, metadata !DIExpression()), !dbg !669
  br label %for.cond, !dbg !710, !llvm.loop !711

for.end32:                                        ; preds = %for.cond
  call void @convolution(i16* %in, i16* %out, float* %vla, i32 %nx, i32 %ny, i32 %add, i1 zeroext true), !dbg !713
  call void @llvm.stackrestore(i8* %2), !dbg !714
  ret void, !dbg !714
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
define dso_local i16* @canny_edge_detection(i16* %in, %struct.bitmap_info_header_t* %bmp_ih, i32 %tmin, i32 %tmax, float %sigma) #0 !dbg !715 {
entry:
  %Gx = alloca [9 x float], align 16
  %Gy = alloca [9 x float], align 16
  %nbs = alloca [8 x i32], align 16
  call void @llvm.dbg.value(metadata i16* %in, metadata !718, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata %struct.bitmap_info_header_t* %bmp_ih, metadata !720, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata i32 %tmin, metadata !721, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata i32 %tmax, metadata !722, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata float %sigma, metadata !723, metadata !DIExpression()), !dbg !719
  %width = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %bmp_ih, i32 0, i32 1, !dbg !724
  %0 = load i32, i32* %width, align 4, !dbg !724
  call void @llvm.dbg.value(metadata i32 %0, metadata !725, metadata !DIExpression()), !dbg !719
  %height = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %bmp_ih, i32 0, i32 2, !dbg !726
  %1 = load i32, i32* %height, align 4, !dbg !726
  call void @llvm.dbg.value(metadata i32 %1, metadata !727, metadata !DIExpression()), !dbg !719
  %mul = mul nsw i32 %0, %1, !dbg !728
  %conv = sext i32 %mul to i64, !dbg !729
  %mul1 = mul i64 %conv, 2, !dbg !730
  %call = call noalias i8* @calloc(i64 %mul1, i64 1) #6, !dbg !731
  %2 = bitcast i8* %call to i16*, !dbg !731
  call void @llvm.dbg.value(metadata i16* %2, metadata !732, metadata !DIExpression()), !dbg !719
  %mul2 = mul nsw i32 %0, %1, !dbg !733
  %conv3 = sext i32 %mul2 to i64, !dbg !734
  %mul4 = mul i64 %conv3, 2, !dbg !735
  %call5 = call noalias i8* @calloc(i64 %mul4, i64 1) #6, !dbg !736
  %3 = bitcast i8* %call5 to i16*, !dbg !736
  call void @llvm.dbg.value(metadata i16* %3, metadata !737, metadata !DIExpression()), !dbg !719
  %mul6 = mul nsw i32 %0, %1, !dbg !738
  %conv7 = sext i32 %mul6 to i64, !dbg !739
  %mul8 = mul i64 %conv7, 2, !dbg !740
  %call9 = call noalias i8* @calloc(i64 %mul8, i64 1) #6, !dbg !741
  %4 = bitcast i8* %call9 to i16*, !dbg !741
  call void @llvm.dbg.value(metadata i16* %4, metadata !742, metadata !DIExpression()), !dbg !719
  %mul10 = mul nsw i32 %0, %1, !dbg !743
  %conv11 = sext i32 %mul10 to i64, !dbg !744
  %mul12 = mul i64 %conv11, 2, !dbg !745
  %call13 = call noalias i8* @calloc(i64 %mul12, i64 1) #6, !dbg !746
  %5 = bitcast i8* %call13 to i16*, !dbg !746
  call void @llvm.dbg.value(metadata i16* %5, metadata !747, metadata !DIExpression()), !dbg !719
  %bmp_bytesz = getelementptr inbounds %struct.bitmap_info_header_t, %struct.bitmap_info_header_t* %bmp_ih, i32 0, i32 6, !dbg !748
  %6 = load i32, i32* %bmp_bytesz, align 4, !dbg !748
  %conv14 = zext i32 %6 to i64, !dbg !749
  %mul15 = mul i64 %conv14, 2, !dbg !750
  %call16 = call noalias i8* @malloc(i64 %mul15) #6, !dbg !751
  %7 = bitcast i8* %call16 to i16*, !dbg !751
  call void @llvm.dbg.value(metadata i16* %7, metadata !752, metadata !DIExpression()), !dbg !719
  %cmp = icmp eq i16* %2, null, !dbg !753
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !755

lor.lhs.false:                                    ; preds = %entry
  %cmp18 = icmp eq i16* %3, null, !dbg !756
  br i1 %cmp18, label %if.then, label %lor.lhs.false20, !dbg !757

lor.lhs.false20:                                  ; preds = %lor.lhs.false
  %cmp21 = icmp eq i16* %4, null, !dbg !758
  br i1 %cmp21, label %if.then, label %lor.lhs.false23, !dbg !759

lor.lhs.false23:                                  ; preds = %lor.lhs.false20
  %cmp24 = icmp eq i16* %5, null, !dbg !760
  br i1 %cmp24, label %if.then, label %lor.lhs.false26, !dbg !761

lor.lhs.false26:                                  ; preds = %lor.lhs.false23
  %cmp27 = icmp eq i16* %7, null, !dbg !762
  br i1 %cmp27, label %if.then, label %if.end, !dbg !763

if.then:                                          ; preds = %lor.lhs.false26, %lor.lhs.false23, %lor.lhs.false20, %lor.lhs.false, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !764
  %call29 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.9, i64 0, i64 0)), !dbg !766
  call void @exit(i32 1) #7, !dbg !767
  unreachable, !dbg !767

if.end:                                           ; preds = %lor.lhs.false26
  call void @gaussian_filter(i16* %in, i16* %7, i32 %0, i32 %1, float %sigma), !dbg !768
  call void @llvm.dbg.declare(metadata [9 x float]* %Gx, metadata !769, metadata !DIExpression()), !dbg !773
  %9 = bitcast [9 x float]* %Gx to i8*, !dbg !773
  call void @llvm.memset.p0i8.i64(i8* align 16 %9, i8 0, i64 36, i1 false), !dbg !773
  %10 = bitcast i8* %9 to [9 x float]*, !dbg !773
  %11 = getelementptr inbounds [9 x float], [9 x float]* %10, i32 0, i32 0, !dbg !773
  store float -1.000000e+00, float* %11, align 16, !dbg !773
  %12 = getelementptr inbounds [9 x float], [9 x float]* %10, i32 0, i32 2, !dbg !773
  store float 1.000000e+00, float* %12, align 8, !dbg !773
  %13 = getelementptr inbounds [9 x float], [9 x float]* %10, i32 0, i32 3, !dbg !773
  store float -2.000000e+00, float* %13, align 4, !dbg !773
  %14 = getelementptr inbounds [9 x float], [9 x float]* %10, i32 0, i32 5, !dbg !773
  store float 2.000000e+00, float* %14, align 4, !dbg !773
  %15 = getelementptr inbounds [9 x float], [9 x float]* %10, i32 0, i32 6, !dbg !773
  store float -1.000000e+00, float* %15, align 8, !dbg !773
  %16 = getelementptr inbounds [9 x float], [9 x float]* %10, i32 0, i32 8, !dbg !773
  store float 1.000000e+00, float* %16, align 16, !dbg !773
  %arraydecay = getelementptr inbounds [9 x float], [9 x float]* %Gx, i64 0, i64 0, !dbg !774
  call void @convolution(i16* %7, i16* %3, float* %arraydecay, i32 %0, i32 %1, i32 3, i1 zeroext false), !dbg !775
  call void @llvm.dbg.declare(metadata [9 x float]* %Gy, metadata !776, metadata !DIExpression()), !dbg !777
  %17 = bitcast [9 x float]* %Gy to i8*, !dbg !777
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 36, i1 false), !dbg !777
  %18 = bitcast i8* %17 to [9 x float]*, !dbg !777
  %19 = getelementptr inbounds [9 x float], [9 x float]* %18, i32 0, i32 0, !dbg !777
  store float 1.000000e+00, float* %19, align 16, !dbg !777
  %20 = getelementptr inbounds [9 x float], [9 x float]* %18, i32 0, i32 1, !dbg !777
  store float 2.000000e+00, float* %20, align 4, !dbg !777
  %21 = getelementptr inbounds [9 x float], [9 x float]* %18, i32 0, i32 2, !dbg !777
  store float 1.000000e+00, float* %21, align 8, !dbg !777
  %22 = getelementptr inbounds [9 x float], [9 x float]* %18, i32 0, i32 6, !dbg !777
  store float -1.000000e+00, float* %22, align 8, !dbg !777
  %23 = getelementptr inbounds [9 x float], [9 x float]* %18, i32 0, i32 7, !dbg !777
  store float -2.000000e+00, float* %23, align 4, !dbg !777
  %24 = getelementptr inbounds [9 x float], [9 x float]* %18, i32 0, i32 8, !dbg !777
  store float -1.000000e+00, float* %24, align 16, !dbg !777
  %arraydecay30 = getelementptr inbounds [9 x float], [9 x float]* %Gy, i64 0, i64 0, !dbg !778
  call void @convolution(i16* %7, i16* %4, float* %arraydecay30, i32 %0, i32 %1, i32 3, i1 zeroext false), !dbg !779
  call void @llvm.dbg.value(metadata i32 1, metadata !780, metadata !DIExpression()), !dbg !782
  br label %for.cond, !dbg !783

for.cond:                                         ; preds = %for.inc47, %if.end
  %i.0 = phi i32 [ 1, %if.end ], [ %inc48, %for.inc47 ], !dbg !782
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !780, metadata !DIExpression()), !dbg !782
  %sub = sub nsw i32 %0, 1, !dbg !784
  %cmp31 = icmp slt i32 %i.0, %sub, !dbg !786
  br i1 %cmp31, label %for.body, label %for.end49, !dbg !787

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 1, metadata !788, metadata !DIExpression()), !dbg !790
  br label %for.cond33, !dbg !791

for.cond33:                                       ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 1, %for.body ], [ %inc, %for.inc ], !dbg !790
  call void @llvm.dbg.value(metadata i32 %j.0, metadata !788, metadata !DIExpression()), !dbg !790
  %sub34 = sub nsw i32 %1, 1, !dbg !792
  %cmp35 = icmp slt i32 %j.0, %sub34, !dbg !794
  br i1 %cmp35, label %for.body37, label %for.end, !dbg !795

for.body37:                                       ; preds = %for.cond33
  %mul38 = mul nsw i32 %0, %j.0, !dbg !796
  %add = add nsw i32 %i.0, %mul38, !dbg !798
  call void @llvm.dbg.value(metadata i32 %add, metadata !799, metadata !DIExpression()), !dbg !800
  %idxprom = sext i32 %add to i64, !dbg !801
  %arrayidx = getelementptr inbounds i16, i16* %3, i64 %idxprom, !dbg !801
  %25 = load i16, i16* %arrayidx, align 2, !dbg !801
  %conv39 = sitofp i16 %25 to double, !dbg !801
  %idxprom40 = sext i32 %add to i64, !dbg !802
  %arrayidx41 = getelementptr inbounds i16, i16* %4, i64 %idxprom40, !dbg !802
  %26 = load i16, i16* %arrayidx41, align 2, !dbg !802
  %conv42 = sitofp i16 %26 to double, !dbg !802
  %call43 = call double @hypot(double %conv39, double %conv42) #6, !dbg !803
  %conv44 = fptosi double %call43 to i16, !dbg !804
  %idxprom45 = sext i32 %add to i64, !dbg !805
  %arrayidx46 = getelementptr inbounds i16, i16* %2, i64 %idxprom45, !dbg !805
  store i16 %conv44, i16* %arrayidx46, align 2, !dbg !806
  br label %for.inc, !dbg !807

for.inc:                                          ; preds = %for.body37
  %inc = add nsw i32 %j.0, 1, !dbg !808
  call void @llvm.dbg.value(metadata i32 %inc, metadata !788, metadata !DIExpression()), !dbg !790
  br label %for.cond33, !dbg !809, !llvm.loop !810

for.end:                                          ; preds = %for.cond33
  br label %for.inc47, !dbg !811

for.inc47:                                        ; preds = %for.end
  %inc48 = add nsw i32 %i.0, 1, !dbg !812
  call void @llvm.dbg.value(metadata i32 %inc48, metadata !780, metadata !DIExpression()), !dbg !782
  br label %for.cond, !dbg !813, !llvm.loop !814

for.end49:                                        ; preds = %for.cond
  call void @llvm.dbg.value(metadata i32 1, metadata !816, metadata !DIExpression()), !dbg !818
  br label %for.cond51, !dbg !819

for.cond51:                                       ; preds = %for.inc189, %for.end49
  %i50.0 = phi i32 [ 1, %for.end49 ], [ %inc190, %for.inc189 ], !dbg !818
  call void @llvm.dbg.value(metadata i32 %i50.0, metadata !816, metadata !DIExpression()), !dbg !818
  %sub52 = sub nsw i32 %0, 1, !dbg !820
  %cmp53 = icmp slt i32 %i50.0, %sub52, !dbg !822
  br i1 %cmp53, label %for.body55, label %for.end191, !dbg !823

for.body55:                                       ; preds = %for.cond51
  call void @llvm.dbg.value(metadata i32 1, metadata !824, metadata !DIExpression()), !dbg !826
  br label %for.cond57, !dbg !827

for.cond57:                                       ; preds = %for.inc186, %for.body55
  %j56.0 = phi i32 [ 1, %for.body55 ], [ %inc187, %for.inc186 ], !dbg !826
  call void @llvm.dbg.value(metadata i32 %j56.0, metadata !824, metadata !DIExpression()), !dbg !826
  %sub58 = sub nsw i32 %1, 1, !dbg !828
  %cmp59 = icmp slt i32 %j56.0, %sub58, !dbg !830
  br i1 %cmp59, label %for.body61, label %for.end188, !dbg !831

for.body61:                                       ; preds = %for.cond57
  %mul63 = mul nsw i32 %0, %j56.0, !dbg !832
  %add64 = add nsw i32 %i50.0, %mul63, !dbg !834
  call void @llvm.dbg.value(metadata i32 %add64, metadata !835, metadata !DIExpression()), !dbg !836
  %sub65 = sub nsw i32 %add64, %0, !dbg !837
  call void @llvm.dbg.value(metadata i32 %sub65, metadata !838, metadata !DIExpression()), !dbg !836
  %add66 = add nsw i32 %add64, %0, !dbg !839
  call void @llvm.dbg.value(metadata i32 %add66, metadata !840, metadata !DIExpression()), !dbg !836
  %add67 = add nsw i32 %add64, 1, !dbg !841
  call void @llvm.dbg.value(metadata i32 %add67, metadata !842, metadata !DIExpression()), !dbg !836
  %sub68 = sub nsw i32 %add64, 1, !dbg !843
  call void @llvm.dbg.value(metadata i32 %sub68, metadata !844, metadata !DIExpression()), !dbg !836
  %add69 = add nsw i32 %sub65, 1, !dbg !845
  call void @llvm.dbg.value(metadata i32 %add69, metadata !846, metadata !DIExpression()), !dbg !836
  %sub70 = sub nsw i32 %sub65, 1, !dbg !847
  call void @llvm.dbg.value(metadata i32 %sub70, metadata !848, metadata !DIExpression()), !dbg !836
  %add71 = add nsw i32 %add66, 1, !dbg !849
  call void @llvm.dbg.value(metadata i32 %add71, metadata !850, metadata !DIExpression()), !dbg !836
  %sub72 = sub nsw i32 %add66, 1, !dbg !851
  call void @llvm.dbg.value(metadata i32 %sub72, metadata !852, metadata !DIExpression()), !dbg !836
  %idxprom73 = sext i32 %add64 to i64, !dbg !853
  %arrayidx74 = getelementptr inbounds i16, i16* %4, i64 %idxprom73, !dbg !853
  %27 = load i16, i16* %arrayidx74, align 2, !dbg !853
  %conv75 = sitofp i16 %27 to double, !dbg !853
  %idxprom76 = sext i32 %add64 to i64, !dbg !854
  %arrayidx77 = getelementptr inbounds i16, i16* %3, i64 %idxprom76, !dbg !854
  %28 = load i16, i16* %arrayidx77, align 2, !dbg !854
  %conv78 = sitofp i16 %28 to double, !dbg !854
  %call79 = call double @atan2(double %conv75, double %conv78) #6, !dbg !855
  %add80 = fadd double %call79, 0x400921FB54442D18, !dbg !856
  %call81 = call double @fmod(double %add80, double 0x400921FB54442D18) #6, !dbg !857
  %div = fdiv double %call81, 0x400921FB54442D18, !dbg !858
  %conv82 = fptrunc double %div to float, !dbg !859
  %mul83 = fmul float %conv82, 8.000000e+00, !dbg !860
  call void @llvm.dbg.value(metadata float %mul83, metadata !861, metadata !DIExpression()), !dbg !836
  %cmp84 = fcmp ole float %mul83, 1.000000e+00, !dbg !862
  br i1 %cmp84, label %land.lhs.true, label %lor.lhs.false86, !dbg !864

lor.lhs.false86:                                  ; preds = %for.body61
  %cmp87 = fcmp ogt float %mul83, 7.000000e+00, !dbg !865
  br i1 %cmp87, label %land.lhs.true, label %lor.lhs.false106, !dbg !866

land.lhs.true:                                    ; preds = %lor.lhs.false86, %for.body61
  %idxprom89 = sext i32 %add64 to i64, !dbg !867
  %arrayidx90 = getelementptr inbounds i16, i16* %2, i64 %idxprom89, !dbg !867
  %29 = load i16, i16* %arrayidx90, align 2, !dbg !867
  %conv91 = sext i16 %29 to i32, !dbg !867
  %idxprom92 = sext i32 %sub68 to i64, !dbg !868
  %arrayidx93 = getelementptr inbounds i16, i16* %2, i64 %idxprom92, !dbg !868
  %30 = load i16, i16* %arrayidx93, align 2, !dbg !868
  %conv94 = sext i16 %30 to i32, !dbg !868
  %cmp95 = icmp sgt i32 %conv91, %conv94, !dbg !869
  br i1 %cmp95, label %land.lhs.true97, label %lor.lhs.false106, !dbg !870

land.lhs.true97:                                  ; preds = %land.lhs.true
  %idxprom98 = sext i32 %add64 to i64, !dbg !871
  %arrayidx99 = getelementptr inbounds i16, i16* %2, i64 %idxprom98, !dbg !871
  %31 = load i16, i16* %arrayidx99, align 2, !dbg !871
  %conv100 = sext i16 %31 to i32, !dbg !871
  %idxprom101 = sext i32 %add67 to i64, !dbg !872
  %arrayidx102 = getelementptr inbounds i16, i16* %2, i64 %idxprom101, !dbg !872
  %32 = load i16, i16* %arrayidx102, align 2, !dbg !872
  %conv103 = sext i16 %32 to i32, !dbg !872
  %cmp104 = icmp sgt i32 %conv100, %conv103, !dbg !873
  br i1 %cmp104, label %if.then178, label %lor.lhs.false106, !dbg !874

lor.lhs.false106:                                 ; preds = %land.lhs.true97, %land.lhs.true, %lor.lhs.false86
  %cmp107 = fcmp ogt float %mul83, 1.000000e+00, !dbg !875
  br i1 %cmp107, label %land.lhs.true109, label %lor.lhs.false130, !dbg !876

land.lhs.true109:                                 ; preds = %lor.lhs.false106
  %cmp110 = fcmp ole float %mul83, 3.000000e+00, !dbg !877
  br i1 %cmp110, label %land.lhs.true112, label %lor.lhs.false130, !dbg !878

land.lhs.true112:                                 ; preds = %land.lhs.true109
  %idxprom113 = sext i32 %add64 to i64, !dbg !879
  %arrayidx114 = getelementptr inbounds i16, i16* %2, i64 %idxprom113, !dbg !879
  %33 = load i16, i16* %arrayidx114, align 2, !dbg !879
  %conv115 = sext i16 %33 to i32, !dbg !879
  %idxprom116 = sext i32 %add69 to i64, !dbg !880
  %arrayidx117 = getelementptr inbounds i16, i16* %2, i64 %idxprom116, !dbg !880
  %34 = load i16, i16* %arrayidx117, align 2, !dbg !880
  %conv118 = sext i16 %34 to i32, !dbg !880
  %cmp119 = icmp sgt i32 %conv115, %conv118, !dbg !881
  br i1 %cmp119, label %land.lhs.true121, label %lor.lhs.false130, !dbg !882

land.lhs.true121:                                 ; preds = %land.lhs.true112
  %idxprom122 = sext i32 %add64 to i64, !dbg !883
  %arrayidx123 = getelementptr inbounds i16, i16* %2, i64 %idxprom122, !dbg !883
  %35 = load i16, i16* %arrayidx123, align 2, !dbg !883
  %conv124 = sext i16 %35 to i32, !dbg !883
  %idxprom125 = sext i32 %sub72 to i64, !dbg !884
  %arrayidx126 = getelementptr inbounds i16, i16* %2, i64 %idxprom125, !dbg !884
  %36 = load i16, i16* %arrayidx126, align 2, !dbg !884
  %conv127 = sext i16 %36 to i32, !dbg !884
  %cmp128 = icmp sgt i32 %conv124, %conv127, !dbg !885
  br i1 %cmp128, label %if.then178, label %lor.lhs.false130, !dbg !886

lor.lhs.false130:                                 ; preds = %land.lhs.true121, %land.lhs.true112, %land.lhs.true109, %lor.lhs.false106
  %cmp131 = fcmp ogt float %mul83, 3.000000e+00, !dbg !887
  br i1 %cmp131, label %land.lhs.true133, label %lor.lhs.false154, !dbg !888

land.lhs.true133:                                 ; preds = %lor.lhs.false130
  %cmp134 = fcmp ole float %mul83, 5.000000e+00, !dbg !889
  br i1 %cmp134, label %land.lhs.true136, label %lor.lhs.false154, !dbg !890

land.lhs.true136:                                 ; preds = %land.lhs.true133
  %idxprom137 = sext i32 %add64 to i64, !dbg !891
  %arrayidx138 = getelementptr inbounds i16, i16* %2, i64 %idxprom137, !dbg !891
  %37 = load i16, i16* %arrayidx138, align 2, !dbg !891
  %conv139 = sext i16 %37 to i32, !dbg !891
  %idxprom140 = sext i32 %sub65 to i64, !dbg !892
  %arrayidx141 = getelementptr inbounds i16, i16* %2, i64 %idxprom140, !dbg !892
  %38 = load i16, i16* %arrayidx141, align 2, !dbg !892
  %conv142 = sext i16 %38 to i32, !dbg !892
  %cmp143 = icmp sgt i32 %conv139, %conv142, !dbg !893
  br i1 %cmp143, label %land.lhs.true145, label %lor.lhs.false154, !dbg !894

land.lhs.true145:                                 ; preds = %land.lhs.true136
  %idxprom146 = sext i32 %add64 to i64, !dbg !895
  %arrayidx147 = getelementptr inbounds i16, i16* %2, i64 %idxprom146, !dbg !895
  %39 = load i16, i16* %arrayidx147, align 2, !dbg !895
  %conv148 = sext i16 %39 to i32, !dbg !895
  %idxprom149 = sext i32 %add66 to i64, !dbg !896
  %arrayidx150 = getelementptr inbounds i16, i16* %2, i64 %idxprom149, !dbg !896
  %40 = load i16, i16* %arrayidx150, align 2, !dbg !896
  %conv151 = sext i16 %40 to i32, !dbg !896
  %cmp152 = icmp sgt i32 %conv148, %conv151, !dbg !897
  br i1 %cmp152, label %if.then178, label %lor.lhs.false154, !dbg !898

lor.lhs.false154:                                 ; preds = %land.lhs.true145, %land.lhs.true136, %land.lhs.true133, %lor.lhs.false130
  %cmp155 = fcmp ogt float %mul83, 5.000000e+00, !dbg !899
  br i1 %cmp155, label %land.lhs.true157, label %if.else, !dbg !900

land.lhs.true157:                                 ; preds = %lor.lhs.false154
  %cmp158 = fcmp ole float %mul83, 7.000000e+00, !dbg !901
  br i1 %cmp158, label %land.lhs.true160, label %if.else, !dbg !902

land.lhs.true160:                                 ; preds = %land.lhs.true157
  %idxprom161 = sext i32 %add64 to i64, !dbg !903
  %arrayidx162 = getelementptr inbounds i16, i16* %2, i64 %idxprom161, !dbg !903
  %41 = load i16, i16* %arrayidx162, align 2, !dbg !903
  %conv163 = sext i16 %41 to i32, !dbg !903
  %idxprom164 = sext i32 %sub70 to i64, !dbg !904
  %arrayidx165 = getelementptr inbounds i16, i16* %2, i64 %idxprom164, !dbg !904
  %42 = load i16, i16* %arrayidx165, align 2, !dbg !904
  %conv166 = sext i16 %42 to i32, !dbg !904
  %cmp167 = icmp sgt i32 %conv163, %conv166, !dbg !905
  br i1 %cmp167, label %land.lhs.true169, label %if.else, !dbg !906

land.lhs.true169:                                 ; preds = %land.lhs.true160
  %idxprom170 = sext i32 %add64 to i64, !dbg !907
  %arrayidx171 = getelementptr inbounds i16, i16* %2, i64 %idxprom170, !dbg !907
  %43 = load i16, i16* %arrayidx171, align 2, !dbg !907
  %conv172 = sext i16 %43 to i32, !dbg !907
  %idxprom173 = sext i32 %add71 to i64, !dbg !908
  %arrayidx174 = getelementptr inbounds i16, i16* %2, i64 %idxprom173, !dbg !908
  %44 = load i16, i16* %arrayidx174, align 2, !dbg !908
  %conv175 = sext i16 %44 to i32, !dbg !908
  %cmp176 = icmp sgt i32 %conv172, %conv175, !dbg !909
  br i1 %cmp176, label %if.then178, label %if.else, !dbg !910

if.then178:                                       ; preds = %land.lhs.true169, %land.lhs.true145, %land.lhs.true121, %land.lhs.true97
  %idxprom179 = sext i32 %add64 to i64, !dbg !911
  %arrayidx180 = getelementptr inbounds i16, i16* %2, i64 %idxprom179, !dbg !911
  %45 = load i16, i16* %arrayidx180, align 2, !dbg !911
  %idxprom181 = sext i32 %add64 to i64, !dbg !912
  %arrayidx182 = getelementptr inbounds i16, i16* %5, i64 %idxprom181, !dbg !912
  store i16 %45, i16* %arrayidx182, align 2, !dbg !913
  br label %if.end185, !dbg !912

if.else:                                          ; preds = %land.lhs.true169, %land.lhs.true160, %land.lhs.true157, %lor.lhs.false154
  %idxprom183 = sext i32 %add64 to i64, !dbg !914
  %arrayidx184 = getelementptr inbounds i16, i16* %5, i64 %idxprom183, !dbg !914
  store i16 0, i16* %arrayidx184, align 2, !dbg !915
  br label %if.end185

if.end185:                                        ; preds = %if.else, %if.then178
  br label %for.inc186, !dbg !916

for.inc186:                                       ; preds = %if.end185
  %inc187 = add nsw i32 %j56.0, 1, !dbg !917
  call void @llvm.dbg.value(metadata i32 %inc187, metadata !824, metadata !DIExpression()), !dbg !826
  br label %for.cond57, !dbg !918, !llvm.loop !919

for.end188:                                       ; preds = %for.cond57
  br label %for.inc189, !dbg !920

for.inc189:                                       ; preds = %for.end188
  %inc190 = add nsw i32 %i50.0, 1, !dbg !921
  call void @llvm.dbg.value(metadata i32 %inc190, metadata !816, metadata !DIExpression()), !dbg !818
  br label %for.cond51, !dbg !922, !llvm.loop !923

for.end191:                                       ; preds = %for.cond51
  %46 = bitcast i16* %4 to i32*, !dbg !925
  call void @llvm.dbg.value(metadata i32* %46, metadata !926, metadata !DIExpression()), !dbg !719
  %47 = bitcast i16* %7 to i8*, !dbg !927
  %conv192 = sext i32 %0 to i64, !dbg !928
  %mul193 = mul i64 2, %conv192, !dbg !929
  %conv194 = sext i32 %1 to i64, !dbg !930
  %mul195 = mul i64 %mul193, %conv194, !dbg !931
  call void @llvm.memset.p0i8.i64(i8* align 2 %47, i8 0, i64 %mul195, i1 false), !dbg !927
  %48 = bitcast i32* %46 to i8*, !dbg !932
  %conv196 = sext i32 %0 to i64, !dbg !933
  %mul197 = mul i64 2, %conv196, !dbg !934
  %conv198 = sext i32 %1 to i64, !dbg !935
  %mul199 = mul i64 %mul197, %conv198, !dbg !936
  call void @llvm.memset.p0i8.i64(i8* align 4 %48, i8 0, i64 %mul199, i1 false), !dbg !932
  call void @llvm.dbg.value(metadata i64 1, metadata !937, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata i32 1, metadata !938, metadata !DIExpression()), !dbg !940
  br label %for.cond202, !dbg !941

for.cond202:                                      ; preds = %for.inc288, %for.end191
  %c200.0 = phi i64 [ 1, %for.end191 ], [ %c200.1, %for.inc288 ], !dbg !942
  %j201.0 = phi i32 [ 1, %for.end191 ], [ %inc289, %for.inc288 ], !dbg !940
  call void @llvm.dbg.value(metadata i32 %j201.0, metadata !938, metadata !DIExpression()), !dbg !940
  call void @llvm.dbg.value(metadata i64 %c200.0, metadata !937, metadata !DIExpression()), !dbg !719
  %sub203 = sub nsw i32 %1, 1, !dbg !943
  %cmp204 = icmp slt i32 %j201.0, %sub203, !dbg !945
  br i1 %cmp204, label %for.body206, label %for.end290, !dbg !946

for.body206:                                      ; preds = %for.cond202
  call void @llvm.dbg.value(metadata i32 1, metadata !947, metadata !DIExpression()), !dbg !949
  br label %for.cond208, !dbg !950

for.cond208:                                      ; preds = %for.inc285, %for.body206
  %c200.1 = phi i64 [ %c200.0, %for.body206 ], [ %inc284, %for.inc285 ], !dbg !719
  %i207.0 = phi i32 [ 1, %for.body206 ], [ %inc286, %for.inc285 ], !dbg !949
  call void @llvm.dbg.value(metadata i32 %i207.0, metadata !947, metadata !DIExpression()), !dbg !949
  call void @llvm.dbg.value(metadata i64 %c200.1, metadata !937, metadata !DIExpression()), !dbg !719
  %sub209 = sub nsw i32 %0, 1, !dbg !951
  %cmp210 = icmp slt i32 %i207.0, %sub209, !dbg !953
  br i1 %cmp210, label %for.body212, label %for.end287, !dbg !954

for.body212:                                      ; preds = %for.cond208
  %arrayidx213 = getelementptr inbounds i16, i16* %5, i64 %c200.1, !dbg !955
  %49 = load i16, i16* %arrayidx213, align 2, !dbg !955
  %conv214 = sext i16 %49 to i32, !dbg !955
  %cmp215 = icmp sge i32 %conv214, %tmax, !dbg !958
  br i1 %cmp215, label %land.lhs.true217, label %if.end283, !dbg !959

land.lhs.true217:                                 ; preds = %for.body212
  %arrayidx218 = getelementptr inbounds i16, i16* %7, i64 %c200.1, !dbg !960
  %50 = load i16, i16* %arrayidx218, align 2, !dbg !960
  %conv219 = sext i16 %50 to i32, !dbg !960
  %cmp220 = icmp eq i32 %conv219, 0, !dbg !961
  br i1 %cmp220, label %if.then222, label %if.end283, !dbg !962

if.then222:                                       ; preds = %land.lhs.true217
  %arrayidx223 = getelementptr inbounds i16, i16* %7, i64 %c200.1, !dbg !963
  store i16 255, i16* %arrayidx223, align 2, !dbg !965
  call void @llvm.dbg.value(metadata i32 1, metadata !966, metadata !DIExpression()), !dbg !967
  %conv224 = trunc i64 %c200.1 to i32, !dbg !968
  %arrayidx225 = getelementptr inbounds i32, i32* %46, i64 0, !dbg !969
  store i32 %conv224, i32* %arrayidx225, align 4, !dbg !970
  br label %do.body, !dbg !971

do.body:                                          ; preds = %do.cond, %if.then222
  %nedges.0 = phi i32 [ 1, %if.then222 ], [ %nedges.1, %do.cond ], !dbg !967
  call void @llvm.dbg.value(metadata i32 %nedges.0, metadata !966, metadata !DIExpression()), !dbg !967
  %dec = add nsw i32 %nedges.0, -1, !dbg !972
  call void @llvm.dbg.value(metadata i32 %dec, metadata !966, metadata !DIExpression()), !dbg !967
  %idxprom226 = sext i32 %dec to i64, !dbg !974
  %arrayidx227 = getelementptr inbounds i32, i32* %46, i64 %idxprom226, !dbg !974
  %51 = load i32, i32* %arrayidx227, align 4, !dbg !974
  call void @llvm.dbg.value(metadata i32 %51, metadata !975, metadata !DIExpression()), !dbg !976
  call void @llvm.dbg.declare(metadata [8 x i32]* %nbs, metadata !977, metadata !DIExpression()), !dbg !981
  %sub228 = sub nsw i32 %51, %0, !dbg !982
  %arrayidx229 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 0, !dbg !983
  store i32 %sub228, i32* %arrayidx229, align 16, !dbg !984
  %add230 = add nsw i32 %51, %0, !dbg !985
  %arrayidx231 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 1, !dbg !986
  store i32 %add230, i32* %arrayidx231, align 4, !dbg !987
  %add232 = add nsw i32 %51, 1, !dbg !988
  %arrayidx233 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 2, !dbg !989
  store i32 %add232, i32* %arrayidx233, align 8, !dbg !990
  %sub234 = sub nsw i32 %51, 1, !dbg !991
  %arrayidx235 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 3, !dbg !992
  store i32 %sub234, i32* %arrayidx235, align 4, !dbg !993
  %arrayidx236 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 0, !dbg !994
  %52 = load i32, i32* %arrayidx236, align 16, !dbg !994
  %add237 = add nsw i32 %52, 1, !dbg !995
  %arrayidx238 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 4, !dbg !996
  store i32 %add237, i32* %arrayidx238, align 16, !dbg !997
  %arrayidx239 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 0, !dbg !998
  %53 = load i32, i32* %arrayidx239, align 16, !dbg !998
  %sub240 = sub nsw i32 %53, 1, !dbg !999
  %arrayidx241 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 5, !dbg !1000
  store i32 %sub240, i32* %arrayidx241, align 4, !dbg !1001
  %arrayidx242 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 1, !dbg !1002
  %54 = load i32, i32* %arrayidx242, align 4, !dbg !1002
  %add243 = add nsw i32 %54, 1, !dbg !1003
  %arrayidx244 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 6, !dbg !1004
  store i32 %add243, i32* %arrayidx244, align 8, !dbg !1005
  %arrayidx245 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 1, !dbg !1006
  %55 = load i32, i32* %arrayidx245, align 4, !dbg !1006
  %sub246 = sub nsw i32 %55, 1, !dbg !1007
  %arrayidx247 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 7, !dbg !1008
  store i32 %sub246, i32* %arrayidx247, align 4, !dbg !1009
  call void @llvm.dbg.value(metadata i32 0, metadata !1010, metadata !DIExpression()), !dbg !1012
  br label %for.cond248, !dbg !1013

for.cond248:                                      ; preds = %for.inc278, %do.body
  %nedges.1 = phi i32 [ %dec, %do.body ], [ %nedges.2, %for.inc278 ], !dbg !976
  %k.0 = phi i32 [ 0, %do.body ], [ %inc279, %for.inc278 ], !dbg !1012
  call void @llvm.dbg.value(metadata i32 %k.0, metadata !1010, metadata !DIExpression()), !dbg !1012
  call void @llvm.dbg.value(metadata i32 %nedges.1, metadata !966, metadata !DIExpression()), !dbg !967
  %cmp249 = icmp slt i32 %k.0, 8, !dbg !1014
  br i1 %cmp249, label %for.body251, label %for.end280, !dbg !1016

for.body251:                                      ; preds = %for.cond248
  %idxprom252 = sext i32 %k.0 to i64, !dbg !1017
  %arrayidx253 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 %idxprom252, !dbg !1017
  %56 = load i32, i32* %arrayidx253, align 4, !dbg !1017
  %idxprom254 = sext i32 %56 to i64, !dbg !1019
  %arrayidx255 = getelementptr inbounds i16, i16* %5, i64 %idxprom254, !dbg !1019
  %57 = load i16, i16* %arrayidx255, align 2, !dbg !1019
  %conv256 = sext i16 %57 to i32, !dbg !1019
  %cmp257 = icmp sge i32 %conv256, %tmin, !dbg !1020
  br i1 %cmp257, label %land.lhs.true259, label %if.end277, !dbg !1021

land.lhs.true259:                                 ; preds = %for.body251
  %idxprom260 = sext i32 %k.0 to i64, !dbg !1022
  %arrayidx261 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 %idxprom260, !dbg !1022
  %58 = load i32, i32* %arrayidx261, align 4, !dbg !1022
  %idxprom262 = sext i32 %58 to i64, !dbg !1023
  %arrayidx263 = getelementptr inbounds i16, i16* %7, i64 %idxprom262, !dbg !1023
  %59 = load i16, i16* %arrayidx263, align 2, !dbg !1023
  %conv264 = sext i16 %59 to i32, !dbg !1023
  %cmp265 = icmp eq i32 %conv264, 0, !dbg !1024
  br i1 %cmp265, label %if.then267, label %if.end277, !dbg !1025

if.then267:                                       ; preds = %land.lhs.true259
  %idxprom268 = sext i32 %k.0 to i64, !dbg !1026
  %arrayidx269 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 %idxprom268, !dbg !1026
  %60 = load i32, i32* %arrayidx269, align 4, !dbg !1026
  %idxprom270 = sext i32 %60 to i64, !dbg !1028
  %arrayidx271 = getelementptr inbounds i16, i16* %7, i64 %idxprom270, !dbg !1028
  store i16 255, i16* %arrayidx271, align 2, !dbg !1029
  %idxprom272 = sext i32 %k.0 to i64, !dbg !1030
  %arrayidx273 = getelementptr inbounds [8 x i32], [8 x i32]* %nbs, i64 0, i64 %idxprom272, !dbg !1030
  %61 = load i32, i32* %arrayidx273, align 4, !dbg !1030
  %idxprom274 = sext i32 %nedges.1 to i64, !dbg !1031
  %arrayidx275 = getelementptr inbounds i32, i32* %46, i64 %idxprom274, !dbg !1031
  store i32 %61, i32* %arrayidx275, align 4, !dbg !1032
  %inc276 = add nsw i32 %nedges.1, 1, !dbg !1033
  call void @llvm.dbg.value(metadata i32 %inc276, metadata !966, metadata !DIExpression()), !dbg !967
  br label %if.end277, !dbg !1034

if.end277:                                        ; preds = %if.then267, %land.lhs.true259, %for.body251
  %nedges.2 = phi i32 [ %inc276, %if.then267 ], [ %nedges.1, %land.lhs.true259 ], [ %nedges.1, %for.body251 ], !dbg !976
  call void @llvm.dbg.value(metadata i32 %nedges.2, metadata !966, metadata !DIExpression()), !dbg !967
  br label %for.inc278, !dbg !1035

for.inc278:                                       ; preds = %if.end277
  %inc279 = add nsw i32 %k.0, 1, !dbg !1036
  call void @llvm.dbg.value(metadata i32 %inc279, metadata !1010, metadata !DIExpression()), !dbg !1012
  br label %for.cond248, !dbg !1037, !llvm.loop !1038

for.end280:                                       ; preds = %for.cond248
  br label %do.cond, !dbg !1040

do.cond:                                          ; preds = %for.end280
  %cmp281 = icmp sgt i32 %nedges.1, 0, !dbg !1041
  br i1 %cmp281, label %do.body, label %do.end, !dbg !1040, !llvm.loop !1042

do.end:                                           ; preds = %do.cond
  br label %if.end283, !dbg !1044

if.end283:                                        ; preds = %do.end, %land.lhs.true217, %for.body212
  %inc284 = add i64 %c200.1, 1, !dbg !1045
  call void @llvm.dbg.value(metadata i64 %inc284, metadata !937, metadata !DIExpression()), !dbg !719
  br label %for.inc285, !dbg !1046

for.inc285:                                       ; preds = %if.end283
  %inc286 = add nsw i32 %i207.0, 1, !dbg !1047
  call void @llvm.dbg.value(metadata i32 %inc286, metadata !947, metadata !DIExpression()), !dbg !949
  br label %for.cond208, !dbg !1048, !llvm.loop !1049

for.end287:                                       ; preds = %for.cond208
  br label %for.inc288, !dbg !1050

for.inc288:                                       ; preds = %for.end287
  %inc289 = add nsw i32 %j201.0, 1, !dbg !1051
  call void @llvm.dbg.value(metadata i32 %inc289, metadata !938, metadata !DIExpression()), !dbg !940
  br label %for.cond202, !dbg !1052, !llvm.loop !1053

for.end290:                                       ; preds = %for.cond202
  %62 = bitcast i16* %3 to i8*, !dbg !1055
  call void @free(i8* %62) #6, !dbg !1056
  %63 = bitcast i16* %4 to i8*, !dbg !1057
  call void @free(i8* %63) #6, !dbg !1058
  %64 = bitcast i16* %2 to i8*, !dbg !1059
  call void @free(i8* %64) #6, !dbg !1060
  %65 = bitcast i16* %5 to i8*, !dbg !1061
  call void @free(i8* %65) #6, !dbg !1062
  ret i16* %7, !dbg !1063
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
  call void @llvm.dbg.value(metadata i32 %argc, metadata !1064, metadata !DIExpression()), !dbg !1065
  call void @llvm.dbg.value(metadata i8** %argv, metadata !1066, metadata !DIExpression()), !dbg !1065
  %cmp = icmp slt i32 %argc, 2, !dbg !1067
  br i1 %cmp, label %if.then, label %if.end, !dbg !1069

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 0, !dbg !1070
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !1070
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.10, i64 0, i64 0), i8* %0), !dbg !1072
  br label %return, !dbg !1073

if.end:                                           ; preds = %entry
  %arrayidx1 = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !1074
  %1 = load i8*, i8** %arrayidx1, align 8, !dbg !1074
  %call2 = call i16* @load_bmp(i8* %1, %struct.bitmap_info_header_t* @main.ih), !dbg !1075
  call void @llvm.dbg.value(metadata i16* %call2, metadata !1076, metadata !DIExpression()), !dbg !1065
  %cmp3 = icmp eq i16* %call2, null, !dbg !1077
  br i1 %cmp3, label %if.then4, label %if.end6, !dbg !1079

if.then4:                                         ; preds = %if.end
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1080
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.11, i64 0, i64 0)), !dbg !1082
  br label %return, !dbg !1083

if.end6:                                          ; preds = %if.end
  %3 = load i32, i32* getelementptr inbounds (%struct.bitmap_info_header_t, %struct.bitmap_info_header_t* @main.ih, i32 0, i32 1), align 4, !dbg !1084
  %4 = load i32, i32* getelementptr inbounds (%struct.bitmap_info_header_t, %struct.bitmap_info_header_t* @main.ih, i32 0, i32 2), align 4, !dbg !1085
  %5 = load i16, i16* getelementptr inbounds (%struct.bitmap_info_header_t, %struct.bitmap_info_header_t* @main.ih, i32 0, i32 4), align 2, !dbg !1086
  %conv = zext i16 %5 to i32, !dbg !1087
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.12, i64 0, i64 0), i32 %3, i32 %4, i32 %conv), !dbg !1088
  %call8 = call i16* @canny_edge_detection(i16* %call2, %struct.bitmap_info_header_t* @main.ih, i32 45, i32 50, float 1.000000e+00), !dbg !1089
  call void @llvm.dbg.value(metadata i16* %call8, metadata !1090, metadata !DIExpression()), !dbg !1065
  %cmp9 = icmp eq i16* %call8, null, !dbg !1091
  br i1 %cmp9, label %if.then11, label %if.end13, !dbg !1093

if.then11:                                        ; preds = %if.end6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1094
  %call12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.13, i64 0, i64 0)), !dbg !1096
  br label %return, !dbg !1097

if.end13:                                         ; preds = %if.end6
  %call14 = call zeroext i1 @save_bmp(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.14, i64 0, i64 0), %struct.bitmap_info_header_t* @main.ih, i16* %call8), !dbg !1098
  br i1 %call14, label %if.then15, label %if.end17, !dbg !1100

if.then15:                                        ; preds = %if.end13
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1101
  %call16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15, i64 0, i64 0)), !dbg !1103
  br label %return, !dbg !1104

if.end17:                                         ; preds = %if.end13
  %8 = bitcast i16* %call2 to i8*, !dbg !1105
  call void @free(i8* %8) #6, !dbg !1106
  %9 = bitcast i16* %call8 to i8*, !dbg !1107
  call void @free(i8* %9) #6, !dbg !1108
  br label %return, !dbg !1109

return:                                           ; preds = %if.end17, %if.then15, %if.then11, %if.then4, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 1, %if.then4 ], [ 1, %if.then11 ], [ 1, %if.then15 ], [ 0, %if.end17 ], !dbg !1065
  ret i32 %retval.0, !dbg !1110
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!61 = !DILocation(line: 0, scope: !56)
!62 = !DILocalVariable(name: "bitmapInfoHeader", arg: 2, scope: !56, file: !3, line: 66, type: !59)
!63 = !DILocation(line: 68, column: 21, scope: !56)
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
!123 = !DILocation(line: 69, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !56, file: !3, line: 69, column: 9)
!125 = !DILocation(line: 69, column: 9, scope: !56)
!126 = !DILocation(line: 70, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !3, line: 69, column: 26)
!128 = !DILocation(line: 71, column: 9, scope: !127)
!129 = !DILocalVariable(name: "mag", scope: !56, file: !3, line: 74, type: !130)
!130 = !DIDerivedType(tag: DW_TAG_typedef, name: "bmpfile_magic_t", file: !3, line: 31, baseType: !131)
!131 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 29, size: 16, elements: !132)
!132 = !{!133}
!133 = !DIDerivedType(tag: DW_TAG_member, name: "magic", scope: !131, file: !3, line: 30, baseType: !134, size: 16)
!134 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 16, elements: !135)
!135 = !{!136}
!136 = !DISubrange(count: 2)
!137 = !DILocation(line: 74, column: 21, scope: !56)
!138 = !DILocation(line: 75, column: 15, scope: !139)
!139 = distinct !DILexicalBlock(scope: !56, file: !3, line: 75, column: 9)
!140 = !DILocation(line: 75, column: 9, scope: !139)
!141 = !DILocation(line: 75, column: 58, scope: !139)
!142 = !DILocation(line: 75, column: 9, scope: !56)
!143 = !DILocation(line: 76, column: 9, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !3, line: 75, column: 64)
!145 = !DILocation(line: 77, column: 9, scope: !144)
!146 = !DILocation(line: 83, column: 26, scope: !147)
!147 = distinct !DILexicalBlock(scope: !56, file: !3, line: 83, column: 9)
!148 = !DILocation(line: 83, column: 9, scope: !147)
!149 = !DILocation(line: 83, column: 33, scope: !147)
!150 = !DILocation(line: 83, column: 9, scope: !56)
!151 = !DILocation(line: 84, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !147, file: !3, line: 83, column: 44)
!153 = !DILocation(line: 85, column: 21, scope: !152)
!154 = !DILocation(line: 85, column: 17, scope: !152)
!155 = !DILocation(line: 85, column: 35, scope: !152)
!156 = !DILocation(line: 85, column: 31, scope: !152)
!157 = !DILocation(line: 84, column: 9, scope: !152)
!158 = !DILocation(line: 86, column: 9, scope: !152)
!159 = !DILocation(line: 87, column: 9, scope: !152)
!160 = !DILocalVariable(name: "bitmapFileHeader", scope: !56, file: !3, line: 90, type: !161)
!161 = !DIDerivedType(tag: DW_TAG_typedef, name: "bmpfile_header_t", file: !3, line: 38, baseType: !162)
!162 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 33, size: 96, elements: !163)
!163 = !{!164, !165, !166, !167}
!164 = !DIDerivedType(tag: DW_TAG_member, name: "filesz", scope: !162, file: !3, line: 34, baseType: !36, size: 32)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "creator1", scope: !162, file: !3, line: 35, baseType: !18, size: 16, offset: 32)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "creator2", scope: !162, file: !3, line: 36, baseType: !18, size: 16, offset: 48)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "bmp_offset", scope: !162, file: !3, line: 37, baseType: !36, size: 32, offset: 64)
!168 = !DILocation(line: 90, column: 22, scope: !56)
!169 = !DILocation(line: 92, column: 15, scope: !170)
!170 = distinct !DILexicalBlock(scope: !56, file: !3, line: 92, column: 9)
!171 = !DILocation(line: 92, column: 9, scope: !170)
!172 = !DILocation(line: 93, column: 27, scope: !170)
!173 = !DILocation(line: 92, column: 9, scope: !56)
!174 = !DILocation(line: 94, column: 9, scope: !175)
!175 = distinct !DILexicalBlock(scope: !170, file: !3, line: 93, column: 33)
!176 = !DILocation(line: 95, column: 9, scope: !175)
!177 = !DILocation(line: 99, column: 15, scope: !178)
!178 = distinct !DILexicalBlock(scope: !56, file: !3, line: 99, column: 9)
!179 = !DILocation(line: 99, column: 9, scope: !178)
!180 = !DILocation(line: 100, column: 27, scope: !178)
!181 = !DILocation(line: 99, column: 9, scope: !56)
!182 = !DILocation(line: 101, column: 9, scope: !183)
!183 = distinct !DILexicalBlock(scope: !178, file: !3, line: 100, column: 33)
!184 = !DILocation(line: 102, column: 9, scope: !183)
!185 = !DILocation(line: 105, column: 27, scope: !186)
!186 = distinct !DILexicalBlock(scope: !56, file: !3, line: 105, column: 9)
!187 = !DILocation(line: 105, column: 41, scope: !186)
!188 = !DILocation(line: 105, column: 9, scope: !56)
!189 = !DILocation(line: 106, column: 17, scope: !186)
!190 = !DILocation(line: 106, column: 9, scope: !186)
!191 = !DILocation(line: 109, column: 41, scope: !192)
!192 = distinct !DILexicalBlock(scope: !56, file: !3, line: 109, column: 9)
!193 = !DILocation(line: 109, column: 24, scope: !192)
!194 = !DILocation(line: 109, column: 9, scope: !192)
!195 = !DILocation(line: 109, column: 9, scope: !56)
!196 = !DILocation(line: 110, column: 9, scope: !197)
!197 = distinct !DILexicalBlock(scope: !192, file: !3, line: 109, column: 64)
!198 = !DILocation(line: 111, column: 9, scope: !197)
!199 = !DILocation(line: 115, column: 53, scope: !56)
!200 = !DILocation(line: 115, column: 35, scope: !56)
!201 = !DILocation(line: 115, column: 64, scope: !56)
!202 = !DILocation(line: 115, column: 28, scope: !56)
!203 = !DILocalVariable(name: "bitmapImage", scope: !56, file: !3, line: 115, type: !30)
!204 = !DILocation(line: 119, column: 21, scope: !205)
!205 = distinct !DILexicalBlock(scope: !56, file: !3, line: 119, column: 9)
!206 = !DILocation(line: 119, column: 9, scope: !56)
!207 = !DILocation(line: 120, column: 9, scope: !208)
!208 = distinct !DILexicalBlock(scope: !205, file: !3, line: 119, column: 30)
!209 = !DILocation(line: 121, column: 9, scope: !208)
!210 = !DILocalVariable(name: "count", scope: !56, file: !3, line: 125, type: !115)
!211 = !DILocalVariable(name: "c", scope: !56, file: !3, line: 126, type: !27)
!212 = !DILocation(line: 126, column: 19, scope: !56)
!213 = !DILocation(line: 127, column: 36, scope: !56)
!214 = !DILocation(line: 127, column: 18, scope: !56)
!215 = !DILocation(line: 127, column: 61, scope: !56)
!216 = !DILocation(line: 127, column: 42, scope: !56)
!217 = !DILocation(line: 127, column: 66, scope: !56)
!218 = !DILocation(line: 127, column: 13, scope: !56)
!219 = !DILocation(line: 127, column: 12, scope: !56)
!220 = !DILocation(line: 127, column: 92, scope: !56)
!221 = !DILocation(line: 127, column: 74, scope: !56)
!222 = !DILocation(line: 127, column: 72, scope: !56)
!223 = !DILocation(line: 127, column: 11, scope: !56)
!224 = !DILocalVariable(name: "pad", scope: !56, file: !3, line: 125, type: !115)
!225 = !DILocalVariable(name: "i", scope: !226, file: !3, line: 128, type: !115)
!226 = distinct !DILexicalBlock(scope: !56, file: !3, line: 128, column: 5)
!227 = !DILocation(line: 0, scope: !226)
!228 = !DILocation(line: 128, column: 9, scope: !226)
!229 = !DILocation(line: 125, column: 17, scope: !56)
!230 = !DILocation(line: 128, column: 41, scope: !231)
!231 = distinct !DILexicalBlock(scope: !226, file: !3, line: 128, column: 5)
!232 = !DILocation(line: 128, column: 23, scope: !231)
!233 = !DILocation(line: 128, column: 22, scope: !231)
!234 = !DILocation(line: 128, column: 5, scope: !226)
!235 = !DILocalVariable(name: "j", scope: !236, file: !3, line: 129, type: !115)
!236 = distinct !DILexicalBlock(scope: !237, file: !3, line: 129, column: 6)
!237 = distinct !DILexicalBlock(scope: !231, file: !3, line: 128, column: 53)
!238 = !DILocation(line: 0, scope: !236)
!239 = !DILocation(line: 129, column: 10, scope: !236)
!240 = !DILocation(line: 129, column: 42, scope: !241)
!241 = distinct !DILexicalBlock(scope: !236, file: !3, line: 129, column: 6)
!242 = !DILocation(line: 129, column: 24, scope: !241)
!243 = !DILocation(line: 129, column: 23, scope: !241)
!244 = !DILocation(line: 129, column: 6, scope: !236)
!245 = !DILocation(line: 130, column: 11, scope: !246)
!246 = distinct !DILexicalBlock(scope: !247, file: !3, line: 130, column: 11)
!247 = distinct !DILexicalBlock(scope: !241, file: !3, line: 129, column: 53)
!248 = !DILocation(line: 130, column: 56, scope: !246)
!249 = !DILocation(line: 130, column: 11, scope: !247)
!250 = !DILocation(line: 131, column: 8, scope: !251)
!251 = distinct !DILexicalBlock(scope: !246, file: !3, line: 130, column: 62)
!252 = !DILocation(line: 132, column: 8, scope: !251)
!253 = !DILocation(line: 134, column: 40, scope: !247)
!254 = !DILocation(line: 134, column: 30, scope: !247)
!255 = !DILocation(line: 134, column: 24, scope: !247)
!256 = !DILocation(line: 134, column: 7, scope: !247)
!257 = !DILocation(line: 134, column: 28, scope: !247)
!258 = !DILocation(line: 135, column: 6, scope: !247)
!259 = !DILocation(line: 129, column: 50, scope: !241)
!260 = !DILocation(line: 129, column: 6, scope: !241)
!261 = distinct !{!261, !244, !262}
!262 = !DILocation(line: 135, column: 6, scope: !236)
!263 = !DILocation(line: 136, column: 6, scope: !237)
!264 = !DILocation(line: 137, column: 5, scope: !237)
!265 = !DILocation(line: 128, column: 50, scope: !231)
!266 = !DILocation(line: 128, column: 5, scope: !231)
!267 = distinct !{!267, !234, !268}
!268 = !DILocation(line: 137, column: 5, scope: !226)
!269 = !DILocation(line: 143, column: 5, scope: !56)
!270 = !DILocation(line: 144, column: 5, scope: !56)
!271 = !DILocation(line: 145, column: 1, scope: !56)
!272 = distinct !DISubprogram(name: "save_bmp", scope: !3, file: !3, line: 148, type: !273, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !13, retainedNodes: !14)
!273 = !DISubroutineType(types: !274)
!274 = !{!275, !10, !276, !278}
!275 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!276 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !277, size: 64)
!277 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !32)
!278 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !279, size: 64)
!279 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!280 = !DILocalVariable(name: "filename", arg: 1, scope: !272, file: !3, line: 148, type: !10)
!281 = !DILocation(line: 0, scope: !272)
!282 = !DILocalVariable(name: "bmp_ih", arg: 2, scope: !272, file: !3, line: 148, type: !276)
!283 = !DILocalVariable(name: "data", arg: 3, scope: !272, file: !3, line: 149, type: !278)
!284 = !DILocation(line: 151, column: 21, scope: !272)
!285 = !DILocalVariable(name: "filePtr", scope: !272, file: !3, line: 151, type: !65)
!286 = !DILocation(line: 152, column: 17, scope: !287)
!287 = distinct !DILexicalBlock(scope: !272, file: !3, line: 152, column: 9)
!288 = !DILocation(line: 152, column: 9, scope: !272)
!289 = !DILocation(line: 153, column: 9, scope: !287)
!290 = !DILocalVariable(name: "mag", scope: !272, file: !3, line: 155, type: !130)
!291 = !DILocation(line: 155, column: 21, scope: !272)
!292 = !DILocation(line: 156, column: 16, scope: !293)
!293 = distinct !DILexicalBlock(scope: !272, file: !3, line: 156, column: 9)
!294 = !DILocation(line: 156, column: 9, scope: !293)
!295 = !DILocation(line: 156, column: 59, scope: !293)
!296 = !DILocation(line: 156, column: 9, scope: !272)
!297 = !DILocation(line: 157, column: 9, scope: !298)
!298 = distinct !DILexicalBlock(scope: !293, file: !3, line: 156, column: 65)
!299 = !DILocation(line: 158, column: 9, scope: !298)
!300 = !DILocation(line: 164, column: 45, scope: !272)
!301 = !DILocation(line: 164, column: 37, scope: !272)
!302 = !DILocation(line: 164, column: 34, scope: !272)
!303 = !DILocation(line: 164, column: 53, scope: !272)
!304 = !DILocation(line: 164, column: 29, scope: !272)
!305 = !DILocation(line: 163, column: 58, scope: !272)
!306 = !DILocation(line: 161, column: 29, scope: !272)
!307 = !DILocalVariable(name: "offset", scope: !272, file: !3, line: 161, type: !308)
!308 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !36)
!309 = !DILocalVariable(name: "bmp_fh", scope: !272, file: !3, line: 166, type: !310)
!310 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !161)
!311 = !DILocation(line: 166, column: 28, scope: !272)
!312 = !DILocation(line: 166, column: 37, scope: !272)
!313 = !DILocation(line: 167, column: 36, scope: !272)
!314 = !DILocation(line: 167, column: 26, scope: !272)
!315 = !DILocation(line: 173, column: 16, scope: !316)
!316 = distinct !DILexicalBlock(scope: !272, file: !3, line: 173, column: 9)
!317 = !DILocation(line: 173, column: 9, scope: !316)
!318 = !DILocation(line: 173, column: 63, scope: !316)
!319 = !DILocation(line: 173, column: 9, scope: !272)
!320 = !DILocation(line: 174, column: 9, scope: !321)
!321 = distinct !DILexicalBlock(scope: !316, file: !3, line: 173, column: 69)
!322 = !DILocation(line: 175, column: 9, scope: !321)
!323 = !DILocation(line: 177, column: 16, scope: !324)
!324 = distinct !DILexicalBlock(scope: !272, file: !3, line: 177, column: 9)
!325 = !DILocation(line: 177, column: 9, scope: !324)
!326 = !DILocation(line: 177, column: 66, scope: !324)
!327 = !DILocation(line: 177, column: 9, scope: !272)
!328 = !DILocation(line: 178, column: 9, scope: !329)
!329 = distinct !DILexicalBlock(scope: !324, file: !3, line: 177, column: 72)
!330 = !DILocation(line: 179, column: 9, scope: !329)
!331 = !DILocalVariable(name: "i", scope: !332, file: !3, line: 183, type: !115)
!332 = distinct !DILexicalBlock(scope: !272, file: !3, line: 183, column: 5)
!333 = !DILocation(line: 0, scope: !332)
!334 = !DILocation(line: 183, column: 10, scope: !332)
!335 = !DILocation(line: 183, column: 43, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !3, line: 183, column: 5)
!337 = !DILocation(line: 183, column: 35, scope: !336)
!338 = !DILocation(line: 183, column: 32, scope: !336)
!339 = !DILocation(line: 183, column: 28, scope: !336)
!340 = !DILocation(line: 183, column: 26, scope: !336)
!341 = !DILocation(line: 183, column: 5, scope: !332)
!342 = !DILocalVariable(name: "color", scope: !343, file: !3, line: 184, type: !344)
!343 = distinct !DILexicalBlock(scope: !336, file: !3, line: 183, column: 57)
!344 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !345)
!345 = !DIDerivedType(tag: DW_TAG_typedef, name: "rgb_t", file: !3, line: 59, baseType: !346)
!346 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 54, size: 32, elements: !347)
!347 = !{!348, !349, !350, !351}
!348 = !DIDerivedType(tag: DW_TAG_member, name: "r", scope: !346, file: !3, line: 55, baseType: !25, size: 8)
!349 = !DIDerivedType(tag: DW_TAG_member, name: "g", scope: !346, file: !3, line: 56, baseType: !25, size: 8, offset: 8)
!350 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !346, file: !3, line: 57, baseType: !25, size: 8, offset: 16)
!351 = !DIDerivedType(tag: DW_TAG_member, name: "nothing", scope: !346, file: !3, line: 58, baseType: !25, size: 8, offset: 24)
!352 = !DILocation(line: 184, column: 21, scope: !343)
!353 = !DILocation(line: 184, column: 29, scope: !343)
!354 = !DILocation(line: 184, column: 30, scope: !343)
!355 = !DILocation(line: 184, column: 42, scope: !343)
!356 = !DILocation(line: 184, column: 54, scope: !343)
!357 = !DILocation(line: 185, column: 20, scope: !358)
!358 = distinct !DILexicalBlock(scope: !343, file: !3, line: 185, column: 13)
!359 = !DILocation(line: 185, column: 13, scope: !358)
!360 = !DILocation(line: 185, column: 55, scope: !358)
!361 = !DILocation(line: 185, column: 13, scope: !343)
!362 = !DILocation(line: 186, column: 13, scope: !363)
!363 = distinct !DILexicalBlock(scope: !358, file: !3, line: 185, column: 61)
!364 = !DILocation(line: 187, column: 13, scope: !363)
!365 = !DILocation(line: 189, column: 5, scope: !343)
!366 = !DILocation(line: 183, column: 53, scope: !336)
!367 = !DILocation(line: 183, column: 5, scope: !336)
!368 = distinct !{!368, !341, !369}
!369 = !DILocation(line: 189, column: 5, scope: !332)
!370 = !DILocation(line: 196, column: 33, scope: !272)
!371 = !DILocation(line: 196, column: 25, scope: !272)
!372 = !DILocation(line: 196, column: 48, scope: !272)
!373 = !DILocation(line: 196, column: 39, scope: !272)
!374 = !DILocation(line: 196, column: 53, scope: !272)
!375 = !DILocation(line: 196, column: 20, scope: !272)
!376 = !DILocation(line: 196, column: 19, scope: !272)
!377 = !DILocation(line: 196, column: 69, scope: !272)
!378 = !DILocation(line: 196, column: 61, scope: !272)
!379 = !DILocation(line: 196, column: 59, scope: !272)
!380 = !DILocation(line: 196, column: 18, scope: !272)
!381 = !DILocalVariable(name: "pad", scope: !272, file: !3, line: 196, type: !115)
!382 = !DILocalVariable(name: "c", scope: !272, file: !3, line: 197, type: !27)
!383 = !DILocation(line: 197, column: 19, scope: !272)
!384 = !DILocalVariable(name: "i", scope: !385, file: !3, line: 198, type: !115)
!385 = distinct !DILexicalBlock(scope: !272, file: !3, line: 198, column: 5)
!386 = !DILocation(line: 0, scope: !385)
!387 = !DILocation(line: 198, column: 9, scope: !385)
!388 = !DILocation(line: 198, column: 33, scope: !389)
!389 = distinct !DILexicalBlock(scope: !385, file: !3, line: 198, column: 5)
!390 = !DILocation(line: 198, column: 25, scope: !389)
!391 = !DILocation(line: 198, column: 23, scope: !389)
!392 = !DILocation(line: 198, column: 5, scope: !385)
!393 = !DILocalVariable(name: "j", scope: !394, file: !3, line: 199, type: !115)
!394 = distinct !DILexicalBlock(scope: !395, file: !3, line: 199, column: 6)
!395 = distinct !DILexicalBlock(scope: !389, file: !3, line: 198, column: 46)
!396 = !DILocation(line: 0, scope: !394)
!397 = !DILocation(line: 199, column: 10, scope: !394)
!398 = !DILocation(line: 199, column: 34, scope: !399)
!399 = distinct !DILexicalBlock(scope: !394, file: !3, line: 199, column: 6)
!400 = !DILocation(line: 199, column: 26, scope: !399)
!401 = !DILocation(line: 199, column: 24, scope: !399)
!402 = !DILocation(line: 199, column: 6, scope: !394)
!403 = !DILocation(line: 200, column: 44, scope: !404)
!404 = distinct !DILexicalBlock(scope: !399, file: !3, line: 199, column: 46)
!405 = !DILocation(line: 200, column: 36, scope: !404)
!406 = !DILocation(line: 200, column: 49, scope: !404)
!407 = !DILocation(line: 200, column: 34, scope: !404)
!408 = !DILocation(line: 200, column: 27, scope: !404)
!409 = !DILocation(line: 200, column: 11, scope: !404)
!410 = !DILocation(line: 200, column: 9, scope: !404)
!411 = !DILocation(line: 201, column: 11, scope: !412)
!412 = distinct !DILexicalBlock(scope: !404, file: !3, line: 201, column: 11)
!413 = !DILocation(line: 201, column: 48, scope: !412)
!414 = !DILocation(line: 201, column: 11, scope: !404)
!415 = !DILocation(line: 202, column: 8, scope: !416)
!416 = distinct !DILexicalBlock(scope: !412, file: !3, line: 201, column: 54)
!417 = !DILocation(line: 203, column: 8, scope: !416)
!418 = !DILocation(line: 205, column: 6, scope: !404)
!419 = !DILocation(line: 199, column: 42, scope: !399)
!420 = !DILocation(line: 199, column: 6, scope: !399)
!421 = distinct !{!421, !402, !422}
!422 = !DILocation(line: 205, column: 6, scope: !394)
!423 = !DILocation(line: 206, column: 8, scope: !395)
!424 = !DILocalVariable(name: "j", scope: !425, file: !3, line: 207, type: !115)
!425 = distinct !DILexicalBlock(scope: !395, file: !3, line: 207, column: 6)
!426 = !DILocation(line: 0, scope: !425)
!427 = !DILocation(line: 207, column: 10, scope: !425)
!428 = !DILocation(line: 207, column: 23, scope: !429)
!429 = distinct !DILexicalBlock(scope: !425, file: !3, line: 207, column: 6)
!430 = !DILocation(line: 207, column: 6, scope: !425)
!431 = !DILocation(line: 208, column: 11, scope: !432)
!432 = distinct !DILexicalBlock(scope: !429, file: !3, line: 208, column: 11)
!433 = !DILocation(line: 208, column: 48, scope: !432)
!434 = !DILocation(line: 208, column: 11, scope: !429)
!435 = !DILocation(line: 209, column: 8, scope: !436)
!436 = distinct !DILexicalBlock(scope: !432, file: !3, line: 208, column: 54)
!437 = !DILocation(line: 210, column: 8, scope: !436)
!438 = !DILocation(line: 208, column: 51, scope: !432)
!439 = !DILocation(line: 207, column: 30, scope: !429)
!440 = !DILocation(line: 207, column: 6, scope: !429)
!441 = distinct !{!441, !430, !442}
!442 = !DILocation(line: 211, column: 7, scope: !425)
!443 = !DILocation(line: 212, column: 5, scope: !395)
!444 = !DILocation(line: 198, column: 42, scope: !389)
!445 = !DILocation(line: 198, column: 5, scope: !389)
!446 = distinct !{!446, !392, !447}
!447 = !DILocation(line: 212, column: 5, scope: !385)
!448 = !DILocation(line: 214, column: 5, scope: !272)
!449 = !DILocation(line: 215, column: 5, scope: !272)
!450 = !DILocation(line: 216, column: 1, scope: !272)
!451 = distinct !DISubprogram(name: "convolution", scope: !3, file: !3, line: 219, type: !452, scopeLine: 222, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !13, retainedNodes: !14)
!452 = !DISubroutineType(types: !453)
!453 = !{null, !278, !30, !454, !7, !7, !7, !456}
!454 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !455, size: 64)
!455 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !28)
!456 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !275)
!457 = !DILocalVariable(name: "in", arg: 1, scope: !451, file: !3, line: 219, type: !278)
!458 = !DILocation(line: 0, scope: !451)
!459 = !DILocalVariable(name: "out", arg: 2, scope: !451, file: !3, line: 219, type: !30)
!460 = !DILocalVariable(name: "kernel", arg: 3, scope: !451, file: !3, line: 219, type: !454)
!461 = !DILocalVariable(name: "nx", arg: 4, scope: !451, file: !3, line: 220, type: !7)
!462 = !DILocalVariable(name: "ny", arg: 5, scope: !451, file: !3, line: 220, type: !7)
!463 = !DILocalVariable(name: "kn", arg: 6, scope: !451, file: !3, line: 220, type: !7)
!464 = !DILocalVariable(name: "normalize", arg: 7, scope: !451, file: !3, line: 221, type: !456)
!465 = !DILocation(line: 223, column: 5, scope: !466)
!466 = distinct !DILexicalBlock(scope: !467, file: !3, line: 223, column: 5)
!467 = distinct !DILexicalBlock(scope: !451, file: !3, line: 223, column: 5)
!468 = !DILocation(line: 223, column: 5, scope: !467)
!469 = !DILocation(line: 224, column: 5, scope: !470)
!470 = distinct !DILexicalBlock(scope: !471, file: !3, line: 224, column: 5)
!471 = distinct !DILexicalBlock(scope: !451, file: !3, line: 224, column: 5)
!472 = !DILocation(line: 224, column: 5, scope: !471)
!473 = !DILocation(line: 225, column: 26, scope: !451)
!474 = !DILocalVariable(name: "khalf", scope: !451, file: !3, line: 225, type: !7)
!475 = !DILocalVariable(name: "min", scope: !451, file: !3, line: 226, type: !28)
!476 = !DILocalVariable(name: "max", scope: !451, file: !3, line: 226, type: !28)
!477 = !DILocation(line: 228, column: 9, scope: !478)
!478 = distinct !DILexicalBlock(scope: !451, file: !3, line: 228, column: 9)
!479 = !DILocation(line: 228, column: 9, scope: !451)
!480 = !DILocalVariable(name: "m", scope: !481, file: !3, line: 229, type: !6)
!481 = distinct !DILexicalBlock(scope: !478, file: !3, line: 229, column: 9)
!482 = !DILocation(line: 0, scope: !481)
!483 = !DILocation(line: 229, column: 14, scope: !481)
!484 = !DILocation(line: 226, column: 26, scope: !451)
!485 = !DILocation(line: 226, column: 11, scope: !451)
!486 = !DILocation(line: 229, column: 36, scope: !487)
!487 = distinct !DILexicalBlock(scope: !481, file: !3, line: 229, column: 9)
!488 = !DILocation(line: 229, column: 31, scope: !487)
!489 = !DILocation(line: 229, column: 9, scope: !481)
!490 = !DILocalVariable(name: "n", scope: !491, file: !3, line: 230, type: !6)
!491 = distinct !DILexicalBlock(scope: !487, file: !3, line: 230, column: 13)
!492 = !DILocation(line: 0, scope: !491)
!493 = !DILocation(line: 230, column: 18, scope: !491)
!494 = !DILocation(line: 230, column: 40, scope: !495)
!495 = distinct !DILexicalBlock(scope: !491, file: !3, line: 230, column: 13)
!496 = !DILocation(line: 230, column: 35, scope: !495)
!497 = !DILocation(line: 230, column: 13, scope: !491)
!498 = !DILocalVariable(name: "pixel", scope: !499, file: !3, line: 231, type: !28)
!499 = distinct !DILexicalBlock(scope: !495, file: !3, line: 230, column: 54)
!500 = !DILocation(line: 0, scope: !499)
!501 = !DILocalVariable(name: "c", scope: !499, file: !3, line: 232, type: !115)
!502 = !DILocation(line: 233, column: 30, scope: !503)
!503 = distinct !DILexicalBlock(scope: !499, file: !3, line: 233, column: 17)
!504 = !DILocalVariable(name: "j", scope: !503, file: !3, line: 233, type: !6)
!505 = !DILocation(line: 0, scope: !503)
!506 = !DILocation(line: 233, column: 22, scope: !503)
!507 = !DILocation(line: 232, column: 24, scope: !499)
!508 = !DILocation(line: 231, column: 23, scope: !499)
!509 = !DILocation(line: 233, column: 40, scope: !510)
!510 = distinct !DILexicalBlock(scope: !503, file: !3, line: 233, column: 17)
!511 = !DILocation(line: 233, column: 17, scope: !503)
!512 = !DILocation(line: 234, column: 34, scope: !513)
!513 = distinct !DILexicalBlock(scope: !510, file: !3, line: 234, column: 21)
!514 = !DILocalVariable(name: "i", scope: !513, file: !3, line: 234, type: !6)
!515 = !DILocation(line: 0, scope: !513)
!516 = !DILocation(line: 234, column: 26, scope: !513)
!517 = !DILocation(line: 234, column: 44, scope: !518)
!518 = distinct !DILexicalBlock(scope: !513, file: !3, line: 234, column: 21)
!519 = !DILocation(line: 234, column: 21, scope: !513)
!520 = !DILocation(line: 235, column: 40, scope: !521)
!521 = distinct !DILexicalBlock(scope: !518, file: !3, line: 234, column: 59)
!522 = !DILocation(line: 235, column: 45, scope: !521)
!523 = !DILocation(line: 235, column: 50, scope: !521)
!524 = !DILocation(line: 235, column: 54, scope: !521)
!525 = !DILocation(line: 235, column: 34, scope: !521)
!526 = !DILocation(line: 235, column: 61, scope: !521)
!527 = !DILocation(line: 235, column: 59, scope: !521)
!528 = !DILocation(line: 235, column: 31, scope: !521)
!529 = !DILocation(line: 236, column: 26, scope: !521)
!530 = !DILocation(line: 237, column: 21, scope: !521)
!531 = !DILocation(line: 234, column: 55, scope: !518)
!532 = !DILocation(line: 234, column: 21, scope: !518)
!533 = distinct !{!533, !519, !534}
!534 = !DILocation(line: 237, column: 21, scope: !513)
!535 = !DILocation(line: 233, column: 51, scope: !510)
!536 = !DILocation(line: 233, column: 17, scope: !510)
!537 = distinct !{!537, !511, !538}
!538 = !DILocation(line: 237, column: 21, scope: !503)
!539 = !DILocation(line: 238, column: 27, scope: !540)
!540 = distinct !DILexicalBlock(scope: !499, file: !3, line: 238, column: 21)
!541 = !DILocation(line: 238, column: 21, scope: !499)
!542 = !DILocation(line: 239, column: 21, scope: !540)
!543 = !DILocation(line: 240, column: 27, scope: !544)
!544 = distinct !DILexicalBlock(scope: !499, file: !3, line: 240, column: 21)
!545 = !DILocation(line: 240, column: 21, scope: !499)
!546 = !DILocation(line: 241, column: 21, scope: !544)
!547 = !DILocation(line: 242, column: 17, scope: !499)
!548 = !DILocation(line: 230, column: 50, scope: !495)
!549 = !DILocation(line: 230, column: 13, scope: !495)
!550 = distinct !{!550, !497, !551}
!551 = !DILocation(line: 242, column: 17, scope: !491)
!552 = !DILocation(line: 229, column: 46, scope: !487)
!553 = !DILocation(line: 229, column: 9, scope: !487)
!554 = distinct !{!554, !489, !555}
!555 = !DILocation(line: 242, column: 17, scope: !481)
!556 = !DILocalVariable(name: "m", scope: !557, file: !3, line: 244, type: !6)
!557 = distinct !DILexicalBlock(scope: !451, file: !3, line: 244, column: 5)
!558 = !DILocation(line: 0, scope: !557)
!559 = !DILocation(line: 244, column: 10, scope: !557)
!560 = !DILocation(line: 244, column: 32, scope: !561)
!561 = distinct !DILexicalBlock(scope: !557, file: !3, line: 244, column: 5)
!562 = !DILocation(line: 244, column: 27, scope: !561)
!563 = !DILocation(line: 244, column: 5, scope: !557)
!564 = !DILocalVariable(name: "n", scope: !565, file: !3, line: 245, type: !6)
!565 = distinct !DILexicalBlock(scope: !561, file: !3, line: 245, column: 9)
!566 = !DILocation(line: 0, scope: !565)
!567 = !DILocation(line: 245, column: 14, scope: !565)
!568 = !DILocation(line: 245, column: 36, scope: !569)
!569 = distinct !DILexicalBlock(scope: !565, file: !3, line: 245, column: 9)
!570 = !DILocation(line: 245, column: 31, scope: !569)
!571 = !DILocation(line: 245, column: 9, scope: !565)
!572 = !DILocalVariable(name: "pixel", scope: !573, file: !3, line: 246, type: !28)
!573 = distinct !DILexicalBlock(scope: !569, file: !3, line: 245, column: 50)
!574 = !DILocation(line: 0, scope: !573)
!575 = !DILocalVariable(name: "c", scope: !573, file: !3, line: 247, type: !115)
!576 = !DILocation(line: 248, column: 26, scope: !577)
!577 = distinct !DILexicalBlock(scope: !573, file: !3, line: 248, column: 13)
!578 = !DILocalVariable(name: "j", scope: !577, file: !3, line: 248, type: !6)
!579 = !DILocation(line: 0, scope: !577)
!580 = !DILocation(line: 248, column: 18, scope: !577)
!581 = !DILocation(line: 246, column: 19, scope: !573)
!582 = !DILocation(line: 247, column: 20, scope: !573)
!583 = !DILocation(line: 248, column: 36, scope: !584)
!584 = distinct !DILexicalBlock(scope: !577, file: !3, line: 248, column: 13)
!585 = !DILocation(line: 248, column: 13, scope: !577)
!586 = !DILocation(line: 249, column: 30, scope: !587)
!587 = distinct !DILexicalBlock(scope: !584, file: !3, line: 249, column: 17)
!588 = !DILocalVariable(name: "i", scope: !587, file: !3, line: 249, type: !6)
!589 = !DILocation(line: 0, scope: !587)
!590 = !DILocation(line: 249, column: 22, scope: !587)
!591 = !DILocation(line: 249, column: 40, scope: !592)
!592 = distinct !DILexicalBlock(scope: !587, file: !3, line: 249, column: 17)
!593 = !DILocation(line: 249, column: 17, scope: !587)
!594 = !DILocation(line: 250, column: 36, scope: !595)
!595 = distinct !DILexicalBlock(scope: !592, file: !3, line: 249, column: 55)
!596 = !DILocation(line: 250, column: 41, scope: !595)
!597 = !DILocation(line: 250, column: 46, scope: !595)
!598 = !DILocation(line: 250, column: 50, scope: !595)
!599 = !DILocation(line: 250, column: 30, scope: !595)
!600 = !DILocation(line: 250, column: 57, scope: !595)
!601 = !DILocation(line: 250, column: 55, scope: !595)
!602 = !DILocation(line: 250, column: 27, scope: !595)
!603 = !DILocation(line: 251, column: 22, scope: !595)
!604 = !DILocation(line: 252, column: 17, scope: !595)
!605 = !DILocation(line: 249, column: 51, scope: !592)
!606 = !DILocation(line: 249, column: 17, scope: !592)
!607 = distinct !{!607, !593, !608}
!608 = !DILocation(line: 252, column: 17, scope: !587)
!609 = !DILocation(line: 248, column: 47, scope: !584)
!610 = !DILocation(line: 248, column: 13, scope: !584)
!611 = distinct !{!611, !585, !612}
!612 = !DILocation(line: 252, column: 17, scope: !577)
!613 = !DILocation(line: 254, column: 17, scope: !614)
!614 = distinct !DILexicalBlock(scope: !573, file: !3, line: 254, column: 17)
!615 = !DILocation(line: 254, column: 17, scope: !573)
!616 = !DILocation(line: 255, column: 49, scope: !614)
!617 = !DILocation(line: 255, column: 40, scope: !614)
!618 = !DILocation(line: 255, column: 63, scope: !614)
!619 = !DILocation(line: 255, column: 56, scope: !614)
!620 = !DILocation(line: 255, column: 17, scope: !614)
!621 = !DILocation(line: 256, column: 31, scope: !573)
!622 = !DILocation(line: 256, column: 19, scope: !573)
!623 = !DILocation(line: 256, column: 24, scope: !573)
!624 = !DILocation(line: 256, column: 13, scope: !573)
!625 = !DILocation(line: 256, column: 29, scope: !573)
!626 = !DILocation(line: 257, column: 9, scope: !573)
!627 = !DILocation(line: 245, column: 46, scope: !569)
!628 = !DILocation(line: 245, column: 9, scope: !569)
!629 = distinct !{!629, !571, !630}
!630 = !DILocation(line: 257, column: 9, scope: !565)
!631 = !DILocation(line: 244, column: 42, scope: !561)
!632 = !DILocation(line: 244, column: 5, scope: !561)
!633 = distinct !{!633, !563, !634}
!634 = !DILocation(line: 257, column: 9, scope: !557)
!635 = !DILocation(line: 258, column: 1, scope: !451)
!636 = distinct !DISubprogram(name: "gaussian_filter", scope: !3, file: !3, line: 272, type: !637, scopeLine: 274, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !13, retainedNodes: !14)
!637 = !DISubroutineType(types: !638)
!638 = !{null, !278, !30, !7, !7, !455}
!639 = !DILocalVariable(name: "in", arg: 1, scope: !636, file: !3, line: 272, type: !278)
!640 = !DILocation(line: 0, scope: !636)
!641 = !DILocalVariable(name: "out", arg: 2, scope: !636, file: !3, line: 272, type: !30)
!642 = !DILocalVariable(name: "nx", arg: 3, scope: !636, file: !3, line: 273, type: !7)
!643 = !DILocalVariable(name: "ny", arg: 4, scope: !636, file: !3, line: 273, type: !7)
!644 = !DILocalVariable(name: "sigma", arg: 5, scope: !636, file: !3, line: 273, type: !455)
!645 = !DILocation(line: 275, column: 31, scope: !636)
!646 = !DILocation(line: 275, column: 23, scope: !636)
!647 = !DILocation(line: 275, column: 21, scope: !636)
!648 = !DILocation(line: 275, column: 40, scope: !636)
!649 = !DILocalVariable(name: "n", scope: !636, file: !3, line: 275, type: !7)
!650 = !DILocation(line: 276, column: 37, scope: !636)
!651 = !DILocation(line: 276, column: 39, scope: !636)
!652 = !DILocation(line: 276, column: 31, scope: !636)
!653 = !DILocation(line: 276, column: 24, scope: !636)
!654 = !DILocalVariable(name: "mean", scope: !636, file: !3, line: 276, type: !455)
!655 = !DILocation(line: 277, column: 20, scope: !636)
!656 = !DILocation(line: 277, column: 5, scope: !636)
!657 = !DILocalVariable(name: "__vla_expr0", scope: !636, type: !117, flags: DIFlagArtificial)
!658 = !DILocalVariable(name: "kernel", scope: !636, file: !3, line: 277, type: !659)
!659 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, elements: !660)
!660 = !{!661}
!661 = !DISubrange(count: !657)
!662 = !DILocation(line: 277, column: 11, scope: !636)
!663 = !DILocation(line: 279, column: 13, scope: !636)
!664 = !DILocation(line: 280, column: 16, scope: !636)
!665 = !DILocation(line: 279, column: 5, scope: !636)
!666 = !DILocalVariable(name: "c", scope: !636, file: !3, line: 281, type: !115)
!667 = !DILocalVariable(name: "i", scope: !668, file: !3, line: 282, type: !6)
!668 = distinct !DILexicalBlock(scope: !636, file: !3, line: 282, column: 5)
!669 = !DILocation(line: 0, scope: !668)
!670 = !DILocation(line: 282, column: 10, scope: !668)
!671 = !DILocation(line: 281, column: 12, scope: !636)
!672 = !DILocation(line: 282, column: 23, scope: !673)
!673 = distinct !DILexicalBlock(scope: !668, file: !3, line: 282, column: 5)
!674 = !DILocation(line: 282, column: 5, scope: !668)
!675 = !DILocalVariable(name: "j", scope: !676, file: !3, line: 283, type: !6)
!676 = distinct !DILexicalBlock(scope: !673, file: !3, line: 283, column: 9)
!677 = !DILocation(line: 0, scope: !676)
!678 = !DILocation(line: 283, column: 14, scope: !676)
!679 = !DILocation(line: 283, column: 27, scope: !680)
!680 = distinct !DILexicalBlock(scope: !676, file: !3, line: 283, column: 9)
!681 = !DILocation(line: 283, column: 9, scope: !676)
!682 = !DILocation(line: 284, column: 42, scope: !683)
!683 = distinct !DILexicalBlock(scope: !680, file: !3, line: 283, column: 37)
!684 = !DILocation(line: 284, column: 44, scope: !683)
!685 = !DILocation(line: 284, column: 52, scope: !683)
!686 = !DILocation(line: 284, column: 41, scope: !683)
!687 = !DILocation(line: 284, column: 37, scope: !683)
!688 = !DILocation(line: 285, column: 42, scope: !683)
!689 = !DILocation(line: 285, column: 44, scope: !683)
!690 = !DILocation(line: 285, column: 52, scope: !683)
!691 = !DILocation(line: 285, column: 41, scope: !683)
!692 = !DILocation(line: 285, column: 37, scope: !683)
!693 = !DILocation(line: 284, column: 66, scope: !683)
!694 = !DILocation(line: 284, column: 34, scope: !683)
!695 = !DILocation(line: 284, column: 25, scope: !683)
!696 = !DILocation(line: 286, column: 39, scope: !683)
!697 = !DILocation(line: 286, column: 37, scope: !683)
!698 = !DILocation(line: 286, column: 47, scope: !683)
!699 = !DILocation(line: 286, column: 45, scope: !683)
!700 = !DILocation(line: 286, column: 25, scope: !683)
!701 = !DILocation(line: 284, column: 13, scope: !683)
!702 = !DILocation(line: 284, column: 23, scope: !683)
!703 = !DILocation(line: 287, column: 14, scope: !683)
!704 = !DILocation(line: 288, column: 9, scope: !683)
!705 = !DILocation(line: 283, column: 33, scope: !680)
!706 = !DILocation(line: 283, column: 9, scope: !680)
!707 = distinct !{!707, !681, !708}
!708 = !DILocation(line: 288, column: 9, scope: !676)
!709 = !DILocation(line: 282, column: 29, scope: !673)
!710 = !DILocation(line: 282, column: 5, scope: !673)
!711 = distinct !{!711, !674, !712}
!712 = !DILocation(line: 288, column: 9, scope: !668)
!713 = !DILocation(line: 290, column: 5, scope: !636)
!714 = !DILocation(line: 291, column: 1, scope: !636)
!715 = distinct !DISubprogram(name: "canny_edge_detection", scope: !3, file: !3, line: 302, type: !716, scopeLine: 306, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !13, retainedNodes: !14)
!716 = !DISubroutineType(types: !717)
!717 = !{!30, !278, !276, !7, !7, !455}
!718 = !DILocalVariable(name: "in", arg: 1, scope: !715, file: !3, line: 302, type: !278)
!719 = !DILocation(line: 0, scope: !715)
!720 = !DILocalVariable(name: "bmp_ih", arg: 2, scope: !715, file: !3, line: 303, type: !276)
!721 = !DILocalVariable(name: "tmin", arg: 3, scope: !715, file: !3, line: 304, type: !7)
!722 = !DILocalVariable(name: "tmax", arg: 4, scope: !715, file: !3, line: 304, type: !7)
!723 = !DILocalVariable(name: "sigma", arg: 5, scope: !715, file: !3, line: 305, type: !455)
!724 = !DILocation(line: 307, column: 28, scope: !715)
!725 = !DILocalVariable(name: "nx", scope: !715, file: !3, line: 307, type: !7)
!726 = !DILocation(line: 308, column: 28, scope: !715)
!727 = !DILocalVariable(name: "ny", scope: !715, file: !3, line: 308, type: !7)
!728 = !DILocation(line: 310, column: 28, scope: !715)
!729 = !DILocation(line: 310, column: 25, scope: !715)
!730 = !DILocation(line: 310, column: 33, scope: !715)
!731 = !DILocation(line: 310, column: 18, scope: !715)
!732 = !DILocalVariable(name: "G", scope: !715, file: !3, line: 310, type: !30)
!733 = !DILocation(line: 311, column: 35, scope: !715)
!734 = !DILocation(line: 311, column: 32, scope: !715)
!735 = !DILocation(line: 311, column: 40, scope: !715)
!736 = !DILocation(line: 311, column: 25, scope: !715)
!737 = !DILocalVariable(name: "after_Gx", scope: !715, file: !3, line: 311, type: !30)
!738 = !DILocation(line: 312, column: 35, scope: !715)
!739 = !DILocation(line: 312, column: 32, scope: !715)
!740 = !DILocation(line: 312, column: 40, scope: !715)
!741 = !DILocation(line: 312, column: 25, scope: !715)
!742 = !DILocalVariable(name: "after_Gy", scope: !715, file: !3, line: 312, type: !30)
!743 = !DILocation(line: 313, column: 30, scope: !715)
!744 = !DILocation(line: 313, column: 27, scope: !715)
!745 = !DILocation(line: 313, column: 35, scope: !715)
!746 = !DILocation(line: 313, column: 20, scope: !715)
!747 = !DILocalVariable(name: "nms", scope: !715, file: !3, line: 313, type: !30)
!748 = !DILocation(line: 314, column: 35, scope: !715)
!749 = !DILocation(line: 314, column: 27, scope: !715)
!750 = !DILocation(line: 314, column: 46, scope: !715)
!751 = !DILocation(line: 314, column: 20, scope: !715)
!752 = !DILocalVariable(name: "out", scope: !715, file: !3, line: 314, type: !30)
!753 = !DILocation(line: 316, column: 11, scope: !754)
!754 = distinct !DILexicalBlock(scope: !715, file: !3, line: 316, column: 9)
!755 = !DILocation(line: 316, column: 19, scope: !754)
!756 = !DILocation(line: 316, column: 31, scope: !754)
!757 = !DILocation(line: 316, column: 39, scope: !754)
!758 = !DILocation(line: 316, column: 51, scope: !754)
!759 = !DILocation(line: 316, column: 59, scope: !754)
!760 = !DILocation(line: 317, column: 13, scope: !754)
!761 = !DILocation(line: 317, column: 21, scope: !754)
!762 = !DILocation(line: 317, column: 28, scope: !754)
!763 = !DILocation(line: 316, column: 9, scope: !715)
!764 = !DILocation(line: 318, column: 17, scope: !765)
!765 = distinct !DILexicalBlock(scope: !754, file: !3, line: 317, column: 37)
!766 = !DILocation(line: 318, column: 9, scope: !765)
!767 = !DILocation(line: 320, column: 9, scope: !765)
!768 = !DILocation(line: 323, column: 5, scope: !715)
!769 = !DILocalVariable(name: "Gx", scope: !715, file: !3, line: 325, type: !770)
!770 = !DICompositeType(tag: DW_TAG_array_type, baseType: !455, size: 288, elements: !771)
!771 = !{!772}
!772 = !DISubrange(count: 9)
!773 = !DILocation(line: 325, column: 17, scope: !715)
!774 = !DILocation(line: 329, column: 32, scope: !715)
!775 = !DILocation(line: 329, column: 5, scope: !715)
!776 = !DILocalVariable(name: "Gy", scope: !715, file: !3, line: 331, type: !770)
!777 = !DILocation(line: 331, column: 17, scope: !715)
!778 = !DILocation(line: 335, column: 32, scope: !715)
!779 = !DILocation(line: 335, column: 5, scope: !715)
!780 = !DILocalVariable(name: "i", scope: !781, file: !3, line: 337, type: !6)
!781 = distinct !DILexicalBlock(scope: !715, file: !3, line: 337, column: 5)
!782 = !DILocation(line: 0, scope: !781)
!783 = !DILocation(line: 337, column: 10, scope: !781)
!784 = !DILocation(line: 337, column: 28, scope: !785)
!785 = distinct !DILexicalBlock(scope: !781, file: !3, line: 337, column: 5)
!786 = !DILocation(line: 337, column: 23, scope: !785)
!787 = !DILocation(line: 337, column: 5, scope: !781)
!788 = !DILocalVariable(name: "j", scope: !789, file: !3, line: 338, type: !6)
!789 = distinct !DILexicalBlock(scope: !785, file: !3, line: 338, column: 9)
!790 = !DILocation(line: 0, scope: !789)
!791 = !DILocation(line: 338, column: 14, scope: !789)
!792 = !DILocation(line: 338, column: 32, scope: !793)
!793 = distinct !DILexicalBlock(scope: !789, file: !3, line: 338, column: 9)
!794 = !DILocation(line: 338, column: 27, scope: !793)
!795 = !DILocation(line: 338, column: 9, scope: !789)
!796 = !DILocation(line: 339, column: 34, scope: !797)
!797 = distinct !DILexicalBlock(scope: !793, file: !3, line: 338, column: 42)
!798 = !DILocation(line: 339, column: 29, scope: !797)
!799 = !DILocalVariable(name: "c", scope: !797, file: !3, line: 339, type: !7)
!800 = !DILocation(line: 0, scope: !797)
!801 = !DILocation(line: 341, column: 35, scope: !797)
!802 = !DILocation(line: 341, column: 48, scope: !797)
!803 = !DILocation(line: 341, column: 29, scope: !797)
!804 = !DILocation(line: 341, column: 20, scope: !797)
!805 = !DILocation(line: 341, column: 13, scope: !797)
!806 = !DILocation(line: 341, column: 18, scope: !797)
!807 = !DILocation(line: 342, column: 9, scope: !797)
!808 = !DILocation(line: 338, column: 38, scope: !793)
!809 = !DILocation(line: 338, column: 9, scope: !793)
!810 = distinct !{!810, !795, !811}
!811 = !DILocation(line: 342, column: 9, scope: !789)
!812 = !DILocation(line: 337, column: 34, scope: !785)
!813 = !DILocation(line: 337, column: 5, scope: !785)
!814 = distinct !{!814, !787, !815}
!815 = !DILocation(line: 342, column: 9, scope: !781)
!816 = !DILocalVariable(name: "i", scope: !817, file: !3, line: 345, type: !6)
!817 = distinct !DILexicalBlock(scope: !715, file: !3, line: 345, column: 5)
!818 = !DILocation(line: 0, scope: !817)
!819 = !DILocation(line: 345, column: 10, scope: !817)
!820 = !DILocation(line: 345, column: 28, scope: !821)
!821 = distinct !DILexicalBlock(scope: !817, file: !3, line: 345, column: 5)
!822 = !DILocation(line: 345, column: 23, scope: !821)
!823 = !DILocation(line: 345, column: 5, scope: !817)
!824 = !DILocalVariable(name: "j", scope: !825, file: !3, line: 346, type: !6)
!825 = distinct !DILexicalBlock(scope: !821, file: !3, line: 346, column: 9)
!826 = !DILocation(line: 0, scope: !825)
!827 = !DILocation(line: 346, column: 14, scope: !825)
!828 = !DILocation(line: 346, column: 32, scope: !829)
!829 = distinct !DILexicalBlock(scope: !825, file: !3, line: 346, column: 9)
!830 = !DILocation(line: 346, column: 27, scope: !829)
!831 = !DILocation(line: 346, column: 9, scope: !825)
!832 = !DILocation(line: 347, column: 34, scope: !833)
!833 = distinct !DILexicalBlock(scope: !829, file: !3, line: 346, column: 42)
!834 = !DILocation(line: 347, column: 29, scope: !833)
!835 = !DILocalVariable(name: "c", scope: !833, file: !3, line: 347, type: !7)
!836 = !DILocation(line: 0, scope: !833)
!837 = !DILocation(line: 348, column: 30, scope: !833)
!838 = !DILocalVariable(name: "nn", scope: !833, file: !3, line: 348, type: !7)
!839 = !DILocation(line: 349, column: 30, scope: !833)
!840 = !DILocalVariable(name: "ss", scope: !833, file: !3, line: 349, type: !7)
!841 = !DILocation(line: 350, column: 30, scope: !833)
!842 = !DILocalVariable(name: "ww", scope: !833, file: !3, line: 350, type: !7)
!843 = !DILocation(line: 351, column: 30, scope: !833)
!844 = !DILocalVariable(name: "ee", scope: !833, file: !3, line: 351, type: !7)
!845 = !DILocation(line: 352, column: 31, scope: !833)
!846 = !DILocalVariable(name: "nw", scope: !833, file: !3, line: 352, type: !7)
!847 = !DILocation(line: 353, column: 31, scope: !833)
!848 = !DILocalVariable(name: "ne", scope: !833, file: !3, line: 353, type: !7)
!849 = !DILocation(line: 354, column: 31, scope: !833)
!850 = !DILocalVariable(name: "sw", scope: !833, file: !3, line: 354, type: !7)
!851 = !DILocation(line: 355, column: 31, scope: !833)
!852 = !DILocalVariable(name: "se", scope: !833, file: !3, line: 355, type: !7)
!853 = !DILocation(line: 357, column: 50, scope: !833)
!854 = !DILocation(line: 358, column: 50, scope: !833)
!855 = !DILocation(line: 357, column: 44, scope: !833)
!856 = !DILocation(line: 358, column: 63, scope: !833)
!857 = !DILocation(line: 357, column: 39, scope: !833)
!858 = !DILocation(line: 359, column: 50, scope: !833)
!859 = !DILocation(line: 357, column: 31, scope: !833)
!860 = !DILocation(line: 359, column: 58, scope: !833)
!861 = !DILocalVariable(name: "dir", scope: !833, file: !3, line: 357, type: !455)
!862 = !DILocation(line: 361, column: 23, scope: !863)
!863 = distinct !DILexicalBlock(scope: !833, file: !3, line: 361, column: 17)
!864 = !DILocation(line: 361, column: 28, scope: !863)
!865 = !DILocation(line: 361, column: 35, scope: !863)
!866 = !DILocation(line: 361, column: 40, scope: !863)
!867 = !DILocation(line: 361, column: 43, scope: !863)
!868 = !DILocation(line: 361, column: 50, scope: !863)
!869 = !DILocation(line: 361, column: 48, scope: !863)
!870 = !DILocation(line: 361, column: 56, scope: !863)
!871 = !DILocation(line: 362, column: 18, scope: !863)
!872 = !DILocation(line: 362, column: 25, scope: !863)
!873 = !DILocation(line: 362, column: 23, scope: !863)
!874 = !DILocation(line: 362, column: 32, scope: !863)
!875 = !DILocation(line: 363, column: 23, scope: !863)
!876 = !DILocation(line: 363, column: 27, scope: !863)
!877 = !DILocation(line: 363, column: 34, scope: !863)
!878 = !DILocation(line: 363, column: 40, scope: !863)
!879 = !DILocation(line: 363, column: 43, scope: !863)
!880 = !DILocation(line: 363, column: 50, scope: !863)
!881 = !DILocation(line: 363, column: 48, scope: !863)
!882 = !DILocation(line: 363, column: 56, scope: !863)
!883 = !DILocation(line: 364, column: 18, scope: !863)
!884 = !DILocation(line: 364, column: 25, scope: !863)
!885 = !DILocation(line: 364, column: 23, scope: !863)
!886 = !DILocation(line: 364, column: 32, scope: !863)
!887 = !DILocation(line: 365, column: 23, scope: !863)
!888 = !DILocation(line: 365, column: 27, scope: !863)
!889 = !DILocation(line: 365, column: 34, scope: !863)
!890 = !DILocation(line: 365, column: 40, scope: !863)
!891 = !DILocation(line: 365, column: 43, scope: !863)
!892 = !DILocation(line: 365, column: 50, scope: !863)
!893 = !DILocation(line: 365, column: 48, scope: !863)
!894 = !DILocation(line: 365, column: 56, scope: !863)
!895 = !DILocation(line: 366, column: 18, scope: !863)
!896 = !DILocation(line: 366, column: 25, scope: !863)
!897 = !DILocation(line: 366, column: 23, scope: !863)
!898 = !DILocation(line: 366, column: 32, scope: !863)
!899 = !DILocation(line: 367, column: 23, scope: !863)
!900 = !DILocation(line: 367, column: 27, scope: !863)
!901 = !DILocation(line: 367, column: 34, scope: !863)
!902 = !DILocation(line: 367, column: 40, scope: !863)
!903 = !DILocation(line: 367, column: 43, scope: !863)
!904 = !DILocation(line: 367, column: 50, scope: !863)
!905 = !DILocation(line: 367, column: 48, scope: !863)
!906 = !DILocation(line: 367, column: 56, scope: !863)
!907 = !DILocation(line: 368, column: 18, scope: !863)
!908 = !DILocation(line: 368, column: 25, scope: !863)
!909 = !DILocation(line: 368, column: 23, scope: !863)
!910 = !DILocation(line: 361, column: 17, scope: !833)
!911 = !DILocation(line: 369, column: 26, scope: !863)
!912 = !DILocation(line: 369, column: 17, scope: !863)
!913 = !DILocation(line: 369, column: 24, scope: !863)
!914 = !DILocation(line: 371, column: 17, scope: !863)
!915 = !DILocation(line: 371, column: 24, scope: !863)
!916 = !DILocation(line: 372, column: 9, scope: !833)
!917 = !DILocation(line: 346, column: 38, scope: !829)
!918 = !DILocation(line: 346, column: 9, scope: !829)
!919 = distinct !{!919, !831, !920}
!920 = !DILocation(line: 372, column: 9, scope: !825)
!921 = !DILocation(line: 345, column: 34, scope: !821)
!922 = !DILocation(line: 345, column: 5, scope: !821)
!923 = distinct !{!923, !823, !924}
!924 = !DILocation(line: 372, column: 9, scope: !817)
!925 = !DILocation(line: 376, column: 18, scope: !715)
!926 = !DILocalVariable(name: "edges", scope: !715, file: !3, line: 376, type: !29)
!927 = !DILocation(line: 377, column: 5, scope: !715)
!928 = !DILocation(line: 377, column: 38, scope: !715)
!929 = !DILocation(line: 377, column: 36, scope: !715)
!930 = !DILocation(line: 377, column: 43, scope: !715)
!931 = !DILocation(line: 377, column: 41, scope: !715)
!932 = !DILocation(line: 378, column: 5, scope: !715)
!933 = !DILocation(line: 378, column: 40, scope: !715)
!934 = !DILocation(line: 378, column: 38, scope: !715)
!935 = !DILocation(line: 378, column: 45, scope: !715)
!936 = !DILocation(line: 378, column: 43, scope: !715)
!937 = !DILocalVariable(name: "c", scope: !715, file: !3, line: 381, type: !115)
!938 = !DILocalVariable(name: "j", scope: !939, file: !3, line: 382, type: !6)
!939 = distinct !DILexicalBlock(scope: !715, file: !3, line: 382, column: 5)
!940 = !DILocation(line: 0, scope: !939)
!941 = !DILocation(line: 382, column: 10, scope: !939)
!942 = !DILocation(line: 381, column: 12, scope: !715)
!943 = !DILocation(line: 382, column: 28, scope: !944)
!944 = distinct !DILexicalBlock(scope: !939, file: !3, line: 382, column: 5)
!945 = !DILocation(line: 382, column: 23, scope: !944)
!946 = !DILocation(line: 382, column: 5, scope: !939)
!947 = !DILocalVariable(name: "i", scope: !948, file: !3, line: 383, type: !6)
!948 = distinct !DILexicalBlock(scope: !944, file: !3, line: 383, column: 9)
!949 = !DILocation(line: 0, scope: !948)
!950 = !DILocation(line: 383, column: 14, scope: !948)
!951 = !DILocation(line: 383, column: 32, scope: !952)
!952 = distinct !DILexicalBlock(scope: !948, file: !3, line: 383, column: 9)
!953 = !DILocation(line: 383, column: 27, scope: !952)
!954 = !DILocation(line: 383, column: 9, scope: !948)
!955 = !DILocation(line: 384, column: 17, scope: !956)
!956 = distinct !DILexicalBlock(scope: !957, file: !3, line: 384, column: 17)
!957 = distinct !DILexicalBlock(scope: !952, file: !3, line: 383, column: 42)
!958 = !DILocation(line: 384, column: 24, scope: !956)
!959 = !DILocation(line: 384, column: 32, scope: !956)
!960 = !DILocation(line: 384, column: 35, scope: !956)
!961 = !DILocation(line: 384, column: 42, scope: !956)
!962 = !DILocation(line: 384, column: 17, scope: !957)
!963 = !DILocation(line: 385, column: 17, scope: !964)
!964 = distinct !DILexicalBlock(scope: !956, file: !3, line: 384, column: 48)
!965 = !DILocation(line: 385, column: 24, scope: !964)
!966 = !DILocalVariable(name: "nedges", scope: !964, file: !3, line: 386, type: !6)
!967 = !DILocation(line: 0, scope: !964)
!968 = !DILocation(line: 387, column: 28, scope: !964)
!969 = !DILocation(line: 387, column: 17, scope: !964)
!970 = !DILocation(line: 387, column: 26, scope: !964)
!971 = !DILocation(line: 389, column: 17, scope: !964)
!972 = !DILocation(line: 390, column: 27, scope: !973)
!973 = distinct !DILexicalBlock(scope: !964, file: !3, line: 389, column: 20)
!974 = !DILocation(line: 391, column: 35, scope: !973)
!975 = !DILocalVariable(name: "t", scope: !973, file: !3, line: 391, type: !7)
!976 = !DILocation(line: 0, scope: !973)
!977 = !DILocalVariable(name: "nbs", scope: !973, file: !3, line: 393, type: !978)
!978 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 256, elements: !979)
!979 = !{!980}
!980 = !DISubrange(count: 8)
!981 = !DILocation(line: 393, column: 25, scope: !973)
!982 = !DILocation(line: 394, column: 32, scope: !973)
!983 = !DILocation(line: 394, column: 21, scope: !973)
!984 = !DILocation(line: 394, column: 28, scope: !973)
!985 = !DILocation(line: 395, column: 32, scope: !973)
!986 = !DILocation(line: 395, column: 21, scope: !973)
!987 = !DILocation(line: 395, column: 28, scope: !973)
!988 = !DILocation(line: 396, column: 32, scope: !973)
!989 = !DILocation(line: 396, column: 21, scope: !973)
!990 = !DILocation(line: 396, column: 28, scope: !973)
!991 = !DILocation(line: 397, column: 32, scope: !973)
!992 = !DILocation(line: 397, column: 21, scope: !973)
!993 = !DILocation(line: 397, column: 28, scope: !973)
!994 = !DILocation(line: 398, column: 30, scope: !973)
!995 = !DILocation(line: 398, column: 37, scope: !973)
!996 = !DILocation(line: 398, column: 21, scope: !973)
!997 = !DILocation(line: 398, column: 28, scope: !973)
!998 = !DILocation(line: 399, column: 30, scope: !973)
!999 = !DILocation(line: 399, column: 37, scope: !973)
!1000 = !DILocation(line: 399, column: 21, scope: !973)
!1001 = !DILocation(line: 399, column: 28, scope: !973)
!1002 = !DILocation(line: 400, column: 30, scope: !973)
!1003 = !DILocation(line: 400, column: 37, scope: !973)
!1004 = !DILocation(line: 400, column: 21, scope: !973)
!1005 = !DILocation(line: 400, column: 28, scope: !973)
!1006 = !DILocation(line: 401, column: 30, scope: !973)
!1007 = !DILocation(line: 401, column: 37, scope: !973)
!1008 = !DILocation(line: 401, column: 21, scope: !973)
!1009 = !DILocation(line: 401, column: 28, scope: !973)
!1010 = !DILocalVariable(name: "k", scope: !1011, file: !3, line: 403, type: !6)
!1011 = distinct !DILexicalBlock(scope: !973, file: !3, line: 403, column: 21)
!1012 = !DILocation(line: 0, scope: !1011)
!1013 = !DILocation(line: 403, column: 26, scope: !1011)
!1014 = !DILocation(line: 403, column: 39, scope: !1015)
!1015 = distinct !DILexicalBlock(scope: !1011, file: !3, line: 403, column: 21)
!1016 = !DILocation(line: 403, column: 21, scope: !1011)
!1017 = !DILocation(line: 404, column: 33, scope: !1018)
!1018 = distinct !DILexicalBlock(scope: !1015, file: !3, line: 404, column: 29)
!1019 = !DILocation(line: 404, column: 29, scope: !1018)
!1020 = !DILocation(line: 404, column: 41, scope: !1018)
!1021 = !DILocation(line: 404, column: 49, scope: !1018)
!1022 = !DILocation(line: 404, column: 56, scope: !1018)
!1023 = !DILocation(line: 404, column: 52, scope: !1018)
!1024 = !DILocation(line: 404, column: 64, scope: !1018)
!1025 = !DILocation(line: 404, column: 29, scope: !1015)
!1026 = !DILocation(line: 405, column: 33, scope: !1027)
!1027 = distinct !DILexicalBlock(scope: !1018, file: !3, line: 404, column: 70)
!1028 = !DILocation(line: 405, column: 29, scope: !1027)
!1029 = !DILocation(line: 405, column: 41, scope: !1027)
!1030 = !DILocation(line: 406, column: 45, scope: !1027)
!1031 = !DILocation(line: 406, column: 29, scope: !1027)
!1032 = !DILocation(line: 406, column: 43, scope: !1027)
!1033 = !DILocation(line: 407, column: 35, scope: !1027)
!1034 = !DILocation(line: 408, column: 25, scope: !1027)
!1035 = !DILocation(line: 404, column: 67, scope: !1018)
!1036 = !DILocation(line: 403, column: 45, scope: !1015)
!1037 = !DILocation(line: 403, column: 21, scope: !1015)
!1038 = distinct !{!1038, !1016, !1039}
!1039 = !DILocation(line: 408, column: 25, scope: !1011)
!1040 = !DILocation(line: 409, column: 17, scope: !973)
!1041 = !DILocation(line: 409, column: 33, scope: !964)
!1042 = distinct !{!1042, !971, !1043}
!1043 = !DILocation(line: 409, column: 36, scope: !964)
!1044 = !DILocation(line: 410, column: 13, scope: !964)
!1045 = !DILocation(line: 411, column: 14, scope: !957)
!1046 = !DILocation(line: 412, column: 9, scope: !957)
!1047 = !DILocation(line: 383, column: 38, scope: !952)
!1048 = !DILocation(line: 383, column: 9, scope: !952)
!1049 = distinct !{!1049, !954, !1050}
!1050 = !DILocation(line: 412, column: 9, scope: !948)
!1051 = !DILocation(line: 382, column: 34, scope: !944)
!1052 = !DILocation(line: 382, column: 5, scope: !944)
!1053 = distinct !{!1053, !946, !1054}
!1054 = !DILocation(line: 412, column: 9, scope: !939)
!1055 = !DILocation(line: 414, column: 10, scope: !715)
!1056 = !DILocation(line: 414, column: 5, scope: !715)
!1057 = !DILocation(line: 415, column: 10, scope: !715)
!1058 = !DILocation(line: 415, column: 5, scope: !715)
!1059 = !DILocation(line: 416, column: 10, scope: !715)
!1060 = !DILocation(line: 416, column: 5, scope: !715)
!1061 = !DILocation(line: 417, column: 10, scope: !715)
!1062 = !DILocation(line: 417, column: 5, scope: !715)
!1063 = !DILocation(line: 419, column: 5, scope: !715)
!1064 = !DILocalVariable(name: "argc", arg: 1, scope: !2, file: !3, line: 422, type: !7)
!1065 = !DILocation(line: 0, scope: !2)
!1066 = !DILocalVariable(name: "argv", arg: 2, scope: !2, file: !3, line: 422, type: !8)
!1067 = !DILocation(line: 424, column: 14, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !2, file: !3, line: 424, column: 9)
!1069 = !DILocation(line: 424, column: 9, scope: !2)
!1070 = !DILocation(line: 425, column: 41, scope: !1071)
!1071 = distinct !DILexicalBlock(scope: !1068, file: !3, line: 424, column: 19)
!1072 = !DILocation(line: 425, column: 9, scope: !1071)
!1073 = !DILocation(line: 426, column: 9, scope: !1071)
!1074 = !DILocation(line: 430, column: 46, scope: !2)
!1075 = !DILocation(line: 430, column: 37, scope: !2)
!1076 = !DILocalVariable(name: "in_bitmap_data", scope: !2, file: !3, line: 430, type: !278)
!1077 = !DILocation(line: 431, column: 24, scope: !1078)
!1078 = distinct !DILexicalBlock(scope: !2, file: !3, line: 431, column: 9)
!1079 = !DILocation(line: 431, column: 9, scope: !2)
!1080 = !DILocation(line: 432, column: 17, scope: !1081)
!1081 = distinct !DILexicalBlock(scope: !1078, file: !3, line: 431, column: 33)
!1082 = !DILocation(line: 432, column: 9, scope: !1081)
!1083 = !DILocation(line: 433, column: 9, scope: !1081)
!1084 = !DILocation(line: 436, column: 39, scope: !2)
!1085 = !DILocation(line: 436, column: 49, scope: !2)
!1086 = !DILocation(line: 436, column: 60, scope: !2)
!1087 = !DILocation(line: 436, column: 57, scope: !2)
!1088 = !DILocation(line: 436, column: 5, scope: !2)
!1089 = !DILocation(line: 439, column: 9, scope: !2)
!1090 = !DILocalVariable(name: "out_bitmap_data", scope: !2, file: !3, line: 438, type: !278)
!1091 = !DILocation(line: 440, column: 25, scope: !1092)
!1092 = distinct !DILexicalBlock(scope: !2, file: !3, line: 440, column: 9)
!1093 = !DILocation(line: 440, column: 9, scope: !2)
!1094 = !DILocation(line: 441, column: 17, scope: !1095)
!1095 = distinct !DILexicalBlock(scope: !1092, file: !3, line: 440, column: 34)
!1096 = !DILocation(line: 441, column: 9, scope: !1095)
!1097 = !DILocation(line: 442, column: 9, scope: !1095)
!1098 = !DILocation(line: 445, column: 9, scope: !1099)
!1099 = distinct !DILexicalBlock(scope: !2, file: !3, line: 445, column: 9)
!1100 = !DILocation(line: 445, column: 9, scope: !2)
!1101 = !DILocation(line: 446, column: 17, scope: !1102)
!1102 = distinct !DILexicalBlock(scope: !1099, file: !3, line: 445, column: 52)
!1103 = !DILocation(line: 446, column: 9, scope: !1102)
!1104 = !DILocation(line: 447, column: 9, scope: !1102)
!1105 = !DILocation(line: 450, column: 10, scope: !2)
!1106 = !DILocation(line: 450, column: 5, scope: !2)
!1107 = !DILocation(line: 451, column: 10, scope: !2)
!1108 = !DILocation(line: 451, column: 5, scope: !2)
!1109 = !DILocation(line: 452, column: 5, scope: !2)
!1110 = !DILocation(line: 453, column: 1, scope: !2)
