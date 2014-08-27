/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/draw.h"
extern "C" {
typedef unsigned char _BCD__4_uchar;
void _BCD_delete_N4fltk5GSaveE(fltk::GSave *This) {
delete This;
}
fltk::GSave *_BCD_new__ZN4fltk5GSaveC1Ev() {
return new fltk::GSave();
}
}
class GSave_R : fltk::GSave {
public:
void *__D_data;
GSave_R() : fltk::GSave() {}
};
extern "C" {
GSave_R *_BCD_new__ZN4fltk5GSaveC1Ev_R() {
return new GSave_R();
}
void _BCD_delete_N4fltk5GSaveE__GSave_R(GSave_R *This) {
delete This;
}
void _BCD_RI_N4fltk5GSaveE(GSave_R *cd, void *dd) {
cd->__D_data = dd;
}
void _BCD__ZN4fltk13overlay_clearEv() {
(fltk::overlay_clear());
}
void _BCD__ZN4fltk12overlay_rectEiiii(int _0, int _1, int _2, int _3) {
(fltk::overlay_rect(_0, _1, _2, _3));
}
void _BCD__ZN4fltk10drawframe2EPKciiii(char const * s, int x, int y, int w, int h) {
(fltk::drawframe2(s, x, y, w, h));
}
void _BCD__ZN4fltk9drawframeEPKciiii(char const * s, int x, int y, int w, int h) {
(fltk::drawframe(s, x, y, w, h));
}
typedef void (*_BCD_func__331)(void *, fltk::Rectangle   const &);
void _BCD__ZN4fltk10scrollrectERKNS_9RectangleEiiPFvPvS2_ES3_(fltk::Rectangle   const & _0, int dx, int dy, _BCD_func__331 draw_area, void * _4) {
(fltk::scrollrect(_0, dx, dy, draw_area, _4));
}
_BCD__4_uchar * _BCD__ZN4fltk9readimageEPhNS_9PixelTypeERKNS_9RectangleEi(_BCD__4_uchar * p, enum fltk::PixelType _1, fltk::Rectangle   const & _2, int linedelta) {
return (fltk::readimage(p, _1, _2, linedelta));
}
_BCD__4_uchar * _BCD__ZN4fltk9readimageEPhNS_9PixelTypeERKNS_9RectangleE(_BCD__4_uchar * p, enum fltk::PixelType _1, fltk::Rectangle   const & _2) {
return (fltk::readimage(p, _1, _2));
}
typedef _BCD__4_uchar const * (*_BCD_func__273)(void *, int, int, int, _BCD__4_uchar *);
typedef _BCD_func__273 _BCD__151_DrawImageCallback;
void _BCD__ZN4fltk9drawimageEPFPKhPviiiPhES2_NS_9PixelTypeERKNS_9RectangleE(_BCD__151_DrawImageCallback _0, void * _1, enum fltk::PixelType _2, fltk::Rectangle   const & _3) {
(fltk::drawimage(_0, _1, _2, _3));
}
void _BCD__ZN4fltk9drawimageEPKhNS_9PixelTypeERKNS_9RectangleEi(_BCD__4_uchar const * _0, enum fltk::PixelType _1, fltk::Rectangle   const & _2, int linedelta) {
(fltk::drawimage(_0, _1, _2, linedelta));
}
void _BCD__ZN4fltk9drawimageEPKhNS_9PixelTypeERKNS_9RectangleE(_BCD__4_uchar const * _0, enum fltk::PixelType _1, fltk::Rectangle   const & _2) {
(fltk::drawimage(_0, _1, _2));
}
void _BCD__ZN4fltk13column_widthsEPKi(int const * i) {
(fltk::column_widths(i));
}
int const * _BCD__ZN4fltk13column_widthsEv() {
return (fltk::column_widths());
}
void _BCD_set__ZN4fltk14column_widths_E(int const * x) {
fltk::column_widths_ = x;
}
int const * _BCD_get__ZN4fltk14column_widths_E() {
return fltk::column_widths_;
}
typedef void (*_BCD_func__334)(char const *, int, float, float);
typedef float (*_BCD_func__335)(char const *, int);
typedef int _BCD__266_Flags;
void _BCD__ZN4fltk8drawtextEPFvPKciffEPFfS1_iES1_RKNS_9RectangleEi(_BCD_func__334 textfunction, _BCD_func__335 getwidth, char const * str, fltk::Rectangle   const & r, _BCD__266_Flags flags) {
(fltk::drawtext(textfunction, getwidth, str, r, flags));
}
void _BCD__ZN4fltk8drawtextEPKcRKNS_9RectangleEi(char const * _0, fltk::Rectangle   const & _1, _BCD__266_Flags _2) {
(fltk::drawtext(_0, _1, _2));
}
void _BCD__ZN4fltk7measureEPFfPKciES1_RfS4_i(_BCD_func__335 getwidth, char const * _1, float & w, float & h, _BCD__266_Flags _4) {
(fltk::measure(getwidth, _1, w, h, _4));
}
void _BCD__ZN4fltk7measureEPKcRiS2_i(char const * _0, int & w, int & h, _BCD__266_Flags _3) {
(fltk::measure(_0, w, h, _3));
}
void _BCD__ZN4fltk8drawtextEPKciff(char const * _0, int length, float x, float y) {
(fltk::drawtext(_0, length, x, y));
}
void _BCD__ZN4fltk8drawtextEPKcff(char const * _0, float x, float y) {
(fltk::drawtext(_0, x, y));
}
void _BCD__ZN4fltk20drawtext_transformedEPKciff(char const * _0, int n, float x, float y) {
(fltk::drawtext_transformed(_0, n, x, y));
}
float _BCD__ZN4fltk10getdescentEv() {
return (fltk::getdescent());
}
float _BCD__ZN4fltk9getascentEv() {
return (fltk::getascent());
}
float _BCD__ZN4fltk8getwidthEPKci(char const * _0, int length) {
return (fltk::getwidth(_0, length));
}
float _BCD__ZN4fltk8getwidthEPKc(char const * _0) {
return (fltk::getwidth(_0));
}
float _BCD__ZN4fltk7getsizeEv() {
return (fltk::getsize());
}
fltk::Font * _BCD__ZN4fltk7getfontEv() {
return (fltk::getfont());
}
void _BCD_set__ZN4fltk13current_size_E(float x) {
fltk::current_size_ = x;
}
float _BCD_get__ZN4fltk13current_size_E() {
return fltk::current_size_;
}
void _BCD_set__ZN4fltk13current_font_E(fltk::Font * x) {
fltk::current_font_ = x;
}
fltk::Font * _BCD_get__ZN4fltk13current_font_E() {
return fltk::current_font_;
}
void _BCD__ZN4fltk12set_encodingEPKc(char const * _0) {
(fltk::set_encoding(_0));
}
char const * _BCD__ZN4fltk12get_encodingEv() {
return (fltk::get_encoding());
}
void _BCD_set__ZN4fltk9encoding_E(char const * x) {
fltk::encoding_ = x;
}
char const * _BCD_get__ZN4fltk9encoding_E() {
return fltk::encoding_;
}
void _BCD__ZN4fltk7setfontEPKcif(char const * _0, int attributes, float size) {
(fltk::setfont(_0, attributes, size));
}
void _BCD__ZN4fltk7setfontEPKcf(char const * _0, float size) {
(fltk::setfont(_0, size));
}
void _BCD__ZN4fltk7setfontEPNS_4FontEf(fltk::Font * _0, float size) {
(fltk::setfont(_0, size));
}
void _BCD__ZN4fltk9drawpointEff(float x, float y) {
(fltk::drawpoint(x, y));
}
void _BCD__ZN4fltk9drawpointEii(int x, int y) {
(fltk::drawpoint(x, y));
}
void _BCD__ZN4fltk8drawlineEffff(float x0, float y0, float x1, float y1) {
(fltk::drawline(x0, y0, x1, y1));
}
void _BCD__ZN4fltk8drawlineEiiii(int x0, int y0, int x1, int y1) {
(fltk::drawline(x0, y0, x1, y1));
}
void _BCD__ZN4fltk10strokerectERKNS_9RectangleE(fltk::Rectangle   const & r) {
(fltk::strokerect(r));
}
void _BCD__ZN4fltk10strokerectEiiii(int _0, int _1, int _2, int _3) {
(fltk::strokerect(_0, _1, _2, _3));
}
void _BCD__ZN4fltk8fillrectERKNS_9RectangleE(fltk::Rectangle   const & r) {
(fltk::fillrect(r));
}
void _BCD__ZN4fltk8fillrectEiiii(int _0, int _1, int _2, int _3) {
(fltk::fillrect(_0, _1, _2, _3));
}
typedef unsigned int _BCD__263_Color;
void _BCD__ZN4fltk14fillstrokepathEj(_BCD__263_Color _0) {
(fltk::fillstrokepath(_0));
}
void _BCD__ZN4fltk8fillpathEv() {
(fltk::fillpath());
}
void _BCD__ZN4fltk10strokepathEv() {
(fltk::strokepath());
}
void _BCD__ZN4fltk9closepathEv() {
(fltk::closepath());
}
void _BCD__ZN4fltk8addchordERKNS_9RectangleEff(fltk::Rectangle   const & r, float a, float a2) {
(fltk::addchord(r, a, a2));
}
void _BCD__ZN4fltk6addpieERKNS_9RectangleEff(fltk::Rectangle   const & r, float a, float a2) {
(fltk::addpie(r, a, a2));
}
void _BCD__ZN4fltk6addarcEffffff(float x, float y, float w, float h, float a1, float a2) {
(fltk::addarc(x, y, w, h, a1, a2));
}
void _BCD__ZN4fltk8addcurveEffffffff(float _0, float _1, float _2, float _3, float _4, float _5, float _6, float _7) {
(fltk::addcurve(_0, _1, _2, _3, _4, _5, _6, _7));
}
typedef float _BCD_array__336[2];
void _BCD__ZN4fltk23addvertices_transformedEiPA2_Kf(int n, _BCD_array__336 const * v) {
(fltk::addvertices_transformed(n, v));
}
typedef int _BCD_array__338[2];
void _BCD__ZN4fltk11addverticesEiPA2_Ki(int n, _BCD_array__338 const * v) {
(fltk::addvertices(n, v));
}
void _BCD__ZN4fltk11addverticesEiPA2_Kf(int n, _BCD_array__336 const * v) {
(fltk::addvertices(n, v));
}
void _BCD__ZN4fltk9addvertexEii(int x, int y) {
(fltk::addvertex(x, y));
}
void _BCD__ZN4fltk9addvertexEff(float x, float y) {
(fltk::addvertex(x, y));
}
void _BCD__ZN4fltk7newpathEv() {
(fltk::newpath());
}
char const * _BCD__ZN4fltk11line_dashesEv() {
return (fltk::line_dashes());
}
void _BCD_set__ZN4fltk12line_dashes_E(char const * x) {
fltk::line_dashes_ = x;
}
char const * _BCD_get__ZN4fltk12line_dashes_E() {
return fltk::line_dashes_;
}
float _BCD__ZN4fltk10line_widthEv() {
return (fltk::line_width());
}
void _BCD_set__ZN4fltk11line_width_E(float x) {
fltk::line_width_ = x;
}
float _BCD_get__ZN4fltk11line_width_E() {
return fltk::line_width_;
}
int _BCD__ZN4fltk10line_styleEv() {
return (fltk::line_style());
}
void _BCD_set__ZN4fltk11line_style_E(int x) {
fltk::line_style_ = x;
}
int _BCD_get__ZN4fltk11line_style_E() {
return fltk::line_style_;
}
void _BCD__ZN4fltk10line_styleEifPKc(int _0, float width, char const * dashes) {
(fltk::line_style(_0, width, dashes));
}
_BCD__266_Flags _BCD__ZN4fltk9drawflagsEi(_BCD__266_Flags f) {
return (fltk::drawflags(f));
}
_BCD__266_Flags _BCD__ZN4fltk9drawflagsEv() {
return (fltk::drawflags());
}
void _BCD__ZN4fltk12setdrawflagsEi(_BCD__266_Flags f) {
(fltk::setdrawflags(f));
}
void _BCD_set__ZN4fltk10drawflags_E(_BCD__266_Flags x) {
fltk::drawflags_ = x;
}
_BCD__266_Flags _BCD_get__ZN4fltk10drawflags_E() {
return fltk::drawflags_;
}
fltk::Style const * _BCD__ZN4fltk9drawstyleEv() {
return (fltk::drawstyle());
}
void _BCD__ZN4fltk9drawstyleEPKNS_5StyleEi(fltk::Style const * s, _BCD__266_Flags _1) {
(fltk::drawstyle(s, _1));
}
void _BCD_set__ZN4fltk10drawstyle_E(fltk::Style const * x) {
fltk::drawstyle_ = x;
}
fltk::Style const * _BCD_get__ZN4fltk10drawstyle_E() {
return fltk::drawstyle_;
}
_BCD__263_Color _BCD__ZN4fltk10getbgcolorEv() {
return (fltk::getbgcolor());
}
void _BCD__ZN4fltk10setbgcolorEj(_BCD__263_Color c) {
(fltk::setbgcolor(c));
}
void _BCD_set__ZN4fltk16current_bgcolor_E(_BCD__263_Color x) {
fltk::current_bgcolor_ = x;
}
_BCD__263_Color _BCD_get__ZN4fltk16current_bgcolor_E() {
return fltk::current_bgcolor_;
}
_BCD__263_Color _BCD__ZN4fltk8getcolorEv() {
return (fltk::getcolor());
}
void _BCD_set__ZN4fltk14current_color_E(_BCD__263_Color x) {
fltk::current_color_ = x;
}
_BCD__263_Color _BCD_get__ZN4fltk14current_color_E() {
return fltk::current_color_;
}
void _BCD__ZN4fltk14setcolor_alphaEjf(_BCD__263_Color _0, float alpha) {
(fltk::setcolor_alpha(_0, alpha));
}
void _BCD__ZN4fltk8setcolorEj(_BCD__263_Color _0) {
(fltk::setcolor(_0));
}
int _BCD__ZN4fltk19intersect_with_clipERNS_9RectangleE(fltk::Rectangle   & _0) {
return (fltk::intersect_with_clip(_0));
}
bool _BCD__ZN4fltk11not_clippedERKNS_9RectangleE(fltk::Rectangle   const & _0) {
return (fltk::not_clipped(_0));
}
void _BCD__ZN4fltk12push_no_clipEv() {
(fltk::push_no_clip());
}
void _BCD__ZN4fltk8pop_clipEv() {
(fltk::pop_clip());
}
void _BCD__ZN4fltk7clipoutERKNS_9RectangleE(fltk::Rectangle   const & _0) {
(fltk::clipout(_0));
}
void _BCD__ZN4fltk9push_clipEiiii(int X, int Y, int W, int H) {
(fltk::push_clip(X, Y, W, H));
}
void _BCD__ZN4fltk9push_clipERKNS_9RectangleE(fltk::Rectangle   const & _0) {
(fltk::push_clip(_0));
}
void _BCD__ZN4fltk9transformERiS0_S0_S0_(int & x, int & y, int & w, int & h) {
(fltk::transform(x, y, w, h));
}
void _BCD__ZN4fltk9transformERKNS_9RectangleERS0_(fltk::Rectangle   const & from, fltk::Rectangle   & to) {
(fltk::transform(from, to));
}
void _BCD__ZN4fltk9transformERiS0_(int & x, int & y) {
(fltk::transform(x, y));
}
void _BCD__ZN4fltk18transform_distanceERfS0_(float & x, float & y) {
(fltk::transform_distance(x, y));
}
void _BCD__ZN4fltk9transformERfS0_(float & x, float & y) {
(fltk::transform(x, y));
}
void _BCD__ZN4fltk13load_identityEv() {
(fltk::load_identity());
}
void _BCD__ZN4fltk6concatEffffff(float _0, float _1, float _2, float _3, float _4, float _5) {
(fltk::concat(_0, _1, _2, _3, _4, _5));
}
void _BCD__ZN4fltk6rotateEf(float d) {
(fltk::rotate(d));
}
void _BCD__ZN4fltk9translateEii(int x, int y) {
(fltk::translate(x, y));
}
void _BCD__ZN4fltk9translateEff(float x, float y) {
(fltk::translate(x, y));
}
void _BCD__ZN4fltk5scaleEf(float x) {
(fltk::scale(x));
}
void _BCD__ZN4fltk5scaleEff(float x, float y) {
(fltk::scale(x, y));
}
void _BCD__ZN4fltk10pop_matrixEv() {
(fltk::pop_matrix());
}
void _BCD__ZN4fltk11push_matrixEv() {
(fltk::push_matrix());
}
typedef _BCD__266_Flags _BCD__265_Align;
}
