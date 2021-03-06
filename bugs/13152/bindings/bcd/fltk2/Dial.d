/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.Dial;
align(4):
public import bcd.bind;
public import bcd.fltk2.Valuator;
public import bcd.fltk2.Widget;
public import bcd.fltk2.Style;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.Rectangle;
public import bcd.fltk2.Color;
public import bcd.fltk2.Flags;
extern (C) void _BCD_delete_N4fltk4DialE(void *);
extern (C) void _BCD_set__ZN4fltk4Dial13default_styleE(void *, NamedStyle *);
extern (C) NamedStyle * _BCD_get__ZN4fltk4Dial13default_styleE(void *);
extern (C) int _BCD__ZN4fltk4Dial6handleEi(void *This, int);
extern (C) void *_BCD_new__ZN4fltk4DialC1EiiiiPKc(int, int, int, int, char *);
extern (C) short _BCD__ZNK4fltk4Dial6angle1Ev(void *This);
extern (C) void _BCD__ZN4fltk4Dial6angle1Es(void *This, short);
extern (C) short _BCD__ZNK4fltk4Dial6angle2Ev(void *This);
extern (C) void _BCD__ZN4fltk4Dial6angle2Es(void *This, short);
extern (C) void _BCD__ZN4fltk4Dial6anglesEss(void *This, short, short);
extern (C) void _BCD_RI_N4fltk4DialE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk4DialE__Dial_R(void *This);
extern (C) int _BCD_R__ZN4fltk4Dial6handleEi__Dial_R_CHECK(Dial_R x) {
union dp {
int delegate(int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.handle;
return cast(int) (d.f != &Dial.handle);
}
extern (C) int _BCD_R__ZN4fltk4Dial6handleEi__Dial_R(Dial_R __D_class, int _0) {
return __D_class.handle(_0);
}
extern (C) void *_BCD_new__ZN4fltk4DialC1EiiiiPKc_R(int, int, int, int, char *);
alias void function(Widget *, int) _BCD_func__154;
alias void function(Widget *) _BCD_func__156;
alias void function(Widget *, void *) _BCD_func__160;
alias bool function() _BCD_func__297;
const int NORMAL = 0;
const int LINE = 1;
const int FILL = 2;
class Dial : Valuator {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk4DialE(__C_data);
__C_data = null;
}
void set_default_style(NamedStyle * x) {
_BCD_set__ZN4fltk4Dial13default_styleE(__C_data, x);
}
NamedStyle * get_default_style() {
return _BCD_get__ZN4fltk4Dial13default_styleE(__C_data);
}
int handle(int _0) {
return _BCD__ZN4fltk4Dial6handleEi(__C_data, _0);
}
this(int x, int y, int w, int h, char * l = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk4DialC1EiiiiPKc(x, y, w, h, l);
__C_data_owned = true;
}
short angle1() {
return _BCD__ZNK4fltk4Dial6angle1Ev(__C_data);
}
void angle1(short a) {
_BCD__ZN4fltk4Dial6angle1Es(__C_data, a);
}
short angle2() {
return _BCD__ZNK4fltk4Dial6angle2Ev(__C_data);
}
void angle2(short a) {
_BCD__ZN4fltk4Dial6angle2Es(__C_data, a);
}
void angles(short a, short b) {
_BCD__ZN4fltk4Dial6anglesEss(__C_data, a, b);
}
}
class Dial_R : Dial {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk4DialE__Dial_R(__C_data);
__C_data = null;
}
this(int x, int y, int w, int h, char * l = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk4DialC1EiiiiPKc_R(x, y, w, h, l);
__C_data_owned = true;
_BCD_RI_N4fltk4DialE(__C_data, cast(void *) this);
}
}
