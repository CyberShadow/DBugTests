/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_Tile.H"
extern "C" {
void _BCD_delete_7Fl_Tile(Fl_Tile *This) {
delete This;
}
int _BCD__ZN7Fl_Tile6handleEi(Fl_Tile *This, int _0) {
return (This->handle(_0));
}
Fl_Tile *_BCD_new__ZN7Fl_TileC1EiiiiPKc(int X, int Y, int W, int H, char const * l) {
return new Fl_Tile(X, Y, W, H, l);
}
void _BCD__ZN7Fl_Tile6resizeEiiii(Fl_Tile *This, int _0, int _1, int _2, int _3) {
(This->resize(_0, _1, _2, _3));
}
void _BCD__ZN7Fl_Tile8positionEiiii(Fl_Tile *This, int _0, int _1, int _2, int _3) {
(This->position(_0, _1, _2, _3));
}
int _BCD_R__ZN7Fl_Tile6handleEi__Fl_Tile_R_CHECK(void *);
int _BCD_R__ZN7Fl_Tile6handleEi__Fl_Tile_R(void *, int _0);
int _BCD_R__ZN7Fl_Tile6resizeEiiii__Fl_Tile_R_CHECK(void *);
void _BCD_R__ZN7Fl_Tile6resizeEiiii__Fl_Tile_R(void *, int _0, int _1, int _2, int _3);
}
class Fl_Tile_R : Fl_Tile {
public:
void *__D_data;
int handle(int _0) {
if (_BCD_R__ZN7Fl_Tile6handleEi__Fl_Tile_R_CHECK(__D_data))
return _BCD_R__ZN7Fl_Tile6handleEi__Fl_Tile_R(__D_data, _0);
else
return Fl_Tile::handle(_0);
}
Fl_Tile_R(int X, int Y, int W, int H, char const * l) : Fl_Tile(X, Y, W, H, l) {}
void resize(int _0, int _1, int _2, int _3) {
if (_BCD_R__ZN7Fl_Tile6resizeEiiii__Fl_Tile_R_CHECK(__D_data))
_BCD_R__ZN7Fl_Tile6resizeEiiii__Fl_Tile_R(__D_data, _0, _1, _2, _3);
else
Fl_Tile::resize(_0, _1, _2, _3);
}
};
extern "C" {
Fl_Tile_R *_BCD_new__ZN7Fl_TileC1EiiiiPKc_R(int X, int Y, int W, int H, char const * l) {
return new Fl_Tile_R(X, Y, W, H, l);
}
void _BCD_delete_7Fl_Tile__Fl_Tile_R(Fl_Tile_R *This) {
delete This;
}
void _BCD_RI_7Fl_Tile(Fl_Tile_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef void (*_BCD_func__9)(Fl_Widget *, long int);
typedef _BCD_func__9 _BCD__10_Fl_Callback1;
typedef void (*_BCD_func__11)(Fl_Widget *);
typedef _BCD_func__11 _BCD__12_Fl_Callback0;
typedef void (*_BCD_func__15)(Fl_Widget *, void *);
typedef _BCD_func__15 _BCD__16_Fl_Callback;
typedef _BCD__16_Fl_Callback _BCD__14_Fl_Callback_p;
typedef long unsigned int _BCD__56_ulong;
typedef unsigned char _BCD__58_uchar;
}
