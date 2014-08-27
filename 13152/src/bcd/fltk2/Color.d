/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.Color;
align(4):
public import bcd.bind;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.Flags;
alias uint Color;
extern (C) uint _BCD__ZN4fltk13nearest_indexEj(uint);
extern (C) void _BCD__ZN4fltk14set_backgroundEj(uint);
extern (C) uint _BCD__ZN4fltk15get_color_indexEj(uint);
extern (C) void _BCD__ZN4fltk15set_color_indexEjj(uint, uint);
extern (C) void _BCD__ZN4fltk11split_colorEjRhS0_S0_(uint, char *, char *, char *);
extern (C) uint _BCD__ZN4fltk8contrastEjj(uint, uint);
extern (C) uint _BCD__ZN4fltk8inactiveEjj(uint, uint);
extern (C) uint _BCD__ZN4fltk8inactiveEj(uint);
extern (C) uint _BCD__ZN4fltk4lerpEjjf(uint, uint, float);
extern (C) uint _BCD__ZN4fltk10parsecolorEPKcj(char *, uint);
extern (C) uint _BCD__ZN4fltk5colorEPKc(char *);
extern (C) uint _BCD__ZN4fltk5colorEh(char);
extern (C) uint _BCD__ZN4fltk5colorEhhh(char, char, char);
const int NO_COLOR = 0;
const int FREE_COLOR = 16;
const int NUM_FREE_COLOR = 16;
const int GRAY00 = 32;
const int GRAY05 = 33;
const int GRAY10 = 34;
const int GRAY15 = 35;
const int GRAY20 = 36;
const int GRAY25 = 37;
const int GRAY30 = 38;
const int GRAY33 = 39;
const int GRAY35 = 40;
const int GRAY40 = 41;
const int GRAY45 = 42;
const int GRAY50 = 43;
const int GRAY55 = 44;
const int GRAY60 = 45;
const int GRAY65 = 46;
const int GRAY66 = 47;
const int GRAY70 = 48;
const int GRAY75 = 49;
const int GRAY80 = 50;
const int GRAY85 = 51;
const int GRAY90 = 53;
const int GRAY95 = 54;
const int GRAY99 = 55;
const int BLACK = 56;
const int RED = 88;
const int GREEN = 63;
const int YELLOW = 95;
const int BLUE = 216;
const int MAGENTA = 248;
const int CYAN = 223;
const int WHITE = 255;
const int DARK_RED = 72;
const int DARK_GREEN = 60;
const int DARK_YELLOW = 76;
const int DARK_BLUE = 136;
const int DARK_MAGENTA = 152;
const int DARK_CYAN = 140;
const int WINDOWS_BLUE = 136;
uint nearest_index(uint _0) {
return _BCD__ZN4fltk13nearest_indexEj(_0);
}
void set_background(uint _0) {
_BCD__ZN4fltk14set_backgroundEj(_0);
}
uint get_color_index(uint index) {
return _BCD__ZN4fltk15get_color_indexEj(index);
}
void set_color_index(uint index, uint _1) {
_BCD__ZN4fltk15set_color_indexEjj(index, _1);
}
void split_color(uint c, char * r, char * g, char * b) {
_BCD__ZN4fltk11split_colorEjRhS0_S0_(c, r, g, b);
}
uint contrast(uint fg, uint bg) {
return _BCD__ZN4fltk8contrastEjj(fg, bg);
}
uint inactive(uint fg, uint bg) {
return _BCD__ZN4fltk8inactiveEjj(fg, bg);
}
uint inactive(uint fg) {
return _BCD__ZN4fltk8inactiveEj(fg);
}
uint lerp(uint c0, uint c1, float f) {
return _BCD__ZN4fltk4lerpEjjf(c0, c1, f);
}
uint parsecolor(char * _0, uint length) {
return _BCD__ZN4fltk10parsecolorEPKcj(_0, length);
}
uint color(char * _0) {
return _BCD__ZN4fltk5colorEPKc(_0);
}
uint color(char g) {
return _BCD__ZN4fltk5colorEh(g);
}
uint color(char r, char g, char b) {
return _BCD__ZN4fltk5colorEhhh(r, g, b);
}