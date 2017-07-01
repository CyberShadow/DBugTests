/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_Scroll;
public import bcd.bind;
public import bcd.fltk.Fl_Scrollbar;
public import bcd.fltk.Fl_Slider;
public import bcd.fltk.Fl_Valuator;
public import bcd.fltk.Fl_Group;
public import bcd.fltk.Fl_Widget;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_9Fl_Scroll(void *);
extern (C) void _BCD_set__ZN9Fl_Scroll9scrollbarE(void *, Fl_Scrollbar);
extern (C) Fl_Scrollbar _BCD_get__ZN9Fl_Scroll9scrollbarE(void *);
extern (C) void _BCD_set__ZN9Fl_Scroll10hscrollbarE(void *, Fl_Scrollbar);
extern (C) Fl_Scrollbar _BCD_get__ZN9Fl_Scroll10hscrollbarE(void *);
extern (C) void _BCD__ZN9Fl_Scroll6resizeEiiii(void *This, int, int, int, int);
extern (C) int _BCD__ZN9Fl_Scroll6handleEi(void *This, int);
extern (C) void *_BCD_new__ZN9Fl_ScrollC1EiiiiPKc(int, int, int, int, char *);
extern (C) int _BCD__ZNK9Fl_Scroll9xpositionEv(void *This);
extern (C) int _BCD__ZNK9Fl_Scroll9ypositionEv(void *This);
extern (C) void _BCD__ZN9Fl_Scroll8positionEii(void *This, int, int);
extern (C) void _BCD__ZN9Fl_Scroll5clearEv(void *This);
extern (C) void _BCD_RI_9Fl_Scroll(void *cd, void *dd);
extern (C) void _BCD_delete_9Fl_Scroll__Fl_Scroll_R(void *This);
extern (C) int _BCD_R__ZN9Fl_Scroll6resizeEiiii__Fl_Scroll_R_CHECK(Fl_Scroll_R x) {
union dp {
void delegate(int, int, int, int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.resize;
return cast(int) (d.f != &Fl_Scroll.resize);
}
extern (C) void _BCD_R__ZN9Fl_Scroll6resizeEiiii__Fl_Scroll_R(Fl_Scroll_R __D_class, int _0, int _1, int _2, int _3) {
__D_class.resize(_0, _1, _2, _3);
}
extern (C) int _BCD_R__ZN9Fl_Scroll6handleEi__Fl_Scroll_R_CHECK(Fl_Scroll_R x) {
union dp {
int delegate(int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.handle;
return cast(int) (d.f != &Fl_Scroll.handle);
}
extern (C) int _BCD_R__ZN9Fl_Scroll6handleEi__Fl_Scroll_R(Fl_Scroll_R __D_class, int _0) {
return __D_class.handle(_0);
}
extern (C) void *_BCD_new__ZN9Fl_ScrollC1EiiiiPKc_R(int, int, int, int, char *);
alias void function(Fl_Widget *, int) _BCD_func__15;
alias void function(Fl_Widget *) _BCD_func__17;
alias void function(Fl_Widget *, void *) _BCD_func__21;
const int HORIZONTAL = 1;
const int VERTICAL = 2;
const int BOTH = 3;
const int ALWAYS_ON = 4;
const int HORIZONTAL_ALWAYS = 5;
const int VERTICAL_ALWAYS = 6;
const int BOTH_ALWAYS = 7;
class Fl_Scroll : Fl_Group {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_9Fl_Scroll(__C_data);
__C_data = null;
}
void set_scrollbar(Fl_Scrollbar x) {
_BCD_set__ZN9Fl_Scroll9scrollbarE(__C_data, x);
}
Fl_Scrollbar get_scrollbar() {
return _BCD_get__ZN9Fl_Scroll9scrollbarE(__C_data);
}
void set_hscrollbar(Fl_Scrollbar x) {
_BCD_set__ZN9Fl_Scroll10hscrollbarE(__C_data, x);
}
Fl_Scrollbar get_hscrollbar() {
return _BCD_get__ZN9Fl_Scroll10hscrollbarE(__C_data);
}
void resize(int _0, int _1, int _2, int _3) {
_BCD__ZN9Fl_Scroll6resizeEiiii(__C_data, _0, _1, _2, _3);
}
int handle(int _0) {
return _BCD__ZN9Fl_Scroll6handleEi(__C_data, _0);
}
this(int X, int Y, int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN9Fl_ScrollC1EiiiiPKc(X, Y, W, H, l);
__C_data_owned = true;
}
int xposition() {
return _BCD__ZNK9Fl_Scroll9xpositionEv(__C_data);
}
int yposition() {
return _BCD__ZNK9Fl_Scroll9ypositionEv(__C_data);
}
void position(int _0, int _1) {
_BCD__ZN9Fl_Scroll8positionEii(__C_data, _0, _1);
}
void clear() {
_BCD__ZN9Fl_Scroll5clearEv(__C_data);
}
}
class Fl_Scroll_R : Fl_Scroll {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_9Fl_Scroll__Fl_Scroll_R(__C_data);
__C_data = null;
}
this(int X, int Y, int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN9Fl_ScrollC1EiiiiPKc_R(X, Y, W, H, l);
__C_data_owned = true;
_BCD_RI_9Fl_Scroll(__C_data, cast(void *) this);
}
}