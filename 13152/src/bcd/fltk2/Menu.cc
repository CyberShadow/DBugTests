/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/Menu.h"
extern "C" {
typedef unsigned char _BCD__9_uchar;
void _BCD_delete_N4fltk4ListE(fltk::List *This) {
delete This;
}
int _BCD__ZN4fltk4List8childrenEPKNS_4MenuEPKii(fltk::List *This, fltk::Menu const * _0, int const * indexes, int level) {
return (This->children(_0, indexes, level));
}
fltk::Widget * _BCD__ZN4fltk4List5childEPKNS_4MenuEPKii(fltk::List *This, fltk::Menu const * _0, int const * indexes, int level) {
return (This->child(_0, indexes, level));
}
void _BCD__ZN4fltk4List13flags_changedEPKNS_4MenuEPNS_6WidgetE(fltk::List *This, fltk::Menu const * _0, fltk::Widget * _1) {
(This->flags_changed(_0, _1));
}
int _BCD_R__ZN4fltk4List8childrenEPKNS_4MenuEPKii__List_R_CHECK(void *);
int _BCD_R__ZN4fltk4List8childrenEPKNS_4MenuEPKii__List_R(void *, fltk::Menu const * _0, int const * indexes, int level);
int _BCD_R__ZN4fltk4List5childEPKNS_4MenuEPKii__List_R_CHECK(void *);
fltk::Widget * _BCD_R__ZN4fltk4List5childEPKNS_4MenuEPKii__List_R(void *, fltk::Menu const * _0, int const * indexes, int level);
int _BCD_R__ZN4fltk4List13flags_changedEPKNS_4MenuEPNS_6WidgetE__List_R_CHECK(void *);
void _BCD_R__ZN4fltk4List13flags_changedEPKNS_4MenuEPNS_6WidgetE__List_R(void *, fltk::Menu const * _0, fltk::Widget * _1);
}
class List_R : fltk::List {
public:
void *__D_data;
int children(fltk::Menu const * _0, int const * indexes, int level) {
if (_BCD_R__ZN4fltk4List8childrenEPKNS_4MenuEPKii__List_R_CHECK(__D_data))
return _BCD_R__ZN4fltk4List8childrenEPKNS_4MenuEPKii__List_R(__D_data, _0, indexes, level);
else
return fltk::List::children(_0, indexes, level);
}
fltk::Widget * child(fltk::Menu const * _0, int const * indexes, int level) {
if (_BCD_R__ZN4fltk4List5childEPKNS_4MenuEPKii__List_R_CHECK(__D_data))
return _BCD_R__ZN4fltk4List5childEPKNS_4MenuEPKii__List_R(__D_data, _0, indexes, level);
else
return fltk::List::child(_0, indexes, level);
}
void flags_changed(fltk::Menu const * _0, fltk::Widget * _1) {
if (_BCD_R__ZN4fltk4List13flags_changedEPKNS_4MenuEPNS_6WidgetE__List_R_CHECK(__D_data))
_BCD_R__ZN4fltk4List13flags_changedEPKNS_4MenuEPNS_6WidgetE__List_R(__D_data, _0, _1);
else
fltk::List::flags_changed(_0, _1);
}
};
extern "C" {
void _BCD_delete_N4fltk4ListE__List_R(List_R *This) {
delete This;
}
void _BCD_RI_N4fltk4ListE(List_R *cd, void *dd) {
cd->__D_data = dd;
}
void _BCD_delete_N4fltk4MenuE(fltk::Menu *This) {
delete This;
}
void _BCD_set__ZN4fltk4Menu13default_styleE(fltk::Menu *This, fltk::NamedStyle * x) {
This->default_style = x;
}
fltk::NamedStyle * _BCD_get__ZN4fltk4Menu13default_styleE(fltk::Menu *This) {
return This->default_style;
}
fltk::Menu *_BCD_new__ZN4fltk4MenuC1EiiiiPKcb(int _0, int _1, int _2, int _3, char const * l, bool begin) {
return new fltk::Menu(_0, _1, _2, _3, l, begin);
}
fltk::List * _BCD__ZNK4fltk4Menu4listEv(fltk::Menu *This) {
return (This->list());
}
void _BCD__ZN4fltk4Menu4listEPNS_4ListE(fltk::Menu *This, fltk::List * l) {
(This->list(l));
}
void _BCD__ZN4fltk4Menu6layoutEv(fltk::Menu *This) {
(This->layout());
}
int _BCD__ZNK4fltk4Menu8childrenEPKii(fltk::Menu *This, int const * indexes, int level) {
return (This->children(indexes, level));
}
int _BCD__ZNK4fltk4Menu8childrenEi(fltk::Menu *This, int index) {
return (This->children(index));
}
int _BCD__ZNK4fltk4Menu8childrenEv(fltk::Menu *This) {
return (This->children());
}
fltk::Widget * _BCD__ZNK4fltk4Menu5childEPKii(fltk::Menu *This, int const * indexes, int level) {
return (This->child(indexes, level));
}
fltk::Widget * _BCD__ZNK4fltk4Menu5childEi(fltk::Menu *This, int index) {
return (This->child(index));
}
fltk::Widget * _BCD__ZNK4fltk4Menu4itemEv(fltk::Menu *This) {
return (This->item());
}
fltk::Widget * _BCD__ZN4fltk4Menu4itemEPNS_6WidgetE(fltk::Menu *This, fltk::Widget * v) {
return (This->item(v));
}
bool _BCD__ZN4fltk4Menu8set_itemEPKii(fltk::Menu *This, int const * indexes, int level) {
return (This->set_item(indexes, level));
}
fltk::Widget * _BCD__ZN4fltk4Menu8get_itemEv(fltk::Menu *This) {
return (This->get_item());
}
int _BCD__ZNK4fltk4Menu5valueEv(fltk::Menu *This) {
return (This->value());
}
bool _BCD__ZN4fltk4Menu5valueEi(fltk::Menu *This, int v) {
return (This->value(v));
}
int _BCD__ZNK4fltk4Menu4sizeEv(fltk::Menu *This) {
return (This->size());
}
void _BCD__ZNK4fltk4Menu9layout_inEPNS_6WidgetEPKii(fltk::Menu *This, fltk::Widget * _0, int const * indexes, int level) {
(This->layout_in(_0, indexes, level));
}
void _BCD__ZNK4fltk4Menu7draw_inEPNS_6WidgetEPKiiii(fltk::Menu *This, fltk::Widget * _0, int const * indexes, int level, int _3, int _4) {
(This->draw_in(_0, indexes, level, _3, _4));
}
int _BCD__ZNK4fltk4Menu13find_selectedEPNS_6WidgetEPKiiii(fltk::Menu *This, fltk::Widget * _0, int const * indexes, int level, int _3, int _4) {
return (This->find_selected(_0, indexes, level, _3, _4));
}
fltk::Rectangle * _BCD__ZNK4fltk4Menu12get_locationEPNS_6WidgetEPKiii(fltk::Menu *This, fltk::Widget * _0, int const * indexes, int level, int _3) {
return new fltk::Rectangle(This->get_location(_0, indexes, level, _3));
}
int _BCD__ZN4fltk4Menu5popupERKNS_9RectangleEPKcb(fltk::Menu *This, fltk::Rectangle   const & _0, char const * title, bool menubar) {
return (This->popup(_0, title, menubar));
}
int _BCD__ZN4fltk4Menu15handle_shortcutEv(fltk::Menu *This) {
return (This->handle_shortcut());
}
void _BCD__ZN4fltk4Menu16default_callbackEPNS_6WidgetEPv(fltk::Widget * _0, void * _1) {
(fltk::Menu::default_callback(_0, _1));
}
void _BCD__ZN4fltk4Menu7executeEPNS_6WidgetE(fltk::Menu *This, fltk::Widget * _0) {
(This->execute(_0));
}
void _BCD__ZN4fltk4Menu6globalEv(fltk::Menu *This) {
(This->global());
}
fltk::Widget * _BCD__ZNK4fltk4Menu4findEPKc(fltk::Menu *This, char const * _0) {
return (This->find(_0));
}
void _BCD__ZN4fltk4Menu6removeEPKc(fltk::Menu *This, char const * l) {
(This->remove(l));
}
typedef void (*_BCD_func__165)(fltk::Widget *, void *);
typedef _BCD_func__165 _BCD__166_Callback;
fltk::Widget * _BCD__ZN4fltk4Menu3addEPKcjPFvPNS_6WidgetEPvES5_i(fltk::Menu *This, char const * _0, unsigned int shortcut, _BCD__166_Callback _2, void * _3, int _4) {
return (This->add(_0, shortcut, _2, _3, _4));
}
fltk::Widget * _BCD__ZN4fltk4Menu7replaceEPKcjPFvPNS_6WidgetEPvES5_i(fltk::Menu *This, char const * _0, unsigned int shortcut, _BCD__166_Callback _2, void * _3, int _4) {
return (This->replace(_0, shortcut, _2, _3, _4));
}
fltk::Widget * _BCD__ZN4fltk4Menu6insertEiPKcjPFvPNS_6WidgetEPvES5_i(fltk::Menu *This, int n, char const * _1, unsigned int shortcut, _BCD__166_Callback _3, void * _4, int _5) {
return (This->insert(n, _1, shortcut, _3, _4, _5));
}
fltk::Widget * _BCD__ZN4fltk4Menu3addEPKcPv(fltk::Menu *This, char const * _0, void * _1) {
return (This->add(_0, _1));
}
fltk::Group * _BCD__ZN4fltk4Menu9add_groupEPKcPNS_5GroupEPv(fltk::Menu *This, char const * label, fltk::Group * parent, void * data) {
return (This->add_group(label, parent, data));
}
fltk::Widget * _BCD__ZN4fltk4Menu8add_leafEPKcPNS_5GroupEPv(fltk::Menu *This, char const * label, fltk::Group * parent, void * data) {
return (This->add_leaf(label, parent, data));
}
fltk::Widget * _BCD__ZN4fltk4Menu8add_manyEPKc(fltk::Menu *This, char const * _0) {
return (This->add_many(_0));
}
fltk::Widget * _BCD__ZN4fltk4Menu7replaceEPKcPv(fltk::Menu *This, char const * _0, void * _1) {
return (This->replace(_0, _1));
}
fltk::Widget * _BCD__ZN4fltk4Menu6insertEiPKcPv(fltk::Menu *This, int n, char const * _1, void * _2) {
return (This->insert(n, _1, _2));
}
void _BCD__ZN4fltk4Menu3addERNS_6WidgetE(fltk::Menu *This, fltk::Widget   & o) {
(This->add(o));
}
void _BCD__ZN4fltk4Menu6insertERNS_6WidgetEi(fltk::Menu *This, fltk::Widget   & o, int n) {
(This->insert(o, n));
}
void _BCD__ZN4fltk4Menu7replaceEiRNS_6WidgetE(fltk::Menu *This, int index, fltk::Widget   & o) {
(This->replace(index, o));
}
void _BCD__ZN4fltk4Menu7replaceERNS_6WidgetES2_(fltk::Menu *This, fltk::Widget   & old, fltk::Widget   & o) {
(This->replace(old, o));
}
void _BCD__ZN4fltk4Menu6removeEi(fltk::Menu *This, int index) {
(This->remove(index));
}
void _BCD__ZN4fltk4Menu6removeERNS_6WidgetE(fltk::Menu *This, fltk::Widget   & o) {
(This->remove(o));
}
int _BCD_R__ZN4fltk4Menu6layoutEv__Menu_R_CHECK(void *);
void _BCD_R__ZN4fltk4Menu6layoutEv__Menu_R(void *);
}
class Menu_R : fltk::Menu {
public:
void *__D_data;
Menu_R(int _0, int _1, int _2, int _3, char const * l, bool begin) : fltk::Menu(_0, _1, _2, _3, l, begin) {}
void layout() {
if (_BCD_R__ZN4fltk4Menu6layoutEv__Menu_R_CHECK(__D_data))
_BCD_R__ZN4fltk4Menu6layoutEv__Menu_R(__D_data);
else
fltk::Menu::layout();
}
};
extern "C" {
Menu_R *_BCD_new__ZN4fltk4MenuC1EiiiiPKcb_R(int _0, int _1, int _2, int _3, char const * l, bool begin) {
return new Menu_R(_0, _1, _2, _3, l, begin);
}
void _BCD_delete_N4fltk4MenuE__Menu_R(Menu_R *This) {
delete This;
}
void _BCD_RI_N4fltk4MenuE(Menu_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__159)(fltk::Widget *, long int);
typedef _BCD_func__159 _BCD__160_Callback1;
typedef void (*_BCD_func__161)(fltk::Widget *);
typedef _BCD_func__161 _BCD__162_Callback0;
typedef _BCD__166_Callback _BCD__164_Callback_p;
typedef bool (*_BCD_func__367)();
typedef _BCD_func__367 _BCD__177_Theme;
typedef fltk::Symbol * _BCD__230_Box;
typedef unsigned int _BCD__247_Color;
typedef int _BCD__250_Flags;
typedef _BCD__250_Flags _BCD__249_Align;
}
