/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/ItemGroup.h"
extern "C" {
typedef unsigned char _BCD__10_uchar;
void _BCD_delete_N4fltk11MenuSectionE(fltk::MenuSection *This) {
delete This;
}
fltk::MenuSection *_BCD_new__ZN4fltk11MenuSectionC1EPKc(char const * label) {
return new fltk::MenuSection(label);
}
fltk::MenuSection *_BCD_new__ZN4fltk11MenuSectionC1EPKcPKNS_6SymbolE(char const * label, fltk::Symbol const * i) {
return new fltk::MenuSection(label, i);
}
fltk::ItemGroup * _BCD__ZNK4fltk11MenuSection5groupEv(fltk::MenuSection *This) {
return (This->group());
}
}
class MenuSection_R : fltk::MenuSection {
public:
void *__D_data;
MenuSection_R(char const * label) : fltk::MenuSection(label) {}
MenuSection_R(char const * label, fltk::Symbol const * i) : fltk::MenuSection(label, i) {}
};
extern "C" {
MenuSection_R *_BCD_new__ZN4fltk11MenuSectionC1EPKc_R(char const * label) {
return new MenuSection_R(label);
}
MenuSection_R *_BCD_new__ZN4fltk11MenuSectionC1EPKcPKNS_6SymbolE_R(char const * label, fltk::Symbol const * i) {
return new MenuSection_R(label, i);
}
void _BCD_delete_N4fltk11MenuSectionE__MenuSection_R(MenuSection_R *This) {
delete This;
}
void _BCD_RI_N4fltk11MenuSectionE(MenuSection_R *cd, void *dd) {
cd->__D_data = dd;
}
void _BCD_delete_N4fltk9ItemGroupE(fltk::ItemGroup *This) {
delete This;
}
void _BCD__ZN4fltk9ItemGroup4drawEv(fltk::ItemGroup *This) {
(This->draw());
}
void _BCD__ZN4fltk9ItemGroup6layoutEv(fltk::ItemGroup *This) {
(This->layout());
}
int _BCD__ZN4fltk9ItemGroup6handleEi(fltk::ItemGroup *This, int _0) {
return (This->handle(_0));
}
fltk::ItemGroup *_BCD_new__ZN4fltk9ItemGroupC1EPKcb(char const * label, bool begin) {
return new fltk::ItemGroup(label, begin);
}
fltk::ItemGroup *_BCD_new__ZN4fltk9ItemGroupC1EPKcPKNS_6SymbolEb(char const * label, fltk::Symbol const * _1, bool begin) {
return new fltk::ItemGroup(label, _1, begin);
}
int _BCD_R__ZN4fltk9ItemGroup4drawEv__ItemGroup_R_CHECK(void *);
void _BCD_R__ZN4fltk9ItemGroup4drawEv__ItemGroup_R(void *);
int _BCD_R__ZN4fltk9ItemGroup6layoutEv__ItemGroup_R_CHECK(void *);
void _BCD_R__ZN4fltk9ItemGroup6layoutEv__ItemGroup_R(void *);
int _BCD_R__ZN4fltk9ItemGroup6handleEi__ItemGroup_R_CHECK(void *);
int _BCD_R__ZN4fltk9ItemGroup6handleEi__ItemGroup_R(void *, int _0);
}
class ItemGroup_R : fltk::ItemGroup {
public:
void *__D_data;
void draw() {
if (_BCD_R__ZN4fltk9ItemGroup4drawEv__ItemGroup_R_CHECK(__D_data))
_BCD_R__ZN4fltk9ItemGroup4drawEv__ItemGroup_R(__D_data);
else
fltk::ItemGroup::draw();
}
void layout() {
if (_BCD_R__ZN4fltk9ItemGroup6layoutEv__ItemGroup_R_CHECK(__D_data))
_BCD_R__ZN4fltk9ItemGroup6layoutEv__ItemGroup_R(__D_data);
else
fltk::ItemGroup::layout();
}
int handle(int _0) {
if (_BCD_R__ZN4fltk9ItemGroup6handleEi__ItemGroup_R_CHECK(__D_data))
return _BCD_R__ZN4fltk9ItemGroup6handleEi__ItemGroup_R(__D_data, _0);
else
return fltk::ItemGroup::handle(_0);
}
ItemGroup_R(char const * label, bool begin) : fltk::ItemGroup(label, begin) {}
ItemGroup_R(char const * label, fltk::Symbol const * _1, bool begin) : fltk::ItemGroup(label, _1, begin) {}
};
extern "C" {
ItemGroup_R *_BCD_new__ZN4fltk9ItemGroupC1EPKcb_R(char const * label, bool begin) {
return new ItemGroup_R(label, begin);
}
ItemGroup_R *_BCD_new__ZN4fltk9ItemGroupC1EPKcPKNS_6SymbolEb_R(char const * label, fltk::Symbol const * _1, bool begin) {
return new ItemGroup_R(label, _1, begin);
}
void _BCD_delete_N4fltk9ItemGroupE__ItemGroup_R(ItemGroup_R *This) {
delete This;
}
void _BCD_RI_N4fltk9ItemGroupE(ItemGroup_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__162)(fltk::Widget *, long int);
typedef _BCD_func__162 _BCD__163_Callback1;
typedef void (*_BCD_func__164)(fltk::Widget *);
typedef _BCD_func__164 _BCD__165_Callback0;
typedef void (*_BCD_func__168)(fltk::Widget *, void *);
typedef _BCD_func__168 _BCD__169_Callback;
typedef _BCD__169_Callback _BCD__167_Callback_p;
typedef bool (*_BCD_func__383)();
typedef _BCD_func__383 _BCD__180_Theme;
typedef fltk::Symbol * _BCD__233_Box;
typedef unsigned int _BCD__250_Color;
typedef int _BCD__253_Flags;
typedef _BCD__253_Flags _BCD__252_Align;
}
