/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/FileInput.h"
extern "C" {
typedef unsigned char _BCD__8_uchar;
void _BCD_delete_N4fltk9FileInputE(fltk::FileInput *This) {
delete This;
}
fltk::FileInput *_BCD_new__ZN4fltk9FileInputC1EiiiiPKc(int _0, int _1, int _2, int _3, char const * t) {
return new fltk::FileInput(_0, _1, _2, _3, t);
}
void _BCD__ZN4fltk9FileInput10draw_boxesEbRKNS_9RectangleE(fltk::FileInput *This, bool pressed, fltk::Rectangle   const & r) {
(This->draw_boxes(pressed, r));
}
int _BCD__ZN4fltk9FileInput6handleEi(fltk::FileInput *This, int _0) {
return (This->handle(_0));
}
void _BCD__ZN4fltk9FileInput4drawEv(fltk::FileInput *This) {
(This->draw());
}
typedef unsigned int _BCD__237_Color;
_BCD__237_Color _BCD__ZNK4fltk9FileInput10errorcolorEv(fltk::FileInput *This) {
return (This->errorcolor());
}
void _BCD__ZN4fltk9FileInput10errorcolorEj(fltk::FileInput *This, _BCD__237_Color c) {
(This->errorcolor(c));
}
char const * _BCD__ZN4fltk9FileInput4textEv(fltk::FileInput *This) {
return (This->text());
}
typedef void (*_BCD_func__144)(fltk::Widget *, long int);
typedef _BCD_func__144 _BCD__145_Callback1;
typedef void (*_BCD_func__146)(fltk::Widget *);
typedef _BCD_func__146 _BCD__147_Callback0;
typedef void (*_BCD_func__150)(fltk::Widget *, void *);
typedef _BCD_func__150 _BCD__151_Callback;
typedef _BCD__151_Callback _BCD__149_Callback_p;
typedef bool (*_BCD_func__330)();
typedef _BCD_func__330 _BCD__162_Theme;
typedef fltk::Symbol * _BCD__220_Box;
typedef int _BCD__240_Flags;
typedef _BCD__240_Flags _BCD__239_Align;
}
