
struct S {}

int fun()
{
	import std.algorithm : move;
	S a, b;
	move(a, b);
	return 1;
}

enum x = fun();
