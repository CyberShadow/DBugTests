/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Fl_JPEG_Image.H"
extern "C" {
void _BCD_delete_13Fl_JPEG_Image(Fl_JPEG_Image *This) {
delete This;
}
Fl_JPEG_Image *_BCD_new__ZN13Fl_JPEG_ImageC1EPKc(char const * filename) {
return new Fl_JPEG_Image(filename);
}
}
class Fl_JPEG_Image_R : Fl_JPEG_Image {
public:
void *__D_data;
Fl_JPEG_Image_R(char const * filename) : Fl_JPEG_Image(filename) {}
};
extern "C" {
Fl_JPEG_Image_R *_BCD_new__ZN13Fl_JPEG_ImageC1EPKc_R(char const * filename) {
return new Fl_JPEG_Image_R(filename);
}
void _BCD_delete_13Fl_JPEG_Image__Fl_JPEG_Image_R(Fl_JPEG_Image_R *This) {
delete This;
}
void _BCD_RI_13Fl_JPEG_Image(Fl_JPEG_Image_R *cd, void *dd) {
cd->__D_data = dd;
}
typedef long unsigned int _BCD__47_ulong;
typedef unsigned char _BCD__49_uchar;
}
