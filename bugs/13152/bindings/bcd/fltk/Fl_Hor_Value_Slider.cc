/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Hor_Value_Slider.H"
extern "C" {
void _BCD_delete_19Fl_Hor_Value_Slider(Fl_Hor_Value_Slider *This) {
delete This;
}
Fl_Hor_Value_Slider *_BCD_new__ZN19Fl_Hor_Value_SliderC1EiiiiPKc(int X, int Y, int W, int H, char const * l) {
return new Fl_Hor_Value_Slider(X, Y, W, H, l);
}
}
class Fl_Hor_Value_Slider_R : Fl_Hor_Value_Slider {
public:
void *__D_data;
Fl_Hor_Value_Slider_R(int X, int Y, int W, int H, char const * l) : Fl_Hor_Value_Slider(X, Y, W, H, l) {}
};
extern "C" {
Fl_Hor_Value_Slider_R *_BCD_new__ZN19Fl_Hor_Value_SliderC1EiiiiPKc_R(int X, int Y, int W, int H, char const * l) {
return new Fl_Hor_Value_Slider_R(X, Y, W, H, l);
}
void _BCD_delete_19Fl_Hor_Value_Slider__Fl_Hor_Value_Slider_R(Fl_Hor_Value_Slider_R *This) {
delete This;
}
void _BCD_RI_19Fl_Hor_Value_Slider(Fl_Hor_Value_Slider_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__13)(Fl_Widget *, long int);
typedef _BCD_func__13 _BCD__14_Fl_Callback1;
typedef void (*_BCD_func__15)(Fl_Widget *);
typedef _BCD_func__15 _BCD__16_Fl_Callback0;
typedef void (*_BCD_func__19)(Fl_Widget *, void *);
typedef _BCD_func__19 _BCD__20_Fl_Callback;
typedef _BCD__20_Fl_Callback _BCD__18_Fl_Callback_p;
typedef long unsigned int _BCD__60_ulong;
typedef unsigned char _BCD__62_uchar;
}
