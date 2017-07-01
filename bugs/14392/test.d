//import std.stdio;

struct Foo
{
    int v;

    auto opBinaryRight(string op)(int lhs) if (op == "*")
    {
        //writeln("int * Foo");
        //return Boo(lhs * v);
        assert(false);
    }
}

struct Boo
{
    int v;
    alias v this;

    auto opBinary(string op)(Foo rhs) if (op == "*")
    {
        //writeln("Boo * Foo");
        return Boo(v * rhs.v);
    }
}

void main(string[] args)
{
    Boo(1) * Foo(2);
}
