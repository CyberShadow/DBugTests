void main()
{
    uint x = 7;

    class A
    {
        auto foo()
        {
            return x;
        }
    }

    auto makeB(uint y)
    {
        class B : A
        {
            auto bar()
            {
                return foo() + y;
            }
        }

        return new B();
    }

    A a = new A();
    assert(a.foo() == 7);

    auto b = makeB(3);
    assert(b.bar() == 10);

    A ba = b;
    assert(ba.foo() == 7);
}
