/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.ValueOutput;
align(4):
public import bcd.bind;
public import bcd.fltk2.Valuator;
public import bcd.fltk2.Widget;
public import bcd.fltk2.Style;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.Rectangle;
public import bcd.fltk2.Color;
public import bcd.fltk2.Flags;
extern (C) void _BCD_delete_N4fltk11ValueOutputE(void *);
extern (C) void _BCD__ZN4fltk11ValueOutput4drawEv(void *This);
extern (C) int _BCD__ZN4fltk11ValueOutput6handleEi(void *This, int);
extern (C) void *_BCD_new__ZN4fltk11ValueOutputC1EiiiiPKc(int, int, int, int, char *);
extern (C) void _BCD_RI_N4fltk11ValueOutputE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk11ValueOutputE__ValueOutput_R(void *This);
extern (C) int _BCD_R__ZN4fltk11ValueOutput4drawEv__ValueOutput_R_CHECK(ValueOutput_R x) {
union dp {
void delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.draw;
return cast(int) (d.f != &ValueOutput.draw);
}
extern (C) void _BCD_R__ZN4fltk11ValueOutput4drawEv__ValueOutput_R(ValueOutput_R __D_class, ) {
__D_class.draw();
}
extern (C) int _BCD_R__ZN4fltk11ValueOutput6handleEi__ValueOutput_R_CHECK(ValueOutput_R x) {
union dp {
int delegate(int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.handle;
return cast(int) (d.f != &ValueOutput.handle);
}
extern (C) int _BCD_R__ZN4fltk11ValueOutput6handleEi__ValueOutput_R(ValueOutput_R __D_class, int _0) {
return __D_class.handle(_0);
}
extern (C) void *_BCD_new__ZN4fltk11ValueOutputC1EiiiiPKc_R(int, int, int, int, char *);
alias void function(Widget *, int) _BCD_func__154;
alias void function(Widget *) _BCD_func__156;
alias void function(Widget *, void *) _BCD_func__160;
alias bool function() _BCD_func__288;
class ValueOutput : Valuator {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk11ValueOutputE(__C_data);
__C_data = null;
}
void draw() {
_BCD__ZN4fltk11ValueOutput4drawEv(__C_data);
}
int handle(int _0) {
return _BCD__ZN4fltk11ValueOutput6handleEi(__C_data, _0);
}
this(int x, int y, int w, int h, char * l = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk11ValueOutputC1EiiiiPKc(x, y, w, h, l);
__C_data_owned = true;
}
}
class ValueOutput_R : ValueOutput {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk11ValueOutputE__ValueOutput_R(__C_data);
__C_data = null;
}
this(int x, int y, int w, int h, char * l = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk11ValueOutputC1EiiiiPKc_R(x, y, w, h, l);
__C_data_owned = true;
_BCD_RI_N4fltk11ValueOutputE(__C_data, cast(void *) this);
}
}