/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Value_Slider.H"
extern "C" {
void _BCD_delete_15Fl_Value_Slider(Fl_Value_Slider *This) {
delete This;
}
void _BCD__ZN15Fl_Value_Slider4drawEv(Fl_Value_Slider *This) {
(This->draw());
}
int _BCD__ZN15Fl_Value_Slider6handleEi(Fl_Value_Slider *This, int _0) {
return (This->handle(_0));
}
Fl_Value_Slider *_BCD_new__ZN15Fl_Value_SliderC1EiiiiPKc(int x, int y, int w, int h, char const * l) {
return new Fl_Value_Slider(x, y, w, h, l);
}
enum Fl_Font _BCD__ZNK15Fl_Value_Slider8textfontEv(Fl_Value_Slider *This) {
return (This->textfont());
}
typedef unsigned char _BCD__60_uchar;
void _BCD__ZN15Fl_Value_Slider8textfontEh(Fl_Value_Slider *This, _BCD__60_uchar s) {
(This->textfont(s));
}
_BCD__60_uchar _BCD__ZNK15Fl_Value_Slider8textsizeEv(Fl_Value_Slider *This) {
return (This->textsize());
}
void _BCD__ZN15Fl_Value_Slider8textsizeEh(Fl_Value_Slider *This, _BCD__60_uchar s) {
(This->textsize(s));
}
enum Fl_Color _BCD__ZNK15Fl_Value_Slider9textcolorEv(Fl_Value_Slider *This) {
return (This->textcolor());
}
void _BCD__ZN15Fl_Value_Slider9textcolorEj(Fl_Value_Slider *This, unsigned int s) {
(This->textcolor(s));
}
int _BCD_R__ZN15Fl_Value_Slider4drawEv__Fl_Value_Slider_R_CHECK(void *);
void _BCD_R__ZN15Fl_Value_Slider4drawEv__Fl_Value_Slider_R(void *);
int _BCD_R__ZN15Fl_Value_Slider6handleEi__Fl_Value_Slider_R_CHECK(void *);
int _BCD_R__ZN15Fl_Value_Slider6handleEi__Fl_Value_Slider_R(void *, int _0);
}
class Fl_Value_Slider_R : Fl_Value_Slider {
public:
void *__D_data;
void draw() {
if (_BCD_R__ZN15Fl_Value_Slider4drawEv__Fl_Value_Slider_R_CHECK(__D_data))
_BCD_R__ZN15Fl_Value_Slider4drawEv__Fl_Value_Slider_R(__D_data);
else
Fl_Value_Slider::draw();
}
int handle(int _0) {
if (_BCD_R__ZN15Fl_Value_Slider6handleEi__Fl_Value_Slider_R_CHECK(__D_data))
return _BCD_R__ZN15Fl_Value_Slider6handleEi__Fl_Value_Slider_R(__D_data, _0);
else
return Fl_Value_Slider::handle(_0);
}
Fl_Value_Slider_R(int x, int y, int w, int h, char const * l) : Fl_Value_Slider(x, y, w, h, l) {}
};
extern "C" {
Fl_Value_Slider_R *_BCD_new__ZN15Fl_Value_SliderC1EiiiiPKc_R(int x, int y, int w, int h, char const * l) {
return new Fl_Value_Slider_R(x, y, w, h, l);
}
void _BCD_delete_15Fl_Value_Slider__Fl_Value_Slider_R(Fl_Value_Slider_R *This) {
delete This;
}
void _BCD_RI_15Fl_Value_Slider(Fl_Value_Slider_R *cd, void *dd) {
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
}
