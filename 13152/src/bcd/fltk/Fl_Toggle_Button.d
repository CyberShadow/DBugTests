/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_Toggle_Button;
public import bcd.bind;
public import bcd.fltk.Fl_Button;
public import bcd.fltk.Fl_Widget;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_16Fl_Toggle_Button(void *);
extern (C) void *_BCD_new__ZN16Fl_Toggle_ButtonC1EiiiiPKc(int, int, int, int, char *);
extern (C) void _BCD_RI_16Fl_Toggle_Button(void *cd, void *dd);
extern (C) void _BCD_delete_16Fl_Toggle_Button__Fl_Toggle_Button_R(void *This);
extern (C) void *_BCD_new__ZN16Fl_Toggle_ButtonC1EiiiiPKc_R(int, int, int, int, char *);
alias void function(Fl_Widget *, int) _BCD_func__10;
alias void function(Fl_Widget *) _BCD_func__12;
alias void function(Fl_Widget *, void *) _BCD_func__16;
class Fl_Toggle_Button : Fl_Button {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_16Fl_Toggle_Button(__C_data);
__C_data = null;
}
this(int X, int Y, int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN16Fl_Toggle_ButtonC1EiiiiPKc(X, Y, W, H, l);
__C_data_owned = true;
}
}
class Fl_Toggle_Button_R : Fl_Toggle_Button {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_16Fl_Toggle_Button__Fl_Toggle_Button_R(__C_data);
__C_data = null;
}
this(int X, int Y, int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN16Fl_Toggle_ButtonC1EiiiiPKc_R(X, Y, W, H, l);
__C_data_owned = true;
_BCD_RI_16Fl_Toggle_Button(__C_data, cast(void *) this);
}
}