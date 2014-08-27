/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_Double_Window;
public import bcd.bind;
public import bcd.fltk.Fl_Window;
public import bcd.fltk.Fl_Group;
public import bcd.fltk.Fl_Widget;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_16Fl_Double_Window(void *);
extern (C) void _BCD__ZN16Fl_Double_Window4showEv(void *This);
extern (C) void _BCD__ZN16Fl_Double_Window4showEiPPc(void *This, int, char * *);
extern (C) void _BCD__ZN16Fl_Double_Window5flushEv(void *This);
extern (C) void _BCD__ZN16Fl_Double_Window6resizeEiiii(void *This, int, int, int, int);
extern (C) void _BCD__ZN16Fl_Double_Window4hideEv(void *This);
extern (C) void *_BCD_new__ZN16Fl_Double_WindowC1EiiPKc(int, int, char *);
extern (C) void *_BCD_new__ZN16Fl_Double_WindowC1EiiiiPKc(int, int, int, int, char *);
extern (C) void _BCD_RI_16Fl_Double_Window(void *cd, void *dd);
extern (C) void _BCD_delete_16Fl_Double_Window__Fl_Double_Window_R(void *This);
extern (C) int _BCD_R__ZN16Fl_Double_Window4showEv__Fl_Double_Window_R_CHECK(Fl_Double_Window_R x) {
union dp {
void delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.show;
return cast(int) (d.f != &Fl_Double_Window.show);
}
extern (C) void _BCD_R__ZN16Fl_Double_Window4showEv__Fl_Double_Window_R(Fl_Double_Window_R __D_class, ) {
__D_class.show();
}
extern (C) int _BCD_R__ZN16Fl_Double_Window5flushEv__Fl_Double_Window_R_CHECK(Fl_Double_Window_R x) {
union dp {
void delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.flush;
return cast(int) (d.f != &Fl_Double_Window.flush);
}
extern (C) void _BCD_R__ZN16Fl_Double_Window5flushEv__Fl_Double_Window_R(Fl_Double_Window_R __D_class, ) {
__D_class.flush();
}
extern (C) int _BCD_R__ZN16Fl_Double_Window6resizeEiiii__Fl_Double_Window_R_CHECK(Fl_Double_Window_R x) {
union dp {
void delegate(int, int, int, int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.resize;
return cast(int) (d.f != &Fl_Double_Window.resize);
}
extern (C) void _BCD_R__ZN16Fl_Double_Window6resizeEiiii__Fl_Double_Window_R(Fl_Double_Window_R __D_class, int _0, int _1, int _2, int _3) {
__D_class.resize(_0, _1, _2, _3);
}
extern (C) int _BCD_R__ZN16Fl_Double_Window4hideEv__Fl_Double_Window_R_CHECK(Fl_Double_Window_R x) {
union dp {
void delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.hide;
return cast(int) (d.f != &Fl_Double_Window.hide);
}
extern (C) void _BCD_R__ZN16Fl_Double_Window4hideEv__Fl_Double_Window_R(Fl_Double_Window_R __D_class, ) {
__D_class.hide();
}
extern (C) void *_BCD_new__ZN16Fl_Double_WindowC1EiiPKc_R(int, int, char *);
extern (C) void *_BCD_new__ZN16Fl_Double_WindowC1EiiiiPKc_R(int, int, int, int, char *);
alias void function(Fl_Widget *, int) _BCD_func__11;
alias void function(Fl_Widget *) _BCD_func__13;
alias void function(Fl_Widget *, void *) _BCD_func__17;
class Fl_Double_Window : Fl_Window {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_16Fl_Double_Window(__C_data);
__C_data = null;
}
void show() {
_BCD__ZN16Fl_Double_Window4showEv(__C_data);
}
void show(int a, char * * b) {
_BCD__ZN16Fl_Double_Window4showEiPPc(__C_data, a, b);
}
void flush() {
_BCD__ZN16Fl_Double_Window5flushEv(__C_data);
}
void resize(int _0, int _1, int _2, int _3) {
_BCD__ZN16Fl_Double_Window6resizeEiiii(__C_data, _0, _1, _2, _3);
}
void hide() {
_BCD__ZN16Fl_Double_Window4hideEv(__C_data);
}
this(int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN16Fl_Double_WindowC1EiiPKc(W, H, l);
__C_data_owned = true;
}
this(int X, int Y, int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN16Fl_Double_WindowC1EiiiiPKc(X, Y, W, H, l);
__C_data_owned = true;
}
}
class Fl_Double_Window_R : Fl_Double_Window {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_16Fl_Double_Window__Fl_Double_Window_R(__C_data);
__C_data = null;
}
this(int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN16Fl_Double_WindowC1EiiPKc_R(W, H, l);
__C_data_owned = true;
_BCD_RI_16Fl_Double_Window(__C_data, cast(void *) this);
}
this(int X, int Y, int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN16Fl_Double_WindowC1EiiiiPKc_R(X, Y, W, H, l);
__C_data_owned = true;
_BCD_RI_16Fl_Double_Window(__C_data, cast(void *) this);
}
}
