/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_Roller;
public import bcd.bind;
public import bcd.fltk.Fl_Valuator;
public import bcd.fltk.Fl_Widget;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_9Fl_Roller(void *);
extern (C) int _BCD__ZN9Fl_Roller6handleEi(void *This, int);
extern (C) void *_BCD_new__ZN9Fl_RollerC1EiiiiPKc(int, int, int, int, char *);
extern (C) void _BCD_RI_9Fl_Roller(void *cd, void *dd);
extern (C) void _BCD_delete_9Fl_Roller__Fl_Roller_R(void *This);
extern (C) int _BCD_R__ZN9Fl_Roller6handleEi__Fl_Roller_R_CHECK(Fl_Roller_R x) {
union dp {
int delegate(int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.handle;
return cast(int) (d.f != &Fl_Roller.handle);
}
extern (C) int _BCD_R__ZN9Fl_Roller6handleEi__Fl_Roller_R(Fl_Roller_R __D_class, int _0) {
return __D_class.handle(_0);
}
extern (C) void *_BCD_new__ZN9Fl_RollerC1EiiiiPKc_R(int, int, int, int, char *);
alias void function(Fl_Widget *, int) _BCD_func__9;
alias void function(Fl_Widget *) _BCD_func__11;
alias void function(Fl_Widget *, void *) _BCD_func__15;
class Fl_Roller : Fl_Valuator {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_9Fl_Roller(__C_data);
__C_data = null;
}
int handle(int _0) {
return _BCD__ZN9Fl_Roller6handleEi(__C_data, _0);
}
this(int X, int Y, int W, int H, char * L) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN9Fl_RollerC1EiiiiPKc(X, Y, W, H, L);
__C_data_owned = true;
}
}
class Fl_Roller_R : Fl_Roller {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_9Fl_Roller__Fl_Roller_R(__C_data);
__C_data = null;
}
this(int X, int Y, int W, int H, char * L) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN9Fl_RollerC1EiiiiPKc_R(X, Y, W, H, L);
__C_data_owned = true;
_BCD_RI_9Fl_Roller(__C_data, cast(void *) this);
}
}
