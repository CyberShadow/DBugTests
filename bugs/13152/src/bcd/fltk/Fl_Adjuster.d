/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_Adjuster;
public import bcd.bind;
public import bcd.fltk.Fl_Valuator;
public import bcd.fltk.Fl_Widget;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_11Fl_Adjuster(void *);
extern (C) void *_BCD_new__ZN11Fl_AdjusterC1EiiiiPKc(int, int, int, int, char *);
extern (C) void _BCD__ZN11Fl_Adjuster4softEi(void *This, int);
extern (C) int _BCD__ZNK11Fl_Adjuster4softEv(void *This);
extern (C) void _BCD_RI_11Fl_Adjuster(void *cd, void *dd);
extern (C) void _BCD_delete_11Fl_Adjuster__Fl_Adjuster_R(void *This);
extern (C) void *_BCD_new__ZN11Fl_AdjusterC1EiiiiPKc_R(int, int, int, int, char *);
alias void function(Fl_Widget *, int) _BCD_func__9;
alias void function(Fl_Widget *) _BCD_func__11;
alias void function(Fl_Widget *, void *) _BCD_func__15;
class Fl_Adjuster : Fl_Valuator {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_11Fl_Adjuster(__C_data);
__C_data = null;
}
this(int X, int Y, int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN11Fl_AdjusterC1EiiiiPKc(X, Y, W, H, l);
__C_data_owned = true;
}
void soft(int s) {
_BCD__ZN11Fl_Adjuster4softEi(__C_data, s);
}
int soft() {
return _BCD__ZNK11Fl_Adjuster4softEv(__C_data);
}
}
class Fl_Adjuster_R : Fl_Adjuster {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_11Fl_Adjuster__Fl_Adjuster_R(__C_data);
__C_data = null;
}
this(int X, int Y, int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN11Fl_AdjusterC1EiiiiPKc_R(X, Y, W, H, l);
__C_data_owned = true;
_BCD_RI_11Fl_Adjuster(__C_data, cast(void *) this);
}
}