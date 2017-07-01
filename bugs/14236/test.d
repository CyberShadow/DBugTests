struct S
{
    auto opIndex(size_t i)
    {
        return 1;
    }
    auto opIndexUnary(string s)(size_t i, size_t j)
    {
        return -1;
    }
}

unittest
{
    S s;
    assert(-s[0] == -1);
}
