/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/ToggleButton.h"
extern "C" {
typedef unsigned char _BCD__8_uchar;
void _BCD_delete_N4fltk12ToggleButtonE(fltk::ToggleButton *This) {
delete This;
}
fltk::ToggleButton *_BCD_new__ZN4fltk12ToggleButtonC1EiiiiPKc(int x, int y, int w, int h, char const * l) {
return new fltk::ToggleButton(x, y, w, h, l);
}
}
class ToggleButton_R : fltk::ToggleButton {
public:
void *__D_data;
ToggleButton_R(int x, int y, int w, int h, char const * l) : fltk::ToggleButton(x, y, w, h, l) {}
};
extern "C" {
ToggleButton_R *_BCD_new__ZN4fltk12ToggleButtonC1EiiiiPKc_R(int x, int y, int w, int h, char const * l) {
return new ToggleButton_R(x, y, w, h, l);
}
void _BCD_delete_N4fltk12ToggleButtonE__ToggleButton_R(ToggleButton_R *This) {
delete This;
}
void _BCD_RI_N4fltk12ToggleButtonE(ToggleButton_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__154)(fltk::Widget *, long int);
typedef _BCD_func__154 _BCD__155_Callback1;
typedef void (*_BCD_func__156)(fltk::Widget *);
typedef _BCD_func__156 _BCD__157_Callback0;
typedef void (*_BCD_func__160)(fltk::Widget *, void *);
typedef _BCD_func__160 _BCD__161_Callback;
typedef _BCD__161_Callback _BCD__159_Callback_p;
typedef bool (*_BCD_func__268)();
typedef _BCD_func__268 _BCD__172_Theme;
typedef fltk::Symbol * _BCD__225_Box;
typedef unsigned int _BCD__242_Color;
typedef int _BCD__245_Flags;
typedef _BCD__245_Flags _BCD__244_Align;
}
