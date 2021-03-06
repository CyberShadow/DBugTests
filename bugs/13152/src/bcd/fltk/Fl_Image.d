/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_Image;
public import bcd.bind;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_12Fl_RGB_Image(void *);
extern (C) void _BCD_set__ZN12Fl_RGB_Image5arrayE(void *, char *);
extern (C) char * _BCD_get__ZN12Fl_RGB_Image5arrayE(void *);
extern (C) void _BCD_set__ZN12Fl_RGB_Image11alloc_arrayE(void *, int);
extern (C) int _BCD_get__ZN12Fl_RGB_Image11alloc_arrayE(void *);
extern (C) void _BCD_set__ZN12Fl_RGB_Image2idE(void *, uint);
extern (C) uint _BCD_get__ZN12Fl_RGB_Image2idE(void *);
extern (C) void _BCD_set__ZN12Fl_RGB_Image4maskE(void *, uint);
extern (C) uint _BCD_get__ZN12Fl_RGB_Image4maskE(void *);
extern (C) void *_BCD_new__ZN12Fl_RGB_ImageC1EPKhiiii(char *, int, int, int, int);
extern (C) Fl_Image * _BCD__ZN12Fl_RGB_Image4copyEii(void *This, int, int);
extern (C) Fl_Image * _BCD__ZN12Fl_RGB_Image4copyEv(void *This);
extern (C) void _BCD__ZN12Fl_RGB_Image13color_averageE8Fl_Colorf(void *This, int, float);
extern (C) void _BCD__ZN12Fl_RGB_Image10desaturateEv(void *This);
extern (C) void _BCD__ZN12Fl_RGB_Image4drawEiiiiii(void *This, int, int, int, int, int, int);
extern (C) void _BCD__ZN12Fl_RGB_Image4drawEii(void *This, int, int);
extern (C) void _BCD__ZN12Fl_RGB_Image5labelEP9Fl_Widget(void *This, void *);
extern (C) void _BCD__ZN12Fl_RGB_Image7uncacheEv(void *This);
extern (C) void _BCD_RI_12Fl_RGB_Image(void *cd, void *dd);
extern (C) void _BCD_delete_12Fl_RGB_Image__Fl_RGB_Image_R(void *This);
extern (C) int _BCD_R__ZN8Fl_Image4copyEii__Fl_RGB_Image_R_CHECK(Fl_RGB_Image_R x) {
union dp {
Fl_Image * delegate(int, int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.copy;
return cast(int) (d.f != &Fl_RGB_Image.copy);
}
extern (C) Fl_Image * _BCD_R__ZN8Fl_Image4copyEii__Fl_RGB_Image_R(Fl_RGB_Image_R __D_class, int W, int H) {
return __D_class.copy(W, H);
}
extern (C) int _BCD_R__ZN8Fl_Image13color_averageE8Fl_Colorf__Fl_RGB_Image_R_CHECK(Fl_RGB_Image_R x) {
union dp {
void delegate(int, float) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.color_average;
return cast(int) (d.f != &Fl_RGB_Image.color_average);
}
extern (C) void _BCD_R__ZN8Fl_Image13color_averageE8Fl_Colorf__Fl_RGB_Image_R(Fl_RGB_Image_R __D_class, int c, float i) {
__D_class.color_average(c, i);
}
extern (C) int _BCD_R__ZN8Fl_Image10desaturateEv__Fl_RGB_Image_R_CHECK(Fl_RGB_Image_R x) {
union dp {
void delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.desaturate;
return cast(int) (d.f != &Fl_RGB_Image.desaturate);
}
extern (C) void _BCD_R__ZN8Fl_Image10desaturateEv__Fl_RGB_Image_R(Fl_RGB_Image_R __D_class, ) {
__D_class.desaturate();
}
extern (C) int _BCD_R__ZN8Fl_Image5labelEP9Fl_Widget__Fl_RGB_Image_R_CHECK(Fl_RGB_Image_R x) {
union dp {
void delegate(bcd.bind.BoundClass *) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.label;
return cast(int) (d.f != &Fl_RGB_Image.label);
}
extern (C) void _BCD_R__ZN8Fl_Image5labelEP9Fl_Widget__Fl_RGB_Image_R(Fl_RGB_Image_R __D_class, void *w) {
__D_class.label(cast(bcd.bind.BoundClass *) new bcd.bind.BoundClass(cast(ifloat) 0, w));
}
extern (C) int _BCD_R__ZN8Fl_Image4drawEiiiiii__Fl_RGB_Image_R_CHECK(Fl_RGB_Image_R x) {
union dp {
void delegate(int, int, int, int, int, int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.draw;
return cast(int) (d.f != &Fl_RGB_Image.draw);
}
extern (C) void _BCD_R__ZN8Fl_Image4drawEiiiiii__Fl_RGB_Image_R(Fl_RGB_Image_R __D_class, int X, int Y, int W, int H, int cx, int cy) {
__D_class.draw(X, Y, W, H, cx, cy);
}
extern (C) int _BCD_R__ZN8Fl_Image7uncacheEv__Fl_RGB_Image_R_CHECK(Fl_RGB_Image_R x) {
union dp {
void delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.uncache;
return cast(int) (d.f != &Fl_RGB_Image.uncache);
}
extern (C) void _BCD_R__ZN8Fl_Image7uncacheEv__Fl_RGB_Image_R(Fl_RGB_Image_R __D_class, ) {
__D_class.uncache();
}
extern (C) void *_BCD_new__ZN12Fl_RGB_ImageC1EPKhiiii_R(char *, int, int, int, int);
extern (C) void _BCD_delete_8Fl_Image(void *);
extern (C) int _BCD__ZNK8Fl_Image1wEv(void *This);
extern (C) int _BCD__ZNK8Fl_Image1hEv(void *This);
extern (C) int _BCD__ZNK8Fl_Image1dEv(void *This);
extern (C) int _BCD__ZNK8Fl_Image2ldEv(void *This);
extern (C) int _BCD__ZNK8Fl_Image5countEv(void *This);
extern (C) char * * _BCD__ZNK8Fl_Image4dataEv(void *This);
extern (C) void *_BCD_new__ZN8Fl_ImageC1Eiii(int, int, int);
extern (C) Fl_Image * _BCD__ZN8Fl_Image4copyEii(void *This, int, int);
extern (C) Fl_Image * _BCD__ZN8Fl_Image4copyEv(void *This);
extern (C) void _BCD__ZN8Fl_Image13color_averageE8Fl_Colorf(void *This, int, float);
extern (C) void _BCD__ZN8Fl_Image8inactiveEv(void *This);
extern (C) void _BCD__ZN8Fl_Image10desaturateEv(void *This);
extern (C) void _BCD__ZN8Fl_Image5labelEP9Fl_Widget(void *This, void *);
extern (C) void _BCD__ZN8Fl_Image4drawEiiiiii(void *This, int, int, int, int, int, int);
extern (C) void _BCD__ZN8Fl_Image4drawEii(void *This, int, int);
extern (C) void _BCD__ZN8Fl_Image7uncacheEv(void *This);
extern (C) void _BCD_RI_8Fl_Image(void *cd, void *dd);
extern (C) void _BCD_delete_8Fl_Image__Fl_Image_R(void *This);
extern (C) void *_BCD_new__ZN8Fl_ImageC1Eiii_R(int, int, int);
extern (C) int _BCD_R__ZN8Fl_Image4copyEii__Fl_Image_R_CHECK(Fl_Image_R x) {
union dp {
Fl_Image * delegate(int, int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.copy;
return cast(int) (d.f != &Fl_Image.copy);
}
extern (C) Fl_Image * _BCD_R__ZN8Fl_Image4copyEii__Fl_Image_R(Fl_Image_R __D_class, int W, int H) {
return __D_class.copy(W, H);
}
extern (C) int _BCD_R__ZN8Fl_Image13color_averageE8Fl_Colorf__Fl_Image_R_CHECK(Fl_Image_R x) {
union dp {
void delegate(int, float) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.color_average;
return cast(int) (d.f != &Fl_Image.color_average);
}
extern (C) void _BCD_R__ZN8Fl_Image13color_averageE8Fl_Colorf__Fl_Image_R(Fl_Image_R __D_class, int c, float i) {
__D_class.color_average(c, i);
}
extern (C) int _BCD_R__ZN8Fl_Image10desaturateEv__Fl_Image_R_CHECK(Fl_Image_R x) {
union dp {
void delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.desaturate;
return cast(int) (d.f != &Fl_Image.desaturate);
}
extern (C) void _BCD_R__ZN8Fl_Image10desaturateEv__Fl_Image_R(Fl_Image_R __D_class, ) {
__D_class.desaturate();
}
extern (C) int _BCD_R__ZN8Fl_Image5labelEP9Fl_Widget__Fl_Image_R_CHECK(Fl_Image_R x) {
union dp {
void delegate(bcd.bind.BoundClass *) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.label;
return cast(int) (d.f != &Fl_Image.label);
}
extern (C) void _BCD_R__ZN8Fl_Image5labelEP9Fl_Widget__Fl_Image_R(Fl_Image_R __D_class, void *w) {
__D_class.label(cast(bcd.bind.BoundClass *) new bcd.bind.BoundClass(cast(ifloat) 0, w));
}
extern (C) int _BCD_R__ZN8Fl_Image4drawEiiiiii__Fl_Image_R_CHECK(Fl_Image_R x) {
union dp {
void delegate(int, int, int, int, int, int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.draw;
return cast(int) (d.f != &Fl_Image.draw);
}
extern (C) void _BCD_R__ZN8Fl_Image4drawEiiiiii__Fl_Image_R(Fl_Image_R __D_class, int X, int Y, int W, int H, int cx, int cy) {
__D_class.draw(X, Y, W, H, cx, cy);
}
extern (C) int _BCD_R__ZN8Fl_Image7uncacheEv__Fl_Image_R_CHECK(Fl_Image_R x) {
union dp {
void delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.uncache;
return cast(int) (d.f != &Fl_Image.uncache);
}
extern (C) void _BCD_R__ZN8Fl_Image7uncacheEv__Fl_Image_R(Fl_Image_R __D_class, ) {
__D_class.uncache();
}
class Fl_RGB_Image : Fl_Image {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_12Fl_RGB_Image(__C_data);
__C_data = null;
}
void set_array(char * x) {
_BCD_set__ZN12Fl_RGB_Image5arrayE(__C_data, x);
}
char * get_array() {
return _BCD_get__ZN12Fl_RGB_Image5arrayE(__C_data);
}
void set_alloc_array(int x) {
_BCD_set__ZN12Fl_RGB_Image11alloc_arrayE(__C_data, x);
}
int get_alloc_array() {
return _BCD_get__ZN12Fl_RGB_Image11alloc_arrayE(__C_data);
}
void set_id(uint x) {
_BCD_set__ZN12Fl_RGB_Image2idE(__C_data, x);
}
uint get_id() {
return _BCD_get__ZN12Fl_RGB_Image2idE(__C_data);
}
void set_mask(uint x) {
_BCD_set__ZN12Fl_RGB_Image4maskE(__C_data, x);
}
uint get_mask() {
return _BCD_get__ZN12Fl_RGB_Image4maskE(__C_data);
}
this(char * bits, int W, int H, int D, int LD) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN12Fl_RGB_ImageC1EPKhiiii(bits, W, H, D, LD);
__C_data_owned = true;
}
Fl_Image * copy(int W, int H) {
return _BCD__ZN12Fl_RGB_Image4copyEii(__C_data, W, H);
}
Fl_Image * copy() {
return _BCD__ZN12Fl_RGB_Image4copyEv(__C_data);
}
void color_average(int c, float i) {
_BCD__ZN12Fl_RGB_Image13color_averageE8Fl_Colorf(__C_data, c, i);
}
void desaturate() {
_BCD__ZN12Fl_RGB_Image10desaturateEv(__C_data);
}
void draw(int X, int Y, int W, int H, int cx, int cy) {
_BCD__ZN12Fl_RGB_Image4drawEiiiiii(__C_data, X, Y, W, H, cx, cy);
}
void draw(int X, int Y) {
_BCD__ZN12Fl_RGB_Image4drawEii(__C_data, X, Y);
}
void label(bcd.bind.BoundClass * w) {
_BCD__ZN12Fl_RGB_Image5labelEP9Fl_Widget(__C_data, w.__C_data);
}
void uncache() {
_BCD__ZN12Fl_RGB_Image7uncacheEv(__C_data);
}
}
class Fl_RGB_Image_R : Fl_RGB_Image {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_12Fl_RGB_Image__Fl_RGB_Image_R(__C_data);
__C_data = null;
}
this(char * bits, int W, int H, int D, int LD) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN12Fl_RGB_ImageC1EPKhiiii_R(bits, W, H, D, LD);
__C_data_owned = true;
_BCD_RI_12Fl_RGB_Image(__C_data, cast(void *) this);
}
}
class Fl_Image : bcd.bind.BoundClass {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_8Fl_Image(__C_data);
__C_data = null;
}
int w() {
return _BCD__ZNK8Fl_Image1wEv(__C_data);
}
int h() {
return _BCD__ZNK8Fl_Image1hEv(__C_data);
}
int d() {
return _BCD__ZNK8Fl_Image1dEv(__C_data);
}
int ld() {
return _BCD__ZNK8Fl_Image2ldEv(__C_data);
}
int count() {
return _BCD__ZNK8Fl_Image5countEv(__C_data);
}
char * * data() {
return _BCD__ZNK8Fl_Image4dataEv(__C_data);
}
this(int W, int H, int D) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN8Fl_ImageC1Eiii(W, H, D);
__C_data_owned = true;
}
Fl_Image * copy(int W, int H) {
return _BCD__ZN8Fl_Image4copyEii(__C_data, W, H);
}
Fl_Image * copy() {
return _BCD__ZN8Fl_Image4copyEv(__C_data);
}
void color_average(int c, float i) {
_BCD__ZN8Fl_Image13color_averageE8Fl_Colorf(__C_data, c, i);
}
void inactive() {
_BCD__ZN8Fl_Image8inactiveEv(__C_data);
}
void desaturate() {
_BCD__ZN8Fl_Image10desaturateEv(__C_data);
}
void label(bcd.bind.BoundClass * w) {
_BCD__ZN8Fl_Image5labelEP9Fl_Widget(__C_data, w.__C_data);
}
void draw(int X, int Y, int W, int H, int cx, int cy) {
_BCD__ZN8Fl_Image4drawEiiiiii(__C_data, X, Y, W, H, cx, cy);
}
void draw(int X, int Y) {
_BCD__ZN8Fl_Image4drawEii(__C_data, X, Y);
}
void uncache() {
_BCD__ZN8Fl_Image7uncacheEv(__C_data);
}
}
class Fl_Image_R : Fl_Image {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_8Fl_Image__Fl_Image_R(__C_data);
__C_data = null;
}
this(int W, int H, int D) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN8Fl_ImageC1Eiii_R(W, H, D);
__C_data_owned = true;
_BCD_RI_8Fl_Image(__C_data, cast(void *) this);
}
}
