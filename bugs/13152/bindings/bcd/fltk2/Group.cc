/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/Group.h"
extern "C" {
typedef unsigned char _BCD__7_uchar;
void _BCD_delete_N4fltk5GroupE(fltk::Group *This) {
delete This;
}
int _BCD__ZNK4fltk5Group8childrenEv(fltk::Group *This) {
return (This->children());
}
fltk::Widget * _BCD__ZNK4fltk5Group5childEi(fltk::Group *This, int n) {
return (This->child(n));
}
void _BCD__ZN4fltk5Group4drawEv(fltk::Group *This) {
(This->draw());
}
void _BCD__ZN4fltk5Group6layoutEv(fltk::Group *This) {
(This->layout());
}
int _BCD__ZN4fltk5Group6handleEi(fltk::Group *This, int _0) {
return (This->handle(_0));
}
void _BCD__ZN4fltk5Group5beginEv(fltk::Group *This) {
(This->begin());
}
void _BCD__ZN4fltk5Group3endEv(fltk::Group *This) {
(This->end());
}
fltk::Group * _BCD__ZN4fltk5Group7currentEv() {
return (fltk::Group::current());
}
void _BCD__ZN4fltk5Group7currentEPS0_(fltk::Group * g) {
(fltk::Group::current(g));
}
int _BCD__ZNK4fltk5Group4findEPKNS_6WidgetE(fltk::Group *This, fltk::Widget const * _0) {
return (This->find(_0));
}
fltk::Group *_BCD_new__ZN4fltk5GroupC1EiiiiPKcb(int _0, int _1, int _2, int _3, char const * _4, bool begin) {
return new fltk::Group(_0, _1, _2, _3, _4, begin);
}
void _BCD__ZN4fltk5Group3addERNS_6WidgetE(fltk::Group *This, fltk::Widget   & _0) {
(This->add(_0));
}
void _BCD__ZN4fltk5Group6insertERNS_6WidgetEi(fltk::Group *This, fltk::Widget   & _0, int index) {
(This->insert(_0, index));
}
void _BCD__ZN4fltk5Group6insertERNS_6WidgetEPS1_(fltk::Group *This, fltk::Widget   & o, fltk::Widget * before) {
(This->insert(o, before));
}
void _BCD__ZN4fltk5Group6removeEi(fltk::Group *This, int index) {
(This->remove(index));
}
void _BCD__ZN4fltk5Group6removeERNS_6WidgetE(fltk::Group *This, fltk::Widget   & o) {
(This->remove(o));
}
void _BCD__ZN4fltk5Group10remove_allEv(fltk::Group *This) {
(This->remove_all());
}
void _BCD__ZN4fltk5Group7replaceEiRNS_6WidgetE(fltk::Group *This, int index, fltk::Widget   & _1) {
(This->replace(index, _1));
}
void _BCD__ZN4fltk5Group7replaceERNS_6WidgetES2_(fltk::Group *This, fltk::Widget   & old, fltk::Widget   & o) {
(This->replace(old, o));
}
void _BCD__ZN4fltk5Group4swapEii(fltk::Group *This, int indexA, int indexB) {
(This->swap(indexA, indexB));
}
void _BCD__ZN4fltk5Group5clearEv(fltk::Group *This) {
(This->clear());
}
void _BCD__ZN4fltk5Group9resizableERNS_6WidgetE(fltk::Group *This, fltk::Widget   & o) {
(This->resizable(o));
}
fltk::Widget * _BCD__ZNK4fltk5Group9resizableEv(fltk::Group *This) {
return (This->resizable());
}
void _BCD__ZN4fltk5Group13add_resizableERNS_6WidgetE(fltk::Group *This, fltk::Widget   & o) {
(This->add_resizable(o));
}
void _BCD__ZN4fltk5Group10init_sizesEv(fltk::Group *This) {
(This->init_sizes());
}
void _BCD__ZN4fltk5Group11focus_indexEi(fltk::Group *This, int v) {
(This->focus_index(v));
}
void _BCD__ZN4fltk5Group9set_focusEPNS_6WidgetE(fltk::Group *This, fltk::Widget * w) {
(This->set_focus(w));
}
int _BCD__ZNK4fltk5Group11focus_indexEv(fltk::Group *This) {
return (This->focus_index());
}
int _BCD__ZN4fltk5Group14navigation_keyEv() {
return (fltk::Group::navigation_key());
}
void _BCD__ZN4fltk5Group17fix_old_positionsEv(fltk::Group *This) {
(This->fix_old_positions());
}
typedef int _BCD__243_Flags;
_BCD__243_Flags _BCD__ZNK4fltk5Group12resize_alignEv(fltk::Group *This) {
return (This->resize_align());
}
void _BCD__ZN4fltk5Group12resize_alignEi(fltk::Group *This, _BCD__243_Flags f) {
(This->resize_align(f));
}
int _BCD_R__ZN4fltk5Group4drawEv__Group_R_CHECK(void *);
void _BCD_R__ZN4fltk5Group4drawEv__Group_R(void *);
int _BCD_R__ZN4fltk5Group6layoutEv__Group_R_CHECK(void *);
void _BCD_R__ZN4fltk5Group6layoutEv__Group_R(void *);
int _BCD_R__ZN4fltk5Group6handleEi__Group_R_CHECK(void *);
int _BCD_R__ZN4fltk5Group6handleEi__Group_R(void *, int _0);
}
class Group_R : fltk::Group {
public:
void *__D_data;
void draw() {
if (_BCD_R__ZN4fltk5Group4drawEv__Group_R_CHECK(__D_data))
_BCD_R__ZN4fltk5Group4drawEv__Group_R(__D_data);
else
fltk::Group::draw();
}
void layout() {
if (_BCD_R__ZN4fltk5Group6layoutEv__Group_R_CHECK(__D_data))
_BCD_R__ZN4fltk5Group6layoutEv__Group_R(__D_data);
else
fltk::Group::layout();
}
int handle(int _0) {
if (_BCD_R__ZN4fltk5Group6handleEi__Group_R_CHECK(__D_data))
return _BCD_R__ZN4fltk5Group6handleEi__Group_R(__D_data, _0);
else
return fltk::Group::handle(_0);
}
Group_R(int _0, int _1, int _2, int _3, char const * _4, bool begin) : fltk::Group(_0, _1, _2, _3, _4, begin) {}
};
extern "C" {
Group_R *_BCD_new__ZN4fltk5GroupC1EiiiiPKcb_R(int _0, int _1, int _2, int _3, char const * _4, bool begin) {
return new Group_R(_0, _1, _2, _3, _4, begin);
}
void _BCD_delete_N4fltk5GroupE__Group_R(Group_R *This) {
delete This;
}
void _BCD_RI_N4fltk5GroupE(Group_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__152)(fltk::Widget *, long int);
typedef _BCD_func__152 _BCD__153_Callback1;
typedef void (*_BCD_func__154)(fltk::Widget *);
typedef _BCD_func__154 _BCD__155_Callback0;
typedef void (*_BCD_func__158)(fltk::Widget *, void *);
typedef _BCD_func__158 _BCD__159_Callback;
typedef _BCD__159_Callback _BCD__157_Callback_p;
typedef bool (*_BCD_func__304)();
typedef _BCD_func__304 _BCD__170_Theme;
typedef fltk::Symbol * _BCD__223_Box;
typedef unsigned int _BCD__240_Color;
typedef _BCD__243_Flags _BCD__242_Align;
}
