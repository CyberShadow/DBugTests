/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/PopupMenu.h"
extern "C" {
typedef unsigned char _BCD__10_uchar;
void _BCD_delete_N4fltk9PopupMenuE(fltk::PopupMenu *This) {
delete This;
}
void _BCD_set__ZN4fltk9PopupMenu13default_styleE(fltk::PopupMenu *This, fltk::NamedStyle * x) {
This->default_style = x;
}
fltk::NamedStyle * _BCD_get__ZN4fltk9PopupMenu13default_styleE(fltk::PopupMenu *This) {
return This->default_style;
}
int _BCD__ZN4fltk9PopupMenu6handleEi(fltk::PopupMenu *This, int _0) {
return (This->handle(_0));
}
int _BCD__ZN4fltk9PopupMenu5popupEv(fltk::PopupMenu *This) {
return (This->popup());
}
fltk::PopupMenu *_BCD_new__ZN4fltk9PopupMenuC1EiiiiPKc(int _0, int _1, int _2, int _3, char const * _4) {
return new fltk::PopupMenu(_0, _1, _2, _3, _4);
}
int _BCD_R__ZN4fltk9PopupMenu6handleEi__PopupMenu_R_CHECK(void *);
int _BCD_R__ZN4fltk9PopupMenu6handleEi__PopupMenu_R(void *, int _0);
}
class PopupMenu_R : fltk::PopupMenu {
public:
void *__D_data;
int handle(int _0) {
if (_BCD_R__ZN4fltk9PopupMenu6handleEi__PopupMenu_R_CHECK(__D_data))
return _BCD_R__ZN4fltk9PopupMenu6handleEi__PopupMenu_R(__D_data, _0);
else
return fltk::PopupMenu::handle(_0);
}
PopupMenu_R(int _0, int _1, int _2, int _3, char const * _4) : fltk::PopupMenu(_0, _1, _2, _3, _4) {}
};
extern "C" {
PopupMenu_R *_BCD_new__ZN4fltk9PopupMenuC1EiiiiPKc_R(int _0, int _1, int _2, int _3, char const * _4) {
return new PopupMenu_R(_0, _1, _2, _3, _4);
}
void _BCD_delete_N4fltk9PopupMenuE__PopupMenu_R(PopupMenu_R *This) {
delete This;
}
void _BCD_RI_N4fltk9PopupMenuE(PopupMenu_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__161)(fltk::Widget *, long int);
typedef _BCD_func__161 _BCD__162_Callback1;
typedef void (*_BCD_func__163)(fltk::Widget *);
typedef _BCD_func__163 _BCD__164_Callback0;
typedef void (*_BCD_func__167)(fltk::Widget *, void *);
typedef _BCD_func__167 _BCD__168_Callback;
typedef _BCD__168_Callback _BCD__166_Callback_p;
typedef bool (*_BCD_func__377)();
typedef _BCD_func__377 _BCD__179_Theme;
typedef fltk::Symbol * _BCD__232_Box;
typedef unsigned int _BCD__249_Color;
typedef int _BCD__252_Flags;
typedef _BCD__252_Flags _BCD__251_Align;
}