enum E {a = 1}

struct OnlyResult
{
    this(E) {}
    E[1] data;
}

void main()
{
    auto o = OnlyResult(E.a); /* line 11 */
}
