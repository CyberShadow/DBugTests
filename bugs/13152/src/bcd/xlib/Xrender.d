/* THIS FILE GENERATED BY bcd.gen */
module bcd.xlib.Xrender;
import bcd.xlib.Xlib;
align(4):
const int PictStandardARGB32 = 0;
const int PictStandardRGB24 = 1;
const int PictStandardA8 = 2;
const int PictStandardA4 = 3;
const int PictStandardA1 = 4;
const int PictStandardNUM = 5;
alias _XConicalGradient XConicalGradient;
alias _XPointFixed XPointFixed;
alias int XFixed;
alias _XRadialGradient XRadialGradient;
alias _XCircle XCircle;
alias _XLinearGradient XLinearGradient;
alias _XTrap XTrap;
alias _XSpanFix XSpanFix;
alias _XAnimCursor XAnimCursor;
alias _XIndexValue XIndexValue;
alias _XFilters XFilters;
alias _XTransform XTransform;
alias _XTrapezoid XTrapezoid;
alias _XLineFixed XLineFixed;
alias _XTriangle XTriangle;
alias _XPointDouble XPointDouble;
alias double XDouble;
alias _XGlyphElt32 XGlyphElt32;
alias _XGlyphElt16 XGlyphElt16;
alias _XGlyphElt8 XGlyphElt8;
alias _XGlyphInfo XGlyphInfo;
alias _XRenderPictureAttributes XRenderPictureAttributes;
extern (C) uint XRenderCreateConicalGradient(void *, _XConicalGradient *, int *, XRenderColor *, int);
extern (C) uint XRenderCreateRadialGradient(void *, _XRadialGradient *, int *, XRenderColor *, int);
extern (C) uint XRenderCreateLinearGradient(void *, _XLinearGradient *, int *, XRenderColor *, int);
extern (C) uint XRenderCreateSolidFill(void *, XRenderColor *);
extern (C) void XRenderAddTraps(void *, uint, int, int, _XTrap *, int);
extern (C) uint XRenderCreateAnimCursor(void *, int, _XAnimCursor *);
extern (C) void XRenderSetPictureFilter(void *, uint, char *, int *, int);
extern (C) _XFilters * XRenderQueryFilters(void *, uint);
extern (C) uint XRenderCreateCursor(void *, uint, uint, uint);
extern (C) int XRenderParseColor(void *, char *, XRenderColor *);
extern (C) void XRenderCompositeDoublePoly(void *, int, uint, uint, XRenderPictFormat *, int, int, int, int, _XPointDouble *, int, int);
extern (C) void XRenderCompositeTriFan(void *, int, uint, uint, XRenderPictFormat *, int, int, _XPointFixed *, int);
extern (C) void XRenderCompositeTriStrip(void *, int, uint, uint, XRenderPictFormat *, int, int, _XPointFixed *, int);
extern (C) void XRenderCompositeTriangles(void *, int, uint, uint, XRenderPictFormat *, int, int, _XTriangle *, int);
extern (C) void XRenderCompositeTrapezoids(void *, int, uint, uint, XRenderPictFormat *, int, int, _XTrapezoid *, int);
extern (C) void XRenderFillRectangles(void *, int, uint, XRenderColor *, XRectangle *, int);
extern (C) void XRenderFillRectangle(void *, int, uint, XRenderColor *, int, int, uint, uint);
extern (C) void XRenderCompositeText32(void *, int, uint, uint, XRenderPictFormat *, int, int, int, int, _XGlyphElt32 *, int);
extern (C) void XRenderCompositeText16(void *, int, uint, uint, XRenderPictFormat *, int, int, int, int, _XGlyphElt16 *, int);
extern (C) void XRenderCompositeText8(void *, int, uint, uint, XRenderPictFormat *, int, int, int, int, _XGlyphElt8 *, int);
extern (C) void XRenderCompositeString32(void *, int, uint, uint, XRenderPictFormat *, uint, int, int, int, int, uint *, int);
extern (C) void XRenderCompositeString16(void *, int, uint, uint, XRenderPictFormat *, uint, int, int, int, int, ushort *, int);
extern (C) void XRenderCompositeString8(void *, int, uint, uint, XRenderPictFormat *, uint, int, int, int, int, char *, int);
extern (C) void XRenderFreeGlyphs(void *, uint, uint *, int);
extern (C) void XRenderAddGlyphs(void *, uint, uint *, _XGlyphInfo *, int, char *, int);
extern (C) void XRenderFreeGlyphSet(void *, uint);
extern (C) uint XRenderReferenceGlyphSet(void *, uint);
extern (C) uint XRenderCreateGlyphSet(void *, XRenderPictFormat *);
extern (C) void XRenderComposite(void *, int, uint, uint, uint, int, int, int, int, int, int, uint, uint);
extern (C) void XRenderFreePicture(void *, uint);
extern (C) void XRenderSetPictureTransform(void *, uint, _XTransform *);
extern (C) void XRenderSetPictureClipRegion(void *, uint, void *);
extern (C) void XRenderSetPictureClipRectangles(void *, uint, int, int, XRectangle *, int);
extern (C) void XRenderChangePicture(void *, uint, uint, _XRenderPictureAttributes *);
extern (C) uint XRenderCreatePicture(void *, uint, XRenderPictFormat *, uint, _XRenderPictureAttributes *);
extern (C) _XIndexValue * XRenderQueryPictIndexValues(void *, XRenderPictFormat *, int *);
extern (C) XRenderPictFormat * XRenderFindStandardFormat(void *, int);
extern (C) XRenderPictFormat * XRenderFindFormat(void *, uint, XRenderPictFormat *, int);
extern (C) XRenderPictFormat * XRenderFindVisualFormat(void *, Visual *);
extern (C) int XRenderSetSubpixelOrder(void *, int, int);
extern (C) int XRenderQuerySubpixelOrder(void *, int);
extern (C) int XRenderQueryFormats(void *);
extern (C) int XRenderQueryVersion(void *, int *, int *);
extern (C) int XRenderQueryExtension(void *, int *, int *);
alias void function(void *, char *, int, int, char * *) _BCD_func__1290;
alias int function(void *) _BCD_func__1332;
alias int function(void *, XErrorEvent *) _BCD_func__1333;
alias void function(void *, char *, char *) _BCD_func__1406;
alias int function(void *, char *, char *) _BCD_func__1407;
alias void function(void *, char *, char *) _BCD_func__1408;
struct _XConicalGradient {
_XPointFixed center;
int angle;
}
struct _XRadialGradient {
_XCircle inner;
_XCircle outer;
}
struct _XLinearGradient {
_XPointFixed p1;
_XPointFixed p2;
}
struct _XTrap {
_XSpanFix top;
_XSpanFix bottom;
}
struct _XSpanFix {
int left;
int right;
int y;
}
struct _XAnimCursor {
uint cursor;
uint delay;
}
struct _XIndexValue {
uint pixel;
ushort red;
ushort green;
ushort blue;
ushort alpha;
}
struct _XFilters {
int nfilter;
char * * filter;
int nalias;
short * alias_;
}
struct _XTransform {
int [3] [3] matrix;
}
struct _XTrapezoid {
int top;
int bottom;
_XLineFixed left;
_XLineFixed right;
}
struct _XCircle {
int x;
int y;
int radius;
}
struct _XTriangle {
_XPointFixed p1;
_XPointFixed p2;
_XPointFixed p3;
}
struct _XLineFixed {
_XPointFixed p1;
_XPointFixed p2;
}
struct _XPointFixed {
int x;
int y;
}
struct _XPointDouble {
double x;
double y;
}
struct _XGlyphElt32 {
uint glyphset;
uint * chars;
int nchars;
int xOff;
int yOff;
}
struct _XGlyphElt16 {
uint glyphset;
ushort * chars;
int nchars;
int xOff;
int yOff;
}
struct _XGlyphElt8 {
uint glyphset;
char * chars;
int nchars;
int xOff;
int yOff;
}
struct _XGlyphInfo {
ushort width;
ushort height;
short x;
short y;
short xOff;
short yOff;
}
struct XRenderColor {
ushort red;
ushort green;
ushort blue;
ushort alpha;
}
struct _XRenderPictureAttributes {
int repeat;
uint alpha_map;
int alpha_x_origin;
int alpha_y_origin;
int clip_x_origin;
int clip_y_origin;
uint clip_mask;
int graphics_exposures;
int subwindow_mode;
int poly_edge;
int poly_mode;
uint dither;
int component_alpha;
}
struct XRenderPictFormat {
uint id;
int type;
int depth;
XRenderDirectFormat direct;
uint colormap;
}
struct XRenderDirectFormat {
short red;
short redMask;
short green;
short greenMask;
short blue;
short blueMask;
short alpha;
short alphaMask;
}
