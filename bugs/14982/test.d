import std.algorithm, std.range;

auto foo(int[] a, immutable int b) @nogc //Fails
{
    return a.map!(x => x + b);
}

auto bar(R)(R a, immutable int b) @nogc //OK
{
    return a.map!(x => x + b);
}

auto baz(int[] a, immutable int b) @nogc //OK
{
    return bar(a, b);
}
