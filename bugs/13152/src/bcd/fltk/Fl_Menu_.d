/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_Menu_;
public import bcd.bind;
public import bcd.fltk.Fl_Menu_Item;
public import bcd.fltk.Fl_Image;
public import bcd.fltk.Fl_Widget;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_8Fl_Menu_(void *);
extern (C) int _BCD__ZNK8Fl_Menu_13item_pathnameEPciPK12Fl_Menu_Item(void *This, char *, int, void *);
extern (C) Fl_Menu_Item * _BCD__ZN8Fl_Menu_6pickedEPK12Fl_Menu_Item(void *This, void *);
extern (C) Fl_Menu_Item * _BCD__ZN8Fl_Menu_9find_itemEPKc(void *This, char *);
extern (C) void _BCD__ZN8Fl_Menu_6globalEv(void *This);
extern (C) Fl_Menu_Item * _BCD__ZNK8Fl_Menu_4menuEv(void *This);
extern (C) void _BCD__ZN8Fl_Menu_4menuEPK12Fl_Menu_Item(void *This, void *);
extern (C) void _BCD__ZN8Fl_Menu_4copyEPK12Fl_Menu_ItemPv(void *This, void *, void *);
alias void function(Fl_Widget *, void *) _BCD_func__21;
extern (C) int _BCD__ZN8Fl_Menu_3addEPKciPFvP9Fl_WidgetPvES4_i(void *This, char *, int, _BCD_func__21, void *, int);
extern (C) int _BCD__ZN8Fl_Menu_3addEPKcS1_PFvP9Fl_WidgetPvES4_i(void *This, char *, char *, _BCD_func__21, void *, int);
extern (C) int _BCD__ZNK8Fl_Menu_4sizeEv(void *This);
extern (C) void _BCD__ZN8Fl_Menu_4sizeEii(void *This, int, int);
extern (C) void _BCD__ZN8Fl_Menu_5clearEv(void *This);
extern (C) int _BCD__ZN8Fl_Menu_3addEPKc(void *This, char *);
extern (C) void _BCD__ZN8Fl_Menu_7replaceEiPKc(void *This, int, char *);
extern (C) void _BCD__ZN8Fl_Menu_6removeEi(void *This, int);
extern (C) void _BCD__ZN8Fl_Menu_8shortcutEii(void *This, int, int);
extern (C) void _BCD__ZN8Fl_Menu_4modeEii(void *This, int, int);
extern (C) int _BCD__ZNK8Fl_Menu_4modeEi(void *This, int);
extern (C) Fl_Menu_Item * _BCD__ZNK8Fl_Menu_6mvalueEv(void *This);
extern (C) int _BCD__ZNK8Fl_Menu_5valueEv(void *This);
extern (C) int _BCD__ZN8Fl_Menu_5valueEPK12Fl_Menu_Item(void *This, void *);
extern (C) int _BCD__ZN8Fl_Menu_5valueEi(void *This, int);
extern (C) char * _BCD__ZNK8Fl_Menu_4textEv(void *This);
extern (C) char * _BCD__ZNK8Fl_Menu_4textEi(void *This, int);
extern (C) int _BCD__ZNK8Fl_Menu_8textfontEv(void *This);
extern (C) void _BCD__ZN8Fl_Menu_8textfontEh(void *This, char);
extern (C) char _BCD__ZNK8Fl_Menu_8textsizeEv(void *This);
extern (C) void _BCD__ZN8Fl_Menu_8textsizeEh(void *This, char);
extern (C) int _BCD__ZNK8Fl_Menu_9textcolorEv(void *This);
extern (C) void _BCD__ZN8Fl_Menu_9textcolorEj(void *This, uint);
extern (C) int _BCD__ZNK8Fl_Menu_8down_boxEv(void *This);
extern (C) void _BCD__ZN8Fl_Menu_8down_boxE10Fl_Boxtype(void *This, int);
extern (C) int _BCD__ZNK8Fl_Menu_10down_colorEv(void *This);
extern (C) void _BCD__ZN8Fl_Menu_10down_colorEj(void *This, uint);
alias void function(Fl_Widget *, int) _BCD_func__15;
alias void function(Fl_Widget *) _BCD_func__17;
class Fl_Menu_ : Fl_Widget {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_8Fl_Menu_(__C_data);
__C_data = null;
}
int item_pathname(char * name, int namelen, Fl_Menu_Item * finditem) {
return _BCD__ZNK8Fl_Menu_13item_pathnameEPciPK12Fl_Menu_Item(__C_data, name, namelen, finditem.__C_data);
}
Fl_Menu_Item * picked(Fl_Menu_Item * _0) {
return _BCD__ZN8Fl_Menu_6pickedEPK12Fl_Menu_Item(__C_data, _0.__C_data);
}
Fl_Menu_Item * find_item(char * name) {
return _BCD__ZN8Fl_Menu_9find_itemEPKc(__C_data, name);
}
void global() {
_BCD__ZN8Fl_Menu_6globalEv(__C_data);
}
Fl_Menu_Item * menu() {
return _BCD__ZNK8Fl_Menu_4menuEv(__C_data);
}
void menu(Fl_Menu_Item * m) {
_BCD__ZN8Fl_Menu_4menuEPK12Fl_Menu_Item(__C_data, m.__C_data);
}
void copy(Fl_Menu_Item * m, void * user_data) {
_BCD__ZN8Fl_Menu_4copyEPK12Fl_Menu_ItemPv(__C_data, m.__C_data, user_data);
}
int add(char * _0, int shortcut, _BCD_func__21 _2, void * _3, int _4) {
return _BCD__ZN8Fl_Menu_3addEPKciPFvP9Fl_WidgetPvES4_i(__C_data, _0, shortcut, _2, _3, _4);
}
int add(char * a, char * b, _BCD_func__21 c, void * d, int e) {
return _BCD__ZN8Fl_Menu_3addEPKcS1_PFvP9Fl_WidgetPvES4_i(__C_data, a, b, c, d, e);
}
int size() {
return _BCD__ZNK8Fl_Menu_4sizeEv(__C_data);
}
void size(int W, int H) {
_BCD__ZN8Fl_Menu_4sizeEii(__C_data, W, H);
}
void clear() {
_BCD__ZN8Fl_Menu_5clearEv(__C_data);
}
int add(char * _0) {
return _BCD__ZN8Fl_Menu_3addEPKc(__C_data, _0);
}
void replace(int _0, char * _1) {
_BCD__ZN8Fl_Menu_7replaceEiPKc(__C_data, _0, _1);
}
void remove(int _0) {
_BCD__ZN8Fl_Menu_6removeEi(__C_data, _0);
}
void shortcut(int i, int s) {
_BCD__ZN8Fl_Menu_8shortcutEii(__C_data, i, s);
}
void mode(int i, int fl) {
_BCD__ZN8Fl_Menu_4modeEii(__C_data, i, fl);
}
int mode(int i) {
return _BCD__ZNK8Fl_Menu_4modeEi(__C_data, i);
}
Fl_Menu_Item * mvalue() {
return _BCD__ZNK8Fl_Menu_6mvalueEv(__C_data);
}
int value() {
return _BCD__ZNK8Fl_Menu_5valueEv(__C_data);
}
int value(Fl_Menu_Item * _0) {
return _BCD__ZN8Fl_Menu_5valueEPK12Fl_Menu_Item(__C_data, _0.__C_data);
}
int value(int i) {
return _BCD__ZN8Fl_Menu_5valueEi(__C_data, i);
}
char * text() {
return _BCD__ZNK8Fl_Menu_4textEv(__C_data);
}
char * text(int i) {
return _BCD__ZNK8Fl_Menu_4textEi(__C_data, i);
}
int textfont() {
return _BCD__ZNK8Fl_Menu_8textfontEv(__C_data);
}
void textfont(char c) {
_BCD__ZN8Fl_Menu_8textfontEh(__C_data, c);
}
char textsize() {
return _BCD__ZNK8Fl_Menu_8textsizeEv(__C_data);
}
void textsize(char c) {
_BCD__ZN8Fl_Menu_8textsizeEh(__C_data, c);
}
int textcolor() {
return _BCD__ZNK8Fl_Menu_9textcolorEv(__C_data);
}
void textcolor(uint c) {
_BCD__ZN8Fl_Menu_9textcolorEj(__C_data, c);
}
int down_box() {
return _BCD__ZNK8Fl_Menu_8down_boxEv(__C_data);
}
void down_box(int b) {
_BCD__ZN8Fl_Menu_8down_boxE10Fl_Boxtype(__C_data, b);
}
int down_color() {
return _BCD__ZNK8Fl_Menu_10down_colorEv(__C_data);
}
void down_color(uint c) {
_BCD__ZN8Fl_Menu_10down_colorEj(__C_data, c);
}
}