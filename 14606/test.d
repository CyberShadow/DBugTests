struct S
{
    this(long stdTime)
    {
        _stdTime = stdTime;
    }

    long _stdTime;
}

S getS()
{
    S sysTime = S(0);
    return sysTime;
}

struct T
{
    this(string)
    {
        uint[3] arr;
        s = getS();
    }

    S s;
}

void main()
{
    T(null);
}
