void outer(
	double x,
	double a, double b, double c, double d,
	double e, double f, double g, double h)
{
	import std.stdio;
	writefln("x=%s a=%s b=%s c=%s d=%s e=%s f=%s g=%s h=%s",
		x, a, b, c, d, e, f, g, h);
}

void main()
{
	void inner(double x)
	{
		outer(x, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0);
	}

	inner(999.0);
}
