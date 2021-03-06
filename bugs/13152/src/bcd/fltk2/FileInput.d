/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.FileInput;
import bcd.bind;
import bcd.fltk2.Input;
import bcd.fltk2.Widget;
import bcd.fltk2.Style;
import bcd.fltk2.FL_API;
import bcd.fltk2.Rectangle;
import bcd.fltk2.Color;
import bcd.fltk2.Flags;
extern (C) void _BCD_delete_N4fltk9FileInputE(void *);
extern (C) void *_BCD_new__ZN4fltk9FileInputC1EiiiiPKc(int, int, int, int, char *);
extern (C) void _BCD__ZN4fltk9FileInput10draw_boxesEbRKNS_9RectangleE(void *This, bool, void *);
extern (C) int _BCD__ZN4fltk9FileInput6handleEi(void *This, int);
extern (C) void _BCD__ZN4fltk9FileInput4drawEv(void *This);
extern (C) uint _BCD__ZNK4fltk9FileInput10errorcolorEv(void *This);
extern (C) void _BCD__ZN4fltk9FileInput10errorcolorEj(void *This, uint);
extern (C) char * _BCD__ZN4fltk9FileInput4textEv(void *This);
alias void function(Widget *, int) _BCD_func__144;
alias void function(Widget *) _BCD_func__146;
alias void function(Widget *, void *) _BCD_func__150;
alias bool function() _BCD_func__330;
class FileInput : Input {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_N4fltk9FileInputE(__C_data);
__C_data = null;
}
this(int _0, int _1, int _2, int _3, char * t) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN4fltk9FileInputC1EiiiiPKc(_0, _1, _2, _3, t);
__C_data_owned = true;
}
void draw_boxes(bool pressed, Rectangle r) {
_BCD__ZN4fltk9FileInput10draw_boxesEbRKNS_9RectangleE(__C_data, pressed, r.__C_data);
}
int handle(int _0) {
return _BCD__ZN4fltk9FileInput6handleEi(__C_data, _0);
}
void draw() {
_BCD__ZN4fltk9FileInput4drawEv(__C_data);
}
uint errorcolor() {
return _BCD__ZNK4fltk9FileInput10errorcolorEv(__C_data);
}
void errorcolor(uint c) {
_BCD__ZN4fltk9FileInput10errorcolorEj(__C_data, c);
}
char * text() {
return _BCD__ZN4fltk9FileInput4textEv(__C_data);
}
}
