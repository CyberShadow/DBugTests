import std.stdio;

void main()
{
    auto f = File("test");
    f.byLine.popFront();
}
