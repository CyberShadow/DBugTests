/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Adjuster.H"
extern "C" {
void _BCD_delete_11Fl_Adjuster(Fl_Adjuster *This) {
delete This;
}
Fl_Adjuster *_BCD_new__ZN11Fl_AdjusterC1EiiiiPKc(int X, int Y, int W, int H, char const * l) {
return new Fl_Adjuster(X, Y, W, H, l);
}
void _BCD__ZN11Fl_Adjuster4softEi(Fl_Adjuster *This, int s) {
(This->soft(s));
}
int _BCD__ZNK11Fl_Adjuster4softEv(Fl_Adjuster *This) {
return (This->soft());
}
}
class Fl_Adjuster_R : Fl_Adjuster {
public:
void *__D_data;
Fl_Adjuster_R(int X, int Y, int W, int H, char const * l) : Fl_Adjuster(X, Y, W, H, l) {}
};
extern "C" {
Fl_Adjuster_R *_BCD_new__ZN11Fl_AdjusterC1EiiiiPKc_R(int X, int Y, int W, int H, char const * l) {
return new Fl_Adjuster_R(X, Y, W, H, l);
}
void _BCD_delete_11Fl_Adjuster__Fl_Adjuster_R(Fl_Adjuster_R *This) {
delete This;
}
void _BCD_RI_11Fl_Adjuster(Fl_Adjuster_R *cd, void *dd) {
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
typedef unsigned char _BCD__58_uchar;
}
