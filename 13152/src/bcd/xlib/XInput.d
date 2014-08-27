/* THIS FILE GENERATED BY bcd.gen */
module bcd.xlib.XInput;
import bcd.xlib.Xlib;
align(4):
struct XExtensionVersion {}
const int _deviceKeyPress = 0;
const int _deviceKeyRelease = 1;
const int _deviceButtonPress = 0;
const int _deviceButtonRelease = 1;
const int _deviceMotionNotify = 0;
const int _deviceFocusIn = 0;
const int _deviceFocusOut = 1;
const int _proximityIn = 0;
const int _proximityOut = 1;
const int _deviceStateNotify = 0;
const int _deviceMappingNotify = 1;
const int _changeDeviceNotify = 2;
alias _XValuatorInfo XValuatorInfo;
alias _XValuatorInfo * XValuatorInfoPtr;
alias _XAxisInfo * XAxisInfoPtr;
alias _XAxisInfo XAxisInfo;
alias _XButtonInfo XButtonInfo;
alias _XButtonInfo * XButtonInfoPtr;
alias _XKeyInfo XKeyInfo;
alias _XKeyInfo * XKeyInfoPtr;
alias _XDeviceInfo XDeviceInfo;
alias _XDeviceInfo * XDeviceInfoPtr;
alias _XAnyClassinfo * XAnyClassPtr;
alias _XAnyClassinfo XAnyClassInfo;
alias XProximityNotifyEvent XProximityOutEvent;
alias XProximityNotifyEvent XProximityInEvent;
alias XDeviceFocusChangeEvent XDeviceFocusOutEvent;
alias XDeviceFocusChangeEvent XDeviceFocusInEvent;
alias XDeviceButtonEvent XDeviceButtonReleasedEvent;
alias XDeviceButtonEvent XDeviceButtonPressedEvent;
alias XDeviceKeyEvent XDeviceKeyReleasedEvent;
alias XDeviceKeyEvent XDeviceKeyPressedEvent;
extern (C) void XFreeDeviceControl(XDeviceControl *);
extern (C) void XFreeDeviceMotionEvents(XDeviceTimeCoord *);
extern (C) XDeviceTimeCoord * XGetDeviceMotionEvents(void *, XDevice *, uint, uint, int *, int *, int *);
extern (C) int XSendExtensionEvent(void *, XDevice *, uint, int, int, uint *, _XEvent *);
extern (C) uint * XGetDeviceDontPropagateList(void *, uint, int *);
extern (C) int XChangeDeviceDontPropagateList(void *, uint, int, uint *, int);
extern (C) int XGetSelectedExtensionEvents(void *, uint, int *, uint * *, int *, uint * *);
extern (C) int XSelectExtensionEvent(void *, uint, uint *, int);
extern (C) int XChangeDeviceControl(void *, XDevice *, int, XDeviceControl *);
extern (C) XDeviceControl * XGetDeviceControl(void *, XDevice *, int);
extern (C) int XSetDeviceValuators(void *, XDevice *, int *, int, int);
extern (C) int XSetDeviceMode(void *, XDevice *, int);
extern (C) int XCloseDevice(void *, XDevice *);
extern (C) XDevice * XOpenDevice(void *, uint);
extern (C) void XFreeDeviceList(_XDeviceInfo *);
extern (C) _XDeviceInfo * XListInputDevices(void *, int *);
extern (C) XExtensionVersion * XGetExtensionVersion(void *, char *);
extern (C) void XFreeDeviceState(XDeviceState *);
extern (C) XDeviceState * XQueryDeviceState(void *, XDevice *);
extern (C) int XGetDeviceButtonMapping(void *, XDevice *, char *, uint);
extern (C) int XSetDeviceButtonMapping(void *, XDevice *, char *, int);
extern (C) int XSetDeviceModifierMapping(void *, XDevice *, XModifierKeymap *);
extern (C) XModifierKeymap * XGetDeviceModifierMapping(void *, XDevice *);
extern (C) int XChangeDeviceKeyMapping(void *, XDevice *, int, int, uint *, int);
extern (C) uint * XGetDeviceKeyMapping(void *, XDevice *, uint, int, int *);
extern (C) int XDeviceBell(void *, XDevice *, uint, uint, int);
extern (C) int XChangeFeedbackControl(void *, XDevice *, uint, XFeedbackControl *);
extern (C) void XFreeFeedbackList(XFeedbackState *);
extern (C) XFeedbackState * XGetFeedbackControl(void *, XDevice *, int *);
extern (C) int XSetDeviceFocus(void *, XDevice *, uint, int, uint);
extern (C) int XGetDeviceFocus(void *, XDevice *, uint *, int *, uint *);
extern (C) int XAllowDeviceEvents(void *, XDevice *, int, uint);
extern (C) int XUngrabDeviceButton(void *, XDevice *, uint, uint, XDevice *, uint);
extern (C) int XGrabDeviceButton(void *, XDevice *, uint, uint, XDevice *, uint, int, uint, uint *, int, int);
extern (C) int XUngrabDeviceKey(void *, XDevice *, uint, uint, XDevice *, uint);
extern (C) int XGrabDeviceKey(void *, XDevice *, uint, uint, XDevice *, uint, int, uint, uint *, int, int);
extern (C) int XUngrabDevice(void *, XDevice *, uint);
extern (C) int XGrabDevice(void *, XDevice *, uint, int, int, uint *, int, int, uint);
extern (C) int XChangePointerDevice(void *, XDevice *, int, int);
extern (C) int XChangeKeyboardDevice(void *, XDevice *);
alias void function(void *, char *, int, int, char * *) _BCD_func__1367;
alias int function(void *) _BCD_func__1409;
alias int function(void *, XErrorEvent *) _BCD_func__1410;
alias void function(void *, char *, char *) _BCD_func__1484;
alias int function(void *, char *, char *) _BCD_func__1485;
alias void function(void *, char *, char *) _BCD_func__1486;
struct XButtonState {
char c_class;
char length;
short num_buttons;
char [32] buttons;
}
struct XKeyState {
char c_class;
char length;
short num_keys;
char [32] keys;
}
struct XValuatorState {
char c_class;
char length;
char num_valuators;
char mode;
int * valuators;
}
struct XDeviceState {
uint device_id;
int num_classes;
XInputClass * data;
}
struct XDeviceTimeCoord {
uint time;
int * data;
}
struct XEventList {
uint event_type;
uint device;
}
struct XDevice {
uint device_id;
int num_classes;
XInputClassInfo * classes;
}
struct XInputClassInfo {
char input_class;
char event_type_base;
}
struct _XValuatorInfo {
uint c_class;
int length;
char num_axes;
char mode;
uint motion_buffer;
_XAxisInfo * axes;
}
struct _XAxisInfo {
int resolution;
int min_value;
int max_value;
}
struct _XButtonInfo {
uint c_class;
int length;
short num_buttons;
}
struct _XKeyInfo {
uint c_class;
int length;
ushort min_keycode;
ushort max_keycode;
ushort num_keys;
}
struct _XDeviceInfo {
uint id;
uint type;
char * name;
int num_classes;
int use;
_XAnyClassinfo * inputclassinfo;
}
struct _XAnyClassinfo {
uint c_class;
int length;
}
struct XDeviceResolutionState {
uint control;
int length;
int num_valuators;
int * resolutions;
int * min_resolutions;
int * max_resolutions;
}
struct XDeviceResolutionControl {
uint control;
int length;
int first_valuator;
int num_valuators;
int * resolutions;
}
struct XDeviceControl {
uint control;
int length;
}
struct XCalibrationFeedbackControl {
uint c_class;
int length;
uint id;
int button;
int button_threshold;
int min_x;
int max_x;
int min_y;
int max_y;
}
struct XLedFeedbackControl {
uint c_class;
int length;
uint id;
int led_mask;
int led_values;
}
struct XBellFeedbackControl {
uint c_class;
int length;
uint id;
int percent;
int pitch;
int duration;
}
struct XIntegerFeedbackControl {
uint c_class;
int length;
uint id;
int int_to_display;
}
struct XStringFeedbackControl {
uint c_class;
int length;
uint id;
int num_keysyms;
uint * syms_to_display;
}
struct XKbdFeedbackControl {
uint c_class;
int length;
uint id;
int click;
int percent;
int pitch;
int duration;
int led_mask;
int led_value;
int key;
int auto_repeat_mode;
}
struct XPtrFeedbackControl {
uint c_class;
int length;
uint id;
int accelNum;
int accelDenom;
int threshold;
}
struct XFeedbackControl {
uint c_class;
int length;
uint id;
}
struct XCalibrationFeedbackState {
uint c_class;
int length;
uint id;
int button;
int button_threshold;
int min_x;
int max_x;
int min_y;
int max_y;
}
struct XLedFeedbackState {
uint c_class;
int length;
uint id;
int led_values;
int led_mask;
}
struct XBellFeedbackState {
uint c_class;
int length;
uint id;
int percent;
int pitch;
int duration;
}
struct XStringFeedbackState {
uint c_class;
int length;
uint id;
int max_symbols;
int num_syms_supported;
uint * syms_supported;
}
struct XIntegerFeedbackState {
uint c_class;
int length;
uint id;
int resolution;
int minVal;
int maxVal;
}
struct XPtrFeedbackState {
uint c_class;
int length;
uint id;
int accelNum;
int accelDenom;
int threshold;
}
struct XKbdFeedbackState {
uint c_class;
int length;
uint id;
int click;
int percent;
int pitch;
int duration;
int led_mask;
int global_auto_repeat;
char [32] auto_repeats;
}
struct XFeedbackState {
uint c_class;
int length;
uint id;
}
struct XChangeDeviceNotifyEvent {
int type;
uint serial;
int send_event;
void * display;
uint window;
uint deviceid;
uint time;
int request;
}
struct XDeviceMappingEvent {
int type;
uint serial;
int send_event;
void * display;
uint window;
uint deviceid;
uint time;
int request;
int first_keycode;
int count;
}
struct XButtonStatus {
char c_class;
char length;
short num_buttons;
char [32] buttons;
}
struct XKeyStatus {
char c_class;
char length;
short num_keys;
char [32] keys;
}
struct XValuatorStatus {
char c_class;
char length;
char num_valuators;
char mode;
int [6] valuators;
}
struct XDeviceStateNotifyEvent {
int type;
uint serial;
int send_event;
void * display;
uint window;
uint deviceid;
uint time;
int num_classes;
char [64] data;
}
struct XInputClass {
char c_class;
char length;
}
struct XProximityNotifyEvent {
int type;
uint serial;
int send_event;
void * display;
uint window;
uint deviceid;
uint root;
uint subwindow;
uint time;
int x;
int y;
int x_root;
int y_root;
uint state;
int same_screen;
uint device_state;
char axes_count;
char first_axis;
int [6] axis_data;
}
struct XDeviceFocusChangeEvent {
int type;
uint serial;
int send_event;
void * display;
uint window;
uint deviceid;
int mode;
int detail;
uint time;
}
struct XDeviceMotionEvent {
int type;
uint serial;
int send_event;
void * display;
uint window;
uint deviceid;
uint root;
uint subwindow;
uint time;
int x;
int y;
int x_root;
int y_root;
uint state;
char is_hint;
int same_screen;
uint device_state;
char axes_count;
char first_axis;
int [6] axis_data;
}
struct XDeviceButtonEvent {
int type;
uint serial;
int send_event;
void * display;
uint window;
uint deviceid;
uint root;
uint subwindow;
uint time;
int x;
int y;
int x_root;
int y_root;
uint state;
uint button;
int same_screen;
uint device_state;
char axes_count;
char first_axis;
int [6] axis_data;
}
struct XDeviceKeyEvent {
int type;
uint serial;
int send_event;
void * display;
uint window;
uint deviceid;
uint root;
uint subwindow;
uint time;
int x;
int y;
int x_root;
int y_root;
uint state;
uint keycode;
int same_screen;
uint device_state;
char axes_count;
char first_axis;
int [6] axis_data;
}
