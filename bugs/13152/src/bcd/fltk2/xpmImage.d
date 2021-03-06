/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.xpmImage;
align(4):
public import bcd.bind;
public import bcd.fltk2.Image;
public import bcd.fltk2.Symbol;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.PixelType;
public import bcd.fltk2.Rectangle;
public import bcd.fltk2.Color;
public import bcd.fltk2.Flags;
extern (C) void _BCD_delete_N4fltk8xpmImageE(void *);
extern (C) void _BCD_set__ZN4fltk8xpmImage4dataE(void *, char * *);
extern (C) char * * _BCD_get__ZN4fltk8xpmImage4dataE(void *);
extern (C) void *_BCD_new__ZN4fltk8xpmImageC1EPKPKcS2_(char * *, char *);
extern (C) bool _BCD__ZN4fltk8xpmImage5fetchEv(void *This);
extern (C) bool _BCD__ZN4fltk8xpmImage5fetchERNS_5ImageEPKPKc(void *, char * *);
extern (C) void _BCD_RI_N4fltk8xpmImageE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk8xpmImageE__xpmImage_R(void *This);
extern (C) void *_BCD_new__ZN4fltk8xpmImageC1EPKPKcS2__R(char * *, char *);
extern (C) int _BCD_R__ZN4fltk8xpmImage5fetchEv__xpmImage_R_CHECK(xpmImage_R x) {
union dp {
bool delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.fetch;
return cast(int) (d.f != &xpmImage.fetch);
}
extern (C) bool _BCD_R__ZN4fltk8xpmImage5fetchEv__xpmImage_R(xpmImage_R __D_class, ) {
return __D_class.fetch();
}
class xpmImage : Image {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk8xpmImageE(__C_data);
__C_data = null;
}
void set_data(char * * x) {
_BCD_set__ZN4fltk8xpmImage4dataE(__C_data, x);
}
char * * get_data() {
return _BCD_get__ZN4fltk8xpmImage4dataE(__C_data);
}
this(char * * d, char * name = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk8xpmImageC1EPKPKcS2_(d, name);
__C_data_owned = true;
}
bool fetch() {
return _BCD__ZN4fltk8xpmImage5fetchEv(__C_data);
}
static bool fetch(Image _0, char * * data) {
return _BCD__ZN4fltk8xpmImage5fetchERNS_5ImageEPKPKc(_0.__C_data, data);
}
}
class xpmImage_R : xpmImage {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk8xpmImageE__xpmImage_R(__C_data);
__C_data = null;
}
this(char * * d, char * name = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk8xpmImageC1EPKPKcS2__R(d, name);
__C_data_owned = true;
_BCD_RI_N4fltk8xpmImageE(__C_data, cast(void *) this);
}
}
