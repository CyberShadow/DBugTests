void fun(alias a)()
{
    a = 42;
}

struct S
{
    int x;
}

void main()
{
    S s;
    fun!(s.x)();
}
