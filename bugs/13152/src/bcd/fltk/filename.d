/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk.filename;
public import bcd.bind;
public import std.c.dirent;
const int FL_PATH_MAX = 256;
alias int function(dirent * *, dirent * *) _BCD_func__4;
alias _BCD_func__4 Fl_File_Sort_F;
extern (C) int _BCD__Z16fl_filename_listPKcPPP6direntPFiS3_S3_E(char *, dirent * * *, _BCD_func__4);
extern (C) int _BCD__Z20fl_filename_relativePcPKc(char *, char *);
extern (C) int _BCD__Z20fl_filename_absolutePcPKc(char *, char *);
extern (C) int _BCD__Z18fl_filename_expandPcPKc(char *, char *);
extern (C) char * _BCD__Z18fl_filename_setextPcPKc(char *, char *);
extern (C) int _BCD__Z17fl_filename_isdirPKc(char *);
extern (C) int _BCD__Z17fl_filename_matchPKcS0_(char *, char *);
extern (C) int _BCD__Z20fl_filename_relativePciPKc(char *, int, char *);
extern (C) int _BCD__Z20fl_filename_absolutePciPKc(char *, int, char *);
extern (C) int _BCD__Z18fl_filename_expandPciPKc(char *, int, char *);
extern (C) char * _BCD__Z18fl_filename_setextPciPKc(char *, int, char *);
extern (C) char * _BCD__Z15fl_filename_extPKc(char *);
extern (C) char * _BCD__Z16fl_filename_namePKc(char *);
int fl_filename_list(char * d, dirent * * * l, _BCD_func__4 s) {
return _BCD__Z16fl_filename_listPKcPPP6direntPFiS3_S3_E(d, l, s);
}
int fl_filename_relative(char * to, char * from) {
return _BCD__Z20fl_filename_relativePcPKc(to, from);
}
int fl_filename_absolute(char * to, char * from) {
return _BCD__Z20fl_filename_absolutePcPKc(to, from);
}
int fl_filename_expand(char * to, char * from) {
return _BCD__Z18fl_filename_expandPcPKc(to, from);
}
char * fl_filename_setext(char * to, char * ext) {
return _BCD__Z18fl_filename_setextPcPKc(to, ext);
}
int fl_filename_isdir(char * name) {
return _BCD__Z17fl_filename_isdirPKc(name);
}
int fl_filename_match(char * name, char * pattern) {
return _BCD__Z17fl_filename_matchPKcS0_(name, pattern);
}
int fl_filename_relative(char * to, int tolen, char * from) {
return _BCD__Z20fl_filename_relativePciPKc(to, tolen, from);
}
int fl_filename_absolute(char * to, int tolen, char * from) {
return _BCD__Z20fl_filename_absolutePciPKc(to, tolen, from);
}
int fl_filename_expand(char * to, int tolen, char * from) {
return _BCD__Z18fl_filename_expandPciPKc(to, tolen, from);
}
char * fl_filename_setext(char * to, int tolen, char * ext) {
return _BCD__Z18fl_filename_setextPciPKc(to, tolen, ext);
}
char * fl_filename_ext(char * _0) {
return _BCD__Z15fl_filename_extPKc(_0);
}
char * fl_filename_name(char * _0) {
return _BCD__Z16fl_filename_namePKc(_0);
}