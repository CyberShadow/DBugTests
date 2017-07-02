import std.typecons : tuple;

enum foo = tuple(1, 2).expand; // Compiles up to 2.071.2 and with PR #6517
pragma(msg, typeof(foo).stringof);
pragma(msg, foo.stringof);

void bar()
{
	auto roo = tuple(1, 2).expand; // OK
	pragma(msg, typeof(roo).stringof);
	pragma(msg, roo.stringof);
}

void baz()
{
	enum zoo = tuple(1, 2).expand; // Error: value of __tup1847 is not known at compile time
	pragma(msg, typeof(zoo).stringof);
	pragma(msg, zoo.stringof);
}
