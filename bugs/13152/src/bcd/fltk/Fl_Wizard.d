/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_Wizard;
public import bcd.bind;
public import bcd.fltk.Fl_Group;
public import bcd.fltk.Fl_Widget;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_9Fl_Wizard(void *);
extern (C) void *_BCD_new__ZN9Fl_WizardC1EiiiiPKc(int, int, int, int, char *);
extern (C) void _BCD__ZN9Fl_Wizard4nextEv(void *This);
extern (C) void _BCD__ZN9Fl_Wizard4prevEv(void *This);
extern (C) Fl_Widget * _BCD__ZN9Fl_Wizard5valueEv(void *This);
extern (C) void _BCD__ZN9Fl_Wizard5valueEP9Fl_Widget(void *This, void *);
extern (C) void _BCD_RI_9Fl_Wizard(void *cd, void *dd);
extern (C) void _BCD_delete_9Fl_Wizard__Fl_Wizard_R(void *This);
extern (C) void *_BCD_new__ZN9Fl_WizardC1EiiiiPKc_R(int, int, int, int, char *);
alias void function(Fl_Widget *, int) _BCD_func__9;
alias void function(Fl_Widget *) _BCD_func__11;
alias void function(Fl_Widget *, void *) _BCD_func__15;
class Fl_Wizard : Fl_Group {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_9Fl_Wizard(__C_data);
__C_data = null;
}
this(int _0, int _1, int _2, int _3, char * _4) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN9Fl_WizardC1EiiiiPKc(_0, _1, _2, _3, _4);
__C_data_owned = true;
}
void next() {
_BCD__ZN9Fl_Wizard4nextEv(__C_data);
}
void prev() {
_BCD__ZN9Fl_Wizard4prevEv(__C_data);
}
Fl_Widget * value() {
return _BCD__ZN9Fl_Wizard5valueEv(__C_data);
}
void value(Fl_Widget * _0) {
_BCD__ZN9Fl_Wizard5valueEP9Fl_Widget(__C_data, _0.__C_data);
}
}
class Fl_Wizard_R : Fl_Wizard {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_9Fl_Wizard__Fl_Wizard_R(__C_data);
__C_data = null;
}
this(int _0, int _1, int _2, int _3, char * _4) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN9Fl_WizardC1EiiiiPKc_R(_0, _1, _2, _3, _4);
__C_data_owned = true;
_BCD_RI_9Fl_Wizard(__C_data, cast(void *) this);
}
}