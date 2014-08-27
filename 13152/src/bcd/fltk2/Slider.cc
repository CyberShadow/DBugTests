/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/Slider.h"
extern "C" {
typedef unsigned char _BCD__8_uchar;
void _BCD_delete_N4fltk6SliderE(fltk::Slider *This) {
delete This;
}
void _BCD_set__ZN4fltk6Slider13default_styleE(fltk::Slider *This, fltk::NamedStyle * x) {
This->default_style = x;
}
fltk::NamedStyle * _BCD_get__ZN4fltk6Slider13default_styleE(fltk::Slider *This) {
return This->default_style;
}
bool _BCD__ZNK4fltk6Slider10horizontalEv(fltk::Slider *This) {
return (This->horizontal());
}
bool _BCD__ZNK4fltk6Slider3logEv(fltk::Slider *This) {
return (This->log());
}
void _BCD__ZN4fltk6Slider4drawEv(fltk::Slider *This) {
(This->draw());
}
int _BCD__ZN4fltk6Slider6handleEi(fltk::Slider *This, int _0) {
return (This->handle(_0));
}
fltk::Slider *_BCD_new__ZN4fltk6SliderC1EiiiiPKc(int x, int y, int w, int h, char const * l) {
return new fltk::Slider(x, y, w, h, l);
}
short unsigned int _BCD__ZNK4fltk6Slider11slider_sizeEv(fltk::Slider *This) {
return (This->slider_size());
}
void _BCD__ZN4fltk6Slider11slider_sizeEi(fltk::Slider *This, int n) {
(This->slider_size(n));
}
short unsigned int _BCD__ZNK4fltk6Slider9tick_sizeEv(fltk::Slider *This) {
return (This->tick_size());
}
void _BCD__ZN4fltk6Slider9tick_sizeEi(fltk::Slider *This, int n) {
(This->tick_size(n));
}
int _BCD__ZN4fltk6Slider15slider_positionEdi(fltk::Slider *This, double value, int w) {
return (This->slider_position(value, w));
}
double _BCD__ZN4fltk6Slider14position_valueEii(fltk::Slider *This, int x, int w) {
return (This->position_value(x, w));
}
int _BCD__ZN4fltk6Slider6handleEiRKNS_9RectangleE(fltk::Slider *This, int event, fltk::Rectangle   const & _1) {
return (This->handle(event, _1));
}
void _BCD__ZN4fltk6Slider10draw_ticksERKNS_9RectangleEi(fltk::Slider *This, fltk::Rectangle   const & _0, int min_spacing) {
(This->draw_ticks(_0, min_spacing));
}
typedef int _BCD__245_Flags;
bool _BCD__ZN4fltk6Slider4drawERKNS_9RectangleEib(fltk::Slider *This, fltk::Rectangle   const & _0, _BCD__245_Flags flags, bool slot) {
return (This->draw(_0, flags, slot));
}
int _BCD_R__ZN4fltk6Slider4drawEv__Slider_R_CHECK(void *);
void _BCD_R__ZN4fltk6Slider4drawEv__Slider_R(void *);
int _BCD_R__ZN4fltk6Slider6handleEi__Slider_R_CHECK(void *);
int _BCD_R__ZN4fltk6Slider6handleEi__Slider_R(void *, int _0);
}
class Slider_R : fltk::Slider {
public:
void *__D_data;
void draw() {
if (_BCD_R__ZN4fltk6Slider4drawEv__Slider_R_CHECK(__D_data))
_BCD_R__ZN4fltk6Slider4drawEv__Slider_R(__D_data);
else
fltk::Slider::draw();
}
int handle(int _0) {
if (_BCD_R__ZN4fltk6Slider6handleEi__Slider_R_CHECK(__D_data))
return _BCD_R__ZN4fltk6Slider6handleEi__Slider_R(__D_data, _0);
else
return fltk::Slider::handle(_0);
}
Slider_R(int x, int y, int w, int h, char const * l) : fltk::Slider(x, y, w, h, l) {}
};
extern "C" {
Slider_R *_BCD_new__ZN4fltk6SliderC1EiiiiPKc_R(int x, int y, int w, int h, char const * l) {
return new Slider_R(x, y, w, h, l);
}
void _BCD_delete_N4fltk6SliderE__Slider_R(Slider_R *This) {
delete This;
}
void _BCD_RI_N4fltk6SliderE(Slider_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__154)(fltk::Widget *, long int);
typedef _BCD_func__154 _BCD__155_Callback1;
typedef void (*_BCD_func__156)(fltk::Widget *);
typedef _BCD_func__156 _BCD__157_Callback0;
typedef void (*_BCD_func__160)(fltk::Widget *, void *);
typedef _BCD_func__160 _BCD__161_Callback;
typedef _BCD__161_Callback _BCD__159_Callback_p;
typedef bool (*_BCD_func__303)();
typedef _BCD_func__303 _BCD__172_Theme;
typedef fltk::Symbol * _BCD__225_Box;
typedef unsigned int _BCD__242_Color;
typedef _BCD__245_Flags _BCD__244_Align;
}
