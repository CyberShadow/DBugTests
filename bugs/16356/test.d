import std.stdio;

/*
0+1i
1+1i
2+1i
3+1i
*/
void main()
{
	cdouble c = 1 + 1i;
	foreach(x; 0 .. 4)
	{
		import std.conv;
		auto r = text(c * x);
		if (x == 3)
			assert(r == "3+3i");
		writeln(c * x);
	}
}
