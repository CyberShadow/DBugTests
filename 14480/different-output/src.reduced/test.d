// compile on windows with "dmd -m64 -O test.d" => BAD

import std.stdio;
struct Vector(T, alias N)
{
        T x() { return v[0]; }
    T[N] v;
}
ValueType dot()()
{
}

void bezier(T)(T p1, T p2, T p3, T p4, int indent)
{
    writefln("%s%s %s %s %s", " ", p1, p2, p3, p4);
    auto p23   = p3;
    auto p34   = p4;
    auto p123  = p23;
    auto p234  = p23 ;
    auto p1234 = p123 ;

    auto d3 = p3.x ;

    if(d3< 25 )
        return;
    bezier(p1234, p234, p34, p4, indent);
}

int main()
{
    alias Vector!(double, 2) VEC;
    auto p1 = VEC();
    auto p2 = VEC();
    auto p3 = VEC();
    auto p4 = VEC();
    bezier(p1,p2,p3,p4,0);
    return 0;
}
