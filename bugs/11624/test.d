interface I
{
    void foo();
}

static assert(__traits(compiles,
{
    static class C : I { }
}));
