import std.typecons;

struct S1
{
    @property bool empty();
    @property Tuple!(int, int) front();
    void popFront();
}

struct S2
{
    @property bool empty();
    @property ref Tuple!(int, int) front();
    void popFront();
}

void main()
{
    static assert( __traits(compiles, { foreach(    a,     b; S1()) { } }));
    static assert(!__traits(compiles, { foreach(ref a, ref b; S1()) { } }));
    static assert( __traits(compiles, { foreach(ref a, ref b; S2()) { } }));
}
