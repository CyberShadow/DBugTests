import std.random;

auto test(int n)
{
    if (n >= 0 && n < 33)
    {
        return int(0);
    }
    else if (n >= 33 && n < 66)
    {
        return float(0);
    }
    else
    {
        return real(0);
    }
}

void main()
{
    auto n = uniform(0, 100);
    auto res = test(n);
    //typeof(res) should be inferred as real
    static assert(is(typeof(res) == real));
}
