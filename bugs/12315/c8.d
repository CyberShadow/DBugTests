import std.array;

struct Foo1 {
    int i;
}
struct Foo2 {
    immutable int i;
}

T[] fun(T)()
{
	auto a = appender!(T[]);
	return a.data;
}

enum foo1 = fun!Foo1();
enum foo2 = fun!Foo2();
