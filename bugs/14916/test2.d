unittest // getter and setter... bug: misleading error
{
    static struct S
    {
        template opDispatch(string name)
        {
            @property auto opDispatch()
            {
                return 42;
            }

            @property void opDispatch(ushort value)
            {
            }
        }
    }

    S s;

    int x = s.foo;

    s.foo(42);
    s.foo = 42; // fine

    long x = 42;
    s.foo = x; // *wrong* error: "no property 'foo' for type 'S'"
}
