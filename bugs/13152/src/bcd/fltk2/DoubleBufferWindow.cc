/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/DoubleBufferWindow.h"
extern "C" {
typedef unsigned char _BCD__9_uchar;
void _BCD_delete_N4fltk18DoubleBufferWindowE(fltk::DoubleBufferWindow *This) {
delete This;
}
fltk::DoubleBufferWindow *_BCD_new__ZN4fltk18DoubleBufferWindowC1EiiiiPKc(int x, int y, int w, int h, char const * l) {
return new fltk::DoubleBufferWindow(x, y, w, h, l);
}
fltk::DoubleBufferWindow *_BCD_new__ZN4fltk18DoubleBufferWindowC1EiiPKc(int w, int h, char const * l) {
return new fltk::DoubleBufferWindow(w, h, l);
}
}
class DoubleBufferWindow_R : fltk::DoubleBufferWindow {
public:
void *__D_data;
DoubleBufferWindow_R(int x, int y, int w, int h, char const * l) : fltk::DoubleBufferWindow(x, y, w, h, l) {}
DoubleBufferWindow_R(int w, int h, char const * l) : fltk::DoubleBufferWindow(w, h, l) {}
};
extern "C" {
DoubleBufferWindow_R *_BCD_new__ZN4fltk18DoubleBufferWindowC1EiiiiPKc_R(int x, int y, int w, int h, char const * l) {
return new DoubleBufferWindow_R(x, y, w, h, l);
}
DoubleBufferWindow_R *_BCD_new__ZN4fltk18DoubleBufferWindowC1EiiPKc_R(int w, int h, char const * l) {
return new DoubleBufferWindow_R(w, h, l);
}
void _BCD_delete_N4fltk18DoubleBufferWindowE__DoubleBufferWindow_R(DoubleBufferWindow_R *This) {
delete This;
}
void _BCD_RI_N4fltk18DoubleBufferWindowE(DoubleBufferWindow_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__158)(fltk::Widget *, long int);
typedef _BCD_func__158 _BCD__159_Callback1;
typedef void (*_BCD_func__160)(fltk::Widget *);
typedef _BCD_func__160 _BCD__161_Callback0;
typedef void (*_BCD_func__164)(fltk::Widget *, void *);
typedef _BCD_func__164 _BCD__165_Callback;
typedef _BCD__165_Callback _BCD__163_Callback_p;
typedef bool (*_BCD_func__392)();
typedef _BCD_func__392 _BCD__176_Theme;
typedef fltk::Symbol * _BCD__229_Box;
typedef unsigned int _BCD__246_Color;
typedef int _BCD__249_Flags;
typedef _BCD__249_Flags _BCD__248_Align;
}