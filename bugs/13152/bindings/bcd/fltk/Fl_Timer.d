/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_Timer;
public import bcd.bind;
const int FL_NORMAL_TIMER = 0;
const int FL_VALUE_TIMER = 1;
const int FL_HIDDEN_TIMER = 2;
public import bcd.fltk.Fl_Widget;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_8Fl_Timer(void *);
extern (C) int _BCD__ZN8Fl_Timer6handleEi(void *This, int);
extern (C) void *_BCD_new__ZN8Fl_TimerC1EhiiiiPKc(char, int, int, int, int, char *);
extern (C) void _BCD__ZN8Fl_Timer5valueEd(void *This, double);
extern (C) double _BCD__ZNK8Fl_Timer5valueEv(void *This);
extern (C) char _BCD__ZNK8Fl_Timer9directionEv(void *This);
extern (C) void _BCD__ZN8Fl_Timer9directionEc(void *This, char);
extern (C) char _BCD__ZNK8Fl_Timer9suspendedEv(void *This);
extern (C) void _BCD__ZN8Fl_Timer9suspendedEc(void *This, char);
extern (C) void _BCD_RI_8Fl_Timer(void *cd, void *dd);
extern (C) void _BCD_delete_8Fl_Timer__Fl_Timer_R(void *This);
extern (C) int _BCD_R__ZN8Fl_Timer6handleEi__Fl_Timer_R_CHECK(Fl_Timer_R x) {
union dp {
int delegate(int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.handle;
return cast(int) (d.f != &Fl_Timer.handle);
}
extern (C) int _BCD_R__ZN8Fl_Timer6handleEi__Fl_Timer_R(Fl_Timer_R __D_class, int _0) {
return __D_class.handle(_0);
}
extern (C) void *_BCD_new__ZN8Fl_TimerC1EhiiiiPKc_R(char, int, int, int, int, char *);
alias void function(Fl_Widget *, int) _BCD_func__7;
alias void function(Fl_Widget *) _BCD_func__9;
alias void function(Fl_Widget *, void *) _BCD_func__13;
class Fl_Timer : Fl_Widget {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_8Fl_Timer(__C_data);
__C_data = null;
}
int handle(int _0) {
return _BCD__ZN8Fl_Timer6handleEi(__C_data, _0);
}
this(char t, int x, int y, int w, int h, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN8Fl_TimerC1EhiiiiPKc(t, x, y, w, h, l);
__C_data_owned = true;
}
void value(double _0) {
_BCD__ZN8Fl_Timer5valueEd(__C_data, _0);
}
double value() {
return _BCD__ZNK8Fl_Timer5valueEv(__C_data);
}
char direction() {
return _BCD__ZNK8Fl_Timer9directionEv(__C_data);
}
void direction(char d) {
_BCD__ZN8Fl_Timer9directionEc(__C_data, d);
}
char suspended() {
return _BCD__ZNK8Fl_Timer9suspendedEv(__C_data);
}
void suspended(char d) {
_BCD__ZN8Fl_Timer9suspendedEc(__C_data, d);
}
}
class Fl_Timer_R : Fl_Timer {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_8Fl_Timer__Fl_Timer_R(__C_data);
__C_data = null;
}
this(char t, int x, int y, int w, int h, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN8Fl_TimerC1EhiiiiPKc_R(t, x, y, w, h, l);
__C_data_owned = true;
_BCD_RI_8Fl_Timer(__C_data, cast(void *) this);
}
}
