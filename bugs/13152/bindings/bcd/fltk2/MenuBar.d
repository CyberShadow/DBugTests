/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.MenuBar;
align(4):
public import bcd.bind;
public import bcd.fltk2.Menu;
public import bcd.fltk2.Group;
public import bcd.fltk2.Widget;
public import bcd.fltk2.Style;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.Rectangle;
public import bcd.fltk2.Color;
public import bcd.fltk2.Flags;
extern (C) void _BCD_delete_N4fltk7MenuBarE(void *);
extern (C) void _BCD_set__ZN4fltk7MenuBar13default_styleE(void *, NamedStyle *);
extern (C) NamedStyle * _BCD_get__ZN4fltk7MenuBar13default_styleE(void *);
extern (C) void *_BCD_new__ZN4fltk7MenuBarC1EiiiiPKc(int, int, int, int, char *);
extern (C) int _BCD__ZN4fltk7MenuBar6handleEi(void *This, int);
extern (C) void _BCD_RI_N4fltk7MenuBarE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk7MenuBarE__MenuBar_R(void *This);
extern (C) void *_BCD_new__ZN4fltk7MenuBarC1EiiiiPKc_R(int, int, int, int, char *);
extern (C) int _BCD_R__ZN4fltk7MenuBar6handleEi__MenuBar_R_CHECK(MenuBar_R x) {
union dp {
int delegate(int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.handle;
return cast(int) (d.f != &MenuBar.handle);
}
extern (C) int _BCD_R__ZN4fltk7MenuBar6handleEi__MenuBar_R(MenuBar_R __D_class, int _0) {
return __D_class.handle(_0);
}
alias void function(Widget *, int) _BCD_func__161;
alias void function(Widget *) _BCD_func__163;
alias void function(Widget *, void *) _BCD_func__167;
alias bool function() _BCD_func__378;
class MenuBar : Menu {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk7MenuBarE(__C_data);
__C_data = null;
}
void set_default_style(NamedStyle * x) {
_BCD_set__ZN4fltk7MenuBar13default_styleE(__C_data, x);
}
NamedStyle * get_default_style() {
return _BCD_get__ZN4fltk7MenuBar13default_styleE(__C_data);
}
this(int x, int y, int w, int h, char * l = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk7MenuBarC1EiiiiPKc(x, y, w, h, l);
__C_data_owned = true;
}
int handle(int _0) {
return _BCD__ZN4fltk7MenuBar6handleEi(__C_data, _0);
}
}
class MenuBar_R : MenuBar {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk7MenuBarE__MenuBar_R(__C_data);
__C_data = null;
}
this(int x, int y, int w, int h, char * l = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk7MenuBarC1EiiiiPKc_R(x, y, w, h, l);
__C_data_owned = true;
_BCD_RI_N4fltk7MenuBarE(__C_data, cast(void *) this);
}
}
