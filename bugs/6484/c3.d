
int f(int a){ return a; } 
int g(int a){ return a; }
int h(int a,int b,int c){ return a * b * c; }

import std.functional;
alias compose!(f,g,h) F;
static assert(F(1,2,3) == f(g(h(1,2,3))));

