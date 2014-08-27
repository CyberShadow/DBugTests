/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.HelpView;
align(4):
public import bcd.bind;
public import bcd.fltk2.SharedImage;
public import bcd.fltk2.Image;
public import bcd.fltk2.Symbol;
public import bcd.fltk2.Scrollbar;
public import bcd.fltk2.Slider;
public import bcd.fltk2.Valuator;
public import bcd.fltk2.Group;
public import bcd.fltk2.Widget;
public import bcd.fltk2.Style;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.draw;
public import bcd.fltk2.PixelType;
public import bcd.fltk2.Rectangle;
public import bcd.fltk2.Color;
public import bcd.fltk2.Flags;
alias int function(void *) _BCD_func__145;
alias int function(void *, long *, int) _BCD_func__147;
alias int function(void *, char *, uint) _BCD_func__149;
alias int function(void *, char *, uint) _BCD_func__151;
alias void function(void *) _BCD_func__471;
alias int function(void * *, char *) _BCD_func__472;
alias int function(char *, char * * *, uint *) _BCD_func__473;
alias int function(void *, char *, char *, char *, char *) _BCD_func__474;
extern (C) void _BCD_delete_N4fltk8HelpViewE(void *);
extern (C) void *_BCD_new__ZN4fltk8HelpViewC1EiiiiPKc(int, int, int, int, char *);
extern (C) char * _BCD__ZNK4fltk8HelpView9directoryEv(void *This);
extern (C) char * _BCD__ZNK4fltk8HelpView8filenameEv(void *This);
alias char * function(Widget *, char *) _BCD_func__565;
alias _BCD_func__565 HelpFunc;
extern (C) void _BCD__ZN4fltk8HelpView4linkEPFPKcPNS_6WidgetES2_E(void *This, _BCD_func__565);
extern (C) int _BCD__ZN4fltk8HelpView4loadEPKc(void *This, char *);
extern (C) void _BCD__ZN4fltk8HelpView6layoutEv(void *This);
extern (C) int _BCD__ZNK4fltk8HelpView4sizeEv(void *This);
extern (C) void _BCD__ZN4fltk8HelpView9textcolorEj(void *This, uint);
extern (C) void _BCD__ZN4fltk8HelpView8textfontEPNS_4FontE(void *This, void *);
extern (C) uint _BCD__ZNK4fltk8HelpView9textcolorEv(void *This);
extern (C) bcd.bind.BoundClass * _BCD__ZNK4fltk8HelpView8textfontEv(void *This);
extern (C) char * _BCD__ZN4fltk8HelpView5titleEv(void *This);
extern (C) void _BCD__ZN4fltk8HelpView7toplineEPKc(void *This, char *);
extern (C) void _BCD__ZN4fltk8HelpView7toplineEi(void *This, int);
extern (C) int _BCD__ZNK4fltk8HelpView7toplineEv(void *This);
extern (C) void _BCD__ZN4fltk8HelpView8leftlineEi(void *This, int);
extern (C) int _BCD__ZNK4fltk8HelpView8leftlineEv(void *This);
extern (C) void _BCD__ZN4fltk8HelpView5valueEPKc(void *This, char *);
extern (C) char * _BCD__ZNK4fltk8HelpView5valueEv(void *This);
extern (C) int _BCD__ZN4fltk8HelpView4findEPKci(void *This, char *, int);
extern (C) void _BCD_RI_N4fltk8HelpViewE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk8HelpViewE__HelpView_R(void *This);
extern (C) void *_BCD_new__ZN4fltk8HelpViewC1EiiiiPKc_R(int, int, int, int, char *);
extern (C) int _BCD_R__ZN4fltk8HelpView6layoutEv__HelpView_R_CHECK(HelpView_R x) {
union dp {
void delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.layout;
return cast(int) (d.f != &HelpView.layout);
}
extern (C) void _BCD_R__ZN4fltk8HelpView6layoutEv__HelpView_R(HelpView_R __D_class, ) {
__D_class.layout();
}
extern (C) void _BCD_delete_N4fltk10HelpTargetE(void *);
extern (C) void _BCD_set__ZN4fltk10HelpTarget1yE(void *, int);
extern (C) int _BCD_get__ZN4fltk10HelpTarget1yE(void *);
extern (C) void _BCD_RI_N4fltk10HelpTargetE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk10HelpTargetE__HelpTarget_R(void *This);
extern (C) void _BCD_delete_N4fltk8HelpLinkE(void *);
extern (C) void _BCD_set__ZN4fltk8HelpLink1xE(void *, int);
extern (C) int _BCD_get__ZN4fltk8HelpLink1xE(void *);
extern (C) void _BCD_set__ZN4fltk8HelpLink1yE(void *, int);
extern (C) int _BCD_get__ZN4fltk8HelpLink1yE(void *);
extern (C) void _BCD_set__ZN4fltk8HelpLink1wE(void *, int);
extern (C) int _BCD_get__ZN4fltk8HelpLink1wE(void *);
extern (C) void _BCD_set__ZN4fltk8HelpLink1hE(void *, int);
extern (C) int _BCD_get__ZN4fltk8HelpLink1hE(void *);
extern (C) void _BCD_RI_N4fltk8HelpLinkE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk8HelpLinkE__HelpLink_R(void *This);
extern (C) void _BCD_delete_N4fltk9HelpBlockE(void *);
extern (C) void _BCD_set__ZN4fltk9HelpBlock5startE(void *, char *);
extern (C) char * _BCD_get__ZN4fltk9HelpBlock5startE(void *);
extern (C) void _BCD_set__ZN4fltk9HelpBlock3endE(void *, char *);
extern (C) char * _BCD_get__ZN4fltk9HelpBlock3endE(void *);
extern (C) void _BCD_set__ZN4fltk9HelpBlock6borderE(void *, char);
extern (C) char _BCD_get__ZN4fltk9HelpBlock6borderE(void *);
extern (C) void _BCD_set__ZN4fltk9HelpBlock7bgcolorE(void *, uint);
extern (C) uint _BCD_get__ZN4fltk9HelpBlock7bgcolorE(void *);
extern (C) void _BCD_set__ZN4fltk9HelpBlock1xE(void *, int);
extern (C) int _BCD_get__ZN4fltk9HelpBlock1xE(void *);
extern (C) void _BCD_set__ZN4fltk9HelpBlock1yE(void *, int);
extern (C) int _BCD_get__ZN4fltk9HelpBlock1yE(void *);
extern (C) void _BCD_set__ZN4fltk9HelpBlock1wE(void *, int);
extern (C) int _BCD_get__ZN4fltk9HelpBlock1wE(void *);
extern (C) void _BCD_set__ZN4fltk9HelpBlock1hE(void *, int);
extern (C) int _BCD_get__ZN4fltk9HelpBlock1hE(void *);
extern (C) void _BCD_RI_N4fltk9HelpBlockE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk9HelpBlockE__HelpBlock_R(void *This);
alias char * function(void *, int, int, int, char *) _BCD_func__1060;
alias void function(Widget *, int) _BCD_func__690;
alias void function(Widget *) _BCD_func__692;
alias void function(Widget *, void *) _BCD_func__696;
alias bool function() _BCD_func__1190;
alias SharedImage * function(char *, char *, int) _BCD_func__1576;
class HelpView : Group {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk8HelpViewE(__C_data);
__C_data = null;
}
this(int xx, int yy, int ww, int hh, char * l = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk8HelpViewC1EiiiiPKc(xx, yy, ww, hh, l);
__C_data_owned = true;
}
char * directory() {
return _BCD__ZNK4fltk8HelpView9directoryEv(__C_data);
}
char * filename() {
return _BCD__ZNK4fltk8HelpView8filenameEv(__C_data);
}
void link(_BCD_func__565 fn) {
_BCD__ZN4fltk8HelpView4linkEPFPKcPNS_6WidgetES2_E(__C_data, fn);
}
int load(char * f) {
return _BCD__ZN4fltk8HelpView4loadEPKc(__C_data, f);
}
void layout() {
_BCD__ZN4fltk8HelpView6layoutEv(__C_data);
}
int size() {
return _BCD__ZNK4fltk8HelpView4sizeEv(__C_data);
}
void textcolor(uint c) {
_BCD__ZN4fltk8HelpView9textcolorEj(__C_data, c);
}
void textfont(bcd.bind.BoundClass * f) {
_BCD__ZN4fltk8HelpView8textfontEPNS_4FontE(__C_data, f.__C_data);
}
uint textcolor() {
return _BCD__ZNK4fltk8HelpView9textcolorEv(__C_data);
}
bcd.bind.BoundClass * textfont() {
return _BCD__ZNK4fltk8HelpView8textfontEv(__C_data);
}
char * title() {
return _BCD__ZN4fltk8HelpView5titleEv(__C_data);
}
void topline(char * n) {
_BCD__ZN4fltk8HelpView7toplineEPKc(__C_data, n);
}
void topline(int _0) {
_BCD__ZN4fltk8HelpView7toplineEi(__C_data, _0);
}
int topline() {
return _BCD__ZNK4fltk8HelpView7toplineEv(__C_data);
}
void leftline(int _0) {
_BCD__ZN4fltk8HelpView8leftlineEi(__C_data, _0);
}
int leftline() {
return _BCD__ZNK4fltk8HelpView8leftlineEv(__C_data);
}
void value(char * v) {
_BCD__ZN4fltk8HelpView5valueEPKc(__C_data, v);
}
char * value() {
return _BCD__ZNK4fltk8HelpView5valueEv(__C_data);
}
int find(char * s, int p) {
return _BCD__ZN4fltk8HelpView4findEPKci(__C_data, s, p);
}
}
class HelpView_R : HelpView {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk8HelpViewE__HelpView_R(__C_data);
__C_data = null;
}
this(int xx, int yy, int ww, int hh, char * l = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk8HelpViewC1EiiiiPKc_R(xx, yy, ww, hh, l);
__C_data_owned = true;
_BCD_RI_N4fltk8HelpViewE(__C_data, cast(void *) this);
}
}
class HelpTarget : bcd.bind.BoundClass {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk10HelpTargetE(__C_data);
__C_data = null;
}
void set_y(int x) {
_BCD_set__ZN4fltk10HelpTarget1yE(__C_data, x);
}
int get_y() {
return _BCD_get__ZN4fltk10HelpTarget1yE(__C_data);
}
}
class HelpTarget_R : HelpTarget {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk10HelpTargetE__HelpTarget_R(__C_data);
__C_data = null;
}
this() { super(cast(ireal) 0); }
}
class HelpLink : bcd.bind.BoundClass {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk8HelpLinkE(__C_data);
__C_data = null;
}
void set_x(int x) {
_BCD_set__ZN4fltk8HelpLink1xE(__C_data, x);
}
int get_x() {
return _BCD_get__ZN4fltk8HelpLink1xE(__C_data);
}
void set_y(int x) {
_BCD_set__ZN4fltk8HelpLink1yE(__C_data, x);
}
int get_y() {
return _BCD_get__ZN4fltk8HelpLink1yE(__C_data);
}
void set_w(int x) {
_BCD_set__ZN4fltk8HelpLink1wE(__C_data, x);
}
int get_w() {
return _BCD_get__ZN4fltk8HelpLink1wE(__C_data);
}
void set_h(int x) {
_BCD_set__ZN4fltk8HelpLink1hE(__C_data, x);
}
int get_h() {
return _BCD_get__ZN4fltk8HelpLink1hE(__C_data);
}
}
class HelpLink_R : HelpLink {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk8HelpLinkE__HelpLink_R(__C_data);
__C_data = null;
}
this() { super(cast(ireal) 0); }
}
class HelpBlock : bcd.bind.BoundClass {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk9HelpBlockE(__C_data);
__C_data = null;
}
void set_start(char * x) {
_BCD_set__ZN4fltk9HelpBlock5startE(__C_data, x);
}
char * get_start() {
return _BCD_get__ZN4fltk9HelpBlock5startE(__C_data);
}
void set_end(char * x) {
_BCD_set__ZN4fltk9HelpBlock3endE(__C_data, x);
}
char * get_end() {
return _BCD_get__ZN4fltk9HelpBlock3endE(__C_data);
}
void set_border(char x) {
_BCD_set__ZN4fltk9HelpBlock6borderE(__C_data, x);
}
char get_border() {
return _BCD_get__ZN4fltk9HelpBlock6borderE(__C_data);
}
void set_bgcolor(uint x) {
_BCD_set__ZN4fltk9HelpBlock7bgcolorE(__C_data, x);
}
uint get_bgcolor() {
return _BCD_get__ZN4fltk9HelpBlock7bgcolorE(__C_data);
}
void set_x(int x) {
_BCD_set__ZN4fltk9HelpBlock1xE(__C_data, x);
}
int get_x() {
return _BCD_get__ZN4fltk9HelpBlock1xE(__C_data);
}
void set_y(int x) {
_BCD_set__ZN4fltk9HelpBlock1yE(__C_data, x);
}
int get_y() {
return _BCD_get__ZN4fltk9HelpBlock1yE(__C_data);
}
void set_w(int x) {
_BCD_set__ZN4fltk9HelpBlock1wE(__C_data, x);
}
int get_w() {
return _BCD_get__ZN4fltk9HelpBlock1wE(__C_data);
}
void set_h(int x) {
_BCD_set__ZN4fltk9HelpBlock1hE(__C_data, x);
}
int get_h() {
return _BCD_get__ZN4fltk9HelpBlock1hE(__C_data);
}
}
class HelpBlock_R : HelpBlock {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk9HelpBlockE__HelpBlock_R(__C_data);
__C_data = null;
}
this() { super(cast(ireal) 0); }
}
