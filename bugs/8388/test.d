import std.stdio;
import std.traits;

class C
{
    this() {}
    this(int i) {}
    this(int i, float j) {}
    this(string s) {}

    ~this() {}
}

void main()
{
    writeln(__traits(hasMember, C, "__ctor"));
    writeln(__traits(hasMember, C, "__dtor"));

    foreach(f; MemberFunctionsTuple!(C, "__ctor"))
        writeln(f.stringof);

    foreach(f; MemberFunctionsTuple!(C, "__dtor"))
        writeln(f.stringof);
}
