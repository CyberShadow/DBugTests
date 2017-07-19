import std.stdio;
import std.traits;

class C
{
    final void foo() {}
    void goo() { foo(); }
}

void main()
{
    foreach(i, f; MemberFunctionsTuple!(C, "foo"))
        writeln(__traits(identifier, MemberFunctionsTuple!(C, "foo")[i]));

    foreach(i, f; MemberFunctionsTuple!(C, "goo"))
        writeln(__traits(identifier, MemberFunctionsTuple!(C, "goo")[i]));
}
