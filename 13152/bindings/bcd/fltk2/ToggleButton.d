/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.ToggleButton;
align(4):
public import bcd.bind;
public import bcd.fltk2.Button;
public import bcd.fltk2.Widget;
public import bcd.fltk2.Style;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.Rectangle;
public import bcd.fltk2.Color;
public import bcd.fltk2.Flags;
extern (C) void _BCD_delete_N4fltk12ToggleButtonE(void *);
extern (C) void *_BCD_new__ZN4fltk12ToggleButtonC1EiiiiPKc(int, int, int, int, char *);
extern (C) void _BCD_RI_N4fltk12ToggleButtonE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk12ToggleButtonE__ToggleButton_R(void *This);
extern (C) void *_BCD_new__ZN4fltk12ToggleButtonC1EiiiiPKc_R(int, int, int, int, char *);
alias void function(Widget *, int) _BCD_func__154;
alias void function(Widget *) _BCD_func__156;
alias void function(Widget *, void *) _BCD_func__160;
alias bool function() _BCD_func__268;
class ToggleButton : Button {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk12ToggleButtonE(__C_data);
__C_data = null;
}
this(int x, int y, int w, int h, char * l = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk12ToggleButtonC1EiiiiPKc(x, y, w, h, l);
__C_data_owned = true;
}
}
class ToggleButton_R : ToggleButton {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk12ToggleButtonE__ToggleButton_R(__C_data);
__C_data = null;
}
this(int x, int y, int w, int h, char * l = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk12ToggleButtonC1EiiiiPKc_R(x, y, w, h, l);
__C_data_owned = true;
_BCD_RI_N4fltk12ToggleButtonE(__C_data, cast(void *) this);
}
}
