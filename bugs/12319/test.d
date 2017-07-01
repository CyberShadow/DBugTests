void test()
{
    struct S { int i; }
    S* s;
    pragma(msg, __traits(identifier, s.tupleof[0]));
}
