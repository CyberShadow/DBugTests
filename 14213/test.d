import std.typecons, std.stdio;

struct A
{
    int foo(){return 1;}

    mixin Proxy!foo; // std\typecons.d(4408): Deprecation: casting from int delegate() to const(void*) is deprecated
}

struct B
{
    int foo(){return 1;}

    alias foo this; // OK
}


void main()
{
    A a;
    B b;
    writeln(a + 1);
    writeln(b + 2);
}

