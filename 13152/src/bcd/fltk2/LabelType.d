/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.LabelType;
align(4):
public import bcd.bind;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.Rectangle;
public import bcd.fltk2.Flags;
extern (C) void _BCD_delete_N4fltk13EngravedLabelE(void *);
extern (C) void _BCD__ZNK4fltk13EngravedLabel4drawEPKcRKNS_9RectangleEi(void *This, char *, void *, int);
extern (C) void *_BCD_new__ZN4fltk13EngravedLabelC1EPKcPA3_Ki(char *, int [3] *);
extern (C) void _BCD_RI_N4fltk13EngravedLabelE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk13EngravedLabelE__EngravedLabel_R(void *This);
extern (C) int _BCD_R__ZNK4fltk9LabelType4drawEPKcRKNS_9RectangleEi__EngravedLabel_R_CHECK(EngravedLabel_R x) {
union dp {
void delegate(char *, Rectangle, int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.draw;
return cast(int) (d.f != &EngravedLabel.draw);
}
extern (C) void _BCD_R__ZNK4fltk9LabelType4drawEPKcRKNS_9RectangleEi__EngravedLabel_R(EngravedLabel_R __D_class, char * _0, void *_1, int _2) {
__D_class.draw(_0, cast(Rectangle) new Rectangle(cast(ifloat) 0, _1), _2);
}
extern (C) void *_BCD_new__ZN4fltk13EngravedLabelC1EPKcPA3_Ki_R(char *, int [3] *);
extern (C) void _BCD_delete_N4fltk9LabelTypeE(void *);
extern (C) void _BCD_set__ZN4fltk9LabelType4nameE(void *, char *);
extern (C) char * _BCD_get__ZN4fltk9LabelType4nameE(void *);
extern (C) void _BCD_set__ZN4fltk9LabelType4nextE(void *, LabelType *);
extern (C) LabelType * _BCD_get__ZN4fltk9LabelType4nextE(void *);
extern (C) void _BCD_set__ZN4fltk9LabelType5firstE(void *, LabelType *);
extern (C) LabelType * _BCD_get__ZN4fltk9LabelType5firstE(void *);
extern (C) void _BCD__ZNK4fltk9LabelType4drawEPKcRKNS_9RectangleEi(void *This, char *, void *, int);
extern (C) void *_BCD_new__ZN4fltk9LabelTypeC1EPKc(char *);
extern (C) LabelType * _BCD__ZN4fltk9LabelType4findEPKc(char *);
extern (C) void _BCD_RI_N4fltk9LabelTypeE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk9LabelTypeE__LabelType_R(void *This);
extern (C) int _BCD_R__ZNK4fltk9LabelType4drawEPKcRKNS_9RectangleEi__LabelType_R_CHECK(LabelType_R x) {
union dp {
void delegate(char *, Rectangle, int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.draw;
return cast(int) (d.f != &LabelType.draw);
}
extern (C) void _BCD_R__ZNK4fltk9LabelType4drawEPKcRKNS_9RectangleEi__LabelType_R(LabelType_R __D_class, char * _0, void *_1, int _2) {
__D_class.draw(_0, cast(Rectangle) new Rectangle(cast(ifloat) 0, _1), _2);
}
extern (C) void *_BCD_new__ZN4fltk9LabelTypeC1EPKc_R(char *);
class EngravedLabel : LabelType {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk13EngravedLabelE(__C_data);
__C_data = null;
}
void draw(char * _0, Rectangle _1, int _2) {
_BCD__ZNK4fltk13EngravedLabel4drawEPKcRKNS_9RectangleEi(__C_data, _0, _1.__C_data, _2);
}
this(char * n, int [3] * p) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk13EngravedLabelC1EPKcPA3_Ki(n, p);
__C_data_owned = true;
}
}
class EngravedLabel_R : EngravedLabel {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk13EngravedLabelE__EngravedLabel_R(__C_data);
__C_data = null;
}
this(char * n, int [3] * p) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk13EngravedLabelC1EPKcPA3_Ki_R(n, p);
__C_data_owned = true;
_BCD_RI_N4fltk13EngravedLabelE(__C_data, cast(void *) this);
}
}
class LabelType : bcd.bind.BoundClass {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk9LabelTypeE(__C_data);
__C_data = null;
}
void set_name(char * x) {
_BCD_set__ZN4fltk9LabelType4nameE(__C_data, x);
}
char * get_name() {
return _BCD_get__ZN4fltk9LabelType4nameE(__C_data);
}
void set_next(LabelType * x) {
_BCD_set__ZN4fltk9LabelType4nextE(__C_data, x);
}
LabelType * get_next() {
return _BCD_get__ZN4fltk9LabelType4nextE(__C_data);
}
void set_first(LabelType * x) {
_BCD_set__ZN4fltk9LabelType5firstE(__C_data, x);
}
LabelType * get_first() {
return _BCD_get__ZN4fltk9LabelType5firstE(__C_data);
}
void draw(char * _0, Rectangle _1, int _2) {
_BCD__ZNK4fltk9LabelType4drawEPKcRKNS_9RectangleEi(__C_data, _0, _1.__C_data, _2);
}
this(char * n) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk9LabelTypeC1EPKc(n);
__C_data_owned = true;
}
static LabelType * find(char * name) {
return _BCD__ZN4fltk9LabelType4findEPKc(name);
}
}
class LabelType_R : LabelType {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk9LabelTypeE__LabelType_R(__C_data);
__C_data = null;
}
this(char * n) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk9LabelTypeC1EPKc_R(n);
__C_data_owned = true;
_BCD_RI_N4fltk9LabelTypeE(__C_data, cast(void *) this);
}
}