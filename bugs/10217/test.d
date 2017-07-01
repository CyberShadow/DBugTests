bool bug10217()
{
    struct S
    {
        int i;
        void bar() {}
    }
    auto yyy = S.init.tupleof[$-1];
    assert(!yyy);
    return 1;
}

static assert(bug10217());
