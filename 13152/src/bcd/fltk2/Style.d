/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.Style;
align(4):
public import bcd.bind;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.Color;
public import bcd.fltk2.Flags;
extern (C) void _BCD_delete_N4fltk10NamedStyleE(void *);
extern (C) void _BCD_set__ZN4fltk10NamedStyle4nameE(void *, char *);
extern (C) char * _BCD_get__ZN4fltk10NamedStyle4nameE(void *);
alias void function(Style *) _BCD_func__323;
extern (C) void _BCD_set__ZN4fltk10NamedStyle10revertfuncE(void *, _BCD_func__323);
extern (C) _BCD_func__323 _BCD_get__ZN4fltk10NamedStyle10revertfuncE(void *);
extern (C) void _BCD_set__ZN4fltk10NamedStyle12back_pointerE(void *, NamedStyle * *);
extern (C) NamedStyle * * _BCD_get__ZN4fltk10NamedStyle12back_pointerE(void *);
extern (C) void _BCD_set__ZN4fltk10NamedStyle5firstE(void *, NamedStyle *);
extern (C) NamedStyle * _BCD_get__ZN4fltk10NamedStyle5firstE(void *);
extern (C) void _BCD_set__ZN4fltk10NamedStyle4nextE(void *, NamedStyle *);
extern (C) NamedStyle * _BCD_get__ZN4fltk10NamedStyle4nextE(void *);
extern (C) void *_BCD_new__ZN4fltk10NamedStyleC1EPKcPFvPNS_5StyleEEPPS0_(char *, _BCD_func__323, NamedStyle * *);
extern (C) void _BCD_RI_N4fltk10NamedStyleE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk10NamedStyleE__NamedStyle_R(void *This);
alias bcd.bind.BoundClass Box;
extern (C) void *_BCD_new__ZN4fltk10NamedStyleC1EPKcPFvPNS_5StyleEEPPS0__R(char *, _BCD_func__323, NamedStyle * *);
extern (C) void _BCD_delete_N4fltk5StyleE(void *);
extern (C) void _BCD_set__ZN4fltk5Style7parent_E(void *, Style *);
extern (C) Style * _BCD_get__ZN4fltk5Style7parent_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style4box_E(void *, bcd.bind.BoundClass *);
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk5Style4box_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style10buttonbox_E(void *, bcd.bind.BoundClass *);
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk5Style10buttonbox_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style6glyph_E(void *, bcd.bind.BoundClass *);
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk5Style6glyph_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style10labelfont_E(void *, bcd.bind.BoundClass *);
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk5Style10labelfont_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style9textfont_E(void *, bcd.bind.BoundClass *);
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk5Style9textfont_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style10labeltype_E(void *, bcd.bind.BoundClass *);
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk5Style10labeltype_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style6color_E(void *, uint);
extern (C) uint _BCD_get__ZN4fltk5Style6color_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style10textcolor_E(void *, uint);
extern (C) uint _BCD_get__ZN4fltk5Style10textcolor_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style16selection_color_E(void *, uint);
extern (C) uint _BCD_get__ZN4fltk5Style16selection_color_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style20selection_textcolor_E(void *, uint);
extern (C) uint _BCD_get__ZN4fltk5Style20selection_textcolor_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style12buttoncolor_E(void *, uint);
extern (C) uint _BCD_get__ZN4fltk5Style12buttoncolor_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style11labelcolor_E(void *, uint);
extern (C) uint _BCD_get__ZN4fltk5Style11labelcolor_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style16highlight_color_E(void *, uint);
extern (C) uint _BCD_get__ZN4fltk5Style16highlight_color_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style20highlight_textcolor_E(void *, uint);
extern (C) uint _BCD_get__ZN4fltk5Style20highlight_textcolor_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style10labelsize_E(void *, float);
extern (C) float _BCD_get__ZN4fltk5Style10labelsize_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style9textsize_E(void *, float);
extern (C) float _BCD_get__ZN4fltk5Style9textsize_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style8leading_E(void *, float);
extern (C) float _BCD_get__ZN4fltk5Style8leading_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style16scrollbar_align_E(void *, char);
extern (C) char _BCD_get__ZN4fltk5Style16scrollbar_align_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style16scrollbar_width_E(void *, char);
extern (C) char _BCD_get__ZN4fltk5Style16scrollbar_width_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style8dynamic_E(void *, bool);
extern (C) bool _BCD_get__ZN4fltk5Style8dynamic_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style16hide_underscore_E(void *, bool);
extern (C) bool _BCD_get__ZN4fltk5Style16hide_underscore_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style20draw_boxes_inactive_E(void *, bool);
extern (C) bool _BCD_get__ZN4fltk5Style20draw_boxes_inactive_E(void *);
extern (C) void _BCD_set__ZN4fltk5Style19wheel_scroll_lines_E(void *, int);
extern (C) int _BCD_get__ZN4fltk5Style19wheel_scroll_lines_E(void *);
extern (C) bcd.bind.BoundClass * _BCD__ZNK4fltk5Style3boxEv(void *This);
extern (C) bcd.bind.BoundClass * _BCD__ZNK4fltk5Style9buttonboxEv(void *This);
extern (C) bcd.bind.BoundClass * _BCD__ZNK4fltk5Style5glyphEv(void *This);
extern (C) bcd.bind.BoundClass * _BCD__ZNK4fltk5Style9labelfontEv(void *This);
extern (C) bcd.bind.BoundClass * _BCD__ZNK4fltk5Style8textfontEv(void *This);
extern (C) bcd.bind.BoundClass * _BCD__ZNK4fltk5Style9labeltypeEv(void *This);
extern (C) uint _BCD__ZNK4fltk5Style5colorEv(void *This);
extern (C) uint _BCD__ZNK4fltk5Style9textcolorEv(void *This);
extern (C) uint _BCD__ZNK4fltk5Style15selection_colorEv(void *This);
extern (C) uint _BCD__ZNK4fltk5Style19selection_textcolorEv(void *This);
extern (C) uint _BCD__ZNK4fltk5Style11buttoncolorEv(void *This);
extern (C) uint _BCD__ZNK4fltk5Style10labelcolorEv(void *This);
extern (C) uint _BCD__ZNK4fltk5Style15highlight_colorEv(void *This);
extern (C) uint _BCD__ZNK4fltk5Style19highlight_textcolorEv(void *This);
extern (C) float _BCD__ZNK4fltk5Style9labelsizeEv(void *This);
extern (C) float _BCD__ZNK4fltk5Style8textsizeEv(void *This);
extern (C) float _BCD__ZNK4fltk5Style7leadingEv(void *This);
extern (C) char _BCD__ZNK4fltk5Style15scrollbar_alignEv(void *This);
extern (C) char _BCD__ZNK4fltk5Style15scrollbar_widthEv(void *This);
extern (C) bool _BCD__ZNK4fltk5Style15hide_underscoreEv(void *This);
extern (C) bool _BCD__ZNK4fltk5Style19draw_boxes_inactiveEv(void *This);
extern (C) int _BCD__ZNK4fltk5Style18wheel_scroll_linesEv(void *This);
extern (C) void _BCD__ZN4fltk5Style3boxEPNS_6SymbolE(void *This, void *);
extern (C) void _BCD__ZN4fltk5Style9buttonboxEPNS_6SymbolE(void *This, void *);
extern (C) void _BCD__ZN4fltk5Style5glyphEPNS_6SymbolE(void *This, void *);
extern (C) void _BCD__ZN4fltk5Style9labelfontEPNS_4FontE(void *This, void *);
extern (C) void _BCD__ZN4fltk5Style8textfontEPNS_4FontE(void *This, void *);
extern (C) void _BCD__ZN4fltk5Style9labeltypeEPNS_9LabelTypeE(void *This, void *);
extern (C) void _BCD__ZN4fltk5Style5colorEj(void *This, uint);
extern (C) void _BCD__ZN4fltk5Style9textcolorEj(void *This, uint);
extern (C) void _BCD__ZN4fltk5Style15selection_colorEj(void *This, uint);
extern (C) void _BCD__ZN4fltk5Style19selection_textcolorEj(void *This, uint);
extern (C) void _BCD__ZN4fltk5Style11buttoncolorEj(void *This, uint);
extern (C) void _BCD__ZN4fltk5Style10labelcolorEj(void *This, uint);
extern (C) void _BCD__ZN4fltk5Style15highlight_colorEj(void *This, uint);
extern (C) void _BCD__ZN4fltk5Style19highlight_textcolorEj(void *This, uint);
extern (C) void _BCD__ZN4fltk5Style9labelsizeEf(void *This, float);
extern (C) void _BCD__ZN4fltk5Style8textsizeEf(void *This, float);
extern (C) void _BCD__ZN4fltk5Style7leadingEf(void *This, float);
extern (C) void _BCD__ZN4fltk5Style15scrollbar_alignEh(void *This, char);
extern (C) void _BCD__ZN4fltk5Style15scrollbar_widthEh(void *This, char);
extern (C) void _BCD__ZN4fltk5Style15hide_underscoreEb(void *This, bool);
extern (C) void _BCD__ZN4fltk5Style19draw_boxes_inactiveEb(void *This, bool);
extern (C) void _BCD__ZN4fltk5Style18wheel_scroll_linesEi(void *This, int);
extern (C) void *_BCD_new__ZN4fltk5StyleC1Ev();
extern (C) bool _BCD__ZNK4fltk5Style7dynamicEv(void *This);
extern (C) Style * _BCD__ZN4fltk5Style4findEPKc(char *);
extern (C) void _BCD_RI_N4fltk5StyleE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk5StyleE__Style_R(void *This);
extern (C) void *_BCD_new__ZN4fltk5StyleC1Ev_R();
extern (C) bool _BCD__ZN4fltk11reset_themeEv();
extern (C) void _BCD__ZN4fltk12reload_themeEv();
extern (C) void _BCD__ZN4fltk10load_themeEv();
alias bool function() _BCD_func__228;
alias _BCD_func__228 Theme;
extern (C) void _BCD__ZN4fltk5themeEPFbvE(_BCD_func__228);
extern (C) _BCD_func__228 _BCD__ZN4fltk5themeEv();
extern (C) void _BCD_set__ZN4fltk6theme_E(_BCD_func__228);
extern (C) _BCD_func__228 _BCD_get__ZN4fltk6theme_E();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk14EMBOSSED_LABELE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk14ENGRAVED_LABELE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk12SHADOW_LABELE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk12SYMBOL_LABELE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk12NORMAL_LABELE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk8NO_LABELE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk13ZAPF_DINGBATSE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk16SCREEN_BOLD_FONTE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk11SCREEN_FONTE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk11SYMBOL_FONTE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk17TIMES_BOLD_ITALICE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk12TIMES_ITALICE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk10TIMES_BOLDE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk5TIMESE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk19COURIER_BOLD_ITALICE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk14COURIER_ITALICE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk12COURIER_BOLDE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk7COURIERE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk21HELVETICA_BOLD_ITALICE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk16HELVETICA_ITALICE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk14HELVETICA_BOLDE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk9HELVETICAE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk16PLASTIC_DOWN_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk14PLASTIC_UP_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk12BORDER_FRAMEE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk9OFLAT_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk11OSHADOW_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk8OVAL_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk9RFLAT_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk11RSHADOW_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk11ROUNDED_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk10SHADOW_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk6NO_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk16DIAMOND_DOWN_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk14DIAMOND_UP_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk14ROUND_DOWN_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk12ROUND_UP_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk18HIGHLIGHT_DOWN_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk16HIGHLIGHT_UP_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk8FLAT_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk10BORDER_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk12EMBOSSED_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk12ENGRAVED_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk13THIN_DOWN_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk11THIN_UP_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk8DOWN_BOXE();
extern (C) bcd.bind.BoundClass * _BCD_get__ZN4fltk6UP_BOXE();
class NamedStyle : Style {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk10NamedStyleE(__C_data);
__C_data = null;
}
void set_name(char * x) {
_BCD_set__ZN4fltk10NamedStyle4nameE(__C_data, x);
}
char * get_name() {
return _BCD_get__ZN4fltk10NamedStyle4nameE(__C_data);
}
void set_revertfunc(_BCD_func__323 x) {
_BCD_set__ZN4fltk10NamedStyle10revertfuncE(__C_data, x);
}
_BCD_func__323 get_revertfunc() {
return _BCD_get__ZN4fltk10NamedStyle10revertfuncE(__C_data);
}
void set_back_pointer(NamedStyle * * x) {
_BCD_set__ZN4fltk10NamedStyle12back_pointerE(__C_data, x);
}
NamedStyle * * get_back_pointer() {
return _BCD_get__ZN4fltk10NamedStyle12back_pointerE(__C_data);
}
void set_first(NamedStyle * x) {
_BCD_set__ZN4fltk10NamedStyle5firstE(__C_data, x);
}
NamedStyle * get_first() {
return _BCD_get__ZN4fltk10NamedStyle5firstE(__C_data);
}
void set_next(NamedStyle * x) {
_BCD_set__ZN4fltk10NamedStyle4nextE(__C_data, x);
}
NamedStyle * get_next() {
return _BCD_get__ZN4fltk10NamedStyle4nextE(__C_data);
}
this(char * name, _BCD_func__323 revert, NamedStyle * * backptr) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10NamedStyleC1EPKcPFvPNS_5StyleEEPPS0_(name, revert, backptr);
__C_data_owned = true;
}
}
class NamedStyle_R : NamedStyle {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk10NamedStyleE__NamedStyle_R(__C_data);
__C_data = null;
}
this(char * name, _BCD_func__323 revert, NamedStyle * * backptr) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk10NamedStyleC1EPKcPFvPNS_5StyleEEPPS0__R(name, revert, backptr);
__C_data_owned = true;
_BCD_RI_N4fltk10NamedStyleE(__C_data, cast(void *) this);
}
}
class Style : bcd.bind.BoundClass {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk5StyleE(__C_data);
__C_data = null;
}
void set_parent_(Style * x) {
_BCD_set__ZN4fltk5Style7parent_E(__C_data, x);
}
Style * get_parent_() {
return _BCD_get__ZN4fltk5Style7parent_E(__C_data);
}
void set_box_(bcd.bind.BoundClass * x) {
_BCD_set__ZN4fltk5Style4box_E(__C_data, x);
}
bcd.bind.BoundClass * get_box_() {
return _BCD_get__ZN4fltk5Style4box_E(__C_data);
}
void set_buttonbox_(bcd.bind.BoundClass * x) {
_BCD_set__ZN4fltk5Style10buttonbox_E(__C_data, x);
}
bcd.bind.BoundClass * get_buttonbox_() {
return _BCD_get__ZN4fltk5Style10buttonbox_E(__C_data);
}
void set_glyph_(bcd.bind.BoundClass * x) {
_BCD_set__ZN4fltk5Style6glyph_E(__C_data, x);
}
bcd.bind.BoundClass * get_glyph_() {
return _BCD_get__ZN4fltk5Style6glyph_E(__C_data);
}
void set_labelfont_(bcd.bind.BoundClass * x) {
_BCD_set__ZN4fltk5Style10labelfont_E(__C_data, x);
}
bcd.bind.BoundClass * get_labelfont_() {
return _BCD_get__ZN4fltk5Style10labelfont_E(__C_data);
}
void set_textfont_(bcd.bind.BoundClass * x) {
_BCD_set__ZN4fltk5Style9textfont_E(__C_data, x);
}
bcd.bind.BoundClass * get_textfont_() {
return _BCD_get__ZN4fltk5Style9textfont_E(__C_data);
}
void set_labeltype_(bcd.bind.BoundClass * x) {
_BCD_set__ZN4fltk5Style10labeltype_E(__C_data, x);
}
bcd.bind.BoundClass * get_labeltype_() {
return _BCD_get__ZN4fltk5Style10labeltype_E(__C_data);
}
void set_color_(uint x) {
_BCD_set__ZN4fltk5Style6color_E(__C_data, x);
}
uint get_color_() {
return _BCD_get__ZN4fltk5Style6color_E(__C_data);
}
void set_textcolor_(uint x) {
_BCD_set__ZN4fltk5Style10textcolor_E(__C_data, x);
}
uint get_textcolor_() {
return _BCD_get__ZN4fltk5Style10textcolor_E(__C_data);
}
void set_selection_color_(uint x) {
_BCD_set__ZN4fltk5Style16selection_color_E(__C_data, x);
}
uint get_selection_color_() {
return _BCD_get__ZN4fltk5Style16selection_color_E(__C_data);
}
void set_selection_textcolor_(uint x) {
_BCD_set__ZN4fltk5Style20selection_textcolor_E(__C_data, x);
}
uint get_selection_textcolor_() {
return _BCD_get__ZN4fltk5Style20selection_textcolor_E(__C_data);
}
void set_buttoncolor_(uint x) {
_BCD_set__ZN4fltk5Style12buttoncolor_E(__C_data, x);
}
uint get_buttoncolor_() {
return _BCD_get__ZN4fltk5Style12buttoncolor_E(__C_data);
}
void set_labelcolor_(uint x) {
_BCD_set__ZN4fltk5Style11labelcolor_E(__C_data, x);
}
uint get_labelcolor_() {
return _BCD_get__ZN4fltk5Style11labelcolor_E(__C_data);
}
void set_highlight_color_(uint x) {
_BCD_set__ZN4fltk5Style16highlight_color_E(__C_data, x);
}
uint get_highlight_color_() {
return _BCD_get__ZN4fltk5Style16highlight_color_E(__C_data);
}
void set_highlight_textcolor_(uint x) {
_BCD_set__ZN4fltk5Style20highlight_textcolor_E(__C_data, x);
}
uint get_highlight_textcolor_() {
return _BCD_get__ZN4fltk5Style20highlight_textcolor_E(__C_data);
}
void set_labelsize_(float x) {
_BCD_set__ZN4fltk5Style10labelsize_E(__C_data, x);
}
float get_labelsize_() {
return _BCD_get__ZN4fltk5Style10labelsize_E(__C_data);
}
void set_textsize_(float x) {
_BCD_set__ZN4fltk5Style9textsize_E(__C_data, x);
}
float get_textsize_() {
return _BCD_get__ZN4fltk5Style9textsize_E(__C_data);
}
void set_leading_(float x) {
_BCD_set__ZN4fltk5Style8leading_E(__C_data, x);
}
float get_leading_() {
return _BCD_get__ZN4fltk5Style8leading_E(__C_data);
}
void set_scrollbar_align_(char x) {
_BCD_set__ZN4fltk5Style16scrollbar_align_E(__C_data, x);
}
char get_scrollbar_align_() {
return _BCD_get__ZN4fltk5Style16scrollbar_align_E(__C_data);
}
void set_scrollbar_width_(char x) {
_BCD_set__ZN4fltk5Style16scrollbar_width_E(__C_data, x);
}
char get_scrollbar_width_() {
return _BCD_get__ZN4fltk5Style16scrollbar_width_E(__C_data);
}
void set_dynamic_(bool x) {
_BCD_set__ZN4fltk5Style8dynamic_E(__C_data, x);
}
bool get_dynamic_() {
return _BCD_get__ZN4fltk5Style8dynamic_E(__C_data);
}
void set_hide_underscore_(bool x) {
_BCD_set__ZN4fltk5Style16hide_underscore_E(__C_data, x);
}
bool get_hide_underscore_() {
return _BCD_get__ZN4fltk5Style16hide_underscore_E(__C_data);
}
void set_draw_boxes_inactive_(bool x) {
_BCD_set__ZN4fltk5Style20draw_boxes_inactive_E(__C_data, x);
}
bool get_draw_boxes_inactive_() {
return _BCD_get__ZN4fltk5Style20draw_boxes_inactive_E(__C_data);
}
void set_wheel_scroll_lines_(int x) {
_BCD_set__ZN4fltk5Style19wheel_scroll_lines_E(__C_data, x);
}
int get_wheel_scroll_lines_() {
return _BCD_get__ZN4fltk5Style19wheel_scroll_lines_E(__C_data);
}
bcd.bind.BoundClass * box() {
return _BCD__ZNK4fltk5Style3boxEv(__C_data);
}
bcd.bind.BoundClass * buttonbox() {
return _BCD__ZNK4fltk5Style9buttonboxEv(__C_data);
}
bcd.bind.BoundClass * glyph() {
return _BCD__ZNK4fltk5Style5glyphEv(__C_data);
}
bcd.bind.BoundClass * labelfont() {
return _BCD__ZNK4fltk5Style9labelfontEv(__C_data);
}
bcd.bind.BoundClass * textfont() {
return _BCD__ZNK4fltk5Style8textfontEv(__C_data);
}
bcd.bind.BoundClass * labeltype() {
return _BCD__ZNK4fltk5Style9labeltypeEv(__C_data);
}
uint color() {
return _BCD__ZNK4fltk5Style5colorEv(__C_data);
}
uint textcolor() {
return _BCD__ZNK4fltk5Style9textcolorEv(__C_data);
}
uint selection_color() {
return _BCD__ZNK4fltk5Style15selection_colorEv(__C_data);
}
uint selection_textcolor() {
return _BCD__ZNK4fltk5Style19selection_textcolorEv(__C_data);
}
uint buttoncolor() {
return _BCD__ZNK4fltk5Style11buttoncolorEv(__C_data);
}
uint labelcolor() {
return _BCD__ZNK4fltk5Style10labelcolorEv(__C_data);
}
uint highlight_color() {
return _BCD__ZNK4fltk5Style15highlight_colorEv(__C_data);
}
uint highlight_textcolor() {
return _BCD__ZNK4fltk5Style19highlight_textcolorEv(__C_data);
}
float labelsize() {
return _BCD__ZNK4fltk5Style9labelsizeEv(__C_data);
}
float textsize() {
return _BCD__ZNK4fltk5Style8textsizeEv(__C_data);
}
float leading() {
return _BCD__ZNK4fltk5Style7leadingEv(__C_data);
}
char scrollbar_align() {
return _BCD__ZNK4fltk5Style15scrollbar_alignEv(__C_data);
}
char scrollbar_width() {
return _BCD__ZNK4fltk5Style15scrollbar_widthEv(__C_data);
}
bool hide_underscore() {
return _BCD__ZNK4fltk5Style15hide_underscoreEv(__C_data);
}
bool draw_boxes_inactive() {
return _BCD__ZNK4fltk5Style19draw_boxes_inactiveEv(__C_data);
}
int wheel_scroll_lines() {
return _BCD__ZNK4fltk5Style18wheel_scroll_linesEv(__C_data);
}
void box(bcd.bind.BoundClass * v) {
_BCD__ZN4fltk5Style3boxEPNS_6SymbolE(__C_data, v.__C_data);
}
void buttonbox(bcd.bind.BoundClass * v) {
_BCD__ZN4fltk5Style9buttonboxEPNS_6SymbolE(__C_data, v.__C_data);
}
void glyph(bcd.bind.BoundClass * v) {
_BCD__ZN4fltk5Style5glyphEPNS_6SymbolE(__C_data, v.__C_data);
}
void labelfont(bcd.bind.BoundClass * v) {
_BCD__ZN4fltk5Style9labelfontEPNS_4FontE(__C_data, v.__C_data);
}
void textfont(bcd.bind.BoundClass * v) {
_BCD__ZN4fltk5Style8textfontEPNS_4FontE(__C_data, v.__C_data);
}
void labeltype(bcd.bind.BoundClass * v) {
_BCD__ZN4fltk5Style9labeltypeEPNS_9LabelTypeE(__C_data, v.__C_data);
}
void color(uint v) {
_BCD__ZN4fltk5Style5colorEj(__C_data, v);
}
void textcolor(uint v) {
_BCD__ZN4fltk5Style9textcolorEj(__C_data, v);
}
void selection_color(uint v) {
_BCD__ZN4fltk5Style15selection_colorEj(__C_data, v);
}
void selection_textcolor(uint v) {
_BCD__ZN4fltk5Style19selection_textcolorEj(__C_data, v);
}
void buttoncolor(uint v) {
_BCD__ZN4fltk5Style11buttoncolorEj(__C_data, v);
}
void labelcolor(uint v) {
_BCD__ZN4fltk5Style10labelcolorEj(__C_data, v);
}
void highlight_color(uint v) {
_BCD__ZN4fltk5Style15highlight_colorEj(__C_data, v);
}
void highlight_textcolor(uint v) {
_BCD__ZN4fltk5Style19highlight_textcolorEj(__C_data, v);
}
void labelsize(float v) {
_BCD__ZN4fltk5Style9labelsizeEf(__C_data, v);
}
void textsize(float v) {
_BCD__ZN4fltk5Style8textsizeEf(__C_data, v);
}
void leading(float v) {
_BCD__ZN4fltk5Style7leadingEf(__C_data, v);
}
void scrollbar_align(char v) {
_BCD__ZN4fltk5Style15scrollbar_alignEh(__C_data, v);
}
void scrollbar_width(char v) {
_BCD__ZN4fltk5Style15scrollbar_widthEh(__C_data, v);
}
void hide_underscore(bool v) {
_BCD__ZN4fltk5Style15hide_underscoreEb(__C_data, v);
}
void draw_boxes_inactive(bool v) {
_BCD__ZN4fltk5Style19draw_boxes_inactiveEb(__C_data, v);
}
void wheel_scroll_lines(int v) {
_BCD__ZN4fltk5Style18wheel_scroll_linesEi(__C_data, v);
}
this() {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk5StyleC1Ev();
__C_data_owned = true;
}
bool dynamic() {
return _BCD__ZNK4fltk5Style7dynamicEv(__C_data);
}
static Style * find(char * name) {
return _BCD__ZN4fltk5Style4findEPKc(name);
}
}
class Style_R : Style {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk5StyleE__Style_R(__C_data);
__C_data = null;
}
this() {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk5StyleC1Ev_R();
__C_data_owned = true;
_BCD_RI_N4fltk5StyleE(__C_data, cast(void *) this);
}
}
bool reset_theme() {
return _BCD__ZN4fltk11reset_themeEv();
}
void reload_theme() {
_BCD__ZN4fltk12reload_themeEv();
}
void load_theme() {
_BCD__ZN4fltk10load_themeEv();
}
void theme(_BCD_func__228 f) {
_BCD__ZN4fltk5themeEPFbvE(f);
}
_BCD_func__228 theme() {
return _BCD__ZN4fltk5themeEv();
}
void set_theme_(_BCD_func__228 x) {
_BCD_set__ZN4fltk6theme_E(x);
}
_BCD_func__228 get_theme_() {
return _BCD_get__ZN4fltk6theme_E();
}
bcd.bind.BoundClass * get_EMBOSSED_LABEL() {
return _BCD_get__ZN4fltk14EMBOSSED_LABELE();
}
bcd.bind.BoundClass * get_ENGRAVED_LABEL() {
return _BCD_get__ZN4fltk14ENGRAVED_LABELE();
}
bcd.bind.BoundClass * get_SHADOW_LABEL() {
return _BCD_get__ZN4fltk12SHADOW_LABELE();
}
bcd.bind.BoundClass * get_SYMBOL_LABEL() {
return _BCD_get__ZN4fltk12SYMBOL_LABELE();
}
bcd.bind.BoundClass * get_NORMAL_LABEL() {
return _BCD_get__ZN4fltk12NORMAL_LABELE();
}
bcd.bind.BoundClass * get_NO_LABEL() {
return _BCD_get__ZN4fltk8NO_LABELE();
}
bcd.bind.BoundClass * get_ZAPF_DINGBATS() {
return _BCD_get__ZN4fltk13ZAPF_DINGBATSE();
}
bcd.bind.BoundClass * get_SCREEN_BOLD_FONT() {
return _BCD_get__ZN4fltk16SCREEN_BOLD_FONTE();
}
bcd.bind.BoundClass * get_SCREEN_FONT() {
return _BCD_get__ZN4fltk11SCREEN_FONTE();
}
bcd.bind.BoundClass * get_SYMBOL_FONT() {
return _BCD_get__ZN4fltk11SYMBOL_FONTE();
}
bcd.bind.BoundClass * get_TIMES_BOLD_ITALIC() {
return _BCD_get__ZN4fltk17TIMES_BOLD_ITALICE();
}
bcd.bind.BoundClass * get_TIMES_ITALIC() {
return _BCD_get__ZN4fltk12TIMES_ITALICE();
}
bcd.bind.BoundClass * get_TIMES_BOLD() {
return _BCD_get__ZN4fltk10TIMES_BOLDE();
}
bcd.bind.BoundClass * get_TIMES() {
return _BCD_get__ZN4fltk5TIMESE();
}
bcd.bind.BoundClass * get_COURIER_BOLD_ITALIC() {
return _BCD_get__ZN4fltk19COURIER_BOLD_ITALICE();
}
bcd.bind.BoundClass * get_COURIER_ITALIC() {
return _BCD_get__ZN4fltk14COURIER_ITALICE();
}
bcd.bind.BoundClass * get_COURIER_BOLD() {
return _BCD_get__ZN4fltk12COURIER_BOLDE();
}
bcd.bind.BoundClass * get_COURIER() {
return _BCD_get__ZN4fltk7COURIERE();
}
bcd.bind.BoundClass * get_HELVETICA_BOLD_ITALIC() {
return _BCD_get__ZN4fltk21HELVETICA_BOLD_ITALICE();
}
bcd.bind.BoundClass * get_HELVETICA_ITALIC() {
return _BCD_get__ZN4fltk16HELVETICA_ITALICE();
}
bcd.bind.BoundClass * get_HELVETICA_BOLD() {
return _BCD_get__ZN4fltk14HELVETICA_BOLDE();
}
bcd.bind.BoundClass * get_HELVETICA() {
return _BCD_get__ZN4fltk9HELVETICAE();
}
bcd.bind.BoundClass * get_PLASTIC_DOWN_BOX() {
return _BCD_get__ZN4fltk16PLASTIC_DOWN_BOXE();
}
bcd.bind.BoundClass * get_PLASTIC_UP_BOX() {
return _BCD_get__ZN4fltk14PLASTIC_UP_BOXE();
}
bcd.bind.BoundClass * get_BORDER_FRAME() {
return _BCD_get__ZN4fltk12BORDER_FRAMEE();
}
bcd.bind.BoundClass * get_OFLAT_BOX() {
return _BCD_get__ZN4fltk9OFLAT_BOXE();
}
bcd.bind.BoundClass * get_OSHADOW_BOX() {
return _BCD_get__ZN4fltk11OSHADOW_BOXE();
}
bcd.bind.BoundClass * get_OVAL_BOX() {
return _BCD_get__ZN4fltk8OVAL_BOXE();
}
bcd.bind.BoundClass * get_RFLAT_BOX() {
return _BCD_get__ZN4fltk9RFLAT_BOXE();
}
bcd.bind.BoundClass * get_RSHADOW_BOX() {
return _BCD_get__ZN4fltk11RSHADOW_BOXE();
}
bcd.bind.BoundClass * get_ROUNDED_BOX() {
return _BCD_get__ZN4fltk11ROUNDED_BOXE();
}
bcd.bind.BoundClass * get_SHADOW_BOX() {
return _BCD_get__ZN4fltk10SHADOW_BOXE();
}
bcd.bind.BoundClass * get_NO_BOX() {
return _BCD_get__ZN4fltk6NO_BOXE();
}
bcd.bind.BoundClass * get_DIAMOND_DOWN_BOX() {
return _BCD_get__ZN4fltk16DIAMOND_DOWN_BOXE();
}
bcd.bind.BoundClass * get_DIAMOND_UP_BOX() {
return _BCD_get__ZN4fltk14DIAMOND_UP_BOXE();
}
bcd.bind.BoundClass * get_ROUND_DOWN_BOX() {
return _BCD_get__ZN4fltk14ROUND_DOWN_BOXE();
}
bcd.bind.BoundClass * get_ROUND_UP_BOX() {
return _BCD_get__ZN4fltk12ROUND_UP_BOXE();
}
bcd.bind.BoundClass * get_HIGHLIGHT_DOWN_BOX() {
return _BCD_get__ZN4fltk18HIGHLIGHT_DOWN_BOXE();
}
bcd.bind.BoundClass * get_HIGHLIGHT_UP_BOX() {
return _BCD_get__ZN4fltk16HIGHLIGHT_UP_BOXE();
}
bcd.bind.BoundClass * get_FLAT_BOX() {
return _BCD_get__ZN4fltk8FLAT_BOXE();
}
bcd.bind.BoundClass * get_BORDER_BOX() {
return _BCD_get__ZN4fltk10BORDER_BOXE();
}
bcd.bind.BoundClass * get_EMBOSSED_BOX() {
return _BCD_get__ZN4fltk12EMBOSSED_BOXE();
}
bcd.bind.BoundClass * get_ENGRAVED_BOX() {
return _BCD_get__ZN4fltk12ENGRAVED_BOXE();
}
bcd.bind.BoundClass * get_THIN_DOWN_BOX() {
return _BCD_get__ZN4fltk13THIN_DOWN_BOXE();
}
bcd.bind.BoundClass * get_THIN_UP_BOX() {
return _BCD_get__ZN4fltk11THIN_UP_BOXE();
}
bcd.bind.BoundClass * get_DOWN_BOX() {
return _BCD_get__ZN4fltk8DOWN_BOXE();
}
bcd.bind.BoundClass * get_UP_BOX() {
return _BCD_get__ZN4fltk6UP_BOXE();
}
