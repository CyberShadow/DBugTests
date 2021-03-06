/* THIS FILE GENERATED BY bcd.gen */
module bcd.fltk2.gl;
align(4):
public import bcd.bind;
const int GL_GLEXT_PROTOTYPES = 1;
public import bcd.fltk2.FL_API;
public import bcd.fltk2.Color;
public import bcd.fltk2.Flags;
alias void function(uint, uint, uint, int, uint *) _BCD_func__3162;
alias void function(uint, uint, uint, int, int *) _BCD_func__3163;
alias void function(uint, uint, uint, int, float *) _BCD_func__3164;
alias void function(uint, uint, uint *) _BCD_func__3168;
alias void function(uint, uint, int *) _BCD_func__3169;
alias void function(uint, uint, int, uint *) _BCD_func__3170;
alias void function(uint, uint, uint *) _BCD_func__3171;
alias void function(uint, uint, uint, uint, uint, uint) _BCD_func__3172;
alias void function(uint, uint, int, int *) _BCD_func__3173;
alias void function(uint, uint, int *) _BCD_func__3174;
alias void function(uint, uint, int, int, int, int) _BCD_func__3175;
alias void function(uint, int) _BCD_func__3178;
alias void function(uint, uint, uint, int, uint) _BCD_func__3179;
alias void function(uint, uint, uint, int, int) _BCD_func__3180;
alias void function(uint, uint, uint, int) _BCD_func__3181;
alias void function(uint, uint, int) _BCD_func__3182;
alias void function(uint, int, uint, int, void *) _BCD_func__3183;
alias void function(uint, ushort *) _BCD_func__3184;
alias void function(uint, char *) _BCD_func__3185;
alias void function(uint, short *) _BCD_func__3186;
alias void function(uint, char *) _BCD_func__3187;
alias void function(uint, uint *) _BCD_func__3188;
alias void function(uint, int *) _BCD_func__3189;
alias void function(uint, uint, uint, uint, uint) _BCD_func__3190;
alias void function(uint, uint, uint, uint) _BCD_func__3191;
alias void function(uint, uint, uint) _BCD_func__3192;
alias void function(uint, uint) _BCD_func__3193;
alias void function(uint, int, int, int, int) _BCD_func__3194;
alias void function(uint, int, int, int) _BCD_func__3195;
alias void function(uint, int, int) _BCD_func__3196;
alias void function(int, int, uint *) _BCD_func__3197;
alias void function(int, uint, uint, uint, uint) _BCD_func__3198;
alias void function(int, uint, uint, uint) _BCD_func__3199;
alias void function(int, uint, uint) _BCD_func__3200;
alias void function(int, uint) _BCD_func__3201;
alias int function(uint, char *) _BCD_func__3202;
alias void function(uint, uint, char *) _BCD_func__3203;
alias void function(uint, int, uint *) _BCD_func__3204;
alias int function(uint, int) _BCD_func__3211;
alias void function(uint, int, uint) _BCD_func__3212;
alias void function(int, int, int, int) _BCD_func__3213;
alias char function(uint, uint) _BCD_func__3214;
alias void function(uint, uint, char *) _BCD_func__3215;
alias void function(uint, char, char, char, char) _BCD_func__3216;
alias void function(double, double) _BCD_func__3218;
alias void function(double) _BCD_func__3219;
alias void function(uint, uint, int, int *, int *, uint *, char *) _BCD_func__3220;
alias void function(uint, char *) _BCD_func__3221;
alias void function(uint, int, int *, uint) _BCD_func__3222;
alias void function(uint, int *, uint) _BCD_func__3223;
alias void function() _BCD_func__3224;
alias void function(uint) _BCD_func__3225;
alias void function(uint, uint, ulong *) _BCD_func__3229;
alias void function(uint, uint, long *) _BCD_func__3230;
alias void function(uint, int *, uint, void * *, int) _BCD_func__3233;
alias void function(uint, int, uint, void *, int) _BCD_func__3234;
alias void function(uint, int *, int *, int) _BCD_func__3235;
alias void function(uint, uint, uint, int *, int *, int) _BCD_func__3238;
alias void function(uint, void *) _BCD_func__3239;
alias void function(int, void *) _BCD_func__3240;
alias void function(uint, uint, uint, int *) _BCD_func__3241;
alias void function(uint, uint, uint, uint, int, int) _BCD_func__3242;
alias void function(uint, uint, uint, uint, int) _BCD_func__3243;
alias uint function(uint) _BCD_func__3244;
alias void function(int, uint *) _BCD_func__3245;
alias void function(int, uint *) _BCD_func__3246;
alias char function(uint) _BCD_func__3247;
alias void function(uint, uint, int, int) _BCD_func__3248;
alias void function(uint, uint, float *) _BCD_func__3249;
alias void function(uint, int, uint, char, int, uint, uint) _BCD_func__3250;
alias void function(uint, uint, int, uint) _BCD_func__3252;
alias void * function(uint) _BCD_func__3253;
alias void function(uint, int, void *) _BCD_func__3255;
alias void function(uint, int, ushort *) _BCD_func__3256;
alias void function(uint, ushort *) _BCD_func__3257;
alias void function(uint, ushort, ushort, ushort, ushort) _BCD_func__3258;
alias void function(uint, ushort, ushort, ushort) _BCD_func__3259;
alias void function(uint, ushort, ushort) _BCD_func__3260;
alias void function(uint, ushort) _BCD_func__3261;
alias void function(ushort *) _BCD_func__3262;
alias void function(ushort) _BCD_func__3263;
alias void function(ushort, ushort, ushort) _BCD_func__3264;
alias void function(ushort, ushort, ushort, ushort) _BCD_func__3265;
alias void function(ushort, ushort) _BCD_func__3266;
alias void function(uint, int, char *, double *) _BCD_func__3268;
alias void function(uint, int, char *, float *) _BCD_func__3269;
alias void function(uint, int, char *, double *) _BCD_func__3270;
alias void function(uint, int, char *, float *) _BCD_func__3271;
alias void function(uint, int, char *, double, double, double, double) _BCD_func__3272;
alias void function(uint, int, char *, float, float, float, float) _BCD_func__3273;
alias void function(int, uint *) _BCD_func__3276;
alias void function(int, void *) _BCD_func__3278;
alias void function(uint, float) _BCD_func__3279;
alias void function(uint, double *) _BCD_func__3280;
alias void function(uint, double, double, double) _BCD_func__3281;
alias void function(uint, float *) _BCD_func__3282;
alias void function(uint, float, float, float) _BCD_func__3283;
alias void function(uint, short, short, short) _BCD_func__3284;
alias void function(uint, char, char, char) _BCD_func__3285;
alias void function(uint, double, double, double, double) _BCD_func__3286;
alias void function(uint, float, float, float, float) _BCD_func__3287;
alias void function(uint, short, short, short, short) _BCD_func__3288;
alias void function(uint, double, double) _BCD_func__3289;
alias void function(uint, float, float) _BCD_func__3290;
alias void function(uint, short, short) _BCD_func__3291;
alias void function(uint, double) _BCD_func__3292;
alias void function(uint, short) _BCD_func__3293;
alias void function(uint, uint, void * *) _BCD_func__3294;
alias uint function(uint) _BCD_func__3295;
alias uint function(uint, uint) _BCD_func__3296;
alias uint function(uint, uint, uint) _BCD_func__3297;
alias void function(uint, uint, uint, void *) _BCD_func__3298;
alias void function(uint, uint, void *) _BCD_func__3299;
alias uint function(uint, uint, uint, uint) _BCD_func__3300;
alias void function(uint, uint, int, uint, uint) _BCD_func__3302;
alias void function(uint, int, uint, int, uint, uint) _BCD_func__3303;
alias void function(uint, uint, int, void *, uint) _BCD_func__3304;
alias uint function(int, void *, uint) _BCD_func__3305;
alias void function(uint, uint, uint, uint, uint, uint, uint, uint, uint, uint, uint, uint) _BCD_func__3306;
alias void function(uint, uint, uint, uint, uint, uint, uint, uint, uint) _BCD_func__3307;
alias void function(uint, uint, uint, uint, uint, uint, uint, uint, uint, uint, uint, uint, uint) _BCD_func__3308;
alias void function(uint, uint, uint, uint, uint, uint, uint, uint, uint, uint) _BCD_func__3309;
alias void function(uint, uint, uint, uint, uint, uint, uint) _BCD_func__3310;
alias void function(uint, float *) _BCD_func__3311;
alias void function(uint, int *) _BCD_func__3312;
alias void function(uint, int, char *) _BCD_func__3313;
alias void function(uint, int, short *) _BCD_func__3314;
alias void function(uint, int, float *) _BCD_func__3315;
alias void function(uint, int, double *) _BCD_func__3316;
alias void function(uint, uint, uint, float *) _BCD_func__3317;
alias void function(uint, uint, uint, double *) _BCD_func__3318;
alias void function(uint, uint, float *) _BCD_func__3319;
alias void function(uint, uint, float, float, float, float) _BCD_func__3320;
alias void function(uint, uint, double *) _BCD_func__3321;
alias void function(uint, uint, double, double, double, double) _BCD_func__3322;
alias void function(uint, uint, int, char *) _BCD_func__3323;
alias void function(uint, uint, double *) _BCD_func__3324;
alias void function(uint, uint, char *) _BCD_func__3325;
alias void function(uint, uint, uint, float *) _BCD_func__3326;
alias void function(uint, uint, uint, double *) _BCD_func__3327;
alias char function(int, uint *, char *) _BCD_func__3328;
alias void function(uint, uint, uint, int, int, char, void *) _BCD_func__3330;
alias void function(uint, uint, uint, int, int, int, int, char, void *) _BCD_func__3331;
alias void function(char, char, char, char) _BCD_func__3332;
alias void function(float, char) _BCD_func__3333;
alias void function(int, uint, int, void * *, int) _BCD_func__3334;
alias void function(uint, int, void * *, int) _BCD_func__3335;
alias void function(int, char * *, int) _BCD_func__3336;
alias void function(uint *, int *, uint, void * *, int, int) _BCD_func__3338;
alias void function(uint *, int *, int *, int, int) _BCD_func__3339;
alias void function(short *) _BCD_func__3341;
alias void function(short, short, short, short) _BCD_func__3342;
alias void function(int *) _BCD_func__3343;
alias void function(float *) _BCD_func__3344;
alias void function(float, float, float, float) _BCD_func__3345;
alias void function(double *) _BCD_func__3346;
alias void function(double, double, double, double) _BCD_func__3347;
alias void function(short, short, short) _BCD_func__3348;
alias void function(int, int, int) _BCD_func__3349;
alias void function(float, float, float) _BCD_func__3350;
alias void function(double, double, double) _BCD_func__3351;
alias void function(short, short) _BCD_func__3352;
alias void function(int, int) _BCD_func__3353;
alias void function(float, float) _BCD_func__3354;
alias void function(uint, uint, uint, uint, int *) _BCD_func__3355;
alias void function(uint, uint, uint, uint, float *) _BCD_func__3356;
alias void function(uint, uint, uint, uint, uint, uint, uint, char, char, char) _BCD_func__3357;
alias void function(int, uint, int, void *) _BCD_func__3358;
alias void function(float) _BCD_func__3359;
alias void function(uint *, float *, float *, float *, float *) _BCD_func__3360;
alias void function(uint, float, float, float, float, float, float, float, float, float, float, float, float) _BCD_func__3361;
alias void function(uint *, float *, float *, float *) _BCD_func__3362;
alias void function(uint, float, float, float, float, float, float, float, float) _BCD_func__3363;
alias void function(uint *, float *, float *) _BCD_func__3364;
alias void function(uint, float, float, float, float, float) _BCD_func__3365;
alias void function(uint, float, float, float, float, float, float, float, float, float, float) _BCD_func__3366;
alias void function(uint, float, float, float, float, float, float) _BCD_func__3367;
alias void function(uint *, char *, float *) _BCD_func__3368;
alias void function(uint, char, char, char, char, float, float, float) _BCD_func__3369;
alias void function(uint *, float *) _BCD_func__3370;
alias void function(float *, float *, float *, float *) _BCD_func__3371;
alias void function(float, float, float, float, float, float, float, float, float, float, float, float, float, float, float) _BCD_func__3372;
alias void function(float, float, float, float, float, float, float, float, float, float, float, float) _BCD_func__3373;
alias void function(float *, float *, float *) _BCD_func__3374;
alias void function(float, float, float, float, float, float, float, float) _BCD_func__3375;
alias void function(float *, char *, float *) _BCD_func__3376;
alias void function(float, float, char, char, char, char, float, float, float) _BCD_func__3377;
alias void function(float *, float *) _BCD_func__3378;
alias void function(float, float, float, float, float) _BCD_func__3379;
alias void function(float, float, float, float, float, float, float, float, float, float) _BCD_func__3380;
alias void function(float, float, float, float, float, float) _BCD_func__3381;
alias void function(char *, float *) _BCD_func__3382;
alias void function(char, char, char, char, float, float, float) _BCD_func__3383;
alias void function(char, char, char, char, float, float) _BCD_func__3384;
alias void function(uint, int, void * *) _BCD_func__3385;
alias void function(char *) _BCD_func__3386;
alias void function(ushort *) _BCD_func__3387;
alias void function(uint *) _BCD_func__3388;
alias void function(char) _BCD_func__3389;
alias void function(int) _BCD_func__3390;
alias void function(short) _BCD_func__3391;
alias void function(char) _BCD_func__3392;
alias void function(uint, int, void *) _BCD_func__3393;
alias void function(char *) _BCD_func__3394;
alias void function(char, char, char) _BCD_func__3395;
alias void function(uint, int *, int *, int) _BCD_func__3396;
alias void function(char, char, char) _BCD_func__3397;
alias void function(uint, uint, float) _BCD_func__3398;
alias void function(int, uint, void * *) _BCD_func__3399;
alias void function(uint, void * *) _BCD_func__3400;
alias uint function(int) _BCD_func__3401;
alias int function(uint *) _BCD_func__3402;
alias void function(uint, uint, uint, int, uint, void *) _BCD_func__3403;
alias void function(uint, double *) _BCD_func__3404;
alias void function(uint, uint, uint, void *) _BCD_func__3405;
alias void function(uint, uint, int, uint, uint, void *) _BCD_func__3406;
alias void function(uint, int, int, uint, uint, void *) _BCD_func__3407;
alias void function(float *) _BCD_func__3408;
alias void function(int, float *) _BCD_func__3409;
alias void function(uint, float, float, int, int, float, float, int, int, float, float, int, int, float *) _BCD_func__3410;
alias void function(uint, double, double, int, int, double, double, int, int, double, double, int, int, double *) _BCD_func__3411;
alias int function(int *) _BCD_func__3412;
alias void function(int, int *) _BCD_func__3413;
alias int function() _BCD_func__3414;
alias void function(int, uint, int, int, void *) _BCD_func__3415;
alias void function(uint, int, int, void *) _BCD_func__3416;
alias void function(uint, void * *) _BCD_func__3417;
alias void function(int, int, char *) _BCD_func__3418;
alias void function(int, uint *, float *) _BCD_func__3420;
alias void function(uint, int, int, int, int, int, int, int, int, int, uint, uint, void *) _BCD_func__3422;
alias void function(uint, int, uint, int, int, int, int, int, uint, uint, void *) _BCD_func__3423;
alias void function(uint, uint, int, int, int) _BCD_func__3424;
alias void function(uint, uint, int, int, uint, uint, void *, void *) _BCD_func__3425;
alias void function(uint, uint, uint, void *, void *, void *) _BCD_func__3426;
alias void function(uint, uint, int, int, uint, uint, void *) _BCD_func__3427;
alias void function(uint, uint, char) _BCD_func__3428;
alias void function(uint, int, uint, char) _BCD_func__3429;
alias void function(uint, char, uint, uint, void *) _BCD_func__3430;
alias void function(uint, int, int, int, int, int, int, int, int) _BCD_func__3431;
alias void function(uint, int, int, int, int, int, int, int) _BCD_func__3432;
alias void function(uint, int, int, int, int, int) _BCD_func__3433;
alias void function(uint, int, uint, int, int, int, int, int) _BCD_func__3434;
alias void function(uint, int, uint, int, int, int, int) _BCD_func__3435;
alias void function(uint, int, int, int, int, int, uint, uint, void *) _BCD_func__3436;
alias void function(uint, int, int, int, uint, uint, void *) _BCD_func__3437;
alias void function(uint, uint, int, float *) _BCD_func__3438;
alias void function(uint, int, int, int, int, int, int, int, uint, uint, void *) _BCD_func__3439;
alias void function(uint, int, uint, int, int, int, int, uint, uint, void *) _BCD_func__3440;
alias int function(uint, char *) _BCD_func__3441;
alias void function(uint, uint, int, int *, int *, uint *, char *) _BCD_func__3442;
alias void function(uint, uint, char *) _BCD_func__3443;
alias void function(uint, int, int *, char *) _BCD_func__3446;
alias void function(uint, int, int *) _BCD_func__3447;
alias void function(uint, int, float *) _BCD_func__3448;
alias void function(uint, int, int *, uint *) _BCD_func__3449;
alias void function(int, int, char, float *) _BCD_func__3450;
alias void function(int, int, int *) _BCD_func__3451;
alias void function(int, int, float *) _BCD_func__3452;
alias void function(int, int, int, int, int) _BCD_func__3453;
alias void function(int, float, float, float, float) _BCD_func__3454;
alias void function(int, float, float, float) _BCD_func__3455;
alias void function(int, float, float) _BCD_func__3456;
alias void function(int, float) _BCD_func__3457;
alias uint function() _BCD_func__3458;
alias void function(uint, int, char * *, int *) _BCD_func__3459;
alias uint function(uint) _BCD_func__3460;
alias void * function(uint, uint) _BCD_func__3463;
alias void function(uint, int, int, void *) _BCD_func__3464;
alias void function(uint, int, void *, uint) _BCD_func__3465;
alias void function(uint, uint, void *) _BCD_func__3466;
alias void function(uint, uint, int, void *) _BCD_func__3467;
alias void function(uint, int, uint, char, int, void *) _BCD_func__3468;
alias void function(int, ushort *) _BCD_func__3469;
alias void function(int, char *) _BCD_func__3470;
alias void function(int, double *) _BCD_func__3471;
alias void function(int, int *) _BCD_func__3472;
alias void function(int, short *) _BCD_func__3473;
alias void function(int, char *) _BCD_func__3474;
alias void function(uint, int, int, int, uint, int, void *) _BCD_func__3475;
alias void function(uint, int, int, int, int, int, uint, int, void *) _BCD_func__3476;
alias void function(uint, int, int, int, int, int, int, int, uint, int, void *) _BCD_func__3477;
alias void function(uint, int, uint, int, int, int, void *) _BCD_func__3478;
alias void function(uint, int, uint, int, int, int, int, void *) _BCD_func__3479;
alias void function(uint, int, uint, int, int, int, int, int, void *) _BCD_func__3480;
alias void function(uint, int, char * *, int *) _BCD_func__3481;
alias void function(uint, int, int *, char *) _BCD_func__3482;
alias void function(uint, int, int *, uint *) _BCD_func__3483;
alias void function(uint, uint, int, int *, int *, uint *, char *) _BCD_func__3484;
alias uint function() _BCD_func__3485;
alias void function(uint, int, int, int, int, int, int, uint, uint, void *) _BCD_func__3487;
extern (C) void _BCD__ZN4fltk11gldrawimageEPKhiiiiii(char *, int, int, int, int, int, int);
extern (C) void _BCD__ZN4fltk10gldrawtextEPKcifff(char *, int, float, float, float);
extern (C) void _BCD__ZN4fltk10gldrawtextEPKcfff(char *, float, float, float);
extern (C) void _BCD__ZN4fltk10gldrawtextEPKci(char *, int);
extern (C) void _BCD__ZN4fltk10gldrawtextEPKc(char *);
extern (C) float _BCD__ZN4fltk10glgetwidthEPKci(char *, int);
extern (C) float _BCD__ZN4fltk10glgetwidthEPKc(char *);
extern (C) float _BCD__ZN4fltk12glgetdescentEv();
extern (C) float _BCD__ZN4fltk11glgetascentEv();
extern (C) void _BCD__ZN4fltk9glsetfontEPNS_4FontEf(void *, float);
extern (C) void _BCD__ZN4fltk10glfillrectEiiii(int, int, int, int);
extern (C) void _BCD__ZN4fltk12glstrokerectEiiii(int, int, int, int);
extern (C) void _BCD__ZN4fltk10glsetcolorEj(uint);
extern (C) void _BCD__ZN4fltk8glfinishEv();
extern (C) void _BCD__ZN4fltk7glstartEv();
void gldrawimage(char * _0, int x, int y, int w, int h, int d = 3, int ld = 0) {
_BCD__ZN4fltk11gldrawimageEPKhiiiiii(_0, x, y, w, h, d, ld);
}
void gldrawtext(char * _0, int n, float x, float y, float z = 0) {
_BCD__ZN4fltk10gldrawtextEPKcifff(_0, n, x, y, z);
}
void gldrawtext(char * _0, float x, float y, float z = 0) {
_BCD__ZN4fltk10gldrawtextEPKcfff(_0, x, y, z);
}
void gldrawtext(char * _0, int n) {
_BCD__ZN4fltk10gldrawtextEPKci(_0, n);
}
void gldrawtext(char * _0) {
_BCD__ZN4fltk10gldrawtextEPKc(_0);
}
float glgetwidth(char * _0, int n) {
return _BCD__ZN4fltk10glgetwidthEPKci(_0, n);
}
float glgetwidth(char * _0) {
return _BCD__ZN4fltk10glgetwidthEPKc(_0);
}
float glgetdescent() {
return _BCD__ZN4fltk12glgetdescentEv();
}
float glgetascent() {
return _BCD__ZN4fltk11glgetascentEv();
}
void glsetfont(bcd.bind.BoundClass * f, float size) {
_BCD__ZN4fltk9glsetfontEPNS_4FontEf(f.__C_data, size);
}
void glfillrect(int x, int y, int w, int h) {
_BCD__ZN4fltk10glfillrectEiiii(x, y, w, h);
}
void glstrokerect(int x, int y, int w, int h) {
_BCD__ZN4fltk12glstrokerectEiiii(x, y, w, h);
}
void glsetcolor(uint _0) {
_BCD__ZN4fltk10glsetcolorEj(_0);
}
void glfinish() {
_BCD__ZN4fltk8glfinishEv();
}
void glstart() {
_BCD__ZN4fltk7glstartEv();
}
