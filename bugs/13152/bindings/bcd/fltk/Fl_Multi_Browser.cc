/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Multi_Browser.H"
extern "C" {
void _BCD_delete_16Fl_Multi_Browser(Fl_Multi_Browser *This) {
delete This;
}
Fl_Multi_Browser *_BCD_new__ZN16Fl_Multi_BrowserC1EiiiiPKc(int X, int Y, int W, int H, char const * L) {
return new Fl_Multi_Browser(X, Y, W, H, L);
}
}
class Fl_Multi_Browser_R : Fl_Multi_Browser {
public:
void *__D_data;
Fl_Multi_Browser_R(int X, int Y, int W, int H, char const * L) : Fl_Multi_Browser(X, Y, W, H, L) {}
};
extern "C" {
Fl_Multi_Browser_R *_BCD_new__ZN16Fl_Multi_BrowserC1EiiiiPKc_R(int X, int Y, int W, int H, char const * L) {
return new Fl_Multi_Browser_R(X, Y, W, H, L);
}
void _BCD_delete_16Fl_Multi_Browser__Fl_Multi_Browser_R(Fl_Multi_Browser_R *This) {
delete This;
}
void _BCD_RI_16Fl_Multi_Browser(Fl_Multi_Browser_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__20)(Fl_Widget *, long int);
typedef _BCD_func__20 _BCD__21_Fl_Callback1;
typedef void (*_BCD_func__22)(Fl_Widget *);
typedef _BCD_func__22 _BCD__23_Fl_Callback0;
typedef void (*_BCD_func__26)(Fl_Widget *, void *);
typedef _BCD_func__26 _BCD__27_Fl_Callback;
typedef _BCD__27_Fl_Callback _BCD__25_Fl_Callback_p;
typedef long unsigned int _BCD__67_ulong;
typedef unsigned char _BCD__69_uchar;
}
