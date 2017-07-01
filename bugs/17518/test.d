struct S
{
    this(inout Correct) inout
    {
    }
}

struct Correct {}
struct Wrong {}

S bug()
{
    return S(Wrong());
}
