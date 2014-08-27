/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_Browser_;
public import bcd.bind;
const int FL_NORMAL_BROWSER = 0;
const int FL_SELECT_BROWSER = 1;
const int FL_HOLD_BROWSER = 2;
const int FL_MULTI_BROWSER = 3;
public import bcd.fltk.Fl_Scrollbar;
public import bcd.fltk.Fl_Slider;
public import bcd.fltk.Fl_Valuator;
public import bcd.fltk.Fl_Group;
public import bcd.fltk.Fl_Widget;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_11Fl_Browser_(void *);
extern (C) void _BCD_set__ZN11Fl_Browser_9scrollbarE(void *, Fl_Scrollbar);
extern (C) Fl_Scrollbar _BCD_get__ZN11Fl_Browser_9scrollbarE(void *);
extern (C) void _BCD_set__ZN11Fl_Browser_10hscrollbarE(void *, Fl_Scrollbar);
extern (C) Fl_Scrollbar _BCD_get__ZN11Fl_Browser_10hscrollbarE(void *);
extern (C) int _BCD__ZN11Fl_Browser_6handleEi(void *This, int);
extern (C) void _BCD__ZN11Fl_Browser_6resizeEiiii(void *This, int, int, int, int);
extern (C) int _BCD__ZN11Fl_Browser_6selectEPvii(void *This, void *, int, int);
extern (C) int _BCD__ZN11Fl_Browser_11select_onlyEPvi(void *This, void *, int);
extern (C) int _BCD__ZN11Fl_Browser_8deselectEi(void *This, int);
extern (C) int _BCD__ZNK11Fl_Browser_8positionEv(void *This);
extern (C) int _BCD__ZNK11Fl_Browser_9hpositionEv(void *This);
extern (C) void _BCD__ZN11Fl_Browser_8positionEi(void *This, int);
extern (C) void _BCD__ZN11Fl_Browser_9hpositionEi(void *This, int);
extern (C) void _BCD__ZN11Fl_Browser_7displayEPv(void *This, void *);
extern (C) char _BCD__ZNK11Fl_Browser_13has_scrollbarEv(void *This);
extern (C) void _BCD__ZN11Fl_Browser_13has_scrollbarEh(void *This, char);
extern (C) int _BCD__ZNK11Fl_Browser_8textfontEv(void *This);
extern (C) void _BCD__ZN11Fl_Browser_8textfontEh(void *This, char);
extern (C) char _BCD__ZNK11Fl_Browser_8textsizeEv(void *This);
extern (C) void _BCD__ZN11Fl_Browser_8textsizeEh(void *This, char);
extern (C) int _BCD__ZNK11Fl_Browser_9textcolorEv(void *This);
extern (C) void _BCD__ZN11Fl_Browser_9textcolorEj(void *This, uint);
extern (C) void _BCD__ZN11Fl_Browser_15scrollbar_widthEi(int);
extern (C) int _BCD__ZN11Fl_Browser_15scrollbar_widthEv();
extern (C) void _BCD__ZN11Fl_Browser_15scrollbar_rightEv(void *This);
extern (C) void _BCD__ZN11Fl_Browser_14scrollbar_leftEv(void *This);
alias void function(Fl_Widget *, int) _BCD_func__15;
alias void function(Fl_Widget *) _BCD_func__17;
alias void function(Fl_Widget *, void *) _BCD_func__21;
const int HORIZONTAL = 1;
const int VERTICAL = 2;
const int BOTH = 3;
const int ALWAYS_ON = 4;
const int HORIZONTAL_ALWAYS = 5;
const int VERTICAL_ALWAYS = 6;
const int BOTH_ALWAYS = 7;
class Fl_Browser_ : Fl_Group {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_11Fl_Browser_(__C_data);
__C_data = null;
}
void set_scrollbar(Fl_Scrollbar x) {
_BCD_set__ZN11Fl_Browser_9scrollbarE(__C_data, x);
}
Fl_Scrollbar get_scrollbar() {
return _BCD_get__ZN11Fl_Browser_9scrollbarE(__C_data);
}
void set_hscrollbar(Fl_Scrollbar x) {
_BCD_set__ZN11Fl_Browser_10hscrollbarE(__C_data, x);
}
Fl_Scrollbar get_hscrollbar() {
return _BCD_get__ZN11Fl_Browser_10hscrollbarE(__C_data);
}
int handle(int _0) {
return _BCD__ZN11Fl_Browser_6handleEi(__C_data, _0);
}
void resize(int _0, int _1, int _2, int _3) {
_BCD__ZN11Fl_Browser_6resizeEiiii(__C_data, _0, _1, _2, _3);
}
int select(void * _0, int _1, int docallbacks) {
return _BCD__ZN11Fl_Browser_6selectEPvii(__C_data, _0, _1, docallbacks);
}
int select_only(void * _0, int docallbacks) {
return _BCD__ZN11Fl_Browser_11select_onlyEPvi(__C_data, _0, docallbacks);
}
int deselect(int docallbacks) {
return _BCD__ZN11Fl_Browser_8deselectEi(__C_data, docallbacks);
}
int position() {
return _BCD__ZNK11Fl_Browser_8positionEv(__C_data);
}
int hposition() {
return _BCD__ZNK11Fl_Browser_9hpositionEv(__C_data);
}
void position(int _0) {
_BCD__ZN11Fl_Browser_8positionEi(__C_data, _0);
}
void hposition(int _0) {
_BCD__ZN11Fl_Browser_9hpositionEi(__C_data, _0);
}
void display(void * _0) {
_BCD__ZN11Fl_Browser_7displayEPv(__C_data, _0);
}
char has_scrollbar() {
return _BCD__ZNK11Fl_Browser_13has_scrollbarEv(__C_data);
}
void has_scrollbar(char i) {
_BCD__ZN11Fl_Browser_13has_scrollbarEh(__C_data, i);
}
int textfont() {
return _BCD__ZNK11Fl_Browser_8textfontEv(__C_data);
}
void textfont(char s) {
_BCD__ZN11Fl_Browser_8textfontEh(__C_data, s);
}
char textsize() {
return _BCD__ZNK11Fl_Browser_8textsizeEv(__C_data);
}
void textsize(char s) {
_BCD__ZN11Fl_Browser_8textsizeEh(__C_data, s);
}
int textcolor() {
return _BCD__ZNK11Fl_Browser_9textcolorEv(__C_data);
}
void textcolor(uint n) {
_BCD__ZN11Fl_Browser_9textcolorEj(__C_data, n);
}
static void scrollbar_width(int b) {
_BCD__ZN11Fl_Browser_15scrollbar_widthEi(b);
}
static int scrollbar_width() {
return _BCD__ZN11Fl_Browser_15scrollbar_widthEv();
}
void scrollbar_right() {
_BCD__ZN11Fl_Browser_15scrollbar_rightEv(__C_data);
}
void scrollbar_left() {
_BCD__ZN11Fl_Browser_14scrollbar_leftEv(__C_data);
}
}
