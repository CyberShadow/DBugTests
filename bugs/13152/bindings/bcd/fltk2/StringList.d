/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.StringList;
align(4):
public import bcd.bind;
public import bcd.fltk2.Menu;
public import bcd.fltk2.Group;
public import bcd.fltk2.Widget;
public import bcd.fltk2.Style;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.Rectangle;
public import bcd.fltk2.Color;
public import bcd.fltk2.Flags;
extern (C) void _BCD_delete_N4fltk11StringArrayE(void *);
extern (C) int _BCD__ZN4fltk11StringArray8childrenEPKNS_4MenuE(void *This, void *);
extern (C) char * _BCD__ZN4fltk11StringArray5labelEPKNS_4MenuEi(void *This, void *, int);
extern (C) void *_BCD_new__ZN4fltk11StringArrayC1EPKPKci(char * *, int);
extern (C) void *_BCD_new__ZN4fltk11StringArrayC1EPKPKc(char * *);
extern (C) void *_BCD_new__ZN4fltk11StringArrayC1EPKc(char *);
extern (C) void *_BCD_new__ZN4fltk11StringArrayC1Ev();
extern (C) void _BCD__ZN4fltk11StringArray3setEPKPKci(void *This, char * *, int);
extern (C) void _BCD__ZN4fltk11StringArray3setEPKPKc(void *This, char * *);
extern (C) void _BCD__ZN4fltk11StringArray3setEPKc(void *This, char *);
extern (C) void _BCD_RI_N4fltk11StringArrayE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk11StringArrayE__StringArray_R(void *This);
extern (C) int _BCD_R__ZN4fltk15StringHierarchy5childEPKNS_4MenuEPKii__StringArray_R_CHECK(StringArray_R x) {
union dp {
Widget * delegate(Menu *, int *, int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.child;
return cast(int) (d.f != &StringArray.child);
}
extern (C) Widget * _BCD_R__ZN4fltk15StringHierarchy5childEPKNS_4MenuEPKii__StringArray_R(StringArray_R __D_class, void *_0, int * indexes, int level) {
return __D_class.child(cast(Menu *) new Menu(cast(ifloat) 0, _0), indexes, level);
}
extern (C) int _BCD_R__ZN4fltk15StringHierarchy8childrenEPKNS_4MenuEPKii__StringArray_R_CHECK(StringArray_R x) {
    return 0;
}
extern (C) int _BCD_R__ZN4fltk15StringHierarchy8childrenEPKNS_4MenuEPKii__StringArray_R(StringArray_R __D_class, void *_0, int * indexes, int level) {
    return 0;
}
extern (C) int _BCD_R__ZN4fltk15StringHierarchy5labelEPKNS_4MenuEPKii__StringArray_R_CHECK(StringArray_R x) {
    return 0;
}
extern (C) char * _BCD_R__ZN4fltk15StringHierarchy5labelEPKNS_4MenuEPKii__StringArray_R(StringArray_R __D_class, void *_0, int * indexes, int level) {
    return null;
}
extern (C) int _BCD_R__ZN4fltk10StringList8childrenEPKNS_4MenuE__StringArray_R_CHECK(StringArray_R x) {
union dp {
int delegate(Menu *) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.children;
return cast(int) (d.f != &StringArray.children);
}
extern (C) int _BCD_R__ZN4fltk10StringList8childrenEPKNS_4MenuE__StringArray_R(StringArray_R __D_class, void *_0) {
return __D_class.children(cast(Menu *) new Menu(cast(ifloat) 0, _0));
}
extern (C) int _BCD_R__ZN4fltk10StringList5labelEPKNS_4MenuEi__StringArray_R_CHECK(StringArray_R x) {
union dp {
char * delegate(Menu *, int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.label;
return cast(int) (d.f != &StringArray.label);
}
extern (C) char * _BCD_R__ZN4fltk10StringList5labelEPKNS_4MenuEi__StringArray_R(StringArray_R __D_class, void *_0, int index) {
return __D_class.label(cast(Menu *) new Menu(cast(ifloat) 0, _0), index);
}
extern (C) void *_BCD_new__ZN4fltk11StringArrayC1EPKPKci_R(char * *, int);
extern (C) void *_BCD_new__ZN4fltk11StringArrayC1EPKPKc_R(char * *);
extern (C) void *_BCD_new__ZN4fltk11StringArrayC1EPKc_R(char *);
extern (C) void *_BCD_new__ZN4fltk11StringArrayC1Ev_R();
extern (C) void _BCD_delete_N4fltk10StringListE(void *);
extern (C) int _BCD__ZN4fltk10StringList8childrenEPKNS_4MenuEPKii(void *This, void *, int *, int);
extern (C) char * _BCD__ZN4fltk10StringList5labelEPKNS_4MenuEPKii(void *This, void *, int *, int);
extern (C) int _BCD__ZN4fltk10StringList8childrenEPKNS_4MenuE(void *This, void *);
extern (C) char * _BCD__ZN4fltk10StringList5labelEPKNS_4MenuEi(void *This, void *, int);
extern (C) void _BCD_delete_N4fltk15StringHierarchyE(void *);
extern (C) Widget * _BCD__ZN4fltk15StringHierarchy5childEPKNS_4MenuEPKii(void *This, void *, int *, int);
extern (C) int _BCD__ZN4fltk15StringHierarchy8childrenEPKNS_4MenuEPKii(void *This, void *, int *, int);
extern (C) char * _BCD__ZN4fltk15StringHierarchy5labelEPKNS_4MenuEPKii(void *This, void *, int *, int);
extern (C) Widget * _BCD__ZN4fltk15StringHierarchy14generated_itemEv(void *This);
alias void function(Widget *, int) _BCD_func__165;
alias void function(Widget *) _BCD_func__167;
alias void function(Widget *, void *) _BCD_func__171;
alias bool function() _BCD_func__401;
class StringArray : StringList {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk11StringArrayE(__C_data);
__C_data = null;
}
int children(Menu * _0) {
return _BCD__ZN4fltk11StringArray8childrenEPKNS_4MenuE(__C_data, _0.__C_data);
}
char * label(Menu * _0, int index) {
return _BCD__ZN4fltk11StringArray5labelEPKNS_4MenuEi(__C_data, _0.__C_data, index);
}
this(char * * a, int n) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk11StringArrayC1EPKPKci(a, n);
__C_data_owned = true;
}
this(char * * a) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk11StringArrayC1EPKPKc(a);
__C_data_owned = true;
}
this(char * s) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk11StringArrayC1EPKc(s);
__C_data_owned = true;
}
this() {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk11StringArrayC1Ev();
__C_data_owned = true;
}
void set(char * * a, int n) {
_BCD__ZN4fltk11StringArray3setEPKPKci(__C_data, a, n);
}
void set(char * * a) {
_BCD__ZN4fltk11StringArray3setEPKPKc(__C_data, a);
}
void set(char * s) {
_BCD__ZN4fltk11StringArray3setEPKc(__C_data, s);
}
}
class StringArray_R : StringArray {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk11StringArrayE__StringArray_R(__C_data);
__C_data = null;
}
this(char * * a, int n) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk11StringArrayC1EPKPKci_R(a, n);
__C_data_owned = true;
_BCD_RI_N4fltk11StringArrayE(__C_data, cast(void *) this);
}
this(char * * a) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk11StringArrayC1EPKPKc_R(a);
__C_data_owned = true;
_BCD_RI_N4fltk11StringArrayE(__C_data, cast(void *) this);
}
this(char * s) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk11StringArrayC1EPKc_R(s);
__C_data_owned = true;
_BCD_RI_N4fltk11StringArrayE(__C_data, cast(void *) this);
}
this() {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk11StringArrayC1Ev_R();
__C_data_owned = true;
_BCD_RI_N4fltk11StringArrayE(__C_data, cast(void *) this);
}
}
class StringList : StringHierarchy {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk10StringListE(__C_data);
__C_data = null;
}
int children(Menu * _0, int * indexes, int level) {
return _BCD__ZN4fltk10StringList8childrenEPKNS_4MenuEPKii(__C_data, _0.__C_data, indexes, level);
}
char * label(Menu * _0, int * indexes, int level) {
return _BCD__ZN4fltk10StringList5labelEPKNS_4MenuEPKii(__C_data, _0.__C_data, indexes, level);
}
int children(Menu * _0) {
return _BCD__ZN4fltk10StringList8childrenEPKNS_4MenuE(__C_data, _0.__C_data);
}
char * label(Menu * _0, int index) {
return _BCD__ZN4fltk10StringList5labelEPKNS_4MenuEi(__C_data, _0.__C_data, index);
}
}
class StringHierarchy : List {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk15StringHierarchyE(__C_data);
__C_data = null;
}
Widget * child(Menu * _0, int * indexes, int level) {
return _BCD__ZN4fltk15StringHierarchy5childEPKNS_4MenuEPKii(__C_data, _0.__C_data, indexes, level);
}
int children(Menu * _0, int * indexes, int level) {
return _BCD__ZN4fltk15StringHierarchy8childrenEPKNS_4MenuEPKii(__C_data, _0.__C_data, indexes, level);
}
char * label(Menu * _0, int * indexes, int level) {
return _BCD__ZN4fltk15StringHierarchy5labelEPKNS_4MenuEPKii(__C_data, _0.__C_data, indexes, level);
}
Widget * generated_item() {
return _BCD__ZN4fltk15StringHierarchy14generated_itemEv(__C_data);
}
}
