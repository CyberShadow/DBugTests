/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Dial.H"
extern "C" {
void _BCD_delete_7Fl_Dial(Fl_Dial *This) {
delete This;
}
int _BCD__ZN7Fl_Dial6handleEi(Fl_Dial *This, int _0) {
return (This->handle(_0));
}
Fl_Dial *_BCD_new__ZN7Fl_DialC1EiiiiPKc(int x, int y, int w, int h, char const * l) {
return new Fl_Dial(x, y, w, h, l);
}
short int _BCD__ZNK7Fl_Dial6angle1Ev(Fl_Dial *This) {
return (This->angle1());
}
void _BCD__ZN7Fl_Dial6angle1Es(Fl_Dial *This, short int a) {
(This->angle1(a));
}
short int _BCD__ZNK7Fl_Dial6angle2Ev(Fl_Dial *This) {
return (This->angle2());
}
void _BCD__ZN7Fl_Dial6angle2Es(Fl_Dial *This, short int a) {
(This->angle2(a));
}
void _BCD__ZN7Fl_Dial6anglesEss(Fl_Dial *This, short int a, short int b) {
(This->angles(a, b));
}
int _BCD_R__ZN7Fl_Dial6handleEi__Fl_Dial_R_CHECK(void *);
int _BCD_R__ZN7Fl_Dial6handleEi__Fl_Dial_R(void *, int _0);
}
class Fl_Dial_R : Fl_Dial {
public:
void *__D_data;
int handle(int _0) {
if (_BCD_R__ZN7Fl_Dial6handleEi__Fl_Dial_R_CHECK(__D_data))
return _BCD_R__ZN7Fl_Dial6handleEi__Fl_Dial_R(__D_data, _0);
else
return Fl_Dial::handle(_0);
}
Fl_Dial_R(int x, int y, int w, int h, char const * l) : Fl_Dial(x, y, w, h, l) {}
};
extern "C" {
Fl_Dial_R *_BCD_new__ZN7Fl_DialC1EiiiiPKc_R(int x, int y, int w, int h, char const * l) {
return new Fl_Dial_R(x, y, w, h, l);
}
void _BCD_delete_7Fl_Dial__Fl_Dial_R(Fl_Dial_R *This) {
delete This;
}
void _BCD_RI_7Fl_Dial(Fl_Dial_R *cd, void *dd) {
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
typedef unsigned char _BCD__58_uchar;
}
