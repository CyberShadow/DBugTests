/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/Style.h"
extern "C" {
typedef unsigned char _BCD__5_uchar;
void _BCD_delete_N4fltk10NamedStyleE(fltk::NamedStyle *This) {
delete This;
}
void _BCD_set__ZN4fltk10NamedStyle4nameE(fltk::NamedStyle *This, char const * x) {
This->name = x;
}
char const * _BCD_get__ZN4fltk10NamedStyle4nameE(fltk::NamedStyle *This) {
return This->name;
}
typedef void (*_BCD_func__323)(fltk::Style *);
void _BCD_set__ZN4fltk10NamedStyle10revertfuncE(fltk::NamedStyle *This, _BCD_func__323 x) {
This->revertfunc = x;
}
_BCD_func__323 _BCD_get__ZN4fltk10NamedStyle10revertfuncE(fltk::NamedStyle *This) {
return This->revertfunc;
}
void _BCD_set__ZN4fltk10NamedStyle12back_pointerE(fltk::NamedStyle *This, fltk::NamedStyle * * x) {
This->back_pointer = x;
}
fltk::NamedStyle * * _BCD_get__ZN4fltk10NamedStyle12back_pointerE(fltk::NamedStyle *This) {
return This->back_pointer;
}
void _BCD_set__ZN4fltk10NamedStyle5firstE(fltk::NamedStyle *This, fltk::NamedStyle * x) {
This->first = x;
}
fltk::NamedStyle * _BCD_get__ZN4fltk10NamedStyle5firstE(fltk::NamedStyle *This) {
return This->first;
}
void _BCD_set__ZN4fltk10NamedStyle4nextE(fltk::NamedStyle *This, fltk::NamedStyle * x) {
This->next = x;
}
fltk::NamedStyle * _BCD_get__ZN4fltk10NamedStyle4nextE(fltk::NamedStyle *This) {
return This->next;
}
fltk::NamedStyle *_BCD_new__ZN4fltk10NamedStyleC1EPKcPFvPNS_5StyleEEPPS0_(char const * name, _BCD_func__323 revert, fltk::NamedStyle * * backptr) {
return new fltk::NamedStyle(name, revert, backptr);
}
typedef fltk::Symbol * _BCD__204_Box;
typedef unsigned int _BCD__221_Color;
}
class NamedStyle_R : fltk::NamedStyle {
public:
void *__D_data;
NamedStyle_R(char const * name, _BCD_func__323 revert, fltk::NamedStyle * * backptr) : fltk::NamedStyle(name, revert, backptr) {}
};
extern "C" {
NamedStyle_R *_BCD_new__ZN4fltk10NamedStyleC1EPKcPFvPNS_5StyleEEPPS0__R(char const * name, _BCD_func__323 revert, fltk::NamedStyle * * backptr) {
return new NamedStyle_R(name, revert, backptr);
}
void _BCD_delete_N4fltk10NamedStyleE__NamedStyle_R(NamedStyle_R *This) {
delete This;
}
void _BCD_RI_N4fltk10NamedStyleE(NamedStyle_R *cd, void *dd) {
cd->__D_data = dd;
}
void _BCD_delete_N4fltk5StyleE(fltk::Style *This) {
delete This;
}
void _BCD_set__ZN4fltk5Style7parent_E(fltk::Style *This, fltk::Style const * x) {
This->parent_ = x;
}
fltk::Style const * _BCD_get__ZN4fltk5Style7parent_E(fltk::Style *This) {
return This->parent_;
}
void _BCD_set__ZN4fltk5Style4box_E(fltk::Style *This, _BCD__204_Box x) {
This->box_ = x;
}
_BCD__204_Box _BCD_get__ZN4fltk5Style4box_E(fltk::Style *This) {
return This->box_;
}
void _BCD_set__ZN4fltk5Style10buttonbox_E(fltk::Style *This, _BCD__204_Box x) {
This->buttonbox_ = x;
}
_BCD__204_Box _BCD_get__ZN4fltk5Style10buttonbox_E(fltk::Style *This) {
return This->buttonbox_;
}
void _BCD_set__ZN4fltk5Style6glyph_E(fltk::Style *This, fltk::Symbol * x) {
This->glyph_ = x;
}
fltk::Symbol * _BCD_get__ZN4fltk5Style6glyph_E(fltk::Style *This) {
return This->glyph_;
}
void _BCD_set__ZN4fltk5Style10labelfont_E(fltk::Style *This, fltk::Font * x) {
This->labelfont_ = x;
}
fltk::Font * _BCD_get__ZN4fltk5Style10labelfont_E(fltk::Style *This) {
return This->labelfont_;
}
void _BCD_set__ZN4fltk5Style9textfont_E(fltk::Style *This, fltk::Font * x) {
This->textfont_ = x;
}
fltk::Font * _BCD_get__ZN4fltk5Style9textfont_E(fltk::Style *This) {
return This->textfont_;
}
void _BCD_set__ZN4fltk5Style10labeltype_E(fltk::Style *This, fltk::LabelType * x) {
This->labeltype_ = x;
}
fltk::LabelType * _BCD_get__ZN4fltk5Style10labeltype_E(fltk::Style *This) {
return This->labeltype_;
}
void _BCD_set__ZN4fltk5Style6color_E(fltk::Style *This, _BCD__221_Color x) {
This->color_ = x;
}
_BCD__221_Color _BCD_get__ZN4fltk5Style6color_E(fltk::Style *This) {
return This->color_;
}
void _BCD_set__ZN4fltk5Style10textcolor_E(fltk::Style *This, _BCD__221_Color x) {
This->textcolor_ = x;
}
_BCD__221_Color _BCD_get__ZN4fltk5Style10textcolor_E(fltk::Style *This) {
return This->textcolor_;
}
void _BCD_set__ZN4fltk5Style16selection_color_E(fltk::Style *This, _BCD__221_Color x) {
This->selection_color_ = x;
}
_BCD__221_Color _BCD_get__ZN4fltk5Style16selection_color_E(fltk::Style *This) {
return This->selection_color_;
}
void _BCD_set__ZN4fltk5Style20selection_textcolor_E(fltk::Style *This, _BCD__221_Color x) {
This->selection_textcolor_ = x;
}
_BCD__221_Color _BCD_get__ZN4fltk5Style20selection_textcolor_E(fltk::Style *This) {
return This->selection_textcolor_;
}
void _BCD_set__ZN4fltk5Style12buttoncolor_E(fltk::Style *This, _BCD__221_Color x) {
This->buttoncolor_ = x;
}
_BCD__221_Color _BCD_get__ZN4fltk5Style12buttoncolor_E(fltk::Style *This) {
return This->buttoncolor_;
}
void _BCD_set__ZN4fltk5Style11labelcolor_E(fltk::Style *This, _BCD__221_Color x) {
This->labelcolor_ = x;
}
_BCD__221_Color _BCD_get__ZN4fltk5Style11labelcolor_E(fltk::Style *This) {
return This->labelcolor_;
}
void _BCD_set__ZN4fltk5Style16highlight_color_E(fltk::Style *This, _BCD__221_Color x) {
This->highlight_color_ = x;
}
_BCD__221_Color _BCD_get__ZN4fltk5Style16highlight_color_E(fltk::Style *This) {
return This->highlight_color_;
}
void _BCD_set__ZN4fltk5Style20highlight_textcolor_E(fltk::Style *This, _BCD__221_Color x) {
This->highlight_textcolor_ = x;
}
_BCD__221_Color _BCD_get__ZN4fltk5Style20highlight_textcolor_E(fltk::Style *This) {
return This->highlight_textcolor_;
}
void _BCD_set__ZN4fltk5Style10labelsize_E(fltk::Style *This, float x) {
This->labelsize_ = x;
}
float _BCD_get__ZN4fltk5Style10labelsize_E(fltk::Style *This) {
return This->labelsize_;
}
void _BCD_set__ZN4fltk5Style9textsize_E(fltk::Style *This, float x) {
This->textsize_ = x;
}
float _BCD_get__ZN4fltk5Style9textsize_E(fltk::Style *This) {
return This->textsize_;
}
void _BCD_set__ZN4fltk5Style8leading_E(fltk::Style *This, float x) {
This->leading_ = x;
}
float _BCD_get__ZN4fltk5Style8leading_E(fltk::Style *This) {
return This->leading_;
}
void _BCD_set__ZN4fltk5Style16scrollbar_align_E(fltk::Style *This, unsigned char x) {
This->scrollbar_align_ = x;
}
unsigned char _BCD_get__ZN4fltk5Style16scrollbar_align_E(fltk::Style *This) {
return This->scrollbar_align_;
}
void _BCD_set__ZN4fltk5Style16scrollbar_width_E(fltk::Style *This, unsigned char x) {
This->scrollbar_width_ = x;
}
unsigned char _BCD_get__ZN4fltk5Style16scrollbar_width_E(fltk::Style *This) {
return This->scrollbar_width_;
}
void _BCD_set__ZN4fltk5Style8dynamic_E(fltk::Style *This, bool x) {
This->dynamic_ = x;
}
bool _BCD_get__ZN4fltk5Style8dynamic_E(fltk::Style *This) {
return This->dynamic_;
}
void _BCD_set__ZN4fltk5Style16hide_underscore_E(fltk::Style *This, bool x) {
This->hide_underscore_ = x;
}
bool _BCD_get__ZN4fltk5Style16hide_underscore_E(fltk::Style *This) {
return This->hide_underscore_;
}
void _BCD_set__ZN4fltk5Style20draw_boxes_inactive_E(fltk::Style *This, bool x) {
This->draw_boxes_inactive_ = x;
}
bool _BCD_get__ZN4fltk5Style20draw_boxes_inactive_E(fltk::Style *This) {
return This->draw_boxes_inactive_;
}
void _BCD_set__ZN4fltk5Style19wheel_scroll_lines_E(fltk::Style *This, int x) {
This->wheel_scroll_lines_ = x;
}
int _BCD_get__ZN4fltk5Style19wheel_scroll_lines_E(fltk::Style *This) {
return This->wheel_scroll_lines_;
}
_BCD__204_Box _BCD__ZNK4fltk5Style3boxEv(fltk::Style *This) {
return (This->box());
}
_BCD__204_Box _BCD__ZNK4fltk5Style9buttonboxEv(fltk::Style *This) {
return (This->buttonbox());
}
fltk::Symbol * _BCD__ZNK4fltk5Style5glyphEv(fltk::Style *This) {
return (This->glyph());
}
fltk::Font * _BCD__ZNK4fltk5Style9labelfontEv(fltk::Style *This) {
return (This->labelfont());
}
fltk::Font * _BCD__ZNK4fltk5Style8textfontEv(fltk::Style *This) {
return (This->textfont());
}
fltk::LabelType * _BCD__ZNK4fltk5Style9labeltypeEv(fltk::Style *This) {
return (This->labeltype());
}
_BCD__221_Color _BCD__ZNK4fltk5Style5colorEv(fltk::Style *This) {
return (This->color());
}
_BCD__221_Color _BCD__ZNK4fltk5Style9textcolorEv(fltk::Style *This) {
return (This->textcolor());
}
_BCD__221_Color _BCD__ZNK4fltk5Style15selection_colorEv(fltk::Style *This) {
return (This->selection_color());
}
_BCD__221_Color _BCD__ZNK4fltk5Style19selection_textcolorEv(fltk::Style *This) {
return (This->selection_textcolor());
}
_BCD__221_Color _BCD__ZNK4fltk5Style11buttoncolorEv(fltk::Style *This) {
return (This->buttoncolor());
}
_BCD__221_Color _BCD__ZNK4fltk5Style10labelcolorEv(fltk::Style *This) {
return (This->labelcolor());
}
_BCD__221_Color _BCD__ZNK4fltk5Style15highlight_colorEv(fltk::Style *This) {
return (This->highlight_color());
}
_BCD__221_Color _BCD__ZNK4fltk5Style19highlight_textcolorEv(fltk::Style *This) {
return (This->highlight_textcolor());
}
float _BCD__ZNK4fltk5Style9labelsizeEv(fltk::Style *This) {
return (This->labelsize());
}
float _BCD__ZNK4fltk5Style8textsizeEv(fltk::Style *This) {
return (This->textsize());
}
float _BCD__ZNK4fltk5Style7leadingEv(fltk::Style *This) {
return (This->leading());
}
unsigned char _BCD__ZNK4fltk5Style15scrollbar_alignEv(fltk::Style *This) {
return (This->scrollbar_align());
}
unsigned char _BCD__ZNK4fltk5Style15scrollbar_widthEv(fltk::Style *This) {
return (This->scrollbar_width());
}
bool _BCD__ZNK4fltk5Style15hide_underscoreEv(fltk::Style *This) {
return (This->hide_underscore());
}
bool _BCD__ZNK4fltk5Style19draw_boxes_inactiveEv(fltk::Style *This) {
return (This->draw_boxes_inactive());
}
int _BCD__ZNK4fltk5Style18wheel_scroll_linesEv(fltk::Style *This) {
return (This->wheel_scroll_lines());
}
void _BCD__ZN4fltk5Style3boxEPNS_6SymbolE(fltk::Style *This, _BCD__204_Box v) {
(This->box(v));
}
void _BCD__ZN4fltk5Style9buttonboxEPNS_6SymbolE(fltk::Style *This, _BCD__204_Box v) {
(This->buttonbox(v));
}
void _BCD__ZN4fltk5Style5glyphEPNS_6SymbolE(fltk::Style *This, fltk::Symbol * v) {
(This->glyph(v));
}
void _BCD__ZN4fltk5Style9labelfontEPNS_4FontE(fltk::Style *This, fltk::Font * v) {
(This->labelfont(v));
}
void _BCD__ZN4fltk5Style8textfontEPNS_4FontE(fltk::Style *This, fltk::Font * v) {
(This->textfont(v));
}
void _BCD__ZN4fltk5Style9labeltypeEPNS_9LabelTypeE(fltk::Style *This, fltk::LabelType * v) {
(This->labeltype(v));
}
void _BCD__ZN4fltk5Style5colorEj(fltk::Style *This, _BCD__221_Color v) {
(This->color(v));
}
void _BCD__ZN4fltk5Style9textcolorEj(fltk::Style *This, _BCD__221_Color v) {
(This->textcolor(v));
}
void _BCD__ZN4fltk5Style15selection_colorEj(fltk::Style *This, _BCD__221_Color v) {
(This->selection_color(v));
}
void _BCD__ZN4fltk5Style19selection_textcolorEj(fltk::Style *This, _BCD__221_Color v) {
(This->selection_textcolor(v));
}
void _BCD__ZN4fltk5Style11buttoncolorEj(fltk::Style *This, _BCD__221_Color v) {
(This->buttoncolor(v));
}
void _BCD__ZN4fltk5Style10labelcolorEj(fltk::Style *This, _BCD__221_Color v) {
(This->labelcolor(v));
}
void _BCD__ZN4fltk5Style15highlight_colorEj(fltk::Style *This, _BCD__221_Color v) {
(This->highlight_color(v));
}
void _BCD__ZN4fltk5Style19highlight_textcolorEj(fltk::Style *This, _BCD__221_Color v) {
(This->highlight_textcolor(v));
}
void _BCD__ZN4fltk5Style9labelsizeEf(fltk::Style *This, float v) {
(This->labelsize(v));
}
void _BCD__ZN4fltk5Style8textsizeEf(fltk::Style *This, float v) {
(This->textsize(v));
}
void _BCD__ZN4fltk5Style7leadingEf(fltk::Style *This, float v) {
(This->leading(v));
}
void _BCD__ZN4fltk5Style15scrollbar_alignEh(fltk::Style *This, unsigned char v) {
(This->scrollbar_align(v));
}
void _BCD__ZN4fltk5Style15scrollbar_widthEh(fltk::Style *This, unsigned char v) {
(This->scrollbar_width(v));
}
void _BCD__ZN4fltk5Style15hide_underscoreEb(fltk::Style *This, bool v) {
(This->hide_underscore(v));
}
void _BCD__ZN4fltk5Style19draw_boxes_inactiveEb(fltk::Style *This, bool v) {
(This->draw_boxes_inactive(v));
}
void _BCD__ZN4fltk5Style18wheel_scroll_linesEi(fltk::Style *This, int v) {
(This->wheel_scroll_lines(v));
}
fltk::Style *_BCD_new__ZN4fltk5StyleC1Ev() {
return new fltk::Style();
}
bool _BCD__ZNK4fltk5Style7dynamicEv(fltk::Style *This) {
return (This->dynamic());
}
fltk::Style * _BCD__ZN4fltk5Style4findEPKc(char const * name) {
return (fltk::Style::find(name));
}
}
class Style_R : fltk::Style {
public:
void *__D_data;
Style_R() : fltk::Style() {}
};
extern "C" {
Style_R *_BCD_new__ZN4fltk5StyleC1Ev_R() {
return new Style_R();
}
void _BCD_delete_N4fltk5StyleE__Style_R(Style_R *This) {
delete This;
}
void _BCD_RI_N4fltk5StyleE(Style_R *cd, void *dd) {
cd->__D_data = dd;
}
bool _BCD__ZN4fltk11reset_themeEv() {
return (fltk::reset_theme());
}
void _BCD__ZN4fltk12reload_themeEv() {
(fltk::reload_theme());
}
void _BCD__ZN4fltk10load_themeEv() {
(fltk::load_theme());
}
typedef bool (*_BCD_func__228)();
typedef _BCD_func__228 _BCD__151_Theme;
void _BCD__ZN4fltk5themeEPFbvE(_BCD__151_Theme f) {
(fltk::theme(f));
}
_BCD__151_Theme _BCD__ZN4fltk5themeEv() {
return (fltk::theme());
}
void _BCD_set__ZN4fltk6theme_E(_BCD__151_Theme x) {
fltk::theme_ = x;
}
_BCD__151_Theme _BCD_get__ZN4fltk6theme_E() {
return fltk::theme_;
}
fltk::LabelType * const _BCD_get__ZN4fltk14EMBOSSED_LABELE() {
return fltk::EMBOSSED_LABEL;
}
fltk::LabelType * const _BCD_get__ZN4fltk14ENGRAVED_LABELE() {
return fltk::ENGRAVED_LABEL;
}
fltk::LabelType * const _BCD_get__ZN4fltk12SHADOW_LABELE() {
return fltk::SHADOW_LABEL;
}
fltk::LabelType * const _BCD_get__ZN4fltk12SYMBOL_LABELE() {
return fltk::SYMBOL_LABEL;
}
fltk::LabelType * const _BCD_get__ZN4fltk12NORMAL_LABELE() {
return fltk::NORMAL_LABEL;
}
fltk::LabelType * const _BCD_get__ZN4fltk8NO_LABELE() {
return fltk::NO_LABEL;
}
fltk::Font * const _BCD_get__ZN4fltk13ZAPF_DINGBATSE() {
return fltk::ZAPF_DINGBATS;
}
fltk::Font * const _BCD_get__ZN4fltk16SCREEN_BOLD_FONTE() {
return fltk::SCREEN_BOLD_FONT;
}
fltk::Font * const _BCD_get__ZN4fltk11SCREEN_FONTE() {
return fltk::SCREEN_FONT;
}
fltk::Font * const _BCD_get__ZN4fltk11SYMBOL_FONTE() {
return fltk::SYMBOL_FONT;
}
fltk::Font * const _BCD_get__ZN4fltk17TIMES_BOLD_ITALICE() {
return fltk::TIMES_BOLD_ITALIC;
}
fltk::Font * const _BCD_get__ZN4fltk12TIMES_ITALICE() {
return fltk::TIMES_ITALIC;
}
fltk::Font * const _BCD_get__ZN4fltk10TIMES_BOLDE() {
return fltk::TIMES_BOLD;
}
fltk::Font * const _BCD_get__ZN4fltk5TIMESE() {
return fltk::TIMES;
}
fltk::Font * const _BCD_get__ZN4fltk19COURIER_BOLD_ITALICE() {
return fltk::COURIER_BOLD_ITALIC;
}
fltk::Font * const _BCD_get__ZN4fltk14COURIER_ITALICE() {
return fltk::COURIER_ITALIC;
}
fltk::Font * const _BCD_get__ZN4fltk12COURIER_BOLDE() {
return fltk::COURIER_BOLD;
}
fltk::Font * const _BCD_get__ZN4fltk7COURIERE() {
return fltk::COURIER;
}
fltk::Font * const _BCD_get__ZN4fltk21HELVETICA_BOLD_ITALICE() {
return fltk::HELVETICA_BOLD_ITALIC;
}
fltk::Font * const _BCD_get__ZN4fltk16HELVETICA_ITALICE() {
return fltk::HELVETICA_ITALIC;
}
fltk::Font * const _BCD_get__ZN4fltk14HELVETICA_BOLDE() {
return fltk::HELVETICA_BOLD;
}
fltk::Font * const _BCD_get__ZN4fltk9HELVETICAE() {
return fltk::HELVETICA;
}
_BCD__204_Box const _BCD_get__ZN4fltk16PLASTIC_DOWN_BOXE() {
return fltk::PLASTIC_DOWN_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk14PLASTIC_UP_BOXE() {
return fltk::PLASTIC_UP_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk12BORDER_FRAMEE() {
return fltk::BORDER_FRAME;
}
_BCD__204_Box const _BCD_get__ZN4fltk9OFLAT_BOXE() {
return fltk::OFLAT_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk11OSHADOW_BOXE() {
return fltk::OSHADOW_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk8OVAL_BOXE() {
return fltk::OVAL_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk9RFLAT_BOXE() {
return fltk::RFLAT_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk11RSHADOW_BOXE() {
return fltk::RSHADOW_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk11ROUNDED_BOXE() {
return fltk::ROUNDED_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk10SHADOW_BOXE() {
return fltk::SHADOW_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk6NO_BOXE() {
return fltk::NO_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk16DIAMOND_DOWN_BOXE() {
return fltk::DIAMOND_DOWN_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk14DIAMOND_UP_BOXE() {
return fltk::DIAMOND_UP_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk14ROUND_DOWN_BOXE() {
return fltk::ROUND_DOWN_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk12ROUND_UP_BOXE() {
return fltk::ROUND_UP_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk18HIGHLIGHT_DOWN_BOXE() {
return fltk::HIGHLIGHT_DOWN_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk16HIGHLIGHT_UP_BOXE() {
return fltk::HIGHLIGHT_UP_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk8FLAT_BOXE() {
return fltk::FLAT_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk10BORDER_BOXE() {
return fltk::BORDER_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk12EMBOSSED_BOXE() {
return fltk::EMBOSSED_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk12ENGRAVED_BOXE() {
return fltk::ENGRAVED_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk13THIN_DOWN_BOXE() {
return fltk::THIN_DOWN_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk11THIN_UP_BOXE() {
return fltk::THIN_UP_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk8DOWN_BOXE() {
return fltk::DOWN_BOX;
}
_BCD__204_Box const _BCD_get__ZN4fltk6UP_BOXE() {
return fltk::UP_BOX;
}
typedef int _BCD__224_Flags;
typedef _BCD__224_Flags _BCD__223_Align;
}
