mixin template t()
{ static import std.ascii; }

class C
{
    mixin t!();
    void f() { std.x; }
}
