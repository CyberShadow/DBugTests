import std.traits;

enum Attr;
struct A
{
    @Attr int a;
    @Attr private int c;
}

static assert(getSymbolsByUDA!(A, Attr).length == 2);
