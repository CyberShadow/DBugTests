template One(T)
{
    alias _One!T.foo One;
}

template _One(T)
{
    void foo(int i)    {}
    void foo(long l) {}
}

void main()
{
    long i = 5;
    One!float(555555555555555555L);
}
