/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/TextDisplay.h"
extern "C" {
typedef unsigned char _BCD__11_uchar;
void _BCD_delete_N4fltk11TextDisplay15StyleTableEntryE(fltk::TextDisplay::StyleTableEntry *This) {
delete This;
}
typedef unsigned int _BCD__364_Color;
void _BCD_set__ZN4fltk11TextDisplay15StyleTableEntry5colorE(fltk::TextDisplay::StyleTableEntry *This, _BCD__364_Color x) {
This->color = x;
}
_BCD__364_Color _BCD_get__ZN4fltk11TextDisplay15StyleTableEntry5colorE(fltk::TextDisplay::StyleTableEntry *This) {
return This->color;
}
void _BCD_set__ZN4fltk11TextDisplay15StyleTableEntry4fontE(fltk::TextDisplay::StyleTableEntry *This, fltk::Font * x) {
This->font = x;
}
fltk::Font * _BCD_get__ZN4fltk11TextDisplay15StyleTableEntry4fontE(fltk::TextDisplay::StyleTableEntry *This) {
return This->font;
}
void _BCD_set__ZN4fltk11TextDisplay15StyleTableEntry4sizeE(fltk::TextDisplay::StyleTableEntry *This, float x) {
This->size = x;
}
float _BCD_get__ZN4fltk11TextDisplay15StyleTableEntry4sizeE(fltk::TextDisplay::StyleTableEntry *This) {
return This->size;
}
void _BCD_set__ZN4fltk11TextDisplay15StyleTableEntry4attrE(fltk::TextDisplay::StyleTableEntry *This, unsigned int x) {
This->attr = x;
}
unsigned int _BCD_get__ZN4fltk11TextDisplay15StyleTableEntry4attrE(fltk::TextDisplay::StyleTableEntry *This) {
return This->attr;
}
}
class StyleTableEntry_R : fltk::TextDisplay::StyleTableEntry {
public:
void *__D_data;
};
extern "C" {
void _BCD_delete_N4fltk11TextDisplay15StyleTableEntryE__StyleTableEntry_R(StyleTableEntry_R *This) {
delete This;
}
void _BCD_RI_N4fltk11TextDisplay15StyleTableEntryE(StyleTableEntry_R *cd, void *dd) {
cd->__D_data = dd;
}
void _BCD_delete_N4fltk11TextDisplayE(fltk::TextDisplay *This) {
delete This;
}
fltk::TextDisplay *_BCD_new__ZN4fltk11TextDisplayC1EiiiiPKc(int X, int Y, int W, int H, char const * l) {
return new fltk::TextDisplay(X, Y, W, H, l);
}
int _BCD__ZNK4fltk11TextDisplay4sizeEv(fltk::TextDisplay *This) {
return (This->size());
}
char const * _BCD__ZNK4fltk11TextDisplay4textEv(fltk::TextDisplay *This) {
return (This->text());
}
void _BCD__ZN4fltk11TextDisplay4textEPKc(fltk::TextDisplay *This, char const * v) {
(This->text(v));
}
void _BCD__ZN4fltk11TextDisplay11static_textEPKc(fltk::TextDisplay *This, char const * v) {
(This->static_text(v));
}
char _BCD__ZNK4fltk11TextDisplay2atEi(fltk::TextDisplay *This, int i) {
return (This->at(i));
}
int _BCD__ZN4fltk11TextDisplay6handleEi(fltk::TextDisplay *This, int e) {
return (This->handle(e));
}
void _BCD__ZN4fltk11TextDisplay4drawEv(fltk::TextDisplay *This) {
(This->draw());
}
void _BCD__ZN4fltk11TextDisplay6layoutEv(fltk::TextDisplay *This) {
(This->layout());
}
void _BCD__ZN4fltk11TextDisplay6bufferEPNS_10TextBufferE(fltk::TextDisplay *This, fltk::TextBuffer * buf) {
(This->buffer(buf));
}
fltk::TextBuffer * _BCD__ZN4fltk11TextDisplay6bufferEv(fltk::TextDisplay *This) {
return (This->buffer());
}
void _BCD__ZN4fltk11TextDisplay6appendEPKc(fltk::TextDisplay *This, char const * text) {
(This->append(text));
}
void _BCD__ZN4fltk11TextDisplay6insertEPKc(fltk::TextDisplay *This, char const * text) {
(This->insert(text));
}
void _BCD__ZN4fltk11TextDisplay10overstrikeEPKc(fltk::TextDisplay *This, char const * text) {
(This->overstrike(text));
}
void _BCD__ZN4fltk11TextDisplay15insert_positionEi(fltk::TextDisplay *This, int newPos) {
(This->insert_position(newPos));
}
int _BCD__ZNK4fltk11TextDisplay15insert_positionEv(fltk::TextDisplay *This) {
return (This->insert_position());
}
void _BCD__ZN4fltk11TextDisplay20show_insert_positionEv(fltk::TextDisplay *This) {
(This->show_insert_position());
}
void _BCD__ZN4fltk11TextDisplay11show_cursorEb(fltk::TextDisplay *This, bool b) {
(This->show_cursor(b));
}
void _BCD__ZN4fltk11TextDisplay11hide_cursorEv(fltk::TextDisplay *This) {
(This->hide_cursor());
}
bool _BCD__ZNK4fltk11TextDisplay9cursor_onEv(fltk::TextDisplay *This) {
return (This->cursor_on());
}
void _BCD__ZN4fltk11TextDisplay12cursor_styleEi(fltk::TextDisplay *This, int style) {
(This->cursor_style(style));
}
_BCD__364_Color _BCD__ZNK4fltk11TextDisplay12cursor_colorEv(fltk::TextDisplay *This) {
return (This->cursor_color());
}
void _BCD__ZN4fltk11TextDisplay12cursor_colorEj(fltk::TextDisplay *This, _BCD__364_Color n) {
(This->cursor_color(n));
}
int _BCD__ZN4fltk11TextDisplay10word_startEi(fltk::TextDisplay *This, int pos) {
return (This->word_start(pos));
}
int _BCD__ZN4fltk11TextDisplay8word_endEi(fltk::TextDisplay *This, int pos) {
return (This->word_end(pos));
}
void _BCD__ZN4fltk11TextDisplay9next_wordEv(fltk::TextDisplay *This) {
(This->next_word());
}
void _BCD__ZN4fltk11TextDisplay13previous_wordEv(fltk::TextDisplay *This) {
(This->previous_word());
}
void _BCD__ZN4fltk11TextDisplay9wrap_modeEbi(fltk::TextDisplay *This, bool wrap, int wrap_margin) {
(This->wrap_mode(wrap, wrap_margin));
}
void _BCD__ZN4fltk11TextDisplay16linenumber_widthEi(fltk::TextDisplay *This, int width) {
(This->linenumber_width(width));
}
int _BCD__ZNK4fltk11TextDisplay16linenumber_widthEv(fltk::TextDisplay *This) {
return (This->linenumber_width());
}
typedef void (*_BCD_func__526)(int, void *);
typedef _BCD_func__526 _BCD__156_UnfinishedStyleCb;
void _BCD__ZN4fltk11TextDisplay14highlight_dataEPNS_10TextBufferEPNS0_15StyleTableEntryEicPFviPvES5_(fltk::TextDisplay *This, fltk::TextBuffer * styleBuffer, fltk::TextDisplay::StyleTableEntry * styleTable, int nStyles, char unfinishedStyle, _BCD__156_UnfinishedStyleCb unfinishedHighlightCB, void * cbArg) {
(This->highlight_data(styleBuffer, styleTable, nStyles, unfinishedStyle, unfinishedHighlightCB, cbArg));
}
bool _BCD__ZN4fltk11TextDisplay10move_rightEv(fltk::TextDisplay *This) {
return (This->move_right());
}
bool _BCD__ZN4fltk11TextDisplay9move_leftEv(fltk::TextDisplay *This) {
return (This->move_left());
}
bool _BCD__ZN4fltk11TextDisplay7move_upEv(fltk::TextDisplay *This) {
return (This->move_up());
}
bool _BCD__ZN4fltk11TextDisplay9move_downEv(fltk::TextDisplay *This) {
return (This->move_down());
}
void _BCD__ZN4fltk11TextDisplay15redisplay_rangeEii(fltk::TextDisplay *This, int start, int end) {
(This->redisplay_range(start, end));
}
void _BCD__ZN4fltk11TextDisplay6scrollEii(fltk::TextDisplay *This, int topLineNum, int horizOffset) {
(This->scroll(topLineNum, horizOffset));
}
bool _BCD__ZN4fltk11TextDisplay12in_selectionEii(fltk::TextDisplay *This, int x, int y) {
return (This->in_selection(x, y));
}
int _BCD__ZN4fltk11TextDisplay10line_startEi(fltk::TextDisplay *This, int pos) {
return (This->line_start(pos));
}
int _BCD__ZN4fltk11TextDisplay8line_endEib(fltk::TextDisplay *This, int pos, bool start_pos_is_line_start) {
return (This->line_end(pos, start_pos_is_line_start));
}
int _BCD__ZNK4fltk11TextDisplay13visible_linesEv(fltk::TextDisplay *This) {
return (This->visible_lines());
}
int _BCD__ZNK4fltk11TextDisplay8top_lineEv(fltk::TextDisplay *This) {
return (This->top_line());
}
int _BCD__ZNK4fltk11TextDisplay10hor_offsetEv(fltk::TextDisplay *This) {
return (This->hor_offset());
}
int _BCD__ZN4fltk11TextDisplay14find_next_charEi(fltk::TextDisplay *This, int pos) {
return (This->find_next_char(pos));
}
int _BCD__ZN4fltk11TextDisplay14find_prev_charEi(fltk::TextDisplay *This, int pos) {
return (This->find_prev_char(pos));
}
int _BCD__ZN4fltk11TextDisplay14xy_to_positionEiii(fltk::TextDisplay *This, int X, int Y, int PosType) {
return (This->xy_to_position(X, Y, PosType));
}
void _BCD__ZN4fltk11TextDisplay12xy_to_rowcolEiiPiS1_i(fltk::TextDisplay *This, int X, int Y, int * row, int * column, int PosType) {
(This->xy_to_rowcol(X, Y, row, column, PosType));
}
bool _BCD__ZN4fltk11TextDisplay14position_to_xyEiPiS1_(fltk::TextDisplay *This, int pos, int * X, int * Y) {
return (This->position_to_xy(pos, X, Y));
}
int _BCD__ZN4fltk11TextDisplay11total_linesEv(fltk::TextDisplay *This) {
return (This->total_lines());
}
int _BCD_R__ZN4fltk11TextDisplay6handleEi__TextDisplay_R_CHECK(void *);
int _BCD_R__ZN4fltk11TextDisplay6handleEi__TextDisplay_R(void *, int e);
int _BCD_R__ZN4fltk11TextDisplay4drawEv__TextDisplay_R_CHECK(void *);
void _BCD_R__ZN4fltk11TextDisplay4drawEv__TextDisplay_R(void *);
int _BCD_R__ZN4fltk11TextDisplay6layoutEv__TextDisplay_R_CHECK(void *);
void _BCD_R__ZN4fltk11TextDisplay6layoutEv__TextDisplay_R(void *);
}
class TextDisplay_R : fltk::TextDisplay {
public:
void *__D_data;
TextDisplay_R(int X, int Y, int W, int H, char const * l) : fltk::TextDisplay(X, Y, W, H, l) {}
int handle(int e) {
if (_BCD_R__ZN4fltk11TextDisplay6handleEi__TextDisplay_R_CHECK(__D_data))
return _BCD_R__ZN4fltk11TextDisplay6handleEi__TextDisplay_R(__D_data, e);
else
return fltk::TextDisplay::handle(e);
}
void draw() {
if (_BCD_R__ZN4fltk11TextDisplay4drawEv__TextDisplay_R_CHECK(__D_data))
_BCD_R__ZN4fltk11TextDisplay4drawEv__TextDisplay_R(__D_data);
else
fltk::TextDisplay::draw();
}
void layout() {
if (_BCD_R__ZN4fltk11TextDisplay6layoutEv__TextDisplay_R_CHECK(__D_data))
_BCD_R__ZN4fltk11TextDisplay6layoutEv__TextDisplay_R(__D_data);
else
fltk::TextDisplay::layout();
}
};
extern "C" {
TextDisplay_R *_BCD_new__ZN4fltk11TextDisplayC1EiiiiPKc_R(int X, int Y, int W, int H, char const * l) {
return new TextDisplay_R(X, Y, W, H, l);
}
void _BCD_delete_N4fltk11TextDisplayE__TextDisplay_R(TextDisplay_R *This) {
delete This;
}
void _BCD_RI_N4fltk11TextDisplayE(TextDisplay_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__642)(int, int, void *);
typedef _BCD_func__642 _BCD__163_Text_Predelete_Cb;
typedef void (*_BCD_func__643)(int, int, int, int, char const *, void *);
typedef _BCD_func__643 _BCD__165_Text_Modify_Cb;
typedef void (*_BCD_func__172)(fltk::Widget *, long int);
typedef _BCD_func__172 _BCD__173_Callback1;
typedef void (*_BCD_func__174)(fltk::Widget *);
typedef _BCD_func__174 _BCD__175_Callback0;
typedef void (*_BCD_func__178)(fltk::Widget *, void *);
typedef _BCD_func__178 _BCD__179_Callback;
typedef _BCD__179_Callback _BCD__177_Callback_p;
typedef bool (*_BCD_func__784)();
typedef _BCD_func__784 _BCD__190_Theme;
typedef fltk::Symbol * _BCD__241_Box;
typedef _BCD__11_uchar const * (*_BCD_func__986)(void *, int, int, int, _BCD__11_uchar *);
typedef _BCD_func__986 _BCD__252_DrawImageCallback;
typedef int _BCD__367_Flags;
typedef _BCD__367_Flags _BCD__366_Align;
}