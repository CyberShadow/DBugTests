/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.Input;
align(4):
public import bcd.bind;
public import bcd.fltk2.Widget;
public import bcd.fltk2.Style;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.Rectangle;
public import bcd.fltk2.Color;
public import bcd.fltk2.Flags;
extern (C) void _BCD_delete_N4fltk5InputE(void *);
extern (C) void _BCD_set__ZN4fltk5Input13default_styleE(void *, NamedStyle *);
extern (C) NamedStyle * _BCD_get__ZN4fltk5Input13default_styleE(void *);
extern (C) void *_BCD_new__ZN4fltk5InputC1EiiiiPKc(int, int, int, int, char *);
extern (C) void _BCD__ZN4fltk5Input4drawEv(void *This);
extern (C) void _BCD__ZN4fltk5Input4drawERKNS_9RectangleE(void *This, void *);
extern (C) int _BCD__ZN4fltk5Input6handleEi(void *This, int);
extern (C) int _BCD__ZN4fltk5Input6handleEiRKNS_9RectangleE(void *This, int, void *);
extern (C) bool _BCD__ZN4fltk5Input10handle_keyEv(void *This);
extern (C) bool _BCD__ZN4fltk5Input4textEPKc(void *This, char *);
extern (C) bool _BCD__ZN4fltk5Input4textEPKci(void *This, char *, int);
extern (C) bool _BCD__ZN4fltk5Input11static_textEPKc(void *This, char *);
extern (C) bool _BCD__ZN4fltk5Input11static_textEPKci(void *This, char *, int);
extern (C) char * _BCD__ZNK4fltk5Input4textEv(void *This);
extern (C) char _BCD__ZNK4fltk5Input2atEi(void *This, int);
extern (C) bool _BCD__ZN4fltk5Input5valueEPKc(void *This, char *);
extern (C) bool _BCD__ZN4fltk5Input5valueEPKci(void *This, char *, int);
extern (C) bool _BCD__ZN4fltk5Input12static_valueEPKc(void *This, char *);
extern (C) char * _BCD__ZNK4fltk5Input5valueEv(void *This);
extern (C) int _BCD__ZNK4fltk5Input4sizeEv(void *This);
extern (C) void _BCD__ZN4fltk5Input7reserveEi(void *This, int);
extern (C) int _BCD__ZNK4fltk5Input8positionEv(void *This);
extern (C) int _BCD__ZNK4fltk5Input4markEv(void *This);
extern (C) void _BCD__ZN4fltk5Input8positionEi(void *This, int);
extern (C) void _BCD__ZN4fltk5Input16up_down_positionEib(void *This, int, bool);
extern (C) void _BCD__ZN4fltk5Input4markEi(void *This, int);
extern (C) bool _BCD__ZN4fltk5Input7replaceEiiPKci(void *This, int, int, char *, int);
extern (C) bool _BCD__ZN4fltk5Input3cutEv(void *This);
extern (C) bool _BCD__ZN4fltk5Input3cutEi(void *This, int);
extern (C) bool _BCD__ZN4fltk5Input3cutEii(void *This, int, int);
extern (C) bool _BCD__ZN4fltk5Input6insertEPKc(void *This, char *);
extern (C) bool _BCD__ZN4fltk5Input6insertEPKci(void *This, char *, int);
extern (C) bool _BCD__ZN4fltk5Input7replaceEiic(void *This, int, int, char);
extern (C) bool _BCD__ZN4fltk5Input4copyEb(void *This, bool);
extern (C) bool _BCD__ZN4fltk5Input4undoEv(void *This);
extern (C) void _BCD__ZN4fltk5Input17maybe_do_callbackEv(void *This);
extern (C) int _BCD__ZNK4fltk5Input10word_startEi(void *This, int);
extern (C) int _BCD__ZNK4fltk5Input8word_endEi(void *This, int);
extern (C) int _BCD__ZNK4fltk5Input10line_startEi(void *This, int);
extern (C) int _BCD__ZNK4fltk5Input8line_endEi(void *This, int);
extern (C) int _BCD__ZNK4fltk5Input14mouse_positionERKNS_9RectangleE(void *This, void *);
extern (C) int _BCD__ZNK4fltk5Input7xscrollEv(void *This);
extern (C) int _BCD__ZNK4fltk5Input7yscrollEv(void *This);
extern (C) void _BCD_RI_N4fltk5InputE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk5InputE__Input_R(void *This);
extern (C) void *_BCD_new__ZN4fltk5InputC1EiiiiPKc_R(int, int, int, int, char *);
extern (C) int _BCD_R__ZN4fltk5Input4drawEv__Input_R_CHECK(Input_R x) {
union dp {
void delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.draw;
return cast(int) (d.f != &Input.draw);
}
extern (C) void _BCD_R__ZN4fltk5Input4drawEv__Input_R(Input_R __D_class, ) {
__D_class.draw();
}
extern (C) int _BCD_R__ZN4fltk5Input6handleEi__Input_R_CHECK(Input_R x) {
union dp {
int delegate(int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.handle;
return cast(int) (d.f != &Input.handle);
}
extern (C) int _BCD_R__ZN4fltk5Input6handleEi__Input_R(Input_R __D_class, int _0) {
return __D_class.handle(_0);
}
extern (C) int _BCD_R__ZN4fltk5Input7replaceEiiPKci__Input_R_CHECK(Input_R x) {
union dp {
bool delegate(int, int, char *, int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.replace;
return cast(int) (d.f != &Input.replace);
}
extern (C) bool _BCD_R__ZN4fltk5Input7replaceEiiPKci__Input_R(Input_R __D_class, int _0, int _1, char * _2, int _3) {
return __D_class.replace(_0, _1, _2, _3);
}
alias void function(Widget *, int) _BCD_func__152;
alias void function(Widget *) _BCD_func__154;
alias void function(Widget *, void *) _BCD_func__158;
alias bool function() _BCD_func__315;
const int NORMAL = 0;
const int FLOAT_INPUT = 1;
const int INT_INPUT = 2;
const int SECRET = 3;
const int MULTILINE = 4;
const int WORDWRAP = 5;
class Input : Widget {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk5InputE(__C_data);
__C_data = null;
}
void set_default_style(NamedStyle * x) {
_BCD_set__ZN4fltk5Input13default_styleE(__C_data, x);
}
NamedStyle * get_default_style() {
return _BCD_get__ZN4fltk5Input13default_styleE(__C_data);
}
this(int _0, int _1, int _2, int _3, char * _4 = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk5InputC1EiiiiPKc(_0, _1, _2, _3, _4);
__C_data_owned = true;
}
void draw() {
_BCD__ZN4fltk5Input4drawEv(__C_data);
}
void draw(Rectangle _0) {
_BCD__ZN4fltk5Input4drawERKNS_9RectangleE(__C_data, _0.__C_data);
}
int handle(int _0) {
return _BCD__ZN4fltk5Input6handleEi(__C_data, _0);
}
int handle(int event, Rectangle _1) {
return _BCD__ZN4fltk5Input6handleEiRKNS_9RectangleE(__C_data, event, _1.__C_data);
}
bool handle_key() {
return _BCD__ZN4fltk5Input10handle_keyEv(__C_data);
}
bool text(char * _0) {
return _BCD__ZN4fltk5Input4textEPKc(__C_data, _0);
}
bool text(char * _0, int _1) {
return _BCD__ZN4fltk5Input4textEPKci(__C_data, _0, _1);
}
bool static_text(char * _0) {
return _BCD__ZN4fltk5Input11static_textEPKc(__C_data, _0);
}
bool static_text(char * _0, int _1) {
return _BCD__ZN4fltk5Input11static_textEPKci(__C_data, _0, _1);
}
char * text() {
return _BCD__ZNK4fltk5Input4textEv(__C_data);
}
char at(int i) {
return _BCD__ZNK4fltk5Input2atEi(__C_data, i);
}
bool value(char * v) {
return _BCD__ZN4fltk5Input5valueEPKc(__C_data, v);
}
bool value(char * v, int n) {
return _BCD__ZN4fltk5Input5valueEPKci(__C_data, v, n);
}
bool static_value(char * v) {
return _BCD__ZN4fltk5Input12static_valueEPKc(__C_data, v);
}
char * value() {
return _BCD__ZNK4fltk5Input5valueEv(__C_data);
}
int size() {
return _BCD__ZNK4fltk5Input4sizeEv(__C_data);
}
void reserve(int newsize) {
_BCD__ZN4fltk5Input7reserveEi(__C_data, newsize);
}
int position() {
return _BCD__ZNK4fltk5Input8positionEv(__C_data);
}
int mark() {
return _BCD__ZNK4fltk5Input4markEv(__C_data);
}
void position(int p) {
_BCD__ZN4fltk5Input8positionEi(__C_data, p);
}
void up_down_position(int position, bool extend) {
_BCD__ZN4fltk5Input16up_down_positionEib(__C_data, position, extend);
}
void mark(int m) {
_BCD__ZN4fltk5Input4markEi(__C_data, m);
}
bool replace(int _0, int _1, char * _2, int _3) {
return _BCD__ZN4fltk5Input7replaceEiiPKci(__C_data, _0, _1, _2, _3);
}
bool cut() {
return _BCD__ZN4fltk5Input3cutEv(__C_data);
}
bool cut(int n) {
return _BCD__ZN4fltk5Input3cutEi(__C_data, n);
}
bool cut(int a, int b) {
return _BCD__ZN4fltk5Input3cutEii(__C_data, a, b);
}
bool insert(char * t) {
return _BCD__ZN4fltk5Input6insertEPKc(__C_data, t);
}
bool insert(char * t, int l) {
return _BCD__ZN4fltk5Input6insertEPKci(__C_data, t, l);
}
bool replace(int a, int b, char c) {
return _BCD__ZN4fltk5Input7replaceEiic(__C_data, a, b, c);
}
bool copy(bool clipboard = true) {
return _BCD__ZN4fltk5Input4copyEb(__C_data, clipboard);
}
bool undo() {
return _BCD__ZN4fltk5Input4undoEv(__C_data);
}
void maybe_do_callback() {
_BCD__ZN4fltk5Input17maybe_do_callbackEv(__C_data);
}
int word_start(int i) {
return _BCD__ZNK4fltk5Input10word_startEi(__C_data, i);
}
int word_end(int i) {
return _BCD__ZNK4fltk5Input8word_endEi(__C_data, i);
}
int line_start(int i) {
return _BCD__ZNK4fltk5Input10line_startEi(__C_data, i);
}
int line_end(int i) {
return _BCD__ZNK4fltk5Input8line_endEi(__C_data, i);
}
int mouse_position(Rectangle _0) {
return _BCD__ZNK4fltk5Input14mouse_positionERKNS_9RectangleE(__C_data, _0.__C_data);
}
int xscroll() {
return _BCD__ZNK4fltk5Input7xscrollEv(__C_data);
}
int yscroll() {
return _BCD__ZNK4fltk5Input7yscrollEv(__C_data);
}
}
class Input_R : Input {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk5InputE__Input_R(__C_data);
__C_data = null;
}
this(int _0, int _1, int _2, int _3, char * _4 = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk5InputC1EiiiiPKc_R(_0, _1, _2, _3, _4);
__C_data_owned = true;
_BCD_RI_N4fltk5InputE(__C_data, cast(void *) this);
}
}
