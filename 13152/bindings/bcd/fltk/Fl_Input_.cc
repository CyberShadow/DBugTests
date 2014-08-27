/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Input_.H"
extern "C" {
void _BCD_delete_9Fl_Input_(Fl_Input_ *This) {
delete This;
}
void _BCD__ZN9Fl_Input_6resizeEiiii(Fl_Input_ *This, int _0, int _1, int _2, int _3) {
(This->resize(_0, _1, _2, _3));
}
int _BCD__ZN9Fl_Input_5valueEPKc(Fl_Input_ *This, char const * _0) {
return (This->value(_0));
}
int _BCD__ZN9Fl_Input_5valueEPKci(Fl_Input_ *This, char const * _0, int _1) {
return (This->value(_0, _1));
}
int _BCD__ZN9Fl_Input_12static_valueEPKc(Fl_Input_ *This, char const * _0) {
return (This->static_value(_0));
}
int _BCD__ZN9Fl_Input_12static_valueEPKci(Fl_Input_ *This, char const * _0, int _1) {
return (This->static_value(_0, _1));
}
char const * _BCD__ZNK9Fl_Input_5valueEv(Fl_Input_ *This) {
return (This->value());
}
char _BCD__ZNK9Fl_Input_5indexEi(Fl_Input_ *This, int i) {
return (This->index(i));
}
int _BCD__ZNK9Fl_Input_4sizeEv(Fl_Input_ *This) {
return (This->size());
}
void _BCD__ZN9Fl_Input_4sizeEii(Fl_Input_ *This, int W, int H) {
(This->size(W, H));
}
int _BCD__ZNK9Fl_Input_12maximum_sizeEv(Fl_Input_ *This) {
return (This->maximum_size());
}
void _BCD__ZN9Fl_Input_12maximum_sizeEi(Fl_Input_ *This, int m) {
(This->maximum_size(m));
}
int _BCD__ZNK9Fl_Input_8positionEv(Fl_Input_ *This) {
return (This->position());
}
int _BCD__ZNK9Fl_Input_4markEv(Fl_Input_ *This) {
return (This->mark());
}
int _BCD__ZN9Fl_Input_8positionEi(Fl_Input_ *This, int p) {
return (This->position(p));
}
int _BCD__ZN9Fl_Input_4markEi(Fl_Input_ *This, int m) {
return (This->mark(m));
}
int _BCD__ZN9Fl_Input_7replaceEiiPKci(Fl_Input_ *This, int _0, int _1, char const * _2, int _3) {
return (This->replace(_0, _1, _2, _3));
}
int _BCD__ZN9Fl_Input_3cutEv(Fl_Input_ *This) {
return (This->cut());
}
int _BCD__ZN9Fl_Input_3cutEi(Fl_Input_ *This, int n) {
return (This->cut(n));
}
int _BCD__ZN9Fl_Input_3cutEii(Fl_Input_ *This, int a, int b) {
return (This->cut(a, b));
}
int _BCD__ZN9Fl_Input_6insertEPKci(Fl_Input_ *This, char const * t, int l) {
return (This->insert(t, l));
}
int _BCD__ZN9Fl_Input_4copyEi(Fl_Input_ *This, int clipboard) {
return (This->copy(clipboard));
}
int _BCD__ZN9Fl_Input_4undoEv(Fl_Input_ *This) {
return (This->undo());
}
int _BCD__ZN9Fl_Input_9copy_cutsEv(Fl_Input_ *This) {
return (This->copy_cuts());
}
enum Fl_Font _BCD__ZNK9Fl_Input_8textfontEv(Fl_Input_ *This) {
return (This->textfont());
}
typedef unsigned char _BCD__56_uchar;
void _BCD__ZN9Fl_Input_8textfontEh(Fl_Input_ *This, _BCD__56_uchar s) {
(This->textfont(s));
}
_BCD__56_uchar _BCD__ZNK9Fl_Input_8textsizeEv(Fl_Input_ *This) {
return (This->textsize());
}
void _BCD__ZN9Fl_Input_8textsizeEh(Fl_Input_ *This, _BCD__56_uchar s) {
(This->textsize(s));
}
enum Fl_Color _BCD__ZNK9Fl_Input_9textcolorEv(Fl_Input_ *This) {
return (This->textcolor());
}
void _BCD__ZN9Fl_Input_9textcolorEj(Fl_Input_ *This, unsigned int n) {
(This->textcolor(n));
}
enum Fl_Color _BCD__ZNK9Fl_Input_12cursor_colorEv(Fl_Input_ *This) {
return (This->cursor_color());
}
void _BCD__ZN9Fl_Input_12cursor_colorEj(Fl_Input_ *This, unsigned int n) {
(This->cursor_color(n));
}
int _BCD__ZNK9Fl_Input_10input_typeEv(Fl_Input_ *This) {
return (This->input_type());
}
void _BCD__ZN9Fl_Input_10input_typeEi(Fl_Input_ *This, int t) {
(This->input_type(t));
}
int _BCD__ZNK9Fl_Input_8readonlyEv(Fl_Input_ *This) {
return (This->readonly());
}
void _BCD__ZN9Fl_Input_8readonlyEi(Fl_Input_ *This, int b) {
(This->readonly(b));
}
int _BCD__ZNK9Fl_Input_4wrapEv(Fl_Input_ *This) {
return (This->wrap());
}
void _BCD__ZN9Fl_Input_4wrapEi(Fl_Input_ *This, int b) {
(This->wrap(b));
}
typedef void (*_BCD_func__7)(Fl_Widget *, long int);
typedef _BCD_func__7 _BCD__8_Fl_Callback1;
typedef void (*_BCD_func__9)(Fl_Widget *);
typedef _BCD_func__9 _BCD__10_Fl_Callback0;
typedef void (*_BCD_func__13)(Fl_Widget *, void *);
typedef _BCD_func__13 _BCD__14_Fl_Callback;
typedef _BCD__14_Fl_Callback _BCD__12_Fl_Callback_p;
typedef long unsigned int _BCD__54_ulong;
}
