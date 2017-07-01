static int g()
{
    int[int] aa;
    aa[1] = 13;
    assert(*(1 in aa) == 13); /* passes */
    *(1 in aa) = 42; /* no effect in CTFE */
    return aa[1];
}
void main()
{
    assert(g() == 42);
    enum e = g();
    assert(e == 42); /* fails */
    assert(e != 13); /* fails */
}
