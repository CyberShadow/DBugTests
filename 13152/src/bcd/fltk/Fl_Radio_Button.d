/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_Radio_Button;
public import bcd.bind;
public import bcd.fltk.Fl_Button;
public import bcd.fltk.Fl_Widget;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_15Fl_Radio_Button(void *);
extern (C) void *_BCD_new__ZN15Fl_Radio_ButtonC1EiiiiPKc(int, int, int, int, char *);
extern (C) void _BCD_RI_15Fl_Radio_Button(void *cd, void *dd);
extern (C) void _BCD_delete_15Fl_Radio_Button__Fl_Radio_Button_R(void *This);
extern (C) void *_BCD_new__ZN15Fl_Radio_ButtonC1EiiiiPKc_R(int, int, int, int, char *);
alias void function(Fl_Widget *, int) _BCD_func__10;
alias void function(Fl_Widget *) _BCD_func__12;
alias void function(Fl_Widget *, void *) _BCD_func__16;
class Fl_Radio_Button : Fl_Button {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_15Fl_Radio_Button(__C_data);
__C_data = null;
}
this(int x, int y, int w, int h, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN15Fl_Radio_ButtonC1EiiiiPKc(x, y, w, h, l);
__C_data_owned = true;
}
}
class Fl_Radio_Button_R : Fl_Radio_Button {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_15Fl_Radio_Button__Fl_Radio_Button_R(__C_data);
__C_data = null;
}
this(int x, int y, int w, int h, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN15Fl_Radio_ButtonC1EiiiiPKc_R(x, y, w, h, l);
__C_data_owned = true;
_BCD_RI_15Fl_Radio_Button(__C_data, cast(void *) this);
}
}
