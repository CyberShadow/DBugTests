static template S1(alias a)
{
    void foo()
    {
        a = 42;
    }
}

struct Test
{
    int i, j;
    alias S1!i s;
}
