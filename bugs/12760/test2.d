struct S(T)
{
    T i;
    this(T j) inout //<-- HERE
    { }   
}

struct K
{
    S!int nullable;

    this(int)
    {
        nullable = 0;
        //Or nullable = S!int(0);
    }
}
