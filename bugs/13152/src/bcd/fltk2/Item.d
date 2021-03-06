/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.Item;
align(4):
public import bcd.bind;
public import bcd.fltk2.Widget;
public import bcd.fltk2.Style;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.Rectangle;
public import bcd.fltk2.Color;
public import bcd.fltk2.Flags;
extern (C) void _BCD_delete_N4fltk4ItemE(void *);
extern (C) void _BCD_set__ZN4fltk4Item13default_styleE(void *, NamedStyle *);
extern (C) NamedStyle * _BCD_get__ZN4fltk4Item13default_styleE(void *);
extern (C) void _BCD__ZN4fltk4Item4drawEv(void *This);
extern (C) void _BCD__ZN4fltk4Item6layoutEv(void *This);
extern (C) int _BCD__ZN4fltk4Item6handleEi(void *This, int);
extern (C) void *_BCD_new__ZN4fltk4ItemC1EPKc(char *);
extern (C) void *_BCD_new__ZN4fltk4ItemC1EPKcPKNS_6SymbolE(char *, void *);
alias void function(Widget *, void *) _BCD_func__158;
extern (C) void *_BCD_new__ZN4fltk4ItemC1EPKciPFvPNS_6WidgetEPvES5_i(char *, int, _BCD_func__158, void *, int);
extern (C) void _BCD__ZN4fltk4Item9set_styleEPKNS_5StyleEb(void *, bool);
extern (C) void _BCD__ZN4fltk4Item11clear_styleEv();
extern (C) void _BCD_RI_N4fltk4ItemE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk4ItemE__Item_R(void *This);
extern (C) int _BCD_R__ZN4fltk4Item4drawEv__Item_R_CHECK(Item_R x) {
union dp {
void delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.draw;
return cast(int) (d.f != &Item.draw);
}
extern (C) void _BCD_R__ZN4fltk4Item4drawEv__Item_R(Item_R __D_class, ) {
__D_class.draw();
}
extern (C) int _BCD_R__ZN4fltk4Item6layoutEv__Item_R_CHECK(Item_R x) {
union dp {
void delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.layout;
return cast(int) (d.f != &Item.layout);
}
extern (C) void _BCD_R__ZN4fltk4Item6layoutEv__Item_R(Item_R __D_class, ) {
__D_class.layout();
}
extern (C) int _BCD_R__ZN4fltk4Item6handleEi__Item_R_CHECK(Item_R x) {
union dp {
int delegate(int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.handle;
return cast(int) (d.f != &Item.handle);
}
extern (C) int _BCD_R__ZN4fltk4Item6handleEi__Item_R(Item_R __D_class, int _0) {
return __D_class.handle(_0);
}
extern (C) void *_BCD_new__ZN4fltk4ItemC1EPKc_R(char *);
extern (C) void *_BCD_new__ZN4fltk4ItemC1EPKcPKNS_6SymbolE_R(char *, void *);
extern (C) void *_BCD_new__ZN4fltk4ItemC1EPKciPFvPNS_6WidgetEPvES5_i_R(char *, int, _BCD_func__158, void *, int);
alias void function(Widget *, int) _BCD_func__152;
alias void function(Widget *) _BCD_func__154;
alias bool function() _BCD_func__265;
class Item : Widget {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk4ItemE(__C_data);
__C_data = null;
}
void set_default_style(NamedStyle * x) {
_BCD_set__ZN4fltk4Item13default_styleE(__C_data, x);
}
NamedStyle * get_default_style() {
return _BCD_get__ZN4fltk4Item13default_styleE(__C_data);
}
void draw() {
_BCD__ZN4fltk4Item4drawEv(__C_data);
}
void layout() {
_BCD__ZN4fltk4Item6layoutEv(__C_data);
}
int handle(int _0) {
return _BCD__ZN4fltk4Item6handleEi(__C_data, _0);
}
this(char * label = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk4ItemC1EPKc(label);
__C_data_owned = true;
}
this(char * label, bcd.bind.BoundClass * _1) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk4ItemC1EPKcPKNS_6SymbolE(label, _1.__C_data);
__C_data_owned = true;
}
this(char * label, int shortcut, _BCD_func__158 callback = null, void * user_data_ = null, int flags = 0) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk4ItemC1EPKciPFvPNS_6WidgetEPvES5_i(label, shortcut, callback, user_data_, flags);
__C_data_owned = true;
}
static void set_style(Style * _0, bool menubar) {
_BCD__ZN4fltk4Item9set_styleEPKNS_5StyleEb(_0.__C_data, menubar);
}
static void clear_style() {
_BCD__ZN4fltk4Item11clear_styleEv();
}
}
class Item_R : Item {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk4ItemE__Item_R(__C_data);
__C_data = null;
}
this(char * label = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk4ItemC1EPKc_R(label);
__C_data_owned = true;
_BCD_RI_N4fltk4ItemE(__C_data, cast(void *) this);
}
this(char * label, bcd.bind.BoundClass * _1) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk4ItemC1EPKcPKNS_6SymbolE_R(label, _1.__C_data);
__C_data_owned = true;
_BCD_RI_N4fltk4ItemE(__C_data, cast(void *) this);
}
this(char * label, int shortcut, _BCD_func__158 callback = null, void * user_data_ = null, int flags = 0) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk4ItemC1EPKciPFvPNS_6WidgetEPvES5_i_R(label, shortcut, callback, user_data_, flags);
__C_data_owned = true;
_BCD_RI_N4fltk4ItemE(__C_data, cast(void *) this);
}
}
