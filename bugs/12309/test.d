module main;

import std.traits;
class Test(T,int x,string s) {}
pragma(msg,fullyQualifiedName!(Test!(int,10,"str")));
