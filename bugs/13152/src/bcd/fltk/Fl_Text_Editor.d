/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_Text_Editor;
public import bcd.bind;
public import bcd.fltk.Fl_Text_Display;
public import bcd.fltk.Fl_Text_Buffer;
public import bcd.fltk.Fl_Scrollbar;
public import bcd.fltk.Fl_Slider;
public import bcd.fltk.Fl_Valuator;
public import bcd.fltk.Fl_Group;
public import bcd.fltk.Fl_Widget;
public import bcd.fltk.fl_draw;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_N14Fl_Text_Editor11Key_BindingE(void *);
extern (C) void _BCD_set__ZN14Fl_Text_Editor11Key_Binding3keyE(void *, int);
extern (C) int _BCD_get__ZN14Fl_Text_Editor11Key_Binding3keyE(void *);
extern (C) void _BCD_set__ZN14Fl_Text_Editor11Key_Binding5stateE(void *, int);
extern (C) int _BCD_get__ZN14Fl_Text_Editor11Key_Binding5stateE(void *);
alias int function(int, Fl_Text_Editor *) _BCD_func__911;
extern (C) void _BCD_set__ZN14Fl_Text_Editor11Key_Binding8functionE(void *, _BCD_func__911);
extern (C) _BCD_func__911 _BCD_get__ZN14Fl_Text_Editor11Key_Binding8functionE(void *);
extern (C) void _BCD_set__ZN14Fl_Text_Editor11Key_Binding4nextE(void *, Key_Binding *);
extern (C) Key_Binding * _BCD_get__ZN14Fl_Text_Editor11Key_Binding4nextE(void *);
extern (C) void _BCD_RI_N14Fl_Text_Editor11Key_BindingE(void *cd, void *dd);
extern (C) void _BCD_delete_N14Fl_Text_Editor11Key_BindingE__Key_Binding_R(void *This);
extern (C) void _BCD_delete_14Fl_Text_Editor(void *);
extern (C) void *_BCD_new__ZN14Fl_Text_EditorC1EiiiiPKc(int, int, int, int, char *);
extern (C) int _BCD__ZN14Fl_Text_Editor6handleEi(void *This, int);
extern (C) void _BCD__ZN14Fl_Text_Editor11insert_modeEi(void *This, int);
extern (C) int _BCD__ZN14Fl_Text_Editor11insert_modeEv(void *This);
extern (C) void _BCD__ZN14Fl_Text_Editor15add_key_bindingEiiPFiiPS_EPPNS_11Key_BindingE(void *This, int, int, _BCD_func__911, Key_Binding * *);
extern (C) void _BCD__ZN14Fl_Text_Editor15add_key_bindingEiiPFiiPS_E(void *This, int, int, _BCD_func__911);
extern (C) void _BCD__ZN14Fl_Text_Editor18remove_key_bindingEiiPPNS_11Key_BindingE(void *This, int, int, Key_Binding * *);
extern (C) void _BCD__ZN14Fl_Text_Editor18remove_key_bindingEii(void *This, int, int);
extern (C) void _BCD__ZN14Fl_Text_Editor23remove_all_key_bindingsEPPNS_11Key_BindingE(void *This, Key_Binding * *);
extern (C) void _BCD__ZN14Fl_Text_Editor23remove_all_key_bindingsEv(void *This);
extern (C) void _BCD__ZN14Fl_Text_Editor24add_default_key_bindingsEPPNS_11Key_BindingE(void *This, Key_Binding * *);
extern (C) _BCD_func__911 _BCD__ZN14Fl_Text_Editor18bound_key_functionEiiPNS_11Key_BindingE(void *This, int, int, void *);
extern (C) _BCD_func__911 _BCD__ZN14Fl_Text_Editor18bound_key_functionEii(void *This, int, int);
extern (C) void _BCD__ZN14Fl_Text_Editor20default_key_functionEPFiiPS_E(void *This, _BCD_func__911);
extern (C) int _BCD__ZN14Fl_Text_Editor10kf_defaultEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor9kf_ignoreEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor12kf_backspaceEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor8kf_enterEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor7kf_moveEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor13kf_shift_moveEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor12kf_ctrl_moveEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor11kf_c_s_moveEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor7kf_homeEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor6kf_endEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor7kf_leftEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor5kf_upEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor8kf_rightEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor7kf_downEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor10kf_page_upEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor12kf_page_downEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor9kf_insertEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor9kf_deleteEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor7kf_copyEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor6kf_cutEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor8kf_pasteEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor13kf_select_allEiPS_(int, void *);
extern (C) int _BCD__ZN14Fl_Text_Editor7kf_undoEiPS_(int, void *);
extern (C) void _BCD_RI_14Fl_Text_Editor(void *cd, void *dd);
extern (C) void _BCD_delete_14Fl_Text_Editor__Fl_Text_Editor_R(void *This);
extern (C) void *_BCD_new__ZN14Fl_Text_EditorC1EiiiiPKc_R(int, int, int, int, char *);
extern (C) int _BCD_R__ZN14Fl_Text_Editor6handleEi__Fl_Text_Editor_R_CHECK(Fl_Text_Editor_R x) {
union dp {
int delegate(int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.handle;
return cast(int) (d.f != &Fl_Text_Editor.handle);
}
extern (C) int _BCD_R__ZN14Fl_Text_Editor6handleEi__Fl_Text_Editor_R(Fl_Text_Editor_R __D_class, int e) {
return __D_class.handle(e);
}
alias void function(int, int, void *) _BCD_func__492;
alias void function(int, int, int, int, char *, void *) _BCD_func__493;
alias void function(Fl_Widget *, int) _BCD_func__24;
alias void function(Fl_Widget *) _BCD_func__26;
alias void function(Fl_Widget *, void *) _BCD_func__30;
alias void function(void *, int, int, int, char *) _BCD_func__892;
alias _BCD_func__911 Key_Func;
alias void function(int, void *) _BCD_func__924;
class Key_Binding : bcd.bind.BoundClass {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N14Fl_Text_Editor11Key_BindingE(__C_data);
__C_data = null;
}
void set_key(int x) {
_BCD_set__ZN14Fl_Text_Editor11Key_Binding3keyE(__C_data, x);
}
int get_key() {
return _BCD_get__ZN14Fl_Text_Editor11Key_Binding3keyE(__C_data);
}
void set_state(int x) {
_BCD_set__ZN14Fl_Text_Editor11Key_Binding5stateE(__C_data, x);
}
int get_state() {
return _BCD_get__ZN14Fl_Text_Editor11Key_Binding5stateE(__C_data);
}
void set_function_(_BCD_func__911 x) {
_BCD_set__ZN14Fl_Text_Editor11Key_Binding8functionE(__C_data, x);
}
_BCD_func__911 get_function_() {
return _BCD_get__ZN14Fl_Text_Editor11Key_Binding8functionE(__C_data);
}
void set_next(Key_Binding * x) {
_BCD_set__ZN14Fl_Text_Editor11Key_Binding4nextE(__C_data, x);
}
Key_Binding * get_next() {
return _BCD_get__ZN14Fl_Text_Editor11Key_Binding4nextE(__C_data);
}
}
class Key_Binding_R : Key_Binding {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N14Fl_Text_Editor11Key_BindingE__Key_Binding_R(__C_data);
__C_data = null;
}
this() { super(cast(ireal) 0); }
}
class Fl_Text_Editor : Fl_Text_Display {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_14Fl_Text_Editor(__C_data);
__C_data = null;
}
this(int X, int Y, int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN14Fl_Text_EditorC1EiiiiPKc(X, Y, W, H, l);
__C_data_owned = true;
}
int handle(int e) {
return _BCD__ZN14Fl_Text_Editor6handleEi(__C_data, e);
}
void insert_mode(int b) {
_BCD__ZN14Fl_Text_Editor11insert_modeEi(__C_data, b);
}
int insert_mode() {
return _BCD__ZN14Fl_Text_Editor11insert_modeEv(__C_data);
}
void add_key_binding(int key, int state, _BCD_func__911 f, Key_Binding * * list) {
_BCD__ZN14Fl_Text_Editor15add_key_bindingEiiPFiiPS_EPPNS_11Key_BindingE(__C_data, key, state, f, list);
}
void add_key_binding(int key, int state, _BCD_func__911 f) {
_BCD__ZN14Fl_Text_Editor15add_key_bindingEiiPFiiPS_E(__C_data, key, state, f);
}
void remove_key_binding(int key, int state, Key_Binding * * list) {
_BCD__ZN14Fl_Text_Editor18remove_key_bindingEiiPPNS_11Key_BindingE(__C_data, key, state, list);
}
void remove_key_binding(int key, int state) {
_BCD__ZN14Fl_Text_Editor18remove_key_bindingEii(__C_data, key, state);
}
void remove_all_key_bindings(Key_Binding * * list) {
_BCD__ZN14Fl_Text_Editor23remove_all_key_bindingsEPPNS_11Key_BindingE(__C_data, list);
}
void remove_all_key_bindings() {
_BCD__ZN14Fl_Text_Editor23remove_all_key_bindingsEv(__C_data);
}
void add_default_key_bindings(Key_Binding * * list) {
_BCD__ZN14Fl_Text_Editor24add_default_key_bindingsEPPNS_11Key_BindingE(__C_data, list);
}
_BCD_func__911 bound_key_function(int key, int state, Key_Binding * list) {
return _BCD__ZN14Fl_Text_Editor18bound_key_functionEiiPNS_11Key_BindingE(__C_data, key, state, list.__C_data);
}
_BCD_func__911 bound_key_function(int key, int state) {
return _BCD__ZN14Fl_Text_Editor18bound_key_functionEii(__C_data, key, state);
}
void default_key_function(_BCD_func__911 f) {
_BCD__ZN14Fl_Text_Editor20default_key_functionEPFiiPS_E(__C_data, f);
}
static int kf_default(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor10kf_defaultEiPS_(c, e.__C_data);
}
static int kf_ignore(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor9kf_ignoreEiPS_(c, e.__C_data);
}
static int kf_backspace(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor12kf_backspaceEiPS_(c, e.__C_data);
}
static int kf_enter(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor8kf_enterEiPS_(c, e.__C_data);
}
static int kf_move(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor7kf_moveEiPS_(c, e.__C_data);
}
static int kf_shift_move(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor13kf_shift_moveEiPS_(c, e.__C_data);
}
static int kf_ctrl_move(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor12kf_ctrl_moveEiPS_(c, e.__C_data);
}
static int kf_c_s_move(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor11kf_c_s_moveEiPS_(c, e.__C_data);
}
static int kf_home(int _0, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor7kf_homeEiPS_(_0, e.__C_data);
}
static int kf_end(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor6kf_endEiPS_(c, e.__C_data);
}
static int kf_left(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor7kf_leftEiPS_(c, e.__C_data);
}
static int kf_up(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor5kf_upEiPS_(c, e.__C_data);
}
static int kf_right(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor8kf_rightEiPS_(c, e.__C_data);
}
static int kf_down(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor7kf_downEiPS_(c, e.__C_data);
}
static int kf_page_up(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor10kf_page_upEiPS_(c, e.__C_data);
}
static int kf_page_down(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor12kf_page_downEiPS_(c, e.__C_data);
}
static int kf_insert(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor9kf_insertEiPS_(c, e.__C_data);
}
static int kf_delete(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor9kf_deleteEiPS_(c, e.__C_data);
}
static int kf_copy(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor7kf_copyEiPS_(c, e.__C_data);
}
static int kf_cut(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor6kf_cutEiPS_(c, e.__C_data);
}
static int kf_paste(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor8kf_pasteEiPS_(c, e.__C_data);
}
static int kf_select_all(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor13kf_select_allEiPS_(c, e.__C_data);
}
static int kf_undo(int c, Fl_Text_Editor * e) {
return _BCD__ZN14Fl_Text_Editor7kf_undoEiPS_(c, e.__C_data);
}
}
class Fl_Text_Editor_R : Fl_Text_Editor {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_14Fl_Text_Editor__Fl_Text_Editor_R(__C_data);
__C_data = null;
}
this(int X, int Y, int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN14Fl_Text_EditorC1EiiiiPKc_R(X, Y, W, H, l);
__C_data_owned = true;
_BCD_RI_14Fl_Text_Editor(__C_data, cast(void *) this);
}
}
