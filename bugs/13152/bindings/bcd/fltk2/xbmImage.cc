/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/xbmImage.h"
extern "C" {
typedef unsigned char _BCD__7_uchar;
void _BCD_delete_N4fltk8xbmImageE(fltk::xbmImage *This) {
delete This;
}
void _BCD_set__ZN4fltk8xbmImage5arrayE(fltk::xbmImage *This, unsigned char const * x) {
This->array = x;
}
unsigned char const * _BCD_get__ZN4fltk8xbmImage5arrayE(fltk::xbmImage *This) {
return This->array;
}
fltk::xbmImage *_BCD_new__ZN4fltk8xbmImageC1EPKhii(unsigned char const * bits, int w, int h) {
return new fltk::xbmImage(bits, w, h);
}
bool _BCD__ZN4fltk8xbmImage5fetchEv(fltk::xbmImage *This) {
return (This->fetch());
}
int _BCD_R__ZN4fltk8xbmImage5fetchEv__xbmImage_R_CHECK(void *);
bool _BCD_R__ZN4fltk8xbmImage5fetchEv__xbmImage_R(void *);
}
class xbmImage_R : fltk::xbmImage {
public:
void *__D_data;
xbmImage_R(unsigned char const * bits, int w, int h) : fltk::xbmImage(bits, w, h) {}
bool fetch() {
if (_BCD_R__ZN4fltk8xbmImage5fetchEv__xbmImage_R_CHECK(__D_data))
return _BCD_R__ZN4fltk8xbmImage5fetchEv__xbmImage_R(__D_data);
else
return fltk::xbmImage::fetch();
}
};
extern "C" {
xbmImage_R *_BCD_new__ZN4fltk8xbmImageC1EPKhii_R(unsigned char const * bits, int w, int h) {
return new xbmImage_R(bits, w, h);
}
void _BCD_delete_N4fltk8xbmImageE__xbmImage_R(xbmImage_R *This) {
delete This;
}
void _BCD_RI_N4fltk8xbmImageE(xbmImage_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef unsigned int _BCD__173_Color;
typedef int _BCD__176_Flags;
typedef _BCD__176_Flags _BCD__175_Align;
}
