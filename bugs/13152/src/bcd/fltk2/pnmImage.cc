/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/pnmImage.h"
extern "C" {
typedef unsigned char _BCD__13_uchar;
void _BCD_delete_N4fltk8pnmImageE(fltk::pnmImage *This) {
delete This;
}
fltk::pnmImage *_BCD_new__ZN4fltk8pnmImageC1EPKc(char const * filename) {
return new fltk::pnmImage(filename);
}
bool _BCD__ZN4fltk8pnmImage5fetchEv(fltk::pnmImage *This) {
return (This->fetch());
}
int _BCD_R__ZN4fltk8pnmImage5fetchEv__pnmImage_R_CHECK(void *);
bool _BCD_R__ZN4fltk8pnmImage5fetchEv__pnmImage_R(void *);
}
class pnmImage_R : fltk::pnmImage {
public:
void *__D_data;
pnmImage_R(char const * filename) : fltk::pnmImage(filename) {}
bool fetch() {
if (_BCD_R__ZN4fltk8pnmImage5fetchEv__pnmImage_R_CHECK(__D_data))
return _BCD_R__ZN4fltk8pnmImage5fetchEv__pnmImage_R(__D_data);
else
return fltk::pnmImage::fetch();
}
};
extern "C" {
pnmImage_R *_BCD_new__ZN4fltk8pnmImageC1EPKc_R(char const * filename) {
return new pnmImage_R(filename);
}
void _BCD_delete_N4fltk8pnmImageE__pnmImage_R(pnmImage_R *This) {
delete This;
}
void _BCD_RI_N4fltk8pnmImageE(pnmImage_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef unsigned int _BCD__190_Color;
typedef int _BCD__193_Flags;
typedef _BCD__193_Flags _BCD__192_Align;
typedef fltk::SharedImage * (*_BCD_func__419)(char const *, _BCD__13_uchar *, int);
typedef _BCD_func__419 _BCD__253_Handler;
}