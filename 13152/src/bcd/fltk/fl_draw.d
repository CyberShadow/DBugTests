/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.fl_draw;
public import bcd.bind;
public import bcd.fltk.Enumerations;
alias void function(int) _BCD_func__286;
extern (C) int _BCD__Z13fl_add_symbolPKcPFv8Fl_ColorEi(char *, _BCD_func__286, int);
extern (C) int _BCD__Z14fl_draw_symbolPKciiii8Fl_Color(char *, int, int, int, int, int);
extern (C) void _BCD__Z9fl_cursor9Fl_Cursor8Fl_ColorS0_(int, int, int);
extern (C) void _BCD__Z16fl_overlay_clearv();
extern (C) void _BCD__Z15fl_overlay_rectiiii(int, int, int, int);
extern (C) char * _BCD__Z17fl_shortcut_labeli(int);
alias void function(void *, int, int, int, int) _BCD_func__287;
extern (C) void _BCD__Z9fl_scrolliiiiiiPFvPviiiiES_(int, int, int, int, int, int, _BCD_func__287, void *);
extern (C) int _BCD__Z17fl_measure_pixmapPKPKcRiS3_(char * *, int *, int *);
extern (C) int _BCD__Z14fl_draw_pixmapPKPKcii8Fl_Color(char * *, int, int, int);
extern (C) char * _BCD__Z13fl_read_imagePhiiiii(char *, int, int, int, int, int);
extern (C) void _BCD__Z8fl_rectfiiiihhh(int, int, int, int, char, char, char);
alias void function(void *, int, int, int, char *) _BCD_func__266;
alias _BCD_func__266 Fl_Draw_Image_Cb;
extern (C) void _BCD__Z18fl_draw_image_monoPFvPviiiPhES_iiiii(_BCD_func__266, void *, int, int, int, int, int);
extern (C) void _BCD__Z13fl_draw_imagePFvPviiiPhES_iiiii(_BCD_func__266, void *, int, int, int, int, int);
extern (C) void _BCD__Z18fl_draw_image_monoPKhiiiiii(char *, int, int, int, int, int, int);
extern (C) void _BCD__Z13fl_draw_imagePKhiiiiii(char *, int, int, int, int, int, int);
extern (C) void _BCD__Z11fl_draw_box10Fl_Boxtypeiiii8Fl_Color(int, int, int, int, int, int);
extern (C) void _BCD__Z9fl_frame2PKciiii(char *, int, int, int, int);
extern (C) void _BCD__Z8fl_framePKciiii(char *, int, int, int, int);
alias void function(char *, int, int, int) _BCD_func__291;
extern (C) void _BCD__Z7fl_drawPKciiii8Fl_AlignPFvS0_iiiEP8Fl_Imagei(char *, int, int, int, int, int, _BCD_func__291, void *, int);
extern (C) void _BCD__Z7fl_drawPKciiii8Fl_AlignP8Fl_Imagei(char *, int, int, int, int, int, void *, int);
extern (C) void _BCD__Z10fl_measurePKcRiS1_i(char *, int *, int *, int);
extern (C) void _BCD__Z7fl_drawPKciii(char *, int, int, int);
extern (C) void _BCD__Z7fl_drawPKcii(char *, int, int);
extern (C) double _BCD__Z8fl_widthh(char);
extern (C) double _BCD__Z8fl_widthPKci(char *, int);
extern (C) double _BCD__Z8fl_widthPKc(char *);
extern (C) int _BCD__Z10fl_descentv();
extern (C) int _BCD__Z9fl_heightii(int, int);
extern (C) int _BCD__Z9fl_heightv();
extern (C) int _BCD__Z7fl_sizev();
extern (C) int _BCD__Z7fl_fontv();
extern (C) void _BCD__Z7fl_fontii(int, int);
extern (C) void _BCD__Z21fl_transformed_vertexdd(double, double);
extern (C) double _BCD__Z15fl_transform_dydd(double, double);
extern (C) double _BCD__Z15fl_transform_dxdd(double, double);
extern (C) double _BCD__Z14fl_transform_ydd(double, double);
extern (C) double _BCD__Z14fl_transform_xdd(double, double);
extern (C) void _BCD__Z22fl_end_complex_polygonv();
extern (C) void _BCD__Z6fl_gapv();
extern (C) void _BCD__Z24fl_begin_complex_polygonv();
extern (C) void _BCD__Z14fl_end_polygonv();
extern (C) void _BCD__Z11fl_end_loopv();
extern (C) void _BCD__Z11fl_end_linev();
extern (C) void _BCD__Z13fl_end_pointsv();
extern (C) void _BCD__Z9fl_circleddd(double, double, double);
extern (C) void _BCD__Z6fl_arcddddd(double, double, double, double, double);
extern (C) void _BCD__Z8fl_curvedddddddd(double, double, double, double, double, double, double, double);
extern (C) void _BCD__Z9fl_vertexdd(double, double);
extern (C) void _BCD__Z16fl_begin_polygonv();
extern (C) void _BCD__Z13fl_begin_loopv();
extern (C) void _BCD__Z13fl_begin_linev();
extern (C) void _BCD__Z15fl_begin_pointsv();
extern (C) void _BCD__Z14fl_mult_matrixdddddd(double, double, double, double, double, double);
extern (C) void _BCD__Z9fl_rotated(double);
extern (C) void _BCD__Z12fl_translatedd(double, double);
extern (C) void _BCD__Z8fl_scaled(double);
extern (C) void _BCD__Z8fl_scaledd(double, double);
extern (C) void _BCD__Z13fl_pop_matrixv();
extern (C) void _BCD__Z14fl_push_matrixv();
extern (C) void _BCD__Z8fl_chordiiiidd(int, int, int, int, double, double);
extern (C) void _BCD__Z6fl_pieiiiidd(int, int, int, int, double, double);
extern (C) void _BCD__Z6fl_arciiiidd(int, int, int, int, double, double);
extern (C) void _BCD__Z9fl_yxlineiiiii(int, int, int, int, int);
extern (C) void _BCD__Z9fl_yxlineiiii(int, int, int, int);
extern (C) void _BCD__Z9fl_yxlineiii(int, int, int);
extern (C) void _BCD__Z9fl_xylineiiiii(int, int, int, int, int);
extern (C) void _BCD__Z9fl_xylineiiii(int, int, int, int);
extern (C) void _BCD__Z9fl_xylineiii(int, int, int);
extern (C) void _BCD__Z10fl_polygoniiiiiiii(int, int, int, int, int, int, int, int);
extern (C) void _BCD__Z10fl_polygoniiiiii(int, int, int, int, int, int);
extern (C) void _BCD__Z7fl_loopiiiiiiii(int, int, int, int, int, int, int, int);
extern (C) void _BCD__Z7fl_loopiiiiii(int, int, int, int, int, int);
extern (C) void _BCD__Z7fl_lineiiiiii(int, int, int, int, int, int);
extern (C) void _BCD__Z7fl_lineiiii(int, int, int, int);
extern (C) void _BCD__Z8fl_rectfiiii8Fl_Color(int, int, int, int, int);
extern (C) void _BCD__Z8fl_rectfiiii(int, int, int, int);
extern (C) void _BCD__Z7fl_rectiiii8Fl_Color(int, int, int, int, int);
extern (C) void _BCD__Z7fl_rectiiii(int, int, int, int);
extern (C) void _BCD__Z13fl_line_styleiiPc(int, int, char *);
extern (C) void _BCD__Z8fl_pointii(int, int);
extern (C) int _BCD__Z11fl_clip_boxiiiiRiS_S_S_(int, int, int, int, int *, int *, int *, int *);
extern (C) int _BCD__Z14fl_not_clippediiii(int, int, int, int);
extern (C) void _BCD__Z11fl_pop_clipv();
extern (C) void _BCD__Z15fl_push_no_clipv();
extern (C) void _BCD__Z12fl_push_clipiiii(int, int, int, int);
extern (C) int _BCD__Z8fl_colorv();
extern (C) void _BCD__Z8fl_colorhhh(char, char, char);
extern (C) void _BCD__Z8fl_colori(int);
const int FL_SOLID = 0;
const int FL_DASH = 1;
const int FL_DOT = 2;
const int FL_DASHDOT = 3;
const int FL_DASHDOTDOT = 4;
const int FL_CAP_FLAT = 256;
const int FL_CAP_ROUND = 512;
const int FL_CAP_SQUARE = 768;
const int FL_JOIN_MITER = 4096;
const int FL_JOIN_ROUND = 8192;
const int FL_JOIN_BEVEL = 12288;
int fl_add_symbol(char * name, _BCD_func__286 drawit, int scalable) {
return _BCD__Z13fl_add_symbolPKcPFv8Fl_ColorEi(name, drawit, scalable);
}
int fl_draw_symbol(char * label, int x, int y, int w, int h, int _5) {
return _BCD__Z14fl_draw_symbolPKciiii8Fl_Color(label, x, y, w, h, _5);
}
void fl_cursor(int _0, int _1, int _2) {
_BCD__Z9fl_cursor9Fl_Cursor8Fl_ColorS0_(_0, _1, _2);
}
void fl_overlay_clear() {
_BCD__Z16fl_overlay_clearv();
}
void fl_overlay_rect(int _0, int _1, int _2, int _3) {
_BCD__Z15fl_overlay_rectiiii(_0, _1, _2, _3);
}
char * fl_shortcut_label(int _0) {
return _BCD__Z17fl_shortcut_labeli(_0);
}
void fl_scroll(int X, int Y, int W, int H, int dx, int dy, _BCD_func__287 draw_area, void * data) {
_BCD__Z9fl_scrolliiiiiiPFvPviiiiES_(X, Y, W, H, dx, dy, draw_area, data);
}
int fl_measure_pixmap(char * * data, int * w, int * h) {
return _BCD__Z17fl_measure_pixmapPKPKcRiS3_(data, w, h);
}
int fl_draw_pixmap(char * * data, int x, int y, int _3) {
return _BCD__Z14fl_draw_pixmapPKPKcii8Fl_Color(data, x, y, _3);
}
char * fl_read_image(char * p, int x, int y, int w, int h, int alpha) {
return _BCD__Z13fl_read_imagePhiiiii(p, x, y, w, h, alpha);
}
void fl_rectf(int x, int y, int w, int h, char r, char g, char b) {
_BCD__Z8fl_rectfiiiihhh(x, y, w, h, r, g, b);
}
void fl_draw_image_mono(_BCD_func__266 _0, void * _1, int _2, int _3, int _4, int _5, int delta) {
_BCD__Z18fl_draw_image_monoPFvPviiiPhES_iiiii(_0, _1, _2, _3, _4, _5, delta);
}
void fl_draw_image(_BCD_func__266 _0, void * _1, int _2, int _3, int _4, int _5, int delta) {
_BCD__Z13fl_draw_imagePFvPviiiPhES_iiiii(_0, _1, _2, _3, _4, _5, delta);
}
void fl_draw_image_mono(char * _0, int _1, int _2, int _3, int _4, int delta, int ld) {
_BCD__Z18fl_draw_image_monoPKhiiiiii(_0, _1, _2, _3, _4, delta, ld);
}
void fl_draw_image(char * _0, int _1, int _2, int _3, int _4, int delta, int ldelta) {
_BCD__Z13fl_draw_imagePKhiiiiii(_0, _1, _2, _3, _4, delta, ldelta);
}
void fl_draw_box(int _0, int x, int y, int w, int h, int _5) {
_BCD__Z11fl_draw_box10Fl_Boxtypeiiii8Fl_Color(_0, x, y, w, h, _5);
}
void fl_frame2(char * s, int x, int y, int w, int h) {
_BCD__Z9fl_frame2PKciiii(s, x, y, w, h);
}
void fl_frame(char * s, int x, int y, int w, int h) {
_BCD__Z8fl_framePKciiii(s, x, y, w, h);
}
void fl_draw(char * _0, int _1, int _2, int _3, int _4, int _5, _BCD_func__291 callthis, bcd.bind.BoundClass * img, int draw_symbols) {
_BCD__Z7fl_drawPKciiii8Fl_AlignPFvS0_iiiEP8Fl_Imagei(_0, _1, _2, _3, _4, _5, callthis, img.__C_data, draw_symbols);
}
void fl_draw(char * _0, int _1, int _2, int _3, int _4, int _5, bcd.bind.BoundClass * img, int draw_symbols) {
_BCD__Z7fl_drawPKciiii8Fl_AlignP8Fl_Imagei(_0, _1, _2, _3, _4, _5, img.__C_data, draw_symbols);
}
void fl_measure(char * _0, int * x, int * y, int draw_symbols) {
_BCD__Z10fl_measurePKcRiS1_i(_0, x, y, draw_symbols);
}
void fl_draw(char * _0, int n, int x, int y) {
_BCD__Z7fl_drawPKciii(_0, n, x, y);
}
void fl_draw(char * _0, int x, int y) {
_BCD__Z7fl_drawPKcii(_0, x, y);
}
double fl_width(char _0) {
return _BCD__Z8fl_widthh(_0);
}
double fl_width(char * _0, int n) {
return _BCD__Z8fl_widthPKci(_0, n);
}
double fl_width(char * _0) {
return _BCD__Z8fl_widthPKc(_0);
}
int fl_descent() {
return _BCD__Z10fl_descentv();
}
int fl_height(int _0, int size) {
return _BCD__Z9fl_heightii(_0, size);
}
int fl_height() {
return _BCD__Z9fl_heightv();
}
int fl_size() {
return _BCD__Z7fl_sizev();
}
int fl_font() {
return _BCD__Z7fl_fontv();
}
void fl_font(int face, int size) {
_BCD__Z7fl_fontii(face, size);
}
void fl_transformed_vertex(double x, double y) {
_BCD__Z21fl_transformed_vertexdd(x, y);
}
double fl_transform_dy(double x, double y) {
return _BCD__Z15fl_transform_dydd(x, y);
}
double fl_transform_dx(double x, double y) {
return _BCD__Z15fl_transform_dxdd(x, y);
}
double fl_transform_y(double x, double y) {
return _BCD__Z14fl_transform_ydd(x, y);
}
double fl_transform_x(double x, double y) {
return _BCD__Z14fl_transform_xdd(x, y);
}
void fl_end_complex_polygon() {
_BCD__Z22fl_end_complex_polygonv();
}
void fl_gap() {
_BCD__Z6fl_gapv();
}
void fl_begin_complex_polygon() {
_BCD__Z24fl_begin_complex_polygonv();
}
void fl_end_polygon() {
_BCD__Z14fl_end_polygonv();
}
void fl_end_loop() {
_BCD__Z11fl_end_loopv();
}
void fl_end_line() {
_BCD__Z11fl_end_linev();
}
void fl_end_points() {
_BCD__Z13fl_end_pointsv();
}
void fl_circle(double x, double y, double r) {
_BCD__Z9fl_circleddd(x, y, r);
}
void fl_arc(double x, double y, double r, double start, double a) {
_BCD__Z6fl_arcddddd(x, y, r, start, a);
}
void fl_curve(double _0, double _1, double _2, double _3, double _4, double _5, double _6, double _7) {
_BCD__Z8fl_curvedddddddd(_0, _1, _2, _3, _4, _5, _6, _7);
}
void fl_vertex(double x, double y) {
_BCD__Z9fl_vertexdd(x, y);
}
void fl_begin_polygon() {
_BCD__Z16fl_begin_polygonv();
}
void fl_begin_loop() {
_BCD__Z13fl_begin_loopv();
}
void fl_begin_line() {
_BCD__Z13fl_begin_linev();
}
void fl_begin_points() {
_BCD__Z15fl_begin_pointsv();
}
void fl_mult_matrix(double a, double b, double c, double d, double x, double y) {
_BCD__Z14fl_mult_matrixdddddd(a, b, c, d, x, y);
}
void fl_rotate(double d) {
_BCD__Z9fl_rotated(d);
}
void fl_translate(double x, double y) {
_BCD__Z12fl_translatedd(x, y);
}
void fl_scale(double x) {
_BCD__Z8fl_scaled(x);
}
void fl_scale(double x, double y) {
_BCD__Z8fl_scaledd(x, y);
}
void fl_pop_matrix() {
_BCD__Z13fl_pop_matrixv();
}
void fl_push_matrix() {
_BCD__Z14fl_push_matrixv();
}
void fl_chord(int x, int y, int w, int h, double a1, double a2) {
_BCD__Z8fl_chordiiiidd(x, y, w, h, a1, a2);
}
void fl_pie(int x, int y, int w, int h, double a1, double a2) {
_BCD__Z6fl_pieiiiidd(x, y, w, h, a1, a2);
}
void fl_arc(int x, int y, int w, int h, double a1, double a2) {
_BCD__Z6fl_arciiiidd(x, y, w, h, a1, a2);
}
void fl_yxline(int x, int y, int y1, int x2, int y3) {
_BCD__Z9fl_yxlineiiiii(x, y, y1, x2, y3);
}
void fl_yxline(int x, int y, int y1, int x2) {
_BCD__Z9fl_yxlineiiii(x, y, y1, x2);
}
void fl_yxline(int x, int y, int y1) {
_BCD__Z9fl_yxlineiii(x, y, y1);
}
void fl_xyline(int x, int y, int x1, int y2, int x3) {
_BCD__Z9fl_xylineiiiii(x, y, x1, y2, x3);
}
void fl_xyline(int x, int y, int x1, int y2) {
_BCD__Z9fl_xylineiiii(x, y, x1, y2);
}
void fl_xyline(int x, int y, int x1) {
_BCD__Z9fl_xylineiii(x, y, x1);
}
void fl_polygon(int _0, int _1, int _2, int _3, int _4, int _5, int _6, int _7) {
_BCD__Z10fl_polygoniiiiiiii(_0, _1, _2, _3, _4, _5, _6, _7);
}
void fl_polygon(int _0, int _1, int _2, int _3, int _4, int _5) {
_BCD__Z10fl_polygoniiiiii(_0, _1, _2, _3, _4, _5);
}
void fl_loop(int _0, int _1, int _2, int _3, int _4, int _5, int _6, int _7) {
_BCD__Z7fl_loopiiiiiiii(_0, _1, _2, _3, _4, _5, _6, _7);
}
void fl_loop(int _0, int _1, int _2, int _3, int _4, int _5) {
_BCD__Z7fl_loopiiiiii(_0, _1, _2, _3, _4, _5);
}
void fl_line(int _0, int _1, int _2, int _3, int _4, int _5) {
_BCD__Z7fl_lineiiiiii(_0, _1, _2, _3, _4, _5);
}
void fl_line(int _0, int _1, int _2, int _3) {
_BCD__Z7fl_lineiiii(_0, _1, _2, _3);
}
void fl_rectf(int x, int y, int w, int h, int c) {
_BCD__Z8fl_rectfiiii8Fl_Color(x, y, w, h, c);
}
void fl_rectf(int x, int y, int w, int h) {
_BCD__Z8fl_rectfiiii(x, y, w, h);
}
void fl_rect(int x, int y, int w, int h, int c) {
_BCD__Z7fl_rectiiii8Fl_Color(x, y, w, h, c);
}
void fl_rect(int x, int y, int w, int h) {
_BCD__Z7fl_rectiiii(x, y, w, h);
}
void fl_line_style(int style, int width, char * dashes) {
_BCD__Z13fl_line_styleiiPc(style, width, dashes);
}
void fl_point(int x, int y) {
_BCD__Z8fl_pointii(x, y);
}
int fl_clip_box(int _0, int _1, int _2, int _3, int * x, int * y, int * w, int * h) {
return _BCD__Z11fl_clip_boxiiiiRiS_S_S_(_0, _1, _2, _3, x, y, w, h);
}
int fl_not_clipped(int x, int y, int w, int h) {
return _BCD__Z14fl_not_clippediiii(x, y, w, h);
}
void fl_pop_clip() {
_BCD__Z11fl_pop_clipv();
}
void fl_push_no_clip() {
_BCD__Z15fl_push_no_clipv();
}
void fl_push_clip(int x, int y, int w, int h) {
_BCD__Z12fl_push_clipiiii(x, y, w, h);
}
int fl_color() {
return _BCD__Z8fl_colorv();
}
void fl_color(char _0, char _1, char _2) {
_BCD__Z8fl_colorhhh(_0, _1, _2);
}
void fl_color(int c) {
_BCD__Z8fl_colori(c);
}
