/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/LightButton.h"
extern "C" {
typedef unsigned char _BCD__9_uchar;
void _BCD_delete_N4fltk11LightButtonE(fltk::LightButton *This) {
delete This;
}
void _BCD_set__ZN4fltk11LightButton13default_styleE(fltk::LightButton *This, fltk::NamedStyle * x) {
This->default_style = x;
}
fltk::NamedStyle * _BCD_get__ZN4fltk11LightButton13default_styleE(fltk::LightButton *This) {
return This->default_style;
}
fltk::LightButton *_BCD_new__ZN4fltk11LightButtonC1EiiiiPKc(int x, int y, int w, int h, char const * l) {
return new fltk::LightButton(x, y, w, h, l);
}
typedef int _BCD__247_Flags;
void _BCD__ZN4fltk11LightButton13default_glyphEPKNS_6WidgetEiiiiii(fltk::Widget const * _0, int _1, int _2, int _3, int _4, int _5, _BCD__247_Flags _6) {
(fltk::LightButton::default_glyph(_0, _1, _2, _3, _4, _5, _6));
}
}
class LightButton_R : fltk::LightButton {
public:
void *__D_data;
LightButton_R(int x, int y, int w, int h, char const * l) : fltk::LightButton(x, y, w, h, l) {}
};
extern "C" {
LightButton_R *_BCD_new__ZN4fltk11LightButtonC1EiiiiPKc_R(int x, int y, int w, int h, char const * l) {
return new LightButton_R(x, y, w, h, l);
}
void _BCD_delete_N4fltk11LightButtonE__LightButton_R(LightButton_R *This) {
delete This;
}
void _BCD_RI_N4fltk11LightButtonE(LightButton_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__156)(fltk::Widget *, long int);
typedef _BCD_func__156 _BCD__157_Callback1;
typedef void (*_BCD_func__158)(fltk::Widget *);
typedef _BCD_func__158 _BCD__159_Callback0;
typedef void (*_BCD_func__162)(fltk::Widget *, void *);
typedef _BCD_func__162 _BCD__163_Callback;
typedef _BCD__163_Callback _BCD__161_Callback_p;
typedef bool (*_BCD_func__277)();
typedef _BCD_func__277 _BCD__174_Theme;
typedef fltk::Symbol * _BCD__227_Box;
typedef unsigned int _BCD__244_Color;
typedef _BCD__247_Flags _BCD__246_Align;
}