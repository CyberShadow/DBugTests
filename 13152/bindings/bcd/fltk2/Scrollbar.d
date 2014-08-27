/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.Scrollbar;
align(4):
public import bcd.bind;
public import bcd.fltk2.Slider;
public import bcd.fltk2.Valuator;
public import bcd.fltk2.Widget;
public import bcd.fltk2.Style;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.Rectangle;
public import bcd.fltk2.Color;
public import bcd.fltk2.Flags;
extern (C) void _BCD_delete_N4fltk9ScrollbarE(void *);
extern (C) void _BCD_set__ZN4fltk9Scrollbar13default_styleE(void *, NamedStyle *);
extern (C) NamedStyle * _BCD_get__ZN4fltk9Scrollbar13default_styleE(void *);
extern (C) void *_BCD_new__ZN4fltk9ScrollbarC1EiiiiPKc(int, int, int, int, char *);
extern (C) int _BCD__ZNK4fltk9Scrollbar5valueEv(void *This);
extern (C) bool _BCD__ZN4fltk9Scrollbar5valueEi(void *This, int);
extern (C) int _BCD__ZN4fltk9Scrollbar6handleEi(void *This, int);
extern (C) int _BCD__ZNK4fltk9Scrollbar8pagesizeEv(void *This);
extern (C) void _BCD__ZN4fltk9Scrollbar8pagesizeEi(void *This, int);
extern (C) void _BCD_RI_N4fltk9ScrollbarE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk9ScrollbarE__Scrollbar_R(void *This);
extern (C) void *_BCD_new__ZN4fltk9ScrollbarC1EiiiiPKc_R(int, int, int, int, char *);
extern (C) int _BCD_R__ZN4fltk9Scrollbar6handleEi__Scrollbar_R_CHECK(Scrollbar_R x) {
union dp {
int delegate(int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.handle;
return cast(int) (d.f != &Scrollbar.handle);
}
extern (C) int _BCD_R__ZN4fltk9Scrollbar6handleEi__Scrollbar_R(Scrollbar_R __D_class, int _0) {
return __D_class.handle(_0);
}
alias void function(Widget *, int) _BCD_func__156;
alias void function(Widget *) _BCD_func__158;
alias void function(Widget *, void *) _BCD_func__162;
alias bool function() _BCD_func__319;
class Scrollbar : Slider {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk9ScrollbarE(__C_data);
__C_data = null;
}
void set_default_style(NamedStyle * x) {
_BCD_set__ZN4fltk9Scrollbar13default_styleE(__C_data, x);
}
NamedStyle * get_default_style() {
return _BCD_get__ZN4fltk9Scrollbar13default_styleE(__C_data);
}
this(int x, int y, int w, int h, char * l = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk9ScrollbarC1EiiiiPKc(x, y, w, h, l);
__C_data_owned = true;
}
int intvalue() {
return _BCD__ZNK4fltk9Scrollbar5valueEv(__C_data);
}
bool value(int position) {
return _BCD__ZN4fltk9Scrollbar5valueEi(__C_data, position);
}
int handle(int _0) {
return _BCD__ZN4fltk9Scrollbar6handleEi(__C_data, _0);
}
int pagesize() {
return _BCD__ZNK4fltk9Scrollbar8pagesizeEv(__C_data);
}
void pagesize(int a) {
_BCD__ZN4fltk9Scrollbar8pagesizeEi(__C_data, a);
}
}
class Scrollbar_R : Scrollbar {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk9ScrollbarE__Scrollbar_R(__C_data);
__C_data = null;
}
this(int x, int y, int w, int h, char * l = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk9ScrollbarC1EiiiiPKc_R(x, y, w, h, l);
__C_data_owned = true;
_BCD_RI_N4fltk9ScrollbarE(__C_data, cast(void *) this);
}
}
