/* THIS FILE GENERATED BY bcd.gen */
module bcd.xlib.Xutil;
import bcd.xlib.Xlib;
align(4):
const int NoValue = 0x0000;
const int XValue = 0x0001;
const int YValue = 0x0002;
const int WidthValue = 0x0004;
const int HeightValue = 0x0008;
const int AllValues = 0x000F;
const int XNegative = 0x0010;
const int YNegative = 0x0020;
const int WithdrawnState = 0;
const int NormalState = 1;
const int IconicState = 3;
const int DontCareState = 0;
const int ZoomState = 2;
const int InactiveState = 4;
const int XNoMemory = -1;
const int XLocaleNotSupported = -2;
const int XConverterNotFound = -3;
const int RectangleOut = 0;
const int RectangleIn = 1;
const int RectanglePart = 2;
const int VisualNoMask = 0x0;
const int VisualIDMask = 0x1;
const int VisualScreenMask = 0x2;
const int VisualDepthMask = 0x4;
const int VisualClassMask = 0x8;
const int VisualRedMaskMask = 0x10;
const int VisualGreenMaskMask = 0x20;
const int VisualBlueMaskMask = 0x40;
const int VisualColormapSizeMask = 0x80;
const int VisualBitsPerRGBMask = 0x100;
const int VisualAllMask = 0x1FF;
const int BitmapSuccess = 0;
const int BitmapOpenFailed = 1;
const int BitmapFileInvalid = 2;
const int BitmapNoMemory = 3;
const int XCSUCCESS = 0;
const int XCNOMEM = 1;
const int XCNOENT = 2;
alias int XContext;
alias void * Region;
alias _XComposeStatus XComposeStatus;
enum XICCEncodingStyle {
XStringStyle=0,
XCompoundTextStyle=1,
XTextStyle=2,
XStdICCTextStyle=3,
XUTF8StringStyle=4,
}
extern (C) int XXorRegion(void *, void *, void *);
extern (C) int XWMGeometry(void *, int, char *, char *, uint, XSizeHints *, int *, int *, int *, int *, int *);
extern (C) int XUnionRegion(void *, void *, void *);
extern (C) int XUnionRectWithRegion(XRectangle *, void *, void *);
extern (C) int Xutf8TextPropertyToTextList(void *, XTextProperty *, char * * *, int *);
extern (C) int XwcTextPropertyToTextList(void *, XTextProperty *, wchar * * *, int *);
extern (C) int XmbTextPropertyToTextList(void *, XTextProperty *, char * * *, int *);
extern (C) int XTextPropertyToStringList(XTextProperty *, char * * *, int *);
extern (C) void XwcFreeStringList(wchar * *);
extern (C) int Xutf8TextListToTextProperty(void *, char * *, int, int, XTextProperty *);
extern (C) int XwcTextListToTextProperty(void *, wchar * *, int, int, XTextProperty *);
extern (C) int XmbTextListToTextProperty(void *, char * *, int, int, XTextProperty *);
extern (C) int XSubtractRegion(void *, void *, void *);
extern (C) int XStringListToTextProperty(char * *, int, XTextProperty *);
extern (C) int XShrinkRegion(void *, int, int);
extern (C) int XSetZoomHints(void *, uint, XSizeHints *);
extern (C) void XSetStandardColormap(void *, uint, XStandardColormap *, uint);
extern (C) int XSetRegion(void *, void *, void *);
extern (C) void XSetWMSizeHints(void *, uint, XSizeHints *, uint);
extern (C) void Xutf8SetWMProperties(void *, uint, char *, char *, char * *, int, XSizeHints *, XWMHints *, XClassHint *);
extern (C) void XmbSetWMProperties(void *, uint, char *, char *, char * *, int, XSizeHints *, XWMHints *, XClassHint *);
extern (C) void XSetWMProperties(void *, uint, XTextProperty *, XTextProperty *, char * *, int, XSizeHints *, XWMHints *, XClassHint *);
extern (C) void XSetWMNormalHints(void *, uint, XSizeHints *);
extern (C) void XSetWMName(void *, uint, XTextProperty *);
extern (C) void XSetWMIconName(void *, uint, XTextProperty *);
extern (C) int XSetWMHints(void *, uint, XWMHints *);
extern (C) void XSetWMClientMachine(void *, uint, XTextProperty *);
extern (C) void XSetTextProperty(void *, uint, XTextProperty *, uint);
extern (C) int XSetStandardProperties(void *, uint, char *, char *, uint, char * *, int, XSizeHints *);
extern (C) int XSetSizeHints(void *, uint, XSizeHints *, uint);
extern (C) void XSetRGBColormaps(void *, uint, XStandardColormap *, int, uint);
extern (C) int XSetNormalHints(void *, uint, XSizeHints *);
extern (C) int XSetIconSizes(void *, uint, XIconSize *, int);
extern (C) int XSetClassHint(void *, uint, XClassHint *);
extern (C) int XSaveContext(void *, uint, int, char *);
extern (C) int XRectInRegion(void *, int, int, uint, uint);
extern (C) void * XPolygonRegion(XPoint *, int, int);
extern (C) int XPointInRegion(void *, int, int);
extern (C) int XOffsetRegion(void *, int, int);
extern (C) int XMatchVisualInfo(void *, int, int, int, XVisualInfo *);
extern (C) int XLookupString(XKeyEvent *, char *, int, uint *, _XComposeStatus *);
extern (C) void XConvertCase(uint, uint *, uint *);
extern (C) int XIntersectRegion(void *, void *, void *);
extern (C) int XGetZoomHints(void *, uint, XSizeHints *);
extern (C) int XGetWMSizeHints(void *, uint, XSizeHints *, int *, uint);
extern (C) int XGetWMNormalHints(void *, uint, XSizeHints *, int *);
extern (C) int XGetWMName(void *, uint, XTextProperty *);
extern (C) int XGetWMIconName(void *, uint, XTextProperty *);
extern (C) XWMHints * XGetWMHints(void *, uint);
extern (C) int XGetWMClientMachine(void *, uint, XTextProperty *);
extern (C) XVisualInfo * XGetVisualInfo(void *, int, XVisualInfo *, int *);
extern (C) int XGetTextProperty(void *, uint, XTextProperty *, uint);
extern (C) int XGetStandardColormap(void *, uint, XStandardColormap *, uint);
extern (C) int XGetSizeHints(void *, uint, XSizeHints *, uint);
extern (C) int XGetRGBColormaps(void *, uint, XStandardColormap * *, int *, uint);
extern (C) int XGetNormalHints(void *, uint, XSizeHints *);
extern (C) int XGetIconSizes(void *, uint, XIconSize * *, int *);
extern (C) int XGetClassHint(void *, uint, XClassHint *);
extern (C) int XFindContext(void *, uint, int, char * *);
extern (C) int XEqualRegion(void *, void *);
extern (C) int XEmptyRegion(void *);
extern (C) int XDestroyRegion(void *);
extern (C) int XDeleteContext(void *, uint, int);
extern (C) char * XDefaultString();
extern (C) void * XCreateRegion();
extern (C) int XClipBox(void *, XRectangle *);
extern (C) XWMHints * XAllocWMHints();
extern (C) XStandardColormap * XAllocStandardColormap();
extern (C) XSizeHints * XAllocSizeHints();
extern (C) XIconSize * XAllocIconSize();
extern (C) XClassHint * XAllocClassHint();
alias void function(void *, char *, int, int, char * *) _BCD_func__1032;
alias int function(void *) _BCD_func__1074;
alias int function(void *, XErrorEvent *) _BCD_func__1075;
alias void function(void *, char *, char *) _BCD_func__1148;
alias int function(void *, char *, char *) _BCD_func__1149;
alias void function(void *, char *, char *) _BCD_func__1150;
struct XStandardColormap {
uint colormap;
uint red_max;
uint red_mult;
uint green_max;
uint green_mult;
uint blue_max;
uint blue_mult;
uint base_pixel;
uint visualid;
uint killid;
}
struct XVisualInfo {
Visual * visual;
uint visualid;
int screen;
int depth;
int c_class;
uint red_mask;
uint green_mask;
uint blue_mask;
int colormap_size;
int bits_per_rgb;
}
struct _XComposeStatus {
char * compose_ptr;
int chars_matched;
}
struct XClassHint {
char * res_name;
char * res_class;
}
struct XIconSize {
int min_width;
int min_height;
int max_width;
int max_height;
int width_inc;
int height_inc;
}
struct XTextProperty {
char * value;
uint encoding;
int format;
uint nitems;
}
struct XWMHints {
int flags;
int input;
int initial_state;
uint icon_pixmap;
uint icon_window;
int icon_x;
int icon_y;
uint icon_mask;
uint window_group;
}
struct N10XSizeHints4__89E {
int x;
int y;
}
struct XSizeHints {
int flags;
int x;
int y;
int width;
int height;
int min_width;
int min_height;
int max_width;
int max_height;
int width_inc;
int height_inc;
N10XSizeHints4__89E min_aspect;
N10XSizeHints4__89E max_aspect;
int base_width;
int base_height;
int win_gravity;
}