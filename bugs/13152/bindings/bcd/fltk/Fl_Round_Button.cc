/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Round_Button.H"
extern "C" {
void _BCD_delete_15Fl_Round_Button(Fl_Round_Button *This) {
delete This;
}
Fl_Round_Button *_BCD_new__ZN15Fl_Round_ButtonC1EiiiiPKc(int x, int y, int w, int h, char const * l) {
return new Fl_Round_Button(x, y, w, h, l);
}
}
class Fl_Round_Button_R : Fl_Round_Button {
public:
void *__D_data;
Fl_Round_Button_R(int x, int y, int w, int h, char const * l) : Fl_Round_Button(x, y, w, h, l) {}
};
extern "C" {
Fl_Round_Button_R *_BCD_new__ZN15Fl_Round_ButtonC1EiiiiPKc_R(int x, int y, int w, int h, char const * l) {
return new Fl_Round_Button_R(x, y, w, h, l);
}
void _BCD_delete_15Fl_Round_Button__Fl_Round_Button_R(Fl_Round_Button_R *This) {
delete This;
}
void _BCD_RI_15Fl_Round_Button(Fl_Round_Button_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__12)(Fl_Widget *, long int);
typedef _BCD_func__12 _BCD__13_Fl_Callback1;
typedef void (*_BCD_func__14)(Fl_Widget *);
typedef _BCD_func__14 _BCD__15_Fl_Callback0;
typedef void (*_BCD_func__18)(Fl_Widget *, void *);
typedef _BCD_func__18 _BCD__19_Fl_Callback;
typedef _BCD__19_Fl_Callback _BCD__17_Fl_Callback_p;
typedef long unsigned int _BCD__59_ulong;
typedef unsigned char _BCD__61_uchar;
}
