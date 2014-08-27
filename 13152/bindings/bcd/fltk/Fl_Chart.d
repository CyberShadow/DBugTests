/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_Chart;
public import bcd.bind;
const int FL_BAR_CHART = 0;
const int FL_HORBAR_CHART = 1;
const int FL_LINE_CHART = 2;
const int FL_FILL_CHART = 3;
const int FL_SPIKE_CHART = 4;
const int FL_PIE_CHART = 5;
const int FL_SPECIALPIE_CHART = 6;
const int FL_CHART_MAX = 128;
const int FL_CHART_LABEL_MAX = 18;
public import bcd.fltk.Fl_Widget;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_8Fl_Chart(void *);
extern (C) void *_BCD_new__ZN8Fl_ChartC1EiiiiPKc(int, int, int, int, char *);
extern (C) void _BCD__ZN8Fl_Chart5clearEv(void *This);
extern (C) void _BCD__ZN8Fl_Chart3addEdPKcj(void *This, double, char *, uint);
extern (C) void _BCD__ZN8Fl_Chart6insertEidPKcj(void *This, int, double, char *, uint);
extern (C) void _BCD__ZN8Fl_Chart7replaceEidPKcj(void *This, int, double, char *, uint);
extern (C) void _BCD__ZNK8Fl_Chart6boundsEPdS0_(void *This, double *, double *);
extern (C) void _BCD__ZN8Fl_Chart6boundsEdd(void *This, double, double);
extern (C) int _BCD__ZNK8Fl_Chart4sizeEv(void *This);
extern (C) void _BCD__ZN8Fl_Chart4sizeEii(void *This, int, int);
extern (C) int _BCD__ZNK8Fl_Chart7maxsizeEv(void *This);
extern (C) void _BCD__ZN8Fl_Chart7maxsizeEi(void *This, int);
extern (C) int _BCD__ZNK8Fl_Chart8textfontEv(void *This);
extern (C) void _BCD__ZN8Fl_Chart8textfontEh(void *This, char);
extern (C) char _BCD__ZNK8Fl_Chart8textsizeEv(void *This);
extern (C) void _BCD__ZN8Fl_Chart8textsizeEh(void *This, char);
extern (C) int _BCD__ZNK8Fl_Chart9textcolorEv(void *This);
extern (C) void _BCD__ZN8Fl_Chart9textcolorEj(void *This, uint);
extern (C) char _BCD__ZNK8Fl_Chart8autosizeEv(void *This);
extern (C) void _BCD__ZN8Fl_Chart8autosizeEh(void *This, char);
extern (C) void _BCD_RI_8Fl_Chart(void *cd, void *dd);
extern (C) void _BCD_delete_8Fl_Chart__Fl_Chart_R(void *This);
extern (C) void *_BCD_new__ZN8Fl_ChartC1EiiiiPKc_R(int, int, int, int, char *);
extern (C) void _BCD_delete_14FL_CHART_ENTRY(void *);
extern (C) void _BCD_set__ZN14FL_CHART_ENTRY3valE(void *, float);
extern (C) float _BCD_get__ZN14FL_CHART_ENTRY3valE(void *);
extern (C) void _BCD_set__ZN14FL_CHART_ENTRY3colE(void *, uint);
extern (C) uint _BCD_get__ZN14FL_CHART_ENTRY3colE(void *);
extern (C) void _BCD_RI_14FL_CHART_ENTRY(void *cd, void *dd);
extern (C) void _BCD_delete_14FL_CHART_ENTRY__FL_CHART_ENTRY_R(void *This);
alias void function(Fl_Widget *, int) _BCD_func__8;
alias void function(Fl_Widget *) _BCD_func__10;
alias void function(Fl_Widget *, void *) _BCD_func__14;
class Fl_Chart : Fl_Widget {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_8Fl_Chart(__C_data);
__C_data = null;
}
this(int _0, int _1, int _2, int _3, char * _4) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN8Fl_ChartC1EiiiiPKc(_0, _1, _2, _3, _4);
__C_data_owned = true;
}
void clear() {
_BCD__ZN8Fl_Chart5clearEv(__C_data);
}
void add(double _0, char * _1, uint _2) {
_BCD__ZN8Fl_Chart3addEdPKcj(__C_data, _0, _1, _2);
}
void insert(int _0, double _1, char * _2, uint _3) {
_BCD__ZN8Fl_Chart6insertEidPKcj(__C_data, _0, _1, _2, _3);
}
void replace(int _0, double _1, char * _2, uint _3) {
_BCD__ZN8Fl_Chart7replaceEidPKcj(__C_data, _0, _1, _2, _3);
}
void bounds(double * a, double * b) {
_BCD__ZNK8Fl_Chart6boundsEPdS0_(__C_data, a, b);
}
void bounds(double a, double b) {
_BCD__ZN8Fl_Chart6boundsEdd(__C_data, a, b);
}
int size() {
return _BCD__ZNK8Fl_Chart4sizeEv(__C_data);
}
void size(int W, int H) {
_BCD__ZN8Fl_Chart4sizeEii(__C_data, W, H);
}
int maxsize() {
return _BCD__ZNK8Fl_Chart7maxsizeEv(__C_data);
}
void maxsize(int _0) {
_BCD__ZN8Fl_Chart7maxsizeEi(__C_data, _0);
}
int textfont() {
return _BCD__ZNK8Fl_Chart8textfontEv(__C_data);
}
void textfont(char s) {
_BCD__ZN8Fl_Chart8textfontEh(__C_data, s);
}
char textsize() {
return _BCD__ZNK8Fl_Chart8textsizeEv(__C_data);
}
void textsize(char s) {
_BCD__ZN8Fl_Chart8textsizeEh(__C_data, s);
}
int textcolor() {
return _BCD__ZNK8Fl_Chart9textcolorEv(__C_data);
}
void textcolor(uint n) {
_BCD__ZN8Fl_Chart9textcolorEj(__C_data, n);
}
char autosize() {
return _BCD__ZNK8Fl_Chart8autosizeEv(__C_data);
}
void autosize(char n) {
_BCD__ZN8Fl_Chart8autosizeEh(__C_data, n);
}
}
class Fl_Chart_R : Fl_Chart {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_8Fl_Chart__Fl_Chart_R(__C_data);
__C_data = null;
}
this(int _0, int _1, int _2, int _3, char * _4) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN8Fl_ChartC1EiiiiPKc_R(_0, _1, _2, _3, _4);
__C_data_owned = true;
_BCD_RI_8Fl_Chart(__C_data, cast(void *) this);
}
}
class FL_CHART_ENTRY : bcd.bind.BoundClass {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_14FL_CHART_ENTRY(__C_data);
__C_data = null;
}
void set_val(float x) {
_BCD_set__ZN14FL_CHART_ENTRY3valE(__C_data, x);
}
float get_val() {
return _BCD_get__ZN14FL_CHART_ENTRY3valE(__C_data);
}
void set_col(uint x) {
_BCD_set__ZN14FL_CHART_ENTRY3colE(__C_data, x);
}
uint get_col() {
return _BCD_get__ZN14FL_CHART_ENTRY3colE(__C_data);
}
}
class FL_CHART_ENTRY_R : FL_CHART_ENTRY {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_14FL_CHART_ENTRY__FL_CHART_ENTRY_R(__C_data);
__C_data = null;
}
this() { super(cast(ireal) 0); }
}