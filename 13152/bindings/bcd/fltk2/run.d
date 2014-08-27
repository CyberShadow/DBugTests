/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.run;
align(4):
public import bcd.bind;
public import bcd.fltk2.FL_API;
extern (C) bool _BCD__ZN4fltk14in_main_threadEv();
extern (C) void * _BCD__ZN4fltk14thread_messageEv();
extern (C) void _BCD__ZN4fltk5awakeEPv(void *);
extern (C) void _BCD__ZN4fltk6unlockEv();
extern (C) void _BCD__ZN4fltk4lockEv();
extern (C) void _BCD__ZN4fltk9remove_fdEii(int, int);
alias void function(int, void *) _BCD_func__188;
alias _BCD_func__188 FileHandler;
extern (C) void _BCD__ZN4fltk6add_fdEiPFviPvES0_(int, _BCD_func__188, void *);
extern (C) void _BCD__ZN4fltk6add_fdEiiPFviPvES0_(int, int, _BCD_func__188, void *);
alias void function() _BCD_func__195;
extern (C) void _BCD__ZN4fltk8set_idleEPFvvE(_BCD_func__195);
extern (C) void _BCD_set__ZN4fltk4idleE(_BCD_func__195);
extern (C) _BCD_func__195 _BCD_get__ZN4fltk4idleE();
alias void function(void *) _BCD_func__190;
alias _BCD_func__190 TimeoutHandler;
extern (C) void _BCD__ZN4fltk11remove_idleEPFvPvES0_(_BCD_func__190, void *);
extern (C) bool _BCD__ZN4fltk8has_idleEPFvPvES0_(_BCD_func__190, void *);
extern (C) void _BCD__ZN4fltk8add_idleEPFvPvES0_(_BCD_func__190, void *);
extern (C) void _BCD__ZN4fltk12remove_checkEPFvPvES0_(_BCD_func__190, void *);
extern (C) bool _BCD__ZN4fltk9has_checkEPFvPvES0_(_BCD_func__190, void *);
extern (C) void _BCD__ZN4fltk9add_checkEPFvPvES0_(_BCD_func__190, void *);
extern (C) void _BCD__ZN4fltk14remove_timeoutEPFvPvES0_(_BCD_func__190, void *);
extern (C) bool _BCD__ZN4fltk11has_timeoutEPFvPvES0_(_BCD_func__190, void *);
extern (C) void _BCD__ZN4fltk14repeat_timeoutEfPFvPvES0_(float, _BCD_func__190, void *);
extern (C) void _BCD__ZN4fltk11add_timeoutEfPFvPvES0_(float, _BCD_func__190, void *);
extern (C) double _BCD__ZN4fltk13get_time_secsEv();
extern (C) int _BCD__ZN4fltk6damageEv();
extern (C) void _BCD__ZN4fltk6damageEi(int);
extern (C) void _BCD_set__ZN4fltk7damage_E(int);
extern (C) int _BCD_get__ZN4fltk7damage_E();
extern (C) void _BCD__ZN4fltk6redrawEv();
extern (C) void _BCD__ZN4fltk5flushEv();
extern (C) int _BCD__ZN4fltk3runEv();
extern (C) int _BCD__ZN4fltk5readyEv();
extern (C) int _BCD__ZN4fltk5checkEv();
extern (C) int _BCD__ZN4fltk4waitEf(float);
extern (C) int _BCD__ZN4fltk4waitEv();
extern (C) bool _BCD__ZN4fltk20enable_tablet_eventsEv();
extern (C) void _BCD__ZN4fltk4argsEiPPc(int, char * *);
extern (C) char * _BCD_get__ZN4fltk4helpE();
alias int function(int, char * *, int *) _BCD_func__197;
extern (C) int _BCD__ZN4fltk4argsEiPPcRiPFiiS1_S2_E(int, char * *, int *, _BCD_func__197);
extern (C) int _BCD__ZN4fltk3argEiPPcRi(int, char * *, int *);
extern (C) void _BCD__ZN4fltk7displayEPKc(char *);
const int READ = 1;
const int WRITE = 4;
const int EXCEPT = 8;
bool in_main_thread() {
return _BCD__ZN4fltk14in_main_threadEv();
}
void * thread_message() {
return _BCD__ZN4fltk14thread_messageEv();
}
void awake(void * message = null) {
_BCD__ZN4fltk5awakeEPv(message);
}
void unlock() {
_BCD__ZN4fltk6unlockEv();
}
void lock() {
_BCD__ZN4fltk4lockEv();
}
void remove_fd(int _0, int when = -1) {
_BCD__ZN4fltk9remove_fdEii(_0, when);
}
void add_fd(int fd, _BCD_func__188 _1, void * _2 = null) {
_BCD__ZN4fltk6add_fdEiPFviPvES0_(fd, _1, _2);
}
void add_fd(int fd, int when, _BCD_func__188 _2, void * _3 = null) {
_BCD__ZN4fltk6add_fdEiiPFviPvES0_(fd, when, _2, _3);
}
void set_idle(_BCD_func__195 cb) {
_BCD__ZN4fltk8set_idleEPFvvE(cb);
}
_BCD_func__195 get_idle() {
return _BCD_get__ZN4fltk4idleE();
}
void remove_idle(_BCD_func__190 _0, void * _1 = null) {
_BCD__ZN4fltk11remove_idleEPFvPvES0_(_0, _1);
}
bool has_idle(_BCD_func__190 _0, void * _1 = null) {
return _BCD__ZN4fltk8has_idleEPFvPvES0_(_0, _1);
}
void add_idle(_BCD_func__190 _0, void * _1 = null) {
_BCD__ZN4fltk8add_idleEPFvPvES0_(_0, _1);
}
void remove_check(_BCD_func__190 _0, void * _1 = null) {
_BCD__ZN4fltk12remove_checkEPFvPvES0_(_0, _1);
}
bool has_check(_BCD_func__190 _0, void * _1 = null) {
return _BCD__ZN4fltk9has_checkEPFvPvES0_(_0, _1);
}
void add_check(_BCD_func__190 _0, void * _1 = null) {
_BCD__ZN4fltk9add_checkEPFvPvES0_(_0, _1);
}
void remove_timeout(_BCD_func__190 _0, void * _1 = null) {
_BCD__ZN4fltk14remove_timeoutEPFvPvES0_(_0, _1);
}
bool has_timeout(_BCD_func__190 _0, void * _1 = null) {
return _BCD__ZN4fltk11has_timeoutEPFvPvES0_(_0, _1);
}
void repeat_timeout(float t, _BCD_func__190 _1, void * _2 = null) {
_BCD__ZN4fltk14repeat_timeoutEfPFvPvES0_(t, _1, _2);
}
void add_timeout(float t, _BCD_func__190 _1, void * v = null) {
_BCD__ZN4fltk11add_timeoutEfPFvPvES0_(t, _1, v);
}
double get_time_secs() {
return _BCD__ZN4fltk13get_time_secsEv();
}
int damage() {
return _BCD__ZN4fltk6damageEv();
}
void damage(int d) {
_BCD__ZN4fltk6damageEi(d);
}
void set_damage_(int x) {
_BCD_set__ZN4fltk7damage_E(x);
}
int get_damage_() {
return _BCD_get__ZN4fltk7damage_E();
}
void redraw() {
_BCD__ZN4fltk6redrawEv();
}
void flush() {
_BCD__ZN4fltk5flushEv();
}
int run() {
return _BCD__ZN4fltk3runEv();
}
int ready() {
return _BCD__ZN4fltk5readyEv();
}
int check() {
return _BCD__ZN4fltk5checkEv();
}
int wait(float time) {
return _BCD__ZN4fltk4waitEf(time);
}
int wait() {
return _BCD__ZN4fltk4waitEv();
}
bool enable_tablet_events() {
return _BCD__ZN4fltk20enable_tablet_eventsEv();
}
void args(int _0, char * * _1) {
_BCD__ZN4fltk4argsEiPPc(_0, _1);
}
char * get_help() {
return _BCD_get__ZN4fltk4helpE();
}
int args(int _0, char * * _1, int * _2, _BCD_func__197 _3 = null) {
return _BCD__ZN4fltk4argsEiPPcRiPFiiS1_S2_E(_0, _1, _2, _3);
}
int arg(int _0, char * * _1, int * _2) {
return _BCD__ZN4fltk3argEiPPcRi(_0, _1, _2);
}
void display(char * _0) {
_BCD__ZN4fltk7displayEPKc(_0);
}
