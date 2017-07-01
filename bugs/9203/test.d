void foo()(auto ref int x)
{
    import std.stdio;
    static int calls = 0;
    writeln(calls++);
}

void main()
{
    int x = 0;
    foo(x);
    foo(x + x);
}
