/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Bitmap.H"
extern "C" {
void _BCD_delete_9Fl_Bitmap(Fl_Bitmap *This) {
delete This;
}
typedef unsigned char _BCD__49_uchar;
void _BCD_set__ZN9Fl_Bitmap5arrayE(Fl_Bitmap *This, _BCD__49_uchar const * x) {
This->array = x;
}
_BCD__49_uchar const * _BCD_get__ZN9Fl_Bitmap5arrayE(Fl_Bitmap *This) {
return This->array;
}
void _BCD_set__ZN9Fl_Bitmap11alloc_arrayE(Fl_Bitmap *This, int x) {
This->alloc_array = x;
}
int _BCD_get__ZN9Fl_Bitmap11alloc_arrayE(Fl_Bitmap *This) {
return This->alloc_array;
}
void _BCD_set__ZN9Fl_Bitmap2idE(Fl_Bitmap *This, unsigned int x) {
This->id = x;
}
unsigned int _BCD_get__ZN9Fl_Bitmap2idE(Fl_Bitmap *This) {
return This->id;
}
Fl_Bitmap *_BCD_new__ZN9Fl_BitmapC1EPKhii(_BCD__49_uchar const * bits, int W, int H) {
return new Fl_Bitmap(bits, W, H);
}
Fl_Image * _BCD__ZN9Fl_Bitmap4copyEii(Fl_Bitmap *This, int W, int H) {
return (This->copy(W, H));
}
Fl_Image * _BCD__ZN9Fl_Bitmap4copyEv(Fl_Bitmap *This) {
return (This->copy());
}
void _BCD__ZN9Fl_Bitmap4drawEiiiiii(Fl_Bitmap *This, int X, int Y, int W, int H, int cx, int cy) {
(This->draw(X, Y, W, H, cx, cy));
}
void _BCD__ZN9Fl_Bitmap4drawEii(Fl_Bitmap *This, int X, int Y) {
(This->draw(X, Y));
}
void _BCD__ZN9Fl_Bitmap5labelEP9Fl_Widget(Fl_Bitmap *This, Fl_Widget * w) {
(This->label(w));
}
void _BCD__ZN9Fl_Bitmap7uncacheEv(Fl_Bitmap *This) {
(This->uncache());
}
int _BCD_R__ZN9Fl_Bitmap4copyEii__Fl_Bitmap_R_CHECK(void *);
Fl_Image * _BCD_R__ZN9Fl_Bitmap4copyEii__Fl_Bitmap_R(void *, int W, int H);
int _BCD_R__ZN9Fl_Bitmap4drawEiiiiii__Fl_Bitmap_R_CHECK(void *);
void _BCD_R__ZN9Fl_Bitmap4drawEiiiiii__Fl_Bitmap_R(void *, int X, int Y, int W, int H, int cx, int cy);
int _BCD_R__ZN9Fl_Bitmap5labelEP9Fl_Widget__Fl_Bitmap_R_CHECK(void *);
void _BCD_R__ZN9Fl_Bitmap5labelEP9Fl_Widget__Fl_Bitmap_R(void *, Fl_Widget * w);
int _BCD_R__ZN9Fl_Bitmap7uncacheEv__Fl_Bitmap_R_CHECK(void *);
void _BCD_R__ZN9Fl_Bitmap7uncacheEv__Fl_Bitmap_R(void *);
}
class Fl_Bitmap_R : Fl_Bitmap {
public:
void *__D_data;
Fl_Bitmap_R(_BCD__49_uchar const * bits, int W, int H) : Fl_Bitmap(bits, W, H) {}
Fl_Image * copy(int W, int H) {
if (_BCD_R__ZN9Fl_Bitmap4copyEii__Fl_Bitmap_R_CHECK(__D_data))
return _BCD_R__ZN9Fl_Bitmap4copyEii__Fl_Bitmap_R(__D_data, W, H);
else
return Fl_Bitmap::copy(W, H);
}
void draw(int X, int Y, int W, int H, int cx, int cy) {
if (_BCD_R__ZN9Fl_Bitmap4drawEiiiiii__Fl_Bitmap_R_CHECK(__D_data))
_BCD_R__ZN9Fl_Bitmap4drawEiiiiii__Fl_Bitmap_R(__D_data, X, Y, W, H, cx, cy);
else
Fl_Bitmap::draw(X, Y, W, H, cx, cy);
}
void label(Fl_Widget * w) {
if (_BCD_R__ZN9Fl_Bitmap5labelEP9Fl_Widget__Fl_Bitmap_R_CHECK(__D_data))
_BCD_R__ZN9Fl_Bitmap5labelEP9Fl_Widget__Fl_Bitmap_R(__D_data, w);
else
Fl_Bitmap::label(w);
}
void uncache() {
if (_BCD_R__ZN9Fl_Bitmap7uncacheEv__Fl_Bitmap_R_CHECK(__D_data))
_BCD_R__ZN9Fl_Bitmap7uncacheEv__Fl_Bitmap_R(__D_data);
else
Fl_Bitmap::uncache();
}
};
extern "C" {
Fl_Bitmap_R *_BCD_new__ZN9Fl_BitmapC1EPKhii_R(_BCD__49_uchar const * bits, int W, int H) {
return new Fl_Bitmap_R(bits, W, H);
}
void _BCD_delete_9Fl_Bitmap__Fl_Bitmap_R(Fl_Bitmap_R *This) {
delete This;
}
void _BCD_RI_9Fl_Bitmap(Fl_Bitmap_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef long unsigned int _BCD__47_ulong;
}