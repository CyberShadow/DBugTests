static template S1(alias a)
{
    static template S2(alias b)
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
    alias S1!i.S2!j s;
}
