/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/FillDial.h"
extern "C" {
typedef unsigned char _BCD__9_uchar;
void _BCD_delete_N4fltk8FillDialE(fltk::FillDial *This) {
delete This;
}
fltk::FillDial *_BCD_new__ZN4fltk8FillDialC1EiiiiPKc(int x, int y, int w, int h, char const * l) {
return new fltk::FillDial(x, y, w, h, l);
}
}
class FillDial_R : fltk::FillDial {
public:
void *__D_data;
FillDial_R(int x, int y, int w, int h, char const * l) : fltk::FillDial(x, y, w, h, l) {}
};
extern "C" {
FillDial_R *_BCD_new__ZN4fltk8FillDialC1EiiiiPKc_R(int x, int y, int w, int h, char const * l) {
return new FillDial_R(x, y, w, h, l);
}
void _BCD_delete_N4fltk8FillDialE__FillDial_R(FillDial_R *This) {
delete This;
}
void _BCD_RI_N4fltk8FillDialE(FillDial_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__156)(fltk::Widget *, long int);
typedef _BCD_func__156 _BCD__157_Callback1;
typedef void (*_BCD_func__158)(fltk::Widget *);
typedef _BCD_func__158 _BCD__159_Callback0;
typedef void (*_BCD_func__162)(fltk::Widget *, void *);
typedef _BCD_func__162 _BCD__163_Callback;
typedef _BCD__163_Callback _BCD__161_Callback_p;
typedef bool (*_BCD_func__302)();
typedef _BCD_func__302 _BCD__174_Theme;
typedef fltk::Symbol * _BCD__227_Box;
typedef unsigned int _BCD__244_Color;
typedef int _BCD__247_Flags;
typedef _BCD__247_Flags _BCD__246_Align;
}
