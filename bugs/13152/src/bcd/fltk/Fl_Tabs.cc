/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Tabs.H"
extern "C" {
void _BCD_delete_7Fl_Tabs(Fl_Tabs *This) {
delete This;
}
int _BCD__ZN7Fl_Tabs6handleEi(Fl_Tabs *This, int _0) {
return (This->handle(_0));
}
Fl_Widget * _BCD__ZN7Fl_Tabs5valueEv(Fl_Tabs *This) {
return (This->value());
}
int _BCD__ZN7Fl_Tabs5valueEP9Fl_Widget(Fl_Tabs *This, Fl_Widget * _0) {
return (This->value(_0));
}
Fl_Widget * _BCD__ZNK7Fl_Tabs4pushEv(Fl_Tabs *This) {
return (This->push());
}
int _BCD__ZN7Fl_Tabs4pushEP9Fl_Widget(Fl_Tabs *This, Fl_Widget * _0) {
return (This->push(_0));
}
Fl_Tabs *_BCD_new__ZN7Fl_TabsC1EiiiiPKc(int _0, int _1, int _2, int _3, char const * _4) {
return new Fl_Tabs(_0, _1, _2, _3, _4);
}
Fl_Widget * _BCD__ZN7Fl_Tabs5whichEii(Fl_Tabs *This, int event_x, int event_y) {
return (This->which(event_x, event_y));
}
int _BCD_R__ZN7Fl_Tabs6handleEi__Fl_Tabs_R_CHECK(void *);
int _BCD_R__ZN7Fl_Tabs6handleEi__Fl_Tabs_R(void *, int _0);
}
class Fl_Tabs_R : Fl_Tabs {
public:
void *__D_data;
int handle(int _0) {
if (_BCD_R__ZN7Fl_Tabs6handleEi__Fl_Tabs_R_CHECK(__D_data))
return _BCD_R__ZN7Fl_Tabs6handleEi__Fl_Tabs_R(__D_data, _0);
else
return Fl_Tabs::handle(_0);
}
Fl_Tabs_R(int _0, int _1, int _2, int _3, char const * _4) : Fl_Tabs(_0, _1, _2, _3, _4) {}
};
extern "C" {
Fl_Tabs_R *_BCD_new__ZN7Fl_TabsC1EiiiiPKc_R(int _0, int _1, int _2, int _3, char const * _4) {
return new Fl_Tabs_R(_0, _1, _2, _3, _4);
}
void _BCD_delete_7Fl_Tabs__Fl_Tabs_R(Fl_Tabs_R *This) {
delete This;
}
void _BCD_RI_7Fl_Tabs(Fl_Tabs_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__9)(Fl_Widget *, long int);
typedef _BCD_func__9 _BCD__10_Fl_Callback1;
typedef void (*_BCD_func__11)(Fl_Widget *);
typedef _BCD_func__11 _BCD__12_Fl_Callback0;
typedef void (*_BCD_func__15)(Fl_Widget *, void *);
typedef _BCD_func__15 _BCD__16_Fl_Callback;
typedef _BCD__16_Fl_Callback _BCD__14_Fl_Callback_p;
typedef long unsigned int _BCD__56_ulong;
typedef unsigned char _BCD__58_uchar;
}
