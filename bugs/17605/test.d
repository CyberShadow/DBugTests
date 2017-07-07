extern (C) void main()
{
    int a;
    enum bool works = __traits(compiles, { a = 1; });
    a = 1;
}
