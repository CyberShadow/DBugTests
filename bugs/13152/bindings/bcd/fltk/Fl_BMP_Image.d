/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.Fl_BMP_Image;
public import bcd.bind;
public import bcd.fltk.Fl_Image;
public import bcd.fltk.Enumerations;
extern (C) void _BCD_delete_12Fl_BMP_Image(void *);
extern (C) void *_BCD_new__ZN12Fl_BMP_ImageC1EPKc(char *);
extern (C) void _BCD_RI_12Fl_BMP_Image(void *cd, void *dd);
extern (C) void _BCD_delete_12Fl_BMP_Image__Fl_BMP_Image_R(void *This);
extern (C) void *_BCD_new__ZN12Fl_BMP_ImageC1EPKc_R(char *);
class Fl_BMP_Image : Fl_RGB_Image {
this(ifloat ignore) {
super(ignore);
}
this(ifloat ignore, void *x) {
super(ignore);
__C_data = x;
__C_data_owned = false;
}
~this() {
if (__C_data && __C_data_owned) _BCD_delete_12Fl_BMP_Image(__C_data);
__C_data = null;
}
this(char * filename) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN12Fl_BMP_ImageC1EPKc(filename);
__C_data_owned = true;
}
}
class Fl_BMP_Image_R : Fl_BMP_Image {
~this() {
if (__C_data && __C_data_owned) _BCD_delete_12Fl_BMP_Image__Fl_BMP_Image_R(__C_data);
__C_data = null;
}
this(char * filename) {
super(cast(ifloat) 0);
__C_data = _BCD_new__ZN12Fl_BMP_ImageC1EPKc_R(filename);
__C_data_owned = true;
_BCD_RI_12Fl_BMP_Image(__C_data, cast(void *) this);
}
}