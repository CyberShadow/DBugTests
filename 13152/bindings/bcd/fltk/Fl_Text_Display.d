/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_Text_Display;
public import bcd.bind;
public import bcd.fltk.Fl_Text_Buffer;
public import bcd.fltk.Fl_Scrollbar;
public import bcd.fltk.Fl_Slider;
public import bcd.fltk.Fl_Valuator;
public import bcd.fltk.Fl_Group;
public import bcd.fltk.Fl_Widget;
public import bcd.fltk.fl_draw;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_N15Fl_Text_Display17Style_Table_EntryE(void *);
extern (C) void _BCD_set__ZN15Fl_Text_Display17Style_Table_Entry5colorE(void *, int);
extern (C) int _BCD_get__ZN15Fl_Text_Display17Style_Table_Entry5colorE(void *);
extern (C) void _BCD_set__ZN15Fl_Text_Display17Style_Table_Entry4fontE(void *, int);
extern (C) int _BCD_get__ZN15Fl_Text_Display17Style_Table_Entry4fontE(void *);
extern (C) void _BCD_set__ZN15Fl_Text_Display17Style_Table_Entry4sizeE(void *, int);
extern (C) int _BCD_get__ZN15Fl_Text_Display17Style_Table_Entry4sizeE(void *);
extern (C) void _BCD_set__ZN15Fl_Text_Display17Style_Table_Entry4attrE(void *, uint);
extern (C) uint _BCD_get__ZN15Fl_Text_Display17Style_Table_Entry4attrE(void *);
extern (C) void _BCD_RI_N15Fl_Text_Display17Style_Table_EntryE(void *cd, void *dd);
extern (C) void _BCD_delete_N15Fl_Text_Display17Style_Table_EntryE__Style_Table_Entry_R(void *This);
extern (C) void _BCD_delete_15Fl_Text_Display(void *);
extern (C) void *_BCD_new__ZN15Fl_Text_DisplayC1EiiiiPKc(int, int, int, int, char *);
extern (C) int _BCD__ZN15Fl_Text_Display6handleEi(void *This, int);
extern (C) void _BCD__ZN15Fl_Text_Display6bufferEP14Fl_Text_Buffer(void *This, void *);
extern (C) Fl_Text_Buffer * _BCD__ZN15Fl_Text_Display6bufferEv(void *This);
extern (C) void _BCD__ZN15Fl_Text_Display15redisplay_rangeEii(void *This, int, int);
extern (C) void _BCD__ZN15Fl_Text_Display6scrollEii(void *This, int, int);
extern (C) void _BCD__ZN15Fl_Text_Display6insertEPKc(void *This, char *);
extern (C) void _BCD__ZN15Fl_Text_Display10overstrikeEPKc(void *This, char *);
extern (C) void _BCD__ZN15Fl_Text_Display15insert_positionEi(void *This, int);
extern (C) int _BCD__ZN15Fl_Text_Display15insert_positionEv(void *This);
extern (C) int _BCD__ZN15Fl_Text_Display12in_selectionEii(void *This, int, int);
extern (C) void _BCD__ZN15Fl_Text_Display20show_insert_positionEv(void *This);
extern (C) int _BCD__ZN15Fl_Text_Display10move_rightEv(void *This);
extern (C) int _BCD__ZN15Fl_Text_Display9move_leftEv(void *This);
extern (C) int _BCD__ZN15Fl_Text_Display7move_upEv(void *This);
extern (C) int _BCD__ZN15Fl_Text_Display9move_downEv(void *This);
extern (C) int _BCD__ZN15Fl_Text_Display11count_linesEiib(void *This, int, int, bool);
extern (C) int _BCD__ZN15Fl_Text_Display10line_startEi(void *This, int);
extern (C) int _BCD__ZN15Fl_Text_Display8line_endEib(void *This, int, bool);
extern (C) int _BCD__ZN15Fl_Text_Display10skip_linesEiib(void *This, int, int, bool);
extern (C) int _BCD__ZN15Fl_Text_Display12rewind_linesEii(void *This, int, int);
extern (C) void _BCD__ZN15Fl_Text_Display9next_wordEv(void *This);
extern (C) void _BCD__ZN15Fl_Text_Display13previous_wordEv(void *This);
extern (C) void _BCD__ZN15Fl_Text_Display11show_cursorEi(void *This, int);
extern (C) void _BCD__ZN15Fl_Text_Display11hide_cursorEv(void *This);
extern (C) void _BCD__ZN15Fl_Text_Display12cursor_styleEi(void *This, int);
extern (C) int _BCD__ZNK15Fl_Text_Display12cursor_colorEv(void *This);
extern (C) void _BCD__ZN15Fl_Text_Display12cursor_colorE8Fl_Color(void *This, int);
extern (C) int _BCD__ZN15Fl_Text_Display15scrollbar_widthEv(void *This);
extern (C) int _BCD__ZN15Fl_Text_Display15scrollbar_alignEv(void *This);
extern (C) void _BCD__ZN15Fl_Text_Display15scrollbar_widthEi(void *This, int);
extern (C) void _BCD__ZN15Fl_Text_Display15scrollbar_alignE8Fl_Align(void *This, int);
extern (C) int _BCD__ZN15Fl_Text_Display10word_startEi(void *This, int);
extern (C) int _BCD__ZN15Fl_Text_Display8word_endEi(void *This, int);
alias void function(int, void *) _BCD_func__863;
extern (C) void _BCD__ZN15Fl_Text_Display14highlight_dataEP14Fl_Text_BufferPKNS_17Style_Table_EntryEicPFviPvES5_(void *This, void *, void *, int, char, _BCD_func__863, void *);
extern (C) int _BCD__ZN15Fl_Text_Display14position_styleEiiii(void *This, int, int, int, int);
extern (C) int _BCD__ZNK15Fl_Text_Display8textfontEv(void *This);
extern (C) void _BCD__ZN15Fl_Text_Display8textfontEh(void *This, char);
extern (C) char _BCD__ZNK15Fl_Text_Display8textsizeEv(void *This);
extern (C) void _BCD__ZN15Fl_Text_Display8textsizeEh(void *This, char);
extern (C) int _BCD__ZNK15Fl_Text_Display9textcolorEv(void *This);
extern (C) void _BCD__ZN15Fl_Text_Display9textcolorEj(void *This, uint);
extern (C) int _BCD__ZN15Fl_Text_Display14wrapped_columnEii(void *This, int, int);
extern (C) int _BCD__ZN15Fl_Text_Display11wrapped_rowEi(void *This, int);
extern (C) void _BCD__ZN15Fl_Text_Display9wrap_modeEii(void *This, int, int);
extern (C) void _BCD__ZN15Fl_Text_Display6resizeEiiii(void *This, int, int, int, int);
extern (C) void _BCD_RI_15Fl_Text_Display(void *cd, void *dd);
extern (C) void _BCD_delete_15Fl_Text_Display__Fl_Text_Display_R(void *This);
extern (C) void *_BCD_new__ZN15Fl_Text_DisplayC1EiiiiPKc_R(int, int, int, int, char *);
extern (C) int _BCD_R__ZN15Fl_Text_Display6handleEi__Fl_Text_Display_R_CHECK(Fl_Text_Display_R x) {
union dp {
int delegate(int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.handle;
return cast(int) (d.f != &Fl_Text_Display.handle);
}
extern (C) int _BCD_R__ZN15Fl_Text_Display6handleEi__Fl_Text_Display_R(Fl_Text_Display_R __D_class, int e) {
return __D_class.handle(e);
}
extern (C) int _BCD_R__ZN15Fl_Text_Display6resizeEiiii__Fl_Text_Display_R_CHECK(Fl_Text_Display_R x) {
union dp {
void delegate(int, int, int, int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.resize;
return cast(int) (d.f != &Fl_Text_Display.resize);
}
extern (C) void _BCD_R__ZN15Fl_Text_Display6resizeEiiii__Fl_Text_Display_R(Fl_Text_Display_R __D_class, int X, int Y, int W, int H) {
__D_class.resize(X, Y, W, H);
}
extern (C) void _BCD__Z15fl_text_drag_meiP15Fl_Text_Display(int, void *);
alias void function(int, int, void *) _BCD_func__442;
alias void function(int, int, int, int, char *, void *) _BCD_func__443;
alias void function(Fl_Widget *, int) _BCD_func__22;
alias void function(Fl_Widget *) _BCD_func__24;
alias void function(Fl_Widget *, void *) _BCD_func__28;
alias void function(void *, int, int, int, char *) _BCD_func__842;
const int NORMAL_CURSOR = 0;
const int CARET_CURSOR = 1;
const int DIM_CURSOR = 2;
const int BLOCK_CURSOR = 3;
const int HEAVY_CURSOR = 4;
const int CURSOR_POS = 0;
const int CHARACTER_POS = 1;
const int DRAG_CHAR = 0;
const int DRAG_WORD = 1;
const int DRAG_LINE = 2;
alias _BCD_func__863 Unfinished_Style_Cb;
const int ATTR_NONE = 0;
const int ATTR_UNDERLINE = 1;
const int ATTR_HIDDEN = 2;
class Style_Table_Entry : bcd.bind.BoundClass {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N15Fl_Text_Display17Style_Table_EntryE(__C_data);
__C_data = null;
}
void set_color(int x) {
_BCD_set__ZN15Fl_Text_Display17Style_Table_Entry5colorE(__C_data, x);
}
int get_color() {
return _BCD_get__ZN15Fl_Text_Display17Style_Table_Entry5colorE(__C_data);
}
void set_font(int x) {
_BCD_set__ZN15Fl_Text_Display17Style_Table_Entry4fontE(__C_data, x);
}
int get_font() {
return _BCD_get__ZN15Fl_Text_Display17Style_Table_Entry4fontE(__C_data);
}
void set_size(int x) {
_BCD_set__ZN15Fl_Text_Display17Style_Table_Entry4sizeE(__C_data, x);
}
int get_size() {
return _BCD_get__ZN15Fl_Text_Display17Style_Table_Entry4sizeE(__C_data);
}
void set_attr(uint x) {
_BCD_set__ZN15Fl_Text_Display17Style_Table_Entry4attrE(__C_data, x);
}
uint get_attr() {
return _BCD_get__ZN15Fl_Text_Display17Style_Table_Entry4attrE(__C_data);
}
}
class Style_Table_Entry_R : Style_Table_Entry {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N15Fl_Text_Display17Style_Table_EntryE__Style_Table_Entry_R(__C_data);
__C_data = null;
}
this() { super(cast(ireal) 0); }
}
class Fl_Text_Display : Fl_Group {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_15Fl_Text_Display(__C_data);
__C_data = null;
}
this(int X, int Y, int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN15Fl_Text_DisplayC1EiiiiPKc(X, Y, W, H, l);
__C_data_owned = true;
}
int handle(int e) {
return _BCD__ZN15Fl_Text_Display6handleEi(__C_data, e);
}
void buffer(Fl_Text_Buffer * buf) {
_BCD__ZN15Fl_Text_Display6bufferEP14Fl_Text_Buffer(__C_data, buf.__C_data);
}
Fl_Text_Buffer * buffer() {
return _BCD__ZN15Fl_Text_Display6bufferEv(__C_data);
}
void redisplay_range(int start, int end) {
_BCD__ZN15Fl_Text_Display15redisplay_rangeEii(__C_data, start, end);
}
void scroll(int topLineNum, int horizOffset) {
_BCD__ZN15Fl_Text_Display6scrollEii(__C_data, topLineNum, horizOffset);
}
void insert(char * text) {
_BCD__ZN15Fl_Text_Display6insertEPKc(__C_data, text);
}
void overstrike(char * text) {
_BCD__ZN15Fl_Text_Display10overstrikeEPKc(__C_data, text);
}
void insert_position(int newPos) {
_BCD__ZN15Fl_Text_Display15insert_positionEi(__C_data, newPos);
}
int insert_position() {
return _BCD__ZN15Fl_Text_Display15insert_positionEv(__C_data);
}
int in_selection(int x, int y) {
return _BCD__ZN15Fl_Text_Display12in_selectionEii(__C_data, x, y);
}
void show_insert_position() {
_BCD__ZN15Fl_Text_Display20show_insert_positionEv(__C_data);
}
int move_right() {
return _BCD__ZN15Fl_Text_Display10move_rightEv(__C_data);
}
int move_left() {
return _BCD__ZN15Fl_Text_Display9move_leftEv(__C_data);
}
int move_up() {
return _BCD__ZN15Fl_Text_Display7move_upEv(__C_data);
}
int move_down() {
return _BCD__ZN15Fl_Text_Display9move_downEv(__C_data);
}
int count_lines(int start, int end, bool start_pos_is_line_start) {
return _BCD__ZN15Fl_Text_Display11count_linesEiib(__C_data, start, end, start_pos_is_line_start);
}
int line_start(int pos) {
return _BCD__ZN15Fl_Text_Display10line_startEi(__C_data, pos);
}
int line_end(int pos, bool start_pos_is_line_start) {
return _BCD__ZN15Fl_Text_Display8line_endEib(__C_data, pos, start_pos_is_line_start);
}
int skip_lines(int startPos, int nLines, bool startPosIsLineStart) {
return _BCD__ZN15Fl_Text_Display10skip_linesEiib(__C_data, startPos, nLines, startPosIsLineStart);
}
int rewind_lines(int startPos, int nLines) {
return _BCD__ZN15Fl_Text_Display12rewind_linesEii(__C_data, startPos, nLines);
}
void next_word() {
_BCD__ZN15Fl_Text_Display9next_wordEv(__C_data);
}
void previous_word() {
_BCD__ZN15Fl_Text_Display13previous_wordEv(__C_data);
}
void show_cursor(int b) {
_BCD__ZN15Fl_Text_Display11show_cursorEi(__C_data, b);
}
void hide_cursor() {
_BCD__ZN15Fl_Text_Display11hide_cursorEv(__C_data);
}
void cursor_style(int style) {
_BCD__ZN15Fl_Text_Display12cursor_styleEi(__C_data, style);
}
int cursor_color() {
return _BCD__ZNK15Fl_Text_Display12cursor_colorEv(__C_data);
}
void cursor_color(int n) {
_BCD__ZN15Fl_Text_Display12cursor_colorE8Fl_Color(__C_data, n);
}
int scrollbar_width() {
return _BCD__ZN15Fl_Text_Display15scrollbar_widthEv(__C_data);
}
int scrollbar_align() {
return _BCD__ZN15Fl_Text_Display15scrollbar_alignEv(__C_data);
}
void scrollbar_width(int W) {
_BCD__ZN15Fl_Text_Display15scrollbar_widthEi(__C_data, W);
}
void scrollbar_align(int a) {
_BCD__ZN15Fl_Text_Display15scrollbar_alignE8Fl_Align(__C_data, a);
}
int word_start(int pos) {
return _BCD__ZN15Fl_Text_Display10word_startEi(__C_data, pos);
}
int word_end(int pos) {
return _BCD__ZN15Fl_Text_Display8word_endEi(__C_data, pos);
}
void highlight_data(Fl_Text_Buffer * styleBuffer, Style_Table_Entry * styleTable, int nStyles, char unfinishedStyle, _BCD_func__863 unfinishedHighlightCB, void * cbArg) {
_BCD__ZN15Fl_Text_Display14highlight_dataEP14Fl_Text_BufferPKNS_17Style_Table_EntryEicPFviPvES5_(__C_data, styleBuffer.__C_data, styleTable.__C_data, nStyles, unfinishedStyle, unfinishedHighlightCB, cbArg);
}
int position_style(int lineStartPos, int lineLen, int lineIndex, int dispIndex) {
return _BCD__ZN15Fl_Text_Display14position_styleEiiii(__C_data, lineStartPos, lineLen, lineIndex, dispIndex);
}
int textfont() {
return _BCD__ZNK15Fl_Text_Display8textfontEv(__C_data);
}
void textfont(char s) {
_BCD__ZN15Fl_Text_Display8textfontEh(__C_data, s);
}
char textsize() {
return _BCD__ZNK15Fl_Text_Display8textsizeEv(__C_data);
}
void textsize(char s) {
_BCD__ZN15Fl_Text_Display8textsizeEh(__C_data, s);
}
int textcolor() {
return _BCD__ZNK15Fl_Text_Display9textcolorEv(__C_data);
}
void textcolor(uint n) {
_BCD__ZN15Fl_Text_Display9textcolorEj(__C_data, n);
}
int wrapped_column(int row, int column) {
return _BCD__ZN15Fl_Text_Display14wrapped_columnEii(__C_data, row, column);
}
int wrapped_row(int row) {
return _BCD__ZN15Fl_Text_Display11wrapped_rowEi(__C_data, row);
}
void wrap_mode(int wrap, int wrap_margin) {
_BCD__ZN15Fl_Text_Display9wrap_modeEii(__C_data, wrap, wrap_margin);
}
void resize(int X, int Y, int W, int H) {
_BCD__ZN15Fl_Text_Display6resizeEiiii(__C_data, X, Y, W, H);
}
}
class Fl_Text_Display_R : Fl_Text_Display {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_15Fl_Text_Display__Fl_Text_Display_R(__C_data);
__C_data = null;
}
this(int X, int Y, int W, int H, char * l) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN15Fl_Text_DisplayC1EiiiiPKc_R(X, Y, W, H, l);
__C_data_owned = true;
_BCD_RI_15Fl_Text_Display(__C_data, cast(void *) this);
}
}
void fl_text_drag_me(int pos, Fl_Text_Display * d) {
_BCD__Z15fl_text_drag_meiP15Fl_Text_Display(pos, d.__C_data);
}
