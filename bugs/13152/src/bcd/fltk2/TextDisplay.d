/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.TextDisplay;
align(4):
public import bcd.bind;
public import bcd.fltk2.Scrollbar;
public import bcd.fltk2.Slider;
public import bcd.fltk2.Valuator;
public import bcd.fltk2.Group;
public import bcd.fltk2.Widget;
public import bcd.fltk2.Style;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.Font;
public import bcd.fltk2.TextBuffer;
public import bcd.fltk2.draw;
public import bcd.fltk2.PixelType;
public import bcd.fltk2.Rectangle;
public import bcd.fltk2.Color;
public import bcd.fltk2.Flags;
extern (C) void _BCD_delete_N4fltk11TextDisplay15StyleTableEntryE(void *);
extern (C) void _BCD_set__ZN4fltk11TextDisplay15StyleTableEntry5colorE(void *, uint);
extern (C) uint _BCD_get__ZN4fltk11TextDisplay15StyleTableEntry5colorE(void *);
extern (C) void _BCD_set__ZN4fltk11TextDisplay15StyleTableEntry4fontE(void *, Font *);
extern (C) Font * _BCD_get__ZN4fltk11TextDisplay15StyleTableEntry4fontE(void *);
extern (C) void _BCD_set__ZN4fltk11TextDisplay15StyleTableEntry4sizeE(void *, float);
extern (C) float _BCD_get__ZN4fltk11TextDisplay15StyleTableEntry4sizeE(void *);
extern (C) void _BCD_set__ZN4fltk11TextDisplay15StyleTableEntry4attrE(void *, uint);
extern (C) uint _BCD_get__ZN4fltk11TextDisplay15StyleTableEntry4attrE(void *);
extern (C) void _BCD_RI_N4fltk11TextDisplay15StyleTableEntryE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk11TextDisplay15StyleTableEntryE__StyleTableEntry_R(void *This);
extern (C) void _BCD_delete_N4fltk11TextDisplayE(void *);
extern (C) void *_BCD_new__ZN4fltk11TextDisplayC1EiiiiPKc(int, int, int, int, char *);
extern (C) int _BCD__ZNK4fltk11TextDisplay4sizeEv(void *This);
extern (C) char * _BCD__ZNK4fltk11TextDisplay4textEv(void *This);
extern (C) void _BCD__ZN4fltk11TextDisplay4textEPKc(void *This, char *);
extern (C) void _BCD__ZN4fltk11TextDisplay11static_textEPKc(void *This, char *);
extern (C) char _BCD__ZNK4fltk11TextDisplay2atEi(void *This, int);
extern (C) int _BCD__ZN4fltk11TextDisplay6handleEi(void *This, int);
extern (C) void _BCD__ZN4fltk11TextDisplay4drawEv(void *This);
extern (C) void _BCD__ZN4fltk11TextDisplay6layoutEv(void *This);
extern (C) void _BCD__ZN4fltk11TextDisplay6bufferEPNS_10TextBufferE(void *This, void *);
extern (C) TextBuffer * _BCD__ZN4fltk11TextDisplay6bufferEv(void *This);
extern (C) void _BCD__ZN4fltk11TextDisplay6appendEPKc(void *This, char *);
extern (C) void _BCD__ZN4fltk11TextDisplay6insertEPKc(void *This, char *);
extern (C) void _BCD__ZN4fltk11TextDisplay10overstrikeEPKc(void *This, char *);
extern (C) void _BCD__ZN4fltk11TextDisplay15insert_positionEi(void *This, int);
extern (C) int _BCD__ZNK4fltk11TextDisplay15insert_positionEv(void *This);
extern (C) void _BCD__ZN4fltk11TextDisplay20show_insert_positionEv(void *This);
extern (C) void _BCD__ZN4fltk11TextDisplay11show_cursorEb(void *This, bool);
extern (C) void _BCD__ZN4fltk11TextDisplay11hide_cursorEv(void *This);
extern (C) bool _BCD__ZNK4fltk11TextDisplay9cursor_onEv(void *This);
extern (C) void _BCD__ZN4fltk11TextDisplay12cursor_styleEi(void *This, int);
extern (C) uint _BCD__ZNK4fltk11TextDisplay12cursor_colorEv(void *This);
extern (C) void _BCD__ZN4fltk11TextDisplay12cursor_colorEj(void *This, uint);
extern (C) int _BCD__ZN4fltk11TextDisplay10word_startEi(void *This, int);
extern (C) int _BCD__ZN4fltk11TextDisplay8word_endEi(void *This, int);
extern (C) void _BCD__ZN4fltk11TextDisplay9next_wordEv(void *This);
extern (C) void _BCD__ZN4fltk11TextDisplay13previous_wordEv(void *This);
extern (C) void _BCD__ZN4fltk11TextDisplay9wrap_modeEbi(void *This, bool, int);
extern (C) void _BCD__ZN4fltk11TextDisplay16linenumber_widthEi(void *This, int);
extern (C) int _BCD__ZNK4fltk11TextDisplay16linenumber_widthEv(void *This);
alias void function(int, void *) _BCD_func__526;
alias _BCD_func__526 UnfinishedStyleCb;
extern (C) void _BCD__ZN4fltk11TextDisplay14highlight_dataEPNS_10TextBufferEPNS0_15StyleTableEntryEicPFviPvES5_(void *This, void *, void *, int, char, _BCD_func__526, void *);
extern (C) bool _BCD__ZN4fltk11TextDisplay10move_rightEv(void *This);
extern (C) bool _BCD__ZN4fltk11TextDisplay9move_leftEv(void *This);
extern (C) bool _BCD__ZN4fltk11TextDisplay7move_upEv(void *This);
extern (C) bool _BCD__ZN4fltk11TextDisplay9move_downEv(void *This);
extern (C) void _BCD__ZN4fltk11TextDisplay15redisplay_rangeEii(void *This, int, int);
extern (C) void _BCD__ZN4fltk11TextDisplay6scrollEii(void *This, int, int);
extern (C) bool _BCD__ZN4fltk11TextDisplay12in_selectionEii(void *This, int, int);
extern (C) int _BCD__ZN4fltk11TextDisplay10line_startEi(void *This, int);
extern (C) int _BCD__ZN4fltk11TextDisplay8line_endEib(void *This, int, bool);
extern (C) int _BCD__ZNK4fltk11TextDisplay13visible_linesEv(void *This);
extern (C) int _BCD__ZNK4fltk11TextDisplay8top_lineEv(void *This);
extern (C) int _BCD__ZNK4fltk11TextDisplay10hor_offsetEv(void *This);
extern (C) int _BCD__ZN4fltk11TextDisplay14find_next_charEi(void *This, int);
extern (C) int _BCD__ZN4fltk11TextDisplay14find_prev_charEi(void *This, int);
extern (C) int _BCD__ZN4fltk11TextDisplay14xy_to_positionEiii(void *This, int, int, int);
extern (C) void _BCD__ZN4fltk11TextDisplay12xy_to_rowcolEiiPiS1_i(void *This, int, int, int *, int *, int);
extern (C) bool _BCD__ZN4fltk11TextDisplay14position_to_xyEiPiS1_(void *This, int, int *, int *);
extern (C) int _BCD__ZN4fltk11TextDisplay11total_linesEv(void *This);
extern (C) void _BCD_RI_N4fltk11TextDisplayE(void *cd, void *dd);
extern (C) void _BCD_delete_N4fltk11TextDisplayE__TextDisplay_R(void *This);
extern (C) void *_BCD_new__ZN4fltk11TextDisplayC1EiiiiPKc_R(int, int, int, int, char *);
extern (C) int _BCD_R__ZN4fltk11TextDisplay6handleEi__TextDisplay_R_CHECK(TextDisplay_R x) {
union dp {
int delegate(int) d;
struct { void *o; void *f; }
}
dp d; d.d = &x.handle;
return cast(int) (d.f != &TextDisplay.handle);
}
extern (C) int _BCD_R__ZN4fltk11TextDisplay6handleEi__TextDisplay_R(TextDisplay_R __D_class, int e) {
return __D_class.handle(e);
}
extern (C) int _BCD_R__ZN4fltk11TextDisplay4drawEv__TextDisplay_R_CHECK(TextDisplay_R x) {
union dp {
void delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.draw;
return cast(int) (d.f != &TextDisplay.draw);
}
extern (C) void _BCD_R__ZN4fltk11TextDisplay4drawEv__TextDisplay_R(TextDisplay_R __D_class, ) {
__D_class.draw();
}
extern (C) int _BCD_R__ZN4fltk11TextDisplay6layoutEv__TextDisplay_R_CHECK(TextDisplay_R x) {
union dp {
void delegate() d;
struct { void *o; void *f; }
}
dp d; d.d = &x.layout;
return cast(int) (d.f != &TextDisplay.layout);
}
extern (C) void _BCD_R__ZN4fltk11TextDisplay6layoutEv__TextDisplay_R(TextDisplay_R __D_class, ) {
__D_class.layout();
}
alias void function(int, int, void *) _BCD_func__642;
alias void function(int, int, int, int, char *, void *) _BCD_func__643;
alias void function(Widget *, int) _BCD_func__172;
alias void function(Widget *) _BCD_func__174;
alias void function(Widget *, void *) _BCD_func__178;
alias bool function() _BCD_func__784;
alias char * function(void *, int, int, int, char *) _BCD_func__986;
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
const int ATTR_NONE = 0;
const int ATTR_UNDERLINE = 1;
const int ATTR_HIDDEN = 2;
class StyleTableEntry : bcd.bind.BoundClass {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk11TextDisplay15StyleTableEntryE(__C_data);
__C_data = null;
}
void set_color(uint x) {
_BCD_set__ZN4fltk11TextDisplay15StyleTableEntry5colorE(__C_data, x);
}
uint get_color() {
return _BCD_get__ZN4fltk11TextDisplay15StyleTableEntry5colorE(__C_data);
}
void set_font(Font * x) {
_BCD_set__ZN4fltk11TextDisplay15StyleTableEntry4fontE(__C_data, x);
}
Font * get_font() {
return _BCD_get__ZN4fltk11TextDisplay15StyleTableEntry4fontE(__C_data);
}
void set_size(float x) {
_BCD_set__ZN4fltk11TextDisplay15StyleTableEntry4sizeE(__C_data, x);
}
float get_size() {
return _BCD_get__ZN4fltk11TextDisplay15StyleTableEntry4sizeE(__C_data);
}
void set_attr(uint x) {
_BCD_set__ZN4fltk11TextDisplay15StyleTableEntry4attrE(__C_data, x);
}
uint get_attr() {
return _BCD_get__ZN4fltk11TextDisplay15StyleTableEntry4attrE(__C_data);
}
}
class StyleTableEntry_R : StyleTableEntry {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk11TextDisplay15StyleTableEntryE__StyleTableEntry_R(__C_data);
__C_data = null;
}
this() { super(cast(ireal) 0); }
}
class TextDisplay : Group {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk11TextDisplayE(__C_data);
__C_data = null;
}
this(int X, int Y, int W, int H, char * l = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk11TextDisplayC1EiiiiPKc(X, Y, W, H, l);
__C_data_owned = true;
}
int size() {
return _BCD__ZNK4fltk11TextDisplay4sizeEv(__C_data);
}
char * text() {
return _BCD__ZNK4fltk11TextDisplay4textEv(__C_data);
}
void text(char * v) {
_BCD__ZN4fltk11TextDisplay4textEPKc(__C_data, v);
}
void static_text(char * v) {
_BCD__ZN4fltk11TextDisplay11static_textEPKc(__C_data, v);
}
char at(int i) {
return _BCD__ZNK4fltk11TextDisplay2atEi(__C_data, i);
}
int handle(int e) {
return _BCD__ZN4fltk11TextDisplay6handleEi(__C_data, e);
}
void draw() {
_BCD__ZN4fltk11TextDisplay4drawEv(__C_data);
}
void layout() {
_BCD__ZN4fltk11TextDisplay6layoutEv(__C_data);
}
void buffer(TextBuffer * buf) {
_BCD__ZN4fltk11TextDisplay6bufferEPNS_10TextBufferE(__C_data, buf.__C_data);
}
TextBuffer * buffer() {
return _BCD__ZN4fltk11TextDisplay6bufferEv(__C_data);
}
void append(char * text) {
_BCD__ZN4fltk11TextDisplay6appendEPKc(__C_data, text);
}
void insert(char * text) {
_BCD__ZN4fltk11TextDisplay6insertEPKc(__C_data, text);
}
void overstrike(char * text) {
_BCD__ZN4fltk11TextDisplay10overstrikeEPKc(__C_data, text);
}
void insert_position(int newPos) {
_BCD__ZN4fltk11TextDisplay15insert_positionEi(__C_data, newPos);
}
int insert_position() {
return _BCD__ZNK4fltk11TextDisplay15insert_positionEv(__C_data);
}
void show_insert_position() {
_BCD__ZN4fltk11TextDisplay20show_insert_positionEv(__C_data);
}
void show_cursor(bool b = true) {
_BCD__ZN4fltk11TextDisplay11show_cursorEb(__C_data, b);
}
void hide_cursor() {
_BCD__ZN4fltk11TextDisplay11hide_cursorEv(__C_data);
}
bool cursor_on() {
return _BCD__ZNK4fltk11TextDisplay9cursor_onEv(__C_data);
}
void cursor_style(int style) {
_BCD__ZN4fltk11TextDisplay12cursor_styleEi(__C_data, style);
}
uint cursor_color() {
return _BCD__ZNK4fltk11TextDisplay12cursor_colorEv(__C_data);
}
void cursor_color(uint n) {
_BCD__ZN4fltk11TextDisplay12cursor_colorEj(__C_data, n);
}
int word_start(int pos) {
return _BCD__ZN4fltk11TextDisplay10word_startEi(__C_data, pos);
}
int word_end(int pos) {
return _BCD__ZN4fltk11TextDisplay8word_endEi(__C_data, pos);
}
void next_word() {
_BCD__ZN4fltk11TextDisplay9next_wordEv(__C_data);
}
void previous_word() {
_BCD__ZN4fltk11TextDisplay13previous_wordEv(__C_data);
}
void wrap_mode(bool wrap, int wrap_margin = 0) {
_BCD__ZN4fltk11TextDisplay9wrap_modeEbi(__C_data, wrap, wrap_margin);
}
void linenumber_width(int width) {
_BCD__ZN4fltk11TextDisplay16linenumber_widthEi(__C_data, width);
}
int linenumber_width() {
return _BCD__ZNK4fltk11TextDisplay16linenumber_widthEv(__C_data);
}
void highlight_data(TextBuffer * styleBuffer, StyleTableEntry * styleTable, int nStyles, char unfinishedStyle, _BCD_func__526 unfinishedHighlightCB, void * cbArg) {
_BCD__ZN4fltk11TextDisplay14highlight_dataEPNS_10TextBufferEPNS0_15StyleTableEntryEicPFviPvES5_(__C_data, styleBuffer.__C_data, styleTable.__C_data, nStyles, unfinishedStyle, unfinishedHighlightCB, cbArg);
}
bool move_right() {
return _BCD__ZN4fltk11TextDisplay10move_rightEv(__C_data);
}
bool move_left() {
return _BCD__ZN4fltk11TextDisplay9move_leftEv(__C_data);
}
bool move_up() {
return _BCD__ZN4fltk11TextDisplay7move_upEv(__C_data);
}
bool move_down() {
return _BCD__ZN4fltk11TextDisplay9move_downEv(__C_data);
}
void redisplay_range(int start, int end) {
_BCD__ZN4fltk11TextDisplay15redisplay_rangeEii(__C_data, start, end);
}
void scroll(int topLineNum, int horizOffset) {
_BCD__ZN4fltk11TextDisplay6scrollEii(__C_data, topLineNum, horizOffset);
}
bool in_selection(int x, int y) {
return _BCD__ZN4fltk11TextDisplay12in_selectionEii(__C_data, x, y);
}
int line_start(int pos) {
return _BCD__ZN4fltk11TextDisplay10line_startEi(__C_data, pos);
}
int line_end(int pos, bool start_pos_is_line_start = false) {
return _BCD__ZN4fltk11TextDisplay8line_endEib(__C_data, pos, start_pos_is_line_start);
}
int visible_lines() {
return _BCD__ZNK4fltk11TextDisplay13visible_linesEv(__C_data);
}
int top_line() {
return _BCD__ZNK4fltk11TextDisplay8top_lineEv(__C_data);
}
int hor_offset() {
return _BCD__ZNK4fltk11TextDisplay10hor_offsetEv(__C_data);
}
int find_next_char(int pos) {
return _BCD__ZN4fltk11TextDisplay14find_next_charEi(__C_data, pos);
}
int find_prev_char(int pos) {
return _BCD__ZN4fltk11TextDisplay14find_prev_charEi(__C_data, pos);
}
int xy_to_position(int X, int Y, int PosType = CHARACTER_POS) {
return _BCD__ZN4fltk11TextDisplay14xy_to_positionEiii(__C_data, X, Y, PosType);
}
void xy_to_rowcol(int X, int Y, int * row, int * column, int PosType = CHARACTER_POS) {
_BCD__ZN4fltk11TextDisplay12xy_to_rowcolEiiPiS1_i(__C_data, X, Y, row, column, PosType);
}
bool position_to_xy(int pos, int * X, int * Y) {
return _BCD__ZN4fltk11TextDisplay14position_to_xyEiPiS1_(__C_data, pos, X, Y);
}
int total_lines() {
return _BCD__ZN4fltk11TextDisplay11total_linesEv(__C_data);
}
}
class TextDisplay_R : TextDisplay {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk11TextDisplayE__TextDisplay_R(__C_data);
__C_data = null;
}
this(int X, int Y, int W, int H, char * l = null) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk11TextDisplayC1EiiiiPKc_R(X, Y, W, H, l);
__C_data_owned = true;
_BCD_RI_N4fltk11TextDisplayE(__C_data, cast(void *) this);
}
}