/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/xpmImage.h"
extern "C" {
typedef unsigned char _BCD__7_uchar;
void _BCD_delete_N4fltk8xpmImageE(fltk::xpmImage *This) {
delete This;
}
void _BCD_set__ZN4fltk8xpmImage4dataE(fltk::xpmImage *This, char const * const * x) {
This->data = x;
}
char const * const * _BCD_get__ZN4fltk8xpmImage4dataE(fltk::xpmImage *This) {
return This->data;
}
fltk::xpmImage *_BCD_new__ZN4fltk8xpmImageC1EPKPKcS2_(char const * const * d, char const * name) {
return new fltk::xpmImage(d, name);
}
bool _BCD__ZN4fltk8xpmImage5fetchEv(fltk::xpmImage *This) {
return (This->fetch());
}
bool _BCD__ZN4fltk8xpmImage5fetchERNS_5ImageEPKPKc(fltk::Image   & _0, char const * const * data) {
return (fltk::xpmImage::fetch(_0, data));
}
int _BCD_R__ZN4fltk8xpmImage5fetchEv__xpmImage_R_CHECK(void *);
bool _BCD_R__ZN4fltk8xpmImage5fetchEv__xpmImage_R(void *);
}
class xpmImage_R : fltk::xpmImage {
public:
void *__D_data;
xpmImage_R(char const * const * d, char const * name) : fltk::xpmImage(d, name) {}
bool fetch() {
if (_BCD_R__ZN4fltk8xpmImage5fetchEv__xpmImage_R_CHECK(__D_data))
return _BCD_R__ZN4fltk8xpmImage5fetchEv__xpmImage_R(__D_data);
else
return fltk::xpmImage::fetch();
}
};
extern "C" {
xpmImage_R *_BCD_new__ZN4fltk8xpmImageC1EPKPKcS2__R(char const * const * d, char const * name) {
return new xpmImage_R(d, name);
}
void _BCD_delete_N4fltk8xpmImageE__xpmImage_R(xpmImage_R *This) {
delete This;
}
void _BCD_RI_N4fltk8xpmImageE(xpmImage_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef unsigned int _BCD__173_Color;
typedef int _BCD__176_Flags;
typedef _BCD__176_Flags _BCD__175_Align;
}
