import std.stdio;
import std.string;

struct S
{
    int x, y;
}

class C
{
    int x, y;
}

void main()
{
    auto s1 = format("%s", S());
    auto s2 = format("%s", new C());

    writeln(s1);  // S(0, 0)
    writeln(s2);  // test.C
}
