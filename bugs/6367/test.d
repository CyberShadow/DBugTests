import std.typetuple;

void main()
{
    TypeTuple!(int, int) f = 10;
    assert(f[0] == 10);
    assert(f[1] == 10);
}
