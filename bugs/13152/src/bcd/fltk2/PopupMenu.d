/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.PopupMenu;
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
extern (C) void _BCD_delete_N4fltk9PopupMenuE(void *);
extern (C) void _BCD_set__ZN4fltk9PopupMenu13default_styleE(void *, NamedStyle *);
extern (C) NamedStyle * _BCD_get__ZN4fltk9PopupMenu13default_styleE(void *);
extern (C) int _BCD__ZN4fltk9PopupMenu6handleEi(void *This, int);
extern (C) int _BCD__ZN4fltk9PopupMenu5popupEv(void *This);
extern (C) void *_BCD_new__ZN4fltk9PopupMenuC1EiiiiPKc(int, int, int, int, char *);
extern (C) void _BCD_RI_N4fltk9PopupMenuE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk9PopupMenuE__PopupMenu_R(void *This);
extern (C) int _BCD_R__ZN4fltk9PopupMenu6handleEi__PopupMenu_R_CHECK(PopupMenu_R x) {
union dp {
int delegate(int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.handle;
return cast(int) (d.f != &PopupMenu.handle);
}
extern (C) int _BCD_R__ZN4fltk9PopupMenu6handleEi__PopupMenu_R(PopupMenu_R __D_class, int _0) {
return __D_class.handle(_0);
}
extern (C) void *_BCD_new__ZN4fltk9PopupMenuC1EiiiiPKc_R(int, int, int, int, char *);
alias void function(Widget *, int) _BCD_func__161;
alias void function(Widget *) _BCD_func__163;
alias void function(Widget *, void *) _BCD_func__167;
alias bool function() _BCD_func__377;
const int NORMAL = 224;
const int POPUP1 = 225;
const int POPUP2 = 226;
const int POPUP12 = 227;
const int POPUP3 = 228;
const int POPUP13 = 229;
const int POPUP23 = 230;
const int POPUP123 = 231;
class PopupMenu : Menu {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk9PopupMenuE(__C_data);
__C_data = null;
}
void set_default_style(NamedStyle * x) {
_BCD_set__ZN4fltk9PopupMenu13default_styleE(__C_data, x);
}
NamedStyle * get_default_style() {
return _BCD_get__ZN4fltk9PopupMenu13default_styleE(__C_data);
}
int handle(int _0) {
return _BCD__ZN4fltk9PopupMenu6handleEi(__C_data, _0);
}
int popup() {
return _BCD__ZN4fltk9PopupMenu5popupEv(__C_data);
}
this(int _0, int _1, int _2, int _3, char * _4 = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk9PopupMenuC1EiiiiPKc(_0, _1, _2, _3, _4);
__C_data_owned = true;
}
}
class PopupMenu_R : PopupMenu {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk9PopupMenuE__PopupMenu_R(__C_data);
__C_data = null;
}
this(int _0, int _1, int _2, int _3, char * _4 = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk9PopupMenuC1EiiiiPKc_R(_0, _1, _2, _3, _4);
__C_data_owned = true;
_BCD_RI_N4fltk9PopupMenuE(__C_data, cast(void *) this);
}
}