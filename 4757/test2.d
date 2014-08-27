static struct Bar(T)
{
    void spam()
    {
        foo(1);
    }
}
auto foo(T)(T)
{
    return Bar!T();
}
void main()
{
    foo(1);
}
