/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_Return_Button;
public import bcd.bind;
public import bcd.fltk.Fl_Button;
public import bcd.fltk.Fl_Widget;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_16Fl_Return_Button(void *);
extern (C) int _BCD__ZN16Fl_Return_Button6handleEi(void *This, int);
extern (C) void *_BCD_new__ZN16Fl_Return_ButtonC1EiiiiPKc(int, int, int, int, char *);
extern (C) void _BCD_RI_16Fl_Return_Button(void *cd, void *dd);
extern (C) void _BCD_delete_16Fl_Return_Button__Fl_Return_Button_R(void *This);
extern (C) int _BCD_R__ZN16Fl_Return_Button6handleEi__Fl_Return_Button_R_CHECK(Fl_Return_Button_R x) {
union dp {
int delegate(int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.handle;
return cast(int) (d.f != &Fl_Return_Button.handle);
}
extern (C) int _BCD_R__ZN16Fl_Return_Button6handleEi__Fl_Return_Button_R(Fl_Return_Button_R __D_class, int _0) {
return __D_class.handle(_0);
}
extern (C) void *_BCD_new__ZN16Fl_Return_ButtonC1EiiiiPKc_R(int, int, int, int, char *);
alias void function(Fl_Widget *, int) _BCD_func__10;
alias void function(Fl_Widget *) _BCD_func__12;
alias void function(Fl_Widget *, void *) _BCD_func__16;
class Fl_Return_Button : Fl_Button {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_16Fl_Return_Button(__C_data);
__C_data = null;
}
int handle(int _0) {
return _BCD__ZN16Fl_Return_Button6handleEi(__C_data, _0);
}
this(int X, int Y, int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN16Fl_Return_ButtonC1EiiiiPKc(X, Y, W, H, l);
__C_data_owned = true;
}
}
class Fl_Return_Button_R : Fl_Return_Button {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_16Fl_Return_Button__Fl_Return_Button_R(__C_data);
__C_data = null;
}
this(int X, int Y, int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN16Fl_Return_ButtonC1EiiiiPKc_R(X, Y, W, H, l);
__C_data_owned = true;
_BCD_RI_16Fl_Return_Button(__C_data, cast(void *) this);
}
}
