import std.stdio;

void main()
{
    void inner(double x)
    {
        if(x == 999) // to show that x itself isn't corrupt
        {
            writefln("x=%s a=%s b=%s c=%s d=%s e=%s f=%s g=%s h=%s", x, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0);
            //outer(x, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0);
        }
    }

    inner(999.0);
}
