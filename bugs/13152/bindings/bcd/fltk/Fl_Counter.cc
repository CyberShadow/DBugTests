/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Counter.H"
extern "C" {
void _BCD_delete_10Fl_Counter(Fl_Counter *This) {
delete This;
}
int _BCD__ZN10Fl_Counter6handleEi(Fl_Counter *This, int _0) {
return (This->handle(_0));
}
Fl_Counter *_BCD_new__ZN10Fl_CounterC1EiiiiPKc(int _0, int _1, int _2, int _3, char const * _4) {
return new Fl_Counter(_0, _1, _2, _3, _4);
}
void _BCD__ZN10Fl_Counter5lstepEd(Fl_Counter *This, double a) {
(This->lstep(a));
}
void _BCD__ZN10Fl_Counter4stepEdd(Fl_Counter *This, double a, double b) {
(This->step(a, b));
}
void _BCD__ZN10Fl_Counter4stepEd(Fl_Counter *This, double a) {
(This->step(a));
}
enum Fl_Font _BCD__ZNK10Fl_Counter8textfontEv(Fl_Counter *This) {
return (This->textfont());
}
typedef unsigned char _BCD__58_uchar;
void _BCD__ZN10Fl_Counter8textfontEh(Fl_Counter *This, _BCD__58_uchar s) {
(This->textfont(s));
}
_BCD__58_uchar _BCD__ZNK10Fl_Counter8textsizeEv(Fl_Counter *This) {
return (This->textsize());
}
void _BCD__ZN10Fl_Counter8textsizeEh(Fl_Counter *This, _BCD__58_uchar s) {
(This->textsize(s));
}
enum Fl_Color _BCD__ZNK10Fl_Counter9textcolorEv(Fl_Counter *This) {
return (This->textcolor());
}
void _BCD__ZN10Fl_Counter9textcolorEj(Fl_Counter *This, unsigned int s) {
(This->textcolor(s));
}
int _BCD_R__ZN10Fl_Counter6handleEi__Fl_Counter_R_CHECK(void *);
int _BCD_R__ZN10Fl_Counter6handleEi__Fl_Counter_R(void *, int _0);
}
class Fl_Counter_R : Fl_Counter {
public:
void *__D_data;
int handle(int _0) {
if (_BCD_R__ZN10Fl_Counter6handleEi__Fl_Counter_R_CHECK(__D_data))
return _BCD_R__ZN10Fl_Counter6handleEi__Fl_Counter_R(__D_data, _0);
else
return Fl_Counter::handle(_0);
}
Fl_Counter_R(int _0, int _1, int _2, int _3, char const * _4) : Fl_Counter(_0, _1, _2, _3, _4) {}
};
extern "C" {
Fl_Counter_R *_BCD_new__ZN10Fl_CounterC1EiiiiPKc_R(int _0, int _1, int _2, int _3, char const * _4) {
return new Fl_Counter_R(_0, _1, _2, _3, _4);
}
void _BCD_delete_10Fl_Counter__Fl_Counter_R(Fl_Counter_R *This) {
delete This;
}
void _BCD_RI_10Fl_Counter(Fl_Counter_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__9)(Fl_Widget *, long int);
typedef _BCD_func__9 _BCD__10_Fl_Callback1;
typedef void (*_BCD_func__11)(Fl_Widget *);
typedef _BCD_func__11 _BCD__12_Fl_Callback0;
typedef void (*_BCD_func__15)(Fl_Widget *, void *);
typedef _BCD_func__15 _BCD__16_Fl_Callback;
typedef _BCD__16_Fl_Callback _BCD__14_Fl_Callback_p;
typedef long unsigned int _BCD__56_ulong;
}