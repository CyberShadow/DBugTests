/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/Monitor.h"
extern "C" {
typedef unsigned char _BCD__4_uchar;
void _BCD_delete_N4fltk7MonitorE(fltk::Monitor *This) {
delete This;
}
void _BCD_set__ZN4fltk7Monitor4workE(fltk::Monitor *This, fltk::Rectangle * x) {
memcpy(&This->work, x, sizeof(fltk::Rectangle));
}
fltk::Rectangle * _BCD_get__ZN4fltk7Monitor4workE(fltk::Monitor *This) {
return &This->work;
}
int _BCD__ZNK4fltk7Monitor5depthEv(fltk::Monitor *This) {
return (This->depth());
}
float _BCD__ZNK4fltk7Monitor5dpi_xEv(fltk::Monitor *This) {
return (This->dpi_x());
}
float _BCD__ZNK4fltk7Monitor5dpi_yEv(fltk::Monitor *This) {
return (This->dpi_y());
}
float _BCD__ZNK4fltk7Monitor3dpiEv(fltk::Monitor *This) {
return (This->dpi());
}
int _BCD__ZN4fltk7Monitor4listEPPKS0_(fltk::Monitor const * * _0) {
return (fltk::Monitor::list(_0));
}
fltk::Monitor   const & _BCD__ZN4fltk7Monitor3allEv() {
return (fltk::Monitor::all());
}
fltk::Monitor   const & _BCD__ZN4fltk7Monitor4findEii(int x, int y) {
return (fltk::Monitor::find(x, y));
}
}
class Monitor_R : fltk::Monitor {
public:
void *__D_data;
};
extern "C" {
void _BCD_delete_N4fltk7MonitorE__Monitor_R(Monitor_R *This) {
delete This;
}
void _BCD_RI_N4fltk7MonitorE(Monitor_R *cd, void *dd) {
cd->__D_data = dd;
}
}
