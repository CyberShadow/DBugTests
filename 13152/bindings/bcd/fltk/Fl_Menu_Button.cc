/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Menu_Button.H"
extern "C" {
void _BCD_delete_14Fl_Menu_Button(Fl_Menu_Button *This) {
delete This;
}
int _BCD__ZN14Fl_Menu_Button6handleEi(Fl_Menu_Button *This, int _0) {
return (This->handle(_0));
}
Fl_Menu_Item const * _BCD__ZN14Fl_Menu_Button5popupEv(Fl_Menu_Button *This) {
return (This->popup());
}
Fl_Menu_Button *_BCD_new__ZN14Fl_Menu_ButtonC1EiiiiPKc(int _0, int _1, int _2, int _3, char const * _4) {
return new Fl_Menu_Button(_0, _1, _2, _3, _4);
}
int _BCD_R__ZN14Fl_Menu_Button6handleEi__Fl_Menu_Button_R_CHECK(void *);
int _BCD_R__ZN14Fl_Menu_Button6handleEi__Fl_Menu_Button_R(void *, int _0);
}
class Fl_Menu_Button_R : Fl_Menu_Button {
public:
void *__D_data;
int handle(int _0) {
if (_BCD_R__ZN14Fl_Menu_Button6handleEi__Fl_Menu_Button_R_CHECK(__D_data))
return _BCD_R__ZN14Fl_Menu_Button6handleEi__Fl_Menu_Button_R(__D_data, _0);
else
return Fl_Menu_Button::handle(_0);
}
Fl_Menu_Button_R(int _0, int _1, int _2, int _3, char const * _4) : Fl_Menu_Button(_0, _1, _2, _3, _4) {}
};
extern "C" {
Fl_Menu_Button_R *_BCD_new__ZN14Fl_Menu_ButtonC1EiiiiPKc_R(int _0, int _1, int _2, int _3, char const * _4) {
return new Fl_Menu_Button_R(_0, _1, _2, _3, _4);
}
void _BCD_delete_14Fl_Menu_Button__Fl_Menu_Button_R(Fl_Menu_Button_R *This) {
delete This;
}
void _BCD_RI_14Fl_Menu_Button(Fl_Menu_Button_R *cd, void *dd) {
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