/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Toggle_Button.H"
extern "C" {
void _BCD_delete_16Fl_Toggle_Button(Fl_Toggle_Button *This) {
delete This;
}
Fl_Toggle_Button *_BCD_new__ZN16Fl_Toggle_ButtonC1EiiiiPKc(int X, int Y, int W, int H, char const * l) {
return new Fl_Toggle_Button(X, Y, W, H, l);
}
}
class Fl_Toggle_Button_R : Fl_Toggle_Button {
public:
void *__D_data;
Fl_Toggle_Button_R(int X, int Y, int W, int H, char const * l) : Fl_Toggle_Button(X, Y, W, H, l) {}
};
extern "C" {
Fl_Toggle_Button_R *_BCD_new__ZN16Fl_Toggle_ButtonC1EiiiiPKc_R(int X, int Y, int W, int H, char const * l) {
return new Fl_Toggle_Button_R(X, Y, W, H, l);
}
void _BCD_delete_16Fl_Toggle_Button__Fl_Toggle_Button_R(Fl_Toggle_Button_R *This) {
delete This;
}
void _BCD_RI_16Fl_Toggle_Button(Fl_Toggle_Button_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__10)(Fl_Widget *, long int);
typedef _BCD_func__10 _BCD__11_Fl_Callback1;
typedef void (*_BCD_func__12)(Fl_Widget *);
typedef _BCD_func__12 _BCD__13_Fl_Callback0;
typedef void (*_BCD_func__16)(Fl_Widget *, void *);
typedef _BCD_func__16 _BCD__17_Fl_Callback;
typedef _BCD__17_Fl_Callback _BCD__15_Fl_Callback_p;
typedef long unsigned int _BCD__57_ulong;
typedef unsigned char _BCD__59_uchar;
}