/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Value_Output.H"
extern "C" {
void _BCD_delete_15Fl_Value_Output(Fl_Value_Output *This) {
delete This;
}
int _BCD__ZN15Fl_Value_Output6handleEi(Fl_Value_Output *This, int _0) {
return (This->handle(_0));
}
void _BCD__ZN15Fl_Value_Output4drawEv(Fl_Value_Output *This) {
(This->draw());
}
Fl_Value_Output *_BCD_new__ZN15Fl_Value_OutputC1EiiiiPKc(int x, int y, int w, int h, char const * l) {
return new Fl_Value_Output(x, y, w, h, l);
}
typedef unsigned char _BCD__58_uchar;
void _BCD__ZN15Fl_Value_Output4softEh(Fl_Value_Output *This, _BCD__58_uchar s) {
(This->soft(s));
}
_BCD__58_uchar _BCD__ZNK15Fl_Value_Output4softEv(Fl_Value_Output *This) {
return (This->soft());
}
enum Fl_Font _BCD__ZNK15Fl_Value_Output8textfontEv(Fl_Value_Output *This) {
return (This->textfont());
}
void _BCD__ZN15Fl_Value_Output8textfontEh(Fl_Value_Output *This, _BCD__58_uchar s) {
(This->textfont(s));
}
_BCD__58_uchar _BCD__ZNK15Fl_Value_Output8textsizeEv(Fl_Value_Output *This) {
return (This->textsize());
}
void _BCD__ZN15Fl_Value_Output8textsizeEh(Fl_Value_Output *This, _BCD__58_uchar s) {
(This->textsize(s));
}
enum Fl_Color _BCD__ZNK15Fl_Value_Output9textcolorEv(Fl_Value_Output *This) {
return (This->textcolor());
}
void _BCD__ZN15Fl_Value_Output9textcolorEj(Fl_Value_Output *This, unsigned int s) {
(This->textcolor(s));
}
int _BCD_R__ZN15Fl_Value_Output6handleEi__Fl_Value_Output_R_CHECK(void *);
int _BCD_R__ZN15Fl_Value_Output6handleEi__Fl_Value_Output_R(void *, int _0);
int _BCD_R__ZN15Fl_Value_Output4drawEv__Fl_Value_Output_R_CHECK(void *);
void _BCD_R__ZN15Fl_Value_Output4drawEv__Fl_Value_Output_R(void *);
}
class Fl_Value_Output_R : Fl_Value_Output {
public:
void *__D_data;
int handle(int _0) {
if (_BCD_R__ZN15Fl_Value_Output6handleEi__Fl_Value_Output_R_CHECK(__D_data))
return _BCD_R__ZN15Fl_Value_Output6handleEi__Fl_Value_Output_R(__D_data, _0);
else
return Fl_Value_Output::handle(_0);
}
void draw() {
if (_BCD_R__ZN15Fl_Value_Output4drawEv__Fl_Value_Output_R_CHECK(__D_data))
_BCD_R__ZN15Fl_Value_Output4drawEv__Fl_Value_Output_R(__D_data);
else
Fl_Value_Output::draw();
}
Fl_Value_Output_R(int x, int y, int w, int h, char const * l) : Fl_Value_Output(x, y, w, h, l) {}
};
extern "C" {
Fl_Value_Output_R *_BCD_new__ZN15Fl_Value_OutputC1EiiiiPKc_R(int x, int y, int w, int h, char const * l) {
return new Fl_Value_Output_R(x, y, w, h, l);
}
void _BCD_delete_15Fl_Value_Output__Fl_Value_Output_R(Fl_Value_Output_R *This) {
delete This;
}
void _BCD_RI_15Fl_Value_Output(Fl_Value_Output_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__9)(Fl_Widget *, long int);
typedef _BCD_func__9 _BCD__10_Fl_Callback1;
typedef void (*_BCD_func__11)(Fl_Widget *);
typedef _BCD_func__11 _BCD__12_Fl_Callback0;
typedef void (*_BCD_func__15)(Fl_Widget *, void *);
typedef _BCD_func__15 _BCD__16_Fl_Callback;
typedef _BCD__16_Fl_Callback _BCD__14_Fl_Callback_p;
typedef long unsigned int _BCD__56_ulong;
}
