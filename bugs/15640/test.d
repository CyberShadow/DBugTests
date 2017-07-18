void test(T)(T[] args...) {
	import std.stdio;
	writeln(T.stringof);
}

class A     { }
class B : A { }
class C : A { }

void main()
{
	test(1,2,3);    // int
	test(4,5,6.9);  // double
	test(new B(), new C());
}
