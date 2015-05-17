import std.math;

void fun(double p1, double p2, double p3, bool recursive = false)
{
    assert(p3.isNaN);
    if (recursive)
    	return;
    fun(p1, p2, p3, true);
}

int main()
{
    fun(double.nan, double.nan, double.nan, );
    return 0;
}
