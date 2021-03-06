/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/Window.h"
extern "C" {
typedef unsigned char _BCD__8_uchar;
void _BCD_delete_N4fltk6WindowE(fltk::Window *This) {
delete This;
}
void _BCD_set__ZN4fltk6Window13default_styleE(fltk::Window *This, fltk::NamedStyle * x) {
This->default_style = x;
}
fltk::NamedStyle * _BCD_get__ZN4fltk6Window13default_styleE(fltk::Window *This) {
return This->default_style;
}
void _BCD_set__ZN4fltk6Window15drawing_window_E(fltk::Window *This, fltk::Window const * x) {
This->drawing_window_ = x;
}
fltk::Window const * _BCD_get__ZN4fltk6Window15drawing_window_E(fltk::Window *This) {
return This->drawing_window_;
}
fltk::Window *_BCD_new__ZN4fltk6WindowC1EiiiiPKcb(int _0, int _1, int _2, int _3, char const * _4, bool begin) {
return new fltk::Window(_0, _1, _2, _3, _4, begin);
}
fltk::Window *_BCD_new__ZN4fltk6WindowC1EiiPKc(int _0, int _1, char const * _2) {
return new fltk::Window(_0, _1, _2);
}
char const * _BCD__ZNK4fltk6Window5labelEv(fltk::Window *This) {
return (This->label());
}
char const * _BCD__ZNK4fltk6Window9iconlabelEv(fltk::Window *This) {
return (This->iconlabel());
}
void _BCD__ZN4fltk6Window5labelEPKc(fltk::Window *This, char const * _0) {
(This->label(_0));
}
void _BCD__ZN4fltk6Window9iconlabelEPKc(fltk::Window *This, char const * _0) {
(This->iconlabel(_0));
}
void _BCD__ZN4fltk6Window5labelEPKcS2_(fltk::Window *This, char const * label, char const * iconlabel) {
(This->label(label, iconlabel));
}
void _BCD__ZN4fltk6Window10copy_labelEPKc(fltk::Window *This, char const * c) {
(This->copy_label(c));
}
void const * _BCD__ZNK4fltk6Window4iconEv(fltk::Window *This) {
return (This->icon());
}
void _BCD__ZN4fltk6Window4iconEPKv(fltk::Window *This, void const * ic) {
(This->icon(ic));
}
char const * _BCD__ZN4fltk6Window6xclassEv() {
return (fltk::Window::xclass());
}
void _BCD__ZN4fltk6Window6xclassEPKc(char const * v) {
(fltk::Window::xclass(v));
}
void _BCD__ZN4fltk6Window6borderEb(fltk::Window *This, bool set) {
(This->border(set));
}
void _BCD__ZN4fltk6Window12clear_borderEv(fltk::Window *This) {
(This->clear_border());
}
bool _BCD__ZNK4fltk6Window6borderEv(fltk::Window *This) {
return (This->border());
}
void _BCD__ZN4fltk6Window12set_overrideEv(fltk::Window *This) {
(This->set_override());
}
bool _BCD__ZNK4fltk6Window8overrideEv(fltk::Window *This) {
return (This->override());
}
fltk::Window const * _BCD__ZNK4fltk6Window8child_ofEv(fltk::Window *This) {
return (This->child_of());
}
void _BCD__ZN4fltk6Window8child_ofEPKS0_(fltk::Window *This, fltk::Window const * w) {
(This->child_of(w));
}
void _BCD__ZN4fltk6Window9set_modalEv(fltk::Window *This) {
(This->set_modal());
}
void _BCD__ZN4fltk6Window13set_non_modalEv(fltk::Window *This) {
(This->set_non_modal());
}
bool _BCD__ZNK4fltk6Window13double_bufferEv(fltk::Window *This) {
return (This->double_buffer());
}
void _BCD__ZN4fltk6Window17set_double_bufferEv(fltk::Window *This) {
(This->set_double_buffer());
}
void _BCD__ZN4fltk6Window19clear_double_bufferEv(fltk::Window *This) {
(This->clear_double_buffer());
}
void _BCD__ZN4fltk6Window15free_backbufferEv(fltk::Window *This) {
(This->free_backbuffer());
}
void _BCD__ZN4fltk6Window12draw_overlayEv(fltk::Window *This) {
(This->draw_overlay());
}
void _BCD__ZN4fltk6Window14redraw_overlayEv(fltk::Window *This) {
(This->redraw_overlay());
}
void _BCD__ZN4fltk6Window13erase_overlayEv(fltk::Window *This) {
(This->erase_overlay());
}
void _BCD__ZN4fltk6Window7hotspotEiib(fltk::Window *This, int x, int y, bool offscreen) {
(This->hotspot(x, y, offscreen));
}
void _BCD__ZN4fltk6Window7hotspotEPKNS_6WidgetEb(fltk::Window *This, fltk::Widget const * _0, bool offscreen) {
(This->hotspot(_0, offscreen));
}
void _BCD__ZN4fltk6Window10size_rangeEiiiiii(fltk::Window *This, int a, int b, int c, int d, int e, int f) {
(This->size_range(a, b, c, d, e, f));
}
bool _BCD__ZN4fltk6Window14get_size_rangeEPiS1_S1_S1_(fltk::Window *This, int * min_w, int * min_h, int * max_w, int * max_h) {
return (This->get_size_range(min_w, min_h, max_w, max_h));
}
bool _BCD__ZNK4fltk6Window5shownEv(fltk::Window *This) {
return (This->shown());
}
void _BCD__ZN4fltk6Window4showEv(fltk::Window *This) {
(This->show());
}
void _BCD__ZN4fltk6Window4showEiPPc(fltk::Window *This, int _0, char * * _1) {
(This->show(_0, _1));
}
void _BCD__ZN4fltk6Window4showEPKS0_(fltk::Window *This, fltk::Window const * parent) {
(This->show(parent));
}
bool _BCD__ZN4fltk6Window4execEPKS0_b(fltk::Window *This, fltk::Window const * parent, bool grab) {
return (This->exec(parent, grab));
}
void _BCD__ZN4fltk6Window16make_exec_returnEb(fltk::Window *This, bool _0) {
(This->make_exec_return(_0));
}
void _BCD__ZN4fltk6Window11show_insideEPKS0_(fltk::Window *This, fltk::Window const * parent) {
(This->show_inside(parent));
}
void _BCD__ZN4fltk6Window7iconizeEv(fltk::Window *This) {
(This->iconize());
}
bool _BCD__ZNK4fltk6Window6iconicEv(fltk::Window *This) {
return (This->iconic());
}
void _BCD__ZN4fltk6Window7destroyEv(fltk::Window *This) {
(This->destroy());
}
void _BCD__ZN4fltk6Window10fullscreenEv(fltk::Window *This) {
(This->fullscreen());
}
void _BCD__ZN4fltk6Window10fullscreenERKNS_7MonitorE(fltk::Window *This, fltk::Monitor   const & _0) {
(This->fullscreen(_0));
}
void _BCD__ZN4fltk6Window14fullscreen_offEiiii(fltk::Window *This, int _0, int _1, int _2, int _3) {
(This->fullscreen_off(_0, _1, _2, _3));
}
void _BCD__ZN4fltk6Window16default_callbackEPS0_Pv(fltk::Window * _0, void * v) {
(fltk::Window::default_callback(_0, v));
}
int _BCD__ZN4fltk6Window6handleEi(fltk::Window *This, int _0) {
return (This->handle(_0));
}
void _BCD__ZN4fltk6Window6layoutEv(fltk::Window *This) {
(This->layout());
}
void _BCD__ZN4fltk6Window5flushEv(fltk::Window *This) {
(This->flush());
}
void _BCD__ZN4fltk6Window4drawEv(fltk::Window *This) {
(This->draw());
}
fltk::Window * _BCD__ZN4fltk6Window5firstEv() {
return (fltk::Window::first());
}
void _BCD__ZN4fltk6Window5firstEPS0_(fltk::Window * _0) {
(fltk::Window::first(_0));
}
fltk::Window * _BCD__ZN4fltk6Window4nextEv(fltk::Window *This) {
return (This->next());
}
void _BCD__ZNK4fltk6Window7bordersEPNS_9RectangleE(fltk::Window *This, fltk::Rectangle * r) {
(This->borders(r));
}
fltk::Window const * _BCD__ZN4fltk6Window14drawing_windowEv() {
return (fltk::Window::drawing_window());
}
int _BCD_R__ZN4fltk6Window12draw_overlayEv__Window_R_CHECK(void *);
void _BCD_R__ZN4fltk6Window12draw_overlayEv__Window_R(void *);
int _BCD_R__ZN4fltk6Window7destroyEv__Window_R_CHECK(void *);
void _BCD_R__ZN4fltk6Window7destroyEv__Window_R(void *);
int _BCD_R__ZN4fltk6Window6handleEi__Window_R_CHECK(void *);
int _BCD_R__ZN4fltk6Window6handleEi__Window_R(void *, int _0);
int _BCD_R__ZN4fltk6Window6layoutEv__Window_R_CHECK(void *);
void _BCD_R__ZN4fltk6Window6layoutEv__Window_R(void *);
int _BCD_R__ZN4fltk6Window5flushEv__Window_R_CHECK(void *);
void _BCD_R__ZN4fltk6Window5flushEv__Window_R(void *);
int _BCD_R__ZN4fltk6Window4drawEv__Window_R_CHECK(void *);
void _BCD_R__ZN4fltk6Window4drawEv__Window_R(void *);
}
class Window_R : fltk::Window {
public:
void *__D_data;
Window_R(int _0, int _1, int _2, int _3, char const * _4, bool begin) : fltk::Window(_0, _1, _2, _3, _4, begin) {}
Window_R(int _0, int _1, char const * _2) : fltk::Window(_0, _1, _2) {}
void draw_overlay() {
if (_BCD_R__ZN4fltk6Window12draw_overlayEv__Window_R_CHECK(__D_data))
_BCD_R__ZN4fltk6Window12draw_overlayEv__Window_R(__D_data);
else
fltk::Window::draw_overlay();
}
void destroy() {
if (_BCD_R__ZN4fltk6Window7destroyEv__Window_R_CHECK(__D_data))
_BCD_R__ZN4fltk6Window7destroyEv__Window_R(__D_data);
else
fltk::Window::destroy();
}
int handle(int _0) {
if (_BCD_R__ZN4fltk6Window6handleEi__Window_R_CHECK(__D_data))
return _BCD_R__ZN4fltk6Window6handleEi__Window_R(__D_data, _0);
else
return fltk::Window::handle(_0);
}
void layout() {
if (_BCD_R__ZN4fltk6Window6layoutEv__Window_R_CHECK(__D_data))
_BCD_R__ZN4fltk6Window6layoutEv__Window_R(__D_data);
else
fltk::Window::layout();
}
void flush() {
if (_BCD_R__ZN4fltk6Window5flushEv__Window_R_CHECK(__D_data))
_BCD_R__ZN4fltk6Window5flushEv__Window_R(__D_data);
else
fltk::Window::flush();
}
void draw() {
if (_BCD_R__ZN4fltk6Window4drawEv__Window_R_CHECK(__D_data))
_BCD_R__ZN4fltk6Window4drawEv__Window_R(__D_data);
else
fltk::Window::draw();
}
};
extern "C" {
Window_R *_BCD_new__ZN4fltk6WindowC1EiiiiPKcb_R(int _0, int _1, int _2, int _3, char const * _4, bool begin) {
return new Window_R(_0, _1, _2, _3, _4, begin);
}
Window_R *_BCD_new__ZN4fltk6WindowC1EiiPKc_R(int _0, int _1, char const * _2) {
return new Window_R(_0, _1, _2);
}
void _BCD_delete_N4fltk6WindowE__Window_R(Window_R *This) {
delete This;
}
void _BCD_RI_N4fltk6WindowE(Window_R *cd, void *dd) {
cd->__D_data = dd;
}
int const _BCD_get__ZN4fltk10USEDEFAULTE() {
return fltk::USEDEFAULT;
}
typedef void (*_BCD_func__156)(fltk::Widget *, long int);
typedef _BCD_func__156 _BCD__157_Callback1;
typedef void (*_BCD_func__158)(fltk::Widget *);
typedef _BCD_func__158 _BCD__159_Callback0;
typedef void (*_BCD_func__162)(fltk::Widget *, void *);
typedef _BCD_func__162 _BCD__163_Callback;
typedef _BCD__163_Callback _BCD__161_Callback_p;
typedef bool (*_BCD_func__386)();
typedef _BCD_func__386 _BCD__174_Theme;
typedef fltk::Symbol * _BCD__227_Box;
typedef unsigned int _BCD__244_Color;
typedef int _BCD__247_Flags;
typedef _BCD__247_Flags _BCD__246_Align;
}
