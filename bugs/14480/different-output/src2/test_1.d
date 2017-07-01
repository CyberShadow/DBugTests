// compile on windows with "dmd -m64 -O test.d" => BAD

import std.math;
//import std.stdio;

struct Vector(T, alias N)
{
    T x() { return v[0]; }
    T[N] v;
}

void bezier(T)(T p1, T p2/*, T p3, T p4*/, int depth)
{
//  writefln("%s%s %s %s %s", " ", p1, p2, p3, p4);
//    assert(p1.v[0].isNaN);
//    assert(p1.v[1].isNaN);
    assert(p2.v[0].isNaN);
//    assert(p2.v[1].isNaN);
//    assert(p3.v[0].isNaN);
//    assert(p3.v[1].isNaN);
//    assert(p4.v[0].isNaN);
//    assert(p4.v[1].isNaN);

    //if(p3.x< 25 ) return;
    if (depth > 3)
    	return;
    bezier(p1, p2/*, p3, p4*/, depth+1);
}

int main()
{
    alias Vector!(double, 2) VEC;
    auto p1 = VEC();
    auto p2 = VEC();
    //auto p3 = VEC();
    //auto p4 = VEC();
    bezier(p1,p2/*,p3,p4*/,0);
    return 0;
}
