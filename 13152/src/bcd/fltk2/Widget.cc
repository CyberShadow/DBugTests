/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/Widget.h"
extern "C" {
typedef unsigned char _BCD__6_uchar;
void _BCD_delete_N4fltk6WidgetE(fltk::Widget *This) {
delete This;
}
void _BCD_set__ZN4fltk6Widget13default_styleE(fltk::Widget *This, fltk::NamedStyle * x) {
This->default_style = x;
}
fltk::NamedStyle * _BCD_get__ZN4fltk6Widget13default_styleE(fltk::Widget *This) {
return This->default_style;
}
void _BCD_set__ZN4fltk6Widget13default_glyphE(fltk::Widget *This, fltk::Symbol * x) {
This->default_glyph = x;
}
fltk::Symbol * _BCD_get__ZN4fltk6Widget13default_glyphE(fltk::Widget *This) {
return This->default_glyph;
}
fltk::Widget *_BCD_new__ZN4fltk6WidgetC1EiiiiPKc(int _0, int _1, int _2, int _3, char const * _4) {
return new fltk::Widget(_0, _1, _2, _3, _4);
}
void _BCD__ZN4fltk6Widget4drawEv(fltk::Widget *This) {
(This->draw());
}
int _BCD__ZN4fltk6Widget6handleEi(fltk::Widget *This, int _0) {
return (This->handle(_0));
}
int _BCD__ZN4fltk6Widget4sendEi(fltk::Widget *This, int event) {
return (This->send(event));
}
void _BCD__ZN4fltk6Widget6layoutEv(fltk::Widget *This) {
(This->layout());
}
fltk::Style const * _BCD__ZNK4fltk6Widget5styleEv(fltk::Widget *This) {
return (This->style());
}
void _BCD__ZN4fltk6Widget5styleEPKNS_5StyleE(fltk::Widget *This, fltk::Style const * s) {
(This->style(s));
}
bool _BCD__ZN4fltk6Widget10copy_styleEPKNS_5StyleE(fltk::Widget *This, fltk::Style const * s) {
return (This->copy_style(s));
}
fltk::Group * _BCD__ZNK4fltk6Widget6parentEv(fltk::Widget *This) {
return (This->parent());
}
void _BCD__ZN4fltk6Widget6parentEPNS_5GroupE(fltk::Widget *This, fltk::Group * w) {
(This->parent(w));
}
fltk::Window * _BCD__ZNK4fltk6Widget6windowEv(fltk::Widget *This) {
return (This->window());
}
_BCD__6_uchar _BCD__ZNK4fltk6Widget4typeEv(fltk::Widget *This) {
return (This->type());
}
void _BCD__ZN4fltk6Widget4typeEh(fltk::Widget *This, _BCD__6_uchar t) {
(This->type(t));
}
bool _BCD__ZNK4fltk6Widget8is_groupEv(fltk::Widget *This) {
return (This->is_group());
}
bool _BCD__ZNK4fltk6Widget9is_windowEv(fltk::Widget *This) {
return (This->is_window());
}
bool _BCD__ZN4fltk6Widget6resizeEiiii(fltk::Widget *This, int x, int y, int w, int h) {
return (This->resize(x, y, w, h));
}
bool _BCD__ZN4fltk6Widget8positionEii(fltk::Widget *This, int x, int y) {
return (This->position(x, y));
}
bool _BCD__ZN4fltk6Widget6resizeEii(fltk::Widget *This, int w, int h) {
return (This->resize(w, h));
}
void _BCD__ZNK4fltk6Widget17get_absolute_rectEPNS_9RectangleE(fltk::Widget *This, fltk::Rectangle * rect) {
(This->get_absolute_rect(rect));
}
char const * _BCD__ZNK4fltk6Widget5labelEv(fltk::Widget *This) {
return (This->label());
}
void _BCD__ZN4fltk6Widget5labelEPKc(fltk::Widget *This, char const * a) {
(This->label(a));
}
void _BCD__ZN4fltk6Widget10copy_labelEPKc(fltk::Widget *This, char const * a) {
(This->copy_label(a));
}
fltk::Symbol const * _BCD__ZNK4fltk6Widget5imageEv(fltk::Widget *This) {
return (This->image());
}
void _BCD__ZN4fltk6Widget5imageEPKNS_6SymbolE(fltk::Widget *This, fltk::Symbol const * a) {
(This->image(a));
}
char const * _BCD__ZNK4fltk6Widget7tooltipEv(fltk::Widget *This) {
return (This->tooltip());
}
void _BCD__ZN4fltk6Widget7tooltipEPKc(fltk::Widget *This, char const * t) {
(This->tooltip(t));
}
unsigned int _BCD__ZNK4fltk6Widget8shortcutEv(fltk::Widget *This) {
return (This->shortcut());
}
bool _BCD__ZN4fltk6Widget8shortcutEj(fltk::Widget *This, unsigned int key) {
return (This->shortcut(key));
}
bool _BCD__ZN4fltk6Widget12add_shortcutEj(fltk::Widget *This, unsigned int key) {
return (This->add_shortcut(key));
}
bool _BCD__ZN4fltk6Widget15remove_shortcutEj(fltk::Widget *This, unsigned int key) {
return (This->remove_shortcut(key));
}
bool _BCD__ZN4fltk6Widget16remove_shortcutsEv(fltk::Widget *This) {
return (This->remove_shortcuts());
}
unsigned int _BCD__ZNK4fltk6Widget14label_shortcutEv(fltk::Widget *This) {
return (This->label_shortcut());
}
bool _BCD__ZNK4fltk6Widget19test_label_shortcutEv(fltk::Widget *This) {
return (This->test_label_shortcut());
}
bool _BCD__ZNK4fltk6Widget13test_shortcutEv(fltk::Widget *This) {
return (This->test_shortcut());
}
bool _BCD__ZNK4fltk6Widget13test_shortcutEb(fltk::Widget *This, bool _0) {
return (This->test_shortcut(_0));
}
typedef void (*_BCD_func__154)(fltk::Widget *, void *);
typedef _BCD_func__154 _BCD__155_Callback;
typedef _BCD__155_Callback _BCD__153_Callback_p;
_BCD__153_Callback_p _BCD__ZNK4fltk6Widget8callbackEv(fltk::Widget *This) {
return (This->callback());
}
void _BCD__ZN4fltk6Widget8callbackEPFvPS0_PvES2_(fltk::Widget *This, _BCD__155_Callback c, void * p) {
(This->callback(c, p));
}
void _BCD__ZN4fltk6Widget8callbackEPFvPS0_PvE(fltk::Widget *This, _BCD__155_Callback c) {
(This->callback(c));
}
typedef void (*_BCD_func__150)(fltk::Widget *);
typedef _BCD_func__150 _BCD__151_Callback0;
void _BCD__ZN4fltk6Widget8callbackEPFvPS0_E(fltk::Widget *This, _BCD__151_Callback0 c) {
(This->callback(c));
}
typedef void (*_BCD_func__148)(fltk::Widget *, long int);
typedef _BCD_func__148 _BCD__149_Callback1;
void _BCD__ZN4fltk6Widget8callbackEPFvPS0_lEl(fltk::Widget *This, _BCD__149_Callback1 c, long int p) {
(This->callback(c, p));
}
void * _BCD__ZNK4fltk6Widget9user_dataEv(fltk::Widget *This) {
return (This->user_data());
}
void _BCD__ZN4fltk6Widget9user_dataEPv(fltk::Widget *This, void * v) {
(This->user_data(v));
}
long int _BCD__ZNK4fltk6Widget8argumentEv(fltk::Widget *This) {
return (This->argument());
}
void _BCD__ZN4fltk6Widget8argumentEl(fltk::Widget *This, long int v) {
(This->argument(v));
}
_BCD__6_uchar _BCD__ZNK4fltk6Widget4whenEv(fltk::Widget *This) {
return (This->when());
}
void _BCD__ZN4fltk6Widget4whenEh(fltk::Widget *This, _BCD__6_uchar i) {
(This->when(i));
}
void _BCD__ZN4fltk6Widget16default_callbackEPS0_Pv(fltk::Widget * _0, void * _1) {
(fltk::Widget::default_callback(_0, _1));
}
void _BCD__ZN4fltk6Widget11do_callbackEv(fltk::Widget *This) {
(This->do_callback());
}
void _BCD__ZN4fltk6Widget11do_callbackEPS0_Pv(fltk::Widget *This, fltk::Widget * o, void * arg) {
(This->do_callback(o, arg));
}
void _BCD__ZN4fltk6Widget11do_callbackEPS0_l(fltk::Widget *This, fltk::Widget * o, long int arg) {
(This->do_callback(o, arg));
}
bool _BCD__ZNK4fltk6Widget8containsEPKS0_(fltk::Widget *This, fltk::Widget const * _0) {
return (This->contains(_0));
}
bool _BCD__ZNK4fltk6Widget6insideEPKS0_(fltk::Widget *This, fltk::Widget const * o) {
return (This->inside(o));
}
bool _BCD__ZNK4fltk6Widget6pushedEv(fltk::Widget *This) {
return (This->pushed());
}
bool _BCD__ZNK4fltk6Widget7focusedEv(fltk::Widget *This) {
return (This->focused());
}
bool _BCD__ZNK4fltk6Widget10belowmouseEv(fltk::Widget *This) {
return (This->belowmouse());
}
typedef int _BCD__239_Flags;
_BCD__239_Flags _BCD__ZNK4fltk6Widget5flagsEv(fltk::Widget *This) {
return (This->flags());
}
void _BCD__ZN4fltk6Widget5flagsEi(fltk::Widget *This, _BCD__239_Flags f) {
(This->flags(f));
}
void _BCD__ZN4fltk6Widget8set_flagEj(fltk::Widget *This, unsigned int f) {
(This->set_flag(f));
}
void _BCD__ZN4fltk6Widget10clear_flagEj(fltk::Widget *This, unsigned int f) {
(This->clear_flag(f));
}
void _BCD__ZN4fltk6Widget11invert_flagEj(fltk::Widget *This, unsigned int f) {
(This->invert_flag(f));
}
void _BCD__ZN4fltk6Widget8set_flagEjb(fltk::Widget *This, unsigned int f, bool b) {
(This->set_flag(f, b));
}
bool _BCD__ZNK4fltk6Widget4flagEj(fltk::Widget *This, unsigned int f) {
return (This->flag(f));
}
bool _BCD__ZNK4fltk6Widget6any_ofEj(fltk::Widget *This, unsigned int f) {
return (This->any_of(f));
}
bool _BCD__ZNK4fltk6Widget6all_ofEj(fltk::Widget *This, unsigned int f) {
return (This->all_of(f));
}
bool _BCD__ZNK4fltk6Widget5stateEv(fltk::Widget *This) {
return (This->state());
}
bool _BCD__ZN4fltk6Widget5stateEb(fltk::Widget *This, bool _0) {
return (This->state(_0));
}
bool _BCD__ZN4fltk6Widget3setEv(fltk::Widget *This) {
return (This->set());
}
bool _BCD__ZN4fltk6Widget5clearEv(fltk::Widget *This) {
return (This->clear());
}
void _BCD__ZN4fltk6Widget7setonlyEv(fltk::Widget *This) {
(This->setonly());
}
_BCD__239_Flags _BCD__ZNK4fltk6Widget5alignEv(fltk::Widget *This) {
return (This->align());
}
void _BCD__ZN4fltk6Widget5alignEj(fltk::Widget *This, unsigned int a) {
(This->align(a));
}
bool _BCD__ZNK4fltk6Widget7visibleEv(fltk::Widget *This) {
return (This->visible());
}
bool _BCD__ZNK4fltk6Widget9visible_rEv(fltk::Widget *This) {
return (This->visible_r());
}
void _BCD__ZN4fltk6Widget4showEv(fltk::Widget *This) {
(This->show());
}
void _BCD__ZN4fltk6Widget4hideEv(fltk::Widget *This) {
(This->hide());
}
void _BCD__ZN4fltk6Widget11set_visibleEv(fltk::Widget *This) {
(This->set_visible());
}
void _BCD__ZN4fltk6Widget13clear_visibleEv(fltk::Widget *This) {
(This->clear_visible());
}
bool _BCD__ZNK4fltk6Widget6activeEv(fltk::Widget *This) {
return (This->active());
}
bool _BCD__ZNK4fltk6Widget8active_rEv(fltk::Widget *This) {
return (This->active_r());
}
void _BCD__ZN4fltk6Widget8activateEv(fltk::Widget *This) {
(This->activate());
}
void _BCD__ZN4fltk6Widget8activateEi(fltk::Widget *This, int b) {
(This->activate(b));
}
void _BCD__ZN4fltk6Widget10deactivateEv(fltk::Widget *This) {
(This->deactivate());
}
bool _BCD__ZNK4fltk6Widget6outputEv(fltk::Widget *This) {
return (This->output());
}
void _BCD__ZN4fltk6Widget10set_outputEv(fltk::Widget *This) {
(This->set_output());
}
void _BCD__ZN4fltk6Widget12clear_outputEv(fltk::Widget *This) {
(This->clear_output());
}
bool _BCD__ZNK4fltk6Widget11takeseventsEv(fltk::Widget *This) {
return (This->takesevents());
}
bool _BCD__ZNK4fltk6Widget7changedEv(fltk::Widget *This) {
return (This->changed());
}
void _BCD__ZN4fltk6Widget11set_changedEv(fltk::Widget *This) {
(This->set_changed());
}
void _BCD__ZN4fltk6Widget13clear_changedEv(fltk::Widget *This) {
(This->clear_changed());
}
bool _BCD__ZNK4fltk6Widget8selectedEv(fltk::Widget *This) {
return (This->selected());
}
void _BCD__ZN4fltk6Widget12set_selectedEv(fltk::Widget *This) {
(This->set_selected());
}
void _BCD__ZN4fltk6Widget14clear_selectedEv(fltk::Widget *This) {
(This->clear_selected());
}
bool _BCD__ZN4fltk6Widget14click_to_focusEv(fltk::Widget *This) {
return (This->click_to_focus());
}
void _BCD__ZN4fltk6Widget18set_click_to_focusEv(fltk::Widget *This) {
(This->set_click_to_focus());
}
void _BCD__ZN4fltk6Widget20clear_click_to_focusEv(fltk::Widget *This) {
(This->clear_click_to_focus());
}
bool _BCD__ZN4fltk6Widget12tab_to_focusEv(fltk::Widget *This) {
return (This->tab_to_focus());
}
void _BCD__ZN4fltk6Widget16set_tab_to_focusEv(fltk::Widget *This) {
(This->set_tab_to_focus());
}
void _BCD__ZN4fltk6Widget18clear_tab_to_focusEv(fltk::Widget *This) {
(This->clear_tab_to_focus());
}
bool _BCD__ZNK4fltk6Widget10horizontalEv(fltk::Widget *This) {
return (This->horizontal());
}
bool _BCD__ZNK4fltk6Widget8verticalEv(fltk::Widget *This) {
return (This->vertical());
}
void _BCD__ZN4fltk6Widget14set_horizontalEv(fltk::Widget *This) {
(This->set_horizontal());
}
void _BCD__ZN4fltk6Widget12set_verticalEv(fltk::Widget *This) {
(This->set_vertical());
}
bool _BCD__ZN4fltk6Widget10take_focusEv(fltk::Widget *This) {
return (This->take_focus());
}
void _BCD__ZN4fltk6Widget11throw_focusEv(fltk::Widget *This) {
(This->throw_focus());
}
void _BCD__ZN4fltk6Widget6redrawEv(fltk::Widget *This) {
(This->redraw());
}
void _BCD__ZN4fltk6Widget6redrawEh(fltk::Widget *This, _BCD__6_uchar c) {
(This->redraw(c));
}
void _BCD__ZN4fltk6Widget12redraw_labelEv(fltk::Widget *This) {
(This->redraw_label());
}
void _BCD__ZN4fltk6Widget16redraw_highlightEv(fltk::Widget *This) {
(This->redraw_highlight());
}
void _BCD__ZN4fltk6Widget6redrawERKNS_9RectangleE(fltk::Widget *This, fltk::Rectangle   const & _0) {
(This->redraw(_0));
}
_BCD__6_uchar _BCD__ZNK4fltk6Widget6damageEv(fltk::Widget *This) {
return (This->damage());
}
void _BCD__ZN4fltk6Widget10set_damageEh(fltk::Widget *This, _BCD__6_uchar c) {
(This->set_damage(c));
}
void _BCD__ZN4fltk6Widget8relayoutEv(fltk::Widget *This) {
(This->relayout());
}
void _BCD__ZN4fltk6Widget8relayoutEh(fltk::Widget *This, _BCD__6_uchar damage) {
(This->relayout(damage));
}
_BCD__6_uchar _BCD__ZNK4fltk6Widget13layout_damageEv(fltk::Widget *This) {
return (This->layout_damage());
}
void _BCD__ZN4fltk6Widget13layout_damageEh(fltk::Widget *This, _BCD__6_uchar c) {
(This->layout_damage(c));
}
void _BCD__ZN4fltk6Widget11add_timeoutEf(fltk::Widget *This, float _0) {
(This->add_timeout(_0));
}
void _BCD__ZN4fltk6Widget14repeat_timeoutEf(fltk::Widget *This, float _0) {
(This->repeat_timeout(_0));
}
void _BCD__ZN4fltk6Widget14remove_timeoutEv(fltk::Widget *This) {
(This->remove_timeout());
}
void _BCD__ZNK4fltk6Widget12make_currentEv(fltk::Widget *This) {
(This->make_current());
}
void _BCD__ZNK4fltk6Widget15draw_backgroundEv(fltk::Widget *This) {
(This->draw_background());
}
void _BCD__ZNK4fltk6Widget10draw_frameEv(fltk::Widget *This) {
(This->draw_frame());
}
void _BCD__ZNK4fltk6Widget8draw_boxEv(fltk::Widget *This) {
(This->draw_box());
}
void _BCD__ZNK4fltk6Widget8draw_boxERKNS_9RectangleE(fltk::Widget *This, fltk::Rectangle   const & r) {
(This->draw_box(r));
}
void _BCD__ZNK4fltk6Widget10draw_labelEv(fltk::Widget *This) {
(This->draw_label());
}
void _BCD__ZNK4fltk6Widget10draw_labelERKNS_9RectangleEi(fltk::Widget *This, fltk::Rectangle   const & _0, _BCD__239_Flags _1) {
(This->draw_label(_0, _1));
}
void _BCD__ZNK4fltk6Widget10draw_glyphEiRKNS_9RectangleE(fltk::Widget *This, int _0, fltk::Rectangle   const & _1) {
(This->draw_glyph(_0, _1));
}
void _BCD__ZNK4fltk6Widget6cursorEPNS_6CursorE(fltk::Widget *This, fltk::Cursor * _0) {
(This->cursor(_0));
}
void _BCD__ZNK4fltk6Widget13measure_labelERiS1_(fltk::Widget *This, int & _0, int & _1) {
(This->measure_label(_0, _1));
}
typedef fltk::Symbol * _BCD__219_Box;
_BCD__219_Box _BCD__ZNK4fltk6Widget3boxEv(fltk::Widget *This) {
return (This->box());
}
_BCD__219_Box _BCD__ZNK4fltk6Widget9buttonboxEv(fltk::Widget *This) {
return (This->buttonbox());
}
fltk::Symbol * _BCD__ZNK4fltk6Widget5glyphEv(fltk::Widget *This) {
return (This->glyph());
}
fltk::Font * _BCD__ZNK4fltk6Widget9labelfontEv(fltk::Widget *This) {
return (This->labelfont());
}
fltk::Font * _BCD__ZNK4fltk6Widget8textfontEv(fltk::Widget *This) {
return (This->textfont());
}
fltk::LabelType * _BCD__ZNK4fltk6Widget9labeltypeEv(fltk::Widget *This) {
return (This->labeltype());
}
typedef unsigned int _BCD__236_Color;
_BCD__236_Color _BCD__ZNK4fltk6Widget5colorEv(fltk::Widget *This) {
return (This->color());
}
_BCD__236_Color _BCD__ZNK4fltk6Widget9textcolorEv(fltk::Widget *This) {
return (This->textcolor());
}
_BCD__236_Color _BCD__ZNK4fltk6Widget15selection_colorEv(fltk::Widget *This) {
return (This->selection_color());
}
_BCD__236_Color _BCD__ZNK4fltk6Widget19selection_textcolorEv(fltk::Widget *This) {
return (This->selection_textcolor());
}
_BCD__236_Color _BCD__ZNK4fltk6Widget11buttoncolorEv(fltk::Widget *This) {
return (This->buttoncolor());
}
_BCD__236_Color _BCD__ZNK4fltk6Widget10labelcolorEv(fltk::Widget *This) {
return (This->labelcolor());
}
_BCD__236_Color _BCD__ZNK4fltk6Widget15highlight_colorEv(fltk::Widget *This) {
return (This->highlight_color());
}
_BCD__236_Color _BCD__ZNK4fltk6Widget19highlight_textcolorEv(fltk::Widget *This) {
return (This->highlight_textcolor());
}
float _BCD__ZNK4fltk6Widget9labelsizeEv(fltk::Widget *This) {
return (This->labelsize());
}
float _BCD__ZNK4fltk6Widget8textsizeEv(fltk::Widget *This) {
return (This->textsize());
}
float _BCD__ZNK4fltk6Widget7leadingEv(fltk::Widget *This) {
return (This->leading());
}
unsigned char _BCD__ZNK4fltk6Widget15scrollbar_alignEv(fltk::Widget *This) {
return (This->scrollbar_align());
}
unsigned char _BCD__ZNK4fltk6Widget15scrollbar_widthEv(fltk::Widget *This) {
return (This->scrollbar_width());
}
void _BCD__ZN4fltk6Widget3boxEPNS_6SymbolE(fltk::Widget *This, _BCD__219_Box _0) {
(This->box(_0));
}
void _BCD__ZN4fltk6Widget9buttonboxEPNS_6SymbolE(fltk::Widget *This, _BCD__219_Box _0) {
(This->buttonbox(_0));
}
void _BCD__ZN4fltk6Widget5glyphEPNS_6SymbolE(fltk::Widget *This, fltk::Symbol * _0) {
(This->glyph(_0));
}
void _BCD__ZN4fltk6Widget9labelfontEPNS_4FontE(fltk::Widget *This, fltk::Font * _0) {
(This->labelfont(_0));
}
void _BCD__ZN4fltk6Widget8textfontEPNS_4FontE(fltk::Widget *This, fltk::Font * _0) {
(This->textfont(_0));
}
void _BCD__ZN4fltk6Widget9labeltypeEPNS_9LabelTypeE(fltk::Widget *This, fltk::LabelType * _0) {
(This->labeltype(_0));
}
void _BCD__ZN4fltk6Widget5colorEj(fltk::Widget *This, _BCD__236_Color _0) {
(This->color(_0));
}
void _BCD__ZN4fltk6Widget9textcolorEj(fltk::Widget *This, _BCD__236_Color a) {
(This->textcolor(a));
}
void _BCD__ZN4fltk6Widget15selection_colorEj(fltk::Widget *This, _BCD__236_Color _0) {
(This->selection_color(_0));
}
void _BCD__ZN4fltk6Widget19selection_textcolorEj(fltk::Widget *This, _BCD__236_Color _0) {
(This->selection_textcolor(_0));
}
void _BCD__ZN4fltk6Widget11buttoncolorEj(fltk::Widget *This, _BCD__236_Color _0) {
(This->buttoncolor(_0));
}
void _BCD__ZN4fltk6Widget10labelcolorEj(fltk::Widget *This, _BCD__236_Color _0) {
(This->labelcolor(_0));
}
void _BCD__ZN4fltk6Widget15highlight_colorEj(fltk::Widget *This, _BCD__236_Color _0) {
(This->highlight_color(_0));
}
void _BCD__ZN4fltk6Widget19highlight_textcolorEj(fltk::Widget *This, _BCD__236_Color _0) {
(This->highlight_textcolor(_0));
}
void _BCD__ZN4fltk6Widget9labelsizeEf(fltk::Widget *This, float a) {
(This->labelsize(a));
}
void _BCD__ZN4fltk6Widget8textsizeEf(fltk::Widget *This, float a) {
(This->textsize(a));
}
void _BCD__ZN4fltk6Widget7leadingEf(fltk::Widget *This, float a) {
(This->leading(a));
}
void _BCD__ZN4fltk6Widget15scrollbar_alignEh(fltk::Widget *This, unsigned char _0) {
(This->scrollbar_align(_0));
}
void _BCD__ZN4fltk6Widget15scrollbar_widthEh(fltk::Widget *This, unsigned char _0) {
(This->scrollbar_width(_0));
}
int _BCD_R__ZN4fltk6Widget4drawEv__Widget_R_CHECK(void *);
void _BCD_R__ZN4fltk6Widget4drawEv__Widget_R(void *);
int _BCD_R__ZN4fltk6Widget6handleEi__Widget_R_CHECK(void *);
int _BCD_R__ZN4fltk6Widget6handleEi__Widget_R(void *, int _0);
int _BCD_R__ZN4fltk6Widget6layoutEv__Widget_R_CHECK(void *);
void _BCD_R__ZN4fltk6Widget6layoutEv__Widget_R(void *);
}
class Widget_R : fltk::Widget {
public:
void *__D_data;
Widget_R(int _0, int _1, int _2, int _3, char const * _4) : fltk::Widget(_0, _1, _2, _3, _4) {}
void draw() {
if (_BCD_R__ZN4fltk6Widget4drawEv__Widget_R_CHECK(__D_data))
_BCD_R__ZN4fltk6Widget4drawEv__Widget_R(__D_data);
else
fltk::Widget::draw();
}
int handle(int _0) {
if (_BCD_R__ZN4fltk6Widget6handleEi__Widget_R_CHECK(__D_data))
return _BCD_R__ZN4fltk6Widget6handleEi__Widget_R(__D_data, _0);
else
return fltk::Widget::handle(_0);
}
void layout() {
if (_BCD_R__ZN4fltk6Widget6layoutEv__Widget_R_CHECK(__D_data))
_BCD_R__ZN4fltk6Widget6layoutEv__Widget_R(__D_data);
else
fltk::Widget::layout();
}
};
extern "C" {
Widget_R *_BCD_new__ZN4fltk6WidgetC1EiiiiPKc_R(int _0, int _1, int _2, int _3, char const * _4) {
return new Widget_R(_0, _1, _2, _3, _4);
}
void _BCD_delete_N4fltk6WidgetE__Widget_R(Widget_R *This) {
delete This;
}
void _BCD_RI_N4fltk6WidgetE(Widget_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef bool (*_BCD_func__248)();
typedef _BCD_func__248 _BCD__166_Theme;
typedef _BCD__239_Flags _BCD__238_Align;
}
