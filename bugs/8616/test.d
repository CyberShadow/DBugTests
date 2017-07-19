struct S
{
	void func(int i) {}
}

void foo(S* s, int i) { }
void bar(S s, int i) { }

S* s;

void main()
{
	s.foo(5); //compiles
	s.bar(7); //doesn't compile
	(*s).bar(8); //compiles
}
