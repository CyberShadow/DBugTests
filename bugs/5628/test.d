void main()
{
    import std.math;

    immutable real x = 46;
    immutable float xf = x;
    immutable double xd = x;

    immutable short neg2 = -2;
    immutable long neg8 = -8;

    assert(pow(xd, neg2) == 1 / (x * x));
    assert(pow(xf, neg8) == 1 / ((x * x) * (x * x) * (x * x) * (x * x)));
}
