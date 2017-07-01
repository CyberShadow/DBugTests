/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.ComboBox;
align(4):
public import bcd.bind;
public import bcd.fltk2.Input;
public import bcd.fltk2.Choice;
public import bcd.fltk2.Menu;
public import bcd.fltk2.Group;
public import bcd.fltk2.Widget;
public import bcd.fltk2.Style;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.Rectangle;
public import bcd.fltk2.Color;
public import bcd.fltk2.Flags;
extern (C) void _BCD_delete_N4fltk8ComboBoxE(void *);
extern (C) void _BCD_set__ZN4fltk8ComboBox13default_styleE(void *, NamedStyle *);
extern (C) NamedStyle * _BCD_get__ZN4fltk8ComboBox13default_styleE(void *);
extern (C) void *_BCD_new__ZN4fltk8ComboBoxC1EiiiiPKc(int, int, int, int, char *);
extern (C) void _BCD__ZN4fltk8ComboBox4drawEv(void *This);
extern (C) void _BCD__ZN4fltk8ComboBox6layoutEv(void *This);
extern (C) int _BCD__ZN4fltk8ComboBox6handleEi(void *This, int);
extern (C) int _BCD__ZN4fltk8ComboBox5popupERKNS_9RectangleEPKcb(void *This, void *, char *, bool);
extern (C) int _BCD__ZN4fltk8ComboBox6choiceEi(void *This, int);
extern (C) int _BCD__ZNK4fltk8ComboBox6choiceEv(void *This);
extern (C) int _BCD__ZNK4fltk8ComboBox11find_choiceEv(void *This);
extern (C) bool _BCD__ZN4fltk8ComboBox4textEPKc(void *This, char *);
extern (C) bool _BCD__ZN4fltk8ComboBox4textEPKci(void *This, char *, int);
extern (C) bool _BCD__ZN4fltk8ComboBox11static_textEPKc(void *This, char *);
extern (C) bool _BCD__ZN4fltk8ComboBox11static_textEPKci(void *This, char *, int);
extern (C) char * _BCD__ZNK4fltk8ComboBox4textEv(void *This);
extern (C) char _BCD__ZNK4fltk8ComboBox2atEi(void *This, int);
extern (C) int _BCD__ZNK4fltk8ComboBox4sizeEb(void *This, bool);
extern (C) int _BCD__ZNK4fltk8ComboBox8positionEv(void *This);
extern (C) int _BCD__ZNK4fltk8ComboBox4markEv(void *This);
extern (C) void _BCD__ZN4fltk8ComboBox8positionEi(void *This, int);
extern (C) void _BCD__ZN4fltk8ComboBox16up_down_positionEib(void *This, int, bool);
extern (C) void _BCD__ZN4fltk8ComboBox4markEi(void *This, int);
extern (C) bool _BCD__ZN4fltk8ComboBox7replaceEiiPKci(void *This, int, int, char *, int);
extern (C) bool _BCD__ZN4fltk8ComboBox3cutEv(void *This);
extern (C) bool _BCD__ZN4fltk8ComboBox3cutEi(void *This, int);
extern (C) bool _BCD__ZN4fltk8ComboBox3cutEii(void *This, int, int);
extern (C) bool _BCD__ZN4fltk8ComboBox6insertEPKci(void *This, char *, int);
extern (C) bool _BCD__ZN4fltk8ComboBox7replaceEiic(void *This, int, int, char);
extern (C) bool _BCD__ZN4fltk8ComboBox4copyEb(void *This, bool);
extern (C) bool _BCD__ZN4fltk8ComboBox4undoEv(void *This);
extern (C) int _BCD__ZNK4fltk8ComboBox10word_startEi(void *This, int);
extern (C) int _BCD__ZNK4fltk8ComboBox8word_endEi(void *This, int);
extern (C) int _BCD__ZNK4fltk8ComboBox10line_startEi(void *This, int);
extern (C) int _BCD__ZNK4fltk8ComboBox8line_endEi(void *This, int);
extern (C) int _BCD__ZNK4fltk8ComboBox14mouse_positionERKNS_9RectangleE(void *This, void *);
extern (C) int _BCD__ZNK4fltk8ComboBox7xscrollEv(void *This);
extern (C) int _BCD__ZNK4fltk8ComboBox7yscrollEv(void *This);
extern (C) void _BCD_RI_N4fltk8ComboBoxE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk8ComboBoxE__ComboBox_R(void *This);
extern (C) void *_BCD_new__ZN4fltk8ComboBoxC1EiiiiPKc_R(int, int, int, int, char *);
extern (C) int _BCD_R__ZN4fltk8ComboBox4drawEv__ComboBox_R_CHECK(ComboBox_R x) {
union dp {
void delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.draw;
return cast(int) (d.f != &ComboBox.draw);
}
extern (C) void _BCD_R__ZN4fltk8ComboBox4drawEv__ComboBox_R(ComboBox_R __D_class, ) {
__D_class.draw();
}
extern (C) int _BCD_R__ZN4fltk8ComboBox6layoutEv__ComboBox_R_CHECK(ComboBox_R x) {
union dp {
void delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.layout;
return cast(int) (d.f != &ComboBox.layout);
}
extern (C) void _BCD_R__ZN4fltk8ComboBox6layoutEv__ComboBox_R(ComboBox_R __D_class, ) {
__D_class.layout();
}
extern (C) int _BCD_R__ZN4fltk8ComboBox6handleEi__ComboBox_R_CHECK(ComboBox_R x) {
union dp {
int delegate(int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.handle;
return cast(int) (d.f != &ComboBox.handle);
}
extern (C) int _BCD_R__ZN4fltk8ComboBox6handleEi__ComboBox_R(ComboBox_R __D_class, int _0) {
return __D_class.handle(_0);
}
extern (C) int _BCD_R__ZN4fltk8ComboBox7replaceEiiPKci__ComboBox_R_CHECK(ComboBox_R x) {
union dp {
bool delegate(int, int, char *, int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.replace;
return cast(int) (d.f != &ComboBox.replace);
}
extern (C) bool _BCD_R__ZN4fltk8ComboBox7replaceEiiPKci__ComboBox_R(ComboBox_R __D_class, int a, int b, char * c, int d) {
return __D_class.replace(a, b, c, d);
}
alias void function(Widget *, int) _BCD_func__165;
alias void function(Widget *) _BCD_func__167;
alias void function(Widget *, void *) _BCD_func__171;
alias bool function() _BCD_func__485;
class ComboBox : Choice {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk8ComboBoxE(__C_data);
__C_data = null;
}
void set_default_style(NamedStyle * x) {
_BCD_set__ZN4fltk8ComboBox13default_styleE(__C_data, x);
}
NamedStyle * get_default_style() {
return _BCD_get__ZN4fltk8ComboBox13default_styleE(__C_data);
}
this(int _0, int _1, int _2, int _3, char * _4 = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk8ComboBoxC1EiiiiPKc(_0, _1, _2, _3, _4);
__C_data_owned = true;
}
void draw() {
_BCD__ZN4fltk8ComboBox4drawEv(__C_data);
}
void layout() {
_BCD__ZN4fltk8ComboBox6layoutEv(__C_data);
}
int handle(int _0) {
return _BCD__ZN4fltk8ComboBox6handleEi(__C_data, _0);
}
int popup(Rectangle _0, char * title = null, bool menubar = false) {
return _BCD__ZN4fltk8ComboBox5popupERKNS_9RectangleEPKcb(__C_data, _0.__C_data, title, menubar);
}
int choice(int v) {
return _BCD__ZN4fltk8ComboBox6choiceEi(__C_data, v);
}
int choice() {
return _BCD__ZNK4fltk8ComboBox6choiceEv(__C_data);
}
int find_choice() {
return _BCD__ZNK4fltk8ComboBox11find_choiceEv(__C_data);
}
bool text(char * txt) {
return _BCD__ZN4fltk8ComboBox4textEPKc(__C_data, txt);
}
bool text(char * txt, int n) {
return _BCD__ZN4fltk8ComboBox4textEPKci(__C_data, txt, n);
}
bool static_text(char * txt) {
return _BCD__ZN4fltk8ComboBox11static_textEPKc(__C_data, txt);
}
bool static_text(char * txt, int n) {
return _BCD__ZN4fltk8ComboBox11static_textEPKci(__C_data, txt, n);
}
char * text() {
return _BCD__ZNK4fltk8ComboBox4textEv(__C_data);
}
char at(int i) {
return _BCD__ZNK4fltk8ComboBox2atEi(__C_data, i);
}
int size(bool ofText) {
return _BCD__ZNK4fltk8ComboBox4sizeEb(__C_data, ofText);
}
int position() {
return _BCD__ZNK4fltk8ComboBox8positionEv(__C_data);
}
int mark() {
return _BCD__ZNK4fltk8ComboBox4markEv(__C_data);
}
void position(int p) {
_BCD__ZN4fltk8ComboBox8positionEi(__C_data, p);
}
void up_down_position(int p, bool m) {
_BCD__ZN4fltk8ComboBox16up_down_positionEib(__C_data, p, m);
}
void mark(int m) {
_BCD__ZN4fltk8ComboBox4markEi(__C_data, m);
}
bool replace(int a, int b, char * c, int d) {
return _BCD__ZN4fltk8ComboBox7replaceEiiPKci(__C_data, a, b, c, d);
}
bool cut() {
return _BCD__ZN4fltk8ComboBox3cutEv(__C_data);
}
bool cut(int n) {
return _BCD__ZN4fltk8ComboBox3cutEi(__C_data, n);
}
bool cut(int a, int b) {
return _BCD__ZN4fltk8ComboBox3cutEii(__C_data, a, b);
}
bool insert(char * t, int l = 0) {
return _BCD__ZN4fltk8ComboBox6insertEPKci(__C_data, t, l);
}
bool replace(int a, int b, char c) {
return _BCD__ZN4fltk8ComboBox7replaceEiic(__C_data, a, b, c);
}
bool copy(bool clipboard = true) {
return _BCD__ZN4fltk8ComboBox4copyEb(__C_data, clipboard);
}
bool undo() {
return _BCD__ZN4fltk8ComboBox4undoEv(__C_data);
}
int word_start(int i) {
return _BCD__ZNK4fltk8ComboBox10word_startEi(__C_data, i);
}
int word_end(int i) {
return _BCD__ZNK4fltk8ComboBox8word_endEi(__C_data, i);
}
int line_start(int i) {
return _BCD__ZNK4fltk8ComboBox10line_startEi(__C_data, i);
}
int line_end(int i) {
return _BCD__ZNK4fltk8ComboBox8line_endEi(__C_data, i);
}
int mouse_position(Rectangle r) {
return _BCD__ZNK4fltk8ComboBox14mouse_positionERKNS_9RectangleE(__C_data, r.__C_data);
}
int xscroll() {
return _BCD__ZNK4fltk8ComboBox7xscrollEv(__C_data);
}
int yscroll() {
return _BCD__ZNK4fltk8ComboBox7yscrollEv(__C_data);
}
}
class ComboBox_R : ComboBox {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk8ComboBoxE__ComboBox_R(__C_data);
__C_data = null;
}
this(int _0, int _1, int _2, int _3, char * _4 = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk8ComboBoxC1EiiiiPKc_R(_0, _1, _2, _3, _4);
__C_data_owned = true;
_BCD_RI_N4fltk8ComboBoxE(__C_data, cast(void *) this);
}
}