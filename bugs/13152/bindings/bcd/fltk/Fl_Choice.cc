/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Choice.H"
extern "C" {
void _BCD_delete_9Fl_Choice(Fl_Choice *This) {
delete This;
}
int _BCD__ZN9Fl_Choice6handleEi(Fl_Choice *This, int _0) {
return (This->handle(_0));
}
Fl_Choice *_BCD_new__ZN9Fl_ChoiceC1EiiiiPKc(int _0, int _1, int _2, int _3, char const * _4) {
return new Fl_Choice(_0, _1, _2, _3, _4);
}
int _BCD__ZN9Fl_Choice5valueEPK12Fl_Menu_Item(Fl_Choice *This, Fl_Menu_Item const * _0) {
return (This->value(_0));
}
int _BCD__ZN9Fl_Choice5valueEi(Fl_Choice *This, int i) {
return (This->value(i));
}
int _BCD__ZNK9Fl_Choice5valueEv(Fl_Choice *This) {
return (This->value());
}
int _BCD_R__ZN9Fl_Choice6handleEi__Fl_Choice_R_CHECK(void *);
int _BCD_R__ZN9Fl_Choice6handleEi__Fl_Choice_R(void *, int _0);
}
class Fl_Choice_R : Fl_Choice {
public:
void *__D_data;
int handle(int _0) {
if (_BCD_R__ZN9Fl_Choice6handleEi__Fl_Choice_R_CHECK(__D_data))
return _BCD_R__ZN9Fl_Choice6handleEi__Fl_Choice_R(__D_data, _0);
else
return Fl_Choice::handle(_0);
}
Fl_Choice_R(int _0, int _1, int _2, int _3, char const * _4) : Fl_Choice(_0, _1, _2, _3, _4) {}
};
extern "C" {
Fl_Choice_R *_BCD_new__ZN9Fl_ChoiceC1EiiiiPKc_R(int _0, int _1, int _2, int _3, char const * _4) {
return new Fl_Choice_R(_0, _1, _2, _3, _4);
}
void _BCD_delete_9Fl_Choice__Fl_Choice_R(Fl_Choice_R *This) {
delete This;
}
void _BCD_RI_9Fl_Choice(Fl_Choice_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef Fl_Menu_Item * _BCD__8_Fl_Menu;
typedef void (*_BCD_func__17)(Fl_Widget *, long int);
typedef _BCD_func__17 _BCD__18_Fl_Callback1;
typedef void (*_BCD_func__19)(Fl_Widget *);
typedef _BCD_func__19 _BCD__20_Fl_Callback0;
typedef void (*_BCD_func__23)(Fl_Widget *, void *);
typedef _BCD_func__23 _BCD__24_Fl_Callback;
typedef _BCD__24_Fl_Callback _BCD__22_Fl_Callback_p;
typedef long unsigned int _BCD__64_ulong;
typedef unsigned char _BCD__66_uchar;
}
