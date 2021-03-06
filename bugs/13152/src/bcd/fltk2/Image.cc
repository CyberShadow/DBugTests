/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/Image.h"
extern "C" {
typedef unsigned char _BCD__6_uchar;
void _BCD_delete_N4fltk5ImageE(fltk::Image *This) {
delete This;
}
fltk::Image *_BCD_new__ZN4fltk5ImageC1EPKc(char const * name) {
return new fltk::Image(name);
}
fltk::Image *_BCD_new__ZN4fltk5ImageC1EiiPKc(int w, int h, char const * name) {
return new fltk::Image(w, h, name);
}
fltk::Image *_BCD_new__ZN4fltk5ImageC1ENS_9PixelTypeEiiPKc(enum fltk::PixelType p, int w, int h, char const * name) {
return new fltk::Image(p, w, h, name);
}
fltk::Image *_BCD_new__ZN4fltk5ImageC1EPKhNS_9PixelTypeEii(_BCD__6_uchar const * d, enum fltk::PixelType p, int w, int h) {
return new fltk::Image(d, p, w, h);
}
fltk::Image *_BCD_new__ZN4fltk5ImageC1EPKhNS_9PixelTypeEiii(_BCD__6_uchar const * d, enum fltk::PixelType p, int w, int h, int linedelta) {
return new fltk::Image(d, p, w, h, linedelta);
}
enum fltk::PixelType _BCD__ZNK4fltk5Image9pixeltypeEv(fltk::Image *This) {
return (This->pixeltype());
}
int _BCD__ZNK4fltk5Image5depthEv(fltk::Image *This) {
return (This->depth());
}
int _BCD__ZNK4fltk5Image1wEv(fltk::Image *This) {
return (This->w());
}
int _BCD__ZNK4fltk5Image5widthEv(fltk::Image *This) {
return (This->width());
}
int _BCD__ZNK4fltk5Image1hEv(fltk::Image *This) {
return (This->h());
}
int _BCD__ZNK4fltk5Image6heightEv(fltk::Image *This) {
return (This->height());
}
void _BCD__ZN4fltk5Image12setpixeltypeENS_9PixelTypeE(fltk::Image *This, enum fltk::PixelType _0) {
(This->setpixeltype(_0));
}
void _BCD__ZN4fltk5Image7setsizeEii(fltk::Image *This, int w, int h) {
(This->setsize(w, h));
}
void _BCD__ZN4fltk5Image9setpixelsEPKhRKNS_9RectangleEi(fltk::Image *This, _BCD__6_uchar const * d, fltk::Rectangle   const & _1, int linedelta) {
(This->setpixels(d, _1, linedelta));
}
void _BCD__ZN4fltk5Image9setpixelsEPKhRKNS_9RectangleE(fltk::Image *This, _BCD__6_uchar const * d, fltk::Rectangle   const & r) {
(This->setpixels(d, r));
}
void _BCD__ZN4fltk5Image9setpixelsEPKhi(fltk::Image *This, _BCD__6_uchar const * d, int y) {
(This->setpixels(d, y));
}
_BCD__6_uchar * _BCD__ZN4fltk5Image10linebufferEi(fltk::Image *This, int y) {
return (This->linebuffer(y));
}
void _BCD__ZN4fltk5Image8setimageEPKhNS_9PixelTypeEiii(fltk::Image *This, _BCD__6_uchar const * d, enum fltk::PixelType p, int w, int h, int linedelta) {
(This->setimage(d, p, w, h, linedelta));
}
void _BCD__ZN4fltk5Image8setimageEPKhNS_9PixelTypeEii(fltk::Image *This, _BCD__6_uchar const * d, enum fltk::PixelType p, int w, int h) {
(This->setimage(d, p, w, h));
}
_BCD__6_uchar * _BCD__ZN4fltk5Image6bufferEv(fltk::Image *This) {
return (This->buffer());
}
void _BCD__ZN4fltk5Image15set_forceARGB32Ev(fltk::Image *This) {
(This->set_forceARGB32());
}
void _BCD__ZN4fltk5Image17clear_forceARGB32Ev(fltk::Image *This) {
(This->clear_forceARGB32());
}
bool _BCD__ZNK4fltk5Image11forceARGB32Ev(fltk::Image *This) {
return (This->forceARGB32());
}
enum fltk::PixelType _BCD__ZNK4fltk5Image16buffer_pixeltypeEv(fltk::Image *This) {
return (This->buffer_pixeltype());
}
int _BCD__ZNK4fltk5Image12buffer_depthEv(fltk::Image *This) {
return (This->buffer_depth());
}
int _BCD__ZNK4fltk5Image12buffer_widthEv(fltk::Image *This) {
return (This->buffer_width());
}
int _BCD__ZNK4fltk5Image13buffer_heightEv(fltk::Image *This) {
return (This->buffer_height());
}
int _BCD__ZNK4fltk5Image16buffer_linedeltaEv(fltk::Image *This) {
return (This->buffer_linedelta());
}
void _BCD__ZN4fltk5Image14buffer_changedEv(fltk::Image *This) {
(This->buffer_changed());
}
void _BCD__ZN4fltk5Image7destroyEv(fltk::Image *This) {
(This->destroy());
}
void _BCD__ZNK4fltk5Image4drawEii(fltk::Image *This, int x, int y) {
(This->draw(x, y));
}
void _BCD__ZNK4fltk5Image4drawERKNS_9RectangleE(fltk::Image *This, fltk::Rectangle   const & r) {
(This->draw(r));
}
void _BCD__ZNK4fltk5Image4drawERKNS_9RectangleES3_(fltk::Image *This, fltk::Rectangle   const & from, fltk::Rectangle   const & to) {
(This->draw(from, to));
}
void _BCD__ZNK4fltk5Image5_drawERKNS_9RectangleE(fltk::Image *This, fltk::Rectangle   const & _0) {
(This->_draw(_0));
}
void _BCD__ZNK4fltk5Image8_measureERiS1_(fltk::Image *This, int & W, int & H) {
(This->_measure(W, H));
}
bool _BCD__ZNK4fltk5Image15fills_rectangleEv(fltk::Image *This) {
return (This->fills_rectangle());
}
bool _BCD__ZN4fltk5Image5fetchEv(fltk::Image *This) {
return (This->fetch());
}
void _BCD__ZNK4fltk5Image15fetch_if_neededEv(fltk::Image *This) {
(This->fetch_if_needed());
}
void _BCD__ZN4fltk5Image7refetchEv(fltk::Image *This) {
(This->refetch());
}
long unsigned int _BCD__ZNK4fltk5Image8mem_usedEv(fltk::Image *This) {
return (This->mem_used());
}
long unsigned int _BCD__ZN4fltk5Image14total_mem_usedEv() {
return (fltk::Image::total_mem_used());
}
void _BCD__ZN4fltk5Image5labelEPNS_6WidgetE(fltk::Image *This, fltk::Widget * o) {
(This->label(o));
}
void _BCD__ZN4fltk5Image12make_currentEv(fltk::Image *This) {
(This->make_current());
}
int _BCD_R__ZNK4fltk5Image5_drawERKNS_9RectangleE__Image_R_CHECK(void *);
void _BCD_R__ZNK4fltk5Image5_drawERKNS_9RectangleE__Image_R(void *, fltk::Rectangle   const & _0);
int _BCD_R__ZNK4fltk5Image8_measureERiS1___Image_R_CHECK(void *);
void _BCD_R__ZNK4fltk5Image8_measureERiS1___Image_R(void *, int & W, int & H);
int _BCD_R__ZNK4fltk5Image15fills_rectangleEv__Image_R_CHECK(void *);
bool _BCD_R__ZNK4fltk5Image15fills_rectangleEv__Image_R(void *);
int _BCD_R__ZN4fltk5Image5fetchEv__Image_R_CHECK(void *);
bool _BCD_R__ZN4fltk5Image5fetchEv__Image_R(void *);
}
class Image_R : fltk::Image {
public:
void *__D_data;
Image_R(char const * name) : fltk::Image(name) {}
Image_R(int w, int h, char const * name) : fltk::Image(w, h, name) {}
Image_R(enum fltk::PixelType p, int w, int h, char const * name) : fltk::Image(p, w, h, name) {}
Image_R(_BCD__6_uchar const * d, enum fltk::PixelType p, int w, int h) : fltk::Image(d, p, w, h) {}
Image_R(_BCD__6_uchar const * d, enum fltk::PixelType p, int w, int h, int linedelta) : fltk::Image(d, p, w, h, linedelta) {}
void _draw(fltk::Rectangle   const & _0) {
if (_BCD_R__ZNK4fltk5Image5_drawERKNS_9RectangleE__Image_R_CHECK(__D_data))
_BCD_R__ZNK4fltk5Image5_drawERKNS_9RectangleE__Image_R(__D_data, _0);
else
fltk::Image::_draw(_0);
}
void _measure(int & W, int & H) {
if (_BCD_R__ZNK4fltk5Image8_measureERiS1___Image_R_CHECK(__D_data))
_BCD_R__ZNK4fltk5Image8_measureERiS1___Image_R(__D_data, W, H);
else
fltk::Image::_measure(W, H);
}
bool fills_rectangle() {
if (_BCD_R__ZNK4fltk5Image15fills_rectangleEv__Image_R_CHECK(__D_data))
return _BCD_R__ZNK4fltk5Image15fills_rectangleEv__Image_R(__D_data);
else
return fltk::Image::fills_rectangle();
}
bool fetch() {
if (_BCD_R__ZN4fltk5Image5fetchEv__Image_R_CHECK(__D_data))
return _BCD_R__ZN4fltk5Image5fetchEv__Image_R(__D_data);
else
return fltk::Image::fetch();
}
};
extern "C" {
Image_R *_BCD_new__ZN4fltk5ImageC1EPKc_R(char const * name) {
return new Image_R(name);
}
Image_R *_BCD_new__ZN4fltk5ImageC1EiiPKc_R(int w, int h, char const * name) {
return new Image_R(w, h, name);
}
Image_R *_BCD_new__ZN4fltk5ImageC1ENS_9PixelTypeEiiPKc_R(enum fltk::PixelType p, int w, int h, char const * name) {
return new Image_R(p, w, h, name);
}
Image_R *_BCD_new__ZN4fltk5ImageC1EPKhNS_9PixelTypeEii_R(_BCD__6_uchar const * d, enum fltk::PixelType p, int w, int h) {
return new Image_R(d, p, w, h);
}
Image_R *_BCD_new__ZN4fltk5ImageC1EPKhNS_9PixelTypeEiii_R(_BCD__6_uchar const * d, enum fltk::PixelType p, int w, int h, int linedelta) {
return new Image_R(d, p, w, h, linedelta);
}
void _BCD_delete_N4fltk5ImageE__Image_R(Image_R *This) {
delete This;
}
void _BCD_RI_N4fltk5ImageE(Image_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef unsigned int _BCD__171_Color;
typedef int _BCD__174_Flags;
typedef _BCD__174_Flags _BCD__173_Align;
}
