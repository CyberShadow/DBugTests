/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_Output;
public import bcd.bind;
public import bcd.fltk.Fl_Input;
public import bcd.fltk.Fl_Input_;
public import bcd.fltk.Fl_Widget;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_9Fl_Output(void *);
extern (C) void *_BCD_new__ZN9Fl_OutputC1EiiiiPKc(int, int, int, int, char *);
extern (C) void _BCD_RI_9Fl_Output(void *cd, void *dd);
extern (C) void _BCD_delete_9Fl_Output__Fl_Output_R(void *This);
extern (C) void *_BCD_new__ZN9Fl_OutputC1EiiiiPKc_R(int, int, int, int, char *);
alias void function(Fl_Widget *, int) _BCD_func__11;
alias void function(Fl_Widget *) _BCD_func__13;
alias void function(Fl_Widget *, void *) _BCD_func__17;
class Fl_Output : Fl_Input {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_9Fl_Output(__C_data);
__C_data = null;
}
this(int X, int Y, int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN9Fl_OutputC1EiiiiPKc(X, Y, W, H, l);
__C_data_owned = true;
}
}
class Fl_Output_R : Fl_Output {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_9Fl_Output__Fl_Output_R(__C_data);
__C_data = null;
}
this(int X, int Y, int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN9Fl_OutputC1EiiiiPKc_R(X, Y, W, H, l);
__C_data_owned = true;
_BCD_RI_9Fl_Output(__C_data, cast(void *) this);
}
}
