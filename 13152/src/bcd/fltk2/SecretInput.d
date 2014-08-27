/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.SecretInput;
align(4):
public import bcd.bind;
public import bcd.fltk2.Input;
public import bcd.fltk2.Widget;
public import bcd.fltk2.Style;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.Rectangle;
public import bcd.fltk2.Color;
public import bcd.fltk2.Flags;
extern (C) void _BCD_delete_N4fltk11SecretInputE(void *);
extern (C) void *_BCD_new__ZN4fltk11SecretInputC1EiiiiPKc(int, int, int, int, char *);
extern (C) void _BCD_RI_N4fltk11SecretInputE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk11SecretInputE__SecretInput_R(void *This);
extern (C) void *_BCD_new__ZN4fltk11SecretInputC1EiiiiPKc_R(int, int, int, int, char *);
alias void function(Widget *, int) _BCD_func__154;
alias void function(Widget *) _BCD_func__156;
alias void function(Widget *, void *) _BCD_func__160;
alias bool function() _BCD_func__320;
class SecretInput : Input {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk11SecretInputE(__C_data);
__C_data = null;
}
this(int x, int y, int w, int h, char * l = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk11SecretInputC1EiiiiPKc(x, y, w, h, l);
__C_data_owned = true;
}
}
class SecretInput_R : SecretInput {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk11SecretInputE__SecretInput_R(__C_data);
__C_data = null;
}
this(int x, int y, int w, int h, char * l = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk11SecretInputC1EiiiiPKc_R(x, y, w, h, l);
__C_data_owned = true;
_BCD_RI_N4fltk11SecretInputE(__C_data, cast(void *) this);
}
}
