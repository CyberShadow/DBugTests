/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.TiledGroup;
align(4):
public import bcd.bind;
public import bcd.fltk2.Group;
public import bcd.fltk2.Widget;
public import bcd.fltk2.Style;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.Rectangle;
public import bcd.fltk2.Color;
public import bcd.fltk2.Flags;
extern (C) void _BCD_delete_N4fltk10TiledGroupE(void *);
extern (C) int _BCD__ZN4fltk10TiledGroup6handleEi(void *This, int);
extern (C) void *_BCD_new__ZN4fltk10TiledGroupC1EiiiiPKcb(int, int, int, int, char *, bool);
extern (C) void _BCD__ZN4fltk10TiledGroup8positionEiiii(void *This, int, int, int, int);
extern (C) void _BCD_RI_N4fltk10TiledGroupE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk10TiledGroupE__TiledGroup_R(void *This);
extern (C) int _BCD_R__ZN4fltk10TiledGroup6handleEi__TiledGroup_R_CHECK(TiledGroup_R x) {
union dp {
int delegate(int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.handle;
return cast(int) (d.f != &TiledGroup.handle);
}
extern (C) int _BCD_R__ZN4fltk10TiledGroup6handleEi__TiledGroup_R(TiledGroup_R __D_class, int _0) {
return __D_class.handle(_0);
}
extern (C) void *_BCD_new__ZN4fltk10TiledGroupC1EiiiiPKcb_R(int, int, int, int, char *, bool);
alias void function(Widget *, int) _BCD_func__154;
alias void function(Widget *) _BCD_func__156;
alias void function(Widget *, void *) _BCD_func__160;
alias bool function() _BCD_func__312;
class TiledGroup : Group {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk10TiledGroupE(__C_data);
__C_data = null;
}
int handle(int _0) {
return _BCD__ZN4fltk10TiledGroup6handleEi(__C_data, _0);
}
this(int x, int y, int w, int h, char * l = null, bool begin = false) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10TiledGroupC1EiiiiPKcb(x, y, w, h, l, begin);
__C_data_owned = true;
}
void position(int _0, int _1, int _2, int _3) {
_BCD__ZN4fltk10TiledGroup8positionEiiii(__C_data, _0, _1, _2, _3);
}
}
class TiledGroup_R : TiledGroup {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk10TiledGroupE__TiledGroup_R(__C_data);
__C_data = null;
}
this(int x, int y, int w, int h, char * l = null, bool begin = false) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10TiledGroupC1EiiiiPKcb_R(x, y, w, h, l, begin);
__C_data_owned = true;
_BCD_RI_N4fltk10TiledGroupE(__C_data, cast(void *) this);
}
}
