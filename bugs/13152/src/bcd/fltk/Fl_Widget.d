/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_Widget;
public import bcd.bind;
const int FL_RESERVED_TYPE = 100;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_8Fl_Label(void *);
extern (C) void _BCD_set__ZN8Fl_Label5valueE(void *, char *);
extern (C) char * _BCD_get__ZN8Fl_Label5valueE(void *);
extern (C) void _BCD_set__ZN8Fl_Label5imageE(void *, bcd.bind.BoundClass *);
extern (C) bcd.bind.BoundClass * _BCD_get__ZN8Fl_Label5imageE(void *);
extern (C) void _BCD_set__ZN8Fl_Label7deimageE(void *, bcd.bind.BoundClass *);
extern (C) bcd.bind.BoundClass * _BCD_get__ZN8Fl_Label7deimageE(void *);
extern (C) void _BCD_set__ZN8Fl_Label4typeE(void *, char);
extern (C) char _BCD_get__ZN8Fl_Label4typeE(void *);
extern (C) void _BCD_set__ZN8Fl_Label4fontE(void *, char);
extern (C) char _BCD_get__ZN8Fl_Label4fontE(void *);
extern (C) void _BCD_set__ZN8Fl_Label4sizeE(void *, char);
extern (C) char _BCD_get__ZN8Fl_Label4sizeE(void *);
extern (C) void _BCD_set__ZN8Fl_Label5colorE(void *, uint);
extern (C) uint _BCD_get__ZN8Fl_Label5colorE(void *);
extern (C) void _BCD__ZNK8Fl_Label4drawEiiii8Fl_Align(void *This, int, int, int, int, int);
extern (C) void _BCD__ZNK8Fl_Label7measureERiS0_(void *This, int *, int *);
extern (C) void _BCD_RI_8Fl_Label(void *cd, void *dd);
extern (C) void _BCD_delete_8Fl_Label__Fl_Label_R(void *This);
extern (C) void _BCD_delete_9Fl_Widget(void *);
extern (C) void _BCD__ZN9Fl_Widget4drawEv(void *This);
extern (C) int _BCD__ZN9Fl_Widget6handleEi(void *This, int);
extern (C) bcd.bind.BoundClass * _BCD__ZNK9Fl_Widget6parentEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget6parentEP8Fl_Group(void *This, void *);
extern (C) char _BCD__ZNK9Fl_Widget4typeEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget4typeEh(void *This, char);
extern (C) int _BCD__ZNK9Fl_Widget1xEv(void *This);
extern (C) int _BCD__ZNK9Fl_Widget1yEv(void *This);
extern (C) int _BCD__ZNK9Fl_Widget1wEv(void *This);
extern (C) int _BCD__ZNK9Fl_Widget1hEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget6resizeEiiii(void *This, int, int, int, int);
extern (C) int _BCD__ZN9Fl_Widget13damage_resizeEiiii(void *This, int, int, int, int);
extern (C) void _BCD__ZN9Fl_Widget8positionEii(void *This, int, int);
extern (C) void _BCD__ZN9Fl_Widget4sizeEii(void *This, int, int);
extern (C) int _BCD__ZNK9Fl_Widget5alignEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget5alignEh(void *This, char);
extern (C) int _BCD__ZNK9Fl_Widget3boxEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget3boxE10Fl_Boxtype(void *This, int);
extern (C) int _BCD__ZNK9Fl_Widget5colorEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget5colorEj(void *This, uint);
extern (C) int _BCD__ZNK9Fl_Widget15selection_colorEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget15selection_colorEj(void *This, uint);
extern (C) void _BCD__ZN9Fl_Widget5colorEjj(void *This, uint, uint);
extern (C) char * _BCD__ZNK9Fl_Widget5labelEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget5labelEPKc(void *This, char *);
extern (C) void _BCD__ZN9Fl_Widget10copy_labelEPKc(void *This, char *);
extern (C) void _BCD__ZN9Fl_Widget5labelE12Fl_LabeltypePKc(void *This, int, char *);
extern (C) int _BCD__ZNK9Fl_Widget9labeltypeEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget9labeltypeE12Fl_Labeltype(void *This, int);
extern (C) int _BCD__ZNK9Fl_Widget10labelcolorEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget10labelcolorEj(void *This, uint);
extern (C) int _BCD__ZNK9Fl_Widget9labelfontEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget9labelfontEh(void *This, char);
extern (C) char _BCD__ZNK9Fl_Widget9labelsizeEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget9labelsizeEh(void *This, char);
extern (C) bcd.bind.BoundClass * _BCD__ZN9Fl_Widget5imageEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget5imageEP8Fl_Image(void *This, void *);
extern (C) bcd.bind.BoundClass * _BCD__ZN9Fl_Widget7deimageEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget7deimageEP8Fl_Image(void *This, void *);
extern (C) char * _BCD__ZNK9Fl_Widget7tooltipEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget7tooltipEPKc(void *This, char *);
alias void function(Fl_Widget *, void *) _BCD_func__11;
alias _BCD_func__11 Fl_Callback;
alias _BCD_func__11 Fl_Callback_p;
extern (C) _BCD_func__11 _BCD__ZNK9Fl_Widget8callbackEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget8callbackEPFvPS_PvES1_(void *This, _BCD_func__11, void *);
extern (C) void _BCD__ZN9Fl_Widget8callbackEPFvPS_PvE(void *This, _BCD_func__11);
alias void function(Fl_Widget *) _BCD_func__7;
alias _BCD_func__7 Fl_Callback0;
extern (C) void _BCD__ZN9Fl_Widget8callbackEPFvPS_E(void *This, _BCD_func__7);
alias void function(Fl_Widget *, int) _BCD_func__5;
alias _BCD_func__5 Fl_Callback1;
extern (C) void _BCD__ZN9Fl_Widget8callbackEPFvPS_lEl(void *This, _BCD_func__5, int);
extern (C) void * _BCD__ZNK9Fl_Widget9user_dataEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget9user_dataEPv(void *This, void *);
extern (C) int _BCD__ZNK9Fl_Widget8argumentEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget8argumentEl(void *This, int);
extern (C) int _BCD__ZNK9Fl_Widget4whenEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget4whenEh(void *This, char);
extern (C) int _BCD__ZNK9Fl_Widget7visibleEv(void *This);
extern (C) int _BCD__ZNK9Fl_Widget9visible_rEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget4showEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget4hideEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget11set_visibleEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget13clear_visibleEv(void *This);
extern (C) int _BCD__ZNK9Fl_Widget6activeEv(void *This);
extern (C) int _BCD__ZNK9Fl_Widget8active_rEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget8activateEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget10deactivateEv(void *This);
extern (C) int _BCD__ZNK9Fl_Widget6outputEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget10set_outputEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget12clear_outputEv(void *This);
extern (C) int _BCD__ZNK9Fl_Widget11takeseventsEv(void *This);
extern (C) int _BCD__ZNK9Fl_Widget7changedEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget11set_changedEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget13clear_changedEv(void *This);
extern (C) int _BCD__ZN9Fl_Widget10take_focusEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget17set_visible_focusEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget19clear_visible_focusEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget13visible_focusEi(void *This, int);
extern (C) int _BCD__ZN9Fl_Widget13visible_focusEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget16default_callbackEPS_Pv(void *, void *);
extern (C) void _BCD__ZN9Fl_Widget11do_callbackEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget11do_callbackEPS_Pv(void *This, void *, void *);
extern (C) void _BCD__ZN9Fl_Widget11do_callbackEPS_l(void *This, void *, int);
extern (C) int _BCD__ZN9Fl_Widget13test_shortcutEv(void *This);
extern (C) int _BCD__ZN9Fl_Widget13test_shortcutEPKc(char *);
extern (C) int _BCD__ZNK9Fl_Widget8containsEPKS_(void *This, void *);
extern (C) int _BCD__ZNK9Fl_Widget6insideEPKS_(void *This, void *);
extern (C) void _BCD__ZN9Fl_Widget6redrawEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget12redraw_labelEv(void *This);
extern (C) char _BCD__ZNK9Fl_Widget6damageEv(void *This);
extern (C) void _BCD__ZN9Fl_Widget12clear_damageEh(void *This, char);
extern (C) void _BCD__ZN9Fl_Widget6damageEh(void *This, char);
extern (C) void _BCD__ZN9Fl_Widget6damageEhiiii(void *This, char, int, int, int, int);
extern (C) void _BCD__ZNK9Fl_Widget10draw_labelEiiii8Fl_Align(void *This, int, int, int, int, int);
extern (C) void _BCD__ZN9Fl_Widget13measure_labelERiS0_(void *This, int *, int *);
extern (C) bcd.bind.BoundClass * _BCD__ZNK9Fl_Widget6windowEv(void *This);
extern (C) int _BCD__ZNK9Fl_Widget6color2Ev(void *This);
extern (C) void _BCD__ZN9Fl_Widget6color2Ej(void *This, uint);
class Fl_Label : bcd.bind.BoundClass {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_8Fl_Label(__C_data);
__C_data = null;
}
void set_value(char * x) {
_BCD_set__ZN8Fl_Label5valueE(__C_data, x);
}
char * get_value() {
return _BCD_get__ZN8Fl_Label5valueE(__C_data);
}
void set_image(bcd.bind.BoundClass * x) {
_BCD_set__ZN8Fl_Label5imageE(__C_data, x);
}
bcd.bind.BoundClass * get_image() {
return _BCD_get__ZN8Fl_Label5imageE(__C_data);
}
void set_deimage(bcd.bind.BoundClass * x) {
_BCD_set__ZN8Fl_Label7deimageE(__C_data, x);
}
bcd.bind.BoundClass * get_deimage() {
return _BCD_get__ZN8Fl_Label7deimageE(__C_data);
}
void set_type(char x) {
_BCD_set__ZN8Fl_Label4typeE(__C_data, x);
}
char get_type() {
return _BCD_get__ZN8Fl_Label4typeE(__C_data);
}
void set_font(char x) {
_BCD_set__ZN8Fl_Label4fontE(__C_data, x);
}
char get_font() {
return _BCD_get__ZN8Fl_Label4fontE(__C_data);
}
void set_size(char x) {
_BCD_set__ZN8Fl_Label4sizeE(__C_data, x);
}
char get_size() {
return _BCD_get__ZN8Fl_Label4sizeE(__C_data);
}
void set_color(uint x) {
_BCD_set__ZN8Fl_Label5colorE(__C_data, x);
}
uint get_color() {
return _BCD_get__ZN8Fl_Label5colorE(__C_data);
}
void draw(int _0, int _1, int _2, int _3, int _4) {
_BCD__ZNK8Fl_Label4drawEiiii8Fl_Align(__C_data, _0, _1, _2, _3, _4);
}
void measure(int * _0, int * _1) {
_BCD__ZNK8Fl_Label7measureERiS0_(__C_data, _0, _1);
}
}
class Fl_Label_R : Fl_Label {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_8Fl_Label__Fl_Label_R(__C_data);
__C_data = null;
}
this() { super(cast(ireal) 0); }
}
class Fl_Widget : bcd.bind.BoundClass {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_9Fl_Widget(__C_data);
__C_data = null;
}
void draw() {
_BCD__ZN9Fl_Widget4drawEv(__C_data);
}
int handle(int _0) {
return _BCD__ZN9Fl_Widget6handleEi(__C_data, _0);
}
bcd.bind.BoundClass * parent() {
return _BCD__ZNK9Fl_Widget6parentEv(__C_data);
}
void parent(bcd.bind.BoundClass * p) {
_BCD__ZN9Fl_Widget6parentEP8Fl_Group(__C_data, p.__C_data);
}
char type() {
return _BCD__ZNK9Fl_Widget4typeEv(__C_data);
}
void type(char t) {
_BCD__ZN9Fl_Widget4typeEh(__C_data, t);
}
int x() {
return _BCD__ZNK9Fl_Widget1xEv(__C_data);
}
int y() {
return _BCD__ZNK9Fl_Widget1yEv(__C_data);
}
int w() {
return _BCD__ZNK9Fl_Widget1wEv(__C_data);
}
int h() {
return _BCD__ZNK9Fl_Widget1hEv(__C_data);
}
void resize(int _0, int _1, int _2, int _3) {
_BCD__ZN9Fl_Widget6resizeEiiii(__C_data, _0, _1, _2, _3);
}
int damage_resize(int _0, int _1, int _2, int _3) {
return _BCD__ZN9Fl_Widget13damage_resizeEiiii(__C_data, _0, _1, _2, _3);
}
void position(int X, int Y) {
_BCD__ZN9Fl_Widget8positionEii(__C_data, X, Y);
}
void size(int W, int H) {
_BCD__ZN9Fl_Widget4sizeEii(__C_data, W, H);
}
int align_() {
return _BCD__ZNK9Fl_Widget5alignEv(__C_data);
}
void align_(char a) {
_BCD__ZN9Fl_Widget5alignEh(__C_data, a);
}
int box() {
return _BCD__ZNK9Fl_Widget3boxEv(__C_data);
}
void box(int a) {
_BCD__ZN9Fl_Widget3boxE10Fl_Boxtype(__C_data, a);
}
int color() {
return _BCD__ZNK9Fl_Widget5colorEv(__C_data);
}
void color(uint a) {
_BCD__ZN9Fl_Widget5colorEj(__C_data, a);
}
int selection_color() {
return _BCD__ZNK9Fl_Widget15selection_colorEv(__C_data);
}
void selection_color(uint a) {
_BCD__ZN9Fl_Widget15selection_colorEj(__C_data, a);
}
void color(uint a, uint b) {
_BCD__ZN9Fl_Widget5colorEjj(__C_data, a, b);
}
char * label() {
return _BCD__ZNK9Fl_Widget5labelEv(__C_data);
}
void label(char * a) {
_BCD__ZN9Fl_Widget5labelEPKc(__C_data, a);
}
void copy_label(char * a) {
_BCD__ZN9Fl_Widget10copy_labelEPKc(__C_data, a);
}
void label(int a, char * b) {
_BCD__ZN9Fl_Widget5labelE12Fl_LabeltypePKc(__C_data, a, b);
}
int labeltype() {
return _BCD__ZNK9Fl_Widget9labeltypeEv(__C_data);
}
void labeltype(int a) {
_BCD__ZN9Fl_Widget9labeltypeE12Fl_Labeltype(__C_data, a);
}
int labelcolor() {
return _BCD__ZNK9Fl_Widget10labelcolorEv(__C_data);
}
void labelcolor(uint a) {
_BCD__ZN9Fl_Widget10labelcolorEj(__C_data, a);
}
int labelfont() {
return _BCD__ZNK9Fl_Widget9labelfontEv(__C_data);
}
void labelfont(char a) {
_BCD__ZN9Fl_Widget9labelfontEh(__C_data, a);
}
char labelsize() {
return _BCD__ZNK9Fl_Widget9labelsizeEv(__C_data);
}
void labelsize(char a) {
_BCD__ZN9Fl_Widget9labelsizeEh(__C_data, a);
}
bcd.bind.BoundClass * image() {
return _BCD__ZN9Fl_Widget5imageEv(__C_data);
}
void image(bcd.bind.BoundClass * a) {
_BCD__ZN9Fl_Widget5imageEP8Fl_Image(__C_data, a.__C_data);
}
bcd.bind.BoundClass * deimage() {
return _BCD__ZN9Fl_Widget7deimageEv(__C_data);
}
void deimage(bcd.bind.BoundClass * a) {
_BCD__ZN9Fl_Widget7deimageEP8Fl_Image(__C_data, a.__C_data);
}
char * tooltip() {
return _BCD__ZNK9Fl_Widget7tooltipEv(__C_data);
}
void tooltip(char * t) {
_BCD__ZN9Fl_Widget7tooltipEPKc(__C_data, t);
}
_BCD_func__11 callback() {
return _BCD__ZNK9Fl_Widget8callbackEv(__C_data);
}
void callback(_BCD_func__11 c, void * p) {
_BCD__ZN9Fl_Widget8callbackEPFvPS_PvES1_(__C_data, c, p);
}
void callback(_BCD_func__11 c) {
_BCD__ZN9Fl_Widget8callbackEPFvPS_PvE(__C_data, c);
}
void callback(_BCD_func__7 c) {
_BCD__ZN9Fl_Widget8callbackEPFvPS_E(__C_data, c);
}
void callback(_BCD_func__5 c, int p) {
_BCD__ZN9Fl_Widget8callbackEPFvPS_lEl(__C_data, c, p);
}
void * user_data() {
return _BCD__ZNK9Fl_Widget9user_dataEv(__C_data);
}
void user_data(void * v) {
_BCD__ZN9Fl_Widget9user_dataEPv(__C_data, v);
}
int argument() {
return _BCD__ZNK9Fl_Widget8argumentEv(__C_data);
}
void argument(int v) {
_BCD__ZN9Fl_Widget8argumentEl(__C_data, v);
}
int when() {
return _BCD__ZNK9Fl_Widget4whenEv(__C_data);
}
void when(char i) {
_BCD__ZN9Fl_Widget4whenEh(__C_data, i);
}
int visible() {
return _BCD__ZNK9Fl_Widget7visibleEv(__C_data);
}
int visible_r() {
return _BCD__ZNK9Fl_Widget9visible_rEv(__C_data);
}
void show() {
_BCD__ZN9Fl_Widget4showEv(__C_data);
}
void hide() {
_BCD__ZN9Fl_Widget4hideEv(__C_data);
}
void set_visible() {
_BCD__ZN9Fl_Widget11set_visibleEv(__C_data);
}
void clear_visible() {
_BCD__ZN9Fl_Widget13clear_visibleEv(__C_data);
}
int active() {
return _BCD__ZNK9Fl_Widget6activeEv(__C_data);
}
int active_r() {
return _BCD__ZNK9Fl_Widget8active_rEv(__C_data);
}
void activate() {
_BCD__ZN9Fl_Widget8activateEv(__C_data);
}
void deactivate() {
_BCD__ZN9Fl_Widget10deactivateEv(__C_data);
}
int output() {
return _BCD__ZNK9Fl_Widget6outputEv(__C_data);
}
void set_output() {
_BCD__ZN9Fl_Widget10set_outputEv(__C_data);
}
void clear_output() {
_BCD__ZN9Fl_Widget12clear_outputEv(__C_data);
}
int takesevents() {
return _BCD__ZNK9Fl_Widget11takeseventsEv(__C_data);
}
int changed() {
return _BCD__ZNK9Fl_Widget7changedEv(__C_data);
}
void set_changed() {
_BCD__ZN9Fl_Widget11set_changedEv(__C_data);
}
void clear_changed() {
_BCD__ZN9Fl_Widget13clear_changedEv(__C_data);
}
int take_focus() {
return _BCD__ZN9Fl_Widget10take_focusEv(__C_data);
}
void set_visible_focus() {
_BCD__ZN9Fl_Widget17set_visible_focusEv(__C_data);
}
void clear_visible_focus() {
_BCD__ZN9Fl_Widget19clear_visible_focusEv(__C_data);
}
void visible_focus(int v) {
_BCD__ZN9Fl_Widget13visible_focusEi(__C_data, v);
}
int visible_focus() {
return _BCD__ZN9Fl_Widget13visible_focusEv(__C_data);
}
static void default_callback(Fl_Widget * _0, void * _1) {
_BCD__ZN9Fl_Widget16default_callbackEPS_Pv(_0.__C_data, _1);
}
void do_callback() {
_BCD__ZN9Fl_Widget11do_callbackEv(__C_data);
}
void do_callback(Fl_Widget * o, void * arg) {
_BCD__ZN9Fl_Widget11do_callbackEPS_Pv(__C_data, o.__C_data, arg);
}
void do_callback(Fl_Widget * o, int arg) {
_BCD__ZN9Fl_Widget11do_callbackEPS_l(__C_data, o.__C_data, arg);
}
int test_shortcut() {
return _BCD__ZN9Fl_Widget13test_shortcutEv(__C_data);
}
static int test_shortcut(char * _0) {
return _BCD__ZN9Fl_Widget13test_shortcutEPKc(_0);
}
int contains(Fl_Widget * _0) {
return _BCD__ZNK9Fl_Widget8containsEPKS_(__C_data, _0.__C_data);
}
int inside(Fl_Widget * o) {
return _BCD__ZNK9Fl_Widget6insideEPKS_(__C_data, o.__C_data);
}
void redraw() {
_BCD__ZN9Fl_Widget6redrawEv(__C_data);
}
void redraw_label() {
_BCD__ZN9Fl_Widget12redraw_labelEv(__C_data);
}
char damage() {
return _BCD__ZNK9Fl_Widget6damageEv(__C_data);
}
void clear_damage(char c) {
_BCD__ZN9Fl_Widget12clear_damageEh(__C_data, c);
}
void damage(char c) {
_BCD__ZN9Fl_Widget6damageEh(__C_data, c);
}
void damage(char c, int _1, int _2, int _3, int _4) {
_BCD__ZN9Fl_Widget6damageEhiiii(__C_data, c, _1, _2, _3, _4);
}
void draw_label(int _0, int _1, int _2, int _3, int _4) {
_BCD__ZNK9Fl_Widget10draw_labelEiiii8Fl_Align(__C_data, _0, _1, _2, _3, _4);
}
void measure_label(int * xx, int * yy) {
_BCD__ZN9Fl_Widget13measure_labelERiS0_(__C_data, xx, yy);
}
bcd.bind.BoundClass * window() {
return _BCD__ZNK9Fl_Widget6windowEv(__C_data);
}
int color2() {
return _BCD__ZNK9Fl_Widget6color2Ev(__C_data);
}
void color2(uint a) {
_BCD__ZN9Fl_Widget6color2Ej(__C_data, a);
}
}