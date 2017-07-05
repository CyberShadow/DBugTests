import std.stdio;

struct Pos
{
	size_t line;
}

void foo(size_t line=__LINE__, Pos pos=Pos(line))()
{
	writeln(line, pos);
}

void main()
{
	foo();
}
