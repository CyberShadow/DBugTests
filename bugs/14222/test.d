struct S
{
    this(int[3] a){}
}

unittest
{
    auto s0 = S([1,2,3]); //OK
    import std.conv : emplace;
    auto s1 = emplace!S(&s0, [1,2,3]); //Error
}
