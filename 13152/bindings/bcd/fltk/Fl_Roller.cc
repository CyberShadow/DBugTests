/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Roller.H"
extern "C" {
void _BCD_delete_9Fl_Roller(Fl_Roller *This) {
delete This;
}
int _BCD__ZN9Fl_Roller6handleEi(Fl_Roller *This, int _0) {
return (This->handle(_0));
}
Fl_Roller *_BCD_new__ZN9Fl_RollerC1EiiiiPKc(int X, int Y, int W, int H, char const * L) {
return new Fl_Roller(X, Y, W, H, L);
}
int _BCD_R__ZN9Fl_Roller6handleEi__Fl_Roller_R_CHECK(void *);
int _BCD_R__ZN9Fl_Roller6handleEi__Fl_Roller_R(void *, int _0);
}
class Fl_Roller_R : Fl_Roller {
public:
void *__D_data;
int handle(int _0) {
if (_BCD_R__ZN9Fl_Roller6handleEi__Fl_Roller_R_CHECK(__D_data))
return _BCD_R__ZN9Fl_Roller6handleEi__Fl_Roller_R(__D_data, _0);
else
return Fl_Roller::handle(_0);
}
Fl_Roller_R(int X, int Y, int W, int H, char const * L) : Fl_Roller(X, Y, W, H, L) {}
};
extern "C" {
Fl_Roller_R *_BCD_new__ZN9Fl_RollerC1EiiiiPKc_R(int X, int Y, int W, int H, char const * L) {
return new Fl_Roller_R(X, Y, W, H, L);
}
void _BCD_delete_9Fl_Roller__Fl_Roller_R(Fl_Roller_R *This) {
delete This;
}
void _BCD_RI_9Fl_Roller(Fl_Roller_R *cd, void *dd) {
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
