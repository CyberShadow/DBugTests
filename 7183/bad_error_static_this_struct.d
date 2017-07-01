
// Bad error when using 'struct'
struct BadError
{
    double x;

    static int comparex(double x)
    {
        // bad_error_static_this_struct.d(13): Error: need 'this' to access member x
        return (this.x <= x);
    }
}


/*
// Much more useful error when using 'class'
class OKError
{
    double x;

    static int comparex(double x)
    {
        // bad_error_static_this_struct.d(25): Error: 'this' is only defined in non-static member functions, not comparex
        return (this.x <= x);
    }
}
*/


void main()
{
    BadError bad;
    //OKError ok;
}

