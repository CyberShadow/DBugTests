/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.MultiImage;
align(4):
public import bcd.bind;
public import bcd.fltk2.Symbol;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.PixelType;
public import bcd.fltk2.Rectangle;
public import bcd.fltk2.Color;
public import bcd.fltk2.Flags;
extern (C) void _BCD_delete_N4fltk10MultiImageE(void *);
extern (C) void _BCD__ZNK4fltk10MultiImage8_measureERiS1_(void *This, int *, int *);
extern (C) void _BCD__ZNK4fltk10MultiImage5_drawERKNS_9RectangleE(void *This, void *);
extern (C) Symbol * _BCD__ZNK4fltk10MultiImage13current_imageEv(void *This);
extern (C) void _BCD__ZNK4fltk10MultiImage5insetERNS_9RectangleE(void *This, void *);
extern (C) bool _BCD__ZNK4fltk10MultiImage15fills_rectangleEv(void *This);
extern (C) bool _BCD__ZNK4fltk10MultiImage8is_frameEv(void *This);
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1Ev();
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1EjPKNS_6SymbolEPc(uint, void *, char *);
extern (C) void _BCD__ZN4fltk10MultiImage3setEjPKNS_6SymbolEz(void *This, uint, void *);
extern (C) void _BCD__ZN4fltk10MultiImage3addEiRKNS_6SymbolE(void *This, int, void *);
extern (C) void _BCD__ZN4fltk10MultiImage7releaseEv(void *This);
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolE(void *);
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_(void *, int, void *);
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_(void *, int, void *, int, void *);
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3_(void *, int, void *, int, void *, int, void *);
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3_iS3_(void *, int, void *, int, void *, int, void *, int, void *);
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3_iS3_iS3_(void *, int, void *, int, void *, int, void *, int, void *, int, void *);
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3_iS3_iS3_iS3_(void *, int, void *, int, void *, int, void *, int, void *, int, void *, int, void *);
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3_iS3_iS3_iS3_iS3_(void *, int, void *, int, void *, int, void *, int, void *, int, void *, int, void *, int, void *);
extern (C) void _BCD_RI_N4fltk10MultiImageE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk10MultiImageE__MultiImage_R(void *This);
extern (C) int _BCD_R__ZNK4fltk10MultiImage8_measureERiS1___MultiImage_R_CHECK(MultiImage_R x) {
union dp {
void delegate(int *, int *) d;
struct { void *o; void *f; }
}
dp d; d.d = &x._measure;
return cast(int) (d.f != &MultiImage._measure);
}
extern (C) void _BCD_R__ZNK4fltk10MultiImage8_measureERiS1___MultiImage_R(MultiImage_R __D_class, int * _0, int * _1) {
__D_class._measure(_0, _1);
}
extern (C) int _BCD_R__ZNK4fltk10MultiImage5_drawERKNS_9RectangleE__MultiImage_R_CHECK(MultiImage_R x) {
union dp {
void delegate(Rectangle) d;
struct { void *o; void *f; }
}
dp d; d.d = &x._draw;
return cast(int) (d.f != &MultiImage._draw);
}
extern (C) void _BCD_R__ZNK4fltk10MultiImage5_drawERKNS_9RectangleE__MultiImage_R(MultiImage_R __D_class, void *_0) {
__D_class._draw(cast(Rectangle) new Rectangle(cast(ifloat) 0, _0));
}
extern (C) int _BCD_R__ZNK4fltk10MultiImage5insetERNS_9RectangleE__MultiImage_R_CHECK(MultiImage_R x) {
union dp {
void delegate(Rectangle) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.inset;
return cast(int) (d.f != &MultiImage.inset);
}
extern (C) void _BCD_R__ZNK4fltk10MultiImage5insetERNS_9RectangleE__MultiImage_R(MultiImage_R __D_class, void *_0) {
__D_class.inset(cast(Rectangle) new Rectangle(cast(ifloat) 0, _0));
}
extern (C) int _BCD_R__ZNK4fltk10MultiImage15fills_rectangleEv__MultiImage_R_CHECK(MultiImage_R x) {
union dp {
bool delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.fills_rectangle;
return cast(int) (d.f != &MultiImage.fills_rectangle);
}
extern (C) bool _BCD_R__ZNK4fltk10MultiImage15fills_rectangleEv__MultiImage_R(MultiImage_R __D_class, ) {
return __D_class.fills_rectangle();
}
extern (C) int _BCD_R__ZNK4fltk10MultiImage8is_frameEv__MultiImage_R_CHECK(MultiImage_R x) {
union dp {
bool delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.is_frame;
return cast(int) (d.f != &MultiImage.is_frame);
}
extern (C) bool _BCD_R__ZNK4fltk10MultiImage8is_frameEv__MultiImage_R(MultiImage_R __D_class, ) {
return __D_class.is_frame();
}
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1Ev_R();
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1EjPKNS_6SymbolEPc_R(uint, void *, char *);
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolE_R(void *);
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3__R(void *, int, void *);
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3__R(void *, int, void *, int, void *);
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3__R(void *, int, void *, int, void *, int, void *);
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3_iS3__R(void *, int, void *, int, void *, int, void *, int, void *);
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3_iS3_iS3__R(void *, int, void *, int, void *, int, void *, int, void *, int, void *);
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3_iS3_iS3_iS3__R(void *, int, void *, int, void *, int, void *, int, void *, int, void *, int, void *);
extern (C) void *_BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3_iS3_iS3_iS3_iS3__R(void *, int, void *, int, void *, int, void *, int, void *, int, void *, int, void *, int, void *);
class MultiImage : Symbol {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk10MultiImageE(__C_data);
__C_data = null;
}
void _measure(int * _0, int * _1) {
_BCD__ZNK4fltk10MultiImage8_measureERiS1_(__C_data, _0, _1);
}
void _draw(Rectangle _0) {
_BCD__ZNK4fltk10MultiImage5_drawERKNS_9RectangleE(__C_data, _0.__C_data);
}
Symbol * current_image() {
return _BCD__ZNK4fltk10MultiImage13current_imageEv(__C_data);
}
void inset(Rectangle _0) {
_BCD__ZNK4fltk10MultiImage5insetERNS_9RectangleE(__C_data, _0.__C_data);
}
bool fills_rectangle() {
return _BCD__ZNK4fltk10MultiImage15fills_rectangleEv(__C_data);
}
bool is_frame() {
return _BCD__ZNK4fltk10MultiImage8is_frameEv(__C_data);
}
this() {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1Ev();
__C_data_owned = true;
}
this(uint count, Symbol * img0, char * ap) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1EjPKNS_6SymbolEPc(count, img0.__C_data, ap);
__C_data_owned = true;
}
void set(uint count, Symbol * img0) {
_BCD__ZN4fltk10MultiImage3setEjPKNS_6SymbolEz(__C_data, count, img0.__C_data);
}
void add(int flags, Symbol image) {
_BCD__ZN4fltk10MultiImage3addEiRKNS_6SymbolE(__C_data, flags, image.__C_data);
}
void release() {
_BCD__ZN4fltk10MultiImage7releaseEv(__C_data);
}
this(Symbol img0) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolE(img0.__C_data);
__C_data_owned = true;
}
this(Symbol img0, int f1, Symbol img1) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_(img0.__C_data, f1, img1.__C_data);
__C_data_owned = true;
}
this(Symbol img0, int f1, Symbol img1, int f2, Symbol img2) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_(img0.__C_data, f1, img1.__C_data, f2, img2.__C_data);
__C_data_owned = true;
}
this(Symbol img0, int f1, Symbol img1, int f2, Symbol img2, int f3, Symbol img3) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3_(img0.__C_data, f1, img1.__C_data, f2, img2.__C_data, f3, img3.__C_data);
__C_data_owned = true;
}
this(Symbol img0, int f1, Symbol img1, int f2, Symbol img2, int f3, Symbol img3, int f4, Symbol img4) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3_iS3_(img0.__C_data, f1, img1.__C_data, f2, img2.__C_data, f3, img3.__C_data, f4, img4.__C_data);
__C_data_owned = true;
}
this(Symbol img0, int f1, Symbol img1, int f2, Symbol img2, int f3, Symbol img3, int f4, Symbol img4, int f5, Symbol img5) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3_iS3_iS3_(img0.__C_data, f1, img1.__C_data, f2, img2.__C_data, f3, img3.__C_data, f4, img4.__C_data, f5, img5.__C_data);
__C_data_owned = true;
}
this(Symbol img0, int f1, Symbol img1, int f2, Symbol img2, int f3, Symbol img3, int f4, Symbol img4, int f5, Symbol img5, int f6, Symbol img6) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3_iS3_iS3_iS3_(img0.__C_data, f1, img1.__C_data, f2, img2.__C_data, f3, img3.__C_data, f4, img4.__C_data, f5, img5.__C_data, f6, img6.__C_data);
__C_data_owned = true;
}
this(Symbol img0, int f1, Symbol img1, int f2, Symbol img2, int f3, Symbol img3, int f4, Symbol img4, int f5, Symbol img5, int f6, Symbol img6, int f7, Symbol img7) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3_iS3_iS3_iS3_iS3_(img0.__C_data, f1, img1.__C_data, f2, img2.__C_data, f3, img3.__C_data, f4, img4.__C_data, f5, img5.__C_data, f6, img6.__C_data, f7, img7.__C_data);
__C_data_owned = true;
}
}
class MultiImage_R : MultiImage {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk10MultiImageE__MultiImage_R(__C_data);
__C_data = null;
}
this() {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1Ev_R();
__C_data_owned = true;
_BCD_RI_N4fltk10MultiImageE(__C_data, cast(void *) this);
}
this(uint count, Symbol * img0, char * ap) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1EjPKNS_6SymbolEPc_R(count, img0.__C_data, ap);
__C_data_owned = true;
_BCD_RI_N4fltk10MultiImageE(__C_data, cast(void *) this);
}
this(Symbol img0) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolE_R(img0.__C_data);
__C_data_owned = true;
_BCD_RI_N4fltk10MultiImageE(__C_data, cast(void *) this);
}
this(Symbol img0, int f1, Symbol img1) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3__R(img0.__C_data, f1, img1.__C_data);
__C_data_owned = true;
_BCD_RI_N4fltk10MultiImageE(__C_data, cast(void *) this);
}
this(Symbol img0, int f1, Symbol img1, int f2, Symbol img2) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3__R(img0.__C_data, f1, img1.__C_data, f2, img2.__C_data);
__C_data_owned = true;
_BCD_RI_N4fltk10MultiImageE(__C_data, cast(void *) this);
}
this(Symbol img0, int f1, Symbol img1, int f2, Symbol img2, int f3, Symbol img3) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3__R(img0.__C_data, f1, img1.__C_data, f2, img2.__C_data, f3, img3.__C_data);
__C_data_owned = true;
_BCD_RI_N4fltk10MultiImageE(__C_data, cast(void *) this);
}
this(Symbol img0, int f1, Symbol img1, int f2, Symbol img2, int f3, Symbol img3, int f4, Symbol img4) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3_iS3__R(img0.__C_data, f1, img1.__C_data, f2, img2.__C_data, f3, img3.__C_data, f4, img4.__C_data);
__C_data_owned = true;
_BCD_RI_N4fltk10MultiImageE(__C_data, cast(void *) this);
}
this(Symbol img0, int f1, Symbol img1, int f2, Symbol img2, int f3, Symbol img3, int f4, Symbol img4, int f5, Symbol img5) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3_iS3_iS3__R(img0.__C_data, f1, img1.__C_data, f2, img2.__C_data, f3, img3.__C_data, f4, img4.__C_data, f5, img5.__C_data);
__C_data_owned = true;
_BCD_RI_N4fltk10MultiImageE(__C_data, cast(void *) this);
}
this(Symbol img0, int f1, Symbol img1, int f2, Symbol img2, int f3, Symbol img3, int f4, Symbol img4, int f5, Symbol img5, int f6, Symbol img6) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3_iS3_iS3_iS3__R(img0.__C_data, f1, img1.__C_data, f2, img2.__C_data, f3, img3.__C_data, f4, img4.__C_data, f5, img5.__C_data, f6, img6.__C_data);
__C_data_owned = true;
_BCD_RI_N4fltk10MultiImageE(__C_data, cast(void *) this);
}
this(Symbol img0, int f1, Symbol img1, int f2, Symbol img2, int f3, Symbol img3, int f4, Symbol img4, int f5, Symbol img5, int f6, Symbol img6, int f7, Symbol img7) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10MultiImageC1ERKNS_6SymbolEiS3_iS3_iS3_iS3_iS3_iS3_iS3__R(img0.__C_data, f1, img1.__C_data, f2, img2.__C_data, f3, img3.__C_data, f4, img4.__C_data, f5, img5.__C_data, f6, img6.__C_data, f7, img7.__C_data);
__C_data_owned = true;
_BCD_RI_N4fltk10MultiImageE(__C_data, cast(void *) this);
}
}
