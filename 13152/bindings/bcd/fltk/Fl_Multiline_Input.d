/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_Multiline_Input;
public import bcd.bind;
public import bcd.fltk.Fl_Input;
public import bcd.fltk.Fl_Input_;
public import bcd.fltk.Fl_Widget;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_18Fl_Multiline_Input(void *);
extern (C) void *_BCD_new__ZN18Fl_Multiline_InputC1EiiiiPKc(int, int, int, int, char *);
extern (C) void _BCD_RI_18Fl_Multiline_Input(void *cd, void *dd);
extern (C) void _BCD_delete_18Fl_Multiline_Input__Fl_Multiline_Input_R(void *This);
extern (C) void *_BCD_new__ZN18Fl_Multiline_InputC1EiiiiPKc_R(int, int, int, int, char *);
alias void function(Fl_Widget *, int) _BCD_func__11;
alias void function(Fl_Widget *) _BCD_func__13;
alias void function(Fl_Widget *, void *) _BCD_func__17;
class Fl_Multiline_Input : Fl_Input {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_18Fl_Multiline_Input(__C_data);
__C_data = null;
}
this(int X, int Y, int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN18Fl_Multiline_InputC1EiiiiPKc(X, Y, W, H, l);
__C_data_owned = true;
}
}
class Fl_Multiline_Input_R : Fl_Multiline_Input {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_18Fl_Multiline_Input__Fl_Multiline_Input_R(__C_data);
__C_data = null;
}
this(int X, int Y, int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN18Fl_Multiline_InputC1EiiiiPKc_R(X, Y, W, H, l);
__C_data_owned = true;
_BCD_RI_18Fl_Multiline_Input(__C_data, cast(void *) this);
}
}