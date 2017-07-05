import std.stdio;

alias void delegate() Callable;

class Test
{
    @property Callable a()
    {
        return { writeln("hello"); };
    }
}

void main()
{
    auto t = new Test;
    t.a(); // does NOT say hello
    t.a()(); // this does
}
