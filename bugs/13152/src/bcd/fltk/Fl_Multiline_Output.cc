/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Multiline_Output.H"
extern "C" {
void _BCD_delete_19Fl_Multiline_Output(Fl_Multiline_Output *This) {
delete This;
}
Fl_Multiline_Output *_BCD_new__ZN19Fl_Multiline_OutputC1EiiiiPKc(int X, int Y, int W, int H, char const * l) {
return new Fl_Multiline_Output(X, Y, W, H, l);
}
}
class Fl_Multiline_Output_R : Fl_Multiline_Output {
public:
void *__D_data;
Fl_Multiline_Output_R(int X, int Y, int W, int H, char const * l) : Fl_Multiline_Output(X, Y, W, H, l) {}
};
extern "C" {
Fl_Multiline_Output_R *_BCD_new__ZN19Fl_Multiline_OutputC1EiiiiPKc_R(int X, int Y, int W, int H, char const * l) {
return new Fl_Multiline_Output_R(X, Y, W, H, l);
}
void _BCD_delete_19Fl_Multiline_Output__Fl_Multiline_Output_R(Fl_Multiline_Output_R *This) {
delete This;
}
void _BCD_RI_19Fl_Multiline_Output(Fl_Multiline_Output_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__13)(Fl_Widget *, long int);
typedef _BCD_func__13 _BCD__14_Fl_Callback1;
typedef void (*_BCD_func__15)(Fl_Widget *);
typedef _BCD_func__15 _BCD__16_Fl_Callback0;
typedef void (*_BCD_func__19)(Fl_Widget *, void *);
typedef _BCD_func__19 _BCD__20_Fl_Callback;
typedef _BCD__20_Fl_Callback _BCD__18_Fl_Callback_p;
typedef long unsigned int _BCD__60_ulong;
typedef unsigned char _BCD__62_uchar;
}