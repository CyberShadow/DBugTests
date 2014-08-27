struct S1(alias a)
{
    struct S2(alias b)
    {
        void foo()
        {
            a = b;
        }
    }
}

struct Test
{
    int i, j;
    S1!i.S2!j s;
}
