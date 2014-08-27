enum E
{
    a = 0,
    b = 0,
    c = 1,
}

void main()
{
    import std.stdio, std.conv, std.string;
    assert(format("%s", E.c) == "c"); // main(11): OK
    assert(to!string(E.c) == "c");    // main(12): NG
}
