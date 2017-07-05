alias ref int RefInt;

void foo(RefInt x)
{
	x = 42;
}

void main()
{
	int x;
	foo(x);
	
	import std.stdio : writeln;
	writeln(x);
}
