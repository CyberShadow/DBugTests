/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/ShapedWindow.h"
extern "C" {
typedef unsigned char _BCD__12_uchar;
void _BCD_delete_N4fltk12ShapedWindowE(fltk::ShapedWindow *This) {
delete This;
}
fltk::ShapedWindow *_BCD_new__ZN4fltk12ShapedWindowC1EiiPKc(int W, int H, char const * l) {
return new fltk::ShapedWindow(W, H, l);
}
fltk::ShapedWindow *_BCD_new__ZN4fltk12ShapedWindowC1EiiiiPKc(int X, int Y, int W, int H, char const * l) {
return new fltk::ShapedWindow(X, Y, W, H, l);
}
void _BCD__ZN4fltk12ShapedWindow5shapeEPNS_8xbmImageE(fltk::ShapedWindow *This, fltk::xbmImage * b) {
(This->shape(b));
}
}
class ShapedWindow_R : fltk::ShapedWindow {
public:
void *__D_data;
ShapedWindow_R(int W, int H, char const * l) : fltk::ShapedWindow(W, H, l) {}
ShapedWindow_R(int X, int Y, int W, int H, char const * l) : fltk::ShapedWindow(X, Y, W, H, l) {}
};
extern "C" {
ShapedWindow_R *_BCD_new__ZN4fltk12ShapedWindowC1EiiPKc_R(int W, int H, char const * l) {
return new ShapedWindow_R(W, H, l);
}
ShapedWindow_R *_BCD_new__ZN4fltk12ShapedWindowC1EiiiiPKc_R(int X, int Y, int W, int H, char const * l) {
return new ShapedWindow_R(X, Y, W, H, l);
}
void _BCD_delete_N4fltk12ShapedWindowE__ShapedWindow_R(ShapedWindow_R *This) {
delete This;
}
void _BCD_RI_N4fltk12ShapedWindowE(ShapedWindow_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__169)(fltk::Widget *, long int);
typedef _BCD_func__169 _BCD__170_Callback1;
typedef void (*_BCD_func__171)(fltk::Widget *);
typedef _BCD_func__171 _BCD__172_Callback0;
typedef void (*_BCD_func__175)(fltk::Widget *, void *);
typedef _BCD_func__175 _BCD__176_Callback;
typedef _BCD__176_Callback _BCD__174_Callback_p;
typedef bool (*_BCD_func__471)();
typedef _BCD_func__471 _BCD__187_Theme;
typedef fltk::Symbol * _BCD__240_Box;
typedef unsigned int _BCD__257_Color;
typedef int _BCD__260_Flags;
typedef _BCD__260_Flags _BCD__259_Align;
}
