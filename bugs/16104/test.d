struct A1
{
    this(int) immutable {}
    ~this();
}

struct A2
{
    this(int) immutable {}
}

struct B
{
    union
    {
        A1 a1;
        A2 a2;
    }
    bool itsA2;
    this(int x) immutable
    {
        if (x < 0)
        {
            a1 = immutable(A1)(x);
        }
        else
        {
            a2 = immutable(A2)(x);
            itsA2 = true;
        }
    }
}
