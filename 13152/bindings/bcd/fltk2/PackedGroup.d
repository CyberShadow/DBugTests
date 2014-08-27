/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.PackedGroup;
align(4):
public import bcd.bind;
public import bcd.fltk2.Group;
public import bcd.fltk2.Widget;
public import bcd.fltk2.Style;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.Rectangle;
public import bcd.fltk2.Color;
public import bcd.fltk2.Flags;
extern (C) void _BCD_delete_N4fltk11PackedGroupE(void *);
extern (C) void _BCD__ZN4fltk11PackedGroup6layoutEv(void *This);
extern (C) void *_BCD_new__ZN4fltk11PackedGroupC1EiiiiPKcb(int, int, int, int, char *, bool);
extern (C) int _BCD__ZNK4fltk11PackedGroup7spacingEv(void *This);
extern (C) void _BCD__ZN4fltk11PackedGroup7spacingEi(void *This, int);
extern (C) int _BCD__ZNK4fltk11PackedGroup11margin_leftEv(void *This);
extern (C) void _BCD__ZN4fltk11PackedGroup11margin_leftEi(void *This, int);
extern (C) int _BCD__ZNK4fltk11PackedGroup12margin_rightEv(void *This);
extern (C) void _BCD__ZN4fltk11PackedGroup12margin_rightEi(void *This, int);
extern (C) int _BCD__ZNK4fltk11PackedGroup10margin_topEv(void *This);
extern (C) void _BCD__ZN4fltk11PackedGroup10margin_topEi(void *This, int);
extern (C) int _BCD__ZNK4fltk11PackedGroup13margin_bottomEv(void *This);
extern (C) void _BCD__ZN4fltk11PackedGroup13margin_bottomEi(void *This, int);
extern (C) void _BCD__ZN4fltk11PackedGroup6marginEi(void *This, int);
extern (C) void _BCD_RI_N4fltk11PackedGroupE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk11PackedGroupE__PackedGroup_R(void *This);
extern (C) int _BCD_R__ZN4fltk11PackedGroup6layoutEv__PackedGroup_R_CHECK(PackedGroup_R x) {
union dp {
void delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.layout;
return cast(int) (d.f != &PackedGroup.layout);
}
extern (C) void _BCD_R__ZN4fltk11PackedGroup6layoutEv__PackedGroup_R(PackedGroup_R __D_class, ) {
__D_class.layout();
}
extern (C) void *_BCD_new__ZN4fltk11PackedGroupC1EiiiiPKcb_R(int, int, int, int, char *, bool);
alias void function(Widget *, int) _BCD_func__154;
alias void function(Widget *) _BCD_func__156;
alias void function(Widget *, void *) _BCD_func__160;
alias bool function() _BCD_func__327;
const int NORMAL = 224;
const int ALL_CHILDREN_VERTICAL = 225;
class PackedGroup : Group {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk11PackedGroupE(__C_data);
__C_data = null;
}
void layout() {
_BCD__ZN4fltk11PackedGroup6layoutEv(__C_data);
}
this(int x, int y, int w, int h, char * l = null, bool begin = false) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk11PackedGroupC1EiiiiPKcb(x, y, w, h, l, begin);
__C_data_owned = true;
}
int spacing() {
return _BCD__ZNK4fltk11PackedGroup7spacingEv(__C_data);
}
void spacing(int i) {
_BCD__ZN4fltk11PackedGroup7spacingEi(__C_data, i);
}
int margin_left() {
return _BCD__ZNK4fltk11PackedGroup11margin_leftEv(__C_data);
}
void margin_left(int m) {
_BCD__ZN4fltk11PackedGroup11margin_leftEi(__C_data, m);
}
int margin_right() {
return _BCD__ZNK4fltk11PackedGroup12margin_rightEv(__C_data);
}
void margin_right(int m) {
_BCD__ZN4fltk11PackedGroup12margin_rightEi(__C_data, m);
}
int margin_top() {
return _BCD__ZNK4fltk11PackedGroup10margin_topEv(__C_data);
}
void margin_top(int m) {
_BCD__ZN4fltk11PackedGroup10margin_topEi(__C_data, m);
}
int margin_bottom() {
return _BCD__ZNK4fltk11PackedGroup13margin_bottomEv(__C_data);
}
void margin_bottom(int m) {
_BCD__ZN4fltk11PackedGroup13margin_bottomEi(__C_data, m);
}
void margin(int m) {
_BCD__ZN4fltk11PackedGroup6marginEi(__C_data, m);
}
}
class PackedGroup_R : PackedGroup {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk11PackedGroupE__PackedGroup_R(__C_data);
__C_data = null;
}
this(int x, int y, int w, int h, char * l = null, bool begin = false) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk11PackedGroupC1EiiiiPKcb_R(x, y, w, h, l, begin);
__C_data_owned = true;
_BCD_RI_N4fltk11PackedGroupE(__C_data, cast(void *) this);
}
}
