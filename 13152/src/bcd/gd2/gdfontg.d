/* THIS FILE GENERATED BY bcd.gen */
module bcd.gd2.gdfontg;
const int _GDFONTG_H_ = 1;
const int GD_H = 1;
const int NONDLL = 1;
const int GD_IO_H = 1;
const int gdMaxColors = 256;
const int gdAlphaMax = 127;
const int gdAlphaOpaque = 0;
const int gdAlphaTransparent = 127;
const int gdRedMax = 255;
const int gdGreenMax = 255;
const int gdBlueMax = 255;
const int gdDashSize = 4;
const int gdFTEX_LINESPACE = 1;
const int gdFTEX_CHARMAP = 2;
const int gdFTEX_RESOLUTION = 4;
const int gdFTEX_DISABLE_KERNING = 8;
const int gdFTEX_XSHOW = 16;
const int gdFTEX_FONTPATHNAME = 32;
const int gdFTEX_FONTCONFIG = 64;
const int gdFTEX_RETURNFONTPATHNAME = 128;
const int gdFTEX_Unicode = 0;
const int gdFTEX_Shift_JIS = 1;
const int gdFTEX_Big5 = 2;
const int gdArc = 0;
const int gdChord = 1;
const int gdNoFill = 2;
const int gdEdged = 4;
const int GD2_CHUNKSIZE = 128;
const int GD2_CHUNKSIZE_MIN = 64;
const int GD2_CHUNKSIZE_MAX = 4096;
const int GD2_VERS = 2;
const int GD2_FMT_RAW = 1;
const int GD2_FMT_COMPRESSED = 2;
const int GD_CMP_IMAGE = 1;
const int GD_CMP_NUM_COLORS = 2;
const int GD_CMP_COLOR = 4;
const int GD_CMP_SIZE_X = 8;
const int GD_CMP_SIZE_Y = 16;
const int GD_CMP_TRANSPARENT = 32;
const int GD_CMP_BACKGROUND = 64;
const int GD_CMP_INTERLACE = 128;
const int GD_CMP_TRUECOLOR = 256;
const int GD_RESOLUTION = 96;
const int GDFX_H = 1;
import bcd.gd2.gd;
alias gdSink * gdSinkPtr;
alias int function(void *, char *, int) _BCD_func__829;
alias gdPoint * gdPointPtr;
alias gdFTStringExtra * gdFTStringExtraPtr;
alias gdSource * gdSourcePtr;
alias int function(void *, char *, int) _BCD_func__833;
alias gdFont * gdFontPtr;
alias gdImageStruct gdImage;
alias gdImageStruct * gdImagePtr;
alias gdIOCtx * gdIOCtxPtr;
alias int function(gdIOCtx *) _BCD_func__837;
alias int function(gdIOCtx *, void *, int) _BCD_func__838;
alias void function(gdIOCtx *, int) _BCD_func__839;
alias int function(gdIOCtx *, void *, int) _BCD_func__840;
alias int function(gdIOCtx *, int) _BCD_func__841;
alias int function(gdIOCtx *) _BCD_func__842;
alias void function(gdIOCtx *) _BCD_func__843;
extern (C) gdFont * gdFontGetGiant();
extern (C) void gdImageSharpen(gdImageStruct *, int);
extern (C) char * gdImageStringFTCircle(gdImageStruct *, int, int, double, double, double, char *, double, char *, char *, int);
extern (C) gdImageStruct * gdImageSquareToCircle(gdImageStruct *, int);
extern (C) int gdImageCompare(gdImageStruct *, gdImageStruct *);
extern (C) void * gdDPExtractData(gdIOCtx *, int *);
extern (C) gdIOCtx * gdNewSSCtx(gdSource *, gdSink *);
extern (C) gdIOCtx * gdNewDynamicCtxEx(int, void *, int);
extern (C) gdIOCtx * gdNewDynamicCtx(int, void *);
extern (C) gdIOCtx * gdNewFileCtx(_IO_FILE *);
extern (C) void gdImageSaveAlpha(gdImageStruct *, int);
extern (C) void gdImageAlphaBlending(gdImageStruct *, int);
extern (C) void gdImageInterlace(gdImageStruct *, int);
extern (C) void gdImageSetThickness(gdImageStruct *, int);
extern (C) void gdImageSetStyle(gdImageStruct *, int *, int);
extern (C) void gdImageSetAntiAliasedDontBlend(gdImageStruct *, int, int);
extern (C) void gdImageSetAntiAliased(gdImageStruct *, int);
extern (C) void gdImageSetTile(gdImageStruct *, gdImageStruct *);
extern (C) void gdImageSetBrush(gdImageStruct *, gdImageStruct *);
extern (C) void gdImageCopyRotated(gdImageStruct *, gdImageStruct *, double, double, int, int, int, int, int);
extern (C) void gdImageCopyResampled(gdImageStruct *, gdImageStruct *, int, int, int, int, int, int, int, int);
extern (C) void gdImageCopyResized(gdImageStruct *, gdImageStruct *, int, int, int, int, int, int, int, int);
extern (C) void gdImageCopyMergeGray(gdImageStruct *, gdImageStruct *, int, int, int, int, int, int, int);
extern (C) void gdImageCopyMerge(gdImageStruct *, gdImageStruct *, int, int, int, int, int, int, int);
extern (C) void gdImageCopy(gdImageStruct *, gdImageStruct *, int, int, int, int, int, int);
extern (C) void gdImageFill(gdImageStruct *, int, int, int);
extern (C) void gdImageFillToBorder(gdImageStruct *, int, int, int, int);
extern (C) void gdImageFilledEllipse(gdImageStruct *, int, int, int, int, int);
extern (C) void gdImageArc(gdImageStruct *, int, int, int, int, int, int, int);
extern (C) void gdImageFilledArc(gdImageStruct *, int, int, int, int, int, int, int, int);
extern (C) void gdImageEllipse(gdImageStruct *, int, int, int, int, int);
extern (C) void * gdImageGd2Ptr(gdImageStruct *, int, int, int *);
extern (C) void * gdImageGdPtr(gdImageStruct *, int *);
extern (C) void * gdImagePngPtrEx(gdImageStruct *, int *, int);
extern (C) void * gdImagePngPtr(gdImageStruct *, int *);
extern (C) void * gdImageGifPtr(gdImageStruct *, int *);
extern (C) void gdImageGd2(gdImageStruct *, _IO_FILE *, int, int);
extern (C) void gdImageGd(gdImageStruct *, _IO_FILE *);
extern (C) void gdImagePngToSink(gdImageStruct *, gdSink *);
extern (C) void * gdImageGifAnimEndPtr(int *);
extern (C) void * gdImageGifAnimAddPtr(gdImageStruct *, int *, int, int, int, int, int, gdImageStruct *);
extern (C) void * gdImageGifAnimBeginPtr(gdImageStruct *, int *, int, int);
extern (C) void gdImageGifAnimEndCtx(gdIOCtx *);
extern (C) void gdImageGifAnimAddCtx(gdImageStruct *, gdIOCtx *, int, int, int, int, int, gdImageStruct *);
extern (C) void gdImageGifAnimBeginCtx(gdImageStruct *, gdIOCtx *, int, int);
extern (C) void gdImageGifAnimEnd(_IO_FILE *);
extern (C) void gdImageGifAnimAdd(gdImageStruct *, _IO_FILE *, int, int, int, int, int, gdImageStruct *);
extern (C) void gdImageGifAnimBegin(gdImageStruct *, _IO_FILE *, int, int);
extern (C) void * gdImageJpegPtr(gdImageStruct *, int *, int);
extern (C) void gdImageJpegCtx(gdImageStruct *, gdIOCtx *, int);
extern (C) void gdImageJpeg(gdImageStruct *, _IO_FILE *, int);
extern (C) void * gdImageWBMPPtr(gdImageStruct *, int *, int);
extern (C) void gdFree(void *);
extern (C) void gdImageWBMPCtx(gdImageStruct *, int, gdIOCtx *);
extern (C) void gdImageWBMP(gdImageStruct *, int, _IO_FILE *);
extern (C) void gdImagePngCtxEx(gdImageStruct *, gdIOCtx *, int);
extern (C) void gdImagePngEx(gdImageStruct *, _IO_FILE *, int);
extern (C) void gdImageGifCtx(gdImageStruct *, gdIOCtx *);
extern (C) void gdImagePngCtx(gdImageStruct *, gdIOCtx *);
extern (C) void gdImagePng(gdImageStruct *, _IO_FILE *);
extern (C) void gdImageGif(gdImageStruct *, _IO_FILE *);
extern (C) void gdImagePaletteCopy(gdImageStruct *, gdImageStruct *);
extern (C) void gdImageColorTransparent(gdImageStruct *, int);
extern (C) void gdImageTrueColorToPalette(gdImageStruct *, int, int);
extern (C) gdImageStruct * gdImageCreatePaletteFromTrueColor(gdImageStruct *, int, int);
extern (C) void gdImageColorDeallocate(gdImageStruct *, int);
extern (C) int gdImageColorResolveAlpha(gdImageStruct *, int, int, int, int);
extern (C) int gdImageColorResolve(gdImageStruct *, int, int, int);
extern (C) int gdImageColorExactAlpha(gdImageStruct *, int, int, int, int);
extern (C) int gdImageColorExact(gdImageStruct *, int, int, int);
extern (C) int gdImageColorClosestHWB(gdImageStruct *, int, int, int);
extern (C) int gdImageColorClosestAlpha(gdImageStruct *, int, int, int, int);
extern (C) int gdImageColorClosest(gdImageStruct *, int, int, int);
extern (C) int gdImageColorAllocateAlpha(gdImageStruct *, int, int, int, int);
extern (C) int gdImageColorAllocate(gdImageStruct *, int, int, int);
extern (C) void gdImageFilledPolygon(gdImageStruct *, gdPoint *, int, int);
extern (C) void gdImageOpenPolygon(gdImageStruct *, gdPoint *, int, int);
extern (C) void gdImagePolygon(gdImageStruct *, gdPoint *, int, int);
extern (C) char * gdImageStringFTEx(gdImageStruct *, int *, int, char *, double, double, int, int, char *, gdFTStringExtra *);
extern (C) int gdFTUseFontConfig(int);
extern (C) char * gdImageStringFT(gdImageStruct *, int *, int, char *, double, double, int, int, char *);
extern (C) char * gdImageStringTTF(gdImageStruct *, int *, int, char *, double, double, int, int, char *);
extern (C) void gdFreeFontCache();
extern (C) void gdFontCacheShutdown();
extern (C) int gdFontCacheSetup();
extern (C) void gdImageStringUp16(gdImageStruct *, gdFont *, int, int, ushort *, int);
extern (C) void gdImageString16(gdImageStruct *, gdFont *, int, int, ushort *, int);
extern (C) void gdImageStringUp(gdImageStruct *, gdFont *, int, int, char *, int);
extern (C) void gdImageString(gdImageStruct *, gdFont *, int, int, char *, int);
extern (C) void gdImageCharUp(gdImageStruct *, gdFont *, int, int, int, int);
extern (C) void gdImageChar(gdImageStruct *, gdFont *, int, int, int, int);
extern (C) int gdImageBoundsSafe(gdImageStruct *, int, int);
extern (C) void gdImageGetClip(gdImageStruct *, int *, int *, int *, int *);
extern (C) void gdImageSetClip(gdImageStruct *, int, int, int, int);
extern (C) void gdImageFilledRectangle(gdImageStruct *, int, int, int, int, int);
extern (C) void gdImageRectangle(gdImageStruct *, int, int, int, int, int);
extern (C) void gdImageDashedLine(gdImageStruct *, int, int, int, int, int);
extern (C) void gdImageLine(gdImageStruct *, int, int, int, int, int);
extern (C) void gdImageAABlend(gdImageStruct *);
extern (C) int gdImageGetTrueColorPixel(gdImageStruct *, int, int);
extern (C) int gdImageGetPixel(gdImageStruct *, int, int);
extern (C) void gdImageSetPixel(gdImageStruct *, int, int, int);
extern (C) void gdImageDestroy(gdImageStruct *);
extern (C) gdImageStruct * gdImageCreateFromXpm(char *);
extern (C) gdImageStruct * gdImageCreateFromXbm(_IO_FILE *);
extern (C) gdImageStruct * gdImageCreateFromGd2PartPtr(int, void *, int, int, int, int);
extern (C) gdImageStruct * gdImageCreateFromGd2PartCtx(gdIOCtx *, int, int, int, int);
extern (C) gdImageStruct * gdImageCreateFromGd2Part(_IO_FILE *, int, int, int, int);
extern (C) gdImageStruct * gdImageCreateFromGd2Ptr(int, void *);
extern (C) gdImageStruct * gdImageCreateFromGd2Ctx(gdIOCtx *);
extern (C) gdImageStruct * gdImageCreateFromGd2(_IO_FILE *);
extern (C) gdImageStruct * gdImageCreateFromGdPtr(int, void *);
extern (C) gdImageStruct * gdImageCreateFromGdCtx(gdIOCtx *);
extern (C) gdImageStruct * gdImageCreateFromGd(_IO_FILE *);
extern (C) gdImageStruct * gdImageCreateFromPngSource(gdSource *);
extern (C) gdImageStruct * gdImageCreateFromJpegPtr(int, void *);
extern (C) gdImageStruct * gdImageCreateFromJpegCtx(gdIOCtx *);
extern (C) gdImageStruct * gdImageCreateFromJpeg(_IO_FILE *);
extern (C) gdImageStruct * gdImageCreateFromWBMPPtr(int, void *);
extern (C) gdImageStruct * gdImageCreateFromWBMPCtx(gdIOCtx *);
extern (C) gdImageStruct * gdImageCreateFromWBMP(_IO_FILE *);
extern (C) gdImageStruct * gdImageCreateFromGifPtr(int, void *);
extern (C) gdImageStruct * gdImageCreateFromGifCtx(gdIOCtx *);
extern (C) gdImageStruct * gdImageCreateFromGif(_IO_FILE *);
extern (C) gdImageStruct * gdImageCreateFromPngPtr(int, void *);
extern (C) gdImageStruct * gdImageCreateFromPngCtx(gdIOCtx *);
extern (C) gdImageStruct * gdImageCreateFromPng(_IO_FILE *);
extern (C) gdImageStruct * gdImageCreateTrueColor(int, int);
extern (C) gdImageStruct * gdImageCreate(int, int);
extern (C) int gdAlphaBlend(int, int);
extern (C) int gdTell(gdIOCtx *);
extern (C) int gdSeek(gdIOCtx *, int);
extern (C) int gdGetInt(int *, gdIOCtx *);
extern (C) int gdGetWord(int *, gdIOCtx *);
extern (C) int gdGetByte(int *, gdIOCtx *);
extern (C) int gdGetBuf(void *, int, gdIOCtx *);
extern (C) int gdGetC(gdIOCtx *);
extern (C) void gdPutInt(int, gdIOCtx *);
extern (C) void gdPutWord(int, gdIOCtx *);
extern (C) int gdPutBuf(void *, int, gdIOCtx *);
extern (C) void gdPutC(char, gdIOCtx *);
extern (C) void Putchar(int, gdIOCtx *);
extern (C) void Putword(int, gdIOCtx *);
alias int function(void *) _BCD_func__294;
alias int function(void *, long *, int) _BCD_func__296;
alias int function(void *, char *, uint) _BCD_func__298;
alias int function(void *, char *, uint) _BCD_func__300;
alias void function(void *) _BCD_func__685;
alias int function(void * *, char *) _BCD_func__686;
alias int function(char *, char * * *, uint *) _BCD_func__687;
alias int function(void *, char *, char *, char *, char *) _BCD_func__688;
struct gdSink {
_BCD_func__829 sink;
void * context;
}
struct gdPoint {
int x;
int y;
}
struct gdFTStringExtra {
int flags;
double linespacing;
int charmap;
int hdpi;
int vdpi;
char * xshow;
char * fontpath;
}
struct gdSource {
_BCD_func__833 source;
void * context;
}
struct gdFont {
int nchars;
int offset;
int w;
int h;
char * data;
}
struct gdImageStruct {
char * * pixels;
int sx;
int sy;
int colorsTotal;
int [256] red;
int [256] green;
int [256] blue;
int [256] open;
int transparent;
int * polyInts;
int polyAllocated;
gdImageStruct * brush;
gdImageStruct * tile;
int [256] brushColorMap;
int [256] tileColorMap;
int styleLength;
int stylePos;
int * style;
int interlace;
int thick;
int [256] alpha;
int trueColor;
int * * tpixels;
int alphaBlendingFlag;
int saveAlphaFlag;
int AA;
int AA_color;
int AA_dont_blend;
int cx1;
int cy1;
int cx2;
int cy2;
}
struct gdIOCtx {
_BCD_func__837 getC;
_BCD_func__838 getBuf;
_BCD_func__839 putC;
_BCD_func__840 putBuf;
_BCD_func__841 seek;
_BCD_func__842 tell;
_BCD_func__843 gd_free;
}
extern (C) gdFont * gdFontGiant;
