import std.container, std.typecons : tuple;

void main()
{
    auto a = Array!int();
    tuple(a, a);
}
