/* THIS FILE GENERATED BY bcd.gen */
#include <stdlib.h>
#include <string.h>
#include "../bind.h"
#include "fltk/run.h"
extern "C" {
typedef unsigned char _BCD__4_uchar;
bool _BCD__ZN4fltk14in_main_threadEv() {
return (fltk::in_main_thread());
}
void * _BCD__ZN4fltk14thread_messageEv() {
return (fltk::thread_message());
}
void _BCD__ZN4fltk5awakeEPv(void * message) {
(fltk::awake(message));
}
void _BCD__ZN4fltk6unlockEv() {
(fltk::unlock());
}
void _BCD__ZN4fltk4lockEv() {
(fltk::lock());
}
void _BCD__ZN4fltk9remove_fdEii(int _0, int when) {
(fltk::remove_fd(_0, when));
}
typedef void (*_BCD_func__188)(int, void *);
typedef _BCD_func__188 _BCD__152_FileHandler;
void _BCD__ZN4fltk6add_fdEiPFviPvES0_(int fd, _BCD__152_FileHandler _1, void * _2) {
(fltk::add_fd(fd, _1, _2));
}
void _BCD__ZN4fltk6add_fdEiiPFviPvES0_(int fd, int when, _BCD__152_FileHandler _2, void * _3) {
(fltk::add_fd(fd, when, _2, _3));
}
typedef void (*_BCD_func__195)();
void _BCD__ZN4fltk8set_idleEPFvvE(_BCD_func__195 cb) {
(fltk::set_idle(cb));
}
void _BCD_set__ZN4fltk4idleE(_BCD_func__195 x) {
fltk::idle = x;
}
_BCD_func__195 _BCD_get__ZN4fltk4idleE() {
return fltk::idle;
}
typedef void (*_BCD_func__190)(void *);
typedef _BCD_func__190 _BCD__167_TimeoutHandler;
void _BCD__ZN4fltk11remove_idleEPFvPvES0_(_BCD__167_TimeoutHandler _0, void * _1) {
(fltk::remove_idle(_0, _1));
}
bool _BCD__ZN4fltk8has_idleEPFvPvES0_(_BCD__167_TimeoutHandler _0, void * _1) {
return (fltk::has_idle(_0, _1));
}
void _BCD__ZN4fltk8add_idleEPFvPvES0_(_BCD__167_TimeoutHandler _0, void * _1) {
(fltk::add_idle(_0, _1));
}
void _BCD__ZN4fltk12remove_checkEPFvPvES0_(_BCD__167_TimeoutHandler _0, void * _1) {
(fltk::remove_check(_0, _1));
}
bool _BCD__ZN4fltk9has_checkEPFvPvES0_(_BCD__167_TimeoutHandler _0, void * _1) {
return (fltk::has_check(_0, _1));
}
void _BCD__ZN4fltk9add_checkEPFvPvES0_(_BCD__167_TimeoutHandler _0, void * _1) {
(fltk::add_check(_0, _1));
}
void _BCD__ZN4fltk14remove_timeoutEPFvPvES0_(_BCD__167_TimeoutHandler _0, void * _1) {
(fltk::remove_timeout(_0, _1));
}
bool _BCD__ZN4fltk11has_timeoutEPFvPvES0_(_BCD__167_TimeoutHandler _0, void * _1) {
return (fltk::has_timeout(_0, _1));
}
void _BCD__ZN4fltk14repeat_timeoutEfPFvPvES0_(float t, _BCD__167_TimeoutHandler _1, void * _2) {
(fltk::repeat_timeout(t, _1, _2));
}
void _BCD__ZN4fltk11add_timeoutEfPFvPvES0_(float t, _BCD__167_TimeoutHandler _1, void * v) {
(fltk::add_timeout(t, _1, v));
}
double _BCD__ZN4fltk13get_time_secsEv() {
return (fltk::get_time_secs());
}
int _BCD__ZN4fltk6damageEv() {
return (fltk::damage());
}
void _BCD__ZN4fltk6damageEi(int d) {
(fltk::damage(d));
}
void _BCD_set__ZN4fltk7damage_E(int x) {
fltk::damage_ = x;
}
int _BCD_get__ZN4fltk7damage_E() {
return fltk::damage_;
}
void _BCD__ZN4fltk6redrawEv() {
(fltk::redraw());
}
void _BCD__ZN4fltk5flushEv() {
(fltk::flush());
}
int _BCD__ZN4fltk3runEv() {
return (fltk::run());
}
int _BCD__ZN4fltk5readyEv() {
return (fltk::ready());
}
int _BCD__ZN4fltk5checkEv() {
return (fltk::check());
}
int _BCD__ZN4fltk4waitEf(float time) {
return (fltk::wait(time));
}
int _BCD__ZN4fltk4waitEv() {
return (fltk::wait());
}
bool _BCD__ZN4fltk20enable_tablet_eventsEv() {
return (fltk::enable_tablet_events());
}
void _BCD__ZN4fltk4argsEiPPc(int _0, char * * _1) {
(fltk::args(_0, _1));
}
char const * const _BCD_get__ZN4fltk4helpE() {
return fltk::help;
}
typedef int (*_BCD_func__197)(int, char * *, int &);
int _BCD__ZN4fltk4argsEiPPcRiPFiiS1_S2_E(int _0, char * * _1, int & _2, _BCD_func__197 _3) {
return (fltk::args(_0, _1, _2, _3));
}
int _BCD__ZN4fltk3argEiPPcRi(int _0, char * * _1, int & _2) {
return (fltk::arg(_0, _1, _2));
}
void _BCD__ZN4fltk7displayEPKc(char const * _0) {
(fltk::display(_0));
}
}
