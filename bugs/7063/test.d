import std.stdio;

extern(C) void _D4test3fooFZv() { writeln(1); }
void foo() { writeln(2); }

void main()
{
    _D4test3fooFZv();
    foo();
}
