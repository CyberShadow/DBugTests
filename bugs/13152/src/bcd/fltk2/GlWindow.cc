/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/GlWindow.h"
extern "C" {
typedef unsigned char _BCD__9_uchar;
void _BCD_delete_N4fltk8GlWindowE(fltk::GlWindow *This) {
delete This;
}
void _BCD__ZN4fltk8GlWindow6createEv(fltk::GlWindow *This) {
(This->create());
}
void _BCD__ZN4fltk8GlWindow5flushEv(fltk::GlWindow *This) {
(This->flush());
}
void _BCD__ZN4fltk8GlWindow7destroyEv(fltk::GlWindow *This) {
(This->destroy());
}
void _BCD__ZN4fltk8GlWindow6layoutEv(fltk::GlWindow *This) {
(This->layout());
}
char _BCD__ZNK4fltk8GlWindow5validEv(fltk::GlWindow *This) {
return (This->valid());
}
void _BCD__ZN4fltk8GlWindow5validEc(fltk::GlWindow *This, char i) {
(This->valid(i));
}
void _BCD__ZN4fltk8GlWindow10invalidateEv(fltk::GlWindow *This) {
(This->invalidate());
}
int _BCD__ZNK4fltk8GlWindow4modeEv(fltk::GlWindow *This) {
return (This->mode());
}
bool _BCD__ZN4fltk8GlWindow4modeEi(fltk::GlWindow *This, int a) {
return (This->mode(a));
}
bool _BCD__ZN4fltk8GlWindow6can_doEi(int _0) {
return (fltk::GlWindow::can_do(_0));
}
bool _BCD__ZNK4fltk8GlWindow6can_doEv(fltk::GlWindow *This) {
return (This->can_do());
}
typedef void * _BCD__156_GLContext;
_BCD__156_GLContext _BCD__ZNK4fltk8GlWindow7contextEv(fltk::GlWindow *This) {
return (This->context());
}
void _BCD__ZN4fltk8GlWindow7contextEPvb(fltk::GlWindow *This, _BCD__156_GLContext v, bool destroy_flag) {
(This->context(v, destroy_flag));
}
void _BCD__ZN4fltk8GlWindow12make_currentEv(fltk::GlWindow *This) {
(This->make_current());
}
void _BCD__ZN4fltk8GlWindow12swap_buffersEv(fltk::GlWindow *This) {
(This->swap_buffers());
}
void _BCD__ZN4fltk8GlWindow5orthoEv(fltk::GlWindow *This) {
(This->ortho());
}
bool _BCD__ZN4fltk8GlWindow14can_do_overlayEv(fltk::GlWindow *This) {
return (This->can_do_overlay());
}
void _BCD__ZN4fltk8GlWindow14redraw_overlayEv(fltk::GlWindow *This) {
(This->redraw_overlay());
}
void _BCD__ZN4fltk8GlWindow12hide_overlayEv(fltk::GlWindow *This) {
(This->hide_overlay());
}
void _BCD__ZN4fltk8GlWindow20make_overlay_currentEv(fltk::GlWindow *This) {
(This->make_overlay_current());
}
void _BCD__ZN4fltk8GlWindow4drawEv(fltk::GlWindow *This) {
(This->draw());
}
void _BCD__ZN4fltk8GlWindow12draw_overlayEv(fltk::GlWindow *This) {
(This->draw_overlay());
}
int _BCD__ZN4fltk8GlWindow6handleEi(fltk::GlWindow *This, int event) {
return (This->handle(event));
}
typedef void (*_BCD_func__162)(fltk::Widget *, long int);
typedef _BCD_func__162 _BCD__163_Callback1;
typedef void (*_BCD_func__164)(fltk::Widget *);
typedef _BCD_func__164 _BCD__165_Callback0;
typedef void (*_BCD_func__168)(fltk::Widget *, void *);
typedef _BCD_func__168 _BCD__169_Callback;
typedef _BCD__169_Callback _BCD__167_Callback_p;
typedef bool (*_BCD_func__429)();
typedef _BCD_func__429 _BCD__180_Theme;
typedef fltk::Symbol * _BCD__233_Box;
typedef unsigned int _BCD__250_Color;
typedef int _BCD__253_Flags;
typedef _BCD__253_Flags _BCD__252_Align;
}
