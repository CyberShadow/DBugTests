/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_GIF_Image.H"
extern "C" {
void _BCD_delete_12Fl_GIF_Image(Fl_GIF_Image *This) {
delete This;
}
Fl_GIF_Image *_BCD_new__ZN12Fl_GIF_ImageC1EPKc(char const * filename) {
return new Fl_GIF_Image(filename);
}
}
class Fl_GIF_Image_R : Fl_GIF_Image {
public:
void *__D_data;
Fl_GIF_Image_R(char const * filename) : Fl_GIF_Image(filename) {}
};
extern "C" {
Fl_GIF_Image_R *_BCD_new__ZN12Fl_GIF_ImageC1EPKc_R(char const * filename) {
return new Fl_GIF_Image_R(filename);
}
void _BCD_delete_12Fl_GIF_Image__Fl_GIF_Image_R(Fl_GIF_Image_R *This) {
delete This;
}
void _BCD_RI_12Fl_GIF_Image(Fl_GIF_Image_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef long unsigned int _BCD__49_ulong;
typedef unsigned char _BCD__51_uchar;
}