/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Single_Window.H"
extern "C" {
void _BCD_delete_16Fl_Single_Window(Fl_Single_Window *This) {
delete This;
}
void _BCD__ZN16Fl_Single_Window4showEv(Fl_Single_Window *This) {
(This->show());
}
void _BCD__ZN16Fl_Single_Window4showEiPPc(Fl_Single_Window *This, int a, char * * b) {
(This->show(a, b));
}
void _BCD__ZN16Fl_Single_Window5flushEv(Fl_Single_Window *This) {
(This->flush());
}
Fl_Single_Window *_BCD_new__ZN16Fl_Single_WindowC1EiiPKc(int W, int H, char const * l) {
return new Fl_Single_Window(W, H, l);
}
Fl_Single_Window *_BCD_new__ZN16Fl_Single_WindowC1EiiiiPKc(int X, int Y, int W, int H, char const * l) {
return new Fl_Single_Window(X, Y, W, H, l);
}
int _BCD_R__ZN16Fl_Single_Window4showEv__Fl_Single_Window_R_CHECK(void *);
void _BCD_R__ZN16Fl_Single_Window4showEv__Fl_Single_Window_R(void *);
int _BCD_R__ZN16Fl_Single_Window5flushEv__Fl_Single_Window_R_CHECK(void *);
void _BCD_R__ZN16Fl_Single_Window5flushEv__Fl_Single_Window_R(void *);
}
class Fl_Single_Window_R : Fl_Single_Window {
public:
void *__D_data;
void show() {
if (_BCD_R__ZN16Fl_Single_Window4showEv__Fl_Single_Window_R_CHECK(__D_data))
_BCD_R__ZN16Fl_Single_Window4showEv__Fl_Single_Window_R(__D_data);
else
Fl_Single_Window::show();
}
void flush() {
if (_BCD_R__ZN16Fl_Single_Window5flushEv__Fl_Single_Window_R_CHECK(__D_data))
_BCD_R__ZN16Fl_Single_Window5flushEv__Fl_Single_Window_R(__D_data);
else
Fl_Single_Window::flush();
}
Fl_Single_Window_R(int W, int H, char const * l) : Fl_Single_Window(W, H, l) {}
Fl_Single_Window_R(int X, int Y, int W, int H, char const * l) : Fl_Single_Window(X, Y, W, H, l) {}
};
extern "C" {
Fl_Single_Window_R *_BCD_new__ZN16Fl_Single_WindowC1EiiPKc_R(int W, int H, char const * l) {
return new Fl_Single_Window_R(W, H, l);
}
Fl_Single_Window_R *_BCD_new__ZN16Fl_Single_WindowC1EiiiiPKc_R(int X, int Y, int W, int H, char const * l) {
return new Fl_Single_Window_R(X, Y, W, H, l);
}
void _BCD_delete_16Fl_Single_Window__Fl_Single_Window_R(Fl_Single_Window_R *This) {
delete This;
}
void _BCD_RI_16Fl_Single_Window(Fl_Single_Window_R *cd, void *dd) {
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
