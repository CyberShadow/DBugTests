/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_Choice;
public import bcd.bind;
public import bcd.fltk.Fl_Menu_;
public import bcd.fltk.Fl_Menu_Item;
public import bcd.fltk.Fl_Image;
public import bcd.fltk.Fl_Widget;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_9Fl_Choice(void *);
extern (C) int _BCD__ZN9Fl_Choice6handleEi(void *This, int);
extern (C) void *_BCD_new__ZN9Fl_ChoiceC1EiiiiPKc(int, int, int, int, char *);
extern (C) int _BCD__ZN9Fl_Choice5valueEPK12Fl_Menu_Item(void *This, void *);
extern (C) int _BCD__ZN9Fl_Choice5valueEi(void *This, int);
extern (C) int _BCD__ZNK9Fl_Choice5valueEv(void *This);
extern (C) void _BCD_RI_9Fl_Choice(void *cd, void *dd);
extern (C) void _BCD_delete_9Fl_Choice__Fl_Choice_R(void *This);
extern (C) int _BCD_R__ZN9Fl_Choice6handleEi__Fl_Choice_R_CHECK(Fl_Choice_R x) {
union dp {
int delegate(int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.handle;
return cast(int) (d.f != &Fl_Choice.handle);
}
extern (C) int _BCD_R__ZN9Fl_Choice6handleEi__Fl_Choice_R(Fl_Choice_R __D_class, int _0) {
return __D_class.handle(_0);
}
extern (C) void *_BCD_new__ZN9Fl_ChoiceC1EiiiiPKc_R(int, int, int, int, char *);
alias void function(Fl_Widget *, int) _BCD_func__17;
alias void function(Fl_Widget *) _BCD_func__19;
alias void function(Fl_Widget *, void *) _BCD_func__23;
class Fl_Choice : Fl_Menu_ {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_9Fl_Choice(__C_data);
__C_data = null;
}
int handle(int _0) {
return _BCD__ZN9Fl_Choice6handleEi(__C_data, _0);
}
this(int _0, int _1, int _2, int _3, char * _4) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN9Fl_ChoiceC1EiiiiPKc(_0, _1, _2, _3, _4);
__C_data_owned = true;
}
int value(Fl_Menu_Item * _0) {
return _BCD__ZN9Fl_Choice5valueEPK12Fl_Menu_Item(__C_data, _0.__C_data);
}
int value(int i) {
return _BCD__ZN9Fl_Choice5valueEi(__C_data, i);
}
int value() {
return _BCD__ZNK9Fl_Choice5valueEv(__C_data);
}
}
class Fl_Choice_R : Fl_Choice {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_9Fl_Choice__Fl_Choice_R(__C_data);
__C_data = null;
}
this(int _0, int _1, int _2, int _3, char * _4) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN9Fl_ChoiceC1EiiiiPKc_R(_0, _1, _2, _3, _4);
__C_data_owned = true;
_BCD_RI_9Fl_Choice(__C_data, cast(void *) this);
}
}
