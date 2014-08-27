/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "FL/Enumerations.H"
extern "C" {
enum Fl_Color _BCD__Z13fl_color_cubeiii(int r, int g, int b) {
return (fl_color_cube(r, g, b));
}
enum Fl_Color _BCD__Z12fl_gray_rampi(int i) {
return (fl_gray_ramp(i));
}
typedef unsigned char _BCD__40_uchar;
enum Fl_Color _BCD__Z12fl_rgb_colorh(_BCD__40_uchar g) {
return (fl_rgb_color(g));
}
enum Fl_Color _BCD__Z12fl_rgb_colorhhh(_BCD__40_uchar r, _BCD__40_uchar g, _BCD__40_uchar b) {
return (fl_rgb_color(r, g, b));
}
enum Fl_Color _BCD__Z9fl_darker8Fl_Color(enum Fl_Color c) {
return (fl_darker(c));
}
enum Fl_Color _BCD__Z10fl_lighter8Fl_Color(enum Fl_Color c) {
return (fl_lighter(c));
}
enum Fl_Color _BCD__Z16fl_color_average8Fl_ColorS_f(enum Fl_Color c1, enum Fl_Color c2, float weight) {
return (fl_color_average(c1, c2, weight));
}
enum Fl_Color _BCD__Z11fl_contrast8Fl_ColorS_(enum Fl_Color fg, enum Fl_Color bg) {
return (fl_contrast(fg, bg));
}
enum Fl_Color _BCD__Z11fl_inactive8Fl_Color(enum Fl_Color c) {
return (fl_inactive(c));
}
enum Fl_Labeltype _BCD__Z27fl_define_FL_EMBOSSED_LABELv() {
return (fl_define_FL_EMBOSSED_LABEL());
}
enum Fl_Labeltype _BCD__Z27fl_define_FL_ENGRAVED_LABELv() {
return (fl_define_FL_ENGRAVED_LABEL());
}
enum Fl_Labeltype _BCD__Z25fl_define_FL_SHADOW_LABELv() {
return (fl_define_FL_SHADOW_LABEL());
}
enum Fl_Boxtype _BCD__Z8fl_frame10Fl_Boxtype(enum Fl_Boxtype b) {
return (fl_frame(b));
}
enum Fl_Boxtype _BCD__Z7fl_down10Fl_Boxtype(enum Fl_Boxtype b) {
return (fl_down(b));
}
enum Fl_Boxtype _BCD__Z27fl_define_FL_PLASTIC_UP_BOXv() {
return (fl_define_FL_PLASTIC_UP_BOX());
}
enum Fl_Boxtype _BCD__Z21fl_define_FL_OVAL_BOXv() {
return (fl_define_FL_OVAL_BOX());
}
enum Fl_Boxtype _BCD__Z24fl_define_FL_DIAMOND_BOXv() {
return (fl_define_FL_DIAMOND_BOX());
}
enum Fl_Boxtype _BCD__Z24fl_define_FL_RSHADOW_BOXv() {
return (fl_define_FL_RSHADOW_BOX());
}
enum Fl_Boxtype _BCD__Z22fl_define_FL_RFLAT_BOXv() {
return (fl_define_FL_RFLAT_BOX());
}
enum Fl_Boxtype _BCD__Z24fl_define_FL_ROUNDED_BOXv() {
return (fl_define_FL_ROUNDED_BOX());
}
enum Fl_Boxtype _BCD__Z23fl_define_FL_SHADOW_BOXv() {
return (fl_define_FL_SHADOW_BOX());
}
enum Fl_Boxtype _BCD__Z25fl_define_FL_ROUND_UP_BOXv() {
return (fl_define_FL_ROUND_UP_BOX());
}
typedef long unsigned int _BCD__38_ulong;
}