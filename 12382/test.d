struct S
{
    size_t opDollar() { return 0; }
    size_t opIndex(size_t) { return 0; }
}

enum e = S.init[$]; // line 7
