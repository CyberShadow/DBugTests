/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Hor_Nice_Slider.H"
extern "C" {
void _BCD_delete_18Fl_Hor_Nice_Slider(Fl_Hor_Nice_Slider *This) {
delete This;
}
Fl_Hor_Nice_Slider *_BCD_new__ZN18Fl_Hor_Nice_SliderC1EiiiiPKc(int x, int y, int w, int h, char const * l) {
return new Fl_Hor_Nice_Slider(x, y, w, h, l);
}
}
class Fl_Hor_Nice_Slider_R : Fl_Hor_Nice_Slider {
public:
void *__D_data;
Fl_Hor_Nice_Slider_R(int x, int y, int w, int h, char const * l) : Fl_Hor_Nice_Slider(x, y, w, h, l) {}
};
extern "C" {
Fl_Hor_Nice_Slider_R *_BCD_new__ZN18Fl_Hor_Nice_SliderC1EiiiiPKc_R(int x, int y, int w, int h, char const * l) {
return new Fl_Hor_Nice_Slider_R(x, y, w, h, l);
}
void _BCD_delete_18Fl_Hor_Nice_Slider__Fl_Hor_Nice_Slider_R(Fl_Hor_Nice_Slider_R *This) {
delete This;
}
void _BCD_RI_18Fl_Hor_Nice_Slider(Fl_Hor_Nice_Slider_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__11)(Fl_Widget *, long int);
typedef _BCD_func__11 _BCD__12_Fl_Callback1;
typedef void (*_BCD_func__13)(Fl_Widget *);
typedef _BCD_func__13 _BCD__14_Fl_Callback0;
typedef void (*_BCD_func__17)(Fl_Widget *, void *);
typedef _BCD_func__17 _BCD__18_Fl_Callback;
typedef _BCD__18_Fl_Callback _BCD__16_Fl_Callback_p;
typedef long unsigned int _BCD__58_ulong;
typedef unsigned char _BCD__60_uchar;
}
