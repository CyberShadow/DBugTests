class Base
{
    int param;
}

class Foo(int param) : Base
{
    int val()
    {
        return param; // <-- param refers to super.param
    }
}

unittest
{
    auto foo = new Foo!12;
    assert(foo.val() == 12);
}
