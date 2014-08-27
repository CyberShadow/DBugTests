/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.Image;
align(4):
public import bcd.bind;
public import bcd.fltk2.Symbol;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.PixelType;
public import bcd.fltk2.Rectangle;
public import bcd.fltk2.Color;
public import bcd.fltk2.Flags;
extern (C) void _BCD_delete_N4fltk5ImageE(void *);
extern (C) void *_BCD_new__ZN4fltk5ImageC1EPKc(char *);
extern (C) void *_BCD_new__ZN4fltk5ImageC1EiiPKc(int, int, char *);
extern (C) void *_BCD_new__ZN4fltk5ImageC1ENS_9PixelTypeEiiPKc(int, int, int, char *);
extern (C) void *_BCD_new__ZN4fltk5ImageC1EPKhNS_9PixelTypeEii(char *, int, int, int);
extern (C) void *_BCD_new__ZN4fltk5ImageC1EPKhNS_9PixelTypeEiii(char *, int, int, int, int);
extern (C) int _BCD__ZNK4fltk5Image9pixeltypeEv(void *This);
extern (C) int _BCD__ZNK4fltk5Image5depthEv(void *This);
extern (C) int _BCD__ZNK4fltk5Image1wEv(void *This);
extern (C) int _BCD__ZNK4fltk5Image5widthEv(void *This);
extern (C) int _BCD__ZNK4fltk5Image1hEv(void *This);
extern (C) int _BCD__ZNK4fltk5Image6heightEv(void *This);
extern (C) void _BCD__ZN4fltk5Image12setpixeltypeENS_9PixelTypeE(void *This, int);
extern (C) void _BCD__ZN4fltk5Image7setsizeEii(void *This, int, int);
extern (C) void _BCD__ZN4fltk5Image9setpixelsEPKhRKNS_9RectangleEi(void *This, char *, void *, int);
extern (C) void _BCD__ZN4fltk5Image9setpixelsEPKhRKNS_9RectangleE(void *This, char *, void *);
extern (C) void _BCD__ZN4fltk5Image9setpixelsEPKhi(void *This, char *, int);
extern (C) char * _BCD__ZN4fltk5Image10linebufferEi(void *This, int);
extern (C) void _BCD__ZN4fltk5Image8setimageEPKhNS_9PixelTypeEiii(void *This, char *, int, int, int, int);
extern (C) void _BCD__ZN4fltk5Image8setimageEPKhNS_9PixelTypeEii(void *This, char *, int, int, int);
extern (C) char * _BCD__ZN4fltk5Image6bufferEv(void *This);
extern (C) void _BCD__ZN4fltk5Image15set_forceARGB32Ev(void *This);
extern (C) void _BCD__ZN4fltk5Image17clear_forceARGB32Ev(void *This);
extern (C) bool _BCD__ZNK4fltk5Image11forceARGB32Ev(void *This);
extern (C) int _BCD__ZNK4fltk5Image16buffer_pixeltypeEv(void *This);
extern (C) int _BCD__ZNK4fltk5Image12buffer_depthEv(void *This);
extern (C) int _BCD__ZNK4fltk5Image12buffer_widthEv(void *This);
extern (C) int _BCD__ZNK4fltk5Image13buffer_heightEv(void *This);
extern (C) int _BCD__ZNK4fltk5Image16buffer_linedeltaEv(void *This);
extern (C) void _BCD__ZN4fltk5Image14buffer_changedEv(void *This);
extern (C) void _BCD__ZN4fltk5Image7destroyEv(void *This);
extern (C) void _BCD__ZNK4fltk5Image4drawEii(void *This, int, int);
extern (C) void _BCD__ZNK4fltk5Image4drawERKNS_9RectangleE(void *This, void *);
extern (C) void _BCD__ZNK4fltk5Image4drawERKNS_9RectangleES3_(void *This, void *, void *);
extern (C) void _BCD__ZNK4fltk5Image5_drawERKNS_9RectangleE(void *This, void *);
extern (C) void _BCD__ZNK4fltk5Image8_measureERiS1_(void *This, int *, int *);
extern (C) bool _BCD__ZNK4fltk5Image15fills_rectangleEv(void *This);
extern (C) bool _BCD__ZN4fltk5Image5fetchEv(void *This);
extern (C) void _BCD__ZNK4fltk5Image15fetch_if_neededEv(void *This);
extern (C) void _BCD__ZN4fltk5Image7refetchEv(void *This);
extern (C) uint _BCD__ZNK4fltk5Image8mem_usedEv(void *This);
extern (C) uint _BCD__ZN4fltk5Image14total_mem_usedEv();
extern (C) void _BCD__ZN4fltk5Image5labelEPNS_6WidgetE(void *This, void *);
extern (C) void _BCD__ZN4fltk5Image12make_currentEv(void *This);
extern (C) void _BCD_RI_N4fltk5ImageE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk5ImageE__Image_R(void *This);
extern (C) void *_BCD_new__ZN4fltk5ImageC1EPKc_R(char *);
extern (C) void *_BCD_new__ZN4fltk5ImageC1EiiPKc_R(int, int, char *);
extern (C) void *_BCD_new__ZN4fltk5ImageC1ENS_9PixelTypeEiiPKc_R(int, int, int, char *);
extern (C) void *_BCD_new__ZN4fltk5ImageC1EPKhNS_9PixelTypeEii_R(char *, int, int, int);
extern (C) void *_BCD_new__ZN4fltk5ImageC1EPKhNS_9PixelTypeEiii_R(char *, int, int, int, int);
extern (C) int _BCD_R__ZNK4fltk5Image5_drawERKNS_9RectangleE__Image_R_CHECK(Image_R x) {
union dp {
void delegate(Rectangle) d;
struct { void *o; void *f; }
}
dp d; d.d = &x._draw;
return cast(int) (d.f != &Image._draw);
}
extern (C) void _BCD_R__ZNK4fltk5Image5_drawERKNS_9RectangleE__Image_R(Image_R __D_class, void *_0) {
__D_class._draw(cast(Rectangle) new Rectangle(cast(ifloat) 0, _0));
}
extern (C) int _BCD_R__ZNK4fltk5Image8_measureERiS1___Image_R_CHECK(Image_R x) {
union dp {
void delegate(int *, int *) d;
struct { void *o; void *f; }
}
dp d; d.d = &x._measure;
return cast(int) (d.f != &Image._measure);
}
extern (C) void _BCD_R__ZNK4fltk5Image8_measureERiS1___Image_R(Image_R __D_class, int * W, int * H) {
__D_class._measure(W, H);
}
extern (C) int _BCD_R__ZNK4fltk5Image15fills_rectangleEv__Image_R_CHECK(Image_R x) {
union dp {
bool delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.fills_rectangle;
return cast(int) (d.f != &Image.fills_rectangle);
}
extern (C) bool _BCD_R__ZNK4fltk5Image15fills_rectangleEv__Image_R(Image_R __D_class, ) {
return __D_class.fills_rectangle();
}
extern (C) int _BCD_R__ZN4fltk5Image5fetchEv__Image_R_CHECK(Image_R x) {
union dp {
bool delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.fetch;
return cast(int) (d.f != &Image.fetch);
}
extern (C) bool _BCD_R__ZN4fltk5Image5fetchEv__Image_R(Image_R __D_class, ) {
return __D_class.fetch();
}
class Image : Symbol {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk5ImageE(__C_data);
__C_data = null;
}
this(char * name = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk5ImageC1EPKc(name);
__C_data_owned = true;
}
this(int w, int h, char * name = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk5ImageC1EiiPKc(w, h, name);
__C_data_owned = true;
}
this(int p, int w, int h, char * name = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk5ImageC1ENS_9PixelTypeEiiPKc(p, w, h, name);
__C_data_owned = true;
}
this(char * d, int p, int w, int h) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk5ImageC1EPKhNS_9PixelTypeEii(d, p, w, h);
__C_data_owned = true;
}
this(char * d, int p, int w, int h, int linedelta) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk5ImageC1EPKhNS_9PixelTypeEiii(d, p, w, h, linedelta);
__C_data_owned = true;
}
int pixeltype() {
return _BCD__ZNK4fltk5Image9pixeltypeEv(__C_data);
}
int depth() {
return _BCD__ZNK4fltk5Image5depthEv(__C_data);
}
int w() {
return _BCD__ZNK4fltk5Image1wEv(__C_data);
}
int width() {
return _BCD__ZNK4fltk5Image5widthEv(__C_data);
}
int h() {
return _BCD__ZNK4fltk5Image1hEv(__C_data);
}
int height() {
return _BCD__ZNK4fltk5Image6heightEv(__C_data);
}
void setpixeltype(int _0) {
_BCD__ZN4fltk5Image12setpixeltypeENS_9PixelTypeE(__C_data, _0);
}
void setsize(int w, int h) {
_BCD__ZN4fltk5Image7setsizeEii(__C_data, w, h);
}
void setpixels(char * d, Rectangle _1, int linedelta) {
_BCD__ZN4fltk5Image9setpixelsEPKhRKNS_9RectangleEi(__C_data, d, _1.__C_data, linedelta);
}
void setpixels(char * d, Rectangle r) {
_BCD__ZN4fltk5Image9setpixelsEPKhRKNS_9RectangleE(__C_data, d, r.__C_data);
}
void setpixels(char * d, int y) {
_BCD__ZN4fltk5Image9setpixelsEPKhi(__C_data, d, y);
}
char * linebuffer(int y) {
return _BCD__ZN4fltk5Image10linebufferEi(__C_data, y);
}
void setimage(char * d, int p, int w, int h, int linedelta) {
_BCD__ZN4fltk5Image8setimageEPKhNS_9PixelTypeEiii(__C_data, d, p, w, h, linedelta);
}
void setimage(char * d, int p, int w, int h) {
_BCD__ZN4fltk5Image8setimageEPKhNS_9PixelTypeEii(__C_data, d, p, w, h);
}
char * buffer() {
return _BCD__ZN4fltk5Image6bufferEv(__C_data);
}
void set_forceARGB32() {
_BCD__ZN4fltk5Image15set_forceARGB32Ev(__C_data);
}
void clear_forceARGB32() {
_BCD__ZN4fltk5Image17clear_forceARGB32Ev(__C_data);
}
bool forceARGB32() {
return _BCD__ZNK4fltk5Image11forceARGB32Ev(__C_data);
}
int buffer_pixeltype() {
return _BCD__ZNK4fltk5Image16buffer_pixeltypeEv(__C_data);
}
int buffer_depth() {
return _BCD__ZNK4fltk5Image12buffer_depthEv(__C_data);
}
int buffer_width() {
return _BCD__ZNK4fltk5Image12buffer_widthEv(__C_data);
}
int buffer_height() {
return _BCD__ZNK4fltk5Image13buffer_heightEv(__C_data);
}
int buffer_linedelta() {
return _BCD__ZNK4fltk5Image16buffer_linedeltaEv(__C_data);
}
void buffer_changed() {
_BCD__ZN4fltk5Image14buffer_changedEv(__C_data);
}
void destroy() {
_BCD__ZN4fltk5Image7destroyEv(__C_data);
}
void draw(int x, int y) {
_BCD__ZNK4fltk5Image4drawEii(__C_data, x, y);
}
void draw(Rectangle r) {
_BCD__ZNK4fltk5Image4drawERKNS_9RectangleE(__C_data, r.__C_data);
}
void draw(Rectangle from, Rectangle to) {
_BCD__ZNK4fltk5Image4drawERKNS_9RectangleES3_(__C_data, from.__C_data, to.__C_data);
}
void _draw(Rectangle _0) {
_BCD__ZNK4fltk5Image5_drawERKNS_9RectangleE(__C_data, _0.__C_data);
}
void _measure(int * W, int * H) {
_BCD__ZNK4fltk5Image8_measureERiS1_(__C_data, W, H);
}
bool fills_rectangle() {
return _BCD__ZNK4fltk5Image15fills_rectangleEv(__C_data);
}
bool fetch() {
return _BCD__ZN4fltk5Image5fetchEv(__C_data);
}
void fetch_if_needed() {
_BCD__ZNK4fltk5Image15fetch_if_neededEv(__C_data);
}
void refetch() {
_BCD__ZN4fltk5Image7refetchEv(__C_data);
}
uint mem_used() {
return _BCD__ZNK4fltk5Image8mem_usedEv(__C_data);
}
static uint total_mem_used() {
return _BCD__ZN4fltk5Image14total_mem_usedEv();
}
void label(bcd.bind.BoundClass * o) {
_BCD__ZN4fltk5Image5labelEPNS_6WidgetE(__C_data, o.__C_data);
}
void make_current() {
_BCD__ZN4fltk5Image12make_currentEv(__C_data);
}
}
class Image_R : Image {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk5ImageE__Image_R(__C_data);
__C_data = null;
}
this(char * name = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk5ImageC1EPKc_R(name);
__C_data_owned = true;
_BCD_RI_N4fltk5ImageE(__C_data, cast(void *) this);
}
this(int w, int h, char * name = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk5ImageC1EiiPKc_R(w, h, name);
__C_data_owned = true;
_BCD_RI_N4fltk5ImageE(__C_data, cast(void *) this);
}
this(int p, int w, int h, char * name = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk5ImageC1ENS_9PixelTypeEiiPKc_R(p, w, h, name);
__C_data_owned = true;
_BCD_RI_N4fltk5ImageE(__C_data, cast(void *) this);
}
this(char * d, int p, int w, int h) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk5ImageC1EPKhNS_9PixelTypeEii_R(d, p, w, h);
__C_data_owned = true;
_BCD_RI_N4fltk5ImageE(__C_data, cast(void *) this);
}
this(char * d, int p, int w, int h, int linedelta) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk5ImageC1EPKhNS_9PixelTypeEiii_R(d, p, w, h, linedelta);
__C_data_owned = true;
_BCD_RI_N4fltk5ImageE(__C_data, cast(void *) this);
}
}