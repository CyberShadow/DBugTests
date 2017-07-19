struct Foo
{
    immutable(int)[] list;
}

unittest
{
    enum foo = Foo([1, 2, 3]);
    foo.list ~= 4;
}
