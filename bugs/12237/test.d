auto func(T)(T)
{
    static if (is(T == int))
        return func("");
    else
        return 10;
}

void main()
{
    assert(func(1) == 10);

    assert((a) {
        static if (is(typeof(a) == int))
        {
            int x;
            return __traits(parent, x)("");  // line 17
        }
        else
            return 10;
    } (1) == 10);
}
