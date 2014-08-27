/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Text_Display.H"
extern "C" {
void _BCD_delete_N15Fl_Text_Display17Style_Table_EntryE(Fl_Text_Display::Style_Table_Entry *This) {
delete This;
}
void _BCD_set__ZN15Fl_Text_Display17Style_Table_Entry5colorE(Fl_Text_Display::Style_Table_Entry *This, enum Fl_Color x) {
This->color = x;
}
enum Fl_Color _BCD_get__ZN15Fl_Text_Display17Style_Table_Entry5colorE(Fl_Text_Display::Style_Table_Entry *This) {
return This->color;
}
void _BCD_set__ZN15Fl_Text_Display17Style_Table_Entry4fontE(Fl_Text_Display::Style_Table_Entry *This, enum Fl_Font x) {
This->font = x;
}
enum Fl_Font _BCD_get__ZN15Fl_Text_Display17Style_Table_Entry4fontE(Fl_Text_Display::Style_Table_Entry *This) {
return This->font;
}
void _BCD_set__ZN15Fl_Text_Display17Style_Table_Entry4sizeE(Fl_Text_Display::Style_Table_Entry *This, int x) {
This->size = x;
}
int _BCD_get__ZN15Fl_Text_Display17Style_Table_Entry4sizeE(Fl_Text_Display::Style_Table_Entry *This) {
return This->size;
}
void _BCD_set__ZN15Fl_Text_Display17Style_Table_Entry4attrE(Fl_Text_Display::Style_Table_Entry *This, unsigned int x) {
This->attr = x;
}
unsigned int _BCD_get__ZN15Fl_Text_Display17Style_Table_Entry4attrE(Fl_Text_Display::Style_Table_Entry *This) {
return This->attr;
}
}
class Style_Table_Entry_R : Fl_Text_Display::Style_Table_Entry {
public:
void *__D_data;
};
extern "C" {
void _BCD_delete_N15Fl_Text_Display17Style_Table_EntryE__Style_Table_Entry_R(Style_Table_Entry_R *This) {
delete This;
}
void _BCD_RI_N15Fl_Text_Display17Style_Table_EntryE(Style_Table_Entry_R *cd, void *dd) {
cd->__D_data = dd;
}
void _BCD_delete_15Fl_Text_Display(Fl_Text_Display *This) {
delete This;
}
Fl_Text_Display *_BCD_new__ZN15Fl_Text_DisplayC1EiiiiPKc(int X, int Y, int W, int H, char const * l) {
return new Fl_Text_Display(X, Y, W, H, l);
}
int _BCD__ZN15Fl_Text_Display6handleEi(Fl_Text_Display *This, int e) {
return (This->handle(e));
}
void _BCD__ZN15Fl_Text_Display6bufferEP14Fl_Text_Buffer(Fl_Text_Display *This, Fl_Text_Buffer * buf) {
(This->buffer(buf));
}
Fl_Text_Buffer * _BCD__ZN15Fl_Text_Display6bufferEv(Fl_Text_Display *This) {
return (This->buffer());
}
void _BCD__ZN15Fl_Text_Display15redisplay_rangeEii(Fl_Text_Display *This, int start, int end) {
(This->redisplay_range(start, end));
}
void _BCD__ZN15Fl_Text_Display6scrollEii(Fl_Text_Display *This, int topLineNum, int horizOffset) {
(This->scroll(topLineNum, horizOffset));
}
void _BCD__ZN15Fl_Text_Display6insertEPKc(Fl_Text_Display *This, char const * text) {
(This->insert(text));
}
void _BCD__ZN15Fl_Text_Display10overstrikeEPKc(Fl_Text_Display *This, char const * text) {
(This->overstrike(text));
}
void _BCD__ZN15Fl_Text_Display15insert_positionEi(Fl_Text_Display *This, int newPos) {
(This->insert_position(newPos));
}
int _BCD__ZN15Fl_Text_Display15insert_positionEv(Fl_Text_Display *This) {
return (This->insert_position());
}
int _BCD__ZN15Fl_Text_Display12in_selectionEii(Fl_Text_Display *This, int x, int y) {
return (This->in_selection(x, y));
}
void _BCD__ZN15Fl_Text_Display20show_insert_positionEv(Fl_Text_Display *This) {
(This->show_insert_position());
}
int _BCD__ZN15Fl_Text_Display10move_rightEv(Fl_Text_Display *This) {
return (This->move_right());
}
int _BCD__ZN15Fl_Text_Display9move_leftEv(Fl_Text_Display *This) {
return (This->move_left());
}
int _BCD__ZN15Fl_Text_Display7move_upEv(Fl_Text_Display *This) {
return (This->move_up());
}
int _BCD__ZN15Fl_Text_Display9move_downEv(Fl_Text_Display *This) {
return (This->move_down());
}
int _BCD__ZN15Fl_Text_Display11count_linesEiib(Fl_Text_Display *This, int start, int end, bool start_pos_is_line_start) {
return (This->count_lines(start, end, start_pos_is_line_start));
}
int _BCD__ZN15Fl_Text_Display10line_startEi(Fl_Text_Display *This, int pos) {
return (This->line_start(pos));
}
int _BCD__ZN15Fl_Text_Display8line_endEib(Fl_Text_Display *This, int pos, bool start_pos_is_line_start) {
return (This->line_end(pos, start_pos_is_line_start));
}
int _BCD__ZN15Fl_Text_Display10skip_linesEiib(Fl_Text_Display *This, int startPos, int nLines, bool startPosIsLineStart) {
return (This->skip_lines(startPos, nLines, startPosIsLineStart));
}
int _BCD__ZN15Fl_Text_Display12rewind_linesEii(Fl_Text_Display *This, int startPos, int nLines) {
return (This->rewind_lines(startPos, nLines));
}
void _BCD__ZN15Fl_Text_Display9next_wordEv(Fl_Text_Display *This) {
(This->next_word());
}
void _BCD__ZN15Fl_Text_Display13previous_wordEv(Fl_Text_Display *This) {
(This->previous_word());
}
void _BCD__ZN15Fl_Text_Display11show_cursorEi(Fl_Text_Display *This, int b) {
(This->show_cursor(b));
}
void _BCD__ZN15Fl_Text_Display11hide_cursorEv(Fl_Text_Display *This) {
(This->hide_cursor());
}
void _BCD__ZN15Fl_Text_Display12cursor_styleEi(Fl_Text_Display *This, int style) {
(This->cursor_style(style));
}
enum Fl_Color _BCD__ZNK15Fl_Text_Display12cursor_colorEv(Fl_Text_Display *This) {
return (This->cursor_color());
}
void _BCD__ZN15Fl_Text_Display12cursor_colorE8Fl_Color(Fl_Text_Display *This, enum Fl_Color n) {
(This->cursor_color(n));
}
int _BCD__ZN15Fl_Text_Display15scrollbar_widthEv(Fl_Text_Display *This) {
return (This->scrollbar_width());
}
enum Fl_Align _BCD__ZN15Fl_Text_Display15scrollbar_alignEv(Fl_Text_Display *This) {
return (This->scrollbar_align());
}
void _BCD__ZN15Fl_Text_Display15scrollbar_widthEi(Fl_Text_Display *This, int W) {
(This->scrollbar_width(W));
}
void _BCD__ZN15Fl_Text_Display15scrollbar_alignE8Fl_Align(Fl_Text_Display *This, enum Fl_Align a) {
(This->scrollbar_align(a));
}
int _BCD__ZN15Fl_Text_Display10word_startEi(Fl_Text_Display *This, int pos) {
return (This->word_start(pos));
}
int _BCD__ZN15Fl_Text_Display8word_endEi(Fl_Text_Display *This, int pos) {
return (This->word_end(pos));
}
typedef void (*_BCD_func__863)(int, void *);
void _BCD__ZN15Fl_Text_Display14highlight_dataEP14Fl_Text_BufferPKNS_17Style_Table_EntryEicPFviPvES5_(Fl_Text_Display *This, Fl_Text_Buffer * styleBuffer, Fl_Text_Display::Style_Table_Entry const * styleTable, int nStyles, char unfinishedStyle, _BCD_func__863 unfinishedHighlightCB, void * cbArg) {
(This->highlight_data(styleBuffer, styleTable, nStyles, unfinishedStyle, unfinishedHighlightCB, cbArg));
}
int _BCD__ZN15Fl_Text_Display14position_styleEiiii(Fl_Text_Display *This, int lineStartPos, int lineLen, int lineIndex, int dispIndex) {
return (This->position_style(lineStartPos, lineLen, lineIndex, dispIndex));
}
enum Fl_Font _BCD__ZNK15Fl_Text_Display8textfontEv(Fl_Text_Display *This) {
return (This->textfont());
}
typedef unsigned char _BCD__169_uchar;
void _BCD__ZN15Fl_Text_Display8textfontEh(Fl_Text_Display *This, _BCD__169_uchar s) {
(This->textfont(s));
}
_BCD__169_uchar _BCD__ZNK15Fl_Text_Display8textsizeEv(Fl_Text_Display *This) {
return (This->textsize());
}
void _BCD__ZN15Fl_Text_Display8textsizeEh(Fl_Text_Display *This, _BCD__169_uchar s) {
(This->textsize(s));
}
enum Fl_Color _BCD__ZNK15Fl_Text_Display9textcolorEv(Fl_Text_Display *This) {
return (This->textcolor());
}
void _BCD__ZN15Fl_Text_Display9textcolorEj(Fl_Text_Display *This, unsigned int n) {
(This->textcolor(n));
}
int _BCD__ZN15Fl_Text_Display14wrapped_columnEii(Fl_Text_Display *This, int row, int column) {
return (This->wrapped_column(row, column));
}
int _BCD__ZN15Fl_Text_Display11wrapped_rowEi(Fl_Text_Display *This, int row) {
return (This->wrapped_row(row));
}
void _BCD__ZN15Fl_Text_Display9wrap_modeEii(Fl_Text_Display *This, int wrap, int wrap_margin) {
(This->wrap_mode(wrap, wrap_margin));
}
void _BCD__ZN15Fl_Text_Display6resizeEiiii(Fl_Text_Display *This, int X, int Y, int W, int H) {
(This->resize(X, Y, W, H));
}
int _BCD_R__ZN15Fl_Text_Display6handleEi__Fl_Text_Display_R_CHECK(void *);
int _BCD_R__ZN15Fl_Text_Display6handleEi__Fl_Text_Display_R(void *, int e);
int _BCD_R__ZN15Fl_Text_Display6resizeEiiii__Fl_Text_Display_R_CHECK(void *);
void _BCD_R__ZN15Fl_Text_Display6resizeEiiii__Fl_Text_Display_R(void *, int X, int Y, int W, int H);
}
class Fl_Text_Display_R : Fl_Text_Display {
public:
void *__D_data;
Fl_Text_Display_R(int X, int Y, int W, int H, char const * l) : Fl_Text_Display(X, Y, W, H, l) {}
int handle(int e) {
if (_BCD_R__ZN15Fl_Text_Display6handleEi__Fl_Text_Display_R_CHECK(__D_data))
return _BCD_R__ZN15Fl_Text_Display6handleEi__Fl_Text_Display_R(__D_data, e);
else
return Fl_Text_Display::handle(e);
}
void resize(int X, int Y, int W, int H) {
if (_BCD_R__ZN15Fl_Text_Display6resizeEiiii__Fl_Text_Display_R_CHECK(__D_data))
_BCD_R__ZN15Fl_Text_Display6resizeEiiii__Fl_Text_Display_R(__D_data, X, Y, W, H);
else
Fl_Text_Display::resize(X, Y, W, H);
}
};
extern "C" {
Fl_Text_Display_R *_BCD_new__ZN15Fl_Text_DisplayC1EiiiiPKc_R(int X, int Y, int W, int H, char const * l) {
return new Fl_Text_Display_R(X, Y, W, H, l);
}
void _BCD_delete_15Fl_Text_Display__Fl_Text_Display_R(Fl_Text_Display_R *This) {
delete This;
}
void _BCD_RI_15Fl_Text_Display(Fl_Text_Display_R *cd, void *dd) {
cd->__D_data = dd;
}
void _BCD__Z15fl_text_drag_meiP15Fl_Text_Display(int pos, Fl_Text_Display * d) {
(fl_text_drag_me(pos, d));
}
typedef void (*_BCD_func__442)(int, int, void *);
typedef _BCD_func__442 _BCD__7_Fl_Text_Predelete_Cb;
typedef void (*_BCD_func__443)(int, int, int, int, char const *, void *);
typedef _BCD_func__443 _BCD__9_Fl_Text_Modify_Cb;
typedef void (*_BCD_func__22)(Fl_Widget *, long int);
typedef _BCD_func__22 _BCD__23_Fl_Callback1;
typedef void (*_BCD_func__24)(Fl_Widget *);
typedef _BCD_func__24 _BCD__25_Fl_Callback0;
typedef void (*_BCD_func__28)(Fl_Widget *, void *);
typedef _BCD_func__28 _BCD__29_Fl_Callback;
typedef _BCD__29_Fl_Callback _BCD__27_Fl_Callback_p;
typedef void (*_BCD_func__842)(void *, int, int, int, _BCD__169_uchar *);
typedef _BCD_func__842 _BCD__49_Fl_Draw_Image_Cb;
typedef long unsigned int _BCD__167_ulong;
typedef _BCD_func__863 _BCD__345_Unfinished_Style_Cb;
}