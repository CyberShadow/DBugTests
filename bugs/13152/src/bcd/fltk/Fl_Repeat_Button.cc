/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Repeat_Button.H"
extern "C" {
void _BCD_delete_16Fl_Repeat_Button(Fl_Repeat_Button *This) {
delete This;
}
int _BCD__ZN16Fl_Repeat_Button6handleEi(Fl_Repeat_Button *This, int _0) {
return (This->handle(_0));
}
Fl_Repeat_Button *_BCD_new__ZN16Fl_Repeat_ButtonC1EiiiiPKc(int X, int Y, int W, int H, char const * l) {
return new Fl_Repeat_Button(X, Y, W, H, l);
}
void _BCD__ZN16Fl_Repeat_Button10deactivateEv(Fl_Repeat_Button *This) {
(This->deactivate());
}
int _BCD_R__ZN16Fl_Repeat_Button6handleEi__Fl_Repeat_Button_R_CHECK(void *);
int _BCD_R__ZN16Fl_Repeat_Button6handleEi__Fl_Repeat_Button_R(void *, int _0);
}
class Fl_Repeat_Button_R : Fl_Repeat_Button {
public:
void *__D_data;
int handle(int _0) {
if (_BCD_R__ZN16Fl_Repeat_Button6handleEi__Fl_Repeat_Button_R_CHECK(__D_data))
return _BCD_R__ZN16Fl_Repeat_Button6handleEi__Fl_Repeat_Button_R(__D_data, _0);
else
return Fl_Repeat_Button::handle(_0);
}
Fl_Repeat_Button_R(int X, int Y, int W, int H, char const * l) : Fl_Repeat_Button(X, Y, W, H, l) {}
};
extern "C" {
Fl_Repeat_Button_R *_BCD_new__ZN16Fl_Repeat_ButtonC1EiiiiPKc_R(int X, int Y, int W, int H, char const * l) {
return new Fl_Repeat_Button_R(X, Y, W, H, l);
}
void _BCD_delete_16Fl_Repeat_Button__Fl_Repeat_Button_R(Fl_Repeat_Button_R *This) {
delete This;
}
void _BCD_RI_16Fl_Repeat_Button(Fl_Repeat_Button_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__9)(Fl_Widget *, long int);
typedef _BCD_func__9 _BCD__10_Fl_Callback1;
typedef void (*_BCD_func__11)(Fl_Widget *);
typedef _BCD_func__11 _BCD__12_Fl_Callback0;
typedef void (*_BCD_func__15)(Fl_Widget *, void *);
typedef _BCD_func__15 _BCD__16_Fl_Callback;
typedef _BCD__16_Fl_Callback _BCD__14_Fl_Callback_p;
typedef void (*_BCD_func__393)(void *);
typedef _BCD_func__393 _BCD__20_Fl_Timeout_Handler;
typedef void (*_BCD_func__21)(int, int, int, int, enum Fl_Color);
typedef _BCD_func__21 _BCD__22_Fl_Box_Draw_F;
typedef void (*_BCD_func__23)(Fl_Label const *, int &, int &);
typedef _BCD_func__23 _BCD__24_Fl_Label_Measure_F;
typedef void (*_BCD_func__25)(Fl_Label const *, int, int, int, int, enum Fl_Align);
typedef _BCD_func__25 _BCD__26_Fl_Label_Draw_F;
typedef long unsigned int _BCD__66_ulong;
typedef unsigned char _BCD__68_uchar;
}
