extern(C++) interface I
{
	void foo();
}

extern(C++) class C : I
{
	override void foo() {}
}

void main()
{
	import std.stdio;
	writeln(typeid(new C)); // segfault
}
