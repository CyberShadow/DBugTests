unittest // getter is fine
{
    struct S
    {
        auto opDispatch(string name)()
        {
            return 42;
        }
    }

    S s;
    s.foo;
}

unittest // setter is fine
{
    struct S
    {
        void opDispatch(string name)(ushort value)
        {
        }
    }

    S s;

    s.foo = 42; // fine

    long x = 42;
    //s.foo = x; // correct error: "not callable using argument types (long)"
}

unittest // getter and setter... bug: misleading error
{
    struct S
    {
        auto opDispatch(string name)()
        {
            return 42;
        }

        void opDispatch(string name)(ushort value)
        {
        }
    }

    S s;

    s.foo = 42; // fine

    long x = 42;
    s.foo = x; // *wrong* error: "no property 'foo' for type 'S'"
}
