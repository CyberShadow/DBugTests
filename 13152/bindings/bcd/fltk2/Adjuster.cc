/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/Adjuster.h"
extern "C" {
typedef unsigned char _BCD__8_uchar;
void _BCD_delete_N4fltk8AdjusterE(fltk::Adjuster *This) {
delete This;
}
void _BCD_set__ZN4fltk8Adjuster13default_styleE(fltk::Adjuster *This, fltk::NamedStyle * x) {
This->default_style = x;
}
fltk::NamedStyle * _BCD_get__ZN4fltk8Adjuster13default_styleE(fltk::Adjuster *This) {
return This->default_style;
}
fltk::Adjuster *_BCD_new__ZN4fltk8AdjusterC1EiiiiPKc(int x, int y, int w, int h, char const * l) {
return new fltk::Adjuster(x, y, w, h, l);
}
void _BCD__ZN4fltk8Adjuster4softEi(fltk::Adjuster *This, int x) {
(This->soft(x));
}
int _BCD__ZNK4fltk8Adjuster4softEv(fltk::Adjuster *This) {
return (This->soft());
}
int _BCD__ZN4fltk8Adjuster6handleEi(fltk::Adjuster *This, int _0) {
return (This->handle(_0));
}
int _BCD_R__ZN4fltk8Adjuster6handleEi__Adjuster_R_CHECK(void *);
int _BCD_R__ZN4fltk8Adjuster6handleEi__Adjuster_R(void *, int _0);
}
class Adjuster_R : fltk::Adjuster {
public:
void *__D_data;
Adjuster_R(int x, int y, int w, int h, char const * l) : fltk::Adjuster(x, y, w, h, l) {}
int handle(int _0) {
if (_BCD_R__ZN4fltk8Adjuster6handleEi__Adjuster_R_CHECK(__D_data))
return _BCD_R__ZN4fltk8Adjuster6handleEi__Adjuster_R(__D_data, _0);
else
return fltk::Adjuster::handle(_0);
}
};
extern "C" {
Adjuster_R *_BCD_new__ZN4fltk8AdjusterC1EiiiiPKc_R(int x, int y, int w, int h, char const * l) {
return new Adjuster_R(x, y, w, h, l);
}
void _BCD_delete_N4fltk8AdjusterE__Adjuster_R(Adjuster_R *This) {
delete This;
}
void _BCD_RI_N4fltk8AdjusterE(Adjuster_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__154)(fltk::Widget *, long int);
typedef _BCD_func__154 _BCD__155_Callback1;
typedef void (*_BCD_func__156)(fltk::Widget *);
typedef _BCD_func__156 _BCD__157_Callback0;
typedef void (*_BCD_func__160)(fltk::Widget *, void *);
typedef _BCD_func__160 _BCD__161_Callback;
typedef _BCD__161_Callback _BCD__159_Callback_p;
typedef bool (*_BCD_func__297)();
typedef _BCD_func__297 _BCD__172_Theme;
typedef fltk::Symbol * _BCD__225_Box;
typedef unsigned int _BCD__242_Color;
typedef int _BCD__245_Flags;
typedef _BCD__245_Flags _BCD__244_Align;
}
