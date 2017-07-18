class Foo
{
    public int a;
}

class Bar
{
    private Foo _base;
    alias _base this;

    this()
    {
        _base = new Foo;
    }
}

unittest
{
    Bar b = new Bar;
    assert(b.a == 0);
    b.a = 10;
    assert(b.a == 10);
    assert(b._base.a == 10);
}
