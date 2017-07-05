void foo()
{
    import std.array;
    [A()].array;
}

struct A
{
    void opAssign(T)(T v) {}
    Object o = new Object;
}
