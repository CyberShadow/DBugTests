auto foo(T)(T)
{
    static struct Bar(T)
    {
        void spam()
        {
            foo(1);
        }
    }
    return Bar!T();
}

void main()
{
    foo(1);
}
