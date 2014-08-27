class A     { int i; }
class B : A { int j; }

template copy(alias a, alias b)
{
	void copy() { a = b; }
}

class C : B
{
	alias copyIJ = copy!(i, j);
}
